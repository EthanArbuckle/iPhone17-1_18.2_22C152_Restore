@interface ADWatchDogManager
+ (id)sharedInstance;
- (ADWatchDogManager)init;
- (BOOL)removeWatchdogWithToken:(id)a3;
- (BOOL)updateReason:(id)a3 forToken:(id)a4;
- (NSMutableDictionary)tokenCollection;
- (NSNumber)currentToken;
- (id)createNewWatchdog:(id)a3 withTimer:(unint64_t)a4;
- (id)getNextToken;
- (void)incrementToken;
- (void)setCurrentToken:(id)a3;
- (void)simulateCrash:(id)a3 becauseOf:(unint64_t)a4 actuallyTook:(double)a5;
@end

@implementation ADWatchDogManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__ADWatchDogManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken_2 != -1) {
    dispatch_once(&sharedInstance__onceToken_2, block);
  }
  v2 = (void *)sharedInstance__instance_2;
  return v2;
}

uint64_t __35__ADWatchDogManager_sharedInstance__block_invoke()
{
  sharedInstance__instance_2 = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

- (ADWatchDogManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)ADWatchDogManager;
  v2 = [(ADWatchDogManager *)&v10 init];
  v3 = v2;
  if (v2)
  {
    currentToken = v2->_currentToken;
    v2->_currentToken = (NSNumber *)&unk_1F2715328;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    tokenCollection = v3->_tokenCollection;
    v3->_tokenCollection = (NSMutableDictionary *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.queue.adplatforms.watchdog", 0);
    watchdogQueue = v3->_watchdogQueue;
    v3->_watchdogQueue = (OS_dispatch_queue *)v7;
  }
  return v3;
}

- (id)createNewWatchdog:(id)a3 withTimer:(unint64_t)a4
{
  id v6 = a3;
  dispatch_queue_t v7 = [(ADWatchDogManager *)self getNextToken];
  v8 = [NSString stringWithFormat:@"Creating a new watchdog with token %@ and waiting %lu seconds for: %@", v7, a4, v6];
  _ADLog(@"ToroLogging", v8, 0);

  v9 = [[ADWatchDog alloc] initWithReason:v6 andDelay:a4];
  objc_super v10 = self;
  objc_sync_enter(v10);
  [(NSMutableDictionary *)v10->_tokenCollection setObject:v9 forKey:v7];
  objc_sync_exit(v10);

  objc_initWeak(&location, v10);
  v11 = [MEMORY[0x1E4F1C9C8] date];
  dispatch_time_t v12 = dispatch_time(0, 1000000000 * a4);
  watchdogQueue = v10->_watchdogQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__ADWatchDogManager_createNewWatchdog_withTimer___block_invoke;
  block[3] = &unk_1E68A0AF8;
  objc_copyWeak(&v24, &location);
  id v14 = v7;
  id v21 = v14;
  id v22 = v11;
  id v23 = v6;
  id v15 = v6;
  id v16 = v11;
  dispatch_after(v12, watchdogQueue, block);
  v17 = v23;
  id v18 = v14;

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v18;
}

void __49__ADWatchDogManager_createNewWatchdog_withTimer___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v2 = [NSString stringWithFormat:@"Watchdog timer has been reached for token %@", *(void *)(a1 + 32)];
    _ADLog(@"ToroLogging", v2, 0);

    id v3 = WeakRetained;
    objc_sync_enter(v3);
    v4 = [v3 tokenCollection];
    uint64_t v5 = [v4 objectForKey:*(void *)(a1 + 32)];

    objc_sync_exit(v3);
    if (v5)
    {
      id v6 = [NSString stringWithFormat:@"ERROR: Token %@ has been found. We will now crash...", *(void *)(a1 + 32)];
      _ADLog(@"iAdInternalLogging", v6, 16);

      dispatch_queue_t v7 = [MEMORY[0x1E4F1C9C8] date];
      [v7 timeIntervalSinceDate:*(void *)(a1 + 40)];
      double v9 = v8;

      objc_super v10 = [v5 reason];
      objc_msgSend(v3, "simulateCrash:becauseOf:actuallyTook:", v10, objc_msgSend(v5, "delayTime"), v9);
    }
    else
    {
      objc_super v10 = [NSString stringWithFormat:@"'%@' has passed successfully. Removing watchdog %@.", *(void *)(a1 + 48), *(void *)(a1 + 32)];
      _ADLog(@"ToroLogging", v10, 0);
    }
  }
  else
  {
    uint64_t v5 = [NSString stringWithFormat:@"ERROR: weakSelf wasn't valid when completion handler called."];
    _ADLog(@"iAdInternalLogging", v5, 16);
  }
}

- (BOOL)removeWatchdogWithToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_tokenCollection objectForKey:v4];
  dispatch_queue_t v7 = v6;
  double v8 = NSString;
  if (v6)
  {
    double v9 = [v6 reason];
    objc_super v10 = [v8 stringWithFormat:@"Removing watchdog with token %@ that was started for %@", v4, v9];
    _ADLog(@"ToroLogging", v10, 0);

    [(NSMutableDictionary *)v5->_tokenCollection removeObjectForKey:v4];
  }
  else
  {
    v11 = [NSString stringWithFormat:@"WARNING: Watchdog token was not in list. Double remove? Please file a radar..."];
    _ADLog(@"iAdInternalLogging", v11, 16);
  }
  objc_sync_exit(v5);

  return v7 != 0;
}

- (BOOL)updateReason:(id)a3 forToken:(id)a4
{
  id v6 = a3;
  dispatch_queue_t v7 = [(NSMutableDictionary *)self->_tokenCollection objectForKey:a4];
  double v8 = v7;
  if (v7)
  {
    [v7 updateReason:v6];
  }
  else
  {
    double v9 = [NSString stringWithFormat:@"WARNING: Watchdog token was not in list. Cannot update its reason for existing. Please file a radar..."];
    _ADLog(@"iAdInternalLogging", v9, 16);
  }
  return v8 != 0;
}

- (void)simulateCrash:(id)a3 becauseOf:(unint64_t)a4 actuallyTook:(double)a5
{
  uint64_t v5 = [NSString stringWithFormat:@"Operation '%@' unable to complete within %lu seconds (crashed after %f seconds).", a3, a4, *(void *)&a5];
  ADSimulateCrash(2880291038, v5, 1);
}

- (void)incrementToken
{
  int v3 = [(NSNumber *)self->_currentToken intValue];
  self->_currentToken = [NSNumber numberWithInt:(v3 + 1)];
  MEMORY[0x1F41817F8]();
}

- (id)getNextToken
{
  v2 = self;
  objc_sync_enter(v2);
  int v3 = v2->_currentToken;
  [(ADWatchDogManager *)v2 incrementToken];
  objc_sync_exit(v2);

  return v3;
}

- (NSNumber)currentToken
{
  return self->_currentToken;
}

- (void)setCurrentToken:(id)a3
{
}

- (NSMutableDictionary)tokenCollection
{
  return self->_tokenCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenCollection, 0);
  objc_storeStrong((id *)&self->_currentToken, 0);
  objc_storeStrong((id *)&self->_watchdogQueue, 0);
}

@end