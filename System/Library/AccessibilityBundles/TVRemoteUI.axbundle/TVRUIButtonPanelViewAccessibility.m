@interface TVRUIButtonPanelViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
@end

@implementation TVRUIButtonPanelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVRUIButtonPanelView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"controls.container.label");
}

@end