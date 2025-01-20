@interface HFFakeMediaAccessoryItemProvider
- (HFFakeMediaAccessoryItemProvider)init;
- (NSMutableSet)mediaAccessoryItemTypes;
- (NSMutableSet)mediaAccessoryItems;
- (id)items;
- (id)reloadItems;
- (void)setMediaAccessoryItemTypes:(id)a3;
- (void)setMediaAccessoryItems:(id)a3;
@end

@implementation HFFakeMediaAccessoryItemProvider

- (HFFakeMediaAccessoryItemProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)HFFakeMediaAccessoryItemProvider;
  v2 = [(HFItemProvider *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF9C0] set];
    for (uint64_t i = 1; i != 9; ++i)
    {
      v5 = [NSNumber numberWithInteger:i];
      [v3 addObject:v5];
    }
    [(HFFakeMediaAccessoryItemProvider *)v2 setMediaAccessoryItemTypes:v3];
    v6 = [MEMORY[0x263EFF9C0] set];
    [(HFFakeMediaAccessoryItemProvider *)v2 setMediaAccessoryItems:v6];
  }
  return v2;
}

- (id)items
{
  v2 = [(HFFakeMediaAccessoryItemProvider *)self mediaAccessoryItems];
  v3 = (void *)[v2 copy];

  return v3;
}

- (id)reloadItems
{
  v3 = [(HFFakeMediaAccessoryItemProvider *)self mediaAccessoryItemTypes];
  v4 = [v3 allObjects];
  v5 = [(HFItemProvider *)self reloadItemsWithObjects:v4 keyAdaptor:&__block_literal_global_235 itemAdaptor:&__block_literal_global_4_17 filter:&__block_literal_global_7_14 itemMap:&__block_literal_global_10_14];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__HFFakeMediaAccessoryItemProvider_reloadItems__block_invoke_5;
  v8[3] = &unk_264090AC8;
  v8[4] = self;
  v6 = [v5 flatMap:v8];

  return v6;
}

id __47__HFFakeMediaAccessoryItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

uint64_t __47__HFFakeMediaAccessoryItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 mediaAccessoryItemType];
  return [v2 numberWithInteger:v3];
}

uint64_t __47__HFFakeMediaAccessoryItemProvider_reloadItems__block_invoke_3()
{
  return 1;
}

HFFakeMediaAccessoryItem *__47__HFFakeMediaAccessoryItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [HFFakeMediaAccessoryItem alloc];
  uint64_t v4 = [v2 unsignedIntegerValue];

  v5 = [(HFFakeMediaAccessoryItem *)v3 initWithMediaAccessoryItemType:v4];
  return v5;
}

id __47__HFFakeMediaAccessoryItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 mediaAccessoryItems];
  v6 = [v4 removedItems];
  [v5 minusSet:v6];

  v7 = [*(id *)(a1 + 32) mediaAccessoryItems];
  objc_super v8 = [v4 addedItems];
  [v7 unionSet:v8];

  v9 = [MEMORY[0x263F58190] futureWithResult:v4];

  return v9;
}

- (NSMutableSet)mediaAccessoryItems
{
  return self->_mediaAccessoryItems;
}

- (void)setMediaAccessoryItems:(id)a3
{
}

- (NSMutableSet)mediaAccessoryItemTypes
{
  return self->_mediaAccessoryItemTypes;
}

- (void)setMediaAccessoryItemTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaAccessoryItemTypes, 0);
  objc_storeStrong((id *)&self->_mediaAccessoryItems, 0);
}

@end