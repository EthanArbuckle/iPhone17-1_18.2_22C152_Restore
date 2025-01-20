@interface LARatchetManager
+ (id)optionsForRatchetArmOptions:(id)a3;
+ (id)ratchetErrorForError:(id)a3;
+ (id)ratchetResultForResult:(id)a3;
+ (id)sharedInstance;
+ (int64_t)_optionForRatchetOption:(int64_t)a3;
- (BOOL)isFeatureAvailable;
- (BOOL)isFeatureEnabled;
- (BOOL)isFeatureStrictModeEnabled;
- (BOOL)isFeatureSupported;
- (BOOL)isSensorTrusted;
- (LARatchetManager)init;
- (LARatchetState)ratchetState;
- (id)createContext;
- (void)addObserver:(id)a3;
- (void)cancelArmRequestWithIdentifier:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)cancelCurrentRatchetWithReason:(id)a3 completion:(id)a4;
- (void)checkCanEnableFeatureWithCompletion:(id)a3;
- (void)currentRatchetWithCompletion:(id)a3;
- (void)disableFeatureStrictModeWithContext:(id)a3 completion:(id)a4;
- (void)disableFeatureWithContext:(id)a3 completion:(id)a4;
- (void)enableFeatureActivatingGracePeriodWithReply:(id)a3;
- (void)enableFeatureStrictModeWithCompletion:(id)a3;
- (void)enableFeatureWithCompletion:(id)a3;
- (void)enableFeatureWithReply:(id)a3;
- (void)performArmRequestWithIdentifier:(id)a3 context:(id)a4 options:(id)a5 completion:(id)a6;
- (void)removeObserver:(id)a3;
- (void)reset;
- (void)stateInContext:(id)a3 completion:(id)a4;
- (void)stateWithCompletion:(id)a3;
@end

@implementation LARatchetManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

uint64_t __34__LARatchetManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(LARatchetManager);

  return MEMORY[0x1F41817F8]();
}

- (LARatchetManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)LARatchetManager;
  v2 = [(LARatchetManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F72F40]) initWithContextProvider:v2];
    coreManager = v2->_coreManager;
    v2->_coreManager = (LACDTORatchetManager *)v3;
  }
  return v2;
}

- (BOOL)isFeatureEnabled
{
  return [(LACDTORatchetManager *)self->_coreManager isFeatureEnabled];
}

- (BOOL)isFeatureSupported
{
  return [(LACDTORatchetManager *)self->_coreManager isFeatureSupported];
}

- (BOOL)isFeatureAvailable
{
  return [(LACDTORatchetManager *)self->_coreManager isFeatureAvailable];
}

- (BOOL)isFeatureStrictModeEnabled
{
  return [(LACDTORatchetManager *)self->_coreManager isFeatureStrictModeEnabled];
}

- (BOOL)isSensorTrusted
{
  return [(LACDTORatchetManager *)self->_coreManager isSensorTrusted];
}

- (LARatchetState)ratchetState
{
  v2 = [(LACDTORatchetManager *)self->_coreManager ratchetState];
  uint64_t v3 = [[LARatchetState alloc] initWithState:v2];

  return v3;
}

- (void)stateWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__LARatchetManager_stateWithCompletion___block_invoke;
  v7[3] = &unk_1E63C3DE8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  v7[4] = self;
  id v8 = v6;
  [(LACDTORatchetManager *)coreManager stateWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __40__LARatchetManager_stateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v5)
    {
      id v8 = [(id)objc_opt_class() ratchetErrorForError:v5];
      (*(void (**)(uint64_t, void, LARatchetState *))(v7 + 16))(v7, 0, v8);
    }
    else
    {
      id v8 = [[LARatchetState alloc] initWithState:v9];
      (*(void (**)(uint64_t, LARatchetState *, void))(v7 + 16))(v7, v8, 0);
    }
  }
}

- (void)checkCanEnableFeatureWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__LARatchetManager_checkCanEnableFeatureWithCompletion___block_invoke;
  v7[3] = &unk_1E63C3E10;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  v7[4] = self;
  id v8 = v6;
  [(LACDTORatchetManager *)coreManager checkCanEnableFeatureWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __56__LARatchetManager_checkCanEnableFeatureWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v5)
    {
      id v8 = [(id)objc_opt_class() ratchetErrorForError:v5];
      (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v9, v8);
    }
    else
    {
      (*(void (**)(void, id, void))(v7 + 16))(*(void *)(a1 + 40), v9, 0);
    }
  }
}

- (void)enableFeatureWithReply:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__LARatchetManager_enableFeatureWithReply___block_invoke;
  v7[3] = &unk_1E63C3E10;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  v7[4] = self;
  id v8 = v6;
  [(LACDTORatchetManager *)coreManager enableFeatureWithReply:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __43__LARatchetManager_enableFeatureWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v5)
    {
      id v8 = [(id)objc_opt_class() ratchetErrorForError:v5];
      (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v9, v8);
    }
    else
    {
      (*(void (**)(void, id, void))(v7 + 16))(*(void *)(a1 + 40), v9, 0);
    }
  }
}

- (void)enableFeatureActivatingGracePeriodWithReply:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__LARatchetManager_enableFeatureActivatingGracePeriodWithReply___block_invoke;
  v7[3] = &unk_1E63C3E10;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  v7[4] = self;
  id v8 = v6;
  [(LACDTORatchetManager *)coreManager enableFeatureActivatingGracePeriodWithReply:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __64__LARatchetManager_enableFeatureActivatingGracePeriodWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v5)
    {
      id v8 = [(id)objc_opt_class() ratchetErrorForError:v5];
      (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v9, v8);
    }
    else
    {
      (*(void (**)(void, id, void))(v7 + 16))(*(void *)(a1 + 40), v9, 0);
    }
  }
}

- (void)disableFeatureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__LARatchetManager_disableFeatureWithContext_completion___block_invoke;
  v10[3] = &unk_1E63C3E38;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [(LACDTORatchetManager *)coreManager disableFeatureWithContext:v6 completion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __57__LARatchetManager_disableFeatureWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)enableFeatureStrictModeWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__LARatchetManager_enableFeatureStrictModeWithCompletion___block_invoke;
  v7[3] = &unk_1E63C3E60;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  v7[4] = self;
  id v8 = v6;
  [(LACDTORatchetManager *)coreManager enableFeatureStrictModeWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __58__LARatchetManager_enableFeatureStrictModeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [(id)objc_opt_class() ratchetErrorForError:v6];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

- (void)disableFeatureStrictModeWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__LARatchetManager_disableFeatureStrictModeWithContext_completion___block_invoke;
  v10[3] = &unk_1E63C3E60;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  void v10[4] = self;
  id v11 = v9;
  [(LACDTORatchetManager *)coreManager disableFeatureStrictModeWithContext:v6 completion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __67__LARatchetManager_disableFeatureStrictModeWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [(id)objc_opt_class() ratchetErrorForError:v6];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [[LARatchetObserverWrapper alloc] initWithObserver:v4];
  objc_setAssociatedObject(v4, &LARatchetManagerObserverAssociatedObjectKey, v5, (void *)1);

  [(LACDTORatchetManager *)self->_coreManager addObserver:v5];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [[LARatchetObserverWrapper alloc] initWithObserver:v4];
  [(LACDTORatchetManager *)self->_coreManager removeObserver:v5];
  objc_setAssociatedObject(v4, &LARatchetManagerObserverAssociatedObjectKey, 0, (void *)1);
}

- (void)reset
{
}

- (void)performArmRequestWithIdentifier:(id)a3 context:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  v15 = [(id)objc_opt_class() optionsForRatchetArmOptions:v12];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__LARatchetManager_performArmRequestWithIdentifier_context_options_completion___block_invoke;
  v17[3] = &unk_1E63C3E10;
  objc_copyWeak(&v19, &location);
  id v16 = v13;
  v17[4] = self;
  id v18 = v16;
  [(LACDTORatchetManager *)coreManager performArmRequestWithIdentifier:v10 context:v11 options:v15 completion:v17];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __79__LARatchetManager_performArmRequestWithIdentifier_context_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = objc_opt_class();
    if (v5)
    {
      id v9 = [v8 ratchetErrorForError:v5];
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v9);
    }
    else
    {
      id v9 = [v8 ratchetResultForResult:v10];
      (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v9, 0);
    }
  }
}

- (void)stateInContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__LARatchetManager_stateInContext_completion___block_invoke;
  v10[3] = &unk_1E63C3DE8;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  void v10[4] = self;
  id v11 = v9;
  [(LACDTORatchetManager *)coreManager stateInContext:v6 completion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __46__LARatchetManager_stateInContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v5)
    {
      id v8 = [(id)objc_opt_class() ratchetErrorForError:v5];
      (*(void (**)(uint64_t, void, LARatchetState *))(v7 + 16))(v7, 0, v8);
    }
    else
    {
      id v8 = [[LARatchetState alloc] initWithState:v9];
      (*(void (**)(uint64_t, LARatchetState *, void))(v7 + 16))(v7, v8, 0);
    }
  }
}

- (void)cancelArmRequestWithIdentifier:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__LARatchetManager_cancelArmRequestWithIdentifier_reason_completion___block_invoke;
  v13[3] = &unk_1E63C3E38;
  objc_copyWeak(&v15, &location);
  id v12 = v10;
  id v14 = v12;
  [(LACDTORatchetManager *)coreManager cancelArmRequestWithIdentifier:v8 reason:v9 completion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __69__LARatchetManager_cancelArmRequestWithIdentifier_reason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (id)ratchetResultForResult:(id)a3
{
  v21[4] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = a3;
    id v4 = [LARatchetState alloc];
    id v5 = [NSNumber numberWithInteger:*MEMORY[0x1E4F72F28]];
    id v6 = [v3 objectForKeyedSubscript:v5];
    uint64_t v7 = [(LARatchetState *)v4 initWithState:v6];

    v20[0] = &unk_1F19EC640;
    id v8 = [NSNumber numberWithInteger:*MEMORY[0x1E4F72F10]];
    id v9 = [v3 objectForKeyedSubscript:v8];
    v21[0] = v9;
    v21[1] = v7;
    v20[1] = &unk_1F19EC658;
    v20[2] = &unk_1F19EC670;
    id v10 = [NSNumber numberWithInteger:*MEMORY[0x1E4F72F18]];
    uint64_t v11 = [v3 objectForKeyedSubscript:v10];
    id v12 = (void *)v11;
    id v13 = (void *)MEMORY[0x1E4F1CC28];
    if (v11) {
      uint64_t v14 = v11;
    }
    else {
      uint64_t v14 = MEMORY[0x1E4F1CC28];
    }
    v21[2] = v14;
    v20[3] = &unk_1F19EC688;
    id v15 = [NSNumber numberWithInteger:*MEMORY[0x1E4F72F20]];
    id v16 = [v3 objectForKeyedSubscript:v15];

    if (v16) {
      v17 = v16;
    }
    else {
      v17 = v13;
    }
    v21[3] = v17;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

+ (id)ratchetErrorForError:(id)a3
{
  if (a3)
  {
    id v4 = +[LARatchetErrorBuilder ratchetErrorWithError:](LARatchetErrorBuilder, "ratchetErrorWithError:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)optionsForRatchetArmOptions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = objc_msgSend(v3, "allKeys", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend((id)objc_opt_class(), "_optionForRatchetOption:", objc_msgSend(v10, "integerValue"));
          if (v11 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v12 = v11;
            id v13 = [v3 objectForKeyedSubscript:v10];
            uint64_t v14 = [NSNumber numberWithInteger:v12];
            [v4 setObject:v13 forKeyedSubscript:v14];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (int64_t)_optionForRatchetOption:(int64_t)a3
{
  int64_t result = 0x7FFFFFFFFFFFFFFFLL;
  switch(a3)
  {
    case 0:
      id v4 = (int64_t *)MEMORY[0x1E4F72EA8];
      goto LABEL_20;
    case 1:
      id v4 = (int64_t *)MEMORY[0x1E4F72E98];
      goto LABEL_20;
    case 2:
      id v4 = (int64_t *)MEMORY[0x1E4F72EA0];
      goto LABEL_20;
    case 4:
      id v4 = (int64_t *)MEMORY[0x1E4F72EE8];
      goto LABEL_20;
    case 5:
      id v4 = (int64_t *)MEMORY[0x1E4F72F08];
      goto LABEL_20;
    case 7:
      id v4 = (int64_t *)MEMORY[0x1E4F72F00];
      goto LABEL_20;
    case 8:
      id v4 = (int64_t *)MEMORY[0x1E4F72EB8];
      goto LABEL_20;
    case 9:
      id v4 = (int64_t *)MEMORY[0x1E4F72EB0];
      goto LABEL_20;
    case 10:
      id v4 = (int64_t *)MEMORY[0x1E4F72EC0];
      goto LABEL_20;
    case 11:
      id v4 = (int64_t *)MEMORY[0x1E4F72ED8];
      goto LABEL_20;
    case 12:
      id v4 = (int64_t *)MEMORY[0x1E4F72EF0];
      goto LABEL_20;
    case 13:
      id v4 = (int64_t *)MEMORY[0x1E4F72ED0];
      goto LABEL_20;
    case 14:
      id v4 = (int64_t *)MEMORY[0x1E4F72EE0];
      goto LABEL_20;
    case 15:
      id v4 = (int64_t *)MEMORY[0x1E4F72E80];
      goto LABEL_20;
    case 16:
      id v4 = (int64_t *)MEMORY[0x1E4F72E88];
      goto LABEL_20;
    case 17:
      id v4 = (int64_t *)MEMORY[0x1E4F72EF8];
      goto LABEL_20;
    case 18:
      id v4 = (int64_t *)MEMORY[0x1E4F72E90];
      goto LABEL_20;
    case 19:
      id v4 = (int64_t *)MEMORY[0x1E4F72EC8];
LABEL_20:
      int64_t result = *v4;
      break;
    default:
      return result;
  }
  return result;
}

- (void)enableFeatureWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__LARatchetManager_enableFeatureWithCompletion___block_invoke;
  v6[3] = &unk_1E63C3E88;
  id v7 = v4;
  id v5 = v4;
  [(LARatchetManager *)self enableFeatureWithReply:v6];
}

uint64_t __48__LARatchetManager_enableFeatureWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)currentRatchetWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[LARatchetErrorBuilder genericErrorWithDebugDescription:@"This method has been deprecated"];
  (*((void (**)(id, void, id))a3 + 2))(v4, 0, v5);
}

- (void)cancelCurrentRatchetWithReason:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = +[LARatchetErrorBuilder genericErrorWithDebugDescription:@"This method has been deprecated"];
  (*((void (**)(id, id))a4 + 2))(v5, v6);
}

- (id)createContext
{
  v2 = objc_alloc_init(LAContext);

  return v2;
}

- (void).cxx_destruct
{
}

@end