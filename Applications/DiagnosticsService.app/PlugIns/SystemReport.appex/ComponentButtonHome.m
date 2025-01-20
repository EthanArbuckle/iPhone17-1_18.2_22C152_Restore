@interface ComponentButtonHome
- (BOOL)isPresent;
@end

@implementation ComponentButtonHome

- (BOOL)isPresent
{
  v2 = [(ComponentButtonBase *)self buttonsDetected];
  unsigned __int8 v3 = [v2 containsObject:@"menu"];

  return v3;
}

@end