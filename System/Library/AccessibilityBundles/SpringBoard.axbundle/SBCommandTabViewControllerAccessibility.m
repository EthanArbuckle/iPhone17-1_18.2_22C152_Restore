@interface SBCommandTabViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_moveSelectionSquareToIconAtIndex:(unint64_t)a3;
- (void)accessibilityAnnounceSelectedIcon;
- (void)viewDidLoad;
@end

@implementation SBCommandTabViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBCommandTabViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBCommandTabViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"SBCommandTabViewController" hasInstanceVariable:@"_iconViews" withType:"NSMutableArray"];
  [v3 validateClass:@"SBCommandTabViewController" hasInstanceVariable:@"_selectedIconView" withType:"SBIconView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBCommandTabViewController", @"_moveSelectionSquareToIconAtIndex:", "v", "Q", 0);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SBCommandTabViewControllerAccessibility;
  [(SBCommandTabViewControllerAccessibility *)&v3 viewDidLoad];
  [(SBCommandTabViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)SBCommandTabViewControllerAccessibility;
  [(SBCommandTabViewControllerAccessibility *)&v17 _accessibilityLoadAccessibilityInformation];
  char v16 = 0;
  objc_opt_class();
  objc_super v3 = [(SBCommandTabViewControllerAccessibility *)self safeValueForKey:@"_iconViews"];
  v4 = __UIAccessibilityCastAsClass();

  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v11 = objc_msgSend(NSNumber, "numberWithBool:", 1, (void)v12);
        [v10 _accessibilitySetValue:v11 forKey:@"AXIsInCmdTabSwitcher" storageMode:0];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)_moveSelectionSquareToIconAtIndex:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBCommandTabViewControllerAccessibility;
  [(SBCommandTabViewControllerAccessibility *)&v4 _moveSelectionSquareToIconAtIndex:a3];
  [(SBCommandTabViewControllerAccessibility *)self accessibilityAnnounceSelectedIcon];
}

- (void)accessibilityAnnounceSelectedIcon
{
  objc_super v3 = [MEMORY[0x263F22968] server];
  char v4 = [v3 isScreenLockedWithPasscode:0];

  if ((v4 & 1) == 0)
  {
    id v7 = [(SBCommandTabViewControllerAccessibility *)self safeValueForKey:@"_selectedIconView"];
    UIAccessibilityNotifications v5 = *MEMORY[0x263F1CDC8];
    uint64_t v6 = [v7 accessibilityLabel];
    UIAccessibilityPostNotification(v5, v6);
  }
}

@end