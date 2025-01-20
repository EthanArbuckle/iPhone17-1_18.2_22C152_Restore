@interface HKDecibelHearingLevelUnit
- (id)dimension;
@end

@implementation HKDecibelHearingLevelUnit

- (id)dimension
{
  return +[_HKBaseDimension hearingSensitivity];
}

@end