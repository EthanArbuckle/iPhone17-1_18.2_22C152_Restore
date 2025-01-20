@interface HMServiceGroup(HFAdditions)
- (id)hf_serviceDescriptor;
- (uint64_t)hf_areAllServicesInSameRoom;
- (uint64_t)hf_isSupported;
@end

@implementation HMServiceGroup(HFAdditions)

- (uint64_t)hf_isSupported
{
  v1 = [a1 services];
  uint64_t v2 = objc_msgSend(v1, "na_all:", &__block_literal_global_44);

  return v2;
}

- (uint64_t)hf_areAllServicesInSameRoom
{
  uint64_t v2 = [a1 services];
  v3 = [v2 firstObject];
  v4 = objc_msgSend(v3, "hf_parentRoom");

  v5 = [a1 services];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__HMServiceGroup_HFAdditions__hf_areAllServicesInSameRoom__block_invoke;
  v9[3] = &unk_26408E0E8;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "na_all:", v9);

  return v7;
}

- (id)hf_serviceDescriptor
{
  v1 = (void *)MEMORY[0x263F08760];
  uint64_t v2 = [a1 services];
  v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_3_6);
  v4 = [v1 setWithArray:v3];

  v5 = objc_msgSend(v4, "na_mostCommonObject");

  return v5;
}

@end