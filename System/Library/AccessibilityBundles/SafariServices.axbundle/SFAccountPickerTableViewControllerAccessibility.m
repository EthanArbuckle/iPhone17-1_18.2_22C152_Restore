@interface SFAccountPickerTableViewControllerAccessibility
@end

@implementation SFAccountPickerTableViewControllerAccessibility

uint64_t __84___SFAccountPickerTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _rowTypeForIndexPath:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

@end