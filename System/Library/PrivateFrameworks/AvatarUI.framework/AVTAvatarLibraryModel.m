@interface AVTAvatarLibraryModel
- (AVTAvatarLibraryCreateNewItem)createNewItem;
- (AVTAvatarLibraryModel)initWithAvatarStore:(id)a3 avtViewSessionProvider:(id)a4 environment:(id)a5;
- (AVTAvatarLibraryModelDelegate)delegate;
- (AVTAvatarStoreInternal)avatarStore;
- (AVTUIEnvironment)environment;
- (AVTViewSessionProvider)viewSessionProvider;
- (BOOL)isCreatingAvatar;
- (NSArray)libraryItems;
- (NSMutableArray)mutableLibraryItems;
- (id)libraryItemsFromAvatarRecords:(id)a3;
- (int64_t)indexForRecord:(id)a3;
- (unint64_t)numberOfRecords;
- (void)avatarEditorViewController:(id)a3 didFinishWithAvatarRecord:(id)a4;
- (void)avatarEditorViewControllerDidCancel:(id)a3;
- (void)insertItemForRecord:(id)a3 atIndex:(unint64_t)a4;
- (void)load;
- (void)performActionOnItemAtIndex:(unint64_t)a3;
- (void)presentActionSheetForRecordItem:(id)a3 atIndex:(unint64_t)a4;
- (void)presentEditor:(id)a3 forCreating:(BOOL)a4;
- (void)presetShareSheetWithRecords:(id)a3 fromItem:(id)a4;
- (void)reloadDataForRecords:(id)a3;
- (void)removeItemForRecordAtIndex:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setIsCreatingAvatar:(BOOL)a3;
- (void)storeDidChangeNotification:(id)a3;
- (void)updateForCreatedRecord:(id)a3;
- (void)updateForEditedRecord:(id)a3;
@end

@implementation AVTAvatarLibraryModel

- (AVTAvatarLibraryModel)initWithAvatarStore:(id)a3 avtViewSessionProvider:(id)a4 environment:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)AVTAvatarLibraryModel;
  v12 = [(AVTAvatarLibraryModel *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_avatarStore, a3);
    objc_storeStrong((id *)&v13->_environment, a5);
    v14 = objc_alloc_init(AVTAvatarLibraryCreateNewItem);
    createNewItem = v13->_createNewItem;
    v13->_createNewItem = v14;

    uint64_t v16 = [MEMORY[0x263EFF980] arrayWithObject:v13->_createNewItem];
    mutableLibraryItems = v13->_mutableLibraryItems;
    v13->_mutableLibraryItems = (NSMutableArray *)v16;

    objc_storeStrong((id *)&v13->_viewSessionProvider, a4);
    v18 = [v11 notificationCenter];
    [v18 addObserver:v13 selector:sel_storeDidChangeNotification_ name:*MEMORY[0x263F29710] object:0];
  }
  return v13;
}

- (NSArray)libraryItems
{
  v2 = [(AVTAvatarLibraryModel *)self mutableLibraryItems];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (unint64_t)numberOfRecords
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(AVTAvatarLibraryModel *)self libraryItems];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        objc_opt_class();
        v5 += objc_opt_isKindOfClass() & 1;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)storeDidChangeNotification:(id)a3
{
  uint64_t v4 = [a3 object];
  unint64_t v5 = [(AVTAvatarLibraryModel *)self avatarStore];

  if (v4 != v5)
  {
    [(AVTAvatarLibraryModel *)self load];
  }
}

- (void)load
{
  uint64_t v3 = [MEMORY[0x263F29718] requestForCustomAvatars];
  uint64_t v4 = [(AVTAvatarLibraryModel *)self avatarStore];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __29__AVTAvatarLibraryModel_load__block_invoke;
  v5[3] = &unk_263FF11D8;
  v5[4] = self;
  [v4 fetchAvatarsForFetchRequest:v3 completionHandler:v5];
}

void __29__AVTAvatarLibraryModel_load__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (!a3)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __29__AVTAvatarLibraryModel_load__block_invoke_2;
    v7[3] = &unk_263FF0780;
    v7[4] = *(void *)(a1 + 32);
    id v8 = v5;
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
}

uint64_t __29__AVTAvatarLibraryModel_load__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadDataForRecords:*(void *)(a1 + 40)];
}

- (void)performActionOnItemAtIndex:(unint64_t)a3
{
  id v5 = [(AVTAvatarLibraryModel *)self mutableLibraryItems];
  id v9 = [v5 objectAtIndexedSubscript:a3];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(AVTAvatarLibraryModel *)self presentActionSheetForRecordItem:v9 atIndex:a3];
  }
  else
  {
    uint64_t v6 = [(AVTAvatarLibraryModel *)self avatarStore];
    v7 = [(AVTAvatarLibraryModel *)self viewSessionProvider];
    id v8 = +[AVTAvatarEditorViewController viewControllerForCreatingAvatarInStore:v6 avtViewSessionProvider:v7];

    [(AVTAvatarLibraryModel *)self presentEditor:v8 forCreating:1];
  }
}

- (void)presentEditor:(id)a3 forCreating:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(AVTAvatarLibraryModel *)self setIsCreatingAvatar:v4];
  [v6 setDelegate:self];
  id v7 = [(AVTAvatarLibraryModel *)self delegate];
  [v7 presetEditorViewController:v6];
}

- (void)presentActionSheetForRecordItem:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    unint64_t v35 = a4;
    id v8 = [v6 avatarRecord];
    id v9 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:0 message:0 preferredStyle:0];
    long long v10 = AVTAvatarUIBundle();
    long long v11 = [v10 localizedStringForKey:@"EDIT" value:&stru_26BF058D0 table:@"Localized"];
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke;
    v47[3] = &unk_263FF1200;
    id v12 = v8;
    id v48 = v12;
    v49 = self;
    v13 = +[AVTComponentFactory alertActionWithTitle:v11 style:0 handler:v47];
    [v9 addAction:v13];

    uint64_t v14 = AVTAvatarUIBundle();
    v15 = [v14 localizedStringForKey:@"SHARE" value:&stru_26BF058D0 table:@"Localized"];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_2;
    v44[3] = &unk_263FF1228;
    v44[4] = self;
    id v16 = v12;
    id v45 = v16;
    id v17 = v7;
    id v46 = v17;
    v18 = +[AVTComponentFactory alertActionWithTitle:v15 style:0 handler:v44];
    [v9 addAction:v18];

    v19 = AVTAvatarUIBundle();
    objc_super v20 = [v19 localizedStringForKey:@"SHARE ALL" value:&stru_26BF058D0 table:@"Localized"];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_3;
    v42[3] = &unk_263FF1200;
    v42[4] = self;
    id v34 = v17;
    id v43 = v34;
    v21 = +[AVTComponentFactory alertActionWithTitle:v20 style:0 handler:v42];
    [v9 addAction:v21];

    v22 = [(AVTAvatarLibraryModel *)self avatarStore];
    LODWORD(v20) = [v22 canCreateAvatarWithError:0];

    if (v20)
    {
      v23 = AVTAvatarUIBundle();
      v24 = [v23 localizedStringForKey:@"DUPLICATE" value:&stru_26BF058D0 table:@"Localized"];
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_4;
      v39[3] = &unk_263FF12A0;
      v39[4] = self;
      id v40 = v16;
      unint64_t v41 = v35;
      v25 = +[AVTComponentFactory alertActionWithTitle:v24 style:0 handler:v39];
      [v9 addAction:v25];
    }
    v26 = AVTAvatarUIBundle();
    v27 = [v26 localizedStringForKey:@"DELETE" value:&stru_26BF058D0 table:@"Localized"];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_7;
    v36[3] = &unk_263FF12A0;
    v36[4] = self;
    id v37 = v16;
    unint64_t v38 = v35;
    id v28 = v16;
    v29 = +[AVTComponentFactory alertActionWithTitle:v27 style:0 handler:v36];
    [v9 addAction:v29];

    v30 = AVTAvatarUIBundle();
    v31 = [v30 localizedStringForKey:@"CANCEL" value:&stru_26BF058D0 table:@"Localized"];
    v32 = +[AVTComponentFactory alertActionWithTitle:v31 style:1 handler:0];
    [v9 addAction:v32];

    v33 = [(AVTAvatarLibraryModel *)self delegate];
    [v33 presentUIViewController:v9 forItem:v34];
  }
}

void __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) viewSessionProvider];
  BOOL v4 = [*(id *)(a1 + 40) avatarStore];
  id v5 = +[AVTAvatarEditorViewController viewControllerForEditingAvatar:v2 avtViewSessionProvider:v3 store:v4];

  [*(id *)(a1 + 40) presentEditor:v5 forCreating:0];
}

void __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_2(void *a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)a1[4];
  v4[0] = a1[5];
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  [v2 presetShareSheetWithRecords:v3 fromItem:a1[6]];
}

void __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) avatarStore];
  uint64_t v3 = [MEMORY[0x263F29718] requestForCustomAvatars];
  id v5 = [v2 avatarsForFetchRequest:v3 error:0];

  BOOL v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) presetShareSheetWithRecords:v5 fromItem:*(void *)(a1 + 40)];
    BOOL v4 = v5;
  }
}

void __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) avatarStore];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_5;
  v5[3] = &unk_263FF1278;
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[4] = *(void *)(a1 + 32);
  void v5[5] = v4;
  [v2 duplicateAvatar:v3 completionBlock:v5];
}

void __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_5(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_6;
    block[3] = &unk_263FF1250;
    block[4] = *(void *)(a1 + 32);
    id v7 = v5;
    uint64_t v8 = *(void *)(a1 + 40);
    id v10 = v7;
    uint64_t v11 = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) insertItemForRecord:*(void *)(a1 + 40) atIndex:*(void *)(a1 + 48) + 1];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 didAddRecord:*(void *)(a1 + 40)];
}

void __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_7(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) avatarStore];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_8;
  v5[3] = &unk_263FF12C8;
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[4] = *(void *)(a1 + 32);
  uint64_t v7 = v4;
  id v6 = v3;
  [v2 deleteAvatar:v6 completionHandler:v5];
}

void __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_8(void *a1, int a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_9;
    block[3] = &unk_263FF1250;
    uint64_t v3 = (void *)a1[5];
    uint64_t v2 = a1[6];
    block[4] = a1[4];
    uint64_t v6 = v2;
    id v5 = v3;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_9(uint64_t a1)
{
  [*(id *)(a1 + 32) removeItemForRecordAtIndex:*(void *)(a1 + 48)];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 didDeleteRecord:*(void *)(a1 + 40)];
}

- (id)libraryItemsFromAvatarRecords:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v12 = [AVTAvatarLibraryRecordItem alloc];
        v13 = [(AVTAvatarLibraryModel *)self environment];
        uint64_t v14 = [(AVTAvatarLibraryRecordItem *)v12 initWithAvatarRecord:v11 environment:v13];

        [v5 addObject:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  v15 = [(AVTAvatarLibraryModel *)self avatarStore];
  int v16 = [v15 canCreateAvatarWithError:0];

  if (v16)
  {
    id v17 = [(AVTAvatarLibraryModel *)self createNewItem];
    [v5 addObject:v17];
  }
  return v5;
}

- (void)insertItemForRecord:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [AVTAvatarLibraryRecordItem alloc];
  uint64_t v8 = [(AVTAvatarLibraryModel *)self environment];
  long long v22 = [(AVTAvatarLibraryRecordItem *)v7 initWithAvatarRecord:v6 environment:v8];

  uint64_t v9 = [(AVTAvatarLibraryModel *)self mutableLibraryItems];
  [v9 insertObject:v22 atIndex:a4];

  id v10 = [(AVTAvatarLibraryModel *)self avatarStore];
  char v11 = [v10 canCreateAvatarWithError:0];
  if (v11) {
    goto LABEL_4;
  }
  id v12 = [(AVTAvatarLibraryModel *)self mutableLibraryItems];
  v13 = [(AVTAvatarLibraryModel *)self createNewItem];
  int v14 = [v12 containsObject:v13];

  if (v14)
  {
    id v10 = [(AVTAvatarLibraryModel *)self mutableLibraryItems];
    v15 = [(AVTAvatarLibraryModel *)self createNewItem];
    [v10 removeObject:v15];

LABEL_4:
    char v16 = v11 ^ 1;

    goto LABEL_6;
  }
  char v16 = 0;
LABEL_6:
  id v17 = [(AVTAvatarLibraryModel *)self delegate];
  v18 = [MEMORY[0x263F088D0] indexSetWithIndex:a4];
  if (v16)
  {
    long long v19 = (void *)MEMORY[0x263F088D0];
    long long v20 = [(AVTAvatarLibraryModel *)self mutableLibraryItems];
    long long v21 = objc_msgSend(v19, "indexSetWithIndex:", objc_msgSend(v20, "count") - 1);
    [v17 insertItemsAtIndexes:v18 deleteItemsAtIndexes:v21 reloadItemsAtIndexes:0];
  }
  else
  {
    [v17 insertItemsAtIndexes:v18 deleteItemsAtIndexes:0 reloadItemsAtIndexes:0];
  }
}

- (void)removeItemForRecordAtIndex:(unint64_t)a3
{
  id v4 = self;
  id v5 = [(AVTAvatarLibraryModel *)self mutableLibraryItems];
  [v5 removeObjectAtIndex:a3];

  id v6 = [v4 avatarStore];
  if ([v6 canCreateAvatarWithError:0])
  {
    uint64_t v7 = [v4 mutableLibraryItems];
    uint64_t v8 = [v4 createNewItem];
    int v9 = [v7 containsObject:v8];

    if (!v9)
    {
      id v10 = [v4 mutableLibraryItems];
      char v11 = [v4 createNewItem];
      [v10 addObject:v11];

      id v16 = [v4 delegate];
      id v12 = (void *)MEMORY[0x263F088D0];
      id v4 = [v4 mutableLibraryItems];
      v13 = objc_msgSend(v12, "indexSetWithIndex:", objc_msgSend(v4, "count") - 1);
      int v14 = 1;
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v16 = [v4 delegate];
  int v14 = 0;
  v13 = 0;
LABEL_6:
  v15 = [MEMORY[0x263F088D0] indexSetWithIndex:a3];
  [v16 insertItemsAtIndexes:v13 deleteItemsAtIndexes:v15 reloadItemsAtIndexes:0];

  if (v14)
  {
  }
}

- (void)reloadDataForRecords:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTAvatarLibraryModel *)self mutableLibraryItems];
  id v6 = [(AVTAvatarLibraryModel *)self libraryItemsFromAvatarRecords:v4];

  [v5 setArray:v6];
  id v8 = [(AVTAvatarLibraryModel *)self delegate];
  uint64_t v7 = [(AVTAvatarLibraryModel *)self libraryItems];
  [v8 didUpdateLibraryItems:v7];
}

- (void)updateForCreatedRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTAvatarLibraryModel *)self libraryItems];
  -[AVTAvatarLibraryModel insertItemForRecord:atIndex:](self, "insertItemForRecord:atIndex:", v4, [v5 count] - 1);

  id v6 = [(AVTAvatarLibraryModel *)self delegate];
  [v6 didAddRecord:v4];
}

- (void)updateForEditedRecord:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(AVTAvatarLibraryModel *)self indexForRecord:v4];
  id v6 = [AVTAvatarLibraryRecordItem alloc];
  uint64_t v7 = [(AVTAvatarLibraryModel *)self environment];
  id v12 = [(AVTAvatarLibraryRecordItem *)v6 initWithAvatarRecord:v4 environment:v7];

  id v8 = [(AVTAvatarLibraryModel *)self mutableLibraryItems];
  [v8 replaceObjectAtIndex:v5 withObject:v12];

  int v9 = [(AVTAvatarLibraryModel *)self delegate];
  id v10 = [MEMORY[0x263F088D0] indexSetWithIndex:v5];
  [v9 insertItemsAtIndexes:0 deleteItemsAtIndexes:0 reloadItemsAtIndexes:v10];

  char v11 = [(AVTAvatarLibraryModel *)self delegate];
  [v11 didEditRecord:v4];
}

- (int64_t)indexForRecord:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(AVTAvatarLibraryModel *)self mutableLibraryItems];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__AVTAvatarLibraryModel_indexForRecord___block_invoke;
  v9[3] = &unk_263FF12F0;
  id v10 = v4;
  id v6 = v4;
  int64_t v7 = [v5 indexOfObjectPassingTest:v9];

  return v7;
}

uint64_t __40__AVTAvatarLibraryModel_indexForRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 avatarRecord];
    int64_t v5 = [v4 identifier];
    id v6 = [*(id *)(a1 + 32) identifier];
    uint64_t v7 = [v5 isEqual:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)presetShareSheetWithRecords:(id)a3 fromItem:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v17 = a4;
  id v6 = [MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (([v12 conformsToProtocol:&unk_26BFA0298] & 1) == 0) {
          [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object protocol for %@", v12 format];
        }
        id v13 = v12;
        if (([v13 isPuppet] & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v13 format];
          }
          [v6 addObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  int v14 = (void *)[objc_alloc(MEMORY[0x263F1C3E8]) initWithActivityItems:v6 applicationActivities:0];
  v15 = [(AVTAvatarLibraryModel *)self delegate];
  [v15 presentUIViewController:v14 forItem:v17];
}

- (void)avatarEditorViewController:(id)a3 didFinishWithAvatarRecord:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(AVTAvatarLibraryModel *)self delegate];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __78__AVTAvatarLibraryModel_avatarEditorViewController_didFinishWithAvatarRecord___block_invoke;
  v10[3] = &unk_263FF0780;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 dismissController:v7 completion:v10];
}

uint64_t __78__AVTAvatarLibraryModel_avatarEditorViewController_didFinishWithAvatarRecord___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isCreatingAvatar];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 setIsCreatingAvatar:0];
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 updateForCreatedRecord:v5];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    return [v3 updateForEditedRecord:v7];
  }
}

- (void)avatarEditorViewControllerDidCancel:(id)a3
{
  id v4 = a3;
  [(AVTAvatarLibraryModel *)self setIsCreatingAvatar:0];
  id v5 = [(AVTAvatarLibraryModel *)self delegate];
  [v5 dismissController:v4 completion:0];
}

- (AVTAvatarLibraryModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTAvatarLibraryModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVTAvatarStoreInternal)avatarStore
{
  return self->_avatarStore;
}

- (AVTViewSessionProvider)viewSessionProvider
{
  return self->_viewSessionProvider;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTAvatarLibraryCreateNewItem)createNewItem
{
  return self->_createNewItem;
}

- (NSMutableArray)mutableLibraryItems
{
  return self->_mutableLibraryItems;
}

- (BOOL)isCreatingAvatar
{
  return self->_isCreatingAvatar;
}

- (void)setIsCreatingAvatar:(BOOL)a3
{
  self->_isCreatingAvatar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableLibraryItems, 0);
  objc_storeStrong((id *)&self->_createNewItem, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_viewSessionProvider, 0);
  objc_storeStrong((id *)&self->_avatarStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end