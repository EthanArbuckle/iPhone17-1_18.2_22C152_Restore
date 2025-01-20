@interface CNAvatarCacheChangeListener
- (CNAvatarCacheChangeListener)init;
- (CNAvatarCacheChangeListener)initWithContactStore:(id)a3 delegate:(id)a4;
- (CNAvatarCacheChangeListenerDelegate)delegate;
- (CNContactStore)store;
- (CNScheduler)preprocessor;
- (CNScheduler)rawPreprocessor;
- (NSData)currentHistoryToken;
- (NSNotificationCenter)notificationCenter;
- (id)description;
- (id)makeAnalysisTask;
- (id)makeDatabaseChangedTask;
- (id)makeReportingTaskWithIdentifiers:(id)a3;
- (void)databaseChanged:(id)a3;
- (void)loadCurrentHistoryToken;
- (void)setCurrentHistoryToken:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation CNAvatarCacheChangeListener

void __54__CNAvatarCacheChangeListener_loadCurrentHistoryToken__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) store];
  v2 = [v3 currentHistoryToken];
  [*(id *)(a1 + 32) setCurrentHistoryToken:v2];
}

- (CNContactStore)store
{
  return self->_store;
}

- (void)setCurrentHistoryToken:(id)a3
{
}

- (void)start
{
  id v3 = [(CNAvatarCacheChangeListener *)self notificationCenter];
  [v3 addObserver:self selector:sel_databaseChanged_ name:*MEMORY[0x263EFE118] object:0];
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (CNAvatarCacheChangeListener)initWithContactStore:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CNAvatarCacheChangeListener;
  v9 = [(CNAvatarCacheChangeListener *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    uint64_t v11 = [MEMORY[0x263F08A00] defaultCenter];
    notificationCenter = v10->_notificationCenter;
    v10->_notificationCenter = (NSNotificationCenter *)v11;

    v13 = [MEMORY[0x263F33668] defaultProvider];
    uint64_t v14 = [v13 newSerialSchedulerWithName:@"com.apple.contacts.ui.avatar-cache.notification-preprocessor"];
    rawPreprocessor = v10->_rawPreprocessor;
    v10->_rawPreprocessor = (CNScheduler *)v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x263F33578]) initWithScheduler:v10->_rawPreprocessor coalescingWindow:5.0];
    preprocessor = v10->_preprocessor;
    v10->_preprocessor = (CNScheduler *)v16;

    [(CNAvatarCacheChangeListener *)v10 loadCurrentHistoryToken];
    v18 = v10;
  }

  return v10;
}

- (void)loadCurrentHistoryToken
{
  id v3 = [(CNAvatarCacheChangeListener *)self rawPreprocessor];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__CNAvatarCacheChangeListener_loadCurrentHistoryToken__block_invoke;
  v4[3] = &unk_264017748;
  v4[4] = self;
  [v3 performBlock:v4];
}

- (CNScheduler)rawPreprocessor
{
  return self->_rawPreprocessor;
}

- (CNAvatarCacheChangeListener)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)description
{
  id v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = (id)[v3 appendName:@"delegate" object:WeakRetained];

  v6 = [v3 build];

  return v6;
}

- (void)stop
{
  id v3 = [(CNAvatarCacheChangeListener *)self notificationCenter];
  [v3 removeObserver:self name:0 object:0];
}

- (void)databaseChanged:(id)a3
{
  v4 = [(CNAvatarCacheChangeListener *)self makeDatabaseChangedTask];
  id v5 = [(CNAvatarCacheChangeListener *)self preprocessor];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__CNAvatarCacheChangeListener_databaseChanged___block_invoke;
  v7[3] = &unk_264017748;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

id __47__CNAvatarCacheChangeListener_databaseChanged___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) run];
}

- (id)makeDatabaseChangedTask
{
  id v3 = [CNAvatarCacheChangeHistoryAnalysisTask alloc];
  v4 = [(CNAvatarCacheChangeListener *)self store];
  id v5 = [(CNAvatarCacheChangeListener *)self currentHistoryToken];
  id v6 = [(CNAvatarCacheChangeHistoryAnalysisTask *)v3 initWithContactStore:v4 startingToken:v5];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__CNAvatarCacheChangeListener_makeDatabaseChangedTask__block_invoke;
  v9[3] = &unk_2640183E0;
  v9[4] = self;
  id v7 = [(CNTask *)v6 flatMap:v9];

  return v7;
}

id __54__CNAvatarCacheChangeListener_makeDatabaseChangedTask__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 currentChangeHistoryToken];
  [*(id *)(a1 + 32) setCurrentHistoryToken:v4];

  id v5 = *(void **)(a1 + 32);
  id v6 = [v3 identifiersOfAffectedContacts];

  id v7 = [v5 makeReportingTaskWithIdentifiers:v6];

  return v7;
}

- (id)makeAnalysisTask
{
  id v3 = [(CNAvatarCacheChangeListener *)self store];
  v4 = [(CNAvatarCacheChangeListener *)self currentHistoryToken];
  id v5 = [[CNAvatarCacheChangeHistoryAnalysisTask alloc] initWithContactStore:v3 startingToken:v4];

  return v5;
}

- (id)makeReportingTaskWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAvatarCacheChangeListener *)self delegate];
  id v6 = [[CNAvatarChangeHistoryReportingTask alloc] initWithIdentifiers:v4 delegate:v5];

  return v6;
}

- (CNAvatarCacheChangeListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CNAvatarCacheChangeListenerDelegate *)WeakRetained;
}

- (CNScheduler)preprocessor
{
  return self->_preprocessor;
}

- (NSData)currentHistoryToken
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentHistoryToken, 0);
  objc_storeStrong((id *)&self->_preprocessor, 0);
  objc_storeStrong((id *)&self->_rawPreprocessor, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_store, 0);
}

@end