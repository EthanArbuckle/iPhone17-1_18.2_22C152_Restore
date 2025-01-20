@interface ComponentButtonCamera
- (BOOL)isPresent;
@end

@implementation ComponentButtonCamera

- (BOOL)isPresent
{
  v2 = [(ComponentButtonBase *)self buttonsDetected];
  unsigned __int8 v3 = [v2 containsObject:@"capture"];

  return v3;
}

@end