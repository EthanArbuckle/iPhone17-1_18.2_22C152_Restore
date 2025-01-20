@interface HMDSettingConstraintModel
+ (id)hmbProperties;
- (NSString)nameForKeyPath;
- (id)copyWithNewParentModelID:(id)a3;
@end

@implementation HMDSettingConstraintModel

- (id)copyWithNewParentModelID:(id)a3
{
  id v4 = a3;
  v5 = [HMDSettingConstraintModel alloc];
  v6 = [(HMBModel *)self hmbModelID];
  v7 = [(HMBModel *)v5 initWithModelID:v6 parentModelID:v4];

  v8 = [(HMDSettingConstraintModel *)self type];
  [(HMDSettingConstraintModel *)v7 setType:v8];

  v9 = [(HMDSettingConstraintModel *)self numberValue];
  [(HMDSettingConstraintModel *)v7 setNumberValue:v9];

  v10 = [(HMDSettingConstraintModel *)self stringValue];
  [(HMDSettingConstraintModel *)v7 setStringValue:v10];

  v11 = [(HMDSettingConstraintModel *)self dataValue];
  [(HMDSettingConstraintModel *)v7 setDataValue:v11];

  return v7;
}

- (NSString)nameForKeyPath
{
  v3 = self;
  id v4 = [(HMDSettingConstraintModel *)self type];
  [v4 integerValue];
  v5 = HMSettingConstraintTypeToString();

  v6 = [(HMDSettingConstraintModel *)v3 type];
  uint64_t v7 = [v6 integerValue];

  if (v7 == 4)
  {
    v8 = NSString;
    uint64_t v9 = [(HMDSettingConstraintModel *)v3 numberValue];
    v10 = (void *)v9;
    if (v9)
    {
      int v11 = 0;
      v12 = (__CFString *)v9;
    }
    else
    {
      uint64_t v13 = [(HMDSettingConstraintModel *)v3 stringValue];
      v2 = (void *)v13;
      if (v13)
      {
        int v11 = 0;
        v12 = (__CFString *)v13;
      }
      else
      {
        uint64_t v14 = [(HMDSettingConstraintModel *)v3 dataValue];
        v3 = (HMDSettingConstraintModel *)v14;
        v12 = @"unknown";
        if (v14) {
          v12 = (__CFString *)v14;
        }
        int v11 = 1;
      }
    }
    uint64_t v15 = [v8 stringWithFormat:@"%@.%@", v5, v12];

    if (v11) {
    if (!v10)
    }

    v5 = (void *)v15;
  }
  return (NSString *)v5;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_52803 != -1) {
    dispatch_once(&hmbProperties_onceToken_52803, &__block_literal_global_52804);
  }
  v2 = (void *)hmbProperties__properties_52805;
  return v2;
}

void __42__HMDSettingConstraintModel_hmbProperties__block_invoke()
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"type";
  v0 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v7[0] = v0;
  v6[1] = @"numberValue";
  v1 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v7[1] = v1;
  v6[2] = @"stringValue";
  v2 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v7[2] = v2;
  v6[3] = @"dataValue";
  v3 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v7[3] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
  v5 = (void *)hmbProperties__properties_52805;
  hmbProperties__properties_52805 = v4;
}

@end