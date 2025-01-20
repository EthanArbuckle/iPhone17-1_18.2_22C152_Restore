@interface SBIconListModelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsVisibleByCompleteHitTest;
- (BOOL)_isSerializableAccessibilityElement;
- (id)automationElements;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
- (void)dealloc;
@end

@implementation SBIconListModelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBIconListModel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListModel", @"icons", "@", 0);
  [v3 validateClass:@"SBIconView" hasInstanceVariable:@"_iconLocation" withType:"NSString"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"_axIconView", "@", 0);
}

- (void)dealloc
{
  [(SBIconListModelAccessibility *)self _accessibilityUnregister];
  v3.receiver = self;
  v3.super_class = (Class)SBIconListModelAccessibility;
  [(SBIconListModelAccessibility *)&v3 dealloc];
}

- (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (unint64_t)_accessibilityAutomationType
{
  return 44;
}

- (id)automationElements
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  char v20 = 0;
  objc_opt_class();
  objc_super v3 = [(SBIconListModelAccessibility *)self safeValueForKey:@"icons"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "safeValueForKey:", @"_axIconView", (void)v16);
        v13 = [v12 safeStringForKey:@"_iconLocation"];
        if (SBAXIsIconViewIgnoreLocation(v13))
        {

          v12 = 0;
        }
        if (v12) {
          v14 = v12;
        }
        else {
          v14 = v11;
        }
        [v5 addObject:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_accessibilityIsVisibleByCompleteHitTest
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(SBIconListModelAccessibility *)self automationElements];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v7 = objc_msgSend(v6, "_accessibilityParentView", (void)v9);
          LOBYTE(v3) = [v7 _accessibilityIsVisibleByCompleteHitTest];

          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F813A0];
}

@end