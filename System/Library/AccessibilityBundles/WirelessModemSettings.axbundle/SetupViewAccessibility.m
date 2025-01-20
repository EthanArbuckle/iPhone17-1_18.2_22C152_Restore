@interface SetupViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation SetupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SetupView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SetupView" hasInstanceVariable:@"_title" withType:"UILabel"];
  [v3 validateClass:@"SetupView" hasInstanceVariable:@"_setupSteps" withType:"NSMutableArray"];
}

- (id)accessibilityElements
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(SetupViewAccessibility *)self safeValueForKey:@"_title"];
  [v3 axSafelyAddObject:v4];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(SetupViewAccessibility *)self safeValueForKey:@"_setupSteps"];
  uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = @"NSArray";
    uint64_t v8 = *(void *)v28;
    v9 = @"UILabel";
    uint64_t v24 = *(void *)v28;
    do
    {
      uint64_t v10 = 0;
      uint64_t v25 = v6;
      do
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(obj);
        }
        v11 = __UIAccessibilitySafeClass();
        v12 = [v11 firstObject];
        v13 = __UIAccessibilitySafeClass();

        v14 = [v11 lastObject];
        v15 = __UIAccessibilitySafeClass();

        if ([v13 isAccessibilityElement])
        {
          v16 = NSString;
          [v13 accessibilityLabel];
          v18 = v17 = v3;
          [v15 accessibilityLabel];
          v19 = v9;
          v21 = v20 = v7;
          v22 = [v16 stringWithFormat:@"%@, %@", v18, v21];
          [v15 setAccessibilityLabel:v22];

          v7 = v20;
          v9 = v19;

          id v3 = v17;
          uint64_t v8 = v24;
          uint64_t v6 = v25;
          [v13 setIsAccessibilityElement:0];
        }
        [v3 axSafelyAddObject:v15];

        ++v10;
      }
      while (v6 != v10);
      uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v6);
  }

  return v3;
}

@end