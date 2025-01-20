@interface HMMediaProfile(HRERecommendableObjectProtocol)
- (id)hre_actionTypes;
- (id)hre_characteristics;
- (id)hre_matchingTypes;
- (id)hre_parentRoom;
- (id)hre_primaryType;
- (uint64_t)hre_characteristicTypeForActionType:()HRERecommendableObjectProtocol;
- (uint64_t)hre_isActionable;
- (uint64_t)hre_isMediaObject;
- (uint64_t)hre_isVisible;
@end

@implementation HMMediaProfile(HRERecommendableObjectProtocol)

- (id)hre_actionTypes
{
  return +[HREDerivedActionUtilities actionTypesForProfile:a1];
}

- (uint64_t)hre_characteristicTypeForActionType:()HRERecommendableObjectProtocol
{
  return 0;
}

- (id)hre_parentRoom
{
  v1 = [a1 accessory];
  v2 = [v1 room];

  return v2;
}

- (id)hre_primaryType
{
  if (_MergedGlobals_15 != -1) {
    dispatch_once(&_MergedGlobals_15, &__block_literal_global_103);
  }
  v0 = (void *)qword_268944AE8;

  return v0;
}

- (id)hre_matchingTypes
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __67__HMMediaProfile_HRERecommendableObjectProtocol__hre_matchingTypes__block_invoke;
  v3[3] = &unk_264CF3768;
  v3[4] = a1;
  v1 = __67__HMMediaProfile_HRERecommendableObjectProtocol__hre_matchingTypes__block_invoke((uint64_t)v3);

  return v1;
}

- (id)hre_characteristics
{
  if (qword_268944B00 != -1) {
    dispatch_once(&qword_268944B00, &__block_literal_global_107);
  }
  v0 = (void *)qword_268944B08;

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
  v1 = [a1 accessory];
  uint64_t v2 = objc_msgSend(v1, "hre_isVisible");

  return v2;
}

- (uint64_t)hre_isMediaObject
{
  return 1;
}

@end