@interface CCUIToggleViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityControlCenterButtonIsToggle;
- (BOOL)_accessibilityControlCenterShouldExpandContentModule;
- (id)_accessibilityControlCenterButtonHint;
- (id)_accessibilityControlCenterButtonIdentifier;
- (id)_accessibilityControlCenterButtonLabel;
@end

@implementation CCUIToggleViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIToggleViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIToggleViewController", @"module", "@", 0);
  [v3 validateClass:@"CCUIToggleViewController" isKindOfClass:@"CCUIButtonModuleViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIButtonModuleViewControllerAccessibility", @"_accessibilityControlCenterButtonLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIButtonModuleViewControllerAccessibility", @"_accessibilityControlCenterButtonIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIButtonModuleViewControllerAccessibility", @"_accessibilityControlCenterButtonHint", "@", 0);
}

- (id)_accessibilityControlCenterButtonLabel
{
  id v3 = [(CCUIToggleViewControllerAccessibility *)self safeValueForKey:@"module"];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 _accessibilityControlCenterButtonLabel];
LABEL_7:
    v5 = (void *)v4;
    goto LABEL_8;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__CCUIToggleViewControllerAccessibility__accessibilityControlCenterButtonLabel__block_invoke;
  block[3] = &unk_265119720;
  block[4] = self;
  if (_accessibilityControlCenterButtonLabel_onceToken != -1) {
    dispatch_once(&_accessibilityControlCenterButtonLabel_onceToken, block);
  }
  if (_accessibilityControlCenterButtonLabel_superclassMethodAvailable)
  {
    v7.receiver = self;
    v7.super_class = (Class)CCUIToggleViewControllerAccessibility;
    uint64_t v4 = [(CCUIToggleViewControllerAccessibility *)&v7 _accessibilityControlCenterButtonLabel];
    goto LABEL_7;
  }
  v5 = 0;
LABEL_8:

  return v5;
}

Method __79__CCUIToggleViewControllerAccessibility__accessibilityControlCenterButtonLabel__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  Superclass = class_getSuperclass(v0);
  Method result = class_getInstanceMethod(Superclass, sel__accessibilityControlCenterButtonLabel);
  _accessibilityControlCenterButtonLabel_superclassMethodAvailable = result != 0;
  if (!result)
  {
    return (Method)MEMORY[0x270F0A3E8]();
  }
  return result;
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  id v3 = [(CCUIToggleViewControllerAccessibility *)self safeValueForKey:@"module"];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 _accessibilityControlCenterButtonIdentifier];
LABEL_7:
    v5 = (void *)v4;
    goto LABEL_8;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__CCUIToggleViewControllerAccessibility__accessibilityControlCenterButtonIdentifier__block_invoke;
  block[3] = &unk_265119720;
  block[4] = self;
  if (_accessibilityControlCenterButtonIdentifier_onceToken != -1) {
    dispatch_once(&_accessibilityControlCenterButtonIdentifier_onceToken, block);
  }
  if (_accessibilityControlCenterButtonIdentifier_superclassMethodAvailable)
  {
    v7.receiver = self;
    v7.super_class = (Class)CCUIToggleViewControllerAccessibility;
    uint64_t v4 = [(CCUIToggleViewControllerAccessibility *)&v7 _accessibilityControlCenterButtonIdentifier];
    goto LABEL_7;
  }
  v5 = 0;
LABEL_8:

  return v5;
}

Method __84__CCUIToggleViewControllerAccessibility__accessibilityControlCenterButtonIdentifier__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  Superclass = class_getSuperclass(v0);
  Method result = class_getInstanceMethod(Superclass, sel__accessibilityControlCenterButtonIdentifier);
  _accessibilityControlCenterButtonIdentifier_superclassMethodAvailable = result != 0;
  if (!result)
  {
    return (Method)MEMORY[0x270F0A3E8]();
  }
  return result;
}

- (id)_accessibilityControlCenterButtonHint
{
  id v3 = [(CCUIToggleViewControllerAccessibility *)self safeValueForKey:@"module"];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 _accessibilityControlCenterButtonHint];
LABEL_7:
    v5 = (void *)v4;
    goto LABEL_8;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__CCUIToggleViewControllerAccessibility__accessibilityControlCenterButtonHint__block_invoke;
  block[3] = &unk_265119720;
  block[4] = self;
  if (_accessibilityControlCenterButtonHint_onceToken != -1) {
    dispatch_once(&_accessibilityControlCenterButtonHint_onceToken, block);
  }
  if (_accessibilityControlCenterButtonHint_superclassMethodAvailable)
  {
    v7.receiver = self;
    v7.super_class = (Class)CCUIToggleViewControllerAccessibility;
    uint64_t v4 = [(CCUIToggleViewControllerAccessibility *)&v7 _accessibilityControlCenterButtonHint];
    goto LABEL_7;
  }
  v5 = 0;
LABEL_8:

  return v5;
}

Method __78__CCUIToggleViewControllerAccessibility__accessibilityControlCenterButtonHint__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  Superclass = class_getSuperclass(v0);
  Method result = class_getInstanceMethod(Superclass, sel__accessibilityControlCenterButtonHint);
  _accessibilityControlCenterButtonHint_superclassMethodAvailable = result != 0;
  if (!result)
  {
    return (Method)MEMORY[0x270F0A3E8]();
  }
  return result;
}

- (BOOL)_accessibilityControlCenterButtonIsToggle
{
  v2 = [(CCUIToggleViewControllerAccessibility *)self safeValueForKey:@"module"];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 _accessibilityControlCenterButtonIsToggle];
  }
  else {
    char v3 = 1;
  }

  return v3;
}

- (BOOL)_accessibilityControlCenterShouldExpandContentModule
{
  return 0;
}

@end