@interface DNDSEventBehaviorResolver
- (BOOL)_isDisconnectedWatch:(unint64_t)a3 inReduceInterruptions:(int64_t)a4;
- (BOOL)_queue_eventSourceIsContact:(id)a3;
- (BOOL)_queue_eventSourceIsContact:(id)a3 inGroupWithIdentifier:(id)a4;
- (BOOL)_queue_eventSourceIsEmergencyContact:(id)a3;
- (BOOL)_queue_eventSourceIsFavorite:(id)a3;
- (BOOL)_queue_eventSourceIsRepeat:(id)a3 clientDetails:(id)a4 date:(id)a5;
- (BOOL)_queue_isBreakthroughAllowedForModeIdentifier:(id)a3 withConfiguration:(id)a4 application:(id)a5 sender:(id)a6 urgency:(unint64_t)a7 eventType:(unint64_t)a8 threadIdentifier:(id)a9 filterCriteria:(id)a10 notifyAnyway:(BOOL)a11 intelligentBehavior:(int64_t)a12 reason:(unint64_t *)a13;
- (BOOL)_queue_isBreakthroughAllowedForSender:(id)a3 eventType:(unint64_t)a4 clientDetails:(id)a5 date:(id)a6 reason:(unint64_t *)a7;
- (BOOL)_queue_shouldAdjustEventBehaviorForMirroring;
- (DNDSEventBehaviorResolver)initWithModeRepository:(id)a3 contactStore:(id)a4 auxiliaryStateMonitor:(id)a5 intelligentBehaviorResolver:(id)a6 IDSLocalService:(id)a7;
- (DNDSEventBehaviorResolverDataSource)dataSource;
- (NSString)sysdiagnoseDataIdentifier;
- (id)_activeModeConfigurationForBehavior:(unint64_t)a3;
- (id)_legacyModeConfigurationForModeConfiguration:(id)a3;
- (id)_queue_adjustEventBehaviorResolutionForAuxiliaryState:(id)a3;
- (id)_queue_firstContactForPredicate:(id)a3;
- (id)_queue_resolutionForModeSemanticType:(int64_t)a3 withConfiguration:(id)a4 eventDetails:(id)a5 clientDetails:(id)a6 state:(id)a7 date:(id)a8 error:(id *)a9;
- (id)_queue_resolveBehaviorForEventDetails:(id)a3 clientDetails:(id)a4 date:(id)a5 error:(id *)a6;
- (id)resolutionForConfiguration:(id)a3 eventDetails:(id)a4 clientDetails:(id)a5 date:(id)a6 error:(id *)a7;
- (id)resolveBehaviorForEventDetails:(id)a3 clientDetails:(id)a4 date:(id)a5 error:(id *)a6;
- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4;
- (unint64_t)_queue_resolveOutcomeForEventSender:(id)a3 clientDetails:(id)a4 date:(id)a5 reason:(unint64_t *)a6;
- (void)dealloc;
- (void)setDataSource:(id)a3;
@end

@implementation DNDSEventBehaviorResolver

- (DNDSEventBehaviorResolver)initWithModeRepository:(id)a3 contactStore:(id)a4 auxiliaryStateMonitor:(id)a5 intelligentBehaviorResolver:(id)a6 IDSLocalService:(id)a7
{
  id v25 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)DNDSEventBehaviorResolver;
  v17 = [(DNDSEventBehaviorResolver *)&v26 init];
  if (v17)
  {
    uint64_t v18 = +[DNDSWorkloop serialQueueTargetingSharedWorkloop:@"com.apple.donotdisturb.EventBehaviorResolutionService"];
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v17->_modeRepository, a3);
    objc_storeStrong((id *)&v17->_contactStore, a4);
    objc_storeStrong((id *)&v17->_auxiliaryStateMonitor, a5);
    objc_storeStrong((id *)&v17->_intelligentBehaviorResolver, a6);
    objc_storeStrong((id *)&v17->_localService, a7);
    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F1B9E8]) initWithContactStore:v17->_contactStore];
    favorites = v17->_favorites;
    v17->_favorites = (CNFavorites *)v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    resolutionRecord = v17->_resolutionRecord;
    v17->_resolutionRecord = v22;

    DNDSRegisterSysdiagnoseDataProvider(v17);
  }

  return v17;
}

- (void)dealloc
{
  DNDSUnregisterSysdiagnoseDataProvider(self);
  v3.receiver = self;
  v3.super_class = (Class)DNDSEventBehaviorResolver;
  [(DNDSEventBehaviorResolver *)&v3 dealloc];
}

- (id)resolveBehaviorForEventDetails:(id)a3 clientDetails:(id)a4 date:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__2;
  v36 = __Block_byref_object_dispose__2;
  id v37 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2;
  v30 = __Block_byref_object_dispose__2;
  id v31 = 0;
  queue = self->_queue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __85__DNDSEventBehaviorResolver_resolveBehaviorForEventDetails_clientDetails_date_error___block_invoke;
  v20[3] = &unk_1E69737E8;
  v24 = &v32;
  v20[4] = self;
  id v14 = v10;
  id v21 = v14;
  id v15 = v11;
  id v22 = v15;
  id v16 = v12;
  id v23 = v16;
  id v25 = &v26;
  dispatch_sync(queue, v20);
  if (a6)
  {
    v17 = (void *)v27[5];
    if (v17) {
      *a6 = v17;
    }
  }
  id v18 = (id)v33[5];

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v18;
}

void __85__DNDSEventBehaviorResolver_resolveBehaviorForEventDetails_clientDetails_date_error___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = *(void *)(a1[9] + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = objc_msgSend(v2, "_queue_resolveBehaviorForEventDetails:clientDetails:date:error:", v3, v4, v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  uint64_t v8 = *(void *)(a1[8] + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (NSString)sysdiagnoseDataIdentifier
{
  return (NSString *)@"com.apple.donotdisturb.EventBehaviorResolver";
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void *)[(NSMutableArray *)self->_resolutionRecord copy];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __61__DNDSEventBehaviorResolver_sysdiagnoseDataForDate_redacted___block_invoke;
  id v14 = &unk_1E6973810;
  id v15 = v5;
  id v7 = v5;
  uint64_t v8 = objc_msgSend(v6, "bs_mapNoNulls:", &v11);
  id v16 = @"resolution-record";
  v17[0] = v8;
  v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1, v11, v12, v13, v14);

  return v9;
}

id __61__DNDSEventBehaviorResolver_sysdiagnoseDataForDate_redacted___block_invoke(uint64_t a1, void *a2)
{
  v17[6] = *MEMORY[0x1E4F143B8];
  v16[0] = @"uuid";
  id v3 = a2;
  uint64_t v4 = [v3 UUID];
  id v5 = [v4 UUIDString];
  v17[0] = v5;
  v16[1] = @"timestamp";
  uint64_t v6 = NSNumber;
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  id v7 = objc_msgSend(v6, "numberWithDouble:");
  v17[1] = v7;
  v16[2] = @"local-date";
  uint64_t v8 = (void *)MEMORY[0x1E4F28C10];
  v9 = [v3 date];
  id v10 = [v8 localizedStringFromDate:v9 dateStyle:1 timeStyle:1];
  void v17[2] = v10;
  v16[3] = @"client-identifier";
  uint64_t v11 = [v3 clientIdentifier];
  v17[3] = v11;
  v16[4] = @"outcome";
  uint64_t v12 = DNDSResolutionOutcomeToString([v3 outcome]);
  v17[4] = v12;
  v16[5] = @"reason";
  [v3 reason];

  id v13 = DNDResolutionReasonToString();
  v17[5] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:6];

  return v14;
}

- (id)_queue_resolveBehaviorForEventDetails:(id)a3 clientDetails:(id)a4 date:(id)a5 error:(id *)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v13 = [(DNDSEventBehaviorResolver *)self dataSource];
  id v14 = [v13 currentStateForEventBehaviorResolver:self];
  if ([v14 isActive])
  {
    id v15 = -[DNDSEventBehaviorResolver _activeModeConfigurationForBehavior:](self, "_activeModeConfigurationForBehavior:", [v10 behavior]);
    id v16 = (void *)DNDSLogResolver;
    if (v15)
    {
      id v37 = v11;
      if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v16;
        id v18 = [v15 mode];
        v19 = [v18 identifier];
        *(_DWORD *)buf = 138543362;
        uint64_t v41 = (uint64_t)v19;
        _os_log_impl(&dword_1D3052000, v17, OS_LOG_TYPE_DEFAULT, "Resolving breakthrough for active mode: %{public}@.", buf, 0xCu);
      }
      uint64_t v20 = [v15 mode];
      uint64_t v21 = [v20 semanticType];
      id v22 = [v15 configuration];
      id v23 = [(DNDSEventBehaviorResolver *)self _queue_resolutionForModeSemanticType:v21 withConfiguration:v22 eventDetails:v10 clientDetails:v37 state:v14 date:v12 error:a6];

      id v11 = v37;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_ERROR)) {
        -[DNDSEventBehaviorResolver _queue_resolveBehaviorForEventDetails:clientDetails:date:error:](v16, v14);
      }
      id v23 = 0;
    }
  }
  else
  {
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F5F5B0]) initWithEventDetails:v10 interruptionSuppression:0 intelligentBehavior:0 resolutionReason:2 activeModeUUID:0];
    id v25 = [v11 clientIdentifier];
    id v23 = +[DNDSEventBehaviorResolution resolutionForDate:v12 eventBehavior:v24 clientIdentifier:v25 outcome:1 reason:2];
  }
  uint64_t v26 = [(DNDSEventBehaviorResolver *)self _queue_adjustEventBehaviorResolutionForAuxiliaryState:v23];

  if (v26)
  {
    v27 = DNDSLogResolver;
    if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v41 = (uint64_t)v26;
      _os_log_impl(&dword_1D3052000, v27, OS_LOG_TYPE_DEFAULT, "Event was resolved: resolution=%@", buf, 0xCu);
    }
    [(NSMutableArray *)self->_resolutionRecord addObject:v26];
    if ((unint64_t)[(NSMutableArray *)self->_resolutionRecord count] >= 0x15)
    {
      uint64_t v28 = [(NSMutableArray *)self->_resolutionRecord count];
      v29 = [v12 dateByAddingTimeInterval:-180.0];
      v30 = (void *)MEMORY[0x1E4F28F60];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __92__DNDSEventBehaviorResolver__queue_resolveBehaviorForEventDetails_clientDetails_date_error___block_invoke;
      v38[3] = &unk_1E6973838;
      id v31 = v29;
      id v39 = v31;
      uint64_t v32 = [v30 predicateWithBlock:v38];
      [(NSMutableArray *)self->_resolutionRecord filterUsingPredicate:v32];
      uint64_t v33 = v28 - [(NSMutableArray *)self->_resolutionRecord count];
      if (v33)
      {
        uint64_t v34 = DNDSLogResolver;
        if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v41 = v33;
          _os_log_impl(&dword_1D3052000, v34, OS_LOG_TYPE_DEFAULT, "Pruned %lu resolutions from record", buf, 0xCu);
        }
      }
    }
  }
  v35 = [v26 eventBehavior];

  return v35;
}

BOOL __92__DNDSEventBehaviorResolver__queue_resolveBehaviorForEventDetails_clientDetails_date_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 date];
  BOOL v4 = [v2 compare:v3] != 1;

  return v4;
}

- (id)_queue_adjustEventBehaviorResolutionForAuxiliaryState:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 eventBehavior];
    if ([v6 interruptionSuppression])
    {
    }
    else
    {
      BOOL v7 = [(DNDSEventBehaviorResolver *)self _queue_shouldAdjustEventBehaviorForMirroring];

      if (v7)
      {
        BOOL v8 = [(DNDSAuxiliaryStateMonitor *)self->_auxiliaryStateMonitor isScreenShared];
        BOOL v9 = [(DNDSAuxiliaryStateMonitor *)self->_auxiliaryStateMonitor isScreenMirrored];
        BOOL v10 = [(DNDSAuxiliaryStateMonitor *)self->_auxiliaryStateMonitor isPresentationModeEnabled];
        BOOL v11 = v10;
        if (v9 || v8 || v10)
        {
          uint64_t v12 = 23;
          if (!v10) {
            uint64_t v12 = 0;
          }
          if (v8) {
            uint64_t v12 = 22;
          }
          if (v9) {
            uint64_t v13 = 21;
          }
          else {
            uint64_t v13 = v12;
          }
          id v14 = [v5 eventBehavior];
          id v15 = objc_alloc(MEMORY[0x1E4F5F5B0]);
          id v16 = [v14 eventDetails];
          v17 = [v14 activeModeUUID];
          id v18 = (void *)[v15 initWithEventDetails:v16 interruptionSuppression:1 intelligentBehavior:3 resolutionReason:v13 activeModeUUID:v17];

          v19 = [v5 date];
          uint64_t v20 = [v5 clientIdentifier];
          uint64_t v21 = +[DNDSEventBehaviorResolution resolutionForDate:v19 eventBehavior:v18 clientIdentifier:v20 outcome:2 reason:v13];

          id v22 = DNDSLogResolver;
          if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
          {
            v24[0] = 67109632;
            v24[1] = v9;
            __int16 v25 = 1024;
            BOOL v26 = v8;
            __int16 v27 = 1024;
            BOOL v28 = v11;
            _os_log_impl(&dword_1D3052000, v22, OS_LOG_TYPE_DEFAULT, "Resolution modified to accomodate auxiliary state; isScreenMirrored=%d isScreenShared=%d isPresentationModeEnabled=%d",
              (uint8_t *)v24,
              0x14u);
          }

          id v5 = (void *)v21;
        }
      }
    }
  }
  return v5;
}

- (id)_activeModeConfigurationForBehavior:(unint64_t)a3
{
  id v5 = [(DNDSEventBehaviorResolver *)self dataSource];
  uint64_t v6 = [v5 currentStateForEventBehaviorResolver:self];

  BOOL v7 = [v6 activeModeConfiguration];
  if (a3 == 1)
  {
    uint64_t v8 = [(DNDSEventBehaviorResolver *)self _legacyModeConfigurationForModeConfiguration:v7];

    BOOL v7 = (void *)v8;
  }

  return v7;
}

- (id)_legacyModeConfigurationForModeConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[v3 mutableCopy];
  id v5 = [MEMORY[0x1E4F5F6E8] defaultConfiguration];
  uint64_t v6 = objc_opt_new();
  BOOL v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = [v3 configuration];

  BOOL v9 = [v8 senderConfiguration];
  BOOL v10 = [v9 phoneCallBypassSettings];
  [v7 setPhoneCallBypassSettings:v10];

  [v5 setSenderConfiguration:v7];
  [v5 setMinimumBreakthroughUrgency:0];
  [v4 setConfiguration:v5];

  return v4;
}

- (id)_queue_resolutionForModeSemanticType:(int64_t)a3 withConfiguration:(id)a4 eventDetails:(id)a5 clientDetails:(id)a6 state:(id)a7 date:(id)a8 error:(id *)a9
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v16 = a5;
  id v59 = a6;
  id v60 = a7;
  id v17 = a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v61 = [v16 bundleIdentifier];
  v62 = [v16 sender];
  uint64_t v18 = [v16 urgency];
  uint64_t v19 = [v16 type];
  v58 = [v16 threadIdentifier];
  v57 = [v16 filterCriteria];
  if ([v16 behavior] == 1) {
    char v20 = 0;
  }
  else {
    char v20 = [v16 notifyAnyway];
  }
  uint64_t v21 = [v16 platform];
  if (!v21) {
    uint64_t v21 = DNDPlatformForCurrentDevice();
  }
  if ([(DNDSEventBehaviorResolver *)self _isDisconnectedWatch:v21 inReduceInterruptions:a3])
  {
    id v22 = (void *)[objc_alloc(MEMORY[0x1E4F5F5B0]) initWithEventDetails:v16 interruptionSuppression:0 intelligentBehavior:0 resolutionReason:2 activeModeUUID:0];
    id v23 = v59;
    v24 = [v59 clientIdentifier];
    __int16 v25 = +[DNDSEventBehaviorResolution resolutionForDate:v17 eventBehavior:v22 clientIdentifier:v24 outcome:1 reason:2];

    BOOL v26 = v60;
    goto LABEL_49;
  }
  v56 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:v61 platform:v21];
  __int16 v27 = +[DNDSServerDomain rootSettings];
  uint64_t v28 = [v27 forcedIntelligentBreakthrough];

  if (v28)
  {
    if (v28 == 1) {
      uint64_t v29 = 2;
    }
    else {
      uint64_t v29 = 3;
    }
  }
  else
  {
    if (_os_feature_enabled_impl())
    {
      v30 = v60;
      if ([v15 allowIntelligentManagement] == 2
        && (intelligentBehaviorResolver = self->_intelligentBehaviorResolver) != 0)
      {
        uint64_t v29 = [(DNDSIntelligentBehaviorResolver *)intelligentBehaviorResolver intelligentInterruptionBehaviorForClientEventDetails:v16];
      }
      else
      {
        uint64_t v29 = 0;
      }
      goto LABEL_18;
    }
    uint64_t v29 = 0;
  }
  v30 = v60;
LABEL_18:
  uint64_t v64 = 0;
  uint64_t v32 = [v30 activeModeIdentifier];
  LOBYTE(v55) = v20;
  BOOL v33 = [(DNDSEventBehaviorResolver *)self _queue_isBreakthroughAllowedForModeIdentifier:v32 withConfiguration:v15 application:v56 sender:v62 urgency:v18 eventType:v19 threadIdentifier:v58 filterCriteria:v57 notifyAnyway:v55 intelligentBehavior:v29 reason:&v64];

  if (v64 != 26 && (v29 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    uint64_t v35 = 0;
  }
  else {
    uint64_t v35 = v29;
  }
  v36 = (void *)DNDSLogResolver;
  if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
  {
    id v37 = v36;
    DNDIntelligentInterruptionBehaviorToString();
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v66 = v38;
    __int16 v67 = 2112;
    id v68 = v16;
    _os_log_impl(&dword_1D3052000, v37, OS_LOG_TYPE_DEFAULT, "Intelligent Resolver behavior: %@ for clientEventDetails: %@", buf, 0x16u);
  }
  id v39 = DNDSLogResolver;
  if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
  {
    if (v33) {
      v40 = @"is";
    }
    else {
      v40 = @"is NOT";
    }
    *(_DWORD *)buf = 138543874;
    v66 = v40;
    __int16 v67 = 2112;
    id v68 = v15;
    __int16 v69 = 2112;
    id v70 = v16;
    _os_log_impl(&dword_1D3052000, v39, OS_LOG_TYPE_DEFAULT, "Breakthrough %{public}@ allowed for configuration %@ with event details: %@.", buf, 0x20u);
  }
  uint64_t v63 = 0;
  BOOL v41 = [(DNDSEventBehaviorResolver *)self _queue_isBreakthroughAllowedForSender:v62 eventType:v19 clientDetails:v59 date:v17 reason:&v63];
  uint64_t v42 = DNDSLogResolver;
  if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
  {
    v43 = @"is";
    if (!v41) {
      v43 = @"is NOT";
    }
    *(_DWORD *)buf = 138543618;
    v66 = v43;
    __int16 v67 = 2112;
    id v68 = v16;
    _os_log_impl(&dword_1D3052000, v42, OS_LOG_TYPE_DEFAULT, "Breakthrough %{public}@ allowed for global settings with event details: %@.", buf, 0x16u);
  }
  int v44 = v33 || v41;
  uint64_t v45 = v63;
  if (!v41) {
    uint64_t v45 = v64;
  }
  if (v33) {
    uint64_t v46 = v64;
  }
  else {
    uint64_t v46 = v45;
  }
  if (v44) {
    uint64_t v47 = 1;
  }
  else {
    uint64_t v47 = 2;
  }
  if (v44)
  {
    uint64_t v48 = v35;
    uint64_t v49 = 0;
  }
  else
  {
    uint64_t v48 = v35;
    if ([v61 isEqualToString:@"com.apple.cmas"]) {
      uint64_t v49 = 1;
    }
    else {
      uint64_t v49 = [v15 suppressionType];
    }
  }
  id v50 = objc_alloc(MEMORY[0x1E4F5F5B0]);
  BOOL v26 = v60;
  v51 = [v60 activeModeUUID];
  v52 = (void *)[v50 initWithEventDetails:v16 interruptionSuppression:v49 intelligentBehavior:v48 resolutionReason:v46 activeModeUUID:v51];

  id v23 = v59;
  v53 = [v59 clientIdentifier];
  __int16 v25 = +[DNDSEventBehaviorResolution resolutionForDate:v17 eventBehavior:v52 clientIdentifier:v53 outcome:v47 reason:v46];

LABEL_49:
  return v25;
}

- (BOOL)_isDisconnectedWatch:(unint64_t)a3 inReduceInterruptions:(int64_t)a4
{
  BOOL result = 0;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3 == 3 && a4 == 9)
  {
    uint64_t v6 = [(IDSService *)self->_localService devices];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      char v9 = 0;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v12 deviceType] == 2
            && [v12 isLocallyPaired]
            && ([v12 isNearby] & 1) == 0
            && ![v12 isConnected])
          {
            char v9 = 1;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
    else
    {
      char v9 = 0;
    }

    return v9 & 1;
  }
  return result;
}

- (unint64_t)_queue_resolveOutcomeForEventSender:(id)a3 clientDetails:(id)a4 date:(id)a5 reason:(unint64_t *)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = [(DNDSEventBehaviorResolver *)self dataSource];
  long long v14 = [v11 clientIdentifier];
  long long v15 = [v13 eventBehaviorResolver:self bypassSettingsForClientIdentifier:v14];

  long long v16 = DNDSLogResolver;
  if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v15;
    _os_log_impl(&dword_1D3052000, v16, OS_LOG_TYPE_DEFAULT, "Got bypass settings: settings=%{public}@", buf, 0xCu);
  }
  int v17 = [v10 isPopulated];
  if (v15)
  {
    int v18 = v17;
    [v15 immediateBypassEventSourceType];
    __int16 v27 = a6;
    unint64_t v19 = DNDResolvedImmediateBypassEventSourceType();
    switch(v19)
    {
      case 1uLL:
        char v20 = 1;
        uint64_t v21 = 5;
        break;
      case 2uLL:
        char v20 = 0;
        uint64_t v21 = 6;
        break;
      case 3uLL:
        if (!v18
          || ![(DNDSEventBehaviorResolver *)self _queue_eventSourceIsFavorite:v10])
        {
          goto LABEL_18;
        }
        char v20 = 1;
        uint64_t v21 = 7;
        unint64_t v19 = 1;
        break;
      case 4uLL:
        if (!v18
          || ![(DNDSEventBehaviorResolver *)self _queue_eventSourceIsContact:v10])
        {
          goto LABEL_18;
        }
        unint64_t v19 = 1;
        uint64_t v21 = 8;
        goto LABEL_17;
      case 5uLL:
        if (!v18) {
          goto LABEL_18;
        }
        id v22 = [v15 immediateBypassCNGroupIdentifier];
        BOOL v23 = [(DNDSEventBehaviorResolver *)self _queue_eventSourceIsContact:v10 inGroupWithIdentifier:v22];

        if (!v23) {
          goto LABEL_18;
        }
        unint64_t v19 = 1;
        uint64_t v21 = 9;
LABEL_17:
        char v20 = 1;
        break;
      default:
LABEL_18:
        uint64_t v21 = 0;
        char v20 = 0;
        unint64_t v19 = 0;
        break;
    }
    [v15 repeatEventSourceBehaviorEnabledSetting];
    uint64_t v24 = DNDResolvedRepeatEventSourceBehaviorEnabledSetting();
    if ((v20 & 1) == 0
      && v24 == 2
      && ((v18 ^ 1) & 1) == 0
      && [(DNDSEventBehaviorResolver *)self _queue_eventSourceIsRepeat:v10 clientDetails:v11 date:v12])
    {
      uint64_t v21 = 10;
      unint64_t v19 = 1;
    }
    if (v19 == 1) {
      int v25 = 0;
    }
    else {
      int v25 = v18;
    }
    if (v25 == 1
      && [(DNDSEventBehaviorResolver *)self _queue_eventSourceIsEmergencyContact:v10])
    {
      uint64_t v21 = 11;
      unint64_t v19 = 1;
LABEL_31:
      unint64_t *v27 = v21;
      goto LABEL_32;
    }
    if (v19) {
      goto LABEL_31;
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
LABEL_32:

  return v19;
}

- (BOOL)_queue_eventSourceIsFavorite:(id)a3
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  id v5 = objc_alloc(MEMORY[0x1E4F1B908]);
  uint64_t v6 = *MEMORY[0x1E4F1AE88];
  v27[0] = *MEMORY[0x1E4F1AE08];
  v27[1] = v6;
  v27[2] = *MEMORY[0x1E4F1AEE0];
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
  uint64_t v8 = (void *)[v5 initWithKeysToFetch:v7];

  char v9 = objc_msgSend(MEMORY[0x1E4F1B8F8], "dnds_predicateForContactsMatchingEventSender:", v4);
  [v8 setPredicate:v9];

  [v8 setUnifyResults:1];
  contactStore = self->_contactStore;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __58__DNDSEventBehaviorResolver__queue_eventSourceIsFavorite___block_invoke;
  v17[3] = &unk_1E6973888;
  v17[5] = &v19;
  id v18 = 0;
  v17[4] = self;
  BOOL v11 = [(CNContactStore *)contactStore enumerateContactsWithFetchRequest:v8 error:&v18 usingBlock:v17];
  id v12 = v18;
  long long v13 = DNDSLogResolver;
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = *((unsigned __int8 *)v20 + 24);
      *(_DWORD *)buf = 138543618;
      id v24 = v4;
      __int16 v25 = 1024;
      int v26 = v14;
      _os_log_impl(&dword_1D3052000, v13, OS_LOG_TYPE_DEFAULT, "Checked if event source is a favorite: source=%{public}@, favorite=%{BOOL}d", buf, 0x12u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_ERROR))
  {
    -[DNDSEventBehaviorResolver _queue_eventSourceIsFavorite:]();
  }
  BOOL v15 = *((unsigned char *)v20 + 24) != 0;

  _Block_object_dispose(&v19, 8);
  return v15;
}

void __58__DNDSEventBehaviorResolver__queue_eventSourceIsFavorite___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([v5 isUnified])
  {
    uint64_t v6 = [v5 linkedContacts];
  }
  else
  {
    v9[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  uint64_t v7 = v6;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__DNDSEventBehaviorResolver__queue_eventSourceIsFavorite___block_invoke_2;
  v8[3] = &unk_1E6973860;
  v8[4] = *(void *)(a1 + 32);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "bs_containsObjectPassingTest:", v8);
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

BOOL __58__DNDSEventBehaviorResolver__queue_eventSourceIsFavorite___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 56) entriesForContact:a2];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)_queue_eventSourceIsContact:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = objc_alloc(MEMORY[0x1E4F1B908]);
  v26[0] = *MEMORY[0x1E4F1AEE0];
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  uint64_t v7 = (void *)[v5 initWithKeysToFetch:v6];

  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1B8F8], "dnds_predicateForContactsMatchingEventSender:", v4);
  [v7 setPredicate:v8];

  [v7 setUnifyResults:0];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  contactStore = self->_contactStore;
  v16[4] = &v18;
  id v17 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__DNDSEventBehaviorResolver__queue_eventSourceIsContact___block_invoke;
  v16[3] = &unk_1E69738B0;
  BOOL v10 = [(CNContactStore *)contactStore enumerateContactsWithFetchRequest:v7 error:&v17 usingBlock:v16];
  id v11 = v17;
  id v12 = DNDSLogResolver;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = *((unsigned __int8 *)v19 + 24);
      *(_DWORD *)buf = 138543618;
      id v23 = v4;
      __int16 v24 = 1024;
      int v25 = v13;
      _os_log_impl(&dword_1D3052000, v12, OS_LOG_TYPE_DEFAULT, "Checked if event source is a contact: source=%{public}@, contact=%{BOOL}d", buf, 0x12u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_ERROR))
  {
    -[DNDSEventBehaviorResolver _queue_eventSourceIsContact:]();
  }
  BOOL v14 = *((unsigned char *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v14;
}

uint64_t __57__DNDSEventBehaviorResolver__queue_eventSourceIsContact___block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a3 = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  return result;
}

- (BOOL)_queue_eventSourceIsContact:(id)a3 inGroupWithIdentifier:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v6 isPopulated])
  {
    contactStore = self->_contactStore;
    char v9 = [MEMORY[0x1E4F1B8F8] predicateForContactsInGroupWithIdentifier:v7];
    uint64_t v11 = *MEMORY[0x1E4F1AE88];
    v42[0] = *MEMORY[0x1E4F1AE08];
    uint64_t v10 = v42[0];
    v42[1] = v11;
    uint64_t v43 = *MEMORY[0x1E4F1AEE0];
    uint64_t v12 = v43;
    int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:3];
    BOOL v14 = [(CNContactStore *)contactStore unifiedContactsMatchingPredicate:v9 keysToFetch:v13 error:0];

    BOOL v15 = objc_msgSend(v14, "bs_mapNoNulls:", &__block_literal_global_2);
    long long v16 = objc_msgSend(v15, "bs_flatten");

    id v17 = objc_alloc(MEMORY[0x1E4F1B908]);
    v41[0] = v10;
    v41[1] = v12;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
    uint64_t v19 = (void *)[v17 initWithKeysToFetch:v18];

    uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1B8F8], "dnds_predicateForContactsMatchingEventSender:", v6);
    [v19 setPredicate:v20];

    [v19 setUnifyResults:0];
    uint64_t v33 = 0;
    uint64_t v34 = &v33;
    uint64_t v35 = 0x2020000000;
    char v36 = 0;
    char v21 = self->_contactStore;
    id v31 = &v33;
    id v32 = 0;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __79__DNDSEventBehaviorResolver__queue_eventSourceIsContact_inGroupWithIdentifier___block_invoke_2;
    v29[3] = &unk_1E6973888;
    id v22 = v16;
    id v30 = v22;
    BOOL v23 = [(CNContactStore *)v21 enumerateContactsWithFetchRequest:v19 error:&v32 usingBlock:v29];
    id v24 = v32;
    int v25 = DNDSLogResolver;
    if (v23)
    {
      if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = *((unsigned __int8 *)v34 + 24);
        *(_DWORD *)buf = 138543618;
        id v38 = v6;
        __int16 v39 = 1024;
        int v40 = v26;
        _os_log_impl(&dword_1D3052000, v25, OS_LOG_TYPE_DEFAULT, "Checked if event source is a group contact: source=%{public}@, contact=%{BOOL}d", buf, 0x12u);
      }
    }
    else if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_ERROR))
    {
      -[DNDSEventBehaviorResolver _queue_eventSourceIsContact:inGroupWithIdentifier:]();
    }
    BOOL v27 = *((unsigned char *)v34 + 24) != 0;

    _Block_object_dispose(&v33, 8);
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

id __79__DNDSEventBehaviorResolver__queue_eventSourceIsContact_inGroupWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 isUnified])
  {
    uint64_t v3 = [v2 linkedContacts];
  }
  else
  {
    v6[0] = v2;
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  id v4 = (void *)v3;

  return v4;
}

void __79__DNDSEventBehaviorResolver__queue_eventSourceIsContact_inGroupWithIdentifier___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__DNDSEventBehaviorResolver__queue_eventSourceIsContact_inGroupWithIdentifier___block_invoke_3;
  v8[3] = &unk_1E6973860;
  id v9 = v5;
  id v7 = v5;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "bs_containsObjectPassingTest:", v8);
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

uint64_t __79__DNDSEventBehaviorResolver__queue_eventSourceIsContact_inGroupWithIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (BOOL)_queue_eventSourceIsRepeat:(id)a3 clientDetails:(id)a4 date:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v8 isPopulated])
  {
    uint64_t v11 = [v10 dateByAddingTimeInterval:-180.0];
    resolutionRecord = self->_resolutionRecord;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __75__DNDSEventBehaviorResolver__queue_eventSourceIsRepeat_clientDetails_date___block_invoke;
    v18[3] = &unk_1E69738F8;
    id v13 = v11;
    id v19 = v13;
    id v20 = v9;
    id v14 = v8;
    id v21 = v14;
    int v15 = [(NSMutableArray *)resolutionRecord bs_containsObjectPassingTest:v18];
    long long v16 = DNDSLogResolver;
    if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v23 = v14;
      __int16 v24 = 1024;
      int v25 = v15;
      _os_log_impl(&dword_1D3052000, v16, OS_LOG_TYPE_DEFAULT, "Checked if event source is a repeat: source=%{public}@, repeat=%{BOOL}d", buf, 0x12u);
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

uint64_t __75__DNDSEventBehaviorResolver__queue_eventSourceIsRepeat_clientDetails_date___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v4 date];
  uint64_t v6 = [v3 compare:v5];

  id v7 = [v4 clientIdentifier];
  id v8 = [*(id *)(a1 + 40) clientIdentifier];
  int v9 = [v7 isEqualToString:v8];

  id v10 = [v4 eventBehavior];

  uint64_t v11 = [v10 eventDetails];
  uint64_t v12 = [v11 sender];
  unsigned int v13 = [v12 isEqual:*(void *)(a1 + 48)];

  if (v6 == 1) {
    int v14 = 0;
  }
  else {
    int v14 = v9;
  }
  return v14 & v13;
}

- (BOOL)_queue_eventSourceIsEmergencyContact:(id)a3
{
  v28[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v4 isPopulated])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1B908]);
    uint64_t v6 = *MEMORY[0x1E4F1AE88];
    v28[0] = *MEMORY[0x1E4F1AE08];
    v28[1] = v6;
    uint64_t v7 = *MEMORY[0x1E4F1AEE0];
    v28[2] = *MEMORY[0x1E4F1ADA0];
    v28[3] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
    int v9 = (void *)[v5 initWithKeysToFetch:v8];

    id v10 = objc_msgSend(MEMORY[0x1E4F1B8F8], "dnds_predicateForContactsMatchingEventSender:", v4);
    [v9 setPredicate:v10];

    [v9 setUnifyResults:1];
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    contactStore = self->_contactStore;
    void v18[4] = &v20;
    id v19 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __66__DNDSEventBehaviorResolver__queue_eventSourceIsEmergencyContact___block_invoke;
    v18[3] = &unk_1E69738B0;
    BOOL v12 = [(CNContactStore *)contactStore enumerateContactsWithFetchRequest:v9 error:&v19 usingBlock:v18];
    id v13 = v19;
    int v14 = DNDSLogResolver;
    if (v12)
    {
      if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = *((unsigned __int8 *)v21 + 24);
        *(_DWORD *)buf = 138543618;
        id v25 = v4;
        __int16 v26 = 1024;
        int v27 = v15;
        _os_log_impl(&dword_1D3052000, v14, OS_LOG_TYPE_DEFAULT, "Checked if event source is an emergency contact: source=%{public}@, emergencyContact=%{BOOL}d", buf, 0x12u);
      }
    }
    else if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_ERROR))
    {
      -[DNDSEventBehaviorResolver _queue_eventSourceIsEmergencyContact:]();
    }
    BOOL v16 = *((unsigned char *)v21 + 24) != 0;

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

void __66__DNDSEventBehaviorResolver__queue_eventSourceIsEmergencyContact___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([v5 isUnified])
  {
    uint64_t v6 = [v5 linkedContacts];
  }
  else
  {
    v8[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  uint64_t v7 = v6;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "bs_containsObjectPassingTest:", &__block_literal_global_69);
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

uint64_t __66__DNDSEventBehaviorResolver__queue_eventSourceIsEmergencyContact___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 callAlert];
  uint64_t v3 = [v2 ignoreMute];

  return v3;
}

- (BOOL)_queue_isBreakthroughAllowedForModeIdentifier:(id)a3 withConfiguration:(id)a4 application:(id)a5 sender:(id)a6 urgency:(unint64_t)a7 eventType:(unint64_t)a8 threadIdentifier:(id)a9 filterCriteria:(id)a10 notifyAnyway:(BOOL)a11 intelligentBehavior:(int64_t)a12 reason:(unint64_t *)a13
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v105 = a3;
  id v111 = a4;
  id v18 = a5;
  id v19 = a6;
  id v107 = a9;
  id v106 = a10;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v20 = [v18 platform];
  if (v20 != DNDPlatformForCurrentDevice())
  {
    id v21 = (void *)MEMORY[0x1D9430630]();
    uint64_t v22 = objc_alloc_init(DNDSApplicationIdentifierMapper);
    uint64_t v23 = [(DNDSApplicationIdentifierMapper *)v22 applicationIdentifierForTargetPlatform:DNDPlatformForCurrentDevice() withSourceApplicationIdentifier:v18];

    id v18 = (id)v23;
  }
  v110 = [v18 bundleID];
  v109 = [(DNDSEventBehaviorResolver *)self dataSource];
  unsigned __int8 v102 = [v109 eventBehaviorResolver:self isAvailabilityActiveForBundleIdentifier:v110];
  if (!v19)
  {
    __int16 v24 = 0;
    goto LABEL_16;
  }
  __int16 v24 = (void *)[v19 mutableCopy];
  id v25 = objc_msgSend(MEMORY[0x1E4F1B8F8], "dnds_predicateForContactsMatchingEventSender:", v19);
  __int16 v26 = [(DNDSEventBehaviorResolver *)self _queue_firstContactForPredicate:v25];
  int v27 = [v26 identifier];

  uint64_t v28 = [v19 contactIdentifier];

  if (!v28)
  {
    uint64_t v31 = DNDSLogResolver;
    if (!os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 138543618;
    id v126 = v27;
    __int16 v127 = 2112;
    id v128 = v19;
    uint64_t v33 = "Filled out missing contact identifier: %{public}@ from sender: %@ to determine breakthrough.";
LABEL_13:
    uint64_t v34 = v31;
    uint32_t v35 = 22;
    goto LABEL_14;
  }
  uint64_t v29 = [v19 contactIdentifier];
  char v30 = [v29 isEqualToString:v27];

  uint64_t v31 = DNDSLogResolver;
  BOOL v32 = os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT);
  if ((v30 & 1) == 0)
  {
    if (!v32) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 138543618;
    id v126 = v27;
    __int16 v127 = 2112;
    id v128 = v19;
    uint64_t v33 = "Updated contact identifier to %{public}@ from sender: %@ to determine breakthrough.";
    goto LABEL_13;
  }
  if (v32)
  {
    *(_DWORD *)buf = 138412290;
    id v126 = v19;
    uint64_t v33 = "No change to contact identifier from sender: %@ to determine breakthrough.";
    uint64_t v34 = v31;
    uint32_t v35 = 12;
LABEL_14:
    _os_log_impl(&dword_1D3052000, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
  }
LABEL_15:
  [v24 setContactIdentifier:v27];

LABEL_16:
  char v36 = (void *)DNDSLogResolver;
  if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
  {
    id v37 = v36;
    id v38 = DNDStringFromClientEventUrgency();
    __int16 v39 = DNDStringFromClientEventType();
    *(_DWORD *)buf = 138413570;
    id v126 = v111;
    __int16 v127 = 2114;
    id v128 = v110;
    __int16 v129 = 2112;
    id v130 = v24;
    __int16 v131 = 2114;
    v132 = v38;
    __int16 v133 = 2114;
    v134 = v39;
    __int16 v135 = 2114;
    id v136 = v107;
    _os_log_impl(&dword_1D3052000, v37, OS_LOG_TYPE_DEFAULT, "Resolving breakthrough through for configuration: %@ with event details application: %{public}@, sender: %@, urgency: %{public}@, eventType: %{public}@, threadIdentifier: %{public}@", buf, 0x3Eu);
  }
  unint64_t v40 = a8 - 1;
  BOOL v41 = a8 - 1 < 4;
  int v42 = [v24 isPopulated];
  if (a8 - 1 < 4)
  {
    if (v107) {
      BOOL v41 = 1;
    }
    else {
      BOOL v41 = v42;
    }
  }
  if ([v111 suppressionMode] == 2
    && [v109 currentUILockStateForEventBehaviorResolver:self] == 1)
  {
    uint64_t v43 = DNDSLogResolver;
    if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v43, OS_LOG_TYPE_INFO, "Allowing breakthrough because the device is unlocked", buf, 2u);
    }
    *a13 = 3;
    char v44 = 1;
    goto LABEL_159;
  }
  uint64_t v45 = [v18 bundleID];

  if (!v45) {
    goto LABEL_31;
  }
  v108 = [v109 eventBehaviorResolver:self appPredicateForApplicationIdentifier:v18 modeIdentifier:v105];
  if (!v108)
  {
    if ([v18 platform] == 3)
    {
      uint64_t v46 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:v110 platform:1];
      v108 = [v109 eventBehaviorResolver:self appPredicateForApplicationIdentifier:v46 modeIdentifier:v105];

      goto LABEL_32;
    }
LABEL_31:
    v108 = 0;
  }
LABEL_32:
  uint64_t v47 = (void *)MEMORY[0x1D9430630]();
  id v122 = 0;
  uint64_t v48 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v110 allowPlaceholder:1 error:&v122];
  id v49 = v122;
  if (v49)
  {
    id v50 = (void *)DNDSLogResolver;
    if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_ERROR)) {
      -[DNDSEventBehaviorResolver _queue_isBreakthroughAllowedForModeIdentifier:withConfiguration:application:sender:urgency:eventType:threadIdentifier:filterCriteria:notifyAnyway:intelligentBehavior:reason:]((uint64_t)v110, v50, v49);
    }
  }
  if (v48 && [v48 isWebApp])
  {
    v51 = [v48 localizedName];
    v52 = [v48 infoDictionary];
    v53 = [v52 objectForKey:@"WKPushBundleMetadata" ofClass:objc_opt_class()];

    uint64_t v54 = [v53 objectForKey:@"manifestId"];
    uint64_t v55 = (void *)v54;
    v103 = 0;
    if (v51 && v54) {
      v103 = (void *)[objc_alloc(MEMORY[0x1E4F5F778]) initWithWebIdentifier:v54 givenName:v51];
    }
  }
  else
  {
    v103 = 0;
  }

  if (v41)
  {
    v101 = [MEMORY[0x1E4F1CAD0] setWithArray:MEMORY[0x1E4F1CBF0]];
    if (v40 >= 4)
    {
      id v100 = v101;
    }
    else
    {
      id v100 = [v111 contactsWithExceptions];
    }
    uint64_t v62 = [v111 applicationConfigurationType];
    uint64_t v63 = [v111 senderConfigurationType];
    if (v62)
    {
      if (v62 != 2)
      {
        if (v62 != 1)
        {
          uint64_t v97 = 0;
          uint64_t v98 = 0;
          int v96 = 0;
          int v99 = 0;
          goto LABEL_75;
        }
        if ([v111 exceptionForApplicationIdentifier:v18] == 1)
        {
          int v99 = 0;
          uint64_t v97 = 0x100000000;
          uint64_t v98 = 13;
          int v96 = 1;
LABEL_75:
          uint64_t v65 = [v111 senderConfigurationType];
          if (v65)
          {
            if (v65 == 2)
            {
              int v76 = 0;
              LODWORD(v67) = 0;
              int v77 = 0;
              int v71 = 1;
              uint64_t v69 = 12;
            }
            else if (v65 == 1)
            {
              long long v120 = 0u;
              long long v121 = 0u;
              long long v118 = 0u;
              long long v119 = 0u;
              id v66 = v100;
              uint64_t v67 = [v66 countByEnumeratingWithState:&v118 objects:v124 count:16];
              if (v67)
              {
                uint64_t v68 = *(void *)v119;
                uint64_t v69 = 18;
                while (2)
                {
                  for (uint64_t i = 0; i != v67; ++i)
                  {
                    if (*(void *)v119 != v68) {
                      objc_enumerationMutation(v66);
                    }
                    if ([*(id *)(*((void *)&v118 + 1) + 8 * i) matchesContactHandle:v24])
                    {
                      int v71 = 0;
                      LODWORD(v67) = 1;
                      goto LABEL_99;
                    }
                  }
                  uint64_t v67 = [v66 countByEnumeratingWithState:&v118 objects:v124 count:16];
                  if (v67) {
                    continue;
                  }
                  break;
                }
              }
              int v71 = 1;
              uint64_t v69 = 12;
LABEL_99:

              int v76 = 0;
              int v77 = v67;
            }
            else
            {
              int v76 = 0;
              LODWORD(v67) = 0;
              int v77 = 0;
              int v71 = 0;
              uint64_t v69 = 0;
            }
          }
          else
          {
            long long v116 = 0u;
            long long v117 = 0u;
            long long v114 = 0u;
            long long v115 = 0u;
            id v72 = v100;
            uint64_t v73 = [v72 countByEnumeratingWithState:&v114 objects:v123 count:16];
            if (v73)
            {
              uint64_t v74 = *(void *)v115;
              uint64_t v69 = 18;
              while (2)
              {
                for (uint64_t j = 0; j != v73; ++j)
                {
                  if (*(void *)v115 != v74) {
                    objc_enumerationMutation(v72);
                  }
                  if ([*(id *)(*((void *)&v114 + 1) + 8 * j) matchesContactHandle:v24])
                  {
                    int v76 = 1;
                    goto LABEL_101;
                  }
                }
                uint64_t v73 = [v72 countByEnumeratingWithState:&v114 objects:v123 count:16];
                if (v73) {
                  continue;
                }
                break;
              }
            }
            int v76 = 0;
            uint64_t v69 = 12;
LABEL_101:

            LODWORD(v67) = 0;
            int v77 = v76;
            int v71 = v76;
          }
          if (v62 == 2) {
            int v78 = 1;
          }
          else {
            int v78 = v99;
          }
          uint64_t v79 = 12;
          if (v63 != 2 || v62 != 2) {
            uint64_t v79 = v98;
          }
          BOOL v80 = v63 == 2;
          if (v63 == 2) {
            unint64_t v60 = v79;
          }
          else {
            unint64_t v60 = v69;
          }
          if (v63 == 2) {
            int v59 = v78;
          }
          else {
            int v59 = v71;
          }
          if (!v80)
          {
            int v81 = v96 | v77;
            int v82 = v77 | v96 ^ 1;
            BOOL v83 = v82 == 0;
            unint64_t v84 = v82 ? v69 : v98;
            int v85 = v83 ? v99 : v71;
            if (v81 == 1)
            {
              int v86 = v85;
            }
            else
            {
              unint64_t v84 = v69;
              int v86 = v71;
            }
            if (v62 != 2)
            {
              unint64_t v60 = v84;
              int v59 = v86;
            }
          }

          if (v76) {
            LOBYTE(v61) = 1;
          }
          else {
            LOBYTE(v61) = v97;
          }
          if (v67) {
            char v58 = 1;
          }
          else {
            char v58 = BYTE4(v97);
          }
          goto LABEL_131;
        }
      }
      uint64_t v97 = 0;
      int v96 = 0;
      int v99 = 1;
    }
    else
    {
      if (![v111 exceptionForApplicationIdentifier:v18])
      {
        uint64_t v97 = 1;
        uint64_t v98 = 13;
        int v96 = 1;
        int v99 = 1;
        goto LABEL_75;
      }
      uint64_t v97 = 0;
      int v96 = 0;
      int v99 = 0;
    }
    uint64_t v98 = 12;
    goto LABEL_75;
  }
  uint64_t v56 = [v111 applicationConfigurationType];
  if (v56)
  {
    if (v56 == 2)
    {
      LOBYTE(v61) = 0;
      char v58 = 0;
      int v59 = 1;
      unint64_t v60 = 12;
    }
    else if (v56 == 1)
    {
      uint64_t v57 = [v111 exceptionForApplicationIdentifier:v18];
      char v58 = v57 == 1;
      int v59 = v57 != 1;
      if (v57 == 1) {
        unint64_t v60 = 13;
      }
      else {
        unint64_t v60 = 12;
      }
      if (v103 && objc_msgSend(v111, "exceptionForWebApplicationIdentifier:") == 1)
      {
        LOBYTE(v61) = 0;
        int v59 = 0;
        char v58 = 1;
        unint64_t v60 = 13;
      }
      else
      {
        LOBYTE(v61) = 0;
      }
    }
    else
    {
      LOBYTE(v61) = 0;
      char v58 = 0;
      unint64_t v60 = 0;
      int v59 = 0;
    }
  }
  else
  {
    uint64_t v64 = [v111 exceptionForApplicationIdentifier:v18];
    BOOL v61 = v64 == 0;
    if (v64) {
      unint64_t v60 = 12;
    }
    else {
      unint64_t v60 = 13;
    }
    if (v103 && !objc_msgSend(v111, "exceptionForWebApplicationIdentifier:"))
    {
      char v58 = 0;
      LOBYTE(v61) = 1;
      unint64_t v60 = 13;
      int v59 = 1;
    }
    else
    {
      char v58 = 0;
      int v59 = v61;
    }
  }
LABEL_131:
  if ((unint64_t)a12 >= 2)
  {
    char v87 = a12 == 2 ? v58 : 0;
    if ((v87 & 1) == 0 && (a12 != 3 || !v61))
    {
      unint64_t v60 = 26;
      int v59 = a12 == 2;
    }
  }
  if (v106 && v59 && v108)
  {
    id v88 = objc_alloc_init(MEMORY[0x1E4F5F738]);
    id v112 = 0;
    id v113 = 0;
    int v89 = [v88 validatePredicate:v108 compileTimeIssues:&v113 runTimeIssues:&v112];
    id v90 = v113;
    id v91 = v112;
    if (v89)
    {
      int v59 = [v108 evaluateWithObject:v106];
      if (!v59) {
        unint64_t v60 = 25;
      }
    }
    else
    {
      v92 = DNDSLogResolver;
      if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_ERROR))
      {
        if (v90) {
          id v95 = v90;
        }
        else {
          id v95 = v91;
        }
        *(_DWORD *)buf = 138543874;
        id v126 = v95;
        __int16 v127 = 2112;
        id v128 = v110;
        __int16 v129 = 2112;
        id v130 = v105;
        _os_log_error_impl(&dword_1D3052000, v92, OS_LOG_TYPE_ERROR, "Notification filter predicate from App Context did not validate, issues=%{public}@ bundleIdentifier=%@ modeIdentifier=%@", buf, 0x20u);
      }
      LOBYTE(v59) = 1;
    }
  }
  if ((a11 & v102) != 0) {
    unint64_t v60 = 20;
  }
  char v44 = a11 & v102 | v59;
  if (a7 == 1)
  {
    uint64_t v93 = [v111 minimumBreakthroughUrgency];
    if (v93) {
      unint64_t v60 = 19;
    }
    v44 |= v93 != 0;
  }
  else if (a7 == 2)
  {
    [v111 minimumBreakthroughUrgency];
    char v44 = 1;
    unint64_t v60 = 19;
  }
  if (a13) {
    *a13 = v60;
  }

LABEL_159:
  return v44 & 1;
}

- (BOOL)_queue_isBreakthroughAllowedForSender:(id)a3 eventType:(unint64_t)a4 clientDetails:(id)a5 date:(id)a6 reason:(unint64_t *)a7
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  int v15 = DNDSLogResolver;
  if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v18 = 138412290;
    *(void *)&void v18[4] = v12;
    _os_log_impl(&dword_1D3052000, v15, OS_LOG_TYPE_DEFAULT, "Resolving global breakthrough for sender: %@", v18, 0xCu);
  }
  BOOL v16 = 0;
  if (v12)
  {
    if (a4 == 1)
    {
      *(void *)id v18 = 0;
      BOOL v16 = [(DNDSEventBehaviorResolver *)self _queue_resolveOutcomeForEventSender:v12 clientDetails:v13 date:v14 reason:v18] == 1;
      if (a7) {
        *a7 = *(void *)v18;
      }
    }
  }

  return v16;
}

- (id)_queue_firstContactForPredicate:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v4)
  {
    id v10 = 0;
    goto LABEL_10;
  }
  contactStore = self->_contactStore;
  uint64_t v6 = *MEMORY[0x1E4F1AEE0];
  v13[0] = *MEMORY[0x1E4F1AE08];
  v13[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v12 = 0;
  id v8 = [(CNContactStore *)contactStore unifiedContactsMatchingPredicate:v4 keysToFetch:v7 error:&v12];
  id v9 = v12;

  if (v9)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_ERROR)) {
      -[DNDSEventBehaviorResolver _queue_firstContactForPredicate:]();
    }
  }
  else if ([v8 count])
  {
    id v10 = [v8 firstObject];
    goto LABEL_9;
  }
  id v10 = 0;
LABEL_9:

LABEL_10:
  return v10;
}

- (BOOL)_queue_shouldAdjustEventBehaviorForMirroring
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v2 = DNDSLogResolver;
  if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = 0;
    _os_log_impl(&dword_1D3052000, v2, OS_LOG_TYPE_DEFAULT, "Determined whether sharing / mirroring preferences should adjust event behavior; shouldAdjust=%d",
      (uint8_t *)v4,
      8u);
  }
  return 0;
}

- (DNDSEventBehaviorResolverDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (DNDSEventBehaviorResolverDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_resolutionRecord, 0);
  objc_storeStrong((id *)&self->_favorites, 0);
  objc_storeStrong((id *)&self->_localService, 0);
  objc_storeStrong((id *)&self->_intelligentBehaviorResolver, 0);
  objc_storeStrong((id *)&self->_auxiliaryStateMonitor, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_modeRepository, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)resolutionForConfiguration:(id)a3 eventDetails:(id)a4 clientDetails:(id)a5 date:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000;
  unint64_t v40 = __Block_byref_object_copy__2;
  BOOL v41 = __Block_byref_object_dispose__2;
  id v42 = 0;
  uint64_t v31 = 0;
  BOOL v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__2;
  uint32_t v35 = __Block_byref_object_dispose__2;
  id v36 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__DNDSEventBehaviorResolver_Testing__resolutionForConfiguration_eventDetails_clientDetails_date_error___block_invoke;
  block[3] = &unk_1E6973940;
  uint64_t v29 = &v37;
  block[4] = self;
  id v17 = v12;
  id v25 = v17;
  id v18 = v13;
  id v26 = v18;
  id v19 = v14;
  id v27 = v19;
  id v20 = v15;
  id v28 = v20;
  char v30 = &v31;
  dispatch_sync(queue, block);
  if (a7)
  {
    id v21 = (void *)v32[5];
    if (v21) {
      *a7 = v21;
    }
  }
  id v22 = (id)v38[5];

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v22;
}

void __103__DNDSEventBehaviorResolver_Testing__resolutionForConfiguration_eventDetails_clientDetails_date_error___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[8];
  uint64_t v7 = *(void *)(a1[10] + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = objc_msgSend(v2, "_queue_resolutionForModeSemanticType:withConfiguration:eventDetails:clientDetails:state:date:error:", 0, v3, v4, v5, 0, v6, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v9 = *(void *)(a1[9] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (void)_queue_resolveBehaviorForEventDetails:(void *)a1 clientDetails:(void *)a2 date:error:.cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 activeModeIdentifier];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1D3052000, v3, OS_LOG_TYPE_ERROR, "Couldn't find mode configuration for active mode: %{public}@.", v5, 0xCu);
}

- (void)_queue_eventSourceIsFavorite:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Error looking up favorite contacts: error=%{public}@", v2, v3, v4, v5, v6);
}

- (void)_queue_eventSourceIsContact:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Error looking up contacts: error=%{public}@", v2, v3, v4, v5, v6);
}

- (void)_queue_eventSourceIsContact:inGroupWithIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Error looking up group contacts: error=%{public}@", v2, v3, v4, v5, v6);
}

- (void)_queue_eventSourceIsEmergencyContact:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Error looking up emergency contacts: error=%{public}@", v2, v3, v4, v5, v6);
}

- (void)_queue_isBreakthroughAllowedForModeIdentifier:(uint64_t)a3 withConfiguration:(uint64_t)a4 application:sender:urgency:eventType:threadIdentifier:filterCriteria:notifyAnyway:intelligentBehavior:reason:.cold.1(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = objc_begin_catch(a1);
  uint64_t v7 = DNDSLogResolver;
  if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543874;
    id v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = a3;
    __int16 v12 = 2112;
    uint64_t v13 = a4;
    _os_log_error_impl(&dword_1D3052000, v7, OS_LOG_TYPE_ERROR, "Notification filter predicate from App Context threw during evaluation, exception=%{public}@ bundleIdentifier=%@ modeIdentifier=%@", (uint8_t *)&v8, 0x20u);
  }

  objc_end_catch();
}

- (void)_queue_isBreakthroughAllowedForModeIdentifier:(void *)a3 withConfiguration:application:sender:urgency:eventType:threadIdentifier:filterCriteria:notifyAnyway:intelligentBehavior:reason:.cold.2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  id v6 = [a3 localizedDescription];
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  __int16 v10 = v6;
  _os_log_error_impl(&dword_1D3052000, v5, OS_LOG_TYPE_ERROR, "Failed to retrieve an LSApplicationRecord for bundleIdentifier:%@; error=%@",
    (uint8_t *)&v7,
    0x16u);
}

- (void)_queue_firstContactForPredicate:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1D3052000, v1, OS_LOG_TYPE_ERROR, "Failed to lookup contact in address book. predicate=%{public}@, error=%{public}@", v2, 0x16u);
}

@end