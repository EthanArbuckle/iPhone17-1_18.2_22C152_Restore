@interface UITraitCollection(SwiftUIStaging)
- (BOOL)_swiftui_sceneIsCaptured;
@end

@implementation UITraitCollection(SwiftUIStaging)

- (BOOL)_swiftui_sceneIsCaptured
{
  return (objc_opt_respondsToSelector() & 1) != 0 && [a1 sceneCaptureState] == 1;
}

@end