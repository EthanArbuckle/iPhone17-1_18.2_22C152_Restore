@interface CKDetailsControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (id)locationSendOrRequestCell;
- (id)locationStartShareCell;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
@end

@implementation CKDetailsControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKDetailsController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKDetailsController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"CKDetailsController" hasProperty:@"tableView" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKDetailsController", @"screenShareContextButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKDetailsController", @"groupPhotoHeaderViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNGroupIdentityHeaderViewController", @"actionButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKDetailsController", @"locationSendOrRequestCell", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKDetailsController", @"locationStartShareCell", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)CKDetailsControllerAccessibility;
  [(CKDetailsControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CKDetailsControllerAccessibility *)self safeValueForKey:@"tableView"];
  v4 = accessibilityLocalizedString(@"details.table.label");
  [v3 setAccessibilityLabel:v4];
}

- (BOOL)accessibilityPerformEscape
{
  id v3 = [(CKDetailsControllerAccessibility *)self safeValueForKey:@"navigationItem"];
  char v15 = 0;
  objc_opt_class();
  v4 = [v3 safeValueForKey:@"rightBarButtonItem"];
  objc_super v5 = __UIAccessibilityCastAsClass();

  if (v5)
  {
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    v11 = __62__CKDetailsControllerAccessibility_accessibilityPerformEscape__block_invoke;
    v12 = &unk_265112EA8;
    id v13 = v5;
    v14 = self;
    AXPerformSafeBlock();

    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKDetailsControllerAccessibility;
    BOOL v6 = [(CKDetailsControllerAccessibility *)&v8 accessibilityPerformEscape];
  }

  return v6;
}

void __62__CKDetailsControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) target];
  objc_msgSend(v2, "performSelectorOnMainThread:withObject:waitUntilDone:", objc_msgSend(*(id *)(a1 + 32), "action"), *(void *)(a1 + 40), 0);
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)CKDetailsControllerAccessibility;
  [(CKDetailsControllerAccessibility *)&v3 loadView];
  [(CKDetailsControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)locationSendOrRequestCell
{
  v4.receiver = self;
  v4.super_class = (Class)CKDetailsControllerAccessibility;
  id v2 = [(CKDetailsControllerAccessibility *)&v4 locationSendOrRequestCell];
  [v2 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];

  return v2;
}

- (id)locationStartShareCell
{
  v4.receiver = self;
  v4.super_class = (Class)CKDetailsControllerAccessibility;
  id v2 = [(CKDetailsControllerAccessibility *)&v4 locationStartShareCell];
  [v2 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];

  return v2;
}

@end