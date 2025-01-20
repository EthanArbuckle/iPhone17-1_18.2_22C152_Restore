@interface UIDocumentPickerDocumentCollectionViewController
@end

@implementation UIDocumentPickerDocumentCollectionViewController

void __95___UIDocumentPickerDocumentCollectionViewController_containersChangedWithSnapshot_differences___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v2 = [*(id *)(a1 + 32) objectForKey:@"_UIDocumentPickerModelModifiedThumbnail"];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v8 = [*(id *)(a1 + 40) collectionView];
        v9 = [v8 cellForItemAtIndexPath:v7];

        [v9 reloadItem:1];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v4);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v10 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x263F1D860], 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v21 + 1) + 8 * j);
        v16 = [*(id *)(a1 + 40) collectionView];
        v17 = [v16 cellForItemAtIndexPath:v15];

        v18 = [*(id *)(a1 + 40) modelObjects];
        v19 = objc_msgSend(v18, "objectAtIndex:", objc_msgSend(v15, "row"));

        v20 = [v17 item];

        if (v20 == v19) {
          [v17 reloadItem:0];
        }
        else {
          [v17 setItem:v19];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v12);
  }
}

void __95___UIDocumentPickerDocumentCollectionViewController_containersChangedWithSnapshot_differences___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setModelObjects:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 32) collectionView];
  uint64_t v3 = [*(id *)(a1 + 48) objectForKey:*MEMORY[0x263F1D858]];
  [v2 insertItemsAtIndexPaths:v3];

  uint64_t v4 = [*(id *)(a1 + 32) collectionView];
  uint64_t v5 = [*(id *)(a1 + 48) objectForKey:*MEMORY[0x263F1D850]];
  [v4 deleteItemsAtIndexPaths:v5];

  v6 = [*(id *)(a1 + 48) objectForKey:*MEMORY[0x263F1D868]];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __95___UIDocumentPickerDocumentCollectionViewController_containersChangedWithSnapshot_differences___block_invoke_3;
  v7[3] = &unk_26492D4D8;
  v7[4] = *(void *)(a1 + 32);
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
}

void __95___UIDocumentPickerDocumentCollectionViewController_containersChangedWithSnapshot_differences___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 collectionView];
  [v7 moveItemAtIndexPath:v6 toIndexPath:v5];
}

void __79___UIDocumentPickerDocumentCollectionViewController_performAction_forRow_view___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tableLayout];
  [v1 resetSwipedRowWithCompletion:0];
}

uint64_t __81___UIDocumentPickerDocumentCollectionViewController__showMoreOptionsForRow_view___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performAction:3 forRow:*(void *)(a1 + 40) view:*(void *)(a1 + 48)];
}

uint64_t __81___UIDocumentPickerDocumentCollectionViewController__showMoreOptionsForRow_view___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) performAction:4 forRow:*(void *)(a1 + 40) view:*(void *)(a1 + 48)];
}

uint64_t __81___UIDocumentPickerDocumentCollectionViewController__showMoreOptionsForRow_view___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) performAction:5 forRow:*(void *)(a1 + 40) view:*(void *)(a1 + 48)];
}

void __81___UIDocumentPickerDocumentCollectionViewController__showMoreOptionsForRow_view___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tableLayout];
  [v1 resetSwipedRowWithCompletion:0];
}

uint64_t __118___UIDocumentPickerDocumentCollectionViewController_collectionView_tableLayout_trailingSwipeActionsForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) performAction:1 forRow:*(void *)(a1 + 32) view:a3];
}

uint64_t __118___UIDocumentPickerDocumentCollectionViewController_collectionView_tableLayout_trailingSwipeActionsForRowAtIndexPath___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) _showMoreOptionsForRow:*(void *)(a1 + 32) view:a3];
}

uint64_t __118___UIDocumentPickerDocumentCollectionViewController_collectionView_tableLayout_trailingSwipeActionsForRowAtIndexPath___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) performAction:0 forRow:*(void *)(a1 + 32) view:a3];
}

void __79___UIDocumentPickerDocumentCollectionViewController_previewActionItemsForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) serviceViewController];
  if ([v6 shouldShowAction:a3])
  {
    int v7 = [*(id *)(a1 + 40) isActionApplicableForItem:a3];

    if (v7)
    {
      v8 = (void *)MEMORY[0x263F1C8B0];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __79___UIDocumentPickerDocumentCollectionViewController_previewActionItemsForItem___block_invoke_2;
      v12[3] = &unk_26492D578;
      v9 = *(void **)(a1 + 40);
      v10 = *(void **)(a1 + 48);
      v12[4] = *(void *)(a1 + 32);
      uint64_t v14 = a3;
      id v13 = v9;
      uint64_t v11 = [v8 actionWithTitle:v5 style:0 handler:v12];
      [v10 addObject:v11];
    }
  }
  else
  {
  }
}

void __79___UIDocumentPickerDocumentCollectionViewController_previewActionItemsForItem___block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) serviceViewController];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v4 = [*(id *)(a1 + 32) view];
  [v5 performAction:v2 item:v3 view:v4 completion:0];
}

@end