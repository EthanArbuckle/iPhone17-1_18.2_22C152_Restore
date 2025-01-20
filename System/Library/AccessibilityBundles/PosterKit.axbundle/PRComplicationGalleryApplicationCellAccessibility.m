@interface PRComplicationGalleryApplicationCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PRComplicationGalleryApplicationCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PRComplicationGalleryApplicationCell";
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
  v2 = [(PRComplicationGalleryApplicationCellAccessibility *)self safeValueForKey:@"titleView"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PRComplicationGalleryApplicationCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(PRComplicationGalleryApplicationCellAccessibility *)&v3 accessibilityTraits];
}

@end