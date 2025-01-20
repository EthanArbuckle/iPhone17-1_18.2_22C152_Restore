@interface IAMModalTarget
+ (BOOL)isAnyModalTargetPresentingMessage;
+ (void)initialize;
- (IAMModalTarget)initWithMessageCoordinator:(id)a3 targetIdentifier:(id)a4;
- (IAMPresentingModalMessageContext)presentingMessageContext;
- (NSDictionary)messageGroupsByGroupIdentifier;
- (NSString)targetIdentifier;
- (id)_applicationViewControllerForModalPresentation;
- (void)_handlePresentation:(id)a3;
- (void)_handlePresentingMessageContextDidExpireBeforePresentation;
- (void)_presentMessage:(id)a3 messageEntry:(id)a4 fromViewController:(id)a5 withCompletion:(id)a6;
- (void)_presentWebModalMessageEntry:(id)a3 withCompletion:(id)a4;
- (void)_reportMessageDidAppearWithIdentifier:(id)a3;
- (void)_reportMessageDidDisappearWithIdentifier:(id)a3;
- (void)dealloc;
- (void)messageCoordinator:(id)a3 didUpdatePriorityMessage:(id)a4 forTarget:(id)a5;
- (void)messageCoordinator:(id)a3 didUpdatePriorityMessage:(id)a4 fromMessageEntry:(id)a5 forTarget:(id)a6 withCompletion:(id)a7;
- (void)messageGroup:(id)a3 didReportModalMessagePresentationFailedWithIdentifier:(id)a4;
- (void)messageGroup:(id)a3 didReportModalMessageWasDismissedWithIdentifier:(id)a4;
- (void)messageGroup:(id)a3 didReportModalMessageWasPresentedWithIdentifier:(id)a4;
- (void)messageGroup:(id)a3 didReportModalMessageWithIdentifier:(id)a4 actionWasPerformedWithIdentifier:(id)a5;
- (void)presentationControllerDismissalTransitionDidEnd:(id)a3;
- (void)setMessageGroupsByGroupIdentifier:(id)a3;
- (void)setPresentingMessageContext:(id)a3;
- (void)webMessagePresentationCoordinatorWebMessageDidFail:(id)a3;
- (void)webMessagePresentationCoordinatorWebMessageDidFinishPresentation:(id)a3;
- (void)webMessagePresentationCoordinatorWebMessageDidLoad:(id)a3;
- (void)webMessagePresentationCoordinatorWebMessageDidReportEvent:(id)a3 event:(id)a4;
- (void)webMessagePresentationCoordinatorWebMessageDidRequestAction:(id)a3 actionConfiguration:(id)a4;
@end

@implementation IAMModalTarget

- (IAMModalTarget)initWithMessageCoordinator:(id)a3 targetIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IAMModalTarget;
  v8 = [(IAMModalTarget *)&v11 init];
  if (v8)
  {
    [(id)_allModalTargets addObject:v8];
    objc_storeWeak((id *)&v8->_messageCoordinator, v6);
    objc_storeStrong((id *)&v8->_targetIdentifier, a4);
    messageGroupsByGroupIdentifier = v8->_messageGroupsByGroupIdentifier;
    v8->_messageGroupsByGroupIdentifier = (NSDictionary *)MEMORY[0x263EFFA78];
  }
  return v8;
}

- (NSString)targetIdentifier
{
  return self->_targetIdentifier;
}

- (void)setMessageGroupsByGroupIdentifier:(id)a3
{
}

- (void)messageCoordinator:(id)a3 didUpdatePriorityMessage:(id)a4 fromMessageEntry:(id)a5 forTarget:(id)a6 withCompletion:(id)a7
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13 && v14)
  {
    if (+[IAMModalTarget isAnyModalTargetPresentingMessage])
    {
      v17 = IAMLogCategoryDefault();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [v13 identifier];
        *(_DWORD *)buf = 138543362;
        v29 = v18;
        _os_log_impl(&dword_2188AF000, v17, OS_LOG_TYPE_DEFAULT, "Unable to display modal message = %{public}@. Another modal message is already being displayed.", buf, 0xCu);
      }
      goto LABEL_7;
    }
    v19 = [v12 applicationContext];
    if (v19)
    {
      if (objc_opt_respondsToSelector() & 1) == 0 || ([v19 allowsModalMessageDisplay])
      {
        v20 = [(IAMModalTarget *)self _applicationViewControllerForModalPresentation];
        if (v20)
        {
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __104__IAMModalTarget_messageCoordinator_didUpdatePriorityMessage_fromMessageEntry_forTarget_withCompletion___block_invoke;
          v26[3] = &unk_264342060;
          id v27 = v16;
          [(IAMModalTarget *)self _presentMessage:v13 messageEntry:v14 fromViewController:v20 withCompletion:v26];
        }
        else
        {
          v24 = IAMLogCategoryDefault();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v25 = [v13 identifier];
            *(_DWORD *)buf = 138543362;
            v29 = v25;
            _os_log_impl(&dword_2188AF000, v24, OS_LOG_TYPE_DEFAULT, "Unable to display modal message = %{public}@. Application context did not provide a view controller from which to present.", buf, 0xCu);
          }
          (*((void (**)(id, void))v16 + 2))(v16, 0);
        }

        goto LABEL_23;
      }
      v21 = IAMLogCategoryDefault();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = [v13 identifier];
        *(_DWORD *)buf = 138543362;
        v29 = v22;
        v23 = "Unable to display modal message = %{public}@. Host app has denied modal presentation.";
        goto LABEL_21;
      }
    }
    else
    {
      v21 = IAMLogCategoryDefault();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = [v13 identifier];
        *(_DWORD *)buf = 138543362;
        v29 = v22;
        v23 = "Unable to display modal message = %{public}@. No application context provided to message coordinator.";
LABEL_21:
        _os_log_impl(&dword_2188AF000, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
      }
    }

    (*((void (**)(id, void))v16 + 2))(v16, 0);
LABEL_23:

    goto LABEL_24;
  }
LABEL_7:
  (*((void (**)(id, void))v16 + 2))(v16, 0);
LABEL_24:
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _allModalTargets = objc_opt_new();
    MEMORY[0x270F9A758]();
  }
}

- (void)dealloc
{
  [(id)_allModalTargets removeObject:self];
  v3.receiver = self;
  v3.super_class = (Class)IAMModalTarget;
  [(IAMModalTarget *)&v3 dealloc];
}

uint64_t __104__IAMModalTarget_messageCoordinator_didUpdatePriorityMessage_fromMessageEntry_forTarget_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)messageCoordinator:(id)a3 didUpdatePriorityMessage:(id)a4 forTarget:(id)a5
{
}

- (void)webMessagePresentationCoordinatorWebMessageDidLoad:(id)a3
{
  id v4 = a3;
  v5 = [(IAMModalTarget *)self presentingMessageContext];
  if (v5)
  {
    if ([v4 present])
    {
      id v6 = [v5 message];
      id v7 = [v6 identifier];
      [(IAMModalTarget *)self _reportMessageDidAppearWithIdentifier:v7];
    }
    else
    {
      [(IAMWebMessagePresentationCoordinator *)self->_webMessagePresentationCoordinator setDelegate:0];
      webMessagePresentationCoordinator = self->_webMessagePresentationCoordinator;
      self->_webMessagePresentationCoordinator = 0;

      [(IAMModalTarget *)self setPresentingMessageContext:0];
    }
  }
  else
  {
    v8 = IAMLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_2188AF000, v8, OS_LOG_TYPE_ERROR, "Unable to present web modal message, no presenting message context.", v10, 2u);
    }
  }
}

- (void)webMessagePresentationCoordinatorWebMessageDidFail:(id)a3
{
  [(IAMWebMessagePresentationCoordinator *)self->_webMessagePresentationCoordinator setDelegate:0];
  webMessagePresentationCoordinator = self->_webMessagePresentationCoordinator;
  self->_webMessagePresentationCoordinator = 0;

  [(IAMModalTarget *)self setPresentingMessageContext:0];
}

- (void)webMessagePresentationCoordinatorWebMessageDidFinishPresentation:(id)a3
{
  [(IAMWebMessagePresentationCoordinator *)self->_webMessagePresentationCoordinator setDelegate:0];
  webMessagePresentationCoordinator = self->_webMessagePresentationCoordinator;
  self->_webMessagePresentationCoordinator = 0;

  v5 = [(IAMModalTarget *)self presentingMessageContext];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 message];
    v8 = [v7 identifier];
    [(IAMModalTarget *)self _reportMessageDidDisappearWithIdentifier:v8];
  }
  else
  {
    id v7 = IAMLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2188AF000, v7, OS_LOG_TYPE_ERROR, "Unable to report web modal message disappearance, no presenting message context.", v9, 2u);
    }
  }

  [(IAMModalTarget *)self setPresentingMessageContext:0];
}

- (void)webMessagePresentationCoordinatorWebMessageDidReportEvent:(id)a3 event:(id)a4
{
  p_messageCoordinator = &self->_messageCoordinator;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_messageCoordinator);
  [WeakRetained reportMetricsEvent:v5];
}

- (void)webMessagePresentationCoordinatorWebMessageDidRequestAction:(id)a3 actionConfiguration:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = IAMLogCategoryDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v5;
    _os_log_impl(&dword_2188AF000, v6, OS_LOG_TYPE_DEFAULT, "Web modal message requested action = %{public}@", (uint8_t *)&v11, 0xCu);
  }

  p_messageCoordinator = &self->_messageCoordinator;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageCoordinator);
  v9 = [WeakRetained applicationContext];

  if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v10 = objc_loadWeakRetained((id *)p_messageCoordinator);
    [v9 messageCoordinator:v10 didRequestAction:v5];
  }
}

- (void)messageGroup:(id)a3 didReportModalMessageWithIdentifier:(id)a4 actionWasPerformedWithIdentifier:(id)a5
{
  p_messageCoordinator = &self->_messageCoordinator;
  id v8 = a5;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_messageCoordinator);
  [WeakRetained reportMessageWithIdentifier:v9 actionWasPerformedWithIdentifier:v8 fromTargetWithIdentifier:self->_targetIdentifier];
}

- (void)messageGroup:(id)a3 didReportModalMessagePresentationFailedWithIdentifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = IAMLogCategoryDefault();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v9 = [v6 groupIdentifier];
    int v10 = 138543618;
    int v11 = v9;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl(&dword_2188AF000, v8, OS_LOG_TYPE_ERROR, "Message group with identifier = %{public}@ reported failure to present modal message with identifier = %{public}@.", (uint8_t *)&v10, 0x16u);
  }
  [(IAMModalTarget *)self setPresentingMessageContext:0];
}

- (void)messageGroup:(id)a3 didReportModalMessageWasPresentedWithIdentifier:(id)a4
{
}

- (void)messageGroup:(id)a3 didReportModalMessageWasDismissedWithIdentifier:(id)a4
{
  [(IAMModalTarget *)self _reportMessageDidDisappearWithIdentifier:a4];

  [(IAMModalTarget *)self setPresentingMessageContext:0];
}

- (void)setPresentingMessageContext:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = (IAMPresentingModalMessageContext *)a3;
  p_presentingMessageContext = &self->_presentingMessageContext;
  presentingMessageContext = self->_presentingMessageContext;
  if (presentingMessageContext != v5)
  {
    if (presentingMessageContext)
    {
      id v8 = [(IAMPresentingModalMessageContext *)presentingMessageContext messageGroup];
      id v9 = v8;
      if (v8) {
        [v8 setInternalDelegate:0];
      }
      int v10 = [(IAMPresentingModalMessageContext *)*p_presentingMessageContext presentationExpirationTimer];
      int v11 = v10;
      if (v10) {
        [v10 invalidate];
      }
      __int16 v12 = IAMLogCategoryDefault();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [(IAMPresentingModalMessageContext *)*p_presentingMessageContext message];
        uint64_t v14 = [v13 identifier];
        int v20 = 138543362;
        v21 = v14;
        _os_log_impl(&dword_2188AF000, v12, OS_LOG_TYPE_DEFAULT, "Finishing presentation of message with identifier = %{public}@.", (uint8_t *)&v20, 0xCu);
      }
    }
    if (v5)
    {
      id v15 = [(IAMPresentingModalMessageContext *)v5 messageGroup];
      id v16 = v15;
      if (v15) {
        [v15 setInternalDelegate:self];
      }
      v17 = IAMLogCategoryDefault();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [(IAMPresentingModalMessageContext *)v5 message];
        v19 = [v18 identifier];
        int v20 = 138543362;
        v21 = v19;
        _os_log_impl(&dword_2188AF000, v17, OS_LOG_TYPE_DEFAULT, "Starting presentation of message with identifier = %{public}@.", (uint8_t *)&v20, 0xCu);
      }
    }
    objc_storeStrong((id *)p_presentingMessageContext, a3);
  }
}

- (void)_reportMessageDidAppearWithIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = IAMLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_2188AF000, v5, OS_LOG_TYPE_DEFAULT, "Modal message appeared with identifier = %{public}@.", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageCoordinator);
  [WeakRetained reportMessageDidAppearWithIdentifier:v4 fromTargetWithIdentifier:self->_targetIdentifier];
}

- (void)_reportMessageDidDisappearWithIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = IAMLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_2188AF000, v5, OS_LOG_TYPE_DEFAULT, "Modal message disappeared with identifier = %{public}@.", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageCoordinator);
  [WeakRetained reportMessageDidDisappearWithIdentifier:v4 fromTargetWithIdentifier:self->_targetIdentifier];
}

- (void)_presentMessage:(id)a3 messageEntry:(id)a4 fromViewController:(id)a5 withCompletion:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v11 applicationMessage];
  int v15 = [v14 hasWebArchiveURL];

  if (v15)
  {
    id v16 = [[IAMPresentingModalMessageContext alloc] initWithMessage:v10 messageGroup:0 presentingViewController:v12 presentationExpirationTimer:0 presentationHandler:0];
    [(IAMModalTarget *)self setPresentingMessageContext:v16];

    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __81__IAMModalTarget__presentMessage_messageEntry_fromViewController_withCompletion___block_invoke;
    v32[3] = &unk_264342060;
    id v33 = v13;
    [(IAMModalTarget *)self _presentWebModalMessageEntry:v11 withCompletion:v32];
    v17 = v33;
  }
  else
  {
    v17 = [v10 messageGroupIdentifier];
    v18 = [(NSDictionary *)self->_messageGroupsByGroupIdentifier objectForKeyedSubscript:v17];
    v19 = v18;
    if (v18)
    {
      if ([v18 shouldPerformModalMessagePresentation])
      {
        int v20 = [[IAMPresentingModalMessageContext alloc] initWithMessage:v10 messageGroup:v19 presentingViewController:v12 presentationExpirationTimer:0 presentationHandler:0];
        [(IAMModalTarget *)self setPresentingMessageContext:v20];

        [v19 performModalMessagePresentation:v10 fromViewController:v12];
        (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
      }
      else
      {
        objc_initWeak((id *)buf, self);
        v23 = (void *)MEMORY[0x263EFFA20];
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __81__IAMModalTarget__presentMessage_messageEntry_fromViewController_withCompletion___block_invoke_12;
        v30[3] = &unk_2643420B0;
        objc_copyWeak(&v31, (id *)buf);
        id v27 = [v23 scheduledTimerWithTimeInterval:0 repeats:v30 block:5.0];
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __81__IAMModalTarget__presentMessage_messageEntry_fromViewController_withCompletion___block_invoke_3;
        v28[3] = &unk_2643420D8;
        objc_copyWeak(&v29, (id *)buf);
        v24 = (void *)MEMORY[0x21D475810](v28);
        v25 = [[IAMPresentingModalMessageContext alloc] initWithMessage:v10 messageGroup:v19 presentingViewController:v12 presentationExpirationTimer:v27 presentationHandler:v24];
        [(IAMModalTarget *)self setPresentingMessageContext:v25];

        v26 = [(IAMPresentingModalMessageContext *)self->_presentingMessageContext presentationHandler];
        [v19 viewControllerForModalMessagePresentation:v10 completion:v26];

        (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
        objc_destroyWeak(&v29);

        objc_destroyWeak(&v31);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      v21 = IAMLogCategoryDefault();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = [v10 identifier];
        *(_DWORD *)buf = 138543618;
        v35 = v22;
        __int16 v36 = 2114;
        v37 = v17;
        _os_log_impl(&dword_2188AF000, v21, OS_LOG_TYPE_DEFAULT, "Unable to display modal message = %{public}@. No message group for identifier = %{public}@.", buf, 0x16u);
      }
      (*((void (**)(id, void))v13 + 2))(v13, 0);
    }
  }
}

uint64_t __81__IAMModalTarget__presentMessage_messageEntry_fromViewController_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __81__IAMModalTarget__presentMessage_messageEntry_fromViewController_withCompletion___block_invoke_12(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__IAMModalTarget__presentMessage_messageEntry_fromViewController_withCompletion___block_invoke_2;
  block[3] = &unk_264342088;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __81__IAMModalTarget__presentMessage_messageEntry_fromViewController_withCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handlePresentingMessageContextDidExpireBeforePresentation];
}

void __81__IAMModalTarget__presentMessage_messageEntry_fromViewController_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __81__IAMModalTarget__presentMessage_messageEntry_fromViewController_withCompletion___block_invoke_4;
  v5[3] = &unk_264341C80;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __81__IAMModalTarget__presentMessage_messageEntry_fromViewController_withCompletion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handlePresentation:*(void *)(a1 + 32)];
}

- (id)_applicationViewControllerForModalPresentation
{
  p_messageCoordinator = &self->_messageCoordinator;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageCoordinator);
  id v4 = [WeakRetained applicationContext];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_messageCoordinator);
    id v7 = [v6 applicationContext];
    id v8 = [v7 viewControllerForModalPresentation];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)_presentWebModalMessageEntry:(id)a3 withCompletion:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = [v6 applicationMessage];
  uint64_t v9 = [v6 cachedLocationForResourceWithIdentifier:*MEMORY[0x263F88F30]];
  if (v9) {
    goto LABEL_6;
  }
  id v10 = IAMLogCategoryDefault();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = [v8 identifier];
    int v23 = 138543362;
    v24 = v11;
    _os_log_impl(&dword_2188AF000, v10, OS_LOG_TYPE_ERROR, "Unable to display message: %{public}@ webarchive from cache. Attempting to find webarchive in host bundle", (uint8_t *)&v23, 0xCu);
  }
  id v12 = [v8 webArchiveURL];
  id v13 = [v12 lastPathComponent];
  uint64_t v9 = [v13 stringByDeletingPathExtension];

  uint64_t v14 = [MEMORY[0x263F086E0] mainBundle];
  int v15 = [v14 URLForResource:v9 withExtension:@"webarchive"];
  id v16 = [v15 URLByStandardizingPath];

  if (v16)
  {
    uint64_t v17 = [v16 absoluteString];

    uint64_t v9 = (void *)v17;
LABEL_6:
    v18 = [NSURL fileURLWithPath:v9];
    v19 = [[IAMWebMessagePresentationCoordinator alloc] initWithWebMessageEntry:v6 webArchiveURL:v18];
    webMessagePresentationCoordinator = self->_webMessagePresentationCoordinator;
    self->_webMessagePresentationCoordinator = v19;

    [(IAMWebMessagePresentationCoordinator *)self->_webMessagePresentationCoordinator setDelegate:self];
    [(IAMWebMessagePresentationCoordinator *)self->_webMessagePresentationCoordinator load];
    v7[2](v7, 1);

    goto LABEL_7;
  }
  [(IAMModalTarget *)self setPresentingMessageContext:0];
  v21 = IAMLogCategoryDefault();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    uint64_t v22 = [v8 identifier];
    int v23 = 138543618;
    v24 = v22;
    __int16 v25 = 2114;
    v26 = v9;
    _os_log_impl(&dword_2188AF000, v21, OS_LOG_TYPE_ERROR, "Unable to display message = %{public}@ and webarchive = %{public}@ No local webarchive in bundle.", (uint8_t *)&v23, 0x16u);
  }
  v7[2](v7, 0);
LABEL_7:
}

- (void)_handlePresentingMessageContextDidExpireBeforePresentation
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = [(IAMModalTarget *)self presentingMessageContext];
  id v4 = v3;
  if (v3)
  {
    char v5 = [v3 message];
    id v6 = IAMLogCategoryDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [v5 identifier];
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_2188AF000, v6, OS_LOG_TYPE_ERROR, "Couldn't present modal message with identifier = %{public}@, view controller to present not provided before context expired.", (uint8_t *)&v8, 0xCu);
    }
  }
  [(IAMModalTarget *)self setPresentingMessageContext:0];
}

- (void)_handlePresentation:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(IAMModalTarget *)self presentingMessageContext];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 presentationExpirationTimer];
    [v7 invalidate];

    int v8 = [v6 presentingViewController];
    uint64_t v9 = [v6 message];
    if (v4)
    {
      if (v8)
      {
        [v8 presentViewController:v4 animated:1 completion:0];
        uint64_t v10 = [v9 identifier];
        [(IAMModalTarget *)self _reportMessageDidAppearWithIdentifier:v10];

        id v11 = [MEMORY[0x263F08A00] defaultCenter];
        [v11 addObserver:self selector:sel_presentationControllerDismissalTransitionDidEnd_ name:*MEMORY[0x263F1D560] object:v4];

LABEL_13:
        goto LABEL_14;
      }
      id v12 = IAMLogCategoryDefault();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [v9 identifier];
        int v15 = 138543362;
        id v16 = v13;
        uint64_t v14 = "Couldn't present modal message with identifier = %{public}@, presenting view controller has been deallocated.";
        goto LABEL_11;
      }
    }
    else
    {
      id v12 = IAMLogCategoryDefault();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [v9 identifier];
        int v15 = 138543362;
        id v16 = v13;
        uint64_t v14 = "Couldn't present modal message with identifier = %{public}@, no view controller to present.";
LABEL_11:
        _os_log_impl(&dword_2188AF000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v15, 0xCu);
      }
    }

    [(IAMModalTarget *)self setPresentingMessageContext:0];
    goto LABEL_13;
  }
  int v8 = IAMLogCategoryDefault();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_2188AF000, v8, OS_LOG_TYPE_ERROR, "Couldn't present modal message, no presenting message context.", (uint8_t *)&v15, 2u);
  }
LABEL_14:
}

- (void)presentationControllerDismissalTransitionDidEnd:(id)a3
{
  id v4 = a3;
  char v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F1D558]];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    int v8 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v9 = *MEMORY[0x263F1D560];
    uint64_t v10 = [v4 object];
    [v8 removeObserver:self name:v9 object:v10];

    id v11 = [(IAMModalTarget *)self presentingMessageContext];
    id v12 = v11;
    if (v11)
    {
      id v13 = [v11 message];
      uint64_t v14 = [v13 identifier];
      [(IAMModalTarget *)self _reportMessageDidDisappearWithIdentifier:v14];

      [(IAMModalTarget *)self setPresentingMessageContext:0];
    }
    else
    {
      int v15 = IAMLogCategoryDefault();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v16 = 0;
        _os_log_impl(&dword_2188AF000, v15, OS_LOG_TYPE_ERROR, "Unable to report modal message disappearance, no presenting message context.", v16, 2u);
      }
    }
  }
}

+ (BOOL)isAnyModalTargetPresentingMessage
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = (id)_allModalTargets;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (*(void *)(*(void *)(*((void *)&v7 + 1) + 8 * i) + 24))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (IAMPresentingModalMessageContext)presentingMessageContext
{
  return self->_presentingMessageContext;
}

- (NSDictionary)messageGroupsByGroupIdentifier
{
  return self->_messageGroupsByGroupIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageGroupsByGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_targetIdentifier, 0);
  objc_storeStrong((id *)&self->_presentingMessageContext, 0);
  objc_storeStrong((id *)&self->_webMessagePresentationCoordinator, 0);

  objc_destroyWeak((id *)&self->_messageCoordinator);
}

@end