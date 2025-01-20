@interface AXInvertColors_UIKit
+ (int64_t)helperType;
+ (int64_t)loadPriority;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_UIKit

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIPortalView", @"setSourceView:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"accessibilityApplyInvertFilter", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"accessibilityInvertFilterApplied", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"accessibilityUnapplyInvertFilter", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWindow", @"_commonInitAttachedWindow:debugName:scene:", "v", "B", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"_imageView:", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIActivityGroupActivityCell", @"highlightedImageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIActivityGroupActivityCell", @"setHighlightedImageView:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"_inheritedRenderConfig", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIKBRenderConfig", @"lightKeyboard", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIActivityGroupActivityCell", @"imageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIStatusBarItemView", @"foregroundStyle", "@", 0);
  [v3 validateClass:@"UIStatusBarBatteryItemView" isKindOfClass:@"UIStatusBarItemView"];
  [v3 validateClass:@"_UIBatteryView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"_UIBatteryView" hasInstanceVariable:@"_boltLayer" withType:"CALayer"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIStatusBarForegroundStyleAttributes", @"tintColor", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextView", @"setAttributedText:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextView", @"setAttributedText:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextView", @"paste:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextView", @"_pasteAttributedString:pasteAsRichText:", "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextView", @"keyboardInputChanged:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIStatusBar_Base", @"foregroundColor", "@", 0);
  [v3 validateClass:@"UIStatusBar_Modern" isKindOfClass:@"UIStatusBar_Base"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIInteractiveHighlightEnvironment", @"newViewRecordForView:options:", "@", "@", "Q", 0);
  [v3 validateClass:@"_UIInteractiveHighlightViewRecord"];
  [v3 validateClass:@"_UIInteractiveHighlightViewRecord" hasInstanceVariable:@"_effectView" withType:"UIVisualEffectView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"accessibilityApplyInvertFilter", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"setBackgroundColor:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"imageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCellLayoutManager", @"defaultImageViewForCell:", "@", "@", 0);
  [v3 validateClass:@"_UIContextMenuUIController" hasInstanceVariable:@"_backgroundEffectView" withType:"UIVisualEffectView"];
  [v3 validateClass:@"UIKBKeyView" hasInstanceVariable:@"m_key" withType:"UIKBTree"];
  [v3 validateClass:@"UIKBTree" hasInstanceVariable:@"name" withType:"NSString"];
  [v3 validateClass:@"UIDynamicModifiedColor" hasInstanceVariable:@"_baseColor" withType:"UIDynamicColor"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIKBKeyView", @"layerForRenderFlags:", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIKBKeyView", @"displayLayer:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIVisualEffectView", @"_ensureBackgroundHost", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScreen", @"_notifyTraitsChangedAndPropagate", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITabBarController", @"transitionFromViewController:toViewController:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIPointerContentEffect", @"_ensureRelativeEffectViewOrderInContainer", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIPointerContentEffect", @"pointerPortal", "@", 0);
}

+ (void)installCategories:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B95C;
  block[3] = &unk_44528;
  id v6 = a3;
  uint64_t v3 = qword_83650;
  id v4 = v6;
  if (v3 != -1) {
    dispatch_once(&qword_83650, block);
  }
}

+ (int64_t)helperType
{
  return 1;
}

+ (int64_t)loadPriority
{
  return 2;
}

@end