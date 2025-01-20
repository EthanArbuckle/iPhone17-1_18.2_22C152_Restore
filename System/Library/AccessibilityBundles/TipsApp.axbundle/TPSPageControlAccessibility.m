@interface TPSPageControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityValue;
@end

@implementation TPSPageControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TPSPageControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityValue
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 numberOfPages];
    uint64_t v5 = [v3 currentPage] + 1;
    v6 = NSString;
    v7 = accessibilityLocalizedString(@"page.scrollStatus.label");
    v8 = objc_msgSend(v6, "stringWithFormat:", v7, v5, v4);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end