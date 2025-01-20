@interface IAMWebMessagePresentationCoordinator
- (BOOL)isPresenting;
- (BOOL)present;
- (IAMWebMessageController)webMessageController;
- (IAMWebMessagePresentationCoordinator)initWithWebMessageEntry:(id)a3 webArchiveURL:(id)a4;
- (IAMWebMessagePresentationCoordinatorDelegate)delegate;
- (ICInAppMessageEntry)webMessageEntry;
- (id)presentingViewController;
- (void)_dismissModalViewController:(id)a3;
- (void)_handleOpenURL:(id)a3;
- (void)_handleWebMessageDismissed;
- (void)_modalViewControllerDismissalTransitionDidEnd:(id)a3;
- (void)load;
- (void)setDelegate:(id)a3;
- (void)setIsPresenting:(BOOL)a3;
- (void)setWebMessageController:(id)a3;
- (void)setWebMessageEntry:(id)a3;
- (void)viewController:(id)a3 didReportDismissalAction:(int64_t)a4;
- (void)webMessageControllerWebViewDidReportEvent:(id)a3 event:(id)a4;
- (void)webMessageControllerWebViewDidRequestAction:(id)a3 actionConfiguration:(id)a4 options:(id)a5;
- (void)webMessageControllerWebViewDidRequestClose:(id)a3;
- (void)webMessageControllerWebViewDidRequestOpenURL:(id)a3 url:(id)a4 options:(id)a5;
@end

@implementation IAMWebMessagePresentationCoordinator

- (IAMWebMessagePresentationCoordinator)initWithWebMessageEntry:(id)a3 webArchiveURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IAMWebMessagePresentationCoordinator;
  v9 = [(IAMWebMessagePresentationCoordinator *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_webMessageEntry, a3);
    uint64_t v11 = [v8 copy];
    webArchiveURL = v10->_webArchiveURL;
    v10->_webArchiveURL = (NSURL *)v11;

    v10->_isPresenting = 0;
  }

  return v10;
}

- (id)presentingViewController
{
  v3 = [(IAMWebMessagePresentationCoordinator *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(IAMWebMessagePresentationCoordinator *)self delegate];
    v6 = [v5 viewControllerForModalPresentationUsingCoordinator:self];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)load
{
  v3 = objc_opt_new();
  [(IAMWebMessagePresentationCoordinator *)self setWebMessageController:v3];

  char v4 = [(IAMWebMessagePresentationCoordinator *)self webMessageController];
  [v4 setDelegate:self];

  v5 = [(IAMWebMessagePresentationCoordinator *)self webMessageController];
  v6 = [(IAMWebMessagePresentationCoordinator *)self webMessageEntry];
  webArchiveURL = self->_webArchiveURL;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__IAMWebMessagePresentationCoordinator_load__block_invoke;
  v8[3] = &unk_264341C30;
  v8[4] = self;
  [v5 loadMessageFromMessageEntry:v6 withWebArchiveURL:webArchiveURL completionHandler:v8];
}

void __44__IAMWebMessagePresentationCoordinator_load__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = IAMLogCategoryDefault();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = [*(id *)(a1 + 32) webMessageEntry];
      id v7 = [v6 applicationMessage];
      id v8 = [v7 identifier];
      v9 = [*(id *)(*(void *)(a1 + 32) + 8) absoluteString];
      int v17 = 138543874;
      v18 = v8;
      __int16 v19 = 2114;
      v20 = v9;
      __int16 v21 = 2114;
      id v22 = v3;
      _os_log_impl(&dword_2188AF000, v5, OS_LOG_TYPE_ERROR, "WebView for message identifier = %{public}@ - webArchiveURL = %{public}@, did fail navigation with error = %{public}@", (uint8_t *)&v17, 0x20u);
    }
    v10 = [*(id *)(a1 + 32) delegate];
    [v10 webMessagePresentationCoordinatorWebMessageDidFail:*(void *)(a1 + 32)];
    goto LABEL_9;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [*(id *)(a1 + 32) webMessageEntry];
    v12 = [v11 applicationMessage];
    v13 = [v12 identifier];
    objc_super v14 = [*(id *)(*(void *)(a1 + 32) + 8) absoluteString];
    int v17 = 138543618;
    v18 = v13;
    __int16 v19 = 2114;
    v20 = v14;
    _os_log_impl(&dword_2188AF000, v5, OS_LOG_TYPE_DEFAULT, "WebView for message identifier = %{public}@, did load with webArchiveURL = %{public}@", (uint8_t *)&v17, 0x16u);
  }
  v15 = [*(id *)(a1 + 32) delegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    v10 = [*(id *)(a1 + 32) delegate];
    [v10 webMessagePresentationCoordinatorWebMessageDidLoad:*(void *)(a1 + 32)];
LABEL_9:
  }
}

- (BOOL)present
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = [(IAMWebMessagePresentationCoordinator *)self presentingViewController];
  char v4 = v3;
  if (!v3)
  {
    v6 = IAMLogCategoryDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [(IAMWebMessagePresentationCoordinator *)self webMessageEntry];
      id v8 = [v7 applicationMessage];
      v9 = [v8 identifier];
      *(_DWORD *)buf = 138412290;
      v26 = v9;
      v10 = "Presenting View Controller or presentation method not provided for message with identifier = %@";
      goto LABEL_7;
    }
LABEL_8:

    [(IAMWebMessagePresentationCoordinator *)self setIsPresenting:0];
    BOOL v11 = 0;
    goto LABEL_12;
  }
  v5 = [v3 presentedViewController];

  if (v5)
  {
    v6 = IAMLogCategoryDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [(IAMWebMessagePresentationCoordinator *)self webMessageEntry];
      id v8 = [v7 applicationMessage];
      v9 = [v8 identifier];
      *(_DWORD *)buf = 138412290;
      v26 = v9;
      v10 = "Presenting View Controller is already presenting another View Controller = %@";
LABEL_7:
      _os_log_impl(&dword_2188AF000, v6, OS_LOG_TYPE_ERROR, v10, buf, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v12 = [IAMModalWebMessageViewController alloc];
  v13 = [(IAMWebMessagePresentationCoordinator *)self webMessageController];
  objc_super v14 = [v13 webView];
  v15 = [(IAMModalWebMessageViewController *)v12 initWithWebView:v14];

  char v16 = [(ICInAppMessageEntry *)self->_webMessageEntry applicationMessage];
  -[IAMModalWebMessageViewController setShouldDisplayCloseButton:](v15, "setShouldDisplayCloseButton:", [v16 hasCloseButton]);
  [(IAMModalWebMessageViewController *)v15 setMetricsDelegate:self];
  int v17 = objc_opt_new();
  objc_msgSend(v17, "setShouldPresentFullscreen:", objc_msgSend(v16, "modalPresentationStyle") == 1);
  [v17 setMetricsDelegate:self];
  [v17 setContentViewController:v15];
  v18 = [MEMORY[0x263F08A00] defaultCenter];
  [v17 setModalPresentationCapturesStatusBarAppearance:1];
  [v4 presentViewController:v17 animated:1 completion:0];
  [v18 addObserver:self selector:sel__modalViewControllerDismissalTransitionDidEnd_ name:*MEMORY[0x263F1D560] object:v17];
  __int16 v19 = IAMLogCategoryDefault();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v24 = [(IAMWebMessagePresentationCoordinator *)self webMessageEntry];
    v20 = [v24 applicationMessage];
    __int16 v21 = [v20 identifier];
    id v22 = [(NSURL *)self->_webArchiveURL absoluteString];
    *(_DWORD *)buf = 138543618;
    v26 = v21;
    __int16 v27 = 2114;
    v28 = v22;
    _os_log_impl(&dword_2188AF000, v19, OS_LOG_TYPE_DEFAULT, "WebView for message identifier = %{public}@, did present with webArchiveURL = %{public}@", buf, 0x16u);
  }
  BOOL v11 = 1;
  [(IAMWebMessagePresentationCoordinator *)self setIsPresenting:1];

LABEL_12:
  return v11;
}

- (void)_modalViewControllerDismissalTransitionDidEnd:(id)a3
{
  id v10 = a3;
  char v4 = [v10 userInfo];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F1D558]];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v8 = *MEMORY[0x263F1D560];
    v9 = [v10 object];
    [v7 removeObserver:self name:v8 object:v9];

    [(IAMWebMessagePresentationCoordinator *)self _handleWebMessageDismissed];
  }
}

- (void)_handleWebMessageDismissed
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  modalViewControllerDismissedCompletion = (void (**)(id, SEL))self->_modalViewControllerDismissedCompletion;
  if (modalViewControllerDismissedCompletion)
  {
    modalViewControllerDismissedCompletion[2](modalViewControllerDismissedCompletion, a2);
    id v4 = self->_modalViewControllerDismissedCompletion;
    self->_modalViewControllerDismissedCompletion = 0;
  }
  v5 = [(IAMWebMessagePresentationCoordinator *)self webMessageController];
  [v5 unregisterExportedObjectInterface];

  int v6 = [(IAMWebMessagePresentationCoordinator *)self webMessageController];
  [v6 setDelegate:0];

  [(IAMWebMessagePresentationCoordinator *)self setWebMessageController:0];
  id v7 = IAMLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(IAMWebMessagePresentationCoordinator *)self webMessageEntry];
    v9 = [v8 applicationMessage];
    id v10 = [v9 identifier];
    int v14 = 138543362;
    v15 = v10;
    _os_log_impl(&dword_2188AF000, v7, OS_LOG_TYPE_DEFAULT, "WebView for message identifier = %{public}@, did finish presentation.", (uint8_t *)&v14, 0xCu);
  }
  BOOL v11 = [(IAMWebMessagePresentationCoordinator *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = [(IAMWebMessagePresentationCoordinator *)self delegate];
    [v13 webMessagePresentationCoordinatorWebMessageDidFinishPresentation:self];
  }
}

- (void)_handleOpenURL:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F1C408] sharedApplication];
  if ([v4 canOpenURL:v3])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __55__IAMWebMessagePresentationCoordinator__handleOpenURL___block_invoke;
    v5[3] = &unk_264341C58;
    id v6 = v3;
    [v4 openURL:v6 options:MEMORY[0x263EFFA78] completionHandler:v5];
  }
}

void __55__IAMWebMessagePresentationCoordinator__handleOpenURL___block_invoke(uint64_t a1, char a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = IAMLogCategoryDefault();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) absoluteString];
      int v10 = 138543362;
      BOOL v11 = v6;
      id v7 = "Did open URL = %{public}@";
      uint64_t v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_2188AF000, v8, v9, v7, (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v6 = [*(id *)(a1 + 32) absoluteString];
    int v10 = 138543362;
    BOOL v11 = v6;
    id v7 = "Unable to open URL = %{public}@";
    uint64_t v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }
}

- (void)_dismissModalViewController:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (self->_modalViewControllerDismissedCompletion)
    {
      id v6 = IAMLogCategoryDefault();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int v10 = 0;
        _os_log_impl(&dword_2188AF000, v6, OS_LOG_TYPE_ERROR, "Web modal dismissed with more than one completion handler.", v10, 2u);
      }
    }
    else
    {
      id v7 = (void *)MEMORY[0x21D475810](v4);
      id modalViewControllerDismissedCompletion = self->_modalViewControllerDismissedCompletion;
      self->_id modalViewControllerDismissedCompletion = v7;
    }
  }
  os_log_type_t v9 = [(IAMWebMessagePresentationCoordinator *)self presentingViewController];
  [v9 dismissViewControllerAnimated:1 completion:0];
}

- (void)webMessageControllerWebViewDidRequestClose:(id)a3
{
}

- (void)webMessageControllerWebViewDidReportEvent:(id)a3 event:(id)a4
{
  id v8 = a4;
  v5 = [(IAMWebMessagePresentationCoordinator *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(IAMWebMessagePresentationCoordinator *)self delegate];
    [v7 webMessagePresentationCoordinatorWebMessageDidReportEvent:self event:v8];
  }
}

- (void)webMessageControllerWebViewDidRequestOpenURL:(id)a3 url:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(IAMWebMessagePresentationCoordinator *)self presentingViewController];

  if (v11
    && v10
    && ([v10 objectForKey:*MEMORY[0x263F4B5D0]],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 BOOLValue],
        v12,
        v13))
  {
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __97__IAMWebMessagePresentationCoordinator_webMessageControllerWebViewDidRequestOpenURL_url_options___block_invoke;
    v14[3] = &unk_264341C80;
    objc_copyWeak(&v16, &location);
    id v15 = v9;
    [(IAMWebMessagePresentationCoordinator *)self _dismissModalViewController:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    [(IAMWebMessagePresentationCoordinator *)self _handleOpenURL:v9];
  }
}

void __97__IAMWebMessagePresentationCoordinator_webMessageControllerWebViewDidRequestOpenURL_url_options___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleOpenURL:*(void *)(a1 + 32)];
}

- (void)webMessageControllerWebViewDidRequestAction:(id)a3 actionConfiguration:(id)a4 options:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(IAMWebMessagePresentationCoordinator *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  BOOL v11 = [(IAMWebMessagePresentationCoordinator *)self presentingViewController];
  uint64_t v12 = v11;
  if (v8 && v11)
  {
    int v13 = [v8 objectForKey:*MEMORY[0x263F4B5D8]];
    int v14 = [v13 BOOLValue];

    if (v14)
    {
      if (v10)
      {
        objc_initWeak(&location, self);
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __112__IAMWebMessagePresentationCoordinator_webMessageControllerWebViewDidRequestAction_actionConfiguration_options___block_invoke;
        v16[3] = &unk_264341C80;
        objc_copyWeak(&v18, &location);
        id v17 = v7;
        id v15 = (void *)MEMORY[0x21D475810](v16);

        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
      else
      {
        id v15 = 0;
      }
      [(IAMWebMessagePresentationCoordinator *)self _dismissModalViewController:v15];
      goto LABEL_11;
    }
  }
  else
  {
  }
  if (v10)
  {
    id v15 = [(IAMWebMessagePresentationCoordinator *)self delegate];
    [v15 webMessagePresentationCoordinatorWebMessageDidRequestAction:self actionConfiguration:v7];
LABEL_11:
  }
}

void __112__IAMWebMessagePresentationCoordinator_webMessageControllerWebViewDidRequestAction_actionConfiguration_options___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained delegate];
  [v2 webMessagePresentationCoordinatorWebMessageDidRequestAction:WeakRetained actionConfiguration:*(void *)(a1 + 32)];
}

- (void)viewController:(id)a3 didReportDismissalAction:(int64_t)a4
{
  char v6 = [(IAMWebMessagePresentationCoordinator *)self webMessageEntry];
  id v7 = [v6 applicationMessage];
  uint64_t v8 = [v7 contentPagesCount];

  if (!v8) {
    return;
  }
  id v9 = [(IAMWebMessagePresentationCoordinator *)self webMessageEntry];
  char v10 = [v9 applicationMessage];
  id v17 = [v10 contentPagesAtIndex:0];

  if (a4 == 1)
  {
    if ([v17 hasCardClickEvent])
    {
      uint64_t v12 = [v17 cardClickEvent];
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  BOOL v11 = 0;
  if (!a4)
  {
    if ([v17 hasCloseClickEvent])
    {
      uint64_t v12 = [v17 closeClickEvent];
LABEL_9:
      int v13 = v12;
      BOOL v11 = [v12 reportableDictionary];

      if (v11)
      {
        int v14 = [(IAMWebMessagePresentationCoordinator *)self delegate];
        char v15 = objc_opt_respondsToSelector();

        if (v15)
        {
          id v16 = [(IAMWebMessagePresentationCoordinator *)self delegate];
          [v16 webMessagePresentationCoordinatorWebMessageDidReportEvent:self event:v11];
        }
      }
      goto LABEL_13;
    }
LABEL_12:
    BOOL v11 = 0;
  }
LABEL_13:
}

- (IAMWebMessagePresentationCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IAMWebMessagePresentationCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isPresenting
{
  return self->_isPresenting;
}

- (void)setIsPresenting:(BOOL)a3
{
  self->_isPresenting = a3;
}

- (IAMWebMessageController)webMessageController
{
  return self->_webMessageController;
}

- (void)setWebMessageController:(id)a3
{
}

- (ICInAppMessageEntry)webMessageEntry
{
  return self->_webMessageEntry;
}

- (void)setWebMessageEntry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webMessageEntry, 0);
  objc_storeStrong((id *)&self->_webMessageController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_modalViewControllerDismissedCompletion, 0);

  objc_storeStrong((id *)&self->_webArchiveURL, 0);
}

@end