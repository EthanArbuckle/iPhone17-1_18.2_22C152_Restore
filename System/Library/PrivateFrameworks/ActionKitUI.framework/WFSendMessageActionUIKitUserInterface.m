@interface WFSendMessageActionUIKitUserInterface
- (NSArray)files;
- (id)completionHandler;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)finishWithError:(id)a3;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setFiles:(id)a3;
- (void)showWithRecipients:(id)a3 content:(id)a4 attachments:(id)a5 completionHandler:(id)a6;
- (void)showWithRecipients:(id)a3 content:(id)a4 files:(id)a5 completionHandler:(id)a6;
@end

@implementation WFSendMessageActionUIKitUserInterface

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)setFiles:(id)a3
{
}

- (NSArray)files
{
  return self->_files;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:5 userInfo:0];
  }
  else if (a4)
  {
    v7 = 0;
  }
  else
  {
    v7 = [MEMORY[0x263F087E8] userCancelledError];
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __90__WFSendMessageActionUIKitUserInterface_messageComposeViewController_didFinishWithResult___block_invoke;
  v9[3] = &unk_264900E88;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  [v6 dismissViewControllerAnimated:1 completion:v9];
}

uint64_t __90__WFSendMessageActionUIKitUserInterface_messageComposeViewController_didFinishWithResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithError:*(void *)(a1 + 40)];
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__WFSendMessageActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFSendMessageActionUIKitUserInterface;
  id v5 = v4;
  [(WFEmbeddableActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __81__WFSendMessageActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x263F087E8] userCancelledError];
  [v2 finishWithError:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)finishWithError:(id)a3
{
  id v6 = a3;
  id v4 = [(WFSendMessageActionUIKitUserInterface *)self completionHandler];

  if (v4)
  {
    id v5 = [(WFSendMessageActionUIKitUserInterface *)self completionHandler];
    ((void (**)(void, void, id))v5)[2](v5, 0, v6);
  }
  [(WFSendMessageActionUIKitUserInterface *)self setCompletionHandler:0];
}

- (void)showWithRecipients:(id)a3 content:(id)a4 files:(id)a5 completionHandler:(id)a6
{
  v23[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void, void *))a6;
  if ([MEMORY[0x263F12580] canSendText])
  {
    [(WFSendMessageActionUIKitUserInterface *)self setCompletionHandler:v13];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __92__WFSendMessageActionUIKitUserInterface_showWithRecipients_content_files_completionHandler___block_invoke;
    block[3] = &unk_264900F78;
    id v18 = v10;
    id v19 = v11;
    v20 = self;
    id v21 = v12;
    dispatch_async(MEMORY[0x263EF83A0], block);

    v14 = v18;
  }
  else
  {
    uint64_t v22 = *MEMORY[0x263F08320];
    v15 = WFLocalizedString(@"Cannot send messages. iMessage may not be enabled.");
    v23[0] = v15;
    v14 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];

    v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3328 userInfo:v14];
    v13[2](v13, 0, v16);
  }
}

void __92__WFSendMessageActionUIKitUserInterface_showWithRecipients_content_files_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F12580]);
  v3 = objc_msgSend(*(id *)(a1 + 32), "if_map:", &__block_literal_global_4673);
  [v2 setRecipients:v3];

  [v2 setBody:*(void *)(a1 + 40)];
  [v2 setMessageComposeDelegate:*(void *)(a1 + 48)];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v17 = a1;
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v10 = [v9 filename];
        id v11 = [v9 wfType];
        id v12 = WFLivePhotoFileType();
        int v13 = [v11 conformsToUTType:v12];

        if (v13)
        {

          id v10 = 0;
        }
        if ([v9 representationType])
        {
          v14 = [v9 fileURL];
          [v2 addAttachmentURL:v14 withAlternateFilename:v10];
        }
        else
        {
          v14 = [v9 data];
          v15 = [v9 wfType];
          v16 = [v15 string];
          [v2 addAttachmentData:v14 typeIdentifier:v16 filename:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  [*(id *)(v17 + 48) presentContent:v2];
}

uint64_t __92__WFSendMessageActionUIKitUserInterface_showWithRecipients_content_files_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 address];
}

- (void)showWithRecipients:(id)a3 content:(id)a4 attachments:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)MEMORY[0x263F08928];
  v15 = (void *)MEMORY[0x263EFFA08];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __98__WFSendMessageActionUIKitUserInterface_showWithRecipients_content_attachments_completionHandler___block_invoke;
  v22[3] = &unk_264900C80;
  v22[4] = self;
  id v23 = v10;
  id v24 = v11;
  id v25 = v13;
  id v18 = v13;
  id v19 = v11;
  id v20 = v10;
  id v21 = (id)objc_msgSend(v14, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v12, v17, v22);
}

void __98__WFSendMessageActionUIKitUserInterface_showWithRecipients_content_attachments_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) showWithRecipients:*(void *)(a1 + 40) content:*(void *)(a1 + 48) files:v4 completionHandler:*(void *)(a1 + 56)];
}

@end