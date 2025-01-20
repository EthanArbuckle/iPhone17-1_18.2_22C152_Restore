@interface MTSwitchCellAccessibility_temp
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation MTSwitchCellAccessibility_temp

+ (id)safeCategoryTargetClassName
{
  return @"MTSwitchCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTSwitchCell", @"toggle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTSwitchCell", @"toggleChanged:", "v", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  v2 = [(MTSwitchCellAccessibility_temp *)self safeValueForKey:@"toggle"];
  id v3 = [v2 accessibilityValue];

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(MTSwitchCellAccessibility_temp *)self safeValueForKey:@"toggle"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(MTSwitchCellAccessibility_temp *)self safeValueForKey:@"toggle"];
  [v2 accessibilityTraits];

  return _AXTraitsRemoveTrait();
}

@end