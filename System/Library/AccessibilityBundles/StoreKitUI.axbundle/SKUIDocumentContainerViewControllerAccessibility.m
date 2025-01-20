@interface SKUIDocumentContainerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_rightBarButtonIsEnabled;
- (id)_accessibilityRightBarButtonItem;
- (id)_rightBarButtonAccessibilityLabel;
- (void)documentDidUpdate:(id)a3;
@end

@implementation SKUIDocumentContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIDocumentContainerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"navigationController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UINavigationController", @"navigationBar", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UINavigationBar", @"currentRightView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"isEnabled", "B", 0);
}

- (id)_accessibilityRightBarButtonItem
{
  v2 = [(SKUIDocumentContainerViewControllerAccessibility *)self safeValueForKey:@"navigationController"];
  NSClassFromString(&cfstr_Musicaccountna.isa);
  id v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0 && v2)
  {
    v4 = [v2 safeValueForKey:@"navigationBar"];
    NSClassFromString(&cfstr_Skuiscrollingt_0.isa);
    id v3 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0 && v4)
    {
      id v3 = [v4 safeValueForKey:@"currentRightView"];
    }
  }

  return v3;
}

- (id)_rightBarButtonAccessibilityLabel
{
  v2 = [(SKUIDocumentContainerViewControllerAccessibility *)self _accessibilityRightBarButtonItem];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (BOOL)_rightBarButtonIsEnabled
{
  v2 = [(SKUIDocumentContainerViewControllerAccessibility *)self _accessibilityRightBarButtonItem];
  id v3 = [v2 safeValueForKey:@"isEnabled"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)documentDidUpdate:(id)a3
{
  id v4 = a3;
  v5 = [(SKUIDocumentContainerViewControllerAccessibility *)self _rightBarButtonAccessibilityLabel];
  int v6 = [(SKUIDocumentContainerViewControllerAccessibility *)self _rightBarButtonIsEnabled];
  v20.receiver = self;
  v20.super_class = (Class)SKUIDocumentContainerViewControllerAccessibility;
  [(SKUIDocumentContainerViewControllerAccessibility *)&v20 documentDidUpdate:v4];

  v7 = [(SKUIDocumentContainerViewControllerAccessibility *)self _rightBarButtonAccessibilityLabel];
  int v8 = [(SKUIDocumentContainerViewControllerAccessibility *)self _rightBarButtonIsEnabled];
  if ([v5 isEqualToString:v7] && v6 != v8)
  {
    v9 = (void *)MEMORY[0x263F21660];
    v10 = NSString;
    if (v8)
    {
      v11 = accessibilitySKUILocalizedString(@"button.enabled");
      v12 = objc_msgSend(v10, "stringWithFormat:", v11, v7);
      v13 = [v9 axAttributedStringWithString:v12];

      [v13 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21828]];
      v14 = v19;
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __70__SKUIDocumentContainerViewControllerAccessibility_documentDidUpdate___block_invoke;
      v19[3] = &unk_2650AB650;
      v19[4] = v13;
    }
    else
    {
      v15 = accessibilitySKUILocalizedString(@"button.disabled");
      v16 = objc_msgSend(v10, "stringWithFormat:", v15, v7);
      v13 = [v9 axAttributedStringWithString:v16];

      [v13 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21828]];
      v14 = v18;
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __70__SKUIDocumentContainerViewControllerAccessibility_documentDidUpdate___block_invoke_2;
      v18[3] = &unk_2650AB650;
      v18[4] = v13;
    }
    id v17 = v13;
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

void __70__SKUIDocumentContainerViewControllerAccessibility_documentDidUpdate___block_invoke(uint64_t a1)
{
}

void __70__SKUIDocumentContainerViewControllerAccessibility_documentDidUpdate___block_invoke_2(uint64_t a1)
{
}

@end