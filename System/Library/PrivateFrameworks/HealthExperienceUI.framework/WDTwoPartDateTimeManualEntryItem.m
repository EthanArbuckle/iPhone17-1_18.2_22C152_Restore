@interface WDTwoPartDateTimeManualEntryItem
@end

@implementation WDTwoPartDateTimeManualEntryItem

void __58___WDTwoPartDateTimeManualEntryItem__datePickerDidChange___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _saveDisambiguatedDate:v3];
}

void __58___WDTwoPartDateTimeManualEntryItem__timePickerDidChange___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _saveDisambiguatedDate:v3];
}

@end