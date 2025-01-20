@interface AXBDisplayFilterManager
+ (id)sharedInstance;
+ (void)initializeMonitor;
- (AXUIClient)displayFilterUIClient;
- (BOOL)_allowSoftwareFilters;
- (BOOL)_display:(id)a3 matchesDisplayType:(unint64_t)a4;
- (BOOL)_forceSoftwareFilters;
- (BOOL)_invertColorsEnabled;
- (BOOL)grayscaleWasEnabled;
- (BOOL)ignoringNotifications;
- (BOOL)invertColorsWasEnabled;
- (BOOL)reduceWhitePointWasEnabled;
- (BOOL)softwareFiltersEnabled;
- (NSMutableDictionary)didEnableHWFiltersForDisplayType;
- (__MADisplayFilter)displayFilterFromLastUpdate;
- (__MADisplayFilter)reduceWhitePointRampDownFilter;
- (double)lastCommittedReduceWhitePointEnabledStatus;
- (double)lastCommittedReduceWhitePointValue;
- (double)reduceWhitePointRampEndValue;
- (double)reduceWhitePointRampStartTime;
- (double)reduceWhitePointRampStartValue;
- (double)reduceWhitePointRampTime;
- (void)_applyMatrixFilter:(__MADisplayFilter *)a3 whitePointReduction:(double)a4 displayType:(unint64_t)a5;
- (void)_handleFrameRateLimit;
- (void)_repostNotificationIfNeeded;
- (void)_updateBrightnessFilters:(BOOL)a3;
- (void)_updateCoreSupportForDisplayType:(unint64_t)a3;
- (void)_updateMatrixSupportForDisplayType:(unint64_t)a3;
- (void)_updateNotificationCache;
- (void)_whitePointRampDown;
- (void)dealloc;
- (void)setDidEnableHWFiltersForDisplayType:(id)a3;
- (void)setDisplayFilterFromLastUpdate:(__MADisplayFilter *)a3;
- (void)setDisplayFilterUIClient:(id)a3;
- (void)setGrayscaleWasEnabled:(BOOL)a3;
- (void)setIgnoringNotifications:(BOOL)a3;
- (void)setInvertColorsWasEnabled:(BOOL)a3;
- (void)setLastCommittedReduceWhitePointEnabledStatus:(double)a3;
- (void)setLastCommittedReduceWhitePointValue:(double)a3;
- (void)setReduceWhitePointRampDownFilter:(__MADisplayFilter *)a3;
- (void)setReduceWhitePointRampEndValue:(double)a3;
- (void)setReduceWhitePointRampStartTime:(double)a3;
- (void)setReduceWhitePointRampStartValue:(double)a3;
- (void)setReduceWhitePointRampTime:(double)a3;
- (void)setReduceWhitePointWasEnabled:(BOOL)a3;
- (void)setSoftwareFiltersEnabled:(BOOL)a3;
- (void)updateSettings;
@end

@implementation AXBDisplayFilterManager

- (void)setDisplayFilterFromLastUpdate:(__MADisplayFilter *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  displayFilterFromLastUpdate = self->_displayFilterFromLastUpdate;
  if (displayFilterFromLastUpdate) {
    CFRelease(displayFilterFromLastUpdate);
  }
  self->_displayFilterFromLastUpdate = a3;
}

- (__MADisplayFilter)displayFilterFromLastUpdate
{
  result = self->_displayFilterFromLastUpdate;
  if (result)
  {
    CFTypeRef v3 = CFRetain(result);
    return (__MADisplayFilter *)CFAutorelease(v3);
  }
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

uint64_t __41__AXBDisplayFilterManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(AXBDisplayFilterManager);

  return MEMORY[0x270F9A758]();
}

+ (void)initializeMonitor
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__AXBDisplayFilterManager_initializeMonitor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initializeMonitor_onceToken_0 != -1) {
    dispatch_once(&initializeMonitor_onceToken_0, block);
  }
}

void __44__AXBDisplayFilterManager_initializeMonitor__block_invoke(uint64_t a1)
{
  _AXSAccessibilityEnabled();
  v2 = +[AXBDisplayFilterManager sharedInstance];
  [v2 _updateNotificationCache];

  int v3 = AXIsInternalInstall();
  v4 = (void *)MEMORY[0x263F8B2C8];
  v5 = (void *)MEMORY[0x263F8B1C8];
  if (v3)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v7 = [NSString stringWithFormat:@"%@-toggle-testing", *v4];
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_toggleAXSetting, v7, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    v8 = CFNotificationCenterGetDarwinNotifyCenter();
    v9 = [NSString stringWithFormat:@"%@-toggle-testing", *v5];
    CFNotificationCenterAddObserver(v8, 0, (CFNotificationCallback)_toggleAXSetting, v9, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    v10 = CFNotificationCenterGetDarwinNotifyCenter();
    v11 = [NSString stringWithFormat:@"%@-toggle-testing", *MEMORY[0x263F8B348]];
    CFNotificationCenterAddObserver(v10, 0, (CFNotificationCallback)_toggleAXSetting, v11, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    v12 = CFNotificationCenterGetDarwinNotifyCenter();
    v13 = [NSString stringWithFormat:@"%@-toggle-testing", *MEMORY[0x263F8B1D0]];
    CFNotificationCenterAddObserver(v12, 0, (CFNotificationCallback)_toggleAXSetting, v13, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    v14 = CFNotificationCenterGetDarwinNotifyCenter();
    v15 = [NSString stringWithFormat:@"%@-toggle-testing", *MEMORY[0x263F8B150]];
    CFNotificationCenterAddObserver(v14, 0, (CFNotificationCallback)_toggleAXSetting, v15, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    v16 = CFNotificationCenterGetDarwinNotifyCenter();
    v17 = [NSString stringWithFormat:@"%@-toggle-testing", *MEMORY[0x263F8B3A8]];
    CFNotificationCenterAddObserver(v16, 0, (CFNotificationCallback)_toggleAXSetting, v17, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  v18 = +[AXBDisplayFilterManager sharedInstance];
  [v18 _handleFrameRateLimit];

  v19 = [MEMORY[0x263F08A00] defaultCenter];
  CFStringRef v20 = (const __CFString *)*MEMORY[0x263F110B8];
  v21 = [MEMORY[0x263F08A48] mainQueue];
  id v22 = (id)[v19 addObserverForName:v20 object:0 queue:v21 usingBlock:&__block_literal_global_277];

  v23 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v23, *(const void **)(a1 + 32), (CFNotificationCallback)_displayFiltersChanged, v20, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v24 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v24, *(const void **)(a1 + 32), (CFNotificationCallback)_displayFiltersChanged, (CFStringRef)*MEMORY[0x263F8B1A8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v25 = [MEMORY[0x263F08A00] defaultCenter];
  v26 = +[AXBDisplayFilterManager sharedInstance];
  [v25 addObserver:v26 selector:sel__updateSettings_ name:*v4 object:0];

  v27 = [MEMORY[0x263F08A00] defaultCenter];
  v28 = +[AXBDisplayFilterManager sharedInstance];
  [v27 addObserver:v28 selector:sel__updateSettings_ name:*v5 object:0];

  v29 = [MEMORY[0x263F22938] sharedInstance];
  [v29 registerUpdateBlock:&__block_literal_global_280 forRetrieveSelector:sel_classicInvertColors withListener:*(void *)(a1 + 32)];

  AXPerformBlockOnMainThreadAfterDelay();
  if (MADisplayFilterPrefGetCategoryEnabled())
  {
    v30 = +[AXBDisplayFilterManager sharedInstance];
    [v30 setLastCommittedReduceWhitePointEnabledStatus:1.0];

    MADisplayFilterPrefGetReduceWhitePointIntensity();
    double v32 = v31;
    id v33 = +[AXBDisplayFilterManager sharedInstance];
    [v33 setLastCommittedReduceWhitePointValue:v32];
  }
}

void __44__AXBDisplayFilterManager_initializeMonitor__block_invoke_2()
{
  id v0 = +[AXBDisplayFilterManager sharedInstance];
  [v0 updateSettings];
}

void __44__AXBDisplayFilterManager_initializeMonitor__block_invoke_3()
{
  id v0 = +[AXBDisplayFilterManager sharedInstance];
  [v0 updateSettings];
}

void __44__AXBDisplayFilterManager_initializeMonitor__block_invoke_4()
{
  id v0 = +[AXBDisplayFilterManager sharedInstance];
  [v0 updateSettings];
}

- (void)_handleFrameRateLimit
{
  int v3 = [MEMORY[0x263F22938] sharedInstance];
  [v3 registerUpdateBlock:&__block_literal_global_286 forRetrieveSelector:sel_shouldLimitDisplayRefreshRate withListener:self];

  __48__AXBDisplayFilterManager__handleFrameRateLimit__block_invoke();
}

void __48__AXBDisplayFilterManager__handleFrameRateLimit__block_invoke()
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v0 = [MEMORY[0x263F22938] sharedInstance];
  uint64_t v1 = [v0 shouldLimitDisplayRefreshRate];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [MEMORY[0x263F15920] serverIfRunning];
  int v3 = [v2 displays];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v13;
    *(void *)&long long v5 = 67109378;
    long long v11 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (!objc_msgSend(v9, "displayType", v11))
        {
          [v9 setAccessibilityFrameRateLimitEnabled:v1];
          v10 = AXLogCommon();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v11;
            int v17 = v1;
            __int16 v18 = 2112;
            v19 = v9;
            _os_log_impl(&dword_241F5C000, v10, OS_LOG_TYPE_INFO, "AX: Setting frame rate limit: %d on %@", buf, 0x12u);
          }
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)_updateBrightnessFilters:(BOOL)a3
{
  if (a3)
  {
    int v4 = _AXSScreenFilterApplied();
    if (v4
      || ([MEMORY[0x263F22938] sharedInstance],
          id v8 = (id)objc_claimAutoreleasedReturnValue(),
          int v5 = [v8 classicInvertColors],
          id v3 = v8,
          v5))
    {
      id v9 = v3;
      uint64_t v6 = [MEMORY[0x263F22838] server];
      int v7 = [v6 brightnessFiltersEnabled];

      if (v4)
      {
        if (!v7) {
          return;
        }
      }
      else
      {

        if ((v7 & 1) == 0) {
          return;
        }
      }
      [MEMORY[0x263F22838] server];
      [(id)objc_claimAutoreleasedReturnValue() disableBrightnessFilters];
    }
  }
  else
  {
    [MEMORY[0x263F22838] server];
    [(id)objc_claimAutoreleasedReturnValue() restoreCachedBrightnessFilters];
  }

  MEMORY[0x270F9A758]();
}

- (BOOL)_forceSoftwareFilters
{
  return 0;
}

- (BOOL)_allowSoftwareFilters
{
  return 0;
}

- (BOOL)_invertColorsEnabled
{
  if (_AXSInvertColorsEnabled()) {
    return 1;
  }
  id v3 = [MEMORY[0x263F22938] sharedInstance];
  char v4 = [v3 classicInvertColors];

  return v4;
}

- (AXUIClient)displayFilterUIClient
{
  if ([(AXBDisplayFilterManager *)self _allowSoftwareFilters] && !self->_displayFilterUIClient)
  {
    id v3 = objc_alloc(MEMORY[0x263F22198]);
    char v4 = (AXUIClient *)[v3 initWithIdentifier:@"DisplayFilterIPrimaryClientID" serviceBundleName:*MEMORY[0x263F225E0]];
    displayFilterUIClient = self->_displayFilterUIClient;
    self->_displayFilterUIClient = v4;

    [(AXUIClient *)self->_displayFilterUIClient setDelegate:self];
  }
  uint64_t v6 = self->_displayFilterUIClient;

  return v6;
}

- (void)_updateNotificationCache
{
  [(AXBDisplayFilterManager *)self setInvertColorsWasEnabled:[(AXBDisplayFilterManager *)self _invertColorsEnabled]];
  [(AXBDisplayFilterManager *)self setGrayscaleWasEnabled:_AXSGrayscaleEnabled() != 0];
  BOOL v3 = _AXSReduceWhitePointEnabled() != 0;

  [(AXBDisplayFilterManager *)self setReduceWhitePointWasEnabled:v3];
}

- (void)_repostNotificationIfNeeded
{
  [(AXBDisplayFilterManager *)self setIgnoringNotifications:1];
  BOOL v3 = [(AXBDisplayFilterManager *)self invertColorsWasEnabled];
  if (v3 != [(AXBDisplayFilterManager *)self _invertColorsEnabled])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x263F8B2C8], 0, 0, 1u);
  }
  int v5 = [(AXBDisplayFilterManager *)self grayscaleWasEnabled];
  if (_AXSGrayscaleEnabled() != v5)
  {
    uint64_t v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v6, (CFNotificationName)*MEMORY[0x263F8B1C8], 0, 0, 1u);
  }
  int v7 = [(AXBDisplayFilterManager *)self reduceWhitePointWasEnabled];
  if (_AXSReduceWhitePointEnabled() != v7)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    id v9 = (CFNotificationName *)MEMORY[0x263F8B358];
    CFNotificationCenterPostNotification(LocalCenter, (CFNotificationName)*MEMORY[0x263F8B358], 0, 0, 1u);
    v10 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v10, *v9, 0, 0, 1u);
  }
  [(AXBDisplayFilterManager *)self _updateNotificationCache];

  [(AXBDisplayFilterManager *)self setIgnoringNotifications:0];
}

- (BOOL)_display:(id)a3 matchesDisplayType:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 displayType];
  char v7 = [v5 tag];

  BOOL v9 = (v7 & 0x20) == 0 && v6 != 2;
  if (a4) {
    BOOL v9 = 0;
  }
  if (a4 == 1) {
    return (v7 & 0x20) != 0;
  }
  else {
    return v9;
  }
}

- (void)_updateCoreSupportForDisplayType:(unint64_t)a3
{
  char v4 = self;
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (![(AXBDisplayFilterManager *)self _forceSoftwareFilters])
  {
    id v5 = [MEMORY[0x263F22838] server];
    uint64_t v6 = [v5 supportsAccessibilityDisplayFilters];

    uint64_t v7 = [(AXBDisplayFilterManager *)v4 _invertColorsEnabled];
    int v30 = _AXSGrayscaleEnabled();
    int CategoryEnabled = MADisplayFilterPrefGetCategoryEnabled();
    if (CategoryEnabled) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v7 ^ 1;
    }
    if (CategoryEnabled) {
      float v10 = 0.89;
    }
    else {
      float v10 = 1.0;
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v11 = [MEMORY[0x263F15920] serverIfRunning];
    long long v12 = [v11 displays];

    long long v13 = v12;
    uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v34;
      unsigned int v29 = v9;
      v28 = v13;
      uint64_t v31 = *(void *)v34;
      do
      {
        uint64_t v17 = 0;
        uint64_t v32 = v15;
        do
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(v13);
          }
          __int16 v18 = *(void **)(*((void *)&v33 + 1) + 8 * v17);
          if (-[AXBDisplayFilterManager _display:matchesDisplayType:](v4, "_display:matchesDisplayType:", v18, a3, v28))
          {
            if ([v18 displayType] == 2)
            {
              v19 = [(AXBDisplayFilterManager *)v4 didEnableHWFiltersForDisplayType];
              [NSNumber numberWithUnsignedInteger:a3];
              uint64_t v20 = v7;
              uint64_t v21 = v4;
              unint64_t v22 = a3;
              v24 = uint64_t v23 = v6;
              v25 = [v19 objectForKeyedSubscript:v24];
              int v26 = [v25 BOOLValue];

              uint64_t v15 = v32;
              uint64_t v6 = v23;
              a3 = v22;
              char v4 = v21;
              uint64_t v7 = v20;
              long long v13 = v28;

              uint64_t v9 = v29;
              if (v26) {
                [v18 setAllowsWirelessColorFiltering:1];
              }
            }
            [v18 invertsColors];
            [v18 setInvertsColors:v7];
            [v18 setAllowsExtendedDynamicRange:v9];
            uint64_t v16 = v31;
            if ((v6 & 1) == 0)
            {
              [v18 isGrayscale];
              uint64_t v15 = v32;
              [v18 setGrayscale:v30 != 0];
              *(float *)&double v27 = v10;
              [v18 setMaximumBrightness:v27];
            }
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v15);
    }
  }
}

- (void)_whitePointRampDown
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  double Current = CFAbsoluteTimeGetCurrent();
  [(AXBDisplayFilterManager *)self reduceWhitePointRampStartTime];
  double v5 = Current - v4;
  [(AXBDisplayFilterManager *)self reduceWhitePointRampTime];
  double v7 = log2(v5 / v6 + 1.0);
  [(AXBDisplayFilterManager *)self reduceWhitePointRampStartValue];
  double v9 = v8;
  [(AXBDisplayFilterManager *)self reduceWhitePointRampEndValue];
  double v11 = v10;
  [(AXBDisplayFilterManager *)self reduceWhitePointRampStartValue];
  double v13 = v9 + (v11 - v12) * v7;
  if (v7 <= 1.0)
  {
    if (v7 - *(double *)&_whitePointRampDown_LastPercentage <= 0.01) {
      return;
    }
    [(AXBDisplayFilterManager *)self _applyMatrixFilter:[(AXBDisplayFilterManager *)self reduceWhitePointRampDownFilter] whitePointReduction:0 displayType:v13];
    uint64_t v16 = AXLogDisplayFilters();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = [NSNumber numberWithDouble:v13];
      __int16 v18 = [NSNumber numberWithDouble:v7];
      v19 = NSNumber;
      [(AXBDisplayFilterManager *)self reduceWhitePointRampEndValue];
      uint64_t v20 = objc_msgSend(v19, "numberWithDouble:");
      int v21 = 138412802;
      unint64_t v22 = v17;
      __int16 v23 = 2112;
      v24 = v18;
      __int16 v25 = 2112;
      int v26 = v20;
      _os_log_impl(&dword_241F5C000, v16, OS_LOG_TYPE_INFO, "Apply ramp down: %@ -> percentage: %@ : startValue: %@", (uint8_t *)&v21, 0x20u);
    }
  }
  else
  {
    uint64_t v14 = AXLogDisplayFilters();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = [NSNumber numberWithDouble:v13];
      int v21 = 138412290;
      unint64_t v22 = v15;
      _os_log_impl(&dword_241F5C000, v14, OS_LOG_TYPE_INFO, "Finish white point ramp down: %@", (uint8_t *)&v21, 0xCu);
    }
    uint64_t v16 = [MEMORY[0x263F22870] currentDisplayLinkManager];
    [v16 removeTarget:self selector:sel__whitePointRampDown];
    double v7 = 0.0;
  }

  _whitePointRampDown_LastPercentage = *(void *)&v7;
}

- (void)_updateMatrixSupportForDisplayType:(unint64_t)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  BOOL v5 = [(AXBDisplayFilterManager *)self _forceSoftwareFilters];
  [(AXBDisplayFilterManager *)self _invertColorsEnabled];
  double v6 = +[AXBDisplayFilterManager sharedInstance];
  [v6 lastCommittedReduceWhitePointEnabledStatus];
  double v8 = v7;

  int CategoryEnabled = MADisplayFilterPrefGetCategoryEnabled();
  double v10 = 0.0;
  double v11 = 0.0;
  if (CategoryEnabled)
  {
    [(AXBDisplayFilterManager *)self lastCommittedReduceWhitePointValue];
    double v10 = v12;
    MADisplayFilterPrefGetReduceWhitePointIntensity();
    double v11 = v13;
    -[AXBDisplayFilterManager setLastCommittedReduceWhitePointValue:](self, "setLastCommittedReduceWhitePointValue:");
  }
  double v14 = 1.0;
  if (!CategoryEnabled) {
    double v14 = 0.0;
  }
  [(AXBDisplayFilterManager *)self setLastCommittedReduceWhitePointEnabledStatus:v14];
  Identity = (const void *)MADisplayFilterCopySystemFilter();
  if (!Identity) {
    Identity = (const void *)MADisplayFilterCreateIdentity();
  }
  [(AXBDisplayFilterManager *)self setDisplayFilterFromLastUpdate:Identity];
  if (v5
    || ([MEMORY[0x263F22838] server],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v16 supportsAccessibilityDisplayFilters],
        v16,
        !v17))
  {
    if (!Identity) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (!Identity) {
    goto LABEL_19;
  }
  __int16 v18 = (const void *)MADisplayFilterCreateIdentity();
  unint64_t v19 = 0x263F08000uLL;
  if (!v18)
  {
    char v22 = 0;
    BOOL v23 = v11 <= 0.0001;
LABEL_25:
    uint64_t v32 = [(AXBDisplayFilterManager *)self didEnableHWFiltersForDisplayType];
    long long v33 = [*(id *)(v19 + 2584) numberWithUnsignedInteger:a3];
    long long v34 = [v32 objectForKeyedSubscript:v33];
    char v35 = [v34 BOOLValue];

    if ((v22 & 1) == 0 && (v35 & 1) == 0)
    {
      long long v36 = [(AXBDisplayFilterManager *)self didEnableHWFiltersForDisplayType];

      if (!v36)
      {
        v37 = objc_opt_new();
        [(AXBDisplayFilterManager *)self setDidEnableHWFiltersForDisplayType:v37];
      }
      uint64_t v38 = [(AXBDisplayFilterManager *)self didEnableHWFiltersForDisplayType];
      v39 = [NSNumber numberWithUnsignedInteger:a3];
      [v38 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v39];
    }
    if ((v23 | AXDeviceIsJ5XX() ^ 1))
    {
      [(AXBDisplayFilterManager *)self _applyMatrixFilter:Identity whitePointReduction:a3 displayType:v11];
    }
    else
    {
      double v40 = fmin(v11, 0.999);
      if (v8 == 0.0) {
        double v10 = 0.0;
      }
      double v41 = log2(vabdd_f64(v40, v10) + 1.0);
      [(AXBDisplayFilterManager *)self setReduceWhitePointRampStartTime:CFAbsoluteTimeGetCurrent()];
      [(AXBDisplayFilterManager *)self setReduceWhitePointRampTime:v41];
      [(AXBDisplayFilterManager *)self setReduceWhitePointRampEndValue:v40];
      [(AXBDisplayFilterManager *)self setReduceWhitePointRampStartValue:v10];
      [(AXBDisplayFilterManager *)self setReduceWhitePointRampDownFilter:Identity];
      v42 = AXLogDisplayFilters();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v43 = [NSNumber numberWithDouble:v10];
        v44 = [NSNumber numberWithDouble:v40];
        v45 = [NSNumber numberWithDouble:v41];
        int v47 = 138412802;
        v48 = v43;
        __int16 v49 = 2112;
        v50 = v44;
        __int16 v51 = 2112;
        v52 = v45;
        _os_log_impl(&dword_241F5C000, v42, OS_LOG_TYPE_INFO, "White point start %@ -> end %@ : duration: %@", (uint8_t *)&v47, 0x20u);
      }
      v46 = [MEMORY[0x263F22870] currentDisplayLinkManager];
      [v46 addTarget:self selector:sel__whitePointRampDown];
    }
    goto LABEL_16;
  }
  uint64_t v20 = v18;
  int v21 = CFEqual(v18, Identity);
  CFRelease(v20);
  char v22 = 0;
  BOOL v23 = v11 <= 0.0001;
  if (v11 > 0.0001 || !v21) {
    goto LABEL_25;
  }
  v24 = [(AXBDisplayFilterManager *)self didEnableHWFiltersForDisplayType];
  __int16 v25 = [NSNumber numberWithUnsignedInteger:a3];
  int v26 = [v24 objectForKeyedSubscript:v25];
  int v27 = [v26 BOOLValue];

  if (v27)
  {
    char v22 = 1;
    BOOL v23 = 1;
    unint64_t v19 = 0x263F08000;
    goto LABEL_25;
  }
LABEL_16:
  CFRelease(Identity);
LABEL_17:
  if (v5)
  {
    uint64_t v28 = MEMORY[0x263EFFA88];
LABEL_22:
    [(AXBDisplayFilterManager *)self setSoftwareFiltersEnabled:v5];
    unsigned int v29 = objc_opt_new();
    int v30 = [NSNumber numberWithBool:v5];
    [v29 setObject:v30 forKey:@"showFilters"];

    [v29 setObject:v28 forKey:@"forceSoftwareFilter"];
    uint64_t v31 = [(AXBDisplayFilterManager *)self displayFilterUIClient];
    [v31 sendAsynchronousMessage:v29 withIdentifier:0 targetAccessQueue:0 completion:0];

    return;
  }
LABEL_19:
  if ([(AXBDisplayFilterManager *)self _allowSoftwareFilters]
    && [(AXBDisplayFilterManager *)self softwareFiltersEnabled])
  {
    uint64_t v28 = MEMORY[0x263EFFA80];
    goto LABEL_22;
  }
}

- (void)_applyMatrixFilter:(__MADisplayFilter *)a3 whitePointReduction:(double)a4 displayType:(unint64_t)a5
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  int v8 = _AXSGrayscaleEnabled();
  if (_AXSInvertColorsEnabled())
  {
    char v9 = 1;
  }
  else
  {
    double v10 = [MEMORY[0x263F22938] sharedInstance];
    char v9 = [v10 classicInvertColors];
  }
  uint64_t v45 = 0;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  MADisplayFilterGetMatrix();
  float v11 = 0.0;
  float v69 = 0.0;
  float v70 = 0.0;
  float v36 = 0.0;
  float v12 = 0.0;
  float v71 = 0.0;
  float v72 = 0.0;
  float v35 = 0.0;
  float v13 = 0.0;
  float v14 = 0.0;
  float v73 = 0.0;
  float v74 = 0.0;
  float v15 = 0.0;
  float v16 = 0.0;
  float v75 = 0.0;
  float v76 = 0.0;
  float v17 = 0.0;
  float v77 = 0.0;
  MADisplayFilterGetGain();
  double v34 = a4;
  if (a4 > 0.0001)
  {
    if (v9)
    {
      double v19 = v11;
      if (v8)
      {
        double v20 = a4 * 0.05;
        float v11 = a4 * 0.05 + v19;
        float v21 = a4 * 0.05 + v36;
        float v69 = v11;
        float v70 = v21;
        float v36 = v21;
        float v12 = a4 * 0.05 + v12;
        float v22 = a4 * 0.05 + v35;
        float v71 = v12;
        float v72 = v22;
        float v35 = v22;
        float v13 = a4 * 0.05 + v13;
        float v14 = a4 * 0.05 + v14;
        float v73 = v13;
        float v74 = v14;
        float v15 = a4 * 0.05 + v15;
        float v16 = a4 * 0.05 + v16;
        float v75 = v15;
        float v76 = v16;
      }
      else
      {
        double v20 = a4 * 0.3;
        float v11 = a4 * 0.3 + v19;
        float v13 = a4 * 0.3 + v13;
        float v69 = v11;
        float v73 = v13;
      }
      float v17 = v20 + v17;
      float v77 = v17;
    }
    else if (1.0 - a4 < v18)
    {
      double v18 = (1.0 - a4) * 0.95 + 0.05;
    }
  }
  double v23 = 0.05;
  if (v18 >= 0.05)
  {
    double v23 = v18;
    if (v18 > 1.0) {
      double v23 = 1.0;
    }
  }
  v24 = AXLogDisplayFilters();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134220544;
    double v48 = v23;
    __int16 v49 = 2048;
    double v50 = v34;
    __int16 v51 = 2048;
    double v52 = v11;
    __int16 v53 = 2048;
    double v54 = v36;
    __int16 v55 = 2048;
    double v56 = v12;
    __int16 v57 = 2048;
    double v58 = v35;
    __int16 v59 = 2048;
    double v60 = v13;
    __int16 v61 = 2048;
    double v62 = v14;
    __int16 v63 = 2048;
    double v64 = v15;
    __int16 v65 = 2048;
    double v66 = v16;
    __int16 v67 = 2048;
    double v68 = v17;
    _os_log_debug_impl(&dword_241F5C000, v24, OS_LOG_TYPE_DEBUG, "Setting Matrix; Gain: %f WhitePointReduction: %f Matrix: [ [%0.5f, %0.5f, %0.5f], [%0.5f, %0.5f, %0.5f], [%0.5f, %0.5f, %0.5f] ]",
      buf,
      0x70u);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  __int16 v25 = [MEMORY[0x263F15920] serverIfRunning];
  int v26 = [v25 displays];

  uint64_t v27 = [v26 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v38 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v32 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (-[AXBDisplayFilterManager _display:matchesDisplayType:](self, "_display:matchesDisplayType:", v32, a5, *(void *)&v34))
        {
          float v30 = v23;
          *(float *)&double v33 = v30;
          [v32 setAccessibilityColorMatrix:&v69 scale:v33];
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v28);
  }
}

- (void)updateSettings
{
  if (![(AXBDisplayFilterManager *)self ignoringNotifications])
  {
    MAPreferencesSetDomainOverride();
    [(AXBDisplayFilterManager *)self _updateMatrixSupportForDisplayType:0];
    [(AXBDisplayFilterManager *)self _updateCoreSupportForDisplayType:0];
    MAPreferencesSetDomainOverride();
    [(AXBDisplayFilterManager *)self _updateMatrixSupportForDisplayType:1];
    [(AXBDisplayFilterManager *)self _updateCoreSupportForDisplayType:1];
    MAPreferencesSetDomainOverride();
  }
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x263F110B8], 0);
  double v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, (CFNotificationName)*MEMORY[0x263F8B1A8], 0);
  BOOL v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)AXBDisplayFilterManager;
  [(AXBDisplayFilterManager *)&v6 dealloc];
}

- (void)setDisplayFilterUIClient:(id)a3
{
}

- (BOOL)softwareFiltersEnabled
{
  return self->_softwareFiltersEnabled;
}

- (void)setSoftwareFiltersEnabled:(BOOL)a3
{
  self->_softwareFiltersEnabled = a3;
}

- (NSMutableDictionary)didEnableHWFiltersForDisplayType
{
  return self->_didEnableHWFiltersForDisplayType;
}

- (void)setDidEnableHWFiltersForDisplayType:(id)a3
{
}

- (BOOL)invertColorsWasEnabled
{
  return self->_invertColorsWasEnabled;
}

- (void)setInvertColorsWasEnabled:(BOOL)a3
{
  self->_invertColorsWasEnabled = a3;
}

- (BOOL)grayscaleWasEnabled
{
  return self->_grayscaleWasEnabled;
}

- (void)setGrayscaleWasEnabled:(BOOL)a3
{
  self->_grayscaleWasEnabled = a3;
}

- (BOOL)reduceWhitePointWasEnabled
{
  return self->_reduceWhitePointWasEnabled;
}

- (void)setReduceWhitePointWasEnabled:(BOOL)a3
{
  self->_reduceWhitePointWasEnabled = a3;
}

- (BOOL)ignoringNotifications
{
  return self->_ignoringNotifications;
}

- (void)setIgnoringNotifications:(BOOL)a3
{
  self->_ignoringNotifications = a3;
}

- (double)lastCommittedReduceWhitePointValue
{
  return self->_lastCommittedReduceWhitePointValue;
}

- (void)setLastCommittedReduceWhitePointValue:(double)a3
{
  self->_lastCommittedReduceWhitePointValue = a3;
}

- (double)lastCommittedReduceWhitePointEnabledStatus
{
  return self->_lastCommittedReduceWhitePointEnabledStatus;
}

- (void)setLastCommittedReduceWhitePointEnabledStatus:(double)a3
{
  self->_lastCommittedReduceWhitePointEnabledStatus = a3;
}

- (double)reduceWhitePointRampStartTime
{
  return self->_reduceWhitePointRampStartTime;
}

- (void)setReduceWhitePointRampStartTime:(double)a3
{
  self->_reduceWhitePointRampStartTime = a3;
}

- (double)reduceWhitePointRampTime
{
  return self->_reduceWhitePointRampTime;
}

- (void)setReduceWhitePointRampTime:(double)a3
{
  self->_reduceWhitePointRampTime = a3;
}

- (double)reduceWhitePointRampStartValue
{
  return self->_reduceWhitePointRampStartValue;
}

- (void)setReduceWhitePointRampStartValue:(double)a3
{
  self->_reduceWhitePointRampStartValue = a3;
}

- (double)reduceWhitePointRampEndValue
{
  return self->_reduceWhitePointRampEndValue;
}

- (void)setReduceWhitePointRampEndValue:(double)a3
{
  self->_reduceWhitePointRampEndValue = a3;
}

- (__MADisplayFilter)reduceWhitePointRampDownFilter
{
  return self->_reduceWhitePointRampDownFilter;
}

- (void)setReduceWhitePointRampDownFilter:(__MADisplayFilter *)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didEnableHWFiltersForDisplayType, 0);

  objc_storeStrong((id *)&self->_displayFilterUIClient, 0);
}

@end