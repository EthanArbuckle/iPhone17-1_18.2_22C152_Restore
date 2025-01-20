@interface ACSportsAthleteStandingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation ACSportsAthleteStandingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ACSportsAthleteStandingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ACSportsAthleteStandingView" isKindOfClass:@"ACSportsEntityView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ACSportsEntityView", @"entity", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SASportsEntity", @"name", "@", 0);
  [v3 validateClass:@"ACSportsStandingColumnView" hasInstanceVariable:@"_snippetColumnHeaders" withType:"NSArray"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(ACSportsAthleteStandingViewAccessibility *)self safeValueForKey:@"entity"];
  v4 = [v3 safeValueForKey:@"name"];

  v5 = [(ACSportsAthleteStandingViewAccessibility *)self safeValueForKey:@"_snippetColumnHeaders"];
  v6 = [(ACSportsAthleteStandingViewAccessibility *)self _accessibilityValueForKey:@"AXStandingsColumns"];
  uint64_t v7 = [v6 count];
  if (v7 == [v5 count])
  {
    v8 = [MEMORY[0x263EFF980] array];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __62__ACSportsAthleteStandingViewAccessibility_accessibilityLabel__block_invoke;
    v13[3] = &unk_265152B90;
    id v14 = v8;
    id v15 = v5;
    id v9 = v8;
    [v6 enumerateObjectsUsingBlock:v13];
    v12 = [v9 componentsJoinedByString:@", "];
    uint64_t v10 = __UIAXStringForVariables();

    v4 = (void *)v10;
  }

  return v4;
}

void __62__ACSportsAthleteStandingViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v8 = [v5 objectAtIndex:a3];
  uint64_t v7 = __UIAXStringForVariables();

  objc_msgSend(v4, "ax_enqueueObject:", v7, v8, @"__AXStringForVariablesSentinel");
}

@end