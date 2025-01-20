@interface FMCardContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsScrollAncestor;
- (BOOL)accessibilityScrollDownPage;
- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3;
@end

@implementation FMCardContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FindMy.FMCardContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"FindMy.FMScrollView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FindMy.FMCardContainerViewController", @"expandCard", "B", 0);
}

- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3
{
  id v4 = a3;
  v5 = [(FMCardContainerViewAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_1];
  v6 = v5;
  if (v5 && ([v5 isScrollEnabled] & 1) == 0)
  {
    [v4 accessibilityFrame];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    [v6 accessibilityFrame];
    CGFloat x = v24.origin.x;
    CGFloat y = v24.origin.y;
    CGFloat width = v24.size.width;
    CGFloat height = v24.size.height;
    v27.origin.CGFloat x = v10;
    v27.origin.CGFloat y = v12;
    v27.size.CGFloat width = v14;
    v27.size.CGFloat height = v16;
    BOOL v21 = CGRectContainsRect(v24, v27);
    v25.origin.CGFloat x = v10;
    v25.origin.CGFloat y = v12;
    v25.size.CGFloat width = v14;
    v25.size.CGFloat height = v16;
    double MaxY = CGRectGetMaxY(v25);
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    double v23 = CGRectGetMaxY(v26);
    BOOL v7 = 1;
    if (!v21 && MaxY > v23) {
      BOOL v7 = [(FMCardContainerViewAccessibility *)self accessibilityScrollDownPage];
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

uint64_t __74__FMCardContainerViewAccessibility_accessibilityScrollToVisibleWithChild___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    MEMORY[0x24564C960](@"FindMy.FMScrollView");
    uint64_t v3 = (v2 != 0) & objc_opt_isKindOfClass();
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)_accessibilityIsScrollAncestor
{
  return 1;
}

- (BOOL)accessibilityScrollDownPage
{
  objc_opt_class();
  id v2 = __UIAccessibilityCastAsClass();
  uint64_t v3 = [v2 superview];
  id v4 = [v3 _accessibilityViewController];
  char v5 = [v4 safeBoolForKey:@"expandCard"];

  return v5;
}

@end