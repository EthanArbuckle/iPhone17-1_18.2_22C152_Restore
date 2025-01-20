@interface WFGetDropboxFileActionUIKitUserInterface
- (id)completionHandler;
- (id)selectedStorageServiceForName:(id)a3;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)finishWithResults:(id)a3 error:(id)a4;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)showWithServiceName:(id)a3 directoryPath:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
@end

@implementation WFGetDropboxFileActionUIKitUserInterface

- (void).cxx_destruct
{
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  objc_msgSend(MEMORY[0x263F087E8], "userCancelledError", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(WFGetDropboxFileActionUIKitUserInterface *)self finishWithResults:0 error:v4];
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84__WFGetDropboxFileActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFGetDropboxFileActionUIKitUserInterface;
  id v5 = v4;
  [(WFEmbeddableActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __84__WFGetDropboxFileActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x263F087E8] userCancelledError];
  [v2 finishWithResults:0 error:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)finishWithResults:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(WFGetDropboxFileActionUIKitUserInterface *)self completionHandler];

  if (v7)
  {
    id v8 = [(WFGetDropboxFileActionUIKitUserInterface *)self completionHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
  else
  {
    [(WFGetDropboxFileActionUIKitUserInterface *)self setCompletionHandler:0];
  }
}

- (void)showWithServiceName:(id)a3 directoryPath:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  [(WFGetDropboxFileActionUIKitUserInterface *)self setCompletionHandler:v12];
  v13 = [MEMORY[0x263F85118] accessSpecifierForCurrentConnection];
  v14 = [v13 bundleIdentifier];

  if (!v14)
  {
    v15 = getWFActionsLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      v16 = [MEMORY[0x263F08D68] currentConnection];
      *(_DWORD *)buf = 136315394;
      v29 = "-[WFGetDropboxFileActionUIKitUserInterface showWithServiceName:directoryPath:options:completionHandler:]";
      __int16 v30 = 2112;
      v31 = v16;
      _os_log_impl(&dword_22BEF1000, v15, OS_LOG_TYPE_FAULT, "%s Could not get bundle identifier for the calling process. +[NSXPCConnection currentConnection] is %@", buf, 0x16u);
    }
    v17 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:57 userInfo:0];
    [(WFGetDropboxFileActionUIKitUserInterface *)self finishWithResults:0 error:v17];
  }
  v18 = [(WFGetDropboxFileActionUIKitUserInterface *)self selectedStorageServiceForName:v10];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __104__WFGetDropboxFileActionUIKitUserInterface_showWithServiceName_directoryPath_options_completionHandler___block_invoke;
  block[3] = &unk_264900270;
  id v26 = v12;
  unint64_t v27 = a5;
  id v23 = v18;
  v24 = self;
  id v25 = v11;
  id v19 = v11;
  id v20 = v12;
  id v21 = v18;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __104__WFGetDropboxFileActionUIKitUserInterface_showWithServiceName_directoryPath_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void *)(a1 + 64) >> 1) & 1;
  v3 = [WFFilePickerViewController alloc];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __104__WFGetDropboxFileActionUIKitUserInterface_showWithServiceName_directoryPath_options_completionHandler___block_invoke_2;
  v14 = &unk_2648FFE78;
  id v5 = *(id *)(a1 + 56);
  uint64_t v15 = *(void *)(a1 + 40);
  id v16 = v5;
  id v6 = [(WFFilePickerViewController *)v3 initForPickingFilesAtPath:@"/" service:v4 allowsMultipleSelection:v2 completionHandler:&v11];
  id v7 = objc_alloc(MEMORY[0x263F829B8]);
  id v8 = objc_msgSend(v7, "initWithRootViewController:", v6, v11, v12, v13, v14);
  [v8 setModalPresentationStyle:2];
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [v8 presentationController];
  [v10 setDelegate:v9];

  [v6 navigateToSubdirectoryAtPath:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) presentContent:v8];
}

void __104__WFGetDropboxFileActionUIKitUserInterface_showWithServiceName_directoryPath_options_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 count])
  {
    v3 = objc_msgSend(v5, "if_map:", &__block_literal_global_547);
    [*(id *)(a1 + 32) finishWithResults:v3 error:0];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    v3 = [MEMORY[0x263F087E8] userCancelledError];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v3);
  }
}

id __104__WFGetDropboxFileActionUIKitUserInterface_showWithServiceName_directoryPath_options_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = (void *)MEMORY[0x263F23200];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v4 = v2;
    }
    else {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = v4;
  id v6 = [v3 resultWithMetadata:v5];

  return v6;
}

- (id)selectedStorageServiceForName:(id)a3
{
  v3 = (void *)MEMORY[0x263F23268];
  id v4 = a3;
  id v5 = [v3 sharedRegistry];
  id v6 = [v5 storageServiceWithName:v4];

  return v6;
}

@end