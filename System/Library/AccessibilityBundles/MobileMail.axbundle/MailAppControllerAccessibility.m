@interface MailAppControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityFirstElementForFocus;
- (id)_accessibilityFirstElementForReadFromTop;
- (id)_accessibilitySplitViewControllerScannerGroupElements;
- (id)_axAccessibilityGroupForKey:(id)a3 fromSplitController:(id)a4;
- (id)_axVisibleViewController;
@end

@implementation MailAppControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MailAppController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailAppController", @"masterNavigationController", "@", 0);
  [v3 validateClass:@"MailNavigationController" isKindOfClass:@"UINavigationController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UINavigationController", @"visibleViewController", "@", 0);
  [v3 validateClass:@"ConversationViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListViewController", @"conversationViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailAppController", @"mostRecentMainScene", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailMainScene", @"splitViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailSplitViewController", @"mailboxPickerNavController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailSplitViewController", @"messageListNavController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailSplitViewController", @"messageDetailNavController", "@", 0);
}

- (id)_accessibilitySplitViewControllerScannerGroupElements
{
  objc_opt_class();
  id v3 = [(MailAppControllerAccessibility *)self safeValueForKey:@"mostRecentMainScene"];
  v4 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v5 = [v4 safeValueForKey:@"splitViewController"];
  v6 = __UIAccessibilityCastAsClass();

  if (!AXDeviceIsPad()
    || [v6 displayMode] == 1
    || [v6 displayMode] == 3
    || ![v6 displayMode])
  {
    id v11 = 0;
  }
  else
  {
    v7 = objc_opt_new();
    if ([v6 displayMode] == 4
      || [v6 displayMode] == 5
      || [v6 displayMode] == 6)
    {
      v8 = [(MailAppControllerAccessibility *)self _axAccessibilityGroupForKey:@"mailboxPickerNavController" fromSplitController:v6];
      [v7 axSafelyAddObject:v8];
    }
    v9 = [(MailAppControllerAccessibility *)self _axAccessibilityGroupForKey:@"messageListNavController" fromSplitController:v6];
    [v7 axSafelyAddObject:v9];

    if ([v6 displayMode] == 4 || objc_msgSend(v6, "displayMode") == 2)
    {
      v10 = [(MailAppControllerAccessibility *)self _axAccessibilityGroupForKey:@"messageDetailNavController" fromSplitController:v6];
      [v7 axSafelyAddObject:v10];
    }
    if ([v7 count]) {
      id v11 = v7;
    }
    else {
      id v11 = 0;
    }
  }

  return v11;
}

- (id)_axAccessibilityGroupForKey:(id)a3 fromSplitController:(id)a4
{
  v14[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  v7 = [v6 safeValueForKey:v5];
  v8 = __UIAccessibilityCastAsClass();

  v9 = [v8 safeUIViewForKey:@"view"];
  v10 = objc_opt_new();
  [v9 _accessibilityProcessScannerGroupElementPieces:v10];
  if ([v10 count])
  {
    v13[0] = @"GroupElements";
    v13[1] = @"GroupTraits";
    v14[0] = v10;
    v14[1] = &unk_26F714C58;
    v13[2] = @"GroupScanBehaviorTraits";
    v13[3] = @"GroupIdentifier";
    v14[2] = &unk_26F714C70;
    v14[3] = v5;
    id v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_axVisibleViewController
{
  objc_opt_class();
  id v3 = [(MailAppControllerAccessibility *)self safeValueForKey:@"masterNavigationController"];
  v4 = __UIAccessibilityCastAsClass();

  if (AXDeviceIsPad()
    && ([v4 visibleViewController],
        id v5 = objc_claimAutoreleasedReturnValue(),
        NSClassFromString(&cfstr_Messagelistvie_0.isa),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    v7 = [v4 visibleViewController];
    uint64_t v8 = [v7 safeValueForKey:@"conversationViewController"];
  }
  else
  {
    v7 = [v4 navigationController];
    uint64_t v8 = [v7 visibleViewController];
  }
  v9 = (void *)v8;

  return v9;
}

- (id)_accessibilityFirstElementForReadFromTop
{
  id v3 = [MEMORY[0x263F81198] defaultVoiceOverOptions];
  v4 = [(MailAppControllerAccessibility *)self _accessibilityFirstElementForFocusWithOptions:v3];

  return v4;
}

- (id)_accessibilityFirstElementForFocus
{
  id v3 = [(MailAppControllerAccessibility *)self _axVisibleViewController];
  NSClassFromString(&cfstr_Conversationvi_0.isa);
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  char v11 = 0;
  objc_opt_class();
  v4 = __UIAccessibilityCastAsClass();
  id v5 = [v4 view];
  int v6 = [v5 _accessibilityViewIsVisibleIgnoringAXOverrides:0 stoppingBeforeContainer:0];

  if (v6)
  {
    uint64_t v7 = [v3 _accessibilityFirstElementForFocus];
  }
  else
  {
LABEL_4:
    v10.receiver = self;
    v10.super_class = (Class)MailAppControllerAccessibility;
    uint64_t v7 = [(MailAppControllerAccessibility *)&v10 _accessibilityFirstElementForFocus];
  }
  uint64_t v8 = (void *)v7;

  return v8;
}

@end