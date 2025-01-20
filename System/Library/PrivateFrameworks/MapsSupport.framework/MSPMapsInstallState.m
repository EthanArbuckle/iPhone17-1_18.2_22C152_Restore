@interface MSPMapsInstallState
+ (BOOL)isMapsAppInstalled;
+ (id)sharedState;
+ (void)setRunningInsideMapsApp;
- (BOOL)_fetchMapsAppInstallState;
- (BOOL)_isMapsAppInstalled;
- (MSPMapsInstallState)init;
- (void)dealloc;
- (void)receivedChangeNotification:(id)a3;
- (void)registerMapsInstallStateObserver:(id)a3;
- (void)unregisterMapsInstallStateObserver:(id)a3;
@end

@implementation MSPMapsInstallState

+ (BOOL)isMapsAppInstalled
{
  v2 = [a1 sharedState];
  char v3 = [v2 _isMapsAppInstalled];

  return v3;
}

- (BOOL)_isMapsAppInstalled
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_hasState)
  {
    BOOL mapsInstalled = v2->_mapsInstalled;
  }
  else
  {
    BOOL mapsInstalled = [(MSPMapsInstallState *)v2 _fetchMapsAppInstallState];
    v2->_BOOL mapsInstalled = mapsInstalled;
    v2->_hasState = 1;
  }
  objc_sync_exit(v2);

  return mapsInstalled;
}

+ (id)sharedState
{
  if (qword_1EB7F45F8 != -1) {
    dispatch_once(&qword_1EB7F45F8, &__block_literal_global_12);
  }
  v2 = (void *)_MergedGlobals_43;

  return v2;
}

+ (void)setRunningInsideMapsApp
{
  _sRunningInsideMapsApp = 1;
}

uint64_t __34__MSPMapsInstallState_sharedState__block_invoke()
{
  _MergedGlobals_43 = objc_alloc_init(MSPMapsInstallState);

  return MEMORY[0x1F41817F8]();
}

- (MSPMapsInstallState)init
{
  v8.receiver = self;
  v8.super_class = (Class)MSPMapsInstallState;
  v2 = [(MSPMapsInstallState *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F647B0]) initWithProtocol:&unk_1F1222D50 queue:0];
    installStateObservers = v2->_installStateObservers;
    v2->_installStateObservers = (GEOObserverHashTable *)v3;

    if (_sRunningInsideMapsApp == 1)
    {
      *(_WORD *)&v2->_BOOL mapsInstalled = 257;
    }
    else
    {
      *(_WORD *)&v2->_BOOL mapsInstalled = 0;
      v5 = [MEMORY[0x1E4F28C40] defaultCenter];
      [v5 addObserver:v2 selector:sel_receivedChangeNotification_ name:@"com.apple.LaunchServices.applicationRegistered" object:0];

      v6 = [MEMORY[0x1E4F28C40] defaultCenter];
      [v6 addObserver:v2 selector:sel_receivedChangeNotification_ name:@"com.apple.LaunchServices.applicationUnregistered" object:0];
    }
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self name:@"com.apple.LaunchServices.applicationRegistered" object:0];

  v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 removeObserver:self name:@"com.apple.LaunchServices.applicationUnregistered" object:0];

  v5.receiver = self;
  v5.super_class = (Class)MSPMapsInstallState;
  [(MSPMapsInstallState *)&v5 dealloc];
}

- (BOOL)_fetchMapsAppInstallState
{
  id v2 = objc_alloc(MEMORY[0x1E4F223C8]);
  uint64_t v3 = (void *)[v2 initWithBundleIdentifier:*MEMORY[0x1E4F64320] allowPlaceholder:0 error:0];
  v4 = [v3 applicationState];
  LOBYTE(v5) = 0;
  if ([v4 isInstalled])
  {
    v6 = [v3 applicationState];
    if ([v6 isValid])
    {
      v7 = [v3 applicationState];
      if ([v7 isRestricted])
      {
        LOBYTE(v5) = 0;
      }
      else
      {
        objc_super v8 = [v3 applicationState];
        int v5 = [v8 isPlaceholder] ^ 1;
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (void)receivedChangeNotification:(id)a3
{
  id v11 = a3;
  v4 = [v11 userInfo];
  int v5 = [v4 objectForKeyedSubscript:@"bundleIDs"];
  v6 = (void *)[v5 copy];

  v7 = [v4 objectForKeyedSubscript:@"isPlaceholder"];
  int v8 = [v7 BOOLValue];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (([v6 containsObject:*MEMORY[0x1E4F64320]] ^ 1 | v8) & 1) == 0)
  {
    v9 = self;
    objc_sync_enter(v9);
    uint64_t v10 = [(MSPMapsInstallState *)v9 _fetchMapsAppInstallState];
    v9->_BOOL mapsInstalled = v10;
    [(GEOObserverHashTable *)v9->_installStateObservers mapsInstallStateDidChange:v10];
    objc_sync_exit(v9);
  }
}

- (void)registerMapsInstallStateObserver:(id)a3
{
}

- (void)unregisterMapsInstallStateObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end