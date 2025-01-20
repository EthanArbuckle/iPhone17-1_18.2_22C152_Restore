@interface GEONavdManager
+ (id)navdManager;
+ (id)navdManagerClientIdentifier:(id)a3;
+ (void)setProxyClass:(Class)a3;
- (GEONavdManager)init;
- (void)closeForClient:(id)a3;
- (void)didPostUINotification:(unint64_t)a3 forDestination:(id)a4 fromClient:(id)a5;
- (void)forceCacheRefresh;
- (void)onlyPerformLocalUpdatesForPlannedDestination:(id)a3 client:(id)a4;
- (void)openForClient:(id)a3;
- (void)requestRefreshForPlannedDestination:(id)a3 client:(id)a4;
- (void)shouldPostDarwinNotificationForNextUpdate:(BOOL)a3;
- (void)startMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5 handler:(id)a6;
- (void)statusWithCallback:(id)a3;
- (void)stopMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5;
@end

@implementation GEONavdManager

+ (id)navdManager
{
  if (qword_1EB2A07E8 != -1) {
    dispatch_once(&qword_1EB2A07E8, &__block_literal_global_206);
  }
  v2 = (void *)_MergedGlobals_339;

  return v2;
}

void __29__GEONavdManager_navdManager__block_invoke()
{
  v0 = objc_alloc_init(GEONavdManager);
  v1 = (void *)_MergedGlobals_339;
  _MergedGlobals_339 = (uint64_t)v0;
}

+ (void)setProxyClass:(Class)a3
{
  _proxyClass_2 = (uint64_t)a3;
}

+ (id)navdManagerClientIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [GEONavdClientInfo alloc];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);

  v7 = [(GEONavdClientInfo *)v4 initWithCanonicalName:v6 instanceId:v3];

  return v7;
}

- (GEONavdManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)GEONavdManager;
  v2 = [(GEONavdManager *)&v10 init];
  if (v2)
  {
    id v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    openers = v2->_openers;
    v2->_openers = v3;

    v2->_openersLock._os_unfair_lock_opaque = 0;
    v5 = (objc_class *)_proxyClass_2;
    if (!_proxyClass_2) {
      v5 = (objc_class *)GEONavdRemoteProxy;
    }
    v6 = (GEONavdServerProxy *)objc_alloc_init(v5);
    proxy = v2->_proxy;
    v2->_proxy = v6;

    v8 = v2;
  }

  return v2;
}

- (void)shouldPostDarwinNotificationForNextUpdate:(BOOL)a3
{
}

- (void)openForClient:(id)a3
{
  id v9 = a3;
  os_unfair_lock_lock_with_options();
  if ([(NSMutableArray *)self->_openers containsObject:v9])
  {
    os_unfair_lock_unlock(&self->_openersLock);
    v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3C8];
    v6 = [NSString stringWithFormat:@"Already open for client (%@)", v9];
    v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];
    [v7 raise];
  }
  uint64_t v8 = [(NSMutableArray *)self->_openers count];
  [(NSMutableArray *)self->_openers addObject:v9];
  os_unfair_lock_unlock(&self->_openersLock);
  if (!v8) {
    [(GEONavdServerProxy *)self->_proxy open];
  }
}

- (void)closeForClient:(id)a3
{
  p_openersLock = &self->_openersLock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_openers removeObject:v5];

  uint64_t v6 = [(NSMutableArray *)self->_openers count];
  os_unfair_lock_unlock(p_openersLock);
  if (!v6)
  {
    proxy = self->_proxy;
    [(GEONavdServerProxy *)proxy close];
  }
}

- (void)statusWithCallback:(id)a3
{
}

- (void)startMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5 handler:(id)a6
{
}

- (void)requestRefreshForPlannedDestination:(id)a3 client:(id)a4
{
}

- (void)onlyPerformLocalUpdatesForPlannedDestination:(id)a3 client:(id)a4
{
}

- (void)stopMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5
{
}

- (void)didPostUINotification:(unint64_t)a3 forDestination:(id)a4 fromClient:(id)a5
{
}

- (void)forceCacheRefresh
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openers, 0);

  objc_storeStrong((id *)&self->_proxy, 0);
}

@end