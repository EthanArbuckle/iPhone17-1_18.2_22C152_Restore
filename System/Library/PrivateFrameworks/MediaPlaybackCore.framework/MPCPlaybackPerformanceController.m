@interface MPCPlaybackPerformanceController
+ (MPCPlaybackPerformanceController)sharedController;
- (MPCPlaybackPerformanceController)init;
- (NSDate)lastCDNWarming;
- (NSString)deploymentID;
- (NSString)experimentID;
- (NSString)treatmentID;
- (id)sortedExperiments;
- (id)trialExperimentWithNamespaceName:(id)a3;
- (void)loadAVAssetWithURL:(id)a3;
- (void)markCDNConnectionWarmed;
- (void)setLastCDNWarming:(id)a3;
- (void)warmCDNConnection;
@end

@implementation MPCPlaybackPerformanceController

void __52__MPCPlaybackPerformanceController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(MPCPlaybackPerformanceController);
  v1 = (void *)sharedController___sharedController;
  sharedController___sharedController = (uint64_t)v0;
}

- (MPCPlaybackPerformanceController)init
{
  v8.receiver = self;
  v8.super_class = (Class)MPCPlaybackPerformanceController;
  v2 = [(MPCPlaybackPerformanceController *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    trialExperiments = v3->_trialExperiments;
    v3->_trialExperiments = (NSMutableDictionary *)v4;

    if ((_os_feature_enabled_impl() & 1) != 0
      || _os_feature_enabled_impl()
      && (MSVDeviceIsAudioAccessory() & 1) == 0
      && ICCurrentApplicationIsSystemApp())
    {
      v6 = [MEMORY[0x263EFA868] defaultController];
      [v6 permitReclamationWhileSuspended];
    }
  }
  return v3;
}

- (id)trialExperimentWithNamespaceName:(id)a3
{
  return 0;
}

+ (MPCPlaybackPerformanceController)sharedController
{
  if (sharedController_onceToken[0] != -1) {
    dispatch_once(sharedController_onceToken, &__block_literal_global_12181);
  }
  v2 = (void *)sharedController___sharedController;

  return (MPCPlaybackPerformanceController *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCDNWarming, 0);

  objc_storeStrong((id *)&self->_trialExperiments, 0);
}

- (void)setLastCDNWarming:(id)a3
{
}

- (NSDate)lastCDNWarming
{
  return self->_lastCDNWarming;
}

- (void)loadAVAssetWithURL:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "Warming asset CDN connection with URL: %@", buf, 0xCu);
  }

  v5 = [MEMORY[0x263EFA8D0] assetWithURL:v3];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__MPCPlaybackPerformanceController_loadAVAssetWithURL___block_invoke;
  v7[3] = &unk_2643C5FC8;
  id v8 = v5;
  id v6 = v5;
  [v6 loadValuesAsynchronouslyForKeys:&unk_26CC19568 completionHandler:v7];
}

void __55__MPCPlaybackPerformanceController_loadAVAssetWithURL___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_21BB87000, v2, OS_LOG_TYPE_DEFAULT, "Completed warming asset CDN connection with asset: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)markCDNConnectionWarmed
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v4 = [MEMORY[0x263EFF910] date];
  [(MPCPlaybackPerformanceController *)self setLastCDNWarming:v4];

  os_unfair_lock_unlock(p_lock);
}

- (void)warmCDNConnection
{
  uint64_t v3 = [(MPCPlaybackPerformanceController *)self trialExperimentWithNamespaceName:@"MUSIC_PLAYBACK_PERFORMANCE_WARMING_CDN"];
  if (v3)
  {
    int v4 = NSURL;
    id v18 = v3;
    uint64_t v5 = [v3 stringForFactor:@"assetURL1"];
    uint64_t v6 = [v4 URLWithString:v5];

    v7 = NSURL;
    id v8 = [v18 stringForFactor:@"assetURL2"];
    uint64_t v9 = [v7 URLWithString:v8];

    if (v6 | v9)
    {
      [v18 doubleForFactor:@"warmingInterval"];
      double v11 = v10;
      v12 = [MEMORY[0x263EFF910] date];
      os_unfair_lock_lock(&self->_lock);
      uint64_t v13 = [(MPCPlaybackPerformanceController *)self lastCDNWarming];
      if (v13
        && (v14 = (void *)v13,
            [(MPCPlaybackPerformanceController *)self lastCDNWarming],
            v15 = objc_claimAutoreleasedReturnValue(),
            [v12 timeIntervalSinceDate:v15],
            double v17 = v16,
            v15,
            v14,
            v17 <= v11))
      {
        os_unfair_lock_unlock(&self->_lock);
      }
      else
      {
        [(MPCPlaybackPerformanceController *)self setLastCDNWarming:v12];
        os_unfair_lock_unlock(&self->_lock);
        if (v6) {
          [(MPCPlaybackPerformanceController *)self loadAVAssetWithURL:v6];
        }
        if (v9) {
          [(MPCPlaybackPerformanceController *)self loadAVAssetWithURL:v9];
        }
      }
    }
    uint64_t v3 = v18;
  }
}

- (NSString)deploymentID
{
  v2 = [(MPCPlaybackPerformanceController *)self sortedExperiments];
  uint64_t v3 = objc_msgSend(v2, "msv_compactMap:", &__block_literal_global_16);

  if ([v3 count])
  {
    int v4 = [v3 componentsJoinedByString:@","];
  }
  else
  {
    int v4 = 0;
  }

  return (NSString *)v4;
}

uint64_t __48__MPCPlaybackPerformanceController_deploymentID__block_invoke(uint64_t a1, void *a2)
{
  return [a2 deploymentID];
}

- (NSString)treatmentID
{
  v2 = [(MPCPlaybackPerformanceController *)self sortedExperiments];
  uint64_t v3 = objc_msgSend(v2, "msv_compactMap:", &__block_literal_global_14_12167);

  if ([v3 count])
  {
    int v4 = [v3 componentsJoinedByString:@","];
  }
  else
  {
    int v4 = 0;
  }

  return (NSString *)v4;
}

uint64_t __47__MPCPlaybackPerformanceController_treatmentID__block_invoke(uint64_t a1, void *a2)
{
  return [a2 treatmentID];
}

- (NSString)experimentID
{
  v2 = [(MPCPlaybackPerformanceController *)self sortedExperiments];
  uint64_t v3 = objc_msgSend(v2, "msv_compactMap:", &__block_literal_global_11);

  if ([v3 count])
  {
    int v4 = [v3 componentsJoinedByString:@","];
  }
  else
  {
    int v4 = 0;
  }

  return (NSString *)v4;
}

uint64_t __48__MPCPlaybackPerformanceController_experimentID__block_invoke(uint64_t a1, void *a2)
{
  return [a2 experimentID];
}

- (id)sortedExperiments
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v4 = [(NSMutableDictionary *)self->_trialExperiments allValues];
  uint64_t v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_8];

  os_unfair_lock_unlock(p_lock);

  return v5;
}

uint64_t __53__MPCPlaybackPerformanceController_sortedExperiments__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 experimentID];
  uint64_t v6 = [v4 experimentID];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

@end