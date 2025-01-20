@interface AXElementFetcher
+ (id)springBoardElement;
+ (id)systemWideElement;
- (AXElement)nativeFocusElement;
- (AXElementFetcher)initWithDelegate:(id)a3 fetchEvents:(unint64_t)a4 enableEventManagement:(BOOL)a5 enableGrouping:(BOOL)a6 shouldIncludeNonScannerElements:(BOOL)a7 beginEnabled:(BOOL)a8;
- (AXElementFetcherDelegate)delegate;
- (AXElementGroup)elementCommunityGroup;
- (AXElementGroup)elementCommunityGroupCache;
- (AXElementGroup)firstKeyboardRow;
- (AXElementGroup)keyboardGroup;
- (AXElementGroup)keyboardGroupCache;
- (AXElementGroup)lastKeyboardRow;
- (AXElementGroup)rootGroup;
- (AXElementGroup)rootGroupCache;
- (AXElementGroupPruner)elementGroupPruner;
- (AXVisualElementGrouper)visualElementGrouper;
- (BOOL)_fetchElements:(BOOL)a3;
- (BOOL)_fetchEventCanBeManaged:(unint64_t)a3;
- (BOOL)_fetchGroups:(BOOL)a3;
- (BOOL)_shouldConsiderCacheAsInvalid;
- (BOOL)_updateCurrentApps;
- (BOOL)didSendFakeScreenChangeOnLastFetch;
- (BOOL)isEnabled;
- (BOOL)isEventManagementEnabled;
- (BOOL)isFetchingElements;
- (BOOL)isGroupingEnabled;
- (BOOL)shouldIncludeNonScannerElements;
- (BOOL)willFetchElements;
- (NSArray)availableElements;
- (NSArray)currentApps;
- (NSArray)customCurrentApps;
- (NSArray)elementCache;
- (NSMapTable)fetchObservers;
- (NSMutableDictionary)postFetchFilters;
- (double)_delayForFetchEvent:(unint64_t)a3;
- (id)_axNotificationsForManagedEvents;
- (id)_debugStringForFetchEvents:(unint64_t)a3;
- (id)_fetchUnprocessedAppGroups;
- (id)_fetchUnprocessedElements:(id)a3;
- (id)_filterElements:(id)a3 withFilter:(id)a4;
- (id)_filterGroup:(id)a3 withFilter:(id)a4;
- (id)_findElementsMatchingBlock:(id)a3 internalRequest:(BOOL)a4;
- (id)_findGroupableMatchingBlock:(id)a3 inElementGroup:(id)a4;
- (id)_findGroupableMatchingGroupable:(id)a3 inElementGroup:(id)a4;
- (id)_groupWithDictionary:(id)a3 currentPid:(int)a4;
- (id)_groupWithItems:(id)a3 groupTraits:(unint64_t)a4 scanningBehaviorTraits:(unint64_t)a5 label:(id)a6 identifier:(id)a7 currentPid:(int)a8;
- (id)_processAppGroup:(id)a3 keyboardGroup:(id *)a4;
- (id)_siblingOfGroupable:(id)a3 forDirection:(BOOL)a4 didWrap:(BOOL *)a5;
- (id)closestElementToElement:(id)a3;
- (id)closestElementToPoint:(CGPoint)a3;
- (id)description;
- (id)findElementMatchingBlock:(id)a3;
- (id)findElementMatchingElement:(id)a3;
- (id)findElementsMatchingBlock:(id)a3;
- (id)findGroupableMatchingBlock:(id)a3;
- (id)findGroupableMatchingGroupable:(id)a3;
- (id)firstElement;
- (id)inCallServiceApplication;
- (id)lastElement;
- (id)nextSiblingOfElement:(id)a3 didWrap:(BOOL *)a4;
- (id)nextSiblingOfGroupable:(id)a3 didWrap:(BOOL *)a4;
- (id)previousSiblingOfElement:(id)a3 didWrap:(BOOL *)a4;
- (id)previousSiblingOfGroupable:(id)a3 didWrap:(BOOL *)a4;
- (int64_t)_priorityForFetchEvent:(unint64_t)a3;
- (int64_t)elementGroupingHeuristics;
- (unint64_t)activeFetchEvents;
- (void)_debugLogElementCache;
- (void)_fetchEventOccurred:(unint64_t)a3;
- (void)_handleApplicationWasActivated:(id)a3;
- (void)_handleMediaDidBegin:(__CFData *)a3;
- (void)_handleNativeFocusItemDidChange:(__CFData *)a3;
- (void)_handleScreenWillChange:(__CFData *)a3;
- (void)_handleUpdateElementVisuals:(__CFData *)a3;
- (void)_notifyObserversApplicationWasActivated:(id)a3;
- (void)_notifyObserversDidFetchElementsForEvent:(unint64_t)a3 foundNewElements:(BOOL)a4;
- (void)_notifyObserversDidScheduleFetchEvent:(unint64_t)a3;
- (void)_notifyObserversMediaDidBegin:(__CFData *)a3;
- (void)_notifyObserversNativeFocusElementDidChange:(id)a3;
- (void)_notifyObserversScreenWillChange:(__CFData *)a3;
- (void)_notifyObserversUpdateElementVisuals:(id)a3;
- (void)_notifyObserversWillFetchElementsForEvent:(unint64_t)a3;
- (void)_scheduleFetchEvent:(unint64_t)a3;
- (void)_sendFakeScreenChangeIfNecessaryForGroups:(id)a3 orElements:(id)a4 appsDidChange:(BOOL)a5;
- (void)_setCurrentApplications:(id)a3;
- (void)_tearDownEventCoalesceTimer;
- (void)addFetchEvents:(unint64_t)a3;
- (void)addPostFetchFilter:(id)a3 withIdentifier:(id)a4;
- (void)clearCache;
- (void)dealloc;
- (void)disableEventManagement;
- (void)enableEventManagement;
- (void)fetchEventOccurred:(unint64_t)a3;
- (void)refresh;
- (void)registerFetchObserver:(id)a3 targetQueue:(id)a4;
- (void)removeAllPostFetchFilters;
- (void)removeFetchEvents:(unint64_t)a3;
- (void)removePostFetchFilterWithIdentifier:(id)a3;
- (void)setActiveFetchEvents:(unint64_t)a3;
- (void)setCurrentApps:(id)a3;
- (void)setCustomCurrentApps:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidSendFakeScreenChangeOnLastFetch:(BOOL)a3;
- (void)setElementCache:(id)a3;
- (void)setElementCommunityGroupCache:(id)a3;
- (void)setElementGroupingHeuristics:(int64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEventManagementEnabled:(BOOL)a3;
- (void)setFetchObservers:(id)a3;
- (void)setFetchingElements:(BOOL)a3;
- (void)setGroupingEnabled:(BOOL)a3;
- (void)setKeyboardGroupCache:(id)a3;
- (void)setPostFetchFilters:(id)a3;
- (void)setRootGroupCache:(id)a3;
- (void)setShouldIncludeNonScannerElements:(BOOL)a3;
- (void)setVisualElementGrouper:(id)a3;
- (void)unregisterAllFetchObservers;
- (void)unregisterFetchObserver:(id)a3;
@end

@implementation AXElementFetcher

+ (id)systemWideElement
{
  return +[AXElement systemWideElement];
}

+ (id)springBoardElement
{
  v2 = +[AXElementFetcher systemWideElement];
  v3 = [v2 elementForAttribute:1000];

  return v3;
}

- (AXElementFetcher)initWithDelegate:(id)a3 fetchEvents:(unint64_t)a4 enableEventManagement:(BOOL)a5 enableGrouping:(BOOL)a6 shouldIncludeNonScannerElements:(BOOL)a7 beginEnabled:(BOOL)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  v29.receiver = self;
  v29.super_class = (Class)AXElementFetcher;
  v15 = [(AXElementFetcher *)&v29 init];
  v16 = v15;
  if (!v15) {
    goto LABEL_9;
  }
  objc_storeWeak((id *)&v15->_delegate, v14);
  v16->_enabled = a8;
  uint64_t v17 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
  fetchObservers = v16->_fetchObservers;
  v16->_fetchObservers = (NSMapTable *)v17;

  v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  postFetchFilters = v16->_postFetchFilters;
  v16->_postFetchFilters = v19;

  [(AXElementFetcher *)v16 addFetchEvents:a4];
  v16->_groupingEnabled = a6;
  v16->_shouldIncludeNonScannerElements = a7;
  dispatch_queue_t v21 = dispatch_queue_create("ax-element-fetch", 0);
  elementFetchQueue = v16->_elementFetchQueue;
  v16->_elementFetchQueue = (OS_dispatch_queue *)v21;

  dispatch_queue_t v23 = dispatch_queue_create("ax-element-access", 0);
  elementAccessQueue = v16->_elementAccessQueue;
  v16->_elementAccessQueue = (OS_dispatch_queue *)v23;

  dispatch_queue_t v25 = dispatch_queue_create("ax-filter-access", 0);
  filterAccessQueue = v16->_filterAccessQueue;
  v16->_filterAccessQueue = (OS_dispatch_queue *)v25;

  if (!v16->_elementFetchQueue || !v16->_elementAccessQueue || !v16->_filterAccessQueue)
  {
    NSLog((NSString *)@"Error: AXElementFetcher was not able to create its queues");
LABEL_9:
    v27 = 0;
    goto LABEL_10;
  }
  if (v11) {
    [(AXElementFetcher *)v16 enableEventManagement];
  }
  v27 = v16;
LABEL_10:

  return v27;
}

- (void)dealloc
{
  [(AXElementFetcher *)self _tearDownEventCoalesceTimer];
  [(AXElementFetcher *)self disableEventManagement];
  [(AXElementFetcher *)self unregisterAllFetchObservers];
  v3.receiver = self;
  v3.super_class = (Class)AXElementFetcher;
  [(AXElementFetcher *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = [(AXElementFetcher *)self _debugStringForFetchEvents:[(AXElementFetcher *)self activeFetchEvents]];
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[AXElementFetcher isFetchingElements](self, "isFetchingElements"));
  v6 = [(AXElementFetcher *)self currentApps];
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[AXElementFetcher isGroupingEnabled](self, "isGroupingEnabled"));
  v8 = [v3 stringWithFormat:@"AXElementFetcher<%p>. FetchEvents:%@. IsFetching:%@ CurrentApp:%@ UsingGroups:%@", self, v4, v5, v6, v7];

  return v8;
}

- (void)_setCurrentApplications:(id)a3
{
}

- (AXElement)nativeFocusElement
{
  v2 = +[AXElement primaryApp];
  objc_super v3 = [v2 nativeFocusPreferredElement];

  v4 = [v3 application];
  int v5 = [v4 isEqual:v3];

  if (v5)
  {
    uint64_t v6 = [v3 nativeFocusPreferredElement];

    objc_super v3 = (void *)v6;
  }
  return (AXElement *)v3;
}

- (id)inCallServiceApplication
{
  v2 = +[AXElement systemWideElement];
  objc_super v3 = [v2 elementForAttribute:1007 shouldFetchAttributes:0];
  v4 = [v3 uiElement];
  int v5 = [v4 objectWithAXAttribute:3003];

  if ([v5 isEqualToString:@"com.apple.InCallService"]) {
    id v6 = v3;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (NSArray)currentApps
{
  currentApps = self->_currentApps;
  if (!currentApps)
  {
    [(AXElementFetcher *)self _updateCurrentApps];
    currentApps = self->_currentApps;
  }
  return currentApps;
}

- (BOOL)_updateCurrentApps
{
  objc_super v3 = +[AXElement systemWideElement];
  v4 = [v3 systemApplication];

  int v5 = [v4 currentApplications];
  id v6 = (void *)[v5 mutableCopy];

  v7 = [v4 uiElement];
  v8 = [v7 arrayWithAXAttribute:1111];

  if ([v8 count])
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __38__AXElementFetcher__updateCurrentApps__block_invoke;
    v19 = &unk_1E6220CE8;
    id v20 = v8;
    id v9 = v6;
    id v21 = v9;
    [v9 enumerateObjectsUsingBlock:&v16];
    if (!objc_msgSend(v9, "count", v16, v17, v18, v19))
    {
      v10 = [(id)objc_opt_class() springBoardElement];

      if (v10)
      {
        BOOL v11 = [(id)objc_opt_class() springBoardElement];
        [v9 addObject:v11];
      }
    }
  }
  customCurrentApps = self->_customCurrentApps;
  if (customCurrentApps)
  {
    uint64_t v13 = [(NSArray *)customCurrentApps mutableCopy];

    id v6 = (void *)v13;
  }
  int v14 = [(NSArray *)self->_currentApps isEqual:v6] ^ 1;
  [(AXElementFetcher *)self setCurrentApps:v6];

  return v14;
}

void __38__AXElementFetcher__updateCurrentApps__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v6 = v3;
  int v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "pid"));
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4) {
    [*(id *)(a1 + 40) removeObject:v6];
  }
}

- (BOOL)willFetchElements
{
  return self->_scheduledFetchEvent != 0;
}

- (NSArray)availableElements
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  elementAccessQueue = self->_elementAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__AXElementFetcher_availableElements__block_invoke;
  v5[3] = &unk_1E6220AC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(elementAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __37__AXElementFetcher_availableElements__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) elementCache];
  return MEMORY[0x1F41817F8]();
}

- (AXElementGroup)rootGroup
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  elementAccessQueue = self->_elementAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__AXElementFetcher_rootGroup__block_invoke;
  v5[3] = &unk_1E6220AC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(elementAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AXElementGroup *)v3;
}

uint64_t __29__AXElementFetcher_rootGroup__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) rootGroupCache];
  return MEMORY[0x1F41817F8]();
}

- (AXElementGroup)keyboardGroup
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  elementAccessQueue = self->_elementAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__AXElementFetcher_keyboardGroup__block_invoke;
  v5[3] = &unk_1E6220AC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(elementAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AXElementGroup *)v3;
}

uint64_t __33__AXElementFetcher_keyboardGroup__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) keyboardGroupCache];
  return MEMORY[0x1F41817F8]();
}

- (AXElementGroup)firstKeyboardRow
{
  v2 = [(AXElementFetcher *)self keyboardGroup];
  id v3 = [v2 firstChildPassingTest:&__block_literal_global_12];

  return (AXElementGroup *)v3;
}

uint64_t __36__AXElementFetcher_firstKeyboardRow__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isGroup]) {
    uint64_t v3 = [v2 isKeyboardRow];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (AXElementGroup)lastKeyboardRow
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [(AXElementFetcher *)self keyboardGroup];
  uint64_t v3 = [v2 descendantsPassingTest:&__block_literal_global_288];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = objc_msgSend(v3, "reverseObjectEnumerator", 0);
  id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 isKeyboardRow])
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (AXElementGroup *)v5;
}

uint64_t __35__AXElementFetcher_lastKeyboardRow__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isGroup]) {
    uint64_t v3 = [v2 isKeyboardRow];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (AXElementGroup)elementCommunityGroup
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__2;
  long long v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  elementAccessQueue = self->_elementAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__AXElementFetcher_elementCommunityGroup__block_invoke;
  v5[3] = &unk_1E6220AC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(elementAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AXElementGroup *)v3;
}

uint64_t __41__AXElementFetcher_elementCommunityGroup__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) elementCommunityGroupCache];
  return MEMORY[0x1F41817F8]();
}

- (void)registerFetchObserver:(id)a3 targetQueue:(id)a4
{
  id v9 = a4;
  if (!v9)
  {
    id v9 = (id)MEMORY[0x1E4F14428];
    id v6 = MEMORY[0x1E4F14428];
  }
  id v7 = a3;
  uint64_t v8 = [(AXElementFetcher *)self fetchObservers];
  [v8 setObject:v9 forKey:v7];
}

- (void)unregisterFetchObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(AXElementFetcher *)self fetchObservers];
  [v5 removeObjectForKey:v4];
}

- (void)unregisterAllFetchObservers
{
  id v2 = [(AXElementFetcher *)self fetchObservers];
  [v2 removeAllObjects];
}

- (void)_notifyObserversWillFetchElementsForEvent:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v14 = [(AXElementFetcher *)self currentApps];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = [(AXElementFetcher *)self fetchObservers];
  id v5 = [v4 keyEnumerator];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          id v11 = [(AXElementFetcher *)self fetchObservers];
          long long v12 = [v11 objectForKey:v10];

          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __62__AXElementFetcher__notifyObserversWillFetchElementsForEvent___block_invoke;
          block[3] = &unk_1E6220D30;
          block[4] = v10;
          block[5] = self;
          unint64_t v17 = a3;
          id v16 = v14;
          dispatch_sync(v12, block);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
}

uint64_t __62__AXElementFetcher__notifyObserversWillFetchElementsForEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetcher:*(void *)(a1 + 40) willFetchElementsForEvent:*(void *)(a1 + 56) fromApplications:*(void *)(a1 + 48)];
}

- (void)_notifyObserversNativeFocusElementDidChange:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(AXElementFetcher *)self fetchObservers];
  id v5 = [v4 keyEnumerator];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          id v11 = [(AXElementFetcher *)self fetchObservers];
          long long v12 = [v11 objectForKey:v10];

          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __64__AXElementFetcher__notifyObserversNativeFocusElementDidChange___block_invoke;
          block[3] = &unk_1E6220B10;
          block[4] = v10;
          block[5] = self;
          id v15 = v13;
          dispatch_sync(v12, block);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

uint64_t __64__AXElementFetcher__notifyObserversNativeFocusElementDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetcher:*(void *)(a1 + 40) nativeFocusElementDidChange:*(void *)(a1 + 48)];
}

- (void)_notifyObserversUpdateElementVisuals:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(AXElementFetcher *)self fetchObservers];
  id v5 = [v4 keyEnumerator];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          id v11 = [(AXElementFetcher *)self fetchObservers];
          long long v12 = [v11 objectForKey:v10];

          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __57__AXElementFetcher__notifyObserversUpdateElementVisuals___block_invoke;
          block[3] = &unk_1E6220B10;
          block[4] = v10;
          block[5] = self;
          id v15 = v13;
          dispatch_sync(v12, block);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

uint64_t __57__AXElementFetcher__notifyObserversUpdateElementVisuals___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetcher:*(void *)(a1 + 40) updateElementVisuals:*(void *)(a1 + 48)];
}

- (void)_notifyObserversApplicationWasActivated:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(AXElementFetcher *)self fetchObservers];
  id v5 = [v4 keyEnumerator];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          id v11 = [(AXElementFetcher *)self fetchObservers];
          long long v12 = [v11 objectForKey:v10];

          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __60__AXElementFetcher__notifyObserversApplicationWasActivated___block_invoke;
          block[3] = &unk_1E6220B10;
          block[4] = v10;
          block[5] = self;
          id v15 = v13;
          dispatch_sync(v12, block);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

uint64_t __60__AXElementFetcher__notifyObserversApplicationWasActivated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetcher:*(void *)(a1 + 40) applicationWasActivated:*(void *)(a1 + 48)];
}

- (void)_notifyObserversScreenWillChange:(__CFData *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(AXElementFetcher *)self fetchObservers];
  id v5 = [v4 keyEnumerator];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          id v11 = [(AXElementFetcher *)self fetchObservers];
          long long v12 = [v11 objectForKey:v10];

          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __53__AXElementFetcher__notifyObserversScreenWillChange___block_invoke;
          block[3] = &unk_1E6220D58;
          block[4] = v10;
          block[5] = self;
          void block[6] = a3;
          dispatch_sync(v12, block);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

uint64_t __53__AXElementFetcher__notifyObserversScreenWillChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetcher:*(void *)(a1 + 40) screenWillChange:*(void *)(a1 + 48)];
}

- (void)_notifyObserversMediaDidBegin:(__CFData *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(AXElementFetcher *)self fetchObservers];
  id v5 = [v4 keyEnumerator];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          id v11 = [(AXElementFetcher *)self fetchObservers];
          long long v12 = [v11 objectForKey:v10];

          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __50__AXElementFetcher__notifyObserversMediaDidBegin___block_invoke;
          block[3] = &unk_1E6220D58;
          block[4] = v10;
          block[5] = self;
          void block[6] = a3;
          dispatch_sync(v12, block);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

uint64_t __50__AXElementFetcher__notifyObserversMediaDidBegin___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetcher:*(void *)(a1 + 40) mediaDidBegin:*(void *)(a1 + 48)];
}

- (void)_notifyObserversDidFetchElementsForEvent:(unint64_t)a3 foundNewElements:(BOOL)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [(AXElementFetcher *)self fetchObservers];
  uint64_t v6 = [v5 keyEnumerator];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector())
        {
          long long v12 = [(AXElementFetcher *)self fetchObservers];
          id v13 = [v12 objectForKey:v11];

          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __78__AXElementFetcher__notifyObserversDidFetchElementsForEvent_foundNewElements___block_invoke;
          block[3] = &unk_1E6220D80;
          block[4] = v11;
          block[5] = self;
          void block[6] = a3;
          BOOL v17 = a4;
          dispatch_sync(v13, block);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
}

uint64_t __78__AXElementFetcher__notifyObserversDidFetchElementsForEvent_foundNewElements___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetcher:*(void *)(a1 + 40) didFetchElementsForEvent:*(void *)(a1 + 48) foundNewElements:*(unsigned __int8 *)(a1 + 56)];
}

- (void)_notifyObserversDidScheduleFetchEvent:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(AXElementFetcher *)self fetchObservers];
  id v5 = [v4 keyEnumerator];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v11 = [(AXElementFetcher *)self fetchObservers];
          long long v12 = [v11 objectForKey:v10];

          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __58__AXElementFetcher__notifyObserversDidScheduleFetchEvent___block_invoke;
          block[3] = &unk_1E6220D58;
          block[4] = v10;
          block[5] = self;
          void block[6] = a3;
          dispatch_async(v12, block);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

uint64_t __58__AXElementFetcher__notifyObserversDidScheduleFetchEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetcher:*(void *)(a1 + 40) didScheduleFetchEvent:*(void *)(a1 + 48)];
}

- (void)addFetchEvents:(unint64_t)a3
{
  unint64_t v4 = [(AXElementFetcher *)self activeFetchEvents] | a3 | 1;
  [(AXElementFetcher *)self setActiveFetchEvents:v4];
}

- (void)removeFetchEvents:(unint64_t)a3
{
  unint64_t v4 = [(AXElementFetcher *)self activeFetchEvents] & ~a3 | 1;
  [(AXElementFetcher *)self setActiveFetchEvents:v4];
}

- (void)refresh
{
}

- (void)fetchEventOccurred:(unint64_t)a3
{
  if (![(AXElementFetcher *)self isEventManagementEnabled]
    || ![(AXElementFetcher *)self _fetchEventCanBeManaged:a3])
  {
    [(AXElementFetcher *)self _fetchEventOccurred:a3];
  }
}

- (void)_fetchEventOccurred:(unint64_t)a3
{
  if (self->_enabled)
  {
    id v5 = [(AXElementFetcher *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = [(AXElementFetcher *)self delegate];
      char v7 = [v6 isSystemSleeping:self];

      if (v7) {
        return;
      }
    }
    else
    {
    }
    int64_t v8 = [(AXElementFetcher *)self _priorityForFetchEvent:a3];
    if ((v8 & 0x8000000000000000) == 0)
    {
      int64_t v9 = v8;
      if (([(AXElementFetcher *)self activeFetchEvents] & a3) != 0
        && v9 >= [(AXElementFetcher *)self _priorityForFetchEvent:self->_scheduledFetchEvent])
      {
        [(AXElementFetcher *)self _scheduleFetchEvent:a3];
      }
    }
  }
}

- (void)_handleNativeFocusItemDidChange:(__CFData *)a3
{
  elementFetchQueue = self->_elementFetchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AXElementFetcher__handleNativeFocusItemDidChange___block_invoke;
  block[3] = &unk_1E6220A08;
  block[4] = self;
  dispatch_async(elementFetchQueue, block);
}

void __52__AXElementFetcher__handleNativeFocusItemDidChange___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 nativeFocusElement];
  [v1 _notifyObserversNativeFocusElementDidChange:v2];
}

- (void)_handleUpdateElementVisuals:(__CFData *)a3
{
  elementFetchQueue = self->_elementFetchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__AXElementFetcher__handleUpdateElementVisuals___block_invoke;
  v4[3] = &unk_1E6220DA8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(elementFetchQueue, v4);
}

uint64_t __48__AXElementFetcher__handleUpdateElementVisuals___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyObserversUpdateElementVisuals:*(void *)(a1 + 40)];
}

- (void)_handleApplicationWasActivated:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    elementFetchQueue = self->_elementFetchQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__AXElementFetcher__handleApplicationWasActivated___block_invoke;
    v6[3] = &unk_1E6220560;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(elementFetchQueue, v6);
  }
}

uint64_t __51__AXElementFetcher__handleApplicationWasActivated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyObserversApplicationWasActivated:*(void *)(a1 + 40)];
}

- (void)_handleScreenWillChange:(__CFData *)a3
{
  elementFetchQueue = self->_elementFetchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__AXElementFetcher__handleScreenWillChange___block_invoke;
  v4[3] = &unk_1E6220DA8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(elementFetchQueue, v4);
}

uint64_t __44__AXElementFetcher__handleScreenWillChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyObserversScreenWillChange:*(void *)(a1 + 40)];
}

- (void)_handleMediaDidBegin:(__CFData *)a3
{
  elementFetchQueue = self->_elementFetchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__AXElementFetcher__handleMediaDidBegin___block_invoke;
  v4[3] = &unk_1E6220DA8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(elementFetchQueue, v4);
}

uint64_t __41__AXElementFetcher__handleMediaDidBegin___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyObserversMediaDidBegin:*(void *)(a1 + 40)];
}

- (void)_tearDownEventCoalesceTimer
{
  eventCoalesceTimer = self->_eventCoalesceTimer;
  if (eventCoalesceTimer)
  {
    dispatch_source_cancel(eventCoalesceTimer);
    id v4 = self->_eventCoalesceTimer;
    self->_eventCoalesceTimer = 0;
  }
}

- (void)_scheduleFetchEvent:(unint64_t)a3
{
  [(AXElementFetcher *)self _notifyObserversDidScheduleFetchEvent:self->_scheduledFetchEvent];
  [(AXElementFetcher *)self _delayForFetchEvent:a3];
  double v6 = v5;
  self->_scheduledFetchEvent = a3;
  eventCoalesceTimer = self->_eventCoalesceTimer;
  if (eventCoalesceTimer)
  {
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
    dispatch_source_set_timer(eventCoalesceTimer, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  else
  {
    int64_t v9 = dispatch_get_global_queue(0, 0);
    uint64_t v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v9);
    uint64_t v11 = self->_eventCoalesceTimer;
    self->_eventCoalesceTimer = v10;

    long long v12 = self->_eventCoalesceTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __40__AXElementFetcher__scheduleFetchEvent___block_invoke;
    handler[3] = &unk_1E6220A08;
    handler[4] = self;
    dispatch_source_set_event_handler(v12, handler);
    id v13 = self->_eventCoalesceTimer;
    dispatch_time_t v14 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_eventCoalesceTimer);
  }
}

uint64_t __40__AXElementFetcher__scheduleFetchEvent___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 65) = 1;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 40);
  *(void *)(v2 + 40) = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__AXElementFetcher__scheduleFetchEvent___block_invoke_2;
  v7[3] = &unk_1E6220DA8;
  v7[4] = v4;
  v7[5] = v3;
  dispatch_async(v5, v7);
  return [*(id *)(a1 + 32) _tearDownEventCoalesceTimer];
}

uint64_t __40__AXElementFetcher__scheduleFetchEvent___block_invoke_2(uint64_t a1)
{
  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason();
  uint64_t v2 = [*(id *)(a1 + 32) _updateCurrentApps];
  [*(id *)(a1 + 32) _notifyObserversWillFetchElementsForEvent:*(void *)(a1 + 40)];
  int v3 = [*(id *)(a1 + 32) isGroupingEnabled];
  uint64_t v4 = *(void **)(a1 + 32);
  if (v3) {
    uint64_t v5 = [v4 _fetchGroups:v2];
  }
  else {
    uint64_t v5 = [v4 _fetchElements:v2];
  }
  uint64_t v6 = v5;
  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason();
  uint64_t result = [*(id *)(a1 + 32) _notifyObserversDidFetchElementsForEvent:*(void *)(a1 + 40) foundNewElements:v6];
  *(unsigned char *)(*(void *)(a1 + 32) + 65) = 0;
  return result;
}

- (double)_delayForFetchEvent:(unint64_t)a3
{
  double result = 0.0;
  if ((uint64_t)a3 <= 15)
  {
    double v4 = 1.0;
    if (a3 == 8) {
      double result = 1.0;
    }
    if (a3 == 4) {
      double result = 1.0;
    }
    BOOL v5 = a3 == 2;
    goto LABEL_11;
  }
  if ((uint64_t)a3 <= 127)
  {
    double v4 = 1.0;
    if (a3 == 64) {
      double result = 1.0;
    }
    BOOL v5 = a3 == 16;
LABEL_11:
    if (v5) {
      return v4;
    }
    return result;
  }
  if (a3 == 128) {
    return 0.300000012;
  }
  if (a3 == 256) {
    return 0.0500000007;
  }
  return result;
}

- (int64_t)_priorityForFetchEvent:(unint64_t)a3
{
  int64_t result = -1;
  if ((uint64_t)a3 <= 15)
  {
    switch(a3)
    {
      case 0uLL:
        return result;
      case 1uLL:
        int64_t result = 1;
        break;
      case 2uLL:
        int64_t result = 7;
        break;
      case 4uLL:
        int64_t result = 3;
        break;
      case 8uLL:
        int64_t result = 6;
        break;
      default:
        return 0;
    }
    return result;
  }
  if ((uint64_t)a3 > 63)
  {
    switch(a3)
    {
      case 0x40uLL:
        return 4;
      case 0x80uLL:
        return 2;
      case 0x100uLL:
        return 8;
    }
    return 0;
  }
  if (a3 == 16) {
    return 5;
  }
  if (a3 != 32) {
    return 0;
  }
  return result;
}

- (BOOL)_fetchEventCanBeManaged:(unint64_t)a3
{
  return a3 - 4 <= 0x3C && ((1 << (a3 - 4)) & 0x1000000010001011) != 0 || a3 == 256 || a3 == 128;
}

- (id)_axNotificationsForManagedEvents
{
  return &unk_1F1423FC8;
}

- (void)enableEventManagement
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (![(AXElementFetcher *)self isEventManagementEnabled])
  {
    int v3 = +[AXElementFetcher systemWideElement];
    double v4 = (const __AXUIElement *)[v3 elementRef];

    pid_t pid = 0;
    uint64_t v5 = AXUIElementGetPid(v4, &pid);
    if (v5)
    {
      uint64_t v6 = [NSNumber numberWithInt:v5];
      NSLog((NSString *)@"AXError: Not able to get pid for systemElement. error:%@. systemElementRef:%@", v6, v4);
LABEL_6:

      return;
    }
    uint64_t v7 = AXObserverCreate(pid, (AXObserverCallback)_accessibilityEventsHandler_0, &self->_axRuntimeNotificationObserver);
    if (v7)
    {
      uint64_t v6 = [NSNumber numberWithInt:v7];
      NSLog((NSString *)@"AXError: Not able to create ax observer. error:%@", v6);
      goto LABEL_6;
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    dispatch_time_t v8 = [(AXElementFetcher *)self _axNotificationsForManagedEvents];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v14 = AXObserverAddNotification(self->_axRuntimeNotificationObserver, v4, (CFStringRef)[v13 intValue], self);
          if (v14)
          {
            long long v15 = [NSNumber numberWithInt:v14];
            NSLog((NSString *)@"Not able to register for axNotification:%@. error:%@", v13, v15);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v10);
    }

    CFRunLoopSourceRef RunLoopSource = AXObserverGetRunLoopSource(self->_axRuntimeNotificationObserver);
    if (RunLoopSource)
    {
      long long v17 = RunLoopSource;
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, v17, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
      [(AXElementFetcher *)self setEventManagementEnabled:1];
    }
  }
}

- (void)disableEventManagement
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(AXElementFetcher *)self isEventManagementEnabled])
  {
    if (self->_axRuntimeNotificationObserver)
    {
      int v3 = +[AXElementFetcher systemWideElement];
      double v4 = (const __AXUIElement *)[v3 elementRef];

      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      uint64_t v5 = [(AXElementFetcher *)self _axNotificationsForManagedEvents];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v15 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            uint64_t v11 = AXObserverRemoveNotification(self->_axRuntimeNotificationObserver, v4, (CFStringRef)[v10 intValue]);
            if (v11)
            {
              long long v12 = [NSNumber numberWithInt:v11];
              NSLog((NSString *)@"Not able to unregister for axNotification:%@. error:%@", v10, v12);
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v7);
      }

      axRuntimeNotificationObserver = self->_axRuntimeNotificationObserver;
      if (axRuntimeNotificationObserver) {
        CFRelease(axRuntimeNotificationObserver);
      }
      self->_axRuntimeNotificationObserver = 0;
    }
    [(AXElementFetcher *)self setEventManagementEnabled:0];
  }
}

- (BOOL)_shouldConsiderCacheAsInvalid
{
  return 0;
}

- (void)_sendFakeScreenChangeIfNecessaryForGroups:(id)a3 orElements:(id)a4 appsDidChange:(BOOL)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (![(AXElementFetcher *)self didSendFakeScreenChangeOnLastFetch])
  {
    if (a5) {
      goto LABEL_21;
    }
    id v10 = [(AXElementFetcher *)self currentApps];
    if ([v10 count] == 1)
    {
      uint64_t v11 = [(AXElementFetcher *)self currentApps];
      long long v12 = [v11 firstObject];
      int v13 = [v12 isSpringBoard];

      if (!v13) {
        goto LABEL_21;
      }
      if (v8)
      {
        long long v14 = [v8 firstObject];
        long long v15 = [v14 firstDescendantPassingTest:&__block_literal_global_338];

        if (!v15) {
          goto LABEL_21;
        }
        goto LABEL_20;
      }
      if (![v9 count])
      {
LABEL_20:
        [(AXElementFetcher *)self setDidSendFakeScreenChangeOnLastFetch:1];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __87__AXElementFetcher__sendFakeScreenChangeIfNecessaryForGroups_orElements_appsDidChange___block_invoke_2;
        block[3] = &unk_1E6220A08;
        block[4] = self;
        dispatch_async(MEMORY[0x1E4F14428], block);
        goto LABEL_21;
      }
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v10 = v9;
      uint64_t v16 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v22;
        while (2)
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v22 != v18) {
              objc_enumerationMutation(v10);
            }
            if (([*(id *)(*((void *)&v21 + 1) + 8 * v19) traits] & 0x800000) != 0)
            {

              goto LABEL_20;
            }
            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }
    }

    goto LABEL_21;
  }
  [(AXElementFetcher *)self setDidSendFakeScreenChangeOnLastFetch:0];
LABEL_21:
}

BOOL __87__AXElementFetcher__sendFakeScreenChangeIfNecessaryForGroups_orElements_appsDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = ([v2 isGroup] & 1) == 0 && (objc_msgSend(v2, "traits") & 0x800000) != 0;

  return v3;
}

uint64_t __87__AXElementFetcher__sendFakeScreenChangeIfNecessaryForGroups_orElements_appsDidChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchEventOccurred:8];
}

- (BOOL)_fetchElements:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [(AXElementFetcher *)self _fetchUnprocessedElements:v5];
  uint64_t v7 = +[AXElementGroup groupWithElements:v5];
  [(AXElementFetcher *)self _sendFakeScreenChangeIfNecessaryForGroups:0 orElements:v6 appsDidChange:v3];
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__2;
  v34 = __Block_byref_object_dispose__2;
  id v35 = 0;
  filterAccessQueue = self->_filterAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__AXElementFetcher__fetchElements___block_invoke;
  block[3] = &unk_1E6220AC0;
  block[4] = self;
  void block[5] = &v30;
  dispatch_sync(filterAccessQueue, block);
  id v9 = v6;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = (id)v31[5];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v40 count:16];
  long long v12 = v9;
  if (v11)
  {
    uint64_t v13 = *(void *)v26;
    long long v12 = v9;
    do
    {
      uint64_t v14 = 0;
      long long v15 = v12;
      do
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v12 = [(AXElementFetcher *)self _filterElements:v15 withFilter:*(void *)(*((void *)&v25 + 1) + 8 * v14)];

        ++v14;
        long long v15 = v12;
      }
      while (v11 != v14);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v40 count:16];
    }
    while (v11);
  }

  elementAccessQueue = self->_elementAccessQueue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __35__AXElementFetcher__fetchElements___block_invoke_2;
  v21[3] = &unk_1E6220DD0;
  v21[4] = self;
  id v22 = v12;
  id v23 = v7;
  long long v24 = &v36;
  id v17 = v7;
  id v18 = v12;
  dispatch_sync(elementAccessQueue, v21);
  BOOL v19 = *((unsigned char *)v37 + 24) != 0;

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v19;
}

void __35__AXElementFetcher__fetchElements___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) postFetchFilters];
  uint64_t v2 = [v5 allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __35__AXElementFetcher__fetchElements___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) elementCache];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v2 isEqualToArray:*(void *)(a1 + 40)] ^ 1;

  [*(id *)(a1 + 32) setElementCache:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setElementCommunityGroupCache:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setRootGroupCache:0];
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setKeyboardGroupCache:0];
}

- (id)_fetchUnprocessedElements:(id)a3
{
  v55[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v55[0] = MEMORY[0x1E4F1CC28];
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[AXElementFetcher shouldIncludeNonScannerElements](self, "shouldIncludeNonScannerElements"));
  v55[1] = v5;
  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];

  [MEMORY[0x1E4F1CA48] array];
  v43 = self;
  id v44 = (id)objc_claimAutoreleasedReturnValue();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v6 = [(AXElementFetcher *)self currentApps];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v47 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        long long v12 = [v11 uiElement];
        uint64_t v13 = [v12 uiElementsWithAttribute:94500 parameter:v45];
        uint64_t v14 = +[AXElement elementsWithUIElements:v13];

        if ([v14 count])
        {
          [v44 addObjectsFromArray:v14];
          long long v15 = [v14 firstObject];
          v53 = v15;
          uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
          id v17 = +[AXElementGroup groupWithElements:v16];

          [v17 setElementCommunity:v11];
          [v4 addObject:v17];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v8);
  }

  id v18 = [(AXElementFetcher *)v43 inCallServiceApplication];
  if (v18 && ![v44 count])
  {
    BOOL v19 = [v18 uiElement];
    long long v20 = [v19 uiElementsWithAttribute:94500 parameter:v45];
    long long v21 = +[AXElement elementsWithUIElements:v20];

    if ([v21 count])
    {
      [v44 addObjectsFromArray:v21];
      id v22 = [v21 firstObject];
      v52 = v22;
      id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
      long long v24 = +[AXElementGroup groupWithElements:v23];

      [v24 setElementCommunity:v18];
      [v4 addObject:v24];
    }
  }
  long long v25 = +[AXElement systemWideElement];
  long long v26 = [v25 accessibilityUIServerApplication];

  long long v27 = [v26 uiElement];
  long long v28 = [v27 uiElementsWithAttribute:94500 parameter:v45];
  objc_super v29 = +[AXElement elementsWithUIElements:v28];

  if ([v29 count])
  {
    [v44 addObjectsFromArray:v29];
    uint64_t v30 = [v29 firstObject];
    v51 = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
    uint64_t v32 = +[AXElementGroup groupWithElements:v31];

    [v32 setElementCommunity:v26];
    [v4 addObject:v32];
  }
  v33 = +[AXElement systemWideElement];
  v34 = [v33 systemApplication];
  id v35 = [v34 elementForAttribute:1513];

  uint64_t v36 = [v35 uiElement];
  v37 = [v36 uiElementsWithAttribute:94500 parameter:v45];
  uint64_t v38 = +[AXElement elementsWithUIElements:v37];

  if ([v38 count])
  {
    [v44 addObjectsFromArray:v38];
    char v39 = [v38 firstObject];
    v50 = v39;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
    uint64_t v41 = +[AXElementGroup groupWithElements:v40];

    [v41 setElementCommunity:v35];
    [v4 addObject:v41];
  }
  return v44;
}

- (void)addPostFetchFilter:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    filterAccessQueue = self->_filterAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__AXElementFetcher_addPostFetchFilter_withIdentifier___block_invoke;
    block[3] = &unk_1E6220DF8;
    block[4] = self;
    id v12 = v6;
    id v11 = v8;
    dispatch_async(filterAccessQueue, block);
  }
}

void __54__AXElementFetcher_addPostFetchFilter_withIdentifier___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) postFetchFilters];
  uint64_t v2 = _Block_copy(*(const void **)(a1 + 48));
  [v3 setObject:v2 forKey:*(void *)(a1 + 40)];
}

- (void)removePostFetchFilterWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    filterAccessQueue = self->_filterAccessQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__AXElementFetcher_removePostFetchFilterWithIdentifier___block_invoke;
    v7[3] = &unk_1E6220560;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(filterAccessQueue, v7);
  }
}

void __56__AXElementFetcher_removePostFetchFilterWithIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) postFetchFilters];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)removeAllPostFetchFilters
{
  filterAccessQueue = self->_filterAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__AXElementFetcher_removeAllPostFetchFilters__block_invoke;
  block[3] = &unk_1E6220A08;
  block[4] = self;
  dispatch_async(filterAccessQueue, block);
}

void __45__AXElementFetcher_removeAllPostFetchFilters__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) postFetchFilters];
  [v1 removeAllObjects];
}

- (id)_filterElements:(id)a3 withFilter:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (unsigned int (**)(void, void))v6;
  id v8 = 0;
  if (v5 && v6)
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          if (v7[2](v7, v14)) {
            objc_msgSend(v8, "addObject:", v14, (void)v16);
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
  return v8;
}

- (id)findElementMatchingElement:(id)a3
{
  id v4 = a3;
  if (v4 && ![(AXElementFetcher *)self _shouldConsiderCacheAsInvalid])
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy__2;
    long long v15 = __Block_byref_object_dispose__2;
    id v16 = 0;
    elementAccessQueue = self->_elementAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__AXElementFetcher_findElementMatchingElement___block_invoke;
    block[3] = &unk_1E6220E20;
    block[4] = self;
    id v9 = v4;
    uint64_t v10 = &v11;
    dispatch_sync(elementAccessQueue, block);
    id v5 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __47__AXElementFetcher_findElementMatchingElement___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "elementCache", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v7 isEqual:*(void *)(a1 + 40)])
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)findElementMatchingBlock:(id)a3
{
  id v4 = a3;
  if (v4 && ![(AXElementFetcher *)self _shouldConsiderCacheAsInvalid])
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy__2;
    long long v15 = __Block_byref_object_dispose__2;
    id v16 = 0;
    elementAccessQueue = self->_elementAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__AXElementFetcher_findElementMatchingBlock___block_invoke;
    block[3] = &unk_1E6220E48;
    block[4] = self;
    id v9 = v4;
    long long v10 = &v11;
    dispatch_sync(elementAccessQueue, block);
    id v5 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __45__AXElementFetcher_findElementMatchingBlock___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "elementCache", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)findElementsMatchingBlock:(id)a3
{
  return [(AXElementFetcher *)self _findElementsMatchingBlock:a3 internalRequest:0];
}

- (id)_findElementsMatchingBlock:(id)a3 internalRequest:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6 && (![(AXElementFetcher *)self _shouldConsiderCacheAsInvalid] || v4))
  {
    uint64_t v14 = 0;
    long long v15 = &v14;
    uint64_t v16 = 0x3032000000;
    long long v17 = __Block_byref_object_copy__2;
    long long v18 = __Block_byref_object_dispose__2;
    id v19 = [MEMORY[0x1E4F1CA48] array];
    elementAccessQueue = self->_elementAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__AXElementFetcher__findElementsMatchingBlock_internalRequest___block_invoke;
    block[3] = &unk_1E6220E48;
    block[4] = self;
    id v12 = v6;
    uint64_t v13 = &v14;
    dispatch_sync(elementAccessQueue, block);
    if (![(id)v15[5] count])
    {
      long long v9 = (void *)v15[5];
      v15[5] = 0;
    }
    id v7 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __63__AXElementFetcher__findElementsMatchingBlock_internalRequest___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "elementCache", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v8 + 1) + 8 * v6);
        if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v7];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)closestElementToElement:(id)a3
{
  id v4 = a3;
  if (v4 && ![(AXElementFetcher *)self _shouldConsiderCacheAsInvalid])
  {
    uint64_t v5 = [(AXElementFetcher *)self findElementMatchingElement:v4];
    if (!v5)
    {
      [v4 visibleFrame];
      CGFloat x = v13.origin.x;
      CGFloat y = v13.origin.y;
      CGFloat width = v13.size.width;
      CGFloat height = v13.size.height;
      double MidX = CGRectGetMidX(v13);
      v14.origin.CGFloat x = x;
      v14.origin.CGFloat y = y;
      v14.size.CGFloat width = width;
      v14.size.CGFloat height = height;
      uint64_t v5 = -[AXElementFetcher closestElementToPoint:](self, "closestElementToPoint:", MidX, CGRectGetMidY(v14));
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)closestElementToPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if ([(AXElementFetcher *)self _shouldConsiderCacheAsInvalid])
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    long long v11 = &v10;
    uint64_t v12 = 0x3032000000;
    CGRect v13 = __Block_byref_object_copy__2;
    CGRect v14 = __Block_byref_object_dispose__2;
    id v15 = 0;
    elementAccessQueue = self->_elementAccessQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__AXElementFetcher_closestElementToPoint___block_invoke;
    v9[3] = &unk_1E62208B0;
    *(CGFloat *)&v9[6] = x;
    *(CGFloat *)&v9[7] = y;
    v9[4] = self;
    v9[5] = &v10;
    dispatch_sync(elementAccessQueue, v9);
    id v6 = (id)v11[5];
    _Block_object_dispose(&v10, 8);
  }
  return v6;
}

void __42__AXElementFetcher_closestElementToPoint___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "elementCache", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    double v6 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "distanceToPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
        if (v9 < v6)
        {
          double v10 = v9;
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8);
          double v6 = v10;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (id)firstElement
{
  if ([(AXElementFetcher *)self _shouldConsiderCacheAsInvalid])
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    long long v8 = &v7;
    uint64_t v9 = 0x3032000000;
    double v10 = __Block_byref_object_copy__2;
    long long v11 = __Block_byref_object_dispose__2;
    id v12 = 0;
    elementAccessQueue = self->_elementAccessQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __32__AXElementFetcher_firstElement__block_invoke;
    v6[3] = &unk_1E6220488;
    v6[4] = self;
    void v6[5] = &v7;
    dispatch_sync(elementAccessQueue, v6);
    id v3 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  return v3;
}

void __32__AXElementFetcher_firstElement__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) elementCache];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    id v7 = [*(id *)(a1 + 32) elementCache];
    uint64_t v4 = [v7 firstObject];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    double v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (id)lastElement
{
  if ([(AXElementFetcher *)self _shouldConsiderCacheAsInvalid])
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    long long v8 = &v7;
    uint64_t v9 = 0x3032000000;
    double v10 = __Block_byref_object_copy__2;
    long long v11 = __Block_byref_object_dispose__2;
    id v12 = 0;
    elementAccessQueue = self->_elementAccessQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __31__AXElementFetcher_lastElement__block_invoke;
    v6[3] = &unk_1E6220488;
    v6[4] = self;
    void v6[5] = &v7;
    dispatch_sync(elementAccessQueue, v6);
    id v3 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  return v3;
}

void __31__AXElementFetcher_lastElement__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) elementCache];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    id v7 = [*(id *)(a1 + 32) elementCache];
    uint64_t v4 = [v7 lastObject];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    double v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (id)nextSiblingOfElement:(id)a3 didWrap:(BOOL *)a4
{
  id v6 = a3;
  if (v6 && ![(AXElementFetcher *)self _shouldConsiderCacheAsInvalid])
  {
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x3032000000;
    long long v17 = __Block_byref_object_copy__2;
    long long v18 = __Block_byref_object_dispose__2;
    id v19 = 0;
    elementAccessQueue = self->_elementAccessQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__AXElementFetcher_nextSiblingOfElement_didWrap___block_invoke;
    v10[3] = &unk_1E6220E70;
    v10[4] = self;
    id v12 = &v14;
    long long v13 = a4;
    id v11 = v6;
    dispatch_sync(elementAccessQueue, v10);
    id v7 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __49__AXElementFetcher_nextSiblingOfElement_didWrap___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) elementCache];
  uint64_t v3 = [v2 indexOfObject:*(void *)(a1 + 40)];

  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = [*(id *)(a1 + 32) elementCache];
    uint64_t v5 = [v4 count];

    if (v5 == 1)
    {
      id v6 = *(unsigned char **)(a1 + 56);
      if (v6) {
        unsigned char *v6 = 1;
      }
      id v7 = *(void **)(a1 + 40);
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
      *(void *)(v8 + 40) = v7;
    }
    else
    {
      uint64_t v9 = v3 + 1;
      double v10 = *(unsigned char **)(a1 + 56);
      if (v9 == v5)
      {
        if (v10) {
          unsigned char *v10 = 1;
        }
        [*(id *)(a1 + 32) elementCache];
        uint64_t v11 = [(id)objc_claimAutoreleasedReturnValue() firstObject];
      }
      else
      {
        if (v10) {
          unsigned char *v10 = 0;
        }
        [*(id *)(a1 + 32) elementCache];
        uint64_t v11 = [(id)objc_claimAutoreleasedReturnValue() objectAtIndex:v9];
      }
      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
      long long v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
    MEMORY[0x1F41817F8]();
  }
}

- (id)previousSiblingOfElement:(id)a3 didWrap:(BOOL *)a4
{
  id v6 = a3;
  if (v6 && ![(AXElementFetcher *)self _shouldConsiderCacheAsInvalid])
  {
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x3032000000;
    long long v17 = __Block_byref_object_copy__2;
    long long v18 = __Block_byref_object_dispose__2;
    id v19 = 0;
    elementAccessQueue = self->_elementAccessQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__AXElementFetcher_previousSiblingOfElement_didWrap___block_invoke;
    v10[3] = &unk_1E6220E70;
    v10[4] = self;
    uint64_t v12 = &v14;
    long long v13 = a4;
    id v11 = v6;
    dispatch_sync(elementAccessQueue, v10);
    id v7 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __53__AXElementFetcher_previousSiblingOfElement_didWrap___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) elementCache];
  uint64_t v3 = [v2 indexOfObject:*(void *)(a1 + 40)];

  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = [*(id *)(a1 + 32) elementCache];
    uint64_t v5 = [v4 count];

    if (v5 == 1)
    {
      id v6 = *(unsigned char **)(a1 + 56);
      if (v6) {
        unsigned char *v6 = 1;
      }
      id v7 = *(void **)(a1 + 40);
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
      *(void *)(v8 + 40) = v7;
    }
    else
    {
      uint64_t v9 = *(unsigned char **)(a1 + 56);
      if (v3)
      {
        if (v9) {
          *uint64_t v9 = 0;
        }
        [*(id *)(a1 + 32) elementCache];
        uint64_t v10 = [(id)objc_claimAutoreleasedReturnValue() objectAtIndex:v3 - 1];
      }
      else
      {
        if (v9) {
          *uint64_t v9 = 1;
        }
        [*(id *)(a1 + 32) elementCache];
        uint64_t v10 = [(id)objc_claimAutoreleasedReturnValue() lastObject];
      }
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    MEMORY[0x1F41817F8]();
  }
}

- (id)_siblingOfGroupable:(id)a3 forDirection:(BOOL)a4 didWrap:(BOOL *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = [v8 parentGroup];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
    }
    else
    {
      long long v13 = [(AXElementFetcher *)self findGroupableMatchingGroupable:v9];

      uint64_t v11 = [v13 parentGroup];
      uint64_t v9 = v13;
    }
    if (v6) {
      [v11 nextSiblingOfChild:v9 didWrap:a5];
    }
    else {
    uint64_t v12 = [v11 previousSiblingOfChild:v9 didWrap:a5];
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  return v12;
}

- (id)nextSiblingOfGroupable:(id)a3 didWrap:(BOOL *)a4
{
  return [(AXElementFetcher *)self _siblingOfGroupable:a3 forDirection:1 didWrap:a4];
}

- (id)previousSiblingOfGroupable:(id)a3 didWrap:(BOOL *)a4
{
  return [(AXElementFetcher *)self _siblingOfGroupable:a3 forDirection:0 didWrap:a4];
}

- (id)_findGroupableMatchingGroupable:(id)a3 inElementGroup:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "isEqual:", v6, (void)v16))
        {
          id v13 = v12;
LABEL_13:
          uint64_t v14 = v13;
          goto LABEL_14;
        }
        if ([v12 isGroup])
        {
          id v13 = [(AXElementFetcher *)self _findGroupableMatchingGroupable:v6 inElementGroup:v12];
          if (v13) {
            goto LABEL_13;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 0;
LABEL_14:

  return v14;
}

- (id)findGroupableMatchingGroupable:(id)a3
{
  id v4 = a3;
  if (v4 && ![(AXElementFetcher *)self _shouldConsiderCacheAsInvalid])
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy__2;
    id v15 = __Block_byref_object_dispose__2;
    id v16 = 0;
    elementAccessQueue = self->_elementAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__AXElementFetcher_findGroupableMatchingGroupable___block_invoke;
    block[3] = &unk_1E6220E98;
    uint64_t v10 = &v11;
    block[4] = self;
    id v9 = v4;
    dispatch_sync(elementAccessQueue, block);
    id v5 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __51__AXElementFetcher_findGroupableMatchingGroupable___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v7 = [v2 rootGroupCache];
  uint64_t v4 = [v2 _findGroupableMatchingGroupable:v3 inElementGroup:v7];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)_findGroupableMatchingBlock:(id)a3 inElementGroup:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = (unsigned int (**)(id, void *))a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (v6[2](v6, v12))
        {
          id v13 = v12;
LABEL_13:
          uint64_t v14 = v13;
          goto LABEL_14;
        }
        if (objc_msgSend(v12, "isGroup", (void)v16))
        {
          id v13 = [(AXElementFetcher *)self _findGroupableMatchingBlock:v6 inElementGroup:v12];
          if (v13) {
            goto LABEL_13;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 0;
LABEL_14:

  return v14;
}

- (id)findGroupableMatchingBlock:(id)a3
{
  id v4 = a3;
  if (v4 && ![(AXElementFetcher *)self _shouldConsiderCacheAsInvalid])
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy__2;
    id v15 = __Block_byref_object_dispose__2;
    id v16 = 0;
    elementAccessQueue = self->_elementAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__AXElementFetcher_findGroupableMatchingBlock___block_invoke;
    block[3] = &unk_1E6220EC0;
    uint64_t v10 = &v11;
    block[4] = self;
    id v9 = v4;
    dispatch_sync(elementAccessQueue, block);
    id v5 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __47__AXElementFetcher_findGroupableMatchingBlock___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v7 = [v2 rootGroupCache];
  uint64_t v4 = [v2 _findGroupableMatchingBlock:v3 inElementGroup:v7];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)_groupWithDictionary:(id)a3 currentPid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"GroupElements"];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"GroupTraits"];
  uint64_t v9 = (int)[v8 intValue];
  uint64_t v10 = [v6 objectForKeyedSubscript:@"GroupScanBehaviorTraits"];
  uint64_t v11 = (int)[v10 intValue];
  uint64_t v12 = [v6 objectForKeyedSubscript:@"GroupLabel"];
  uint64_t v13 = [v6 objectForKeyedSubscript:@"GroupIdentifier"];

  uint64_t v14 = [(AXElementFetcher *)self _groupWithItems:v7 groupTraits:v9 scanningBehaviorTraits:v11 label:v12 identifier:v13 currentPid:v4];

  return v14;
}

- (id)_groupWithItems:(id)a3 groupTraits:(unint64_t)a4 scanningBehaviorTraits:(unint64_t)a5 label:(id)a6 identifier:(id)a7 currentPid:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v36 = a6;
  id v35 = a7;
  uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v14 = v12;
  uint64_t v38 = v14;
  uint64_t v39 = [v14 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (!v39) {
    goto LABEL_20;
  }
  uint64_t v15 = *(void *)v41;
  unsigned int v37 = v8;
  do
  {
    for (uint64_t i = 0; i != v39; ++i)
    {
      if (*(void *)v41 != v15) {
        objc_enumerationMutation(v14);
      }
      long long v17 = *(const void **)(*((void *)&v40 + 1) + 8 * i);
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = [(AXElementFetcher *)self _groupWithDictionary:v17 currentPid:v8];
        if (v19) {
          goto LABEL_17;
        }
      }
      else
      {
        CFTypeID v20 = CFGetTypeID(v17);
        if ((v20 == AXUIElementGetTypeID()) | isKindOfClass & 1)
        {
          if (isKindOfClass) {
            +[AXElement elementWithUIElement:v17];
          }
          else {
          uint64_t v21 = +[AXElement elementWithAXUIElement:v17];
          }
          id v22 = [v21 uiElement];
          uint64_t v23 = [v22 pid];

          if (v23 == v8)
          {
            id v19 = v21;
          }
          else
          {
            long long v24 = [v21 uiElement];
            v44[0] = MEMORY[0x1E4F1CC38];
            long long v25 = objc_msgSend(NSNumber, "numberWithBool:", -[AXElementFetcher shouldIncludeNonScannerElements](self, "shouldIncludeNonScannerElements"));
            v44[1] = v25;
            objc_msgSend(v24, "objectWithAXAttribute:parameter:", 94500, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v44, 2));
            v27 = long long v26 = v13;

            id v14 = v38;
            id v19 = [(AXElementFetcher *)self _groupWithItems:v27 groupTraits:0 scanningBehaviorTraits:0 label:0 identifier:0 currentPid:v23];

            uint64_t v13 = v26;
            uint64_t v8 = v37;
          }

          if (v19)
          {
LABEL_17:
            [v13 addObject:v19];

            continue;
          }
        }
      }
    }
    uint64_t v39 = [v14 countByEnumeratingWithState:&v40 objects:v45 count:16];
  }
  while (v39);
LABEL_20:

  if ([v13 count])
  {
    long long v28 = v36;
    objc_super v29 = +[AXElementGroup groupWithElements:v13 label:v36];
    [v29 setGroupTraits:a4];
    [v29 setUserDefinedScanningBehaviorTraits:a5];
    uint64_t v30 = v13;
    v31 = v35;
    [v29 setIdentifier:v35];
  }
  else
  {
    objc_super v29 = 0;
    uint64_t v30 = v13;
    v31 = v35;
    long long v28 = v36;
  }

  return v29;
}

- (id)_filterGroup:(id)a3 withFilter:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (unsigned int (**)(id, void *))a4;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v14, "isGroup", (void)v20))
        {
          uint64_t v15 = [(AXElementFetcher *)self _filterGroup:v14 withFilter:v7];
          if (v15) {
            [v8 addObject:v15];
          }
        }
        else if (v7[2](v7, v14))
        {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  if ([v8 count])
  {
    id v16 = [v9 label];
    long long v17 = +[AXElementGroup groupWithElements:v8 label:v16];

    objc_msgSend(v17, "setGroupTraits:", objc_msgSend(v9, "groupTraits"));
    objc_msgSend(v17, "setUserDefinedScanningBehaviorTraits:", objc_msgSend(v9, "userDefinedScanningBehaviorTraits"));
    long long v18 = [v9 identifier];
    [v17 setIdentifier:v18];
  }
  else
  {
    long long v17 = 0;
  }

  return v17;
}

- (AXElementGroupPruner)elementGroupPruner
{
  elementGroupPruner = self->_elementGroupPruner;
  if (!elementGroupPruner)
  {
    uint64_t v4 = objc_alloc_init(AXElementGroupPruner);
    uint64_t v5 = self->_elementGroupPruner;
    self->_elementGroupPruner = v4;

    elementGroupPruner = self->_elementGroupPruner;
  }
  return elementGroupPruner;
}

- (id)_processAppGroup:(id)a3 keyboardGroup:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__2;
  v33 = __Block_byref_object_dispose__2;
  id v34 = 0;
  filterAccessQueue = self->_filterAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__AXElementFetcher__processAppGroup_keyboardGroup___block_invoke;
  block[3] = &unk_1E6220AC0;
  block[4] = self;
  void block[5] = &v29;
  dispatch_sync(filterAccessQueue, block);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = (id)v30[5];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v35 count:16];
  uint64_t v10 = v6;
  if (v9)
  {
    uint64_t v11 = *(void *)v25;
    uint64_t v10 = v6;
    do
    {
      uint64_t v12 = 0;
      uint64_t v13 = v10;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v10 = -[AXElementFetcher _filterGroup:withFilter:](self, "_filterGroup:withFilter:", v13, *(void *)(*((void *)&v24 + 1) + 8 * v12), (void)v24);

        ++v12;
        uint64_t v13 = v10;
      }
      while (v9 != v12);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v35 count:16];
    }
    while (v9);
  }

  id v14 = [(AXElementFetcher *)self visualElementGrouper];
  BOOL v15 = v14 == 0;

  if (v15)
  {
    id v16 = [[AXVisualElementGrouper alloc] initWithHeuristics:[(AXElementFetcher *)self elementGroupingHeuristics]];
    [(AXElementFetcher *)self setVisualElementGrouper:v16];
  }
  long long v17 = [(AXElementFetcher *)self visualElementGrouper];
  long long v18 = [v17 groupElementsInRootGroup:v10];

  id v19 = [(AXElementFetcher *)self elementGroupPruner];
  long long v20 = [v19 pruneRootGroup:v18];

  if (a4)
  {
    *a4 = [v20 firstChildPassingTest:&__block_literal_global_361];
  }
  long long v21 = [v6 elementCommunity];
  [v20 setElementCommunity:v21];

  id v22 = v20;
  _Block_object_dispose(&v29, 8);

  return v22;
}

void __51__AXElementFetcher__processAppGroup_keyboardGroup___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) postFetchFilters];
  uint64_t v2 = [v5 allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __51__AXElementFetcher__processAppGroup_keyboardGroup___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isGroup]) {
    uint64_t v3 = [v2 isKeyboardContainer];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_fetchUnprocessedAppGroups
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  long long v47 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = [(AXElementFetcher *)self currentApps];
  uint64_t v4 = (void *)[v3 mutableCopy];

  id v5 = +[AXElement systemWideElement];
  id v6 = [v5 accessibilityUIServerApplication];

  if (v6)
  {
    id v7 = [v6 uiElement];
    [v7 updateCache:14000];

    id v8 = [v6 elementsForAttribute:14000];
    [v4 addObjectsFromArray:v8];

    uint64_t v9 = [v6 uiElement];
    [v9 updateCache:2076];

    uint64_t v10 = [v6 elementsForAttribute:2076];
    [v4 addObjectsFromArray:v10];
  }
  uint64_t v11 = +[AXElement systemWideElement];
  uint64_t v12 = [v11 systemApplication];

  uint64_t v48 = [v12 elementForAttribute:1513];
  if (v48 && ([v12 isControlCenterVisible] & 1) == 0) {
    [v4 addObject:v48];
  }
  uint64_t v13 = [(AXElementFetcher *)self inCallServiceApplication];
  if (v13)
  {
    id v14 = [v4 firstObject];
    int v15 = [v14 isSpringBoard];

    if (v15) {
      [v4 addObject:v13];
    }
  }
  id v44 = v12;
  unint64_t v45 = (unint64_t)v6;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v4;
  uint64_t v16 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
  long long v43 = (void *)v13;
  if (!v16)
  {
    v50 = 0;
    uint64_t v46 = 0;
    goto LABEL_28;
  }
  uint64_t v17 = v16;
  v50 = 0;
  uint64_t v46 = 0;
  uint64_t v18 = *(void *)v52;
  do
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v52 != v18) {
        objc_enumerationMutation(obj);
      }
      long long v20 = *(void **)(*((void *)&v51 + 1) + 8 * i);
      long long v21 = objc_msgSend(v20, "uiElement", v43, v44);
      v55[0] = MEMORY[0x1E4F1CC38];
      id v22 = objc_msgSend(NSNumber, "numberWithBool:", -[AXElementFetcher shouldIncludeNonScannerElements](self, "shouldIncludeNonScannerElements"));
      v55[1] = v22;
      long long v23 = objc_msgSend(v21, "objectWithAXAttribute:parameter:", 94500, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v55, 2));

      if ([v23 count])
      {
        long long v24 = [v20 uiElement];
        long long v25 = -[AXElementFetcher _groupWithItems:groupTraits:scanningBehaviorTraits:label:identifier:currentPid:](self, "_groupWithItems:groupTraits:scanningBehaviorTraits:label:identifier:currentPid:", v23, 0, 0, 0, 0, [v24 pid]);

        if (v25)
        {
          [v25 setElementCommunity:v20];
          long long v26 = [v20 label];
          [v25 setLabel:v26];

          if (v20 == (void *)v48) {
            [v25 setGroupTraits:256];
          }
          if ([v20 isSpringBoard])
          {
            long long v27 = v46;
            long long v28 = v50;
            uint64_t v46 = v25;
            goto LABEL_21;
          }
          int v29 = [v20 applicationIsModal];
          long long v27 = v50;
          long long v28 = v25;
          if (v29)
          {
LABEL_21:
            id v30 = v25;

            v50 = v28;
          }
          [v47 addObject:v25];
        }
      }
    }
    uint64_t v17 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
  }
  while (v17);
LABEL_28:

  uint64_t v31 = v43;
  if (v45 | v48)
  {
    uint64_t v32 = [(AXElementFetcher *)self currentApps];
    uint64_t v33 = [v32 count];

    if (v33 != 1)
    {
      id v35 = +[AXElement systemWideElement];
      uint64_t v36 = [v35 springBoardApplication];
      int v37 = [v36 applicationIsModal];

      if (v37)
      {
        [v47 removeAllObjects];
        if (!v46) {
          goto LABEL_38;
        }
        uint64_t v38 = v47;
        uint64_t v39 = v46;
      }
      else
      {
        if (!v50) {
          goto LABEL_38;
        }
        [v47 removeAllObjects];
        uint64_t v38 = v47;
        uint64_t v39 = v50;
      }
      objc_msgSend(v38, "addObject:", v39, v43);
      goto LABEL_38;
    }
    if ([v47 count])
    {
      id v34 = +[AXElementGroup groupWithElements:v47];
      [v47 removeAllObjects];
      [v47 addObject:v34];
    }
  }
LABEL_38:
  if (_AXSClarityBoardEnabled() && (unint64_t)[v47 count] >= 2)
  {
    long long v40 = +[AXElementGroup groupWithElements:v47];
    [v47 removeAllObjects];
    [v47 addObject:v40];
  }
  id v41 = v47;

  return v41;
}

- (BOOL)_fetchGroups:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = [(AXElementFetcher *)self _fetchUnprocessedAppGroups];
  [(AXElementFetcher *)self _sendFakeScreenChangeIfNecessaryForGroups:v5 orElements:0 appsDidChange:v3];
  uint64_t v44 = 0;
  unint64_t v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  uint64_t v33 = [MEMORY[0x1E4F1CA48] array];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v6 = v5;
  id v7 = 0;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        id v39 = 0;
        uint64_t v12 = [(AXElementFetcher *)self _processAppGroup:v11 keyboardGroup:&v39];
        id v13 = v39;
        id v14 = v13;
        if (v13)
        {
          id v15 = v13;

          id v7 = v15;
        }
        if ((unint64_t)[v6 count] >= 2
          && [v12 count] == 1
          && ([v12 elementCommunity],
              uint64_t v16 = objc_claimAutoreleasedReturnValue(),
              int v17 = [v16 isSystemApplication],
              v16,
              v17))
        {
          uint64_t v18 = [v12 firstObject];
          [v33 addObject:v18];
        }
        else if (v12)
        {
          [v33 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v8);
  }

  if ((unint64_t)[v33 count] < 2)
  {
    if ([v33 count] == 1)
    {
      long long v26 = [v33 firstObject];
      id v25 = 0;
    }
    else
    {
      id v25 = 0;
      long long v26 = 0;
    }
  }
  else
  {
    if (v7)
    {
      id v19 = [v7 parentGroup];
      uint64_t v20 = [v33 indexOfObject:v19];
      if (v20 != 0x7FFFFFFFFFFFFFFFLL)
      {
        long long v21 = [v19 groupByRemovingGroupable:v7];
        id v22 = [(AXElementFetcher *)self elementGroupPruner];
        long long v23 = [v22 pruneRootGroup:v21];

        [v33 replaceObjectAtIndex:v20 withObject:v23];
        long long v24 = [v23 elementCommunity];
        [v7 setElementCommunity:v24];

        [v33 addObject:v7];
      }
    }
    id v25 = +[AXElementGroup groupWithElements:v33];
    long long v26 = v25;
  }
  elementAccessQueue = self->_elementAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__AXElementFetcher__fetchGroups___block_invoke;
  block[3] = &unk_1E6220EE8;
  id v37 = v25;
  uint64_t v38 = &v44;
  block[4] = self;
  id v35 = v26;
  id v36 = v7;
  id v28 = v25;
  id v29 = v7;
  id v30 = v26;
  dispatch_sync(elementAccessQueue, block);
  BOOL v31 = *((unsigned char *)v45 + 24) != 0;

  _Block_object_dispose(&v44, 8);
  return v31;
}

uint64_t __33__AXElementFetcher__fetchGroups___block_invoke(uint64_t a1)
{
  BOOL v3 = [*(id *)(a1 + 32) rootGroupCache];
  uint64_t v4 = *(void **)(a1 + 40);
  if (v3 == v4
    || ([*(id *)(a1 + 32) rootGroupCache],
        id v1 = objc_claimAutoreleasedReturnValue(),
        [v1 isEqualToArray:*(void *)(a1 + 40)]))
  {
    id v5 = [*(id *)(a1 + 32) keyboardGroupCache];
    if (v5 == *(void **)(a1 + 48))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }
    else
    {
      id v6 = [*(id *)(a1 + 32) keyboardGroupCache];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v6 isEqualToArray:*(void *)(a1 + 48)] ^ 1;
    }
    if (v3 == v4) {
      goto LABEL_9;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }

LABEL_9:
  [*(id *)(a1 + 40) setRootGroup:1];
  [*(id *)(a1 + 32) setRootGroupCache:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setElementCommunityGroupCache:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setKeyboardGroupCache:*(void *)(a1 + 48)];
  id v7 = *(void **)(a1 + 32);
  return [v7 setElementCache:0];
}

- (void)clearCache
{
  [(AXElementFetcher *)self setElementCache:0];
  [(AXElementFetcher *)self setRootGroupCache:0];
  [(AXElementFetcher *)self setKeyboardGroupCache:0];
  [(AXElementFetcher *)self setElementCommunityGroupCache:0];
}

- (id)_debugStringForFetchEvents:(unint64_t)a3
{
  if (AXFetchEventAllEvents == a3)
  {
    BOOL v3 = @"AllEvents";
    goto LABEL_12;
  }
  __int16 v4 = a3;
  id v5 = [MEMORY[0x1E4F28E78] string];
  BOOL v3 = v5;
  if (v4)
  {
    [(__CFString *)v5 appendFormat:@"UserRequested"];
    if ((v4 & 8) == 0)
    {
LABEL_5:
      if ((v4 & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
  }
  else if ((v4 & 8) == 0)
  {
    goto LABEL_5;
  }
  [(__CFString *)v3 appendFormat:@" | ScreenChange"];
  if ((v4 & 4) == 0)
  {
LABEL_6:
    if ((v4 & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  [(__CFString *)v3 appendFormat:@" | LayoutChange"];
  if ((v4 & 0x100) == 0)
  {
LABEL_7:
    if ((v4 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  [(__CFString *)v3 appendFormat:@" | LayoutChange - Immediate"];
  if ((v4 & 0x10) == 0)
  {
LABEL_8:
    if ((v4 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  [(__CFString *)v3 appendFormat:@" | OrientationChange"];
  if ((v4 & 0x40) == 0)
  {
LABEL_9:
    if ((v4 & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  [(__CFString *)v3 appendFormat:@" | AlertAppeared"];
  if ((v4 & 2) == 0)
  {
LABEL_10:
    if ((v4 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_21:
  [(__CFString *)v3 appendFormat:@" | AppTransition"];
  if ((v4 & 0x80) != 0) {
LABEL_11:
  }
    [(__CFString *)v3 appendFormat:@" | ScrolledByPage"];
LABEL_12:
  return v3;
}

- (void)_debugLogElementCache
{
  elementAccessQueue = self->_elementAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__AXElementFetcher__debugLogElementCache__block_invoke;
  block[3] = &unk_1E6220A08;
  block[4] = self;
  dispatch_async(elementAccessQueue, block);
}

void __41__AXElementFetcher__debugLogElementCache__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28E78] stringWithString:@"Element Cache:\n"];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = [*(id *)(a1 + 32) elementCache];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [v2 appendFormat:@"\t%@\n", *(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  NSLog((NSString *)@"%@", v2);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isFetchingElements
{
  return self->_fetchingElements;
}

- (void)setFetchingElements:(BOOL)a3
{
  self->_fetchingElements = a3;
}

- (BOOL)isEventManagementEnabled
{
  return self->_eventManagementEnabled;
}

- (void)setEventManagementEnabled:(BOOL)a3
{
  self->_eventManagementEnabled = a3;
}

- (BOOL)shouldIncludeNonScannerElements
{
  return self->_shouldIncludeNonScannerElements;
}

- (void)setShouldIncludeNonScannerElements:(BOOL)a3
{
  self->_shouldIncludeNonScannerElements = a3;
}

- (BOOL)isGroupingEnabled
{
  return self->_groupingEnabled;
}

- (void)setGroupingEnabled:(BOOL)a3
{
  self->_groupingEnabled = a3;
}

- (int64_t)elementGroupingHeuristics
{
  return self->_elementGroupingHeuristics;
}

- (void)setElementGroupingHeuristics:(int64_t)a3
{
  self->_elementGroupingHeuristics = a3;
}

- (AXElementFetcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXElementFetcherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMapTable)fetchObservers
{
  return self->_fetchObservers;
}

- (void)setFetchObservers:(id)a3
{
}

- (unint64_t)activeFetchEvents
{
  return self->_activeFetchEvents;
}

- (void)setActiveFetchEvents:(unint64_t)a3
{
  self->_activeFetchEvents = a3;
}

- (void)setCurrentApps:(id)a3
{
}

- (NSArray)elementCache
{
  return self->_elementCache;
}

- (void)setElementCache:(id)a3
{
}

- (AXElementGroup)elementCommunityGroupCache
{
  return self->_elementCommunityGroupCache;
}

- (void)setElementCommunityGroupCache:(id)a3
{
}

- (AXElementGroup)rootGroupCache
{
  return self->_rootGroupCache;
}

- (void)setRootGroupCache:(id)a3
{
}

- (AXElementGroup)keyboardGroupCache
{
  return self->_keyboardGroupCache;
}

- (void)setKeyboardGroupCache:(id)a3
{
}

- (NSMutableDictionary)postFetchFilters
{
  return self->_postFetchFilters;
}

- (void)setPostFetchFilters:(id)a3
{
}

- (AXVisualElementGrouper)visualElementGrouper
{
  return self->_visualElementGrouper;
}

- (void)setVisualElementGrouper:(id)a3
{
}

- (BOOL)didSendFakeScreenChangeOnLastFetch
{
  return self->_didSendFakeScreenChangeOnLastFetch;
}

- (void)setDidSendFakeScreenChangeOnLastFetch:(BOOL)a3
{
  self->_didSendFakeScreenChangeOnLastFetch = a3;
}

- (NSArray)customCurrentApps
{
  return self->_customCurrentApps;
}

- (void)setCustomCurrentApps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customCurrentApps, 0);
  objc_storeStrong((id *)&self->_visualElementGrouper, 0);
  objc_storeStrong((id *)&self->_postFetchFilters, 0);
  objc_storeStrong((id *)&self->_keyboardGroupCache, 0);
  objc_storeStrong((id *)&self->_rootGroupCache, 0);
  objc_storeStrong((id *)&self->_elementCommunityGroupCache, 0);
  objc_storeStrong((id *)&self->_elementCache, 0);
  objc_storeStrong((id *)&self->_currentApps, 0);
  objc_storeStrong((id *)&self->_fetchObservers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_elementGroupPruner, 0);
  objc_storeStrong((id *)&self->_eventCoalesceTimer, 0);
  objc_storeStrong((id *)&self->_filterAccessQueue, 0);
  objc_storeStrong((id *)&self->_elementAccessQueue, 0);
  objc_storeStrong((id *)&self->_elementFetchQueue, 0);
}

@end