@interface _TVInfoListViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation _TVInfoListViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVInfoListView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVInfoListView", @"groupedInfos", "@", 0);
  [v3 validateClass:@"_TVInfoListInfo"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVInfoListInfo", @"headerContentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVInfoListInfo", @"dataViews", "@", 0);
}

- (id)accessibilityElements
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = [(_TVInfoListViewAccessibility *)self safeArrayForKey:@"groupedInfos"];
  uint64_t v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(obj);
        }
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        objc_opt_class();
        v5 = __UIAccessibilityCastAsClass();
        uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v7; ++j)
            {
              if (*(void *)v18 != v8) {
                objc_enumerationMutation(v5);
              }
              v10 = *(void **)(*((void *)&v17 + 1) + 8 * j);
              v11 = [v10 safeValueForKey:@"headerContentView"];
              [v3 axSafelyAddObject:v11];

              v12 = [v10 safeArrayForKey:@"dataViews"];
              [v3 axSafelyAddObjectsFromArray:v12];
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v7);
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v16);
  }

  return v3;
}

@end