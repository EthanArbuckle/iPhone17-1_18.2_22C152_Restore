@interface UIKBInputDelegateManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)callShouldReplaceExtendedRange:(int64_t)a3 withText:(id)a4 includeMarkedText:(BOOL)a5;
- (void)_deleteBackwardAndNotify:(BOOL)a3 reinsertText:(BOOL)a4;
- (void)insertText:(id)a3 updateInputSource:(BOOL)a4;
@end

@implementation UIKBInputDelegateManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIKBInputDelegateManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v9 = location;
  id v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = "@";
  v3 = "B";
  v4 = @"UIKBInputDelegateManager";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "q", "@", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"__content", v7, 0);
  v5 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"insertText:updateInputSource:", v7, v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_deleteBackwardAndNotify:reinsertText:", v5, v3, v3, 0);
  [location[0] validateClass:@"WKContentView"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKeyboardImpl", @"inlineTextCompletionController", v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIInlineTextCompletionController", @"lastAcceptedTextCompletion", v7, 0);
  v6 = @"_UIInlineTextCompletion";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"input", v7, 0);
  objc_storeStrong(v9, v8);
}

- (BOOL)callShouldReplaceExtendedRange:(int64_t)a3 withText:(id)a4 includeMarkedText:(BOOL)a5
{
  v26 = self;
  SEL v25 = a2;
  int64_t v24 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  BOOL v22 = a5;
  char v21 = 0;
  v20.receiver = v26;
  v20.super_class = (Class)UIKBInputDelegateManagerAccessibility;
  char v21 = [(UIKBInputDelegateManagerAccessibility *)&v20 callShouldReplaceExtendedRange:v24 withText:location includeMarkedText:a5];
  if (v21)
  {
    v14[1] = (id)MEMORY[0x263EF8330];
    int v15 = -1073741824;
    int v16 = 0;
    v17 = __99__UIKBInputDelegateManagerAccessibility_callShouldReplaceExtendedRange_withText_includeMarkedText___block_invoke;
    v18 = &unk_2650ADF18;
    v19 = v26;
    AXPerformSafeBlock();
    v14[0] = (id)[MEMORY[0x263F1C738] activeInstance];
    id v13 = (id)[v14[0] safeValueForKeyPath:@"inlineTextCompletionController.lastAcceptedTextCompletion"];
    id v8 = (id)[v13 safeStringForKey:@"candidate"];
    char v11 = 0;
    BOOL v9 = 0;
    if ([v8 isEqualToString:location])
    {
      id v12 = (id)[v13 safeStringForKey:@"input"];
      char v11 = 1;
      uint64_t v5 = [v12 length];
      BOOL v9 = v5 == v24;
    }
    if (v11) {

    }
    if (!v9) {
      UIAccessibilityPostNotification(*MEMORY[0x263F81358], location);
    }
    objc_storeStrong(&v13, 0);
    objc_storeStrong(v14, 0);
    objc_storeStrong((id *)&v19, 0);
  }
  char v7 = v21;
  objc_storeStrong(&location, 0);
  return v7 & 1;
}

void __99__UIKBInputDelegateManagerAccessibility_callShouldReplaceExtendedRange_withText_includeMarkedText___block_invoke(uint64_t a1)
{
  uint64_t v7 = a1;
  uint64_t v6 = a1;
  char v5 = 0;
  objc_opt_class();
  id v2 = (id)[*(id *)(a1 + 32) safeValueForKey:@"__content"];
  id v4 = (id)__UIAccessibilityCastAsSafeCategory();

  id v3 = v4;
  objc_storeStrong(&v4, 0);
  -[UITextInputUIResponderAccessibility _axResetFKAFocusToFirstResponder](v3);
}

- (void)insertText:(id)a3 updateInputSource:(BOOL)a4
{
  BOOL v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v7 = a4;
  v6.receiver = v9;
  v6.super_class = (Class)UIKBInputDelegateManagerAccessibility;
  [(UIKBInputDelegateManagerAccessibility *)&v6 insertText:location[0] updateInputSource:a4];
  id v5 = (id)[(UIKBInputDelegateManagerAccessibility *)v9 safeValueForKey:@"keyInputDelegate"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      NSClassFromString(&cfstr_Wkcontentview.isa);
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [(UIKBInputDelegateManagerAccessibility *)v9 _accessibilityPostValueChangedNotificationWithChangeType:*MEMORY[0x263F21C50]];
      }
    }
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)_deleteBackwardAndNotify:(BOOL)a3 reinsertText:(BOOL)a4
{
  BOOL v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  BOOL v6 = a4;
  v5.receiver = self;
  v5.super_class = (Class)UIKBInputDelegateManagerAccessibility;
  [(UIKBInputDelegateManagerAccessibility *)&v5 _deleteBackwardAndNotify:a3 reinsertText:a4];
  id location = (id)[(UIKBInputDelegateManagerAccessibility *)v9 safeValueForKey:@"keyInputDelegate"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      NSClassFromString(&cfstr_Wkcontentview.isa);
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [(UIKBInputDelegateManagerAccessibility *)v9 _accessibilityPostValueChangedNotificationWithChangeType:*MEMORY[0x263F21C40]];
      }
    }
  }
  objc_storeStrong(&location, 0);
}

@end