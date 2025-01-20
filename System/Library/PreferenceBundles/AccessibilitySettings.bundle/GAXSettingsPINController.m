@interface GAXSettingsPINController
- (id)stringsTable;
- (void)setPIN:(id)a3;
@end

@implementation GAXSettingsPINController

- (id)stringsTable
{
  return @"GuidedAccessSecuritySettings";
}

- (void)setPIN:(id)a3
{
  id v3 = a3;
  v6 = [(id)AXSafeClassFromString() safeValueForKey:@"sharedInstance"];
  v7 = v3;
  id v4 = v3;
  id v5 = v6;
  AXPerformSafeBlock();
}

id __35__GAXSettingsPINController_setPIN___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPasscode:*(void *)(a1 + 40)];
}

@end