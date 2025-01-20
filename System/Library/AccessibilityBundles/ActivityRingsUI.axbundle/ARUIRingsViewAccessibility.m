@interface ARUIRingsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation ARUIRingsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ARUIRingsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ARUIRingsView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"canBecomeFocused", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(ARUIRingsViewAccessibility *)self isAccessibilityUserDefinedElement];

  if (!v3) {
    return 1;
  }
  v4 = [(ARUIRingsViewAccessibility *)self isAccessibilityUserDefinedElement];
  unsigned __int8 v5 = [v4 BOOLValue];

  return v5;
}

- (id)accessibilityLabel
{
  v2 = +[NSMutableArray array];
  char v33 = 0;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = v3;
  unsigned __int8 v5 = [v3 ringGroupControllers];
  id v6 = [v5 count];

  if (v6)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v7 = [v4 ringGroupControllers];
    v8 = (char *)[v7 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v8)
    {
      v9 = v8;
      uint64_t v10 = *(void *)v30;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v7);
          }
          char v33 = 0;
          objc_opt_class();
          v12 = __UIAccessibilityCastAsSafeCategory();
          if (v33) {
            abort();
          }
          v13 = v12;
          v14 = [v12 _accessibilityLocalizedRingDescriptions];
          [v2 axSafelyAddObjectsFromArray:v14];
        }
        v9 = (char *)[v7 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v9);
    }
  }
  v15 = [v4 ringGroups];
  id v16 = [v15 count];

  if (v16)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v17 = objc_msgSend(v4, "ringGroups", 0);
    id v18 = [v17 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)j) accessibilityLabel];
          [v2 axSafelyAddObject:v22];
        }
        id v19 = [v17 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v19);
    }
  }
  v23 = [v2 componentsJoinedByString:@", "];

  return v23;
}

- (BOOL)canBecomeFocused
{
  if ([(ARUIRingsViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])return 1; {
  v4.receiver = self;
  }
  v4.super_class = (Class)ARUIRingsViewAccessibility;
  return [(ARUIRingsViewAccessibility *)&v4 canBecomeFocused];
}

@end