@interface SKUIProfileSettingDescriptionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation SKUIProfileSettingDescriptionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIProfileSettingDescriptionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIProfileSettingDescriptionViewAccessibility;
  [(SKUIProfileSettingDescriptionViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(SKUIProfileSettingDescriptionViewAccessibility *)self safeValueForKey:@"_imageView"];
  [v3 setIsAccessibilityElement:0];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SKUIProfileSettingDescriptionViewAccessibility;
  [(SKUIProfileSettingDescriptionViewAccessibility *)&v3 layoutSubviews];
  [(SKUIProfileSettingDescriptionViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end