@interface _UITextOptionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation _UITextOptionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UITextOption";
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UITextOption", @"textChoice", "@", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v15 = self;
  SEL v14 = a2;
  uint64_t v13 = [(_UITextOptionAccessibility *)self safeIntegerForKey:@"type"];
  id v12 = (id)[(_UITextOptionAccessibility *)v15 safeStringForKey:@"textChoice"];
  if (v13)
  {
    if (v13 == 1)
    {
      id v16 = accessibilityLocalizedString(@"text.option.type.revert.label");
      int v11 = 1;
    }
    else
    {
      BOOL v10 = [v12 length] != 0;
      if (!v10)
      {
        id location = (id)AXLogAppAccessibility();
        os_log_type_t v8 = OS_LOG_TYPE_FAULT;
        if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_FAULT))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v17, v13);
          _os_log_fault_impl(&dword_2402B7000, (os_log_t)location, v8, "Unexpectedly missing text for text option with type: %ld", v17, 0xCu);
        }
        objc_storeStrong(&location, 0);
      }
      char v5 = 0;
      if (v10)
      {
        id v2 = v12;
      }
      else
      {
        v7.receiver = v15;
        v7.super_class = (Class)_UITextOptionAccessibility;
        id v6 = [(_UITextOptionAccessibility *)&v7 accessibilityLabel];
        char v5 = 1;
        id v2 = v6;
      }
      id v16 = v2;
      if (v5) {

      }
      int v11 = 1;
    }
  }
  else
  {
    id v16 = accessibilityLocalizedString(@"text.option.type.cancel.label");
    int v11 = 1;
  }
  objc_storeStrong(&v12, 0);
  v3 = v16;

  return v3;
}

@end