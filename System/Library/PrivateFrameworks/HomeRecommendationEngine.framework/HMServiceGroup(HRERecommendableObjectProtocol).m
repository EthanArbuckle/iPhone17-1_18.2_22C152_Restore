@interface HMServiceGroup(HRERecommendableObjectProtocol)
- (id)hre_actionTypes;
- (id)hre_characteristicTypeForActionType:()HRERecommendableObjectProtocol;
- (id)hre_characteristics;
- (id)hre_home;
- (id)hre_matchingTypes;
- (id)hre_parentRoom;
- (id)hre_primaryType;
- (uint64_t)hre_isActionable;
- (uint64_t)hre_isMediaObject;
- (uint64_t)hre_isVisible;
@end

@implementation HMServiceGroup(HRERecommendableObjectProtocol)

- (id)hre_actionTypes
{
  v1 = (void *)MEMORY[0x263EFFA08];
  v2 = [a1 services];
  v3 = [v1 setWithArray:v2];
  v4 = objc_msgSend(v3, "na_flatMap:", &__block_literal_global_90);

  return v4;
}

- (id)hre_characteristicTypeForActionType:()HRERecommendableObjectProtocol
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = objc_msgSend(a1, "services", 0);
  v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "hre_actionTypes");
        char v11 = [v10 containsObject:v4];

        if (v11)
        {
          v6 = objc_msgSend(v9, "hre_characteristicTypeForActionType:", v4);
          goto LABEL_11;
        }
      }
      v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)hre_home
{
  v1 = [a1 services];
  v2 = [v1 firstObject];
  v3 = [v2 home];

  return v3;
}

- (id)hre_parentRoom
{
  if (objc_msgSend(a1, "hf_areAllServicesInSameRoom"))
  {
    v2 = [a1 services];
    v3 = [v2 firstObject];
    id v4 = objc_msgSend(v3, "hre_parentRoom");
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)hre_primaryType
{
  v1 = objc_msgSend(a1, "hf_serviceDescriptor");
  v2 = [v1 serviceType];

  return v2;
}

- (id)hre_matchingTypes
{
  v1 = (void *)MEMORY[0x263EFFA08];
  v2 = objc_msgSend(a1, "hre_primaryType");
  v3 = objc_msgSend(v1, "na_setWithSafeObject:", v2);

  return v3;
}

- (id)hre_characteristics
{
  v1 = objc_msgSend(a1, "hf_containedServices");
  v2 = objc_msgSend(v1, "na_flatMap:", &__block_literal_global_92);

  return v2;
}

- (uint64_t)hre_isActionable
{
  v1 = [a1 services];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_95);

  return v2;
}

- (uint64_t)hre_isVisible
{
  v1 = [a1 services];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_97);

  return v2;
}

- (uint64_t)hre_isMediaObject
{
  return 0;
}

@end