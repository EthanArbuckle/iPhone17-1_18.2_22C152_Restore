@interface UITextInputControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axTextInputResponderAccessibilityParentElementForDelegate:(uint64_t)a1;
- (void)_accessibilityUpdateSelectionNotification:(id)a3;
- (void)_sendDelegateChangeNotificationsForText:(BOOL)a3 selection:(BOOL)a4;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)paste:(id)a3;
- (void)selectAll:(id)a3;
- (void)toggleBoldface:(id)a3;
- (void)toggleItalics:(id)a3;
- (void)toggleUnderline:(id)a3;
@end

@implementation UITextInputControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITextInputController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  id v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = "B";
  v4 = @"UITextInputController";
  v3 = "v";
  [location[0] validateClass:"B" hasInstanceMethod:"B" withFullSignature:0];
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"copy:", v3, "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"cut:", v3, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"paste:", v3, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"selectAll:", v3, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"toggleBoldface:", v3, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"toggleUnderline:", v3, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"toggleItalics:", v3, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"delegate", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_firstTextView", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_textInputTraits", v5, 0);
  [location[0] validateClass:@"UITextInputTraits" hasInstanceVariable:@"secureTextEntry" withType:v6];
  objc_storeStrong(v8, v7);
}

- (void)_sendDelegateChangeNotificationsForText:(BOOL)a3 selection:(BOOL)a4
{
  v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  BOOL v10 = a4;
  v9.receiver = self;
  v9.super_class = (Class)UITextInputControllerAccessibility;
  [(UITextInputControllerAccessibility *)&v9 _sendDelegateChangeNotificationsForText:a3 selection:a4];
  char v7 = 0;
  char v4 = 0;
  if (v10)
  {
    id v8 = (id)[(UITextInputControllerAccessibility *)v13 safeUIViewForKey:@"_firstTextView"];
    char v7 = 1;
    char v4 = [v8 isFirstResponder];
  }
  if (v7) {

  }
  if (v4)
  {
    BOOL v6 = v11;
    v5 = v13;
    AXPerformBlockAsynchronouslyOnMainThread();
    objc_storeStrong((id *)&v5, 0);
  }
}

void __88__UITextInputControllerAccessibility__sendDelegateChangeNotificationsForText_selection___block_invoke(uint64_t a1)
{
  char v5 = 0;
  LOBYTE(v4) = 1;
  if ((*(unsigned char *)(a1 + 40) & 1) == 0)
  {
    id v6 = (id)[*(id *)(a1 + 32) safeValueForKey:@"_textInputTraits"];
    char v5 = 1;
    int v4 = [v6 safeBoolForKey:@"secureTextEntry"] ^ 1;
  }
  if (v5) {

  }
  if (v4)
  {
    v1 = *(void **)(a1 + 32);
    id v2 = (id)[v1 safeValueForKey:@"delegate"];
    objc_msgSend(v1, "_accessibilityUpdateSelectionNotification:");
  }
}

- (id)_axTextInputResponderAccessibilityParentElementForDelegate:(uint64_t)a1
{
  uint64_t v13 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v13)
  {
    id v2 = (id)[location _accessibilityWindow];
    BOOL v9 = v2 == 0;

    if (v9)
    {
      id v14 = 0;
      int v11 = 1;
    }
    else
    {
      id v10 = location;
      while (v10 && ([v10 isAccessibilityElement] & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v3 = (id)[v10 _accessibilityResponderElement];
          id v4 = v10;
          id v10 = v3;

          break;
        }
        id v5 = (id)[v10 accessibilityContainer];
        id v6 = v10;
        id v10 = v5;
      }
      id v14 = v10;
      int v11 = 1;
      objc_storeStrong(&v10, 0);
    }
  }
  else
  {
    id v14 = 0;
    int v11 = 1;
  }
  objc_storeStrong(&location, 0);
  char v7 = v14;

  return v7;
}

- (void)_accessibilityUpdateSelectionNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  SEL v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id argument = 0;
  id v9 = (id)[location[0] _accessibilityFindAncestor:&__block_literal_global_47 startWithSelf:1];
  if ([v9 _accessibilityTextViewIgnoresValueChanges])
  {
    os_log_t oslog = (os_log_t)(id)AXLogCommon();
    os_log_type_t type = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v15, (uint64_t)v9);
      _os_log_impl(&dword_2402B7000, oslog, type, "Ignoring ax value notifications for %@", v15, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    int v6 = 1;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v9 accessibilityValueChangesAreReplacements] & 1) != 0)
    {
      uint64_t v13 = *MEMORY[0x263F21AF0];
      uint64_t v14 = MEMORY[0x263EFFA88];
      id v3 = (id)[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      id v4 = argument;
      id argument = v3;
    }
    id v5 = -[UITextInputControllerAccessibility _axTextInputResponderAccessibilityParentElementForDelegate:]((uint64_t)v12, location[0]);
    if (v5)
    {
      _UIAccessibilitySetAssociatedElementContextForNextNotification();
      UIAccessibilityPostNotification(*MEMORY[0x263F81340], argument);
    }
    objc_storeStrong(&v5, 0);
    int v6 = 0;
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&argument, 0);
  objc_storeStrong(location, 0);
}

uint64_t __80__UITextInputControllerAccessibility__accessibilityUpdateSelectionNotification___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  char isKindOfClass = 1;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (void)copy:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UITextInputControllerAccessibility;
  [(UITextInputControllerAccessibility *)&v3 copy:location[0]];
  [(UITextInputControllerAccessibility *)v5 _accessibilityPostPasteboardTextForOperation:*MEMORY[0x263F21B78]];
  objc_storeStrong(location, 0);
}

- (void)cut:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(UITextInputControllerAccessibility *)v5 _accessibilityIgnoreNextPostPasteboardTextOperation:*MEMORY[0x263F21B78]];
  v3.receiver = v5;
  v3.super_class = (Class)UITextInputControllerAccessibility;
  [(UITextInputControllerAccessibility *)&v3 cut:location[0]];
  [(UITextInputControllerAccessibility *)v5 _accessibilityPostPasteboardTextForOperation:*MEMORY[0x263F21B80]];
  objc_storeStrong(location, 0);
}

- (void)paste:(id)a3
{
  char v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = (id)[(UITextInputControllerAccessibility *)v7 safeValueForKey:@"delegate"];
  id v4 = -[UITextInputControllerAccessibility _axTextInputResponderAccessibilityParentElementForDelegate:]((uint64_t)v7, v5);
  [(UITextInputControllerAccessibility *)v7 _accessibilityPostPasteboardTextForOperation:*MEMORY[0x263F21BC0] associatedObject:v4];
  v3.receiver = v7;
  v3.super_class = (Class)UITextInputControllerAccessibility;
  [(UITextInputControllerAccessibility *)&v3 paste:location[0]];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)selectAll:(id)a3
{
  char v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UITextInputControllerAccessibility;
  [(UITextInputControllerAccessibility *)&v5 selectAll:location[0]];
  UIAccessibilityNotifications notification = *MEMORY[0x263F1CDC8];
  id v4 = accessibilityLocalizedString((id)*MEMORY[0x263F21BE8]);
  UIAccessibilityPostNotification(notification, v4);

  objc_storeStrong(location, 0);
}

- (void)toggleBoldface:(id)a3
{
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21.receiver = v23;
  v21.super_class = (Class)UITextInputControllerAccessibility;
  [(UITextInputControllerAccessibility *)&v21 toggleBoldface:location[0]];
  char v19 = 0;
  objc_opt_class();
  id v8 = (id)[(UITextInputControllerAccessibility *)v23 safeValueForKey:@"typingAttributes"];
  id v18 = (id)__UIAccessibilityCastAsClass();

  id v17 = v18;
  objc_storeStrong(&v18, 0);
  id v20 = v17;
  id v16 = (id)[v17 objectForKey:*MEMORY[0x263F814F0]];
  if (!v16)
  {
    char v7 = (void *)MEMORY[0x263F81708];
    [MEMORY[0x263F81708] systemFontSize];
    id v16 = (id)objc_msgSend(v7, "systemFontOfSize:");
  }
  id v5 = (id)[v16 fontDescriptor];
  BOOL v6 = ([v5 symbolicTraits] & 2) != 0;

  BOOL v15 = v6;
  char v12 = 0;
  char v10 = 0;
  if (v6)
  {
    id v13 = accessibilityLocalizedString(@"toggle.on");
    char v12 = 1;
    id v3 = v13;
  }
  else
  {
    id v11 = accessibilityLocalizedString(@"toggle.off");
    char v10 = 1;
    id v3 = v11;
  }
  id v14 = v3;
  if (v10) {

  }
  if (v12) {
  id v4 = accessibilityLocalizedString((id)*MEMORY[0x263F21B70]);
  }
  id argument = (id)__UIAXStringForVariables();

  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument);
  objc_storeStrong(&argument, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (void)toggleUnderline:(id)a3
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18.receiver = v20;
  v18.super_class = (Class)UITextInputControllerAccessibility;
  [(UITextInputControllerAccessibility *)&v18 toggleUnderline:location[0]];
  char v16 = 0;
  objc_opt_class();
  id v5 = (id)[(UITextInputControllerAccessibility *)v20 safeValueForKey:@"typingAttributes"];
  id v15 = (id)__UIAccessibilityCastAsClass();

  id v14 = v15;
  objc_storeStrong(&v15, 0);
  id v17 = v14;
  id v13 = (id)[v14 objectForKey:*MEMORY[0x263F815F8]];
  BOOL v12 = [v13 intValue] != 0;
  char v9 = 0;
  char v7 = 0;
  if (v12)
  {
    id v10 = accessibilityLocalizedString(@"toggle.on");
    char v9 = 1;
    id v3 = v10;
  }
  else
  {
    id v8 = accessibilityLocalizedString(@"toggle.off");
    char v7 = 1;
    id v3 = v8;
  }
  id v11 = v3;
  if (v7) {

  }
  if (v9) {
  id v4 = accessibilityLocalizedString((id)*MEMORY[0x263F21C10]);
  }
  id argument = (id)__UIAXStringForVariables();

  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument);
  objc_storeStrong(&argument, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)toggleItalics:(id)a3
{
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21.receiver = v23;
  v21.super_class = (Class)UITextInputControllerAccessibility;
  [(UITextInputControllerAccessibility *)&v21 toggleItalics:location[0]];
  char v19 = 0;
  objc_opt_class();
  id v8 = (id)[(UITextInputControllerAccessibility *)v23 safeValueForKey:@"typingAttributes"];
  id v18 = (id)__UIAccessibilityCastAsClass();

  id v17 = v18;
  objc_storeStrong(&v18, 0);
  id v20 = v17;
  id v16 = (id)[v17 objectForKey:*MEMORY[0x263F814F0]];
  if (!v16)
  {
    char v7 = (void *)MEMORY[0x263F81708];
    [MEMORY[0x263F81708] systemFontSize];
    id v16 = (id)objc_msgSend(v7, "systemFontOfSize:");
  }
  id v5 = (id)[v16 fontDescriptor];
  BOOL v6 = ([v5 symbolicTraits] & 1) != 0;

  BOOL v15 = v6;
  char v12 = 0;
  char v10 = 0;
  if (v6)
  {
    id v13 = accessibilityLocalizedString(@"toggle.on");
    char v12 = 1;
    id v3 = v13;
  }
  else
  {
    id v11 = accessibilityLocalizedString(@"toggle.off");
    char v10 = 1;
    id v3 = v11;
  }
  id v14 = v3;
  if (v10) {

  }
  if (v12) {
  id v4 = accessibilityLocalizedString((id)*MEMORY[0x263F21BA8]);
  }
  id argument = (id)__UIAXStringForVariables();

  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument);
  objc_storeStrong(&argument, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

@end