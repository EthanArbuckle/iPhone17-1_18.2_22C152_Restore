@interface DOCFeatureStateFFSetting
+ (id)defaultsOverrideForDomainID:(id)a3 featureID:(id)a4 overrideKey:(id)a5;
- (DOCFeatureStateFFSetting)initWithDomainID:(id)a3 featureID:(id)a4 overrideKey:(id)a5 valueMode:(int64_t)a6 requirements:(id)a7;
- (NSString)domainID;
- (NSString)featureID;
- (int64_t)valueMode;
- (void)setDomainID:(id)a3;
- (void)setFeatureID:(id)a3;
- (void)setValueMode:(int64_t)a3;
@end

@implementation DOCFeatureStateFFSetting

+ (id)defaultsOverrideForDomainID:(id)a3 featureID:(id)a4 overrideKey:(id)a5
{
  v24[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 isEqual:@"UIKit"])
  {
    v10 = @"com.apple.UIKit";
    if (v9)
    {
LABEL_3:
      id v11 = v9;
      goto LABEL_6;
    }
  }
  else
  {
    v10 = @"com.apple.DocumentManager.defaults";
    if (v9) {
      goto LABEL_3;
    }
  }
  id v11 = [NSString stringWithFormat:@"DOCFeature.override.%@.%@", v7, v8];
LABEL_6:
  v12 = v11;
  v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v14 = [v13 valueForKey:v12];

  if (!v14)
  {
    v15 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.DocumentManager.defaults"];
    v16 = [v15 valueForKey:v12];

    if (v16)
    {
      v17 = [MEMORY[0x263EFFA40] standardUserDefaults];
      v23 = v12;
      v24[0] = v16;
      v18 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
      [v17 registerDefaults:v18];
    }
  }
  v19 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v20 = [v19 valueForKey:v12];

  if (!v20)
  {
    v21 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:v10];
    v20 = [v21 valueForKey:v12];
  }
  return v20;
}

- (DOCFeatureStateFFSetting)initWithDomainID:(id)a3 featureID:(id)a4 overrideKey:(id)a5 valueMode:(int64_t)a6 requirements:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v34.receiver = self;
  v34.super_class = (Class)DOCFeatureStateFFSetting;
  v17 = [(DOCFeatureStateFFSetting *)&v34 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_domainID, a3);
    objc_storeStrong((id *)&v18->_featureID, a4);
    v18->_valueMode = a6;
    v19 = [(id)objc_opt_class() defaultsOverrideForDomainID:v13 featureID:v14 overrideKey:v15];
    v20 = [MEMORY[0x263EFF980] array];
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    v31 = __90__DOCFeatureStateFFSetting_initWithDomainID_featureID_overrideKey_valueMode_requirements___block_invoke;
    v32 = &unk_2641B59A8;
    id v21 = v20;
    id v33 = v21;
    [v16 enumerateObjectsUsingBlock:&v29];
    if ([v21 count])
    {
      [(DOCFeatureState *)v18 setIsEnabled:0];
      v22 = NSString;
      v23 = [v21 componentsJoinedByString:@","];
      v24 = [v22 stringWithFormat:@"forced off (unsatisfied = %@)", v23];
    }
    else
    {
      if (v19)
      {
        -[DOCFeatureState setIsEnabled:](v18, "setIsEnabled:", [v19 BOOLValue]);
        v25 = NSString;
        v26 = @"DEBUG override";
      }
      else if (a6)
      {
        [(DOCFeatureState *)v18 setIsEnabled:a6 == 1];
        v25 = NSString;
        v26 = @"forced value";
      }
      else
      {
        [v13 UTF8String];
        [v14 UTF8String];
        [(DOCFeatureState *)v18 setIsEnabled:_os_feature_enabled_impl()];
        v25 = NSString;
        v26 = @"user setting";
      }
      v24 = [v25 stringWithFormat:v26];
    }
    v27 = [NSString stringWithFormat:@"feature flag (%@): %@.%@", v24, v13, v14, v29, v30, v31, v32];
    _FFInitLog(v27, [(DOCFeatureState *)v18 isEnabled]);
  }
  return v18;
}

void __90__DOCFeatureStateFFSetting_initWithDomainID_featureID_overrideKey_valueMode_requirements___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [v7 requirementValidationBlock];
  char v4 = v3[2]();

  if ((v4 & 1) == 0)
  {
    v5 = *(void **)(a1 + 32);
    v6 = [v7 name];
    [v5 addObject:v6];
  }
}

- (NSString)domainID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDomainID:(id)a3
{
}

- (NSString)featureID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFeatureID:(id)a3
{
}

- (int64_t)valueMode
{
  return self->_valueMode;
}

- (void)setValueMode:(int64_t)a3
{
  self->_valueMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureID, 0);
  objc_storeStrong((id *)&self->_domainID, 0);
}

@end