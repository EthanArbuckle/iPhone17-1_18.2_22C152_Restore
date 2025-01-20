@interface UIInputSwitcherAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)switchMode:(id)a3 withHUD:(BOOL)a4 withDelay:(BOOL)a5;
@end

@implementation UIInputSwitcherAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIInputSwitcher";
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
  id v5 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = "@";
  v3 = @"UIInputSwitcher";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", "B", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"loadedIdentifier", v4, 0);
  objc_storeStrong(v6, v5);
}

- (BOOL)switchMode:(id)a3 withHUD:(BOOL)a4 withDelay:(BOOL)a5
{
  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v30 = a4;
  BOOL v29 = a5;
  char v28 = 0;
  v27.receiver = v32;
  v27.super_class = (Class)UIInputSwitcherAccessibility;
  char v28 = [(UIInputSwitcherAccessibility *)&v27 switchMode:location[0] withHUD:a4 withDelay:a5];
  if ((v28 & 1) != 0 && location[0])
  {
    char v25 = 0;
    objc_opt_class();
    id v12 = (id)[(UIInputSwitcherAccessibility *)v32 safeValueForKey:@"loadedIdentifier"];
    id v24 = (id)__UIAccessibilityCastAsClass();

    id v23 = v24;
    objc_storeStrong(&v24, 0);
    id v26 = v23;
    id v11 = (id)[MEMORY[0x263F1C748] sharedInputModeController];
    id v22 = (id)[v11 inputModeWithIdentifier:v26];

    id v21 = (id)MEMORY[0x2455E67B0](v26);
    id v5 = (id)MEMORY[0x2455E66B0](v21);
    id v6 = v21;
    id v21 = v5;

    id v20 = (id)[v22 extendedDisplayName];
    id v19 = (id)UIKitAccessibilityLocalizedString();
    id v18 = (id)objc_msgSend(NSString, "stringWithFormat:", v19, v20);
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    if (v20)
    {
      uint64_t v16 = [v18 rangeOfString:v20];
      uint64_t v17 = v7;
    }
    else
    {
      uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v33 = 0;
      uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v36 = 0;
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v17 = 0;
    }
    id argument = (id)[MEMORY[0x263F21660] axAttributedStringWithString:v18];
    if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(argument, "setAttribute:forKey:withRange:", v21, *MEMORY[0x263F217A8], v16, v17);
    }
    [argument setAttribute:&unk_26F48EA38 forKey:*MEMORY[0x263F216D8]];
    UIAccessibilityPostNotification(*MEMORY[0x263F812D8], argument);
    v10 = (UIAccessibilityNotifications *)MEMORY[0x263F1CDC8];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], (id)*MEMORY[0x263F21988]);
    UIAccessibilityPostNotification(*v10, argument);
    objc_storeStrong(&argument, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v26, 0);
  }
  char v9 = v28;
  objc_storeStrong(location, 0);
  return v9 & 1;
}

@end