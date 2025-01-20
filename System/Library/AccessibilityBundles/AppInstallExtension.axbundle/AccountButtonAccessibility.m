@interface AccountButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation AccountButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppInstallExtension.AccountButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)AccountButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(AccountButtonAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  uint64_t v2 = [(AccountButtonAccessibility *)self safeStringForKey:@"accessibilityBadgeCount"];
  if (v2)
  {
    objc_super v3 = (void *)v2;
    v4 = NSString;
    v5 = accessibilityAppStoreLocalizedString(@"account.updates");
    v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, objc_msgSend(v3, "intValue"));

    v7 = accessibilityAppStoreLocalizedString(@"account.button");
    v8 = __UIAXStringForVariables();
  }
  else
  {
    v8 = accessibilityAppStoreLocalizedString(@"account.button");
  }

  return v8;
}

@end