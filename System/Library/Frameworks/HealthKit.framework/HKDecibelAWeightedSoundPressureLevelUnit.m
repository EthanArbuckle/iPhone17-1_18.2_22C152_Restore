@interface HKDecibelAWeightedSoundPressureLevelUnit
- (id)dimension;
@end

@implementation HKDecibelAWeightedSoundPressureLevelUnit

- (id)dimension
{
  return +[_HKBaseDimension soundPressureLevel];
}

@end