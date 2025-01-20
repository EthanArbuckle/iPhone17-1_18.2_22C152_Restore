@interface HFMutableItemSection
- (void)setItems:(id)a3 filteringToDisplayedItems:(id)a4;
- (void)setItemsUsingDefaultSortComparator:(id)a3;
@end

@implementation HFMutableItemSection

- (void)setItems:(id)a3 filteringToDisplayedItems:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__HFMutableItemSection_setItems_filteringToDisplayedItems___block_invoke;
  v9[3] = &unk_26408EC60;
  id v10 = v6;
  id v7 = v6;
  v8 = objc_msgSend(a3, "na_filter:", v9);
  [(HFItemSection *)self setItems:v8];
}

uint64_t __59__HFMutableItemSection_setItems_filteringToDisplayedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (void)setItemsUsingDefaultSortComparator:(id)a3
{
  id v6 = [a3 allObjects];
  v4 = +[HFItemSection defaultItemComparator];
  v5 = [v6 sortedArrayUsingComparator:v4];
  [(HFItemSection *)self setItems:v5];
}

@end