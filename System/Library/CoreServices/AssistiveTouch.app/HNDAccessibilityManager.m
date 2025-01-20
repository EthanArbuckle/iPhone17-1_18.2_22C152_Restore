@interface HNDAccessibilityManager
+ (BOOL)accessibilityEnabled;
+ (id)_existingSharedManager;
+ (id)sharedManager;
+ (void)_clearExistingSharedManager;
- (AXDispatchTimer)elementFetchQueueTimer;
- (AXElement)axOrbPreviewWindow;
- (AXElementFetcher)elementFetcher;
- (AXElementGroup)elementCommunityGroup;
- (AXElementGroup)rootScannerGroup;
- (BOOL)_elementFetchingRequired;
- (BOOL)_hasCurrentApplicationMatchingBlock:(id)a3;
- (BOOL)_isElementInIgnoredTouchRegions:(id)a3;
- (BOOL)_isGroupingEnabled;
- (BOOL)_isScannerEnabled;
- (BOOL)_isSpeechEnabled;
- (BOOL)applicationIsRTL;
- (BOOL)frontmostAppMayBeLoading;
- (BOOL)hasZeroElements;
- (BOOL)initialized;
- (BOOL)isFetchingElements;
- (BOOL)isOKToSpeak;
- (BOOL)isPausingScanning;
- (BOOL)isSystemSleeping;
- (BOOL)isSystemSleeping:(id)a3;
- (BOOL)willFetchElements;
- (NSArray)_testingElements;
- (NSArray)currentApplications;
- (NSArray)ignoredTouchRegions;
- (NSDate)lastAppTransitionTime;
- (NSMutableArray)accessibilityObservers;
- (NSMutableArray)currentlyObservingNotifications;
- (NSMutableDictionary)currentDisplays;
- (NSString)springboardActionIdentifier;
- (OS_dispatch_queue)notificationObserverQueue;
- (__AXObserver)observer;
- (id)_applicationMatchingBlock:(id)a3 inApplications:(id)a4;
- (id)_currentAppPids;
- (id)_currentApplicationMatchingBlock:(id)a3;
- (id)_itemForScanningFromItem:(id)a3 inDirection:(BOOL)a4 didWrap:(BOOL *)a5;
- (id)_itemForScanningWithElementCommunity:(id)a3 useFirst:(BOOL)a4;
- (id)_pauseReasonForPid:(int)a3;
- (id)_setupElementFetcher;
- (id)elementAtPoint:(CGPoint)a3;
- (id)elementAtPoint:(CGPoint)a3 displayID:(unsigned int)a4;
- (id)elements;
- (id)elementsForMatchingBlock:(id)a3;
- (id)findGroupableMatchingGroupable:(id)a3;
- (id)firstElementInScene:(id)a3;
- (id)firstItemForScanningWithElementCommunity:(id)a3;
- (id)firstKeyboardItem;
- (id)firstResponder;
- (id)firstScannerElement;
- (id)firstScannerGroupable;
- (id)lastItemForScanningWithElementCommunity:(id)a3;
- (id)lastKeyboardElement;
- (id)lastScannerElement;
- (id)lastScannerGroupable;
- (id)nativeFocusElement;
- (id)nextItemForScanningFromItem:(id)a3 didWrap:(BOOL *)a4;
- (id)orbPreviewWindow;
- (id)previousItemForScanningFromItem:(id)a3 didWrap:(BOOL *)a4;
- (id)rootKeyboardGroup;
- (id)scannerElementMatchingElement:(id)a3;
- (id)scrollViewsForAction:(int)a3;
- (id)scrollViewsForAction:(int)a3 elementsToScroll:(id *)a4;
- (int64_t)_hndAccessibilityEventForFetchEvent:(unint64_t)a3;
- (void)_addPostEventFilterToFetcher:(id)a3;
- (void)_enableApplicationAccessibility:(BOOL)a3;
- (void)_handleAlertAppeared;
- (void)_handleAnnouncementNotification:(id)a3;
- (void)_handleElementScrolledByPage;
- (void)_handleElementVisualsUpdated;
- (void)_handleFirstResponderChanged;
- (void)_handleKeyboardFocusChanged;
- (void)_handleKeyboardPopupAppeared;
- (void)_handleLayoutChanged:(id)a3;
- (void)_handleOrientationChanged;
- (void)_handlePauseForPid:(int)a3;
- (void)_handlePidStatusChanged;
- (void)_handleRefreshEvent:(int64_t)a3 data:(id)a4;
- (void)_handleResumeForPid:(int)a3;
- (void)_handleScreenChanged:(id)a3;
- (void)_handleScreenLocked;
- (void)_handleScrolledByPage;
- (void)_handleSystemServerDied;
- (void)_handleValueChanged;
- (void)_initialize;
- (void)_initializeAccessibility;
- (void)_notifyObserversApplicationWasActivated:(id)a3;
- (void)_notifyObserversDidFetchElementsForEvent:(int64_t)a3 foundNewElements:(BOOL)a4;
- (void)_notifyObserversDidReceiveEvent:(int64_t)a3 data:(id)a4;
- (void)_notifyObserversDidScheduleFetchEvent:(int64_t)a3;
- (void)_notifyObserversMediaDidBegin:(__CFData *)a3;
- (void)_notifyObserversNativeFocusElementDidChange:(id)a3;
- (void)_notifyObserversScreenWillChange:(__CFData *)a3;
- (void)_notifyObserversUpdateElementVisuals:(id)a3;
- (void)_notifyObserversWillFetchElementsForEvent:(int64_t)a3;
- (void)_observeNotifications:(BOOL)a3;
- (void)_removePostEventFilterFromFetcher:(id)a3;
- (void)_requestPauseScanning;
- (void)_requestResumeScanning;
- (void)_resetPostEventFilterOnFetcher:(id)a3;
- (void)_setTestingElements:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)displaysDidChange:(id)a3;
- (void)fetcher:(id)a3 applicationWasActivated:(id)a4;
- (void)fetcher:(id)a3 didFetchElementsForEvent:(unint64_t)a4 foundNewElements:(BOOL)a5;
- (void)fetcher:(id)a3 didScheduleFetchEvent:(unint64_t)a4;
- (void)fetcher:(id)a3 mediaDidBegin:(__CFData *)a4;
- (void)fetcher:(id)a3 nativeFocusElementDidChange:(id)a4;
- (void)fetcher:(id)a3 screenWillChange:(__CFData *)a4;
- (void)fetcher:(id)a3 updateElementVisuals:(id)a4;
- (void)fetcher:(id)a3 willFetchElementsForEvent:(unint64_t)a4 fromApplications:(id)a5;
- (void)groupingEnabledDidChange;
- (void)observeAXNotifications:(id)a3;
- (void)refreshElements;
- (void)removeNotificationObserverAndDealloc;
- (void)removeObserver:(id)a3;
- (void)resetElementFetcher;
- (void)setAccessibilityObservers:(id)a3;
- (void)setAxOrbPreviewWindow:(id)a3;
- (void)setCurrentApplications:(id)a3;
- (void)setCurrentDisplays:(id)a3;
- (void)setCurrentlyObservingNotifications:(id)a3;
- (void)setElementCommunityGroup:(id)a3;
- (void)setElementFetchQueueTimer:(id)a3;
- (void)setElementFetcher:(id)a3;
- (void)setIgnoredTouchRegions:(id)a3;
- (void)setInitialized:(BOOL)a3;
- (void)setIsPausingScanning:(BOOL)a3;
- (void)setIsSystemSleeping:(BOOL)a3;
- (void)setLastAppTransitionTime:(id)a3;
- (void)setNotificationObserverQueue:(id)a3;
- (void)setObserver:(__AXObserver *)a3;
- (void)setRootScannerGroup:(id)a3;
- (void)setSpringboardActionIdentifier:(id)a3;
- (void)speechEnabledDidChange;
- (void)stopObservingAXNotifications:(id)a3;
- (void)updateCachedOrbPreviewWindow:(id)a3;
- (void)userDidPerformSwitchAction;
@end

@implementation HNDAccessibilityManager

- (void)updateCachedOrbPreviewWindow:(id)a3
{
  if ([a3 isEqualToNumber:&__kCFBooleanTrue]) {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

- (id)orbPreviewWindow
{
  v3 = [(HNDAccessibilityManager *)self axOrbPreviewWindow];

  if (!v3)
  {
    v4 = +[AXElement primaryApp];
    v5 = [v4 elementForAttribute:5044];
    [(HNDAccessibilityManager *)self setAxOrbPreviewWindow:v5];
  }

  return [(HNDAccessibilityManager *)self axOrbPreviewWindow];
}

- (BOOL)_isGroupingEnabled
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 assistiveTouchGroupElementsEnabled];

  return v3;
}

- (BOOL)_isScannerEnabled
{
  return _AXSAssistiveTouchScannerEnabled() != 0;
}

- (BOOL)_isSpeechEnabled
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 assistiveTouchScannerSpeechEnabled];

  return v3;
}

- (BOOL)_elementFetchingRequired
{
  if (_AXSAssistiveTouchScannerEnabled()) {
    return 1;
  }
  unsigned __int8 v3 = +[AXSettings sharedInstance];
  unsigned __int8 v4 = [v3 assistiveTouchInternalOnlyHiddenNubbitModeEnabled];

  return v4;
}

- (id)_applicationMatchingBlock:(id)a3 inApplications:(id)a4
{
  v5 = (uint64_t (**)(id, void *))a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (v5[2](v5, v10))
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)_currentApplicationMatchingBlock:(id)a3
{
  id v4 = a3;
  v5 = [(HNDAccessibilityManager *)self currentApplications];
  id v6 = [(HNDAccessibilityManager *)self _applicationMatchingBlock:v4 inApplications:v5];

  return v6;
}

- (BOOL)_hasCurrentApplicationMatchingBlock:(id)a3
{
  unsigned __int8 v3 = [(HNDAccessibilityManager *)self _currentApplicationMatchingBlock:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isOKToSpeak
{
  return ![(HNDAccessibilityManager *)self _hasCurrentApplicationMatchingBlock:&stru_1001ACBA8];
}

- (void)resetElementFetcher
{
  id v3 = [(HNDAccessibilityManager *)self _setupElementFetcher];
  [(HNDAccessibilityManager *)self setElementFetcher:v3];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kAXSAssistiveTouchScannerEnabledNotification, 0);
  BOOL v4 = [(HNDAccessibilityManager *)self elementFetcher];
  [v4 disableEventManagement];

  v5 = [(HNDAccessibilityManager *)self elementFetcher];
  [v5 unregisterFetchObserver:self];

  [(HNDAccessibilityManager *)self _observeNotifications:0];
  v6.receiver = self;
  v6.super_class = (Class)HNDAccessibilityManager;
  [(HNDAccessibilityManager *)&v6 dealloc];
}

- (void)_initialize
{
  if (![(HNDAccessibilityManager *)self initialized])
  {
    [(HNDAccessibilityManager *)self setInitialized:1];
    id v3 = (NSMutableDictionary *)objc_opt_new();
    currentDisplays = self->_currentDisplays;
    self->_currentDisplays = v3;

    [(HNDAccessibilityManager *)self _initializeAccessibility];
    v5 = +[NSMutableArray array];
    [(HNDAccessibilityManager *)self setCurrentlyObservingNotifications:v5];

    objc_super v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v7 = dispatch_queue_create("HNDAccessibilityManager-NotificationObserver", v6);
    [(HNDAccessibilityManager *)self setNotificationObserverQueue:v7];

    [(HNDAccessibilityManager *)self _observeNotifications:1];
    uint64_t v8 = (OS_dispatch_queue *)dispatch_queue_create("HNDAccessibilityManager-AppTransition", 0);
    appTransitionQueue = self->_appTransitionQueue;
    self->_appTransitionQueue = v8;

    v10 = +[NSMutableArray array];
    [(HNDAccessibilityManager *)self setAccessibilityObservers:v10];

    dispatch_queue_t v11 = dispatch_queue_create("fetch-axelements", 0);
    id v12 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:v11];
    [(HNDAccessibilityManager *)self setElementFetchQueueTimer:v12];
    long long v13 = +[AXSettings sharedInstance];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100065ABC;
    v17[3] = &unk_1001AAA90;
    v17[4] = self;
    [v13 registerUpdateBlock:v17 forRetrieveSelector:"assistiveTouchInternalOnlyHiddenNubbitModeEnabled" withListener:self];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100065B1C, kAXSAssistiveTouchScannerEnabledNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    id v15 = +[SCATSwitchControlServerInstance serverInstance];
    v16 = +[NSDate date];
    [(HNDAccessibilityManager *)self setLastAppTransitionTime:v16];
  }
}

- (id)_setupElementFetcher
{
  if ([(HNDAccessibilityManager *)self _elementFetchingRequired])
  {
    if ([(HNDAccessibilityManager *)self _isGroupingEnabled]) {
      BOOL v3 = [(HNDAccessibilityManager *)self _isScannerEnabled];
    }
    else {
      BOOL v3 = 0;
    }
    BOOL v5 = [(HNDAccessibilityManager *)self _isSpeechEnabled];
    id v6 = objc_alloc((Class)AXElementFetcher);
    id v4 = objc_msgSend(v6, "initWithDelegate:fetchEvents:enableEventManagement:enableGrouping:shouldIncludeNonScannerElements:beginEnabled:", self, AXFetchEventAllEvents, 0, v3, v5, -[HNDAccessibilityManager _elementFetchingRequired](self, "_elementFetchingRequired"));
    [v4 registerFetchObserver:self targetQueue:&_dispatch_main_q];
    dispatch_queue_t v7 = (OS_dispatch_queue *)dispatch_queue_create("ignored-touch-regions", 0);
    ignoredTouchRegionsQueue = self->_ignoredTouchRegionsQueue;
    self->_ignoredTouchRegionsQueue = v7;

    [v4 setElementGroupingHeuristics:sub_100041150() ^ 1];
    [v4 enableEventManagement];
    [(HNDAccessibilityManager *)self _resetPostEventFilterOnFetcher:v4];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_resetPostEventFilterOnFetcher:(id)a3
{
  id v4 = a3;
  [(HNDAccessibilityManager *)self _removePostEventFilterFromFetcher:v4];
  [(HNDAccessibilityManager *)self _addPostEventFilterToFetcher:v4];
}

- (void)_addPostEventFilterToFetcher:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100065DD8;
  v5[3] = &unk_1001ACBD0;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  [v4 addPostFetchFilter:v5 withIdentifier:@"Scanner-Elements"];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_removePostEventFilterFromFetcher:(id)a3
{
}

+ (id)sharedManager
{
  if (qword_1001F0AC0 != -1) {
    dispatch_once(&qword_1001F0AC0, &stru_1001ACBF0);
  }
  [(id)qword_1001F0AB8 _initialize];
  v2 = (void *)qword_1001F0AB8;

  return v2;
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  id v4 = [(HNDAccessibilityManager *)self accessibilityObservers];
  if (([v4 containsObject:v5] & 1) == 0) {
    [v4 addObject:v5];
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HNDAccessibilityManager *)self accessibilityObservers];
  [v5 removeObject:v4];
}

- (void)_notifyObserversDidReceiveEvent:(int64_t)a3 data:(id)a4
{
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  dispatch_queue_t v7 = [(HNDAccessibilityManager *)self accessibilityObservers];
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      dispatch_queue_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v11);
        if (objc_opt_respondsToSelector()) {
          [v12 accessibilityManager:self didReceiveEvent:a3 data:v6];
        }
        dispatch_queue_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)_notifyObserversDidScheduleFetchEvent:(int64_t)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(HNDAccessibilityManager *)self accessibilityObservers];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 accessibilityManager:self didScheduleFetchEvent:a3];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_notifyObserversWillFetchElementsForEvent:(int64_t)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(HNDAccessibilityManager *)self accessibilityObservers];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 accessibilityManager:self willFetchElementsForEvent:a3];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_notifyObserversDidFetchElementsForEvent:(int64_t)a3 foundNewElements:(BOOL)a4
{
  BOOL v4 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [(HNDAccessibilityManager *)self accessibilityObservers];
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v11);
        if (objc_opt_respondsToSelector()) {
          [v12 accessibilityManager:self didFetchElementsForEvent:a3 foundNewElements:v4];
        }
        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)_notifyObserversNativeFocusElementDidChange:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(HNDAccessibilityManager *)self accessibilityObservers];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 accessibilityManager:self nativeFocusElementDidChange:v4];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_notifyObserversUpdateElementVisuals:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(HNDAccessibilityManager *)self accessibilityObservers];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 accessibilityManager:self updateElementVisuals:v4];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_notifyObserversApplicationWasActivated:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(HNDAccessibilityManager *)self accessibilityObservers];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 accessibilityManager:self applicationWasActivated:v4];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_notifyObserversScreenWillChange:(__CFData *)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(HNDAccessibilityManager *)self accessibilityObservers];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 accessibilityManager:self screenWillChange:a3];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_notifyObserversMediaDidBegin:(__CFData *)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(HNDAccessibilityManager *)self accessibilityObservers];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 accessibilityManager:self mediaDidBegin:a3];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_enableApplicationAccessibility:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = _AXSApplicationAccessibilityEnabled();
  if (v3 && !v4 || !v3 && v4 && _AXSCanDisableApplicationAccessibility())
  {
    _AXSApplicationAccessibilitySetEnabled();
  }
}

+ (BOOL)accessibilityEnabled
{
  return _AXSApplicationAccessibilityEnabled() != 0;
}

- (void)_initializeAccessibility
{
  [(HNDAccessibilityManager *)self _enableApplicationAccessibility:1];
  AXUIElementRegisterSystemWideServerDeathCallback();
  BOOL v3 = +[AXElement systemApplication];
  int v4 = [v3 uiElement];
  id v5 = [v4 axElement];

  if (v5)
  {
    v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    v24 = sub_100066FD4;
    v25 = &unk_1001AAA90;
    v26 = self;
    AXUIElementRegisterForApplicationDeath();
  }
  id v6 = [(HNDAccessibilityManager *)self _setupElementFetcher];
  [(HNDAccessibilityManager *)self setElementFetcher:v6];

  id v7 = +[AXElement systemWideElement];
  uint64_t v8 = [v7 uiElement];
  id v9 = (const __AXUIElement *)[v8 axElement];

  pid_t pid = 0;
  AXUIElementGetPid(v9, &pid);
  uint64_t v19 = pid;
  LOBYTE(v16) = 1;
  _AXLogWithFacility();
  AXObserverRef observer = [(HNDAccessibilityManager *)self observer];
  if (!observer)
  {
    if (AXObserverCreate(pid, (AXObserverCallback)sub_100067018, &observer))
    {
      LOBYTE(v17) = 1;
      CFStringRef v18 = @"Failed to create an accessibility event observer: %ld";
      goto LABEL_11;
    }
    [(HNDAccessibilityManager *)self setObserver:observer];
  }
  if ([(HNDAccessibilityManager *)self _elementFetchingRequired])
  {
    uint64_t v10 = [(HNDAccessibilityManager *)self elementFetcher];
    [v10 enableEventManagement];

    long long v11 = [(HNDAccessibilityManager *)self elementFetcher];
    [v11 refresh];
  }
  CFRunLoopSourceRef RunLoopSource = AXObserverGetRunLoopSource(observer);
  if (RunLoopSource)
  {
    long long v13 = RunLoopSource;
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, v13, kCFRunLoopDefaultMode);
    return;
  }
  CFStringRef v18 = @"Failed to get the observer run loop source";
  LOBYTE(v17) = 1;
LABEL_11:
  _AXLogWithFacility();
  [(HNDAccessibilityManager *)self _handleSystemServerDied];
}

- (BOOL)_isElementInIgnoredTouchRegions:(id)a3
{
  id v4 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  ignoredTouchRegionsQueue = self->_ignoredTouchRegionsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000672A4;
  block[3] = &unk_1001ACC18;
  block[4] = self;
  block[5] = &v21;
  dispatch_sync(ignoredTouchRegionsQueue, block);
  if (*((unsigned char *)v22 + 24))
  {
    [v4 visiblePoint];
    double v8 = v7;
    double v9 = v6;
    if (v7 == -1.0 && v6 == -1.0)
    {
      [v4 centerPoint];
      double v8 = v10;
      double v9 = v11;
    }
    id v12 = [v4 windowContextId];
    if (v12)
    {
      long long v13 = +[AXElement systemWideElement];
      objc_msgSend(v13, "convertPoint:fromContextId:", v12, v8, v9);
      double v8 = v14;
      double v9 = v15;
    }
    uint64_t v16 = self->_ignoredTouchRegionsQueue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100067308;
    v19[3] = &unk_1001AAAE0;
    *(double *)&v19[6] = v8;
    *(double *)&v19[7] = v9;
    v19[4] = self;
    v19[5] = &v25;
    dispatch_sync(v16, v19);
  }
  char v17 = *((unsigned char *)v26 + 24);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v17;
}

- (void)observeAXNotifications:(id)a3
{
  id v4 = a3;
  id v5 = [(HNDAccessibilityManager *)self notificationObserverQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000674D4;
  v7[3] = &unk_1001AAC78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)stopObservingAXNotifications:(id)a3
{
  id v4 = a3;
  id v5 = [(HNDAccessibilityManager *)self notificationObserverQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000677A0;
  v7[3] = &unk_1001AAC78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)removeNotificationObserverAndDealloc
{
  BOOL v3 = +[AXElement systemWideElement];
  [v3 setPassivelyListeningForEvents:0];

  id v4 = [(HNDAccessibilityManager *)self observer];
  id v5 = [(HNDAccessibilityManager *)self currentlyObservingNotifications];
  [(HNDAccessibilityManager *)self stopObservingAXNotifications:v5];

  if (v4) {
    CFRelease(v4);
  }
  [(HNDAccessibilityManager *)self setObserver:0];
  id v6 = +[NSMutableArray array];
  [(HNDAccessibilityManager *)self setCurrentlyObservingNotifications:v6];
}

- (void)_observeNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_loadWeakRetained(&location);
  id v6 = v5;
  if (v3)
  {
    [v5 observeAXNotifications:&off_1001BB9E8];

    if (+[AXSpringBoardServer isAvailable])
    {
      double v7 = +[AXSpringBoardServer server];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100067BC8;
      v10[3] = &unk_1001ABDA0;
      v10[4] = self;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100067CD4;
      v9[3] = &unk_1001AAFB0;
      v9[4] = self;
      [v7 registerSpringBoardActionHandler:v10 withIdentifierCallback:v9];
LABEL_6:
    }
  }
  else
  {
    [v5 removeNotificationObserverAndDealloc];

    if (+[AXSpringBoardServer isAvailable])
    {
      double v7 = +[AXSpringBoardServer server];
      id v8 = [(HNDAccessibilityManager *)self springboardActionIdentifier];
      [v7 removeActionHandler:v8];

      goto LABEL_6;
    }
  }
  objc_destroyWeak(&location);
}

- (void)_handleFirstResponderChanged
{
}

- (void)_handleSystemServerDied
{
  if ([(HNDAccessibilityManager *)self observer]) {
    [(HNDAccessibilityManager *)self _observeNotifications:0];
  }
  BOOL v3 = [(HNDAccessibilityManager *)self elementFetcher];
  [v3 disableEventManagement];

  AXPerformBlockOnMainThreadAfterDelay();
}

- (BOOL)frontmostAppMayBeLoading
{
  BOOL v3 = [(HNDAccessibilityManager *)self lastAppTransitionTime];

  if (v3)
  {
    id v4 = [(HNDAccessibilityManager *)self lastAppTransitionTime];
    [v4 timeIntervalSinceNow];
    double v6 = fabs(v5);

    return v6 < 4.0;
  }
  else
  {
    return AXInPreboardScenario();
  }
}

- (BOOL)applicationIsRTL
{
  v2 = [(HNDAccessibilityManager *)self currentApplications];
  BOOL v3 = [v2 firstObject];

  id v4 = [v3 uiElement];
  unsigned __int8 v5 = [v4 BOOLWithAXAttribute:3026];

  return v5;
}

- (BOOL)hasZeroElements
{
  if ([(HNDAccessibilityManager *)self _isGroupingEnabled])
  {
    BOOL v3 = [(HNDAccessibilityManager *)self rootScannerGroup];
    id v4 = [v3 firstDescendantPassingTest:&stru_1001ACC38];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v3 = [(HNDAccessibilityManager *)self elements];
    BOOL v5 = [v3 count] == 0;
  }

  return v5;
}

- (void)refreshElements
{
  id v2 = [(HNDAccessibilityManager *)self elementFetcher];
  [v2 refresh];
}

- (BOOL)isFetchingElements
{
  id v2 = [(HNDAccessibilityManager *)self elementFetcher];
  unsigned __int8 v3 = [v2 isFetchingElements];

  return v3;
}

- (BOOL)willFetchElements
{
  id v2 = [(HNDAccessibilityManager *)self elementFetcher];
  unsigned __int8 v3 = [v2 willFetchElements];

  return v3;
}

- (void)_handleLayoutChanged:(id)a3
{
}

- (void)_handleAlertAppeared
{
}

- (void)_handleOrientationChanged
{
}

- (void)_handleAnnouncementNotification:(id)a3
{
  id v11 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v11 objectForKeyedSubscript:kAXPidKey], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0)
    && (BOOL v5 = (void *)v4,
        [v11 objectForKeyedSubscript:kAXNotificationDataKey],
        double v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    double v7 = [v11 objectForKeyedSubscript:kAXNotificationDataKey];
    id v8 = +[NSNull null];
    unsigned __int8 v9 = [v7 isEqual:v8];

    if ((v9 & 1) == 0)
    {
      if ([v7 isEqualToString:kAXAnnouncementTypeStopSpeech]) {
        uint64_t v10 = 11;
      }
      else {
        uint64_t v10 = 10;
      }
      [(HNDAccessibilityManager *)self _handleRefreshEvent:v10 data:v7];
    }
  }
  else
  {
    _AXAssert();
  }
}

- (void)_handleScreenChanged:(id)a3
{
}

- (void)_handleScreenLocked
{
}

- (void)_handleScrolledByPage
{
}

- (void)_handleKeyboardPopupAppeared
{
}

- (void)_handleElementVisualsUpdated
{
}

- (void)_handleElementScrolledByPage
{
}

- (void)_handlePidStatusChanged
{
}

- (void)_handleKeyboardFocusChanged
{
}

- (void)_handleValueChanged
{
}

- (void)_handleRefreshEvent:(int64_t)a3 data:(id)a4
{
}

- (void)_requestPauseScanning
{
  [(HNDAccessibilityManager *)self setIsPausingScanning:1];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  unsigned __int8 v3 = [(HNDAccessibilityManager *)self accessibilityObservers];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector()) {
          [v8 accessibilityManagerShouldPauseScanning:self];
        }
        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_requestResumeScanning
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned __int8 v3 = [(HNDAccessibilityManager *)self accessibilityObservers];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector()) {
          [v8 accessibilityManagerShouldResumeScanning:self];
        }
        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(HNDAccessibilityManager *)self setIsPausingScanning:0];
}

- (id)_pauseReasonForPid:(int)a3
{
  return +[NSString stringWithFormat:@"Pid:%i", *(void *)&a3];
}

- (id)_currentAppPids
{
  unsigned __int8 v3 = [(HNDAccessibilityManager *)self currentApplications];
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(HNDAccessibilityManager *)self currentApplications];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) uiElement];
        long long v11 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v10 pid]);
        [v4 addObject:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_handlePauseForPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  pauseCountsByPid = self->_pauseCountsByPid;
  if (!pauseCountsByPid)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v7 = self->_pauseCountsByPid;
    self->_pauseCountsByPid = v6;

    pauseCountsByPid = self->_pauseCountsByPid;
  }
  uint64_t v8 = +[NSNumber numberWithInt:v3];
  long long v9 = [(NSMutableDictionary *)pauseCountsByPid objectForKeyedSubscript:v8];
  long long v10 = (char *)[v9 unsignedIntegerValue];

  long long v11 = +[AXSubsystemSCPauseResume sharedInstance];
  unsigned __int8 v12 = [v11 ignoreLogging];

  if (v10)
  {
    if ((v12 & 1) == 0)
    {
      long long v13 = +[AXSubsystemSCPauseResume identifier];
      long long v14 = AXLoggerForFacility();

      os_log_type_t v15 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v14, v15))
      {
        long long v16 = AXColorizeFormatLog();
        char v17 = _AXStringForArgs();
        if (os_log_type_enabled(v14, v15))
        {
          *(_DWORD *)buf = 138543362;
          v40 = v17;
LABEL_20:
          _os_log_impl((void *)&_mh_execute_header, v14, v15, "%{public}@", buf, 0xCu);
          goto LABEL_21;
        }
        goto LABEL_21;
      }
      goto LABEL_22;
    }
  }
  else
  {
    if ((v12 & 1) == 0)
    {
      CFStringRef v18 = +[AXSubsystemSCPauseResume identifier];
      uint64_t v19 = AXLoggerForFacility();

      os_log_type_t v20 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = AXColorizeFormatLog();
        uint64_t v38 = v3;
        v22 = _AXStringForArgs();
        if (os_log_type_enabled(v19, v20))
        {
          *(_DWORD *)buf = 138543362;
          v40 = v22;
          _os_log_impl((void *)&_mh_execute_header, v19, v20, "%{public}@", buf, 0xCu);
        }
      }
    }
    uint64_t v23 = [(HNDAccessibilityManager *)self _currentAppPids];
    char v24 = +[NSNumber numberWithInt:v3];
    unsigned __int8 v25 = [v23 containsObject:v24];
    int v26 = kAXUIServerFakePid;

    uint64_t v27 = +[AXSubsystemSCPauseResume sharedInstance];
    unsigned __int8 v28 = [v27 ignoreLogging];

    if ((v25 & 1) != 0 || v26 == v3)
    {
      if ((v28 & 1) == 0)
      {
        v30 = +[AXSubsystemSCPauseResume identifier];
        v31 = AXLoggerForFacility();

        os_log_type_t v32 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v31, v32))
        {
          v33 = AXColorizeFormatLog();
          v34 = _AXStringForArgs();
          if (os_log_type_enabled(v31, v32))
          {
            *(_DWORD *)buf = 138543362;
            v40 = v34;
            _os_log_impl((void *)&_mh_execute_header, v31, v32, "%{public}@", buf, 0xCu);
          }
        }
      }
      [(HNDAccessibilityManager *)self _requestPauseScanning];
    }
    else if ((v28 & 1) == 0)
    {
      v29 = +[AXSubsystemSCPauseResume identifier];
      long long v14 = AXLoggerForFacility();

      os_log_type_t v15 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v14, v15))
      {
        long long v16 = AXColorizeFormatLog();
        char v17 = _AXStringForArgs();
        if (os_log_type_enabled(v14, v15))
        {
          *(_DWORD *)buf = 138543362;
          v40 = v17;
          goto LABEL_20;
        }
LABEL_21:
      }
LABEL_22:
    }
  }
  v35 = +[NSNumber numberWithUnsignedInteger:v10 + 1];
  v36 = self->_pauseCountsByPid;
  v37 = +[NSNumber numberWithInt:v3];
  [(NSMutableDictionary *)v36 setObject:v35 forKeyedSubscript:v37];
}

- (void)_handleResumeForPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  pauseCountsByPid = self->_pauseCountsByPid;
  id v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
  id v7 = [(NSMutableDictionary *)pauseCountsByPid objectForKeyedSubscript:v6];
  uint64_t v8 = (char *)[v7 unsignedIntegerValue];

  if (v8)
  {
    long long v9 = v8 - 1;
    long long v10 = +[NSNumber numberWithUnsignedInteger:v9];
    long long v11 = self->_pauseCountsByPid;
    unsigned __int8 v12 = +[NSNumber numberWithInt:v3];
    [(NSMutableDictionary *)v11 setObject:v10 forKeyedSubscript:v12];

    long long v13 = +[AXSubsystemSCPauseResume sharedInstance];
    LOBYTE(v11) = [v13 ignoreLogging];

    if ((v11 & 1) == 0)
    {
      long long v14 = +[AXSubsystemSCPauseResume identifier];
      os_log_type_t v15 = AXLoggerForFacility();

      os_log_type_t v16 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v15, v16))
      {
        char v17 = AXColorizeFormatLog();
        uint64_t v30 = v3;
        v31 = v9;
        CFStringRef v18 = _AXStringForArgs();
        if (os_log_type_enabled(v15, v16))
        {
          *(_DWORD *)buf = 138543362;
          v33 = v18;
          _os_log_impl((void *)&_mh_execute_header, v15, v16, "%{public}@", buf, 0xCu);
        }
      }
    }
    if (!v9)
    {
      uint64_t v19 = [(HNDAccessibilityManager *)self _currentAppPids];
      os_log_type_t v20 = +[NSNumber numberWithInt:v3];
      unsigned __int8 v21 = [v19 containsObject:v20];
      int v22 = kAXUIServerFakePid;

      if ((v21 & 1) != 0 || v22 == v3)
      {
        uint64_t v23 = +[AXSubsystemSCPauseResume sharedInstance];
        unsigned __int8 v24 = [v23 ignoreLogging];

        if ((v24 & 1) == 0)
        {
          unsigned __int8 v25 = +[AXSubsystemSCPauseResume identifier];
          int v26 = AXLoggerForFacility();

          os_log_type_t v27 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v26, v27))
          {
            unsigned __int8 v28 = AXColorizeFormatLog();
            v29 = _AXStringForArgs();
            if (os_log_type_enabled(v26, v27))
            {
              *(_DWORD *)buf = 138543362;
              v33 = v29;
              _os_log_impl((void *)&_mh_execute_header, v26, v27, "%{public}@", buf, 0xCu);
            }
          }
        }
        [(HNDAccessibilityManager *)self _requestResumeScanning];
      }
    }
  }
  else
  {
    _AXLogWithFacility();
  }
}

- (id)elements
{
  id v2 = [(HNDAccessibilityManager *)self elementFetcher];
  uint64_t v3 = [v2 availableElements];

  return v3;
}

- (id)nativeFocusElement
{
  id v2 = [(HNDAccessibilityManager *)self elementFetcher];
  uint64_t v3 = [v2 nativeFocusElement];

  return v3;
}

- (id)firstScannerElement
{
  id v2 = [(HNDAccessibilityManager *)self elementFetcher];
  uint64_t v3 = [v2 availableElements];
  id v4 = [v3 firstObject];

  return v4;
}

- (id)lastScannerElement
{
  id v2 = [(HNDAccessibilityManager *)self elementFetcher];
  uint64_t v3 = [v2 availableElements];
  id v4 = [v3 lastObject];

  return v4;
}

- (id)firstScannerGroupable
{
  id v2 = [(HNDAccessibilityManager *)self rootScannerGroup];
  uint64_t v3 = [v2 firstChild];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v3) {
        _AXAssert();
      }
    }
  }

  return v3;
}

- (id)lastScannerGroupable
{
  id v2 = [(HNDAccessibilityManager *)self rootScannerGroup];
  uint64_t v3 = [v2 lastChild];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v3) {
        _AXAssert();
      }
    }
  }

  return v3;
}

- (id)rootKeyboardGroup
{
  id v2 = [(HNDAccessibilityManager *)self elementFetcher];
  uint64_t v3 = [v2 keyboardGroup];

  return v3;
}

- (id)elementAtPoint:(CGPoint)a3
{
  return -[HNDAccessibilityManager elementAtPoint:displayID:](self, "elementAtPoint:displayID:", 1, a3.x, a3.y);
}

- (id)elementAtPoint:(CGPoint)a3 displayID:(unsigned int)a4
{
  id v5 = +[AXElement elementAtCoordinate:withVisualPadding:displayID:](AXElement, "elementAtCoordinate:withVisualPadding:displayID:", 0, *(void *)&a4, a3.x, a3.y);
  unsigned int v6 = [(HNDAccessibilityManager *)self _isGroupingEnabled];
  id v7 = [(HNDAccessibilityManager *)self elementFetcher];
  uint64_t v8 = v7;
  if (v6) {
    [v7 findGroupableMatchingGroupable:v5];
  }
  else {
  long long v9 = [v7 findElementMatchingElement:v5];
  }

  return v9;
}

- (id)findGroupableMatchingGroupable:(id)a3
{
  id v4 = a3;
  id v5 = [(HNDAccessibilityManager *)self elementFetcher];
  unsigned int v6 = [v5 findGroupableMatchingGroupable:v4];

  return v6;
}

- (id)firstResponder
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(HNDAccessibilityManager *)self currentApplications];
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v10 + 1) + 8 * i) firstResponder];
        if (v7)
        {
          uint64_t v8 = (void *)v7;
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 0;
LABEL_11:

  return v8;
}

- (id)scrollViewsForAction:(int)a3
{
  return [(HNDAccessibilityManager *)self scrollViewsForAction:*(void *)&a3 elementsToScroll:0];
}

- (id)elementsForMatchingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSMutableArray array];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100069554;
  v22[3] = &unk_1001ACC60;
  id v6 = v4;
  id v24 = v6;
  id v7 = v5;
  id v23 = v7;
  uint64_t v8 = objc_retainBlock(v22);
  if ([(HNDAccessibilityManager *)self _isGroupingEnabled])
  {
    long long v9 = [(HNDAccessibilityManager *)self elementFetcher];
    long long v10 = [v9 rootGroup];
    [v10 enumerateLeafDescendantsUsingBlock:v8];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v11 = [(HNDAccessibilityManager *)self elementFetcher];
    long long v9 = [v11 availableElements];

    id v12 = [v9 countByEnumeratingWithState:&v18 objects:v25 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        os_log_type_t v15 = 0;
        do
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v9);
          }
          ((void (*)(void *, void))v8[2])(v8, *(void *)(*((void *)&v18 + 1) + 8 * (void)v15));
          os_log_type_t v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v9 countByEnumeratingWithState:&v18 objects:v25 count:16];
      }
      while (v13);
    }
  }

  id v16 = v7;
  return v16;
}

- (id)scrollViewsForAction:(int)a3 elementsToScroll:(id *)a4
{
  id v7 = +[NSMutableOrderedSet orderedSet];
  uint64_t v8 = +[NSMutableArray array];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000698BC;
  v35[3] = &unk_1001AB570;
  int v38 = a3;
  id v9 = v7;
  id v36 = v9;
  id v10 = v8;
  id v37 = v10;
  long long v11 = objc_retainBlock(v35);
  if ([(HNDAccessibilityManager *)self _isGroupingEnabled])
  {
    id v12 = [(HNDAccessibilityManager *)self elementFetcher];
    id v13 = [v12 rootGroup];
    [v13 enumerateLeafDescendantsUsingBlock:v11];
  }
  else
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v14 = [(HNDAccessibilityManager *)self elementFetcher];
    id v12 = [v14 availableElements];

    id v15 = [v12 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v32;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v12);
          }
          ((void (*)(void *, void))v11[2])(v11, *(void *)(*((void *)&v31 + 1) + 8 * i));
        }
        id v16 = [v12 countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v16);
    }
  }

  long long v19 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v20 = v9;
  id v21 = [v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        unsigned __int8 v25 = +[AXElement elementWithAXUIElement:](AXElement, "elementWithAXUIElement:", *(void *)(*((void *)&v27 + 1) + 8 * (void)j), (void)v27);
        [v19 addObject:v25];
      }
      id v22 = [v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v22);
  }

  if (a4) {
    *a4 = v10;
  }

  return v19;
}

- (id)_itemForScanningWithElementCommunity:(id)a3 useFirst:(BOOL)a4
{
  id v6 = a3;
  if ([(HNDAccessibilityManager *)self _isGroupingEnabled])
  {
    if (v6)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v7 = [(HNDAccessibilityManager *)self rootScannerGroup];
      id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v20;
        while (2)
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if ([v12 isGroup])
            {
              id v13 = v12;
              uint64_t v14 = [v13 elementCommunity];
              unsigned int v15 = [v14 isEqual:v6];

              if (v15)
              {
                if (a4) {
                  [v13 firstChild];
                }
                else {
                uint64_t v17 = [v13 lastChild];
                }

                goto LABEL_25;
              }
            }
          }
          id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
    }
    if (a4) {
      [(HNDAccessibilityManager *)self firstScannerGroupable];
    }
    else {
    uint64_t v16 = [(HNDAccessibilityManager *)self lastScannerGroupable];
    }
  }
  else
  {
    if (a4) {
      [(HNDAccessibilityManager *)self firstScannerElement];
    }
    else {
    uint64_t v16 = [(HNDAccessibilityManager *)self lastScannerElement];
    }
  }
  uint64_t v17 = (void *)v16;
LABEL_25:

  return v17;
}

- (id)firstItemForScanningWithElementCommunity:(id)a3
{
  return [(HNDAccessibilityManager *)self _itemForScanningWithElementCommunity:a3 useFirst:1];
}

- (id)lastItemForScanningWithElementCommunity:(id)a3
{
  return [(HNDAccessibilityManager *)self _itemForScanningWithElementCommunity:a3 useFirst:0];
}

- (id)_itemForScanningFromItem:(id)a3 inDirection:(BOOL)a4 didWrap:(BOOL *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  unsigned int v9 = [(HNDAccessibilityManager *)self _isGroupingEnabled];
  uint64_t v10 = [(HNDAccessibilityManager *)self elementFetcher];
  long long v11 = v10;
  if (v9)
  {
    if (v6) {
      [v10 nextSiblingOfGroupable:v8 didWrap:a5];
    }
    else {
    id v12 = [v10 previousSiblingOfGroupable:v8 didWrap:a5];
    }

    if (v12) {
      goto LABEL_21;
    }
    if ([v8 scatIsKeyboardKey])
    {
      id v13 = [(HNDAccessibilityManager *)self elementFetcher];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100069D1C;
      v18[3] = &unk_1001AB4E0;
      id v19 = v8;
      uint64_t v14 = [v13 findGroupableMatchingBlock:v18];

      if ([v14 isKeyboardKey])
      {
        id v12 = [(HNDAccessibilityManager *)self _itemForScanningFromItem:v14 inDirection:v6 didWrap:a5];
      }
      else
      {
        id v12 = 0;
      }

      goto LABEL_21;
    }
  }
  else
  {
    if (v6) {
      [v10 nextSiblingOfElement:v8 didWrap:a5];
    }
    else {
    id v12 = [v10 previousSiblingOfElement:v8 didWrap:a5];
    }

    if (v12) {
      goto LABEL_21;
    }
    if ([v8 scatIsKeyboardKey])
    {
      unsigned int v15 = [(HNDAccessibilityManager *)self elementFetcher];
      uint64_t v16 = [v15 closestElementToElement:v8];

      if ([v16 isKeyboardKey])
      {
        id v12 = [(HNDAccessibilityManager *)self _itemForScanningFromItem:v16 inDirection:v6 didWrap:a5];
      }
      else
      {
        id v12 = 0;
      }

      goto LABEL_21;
    }
  }
  id v12 = 0;
LABEL_21:

  return v12;
}

- (id)nextItemForScanningFromItem:(id)a3 didWrap:(BOOL *)a4
{
  return [(HNDAccessibilityManager *)self _itemForScanningFromItem:a3 inDirection:1 didWrap:a4];
}

- (id)previousItemForScanningFromItem:(id)a3 didWrap:(BOOL *)a4
{
  return [(HNDAccessibilityManager *)self _itemForScanningFromItem:a3 inDirection:0 didWrap:a4];
}

- (id)firstKeyboardItem
{
  unsigned int v3 = [(HNDAccessibilityManager *)self _isGroupingEnabled];
  id v4 = [(HNDAccessibilityManager *)self elementFetcher];
  uint64_t v5 = v4;
  if (v3)
  {
    BOOL v6 = [v4 keyboardGroup];
    id v7 = [v6 firstChild];
  }
  else
  {
    id v7 = [v4 findElementMatchingBlock:&stru_1001ACC80];
  }

  return v7;
}

- (id)lastKeyboardElement
{
  unsigned int v3 = [(HNDAccessibilityManager *)self _isGroupingEnabled];
  id v4 = [(HNDAccessibilityManager *)self elementFetcher];
  id v5 = v4;
  if (v3)
  {
    BOOL v6 = [v4 keyboardGroup];

    if (!v6)
    {
      id v7 = [(HNDAccessibilityManager *)self elementFetcher];
      id v8 = [v7 rootGroup];
      BOOL v6 = [v8 lastChild];
    }
    if ([v6 isGroup])
    {
      do
      {
        id v5 = [v6 lastChild];

        BOOL v6 = v5;
      }
      while (([v5 isGroup] & 1) != 0);
    }
    else
    {
      id v5 = v6;
    }
    if ([v5 conformsToProtocol:&OBJC_PROTOCOL___SCATElement])
    {
      id v5 = v5;
      long long v11 = v5;
    }
    else
    {
      long long v11 = 0;
    }
  }
  else
  {
    unsigned int v9 = [v4 lastElement];
    if ([v9 isKeyboardKey])
    {
      uint64_t v10 = [(HNDAccessibilityManager *)self elementFetcher];
      long long v11 = [v10 lastElement];
    }
    else
    {
      long long v11 = 0;
    }
  }

  return v11;
}

- (id)firstElementInScene:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v5 = [(HNDAccessibilityManager *)self elementCommunityGroup];
    id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      id v19 = self;
      uint64_t v7 = *(void *)v21;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "isGroup", v19))
          {
            objc_opt_class();
            unsigned int v9 = __UIAccessibilityCastAsClass();
            uint64_t v10 = [v9 firstLeafDescendant];
            long long v11 = [v10 uiElement];
            id v12 = [v11 stringWithAXAttribute:3056];
            unsigned int v13 = [v12 isEqualToString:v4];

            if (v13)
            {
              self = v19;
              unsigned int v15 = [(HNDAccessibilityManager *)v19 elementFetcher];
              unsigned int v16 = [v15 isGroupingEnabled];

              if (v16)
              {
                id v17 = [v9 firstChild];
              }
              else
              {
                id v17 = v10;
              }
              id v6 = v17;

              goto LABEL_18;
            }
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v6) {
          continue;
        }
        break;
      }
      self = v19;
    }
LABEL_18:

    uint64_t v14 = [(HNDAccessibilityManager *)self scannerElementMatchingElement:v6];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)scannerElementMatchingElement:(id)a3
{
  id v4 = a3;
  id v5 = [(HNDAccessibilityManager *)self elementFetcher];
  unsigned int v6 = [v5 isGroupingEnabled];

  uint64_t v7 = [(HNDAccessibilityManager *)self elementFetcher];
  id v8 = v7;
  if (v6)
  {
    unsigned int v9 = [v7 rootGroup];
    uint64_t v10 = [v9 firstDescendantMatchingItem:v4];

    id v4 = v9;
  }
  else
  {
    uint64_t v10 = [v7 findElementMatchingElement:v4];
  }

  return v10;
}

- (int64_t)_hndAccessibilityEventForFetchEvent:(unint64_t)a3
{
  if ((uint64_t)a3 > 15)
  {
    if ((uint64_t)a3 > 63)
    {
      if (a3 == 64) {
        return 2;
      }
      if (a3 == 128) {
        return 8;
      }
    }
    else
    {
      if (a3 == 16) {
        return 6;
      }
      if (a3 == 32) {
        return 7;
      }
    }
    return 0;
  }
  if (a3 == 2) {
    return 4;
  }
  if (a3 != 4) {
    return a3 == 8;
  }
  return 3;
}

- (void)groupingEnabledDidChange
{
  BOOL v3 = [(HNDAccessibilityManager *)self _isGroupingEnabled];
  id v4 = [(HNDAccessibilityManager *)self elementFetcher];
  [v4 setGroupingEnabled:v3];

  [(HNDAccessibilityManager *)self refreshElements];
}

- (void)speechEnabledDidChange
{
  BOOL v3 = [(HNDAccessibilityManager *)self _isSpeechEnabled];
  id v4 = [(HNDAccessibilityManager *)self elementFetcher];
  [v4 setShouldIncludeNonScannerElements:v3];

  [(HNDAccessibilityManager *)self refreshElements];
}

- (void)displaysDidChange:(id)a3
{
  id v4 = a3;
  [(NSMutableDictionary *)self->_currentDisplays removeAllObjects];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        currentDisplays = self->_currentDisplays;
        id v12 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "displayID", (void)v14));
        [(NSMutableDictionary *)currentDisplays setObject:v10 forKey:v12];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  unsigned int v13 = [(HNDAccessibilityManager *)self elementFetcher];
  [(HNDAccessibilityManager *)self _resetPostEventFilterOnFetcher:v13];
}

- (void)userDidPerformSwitchAction
{
  BOOL v3 = +[AXSubsystemSCPauseResume sharedInstance];
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    id v5 = +[AXSubsystemSCPauseResume identifier];
    id v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = AXColorizeFormatLog();
      unsigned int v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        int v10 = 138543362;
        long long v11 = v9;
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  [(HNDAccessibilityManager *)self _requestResumeScanning];
}

- (BOOL)isSystemSleeping:(id)a3
{
  unsigned __int8 v4 = +[AXSystemAppServer server];
  self->_isSystemSleeping = [v4 isSystemSleeping];

  return self->_isSystemSleeping;
}

- (void)fetcher:(id)a3 didScheduleFetchEvent:(unint64_t)a4
{
  int64_t v5 = [(HNDAccessibilityManager *)self _hndAccessibilityEventForFetchEvent:a4];

  [(HNDAccessibilityManager *)self _notifyObserversDidScheduleFetchEvent:v5];
}

- (void)fetcher:(id)a3 willFetchElementsForEvent:(unint64_t)a4 fromApplications:(id)a5
{
  [(HNDAccessibilityManager *)self setCurrentApplications:a5];
  os_log_type_t v7 = +[AXBackBoardServer server];
  uint64_t v8 = [v7 guidedAccessIgnoredRegions];

  ignoredTouchRegionsQueue = self->_ignoredTouchRegionsQueue;
  long long v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  unsigned int v13 = sub_10006A7E0;
  long long v14 = &unk_1001AAC78;
  long long v15 = self;
  id v16 = v8;
  id v10 = v8;
  dispatch_sync(ignoredTouchRegionsQueue, &v11);
  -[HNDAccessibilityManager _notifyObserversWillFetchElementsForEvent:](self, "_notifyObserversWillFetchElementsForEvent:", -[HNDAccessibilityManager _hndAccessibilityEventForFetchEvent:](self, "_hndAccessibilityEventForFetchEvent:", a4, v11, v12, v13, v14, v15));
}

- (void)fetcher:(id)a3 didFetchElementsForEvent:(unint64_t)a4 foundNewElements:(BOOL)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  if (![(HNDAccessibilityManager *)self isPausingScanning]) {
    goto LABEL_25;
  }
  unint64_t v48 = a4;
  unsigned int v47 = v5;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = [(HNDAccessibilityManager *)self currentApplications];
  id v9 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v51;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v51 != v11) {
          objc_enumerationMutation(obj);
        }
        unsigned int v13 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        pauseCountsByPid = self->_pauseCountsByPid;
        long long v15 = [v13 uiElement];
        id v16 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v15 pid]);
        long long v17 = [(NSMutableDictionary *)pauseCountsByPid objectForKeyedSubscript:v16];
        id v18 = [v17 unsignedIntegerValue];

        if (v18)
        {
          long long v30 = +[AXSubsystemSCPauseResume sharedInstance];
          unsigned __int8 v31 = [v30 ignoreLogging];

          if ((v31 & 1) == 0)
          {
            long long v32 = +[AXSubsystemSCPauseResume identifier];
            long long v33 = AXLoggerForFacility();

            os_log_type_t v34 = AXOSLogLevelFromAXLogLevel();
            if (os_log_type_enabled(v33, v34))
            {
              v35 = AXColorizeFormatLog();
              v46 = v13;
              id v36 = _AXStringForArgs();
              if (os_log_type_enabled(v33, v34))
              {
                *(_DWORD *)buf = 138543362;
                v55 = v36;
                _os_log_impl((void *)&_mh_execute_header, v33, v34, "%{public}@", buf, 0xCu);
              }
            }
          }

          uint64_t v5 = v47;
          goto LABEL_24;
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v19 = self->_pauseCountsByPid;
  long long v20 = +[NSNumber numberWithInt:kAXUIServerFakePid];
  long long v21 = [(NSMutableDictionary *)v19 objectForKeyedSubscript:v20];
  id v22 = [v21 unsignedIntegerValue];

  long long v23 = +[AXSubsystemSCPauseResume sharedInstance];
  unsigned __int8 v24 = [v23 ignoreLogging];

  if (v22)
  {
    uint64_t v5 = v47;
    a4 = v48;
    if (v24) {
      goto LABEL_25;
    }
    unsigned __int8 v25 = +[AXSubsystemSCPauseResume identifier];
    int v26 = AXLoggerForFacility();

    os_log_type_t v27 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v26, v27))
    {
      long long v28 = AXColorizeFormatLog();
      long long v29 = _AXStringForArgs();
      if (os_log_type_enabled(v26, v27))
      {
        *(_DWORD *)buf = 138543362;
        v55 = v29;
        _os_log_impl((void *)&_mh_execute_header, v26, v27, "%{public}@", buf, 0xCu);
      }

      uint64_t v5 = v47;
    }
  }
  else
  {
    uint64_t v5 = v47;
    if ((v24 & 1) == 0)
    {
      v41 = +[AXSubsystemSCPauseResume identifier];
      v42 = AXLoggerForFacility();

      os_log_type_t v43 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v42, v43))
      {
        v44 = AXColorizeFormatLog();
        v46 = [(HNDAccessibilityManager *)self currentApplications];
        v45 = _AXStringForArgs();

        if (os_log_type_enabled(v42, v43))
        {
          *(_DWORD *)buf = 138543362;
          v55 = v45;
          _os_log_impl((void *)&_mh_execute_header, v42, v43, "%{public}@", buf, 0xCu);
        }

        uint64_t v5 = v47;
      }
    }
    [(HNDAccessibilityManager *)self _requestResumeScanning];
  }
LABEL_24:
  a4 = v48;
LABEL_25:
  id v37 = [(HNDAccessibilityManager *)self rootScannerGroup];
  if ([v8 isGroupingEnabled])
  {
    int v38 = [v8 rootGroup];
    [(HNDAccessibilityManager *)self setRootScannerGroup:v38];
  }
  else
  {
    [(HNDAccessibilityManager *)self setRootScannerGroup:0];
  }
  v39 = [v8 elementCommunityGroup];
  [(HNDAccessibilityManager *)self setElementCommunityGroup:v39];

  [(HNDAccessibilityManager *)self _notifyObserversDidFetchElementsForEvent:[(HNDAccessibilityManager *)self _hndAccessibilityEventForFetchEvent:a4] foundNewElements:v5];
  id v40 = self;
}

- (void)fetcher:(id)a3 nativeFocusElementDidChange:(id)a4
{
}

- (void)fetcher:(id)a3 updateElementVisuals:(id)a4
{
}

- (void)fetcher:(id)a3 applicationWasActivated:(id)a4
{
}

- (void)fetcher:(id)a3 screenWillChange:(__CFData *)a4
{
}

- (void)fetcher:(id)a3 mediaDidBegin:(__CFData *)a4
{
}

+ (id)_existingSharedManager
{
  return (id)qword_1001F0AB8;
}

+ (void)_clearExistingSharedManager
{
  id v2 = (void *)qword_1001F0AB8;
  qword_1001F0AB8 = 0;
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (__AXObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(__AXObserver *)a3
{
  self->_AXObserverRef observer = a3;
}

- (AXDispatchTimer)elementFetchQueueTimer
{
  return self->_elementFetchQueueTimer;
}

- (void)setElementFetchQueueTimer:(id)a3
{
}

- (AXElementFetcher)elementFetcher
{
  return self->_elementFetcher;
}

- (void)setElementFetcher:(id)a3
{
}

- (NSString)springboardActionIdentifier
{
  return self->_springboardActionIdentifier;
}

- (void)setSpringboardActionIdentifier:(id)a3
{
}

- (NSMutableArray)accessibilityObservers
{
  return self->_accessibilityObservers;
}

- (void)setAccessibilityObservers:(id)a3
{
}

- (NSDate)lastAppTransitionTime
{
  return self->_lastAppTransitionTime;
}

- (void)setLastAppTransitionTime:(id)a3
{
}

- (AXElementGroup)rootScannerGroup
{
  return self->_rootScannerGroup;
}

- (void)setRootScannerGroup:(id)a3
{
}

- (AXElement)axOrbPreviewWindow
{
  return self->_axOrbPreviewWindow;
}

- (void)setAxOrbPreviewWindow:(id)a3
{
}

- (BOOL)isSystemSleeping
{
  return self->_isSystemSleeping;
}

- (void)setIsSystemSleeping:(BOOL)a3
{
  self->_isSystemSleeping = a3;
}

- (BOOL)isPausingScanning
{
  return self->_isPausingScanning;
}

- (void)setIsPausingScanning:(BOOL)a3
{
  self->_isPausingScanning = a3;
}

- (AXElementGroup)elementCommunityGroup
{
  return self->_elementCommunityGroup;
}

- (void)setElementCommunityGroup:(id)a3
{
}

- (NSArray)currentApplications
{
  return self->_currentApplications;
}

- (void)setCurrentApplications:(id)a3
{
}

- (NSArray)ignoredTouchRegions
{
  return self->_ignoredTouchRegions;
}

- (void)setIgnoredTouchRegions:(id)a3
{
}

- (NSMutableDictionary)currentDisplays
{
  return self->_currentDisplays;
}

- (void)setCurrentDisplays:(id)a3
{
}

- (NSMutableArray)currentlyObservingNotifications
{
  return self->_currentlyObservingNotifications;
}

- (void)setCurrentlyObservingNotifications:(id)a3
{
}

- (OS_dispatch_queue)notificationObserverQueue
{
  return self->_notificationObserverQueue;
}

- (void)setNotificationObserverQueue:(id)a3
{
}

- (NSArray)_testingElements
{
  return self->__testingElements;
}

- (void)_setTestingElements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__testingElements, 0);
  objc_storeStrong((id *)&self->_notificationObserverQueue, 0);
  objc_storeStrong((id *)&self->_currentlyObservingNotifications, 0);
  objc_storeStrong((id *)&self->_currentDisplays, 0);
  objc_storeStrong((id *)&self->_ignoredTouchRegions, 0);
  objc_storeStrong((id *)&self->_currentApplications, 0);
  objc_storeStrong((id *)&self->_elementCommunityGroup, 0);
  objc_storeStrong((id *)&self->_axOrbPreviewWindow, 0);
  objc_storeStrong((id *)&self->_rootScannerGroup, 0);
  objc_storeStrong((id *)&self->_lastAppTransitionTime, 0);
  objc_storeStrong((id *)&self->_accessibilityObservers, 0);
  objc_storeStrong((id *)&self->_springboardActionIdentifier, 0);
  objc_storeStrong((id *)&self->_elementFetcher, 0);
  objc_storeStrong((id *)&self->_elementFetchQueueTimer, 0);
  objc_storeStrong((id *)&self->_pauseCountsByPid, 0);
  objc_storeStrong((id *)&self->_ignoredTouchRegionsQueue, 0);

  objc_storeStrong((id *)&self->_appTransitionQueue, 0);
}

@end