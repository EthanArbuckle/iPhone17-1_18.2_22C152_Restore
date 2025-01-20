@interface HMService(HRERecommendableObjectProtocol)
- (id)hre_actionTypes;
- (id)hre_characteristicTypeForActionType:()HRERecommendableObjectProtocol;
- (id)hre_characteristics;
- (id)hre_matchingTypes;
- (id)hre_parentRoom;
- (id)hre_primaryType;
- (uint64_t)hre_isActionable;
- (uint64_t)hre_isMediaObject;
@end

@implementation HMService(HRERecommendableObjectProtocol)

- (id)hre_actionTypes
{
  v1 = (void *)MEMORY[0x263EFFA08];
  v2 = [a1 characteristics];
  v3 = [v1 setWithArray:v2];
  v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_82);

  return v4;
}

- (id)hre_characteristicTypeForActionType:()HRERecommendableObjectProtocol
{
  id v4 = a3;
  v5 = [a1 associatedServiceType];
  if (v5)
  {
    v6 = +[HREDerivedActionUtilities characteristicTypeForActionType:v4 serviceType:v5];
  }
  else
  {
    v7 = [a1 serviceType];
    v6 = +[HREDerivedActionUtilities characteristicTypeForActionType:v4 serviceType:v7];
  }

  return v6;
}

- (id)hre_parentRoom
{
  v1 = [a1 accessory];
  v2 = [v1 room];

  return v2;
}

- (id)hre_primaryType
{
  v2 = [a1 associatedServiceType];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [a1 serviceType];
  }
  v5 = v4;

  return v5;
}

- (id)hre_matchingTypes
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [a1 associatedServiceType];
  id v4 = v3;
  if (!v3)
  {
    id v4 = [a1 serviceType];
  }
  v8[0] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  v6 = [v2 setWithArray:v5];

  if (!v3) {

  }
  return v6;
}

- (id)hre_characteristics
{
  v1 = (void *)MEMORY[0x263EFFA08];
  v2 = [a1 characteristics];
  v3 = [v1 setWithArray:v2];

  return v3;
}

- (uint64_t)hre_isActionable
{
  id v2 = objc_alloc_init(MEMORY[0x263F47BC8]);
  id v3 = objc_alloc(MEMORY[0x263F47AA0]);
  id v4 = [a1 accessory];
  v5 = (void *)[v3 initWithAccessory:v4 valueSource:v2];

  v6 = [MEMORY[0x263F47C20] serviceItemForService:a1 valueSource:v2];
  if ([v5 containsActions]) {
    uint64_t v7 = [v6 containsActions];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

- (uint64_t)hre_isMediaObject
{
  return 0;
}

@end