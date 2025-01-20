@interface SBUIPasscodeLockViewWithKeyboardAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)updateStatusText:(id)a3 subtitle:(id)a4 animated:(BOOL)a5;
@end

@implementation SBUIPasscodeLockViewWithKeyboardAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUIPasscodeLockViewWithKeyboard";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)updateStatusText:(id)a3 subtitle:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [(SBUIPasscodeLockViewWithKeyboardAccessibility *)self safeValueForKey:@"_statusField"];
  v11 = [v10 accessibilityLabel];

  if (([v11 isEqualToString:v8] & 1) == 0)
  {
    if ([v8 length])
    {
      v12 = [MEMORY[0x263F22968] server];
      char v13 = [v12 isSystemSleeping];

      if ((v13 & 1) == 0)
      {
        v14 = [MEMORY[0x263F21660] axAttributedStringWithString:v8];
        [v14 setAttribute:&unk_26F7F59B8 forKey:*MEMORY[0x263F216D8]];
        UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v14);
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SBUIPasscodeLockViewWithKeyboardAccessibility;
  [(SBUIPasscodeLockViewWithKeyboardAccessibility *)&v15 updateStatusText:v8 subtitle:v9 animated:v5];
}

@end