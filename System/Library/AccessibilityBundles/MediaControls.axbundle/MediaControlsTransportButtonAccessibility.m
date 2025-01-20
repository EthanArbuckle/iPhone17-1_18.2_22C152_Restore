@interface MediaControlsTransportButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityCustomActions;
@end

@implementation MediaControlsTransportButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MediaControlsTransportButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityCustomActions
{
  v5.receiver = self;
  v5.super_class = (Class)MediaControlsTransportButtonAccessibility;
  v2 = [(MediaControlsTransportButtonAccessibility *)&v5 accessibilityCustomActions];
  v3 = AXGuaranteedMutableArray();

  UIAccessibilityControlCenterAttachOpenCloseCustomActionsIfNeeded();

  return v3;
}

@end