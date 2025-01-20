@interface MTAWorldClockViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityElementShouldBeInvalid;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)_axDeleteClock;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityFuzzyHitTestElements;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MTAWorldClockViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTAWorldClockView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAWorldClockView", @"cityNameLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAWorldClockView", @"timeZoneOffsetLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAWorldClockView", @"sunriseLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAWorldClockView", @"sunsetLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAWorldClockCollectionCell", @"deleteTapped:", "v", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(MTAWorldClockViewAccessibility *)self safeValueForKey:@"cityNameLabel"];
  v4 = [v3 accessibilityLabel];

  v5 = [(MTAWorldClockViewAccessibility *)self safeValueForKey:@"analogClock"];
  v6 = [v5 accessibilityLabel];

  v7 = [(MTAWorldClockViewAccessibility *)self safeValueForKey:@"timeZoneOffsetLabel"];
  v8 = [v7 accessibilityLabel];

  v9 = [(MTAWorldClockViewAccessibility *)self safeValueForKey:@"sunriseLabel"];
  v10 = [v9 accessibilityLabel];

  v11 = [(MTAWorldClockViewAccessibility *)self safeValueForKey:@"sunsetLabel"];
  v12 = [v11 accessibilityLabel];

  v13 = __UIAXStringForVariables();

  return v13;
}

- (BOOL)isAccessibilityElement
{
  BOOL v3 = [(MTAWorldClockViewAccessibility *)self _accessibilityElementShouldBeInvalid];
  v4 = [(MTAWorldClockViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x245657200](@"FullScreenWorldClockCollectionCell")];

  return !v4 && !v3;
}

- (BOOL)_accessibilityElementShouldBeInvalid
{
  MEMORY[0x245657200](@"MTAWorldClockCollectionCell", a2);
  BOOL v3 = [(MTAWorldClockViewAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 safeValueForKey:@"alpha"];
    [v5 floatValue];
    if (v6 <= 0.0)
    {
      char v8 = 1;
    }
    else
    {
      v7 = [(MTAWorldClockViewAccessibility *)self safeValueForKey:@"isHidden"];
      char v8 = [v7 BOOLValue];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)_accessibilityFuzzyHitTestElements
{
  return (id)[(MTAWorldClockViewAccessibility *)self safeValueForKey:@"subviews"];
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F81380];
}

- (id)accessibilityCustomActions
{
  BOOL v3 = (void *)MEMORY[0x263EFF980];
  v10.receiver = self;
  v10.super_class = (Class)MTAWorldClockViewAccessibility;
  v4 = [(MTAWorldClockViewAccessibility *)&v10 accessibilityCustomActions];
  v5 = [v3 arrayWithArray:v4];

  id v6 = objc_alloc(MEMORY[0x263F1C390]);
  v7 = accessibilityLocalizedString(@"clock.delete");
  char v8 = (void *)[v6 initWithName:v7 target:self selector:sel__axDeleteClock];

  [v8 setSortPriority:*MEMORY[0x263F81158]];
  [v5 addObject:v8];

  return v5;
}

- (BOOL)_axDeleteClock
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v2 = [(MTAWorldClockViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x245657200](@"MTAWorldClockCollectionCell", a2)];
  BOOL v3 = v2;
  if (v2)
  {
    id v6 = v2;
    AXPerformSafeBlock();
  }
  char v4 = *((unsigned char *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __48__MTAWorldClockViewAccessibility__axDeleteClock__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) deleteTapped:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

@end