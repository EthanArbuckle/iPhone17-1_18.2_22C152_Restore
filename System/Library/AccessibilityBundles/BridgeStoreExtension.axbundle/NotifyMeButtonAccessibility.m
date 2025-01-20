@interface NotifyMeButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation NotifyMeButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BridgeStoreExtension.NotifyMeButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)NotifyMeButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(NotifyMeButtonAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  return accessibilityAppStoreLocalizedString(@"notify.button");
}

@end