@interface ComponentButtonVolumeDecrement
- (BOOL)isPresent;
@end

@implementation ComponentButtonVolumeDecrement

- (BOOL)isPresent
{
  return MGGetBoolAnswer();
}

@end