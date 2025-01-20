@interface VCAudioTierPicker
+ (BOOL)arrayHasObject:(id)a3 withPayloadType:(int)a4;
+ (BOOL)isAlwaysOnRedAudioTier:(unsigned int)a3 redNumPayloads:(unsigned int)a4 usingCellular:(BOOL)a5;
+ (BOOL)isLowBitrateAudioTier:(unsigned int)a3;
+ (BOOL)isModeAudioOnly:(unsigned __int8)a3;
+ (BOOL)isModeAudioVideo:(unsigned __int8)a3;
+ (BOOL)isModeLowLatency:(unsigned __int8)a3;
+ (BOOL)isModePlistSupported:(unsigned __int8)a3;
+ (BOOL)isModeV2:(unsigned __int8)a3;
+ (BOOL)isU1ModeWithPlistSupport:(unsigned __int8)a3;
+ (BOOL)loadVCAudioTierFromTierTable:(id)a3 bitrate:(unsigned int)a4 redNumPayloads:(unsigned int)a5 outEntryArray:(id)a6;
+ (BOOL)loadVCAudioTierFromTierTable:(id)a3 config:(id *)a4 allowRedAtLowBitrate:(BOOL)a5 alwaysOnAudioRedundancyDisabled:(BOOL)a6 redNumPayloads:(unsigned int)a7 tierBitrate:(unsigned int)a8 outEntryArray:(id)a9;
+ (BOOL)shouldFilterTierForPayloadConfig:(id)a3 bitRate:(unsigned int)a4 packetsPerBundle:(unsigned int)a5 mode:(unsigned __int8)a6 redNumPayloads:(unsigned int)a7 cellular:(BOOL)a8;
+ (BOOL)usePlistForAudioTierTableFromMode:(unsigned __int8)a3;
+ (id)allPossibleCombinations:(id)a3 supportedPacketsPerBundle:(id)a4 redNumPayloads:(unsigned int)a5 headerSize:(unsigned int)a6 tierPickerMode:(unsigned __int8)a7 usingCellular:(BOOL)a8 useCaseWatchContinuity:(BOOL)a9;
+ (id)selectHighestQualityAudioTiers:(id)a3 forBitrateLimits:(id)a4 isHardLimit:(BOOL)a5;
+ (id)valueForNetworkBitrate:(id)a3 networkBitrate:(unsigned int)a4;
+ (int)tierPickerModeToAVConferenceOperatingMode:(unsigned __int8)a3;
+ (unsigned)operatingModeToTierPickerMode:(int)a3 isLowLatency:(BOOL)a4 preferPlistForTierTable:(BOOL)a5;
- ($874264D99418FF75A48C4C64EBA5A14C)config;
- (BOOL)addEntryMatchingPayloadToAudioTierMap:(id)a3 config:(id *)a4 entry:(id)a5 bitrateTier:(id)a6 forcedPayload:(int)a7;
- (BOOL)reconfigureTierPicker:(id *)a3;
- (BOOL)setupTierPickerForConfig:(id *)a3;
- (BitrateLimits)bitrateLimits;
- (VCAudioTier)defaultTier;
- (VCAudioTierPicker)initWithConfig:(id *)a3;
- (id)allActiveAudioTiers;
- (id)allPayloadsFromAllTierTables;
- (id)chooseMultiwayAudioTierForRedPayload:(unint64_t)a3;
- (id)configToString:(id *)a3;
- (id)generateAudioTiersDictFromPlistForBitrateLimits:(id)a3 tierPickerConfig:(id *)a4 redNumPayloads:(unsigned int)a5;
- (id)loadAudioTiersFromPlist:(id)a3;
- (id)tierForAudioBitrate:(unint64_t)a3 withRedNumPayloads:(unint64_t)a4;
- (id)tierForNetworkBitrate:(unint64_t)a3 withLegacyDuplication:(int)a4;
- (id)tierForNetworkBitrate:(unint64_t)a3 withRedNumPayloads:(unint64_t)a4;
- (unint64_t)adjustedRedNumPayloadsForLowBitrateAudioTier:(id)a3 redNumPayloads:(unint64_t)a4;
- (void)addPayloadFromTier:(id)a3;
- (void)addPayloadsFromGFTPayloadsArray:(id)a3;
- (void)addPayloadsFromGFTRedNumPayloadsDict:(id)a3 isDeviceClassWolf:(BOOL)a4;
- (void)addPayloadsFromU1IPVerDict:(id)a3 config:(id *)a4 mode:(id)a5;
- (void)addPayloadsFromU1RedNumPayloadsDict:(id)a3 config:(id *)a4 mode:(id)a5 isIPv4:(BOOL)a6 isCellular:(BOOL)a7;
- (void)dealloc;
- (void)generateAudioPayloadsFromConfig:(id *)a3;
- (void)logTierPickerConfig:(id *)a3;
- (void)printCreatedAudioTiers:(id)a3;
- (void)setBitrateLimits:(id)a3;
- (void)setConfig:(id *)a3;
- (void)setupAlwaysOnRedTiersForSupportedRed:(id)a3 usingCellular:(BOOL)a4;
@end

@implementation VCAudioTierPicker

- (VCAudioTierPicker)initWithConfig:(id *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)VCAudioTierPicker;
  v4 = [(VCAudioTierPicker *)&v8 init];
  if (v4)
  {
    v4->_tierTablePlist = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4->_audioPayloads = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v5 = *(_OWORD *)&a3->var2;
    v7[0] = *(_OWORD *)&a3->var0;
    v7[1] = v5;
    v7[2] = *(_OWORD *)&a3->var4;
    if (![(VCAudioTierPicker *)v4 setupTierPickerForConfig:v7])
    {

      return 0;
    }
  }
  return v4;
}

- (BOOL)reconfigureTierPicker:(id *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int mode = self->_config.mode;
      int var0 = a3->var0;
      *(_DWORD *)v11 = 136316162;
      *(void *)&v11[4] = v5;
      *(_WORD *)&v11[12] = 2080;
      *(void *)&v11[14] = "-[VCAudioTierPicker reconfigureTierPicker:]";
      *(_WORD *)&v11[22] = 1024;
      *(_DWORD *)&v11[24] = 227;
      *(_WORD *)&v11[28] = 1024;
      *(_DWORD *)&v11[30] = mode;
      *(_WORD *)&v11[34] = 1024;
      *(_DWORD *)&v11[36] = var0;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Reconfiguring audio tier picker (%u -> %u)", v11, 0x28u);
    }
  }

  self->_tierTablesForRedNumPayloads = 0;
  self->_bitrateLimits = 0;
  long long v9 = *(_OWORD *)&a3->var2;
  *(_OWORD *)v11 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&v11[16] = v9;
  *(_OWORD *)&v11[32] = *(_OWORD *)&a3->var4;
  return [(VCAudioTierPicker *)self setupTierPickerForConfig:v11];
}

- (id)configToString:(id *)a3
{
  return (id)[NSString stringWithFormat:@"{ VCAudioTierPickerConfig: mode=%d headerSize=%lu usingCellular=%d isUseCaseWatchContinuity=%d defaultMaxCap=%lu alwaysOnAudioRedundancyEnabled=%d cellularAllowRedLowBitratesEnabled=%d wifiAllowRedLowBitratesEnabled=%d supportedAudioPayloadConfigs=(%@) supportedPacketsPerBundle=(%@) supportedRedNumPayloads=(%@) }", a3->var0, a3->var4, a3->var5, a3->var6, a3->var7, a3->var8, a3->var9, a3->var10, a3->var1, a3->var2, a3->var3];
}

- (void)logTierPickerConfig:(id *)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int var0 = a3->var0;
      uint64_t var4 = a3->var4;
      BOOL var5 = a3->var5;
      BOOL var6 = a3->var6;
      uint64_t var7 = a3->var7;
      BOOL var8 = a3->var8;
      BOOL var9 = a3->var9;
      BOOL var10 = a3->var10;
      var2 = a3->var2;
      var3 = a3->var3;
      *(_DWORD *)buf = 136318210;
      uint64_t v30 = v4;
      __int16 v31 = 2080;
      v32 = "-[VCAudioTierPicker logTierPickerConfig:]";
      __int16 v33 = 1024;
      int v34 = 241;
      __int16 v35 = 1024;
      *(_DWORD *)v36 = var0;
      *(_WORD *)&v36[4] = 2048;
      *(void *)&v36[6] = var4;
      __int16 v37 = 1024;
      BOOL v38 = var5;
      __int16 v39 = 1024;
      BOOL v40 = var6;
      __int16 v41 = 2048;
      uint64_t v42 = var7;
      __int16 v43 = 1024;
      BOOL v44 = var8;
      __int16 v45 = 1024;
      BOOL v46 = var9;
      __int16 v47 = 1024;
      BOOL v48 = var10;
      __int16 v49 = 2112;
      v50 = var2;
      __int16 v51 = 2112;
      v52 = var3;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d { VCAudioTierPickerConfig: mode=%d headerSize=%lu usingCellular=%d isUseCaseWatchContinuity=%d defaultMaxCap=%lu alwaysOnAudioRedundancyEnabled=%d cellularAllowRedLowBitratesEnabled=%d wifiAllowRedLowBitratesEnabled=%d supportedPacketsPerBundle=(%@) supportedRedNumPayloads=(%@) }", buf, 0x68u);
    }
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  var1 = a3->var1;
  uint64_t v17 = [(__CFArray *)var1 countByEnumeratingWithState:&v25 objects:v24 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(var1);
        }
        uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v22 = VRTraceErrorLogLevelToCSTR();
          v23 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v30 = v22;
            __int16 v31 = 2080;
            v32 = "-[VCAudioTierPicker logTierPickerConfig:]";
            __int16 v33 = 1024;
            int v34 = 243;
            __int16 v35 = 2112;
            *(void *)v36 = v21;
            _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d  { VCAudioTierPickerConfig: supportedAudioPayloadConfig=(%@)}", buf, 0x26u);
          }
        }
      }
      uint64_t v18 = [(__CFArray *)var1 countByEnumeratingWithState:&v25 objects:v24 count:16];
    }
    while (v18);
  }
}

- (BOOL)setupTierPickerForConfig:(id *)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  int var0 = a3->var0;
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (!var0)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioTierPicker setupTierPickerForConfig:]();
      }
    }
    return 0;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    objc_super v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      long long v9 = *(_OWORD *)&a3->var2;
      *(_OWORD *)buf = *(_OWORD *)&a3->var0;
      *(_OWORD *)&buf[16] = v9;
      *(_OWORD *)&buf[32] = *(_OWORD *)&a3->var4;
      id v10 = [(VCAudioTierPicker *)self configToString:buf];
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCAudioTierPicker setupTierPickerForConfig:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 253;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v10;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting up Audio Tier Picker with config %@", buf, 0x26u);
    }
  }
  long long v11 = *(_OWORD *)&a3->var2;
  *(_OWORD *)buf = *(_OWORD *)&a3->var0;
  *(_OWORD *)&buf[16] = v11;
  *(_OWORD *)&buf[32] = *(_OWORD *)&a3->var4;
  [(VCAudioTierPicker *)self logTierPickerConfig:buf];
  long long v12 = *(_OWORD *)&a3->var0;
  long long v13 = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_config.headerSize = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_config.supportedPacketsPerBundle = v13;
  *(_OWORD *)&self->_config.int mode = v12;
  v14 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[__CFArray count](a3->var3, "count"));
  self->_tierTablesForRedNumPayloads = v14;
  if (!v14)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioTierPicker setupTierPickerForConfig:]();
      }
    }
    return 0;
  }
  v15 = [[BitrateLimits alloc] initWithOperatingMode:a3->var0 withBitrateCap:a3->var7 useCaseWatchContinuity:a3->var6];
  self->_bitrateLimits = v15;
  if (!v15)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioTierPicker setupTierPickerForConfig:]();
      }
    }
    return 0;
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  var3 = a3->var3;
  uint64_t v17 = [(__CFArray *)var3 countByEnumeratingWithState:&v68 objects:v67 count:16];
  p_cache = VCAudioRedBuilder.cache;
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v59 = *(void *)v69;
    v20 = (os_log_t *)MEMORY[0x1E4F47A50];
    v58 = var3;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v69 != v59) {
          objc_enumerationMutation(var3);
        }
        uint64_t v22 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        int v23 = [p_cache + 83 usePlistForAudioTierTableFromMode:a3->var0];
        int v24 = VRTraceGetErrorLogLevelForModule();
        if (v23)
        {
          if (v24 >= 7)
          {
            uint64_t v25 = VRTraceErrorLogLevelToCSTR();
            long long v26 = *v20;
            if (os_log_type_enabled(*v20, OS_LOG_TYPE_DEFAULT))
            {
              int v27 = a3->var0;
              BOOL var11 = a3->var11;
              BOOL var5 = a3->var5;
              uint64_t v30 = [v22 unsignedLongValue];
              *(_DWORD *)buf = 136316674;
              *(void *)&uint8_t buf[4] = v25;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "-[VCAudioTierPicker setupTierPickerForConfig:]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 284;
              *(_WORD *)&buf[28] = 1024;
              *(_DWORD *)&buf[30] = v27;
              p_cache = (void **)(VCAudioRedBuilder + 16);
              *(_WORD *)&buf[34] = 1024;
              *(_DWORD *)&buf[36] = var11;
              var3 = v58;
              *(_WORD *)&buf[40] = 1024;
              *(_DWORD *)&buf[42] = var5;
              v20 = (os_log_t *)MEMORY[0x1E4F47A50];
              *(_WORD *)&buf[46] = 2048;
              uint64_t v66 = v30;
              _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Using plist for audio tier table for config.mode=%d isIPv4=%{BOOL}d isCellular=%{BOOL}d redNumPayloads=%lu", buf, 0x38u);
            }
          }
          id v31 = -[VCAudioTierPicker generateAudioTiersDictFromPlistForBitrateLimits:tierPickerConfig:redNumPayloads:](self, "generateAudioTiersDictFromPlistForBitrateLimits:tierPickerConfig:redNumPayloads:", self->_bitrateLimits, a3, [v22 unsignedIntegerValue]);
          if (!v31)
          {
            int v51 = VRTraceGetErrorLogLevelForModule();
            if (v51 >= 3)
            {
              uint64_t v52 = VRTraceErrorLogLevelToCSTR();
              uint64_t v53 = *v20;
              if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
              {
                uint64_t v54 = [v22 unsignedLongValue];
                int v55 = a3->var0;
                *(_DWORD *)buf = 136316162;
                *(void *)&uint8_t buf[4] = v52;
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "-[VCAudioTierPicker setupTierPickerForConfig:]";
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)&buf[24] = 287;
                *(_WORD *)&buf[28] = 2048;
                *(void *)&buf[30] = v54;
                *(_WORD *)&buf[38] = 1024;
                *(_DWORD *)&buf[40] = v55;
                _os_log_error_impl(&dword_1E1EA4000, v53, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to load Audio Tier map from plist for redNumPayloads=%lu. config.mode=%d", buf, 0x2Cu);
              }
            }
            return 0;
          }
        }
        else
        {
          if (v24 >= 7)
          {
            uint64_t v32 = VRTraceErrorLogLevelToCSTR();
            __int16 v33 = *v20;
            if (os_log_type_enabled(*v20, OS_LOG_TYPE_DEFAULT))
            {
              int v34 = a3->var0;
              BOOL v35 = a3->var11;
              BOOL v36 = a3->var5;
              uint64_t v37 = [v22 unsignedLongValue];
              *(_DWORD *)buf = 136316674;
              *(void *)&uint8_t buf[4] = v32;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "-[VCAudioTierPicker setupTierPickerForConfig:]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 291;
              *(_WORD *)&buf[28] = 1024;
              *(_DWORD *)&buf[30] = v34;
              v20 = (os_log_t *)MEMORY[0x1E4F47A50];
              *(_WORD *)&buf[34] = 1024;
              *(_DWORD *)&buf[36] = v35;
              var3 = v58;
              *(_WORD *)&buf[40] = 1024;
              *(_DWORD *)&buf[42] = v36;
              p_cache = VCAudioRedBuilder.cache;
              *(_WORD *)&buf[46] = 2048;
              uint64_t v66 = v37;
              _os_log_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Using algorithm for audio tier table for config.mode=%d isIPv4=%{BOOL}d isCellular=%{BOOL}d redNumPayloads=%lu", buf, 0x38u);
            }
          }
          BOOL v38 = p_cache + 83;
          var1 = a3->var1;
          var2 = a3->var2;
          uint64_t v41 = [v22 unsignedIntegerValue];
          LOBYTE(v57) = a3->var6;
          uint64_t v42 = var2;
          p_cache = VCAudioRedBuilder.cache;
          id v31 = +[VCAudioTierPicker selectHighestQualityAudioTiers:forBitrateLimits:isHardLimit:](VCAudioTierPicker, "selectHighestQualityAudioTiers:forBitrateLimits:isHardLimit:", [v38 allPossibleCombinations:var1 supportedPacketsPerBundle:v42 redNumPayloads:v41 headerSize:a3->var4 tierPickerMode:a3->var0 usingCellular:a3->var5 useCaseWatchContinuity:v57], self->_bitrateLimits, a3->var0 == 6);
          if (!v31)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR)) {
                -[VCAudioTierPicker setupTierPickerForConfig:].cold.4();
              }
            }
            return 0;
          }
        }
        [(NSMutableDictionary *)self->_tierTablesForRedNumPayloads setObject:v31 forKeyedSubscript:v22];
      }
      uint64_t v19 = [(__CFArray *)var3 countByEnumeratingWithState:&v68 objects:v67 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
  [(VCAudioTierPicker *)self generateAudioPayloadsFromConfig:a3];
  if (([p_cache + 83 usePlistForAudioTierTableFromMode:a3->var0] & 1) == 0
    && !+[VCDefaults BOOLeanValueForKey:@"alwaysOnAudioRedundancyDisabled" defaultValue:!a3->var8])
  {
    [(VCAudioTierPicker *)self setupAlwaysOnRedTiersForSupportedRed:a3->var3 usingCellular:a3->var5];
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  __int16 v43 = a3->var3;
  uint64_t v44 = [(__CFArray *)v43 countByEnumeratingWithState:&v61 objects:v60 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v62;
    do
    {
      for (uint64_t j = 0; j != v45; ++j)
      {
        if (*(void *)v62 != v46) {
          objc_enumerationMutation(v43);
        }
        [(VCAudioTierPicker *)self printCreatedAudioTiers:[(NSMutableDictionary *)self->_tierTablesForRedNumPayloads objectForKeyedSubscript:*(void *)(*((void *)&v61 + 1) + 8 * j)]];
      }
      uint64_t v45 = [(__CFArray *)v43 countByEnumeratingWithState:&v61 objects:v60 count:16];
    }
    while (v45);
  }
  BOOL v48 = (void *)[(NSMutableDictionary *)self->_tierTablesForRedNumPayloads objectForKeyedSubscript:[(__CFArray *)a3->var3 objectAtIndexedSubscript:0]];
  self->_defaultTier = (VCAudioTier *)objc_msgSend(v48, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BitrateLimits defaultValueForNetwork:](self->_bitrateLimits, "defaultValueForNetwork:", a3->var5)));
  __int16 v49 = (void *)[(NSMutableDictionary *)self->_tierTablesForRedNumPayloads objectForKeyedSubscript:[(__CFArray *)a3->var3 objectAtIndexedSubscript:0]];
  BOOL v50 = 1;
  self->_fallbackTier = (VCAudioTier *)objc_msgSend(v49, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BitrateLimits defaultValueForNetwork:](self->_bitrateLimits, "defaultValueForNetwork:", 1)));
  return v50;
}

+ (int)tierPickerModeToAVConferenceOperatingMode:(unsigned __int8)a3
{
  if (a3 > 9u) {
    return 2;
  }
  else {
    return dword_1E25A1B80[(char)a3];
  }
}

+ (unsigned)operatingModeToTierPickerMode:(int)a3 isLowLatency:(BOOL)a4 preferPlistForTierTable:(BOOL)a5
{
  unsigned __int8 v5 = 7;
  switch(a3)
  {
    case 0:
    case 10:
      unsigned __int8 v5 = 0;
      break;
    case 1:
    case 4:
      if (a5) {
        unsigned __int8 v5 = 5;
      }
      else {
        unsigned __int8 v5 = 4;
      }
      BOOL v6 = !a4;
      char v7 = 9;
      goto LABEL_12;
    case 2:
      if (a5) {
        unsigned __int8 v5 = 3;
      }
      else {
        unsigned __int8 v5 = 2;
      }
      BOOL v6 = !a4;
      char v7 = 8;
LABEL_12:
      if (!v6) {
        unsigned __int8 v5 = v7;
      }
      break;
    case 3:
    case 5:
    case 8:
    case 9:
    case 11:
    case 12:
    case 13:
      unsigned __int8 v5 = 1;
      break;
    case 6:
      unsigned __int8 v5 = 6;
      break;
    default:
      return v5;
  }
  return v5;
}

- (void)setupAlwaysOnRedTiersForSupportedRed:(id)a3 usingCellular:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    if (-[NSArray containsObject:](-[BitrateLimits limits](self->_bitrateLimits, "limits"), "containsObject:", &unk_1F3DC56A0)&& (unint64_t)[a3 count] >= 2)
    {
      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 0)), "setObject:forKeyedSubscript:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 1)), "objectForKeyedSubscript:", &unk_1F3DC56A0), &unk_1F3DC56A0);
    }
    if (-[NSArray containsObject:](-[BitrateLimits limits](self->_bitrateLimits, "limits"), "containsObject:", &unk_1F3DC56B8)&& (unint64_t)[a3 count] >= 3)
    {
      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 0)), "setObject:forKeyedSubscript:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 2)), "objectForKeyedSubscript:", &unk_1F3DC56B8), &unk_1F3DC56B8);
      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 1)), "setObject:forKeyedSubscript:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 2)), "objectForKeyedSubscript:", &unk_1F3DC56B8), &unk_1F3DC56B8);
    }
    if (-[NSArray containsObject:](-[BitrateLimits limits](self->_bitrateLimits, "limits"), "containsObject:", &unk_1F3DC56D0)&& (unint64_t)[a3 count] >= 4)
    {
      tierTablesForRedNumPayloads = self->_tierTablesForRedNumPayloads;
      if (v4)
      {
        objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 0)), "setObject:forKeyedSubscript:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 2)), "objectForKeyedSubscript:", &unk_1F3DC56D0), &unk_1F3DC56D0);
        objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 1)), "setObject:forKeyedSubscript:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 2)), "objectForKeyedSubscript:", &unk_1F3DC56D0), &unk_1F3DC56D0);
        uint64_t v8 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 3)), "objectForKeyedSubscript:", &unk_1F3DC56B8);
        long long v9 = self->_tierTablesForRedNumPayloads;
        id v10 = a3;
        uint64_t v11 = 3;
      }
      else
      {
        objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 0)), "setObject:forKeyedSubscript:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 3)), "objectForKeyedSubscript:", &unk_1F3DC56D0), &unk_1F3DC56D0);
        objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 1)), "setObject:forKeyedSubscript:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 3)), "objectForKeyedSubscript:", &unk_1F3DC56D0), &unk_1F3DC56D0);
        uint64_t v8 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 3)), "objectForKeyedSubscript:", &unk_1F3DC56D0);
        long long v9 = self->_tierTablesForRedNumPayloads;
        id v10 = a3;
        uint64_t v11 = 2;
      }
      long long v12 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", [v10 objectAtIndexedSubscript:v11]);
      [v12 setObject:v8 forKeyedSubscript:&unk_1F3DC56D0];
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAudioTierPicker setupAlwaysOnRedTiersForSupportedRed:usingCellular:]();
    }
  }
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCAudioTierPicker;
  [(VCAudioTierPicker *)&v3 dealloc];
}

+ (BOOL)arrayHasObject:(id)a3 withPayloadType:(int)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a3);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * v9) payload] == a4)
        {
          LOBYTE(v6) = 1;
          return v6;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v11 count:16];
      uint64_t v7 = v6;
      if (v6) {
        continue;
      }
      break;
    }
  }
  return v6;
}

+ (id)allPossibleCombinations:(id)a3 supportedPacketsPerBundle:(id)a4 redNumPayloads:(unsigned int)a5 headerSize:(unsigned int)a6 tierPickerMode:(unsigned __int8)a7 usingCellular:(BOOL)a8 useCaseWatchContinuity:(BOOL)a9
{
  BOOL v36 = a8;
  unsigned int v37 = a7;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v11 = +[VCAudioTierPicker arrayHasObject:withPayloadType:](VCAudioTierPicker, "arrayHasObject:withPayloadType:", a3, 97)|| +[VCAudioTierPicker arrayHasObject:withPayloadType:](VCAudioTierPicker, "arrayHasObject:withPayloadType:", a3, 98)|| +[VCAudioTierPicker arrayHasObject:a3 withPayloadType:108];
  BOOL v12 = +[VCAudioTierPicker arrayHasObject:a3 withPayloadType:119];
  BOOL v13 = +[VCAudioTierPicker arrayHasObject:a3 withPayloadType:108];
  unsigned int v31 = +[VCAudioTierPicker tierPickerModeToAVConferenceOperatingMode:v37];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = a3;
  uint64_t v28 = [a3 countByEnumeratingWithState:&v52 objects:v51 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v53;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v53 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v14;
        long long v15 = *(void **)(*((void *)&v52 + 1) + 8 * v14);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v30 = (id)[v15 supportedBitrates];
        uint64_t v34 = [v30 countByEnumeratingWithState:&v47 objects:v46 count:16];
        if (v34)
        {
          uint64_t v33 = *(void *)v48;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v48 != v33) {
                objc_enumerationMutation(v30);
              }
              uint64_t v35 = v16;
              uint64_t v17 = [*(id *)(*((void *)&v47 + 1) + 8 * v16) unsignedIntValue];
              memset(&v40[1], 170, 24);
              v40[0] = v15;
              LOBYTE(v40[1]) = +[VCAudioTier bundlingAppliedByCodecForPayload:mode:](VCAudioTier, "bundlingAppliedByCodecForPayload:mode:", [v15 payload], v31);
              HIDWORD(v40[1]) = v17;
              LODWORD(v40[2]) = 0;
              HIDWORD(v40[2]) = a5;
              v40[3] = a6;
              if (+[VCPayloadUtils canBundleExternallyForPayload:forBundlingScheme:operatingMode:](VCPayloadUtils, "canBundleExternallyForPayload:forBundlingScheme:operatingMode:", [v15 payload], 1, v31))
              {
                long long v44 = 0u;
                long long v45 = 0u;
                long long v42 = 0u;
                long long v43 = 0u;
                uint64_t v18 = [a4 countByEnumeratingWithState:&v42 objects:v41 count:16];
                if (v18)
                {
                  uint64_t v19 = v18;
                  uint64_t v20 = *(void *)v43;
                  do
                  {
                    for (uint64_t i = 0; i != v19; ++i)
                    {
                      if (*(void *)v43 != v20) {
                        objc_enumerationMutation(a4);
                      }
                      uint64_t v22 = [*(id *)(*((void *)&v42 + 1) + 8 * i) unsignedIntValue];
                      if ((!v12 || [v15 payload] != 106)
                        && (!v11 || [v15 payload] != 119)
                        && (!v13
                         || [v15 payload] != 97
                         && [v15 payload] != 98)
                        && (a9
                         || !+[VCAudioTierPicker shouldFilterTierForPayloadConfig:v15 bitRate:v17 packetsPerBundle:v22 mode:v37 redNumPayloads:a5 cellular:v36]))
                      {
                        LODWORD(v40[2]) = v22;
                        int v23 = [[VCAudioTier alloc] initWithConfig:v40];
                        [v39 addObject:v23];
                      }
                    }
                    uint64_t v19 = [a4 countByEnumeratingWithState:&v42 objects:v41 count:16];
                  }
                  while (v19);
                }
              }
              else if ((!v12 {
                      || [v15 payload] != 122
              }
                      && [v15 payload] != 121)
                     && (!v13
                      || [v15 payload] != 97
                      && [v15 payload] != 98))
              {
                LODWORD(v40[2]) = 1;
                int v24 = [[VCAudioTier alloc] initWithConfig:v40];
                [v39 addObject:v24];
              }
              uint64_t v16 = v35 + 1;
            }
            while (v35 + 1 != v34);
            uint64_t v34 = [v30 countByEnumeratingWithState:&v47 objects:v46 count:16];
          }
          while (v34);
        }
        uint64_t v14 = v29 + 1;
      }
      while (v29 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v52 objects:v51 count:16];
    }
    while (v28);
  }
  return v39;
}

+ (BOOL)usePlistForAudioTierTableFromMode:(unsigned __int8)a3
{
  BOOL result = 1;
  switch(a3)
  {
    case 3u:
    case 5u:
      CFStringRef v4 = @"usePlistForAudioTierTable";
      goto LABEL_4;
    case 6u:
      CFStringRef v4 = @"usePlistForAudioTierTableGFT";
LABEL_4:
      BOOL result = VCDefaults_GetBoolValueForKey(v4, 1);
      break;
    case 8u:
    case 9u:
      return result;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

+ (BOOL)isModeAudioOnly:(unsigned __int8)a3
{
  return a3 == 8 || (a3 & 0xFE) == 2;
}

+ (BOOL)isModeAudioVideo:(unsigned __int8)a3
{
  return a3 == 9 || (a3 & 0xFE) == 4;
}

+ (BOOL)isModeV2:(unsigned __int8)a3
{
  return a3 == 3 || a3 == 5;
}

+ (BOOL)isModeLowLatency:(unsigned __int8)a3
{
  return (a3 & 0xFE) == 8;
}

+ (BOOL)isModePlistSupported:(unsigned __int8)a3
{
  int v3 = a3;
  BOOL result = objc_msgSend(a1, "isU1ModeWithPlistSupport:");
  if (v3 == 6) {
    return 1;
  }
  return result;
}

+ (BOOL)isU1ModeWithPlistSupport:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  if (+[VCAudioTierPicker isModeV2:](VCAudioTierPicker, "isModeV2:")) {
    return 1;
  }

  return +[VCAudioTierPicker isModeLowLatency:v3];
}

- (id)generateAudioTiersDictFromPlistForBitrateLimits:(id)a3 tierPickerConfig:(id *)a4 redNumPayloads:(unsigned int)a5
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [+[VCDefaults sharedInstance] forceAudioPayload];
  uint64_t v9 = 45;
  if (!a4->var5) {
    uint64_t v9 = 46;
  }
  BOOL v47 = +[VCDefaults BOOLeanValueForKey:@"rateControlAllowRedLowBitrate" defaultValue:*(&a4->var0 + v9)];
  BOOL v46 = +[VCDefaults BOOLeanValueForKey:@"alwaysOnAudioRedundancyDisabled" defaultValue:!a4->var8];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v12 = v11;
  if (v10)
  {
    if (v11)
    {
      if (+[VCAudioTierPicker isModePlistSupported:a4->var0])
      {
        if (a4->var0 == 6) {
          BOOL v13 = @"AudioTiers_GFT";
        }
        else {
          BOOL v13 = @"AudioTiers_U1";
        }
        id v51 = [(VCAudioTierPicker *)self loadAudioTiersFromPlist:v13];
        if (v51)
        {
          long long v84 = 0u;
          long long v85 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          obuint64_t j = (id)[a3 limits];
          uint64_t v49 = [obj countByEnumeratingWithState:&v82 objects:v81 count:16];
          if (v49)
          {
            uint64_t v50 = *(void *)v83;
            while (1)
            {
              uint64_t v14 = 0;
LABEL_13:
              if (*(void *)v83 != v50) {
                objc_enumerationMutation(obj);
              }
              long long v15 = *(void **)(*((void *)&v82 + 1) + 8 * v14);
              [v12 removeAllObjects];
              if (a4->var0 == 6)
              {
                if (!+[VCAudioTierPicker loadVCAudioTierFromTierTable:bitrate:redNumPayloads:outEntryArray:](VCAudioTierPicker, "loadVCAudioTierFromTierTable:bitrate:redNumPayloads:outEntryArray:", v51, [v15 unsignedIntValue], a5, v12))
                {
                  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
                  if (ErrorLogLevelForModule >= 3)
                  {
                    uint64_t v36 = VRTraceErrorLogLevelToCSTR();
                    unsigned int v37 = *MEMORY[0x1E4F47A50];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
                    {
                      uint64_t v38 = [v15 integerValue];
                      int var0 = a4->var0;
                      *(_DWORD *)buf = 136316418;
                      uint64_t v54 = v36;
                      __int16 v55 = 2080;
                      uint64_t v56 = "-[VCAudioTierPicker generateAudioTiersDictFromPlistForBitrateLimits:tierPickerConfig:redNumPayloads:]";
                      __int16 v57 = 1024;
                      int v58 = 585;
                      __int16 v59 = 2048;
                      uint64_t v60 = v38;
                      __int16 v61 = 1024;
                      int v62 = var0;
                      __int16 v63 = 1024;
                      unsigned int v64 = a5;
                      uint64_t v32 = " [%s] %s:%d bitrateTier=%ld not found in plist for mode=%d redNumPayloads=%u";
                      uint64_t v33 = v37;
                      uint32_t v34 = 50;
                      goto LABEL_48;
                    }
                  }
                  goto LABEL_49;
                }
              }
              else if (!+[VCAudioTierPicker loadVCAudioTierFromTierTable:config:allowRedAtLowBitrate:alwaysOnAudioRedundancyDisabled:redNumPayloads:tierBitrate:outEntryArray:](VCAudioTierPicker, "loadVCAudioTierFromTierTable:config:allowRedAtLowBitrate:alwaysOnAudioRedundancyDisabled:redNumPayloads:tierBitrate:outEntryArray:", v51, a4, v47, v46, a5, [v15 integerValue], v12))
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  uint64_t v40 = VRTraceErrorLogLevelToCSTR();
                  uint64_t v41 = *MEMORY[0x1E4F47A50];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v42 = [v15 integerValue];
                    int v43 = a4->var0;
                    BOOL var11 = a4->var11;
                    BOOL var5 = a4->var5;
                    *(_DWORD *)buf = 136316930;
                    uint64_t v54 = v40;
                    __int16 v55 = 2080;
                    uint64_t v56 = "-[VCAudioTierPicker generateAudioTiersDictFromPlistForBitrateLimits:tierPickerConfig:redNumPayloads:]";
                    __int16 v57 = 1024;
                    int v58 = 589;
                    __int16 v59 = 2048;
                    uint64_t v60 = v42;
                    __int16 v61 = 1024;
                    int v62 = v43;
                    __int16 v63 = 1024;
                    unsigned int v64 = var11;
                    __int16 v65 = 1024;
                    BOOL v66 = var5;
                    __int16 v67 = 1024;
                    unsigned int v68 = a5;
                    uint64_t v32 = " [%s] %s:%d bitrateTier=%ld not found in plist for mode=%d isIPv4=%{BOOL}d celluar=%{BOOL}d redNumPayloads=%u";
                    uint64_t v33 = v41;
                    uint32_t v34 = 62;
                    goto LABEL_48;
                  }
                }
                goto LABEL_49;
              }
              if (v8 != 128)
              {
                long long v79 = 0u;
                long long v80 = 0u;
                long long v77 = 0u;
                long long v78 = 0u;
                uint64_t v16 = [v12 countByEnumeratingWithState:&v77 objects:v76 count:16];
                if (v16)
                {
                  uint64_t v17 = v16;
                  uint64_t v18 = *(void *)v78;
                  do
                  {
                    for (uint64_t i = 0; i != v17; ++i)
                    {
                      if (*(void *)v78 != v18) {
                        objc_enumerationMutation(v12);
                      }
                      [*(id *)(*((void *)&v77 + 1) + 8 * i) setPayload:v8];
                    }
                    uint64_t v17 = [v12 countByEnumeratingWithState:&v77 objects:v76 count:16];
                  }
                  while (v17);
                }
              }
              long long v74 = 0u;
              long long v75 = 0u;
              long long v72 = 0u;
              long long v73 = 0u;
              uint64_t v20 = [v12 countByEnumeratingWithState:&v72 objects:v71 count:16];
              if (!v20) {
                break;
              }
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v73;
LABEL_29:
              uint64_t v23 = 0;
              while (1)
              {
                if (*(void *)v73 != v22) {
                  objc_enumerationMutation(v12);
                }
                if ([(VCAudioTierPicker *)self addEntryMatchingPayloadToAudioTierMap:v10 config:a4 entry:*(void *)(*((void *)&v72 + 1) + 8 * v23) bitrateTier:v15 forcedPayload:v8])
                {
                  break;
                }
                if (v21 == ++v23)
                {
                  uint64_t v21 = [v12 countByEnumeratingWithState:&v72 objects:v71 count:16];
                  if (v21) {
                    goto LABEL_29;
                  }
                  goto LABEL_39;
                }
              }
              if (++v14 != v49) {
                goto LABEL_13;
              }
              uint64_t v49 = [obj countByEnumeratingWithState:&v82 objects:v81 count:16];
              if (!v49)
              {

                return v10;
              }
            }
LABEL_39:
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v25 = VRTraceErrorLogLevelToCSTR();
              long long v26 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
              {
                uint64_t v27 = [v15 integerValue];
                int v28 = a4->var0;
                BOOL v29 = a4->var11;
                BOOL v30 = a4->var5;
                int v31 = [(__CFArray *)a4->var1 count];
                *(_DWORD *)buf = 136317186;
                uint64_t v54 = v25;
                __int16 v55 = 2080;
                uint64_t v56 = "-[VCAudioTierPicker generateAudioTiersDictFromPlistForBitrateLimits:tierPickerConfig:redNumPayloads:]";
                __int16 v57 = 1024;
                int v58 = 611;
                __int16 v59 = 2048;
                uint64_t v60 = v27;
                __int16 v61 = 1024;
                int v62 = v28;
                __int16 v63 = 1024;
                unsigned int v64 = v29;
                __int16 v65 = 1024;
                BOOL v66 = v30;
                __int16 v67 = 1024;
                unsigned int v68 = a5;
                __int16 v69 = 1024;
                int v70 = v31;
                uint64_t v32 = " [%s] %s:%d No matching payload found for bitrateTier=%ld in plist for mode=%d isIPv4=%{BOOL}d cel"
                      "lular=%{BOOL}d redNumPayloads=%u supported payload count=%d";
                uint64_t v33 = v26;
                uint32_t v34 = 68;
LABEL_48:
                _os_log_error_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);
              }
            }
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCAudioTierPicker generateAudioTiersDictFromPlistForBitrateLimits:tierPickerConfig:redNumPayloads:]();
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioTierPicker generateAudioTiersDictFromPlistForBitrateLimits:tierPickerConfig:redNumPayloads:].cold.4();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioTierPicker generateAudioTiersDictFromPlistForBitrateLimits:tierPickerConfig:redNumPayloads:]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAudioTierPicker generateAudioTiersDictFromPlistForBitrateLimits:tierPickerConfig:redNumPayloads:]();
    }
  }
LABEL_49:

  return 0;
}

- (BOOL)addEntryMatchingPayloadToAudioTierMap:(id)a3 config:(id *)a4 entry:(id)a5 bitrateTier:(id)a6 forcedPayload:(int)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  var1 = a4->var1;
  uint64_t v12 = -[__CFArray countByEnumeratingWithState:objects:count:](var1, "countByEnumeratingWithState:objects:count:", &v30, v29, 16, a6, *(void *)&a7);
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
    while (2)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(var1);
        }
        uint64_t v16 = *(void **)(*((void *)&v30 + 1) + 8 * v15);
        int v17 = [v16 payload];
        if (v17 == [a5 payload])
        {
          BOOL v23 = +[VCAudioTier bundlingAppliedByCodecForPayload:mode:](VCAudioTier, "bundlingAppliedByCodecForPayload:mode:", objc_msgSend(a5, "payload", v16, 0xAAAAAAAAAAAAAAAALL), +[VCAudioTierPicker tierPickerModeToAVConferenceOperatingMode:](VCAudioTierPicker, "tierPickerModeToAVConferenceOperatingMode:", a4->var0));
          int v24 = [a5 codecBitrate];
          int v25 = [a5 packetsPerBundle];
          int v18 = [a5 redNumPayloads];
          unsigned int var4 = a4->var4;
          int v26 = v18;
          unsigned int v27 = var4;
          int v28 = VCPayloadUtils_ShortREDBitrateForPayload([a5 payload], 0);
          uint64_t v20 = [[VCAudioTier alloc] initWithConfig:&v22];
          [a3 setObject:v20 forKeyedSubscript:a6];

          LOBYTE(v12) = 1;
          return v12;
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v12 = [(__CFArray *)var1 countByEnumeratingWithState:&v30 objects:v29 count:16];
      uint64_t v13 = v12;
      if (v12) {
        continue;
      }
      break;
    }
  }
  return v12;
}

- (id)loadAudioTiersFromPlist:(id)a3
{
  if (!-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablePlist, "objectForKeyedSubscript:")) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tierTablePlist, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithContentsOfFile:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", a3, @"plist")), a3);
  }
  tierTablePlist = self->_tierTablePlist;

  return (id)[(NSMutableDictionary *)tierTablePlist objectForKeyedSubscript:a3];
}

+ (BOOL)isLowBitrateAudioTier:(unsigned int)a3
{
  return a3 < 0x5209;
}

+ (BOOL)isAlwaysOnRedAudioTier:(unsigned int)a3 redNumPayloads:(unsigned int)a4 usingCellular:(BOOL)a5
{
  BOOL v5 = a3 == 120000 && a4 == 0;
  if (v5 || a3 == 170000 && a4 < 2 || a3 == 220000 && a4 < 3 || a3 == 220000 && a4 == 3 && a5) {
    return 1;
  }
  BOOL v8 = a3 == 200000 && a4 == 0;
  return a3 == 267000 && a4 < 2 || v8;
}

+ (BOOL)loadVCAudioTierFromTierTable:(id)a3 config:(id *)a4 allowRedAtLowBitrate:(BOOL)a5 alwaysOnAudioRedundancyDisabled:(BOOL)a6 redNumPayloads:(unsigned int)a7 tierBitrate:(unsigned int)a8 outEntryArray:(id)a9
{
  BOOL v61 = a6;
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  if (!a9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v32 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v32) {
        return v32;
      }
      +[VCAudioTierPicker loadVCAudioTierFromTierTable:config:allowRedAtLowBitrate:alwaysOnAudioRedundancyDisabled:redNumPayloads:tierBitrate:outEntryArray:]();
    }
    goto LABEL_40;
  }
  BOOL v9 = a5;
  if ([a1 isModeAudioOnly:a4->var0]) {
    uint64_t v12 = @"modeAudio";
  }
  else {
    uint64_t v12 = @"modeVideo";
  }
  uint64_t v13 = (void *)[a3 objectForKeyedSubscript:v12];
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v32 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v32) {
        return v32;
      }
      +[VCAudioTierPicker loadVCAudioTierFromTierTable:config:allowRedAtLowBitrate:alwaysOnAudioRedundancyDisabled:redNumPayloads:tierBitrate:outEntryArray:]();
    }
    goto LABEL_40;
  }
  if (a4->var11) {
    uint64_t v14 = @"IPv4";
  }
  else {
    uint64_t v14 = @"IPv6";
  }
  uint64_t v15 = (void *)[v13 objectForKeyedSubscript:v14];
  if (!v15)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_40;
    }
    uint64_t v41 = VRTraceErrorLogLevelToCSTR();
    uint64_t v42 = *MEMORY[0x1E4F47A50];
    BOOL v32 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v32) {
      return v32;
    }
    int var0 = a4->var0;
    BOOL var11 = a4->var11;
    *(_DWORD *)buf = 136316162;
    uint64_t v70 = v41;
    __int16 v71 = 2080;
    long long v72 = "+[VCAudioTierPicker loadVCAudioTierFromTierTable:config:allowRedAtLowBitrate:alwaysOnAudioRedundancyDisabled:r"
          "edNumPayloads:tierBitrate:outEntryArray:]";
    __int16 v73 = 1024;
    int v74 = 713;
    __int16 v75 = 1024;
    int v76 = var0;
    __int16 v77 = 1024;
    BOOL v78 = var11;
    uint64_t v38 = " [%s] %s:%d No tier table entry for mode=%d and isIPv4=%{BOOL}d";
    id v39 = v42;
    uint32_t v40 = 40;
LABEL_39:
    _os_log_error_impl(&dword_1E1EA4000, v39, OS_LOG_TYPE_ERROR, v38, buf, v40);
LABEL_40:
    LOBYTE(v32) = 0;
    return v32;
  }
  if (a4->var5) {
    uint64_t v16 = @"cellular";
  }
  else {
    uint64_t v16 = @"WiFi";
  }
  int v17 = (void *)[v15 objectForKeyedSubscript:v16];
  if (!v17)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_40;
    }
    uint64_t v45 = VRTraceErrorLogLevelToCSTR();
    BOOL v46 = *MEMORY[0x1E4F47A50];
    BOOL v32 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v32) {
      return v32;
    }
    int v47 = a4->var0;
    BOOL v48 = a4->var11;
    BOOL var5 = a4->var5;
    *(_DWORD *)buf = 136316418;
    uint64_t v70 = v45;
    __int16 v71 = 2080;
    long long v72 = "+[VCAudioTierPicker loadVCAudioTierFromTierTable:config:allowRedAtLowBitrate:alwaysOnAudioRedundancyDisabled:r"
          "edNumPayloads:tierBitrate:outEntryArray:]";
    __int16 v73 = 1024;
    int v74 = 715;
    __int16 v75 = 1024;
    int v76 = v47;
    __int16 v77 = 1024;
    BOOL v78 = v48;
    __int16 v79 = 1024;
    BOOL v80 = var5;
    uint64_t v38 = " [%s] %s:%d No tier table entry for mode=%d and isIPv4=%{BOOL}d cellular=%{BOOL}d";
    id v39 = v46;
    uint32_t v40 = 46;
    goto LABEL_39;
  }
  int v18 = (void *)[v17 objectForKeyedSubscript:@"redNumPayloads"];
  uint64_t v19 = objc_msgSend(v18, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(NSNumber, "numberWithUnsignedInt:", a7), "stringValue"));
  if (!v19)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_40;
    }
    uint64_t v50 = VRTraceErrorLogLevelToCSTR();
    id v51 = *MEMORY[0x1E4F47A50];
    BOOL v32 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v32) {
      return v32;
    }
    int v52 = a4->var0;
    BOOL v53 = a4->var11;
    BOOL v54 = a4->var5;
    *(_DWORD *)buf = 136316674;
    uint64_t v70 = v50;
    __int16 v71 = 2080;
    long long v72 = "+[VCAudioTierPicker loadVCAudioTierFromTierTable:config:allowRedAtLowBitrate:alwaysOnAudioRedundancyDisabled:r"
          "edNumPayloads:tierBitrate:outEntryArray:]";
    __int16 v73 = 1024;
    int v74 = 717;
    __int16 v75 = 1024;
    int v76 = v52;
    __int16 v77 = 1024;
    BOOL v78 = v53;
    __int16 v79 = 1024;
    BOOL v80 = v54;
    __int16 v81 = 1024;
    unsigned int v82 = a7;
    uint64_t v38 = " [%s] %s:%d No tier table entry for mode=%d and isIPv4=%{BOOL}d cellular=%{BOOL}d redNumPayloads=%u";
    id v39 = v51;
    uint32_t v40 = 52;
    goto LABEL_39;
  }
  uint64_t v20 = (void *)[v19 objectForKeyedSubscript:@"bitrateTier"];
  uint64_t v21 = objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(NSNumber, "numberWithUnsignedInt:", a8), "stringValue")), "objectForKeyedSubscript:", @"payloads");
  if (!v21)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_40;
    }
    uint64_t v55 = VRTraceErrorLogLevelToCSTR();
    uint64_t v34 = *MEMORY[0x1E4F47A50];
    BOOL v32 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v32) {
      return v32;
    }
    int v56 = a4->var0;
    BOOL v57 = a4->var11;
    BOOL v58 = a4->var5;
    *(_DWORD *)buf = 136316930;
    uint64_t v70 = v55;
    __int16 v71 = 2080;
    long long v72 = "+[VCAudioTierPicker loadVCAudioTierFromTierTable:config:allowRedAtLowBitrate:alwaysOnAudioRedundancyDisabled:r"
          "edNumPayloads:tierBitrate:outEntryArray:]";
    __int16 v73 = 1024;
    int v74 = 719;
    __int16 v75 = 1024;
    int v76 = v56;
    __int16 v77 = 1024;
    BOOL v78 = v57;
    __int16 v79 = 1024;
    BOOL v80 = v58;
    __int16 v81 = 1024;
    unsigned int v82 = a7;
    __int16 v83 = 1024;
    unsigned int v84 = a8;
    uint64_t v38 = " [%s] %s:%d No payloads array for mode=%d and isIPv4=%{BOOL}d cellular=%{BOOL}d redNumPayloads=%u tierBitrate=%u";
LABEL_38:
    id v39 = v34;
    uint32_t v40 = 58;
    goto LABEL_39;
  }
  uint64_t v22 = v21;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v23 = [v21 countByEnumeratingWithState:&v65 objects:v64 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v60 = a4;
    uint64_t v25 = *(void *)v66;
LABEL_18:
    uint64_t v26 = 0;
    while (1)
    {
      if (*(void *)v66 != v25) {
        objc_enumerationMutation(v22);
      }
      if ((unsigned int v27 = *(void **)(*((void *)&v65 + 1) + 8 * v26), v9)
        && +[VCAudioTierPicker isLowBitrateAudioTier:a8]
        || v61
        && +[VCAudioTierPicker isAlwaysOnRedAudioTier:a8 redNumPayloads:a7 usingCellular:v60->var5])
      {
        int v28 = objc_msgSend(v27, "mutableCopy", v60);
        objc_msgSend(v28, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", a7), @"redNumPayloads");
      }
      else
      {
        int v28 = 0;
      }
      BOOL v29 = [VCAudioTierPickerPlistEntry alloc];
      long long v30 = v28 ? v28 : v27;
      long long v31 = -[VCAudioTierPickerPlistEntry initWithDictionary:](v29, "initWithDictionary:", v30, v60);

      if (!v31) {
        break;
      }
      [a9 addObject:v31];

      if (v24 == ++v26)
      {
        uint64_t v24 = [v22 countByEnumeratingWithState:&v65 objects:v64 count:16];
        if (v24) {
          goto LABEL_18;
        }
        goto LABEL_33;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_40;
    }
    uint64_t v33 = VRTraceErrorLogLevelToCSTR();
    uint64_t v34 = *MEMORY[0x1E4F47A50];
    BOOL v32 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (v32)
    {
      int v35 = v60->var0;
      BOOL v36 = v60->var11;
      BOOL v37 = v60->var5;
      *(_DWORD *)buf = 136316930;
      uint64_t v70 = v33;
      __int16 v71 = 2080;
      long long v72 = "+[VCAudioTierPicker loadVCAudioTierFromTierTable:config:allowRedAtLowBitrate:alwaysOnAudioRedundancyDisabled"
            ":redNumPayloads:tierBitrate:outEntryArray:]";
      __int16 v73 = 1024;
      int v74 = 731;
      __int16 v75 = 1024;
      int v76 = v35;
      __int16 v77 = 1024;
      BOOL v78 = v36;
      __int16 v79 = 1024;
      BOOL v80 = v37;
      __int16 v81 = 1024;
      unsigned int v82 = a7;
      __int16 v83 = 1024;
      unsigned int v84 = a8;
      uint64_t v38 = " [%s] %s:%d Invalid entry in tier dictionary for mode=%d and isIPv4=%{BOOL}d cellular=%{BOOL}d redNumPayload"
            "s=%u tierBitrate=%u";
      goto LABEL_38;
    }
  }
  else
  {
LABEL_33:
    LOBYTE(v32) = 1;
  }
  return v32;
}

+ (BOOL)loadVCAudioTierFromTierTable:(id)a3 bitrate:(unsigned int)a4 redNumPayloads:(unsigned int)a5 outEntryArray:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!a6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCAudioTierPicker loadVCAudioTierFromTierTable:bitrate:redNumPayloads:outEntryArray:]();
      }
    }
    goto LABEL_26;
  }
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  BOOL v9 = (void *)[a3 objectForKeyedSubscript:@"networkBitrate"];
  id v10 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(NSNumber, "numberWithUnsignedInt:", v8), "stringValue")), "objectForKeyedSubscript:", @"redNumPayloads");
  id v11 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(NSNumber, "numberWithUnsignedInt:", v7), "stringValue")), "mutableCopy");
  if (!v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      uint64_t v26 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v34 = v25;
        __int16 v35 = 2080;
        BOOL v36 = "+[VCAudioTierPicker loadVCAudioTierFromTierTable:bitrate:redNumPayloads:outEntryArray:]";
        __int16 v37 = 1024;
        int v38 = 751;
        __int16 v39 = 1024;
        int v40 = v8;
        __int16 v41 = 1024;
        int v42 = v7;
        _os_log_error_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_ERROR, " [%s] %s:%d No tier table entry for bitrate=%u redNumPayloads=%u", buf, 0x28u);
      }
    }
LABEL_26:
    uint64_t v12 = 0;
LABEL_17:
    BOOL v21 = 0;
    goto LABEL_19;
  }
  uint64_t v12 = v11;
  uint64_t v13 = (void *)[v11 objectForKeyedSubscript:@"payloads"];
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCAudioTierPicker loadVCAudioTierFromTierTable:bitrate:redNumPayloads:outEntryArray:]();
      }
    }
    goto LABEL_17;
  }
  uint64_t v14 = v13;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    int v27 = v8;
    uint64_t v17 = *(void *)v30;
LABEL_6:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v30 != v17) {
        objc_enumerationMutation(v14);
      }
      uint64_t v19 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * v18) mutableCopy];
      objc_msgSend(v19, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v7), @"redNumPayloads");
      uint64_t v20 = [[VCAudioTierPickerPlistEntry alloc] initWithDictionary:v19];

      if (!v20) {
        break;
      }
      [a6 addObject:v20];

      if (v16 == ++v18)
      {
        uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v28 count:16];
        if (v16) {
          goto LABEL_6;
        }
        BOOL v21 = 1;
        goto LABEL_19;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    {
      BOOL v21 = 0;
      goto LABEL_19;
    }
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    uint64_t v23 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v34 = v22;
      __int16 v35 = 2080;
      BOOL v36 = "+[VCAudioTierPicker loadVCAudioTierFromTierTable:bitrate:redNumPayloads:outEntryArray:]";
      __int16 v37 = 1024;
      int v38 = 762;
      __int16 v39 = 1024;
      int v40 = v27;
      __int16 v41 = 1024;
      int v42 = v7;
      _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid entry in tier dictionary for bitrate=%u redNumPayloads=%u", buf, 0x28u);
    }
    goto LABEL_17;
  }
  BOOL v21 = 1;
LABEL_19:

  return v21;
}

+ (id)selectHighestQualityAudioTiers:(id)a3 forBitrateLimits:(id)a4 isHardLimit:(BOOL)a5
{
  BOOL v37 = a5;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  obuint64_t j = (id)[a4 limits];
  uint64_t v32 = [obj countByEnumeratingWithState:&v69 objects:v68 count:16];
  if (!v32) {
    return v34;
  }
  uint64_t v31 = *(void *)v70;
LABEL_3:
  uint64_t v5 = 0;
LABEL_4:
  if (*(void *)v70 != v31) {
    objc_enumerationMutation(obj);
  }
  __int16 v39 = *(void **)(*((void *)&v69 + 1) + 8 * v5);
  uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "limits"), "lastObject"), "integerValue");
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  uint64_t v40 = [a3 countByEnumeratingWithState:&v64 objects:v63 count:16];
  if (v40)
  {
    uint64_t v35 = v5;
    uint64_t v7 = 0;
    uint64_t v38 = *(void *)v65;
    int v41 = v6;
    while (1)
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v65 != v38) {
          objc_enumerationMutation(a3);
        }
        BOOL v9 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend(v9, "payloadConfig"), "qualityForBitRate:", objc_msgSend(v9, "audioCodecBitrate"));
        float v11 = v10;
        int v12 = [v39 integerValue];
        if (!v37 || (int)[v9 networkBitrate] <= v12)
        {
          double v13 = v11;
          int v14 = v12 - [v9 networkBitrate];
          if (v14 >= 0) {
            int v15 = v14;
          }
          else {
            int v15 = -v14;
          }
          uint64_t v16 = v6;
          uint64_t v17 = v7;
          BOOL v18 = v15 + (int)((1.0 - v13) * (double)v12 * 0.5) < (int)v6 || v7 == 0;
          uint64_t v7 = v9;
          uint64_t v19 = (v15 + (int)((1.0 - v13) * (double)v12 * 0.5));
          int v20 = v15;
          BOOL v21 = " new";
          if (v18) {
            goto LABEL_31;
          }
          if (v15 >= v41)
          {
            uint64_t v7 = v17;
          }
          else
          {
            uint64_t v7 = v17;
            if (objc_msgSend((id)objc_msgSend(v17, "payloadConfig"), "isEqual:", objc_msgSend(v9, "payloadConfig")))
            {
              unsigned int v22 = [v7 audioCodecBitrate];
              unsigned int v23 = [v9 audioCodecBitrate];
              BOOL v24 = v22 >= v23;
              if (v22 >= v23)
              {
                int v20 = v41;
              }
              else
              {
                uint64_t v7 = v9;
                int v20 = v15;
              }
              if (v24) {
                BOOL v21 = "";
              }
              else {
                BOOL v21 = " new";
              }
              uint64_t v19 = v16;
              goto LABEL_31;
            }
          }
          uint64_t v19 = v16;
          int v20 = v41;
          BOOL v21 = "";
LABEL_31:
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            uint64_t v42 = VRTraceErrorLogLevelToCSTR();
            uint64_t v25 = *MEMORY[0x1E4F47A50];
            uint64_t v26 = *MEMORY[0x1E4F47A50];
            if (*MEMORY[0x1E4F47A40])
            {
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v27 = objc_msgSend((id)objc_msgSend(v9, "description"), "UTF8String");
                *(_DWORD *)buf = 136317442;
                uint64_t v44 = v42;
                __int16 v45 = 2080;
                BOOL v46 = "+[VCAudioTierPicker selectHighestQualityAudioTiers:forBitrateLimits:isHardLimit:]";
                __int16 v47 = 1024;
                int v48 = 815;
                __int16 v49 = 1024;
                int v50 = v12;
                __int16 v51 = 2080;
                uint64_t v52 = v27;
                __int16 v53 = 2048;
                double v54 = v13;
                __int16 v55 = 1024;
                int v56 = (int)((1.0 - v13) * (double)v12 * 0.5);
                __int16 v57 = 1024;
                int v58 = v15;
                __int16 v59 = 1024;
                int v60 = v15 + v56;
                __int16 v61 = 2080;
                int v62 = v21;
                _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AudioTierSelection %d: %s quality[%f] diff=%d+%d=%d)%s", buf, 0x52u);
              }
            }
            else if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v28 = objc_msgSend((id)objc_msgSend(v9, "description"), "UTF8String");
              *(_DWORD *)buf = 136317442;
              uint64_t v44 = v42;
              __int16 v45 = 2080;
              BOOL v46 = "+[VCAudioTierPicker selectHighestQualityAudioTiers:forBitrateLimits:isHardLimit:]";
              __int16 v47 = 1024;
              int v48 = 815;
              __int16 v49 = 1024;
              int v50 = v12;
              __int16 v51 = 2080;
              uint64_t v52 = v28;
              __int16 v53 = 2048;
              double v54 = v13;
              __int16 v55 = 1024;
              int v56 = (int)((1.0 - v13) * (double)v12 * 0.5);
              __int16 v57 = 1024;
              int v58 = v15;
              __int16 v59 = 1024;
              int v60 = v15 + v56;
              __int16 v61 = 2080;
              int v62 = v21;
              _os_log_debug_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEBUG, " [%s] %s:%d AudioTierSelection %d: %s quality[%f] diff=%d+%d=%d)%s", buf, 0x52u);
            }
          }
          uint64_t v6 = v19;
          int v41 = v20;
          continue;
        }
      }
      uint64_t v40 = [a3 countByEnumeratingWithState:&v64 objects:v63 count:16];
      if (!v40)
      {
        if (!v7) {
          break;
        }
        [v34 setObject:v7 forKeyedSubscript:v39];
        uint64_t v5 = v35 + 1;
        if (v35 + 1 == v32)
        {
          uint64_t v32 = [obj countByEnumeratingWithState:&v69 objects:v68 count:16];
          if (!v32) {
            return v34;
          }
          goto LABEL_3;
        }
        goto LABEL_4;
      }
    }
  }

  return 0;
}

- (void)printCreatedAudioTiers:(id)a3
{
  id v3 = a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
  uint64_t v25 = self;
  BOOL v6 = +[VCAudioTierPicker usePlistForAudioTierTableFromMode:self->_config.mode];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v7 = (void *)[v5 reverseObjectEnumerator];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v39 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v41;
    *(void *)&long long v9 = 136316418;
    long long v24 = v9;
    do
    {
      uint64_t v12 = 0;
      uint64_t v26 = v10;
      do
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v7);
        }
        double v13 = *(void **)(*((void *)&v40 + 1) + 8 * v12);
        int v14 = objc_msgSend(v3, "objectForKeyedSubscript:", v13, v24);
        if ((v6
           || ([v13 integerValue] > 10000 || !objc_msgSend(v14, "redNumPayloads"))
           && ([v13 integerValue] > 16000 || objc_msgSend(v14, "redNumPayloads") <= 1)
           && ([v13 integerValue] > 21000 || objc_msgSend(v14, "redNumPayloads") <= 2))
          && (int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v15 = VRTraceErrorLogLevelToCSTR();
          uint64_t v16 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v17 = v11;
            BOOL v18 = v6;
            id v19 = v3;
            int v20 = v7;
            if (+[VCAudioTierPicker isModeAudioVideo:v25->_config.mode])
            {
              BOOL v21 = "Video";
            }
            else
            {
              BOOL v21 = "Audio";
            }
            int v22 = [v13 integerValue];
            uint64_t v23 = objc_msgSend((id)objc_msgSend(v14, "description"), "UTF8String");
            *(_DWORD *)buf = v24;
            uint64_t v28 = v15;
            __int16 v29 = 2080;
            long long v30 = "-[VCAudioTierPicker printCreatedAudioTiers:]";
            __int16 v31 = 1024;
            int v32 = 846;
            __int16 v33 = 2080;
            id v34 = v21;
            uint64_t v7 = v20;
            id v3 = v19;
            BOOL v6 = v18;
            uint64_t v11 = v17;
            uint64_t v10 = v26;
            __int16 v35 = 1024;
            int v36 = v22;
            __int16 v37 = 2080;
            uint64_t v38 = v23;
            _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d (%s) %d: %s", buf, 0x36u);
          }
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v7 countByEnumeratingWithState:&v40 objects:v39 count:16];
    }
    while (v10);
  }
}

+ (BOOL)shouldFilterTierForPayloadConfig:(id)a3 bitRate:(unsigned int)a4 packetsPerBundle:(unsigned int)a5 mode:(unsigned __int8)a6 redNumPayloads:(unsigned int)a7 cellular:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v9 = a6;
  int v14 = [a3 payload];
  if (v14 == 104)
  {
    if (a4 >> 5 < 0x271) {
      return 1;
    }
  }
  else if (v14 == 119)
  {
    if (a4 >> 6 > 0x176) {
      return 1;
    }
  }
  else if (v14 == 106 && a4 - 20001 < 0xFFFFE0BF)
  {
    return 1;
  }
  if (v9 != 6)
  {
    if (v8)
    {
      if (a5 >= 3) {
        return 0;
      }
    }
    else if (a4 >> 5 > 0x270 || a5 >= 3)
    {
      int v18 = [a3 payload];
      switch(v18)
      {
        case 'w':
          if (a5 == 3) {
            return 0;
          }
          break;
        case 'h':
          if (a5 != 3) {
            return 0;
          }
          break;
        case 'e':
          char v19 = [a1 isModeLowLatency:v9];
          if (a5 < 2 || (v19 & 1) == 0) {
            return 0;
          }
          break;
        default:
          return 0;
      }
    }
    return 1;
  }
  int v15 = [a3 payload];
  return a4 >> 4 < 0x753 && v15 == 104;
}

+ (id)valueForNetworkBitrate:(id)a3 networkBitrate:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v6 = objc_msgSend((id)objc_msgSend(a3, "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
  unint64_t v7 = [v6 count] - 1;
  unint64_t v8 = +[VCArrayUtils insertionIndexForValue:array:](VCArrayUtils, "insertionIndexForValue:array:", [NSNumber numberWithUnsignedInt:v4], v6);
  if (v7 >= v8) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = v7;
  }
  uint64_t v10 = [v6 objectAtIndexedSubscript:v9];

  return (id)[a3 objectForKeyedSubscript:v10];
}

- (id)tierForNetworkBitrate:(unint64_t)a3 withLegacyDuplication:(int)a4
{
  v64[8] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 100;
  uint64_t v7 = 150;
  if (a4 != 150) {
    uint64_t v7 = 100;
  }
  if (a4 == 200) {
    uint64_t v8 = 200;
  }
  else {
    uint64_t v8 = v7;
  }
  BOOL v9 = +[VCAudioTierPicker isModeAudioOnly:self->_config.mode];
  int v10 = self->_config.mode == 7 || v9;
  BOOL v11 = v10 == 0;
  unint64_t v12 = 100000;
  if (!v11) {
    unint64_t v12 = 20000;
  }
  if (v12 < a3) {
    uint64_t v6 = v8;
  }
  if (+[VCAudioTierPicker isModeAudioVideo:](VCAudioTierPicker, "isModeAudioVideo:"))
  {
    v61[0] = &unk_1F3DC5880;
    v61[1] = &unk_1F3DC5898;
    v62[0] = &unk_1F3DC5730;
    v62[1] = &unk_1F3DC5730;
    v61[2] = &unk_1F3DC58B0;
    v62[2] = &unk_1F3DC5730;
    v63[0] = &unk_1F3DC5868;
    v64[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:3];
    v63[1] = &unk_1F3DC58C8;
    v59[0] = &unk_1F3DC5880;
    v59[1] = &unk_1F3DC5898;
    v60[0] = &unk_1F3DC5748;
    v60[1] = &unk_1F3DC5748;
    v59[2] = &unk_1F3DC58B0;
    v60[2] = &unk_1F3DC5748;
    v64[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:3];
    v63[2] = &unk_1F3DC5850;
    v57[0] = &unk_1F3DC5880;
    v57[1] = &unk_1F3DC5898;
    v58[0] = &unk_1F3DC57D8;
    v58[1] = &unk_1F3DC57D8;
    v57[2] = &unk_1F3DC58B0;
    v58[2] = &unk_1F3DC57D8;
    v64[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:3];
    v63[3] = &unk_1F3DC58E0;
    v55[0] = &unk_1F3DC5880;
    v55[1] = &unk_1F3DC5898;
    v56[0] = &unk_1F3DC57F0;
    v56[1] = &unk_1F3DC57F0;
    v55[2] = &unk_1F3DC58B0;
    v56[2] = &unk_1F3DC57F0;
    v64[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:3];
    v63[4] = &unk_1F3DC58F8;
    v53[0] = &unk_1F3DC5880;
    v53[1] = &unk_1F3DC5898;
    v54[0] = &unk_1F3DC5808;
    v54[1] = &unk_1F3DC5808;
    v53[2] = &unk_1F3DC58B0;
    v54[2] = &unk_1F3DC5808;
    v64[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:3];
    v63[5] = &unk_1F3DC5910;
    v51[0] = &unk_1F3DC5880;
    v51[1] = &unk_1F3DC5898;
    v52[0] = &unk_1F3DC5820;
    v52[1] = &unk_1F3DC5820;
    v51[2] = &unk_1F3DC58B0;
    v52[2] = &unk_1F3DC5820;
    v64[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:3];
    v63[6] = &unk_1F3DC5928;
    v49[0] = &unk_1F3DC5880;
    v49[1] = &unk_1F3DC5898;
    v50[0] = &unk_1F3DC5838;
    v50[1] = &unk_1F3DC5838;
    v49[2] = &unk_1F3DC58B0;
    v50[2] = &unk_1F3DC5838;
    v64[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:3];
    v63[7] = &unk_1F3DC5940;
    v47[0] = &unk_1F3DC5880;
    v47[1] = &unk_1F3DC5898;
    v48[0] = &unk_1F3DC5850;
    v48[1] = &unk_1F3DC5850;
    v47[2] = &unk_1F3DC58B0;
    v48[2] = &unk_1F3DC5850;
    v64[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:3];
    id v13 = +[VCAudioTierPicker valueForNetworkBitrate:networkBitrate:](VCAudioTierPicker, "valueForNetworkBitrate:networkBitrate:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:8], a3);
    int v14 = objc_msgSend(v13, "objectForKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v6));
    int v15 = v14;
    if (self->_config.usingCellular && [v14 integerValue] > 32000) {
      int v15 = &unk_1F3DC5808;
    }
    goto LABEL_24;
  }
  if (self->_config.mode != 6)
  {
    v43[0] = &unk_1F3DC5880;
    v43[1] = &unk_1F3DC5898;
    v44[0] = &unk_1F3DC5730;
    v44[1] = &unk_1F3DC5730;
    v43[2] = &unk_1F3DC58B0;
    v44[2] = &unk_1F3DC5730;
    v45[0] = &unk_1F3DC5958;
    v46[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:3];
    v45[1] = &unk_1F3DC57D8;
    v41[0] = &unk_1F3DC5880;
    v41[1] = &unk_1F3DC5898;
    v42[0] = &unk_1F3DC5748;
    v42[1] = &unk_1F3DC5748;
    v41[2] = &unk_1F3DC58B0;
    v42[2] = &unk_1F3DC5748;
    v46[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:3];
    v45[2] = &unk_1F3DC58C8;
    v39[0] = &unk_1F3DC5880;
    v39[1] = &unk_1F3DC5898;
    v40[0] = &unk_1F3DC5760;
    v40[1] = &unk_1F3DC5760;
    v39[2] = &unk_1F3DC58B0;
    v40[2] = &unk_1F3DC5760;
    v46[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];
    v45[3] = &unk_1F3DC5838;
    v37[0] = &unk_1F3DC5880;
    v37[1] = &unk_1F3DC5898;
    v38[0] = &unk_1F3DC5790;
    v38[1] = &unk_1F3DC5778;
    v37[2] = &unk_1F3DC58B0;
    v38[2] = &unk_1F3DC5748;
    v46[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];
    v45[4] = &unk_1F3DC5850;
    v35[0] = &unk_1F3DC5880;
    v35[1] = &unk_1F3DC5898;
    v36[0] = &unk_1F3DC57A8;
    v36[1] = &unk_1F3DC5790;
    v35[2] = &unk_1F3DC58B0;
    v36[2] = &unk_1F3DC5778;
    v46[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];
    v45[5] = &unk_1F3DC5970;
    v33[0] = &unk_1F3DC5880;
    v33[1] = &unk_1F3DC5898;
    v34[0] = &unk_1F3DC57C0;
    v34[1] = &unk_1F3DC57A8;
    v33[2] = &unk_1F3DC58B0;
    v34[2] = &unk_1F3DC5790;
    v46[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
    id v17 = +[VCAudioTierPicker valueForNetworkBitrate:networkBitrate:](VCAudioTierPicker, "valueForNetworkBitrate:networkBitrate:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:6], a3);
    int v15 = objc_msgSend(v17, "objectForKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v6));
LABEL_24:
    uint64_t v16 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", &unk_1F3DC5988), "objectForKeyedSubscript:", v15);
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v16)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        int v20 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          if (+[VCAudioTierPicker isModeAudioVideo:self->_config.mode])
          {
            BOOL v21 = "video";
          }
          else
          {
            BOOL v21 = "audio";
          }
          *(_DWORD *)buf = 136316162;
          uint64_t v24 = v19;
          __int16 v25 = 2080;
          uint64_t v26 = "-[VCAudioTierPicker tierForNetworkBitrate:withLegacyDuplication:]";
          __int16 v27 = 1024;
          int v28 = 984;
          __int16 v29 = 2080;
          long long v30 = v21;
          __int16 v31 = 1024;
          int v32 = [v15 integerValue];
          _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d (%s) Using tier: %d", buf, 0x2Cu);
        }
      }
    }
    else
    {
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioTierPicker tierForNetworkBitrate:withLegacyDuplication:]();
        }
      }
      return self->_fallbackTier;
    }
    return v16;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAudioTierPicker tierForNetworkBitrate:withLegacyDuplication:]();
    }
  }
  return 0;
}

- (id)chooseMultiwayAudioTierForRedPayload:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x3052000000;
  id v17 = __Block_byref_object_copy__30;
  int v18 = __Block_byref_object_dispose__30;
  uint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:"));
  uint64_t v19 = objc_msgSend(v5, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BitrateLimits defaultValueForNetwork:](self->_bitrateLimits, "defaultValueForNetwork:", self->_config.usingCellular)));
  if ((int)a3 >= 1)
  {
    unsigned int v6 = a3 + 1;
    do
    {
      if (v15[5]) {
        break;
      }
      if (-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", [NSNumber numberWithInt:v6 - 2]))
      {
        uint64_t v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", [NSNumber numberWithInt:v6 - 2]);
        uint64_t v8 = objc_msgSend(v7, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BitrateLimits defaultValueForNetwork:](self->_bitrateLimits, "defaultValueForNetwork:", self->_config.usingCellular)));
        v15[5] = v8;
      }
      --v6;
    }
    while (v6 > 1);
  }
  BOOL v9 = (void *)v15[5];
  if (!v9)
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v13[3] = 0;
    tierTablesForRedNumPayloads = self->_tierTablesForRedNumPayloads;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__VCAudioTierPicker_chooseMultiwayAudioTierForRedPayload___block_invoke;
    v12[3] = &unk_1E6DB8828;
    v12[4] = self;
    v12[5] = &v14;
    v12[6] = v13;
    v12[7] = a3;
    [(NSMutableDictionary *)tierTablesForRedNumPayloads enumerateKeysAndObjectsUsingBlock:v12];
    _Block_object_dispose(v13, 8);
    BOOL v9 = (void *)v15[5];
  }
  _Block_object_dispose(&v14, 8);
  return v9;
}

uint64_t __58__VCAudioTierPicker_chooseMultiwayAudioTierForRedPayload___block_invoke(void *a1, void *a2, void *a3)
{
  if (*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    unsigned int v6 = a1 + 6;
    unint64_t v7 = *(void *)(*(void *)(a1[6] + 8) + 24) - a1[7];
    uint64_t result = [a2 unsignedIntegerValue];
    if (v7 <= result - a1[7]) {
      return result;
    }
    *(void *)(*(void *)(a1[5] + 8) + 40) = objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1[4] + 32), "defaultValueForNetwork:", *(unsigned __int8 *)(a1[4] + 76))));
    uint64_t result = [a2 unsignedIntegerValue];
  }
  else
  {
    *(void *)(*(void *)(a1[5] + 8) + 40) = objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1[4] + 32), "defaultValueForNetwork:", *(unsigned __int8 *)(a1[4] + 76))));
    uint64_t result = [a2 unsignedIntegerValue];
    unsigned int v6 = a1 + 6;
  }
  *(void *)(*(void *)(*v6 + 8) + 24) = result;
  return result;
}

- (id)tierForNetworkBitrate:(unint64_t)a3 withRedNumPayloads:(unint64_t)a4
{
  v15[9] = *MEMORY[0x1E4F143B8];
  id v7 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  if (+[VCAudioTierPicker isModeAudioVideo:self->_config.mode])
  {
    v14[0] = &unk_1F3DC5868;
    v14[1] = &unk_1F3DC58C8;
    v15[0] = &unk_1F3DC5730;
    v15[1] = &unk_1F3DC5748;
    v14[2] = &unk_1F3DC5850;
    v14[3] = &unk_1F3DC58E0;
    v15[2] = &unk_1F3DC57D8;
    v15[3] = &unk_1F3DC57F0;
    v14[4] = &unk_1F3DC58F8;
    v14[5] = &unk_1F3DC5910;
    v15[4] = &unk_1F3DC5808;
    v15[5] = &unk_1F3DC5820;
    v14[6] = &unk_1F3DC59A0;
    v14[7] = &unk_1F3DC5928;
    v15[6] = &unk_1F3DC5838;
    v15[7] = &unk_1F3DC5850;
    v14[8] = &unk_1F3DC5940;
    v15[8] = &unk_1F3DC56A0;
    uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
    BOOL v9 = v15;
    int v10 = v14;
LABEL_5:
    id v7 = +[VCAudioTierPicker valueForNetworkBitrate:networkBitrate:](VCAudioTierPicker, "valueForNetworkBitrate:networkBitrate:", [v8 dictionaryWithObjects:v9 forKeys:v10 count:9], a3);
    return -[VCAudioTierPicker tierForAudioBitrate:withRedNumPayloads:](self, "tierForAudioBitrate:withRedNumPayloads:", [v7 unsignedIntValue], a4);
  }
  if (self->_config.mode != 6)
  {
    v12[0] = &unk_1F3DC5958;
    v12[1] = &unk_1F3DC57D8;
    v13[0] = &unk_1F3DC5730;
    v13[1] = &unk_1F3DC5748;
    v12[2] = &unk_1F3DC58C8;
    v12[3] = &unk_1F3DC5838;
    v13[2] = &unk_1F3DC5760;
    v13[3] = &unk_1F3DC5790;
    v12[4] = &unk_1F3DC5850;
    v12[5] = &unk_1F3DC59B8;
    void v13[4] = &unk_1F3DC57A8;
    v13[5] = &unk_1F3DC57C0;
    v12[6] = &unk_1F3DC58F8;
    v12[7] = &unk_1F3DC59D0;
    v13[6] = &unk_1F3DC56A0;
    v13[7] = &unk_1F3DC56B8;
    void v12[8] = &unk_1F3DC5910;
    v13[8] = &unk_1F3DC56D0;
    uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
    BOOL v9 = v13;
    int v10 = v12;
    goto LABEL_5;
  }
  return -[VCAudioTierPicker tierForAudioBitrate:withRedNumPayloads:](self, "tierForAudioBitrate:withRedNumPayloads:", [v7 unsignedIntValue], a4);
}

- (id)tierForAudioBitrate:(unint64_t)a3 withRedNumPayloads:(unint64_t)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (self->_config.mode == 6)
  {
    id v7 = [(VCAudioTierPicker *)self chooseMultiwayAudioTierForRedPayload:a4];
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v7)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        int v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v42 = 136316162;
          uint64_t v43 = v9;
          __int16 v44 = 2080;
          __int16 v45 = "-[VCAudioTierPicker tierForAudioBitrate:withRedNumPayloads:]";
          __int16 v46 = 1024;
          int v47 = 1058;
          __int16 v48 = 1024;
          *(_DWORD *)__int16 v49 = a3;
          *(_WORD *)&v49[4] = 2112;
          *(void *)&v49[6] = v7;
          BOOL v11 = " [%s] %s:%d Tier for bitrate %d -> %@";
          unint64_t v12 = v10;
          uint32_t v13 = 44;
LABEL_39:
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v42, v13);
          return v7;
        }
      }
    }
    else
    {
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioTierPicker tierForAudioBitrate:withRedNumPayloads:]();
        }
      }
      return 0;
    }
    return v7;
  }
  uint64_t v14 = (void *)[NSNumber numberWithUnsignedInteger:a3];
  if (+[VCAudioTierPicker isModeAudioVideo:self->_config.mode]
    && a3 <= 0xA410
    && self->_config.usingCellular
    && [v14 integerValue] > 32000)
  {
    uint64_t v14 = &unk_1F3DC5808;
  }
  unint64_t v15 = [(VCAudioTierPicker *)self adjustedRedNumPayloadsForLowBitrateAudioTier:v14 redNumPayloads:a4];
  if (v15 >= 4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      id v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v42 = 136316162;
        uint64_t v43 = v16;
        __int16 v44 = 2080;
        __int16 v45 = "-[VCAudioTierPicker tierForAudioBitrate:withRedNumPayloads:]";
        __int16 v46 = 1024;
        int v47 = 1076;
        __int16 v48 = 1024;
        *(_DWORD *)__int16 v49 = v15;
        *(_WORD *)&v49[4] = 1024;
        *(_DWORD *)&v49[6] = 3;
        _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Cap exceeded for number of red payloads:%d using %d instead", (uint8_t *)&v42, 0x28u);
      }
    }
    unint64_t v15 = 3;
  }
  int v18 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInteger:v15]);
  if (!v18)
  {
    if (v15 <= 2) {
      int v19 = 2;
    }
    else {
      int v19 = v15;
    }
    LODWORD(v20) = v15;
    do
    {
      if (v19 == v20)
      {
        int v18 = 0;
        goto LABEL_32;
      }
      uint64_t v20 = (v20 + 1);
    }
    while (!-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v20]));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      int v22 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v42 = 136316162;
        uint64_t v43 = v21;
        __int16 v44 = 2080;
        __int16 v45 = "-[VCAudioTierPicker tierForAudioBitrate:withRedNumPayloads:]";
        __int16 v46 = 1024;
        int v47 = 1085;
        __int16 v48 = 1024;
        *(_DWORD *)__int16 v49 = v15;
        *(_WORD *)&v49[4] = 1024;
        *(_DWORD *)&v49[6] = v20;
        _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d RED value of %d is not supported. Next RED value: %d", (uint8_t *)&v42, 0x28u);
      }
    }
    int v18 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v20]);
  }
LABEL_32:
  id v23 = +[VCArrayUtils closestValueLessThanOrEqualToValue:array:](VCArrayUtils, "closestValueLessThanOrEqualToValue:array:", v14, objc_msgSend((id)objc_msgSend(v18, "allKeys"), "sortedArrayUsingSelector:", sel_compare_));
  uint64_t v24 = [v18 objectForKeyedSubscript:v23];
  if (!v24)
  {
    if ((VCAudioTierPicker *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return self->_fallbackTier;
      }
      uint64_t v32 = VRTraceErrorLogLevelToCSTR();
      __int16 v33 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return self->_fallbackTier;
      }
      fallbackTier = self->_fallbackTier;
      int v42 = 136316162;
      uint64_t v43 = v32;
      __int16 v44 = 2080;
      __int16 v45 = "-[VCAudioTierPicker tierForAudioBitrate:withRedNumPayloads:]";
      __int16 v46 = 1024;
      int v47 = 1096;
      __int16 v48 = 2048;
      *(void *)__int16 v49 = a3;
      *(_WORD *)&v49[8] = 2112;
      *(void *)&v49[10] = fallbackTier;
      __int16 v35 = " [%s] %s:%d No corresponding tier found for audioBitrate=%lu, using fallback=%@";
      int v36 = v33;
      uint32_t v37 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v31 = (__CFString *)[(VCAudioTierPicker *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v31 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return self->_fallbackTier;
      }
      uint64_t v38 = VRTraceErrorLogLevelToCSTR();
      __int16 v39 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return self->_fallbackTier;
      }
      long long v41 = self->_fallbackTier;
      int v42 = 136316674;
      uint64_t v43 = v38;
      __int16 v44 = 2080;
      __int16 v45 = "-[VCAudioTierPicker tierForAudioBitrate:withRedNumPayloads:]";
      __int16 v46 = 1024;
      int v47 = 1096;
      __int16 v48 = 2112;
      *(void *)__int16 v49 = v31;
      *(_WORD *)&v49[8] = 2048;
      *(void *)&v49[10] = self;
      *(_WORD *)&v49[18] = 2048;
      *(void *)int v50 = a3;
      *(_WORD *)&v50[8] = 2112;
      __int16 v51 = v41;
      __int16 v35 = " [%s] %s:%d %@(%p) No corresponding tier found for audioBitrate=%lu, using fallback=%@";
      int v36 = v39;
      uint32_t v37 = 68;
    }
    _os_log_error_impl(&dword_1E1EA4000, v36, OS_LOG_TYPE_ERROR, v35, (uint8_t *)&v42, v37);
    return self->_fallbackTier;
  }
  id v7 = (id)v24;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v25 = VRTraceErrorLogLevelToCSTR();
    uint64_t v26 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (+[VCAudioTierPicker isModeAudioVideo:self->_config.mode])
      {
        __int16 v27 = "video";
      }
      else
      {
        __int16 v27 = "audio";
      }
      int v28 = [v14 intValue];
      int v29 = [v23 intValue];
      uint64_t v30 = objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
      int v42 = 136316674;
      uint64_t v43 = v25;
      __int16 v44 = 2080;
      __int16 v45 = "-[VCAudioTierPicker tierForAudioBitrate:withRedNumPayloads:]";
      __int16 v46 = 1024;
      int v47 = 1103;
      __int16 v48 = 2080;
      *(void *)__int16 v49 = v27;
      *(_WORD *)&v49[8] = 1024;
      *(_DWORD *)&v49[10] = v28;
      *(_WORD *)&v49[14] = 1024;
      *(_DWORD *)&v49[16] = v29;
      *(_WORD *)int v50 = 2080;
      *(void *)&v50[2] = v30;
      BOOL v11 = " [%s] %s:%d (%s) Using tier: bitrate=%d, closestAudioBitrate=%d %s";
      unint64_t v12 = v26;
      uint32_t v13 = 60;
      goto LABEL_39;
    }
  }
  return v7;
}

- (unint64_t)adjustedRedNumPayloadsForLowBitrateAudioTier:(id)a3 redNumPayloads:(unint64_t)a4
{
  if (!+[VCAudioTierPicker usePlistForAudioTierTableFromMode:self->_config.mode])
  {
    uint64_t v7 = 85;
    if (!self->_config.usingCellular) {
      uint64_t v7 = 86;
    }
    if (!+[VCDefaults BOOLeanValueForKey:@"rateControlAllowRedLowBitrate" defaultValue:*((unsigned __int8 *)&self->super.isa + v7)])
    {
      unsigned int v8 = [a3 unsignedIntegerValue];
      unint64_t v9 = 2;
      if (a4 < 2) {
        unint64_t v9 = a4;
      }
      if (v8 >= 0x5209) {
        unint64_t v9 = a4;
      }
      if (v8 <= 0x3E80) {
        unint64_t v10 = a4 != 0;
      }
      else {
        unint64_t v10 = v9;
      }
      if (v8 >= 0x2711) {
        return v10;
      }
      else {
        return 0;
      }
    }
  }
  return a4;
}

- (id)allActiveAudioTiers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = (void *)[(NSMutableDictionary *)self->_tierTablesForRedNumPayloads allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8++), "allValues"));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)allPayloadsFromAllTierTables
{
  return (id)[(NSMutableSet *)self->_audioPayloads allObjects];
}

- (void)generateAudioPayloadsFromConfig:(id *)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  int64_t v5 = +[VCHardwareSettings deviceClass];
  [(NSMutableSet *)self->_audioPayloads removeAllObjects];
  if (+[VCAudioTierPicker usePlistForAudioTierTableFromMode:a3->var0])
  {
    if (a3->var0 == 6)
    {
      id v6 = [(VCAudioTierPicker *)self loadAudioTiersFromPlist:@"AudioTiers_GFT"];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      obuint64_t j = (id)objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"networkBitrate"), "allKeys");
      uint64_t v7 = [obj countByEnumeratingWithState:&v46 objects:v45 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v47 != v9) {
              objc_enumerationMutation(obj);
            }
            -[VCAudioTierPicker addPayloadsFromGFTRedNumPayloadsDict:isDeviceClassWolf:](self, "addPayloadsFromGFTRedNumPayloadsDict:isDeviceClassWolf:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"networkBitrate"), "objectForKeyedSubscript:", *(void *)(*((void *)&v46 + 1) + 8 * i)), "objectForKeyedSubscript:", @"redNumPayloads"), v5 == 8);
          }
          uint64_t v8 = [obj countByEnumeratingWithState:&v46 objects:v45 count:16];
        }
        while (v8);
      }
    }
    else
    {
      id v23 = [(VCAudioTierPicker *)self loadAudioTiersFromPlist:@"AudioTiers_U1"];
      uint64_t v24 = (void *)[v23 allKeys];
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v40 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v42;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v42 != v27) {
              objc_enumerationMutation(v24);
            }
            -[VCAudioTierPicker addPayloadsFromU1IPVerDict:config:mode:](self, "addPayloadsFromU1IPVerDict:config:mode:", [v23 objectForKeyedSubscript:*(void *)(*((void *)&v41 + 1) + 8 * j)], a3, *(void *)(*((void *)&v41 + 1) + 8 * j));
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v41 objects:v40 count:16];
        }
        while (v26);
      }
    }
  }
  else
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    var3 = a3->var3;
    uint64_t v12 = [(__CFArray *)var3 countByEnumeratingWithState:&v36 objects:v35 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v37;
      do
      {
        for (uint64_t k = 0; k != v13; ++k)
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(var3);
          }
          uint64_t v16 = (void *)[(NSMutableDictionary *)self->_tierTablesForRedNumPayloads objectForKeyedSubscript:*(void *)(*((void *)&v36 + 1) + 8 * k)];
          id v17 = (void *)[v16 allKeys];
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          int v18 = (void *)[v17 reverseObjectEnumerator];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v30 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v32;
            do
            {
              for (uint64_t m = 0; m != v20; ++m)
              {
                if (*(void *)v32 != v21) {
                  objc_enumerationMutation(v18);
                }
                -[VCAudioTierPicker addPayloadFromTier:](self, "addPayloadFromTier:", [v16 objectForKeyedSubscript:*(void *)(*((void *)&v31 + 1) + 8 * m)]);
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v30 count:16];
            }
            while (v20);
          }
        }
        uint64_t v13 = [(__CFArray *)var3 countByEnumeratingWithState:&v36 objects:v35 count:16];
      }
      while (v13);
    }
  }
}

- (void)addPayloadFromTier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "payloadConfig"), "payload");
    audioPayloads = self->_audioPayloads;
    uint64_t v6 = [NSNumber numberWithUnsignedInt:v4];
    [(NSMutableSet *)audioPayloads addObject:v6];
  }
}

- (void)addPayloadsFromU1IPVerDict:(id)a3 config:(id *)a4 mode:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    obuint64_t j = (id)[a3 allKeys];
    uint64_t v17 = [obj countByEnumeratingWithState:&v27 objects:v26 count:16];
    if (v17)
    {
      uint64_t v16 = *(void *)v28;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = v7;
          uint64_t v8 = *(void **)(*((void *)&v27 + 1) + 8 * v7);
          uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v8), "allKeys");
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          unint64_t v10 = v9;
          uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v21 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v23;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v23 != v13) {
                  objc_enumerationMutation(v10);
                }
                -[VCAudioTierPicker addPayloadsFromU1RedNumPayloadsDict:config:mode:isIPv4:isCellular:](self, "addPayloadsFromU1RedNumPayloadsDict:config:mode:isIPv4:isCellular:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v8), "objectForKeyedSubscript:", *(void *)(*((void *)&v22 + 1) + 8 * i)), "objectForKeyedSubscript:", @"redNumPayloads"), a4, a5, objc_msgSend(v8, "isEqualToString:", @"IPv4"), objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "isEqualToString:", @"cellular"));
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v21 count:16];
            }
            while (v12);
          }
          uint64_t v7 = v18 + 1;
        }
        while (v18 + 1 != v17);
        uint64_t v17 = [obj countByEnumeratingWithState:&v27 objects:v26 count:16];
      }
      while (v17);
    }
  }
}

- (void)addPayloadsFromU1RedNumPayloadsDict:(id)a3 config:(id *)a4 mode:(id)a5 isIPv4:(BOOL)a6 isCellular:(BOOL)a7
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v7 = a7;
    BOOL v8 = a6;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    obuint64_t j = (id)objc_msgSend(a3, "allKeys", a3, a4);
    uint64_t v31 = [obj countByEnumeratingWithState:&v65 objects:v64 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v66;
      unint64_t v29 = __PAIR64__(v7, v8);
      id v28 = a5;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v66 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v33 = v11;
          long long v36 = *(void **)(*((void *)&v65 + 1) + 8 * v11);
          uint64_t v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v28, v29), "objectForKeyedSubscript:", @"bitrateTier"), "allKeys");
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          id v34 = v12;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v60 objects:v59 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v35 = *(void *)v61;
            while (2)
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v61 != v35) {
                  objc_enumerationMutation(v34);
                }
                uint64_t v16 = *(void **)(*((void *)&v60 + 1) + 8 * i);
                uint64_t v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v36), "objectForKeyedSubscript:", @"bitrateTier"), "objectForKeyedSubscript:", v16), "objectForKeyedSubscript:", @"payloads");
                if (!v17)
                {
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                  {
                    uint64_t v24 = VRTraceErrorLogLevelToCSTR();
                    long long v25 = *MEMORY[0x1E4F47A50];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
                    {
                      int v26 = [v36 intValue];
                      int v27 = [v16 intValue];
                      *(_DWORD *)buf = 136316930;
                      uint64_t v44 = v24;
                      __int16 v45 = 2080;
                      long long v46 = "-[VCAudioTierPicker addPayloadsFromU1RedNumPayloadsDict:config:mode:isIPv4:isCellular:]";
                      __int16 v47 = 1024;
                      int v48 = 1232;
                      __int16 v49 = 2112;
                      id v50 = v28;
                      __int16 v51 = 1024;
                      int v52 = v29;
                      __int16 v53 = 1024;
                      int v54 = HIDWORD(v29);
                      __int16 v55 = 1024;
                      int v56 = v26;
                      __int16 v57 = 1024;
                      int v58 = v27;
                      _os_log_error_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d No payloads array for mode=%@ and isIPv4=%{BOOL}d isCellular=%{BOOL}d redNumPayloads=%u tierBitrate=%u", buf, 0x3Eu);
                    }
                  }
                  return;
                }
                uint64_t v18 = v17;
                long long v41 = 0u;
                long long v42 = 0u;
                long long v39 = 0u;
                long long v40 = 0u;
                uint64_t v19 = [v17 countByEnumeratingWithState:&v39 objects:v38 count:16];
                if (v19)
                {
                  uint64_t v20 = v19;
                  uint64_t v21 = *(void *)v40;
                  do
                  {
                    for (uint64_t j = 0; j != v20; ++j)
                    {
                      if (*(void *)v40 != v21) {
                        objc_enumerationMutation(v18);
                      }
                      uint64_t v23 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * j), "objectForKeyedSubscript:", @"payload"), "integerValue");
                      -[NSMutableSet addObject:](self->_audioPayloads, "addObject:", [NSNumber numberWithUnsignedInt:v23]);
                    }
                    uint64_t v20 = [v18 countByEnumeratingWithState:&v39 objects:v38 count:16];
                  }
                  while (v20);
                }
              }
              uint64_t v14 = [v34 countByEnumeratingWithState:&v60 objects:v59 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }
          uint64_t v11 = v33 + 1;
        }
        while (v33 + 1 != v31);
        uint64_t v31 = [obj countByEnumeratingWithState:&v65 objects:v64 count:16];
      }
      while (v31);
    }
  }
}

- (void)addPayloadsFromGFTPayloadsArray:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8), "objectForKeyedSubscript:", @"payload"), "integerValue");
        -[NSMutableSet addObject:](self->_audioPayloads, "addObject:", [NSNumber numberWithUnsignedInt:v9]);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v6);
  }
}

- (void)addPayloadsFromGFTRedNumPayloadsDict:(id)a3 isDeviceClassWolf:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    int v4 = a4;
    uint64_t v7 = (void *)[a3 allKeys];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v13 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v12), "objectForKeyedSubscript:", @"lowLatencyAudioDevice"), "BOOLValue") == v4)-[VCAudioTierPicker addPayloadsFromGFTPayloadsArray:](self, "addPayloadsFromGFTPayloadsArray:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v12), "objectForKeyedSubscript:", @"payloads")); {
        }
          }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v13 count:16];
      }
      while (v9);
    }
  }
}

- (VCAudioTier)defaultTier
{
  return self->_defaultTier;
}

- ($874264D99418FF75A48C4C64EBA5A14C)config
{
  objc_copyStruct(retstr, &self->_config, 48, 1, 0);
  return result;
}

- (void)setConfig:(id *)a3
{
}

- (BitrateLimits)bitrateLimits
{
  return self->_bitrateLimits;
}

- (void)setBitrateLimits:(id)a3
{
}

- (void)setupTierPickerForConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Cannot setup audio tier picker, invalid mode", v2, v3, v4, v5, v6);
}

- (void)setupTierPickerForConfig:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Error allocating _tierTabledForRedNumPayloads", v2, v3, v4, v5, v6);
}

- (void)setupTierPickerForConfig:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Error allocating _bitrateLimits", v2, v3, v4, v5, v6);
}

- (void)setupTierPickerForConfig:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCAudioTierPicker failed to generate tiers", v2, v3, v4, v5, v6);
}

- (void)setupAlwaysOnRedTiersForSupportedRed:usingCellular:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unable to setup always on red tiers, as supportedRedNumPayloads is nil", v2, v3, v4, v5, v6);
}

- (void)generateAudioTiersDictFromPlistForBitrateLimits:tierPickerConfig:redNumPayloads:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the audio tiers dictionary", v2, v3, v4, v5, v6);
}

- (void)generateAudioTiersDictFromPlistForBitrateLimits:tierPickerConfig:redNumPayloads:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the payload array", v2, v3, v4, v5, v6);
}

- (void)generateAudioTiersDictFromPlistForBitrateLimits:tierPickerConfig:redNumPayloads:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unable to load tier table from plist file", v2, v3, v4, v5, v6);
}

- (void)generateAudioTiersDictFromPlistForBitrateLimits:tierPickerConfig:redNumPayloads:.cold.4()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unsupported audioTierPickerMode=%d", v2, v3, v4, 571);
}

+ (void)loadVCAudioTierFromTierTable:config:allowRedAtLowBitrate:alwaysOnAudioRedundancyDisabled:redNumPayloads:tierBitrate:outEntryArray:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d entry cannot be NULL", v2, v3, v4, v5, v6);
}

+ (void)loadVCAudioTierFromTierTable:config:allowRedAtLowBitrate:alwaysOnAudioRedundancyDisabled:redNumPayloads:tierBitrate:outEntryArray:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No tier table entry for mode=%d", v2, v3, v4, 711);
}

+ (void)loadVCAudioTierFromTierTable:bitrate:redNumPayloads:outEntryArray:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d entry cannot be NULL", v2, v3, v4, v5, v6);
}

+ (void)loadVCAudioTierFromTierTable:bitrate:redNumPayloads:outEntryArray:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No payloads array. entry cannot be NULL", v2, v3, v4, v5, v6);
}

- (void)tierForNetworkBitrate:withLegacyDuplication:.cold.1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  int v3 = 981;
  __int16 v4 = 2112;
  uint64_t v5 = v0;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d No corresponding tier found for AudioBitRate, using fallback: %@", v2, 0x26u);
}

- (void)tierForNetworkBitrate:withLegacyDuplication:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Multiway doesn't use legacy duplication. Tier not found!", v2, v3, v4, v5, v6);
}

- (void)tierForAudioBitrate:withRedNumPayloads:.cold.1()
{
  OUTLINED_FUNCTION_2();
  *(_WORD *)&v4[4] = v0;
  *(void *)&v4[6] = "-[VCAudioTierPicker tierForAudioBitrate:withRedNumPayloads:]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Tier for bitrate %d not found!", v3, *(const char **)v4, (unint64_t)"-[VCAudioTierPicker tierForAudioBitrate:withRedNumPayloads:]" >> 16, 1056);
}

@end