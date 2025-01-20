@interface ADBackgroundTaskRequest
- (ADBackgroundTaskRequest)initWithCriteria:(id)a3 ID:(id)a4 activity:(id)a5;
- (ADBackgroundTaskRequest)initWithID:(id)a3;
- (BOOL)allowBattery;
- (BOOL)continueTask;
- (BOOL)deferTask;
- (BOOL)finishTask;
- (BOOL)isCPUIntensive;
- (BOOL)isRepeating;
- (BOOL)performDeferralCheck;
- (BOOL)requireBuddyComplete;
- (BOOL)requireClassCData;
- (BOOL)requireSleep;
- (BOOL)requiresNetworkConnectivity;
- (BOOL)shouldDefer;
- (BOOL)taskCanContinueForTime:(id)a3;
- (BOOL)taskIsContinuing;
- (BOOL)taskIsDeferred;
- (NSDate)startDate;
- (NSString)priority;
- (NSString)requestIdentifier;
- (OS_xpc_object)activity;
- (OS_xpc_object)criteria;
- (double)getPropertyAsDouble:(id)a3;
- (id)copyBackgroundTaskAgentCriteria;
- (id)description;
- (id)dictionaryRepresentation;
- (id)getPropertyAsDate:(id)a3;
- (id)getPropertyAsString:(id)a3;
- (int64_t)backgroundTaskRetryCount;
- (int64_t)delay;
- (int64_t)getPropertyAsInteger:(id)a3;
- (int64_t)gracePeriod;
- (void)_backgroundDeferralCheck:(id)a3 completion:(id)a4;
- (void)endBackgroundDeferralCheck;
- (void)setActivity:(id)a3;
- (void)setAllowBattery:(BOOL)a3;
- (void)setBackgroundTaskRetryCount:(int64_t)a3;
- (void)setCriteria:(id)a3;
- (void)setDelay:(int64_t)a3;
- (void)setGracePeriod:(int64_t)a3;
- (void)setIsCPUIntensive:(BOOL)a3;
- (void)setIsRepeating:(BOOL)a3;
- (void)setPerformDeferralCheck:(BOOL)a3;
- (void)setPriority:(id)a3;
- (void)setPropertyAsDate:(id)a3 value:(id)a4;
- (void)setPropertyAsDouble:(id)a3 value:(double)a4;
- (void)setPropertyAsInteger:(id)a3 value:(int64_t)a4;
- (void)setPropertyAsString:(id)a3 value:(id)a4;
- (void)setRequireBuddyComplete:(BOOL)a3;
- (void)setRequireClassCData:(BOOL)a3;
- (void)setRequireSleep:(BOOL)a3;
- (void)setRequiresNetworkConnectivity:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)startBackgroundDeferralCheckForTime:(id)a3 completionHandler:(id)a4;
@end

@implementation ADBackgroundTaskRequest

- (ADBackgroundTaskRequest)initWithID:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ADBackgroundTaskRequest;
  v6 = [(ADBackgroundTaskRequest *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_requestIdentifier, a3);
    v8 = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
    criteria = v7->_criteria;
    v7->_criteria = v8;

    activity = v7->_activity;
    v7->_activity = 0;

    v7->_performDeferralCheck = 0;
    startDate = v7->_startDate;
    v7->_startDate = 0;

    xpc_dictionary_set_BOOL(v7->_criteria, (const char *)*MEMORY[0x1E4F142F8], 0);
    xpc_dictionary_set_BOOL(v7->_criteria, (const char *)*MEMORY[0x1E4F14138], 1);
    xpc_dictionary_set_string(v7->_criteria, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
    xpc_dictionary_set_BOOL(v7->_criteria, (const char *)*MEMORY[0x1E4F14340], 0);
    xpc_dictionary_set_int64(v7->_criteria, (const char *)*MEMORY[0x1E4F141A8], *MEMORY[0x1E4F14200]);
    [(ADBackgroundTaskRequest *)v7 setDelay:0];
    [(ADBackgroundTaskRequest *)v7 setRequiresNetworkConnectivity:1];
  }

  return v7;
}

- (ADBackgroundTaskRequest)initWithCriteria:(id)a3 ID:(id)a4 activity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ADBackgroundTaskRequest;
  v11 = [(ADBackgroundTaskRequest *)&v15 init];
  if (v11)
  {
    v12 = (OS_xpc_object *)xpc_copy(v8);
    criteria = v11->_criteria;
    v11->_criteria = v12;

    objc_storeStrong((id *)&v11->_requestIdentifier, a4);
    objc_storeStrong((id *)&v11->_activity, a5);
    v11->_performDeferralCheck = 0;
  }

  return v11;
}

- (void)setAllowBattery:(BOOL)a3
{
}

- (BOOL)allowBattery
{
  return xpc_dictionary_get_BOOL(self->_criteria, (const char *)*MEMORY[0x1E4F14138]);
}

- (void)setRequireSleep:(BOOL)a3
{
}

- (BOOL)requireSleep
{
  return xpc_dictionary_get_BOOL(self->_criteria, (const char *)*MEMORY[0x1E4F14340]);
}

- (void)setIsRepeating:(BOOL)a3
{
}

- (BOOL)isRepeating
{
  return xpc_dictionary_get_BOOL(self->_criteria, (const char *)*MEMORY[0x1E4F142F8]);
}

- (void)setIsCPUIntensive:(BOOL)a3
{
}

- (BOOL)isCPUIntensive
{
  return xpc_dictionary_get_BOOL(self->_criteria, (const char *)*MEMORY[0x1E4F14168]);
}

- (void)setRequireBuddyComplete:(BOOL)a3
{
}

- (BOOL)requireBuddyComplete
{
  return xpc_dictionary_get_BOOL(self->_criteria, (const char *)*MEMORY[0x1E4F14308]);
}

- (void)setRequireClassCData:(BOOL)a3
{
}

- (BOOL)requireClassCData
{
  return xpc_dictionary_get_BOOL(self->_criteria, (const char *)*MEMORY[0x1E4F14320]);
}

- (void)setRequiresNetworkConnectivity:(BOOL)a3
{
}

- (BOOL)requiresNetworkConnectivity
{
  return xpc_dictionary_get_BOOL(self->_criteria, (const char *)*MEMORY[0x1E4F14338]);
}

- (void)setBackgroundTaskRetryCount:(int64_t)a3
{
  criteria = self->_criteria;
  id v5 = (const char *)[@"kBackgroundTaskProperty_RetryCount" cStringUsingEncoding:4];
  xpc_dictionary_set_int64(criteria, v5, a3);
}

- (int64_t)backgroundTaskRetryCount
{
  criteria = self->_criteria;
  v3 = (const char *)[@"kBackgroundTaskProperty_RetryCount" cStringUsingEncoding:4];
  return xpc_dictionary_get_int64(criteria, v3);
}

- (void)setGracePeriod:(int64_t)a3
{
}

- (int64_t)gracePeriod
{
  return xpc_dictionary_get_int64(self->_criteria, (const char *)*MEMORY[0x1E4F141A8]);
}

- (NSString)priority
{
  string = xpc_dictionary_get_string(self->_criteria, (const char *)*MEMORY[0x1E4F142C8]);
  v3 = NSString;
  return (NSString *)[v3 stringWithCString:string encoding:4];
}

- (void)setPriority:(id)a3
{
  criteria = self->_criteria;
  v4 = (const char *)*MEMORY[0x1E4F142C8];
  id v5 = (const char *)[a3 cStringUsingEncoding:4];
  xpc_dictionary_set_string(criteria, v4, v5);
}

- (void)setDelay:(int64_t)a3
{
}

- (int64_t)delay
{
  return xpc_dictionary_get_int64(self->_criteria, (const char *)*MEMORY[0x1E4F14170]);
}

- (id)copyBackgroundTaskAgentCriteria
{
  return xpc_copy(self->_criteria);
}

- (BOOL)continueTask
{
  v2 = self;
  objc_sync_enter(v2);
  activity = v2->_activity;
  if (activity) {
    BOOL v4 = xpc_activity_set_state(activity, 4);
  }
  else {
    BOOL v4 = 0;
  }
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)taskIsContinuing
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = xpc_activity_get_state(v2->_activity) == 4;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)finishTask
{
  activity = self->_activity;
  if (activity) {
    LOBYTE(activity) = xpc_activity_set_state(activity, 5);
  }
  return (char)activity;
}

- (BOOL)shouldDefer
{
  v2 = self;
  objc_sync_enter(v2);
  activity = v2->_activity;
  if (activity) {
    BOOL should_defer = xpc_activity_should_defer(activity);
  }
  else {
    BOOL should_defer = 0;
  }
  objc_sync_exit(v2);

  return should_defer;
}

- (BOOL)deferTask
{
  v2 = self;
  objc_sync_enter(v2);
  activity = v2->_activity;
  if (activity) {
    BOOL v4 = xpc_activity_set_state(activity, 3);
  }
  else {
    BOOL v4 = 0;
  }
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)taskIsDeferred
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = xpc_activity_get_state(v2->_activity) == 3;
  objc_sync_exit(v2);

  return v3;
}

- (void)_backgroundDeferralCheck:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_time_t v8 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__ADBackgroundTaskRequest__backgroundDeferralCheck_completion___block_invoke;
  block[3] = &unk_1E68A0A78;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_after(v8, MEMORY[0x1E4F14428], block);
}

void __63__ADBackgroundTaskRequest__backgroundDeferralCheck_completion___block_invoke(uint64_t a1)
{
  v2 = +[ADServer workQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__ADBackgroundTaskRequest__backgroundDeferralCheck_completion___block_invoke_2;
  v4[3] = &unk_1E68A0A78;
  BOOL v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  [v2 addOperationWithBlock:v4];
}

void __63__ADBackgroundTaskRequest__backgroundDeferralCheck_completion___block_invoke_2(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 8) && ([*(id *)(a1 + 40) isEqualToDate:*(void *)(v2 + 40)] & 1) != 0)
  {
    objc_sync_exit(obj);

    int v3 = [*(id *)(a1 + 32) shouldDefer];
    BOOL v4 = *(void **)(a1 + 32);
    if (v3)
    {
      [v4 endBackgroundDeferralCheck];
      [*(id *)(a1 + 32) deferTask];
      uint64_t v5 = *(void *)(a1 + 48);
      if (v5)
      {
        id v6 = *(void (**)(void))(v5 + 16);
        v6();
      }
    }
    else
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      [v4 _backgroundDeferralCheck:v8 completion:v9];
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
    }
    objc_sync_exit(obj);
  }
}

- (void)startBackgroundDeferralCheckForTime:(id)a3 completionHandler:(id)a4
{
  id v6 = (NSDate *)a3;
  uint64_t v7 = self;
  id v10 = a4;
  objc_sync_enter(v7);
  v7->_performDeferralCheck = 1;
  startDate = v7->_startDate;
  v7->_startDate = v6;
  uint64_t v9 = v6;

  objc_sync_exit(v7);
  [(ADBackgroundTaskRequest *)v7 _backgroundDeferralCheck:v7->_startDate completion:v10];
}

- (BOOL)taskCanContinueForTime:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  BOOL v6 = ([v4 isEqualToDate:v5->_startDate] & 1) != 0
    && [(ADBackgroundTaskRequest *)v5 taskIsContinuing];
  objc_sync_exit(v5);

  return v6;
}

- (void)endBackgroundDeferralCheck
{
  id obj = self;
  objc_sync_enter(obj);
  obj->_performDeferralCheck = 0;
  startDate = obj->_startDate;
  obj->_startDate = 0;

  objc_sync_exit(obj);
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ADBackgroundTaskRequest;
  int v3 = [(ADBackgroundTaskRequest *)&v7 description];
  id v4 = (void *)MEMORY[0x1D25F3810](self->_criteria);
  uint64_t v5 = [NSString stringWithFormat:@"%@, id: %@, job: %s", v3, self->_requestIdentifier, v4];

  free(v4);
  return v5;
}

- (id)dictionaryRepresentation
{
  v15.receiver = self;
  v15.super_class = (Class)ADBackgroundTaskRequest;
  int v3 = [(ADBackgroundTaskRequest *)&v15 description];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v4 setObject:v3 forKey:@"RequestType"];
  [v4 setObject:self->_requestIdentifier forKey:@"id"];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  BOOL v6 = objc_msgSend(NSNumber, "numberWithLongLong:", -[ADBackgroundTaskRequest gracePeriod](self, "gracePeriod"));
  [v5 setValue:v6 forKey:@"GracePeriod"];

  objc_super v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[ADBackgroundTaskRequest backgroundTaskRetryCount](self, "backgroundTaskRetryCount"));
  [v5 setValue:v7 forKey:@"kBackgroundTaskProperty_RetryCount"];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithLongLong:", -[ADBackgroundTaskRequest delay](self, "delay"));
  [v5 setValue:v8 forKey:@"Delay"];

  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[ADBackgroundTaskRequest requiresNetworkConnectivity](self, "requiresNetworkConnectivity"));
  [v5 setObject:v9 forKey:@"RequireNetworkConnectivity"];

  id v10 = objc_msgSend(NSNumber, "numberWithBool:", -[ADBackgroundTaskRequest requireSleep](self, "requireSleep"));
  [v5 setObject:v10 forKey:@"RequireScreenSleep"];

  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[ADBackgroundTaskRequest isRepeating](self, "isRepeating"));
  [v5 setObject:v11 forKey:@"Repeating"];

  id v12 = objc_msgSend(NSNumber, "numberWithBool:", -[ADBackgroundTaskRequest allowBattery](self, "allowBattery"));
  [v5 setObject:v12 forKey:@"AllowBattery"];

  id v13 = [(ADBackgroundTaskRequest *)self priority];
  [v5 setObject:v13 forKey:@"Priority"];

  [v4 setObject:v5 forKey:@"job"];
  return v4;
}

- (void)setPropertyAsString:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (const char *)[v6 cStringUsingEncoding:4];
  id v9 = v7;
  id v10 = (const char *)[v9 cStringUsingEncoding:4];

  criteria = self->_criteria;
  xpc_dictionary_set_string(criteria, v8, v10);
}

- (id)getPropertyAsString:(id)a3
{
  string = xpc_dictionary_get_string(self->_criteria, (const char *)[a3 cStringUsingEncoding:4]);
  id v4 = NSString;
  return (id)[v4 stringWithCString:string encoding:4];
}

- (void)setPropertyAsInteger:(id)a3 value:(int64_t)a4
{
  id v6 = (const char *)[a3 cStringUsingEncoding:4];
  criteria = self->_criteria;
  xpc_dictionary_set_int64(criteria, v6, a4);
}

- (int64_t)getPropertyAsInteger:(id)a3
{
  id v4 = (const char *)[a3 cStringUsingEncoding:4];
  criteria = self->_criteria;
  return xpc_dictionary_get_int64(criteria, v4);
}

- (void)setPropertyAsDouble:(id)a3 value:(double)a4
{
  id v6 = (const char *)[a3 cStringUsingEncoding:4];
  criteria = self->_criteria;
  xpc_dictionary_set_double(criteria, v6, a4);
}

- (double)getPropertyAsDouble:(id)a3
{
  id v4 = (const char *)[a3 cStringUsingEncoding:4];
  criteria = self->_criteria;
  return xpc_dictionary_get_double(criteria, v4);
}

- (void)setPropertyAsDate:(id)a3 value:(id)a4
{
  id v6 = a3;
  [a4 timeIntervalSinceReferenceDate];
  -[ADBackgroundTaskRequest setPropertyAsDouble:value:](self, "setPropertyAsDouble:value:", v6);
}

- (id)getPropertyAsDate:(id)a3
{
  [(ADBackgroundTaskRequest *)self getPropertyAsDouble:a3];
  int v3 = (void *)MEMORY[0x1E4F1C9C8];
  return (id)objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (OS_xpc_object)criteria
{
  return self->_criteria;
}

- (void)setCriteria:(id)a3
{
}

- (BOOL)performDeferralCheck
{
  return self->_performDeferralCheck;
}

- (void)setPerformDeferralCheck:(BOOL)a3
{
  self->_performDeferralCheck = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

@end