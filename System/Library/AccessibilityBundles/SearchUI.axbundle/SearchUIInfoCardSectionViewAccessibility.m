@interface SearchUIInfoCardSectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SearchUIInfoCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUIInfoCardSectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SearchUIInfoCardSectionView" hasProperty:@"contentView" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NUIContainerGridView", @"arrangedSubviewRows", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)SearchUIInfoCardSectionViewAccessibility;
  [(SearchUIInfoCardSectionViewAccessibility *)&v18 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SearchUIInfoCardSectionViewAccessibility *)self safeValueForKey:@"contentView"];
  v4 = [v3 safeValueForKey:@"arrangedSubviewRows"];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    uint64_t v9 = *MEMORY[0x263F1CEF8];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
        Class v12 = NSClassFromString(&cfstr_Searchuilabel.isa);
        v13 = objc_msgSend(v11, "_accessibilityDescendantOfType:", v12, (void)v14);
        [v13 setAccessibilityTraits:v9];

        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end