@interface _CSScreenEdgePanGestureRecognizer
- (int64_t)_touchInterfaceOrientation;
@end

@implementation _CSScreenEdgePanGestureRecognizer

- (int64_t)_touchInterfaceOrientation
{
  return [(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation];
}

@end