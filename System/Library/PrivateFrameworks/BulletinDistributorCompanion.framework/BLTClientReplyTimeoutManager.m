@interface BLTClientReplyTimeoutManager
- (BLTClientReplyTimeoutManager)initWithQueue:(id)a3;
- (BOOL)invalidateClientReplyTimeout:(id)a3;
- (SWWakingTimer)timer;
- (id)addClientReplyTimeoutForBulletin:(id)a3 sectionID:(id)a4 timeout:(double)a5 handler:(id)a6;
- (void)_handleClientReplyTimeout;
- (void)_invalidateClientReplyTimer;
- (void)_sortTimeouts;
- (void)_startClientReplyTimerWithFireDate:(id)a3;
- (void)_startNextClientReplyTimer;
- (void)dealloc;
- (void)extendClientReplyTimeout:(id)a3 additionalTime:(unint64_t)a4;
- (void)setTimer:(id)a3;
@end

@implementation BLTClientReplyTimeoutManager

- (BLTClientReplyTimeoutManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BLTClientReplyTimeoutManager;
  v6 = [(BLTClientReplyTimeoutManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    clientReplyTimeouts = v7->_clientReplyTimeouts;
    v7->_clientReplyTimeouts = (NSMutableArray *)v8;

    objc_storeStrong((id *)&v7->_queue, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(BLTClientReplyTimeoutManager *)self _invalidateClientReplyTimer];
  v3.receiver = self;
  v3.super_class = (Class)BLTClientReplyTimeoutManager;
  [(BLTClientReplyTimeoutManager *)&v3 dealloc];
}

- (void)_startNextClientReplyTimer
{
  [(BLTClientReplyTimeoutManager *)self _invalidateClientReplyTimer];
  if ([(NSMutableArray *)self->_clientReplyTimeouts count])
  {
    id v4 = [(NSMutableArray *)self->_clientReplyTimeouts objectAtIndexedSubscript:0];
    objc_super v3 = [v4 timeout];
    [(BLTClientReplyTimeoutManager *)self _startClientReplyTimerWithFireDate:v3];
  }
}

- (void)_startClientReplyTimerWithFireDate:(id)a3
{
  id v4 = a3;
  [(BLTClientReplyTimeoutManager *)self _invalidateClientReplyTimer];
  os_unfair_lock_lock(&self->_lock);
  objc_initWeak(&location, self);
  id v5 = (void *)[objc_alloc(MEMORY[0x263F7C4A8]) initWithIdentifier:@"com.apple.bulletindistributor.clientReplyTimeout"];
  [(BLTClientReplyTimeoutManager *)self setTimer:v5];

  v6 = [(BLTClientReplyTimeoutManager *)self timer];
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__BLTClientReplyTimeoutManager__startClientReplyTimerWithFireDate___block_invoke;
  v8[3] = &unk_264684970;
  objc_copyWeak(&v9, &location);
  [v6 scheduleForDate:v4 leewayInterval:queue queue:v8 handler:1.0];

  os_unfair_lock_unlock(&self->_lock);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __67__BLTClientReplyTimeoutManager__startClientReplyTimerWithFireDate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleClientReplyTimeout];
}

- (void)_invalidateClientReplyTimer
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(BLTClientReplyTimeoutManager *)self timer];
  [v4 invalidate];

  [(BLTClientReplyTimeoutManager *)self setTimer:0];
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)invalidateClientReplyTimeout:(id)a3
{
  uint64_t v4 = [(NSMutableArray *)self->_clientReplyTimeouts indexOfObject:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_clientReplyTimeouts removeObjectAtIndex:v4];
    if (!v4) {
      [(BLTClientReplyTimeoutManager *)self _startNextClientReplyTimer];
    }
  }
  return v4 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)extendClientReplyTimeout:(id)a3 additionalTime:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    if (a4)
    {
      objc_super v11 = v6;
      if ([(NSMutableArray *)self->_clientReplyTimeouts indexOfObject:v6] != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v7 = v11;
        uint64_t v8 = [v7 timeout];
        id v9 = [v8 dateByAddingTimeInterval:(double)a4];

        [v7 setTimeout:v9];
        [(BLTClientReplyTimeoutManager *)self _sortTimeouts];
        id v10 = [(NSMutableArray *)self->_clientReplyTimeouts objectAtIndexedSubscript:0];

        if (v10 == v7) {
          [(BLTClientReplyTimeoutManager *)self _startNextClientReplyTimer];
        }
      }
    }
  }
  MEMORY[0x270F9A758]();
}

- (void)_handleClientReplyTimeout
{
  if ([(NSMutableArray *)self->_clientReplyTimeouts count])
  {
    id v4 = [(NSMutableArray *)self->_clientReplyTimeouts objectAtIndexedSubscript:0];
    objc_super v3 = [v4 timeoutHandler];
    v3[2]();

    [(NSMutableArray *)self->_clientReplyTimeouts removeObjectAtIndex:0];
    [(BLTClientReplyTimeoutManager *)self _startNextClientReplyTimer];
  }
}

- (void)_sortTimeouts
{
  id v4 = [(NSMutableArray *)self->_clientReplyTimeouts firstObject];
  [(NSMutableArray *)self->_clientReplyTimeouts sortUsingComparator:&__block_literal_global_13];
  id v3 = [(NSMutableArray *)self->_clientReplyTimeouts firstObject];
  if (v4 != v3) {
    [(BLTClientReplyTimeoutManager *)self _startNextClientReplyTimer];
  }
}

uint64_t __45__BLTClientReplyTimeoutManager__sortTimeouts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 timeout];
  id v6 = [v4 timeout];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)addClientReplyTimeoutForBulletin:(id)a3 sectionID:(id)a4 timeout:(double)a5 handler:(id)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v12 = (void *)MEMORY[0x263EFF910];
  id v13 = a6;
  v14 = [v12 dateWithTimeIntervalSinceNow:a5];
  v15 = blt_general_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v18 = 138412802;
    v19 = v14;
    __int16 v20 = 2112;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v11;
    _os_log_impl(&dword_222F4C000, v15, OS_LOG_TYPE_INFO, "Add client reply timer (%@) for bulletin %@ in section %@", (uint8_t *)&v18, 0x20u);
  }

  v16 = objc_alloc_init(BLTClientReplyTimeout);
  [(BLTClientReplyTimeout *)v16 setTimeout:v14];
  [(BLTClientReplyTimeout *)v16 setTimeoutHandler:v13];

  [(NSMutableArray *)self->_clientReplyTimeouts addObject:v16];
  if ([(NSMutableArray *)self->_clientReplyTimeouts count] == 1) {
    [(BLTClientReplyTimeoutManager *)self _startNextClientReplyTimer];
  }
  else {
    [(BLTClientReplyTimeoutManager *)self _sortTimeouts];
  }

  return v16;
}

- (SWWakingTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientReplyTimeouts, 0);
}

@end