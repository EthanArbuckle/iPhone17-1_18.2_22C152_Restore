@interface FEFocusItemContainerAddChildItemsInContextWithOptions
@end

@implementation FEFocusItemContainerAddChildItemsInContextWithOptions

_FEFocusRegionContainerProxy *___FEFocusItemContainerAddChildItemsInContextWithOptions_block_invoke(uint64_t a1)
{
  v1 = [[_FEFocusRegionContainerProxy alloc] initWithEnvironmentContainer:*(void *)(a1 + 32)];
  [(_FEFocusRegionContainerProxy *)v1 setShouldCreateRegionForOwningItem:0];
  [(_FEFocusRegionContainerProxy *)v1 setShouldCreateRegionForGuideBehavior:0];
  [(_FEFocusRegionContainerProxy *)v1 setAllowsLazyLoading:0];
  return v1;
}

@end