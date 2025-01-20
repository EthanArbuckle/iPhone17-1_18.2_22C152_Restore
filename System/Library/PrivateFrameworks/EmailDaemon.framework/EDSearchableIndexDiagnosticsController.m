@interface EDSearchableIndexDiagnosticsController
+ (OS_os_log)log;
- (EDPersistence)persistence;
- (EDSearchableIndexDiagnosticsController)initWithPersistence:(id)a3;
- (EFCancelable)stateCancelable;
- (NSBackgroundActivityScheduler)indexingDiagnosticsScheduler;
- (id)_localDiagnosticsFromStatistics:(id)a3;
- (id)_remoteDiagnosticsFromStatistics:(id)a3;
- (void)_logDebuggingDiagnostics:(id)a3 forKey:(id)a4;
- (void)_registerDebuggingDiagnosticsCaptureHandler;
- (void)_startLoggingDebuggingDiagnostics;
- (void)_stopCollection;
- (void)_stopLoggingDebuggingDiagnostics;
- (void)_unregisterDebuggingDiagnosticsCaptureHandler;
- (void)dealloc;
- (void)scheduleRecurringActivity;
- (void)setIndexingDiagnosticsScheduler:(id)a3;
- (void)setPersistence:(id)a3;
- (void)setStateCancelable:(id)a3;
@end

@implementation EDSearchableIndexDiagnosticsController

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__EDSearchableIndexDiagnosticsController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_80 != -1) {
    dispatch_once(&log_onceToken_80, block);
  }
  v2 = (void *)log_log_80;

  return (OS_os_log *)v2;
}

void __45__EDSearchableIndexDiagnosticsController_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_80;
  log_log_80 = (uint64_t)v1;
}

- (EDSearchableIndexDiagnosticsController)initWithPersistence:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EDSearchableIndexDiagnosticsController;
  v5 = [(EDSearchableIndexDiagnosticsController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_persistence, v4);
  }

  return v6;
}

- (void)dealloc
{
  [(EDSearchableIndexDiagnosticsController *)self _stopCollection];
  v3.receiver = self;
  v3.super_class = (Class)EDSearchableIndexDiagnosticsController;
  [(EDSearchableIndexDiagnosticsController *)&v3 dealloc];
}

- (void)scheduleRecurringActivity
{
  objc_super v3 = +[EDSearchableIndexDiagnosticsController log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "Starting background collection of indexing diagnostics", v4, 2u);
  }

  [(EDSearchableIndexDiagnosticsController *)self _startLoggingDebuggingDiagnostics];
  [(EDSearchableIndexDiagnosticsController *)self _registerDebuggingDiagnosticsCaptureHandler];
}

- (void)_stopCollection
{
  objc_super v3 = +[EDSearchableIndexDiagnosticsController log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "Stopping background collection of indexing diagnostics", v4, 2u);
  }

  [(EDSearchableIndexDiagnosticsController *)self _unregisterDebuggingDiagnosticsCaptureHandler];
  [(EDSearchableIndexDiagnosticsController *)self _stopLoggingDebuggingDiagnostics];
}

- (id)_localDiagnosticsFromStatistics:(id)a3
{
  id v3 = a3;
  id v4 = [EDSearchableIndexDiagnosticsSnapshot alloc];
  v5 = [MEMORY[0x1E4F1C9C8] date];
  v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5FFC8]];
  v7 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F60030]];
  objc_super v8 = [(EDSearchableIndexDiagnosticsSnapshot *)v4 initWithDate:v5 indexableMessages:v6 messagesIndexed:v7 turboMode:+[EDSearchableIndexScheduler isTurboModeIndexingEnabled]];

  return v8;
}

- (id)_remoteDiagnosticsFromStatistics:(id)a3
{
  id v3 = a3;
  id v4 = [EDSearchableIndexDiagnosticsSnapshot alloc];
  v5 = [MEMORY[0x1E4F1C9C8] date];
  v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5FFD8]];
  v7 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F60070]];
  objc_super v8 = [(EDSearchableIndexDiagnosticsSnapshot *)v4 initWithDate:v5 indexableMessages:v6 messagesIndexed:v7 turboMode:0];

  return v8;
}

- (void)_logDebuggingDiagnostics:(id)a3 forKey:(id)a4
{
  id v14 = a3;
  id v5 = a4;
  v6 = (void *)MEMORY[0x1E0190280]();
  id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
  objc_super v8 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  v9 = [v8 objectForKey:v5];
  v10 = (void *)[v7 initWithArray:v9];

  if ((unint64_t)[v10 count] >= 0x151) {
    [v10 removeObjectAtIndex:0];
  }
  v11 = [v14 dictionaryRepresentation];
  [v10 addObject:v11];

  v12 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  v13 = (void *)[v10 copy];
  [v12 setObject:v13 forKey:v5];
}

- (void)_startLoggingDebuggingDiagnostics
{
  id v3 = [MEMORY[0x1E4F60D58] currentDevice];
  char v4 = [v3 isInternal];

  if (v4)
  {
    id v5 = [(EDSearchableIndexDiagnosticsController *)self indexingDiagnosticsScheduler];
    if (!v5)
    {
      id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28B38]) initWithIdentifier:@"com.apple.mail.searchableIndex.indexingDiagnosticsCollector"];
      [v5 setQualityOfService:9];
      [v5 setRepeats:1];
      [v5 setInterval:1800.0];
      [v5 setTolerance:300.0];
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      uint64_t v6 = MEMORY[0x1E4F143A8];
      uint64_t v7 = 3221225472;
      objc_super v8 = __75__EDSearchableIndexDiagnosticsController__startLoggingDebuggingDiagnostics__block_invoke;
      v9 = &unk_1E6C019D8;
      objc_copyWeak(&v10, &location);
      [v5 scheduleWithBlock:&v6];
      -[EDSearchableIndexDiagnosticsController setIndexingDiagnosticsScheduler:](self, "setIndexingDiagnosticsScheduler:", v5, v6, v7, v8, v9);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __75__EDSearchableIndexDiagnosticsController__startLoggingDebuggingDiagnostics__block_invoke(uint64_t a1, void *a2)
{
  v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained persistence];
    uint64_t v6 = [v5 searchableIndexStatistics];

    if (v6)
    {
      uint64_t v7 = [v4 _localDiagnosticsFromStatistics:v6];
      [v4 _logDebuggingDiagnostics:v7 forKey:@"InternalIndexingDiagnostics"];

      objc_super v8 = [v4 _remoteDiagnosticsFromStatistics:v6];
      [v4 _logDebuggingDiagnostics:v8 forKey:@"InternalRemoteIndexingDiagnostics"];
    }
    v9[2](v9, 1);
  }
}

- (void)_registerDebuggingDiagnosticsCaptureHandler
{
  id v3 = EFLogRegisterStateCaptureBlock();
  [(EDSearchableIndexDiagnosticsController *)self setStateCancelable:v3];

  char v4 = EFLogRegisterStateCaptureBlock();
  [(EDSearchableIndexDiagnosticsController *)self setStateCancelable:v4];

  id v5 = (void *)MEMORY[0x1E4F14428];
}

id __85__EDSearchableIndexDiagnosticsController__registerDebuggingDiagnosticsCaptureHandler__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  os_log_t v1 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  v2 = [v1 objectForKey:@"InternalIndexingDiagnostics"];
  [v0 setObject:v2 forKeyedSubscript:@"InternalIndexingDiagnostics"];

  id v3 = (void *)[v0 copy];

  return v3;
}

id __85__EDSearchableIndexDiagnosticsController__registerDebuggingDiagnosticsCaptureHandler__block_invoke_2()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  os_log_t v1 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  v2 = [v1 objectForKey:@"InternalRemoteIndexingDiagnostics"];
  [v0 setObject:v2 forKeyedSubscript:@"InternalRemoteIndexingDiagnostics"];

  id v3 = (void *)[v0 copy];

  return v3;
}

- (void)_stopLoggingDebuggingDiagnostics
{
  id v2 = [(EDSearchableIndexDiagnosticsController *)self indexingDiagnosticsScheduler];
  [v2 invalidate];
}

- (void)_unregisterDebuggingDiagnosticsCaptureHandler
{
  id v3 = [(EDSearchableIndexDiagnosticsController *)self stateCancelable];
  [v3 cancel];

  [(EDSearchableIndexDiagnosticsController *)self setStateCancelable:0];
}

- (EFCancelable)stateCancelable
{
  return self->_stateCancelable;
}

- (void)setStateCancelable:(id)a3
{
}

- (NSBackgroundActivityScheduler)indexingDiagnosticsScheduler
{
  return self->_indexingDiagnosticsScheduler;
}

- (void)setIndexingDiagnosticsScheduler:(id)a3
{
}

- (EDPersistence)persistence
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_persistence);

  return (EDPersistence *)WeakRetained;
}

- (void)setPersistence:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_persistence);
  objc_storeStrong((id *)&self->_indexingDiagnosticsScheduler, 0);

  objc_storeStrong((id *)&self->_stateCancelable, 0);
}

@end