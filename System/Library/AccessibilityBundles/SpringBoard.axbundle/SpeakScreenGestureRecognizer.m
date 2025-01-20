@interface SpeakScreenGestureRecognizer
- (int64_t)_touchInterfaceOrientation;
@end

@implementation SpeakScreenGestureRecognizer

- (int64_t)_touchInterfaceOrientation
{
  return [(id)*MEMORY[0x263F1D020] activeInterfaceOrientation];
}

@end