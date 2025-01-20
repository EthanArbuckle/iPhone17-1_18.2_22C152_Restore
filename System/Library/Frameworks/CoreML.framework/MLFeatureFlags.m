@interface MLFeatureFlags
+ (id)sharedFeatureFlags;
- (BOOL)isFeatureEnabled:(id)a3;
- (BOOL)isMPSGraphEnabled;
- (BOOL)isMPSGraphFP16Enabled;
- (BOOL)removeOverrideForFeature:(id)a3;
- (BOOL)setOverride:(BOOL)a3 forFeature:(id)a4;
- (MLFeatureFlags)init;
- (NSMutableDictionary)flags;
- (NSMutableDictionary)overrideOriginalValues;
- (NSUserDefaults)userDefaults;
- (id)controlKeyForFeature:(id)a3;
- (void)addFeature:(id)a3 withControlName:(id)a4 defaultValue:(BOOL)a5;
- (void)defineFeatures;
@end

@implementation MLFeatureFlags

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideOriginalValues, 0);
  objc_storeStrong((id *)&self->_flags, 0);

  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (NSMutableDictionary)overrideOriginalValues
{
  return self->_overrideOriginalValues;
}

- (NSMutableDictionary)flags
{
  return self->_flags;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (BOOL)removeOverrideForFeature:(id)a3
{
  v4 = [(MLFeatureFlags *)self controlKeyForFeature:a3];
  if (v4)
  {
    v5 = [(MLFeatureFlags *)self overrideOriginalValues];
    v6 = [v5 objectForKey:v4];

    v7 = (const char *)[v4 UTF8String];
    if (v6) {
      setenv(v7, (const char *)[v6 UTF8String], 1);
    }
    else {
      unsetenv(v7);
    }
  }
  return v4 != 0;
}

- (BOOL)setOverride:(BOOL)a3 forFeature:(id)a4
{
  BOOL v4 = a3;
  v6 = [(MLFeatureFlags *)self controlKeyForFeature:a4];
  if (v6)
  {
    v7 = [MEMORY[0x1E4F28F80] processInfo];
    v8 = [v7 environment];
    v9 = [v8 objectForKey:v6];

    if (v9)
    {
      v10 = [(MLFeatureFlags *)self overrideOriginalValues];
      v11 = [v10 objectForKey:v6];

      if (!v11)
      {
        v12 = [(MLFeatureFlags *)self overrideOriginalValues];
        [v12 setValue:v9 forKey:v6];
      }
    }
    v13 = (const char *)[v6 UTF8String];
    if (v4) {
      v14 = "1";
    }
    else {
      v14 = "0";
    }
    setenv(v13, v14, 1);
  }
  return v6 != 0;
}

- (id)controlKeyForFeature:(id)a3
{
  id v4 = a3;
  v5 = [(MLFeatureFlags *)self flags];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    v7 = [NSString stringWithFormat:@"features.%@", v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isFeatureEnabled:(id)a3
{
  v3 = self;
  id v4 = [(MLFeatureFlags *)self controlKeyForFeature:a3];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28F80] processInfo];
    v6 = [v5 environment];
    v7 = [v6 objectForKey:v4];

    if (v7)
    {
      if ([v7 isEqualToString:@"1"])
      {
        LOBYTE(v3) = 1;
      }
      else
      {
        int v9 = [v7 isEqualToString:@"YES"];
        LODWORD(v3) = v9 | [v7 isEqualToString:@"true"];
      }
    }
    else
    {
      v8 = [(MLFeatureFlags *)v3 userDefaults];
      LOBYTE(v3) = [v8 BOOLForKey:v4];
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }

  return (char)v3;
}

- (void)addFeature:(id)a3 withControlName:(id)a4 defaultValue:(BOOL)a5
{
  BOOL v5 = a5;
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  v10 = [(MLFeatureFlags *)self flags];
  [v10 setValue:v8 forKey:v9];

  v11 = [(MLFeatureFlags *)self controlKeyForFeature:v9];

  v12 = [(MLFeatureFlags *)self userDefaults];
  v15 = v11;
  v13 = [NSNumber numberWithBool:v5];
  v16[0] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  [v12 registerDefaults:v14];
}

- (MLFeatureFlags)init
{
  v10.receiver = self;
  v10.super_class = (Class)MLFeatureFlags;
  v2 = [(MLFeatureFlags *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v3;

    BOOL v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    flags = v2->_flags;
    v2->_flags = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    overrideOriginalValues = v2->_overrideOriginalValues;
    v2->_overrideOriginalValues = v7;

    [(MLFeatureFlags *)v2 defineFeatures];
  }
  return v2;
}

- (BOOL)isMPSGraphFP16Enabled
{
  return [(MLFeatureFlags *)self isFeatureEnabled:@"MPSGraphFP16"];
}

- (BOOL)isMPSGraphEnabled
{
  return [(MLFeatureFlags *)self isFeatureEnabled:@"MPSGraph"];
}

- (void)defineFeatures
{
  [(MLFeatureFlags *)self addFeature:@"MPSGraph" withControlName:@"MPSGraph" defaultValue:1];

  [(MLFeatureFlags *)self addFeature:@"MPSGraphFP16" withControlName:@"MPSGraphFP16" defaultValue:0];
}

+ (id)sharedFeatureFlags
{
  if (sharedFeatureFlags_onceToken != -1) {
    dispatch_once(&sharedFeatureFlags_onceToken, &__block_literal_global_23163);
  }
  v2 = (void *)sharedFeatureFlags_s_featureFlags;

  return v2;
}

void __36__MLFeatureFlags_sharedFeatureFlags__block_invoke()
{
  v0 = objc_alloc_init(MLFeatureFlags);
  v1 = (void *)sharedFeatureFlags_s_featureFlags;
  sharedFeatureFlags_s_featureFlags = (uint64_t)v0;
}

@end