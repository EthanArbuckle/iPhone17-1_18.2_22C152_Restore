@interface HMDIDSActivityObserverModel
+ (id)hmbProperties;
+ (id)sentinelParentUUID;
- (HMDIDSActivityObserverModel)initWithModelID:(id)a3;
@end

@implementation HMDIDSActivityObserverModel

- (HMDIDSActivityObserverModel)initWithModelID:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() sentinelParentUUID];
  v8.receiver = self;
  v8.super_class = (Class)HMDIDSActivityObserverModel;
  v6 = [(HMBModel *)&v8 initWithModelID:v4 parentModelID:v5];

  return v6;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_256533 != -1) {
    dispatch_once(&hmbProperties_onceToken_256533, &__block_literal_global_3_256534);
  }
  v2 = (void *)hmbProperties_properties_256535;
  return v2;
}

void __44__HMDIDSActivityObserverModel_hmbProperties__block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"pushToken";
  v0 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)hmbProperties_properties_256535;
  hmbProperties_properties_256535 = v1;
}

+ (id)sentinelParentUUID
{
  if (sentinelParentUUID_onceToken_256543 != -1) {
    dispatch_once(&sentinelParentUUID_onceToken_256543, &__block_literal_global_256544);
  }
  v2 = (void *)sentinelParentUUID_sentinelParentUUID_256545;
  return v2;
}

void __49__HMDIDSActivityObserverModel_sentinelParentUUID__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"6E0AF7DC-15F3-4FC8-ACB2-B98338E4FE85"];
  uint64_t v1 = (void *)sentinelParentUUID_sentinelParentUUID_256545;
  sentinelParentUUID_sentinelParentUUID_256545 = v0;
}

@end