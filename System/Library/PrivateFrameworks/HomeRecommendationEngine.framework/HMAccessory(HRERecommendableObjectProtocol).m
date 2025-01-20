@interface HMAccessory(HRERecommendableObjectProtocol)
- (id)_containedRecommendableObjects;
- (id)hre_actionTypes;
- (id)hre_characteristicTypeForActionType:()HRERecommendableObjectProtocol;
- (id)hre_characteristics;
- (id)hre_matchingTypes;
- (id)hre_primaryType;
- (uint64_t)hre_isActionable;
- (uint64_t)hre_isMediaObject;
@end

@implementation HMAccessory(HRERecommendableObjectProtocol)

- (id)_containedRecommendableObjects
{
  v2 = [MEMORY[0x263EFF9C0] set];
  v3 = [a1 services];
  [v2 addObjectsFromArray:v3];

  v4 = [a1 profiles];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__HMAccessory_HRERecommendableObjectProtocol___containedRecommendableObjects__block_invoke;
  v7[3] = &unk_264CF3678;
  id v5 = v2;
  id v8 = v5;
  objc_msgSend(v4, "na_each:", v7);

  return v5;
}

- (id)hre_actionTypes
{
  v1 = [a1 _containedRecommendableObjects];
  v2 = objc_msgSend(v1, "na_flatMap:", &__block_literal_global);

  return v2;
}

- (id)hre_characteristicTypeForActionType:()HRERecommendableObjectProtocol
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(a1, "services", 0);
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

- (id)hre_primaryType
{
  v1 = objc_msgSend(a1, "hre_matchingTypes");
  if ([v1 count] == 1)
  {
    v2 = [v1 anyObject];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)hre_matchingTypes
{
  v1 = [a1 _containedRecommendableObjects];
  v2 = objc_msgSend(v1, "na_flatMap:", &__block_literal_global_72);

  return v2;
}

- (id)hre_characteristics
{
  v1 = [a1 _containedRecommendableObjects];
  v2 = objc_msgSend(v1, "na_flatMap:", &__block_literal_global_74);

  return v2;
}

- (uint64_t)hre_isActionable
{
  v1 = [a1 _containedRecommendableObjects];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_77);

  return v2;
}

- (uint64_t)hre_isMediaObject
{
  return 0;
}

@end