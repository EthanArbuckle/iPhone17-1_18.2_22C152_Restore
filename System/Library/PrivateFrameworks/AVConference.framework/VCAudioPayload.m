@interface VCAudioPayload
- (BOOL)createEncoderWithInputFormat:(const tagVCAudioFrameFormat *)a3;
- (BOOL)getMagicCookie:(char *)a3 withLength:(unsigned int *)a4;
- (BOOL)isDTXEmptyPacket:(unsigned int)a3;
- (BOOL)isSIDFrame:(const char *)a3 encodedBytes:(int)a4;
- (BOOL)setBandwidth:(int)a3;
- (BOOL)setBitrate:(unsigned int)a3;
- (BOOL)setCodecModeRequest:(_VCAudioCodecModeChangeEvent *)a3;
- (BOOL)setEVSRFParams:(EVSRFParams *)a3;
- (BOOL)shortREDEnabled;
- (VCAudioPayload)initWithConfig:(id)a3;
- (VCAudioPayloadConfig)config;
- (id)description;
- (int)bandwidth;
- (int)encodeAudio:(opaqueVCAudioBufferList *)a3 numInputSamples:(int)a4 outputBytes:(void *)a5 numOutputBytes:(int)a6 shortREDBytes:(unsigned int *)a7;
- (unsigned)bitrate;
- (unsigned)shortREDBitrate;
- (void)dealloc;
- (void)resetEncoder;
- (void)resetEncoderWithSampleBuffer:(char *)a3 numBytes:(int)a4;
- (void)setCurrentDTXEnable:(BOOL)a3;
- (void)setRamStadSRCEnabled:(BOOL)a3;
- (void)setShortREDEnabled:(BOOL)a3;
@end

@implementation VCAudioPayload

- (BOOL)isDTXEmptyPacket:(unsigned int)a3
{
  return ((VCPayloadUtils_supportsInternalDTXForPayload([(VCAudioPayloadConfig *)self->_config payload]) & 1) != 0
       || [(VCAudioPayloadConfig *)self->_config payload] == 13)
      && [(VCAudioPayloadConfig *)self->_config internalBundleFactor] + 1 >= a3;
}

- (VCAudioPayload)initWithConfig:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)VCAudioPayload;
    v5 = [(VCAudioPayload *)&v7 init];
    if (v5)
    {
      v5->_config = (VCAudioPayloadConfig *)a3;
      v5->_bitrate = [a3 bitrate];
      v5->_bandwidth = VCPayloadUtils_DefaultAudioCodecBandwidthCodecForSampleRate([a3 codecSampleRate]);
      v5->_ramStadSRCEnabled = 0;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioPayload initWithConfig:]();
      }
    }

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  SoundDec_Destroy((uint64_t)self->_encoder);

  v3.receiver = self;
  v3.super_class = (Class)VCAudioPayload;
  [(VCAudioPayload *)&v3 dealloc];
}

- (BOOL)createEncoderWithInputFormat:(const tagVCAudioFrameFormat *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_encoder = (uint64_t *)&self->_encoder;
  if (self->_encoder) {
    return 1;
  }
  *(void *)v23 = -1;
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v23[8] = v7;
  *(_OWORD *)&v23[24] = v7;
  uint64_t v8 = [(VCAudioPayloadConfig *)self->_config payload];
  LODWORD(v9) = a3->samplesPerFrame;
  int v10 = +[VCPayloadUtils codecSamplesPerFrameForPayload:v8 blockSize:a3->format.mSampleRate sampleRate:(double)v9 / a3->format.mSampleRate];
  +[VCPayloadUtils blockSizeForPayload:[(VCAudioPayloadConfig *)self->_config payload] sampleRate:[(VCAudioPayloadConfig *)self->_config codecSampleRate]];
  float v12 = v11;
  SoundDec_FormatASBD([(VCAudioPayloadConfig *)self->_config format], (uint64_t)v23, v10, a3->format.mChannelsPerFrame, [(VCAudioPayloadConfig *)self->_config flags], v12);
  *(_OWORD *)v21 = xmmword_1E25A2468;
  memset(&v21[16], 170, 32);
  long long v13 = *(_OWORD *)&a3->format.mBytesPerPacket;
  v20[0] = *(_OWORD *)&a3->format.mSampleRate;
  v20[1] = v13;
  *(_OWORD *)&v21[8] = *(_OWORD *)v23;
  *(void *)v21 = *(void *)&a3->format.mBitsPerChannel;
  *(_OWORD *)&v21[24] = *(_OWORD *)&v23[16];
  *(void *)&v21[40] = *(void *)&v23[32];
  unint64_t v22 = 0xAAAAAAAAAAAAAA00;
  BYTE1(v22) = self->_ramStadSRCEnabled;
  if ((SoundDec_Create(p_encoder, (uint64_t)v20) & 0x80000000) == 0)
  {
    SoundDec_SetEnablePacketSizeLimitForVBR((uint64_t)self->_encoder, +[VCPayloadUtils shouldEnablePacketSizeLimitForAudioFormat:v20]);
    if (+[VCPayloadUtils canSetBitrateForPayload:[(VCAudioPayloadConfig *)self->_config payload]])
    {
      if (+[VCPayloadUtils isEVSPayload:[(VCAudioPayloadConfig *)self->_config payload]])
      {
        encoder = self->_encoder;
        unsigned int bitrate = self->_bitrate;
        int v16 = 0;
      }
      else
      {
        if (!+[VCPayloadUtils isOpus4Channel48KhzPayload:outFormat:](VCPayloadUtils, "isOpus4Channel48KhzPayload:outFormat:", [(VCAudioPayloadConfig *)self->_config payload], v23)&& !+[VCPayloadUtils isFormatAACELDNonSBR48KHzStereo:v23])
        {
          SoundDec_SetBitrate((uint64_t)self->_encoder, self->_bitrate);
          goto LABEL_15;
        }
        encoder = self->_encoder;
        unsigned int bitrate = self->_bitrate;
        int v16 = 1;
      }
      SoundDec_SetCodecInitialBitrate((uint64_t)encoder, bitrate, v16);
    }
LABEL_15:
    SoundDec_SetDTX((uint64_t)self->_encoder, [(VCAudioPayloadConfig *)self->_config isDTXEnabled]);
    SoundDec_EnableShortRED((uint64_t)self->_encoder, self->_shortREDEnabled, self->_shortREDBytesPerFrame, self->_shortREDBitrate);
    if (+[VCPayloadUtils isEVSPayload:[(VCAudioPayloadConfig *)self->_config payload]])
    {
      SoundDec_SetEVSSIDPeriod((uint64_t)self->_encoder, [(VCAudioPayloadConfig *)self->_config evsSIDPeriod]);
      SoundDec_SetEVSCodecCMRMode((uint64_t)self->_encoder, [(VCAudioPayloadConfig *)self->_config evsCMRMode]);
      unsigned int v17 = [(VCAudioPayloadConfig *)self->_config evsChannelAwareOffset];
      if (v17 <= 7 && ((1 << v17) & 0xAC) != 0)
      {
        v19[0] = [(VCAudioPayloadConfig *)self->_config evsChannelAwareOffset];
        v19[1] = [(VCAudioPayloadConfig *)self->_config evsChannelAwareIndicator];
        SoundDec_SetEVSChannelAwareOffset((uint64_t)self->_encoder, v19);
      }
      SoundDec_SetEVSFormatHandling((uint64_t)self->_encoder, [(VCAudioPayloadConfig *)self->_config evsHeaderFullOnly]);
      uint64_t bandwidth = self->_bandwidth;
      if ([(NSArray *)[(VCAudioPayloadConfig *)self->_config supportedBandwidths] count]) {
        uint64_t bandwidth = objc_msgSend((id)-[NSArray valueForKeyPath:](-[VCAudioPayloadConfig supportedBandwidths](self->_config, "supportedBandwidths"), "valueForKeyPath:", @"@max.self"), "intValue");
      }
      if ((SoundDec_SetEVSAudioCodecBandwidth(*p_encoder, +[VCPayloadUtils audioCodecBandwidthForVCAudioCodecBandwidth:bandwidth]) & 0x80000000) == 0)self->_uint64_t bandwidth = bandwidth; {
    }
      }
    SoundDec_SetAMRPayloadFormat((uint64_t)self->_encoder, [(VCAudioPayloadConfig *)self->_config payloadOctetAligned]);
    if ([(VCAudioPayloadConfig *)self->_config isOpusInBandFecEnabled])
    {
      SoundDec_SetOpusInBandFecEnabled((uint64_t)self->_encoder, [(VCAudioPayloadConfig *)self->_config isOpusInBandFecEnabled]);
      SoundDec_SetPacketLossPercentage((uint64_t)self->_encoder, 5);
    }
    return 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAudioPayload createEncoderWithInputFormat:]();
    }
  }
  return 0;
}

- (int)encodeAudio:(opaqueVCAudioBufferList *)a3 numInputSamples:(int)a4 outputBytes:(void *)a5 numOutputBytes:(int)a6 shortREDBytes:(unsigned int *)a7
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  int v34 = a6;
  v33.mStartOffset = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v33.mVariableFramesInPacket = 2863311530;
  uint64_t AudioBufferList = VCAudioBufferList_GetAudioBufferList((uint64_t)a3);
  SoundDec_Encode((uint64_t)self->_encoder, AudioBufferList, a4, a5, a6, (UInt32 *)&v34, &v33, self->_shouldReset);
  if (v13 < 0)
  {
    int v20 = v13;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v54 = 0u;
    memset(buf, 0, sizeof(buf));
    int v21 = [(VCAudioPayloadConfig *)self->_config payload];
    if (v21 == 99) {
      int v22 = 8;
    }
    else {
      int v22 = 7;
    }
    VCAudioPayloadConfig_GetDescription((size_t)self->_config, (char *)buf, &v32);
    if (v22 > (int)VRTraceGetErrorLogLevelForModule()) {
      return 0;
    }
    uint64_t v23 = VRTraceErrorLogLevelToCSTR();
    if (v21 == 99)
    {
      uint64_t v24 = *MEMORY[0x1E4F47A50];
      v25 = *MEMORY[0x1E4F47A50];
      if (!*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          BOOL shouldReset = self->_shouldReset;
          *(_DWORD *)v35 = 136317186;
          uint64_t v36 = v23;
          __int16 v37 = 2080;
          v38 = "-[VCAudioPayload encodeAudio:numInputSamples:outputBytes:numOutputBytes:shortREDBytes:]";
          __int16 v39 = 1024;
          int v40 = 152;
          __int16 v41 = 2080;
          v42 = "-[VCAudioPayload encodeAudio:numInputSamples:outputBytes:numOutputBytes:shortREDBytes:]";
          __int16 v43 = 1024;
          int v44 = v20;
          __int16 v45 = 1024;
          BOOL v46 = shouldReset;
          __int16 v47 = 1024;
          int v48 = a4;
          __int16 v49 = 1024;
          UInt32 v50 = v34;
          __int16 v51 = 2080;
          v52 = buf;
          _os_log_debug_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %s: SoundDec_Encode failed result=%x. reset=%d inSamples=%d outBytes=%d payloadDescription=%s", v35, 0x48u);
        }
        return 0;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
    }
    else
    {
      uint64_t v24 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
LABEL_28:
        BOOL v30 = self->_shouldReset;
        *(_DWORD *)v35 = 136317186;
        uint64_t v36 = v23;
        __int16 v37 = 2080;
        v38 = "-[VCAudioPayload encodeAudio:numInputSamples:outputBytes:numOutputBytes:shortREDBytes:]";
        __int16 v39 = 1024;
        int v40 = 152;
        __int16 v41 = 2080;
        v42 = "-[VCAudioPayload encodeAudio:numInputSamples:outputBytes:numOutputBytes:shortREDBytes:]";
        __int16 v43 = 1024;
        int v44 = v20;
        __int16 v45 = 1024;
        BOOL v46 = v30;
        __int16 v47 = 1024;
        int v48 = a4;
        __int16 v49 = 1024;
        UInt32 v50 = v34;
        __int16 v51 = 2080;
        v52 = buf;
        _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: SoundDec_Encode failed result=%x. reset=%d inSamples=%d outBytes=%d payloadDescription=%s", v35, 0x48u);
      }
    }
    return 0;
  }
  self->_BOOL shouldReset = 0;
  if (v33.mDataByteSize) {
    BOOL v14 = v34 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14) {
    uint64_t mDataByteSize = v34;
  }
  else {
    uint64_t mDataByteSize = v33.mDataByteSize;
  }
  BOOL v16 = [(VCAudioPayload *)self isDTXEmptyPacket:mDataByteSize];
  v35[0] = 0;
  int IsShortREDEnabled = SoundDec_IsShortREDEnabled((uint64_t)self->_encoder, v35);
  if (v16 || IsShortREDEnabled < 0 || !v35[0]) {
    goto LABEL_13;
  }
  int ShortREDBytesPerFrame = SoundDec_GetShortREDBytesPerFrame((uint64_t)self->_encoder, a7);
  if (ShortREDBytesPerFrame < 0)
  {
    int v26 = ShortREDBytesPerFrame;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E4F47A50];
      int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      int v29 = [(VCAudioPayloadConfig *)self->_config payload];
      *(_DWORD *)buf = 136316418;
      *(void *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCAudioPayload encodeAudio:numInputSamples:outputBytes:numOutputBytes:shortREDBytes:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 176;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v29;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = v26;
      *(_WORD *)&buf[40] = 1024;
      *(_DWORD *)&buf[42] = mDataByteSize;
      _os_log_error_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_ERROR, " [%s] %s:%d Short RED is enabled for payload=%d, but SoundDec_GetShortREDBytesPerFrame returned result=%x and bytesActuallyEncoded=%d", buf, 0x2Eu);
    }
    return 0;
  }
  LODWORD(mDataByteSize) = mDataByteSize - *a7;
LABEL_13:
  if (v16) {
    return 0;
  }
  else {
    return mDataByteSize;
  }
}

- (void)resetEncoder
{
  self->_BOOL shouldReset = 1;
}

- (void)resetEncoderWithSampleBuffer:(char *)a3 numBytes:(int)a4
{
  if ([(VCAudioPayloadConfig *)self->_config payload] == 13)
  {
    SoundDec_Reset((uint64_t)self->_encoder);
    encoder = self->_encoder;
    SoundDec_SetDTXPrimerSamples((uint64_t)encoder, a3, a4);
  }
  else if ((VCPayloadUtils_supportsInternalDTXForPayload([(VCAudioPayloadConfig *)self->_config payload]) & 1) == 0)
  {
    self->_BOOL shouldReset = 1;
  }
}

- (BOOL)setBitrate:(unsigned int)a3
{
  BOOL v5 = +[VCPayloadUtils canSetBitrateForPayload:[(VCAudioPayloadConfig *)self->_config payload]];
  if (v5)
  {
    if ([(VCAudioPayloadConfig *)self->_config forcingBitrate]) {
      goto LABEL_8;
    }
    signed int v6 = [+[VCDefaults sharedInstance] forceAudioBitrate];
    if (v6 > 0) {
      a3 = v6;
    }
    encoder = self->_encoder;
    if (encoder && (SoundDec_SetBitrate((uint64_t)encoder, a3) & 0x80000000) != 0)
    {
LABEL_8:
      LOBYTE(v5) = 0;
    }
    else
    {
      self->_unsigned int bitrate = a3;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)setEVSRFParams:(EVSRFParams *)a3
{
  encoder = self->_encoder;
  return encoder && (SoundDec_SetEVSChannelAwareOffset((uint64_t)encoder, (int *)a3) & 0x80000000) == 0;
}

- (BOOL)setBandwidth:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int64_t v5 = +[VCPayloadUtils codecTypeForPayload:[(VCAudioPayloadConfig *)self->_config payload]];
  int v6 = +[VCPayloadUtils audioCodecBandwidthForVCAudioCodecBandwidth:v3];
  BOOL v7 = +[VCPayloadUtils supportsCodecBandwidthUpdateForCodecType:v5];
  if (v7)
  {
    if (self->_bandwidth == v3)
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      self->_uint64_t bandwidth = v3;
      LOBYTE(v7) = (int)SoundDec_SetEVSAudioCodecBandwidthUpdate((uint64_t)self->_encoder, v6) >= 0;
    }
  }
  return v7;
}

- (BOOL)setCodecModeRequest:(_VCAudioCodecModeChangeEvent *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int payload = a3->payload;
  if (payload != [(VCAudioPayloadConfig *)self->_config payload])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      int v10 = *MEMORY[0x1E4F47A50];
      BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v8) {
        return v8;
      }
      int v11 = a3->payload;
      int v12 = [(VCAudioPayloadConfig *)self->_config payload];
      int v14 = 136316162;
      uint64_t v15 = v9;
      __int16 v16 = 2080;
      unsigned int v17 = "-[VCAudioPayload setCodecModeRequest:]";
      __int16 v18 = 1024;
      int v19 = 237;
      __int16 v20 = 1024;
      int v21 = v11;
      __int16 v22 = 1024;
      int v23 = v12;
      _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d Payload=%d on codec mode change event does not match configuration with payload=%d", (uint8_t *)&v14, 0x28u);
    }
LABEL_8:
    LOBYTE(v8) = 0;
    return v8;
  }
  int64_t v6 = +[VCPayloadUtils codecTypeForPayload:[(VCAudioPayloadConfig *)self->_config payload]];
  if (a3->codecRateMode == -1) {
    goto LABEL_8;
  }
  int64_t v7 = v6;
  BOOL v8 = +[VCPayloadUtils supportsCodecRateModesForCodecType:v6];
  if (v8) {
    LOBYTE(v8) = (int)SoundDec_SetCMR((uint64_t)self->_encoder, +[VCPayloadUtils bitrateForCodecType:mode:](VCPayloadUtils, "bitrateForCodecType:mode:", v7, a3->codecRateMode), +[VCPayloadUtils audioCodecBandwidthForVCAudioCodecBandwidth:a3->codecBandwidth]) >= 0;
  }
  return v8;
}

- (void)setCurrentDTXEnable:(BOOL)a3
{
  encoder = self->_encoder;
  int v4 = a3 && [(VCAudioPayloadConfig *)self->_config isDTXEnabled];

  SoundDec_SetDTX((uint64_t)encoder, v4);
}

- (BOOL)getMagicCookie:(char *)a3 withLength:(unsigned int *)a4
{
  return (int)SoundDec_GetMagicCookie((uint64_t)self->_encoder, a3, a4) >= 0;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCAudioPayload;
  return (id)[NSString stringWithFormat:@"{ %@ config=%@ currentBitrate=%u }", -[VCAudioPayload description](&v3, sel_description), self->_config, self->_bitrate];
}

- (void)setRamStadSRCEnabled:(BOOL)a3
{
  self->_ramStadSRCEnabled = a3;
}

- (void)setShortREDEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [(VCAudioPayloadConfig *)self->_config payload];
  if (VCPayloadUtils_SupportsShortREDForPayload())
  {
    unsigned int v5 = VCPayloadUtils_ShortREDBitrateForPayload([(VCAudioPayloadConfig *)self->_config payload], v3);
    self->_unsigned int shortREDBitrate = v5;
    if (v3)
    {
      +[VCPayloadUtils blockSizeForPayload:[(VCAudioPayloadConfig *)self->_config payload] sampleRate:[(VCAudioPayloadConfig *)self->_config codecSampleRate]];
      unsigned int shortREDBitrate = self->_shortREDBitrate;
      *(float *)&double v7 = v7;
      unsigned int v8 = (float)((float)(*(float *)&v7 * (float)shortREDBitrate) * 0.125);
    }
    else
    {
      unsigned int shortREDBitrate = v5;
      unsigned int v8 = 0;
    }
    encoder = self->_encoder;
    if (encoder && (int v10 = SoundDec_EnableShortRED((uint64_t)encoder, v3, v8, shortREDBitrate), v10 < 0))
    {
      int v11 = v10;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        int v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v14 = [(VCAudioPayloadConfig *)self->_config payload];
          int v15 = 136316162;
          uint64_t v16 = v12;
          __int16 v17 = 2080;
          __int16 v18 = "-[VCAudioPayload setShortREDEnabled:]";
          __int16 v19 = 1024;
          int v20 = 287;
          __int16 v21 = 1024;
          int v22 = v14;
          __int16 v23 = 1024;
          int v24 = v11;
          _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to enable short RED for payload=%d. result=%x", (uint8_t *)&v15, 0x28u);
        }
      }
    }
    else
    {
      self->_shortREDBytesPerFrame = v8;
      self->_shortREDEnabled = v3;
    }
  }
}

- (BOOL)isSIDFrame:(const char *)a3 encodedBytes:(int)a4
{
  uint64_t v4 = self;
  LOBYTE(self) = 0;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    if ([(VCAudioPayloadConfig *)v4->_config payload] == 97
      || [(VCAudioPayloadConfig *)v4->_config payload] == 98)
    {
      LOBYTE(self) = a4 < 9;
      return (char)self;
    }
    *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v24[16] = v7;
    v24[17] = v7;
    v24[14] = v7;
    v24[15] = v7;
    unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
    v24[13] = v7;
    v24[12] = v7;
    v24[11] = v7;
    v24[10] = v7;
    v24[9] = v7;
    v24[8] = v7;
    v24[7] = v7;
    v24[6] = v7;
    v24[5] = v7;
    v24[4] = v7;
    v24[3] = v7;
    v24[2] = v7;
    v24[0] = v7;
    v24[1] = v7;
    long long v22 = v7;
    long long v23 = v7;
    outPropertyData = a3;
    LODWORD(v22) = a4;
    if ((SoundDec_GetSpeechCodecBundleData((uint64_t)v4->_encoder, (uint64_t *)&outPropertyData) & 0x80000000) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        LODWORD(self) = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!self) {
          return (char)self;
        }
        -[VCAudioPayload isSIDFrame:encodedBytes:]();
      }
    }
    else
    {
      if (DWORD2(v23))
      {
        LOBYTE(self) = *((unsigned char *)v24 + 20 * (DWORD2(v23) - 1)) & 1;
        return (char)self;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        LODWORD(self) = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!self) {
          return (char)self;
        }
        int v11 = 136316162;
        uint64_t v12 = v8;
        __int16 v13 = 2080;
        int v14 = "-[VCAudioPayload isSIDFrame:encodedBytes:]";
        __int16 v15 = 1024;
        int v16 = 313;
        __int16 v17 = 2048;
        __int16 v18 = a3;
        __int16 v19 = 1024;
        int v20 = a4;
        _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d No packets in the bundle data encodedOutput=%p encodedBytes=%u", (uint8_t *)&v11, 0x2Cu);
      }
    }
    LOBYTE(self) = 0;
  }
  return (char)self;
}

- (VCAudioPayloadConfig)config
{
  return self->_config;
}

- (unsigned)bitrate
{
  return self->_bitrate;
}

- (int)bandwidth
{
  return self->_bandwidth;
}

- (BOOL)shortREDEnabled
{
  return self->_shortREDEnabled;
}

- (unsigned)shortREDBitrate
{
  return self->_shortREDBitrate;
}

- (void)initWithConfig:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 44;
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, " [%s] %s:%d Configuration is nil!", v1, 0x1Cu);
}

- (void)createEncoderWithInputFormat:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 77;
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, " [%s] %s:%d SoundDec_Create failed!", v1, 0x1Cu);
}

- (void)isSIDFrame:encodedBytes:.cold.1()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  unsigned int v5 = "-[VCAudioPayload isSIDFrame:encodedBytes:]";
  __int16 v6 = 1024;
  int v7 = 316;
  __int16 v8 = 1024;
  int v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d unable to read bundle data hResult=%d", v3, 0x22u);
}

@end