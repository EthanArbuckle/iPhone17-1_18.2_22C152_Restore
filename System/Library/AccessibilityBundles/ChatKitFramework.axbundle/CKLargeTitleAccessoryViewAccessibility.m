@interface CKLargeTitleAccessoryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)newComposeButton;
+ (id)newOptionsButton;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CKLargeTitleAccessoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKLargeTitleAccessoryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKLargeTitleAccessoryView", @"accessoryButtons", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"CKLargeTitleAccessoryView", @"newComposeButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"CKLargeTitleAccessoryView", @"newOptionsButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)CKLargeTitleAccessoryViewAccessibility;
  [(CKLargeTitleAccessoryViewAccessibility *)&v21 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CKLargeTitleAccessoryViewAccessibility *)self safeArrayForKey:@"accessoryButtons"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v9 = [v8 accessibilityIdentifier];
        char v10 = [v9 isEqualToString:@"composeButton"];

        v11 = @"compose.button.text";
        if (v10) {
          goto LABEL_9;
        }
        v12 = [v8 accessibilityIdentifier];
        char v13 = [v12 isEqualToString:@"optionsButton"];

        v11 = @"more.button.text";
        if ((v13 & 1) == 0)
        {
          v14 = [v8 accessibilityIdentifier];
          int v15 = [v14 isEqualToString:@"quickHideButton"];

          v11 = @"quickhide.button.text";
          if (!v15) {
            continue;
          }
        }
LABEL_9:
        v16 = accessibilityLocalizedString(v11);
        [v8 setAccessibilityLabel:v16];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }
}

+ (id)newComposeButton
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CKLargeTitleAccessoryViewAccessibility;
  id v2 = objc_msgSendSuper2(&v5, sel_newComposeButton);
  id v3 = accessibilityLocalizedString(@"compose.button.text");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

+ (id)newOptionsButton
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CKLargeTitleAccessoryViewAccessibility;
  id v2 = objc_msgSendSuper2(&v5, sel_newOptionsButton);
  id v3 = accessibilityLocalizedString(@"more.button.text");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

@end