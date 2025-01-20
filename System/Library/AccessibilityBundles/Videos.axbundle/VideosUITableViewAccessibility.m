@interface VideosUITableViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilitySupplementaryHeaderViews;
@end

@implementation VideosUITableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITableView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VideosDetailViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosDetailViewController", @"headerContainmentView", "@", 0);
}

- (id)_accessibilitySupplementaryHeaderViews
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = [(VideosUITableViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_0 startWithSelf:0];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 _accessibilityViewController];
    uint64_t v6 = [v5 safeValueForKey:@"headerContainmentView"];
    v7 = (void *)v6;
    if (v6)
    {
      v11[0] = v6;
      v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VideosUITableViewAccessibility;
    v8 = [(VideosUITableViewAccessibility *)&v10 _accessibilitySupplementaryHeaderViews];
  }

  return v8;
}

uint64_t __72__VideosUITableViewAccessibility__accessibilitySupplementaryHeaderViews__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  MEMORY[0x2456693D0](@"VideosDetailViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end