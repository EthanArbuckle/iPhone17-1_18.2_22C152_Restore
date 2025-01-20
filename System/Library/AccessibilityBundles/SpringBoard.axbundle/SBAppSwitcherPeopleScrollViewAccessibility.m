@interface SBAppSwitcherPeopleScrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsFirstElementForFocus;
- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView;
- (BOOL)isAccessibilityOpaqueElementProvider;
- (BOOL)shouldGroupAccessibilityChildren;
- (id)_accessibilitySortedElementsWithin;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
- (int64_t)accessibilityNavigationStyle;
@end

@implementation SBAppSwitcherPeopleScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBAppSwitcherPeopleScrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppSwitcherPeopleScrollView", @"expandedItemWrapper", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppSwitcherPeopleContactContainer", @"contactView", "@", 0);
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (BOOL)_accessibilityIsFirstElementForFocus
{
  return 0;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"people.scroll.view.container");
}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  return 1;
}

- (BOOL)isAccessibilityOpaqueElementProvider
{
  return 1;
}

- (int64_t)accessibilityNavigationStyle
{
  return 2;
}

- (id)_accessibilitySortedElementsWithin
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v31.receiver = self;
  v31.super_class = (Class)SBAppSwitcherPeopleScrollViewAccessibility;
  id v3 = [(SBAppSwitcherPeopleScrollViewAccessibility *)&v31 _accessibilitySortedElementsWithin];
  v4 = [(SBAppSwitcherPeopleScrollViewAccessibility *)self safeValueForKey:@"_expandedItemWrapper"];

  if (v4)
  {
    v5 = [(SBAppSwitcherPeopleScrollViewAccessibility *)self subviews];
    v25 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count") + objc_msgSend(v5, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      v9 = @"_contactView";
      uint64_t v10 = *(void *)v28;
      v11 = @"SBAppSwitcherPeopleContactContainer";
      uint64_t v26 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v6);
          }
          v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "safeValueForKey:", v9, v25);
          NSClassFromString(&v11->isa);
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 indexOfObject:v14] == 0x7FFFFFFFFFFFFFFFLL)
          {
            v15 = [v13 subviews];
            if ([v15 count] == 1)
            {
              [v15 firstObject];
              v16 = v11;
              v17 = v9;
              id v18 = v6;
              v20 = v19 = v3;
              NSClassFromString(&cfstr_Sbappswitcherp_3.isa);
              char isKindOfClass = objc_opt_isKindOfClass();

              id v3 = v19;
              id v6 = v18;
              v9 = v17;
              v11 = v16;
              uint64_t v10 = v26;
              if (isKindOfClass)
              {
                v22 = [v15 firstObject];
                [v25 addObject:v22];
              }
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v8);
    }

    [v25 addObjectsFromArray:v3];
    id v23 = [v25 sortedArrayUsingSelector:sel_accessibilityCompareGeometry_];
  }
  else
  {
    id v23 = v3;
  }

  return v23;
}

@end