@interface AXInvertColors_AVKit
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_AVKit

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AVPlayerViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"AVFullScreenViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPresentationController", @"presentationTransitionWillBegin", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIPresentationController", @"containerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPresentationContext", @"backgroundView", "@", 0);
  [v3 validateClass:@"AVPresentationController" hasInstanceVariable:@"_context" withType:"AVPresentationContext"];
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"AVPlayerViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"AVPresentationContainerViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"__AVPlayerLayerViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"AVPresentationControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end