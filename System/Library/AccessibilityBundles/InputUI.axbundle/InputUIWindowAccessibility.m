@interface InputUIWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)makeKeyAndVisible;
- (void)setDocumentTraits:(id)a3;
@end

@implementation InputUIWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"InputUIWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IUIInputSourceViewController", @"textInputSource", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IUIRTIInputSource", @"sourceSession", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWindow", @"makeKeyAndVisible", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RTIInputSystemSession", @"setDocumentTraits:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v15[4] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)InputUIWindowAccessibility;
  [(InputUIWindowAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__InputUIWindowAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v10[3] = &unk_26512AB00;
  v10[4] = self;
  id v3 = (void *)MEMORY[0x245651900](v10);
  if (([(InputUIWindowAccessibility *)self _accessibilityBoolValueForKey:@"RegisteredKeyboardWindow"] & 1) == 0)
  {
    v4 = (void *)MEMORY[0x263F21678];
    v14[0] = @"ax-pidretrieval";
    v5 = (void *)MEMORY[0x245651900](v3);
    v15[0] = v5;
    v15[1] = &__block_literal_global_0;
    v14[1] = @"ax-contextretrieval";
    v14[2] = @"ax-uuid";
    uint64_t v6 = *MEMORY[0x263F22240];
    v14[3] = @"ax-register";
    v15[2] = v6;
    v15[3] = MEMORY[0x263EFFA88];
    v7 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
    [v4 registerRemoteElement:v7 remotePort:0];

    [(InputUIWindowAccessibility *)self _accessibilitySetBoolValue:1 forKey:@"RegisteredKeyboardWindow"];
  }
  v8 = AXLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[InputUIWindowAccessibility _accessibilityContextId](self, "_accessibilityContextId"));
    *(_DWORD *)buf = 138412290;
    v13 = v9;
    _os_log_impl(&dword_242200000, v8, OS_LOG_TYPE_INFO, "Register input window %@", buf, 0xCu);
  }
}

uint64_t __72__InputUIWindowAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  v0 = [(id)*MEMORY[0x263F1D020] _accessibilityAllWindowsOnlyVisibleWindows:1];
  v1 = objc_msgSend(v0, "ax_filteredArrayUsingBlock:", &__block_literal_global_304_0);
  v2 = [v1 firstObject];
  uint64_t v3 = [v2 _accessibilityContextId];

  return v3;
}

uint64_t __72__InputUIWindowAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __72__InputUIWindowAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  objc_opt_class();
  id v2 = [*(id *)(a1 + 32) rootViewController];
  uint64_t v3 = [v2 safeValueForKey:@"textInputSource"];
  v4 = [v3 safeValueForKey:@"sourceSession"];
  v5 = __UIAccessibilityCastAsClass();

  uint64_t v6 = [v5 documentTraits];
  uint64_t v7 = [v6 processId];

  return v7;
}

- (void)makeKeyAndVisible
{
  v3.receiver = self;
  v3.super_class = (Class)InputUIWindowAccessibility;
  [(InputUIWindowAccessibility *)&v3 makeKeyAndVisible];
  [(InputUIWindowAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)setDocumentTraits:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)InputUIWindowAccessibility;
  [(InputUIWindowAccessibility *)&v4 setDocumentTraits:a3];
  [(InputUIWindowAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end