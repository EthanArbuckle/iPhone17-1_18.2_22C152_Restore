@interface CPAnalyticsScreenManager
+ (BOOL)_isValidTabIdentifierChangedEvent:(id)a3;
+ (BOOL)isDebugScreenForViewName:(id)a3;
+ (BOOL)isValidScreenViewEvent:(id)a3;
+ (id)combinedViewName:(id)a3 withID:(id)a4;
+ (id)viewNameFromCombined:(id)a3;
- (CPAnalytics)cpAnalyticsInstance;
- (CPAnalyticsScreenManager)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4;
- (NSDate)currentScreenStartTime;
- (NSMutableArray)currentlyOpenViews;
- (NSMutableArray)priorViews;
- (NSSet)namesOfViewsToIgnore;
- (NSSet)namesOfViewsToTrack;
- (NSString)currentTabIdentifierDescription;
- (NSString)pendingTabIdentifierDescription;
- (id)currentScreenViewName;
- (id)getDynamicProperty:(id)a3 forEventName:(id)a4 payloadForSystemPropertyExtraction:(id)a5;
- (id)lastScreenName;
- (id)screenViewNameAt:(unint64_t)a3;
- (int64_t)appVisiblePeriodSignpostID;
- (int64_t)foregroundEventCount;
- (int64_t)screensViewCount;
- (unint64_t)priorViewsMaxIndex;
- (void)_handleUnknownViewIfNeeded:(id)a3;
- (void)_initializeScreenViewTrackers:(id)a3;
- (void)_resetSessionWithTime:(id)a3;
- (void)_sendCPAnalyticsScreenViewEventWithEndTime:(id)a3;
- (void)_trackView:(id)a3 withEventName:(id)a4 viewID:(id)a5 eventTime:(id)a6;
- (void)_updateAppLifeCycle:(id)a3;
- (void)_updateCurrentScreenToViewName:(id)a3 withEventTime:(id)a4;
- (void)_updateCurrentTabIdentifier:(id)a3;
- (void)_updateScreenTracking:(id)a3;
- (void)_updateTabTracking:(id)a3;
- (void)processEvent:(id)a3;
- (void)registerSystemProperties:(id)a3;
- (void)setAppVisiblePeriodSignpostID:(int64_t)a3;
- (void)setCpAnalyticsInstance:(id)a3;
- (void)setCurrentScreenStartTime:(id)a3;
- (void)setCurrentTabIdentifierDescription:(id)a3;
- (void)setCurrentlyOpenViews:(id)a3;
- (void)setForegroundEventCount:(int64_t)a3;
- (void)setNamesOfViewsToIgnore:(id)a3;
- (void)setNamesOfViewsToTrack:(id)a3;
- (void)setPendingTabIdentifierDescription:(id)a3;
- (void)setPriorViews:(id)a3;
- (void)setScreensViewCount:(int64_t)a3;
- (void)updateWithConfig:(id)a3;
@end

@implementation CPAnalyticsScreenManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTabIdentifierDescription, 0);
  objc_storeStrong((id *)&self->_currentTabIdentifierDescription, 0);
  objc_storeStrong((id *)&self->_priorViews, 0);
  objc_storeStrong((id *)&self->_currentlyOpenViews, 0);
  objc_storeStrong((id *)&self->_namesOfViewsToIgnore, 0);
  objc_storeStrong((id *)&self->_currentScreenStartTime, 0);
  objc_destroyWeak((id *)&self->_cpAnalyticsInstance);
  objc_storeStrong((id *)&self->_namesOfViewsToTrack, 0);
}

- (unint64_t)priorViewsMaxIndex
{
  return self->_priorViewsMaxIndex;
}

- (void)setPendingTabIdentifierDescription:(id)a3
{
}

- (NSString)pendingTabIdentifierDescription
{
  return self->_pendingTabIdentifierDescription;
}

- (void)setCurrentTabIdentifierDescription:(id)a3
{
}

- (NSString)currentTabIdentifierDescription
{
  return self->_currentTabIdentifierDescription;
}

- (void)setPriorViews:(id)a3
{
}

- (NSMutableArray)priorViews
{
  return self->_priorViews;
}

- (void)setCurrentlyOpenViews:(id)a3
{
}

- (NSMutableArray)currentlyOpenViews
{
  return self->_currentlyOpenViews;
}

- (void)setNamesOfViewsToIgnore:(id)a3
{
}

- (NSSet)namesOfViewsToIgnore
{
  return self->_namesOfViewsToIgnore;
}

- (void)setForegroundEventCount:(int64_t)a3
{
  self->_foregroundEventCount = a3;
}

- (int64_t)foregroundEventCount
{
  return self->_foregroundEventCount;
}

- (void)setCurrentScreenStartTime:(id)a3
{
}

- (NSDate)currentScreenStartTime
{
  return self->_currentScreenStartTime;
}

- (void)setAppVisiblePeriodSignpostID:(int64_t)a3
{
  self->_appVisiblePeriodSignpostID = a3;
}

- (int64_t)appVisiblePeriodSignpostID
{
  return self->_appVisiblePeriodSignpostID;
}

- (void)setCpAnalyticsInstance:(id)a3
{
}

- (CPAnalytics)cpAnalyticsInstance
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cpAnalyticsInstance);
  return (CPAnalytics *)WeakRetained;
}

- (void)setNamesOfViewsToTrack:(id)a3
{
}

- (NSSet)namesOfViewsToTrack
{
  return self->_namesOfViewsToTrack;
}

- (void)setScreensViewCount:(int64_t)a3
{
  self->_screensViewCount = a3;
}

- (int64_t)screensViewCount
{
  return self->_screensViewCount;
}

- (id)getDynamicProperty:(id)a3 forEventName:(id)a4 payloadForSystemPropertyExtraction:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v7 isEqualToString:@"cpa_common_appSection"])
  {
    uint64_t v9 = [(CPAnalyticsScreenManager *)self currentTabIdentifierDescription];
    goto LABEL_9;
  }
  if ([v7 isEqualToString:@"cpa_common_currentScreen"])
  {
    uint64_t v9 = [(CPAnalyticsScreenManager *)self currentScreenViewName];
    goto LABEL_9;
  }
  if (([v7 isEqualToString:@"cpa_ui_priorScreen1"] & 1) != 0
    || [v7 isEqualToString:@"cpa_common_priorScreen"])
  {
    v10 = self;
    uint64_t v11 = 1;
LABEL_8:
    uint64_t v9 = [(CPAnalyticsScreenManager *)v10 screenViewNameAt:v11];
    goto LABEL_9;
  }
  if ([v7 isEqualToString:@"cpa_ui_priorScreen2"])
  {
    v10 = self;
    uint64_t v11 = 2;
    goto LABEL_8;
  }
  if ([v7 isEqualToString:@"cpa_ui_priorScreen3"])
  {
    v10 = self;
    uint64_t v11 = 3;
    goto LABEL_8;
  }
  if ([v7 isEqualToString:@"cpa_ui_priorScreen4"])
  {
    v10 = self;
    uint64_t v11 = 4;
    goto LABEL_8;
  }
  if ([v7 isEqualToString:@"cpa_ui_priorScreen5"])
  {
    v10 = self;
    uint64_t v11 = 5;
    goto LABEL_8;
  }
  if ([v7 isEqualToString:@"cpa_ui_priorScreen6"])
  {
    v10 = self;
    uint64_t v11 = 6;
    goto LABEL_8;
  }
  if ([v7 isEqualToString:@"cpa_ui_priorScreen7"])
  {
    v10 = self;
    uint64_t v11 = 7;
    goto LABEL_8;
  }
  if ([v7 isEqualToString:@"cpa_ui_priorScreen8"])
  {
    v10 = self;
    uint64_t v11 = 8;
    goto LABEL_8;
  }
  if ([v7 isEqualToString:@"cpa_ui_priorScreen9"])
  {
    v10 = self;
    uint64_t v11 = 9;
    goto LABEL_8;
  }
  if (![v7 isEqualToString:@"cpa_common_numScreensViewed"])
  {
    if ([v7 isEqualToString:@"cpa_isTrackedScreenView"]
      && ([v8 objectForKeyedSubscript:@"className"],
          (uint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v15 = (void *)v14;
      v16 = NSNumber;
      v17 = [(CPAnalyticsScreenManager *)self namesOfViewsToTrack];
      v12 = objc_msgSend(v16, "numberWithBool:", objc_msgSend(v17, "containsObject:", v15));
    }
    else
    {
      v12 = 0;
    }
    goto LABEL_10;
  }
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[CPAnalyticsScreenManager screensViewCount](self, "screensViewCount"));
LABEL_9:
  v12 = (void *)v9;
LABEL_10:

  return v12;
}

- (void)registerSystemProperties:(id)a3
{
  id v4 = a3;
  [v4 addDynamicProperty:@"cpa_common_appSection" withProvider:self];
  [v4 addDynamicProperty:@"cpa_common_currentScreen" withProvider:self];
  [v4 addDynamicProperty:@"cpa_common_priorScreen" withProvider:self];
  [v4 addDynamicProperty:@"cpa_ui_priorScreen1" withProvider:self];
  [v4 addDynamicProperty:@"cpa_ui_priorScreen2" withProvider:self];
  [v4 addDynamicProperty:@"cpa_ui_priorScreen3" withProvider:self];
  [v4 addDynamicProperty:@"cpa_ui_priorScreen4" withProvider:self];
  [v4 addDynamicProperty:@"cpa_ui_priorScreen5" withProvider:self];
  [v4 addDynamicProperty:@"cpa_ui_priorScreen6" withProvider:self];
  [v4 addDynamicProperty:@"cpa_ui_priorScreen7" withProvider:self];
  [v4 addDynamicProperty:@"cpa_ui_priorScreen8" withProvider:self];
  [v4 addDynamicProperty:@"cpa_ui_priorScreen9" withProvider:self];
  [v4 addDynamicProperty:@"cpa_common_numScreensViewed" withProvider:self];
  [v4 addDynamicProperty:@"cpa_isTrackedScreenView" withProvider:self];
}

- (void)_sendCPAnalyticsScreenViewEventWithEndTime:(id)a3
{
  id v22 = a3;
  id v4 = [(CPAnalyticsScreenManager *)self priorViews];
  if ([v4 count])
  {
    v5 = [(CPAnalyticsScreenManager *)self currentScreenStartTime];

    if (!v5) {
      goto LABEL_8;
    }
    v6 = [(CPAnalyticsScreenManager *)self currentScreenStartTime];
    [v22 timeIntervalSinceDate:v6];
    double v8 = v7;

    id v4 = [NSNumber numberWithDouble:round(v8 * 100.0) / 100.0];
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", -[CPAnalyticsScreenManager priorViewsMaxIndex](self, "priorViewsMaxIndex") + 2);
    v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[CPAnalyticsScreenManager screensViewCount](self, "screensViewCount"));
    [v9 setObject:v10 forKey:@"cpa_common_numScreensViewed"];

    [v9 setObject:v4 forKey:@"cpa_ui_timeOnScreen"];
    uint64_t v11 = [(CPAnalyticsScreenManager *)self currentScreenViewName];
    [v9 setObject:v11 forKey:@"cpa_common_currentScreen"];

    v12 = [(CPAnalyticsScreenManager *)self screenViewNameAt:1];
    [v9 setObject:v12 forKey:@"cpa_common_priorScreen"];

    v13 = [(CPAnalyticsScreenManager *)self currentTabIdentifierDescription];
    [v9 setObject:v13 forKey:@"cpa_common_appSection"];

    uint64_t v14 = [(CPAnalyticsScreenManager *)self priorViews];
    unint64_t v15 = [v14 count];

    if (v15 >= 2)
    {
      unint64_t v16 = 1;
      do
      {
        v17 = [(CPAnalyticsScreenManager *)self screenViewNameAt:v16];
        v18 = [NSString stringWithFormat:@"%@%ld", @"cpa_ui_priorScreen", v16];
        [v9 setObject:v17 forKey:v18];

        ++v16;
        v19 = [(CPAnalyticsScreenManager *)self priorViews];
        unint64_t v20 = [v19 count];
      }
      while (v16 < v20);
    }
    v21 = [(CPAnalyticsScreenManager *)self cpAnalyticsInstance];
    [v21 sendEvent:@"com.apple.photos.CPAnalytics.screenView" withPayload:v9];
  }
LABEL_8:
}

- (void)_updateCurrentScreenToViewName:(id)a3 withEventTime:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CPAnalyticsScreenManager *)self _sendCPAnalyticsScreenViewEventWithEndTime:v6];
  [(CPAnalyticsScreenManager *)self setCurrentScreenStartTime:v6];

  double v8 = [(CPAnalyticsScreenManager *)self priorViews];
  [v8 insertObject:v7 atIndex:0];

  uint64_t v9 = [(CPAnalyticsScreenManager *)self priorViews];
  unint64_t v10 = [v9 count];
  unint64_t v11 = [(CPAnalyticsScreenManager *)self priorViewsMaxIndex];

  if (v10 > v11)
  {
    v12 = [(CPAnalyticsScreenManager *)self priorViews];
    [v12 removeLastObject];
  }
  int64_t v13 = [(CPAnalyticsScreenManager *)self screensViewCount] + 1;
  [(CPAnalyticsScreenManager *)self setScreensViewCount:v13];
}

- (void)_trackView:(id)a3 withEventName:(id)a4 viewID:(id)a5 eventTime:(id)a6
{
  id v25 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = +[CPAnalyticsScreenManager combinedViewName:v25 withID:a5];
  if ([@"com.apple.photos.CPAnalytics.viewDidDisappear" isEqualToString:v10])
  {
    int64_t v13 = [(CPAnalyticsScreenManager *)self currentlyOpenViews];
    uint64_t v14 = [v13 lastObject];
    int v15 = [v12 isEqualToString:v14];

    unint64_t v16 = [(CPAnalyticsScreenManager *)self currentlyOpenViews];
    v17 = v16;
    if (!v15)
    {
      [v16 removeObject:v12];
      goto LABEL_10;
    }
    uint64_t v18 = [v16 count];

    if (v18 == 1)
    {
      [(CPAnalyticsScreenManager *)self _sendCPAnalyticsScreenViewEventWithEndTime:v11];
      [(CPAnalyticsScreenManager *)self setCurrentScreenStartTime:0];
    }
    v19 = [(CPAnalyticsScreenManager *)self currentlyOpenViews];
    [v19 removeObject:v12];

    unint64_t v20 = [(CPAnalyticsScreenManager *)self currentlyOpenViews];
    uint64_t v21 = [v20 count];

    if (v21)
    {
      id v22 = [(CPAnalyticsScreenManager *)self currentlyOpenViews];
      v23 = [v22 lastObject];
      v17 = +[CPAnalyticsScreenManager viewNameFromCombined:v23];

      [(CPAnalyticsScreenManager *)self _updateCurrentScreenToViewName:v17 withEventTime:v11];
LABEL_10:
    }
  }
  else if ([@"com.apple.photos.CPAnalytics.viewDidAppear" isEqualToString:v10])
  {
    v24 = [(CPAnalyticsScreenManager *)self currentlyOpenViews];
    [v24 addObject:v12];

    [(CPAnalyticsScreenManager *)self _updateCurrentScreenToViewName:v25 withEventTime:v11];
    [(CPAnalyticsScreenManager *)self _updateCurrentTabIdentifier:v10];
  }
}

- (void)_resetSessionWithTime:(id)a3
{
  id v6 = a3;
  if ([(CPAnalyticsScreenManager *)self foregroundEventCount])
  {
    id v4 = [(CPAnalyticsScreenManager *)self currentScreenViewName];
    [(CPAnalyticsScreenManager *)self setScreensViewCount:0];
    v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[CPAnalyticsScreenManager priorViewsMaxIndex](self, "priorViewsMaxIndex"));
    [(CPAnalyticsScreenManager *)self setPriorViews:v5];

    if (v4) {
      [(CPAnalyticsScreenManager *)self _updateCurrentScreenToViewName:v4 withEventTime:v6];
    }
  }
}

- (void)_initializeScreenViewTrackers:(id)a3
{
  id v11 = a3;
  [(CPAnalyticsScreenManager *)self updateWithConfig:v11];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(CPAnalyticsScreenManager *)self setCurrentlyOpenViews:v4];

  self->_priorViewsMaxIndex = 10;
  v5 = [v11 objectForKey:@"maxPriorViews"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [v11 objectForKey:@"maxPriorViews"];
    unint64_t v8 = [v7 unsignedIntegerValue];

    if (v8 <= 1) {
      unint64_t v9 = 1;
    }
    else {
      unint64_t v9 = v8;
    }
    if (v9 >= 0x3E8) {
      unint64_t v9 = 1000;
    }
    self->_priorViewsMaxIndex = v9;
  }
  [(CPAnalyticsScreenManager *)self setScreensViewCount:0];
  id v10 = [MEMORY[0x263EFF980] arrayWithCapacity:self->_priorViewsMaxIndex];
  [(CPAnalyticsScreenManager *)self setPriorViews:v10];

  [(CPAnalyticsScreenManager *)self setCurrentTabIdentifierDescription:@"NoScreenName"];
  [(CPAnalyticsScreenManager *)self setForegroundEventCount:0];
}

- (id)screenViewNameAt:(unint64_t)a3
{
  v5 = [(CPAnalyticsScreenManager *)self priorViews];
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    unint64_t v8 = @"NoScreenName";
  }
  else
  {
    id v7 = [(CPAnalyticsScreenManager *)self priorViews];
    unint64_t v8 = [v7 objectAtIndex:a3];
  }
  return v8;
}

- (void)_handleUnknownViewIfNeeded:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 propertyForKey:@"className"];
  unint64_t v6 = [(CPAnalyticsScreenManager *)self namesOfViewsToIgnore];
  if ([v6 containsObject:v5]) {
    goto LABEL_8;
  }
  id v7 = [(CPAnalyticsScreenManager *)self namesOfViewsToTrack];
  if ([v7 containsObject:v5])
  {
LABEL_7:

LABEL_8:
    goto LABEL_9;
  }
  char v8 = [(id)objc_opt_class() isDebugScreenForViewName:v5];

  if ((v8 & 1) == 0)
  {
    unint64_t v6 = (void *)[v4 copyRawPayload];
    id v7 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v6];
    unint64_t v9 = [(CPAnalyticsScreenManager *)self cpAnalyticsInstance];
    id v10 = [v9 systemProperties];

    id v11 = [v4 name];
    v12 = [v10 propertyForKey:@"cpa_common_processName" forEventName:v11 payloadForSystemPropertyExtraction:0];
    [v7 setObject:v12 forKeyedSubscript:@"cpa_common_processName"];

    int64_t v13 = CPAnalyticsLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 138412290;
      unint64_t v16 = v5;
      _os_log_debug_impl(&dword_215355000, v13, OS_LOG_TYPE_DEBUG, "Unknown view: %@. Add this view to 'appState' destination in CP Analytics config.", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v14 = [(CPAnalyticsScreenManager *)self cpAnalyticsInstance];
    [v14 sendEvent:@"com.apple.photos.CPAnalytics.ScreenManager.unknownView" withPayload:v7];

    goto LABEL_7;
  }
LABEL_9:
}

- (void)_updateCurrentTabIdentifier:(id)a3
{
  if ([@"com.apple.photos.CPAnalytics.viewDidAppear" isEqualToString:a3])
  {
    id v4 = [(CPAnalyticsScreenManager *)self pendingTabIdentifierDescription];

    if (v4)
    {
      v5 = [(CPAnalyticsScreenManager *)self pendingTabIdentifierDescription];
      [(CPAnalyticsScreenManager *)self setCurrentTabIdentifierDescription:v5];

      [(CPAnalyticsScreenManager *)self setPendingTabIdentifierDescription:0];
    }
  }
}

- (void)_updateTabTracking:(id)a3
{
  id v5 = a3;
  if (+[CPAnalyticsScreenManager _isValidTabIdentifierChangedEvent:](CPAnalyticsScreenManager, "_isValidTabIdentifierChangedEvent:"))
  {
    id v4 = [v5 propertyForKey:@"tabIdentifierDescription"];
    [(CPAnalyticsScreenManager *)self setPendingTabIdentifierDescription:v4];
  }
}

- (void)_updateScreenTracking:(id)a3
{
  id v10 = a3;
  if (+[CPAnalyticsScreenManager isValidScreenViewEvent:](CPAnalyticsScreenManager, "isValidScreenViewEvent:"))
  {
    id v4 = [v10 propertyForKey:@"className"];
    id v5 = [v10 propertyForKey:@"viewID"];
    unint64_t v6 = [(CPAnalyticsScreenManager *)self namesOfViewsToTrack];
    int v7 = [v6 containsObject:v4];

    if (v7)
    {
      char v8 = [v10 name];
      unint64_t v9 = [v10 timestamp];
      [(CPAnalyticsScreenManager *)self _trackView:v4 withEventName:v8 viewID:v5 eventTime:v9];
    }
    else
    {
      [(CPAnalyticsScreenManager *)self _handleUnknownViewIfNeeded:v10];
    }
  }
}

- (void)_updateAppLifeCycle:(id)a3
{
  id v14 = a3;
  id v4 = [v14 name];
  int v5 = [v4 isEqualToString:@"com.apple.photos.CPAnalytics.appDidBecomeActive"];

  if (v5)
  {
    unint64_t v6 = [(CPAnalyticsScreenManager *)self cpAnalyticsInstance];
    -[CPAnalyticsScreenManager setAppVisiblePeriodSignpostID:](self, "setAppVisiblePeriodSignpostID:", [v6 startSignpost]);

    int v7 = [v14 timestamp];
    [(CPAnalyticsScreenManager *)self _resetSessionWithTime:v7];

    [(CPAnalyticsScreenManager *)self setForegroundEventCount:[(CPAnalyticsScreenManager *)self foregroundEventCount] + 1];
  }
  else
  {
    char v8 = [v14 name];
    int v9 = [v8 isEqualToString:@"com.apple.photos.CPAnalytics.appWillResignActive"];

    if (v9)
    {
      id v10 = [(CPAnalyticsScreenManager *)self cpAnalyticsInstance];
      int64_t v11 = [(CPAnalyticsScreenManager *)self appVisiblePeriodSignpostID];
      v12 = (void *)[v14 copyRawPayload];
      [v10 endSignpost:v11 forEventName:@"com.apple.photos.CPAnalytics.signpost.appVisiblePeriod" withPayload:v12];

      [(CPAnalyticsScreenManager *)self setAppVisiblePeriodSignpostID:0];
      int64_t v13 = [v14 timestamp];
      [(CPAnalyticsScreenManager *)self _sendCPAnalyticsScreenViewEventWithEndTime:v13];

      [(CPAnalyticsScreenManager *)self setCurrentScreenStartTime:0];
    }
  }
}

- (id)lastScreenName
{
  return [(CPAnalyticsScreenManager *)self screenViewNameAt:1];
}

- (id)currentScreenViewName
{
  return [(CPAnalyticsScreenManager *)self screenViewNameAt:0];
}

- (void)processEvent:(id)a3
{
  id v4 = a3;
  [(CPAnalyticsScreenManager *)self _updateAppLifeCycle:v4];
  [(CPAnalyticsScreenManager *)self _updateScreenTracking:v4];
  [(CPAnalyticsScreenManager *)self _updateTabTracking:v4];
}

- (void)updateWithConfig:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [v4 objectForKeyedSubscript:@"trackViews"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int v7 = [v4 objectForKeyedSubscript:@"trackViews"];
    char v8 = [(CPAnalyticsScreenManager *)self namesOfViewsToIgnore];
    int v9 = (void *)[v8 copy];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v44 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v38;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v38 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          if ([v9 containsObject:v15])
          {
            p_super = CPAnalyticsLog();
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v43 = v15;
              _os_log_error_impl(&dword_215355000, p_super, OS_LOG_TYPE_ERROR, "View %@ is in ignore list. It cannot be tracked.", buf, 0xCu);
            }
            id v24 = v10;
            goto LABEL_27;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v37 objects:v44 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    namesOfViewsToTrack = self->_namesOfViewsToTrack;
    uint64_t v17 = [v4 objectForKeyedSubscript:@"trackViews"];
    uint64_t v18 = [(NSSet *)namesOfViewsToTrack setByAddingObjectsFromArray:v17];
    v19 = self->_namesOfViewsToTrack;
    self->_namesOfViewsToTrack = v18;
  }
  unint64_t v20 = [v4 objectForKeyedSubscript:@"ignoreViews"];
  objc_opt_class();
  char v21 = objc_opt_isKindOfClass();

  if (v21)
  {
    id v22 = [v4 objectForKeyedSubscript:@"ignoreViews"];
    v23 = [(CPAnalyticsScreenManager *)self namesOfViewsToTrack];
    int v9 = (void *)[v23 copy];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v24 = v22;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v34;
      while (2)
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v34 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void *)(*((void *)&v33 + 1) + 8 * j);
          if (objc_msgSend(v9, "containsObject:", v29, (void)v33))
          {
            p_super = CPAnalyticsLog();
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v43 = v29;
              _os_log_error_impl(&dword_215355000, p_super, OS_LOG_TYPE_ERROR, "View %@ is in track list. It cannot be ignored.", buf, 0xCu);
            }
            id v10 = v24;
            goto LABEL_27;
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }

    namesOfViewsToIgnore = self->_namesOfViewsToIgnore;
    id v10 = [v4 objectForKeyedSubscript:@"ignoreViews"];
    v31 = [(NSSet *)namesOfViewsToIgnore setByAddingObjectsFromArray:v10];
    p_super = &self->_namesOfViewsToIgnore->super;
    self->_namesOfViewsToIgnore = v31;
LABEL_27:
  }
}

- (CPAnalyticsScreenManager)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CPAnalyticsScreenManager;
  char v8 = [(CPAnalyticsScreenManager *)&v15 init];
  if (v8)
  {
    int v9 = (NSSet *)objc_alloc_init(MEMORY[0x263EFFA08]);
    namesOfViewsToTrack = v8->_namesOfViewsToTrack;
    v8->_namesOfViewsToTrack = v9;

    uint64_t v11 = (NSSet *)objc_alloc_init(MEMORY[0x263EFFA08]);
    namesOfViewsToIgnore = v8->_namesOfViewsToIgnore;
    v8->_namesOfViewsToIgnore = v11;

    uint64_t v13 = [v7 systemProperties];
    [(CPAnalyticsScreenManager *)v8 registerSystemProperties:v13];

    [(CPAnalyticsScreenManager *)v8 _initializeScreenViewTrackers:v6];
    [(CPAnalyticsScreenManager *)v8 setCpAnalyticsInstance:v7];
    [(CPAnalyticsScreenManager *)v8 setCurrentTabIdentifierDescription:@"NoScreenName"];
  }

  return v8;
}

+ (BOOL)_isValidTabIdentifierChangedEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 name];
  int v5 = [@"com.apple.photos.CPAnalytics.tabIdentifierChanged" isEqualToString:v4];

  if (v5)
  {
    id v6 = [v3 propertyForKey:@"tabIdentifierDescription"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0)
    {
      char v8 = CPAnalyticsLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        id v10 = [v3 name];
        int v11 = 138412546;
        uint64_t v12 = v6;
        __int16 v13 = 2112;
        id v14 = v10;
        _os_log_debug_impl(&dword_215355000, v8, OS_LOG_TYPE_DEBUG, "Tab identifier description '%@' is not a string for event %@.", (uint8_t *)&v11, 0x16u);
      }
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

+ (id)viewNameFromCombined:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"//"];
  id v4 = [v3 firstObject];

  return v4;
}

+ (id)combinedViewName:(id)a3 withID:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@%@%@", a3, @"//", a4];
}

+ (BOOL)isValidScreenViewEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 name];
  if ([@"com.apple.photos.CPAnalytics.viewDidAppear" isEqualToString:v4])
  {

    goto LABEL_4;
  }
  int v5 = [v3 name];
  int v6 = [@"com.apple.photos.CPAnalytics.viewDidDisappear" isEqualToString:v5];

  if (v6)
  {
LABEL_4:
    id v7 = [v3 propertyForKey:@"className"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v8 = [v3 propertyForKey:@"viewID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        LOBYTE(v6) = 1;
LABEL_13:

        goto LABEL_14;
      }
      int v9 = CPAnalyticsLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v11 = [v3 name];
        int v12 = 138412546;
        __int16 v13 = v8;
        __int16 v14 = 2112;
        uint64_t v15 = v11;
        _os_log_debug_impl(&dword_215355000, v9, OS_LOG_TYPE_DEBUG, "View ID '%@' is not a number for event %@.", (uint8_t *)&v12, 0x16u);
      }
    }
    else
    {
      char v8 = CPAnalyticsLog();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
LABEL_12:
        LOBYTE(v6) = 0;
        goto LABEL_13;
      }
      int v9 = [v3 name];
      int v12 = 138412546;
      __int16 v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_debug_impl(&dword_215355000, v8, OS_LOG_TYPE_DEBUG, "Class name '%@' is not a string for event %@.", (uint8_t *)&v12, 0x16u);
    }

    goto LABEL_12;
  }
LABEL_14:

  return v6;
}

+ (BOOL)isDebugScreenForViewName:(id)a3
{
  id v3 = a3;
  char v4 = 1;
  if ([v3 rangeOfString:@"debug" options:1] == 0x7FFFFFFFFFFFFFFFLL) {
    char v4 = [v3 hasPrefix:@"PXSettings"];
  }

  return v4;
}

@end