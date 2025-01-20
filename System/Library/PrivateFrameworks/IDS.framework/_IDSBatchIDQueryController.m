@interface _IDSBatchIDQueryController
- (BOOL)underLimit;
- (_IDSBatchIDQueryController)initWithService:(id)a3 delegate:(id)a4 queue:(id)a5 parent:(id)a6;
- (void)_calloutToDelegateWithResult:(id)a3 error:(id)a4;
- (void)_invalidateNextQueryTimer;
- (void)_nextQuery:(id)a3;
- (void)_scheduleNextQuery:(double)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setDestinations:(id)a3;
@end

@implementation _IDSBatchIDQueryController

- (_IDSBatchIDQueryController)initWithService:(id)a3 delegate:(id)a4 queue:(id)a5 parent:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!_IDSRunningInDaemon())
  {
    v39.receiver = self;
    v39.super_class = (Class)_IDSBatchIDQueryController;
    self = [(_IDSBatchIDQueryController *)&v39 init];
    if (!self) {
      goto LABEL_24;
    }
    uint64_t v17 = [v11 length];
    if (v17)
    {
      if (v12) {
        goto LABEL_9;
      }
    }
    else
    {
      v32 = +[IDSLogging IDQuery];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v38 = 0;
        _os_log_impl(&dword_19190B000, v32, OS_LOG_TYPE_DEFAULT, "No service name, bailing...", v38, 2u);
      }

      if (v12)
      {
LABEL_9:
        if (v13)
        {
          if (!v17) {
            goto LABEL_5;
          }
          objc_storeStrong((id *)&self->_serviceName, a3);
          v18 = [MEMORY[0x1E4F59E30] weakRefWithObject:v12];
          delegate = self->_delegate;
          self->_delegate = v18;

          objc_storeStrong((id *)&self->_queue, a5);
          v20 = [MEMORY[0x1E4F59E30] weakRefWithObject:v14];
          parent = self->_parent;
          self->_parent = v20;

          v22 = [NSString stringGUID];
          listenerID = self->_listenerID;
          self->_listenerID = v22;

          destinations = self->_destinations;
          self->_destinations = 0;

          destinationsToQuery = self->_destinationsToQuery;
          self->_destinationsToQuery = 0;

          self->_destinationsToQuerylock._os_unfair_lock_opaque = 0;
          nextQueryTimer = self->_nextQueryTimer;
          self->_nextQueryTimer = 0;

          timeOfDeath = self->_timeOfDeath;
          self->_timeOfDeath = 0;

          id v28 = objc_alloc(MEMORY[0x1E4F6B558]);
          v29 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
          v30 = [v29 objectForKey:@"batch-query-limit"];

          if (v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
            uint64_t v31 = [v30 integerValue];
          }
          else {
            uint64_t v31 = 60;
          }

          v34 = (void *)[v28 initWithLimit:v31 timeLimit:sub_191A25384()];
          id rateLimiter = self->_rateLimiter;
          self->_id rateLimiter = v34;

          self->_numberOfQueriesDone = 0;
          self->_isDead = 0;
          v36 = +[IDSIDQueryController sharedInstance];
          [v36 addDelegate:self forService:self->_serviceName listenerID:self->_listenerID queue:MEMORY[0x1E4F14428]];

LABEL_24:
          self = self;
          v16 = self;
          goto LABEL_25;
        }
LABEL_20:
        v15 = +[IDSLogging IDQuery];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v38 = 0;
          _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "No queue, bailing...", v38, 2u);
        }
        goto LABEL_4;
      }
    }
    v33 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_19190B000, v33, OS_LOG_TYPE_DEFAULT, "No delegate, bailing...", v38, 2u);
    }

    if (v13) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
  v15 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_191A2A590((uint64_t)self, v15);
  }
LABEL_4:

LABEL_5:
  v16 = 0;
LABEL_25:

  return v16;
}

- (void)dealloc
{
  [(_IDSBatchIDQueryController *)self _invalidateNextQueryTimer];
  v3.receiver = self;
  v3.super_class = (Class)_IDSBatchIDQueryController;
  [(_IDSBatchIDQueryController *)&v3 dealloc];
}

- (void)invalidate
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_super v3 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "Client request to invalidate: %@", (uint8_t *)&v5, 0xCu);
  }

  [(_IDSBatchIDQueryController *)self _invalidateNextQueryTimer];
  v4 = +[IDSIDQueryController sharedInstance];
  [v4 removeDelegate:self forService:self->_serviceName listenerID:self->_listenerID];
}

- (void)_scheduleNextQuery:(double)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v5 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    double v9 = a3;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "Scheduling next batch in %f", (uint8_t *)&v8, 0xCu);
  }

  v6 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__nextQuery_ selector:0 userInfo:0 repeats:a3];
  nextQueryTimer = self->_nextQueryTimer;
  self->_nextQueryTimer = v6;
}

- (void)setDestinations:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v4 = (NSArray *)a3;
  int v5 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v31 = v4;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "setDestinations %@", buf, 0xCu);
  }

  if (self->_isDead && sub_191A25978())
  {
    v6 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v7 = "We're dead, bailing";
LABEL_11:
      _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  if (self->_destinations == v4 || -[NSArray isEqualToArray:](v4, "isEqualToArray:"))
  {
    v6 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v7 = "Destinations are the same, bailing";
      goto LABEL_11;
    }
LABEL_21:

    goto LABEL_22;
  }
  int v8 = (NSArray *)[(NSArray *)v4 mutableCopy];
  destinations = self->_destinations;
  self->_destinations = v8;

  [(_IDSBatchIDQueryController *)self _invalidateNextQueryTimer];
  if ([(NSArray *)self->_destinations count])
  {
    timeOfDeath = self->_timeOfDeath;
    BOOL v11 = timeOfDeath != 0;
    if (!timeOfDeath)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      id v13 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
      id v14 = [v13 objectForKey:@"batch-query-time-to-live"];

      if (v14)
      {
        [v14 doubleValue];
        double v16 = v15;
      }
      else
      {
        double v16 = 120.0;
      }

      uint64_t v17 = (NSDate *)[v12 initWithTimeIntervalSinceNow:v16];
      v18 = self->_timeOfDeath;
      self->_timeOfDeath = v17;

      v19 = +[IDSLogging IDQuery];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = self->_timeOfDeath;
        *(_DWORD *)buf = 138412290;
        uint64_t v31 = v20;
        _os_log_impl(&dword_19190B000, v19, OS_LOG_TYPE_DEFAULT, "Setting time of death to %@", buf, 0xCu);
      }
    }
    os_unfair_lock_lock(&self->_destinationsToQuerylock);
    destinationsToQuery = self->_destinationsToQuery;
    self->_destinationsToQuery = 0;

    os_unfair_lock_unlock(&self->_destinationsToQuerylock);
    v22 = (void *)[(NSArray *)v4 copy];
    v23 = +[IDSIDQueryController sharedInstance];
    serviceName = self->_serviceName;
    listenerID = self->_listenerID;
    v25 = self->_destinations;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_191A25A00;
    v27[3] = &unk_1E572D980;
    v27[4] = self;
    id v28 = v22;
    BOOL v29 = v11;
    v6 = v22;
    [v23 currentIDStatusForDestinations:v25 service:serviceName listenerID:listenerID queue:MEMORY[0x1E4F14428] completionBlock:v27];

    goto LABEL_21;
  }
LABEL_22:
}

- (void)_nextQuery:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v4 = &off_1E5728000;
  int v5 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v44 = self;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, " * Next query timer hit: %@", buf, 0xCu);
  }

  [(_IDSBatchIDQueryController *)self _invalidateNextQueryTimer];
  v6 = [MEMORY[0x1E4F1C9C8] date];
  [v6 timeIntervalSinceDate:self->_timeOfDeath];
  if (v7 > 0.0 && sub_191A25978())
  {
    int v8 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v44 = self;
      _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "We're dead, not querying: %@", buf, 0xCu);
    }

    self->_isDead = 1;
    goto LABEL_42;
  }
  double v9 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  uint64_t v10 = [v9 objectForKey:@"batch-query-size"];

  if (v10) {
    int v11 = (int)(float)(int)[v10 intValue];
  }
  else {
    int v11 = 15;
  }
  int v37 = v11;

  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  p_destinationsToQuerylock = &self->_destinationsToQuerylock;
  os_unfair_lock_lock(&self->_destinationsToQuerylock);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v14 = self->_destinationsToQuery;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (!v15) {
    goto LABEL_29;
  }
  uint64_t v16 = v15;
  int v17 = 0;
  uint64_t v18 = *(void *)v40;
  v35 = &self->_destinationsToQuerylock;
  v36 = v6;
  while (2)
  {
    uint64_t v19 = 0;
    int v20 = v37;
    if (v17 > v37) {
      int v20 = v17;
    }
    uint64_t v21 = (v20 - v17);
    v17 += v16;
    do
    {
      if (*(void *)v40 != v18) {
        objc_enumerationMutation(v14);
      }
      uint64_t v22 = *(void *)(*((void *)&v39 + 1) + 8 * v19);
      if (![(_IDSBatchIDQueryController *)self underLimit])
      {
        v4 = &off_1E5728000;
        v23 = +[IDSLogging IDQuery];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v44 = self;
          v24 = "We've reached the max number of queries, not adding anymore: %@";
LABEL_27:
          _os_log_impl(&dword_19190B000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);
        }
LABEL_28:
        p_destinationsToQuerylock = v35;
        v6 = v36;

        goto LABEL_29;
      }
      if (v21 == v19)
      {
        v4 = &off_1E5728000;
        v23 = +[IDSLogging IDQuery];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v44 = self;
          v24 = "We've reached the max number of queries for this batch, not adding anymore: %@";
          goto LABEL_27;
        }
        goto LABEL_28;
      }
      [v12 addObject:v22];
      [self->_rateLimiter noteItem:@"TTLItem"];
      ++self->_numberOfQueriesDone;
      ++v19;
    }
    while (v16 != v19);
    uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v39 objects:v47 count:16];
    p_destinationsToQuerylock = v35;
    v6 = v36;
    v4 = &off_1E5728000;
    if (v16) {
      continue;
    }
    break;
  }
LABEL_29:

  os_unfair_lock_unlock(p_destinationsToQuerylock);
  if ([v12 count])
  {
    v25 = +[IDSIDQueryController sharedInstance];
    serviceName = self->_serviceName;
    listenerID = self->_listenerID;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = sub_191A26288;
    v38[3] = &unk_1E572D9A8;
    v38[4] = self;
    [v25 refreshIDStatusForDestinations:v12 service:serviceName listenerID:listenerID queue:MEMORY[0x1E4F14428] errorCompletionBlock:v38];

    os_unfair_lock_lock(p_destinationsToQuerylock);
    [(NSMutableArray *)self->_destinationsToQuery removeObjectsInArray:v12];
    os_unfair_lock_unlock(p_destinationsToQuerylock);
    if ([(_IDSBatchIDQueryController *)self underLimit])
    {
      [(_IDSBatchIDQueryController *)self _scheduleNextQuery:sub_191A25CF4()];
    }
    else
    {
      int v28 = sub_191A25978();
      BOOL v29 = [v4[189] IDQuery];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = @"YES";
        if (v28) {
          v30 = @"NO";
        }
        *(_DWORD *)buf = 138412546;
        v44 = (_IDSBatchIDQueryController *)v30;
        __int16 v45 = 2112;
        v46 = self;
        _os_log_impl(&dword_19190B000, v29, OS_LOG_TYPE_DEFAULT, "We've reached the max number of queries, possibly deferring queries: %@ %@", buf, 0x16u);
      }

      if ((v28 & 1) == 0)
      {
        [self->_rateLimiter timeToUnderLimit:@"TTLItem"];
        double v32 = v31;
        double v33 = sub_191A25384();
        if (v32 >= v33) {
          double v33 = v32;
        }
        [(_IDSBatchIDQueryController *)self _scheduleNextQuery:v33];
      }
      v34 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IDSIDQueryControllerErrorDomain" code:-4000 userInfo:0];
      [(_IDSBatchIDQueryController *)self _calloutToDelegateWithResult:0 error:v34];
    }
  }

LABEL_42:
}

- (void)_invalidateNextQueryTimer
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_super v3 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating next query timer: %@", (uint8_t *)&v5, 0xCu);
  }

  [(NSTimer *)self->_nextQueryTimer invalidate];
  nextQueryTimer = self->_nextQueryTimer;
  self->_nextQueryTimer = 0;
}

- (void)_calloutToDelegateWithResult:(id)a3 error:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(CUTWeakReference *)self->_delegate object];
  double v9 = v8;
  if (v8 && (uint64_t v10 = self->_queue) != 0)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_191A265F0;
    v13[3] = &unk_1E5729680;
    id v14 = v8;
    id v15 = v6;
    uint64_t v16 = self;
    id v17 = v7;
    dispatch_async(v10, v13);

    int v11 = v14;
  }
  else
  {
    int v11 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      queue = self->_queue;
      *(_DWORD *)buf = 134218240;
      uint64_t v19 = v9;
      __int16 v20 = 2048;
      uint64_t v21 = queue;
      _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "No delegate %p or queue %p", buf, 0x16u);
    }
  }
}

- (BOOL)underLimit
{
  if (sub_191A25978())
  {
    int numberOfQueriesDone = self->_numberOfQueriesDone;
    v4 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
    int v5 = [v4 objectForKey:@"batch-query-max"];

    if (v5) {
      int v6 = (int)(float)(int)[v5 intValue];
    }
    else {
      int v6 = 60;
    }

    return numberOfQueriesDone < v6;
  }
  else
  {
    id rateLimiter = self->_rateLimiter;
    return MEMORY[0x1F4181798](rateLimiter, sel_underLimitForItem_);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong(&self->_rateLimiter, 0);
  objc_storeStrong((id *)&self->_timeOfDeath, 0);
  objc_storeStrong((id *)&self->_nextQueryTimer, 0);
  objc_storeStrong((id *)&self->_destinationsToQuery, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_listenerID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end