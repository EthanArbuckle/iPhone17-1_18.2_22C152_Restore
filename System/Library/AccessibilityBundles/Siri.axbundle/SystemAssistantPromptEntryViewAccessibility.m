@interface SystemAssistantPromptEntryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setIsInTamale:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SystemAssistantPromptEntryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Siri.SystemAssistantPromptEntryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"Siri.SystemAssistantPromptEntryView" hasSwiftField:@"entryView" withSwiftType:"EditMenuAwarePromptEntryView"];
  [v3 validateClass:@"Siri.SystemAssistantPromptEntryView" hasSwiftField:@"closeButton" withSwiftType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Siri.SystemAssistantPromptEntryView", @"setIsInTamale:", "v", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v14.receiver = self;
  v14.super_class = (Class)SystemAssistantPromptEntryViewAccessibility;
  [(SystemAssistantPromptEntryViewAccessibility *)&v14 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SystemAssistantPromptEntryViewAccessibility *)self safeSwiftValueForKey:@"closeButton"];
  v4 = accessibilityLocalizedString(@"dismiss.text.field");
  [v3 setAccessibilityLabel:v4];

  v5 = [(SystemAssistantPromptEntryViewAccessibility *)self safeSwiftValueForKey:@"entryView"];
  LOBYTE(location) = 0;
  objc_opt_class();
  v6 = [v5 safeSwiftValueForKey:@"placeholderLabel"];
  v7 = __UIAccessibilityCastAsClass();

  [v7 setIsAccessibilityElement:0];
  v8 = [v5 safeSwiftValueForKey:@"textView"];
  objc_initWeak(&location, v8);
  objc_initWeak(&from, v7);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __89__SystemAssistantPromptEntryViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v9[3] = &unk_265151088;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  objc_copyWeak(&v11, &from);
  [v8 setAccessibilityLabelBlock:v9];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

id __89__SystemAssistantPromptEntryViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(id *a1)
{
  v2 = a1 + 5;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  if ([WeakRetained isFirstResponder])
  {
    id v4 = objc_loadWeakRetained(v2);
    v5 = [v4 text];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      v10.receiver = a1[4];
      v10.super_class = (Class)SystemAssistantPromptEntryViewAccessibility;
      v7 = objc_msgSendSuper2(&v10, sel_accessibilityLabel);
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v8 = objc_loadWeakRetained(a1 + 6);
  v7 = [v8 text];

LABEL_6:

  return v7;
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SystemAssistantPromptEntryViewAccessibility;
  [(SystemAssistantPromptEntryViewAccessibility *)&v7 viewDidAppear:a3];
  id v4 = [(SystemAssistantPromptEntryViewAccessibility *)self safeSwiftValueForKey:@"entryView"];
  uint64_t v6 = [v4 safeSwiftValueForKey:@"textView"];
  id v5 = v6;
  AXPerformBlockOnMainThreadAfterDelay();
}

void __61__SystemAssistantPromptEntryViewAccessibility_viewDidAppear___block_invoke(uint64_t a1)
{
}

- (void)setIsInTamale:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SystemAssistantPromptEntryViewAccessibility;
  [(SystemAssistantPromptEntryViewAccessibility *)&v3 setIsInTamale:a3];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __61__SystemAssistantPromptEntryViewAccessibility_setIsInTamale___block_invoke(uint64_t a1)
{
}

@end