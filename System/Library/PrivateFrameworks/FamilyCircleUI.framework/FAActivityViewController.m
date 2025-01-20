@interface FAActivityViewController
- (BOOL)didCompleteAirdropTransfer;
- (FAActivityViewController)initWithItemSource:(id)a3 eventType:(id)a4;
- (FAActivityViewControllerDelegate)delegate;
- (NSArray)recipientAddresses;
- (id)_parseRecipientAddresses:(id)a3;
- (void)_prepareActivity:(id)a3 completion:(id)a4;
- (void)activityViewControllerDidFinishAirdropTransfer:(id)a3;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)mailComposeController:(id)a3 shouldSendMail:(id)a4 toRecipients:(id)a5 completion:(id)a6;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)messageComposeViewController:(id)a3 shouldSendMessage:(id)a4 toRecipients:(id)a5 completion:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setDidCompleteAirdropTransfer:(BOOL)a3;
- (void)setRecipientAddresses:(id)a3;
@end

@implementation FAActivityViewController

- (FAActivityViewController)initWithItemSource:(id)a3 eventType:(id)a4
{
  v26[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = objc_alloc_init(FAInviteInPersonActivity);
  int v10 = [v8 isEqualToString:*MEMORY[0x263F3BE08]];

  v26[0] = v7;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  v25 = v9;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
  v22.receiver = self;
  v22.super_class = (Class)FAActivityViewController;
  v13 = [(FAActivityViewController *)&v22 initWithActivityItems:v11 applicationActivities:v12 shouldSuggestFamilyMembers:v10 ^ 1u];

  if (v13)
  {
    objc_storeStrong((id *)&v13->_itemSource, a3);
    v14 = objc_alloc_init(FAInviteRecipientEvaluator);
    inviteRecipientEvaluator = v13->_inviteRecipientEvaluator;
    v13->_inviteRecipientEvaluator = v14;

    uint64_t v16 = *MEMORY[0x263F6BCF0];
    if (v10)
    {
      v24[0] = *MEMORY[0x263F6BCD8];
      v24[1] = v16;
      v24[2] = *MEMORY[0x263F6BD00];
      v17 = (void *)MEMORY[0x263EFF8C0];
      v18 = v24;
      uint64_t v19 = 3;
    }
    else
    {
      v23[0] = *MEMORY[0x263F6BCD8];
      v23[1] = v16;
      v23[2] = *MEMORY[0x263F6BD00];
      v23[3] = @"FAInviteInPersonActivity";
      v17 = (void *)MEMORY[0x263EFF8C0];
      v18 = v23;
      uint64_t v19 = 4;
    }
    v20 = [v17 arrayWithObjects:v18 count:v19];
    [(FAActivityViewController *)v13 setIncludedActivityTypes:v20];

    [(FAActivityViewController *)v13 setAirDropDelegate:v13];
    [(FAActivityViewController *)v13 setAllowsCustomPresentationStyle:1];
  }

  return v13;
}

- (void)_prepareActivity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  recipientAddresses = self->_recipientAddresses;
  self->_recipientAddresses = 0;

  v9 = [(FAActivityViewController *)self delegate];
  int v10 = [v9 linkMetadataForActivityViewController:self];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __56__FAActivityViewController__prepareActivity_completion___block_invoke;
  v15[3] = &unk_2643493F0;
  id v16 = v6;
  v17 = self;
  id v18 = v10;
  id v19 = v7;
  v14.receiver = self;
  v14.super_class = (Class)FAActivityViewController;
  id v11 = v7;
  id v12 = v10;
  id v13 = v6;
  [(FAActivityViewController *)&v14 _prepareActivity:v13 completion:v15];
}

uint64_t __56__FAActivityViewController__prepareActivity_completion___block_invoke(uint64_t a1)
{
  v43[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) activityType];
  v3 = (void *)*MEMORY[0x263F6BD00];

  v4 = *(void **)(a1 + 32);
  if (v2 == v3)
  {
    id v11 = v4;
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = [v11 messageComposeViewController];
    [v13 setMessageComposeDelegate:v12];

    objc_super v14 = [*(id *)(a1 + 48) context];
    v15 = [v14 messageBubbleTitle];

    if (v15)
    {
      id v16 = objc_alloc(MEMORY[0x263F125A8]);
      v17 = [*(id *)(a1 + 48) bubbleMetadata];
      id v9 = (id)[v16 initWithLinkMetadata:v17];

      id v18 = (void *)[objc_alloc(MEMORY[0x263F125A0]) initWithAlternateLayout:v9];
      v43[0] = *MEMORY[0x263F4A180];
      id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:1];
      [v18 setRequiredCapabilities:v19];

      id v20 = objc_alloc(MEMORY[0x263F12598]);
      id v21 = objc_alloc_init(MEMORY[0x263F125C0]);
      objc_super v22 = (void *)[v20 initWithSession:v21];

      [v22 setLayout:v18];
      v23 = [*(id *)(a1 + 48) context];
      v24 = [v23 buildInviteMessageBubbleURL:0];
      [v22 setURL:v24];

      v25 = [*(id *)(a1 + 48) context];
      v26 = [v25 messageBubbleSubTitle];
      [v22 setSummaryText:v26];

      v27 = [v11 messageComposeViewController];
      [v27 setMessage:v22];
    }
    else
    {
      id v9 = [v11 messageComposeViewController];
      id v18 = [*(id *)(a1 + 48) bubbleMetadata];
      objc_super v22 = [v18 dataRepresentation];
      v27 = [*(id *)(a1 + 48) bubbleMetadata];
      v41 = [v27 URL];
      [v9 addRichLinkData:v22 withWebpageURL:v41];
    }
LABEL_11:

    goto LABEL_12;
  }
  v5 = [v4 activityType];
  id v6 = (void *)*MEMORY[0x263F6BCF0];

  if (v5 == v6)
  {
    id v11 = [*(id *)(a1 + 48) mailMetadata];
    id v28 = objc_alloc(MEMORY[0x263F103D0]);
    v29 = [v11 originalURL];
    id v9 = (id)[v28 initWithURL:v29];

    [v9 setMetadata:v11];
    id v18 = [v9 HTMLFragmentString];
    v30 = [*(id *)(a1 + 48) context];
    uint64_t v31 = [v30 mailMessageBodyHTML];
    v32 = (void *)v31;
    v33 = &stru_26CA2C800;
    if (v31) {
      v33 = (__CFString *)v31;
    }
    v34 = v33;

    objc_super v22 = [(__CFString *)v34 stringByAppendingString:v18];

    uint64_t v35 = *(void *)(a1 + 40);
    id v36 = *(id *)(a1 + 32);
    v37 = [v36 mailComposeViewController];
    [v37 setMailComposeDelegate:v35];

    v38 = [v36 mailComposeViewController];
    [v38 setMessageBody:v22 isHTML:1];

    v27 = [v36 mailComposeViewController];
    v39 = [*(id *)(a1 + 48) context];

    v40 = [v39 mailMessageSubject];
    [v27 setSubject:v40];

    goto LABEL_11;
  }
  id v7 = [*(id *)(a1 + 32) activityType];

  if (v7 == @"FAInviteInPersonActivity")
  {
    id v8 = *(void **)(a1 + 40);
    id v9 = *(id *)(a1 + 32);
    int v10 = [v8 presentingViewController];
    [v9 setPresentingViewController:v10];

    id v11 = [*(id *)(a1 + 40) delegate];
    [v11 activityViewController:*(void *)(a1 + 40) willStartAsyncActivity:v9];
LABEL_12:
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = _FALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    int v13 = 138412546;
    objc_super v14 = v9;
    __int16 v15 = 2048;
    int64_t v16 = a4;
    _os_log_impl(&dword_2189F0000, v7, OS_LOG_TYPE_DEFAULT, "%@ MFMessageComposeVC delegate callback - didFinishWithResult:%ld", (uint8_t *)&v13, 0x16u);
  }
  int v10 = [(FAActivityViewController *)self activity];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    uint64_t v12 = [(FAActivityViewController *)self activity];
    [v12 messageComposeViewController:v6 didFinishWithResult:a4];
  }
}

- (void)messageComposeViewController:(id)a3 shouldSendMessage:(id)a4 toRecipients:(id)a5 completion:(id)a6
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = (NSArray *)a5;
  id v9 = a6;
  int v10 = _FALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = @"FAActivityViewController.m";
    _os_log_impl(&dword_2189F0000, v10, OS_LOG_TYPE_DEFAULT, "%@ MFMessageComposeVC delegate callback - shouldSendMessage", (uint8_t *)&v19, 0xCu);
  }

  recipientAddresses = self->_recipientAddresses;
  self->_recipientAddresses = v8;
  uint64_t v12 = v8;

  inviteRecipientEvaluator = self->_inviteRecipientEvaluator;
  objc_super v14 = [(FAActivityViewController *)self delegate];
  __int16 v15 = [v14 linkMetadataForActivityViewController:self];
  int64_t v16 = [v15 context];
  uint64_t v17 = [(FAActivityViewController *)self activity];
  id v18 = [v17 activityViewController];
  [(FAInviteRecipientEvaluator *)inviteRecipientEvaluator validateRecipients:v12 inviteContext:v16 presenter:v18 completion:v9];
}

- (void)mailComposeController:(id)a3 shouldSendMail:(id)a4 toRecipients:(id)a5 completion:(id)a6
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a6;
  id v9 = a5;
  int v10 = _FALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = @"FAActivityViewController.m";
    _os_log_impl(&dword_2189F0000, v10, OS_LOG_TYPE_DEFAULT, "%@ MFMessageComposeVC delegate callback - shouldSendMail", (uint8_t *)&v19, 0xCu);
  }

  char v11 = [(FAActivityViewController *)self _parseRecipientAddresses:v9];
  recipientAddresses = self->_recipientAddresses;
  self->_recipientAddresses = v11;

  inviteRecipientEvaluator = self->_inviteRecipientEvaluator;
  objc_super v14 = [(FAActivityViewController *)self delegate];
  __int16 v15 = [v14 linkMetadataForActivityViewController:self];
  int64_t v16 = [v15 context];
  uint64_t v17 = [(FAActivityViewController *)self activity];
  id v18 = [v17 activityViewController];
  [(FAInviteRecipientEvaluator *)inviteRecipientEvaluator validateRecipients:v9 inviteContext:v16 presenter:v18 completion:v8];
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  int v10 = _FALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    __int16 v15 = @"FAActivityViewController.m";
    __int16 v16 = 2048;
    int64_t v17 = a4;
    _os_log_impl(&dword_2189F0000, v10, OS_LOG_TYPE_DEFAULT, "%@ MFMessageComposeVC delegate callback - didFinishWithResult:%ld", (uint8_t *)&v14, 0x16u);
  }

  char v11 = [(FAActivityViewController *)self activity];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    int v13 = [(FAActivityViewController *)self activity];
    [v13 mailComposeController:v8 didFinishWithResult:a4 error:v9];
  }
}

- (id)_parseRecipientAddresses:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  id v5 = objc_alloc_init(MEMORY[0x263F335B8]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = objc_msgSend(v5, "firstEmailAddressInString:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v4 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v4;
}

- (void)activityViewControllerDidFinishAirdropTransfer:(id)a3
{
  id v4 = a3;
  self->_didCompleteAirdropTransfer = 1;
  id v10 = v4;
  id v5 = [v4 completionWithItemsHandler];

  if (v5)
  {
    id v6 = [v10 completionWithItemsHandler];
    uint64_t v7 = [v10 activity];
    uint64_t v8 = [v7 activityType];
    ((void (**)(void, void *, uint64_t, void, void))v6)[2](v6, v8, 1, 0, 0);
  }
  uint64_t v9 = [v10 presentingViewController];
  [v9 dismissViewControllerAnimated:1 completion:0];
}

- (NSArray)recipientAddresses
{
  return self->_recipientAddresses;
}

- (void)setRecipientAddresses:(id)a3
{
}

- (BOOL)didCompleteAirdropTransfer
{
  return self->_didCompleteAirdropTransfer;
}

- (void)setDidCompleteAirdropTransfer:(BOOL)a3
{
  self->_didCompleteAirdropTransfer = a3;
}

- (FAActivityViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FAActivityViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recipientAddresses, 0);
  objc_storeStrong((id *)&self->_inviteRecipientEvaluator, 0);
  objc_storeStrong((id *)&self->_itemSource, 0);
}

@end