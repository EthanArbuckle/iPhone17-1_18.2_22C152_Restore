@interface SKCloudServiceController
+ (SKCloudServiceAuthorizationStatus)authorizationStatus;
+ (id)_publicErrorForPrivateError:(id)a3;
+ (void)requestAuthorization:(void *)completionHandler;
- (BOOL)_allowsPromptingForPrivacyAcknowledgement;
- (SKCloudServiceController)init;
- (id)_cloudServiceStatusMonitorWithError:(id *)a3;
- (void)_handleCapabilitiesDidChangeNotification:(id)a3;
- (void)_handleStorefrontCountryCodeDidChangeNotification:(id)a3;
- (void)_handleStorefrontIdentifierDidChangeNotification:(id)a3;
- (void)_setAllowsPromptingForPrivacyAcknowledgement:(BOOL)a3;
- (void)dealloc;
- (void)init;
- (void)requestCapabilitiesWithCompletionHandler:(void *)completionHandler;
- (void)requestStorefrontCountryCodeWithCompletionHandler:(void *)completionHandler;
- (void)requestStorefrontIdentifierWithCompletionHandler:(void *)completionHandler;
- (void)requestUserTokenForDeveloperToken:(NSString *)developerToken completionHandler:(void *)completionHandler;
@end

@implementation SKCloudServiceController

- (SKCloudServiceController)init
{
  v8.receiver = self;
  v8.super_class = (Class)SKCloudServiceController;
  v2 = [(SKCloudServiceController *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_allowsPromptingForPrivacyAcknowledgement = 1;
    id v7 = 0;
    v4 = [(SKCloudServiceController *)v2 _cloudServiceStatusMonitorWithError:&v7];
    id v5 = v7;
    if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(SKCloudServiceController *)(uint64_t)v3 init];
    }
  }
  return v3;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (self->_cloudServiceStatusMonitor)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v5 = getICCloudServiceStatusCapabilitiesDidChangeNotification();
    [v4 removeObserver:self name:v5 object:self->_cloudServiceStatusMonitor];

    v6 = getICCloudServiceStatusStorefrontCountryCodeDidChangeNotification();
    [v4 removeObserver:self name:v6 object:self->_cloudServiceStatusMonitor];

    id v7 = getICCloudServiceStatusStorefrontIdentifierDidChangeNotification();
    [v4 removeObserver:self name:v7 object:self->_cloudServiceStatusMonitor];

    [(ICCloudServiceStatusMonitor *)self->_cloudServiceStatusMonitor endObservingCloudServiceStatus];
  }
  os_unfair_lock_unlock(p_lock);
  v8.receiver = self;
  v8.super_class = (Class)SKCloudServiceController;
  [(SKCloudServiceController *)&v8 dealloc];
}

+ (SKCloudServiceAuthorizationStatus)authorizationStatus
{
  return +[SKPrivacyController authorizationStatus];
}

+ (void)requestAuthorization:(void *)completionHandler
{
  id v3 = completionHandler;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__SKCloudServiceController_requestAuthorization___block_invoke;
  v5[3] = &unk_1E5FAAE88;
  id v6 = v3;
  id v4 = v3;
  +[SKPrivacyController requestAuthorization:v5];
}

void __49__SKCloudServiceController_requestAuthorization___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = MEMORY[0x1E4F143A8];
    id v5 = __49__SKCloudServiceController_requestAuthorization___block_invoke_2;
    id v6 = &unk_1E5FAAE60;
    id v7 = v2;
    uint64_t v8 = a2;
    if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v4, 3221225472)) {
      v5((uint64_t)&v4);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], &v4);
    }
  }
}

uint64_t __49__SKCloudServiceController_requestAuthorization___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)requestCapabilitiesWithCompletionHandler:(void *)completionHandler
{
  uint64_t v4 = completionHandler;
  id v15 = 0;
  id v5 = [(SKCloudServiceController *)self _cloudServiceStatusMonitorWithError:&v15];
  id v6 = v15;
  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__SKCloudServiceController_requestCapabilitiesWithCompletionHandler___block_invoke_2;
    v8[3] = &unk_1E5FAAED8;
    id v7 = &v9;
    id v9 = v4;
    [v5 requestCapabilitiesWithCompletionHandler:v8];
LABEL_8:

    goto LABEL_9;
  }
  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    v11 = __69__SKCloudServiceController_requestCapabilitiesWithCompletionHandler___block_invoke;
    v12 = &unk_1E5FA9BB8;
    id v7 = &v14;
    id v14 = v4;
    id v13 = v6;
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v11((uint64_t)block);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], block);
    }

    goto LABEL_8;
  }
LABEL_9:
}

uint64_t __69__SKCloudServiceController_requestCapabilitiesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __69__SKCloudServiceController_requestCapabilitiesWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (*(void *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    uint64_t v8 = __69__SKCloudServiceController_requestCapabilitiesWithCompletionHandler___block_invoke_3;
    id v9 = &unk_1E5FAAEB0;
    id v10 = v5;
    uint64_t v12 = a2;
    id v11 = *(id *)(a1 + 32);
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v8((uint64_t)block);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __69__SKCloudServiceController_requestCapabilitiesWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    +[SKCloudServiceController _publicErrorForPrivateError:](SKCloudServiceController, "_publicErrorForPrivateError:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
}

- (void)requestStorefrontCountryCodeWithCompletionHandler:(void *)completionHandler
{
  uint64_t v4 = completionHandler;
  id v15 = 0;
  id v5 = [(SKCloudServiceController *)self _cloudServiceStatusMonitorWithError:&v15];
  id v6 = v15;
  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __78__SKCloudServiceController_requestStorefrontCountryCodeWithCompletionHandler___block_invoke_2;
    v8[3] = &unk_1E5FAAF28;
    id v7 = &v9;
    id v9 = v4;
    [v5 requestStorefrontCountryCodeWithCompletionHandler:v8];
LABEL_8:

    goto LABEL_9;
  }
  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    id v11 = __78__SKCloudServiceController_requestStorefrontCountryCodeWithCompletionHandler___block_invoke;
    uint64_t v12 = &unk_1E5FA9BB8;
    id v7 = &v14;
    id v14 = v4;
    id v13 = v6;
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v11((uint64_t)block);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], block);
    }

    goto LABEL_8;
  }
LABEL_9:
}

uint64_t __78__SKCloudServiceController_requestStorefrontCountryCodeWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __78__SKCloudServiceController_requestStorefrontCountryCodeWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (*(void *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    id v9 = __78__SKCloudServiceController_requestStorefrontCountryCodeWithCompletionHandler___block_invoke_3;
    id v10 = &unk_1E5FAAF00;
    id v11 = v6;
    id v13 = *(id *)(a1 + 32);
    id v12 = v5;
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v9((uint64_t)block);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __78__SKCloudServiceController_requestStorefrontCountryCodeWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    +[SKCloudServiceController _publicErrorForPrivateError:](SKCloudServiceController, "_publicErrorForPrivateError:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
}

- (void)requestStorefrontIdentifierWithCompletionHandler:(void *)completionHandler
{
  uint64_t v4 = completionHandler;
  id v15 = 0;
  id v5 = [(SKCloudServiceController *)self _cloudServiceStatusMonitorWithError:&v15];
  id v6 = v15;
  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __77__SKCloudServiceController_requestStorefrontIdentifierWithCompletionHandler___block_invoke_2;
    v8[3] = &unk_1E5FAAF28;
    id v7 = &v9;
    id v9 = v4;
    [v5 requestStorefrontIdentifierWithCompletionHandler:v8];
LABEL_8:

    goto LABEL_9;
  }
  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    id v11 = __77__SKCloudServiceController_requestStorefrontIdentifierWithCompletionHandler___block_invoke;
    id v12 = &unk_1E5FA9BB8;
    id v7 = &v14;
    id v14 = v4;
    id v13 = v6;
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v11((uint64_t)block);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], block);
    }

    goto LABEL_8;
  }
LABEL_9:
}

uint64_t __77__SKCloudServiceController_requestStorefrontIdentifierWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __77__SKCloudServiceController_requestStorefrontIdentifierWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (*(void *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    id v9 = __77__SKCloudServiceController_requestStorefrontIdentifierWithCompletionHandler___block_invoke_3;
    id v10 = &unk_1E5FAAF00;
    id v11 = v6;
    id v13 = *(id *)(a1 + 32);
    id v12 = v5;
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v9((uint64_t)block);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __77__SKCloudServiceController_requestStorefrontIdentifierWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    +[SKCloudServiceController _publicErrorForPrivateError:](SKCloudServiceController, "_publicErrorForPrivateError:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
}

- (void)requestUserTokenForDeveloperToken:(NSString *)developerToken completionHandler:(void *)completionHandler
{
  id v6 = developerToken;
  id v7 = completionHandler;
  id v18 = 0;
  uint64_t v8 = [(SKCloudServiceController *)self _cloudServiceStatusMonitorWithError:&v18];
  id v9 = v18;
  if (v8)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __80__SKCloudServiceController_requestUserTokenForDeveloperToken_completionHandler___block_invoke_2;
    v11[3] = &unk_1E5FAAF28;
    id v10 = &v12;
    id v12 = v7;
    [v8 requestUserTokenForDeveloperToken:v6 options:1 completionHandler:v11];
LABEL_8:

    goto LABEL_9;
  }
  if (v7)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    id v14 = __80__SKCloudServiceController_requestUserTokenForDeveloperToken_completionHandler___block_invoke;
    id v15 = &unk_1E5FA9BB8;
    id v10 = &v17;
    id v17 = v7;
    id v16 = v9;
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v14((uint64_t)block);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], block);
    }

    goto LABEL_8;
  }
LABEL_9:
}

uint64_t __80__SKCloudServiceController_requestUserTokenForDeveloperToken_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __80__SKCloudServiceController_requestUserTokenForDeveloperToken_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    uint64_t v8 = __80__SKCloudServiceController_requestUserTokenForDeveloperToken_completionHandler___block_invoke_3;
    id v9 = &unk_1E5FAAF00;
    id v10 = v5;
    id v12 = *(id *)(a1 + 32);
    id v11 = v6;
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v8((uint64_t)block);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __80__SKCloudServiceController_requestUserTokenForDeveloperToken_completionHandler___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) length])
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
  else
  {
    id v3 = +[SKCloudServiceController _publicErrorForPrivateError:*(void *)(a1 + 40)];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (BOOL)_allowsPromptingForPrivacyAcknowledgement
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  LOBYTE(v2) = v2->_allowsPromptingForPrivacyAcknowledgement;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_setAllowsPromptingForPrivacyAcknowledgement:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  self->_allowsPromptingForPrivacyAcknowledgement = v3;
  cloudServiceStatusMonitor = self->_cloudServiceStatusMonitor;
  if (cloudServiceStatusMonitor) {
    [(ICCloudServiceStatusMonitor *)cloudServiceStatusMonitor setPrivacyAcknowledgementPolicy:v3];
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)_handleCapabilitiesDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  uint64_t v4 = __69__SKCloudServiceController__handleCapabilitiesDidChangeNotification___block_invoke;
  id v5 = &unk_1E5FA9A08;
  id v6 = self;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3)) {
    v4((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __69__SKCloudServiceController__handleCapabilitiesDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v4 = 138543618;
    uint64_t v5 = v2;
    __int16 v6 = 2114;
    id v7 = @"SKCloudServiceCapabilitiesDidChangeNotification";
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Posting %{public}@.", (uint8_t *)&v4, 0x16u);
  }
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"SKCloudServiceCapabilitiesDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)_handleStorefrontCountryCodeDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  int v4 = __78__SKCloudServiceController__handleStorefrontCountryCodeDidChangeNotification___block_invoke;
  uint64_t v5 = &unk_1E5FA9A08;
  __int16 v6 = self;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3)) {
    v4((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __78__SKCloudServiceController__handleStorefrontCountryCodeDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v4 = 138543618;
    uint64_t v5 = v2;
    __int16 v6 = 2114;
    id v7 = @"SKStorefrontCountryCodeDidChangeNotification";
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Posting %{public}@.", (uint8_t *)&v4, 0x16u);
  }
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"SKStorefrontCountryCodeDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)_handleStorefrontIdentifierDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  int v4 = __77__SKCloudServiceController__handleStorefrontIdentifierDidChangeNotification___block_invoke;
  uint64_t v5 = &unk_1E5FA9A08;
  __int16 v6 = self;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3)) {
    v4((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __77__SKCloudServiceController__handleStorefrontIdentifierDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v4 = 138543618;
    uint64_t v5 = v2;
    __int16 v6 = 2114;
    id v7 = @"SKStorefrontIdentifierDidChangeNotification";
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Posting %{public}@.", (uint8_t *)&v4, 0x16u);
  }
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"SKStorefrontIdentifierDidChangeNotification" object:*(void *)(a1 + 32)];
}

+ (id)_publicErrorForPrivateError:(id)a3
{
  id v3 = a3;
  int v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v3 domain];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  __int16 v6 = (void *)getICErrorDomainSymbolLoc_ptr;
  uint64_t v25 = getICErrorDomainSymbolLoc_ptr;
  if (!getICErrorDomainSymbolLoc_ptr)
  {
    id v7 = (void *)iTunesCloudLibrary();
    v23[3] = (uint64_t)dlsym(v7, "ICErrorDomain");
    getICErrorDomainSymbolLoc_ptr = v23[3];
    __int16 v6 = (void *)v23[3];
  }
  _Block_object_dispose(&v22, 8);
  if (!v6)
  {
    v21 = (_Unwind_Exception *)-[SKAccountPageSpecifierProvider _appleAccount]();
    _Block_object_dispose(&v22, 8);
    _Unwind_Resume(v21);
  }
  int v8 = [v5 isEqualToString:*v6];

  if (!v8) {
    goto LABEL_17;
  }
  uint64_t v9 = [v3 code];
  if (v9 <= -7101)
  {
    switch(v9)
    {
      case -8100:
        uint64_t v13 = 0;
        uint64_t v11 = 0;
        uint64_t v12 = 8;
        goto LABEL_18;
      case -7401:
        uint64_t v13 = 0;
        goto LABEL_32;
      case -7101:
        id v14 = [v3 userInfo];
        uint64_t v13 = [v14 objectForKey:*MEMORY[0x1E4F28228]];

LABEL_32:
        uint64_t v11 = 0;
        uint64_t v12 = 1;
        goto LABEL_18;
    }
LABEL_17:
    uint64_t v11 = [v4 localizedStringForKey:@"UNKNOWN_ERROR" value:&stru_1F08A7B80 table:0];
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    goto LABEL_18;
  }
  if (v9 > -7010)
  {
    if (v9 != -7009)
    {
      if (v9 == -7007)
      {
        uint64_t v11 = [v4 localizedStringForKey:@"PRIVACY_ACKNOWLEDGEMENT_REQUIRED" value:&stru_1F08A7B80 table:0];
        uint64_t v13 = 0;
        uint64_t v12 = 9;
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    uint64_t v11 = [v4 localizedStringForKey:@"PERMISSION_DENIED" value:&stru_1F08A7B80 table:0];
    v20 = [v3 userInfo];
    uint64_t v13 = [v20 objectForKey:*MEMORY[0x1E4F28228]];

    uint64_t v12 = 6;
  }
  else
  {
    if (v9 != -7100)
    {
      if (v9 == -7011)
      {
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v11 = 0;
        uint64_t v12 = 1;
        uint64_t v13 = @"Failed to send message to remote cloud service status monitor.";
LABEL_24:
        [v10 setObject:v13 forKey:*MEMORY[0x1E4F28228]];
        id v16 = (void *)v13;
        goto LABEL_25;
      }
      goto LABEL_17;
    }
    uint64_t v11 = [v4 localizedStringForKey:@"NETWORK_FAILED" value:&stru_1F08A7B80 table:0];
    uint64_t v13 = 0;
    uint64_t v12 = 7;
  }
LABEL_18:
  if (!(v11 | v13))
  {
    uint64_t v11 = 0;
    id v16 = 0;
    id v17 = 0;
    goto LABEL_26;
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v10 = v15;
  if (v11)
  {
    [v15 setObject:v11 forKey:*MEMORY[0x1E4F28568]];
    if (v13) {
      goto LABEL_24;
    }
    id v16 = 0;
  }
  else
  {
    id v16 = 0;
    if (v13) {
      goto LABEL_24;
    }
  }
LABEL_25:
  id v17 = (void *)[v10 copy];

LABEL_26:
  id v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SKErrorDomain" code:v12 userInfo:v17];

  return v18;
}

- (id)_cloudServiceStatusMonitorWithError:(id *)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  if (+[SKCloudServiceController authorizationStatus] != SKCloudServiceAuthorizationStatusAuthorized)
  {
    id v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v18 = [v17 localizedStringForKey:@"PERMISSION_DENIED" value:&stru_1F08A7B80 table:0];
    v19 = (void *)v18;
    if (v18)
    {
      uint64_t v27 = *MEMORY[0x1E4F28568];
      v28[0] = v18;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    }
    else
    {
      v20 = 0;
    }
    id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SKErrorDomain" code:6 userInfo:v20];

    id v15 = 0;
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  os_unfair_lock_lock(p_lock);
  cloudServiceStatusMonitor = self->_cloudServiceStatusMonitor;
  if (!cloudServiceStatusMonitor)
  {
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2050000000;
    id v7 = (void *)getICCloudServiceStatusMonitorClass_softClass_0;
    uint64_t v26 = getICCloudServiceStatusMonitorClass_softClass_0;
    if (!getICCloudServiceStatusMonitorClass_softClass_0)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __getICCloudServiceStatusMonitorClass_block_invoke_0;
      v22[3] = &unk_1E5FA9A30;
      v22[4] = &v23;
      __getICCloudServiceStatusMonitorClass_block_invoke_0((uint64_t)v22);
      id v7 = (void *)v24[3];
    }
    int v8 = v7;
    _Block_object_dispose(&v23, 8);
    uint64_t v9 = (ICCloudServiceStatusMonitor *)objc_alloc_init(v8);
    id v10 = self->_cloudServiceStatusMonitor;
    self->_cloudServiceStatusMonitor = v9;

    if (!self->_allowsPromptingForPrivacyAcknowledgement) {
      [(ICCloudServiceStatusMonitor *)self->_cloudServiceStatusMonitor setPrivacyAcknowledgementPolicy:0];
    }
    [(ICCloudServiceStatusMonitor *)self->_cloudServiceStatusMonitor beginObservingCloudServiceStatus];
    uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v12 = getICCloudServiceStatusCapabilitiesDidChangeNotification();
    [v11 addObserver:self selector:sel__handleCapabilitiesDidChangeNotification_ name:v12 object:self->_cloudServiceStatusMonitor];

    uint64_t v13 = getICCloudServiceStatusStorefrontCountryCodeDidChangeNotification();
    [v11 addObserver:self selector:sel__handleStorefrontCountryCodeDidChangeNotification_ name:v13 object:self->_cloudServiceStatusMonitor];

    id v14 = getICCloudServiceStatusStorefrontIdentifierDidChangeNotification();
    [v11 addObserver:self selector:sel__handleStorefrontIdentifierDidChangeNotification_ name:v14 object:self->_cloudServiceStatusMonitor];

    cloudServiceStatusMonitor = self->_cloudServiceStatusMonitor;
  }
  id v15 = cloudServiceStatusMonitor;
  os_unfair_lock_unlock(p_lock);
  id v16 = 0;
  if (a3) {
LABEL_14:
  }
    *a3 = v16;
LABEL_15:

  return v15;
}

- (void).cxx_destruct
{
}

- (void)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138543618;
  uint64_t v3 = a1;
  __int16 v4 = 2114;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Cannot setup cloud service status monitor upon initialization. Encountered error: %{public}@.", (uint8_t *)&v2, 0x16u);
}

@end