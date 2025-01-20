@interface DNDSMetricsManager
- (DNDSMetricsManager)init;
- (id)_calendar;
- (id)_dateForYesterday;
- (id)_dateFormatter;
- (id)_metricsDayStringForDate:(id)a3;
- (id)_metricsMonthStringForDate:(id)a3;
- (id)_metricsWeekStringForDate:(id)a3;
- (id)_startOfLastMonth;
- (id)_startOfLastWeek;
- (id)_startOfMonthWithDate:(id)a3;
- (id)_startOfWeekWithDate:(id)a3;
- (void)_aggregateMetricsWithEnabled:(BOOL)a3 manuallyEnabled:(BOOL)a4 numberOfNewSessions:(int)a5 numberOfNewManualSessions:(int)a6 controlCenterPhone:(BOOL)a7 controlCenterWatch:(BOOL)a8 type:(id)a9 mode:(id)a10 dayOfWeek:(id)a11;
- (void)_sendDailyHeartbeatIfNeeded;
- (void)_sendMonthlyHeartbeatIfNeeded;
- (void)_sendWeeklyHeartbeatIfNeeded;
- (void)_writeMetricsToStore:(id)a3;
- (void)assertionTaken:(id)a3 withClientDetails:(id)a4 lockState:(unint64_t)a5;
- (void)sendMetricsHeartbeatsIfNeeded;
@end

@implementation DNDSMetricsManager

- (DNDSMetricsManager)init
{
  v19.receiver = self;
  v19.super_class = (Class)DNDSMetricsManager;
  v2 = [(DNDSMetricsManager *)&v19 init];
  if (v2)
  {
    uint64_t v3 = +[DNDSWorkloop serialQueueTargetingSharedWorkloop:@"com.apple.donotdisturb.server.MetricsManager"];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = objc_msgSend(MEMORY[0x1E4F1CB10], "dnds_metricsBackingStoreFileURL");
    uint64_t v6 = +[DNDSMetricsRecord backingStoreWithFileURL:v5];
    metricsBackingStore = v2->_metricsBackingStore;
    v2->_metricsBackingStore = (DNDSBackingStore *)v6;

    v8 = [(DNDSBackingStore *)v2->_metricsBackingStore readRecordWithError:0];
    uint64_t v9 = [v8 mutableCopy];
    metricsRecord = v2->_metricsRecord;
    v2->_metricsRecord = (DNDSMutableMetricsRecord *)v9;

    if (!v2->_metricsRecord)
    {
      v11 = objc_alloc_init(DNDSMutableMetricsRecord);
      v12 = v2->_metricsRecord;
      v2->_metricsRecord = v11;
    }
    id v13 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    uint64_t v14 = [v13 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    calendar = v2->_calendar;
    v2->_calendar = (NSCalendar *)v14;

    v16 = v2->_calendar;
    v17 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
    [(NSCalendar *)v16 setTimeZone:v17];
  }
  return v2;
}

- (void)assertionTaken:(id)a3 withClientDetails:(id)a4 lockState:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__DNDSMetricsManager_assertionTaken_withClientDetails_lockState___block_invoke;
  v13[3] = &unk_1E6974078;
  id v14 = v9;
  id v15 = v8;
  v16 = self;
  unint64_t v17 = a5;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(queue, v13);
}

void __65__DNDSMetricsManager_assertionTaken_withClientDetails_lockState___block_invoke(id *a1)
{
  uint64_t v2 = [a1[4] isUserInteractionClient];
  uint64_t v3 = [a1[5] details];
  v25 = [v3 modeIdentifier];

  v4 = [a1[5] details];
  v5 = [v4 identifier];

  uint64_t v6 = [a1[5] source];
  v7 = [v6 clientIdentifier];

  unsigned int v24 = [v7 isEqualToString:@"com.apple.donotdisturb.control-center.module"];
  unsigned int v23 = [v7 isEqualToString:@"com.apple.private.Carousel.control-center.DND.state"];
  id v8 = [a1[5] details];
  id v9 = [v8 lifetime];

  objc_opt_class();
  v26 = v9;
  if (objc_opt_isKindOfClass())
  {
    v22 = [v9 scheduleIdentifier];
  }
  else
  {
    v22 = @"none";
  }
  v10 = [a1[6] _calendar];
  id v11 = [MEMORY[0x1E4F1C9C8] date];
  [v10 component:32 fromDate:v11];

  id v12 = NSNumber;
  id v13 = [a1[6] _calendar];
  id v14 = [MEMORY[0x1E4F1C9C8] date];
  id v15 = objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "component:fromDate:", 512, v14));

  v16 = DNDSLogMetrics;
  if (os_log_type_enabled((os_log_t)DNDSLogMetrics, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v16, OS_LOG_TYPE_DEFAULT, "Sending assertion taken event", buf, 2u);
  }
  v27 = v7;
  v28 = v15;
  id v17 = v15;
  v18 = v22;
  id v19 = v7;
  id v20 = v5;
  id v21 = v25;
  AnalyticsSendEventLazy();
  [a1[6] _aggregateMetricsWithEnabled:1 manuallyEnabled:v2 numberOfNewSessions:1 numberOfNewManualSessions:v2 controlCenterPhone:v24 controlCenterWatch:v23 type:v20 mode:v21 dayOfWeek:v17];
  [a1[6] sendMetricsHeartbeatsIfNeeded];
}

id __65__DNDSMetricsManager_assertionTaken_withClientDetails_lockState___block_invoke_300(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v12[0] = @"manual";
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 88)];
  id v13 = v2;
  long long v14 = *(_OWORD *)(a1 + 32);
  v12[1] = @"mode";
  v12[2] = @"type";
  uint64_t v15 = *(void *)(a1 + 48);
  v12[3] = @"source";
  v12[4] = @"controlCenterPhone";
  uint64_t v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 89)];
  v16 = v3;
  v12[5] = @"controlCenterWatch";
  v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 90)];
  id v17 = v4;
  v12[6] = @"schedule";
  v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 91)];
  uint64_t v6 = *(void *)(a1 + 56);
  v18 = v5;
  uint64_t v19 = v6;
  v12[7] = @"scheduleIdentifier";
  v12[8] = @"hour";
  v7 = [NSNumber numberWithInteger:*(void *)(a1 + 72)];
  id v20 = v7;
  v12[9] = @"lockState";
  id v8 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 80)];
  uint64_t v9 = *(void *)(a1 + 64);
  id v21 = v8;
  uint64_t v22 = v9;
  v12[10] = @"weekday";
  v12[11] = @"version";
  unsigned int v23 = &unk_1F2A5D8E0;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:v12 count:12];

  return v10;
}

- (void)sendMetricsHeartbeatsIfNeeded
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__DNDSMetricsManager_sendMetricsHeartbeatsIfNeeded__block_invoke;
  block[3] = &unk_1E6973540;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __51__DNDSMetricsManager_sendMetricsHeartbeatsIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _sendDailyHeartbeatIfNeeded];
  [*(id *)(a1 + 32) _sendWeeklyHeartbeatIfNeeded];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _sendMonthlyHeartbeatIfNeeded];
}

- (void)_aggregateMetricsWithEnabled:(BOOL)a3 manuallyEnabled:(BOOL)a4 numberOfNewSessions:(int)a5 numberOfNewManualSessions:(int)a6 controlCenterPhone:(BOOL)a7 controlCenterWatch:(BOOL)a8 type:(id)a9 mode:(id)a10 dayOfWeek:(id)a11
{
  BOOL v69 = a8;
  BOOL v67 = a7;
  BOOL v63 = a4;
  BOOL v62 = a3;
  id v13 = a9;
  id v14 = a10;
  id v81 = a11;
  uint64_t v15 = DNDSLogMetrics;
  if (os_log_type_enabled((os_log_t)DNDSLogMetrics, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v15, OS_LOG_TYPE_DEFAULT, "Updating aggregated metrics", buf, 2u);
  }
  int v65 = [v13 isEqualToString:@"com.apple.donotdisturb.kit.lifetime.one-hour"];
  int v66 = [v13 isEqualToString:@"com.apple.donotdisturb.kit.lifetime.evening"];
  int v68 = [v13 isEqualToString:@"com.apple.donotdisturb.kit.lifetime.morning"];
  int v70 = [v13 isEqualToString:@"com.apple.donotdisturb.kit.lifetime.location"];
  int v71 = [v13 isEqualToString:@"com.apple.donotdisturb.kit.lifetime.event"];
  int v78 = [v14 isEqualToString:@"com.apple.donotdisturb.mode.driving"];
  v79 = v14;
  int v74 = [v14 isEqualToString:*MEMORY[0x1E4FA5460]];
  v16 = [[DNDSBackingStoreDictionaryContext alloc] initWithDestination:1 partitionType:1 redactSensitiveData:0 contactProvider:0 applicationIdentifierMapper:0];
  id v17 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v18 = [(DNDSMetricsManager *)self _metricsDayStringForDate:v17];

  v77 = [(DNDSMetricsRecord *)self->_metricsRecord metricsByDay];
  v80 = (void *)v18;
  uint64_t v19 = [v77 valueForKey:v18];
  id v20 = +[DNDSDailyHeartbeatMetricsRecord newWithDictionaryRepresentation:v19 context:v16];
  uint64_t v21 = [v20 mutableCopy];

  uint64_t v22 = (DNDSMutableDailyHeartbeatMetricsRecord *)v21;
  if (!v21) {
    uint64_t v22 = objc_alloc_init(DNDSMutableDailyHeartbeatMetricsRecord);
  }
  unsigned int v23 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v24 = [(DNDSMetricsManager *)self _metricsWeekStringForDate:v23];

  v75 = [(DNDSMetricsRecord *)self->_metricsRecord metricsByWeek];
  v76 = (void *)v24;
  v25 = [v75 valueForKey:v24];
  id v26 = +[DNDSHeartbeatMetricsRecord newWithDictionaryRepresentation:v25 context:v16];
  v27 = (DNDSMutableWeeklyHeartbeatMetricsRecord *)[v26 mutableCopy];

  if (!v27) {
    v27 = objc_alloc_init(DNDSMutableWeeklyHeartbeatMetricsRecord);
  }
  v28 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v29 = [(DNDSMetricsManager *)self _metricsMonthStringForDate:v28];

  v72 = [(DNDSMetricsRecord *)self->_metricsRecord metricsByMonth];
  v73 = (void *)v29;
  v30 = [v72 valueForKey:v29];
  id v31 = +[DNDSHeartbeatMetricsRecord newWithDictionaryRepresentation:v30 context:v16];
  v32 = (DNDSMutableMonthlyHeartbeatMetricsRecord *)[v31 mutableCopy];

  if (!v32) {
    v32 = objc_alloc_init(DNDSMutableMonthlyHeartbeatMetricsRecord);
  }
  v33 = self;
  if (v62)
  {
    [(DNDSMutableDailyHeartbeatMetricsRecord *)v22 setEnabled:1];
    [(DNDSMutableWeeklyHeartbeatMetricsRecord *)v27 setEnabled:1];
    [(DNDSMutableMonthlyHeartbeatMetricsRecord *)v32 setEnabled:1];
  }
  v34 = v16;
  if (v63)
  {
    [(DNDSMutableDailyHeartbeatMetricsRecord *)v22 setManuallyEnabled:1];
    [(DNDSMutableWeeklyHeartbeatMetricsRecord *)v27 setManuallyEnabled:1];
    [(DNDSMutableMonthlyHeartbeatMetricsRecord *)v32 setManuallyEnabled:1];
  }
  v35 = NSNumber;
  v36 = [(DNDSHeartbeatMetricsRecord *)v22 numberOfSessions];
  v37 = objc_msgSend(v35, "numberWithInt:", objc_msgSend(v36, "intValue") + a5);
  [(DNDSMutableDailyHeartbeatMetricsRecord *)v22 setNumberOfSessions:v37];

  v38 = NSNumber;
  v39 = [(DNDSHeartbeatMetricsRecord *)v27 numberOfSessions];
  v40 = objc_msgSend(v38, "numberWithInt:", objc_msgSend(v39, "intValue") + a5);
  [(DNDSMutableWeeklyHeartbeatMetricsRecord *)v27 setNumberOfSessions:v40];

  v41 = NSNumber;
  v42 = [(DNDSHeartbeatMetricsRecord *)v32 numberOfSessions];
  v43 = objc_msgSend(v41, "numberWithInt:", objc_msgSend(v42, "intValue") + a5);
  [(DNDSMutableMonthlyHeartbeatMetricsRecord *)v32 setNumberOfSessions:v43];

  v44 = NSNumber;
  v45 = [(DNDSHeartbeatMetricsRecord *)v22 numberOfManualSessions];
  v46 = objc_msgSend(v44, "numberWithInt:", objc_msgSend(v45, "intValue") + a6);
  [(DNDSMutableDailyHeartbeatMetricsRecord *)v22 setNumberOfManualSessions:v46];

  v47 = NSNumber;
  v48 = [(DNDSHeartbeatMetricsRecord *)v27 numberOfManualSessions];
  v49 = objc_msgSend(v47, "numberWithInt:", objc_msgSend(v48, "intValue") + a6);
  [(DNDSMutableWeeklyHeartbeatMetricsRecord *)v27 setNumberOfManualSessions:v49];

  v50 = NSNumber;
  v51 = [(DNDSHeartbeatMetricsRecord *)v32 numberOfManualSessions];
  v52 = objc_msgSend(v50, "numberWithInt:", objc_msgSend(v51, "intValue") + a6);
  [(DNDSMutableMonthlyHeartbeatMetricsRecord *)v32 setNumberOfManualSessions:v52];

  if (v67)
  {
    [(DNDSMutableDailyHeartbeatMetricsRecord *)v22 setEnabledFromControlCenterPhone:1];
    [(DNDSMutableWeeklyHeartbeatMetricsRecord *)v27 setEnabledFromControlCenterPhone:1];
    [(DNDSMutableMonthlyHeartbeatMetricsRecord *)v32 setEnabledFromControlCenterPhone:1];
  }
  if (v69)
  {
    [(DNDSMutableDailyHeartbeatMetricsRecord *)v22 setEnabledFromControlCenterWatch:1];
    [(DNDSMutableWeeklyHeartbeatMetricsRecord *)v27 setEnabledFromControlCenterWatch:1];
    [(DNDSMutableMonthlyHeartbeatMetricsRecord *)v32 setEnabledFromControlCenterWatch:1];
  }
  if (v65)
  {
    [(DNDSMutableDailyHeartbeatMetricsRecord *)v22 setEnabledForOneHour:1];
    [(DNDSMutableWeeklyHeartbeatMetricsRecord *)v27 setEnabledForOneHour:1];
    [(DNDSMutableMonthlyHeartbeatMetricsRecord *)v32 setEnabledForOneHour:1];
  }
  if (v66)
  {
    [(DNDSMutableDailyHeartbeatMetricsRecord *)v22 setEnabledUntilEvening:1];
    [(DNDSMutableWeeklyHeartbeatMetricsRecord *)v27 setEnabledUntilEvening:1];
    [(DNDSMutableMonthlyHeartbeatMetricsRecord *)v32 setEnabledUntilEvening:1];
  }
  if (v68)
  {
    [(DNDSMutableDailyHeartbeatMetricsRecord *)v22 setEnabledUntilMorning:1];
    [(DNDSMutableWeeklyHeartbeatMetricsRecord *)v27 setEnabledUntilMorning:1];
    [(DNDSMutableMonthlyHeartbeatMetricsRecord *)v32 setEnabledUntilMorning:1];
  }
  if (v70)
  {
    [(DNDSMutableDailyHeartbeatMetricsRecord *)v22 setEnabledAtLocation:1];
    [(DNDSMutableWeeklyHeartbeatMetricsRecord *)v27 setEnabledAtLocation:1];
    [(DNDSMutableMonthlyHeartbeatMetricsRecord *)v32 setEnabledAtLocation:1];
  }
  if (v71)
  {
    [(DNDSMutableDailyHeartbeatMetricsRecord *)v22 setEnabledDuringEvent:1];
    [(DNDSMutableWeeklyHeartbeatMetricsRecord *)v27 setEnabledDuringEvent:1];
    [(DNDSMutableMonthlyHeartbeatMetricsRecord *)v32 setEnabledDuringEvent:1];
  }
  if (v78)
  {
    [(DNDSMutableDailyHeartbeatMetricsRecord *)v22 setEnabledDrivingMode:1];
    [(DNDSMutableWeeklyHeartbeatMetricsRecord *)v27 setEnabledDrivingMode:1];
    [(DNDSMutableMonthlyHeartbeatMetricsRecord *)v32 setEnabledDrivingMode:1];
  }
  if (v74)
  {
    [(DNDSMutableDailyHeartbeatMetricsRecord *)v22 setEnabledSleepMode:1];
    [(DNDSMutableWeeklyHeartbeatMetricsRecord *)v27 setEnabledSleepMode:1];
    [(DNDSMutableMonthlyHeartbeatMetricsRecord *)v32 setEnabledSleepMode:1];
  }
  [(DNDSMutableDailyHeartbeatMetricsRecord *)v22 setDayOfWeek:v81];
  v53 = [(DNDSMetricsRecord *)v33->_metricsRecord metricsByDay];
  v54 = (void *)[v53 mutableCopy];

  v55 = [(DNDSDailyHeartbeatMetricsRecord *)v22 dictionaryRepresentationWithContext:v16];
  [v54 setValue:v55 forKey:v80];

  [(DNDSMutableMetricsRecord *)v33->_metricsRecord setMetricsByDay:v54];
  v56 = [(DNDSMetricsRecord *)v33->_metricsRecord metricsByWeek];
  v57 = (void *)[v56 mutableCopy];

  v58 = [(DNDSHeartbeatMetricsRecord *)v27 dictionaryRepresentationWithContext:v16];
  [v57 setValue:v58 forKey:v76];

  [(DNDSMutableMetricsRecord *)v33->_metricsRecord setMetricsByWeek:v57];
  v59 = [(DNDSMetricsRecord *)v33->_metricsRecord metricsByMonth];
  v60 = (void *)[v59 mutableCopy];

  v61 = [(DNDSHeartbeatMetricsRecord *)v32 dictionaryRepresentationWithContext:v34];
  [v60 setValue:v61 forKey:v73];

  [(DNDSMutableMetricsRecord *)v33->_metricsRecord setMetricsByMonth:v60];
  [(DNDSMetricsManager *)v33 _writeMetricsToStore:v33->_metricsRecord];
}

- (void)_sendDailyHeartbeatIfNeeded
{
  uint64_t v3 = [(DNDSMetricsRecord *)self->_metricsRecord lastDailyHeartbeat];
  v4 = [(DNDSMetricsManager *)self _calendar];
  v5 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v6 = [v4 startOfDayForDate:v5];
  uint64_t v7 = [v3 compare:v6];

  if (v7 == -1)
  {
    id v8 = DNDSLogMetrics;
    if (os_log_type_enabled((os_log_t)DNDSLogMetrics, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Sending daily metrics heartbeat", buf, 2u);
    }
    uint64_t v9 = [(DNDSMetricsManager *)self _dateForYesterday];
    v10 = [(DNDSMetricsManager *)self _metricsDayStringForDate:v9];
    id v11 = [[DNDSBackingStoreDictionaryContext alloc] initWithDestination:1 partitionType:1 redactSensitiveData:0 contactProvider:0 applicationIdentifierMapper:0];
    id v12 = [(DNDSMetricsRecord *)self->_metricsRecord metricsByDay];
    id v13 = [v12 objectForKey:v10];
    id v14 = +[DNDSDailyHeartbeatMetricsRecord newWithDictionaryRepresentation:v13 context:v11];

    if (v14)
    {
      id v22 = v14;
      AnalyticsSendEventLazy();
    }
    metricsRecord = self->_metricsRecord;
    v16 = [MEMORY[0x1E4F1C9C8] date];
    [(DNDSMutableMetricsRecord *)metricsRecord setLastDailyHeartbeat:v16];

    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v18 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v19 = [(DNDSMetricsManager *)self _metricsDayStringForDate:v18];

    id v20 = [(DNDSMetricsRecord *)self->_metricsRecord metricsByDay];
    uint64_t v21 = [v20 objectForKey:v19];

    if (v21) {
      [v17 setValue:v21 forKey:v19];
    }
    [(DNDSMutableMetricsRecord *)self->_metricsRecord setMetricsByDay:v17];
    [(DNDSMetricsManager *)self _writeMetricsToStore:self->_metricsRecord];
  }
}

id __49__DNDSMetricsManager__sendDailyHeartbeatIfNeeded__block_invoke(uint64_t a1)
{
  v19[15] = *MEMORY[0x1E4F143B8];
  v18[0] = @"enabled";
  id v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabled"));
  v19[0] = v17;
  v18[1] = @"manuallyEnabled";
  v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "manuallyEnabled"));
  v19[1] = v16;
  v18[2] = @"numberOfSessions";
  uint64_t v15 = [*(id *)(a1 + 32) numberOfSessions];
  v19[2] = v15;
  v18[3] = @"numberOfManualSessions";
  id v14 = [*(id *)(a1 + 32) numberOfManualSessions];
  v19[3] = v14;
  v18[4] = @"enabledFromControlCenterPhone";
  id v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledFromControlCenterPhone"));
  v19[4] = v13;
  v18[5] = @"enabledFromControlCenterWatch";
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledFromControlCenterWatch"));
  v19[5] = v2;
  v18[6] = @"enabledForOneHour";
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledForOneHour"));
  v19[6] = v3;
  v18[7] = @"enabledUntilEvening";
  v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledUntilEvening"));
  v19[7] = v4;
  v18[8] = @"enabledUntilMorning";
  v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledUntilMorning"));
  v19[8] = v5;
  v18[9] = @"enabledAtLocation";
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledAtLocation"));
  v19[9] = v6;
  v18[10] = @"enabledDuringEvent";
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledDuringEvent"));
  v19[10] = v7;
  v18[11] = @"enabledDrivingMode";
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledDrivingMode"));
  v19[11] = v8;
  v18[12] = @"enabledSleepMode";
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledSleepMode"));
  v19[12] = v9;
  v18[13] = @"dayOfWeek";
  v10 = [*(id *)(a1 + 32) dayOfWeek];
  v18[14] = @"version";
  v19[13] = v10;
  v19[14] = &unk_1F2A5D8E0;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:15];

  return v11;
}

- (void)_sendWeeklyHeartbeatIfNeeded
{
  uint64_t v3 = [(DNDSMetricsRecord *)self->_metricsRecord lastWeeklyHeartbeat];
  v4 = [MEMORY[0x1E4F1C9C8] date];
  v5 = [(DNDSMetricsManager *)self _startOfWeekWithDate:v4];
  uint64_t v6 = [v3 compare:v5];

  if (v6 == -1)
  {
    uint64_t v7 = DNDSLogMetrics;
    if (os_log_type_enabled((os_log_t)DNDSLogMetrics, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Sending weekly metrics heartbeat", buf, 2u);
    }
    id v8 = [(DNDSMetricsManager *)self _startOfLastWeek];
    uint64_t v9 = [(DNDSMetricsManager *)self _metricsWeekStringForDate:v8];
    v10 = [[DNDSBackingStoreDictionaryContext alloc] initWithDestination:1 partitionType:1 redactSensitiveData:0 contactProvider:0 applicationIdentifierMapper:0];
    id v11 = [(DNDSMetricsRecord *)self->_metricsRecord metricsByWeek];
    id v12 = [v11 objectForKey:v9];
    id v13 = +[DNDSHeartbeatMetricsRecord newWithDictionaryRepresentation:v12 context:v10];

    if (v13)
    {
      id v21 = v13;
      AnalyticsSendEventLazy();
    }
    metricsRecord = self->_metricsRecord;
    uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
    [(DNDSMutableMetricsRecord *)metricsRecord setLastWeeklyHeartbeat:v15];

    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v17 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v18 = [(DNDSMetricsManager *)self _metricsWeekStringForDate:v17];

    uint64_t v19 = [(DNDSMetricsRecord *)self->_metricsRecord metricsByWeek];
    id v20 = [v19 objectForKey:v18];

    if (v20) {
      [v16 setValue:v20 forKey:v18];
    }
    [(DNDSMutableMetricsRecord *)self->_metricsRecord setMetricsByWeek:v16];
    [(DNDSMetricsManager *)self _writeMetricsToStore:self->_metricsRecord];
  }
}

id __50__DNDSMetricsManager__sendWeeklyHeartbeatIfNeeded__block_invoke(uint64_t a1)
{
  v18[14] = *MEMORY[0x1E4F143B8];
  v17[0] = @"enabled";
  id v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabled"));
  v18[0] = v16;
  v17[1] = @"manuallyEnabled";
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "manuallyEnabled"));
  v18[1] = v15;
  v17[2] = @"numberOfSessions";
  id v14 = [*(id *)(a1 + 32) numberOfSessions];
  v18[2] = v14;
  v17[3] = @"numberOfManualSessions";
  id v13 = [*(id *)(a1 + 32) numberOfManualSessions];
  v18[3] = v13;
  v17[4] = @"enabledFromControlCenterPhone";
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledFromControlCenterPhone"));
  v18[4] = v2;
  v17[5] = @"enabledFromControlCenterWatch";
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledFromControlCenterWatch"));
  v18[5] = v3;
  v17[6] = @"enabledForOneHour";
  v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledForOneHour"));
  v18[6] = v4;
  v17[7] = @"enabledUntilEvening";
  v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledUntilEvening"));
  v18[7] = v5;
  v17[8] = @"enabledUntilMorning";
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledUntilMorning"));
  v18[8] = v6;
  v17[9] = @"enabledAtLocation";
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledAtLocation"));
  v18[9] = v7;
  v17[10] = @"enabledDuringEvent";
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledDuringEvent"));
  v18[10] = v8;
  v17[11] = @"enabledDrivingMode";
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledDrivingMode"));
  v18[11] = v9;
  v17[12] = @"enabledSleepMode";
  v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledSleepMode"));
  v17[13] = @"version";
  v18[12] = v10;
  v18[13] = &unk_1F2A5D8E0;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:14];

  return v11;
}

- (void)_sendMonthlyHeartbeatIfNeeded
{
  uint64_t v3 = [(DNDSMetricsRecord *)self->_metricsRecord lastMonthlyHeartbeat];
  v4 = [MEMORY[0x1E4F1C9C8] date];
  v5 = [(DNDSMetricsManager *)self _startOfMonthWithDate:v4];
  uint64_t v6 = [v3 compare:v5];

  if (v6 == -1)
  {
    uint64_t v7 = DNDSLogMetrics;
    if (os_log_type_enabled((os_log_t)DNDSLogMetrics, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Sending monthly metrics heartbeat", buf, 2u);
    }
    id v8 = [(DNDSMetricsManager *)self _startOfLastMonth];
    uint64_t v9 = [(DNDSMetricsManager *)self _metricsMonthStringForDate:v8];
    v10 = [[DNDSBackingStoreDictionaryContext alloc] initWithDestination:1 partitionType:1 redactSensitiveData:0 contactProvider:0 applicationIdentifierMapper:0];
    id v11 = [(DNDSMetricsRecord *)self->_metricsRecord metricsByMonth];
    id v12 = [v11 objectForKey:v9];
    id v13 = +[DNDSHeartbeatMetricsRecord newWithDictionaryRepresentation:v12 context:v10];

    if (v13)
    {
      id v21 = v13;
      AnalyticsSendEventLazy();
    }
    metricsRecord = self->_metricsRecord;
    uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
    [(DNDSMutableMetricsRecord *)metricsRecord setLastMonthlyHeartbeat:v15];

    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v17 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v18 = [(DNDSMetricsManager *)self _metricsMonthStringForDate:v17];

    uint64_t v19 = [(DNDSMetricsRecord *)self->_metricsRecord metricsByMonth];
    id v20 = [v19 objectForKey:v18];

    if (v20) {
      [v16 setValue:v20 forKey:v18];
    }
    [(DNDSMutableMetricsRecord *)self->_metricsRecord setMetricsByMonth:v16];
    [(DNDSMetricsManager *)self _writeMetricsToStore:self->_metricsRecord];
  }
}

id __51__DNDSMetricsManager__sendMonthlyHeartbeatIfNeeded__block_invoke(uint64_t a1)
{
  v18[14] = *MEMORY[0x1E4F143B8];
  v17[0] = @"enabled";
  id v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabled"));
  v18[0] = v16;
  v17[1] = @"manuallyEnabled";
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "manuallyEnabled"));
  v18[1] = v15;
  v17[2] = @"numberOfSessions";
  id v14 = [*(id *)(a1 + 32) numberOfSessions];
  v18[2] = v14;
  v17[3] = @"numberOfManualSessions";
  id v13 = [*(id *)(a1 + 32) numberOfManualSessions];
  v18[3] = v13;
  v17[4] = @"enabledFromControlCenterPhone";
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledFromControlCenterPhone"));
  v18[4] = v2;
  v17[5] = @"enabledFromControlCenterWatch";
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledFromControlCenterWatch"));
  v18[5] = v3;
  v17[6] = @"enabledForOneHour";
  v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledForOneHour"));
  v18[6] = v4;
  v17[7] = @"enabledUntilEvening";
  v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledUntilEvening"));
  v18[7] = v5;
  v17[8] = @"enabledUntilMorning";
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledUntilMorning"));
  v18[8] = v6;
  v17[9] = @"enabledAtLocation";
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledAtLocation"));
  v18[9] = v7;
  v17[10] = @"enabledDuringEvent";
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledDuringEvent"));
  v18[10] = v8;
  v17[11] = @"enabledDrivingMode";
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledDrivingMode"));
  v18[11] = v9;
  v17[12] = @"enabledSleepMode";
  v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledSleepMode"));
  v17[13] = @"version";
  v18[12] = v10;
  v18[13] = &unk_1F2A5D8E0;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:14];

  return v11;
}

- (void)_writeMetricsToStore:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  metricsBackingStore = self->_metricsBackingStore;
  id v12 = 0;
  uint64_t v4 = [(DNDSBackingStore *)metricsBackingStore writeRecord:a3 error:&v12];
  id v5 = v12;
  if (v4)
  {
    if (v4 == 1)
    {
      uint64_t v11 = DNDSLogMetrics;
      if (os_log_type_enabled((os_log_t)DNDSLogMetrics, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v14 = v5;
        uint64_t v7 = "Metrics Failed to write store, but error can be ignored; error=%{public}@";
        id v8 = v11;
        uint32_t v9 = 12;
        goto LABEL_11;
      }
    }
    else if (v4 == 2)
    {
      uint64_t v6 = DNDSLogMetrics;
      if (os_log_type_enabled((os_log_t)DNDSLogMetrics, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v7 = "Metrics Wrote out store to file";
        id v8 = v6;
        uint32_t v9 = 2;
LABEL_11:
        _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
  }
  else
  {
    v10 = DNDSLogMetrics;
    if (os_log_type_enabled((os_log_t)DNDSLogMetrics, OS_LOG_TYPE_ERROR)) {
      -[DNDSMetricsManager _writeMetricsToStore:]((uint64_t)v5, v10);
    }
    _DNDSRequestRadar(@"Failed to write store", v5, 0, @"/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/Metrics/DNDSMetricsManager.m", 434);
  }
}

- (id)_metricsDayStringForDate:(id)a3
{
  id v4 = a3;
  id v5 = [(DNDSMetricsManager *)self _dateFormatter];
  [v5 setDateStyle:3];
  [v5 setTimeStyle:0];
  uint64_t v6 = [v5 stringFromDate:v4];

  return v6;
}

- (id)_metricsWeekStringForDate:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", a3);
  id v5 = [(DNDSMetricsManager *)self _startOfWeekWithDate:v4];
  uint64_t v6 = [(DNDSMetricsManager *)self _metricsDayStringForDate:v5];

  return v6;
}

- (id)_metricsMonthStringForDate:(id)a3
{
  id v4 = a3;
  id v5 = [(DNDSMetricsManager *)self _dateFormatter];
  [v5 setLocalizedDateFormatFromTemplate:@"MMMMYYYY"];
  uint64_t v6 = [v5 stringFromDate:v4];

  return v6;
}

- (id)_dateForYesterday
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v3 setDay:-1];
  id v4 = [(DNDSMetricsManager *)self _calendar];
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v6 = [v4 dateByAddingComponents:v3 toDate:v5 options:1];

  return v6;
}

- (id)_startOfWeekWithDate:(id)a3
{
  id v4 = a3;
  id v5 = [(DNDSMetricsManager *)self _calendar];
  uint64_t v6 = [v5 components:540 fromDate:v4];

  objc_msgSend(v6, "setDay:", objc_msgSend(v6, "day") - objc_msgSend(v6, "weekday") + 1);
  uint64_t v7 = [(DNDSMetricsManager *)self _calendar];
  id v8 = [v7 dateFromComponents:v6];

  return v8;
}

- (id)_startOfLastWeek
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [(DNDSMetricsManager *)self _startOfWeekWithDate:v3];

  id v5 = [(DNDSMetricsManager *)self _calendar];
  uint64_t v6 = [v5 components:540 fromDate:v4];

  objc_msgSend(v6, "setDay:", objc_msgSend(v6, "day") - 7);
  uint64_t v7 = [(DNDSMetricsManager *)self _calendar];
  id v8 = [v7 dateFromComponents:v6];

  return v8;
}

- (id)_startOfMonthWithDate:(id)a3
{
  id v4 = a3;
  id v5 = [(DNDSMetricsManager *)self _calendar];
  uint64_t v6 = [v5 components:12 fromDate:v4];

  uint64_t v7 = [(DNDSMetricsManager *)self _calendar];
  id v8 = [v7 dateFromComponents:v6];

  return v8;
}

- (id)_startOfLastMonth
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [(DNDSMetricsManager *)self _startOfMonthWithDate:v3];

  id v5 = [(DNDSMetricsManager *)self _calendar];
  uint64_t v6 = [v5 components:12 fromDate:v4];

  objc_msgSend(v6, "setMonth:", objc_msgSend(v6, "month") - 1);
  uint64_t v7 = [(DNDSMetricsManager *)self _calendar];
  id v8 = [v7 dateFromComponents:v6];

  return v8;
}

- (id)_calendar
{
  return self->_calendar;
}

- (id)_dateFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US"];
  [v2 setLocale:v3];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_metricsRecord, 0);
  objc_storeStrong((id *)&self->_metricsBackingStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_writeMetricsToStore:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3052000, a2, OS_LOG_TYPE_ERROR, "Metrics Failed to write store, will request radar; error=%{public}@",
    (uint8_t *)&v2,
    0xCu);
}

@end