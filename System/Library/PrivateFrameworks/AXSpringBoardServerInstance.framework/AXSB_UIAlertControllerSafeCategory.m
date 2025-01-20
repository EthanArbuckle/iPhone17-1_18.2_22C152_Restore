@interface AXSB_UIAlertControllerSafeCategory
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_canDismissWithGestureRecognizer;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_applyAccessibilityLoadAccessibilityInformation;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation AXSB_UIAlertControllerSafeCategory

+ (id)safeCategoryTargetClassName
{
  return @"UIAlertController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIAlertController", @"_canDismissWithGestureRecognizer", "B", 0);
  [v3 validateClass:@"UIAlertController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIAlertController", @"viewDidAppear:", "v", "B", 0);
  [v3 validateClass:@"_UIAlertControllerPhoneTVMacView" hasInstanceVariable:@"_mainInterfaceActionsGroupView" withType:"_UIAlertControllerInterfaceActionGroupView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIInterfaceActionGroupView", @"actionSequenceView", "@", 0);
  [v3 validateClass:@"_UIAlertControllerInterfaceActionGroupView" isKindOfClass:@"UIInterfaceActionGroupView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIInterfaceActionRepresentationsSequenceView", @"arrangedActionRepresentationViews", "@", 0);
  [v3 validateClass:@"_UIInterfaceActionCustomViewRepresentationView" hasInstanceVariable:@"_actionContentView" withType:"UIView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)AXSB_UIAlertControllerSafeCategory;
  [(AXSB_UIAlertControllerSafeCategory *)&v3 _accessibilityLoadAccessibilityInformation];
  [(AXSB_UIAlertControllerSafeCategory *)self _applyAccessibilityLoadAccessibilityInformation];
}

- (void)_applyAccessibilityLoadAccessibilityInformation
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ([(AXSB_UIAlertControllerSafeCategory *)self _accessibilityBoolValueForKey:@"IsTripleClick"])
  {
    LOBYTE(location) = 0;
    objc_opt_class();
    v2 = __UIAccessibilityCastAsClass();
    objc_super v3 = [v2 view];
    v12 = [v3 safeValueForKey:@"_mainInterfaceActionsGroupView"];

    v14 = [v12 safeValueForKey:@"actionSequenceView"];
    v4 = [v14 safeArrayForKey:@"arrangedActionRepresentationViews"];
    v5 = objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "safeValueForKey:", @"_actionContentView", v12);
          [v5 axSafelyAddObject:v10];
          if (objc_opt_respondsToSelector()) {
            [v10 _accessibilitySetViewIsVisible:1];
          }
          objc_initWeak(&location, v9);
          if (objc_opt_respondsToSelector())
          {
            v16[0] = MEMORY[0x263EF8330];
            v16[1] = 3221225472;
            v16[2] = __85__AXSB_UIAlertControllerSafeCategory__applyAccessibilityLoadAccessibilityInformation__block_invoke;
            v16[3] = &unk_2647F0788;
            objc_copyWeak(&v17, &location);
            [v10 _setAccessibilityFrameBlock:v16];
            objc_destroyWeak(&v17);
          }
          objc_destroyWeak(&location);
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v6);
    }

    if ([v5 count]) {
      v11 = v5;
    }
    else {
      v11 = 0;
    }
    objc_msgSend(v14, "setAccessibilityElements:", v11, v12);
  }
}

- (BOOL)_canDismissWithGestureRecognizer
{
  if ([(AXSB_UIAlertControllerSafeCategory *)self _accessibilityBoolValueForKey:@"IsTripleClick"])return 0; {
  v4.receiver = self;
  }
  v4.super_class = (Class)AXSB_UIAlertControllerSafeCategory;
  return [(AXSB_UIAlertControllerSafeCategory *)&v4 _canDismissWithGestureRecognizer];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXSB_UIAlertControllerSafeCategory;
  [(AXSB_UIAlertControllerSafeCategory *)&v4 viewDidAppear:a3];
  [(AXSB_UIAlertControllerSafeCategory *)self _applyAccessibilityLoadAccessibilityInformation];
}

@end