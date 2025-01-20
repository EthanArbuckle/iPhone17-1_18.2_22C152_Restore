@interface PRComplicationGalleryApplicationTitleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PRComplicationGalleryApplicationTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PRComplicationGalleryApplicationTitleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v2 = [(PRComplicationGalleryApplicationTitleViewAccessibility *)self safeValueForKey:@"textLabel"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3 = [(PRComplicationGalleryApplicationTitleViewAccessibility *)self accessibilityLabel];
  if (v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)PRComplicationGalleryApplicationTitleViewAccessibility;
    unint64_t v4 = *MEMORY[0x263F1CEF8] | [(PRComplicationGalleryApplicationTitleViewAccessibility *)&v7 accessibilityTraits];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PRComplicationGalleryApplicationTitleViewAccessibility;
    unint64_t v4 = [(PRComplicationGalleryApplicationTitleViewAccessibility *)&v6 accessibilityTraits];
  }

  return v4;
}

- (BOOL)isAccessibilityElement
{
  v2 = [(PRComplicationGalleryApplicationTitleViewAccessibility *)self accessibilityLabel];
  BOOL v3 = v2 != 0;

  return v3;
}

@end