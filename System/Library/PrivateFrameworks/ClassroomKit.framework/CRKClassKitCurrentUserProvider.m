@interface CRKClassKitCurrentUserProvider
- (BOOL)currentUserFetched;
- (BOOL)isSafeToTalkToProgressdWithAccountState:(int64_t)a3;
- (CRKCancelable)currentUserSubscription;
- (CRKClassKitCurrentUser)currentUser;
- (CRKClassKitCurrentUserProvider)initWithClassKitFacade:(id)a3;
- (CRKClassKitFacade)classKitFacade;
- (unint64_t)sequenceNumber;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performKVOUpdateForKeyPaths:(id)a3 updateBlock:(id)a4;
- (void)safeFetchCurrentUserWithCompletion:(id)a3;
- (void)setCurrentUser:(id)a3;
- (void)setCurrentUserFetched:(BOOL)a3;
- (void)setCurrentUserSubscription:(id)a3;
- (void)setSequenceNumber:(unint64_t)a3;
- (void)startObservingCurrentUser;
- (void)stopObservingCurrentUser;
- (void)updateCurrentUser;
- (void)updateCurrentUser:(id)a3 fetched:(BOOL)a4;
@end

@implementation CRKClassKitCurrentUserProvider

- (void)dealloc
{
  [(CRKClassKitCurrentUserProvider *)self stopObservingCurrentUser];
  v3.receiver = self;
  v3.super_class = (Class)CRKClassKitCurrentUserProvider;
  [(CRKClassKitCurrentUserProvider *)&v3 dealloc];
}

- (CRKClassKitCurrentUserProvider)initWithClassKitFacade:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKClassKitCurrentUserProvider;
  v6 = [(CRKClassKitCurrentUserProvider *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_classKitFacade, a3);
    [(CRKClassKitCurrentUserProvider *)v7 startObservingCurrentUser];
    [(CRKClassKitCurrentUserProvider *)v7 updateCurrentUser];
  }

  return v7;
}

- (void)startObservingCurrentUser
{
  objc_super v3 = [(CRKClassKitCurrentUserProvider *)self classKitFacade];
  [v3 addObserver:self forKeyPath:@"accountState" options:3 context:@"CRKClassKitCurrentUserProviderObservationContext"];

  objc_initWeak(&location, self);
  v4 = [(CRKClassKitCurrentUserProvider *)self classKitFacade];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  v8 = __59__CRKClassKitCurrentUserProvider_startObservingCurrentUser__block_invoke;
  objc_super v9 = &unk_2646F3D40;
  objc_copyWeak(&v10, &location);
  id v5 = [v4 subscribeToCurrentUserDidChangeEvents:&v6];
  -[CRKClassKitCurrentUserProvider setCurrentUserSubscription:](self, "setCurrentUserSubscription:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __59__CRKClassKitCurrentUserProvider_startObservingCurrentUser__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateCurrentUser];
}

- (void)stopObservingCurrentUser
{
  objc_super v3 = [(CRKClassKitCurrentUserProvider *)self classKitFacade];
  [v3 removeObserver:self forKeyPath:@"accountState" context:@"CRKClassKitCurrentUserProviderObservationContext"];

  v4 = [(CRKClassKitCurrentUserProvider *)self currentUserSubscription];
  [v4 cancel];

  [(CRKClassKitCurrentUserProvider *)self setCurrentUserSubscription:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"CRKClassKitCurrentUserProviderObservationContext")
  {
    id v11 = a5;
    v12 = objc_msgSend(v11, "crk_keyValueObservingOldObject");
    uint64_t v13 = [v12 integerValue];

    v14 = objc_msgSend(v11, "crk_keyValueObservingNewObject");

    uint64_t v15 = [v14 integerValue];
    LODWORD(v14) = [(CRKClassKitCurrentUserProvider *)self isSafeToTalkToProgressdWithAccountState:v13];
    if (v14 != [(CRKClassKitCurrentUserProvider *)self isSafeToTalkToProgressdWithAccountState:v15])
    {
      [(CRKClassKitCurrentUserProvider *)self updateCurrentUser];
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)CRKClassKitCurrentUserProvider;
    id v10 = a5;
    [(CRKClassKitCurrentUserProvider *)&v16 observeValueForKeyPath:a3 ofObject:a4 change:v10 context:a6];
  }
}

- (void)updateCurrentUser
{
  [(CRKClassKitCurrentUserProvider *)self setSequenceNumber:[(CRKClassKitCurrentUserProvider *)self sequenceNumber] + 1];
  objc_super v3 = [(CRKClassKitCurrentUserProvider *)self sequenceNumber];
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__CRKClassKitCurrentUserProvider_updateCurrentUser__block_invoke;
  v4[3] = &unk_2646F58F8;
  objc_copyWeak(v5, &location);
  v5[1] = v3;
  [(CRKClassKitCurrentUserProvider *)self safeFetchCurrentUserWithCompletion:v4];
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __51__CRKClassKitCurrentUserProvider_updateCurrentUser__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained && [WeakRetained sequenceNumber] == *(void *)(a1 + 40))
  {
    if (v6)
    {
      if (_CRKLogASM_onceToken_30 != -1) {
        dispatch_once(&_CRKLogASM_onceToken_30, &__block_literal_global_113);
      }
      objc_super v9 = (void *)_CRKLogASM_logObj_30;
      if (os_log_type_enabled((os_log_t)_CRKLogASM_logObj_30, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = v9;
        id v11 = [v6 verboseDescription];
        int v12 = 138543362;
        uint64_t v13 = v11;
        _os_log_impl(&dword_224C00000, v10, OS_LOG_TYPE_DEFAULT, "Failed to fetch current ClassKit user in current user provider: %{public}@", (uint8_t *)&v12, 0xCu);
      }
    }
    [v8 updateCurrentUser:v5 fetched:1];
  }
}

- (void)updateCurrentUser:(id)a3 fetched:(BOOL)a4
{
  BOOL v4 = a4;
  v16[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(CRKClassKitCurrentUserProvider *)self currentUserFetched] == v4)
  {
    uint64_t v15 = @"currentUser";
    uint64_t v7 = (void *)MEMORY[0x263EFF8C0];
    v8 = &v15;
    uint64_t v9 = 1;
  }
  else
  {
    v16[0] = @"currentUserFetched";
    v16[1] = @"currentUser";
    uint64_t v7 = (void *)MEMORY[0x263EFF8C0];
    v8 = (__CFString **)v16;
    uint64_t v9 = 2;
  }
  id v10 = [v7 arrayWithObjects:v8 count:v9];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__CRKClassKitCurrentUserProvider_updateCurrentUser_fetched___block_invoke;
  v12[3] = &unk_2646F5920;
  v12[4] = self;
  id v13 = v6;
  BOOL v14 = v4;
  id v11 = v6;
  [(CRKClassKitCurrentUserProvider *)self performKVOUpdateForKeyPaths:v10 updateBlock:v12];
}

void __60__CRKClassKitCurrentUserProvider_updateCurrentUser_fetched___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = *(unsigned char *)(a1 + 48);
}

- (void)performKVOUpdateForKeyPaths:(id)a3 updateBlock:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v6);
        }
        [(CRKClassKitCurrentUserProvider *)self willChangeValueForKey:*(void *)(*((void *)&v21 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }
  v7[2](v7);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v12 = objc_msgSend(v6, "reverseObjectEnumerator", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [(CRKClassKitCurrentUserProvider *)self didChangeValueForKey:*(void *)(*((void *)&v17 + 1) + 8 * v16++)];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (void)safeFetchCurrentUserWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKClassKitCurrentUserProvider *)self classKitFacade];
  BOOL v6 = -[CRKClassKitCurrentUserProvider isSafeToTalkToProgressdWithAccountState:](self, "isSafeToTalkToProgressdWithAccountState:", [v5 accountState]);

  if (v6)
  {
    uint64_t v7 = [(CRKClassKitCurrentUserProvider *)self classKitFacade];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __69__CRKClassKitCurrentUserProvider_safeFetchCurrentUserWithCompletion___block_invoke;
    v8[3] = &unk_2646F5948;
    id v9 = v4;
    [v7 currentUserWithCompletion:v8];
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __69__CRKClassKitCurrentUserProvider_safeFetchCurrentUserWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__CRKClassKitCurrentUserProvider_safeFetchCurrentUserWithCompletion___block_invoke_2;
  block[3] = &unk_2646F3B00;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __69__CRKClassKitCurrentUserProvider_safeFetchCurrentUserWithCompletion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)isSafeToTalkToProgressdWithAccountState:(int64_t)a3
{
  return a3 == 2;
}

- (CRKClassKitCurrentUser)currentUser
{
  return self->_currentUser;
}

- (void)setCurrentUser:(id)a3
{
}

- (BOOL)currentUserFetched
{
  return self->_currentUserFetched;
}

- (void)setCurrentUserFetched:(BOOL)a3
{
  self->_currentUserFetched = a3;
}

- (CRKClassKitFacade)classKitFacade
{
  return self->_classKitFacade;
}

- (CRKCancelable)currentUserSubscription
{
  return self->_currentUserSubscription;
}

- (void)setCurrentUserSubscription:(id)a3
{
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  self->_sequenceNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUserSubscription, 0);
  objc_storeStrong((id *)&self->_classKitFacade, 0);

  objc_storeStrong((id *)&self->_currentUser, 0);
}

@end