@interface MRUSpatialAudioController
- (BOOL)isDeviceSpatialAudioSupported;
- (BOOL)isEnabled;
- (BOOL)isMultichannel;
- (BOOL)isMultichannelAvailable;
- (BOOL)isSpatialAudioActive;
- (MRNowPlayingAudioFormatController)audioFormatController;
- (MRUSpatialAccessibilityObserver)accessibilityObserver;
- (MRUSpatialAudioController)initWithOutputDeviceRouteController:(id)a3;
- (MRUSpatialAudioControllerDelegate)delegate;
- (MRUSpatialAudioMode)selectedMode;
- (MRUSystemOutputDeviceRouteController)outputDeviceRouteController;
- (MRUVolumeNowPlayingInfo)nowPlayingInfo;
- (NSArray)availableModes;
- (NSCache)cache;
- (NSString)description;
- (NSString)disabledDescription;
- (NSTimer)optimisticSpatialAudioActiveTimer;
- (id)localizedStringForRenderingMode:(int64_t)a3;
- (id)preferenceForBundleID:(id)a3 outputDevice:(id)a4;
- (id)preferencesForMode:(id)a3 previousPreferences:(id)a4;
- (int)accessoryStereoHFPStatus;
- (void)accessibilityHeadTrackChangedNotification;
- (void)dealloc;
- (void)expanseManagerDidJoinExpanseSession:(id)a3;
- (void)expanseManagerDidLeaveExpanseSession:(id)a3;
- (void)nowPlayingAudioFormatController:(id)a3 didChangeAudioFormatApplication:(id)a4;
- (void)nowPlayingAudioFormatController:(id)a3 didChangeAudioFormatContentInfo:(id)a4;
- (void)resetOptimisticSpatialAudioActive;
- (void)setAccessibilityObserver:(id)a3;
- (void)setAccessoryStereoHFPStatus:(int)a3;
- (void)setAudioFormatController:(id)a3;
- (void)setCache:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsDeviceSpatialAudioSupported:(BOOL)a3;
- (void)setOptimisticSpatialAudioActiveTimer:(id)a3;
- (void)setPreferences:(id)a3 forBundleID:(id)a4 outputDevice:(id)a5;
- (void)setSelectedMode:(id)a3;
- (void)startMonitoring;
- (void)startOptimisticSpatialAudioActive;
- (void)stopMonitoring;
- (void)stopOptimisticSpatialAudioActive;
- (void)systemOutputDeviceRouteControllerDidUpdateOutputDevices:(id)a3;
- (void)updateDeviceSpatialAudioSupported;
- (void)updateFaceTimeHeadTrackedSupported;
- (void)updateNowPlaying;
- (void)updateSpatialAudioModes;
@end

@implementation MRUSpatialAudioController

- (void)updateSpatialAudioModes
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v3 = [(MRNowPlayingAudioFormatController *)self->_audioFormatController audioFormatApplication];
  v4 = [(MRNowPlayingAudioFormatController *)self->_audioFormatController audioFormatContentInfo];
  v5 = [v4 bundleID];
  v6 = [(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController primaryOutputDeviceRoute];
  v37 = [(MRUSpatialAudioController *)self preferenceForBundleID:v5 outputDevice:v6];

  BOOL v7 = [(MRUSpatialAudioController *)self isSpatialAudioActive];
  if ([v3 isFaceTime]) {
    BOOL v8 = self->_accessoryStereoHFPStatus == 2;
  }
  else {
    BOOL v8 = 1;
  }
  if ([(MRUSpatialAccessibilityObserver *)self->_accessibilityObserver isHeadTrackingEnabled]) {
    int v9 = ![(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController isSplitRoute];
  }
  else {
    int v9 = 0;
  }
  if (!self->_isDeviceSpatialAudioSupported)
  {
    v13 = 0;
    v18 = 0;
    v15 = v37;
    goto LABEL_28;
  }
  v10 = (void *)MEMORY[0x1E4F1CA48];
  v11 = [[MRUSpatialAudioMode alloc] initWithType:0];
  v12 = [[MRUSpatialAudioMode alloc] initWithType:1];
  v13 = objc_msgSend(v10, "arrayWithObjects:", v11, v12, 0);

  if (v9)
  {
    v14 = [[MRUSpatialAudioMode alloc] initWithType:2 isEnabled:v8];
    [v13 addObject:v14];
  }
  v15 = v37;
  if (![(MRUSpatialAudioController *)self isMultichannel]
    && [v37 mode] == 3
    || ![v37 mode])
  {
    goto LABEL_26;
  }
  BOOL v16 = [v37 mode] == 1 && v7;
  if (!v16 || ([v37 isHeadTrackingEnabled] & v9 & 1) == 0)
  {
    if ([v37 mode] == 1 && v7)
    {
      uint64_t v17 = 1;
      goto LABEL_27;
    }
    if ([v37 mode] != 1)
    {
      if (([v37 isHeadTrackingEnabled] & v9) != 0) {
        uint64_t v17 = 2;
      }
      else {
        uint64_t v17 = 1;
      }
      goto LABEL_27;
    }
LABEL_26:
    uint64_t v17 = 0;
    goto LABEL_27;
  }
  uint64_t v17 = 2;
LABEL_27:
  v18 = [v13 objectAtIndexedSubscript:v17];
LABEL_28:
  v20 = self->_availableModes;
  v21 = (NSArray *)[v13 copy];
  availableModes = self->_availableModes;
  self->_availableModes = v21;

  v23 = self->_selectedMode;
  objc_storeStrong((id *)&self->_selectedMode, v18);
  if (![(NSArray *)v20 isEqualToArray:v13])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained spatialAudioController:self didChangeAvailableSpatialModes:self->_availableModes];
  }
  if (![(MRUSpatialAudioMode *)v23 isEqual:v18])
  {
    id v25 = objc_loadWeakRetained((id *)&self->_delegate);
    [v25 spatialAudioController:self didChangeSelectedSpatialMode:self->_selectedMode];
  }
  v26 = MCLogCategoryVolume();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = v3;
    uint64_t v28 = objc_opt_class();
    BOOL v33 = [(NSTimer *)self->_optimisticSpatialAudioActiveTimer isValid];
    BOOL isDeviceSpatialAudioSupported = self->_isDeviceSpatialAudioSupported;
    int accessoryStereoHFPStatus = self->_accessoryStereoHFPStatus;
    v36 = v23;
    BOOL v29 = [(MRUSpatialAccessibilityObserver *)self->_accessibilityObserver isHeadTrackingEnabled];
    v30 = v13;
    BOOL v31 = [(MRUSpatialAccessibilityObserver *)self->_accessibilityObserver isMonoAudioEnabled];
    BOOL v32 = [(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController isSplitRoute];
    *(_DWORD *)buf = 138545666;
    uint64_t v39 = v28;
    v3 = v27;
    v15 = v37;
    __int16 v40 = 2114;
    v41 = v37;
    __int16 v42 = 2114;
    v43 = v3;
    __int16 v44 = 2114;
    v45 = v4;
    __int16 v46 = 1024;
    BOOL v47 = v33;
    __int16 v48 = 1024;
    BOOL v49 = isDeviceSpatialAudioSupported;
    __int16 v50 = 1024;
    int v51 = accessoryStereoHFPStatus;
    __int16 v52 = 1024;
    BOOL v53 = v29;
    v23 = v36;
    __int16 v54 = 1024;
    BOOL v55 = v31;
    v13 = v30;
    __int16 v56 = 1024;
    BOOL v57 = v32;
    _os_log_impl(&dword_1AE7DF000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ update modes - pref: %{public}@ | application: %{public}@ | contentInfo: %{public}@ | OptActive: %{BOOL}u | Supported: %{BOOL}u | HFP: %{PUBLIC}i | HTAcess: %{BOOL}u | Mono: %{BOOL}u | split: %{BOOL}u", buf, 0x4Eu);
  }
}

- (NSArray)availableModes
{
  return self->_availableModes;
}

- (MRUVolumeNowPlayingInfo)nowPlayingInfo
{
  return self->_nowPlayingInfo;
}

- (MRUSpatialAudioMode)selectedMode
{
  return self->_selectedMode;
}

- (BOOL)isMultichannel
{
  v3 = [(MRNowPlayingAudioFormatController *)self->_audioFormatController audioFormatApplication];
  if ([v3 isFaceTime])
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    v5 = [(MRNowPlayingAudioFormatController *)self->_audioFormatController audioFormatContentInfo];
    if ([v5 isMultichannel]) {
      LOBYTE(v4) = 1;
    }
    else {
      BOOL v4 = ![(MRUSpatialAudioController *)self isEnabled];
    }
  }
  return v4;
}

- (BOOL)isEnabled
{
  v3 = [MEMORY[0x1E4F77038] sharedManager];
  char v4 = [v3 expanseSessionHasScreenSharingActivity];

  if (v4) {
    return 0;
  }
  v6 = [(MRNowPlayingAudioFormatController *)self->_audioFormatController audioFormatApplication];
  char v7 = [v6 isFaceTime];

  if (v7) {
    return 1;
  }
  BOOL v8 = [(MRNowPlayingAudioFormatController *)self->_audioFormatController audioFormatContentInfo];
  if ([v8 isEligibleForSpatialization])
  {
    int v9 = [(MRNowPlayingAudioFormatController *)self->_audioFormatController audioFormatContentInfo];
    v10 = [v9 audioFormatDescription];
    BOOL v5 = v10 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSString)disabledDescription
{
  return +[MRUStringsProvider spatialButtonNotAvailable];
}

- (void)nowPlayingAudioFormatController:(id)a3 didChangeAudioFormatApplication:(id)a4
{
  [(MRUSpatialAudioController *)self resetOptimisticSpatialAudioActive];
  [(MRUSpatialAudioController *)self updateSpatialAudioModes];

  [(MRUSpatialAudioController *)self updateNowPlaying];
}

- (void)nowPlayingAudioFormatController:(id)a3 didChangeAudioFormatContentInfo:(id)a4
{
  [(MRUSpatialAudioController *)self resetOptimisticSpatialAudioActive];
  [(MRUSpatialAudioController *)self updateSpatialAudioModes];

  [(MRUSpatialAudioController *)self updateNowPlaying];
}

- (void)resetOptimisticSpatialAudioActive
{
  [(NSTimer *)self->_optimisticSpatialAudioActiveTimer invalidate];
  optimisticSpatialAudioActiveTimer = self->_optimisticSpatialAudioActiveTimer;
  self->_optimisticSpatialAudioActiveTimer = 0;
}

- (void)updateNowPlaying
{
  id v15 = [(MRNowPlayingAudioFormatController *)self->_audioFormatController audioFormatApplication];
  v3 = [(MRNowPlayingAudioFormatController *)self->_audioFormatController audioFormatContentInfo];
  char v4 = [v15 bundleID];
  BOOL v5 = [(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController primaryOutputDeviceRoute];
  v6 = [(MRUSpatialAudioController *)self preferenceForBundleID:v4 outputDevice:v5];

  uint64_t v7 = [v3 renderingMode];
  if ([v15 isFaceTime])
  {
    uint64_t v8 = +[MRUStringsProvider spatialButtonTitle];
  }
  else if (self->_isDeviceSpatialAudioSupported || (unint64_t)(v7 - 3) > 2)
  {
    if ([(NSTimer *)self->_optimisticSpatialAudioActiveTimer isValid]
      && [(MRUSpatialAudioController *)self isMultichannel])
    {
      if ([v3 bestAvailableAudioFormat] == 2) {
        +[MRUStringsProvider bestAvailableAudioFormatAtmos];
      }
      else {
        +[MRUStringsProvider bestAvailableAudioFormatMulitchannel];
      }
    }
    else if ([v6 mode])
    {
      [v3 audioFormatDescription];
    }
    else
    {
      [v3 bestAvailableAudioFormatDescription];
    uint64_t v8 = };
  }
  else
  {
    uint64_t v8 = [(MRUSpatialAudioController *)self localizedStringForRenderingMode:v7];
  }
  int v9 = (void *)v8;
  if ([(MRUSpatialAudioController *)self isEnabled])
  {
    if (!self->_isDeviceSpatialAudioSupported && (unint64_t)(v7 - 3) >= 3) {
      goto LABEL_18;
    }
  }
  else if ((unint64_t)(v7 - 3) > 2)
  {
LABEL_18:
    v10 = 0;
    goto LABEL_21;
  }
  v11 = [MRUVolumeNowPlayingInfo alloc];
  v12 = [v15 bundleID];
  v13 = [v15 displayName];
  v10 = [(MRUVolumeNowPlayingInfo *)v11 initWithBundleID:v12 name:v13 formatDescription:v9];

LABEL_21:
  if (![(MRUVolumeNowPlayingInfo *)self->_nowPlayingInfo isEqual:v10])
  {
    objc_storeStrong((id *)&self->_nowPlayingInfo, v10);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained spatialAudioController:self didChangeNowPlayingInfo:v10];
  }
}

- (id)preferenceForBundleID:(id)a3 outputDevice:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  cache = self->_cache;
  id v8 = a4;
  int v9 = [(NSCache *)cache objectForKey:v6];
  v10 = [v8 logicalLeaderOutputDevice];

  if ([v10 deviceType] == 2)
  {
    v11 = [MEMORY[0x1E4F50B70] sharedInstance];
    v12 = [v10 uid];
    v13 = [v11 deviceFromAddressString:v12];

    unsigned int v22 = 0;
    unsigned __int8 v21 = 0;
    int v14 = [v13 spatialAudioConfig:v6 spatialMode:&v22 headTracking:&v21];
    if (v14)
    {
      id v15 = [MRUSpatialAudioPreferences alloc];
      uint64_t v16 = [(MRUSpatialAudioPreferences *)v15 initWithMode:v22 headTrackingEnabled:v21];

      [(NSCache *)self->_cache setObject:v16 forKey:v6];
      int v9 = (void *)v16;
    }
    uint64_t v17 = MCLogCategoryVolume();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = objc_opt_class();
      v19 = [v10 uid];
      *(_DWORD *)buf = 138544386;
      uint64_t v24 = v18;
      __int16 v25 = 2114;
      v26 = v9;
      __int16 v27 = 2114;
      id v28 = v6;
      __int16 v29 = 2114;
      v30 = v19;
      __int16 v31 = 1024;
      int v32 = v14;
      _os_log_impl(&dword_1AE7DF000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ retrieved preferences: %{public}@ for bundle id: %{public}@ | uid: %{public}@ | success: %{BOOL}u", buf, 0x30u);
    }
  }

  return v9;
}

- (BOOL)isSpatialAudioActive
{
  v3 = [(MRNowPlayingAudioFormatController *)self->_audioFormatController audioFormatContentInfo];
  char v4 = [(MRNowPlayingAudioFormatController *)self->_audioFormatController audioFormatApplication];
  BOOL v5 = ([v4 isFaceTime] & 1) != 0
    || ([v3 isSpatialized] & 1) != 0
    || [(NSTimer *)self->_optimisticSpatialAudioActiveTimer isValid];

  return v5;
}

- (MRUSpatialAudioController)initWithOutputDeviceRouteController:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MRUSpatialAudioController;
  id v6 = [(MRUSpatialAudioController *)&v16 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputDeviceRouteController, a3);
    [(MRUSystemOutputDeviceRouteController *)v7->_outputDeviceRouteController addObserver:v7];
    id v8 = (MRNowPlayingAudioFormatController *)objc_alloc_init(MEMORY[0x1E4F77078]);
    audioFormatController = v7->_audioFormatController;
    v7->_audioFormatController = v8;

    [(MRNowPlayingAudioFormatController *)v7->_audioFormatController setDelegate:v7];
    v10 = objc_alloc_init(MRUSpatialAccessibilityObserver);
    accessibilityObserver = v7->_accessibilityObserver;
    v7->_accessibilityObserver = v10;

    [(MRUSpatialAccessibilityObserver *)v7->_accessibilityObserver setDelegate:v7];
    v12 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    cache = v7->_cache;
    v7->_cache = v12;

    int v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v7 selector:sel_accessibilityHeadTrackChangedNotification name:*MEMORY[0x1E4F50AC8] object:0];
  }
  return v7;
}

- (void)dealloc
{
  [(MRUSpatialAudioController *)self stopMonitoring];
  v3.receiver = self;
  v3.super_class = (Class)MRUSpatialAudioController;
  [(MRUSpatialAudioController *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(MRNowPlayingAudioFormatController *)self->_audioFormatController audioFormatApplication];
  id v6 = [(MRNowPlayingAudioFormatController *)self->_audioFormatController audioFormatContentInfo];
  if ([(NSTimer *)self->_optimisticSpatialAudioActiveTimer isValid]) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  id v8 = [MEMORY[0x1E4F77038] sharedManager];
  if ([v8 expanseSessionHasScreenSharingActivity]) {
    int v9 = @"YES";
  }
  else {
    int v9 = @"NO";
  }
  v10 = [v3 stringWithFormat:@"%@ | %@ | %@ | optimistic: %@ | Screen Sharing: %@", v4, v5, v6, v7, v9];

  return (NSString *)v10;
}

- (void)setSelectedMode:(id)a3
{
  id v12 = a3;
  objc_storeStrong((id *)&self->_selectedMode, a3);
  id v5 = [(MRNowPlayingAudioFormatController *)self->_audioFormatController audioFormatContentInfo];
  id v6 = [v5 bundleID];

  uint64_t v7 = [(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController primaryOutputDeviceRoute];
  id v8 = [(MRUSpatialAudioController *)self preferenceForBundleID:v6 outputDevice:v7];

  int v9 = [(MRUSpatialAudioController *)self preferencesForMode:v12 previousPreferences:v8];
  v10 = [(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController primaryOutputDeviceRoute];
  [(MRUSpatialAudioController *)self setPreferences:v9 forBundleID:v6 outputDevice:v10];

  if ([(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController isSplitRoute])
  {
    v11 = [(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController secondaryOutputDeviceRoute];
    [(MRUSpatialAudioController *)self setPreferences:v9 forBundleID:v6 outputDevice:v11];
  }
  if (![v8 mode]
    && [v9 mode] == 1
    && [(MRUSpatialAudioController *)self isMultichannelAvailable])
  {
    [(MRUSpatialAudioController *)self startOptimisticSpatialAudioActive];
  }
  else
  {
    [(MRUSpatialAudioController *)self stopOptimisticSpatialAudioActive];
  }
}

- (BOOL)isMultichannelAvailable
{
  objc_super v3 = [(MRNowPlayingAudioFormatController *)self->_audioFormatController audioFormatContentInfo];
  uint64_t v4 = [v3 bestAvailableAudioFormat];

  id v5 = [(MRNowPlayingAudioFormatController *)self->_audioFormatController audioFormatApplication];
  char v6 = [v5 isFaceTime];
  if (v4 == 2) {
    char v7 = 1;
  }
  else {
    char v7 = v6;
  }
  if (v4 == 1) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v7;
  }

  return v8;
}

- (void)startMonitoring
{
  objc_super v3 = [MEMORY[0x1E4F77038] sharedManager];
  [v3 addObserver:self];

  [(MRUSpatialAudioController *)self updateDeviceSpatialAudioSupported];
  [(MRUSpatialAudioController *)self updateFaceTimeHeadTrackedSupported];

  [(MRUSpatialAudioController *)self updateSpatialAudioModes];
}

- (void)stopMonitoring
{
  id v3 = [MEMORY[0x1E4F77038] sharedManager];
  [v3 removeObserver:self];
}

- (void)startOptimisticSpatialAudioActive
{
  [(NSTimer *)self->_optimisticSpatialAudioActiveTimer invalidate];
  id v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_stopOptimisticSpatialAudioActive selector:0 userInfo:0 repeats:300.0];
  optimisticSpatialAudioActiveTimer = self->_optimisticSpatialAudioActiveTimer;
  self->_optimisticSpatialAudioActiveTimer = v3;
}

- (void)stopOptimisticSpatialAudioActive
{
  if ([(NSTimer *)self->_optimisticSpatialAudioActiveTimer isValid])
  {
    [(NSTimer *)self->_optimisticSpatialAudioActiveTimer invalidate];
    optimisticSpatialAudioActiveTimer = self->_optimisticSpatialAudioActiveTimer;
    self->_optimisticSpatialAudioActiveTimer = 0;

    [(MRUSpatialAudioController *)self updateSpatialAudioModes];
  }
}

- (void)accessibilityHeadTrackChangedNotification
{
  [(NSCache *)self->_cache removeAllObjects];

  [(MRUSpatialAudioController *)self updateSpatialAudioModes];
}

- (void)systemOutputDeviceRouteControllerDidUpdateOutputDevices:(id)a3
{
  [(NSCache *)self->_cache removeAllObjects];
  [(MRUSpatialAudioController *)self updateSpatialAudioModes];
  [(MRUSpatialAudioController *)self updateFaceTimeHeadTrackedSupported];

  [(MRUSpatialAudioController *)self updateNowPlaying];
}

- (void)expanseManagerDidJoinExpanseSession:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__MRUSpatialAudioController_expanseManagerDidJoinExpanseSession___block_invoke;
  block[3] = &unk_1E5F0D7F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __65__MRUSpatialAudioController_expanseManagerDidJoinExpanseSession___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateSpatialAudioModes];
}

- (void)expanseManagerDidLeaveExpanseSession:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MRUSpatialAudioController_expanseManagerDidLeaveExpanseSession___block_invoke;
  block[3] = &unk_1E5F0D7F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __66__MRUSpatialAudioController_expanseManagerDidLeaveExpanseSession___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateSpatialAudioModes];
}

- (void)setPreferences:(id)a3 forBundleID:(id)a4 outputDevice:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [a5 logicalLeaderOutputDevice];
  if ([v10 deviceType] == 2)
  {
    v11 = [MEMORY[0x1E4F50B70] sharedInstance];
    id v12 = [v10 uid];
    v13 = [v11 deviceFromAddressString:v12];

    int v14 = objc_msgSend(v13, "setSpatialAudioConfig:spatialMode:headTracking:", v9, objc_msgSend(v8, "mode"), objc_msgSend(v8, "isHeadTrackingEnabled"));
    if (v14) {
      [(NSCache *)self->_cache setObject:v8 forKey:v9];
    }
    id v15 = MCLogCategoryVolume();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = [v10 uid];
      int v18 = 138544386;
      uint64_t v19 = v16;
      __int16 v20 = 2114;
      id v21 = v8;
      __int16 v22 = 2114;
      id v23 = v9;
      __int16 v24 = 2114;
      __int16 v25 = v17;
      __int16 v26 = 1024;
      int v27 = v14;
      _os_log_impl(&dword_1AE7DF000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ set preferences: %{public}@ for bundle id: %{public}@ | uid: %{public}@ | success: %{BOOL}u", (uint8_t *)&v18, 0x30u);
    }
  }
}

- (id)preferencesForMode:(id)a3 previousPreferences:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(MRUSpatialAudioController *)self isSpatialAudioActive];
  BOOL v9 = [(MRUSpatialAudioController *)self isMultichannel];
  BOOL v10 = [(MRUSpatialAudioController *)self isMultichannelAvailable];
  uint64_t v11 = 3;
  if ([v7 mode] != 1 || v8 || !v9)
  {
    BOOL v12 = [v7 mode] == 0;
    if (v9) {
      unsigned int v13 = 1;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v12 && v10) {
      uint64_t v11 = 3;
    }
    else {
      uint64_t v11 = v13;
    }
  }
  uint64_t v14 = [v6 type];
  if (v14 == 2)
  {
    id v15 = [MRUSpatialAudioPreferences alloc];
    uint64_t v16 = v11;
    uint64_t v17 = 1;
  }
  else
  {
    if (v14 != 1)
    {
      if (v14) {
        goto LABEL_19;
      }
      if (v9) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = 3;
      }
    }
    id v15 = [MRUSpatialAudioPreferences alloc];
    uint64_t v16 = v11;
    uint64_t v17 = 0;
  }
  uint64_t v11 = [(MRUSpatialAudioPreferences *)v15 initWithMode:v16 headTrackingEnabled:v17];
LABEL_19:

  return (id)v11;
}

- (void)updateDeviceSpatialAudioSupported
{
  id v3 = [(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController primaryOutputDeviceRoute];
  id v7 = [v3 logicalLeaderOutputDevice];

  int v4 = [v7 supportsHeadTrackedSpatialAudio];
  if ([(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController isSplitRoute])
  {
    id v5 = [(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController secondaryOutputDeviceRoute];
    id v6 = [v5 logicalLeaderOutputDevice];

    if (v4)
    {
      if ([v6 supportsHeadTrackedSpatialAudio]) {
        int v4 = +[MRUFeatureFlagProvider isSpatialOnAggregateDevices];
      }
      else {
        int v4 = 0;
      }
    }
  }
  if (self->_isDeviceSpatialAudioSupported != v4)
  {
    self->_BOOL isDeviceSpatialAudioSupported = v4;
    [(MRUSpatialAudioController *)self updateSpatialAudioModes];
  }
}

- (void)updateFaceTimeHeadTrackedSupported
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController primaryOutputDeviceRoute];
  int v4 = [v3 logicalLeaderOutputDevice];

  if ([v4 deviceType] == 2)
  {
    id v5 = [MEMORY[0x1E4F50B70] sharedInstance];
    id v6 = [v4 uid];
    id v7 = [v5 deviceFromAddressString:v6];

    int v8 = [v7 getStereoHFPSupport];
    BOOL v9 = MCLogCategoryVolume();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = [v4 uid];
      int v12 = 138544130;
      uint64_t v13 = v10;
      __int16 v14 = 1026;
      int v15 = v8;
      __int16 v16 = 2114;
      uint64_t v17 = v11;
      __int16 v18 = 2114;
      uint64_t v19 = v7;
      _os_log_impl(&dword_1AE7DF000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ retrieved accessoryStereoHFPStatus: %{public}i for uid: %{public}@ | device: %{public}@", (uint8_t *)&v12, 0x26u);
    }
  }
  else
  {
    int v8 = 0;
  }
  if (self->_accessoryStereoHFPStatus != v8)
  {
    self->_int accessoryStereoHFPStatus = v8;
    [(MRUSpatialAudioController *)self updateSpatialAudioModes];
  }
}

- (id)localizedStringForRenderingMode:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      id v5 = +[MRUStringsProvider audioSessionRenderingModeMonoStereo];
      goto LABEL_10;
    case 2:
      id v5 = +[MRUStringsProvider audioSessionRenderingModeSurround];
      goto LABEL_10;
    case 3:
      id v5 = +[MRUStringsProvider audioSessionRenderingModeSpatialAudio];
      goto LABEL_10;
    case 4:
      id v5 = +[MRUStringsProvider audioSessionRenderingModeDolbyAudio];
      goto LABEL_10;
    case 5:
      id v5 = +[MRUStringsProvider audioSessionRenderingModeDolbyAtmos];
LABEL_10:
      break;
    default:
      id v5 = @"Not Applicable";
      break;
  }
  return v5;
}

- (MRUSystemOutputDeviceRouteController)outputDeviceRouteController
{
  return self->_outputDeviceRouteController;
}

- (MRUSpatialAudioControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUSpatialAudioControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MRNowPlayingAudioFormatController)audioFormatController
{
  return self->_audioFormatController;
}

- (void)setAudioFormatController:(id)a3
{
}

- (NSCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (NSTimer)optimisticSpatialAudioActiveTimer
{
  return self->_optimisticSpatialAudioActiveTimer;
}

- (void)setOptimisticSpatialAudioActiveTimer:(id)a3
{
}

- (BOOL)isDeviceSpatialAudioSupported
{
  return self->_isDeviceSpatialAudioSupported;
}

- (void)setIsDeviceSpatialAudioSupported:(BOOL)a3
{
  self->_BOOL isDeviceSpatialAudioSupported = a3;
}

- (int)accessoryStereoHFPStatus
{
  return self->_accessoryStereoHFPStatus;
}

- (void)setAccessoryStereoHFPStatus:(int)a3
{
  self->_int accessoryStereoHFPStatus = a3;
}

- (MRUSpatialAccessibilityObserver)accessibilityObserver
{
  return self->_accessibilityObserver;
}

- (void)setAccessibilityObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityObserver, 0);
  objc_storeStrong((id *)&self->_optimisticSpatialAudioActiveTimer, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_audioFormatController, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_selectedMode, 0);
  objc_storeStrong((id *)&self->_availableModes, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_outputDeviceRouteController, 0);
}

@end