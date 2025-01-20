@interface TIPreferencesControllerAccessibility__UIKit__TextInput
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (TIPreferencesControllerAccessibility__UIKit__TextInput)init;
- (id)_accessibilityMouseKeysEnabled;
- (id)valueForPreferenceKey:(id)a3;
- (void)_accessibilitySetMouseKeysEnabled:(uint64_t)a1;
- (void)_accessibilityUpdateMouseKeysSetting;
@end

@implementation TIPreferencesControllerAccessibility__UIKit__TextInput

- (id)valueForPreferenceKey:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v8 = 0;
  if (_AXSAssistiveTouchEnabled())
  {
    id v7 = -[TIPreferencesControllerAccessibility__UIKit__TextInput _accessibilityMouseKeysEnabled](v10);
    if (!v7)
    {
      -[TIPreferencesControllerAccessibility__UIKit__TextInput _accessibilityUpdateMouseKeysSetting]((uint64_t)v10);
      id v7 = -[TIPreferencesControllerAccessibility__UIKit__TextInput _accessibilityMouseKeysEnabled](v10);
    }
    char v8 = [v7 BOOLValue] & 1;
    objc_storeStrong(&v7, 0);
  }
  v8 &= 1u;
  if (([location[0] isEqualToString:*MEMORY[0x263F7E710]] & 1) != 0
    && (_AXSAssistiveTouchScannerEnabled() || (v8 & 1) != 0))
  {
    id v11 = MEMORY[0x263EFFA80];
    int v6 = 1;
  }
  else
  {
    v5.receiver = v10;
    v5.super_class = (Class)TIPreferencesControllerAccessibility__UIKit__TextInput;
    id v11 = [(TIPreferencesControllerAccessibility__UIKit__TextInput *)&v5 valueForPreferenceKey:location[0]];
    int v6 = 1;
  }
  objc_storeStrong(location, 0);
  v3 = v11;

  return v3;
}

+ (id)safeCategoryTargetClassName
{
  return @"TIPreferencesController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityMouseKeysEnabled
{
  if (a1) {
    id v2 = objc_getAssociatedObject(a1, &__TIPreferencesController___accessibilityMouseKeysEnabled);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)_accessibilitySetMouseKeysEnabled:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedObject();
  }
  objc_storeStrong(&location, 0);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"TIPreferencesController", @"valueForPreferenceKey:", "@", 0);
  objc_storeStrong(v4, obj);
}

- (TIPreferencesControllerAccessibility__UIKit__TextInput)init
{
  SEL v13 = a2;
  v14 = 0;
  v12.receiver = self;
  v12.super_class = (Class)TIPreferencesControllerAccessibility__UIKit__TextInput;
  v14 = [(TIPreferencesControllerAccessibility__UIKit__TextInput *)&v12 init];
  objc_storeStrong((id *)&v14, v14);
  objc_initWeak(&from, v14);
  id v4 = (id)[MEMORY[0x263F22938] sharedInstance];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  char v8 = __62__TIPreferencesControllerAccessibility__UIKit__TextInput_init__block_invoke;
  v9 = &unk_2650AE1B8;
  objc_copyWeak(v10, &from);
  [v4 registerUpdateBlock:&v5 forRetrieveSelector:sel_assistiveTouchMouseKeysEnabled withListener:v14];

  objc_destroyWeak(v10);
  uint64_t v3 = v14;
  objc_destroyWeak(&from);
  objc_storeStrong((id *)&v14, 0);
  return v3;
}

- (void)_accessibilityUpdateMouseKeysSetting
{
  if (a1)
  {
    v1 = NSNumber;
    id v3 = (id)[MEMORY[0x263F22938] sharedInstance];
    id v2 = (id)objc_msgSend(v1, "numberWithBool:", objc_msgSend(v3, "assistiveTouchMouseKeysEnabled") & 1);
    -[TIPreferencesControllerAccessibility__UIKit__TextInput _accessibilitySetMouseKeysEnabled:](a1, v2);
  }
}

@end