@interface CESRAudioSamplingConfig
- (CESRAudioSamplingConfig)initWithConfigDictionary:(id)a3;
- (CESRAudioSamplingConfig)initWithConfigPath:(id)a3;
- (NSArray)samplingPolicies;
- (id)getSamplingRateFromDimension:(id)a3;
@end

@implementation CESRAudioSamplingConfig

- (void).cxx_destruct
{
}

- (NSArray)samplingPolicies
{
  return self->_samplingPolicies;
}

- (id)getSamplingRateFromDimension:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = self->_samplingPolicies;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "isMatchedSamplingDimension:", v4, (void)v15))
        {
          v13 = *MEMORY[0x1E4F4E380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v20 = "-[CESRAudioSamplingConfig getSamplingRateFromDimension:]";
            __int16 v21 = 2112;
            id v22 = v4;
            __int16 v23 = 2112;
            v24 = v10;
            _os_log_debug_impl(&dword_1B8CCB000, v13, OS_LOG_TYPE_DEBUG, "%s The dimension %@ matches the sampling policy %@ .", buf, 0x20u);
          }
          v12 = [v10 samplingRate];

          goto LABEL_15;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v25 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v11 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[CESRAudioSamplingConfig getSamplingRateFromDimension:]";
    _os_log_debug_impl(&dword_1B8CCB000, v11, OS_LOG_TYPE_DEBUG, "%s No Sampling Policy Available", buf, 0xCu);
  }
  v12 = 0;
LABEL_15:

  return v12;
}

- (CESRAudioSamplingConfig)initWithConfigPath:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v16 = 0;
    uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v4 options:0 error:&v16];
    id v6 = v16;
    if (v6) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = v5 == 0;
    }
    if (v7)
    {
      uint64_t v8 = v6;
      v9 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        long long v18 = "-[CESRAudioSamplingConfig initWithConfigPath:]";
        __int16 v19 = 2112;
        id v20 = v4;
        __int16 v21 = 2112;
        id v22 = v8;
        _os_log_error_impl(&dword_1B8CCB000, v9, OS_LOG_TYPE_ERROR, "%s Can't Read File From %@, Error: %@", buf, 0x20u);
      }
    }
    else
    {
      id v15 = 0;
      v11 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:&v15];
      id v12 = v15;
      uint64_t v8 = v12;
      if (!v12 && v11)
      {
        self = [(CESRAudioSamplingConfig *)self initWithConfigDictionary:v11];
        uint64_t v8 = (void *)v5;
        v10 = self;
LABEL_17:

        goto LABEL_18;
      }
      v13 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        long long v18 = "-[CESRAudioSamplingConfig initWithConfigPath:]";
        __int16 v19 = 2112;
        id v20 = v4;
        __int16 v21 = 2112;
        id v22 = v8;
        _os_log_error_impl(&dword_1B8CCB000, v13, OS_LOG_TYPE_ERROR, "%s Can't Parse JSON From %@, Error: %@", buf, 0x20u);
      }
    }
    v10 = 0;
    v11 = (void *)v5;
    goto LABEL_17;
  }
  v10 = 0;
LABEL_18:

  return v10;
}

- (CESRAudioSamplingConfig)initWithConfigDictionary:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CESRAudioSamplingConfig;
  uint64_t v5 = [(CESRAudioSamplingConfig *)&v32 init];
  if (v5)
  {
    v27 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v4)
    {
      v25 = v5;
      id v26 = v4;
      id v6 = [v4 objectForKeyedSubscript:@"samplingPolicies"];
      BOOL v7 = v6;
      if (v6)
      {
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v37 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v29 != v10) {
                objc_enumerationMutation(v7);
              }
              id v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              v13 = [v12 objectForKeyedSubscript:@"samplingRate"];
              v14 = v13;
              if (v13)
              {
                [v13 floatValue];
                if (v15 >= 0.0)
                {
                  [v14 floatValue];
                  if (v16 <= 1.0)
                  {
                    long long v17 = [v12 objectForKeyedSubscript:@"filterDimensions"];
                    long long v18 = [CESRSamplingDimension alloc];
                    __int16 v19 = [v17 objectForKeyedSubscript:@"asrLocale"];
                    id v20 = [(CESRSamplingDimension *)v18 initWithAsrLocale:v19];

                    __int16 v21 = -[CESRAudioSamplingPolicy initWithRuleDimension:samplingRate:numDimension:]([CESRAudioSamplingPolicy alloc], "initWithRuleDimension:samplingRate:numDimension:", v20, v14, [v17 count]);
                    [(NSArray *)v27 addObject:v21];
                    id v22 = *MEMORY[0x1E4F4E380];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 136315394;
                      v34 = "-[CESRAudioSamplingConfig initWithConfigDictionary:]";
                      __int16 v35 = 2112;
                      v36 = v21;
                      _os_log_debug_impl(&dword_1B8CCB000, v22, OS_LOG_TYPE_DEBUG, "%s Added Policy: %@", buf, 0x16u);
                    }
                  }
                }
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v37 count:16];
          }
          while (v9);
        }
      }

      uint64_t v5 = v25;
      id v4 = v26;
    }
    [(NSArray *)v27 sortWithOptions:16 usingComparator:&__block_literal_global_2236];
    samplingPolicies = v5->_samplingPolicies;
    v5->_samplingPolicies = v27;
  }
  return v5;
}

uint64_t __52__CESRAudioSamplingConfig_initWithConfigDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 numDimension];
  if (v6 >= [v5 numDimension])
  {
    uint64_t v8 = [v4 numDimension];
    if (v8 <= [v5 numDimension]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

@end