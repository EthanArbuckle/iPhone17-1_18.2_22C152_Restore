@interface BBObserverGatewayHolder
- (BBMaskedSet)observerFeedSet;
- (BBObserverClientProxy)gateway;
- (BBObserverGatewayHolder)initWithQueue:(id)a3 name:(id)a4;
- (BOOL)_invalidateTimeout:(id)a3;
- (NSString)name;
- (id)_addTimeout:(double)a3 forBulletinID:(id)a4 inSectionID:(id)a5 handler:(id)a6;
- (unint64_t)feed;
- (unint64_t)gatewayPriority;
- (void)_handleTimeout;
- (void)_invalidateTimer;
- (void)_startNextTimer;
- (void)_startTimerWithFireDate:(id)a3;
- (void)dealloc;
- (void)sendAddBulletin:(id)a3 playLightsAndSirens:(BOOL)a4 forFeeds:(unint64_t)a5 withTimeout:(double)a6 handler:(id)a7;
- (void)sendObserver:(id)a3 addBulletin:(id)a4 playLightsAndSirens:(BOOL)a5 forFeeds:(unint64_t)a6 withHandler:(id)a7;
- (void)sendObserversAddBulletin:(id)a3 playLightsAndSirens:(BOOL)a4 forFeeds:(unint64_t)a5;
- (void)setFeed:(unint64_t)a3;
- (void)setGateway:(id)a3;
- (void)setGatewayPriority:(unint64_t)a3;
- (void)setName:(id)a3;
@end

@implementation BBObserverGatewayHolder

- (BBObserverGatewayHolder)initWithQueue:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)BBObserverGatewayHolder;
  v9 = [(BBObserverGatewayHolder *)&v17 init];
  if (v9)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    timeouts = v9->_timeouts;
    v9->_timeouts = v10;

    uint64_t v12 = [v8 copy];
    name = v9->_name;
    v9->_name = (NSString *)v12;

    objc_storeStrong((id *)&v9->_queue, a3);
    v14 = [[BBMaskedSet alloc] initWithMaskBits:16];
    observerFeedSet = v9->_observerFeedSet;
    v9->_observerFeedSet = v14;
  }
  return v9;
}

- (void)_startNextTimer
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [(BBObserverGatewayHolder *)self _invalidateTimer];
  if ([(NSMutableArray *)self->_timeouts count])
  {
    v3 = [(NSMutableArray *)self->_timeouts objectAtIndexedSubscript:0];
    v4 = (void *)BBLogGateway;
    if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      v6 = [(BBObserverGatewayHolder *)self name];
      id v7 = [v3 timeout];
      id v8 = [v3 bulletinID];
      v9 = [v3 sectionID];
      int v11 = 138544130;
      uint64_t v12 = v6;
      __int16 v13 = 2114;
      v14 = v7;
      __int16 v15 = 2114;
      v16 = v8;
      __int16 v17 = 2114;
      v18 = v9;
      _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "Gateway %{public}@ start timer (%{public}@) for out for bulletin %{public}@ in section %{public}@", (uint8_t *)&v11, 0x2Au);
    }
    v10 = [v3 timeout];
    [(BBObserverGatewayHolder *)self _startTimerWithFireDate:v10];
  }
}

- (void)_startTimerWithFireDate:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F5D400];
  id v5 = a3;
  v6 = (PCPersistentTimer *)[[v4 alloc] initWithFireDate:v5 serviceIdentifier:@"com.apple.bulletinboard.identityqueue.gatewayholdertimeout" target:self selector:sel__handleTimeout userInfo:0];

  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = v6;

  [(PCPersistentTimer *)self->_timeoutTimer setMinimumEarlyFireProportion:1.0];
  [(PCPersistentTimer *)self->_timeoutTimer setUserVisible:1];
  queue = self->_queue;
  id v8 = self->_timeoutTimer;
  [(PCPersistentTimer *)v8 scheduleInQueue:queue];
}

- (void)_invalidateTimer
{
  [(PCPersistentTimer *)self->_timeoutTimer invalidate];
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = 0;
}

- (BOOL)_invalidateTimeout:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(NSMutableArray *)self->_timeouts indexOfObject:v4];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = (void *)BBLogGateway;
    if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      id v8 = [(BBObserverGatewayHolder *)self name];
      v9 = [v4 timeout];
      v10 = [v4 bulletinID];
      int v11 = [v4 sectionID];
      int v13 = 138544130;
      v14 = v8;
      __int16 v15 = 2114;
      v16 = v9;
      __int16 v17 = 2114;
      v18 = v10;
      __int16 v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_217675000, v7, OS_LOG_TYPE_DEFAULT, "Gateway %{public}@ invalidated timer (%{public}@) for out for bulletin %{public}@ in section %{public}@", (uint8_t *)&v13, 0x2Au);
    }
    [(NSMutableArray *)self->_timeouts removeObjectAtIndex:v5];
    if (!v5) {
      [(BBObserverGatewayHolder *)self _startNextTimer];
    }
  }

  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_handleTimeout
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ([(NSMutableArray *)self->_timeouts count])
  {
    v3 = [(NSMutableArray *)self->_timeouts objectAtIndexedSubscript:0];
    id v4 = (void *)BBLogGateway;
    if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = v4;
      v6 = [(BBObserverGatewayHolder *)self name];
      id v7 = [v3 bulletinID];
      id v8 = [v3 sectionID];
      int v10 = 138543874;
      int v11 = v6;
      __int16 v12 = 2114;
      int v13 = v7;
      __int16 v14 = 2114;
      __int16 v15 = v8;
      _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "Gateway %{public}@ timed out for bulletin %{public}@ in section %{public}@", (uint8_t *)&v10, 0x20u);
    }
    v9 = [v3 timeoutHandler];
    v9[2]();

    [(NSMutableArray *)self->_timeouts removeObjectAtIndex:0];
    [(BBObserverGatewayHolder *)self _startNextTimer];
  }
}

- (id)_addTimeout:(double)a3 forBulletinID:(id)a4 inSectionID:(id)a5 handler:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  __int16 v12 = (void *)MEMORY[0x263EFF910];
  id v13 = a6;
  __int16 v14 = [v12 dateWithTimeIntervalSinceNow:a3];
  __int16 v15 = (void *)BBLogGateway;
  if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = v15;
    __int16 v17 = [(BBObserverGatewayHolder *)self name];
    int v20 = 138544130;
    uint64_t v21 = v17;
    __int16 v22 = 2114;
    v23 = v14;
    __int16 v24 = 2114;
    id v25 = v10;
    __int16 v26 = 2114;
    id v27 = v11;
    _os_log_impl(&dword_217675000, v16, OS_LOG_TYPE_DEFAULT, "Gateway %{public}@ add timer (%{public}@) for bulletin %{public}@ in section %{public}@", (uint8_t *)&v20, 0x2Au);
  }
  v18 = objc_alloc_init(BBObserverGatewayAddBulletinRequest);
  [(BBObserverGatewayAddBulletinRequest *)v18 setTimeout:v14];
  [(BBObserverGatewayAddBulletinRequest *)v18 setTimeoutHandler:v13];

  [(BBObserverGatewayAddBulletinRequest *)v18 setBulletinID:v10];
  [(BBObserverGatewayAddBulletinRequest *)v18 setSectionID:v11];
  [(NSMutableArray *)self->_timeouts addObject:v18];
  if ([(NSMutableArray *)self->_timeouts count] == 1) {
    [(BBObserverGatewayHolder *)self _startNextTimer];
  }

  return v18;
}

- (void)sendAddBulletin:(id)a3 playLightsAndSirens:(BOOL)a4 forFeeds:(unint64_t)a5 withTimeout:(double)a6 handler:(id)a7
{
  BOOL v10 = a4;
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a7;
  v34 = [v12 bulletinID];
  v33 = [v12 sectionID];
  unint64_t v14 = self->_feed & a5;
  __int16 v15 = (void *)BBLogGateway;
  BOOL v16 = os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v10)
    {
      if (v16)
      {
        __int16 v17 = v15;
        v18 = [(BBObserverGatewayHolder *)self name];
        __int16 v19 = "WITH";
        *(_DWORD *)buf = 138544386;
        *(void *)&buf[4] = v18;
        if (!v13) {
          __int16 v19 = "WITHOUT";
        }
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v34;
        *(_WORD *)&buf[22] = 2114;
        v51 = v33;
        __int16 v52 = 2048;
        double v53 = a6;
        __int16 v54 = 2082;
        v55 = v19;
        _os_log_impl(&dword_217675000, v17, OS_LOG_TYPE_DEFAULT, "Gateway %{public}@ sending add bulletin lights and sirens YES for %{public}@ in section %{public}@ with timeout %f %{public}s handler", buf, 0x34u);
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      LOBYTE(v51) = 0;
      objc_initWeak(&location, self);
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __92__BBObserverGatewayHolder_sendAddBulletin_playLightsAndSirens_forFeeds_withTimeout_handler___block_invoke;
      v43[3] = &unk_2642974F0;
      objc_copyWeak(&v48, &location);
      id v20 = v34;
      id v44 = v20;
      id v21 = v33;
      id v45 = v21;
      v47 = buf;
      id v22 = v13;
      id v46 = v22;
      v23 = [(BBObserverGatewayHolder *)self _addTimeout:v20 forBulletinID:v21 inSectionID:v43 handler:a6];
      __int16 v24 = [(BBObserverGatewayHolder *)self gateway];
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __92__BBObserverGatewayHolder_sendAddBulletin_playLightsAndSirens_forFeeds_withTimeout_handler___block_invoke_42;
      v35[3] = &unk_264297518;
      objc_copyWeak(v42, &location);
      id v36 = v20;
      id v37 = v21;
      v41 = buf;
      id v25 = v23;
      id v38 = v25;
      id v39 = v12;
      v42[1] = (id)a5;
      id v40 = v22;
      [(BBObserverGatewayHolder *)self sendObserver:v24 addBulletin:v39 playLightsAndSirens:1 forFeeds:a5 withHandler:v35];

      objc_destroyWeak(v42);
      objc_destroyWeak(&v48);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);
      goto LABEL_16;
    }
    if (v16)
    {
      uint64_t v28 = v15;
      v29 = [(BBObserverGatewayHolder *)self name];
      v30 = [v12 bulletinID];
      v31 = [v12 sectionID];
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v29;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v30;
      *(_WORD *)&buf[22] = 2114;
      v51 = v31;
      _os_log_impl(&dword_217675000, v28, OS_LOG_TYPE_DEFAULT, "Gateway %{public}@ sending add bulletin lights and sirens NO for %{public}@ in section %{public}@ with NO timeout and NO handler", buf, 0x20u);
    }
    v32 = [(BBObserverGatewayHolder *)self gateway];
    [(BBObserverGatewayHolder *)self sendObserver:v32 addBulletin:v12 playLightsAndSirens:0 forFeeds:a5 withHandler:0];

    [(BBObserverGatewayHolder *)self sendObserversAddBulletin:v12 playLightsAndSirens:0 forFeeds:a5];
    if (v13) {
LABEL_15:
    }
      (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
  }
  else
  {
    if (v16)
    {
      __int16 v26 = v15;
      id v27 = [(BBObserverGatewayHolder *)self name];
      *(_DWORD *)buf = 138544130;
      *(void *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v34;
      *(_WORD *)&buf[22] = 2114;
      v51 = v33;
      __int16 v52 = 2048;
      double v53 = *(double *)&a5;
      _os_log_impl(&dword_217675000, v26, OS_LOG_TYPE_DEFAULT, "Gateway %{public}@ will not handle add bulletin %{public}@ in section %{public}@ for feed %lu. It's not in a relevant feed.", buf, 0x2Au);
    }
    if (v13) {
      goto LABEL_15;
    }
  }
LABEL_16:
}

void __92__BBObserverGatewayHolder_sendAddBulletin_playLightsAndSirens_forFeeds_withTimeout_handler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v3 = (void *)BBLogGateway;
    if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      uint64_t v5 = [WeakRetained name];
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      int v9 = 138543874;
      BOOL v10 = v5;
      __int16 v11 = 2114;
      uint64_t v12 = v6;
      __int16 v13 = 2114;
      uint64_t v14 = v7;
      _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Gateway %{public}@ did NOT receive lights and sirens response for bulletin %{public}@ in section %{public}@", (uint8_t *)&v9, 0x20u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(uint64_t, void, void))(v8 + 16))(v8, 0, 0);
  }
}

void __92__BBObserverGatewayHolder_sendAddBulletin_playLightsAndSirens_forFeeds_withTimeout_handler___block_invoke_42(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (!WeakRetained)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  uint64_t v7 = (void *)BBLogGateway;
  if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    uint64_t v9 = [WeakRetained name];
    BOOL v10 = (void *)v9;
    __int16 v11 = "DID NOT";
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    *(_DWORD *)uint64_t v15 = 138544130;
    if (a2) {
      __int16 v11 = "DID";
    }
    *(void *)&v15[4] = v9;
    __int16 v16 = 2082;
    __int16 v17 = v11;
    __int16 v18 = 2114;
    uint64_t v19 = v12;
    __int16 v20 = 2114;
    uint64_t v21 = v13;
    _os_log_impl(&dword_217675000, v8, OS_LOG_TYPE_DEFAULT, "Gateway %{public}@ received %{public}s play lights and sirens for bulletin %{public}@ in section %{public}@", v15, 0x2Au);
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    [WeakRetained _invalidateTimeout:*(void *)(a1 + 48)];
    if ((a2 & 1) != 0 || [WeakRetained gatewayPriority] != 3) {
      objc_msgSend(WeakRetained, "sendObserversAddBulletin:playLightsAndSirens:forFeeds:", *(void *)(a1 + 56), a2, *(void *)(a1 + 88), *(void *)v15);
    }
LABEL_11:
    uint64_t v14 = *(void *)(a1 + 64);
    if (v14) {
      (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, a2, v5);
    }
  }
LABEL_13:
}

- (void)sendObserversAddBulletin:(id)a3 playLightsAndSirens:(BOOL)a4 forFeeds:(unint64_t)a5
{
  BOOL v6 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = [(BBMaskedSet *)self->_observerFeedSet objectsForMask:a5];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [(BBObserverGatewayHolder *)self sendObserver:*(void *)(*((void *)&v14 + 1) + 8 * v13++) addBulletin:v8 playLightsAndSirens:v6 forFeeds:a5 withHandler:0];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)sendObserver:(id)a3 addBulletin:(id)a4 playLightsAndSirens:(BOOL)a5 forFeeds:(unint64_t)a6 withHandler:(id)a7
{
  BOOL v9 = a5;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  long long v14 = [v12 bulletinID];
  uint64_t v15 = [v11 incrementedTransactionIDForBulletinID:v14];

  long long v16 = (void *)BBLogBulletinLife;
  if (os_log_type_enabled((os_log_t)BBLogBulletinLife, OS_LOG_TYPE_DEFAULT))
  {
    if (v9) {
      long long v17 = "YES";
    }
    else {
      long long v17 = "NO";
    }
    __int16 v18 = v16;
    uint64_t v19 = [v12 bulletinID];
    int v22 = 136446722;
    v23 = v17;
    __int16 v24 = 2048;
    uint64_t v25 = v15;
    __int16 v26 = 2114;
    id v27 = v19;
    _os_log_impl(&dword_217675000, v18, OS_LOG_TYPE_DEFAULT, "Sending add bulletin with lights and sirens %{public}s for transactionID %ld, bulletin %{public}@", (uint8_t *)&v22, 0x20u);
  }
  __int16 v20 = +[BBBulletinAddUpdate updateWithBulletin:v12 feeds:a6 shouldPlayLightsAndSirens:v9];
  uint64_t v21 = +[BBBulletinUpdateTransaction transactionWithBulletinUpdate:v20 transactionID:v15];
  [v11 updateBulletin:v21 withHandler:v13];
}

- (void)dealloc
{
  [(BBObserverGatewayHolder *)self _invalidateTimer];
  v3.receiver = self;
  v3.super_class = (Class)BBObserverGatewayHolder;
  [(BBObserverGatewayHolder *)&v3 dealloc];
}

- (BBObserverClientProxy)gateway
{
  return self->_gateway;
}

- (void)setGateway:(id)a3
{
}

- (unint64_t)gatewayPriority
{
  return self->_gatewayPriority;
}

- (void)setGatewayPriority:(unint64_t)a3
{
  self->_gatewayPriority = a3;
}

- (unint64_t)feed
{
  return self->_feed;
}

- (void)setFeed:(unint64_t)a3
{
  self->_feed = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BBMaskedSet)observerFeedSet
{
  return self->_observerFeedSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerFeedSet, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_gateway, 0);
  objc_storeStrong((id *)&self->_timeouts, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end