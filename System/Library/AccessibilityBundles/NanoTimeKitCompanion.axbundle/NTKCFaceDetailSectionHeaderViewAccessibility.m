@interface NTKCFaceDetailSectionHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation NTKCFaceDetailSectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKCFaceDetailSectionHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCFaceDetailSectionHeaderView", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCFaceDetailSectionHeaderView", @"subtitle", "@", 0);
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitHeader;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(NTKCFaceDetailSectionHeaderViewAccessibility *)self safeValueForKey:@"title"];
  v6 = [(NTKCFaceDetailSectionHeaderViewAccessibility *)self safeValueForKey:@"subtitle"];
  v4 = __UIAXStringForVariables();

  return v4;
}

@end