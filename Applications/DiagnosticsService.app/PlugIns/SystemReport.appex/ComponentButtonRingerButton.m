@interface ComponentButtonRingerButton
- (BOOL)isPresent;
@end

@implementation ComponentButtonRingerButton

- (BOOL)isPresent
{
  return MGGetBoolAnswer();
}

@end