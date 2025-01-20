@interface PSListController(AXUISettingsAdditions)
- (uint64_t)ax_handlesOwnScrollingInSetup;
@end

@implementation PSListController(AXUISettingsAdditions)

- (uint64_t)ax_handlesOwnScrollingInSetup
{
  return 0;
}

@end