@interface UIRepeatedActionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setDisableRepeat:(BOOL)a3;
@end

@implementation UIRepeatedActionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIRepeatedAction";
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIRepeatedAction", @"setDisableRepeat:", "v", "B", 0);
  [location[0] validateClass:@"UIApplication" hasInstanceVariable:@"_keyRepeatAction" withType:"UIRepeatedAction"];
  objc_storeStrong(v4, obj);
}

- (void)setDisableRepeat:(BOOL)a3
{
  v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  char v5 = 0;
  BOOL v3 = 0;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v6 = (UIRepeatedActionAccessibility *)(id)[(id)*MEMORY[0x263F1D020] safeValueForKey:@"_keyRepeatAction"];
    char v5 = 1;
    BOOL v3 = v9 == v6;
  }
  if (v5) {

  }
  if (v3) {
    BOOL v7 = 1;
  }
  v4.receiver = v9;
  v4.super_class = (Class)UIRepeatedActionAccessibility;
  [(UIRepeatedActionAccessibility *)&v4 setDisableRepeat:v7];
}

@end