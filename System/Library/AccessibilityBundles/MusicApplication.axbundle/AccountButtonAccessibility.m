@interface AccountButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation AccountButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.AccountButton";
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

- (id)accessibilityLabel
{
  return accessibilityMusicLocalizedString(@"account");
}

- (id)accessibilityIdentifier
{
  return @"Music.AccountButton";
}

- (unint64_t)accessibilityTraits
{
  objc_opt_class();
  v3 = [(AccountButtonAccessibility *)self safeSwiftValueForKey:@"accountButton"];
  v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = *MEMORY[0x263F1CEE8];
  if ([v4 isEnabled]) {
    unint64_t v6 = v5 & ~*MEMORY[0x263F1CF20];
  }
  else {
    unint64_t v6 = *MEMORY[0x263F1CF20] | v5;
  }

  return v6;
}

@end