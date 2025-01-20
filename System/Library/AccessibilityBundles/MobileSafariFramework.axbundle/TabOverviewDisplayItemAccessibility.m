@interface TabOverviewDisplayItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TabOverviewDisplayItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFTabOverviewDisplayItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SFTabOverviewDisplayItem" hasSwiftField:@"barManager" withSwiftType:"BarManager"];
  [v3 validateClass:@"SFTabOverviewDisplayItemBarManager" hasSwiftField:@"registrations" withSwiftType:"Array<TabOverviewDisplayItemBarRegistration>"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)TabOverviewDisplayItemAccessibility;
  [(TabOverviewDisplayItemAccessibility *)&v14 _accessibilityLoadAccessibilityInformation];
  id v3 = [(TabOverviewDisplayItemAccessibility *)self safeSwiftValueForKey:@"$__lazy_storage_$_barManager"];
  v4 = [v3 safeSwiftArrayForKey:@"registrations"];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) safeSwiftDictionaryForKey:@"barButtonItems"];
        [v9 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_2];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
}

void __81__TabOverviewDisplayItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  v4 = [a2 safeSwiftEnumCase];
  if ([v4 isEqualToString:@"add"])
  {
    uint64_t v5 = @"new.tab.button";
  }
  else if ([v4 isEqualToString:@"tabGroups"])
  {
    uint64_t v5 = @"tab.groups.button";
  }
  else
  {
    if (![v4 isEqualToString:@"sidebar"]) {
      goto LABEL_8;
    }
    uint64_t v5 = @"show.sidebar.button";
  }
  uint64_t v6 = accessibilityMobileSafariLocalizedString(v5);
  [v7 setAccessibilityLabel:v6];

LABEL_8:
}

@end