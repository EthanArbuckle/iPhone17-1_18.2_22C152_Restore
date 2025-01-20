@interface _LTLanguageStatusMulticaster
+ (id)shared;
- (_LTLanguageStatusMulticaster)init;
- (void)_cancelWithConnectionIdentifier:(id)a3 observationType:(unint64_t)a4 useDedicatedMachPort:(BOOL)a5;
- (void)_multicastObservations:(id)a3 observationType:(unint64_t)a4 progress:(BOOL)a5;
- (void)_reconnectIfStreamingWithConnectionIdentifier:(id)a3 observationType:(unint64_t)a4 useDedicatedMachPort:(BOOL)a5;
- (void)_removeAllObservers;
- (void)_startWithConnectionIdentifier:(id)a3 observationType:(unint64_t)a4 useDedicatedMachPort:(BOOL)a5;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)languageStatusChangedForType:(unint64_t)a3 progress:(BOOL)a4 observations:(id)a5;
- (void)removeObserver:(id)a3;
@end

@implementation _LTLanguageStatusMulticaster

+ (id)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)shared_shared;

  return v2;
}

- (_LTLanguageStatusMulticaster)init
{
  v13.receiver = self;
  v13.super_class = (Class)_LTLanguageStatusMulticaster;
  v2 = [(_LTLanguageStatusMulticaster *)&v13 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.translation.LanguageStatusMulticast", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    statusObservers = v2->_statusObservers;
    v2->_statusObservers = (NSMapTable *)v5;

    uint64_t v7 = objc_opt_new();
    lastStatusObservations = v2->_lastStatusObservations;
    v2->_lastStatusObservations = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    connectionIdentifiers = v2->_connectionIdentifiers;
    v2->_connectionIdentifiers = (NSMutableDictionary *)v9;

    v11 = v2;
  }

  return v2;
}

- (void)dealloc
{
  [(_LTLanguageStatusMulticaster *)self _removeAllObservers];
  [(NSMapTable *)self->_statusObservers removeAllObjects];
  statusObservers = self->_statusObservers;
  self->_statusObservers = 0;

  lastStatusObservations = self->_lastStatusObservations;
  self->_lastStatusObservations = 0;

  connectionIdentifiers = self->_connectionIdentifiers;
  self->_connectionIdentifiers = 0;

  v6.receiver = self;
  v6.super_class = (Class)_LTLanguageStatusMulticaster;
  [(_LTLanguageStatusMulticaster *)&v6 dealloc];
}

- (void)_removeAllObservers
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51___LTLanguageStatusMulticaster__removeAllObservers__block_invoke;
  v4[3] = &unk_2651DBA48;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44___LTLanguageStatusMulticaster_addObserver___block_invoke;
  block[3] = &unk_2651DBA20;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = (void *)[v4 observationType];
  char v7 = [v4 useDedicatedMachPort];

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47___LTLanguageStatusMulticaster_removeObserver___block_invoke;
  block[3] = &unk_2651DBDC8;
  objc_copyWeak(v12, &location);
  id v11 = v5;
  v12[1] = v6;
  char v13 = v7;
  id v9 = v5;
  dispatch_async(queue, block);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

- (void)_multicastObservations:(id)a3 observationType:(unint64_t)a4 progress:(BOOL)a5
{
  id v8 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80___LTLanguageStatusMulticaster__multicastObservations_observationType_progress___block_invoke;
  block[3] = &unk_2651DBDC8;
  objc_copyWeak(v13, &location);
  BOOL v14 = a5;
  v13[1] = (id)a4;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

- (void)_reconnectIfStreamingWithConnectionIdentifier:(id)a3 observationType:(unint64_t)a4 useDedicatedMachPort:(BOOL)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = [(NSMutableDictionary *)self->_connectionIdentifiers allValues];
  int v10 = [v9 containsObject:v8];

  if (v10)
  {
    id v11 = _LTOSLogAssets();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v8;
      _os_log_impl(&dword_24639B000, v11, OS_LOG_TYPE_INFO, "Reconnecting language status observation connection %{public}@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    id v13[2] = __115___LTLanguageStatusMulticaster__reconnectIfStreamingWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke;
    v13[3] = &unk_2651DBDC8;
    objc_copyWeak(v15, (id *)buf);
    id v14 = v8;
    v15[1] = (id)a4;
    BOOL v16 = a5;
    dispatch_async(queue, v13);

    objc_destroyWeak(v15);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_startWithConnectionIdentifier:(id)a3 observationType:(unint64_t)a4 useDedicatedMachPort:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  objc_initWeak(&location, self);
  id v9 = self;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __100___LTLanguageStatusMulticaster__startWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke;
  v16[3] = &unk_2651DBDF0;
  objc_copyWeak(v18, &location);
  id v10 = v8;
  id v17 = v10;
  v18[1] = (id)a4;
  BOOL v19 = v5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  id v12[2] = __100___LTLanguageStatusMulticaster__startWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_9;
  v12[3] = &unk_2651DBE68;
  objc_copyWeak(v14, &location);
  id v11 = v10;
  id v13 = v11;
  v14[1] = (id)a4;
  BOOL v15 = v5;
  +[_LTTranslator _getTextServiceProxyWithDelegate:v9 useDedicatedTextMachPort:v5 errorHandler:v16 block:v12];

  objc_destroyWeak(v14);
  objc_destroyWeak(v18);

  objc_destroyWeak(&location);
}

- (void)_cancelWithConnectionIdentifier:(id)a3 observationType:(unint64_t)a4 useDedicatedMachPort:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  objc_initWeak(&location, self);
  id v8 = self;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __101___LTLanguageStatusMulticaster__cancelWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_13;
  v10[3] = &unk_2651DBED8;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  +[_LTTranslator _getTextServiceProxyWithDelegate:v8 useDedicatedTextMachPort:v5 errorHandler:&__block_literal_global_12 block:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)languageStatusChangedForType:(unint64_t)a3 progress:(BOOL)a4 observations:(id)a5
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_lastStatusObservations, 0);
  objc_storeStrong((id *)&self->_statusObservers, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end