@interface CSMagSafeAccessoryViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CSMagSafeAccessoryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSMagSafeAccessoryViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CSMagSafeAccessoryViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"CSMagSafeAccessoryViewController" isKindOfClass:@"CSAccessoryViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSMagSafeAccessoryViewController", @"accessory", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSMagSafeAccessory", @"primaryColor", "@", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)CSMagSafeAccessoryViewControllerAccessibility;
  [(CSMagSafeAccessoryViewControllerAccessibility *)&v14 viewDidAppear:a3];
  v4 = [(CSMagSafeAccessoryViewControllerAccessibility *)self safeValueForKey:@"accessory"];
  buf[0] = 0;
  objc_opt_class();
  v5 = [v4 safeValueForKey:@"primaryColor"];
  v6 = __UIAccessibilityCastAsClass();

  if (buf[0]) {
    abort();
  }
  v7 = AXLogAppAccessibility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v4;
    __int16 v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_2420BD000, v7, OS_LOG_TYPE_DEFAULT, "MagSafe accessory: %@ %@", buf, 0x16u);
  }

  uint64_t v8 = [v4 safeIntegerForKey:@"type"];
  v9 = [v6 accessibilityName];
  switch(v8)
  {
    case 2:
      v10 = accessibilitySBLocalizedString(@"mag.safe.detected.clear.case");
      if (v10) {
        goto LABEL_12;
      }
      break;
    case 3:
      v11 = NSString;
      v12 = @"mag.safe.detected.leather";
      goto LABEL_11;
    case 5:
      v11 = NSString;
      v12 = @"mag.safe.detected.silicone";
      goto LABEL_11;
    case 6:
      v11 = NSString;
      v12 = @"mag.safe.detected.sleeve";
      goto LABEL_11;
    case 8:
      v11 = NSString;
      v12 = @"mag.safe.detected.wallet";
LABEL_11:
      v13 = accessibilitySBLocalizedString(v12);
      v10 = objc_msgSend(v11, "stringWithFormat:", v13, v9);

      if (v10)
      {
LABEL_12:
        UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v10);
      }
      break;
    default:
      break;
  }
}

@end