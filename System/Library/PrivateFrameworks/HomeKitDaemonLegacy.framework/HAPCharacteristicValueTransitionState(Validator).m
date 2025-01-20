@interface HAPCharacteristicValueTransitionState(Validator)
- (uint64_t)isValid;
@end

@implementation HAPCharacteristicValueTransitionState(Validator)

- (uint64_t)isValid
{
  v2 = [a1 activeTransitionContexts];

  if (!v2) {
    return 0;
  }
  v3 = [a1 activeTransitionContexts];
  uint64_t v4 = objc_msgSend(v3, "na_allObjectsPassTest:", &__block_literal_global_154960);

  return v4;
}

@end