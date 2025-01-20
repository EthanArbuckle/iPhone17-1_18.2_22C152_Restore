@interface FCCXPCActivityScheduler
- (FCCXPCActivityScheduler)init;
- (FCCXPCActivityScheduler)initWithDateProvider:(id)a3 dispatchQueue:(id)a4;
- (FCCXPCActivitySchedulerDelegate)delegate;
- (id)_stringForXPCActivityState:(int64_t)a3;
- (void)_checkInActivity:(id)a3 name:(id)a4 scheduledDate:(id)a5;
- (void)_runActivity:(id)a3 name:(id)a4;
- (void)cancelActivityWithName:(id)a3;
- (void)scheduleActivityWithName:(id)a3 scheduledDate:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation FCCXPCActivityScheduler

- (FCCXPCActivityScheduler)init
{
  v3 = objc_alloc_init(FCCDateProvider);
  v4 = [(FCCXPCActivityScheduler *)self initWithDateProvider:v3 dispatchQueue:MEMORY[0x1E4F14428]];

  return v4;
}

- (FCCXPCActivityScheduler)initWithDateProvider:(id)a3 dispatchQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCCXPCActivityScheduler;
  v9 = [(FCCXPCActivityScheduler *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dateProvider, a3);
    objc_storeStrong((id *)&v10->_dispatchQueue, a4);
  }

  return v10;
}

- (void)scheduleActivityWithName:(id)a3 scheduledDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  v9 = (const char *)[v8 UTF8String];
  v10 = (void *)*MEMORY[0x1E4F14158];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __66__FCCXPCActivityScheduler_scheduleActivityWithName_scheduledDate___block_invoke;
  handler[3] = &unk_1E6105C20;
  id v14 = v8;
  v15 = self;
  id v16 = v7;
  id v11 = v7;
  id v12 = v8;
  xpc_activity_register(v9, v10, handler);
}

void __66__FCCXPCActivityScheduler_scheduleActivityWithName_scheduledDate___block_invoke(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = a1[4];
    id v6 = (void *)a1[5];
    id v8 = v5;
    v9 = [v6 _stringForXPCActivityState:state];
    int v12 = 138412546;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1B55C0000, v8, OS_LOG_TYPE_DEFAULT, "XPC activity %@ fired with state: %@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v11 = a1[4];
  v10 = (void *)a1[5];
  if (state) {
    [v10 _runActivity:v3 name:v11];
  }
  else {
    [v10 _checkInActivity:v3 name:v11 scheduledDate:a1[6]];
  }
}

- (void)cancelActivityWithName:(id)a3
{
  v3 = (const char *)[a3 UTF8String];
  xpc_activity_unregister(v3);
}

- (void)_checkInActivity:(id)a3 name:(id)a4 scheduledDate:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = (_xpc_activity_s *)a3;
  id v9 = a4;
  dateProvider = self->_dateProvider;
  id v11 = a5;
  int v12 = [(FCCDateProvider *)dateProvider coachingDate];
  [v11 timeIntervalSinceDate:v12];
  double v14 = v13;

  xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v15, (const char *)*MEMORY[0x1E4F142F8], 0);
  xpc_dictionary_set_BOOL(v15, (const char *)*MEMORY[0x1E4F14138], 1);
  xpc_dictionary_set_BOOL(v15, (const char *)*MEMORY[0x1E4F14310], 1);
  xpc_dictionary_set_int64(v15, (const char *)*MEMORY[0x1E4F14170], (uint64_t)v14 & ~((uint64_t)v14 >> 63));
  xpc_dictionary_set_string(v15, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
  xpc_object_t v16 = xpc_activity_copy_criteria(v8);
  v17 = v16;
  if (!v16 || !xpc_equal(v16, v15))
  {
    _HKInitializeLogging();
    v18 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v9;
      _os_log_impl(&dword_1B55C0000, v18, OS_LOG_TYPE_DEFAULT, "Updated criteria for xpc activity: %@", (uint8_t *)&v19, 0xCu);
    }
    xpc_activity_set_criteria(v8, v15);
  }
}

- (void)_runActivity:(id)a3 name:(id)a4
{
  id v6 = (_xpc_activity_s *)a3;
  id v7 = a4;
  if (!xpc_activity_set_state(v6, 4))
  {
    _HKInitializeLogging();
    id v8 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_ERROR)) {
      -[FCCXPCActivityScheduler _runActivity:name:]((uint64_t)v7, v8);
    }
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__FCCXPCActivityScheduler__runActivity_name___block_invoke;
  block[3] = &unk_1E6105C70;
  id v13 = v7;
  double v14 = self;
  xpc_object_t v15 = v6;
  v10 = v6;
  id v11 = v7;
  dispatch_async(dispatchQueue, block);
}

void __45__FCCXPCActivityScheduler__runActivity_name___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1B55C0000, v2, OS_LOG_TYPE_DEFAULT, "Running xpc activity: %@", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__FCCXPCActivityScheduler__runActivity_name___block_invoke_278;
  v7[3] = &unk_1E6105C48;
  id v8 = v5;
  id v9 = *(id *)(a1 + 48);
  [WeakRetained scheduler:v6 performActivityWithName:v8 completion:v7];
}

void __45__FCCXPCActivityScheduler__runActivity_name___block_invoke_278(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = (os_log_t *)MEMORY[0x1E4F29F08];
  uint64_t v3 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1B55C0000, v3, OS_LOG_TYPE_DEFAULT, "Setting xpc activity to done: %@", (uint8_t *)&v6, 0xCu);
  }
  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5))
  {
    _HKInitializeLogging();
    v5 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR)) {
      __45__FCCXPCActivityScheduler__runActivity_name___block_invoke_278_cold_1(a1, v5);
    }
  }
}

- (id)_stringForXPCActivityState:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return @"Unknown";
  }
  else {
    return off_1E6105C90[a3];
  }
}

- (FCCXPCActivitySchedulerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FCCXPCActivitySchedulerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
}

- (void)_runActivity:(uint64_t)a1 name:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B55C0000, a2, OS_LOG_TYPE_ERROR, "failed to set xpc activity state to continue: %@", (uint8_t *)&v2, 0xCu);
}

void __45__FCCXPCActivityScheduler__runActivity_name___block_invoke_278_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1B55C0000, a2, OS_LOG_TYPE_ERROR, "Failed to set xpc activity state to done: %@", (uint8_t *)&v3, 0xCu);
}

@end