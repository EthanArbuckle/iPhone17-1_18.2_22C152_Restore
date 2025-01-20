@interface ATXWalletDataSourceSharedData
+ (id)sharedInstance;
- (ATXWalletDataSourceSharedData)init;
- (BOOL)hasEmptyWalletPasses;
- (void)_passesDidChange;
- (void)setHasEmptyWalletPasses:(BOOL)a3;
@end

@implementation ATXWalletDataSourceSharedData

- (BOOL)hasEmptyWalletPasses
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v4 = 0;
  if (v2->_hasEmptyWalletPasses)
  {
    [(NSDate *)v2->_lastWalletPassCheckDate timeIntervalSinceNow];
    if (fabs(v3) < 7200.0) {
      BOOL v4 = 1;
    }
  }
  objc_sync_exit(v2);

  return v4;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken1 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken1, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult;

  return v2;
}

void __47__ATXWalletDataSourceSharedData_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F43D0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;
}

- (ATXWalletDataSourceSharedData)init
{
  v5.receiver = self;
  v5.super_class = (Class)ATXWalletDataSourceSharedData;
  v2 = [(ATXWalletDataSourceSharedData *)&v5 init];
  if (v2)
  {
    double v3 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v3 addObserver:v2 selector:sel__passesDidChange name:*MEMORY[0x1E4F87550] object:0];
    [v3 addObserver:v2 selector:sel__passesDidChange name:*MEMORY[0x1E4F87570] object:0];
    [v3 addObserver:v2 selector:sel__passesDidChange name:*MEMORY[0x1E4F87568] object:0];
  }
  return v2;
}

- (void)_passesDidChange
{
  obj = self;
  objc_sync_enter(obj);
  lastWalletPassCheckDate = obj->_lastWalletPassCheckDate;
  obj->_lastWalletPassCheckDate = 0;

  obj->_hasEmptyWalletPasses = 0;
  objc_sync_exit(obj);
}

- (void)setHasEmptyWalletPasses:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_hasEmptyWalletPasses = a3;
  uint64_t v4 = objc_opt_new();
  lastWalletPassCheckDate = obj->_lastWalletPassCheckDate;
  obj->_lastWalletPassCheckDate = (NSDate *)v4;

  objc_sync_exit(obj);
}

- (void).cxx_destruct
{
}

@end