@interface tvOS_AVControlItemAccessibilityAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)_cancelPiPControlItem;
+ (id)_startPiPControlItem;
+ (id)_stopPiPControlItem;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
@end

@implementation tvOS_AVControlItemAccessibilityAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVControlItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"AVControlItem", @"_cancelPiPControlItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"AVControlItem", @"_stopPiPControlItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"AVControlItem", @"_startPiPControlItem", "@", 0);
  [v3 validateClass:@"PBSPictureInPictureController"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"PBSPictureInPictureController", @"sharedInstance", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PBSPictureInPictureController", @"currentState", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PBSPictureInPictureState", @"isPictureInPictureActive", "B", 0);
}

+ (id)_cancelPiPControlItem
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___tvOS_AVControlItemAccessibilityAccessibility;
  v2 = objc_msgSendSuper2(&v5, sel__cancelPiPControlItem);
  id v3 = accessibilityLocalizedString(@"pip.cancel.button");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

+ (id)_stopPiPControlItem
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___tvOS_AVControlItemAccessibilityAccessibility;
  v2 = objc_msgSendSuper2(&v5, sel__stopPiPControlItem);
  id v3 = accessibilityLocalizedString(@"pip.stop.button");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

+ (id)_startPiPControlItem
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___tvOS_AVControlItemAccessibilityAccessibility;
  v2 = objc_msgSendSuper2(&v4, sel__startPiPControlItem);
  [v2 _setAccessibilityLabelBlock:&__block_literal_global_3];

  return v2;
}

@end