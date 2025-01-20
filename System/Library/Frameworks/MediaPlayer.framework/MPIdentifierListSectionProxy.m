@interface MPIdentifierListSectionProxy
@end

@implementation MPIdentifierListSectionProxy

void __62___MPIdentifierListSectionProxy_applyChanges_itemLookupBlock___block_invoke(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a3) {
    (*(void (**)(void))(a1[7] + 16))();
  }
  else {
  v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v8 = (void *)a1[4];
  v9 = [*(id *)(a1[5] + 24) objectAtIndexedSubscript:a2];
  [v8 setObject:v7 forKeyedSubscript:v9];

  if (a4)
  {
    v10 = (void *)a1[6];
    id v11 = [*(id *)(a1[5] + 24) objectAtIndexedSubscript:a2];
    [v10 addObject:v11];
  }
}

void __62___MPIdentifierListSectionProxy_applyChanges_itemLookupBlock___block_invoke_2(uint64_t a1, unint64_t a2, uint64_t a3)
{
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  if (a2 < a2 + a3)
  {
    unint64_t v6 = a2;
    do
    {
      v7 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      [v13 addObject:v7];

      ++v6;
      --a3;
    }
    while (a3);
  }
  v8 = *(void **)(a1 + 32);
  if (a2)
  {
    v9 = [v8 itemIdentifiers];
    uint64_t v10 = [v9 count];

    id v11 = *(void **)(a1 + 32);
    if (a2 == v10)
    {
      [*(id *)(a1 + 32) insertItemsAtTail:v13];
    }
    else
    {
      v12 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      [v11 insertItems:v13 afterItem:v12];
    }
  }
  else
  {
    [v8 insertItemsAtHead:v13];
  }
}

void __62___MPIdentifierListSectionProxy_applyChanges_itemLookupBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA98];
  id v6 = a2;
  id v7 = [v5 null];

  v8 = *(void **)(a1 + 32);
  if (v7 == v9) {
    [v8 moveItemToHead:v6];
  }
  else {
    [v8 moveItem:v6 afterItem:v9];
  }
}

@end