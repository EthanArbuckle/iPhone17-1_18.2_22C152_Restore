@interface UIKeyboardTypingStyleEstimatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityKeyboardIsContinuousPathTracking;
- (void)beganContinuousPath;
- (void)endedContinuousPath;
@end

@implementation UIKeyboardTypingStyleEstimatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIKeyboardTypingStyleEstimator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"UIKeyboardTypingStyleEstimator";
  v4 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"endedContinuousPath", v4, 0);
  objc_storeStrong(v6, obj);
}

- (BOOL)_accessibilityKeyboardIsContinuousPathTracking
{
  return [(UIKeyboardTypingStyleEstimatorAccessibility *)self _accessibilityBoolValueForKey:@"ContinuousPath", a2, self] & 1;
}

- (void)beganContinuousPath
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIKeyboardTypingStyleEstimatorAccessibility;
  [(UIKeyboardTypingStyleEstimatorAccessibility *)&v2 beganContinuousPath];
  [(UIKeyboardTypingStyleEstimatorAccessibility *)v4 _accessibilitySetBoolValue:1 forKey:@"ContinuousPath"];
}

- (void)endedContinuousPath
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIKeyboardTypingStyleEstimatorAccessibility;
  [(UIKeyboardTypingStyleEstimatorAccessibility *)&v2 endedContinuousPath];
  [(UIKeyboardTypingStyleEstimatorAccessibility *)v4 _accessibilitySetBoolValue:0 forKey:@"ContinuousPath"];
}

@end