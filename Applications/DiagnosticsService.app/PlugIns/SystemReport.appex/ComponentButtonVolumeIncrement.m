@interface ComponentButtonVolumeIncrement
- (BOOL)isPresent;
@end

@implementation ComponentButtonVolumeIncrement

- (BOOL)isPresent
{
  return MGGetBoolAnswer();
}

@end