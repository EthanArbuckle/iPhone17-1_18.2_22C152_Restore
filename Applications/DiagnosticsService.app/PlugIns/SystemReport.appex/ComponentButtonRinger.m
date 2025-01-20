@interface ComponentButtonRinger
- (BOOL)isPresent;
@end

@implementation ComponentButtonRinger

- (BOOL)isPresent
{
  char v2 = MGGetBoolAnswer();
  return v2 & ~MGGetBoolAnswer();
}

@end