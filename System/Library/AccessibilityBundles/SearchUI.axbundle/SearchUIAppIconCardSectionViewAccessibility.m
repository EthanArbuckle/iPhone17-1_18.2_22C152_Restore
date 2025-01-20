@interface SearchUIAppIconCardSectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation SearchUIAppIconCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUIAppIconCardSectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v3 = [(SearchUIAppIconCardSectionViewAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_1];
  if (v3)
  {
    v4 = [(SearchUIAppIconCardSectionViewAccessibility *)self safeValueForKey:@"folderLabelView"];
    if ([v4 _accessibilityViewIsVisible])
    {
      v5 = NSString;
      v6 = accessibilityLocalizedString(@"app.located.in");
      v7 = [v4 accessibilityLabel];
      v8 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v7);

      v9 = __UIAXStringForVariables();
    }
    else
    {
      v9 = [v3 accessibilityLabel];
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SearchUIAppIconCardSectionViewAccessibility;
    v9 = [(SearchUIAppIconCardSectionViewAccessibility *)&v11 accessibilityLabel];
  }

  return v9;
}

uint64_t __65__SearchUIAppIconCardSectionViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Sbiconview.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end