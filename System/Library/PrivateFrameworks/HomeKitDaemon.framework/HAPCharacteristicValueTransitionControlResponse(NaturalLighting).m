@interface HAPCharacteristicValueTransitionControlResponse(NaturalLighting)
- (uint64_t)isNaturalLightingEnabledForCharacteristic:()NaturalLighting;
@end

@implementation HAPCharacteristicValueTransitionControlResponse(NaturalLighting)

- (uint64_t)isNaturalLightingEnabledForCharacteristic:()NaturalLighting
{
  id v4 = a3;
  v5 = [a1 transitionState];
  uint64_t v6 = [v5 isNaturalLightingEnabledForCharacteristic:v4];

  return v6;
}

@end