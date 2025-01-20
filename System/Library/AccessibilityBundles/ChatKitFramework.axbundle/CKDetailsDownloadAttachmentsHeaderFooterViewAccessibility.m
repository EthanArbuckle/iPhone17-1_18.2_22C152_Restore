@interface CKDetailsDownloadAttachmentsHeaderFooterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CKDetailsDownloadAttachmentsHeaderFooterViewAccessibility)initWithReuseIdentifier:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CKDetailsDownloadAttachmentsHeaderFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKDetailsDownloadAttachmentsHeaderFooterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKDetailsDownloadAttachmentsHeaderFooterView" hasInstanceVariable:@"_buttonTextView" withType:"UITextView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKDetailsDownloadAttachmentsHeaderFooterView", @"initWithReuseIdentifier:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKDetailsDownloadAttachmentsHeaderFooterView", @"handleUserTap:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)CKDetailsDownloadAttachmentsHeaderFooterViewAccessibility;
  [(CKDetailsDownloadAttachmentsHeaderFooterViewAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, self);
  id v3 = [(CKDetailsDownloadAttachmentsHeaderFooterViewAccessibility *)self safeUIViewForKey:@"_buttonTextView"];
  [v3 setIsAccessibilityElement:1];
  uint64_t v4 = [v3 accessibilityTraits];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEE8] | v4];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __103__CKDetailsDownloadAttachmentsHeaderFooterViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_265112E38;
  objc_copyWeak(&v6, &location);
  [v3 _setAccessibilityActivateBlock:v5];
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
}

uint64_t __103__CKDetailsDownloadAttachmentsHeaderFooterViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  objc_copyWeak(&v2, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v2);
  return 1;
}

void __103__CKDetailsDownloadAttachmentsHeaderFooterViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleUserTap:0];
}

- (CKDetailsDownloadAttachmentsHeaderFooterViewAccessibility)initWithReuseIdentifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKDetailsDownloadAttachmentsHeaderFooterViewAccessibility;
  id v3 = [(CKDetailsDownloadAttachmentsHeaderFooterViewAccessibility *)&v5 initWithReuseIdentifier:a3];
  [(CKDetailsDownloadAttachmentsHeaderFooterViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];
  return v3;
}

@end