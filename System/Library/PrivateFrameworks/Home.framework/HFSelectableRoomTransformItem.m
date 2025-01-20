@interface HFSelectableRoomTransformItem
- (HFSelectableRoomTransformItem)initWithRoomItem:(id)a3 accessoryVendor:(id)a4;
- (HFSelectableRoomTransformItem)initWithSourceItem:(id)a3 updateOptionsTransformBlock:(id)a4 resultsTransformBlock:(id)a5;
@end

@implementation HFSelectableRoomTransformItem

- (HFSelectableRoomTransformItem)initWithSourceItem:(id)a3 updateOptionsTransformBlock:(id)a4 resultsTransformBlock:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5);
  v8 = NSStringFromSelector(sel_initWithRoomItem_accessoryVendor_);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFSelectableRoomTransformItem.m", 25, @"%s is unavailable; use %@ instead",
    "-[HFSelectableRoomTransformItem initWithSourceItem:updateOptionsTransformBlock:resultsTransformBlock:]",
    v8);

  return 0;
}

- (HFSelectableRoomTransformItem)initWithRoomItem:(id)a3 accessoryVendor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66__HFSelectableRoomTransformItem_initWithRoomItem_accessoryVendor___block_invoke;
  v13[3] = &unk_264094780;
  id v14 = v7;
  id v15 = v6;
  v12.receiver = self;
  v12.super_class = (Class)HFSelectableRoomTransformItem;
  id v8 = v6;
  id v9 = v7;
  v10 = [(HFTransformItem *)&v12 initWithSourceItem:v8 updateOptionsTransformBlock:0 resultsTransformBlock:v13];

  return v10;
}

id __66__HFSelectableRoomTransformItem_initWithRoomItem_accessoryVendor___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)[a2 mutableCopy];
  v4 = [*(id *)(a1 + 32) accessories];
  v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_93);
  id v6 = [*(id *)(a1 + 40) room];
  id v7 = [v6 accessories];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __66__HFSelectableRoomTransformItem_initWithRoomItem_accessoryVendor___block_invoke_3;
  v16[3] = &unk_26408D968;
  id v8 = v5;
  id v17 = v8;
  uint64_t v9 = objc_msgSend(v7, "na_any:", v16);

  v10 = [NSNumber numberWithBool:v9];
  [v3 setObject:v10 forKeyedSubscript:@"selected"];

  v11 = [v3 objectForKeyedSubscript:@"dependentHomeKitObjects"];
  objc_super v12 = v11;
  if (v11)
  {
    v13 = (void *)[v11 mutableCopy];
  }
  else
  {
    id v14 = [MEMORY[0x263EFFA08] set];
    v13 = (void *)[v14 mutableCopy];
  }
  [v13 unionSet:v4];
  [v3 setObject:v13 forKeyedSubscript:@"dependentHomeKitObjects"];

  return v3;
}

uint64_t __66__HFSelectableRoomTransformItem_initWithRoomItem_accessoryVendor___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

uint64_t __66__HFSelectableRoomTransformItem_initWithRoomItem_accessoryVendor___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

@end