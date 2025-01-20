@interface WFSelectFilesUIKitUserInterface
- (NSString)consumingBundleID;
- (id)completionHandler;
- (id)supportedPickerContentTypesWithOptions:(unint64_t)a3;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
- (void)finishWithResults:(id)a3 error:(id)a4;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)retrieveFilesWithConsumingBundleID:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)setCompletionHandler:(id)a3;
- (void)setConsumingBundleID:(id)a3;
@end

@implementation WFSelectFilesUIKitUserInterface

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consumingBundleID, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)setConsumingBundleID:(id)a3
{
}

- (NSString)consumingBundleID
{
  return self->_consumingBundleID;
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
  [(WFSelectFilesUIKitUserInterface *)self finishWithResults:0 error:v4];
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __73__WFSelectFilesUIKitUserInterface_documentPicker_didPickDocumentsAtURLs___block_invoke;
  v5[3] = &unk_264900DD0;
  v5[4] = self;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __73__WFSelectFilesUIKitUserInterface_documentPicker_didPickDocumentsAtURLs___block_invoke_2;
  v4[3] = &unk_264900FC8;
  v4[4] = self;
  objc_msgSend(a4, "if_mapAsynchronously:completionHandler:", v5, v4);
}

void __73__WFSelectFilesUIKitUserInterface_documentPicker_didPickDocumentsAtURLs___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v5 = (void *)MEMORY[0x263F23200];
  v6 = *(void **)(a1 + 32);
  id v7 = a4;
  id v8 = a2;
  id v9 = [v6 consumingBundleID];
  [v5 getResultWithFileURL:v8 consumingBundleID:v9 resultBlock:v7];
}

uint64_t __73__WFSelectFilesUIKitUserInterface_documentPicker_didPickDocumentsAtURLs___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResults:a2 error:0];
}

- (void)documentPickerWasCancelled:(id)a3
{
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__WFSelectFilesUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFSelectFilesUIKitUserInterface;
  id v5 = v4;
  [(WFEmbeddableActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __75__WFSelectFilesUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
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
  id v7 = [(WFSelectFilesUIKitUserInterface *)self completionHandler];

  if (v7)
  {
    id v8 = [(WFSelectFilesUIKitUserInterface *)self completionHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
  [(WFSelectFilesUIKitUserInterface *)self setCompletionHandler:0];
}

- (id)supportedPickerContentTypesWithOptions:(unint64_t)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  if ((a3 & 8) != 0)
  {
    v7[0] = *MEMORY[0x263F1DAB0];
    v3 = v7;
  }
  else
  {
    uint64_t v6 = *MEMORY[0x263F1DB38];
    v3 = &v6;
  }
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
  return v4;
}

- (void)retrieveFilesWithConsumingBundleID:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v10)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFSelectFilesActionUIKitUserInterface.m", 24, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  [(WFSelectFilesUIKitUserInterface *)self setCompletionHandler:v10];
  [(WFSelectFilesUIKitUserInterface *)self setConsumingBundleID:v9];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__WFSelectFilesUIKitUserInterface_retrieveFilesWithConsumingBundleID_options_completionHandler___block_invoke;
  block[3] = &unk_264900DA8;
  block[4] = self;
  block[5] = a4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __96__WFSelectFilesUIKitUserInterface_retrieveFilesWithConsumingBundleID_options_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F82698]);
  v3 = [*(id *)(a1 + 32) supportedPickerContentTypesWithOptions:*(void *)(a1 + 40)];
  id v4 = (id)[v2 initForOpeningContentTypes:v3 asCopy:0];

  [v4 setModalPresentationStyle:2];
  [v4 setAllowsMultipleSelection:(*(void *)(a1 + 40) >> 1) & 1];
  [v4 setDelegate:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) presentContent:v4];
}

@end