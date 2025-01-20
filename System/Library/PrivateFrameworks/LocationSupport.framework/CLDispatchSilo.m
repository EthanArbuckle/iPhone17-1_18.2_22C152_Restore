@interface CLDispatchSilo
- (BOOL)inPermissiveMode;
- (BOOL)isSuspended;
- (CLDispatchSilo)initWithIdentifier:(id)a3;
- (CLDispatchSilo)initWithUnderlyingQueue:(id)a3;
- (CLDispatchSilo)initWithUnderlyingQueue:(id)a3 bePermissive:(BOOL)a4;
- (double)currentLatchedAbsoluteTimestamp;
- (id)debugDescription;
- (id)getTimeCoercibleVariantInstance;
- (id)initMain;
- (id)newTimer;
- (id)operationQueue;
- (id)queue;
- (void)_setLatchedAbsoluteTimestamp:(double)a3;
- (void)afterInterval:(double)a3 async:(id)a4;
- (void)assertInside;
- (void)assertOutside;
- (void)async:(id)a3;
- (void)heartBeat:(id)a3;
- (void)intendToSync;
- (void)resume;
- (void)suspend;
- (void)sync:(id)a3;
@end

@implementation CLDispatchSilo

- (void)assertInside
{
}

- (void)sync:(id)a3
{
  id v4 = a3;
  [(CLDispatchSilo *)self intendToSync];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A4549468;
  v7[3] = &unk_1E5B3E948;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)intendToSync
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (+[CLAutoCohortUtilities autoCohortingEnabled])
  {
    uint64_t v3 = dispatch_get_specific("dispatchSilo");
    if (v3)
    {
      id v4 = self;
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F50E0);
      }
      v5 = qword_1EB30CE68;
      if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEBUG))
      {
        id v6 = *(void **)(v3 + 8);
        v7 = *(void **)(v3 + 80);
        identifier = v4->super._identifier;
        cohortId = v4->_cohortId;
        *(_DWORD *)buf = 68290050;
        int v25 = 0;
        __int16 v26 = 2082;
        v27 = &unk_1A45670B7;
        __int16 v28 = 2114;
        v29 = v6;
        __int16 v30 = 2114;
        v31 = v7;
        __int16 v32 = 2114;
        v33 = identifier;
        __int16 v34 = 2114;
        v35 = cohortId;
        _os_log_impl(&dword_1A4540000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#Cohorting Intend to sync\", \"FromDispatchSilo\":%{public, location:escape_only}@, \"FromCohortId\":%{public, location:escape_only}@, \"ToDispatchSilo\":%{public, location:escape_only}@, \"ToCohortId\":%{public, location:escape_only}@}", buf, 0x3Au);
      }
      int v10 = [*(id *)(v3 + 80) intValue];
      if (v10 <= [(NSNumber *)v4->_cohortId intValue])
      {
        os_unfair_lock_lock((os_unfair_lock_t)&unk_1E964BBD8);
        v11 = [(id)v3 identifier];
        v12 = [(CLSilo *)v4 identifier];
        v23[1] = v12;
        v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
        BOOL v14 = +[CLAutoCohortUtilities isEdgeKnownToCauseCycle:v13];

        if (!v14)
        {
          v15 = sub_1A455F068();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            v16 = [(id)v3 identifier];
            v17 = [(CLSilo *)v4 identifier];
            *(_DWORD *)buf = 68289538;
            int v25 = 0;
            __int16 v26 = 2082;
            v27 = &unk_1A45670B7;
            __int16 v28 = 2114;
            v29 = v16;
            __int16 v30 = 2114;
            v31 = v17;
            _os_log_impl(&dword_1A4540000, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Cohorting Persist sync-get edge\", \"fromSiloIdentifier\":%{public, location:escape_only}@, \"toSiloIdentifier\":%{public, location:escape_only}@}", buf, 0x26u);
          }
          v18 = sub_1A455F068();
          if (os_signpost_enabled(v18))
          {
            v19 = [(id)v3 identifier];
            v20 = [(CLSilo *)v4 identifier];
            *(_DWORD *)buf = 68289538;
            int v25 = 0;
            __int16 v26 = 2082;
            v27 = &unk_1A45670B7;
            __int16 v28 = 2114;
            v29 = v19;
            __int16 v30 = 2114;
            v31 = v20;
            _os_signpost_emit_with_name_impl(&dword_1A4540000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Cohorting Persist sync-get edge", "{\"msg%{public}.0s\":\"#Cohorting Persist sync-get edge\", \"fromSiloIdentifier\":%{public, location:escape_only}@, \"toSiloIdentifier\":%{public, location:escape_only}@}", buf, 0x26u);
          }
          v21 = [(id)v3 identifier];
          v22 = [(CLSilo *)v4 identifier];
          +[CLAutoCohortUtilities persistEdgeFrom:v21 to:v22];

          _Exit(0);
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&unk_1E964BBD8);
      }
    }
  }
}

- (void)async:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A4543C88;
  v7[3] = &unk_1E5B3E948;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)queue
{
  return self->_queue;
}

- (CLDispatchSilo)initWithUnderlyingQueue:(id)a3 bePermissive:(BOOL)a4
{
  result = [(CLDispatchSilo *)self initWithUnderlyingQueue:a3];
  if (result) {
    result->_useCLPermissiveTimer = a4;
  }
  return result;
}

- (CLDispatchSilo)initWithUnderlyingQueue:(id)a3
{
  v5 = a3;
  id v6 = [NSString stringWithUTF8String:dispatch_queue_get_label(v5)];
  v10.receiver = self;
  v10.super_class = (Class)CLDispatchSilo;
  v7 = [(CLSilo *)&v10 initWithIdentifier:v6];
  id v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_queue, a3);
  }

  return v8;
}

- (void)assertOutside
{
}

- (void)afterInterval:(double)a3 async:(id)a4
{
  id v6 = a4;
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1A454A8FC;
  v10[3] = &unk_1E5B3E948;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_after(v7, queue, v10);
}

- (id)newTimer
{
  uint64_t v3 = [[CLDispatchTimerScheduler alloc] initWithDispatchSilo:self];
  if (self->_useCLPermissiveTimer) {
    id v4 = off_1E5B3E5D8;
  }
  else {
    id v4 = &off_1E5B3E600;
  }
  v5 = (void *)[objc_alloc(*v4) initInSilo:self withScheduler:v3];

  return v5;
}

- (id)initMain
{
  v5.receiver = self;
  v5.super_class = (Class)CLDispatchSilo;
  v2 = [(CLSilo *)&v5 initWithIdentifier:@"MainSilo"];
  uint64_t v3 = v2;
  if (v2) {
    objc_storeStrong((id *)&v2->_queue, MEMORY[0x1E4F14428]);
  }
  return v3;
}

- (BOOL)inPermissiveMode
{
  return self->_useCLPermissiveTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cohortId, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (CLDispatchSilo)initWithIdentifier:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v24 = 0;
  int v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_1A455EF84;
  __int16 v28 = sub_1A455EF94;
  dispatch_get_global_queue(0, 0);
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v5 = +[CLSilo globalConfiguration];
  id v6 = [v5 objectForKeyedSubscript:@"NameToCohortMap"];

  dispatch_time_t v7 = [v6 objectForKeyedSubscript:v4];
  if (v7
    || ([&unk_1EF7F87B8 containsObject:v4] & 1) == 0
    && ([v6 objectForKeyedSubscript:@"default"],
        (dispatch_time_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v20 = sub_1A455EF9C;
    v21 = &unk_1E5B3EAD0;
    id v8 = v7;
    id v22 = v8;
    v23 = &v24;
    uint64_t v9 = qword_1EB30CF20;
    objc_super v10 = v19;
    if (v9 != -1) {
      dispatch_once(&qword_1EB30CF20, &unk_1EF7F50C0);
    }
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB30CF00);
    v20((uint64_t)v10, (void *)qword_1EB30CF18);

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB30CF00);
  }
  else
  {
    id v8 = 0;
  }
  v18.receiver = self;
  v18.super_class = (Class)CLDispatchSilo;
  id v11 = [(CLSilo *)&v18 initWithIdentifier:v4];
  if (v11)
  {
    v12 = (const char *)[v4 UTF8String];
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create_with_target_V2(v12, v13, (dispatch_queue_t)v25[5]);
    v15 = (void *)*((void *)v11 + 7);
    *((void *)v11 + 7) = v14;

    objc_storeStrong((id *)v11 + 10, v8);
    dispatch_queue_set_specific(*((dispatch_queue_t *)v11 + 7), "dispatchSilo", v11, 0);
  }
  if (qword_1EB30CE70 != -1) {
    dispatch_once(&qword_1EB30CE70, &unk_1EF7F50E0);
  }
  v16 = qword_1EB30CE68;
  if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289538;
    int v31 = 0;
    __int16 v32 = 2082;
    v33 = &unk_1A45670B7;
    __int16 v34 = 2114;
    id v35 = v4;
    __int16 v36 = 2114;
    id v37 = v8;
    _os_log_impl(&dword_1A4540000, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Cohorting CohortId assignment for silo\", \"Silo\":%{public, location:escape_only}@, \"CohortId\":%{public, location:escape_only}@}", buf, 0x26u);
  }

  _Block_object_dispose(&v24, 8);
  return (CLDispatchSilo *)v11;
}

- (id)getTimeCoercibleVariantInstance
{
  v2 = [[CLTimeCoercibleDispatchSilo alloc] initWithUnderlyingQueue:self->_queue];
  return v2;
}

- (void)suspend
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_isQueueSuspended)
  {
    uint64_t v3 = sub_1A455F068();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      uint64_t v9 = &unk_1A45670B7;
      __int16 v10 = 2082;
      id v11 = "assert";
      __int16 v12 = 2081;
      v13 = "!_isQueueSuspended";
      _os_log_impl(&dword_1A4540000, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Intersilo currently does not support reference counting\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    id v4 = sub_1A455F068();
    if (os_signpost_enabled(v4))
    {
      *(_DWORD *)buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      uint64_t v9 = &unk_1A45670B7;
      __int16 v10 = 2082;
      id v11 = "assert";
      __int16 v12 = 2081;
      v13 = "!_isQueueSuspended";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Intersilo currently does not support reference counting", "{\"msg%{public}.0s\":\"Intersilo currently does not support reference counting\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    objc_super v5 = sub_1A455F068();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      uint64_t v9 = &unk_1A45670B7;
      __int16 v10 = 2082;
      id v11 = "assert";
      __int16 v12 = 2081;
      v13 = "!_isQueueSuspended";
      _os_log_impl(&dword_1A4540000, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Intersilo currently does not support reference counting\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    abort_report_np();
  }
  self->_isQueueSuspended = 1;
  queue = self->_queue;
  dispatch_suspend(queue);
}

- (void)resume
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_isQueueSuspended)
  {
    uint64_t v3 = sub_1A455F068();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      uint64_t v9 = &unk_1A45670B7;
      __int16 v10 = 2082;
      id v11 = "assert";
      __int16 v12 = 2081;
      v13 = "_isQueueSuspended";
      _os_log_impl(&dword_1A4540000, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Intersilo currently does not support reference counting\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    id v4 = sub_1A455F068();
    if (os_signpost_enabled(v4))
    {
      *(_DWORD *)buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      uint64_t v9 = &unk_1A45670B7;
      __int16 v10 = 2082;
      id v11 = "assert";
      __int16 v12 = 2081;
      v13 = "_isQueueSuspended";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Intersilo currently does not support reference counting", "{\"msg%{public}.0s\":\"Intersilo currently does not support reference counting\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    objc_super v5 = sub_1A455F068();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      uint64_t v9 = &unk_1A45670B7;
      __int16 v10 = 2082;
      id v11 = "assert";
      __int16 v12 = 2081;
      v13 = "_isQueueSuspended";
      _os_log_impl(&dword_1A4540000, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Intersilo currently does not support reference counting\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    abort_report_np();
  }
  dispatch_resume((dispatch_object_t)self->_queue);
  self->_isQueueSuspended = 0;
}

- (BOOL)isSuspended
{
  return self->_isQueueSuspended;
}

- (void)_setLatchedAbsoluteTimestamp:(double)a3
{
  if (self->super._currentLatchedAbsoluteTimestamp <= a3)
  {
    self->super._currentLatchedAbsoluteTimestamp = a3;
  }
  else
  {
    if (qword_1EB30CE70 != -1) {
      dispatch_once(&qword_1EB30CE70, &unk_1EF7F50E0);
    }
    uint64_t v3 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1A4540000, v3, OS_LOG_TYPE_DEFAULT, "#Warning Time should not be moved backwards; systems based on monotonic time (like CLTimer) will misbehave.",
        v4,
        2u);
    }
  }
}

- (double)currentLatchedAbsoluteTimestamp
{
  return self->super._currentLatchedAbsoluteTimestamp;
}

- (void)heartBeat:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A455F6AC;
  v7[3] = &unk_1E5B3E998;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)operationQueue
{
  [(CLDispatchSilo *)self assertInside];
  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    id v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    objc_super v5 = self->_operationQueue;
    self->_operationQueue = v4;

    id v6 = NSString;
    int v7 = [(CLSilo *)self identifier];
    id v8 = [v6 stringWithFormat:@"%@.NSOperationQueue", v7];
    [(NSOperationQueue *)self->_operationQueue setName:v8];

    [(NSOperationQueue *)self->_operationQueue setUnderlyingQueue:self->_queue];
    operationQueue = self->_operationQueue;
  }
  return operationQueue;
}

- (id)debugDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"CLDispatchSilo: %s", dispatch_queue_get_label((dispatch_queue_t)self->_queue));
}

@end