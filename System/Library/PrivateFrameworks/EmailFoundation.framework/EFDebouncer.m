@interface EFDebouncer
+ (id)log;
- (EFCancelable)cancelable;
- (EFDebouncer)initWithTimeInterval:(double)a3 scheduler:(id)a4 startAfter:(unint64_t)a5 block:(id)a6;
- (EFObserver)observable;
- (void)cancel;
- (void)dealloc;
- (void)debounceResult:(id)a3;
@end

@implementation EFDebouncer

void __18__EFDebouncer_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_0;
  log_log_0 = (uint64_t)v1;
}

- (void)debounceResult:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[EFDebouncer log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(EFDebouncer *)self observable];
    int v9 = 138412546;
    v10 = v6;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1B5A59000, v5, OS_LOG_TYPE_DEFAULT, "Observer: %@ received result: %@", (uint8_t *)&v9, 0x16u);
  }
  v7 = [(EFDebouncer *)self observable];
  v8 = v4;
  if (!v4)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  [v7 observerDidReceiveResult:v8];
  if (!v4) {
}
  }

- (EFObserver)observable
{
  return self->_observable;
}

void __63__EFDebouncer_initWithTimeInterval_scheduler_startAfter_block___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1CA98] null];
  if (v4 == v6) {
    id v5 = 0;
  }
  else {
    id v5 = v6;
  }
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
}

- (EFDebouncer)initWithTimeInterval:(double)a3 scheduler:(id)a4 startAfter:(unint64_t)a5 block:(id)a6
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  v32.receiver = self;
  v32.super_class = (Class)EFDebouncer;
  id v12 = [(EFDebouncer *)&v32 init];
  if (v12)
  {
    uint64_t v13 = +[EFObservable observableObserver];
    observable = v12->_observable;
    v12->_observable = (EFObserver *)v13;

    v15 = v12->_observable;
    if (a5)
    {
      v16 = [(EFObserver *)v15 take:a5];
      v17 = v16;
      if (v10)
      {
        uint64_t v18 = [v16 observeOn:v10];

        v17 = v18;
      }
      id v19 = [(EFObserver *)v12->_observable skip:a5];
      id v20 = v10;
      if (v10) {
        [v19 debounceWithTimeInterval:v20 scheduler:a3];
      }
      else {
      v23 = [v19 debounceWithTimeInterval:a3];
      }

      v39[0] = v17;
      v39[1] = v23;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
      v25 = +[EFObservable merge:v24];

      v26 = +[EFDebouncer log];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v34 = v17;
        __int16 v35 = 2112;
        v36 = v23;
        __int16 v37 = 2112;
        v38 = v25;
        _os_log_debug_impl(&dword_1B5A59000, v26, OS_LOG_TYPE_DEBUG, "Merge [first %@, rest %@] to debouncedObservable: %@", buf, 0x20u);
      }
    }
    else
    {
      v21 = v15;
      id v22 = v10;
      if (v22) {
        [(EFObserver *)v21 debounceWithTimeInterval:v22 scheduler:a3];
      }
      else {
      v25 = [(EFObserver *)v21 debounceWithTimeInterval:a3];
      }

      v17 = +[EFDebouncer log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[EFDebouncer initWithTimeInterval:scheduler:startAfter:block:]((uint64_t *)&v12->_observable, (uint64_t)v25, v17);
      }
    }

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __63__EFDebouncer_initWithTimeInterval_scheduler_startAfter_block___block_invoke;
    v30[3] = &unk_1E6121BE0;
    id v31 = v11;
    uint64_t v27 = [v25 subscribeWithResultBlock:v30];
    cancelable = v12->_cancelable;
    v12->_cancelable = (EFCancelable *)v27;
  }
  return v12;
}

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __18__EFDebouncer_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_0 != -1) {
    dispatch_once(&log_onceToken_0, block);
  }
  v2 = (void *)log_log_0;
  return v2;
}

- (void)dealloc
{
  [(EFDebouncer *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)EFDebouncer;
  [(EFDebouncer *)&v3 dealloc];
}

- (void)cancel
{
  id v2 = [(EFDebouncer *)self cancelable];
  [v2 cancel];
}

- (EFCancelable)cancelable
{
  return self->_cancelable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelable, 0);
  objc_storeStrong((id *)&self->_observable, 0);
}

- (void)initWithTimeInterval:(os_log_t)log scheduler:startAfter:block:.cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1B5A59000, log, OS_LOG_TYPE_DEBUG, "Subscribing to %@ with %@", (uint8_t *)&v4, 0x16u);
}

@end