@interface HMDSharedUserDataModel
+ (id)hmbProperties;
@end

@implementation HMDSharedUserDataModel

+ (id)hmbProperties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__HMDSharedUserDataModel_hmbProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (hmbProperties_onceToken_5 != -1) {
    dispatch_once(&hmbProperties_onceToken_5, block);
  }
  v2 = (void *)hmbProperties__properties_6;
  return v2;
}

void __39__HMDSharedUserDataModel_hmbProperties__block_invoke(uint64_t a1)
{
  v11[3] = *MEMORY[0x263EF8340];
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)&OBJC_METACLASS___HMDSharedUserDataModel;
  v1 = objc_msgSendSuper2(&v9, sel_hmbProperties);
  uint64_t v2 = [v1 mutableCopy];
  v3 = (void *)hmbProperties__properties_6;
  hmbProperties__properties_6 = v2;

  v4 = (void *)hmbProperties__properties_6;
  v10[0] = @"assistantAccessControlModelUUID";
  v5 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v11[0] = v5;
  v10[1] = @"userListeningHistoryUpdateControlModelUUID";
  v6 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v11[1] = v6;
  v10[2] = @"mediaContentProfileAccessControlModelUUID";
  v7 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v11[2] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
  [v4 addEntriesFromDictionary:v8];
}

@end