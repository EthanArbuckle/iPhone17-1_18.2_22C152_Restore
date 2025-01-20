@interface UIMapsToolbarButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation UIMapsToolbarButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIToolbarButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(UIMapsToolbarButtonAccessibility *)self accessibilityIdentification];
  if ([v3 isEqualToString:@"settingsButton"])
  {
    uint64_t v4 = AXMapsLocString(@"SETTINGS_BUTTON");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIMapsToolbarButtonAccessibility;
    uint64_t v4 = [(UIMapsToolbarButtonAccessibility *)&v7 accessibilityLabel];
  }
  v5 = (void *)v4;

  return v5;
}

@end