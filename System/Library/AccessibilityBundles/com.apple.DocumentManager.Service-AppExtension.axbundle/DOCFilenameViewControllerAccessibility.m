@interface DOCFilenameViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
@end

@implementation DOCFilenameViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"com_apple_DocumentManager_Service.DOCFilenameViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"com_apple_DocumentManager_Service.DOCFilenameViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"com_apple_DocumentManager_Service.DOCFilenameViewController", @"filenameView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"com_apple_DocumentManager_Service.DOCFilenameViewController", @"item", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"com_apple_DocumentManager_Service.DOCFilenameView", @"textField", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)DOCFilenameViewControllerAccessibility;
  [(DOCFilenameViewControllerAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, self);
  id v3 = [(DOCFilenameViewControllerAccessibility *)self safeValueForKey:@"filenameView"];
  v4 = [v3 safeValueForKey:@"textField"];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __84__DOCFilenameViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_26516A4A0;
  objc_copyWeak(&v6, &location);
  [v4 _setAccessibilityLabelBlock:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __84__DOCFilenameViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained safeValueForKey:@"item"];
  v4 = __UIAccessibilityCastAsClass();

  if ([v4 isFolder]) {
    v5 = @"folder.name";
  }
  else {
    v5 = @"file.name";
  }
  id v6 = accessibilityLocalizedString(v5);

  return v6;
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)DOCFilenameViewControllerAccessibility;
  [(DOCFilenameViewControllerAccessibility *)&v3 loadView];
  [(DOCFilenameViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end