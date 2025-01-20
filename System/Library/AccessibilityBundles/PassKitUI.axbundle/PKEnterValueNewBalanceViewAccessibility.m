@interface PKEnterValueNewBalanceViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation PKEnterValueNewBalanceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKEnterValueNewBalanceView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityElements
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  v3 = [(PKEnterValueNewBalanceViewAccessibility *)self safeValueForKey:@"_label"];
  v4 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

@end