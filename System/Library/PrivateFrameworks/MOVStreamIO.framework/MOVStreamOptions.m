@interface MOVStreamOptions
+ (MOVStreamOptions)sharedOptions;
- (BOOL)disableFrameReordering;
- (BOOL)disableVTPreSetup;
- (BOOL)force10bitMonoByVT;
- (BOOL)forceColorLossless;
- (BOOL)forceLossless8bitMonoByVT;
- (BOOL)skipSourceHint;
- (MOVStreamOptions)init;
- (double)bitrateMultiplier;
- (id)currentOptions;
- (id)localDefaults;
- (id)standardDefaultValues;
- (unint64_t)bitrateOverride;
- (void)checkBossMode;
- (void)checkHasValue:(id)a3 changedForKey:(id)a4;
- (void)registerStandardDefaults;
@end

@implementation MOVStreamOptions

+ (MOVStreamOptions)sharedOptions
{
  if (sharedOptions_onceToken != -1) {
    dispatch_once(&sharedOptions_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)sharedOptions_options;

  return (MOVStreamOptions *)v2;
}

uint64_t __33__MOVStreamOptions_sharedOptions__block_invoke()
{
  sharedOptions_options = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (MOVStreamOptions)init
{
  v9.receiver = self;
  v9.super_class = (Class)MOVStreamOptions;
  v2 = [(MOVStreamOptions *)&v9 init];
  v3 = v2;
  if (v2)
  {
    [(MOVStreamOptions *)v2 registerStandardDefaults];
    v4 = [(MOVStreamOptions *)v3 localDefaults];
    v5 = [v4 objectForKey:@"MIOBossMode"];
    v3->_debugMode = [v5 BOOLValue];

    if (v3->_debugMode)
    {
      v6 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_21B5ED000, v6, OS_LOG_TYPE_INFO, "[WARNING] MOVStreamIO Debug Mode enabled. This could change the Framework behavior.", v8, 2u);
      }
    }
  }
  return v3;
}

- (void)checkBossMode
{
  id v4 = [(MOVStreamOptions *)self localDefaults];
  v3 = [v4 objectForKey:@"MIOBossMode"];
  self->_debugMode = [v3 BOOLValue];
}

- (id)localDefaults
{
  v2 = (void *)localDefaults_defaults;
  if (!localDefaults_defaults)
  {
    uint64_t v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    id v4 = (void *)localDefaults_defaults;
    localDefaults_defaults = v3;

    v2 = (void *)localDefaults_defaults;
  }

  return v2;
}

- (id)currentOptions
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = [(MOVStreamOptions *)self standardDefaultValues];
  v5 = objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = [(MOVStreamOptions *)self standardDefaultValues];
  v7 = [v6 allKeys];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v13 = [(MOVStreamOptions *)self localDefaults];
        v14 = [v13 objectForKey:v12];

        [v5 setObject:v14 forKey:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v5;
}

- (BOOL)disableVTPreSetup
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.movstreamio.framework"];
  uint64_t v3 = [v2 objectForKey:@"MIODisableVTPreSetup"];
  id v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)disableFrameReordering
{
  if (self->_debugMode)
  {
    uint64_t v3 = [(MOVStreamOptions *)self localDefaults];
    id v4 = [v3 objectForKey:@"MIODisableFrameReordering"];

    [(MOVStreamOptions *)self checkHasValue:v4 changedForKey:@"MIODisableFrameReordering"];
    char v5 = [v4 BOOLValue];
  }
  else
  {
    id v4 = [(MOVStreamOptions *)self standardDefaultValues];
    v6 = [v4 objectForKey:@"MIODisableFrameReordering"];
    char v5 = [v6 BOOLValue];
  }
  return v5;
}

- (double)bitrateMultiplier
{
  if (self->_debugMode)
  {
    uint64_t v3 = [(MOVStreamOptions *)self localDefaults];
    id v4 = [v3 objectForKey:@"MIOBitrateMultiplier"];

    [(MOVStreamOptions *)self checkHasValue:v4 changedForKey:@"MIOBitrateMultiplier"];
    [v4 doubleValue];
    double v6 = v5;
  }
  else
  {
    id v4 = [(MOVStreamOptions *)self standardDefaultValues];
    v7 = [v4 objectForKey:@"MIOBitrateMultiplier"];
    [v7 doubleValue];
    double v6 = v8;
  }
  return v6;
}

- (unint64_t)bitrateOverride
{
  if (self->_debugMode)
  {
    uint64_t v3 = [(MOVStreamOptions *)self localDefaults];
    id v4 = [v3 objectForKey:@"MIOBitrateOverride"];

    [(MOVStreamOptions *)self checkHasValue:v4 changedForKey:@"MIOBitrateOverride"];
    unint64_t v5 = [v4 integerValue];
  }
  else
  {
    id v4 = [(MOVStreamOptions *)self standardDefaultValues];
    double v6 = [v4 objectForKey:@"MIOBitrateOverride"];
    unint64_t v5 = [v6 integerValue];
  }
  return v5;
}

- (BOOL)forceColorLossless
{
  if (self->_debugMode)
  {
    uint64_t v3 = [(MOVStreamOptions *)self localDefaults];
    id v4 = [v3 objectForKey:@"MIOForceColorLossless"];

    [(MOVStreamOptions *)self checkHasValue:v4 changedForKey:@"MIOForceColorLossless"];
    char v5 = [v4 BOOLValue];
  }
  else
  {
    id v4 = [(MOVStreamOptions *)self standardDefaultValues];
    double v6 = [v4 objectForKey:@"MIOForceColorLossless"];
    char v5 = [v6 BOOLValue];
  }
  return v5;
}

- (BOOL)force10bitMonoByVT
{
  if (self->_debugMode)
  {
    uint64_t v3 = [(MOVStreamOptions *)self localDefaults];
    id v4 = [v3 objectForKey:@"MIOForce10bitMonoByVT"];

    [(MOVStreamOptions *)self checkHasValue:v4 changedForKey:@"MIOForce10bitMonoByVT"];
    char v5 = [v4 BOOLValue];
  }
  else
  {
    id v4 = [(MOVStreamOptions *)self standardDefaultValues];
    double v6 = [v4 objectForKey:@"MIOForce10bitMonoByVT"];
    char v5 = [v6 BOOLValue];
  }
  return v5;
}

- (BOOL)forceLossless8bitMonoByVT
{
  if (self->_debugMode)
  {
    uint64_t v3 = [(MOVStreamOptions *)self localDefaults];
    id v4 = [v3 objectForKey:@"MIOForceLossless8bitMonoByVT"];

    [(MOVStreamOptions *)self checkHasValue:v4 changedForKey:@"MIOForceLossless8bitMonoByVT"];
    char v5 = [v4 BOOLValue];
  }
  else
  {
    id v4 = [(MOVStreamOptions *)self standardDefaultValues];
    double v6 = [v4 objectForKey:@"MIOForceLossless8bitMonoByVT"];
    char v5 = [v6 BOOLValue];
  }
  return v5;
}

- (BOOL)skipSourceHint
{
  if (self->_debugMode)
  {
    uint64_t v3 = [(MOVStreamOptions *)self localDefaults];
    id v4 = [v3 objectForKey:@"MIOSkipSourceHint"];

    [(MOVStreamOptions *)self checkHasValue:v4 changedForKey:@"MIOSkipSourceHint"];
    char v5 = [v4 BOOLValue];
  }
  else
  {
    id v4 = [(MOVStreamOptions *)self standardDefaultValues];
    double v6 = [v4 objectForKey:@"MIOSkipSourceHint"];
    char v5 = [v6 BOOLValue];
  }
  return v5;
}

- (id)standardDefaultValues
{
  v7[8] = *MEMORY[0x263EF8340];
  v2 = (void *)standardDefaultValues_standardDefaults;
  if (!standardDefaultValues_standardDefaults)
  {
    v6[0] = @"MIOBossMode";
    v6[1] = @"MIODisableFrameReordering";
    v7[0] = MEMORY[0x263EFFA80];
    v7[1] = MEMORY[0x263EFFA80];
    v6[2] = @"MIOBitrateMultiplier";
    v6[3] = @"MIOBitrateOverride";
    v7[2] = &unk_26CB7D4E0;
    v7[3] = &unk_26CB7D398;
    v6[4] = @"MIOForceColorLossless";
    v6[5] = @"MIOForce10bitMonoByVT";
    v7[4] = MEMORY[0x263EFFA80];
    v7[5] = MEMORY[0x263EFFA80];
    v6[6] = @"MIOSkipSourceHint";
    v6[7] = @"MIOForceLossless8bitMonoByVT";
    v7[6] = MEMORY[0x263EFFA80];
    v7[7] = MEMORY[0x263EFFA80];
    uint64_t v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:8];
    id v4 = (void *)standardDefaultValues_standardDefaults;
    standardDefaultValues_standardDefaults = v3;

    v2 = (void *)standardDefaultValues_standardDefaults;
  }

  return v2;
}

- (void)checkHasValue:(id)a3 changedForKey:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  double v8 = [(MOVStreamOptions *)self standardDefaultValues];
  uint64_t v9 = [v8 objectForKey:v6];

  uint64_t v10 = [NSString stringWithFormat:@"%@", v7];

  v11 = [NSString stringWithFormat:@"%@", v9];
  if (([v10 isEqual:v11] & 1) == 0)
  {
    uint64_t v12 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      id v14 = v6;
      __int16 v15 = 2114;
      long long v16 = v11;
      __int16 v17 = 2114;
      long long v18 = v10;
      _os_log_impl(&dword_21B5ED000, v12, OS_LOG_TYPE_INFO, "[WARNING] Default setting for '%{public}@' was changed from '%{public}@' to '%{public}@'. This can affect your recordings!", buf, 0x20u);
    }
  }
}

- (void)registerStandardDefaults
{
  id v4 = [(MOVStreamOptions *)self localDefaults];
  uint64_t v3 = [(MOVStreamOptions *)self standardDefaultValues];
  [v4 registerDefaults:v3];
}

@end