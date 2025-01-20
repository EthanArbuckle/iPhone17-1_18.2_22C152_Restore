@interface HMDSettingGroupModel
+ (id)hmbProperties;
- (id)copyWithNewParentModelID:(id)a3;
@end

@implementation HMDSettingGroupModel

- (id)copyWithNewParentModelID:(id)a3
{
  id v4 = a3;
  v5 = [HMDSettingGroupModel alloc];
  v6 = [(HMBModel *)self hmbModelID];
  v7 = [(HMBModel *)v5 initWithModelID:v6 parentModelID:v4];

  v8 = [(HMDSettingGroupModel *)self name];
  [(HMDSettingGroupModel *)v7 setName:v8];

  return v7;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_7026 != -1) {
    dispatch_once(&hmbProperties_onceToken_7026, &__block_literal_global_7027);
  }
  v2 = (void *)hmbProperties__properties;
  return v2;
}

void __37__HMDSettingGroupModel_hmbProperties__block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"name";
  v0 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)hmbProperties__properties;
  hmbProperties__properties = v1;
}

@end