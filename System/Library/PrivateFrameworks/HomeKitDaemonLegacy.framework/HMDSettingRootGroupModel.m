@interface HMDSettingRootGroupModel
+ (id)hmbProperties;
- (HMDSettingRootGroupModel)initWithModelID:(id)a3 parentModelID:(id)a4;
- (id)copyWithNewParentModelID:(id)a3;
@end

@implementation HMDSettingRootGroupModel

- (id)copyWithNewParentModelID:(id)a3
{
  [MEMORY[0x1E4F1CA00] raise:@"ProtocolMethodNotImplemented" format:@"Root group should never change it's parent model ID"];
  return self;
}

- (HMDSettingRootGroupModel)initWithModelID:(id)a3 parentModelID:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HMDSettingRootGroupModel;
  v4 = [(HMBModel *)&v8 initWithModelID:a3 parentModelID:a4];
  v5 = v4;
  if (v4)
  {
    [(HMDSettingRootGroupModel *)v4 setName:@"root"];
    v6 = [MEMORY[0x1E4F29128] UUID];
    [(HMDSettingRootGroupModel *)v5 setConflictResolutionToken:v6];
  }
  return v5;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_166298 != -1) {
    dispatch_once(&hmbProperties_onceToken_166298, &__block_literal_global_166299);
  }
  v2 = (void *)hmbProperties__properties_166300;
  return v2;
}

void __41__HMDSettingRootGroupModel_hmbProperties__block_invoke()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"conflictResolutionToken";
  v0 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v4[1] = @"name";
  v5[0] = v0;
  v1 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  v3 = (void *)hmbProperties__properties_166300;
  hmbProperties__properties_166300 = v2;
}

@end