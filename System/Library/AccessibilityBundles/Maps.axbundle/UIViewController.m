@interface UIViewController
@end

@implementation UIViewController

uint64_t __68__UIViewController_AXMapsGlue___accessibilityFirstNonGrabberElement__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F81198] options];
  v1 = (void *)_accessibilityFirstNonGrabberElement_Options;
  _accessibilityFirstNonGrabberElement_Options = v0;

  v2 = (void *)_accessibilityFirstNonGrabberElement_Options;

  return [v2 setLeafNodePredicate:&__block_literal_global_433];
}

uint64_t __68__UIViewController_AXMapsGlue___accessibilityFirstNonGrabberElement__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 accessibilityIdentifier];
  char v4 = [v3 isEqualToString:@"Card grabber"];

  if (v4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [v2 isAccessibilityElement];
  }

  return v5;
}

@end