@interface CESRAudioSamplingConfigManager
+ (id)sharedManager;
- (BOOL)shouldSampleFromConfigForProductType:(int64_t)a3 language:(id)a4;
- (CESRAudioSamplingConfigManager)init;
- (CESRAudioSamplingConfigManager)initWithAudioSamplingConfigDict:(id)a3;
- (id)_createConfigFromProductType:(int64_t)a3;
- (id)audioSamplingConfigDict;
- (void)loadConfigs;
@end

@implementation CESRAudioSamplingConfigManager

- (void).cxx_destruct
{
}

- (BOOL)shouldSampleFromConfigForProductType:(int64_t)a3 language:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    v7 = v6;
    audioSamplingConfigDict = self->_audioSamplingConfigDict;
    v9 = [NSNumber numberWithInteger:a3];
    v10 = [(NSMutableDictionary *)audioSamplingConfigDict objectForKey:v9];

    if (v10)
    {
      uint64_t v11 = _AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode();
      v12 = (void *)v11;
      if (v11) {
        v13 = (void *)v11;
      }
      else {
        v13 = v7;
      }
      id v14 = v13;

      v15 = [[CESRSamplingDimension alloc] initWithAsrLocale:v14];
      v16 = [v10 getSamplingRateFromDimension:v15];
      v17 = v16;
      if (v16)
      {
        [v16 floatValue];
        BOOL v18 = +[CESRAudioSamplingUtilities isUniformlySampledWithSamplingRate:](CESRAudioSamplingUtilities, "isUniformlySampledWithSamplingRate:");
        v19 = (void *)*MEMORY[0x1E4F4E380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
        {
          v20 = v19;
          [v17 floatValue];
          int v25 = 136315650;
          v26 = "-[CESRAudioSamplingConfigManager shouldSampleFromConfigForProductType:language:]";
          __int16 v27 = 2048;
          double v28 = v21;
          __int16 v29 = 1024;
          BOOL v30 = v18;
          _os_log_debug_impl(&dword_1B8CCB000, v20, OS_LOG_TYPE_DEBUG, "%s Sampled with sampling rate = %lf, sampled result = %d", (uint8_t *)&v25, 0x1Cu);
        }
      }
      else
      {
        v23 = *MEMORY[0x1E4F4E380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
        {
          int v25 = 136315138;
          v26 = "-[CESRAudioSamplingConfigManager shouldSampleFromConfigForProductType:language:]";
          _os_log_debug_impl(&dword_1B8CCB000, v23, OS_LOG_TYPE_DEBUG, "%s No Sampling Rate Returned", (uint8_t *)&v25, 0xCu);
        }
        LOBYTE(v18) = 1;
      }

      v7 = v14;
    }
    else
    {
      v22 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
      {
        int v25 = 136315138;
        v26 = "-[CESRAudioSamplingConfigManager shouldSampleFromConfigForProductType:language:]";
        _os_log_debug_impl(&dword_1B8CCB000, v22, OS_LOG_TYPE_DEBUG, "%s No Sampling Config Available", (uint8_t *)&v25, 0xCu);
      }
      LOBYTE(v18) = 1;
    }
  }
  else
  {
    LOBYTE(v18) = 1;
  }
  return v18;
}

- (id)_createConfigFromProductType:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a3 != 1)
    {
      v10 = 0;
      goto LABEL_16;
    }
    v3 = @"com.apple.siri.asr.assistant.audio.sampling";
  }
  else
  {
    v3 = @"com.apple.siri.asr.dictation.audio.sampling";
  }
  v4 = (os_log_t *)MEMORY[0x1E4F4E380];
  v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315394;
    v13 = "-[CESRAudioSamplingConfigManager _createConfigFromProductType:]";
    __int16 v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1B8CCB000, v5, OS_LOG_TYPE_DEBUG, "%s Loading Sampling Config for Factor Name: %@", (uint8_t *)&v12, 0x16u);
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F3C268]);
  v7 = [v6 installedAudioSamplingConfigWithAssetName:v3];

  v8 = *v4;
  BOOL v9 = os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9)
    {
      int v12 = 136315650;
      v13 = "-[CESRAudioSamplingConfigManager _createConfigFromProductType:]";
      __int16 v14 = 2112;
      v15 = v3;
      __int16 v16 = 2112;
      v17 = v7;
      _os_log_debug_impl(&dword_1B8CCB000, v8, OS_LOG_TYPE_DEBUG, "%s File Path for Factor Name: %@ is %@", (uint8_t *)&v12, 0x20u);
    }
    v10 = [[CESRAudioSamplingConfig alloc] initWithConfigPath:v7];
  }
  else
  {
    if (v9)
    {
      int v12 = 136315394;
      v13 = "-[CESRAudioSamplingConfigManager _createConfigFromProductType:]";
      __int16 v14 = 2112;
      v15 = v3;
      _os_log_debug_impl(&dword_1B8CCB000, v8, OS_LOG_TYPE_DEBUG, "%s No File Path for Factor Name: %@", (uint8_t *)&v12, 0x16u);
    }
    v10 = 0;
  }

LABEL_16:

  return v10;
}

- (id)audioSamplingConfigDict
{
  return self->_audioSamplingConfigDict;
}

- (void)loadConfigs
{
  uint64_t v3 = 0;
  char v4 = 1;
  do
  {
    char v5 = v4;
    id v6 = [(CESRAudioSamplingConfigManager *)self _createConfigFromProductType:v3];
    if (v6)
    {
      audioSamplingConfigDict = self->_audioSamplingConfigDict;
      v8 = [NSNumber numberWithInt:v3];
      [(NSMutableDictionary *)audioSamplingConfigDict setObject:v6 forKey:v8];
    }
    char v4 = 0;
    uint64_t v3 = 1;
  }
  while ((v5 & 1) != 0);
}

- (CESRAudioSamplingConfigManager)initWithAudioSamplingConfigDict:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CESRAudioSamplingConfigManager;
  id v6 = [(CESRAudioSamplingConfigManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_audioSamplingConfigDict, a3);
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
      audioSamplingConfigDict = v7->_audioSamplingConfigDict;
      v7->_audioSamplingConfigDict = (NSMutableDictionary *)v8;

      [(CESRAudioSamplingConfigManager *)v7 loadConfigs];
    }
  }

  return v7;
}

- (CESRAudioSamplingConfigManager)init
{
  return [(CESRAudioSamplingConfigManager *)self initWithAudioSamplingConfigDict:0];
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_3178 != -1) {
    dispatch_once(&sharedManager_onceToken_3178, &__block_literal_global_3179);
  }
  v2 = (void *)sharedManager_sharedMyManager_3180;

  return v2;
}

uint64_t __47__CESRAudioSamplingConfigManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(CESRAudioSamplingConfigManager);
  uint64_t v1 = sharedManager_sharedMyManager_3180;
  sharedManager_sharedMyManager_3180 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end