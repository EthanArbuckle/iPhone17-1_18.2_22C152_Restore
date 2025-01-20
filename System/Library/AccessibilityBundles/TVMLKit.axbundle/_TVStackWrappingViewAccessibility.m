@interface _TVStackWrappingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)configureSupplementaryCellLayoutAttributesWithAutomaticInsets:(UIEdgeInsets)a3 sectionIndex:(int64_t)a4;
@end

@implementation _TVStackWrappingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVStackWrappingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVStackWrappingView", @"configureSupplementaryCellLayoutAttributesWithAutomaticInsets:sectionIndex:", "v", "{UIEdgeInsets=dddd}", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVStackWrappingView", @"stackView", "@", 0);
}

- (void)configureSupplementaryCellLayoutAttributesWithAutomaticInsets:(UIEdgeInsets)a3 sectionIndex:(int64_t)a4
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  v10.receiver = self;
  v10.super_class = (Class)_TVStackWrappingViewAccessibility;
  -[_TVStackWrappingViewAccessibility configureSupplementaryCellLayoutAttributesWithAutomaticInsets:sectionIndex:](&v10, sel_configureSupplementaryCellLayoutAttributesWithAutomaticInsets_sectionIndex_, a4);
  v9 = [(_TVStackWrappingViewAccessibility *)self safeValueForKey:@"stackView"];
  objc_msgSend(v9, "_accessibilitySetVisibleContentInset:", top, left, bottom, right);
}

@end