@interface UIPresentationControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityPresentationControllerModalizes;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityModalizePresentationView;
@end

@implementation UIPresentationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPresentationController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityPresentationControllerModalizes
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIPresentationControllerAccessibility;
  [(UIPresentationControllerAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
  [(UIPresentationControllerAccessibility *)v4 _accessibilityModalizePresentationView];
}

- (void)_accessibilityModalizePresentationView
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v20 = self;
  location[1] = (id)a2;
  if ([(UIPresentationControllerAccessibility *)self _accessibilityPresentationControllerModalizes])
  {
    id v17 = v20;
    id v8 = (id)[v17 containerView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      char v15 = 0;
      objc_opt_class();
      id v7 = (id)[v17 containerView];
      id v14 = (id)__UIAccessibilityCastAsSafeCategory();

      id v13 = v14;
      objc_storeStrong(&v14, 0);
      id v16 = v13;
      -[UITransitionViewAccessibility _axSetPresentationController:]((uint64_t)v13, v17);
      objc_storeStrong(&v16, 0);
    }
    else
    {
      id v12 = (id)AXLogValidations();
      char v11 = 16;
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
      {
        SEL v3 = v12;
        os_log_type_t v4 = v11;
        id v6 = (id)[v17 containerView];
        objc_super v2 = (objc_class *)objc_opt_class();
        v5 = NSStringFromClass(v2);
        v10 = v5;
        __os_log_helper_16_2_1_8_66((uint64_t)v21, (uint64_t)v10);
        _os_log_error_impl(&dword_2402B7000, v3, v4, "Unexpected class %{public}@ for presentation controller container view", v21, 0xCu);

        objc_storeStrong((id *)&v10, 0);
      }
      objc_storeStrong(&v12, 0);
    }
    objc_storeStrong(&v17, 0);
  }
  else
  {
    location[0] = (id)AXLogAppAccessibility();
    os_log_type_t v18 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v22, (uint64_t)v20);
      _os_log_impl(&dword_2402B7000, (os_log_t)location[0], v18, "Presentation controller doesn't modalize: %@", v22, 0xCu);
    }
    objc_storeStrong(location, 0);
  }
}

@end