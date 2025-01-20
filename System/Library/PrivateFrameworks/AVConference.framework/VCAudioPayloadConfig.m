@interface VCAudioPayloadConfig
- (BOOL)configure:(id)a3;
- (BOOL)evsHeaderFullOnly;
- (BOOL)forcingBitrate;
- (BOOL)isDTXEnabled;
- (BOOL)isOpusInBandFecEnabled;
- (BOOL)payloadOctetAligned;
- (NSArray)supportedBandwidths;
- (NSArray)supportedBitrates;
- (VCAudioPayloadConfig)initWithConfigDict:(id)a3;
- (float)qualityForBitRate:(unsigned int)a3;
- (id)className;
- (id)description;
- (int)evsCMRMode;
- (int)format;
- (int)payload;
- (unsigned)aacBitrate;
- (unsigned)bitrate;
- (unsigned)blockSize;
- (unsigned)bundleHeaderBytes;
- (unsigned)codecSampleRate;
- (unsigned)evsChannelAwareIndicator;
- (unsigned)evsChannelAwareOffset;
- (unsigned)evsSIDPeriod;
- (unsigned)flags;
- (unsigned)inputSampleRate;
- (unsigned)internalBundleFactor;
- (unsigned)samplesPerFrame;
- (void)createSupportedBitrates;
- (void)createSupportedBitratesForAACELD;
- (void)createSupportedBitratesForAACELD48;
- (void)createSupportedBitratesForAMR16k;
- (void)createSupportedBitratesForAMR8k;
- (void)createSupportedBitratesForEVS;
- (void)createSupportedBitratesForOpus;
- (void)dealloc;
- (void)setEvsCMRMode:(int)a3;
- (void)setUseSBR:(BOOL)a3;
- (void)setupEncodeProperties:(id)a3;
- (void)updateDescription;
@end

@implementation VCAudioPayloadConfig

- (BOOL)configure:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v5 = (void *)[a3 objectForKeyedSubscript:@"vcAudioPayloadConfigKeyPayloadType"];
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v11) {
        return v11;
      }
      -[VCAudioPayloadConfig configure:](v9, v10);
    }
    goto LABEL_54;
  }
  self->_int payload = [v5 intValue];
  p_int payload = (unsigned int *)&self->_payload;
  v7 = (void *)[a3 objectForKeyedSubscript:@"vcPayloadConfigKeySampleRate"];
  if (v7) {
    unsigned int v8 = [v7 intValue];
  }
  else {
    unsigned int v8 = +[VCPayloadUtils sampleRateForPayload:*p_payload];
  }
  self->_unsigned int codecSampleRate = v8;
  if (!v8 && *p_payload != 117)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_54;
    }
    VRTraceErrorLogLevelToCSTR();
    BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (v11)
    {
      -[VCAudioPayloadConfig configure:].cold.4();
      goto LABEL_54;
    }
    return v11;
  }
  v12 = (void *)[a3 objectForKeyedSubscript:@"vcAudioPayloadConfigKeyInputSampleRate"];
  if (v12)
  {
    unsigned int v13 = [v12 intValue];
    self->_inputSampleRate = v13;
    if (v13) {
      goto LABEL_15;
    }
  }
  else if (self->_inputSampleRate)
  {
    goto LABEL_15;
  }
  unsigned int codecSampleRate = self->_codecSampleRate;
  if (codecSampleRate >= 0x5DC0) {
    unsigned int codecSampleRate = 24000;
  }
  self->_inputSampleRate = codecSampleRate;
LABEL_15:
  v15 = (void *)[a3 objectForKeyedSubscript:@"vcPayloadConfigKeyInternalBundleFactor"];
  if (v15) {
    unsigned int v16 = [v15 intValue];
  }
  else {
    unsigned int v16 = +[VCPayloadUtils internalBundleFactorForPayload:*p_payload];
  }
  self->_internalBundleFactor = v16;
  if (v16 - 4 <= 0xFFFFFFFC)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (v11)
      {
        -[VCAudioPayloadConfig configure:]();
        goto LABEL_54;
      }
      return v11;
    }
LABEL_54:
    LOBYTE(v11) = 0;
    return v11;
  }
  v17 = (void *)[a3 objectForKeyedSubscript:@"vcAudioPayloadConfigKeyBlockSize"];
  if (v17) {
    unsigned int v18 = [v17 intValue];
  }
  else {
    unsigned int v18 = +[VCPayloadUtils codecSamplesPerFrameForPayload:*p_payload blockSize:0.0199999996];
  }
  self->_blockSize = v18;
  if (v18)
  {
    unsigned int v21 = self->_internalBundleFactor * v18;
    LODWORD(v20) = self->_codecSampleRate;
    LODWORD(v19) = self->_inputSampleRate;
    self->_codecSamplesPerFrame = v21;
    self->_inputSamplesPerFrame = vcvtpd_u64_f64((double)v19 / (double)v20 * (double)v21);
    v22 = (void *)[a3 objectForKeyedSubscript:@"vcPayloadConfigKeyOctetAligned"];
    if (v22) {
      char v23 = [v22 BOOLValue];
    }
    else {
      char v23 = 1;
    }
    self->_payloadOctetAligned = v23;
    v24 = (void *)[a3 objectForKeyedSubscript:@"vcPayloadConfigKeyDTXEnabled"];
    if (v24) {
      LOBYTE(v24) = [v24 BOOLValue];
    }
    self->_isDTXEnabled = (char)v24;
    v25 = (void *)[a3 objectForKeyedSubscript:@"vcPayloadConfigKeyEVSSIDPeriod"];
    if (v25) {
      unsigned int v26 = [v25 intValue];
    }
    else {
      unsigned int v26 = 8;
    }
    self->_evsSIDPeriod = v26;
    v27 = (void *)[a3 objectForKeyedSubscript:@"vcPayloadConfigKeyEVSChannelAwareOffset"];
    if (v27) {
      LOWORD(v27) = [v27 intValue];
    }
    self->_evsChannelAwareOffset = (unsigned __int16)v27;
    self->_evsChannelAwareIndicator = 1;
    v28 = (void *)[a3 objectForKeyedSubscript:@"vcPayloadConfigKeyEVSHeaderFullOnly"];
    if (v28) {
      LOBYTE(v28) = [v28 BOOLValue];
    }
    self->_evsHeaderFullOnly = (char)v28;
    v29 = (void *)[a3 objectForKeyedSubscript:@"vcPayloadConfigKeyEVSCMRMode"];
    if (v29) {
      LODWORD(v29) = [v29 integerValue];
    }
    self->_evsCMRMode = (int)v29;
    v30 = (void *)[a3 objectForKeyedSubscript:@"vcAudioPayloadConfigKeyOPUSInBandFecEnabled"];
    if (v30)
    {
      int v31 = [v30 BOOLValue];
      self->_BOOL isOpusInBandFecEnabled = v31;
      if (v31 && *p_payload != 119)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_54;
        }
        uint64_t v32 = VRTraceErrorLogLevelToCSTR();
        v33 = *MEMORY[0x1E4F47A50];
        BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (v11)
        {
          int payload = self->_payload;
          BOOL isOpusInBandFecEnabled = self->_isOpusInBandFecEnabled;
          int v41 = 136316162;
          uint64_t v42 = v32;
          __int16 v43 = 2080;
          v44 = "-[VCAudioPayloadConfig configure:]";
          __int16 v45 = 1024;
          int v46 = 167;
          __int16 v47 = 1024;
          *(_DWORD *)v48 = payload;
          *(_WORD *)&v48[4] = 1024;
          *(_DWORD *)&v48[6] = isOpusInBandFecEnabled;
          _os_log_error_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_ERROR, " [%s] %s:%d payload:%d Invalid payload configuration, isOpusInBandFecEnabled:%d", (uint8_t *)&v41, 0x28u);
          goto LABEL_54;
        }
        return v11;
      }
    }
    else
    {
      self->_BOOL isOpusInBandFecEnabled = 0;
    }
    [(VCAudioPayloadConfig *)self setupEncodeProperties:a3];
    if (HIWORD(self->_format) << 16 == 0x100000)
    {
      v36 = (void *)[a3 objectForKeyedSubscript:@"vcPayloadConfigKeyUseSBR"];
      if (v36) {
        -[VCAudioPayloadConfig setUseSBR:](self, "setUseSBR:", [v36 BOOLValue]);
      }
      else {
        self->_useSBR = 0;
      }
    }
    v37 = (void *)[a3 objectForKeyedSubscript:@"vcAudioPayloadConfigKeyPayloadTypeOverride"];
    if (v37) {
      unsigned int *p_payload = [v37 intValue];
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v38 = VRTraceErrorLogLevelToCSTR();
      v39 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v41 = 136316162;
        uint64_t v42 = v38;
        __int16 v43 = 2080;
        v44 = "-[VCAudioPayloadConfig configure:]";
        __int16 v45 = 1024;
        int v46 = 189;
        __int16 v47 = 2080;
        *(void *)v48 = "-[VCAudioPayloadConfig configure:]";
        *(_WORD *)&v48[8] = 2080;
        uint64_t v49 = objc_msgSend(-[VCAudioPayloadConfig description](self, "description"), "UTF8String");
        _os_log_impl(&dword_1E1EA4000, v39, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", (uint8_t *)&v41, 0x30u);
      }
    }
    LOBYTE(v11) = 1;
    return v11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
    goto LABEL_54;
  }
  VRTraceErrorLogLevelToCSTR();
  BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
  if (v11)
  {
    -[VCAudioPayloadConfig configure:]();
    goto LABEL_54;
  }
  return v11;
}

- (void)setUseSBR:(BOOL)a3
{
  if (a3)
  {
    v4 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:self->_supportedBitrates];
    [(NSArray *)v4 addObject:&unk_1F3DC6768];
    [(NSArray *)v4 addObject:&unk_1F3DC6780];

    self->_supportedBitrates = v4;
    self->_useSBR = 1;
  }
}

- (unsigned)aacBitrate
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = 32000;
  unsigned int valuePtr = 32000;
  CFNumberRef v4 = (const __CFNumber *)CFPreferencesCopyAppValue(@"forceAACELDBitrate", @"com.apple.VideoConference");
  if (v4)
  {
    CFNumberRef v5 = v4;
    if (CFNumberGetValue(v4, kCFNumberIntType, &valuePtr))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v11 = v6;
          __int16 v12 = 2080;
          unsigned int v13 = "-[VCAudioPayloadConfig aacBitrate]";
          __int16 v14 = 1024;
          int v15 = 212;
          __int16 v16 = 1024;
          unsigned int v17 = valuePtr;
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d forceAACELDBitRate to %d", buf, 0x22u);
        }
      }
      self->_forcingBitrate = 1;
    }
    CFRelease(v5);
    return valuePtr;
  }
  return v3;
}

- (void)createSupportedBitrates
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = [NSNumber numberWithUnsignedInt:self->_bitrate];
  self->_supportedBitrates = (NSArray *)(id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

- (void)createSupportedBitratesForAACELD
{
  self->_supportedBitrates = (NSArray *)&unk_1F3DC8928;
}

- (void)createSupportedBitratesForAACELD48
{
  self->_supportedBitrates = (NSArray *)&unk_1F3DC8940;
}

- (void)createSupportedBitratesForOpus
{
  self->_supportedBitrates = (NSArray *)&unk_1F3DC8958;
}

- (void)createSupportedBitratesForAMR8k
{
  self->_supportedBitrates = (NSArray *)&unk_1F3DC8970;
}

- (void)createSupportedBitratesForAMR16k
{
  self->_supportedBitrates = (NSArray *)&unk_1F3DC8988;
}

- (void)createSupportedBitratesForEVS
{
  self->_supportedBitrates = (NSArray *)&unk_1F3DC89A0;
}

- (void)setupEncodeProperties:(id)a3
{
  int payload = self->_payload;
  if (payload <= 12)
  {
    if (payload)
    {
      if (payload != 8)
      {
        if (payload != 9) {
          return;
        }
        self->_format = 999040;
        unsigned int v9 = 480 * (self->_codecSampleRate / self->_codecSamplesPerFrame);
        goto LABEL_48;
      }
      int v10 = 335680;
    }
    else
    {
      int v10 = 270144;
    }
    self->_format = v10;
    unsigned int v9 = 8 * self->_codecSampleRate;
LABEL_48:
    self->_bitrate = v9;
    [(VCAudioPayloadConfig *)self createSupportedBitrates];
    return;
  }
  int v5 = payload - 97;
  int v7 = 5274880;
  switch(v5)
  {
    case 0:
      self->_format = 4202304;
      if ([a3 objectForKeyedSubscript:@"vcPayloadConfigKeyPreferredBitrate"]) {
        unsigned int v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcPayloadConfigKeyPreferredBitrate"), "unsignedIntValue");
      }
      else {
        unsigned int v8 = 12200;
      }
      self->_bitrate = v8;
      unint64_t v19 = (NSArray *)(id)[a3 objectForKeyedSubscript:@"vcPayloadConfigKeyCodecBitrates"];
      self->_supportedBitrates = v19;
      if (!v19)
      {
        [(VCAudioPayloadConfig *)self createSupportedBitratesForAMR8k];
      }
      return;
    case 1:
      self->_format = 4210304;
      if ([a3 objectForKeyedSubscript:@"vcPayloadConfigKeyPreferredBitrate"]) {
        unsigned int v11 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcPayloadConfigKeyPreferredBitrate"), "unsignedIntValue");
      }
      else {
        unsigned int v11 = 12650;
      }
      self->_bitrate = v11;
      unint64_t v20 = (NSArray *)(id)[a3 objectForKeyedSubscript:@"vcPayloadConfigKeyCodecBitrates"];
      self->_supportedBitrates = v20;
      if (!v20)
      {
        [(VCAudioPayloadConfig *)self createSupportedBitratesForAMR16k];
      }
      return;
    case 2:
      self->_format = 16785216;
      return;
    case 4:
      self->_format = 1096576;
      self->_bundleHeaderBytes = 1;
      self->_bitrate = [(VCAudioPayloadConfig *)self aacBitrate];
      [(VCAudioPayloadConfig *)self createSupportedBitratesForAACELD48];
      return;
    case 7:
      int v12 = 1072576;
      goto LABEL_21;
    case 8:
      int v12 = 1070626;
      goto LABEL_21;
    case 9:
      int v12 = 1064576;
LABEL_21:
      self->_format = v12;
      self->_bundleHeaderBytes = 1;
      self->_bitrate = [(VCAudioPayloadConfig *)self aacBitrate];
      [(VCAudioPayloadConfig *)self createSupportedBitratesForAACELD];
      return;
    case 10:
      unsigned __int16 v13 = 16000;
      goto LABEL_26;
    case 11:
      goto LABEL_27;
    case 14:
      unsigned __int16 v13 = 8000;
LABEL_26:
      int v7 = v13 | 0x500000;
LABEL_27:
      self->_format = v7;
      self->_bundleHeaderBytes = 1;
      if ([a3 objectForKeyedSubscript:@"vcPayloadConfigKeyPreferredBitrate"]) {
        unsigned int v14 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcPayloadConfigKeyPreferredBitrate"), "unsignedIntValue");
      }
      else {
        unsigned int v14 = 13200;
      }
      self->_bitrate = v14;
      self->_supportedBitrates = (NSArray *)(id)[a3 objectForKeyedSubscript:@"vcPayloadConfigKeyCodecBitrates"];
      self->_supportedBandwidths = (NSArray *)(id)[a3 objectForKeyedSubscript:@"vcAudioPayloadConfigKeySupportedBandwidths"];
      if (!self->_supportedBitrates)
      {
        [(VCAudioPayloadConfig *)self createSupportedBitratesForEVS];
      }
      return;
    case 15:
      int v15 = 1138112;
      goto LABEL_36;
    case 16:
      int v15 = 1203648;
LABEL_36:
      self->_format = v15;
      self->_bundleHeaderBytes = 1;
      break;
    case 22:
      unsigned int codecSampleRate = self->_codecSampleRate;
      if (codecSampleRate == 48000) {
        int v17 = 2145152;
      }
      else {
        int v17 = 2121152;
      }
      if (codecSampleRate == 16000) {
        int v18 = 2113152;
      }
      else {
        int v18 = v17;
      }
      self->_format = v18;
      self->_bundleHeaderBytes = 1;
      self->_bitrate = 24000;
      [(VCAudioPayloadConfig *)self createSupportedBitratesForOpus];
      break;
    case 24:
      self->_format = 671360;
      unsigned int v9 = 7750;
      goto LABEL_48;
    case 25:
      self->_format = 663360;
      unsigned int v9 = 3950;
      goto LABEL_48;
    default:
      return;
  }
}

- (VCAudioPayloadConfig)initWithConfigDict:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCAudioPayloadConfig;
  CFNumberRef v4 = [(VCAudioPayloadConfig *)&v7 init];
  int v5 = v4;
  if (v4)
  {
    if ([(VCAudioPayloadConfig *)v4 configure:a3])
    {
      [(VCAudioPayloadConfig *)v5 updateDescription];
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCAudioPayloadConfig;
  [(VCAudioPayloadConfig *)&v3 dealloc];
}

- (float)qualityForBitRate:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (+[VCPayloadUtils canSetBitrateForPayload:self->_payload])
  {
    if (!-[NSArray containsObject:](self->_supportedBitrates, "containsObject:", [NSNumber numberWithUnsignedInt:v3]))return 0.0; {
  }
    }
  else if (self->_bitrate != v3)
  {
    return 0.0;
  }
  uint64_t payload = self->_payload;

  +[VCPayloadUtils qualityForPayload:payload forBitrate:v3];
  return result;
}

- (unsigned)flags
{
  int v2 = HIWORD(self->_format) << 16;
  if (v2 >= 1179648)
  {
    if (v2 >= 0x400000)
    {
      if (v2 != 5242880 && v2 != 0x400000) {
        return 0;
      }
    }
    else if (v2 != 1179648 && v2 != 0x200000)
    {
      return 0;
    }
    return self->_internalBundleFactor;
  }
  if (v2 == 655360) {
    return 3;
  }
  if (v2 != 0x100000)
  {
    if (v2 != 1114112) {
      return 0;
    }
    return self->_internalBundleFactor;
  }
  return self->_useSBR;
}

- (void)updateDescription
{
  self->_description = (NSString *)[[NSString alloc] initWithFormat:@"%@ payload=%d blockSize=%d codecSampleRate=%d codecSamplesPerFrame=%d inputSampleRate=%d inputSamplesPerFrame=%d isDTXEnabled=%d octedAligned=%d useSBR=%d, internalBundleFactor=%d initialBitrate=%d", -[VCAudioPayloadConfig className](self, "className"), self->_payload, self->_blockSize, self->_codecSampleRate, self->_codecSamplesPerFrame, self->_inputSampleRate, self->_inputSamplesPerFrame, self->_isDTXEnabled, self->_payloadOctetAligned, self->_useSBR, self->_internalBundleFactor, self->_bitrate];
}

- (id)className
{
  int v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)description
{
  int v2 = self->_description;

  return v2;
}

- (int)payload
{
  return self->_payload;
}

- (unsigned)blockSize
{
  return self->_blockSize;
}

- (unsigned)codecSampleRate
{
  return self->_codecSampleRate;
}

- (unsigned)inputSampleRate
{
  return self->_inputSampleRate;
}

- (unsigned)samplesPerFrame
{
  return self->_inputSamplesPerFrame;
}

- (unsigned)bundleHeaderBytes
{
  return self->_bundleHeaderBytes;
}

- (NSArray)supportedBitrates
{
  return self->_supportedBitrates;
}

- (unsigned)bitrate
{
  return self->_bitrate;
}

- (NSArray)supportedBandwidths
{
  return self->_supportedBandwidths;
}

- (int)format
{
  return self->_format;
}

- (unsigned)internalBundleFactor
{
  return self->_internalBundleFactor;
}

- (BOOL)payloadOctetAligned
{
  return self->_payloadOctetAligned;
}

- (BOOL)forcingBitrate
{
  return self->_forcingBitrate;
}

- (BOOL)isDTXEnabled
{
  return self->_isDTXEnabled;
}

- (unsigned)evsSIDPeriod
{
  return self->_evsSIDPeriod;
}

- (unsigned)evsChannelAwareOffset
{
  return self->_evsChannelAwareOffset;
}

- (BOOL)evsHeaderFullOnly
{
  return self->_evsHeaderFullOnly;
}

- (BOOL)isOpusInBandFecEnabled
{
  return self->_isOpusInBandFecEnabled;
}

- (unsigned)evsChannelAwareIndicator
{
  return self->_evsChannelAwareIndicator;
}

- (int)evsCMRMode
{
  return self->_evsCMRMode;
}

- (void)setEvsCMRMode:(int)a3
{
  self->_evsCMRMode = a3;
}

- (void)configure:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  int v5 = "-[VCAudioPayloadConfig configure:]";
  __int16 v6 = 1024;
  int v7 = 61;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Missing payloadType", (uint8_t *)&v2, 0x1Cu);
}

- (void)configure:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d payload:%d Invalid internal bundle factor", v2, v3, v4, v5);
}

- (void)configure:.cold.3()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d payload:%d Invalid block size", v2, v3, v4, v5);
}

- (void)configure:.cold.4()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d payload:%d Invalid Codec SampleRate", v2, v3, v4, v5);
}

@end