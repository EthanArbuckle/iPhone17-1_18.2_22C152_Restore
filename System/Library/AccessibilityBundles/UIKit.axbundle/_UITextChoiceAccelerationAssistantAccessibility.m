@interface _UITextChoiceAccelerationAssistantAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)showPromptForReplacementCandidate:(id)a3 delay:(double)a4;
@end

@implementation _UITextChoiceAccelerationAssistantAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UITextChoiceAccelerationAssistant";
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UITextChoiceAccelerationAssistant", @"showPromptForReplacementCandidate:delay:", "B", "@", "d", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)showPromptForReplacementCandidate:(id)a3 delay:(double)a4
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v9 = a4;
  char v8 = 0;
  v7.receiver = v11;
  v7.super_class = (Class)_UITextChoiceAccelerationAssistantAccessibility;
  char v8 = [(_UITextChoiceAccelerationAssistantAccessibility *)&v7 showPromptForReplacementCandidate:location[0] delay:a4];
  if (v8) {
    UIAccessibilityPostNotification(*MEMORY[0x263F81200], 0);
  }
  char v5 = v8;
  objc_storeStrong(location, 0);
  return v5 & 1;
}

@end