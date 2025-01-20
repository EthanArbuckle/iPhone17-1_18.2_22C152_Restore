@interface UIResponder
- (void)_maps_logResponderChain;
@end

@implementation UIResponder

- (void)_maps_logResponderChain
{
  NSLog(@"%@", a2, self);
  id v3 = [(UIResponder *)self nextResponder];
  objc_msgSend(v3, "_maps_logResponderChain");
}

@end