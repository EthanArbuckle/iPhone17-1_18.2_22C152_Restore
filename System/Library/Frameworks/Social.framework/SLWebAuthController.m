@interface SLWebAuthController
- (NSString)_extentionIdentifier;
- (SLWebAuthController)init;
- (SLWebAuthController)initWithAccount:(id)a3 accountStore:(id)a4 presentationBlock:(id)a5;
- (SLWebAuthController)initWithAccountDescription:(id)a3 presentationBlock:(id)a4;
- (SLWebAuthController)initWithNibName:(id)a3 bundle:(id)a4;
- (SLWebClient)_webClient;
- (id)_extensionItemForAccount:(id)a3 accountDescription:(id)a4 username:(id)a5 youTube:(BOOL)a6;
- (id)_init;
- (id)completion;
- (void)_commonInitializationWithAccount:(id)a3 accountStore:(id)a4 username:(id)a5 accountDescription:(id)a6 youTube:(BOOL)a7 presentationBlock:(id)a8;
- (void)_didInstantiateRemoteViewController;
- (void)_dismissAndCompleteWithIdentity:(id)a3 error:(id)a4 extensionCompletion:(id)a5;
- (void)_extensionRequestDidCancelWithError:(id)a3;
- (void)_extensionRequestDidCompleteWithTokens:(id)a3 extensionCompletion:(id)a4;
- (void)_presentInternetOfflineError;
- (void)_presentUsernameMismatchAlert;
- (void)loadView;
- (void)setCompletion:(id)a3;
@end

@implementation SLWebAuthController

- (SLWebAuthController)initWithAccountDescription:(id)a3 presentationBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SLWebAuthController;
  v8 = [(SLWebAuthController *)&v11 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8) {
    [(SLWebAuthController *)v8 _commonInitializationWithAccount:0 accountStore:0 username:0 accountDescription:v6 youTube:0 presentationBlock:v7];
  }

  return v9;
}

- (SLWebAuthController)initWithAccount:(id)a3 accountStore:(id)a4 presentationBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SLWebAuthController;
  objc_super v11 = [(SLWebAuthController *)&v14 initWithNibName:0 bundle:0];
  if (v11)
  {
    v12 = [v8 accountDescription];
    [(SLWebAuthController *)v11 _commonInitializationWithAccount:v8 accountStore:v9 username:0 accountDescription:v12 youTube:0 presentationBlock:v10];
  }
  return v11;
}

- (SLWebAuthController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SLWebAuthController;
  v4 = [(SLWebAuthController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(SLWebAuthController *)v4 _commonInitializationWithAccount:0 accountStore:0 username:0 accountDescription:0 youTube:0 presentationBlock:0];
  }
  return v5;
}

- (SLWebAuthController)init
{
  return 0;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)SLWebAuthController;
  return [(SLWebAuthController *)&v3 initWithNibName:0 bundle:0];
}

- (id)_extensionItemForAccount:(id)a3 accountDescription:(id)a4 username:(id)a5 youTube:(BOOL)a6
{
  BOOL v7 = a6;
  id v11 = a5;
  id v12 = a4;
  _SLLog(v6, 5, @"SLWebAuthController initializing for description %@ username %@");
  id v13 = objc_alloc_init(MEMORY[0x1E4F28C80]);
  objc_super v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObject:forKey:", v12, @"description", v12, v11);

  if (a3) {
    [v14 setObject:v11 forKeyedSubscript:@"username"];
  }
  if (v7) {
    [v14 setObject:@"YES" forKeyedSubscript:@"youTube"];
  }
  v15 = (void *)MEMORY[0x1E4F28DB0];
  v16 = [(SLWebAuthController *)self _webClient];
  id v21 = 0;
  v17 = [v15 archivedDataWithRootObject:v16 requiringSecureCoding:1 error:&v21];
  id v18 = v21;
  [v14 setObject:v17 forKeyedSubscript:@"webClient"];

  if (v18)
  {
    id v20 = v18;
    _SLLog(v6, 3, @"Error while archiving we client, error: %@");
  }
  objc_msgSend(v13, "setUserInfo:", v14, v20);

  return v13;
}

- (void)_commonInitializationWithAccount:(id)a3 accountStore:(id)a4 username:(id)a5 accountDescription:(id)a6 youTube:(BOOL)a7 presentationBlock:(id)a8
{
  BOOL v33 = a7;
  v41[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v31 = a4;
  id v16 = a5;
  v17 = (__CFString *)a6;
  id v18 = a8;
  objc_storeStrong((id *)&self->_account, a3);
  objc_storeStrong((id *)&self->_accountStore, a4);
  v19 = (void *)MEMORY[0x1C876A6A0](v18);
  id presentationBlock = self->_presentationBlock;
  self->_id presentationBlock = v19;

  if (!self->_presentationBlock) {
    _SLLog(v8, 3, @"SLWebAuthController Client did not pass a presentationBlock to the init method. Your presentation animation will probably look horrible. Please pass a presentationBlock.");
  }
  [(SLWebAuthController *)self setModalPresentationStyle:0];
  id v21 = (void *)MEMORY[0x1E4F28C70];
  v22 = [(SLWebAuthController *)self _extentionIdentifier];
  id v40 = 0;
  v23 = [v21 extensionWithIdentifier:v22 error:&v40];
  id v32 = v40;
  extension = self->_extension;
  self->_extension = v23;

  v30 = self->_extension;
  _SLLog(v8, 7, @"SLWebAuthController got extension %@");
  objc_initWeak(&location, self);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __123__SLWebAuthController__commonInitializationWithAccount_accountStore_username_accountDescription_youTube_presentationBlock___block_invoke;
  v37[3] = &unk_1E6467680;
  objc_copyWeak(&v38, &location);
  -[NSExtension setRequestCancellationBlock:](self->_extension, "setRequestCancellationBlock:", v37, v30);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __123__SLWebAuthController__commonInitializationWithAccount_accountStore_username_accountDescription_youTube_presentationBlock___block_invoke_3;
  v35[3] = &unk_1E64676D0;
  objc_copyWeak(&v36, &location);
  [(NSExtension *)self->_extension set_requestPostCompletionBlockWithItems:v35];
  if (v15)
  {
    uint64_t v25 = [v15 username];

    uint64_t v26 = [v15 accountDescription];

    v17 = (__CFString *)v26;
    id v16 = (id)v25;
  }
  if (!v17) {
    v17 = &stru_1F1E28690;
  }
  v27 = [(SLWebAuthController *)self _extensionItemForAccount:v15 accountDescription:v17 username:v16 youTube:v33];
  v28 = self->_extension;
  v41[0] = v27;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __123__SLWebAuthController__commonInitializationWithAccount_accountStore_username_accountDescription_youTube_presentationBlock___block_invoke_5;
  v34[3] = &unk_1E64676F8;
  v34[4] = self;
  [(NSExtension *)v28 instantiateViewControllerWithInputItems:v29 listenerEndpoint:0 connectionHandler:v34];

  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
}

void __123__SLWebAuthController__commonInitializationWithAccount_accountStore_username_accountDescription_youTube_presentationBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __123__SLWebAuthController__commonInitializationWithAccount_accountStore_username_accountDescription_youTube_presentationBlock___block_invoke_2;
  block[3] = &unk_1E6467658;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __123__SLWebAuthController__commonInitializationWithAccount_accountStore_username_accountDescription_youTube_presentationBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    _SLLog(v1, 7, @"SLWebAuthController extension requestCancellationBlock requestIdentifier %@ error %{public}@");
    objc_msgSend(WeakRetained, "_extensionRequestDidCancelWithError:", *(void *)(a1 + 40), v3, v4);
  }
}

void __123__SLWebAuthController__commonInitializationWithAccount_accountStore_username_accountDescription_youTube_presentationBlock___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __123__SLWebAuthController__commonInitializationWithAccount_accountStore_username_accountDescription_youTube_presentationBlock___block_invoke_4;
  v13[3] = &unk_1E64676A8;
  objc_copyWeak(&v17, (id *)(a1 + 32));
  id v14 = v7;
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v13);

  objc_destroyWeak(&v17);
}

void __123__SLWebAuthController__commonInitializationWithAccount_accountStore_username_accountDescription_youTube_presentationBlock___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    _SLLog(v1, 7, @"SLWebAuthController extension _requestPostCompletionBlockWithItems requestIdentifier %@ items %@");
    objc_msgSend(WeakRetained, "_extensionRequestDidCompleteWithTokens:extensionCompletion:", *(void *)(a1 + 40), *(void *)(a1 + 48), v3, v4);
  }
}

void __123__SLWebAuthController__commonInitializationWithAccount_accountStore_username_accountDescription_youTube_presentationBlock___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v10 = a3;
  _SLLog(v4, 5, @"SLWebAuthController finished instantiate remote view controller %@ error %{public}@ extension request identifier %@");
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 1000);
  *(void *)(v8 + 1000) = v10;
  id v11 = v10;

  objc_msgSend(*(id *)(a1 + 32), "_didInstantiateRemoteViewController", v10, a4, a2);
}

- (void)_didInstantiateRemoteViewController
{
  v27[1] = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __58__SLWebAuthController__didInstantiateRemoteViewController__block_invoke;
    v21[3] = &unk_1E6467720;
    objc_copyWeak(&v22, &location);
    [(UIViewController *)self->_serviceViewController setViewServiceTerminationBlock:v21];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  serviceViewController = self->_serviceViewController;
  if (serviceViewController && !self->_extensionCancellationError)
  {
    [(UIViewController *)serviceViewController willMoveToParentViewController:self];
    [(SLWebAuthController *)self addChildViewController:self->_serviceViewController];
    uint64_t v4 = [(SLWebAuthController *)self view];
    id v5 = [(UIViewController *)self->_serviceViewController view];
    [v4 addSubview:v5];

    id v6 = [(SLWebAuthController *)self view];
    id v7 = [(UIViewController *)self->_serviceViewController view];
    [v6 bringSubviewToFront:v7];

    [(UIViewController *)self->_serviceViewController didMoveToParentViewController:self];
    uint64_t v8 = [(UIViewController *)self->_serviceViewController view];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v10 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v26 = @"serviceView";
    id v11 = [(UIViewController *)self->_serviceViewController view];
    v27[0] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    id v13 = [v10 constraintsWithVisualFormat:@"H:|[serviceView]|" options:0 metrics:0 views:v12];
    [v9 addObjectsFromArray:v13];

    id v14 = (void *)MEMORY[0x1E4F28DC8];
    v24 = @"serviceView";
    id v15 = [(UIViewController *)self->_serviceViewController view];
    uint64_t v25 = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v17 = [v14 constraintsWithVisualFormat:@"V:|[serviceView]|" options:0 metrics:0 views:v16];
    [v9 addObjectsFromArray:v17];

    [MEMORY[0x1E4F28DC8] activateConstraints:v9];
    id v18 = [(SLWebAuthController *)self view];
    [v18 setNeedsLayout];

    id presentationBlock = (void (**)(id, SLWebAuthController *))self->_presentationBlock;
    if (presentationBlock) {
      presentationBlock[2](presentationBlock, self);
    }
  }
  id v20 = self->_presentationBlock;
  self->_id presentationBlock = 0;
}

void __58__SLWebAuthController__didInstantiateRemoteViewController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !WeakRetained[1024])
  {
    id v3 = WeakRetained;
    _SLLog(v1, 3, @"SLWebAuthController observed unexpected extension termination. Probably a crash.");
    [v3 _extensionRequestDidCompleteWithTokens:0 extensionCompletion:0];
    id WeakRetained = v3;
  }
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)SLWebAuthController;
  [(SLWebAuthController *)&v6 loadView];
  id v3 = [(SLWebAuthController *)self view];
  [v3 setOpaque:0];

  uint64_t v4 = [MEMORY[0x1E4F428B8] clearColor];
  id v5 = [(SLWebAuthController *)self view];
  [v5 setBackgroundColor:v4];
}

- (void)_extensionRequestDidCancelWithError:(id)a3
{
}

- (void)_extensionRequestDidCompleteWithTokens:(id)a3 extensionCompletion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  self->_extensionRequestDidComplete = 1;
  if (a3)
  {
    uint64_t v8 = [a3 objectAtIndexedSubscript:0];
    id v9 = [v8 attachments];
    id v10 = [v9 objectAtIndexedSubscript:0];

    id v11 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__SLWebAuthController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_2;
    block[3] = &unk_1E64673C0;
    id v14 = v10;
    id v15 = self;
    id v16 = v7;
    id v12 = v10;
    dispatch_async(v11, block);
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __82__SLWebAuthController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke;
    v17[3] = &unk_1E6467460;
    v17[4] = self;
    id v18 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v17);
  }
}

void __82__SLWebAuthController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke(uint64_t a1)
{
  id v3 = *(id *)(*(void *)(a1 + 32) + 1016);
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 1016);
  id v8 = v3;
  if (v4)
  {
    id v5 = [v4 domain];
    if ([v5 isEqualToString:*MEMORY[0x1E4F289A0]])
    {
      uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 1016) code];

      id v3 = v8;
      if (v6 == -1009)
      {
        _SLLog(v1, 3, @"SLWebAuthController will dismiss because not connected to internet.");
        [*(id *)(a1 + 32) _presentInternetOfflineError];

        goto LABEL_9;
      }
    }
    else
    {

      id v3 = v8;
    }
  }
  if (v3)
  {
    id v7 = v3;
    _SLLog(v1, 3, @"SLWebAuthController will dismiss because of error %{public}@");
    goto LABEL_10;
  }
  _SLLog(v1, 5, @"SLWebAuthController will dismiss because of user cancel.");
LABEL_9:
  id v8 = 0;
LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "_dismissAndCompleteWithIdentity:error:extensionCompletion:", 0, v8, *(void *)(a1 + 40), v7);
}

void __82__SLWebAuthController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy_;
  v57 = __Block_byref_object_dispose_;
  id v58 = 0;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *MEMORY[0x1E4F22590];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __82__SLWebAuthController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_73;
  v50[3] = &unk_1E6467748;
  v52 = &v53;
  uint64_t v6 = v3;
  v51 = v6;
  [v4 loadItemForTypeIdentifier:v5 options:0 completionHandler:v50];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy_;
  v48 = __Block_byref_object_dispose_;
  id v49 = [(id)v54[5] objectForKeyedSubscript:@"token"];
  id v7 = [(id)v54[5] objectForKeyedSubscript:@"refreshToken"];
  id v8 = [(id)v54[5] objectForKeyedSubscript:@"usernames"];
  id v9 = [(id)v54[5] objectForKeyedSubscript:@"displayName"];
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy_;
  v42[4] = __Block_byref_object_dispose_;
  id v43 = 0;
  uint64_t v10 = *(void *)(a1 + 40);
  if (*(void *)(v10 + 976))
  {
    if (v45[5])
    {
      if (v7)
      {
        id v11 = [v8 firstObject];

        uint64_t v10 = *(void *)(a1 + 40);
        if (v11)
        {
          id v12 = [*(id *)(v10 + 976) username];
          id v13 = [v8 firstObject];
          uint64_t v14 = [v12 compare:v13 options:1];

          uint64_t v10 = *(void *)(a1 + 40);
          if (v14)
          {
            id v15 = [*(id *)(v10 + 976) username];
            v29 = [v8 firstObject];
            _SLLog(v1, 3, @"SLWebAuthController got mismatch between _account.username %@ and attempted username %@");

            objc_msgSend(*(id *)(a1 + 40), "_presentUsernameMismatchAlert", v15, v29);
            id v16 = (void *)v45[5];
            v45[5] = 0;

            uint64_t v10 = *(void *)(a1 + 40);
          }
        }
      }
    }
  }
  if (*(void *)(v10 + 976))
  {
    if (v45[5])
    {
      if (v7)
      {
        id v17 = [v8 firstObject];

        if (v17)
        {
          id v18 = objc_alloc(MEMORY[0x1E4F179C0]);
          v19 = (void *)[v18 initWithOAuth2Token:v45[5] refreshToken:v7 expiryDate:0];
          [*(id *)(*(void *)(a1 + 40) + 976) setCredential:v19];
          [*(id *)(*(void *)(a1 + 40) + 976) setSupportsAuthentication:1];
          _SLLog(v1, 5, @"SLWebAuthController will save account with new credential");
          uint64_t v20 = *(void *)(a1 + 40);
          id v21 = *(void **)(v20 + 984);
          uint64_t v22 = *(void *)(v20 + 976);
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __82__SLWebAuthController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_2_103;
          v38[3] = &unk_1E6467770;
          id v40 = v42;
          v41 = &v44;
          v23 = v6;
          v39 = v23;
          [v21 saveAccount:v22 withCompletionHandler:v38];
          dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
        }
      }
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__SLWebAuthController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_3;
  block[3] = &unk_1E6467798;
  id v31 = v8;
  id v32 = v9;
  uint64_t v24 = *(void *)(a1 + 40);
  uint64_t v25 = *(void **)(a1 + 48);
  id v33 = v7;
  uint64_t v34 = v24;
  id v36 = &v44;
  v37 = v42;
  id v35 = v25;
  id v26 = v7;
  id v27 = v9;
  id v28 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v53, 8);
}

intptr_t __82__SLWebAuthController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_73(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 7;
  }
  id v6 = a2;
  _SLLog(v3, v5, @"SLWebAuthController did loadItemForTypeIdentifier for response, got error %{public}@");
  id v7 = (void *)MEMORY[0x1E4F28DC0];
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  id v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  uint64_t v12 = [v7 unarchivedObjectOfClasses:v11 fromData:v6 error:0];

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _SLLog(v3, 3, @"SLWebAuthController loadItemForTypeIdentifier did not return a dictionary");
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = 0;
  }
  id v17 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v17);
}

void __82__SLWebAuthController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_2_103(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  uint64_t v9 = [NSNumber numberWithBool:a2];
  _SLLog(v3, 5, @"SLWebAuthController did save account with success %@ error %{public}@");

  if ((a2 & 1) == 0)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __82__SLWebAuthController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) firstObject];

  if (v2)
  {
    uint64_t v3 = [SLWebAuthIdentity alloc];
    uint64_t v4 = [*(id *)(a1 + 32) firstObject];
    uint64_t v5 = [(SLWebAuthIdentity *)v3 initWithUsername:v4 token:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) displayName:*(void *)(a1 + 40) refreshToken:*(void *)(a1 + 48) youTubeUsername:0 idToken:0];
  }
  else
  {
    uint64_t v5 = 0;
  }
  [*(id *)(a1 + 56) _dismissAndCompleteWithIdentity:v5 error:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) extensionCompletion:*(void *)(a1 + 64)];
}

- (void)_dismissAndCompleteWithIdentity:(id)a3 error:(id)a4 extensionCompletion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  _SLLog(v5, 5, @"SLWebAuthController will dismiss");
  uint64_t v12 = [(SLWebAuthController *)self presentingViewController];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__SLWebAuthController__dismissAndCompleteWithIdentity_error_extensionCompletion___block_invoke;
  v16[3] = &unk_1E64677C0;
  id v17 = v10;
  id v18 = v9;
  v19 = self;
  id v20 = v11;
  id v13 = v9;
  id v14 = v10;
  id v15 = v11;
  [v12 dismissViewControllerAnimated:1 completion:v16];
}

void __81__SLWebAuthController__dismissAndCompleteWithIdentity_error_extensionCompletion___block_invoke(uint64_t *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  _SLLog(v1, 5, @"SLWebAuthController did dismiss");
  uint64_t v3 = a1[7];
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  if (a1[4]) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 5;
  }
  _SLLog(v1, v4, @"SLWebAuthController completing with success %d error %{public}@");
  uint64_t v5 = a1[4];
  id v6 = _ACLogSystem();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __81__SLWebAuthController__dismissAndCompleteWithIdentity_error_extensionCompletion___block_invoke_cold_1(a1 + 5, a1 + 4, v7);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = a1[5] != 0;
    *(_DWORD *)buf = 67109120;
    BOOL v13 = v8;
    _os_log_impl(&dword_1C2CB6000, v7, OS_LOG_TYPE_DEFAULT, "\"SLWebAuthController completing with success %d\"", buf, 8u);
  }

  uint64_t v9 = *(void *)(a1[6] + 1032);
  if (v9)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v9, a1[5], a1[4]);
    uint64_t v10 = a1[6];
    id v11 = *(void **)(v10 + 1032);
    *(void *)(v10 + 1032) = 0;
  }
}

- (void)_presentUsernameMismatchAlert
{
  uint64_t v14 = (void *)MEMORY[0x1E4F1CA60];
  id v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v2 = [v15 localizedStringForKey:@"_EMAIL_MISMATCH_TITLE" value:&stru_1F1E28690 table:@"Localizable"];
  uint64_t v13 = *MEMORY[0x1E4F1D990];
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"_EMAIL_MISMATCH_MESSAGE" value:&stru_1F1E28690 table:@"Localizable"];
  uint64_t v5 = *MEMORY[0x1E4F1D9A8];
  id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"_EMAIL_MISMATCH_OK" value:&stru_1F1E28690 table:@"Localizable"];
  uint64_t v8 = *MEMORY[0x1E4F1D9E0];
  uint64_t v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v10 = [v9 resourceURL];
  objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v2, v13, v4, v5, v7, v8, v10, *MEMORY[0x1E4F1DA00], 0);
  CFDictionaryRef v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  CFUserNotificationRef v20 = 0;
  CFUserNotificationRef v20 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 0, 0, v11);
  if (v18[3])
  {
    uint64_t v12 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__SLWebAuthController__presentUsernameMismatchAlert__block_invoke;
    block[3] = &unk_1E64677E8;
    void block[4] = &v17;
    dispatch_async(v12, block);
  }
  _Block_object_dispose(&v17, 8);
}

void __52__SLWebAuthController__presentUsernameMismatchAlert__block_invoke(uint64_t a1)
{
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), 0.0, &responseFlags);
  CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

- (void)_presentInternetOfflineError
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v17[0] = *MEMORY[0x1E4F1D990];
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"SIGN_IN_ERROR_TITLE" value:&stru_1F1E28690 table:@"Localizable"];
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E4F1D9A8];
  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"SIGN_IN_ERROR_MESSAGE_NO_CONNECTION" value:&stru_1F1E28690 table:@"Localizable"];
  v18[1] = v5;
  v17[2] = *MEMORY[0x1E4F1D9E0];
  id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"SIGN_IN_ERROR_OK" value:&stru_1F1E28690 table:@"Localizable"];
  v18[2] = v7;
  v17[3] = *MEMORY[0x1E4F1DA00];
  uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 resourceURL];
  v18[3] = v9;
  CFDictionaryRef v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  CFUserNotificationRef v16 = 0;
  CFUserNotificationRef v16 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 0, 0, v10);
  if (v14[3])
  {
    CFDictionaryRef v11 = dispatch_get_global_queue(25, 0);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__SLWebAuthController__presentInternetOfflineError__block_invoke;
    v12[3] = &unk_1E64677E8;
    v12[4] = &v13;
    dispatch_async(v11, v12);
  }
  _Block_object_dispose(&v13, 8);
}

void __51__SLWebAuthController__presentInternetOfflineError__block_invoke(uint64_t a1)
{
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), 0.0, &responseFlags);
  CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (SLWebClient)_webClient
{
  return self->__webClient;
}

- (NSString)_extentionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1048, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__extentionIdentifier, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_extensionCancellationError, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_serviceViewController, 0);
  objc_storeStrong(&self->_presentationBlock, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

void __81__SLWebAuthController__dismissAndCompleteWithIdentity_error_extensionCompletion___block_invoke_cold_1(void *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = *a1 != 0;
  uint64_t v4 = *a2;
  v5[0] = 67109378;
  v5[1] = v3;
  __int16 v6 = 2114;
  uint64_t v7 = v4;
  _os_log_error_impl(&dword_1C2CB6000, log, OS_LOG_TYPE_ERROR, "\"SLWebAuthController completing with success %d error %{public}@\"", (uint8_t *)v5, 0x12u);
}

@end