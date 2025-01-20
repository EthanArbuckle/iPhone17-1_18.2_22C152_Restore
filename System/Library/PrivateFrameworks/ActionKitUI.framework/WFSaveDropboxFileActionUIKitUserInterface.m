@interface WFSaveDropboxFileActionUIKitUserInterface
- (WFFileStorageServiceOperation)saveOperation;
- (id)completionHandler;
- (id)selectedStorageServiceForName:(id)a3;
- (void)cancel;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setSaveOperation:(id)a3;
- (void)showWithServiceName:(id)a3 input:(id)a4 managedLevel:(unint64_t)a5 options:(unint64_t)a6 completionHandler:(id)a7;
@end

@implementation WFSaveDropboxFileActionUIKitUserInterface

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_saveOperation, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setSaveOperation:(id)a3
{
}

- (WFFileStorageServiceOperation)saveOperation
{
  return self->_saveOperation;
}

- (void)cancel
{
  v3 = [(WFSaveDropboxFileActionUIKitUserInterface *)self saveOperation];
  [v3 cancel];

  v4 = [(WFSaveDropboxFileActionUIKitUserInterface *)self completionHandler];

  if (v4)
  {
    v5 = [(WFSaveDropboxFileActionUIKitUserInterface *)self completionHandler];
    v6 = [MEMORY[0x263F087E8] userCancelledError];
    ((void (**)(void, void, void *))v5)[2](v5, 0, v6);
  }
  [(WFSaveDropboxFileActionUIKitUserInterface *)self setCompletionHandler:0];
  [(WFSaveDropboxFileActionUIKitUserInterface *)self setSaveOperation:0];
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __85__WFSaveDropboxFileActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFSaveDropboxFileActionUIKitUserInterface;
  id v5 = v4;
  [(WFEmbeddableActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __85__WFSaveDropboxFileActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)showWithServiceName:(id)a3 input:(id)a4 managedLevel:(unint64_t)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (!v14)
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WFSaveDropboxFileActionUIKitUserInterface.m", 31, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  [(WFSaveDropboxFileActionUIKitUserInterface *)self setCompletionHandler:v14];
  v15 = [(WFSaveDropboxFileActionUIKitUserInterface *)self selectedStorageServiceForName:v12];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __110__WFSaveDropboxFileActionUIKitUserInterface_showWithServiceName_input_managedLevel_options_completionHandler___block_invoke;
  block[3] = &unk_264900270;
  id v21 = v15;
  id v22 = v13;
  v23 = self;
  id v24 = v14;
  unint64_t v25 = a5;
  id v16 = v13;
  id v17 = v14;
  id v18 = v15;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __110__WFSaveDropboxFileActionUIKitUserInterface_showWithServiceName_input_managedLevel_options_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [WFFilePickerViewController alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __110__WFSaveDropboxFileActionUIKitUserInterface_showWithServiceName_input_managedLevel_options_completionHandler___block_invoke_2;
  v12[3] = &unk_264900248;
  id v16 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v13 = v4;
  uint64_t v14 = v5;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 64);
  id v15 = v6;
  uint64_t v17 = v7;
  id v8 = [(WFFilePickerViewController *)v2 initForSavingFilesAtPath:@"/" service:v3 completionHandler:v12];
  v9 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v8];
  [v9 setModalPresentationStyle:2];
  uint64_t v10 = *(void *)(a1 + 48);
  v11 = [v9 presentationController];
  [v11 setDelegate:v10];

  [*(id *)(a1 + 48) presentContent:v9];
}

void __110__WFSaveDropboxFileActionUIKitUserInterface_showWithServiceName_input_managedLevel_options_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 length])
  {
    id v4 = objc_msgSend(*(id *)(a1 + 32), "if_compactMap:", &__block_literal_global_1948);
    uint64_t v5 = *(void *)(a1 + 64);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __110__WFSaveDropboxFileActionUIKitUserInterface_showWithServiceName_input_managedLevel_options_completionHandler___block_invoke_4;
    v9[3] = &unk_264900FC8;
    id v6 = *(void **)(a1 + 48);
    v9[4] = *(void *)(a1 + 40);
    uint64_t v7 = [v6 saveFiles:v4 withManagedLevel:v5 toPath:v3 options:0 progress:0 completionHandler:v9];
    [*(id *)(a1 + 40) setSaveOperation:v7];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 56);
    id v4 = [MEMORY[0x263F087E8] userCancelledError];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v4);
  }
}

void __110__WFSaveDropboxFileActionUIKitUserInterface_showWithServiceName_input_managedLevel_options_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) saveOperation];
  char v7 = [v6 isCancelled];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = [*(id *)(a1 + 32) completionHandler];

    if (v8)
    {
      v9 = [*(id *)(a1 + 32) completionHandler];
      ((void (**)(void, id, id))v9)[2](v9, v10, v5);
    }
    [*(id *)(a1 + 32) setCompletionHandler:0];
    [*(id *)(a1 + 32) setSaveOperation:0];
  }
}

id __110__WFSaveDropboxFileActionUIKitUserInterface_showWithServiceName_input_managedLevel_options_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F33870];
  id v3 = [a2 wrappedURL];
  id v4 = [v3 url];
  id v5 = [v2 fileWithURL:v4 options:8];

  return v5;
}

- (id)selectedStorageServiceForName:(id)a3
{
  id v3 = (void *)MEMORY[0x263F23268];
  id v4 = a3;
  id v5 = [v3 sharedRegistry];
  id v6 = [v5 storageServiceWithName:v4];

  return v6;
}

@end