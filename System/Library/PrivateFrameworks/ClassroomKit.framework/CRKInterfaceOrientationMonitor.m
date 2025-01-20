@interface CRKInterfaceOrientationMonitor
- (CRKInterfaceOrientationMonitor)init;
- (id)makeUpdateHandler;
- (unint64_t)DMFInterfaceOrientationFromBSInterfaceOrientation:(int64_t)a3;
- (unint64_t)interfaceOrientation;
- (void)dealloc;
- (void)interfaceOrientationWithCompletion:(id)a3;
- (void)setInterfaceOrientation:(unint64_t)a3;
- (void)updateInterfaceOrientationWithBSOrientation:(int64_t)a3;
- (void)updateInterfaceOrientationWithDMFOrientation:(unint64_t)a3;
- (void)updateInterfaceOrientationWithNotification:(id)a3;
@end

@implementation CRKInterfaceOrientationMonitor

- (void)dealloc
{
  [(FBSOrientationObserver *)self->mObserver invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CRKInterfaceOrientationMonitor;
  [(CRKInterfaceOrientationMonitor *)&v3 dealloc];
}

- (CRKInterfaceOrientationMonitor)init
{
  v10.receiver = self;
  v10.super_class = (Class)CRKInterfaceOrientationMonitor;
  v2 = [(CRKInterfaceOrientationMonitor *)&v10 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_interfaceOrientation = 0;
    uint64_t v4 = objc_opt_new();
    mCompletionBlocks = v3->mCompletionBlocks;
    v3->mCompletionBlocks = (NSMutableArray *)v4;

    v3->mIsWaitingForFirstUpdate = 1;
    v6 = [(CRKInterfaceOrientationMonitor *)v3 makeUpdateHandler];
    uint64_t v7 = objc_opt_new();
    mObserver = v3->mObserver;
    v3->mObserver = (FBSOrientationObserver *)v7;

    [(FBSOrientationObserver *)v3->mObserver setHandler:v6];
    [(FBSOrientationObserver *)v3->mObserver activeInterfaceOrientationWithCompletion:v6];
  }
  return v3;
}

- (id)makeUpdateHandler
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__CRKInterfaceOrientationMonitor_makeUpdateHandler__block_invoke;
  v4[3] = &unk_2646F45D0;
  objc_copyWeak(&v5, &location);
  v2 = (void *)MEMORY[0x22A620AF0](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

void __51__CRKInterfaceOrientationMonitor_makeUpdateHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x263EFF9F0];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__CRKInterfaceOrientationMonitor_makeUpdateHandler__block_invoke_2;
  v6[3] = &unk_2646F3EC8;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  id v5 = v3;
  id v7 = v5;
  objc_msgSend(v4, "cat_performBlockOnMainRunLoop:", v6);

  objc_destroyWeak(&v8);
}

void __51__CRKInterfaceOrientationMonitor_makeUpdateHandler__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained updateInterfaceOrientationWithNotification:*(void *)(a1 + 32)];
}

- (void)interfaceOrientationWithCompletion:(id)a3
{
  objc_super v10 = (void (**)(id, unint64_t))a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    id v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"CRKInterfaceOrientationMonitor.m", 71, @"%@ must be called from the main thread", v8 object file lineNumber description];
  }
  if (!v10)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"CRKInterfaceOrientationMonitor.m", 73, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  if (self->mIsWaitingForFirstUpdate)
  {
    mCompletionBlocks = self->mCompletionBlocks;
    v6 = (void *)MEMORY[0x22A620AF0]();
    [(NSMutableArray *)mCompletionBlocks addObject:v6];
  }
  else
  {
    v10[2](v10, [(CRKInterfaceOrientationMonitor *)self interfaceOrientation]);
  }
}

- (void)updateInterfaceOrientationWithNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    v13 = NSStringFromSelector(a2);
    [v12 handleFailureInMethod:a2, self, @"CRKInterfaceOrientationMonitor.m", 88, @"%@ must be called from the main thread", v13 object file lineNumber description];
  }
  -[CRKInterfaceOrientationMonitor updateInterfaceOrientationWithBSOrientation:](self, "updateInterfaceOrientationWithBSOrientation:", [v5 orientation]);
  if (self->mIsWaitingForFirstUpdate)
  {
    self->mIsWaitingForFirstUpdate = 0;
    v6 = (void *)[(NSMutableArray *)self->mCompletionBlocks copy];
    [(NSMutableArray *)self->mCompletionBlocks removeAllObjects];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          (*(void (**)(void, unint64_t))(*(void *)(*((void *)&v14 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * i), [(CRKInterfaceOrientationMonitor *)self interfaceOrientation]);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
}

- (void)updateInterfaceOrientationWithBSOrientation:(int64_t)a3
{
  unint64_t v4 = [(CRKInterfaceOrientationMonitor *)self DMFInterfaceOrientationFromBSInterfaceOrientation:a3];

  [(CRKInterfaceOrientationMonitor *)self updateInterfaceOrientationWithDMFOrientation:v4];
}

- (unint64_t)DMFInterfaceOrientationFromBSInterfaceOrientation:(int64_t)a3
{
  if ((unint64_t)a3 < 5) {
    return qword_224CC0D70[a3];
  }
  if (_CRKLogGeneral_onceToken_14 != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken_14, &__block_literal_global_54);
  }
  id v5 = (void *)_CRKLogGeneral_logObj_14;
  if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_14, OS_LOG_TYPE_ERROR)) {
    -[CRKInterfaceOrientationMonitor DMFInterfaceOrientationFromBSInterfaceOrientation:](v5, a3);
  }
  return 0;
}

- (void)updateInterfaceOrientationWithDMFOrientation:(unint64_t)a3
{
  if ([(CRKInterfaceOrientationMonitor *)self interfaceOrientation] != a3)
  {
    [(CRKInterfaceOrientationMonitor *)self setInterfaceOrientation:a3];
  }
}

- (unint64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(unint64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCompletionBlocks, 0);

  objc_storeStrong((id *)&self->mObserver, 0);
}

- (void)DMFInterfaceOrientationFromBSInterfaceOrientation:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = NSNumber;
  unint64_t v4 = a1;
  id v5 = [v3 numberWithInteger:a2];
  int v6 = 138543362;
  id v7 = v5;
  _os_log_error_impl(&dword_224C00000, v4, OS_LOG_TYPE_ERROR, "Unknown BSInterfaceOrientation: %{public}@", (uint8_t *)&v6, 0xCu);
}

@end