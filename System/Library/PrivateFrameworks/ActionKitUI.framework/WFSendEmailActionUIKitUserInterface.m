@interface WFSendEmailActionUIKitUserInterface
- (id)completionHandler;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)finishWithError:(id)a3;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)setCompletionHandler:(id)a3;
- (void)showWithEmailContent:(id)a3 preferredSendingEmailAddress:(id)a4 isManaged:(BOOL)a5 completionHandler:(id)a6;
@end

@implementation WFSendEmailActionUIKitUserInterface

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

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __87__WFSendEmailActionUIKitUserInterface_mailComposeController_didFinishWithResult_error___block_invoke;
  v5[3] = &unk_264900DA8;
  v5[4] = self;
  v5[5] = a4;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v5, a5);
}

void __87__WFSendEmailActionUIKitUserInterface_mailComposeController_didFinishWithResult_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2 == 3)
  {
    uint64_t v3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:5 userInfo:0];
    goto LABEL_5;
  }
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x263F087E8] userCancelledError];
LABEL_5:
    v4 = (void *)v3;
    goto LABEL_7;
  }
  v4 = 0;
LABEL_7:
  id v5 = v4;
  [*(id *)(a1 + 32) finishWithError:v4];
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__WFSendEmailActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFSendEmailActionUIKitUserInterface;
  id v5 = v4;
  [(WFEmbeddableActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __79__WFSendEmailActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [MEMORY[0x263F087E8] userCancelledError];
  [v2 finishWithError:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)finishWithError:(id)a3
{
  id v6 = a3;
  id v4 = [(WFSendEmailActionUIKitUserInterface *)self completionHandler];

  if (v4)
  {
    id v5 = [(WFSendEmailActionUIKitUserInterface *)self completionHandler];
    ((void (**)(void, void, id))v5)[2](v5, 0, v6);
  }
  [(WFSendEmailActionUIKitUserInterface *)self setCompletionHandler:0];
}

- (void)showWithEmailContent:(id)a3 preferredSendingEmailAddress:(id)a4 isManaged:(BOOL)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = v13;
  if (!v11)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFSendEmailActionUIKitUserInterface.m", 24, @"Invalid parameter not satisfying: %@", @"emailContent" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
LABEL_5:
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"WFSendEmailActionUIKitUserInterface.m", 25, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v13) {
    goto LABEL_5;
  }
LABEL_3:
  [(WFSendEmailActionUIKitUserInterface *)self setCompletionHandler:v14];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __117__WFSendEmailActionUIKitUserInterface_showWithEmailContent_preferredSendingEmailAddress_isManaged_completionHandler___block_invoke;
  block[3] = &unk_264900850;
  BOOL v22 = a5;
  block[4] = self;
  id v20 = v11;
  id v21 = v12;
  id v15 = v12;
  id v16 = v11;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __117__WFSendEmailActionUIKitUserInterface_showWithEmailContent_preferredSendingEmailAddress_isManaged_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F12578]);
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  id v4 = (void *)[v2 initWithURL:0 sourceAccountManagement:v3];
  id v5 = v4;
  if (v4)
  {
    [v4 setMailComposeDelegate:*(void *)(a1 + 32)];
    uint64_t v6 = [*(id *)(a1 + 40) subject];
    v7 = (void *)v6;
    if (v6) {
      id v8 = (__CFString *)v6;
    }
    else {
      id v8 = &stru_26DF570D0;
    }
    [v5 setSubject:v8];

    v9 = [*(id *)(a1 + 40) toRecipients];
    v10 = objc_msgSend(v9, "if_map:", &__block_literal_global_81);
    [v5 setToRecipients:v10];

    id v11 = [*(id *)(a1 + 40) ccRecipients];
    id v12 = objc_msgSend(v11, "if_map:", &__block_literal_global_227);
    [v5 setCcRecipients:v12];

    id v13 = [*(id *)(a1 + 40) bccRecipients];
    v14 = objc_msgSend(v13, "if_map:", &__block_literal_global_229);
    [v5 setBccRecipients:v14];

    if ([*(id *)(a1 + 48) length]) {
      [v5 setPreferredSendingEmailAddress:*(void *)(a1 + 48)];
    }
    id v15 = [*(id *)(a1 + 40) body];
    id v16 = v5;
    objc_msgSend(v5, "setMessageBody:isHTML:", v15, objc_msgSend(*(id *)(a1 + 40), "isHTML"));

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v30 = a1;
    id obj = [*(id *)(a1 + 40) attachments];
    uint64_t v17 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v33 != v19) {
            objc_enumerationMutation(obj);
          }
          id v21 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          BOOL v22 = [v21 mappedData];
          v23 = [v21 wfType];
          uint64_t v24 = [v23 MIMEType];
          v25 = (void *)v24;
          if (v24) {
            v26 = (__CFString *)v24;
          }
          else {
            v26 = @"application/octet-stream";
          }
          v27 = [v21 filename];
          [v16 addAttachmentData:v22 mimeType:v26 fileName:v27];
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v18);
    }

    id v5 = v16;
    [*(id *)(v30 + 32) presentContent:v16];
  }
  else
  {
    v28 = [*(id *)(a1 + 32) completionHandler];
    v29 = objc_msgSend(MEMORY[0x263F087E8], "wf_mailComposerUnavailableError");
    ((void (**)(void, void, void *))v28)[2](v28, 0, v29);
  }
}

uint64_t __117__WFSendEmailActionUIKitUserInterface_showWithEmailContent_preferredSendingEmailAddress_isManaged_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 address];
}

uint64_t __117__WFSendEmailActionUIKitUserInterface_showWithEmailContent_preferredSendingEmailAddress_isManaged_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 address];
}

uint64_t __117__WFSendEmailActionUIKitUserInterface_showWithEmailContent_preferredSendingEmailAddress_isManaged_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 address];
}

@end