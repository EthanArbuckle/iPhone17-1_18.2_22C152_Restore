@interface IAMMessageCoordinator
+ (id)_createMessageFromMessageEntry:(id)a3 replacingResourcePathsWithCachedResourceLocations:(BOOL)a4;
+ (void)initialize;
- (IAMApplicationContextProvider)applicationContext;
- (IAMMessageCoordinator)init;
- (IAMMessageMetricsDelegate)metricsDelegate;
- (id)_dequeuePendingTriggerContexts;
- (id)_filterActiveTargetIdentifiers:(id)a3;
- (id)_messageBundleIdentifiers;
- (id)_metadataEntryForMessageIdentifier:(id)a3;
- (id)beginObservingTriggerEvent:(id)a3 withHandler:(id)a4;
- (void)_calculateMessagesProximityAndDownloadResourcesIfNeeded:(id)a3;
- (void)_enqueuePendingTriggerContext:(id)a3;
- (void)_evaluateMessagesForAllActiveTargets;
- (void)_fetchMessagesAndMetadataFromStorageCoordinator:(id)a3;
- (void)_handleMessageReachedMaximumDisplayCount:(id)a3;
- (void)_handleUpdatedMessageEntries:(id)a3 andMetadata:(id)a4;
- (void)_incrementNumberOfDisplaysForMessageEntry:(id)a3;
- (void)_notifyMessageTargets:(id)a3 withTargetIdentifier:(id)a4 didUpdatePriorityMessageFromEntry:(id)a5 observedEventName:(id)a6;
- (void)_processObservedEventCallbacksforEventName:(id)a3 willTriggerPresentation:(BOOL)a4 messageIdentifier:(id)a5;
- (void)_reevaluateMessageEntries:(id)a3 forTargetIdentifier:(id)a4 shouldNotifyTargetsIfPriorityMessageNonNil:(BOOL)a5 withObservedEventName:(id)a6;
- (void)_reevaluateTargetsWithIdentifiers:(id)a3 forTriggerContext:(id)a4 shouldNotifyTargetsIfPriorityMessageNonNil:(BOOL)a5;
- (void)_removeUserNotificationRemovalForMessageWithIdentifier:(id)a3;
- (void)_reportHoldoutMessageWouldAppear:(id)a3;
- (void)_reportMessageAction:(id)a3 wasPerformedInMessageEntry:(id)a4 fromTargetWithIdentifier:(id)a5;
- (void)_setMessageGroups:(id)a3;
- (void)_startStorageCoordinatorWithMessageEntryProvider:(id)a3 messageMetadataStorage:(id)a4 propertyStorage:(id)a5;
- (void)_updateLastDisplayTime:(id)a3 forMessageEntry:(id)a4;
- (void)_updateMetadata:(id)a3 forMessageEntry:(id)a4 completion:(id)a5;
- (void)_updateMetadataOfMessageEntriesByTrigger:(id)a3 forReceivedEvent:(id)a4;
- (void)_updatePriorityMessageEntry:(id)a3 forTargetIdentifier:(id)a4 shouldNotifyTargetsIfNonNil:(BOOL)a5 observedEventName:(id)a6;
- (void)dealloc;
- (void)endObservingTriggerEvent:(id)a3 forToken:(id)a4;
- (void)impressionManager:(id)a3 impressionDidEndForMessageEntry:(id)a4;
- (void)impressionManager:(id)a3 shouldReportImpressionEventWithDictionary:(id)a4;
- (void)receiveEvent:(id)a3;
- (void)receiveTriggerEventContext:(id)a3;
- (void)registerMessageTarget:(id)a3;
- (void)reportApplicationContextPropertiesDidChange:(id)a3;
- (void)reportChangedContextPropertiesContext:(id)a3;
- (void)reportMessageDidAppearWithIdentifier:(id)a3;
- (void)reportMessageDidAppearWithIdentifier:(id)a3 fromTargetWithIdentifier:(id)a4;
- (void)reportMessageDidDisappearWithIdentifier:(id)a3;
- (void)reportMessageDidDisappearWithIdentifier:(id)a3 fromTargetWithIdentifier:(id)a4;
- (void)reportMessageWithIdentifier:(id)a3 actionWasPerformedWithIdentifier:(id)a4;
- (void)reportMessageWithIdentifier:(id)a3 actionWasPerformedWithIdentifier:(id)a4 fromTargetWithIdentifier:(id)a5;
- (void)reportMetricsEvent:(id)a3;
- (void)setApplicationContext:(id)a3;
- (void)setMetricsDelegate:(id)a3;
- (void)start;
- (void)startWithApplicationContext:(id)a3;
- (void)startWithApplicationContext:(id)a3 messageGroups:(id)a4;
- (void)startWithApplicationContext:(id)a3 messageGroups:(id)a4 messageEntryProvider:(id)a5 messageMetadataStorage:(id)a6 propertyStorage:(id)a7;
- (void)storageCoordinatorMessageEntriesChanged:(id)a3;
- (void)triggerPresentationForMessageWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)unregisterMessageTarget:(id)a3;
@end

@implementation IAMMessageCoordinator

- (void)startWithApplicationContext:(id)a3 messageGroups:(id)a4
{
}

- (void)reportApplicationContextPropertiesDidChange:(id)a3
{
  id v4 = a3;
  v5 = [IAMChangedContextPropertiesTriggerContext alloc];
  id v8 = [MEMORY[0x263F086E0] mainBundle];
  v6 = [v8 bundleIdentifier];
  v7 = [(IAMChangedContextPropertiesTriggerContext *)v5 initWithContextPropertyNames:v4 bundleIdentifier:v6];

  [(IAMMessageCoordinator *)self reportChangedContextPropertiesContext:v7];
}

- (void)reportChangedContextPropertiesContext:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__IAMMessageCoordinator_reportChangedContextPropertiesContext___block_invoke;
  v7[3] = &unk_264341DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

- (void)receiveEvent:(id)a3
{
  id v4 = a3;
  v5 = [IAMReceivedEventTriggerContext alloc];
  id v6 = [MEMORY[0x263F086E0] mainBundle];
  v7 = [v6 bundleIdentifier];
  id v8 = [(IAMReceivedEventTriggerContext *)v5 initWithEvent:v4 bundleIdentifier:v7];

  [(IAMMessageCoordinator *)self receiveTriggerEventContext:v8];
}

- (void)receiveTriggerEventContext:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__IAMMessageCoordinator_receiveTriggerEventContext___block_invoke;
  v7[3] = &unk_264341DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

- (void)_startStorageCoordinatorWithMessageEntryProvider:(id)a3 messageMetadataStorage:(id)a4 propertyStorage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(IAMMessageCoordinator *)self _messageBundleIdentifiers];
  v12 = [[IAMStorageCoordinator alloc] initWithMessageEntryProvider:v8 messageMetadataStorage:v9 propertyStorage:v10 messageBundleIdentifiers:v11];
  storageCoordinator = self->_storageCoordinator;
  self->_storageCoordinator = v12;

  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __113__IAMMessageCoordinator__startStorageCoordinatorWithMessageEntryProvider_messageMetadataStorage_propertyStorage___block_invoke;
  v14[3] = &unk_264341ED8;
  objc_copyWeak(&v15, &location);
  v14[4] = self;
  [(IAMMessageCoordinator *)self _fetchMessagesAndMetadataFromStorageCoordinator:v14];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_fetchMessagesAndMetadataFromStorageCoordinator:(id)a3
{
  id v4 = a3;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__0;
  v30[4] = __Block_byref_object_dispose__0;
  id v31 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  char v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__0;
  v26[4] = __Block_byref_object_dispose__0;
  id v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__0;
  v24[4] = __Block_byref_object_dispose__0;
  id v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  objc_initWeak(&location, self);
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__30;
  v19[4] = __Block_byref_object_dispose__31;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__IAMMessageCoordinator__fetchMessagesAndMetadataFromStorageCoordinator___block_invoke;
  v12[3] = &unk_264341F00;
  v14 = v30;
  id v5 = v4;
  id v13 = v5;
  id v15 = v28;
  v16 = v22;
  v17 = v26;
  v18 = v24;
  id v20 = (id)MEMORY[0x21D475810](v12);
  storageCoordinator = self->_storageCoordinator;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73__IAMMessageCoordinator__fetchMessagesAndMetadataFromStorageCoordinator___block_invoke_2;
  v10[3] = &unk_264341F50;
  v10[4] = self;
  objc_copyWeak(&v11, &location);
  v10[5] = v19;
  v10[6] = v26;
  v10[7] = v24;
  v10[8] = v28;
  [(IAMStorageCoordinator *)storageCoordinator fetchMessagesEntriesAndMetadata:v10];
  v7 = self->_storageCoordinator;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__IAMMessageCoordinator__fetchMessagesAndMetadataFromStorageCoordinator___block_invoke_4;
  v8[3] = &unk_264341FA0;
  v8[4] = self;
  objc_copyWeak(&v9, &location);
  v8[5] = v19;
  v8[6] = v22;
  [(IAMStorageCoordinator *)v7 fetchGlobalPresentationPolicyGroupDisplayTimes:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  _Block_object_dispose(v19, 8);

  objc_destroyWeak(&location);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);
}

- (IAMMessageCoordinator)init
{
  v30.receiver = self;
  v30.super_class = (Class)IAMMessageCoordinator;
  v2 = [(IAMMessageCoordinator *)&v30 init];
  if (v2)
  {
    [(id)_allCoordinators addObject:v2];
    uint64_t v3 = objc_opt_new();
    messageTargetsByTargetIdentifier = v2->_messageTargetsByTargetIdentifier;
    v2->_messageTargetsByTargetIdentifier = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    messageTargetsRequiringNilPriorityMessageNotificationAfterRegistrationByTargetIdentifier = v2->_messageTargetsRequiringNilPriorityMessageNotificationAfterRegistrationByTargetIdentifier;
    v2->_messageTargetsRequiringNilPriorityMessageNotificationAfterRegistrationByTargetIdentifier = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    priorityMessageEntryByTargetIdentifier = v2->_priorityMessageEntryByTargetIdentifier;
    v2->_priorityMessageEntryByTargetIdentifier = (NSMutableDictionary *)v7;

    id v9 = objc_alloc_init(IAMImpressionManager);
    impressionManager = v2->_impressionManager;
    v2->_impressionManager = v9;

    [(IAMImpressionManager *)v2->_impressionManager setDelegate:v2];
    id v11 = NSString;
    v12 = [MEMORY[0x263F08C38] UUID];
    id v13 = [v12 UUIDString];
    uint64_t v14 = [v11 stringWithFormat:@"ModalTarget-%@", v13];
    modalTargetIdentifier = v2->_modalTargetIdentifier;
    v2->_modalTargetIdentifier = (NSString *)v14;

    v16 = [[IAMModalTarget alloc] initWithMessageCoordinator:v2 targetIdentifier:v2->_modalTargetIdentifier];
    modalTarget = v2->_modalTarget;
    v2->_modalTarget = v16;

    v18 = [[IAMMessageEntryManager alloc] initWithModalTargetIdentifier:v2->_modalTargetIdentifier];
    messageEntryManager = v2->_messageEntryManager;
    v2->_messageEntryManager = v18;

    messageGroupsByGroupIdentifier = v2->_messageGroupsByGroupIdentifier;
    v2->_messageGroupsByGroupIdentifier = (NSDictionary *)MEMORY[0x263EFFA78];

    uint64_t v21 = objc_opt_new();
    pendingTriggerContexts = v2->_pendingTriggerContexts;
    v2->_pendingTriggerContexts = (NSMutableArray *)v21;

    v2->_isReadyToEvaluateMessages = 0;
    char v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = dispatch_queue_attr_make_with_qos_class(v23, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v25 = dispatch_queue_create("com.apple.InAppMessages.IAMMessageCoordinator.accessQueue", v24);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v25;

    uint64_t v27 = objc_opt_new();
    completionHandlersForObservedEvents = v2->_completionHandlersForObservedEvents;
    v2->_completionHandlersForObservedEvents = (NSMutableDictionary *)v27;

    [(IAMMessageCoordinator *)v2 registerMessageTarget:v2->_modalTarget];
  }
  return v2;
}

- (void)registerMessageTarget:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 targetIdentifier];
  if (objc_opt_respondsToSelector()) {
    char v6 = [v4 shouldBeNotifiedOfNilPriorityMessageAfterRegistration];
  }
  else {
    char v6 = 0;
  }
  accessQueue = self->_accessQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__IAMMessageCoordinator_registerMessageTarget___block_invoke;
  v10[3] = &unk_264341D20;
  v10[4] = self;
  id v11 = v5;
  id v12 = v4;
  char v13 = v6;
  id v8 = v4;
  id v9 = v5;
  dispatch_async(accessQueue, v10);
}

- (id)_messageBundleIdentifiers
{
  uint64_t v3 = objc_opt_new();
  id v4 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v5 = [v4 bundleIdentifier];
  [v3 addObject:v5];

  char v6 = [(NSDictionary *)self->_messageGroupsByGroupIdentifier allKeys];
  [v3 addObjectsFromArray:v6];

  uint64_t v7 = (void *)[v3 copy];

  return v7;
}

void __63__IAMMessageCoordinator_reportChangedContextPropertiesContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 104))
  {
    id v6 = [*(id *)(v2 + 96) messageEntriesForContextPropertiesContext:*(void *)(a1 + 40)];
    uint64_t v3 = +[IAMMessageEntryManager targetIdentifiersForMessageEntries:v6];
    id v4 = [*(id *)(a1 + 32) _filterActiveTargetIdentifiers:v3];
    [*(id *)(a1 + 32) _reevaluateTargetsWithIdentifiers:v4 forTriggerContext:*(void *)(a1 + 40) shouldNotifyTargetsIfPriorityMessageNonNil:0];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    [(id)v2 _enqueuePendingTriggerContext:v5];
  }
}

void __52__IAMMessageCoordinator_receiveTriggerEventContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 104))
  {
    id v9 = [*(id *)(v2 + 96) messageEntriesByTriggerForEventContext:*(void *)(a1 + 40)];
    uint64_t v3 = +[IAMMessageEntryManager uniqueMessageEntriesInMessageEntriesByTrigger:v9];
    id v4 = +[IAMMessageEntryManager targetIdentifiersForMessageEntries:v3];
    uint64_t v5 = [*(id *)(a1 + 32) _filterActiveTargetIdentifiers:v4];
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = [*(id *)(a1 + 40) event];
    [v6 _updateMetadataOfMessageEntriesByTrigger:v9 forReceivedEvent:v7];

    [*(id *)(a1 + 32) _calculateMessagesProximityAndDownloadResourcesIfNeeded:v3];
    [*(id *)(a1 + 32) _reevaluateTargetsWithIdentifiers:v5 forTriggerContext:*(void *)(a1 + 40) shouldNotifyTargetsIfPriorityMessageNonNil:0];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    [(id)v2 _enqueuePendingTriggerContext:v8];
  }
}

- (id)_filterActiveTargetIdentifiers:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = (void *)[(NSMutableDictionary *)self->_messageTargetsByTargetIdentifier copy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        char v13 = objc_msgSend(v6, "objectForKeyedSubscript:", v12, (void)v16);

        if (v13) {
          [v5 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  uint64_t v14 = (void *)[v5 copy];

  return v14;
}

- (void)_updateMetadataOfMessageEntriesByTrigger:(id)a3 forReceivedEvent:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v6;
  uint64_t v8 = v6;
  uint64_t v9 = v7;
  uint64_t v30 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v41;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v41 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v10;
        id v11 = *(void **)(*((void *)&v40 + 1) + 8 * v10);
        uint64_t v12 = [obj objectForKey:v11];
        v35 = [v11 nameSpacedKeyName];
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v34 = v12;
        uint64_t v13 = [v34 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v37;
          uint64_t v33 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v37 != v15) {
                objc_enumerationMutation(v34);
              }
              long long v17 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              long long v18 = [v17 applicationMessage];
              long long v19 = [v18 identifier];

              id v20 = [(IAMMessageCoordinator *)self _metadataEntryForMessageIdentifier:v19];
              uint64_t v21 = v20;
              if (v20) {
                id v22 = v20;
              }
              else {
                id v22 = (id)objc_opt_new();
              }
              char v23 = v22;

              uint64_t v24 = [v9 type];
              if (v24)
              {
                if (v24 != 1) {
                  goto LABEL_19;
                }
                dispatch_queue_t v25 = [v9 value];
                [v23 setMetadataValue:v25 forKey:v35];
              }
              else
              {
                v26 = v9;
                uint64_t v27 = NSNumber;
                dispatch_queue_t v25 = [v23 metadataValueForKey:v35];
                v28 = objc_msgSend(v27, "numberWithInt:", objc_msgSend(v25, "intValue") + 1);
                [v23 setMetadataValue:v28 forKey:v35];

                uint64_t v9 = v26;
                uint64_t v15 = v33;
              }

LABEL_19:
              [(IAMMessageCoordinator *)self _updateMetadata:v23 forMessageEntry:v17 completion:0];
            }
            uint64_t v14 = [v34 countByEnumeratingWithState:&v36 objects:v44 count:16];
          }
          while (v14);
        }

        uint64_t v10 = v32 + 1;
      }
      while (v32 + 1 != v30);
      uint64_t v30 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v30);
  }
}

- (void)_calculateMessagesProximityAndDownloadResourcesIfNeeded:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)[(NSDate *)self->_lastDisplayTimeGlobalPresentationPolicyGroupRestricted copy];
  id v6 = (void *)[(NSDate *)self->_lastDisplayTimeGlobalPresentationPolicyGroupNormal copy];
  id v7 = (void *)[(NSDictionary *)self->_metadataEntryByMessageIdentifier copy];
  uint64_t v8 = (void *)[(NSDictionary *)self->_messageGroupsByGroupIdentifier copy];
  uint64_t v9 = [IAMEvaluator alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationContext);
  id v11 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v12 = [v11 bundleIdentifier];
  uint64_t v13 = [(IAMEvaluator *)v9 initWithMessageEntries:v4 metadataEntries:v7 applicationContext:WeakRetained hostBundleIdentifier:v12 messageGroups:v8 lastDisplayTimeForRestrictedPresentationPolicyGroup:v5 lastDisplayTimeForNormalPresentationPolicyGroup:v6];

  uint64_t v14 = [(IAMEvaluator *)v13 computeMessagesCloseToPassingWithProximityThreshold:50];
  if ([v14 count])
  {
    v26 = v13;
    uint64_t v27 = v8;
    v28 = v7;
    uint64_t v29 = v6;
    uint64_t v30 = v5;
    id v31 = v4;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v33 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if (([v20 shouldDownloadResources] & 1) == 0)
          {
            uint64_t v21 = [v20 applicationMessage];
            char v22 = [v21 hasHoldoutEvent];

            if ((v22 & 1) == 0)
            {
              char v23 = IAMLogCategoryDefault();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v24 = [v20 applicationMessage];
                dispatch_queue_t v25 = [v24 identifier];
                *(_DWORD *)buf = 138543362;
                long long v37 = v25;
                _os_log_impl(&dword_2188AF000, v23, OS_LOG_TYPE_DEFAULT, "Asking iTunesCloud to download resources for message with identifier = %{public}@", buf, 0xCu);
              }
              [(IAMStorageCoordinator *)self->_storageCoordinator downloadResourcesForMessageEntry:v20 completion:0];
              [v20 setShouldDownloadResources:1];
            }
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v17);
    }

    uint64_t v5 = v30;
    id v4 = v31;
    id v7 = v28;
    id v6 = v29;
    uint64_t v13 = v26;
    uint64_t v8 = v27;
  }
}

- (void)_reevaluateTargetsWithIdentifiers:(id)a3 forTriggerContext:(id)a4 shouldNotifyTargetsIfPriorityMessageNonNil:(BOOL)a5
{
  BOOL v29 = a5;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v9 = v8;
    completionHandlersForObservedEvents = self->_completionHandlersForObservedEvents;
    id v11 = [v9 event];
    uint64_t v12 = [v11 name];
    uint64_t v13 = [(NSMutableDictionary *)completionHandlersForObservedEvents objectForKeyedSubscript:v12];

    if (v13)
    {
      uint64_t v14 = [v9 event];
      id v15 = [v14 name];
      uint64_t v13 = (void *)[v15 copy];

      char v16 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v13 = 0;
    id v9 = 0;
  }
  char v16 = 1;
LABEL_7:
  if (self->_isReadyToEvaluateMessages)
  {
    if ([v7 count]) {
      char v17 = 1;
    }
    else {
      char v17 = v16;
    }
    if (v17)
    {
      id v26 = v9;
      id v27 = v7;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id obj = v7;
      uint64_t v18 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v31 != v20) {
              objc_enumerationMutation(obj);
            }
            uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8 * i);
            char v23 = -[IAMMessageEntryManager messageEntriesForTargetIdentifier:](self->_messageEntryManager, "messageEntriesForTargetIdentifier:", v22, v26, v27);
            uint64_t v24 = (void *)[v23 copy];

            dispatch_queue_t v25 = +[IAMMessageEntryManager messageEntries:v24 withSatisfiedPresentationTriggerForTriggerContext:v8];
            [(IAMMessageCoordinator *)self _reevaluateMessageEntries:v25 forTargetIdentifier:v22 shouldNotifyTargetsIfPriorityMessageNonNil:v29 withObservedEventName:v13];
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v19);
      }

      id v9 = v26;
      id v7 = v27;
    }
    else
    {
      [(IAMMessageCoordinator *)self _processObservedEventCallbacksforEventName:v13 willTriggerPresentation:0 messageIdentifier:0];
    }
  }
}

- (void)_reevaluateMessageEntries:(id)a3 forTargetIdentifier:(id)a4 shouldNotifyTargetsIfPriorityMessageNonNil:(BOOL)a5 withObservedEventName:(id)a6
{
  BOOL v27 = a5;
  lastDisplayTimeGlobalPresentationPolicyGroupRestricted = self->_lastDisplayTimeGlobalPresentationPolicyGroupRestricted;
  id v26 = a6;
  id v25 = a4;
  id v10 = a3;
  id v11 = (void *)[(NSDate *)lastDisplayTimeGlobalPresentationPolicyGroupRestricted copy];
  uint64_t v24 = (void *)[(NSDate *)self->_lastDisplayTimeGlobalPresentationPolicyGroupNormal copy];
  uint64_t v12 = (void *)[(NSDictionary *)self->_metadataEntryByMessageIdentifier copy];
  uint64_t v13 = (void *)[(NSDictionary *)self->_messageGroupsByGroupIdentifier copy];
  uint64_t v14 = [IAMEvaluator alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationContext);
  char v16 = [MEMORY[0x263F086E0] mainBundle];
  char v17 = [v16 bundleIdentifier];
  uint64_t v18 = [(IAMEvaluator *)v14 initWithMessageEntries:v10 metadataEntries:v12 applicationContext:WeakRetained hostBundleIdentifier:v17 messageGroups:v13 lastDisplayTimeForRestrictedPresentationPolicyGroup:v11 lastDisplayTimeForNormalPresentationPolicyGroup:v24];

  uint64_t v19 = [(IAMEvaluator *)v18 computePassingMessageEntries];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __136__IAMMessageCoordinator__reevaluateMessageEntries_forTargetIdentifier_shouldNotifyTargetsIfPriorityMessageNonNil_withObservedEventName___block_invoke;
  void v28[3] = &unk_264341FC8;
  v28[4] = self;
  uint64_t v20 = [MEMORY[0x263F08A98] predicateWithBlock:v28];
  uint64_t v21 = [v19 filteredArrayUsingPredicate:v20];

  uint64_t v22 = [v21 sortedArrayUsingComparator:&__block_literal_global_0];
  char v23 = [v22 firstObject];
  [(IAMMessageCoordinator *)self _updatePriorityMessageEntry:v23 forTargetIdentifier:v25 shouldNotifyTargetsIfNonNil:v27 observedEventName:v26];
}

void __47__IAMMessageCoordinator_registerMessageTarget___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v2)
  {
    uint64_t v2 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  if (([v2 containsObject:*(void *)(a1 + 48)] & 1) == 0) {
    [v2 addObject:*(void *)(a1 + 48)];
  }
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
    if (!v3)
    {
      uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
      [*(id *)(*(void *)(a1 + 32) + 32) setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
    }
    if (([v3 containsObject:*(void *)(a1 + 48)] & 1) == 0) {
      [v3 addObject:*(void *)(a1 + 48)];
    }
  }
  id v4 = *(unsigned char **)(a1 + 32);
  if (v4[104])
  {
    v6[0] = *(void *)(a1 + 40);
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
    [v4 _reevaluateTargetsWithIdentifiers:v5 forTriggerContext:0 shouldNotifyTargetsIfPriorityMessageNonNil:1];
  }
}

uint64_t __127__IAMMessageCoordinator_startWithApplicationContext_messageGroups_messageEntryProvider_messageMetadataStorage_propertyStorage___block_invoke(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 48));
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)[*(id *)(a1 + 40) copy];
  [v2 _setMessageGroups:v3];

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);

  return [v4 _startStorageCoordinatorWithMessageEntryProvider:v5 messageMetadataStorage:v6 propertyStorage:v7];
}

- (void)_setMessageGroups:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v16 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          [v11 setMessageCoordinator:self];
          uint64_t v12 = [v11 groupIdentifier];
          if (v12)
          {
            [v5 setObject:v11 forKeyedSubscript:v12];
          }
          else
          {
            uint64_t v13 = IAMLogCategoryDefault();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v22 = v11;
              _os_log_impl(&dword_2188AF000, v13, OS_LOG_TYPE_ERROR, "No group identifier specified for message group = %{public}@", buf, 0xCu);
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v8);
    }

    uint64_t v14 = (NSDictionary *)[v5 copy];
    messageGroupsByGroupIdentifier = self->_messageGroupsByGroupIdentifier;
    self->_messageGroupsByGroupIdentifier = v14;

    [(IAMModalTarget *)self->_modalTarget setMessageGroupsByGroupIdentifier:self->_messageGroupsByGroupIdentifier];
    id v4 = v16;
  }
}

- (void)_updatePriorityMessageEntry:(id)a3 forTargetIdentifier:(id)a4 shouldNotifyTargetsIfNonNil:(BOOL)a5 observedEventName:(id)a6
{
  BOOL v7 = a5;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(NSMutableDictionary *)self->_priorityMessageEntryByTargetIdentifier objectForKeyedSubscript:v11];
  uint64_t v14 = [(NSMutableDictionary *)self->_messageTargetsByTargetIdentifier objectForKeyedSubscript:v11];
  id v15 = (void *)[v14 copy];

  if (v13 != v10 || ([v11 isEqualToString:self->_modalTargetIdentifier] & 1) != 0)
  {
LABEL_5:
    [(NSMutableDictionary *)self->_priorityMessageEntryByTargetIdentifier setObject:v10 forKeyedSubscript:v11];
    if (!v15) {
      goto LABEL_13;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    if (!v7) {
      goto LABEL_13;
    }
    goto LABEL_5;
  }
  uint64_t v21 = [(NSMutableDictionary *)self->_messageTargetsRequiringNilPriorityMessageNotificationAfterRegistrationByTargetIdentifier objectForKeyedSubscript:v11];
  uint64_t v22 = [v21 copy];

  if (!v22) {
    goto LABEL_13;
  }

  [(NSMutableDictionary *)self->_priorityMessageEntryByTargetIdentifier setObject:0 forKeyedSubscript:v11];
  id v15 = (void *)v22;
LABEL_6:
  [(NSMutableDictionary *)self->_messageTargetsRequiringNilPriorityMessageNotificationAfterRegistrationByTargetIdentifier setObject:0 forKeyedSubscript:v11];
  id v16 = [v10 applicationMessage];
  int v17 = [v16 hasHoldoutEvent];

  if (v17)
  {
    [(IAMMessageCoordinator *)self _reportHoldoutMessageWouldAppear:v10];
    long long v18 = IAMLogCategoryDefault();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      long long v19 = [v10 applicationMessage];
      long long v20 = [v19 identifier];
      int v23 = 138543362;
      uint64_t v24 = v20;
      _os_log_impl(&dword_2188AF000, v18, OS_LOG_TYPE_DEFAULT, "Unable to display message for identifier = %{public}@. The message contains a holdoutEvent", (uint8_t *)&v23, 0xCu);
    }
    [(IAMMessageCoordinator *)self _processObservedEventCallbacksforEventName:v12 willTriggerPresentation:0 messageIdentifier:0];
  }
  else
  {
    if (v10) {
      [(IAMMessageEntryManager *)self->_messageEntryManager addPriorityMessageEntry:v10];
    }
    [(IAMMessageCoordinator *)self _notifyMessageTargets:v15 withTargetIdentifier:v11 didUpdatePriorityMessageFromEntry:v10 observedEventName:v12];
  }
LABEL_13:
}

- (void)_notifyMessageTargets:(id)a3 withTargetIdentifier:(id)a4 didUpdatePriorityMessageFromEntry:(id)a5 observedEventName:(id)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v21 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v11 applicationMessage];
  int v14 = [v13 assetPrefetchStrategy];

  if (v11)
  {
    id v15 = +[IAMMessageCoordinator _createMessageFromMessageEntry:v11 replacingResourcePathsWithCachedResourceLocations:v14 != 2];
  }
  else
  {
    id v15 = 0;
  }
  objc_initWeak(&location, self);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v10;
  uint64_t v16 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v29;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8 * v18);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __120__IAMMessageCoordinator__notifyMessageTargets_withTargetIdentifier_didUpdatePriorityMessageFromEntry_observedEventName___block_invoke;
        block[3] = &unk_264342038;
        block[4] = v19;
        block[5] = self;
        id v23 = v15;
        id v24 = v11;
        id v25 = v21;
        id v26 = v12;
        objc_copyWeak(&v27, &location);
        dispatch_async(MEMORY[0x263EF83A0], block);
        objc_destroyWeak(&v27);

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v16);
  }

  objc_destroyWeak(&location);
}

- (void)setMetricsDelegate:(id)a3
{
}

void __73__IAMMessageCoordinator__fetchMessagesAndMetadataFromStorageCoordinator___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __73__IAMMessageCoordinator__fetchMessagesAndMetadataFromStorageCoordinator___block_invoke_5;
  v14[3] = &unk_264341F78;
  objc_copyWeak(&v19, (id *)(a1 + 56));
  id v15 = v9;
  id v16 = v7;
  id v17 = v8;
  long long v18 = *(_OWORD *)(a1 + 40);
  id v11 = v8;
  id v12 = v7;
  id v13 = v9;
  dispatch_async(v10, v14);

  objc_destroyWeak(&v19);
}

void __73__IAMMessageCoordinator__fetchMessagesAndMetadataFromStorageCoordinator___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    if (!*(void *)(a1 + 32))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(a1 + 40));
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(id *)(a1 + 48));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
    }
    (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) + 16))();
    id WeakRetained = v3;
  }
}

void __73__IAMMessageCoordinator__fetchMessagesAndMetadataFromStorageCoordinator___block_invoke_5(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    if (!*(void *)(a1 + 32))
    {
      objc_storeStrong(WeakRetained + 10, *(id *)(a1 + 40));
      objc_storeStrong(v3 + 11, *(id *)(a1 + 48));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
    (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) + 16))();
    id WeakRetained = v3;
  }
}

uint64_t __73__IAMMessageCoordinator__fetchMessagesAndMetadataFromStorageCoordinator___block_invoke(void *a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(a1[5] + 8);
  uint64_t v7 = *(void *)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  if (!v7)
  {
    if (v4)
    {
      objc_storeStrong(v6, a2);
      id v8 = *(uint64_t (**)(void))(a1[4] + 16);
LABEL_7:
      id v6 = (id *)v8();
      goto LABEL_8;
    }
    if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24) && *(unsigned char *)(*(void *)(a1[7] + 8) + 24))
    {
      id v8 = *(uint64_t (**)(void))(a1[4] + 16);
      goto LABEL_7;
    }
  }
LABEL_8:

  return MEMORY[0x270F9A828](v6);
}

void __113__IAMMessageCoordinator__startStorageCoordinatorWithMessageEntryProvider_messageMetadataStorage_propertyStorage___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v11 = IAMLogCategoryDefault();
    id v12 = v11;
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138543362;
        id v14 = v9;
        _os_log_impl(&dword_2188AF000, v12, OS_LOG_TYPE_ERROR, "Failed to start storage coordinator %{public}@.", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_2188AF000, v12, OS_LOG_TYPE_DEFAULT, "Storage coordinator started.", (uint8_t *)&v13, 2u);
      }

      *((unsigned char *)WeakRetained + 104) = 1;
      [WeakRetained _handleUpdatedMessageEntries:v7 andMetadata:v8];
      [*((id *)WeakRetained + 8) setDelegate:*(void *)(a1 + 32)];
    }
  }
}

- (void)_handleUpdatedMessageEntries:(id)a3 andMetadata:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v8)
    {
      uint64_t v10 = v8;
      id v11 = 0;
      uint64_t v12 = *(void *)v32;
      *(void *)&long long v9 = 138543618;
      long long v29 = v9;
      while (1)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v6);
          }
          id v14 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "applicationMessage", v29);
          uint64_t v15 = [v14 identifier];

          uint64_t v16 = [(IAMMessageCoordinator *)self _metadataEntryForMessageIdentifier:v15];
          id v17 = (void *)v16;
          if (!v7 || v16)
          {
            if (!v16) {
              goto LABEL_17;
            }
          }
          else
          {
            uint64_t v18 = [v7 objectForKeyedSubscript:v15];
            if (!v18) {
              goto LABEL_17;
            }
            id v17 = (void *)v18;
            id v19 = IAMLogCategoryDefault();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              [v17 allMetadataValues];
              long long v30 = v11;
              uint64_t v20 = v10;
              id v21 = v7;
              uint64_t v22 = v12;
              id v23 = self;
              id v25 = v24 = v6;
              *(_DWORD *)buf = v29;
              long long v36 = v25;
              __int16 v37 = 2114;
              long long v38 = v15;
              _os_log_impl(&dword_2188AF000, v19, OS_LOG_TYPE_DEFAULT, "Received new metadata entry = %{public}@ for message with identifier = %{public}@", buf, 0x16u);

              id v6 = v24;
              self = v23;
              uint64_t v12 = v22;
              id v7 = v21;
              uint64_t v10 = v20;
              id v11 = v30;
            }
          }
          if (!v11) {
            id v11 = objc_opt_new();
          }
          [v11 setObject:v17 forKeyedSubscript:v15];

LABEL_17:
        }
        uint64_t v10 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (!v10) {
          goto LABEL_21;
        }
      }
    }
  }
  id v11 = 0;
LABEL_21:
  id v26 = (NSDictionary *)[v11 copy];
  metadataEntryByMessageIdentifier = self->_metadataEntryByMessageIdentifier;
  self->_metadataEntryByMessageIdentifier = v26;

  long long v28 = (void *)[v6 copy];
  [(IAMMessageEntryManager *)self->_messageEntryManager setMessageEntries:v28];

  [(IAMMessageCoordinator *)self _evaluateMessagesForAllActiveTargets];
}

- (void)_evaluateMessagesForAllActiveTargets
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [(IAMMessageCoordinator *)self _dequeuePendingTriggerContexts];
  id v4 = [(NSMutableDictionary *)self->_messageTargetsByTargetIdentifier allKeys];
  [(IAMMessageCoordinator *)self _reevaluateTargetsWithIdentifiers:v4 forTriggerContext:0 shouldNotifyTargetsIfPriorityMessageNonNil:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(IAMMessageCoordinator *)self receiveTriggerEventContext:v10];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            -[IAMMessageCoordinator reportChangedContextPropertiesContext:](self, "reportChangedContextPropertiesContext:", v10, (void)v11);
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)_dequeuePendingTriggerContexts
{
  id v3 = (void *)[(NSMutableArray *)self->_pendingTriggerContexts copy];
  id v4 = (NSMutableArray *)objc_opt_new();
  pendingTriggerContexts = self->_pendingTriggerContexts;
  self->_pendingTriggerContexts = v4;

  return v3;
}

- (void)startWithApplicationContext:(id)a3 messageGroups:(id)a4 messageEntryProvider:(id)a5 messageMetadataStorage:(id)a6 propertyStorage:(id)a7
{
  id v12 = a4;
  long long v13 = IAMLogCategoryDefault();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188AF000, v13, OS_LOG_TYPE_DEFAULT, "Coordinator started", buf, 2u);
  }

  accessQueue = self->_accessQueue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __127__IAMMessageCoordinator_startWithApplicationContext_messageGroups_messageEntryProvider_messageMetadataStorage_propertyStorage___block_invoke;
  v16[3] = &unk_264341CF8;
  v16[4] = self;
  id v17 = v12;
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v15 = v12;
  dispatch_async(accessQueue, v16);
}

void __73__IAMMessageCoordinator__fetchMessagesAndMetadataFromStorageCoordinator___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __73__IAMMessageCoordinator__fetchMessagesAndMetadataFromStorageCoordinator___block_invoke_3;
  v14[3] = &unk_264341F28;
  objc_copyWeak(&v20, (id *)(a1 + 72));
  long long v18 = *(_OWORD *)(a1 + 40);
  id v15 = v9;
  id v16 = v7;
  id v17 = v8;
  long long v19 = *(_OWORD *)(a1 + 56);
  id v11 = v8;
  id v12 = v7;
  id v13 = v9;
  dispatch_async(v10, v14);

  objc_destroyWeak(&v20);
}

void __120__IAMMessageCoordinator__notifyMessageTargets_withTargetIdentifier_didUpdatePriorityMessageFromEntry_observedEventName___block_invoke(uint64_t a1)
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v3 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 64);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __120__IAMMessageCoordinator__notifyMessageTargets_withTargetIdentifier_didUpdatePriorityMessageFromEntry_observedEventName___block_invoke_2;
    v12[3] = &unk_264342010;
    id v13 = *(id *)(a1 + 72);
    objc_copyWeak(&v15, (id *)(a1 + 80));
    id v14 = *(id *)(a1 + 48);
    [v4 messageCoordinator:v5 didUpdatePriorityMessage:v6 fromMessageEntry:v7 forTarget:v8 withCompletion:v12];

    objc_destroyWeak(&v15);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 64);
    [v3 messageCoordinator:v9 didUpdatePriorityMessage:v10 forTarget:v11];
  }
}

void __120__IAMMessageCoordinator__notifyMessageTargets_withTargetIdentifier_didUpdatePriorityMessageFromEntry_observedEventName___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      id v7 = WeakRetained;
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = [*(id *)(a1 + 40) identifier];
      [v7 _processObservedEventCallbacksforEventName:v5 willTriggerPresentation:a2 messageIdentifier:v6];

      id WeakRetained = v7;
    }
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _allCoordinators = objc_opt_new();
    MEMORY[0x270F9A758]();
  }
}

- (void)dealloc
{
  [(id)_allCoordinators removeObject:self];
  [(IAMMessageCoordinator *)self unregisterMessageTarget:self->_modalTarget];
  v3.receiver = self;
  v3.super_class = (Class)IAMMessageCoordinator;
  [(IAMMessageCoordinator *)&v3 dealloc];
}

- (void)start
{
}

- (void)startWithApplicationContext:(id)a3
{
}

- (void)unregisterMessageTarget:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 targetIdentifier];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__IAMMessageCoordinator_unregisterMessageTarget___block_invoke;
  block[3] = &unk_264341D48;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(accessQueue, block);
}

void __49__IAMMessageCoordinator_unregisterMessageTarget___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]];
  if (v2)
  {
    id v5 = v2;
    if ([v2 containsObject:a1[6]]) {
      [v5 removeObject:a1[6]];
    }
    if (![v5 count]) {
      [*(id *)(a1[4] + 24) setObject:0 forKeyedSubscript:a1[5]];
    }
    objc_super v3 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
    id v4 = v3;
    if (v3)
    {
      if ([v3 containsObject:a1[6]]) {
        [v4 removeObject:a1[6]];
      }
      if (![v4 count]) {
        [*(id *)(a1[4] + 32) setObject:0 forKeyedSubscript:a1[5]];
      }
    }

    uint64_t v2 = v5;
  }
}

- (void)reportMessageDidAppearWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF910]);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__IAMMessageCoordinator_reportMessageDidAppearWithIdentifier___block_invoke;
  block[3] = &unk_264341D48;
  block[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(accessQueue, block);
}

void __62__IAMMessageCoordinator_reportMessageDidAppearWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 96) priorityMessageEntryForIdentifier:*(void *)(a1 + 40)];
  if (v2)
  {
    [*(id *)(a1 + 32) _updateLastDisplayTime:*(void *)(a1 + 48) forMessageEntry:v2];
  }
  else
  {
    objc_super v3 = IAMLogCategoryDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 138543362;
      uint64_t v6 = v4;
      _os_log_impl(&dword_2188AF000, v3, OS_LOG_TYPE_ERROR, "No message entry with identifier = %{public}@ couldn't report message appearance.", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)reportMessageDidAppearWithIdentifier:(id)a3 fromTargetWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF910]);
  accessQueue = self->_accessQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __87__IAMMessageCoordinator_reportMessageDidAppearWithIdentifier_fromTargetWithIdentifier___block_invoke;
  v13[3] = &unk_264341D98;
  v13[4] = self;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  dispatch_async(accessQueue, v13);
}

void __87__IAMMessageCoordinator_reportMessageDidAppearWithIdentifier_fromTargetWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 96) priorityMessageEntryForIdentifier:*(void *)(a1 + 40)];
  if (!v2)
  {
    id v6 = IAMLogCategoryDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v7;
      _os_log_impl(&dword_2188AF000, v6, OS_LOG_TYPE_ERROR, "No message entry with identifier = %{public}@ couldn't report message appearance.", buf, 0xCu);
    }
    goto LABEL_8;
  }
  [*(id *)(a1 + 32) _updateLastDisplayTime:*(void *)(a1 + 48) forMessageEntry:v2];
  [*(id *)(*(void *)(a1 + 32) + 48) messageEntry:v2 didAppearFromTargetWithIdentifier:*(void *)(a1 + 56) atTime:*(void *)(a1 + 48)];
  objc_super v3 = [v2 applicationMessage];
  int v4 = [v3 hasLocalNotification];

  if (v4) {
    [*(id *)(a1 + 32) _removeUserNotificationRemovalForMessageWithIdentifier:*(void *)(a1 + 40)];
  }
  if ([v2 isBadgingApplication])
  {
    int v5 = *(void **)(*(void *)(a1 + 32) + 64);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __87__IAMMessageCoordinator_reportMessageDidAppearWithIdentifier_fromTargetWithIdentifier___block_invoke_19;
    v8[3] = &unk_264341D70;
    uint64_t v9 = v2;
    id v10 = *(id *)(a1 + 40);
    [v5 removeApplicationBadgeFromMessageEntry:v9 completion:v8];

    id v6 = v9;
LABEL_8:
  }
}

void __87__IAMMessageCoordinator_reportMessageDidAppearWithIdentifier_fromTargetWithIdentifier___block_invoke_19(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a2)
  {
    objc_super v3 = IAMLogCategoryDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = [*(id *)(a1 + 32) bundleIdentifier];
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 138543618;
      uint64_t v7 = v4;
      __int16 v8 = 2114;
      uint64_t v9 = v5;
      _os_log_impl(&dword_2188AF000, v3, OS_LOG_TYPE_ERROR, "Error removing application badge for bundleId = %{public}@ from message with identifier = %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)reportMessageDidDisappearWithIdentifier:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__IAMMessageCoordinator_reportMessageDidDisappearWithIdentifier___block_invoke;
  v7[3] = &unk_264341DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __65__IAMMessageCoordinator_reportMessageDidDisappearWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 96) priorityMessageEntryForIdentifier:*(void *)(a1 + 40)];
  if (v2)
  {
    [*(id *)(a1 + 32) _incrementNumberOfDisplaysForMessageEntry:v2];
  }
  else
  {
    objc_super v3 = IAMLogCategoryDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 138543362;
      uint64_t v6 = v4;
      _os_log_impl(&dword_2188AF000, v3, OS_LOG_TYPE_ERROR, "No message entry with identifier = %{public}@ couldn't report message disappearance.", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)reportMessageDidDisappearWithIdentifier:(id)a3 fromTargetWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF910]);
  accessQueue = self->_accessQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __90__IAMMessageCoordinator_reportMessageDidDisappearWithIdentifier_fromTargetWithIdentifier___block_invoke;
  v13[3] = &unk_264341D98;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v16 = v8;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(accessQueue, v13);
}

uint64_t __90__IAMMessageCoordinator_reportMessageDidDisappearWithIdentifier_fromTargetWithIdentifier___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 48) messageWithIdentifier:a1[5] didDisappearFromTargetWithIdentifier:a1[6] atTime:a1[7]];
}

- (void)reportMessageWithIdentifier:(id)a3 actionWasPerformedWithIdentifier:(id)a4
{
}

- (void)reportMessageWithIdentifier:(id)a3 actionWasPerformedWithIdentifier:(id)a4 fromTargetWithIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __111__IAMMessageCoordinator_reportMessageWithIdentifier_actionWasPerformedWithIdentifier_fromTargetWithIdentifier___block_invoke;
  v15[3] = &unk_264341D98;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

void __111__IAMMessageCoordinator_reportMessageWithIdentifier_actionWasPerformedWithIdentifier_fromTargetWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 96) priorityMessageEntryForIdentifier:*(void *)(a1 + 40)];
  objc_super v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 applicationMessage];
    int v5 = [v4 contentPages];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v6 = v5;
    uint64_t v25 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v25)
    {
      uint64_t v7 = *(void *)v31;
      uint64_t v23 = *(void *)v31;
      id v24 = v3;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v31 != v7) {
            objc_enumerationMutation(v6);
          }
          id v9 = [*(id *)(*((void *)&v30 + 1) + 8 * i) messageActions];
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v10 = v9;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v27;
            while (2)
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v27 != v13) {
                  objc_enumerationMutation(v10);
                }
                id v15 = *(void **)(*((void *)&v26 + 1) + 8 * j);
                id v16 = [v15 identifier];
                int v17 = [v16 isEqualToString:*(void *)(a1 + 48)];

                if (v17)
                {
                  objc_super v3 = v24;
                  [*(id *)(a1 + 32) _reportMessageAction:v15 wasPerformedInMessageEntry:v24 fromTargetWithIdentifier:*(void *)(a1 + 56)];

                  id v18 = v6;
                  goto LABEL_20;
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }

          uint64_t v7 = v23;
        }
        objc_super v3 = v24;
        uint64_t v25 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v25);
    }

    id v18 = IAMLogCategoryDefault();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      uint64_t v19 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      uint64_t v37 = v19;
      __int16 v38 = 2114;
      uint64_t v39 = v20;
      _os_log_impl(&dword_2188AF000, v18, OS_LOG_TYPE_ERROR, "No action with identifier = %{public}@ for message with identifier = %{public}@, couldn't report action performance.", buf, 0x16u);
    }
LABEL_20:
  }
  else
  {
    id v6 = IAMLogCategoryDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = *(void *)(a1 + 40);
      uint64_t v22 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      uint64_t v37 = v21;
      __int16 v38 = 2114;
      uint64_t v39 = v22;
      _os_log_impl(&dword_2188AF000, v6, OS_LOG_TYPE_ERROR, "No message entry with identifier = %{public}@, couldn't report performance of action with identifier = %{public}@.", buf, 0x16u);
    }
  }
}

- (id)beginObservingTriggerEvent:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F08C38] UUID];
  accessQueue = self->_accessQueue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __64__IAMMessageCoordinator_beginObservingTriggerEvent_withHandler___block_invoke;
  v16[3] = &unk_264341DE8;
  v16[4] = self;
  id v17 = v6;
  id v19 = v7;
  id v10 = v8;
  id v18 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(accessQueue, v16);
  uint64_t v13 = v18;
  id v14 = v10;

  return v14;
}

void __64__IAMMessageCoordinator_beginObservingTriggerEvent_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 136);
  objc_super v3 = [*(id *)(a1 + 40) name];
  id v8 = [v2 objectForKeyedSubscript:v3];

  if (!v8)
  {
    id v8 = (id)objc_opt_new();
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 136);
    int v5 = [*(id *)(a1 + 40) name];
    [v4 setObject:v8 forKeyedSubscript:v5];
  }
  id v6 = (void *)[*(id *)(a1 + 56) copy];
  id v7 = (void *)MEMORY[0x21D475810]();
  [v8 setObject:v7 forKey:*(void *)(a1 + 48)];
}

- (void)endObservingTriggerEvent:(id)a3 forToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__IAMMessageCoordinator_endObservingTriggerEvent_forToken___block_invoke;
  block[3] = &unk_264341D48;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

void __59__IAMMessageCoordinator_endObservingTriggerEvent_forToken___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 136);
  objc_super v3 = [*(id *)(a1 + 40) name];
  id v8 = [v2 objectForKeyedSubscript:v3];

  uint64_t v4 = [v8 objectForKey:*(void *)(a1 + 48)];

  if (v4) {
    [v8 removeObjectForKey:*(void *)(a1 + 48)];
  }
  if (![v8 count])
  {
    int v5 = *(void **)(a1 + 40);
    id v6 = *(void **)(*(void *)(a1 + 32) + 136);
    id v7 = [v5 name];
    [v6 setObject:0 forKeyedSubscript:v7];
  }
}

- (void)triggerPresentationForMessageWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__IAMMessageCoordinator_triggerPresentationForMessageWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_264341E60;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

void __87__IAMMessageCoordinator_triggerPresentationForMessageWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 96) messageEntryForIdentifier:*(void *)(a1 + 40)];
  objc_super v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 applicationMessage];
    BOOL v5 = [v4 assetPrefetchStrategy] != 2;

    id v6 = +[IAMMessageCoordinator _createMessageFromMessageEntry:v3 replacingResourcePathsWithCachedResourceLocations:v5];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __87__IAMMessageCoordinator_triggerPresentationForMessageWithIdentifier_completionHandler___block_invoke_23;
    v10[3] = &unk_264341E38;
    v10[4] = *(void *)(a1 + 32);
    id v11 = v6;
    id v12 = v3;
    id v13 = *(id *)(a1 + 48);
    id v7 = v6;
    dispatch_async(MEMORY[0x263EF83A0], v10);
  }
  else
  {
    id v8 = IAMLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v9;
      _os_log_impl(&dword_2188AF000, v8, OS_LOG_TYPE_ERROR, "No message entry with identifier = %{public}@ couldn't force trigger presentation.", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __87__IAMMessageCoordinator_triggerPresentationForMessageWithIdentifier_completionHandler___block_invoke_23(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(v2 + 112);
  BOOL v5 = *(void **)(v2 + 120);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __87__IAMMessageCoordinator_triggerPresentationForMessageWithIdentifier_completionHandler___block_invoke_2;
  v7[3] = &unk_264341E10;
  objc_copyWeak(&v9, &location);
  id v8 = *(id *)(a1 + 56);
  [v5 messageCoordinator:v2 didUpdatePriorityMessage:v3 fromMessageEntry:v4 forTarget:v6 withCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __87__IAMMessageCoordinator_triggerPresentationForMessageWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

- (void)reportMetricsEvent:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __44__IAMMessageCoordinator_reportMetricsEvent___block_invoke;
  v6[3] = &unk_264341DC0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __44__IAMMessageCoordinator_reportMetricsEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) metricsDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) metricsDelegate];
    [v4 messageDidReportMetricsEvent:*(void *)(a1 + 32) eventProperties:*(void *)(a1 + 40)];
  }
}

- (void)storageCoordinatorMessageEntriesChanged:(id)a3
{
  id v4 = a3;
  id v5 = IAMLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2188AF000, v5, OS_LOG_TYPE_DEFAULT, "Storage coordinator message entries changed.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  storageCoordinator = self->_storageCoordinator;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__IAMMessageCoordinator_storageCoordinatorMessageEntriesChanged___block_invoke;
  v7[3] = &unk_264341EB0;
  void v7[4] = self;
  objc_copyWeak(&v8, buf);
  [(IAMStorageCoordinator *)storageCoordinator fetchMessagesEntriesAndMetadata:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);
}

void __65__IAMMessageCoordinator_storageCoordinatorMessageEntriesChanged___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__IAMMessageCoordinator_storageCoordinatorMessageEntriesChanged___block_invoke_2;
  v14[3] = &unk_264341E88;
  objc_copyWeak(&v18, (id *)(a1 + 40));
  id v15 = v9;
  id v16 = v7;
  id v17 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v9;
  dispatch_async(v10, v14);

  objc_destroyWeak(&v18);
}

void __65__IAMMessageCoordinator_storageCoordinatorMessageEntriesChanged___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  char v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      id v4 = IAMLogCategoryDefault();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        int v8 = 138543362;
        uint64_t v9 = v5;
        _os_log_impl(&dword_2188AF000, v4, OS_LOG_TYPE_ERROR, "Error fetching messages and metadata %{public}@.", (uint8_t *)&v8, 0xCu);
      }

      id WeakRetained = v3;
      uint64_t v6 = 0;
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
    }
    [WeakRetained _handleUpdatedMessageEntries:v6 andMetadata:v7];
  }
}

- (void)impressionManager:(id)a3 shouldReportImpressionEventWithDictionary:(id)a4
{
}

- (void)impressionManager:(id)a3 impressionDidEndForMessageEntry:(id)a4
{
  id v5 = a4;
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__IAMMessageCoordinator_impressionManager_impressionDidEndForMessageEntry___block_invoke;
  v8[3] = &unk_264341DC0;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(accessQueue, v8);
}

uint64_t __75__IAMMessageCoordinator_impressionManager_impressionDidEndForMessageEntry___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _incrementNumberOfDisplaysForMessageEntry:*(void *)(a1 + 40)];
}

- (void)_reportHoldoutMessageWouldAppear:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFF910];
  id v5 = a3;
  id v9 = objc_alloc_init(v4);
  uint64_t v6 = [v5 applicationMessage];
  id v7 = [v6 holdoutEvent];
  int v8 = [v7 reportableDictionary];
  [(IAMMessageCoordinator *)self reportMetricsEvent:v8];

  [(IAMMessageCoordinator *)self _incrementNumberOfDisplaysForMessageEntry:v5];
  [(IAMMessageCoordinator *)self _updateLastDisplayTime:v9 forMessageEntry:v5];
}

- (void)_updateLastDisplayTime:(id)a3 forMessageEntry:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  int v8 = [v7 applicationMessage];
  int v9 = [v8 hasGlobalPresentationPolicyGroup];

  if (v9)
  {
    uint64_t v10 = [v7 applicationMessage];
    int v11 = [v10 globalPresentationPolicyGroup];

    if (v11 == 1)
    {
      objc_storeStrong((id *)&self->_lastDisplayTimeGlobalPresentationPolicyGroupRestricted, a3);
      [(IAMStorageCoordinator *)self->_storageCoordinator updateLastDisplayTimeGlobalPresentationPolicyGroupRestricted:v12];
    }
    else if (!v11)
    {
      objc_storeStrong((id *)&self->_lastDisplayTimeGlobalPresentationPolicyGroupNormal, a3);
      [(IAMStorageCoordinator *)self->_storageCoordinator updateLastDisplayTimeGlobalPresentationPolicyGroupNormal:v12];
    }
  }
}

- (id)_metadataEntryForMessageIdentifier:(id)a3
{
  metadataEntryByMessageIdentifier = self->_metadataEntryByMessageIdentifier;
  if (metadataEntryByMessageIdentifier)
  {
    metadataEntryByMessageIdentifier = [metadataEntryByMessageIdentifier objectForKeyedSubscript:a3];
  }

  return metadataEntryByMessageIdentifier;
}

BOOL __136__IAMMessageCoordinator__reevaluateMessageEntries_forTargetIdentifier_shouldNotifyTargetsIfPriorityMessageNonNil_withObservedEventName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 applicationMessage];
  uint64_t v6 = [v5 identifier];
  id v7 = [v4 _metadataEntryForMessageIdentifier:v6];

  int v8 = [v3 applicationMessage];
  LODWORD(v6) = [v8 hasMaximumDisplays];

  if (v6)
  {
    int v9 = [v3 applicationMessage];
    int v10 = [v9 maximumDisplays];

    if (v10 == -1)
    {
      BOOL v13 = 1;
    }
    else
    {
      unint64_t v11 = [v7 numberOfDisplays];
      id v12 = [v3 applicationMessage];
      BOOL v13 = v11 < (int)[v12 maximumDisplays];
    }
  }
  else
  {
    BOOL v13 = [v7 numberOfDisplays] == 0;
  }

  return v13;
}

uint64_t __136__IAMMessageCoordinator__reevaluateMessageEntries_forTargetIdentifier_shouldNotifyTargetsIfPriorityMessageNonNil_withObservedEventName___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "comparePriorityWithMessageEntry:");
}

- (void)_processObservedEventCallbacksforEventName:(id)a3 willTriggerPresentation:(BOOL)a4 messageIdentifier:(id)a5
{
  BOOL v5 = a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a5;
  if (a3)
  {
    int v9 = [(NSMutableDictionary *)self->_completionHandlersForObservedEvents objectForKeyedSubscript:a3];
    int v10 = v9;
    if (v9)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v18;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = [v10 objectForKey:*(void *)(*((void *)&v17 + 1) + 8 * v14)];
            id v16 = (void *)v15;
            if (v15) {
              (*(void (**)(uint64_t, BOOL, id, void))(v15 + 16))(v15, v5, v8, 0);
            }

            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v12);
      }
    }
  }
}

+ (id)_createMessageFromMessageEntry:(id)a3 replacingResourcePathsWithCachedResourceLocations:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v4
    || ![v5 shouldDownloadResources]
    || ([v6 didCacheRequiredResources] & 1) == 0)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F4B610]) initWithICInAppMessageEntry:v6];
    goto LABEL_8;
  }
  id v7 = [v6 applicationMessage];
  if ([v7 messageType] == 1 && objc_msgSend(v7, "hasWebArchiveURL"))
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F4B610]) initWithICInAppMessageEntry:v6];
    goto LABEL_47;
  }
  id v10 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v11 = [v7 contentPages];
  v52 = objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  v47 = v7;
  id obj = [v7 contentPages];
  uint64_t v53 = [obj countByEnumeratingWithState:&v64 objects:v70 count:16];
  if (!v53) {
    goto LABEL_46;
  }
  uint64_t v51 = *(void *)v65;
  v54 = v6;
  do
  {
    for (uint64_t i = 0; i != v53; ++i)
    {
      if (*(void *)v65 != v51) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void **)(*((void *)&v64 + 1) + 8 * i);
      if ([v13 imagesCount]
        && (v55 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v13, "imagesCount"))) != 0)
      {
        v49 = v13;
        uint64_t v50 = i;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        uint64_t v14 = [v13 images];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v60 objects:v69 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v61;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v61 != v17) {
                objc_enumerationMutation(v14);
              }
              long long v19 = *(void **)(*((void *)&v60 + 1) + 8 * j);
              if ([v19 hasIdentifier] && objc_msgSend(v19, "hasURL"))
              {
                long long v20 = [v19 identifier];
                uint64_t v21 = [v6 cachedLocationForResourceWithIdentifier:v20];

                if (v21)
                {
                  id v22 = objc_alloc(MEMORY[0x263F4B600]);
                  uint64_t v23 = [v19 identifier];
                  id v24 = [NSURL fileURLWithPath:v21 isDirectory:0];
                  uint64_t v25 = objc_msgSend(v22, "initWithIdentifier:url:width:height:", v23, v24, objc_msgSend(v19, "width"), objc_msgSend(v19, "height"));
                  [v55 addObject:v25];

                  uint64_t v6 = v54;
                }
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v60 objects:v69 count:16];
          }
          while (v16);
        }

        uint64_t v13 = v49;
        uint64_t i = v50;
      }
      else
      {
        v55 = 0;
      }
      long long v26 = [v13 messageActions];
      if ([v26 count])
      {
        id v27 = objc_alloc(MEMORY[0x263EFF980]);
        long long v28 = [v13 messageActions];
        long long v29 = objc_msgSend(v27, "initWithCapacity:", objc_msgSend(v28, "count"));

        if (!v29) {
          goto LABEL_44;
        }
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v26 = [v13 messageActions];
        uint64_t v30 = [v26 countByEnumeratingWithState:&v56 objects:v68 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = i;
          uint64_t v33 = *(void *)v57;
          do
          {
            for (uint64_t k = 0; k != v31; ++k)
            {
              if (*(void *)v57 != v33) {
                objc_enumerationMutation(v26);
              }
              uint64_t v35 = (void *)[objc_alloc(MEMORY[0x263F4B5E0]) initWithICAction:*(void *)(*((void *)&v56 + 1) + 8 * k)];
              [v29 addObject:v35];
            }
            uint64_t v31 = [v26 countByEnumeratingWithState:&v56 objects:v68 count:16];
          }
          while (v31);
          uint64_t i = v32;
        }
      }
      else
      {
        long long v29 = 0;
      }

LABEL_44:
      id v36 = objc_alloc(MEMORY[0x263F4B5E8]);
      uint64_t v37 = [v13 title];
      __int16 v38 = [v13 subtitle];
      uint64_t v39 = [v13 body];
      uint64_t v40 = [v13 contentParameters];
      long long v41 = objc_msgSend(v40, "iam_dictionaryFromArrayOfICIIAMParameters");
      long long v42 = [v13 identifier];
      long long v43 = (void *)[v36 initWithTitle:v37 subtitle:v38 body:v39 images:v55 actions:v29 contentParameters:v41 identifier:v42];

      [v52 addObject:v43];
      uint64_t v6 = v54;
    }
    uint64_t v53 = [obj countByEnumeratingWithState:&v64 objects:v70 count:16];
  }
  while (v53);
LABEL_46:

  id v44 = objc_alloc(MEMORY[0x263F4B610]);
  id v7 = v47;
  v45 = [v47 identifier];
  uint64_t v46 = [v6 bundleIdentifier];
  id v8 = objc_msgSend(v44, "initWithIdentifier:messageGroupIdentifier:contentPages:requiresCloseButton:", v45, v46, v52, objc_msgSend(v47, "hasCloseButton"));

LABEL_47:
LABEL_8:

  return v8;
}

- (void)_enqueuePendingTriggerContext:(id)a3
{
}

- (void)_updateMetadata:(id)a3 forMessageEntry:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [v10 applicationMessage];
  uint64_t v12 = [v11 identifier];

  uint64_t v13 = (void *)[(NSDictionary *)self->_metadataEntryByMessageIdentifier mutableCopy];
  if (!v13) {
    uint64_t v13 = objc_opt_new();
  }
  [v13 setObject:v8 forKeyedSubscript:v12];
  uint64_t v14 = (NSDictionary *)[v13 copy];
  metadataEntryByMessageIdentifier = self->_metadataEntryByMessageIdentifier;
  self->_metadataEntryByMessageIdentifier = v14;

  uint64_t v16 = IAMLogCategoryDefault();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [v8 allMetadataValues];
    int v18 = 138543618;
    long long v19 = v17;
    __int16 v20 = 2114;
    uint64_t v21 = v12;
    _os_log_impl(&dword_2188AF000, v16, OS_LOG_TYPE_DEFAULT, "Updating metadata = %{public}@ for message entry with identifier = %{public}@", (uint8_t *)&v18, 0x16u);
  }
  [(IAMStorageCoordinator *)self->_storageCoordinator updateMetadata:v8 forMessageEntry:v10 completion:v9];
}

- (void)_reportMessageAction:(id)a3 wasPerformedInMessageEntry:(id)a4 fromTargetWithIdentifier:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 applicationMessage];
  uint64_t v12 = [v11 identifier];
  uint64_t v13 = [v8 identifier];
  uint64_t v14 = IAMLogCategoryDefault();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138543618;
    uint64_t v21 = v13;
    __int16 v22 = 2114;
    uint64_t v23 = v12;
    _os_log_impl(&dword_2188AF000, v14, OS_LOG_TYPE_DEFAULT, "Action with identifier = %{public}@ performed in message with identifier = %{public}@", (uint8_t *)&v20, 0x16u);
  }

  if ([v8 hasClickEvent])
  {
    uint64_t v15 = [v9 applicationMessage];
    uint64_t v16 = [v15 identifier];

    uint64_t v17 = [v8 clickEvent];
    int v18 = [v17 reportableDictionaryForClickEventWithMessageIdentifier:v16 andTargetIdentifier:v10];

    [(IAMMessageCoordinator *)self reportMetricsEvent:v18];
  }
  if ([v8 hasMessageRemovalPolicy])
  {
    int v19 = [v8 messageRemovalPolicy];
    if (v19 == 2)
    {
      [(IAMStorageCoordinator *)self->_storageCoordinator removeMessageEntry:v9 completion:0];
      if ([v11 reportingEnabled]) {
        [(IAMStorageCoordinator *)self->_storageCoordinator reportEventForMessageIdentifier:v12 withParams:MEMORY[0x263EFFA78] completion:0];
      }
    }
    else if (v19 == 1)
    {
      [(IAMStorageCoordinator *)self->_storageCoordinator removeMessageEntry:v9 completion:0];
    }
  }
}

- (void)_handleMessageReachedMaximumDisplayCount:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = IAMLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_2188AF000, v5, OS_LOG_TYPE_DEFAULT, "Reporting message with identifier = %{public}@ reached maximum display count.", (uint8_t *)&v6, 0xCu);
  }

  [(IAMStorageCoordinator *)self->_storageCoordinator reportEventForMessageIdentifier:v4 withParams:MEMORY[0x263EFFA78] completion:0];
}

- (void)_incrementNumberOfDisplaysForMessageEntry:(id)a3
{
  id v16 = a3;
  id v4 = [v16 applicationMessage];
  id v5 = [v4 identifier];
  int v6 = [(IAMMessageCoordinator *)self _metadataEntryForMessageIdentifier:v5];
  id v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  id v9 = v8;

  objc_msgSend(v9, "setNumberOfDisplays:", objc_msgSend(v9, "numberOfDisplays") + 1);
  [(IAMMessageCoordinator *)self _updateMetadata:v9 forMessageEntry:v16 completion:0];
  unint64_t v10 = [v9 numberOfDisplays];
  if ([v4 hasMaximumDisplays]) {
    unint64_t v11 = (int)[v4 maximumDisplays];
  }
  else {
    unint64_t v11 = 1;
  }
  if (v10 >= v11)
  {
    if ([v4 reportingEnabled]) {
      [(IAMMessageCoordinator *)self _handleMessageReachedMaximumDisplayCount:v5];
    }
    uint64_t v12 = [v16 applicationMessage];
    uint64_t v13 = [v12 targets];
    uint64_t v14 = (void *)[v13 copy];
    uint64_t v15 = [(IAMMessageCoordinator *)self _filterActiveTargetIdentifiers:v14];

    [(IAMMessageCoordinator *)self _reevaluateTargetsWithIdentifiers:v15 forTriggerContext:0 shouldNotifyTargetsIfPriorityMessageNonNil:0];
  }
}

- (void)_removeUserNotificationRemovalForMessageWithIdentifier:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(IAMMessageCoordinator *)self _metadataEntryForMessageIdentifier:v4];
  if (([v5 didCancelUserNotification] & 1) == 0)
  {
    id v6 = objc_alloc(MEMORY[0x263F1DFB0]);
    id v7 = [MEMORY[0x263F086E0] mainBundle];
    id v8 = [v7 bundleIdentifier];
    id v9 = (void *)[v6 initWithBundleIdentifier:v8];

    unint64_t v10 = [NSString stringWithFormat:@"%@%@", @"ams_", v4];
    v14[0] = v10;
    unint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    [v9 removePendingNotificationRequestsWithIdentifiers:v11];

    uint64_t v13 = v10;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
    [v9 removeDeliveredNotificationsWithIdentifiers:v12];

    if (v5) {
      [v5 setDidCancelUserNotification:1];
    }
  }
}

- (IAMMessageMetricsDelegate)metricsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metricsDelegate);

  return (IAMMessageMetricsDelegate *)WeakRetained;
}

- (IAMApplicationContextProvider)applicationContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationContext);

  return (IAMApplicationContextProvider *)WeakRetained;
}

- (void)setApplicationContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_metricsDelegate);
  objc_storeStrong((id *)&self->_completionHandlersForObservedEvents, 0);
  objc_storeStrong((id *)&self->_messageGroupsByGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_modalTarget, 0);
  objc_storeStrong((id *)&self->_modalTargetIdentifier, 0);
  objc_storeStrong((id *)&self->_messageEntryManager, 0);
  objc_storeStrong((id *)&self->_lastDisplayTimeGlobalPresentationPolicyGroupRestricted, 0);
  objc_storeStrong((id *)&self->_lastDisplayTimeGlobalPresentationPolicyGroupNormal, 0);
  objc_storeStrong((id *)&self->_metadataEntryByMessageIdentifier, 0);
  objc_storeStrong((id *)&self->_storageCoordinator, 0);
  objc_storeStrong((id *)&self->_pendingTriggerContexts, 0);
  objc_storeStrong((id *)&self->_impressionManager, 0);
  objc_storeStrong((id *)&self->_priorityMessageEntryByTargetIdentifier, 0);
  objc_storeStrong((id *)&self->_messageTargetsRequiringNilPriorityMessageNotificationAfterRegistrationByTargetIdentifier, 0);
  objc_storeStrong((id *)&self->_messageTargetsByTargetIdentifier, 0);
  objc_destroyWeak((id *)&self->_applicationContext);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end