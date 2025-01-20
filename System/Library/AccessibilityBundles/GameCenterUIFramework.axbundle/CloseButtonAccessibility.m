@interface CloseButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation CloseButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GameCenterUI.CloseButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return AXGameCenterUIFrameworkLocString(@"CLOSE");
}

@end