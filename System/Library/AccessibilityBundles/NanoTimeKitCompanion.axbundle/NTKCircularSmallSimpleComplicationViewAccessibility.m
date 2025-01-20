@interface NTKCircularSmallSimpleComplicationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateImageViewWithImageProvider:(id)a3;
@end

@implementation NTKCircularSmallSimpleComplicationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKCircularSmallSimpleComplicationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCircularSmallSimpleComplicationView", @"imageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCircularSmallSimpleComplicationView", @"_updateImageViewWithImageProvider:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CDStackedImagesComplicationImageView", @"imageProvider", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)NTKCircularSmallSimpleComplicationViewAccessibility;
  [(NTKCircularSmallSimpleComplicationViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(NTKCircularSmallSimpleComplicationViewAccessibility *)self safeValueForKey:@"_imageView"];
  v4 = [v3 safeValueForKey:@"imageProvider"];
  v5 = [v4 accessibilityLabel];
  [v3 setAccessibilityLabel:v5];
}

- (void)_updateImageViewWithImageProvider:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCircularSmallSimpleComplicationViewAccessibility;
  [(NTKCircularSmallSimpleComplicationViewAccessibility *)&v4 _updateImageViewWithImageProvider:a3];
  [(NTKCircularSmallSimpleComplicationViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end