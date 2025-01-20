@interface LanguageAwareTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLanguage;
- (void)accessibilityLanguage;
@end

@implementation LanguageAwareTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SequoiaTranslator.LanguageAwareTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLanguage
{
  v3 = [(LanguageAwareTextViewAccessibility *)self safeSwiftValueForKey:@"locale"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 localeIdentifier];
  }
  else
  {
    v5 = AXLogAppAccessibility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      [(LanguageAwareTextViewAccessibility *)(uint64_t)v3 accessibilityLanguage];
    }

    v8.receiver = self;
    v8.super_class = (Class)LanguageAwareTextViewAccessibility;
    uint64_t v4 = [(LanguageAwareTextViewAccessibility *)&v8 accessibilityLanguage];
  }
  v6 = (void *)v4;

  return v6;
}

- (void)accessibilityLanguage
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_242680000, log, OS_LOG_TYPE_DEBUG, "Expected locale property to be of type NSLocale. was: %@. self=%@", (uint8_t *)&v3, 0x16u);
}

@end