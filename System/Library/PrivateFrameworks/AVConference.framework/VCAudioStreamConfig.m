@interface VCAudioStreamConfig
+ (int)bundlingSchemeForAudioStreamMode:(int64_t)a3 payloadType:(int)a4;
- (BOOL)anbrEnabled;
- (BOOL)dtmfEventCallbacksEnabled;
- (BOOL)dtmfTonePlaybackEnabled;
- (BOOL)enableMaxBitrateOnNoChangeCMR;
- (BOOL)forceEVSWideBand;
- (BOOL)isHigherAudioREDCutoverU1Enabled;
- (BOOL)isLowLatency;
- (BOOL)isRedEnabled;
- (BOOL)setupCNCodecWithClientDictionary:(id)a3;
- (BOOL)setupCodecWithClientDictionary:(id)a3;
- (BOOL)setupDTMFCodecWithClientDictionary:(id)a3;
- (BOOL)shouldApplyRedAsBoolean;
- (BOOL)supportsAdaptation;
- (BOOL)useExternalIO;
- (BOOL)useWifiTiers;
- (NSArray)supportedNumRedundantPayload;
- (NSDictionary)allCodecConfigurations;
- (NSDictionary)codecConfigurations;
- (VCAudioStreamConfig)init;
- (VCAudioStreamConfig)initWithClientDictionary:(id)a3;
- (VCMediaStreamConfigRemoteDeviceInfo)remoteDeviceInfo;
- (const)externalIOFormat;
- (float)volume;
- (int)bundlingScheme;
- (int)oneToOneOperatingMode;
- (int64_t)audioStreamMode;
- (int64_t)subscriptionSlot;
- (unsigned)channelCount;
- (unsigned)dtmfSampleRate;
- (unsigned)numRedundantPayloads;
- (unsigned)preferredMediaBitRate;
- (void)addCodecConfiguration:(id)a3;
- (void)addSupportedNumRedundantPayload:(unsigned int)a3;
- (void)dealloc;
- (void)setAnbrEnabled:(BOOL)a3;
- (void)setAudioStreamMode:(int64_t)a3;
- (void)setBundlingScheme:(int)a3;
- (void)setChannelCount:(unsigned int)a3;
- (void)setDtmfEventCallbacksEnabled:(BOOL)a3;
- (void)setDtmfSampleRate:(unsigned int)a3;
- (void)setDtmfTonePlaybackEnabled:(BOOL)a3;
- (void)setEnableMaxBitrateOnNoChangeCMR:(BOOL)a3;
- (void)setExternalIOFormat:(const tagVCAudioFrameFormat *)a3;
- (void)setForceEVSWideBand:(BOOL)a3;
- (void)setIsHigherAudioREDCutoverU1Enabled:(BOOL)a3;
- (void)setIsLowLatency:(BOOL)a3;
- (void)setNumRedundantPayloads:(unsigned __int8)a3;
- (void)setOneToOneOperatingMode:(int)a3;
- (void)setPreferredMediaBitRate:(unsigned int)a3;
- (void)setShouldApplyRedAsBoolean:(BOOL)a3;
- (void)setSubscriptionSlot:(int64_t)a3;
- (void)setSupportsAdaptation:(BOOL)a3;
- (void)setUseWifiTiers:(BOOL)a3;
- (void)setVolume:(float)a3;
- (void)setupRedWithRxPayload:(unsigned int)a3 txPayload:(unsigned int)a4;
@end

@implementation VCAudioStreamConfig

- (NSDictionary)allCodecConfigurations
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithDictionary:", -[VCAudioStreamConfig codecConfigurations](self, "codecConfigurations"));
  v4 = [(VCMediaStreamConfig *)self multiwayConfig];
  if (v4) {
    objc_msgSend(v3, "addEntriesFromDictionary:", -[VCMediaStreamMultiwayConfig v2CodecConfigurations](v4, "v2CodecConfigurations"));
  }

  return (NSDictionary *)v3;
}

- (VCAudioStreamConfig)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCAudioStreamConfig;
  v2 = [(VCMediaStreamConfig *)&v4 init];
  if (v2)
  {
    v2->_codecConfigurations = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_supportedNumRedundantPayload = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
  }
  return v2;
}

- (VCAudioStreamConfig)initWithClientDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    __str = 0;
    uint64_t v5 = objc_opt_class()
       ? (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String")
       : "<nil>";
    asprintf(&__str, "%s[%p] %s", v5, self, (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String"));
    if (__str)
    {
      __lasts = 0;
      v6 = strtok_r(__str, "\n", &__lasts);
      v7 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v8 = VRTraceErrorLogLevelToCSTR();
          v9 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v18 = v8;
            __int16 v19 = 2080;
            v20 = "-[VCAudioStreamConfig initWithClientDictionary:]";
            __int16 v21 = 1024;
            int v22 = 71;
            __int16 v23 = 2080;
            v24 = "-[VCAudioStreamConfig initWithClientDictionary:]";
            __int16 v25 = 2080;
            v26 = v6;
            _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v6 = strtok_r(0, "\n", &__lasts);
      }
      while (v6);
      free(__str);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)VCAudioStreamConfig;
  v10 = [(VCMediaStreamConfig *)&v14 initWithClientDictionary:a3];
  if (v10)
  {
    v10->_codecConfigurations = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v10->_audioStreamMode = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamAudioStreamMode"), "integerValue");
    v10->_supportedNumRedundantPayload = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    v10->_enableMaxBitrateOnNoChangeCMR = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamEnableMaxBitrateOnNoChangeCMR"), "BOOLValue");
    v10->_dtmfTonePlaybackEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamdtmfTonePlaybackEnabled"), "BOOLValue");
    v10->_dtmfEventCallbacksEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamDTMFEventCallbacksEnabled"), "BOOLValue");
    v10->_dtmfSampleRate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamDTMFTsRate"), "integerValue");
    v10->_subscriptionSlot = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTelephonyServiceSubscriptionSlot"), "integerValue");
    v10->_anbrEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamAnbrEnabled"), "BOOLValue");
    if (![(VCAudioStreamConfig *)v10 setupCodecWithClientDictionary:a3]
      || ![(VCAudioStreamConfig *)v10 setupCNCodecWithClientDictionary:a3])
    {
      goto LABEL_19;
    }
    BOOL v11 = [(VCAudioStreamConfig *)v10 setupDTMFCodecWithClientDictionary:a3];
    v10->_bundlingScheme = +[VCAudioStreamConfig bundlingSchemeForAudioStreamMode:payloadType:](VCAudioStreamConfig, "bundlingSchemeForAudioStreamMode:payloadType:", v10->_audioStreamMode, +[VCPayloadUtils payloadForCodecType:[(VCMediaStreamConfig *)v10 primaryTxCodecType]]);
    unsigned int v12 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamChannelCount"), "integerValue")? objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamChannelCount"), "integerValue"): 1;
    v10->_channelCount = v12;
    v10->_preferredMediaBitRate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamPreferredMediaBitRate"), "integerValue");
    v10->_remoteDeviceInfo = objc_alloc_init(VCMediaStreamConfigRemoteDeviceInfo);
    -[VCMediaStreamConfigRemoteDeviceInfo setDeviceName:](v10->_remoteDeviceInfo, "setDeviceName:", [a3 objectForKeyedSubscript:@"vcMediaStreamRemoteDeviceInfoDeviceName"]);
    -[VCMediaStreamConfigRemoteDeviceInfo setDeviceUID:](v10->_remoteDeviceInfo, "setDeviceUID:", [a3 objectForKeyedSubscript:@"vcMediaStreamRemoteDeviceInfoDeviceUID"]);
    -[VCMediaStreamConfigRemoteDeviceInfo setModelUID:](v10->_remoteDeviceInfo, "setModelUID:", [a3 objectForKeyedSubscript:@"vcMediaStreamRemoteDeviceInfoModelUID"]);
    if (!v11)
    {
LABEL_19:

      return 0;
    }
  }
  return v10;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCAudioStreamConfig;
  [(VCMediaStreamConfig *)&v3 dealloc];
}

+ (int)bundlingSchemeForAudioStreamMode:(int64_t)a3 payloadType:(int)a4
{
  int result = 3;
  switch(a3)
  {
    case 4:
    case 8:
      if (+[VCPayloadUtils canBundleExternallyForPayload:forBundlingScheme:operatingMode:](VCPayloadUtils, "canBundleExternallyForPayload:forBundlingScheme:operatingMode:", *(void *)&a4, 2, +[VCAudioStream operatingModeForAudioStreamMode:](VCAudioStream, "operatingModeForAudioStreamMode:")))
      {
        int result = 2;
      }
      else
      {
        int result = 0;
      }
      break;
    case 5:
      int result = +[VCPayloadUtils canBundleExternallyForPayload:forBundlingScheme:operatingMode:](VCPayloadUtils, "canBundleExternallyForPayload:forBundlingScheme:operatingMode:", *(void *)&a4, 1, +[VCAudioStream operatingModeForAudioStreamMode:5]);
      break;
    case 7:
    case 10:
      return result;
    default:
      int result = 0;
      break;
  }
  return result;
}

- (BOOL)setupCodecWithClientDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamCodecType"), "integerValue");
  uint64_t v6 = +[VCPayloadUtils payloadForCodecType:v5];
  v7 = [[VCAudioStreamCodecConfig alloc] initWithCodecType:v5];
  if (v7)
  {
    uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRxPayloadType"), "integerValue");
    [(VCAudioStreamCodecConfig *)v7 setNetworkPayload:v8];
    -[VCAudioStreamCodecConfig setEvsChannelAwareOffset:](v7, "setEvsChannelAwareOffset:", (unsigned __int16)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamEVSChannelAwareOffset"), "integerValue"));
    -[VCAudioStreamCodecConfig setEvsHeaderFullOnly:](v7, "setEvsHeaderFullOnly:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamEVSHeaderFullOnly"), "BOOLValue"));
    -[VCAudioStreamCodecConfig setEvsCMRMode:](v7, "setEvsCMRMode:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamEVSCMRMode"), "integerValue"));
    -[VCAudioStreamCodecConfig setOctetAligned:](v7, "setOctetAligned:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamAMRIsOctetAligned"), "BOOLValue"));
    -[VCAudioStreamCodecConfig setDtxEnabled:](v7, "setDtxEnabled:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamAMRDTXEnabled"), "BOOLValue"));
    -[VCAudioStreamCodecConfig setPTime:](v7, "setPTime:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamPtime"), "integerValue"));
    -[VCAudioStreamCodecConfig setPreferredModeWithClientMode:](v7, "setPreferredModeWithClientMode:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamCodecRateModePreferred"), "integerValue"));
    -[VCAudioStreamCodecConfig setupModesWithClientModeMask:](v7, "setupModesWithClientModeMask:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamCodecRateModeMask"), "integerValue"));
    -[VCAudioStreamCodecConfig setupCodecBandwidthsWithClientBandwidthMask:](v7, "setupCodecBandwidthsWithClientBandwidthMask:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamCodecBandwidthMask"), "integerValue"));
    [(VCAudioStreamConfig *)self addCodecConfiguration:v7];
    [(VCMediaStreamConfig *)self addRxPayloadType:v6 networkPayload:v8];
    -[VCMediaStreamConfig addTxPayloadType:networkPayload:](self, "addTxPayloadType:networkPayload:", v6, objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTxPayloadType"), "integerValue"));

    unsigned __int8 v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamNumRedundantPayloads"), "integerValue");
    self->_numRedundantPayloads = v9;
    if (v9)
    {
      self->_redEnabled = 1;
      -[VCMediaStreamConfig addTxPayloadType:networkPayload:](self, "addTxPayloadType:networkPayload:", 20, objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTxRedPayloadType"), "integerValue"));
    }
    if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRxRedPayloadType"), "integerValue"))-[VCMediaStreamConfig addRxPayloadType:networkPayload:](self, "addRxPayloadType:networkPayload:", 20); {
  }
    }
  else if ((VCAudioStreamConfig *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioStreamConfig setupCodecWithClientDictionary:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v10 = (__CFString *)[(VCAudioStreamConfig *)self performSelector:sel_logPrefix];
    }
    else {
      v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      unsigned int v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v14 = 136316418;
        uint64_t v15 = v11;
        __int16 v16 = 2080;
        v17 = "-[VCAudioStreamConfig setupCodecWithClientDictionary:]";
        __int16 v18 = 1024;
        int v19 = 138;
        __int16 v20 = 2112;
        __int16 v21 = v10;
        __int16 v22 = 2048;
        __int16 v23 = self;
        __int16 v24 = 1024;
        int v25 = v5;
        _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate config for type: %d", (uint8_t *)&v14, 0x36u);
      }
    }
  }
  return v7 != 0;
}

- (void)setupRedWithRxPayload:(unsigned int)a3 txPayload:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  self->_redEnabled = 1;
  [(VCMediaStreamConfig *)self addRxPayloadType:20 networkPayload:*(void *)&a3];

  [(VCMediaStreamConfig *)self addTxPayloadType:20 networkPayload:v4];
}

- (BOOL)setupCNCodecWithClientDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamCNEnabled"), "BOOLValue"))goto LABEL_4; {
  uint64_t v5 = [[VCAudioStreamCodecConfig alloc] initWithCodecType:9];
  }
  if (v5)
  {
    uint64_t v6 = v5;
    [(VCAudioStreamConfig *)self addCodecConfiguration:v5];
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamCNPayloadType"), "unsignedIntValue");
    [(VCMediaStreamConfig *)self addRxPayloadType:13 networkPayload:v7];
    [(VCMediaStreamConfig *)self addTxPayloadType:13 networkPayload:v7];

LABEL_4:
    LOBYTE(v8) = 1;
    return v8;
  }
  if ((VCAudioStreamConfig *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v8) {
        return v8;
      }
      -[VCAudioStreamConfig setupCNCodecWithClientDictionary:]();
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      unsigned __int8 v9 = (__CFString *)[(VCAudioStreamConfig *)self performSelector:sel_logPrefix];
    }
    else {
      unsigned __int8 v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v8) {
        return v8;
      }
      int v13 = 136316418;
      uint64_t v14 = v10;
      __int16 v15 = 2080;
      __int16 v16 = "-[VCAudioStreamConfig setupCNCodecWithClientDictionary:]";
      __int16 v17 = 1024;
      int v18 = 188;
      __int16 v19 = 2112;
      __int16 v20 = v9;
      __int16 v21 = 2048;
      __int16 v22 = self;
      __int16 v23 = 1024;
      int v24 = 9;
      _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate config for type: %d", (uint8_t *)&v13, 0x36u);
    }
  }
  LOBYTE(v8) = 0;
  return v8;
}

- (BOOL)setupDTMFCodecWithClientDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [[VCAudioStreamCodecConfig alloc] initWithCodecType:10];
  uint64_t v6 = v5;
  if (v5)
  {
    [(VCAudioStreamCodecConfig *)v5 setDtmf:1];
    [(VCAudioStreamConfig *)self addCodecConfiguration:v6];
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamDTMFPayloadType"), "unsignedIntValue");
    [(VCAudioStreamCodecConfig *)v6 setNetworkPayload:v7];
    [(VCMediaStreamConfig *)self addRxPayloadType:117 networkPayload:v7];
    [(VCMediaStreamConfig *)self addTxPayloadType:117 networkPayload:v7];
  }
  else if ((VCAudioStreamConfig *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioStreamConfig setupDTMFCodecWithClientDictionary:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      unsigned __int8 v9 = (__CFString *)[(VCAudioStreamConfig *)self performSelector:sel_logPrefix];
    }
    else {
      unsigned __int8 v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v12 = 136316418;
        uint64_t v13 = v10;
        __int16 v14 = 2080;
        __int16 v15 = "-[VCAudioStreamConfig setupDTMFCodecWithClientDictionary:]";
        __int16 v16 = 1024;
        int v17 = 203;
        __int16 v18 = 2112;
        __int16 v19 = v9;
        __int16 v20 = 2048;
        __int16 v21 = self;
        __int16 v22 = 1024;
        int v23 = 10;
        _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate config for type: %d", (uint8_t *)&v12, 0x36u);
      }
    }
  }
  return v6 != 0;
}

- (void)setExternalIOFormat:(const tagVCAudioFrameFormat *)a3
{
  if (a3)
  {
    long long v4 = *(_OWORD *)&a3->format.mBytesPerPacket;
    long long v3 = *(_OWORD *)&a3->format.mBitsPerChannel;
    *(_OWORD *)&self->_externalIOFormat.format.mSampleRate = *(_OWORD *)&a3->format.mSampleRate;
    *(_OWORD *)&self->_externalIOFormat.format.mBytesPerPacket = v4;
    *(_OWORD *)&self->_externalIOFormat.format.mBitsPerChannel = v3;
    self->_useExternalIO = 1;
  }
}

- (const)externalIOFormat
{
  return &self->_externalIOFormat;
}

- (void)addCodecConfiguration:(id)a3
{
  if (a3)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_codecConfigurations, "setObject:forKeyedSubscript:", a3, objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "codecType")));
    uint64_t v5 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", [a3 codecType]);
    -[VCMediaStreamConfig addRxPayloadType:networkPayload:](self, "addRxPayloadType:networkPayload:", v5, [a3 networkPayload]);
    uint64_t v6 = [a3 networkPayload];
    [(VCMediaStreamConfig *)self addTxPayloadType:v5 networkPayload:v6];
  }
}

- (void)addSupportedNumRedundantPayload:(unsigned int)a3
{
  supportedNumRedundantPayload = self->_supportedNumRedundantPayload;
  uint64_t v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];

  [(NSMutableOrderedSet *)supportedNumRedundantPayload addObject:v4];
}

- (NSArray)supportedNumRedundantPayload
{
  v2 = (NSArray *)[(NSMutableOrderedSet *)self->_supportedNumRedundantPayload array];
  if ([(NSArray *)v2 count]) {
    return v2;
  }
  else {
    return (NSArray *)&unk_1F3DC88B0;
  }
}

- (int64_t)audioStreamMode
{
  return self->_audioStreamMode;
}

- (void)setAudioStreamMode:(int64_t)a3
{
  self->_audioStreamMode = a3;
}

- (NSDictionary)codecConfigurations
{
  return &self->_codecConfigurations->super;
}

- (BOOL)isRedEnabled
{
  return self->_redEnabled;
}

- (unsigned)numRedundantPayloads
{
  return self->_numRedundantPayloads;
}

- (void)setNumRedundantPayloads:(unsigned __int8)a3
{
  self->_numRedundantPayloads = a3;
}

- (BOOL)enableMaxBitrateOnNoChangeCMR
{
  return self->_enableMaxBitrateOnNoChangeCMR;
}

- (void)setEnableMaxBitrateOnNoChangeCMR:(BOOL)a3
{
  self->_enableMaxBitrateOnNoChangeCMR = a3;
}

- (BOOL)forceEVSWideBand
{
  return self->_forceEVSWideBand;
}

- (void)setForceEVSWideBand:(BOOL)a3
{
  self->_forceEVSWideBand = a3;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (BOOL)shouldApplyRedAsBoolean
{
  return self->_shouldApplyRedAsBoolean;
}

- (void)setShouldApplyRedAsBoolean:(BOOL)a3
{
  self->_shouldApplyRedAsBoolean = a3;
}

- (BOOL)supportsAdaptation
{
  return self->_supportsAdaptation;
}

- (void)setSupportsAdaptation:(BOOL)a3
{
  self->_supportsAdaptation = a3;
}

- (int)bundlingScheme
{
  return self->_bundlingScheme;
}

- (void)setBundlingScheme:(int)a3
{
  self->_bundlingScheme = a3;
}

- (int)oneToOneOperatingMode
{
  return self->_oneToOneOperatingMode;
}

- (void)setOneToOneOperatingMode:(int)a3
{
  self->_oneToOneOperatingMode = a3;
}

- (unsigned)channelCount
{
  return self->_channelCount;
}

- (void)setChannelCount:(unsigned int)a3
{
  self->_channelCount = a3;
}

- (BOOL)dtmfTonePlaybackEnabled
{
  return self->_dtmfTonePlaybackEnabled;
}

- (void)setDtmfTonePlaybackEnabled:(BOOL)a3
{
  self->_dtmfTonePlaybackEnabled = a3;
}

- (unsigned)dtmfSampleRate
{
  return self->_dtmfSampleRate;
}

- (void)setDtmfSampleRate:(unsigned int)a3
{
  self->_dtmfSampleRate = a3;
}

- (BOOL)anbrEnabled
{
  return self->_anbrEnabled;
}

- (void)setAnbrEnabled:(BOOL)a3
{
  self->_anbrEnabled = a3;
}

- (int64_t)subscriptionSlot
{
  return self->_subscriptionSlot;
}

- (void)setSubscriptionSlot:(int64_t)a3
{
  self->_subscriptionSlot = a3;
}

- (BOOL)isLowLatency
{
  return self->_isLowLatency;
}

- (void)setIsLowLatency:(BOOL)a3
{
  self->_isLowLatency = a3;
}

- (BOOL)useExternalIO
{
  return self->_useExternalIO;
}

- (unsigned)preferredMediaBitRate
{
  return self->_preferredMediaBitRate;
}

- (void)setPreferredMediaBitRate:(unsigned int)a3
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

- (BOOL)isHigherAudioREDCutoverU1Enabled
{
  return self->_isHigherAudioREDCutoverU1Enabled;
}

- (void)setIsHigherAudioREDCutoverU1Enabled:(BOOL)a3
{
  self->_isHigherAudioREDCutoverU1Enabled = a3;
}

- (BOOL)useWifiTiers
{
  return self->_useWifiTiers;
}

- (void)setUseWifiTiers:(BOOL)a3
{
  self->_useWifiTiers = a3;
}

- (VCMediaStreamConfigRemoteDeviceInfo)remoteDeviceInfo
{
  return self->_remoteDeviceInfo;
}

- (void)setupCodecWithClientDictionary:.cold.1()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  int v4 = 138;
  __int16 v5 = v0;
  int v6 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate config for type: %d", v3, 0x22u);
}

- (void)setupCNCodecWithClientDictionary:.cold.1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  int v3 = 188;
  __int16 v4 = v0;
  int v5 = 9;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate config for type: %d", v2, 0x22u);
}

- (void)setupDTMFCodecWithClientDictionary:.cold.1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  int v3 = 203;
  __int16 v4 = v0;
  int v5 = 10;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate config for type: %d", v2, 0x22u);
}

@end