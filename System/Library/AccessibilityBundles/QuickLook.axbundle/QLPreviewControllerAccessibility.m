@interface QLPreviewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_listButton;
- (void)_accessibilityKeyboardDidAppear:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)updateOverlayAnimated:(BOOL)a3 animatedButtons:(BOOL)a4 forceRefresh:(BOOL)a5 withTraitCollection:(id)a6;
@end

@implementation QLPreviewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"QLPreviewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"QLPreviewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLPreviewController", @"internalNavigationController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLPreviewController", @"updateOverlayAnimated: animatedButtons: forceRefresh: withTraitCollection:", "v", "B", "B", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLPreviewController", @"_listButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLPreviewController", @"additionalRightBarButtonItems", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)QLPreviewControllerAccessibility;
  [(QLPreviewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__accessibilityKeyboardDidAppear_ name:*MEMORY[0x263F1D418] object:0];
}

- (void)_accessibilityKeyboardDidAppear:(id)a3
{
}

- (void)updateOverlayAnimated:(BOOL)a3 animatedButtons:(BOOL)a4 forceRefresh:(BOOL)a5 withTraitCollection:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  v18.receiver = self;
  v18.super_class = (Class)QLPreviewControllerAccessibility;
  [(QLPreviewControllerAccessibility *)&v18 updateOverlayAnimated:v8 animatedButtons:v7 forceRefresh:v6 withTraitCollection:v10];
  objc_opt_class();
  v11 = [(QLPreviewControllerAccessibility *)self safeValueForKey:@"internalNavigationController"];
  v12 = __UIAccessibilityCastAsClass();

  v13 = [v12 safeValueForKey:@"navigationItem"];
  v14 = [v13 safeValueForKey:@"leftBarButtonItem"];
  v15 = UIKitAccessibilityLocalizedString();
  [v14 setAccessibilityLabel:v15];

  v16 = [v12 safeValueForKey:@"navigationItem"];
  v17 = [v16 safeValueForKey:@"leftBarButtonItem"];
  [v17 setAccessibilityTraits:*MEMORY[0x263F81370] | *MEMORY[0x263F1CEE8]];
}

- (id)_listButton
{
  v5.receiver = self;
  v5.super_class = (Class)QLPreviewControllerAccessibility;
  v2 = [(QLPreviewControllerAccessibility *)&v5 _listButton];
  id v3 = accessibilityLocalizedString(@"list.button.label");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

@end