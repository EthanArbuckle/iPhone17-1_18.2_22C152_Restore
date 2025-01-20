@interface DNDLifetimeDetailsProvider
- (DNDLifetimeDetailsProvider)init;
- (DNDLifetimeDetailsProviderDelegate)delegate;
- (NSArray)availableLifetimeDetails;
- (id)_eventStoreQueue_eventForCalendarEventLifetime:(id)a3;
- (id)_lifetimeDetailsUntilEveningOrMorningForDate:(id)a3;
- (id)_nextRefreshTimerFireDate;
- (id)lifetimeDetailsForAssertionDetails:(id)a3 error:(id *)a4;
- (id)lifetimeForLifetimeDetails:(id)a3 error:(id *)a4;
- (void)_eventStoreQueue_requestRelevantEvent;
- (void)_queue_gotPlaceInferences:(id)a3;
- (void)_queue_rebuildAvailableLifetimeDetails;
- (void)_queue_requestLifetimeDetails;
- (void)_queue_resetLifetimeDetails;
- (void)_queue_scheduleRefreshTimerIfNeeded;
- (void)_requestRelevantLocationMetadata;
- (void)_scheduleRefreshTimerIfNeeded;
- (void)_systemTimeChanged;
- (void)dealloc;
- (void)lifetimeDetailsWithMetadataForAssertionDetails:(id)a3 completionHandler:(id)a4;
- (void)requestLifetimeDetails;
- (void)resetLifetimeDetails;
- (void)setDelegate:(id)a3;
- (void)startUpdatingLifetimeDetails;
- (void)stopUpdatingLifetimeDetails;
@end

@implementation DNDLifetimeDetailsProvider

- (DNDLifetimeDetailsProvider)init
{
  v23.receiver = self;
  v23.super_class = (Class)DNDLifetimeDetailsProvider;
  v2 = [(DNDLifetimeDetailsProvider *)&v23 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.donotdisturb.kit.LifetimeDetailsProvider", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.donotdisturb.kit.LifetimeDetailsProvider.event-store", v6);
    eventStoreQueue = v2->_eventStoreQueue;
    v2->_eventStoreQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.donotdisturb.kit.LifetimeDetailsProvider.call-out", v9);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v10;

    v12 = v2->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__DNDLifetimeDetailsProvider_init__block_invoke;
    block[3] = &unk_2644AF2B8;
    v13 = v2;
    v22 = v13;
    dispatch_sync(v12, block);
    uint64_t v14 = [objc_alloc(MEMORY[0x263F04B98]) initWithEKOptions:128];
    eventStore = v13->_eventStore;
    v13->_eventStore = (EKEventStore *)v14;

    [(EKEventStore *)v13->_eventStore requestFullAccessToEventsWithCompletion:&__block_literal_global_3];
    uint64_t v16 = [objc_alloc(MEMORY[0x263F04B68]) initWithEventStore:v13->_eventStore visibilityChangedCallback:&__block_literal_global_10 queue:v2->_queue];
    calendarVisibilityManager = v13->_calendarVisibilityManager;
    v13->_calendarVisibilityManager = (EKCalendarVisibilityManager *)v16;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v13, (CFNotificationCallback)DNDHandleSignificantTimeChange, @"SignificantTimeChangeNotification", 0, CFNotificationSuspensionBehaviorCoalesce);
    v19 = [MEMORY[0x263F08A00] defaultCenter];
    [v19 addObserver:v13 selector:sel__systemTimeChanged name:*MEMORY[0x263EFF5C8] object:0];
  }
  return v2;
}

void __34__DNDLifetimeDetailsProvider_init__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F00A60]);
  objc_msgSend(MEMORY[0x263F086E0], "dnd_locationBundle");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [v7 bundlePath];
  uint64_t v4 = [v2 initWithEffectiveBundlePath:v3 delegate:*(void *)(a1 + 32) onQueue:*(void *)(*(void *)(a1 + 32) + 8)];
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v4;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SignificantTimeChangeNotification", 0);
  uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263EFF5C8] object:0];

  [(NSTimer *)self->_refreshTimer invalidate];
  refreshTimer = self->_refreshTimer;
  self->_refreshTimer = 0;

  v6.receiver = self;
  v6.super_class = (Class)DNDLifetimeDetailsProvider;
  [(DNDLifetimeDetailsProvider *)&v6 dealloc];
}

- (void)requestLifetimeDetails
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__DNDLifetimeDetailsProvider_requestLifetimeDetails__block_invoke;
  block[3] = &unk_2644AF2B8;
  void block[4] = self;
  dispatch_async(queue, block);
  objc_initWeak(&location, self);
  eventStoreQueue = self->_eventStoreQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__DNDLifetimeDetailsProvider_requestLifetimeDetails__block_invoke_2;
  v5[3] = &unk_2644AF428;
  objc_copyWeak(&v6, &location);
  dispatch_async(eventStoreQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __52__DNDLifetimeDetailsProvider_requestLifetimeDetails__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_requestLifetimeDetails");
}

void __52__DNDLifetimeDetailsProvider_requestLifetimeDetails__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_eventStoreQueue_requestRelevantEvent");
    id WeakRetained = v2;
  }
}

- (void)resetLifetimeDetails
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__DNDLifetimeDetailsProvider_resetLifetimeDetails__block_invoke;
  block[3] = &unk_2644AF2B8;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __50__DNDLifetimeDetailsProvider_resetLifetimeDetails__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_requestLifetimeDetails");
}

- (void)startUpdatingLifetimeDetails
{
  if (!self->_monitoringLifetimes)
  {
    self->_monitoringLifetimes = 1;
    [(DNDLifetimeDetailsProvider *)self requestLifetimeDetails];
    [(DNDLifetimeDetailsProvider *)self _scheduleRefreshTimerIfNeeded];
  }
}

- (void)stopUpdatingLifetimeDetails
{
  if (self->_monitoringLifetimes)
  {
    self->_monitoringLifetimes = 0;
    [(NSTimer *)self->_refreshTimer invalidate];
  }
}

- (id)lifetimeForLifetimeDetails:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v22 = 0;
  objc_super v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  id v6 = [v5 identifier];
  if ([v6 isEqualToString:@"com.apple.donotdisturb.kit.lifetime.one-hour"])
  {
    uint64_t v7 = [MEMORY[0x263F3A6E8] lifetimeWithDuration:3600.0];
LABEL_3:
    v8 = (void *)v23[5];
    v23[5] = v7;

    goto LABEL_15;
  }
  if (([v6 isEqualToString:@"com.apple.donotdisturb.kit.lifetime.evening"] & 1) != 0
    || [v6 isEqualToString:@"com.apple.donotdisturb.kit.lifetime.morning"])
  {
    v9 = [MEMORY[0x263EFF8F0] currentCalendar];
    dispatch_queue_t v10 = [MEMORY[0x263EFF910] date];
    uint64_t v21 = 0;
    [v9 getHour:&v21 minute:0 second:0 nanosecond:0 fromDate:v10];
    if (v21 >= 4)
    {
      if ((unint64_t)v21 > 0x11)
      {
        v13 = [v9 dateBySettingHour:7 minute:0 second:0 ofDate:v10 options:1];
        v12 = [v9 dateByAddingUnit:16 value:1 toDate:v13 options:0];

        goto LABEL_14;
      }
      uint64_t v11 = 19;
    }
    else
    {
      uint64_t v11 = 7;
    }
    v12 = [v9 dateBySettingHour:v11 minute:0 second:0 ofDate:v10 options:1];
LABEL_14:
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v10 endDate:v12];
    uint64_t v15 = [MEMORY[0x263F3A6E8] lifetimeWithDateInterval:v14];
    uint64_t v16 = (void *)v23[5];
    v23[5] = v15;

    goto LABEL_15;
  }
  if ([v6 isEqualToString:@"com.apple.donotdisturb.kit.lifetime.location"])
  {
    uint64_t v7 = [MEMORY[0x263F3A6E8] lifetimeWithCurrentLocation];
    goto LABEL_3;
  }
  if ([v6 isEqualToString:@"com.apple.donotdisturb.kit.lifetime.event"])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__DNDLifetimeDetailsProvider_lifetimeForLifetimeDetails_error___block_invoke;
    block[3] = &unk_2644AF450;
    void block[4] = self;
    void block[5] = &v22;
    dispatch_sync(queue, block);
  }
LABEL_15:
  id v17 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v17;
}

void __63__DNDLifetimeDetailsProvider_lifetimeForLifetimeDetails_error___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(*(void *)(a1 + 32) + 80) uniqueId];
  if (v7)
  {
    id v2 = (void *)MEMORY[0x263F3A6E8];
    v3 = [*(id *)(*(void *)(a1 + 32) + 80) occurrenceDate];
    uint64_t v4 = [v2 lifetimeUntilEndOfCalendarEventWithUniqueID:v7 occurrenceDate:v3];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (id)lifetimeDetailsForAssertionDetails:(id)a3 error:(id *)a4
{
  uint64_t v4 = [a3 identifier];
  if ([v4 isEqualToString:@"com.apple.donotdisturb.kit.lifetime.one-hour"])
  {
    uint64_t v5 = +[DNDLifetimeDetails lifetimeDetailsForOneHour];
LABEL_9:
    id v6 = (void *)v5;
    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"com.apple.donotdisturb.kit.lifetime.evening"])
  {
    uint64_t v5 = +[DNDLifetimeDetails lifetimeDetailsUntilEvening];
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"com.apple.donotdisturb.kit.lifetime.morning"])
  {
    uint64_t v5 = +[DNDLifetimeDetails lifetimeDetailsUntilMorning];
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"com.apple.donotdisturb.kit.lifetime.location"])
  {
    uint64_t v5 = +[DNDLifetimeDetails lifetimeDetailsForPlaceInference:0];
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"com.apple.donotdisturb.kit.lifetime.event"])
  {
    v8 = [MEMORY[0x263EFF910] date];
    id v6 = +[DNDLifetimeDetails lifetimeDetailsForEvent:0 relativeToDate:v8];
  }
  else
  {
    id v6 = 0;
  }
LABEL_10:

  return v6;
}

- (void)lifetimeDetailsWithMetadataForAssertionDetails:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  v8 = [v6 identifier];
  if ([v8 isEqualToString:@"com.apple.donotdisturb.kit.lifetime.one-hour"])
  {
    uint64_t v9 = +[DNDLifetimeDetails lifetimeDetailsForOneHour];
  }
  else if ([v8 isEqualToString:@"com.apple.donotdisturb.kit.lifetime.evening"])
  {
    uint64_t v9 = +[DNDLifetimeDetails lifetimeDetailsUntilEvening];
  }
  else
  {
    if (![v8 isEqualToString:@"com.apple.donotdisturb.kit.lifetime.morning"]) {
      goto LABEL_9;
    }
    uint64_t v9 = +[DNDLifetimeDetails lifetimeDetailsUntilMorning];
  }
  dispatch_queue_t v10 = (void *)v9;
  if (v9)
  {
    v7[2](v7, v9, 0);

    goto LABEL_13;
  }
LABEL_9:
  uint64_t v11 = [v6 lifetime];
  uint64_t v12 = [v11 lifetimeType];

  if (v12 == 3)
  {
    v13 = +[DNDLifetimeDetails lifetimeDetailsForPlaceInference:self->_currentPlaceInference];
    v7[2](v7, (uint64_t)v13, 0);
  }
  else
  {
    uint64_t v14 = [v6 lifetime];
    uint64_t v15 = [v14 lifetimeType];

    if (v15 == 1)
    {
      uint64_t v16 = [v6 lifetime];
      objc_initWeak(&location, self);
      eventStoreQueue = self->_eventStoreQueue;
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __95__DNDLifetimeDetailsProvider_lifetimeDetailsWithMetadataForAssertionDetails_completionHandler___block_invoke;
      v19[3] = &unk_2644AF478;
      objc_copyWeak(&v22, &location);
      id v20 = v16;
      uint64_t v21 = v7;
      id v18 = v16;
      dispatch_async(eventStoreQueue, v19);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
  }
LABEL_13:
}

uint64_t __95__DNDLifetimeDetailsProvider_lifetimeDetailsWithMetadataForAssertionDetails_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = objc_msgSend(WeakRetained, "_eventStoreQueue_eventForCalendarEventLifetime:", *(void *)(a1 + 32));
    uint64_t v4 = [MEMORY[0x263EFF910] date];
    uint64_t v5 = +[DNDLifetimeDetails lifetimeDetailsForEvent:v3 relativeToDate:v4];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(uint64_t, void, void))(v6 + 16))(v6, 0, 0);
    }
  }
  return MEMORY[0x270F9A758]();
}

- (void)_queue_rebuildAvailableLifetimeDetails
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = [MEMORY[0x263EFF910] date];
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = +[DNDLifetimeDetails lifetimeDetailsForOneHour];
  [v4 addObject:v5];

  uint64_t v6 = [(DNDLifetimeDetailsProvider *)self _lifetimeDetailsUntilEveningOrMorningForDate:v3];
  [v4 addObject:v6];

  id v7 = (void *)MEMORY[0x263F00A60];
  v8 = objc_msgSend(MEMORY[0x263F086E0], "dnd_locationBundle");
  uint64_t v9 = [v8 bundlePath];
  LODWORD(v7) = [v7 authorizationStatusForBundlePath:v9];

  if (v7 == 3)
  {
    dispatch_queue_t v10 = +[DNDLifetimeDetails lifetimeDetailsForPlaceInference:self->_currentPlaceInference];
    [v4 addObject:v10];
  }
  relevantEvent = self->_relevantEvent;
  if (relevantEvent)
  {
    uint64_t v12 = +[DNDLifetimeDetails lifetimeDetailsForEvent:relevantEvent relativeToDate:v3];
    [v4 addObject:v12];
  }
  v13 = (void *)[v4 copy];
  if (![(NSArray *)self->_availableLifetimeDetails isEqualToArray:v13])
  {
    objc_storeStrong((id *)&self->_availableLifetimeDetails, v13);
    uint64_t v14 = [(DNDLifetimeDetailsProvider *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      calloutQueue = self->_calloutQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __68__DNDLifetimeDetailsProvider__queue_rebuildAvailableLifetimeDetails__block_invoke;
      block[3] = &unk_2644AF4A0;
      id v17 = v14;
      id v18 = self;
      id v19 = v13;
      dispatch_async(calloutQueue, block);
    }
  }
}

uint64_t __68__DNDLifetimeDetailsProvider__queue_rebuildAvailableLifetimeDetails__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) lifetimeDetailsProvider:*(void *)(a1 + 40) didUpdateAvailableLifetimeDetails:*(void *)(a1 + 48)];
}

- (id)_lifetimeDetailsUntilEveningOrMorningForDate:(id)a3
{
  uint64_t v8 = 0;
  v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a3;
  uint64_t v5 = [v3 currentCalendar];
  [v5 getHour:&v8 minute:0 second:0 nanosecond:0 fromDate:v4];

  if ((unint64_t)(v8 - 4) > 0xD) {
    +[DNDLifetimeDetails lifetimeDetailsUntilMorning];
  }
  else {
  uint64_t v6 = +[DNDLifetimeDetails lifetimeDetailsUntilEvening];
  }
  return v6;
}

- (void)_requestRelevantLocationMetadata
{
  locationManager = self->_locationManager;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __62__DNDLifetimeDetailsProvider__requestRelevantLocationMetadata__block_invoke;
  v3[3] = &unk_2644AF4C8;
  v3[4] = self;
  [(CLLocationManager *)locationManager _fetchPlaceInferencesWithFidelityPolicy:1 handler:v3];
}

void __62__DNDLifetimeDetailsProvider__requestRelevantLocationMetadata__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = DNDLogLocation;
    if (os_log_type_enabled((os_log_t)DNDLogLocation, OS_LOG_TYPE_ERROR)) {
      __62__DNDLifetimeDetailsProvider__requestRelevantLocationMetadata__block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_gotPlaceInferences:", v5);
}

- (void)_queue_gotPlaceInferences:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v6 = [v5 firstObject];

  id v7 = (_CLPlaceInference *)[v6 copy];
  currentPlaceInference = self->_currentPlaceInference;
  self->_currentPlaceInference = v7;

  [(DNDLifetimeDetailsProvider *)self _queue_rebuildAvailableLifetimeDetails];
}

- (void)_queue_resetLifetimeDetails
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(EKEventStore *)self->_eventStore reset];
  currentPlaceInference = self->_currentPlaceInference;
  self->_currentPlaceInference = 0;

  relevantEvent = self->_relevantEvent;
  self->_relevantEvent = 0;
}

- (void)_queue_requestLifetimeDetails
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(DNDLifetimeDetailsProvider *)self _queue_resetLifetimeDetails];
  [(DNDLifetimeDetailsProvider *)self _queue_rebuildAvailableLifetimeDetails];
}

- (void)_eventStoreQueue_requestRelevantEvent
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventStoreQueue);
  v3 = [MEMORY[0x263EFF910] date];
  uint64_t v4 = [v3 dateByAddingTimeInterval:900.0];
  uint64_t v24 = [(EKCalendarVisibilityManager *)self->_calendarVisibilityManager visibleCalendars];
  v25 = (void *)v4;
  objc_super v23 = -[EKEventStore predicateForEventsWithStartDate:endDate:calendars:](self->_eventStore, "predicateForEventsWithStartDate:endDate:calendars:", v3, v4);
  id v22 = -[EKEventStore eventsMatchingPredicate:](self->_eventStore, "eventsMatchingPredicate:");
  id v5 = objc_msgSend(v22, "bs_filter:", &__block_literal_global_30);
  id v6 = [v5 firstObject];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v13 = [v12 startDate];
        [v13 timeIntervalSinceDate:v3];
        double v15 = fabs(v14);
        uint64_t v16 = [v6 startDate];
        [v16 timeIntervalSinceDate:v3];
        double v18 = fabs(v17);

        if (v15 < v18)
        {
          id v19 = v12;

          id v6 = v19;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v9);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__DNDLifetimeDetailsProvider__eventStoreQueue_requestRelevantEvent__block_invoke_2;
  block[3] = &unk_2644AF300;
  void block[4] = self;
  id v27 = v6;
  id v21 = v6;
  dispatch_async(queue, block);
}

BOOL __67__DNDLifetimeDetailsProvider__eventStoreQueue_requestRelevantEvent__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = ([v2 isAllDay] & 1) == 0
    && [v2 participationStatus] != 3
    && [v2 status] != 3;

  return v3;
}

uint64_t __67__DNDLifetimeDetailsProvider__eventStoreQueue_requestRelevantEvent__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), *(id *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "_queue_rebuildAvailableLifetimeDetails");
}

- (id)_eventStoreQueue_eventForCalendarEventLifetime:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventStoreQueue);
  if ([v4 isOnlyDuringEvent]) {
    [v4 occurrenceDate];
  }
  else {
  id v5 = [MEMORY[0x263EFF910] now];
  }
  id v6 = [v5 dateByAddingTimeInterval:900.0];
  id v7 = [(EKCalendarVisibilityManager *)self->_calendarVisibilityManager visibleCalendars];
  uint64_t v8 = [(EKEventStore *)self->_eventStore predicateForEventsWithStartDate:v5 endDate:v6 calendars:v7];
  uint64_t v9 = [(EKEventStore *)self->_eventStore eventsMatchingPredicate:v8];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__DNDLifetimeDetailsProvider__eventStoreQueue_eventForCalendarEventLifetime___block_invoke;
  v14[3] = &unk_2644AF510;
  id v15 = v4;
  id v10 = v4;
  uint64_t v11 = objc_msgSend(v9, "bs_filter:", v14);
  uint64_t v12 = [v11 firstObject];

  return v12;
}

uint64_t __77__DNDLifetimeDetailsProvider__eventStoreQueue_eventForCalendarEventLifetime___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 uniqueId];
  id v4 = [*(id *)(a1 + 32) eventUniqueID];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)_scheduleRefreshTimerIfNeeded
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__DNDLifetimeDetailsProvider__scheduleRefreshTimerIfNeeded__block_invoke;
  block[3] = &unk_2644AF2B8;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __59__DNDLifetimeDetailsProvider__scheduleRefreshTimerIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleRefreshTimerIfNeeded");
}

- (void)_queue_scheduleRefreshTimerIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v3 = [(DNDLifetimeDetailsProvider *)self _nextRefreshTimerFireDate];
  refreshTimer = self->_refreshTimer;
  if (!refreshTimer) {
    goto LABEL_5;
  }
  uint64_t v5 = [(NSTimer *)refreshTimer fireDate];
  char v6 = [v5 isEqual:v3];

  if ((v6 & 1) == 0)
  {
    [(NSTimer *)self->_refreshTimer invalidate];
    id v7 = self->_refreshTimer;
    self->_refreshTimer = 0;
  }
  if (!self->_refreshTimer)
  {
LABEL_5:
    objc_initWeak(&location, self);
    id v8 = objc_alloc(MEMORY[0x263EFFA20]);
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    double v14 = __65__DNDLifetimeDetailsProvider__queue_scheduleRefreshTimerIfNeeded__block_invoke;
    id v15 = &unk_2644AF538;
    objc_copyWeak(&v16, &location);
    uint64_t v9 = (NSTimer *)[v8 initWithFireDate:v3 interval:0 repeats:&v12 block:0.0];
    id v10 = self->_refreshTimer;
    self->_refreshTimer = v9;

    uint64_t v11 = objc_msgSend(MEMORY[0x263EFF9F0], "currentRunLoop", v12, v13, v14, v15);
    [v11 addTimer:self->_refreshTimer forMode:*MEMORY[0x263EFF588]];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __65__DNDLifetimeDetailsProvider__queue_scheduleRefreshTimerIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained requestLifetimeDetails];
    id WeakRetained = v2;
    if (v2[32])
    {
      [v2 _scheduleRefreshTimerIfNeeded];
      id WeakRetained = v2;
    }
  }
}

- (id)_nextRefreshTimerFireDate
{
  id v2 = [MEMORY[0x263EFF8F0] currentCalendar];
  BOOL v3 = [MEMORY[0x263EFF910] date];
  uint64_t v8 = 0;
  [v2 getHour:&v8 minute:0 second:0 nanosecond:0 fromDate:v3];
  if (v8 <= 3)
  {
    uint64_t v4 = 4;
LABEL_5:
    uint64_t v5 = [v2 dateBySettingHour:v4 minute:0 second:0 ofDate:v3 options:1];
    goto LABEL_7;
  }
  if ((unint64_t)v8 <= 0x11)
  {
    uint64_t v4 = 18;
    goto LABEL_5;
  }
  char v6 = [v2 dateBySettingHour:4 minute:0 second:0 ofDate:v3 options:1];
  uint64_t v5 = [v2 dateByAddingUnit:16 value:1 toDate:v6 options:0];

LABEL_7:
  return v5;
}

- (void)_systemTimeChanged
{
  [(DNDLifetimeDetailsProvider *)self requestLifetimeDetails];
  [(DNDLifetimeDetailsProvider *)self _scheduleRefreshTimerIfNeeded];
}

- (NSArray)availableLifetimeDetails
{
  return self->_availableLifetimeDetails;
}

- (DNDLifetimeDetailsProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DNDLifetimeDetailsProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_availableLifetimeDetails, 0);
  objc_storeStrong((id *)&self->_relevantEvent, 0);
  objc_storeStrong((id *)&self->_calendarVisibilityManager, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_currentPlaceInference, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_eventStoreQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __62__DNDLifetimeDetailsProvider__requestRelevantLocationMetadata__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E516000, a2, OS_LOG_TYPE_ERROR, "Error determining location: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end