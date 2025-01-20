@interface UIKeyboardCandidateViewStateAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setArrowButtonPosition:(int64_t)a3;
@end

@implementation UIKeyboardCandidateViewStateAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIKeyboardCandidateViewState";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKeyboardCandidateViewState", @"setArrowButtonPosition:", "v", "q", 0);
  objc_storeStrong(v4, obj);
}

- (void)setArrowButtonPosition:(int64_t)a3
{
  v8 = self;
  SEL v7 = a2;
  int64_t v6 = a3;
  id v3 = (id)[MEMORY[0x263F1C738] activeInstance];
  char IsPad = 0;
  if ([v3 accessibilityUsesExtendedKeyboardPredictionsEnabled]) {
    char IsPad = AXDeviceIsPad();
  }

  if (IsPad) {
    int64_t v6 = 0;
  }
  v5.receiver = v8;
  v5.super_class = (Class)UIKeyboardCandidateViewStateAccessibility;
  [(UIKeyboardCandidateViewStateAccessibility *)&v5 setArrowButtonPosition:v6];
}

@end