@interface AXEventTapManager
+ (id)sharedManager;
- (AXEventTapManager)init;
- (BOOL)_accessibilityShouldIgnoreHIDServiceForContinuity:(__IOHIDServiceClient *)a3;
- (BOOL)_processHIDEvent:(__IOHIDEvent *)a3 taskPort:(unsigned int)a4 bundleId:(id)a5;
- (BOOL)ignoreEventsForContinuitySession;
- (NSMutableDictionary)disabledIDMappingRegistry;
- (id)_copyCurrentEventTapPairs;
- (id)_hidFilterListForPair:(id)a3 filterEvents:(id)a4;
- (id)description;
- (id)installEventTap:(id)a3 identifier:(id)a4 type:(int)a5;
- (id)installEventTap:(id)a3 identifier:(id)a4 type:(int)a5 skipDeviceMatching:(BOOL)a6 filterEvents:(id)a7 matchingServiceHandler:(id)a8;
- (id)installKeyboardEventTap:(id)a3 identifier:(id)a4 matchingServiceHandler:(id)a5;
- (id)installationEventRepPost;
- (id)installationGSCallback;
- (id)installationHIDCallback;
- (void)_enumerateEventTapPairsUsingBlock:(id)a3;
- (void)_handleTestIOHIDEvent:(__IOHIDEvent *)a3;
- (void)_installEventTap:(id)a3 skipDeviceMatching:(BOOL)a4 filterEvents:(id)a5;
- (void)_installHIDFilter:(id)a3 skipDeviceMatching:(BOOL)a4 filterEvents:(id)a5;
- (void)_installSystemEventTap:(id)a3;
- (void)_removeHIDEventTapFilter:(id)a3;
- (void)_reorderEventTaps;
- (void)_runMatchingServiceHandler:(id)a3;
- (void)_setEventTapPriority:(id)a3 priority:(int)a4;
- (void)_setHIDEventTapCallback:(void *)a3;
- (void)dealloc;
- (void)removeEventTap:(id)a3;
- (void)runMatchingServiceHandlerForEventTap:(id)a3;
- (void)sendEvent:(id)a3 afterTap:(id)a4 useGSEvent:(BOOL)a5 namedTaps:(id)a6 options:(unint64_t)a7;
- (void)sendHIDSystemEvent:(id)a3 repostCreatorHIDEvent:(BOOL)a4 senderID:(unint64_t)a5;
- (void)sendHIDSystemEvent:(id)a3 senderID:(unint64_t)a4;
- (void)setDisabledIDMappingRegistry:(id)a3;
- (void)setEventTapPriority:(id)a3 priority:(int)a4;
- (void)setFailedToProcessInTimeCallback:(id)a3 callback:(id)a4;
- (void)setIgnoreEventsForContinuitySession:(BOOL)a3;
- (void)setInstallationEventRepPost:(id)a3;
- (void)setInstallationGSCallback:(id)a3;
- (void)setInstallationHIDCallback:(id)a3;
@end

@implementation AXEventTapManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sharedManager_SharedManager;

  return v2;
}

uint64_t __34__AXEventTapManager_sharedManager__block_invoke()
{
  sharedManager_SharedManager = objc_alloc_init(AXEventTapManager);

  return MEMORY[0x1F41817F8]();
}

- (AXEventTapManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)AXEventTapManager;
  v2 = [(AXEventTapManager *)&v15 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    eventTaps = v2->_eventTaps;
    v2->_eventTaps = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    addedEventTapPairs = v2->_addedEventTapPairs;
    v2->_addedEventTapPairs = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    removedEventTapIdentifiers = v2->_removedEventTapIdentifiers;
    v2->_removedEventTapIdentifiers = v7;

    v9 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    eventTapLock = v2->_eventTapLock;
    v2->_eventTapLock = v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    disabledIDMappingRegistry = v2->_disabledIDMappingRegistry;
    v2->_disabledIDMappingRegistry = (NSMutableDictionary *)v11;

    v13 = v2;
  }

  return v2;
}

- (void)dealloc
{
  ioSystemPostBackClient = self->_ioSystemPostBackClient;
  if (ioSystemPostBackClient)
  {
    CFRelease(ioSystemPostBackClient);
    self->_ioSystemPostBackClient = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AXEventTapManager;
  [(AXEventTapManager *)&v4 dealloc];
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"AXEventTapManager <%p>. Taps:\n", self);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v4 = self->_eventTaps;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 identifier];
        uint64_t v11 = [v9 priority];
        [v3 appendFormat:@"\t%@. Priority:%d\n", v10, v11, (void)v13];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_setHIDEventTapCallback:(void *)a3
{
  installationHIDCallback = (void (**)(id, void *))self->_installationHIDCallback;
  if (installationHIDCallback) {
    installationHIDCallback[2](installationHIDCallback, a3);
  }
}

- (id)_copyCurrentEventTapPairs
{
  [(NSRecursiveLock *)self->_eventTapLock lock];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__AXEventTapManager__copyCurrentEventTapPairs__block_invoke;
  v5[3] = &unk_1E5586360;
  v5[4] = &v6;
  [(AXEventTapManager *)self _enumerateEventTapPairsUsingBlock:v5];
  [(NSRecursiveLock *)self->_eventTapLock unlock];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __46__AXEventTapManager__copyCurrentEventTapPairs__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v8 = v3;
  if (!v4)
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v3 = v8;
    objc_super v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  [v4 addObject:v3];
}

- (void)_enumerateEventTapPairsUsingBlock:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL isEnumeratingEventTaps = self->_isEnumeratingEventTaps;
  self->_BOOL isEnumeratingEventTaps = 1;
  char v28 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v6 = self->_eventTaps;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v25 != v9) {
        objc_enumerationMutation(v6);
      }
      (*((void (**)(id, void, void, char *))v4 + 2))(v4, *(void *)(*((void *)&v24 + 1) + 8 * v10), 0, &v28);
      if (v28) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = self->_addedEventTapPairs;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        [(NSMutableArray *)self->_eventTaps insertObject:*(void *)(*((void *)&v20 + 1) + 8 * i) atIndex:0];
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v29 count:16];
    }
    while (v13);
  }

  [(NSMutableArray *)self->_addedEventTapPairs removeAllObjects];
  if ([(NSMutableSet *)self->_removedEventTapIdentifiers count])
  {
    eventTaps = self->_eventTaps;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __55__AXEventTapManager__enumerateEventTapPairsUsingBlock___block_invoke;
    v19[3] = &unk_1E5586388;
    v19[4] = self;
    v17 = [(NSMutableArray *)eventTaps indexesOfObjectsPassingTest:v19];
    [(NSMutableArray *)eventTaps removeObjectsAtIndexes:v17];

    [(NSMutableSet *)self->_removedEventTapIdentifiers removeAllObjects];
  }
  self->_BOOL isEnumeratingEventTaps = isEnumeratingEventTaps;
  if (self->_shouldReorderEventTaps) {
    [(AXEventTapManager *)self _reorderEventTaps];
  }
  if ([(NSMutableArray *)self->_eventTaps count]) {
    uint64_t v18 = _axEventTapHIDCallback;
  }
  else {
    uint64_t v18 = 0;
  }
  [(AXEventTapManager *)self _setHIDEventTapCallback:v18];
}

uint64_t __55__AXEventTapManager__enumerateEventTapPairsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (void)sendHIDSystemEvent:(id)a3 senderID:(unint64_t)a4
{
}

- (void)sendHIDSystemEvent:(id)a3 repostCreatorHIDEvent:(BOOL)a4 senderID:(unint64_t)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  id v22 = v7;
  if (!self->_ioSystemPostBackClient)
  {
    self->_ioSystemPostBackClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
    id v7 = v22;
  }
  uint64_t v8 = [v7 newHIDEventRef];
  if (v8)
  {
    uint64_t v9 = (const void *)v8;
    CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
    if (Children)
    {
      CFArrayRef v11 = Children;
      if (CFArrayGetCount(Children) >= 1)
      {
        unint64_t v12 = 0;
        while (1)
        {
          CFArrayGetValueAtIndex(v11, v12);
          unsigned int IntegerValue = IOHIDEventGetIntegerValue();
          uint64_t v14 = IOHIDEventGetIntegerValue();
          if (((v14 == 0) & (IntegerValue >> 1)) == 0 && !v14) {
            break;
          }
          if ((uint64_t)++v12 >= CFArrayGetCount(v11)) {
            goto LABEL_13;
          }
        }
        long long v15 = [v22 handInfo];
        long long v16 = [v15 paths];
        unint64_t v17 = [v16 count];

        if (v12 < v17)
        {
          uint64_t v18 = [v22 handInfo];
          v19 = [v18 paths];
          long long v20 = [v19 objectAtIndex:v12];
          [v20 setShouldSetTouchFlag:1];
        }
      }
    }
LABEL_13:
    CFRelease(v9);
  }
  if (v5)
  {
    long long v21 = (const void *)[v22 creatorHIDEvent];
    CFRetain(v21);
  }
  else
  {
    long long v21 = (const void *)[v22 newHIDEventRef];
  }
  [v22 type];
  if (v21)
  {
    IOHIDEventSetSenderID();
    IOHIDEventSystemClientDispatchEvent();
    CFRelease(v21);
  }
  else
  {
    _AXAssert();
  }
}

- (void)sendEvent:(id)a3 afterTap:(id)a4 useGSEvent:(BOOL)a5 namedTaps:(id)a6 options:(unint64_t)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v10 = a4;
  id v11 = a6;
  long long v26 = self;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = [(AXEventTapManager *)self _copyCurrentEventTapPairs];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    BOOL v15 = v10 == 0;
    uint64_t v16 = *(void *)v29;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void **)(*((void *)&v28 + 1) + 8 * v17);
        if (v10
          && ([*(id *)(*((void *)&v28 + 1) + 8 * v17) identifier],
              v19 = objc_claimAutoreleasedReturnValue(),
              char v20 = [v19 isEqualToString:v10],
              v19,
              (v20 & 1) != 0))
        {
          BOOL v15 = 1;
        }
        else if (v15 {
               || ([v18 identifier],
        }
                   long long v21 = objc_claimAutoreleasedReturnValue(),
                   int v22 = [v11 containsObject:v21],
                   v21,
                   v22))
        {
          if (![v18 type])
          {
            long long v23 = [v18 handler];
            int v24 = ((uint64_t (**)(void, id))v23)[2](v23, v27);

            if (v24)
            {

              goto LABEL_19;
            }
          }
        }
        else
        {
          BOOL v15 = 0;
        }
        ++v17;
      }
      while (v14 != v17);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v14);
  }

  installationEventRepPost = (void (**)(id, id))v26->_installationEventRepPost;
  if (installationEventRepPost) {
    installationEventRepPost[2](installationEventRepPost, v27);
  }
LABEL_19:
}

- (void)_handleTestIOHIDEvent:(__IOHIDEvent *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[AXEventRepresentation representationWithHIDEvent:a3 hidStreamIdentifier:@"AXEventTapManager" clientID:0 taskPort:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(AXEventTapManager *)self _copyCurrentEventTapPairs];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      if (objc_msgSend(v10, "type", (void)v13))
      {
        id v11 = [v10 handler];
        char v12 = ((uint64_t (**)(void, void *))v11)[2](v11, v4);
        [v10 identifier];

        if (v12) {
          break;
        }
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (BOOL)_processHIDEvent:(__IOHIDEvent *)a3 taskPort:(unsigned int)a4 bundleId:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = +[AXEventRepresentation representationWithHIDEvent:a3 hidStreamIdentifier:@"AXEventTapManager" clientID:a5 taskPort:*(void *)&a4];
  if (AXEventTypeIsTouch([v6 type])
    && ([v6 handInfo],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v7 paths],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 indexOfObjectPassingTest:&__block_literal_global_137],
        v8,
        v7,
        v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    BOOL v18 = 1;
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = [(AXEventTapManager *)self _copyCurrentEventTapPairs];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (!objc_msgSend(v15, "type", (void)v20))
          {
            long long v16 = [v15 handler];
            char v17 = ((uint64_t (**)(void, void *))v16)[2](v16, v6);
            [v15 identifier];

            if (v17)
            {
              BOOL v18 = 0;
              goto LABEL_14;
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    BOOL v18 = 1;
LABEL_14:
  }
  return v18;
}

BOOL __56__AXEventTapManager__processHIDEvent_taskPort_bundleId___block_invoke(uint64_t a1, void *a2)
{
  return [a2 pathIndex] > 0x12;
}

- (void)_reorderEventTaps
{
  if (self->_isEnumeratingEventTaps)
  {
    BOOL v3 = 1;
  }
  else
  {
    [(NSMutableArray *)self->_eventTaps sortUsingComparator:&__block_literal_global_140];
    BOOL v3 = 0;
  }
  self->_shouldReorderEventTaps = v3;
}

uint64_t __38__AXEventTapManager__reorderEventTaps__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unsigned int v5 = [a2 priority];
  unsigned int v6 = [v4 priority];

  uint64_t v7 = -1;
  if (v6 >= v5) {
    uint64_t v7 = 1;
  }
  if (v6 == v5) {
    return 0;
  }
  else {
    return v7;
  }
}

- (void)setFailedToProcessInTimeCallback:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NSRecursiveLock *)self->_eventTapLock lock];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __63__AXEventTapManager_setFailedToProcessInTimeCallback_callback___block_invoke;
  uint64_t v13 = &unk_1E55863D0;
  id v14 = v6;
  id v15 = v7;
  id v8 = v7;
  id v9 = v6;
  [(AXEventTapManager *)self _enumerateEventTapPairsUsingBlock:&v10];
  [(NSRecursiveLock *)self->_eventTapLock unlock];
}

void __63__AXEventTapManager_setFailedToProcessInTimeCallback_callback___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  id v6 = [v8 identifier];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    [v8 setFailedToHandleInTime:*(void *)(a1 + 40)];
    *a4 = 1;
  }
}

- (void)setEventTapPriority:(id)a3 priority:(int)a4
{
  id v6 = a3;
  [(NSRecursiveLock *)self->_eventTapLock lock];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__AXEventTapManager_setEventTapPriority_priority___block_invoke;
  v8[3] = &unk_1E55863F8;
  id v9 = v6;
  uint64_t v10 = self;
  int v11 = a4;
  id v7 = v6;
  [(AXEventTapManager *)self _enumerateEventTapPairsUsingBlock:v8];
  [(AXEventTapManager *)self _reorderEventTaps];
  [(NSRecursiveLock *)self->_eventTapLock unlock];
}

void __50__AXEventTapManager_setEventTapPriority_priority___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  id v6 = [v8 identifier];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    [*(id *)(a1 + 40) _setEventTapPriority:v8 priority:*(unsigned int *)(a1 + 48)];
    *a4 = 1;
  }
}

- (BOOL)_accessibilityShouldIgnoreHIDServiceForContinuity:(__IOHIDServiceClient *)a3
{
  BOOL v5 = [(AXEventTapManager *)self ignoreEventsForContinuitySession];
  LOBYTE(v6) = 0;
  if (a3 && v5)
  {
    int v7 = IOHIDServiceClientGetRegistryID(a3);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [(AXEventTapManager *)self disabledIDMappingRegistry];
      id v9 = [v8 objectForKeyedSubscript:v7];

      if (v9)
      {
        LOBYTE(v6) = [v9 BOOLValue];
      }
      else
      {
        int v11 = (void *)IOHIDServiceClientCopyProperty(a3, @"DisableAccessibilityEventTranslation");
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v6 = [v11 BOOLValue];
        }
        else {
          uint64_t v6 = 0;
        }
        uint64_t v12 = [(AXEventTapManager *)self disabledIDMappingRegistry];
        uint64_t v13 = [NSNumber numberWithBool:v6];
        [v12 setObject:v13 forKey:v7];
      }
    }
    else
    {
      uint64_t v10 = AXLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[AXEventTapManager _accessibilityShouldIgnoreHIDServiceForContinuity:]((uint64_t)v7, v10);
      }

      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (void)_setEventTapPriority:(id)a3 priority:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  [v5 setPriority:v4];
  if ([v5 type] == 1)
  {
    if (![v5 systemClient]) {
      _AXAssert();
    }
    [v5 systemClient];
    IOHIDEventSystemClientRegisterEventFilterCallbackWithPriority();
  }
}

- (void)_installEventTap:(id)a3 skipDeviceMatching:(BOOL)a4 filterEvents:(id)a5
{
  BOOL v6 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = AXLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = [v8 identifier];
    int v12 = 138412290;
    uint64_t v13 = v11;
    _os_log_impl(&dword_18D308000, v10, OS_LOG_TYPE_DEFAULT, "Installing event filter for: %@", (uint8_t *)&v12, 0xCu);
  }
  if ([v8 type] == 1) {
    [(AXEventTapManager *)self _installHIDFilter:v8 skipDeviceMatching:v6 filterEvents:v9];
  }
  else {
    [(AXEventTapManager *)self _installSystemEventTap:v8];
  }
}

- (id)_hidFilterListForPair:(id)a3 filterEvents:(id)a4
{
  v132[2] = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  if ([v4 wantsDigitizerEvents])
  {
    BOOL v6 = [NSString stringWithUTF8String:"DeviceUsagePage"];
    v131[0] = v6;
    v132[0] = &unk_1EDC62280;
    int v7 = [NSString stringWithUTF8String:"DeviceUsage"];
    v131[1] = v7;
    v132[1] = &unk_1EDC62298;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v132 forKeys:v131 count:2];
    [v5 addObject:v8];

    id v9 = [NSString stringWithUTF8String:"DeviceUsagePage"];
    v129[0] = v9;
    v130[0] = &unk_1EDC62280;
    uint64_t v10 = [NSString stringWithUTF8String:"DeviceUsage"];
    v129[1] = v10;
    v130[1] = &unk_1EDC622B0;
    int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v130 forKeys:v129 count:2];
    [v5 addObject:v11];

    int v12 = [NSString stringWithUTF8String:"DeviceUsagePage"];
    v127[0] = v12;
    v128[0] = &unk_1EDC62280;
    uint64_t v13 = [NSString stringWithUTF8String:"DeviceUsage"];
    v127[1] = v13;
    v128[1] = &unk_1EDC622C8;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v128 forKeys:v127 count:2];
    [v5 addObject:v14];

    id v15 = +[AXSettings sharedInstance];
    LODWORD(v13) = [v15 automationTrueTouch];

    if (v13)
    {
      long long v16 = [NSString stringWithUTF8String:"DeviceUsagePage"];
      v125[0] = v16;
      v126[0] = &unk_1EDC62280;
      char v17 = [NSString stringWithUTF8String:"DeviceUsage"];
      v125[1] = v17;
      v126[1] = &unk_1EDC622E0;
      BOOL v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v126 forKeys:v125 count:2];
      [v5 addObject:v18];
    }
  }
  if ([v4 wantsKeyboardEvents])
  {
    v19 = [NSString stringWithUTF8String:"DeviceUsagePage"];
    v123[0] = v19;
    v124[0] = &unk_1EDC622F8;
    long long v20 = [NSString stringWithUTF8String:"DeviceUsage"];
    v123[1] = v20;
    v124[1] = &unk_1EDC62310;
    long long v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v124 forKeys:v123 count:2];
    [v5 addObject:v21];

    long long v22 = [NSString stringWithUTF8String:"DeviceUsagePage"];
    v121[0] = v22;
    v122[0] = &unk_1EDC622F8;
    long long v23 = [NSString stringWithUTF8String:"DeviceUsage"];
    v121[1] = v23;
    v122[1] = &unk_1EDC62328;
    int v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v122 forKeys:v121 count:2];
    [v5 addObject:v24];

    uint64_t v25 = [NSString stringWithUTF8String:"DeviceUsagePage"];
    v119[0] = v25;
    v120[0] = &unk_1EDC622F8;
    long long v26 = [NSString stringWithUTF8String:"DeviceUsage"];
    v119[1] = v26;
    v120[1] = &unk_1EDC62340;
    id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v120 forKeys:v119 count:2];
    [v5 addObject:v27];

    long long v28 = [NSString stringWithUTF8String:"DeviceUsagePage"];
    v117[0] = v28;
    v118[0] = &unk_1EDC62310;
    long long v29 = [NSString stringWithUTF8String:"DeviceUsage"];
    v117[1] = v29;
    v118[1] = &unk_1EDC62358;
    long long v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v118 forKeys:v117 count:2];
    [v5 addObject:v30];

    long long v31 = [NSString stringWithUTF8String:"DeviceUsagePage"];
    v115[0] = v31;
    v116[0] = &unk_1EDC62370;
    v32 = [NSString stringWithUTF8String:"DeviceUsage"];
    v115[1] = v32;
    v116[1] = &unk_1EDC62358;
    uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:v115 count:2];
    [v5 addObject:v33];

    if (AXDeviceIsAudioAccessory())
    {
      v34 = [NSString stringWithUTF8String:"DeviceUsagePage"];
      v113[0] = v34;
      v114[0] = &unk_1EDC62298;
      v35 = [NSString stringWithUTF8String:"DeviceUsage"];
      v113[1] = v35;
      v114[1] = &unk_1EDC62310;
      v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v114 forKeys:v113 count:2];
      [v5 addObject:v36];
    }
    if ((AXDeviceIsWatch() & 1) != 0 || _AXSMossdeepEnabled())
    {
      v37 = [NSString stringWithUTF8String:"DeviceUsagePage"];
      v111 = v37;
      v112 = &unk_1EDC62388;
      v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v112 forKeys:&v111 count:1];
      [v5 addObject:v38];
    }
    v39 = [NSString stringWithUTF8String:"DeviceUsagePage"];
    v109[0] = v39;
    v110[0] = &unk_1EDC623A0;
    v40 = [NSString stringWithUTF8String:"DeviceUsage"];
    v109[1] = v40;
    v110[1] = &unk_1EDC62340;
    v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v110 forKeys:v109 count:2];
    [v5 addObject:v41];

    v42 = [NSString stringWithUTF8String:"DeviceUsagePage"];
    v107[0] = v42;
    v108[0] = &unk_1EDC623A0;
    v43 = [NSString stringWithUTF8String:"DeviceUsage"];
    v107[1] = v43;
    v108[1] = &unk_1EDC62358;
    v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:v107 count:2];
    [v5 addObject:v44];
  }
  if ([v4 wantsLisaEvents])
  {
    v45 = [NSString stringWithUTF8String:"DeviceUsagePage"];
    v105[0] = v45;
    v106[0] = &unk_1EDC623B8;
    v46 = [NSString stringWithUTF8String:"DeviceUsage"];
    v105[1] = v46;
    v106[1] = &unk_1EDC62310;
    v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:v105 count:2];
    [v5 addObject:v47];

    v48 = [NSString stringWithUTF8String:"DeviceUsagePage"];
    v103[0] = v48;
    v104[0] = &unk_1EDC62310;
    v49 = [NSString stringWithUTF8String:"DeviceUsage"];
    v103[1] = v49;
    v104[1] = &unk_1EDC623D0;
    v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v104 forKeys:v103 count:2];
    [v5 addObject:v50];
  }
  if ([v4 wantsATVRemoteEvents])
  {
    v51 = [NSString stringWithUTF8String:"DeviceUsagePage"];
    v101[0] = v51;
    v102[0] = &unk_1EDC62310;
    v52 = [NSString stringWithUTF8String:"DeviceUsage"];
    v101[1] = v52;
    v102[1] = &unk_1EDC623E8;
    v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:v101 count:2];
    [v5 addObject:v53];

    v54 = [NSString stringWithUTF8String:"DeviceUsagePage"];
    v99[0] = v54;
    v100[0] = &unk_1EDC62310;
    v55 = [NSString stringWithUTF8String:"DeviceUsage"];
    v99[1] = v55;
    v100[1] = &unk_1EDC62400;
    v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:v99 count:2];
    [v5 addObject:v56];

    v57 = [NSString stringWithUTF8String:"DeviceUsagePage"];
    v97[0] = v57;
    v98[0] = &unk_1EDC62310;
    v58 = [NSString stringWithUTF8String:"DeviceUsage"];
    v97[1] = v58;
    v98[1] = &unk_1EDC62418;
    v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:v97 count:2];
    [v5 addObject:v59];

    v60 = [NSString stringWithUTF8String:"DeviceUsagePage"];
    v95[0] = v60;
    v96[0] = &unk_1EDC62310;
    v61 = [NSString stringWithUTF8String:"DeviceUsage"];
    v95[1] = v61;
    v96[1] = &unk_1EDC62430;
    v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:2];
    [v5 addObject:v62];
  }
  if ([v4 wantsMouseEvents])
  {
    v63 = [NSString stringWithUTF8String:"DeviceUsagePage"];
    v93[0] = v63;
    v94[0] = &unk_1EDC62310;
    v64 = [NSString stringWithUTF8String:"DeviceUsage"];
    v93[1] = v64;
    v94[1] = &unk_1EDC62328;
    v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:2];
    [v5 addObject:v65];

    v66 = [NSString stringWithUTF8String:"DeviceUsagePage"];
    v91[0] = v66;
    v92[0] = &unk_1EDC62310;
    v67 = [NSString stringWithUTF8String:"DeviceUsage"];
    v91[1] = v67;
    v92[1] = &unk_1EDC62310;
    v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v91 count:2];
    [v5 addObject:v68];

    v69 = +[AXSettings sharedInstance];
    LODWORD(v67) = [v69 laserEnabled];

    if (v67)
    {
      v70 = [NSString stringWithUTF8String:"DeviceUsagePage"];
      v89[0] = v70;
      v90[0] = &unk_1EDC62280;
      v71 = [NSString stringWithUTF8String:"DeviceUsage"];
      v89[1] = v71;
      v90[1] = &unk_1EDC62298;
      v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:v89 count:2];
      [v5 addObject:v72];
    }
  }
  if ([v4 wantsStylusEvents])
  {
    v73 = [NSString stringWithUTF8String:"DeviceUsagePage"];
    v87[0] = v73;
    v88[0] = &unk_1EDC62280;
    v74 = [NSString stringWithUTF8String:"DeviceUsage"];
    v87[1] = v74;
    v88[1] = &unk_1EDC622B0;
    v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:v87 count:2];
    [v5 addObject:v75];
  }
  if ([v4 wantsAccessibilityEvents])
  {
    v76 = [NSString stringWithUTF8String:"DeviceUsagePage"];
    v85[0] = v76;
    v86[0] = &unk_1EDC62448;
    v77 = [NSString stringWithUTF8String:"DeviceUsage"];
    v85[1] = v77;
    v86[1] = &unk_1EDC62460;
    v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:2];
    [v5 addObject:v78];
  }
  if ([v4 wantsVolumeButtonEvents])
  {
    v79 = [NSString stringWithUTF8String:"DeviceUsagePage"];
    v84[0] = &unk_1EDC62388;
    v80 = objc_msgSend(NSString, "stringWithUTF8String:", "DeviceUsage", v79);
    v83[1] = v80;
    v84[1] = &unk_1EDC62310;
    v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:2];
    [v5 addObject:v81];
  }

  return v5;
}

- (void)_installHIDFilter:(id)a3 skipDeviceMatching:(BOOL)a4 filterEvents:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (![v8 systemClient])
  {
    uint64_t v10 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
    CFRunLoopGetCurrent();
    IOHIDEventSystemClientScheduleWithRunLoop();
    if (!a4)
    {
      int v11 = [(AXEventTapManager *)self _hidFilterListForPair:v8 filterEvents:v9];
      if ((unint64_t)[v11 count] < 2)
      {
        if ([v11 count] == 1)
        {
          int v12 = [v11 objectAtIndexedSubscript:0];
          IOHIDEventSystemClientSetMatching();
        }
      }
      else
      {
        IOHIDEventSystemClientSetMatchingMultiple();
      }
      uint64_t v13 = [v8 matchingServiceHandler];

      if (v13)
      {
        long long v21 = v11;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        CFArrayRef v14 = IOHIDEventSystemClientCopyServices(v10);
        uint64_t v15 = [(__CFArray *)v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v28;
          do
          {
            uint64_t v18 = 0;
            do
            {
              if (*(void *)v28 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * v18);
              objc_msgSend(v8, "matchingServiceHandler", v21);
              long long v20 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
              v20[2](v20, v19);

              ++v18;
            }
            while (v16 != v18);
            uint64_t v16 = [(__CFArray *)v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
          }
          while (v16);
        }

        uint64_t v22 = MEMORY[0x1E4F143A8];
        uint64_t v23 = 3221225472;
        int v24 = __71__AXEventTapManager__installHIDFilter_skipDeviceMatching_filterEvents___block_invoke;
        uint64_t v25 = &unk_1E5586420;
        id v26 = v8;
        IOHIDEventSystemClientRegisterDeviceMatchingBlock();

        int v11 = v21;
      }
    }
    objc_msgSend(v8, "setSystemClient:", v10, v21, v22, v23, v24, v25);
    if (v10) {
      CFRelease(v10);
    }
    [(NSRecursiveLock *)self->_eventTapLock lock];
    [(NSMutableArray *)self->_eventTaps insertObject:v8 atIndex:0];
    [(NSRecursiveLock *)self->_eventTapLock unlock];
  }
}

void __71__AXEventTapManager__installHIDFilter_skipDeviceMatching_filterEvents___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = [*(id *)(a1 + 32) matchingServiceHandler];
  v5[2](v5, a4);
}

- (void)_installSystemEventTap:(id)a3
{
  eventTapLock = self->_eventTapLock;
  id v5 = a3;
  [(NSRecursiveLock *)eventTapLock lock];
  if (self->_isEnumeratingEventTaps)
  {
    [(NSMutableArray *)self->_addedEventTapPairs addObject:v5];
  }
  else
  {
    [(NSMutableArray *)self->_eventTaps insertObject:v5 atIndex:0];

    if ([(NSMutableArray *)self->_eventTaps count] == 1) {
      [(AXEventTapManager *)self _setHIDEventTapCallback:_axEventTapHIDCallback];
    }
  }
  [(AXEventTapManager *)self _reorderEventTaps];
  BOOL v6 = self->_eventTapLock;

  [(NSRecursiveLock *)v6 unlock];
}

- (id)installEventTap:(id)a3 identifier:(id)a4 type:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_opt_new();
  int v11 = [(AXEventTapManager *)self installEventTap:v9 identifier:v8 type:v5 skipDeviceMatching:0 filterEvents:v10 matchingServiceHandler:0];

  return v11;
}

- (id)installEventTap:(id)a3 identifier:(id)a4 type:(int)a5 skipDeviceMatching:(BOOL)a6 filterEvents:(id)a7 matchingServiceHandler:(id)a8
{
  BOOL v10 = a6;
  uint64_t v11 = *(void *)&a5;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  id v17 = a3;
  uint64_t v18 = objc_alloc_init(AXEventTapPair);
  [(AXEventTapPair *)v18 setHandler:v17];

  [(AXEventTapPair *)v18 setMatchingServiceHandler:v16];
  [(AXEventTapPair *)v18 setType:v11];
  CFAllocatorRef v19 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFUUIDRef v20 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (v14)
  {
    [(AXEventTapPair *)v18 setIdentifier:v14];
  }
  else
  {
    long long v21 = (__CFString *)CFUUIDCreateString(v19, v20);
    [(AXEventTapPair *)v18 setIdentifier:v21];
  }
  [(AXEventTapPair *)v18 setPriority:30];
  if (v20) {
    CFRelease(v20);
  }
  [(AXEventTapManager *)self _installEventTap:v18 skipDeviceMatching:v10 filterEvents:v15];
  uint64_t v22 = [(AXEventTapPair *)v18 identifier];

  return v22;
}

- (id)installKeyboardEventTap:(id)a3 identifier:(id)a4 matchingServiceHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_opt_new();
  [v11 setWantsKeyboardEvents:1];
  int v12 = [(AXEventTapManager *)self installEventTap:v10 identifier:v9 type:1 skipDeviceMatching:0 filterEvents:v11 matchingServiceHandler:v8];

  return v12;
}

- (void)removeEventTap:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSRecursiveLock *)self->_eventTapLock lock];
    if (self->_isEnumeratingEventTaps)
    {
      [(NSMutableSet *)self->_removedEventTapIdentifiers addObject:v4];
    }
    else
    {
      eventTaps = self->_eventTaps;
      uint64_t v7 = MEMORY[0x1E4F143A8];
      uint64_t v8 = 3221225472;
      id v9 = __36__AXEventTapManager_removeEventTap___block_invoke;
      id v10 = &unk_1E5586448;
      id v11 = v4;
      int v12 = self;
      BOOL v6 = [(NSMutableArray *)eventTaps indexesOfObjectsPassingTest:&v7];
      -[NSMutableArray removeObjectsAtIndexes:](eventTaps, "removeObjectsAtIndexes:", v6, v7, v8, v9, v10);

      if (![(NSMutableArray *)self->_eventTaps count]) {
        [(AXEventTapManager *)self _setHIDEventTapCallback:0];
      }
    }
    [(AXEventTapManager *)self _reorderEventTaps];
    [(NSRecursiveLock *)self->_eventTapLock unlock];
  }
}

uint64_t __36__AXEventTapManager_removeEventTap___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [v6 identifier];
  uint64_t v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    *a4 = 1;
    [*(id *)(a1 + 40) _removeHIDEventTapFilter:v6];
  }

  return v8;
}

- (void)_removeHIDEventTapFilter:(id)a3
{
  id v3 = a3;
  if ([v3 systemClient])
  {
    if ([v3 type] != 1) {
      _AXAssert();
    }
    [v3 systemClient];
    IOHIDEventSystemClientUnregisterEventFilterCallback();
    [v3 systemClient];
    CFRunLoopGetCurrent();
    IOHIDEventSystemClientUnscheduleWithRunLoop();
  }
}

- (void)runMatchingServiceHandlerForEventTap:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(AXEventTapManager *)self _copyCurrentEventTapPairs];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "identifier", (void)v13);
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          [(AXEventTapManager *)self _runMatchingServiceHandler:v10];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)_runMatchingServiceHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 matchingServiceHandler];

  if (!v4) {
    _AXAssert();
  }
  id v5 = [v3 matchingServiceHandler];

  if (v5)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    CFArrayRef v6 = IOHIDEventSystemClientCopyServices((IOHIDEventSystemClientRef)[v3 systemClient]);
    uint64_t v7 = [(__CFArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
          objc_msgSend(v3, "matchingServiceHandler", (void)v13);
          int v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
          v12[2](v12, v11);

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(__CFArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (id)installationGSCallback
{
  return self->_installationGSCallback;
}

- (void)setInstallationGSCallback:(id)a3
{
}

- (id)installationHIDCallback
{
  return self->_installationHIDCallback;
}

- (void)setInstallationHIDCallback:(id)a3
{
}

- (id)installationEventRepPost
{
  return self->_installationEventRepPost;
}

- (void)setInstallationEventRepPost:(id)a3
{
}

- (BOOL)ignoreEventsForContinuitySession
{
  return self->_ignoreEventsForContinuitySession;
}

- (void)setIgnoreEventsForContinuitySession:(BOOL)a3
{
  self->_ignoreEventsForContinuitySession = a3;
}

- (NSMutableDictionary)disabledIDMappingRegistry
{
  return self->_disabledIDMappingRegistry;
}

- (void)setDisabledIDMappingRegistry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledIDMappingRegistry, 0);
  objc_storeStrong(&self->_installationEventRepPost, 0);
  objc_storeStrong((id *)&self->_eventTapLock, 0);
  objc_storeStrong(&self->_installationHIDCallback, 0);
  objc_storeStrong(&self->_installationGSCallback, 0);
  objc_storeStrong((id *)&self->_removedEventTapIdentifiers, 0);
  objc_storeStrong((id *)&self->_addedEventTapPairs, 0);

  objc_storeStrong((id *)&self->_eventTaps, 0);
}

- (void)_accessibilityShouldIgnoreHIDServiceForContinuity:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  id v3 = "-[AXEventTapManager _accessibilityShouldIgnoreHIDServiceForContinuity:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_18D308000, a2, OS_LOG_TYPE_ERROR, "%s: hidServiceClientRegistryIDNum is not NSNumber: %@", (uint8_t *)&v2, 0x16u);
}

@end