@interface STBarViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)_accessibilityParentForFindingScrollParent;
- (id)accessibilityLabel;
- (unint64_t)_accessibilityUnderlyingRepresentedTimePeriod;
- (void)_accessibilitySetUnderlyingRepresentedTimePeriod:(unint64_t)a3;
@end

@implementation STBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STBarView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STBarView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"STUsageGraphViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STBarView", @"dataPoint", "@", 0);
}

- (unint64_t)_accessibilityUnderlyingRepresentedTimePeriod
{
  return MEMORY[0x270F0A478](self, &__STBarViewAccessibility___accessibilityUnderlyingRepresentedTimePeriod);
}

- (void)_accessibilitySetUnderlyingRepresentedTimePeriod:(unint64_t)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(STBarViewAccessibility *)self safeValueForKey:@"dataPoint"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (CGRect)accessibilityFrame
{
  v19.receiver = self;
  v19.super_class = (Class)STBarViewAccessibility;
  [(STBarViewAccessibility *)&v19 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  v11 = [(STBarViewAccessibility *)self _accessibilityFindViewAncestor:&__block_literal_global_1 startWithSelf:0];
  v12 = [v11 safeUIViewForKey:@"view"];

  if (v12)
  {
    [v12 accessibilityFrame];
    memset(&slice, 0, sizeof(slice));
    memset(&v17, 0, sizeof(v17));
    CGRectDivide(v20, &slice, &v17, v10, CGRectMaxYEdge);
    double v6 = v6 - v17.size.height;
    CGFloat v10 = v10 + v17.size.height;
  }

  double v13 = v4;
  double v14 = v6;
  double v15 = v8;
  double v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

uint64_t __44__STBarViewAccessibility_accessibilityFrame__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x24565EFD0](@"STUsageGraphViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_accessibilityParentForFindingScrollParent
{
  objc_opt_class();
  id v2 = __UIAccessibilityCastAsClass();
  double v3 = [v2 superview];

  return v3;
}

@end