@interface DialerControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHasDeletableText;
- (BOOL)_accessibilitySupportsHandwriting;
- (BOOL)_accessibilitySupportsTextInsertionAndDeletion;
- (unint64_t)_accessibilityHandwritingAttributeAllowedCharacterSets;
- (unint64_t)_accessibilityHandwritingAttributePreferredCharacterSet;
- (void)_accessibilityInsertText:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityReplaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4;
- (void)_voiceOverStatusChange:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)phonePad:(id)a3 appendString:(id)a4;
- (void)phonePad:(id)a3 replaceLastDigitWithString:(id)a4;
- (void)phonePadDeleteLastDigit:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation DialerControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DialerController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DialerController", @"dialerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAbstractDialerView", @"callButton", "@", 0);
}

- (void)phonePad:(id)a3 replaceLastDigitWithString:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)DialerControllerAccessibility;
  id v5 = a4;
  [(DialerControllerAccessibility *)&v6 phonePad:a3 replaceLastDigitWithString:v5];
  UIAccessibilityPostNotification(*MEMORY[0x263F81438], 0);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v5);
}

- (void)phonePadDeleteLastDigit:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)DialerControllerAccessibility;
  [(DialerControllerAccessibility *)&v3 phonePadDeleteLastDigit:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F81438], (id)*MEMORY[0x263F21C40]);
}

- (void)phonePad:(id)a3 appendString:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)DialerControllerAccessibility;
  [(DialerControllerAccessibility *)&v4 phonePad:a3 appendString:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F81438], (id)*MEMORY[0x263F21C70]);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)DialerControllerAccessibility;
  [(DialerControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(DialerControllerAccessibility *)self safeValueForKey:@"dialerView"];
  objc_super v4 = [v3 safeValueForKey:@"callButton"];
  id v5 = accessibilityLocalizedString(@"call.text");
  [v4 setAccessibilityLabel:v5];

  [(DialerControllerAccessibility *)self _voiceOverStatusChange:0];
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)DialerControllerAccessibility;
  [(DialerControllerAccessibility *)&v4 dealloc];
}

- (void)_voiceOverStatusChange:(id)a3
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_super v4 = [(DialerControllerAccessibility *)self safeValueForKey:@"_dialerView"];
    id v6 = [v4 safeValueForKey:@"lcdView"];

    if ([v6 _accessibilityViewIsVisible])
    {
      id v5 = [MEMORY[0x263F1C738] activeInstance];
      [v5 setDelegate:v6];
    }
  }
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)DialerControllerAccessibility;
  [(DialerControllerAccessibility *)&v4 loadView];
  [(DialerControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__voiceOverStatusChange_ name:*MEMORY[0x263F1CF90] object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DialerControllerAccessibility;
  [(DialerControllerAccessibility *)&v4 viewWillAppear:a3];
  [(DialerControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DialerControllerAccessibility;
  [(DialerControllerAccessibility *)&v4 viewWillDisappear:a3];
  objc_super v3 = [MEMORY[0x263F1C738] sharedInstance];
  [v3 setDelegate:0];
}

- (BOOL)_accessibilitySupportsHandwriting
{
  return 1;
}

- (unint64_t)_accessibilityHandwritingAttributePreferredCharacterSet
{
  return 4;
}

- (unint64_t)_accessibilityHandwritingAttributeAllowedCharacterSets
{
  return 4;
}

- (BOOL)_accessibilitySupportsTextInsertionAndDeletion
{
  return 1;
}

- (BOOL)_accessibilityHasDeletableText
{
  v2 = [(DialerControllerAccessibility *)self safeValueForKey:@"_dialerView"];
  objc_super v3 = [v2 safeValueForKey:@"lcdView"];
  objc_super v4 = [v3 safeValueForKey:@"text"];

  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id v7 = v4;
  AXPerformSafeBlock();
  uint64_t v5 = v9[3];

  _Block_object_dispose(&v8, 8);
  return v5 != 0;
}

uint64_t __63__DialerControllerAccessibility__accessibilityHasDeletableText__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) length];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_accessibilityInsertText:(id)a3
{
  id v3 = a3;
  objc_super v4 = v3;
  if (v3)
  {
    id v5 = v3;
    AXPerformSafeBlock();
  }
}

uint64_t __58__DialerControllerAccessibility__accessibilityInsertText___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) phonePad:0 appendString:*(void *)(a1 + 40)];
}

- (void)_accessibilityReplaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  AXPerformSafeBlock();
}

uint64_t __84__DialerControllerAccessibility__accessibilityReplaceCharactersAtCursor_withString___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(void *)(result + 48))
  {
    unint64_t v2 = 0;
    do
    {
      uint64_t result = [*(id *)(v1 + 32) phonePadDeleteLastDigit:0];
      ++v2;
    }
    while (v2 < *(void *)(v1 + 48));
  }
  if (*(void *)(v1 + 40))
  {
    id v3 = *(void **)(v1 + 32);
    return objc_msgSend(v3, "_accessibilityInsertText:");
  }
  return result;
}

@end