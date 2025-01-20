@interface AVCAudioStreamConfig
+ (int)clientCodecCMRModeModeWithEVSCMRMode:(int)a3;
+ (int)codecRateModeForClientCodecRateMode:(int64_t)a3;
+ (int)evsCMRModeForClientCodecCMRMode:(int)a3;
+ (int64_t)clientCodecRateModeForCodecRateMode:(int)a3;
+ (int64_t)clientCodecTypeWithCodecType:(int64_t)a3;
+ (int64_t)clientStreamModeWithStreamMode:(int64_t)a3;
+ (int64_t)codecTypeWithClientCodecType:(int64_t)a3;
+ (int64_t)streamModeWithClientStreamMode:(int64_t)a3;
+ (unsigned)clientCodecBandwidthMaskForCodecBandwidth:(unsigned int)a3;
+ (unsigned)clientCodecRateMaskForCodecRateMode:(unsigned int)a3;
+ (unsigned)codecBandwidthMaskForClientCodecBandwidth:(unsigned int)a3;
+ (unsigned)codecRateMaskForClientCodecRateMode:(unsigned int)a3;
- (AVCAudioStreamConfig)init;
- (AVCMediaStreamConfigRemoteDeviceInfo)remoteDeviceInfo;
- (BOOL)anbrEnabled;
- (BOOL)dtmfEventCallbacksEnabled;
- (BOOL)dtmfTonePlaybackEnabled;
- (BOOL)enableMaxBitrateOnNoChangeCMR;
- (BOOL)isCNEnabled;
- (BOOL)isCNValid;
- (BOOL)isChannelCountValid;
- (BOOL)isDTMFValid;
- (BOOL)isDTXEnabled;
- (BOOL)isHeaderFullOnly;
- (BOOL)isLatencySensitiveMode;
- (BOOL)isOctectAligned;
- (BOOL)isRedValid;
- (BOOL)isValid;
- (float)volume;
- (id)dictionary;
- (int)codecCMRMode;
- (int64_t)audioStreamMode;
- (int64_t)codecType;
- (int64_t)preferredCodecRateMode;
- (int64_t)subscriptionSlot;
- (unint64_t)channelAwareOffset;
- (unint64_t)channelCount;
- (unint64_t)cnPayloadType;
- (unint64_t)dtmfPayloadType;
- (unint64_t)dtmfTimestampRate;
- (unint64_t)maxPtime;
- (unint64_t)numRedundantPayloads;
- (unint64_t)preferredMediaBitRate;
- (unint64_t)ptime;
- (unint64_t)rxRedPayloadType;
- (unint64_t)txRedPayloadType;
- (unsigned)codecBandwidthMask;
- (unsigned)codecRateModeMask;
- (void)dealloc;
- (void)setAnbrEnabled:(BOOL)a3;
- (void)setAudioStreamMode:(int64_t)a3;
- (void)setChannelAwareOffset:(unint64_t)a3;
- (void)setChannelCount:(unint64_t)a3;
- (void)setCnEnabled:(BOOL)a3;
- (void)setCnPayloadType:(unint64_t)a3;
- (void)setCodecBandwidthMask:(unsigned int)a3;
- (void)setCodecCMRMode:(int)a3;
- (void)setCodecRateModeMask:(unsigned int)a3;
- (void)setCodecType:(int64_t)a3;
- (void)setDtmfEventCallbacksEnabled:(BOOL)a3;
- (void)setDtmfPayloadType:(unint64_t)a3;
- (void)setDtmfTimestampRate:(unint64_t)a3;
- (void)setDtmfTonePlaybackEnabled:(BOOL)a3;
- (void)setDtxEnabled:(BOOL)a3;
- (void)setEnableMaxBitrateOnNoChangeCMR:(BOOL)a3;
- (void)setHeaderFullOnly:(BOOL)a3;
- (void)setLatencySensitiveMode:(BOOL)a3;
- (void)setMaxPtime:(unint64_t)a3;
- (void)setNumRedundantPayloads:(unint64_t)a3;
- (void)setOctetAligned:(BOOL)a3;
- (void)setPreferredCodecRateMode:(int64_t)a3;
- (void)setPreferredMediaBitRate:(unint64_t)a3;
- (void)setPtime:(unint64_t)a3;
- (void)setRxRedPayloadType:(unint64_t)a3;
- (void)setSubscriptionSlot:(int64_t)a3;
- (void)setTxRedPayloadType:(unint64_t)a3;
- (void)setUpWithDictionary:(id)a3;
- (void)setVolume:(float)a3;
@end

@implementation AVCAudioStreamConfig

- (AVCAudioStreamConfig)init
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)AVCAudioStreamConfig;
  v2 = [(AVCAudioStreamConfig *)&v12 init];
  if (v2)
  {
    if ((AVCAudioStreamConfig *)objc_opt_class() == v2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_13;
      }
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v14 = v4;
      __int16 v15 = 2080;
      v16 = "-[AVCAudioStreamConfig init]";
      __int16 v17 = 1024;
      int v18 = 555;
      v6 = " [%s] %s:%d ";
      v7 = v5;
      uint32_t v8 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v3 = (__CFString *)[(AVCAudioStreamConfig *)v2 performSelector:sel_logPrefix];
      }
      else {
        v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_13;
      }
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v14 = v9;
      __int16 v15 = 2080;
      v16 = "-[AVCAudioStreamConfig init]";
      __int16 v17 = 1024;
      int v18 = 555;
      __int16 v19 = 2112;
      v20 = v3;
      __int16 v21 = 2048;
      v22 = v2;
      v6 = " [%s] %s:%d %@(%p) ";
      v7 = v10;
      uint32_t v8 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
LABEL_13:
    *(int64x2_t *)&v2->_ptime = vdupq_n_s64(0x14uLL);
    v2->_volume = 1.0;
    v2->_channelCount = 1;
    v2->_remoteDeviceInfo = objc_alloc_init(AVCMediaStreamConfigRemoteDeviceInfo);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((AVCAudioStreamConfig *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v13 = v4;
        __int16 v14 = 2080;
        __int16 v15 = "-[AVCAudioStreamConfig dealloc]";
        __int16 v16 = 1024;
        int v17 = 566;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(AVCAudioStreamConfig *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v13 = v9;
        __int16 v14 = 2080;
        __int16 v15 = "-[AVCAudioStreamConfig dealloc]";
        __int16 v16 = 1024;
        int v17 = 566;
        __int16 v18 = 2112;
        __int16 v19 = v3;
        __int16 v20 = 2048;
        __int16 v21 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }

  v11.receiver = self;
  v11.super_class = (Class)AVCAudioStreamConfig;
  [(AVCAudioStreamConfig *)&v11 dealloc];
}

- (BOOL)isValid
{
  if (![(AVCAudioStreamConfig *)self isDTMFValid]
    || ![(AVCAudioStreamConfig *)self isCNValid]
    || ![(AVCAudioStreamConfig *)self isRedValid])
  {
    return 0;
  }

  return [(AVCAudioStreamConfig *)self isChannelCountValid];
}

+ (int64_t)codecTypeWithClientCodecType:(int64_t)a3
{
  if ((unint64_t)a3 > 0x11) {
    return 0;
  }
  else {
    return qword_1E25A3338[a3];
  }
}

+ (int64_t)clientCodecTypeWithCodecType:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 0x12) {
    return 0;
  }
  else {
    return qword_1E25A33C8[a3 - 2];
  }
}

+ (int64_t)streamModeWithClientStreamMode:(int64_t)a3
{
  if ((unint64_t)a3 < 0xB) {
    return a3 + 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      +[AVCAudioStreamConfig streamModeWithClientStreamMode:]();
    }
  }
  return 0;
}

+ (int64_t)clientStreamModeWithStreamMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 9) {
    return 0;
  }
  else {
    return qword_1E25A3460[a3 - 2];
  }
}

+ (int)clientCodecCMRModeModeWithEVSCMRMode:(int)a3
{
  if (a3 == -1) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  if (a3 == 1) {
    return 1;
  }
  else {
    return v3;
  }
}

+ (int)evsCMRModeForClientCodecCMRMode:(int)a3
{
  if (a3 == -1) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  if (a3 == 1) {
    return 1;
  }
  else {
    return v3;
  }
}

+ (unsigned)codecRateMaskForClientCodecRateMode:(unsigned int)a3
{
  return a3 & 0x3FFFFF;
}

+ (unsigned)clientCodecRateMaskForCodecRateMode:(unsigned int)a3
{
  return a3 & 0x3FFFFF;
}

+ (unsigned)codecBandwidthMaskForClientCodecBandwidth:(unsigned int)a3
{
  return a3 & 7;
}

+ (unsigned)clientCodecBandwidthMaskForCodecBandwidth:(unsigned int)a3
{
  return a3 & 7;
}

+ (int)codecRateModeForClientCodecRateMode:(int64_t)a3
{
  if ((unint64_t)a3 > 0x15) {
    return -1;
  }
  else {
    return dword_1E25A34B0[a3];
  }
}

+ (int64_t)clientCodecRateModeForCodecRateMode:(int)a3
{
  if ((a3 - 1) > 0x14) {
    return 0;
  }
  else {
    return qword_1E25A3508[a3 - 1];
  }
}

- (BOOL)isDTMFValid
{
  if (![(AVCAudioStreamConfig *)self dtmfPayloadType]) {
    return 1;
  }
  if ([(AVCAudioStreamConfig *)self dtmfPayloadType] > 0x7F) {
    return 0;
  }
  return [(AVCAudioStreamConfig *)self dtmfPayloadType] > 0x5F;
}

- (BOOL)isCNValid
{
  return ![(AVCAudioStreamConfig *)self isCNEnabled]
      || [(AVCAudioStreamConfig *)self cnPayloadType] == 13;
}

- (BOOL)isRedValid
{
  if (![(AVCAudioStreamConfig *)self numRedundantPayloads]) {
    return 1;
  }
  if ([(AVCAudioStreamConfig *)self txRedPayloadType] > 0x7F
    || [(AVCAudioStreamConfig *)self txRedPayloadType] < 0x60
    || [(AVCAudioStreamConfig *)self rxRedPayloadType] > 0x7F)
  {
    return 0;
  }
  return [(AVCAudioStreamConfig *)self rxRedPayloadType] > 0x5F;
}

- (BOOL)isChannelCountValid
{
  int64_t v3 = [(AVCAudioStreamConfig *)self audioStreamMode];
  LOBYTE(v4) = v3 + 1;
  if ((unint64_t)(v3 + 1) <= 0xB)
  {
    if (((1 << v4) & 0x4FF) != 0)
    {
      BOOL v5 = self->_channelCount == 1;
      goto LABEL_4;
    }
    if (((1 << v4) & 0xA00) != 0)
    {
      BOOL v5 = self->_channelCount == 2;
LABEL_4:
      LOBYTE(v4) = v5;
      return v4 & 1;
    }
    unint64_t channelCount = self->_channelCount;
    BOOL v8 = channelCount > 4;
    unsigned int v4 = (0x16u >> channelCount) & 1;
    if (v8) {
      LOBYTE(v4) = 0;
    }
  }
  return v4 & 1;
}

- (void)setUpWithDictionary:(id)a3
{
  self->_audioStreamMode = +[AVCAudioStreamConfig clientStreamModeWithStreamMode:](AVCAudioStreamConfig, "clientStreamModeWithStreamMode:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamAudioStreamMode"), "integerValue"));
  self->_codecType = +[AVCAudioStreamConfig clientCodecTypeWithCodecType:](AVCAudioStreamConfig, "clientCodecTypeWithCodecType:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamCodecType"), "integerValue"));
  self->_cnEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamCNEnabled"), "BOOLValue");
  self->_cnPayloadType = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamCNPayloadType"), "integerValue");
  self->_dtmfPayloadType = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamDTMFPayloadType"), "integerValue");
  self->_dtmfTimestampRate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamDTMFTsRate"), "integerValue");
  self->_dtmfTonePlaybackEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamdtmfTonePlaybackEnabled"), "BOOLValue");
  self->_dtmfEventCallbacksEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamDTMFEventCallbacksEnabled"), "BOOLValue");
  self->_ptime = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamPtime"), "integerValue");
  self->_maxPtime = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamMaxPtime"), "integerValue");
  self->_channelAwareOffset = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamEVSChannelAwareOffset"), "integerValue");
  self->_headerFullOnly = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamEVSHeaderFullOnly"), "BOOLValue");
  self->_dtxEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamAMRDTXEnabled"), "BOOLValue");
  self->_octetAligned = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamAMRIsOctetAligned"), "BOOLValue");
  self->_codecRateModeMask = +[AVCAudioStreamConfig clientCodecRateMaskForCodecRateMode:](AVCAudioStreamConfig, "clientCodecRateMaskForCodecRateMode:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamCodecRateModeMask"), "integerValue"));
  self->_codecBandwidthMask = +[AVCAudioStreamConfig clientCodecBandwidthMaskForCodecBandwidth:](AVCAudioStreamConfig, "clientCodecBandwidthMaskForCodecBandwidth:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamCodecBandwidthMask"), "integerValue"));
  self->_preferredCodecRateMode = +[AVCAudioStreamConfig clientCodecRateModeForCodecRateMode:](AVCAudioStreamConfig, "clientCodecRateModeForCodecRateMode:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamCodecRateModePreferred"), "integerValue"));
  self->_latencySensitiveMode = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamLatencySensitiveMode"), "BOOLValue");
  self->_numRedundantPayloads = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamNumRedundantPayloads"), "integerValue");
  self->_txRedPayloadType = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTxRedPayloadType"), "integerValue");
  self->_rxRedPayloadType = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRxRedPayloadType"), "integerValue");
  self->_enableMaxBitrateOnNoChangeCMR = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamEnableMaxBitrateOnNoChangeCMR"), "BOOLValue");
  self->_anbrEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamAnbrEnabled"), "BOOLValue");
  self->_subscriptionSlot = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTelephonyServiceSubscriptionSlot"), "integerValue");
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamChannelCount"), "unsignedIntegerValue"))
  {
    unint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamChannelCount"), "unsignedIntegerValue");
  }
  else
  {
    unint64_t v5 = 1;
  }
  self->_unint64_t channelCount = v5;
  self->_preferredMediaBitRate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamPreferredMediaBitRate"), "unsignedIntegerValue");
  self->_codecCMRMode = +[AVCAudioStreamConfig clientCodecCMRModeModeWithEVSCMRMode:](AVCAudioStreamConfig, "clientCodecCMRModeModeWithEVSCMRMode:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamEVSCMRMode"), "integerValue"));
}

- (id)dictionary
{
  v5[29] = *MEMORY[0x1E4F143B8];
  v4[0] = @"vcMediaStreamAudioStreamMode";
  v5[0] = objc_msgSend(NSNumber, "numberWithInteger:", +[AVCAudioStreamConfig streamModeWithClientStreamMode:](AVCAudioStreamConfig, "streamModeWithClientStreamMode:", self->_audioStreamMode));
  v4[1] = @"vcMediaStreamAMRDTXEnabled";
  v5[1] = [NSNumber numberWithBool:self->_dtxEnabled];
  v4[2] = @"vcMediaStreamAMRIsOctetAligned";
  v5[2] = [NSNumber numberWithBool:self->_octetAligned];
  v4[3] = @"vcMediaStreamCodecRateModeMask";
  v5[3] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", +[AVCAudioStreamConfig codecRateMaskForClientCodecRateMode:](AVCAudioStreamConfig, "codecRateMaskForClientCodecRateMode:", self->_codecRateModeMask));
  v4[4] = @"vcMediaStreamCodecRateModePreferred";
  v5[4] = objc_msgSend(NSNumber, "numberWithInt:", +[AVCAudioStreamConfig codecRateModeForClientCodecRateMode:](AVCAudioStreamConfig, "codecRateModeForClientCodecRateMode:", self->_preferredCodecRateMode));
  v4[5] = @"vcMediaStreamCodecBandwidthMask";
  v5[5] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", +[AVCAudioStreamConfig codecBandwidthMaskForClientCodecBandwidth:](AVCAudioStreamConfig, "codecBandwidthMaskForClientCodecBandwidth:", self->_codecBandwidthMask));
  v4[6] = @"vcMediaStreamCNEnabled";
  v5[6] = [NSNumber numberWithBool:self->_cnEnabled];
  v4[7] = @"vcMediaStreamCNPayloadType";
  v5[7] = [NSNumber numberWithUnsignedInteger:self->_cnPayloadType];
  v4[8] = @"vcMediaStreamDTMFPayloadType";
  v5[8] = [NSNumber numberWithUnsignedInteger:self->_dtmfPayloadType];
  v4[9] = @"vcMediaStreamDTMFTsRate";
  v5[9] = [NSNumber numberWithUnsignedInteger:self->_dtmfTimestampRate];
  v4[10] = @"vcMediaStreamdtmfTonePlaybackEnabled";
  v5[10] = [NSNumber numberWithBool:self->_dtmfTonePlaybackEnabled];
  v4[11] = @"vcMediaStreamDTMFEventCallbacksEnabled";
  v5[11] = [NSNumber numberWithBool:self->_dtmfEventCallbacksEnabled];
  v4[12] = @"vcMediaStreamPtime";
  v5[12] = [NSNumber numberWithUnsignedInteger:self->_ptime];
  v4[13] = @"vcMediaStreamEVSChannelAwareOffset";
  v5[13] = [NSNumber numberWithUnsignedInteger:self->_channelAwareOffset];
  v4[14] = @"vcMediaStreamEVSHeaderFullOnly";
  v5[14] = [NSNumber numberWithBool:self->_headerFullOnly];
  v4[15] = @"vcMediaStreamMaxPtime";
  v5[15] = [NSNumber numberWithUnsignedInteger:self->_maxPtime];
  v4[16] = @"vcMediaStreamCodecType";
  v5[16] = objc_msgSend(NSNumber, "numberWithInteger:", +[AVCAudioStreamConfig codecTypeWithClientCodecType:](AVCAudioStreamConfig, "codecTypeWithClientCodecType:", self->_codecType));
  v4[17] = @"vcMediaStreamNumRedundantPayloads";
  v5[17] = [NSNumber numberWithUnsignedInteger:self->_numRedundantPayloads];
  v4[18] = @"vcMediaStreamTxRedPayloadType";
  v5[18] = [NSNumber numberWithUnsignedInteger:self->_txRedPayloadType];
  v4[19] = @"vcMediaStreamRxRedPayloadType";
  v5[19] = [NSNumber numberWithUnsignedInteger:self->_rxRedPayloadType];
  v4[20] = @"vcMediaStreamEnableMaxBitrateOnNoChangeCMR";
  v5[20] = [NSNumber numberWithBool:self->_enableMaxBitrateOnNoChangeCMR];
  v4[21] = @"vcMediaStreamAnbrEnabled";
  v5[21] = [NSNumber numberWithBool:self->_anbrEnabled];
  v4[22] = @"vcMediaStreamTelephonyServiceSubscriptionSlot";
  v5[22] = [NSNumber numberWithInteger:self->_subscriptionSlot];
  v4[23] = @"vcMediaStreamChannelCount";
  v5[23] = [NSNumber numberWithUnsignedInteger:self->_channelCount];
  v4[24] = @"vcMediaStreamPreferredMediaBitRate";
  v5[24] = [NSNumber numberWithUnsignedInteger:self->_preferredMediaBitRate];
  v4[25] = @"vcMediaStreamRemoteDeviceInfoDeviceName";
  v5[25] = [(AVCMediaStreamConfigRemoteDeviceInfo *)self->_remoteDeviceInfo deviceName];
  v4[26] = @"vcMediaStreamRemoteDeviceInfoDeviceUID";
  v5[26] = [(AVCMediaStreamConfigRemoteDeviceInfo *)self->_remoteDeviceInfo deviceUID];
  v4[27] = @"vcMediaStreamRemoteDeviceInfoModelUID";
  v5[27] = [(AVCMediaStreamConfigRemoteDeviceInfo *)self->_remoteDeviceInfo modelUID];
  v4[28] = @"vcMediaStreamEVSCMRMode";
  v5[28] = objc_msgSend(NSNumber, "numberWithInt:", +[AVCAudioStreamConfig evsCMRModeForClientCodecCMRMode:](AVCAudioStreamConfig, "evsCMRModeForClientCodecCMRMode:", self->_codecCMRMode));
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:29];
}

- (int64_t)audioStreamMode
{
  return self->_audioStreamMode;
}

- (void)setAudioStreamMode:(int64_t)a3
{
  self->_audioStreamMode = a3;
}

- (int64_t)codecType
{
  return self->_codecType;
}

- (void)setCodecType:(int64_t)a3
{
  self->_codecType = a3;
}

- (BOOL)isCNEnabled
{
  return self->_cnEnabled;
}

- (void)setCnEnabled:(BOOL)a3
{
  self->_cnEnabled = a3;
}

- (unint64_t)cnPayloadType
{
  return self->_cnPayloadType;
}

- (void)setCnPayloadType:(unint64_t)a3
{
  self->_cnPayloadType = a3;
}

- (unint64_t)dtmfPayloadType
{
  return self->_dtmfPayloadType;
}

- (void)setDtmfPayloadType:(unint64_t)a3
{
  self->_dtmfPayloadType = a3;
}

- (unint64_t)dtmfTimestampRate
{
  return self->_dtmfTimestampRate;
}

- (void)setDtmfTimestampRate:(unint64_t)a3
{
  self->_dtmfTimestampRate = a3;
}

- (unint64_t)ptime
{
  return self->_ptime;
}

- (void)setPtime:(unint64_t)a3
{
  self->_ptime = a3;
}

- (unint64_t)maxPtime
{
  return self->_maxPtime;
}

- (void)setMaxPtime:(unint64_t)a3
{
  self->_maxPtime = a3;
}

- (unint64_t)channelAwareOffset
{
  return self->_channelAwareOffset;
}

- (void)setChannelAwareOffset:(unint64_t)a3
{
  self->_channelAwareOffset = a3;
}

- (BOOL)isOctectAligned
{
  return self->_octetAligned;
}

- (void)setOctetAligned:(BOOL)a3
{
  self->_octetAligned = a3;
}

- (BOOL)isHeaderFullOnly
{
  return self->_headerFullOnly;
}

- (void)setHeaderFullOnly:(BOOL)a3
{
  self->_headerFullOnly = a3;
}

- (BOOL)isDTXEnabled
{
  return self->_dtxEnabled;
}

- (void)setDtxEnabled:(BOOL)a3
{
  self->_dtxEnabled = a3;
}

- (unsigned)codecRateModeMask
{
  return self->_codecRateModeMask;
}

- (void)setCodecRateModeMask:(unsigned int)a3
{
  self->_codecRateModeMask = a3;
}

- (unsigned)codecBandwidthMask
{
  return self->_codecBandwidthMask;
}

- (void)setCodecBandwidthMask:(unsigned int)a3
{
  self->_codecBandwidthMask = a3;
}

- (int64_t)preferredCodecRateMode
{
  return self->_preferredCodecRateMode;
}

- (void)setPreferredCodecRateMode:(int64_t)a3
{
  self->_preferredCodecRateMode = a3;
}

- (BOOL)isLatencySensitiveMode
{
  return self->_latencySensitiveMode;
}

- (void)setLatencySensitiveMode:(BOOL)a3
{
  self->_latencySensitiveMode = a3;
}

- (unint64_t)numRedundantPayloads
{
  return self->_numRedundantPayloads;
}

- (void)setNumRedundantPayloads:(unint64_t)a3
{
  self->_numRedundantPayloads = a3;
}

- (unint64_t)txRedPayloadType
{
  return self->_txRedPayloadType;
}

- (void)setTxRedPayloadType:(unint64_t)a3
{
  self->_txRedPayloadType = a3;
}

- (unint64_t)rxRedPayloadType
{
  return self->_rxRedPayloadType;
}

- (void)setRxRedPayloadType:(unint64_t)a3
{
  self->_rxRedPayloadType = a3;
}

- (BOOL)enableMaxBitrateOnNoChangeCMR
{
  return self->_enableMaxBitrateOnNoChangeCMR;
}

- (void)setEnableMaxBitrateOnNoChangeCMR:(BOOL)a3
{
  self->_enableMaxBitrateOnNoChangeCMR = a3;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (BOOL)dtmfTonePlaybackEnabled
{
  return self->_dtmfTonePlaybackEnabled;
}

- (void)setDtmfTonePlaybackEnabled:(BOOL)a3
{
  self->_dtmfTonePlaybackEnabled = a3;
}

- (int64_t)subscriptionSlot
{
  return self->_subscriptionSlot;
}

- (void)setSubscriptionSlot:(int64_t)a3
{
  self->_subscriptionSlot = a3;
}

- (BOOL)anbrEnabled
{
  return self->_anbrEnabled;
}

- (void)setAnbrEnabled:(BOOL)a3
{
  self->_anbrEnabled = a3;
}

- (unint64_t)channelCount
{
  return self->_channelCount;
}

- (void)setChannelCount:(unint64_t)a3
{
  self->_unint64_t channelCount = a3;
}

- (unint64_t)preferredMediaBitRate
{
  return self->_preferredMediaBitRate;
}

- (void)setPreferredMediaBitRate:(unint64_t)a3
{
  self->_preferredMediaBitRate = a3;
}

- (BOOL)dtmfEventCallbacksEnabled
{
  return self->_dtmfEventCallbacksEnabled;
}

- (void)setDtmfEventCallbacksEnabled:(BOOL)a3
{
  self->_dtmfEventCallbacksEnabled = a3;
}

- (int)codecCMRMode
{
  return self->_codecCMRMode;
}

- (void)setCodecCMRMode:(int)a3
{
  self->_codecCMRMode = a3;
}

- (AVCMediaStreamConfigRemoteDeviceInfo)remoteDeviceInfo
{
  return self->_remoteDeviceInfo;
}

+ (void)streamModeWithClientStreamMode:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid clientStreamMode=%d", v2, v3, v4, 689);
}

@end