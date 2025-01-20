@interface SafariUIPageControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityAdjustInDirection:(BOOL)a3;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation SafariUIPageControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPageControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SafariUIPageControlAccessibility;
  return *MEMORY[0x263F1CED8] | [(SafariUIPageControlAccessibility *)&v3 accessibilityTraits];
}

- (BOOL)_accessibilityAdjustInDirection:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SafariUIPageControlAccessibility *)self safeValueForKey:@"currentPage"];
  uint64_t v6 = [v5 integerValue];

  v7 = [(SafariUIPageControlAccessibility *)self safeValueForKey:@"numberOfPages"];
  uint64_t v8 = [v7 integerValue];

  BOOL v9 = 0;
  uint64_t v10 = v6 - 1;
  if (v3) {
    uint64_t v10 = v6 + 1;
  }
  if ((v10 & 0x8000000000000000) == 0 && v10 < v8)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    AXPerformSafeBlock();
    LastIncrementTime = CFAbsoluteTimeGetCurrent();
    BOOL v9 = *((unsigned char *)v13 + 24) != 0;
    _Block_object_dispose(&v12, 8);
  }
  return v9;
}

void __68__SafariUIPageControlAccessibility__accessibilityAdjustInDirection___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Pagedtabexpose.isa)];
  id v4 = [v2 safeValueForKey:@"_scrollView"];

  if (v4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  MEMORY[0x2456563A0](*MEMORY[0x263F1CE68]);
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [v4 accessibilityScroll:v3];
}

- (id)accessibilityValue
{
  if (CFAbsoluteTimeGetCurrent() - *(double *)&LastIncrementTime >= 0.1)
  {
    v5.receiver = self;
    v5.super_class = (Class)SafariUIPageControlAccessibility;
    uint64_t v3 = [(SafariUIPageControlAccessibility *)&v5 accessibilityValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)accessibilityIncrement
{
  if (![(SafariUIPageControlAccessibility *)self _accessibilityAdjustInDirection:1])
  {
    v3.receiver = self;
    v3.super_class = (Class)SafariUIPageControlAccessibility;
    [(SafariUIPageControlAccessibility *)&v3 accessibilityIncrement];
  }
}

- (void)accessibilityDecrement
{
  if (![(SafariUIPageControlAccessibility *)self _accessibilityAdjustInDirection:0])
  {
    v3.receiver = self;
    v3.super_class = (Class)SafariUIPageControlAccessibility;
    [(SafariUIPageControlAccessibility *)&v3 accessibilityDecrement];
  }
}

@end