@interface APXPCActivity
+ (OS_dispatch_queue)activityQueue;
+ (id)_translateCriteria:(id)a3;
- (APXPCActivity)initWithDelegate:(id)a3;
- (APXPCActivityDelegate)delegate;
- (BOOL)_continueActivity;
- (BOOL)deferActivity;
- (BOOL)deferralCheckActive;
- (BOOL)finished;
- (BOOL)setActivityState:(int64_t)a3;
- (BOOL)shouldDefer;
- (NSString)taskID;
- (OS_xpc_object)activity;
- (void)_backgroundDeferralCheck;
- (void)_endDeferralCheck;
- (void)_registerActivityWithCriteria:(id)a3;
- (void)_startDeferralCheck;
- (void)cancel;
- (void)checkin;
- (void)schedule;
- (void)scheduleWithDelay:(int64_t)a3;
- (void)setActivity:(id)a3;
- (void)setDeferralCheckActive:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setTaskID:(id)a3;
@end

@implementation APXPCActivity

+ (OS_dispatch_queue)activityQueue
{
  if (qword_1EB7897B8 != -1) {
    dispatch_once(&qword_1EB7897B8, &unk_1F2E9CCB0);
  }
  v2 = (void *)qword_1EB7898B8;
  return (OS_dispatch_queue *)v2;
}

+ (id)_translateCriteria:(id)a3
{
  if (a3)
  {
    id v3 = [a3 translateCriteria];
  }
  else
  {
    id v3 = (id)*MEMORY[0x1E4F14158];
  }
  return v3;
}

- (APXPCActivity)initWithDelegate:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APXPCActivity;
  v6 = [(APXPCActivity *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    uint64_t v8 = [v5 taskID];
    taskID = v7->_taskID;
    v7->_taskID = (NSString *)v8;
  }
  return v7;
}

- (BOOL)_continueActivity
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(APXPCActivity *)v2 activity];

  if (v3)
  {
    if ([(APXPCActivity *)v2 setActivityState:4])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      v4 = APLogForCategory(0x33uLL);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        id v5 = (id)objc_opt_class();
        v6 = [(APXPCActivity *)v2 taskID];
        int v8 = 138478083;
        id v9 = v5;
        __int16 v10 = 2114;
        objc_super v11 = v6;
        _os_log_impl(&dword_1D70B2000, v4, OS_LOG_TYPE_ERROR, "[%{private}@]: Unable to continue task %{public}@ - terminating.", (uint8_t *)&v8, 0x16u);
      }
      [(APXPCActivity *)v2 finished];
      id v3 = [(APXPCActivity *)v2 delegate];
      [v3 terminateActivity:v2];

      LOBYTE(v3) = 0;
    }
  }
  objc_sync_exit(v2);

  return (char)v3;
}

- (void)checkin
{
}

- (void)schedule
{
  id v3 = [(APXPCActivity *)self delegate];
  v4 = [v3 criteria];
  id v5 = +[APXPCActivity _translateCriteria:v4];

  [(APXPCActivity *)self _registerActivityWithCriteria:v5];
}

- (void)scheduleWithDelay:(int64_t)a3
{
  id v5 = [(APXPCActivity *)self delegate];
  v6 = [v5 criteria];
  xpc_object_t xdict = +[APXPCActivity _translateCriteria:v6];

  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E4F14170], a3);
  [(APXPCActivity *)self _registerActivityWithCriteria:xdict];
}

- (void)_registerActivityWithCriteria:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v6 = APLogForCategory(0x33uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (id)objc_opt_class();
    int v8 = [(APXPCActivity *)v5 taskID];
    *(_DWORD *)buf = 138478339;
    id v15 = v7;
    __int16 v16 = 2114;
    v17 = v8;
    __int16 v18 = 2114;
    id v19 = v4;
    _os_log_impl(&dword_1D70B2000, v6, OS_LOG_TYPE_DEFAULT, "[%{private}@]: Scheduling XPC activity %{public}@ with criteria %{public}@", buf, 0x20u);
  }
  id v9 = [(APXPCActivity *)v5 taskID];
  __int16 v10 = (const char *)[v9 UTF8String];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1D70D70C4;
  v12[3] = &unk_1E6A6B9F8;
  v12[4] = v5;
  id v11 = v4;
  id v13 = v11;
  xpc_activity_register(v10, v11, v12);

  objc_sync_exit(v5);
}

- (BOOL)finished
{
  [(APXPCActivity *)self _endDeferralCheck];
  BOOL v3 = [(APXPCActivity *)self setActivityState:5];
  if (v3)
  {
    id v4 = [(APXPCActivity *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      v6 = [(APXPCActivity *)self delegate];
      [v6 activityHasFinished:self];
    }
  }
  return v3;
}

- (BOOL)setActivityState:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(APXPCActivity *)v4 activity];

  if (v5)
  {
    v6 = [(APXPCActivity *)v4 activity];
    LOBYTE(v5) = xpc_activity_set_state(v6, a3);

    if (v5)
    {
      id v7 = APLogForCategory(0x33uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = (id)objc_opt_class();
        id v9 = [(APXPCActivity *)v4 taskID];
        __int16 v10 = [NSNumber numberWithLong:a3];
        int v15 = 138478339;
        id v16 = v8;
        __int16 v17 = 2114;
        __int16 v18 = v9;
        __int16 v19 = 2114;
        uint64_t v20 = v10;
        _os_log_impl(&dword_1D70B2000, v7, OS_LOG_TYPE_INFO, "[%{private}@]: Setting activity %{public}@ to the %{public}@ state.", (uint8_t *)&v15, 0x20u);
      }
    }
    else
    {
      id v7 = APLogForCategory(0x33uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v11 = (id)objc_opt_class();
        uint64_t v12 = [(APXPCActivity *)v4 taskID];
        id v13 = [NSNumber numberWithLong:a3];
        int v15 = 138478339;
        id v16 = v11;
        __int16 v17 = 2114;
        __int16 v18 = v12;
        __int16 v19 = 2114;
        uint64_t v20 = v13;
        _os_log_impl(&dword_1D70B2000, v7, OS_LOG_TYPE_ERROR, "[%{private}@]: Failed to set activity %{public}@ to state %{public}@.", (uint8_t *)&v15, 0x20u);
      }
    }
  }
  objc_sync_exit(v4);

  return v5;
}

- (BOOL)shouldDefer
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(APXPCActivity *)v2 activity];

  if (v3)
  {
    id v4 = [(APXPCActivity *)v2 activity];
    LODWORD(v3) = xpc_activity_should_defer(v4);

    uint64_t v5 = APLogForCategory(0x33uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (id)objc_opt_class();
      uint64_t v7 = [(APXPCActivity *)v2 taskID];
      id v8 = (void *)v7;
      id v9 = @"is not";
      int v11 = 138478339;
      id v12 = v6;
      __int16 v13 = 2114;
      if (v3) {
        id v9 = @"will be";
      }
      uint64_t v14 = v7;
      __int16 v15 = 2114;
      id v16 = v9;
      _os_log_impl(&dword_1D70B2000, v5, OS_LOG_TYPE_DEFAULT, "[%{private}@]: Activity %{public}@ %{public}@ deferred.", (uint8_t *)&v11, 0x20u);
    }
  }
  objc_sync_exit(v2);

  return (char)v3;
}

- (BOOL)deferActivity
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(APXPCActivity *)self setActivityState:3];
  if (v3)
  {
    [(APXPCActivity *)self _endDeferralCheck];
  }
  else
  {
    id v4 = APLogForCategory(0x33uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = objc_opt_class();
      id v6 = v5;
      uint64_t v7 = [(APXPCActivity *)self taskID];
      int v10 = 138478083;
      int v11 = v5;
      __int16 v12 = 2114;
      __int16 v13 = v7;
      _os_log_impl(&dword_1D70B2000, v4, OS_LOG_TYPE_ERROR, "[%{private}@]: Unable to defer activity %{public}@ - terminating.", (uint8_t *)&v10, 0x16u);
    }
    [(APXPCActivity *)self finished];
    id v8 = [(APXPCActivity *)self delegate];
    [v8 terminateActivity:self];
  }
  return v3;
}

- (void)cancel
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(APXPCActivity *)self activity];

  if (v3)
  {
    id v4 = [(APXPCActivity *)self activity];
    unint64_t state = xpc_activity_get_state(v4);

    if (state <= 4 && ((1 << state) & 0x1A) != 0)
    {
      id v8 = [(APXPCActivity *)self taskID];
      xpc_activity_unregister((const char *)[v8 UTF8String]);
    }
    else
    {
      id v6 = APLogForCategory(0x33uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = [(APXPCActivity *)self taskID];
        *(_DWORD *)buf = 138543618;
        int v10 = v7;
        __int16 v11 = 2048;
        unint64_t v12 = state;
        _os_log_impl(&dword_1D70B2000, v6, OS_LOG_TYPE_ERROR, "Cannot cancel activity %{public}@ with state %ld", buf, 0x16u);
      }
    }
  }
}

- (void)_backgroundDeferralCheck
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(APXPCActivity *)v2 deferralCheckActive];
  objc_sync_exit(v2);

  if (v3)
  {
    dispatch_time_t v4 = dispatch_time(0, 2000000000);
    uint64_t v5 = +[APXPCActivity activityQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D70D7D58;
    block[3] = &unk_1E6A6B6D0;
    block[4] = v2;
    dispatch_after(v4, v5, block);
  }
}

- (void)_startDeferralCheck
{
  v2 = self;
  objc_sync_enter(v2);
  [(APXPCActivity *)v2 setDeferralCheckActive:1];
  objc_sync_exit(v2);

  MEMORY[0x1F4181798](v2, sel__backgroundDeferralCheck);
}

- (void)_endDeferralCheck
{
  obj = self;
  objc_sync_enter(obj);
  [(APXPCActivity *)obj setDeferralCheckActive:0];
  objc_sync_exit(obj);
}

- (APXPCActivityDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (BOOL)deferralCheckActive
{
  return self->_deferralCheckActive;
}

- (void)setDeferralCheckActive:(BOOL)a3
{
  self->_deferralCheckActive = a3;
}

- (NSString)taskID
{
  return self->_taskID;
}

- (void)setTaskID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskID, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end