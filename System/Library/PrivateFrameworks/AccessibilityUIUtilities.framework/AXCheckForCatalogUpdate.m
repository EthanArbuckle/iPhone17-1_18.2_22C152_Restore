@interface AXCheckForCatalogUpdate
@end

@implementation AXCheckForCatalogUpdate

void ___AXCheckForCatalogUpdate_block_invoke()
{
  v0 = [MEMORY[0x1E4FAF278] sharedInstance];
  [v0 updateCatalogIfNeeded];

  _checkedForCatalogUpdate = 1;
}

@end