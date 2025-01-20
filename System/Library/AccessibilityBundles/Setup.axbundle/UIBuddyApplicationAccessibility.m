@interface UIBuddyApplicationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityCanRequestSetupControllerSafely;
- (BOOL)_accessibilityFinishSetupIfAppropriate;
- (BOOL)_iosAccessibilityPerformAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation UIBuddyApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIApplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SetupController", @"navigationFlowController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyNavigationFlowController", @"buddyControllers", "@", 0);
  [v3 validateClass:@"BuddyFinishedController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyFinishedController", @"delegate", "@", 0);
  [v3 validateProtocol:@"BFFFlowItemDelegate" hasMethod:@"flowItemDone:" isInstanceMethod:1 isRequired:1];
  [v3 validateClass:@"BuddyApplicationAndSceneSharedStorage"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"BuddyApplicationAndSceneSharedStorage", @"setupController", "@", 0);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"app.name");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)UIBuddyApplicationAccessibility;
  [(UIBuddyApplicationAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  if ([(UIBuddyApplicationAccessibility *)self _accessibilityCanRequestSetupControllerSafely])
  {
    objc_opt_class();
    id v3 = [NSClassFromString(&cfstr_Buddyapplicati.isa) safeValueForKey:@"setupController"];
    v4 = __UIAccessibilityCastAsClass();

    [v4 _accessibilityLoadAccessibilityInformation];
  }
}

- (BOOL)_accessibilityFinishSetupIfAppropriate
{
  if (![(UIBuddyApplicationAccessibility *)self _accessibilityCanRequestSetupControllerSafely])return 0; {
  LOBYTE(v10) = 0;
  }
  v2 = [NSClassFromString(&cfstr_Buddyapplicati.isa) safeValueForKey:@"setupController"];
  id v3 = __UIAccessibilitySafeClass();

  v4 = [v3 safeValueForKey:@"navigationFlowController"];
  objc_super v5 = [v4 safeArrayForKey:@"buddyControllers"];
  v6 = [v5 lastObject];

  NSClassFromString(&cfstr_Buddyfinishedc_0.isa);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    id v9 = v6;
    AXPerformSafeBlock();
    BOOL v7 = *((unsigned char *)v11 + 24) != 0;

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

void __73__UIBuddyApplicationAccessibility__accessibilityFinishSetupIfAppropriate__block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 view];
  [v3 setUserInteractionEnabled:0];

  v4 = [*(id *)(a1 + 32) safeValueForKey:@"delegate"];
  [v4 flowItemDone:*(void *)(a1 + 32)];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

- (BOOL)_accessibilityCanRequestSetupControllerSafely
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = objc_msgSend((id)*MEMORY[0x263F1D020], "connectedScenes", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        BOOL v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v8 = [v7 delegate];
          NSClassFromString(&cfstr_Buddyscenedele_0.isa);
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            BOOL v10 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_12:

  return v10;
}

- (BOOL)_iosAccessibilityPerformAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5
{
  if (a3 == 4019)
  {
    return [(UIBuddyApplicationAccessibility *)self _accessibilityFinishSetupIfAppropriate];
  }
  else
  {
    uint64_t v9 = v5;
    uint64_t v10 = v6;
    v8.receiver = self;
    v8.super_class = (Class)UIBuddyApplicationAccessibility;
    return [(UIBuddyApplicationAccessibility *)&v8 _iosAccessibilityPerformAction:*(void *)&a3 withValue:a4 fencePort:*(void *)&a5];
  }
}

@end