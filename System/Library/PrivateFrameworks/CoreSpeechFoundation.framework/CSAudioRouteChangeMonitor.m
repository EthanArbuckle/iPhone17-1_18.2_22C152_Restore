@interface CSAudioRouteChangeMonitor
+ (id)sharedInstance;
- (BOOL)carPlayConnected;
- (BOOL)jarvisConnected;
- (int64_t)hearstOwnership;
- (int64_t)hearstRouteStatus;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)getHearstOwnershipStatus:(id)a3;
- (void)getHearstRouteStatus:(id)a3;
- (void)getJarvisConnected:(id)a3;
- (void)routeIsDoAPSupportedWithRouteUID:(id)a3 withCompletion:(id)a4;
@end

@implementation CSAudioRouteChangeMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_10275 != -1) {
    dispatch_once(&sharedInstance_onceToken_10275, &__block_literal_global_10276);
  }
  v2 = (void *)sharedInstance_sharedInstance_10277;
  return v2;
}

- (void)routeIsDoAPSupportedWithRouteUID:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  v6 = [a3 componentsSeparatedByString:@"-"];
  v7 = [v6 firstObject];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__CSAudioRouteChangeMonitor_routeIsDoAPSupportedWithRouteUID_withCompletion___block_invoke;
  v14[3] = &unk_1E6200B88;
  id v8 = v5;
  id v15 = v8;
  uint64_t v9 = MEMORY[0x1BA9E7570](v14);
  v10 = (void *)v9;
  if (v7)
  {
    v11 = +[CSBluetoothManager sharedInstance];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77__CSAudioRouteChangeMonitor_routeIsDoAPSupportedWithRouteUID_withCompletion___block_invoke_2;
    v12[3] = &unk_1E6200BB0;
    id v13 = v10;
    [v11 getBTDeviceInfoWithBTAddressString:v7 withCompletion:v12];
  }
  else
  {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
  }
}

uint64_t __77__CSAudioRouteChangeMonitor_routeIsDoAPSupportedWithRouteUID_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 supportDoAP];
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

uint64_t __77__CSAudioRouteChangeMonitor_routeIsDoAPSupportedWithRouteUID_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __43__CSAudioRouteChangeMonitor_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_10277 = objc_alloc_init(CSAudioRouteChangeMonitorImpl);
  return MEMORY[0x1F41817F8]();
}

- (int64_t)hearstOwnership
{
}

- (void)getHearstOwnershipStatus:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[CSAudioRouteChangeMonitor getHearstOwnershipStatus:]", "CSAudioRouteChangeMonitor.m", 69, "NO");
}

- (BOOL)carPlayConnected
{
}

- (BOOL)jarvisConnected
{
}

- (void)getJarvisConnected:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[CSAudioRouteChangeMonitor getJarvisConnected:]", "CSAudioRouteChangeMonitor.m", 54, "NO");
}

- (int64_t)hearstRouteStatus
{
}

- (void)getHearstRouteStatus:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[CSAudioRouteChangeMonitor getHearstRouteStatus:]", "CSAudioRouteChangeMonitor.m", 44, "NO");
}

- (void)_stopMonitoring
{
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[CSAudioRouteChangeMonitor _startMonitoringWithQueue:]", "CSAudioRouteChangeMonitor.m", 36, "NO");
}

@end