@interface ACSportsTeamsListViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation ACSportsTeamsListViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ACSportsTeamsListView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  id v12 = [MEMORY[0x263EFF980] array];
  v3 = [(ACSportsTeamsListViewAccessibility *)self safeValueForKey:@"domainObjectViews"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __56__ACSportsTeamsListViewAccessibility_accessibilityLabel__block_invoke;
    v6[3] = &unk_265152C00;
    v6[4] = &v7;
    [v3 enumerateObjectsUsingBlock:v6];
  }
  v4 = [(id)v8[5] componentsJoinedByString:@", "];

  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __56__ACSportsTeamsListViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 accessibilityLabel];
  if (v3) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }

  return MEMORY[0x270F9A758]();
}

@end