@interface FMXPCTimer
- (FMXPCTimer)initWithName:(id)a3 date:(id)a4 gracePeriod:(double)a5 priority:(int64_t)a6 options:(unint64_t)a7 block:(id)a8;
- (FMXPCTimer)initWithName:(id)a3 date:(id)a4 priority:(int64_t)a5 options:(unint64_t)a6 block:(id)a7;
- (FMXPCTimer)initWithName:(id)a3 timeInterval:(double)a4 gracePeriod:(double)a5 priority:(int64_t)a6 options:(unint64_t)a7 block:(id)a8;
- (FMXPCTimer)initWithName:(id)a3 timeInterval:(double)a4 priority:(int64_t)a5 options:(unint64_t)a6 block:(id)a7;
- (NSDate)date;
- (NSString)name;
- (OS_xpc_object)duetActivitySchedulerData;
- (double)gracePeriod;
- (id)activityHandler;
- (id)block;
- (id)criteria;
- (int64_t)priority;
- (unint64_t)options;
- (void)handleActivity;
- (void)invalidate;
- (void)schedule;
- (void)setBlock:(id)a3;
- (void)setDate:(id)a3;
- (void)setDuetActivitySchedulerData:(id)a3;
- (void)setGracePeriod:(double)a3;
- (void)setName:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPriority:(int64_t)a3;
@end

@implementation FMXPCTimer

- (FMXPCTimer)initWithName:(id)a3 date:(id)a4 gracePeriod:(double)a5 priority:(int64_t)a6 options:(unint64_t)a7 block:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)FMXPCTimer;
  v17 = [(FMXPCTimer *)&v20 init];
  v18 = v17;
  if (v17)
  {
    [(FMXPCTimer *)v17 setName:v14];
    [(FMXPCTimer *)v18 setDate:v15];
    [(FMXPCTimer *)v18 setGracePeriod:a5];
    [(FMXPCTimer *)v18 setPriority:a6];
    [(FMXPCTimer *)v18 setOptions:a7];
    [(FMXPCTimer *)v18 setBlock:v16];
    [(FMXPCTimer *)v18 handleActivity];
  }

  return v18;
}

- (FMXPCTimer)initWithName:(id)a3 date:(id)a4 priority:(int64_t)a5 options:(unint64_t)a6 block:(id)a7
{
  return [(FMXPCTimer *)self initWithName:a3 date:a4 gracePeriod:a5 priority:a6 options:a7 block:0.0];
}

- (FMXPCTimer)initWithName:(id)a3 timeInterval:(double)a4 gracePeriod:(double)a5 priority:(int64_t)a6 options:(unint64_t)a7 block:(id)a8
{
  id v14 = (void *)MEMORY[0x1E4F1C9C8];
  id v15 = a8;
  id v16 = a3;
  v17 = [v14 dateWithTimeIntervalSinceNow:a4];
  v18 = [(FMXPCTimer *)self initWithName:v16 date:v17 gracePeriod:a6 priority:a7 options:v15 block:a5];

  return v18;
}

- (FMXPCTimer)initWithName:(id)a3 timeInterval:(double)a4 priority:(int64_t)a5 options:(unint64_t)a6 block:(id)a7
{
  v12 = (void *)MEMORY[0x1E4F1C9C8];
  id v13 = a7;
  id v14 = a3;
  id v15 = [v12 dateWithTimeIntervalSinceNow:a4];
  id v16 = [(FMXPCTimer *)self initWithName:v14 date:v15 gracePeriod:a5 priority:a6 options:v13 block:0.0];

  return v16;
}

- (void)schedule
{
  id v6 = [(FMXPCTimer *)self name];
  v3 = (const char *)[v6 UTF8String];
  v4 = [(FMXPCTimer *)self criteria];
  v5 = [(FMXPCTimer *)self activityHandler];
  xpc_activity_register(v3, v4, v5);
}

- (id)criteria
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [(FMXPCTimer *)self date];
  [v3 timeIntervalSinceNow];
  double v5 = v4;

  double v6 = 0.0;
  if (v5 >= 0.0) {
    double v6 = v5;
  }
  int64_t v7 = (uint64_t)v6;
  [(FMXPCTimer *)self gracePeriod];
  int64_t v9 = (uint64_t)v8;
  v10 = LogCategory_Unspecified();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 134218240;
    int64_t v28 = v7;
    __int16 v29 = 2048;
    int64_t v30 = v9;
    _os_log_impl(&dword_1B2FB9000, v10, OS_LOG_TYPE_DEFAULT, "FMXPCTimer: Scheduling XPC activity in %lld ~%llds grace.", (uint8_t *)&v27, 0x16u);
  }

  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v11, (const char *)*MEMORY[0x1E4F142F8], 0);
  xpc_dictionary_set_int64(v11, (const char *)*MEMORY[0x1E4F14170], v7);
  xpc_dictionary_set_int64(v11, (const char *)*MEMORY[0x1E4F141A8], v9);
  int64_t v12 = [(FMXPCTimer *)self priority];
  id v13 = (const char **)MEMORY[0x1E4F142E0];
  if (v12 != 1) {
    id v13 = (const char **)MEMORY[0x1E4F142D0];
  }
  xpc_dictionary_set_string(v11, (const char *)*MEMORY[0x1E4F142C8], *v13);
  char v14 = [(FMXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v11, (const char *)*MEMORY[0x1E4F142B0], v14 & 1);
  char v15 = [(FMXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v11, (const char *)*MEMORY[0x1E4F14348], (v15 & 4) != 0);
  char v16 = [(FMXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v11, (const char *)*MEMORY[0x1E4F14358], (v16 & 2) != 0);
  char v17 = [(FMXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v11, (const char *)*MEMORY[0x1E4F14370], (v17 & 8) != 0);
  if (([(FMXPCTimer *)self options] & 0x10) != 0)
  {
    v18 = (const char **)MEMORY[0x1E4F14310];
  }
  else if (([(FMXPCTimer *)self options] & 0x20) != 0)
  {
    v18 = (const char **)MEMORY[0x1E4F14318];
  }
  else
  {
    if (([(FMXPCTimer *)self options] & 0x40) == 0) {
      goto LABEL_15;
    }
    v18 = (const char **)MEMORY[0x1E4F14320];
  }
  if (*v18) {
    xpc_dictionary_set_BOOL(v11, *v18, 1);
  }
LABEL_15:
  char v19 = [(FMXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v11, (const char *)*MEMORY[0x1E4F14338], v19 < 0);
  unint64_t v20 = [(FMXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v11, (const char *)*MEMORY[0x1E4F14330], v20 & 0x100);
  __int16 v21 = [(FMXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v11, (const char *)*MEMORY[0x1E4F14138], (v21 & 0x200) != 0);
  __int16 v22 = [(FMXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v11, (const char *)*MEMORY[0x1E4F14250], (v22 & 0x400) != 0);
  __int16 v23 = [(FMXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v11, (const char *)*MEMORY[0x1E4F14168], (v23 & 0x800) != 0);
  __int16 v24 = [(FMXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v11, (const char *)*MEMORY[0x1E4F14188], (v24 & 0x1000) != 0);
  v25 = [(FMXPCTimer *)self duetActivitySchedulerData];
  if (v25) {
    xpc_dictionary_set_value(v11, (const char *)*MEMORY[0x1E4F14190], v25);
  }

  return v11;
}

- (void)invalidate
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = LogCategory_Unspecified();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double v4 = [(FMXPCTimer *)self name];
    int v7 = 138412290;
    double v8 = v4;
    _os_log_impl(&dword_1B2FB9000, v3, OS_LOG_TYPE_DEFAULT, "FMXPCTimer Unregistering XPC activity %@", (uint8_t *)&v7, 0xCu);
  }
  id v5 = [(FMXPCTimer *)self name];
  double v6 = (const char *)[v5 UTF8String];

  xpc_activity_unregister(v6);
}

- (id)activityHandler
{
  v3 = [(FMXPCTimer *)self name];
  objc_initWeak(&location, self);
  double v4 = [(FMXPCTimer *)self block];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __29__FMXPCTimer_activityHandler__block_invoke;
  v9[3] = &unk_1E6019530;
  id v10 = v3;
  id v5 = v3;
  objc_copyWeak(&v12, &location);
  id v11 = v4;
  id v6 = v4;
  int v7 = (void *)MEMORY[0x1B3EB3F00](v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v7;
}

void __29__FMXPCTimer_activityHandler__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  if (xpc_activity_should_defer(v3))
  {
    BOOL v4 = xpc_activity_set_state(v3, 3);
    id v5 = LogCategory_Unspecified();
    id v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v7;
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      __29__FMXPCTimer_activityHandler__block_invoke_cold_1(a1, v6);
    }
  }
  else
  {
    xpc_activity_state_t state = xpc_activity_get_state(v3);
    id v6 = xpc_activity_copy_criteria(v3);
    if (state == 2)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      BOOL v10 = xpc_activity_set_state(v3, 5);
      id v11 = NSString;
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = [MEMORY[0x1E4F29128] UUID];
      char v14 = [v13 UUIDString];
      char v15 = [v11 stringWithFormat:@"%@-%@", v12, v14];

      id v16 = v15;
      [v16 UTF8String];
      char v17 = (void *)os_transaction_create();
      if (WeakRetained)
      {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      else
      {
        char v19 = LogCategory_Unspecified();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
          __29__FMXPCTimer_activityHandler__block_invoke_cold_2(v19);
        }
      }
      unint64_t v20 = LogCategory_Unspecified();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v23 = v21;
        __int16 v24 = 1024;
        LODWORD(v25) = v10;
        _os_log_impl(&dword_1B2FB9000, v20, OS_LOG_TYPE_DEFAULT, "FMXPCTimer triggered. Updating to done so that it can be cleaned. success : %@ : %d", buf, 0x12u);
      }
    }
    else
    {
      WeakRetained = LogCategory_Unspecified();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        uint64_t v23 = v18;
        __int16 v24 = 2048;
        xpc_activity_state_t v25 = state;
        __int16 v26 = 2048;
        int v27 = v6;
        _os_log_impl(&dword_1B2FB9000, WeakRetained, OS_LOG_TYPE_DEFAULT, "FMXPCTimer %@ changed to state %ld with criteria %p", buf, 0x20u);
      }
    }
  }
}

- (void)handleActivity
{
  id v6 = [(FMXPCTimer *)self name];
  v3 = (const char *)[v6 UTF8String];
  BOOL v4 = (void *)*MEMORY[0x1E4F14158];
  id v5 = [(FMXPCTimer *)self activityHandler];
  xpc_activity_register(v3, v4, v5);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (double)gracePeriod
{
  return self->_gracePeriod;
}

- (void)setGracePeriod:(double)a3
{
  self->_gracePeriod = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (OS_xpc_object)duetActivitySchedulerData
{
  return self->_duetActivitySchedulerData;
}

- (void)setDuetActivitySchedulerData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duetActivitySchedulerData, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __29__FMXPCTimer_activityHandler__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
}

void __29__FMXPCTimer_activityHandler__block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B2FB9000, log, OS_LOG_TYPE_FAULT, "self went away in FPXPCTimer.activityHandler", v1, 2u);
}

@end