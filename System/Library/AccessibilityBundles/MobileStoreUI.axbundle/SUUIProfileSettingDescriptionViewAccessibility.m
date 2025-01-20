@interface SUUIProfileSettingDescriptionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation SUUIProfileSettingDescriptionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIProfileSettingDescriptionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIProfileSettingDescriptionViewAccessibility;
  [(SUUIProfileSettingDescriptionViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(SUUIProfileSettingDescriptionViewAccessibility *)self safeValueForKey:@"_imageView"];
  [v3 setIsAccessibilityElement:0];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SUUIProfileSettingDescriptionViewAccessibility;
  [(SUUIProfileSettingDescriptionViewAccessibility *)&v3 layoutSubviews];
  [(SUUIProfileSettingDescriptionViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end