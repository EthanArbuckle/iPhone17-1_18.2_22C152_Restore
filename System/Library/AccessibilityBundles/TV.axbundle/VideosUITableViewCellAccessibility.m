@interface VideosUITableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityScrollToVisible;
- (BOOL)_accessibilityShouldBypassScrollToVisibleWithChild;
@end

@implementation VideosUITableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityShouldBypassScrollToVisibleWithChild
{
  v2 = [(VideosUITableViewCellAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_1 startWithSelf:0];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __88__VideosUITableViewCellAccessibility__accessibilityShouldBypassScrollToVisibleWithChild__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  MEMORY[0x245666030](@"VideosDetailViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_accessibilityScrollToVisible
{
  if ([(VideosUITableViewCellAccessibility *)self _accessibilityShouldBypassScrollToVisibleWithChild])
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VideosUITableViewCellAccessibility;
  return [(VideosUITableViewCellAccessibility *)&v4 _accessibilityScrollToVisible];
}

@end