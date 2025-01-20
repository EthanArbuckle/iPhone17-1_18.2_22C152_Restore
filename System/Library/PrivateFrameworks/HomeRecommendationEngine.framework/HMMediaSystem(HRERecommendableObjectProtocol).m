@interface HMMediaSystem(HRERecommendableObjectProtocol)
- (id)hre_actionTypes;
- (id)hre_characteristics;
- (id)hre_matchingTypes;
- (id)hre_primaryType;
- (uint64_t)hre_characteristicTypeForActionType:()HRERecommendableObjectProtocol;
- (uint64_t)hre_isActionable;
- (uint64_t)hre_isMediaObject;
- (uint64_t)hre_isVisible;
@end

@implementation HMMediaSystem(HRERecommendableObjectProtocol)

- (id)hre_actionTypes
{
  v1 = [a1 mediaProfiles];
  v2 = objc_msgSend(v1, "na_flatMap:", &__block_literal_global_111);

  return v2;
}

- (uint64_t)hre_characteristicTypeForActionType:()HRERecommendableObjectProtocol
{
  return 0;
}

- (id)hre_primaryType
{
  if (qword_268944B10 != -1) {
    dispatch_once(&qword_268944B10, &__block_literal_global_115);
  }
  v0 = (void *)qword_268944B18;

  return v0;
}

- (id)hre_matchingTypes
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __66__HMMediaSystem_HRERecommendableObjectProtocol__hre_matchingTypes__block_invoke;
  v3[3] = &unk_264CF3768;
  v3[4] = a1;
  v1 = __66__HMMediaSystem_HRERecommendableObjectProtocol__hre_matchingTypes__block_invoke((uint64_t)v3);

  return v1;
}

- (id)hre_characteristics
{
  if (qword_268944B30 != -1) {
    dispatch_once(&qword_268944B30, &__block_literal_global_119);
  }
  v0 = (void *)qword_268944B38;

  return v0;
}

- (uint64_t)hre_isActionable
{
  id v2 = objc_alloc_init(MEMORY[0x263F47BC8]);
  v3 = (void *)[objc_alloc(MEMORY[0x263F47BA0]) initWithValueSource:v2 mediaProfileContainer:a1];
  uint64_t v4 = [v3 containsActions];

  return v4;
}

- (uint64_t)hre_isVisible
{
  v1 = [a1 mediaProfiles];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_122);

  return v2;
}

- (uint64_t)hre_isMediaObject
{
  return 1;
}

@end