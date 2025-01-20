@interface UITraitCollection(Convenience)
- (BOOL)mf_usePrimarySidebarStyling;
- (BOOL)mf_useSplitViewStyling;
- (uint64_t)mf_hasCompactDimension;
- (uint64_t)mf_supportsPopoverPresentation;
@end

@implementation UITraitCollection(Convenience)

- (BOOL)mf_usePrimarySidebarStyling
{
  return (unint64_t)([a1 _splitViewControllerContext] - 1) < 2;
}

- (BOOL)mf_useSplitViewStyling
{
  return (unint64_t)([a1 _splitViewControllerContext] - 1) < 3;
}

- (uint64_t)mf_supportsPopoverPresentation
{
  uint64_t result = [a1 userInterfaceIdiom];
  if (result) {
    return [a1 horizontalSizeClass] == 2;
  }
  return result;
}

- (uint64_t)mf_hasCompactDimension
{
  uint64_t result = [a1 horizontalSizeClass];
  if (result != 1) {
    return [a1 verticalSizeClass] == 1;
  }
  return result;
}

@end