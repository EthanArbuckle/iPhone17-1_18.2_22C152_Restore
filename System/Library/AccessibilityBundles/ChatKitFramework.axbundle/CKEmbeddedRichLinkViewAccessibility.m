@interface CKEmbeddedRichLinkViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
@end

@implementation CKEmbeddedRichLinkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ChatKit.CKEmbeddedRichLinkView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ChatKit.CKEmbeddedRichLinkView" hasSwiftField:@"pluginEntryViewController" withSwiftType:"Optional<CKDefaultPluginEntryViewController>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKDefaultPluginEntryViewController", @"balloonView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ChatKit.CKEmbeddedRichLinkView", @"didTapDiscardButton", "v", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(CKEmbeddedRichLinkViewAccessibility *)self safeSwiftValueForKey:@"pluginEntryViewController"];
  v4 = [v3 safeValueForKey:@"balloonView"];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 accessibilityLabel];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CKEmbeddedRichLinkViewAccessibility;
    uint64_t v6 = [(CKEmbeddedRichLinkViewAccessibility *)&v9 accessibilityLabel];
  }
  v7 = (void *)v6;

  return v7;
}

- (id)accessibilityCustomActions
{
  id v3 = [MEMORY[0x263EFF980] array];
  v15.receiver = self;
  v15.super_class = (Class)CKEmbeddedRichLinkViewAccessibility;
  v4 = [(CKEmbeddedRichLinkViewAccessibility *)&v15 accessibilityCustomActions];
  [v3 axSafelyAddObjectsFromArray:v4];

  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x263F1C390]);
  uint64_t v6 = accessibilityLocalizedString(@"delete.button.label");
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __65__CKEmbeddedRichLinkViewAccessibility_accessibilityCustomActions__block_invoke;
  v12 = &unk_265112F48;
  objc_copyWeak(&v13, &location);
  v7 = (void *)[v5 initWithName:v6 actionHandler:&v9];

  objc_msgSend(v3, "axSafelyAddObject:", v7, v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v3;
}

uint64_t __65__CKEmbeddedRichLinkViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  AXPerformSafeBlock();

  return 1;
}

uint64_t __65__CKEmbeddedRichLinkViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didTapDiscardButton];
}

@end