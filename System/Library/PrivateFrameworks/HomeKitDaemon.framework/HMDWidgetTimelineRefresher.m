@interface HMDWidgetTimelineRefresher
+ (id)fetchSpecificationsForWidgetKinds:(id)a3;
+ (id)logCategory;
- (BOOL)_getRequestsFromMessage:(id)a3 outCharacteristicWriteValueByUUUIDs:(id *)a4 outExecuteActionSetUUUIDs:(id *)a5 outExecuteTurnOffActionSetUUIDs:(id *)a6;
- (BOOL)_value:(id)a3 isApproximatelyEqualToValue:(id)a4 forMinimumValue:(id)a5 maximumValue:(id)a6;
- (BOOL)actionSetIsOn:(id)a3;
- (BOOL)evaluateActionSetStateOnPrimaryEnabledForHome:(id)a3;
- (HMDHomeManager)homeManager;
- (HMDWidgetConfigurationReader)widgetConfigurationReader;
- (HMDWidgetTimelineController)timelineController;
- (HMDWidgetTimelineRefresher)initWithHomeManager:(id)a3;
- (HMDWidgetTimelineRefresher)initWithHomeManager:(id)a3 queue:(id)a4 notificationCenter:(id)a5 darwinNotificationProvider:(id)a6 widgetConfigurationReader:(id)a7 timelineController:(id)a8 logEventSubmitter:(id)a9 timerManager:(id)a10 reachabilityUpdateDispatchDelayNs:(int64_t)a11 forceUpdateTimelineDispatchDelayNs:(int64_t)a12;
- (HMDarwinNotificationProvider)darwinNotificationProvider;
- (HMFTimerManager)timerManager;
- (HMFTimerManagerTimerContext)actionSetPrimaryStateUpdateCoalesceTimerContext;
- (HMFTimerManagerTimerContext)widgetRefreshCoalesceTimerContext;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSMapTable)cachedIsOnStateByActionSet;
- (NSMapTable)cachedValueByCharacteristic;
- (NSMapTable)deviceControllersByID;
- (NSMapTable)devicesByController;
- (NSMapTable)pendingRequestValueByUUID;
- (NSMutableDictionary)accessoryIsReachableByUUID;
- (NSMutableDictionary)cachedActionSetExecuteErrorByUUID;
- (NSMutableDictionary)cachedActionSetExecuteErrorTimerContextByUUID;
- (NSMutableDictionary)characteristicsToPreviouslySeenValues;
- (NSMutableDictionary)monitoredActionSetsMapByWidget;
- (NSMutableDictionary)monitoredCharacteristicsMapByWidget;
- (NSMutableDictionary)monitoredMTRAttributesByWidget;
- (NSMutableSet)actionSetsPendingPrimaryResidentStateUpdates;
- (NSNotificationCenter)notificationCenter;
- (NSSet)activeWidgetKinds;
- (NSSet)monitoredCharacteristics;
- (NSSet)widgetKindsToUpdate;
- (NSSet)widgetRefreshCoalesceKinds;
- (NSString)clientIdentifier;
- (NSString)clientIdentifierForExplicitlyMonitoredCharacteristics;
- (NSString)widgetRefreshCoalesceReason;
- (NSUUID)currentHomeUUID;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_source)widgetRefreshDispatchTimer;
- (id)_firstErrorFromCharacteristicWriteResponsePayload:(id)a3;
- (id)_getPendingWriteValueForUUID:(id)a3;
- (id)actionSetsByHome:(id)a3;
- (id)actionSetsFromSPIClientIdentifiers:(void *)a1;
- (id)actionSetsMonitoredForWidgets;
- (id)attributesMonitoredForWidgets;
- (id)cachedIsOnStateBySPIClientIdentifierForActionSets:(void *)a1;
- (id)characteristicsForMonitoredCharacteristics:(void *)a1;
- (id)characteristicsFromActionSets:(void *)a1;
- (id)characteristicsFromSPIClientIdentifiers:(void *)a1;
- (id)characteristicsMonitoredForWidgets;
- (id)didExecuteFailBySPIClientIdentifierForActionSets:(void *)a1;
- (id)fetchAndStoreActiveWidgetKindsHandler;
- (id)forceUpdateAutobahnTimelineHandler;
- (id)internalMonitorCharacteristicsForCurrentHome:(id)a3 activeWidgetKinds:(id)a4;
- (id)modifiedCharacteristicsFromNotification:(id)a3;
- (id)monitorCharacteristicsForHome:(id)a3 fetchSpecifications:(id)a4;
- (id)reachabilityByAccessorySPIClientIdentifierForCharacteristics:(id)a3;
- (id)thresholdForCharacteristic:(id)a3;
- (id)valueByCharacteristicSPIClientIdentifierForCharacteristics:(id)a3;
- (id)widgetKindsToUpdateFromFetchSpecifications:(id)a3 assumingChangedCharacteristic:(id)a4;
- (id)widgetKindsToUpdateFromFetchSpecifications:(id)a3 changedCharacteristics:(id)a4;
- (int64_t)forceUpdateTimelineDispatchDelayNs;
- (int64_t)reachabilityUpdateDispatchDelayNs;
- (void)_clearCachedErrorForActionSet:(void *)a1;
- (void)_clearExpiredActionSetPrimaryStateUpdates;
- (void)_refreshTimelineForWidgetKinds:(void *)a3 withReason:;
- (void)_refreshWidgetsIfActionSetsHaveChanged:(id)a3;
- (void)_removePendingRequestValueForUUID:(id)a3 messageIdentifier:(id)a4;
- (void)_setCachedError:(void *)a3 forActionSet:;
- (void)_setPendingRequestValue:(id)a3 forUUID:(id)a4 messageIdentifier:(id)a5;
- (void)_startActionSetPrimaryStateUpdateCoalesceTimerContextForActionSetUUID:(id)a3 expectedState:(id)a4;
- (void)cleanUpRemovedWidgetsFromWidgets:(void *)a3 completion:;
- (void)configure;
- (void)dealloc;
- (void)device:(id)a3 receivedAttributeReport:(id)a4;
- (void)device:(id)a3 receivedEventReport:(id)a4;
- (void)device:(id)a3 stateChanged:(unint64_t)a4;
- (void)didUpdateStateWithActionSetUUID:(id)a3 state:(BOOL)a4;
- (void)fetchAndStoreActiveWidgetKinds;
- (void)forceUpdateTimelineForWidgetKinds:(id)a3;
- (void)handleAccessoryAddedNotification:(id)a3;
- (void)handleAccessoryCharacteristicsChangedNotification:(id)a3;
- (void)handleAccessoryReachabilityChangedNotification:(id)a3;
- (void)handleAccessoryRemoteReachabilityChangedNotification:(id)a3;
- (void)handleAccessoryRemovedNotification:(id)a3;
- (void)handleCurrentHomeChangeNotification:(id)a3;
- (void)handleCurrentOrPrimaryHomeChangedNotification:(id)a3;
- (void)handleFetchState:(id)a3;
- (void)handleFetchStateForActionSets:(id)a3;
- (void)handleHomeAddedNotification:(id)a3;
- (void)handleHomeRemovedNotification:(id)a3;
- (void)handleHomeSensingChangedNotification;
- (void)handleMonitorActionSetsForWidget:(id)a3;
- (void)handleMonitorCharacteristicsForWidget:(id)a3;
- (void)handleMonitorMTRAttributes:(id)a3;
- (void)handleNotificationOfPossibleNewWidget:(id)a3;
- (void)handleNotifiedXPCClientsOfHomeConfigurationChangeNotification:(id)a3;
- (void)handlePerformRequests:(id)a3;
- (void)handleResidentDeviceAddedOrRemovedNotification:(id)a3;
- (void)handleResidentDeviceChangedNotification:(id)a3;
- (void)handleRestrictedGuestScheduleEndedNotification:(id)a3;
- (void)handleRestrictedGuestScheduleEventForUser:(id)a3;
- (void)handleRestrictedGuestScheduleStartedNotification:(id)a3;
- (void)handleSelectedHomeChangedNotification;
- (void)handleTimerFiredForActionSet:(id)a3;
- (void)internalProcessChangedCharacteristics:(id)a3 activeWidgetKinds:(id)a4;
- (void)monitorDeviceNodeID:(id)a3 controller:(id)a4 attributes:(id)a5;
- (void)processCharacteristicsChangedNotification:(id)a3;
- (void)refreshTimelineForConfiguredWidgetsWithReason:(void *)a1;
- (void)refreshTimelineForWidgetKinds:(void *)a3 withReason:(int)a4 shouldCoalesce:;
- (void)registerForDarwinNotifications;
- (void)registerForMessagesWithMessageDispatcher:(id)a3;
- (void)setActionSetPrimaryStateUpdateCoalesceTimerContext:(id)a3;
- (void)setActiveWidgetKinds:(id)a3;
- (void)setCurrentHomeUUID:(id)a3;
- (void)setFetchAndStoreActiveWidgetKindsHandler:(id)a3;
- (void)setForceUpdateAutobahnTimelineHandler:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setMonitoredCharacteristics:(id)a3;
- (void)setNotificationEnabled:(void *)a3 forCharacteristics:(void *)a4 clientIdentifier:;
- (void)setWidgetKindsToUpdate:(id)a3;
- (void)setWidgetRefreshCoalesceKinds:(id)a3;
- (void)setWidgetRefreshCoalesceReason:(id)a3;
- (void)setWidgetRefreshCoalesceTimerContext:(id)a3;
- (void)stopMonitoringOldCharacteristics;
- (void)timerManager:(id)a3 didFireForTimerContext:(id)a4;
- (void)updateCachedIsOnStateForActionSets:(void *)a1;
- (void)updateMonitoredActionSetsWithPreviousActionSets:(void *)a3 currentActionSets:;
- (void)updateMonitoredCharacteristicsAndRefreshWidgetTimelines;
- (void)updateMonitoredMTRAttributes:(id)a3 forWidget:(id)a4;
- (void)updateNotificationRegistrationWithPreviousCharacteristics:(void *)a3 currentCharacteristics:(uint64_t)a4 updateRequestQualityOfService:;
- (void)writeCharacteristicsWithWriteValueBySPIClientIdentifier:(id)a3 widgetKind:(id)a4 message:(id)a5 completionGroup:(id)a6 completion:(id)a7;
@end

@implementation HMDWidgetTimelineRefresher

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchAndStoreActiveWidgetKindsHandler, 0);
  objc_storeStrong((id *)&self->_characteristicsToPreviouslySeenValues, 0);
  objc_storeStrong(&self->_forceUpdateAutobahnTimelineHandler, 0);
  objc_storeStrong((id *)&self->_widgetRefreshCoalesceKinds, 0);
  objc_storeStrong((id *)&self->_widgetRefreshCoalesceReason, 0);
  objc_storeStrong((id *)&self->_widgetRefreshCoalesceTimerContext, 0);
  objc_storeStrong((id *)&self->_actionSetsPendingPrimaryResidentStateUpdates, 0);
  objc_storeStrong((id *)&self->_actionSetPrimaryStateUpdateCoalesceTimerContext, 0);
  objc_storeStrong((id *)&self->_cachedActionSetExecuteErrorTimerContextByUUID, 0);
  objc_storeStrong((id *)&self->_cachedActionSetExecuteErrorByUUID, 0);
  objc_storeStrong((id *)&self->_pendingRequestValueByUUID, 0);
  objc_storeStrong((id *)&self->_devicesByController, 0);
  objc_storeStrong((id *)&self->_deviceControllersByID, 0);
  objc_storeStrong((id *)&self->_cachedIsOnStateByActionSet, 0);
  objc_storeStrong((id *)&self->_cachedValueByCharacteristic, 0);
  objc_storeStrong((id *)&self->_monitoredActionSetsMapByWidget, 0);
  objc_storeStrong((id *)&self->_monitoredMTRAttributesByWidget, 0);
  objc_storeStrong((id *)&self->_monitoredCharacteristicsMapByWidget, 0);
  objc_storeStrong((id *)&self->_clientIdentifierForExplicitlyMonitoredCharacteristics, 0);
  objc_storeStrong((id *)&self->_widgetRefreshDispatchTimer, 0);
  objc_storeStrong((id *)&self->_accessoryIsReachableByUUID, 0);
  objc_storeStrong((id *)&self->_widgetKindsToUpdate, 0);
  objc_storeStrong((id *)&self->_currentHomeUUID, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_timelineController, 0);
  objc_storeStrong((id *)&self->_widgetConfigurationReader, 0);
  objc_storeStrong((id *)&self->_darwinNotificationProvider, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_activeWidgetKinds, 0);
  objc_storeStrong((id *)&self->_monitoredCharacteristics, 0);
}

- (void)setFetchAndStoreActiveWidgetKindsHandler:(id)a3
{
}

- (id)fetchAndStoreActiveWidgetKindsHandler
{
  return self->_fetchAndStoreActiveWidgetKindsHandler;
}

- (NSMutableDictionary)characteristicsToPreviouslySeenValues
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 288, 1);
}

- (void)setForceUpdateAutobahnTimelineHandler:(id)a3
{
}

- (id)forceUpdateAutobahnTimelineHandler
{
  return self->_forceUpdateAutobahnTimelineHandler;
}

- (int64_t)forceUpdateTimelineDispatchDelayNs
{
  return self->_forceUpdateTimelineDispatchDelayNs;
}

- (int64_t)reachabilityUpdateDispatchDelayNs
{
  return self->_reachabilityUpdateDispatchDelayNs;
}

- (void)setWidgetRefreshCoalesceKinds:(id)a3
{
}

- (NSSet)widgetRefreshCoalesceKinds
{
  return self->_widgetRefreshCoalesceKinds;
}

- (void)setWidgetRefreshCoalesceReason:(id)a3
{
}

- (NSString)widgetRefreshCoalesceReason
{
  return self->_widgetRefreshCoalesceReason;
}

- (void)setWidgetRefreshCoalesceTimerContext:(id)a3
{
}

- (HMFTimerManagerTimerContext)widgetRefreshCoalesceTimerContext
{
  return self->_widgetRefreshCoalesceTimerContext;
}

- (NSMutableSet)actionSetsPendingPrimaryResidentStateUpdates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 232, 1);
}

- (void)setActionSetPrimaryStateUpdateCoalesceTimerContext:(id)a3
{
}

- (HMFTimerManagerTimerContext)actionSetPrimaryStateUpdateCoalesceTimerContext
{
  return self->_actionSetPrimaryStateUpdateCoalesceTimerContext;
}

- (NSMutableDictionary)cachedActionSetExecuteErrorTimerContextByUUID
{
  return self->_cachedActionSetExecuteErrorTimerContextByUUID;
}

- (NSMutableDictionary)cachedActionSetExecuteErrorByUUID
{
  return self->_cachedActionSetExecuteErrorByUUID;
}

- (NSMapTable)pendingRequestValueByUUID
{
  return self->_pendingRequestValueByUUID;
}

- (NSMapTable)devicesByController
{
  return self->_devicesByController;
}

- (NSMapTable)deviceControllersByID
{
  return self->_deviceControllersByID;
}

- (NSMapTable)cachedIsOnStateByActionSet
{
  return self->_cachedIsOnStateByActionSet;
}

- (NSMapTable)cachedValueByCharacteristic
{
  return self->_cachedValueByCharacteristic;
}

- (NSMutableDictionary)monitoredActionSetsMapByWidget
{
  return self->_monitoredActionSetsMapByWidget;
}

- (NSMutableDictionary)monitoredMTRAttributesByWidget
{
  return self->_monitoredMTRAttributesByWidget;
}

- (NSMutableDictionary)monitoredCharacteristicsMapByWidget
{
  return self->_monitoredCharacteristicsMapByWidget;
}

- (NSString)clientIdentifierForExplicitlyMonitoredCharacteristics
{
  return self->_clientIdentifierForExplicitlyMonitoredCharacteristics;
}

- (OS_dispatch_source)widgetRefreshDispatchTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 128, 1);
}

- (NSMutableDictionary)accessoryIsReachableByUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setWidgetKindsToUpdate:(id)a3
{
}

- (NSSet)widgetKindsToUpdate
{
  return (NSSet *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCurrentHomeUUID:(id)a3
{
}

- (NSUUID)currentHomeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 104, 1);
}

- (HMFTimerManager)timerManager
{
  return self->_timerManager;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 88, 1);
}

- (HMDWidgetTimelineController)timelineController
{
  return (HMDWidgetTimelineController *)objc_getProperty(self, a2, 80, 1);
}

- (HMDWidgetConfigurationReader)widgetConfigurationReader
{
  return (HMDWidgetConfigurationReader *)objc_getProperty(self, a2, 72, 1);
}

- (HMDarwinNotificationProvider)darwinNotificationProvider
{
  return (HMDarwinNotificationProvider *)objc_getProperty(self, a2, 64, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)clientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setHomeManager:(id)a3
{
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (void)setActiveWidgetKinds:(id)a3
{
}

- (NSSet)activeWidgetKinds
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMonitoredCharacteristics:(id)a3
{
}

- (NSSet)monitoredCharacteristics
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)device:(id)a3 stateChanged:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x230FBD990]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = HMFGetLogIdentifier();
    int v11 = 138543874;
    v12 = v10;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2048;
    unint64_t v16 = a4;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Device: %@, received state change to: %ld", (uint8_t *)&v11, 0x20u);
  }
}

- (void)device:(id)a3 receivedEventReport:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = HMFGetLogIdentifier();
    int v12 = 138543874;
    __int16 v13 = v11;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Device: %@, received event report: %@", (uint8_t *)&v12, 0x20u);
  }
}

- (void)device:(id)a3 receivedAttributeReport:(id)a4
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    v62 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Device: %@, received attribute report: %@", buf, 0x20u);
  }
  v49 = v6;

  context = (void *)MEMORY[0x230FBD990]();
  v50 = [MEMORY[0x263EFF9C0] set];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v7;
  uint64_t v12 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v57;
    uint64_t v15 = *MEMORY[0x263F10B70];
    uint64_t v53 = *MEMORY[0x263F10B90];
    v51 = v9;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v57 != v14) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        uint64_t v18 = [v17 objectForKeyedSubscript:v15];
        if (v18
          && (v19 = (void *)v18,
              [v17 objectForKeyedSubscript:v53],
              v20 = objc_claimAutoreleasedReturnValue(),
              v20,
              v19,
              v20))
        {
          v21 = [v17 objectForKeyedSubscript:v15];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v22 = v21;
          }
          else {
            v22 = 0;
          }
          id v23 = v22;

          if (v23)
          {
            [v50 addObject:v23];
          }
          else
          {
            uint64_t v28 = MEMORY[0x230FBD990]();
            v29 = v9;
            v30 = (void *)v28;
            v31 = v29;
            v32 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              v33 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v33;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v17;
              _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Malformed attribute report with invalid or missing path. Ignoring report: %@", buf, 0x16u);
            }
            v9 = v51;
          }
        }
        else
        {
          v24 = (void *)MEMORY[0x230FBD990]();
          v25 = v9;
          v26 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v27 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v27;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v17;
            _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Malformed attribute report. Ignoring report: %@", buf, 0x16u);

            v9 = v51;
          }
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
    }
    while (v13);
  }

  v34 = [v49 nodeID];
  id v35 = v50;
  id v36 = v34;
  if (v9)
  {
    v37 = [(HMDWidgetTimelineRefresher *)v9 workQueue];
    dispatch_assert_queue_V2(v37);

    v38 = [MEMORY[0x263EFF9C0] set];
    v39 = [(HMDWidgetTimelineRefresher *)v9 monitoredMTRAttributesByWidget];
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __66__HMDWidgetTimelineRefresher_relevantWidgetsForAttributes_nodeID___block_invoke;
    v62 = &unk_264A1B578;
    id v63 = v36;
    id v64 = v35;
    id v40 = v38;
    id v65 = v40;
    [v39 enumerateKeysAndObjectsUsingBlock:buf];

    v41 = v65;
    id v42 = v40;
  }
  else
  {
    id v42 = 0;
  }

  v43 = (void *)[v42 mutableCopy];
  if ([v43 count])
  {
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __61__HMDWidgetTimelineRefresher_device_receivedAttributeReport___block_invoke;
    v54[3] = &unk_264A26D28;
    v54[4] = v9;
    id v55 = v43;
    -[HMDWidgetTimelineRefresher cleanUpRemovedWidgetsFromWidgets:completion:](v9, v55, v54);
  }
  else
  {
    v44 = (void *)MEMORY[0x230FBD990]();
    v45 = v9;
    v46 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      v47 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v47;
      _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_INFO, "%{public}@No relevant widgets for attribute report", buf, 0xCu);
    }
  }
}

void __61__HMDWidgetTimelineRefresher_device_receivedAttributeReport___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v4);

  [*(id *)(a1 + 40) minusSet:v3];
  if ([*(id *)(a1 + 40) count])
  {
    v5 = objc_msgSend(*(id *)(a1 + 40), "na_map:", &__block_literal_global_347);
    if ([v5 count])
    {
      id v6 = (void *)MEMORY[0x230FBD990]();
      id v7 = *(id *)(a1 + 32);
      v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = HMFGetLogIdentifier();
        v10 = [v5 allObjects];
        int v11 = [v10 componentsJoinedByString:@", "];
        int v16 = 138543618;
        id v17 = v9;
        __int16 v18 = 2112;
        v19 = v11;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Refreshing timeline for widget kinds: %@ due to attribute report", (uint8_t *)&v16, 0x16u);
      }
      -[HMDWidgetTimelineRefresher refreshTimelineForWidgetKinds:withReason:shouldCoalesce:](*(void **)(a1 + 32), v5, @"Attribute Report", 0);
    }
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = *(id *)(a1 + 32);
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v16 = 138543362;
      id v17 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@All relevant widgets for attribute report have been removed", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)cleanUpRemovedWidgetsFromWidgets:(void *)a3 completion:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = [a1 widgetConfigurationReader];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __74__HMDWidgetTimelineRefresher_cleanUpRemovedWidgetsFromWidgets_completion___block_invoke;
    v8[3] = &unk_264A2A508;
    v8[4] = a1;
    id v10 = v6;
    id v9 = v5;
    [v7 fetchHomeWidgetsWithCompletion:v8];
  }
}

void __74__HMDWidgetTimelineRefresher_cleanUpRemovedWidgetsFromWidgets_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__HMDWidgetTimelineRefresher_cleanUpRemovedWidgetsFromWidgets_completion___block_invoke_2;
  block[3] = &unk_264A2DDC0;
  id v8 = a1[4];
  id v12 = v5;
  id v13 = v8;
  id v14 = v6;
  id v16 = a1[6];
  id v15 = a1[5];
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __74__HMDWidgetTimelineRefresher_cleanUpRemovedWidgetsFromWidgets_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    v2 = *(void **)(a1 + 56);
    id v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:");
    v4 = objc_msgSend(v2, "na_setByRemovingObjectsFromSet:", v3);

    id v5 = *(void **)(a1 + 40);
    id v35 = v4;
    if (v5)
    {
      id v6 = [v5 workQueue];
      dispatch_assert_queue_V2(v6);

      if ([v35 count])
      {
        id v7 = (void *)MEMORY[0x230FBD990]();
        id v8 = v5;
        id v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          id v10 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v41 = v10;
          __int16 v42 = 2112;
          id v43 = v35;
          _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing old widgets and updating monitored characteristics and action sets: %@", buf, 0x16u);
        }
        int v11 = -[HMDWidgetTimelineRefresher characteristicsMonitoredForWidgets](v8);
        id v12 = -[HMDWidgetTimelineRefresher actionSetsMonitoredForWidgets](v8);
        id v13 = [v35 allObjects];
        id v14 = [v8 monitoredCharacteristicsMapByWidget];
        [v14 removeObjectsForKeys:v13];

        id v15 = [v8 monitoredActionSetsMapByWidget];
        [v15 removeObjectsForKeys:v13];

        id v16 = -[HMDWidgetTimelineRefresher characteristicsMonitoredForWidgets](v8);
        id v17 = -[HMDWidgetTimelineRefresher actionSetsMonitoredForWidgets](v8);
        -[HMDWidgetTimelineRefresher updateMonitoredActionSetsWithPreviousActionSets:currentActionSets:]((uint64_t)v8, v12, v17);
        v34 = v11;
        v32 = v16;
        -[HMDWidgetTimelineRefresher updateNotificationRegistrationWithPreviousCharacteristics:currentCharacteristics:updateRequestQualityOfService:](v8, v11, v16, 33);
        v33 = v12;
        __int16 v18 = objc_msgSend(v12, "na_setByRemovingObjectsFromSet:", v17);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:buf count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v37 != v21) {
                objc_enumerationMutation(v18);
              }
              uint64_t v23 = *(void *)(*((void *)&v36 + 1) + 8 * i);
              v24 = objc_msgSend(v8, "cachedIsOnStateByActionSet", v32);
              [v24 removeObjectForKey:v23];
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v36 objects:buf count:16];
          }
          while (v20);
        }
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    v25 = (void *)MEMORY[0x230FBD990]();
    id v26 = *(id *)(a1 + 40);
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      v29 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v41 = v28;
      __int16 v42 = 2112;
      id v43 = v29;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch configured widgets with error: %@", buf, 0x16u);
    }
    uint64_t v30 = *(void *)(a1 + 64);
    v31 = [MEMORY[0x263EFFA08] set];
    (*(void (**)(uint64_t, void *))(v30 + 16))(v30, v31);
  }
}

- (id)characteristicsMonitoredForWidgets
{
  v2 = [MEMORY[0x263EFF9C0] set];
  id v3 = [a1 monitoredCharacteristicsMapByWidget];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__HMDWidgetTimelineRefresher_characteristicsMonitoredForWidgets__block_invoke;
  v8[3] = &unk_264A1B448;
  v8[4] = v2;
  [v3 enumerateKeysAndObjectsUsingBlock:v8];

  v4 = [a1 monitoredActionSetsMapByWidget];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__HMDWidgetTimelineRefresher_characteristicsMonitoredForWidgets__block_invoke_2;
  v7[3] = &unk_264A1B680;
  v7[4] = a1;
  v7[5] = v2;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  id v5 = v2;
  return v5;
}

- (id)actionSetsMonitoredForWidgets
{
  v1 = [a1 monitoredActionSetsMapByWidget];
  v2 = objc_msgSend(v1, "na_flatMap:", &__block_literal_global_310);

  id v3 = [MEMORY[0x263EFFA08] setWithArray:v2];

  return v3;
}

- (void)updateMonitoredActionSetsWithPreviousActionSets:(void *)a3 currentActionSets:
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_msgSend(v5, "na_setByRemovingObjectsFromSet:", v6);
  v27 = v5;
  id v8 = objc_msgSend(v6, "na_setByRemovingObjectsFromSet:", v5);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v15 = [v14 home];
        id v16 = [v15 actionSetStateSubscriptionManager];
        id v17 = [v14 uuid];
        [v16 stopMonitoringActionSetUUID:v17 observer:a1];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v11);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v18 = v8;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void **)(*((void *)&v28 + 1) + 8 * j);
        v24 = [v23 home];
        v25 = [v24 actionSetStateSubscriptionManager];
        id v26 = [v23 uuid];
        [v25 startMonitoringActionSetUUID:v26 observer:a1];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v20);
  }
}

- (void)updateNotificationRegistrationWithPreviousCharacteristics:(void *)a3 currentCharacteristics:(uint64_t)a4 updateRequestQualityOfService:
{
  uint64_t v114 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  v89 = v6;
  id v8 = objc_msgSend(v6, "na_map:", &__block_literal_global_296_58245);
  v88 = v7;
  id v9 = objc_msgSend(v7, "na_map:", &__block_literal_global_298);
  uint64_t v10 = objc_msgSend(v8, "na_setByRemovingObjectsFromSet:", v9);
  uint64_t v11 = objc_msgSend(v9, "na_setByRemovingObjectsFromSet:", v8);
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v103 objects:buf count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v104;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v104 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v103 + 1) + 8 * i);
        id v18 = [a1 clientIdentifierForExplicitlyMonitoredCharacteristics];
        [v17 registerForAccessoryReachabilityNotifications:0 registrationIdentifier:v18];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v103 objects:buf count:16];
    }
    while (v14);
  }

  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v19 = v11;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v99 objects:v109 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v100;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v100 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v99 + 1) + 8 * j);
        v25 = [a1 clientIdentifierForExplicitlyMonitoredCharacteristics];
        [v24 registerForAccessoryReachabilityNotifications:1 registrationIdentifier:v25];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v99 objects:v109 count:16];
    }
    while (v21);
  }

  id v26 = objc_msgSend(v89, "na_map:", &__block_literal_global_301);
  v27 = objc_msgSend(v88, "na_map:", &__block_literal_global_301);
  long long v28 = objc_msgSend(v26, "na_setByRemovingObjectsFromSet:", v27);
  v87 = v27;
  long long v29 = objc_msgSend(v27, "na_setByRemovingObjectsFromSet:", v26);
  if ([v28 count] || objc_msgSend(v29, "count"))
  {
    v86 = v29;
    if ([v28 count])
    {
      long long v30 = (void *)MEMORY[0x230FBD990]();
      id v31 = a1;
      long long v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        long long v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v111 = v33;
        __int16 v112 = 2112;
        id v113 = v28;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@Disabling notifications and removing cached value for characteristics: %@", buf, 0x16u);
      }
      long long v34 = [v31 clientIdentifierForExplicitlyMonitoredCharacteristics];
      -[HMDWidgetTimelineRefresher setNotificationEnabled:forCharacteristics:clientIdentifier:](v31, 0, v28, v34);

      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      long long v35 = v28;
      id v36 = v28;
      uint64_t v37 = [v36 countByEnumeratingWithState:&v95 objects:v108 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v96;
        do
        {
          for (uint64_t k = 0; k != v38; ++k)
          {
            if (*(void *)v96 != v39) {
              objc_enumerationMutation(v36);
            }
            uint64_t v41 = *(void *)(*((void *)&v95 + 1) + 8 * k);
            __int16 v42 = [v31 cachedValueByCharacteristic];
            [v42 removeObjectForKey:v41];
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v95 objects:v108 count:16];
        }
        while (v38);
      }

      long long v28 = v35;
      long long v29 = v86;
    }
    if ([v29 count])
    {
      v84 = v28;
      id v43 = (void *)MEMORY[0x230FBD990]();
      id v44 = a1;
      v45 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        v46 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v111 = v46;
        __int16 v112 = 2112;
        id v113 = v29;
        _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_INFO, "%{public}@Enabling notifications and storing cached value for characteristics: %@", buf, 0x16u);
      }
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      id v47 = v29;
      uint64_t v48 = [v47 countByEnumeratingWithState:&v91 objects:v107 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v92;
        do
        {
          for (uint64_t m = 0; m != v49; ++m)
          {
            if (*(void *)v92 != v50) {
              objc_enumerationMutation(v47);
            }
            v52 = *(void **)(*((void *)&v91 + 1) + 8 * m);
            uint64_t v53 = [v44 cachedValueByCharacteristic];
            v54 = [v52 value];
            [v53 setObject:v54 forKey:v52];
          }
          uint64_t v49 = [v47 countByEnumeratingWithState:&v91 objects:v107 count:16];
        }
        while (v49);
      }
      v85 = v26;

      id v55 = [v44 clientIdentifierForExplicitlyMonitoredCharacteristics];
      -[HMDWidgetTimelineRefresher setNotificationEnabled:forCharacteristics:clientIdentifier:](v44, 1u, v47, v55);

      id v56 = v47;
      long long v57 = (void *)MEMORY[0x230FBD990]();
      id v58 = v44;
      long long v59 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        v60 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v111 = v60;
        __int16 v112 = 2112;
        id v113 = v56;
        _os_log_impl(&dword_22F52A000, v59, OS_LOG_TYPE_INFO, "%{public}@Reading characteristics: %@", buf, 0x16u);
      }
      v61 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
      long long v103 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      id v62 = v56;
      uint64_t v63 = [v62 countByEnumeratingWithState:&v103 objects:buf count:16];
      if (v63)
      {
        uint64_t v64 = v63;
        uint64_t v65 = *(void *)v104;
        do
        {
          for (uint64_t n = 0; n != v64; ++n)
          {
            if (*(void *)v104 != v65) {
              objc_enumerationMutation(v62);
            }
            v67 = *(void **)(*((void *)&v103 + 1) + 8 * n);
            v68 = [v67 accessory];
            v69 = [v68 home];

            if (v69)
            {
              v70 = [v61 objectForKey:v69];
              v71 = v70;
              if (v70) {
                [v70 setByAddingObject:v67];
              }
              else {
              v72 = [MEMORY[0x263EFFA08] setWithObject:v67];
              }
              [v61 setObject:v72 forKey:v69];
            }
          }
          uint64_t v64 = [v62 countByEnumeratingWithState:&v103 objects:buf count:16];
        }
        while (v64);
      }
      v83 = v62;

      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      id v73 = v61;
      uint64_t v74 = [v73 countByEnumeratingWithState:&v99 objects:v109 count:16];
      if (v74)
      {
        uint64_t v75 = v74;
        uint64_t v76 = *(void *)v100;
        do
        {
          for (iuint64_t i = 0; ii != v75; ++ii)
          {
            if (*(void *)v100 != v76) {
              objc_enumerationMutation(v73);
            }
            v78 = *(void **)(*((void *)&v99 + 1) + 8 * ii);
            v79 = objc_msgSend(v73, "objectForKey:", v78, v83);
            v80 = [v79 allObjects];
            v81 = objc_msgSend(v80, "na_map:", &__block_literal_global_316);

            v82 = [v58 description];
            [v78 readCharacteristicValues:v81 source:7 sourceForLogging:v82 qualityOfService:a4 withCompletionHandler:0];
          }
          uint64_t v75 = [v73 countByEnumeratingWithState:&v99 objects:v109 count:16];
        }
        while (v75);
      }

      long long v28 = v84;
      id v26 = v85;
      long long v29 = v86;
    }
  }
}

- (void)setNotificationEnabled:(void *)a3 forCharacteristics:(void *)a4 clientIdentifier:
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v31 = a4;
  id v6 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  long long v35 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        id v12 = [v11 accessory];
        if (v12)
        {
          uint64_t v13 = [v6 objectForKey:v12];
          uint64_t v14 = v13;
          if (v13) {
            [v13 setByAddingObject:v11];
          }
          else {
          uint64_t v15 = [MEMORY[0x263EFFA08] setWithObject:v11];
          }
          [v6 setObject:v15 forKey:v12];

          id v16 = [v11 service];
          if (v16) {
            BOOL v17 = a2 == 0;
          }
          else {
            BOOL v17 = 1;
          }
          if (!v17)
          {
            id v18 = [a1 thresholdForCharacteristic:v11];
            if (v18)
            {
              id v19 = [v35 objectForKey:v12];
              if (!v19)
              {
                id v19 = [MEMORY[0x263EFF980] array];
                [v35 setObject:v19 forKey:v12];
              }
              uint64_t v20 = [[HMDCharacteristicNotificationChangeThreshold alloc] initWithCharacteristic:v11 threshold:v18];
              [v19 addObject:v20];
            }
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v8);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v21 = v6;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v37 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = *(void **)(*((void *)&v36 + 1) + 8 * j);
        v27 = [v21 objectForKey:v26];
        long long v28 = [v35 objectForKey:v26];
        long long v29 = (void *)[v28 copy];

        long long v30 = [v27 allObjects];
        [v26 setNotificationsEnabled:a2 forCharacteristics:v30 notificationChangeThresholds:v29 clientIdentifier:v31];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v23);
  }
}

HMDCharacteristicRequest *__67__HMDWidgetTimelineRefresher_readCharacteristics_qualityOfService___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HMDCharacteristicRequest requestWithCharacteristic:a2];
}

uint64_t __73__HMDWidgetTimelineRefresher_characteristicsForMonitoredCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  return [a2 characteristic];
}

id __101__HMDWidgetTimelineRefresher_updateMonitoredHomesWithPreviousCharacteristics_currentCharacteristics___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 reachabilityMonitored])
  {
    id v3 = [v2 characteristic];
    v4 = [v3 accessory];
    id v5 = [v4 home];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

id __101__HMDWidgetTimelineRefresher_updateMonitoredHomesWithPreviousCharacteristics_currentCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 reachabilityMonitored])
  {
    id v3 = [v2 characteristic];
    v4 = [v3 accessory];
    id v5 = [v4 home];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t __59__HMDWidgetTimelineRefresher_actionSetsMonitoredForWidgets__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 allObjects];
}

uint64_t __64__HMDWidgetTimelineRefresher_characteristicsMonitoredForWidgets__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unionSet:");
}

void __64__HMDWidgetTimelineRefresher_characteristicsMonitoredForWidgets__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "actionSetsByHome:");
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v8 = [v2 objectForKey:v7];
        if (([*(id *)(a1 + 32) evaluateActionSetStateOnPrimaryEnabledForHome:v7] & 1) == 0)
        {
          uint64_t v9 = -[HMDWidgetTimelineRefresher characteristicsFromActionSets:](*(void **)(a1 + 32), v8);
          uint64_t v10 = objc_msgSend(v9, "na_map:", &__block_literal_global_303);

          [*(id *)(a1 + 40) unionSet:v10];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (id)characteristicsFromActionSets:(void *)a1
{
  if (a1)
  {
    var28[0] = MEMORY[0x263EF8330];
    var28[1] = 3221225472;
    var28[2] = __60__HMDWidgetTimelineRefresher_characteristicsFromActionSets___block_invoke;
    var28[3] = &unk_264A1B708;
    var28[4] = a1;
    a1 = objc_msgSend(a2, "na_flatMap:", var28);
    uint64_t v2 = var28[6];
  }
  return a1;
}

_TtC13HomeKitDaemon32HMDWidgetMonitoredCharacteristic *__64__HMDWidgetTimelineRefresher_characteristicsMonitoredForWidgets__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[_TtC13HomeKitDaemon32HMDWidgetMonitoredCharacteristic alloc] initWithCharacteristic:v2 reachabilityMonitored:0];

  return v3;
}

id __60__HMDWidgetTimelineRefresher_characteristicsFromActionSets___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = [a2 actions];
    uint64_t v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_307);

    uint64_t v4 = [MEMORY[0x263EFFA08] setWithArray:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

id __59__HMDWidgetTimelineRefresher_characteristicsFromActionSet___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;
  uint64_t v5 = [v4 characteristic];

  return v5;
}

- (void)refreshTimelineForWidgetKinds:(void *)a3 withReason:(int)a4 shouldCoalesce:
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    uint64_t v9 = [a1 workQueue];
    dispatch_assert_queue_V2(v9);

    if ([v7 count])
    {
      if (!a4)
      {
        uint64_t v23 = [a1 widgetRefreshCoalesceKinds];
        uint64_t v24 = [v7 setByAddingObjectsFromSet:v23];
        -[HMDWidgetTimelineRefresher _refreshTimelineForWidgetKinds:withReason:](a1, v24, v8);
LABEL_11:

        goto LABEL_12;
      }
      uint64_t v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = a1;
      long long v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        long long v13 = HMFGetLogIdentifier();
        long long v14 = [v7 allObjects];
        uint64_t v15 = [v14 componentsJoinedByString:@", "];
        int v25 = 138543874;
        id v26 = v13;
        __int16 v27 = 2112;
        id v28 = v8;
        __int16 v29 = 2112;
        long long v30 = v15;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Coalescing and delaying widget refresh due to %@ for kinds: %@", (uint8_t *)&v25, 0x20u);
      }
      uint64_t v16 = [v11 widgetRefreshCoalesceKinds];
      BOOL v17 = [v16 setByAddingObjectsFromSet:v7];
      [v11 setWidgetRefreshCoalesceKinds:v17];

      id v18 = [v11 widgetRefreshCoalesceTimerContext];

      if (!v18)
      {
        id v19 = (void *)MEMORY[0x230FBD990]();
        id v20 = v11;
        id v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          uint64_t v22 = HMFGetLogIdentifier();
          int v25 = 138543362;
          id v26 = v22;
          _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Starting coalescing timer", (uint8_t *)&v25, 0xCu);
        }
        [v20 setWidgetRefreshCoalesceReason:v8];
        uint64_t v23 = [v20 timerManager];
        uint64_t v24 = [v23 startTimerWithTimeInterval:@"AF927200-D9B8-4498-9175-6620DB053CC6" object:1.0];
        [v20 setWidgetRefreshCoalesceTimerContext:v24];
        goto LABEL_11;
      }
    }
  }
LABEL_12:
}

- (void)_refreshTimelineForWidgetKinds:(void *)a3 withReason:
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = [a1 widgetRefreshCoalesceTimerContext];

    if (v7)
    {
      id v8 = [a1 timerManager];
      uint64_t v9 = [a1 widgetRefreshCoalesceTimerContext];
      [v8 cancelTimerForContext:v9];
    }
    [a1 setWidgetRefreshCoalesceReason:0];
    uint64_t v10 = [MEMORY[0x263EFFA08] set];
    [a1 setWidgetRefreshCoalesceKinds:v10];

    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = a1;
    long long v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      long long v14 = HMFGetLogIdentifier();
      uint64_t v15 = [v5 allObjects];
      uint64_t v16 = [v15 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v26 = 2112;
      __int16 v27 = v16;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Refreshing widget due to %@ for kinds: %@", buf, 0x20u);
    }
    BOOL v17 = [v12 workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__HMDWidgetTimelineRefresher__refreshTimelineForWidgetKinds_withReason___block_invoke;
    block[3] = &unk_264A2F2F8;
    id v19 = v5;
    id v20 = v12;
    id v21 = v6;
    dispatch_async(v17, block);
  }
}

void __72__HMDWidgetTimelineRefresher__refreshTimelineForWidgetKinds_withReason___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)v24;
    *(void *)&long long v3 = 138543874;
    long long v21 = v3;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v8 = objc_msgSend(*(id *)(a1 + 40), "timelineController", v21);
        uint64_t v9 = [v8 reloadTimelineWithExtensionBundleIdentifier:@"com.apple.Home.HomeWidget.Interactive" kind:v7 reason:*(void *)(a1 + 48)];

        uint64_t v10 = (void *)MEMORY[0x230FBD990]();
        id v11 = *(id *)(a1 + 40);
        id v12 = HMFGetOSLogHandle();
        long long v13 = v12;
        if (v9)
        {
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            goto LABEL_12;
          }
          long long v14 = HMFGetLogIdentifier();
          *(_DWORD *)buf = v21;
          uint64_t v28 = v14;
          __int16 v29 = 2114;
          uint64_t v30 = v7;
          __int16 v31 = 2112;
          long long v32 = v9;
          uint64_t v15 = v13;
          os_log_type_t v16 = OS_LOG_TYPE_ERROR;
          BOOL v17 = "%{public}@Failed reload of timeline for '%{public}@': %@";
        }
        else
        {
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_12;
          }
          long long v14 = HMFGetLogIdentifier();
          id v18 = *(void **)(a1 + 48);
          *(_DWORD *)buf = v21;
          uint64_t v28 = v14;
          __int16 v29 = 2114;
          uint64_t v30 = v7;
          __int16 v31 = 2114;
          long long v32 = v18;
          uint64_t v15 = v13;
          os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
          BOOL v17 = "%{public}@Successfully reloaded timeline for '%{public}@' due to %{public}@";
        }
        _os_log_impl(&dword_22F52A000, v15, v16, v17, buf, 0x20u);

LABEL_12:
        id v19 = [*(id *)(a1 + 40) logEventSubmitter];
        id v20 = [[HMDWidgetTimelineRefresherLogEvent alloc] initWithKind:v7 reason:*(void *)(a1 + 48)];
        [v19 submitLogEvent:v20 error:v9];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v4);
  }
}

uint64_t __61__HMDWidgetTimelineRefresher_device_receivedAttributeReport___block_invoke_345(uint64_t a1, void *a2)
{
  return [a2 kind];
}

void __66__HMDWidgetTimelineRefresher_relevantWidgetsForAttributes_nodeID___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __66__HMDWidgetTimelineRefresher_relevantWidgetsForAttributes_nodeID___block_invoke_2;
  uint64_t v9 = &unk_264A1B550;
  id v10 = a1[4];
  id v11 = a1[5];
  if (objc_msgSend(a3, "na_any:", &v6)) {
    objc_msgSend(a1[6], "addObject:", v5, v6, v7, v8, v9, v10);
  }
}

uint64_t __66__HMDWidgetTimelineRefresher_relevantWidgetsForAttributes_nodeID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 nodeID];
  int v5 = [v4 isEqualToNumber:*(void *)(a1 + 32)];

  if (v5)
  {
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v7 = [v3 attributePaths];
    uint64_t v8 = [v6 intersectsSet:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (NSUUID)messageTargetUUID
{
  uint64_t v2 = [(HMDWidgetTimelineRefresher *)self homeManager];
  id v3 = [v2 messageTargetUUID];

  return (NSUUID *)v3;
}

- (void)handleTimerFiredForActionSet:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Clearing cached error for action set: %@", buf, 0x16u);
  }
  uint64_t v9 = [v4 uuid];
  id v10 = [(HMDWidgetTimelineRefresher *)v6 cachedActionSetExecuteErrorByUUID];
  [v10 removeObjectForKey:v9];

  id v11 = [(HMDWidgetTimelineRefresher *)v6 cachedActionSetExecuteErrorTimerContextByUUID];
  [v11 removeObjectForKey:v9];

  id v12 = [MEMORY[0x263EFF9C0] set];
  long long v13 = [(HMDWidgetTimelineRefresher *)v6 monitoredActionSetsMapByWidget];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __59__HMDWidgetTimelineRefresher_handleTimerFiredForActionSet___block_invoke;
  v16[3] = &unk_264A1B680;
  id v17 = v12;
  id v18 = v4;
  id v14 = v4;
  id v15 = v12;
  [v13 enumerateKeysAndObjectsUsingBlock:v16];

  -[HMDWidgetTimelineRefresher refreshTimelineForWidgetKinds:withReason:shouldCoalesce:](v6, v15, @"Action Set Error Cleared", 1);
}

void __59__HMDWidgetTimelineRefresher_handleTimerFiredForActionSet___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = [v7 kind];
  LOBYTE(v9) = [v9 containsObject:v10];

  if ((v9 & 1) == 0)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          if (objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "isEqual:", *(void *)(a1 + 40), (void)v18))
          {
            os_log_type_t v16 = *(void **)(a1 + 32);
            id v17 = [v7 kind];
            [v16 addObject:v17];

            *a4 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (void)timerManager:(id)a3 didFireForTimerContext:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDWidgetTimelineRefresher *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(HMDWidgetTimelineRefresher *)self widgetRefreshCoalesceTimerContext];

  if (v9 == v7)
  {
    uint64_t v14 = (void *)MEMORY[0x230FBD990]([(HMDWidgetTimelineRefresher *)self setWidgetRefreshCoalesceTimerContext:0]);
    id v15 = self;
    os_log_type_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      int v24 = 138543362;
      long long v25 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Widget refresh coalescing timer fired.", (uint8_t *)&v24, 0xCu);
    }
    id v13 = [(HMDWidgetTimelineRefresher *)v15 widgetRefreshCoalesceKinds];
    long long v18 = [(HMDWidgetTimelineRefresher *)v15 widgetRefreshCoalesceReason];
    -[HMDWidgetTimelineRefresher _refreshTimelineForWidgetKinds:withReason:](v15, v13, v18);

    goto LABEL_15;
  }
  id v10 = [(HMDWidgetTimelineRefresher *)self actionSetPrimaryStateUpdateCoalesceTimerContext];

  if (v10 != v7)
  {
    id v11 = [v7 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    id v13 = v12;

    if (v13)
    {
      [(HMDWidgetTimelineRefresher *)self handleTimerFiredForActionSet:v13];
    }
    else
    {
      long long v19 = (void *)MEMORY[0x230FBD990]();
      long long v20 = self;
      long long v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = HMFGetLogIdentifier();
        uint64_t v23 = [v7 object];
        int v24 = 138543618;
        long long v25 = v22;
        __int16 v26 = 2112;
        __int16 v27 = v23;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Timer manager fired with object that is unexpected: %@", (uint8_t *)&v24, 0x16u);
      }
    }
LABEL_15:

    goto LABEL_16;
  }
  [(HMDWidgetTimelineRefresher *)self _clearExpiredActionSetPrimaryStateUpdates];
LABEL_16:
}

- (void)_refreshWidgetsIfActionSetsHaveChanged:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(HMDWidgetTimelineRefresher *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [MEMORY[0x263EFF9C0] set];
  id v7 = [(HMDWidgetTimelineRefresher *)self monitoredActionSetsMapByWidget];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __69__HMDWidgetTimelineRefresher__refreshWidgetsIfActionSetsHaveChanged___block_invoke;
  v18[3] = &unk_264A1B578;
  id v8 = v4;
  id v19 = v8;
  long long v20 = self;
  long long v21 = v6;
  [v7 enumerateKeysAndObjectsUsingBlock:v18];

  uint64_t v9 = [v6 count];
  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v13)
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      id v25 = v8;
      __int16 v26 = 2112;
      __int16 v27 = v6;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling action set change (%@) and refreshing timeline for widgets: %@", buf, 0x20u);
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __69__HMDWidgetTimelineRefresher__refreshWidgetsIfActionSetsHaveChanged___block_invoke_328;
    v16[3] = &unk_264A1B770;
    void v16[4] = v11;
    v16[5] = v6;
    id v17 = v8;
    -[HMDWidgetTimelineRefresher cleanUpRemovedWidgetsFromWidgets:completion:](v11, v6, v16);
  }
  else
  {
    if (v13)
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v15;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@No widgets need to be refreshed from this action set change: %@", buf, 0x16u);
    }
  }
}

void __69__HMDWidgetTimelineRefresher__refreshWidgetsIfActionSetsHaveChanged___block_invoke(id *a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __69__HMDWidgetTimelineRefresher__refreshWidgetsIfActionSetsHaveChanged___block_invoke_2;
  v26[3] = &unk_264A210B8;
  id v27 = a1[4];
  int v9 = objc_msgSend(v8, "na_any:", v26);

  if (v9)
  {
    long long v21 = a4;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          os_log_type_t v16 = [a1[5] cachedIsOnStateByActionSet];
          id v17 = [v16 objectForKey:v15];

          uint64_t v18 = [a1[5] actionSetIsOn:v15];
          if (!v17 || v18 != [v17 BOOLValue])
          {
            id v19 = [a1[5] cachedIsOnStateByActionSet];
            long long v20 = [NSNumber numberWithBool:v18];
            [v19 setObject:v20 forKey:v15];

            [a1[6] addObject:v7];
            unsigned char *v21 = 1;

            goto LABEL_13;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
}

void __69__HMDWidgetTimelineRefresher__refreshWidgetsIfActionSetsHaveChanged___block_invoke_328(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v4);

  int v5 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 40) minusSet:v3]);
  id v6 = *(id *)(a1 + 32);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    int v12 = 138543874;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Refreshing timeline due to action set (%@) change for configured widgets: %@", (uint8_t *)&v12, 0x20u);
  }
  uint64_t v11 = objc_msgSend(*(id *)(a1 + 40), "na_map:", &__block_literal_global_331);
  -[HMDWidgetTimelineRefresher refreshTimelineForWidgetKinds:withReason:shouldCoalesce:](*(void **)(a1 + 32), v11, @"Action set state changed", 0);
}

uint64_t __69__HMDWidgetTimelineRefresher__refreshWidgetsIfActionSetsHaveChanged___block_invoke_329(uint64_t a1, void *a2)
{
  return [a2 kind];
}

uint64_t __69__HMDWidgetTimelineRefresher__refreshWidgetsIfActionSetsHaveChanged___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 uuid];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (void)didUpdateStateWithActionSetUUID:(id)a3 state:(BOOL)a4
{
  id v5 = a3;
  id v6 = [(HMDWidgetTimelineRefresher *)self workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__HMDWidgetTimelineRefresher_didUpdateStateWithActionSetUUID_state___block_invoke;
  v8[3] = &unk_264A2F820;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __68__HMDWidgetTimelineRefresher_didUpdateStateWithActionSetUUID_state___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [MEMORY[0x263F08C38] zeroUUID];
  [v2 _removePendingRequestValueForUUID:v3 messageIdentifier:v4];

  id v5 = [*(id *)(a1 + 32) actionSetsPendingPrimaryResidentStateUpdates];
  [v5 removeObject:*(void *)(a1 + 40)];

  id v6 = *(void **)(a1 + 32);
  id v7 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 40)];
  [v6 _refreshWidgetsIfActionSetsHaveChanged:v7];
}

- (BOOL)evaluateActionSetStateOnPrimaryEnabledForHome:(id)a3
{
  uint64_t v3 = [a3 primaryResident];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 capabilities];
    char v6 = [v5 supportsResidentActionSetStateEvaluation];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)handleRestrictedGuestScheduleEventForUser:(id)a3
{
  if ([a3 isCurrentUser])
  {
    uint64_t v4 = [(HMDWidgetTimelineRefresher *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__HMDWidgetTimelineRefresher_handleRestrictedGuestScheduleEventForUser___block_invoke;
    block[3] = &unk_264A2F7F8;
    void block[4] = self;
    dispatch_async(v4, block);
  }
}

void __72__HMDWidgetTimelineRefresher_handleRestrictedGuestScheduleEventForUser___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Refreshing all Home widgets because of current user RG schedule changes", (uint8_t *)&v8, 0xCu);
  }
  char v6 = [*(id *)(a1 + 32) forceUpdateAutobahnTimelineHandler];
  id v7 = [*(id *)(a1 + 32) activeWidgetKinds];
  ((void (**)(void, void *))v6)[2](v6, v7);

  -[HMDWidgetTimelineRefresher refreshTimelineForConfiguredWidgetsWithReason:](*(void **)(a1 + 32), @"RG schedule");
}

- (void)refreshTimelineForConfiguredWidgetsWithReason:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [a1 widgetConfigurationReader];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __76__HMDWidgetTimelineRefresher_refreshTimelineForConfiguredWidgetsWithReason___block_invoke;
    v5[3] = &unk_264A2E1A0;
    v5[4] = a1;
    id v6 = v3;
    [v4 fetchHomeWidgetsWithCompletion:v5];
  }
}

void __76__HMDWidgetTimelineRefresher_refreshTimelineForConfiguredWidgetsWithReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) workQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __76__HMDWidgetTimelineRefresher_refreshTimelineForConfiguredWidgetsWithReason___block_invoke_2;
  v12[3] = &unk_264A2E610;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v8;
  id v15 = v6;
  id v16 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, v12);
}

void __76__HMDWidgetTimelineRefresher_refreshTimelineForConfiguredWidgetsWithReason___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = (void *)MEMORY[0x263EFFA08];
    uint64_t v4 = objc_msgSend(v2, "na_map:", &__block_literal_global_320);
    id v10 = [v3 setWithArray:v4];

    -[HMDWidgetTimelineRefresher refreshTimelineForWidgetKinds:withReason:shouldCoalesce:](*(void **)(a1 + 40), v10, *(void **)(a1 + 56), 0);
  }
  else
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 40);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      int v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch configured widgets to refresh with error: %@", buf, 0x16u);
    }
  }
}

uint64_t __76__HMDWidgetTimelineRefresher_refreshTimelineForConfiguredWidgetsWithReason___block_invoke_318(uint64_t a1, void *a2)
{
  return [a2 kind];
}

- (void)handleRestrictedGuestScheduleEndedNotification:(id)a3
{
  uint64_t v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v7 = v5;

  id v6 = v7;
  if (v7)
  {
    [(HMDWidgetTimelineRefresher *)self handleRestrictedGuestScheduleEventForUser:v7];
    id v6 = v7;
  }
}

- (void)handleRestrictedGuestScheduleStartedNotification:(id)a3
{
  uint64_t v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v7 = v5;

  id v6 = v7;
  if (v7)
  {
    [(HMDWidgetTimelineRefresher *)self handleRestrictedGuestScheduleEventForUser:v7];
    id v6 = v7;
  }
}

- (void)handleAccessoryReachabilityChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDWidgetTimelineRefresher *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__HMDWidgetTimelineRefresher_handleAccessoryReachabilityChangedNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __77__HMDWidgetTimelineRefresher_handleAccessoryReachabilityChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [v4 home];
    id v7 = v6;
    if (v5)
    {
      int v8 = [v6 hasAnyResident];

      if (v8)
      {
        uint64_t v9 = [*(id *)(a1 + 40) accessoryIsReachableByUUID];
        id v10 = [v4 uuid];
        id v11 = [v9 objectForKeyedSubscript:v10];

        if (v11) {
          int v12 = [v11 BOOLValue];
        }
        else {
          int v12 = 1;
        }
        unsigned int v13 = [v4 isRemotelyReachable];
        if (v12 != v13)
        {
          unsigned int v45 = v13;
          uint64_t v46 = v11;
          uint64_t v14 = [MEMORY[0x263EFF9C0] set];
          uint64_t v15 = objc_opt_class();
          id v16 = [*(id *)(a1 + 40) activeWidgetKinds];
          id v47 = [v15 fetchSpecificationsForWidgetKinds:v16];

          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          uint64_t v17 = a1;
          uint64_t v18 = [*(id *)(a1 + 40) monitoredCharacteristics];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v50 objects:v62 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v51;
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v51 != v21) {
                  objc_enumerationMutation(v18);
                }
                long long v23 = *(void **)(*((void *)&v50 + 1) + 8 * i);
                long long v24 = [v23 accessory];
                int v25 = [v24 isEqual:v4];

                if (v25)
                {
                  __int16 v26 = [*(id *)(v17 + 40) widgetKindsToUpdateFromFetchSpecifications:v47 assumingChangedCharacteristic:v23];
                  [v14 unionSet:v26];
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v50 objects:v62 count:16];
            }
            while (v20);
          }

          id v27 = v14;
          if ([v14 count])
          {
            uint64_t v28 = (void *)MEMORY[0x230FBD990]();
            uint64_t v29 = v17;
            id v30 = *(id *)(v17 + 40);
            __int16 v31 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              long long v32 = HMFGetLogIdentifier();
              long long v43 = [v4 home];
              [v43 name];
              v33 = id v44 = v28;
              uint64_t v34 = [v4 name];
              long long v35 = HMFBooleanToString();
              *(_DWORD *)buf = 138544130;
              id v55 = v32;
              __int16 v56 = 2112;
              long long v57 = v33;
              __int16 v58 = 2112;
              long long v59 = v34;
              __int16 v60 = 2112;
              v61 = v35;
              _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Accessory '%@:%@' reachability changed to %@.", buf, 0x2Au);

              uint64_t v28 = v44;
            }

            long long v36 = [NSNumber numberWithBool:v45];
            long long v37 = [*(id *)(v29 + 40) accessoryIsReachableByUUID];
            long long v38 = [v4 uuid];
            [v37 setObject:v36 forKeyedSubscript:v38];

            long long v39 = *(void **)(v29 + 40);
            if (v45)
            {
              dispatch_time_t v40 = dispatch_time(0, [v39 reachabilityUpdateDispatchDelayNs]);
              long long v41 = [*(id *)(v29 + 40) workQueue];
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = __77__HMDWidgetTimelineRefresher_handleAccessoryReachabilityChangedNotification___block_invoke_323;
              block[3] = &unk_264A2F820;
              void block[4] = *(void *)(v29 + 40);
              id v49 = v14;
              dispatch_after(v40, v41, block);

              id v27 = v14;
            }
            else
            {
              long long v42 = [v39 forceUpdateAutobahnTimelineHandler];
              ((void (**)(void, void *))v42)[2](v42, v14);
            }
          }

          id v11 = v46;
        }
      }
    }
    else
    {
    }
  }
}

void __77__HMDWidgetTimelineRefresher_handleAccessoryReachabilityChangedNotification___block_invoke_323(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) forceUpdateAutobahnTimelineHandler];
  v2[2](v2, *(void *)(a1 + 40));
}

- (void)handleNotificationOfPossibleNewWidget:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 name];
  id v6 = [(HMDWidgetTimelineRefresher *)self activeWidgetKinds];
  char v7 = [v6 containsObject:v5];

  int v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  id v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v11)
    {
      int v12 = HMFGetLogIdentifier();
      unsigned int v13 = [v4 object];
      int v16 = 138543874;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      uint64_t v19 = v5;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Duplicate widget '%@' with payload '%@' ignored", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
    if (v11)
    {
      uint64_t v14 = HMFGetLogIdentifier();
      uint64_t v15 = [v4 object];
      int v16 = 138543874;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      uint64_t v19 = v5;
      __int16 v20 = 2112;
      uint64_t v21 = v15;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@New widget '%@' has been spotted, with payload '%@'", (uint8_t *)&v16, 0x20u);
    }
    [(HMDWidgetTimelineRefresher *)v9 fetchAndStoreActiveWidgetKinds];
    -[HMDWidgetTimelineRefresher updateMonitoredCharacteristicsAndRefreshWidgetTimelines](v9);
  }
}

- (void)updateMonitoredCharacteristicsAndRefreshWidgetTimelines
{
  if (a1)
  {
    uint64_t v2 = [a1 workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __85__HMDWidgetTimelineRefresher_updateMonitoredCharacteristicsAndRefreshWidgetTimelines__block_invoke;
    block[3] = &unk_264A2F7F8;
    void block[4] = a1;
    dispatch_async(v2, block);
  }
}

void __85__HMDWidgetTimelineRefresher_updateMonitoredCharacteristicsAndRefreshWidgetTimelines__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) monitoredCharacteristics];
  id v3 = (void *)[v2 copy];

  [*(id *)(a1 + 32) stopMonitoringOldCharacteristics];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 homeManager];
  id v6 = [*(id *)(a1 + 32) currentHomeUUID];
  char v7 = [(id)v5 _homeWithUUID:v6];
  int v8 = [*(id *)(a1 + 32) activeWidgetKinds];
  uint64_t v9 = [v4 internalMonitorCharacteristicsForCurrentHome:v7 activeWidgetKinds:v8];
  [*(id *)(a1 + 32) setMonitoredCharacteristics:v9];

  id v10 = [*(id *)(a1 + 32) monitoredCharacteristics];
  LOBYTE(v5) = [v3 isEqualToSet:v10];

  if ((v5 & 1) == 0)
  {
    BOOL v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 32);
    unsigned int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v17 = 138543362;
      __int16 v18 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Refreshing all Home widgets because of major changes / daemon restart", (uint8_t *)&v17, 0xCu);
    }
    uint64_t v15 = [*(id *)(a1 + 32) forceUpdateAutobahnTimelineHandler];
    int v16 = [*(id *)(a1 + 32) activeWidgetKinds];
    ((void (**)(void, void *))v15)[2](v15, v16);
  }
}

- (void)handleResidentDeviceAddedOrRemovedNotification:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"HMDResidentDeviceManagerHomeUUIDNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v7 = v6;
  }
  else {
    char v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  BOOL v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    unsigned int v13 = [(HMDWidgetTimelineRefresher *)v10 homeManager];
    uint64_t v14 = [v13 _homeWithUUID:v8];
    uint64_t v15 = [v14 name];
    int v16 = 138543618;
    int v17 = v12;
    __int16 v18 = 2112;
    uint64_t v19 = v15;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Resident was added or removed for home %@, resetting all characteristic notifications", (uint8_t *)&v16, 0x16u);
  }
  -[HMDWidgetTimelineRefresher updateMonitoredCharacteristicsAndRefreshWidgetTimelines](v10);
}

- (void)handleResidentDeviceChangedNotification:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"HMDResidentDeviceManagerResidentDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v7 = v6;
  }
  else {
    char v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = [v4 userInfo];
  id v10 = [v9 objectForKeyedSubscript:@"HMDResidentDeviceManagerHomeUUIDNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v11 = v10;
  }
  else {
    BOOL v11 = 0;
  }
  id v12 = v11;

  unsigned int v13 = (void *)MEMORY[0x230FBD990]();
  uint64_t v14 = self;
  uint64_t v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v16 = HMFGetLogIdentifier();
    int v17 = [v8 name];
    __int16 v18 = [(HMDWidgetTimelineRefresher *)v14 homeManager];
    uint64_t v19 = [v18 _homeWithUUID:v12];
    [v19 name];
    id v24 = v4;
    id v20 = v12;
    uint64_t v21 = v13;
    long long v23 = v22 = v8;
    *(_DWORD *)buf = 138543874;
    __int16 v26 = v16;
    __int16 v27 = 2112;
    uint64_t v28 = v17;
    __int16 v29 = 2112;
    id v30 = v23;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Resident has changed to %@ for home %@, resetting all characteristic notifications", buf, 0x20u);

    id v8 = v22;
    unsigned int v13 = v21;
    id v12 = v20;
    id v4 = v24;
  }
  -[HMDWidgetTimelineRefresher updateMonitoredCharacteristicsAndRefreshWidgetTimelines](v14);
}

- (void)handleAccessoryRemovedNotification:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"HMDAccessoryNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v7 = v6;
  }
  else {
    char v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  id v12 = (void *)MEMORY[0x230FBD990]();
  unsigned int v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    int v16 = [v11 name];
    int v17 = [v8 name];
    int v18 = 138543874;
    uint64_t v19 = v15;
    __int16 v20 = 2112;
    uint64_t v21 = v16;
    __int16 v22 = 2112;
    long long v23 = v17;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Accessory '%@:%@' was removed, resetting all characteristic notifications", (uint8_t *)&v18, 0x20u);
  }
  -[HMDWidgetTimelineRefresher updateMonitoredCharacteristicsAndRefreshWidgetTimelines](v13);
}

- (void)handleAccessoryAddedNotification:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"HMDNotificationAddedAccessoryKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v7 = v6;
  }
  else {
    char v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  id v12 = (void *)MEMORY[0x230FBD990]();
  unsigned int v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    int v16 = [v11 name];
    int v17 = [v8 name];
    int v18 = 138543874;
    uint64_t v19 = v15;
    __int16 v20 = 2112;
    uint64_t v21 = v16;
    __int16 v22 = 2112;
    long long v23 = v17;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Accessory '%@:%@' was added, resetting all characteristic notifications", (uint8_t *)&v18, 0x20u);
  }
  -[HMDWidgetTimelineRefresher updateMonitoredCharacteristicsAndRefreshWidgetTimelines](v13);
}

- (void)handleHomeRemovedNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"HMDHomeNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v7 = v6;
  }
  else {
    char v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    unsigned int v13 = [v8 shortDescription];
    int v14 = 138543618;
    uint64_t v15 = v12;
    __int16 v16 = 2112;
    int v17 = v13;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Home '%@' was removed, resetting all characteristic notifications", (uint8_t *)&v14, 0x16u);
  }
  -[HMDWidgetTimelineRefresher updateMonitoredCharacteristicsAndRefreshWidgetTimelines](v10);
}

- (void)handleHomeAddedNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"HMDHomeNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v7 = v6;
  }
  else {
    char v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    unsigned int v13 = [v8 shortDescription];
    int v14 = 138543618;
    uint64_t v15 = v12;
    __int16 v16 = 2112;
    int v17 = v13;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Home '%@' was added, resetting all characteristic notifications", (uint8_t *)&v14, 0x16u);
  }
  -[HMDWidgetTimelineRefresher updateMonitoredCharacteristicsAndRefreshWidgetTimelines](v10);
}

- (void)handleCurrentOrPrimaryHomeChangedNotification:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 name];
  int v6 = [v5 isEqualToString:@"HMDNotificationCurrentHomeDidChange"];

  if (v6) {
    [(HMDWidgetTimelineRefresher *)self handleCurrentHomeChangeNotification:v4];
  }
  char v7 = [(HMDWidgetTimelineRefresher *)self homeManager];
  id v8 = [v7 currentHomeUUID];
  if (v8 || ([v7 primaryHomeUUID], (id v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v9 = [(HMDWidgetTimelineRefresher *)self currentHomeUUID];
    char v10 = HMFEqualObjects();

    if ((v10 & 1) == 0)
    {
      id v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = self;
      unsigned int v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v14 = HMFGetLogIdentifier();
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        uint64_t v15 = [(HMDWidgetTimelineRefresher *)v12 currentHomeUUID];

        if (v15)
        {
          __int16 v16 = [(HMDWidgetTimelineRefresher *)v12 currentHomeUUID];
          [v16 getUUIDBytes:buf];
        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x263F42690];
        }
        long long v18 = *(_OWORD *)buf;
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        [v8 getUUIDBytes:buf];
        long long v17 = *(_OWORD *)buf;
        *(_DWORD *)buf = 138544386;
        *(void *)&uint8_t buf[4] = v14;
        *(_WORD *)&buf[12] = 1040;
        *(_DWORD *)&buf[14] = 16;
        __int16 v20 = 2096;
        uint64_t v21 = &v18;
        __int16 v22 = 1040;
        int v23 = 16;
        __int16 v24 = 2096;
        int v25 = &v17;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Current home changed from %{uuid_t}.16P to %{uuid_t}.16P, resetting all characteristic notifications", buf, 0x2Cu);
      }
      [(HMDWidgetTimelineRefresher *)v12 setCurrentHomeUUID:v8];
      -[HMDWidgetTimelineRefresher updateMonitoredCharacteristicsAndRefreshWidgetTimelines](v12);
    }
  }
}

- (BOOL)_value:(id)a3 isApproximatelyEqualToValue:(id)a4 forMinimumValue:(id)a5 maximumValue:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v13 = v11;
  }
  else {
    unsigned int v13 = 0;
  }
  id v14 = v13;
  id v15 = v12;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v16 = v15;
  }
  else {
    __int16 v16 = 0;
  }
  id v17 = v16;

  if (v14) {
    BOOL v18 = v17 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  if (v18) {
    goto LABEL_21;
  }
  id v19 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v20 = v19;
  }
  else {
    __int16 v20 = 0;
  }
  id v21 = v20;

  id v22 = v10;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v23 = v22;
  }
  else {
    int v23 = 0;
  }
  id v24 = v23;

  if (!v21 || !v24)
  {

LABEL_21:
    char v32 = [v9 isEqual:v10];
    goto LABEL_22;
  }
  [v21 floatValue];
  float v26 = v25;
  [v24 floatValue];
  float v28 = vabds_f32(v26, v27);
  [v17 floatValue];
  float v30 = v29;
  [v14 floatValue];
  char v32 = v28 <= (float)((float)(v30 - v31) * 0.02);

LABEL_22:
  return v32;
}

- (BOOL)actionSetIsOn:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 home];
  id v24 = v27 = self;
  BOOL v28 = -[HMDWidgetTimelineRefresher evaluateActionSetStateOnPrimaryEnabledForHome:](self, "evaluateActionSetStateOnPrimaryEnabledForHome:");
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  float v25 = v4;
  id obj = [v4 actions];
  uint64_t v30 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(id *)(*((void *)&v31 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          char v7 = v6;
        }
        else {
          char v7 = 0;
        }
        id v8 = v7;

        if (v8)
        {
          id v9 = [v8 characteristic];
          id v10 = [v9 value];
          id v11 = [v8 targetValue];
          id v12 = [v9 metadata];
          unsigned int v13 = [v12 minimumValue];
          id v14 = [v9 metadata];
          id v15 = [v14 maximumValue];
          int v16 = [(HMDWidgetTimelineRefresher *)v27 _value:v10 isApproximatelyEqualToValue:v11 forMinimumValue:v13 maximumValue:v15]|| v28;

          if (v16 != 1
            || ([v9 accessory],
                id v17 = objc_claimAutoreleasedReturnValue(),
                char v18 = [v17 isRemotelyReachable],
                v17,
                (v18 & 1) == 0))
          {

            char v22 = 0;
            id v19 = v24;
            id v21 = v25;
            goto LABEL_18;
          }
        }
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v30) {
        continue;
      }
      break;
    }
  }

  if (v28)
  {
    id v19 = v24;
    __int16 v20 = [v24 actionSetStateSubscriptionManager];
    id v21 = v25;
    id v8 = [v25 uuid];
    id obj = v20;
    char v22 = [v20 isActionSetOn:v8];
LABEL_18:
  }
  else
  {
    char v22 = 1;
    id v19 = v24;
    id v21 = v25;
  }

  return v22;
}

- (id)thresholdForCharacteristic:(id)a3
{
  id v3 = a3;
  id v4 = [v3 service];
  if (!v4) {
    goto LABEL_16;
  }
  uint64_t v5 = [v3 type];
  if (([v5 isEqualToString:*MEMORY[0x263F354A8]] & 1) == 0)
  {

    goto LABEL_9;
  }
  id v6 = [v4 type];
  if (([v6 isEqualToString:*MEMORY[0x263F35780]] & 1) == 0)
  {
    char v7 = [v4 type];
    if ([v7 isEqualToString:*MEMORY[0x263F35790]])
    {

      goto LABEL_6;
    }
    unsigned int v13 = [v4 type];
    char v14 = [v13 isEqualToString:*MEMORY[0x263F356F0]];

    if (v14) {
      goto LABEL_7;
    }
LABEL_9:
    id v9 = [v3 type];
    if ([v9 isEqualToString:*MEMORY[0x263F35498]])
    {
      id v10 = [v4 type];
      if ([v10 isEqualToString:*MEMORY[0x263F35780]])
      {
LABEL_13:

LABEL_14:
        id v8 = &unk_26E471188;
        goto LABEL_17;
      }
      id v11 = [v4 type];
      if ([v11 isEqualToString:*MEMORY[0x263F35790]])
      {

        goto LABEL_13;
      }
      id v15 = [v4 type];
      char v16 = [v15 isEqualToString:*MEMORY[0x263F356F8]];

      if (v16) {
        goto LABEL_14;
      }
    }
    else
    {
    }
LABEL_16:
    id v8 = 0;
    goto LABEL_17;
  }
LABEL_6:

LABEL_7:
  id v8 = &unk_26E4746C8;
LABEL_17:

  return v8;
}

- (id)actionSetsByHome:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "home", (void)v17);
        if (v11)
        {
          id v12 = [v4 objectForKey:v11];

          if (!v12)
          {
            unsigned int v13 = [MEMORY[0x263EFF9C0] set];
            [v4 setObject:v13 forKey:v11];
          }
          char v14 = [v4 objectForKey:v11];
          [v14 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  id v15 = (void *)[v4 copy];
  return v15;
}

- (void)handleSelectedHomeChangedNotification
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = [(HMDWidgetTimelineRefresher *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Handling selected home changed notification. Refreshing timeline for configured widgets", (uint8_t *)&v8, 0xCu);
  }
  -[HMDWidgetTimelineRefresher refreshTimelineForConfiguredWidgetsWithReason:](v5, @"Selected home changed");
}

- (void)handleHomeSensingChangedNotification
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = [(HMDWidgetTimelineRefresher *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Handling home sensing changed notification. Refreshing timeline for configured widgets", (uint8_t *)&v8, 0xCu);
  }
  -[HMDWidgetTimelineRefresher refreshTimelineForConfiguredWidgetsWithReason:](v5, @"Home sensing changed");
}

- (void)handleNotifiedXPCClientsOfHomeConfigurationChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDWidgetTimelineRefresher *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __92__HMDWidgetTimelineRefresher_handleNotifiedXPCClientsOfHomeConfigurationChangeNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __92__HMDWidgetTimelineRefresher_handleNotifiedXPCClientsOfHomeConfigurationChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) name];
    uint64_t v7 = [*(id *)(a1 + 32) homeManager];
    int v8 = 138543874;
    id v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    __int16 v12 = 2048;
    uint64_t v13 = [v7 generationCounter];
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling %{public}@. Generation counter: %lu. Refreshing timeline for configured widgets", (uint8_t *)&v8, 0x20u);
  }
  -[HMDWidgetTimelineRefresher refreshTimelineForConfiguredWidgetsWithReason:](*(void **)(a1 + 32), @"Home config changed");
}

- (void)handleCurrentHomeChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDWidgetTimelineRefresher *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__HMDWidgetTimelineRefresher_handleCurrentHomeChangeNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __66__HMDWidgetTimelineRefresher_handleCurrentHomeChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [*(id *)(a1 + 40) name];
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    uint64_t v7 = [*(id *)(a1 + 40) userInfo];
    id v8 = objc_msgSend(v7, "hmf_UUIDForKey:", @"HMDPreviousHomeUUIDKey");

    if (v8)
    {
      id v9 = [*(id *)(a1 + 40) userInfo];
      __int16 v10 = objc_msgSend(v9, "hmf_UUIDForKey:", @"HMDPreviousHomeUUIDKey");
      [v10 getUUIDBytes:buf];
    }
    else
    {
      *(_OWORD *)buf = *MEMORY[0x263F42690];
    }
    long long v16 = *(_OWORD *)buf;
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    id v11 = [*(id *)(a1 + 40) userInfo];
    __int16 v12 = objc_msgSend(v11, "hmf_UUIDForKey:", @"HMDCurrentHomeUUIDKey");

    if (v12)
    {
      uint64_t v13 = [*(id *)(a1 + 40) userInfo];
      uint64_t v14 = objc_msgSend(v13, "hmf_UUIDForKey:", @"HMDCurrentHomeUUIDKey");
      [v14 getUUIDBytes:buf];
    }
    else
    {
      *(_OWORD *)buf = *MEMORY[0x263F42690];
    }
    long long v15 = *(_OWORD *)buf;
    *(_DWORD *)buf = 138544642;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    __int16 v18 = 1040;
    int v19 = 16;
    __int16 v20 = 2096;
    id v21 = &v16;
    __int16 v22 = 1040;
    int v23 = 16;
    __int16 v24 = 2096;
    float v25 = &v15;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling %{public}@. Previous: %{uuid_t}.16P, Current %{uuid_t}.16P. Refreshing timeline for configured widgets", buf, 0x36u);
  }
  -[HMDWidgetTimelineRefresher refreshTimelineForConfiguredWidgetsWithReason:](*(void **)(a1 + 32), @"Current home changed");
}

- (void)handleAccessoryRemoteReachabilityChangedNotification:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [(HMDWidgetTimelineRefresher *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__HMDWidgetTimelineRefresher_handleAccessoryRemoteReachabilityChangedNotification___block_invoke;
    block[3] = &unk_264A2F2F8;
    void block[4] = self;
    id v16 = v7;
    id v17 = v4;
    dispatch_async(v8, block);
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    __int16 v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = HMFGetLogIdentifier();
      uint64_t v13 = [v4 name];
      uint64_t v14 = [v4 object];
      *(_DWORD *)buf = 138543874;
      int v19 = v12;
      __int16 v20 = 2112;
      id v21 = v13;
      __int16 v22 = 2112;
      int v23 = v14;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Notification %@ is not from an HMDAccessory object: %@", buf, 0x20u);
    }
  }
}

void __83__HMDWidgetTimelineRefresher_handleAccessoryRemoteReachabilityChangedNotification___block_invoke(id *a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v2 = a1[4];
  id v3 = a1[5];
  if (v2)
  {
    id v4 = [v2 workQueue];
    dispatch_assert_queue_V2(v4);

    id v5 = [MEMORY[0x263EFF9C0] set];
    id v6 = [v2 monitoredCharacteristicsMapByWidget];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __58__HMDWidgetTimelineRefresher_relevantWidgetsForAccessory___block_invoke;
    v21[3] = &unk_264A1B680;
    id v7 = v3;
    id v22 = v7;
    id v8 = v5;
    id v23 = v8;
    [v6 enumerateKeysAndObjectsUsingBlock:v21];

    id v9 = [v2 monitoredActionSetsMapByWidget];
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __58__HMDWidgetTimelineRefresher_relevantWidgetsForAccessory___block_invoke_2;
    float v25 = &unk_264A1B578;
    id v26 = v2;
    id v27 = v7;
    id v10 = v8;
    id v28 = v10;
    [v9 enumerateKeysAndObjectsUsingBlock:buf];

    id v11 = v28;
    id v2 = v10;
  }
  __int16 v12 = (void *)[v2 mutableCopy];

  if ([v12 count])
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = a1[4];
    long long v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Handling reachability change for relevant widgets: %@", buf, 0x16u);
    }
    id v17 = a1[4];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __83__HMDWidgetTimelineRefresher_handleAccessoryRemoteReachabilityChangedNotification___block_invoke_270;
    v18[3] = &unk_264A1B630;
    void v18[4] = v17;
    v18[5] = v12;
    id v19 = a1[5];
    id v20 = a1[6];
    -[HMDWidgetTimelineRefresher cleanUpRemovedWidgetsFromWidgets:completion:](v17, v12, v18);
  }
}

void __83__HMDWidgetTimelineRefresher_handleAccessoryRemoteReachabilityChangedNotification___block_invoke_270(id *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [a1[4] workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)MEMORY[0x230FBD990]([a1[5] minusSet:v3]);
  id v6 = a1[4];
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    id v9 = [a1[6] uuid];

    if (v9)
    {
      id v10 = [a1[6] uuid];
      [v10 getUUIDBytes:buf];
    }
    else
    {
      *(_OWORD *)buf = *MEMORY[0x263F42690];
    }
    long long v20 = *(_OWORD *)buf;
    id v11 = a1[5];
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 1040;
    *(_DWORD *)&buf[14] = 16;
    *(_WORD *)&unsigned char buf[18] = 2096;
    *(void *)&buf[20] = &v20;
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = v11;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Refreshing timeline due to accessory (%{uuid_t}.16P) reachability change for configured widgets: %@", buf, 0x26u);
  }
  __int16 v12 = objc_msgSend(a1[5], "na_map:", &__block_literal_global_273_58325);
  if ([v12 count])
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = a1[4];
    long long v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      id v17 = [a1[7] name];
      __int16 v18 = [v12 allObjects];
      id v19 = [v18 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v17;
      *(_WORD *)&unsigned char buf[22] = 2112;
      *(void *)&unsigned char buf[24] = v19;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Handling %{public}@. Refreshing timeline for widget kinds: %@", buf, 0x20u);
    }
    -[HMDWidgetTimelineRefresher refreshTimelineForWidgetKinds:withReason:shouldCoalesce:](a1[4], v12, @"Accessory Reachability Changed", 0);
  }
}

uint64_t __83__HMDWidgetTimelineRefresher_handleAccessoryRemoteReachabilityChangedNotification___block_invoke_271(uint64_t a1, void *a2)
{
  return [a2 kind];
}

void __58__HMDWidgetTimelineRefresher_relevantWidgetsForAccessory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "characteristic", (void)v14);
        __int16 v12 = [v11 accessory];
        int v13 = [v12 isEqual:*(void *)(a1 + 32)];

        if (v13)
        {
          [*(id *)(a1 + 40) addObject:v5];
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void __58__HMDWidgetTimelineRefresher_relevantWidgetsForAccessory___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  [*(id *)(a1 + 32) actionSetsByHome:a3];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    id v23 = v5;
    uint64_t v21 = *(void *)v29;
    do
    {
      uint64_t v10 = 0;
      uint64_t v22 = v8;
      do
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * v10);
        __int16 v12 = [v6 objectForKey:v11];
        if (([*(id *)(a1 + 32) evaluateActionSetStateOnPrimaryEnabledForHome:v11] & 1) == 0)
        {
          int v13 = -[HMDWidgetTimelineRefresher characteristicsFromActionSets:](*(void **)(a1 + 32), v12);
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v14 = v13;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v25;
            while (2)
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v25 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = [*(id *)(*((void *)&v24 + 1) + 8 * i) accessory];
                char v20 = [v19 isEqual:*(void *)(a1 + 40)];

                if (v20)
                {
                  id v5 = v23;
                  [*(id *)(a1 + 48) addObject:v23];

                  goto LABEL_20;
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
              if (v16) {
                continue;
              }
              break;
            }
          }

          uint64_t v9 = v21;
          uint64_t v8 = v22;
        }

        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
      id v5 = v23;
    }
    while (v8);
  }
LABEL_20:
}

- (void)handleAccessoryCharacteristicsChangedNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDWidgetTimelineRefresher *)self modifiedCharacteristicsFromNotification:v4];
  if ([v5 count])
  {
    id v6 = [(HMDWidgetTimelineRefresher *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __80__HMDWidgetTimelineRefresher_handleAccessoryCharacteristicsChangedNotification___block_invoke;
    block[3] = &unk_264A2F2F8;
    void block[4] = self;
    void block[5] = v5;
    id v13 = v4;
    dispatch_async(v6, block);
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    uint64_t v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      uint64_t v11 = [v4 userInfo];
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Characteristics changed notification does not include modified characteristics: %@", buf, 0x16u);
    }
  }
}

void __80__HMDWidgetTimelineRefresher_handleAccessoryCharacteristicsChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  if (v2)
  {
    id v4 = [v2 workQueue];
    dispatch_assert_queue_V2(v4);

    id v5 = [MEMORY[0x263EFF9C0] set];
    id v6 = [MEMORY[0x263EFF9C0] set];
    uint64_t v7 = [v2 monitoredCharacteristicsMapByWidget];
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __91__HMDWidgetTimelineRefresher_relevantWidgetsForCharacteristics_outRelevantCharacteristics___block_invoke;
    uint64_t v36 = &unk_264A1B658;
    id v37 = v2;
    id v8 = v3;
    id v38 = v8;
    id v9 = v5;
    id v39 = v9;
    id v10 = v6;
    id v40 = v10;
    [v7 enumerateKeysAndObjectsUsingBlock:buf];

    uint64_t v11 = [v2 monitoredActionSetsMapByWidget];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __91__HMDWidgetTimelineRefresher_relevantWidgetsForCharacteristics_outRelevantCharacteristics___block_invoke_2;
    v31[3] = &unk_264A1B658;
    v31[4] = v2;
    id v32 = v8;
    id v12 = v9;
    id v33 = v12;
    id v34 = v10;
    id v13 = v10;
    [v11 enumerateKeysAndObjectsUsingBlock:v31];

    id v14 = v13;
    uint64_t v15 = v34;
    id v2 = v12;
  }
  else
  {
    id v14 = 0;
  }

  id v16 = v14;
  uint64_t v17 = [v2 count];
  uint64_t v18 = (void *)MEMORY[0x230FBD990]();
  id v19 = *(id *)(a1 + 32);
  char v20 = HMFGetOSLogHandle();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
  if (v17)
  {
    if (v21)
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v22;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v2;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Handling characteristic change for relevant widgets: %@", buf, 0x16u);
    }
    id v23 = *(void **)(a1 + 32);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __80__HMDWidgetTimelineRefresher_handleAccessoryCharacteristicsChangedNotification___block_invoke_260;
    v26[3] = &unk_264A1B608;
    void v26[4] = v23;
    id v27 = v16;
    id v28 = v2;
    long long v24 = *(void **)(a1 + 48);
    uint64_t v29 = *(void *)(a1 + 40);
    id v30 = v24;
    -[HMDWidgetTimelineRefresher cleanUpRemovedWidgetsFromWidgets:completion:](v23, v2, v26);
  }
  else
  {
    if (v21)
    {
      long long v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v25;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Not handling characteristics changed notification because it is not relevant for current widgets", buf, 0xCu);
    }
  }
}

void __80__HMDWidgetTimelineRefresher_handleAccessoryCharacteristicsChangedNotification___block_invoke_260(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [MEMORY[0x263EFF9C0] set];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __80__HMDWidgetTimelineRefresher_handleAccessoryCharacteristicsChangedNotification___block_invoke_2;
  v23[3] = &unk_264A2D3B8;
  id v6 = *(void **)(a1 + 40);
  v23[4] = *(void *)(a1 + 32);
  uint64_t v7 = objc_msgSend(v6, "na_filter:", v23);
  if ([v7 count])
  {
    id v8 = [*(id *)(a1 + 32) monitoredCharacteristicsMapByWidget];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __80__HMDWidgetTimelineRefresher_handleAccessoryCharacteristicsChangedNotification___block_invoke_3;
    v22[3] = &unk_264A1B578;
    v22[4] = *(void *)(a1 + 32);
    v22[5] = v7;
    v22[6] = v5;
    [v8 enumerateKeysAndObjectsUsingBlock:v22];
  }
  id v9 = [*(id *)(a1 + 32) monitoredActionSetsMapByWidget];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __80__HMDWidgetTimelineRefresher_handleAccessoryCharacteristicsChangedNotification___block_invoke_4;
  v21[3] = &unk_264A1B578;
  uint64_t v10 = *(void *)(a1 + 32);
  void v21[4] = *(void *)(a1 + 48);
  v21[5] = v10;
  v21[6] = v5;
  [v9 enumerateKeysAndObjectsUsingBlock:v21];

  uint64_t v11 = [v5 count];
  id v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = *(id *)(a1 + 32);
  id v14 = HMFGetOSLogHandle();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v15)
    {
      id v16 = HMFGetLogIdentifier();
      uint64_t v17 = [*(id *)(a1 + 64) name];
      *(_DWORD *)buf = 138544130;
      long long v25 = v16;
      __int16 v26 = 2114;
      id v27 = v17;
      __int16 v28 = 2112;
      uint64_t v29 = v7;
      __int16 v30 = 2112;
      long long v31 = v5;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Handling %{public}@ and refreshing timeline. Updated characteristics: %@, for widgets: %@", buf, 0x2Au);
    }
    uint64_t v18 = objc_msgSend(v5, "na_map:", &__block_literal_global_265_58336);
    -[HMDWidgetTimelineRefresher refreshTimelineForWidgetKinds:withReason:shouldCoalesce:](*(void **)(a1 + 32), v18, @"Characteristics changed", 0);
  }
  else
  {
    if (v15)
    {
      id v19 = HMFGetLogIdentifier();
      char v20 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      long long v25 = v19;
      __int16 v26 = 2112;
      id v27 = v20;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@No widgets need to be refreshed from this characteristics changed notification: %@", buf, 0x16u);
    }
  }
}

uint64_t __80__HMDWidgetTimelineRefresher_handleAccessoryCharacteristicsChangedNotification___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 value];
  id v5 = [*(id *)(a1 + 32) cachedValueByCharacteristic];
  id v6 = [v5 objectForKey:v3];

  uint64_t v7 = [*(id *)(a1 + 32) cachedValueByCharacteristic];
  id v8 = v7;
  if (v4) {
    [v7 setObject:v4 forKey:v3];
  }
  else {
    [v7 removeObjectForKey:v3];
  }

  uint64_t v9 = HMFEqualObjects() ^ 1;
  return v9;
}

void __80__HMDWidgetTimelineRefresher_handleAccessoryCharacteristicsChangedNotification___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = -[HMDWidgetTimelineRefresher characteristicsForMonitoredCharacteristics:](*(void **)(a1 + 32), a3);
  id v6 = objc_msgSend(v5, "na_setByIntersectingWithSet:", *(void *)(a1 + 40));
  uint64_t v7 = [v6 count];

  if (v7) {
    [*(id *)(a1 + 48) addObject:v8];
  }
}

void __80__HMDWidgetTimelineRefresher_handleAccessoryCharacteristicsChangedNotification___block_invoke_4(id *a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  if ([a1[4] containsObject:v7])
  {
    char v20 = a4;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          BOOL v15 = [a1[5] cachedIsOnStateByActionSet];
          id v16 = [v15 objectForKey:v14];

          uint64_t v17 = [a1[5] actionSetIsOn:v14];
          if (!v16 || v17 != [v16 BOOLValue])
          {
            uint64_t v18 = [a1[5] cachedIsOnStateByActionSet];
            id v19 = [NSNumber numberWithBool:v17];
            [v18 setObject:v19 forKey:v14];

            [a1[6] addObject:v7];
            unsigned char *v20 = 1;

            goto LABEL_13;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
}

uint64_t __80__HMDWidgetTimelineRefresher_handleAccessoryCharacteristicsChangedNotification___block_invoke_262(uint64_t a1, void *a2)
{
  return [a2 kind];
}

- (id)characteristicsForMonitoredCharacteristics:(void *)a1
{
  if (a1)
  {
    a1 = objc_msgSend(a2, "na_map:", &__block_literal_global_301);
    uint64_t v2 = vars8;
  }
  return a1;
}

void __91__HMDWidgetTimelineRefresher_relevantWidgetsForCharacteristics_outRelevantCharacteristics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = -[HMDWidgetTimelineRefresher characteristicsForMonitoredCharacteristics:](*(void **)(a1 + 32), a3);
  id v6 = objc_msgSend(v5, "na_setByIntersectingWithSet:", *(void *)(a1 + 40));

  if ([v6 count])
  {
    [*(id *)(a1 + 48) addObject:v7];
    [*(id *)(a1 + 56) unionSet:v6];
  }
}

void __91__HMDWidgetTimelineRefresher_relevantWidgetsForCharacteristics_outRelevantCharacteristics___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  [*(id *)(a1 + 32) actionSetsByHome:a3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v6, "objectForKey:", v11, (void)v15);
        if (([*(id *)(a1 + 32) evaluateActionSetStateOnPrimaryEnabledForHome:v11] & 1) == 0)
        {
          id v13 = -[HMDWidgetTimelineRefresher characteristicsFromActionSets:](*(void **)(a1 + 32), v12);
          uint64_t v14 = objc_msgSend(v13, "na_setByIntersectingWithSet:", *(void *)(a1 + 40));
          if (![v14 count])
          {

            goto LABEL_13;
          }
          [*(id *)(a1 + 48) addObject:v5];
          [*(id *)(a1 + 56) unionSet:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (id)modifiedCharacteristicsFromNotification:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  id v5 = objc_msgSend(v4, "hmf_arrayForKey:", @"kModifiedCharacteristicsKey");

  id v6 = [v3 userInfo];

  uint64_t v7 = objc_msgSend(v6, "hmf_arrayForKey:", @"HMDModifiedPreviouslyNilValuedCharacteristicsKey");

  if ([v5 count] || objc_msgSend(v7, "count"))
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v7, "count") + objc_msgSend(v5, "count"));
    if ([v5 count]) {
      [v8 addObjectsFromArray:v5];
    }
    if ([v7 count]) {
      [v8 addObjectsFromArray:v7];
    }
    uint64_t v9 = (void *)[v8 copy];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263EFFA08] set];
  }

  return v9;
}

- (void)_removePendingRequestValueForUUID:(id)a3 messageIdentifier:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = [(HMDWidgetTimelineRefresher *)self pendingRequestValueByUUID];
  uint64_t v8 = [v7 objectForKey:v11];

  uint64_t v9 = [v8 objectForKey:v6];

  if (v9)
  {
    uint64_t v10 = [(HMDWidgetTimelineRefresher *)self pendingRequestValueByUUID];
    [v10 removeObjectForKey:v11];
  }
}

- (void)_setPendingRequestValue:(id)a3 forUUID:(id)a4 messageIdentifier:(id)a5
{
  v15[1] = *MEMORY[0x263EF8340];
  id v14 = a5;
  v15[0] = a3;
  uint64_t v8 = NSDictionary;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v8 dictionaryWithObjects:v15 forKeys:&v14 count:1];

  id v13 = [(HMDWidgetTimelineRefresher *)self pendingRequestValueByUUID];
  [v13 setObject:v12 forKey:v10];
}

- (id)_getPendingWriteValueForUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDWidgetTimelineRefresher *)self pendingRequestValueByUUID];
  id v6 = [v5 objectForKey:v4];

  uint64_t v7 = [v6 objectEnumerator];
  uint64_t v8 = [v7 nextObject];

  return v8;
}

- (id)_firstErrorFromCharacteristicWriteResponsePayload:(id)a3
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v38 = v4;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v56 objects:v74 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v57;
      id v39 = self;
      uint64_t v32 = *(void *)v57;
      do
      {
        uint64_t v7 = 0;
        uint64_t v31 = v5;
        do
        {
          if (*(void *)v57 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v40 = *(void *)(*((void *)&v56 + 1) + 8 * v7);
          uint64_t v8 = objc_msgSend(obj, "hmf_dictionaryForKey:", v31);
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v9 = v8;
          uint64_t v35 = [v9 countByEnumeratingWithState:&v52 objects:v73 count:16];
          if (v35)
          {
            uint64_t v10 = *(void *)v53;
            uint64_t v33 = *(void *)v53;
            uint64_t v34 = v7;
            id v37 = v9;
            do
            {
              uint64_t v11 = 0;
              do
              {
                if (*(void *)v53 != v10)
                {
                  uint64_t v12 = v11;
                  objc_enumerationMutation(v9);
                  uint64_t v11 = v12;
                }
                uint64_t v36 = v11;
                uint64_t v41 = *(void *)(*((void *)&v52 + 1) + 8 * v11);
                id v13 = objc_msgSend(v9, "hmf_dictionaryForKey:");
                long long v48 = 0u;
                long long v49 = 0u;
                long long v50 = 0u;
                long long v51 = 0u;
                id v14 = v13;
                uint64_t v46 = [v14 countByEnumeratingWithState:&v48 objects:v72 count:16];
                if (v46)
                {
                  uint64_t v15 = *(void *)v49;
                  uint64_t v44 = *(void *)v49;
                  id v45 = v14;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v46; ++i)
                    {
                      if (*(void *)v49 != v15) {
                        objc_enumerationMutation(v14);
                      }
                      uint64_t v17 = *(void *)(*((void *)&v48 + 1) + 8 * i);
                      long long v18 = objc_msgSend(v14, "hmf_dictionaryForKey:", v17);
                      uint64_t v19 = objc_msgSend(v18, "hmf_dataForKey:", @"kCharacteristicErrorDataKey");
                      if (v19)
                      {
                        uint64_t v20 = (void *)v19;
                        long long v21 = (void *)MEMORY[0x263F08928];
                        uint64_t v22 = objc_opt_class();
                        id v47 = 0;
                        long long v23 = [v21 unarchivedObjectOfClass:v22 fromData:v20 error:&v47];
                        id v24 = v47;
                        if (v24)
                        {
                          long long v25 = (void *)MEMORY[0x230FBD990]();
                          uint64_t v26 = self;
                          id v27 = HMFGetOSLogHandle();
                          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                          {
                            __int16 v28 = HMFGetLogIdentifier();
                            *(_DWORD *)buf = 138544642;
                            v61 = v28;
                            __int16 v62 = 2112;
                            id v63 = v24;
                            __int16 v64 = 2112;
                            uint64_t v65 = v40;
                            __int16 v66 = 2112;
                            uint64_t v67 = v41;
                            __int16 v68 = 2112;
                            uint64_t v69 = v17;
                            __int16 v70 = 2112;
                            id v71 = obj;
                            _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Error deserializing NSError: %@, for accessoryUUID: %@, serviceID: %@, characteristicID: %@, in payload: %@", buf, 0x3Eu);

                            self = v39;
                          }

                          uint64_t v15 = v44;
                          id v14 = v45;
                        }
                        else
                        {
                          id v42 = v23;
                        }

                        if (!v24)
                        {

                          uint64_t v29 = v42;
                          goto LABEL_35;
                        }
                      }
                      else
                      {
                      }
                    }
                    uint64_t v46 = [v14 countByEnumeratingWithState:&v48 objects:v72 count:16];
                    if (v46) {
                      continue;
                    }
                    break;
                  }
                }

                uint64_t v11 = v36 + 1;
                uint64_t v10 = v33;
                uint64_t v7 = v34;
                id v9 = v37;
              }
              while (v36 + 1 != v35);
              uint64_t v35 = [v37 countByEnumeratingWithState:&v52 objects:v73 count:16];
            }
            while (v35);
          }

          ++v7;
          uint64_t v6 = v32;
        }
        while (v7 != v31);
        uint64_t v5 = [obj countByEnumeratingWithState:&v56 objects:v74 count:16];
        uint64_t v6 = v32;
        uint64_t v29 = 0;
      }
      while (v5);
    }
    else
    {
      uint64_t v29 = 0;
    }
LABEL_35:

    id v4 = v38;
  }
  else
  {
    uint64_t v29 = 0;
  }

  return v29;
}

- (void)_clearExpiredActionSetPrimaryStateUpdates
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [(HMDWidgetTimelineRefresher *)self workQueue];
  dispatch_assert_queue_V2(v3);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(HMDWidgetTimelineRefresher *)self actionSetsPendingPrimaryResidentStateUpdates];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        uint64_t v10 = [MEMORY[0x263F08C38] zeroUUID];
        [(HMDWidgetTimelineRefresher *)self _removePendingRequestValueForUUID:v9 messageIdentifier:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  uint64_t v11 = [(HMDWidgetTimelineRefresher *)self actionSetsPendingPrimaryResidentStateUpdates];
  [(HMDWidgetTimelineRefresher *)self _refreshWidgetsIfActionSetsHaveChanged:v11];

  uint64_t v12 = [(HMDWidgetTimelineRefresher *)self actionSetsPendingPrimaryResidentStateUpdates];
  [v12 removeAllObjects];
}

- (void)_startActionSetPrimaryStateUpdateCoalesceTimerContextForActionSetUUID:(id)a3 expectedState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(HMDWidgetTimelineRefresher *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [MEMORY[0x263F08C38] zeroUUID];
  [(HMDWidgetTimelineRefresher *)self _setPendingRequestValue:v6 forUUID:v7 messageIdentifier:v9];

  uint64_t v10 = [(HMDWidgetTimelineRefresher *)self actionSetsPendingPrimaryResidentStateUpdates];
  [v10 addObject:v7];

  id v12 = [(HMDWidgetTimelineRefresher *)self timerManager];
  uint64_t v11 = [v12 startTimerWithTimeInterval:@"304578fe-8218-4be9-8afb-14ec282ab45b" andReplaceObject:30.0];
  [(HMDWidgetTimelineRefresher *)self setActionSetPrimaryStateUpdateCoalesceTimerContext:v11];
}

- (void)writeCharacteristicsWithWriteValueBySPIClientIdentifier:(id)a3 widgetKind:(id)a4 message:(id)a5 completionGroup:(id)a6 completion:(id)a7
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  id v62 = a3;
  id v60 = a4;
  id v12 = a5;
  group = a6;
  id v58 = a7;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v13 = [(HMDWidgetTimelineRefresher *)self homeManager];
  long long v14 = [v13 homes];

  id obj = v14;
  uint64_t v63 = [v14 countByEnumeratingWithState:&v85 objects:v103 count:16];
  if (v63)
  {
    uint64_t v61 = *(void *)v86;
    *(void *)&long long v15 = 138544130;
    long long v56 = v15;
    uint64_t v67 = v12;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v86 != v61) {
          objc_enumerationMutation(obj);
        }
        uint64_t v64 = v16;
        uint64_t v17 = *(void **)(*((void *)&v85 + 1) + 8 * v16);
        id v18 = v62;
        id v19 = v17;
        uint64_t v65 = v19;
        if (self)
        {
          uint64_t v20 = [MEMORY[0x263EFF980] array];
          long long v97 = 0u;
          long long v98 = 0u;
          long long v99 = 0u;
          long long v100 = 0u;
          id v66 = [v19 hapAccessories];
          uint64_t v69 = [v66 countByEnumeratingWithState:&v97 objects:buf count:16];
          if (v69)
          {
            uint64_t v68 = *(void *)v98;
            do
            {
              uint64_t v21 = 0;
              do
              {
                if (*(void *)v98 != v68) {
                  objc_enumerationMutation(v66);
                }
                uint64_t v70 = v21;
                uint64_t v22 = *(void **)(*((void *)&v97 + 1) + 8 * v21);
                long long v93 = 0u;
                long long v94 = 0u;
                long long v95 = 0u;
                long long v96 = 0u;
                objc_msgSend(v22, "services", v56);
                id v71 = (id)objc_claimAutoreleasedReturnValue();
                uint64_t v73 = [v71 countByEnumeratingWithState:&v93 objects:v105 count:16];
                if (v73)
                {
                  uint64_t v72 = *(void *)v94;
                  do
                  {
                    long long v23 = 0;
                    do
                    {
                      if (*(void *)v94 != v72) {
                        objc_enumerationMutation(v71);
                      }
                      uint64_t v74 = v23;
                      id v24 = *(void **)(*((void *)&v93 + 1) + 8 * (void)v23);
                      long long v89 = 0u;
                      long long v90 = 0u;
                      long long v91 = 0u;
                      long long v92 = 0u;
                      long long v25 = [v24 characteristics];
                      uint64_t v26 = [v25 countByEnumeratingWithState:&v89 objects:v104 count:16];
                      if (v26)
                      {
                        uint64_t v27 = v26;
                        uint64_t v28 = *(void *)v90;
                        do
                        {
                          for (uint64_t i = 0; i != v27; ++i)
                          {
                            if (*(void *)v90 != v28) {
                              objc_enumerationMutation(v25);
                            }
                            __int16 v30 = *(void **)(*((void *)&v89 + 1) + 8 * i);
                            uint64_t v31 = [v30 spiClientIdentifier];
                            uint64_t v32 = [v18 objectForKeyedSubscript:v31];

                            if (v32)
                            {
                              uint64_t v33 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v30 value:v32 authorizationData:0 type:0];
                              [v20 addObject:v33];
                            }
                          }
                          uint64_t v27 = [v25 countByEnumeratingWithState:&v89 objects:v104 count:16];
                        }
                        while (v27);
                      }

                      long long v23 = v74 + 1;
                    }
                    while (v74 + 1 != (char *)v73);
                    uint64_t v73 = [v71 countByEnumeratingWithState:&v93 objects:v105 count:16];
                  }
                  while (v73);
                }

                uint64_t v21 = v70 + 1;
              }
              while (v70 + 1 != v69);
              uint64_t v69 = [v66 countByEnumeratingWithState:&v97 objects:buf count:16];
            }
            while (v69);
          }

          id v12 = v67;
          id v19 = v65;
        }
        else
        {
          uint64_t v20 = 0;
        }

        if ([v20 count])
        {
          uint64_t v34 = (void *)MEMORY[0x230FBD990]();
          uint64_t v35 = self;
          uint64_t v36 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            id v37 = HMFGetLogIdentifier();
            *(void *)buf = 0;
            *(void *)&buf[8] = 0;
            id v38 = [v12 identifier];

            if (v38)
            {
              id v39 = [v12 identifier];
              [v39 getUUIDBytes:buf];
            }
            else
            {
              *(_OWORD *)buf = *MEMORY[0x263F42690];
            }
            long long v102 = *(_OWORD *)buf;
            *(_DWORD *)buf = v56;
            *(void *)&uint8_t buf[4] = v37;
            *(_WORD *)&buf[12] = 1040;
            *(_DWORD *)&buf[14] = 16;
            __int16 v107 = 2096;
            v108 = &v102;
            __int16 v109 = 2112;
            v110 = v20;
            _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_INFO, "%{public}@[%{uuid_t}.16P] Writing characteristics: %@", buf, 0x26u);
          }
          uint64_t v40 = v35;

          long long v83 = 0u;
          long long v84 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          id v75 = v20;
          uint64_t v41 = [v75 countByEnumeratingWithState:&v81 objects:v101 count:16];
          if (v41)
          {
            uint64_t v42 = v41;
            uint64_t v43 = *(void *)v82;
            do
            {
              for (uint64_t j = 0; j != v42; ++j)
              {
                if (*(void *)v82 != v43) {
                  objc_enumerationMutation(v75);
                }
                id v45 = *(void **)(*((void *)&v81 + 1) + 8 * j);
                uint64_t v46 = objc_msgSend(v45, "value", v56);
                id v47 = [v45 characteristic];
                long long v48 = [v47 spiClientIdentifier];
                long long v49 = [v67 identifier];
                [(HMDWidgetTimelineRefresher *)v40 _setPendingRequestValue:v46 forUUID:v48 messageIdentifier:v49];
              }
              uint64_t v42 = [v75 countByEnumeratingWithState:&v81 objects:v101 count:16];
            }
            while (v42);
          }

          dispatch_group_enter(group);
          aBlock[0] = MEMORY[0x263EF8330];
          aBlock[1] = 3221225472;
          aBlock[2] = __132__HMDWidgetTimelineRefresher_writeCharacteristicsWithWriteValueBySPIClientIdentifier_widgetKind_message_completionGroup_completion___block_invoke;
          aBlock[3] = &unk_264A2DED8;
          aBlock[4] = v40;
          id v50 = v75;
          id v77 = v50;
          id v12 = v67;
          id v51 = v67;
          id v78 = v51;
          id v79 = v60;
          id v80 = v58;
          long long v52 = _Block_copy(aBlock);
          uint64_t v53 = [v51 source];
          long long v54 = [v51 identifier];
          objc_msgSend(v65, "writeCharacteristicValues:source:message:identifier:qualityOfService:withCompletionHandler:", v50, v53, v51, v54, objc_msgSend(v51, "qualityOfService"), v52);
        }
        uint64_t v16 = v64 + 1;
      }
      while (v64 + 1 != v63);
      uint64_t v55 = [obj countByEnumeratingWithState:&v85 objects:v103 count:16];
      uint64_t v63 = v55;
    }
    while (v55);
  }
}

void __132__HMDWidgetTimelineRefresher_writeCharacteristicsWithWriteValueBySPIClientIdentifier_widgetKind_message_completionGroup_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __132__HMDWidgetTimelineRefresher_writeCharacteristicsWithWriteValueBySPIClientIdentifier_widgetKind_message_completionGroup_completion___block_invoke_2;
  v8[3] = &unk_264A2DF78;
  id v5 = a1[5];
  id v6 = a1[4];
  id v9 = v5;
  id v10 = v6;
  id v11 = a1[6];
  id v12 = v3;
  id v13 = a1[7];
  id v14 = a1[8];
  id v7 = v3;
  dispatch_async(v4, v8);
}

uint64_t __132__HMDWidgetTimelineRefresher_writeCharacteristicsWithWriteValueBySPIClientIdentifier_widgetKind_message_completionGroup_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v28 objects:v41 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v29;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(a1 + 40);
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * v6), "characteristic", (void)v28);
        id v9 = [v8 spiClientIdentifier];
        id v10 = [*(id *)(a1 + 48) identifier];
        [v7 _removePendingRequestValueForUUID:v9 messageIdentifier:v10];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v28 objects:v41 count:16];
    }
    while (v4);
  }

  uint64_t v11 = *(void *)(a1 + 56);
  id v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = *(id *)(a1 + 40);
  id v14 = HMFGetOSLogHandle();
  long long v15 = v14;
  if (v11)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      uint64_t v17 = [*(id *)(a1 + 48) identifier];

      if (v17)
      {
        id v18 = [*(id *)(a1 + 48) identifier];
        [v18 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v33 = *(_OWORD *)buf;
      uint64_t v22 = *(void *)(a1 + 32);
      uint64_t v23 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      __int16 v35 = 2096;
      uint64_t v36 = &v33;
      __int16 v37 = 2112;
      uint64_t v38 = v22;
      __int16 v39 = 2112;
      uint64_t v40 = v23;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Failed to write characteristics: %@, with error: %@", buf, 0x30u);
    }
    id v24 = *(void **)(a1 + 40);
    long long v25 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 64)];
    -[HMDWidgetTimelineRefresher refreshTimelineForWidgetKinds:withReason:shouldCoalesce:](v24, v25, @"Characteristic Write Request Failed", 1);
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      uint64_t v20 = [*(id *)(a1 + 48) identifier];

      if (v20)
      {
        uint64_t v21 = [*(id *)(a1 + 48) identifier];
        [v21 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v32 = *(_OWORD *)buf;
      uint64_t v26 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      __int16 v35 = 2096;
      uint64_t v36 = &v32;
      __int16 v37 = 2112;
      uint64_t v38 = v26;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@[%{uuid_t}.16P] Successfully wrote characteristics: %@", buf, 0x26u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))();
}

- (BOOL)_getRequestsFromMessage:(id)a3 outCharacteristicWriteValueByUUUIDs:(id *)a4 outExecuteActionSetUUUIDs:(id *)a5 outExecuteTurnOffActionSetUUIDs:(id *)a6
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v10 = a3;
  if (!a4)
  {
    _HMFPreconditionFailure();
    goto LABEL_60;
  }
  if (!a5)
  {
LABEL_60:
    _HMFPreconditionFailure();
LABEL_61:
    _HMFPreconditionFailure();
  }
  if (!a6) {
    goto LABEL_61;
  }
  uint64_t v11 = v10;
  uint64_t v65 = a4;
  id v66 = a5;
  uint64_t v67 = a6;
  uint64_t v69 = self;
  id v12 = [MEMORY[0x263EFF9A0] dictionary];
  id v13 = [MEMORY[0x263EFF980] array];
  id v72 = [MEMORY[0x263EFF980] array];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id obj = [v11 arrayForKey:*MEMORY[0x263F0DE10]];
  uint64_t v14 = [obj countByEnumeratingWithState:&v75 objects:v91 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v76;
    uint64_t v17 = *MEMORY[0x263F0DE08];
    uint64_t v18 = *MEMORY[0x263F0DDB0];
    uint64_t v19 = *MEMORY[0x263F0DDD0];
    uint64_t v20 = *MEMORY[0x263F0DDD8];
    uint64_t v68 = v11;
    uint64_t v70 = v12;
    id v71 = v13;
LABEL_6:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v76 != v16) {
        objc_enumerationMutation(obj);
      }
      uint64_t v22 = *(void **)(*((void *)&v75 + 1) + 8 * v21);
      id v74 = 0;
      uint64_t v23 = objc_msgSend(v22, "hmf_integerForKey:error:", v17, &v74);
      id v24 = v74;
      if (v24)
      {
        uint64_t v34 = v24;
        __int16 v35 = (void *)MEMORY[0x230FBD990]();
        uint64_t v36 = v69;
        __int16 v37 = HMFGetOSLogHandle();
        uint64_t v11 = v68;
        id v12 = v70;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          uint64_t v38 = HMFGetLogIdentifier();
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          __int16 v39 = [v68 identifier];

          if (v39)
          {
            uint64_t v40 = [v68 identifier];
            [v40 getUUIDBytes:buf];
          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x263F42690];
          }
          long long v90 = *(_OWORD *)buf;
          long long v57 = [v68 messagePayload];
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v38;
          *(_WORD *)&buf[12] = 1040;
          *(_DWORD *)&buf[14] = 16;
          __int16 v81 = 2096;
          long long v82 = &v90;
          __int16 v83 = 2112;
          uint64_t v84 = (uint64_t)v57;
          _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] request type is not set in payload: %@", buf, 0x26u);
        }
        long long v25 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
        [v68 respondWithError:v25];
LABEL_49:
        long long v32 = v72;
        goto LABEL_57;
      }
      if (v23 == 2) {
        break;
      }
      if (v23 == 1)
      {
        uint64_t v31 = objc_msgSend(v22, "hmf_UUIDForKey:", v18);
        if (!v31)
        {
          uint64_t v41 = (void *)MEMORY[0x230FBD990]();
          uint64_t v42 = v69;
          uint64_t v43 = HMFGetOSLogHandle();
          uint64_t v11 = v68;
          id v12 = v70;
          long long v32 = v72;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            uint64_t v44 = HMFGetLogIdentifier();
            *(void *)buf = 0;
            *(void *)&buf[8] = 0;
            uint64_t v55 = [v68 identifier];

            if (v55)
            {
              long long v56 = [v68 identifier];
              [v56 getUUIDBytes:buf];
            }
            else
            {
              *(_OWORD *)buf = *MEMORY[0x263F42690];
            }
            long long v88 = *(_OWORD *)buf;
            id v58 = [v68 messagePayload];
            *(_DWORD *)buf = 138544130;
            *(void *)&uint8_t buf[4] = v44;
            *(_WORD *)&buf[12] = 1040;
            *(_DWORD *)&buf[14] = 16;
            __int16 v81 = 2096;
            long long v82 = &v88;
            __int16 v83 = 2112;
            uint64_t v84 = (uint64_t)v58;
            long long v59 = "%{public}@[%{uuid_t}.16P] execute request missing UUID: %@";
            goto LABEL_54;
          }
LABEL_56:

          long long v25 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
          [v11 respondWithError:v25];
          uint64_t v34 = 0;
LABEL_57:

          BOOL v33 = 0;
          id v13 = v71;
          goto LABEL_58;
        }
        long long v25 = (void *)v31;
        long long v30 = v71;
LABEL_22:
        [v30 addObject:v25];
        goto LABEL_23;
      }
      if (v23)
      {
        uint64_t v41 = (void *)MEMORY[0x230FBD990]();
        uint64_t v42 = v69;
        uint64_t v43 = HMFGetOSLogHandle();
        uint64_t v11 = v68;
        id v12 = v70;
        long long v32 = v72;
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          goto LABEL_56;
        }
        uint64_t v44 = HMFGetLogIdentifier();
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        id v45 = [v68 identifier];

        if (v45)
        {
          uint64_t v46 = [v68 identifier];
          [v46 getUUIDBytes:buf];
        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x263F42690];
        }
        long long v79 = *(_OWORD *)buf;
        id v58 = [v68 messagePayload];
        *(_DWORD *)buf = 138544386;
        *(void *)&uint8_t buf[4] = v44;
        *(_WORD *)&buf[12] = 1040;
        *(_DWORD *)&buf[14] = 16;
        __int16 v81 = 2096;
        long long v82 = &v79;
        __int16 v83 = 2048;
        uint64_t v84 = v23;
        __int16 v85 = 2112;
        long long v86 = v58;
        long long v59 = "%{public}@[%{uuid_t}.16P] unknown request type (%ld) in payload: %@";
        id v60 = v43;
        uint32_t v61 = 48;
LABEL_55:
        _os_log_impl(&dword_22F52A000, v60, OS_LOG_TYPE_ERROR, v59, buf, v61);

        goto LABEL_56;
      }
      long long v25 = objc_msgSend(v22, "hmf_UUIDForKey:", v19);
      uint64_t v26 = [v22 objectForKeyedSubscript:v20];
      uint64_t v27 = (void *)v26;
      if (v25) {
        BOOL v28 = v26 == 0;
      }
      else {
        BOOL v28 = 1;
      }
      if (v28)
      {
        id v47 = (void *)MEMORY[0x230FBD990]();
        long long v48 = v69;
        long long v49 = HMFGetOSLogHandle();
        uint64_t v11 = v68;
        id v12 = v70;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          id v50 = HMFGetLogIdentifier();
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          id v51 = [v68 identifier];

          if (v51)
          {
            long long v52 = [v68 identifier];
            [v52 getUUIDBytes:buf];
          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x263F42690];
          }
          long long v89 = *(_OWORD *)buf;
          id v62 = [v68 messagePayload];
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v50;
          *(_WORD *)&buf[12] = 1040;
          *(_DWORD *)&buf[14] = 16;
          __int16 v81 = 2096;
          long long v82 = &v89;
          __int16 v83 = 2112;
          uint64_t v84 = (uint64_t)v62;
          _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] characteristic write request missing UUID or write value: %@", buf, 0x26u);
        }
        uint64_t v63 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
        [v68 respondWithError:v63];

        uint64_t v34 = 0;
        goto LABEL_49;
      }
      [v70 setObject:v26 forKeyedSubscript:v25];

LABEL_23:
      if (v15 == ++v21)
      {
        uint64_t v15 = [obj countByEnumeratingWithState:&v75 objects:v91 count:16];
        uint64_t v11 = v68;
        id v12 = v70;
        id v13 = v71;
        if (v15) {
          goto LABEL_6;
        }
        goto LABEL_25;
      }
    }
    uint64_t v29 = objc_msgSend(v22, "hmf_UUIDForKey:", v18);
    if (!v29)
    {
      uint64_t v41 = (void *)MEMORY[0x230FBD990]();
      uint64_t v42 = v69;
      uint64_t v43 = HMFGetOSLogHandle();
      uint64_t v11 = v68;
      id v12 = v70;
      long long v32 = v72;
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        goto LABEL_56;
      }
      uint64_t v44 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      uint64_t v53 = [v68 identifier];

      if (v53)
      {
        long long v54 = [v68 identifier];
        [v54 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v87 = *(_OWORD *)buf;
      id v58 = [v68 messagePayload];
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v44;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      __int16 v81 = 2096;
      long long v82 = &v87;
      __int16 v83 = 2112;
      uint64_t v84 = (uint64_t)v58;
      long long v59 = "%{public}@[%{uuid_t}.16P] execute off request missing UUID: %@";
LABEL_54:
      id v60 = v43;
      uint32_t v61 = 38;
      goto LABEL_55;
    }
    long long v25 = (void *)v29;
    long long v30 = v72;
    goto LABEL_22;
  }
LABEL_25:

  *uint64_t v65 = v12;
  *id v66 = v13;
  long long v32 = v72;
  id *v67 = v72;
  BOOL v33 = 1;
LABEL_58:

  return v33;
}

- (id)reachabilityByAccessorySPIClientIdentifierForCharacteristics:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v24 = a3;
  uint64_t v4 = objc_msgSend(v24, "na_map:", &__block_literal_global_231);
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    uint64_t v25 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      uint64_t v26 = v7;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v28 + 1) + 8 * v9);
        uint64_t v11 = (void *)MEMORY[0x230FBD990]();
        id v12 = self;
        id v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v14 = v5;
          uint64_t v15 = self;
          uint64_t v16 = HMFGetLogIdentifier();
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          uint64_t v17 = [v10 spiClientIdentifier];

          if (v17)
          {
            uint64_t v18 = [v10 spiClientIdentifier];
            [v18 getUUIDBytes:buf];
          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x263F42690];
          }
          long long v32 = *(_OWORD *)buf;
          uint64_t v19 = [v10 name];
          [v10 isRemotelyReachable];
          uint64_t v20 = HMFBooleanToString();
          *(_DWORD *)buf = 138544386;
          *(void *)&uint8_t buf[4] = v16;
          *(_WORD *)&buf[12] = 1040;
          *(_DWORD *)&buf[14] = 16;
          __int16 v34 = 2096;
          __int16 v35 = &v32;
          __int16 v36 = 2112;
          __int16 v37 = v19;
          __int16 v38 = 2112;
          __int16 v39 = v20;
          _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Accessory spiClientIdentifier %{uuid_t}.16P, Name: %@, isRemotelyReachable: %@", buf, 0x30u);

          self = v15;
          uint64_t v5 = v14;
          uint64_t v8 = v25;
          uint64_t v7 = v26;
        }

        uint64_t v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "isRemotelyReachable"));
        uint64_t v22 = [v10 spiClientIdentifier];
        [v5 setObject:v21 forKeyedSubscript:v22];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v7);
  }

  return v5;
}

uint64_t __91__HMDWidgetTimelineRefresher_reachabilityByAccessorySPIClientIdentifierForCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  return [a2 accessory];
}

- (id)valueByCharacteristicSPIClientIdentifierForCharacteristics:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v4;
  uint64_t v34 = [obj countByEnumeratingWithState:&v35 objects:v53 count:16];
  if (v34)
  {
    uint64_t v7 = *(void *)v36;
    *(void *)&long long v6 = 138545154;
    long long v25 = v6;
    uint64_t v27 = self;
    long long v28 = v5;
    uint64_t v26 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "spiClientIdentifier", v25);
        uint64_t v11 = [(HMDWidgetTimelineRefresher *)self _getPendingWriteValueForUUID:v10];

        id v12 = (void *)MEMORY[0x230FBD990]();
        id v13 = self;
        uint64_t v14 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v15 = HMFGetLogIdentifier();
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          uint64_t v16 = [v9 spiClientIdentifier];

          long long v32 = (void *)v15;
          BOOL v33 = v12;
          if (v16)
          {
            uint64_t v17 = [v9 spiClientIdentifier];
            [v17 getUUIDBytes:buf];
          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x263F42690];
          }
          long long v39 = *(_OWORD *)buf;
          uint64_t v18 = [v9 instanceID];
          long long v31 = [v9 type];
          uint64_t v19 = HAPShortUUIDType();
          uint64_t v20 = [v9 characteristicTypeDescription];
          uint64_t v21 = [v9 value];
          *(_DWORD *)buf = v25;
          *(void *)&uint8_t buf[4] = v32;
          *(_WORD *)&buf[12] = 1040;
          *(_DWORD *)&buf[14] = 16;
          __int16 v41 = 2096;
          uint64_t v42 = &v39;
          __int16 v43 = 2112;
          uint64_t v44 = v18;
          __int16 v45 = 2112;
          uint64_t v46 = v19;
          __int16 v47 = 2112;
          long long v48 = v20;
          __int16 v49 = 2112;
          id v50 = v21;
          __int16 v51 = 2112;
          long long v52 = v11;
          _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Characteristic spiClientIdentifier: %{uuid_t}.16P, IID: %@, Type/Desc: %@/%@, value: %@, pendingWriteValue: %@", buf, 0x4Eu);

          self = v27;
          uint64_t v5 = v28;
          uint64_t v7 = v26;
          id v12 = v33;
        }

        uint64_t v22 = (uint64_t)v11;
        if (!v11)
        {
          uint64_t v22 = [v9 value];
          long long v30 = (void *)v22;
        }
        uint64_t v23 = [v9 spiClientIdentifier];
        [v5 setObject:v22 forKeyedSubscript:v23];

        if (!v11) {
      }
        }
      uint64_t v34 = [obj countByEnumeratingWithState:&v35 objects:v53 count:16];
    }
    while (v34);
  }

  return v5;
}

- (void)monitorDeviceNodeID:(id)a3 controller:(id)a4 attributes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 count];
  id v12 = [(HMDWidgetTimelineRefresher *)self devicesByController];
  id v13 = [v12 objectForKey:v9];

  if (!v13)
  {
    id v13 = [MEMORY[0x263EFF980] array];
    if (v11)
    {
      uint64_t v14 = [(HMDWidgetTimelineRefresher *)self devicesByController];
      [v14 setObject:v13 forKey:v9];
    }
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __72__HMDWidgetTimelineRefresher_monitorDeviceNodeID_controller_attributes___block_invoke;
  v20[3] = &unk_264A1B528;
  id v15 = v8;
  id v21 = v15;
  uint64_t v16 = objc_msgSend(v13, "na_firstObjectPassingTest:", v20);
  if (!v16)
  {
    uint64_t v17 = [MEMORY[0x263F10DA8] deviceWithNodeID:v15 controller:v9];
    if (!v11) {
      goto LABEL_10;
    }
    [v13 addObject:v17];
LABEL_9:
    uint64_t v18 = [(HMDWidgetTimelineRefresher *)self workQueue];
    uint64_t v19 = [v10 allObjects];
    [v17 addDelegate:self queue:v18 interestedPathsForAttributes:v19 interestedPathsForEvents:MEMORY[0x263EFFA68]];

LABEL_12:
    goto LABEL_13;
  }
  uint64_t v17 = (void *)v16;
  if (v11) {
    goto LABEL_9;
  }
LABEL_10:
  [v17 removeDelegate:self];
  [v13 removeObject:v17];
  if (objc_msgSend(v13, "hmf_isEmpty"))
  {
    uint64_t v18 = [(HMDWidgetTimelineRefresher *)self devicesByController];
    [v18 removeObjectForKey:v9];
    goto LABEL_12;
  }
LABEL_13:
}

uint64_t __72__HMDWidgetTimelineRefresher_monitorDeviceNodeID_controller_attributes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 nodeID];
  uint64_t v4 = [v3 isEqualToNumber:*(void *)(a1 + 32)];

  return v4;
}

- (void)updateMonitoredMTRAttributes:(id)a3 forWidget:(id)a4
{
  uint64_t v141 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDWidgetTimelineRefresher *)self monitoredMTRAttributesByWidget];
  __int16 v85 = v7;
  id v9 = [v8 objectForKeyedSubscript:v7];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x263EFFA08] set];
  }
  id v12 = v11;

  __int16 v83 = v12;
  uint64_t v84 = v6;
  int v13 = [v6 isEqualToSet:v12];
  uint64_t v14 = (void *)MEMORY[0x230FBD990]();
  id v15 = self;
  uint64_t v16 = HMFGetOSLogHandle();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (!v13)
  {
    if (v17)
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v136 = v20;
      __int16 v137 = 2112;
      v138 = v85;
      __int16 v139 = 2112;
      v140 = v84;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Monitored attributes changed for widget %@ to %@", buf, 0x20u);
    }
    id v21 = -[HMDWidgetTimelineRefresher attributesMonitoredForWidgets](v15);
    uint64_t v22 = [(HMDWidgetTimelineRefresher *)v15 monitoredMTRAttributesByWidget];
    [v22 setObject:v84 forKeyedSubscript:v85];

    uint64_t v23 = -[HMDWidgetTimelineRefresher attributesMonitoredForWidgets](v15);
    id v24 = v21;
    id v25 = v23;
    uint64_t v19 = v12;
    if (v15)
    {
      uint64_t v26 = objc_msgSend(v24, "na_setByRemovingObjectsFromSet:", v25);
      long long v91 = objc_msgSend(v25, "na_setByRemovingObjectsFromSet:", v24);
      long long v97 = v26;
      if ([v26 count] || objc_msgSend(v91, "count"))
      {
        long long v90 = objc_msgSend(v25, "na_setByIntersectingWithSet:", v24);
        uint64_t v27 = objc_msgSend(v24, "na_map:", &__block_literal_global_214_58377);
        id v82 = v25;
        objc_msgSend(v25, "na_map:", &__block_literal_global_216_58378);
        long long v93 = v81 = v27;
        objc_msgSend(v27, "na_setByRemovingObjectsFromSet:");
        long long v121 = 0u;
        long long v122 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v100 = [obj countByEnumeratingWithState:&v121 objects:buf count:16];
        if (v100)
        {
          uint64_t v98 = *(void *)v122;
          do
          {
            for (uint64_t i = 0; i != v100; ++i)
            {
              if (*(void *)v122 != v98) {
                objc_enumerationMutation(obj);
              }
              uint64_t v29 = *(void *)(*((void *)&v121 + 1) + 8 * i);
              long long v30 = [(HMDWidgetTimelineRefresher *)v15 deviceControllersByID];
              long long v31 = [v30 objectForKey:v29];

              if (v31)
              {
                v120[0] = MEMORY[0x263EF8330];
                v120[1] = 3221225472;
                v120[2] = __101__HMDWidgetTimelineRefresher_updateNotificationRegistrationWithPreviousAttributes_currentAttributes___block_invoke_217;
                v120[3] = &unk_264A1B490;
                uint64_t v102 = v29;
                v120[4] = v29;
                long long v32 = objc_msgSend(v97, "na_map:", v120);
                long long v116 = 0u;
                long long v117 = 0u;
                long long v118 = 0u;
                long long v119 = 0u;
                id v33 = v32;
                uint64_t v34 = [v33 countByEnumeratingWithState:&v116 objects:v134 count:16];
                if (v34)
                {
                  uint64_t v35 = v34;
                  uint64_t v36 = *(void *)v117;
                  do
                  {
                    for (uint64_t j = 0; j != v35; ++j)
                    {
                      if (*(void *)v117 != v36) {
                        objc_enumerationMutation(v33);
                      }
                      uint64_t v38 = *(void *)(*((void *)&v116 + 1) + 8 * j);
                      long long v39 = [MEMORY[0x263EFFA08] set];
                      [(HMDWidgetTimelineRefresher *)v15 monitorDeviceNodeID:v38 controller:v31 attributes:v39];
                    }
                    uint64_t v35 = [v33 countByEnumeratingWithState:&v116 objects:v134 count:16];
                  }
                  while (v35);
                }

                uint64_t v40 = (void *)MEMORY[0x230FBD990]([v31 shutdown]);
                __int16 v41 = v15;
                uint64_t v42 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                {
                  __int16 v43 = HMFGetLogIdentifier();
                  *(_DWORD *)v130 = 138543618;
                  v131 = v43;
                  __int16 v132 = 2112;
                  uint64_t v133 = v102;
                  _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_INFO, "%{public}@Removing controller for id: %@", v130, 0x16u);
                }
                uint64_t v44 = [(HMDWidgetTimelineRefresher *)v41 deviceControllersByID];
                [v44 removeObjectForKey:v102];

                __int16 v45 = [(HMDWidgetTimelineRefresher *)v41 devicesByController];
                [v45 removeObjectForKey:v31];
              }
              else
              {
                uint64_t v46 = (void *)MEMORY[0x230FBD990]();
                __int16 v47 = v15;
                long long v48 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                {
                  __int16 v49 = HMFGetLogIdentifier();
                  *(_DWORD *)v130 = 138543618;
                  v131 = v49;
                  __int16 v132 = 2112;
                  uint64_t v133 = v29;
                  _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_ERROR, "%{public}@Removed unknown controller id %@", v130, 0x16u);
                }
              }
            }
            uint64_t v100 = [obj countByEnumeratingWithState:&v121 objects:buf count:16];
          }
          while (v100);
        }

        long long v114 = 0u;
        long long v115 = 0u;
        long long v112 = 0u;
        long long v113 = 0u;
        id v87 = v93;
        uint64_t v92 = [v87 countByEnumeratingWithState:&v112 objects:v130 count:16];
        if (v92)
        {
          uint64_t v89 = *(void *)v113;
          do
          {
            uint64_t v50 = 0;
            do
            {
              if (*(void *)v113 != v89) {
                objc_enumerationMutation(v87);
              }
              uint64_t v51 = *(void *)(*((void *)&v112 + 1) + 8 * v50);
              long long v52 = (void *)MEMORY[0x230FBD990]();
              v111[0] = MEMORY[0x263EF8330];
              v111[1] = 3221225472;
              v111[2] = __101__HMDWidgetTimelineRefresher_updateNotificationRegistrationWithPreviousAttributes_currentAttributes___block_invoke_219;
              v111[3] = &unk_264A1B4B8;
              v111[4] = v51;
              uint64_t v53 = objc_msgSend(v91, "na_filter:", v111);
              v110[0] = MEMORY[0x263EF8330];
              v110[1] = 3221225472;
              v110[2] = __101__HMDWidgetTimelineRefresher_updateNotificationRegistrationWithPreviousAttributes_currentAttributes___block_invoke_2_221;
              v110[3] = &unk_264A1B4B8;
              v110[4] = v51;
              uint64_t v54 = objc_msgSend(v97, "na_filter:", v110);
              v109[0] = MEMORY[0x263EF8330];
              v109[1] = 3221225472;
              v109[2] = __101__HMDWidgetTimelineRefresher_updateNotificationRegistrationWithPreviousAttributes_currentAttributes___block_invoke_3;
              v109[3] = &unk_264A1B4B8;
              uint64_t v55 = (void *)v54;
              v109[4] = v51;
              long long v103 = objc_msgSend(v90, "na_filter:", v109);
              if ([v53 count] || objc_msgSend(v55, "count"))
              {
                long long v99 = v55;
                long long v56 = [v53 setByAddingObjectsFromSet:v55];
                long long v57 = objc_msgSend(v56, "na_map:", &__block_literal_global_223_58381);

                long long v101 = v57;
                if ([v57 count])
                {
                  long long v94 = v53;
                  long long v95 = v52;
                  uint64_t v96 = v50;
                  id v58 = [v53 setByAddingObjectsFromSet:v103];
                  long long v59 = [(HMDWidgetTimelineRefresher *)v15 deviceControllersByID];
                  id v60 = [v59 objectForKey:v51];

                  if (v60) {
                    goto LABEL_47;
                  }
                  uint32_t v61 = (void *)MEMORY[0x230FBD990]();
                  id v62 = v15;
                  uint64_t v63 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v64 = HMFGetLogIdentifier();
                    *(_DWORD *)v126 = 138543618;
                    uint64_t v127 = (uint64_t)v64;
                    __int16 v128 = 2112;
                    uint64_t v129 = v51;
                    _os_log_impl(&dword_22F52A000, v63, OS_LOG_TYPE_INFO, "%{public}@Creating and caching controller for id: %@", v126, 0x16u);
                  }
                  id v60 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v51];
                  uint64_t v65 = +[HMDHome matterDeviceControllerWithUUID:v60];
                  if (v65)
                  {
                    id v66 = (void *)v65;
                    uint64_t v67 = [(HMDWidgetTimelineRefresher *)v62 deviceControllersByID];
                    [v67 setObject:v66 forKey:v51];

                    id v60 = v66;
LABEL_47:
                    long long v107 = 0u;
                    long long v108 = 0u;
                    long long v105 = 0u;
                    long long v106 = 0u;
                    id v68 = v101;
                    uint64_t v69 = [v68 countByEnumeratingWithState:&v105 objects:v125 count:16];
                    if (v69)
                    {
                      uint64_t v70 = v69;
                      uint64_t v71 = *(void *)v106;
                      do
                      {
                        for (uint64_t k = 0; k != v70; ++k)
                        {
                          if (*(void *)v106 != v71) {
                            objc_enumerationMutation(v68);
                          }
                          uint64_t v73 = *(void *)(*((void *)&v105 + 1) + 8 * k);
                          v104[0] = MEMORY[0x263EF8330];
                          v104[1] = 3221225472;
                          v104[2] = __101__HMDWidgetTimelineRefresher_updateNotificationRegistrationWithPreviousAttributes_currentAttributes___block_invoke_225;
                          v104[3] = &unk_264A1B500;
                          v104[4] = v73;
                          id v74 = objc_msgSend(v58, "na_flatMap:", v104);
                          [(HMDWidgetTimelineRefresher *)v15 monitorDeviceNodeID:v73 controller:v60 attributes:v74];
                        }
                        uint64_t v70 = [v68 countByEnumeratingWithState:&v105 objects:v125 count:16];
                      }
                      while (v70);
                    }
                  }
                  else
                  {
                    long long v75 = (void *)MEMORY[0x230FBD990]();
                    long long v76 = v62;
                    long long v77 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                    {
                      uint64_t v78 = HMFGetLogIdentifier();
                      *(_DWORD *)v126 = 138543618;
                      uint64_t v127 = v78;
                      long long v86 = v75;
                      long long v79 = (void *)v78;
                      __int16 v128 = 2112;
                      uint64_t v129 = v51;
                      _os_log_impl(&dword_22F52A000, v77, OS_LOG_TYPE_ERROR, "%{public}@No controller for ID: %@", v126, 0x16u);

                      long long v75 = v86;
                    }
                  }

                  uint64_t v50 = v96;
                  uint64_t v53 = v94;
                  long long v52 = v95;
                }

                uint64_t v55 = v99;
              }

              ++v50;
            }
            while (v50 != v92);
            uint64_t v80 = [v87 countByEnumeratingWithState:&v112 objects:v130 count:16];
            uint64_t v92 = v80;
          }
          while (v80);
        }

        uint64_t v19 = v83;
        id v25 = v82;
      }
    }
    goto LABEL_66;
  }
  if (v17)
  {
    uint64_t v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v136 = v18;
    __int16 v137 = 2112;
    v138 = v85;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Monitored attributes did not change for widget %@", buf, 0x16u);
  }
  uint64_t v19 = v12;
LABEL_66:
}

- (id)attributesMonitoredForWidgets
{
  if (a1)
  {
    id v2 = [MEMORY[0x263EFF9C0] set];
    uint64_t v3 = [a1 monitoredMTRAttributesByWidget];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __59__HMDWidgetTimelineRefresher_attributesMonitoredForWidgets__block_invoke;
    v5[3] = &unk_264A1B448;
    v5[4] = v2;
    [v3 enumerateKeysAndObjectsUsingBlock:v5];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

id __101__HMDWidgetTimelineRefresher_updateNotificationRegistrationWithPreviousAttributes_currentAttributes___block_invoke_217(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 controllerID];
  LODWORD(a1) = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (a1)
  {
    uint64_t v5 = [v3 nodeID];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __101__HMDWidgetTimelineRefresher_updateNotificationRegistrationWithPreviousAttributes_currentAttributes___block_invoke_219(uint64_t a1, void *a2)
{
  id v3 = [a2 controllerID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __101__HMDWidgetTimelineRefresher_updateNotificationRegistrationWithPreviousAttributes_currentAttributes___block_invoke_2_221(uint64_t a1, void *a2)
{
  id v3 = [a2 controllerID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __101__HMDWidgetTimelineRefresher_updateNotificationRegistrationWithPreviousAttributes_currentAttributes___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 controllerID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

id __101__HMDWidgetTimelineRefresher_updateNotificationRegistrationWithPreviousAttributes_currentAttributes___block_invoke_225(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 nodeID];
  LODWORD(a1) = [v4 isEqualToNumber:*(void *)(a1 + 32)];

  if (a1)
  {
    uint64_t v5 = [v3 attributePaths];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __101__HMDWidgetTimelineRefresher_updateNotificationRegistrationWithPreviousAttributes_currentAttributes___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 nodeID];
}

uint64_t __101__HMDWidgetTimelineRefresher_updateNotificationRegistrationWithPreviousAttributes_currentAttributes___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 controllerID];
}

uint64_t __101__HMDWidgetTimelineRefresher_updateNotificationRegistrationWithPreviousAttributes_currentAttributes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 controllerID];
}

uint64_t __59__HMDWidgetTimelineRefresher_attributesMonitoredForWidgets__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unionSet:");
}

- (void)handleMonitorMTRAttributes:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = [v4 stringForKey:*MEMORY[0x263F0DE18]];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [v4 stringForKey:*MEMORY[0x263F0DE20]];
    if (v8)
    {
      id v9 = [v4 dataForKey:*MEMORY[0x263F0DDF8]];
      if (v9)
      {
        id v42 = 0;
        id v10 = [MEMORY[0x263F08928] unarchivedArrayOfObjectsOfClass:objc_opt_class() fromData:v9 error:&v42];
        id v11 = v42;
        if (v11 || !v10)
        {
          id v33 = (void *)MEMORY[0x230FBD990]();
          uint64_t v34 = self;
          uint64_t v35 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            uint64_t v36 = v41 = v33;
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v36;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v7;
            *(_WORD *)&unsigned char buf[22] = 2112;
            *(void *)&unsigned char buf[24] = v11;
            _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode attributes for widget: %@ with error: %@", buf, 0x20u);

            id v33 = v41;
          }

          id v12 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
          [v4 respondWithError:v12];
          int v14 = 1;
        }
        else
        {
          id v12 = [MEMORY[0x263EFFA08] setWithArray:v10];
          int v13 = [[HMDWidget alloc] initWithIdentifier:v7 kind:v8];
          [(HMDWidgetTimelineRefresher *)self updateMonitoredMTRAttributes:v12 forWidget:v13];

          int v14 = 0;
        }
      }
      else
      {
        uint64_t v27 = (void *)MEMORY[0x230FBD990]();
        long long v28 = self;
        uint64_t v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          long long v30 = HMFGetLogIdentifier();
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          long long v31 = [v4 identifier];

          if (v31)
          {
            long long v32 = [v4 identifier];
            [v32 getUUIDBytes:buf];
          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x263F42690];
          }
          long long v43 = *(_OWORD *)buf;
          uint64_t v40 = [v4 messagePayload];
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v30;
          *(_WORD *)&buf[12] = 1040;
          *(_DWORD *)&buf[14] = 16;
          *(_WORD *)&unsigned char buf[18] = 2096;
          *(void *)&buf[20] = &v43;
          *(_WORD *)&buf[28] = 2112;
          *(void *)&buf[30] = v40;
          _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Could not find attributes data in mtr attribute message payload: %@", buf, 0x26u);
        }
        id v11 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
        [v4 respondWithError:v11];
        int v14 = 1;
      }
    }
    else
    {
      id v21 = (void *)MEMORY[0x230FBD990]();
      uint64_t v22 = self;
      uint64_t v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = HMFGetLogIdentifier();
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        id v25 = [v4 identifier];

        if (v25)
        {
          uint64_t v26 = [v4 identifier];
          [v26 getUUIDBytes:buf];
        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x263F42690];
        }
        long long v44 = *(_OWORD *)buf;
        long long v39 = [v4 messagePayload];
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v24;
        *(_WORD *)&buf[12] = 1040;
        *(_DWORD *)&buf[14] = 16;
        *(_WORD *)&unsigned char buf[18] = 2096;
        *(void *)&buf[20] = &v44;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v39;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Could not find widget kind in mtr attribute message payload: %@", buf, 0x26u);
      }
      id v9 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [v4 respondWithError:v9];
      int v14 = 1;
    }

    if (!v14) {
      [v4 respondWithSuccess];
    }
  }
  else
  {
    id v15 = (void *)MEMORY[0x230FBD990]();
    uint64_t v16 = self;
    BOOL v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      uint64_t v19 = [v4 identifier];

      if (v19)
      {
        uint64_t v20 = [v4 identifier];
        [v20 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v45 = *(_OWORD *)buf;
      long long v37 = [v4 messagePayload];
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&unsigned char buf[18] = 2096;
      *(void *)&buf[20] = &v45;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v37;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Could not find widget identifier in mtr attribute message payload: %@", buf, 0x26u);
    }
    uint64_t v38 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v4 respondWithError:v38];
  }
}

- (void)handleFetchStateForActionSets:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 arrayForKey:*MEMORY[0x263F0DDB8]];
  if (v5)
  {
    -[HMDWidgetTimelineRefresher actionSetsFromSPIClientIdentifiers:](self, v5);
    uint64_t v6 = (long long *)objc_claimAutoreleasedReturnValue();
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      id v11 = [v4 identifier];

      if (v11)
      {
        id v12 = [v4 identifier];
        [v12 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v38 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&unsigned char buf[18] = 2096;
      *(void *)&buf[20] = &v38;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{uuid_t}.16P] Received message to fetch action sets for: %@", buf, 0x26u);
    }
    -[HMDWidgetTimelineRefresher updateCachedIsOnStateForActionSets:](v8, v6);
    v36[0] = *MEMORY[0x263F0DDC8];
    uint64_t v19 = -[HMDWidgetTimelineRefresher cachedIsOnStateBySPIClientIdentifierForActionSets:](v8, v6);
    v37[0] = v19;
    v36[1] = *MEMORY[0x263F0DDC0];
    uint64_t v20 = -[HMDWidgetTimelineRefresher didExecuteFailBySPIClientIdentifierForActionSets:](v8, v6);
    v37[1] = v20;
    id v21 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];

    uint64_t v22 = (void *)MEMORY[0x230FBD990]();
    uint64_t v23 = v8;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      id v25 = HMFGetLogIdentifier();
      uint64_t v26 = [v4 name];
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      uint64_t v27 = [v4 identifier];

      if (v27)
      {
        long long v28 = [v4 identifier];
        [v28 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v30 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v25;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v26;
      *(_WORD *)&unsigned char buf[22] = 1040;
      *(_DWORD *)&unsigned char buf[24] = 16;
      __int16 v32 = 2096;
      id v33 = &v30;
      __int16 v34 = 2112;
      uint64_t v35 = v21;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@[%@] Responding to %{uuid_t}.16P with payload: %@", buf, 0x30u);
    }
    [v4 respondWithPayload:v21];
  }
  else
  {
    int v13 = (void *)MEMORY[0x230FBD990]();
    int v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      BOOL v17 = [v4 identifier];

      if (v17)
      {
        uint64_t v18 = [v4 identifier];
        [v18 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v39 = *(_OWORD *)buf;
      uint64_t v29 = [v4 messagePayload];
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&unsigned char buf[18] = 2096;
      *(void *)&buf[20] = &v39;
      __int16 v32 = 2112;
      id v33 = v29;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Could not find action set UUIDs in message payload: %@", buf, 0x26u);
    }
    uint64_t v6 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v4 respondWithError:v6];
  }
}

- (id)actionSetsFromSPIClientIdentifiers:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [a1 homeManager];
    uint64_t v5 = [v4 homes];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __65__HMDWidgetTimelineRefresher_actionSetsFromSPIClientIdentifiers___block_invoke;
    v8[3] = &unk_264A1B5C0;
    id v9 = v3;
    uint64_t v6 = objc_msgSend(v5, "na_flatMap:", v8);

    a1 = [MEMORY[0x263EFFA08] setWithArray:v6];
  }
  return a1;
}

- (void)updateCachedIsOnStateForActionSets:(void *)a1
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
          id v10 = [a1 cachedIsOnStateByActionSet];
          id v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "actionSetIsOn:", v9));
          [v10 setObject:v11 forKey:v9];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
}

- (id)cachedIsOnStateBySPIClientIdentifierForActionSets:(void *)a1
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v23 = v3;
  if (a1)
  {
    id v4 = v3;
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v4;
    uint64_t v27 = [obj countByEnumeratingWithState:&v28 objects:v45 count:16];
    if (v27)
    {
      uint64_t v26 = *(void *)v29;
      id v24 = v5;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v29 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v8 = [v7 uuid];
          uint64_t v9 = [a1 _getPendingWriteValueForUUID:v8];

          id v10 = [a1 cachedIsOnStateByActionSet];
          id v11 = [v10 objectForKey:v7];

          long long v12 = (void *)MEMORY[0x230FBD990]();
          id v13 = a1;
          long long v14 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            id v15 = (id)objc_claimAutoreleasedReturnValue();
            *(void *)buf = 0;
            *(void *)&buf[8] = 0;
            uint64_t v16 = [v7 spiClientIdentifier];

            if (v16)
            {
              uint64_t v17 = [v7 spiClientIdentifier];
              [v17 getUUIDBytes:buf];
            }
            else
            {
              *(_OWORD *)buf = *MEMORY[0x263F42690];
            }
            long long v33 = *(_OWORD *)buf;
            *(void *)buf = 0;
            *(void *)&buf[8] = 0;
            uint64_t v18 = [v7 uuid];

            if (v18)
            {
              uint64_t v19 = [v7 uuid];
              [v19 getUUIDBytes:buf];
            }
            else
            {
              *(_OWORD *)buf = *MEMORY[0x263F42690];
            }
            long long v32 = *(_OWORD *)buf;
            *(_DWORD *)buf = 138544898;
            *(void *)&uint8_t buf[4] = v15;
            *(_WORD *)&buf[12] = 1040;
            *(_DWORD *)&buf[14] = 16;
            __int16 v35 = 2096;
            uint64_t v36 = &v33;
            __int16 v37 = 1040;
            int v38 = 16;
            __int16 v39 = 2096;
            uint64_t v40 = &v32;
            __int16 v41 = 2112;
            id v42 = v9;
            __int16 v43 = 2112;
            long long v44 = v11;
            _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Action Set spiClientIdentifier: %{uuid_t}.16P, UUID: %{uuid_t}.16P, pendingState: %@, cachedState: %@", buf, 0x40u);

            uint64_t v5 = v24;
          }

          if (v9) {
            uint64_t v20 = v9;
          }
          else {
            uint64_t v20 = v11;
          }
          id v21 = [v7 spiClientIdentifier];
          [v5 setObject:v20 forKeyedSubscript:v21];
        }
        uint64_t v27 = [obj countByEnumeratingWithState:&v28 objects:v45 count:16];
      }
      while (v27);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)didExecuteFailBySPIClientIdentifierForActionSets:(void *)a1
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v17 = v3;
  if (a1)
  {
    id v4 = v3;
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          long long v12 = [a1 cachedActionSetExecuteErrorByUUID];
          id v13 = [v11 uuid];
          long long v14 = [v12 objectForKeyedSubscript:v13];

          if (v14)
          {
            id v15 = [v11 spiClientIdentifier];
            [v5 setObject:&unk_26E471158 forKeyedSubscript:v15];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id __65__HMDWidgetTimelineRefresher_actionSetsFromSPIClientIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 actionSets];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__HMDWidgetTimelineRefresher_actionSetsFromSPIClientIdentifiers___block_invoke_2;
  v6[3] = &unk_264A210B8;
  id v7 = *(id *)(a1 + 32);
  id v4 = objc_msgSend(v3, "na_filter:", v6);

  return v4;
}

uint64_t __65__HMDWidgetTimelineRefresher_actionSetsFromSPIClientIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 spiClientIdentifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (void)handleMonitorActionSetsForWidget:(id)a3
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 stringForKey:*MEMORY[0x263F0DE18]];
  if (v5)
  {
    id v6 = [v4 stringForKey:*MEMORY[0x263F0DE20]];
    if (v6)
    {
      id v7 = [v4 arrayForKey:*MEMORY[0x263F0DDB8]];
      if (v7)
      {
        uint64_t v8 = [[HMDWidget alloc] initWithIdentifier:v5 kind:v6];
        uint64_t v65 = v7;
        uint64_t v9 = -[HMDWidgetTimelineRefresher actionSetsFromSPIClientIdentifiers:](self, v7);
        id v10 = (void *)MEMORY[0x230FBD990]();
        id v11 = self;
        long long v12 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          id v13 = HMFGetLogIdentifier();
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          long long v14 = [v4 identifier];

          if (v14)
          {
            id v15 = [v4 identifier];
            [v15 getUUIDBytes:buf];
          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x263F42690];
          }
          long long v75 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v13;
          *(_WORD *)&buf[12] = 1040;
          *(_DWORD *)&buf[14] = 16;
          *(_WORD *)&unsigned char buf[18] = 2096;
          *(void *)&buf[20] = &v75;
          __int16 v69 = 2112;
          uint64_t v70 = v8;
          _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{uuid_t}.16P] Received message to update action sets for widget: %@", buf, 0x26u);
        }
        uint64_t v35 = [v4 qualityOfService];
        uint64_t v36 = v8;
        id v66 = v9;
        if (v11)
        {
          id v37 = v9;
          int v38 = [(HMDWidgetTimelineRefresher *)v11 monitoredActionSetsMapByWidget];
          __int16 v39 = [v38 objectForKey:v36];
          uint64_t v40 = v39;
          uint64_t v63 = v35;
          if (v39)
          {
            id v41 = v39;
          }
          else
          {
            id v41 = [MEMORY[0x263EFFA08] set];
          }
          id v42 = v41;

          __int16 v43 = -[HMDWidgetTimelineRefresher characteristicsMonitoredForWidgets](v11);
          long long v44 = [(HMDWidgetTimelineRefresher *)v11 monitoredActionSetsMapByWidget];
          [v44 setObject:v37 forKey:v36];

          long long v45 = [(HMDWidgetTimelineRefresher *)v11 monitoredActionSetsMapByWidget];
          uint64_t v46 = [v45 objectForKey:v36];
          uint64_t v47 = v46;
          if (v46)
          {
            id v48 = v46;
          }
          else
          {
            id v48 = [MEMORY[0x263EFFA08] set];
          }
          __int16 v49 = v48;

          -[HMDWidgetTimelineRefresher updateMonitoredActionSetsWithPreviousActionSets:currentActionSets:]((uint64_t)v11, v42, v49);
          uint64_t v50 = -[HMDWidgetTimelineRefresher characteristicsMonitoredForWidgets](v11);
          -[HMDWidgetTimelineRefresher updateNotificationRegistrationWithPreviousCharacteristics:currentCharacteristics:updateRequestQualityOfService:](v11, v43, v50, v63);

          uint64_t v9 = v66;
        }

        -[HMDWidgetTimelineRefresher updateCachedIsOnStateForActionSets:](v11, v9);
        v73[0] = *MEMORY[0x263F0DDC8];
        uint64_t v51 = -[HMDWidgetTimelineRefresher cachedIsOnStateBySPIClientIdentifierForActionSets:](v11, v9);
        v74[0] = v51;
        v73[1] = *MEMORY[0x263F0DDC0];
        long long v52 = -[HMDWidgetTimelineRefresher didExecuteFailBySPIClientIdentifierForActionSets:](v11, v9);
        v74[1] = v52;
        uint64_t v53 = [NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:2];

        uint64_t v54 = (void *)MEMORY[0x230FBD990]();
        uint64_t v55 = v11;
        long long v56 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          uint64_t v64 = v5;
          long long v57 = HMFGetLogIdentifier();
          id v58 = [v4 name];
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          long long v59 = [v4 identifier];

          if (v59)
          {
            id v60 = [v4 identifier];
            [v60 getUUIDBytes:buf];
          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x263F42690];
          }
          long long v67 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138544386;
          *(void *)&uint8_t buf[4] = v57;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v58;
          *(_WORD *)&unsigned char buf[22] = 1040;
          *(_DWORD *)&unsigned char buf[24] = 16;
          __int16 v69 = 2096;
          uint64_t v70 = (HMDWidget *)&v67;
          __int16 v71 = 2112;
          id v72 = v53;
          _os_log_impl(&dword_22F52A000, v56, OS_LOG_TYPE_INFO, "%{public}@[%@] Responding to %{uuid_t}.16P with payload: %@", buf, 0x30u);

          uint64_t v5 = v64;
        }

        [v4 respondWithPayload:v53];

        id v7 = v65;
      }
      else
      {
        long long v28 = (void *)MEMORY[0x230FBD990]();
        long long v29 = self;
        long long v30 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          long long v31 = HMFGetLogIdentifier();
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          long long v32 = [v4 identifier];

          if (v32)
          {
            long long v33 = [v4 identifier];
            [v33 getUUIDBytes:buf];
          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x263F42690];
          }
          long long v76 = *(_OWORD *)buf;
          id v62 = [v4 messagePayload];
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v31;
          *(_WORD *)&buf[12] = 1040;
          *(_DWORD *)&buf[14] = 16;
          *(_WORD *)&unsigned char buf[18] = 2096;
          *(void *)&buf[20] = &v76;
          __int16 v69 = 2112;
          uint64_t v70 = v62;
          _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Could not find action set UUIDs in message payload: %@", buf, 0x26u);
        }
        uint64_t v36 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
        [v4 respondWithError:v36];
      }
    }
    else
    {
      uint64_t v22 = (void *)MEMORY[0x230FBD990]();
      uint64_t v23 = self;
      id v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v25 = HMFGetLogIdentifier();
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        uint64_t v26 = [v4 identifier];

        if (v26)
        {
          uint64_t v27 = [v4 identifier];
          [v27 getUUIDBytes:buf];
        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x263F42690];
        }
        long long v77 = *(_OWORD *)buf;
        uint32_t v61 = [v4 messagePayload];
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v25;
        *(_WORD *)&buf[12] = 1040;
        *(_DWORD *)&buf[14] = 16;
        *(_WORD *)&unsigned char buf[18] = 2096;
        *(void *)&buf[20] = &v77;
        __int16 v69 = 2112;
        uint64_t v70 = v61;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Could not find widget kind in message payload: %@", buf, 0x26u);
      }
      id v7 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [v4 respondWithError:v7];
    }
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x230FBD990]();
    uint64_t v17 = self;
    long long v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      long long v19 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      long long v20 = [v4 identifier];

      if (v20)
      {
        long long v21 = [v4 identifier];
        [v21 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v78 = *(_OWORD *)buf;
      __int16 v34 = [v4 messagePayload];
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&unsigned char buf[18] = 2096;
      *(void *)&buf[20] = &v78;
      __int16 v69 = 2112;
      uint64_t v70 = v34;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Could not find widget identifier in message payload: %@", buf, 0x26u);
    }
    id v6 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v4 respondWithError:v6];
  }
}

- (void)handlePerformRequests:(id)a3
{
  uint64_t v177 = *MEMORY[0x263EF8340];
  uint64_t v139 = 0;
  uint64_t v140 = 0;
  uint64_t v138 = 0;
  id v104 = a3;
  BOOL v4 = -[HMDWidgetTimelineRefresher _getRequestsFromMessage:outCharacteristicWriteValueByUUUIDs:outExecuteActionSetUUUIDs:outExecuteTurnOffActionSetUUIDs:](self, "_getRequestsFromMessage:outCharacteristicWriteValueByUUUIDs:outExecuteActionSetUUUIDs:outExecuteTurnOffActionSetUUIDs:");
  id v102 = 0;
  id v103 = 0;
  id v5 = 0;
  if (!v4) {
    goto LABEL_110;
  }
  id v100 = v5;
  long long v101 = [v104 stringForKey:*MEMORY[0x263F0DE20]];
  id v6 = (void *)MEMORY[0x230FBD990]();
  long long v121 = self;
  id v7 = HMFGetOSLogHandle();
  uint64_t v8 = v7;
  if (!v101)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      long long v12 = HMFGetLogIdentifier();
      *(void *)&buf[8] = 0;
      *(void *)buf = 0;
      id v13 = [v104 identifier];

      if (v13)
      {
        long long v14 = [v104 identifier];
        [v14 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v147 = *(_OWORD *)buf;
      long long v97 = [v104 messagePayload];
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      __int16 v171 = 2096;
      v172 = &v147;
      __int16 v173 = 2112;
      id v174 = v97;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Could not find widget kind in message payload: %@", buf, 0x26u);
    }
    long long v107 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v104 respondWithError:v107];
    goto LABEL_109;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    *(void *)&buf[8] = 0;
    *(void *)buf = 0;
    id v10 = [v104 identifier];

    if (v10)
    {
      id v11 = [v104 identifier];
      [v11 getUUIDBytes:buf];
    }
    else
    {
      *(_OWORD *)buf = *MEMORY[0x263F42690];
    }
    long long v146 = *(_OWORD *)buf;
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 1040;
    *(_DWORD *)&buf[14] = 16;
    __int16 v171 = 2096;
    v172 = &v146;
    __int16 v173 = 2112;
    id v174 = v101;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{uuid_t}.16P] Received message to perform requests for kind: %@", buf, 0x26u);
  }
  dispatch_group_t v15 = dispatch_group_create();
  v136[0] = 0;
  v136[1] = v136;
  v136[2] = 0x3032000000;
  v136[3] = __Block_byref_object_copy__58409;
  v136[4] = __Block_byref_object_dispose__58410;
  id v137 = 0;
  v134[0] = 0;
  v134[1] = v134;
  v134[2] = 0x2020000000;
  char v135 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__HMDWidgetTimelineRefresher_handlePerformRequests___block_invoke;
  aBlock[3] = &unk_264A1B420;
  uint64_t v16 = v15;
  v131 = v16;
  __int16 v132 = v136;
  uint64_t v133 = v134;
  uint64_t v17 = _Block_copy(aBlock);
  long long v18 = v121;
  [(HMDWidgetTimelineRefresher *)v121 writeCharacteristicsWithWriteValueBySPIClientIdentifier:v102 widgetKind:v101 message:v104 completionGroup:v16 completion:v17];
  id v112 = v103;
  id v118 = v101;
  id v19 = v104;
  group = v16;
  id v116 = v17;
  if (v121)
  {
    v110 = -[HMDWidgetTimelineRefresher actionSetsFromSPIClientIdentifiers:](v121, v112);
    if ([v110 count])
    {
      long long v143 = 0u;
      long long v144 = 0u;
      long long v141 = 0u;
      long long v142 = 0u;
      id obj = v110;
      uint64_t v20 = [obj countByEnumeratingWithState:&v141 objects:buf count:16];
      if (v20)
      {
        uint64_t v124 = *(void *)v142;
        uint64_t v21 = *MEMORY[0x263F0B948];
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v142 != v124) {
              objc_enumerationMutation(obj);
            }
            uint64_t v23 = *(void **)(*((void *)&v141 + 1) + 8 * i);
            id v24 = [v23 type];
            int v25 = [v24 isEqualToString:v21];

            uint64_t v26 = (void *)MEMORY[0x230FBD990]();
            uint64_t v27 = v121;
            long long v28 = HMFGetOSLogHandle();
            long long v29 = v28;
            if (v25)
            {
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                long long v30 = HMFGetLogIdentifier();
                *(void *)v175 = 0;
                *(void *)&v175[8] = 0;
                long long v31 = [v19 identifier];

                if (v31)
                {
                  long long v32 = [v19 identifier];
                  [v32 getUUIDBytes:v175];
                }
                else
                {
                  *(_OWORD *)v175 = *MEMORY[0x263F42690];
                }
                long long v162 = *(_OWORD *)v175;
                *(_DWORD *)v175 = 138544130;
                *(void *)&v175[4] = v30;
                *(_WORD *)&v175[12] = 1040;
                *(_DWORD *)&v175[14] = 16;
                *(_WORD *)&v175[18] = 2096;
                *(void *)&v175[20] = &v162;
                *(_WORD *)&v175[28] = 2112;
                *(void *)&v175[30] = v23;
                _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] We can't execute trigger-owned action set: %@", v175, 0x26u);
              }
            }
            else
            {
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                long long v33 = HMFGetLogIdentifier();
                *(void *)v175 = 0;
                *(void *)&v175[8] = 0;
                __int16 v34 = [v19 identifier];

                if (v34)
                {
                  uint64_t v35 = [v19 identifier];
                  [v35 getUUIDBytes:v175];
                }
                else
                {
                  *(_OWORD *)v175 = *MEMORY[0x263F42690];
                }
                long long v148 = *(_OWORD *)v175;
                *(_DWORD *)v175 = 138544130;
                *(void *)&v175[4] = v33;
                *(_WORD *)&v175[12] = 1040;
                *(_DWORD *)&v175[14] = 16;
                *(_WORD *)&v175[18] = 2096;
                *(void *)&v175[20] = &v148;
                *(_WORD *)&v175[28] = 2112;
                *(void *)&v175[30] = v23;
                _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@[%{uuid_t}.16P] Executing action set: %@", v175, 0x26u);
              }
              uint64_t v36 = [v23 uuid];
              id v37 = [v19 identifier];
              [(HMDWidgetTimelineRefresher *)v27 _setPendingRequestValue:&unk_26E471158 forUUID:v36 messageIdentifier:v37];

              -[HMDWidgetTimelineRefresher _clearCachedErrorForActionSet:](v27, v23);
              dispatch_group_enter(group);
              int v38 = (void *)[v19 mutableCopy];
              v158[0] = MEMORY[0x263EF8330];
              v158[1] = 3221225472;
              v158[2] = __118__HMDWidgetTimelineRefresher_executeActionSetsWithSPIClientIdentifiers_widgetKind_message_completionGroup_completion___block_invoke;
              v158[3] = &unk_264A2DED8;
              v158[4] = v27;
              v158[5] = v23;
              id v159 = v19;
              id v160 = v118;
              id v161 = v116;
              [v38 setResponseHandler:v158];
              [v23 execute:v38];
            }
          }
          uint64_t v20 = [obj countByEnumeratingWithState:&v141 objects:buf count:16];
        }
        while (v20);
      }
    }
    long long v18 = v121;
  }

  id v99 = v100;
  id v105 = v118;
  id v113 = v19;
  long long v107 = group;
  id v106 = v116;
  if (!v18) {
    goto LABEL_105;
  }
  uint64_t v98 = -[HMDWidgetTimelineRefresher actionSetsFromSPIClientIdentifiers:](v121, v99);
  if (![v98 count]) {
    goto LABEL_104;
  }
  long long v164 = 0u;
  long long v165 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  id v108 = v98;
  uint64_t v114 = [v108 countByEnumeratingWithState:&v162 objects:v158 count:16];
  if (!v114) {
    goto LABEL_103;
  }
  uint64_t v109 = *MEMORY[0x263F0B948];
  uint64_t v111 = *(void *)v163;
  uint64_t v125 = *MEMORY[0x263F35518];
  id obja = (id)*MEMORY[0x263F35430];
  do
  {
    for (uint64_t j = 0; j != v114; ++j)
    {
      if (*(void *)v163 != v111) {
        objc_enumerationMutation(v108);
      }
      __int16 v39 = *(void **)(*((void *)&v162 + 1) + 8 * j);
      uint64_t v40 = objc_msgSend(v39, "type", v98);
      int v41 = [v40 isEqualToString:v109];

      if (v41)
      {
        id v42 = (void *)MEMORY[0x230FBD990]();
        __int16 v43 = v121;
        long long v44 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          long long v45 = HMFGetLogIdentifier();
          *(void *)&buf[8] = 0;
          *(void *)buf = 0;
          uint64_t v46 = [v113 identifier];

          if (v46)
          {
            uint64_t v47 = [v113 identifier];
            [v47 getUUIDBytes:buf];
          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x263F42690];
          }
          long long v157 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v45;
          *(_WORD *)&buf[12] = 1040;
          *(_DWORD *)&buf[14] = 16;
          __int16 v171 = 2096;
          v172 = &v157;
          __int16 v173 = 2112;
          id v174 = v39;
          _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] We can't execute trigger-owned action set: %@", buf, 0x26u);
        }
LABEL_80:

        continue;
      }
      if (![(HMDWidgetTimelineRefresher *)v121 actionSetIsOn:v39])
      {
        id v42 = (void *)MEMORY[0x230FBD990]();
        __int16 v43 = v121;
        long long v44 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          long long v76 = HMFGetLogIdentifier();
          *(void *)&buf[8] = 0;
          *(void *)buf = 0;
          long long v77 = [v113 identifier];

          if (v77)
          {
            long long v78 = [v113 identifier];
            [v78 getUUIDBytes:buf];
          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x263F42690];
          }
          long long v156 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v76;
          *(_WORD *)&buf[12] = 1040;
          *(_DWORD *)&buf[14] = 16;
          __int16 v171 = 2096;
          v172 = &v156;
          __int16 v173 = 2112;
          id v174 = v39;
          _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_INFO, "%{public}@[%{uuid_t}.16P] Action set cannot be turned off because it's not active: %@", buf, 0x26u);
        }
        goto LABEL_80;
      }
      id v115 = v39;
      dispatch_group_t groupa = [MEMORY[0x263EFF980] array];
      long long v176 = 0u;
      memset(v175, 0, sizeof(v175));
      id v48 = [v115 actions];
      uint64_t v49 = [v48 countByEnumeratingWithState:v175 objects:buf count:16];
      if (!v49) {
        goto LABEL_70;
      }
      uint64_t v50 = **(void **)&v175[16];
      do
      {
        for (uint64_t k = 0; k != v49; ++k)
        {
          if (**(void **)&v175[16] != v50) {
            objc_enumerationMutation(v48);
          }
          id v52 = *(id *)(*(void *)&v175[8] + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v53 = v52;
          }
          else {
            uint64_t v53 = 0;
          }
          id v54 = v53;

          if (v54)
          {
            uint64_t v55 = [v54 characteristic];
            long long v56 = [v55 type];
            if ([v56 isEqual:v125])
            {

LABEL_59:
              long long v59 = [v54 targetValue];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                id v60 = v59;
              }
              else {
                id v60 = 0;
              }
              id v61 = v60;

              char v62 = [v61 BOOLValue];
              if (v62)
              {
                uint64_t v63 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v55 value:&unk_26E471170 authorizationData:0 type:0];
                [groupa addObject:v63];
              }
              else
              {
                uint64_t v64 = (void *)MEMORY[0x230FBD990]();
                uint64_t v65 = v121;
                id v66 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
                {
                  long long v67 = HMFGetLogIdentifier();
                  *(_DWORD *)v166 = 138543618;
                  v167 = v67;
                  __int16 v168 = 2112;
                  id v169 = v54;
                  _os_log_impl(&dword_22F52A000, v66, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring characteristic write action for turning off because target value is NO: %@", v166, 0x16u);
                }
              }
            }
            else
            {
              long long v57 = [v55 type];
              int v58 = [v57 isEqual:obja];

              if (v58) {
                goto LABEL_59;
              }
            }
          }
        }
        uint64_t v49 = [v48 countByEnumeratingWithState:v175 objects:buf count:16];
      }
      while (v49);
LABEL_70:

      if ([groupa count])
      {
        id v68 = [v115 home];
        __int16 v69 = (void *)MEMORY[0x230FBD990]();
        uint64_t v70 = v121;
        __int16 v71 = HMFGetOSLogHandle();
        id v72 = v71;
        if (v68)
        {
          if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
          {
            uint64_t v73 = HMFGetLogIdentifier();
            *(void *)&buf[8] = 0;
            *(void *)buf = 0;
            id v74 = [v113 identifier];

            if (v74)
            {
              long long v75 = [v113 identifier];
              [v75 getUUIDBytes:buf];
            }
            else
            {
              *(_OWORD *)buf = *MEMORY[0x263F42690];
            }
            long long v153 = *(_OWORD *)buf;
            *(_DWORD *)buf = 138544130;
            *(void *)&uint8_t buf[4] = v73;
            *(_WORD *)&buf[12] = 1040;
            *(_DWORD *)&buf[14] = 16;
            __int16 v171 = 2096;
            v172 = &v153;
            __int16 v173 = 2112;
            id v174 = v115;
            _os_log_impl(&dword_22F52A000, v72, OS_LOG_TYPE_INFO, "%{public}@[%{uuid_t}.16P] Executing turning off action set: %@", buf, 0x26u);
          }
          long long v88 = [v115 uuid];
          uint64_t v89 = [v113 identifier];
          [(HMDWidgetTimelineRefresher *)v70 _setPendingRequestValue:&unk_26E471170 forUUID:v88 messageIdentifier:v89];

          -[HMDWidgetTimelineRefresher _clearCachedErrorForActionSet:](v70, v115);
          dispatch_group_enter(v107);
          *(void *)&long long v141 = MEMORY[0x263EF8330];
          *((void *)&v141 + 1) = 3221225472;
          *(void *)&long long v142 = __127__HMDWidgetTimelineRefresher_executeActionSetsToTurnOffWithSPIClientIdentifiers_widgetKind_message_completionGroup_completion___block_invoke;
          *((void *)&v142 + 1) = &unk_264A2B938;
          *(void *)&long long v143 = v70;
          *((void *)&v143 + 1) = v115;
          id v90 = v113;
          *(void *)&long long v144 = v90;
          *((void *)&v144 + 1) = v105;
          id v145 = v106;
          long long v91 = _Block_copy(&v141);
          *(void *)&long long v148 = MEMORY[0x263EF8330];
          *((void *)&v148 + 1) = 3221225472;
          v149 = __127__HMDWidgetTimelineRefresher_executeActionSetsToTurnOffWithSPIClientIdentifiers_widgetKind_message_completionGroup_completion___block_invoke_256;
          v150 = &unk_264A2B228;
          v151 = v70;
          id v152 = v91;
          id v92 = v91;
          long long v93 = _Block_copy(&v148);
          uint64_t v94 = [v90 source];
          long long v95 = [v90 identifier];
          objc_msgSend(v68, "writeCharacteristicValues:source:message:identifier:qualityOfService:withCompletionHandler:", groupa, v94, v90, v95, objc_msgSend(v90, "qualityOfService"), v93);
        }
        else
        {
          if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          {
            __int16 v85 = HMFGetLogIdentifier();
            *(void *)&buf[8] = 0;
            *(void *)buf = 0;
            long long v86 = [v113 identifier];

            if (v86)
            {
              id v87 = [v113 identifier];
              [v87 getUUIDBytes:buf];
            }
            else
            {
              *(_OWORD *)buf = *MEMORY[0x263F42690];
            }
            long long v154 = *(_OWORD *)buf;
            *(_DWORD *)buf = 138544130;
            *(void *)&uint8_t buf[4] = v85;
            *(_WORD *)&buf[12] = 1040;
            *(_DWORD *)&buf[14] = 16;
            __int16 v171 = 2096;
            v172 = &v154;
            __int16 v173 = 2112;
            id v174 = v115;
            _os_log_impl(&dword_22F52A000, v72, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Home is nil for action set: %@", buf, 0x26u);
          }
        }
      }
      else
      {
        uint64_t v79 = (void *)MEMORY[0x230FBD990]();
        uint64_t v80 = v121;
        __int16 v81 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
        {
          id v82 = HMFGetLogIdentifier();
          *(void *)&buf[8] = 0;
          *(void *)buf = 0;
          __int16 v83 = [v113 identifier];

          if (v83)
          {
            uint64_t v84 = [v113 identifier];
            [v84 getUUIDBytes:buf];
          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x263F42690];
          }
          long long v155 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v82;
          *(_WORD *)&buf[12] = 1040;
          *(_DWORD *)&buf[14] = 16;
          __int16 v171 = 2096;
          v172 = &v155;
          __int16 v173 = 2112;
          id v174 = v115;
          _os_log_impl(&dword_22F52A000, v81, OS_LOG_TYPE_INFO, "%{public}@[%{uuid_t}.16P] Action set doesn't contain actions that can be turned off: %@", buf, 0x26u);
        }
      }
    }
    uint64_t v114 = [v108 countByEnumeratingWithState:&v162 objects:v158 count:16];
  }
  while (v114);
LABEL_103:

LABEL_104:
LABEL_105:

  uint64_t v96 = [(HMDWidgetTimelineRefresher *)v121 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__HMDWidgetTimelineRefresher_handlePerformRequests___block_invoke_2;
  block[3] = &unk_264A2ADD0;
  __int16 v128 = v136;
  void block[4] = v121;
  id v127 = v113;
  uint64_t v129 = v134;
  dispatch_group_notify(v107, v96, block);

  _Block_object_dispose(v134, 8);
  _Block_object_dispose(v136, 8);

LABEL_109:
  id v5 = v100;
LABEL_110:
}

void __52__HMDWidgetTimelineRefresher_handlePerformRequests___block_invoke(void *a1, void *a2)
{
  id v3 = a1[4];
  id v9 = a2;
  dispatch_group_leave(v3);
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v7 = *(void **)(v4 + 40);
  id v5 = (id *)(v4 + 40);
  id v6 = v7;
  uint64_t v8 = v9;
  if (v7) {
    uint64_t v8 = v6;
  }
  objc_storeStrong(v5, v8);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
}

uint64_t __52__HMDWidgetTimelineRefresher_handlePerformRequests___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      id v6 = [*(id *)(a1 + 40) identifier];

      if (v6)
      {
        id v7 = [*(id *)(a1 + 40) identifier];
        [v7 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v23 = *(_OWORD *)buf;
      long long v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      __int16 v25 = 2096;
      uint64_t v26 = &v23;
      __int16 v27 = 2112;
      long long v28 = v14;
      dispatch_group_t v15 = "%{public}@[%{uuid_t}.16P] Failed with error: %@";
      uint64_t v16 = v4;
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
      uint32_t v18 = 38;
LABEL_16:
      _os_log_impl(&dword_22F52A000, v16, v17, v15, buf, v18);
LABEL_17:
    }
  }
  else
  {
    int v8 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    id v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    uint64_t v4 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v5 = HMFGetLogIdentifier();
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        id v10 = [*(id *)(a1 + 40) identifier];

        if (v10)
        {
          id v11 = [*(id *)(a1 + 40) identifier];
          [v11 getUUIDBytes:buf];
        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x263F42690];
        }
        long long v21 = *(_OWORD *)buf;
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v5;
        *(_WORD *)&buf[12] = 1040;
        *(_DWORD *)&buf[14] = 16;
        __int16 v25 = 2096;
        uint64_t v26 = &v21;
        dispatch_group_t v15 = "%{public}@[%{uuid_t}.16P] Successfully completed requests";
        uint64_t v16 = v4;
        os_log_type_t v17 = OS_LOG_TYPE_INFO;
        uint32_t v18 = 28;
        goto LABEL_16;
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v5 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      long long v12 = [*(id *)(a1 + 40) identifier];

      if (v12)
      {
        id v13 = [*(id *)(a1 + 40) identifier];
        [v13 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v22 = *(_OWORD *)buf;
      uint64_t v20 = [*(id *)(a1 + 40) messagePayload];
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      __int16 v25 = 2096;
      uint64_t v26 = &v22;
      __int16 v27 = 2112;
      long long v28 = v20;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Did not execute any request from payload: %@", buf, 0x26u);

      goto LABEL_17;
    }
  }

  return [*(id *)(a1 + 40) respondWithPayload:0 error:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

- (void)_clearCachedErrorForActionSet:(void *)a1
{
  id v8 = [a2 uuid];
  id v3 = [a1 cachedActionSetExecuteErrorByUUID];
  [v3 removeObjectForKey:v8];

  uint64_t v4 = [a1 cachedActionSetExecuteErrorTimerContextByUUID];
  id v5 = [v4 objectForKeyedSubscript:v8];

  if (v5)
  {
    id v6 = [a1 cachedActionSetExecuteErrorTimerContextByUUID];
    [v6 removeObjectForKey:v8];

    id v7 = [a1 timerManager];
    [v7 cancelTimerForContext:v5];
  }
}

void __127__HMDWidgetTimelineRefresher_executeActionSetsToTurnOffWithSPIClientIdentifiers_widgetKind_message_completionGroup_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) uuid];
  id v7 = [*(id *)(a1 + 48) identifier];
  [v5 _removePendingRequestValueForUUID:v6 messageIdentifier:v7];

  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = *(id *)(a1 + 32);
  id v10 = HMFGetOSLogHandle();
  id v11 = v10;
  if (v3)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      long long v12 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      id v13 = [*(id *)(a1 + 48) identifier];

      if (v13)
      {
        long long v14 = [*(id *)(a1 + 48) identifier];
        [v14 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v24 = *(_OWORD *)buf;
      uint64_t v18 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      __int16 v26 = 2096;
      __int16 v27 = &v24;
      __int16 v28 = 2112;
      uint64_t v29 = v18;
      __int16 v30 = 2112;
      id v31 = v3;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Failed to turn off action set: %@, with error: %@", buf, 0x30u);
    }
    -[HMDWidgetTimelineRefresher _setCachedError:forActionSet:](*(void **)(a1 + 32), v3, *(void **)(a1 + 40));
    id v19 = *(void **)(a1 + 32);
    uint64_t v20 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 56)];
    -[HMDWidgetTimelineRefresher refreshTimelineForWidgetKinds:withReason:shouldCoalesce:](v19, v20, @"Turn Off Action Set Execution Failed", 1);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      dispatch_group_t v15 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      uint64_t v16 = [*(id *)(a1 + 48) identifier];

      if (v16)
      {
        os_log_type_t v17 = [*(id *)(a1 + 48) identifier];
        [v17 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v23 = *(_OWORD *)buf;
      uint64_t v21 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      __int16 v26 = 2096;
      __int16 v27 = &v23;
      __int16 v28 = 2112;
      uint64_t v29 = v21;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{uuid_t}.16P] Successfully turned off action set: %@", buf, 0x26u);
    }
    long long v22 = *(void **)(a1 + 32);
    uint64_t v20 = [*(id *)(a1 + 40) uuid];
    [v22 _startActionSetPrimaryStateUpdateCoalesceTimerContextForActionSetUUID:v20 expectedState:&unk_26E471170];
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __127__HMDWidgetTimelineRefresher_executeActionSetsToTurnOffWithSPIClientIdentifiers_widgetKind_message_completionGroup_completion___block_invoke_256(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) workQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __127__HMDWidgetTimelineRefresher_executeActionSetsToTurnOffWithSPIClientIdentifiers_widgetKind_message_completionGroup_completion___block_invoke_2;
  v12[3] = &unk_264A2EE30;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v13 = v5;
  uint64_t v14 = v9;
  id v15 = v6;
  id v16 = v8;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, v12);
}

void __127__HMDWidgetTimelineRefresher_executeActionSetsToTurnOffWithSPIClientIdentifiers_widgetKind_message_completionGroup_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  if (*(void *)(a1 + 32))
  {
    id v2 = *(void (**)(uint64_t))(v1 + 16);
    uint64_t v3 = *(void *)(a1 + 56);
    v2(v3);
  }
  else
  {
    id v4 = [*(id *)(a1 + 40) _firstErrorFromCharacteristicWriteResponsePayload:*(void *)(a1 + 48)];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v4);
  }
}

- (void)_setCachedError:(void *)a3 forActionSet:
{
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    id v11 = [v5 uuid];
    id v7 = [a1 cachedActionSetExecuteErrorByUUID];
    [v7 setObject:v6 forKeyedSubscript:v11];

    id v8 = [a1 timerManager];
    uint64_t v9 = [v8 startTimerWithTimeInterval:v5 andReplaceObject:8.0];

    id v10 = [a1 cachedActionSetExecuteErrorTimerContextByUUID];
    [v10 setObject:v9 forKeyedSubscript:v11];
  }
}

void __118__HMDWidgetTimelineRefresher_executeActionSetsWithSPIClientIdentifiers_widgetKind_message_completionGroup_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __118__HMDWidgetTimelineRefresher_executeActionSetsWithSPIClientIdentifiers_widgetKind_message_completionGroup_completion___block_invoke_2;
  v6[3] = &unk_264A2DF78;
  long long v7 = *((_OWORD *)a1 + 2);
  id v8 = a1[6];
  id v9 = v3;
  id v10 = a1[7];
  id v11 = a1[8];
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __118__HMDWidgetTimelineRefresher_executeActionSetsWithSPIClientIdentifiers_widgetKind_message_completionGroup_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) uuid];
  id v4 = [*(id *)(a1 + 48) identifier];
  [v2 _removePendingRequestValueForUUID:v3 messageIdentifier:v4];

  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 32);
  id v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      id v11 = [*(id *)(a1 + 48) identifier];

      if (v11)
      {
        long long v12 = [*(id *)(a1 + 48) identifier];
        [v12 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v24 = *(_OWORD *)buf;
      uint64_t v16 = *(void *)(a1 + 40);
      uint64_t v17 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      __int16 v26 = 2096;
      __int16 v27 = &v24;
      __int16 v28 = 2112;
      uint64_t v29 = v16;
      __int16 v30 = 2112;
      uint64_t v31 = v17;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Failed to execute action set: %@, with error: %@", buf, 0x30u);
    }
    -[HMDWidgetTimelineRefresher _setCachedError:forActionSet:](*(void **)(a1 + 32), *(void **)(a1 + 56), *(void **)(a1 + 40));
    uint64_t v18 = *(void **)(a1 + 32);
    id v19 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 64)];
    -[HMDWidgetTimelineRefresher refreshTimelineForWidgetKinds:withReason:shouldCoalesce:](v18, v19, @"Action Set Execution Failed", 1);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      uint64_t v14 = [*(id *)(a1 + 48) identifier];

      if (v14)
      {
        id v15 = [*(id *)(a1 + 48) identifier];
        [v15 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v23 = *(_OWORD *)buf;
      uint64_t v20 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      __int16 v26 = 2096;
      __int16 v27 = &v23;
      __int16 v28 = 2112;
      uint64_t v29 = v20;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{uuid_t}.16P] Successfully executed action set: %@", buf, 0x26u);
    }
    uint64_t v21 = *(void **)(a1 + 32);
    id v19 = [*(id *)(a1 + 40) uuid];
    [v21 _startActionSetPrimaryStateUpdateCoalesceTimerContextForActionSetUUID:v19 expectedState:&unk_26E471158];
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))();
}

- (void)handleFetchState:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F0DDE0];
  id v6 = [v4 arrayForKey:*MEMORY[0x263F0DDE0]];
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      long long v12 = [v4 identifier];

      if (v12)
      {
        id v13 = [v4 identifier];
        [v13 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v34 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&unsigned char buf[18] = 2096;
      *(void *)&buf[20] = &v34;
      __int16 v28 = 2112;
      uint64_t v29 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{uuid_t}.16P] Received message to fetch state for: %@", buf, 0x26u);
    }
    uint64_t v16 = -[HMDWidgetTimelineRefresher characteristicsFromSPIClientIdentifiers:](v8, v6);
    uint64_t v32 = v5;
    uint64_t v17 = [(HMDWidgetTimelineRefresher *)v8 valueByCharacteristicSPIClientIdentifierForCharacteristics:v16];
    long long v33 = v17;
    uint64_t v18 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];

    id v19 = (void *)MEMORY[0x230FBD990]();
    uint64_t v20 = v8;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      long long v22 = HMFGetLogIdentifier();
      long long v23 = [v4 name];
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      long long v24 = [v4 identifier];

      if (v24)
      {
        __int16 v25 = [v4 identifier];
        [v25 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v26 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v22;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v23;
      *(_WORD *)&unsigned char buf[22] = 1040;
      *(_DWORD *)&unsigned char buf[24] = 16;
      __int16 v28 = 2096;
      uint64_t v29 = &v26;
      __int16 v30 = 2112;
      uint64_t v31 = v18;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@[%@] Responding to %{uuid_t}.16P with payload: %@", buf, 0x30u);
    }
    [v4 respondWithPayload:v18];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      id v15 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not find characteristic UUIDs in message payload: %@", buf, 0x16u);
    }
    uint64_t v16 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v4 respondWithError:v16];
  }
}

- (id)characteristicsFromSPIClientIdentifiers:(void *)a1
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    id v4 = [MEMORY[0x263EFF9C0] set];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v5 = [a1 homeManager];
    id v6 = [v5 homes];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v56 objects:v63 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v57;
      id v37 = v6;
      uint64_t v32 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v57 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v12 = objc_msgSend(v11, "accessories", v32);
          uint64_t v43 = [v12 countByEnumeratingWithState:&v52 objects:v62 count:16];
          if (v43)
          {
            uint64_t v13 = *(void *)v53;
            uint64_t v33 = i;
            uint64_t v34 = v8;
            do
            {
              for (uint64_t j = 0; j != v43; ++j)
              {
                if (*(void *)v53 != v13) {
                  objc_enumerationMutation(v12);
                }
                id v15 = *(id *)(*((void *)&v52 + 1) + 8 * j);
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  uint64_t v16 = v15;
                }
                else {
                  uint64_t v16 = 0;
                }
                id v17 = v16;

                if (v17)
                {
                  long long v50 = 0u;
                  long long v51 = 0u;
                  long long v48 = 0u;
                  long long v49 = 0u;
                  uint64_t v18 = [v15 services];
                  uint64_t v38 = [v18 countByEnumeratingWithState:&v48 objects:v61 count:16];
                  if (v38)
                  {
                    uint64_t v19 = *(void *)v49;
                    int v41 = v17;
                    id v42 = v12;
                    uint64_t v35 = *(void *)v49;
                    uint64_t v36 = v13;
                    uint64_t v40 = v18;
                    do
                    {
                      uint64_t v20 = 0;
                      do
                      {
                        if (*(void *)v49 != v19) {
                          objc_enumerationMutation(v18);
                        }
                        uint64_t v39 = v20;
                        uint64_t v21 = *(void **)(*((void *)&v48 + 1) + 8 * v20);
                        long long v44 = 0u;
                        long long v45 = 0u;
                        long long v46 = 0u;
                        long long v47 = 0u;
                        long long v22 = [v21 characteristics];
                        uint64_t v23 = [v22 countByEnumeratingWithState:&v44 objects:v60 count:16];
                        if (v23)
                        {
                          uint64_t v24 = v23;
                          uint64_t v25 = *(void *)v45;
                          while (2)
                          {
                            for (uint64_t k = 0; k != v24; ++k)
                            {
                              if (*(void *)v45 != v25) {
                                objc_enumerationMutation(v22);
                              }
                              __int16 v27 = *(void **)(*((void *)&v44 + 1) + 8 * k);
                              __int16 v28 = [v27 spiClientIdentifier];
                              int v29 = [v3 containsObject:v28];

                              if (v29)
                              {
                                [v4 addObject:v27];
                                uint64_t v30 = [v4 count];
                                if (v30 == [v3 count])
                                {

                                  id v6 = v37;
                                  goto LABEL_39;
                                }
                              }
                            }
                            uint64_t v24 = [v22 countByEnumeratingWithState:&v44 objects:v60 count:16];
                            if (v24) {
                              continue;
                            }
                            break;
                          }
                        }

                        uint64_t v20 = v39 + 1;
                        id v17 = v41;
                        long long v12 = v42;
                        uint64_t v19 = v35;
                        uint64_t v13 = v36;
                        uint64_t v18 = v40;
                      }
                      while (v39 + 1 != v38);
                      uint64_t v38 = [v40 countByEnumeratingWithState:&v48 objects:v61 count:16];
                    }
                    while (v38);
                  }
                }
              }
              id v6 = v37;
              uint64_t v9 = v32;
              uint64_t i = v33;
              uint64_t v8 = v34;
              uint64_t v43 = [v12 countByEnumeratingWithState:&v52 objects:v62 count:16];
            }
            while (v43);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v56 objects:v63 count:16];
      }
      while (v8);
    }
LABEL_39:
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)handleMonitorCharacteristicsForWidget:(id)a3
{
  uint64_t v137 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 stringForKey:*MEMORY[0x263F0DE18]];
  if (v5)
  {
    id v6 = [v4 stringForKey:*MEMORY[0x263F0DE20]];
    if (!v6)
    {
      __int16 v27 = (void *)MEMORY[0x230FBD990]();
      __int16 v28 = self;
      int v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = HMFGetLogIdentifier();
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        uint64_t v31 = [v4 identifier];

        if (v31)
        {
          uint64_t v32 = [v4 identifier];
          [v32 getUUIDBytes:buf];
        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x263F42690];
        }
        long long v133 = *(_OWORD *)buf;
        long long v52 = [v4 messagePayload];
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v30;
        *(_WORD *)&buf[12] = 1040;
        *(_DWORD *)&buf[14] = 16;
        *(_WORD *)&unsigned char buf[18] = 2096;
        *(void *)&buf[20] = &v133;
        *(_WORD *)&unsigned char buf[28] = 2112;
        *(void *)&buf[30] = v52;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Could not find widget kind in message payload: %@", buf, 0x26u);
      }
      uint64_t v8 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [v4 respondWithError:v8];
      goto LABEL_87;
    }
    uint64_t v7 = *MEMORY[0x263F0DDE0];
    uint64_t v8 = [v4 arrayForKey:*MEMORY[0x263F0DDE0]];
    if (!v8)
    {
      uint64_t v33 = (void *)MEMORY[0x230FBD990]();
      uint64_t v34 = self;
      uint64_t v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = HMFGetLogIdentifier();
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        id v37 = [v4 identifier];

        if (v37)
        {
          uint64_t v38 = [v4 identifier];
          [v38 getUUIDBytes:buf];
        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x263F42690];
        }
        long long v132 = *(_OWORD *)buf;
        long long v53 = [v4 messagePayload];
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v36;
        *(_WORD *)&buf[12] = 1040;
        *(_DWORD *)&buf[14] = 16;
        *(_WORD *)&unsigned char buf[18] = 2096;
        *(void *)&buf[20] = &v132;
        *(_WORD *)&unsigned char buf[28] = 2112;
        *(void *)&buf[30] = v53;
        _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Could not find characteristic UUIDs in message payload: %@", buf, 0x26u);
      }
      uint64_t v9 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [v4 respondWithError:v9];
      goto LABEL_86;
    }
    uint64_t v9 = [v4 numberForKey:*MEMORY[0x263F0DDF0]];
    if (!v9)
    {
      uint64_t v39 = (void *)MEMORY[0x230FBD990]();
      uint64_t v40 = self;
      int v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        id v42 = HMFGetLogIdentifier();
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        uint64_t v43 = [v4 identifier];

        if (v43)
        {
          long long v44 = [v4 identifier];
          [v44 getUUIDBytes:buf];
        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x263F42690];
        }
        long long v131 = *(_OWORD *)buf;
        long long v93 = [v4 messagePayload];
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v42;
        *(_WORD *)&buf[12] = 1040;
        *(_DWORD *)&buf[14] = 16;
        *(_WORD *)&unsigned char buf[18] = 2096;
        *(void *)&buf[20] = &v131;
        *(_WORD *)&unsigned char buf[28] = 2112;
        *(void *)&buf[30] = v93;
        _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Could not find generation counter in message payload: %@", buf, 0x26u);

        uint64_t v9 = 0;
      }

      id v10 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [v4 respondWithError:v10];
      goto LABEL_85;
    }
    uint64_t v111 = *MEMORY[0x263F0DE00];
    id v10 = objc_msgSend(v4, "numberForKey:");
    if (!v10)
    {
      long long v46 = (void *)MEMORY[0x230FBD990]();
      long long v47 = self;
      long long v48 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        long long v117 = v9;
        long long v49 = HMFGetLogIdentifier();
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        long long v50 = [v4 identifier];

        if (v50)
        {
          long long v51 = [v4 identifier];
          [v51 getUUIDBytes:buf];
        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x263F42690];
        }
        long long v130 = *(_OWORD *)buf;
        uint64_t v94 = [v4 messagePayload];
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v49;
        *(_WORD *)&buf[12] = 1040;
        *(_DWORD *)&buf[14] = 16;
        *(_WORD *)&unsigned char buf[18] = 2096;
        *(void *)&buf[20] = &v130;
        *(_WORD *)&unsigned char buf[28] = 2112;
        *(void *)&buf[30] = v94;
        _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Could not find reachability registration value in message payload: %@", buf, 0x26u);

        uint64_t v9 = v117;
        id v10 = 0;
      }

      long long v95 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [v4 respondWithError:v95];
      goto LABEL_84;
    }
    uint64_t v107 = v7;
    id v112 = [v4 uuidForKey:*MEMORY[0x263F0DDE8]];
    id v11 = [[HMDWidget alloc] initWithIdentifier:v5 kind:v6];
    id v108 = v8;
    long long v12 = -[HMDWidgetTimelineRefresher characteristicsFromSPIClientIdentifiers:](self, v8);
    v118[0] = MEMORY[0x263EF8330];
    v118[1] = 3221225472;
    v118[2] = __68__HMDWidgetTimelineRefresher_handleMonitorCharacteristicsForWidget___block_invoke;
    v118[3] = &unk_264A1B3F8;
    v110 = v10;
    id v13 = v10;
    id v119 = v13;
    uint64_t v109 = v12;
    uint64_t v114 = objc_msgSend(v12, "na_map:", v118);
    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    id v116 = v9;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = v11;
      uint64_t v18 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      uint64_t v19 = [v4 identifier];

      if (v19)
      {
        uint64_t v20 = [v4 identifier];
        [v20 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v124 = *(_OWORD *)buf;
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      id v11 = v17;
      if (v112) {
        [v112 getUUIDBytes:buf];
      }
      else {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v123 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138544898;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&unsigned char buf[18] = 2096;
      *(void *)&buf[20] = &v124;
      *(_WORD *)&unsigned char buf[28] = 2112;
      *(void *)&buf[30] = v17;
      *(_WORD *)&unsigned char buf[38] = 2112;
      *(void *)&buf[40] = v116;
      __int16 v126 = 1040;
      int v127 = 16;
      __int16 v128 = 2096;
      uint64_t v129 = &v123;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@[%{uuid_t}.16P] Received message to update characteristics for widget: %@, generation counter: %@, current home: %{uuid_t}.16P", buf, 0x40u);

      uint64_t v9 = v116;
    }

    [v13 BOOLValue];
    uint64_t v54 = [v4 qualityOfService];
    id v115 = v114;
    long long v55 = v11;
    id v113 = v55;
    if (v15)
    {
      long long v56 = [(HMDWidgetTimelineRefresher *)v15 workQueue];
      dispatch_assert_queue_V2(v56);

      long long v57 = [(HMDWidgetTimelineRefresher *)v15 monitoredCharacteristicsMapByWidget];
      long long v58 = [v57 objectForKeyedSubscript:v55];
      long long v59 = v58;
      if (v58)
      {
        id v60 = v58;
      }
      else
      {
        id v60 = [MEMORY[0x263EFFA08] set];
      }
      id v61 = v60;

      int v62 = [v115 isEqualToSet:v61];
      uint64_t v63 = (void *)MEMORY[0x230FBD990]();
      uint64_t v64 = v15;
      uint64_t v65 = HMFGetOSLogHandle();
      BOOL v66 = os_log_type_enabled(v65, OS_LOG_TYPE_INFO);
      if (v62)
      {
        if (v66)
        {
          long long v67 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v67;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v113;
          _os_log_impl(&dword_22F52A000, v65, OS_LOG_TYPE_INFO, "%{public}@Monitored characteristics did not change for widget %@", buf, 0x16u);
        }
      }
      else
      {
        if (v66)
        {
          id v68 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v68;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v113;
          *(_WORD *)&unsigned char buf[22] = 2112;
          *(void *)&unsigned char buf[24] = v115;
          _os_log_impl(&dword_22F52A000, v65, OS_LOG_TYPE_INFO, "%{public}@Monitored characteristics changed for widget %@ to %@", buf, 0x20u);
        }
        __int16 v69 = -[HMDWidgetTimelineRefresher characteristicsMonitoredForWidgets](v64);
        uint64_t v70 = [(HMDWidgetTimelineRefresher *)v64 monitoredCharacteristicsMapByWidget];
        [v70 setObject:v115 forKeyedSubscript:v113];

        __int16 v71 = -[HMDWidgetTimelineRefresher characteristicsMonitoredForWidgets](v64);
        -[HMDWidgetTimelineRefresher updateNotificationRegistrationWithPreviousCharacteristics:currentCharacteristics:updateRequestQualityOfService:](v64, v69, v71, v54);
      }
      uint64_t v9 = v116;
      long long v55 = v113;
    }

    unsigned int v72 = [v9 unsignedIntValue];
    if (v15)
    {
      unint64_t v73 = v72;
      if (!v72)
      {
        id v74 = (void *)MEMORY[0x230FBD990]();
        long long v75 = v15;
        long long v76 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_FAULT))
        {
          long long v77 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v77;
          _os_log_impl(&dword_22F52A000, v76, OS_LOG_TYPE_FAULT, "%{public}@Generation counter is unexpectedly set to zero.", buf, 0xCu);
        }
      }
      long long v78 = [(HMDWidgetTimelineRefresher *)v15 homeManager];
      unint64_t v79 = [v78 generationCounter];

      if (v79 > v73)
      {
        uint64_t v80 = (void *)MEMORY[0x230FBD990]();
        __int16 v81 = v15;
        id v82 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
        {
          __int16 v83 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v83;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v73;
          *(_WORD *)&unsigned char buf[22] = 2048;
          *(void *)&unsigned char buf[24] = v79;
          _os_log_impl(&dword_22F52A000, v82, OS_LOG_TYPE_INFO, "%{public}@Refreshing timeline because client's generation counter is older. Client: %lu, homed: %lu", buf, 0x20u);
        }
        uint64_t v84 = [MEMORY[0x263EFFA08] setWithObject:v6];
        -[HMDWidgetTimelineRefresher refreshTimelineForWidgetKinds:withReason:shouldCoalesce:](v81, v84, @"Generation counter mismatch", 1);
        __int16 v85 = v109;
LABEL_77:

        goto LABEL_78;
      }
      id v86 = v112;
      id v87 = [(HMDWidgetTimelineRefresher *)v15 homeManager];
      long long v88 = [v87 currentHomeUUID];

      if ((HMFEqualObjects() & 1) == 0)
      {
        uint64_t v89 = (void *)MEMORY[0x230FBD990]();
        id v90 = v15;
        long long v91 = HMFGetOSLogHandle();
        __int16 v85 = v109;
        if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
        {
          id v106 = v89;
          HMFGetLogIdentifier();
          id v92 = (id)objc_claimAutoreleasedReturnValue();
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          if (v86) {
            [v86 getUUIDBytes:buf];
          }
          else {
            *(_OWORD *)buf = *MEMORY[0x263F42690];
          }
          long long v136 = *(_OWORD *)buf;
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          if (v88) {
            [v88 getUUIDBytes:buf];
          }
          else {
            *(_OWORD *)buf = *MEMORY[0x263F42690];
          }
          long long v135 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138544386;
          *(void *)&uint8_t buf[4] = v92;
          *(_WORD *)&buf[12] = 1040;
          *(_DWORD *)&buf[14] = 16;
          *(_WORD *)&unsigned char buf[18] = 2096;
          *(void *)&buf[20] = &v136;
          *(_WORD *)&unsigned char buf[28] = 1040;
          *(_DWORD *)&buf[30] = 16;
          *(_WORD *)&buf[34] = 2096;
          *(void *)&buf[36] = &v135;
          _os_log_impl(&dword_22F52A000, v91, OS_LOG_TYPE_INFO, "%{public}@Refreshing timeline because client's currentHome UUID is different. Client: %{uuid_t}.16P, homed: %{uuid_t}.16P", buf, 0x2Cu);

          uint64_t v89 = v106;
        }

        uint64_t v84 = [MEMORY[0x263EFFA08] setWithObject:v6];
        -[HMDWidgetTimelineRefresher refreshTimelineForWidgetKinds:withReason:shouldCoalesce:](v90, v84, @"Current home mismatch", 1);
        goto LABEL_77;
      }
    }
    else
    {
    }
    __int16 v85 = v109;
LABEL_78:
    v121[0] = v107;
    uint64_t v96 = [(HMDWidgetTimelineRefresher *)v15 valueByCharacteristicSPIClientIdentifierForCharacteristics:v85];
    v121[1] = v111;
    v122[0] = v96;
    long long v97 = [(HMDWidgetTimelineRefresher *)v15 reachabilityByAccessorySPIClientIdentifierForCharacteristics:v85];
    v122[1] = v97;
    uint64_t v98 = [NSDictionary dictionaryWithObjects:v122 forKeys:v121 count:2];

    id v99 = (void *)MEMORY[0x230FBD990]();
    id v100 = v15;
    long long v101 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
    {
      id v102 = HMFGetLogIdentifier();
      id v103 = [v4 name];
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      id v104 = [v4 identifier];

      if (v104)
      {
        id v105 = [v4 identifier];
        [v105 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v120 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v102;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v103;
      *(_WORD *)&unsigned char buf[22] = 1040;
      *(_DWORD *)&unsigned char buf[24] = 16;
      *(_WORD *)&unsigned char buf[28] = 2096;
      *(void *)&buf[30] = &v120;
      *(_WORD *)&unsigned char buf[38] = 2112;
      *(void *)&buf[40] = v98;
      _os_log_impl(&dword_22F52A000, v101, OS_LOG_TYPE_INFO, "%{public}@[%@] Responding to %{uuid_t}.16P with payload: %@", buf, 0x30u);

      __int16 v85 = v109;
    }

    [v4 respondWithPayload:v98];

    uint64_t v8 = v108;
    uint64_t v9 = v116;
    id v10 = v110;
    long long v95 = v112;
LABEL_84:

LABEL_85:
LABEL_86:

LABEL_87:
    goto LABEL_88;
  }
  uint64_t v21 = (void *)MEMORY[0x230FBD990]();
  long long v22 = self;
  uint64_t v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    uint64_t v24 = HMFGetLogIdentifier();
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    uint64_t v25 = [v4 identifier];

    if (v25)
    {
      long long v26 = [v4 identifier];
      [v26 getUUIDBytes:buf];
    }
    else
    {
      *(_OWORD *)buf = *MEMORY[0x263F42690];
    }
    long long v134 = *(_OWORD *)buf;
    long long v45 = [v4 messagePayload];
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v24;
    *(_WORD *)&buf[12] = 1040;
    *(_DWORD *)&buf[14] = 16;
    *(_WORD *)&unsigned char buf[18] = 2096;
    *(void *)&buf[20] = &v134;
    *(_WORD *)&unsigned char buf[28] = 2112;
    *(void *)&buf[30] = v45;
    _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Could not find widget identifier in message payload: %@", buf, 0x26u);
  }
  id v6 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
  [v4 respondWithError:v6];
LABEL_88:
}

_TtC13HomeKitDaemon32HMDWidgetMonitoredCharacteristic *__68__HMDWidgetTimelineRefresher_handleMonitorCharacteristicsForWidget___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = -[HMDWidgetMonitoredCharacteristic initWithCharacteristic:reachabilityMonitored:]([_TtC13HomeKitDaemon32HMDWidgetMonitoredCharacteristic alloc], "initWithCharacteristic:reachabilityMonitored:", v3, [*(id *)(a1 + 32) BOOLValue]);

  return v4;
}

- (void)fetchAndStoreActiveWidgetKinds
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v27 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Reloading widgets from Chronod", buf, 0xCu);
  }
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v9 = objc_msgSend(v8, "fetchedHomeWidgets", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v22 + 1) + 8 * v13) widget];
        id v15 = [v14 kind];
        [v7 addObject:v15];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v11);
  }

  uint64_t v16 = (void *)MEMORY[0x230FBD990]();
  id v17 = v4;
  uint64_t v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = HMFGetLogIdentifier();
    uint64_t v20 = [v7 allObjects];
    uint64_t v21 = [v20 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138543618;
    __int16 v27 = v19;
    __int16 v28 = 2112;
    int v29 = v21;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Active widgets are: %@", buf, 0x16u);
  }
  [(HMDWidgetTimelineRefresher *)v17 setActiveWidgetKinds:v7];
}

- (void)forceUpdateTimelineForWidgetKinds:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = [(HMDWidgetTimelineRefresher *)self workQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __64__HMDWidgetTimelineRefresher_forceUpdateTimelineForWidgetKinds___block_invoke;
    v6[3] = &unk_264A2F820;
    id v7 = v4;
    uint64_t v8 = self;
    dispatch_async(v5, v6);
  }
}

void __64__HMDWidgetTimelineRefresher_forceUpdateTimelineForWidgetKinds___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) widgetKindsToUpdate];
  LOBYTE(v2) = [v2 isSubsetOfSet:v3];

  if ((v2 & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 40) widgetKindsToUpdate];
    uint64_t v5 = [v4 count];

    id v6 = [*(id *)(a1 + 40) widgetKindsToUpdate];
    id v7 = [v6 setByAddingObjectsFromSet:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) setWidgetKindsToUpdate:v7];

    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = [*(id *)(a1 + 40) widgetKindsToUpdate];
      uint64_t v13 = [v12 allObjects];
      uint64_t v14 = [v13 sortedArrayUsingComparator:&__block_literal_global_58458];
      id v15 = [v14 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v11;
      __int16 v21 = 2112;
      long long v22 = v15;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@More kinds to reload: %@", buf, 0x16u);
    }
    if (!v5)
    {
      dispatch_time_t v16 = dispatch_time(0, [*(id *)(a1 + 40) forceUpdateTimelineDispatchDelayNs]);
      id v17 = [*(id *)(a1 + 40) workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __64__HMDWidgetTimelineRefresher_forceUpdateTimelineForWidgetKinds___block_invoke_192;
      block[3] = &unk_264A2F7F8;
      void block[4] = *(void *)(a1 + 40);
      dispatch_after(v16, v17, block);
    }
  }
}

void __64__HMDWidgetTimelineRefresher_forceUpdateTimelineForWidgetKinds___block_invoke_192(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v32 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [*(id *)(a1 + 32) widgetKindsToUpdate];
  uint64_t v2 = [obj countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v22;
    uint64_t v19 = v1;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v22 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v7 = (void *)[objc_alloc(MEMORY[0x263F31E68]) initWithExtensionBundleIdentifier:@"com.apple.Home.HomeWidget" kind:v6];
        uint64_t v8 = [v7 reloadTimelineWithReason:@"new data"];
        id v9 = (void *)MEMORY[0x230FBD990]();
        id v10 = *(id *)(v1 + 32);
        uint64_t v11 = HMFGetOSLogHandle();
        uint64_t v12 = v11;
        if (v8)
        {
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            goto LABEL_12;
          }
          uint64_t v13 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          long long v26 = v13;
          __int16 v27 = 2112;
          uint64_t v28 = v6;
          __int16 v29 = 2112;
          uint64_t v30 = v8;
          uint64_t v14 = v12;
          os_log_type_t v15 = OS_LOG_TYPE_ERROR;
          dispatch_time_t v16 = "%{public}@Failed reload of timeline for '%@': %@";
          uint32_t v17 = 32;
        }
        else
        {
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_12;
          }
          uint64_t v13 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          long long v26 = v13;
          __int16 v27 = 2112;
          uint64_t v28 = v6;
          uint64_t v14 = v12;
          os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
          dispatch_time_t v16 = "%{public}@Successfully reloaded timeline for '%@'";
          uint32_t v17 = 22;
        }
        _os_log_impl(&dword_22F52A000, v14, v15, v16, buf, v17);

        uint64_t v1 = v19;
LABEL_12:
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v3);
  }

  uint64_t v18 = [MEMORY[0x263EFFA08] set];
  [*(id *)(v1 + 32) setWidgetKindsToUpdate:v18];
}

uint64_t __64__HMDWidgetTimelineRefresher_forceUpdateTimelineForWidgetKinds___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)widgetKindsToUpdateFromFetchSpecifications:(id)a3 assumingChangedCharacteristic:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v31 = [MEMORY[0x263EFF9C0] set];
  uint64_t v33 = v6;
  id v7 = [v6 service];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v39;
    *(void *)&long long v9 = 138543618;
    long long v29 = v9;
    uint64_t v32 = *(void *)v39;
    do
    {
      uint64_t v12 = 0;
      uint64_t v34 = v10;
      do
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v38 + 1) + 8 * v12);
        uint64_t v14 = objc_msgSend(v13, "serviceTypes", v29);
        os_log_type_t v15 = [v7 type];
        if (![v14 containsObject:v15])
        {

          goto LABEL_19;
        }
        dispatch_time_t v16 = [v13 associatedServiceTypes];
        char v17 = objc_msgSend(v16, "hmf_isEmpty");
        if ((v17 & 1) == 0)
        {
          uint64_t v18 = [v13 associatedServiceTypes];
          uint64_t v36 = [v7 associatedServiceType];
          id v37 = v18;
          if (!objc_msgSend(v18, "containsObject:"))
          {
            char v22 = 0;
            goto LABEL_15;
          }
        }
        uint64_t v19 = v7;
        uint64_t v20 = [v13 characteristicTypes];
        long long v21 = [v33 type];
        char v22 = [v20 containsObject:v21];

        if ((v17 & 1) == 0)
        {
          id v7 = v19;
          uint64_t v11 = v32;
LABEL_15:
          uint64_t v10 = v34;

          if ((v22 & 1) == 0) {
            goto LABEL_20;
          }
LABEL_16:
          long long v23 = (void *)MEMORY[0x230FBD990]();
          long long v24 = self;
          long long v25 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            long long v26 = HMFGetLogIdentifier();
            __int16 v27 = [v13 affectedWidgetKinds];
            *(_DWORD *)buf = v29;
            uint64_t v43 = v26;
            __int16 v44 = 2112;
            long long v45 = v27;
            _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@...must reload widget kinds: %@", buf, 0x16u);
          }
          uint64_t v14 = [v13 affectedWidgetKinds];
          [v31 unionSet:v14];
LABEL_19:

          goto LABEL_20;
        }

        id v7 = v19;
        uint64_t v11 = v32;
        uint64_t v10 = v34;
        if (v22) {
          goto LABEL_16;
        }
LABEL_20:
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v10);
  }

  return v31;
}

- (id)widgetKindsToUpdateFromFetchSpecifications:(id)a3 changedCharacteristics:(id)a4
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v76 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x230FBD990]();
  uint64_t v8 = self;
  long long v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    long long v101 = v10;
    __int16 v102 = 2082;
    id v103 = "-[HMDWidgetTimelineRefresher widgetKindsToUpdateFromFetchSpecifications:changedCharacteristics:]";
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@%{public}s", buf, 0x16u);
  }
  id v75 = [MEMORY[0x263EFF9C0] set];
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id obj = v6;
  uint64_t v11 = [obj countByEnumeratingWithState:&v96 objects:v114 count:16];
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v95 = *(void *)v97;
    *(void *)&long long v12 = 138544898;
    long long v67 = v12;
    long long v88 = v8;
    do
    {
      uint64_t v14 = 0;
      uint64_t v89 = v13;
      do
      {
        if (*(void *)v97 != v95) {
          objc_enumerationMutation(obj);
        }
        os_log_type_t v15 = *(void **)(*((void *)&v96 + 1) + 8 * v14);
        dispatch_time_t v16 = objc_msgSend(v15, "accessory", v67);
        char v17 = [v16 home];
        uint64_t v18 = v17;
        if (v8)
        {
          char v19 = [v17 hasAnyResident];

          if (v19)
          {
            uint64_t v20 = [(HMDWidgetTimelineRefresher *)v8 characteristicsToPreviouslySeenValues];
            long long v21 = [v15 serializedIdentifier];
            char v22 = [v20 objectForKeyedSubscript:v21];

            long long v23 = [v15 value];
            LODWORD(v21) = HMFEqualObjects();

            if (v21)
            {
              os_log_t log = v22;
              long long v24 = (void *)MEMORY[0x230FBD990]();
              long long v25 = v8;
              long long v26 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                __int16 v69 = HMFGetLogIdentifier();
                __int16 v81 = [v15 characteristicType];
                uint64_t v27 = HAPShortUUIDType();
                uint64_t v28 = [v15 characteristicTypeDescription];
                long long v77 = [v15 accessory];
                unsigned int v72 = [v77 home];
                long long v29 = [v72 name];
                [v15 accessory];
                uint64_t v30 = contexta = v24;
                id v31 = [v30 name];
                uint64_t v32 = [v15 value];
                *(_DWORD *)buf = 138544642;
                long long v101 = v69;
                __int16 v102 = 2112;
                id v103 = (const char *)v27;
                uint64_t v33 = (void *)v27;
                __int16 v104 = 2112;
                uint64_t v105 = v28;
                uint64_t v34 = (void *)v28;
                __int16 v106 = 2112;
                uint64_t v107 = v29;
                __int16 v108 = 2112;
                uint64_t v109 = v31;
                __int16 v110 = 2112;
                uint64_t v111 = v32;
                _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@...ignoring redundant characteristic [%@] (%@) from '%@:%@', value '%@'", buf, 0x3Eu);

                long long v24 = contexta;
                uint64_t v8 = v88;

                uint64_t v13 = v89;
              }

              char v22 = log;
            }
            else
            {
              uint64_t v35 = [(HMDWidgetTimelineRefresher *)v8 widgetKindsToUpdateFromFetchSpecifications:v76 assumingChangedCharacteristic:v15];
              [v75 unionSet:v35];
              uint64_t v36 = [v35 count];
              context = (void *)MEMORY[0x230FBD990]();
              id v37 = v8;
              long long v38 = HMFGetOSLogHandle();
              BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_INFO);
              if (v36)
              {
                if (v39)
                {
                  HMFGetLogIdentifier();
                  v82 = long long v78 = v35;
                  unint64_t v73 = [v15 characteristicType];
                  HAPShortUUIDType();
                  long long v40 = (char *)objc_claimAutoreleasedReturnValue();
                  [v15 characteristicTypeDescription];
                  long long v41 = loga = v38;
                  uint64_t v70 = [v15 accessory];
                  id v68 = [v70 home];
                  id v42 = [v68 name];
                  uint64_t v43 = [v15 accessory];
                  __int16 v44 = [v43 name];
                  [v15 value];
                  long long v46 = v45 = v22;
                  *(_DWORD *)buf = v67;
                  long long v101 = v82;
                  __int16 v102 = 2112;
                  id v103 = v40;
                  __int16 v104 = 2112;
                  uint64_t v105 = (uint64_t)v41;
                  __int16 v106 = 2112;
                  uint64_t v107 = v42;
                  __int16 v108 = 2112;
                  uint64_t v109 = v44;
                  __int16 v110 = 2112;
                  uint64_t v111 = v46;
                  __int16 v112 = 2112;
                  id v113 = v45;
                  _os_log_impl(&dword_22F52A000, loga, OS_LOG_TYPE_INFO, "%{public}@...updating characteristic [%@] (%@) from '%@:%@', value '%@' was '%@'", buf, 0x48u);

                  char v22 = v45;
                  uint64_t v8 = v88;

                  uint64_t v13 = v89;
                  long long v38 = loga;

                  uint64_t v35 = v78;
                }

                uint64_t v47 = [v15 value];
                long long v48 = [(HMDWidgetTimelineRefresher *)v37 characteristicsToPreviouslySeenValues];
                long long v49 = [v15 serializedIdentifier];
                [v48 setObject:v47 forKeyedSubscript:v49];
              }
              else
              {
                if (v39)
                {
                  __int16 v83 = HMFGetLogIdentifier();
                  unint64_t v79 = [v15 characteristicType];
                  HAPShortUUIDType();
                  long long v50 = (char *)objc_claimAutoreleasedReturnValue();
                  long long v51 = [v15 characteristicTypeDescription];
                  id v74 = [v15 accessory];
                  __int16 v71 = [v74 home];
                  long long v52 = [v71 name];
                  long long v53 = [v15 accessory];
                  [v53 name];
                  uint64_t v54 = logb = v22;
                  long long v55 = [v15 value];
                  *(_DWORD *)buf = 138544642;
                  long long v101 = v83;
                  __int16 v102 = 2112;
                  id v103 = v50;
                  __int16 v104 = 2112;
                  uint64_t v105 = (uint64_t)v51;
                  __int16 v106 = 2112;
                  uint64_t v107 = v52;
                  __int16 v108 = 2112;
                  uint64_t v109 = v54;
                  __int16 v110 = 2112;
                  uint64_t v111 = v55;
                  _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@...ignoring irrelevant characteristic [%@] (%@) from '%@:%@', value '%@'", buf, 0x3Eu);

                  char v22 = logb;
                  uint64_t v13 = v89;

                  uint64_t v8 = v88;
                }
              }
            }
            goto LABEL_27;
          }
        }
        else
        {
        }
        long long v56 = MEMORY[0x230FBD990]();
        long long v57 = v8;
        long long v58 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          long long v59 = HMFGetLogIdentifier();
          contextb = [v15 characteristicType];
          HAPShortUUIDType();
          id v60 = (char *)objc_claimAutoreleasedReturnValue();
          id v61 = [v15 characteristicTypeDescription];
          uint64_t v84 = [v15 accessory];
          uint64_t v80 = [v84 home];
          int v62 = [v80 name];
          [v15 accessory];
          uint64_t v63 = logc = v56;
          uint64_t v64 = [v63 name];
          uint64_t v65 = [v15 value];
          *(_DWORD *)buf = 138544642;
          long long v101 = v59;
          __int16 v102 = 2112;
          id v103 = v60;
          __int16 v104 = 2112;
          uint64_t v105 = (uint64_t)v61;
          __int16 v106 = 2112;
          uint64_t v107 = v62;
          __int16 v108 = 2112;
          uint64_t v109 = v64;
          __int16 v110 = 2112;
          uint64_t v111 = v65;
          _os_log_impl(&dword_22F52A000, v58, OS_LOG_TYPE_INFO, "%{public}@...No resident. Ignoring characteristic [%@] (%@) from '%@:%@', value '%@'", buf, 0x3Eu);

          long long v56 = logc;
          uint64_t v8 = v88;

          uint64_t v13 = v89;
        }

LABEL_27:
        ++v14;
      }
      while (v13 != v14);
      uint64_t v13 = [obj countByEnumeratingWithState:&v96 objects:v114 count:16];
    }
    while (v13);
  }

  return v75;
}

- (void)internalProcessChangedCharacteristics:(id)a3 activeWidgetKinds:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  long long v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v15 = 138543618;
    dispatch_time_t v16 = v11;
    __int16 v17 = 2080;
    uint64_t v18 = "-[HMDWidgetTimelineRefresher internalProcessChangedCharacteristics:activeWidgetKinds:]";
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@%s", (uint8_t *)&v15, 0x16u);
  }
  long long v12 = [(id)objc_opt_class() fetchSpecificationsForWidgetKinds:v7];
  uint64_t v13 = [(HMDWidgetTimelineRefresher *)v9 widgetKindsToUpdateFromFetchSpecifications:v12 changedCharacteristics:v6];
  uint64_t v14 = [(HMDWidgetTimelineRefresher *)v9 forceUpdateAutobahnTimelineHandler];
  ((void (**)(void, void *))v14)[2](v14, v13);
}

- (void)processCharacteristicsChangedNotification:(id)a3
{
  id v4 = a3;
  [(HMDWidgetTimelineRefresher *)self handleAccessoryCharacteristicsChangedNotification:v4];
  id v5 = [(HMDWidgetTimelineRefresher *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__HMDWidgetTimelineRefresher_processCharacteristicsChangedNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __72__HMDWidgetTimelineRefresher_processCharacteristicsChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Processing characteristics changed notification", (uint8_t *)&v9, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) modifiedCharacteristicsFromNotification:*(void *)(a1 + 40)];
  id v7 = *(void **)(a1 + 32);
  id v8 = [v7 activeWidgetKinds];
  [v7 internalProcessChangedCharacteristics:v6 activeWidgetKinds:v8];
}

- (void)stopMonitoringOldCharacteristics
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  __int16 v44 = v4;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = [(HMDWidgetTimelineRefresher *)v44 monitoredCharacteristics];
    uint64_t v8 = [v7 count];
    int v9 = &stru_26E2EB898;
    if (!v8) {
      int v9 = @"none registered";
    }
    *(_DWORD *)buf = 138543618;
    long long v59 = v6;
    __int16 v60 = 2112;
    id v61 = v9;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Stop monitoring previous accessories: %@", buf, 0x16u);

    id v4 = v44;
  }

  uint64_t v47 = objc_opt_new();
  uint64_t v10 = objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v11 = [(HMDWidgetTimelineRefresher *)v4 monitoredCharacteristics];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v53 != v14) {
          objc_enumerationMutation(v11);
        }
        dispatch_time_t v16 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        __int16 v17 = [v16 accessory];
        uint64_t v18 = [v17 uuid];
        if (v18)
        {
          [v47 setObject:v17 forKeyedSubscript:v18];
          uint64_t v19 = [v10 objectForKeyedSubscript:v18];
          uint64_t v20 = v19;
          if (v19) {
            [v19 setByAddingObject:v16];
          }
          else {
          long long v21 = [MEMORY[0x263EFFA08] setWithObject:v16];
          }
          [v10 setObject:v21 forKeyedSubscript:v18];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v13);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = [v47 allKeys];
  uint64_t v22 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
  long long v24 = v44;
  if (v22)
  {
    uint64_t v25 = v22;
    *(void *)&long long v23 = 138543618;
    long long v43 = v23;
    uint64_t v26 = *(void *)v49;
    do
    {
      uint64_t v27 = 0;
      uint64_t v45 = v25;
      do
      {
        if (*(void *)v49 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = *(void *)(*((void *)&v48 + 1) + 8 * v27);
        long long v29 = objc_msgSend(v47, "objectForKeyedSubscript:", v28, v43);
        uint64_t v30 = [v10 objectForKeyedSubscript:v28];
        id v31 = v30;
        if (v29) {
          BOOL v32 = v30 == 0;
        }
        else {
          BOOL v32 = 1;
        }
        if (!v32)
        {
          uint64_t v33 = [v30 allObjects];
          uint64_t v34 = [(HMDWidgetTimelineRefresher *)v24 clientIdentifier];
          [v29 setNotificationsEnabled:0 forCharacteristics:v33 clientIdentifier:v34];

          uint64_t v35 = (void *)MEMORY[0x230FBD990]();
          uint64_t v36 = v24;
          id v37 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            long long v38 = v10;
            long long v40 = v39 = v26;
            long long v41 = [v29 shortDescription];
            *(_DWORD *)buf = v43;
            long long v59 = v40;
            __int16 v60 = 2112;
            id v61 = v41;
            _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_INFO, "%{public}@- stopped monitoring accessory: %@", buf, 0x16u);

            long long v24 = v44;
            uint64_t v26 = v39;
            uint64_t v10 = v38;
            uint64_t v25 = v45;
          }
        }

        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v25);
  }

  id v42 = objc_opt_new();
  [(HMDWidgetTimelineRefresher *)v24 setMonitoredCharacteristics:v42];
}

- (id)monitorCharacteristicsForHome:(id)a3 fetchSpecifications:(id)a4
{
  uint64_t v128 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263EFF980] array];
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v110 objects:v127 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v111;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v111 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = [*(id *)(*((void *)&v110 + 1) + 8 * i) name];
        [v8 addObject:v13];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v110 objects:v127 count:16];
    }
    while (v10);
  }
  id v68 = v8;

  uint64_t v14 = (void *)MEMORY[0x230FBD990]();
  int v15 = self;
  dispatch_time_t v16 = HMFGetOSLogHandle();
  uint64_t v70 = v15;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    __int16 v17 = HMFGetLogIdentifier();
    uint64_t v18 = [v6 name];
    uint64_t v19 = [v6 shortDescription];
    uint64_t v20 = [v8 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138544130;
    long long v120 = v17;
    __int16 v121 = 2112;
    long long v122 = v18;
    __int16 v123 = 2112;
    long long v124 = v19;
    __int16 v125 = 2112;
    __int16 v126 = v20;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@monitorCharacteristicsForHome: '%@' [%@], fetch specifications: %@", buf, 0x2Au);

    int v15 = v70;
  }

  unsigned int v72 = objc_opt_new();
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v67 = v6;
  id v69 = [v6 hapAccessories];
  uint64_t v73 = [v69 countByEnumeratingWithState:&v106 objects:v118 count:16];
  if (v73)
  {
    uint64_t v71 = *(void *)v107;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v107 != v71) {
          objc_enumerationMutation(v69);
        }
        uint64_t v75 = v21;
        unint64_t v79 = *(void **)(*((void *)&v106 + 1) + 8 * v21);
        uint64_t v22 = [MEMORY[0x263EFF9C0] set];
        long long v102 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        id v76 = obj;
        uint64_t v80 = [v76 countByEnumeratingWithState:&v102 objects:v117 count:16];
        if (v80)
        {
          uint64_t v77 = *(void *)v103;
          do
          {
            long long v23 = 0;
            do
            {
              if (*(void *)v103 != v77) {
                objc_enumerationMutation(v76);
              }
              id v82 = v23;
              long long v24 = *(void **)(*((void *)&v102 + 1) + 8 * (void)v23);
              long long v98 = 0u;
              long long v99 = 0u;
              long long v100 = 0u;
              long long v101 = 0u;
              uint64_t v25 = [v79 services];
              uint64_t v26 = [v25 countByEnumeratingWithState:&v98 objects:v116 count:16];
              if (v26)
              {
                uint64_t v27 = v26;
                uint64_t v28 = *(void *)v99;
                uint64_t v84 = *(void *)v99;
                do
                {
                  uint64_t v29 = 0;
                  uint64_t v88 = v27;
                  do
                  {
                    if (*(void *)v99 != v28) {
                      objc_enumerationMutation(v25);
                    }
                    uint64_t v30 = *(void **)(*((void *)&v98 + 1) + 8 * v29);
                    id v31 = [v24 serviceTypes];
                    BOOL v32 = [v30 type];
                    if ([v31 containsObject:v32])
                    {
                      uint64_t v33 = [v24 associatedServiceTypes];
                      if (objc_msgSend(v33, "hmf_isEmpty"))
                      {
                      }
                      else
                      {
                        [v24 associatedServiceTypes];
                        uint64_t v34 = v24;
                        v36 = uint64_t v35 = v25;
                        id v37 = [v30 associatedServiceType];
                        int v86 = [v36 containsObject:v37];

                        uint64_t v28 = v84;
                        uint64_t v25 = v35;
                        long long v24 = v34;
                        uint64_t v27 = v88;

                        if (!v86) {
                          goto LABEL_41;
                        }
                      }
                      long long v96 = 0u;
                      long long v97 = 0u;
                      long long v94 = 0u;
                      long long v95 = 0u;
                      id v31 = [v24 characteristicTypes];
                      uint64_t v38 = [v31 countByEnumeratingWithState:&v94 objects:v115 count:16];
                      if (v38)
                      {
                        uint64_t v39 = v38;
                        uint64_t v40 = *(void *)v95;
                        do
                        {
                          for (uint64_t j = 0; j != v39; ++j)
                          {
                            if (*(void *)v95 != v40) {
                              objc_enumerationMutation(v31);
                            }
                            id v42 = [v30 findCharacteristicWithType:*(void *)(*((void *)&v94 + 1) + 8 * j)];
                            if (v42) {
                              [v22 addObject:v42];
                            }
                          }
                          uint64_t v39 = [v31 countByEnumeratingWithState:&v94 objects:v115 count:16];
                        }
                        while (v39);
                        uint64_t v28 = v84;
                        uint64_t v27 = v88;
                      }
                    }
                    else
                    {
                    }
LABEL_41:
                    ++v29;
                  }
                  while (v29 != v27);
                  uint64_t v27 = [v25 countByEnumeratingWithState:&v98 objects:v116 count:16];
                }
                while (v27);
              }

              long long v23 = v82 + 1;
            }
            while (v82 + 1 != (char *)v80);
            uint64_t v80 = [v76 countByEnumeratingWithState:&v102 objects:v117 count:16];
          }
          while (v80);
        }

        if ([v22 count])
        {
          long long v43 = (void *)MEMORY[0x230FBD990]();
          uint64_t v89 = v70;
          __int16 v44 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            uint64_t v45 = HMFGetLogIdentifier();
            long long v46 = [v79 home];
            uint64_t v47 = [v46 name];
            long long v48 = [v79 name];
            *(_DWORD *)buf = 138543874;
            long long v120 = v45;
            __int16 v121 = 2112;
            long long v122 = v47;
            __int16 v123 = 2112;
            long long v124 = v48;
            _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_INFO, "%{public}@Monitoring accessory: '%@:%@'", buf, 0x20u);
          }
          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          id v83 = v22;
          uint64_t v49 = [v83 countByEnumeratingWithState:&v90 objects:v114 count:16];
          if (v49)
          {
            uint64_t v50 = v49;
            uint64_t v51 = *(void *)v91;
            uint64_t v78 = *(void *)v91;
            do
            {
              uint64_t v52 = 0;
              uint64_t v81 = v50;
              do
              {
                if (*(void *)v91 != v51) {
                  objc_enumerationMutation(v83);
                }
                long long v53 = *(void **)(*((void *)&v90 + 1) + 8 * v52);
                long long v54 = (void *)MEMORY[0x230FBD990]();
                long long v55 = v89;
                long long v56 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                {
                  long long v57 = HMFGetLogIdentifier();
                  __int16 v85 = [v53 service];
                  [v85 type];
                  long long v58 = v87 = v54;
                  long long v59 = HAPShortUUIDType();
                  __int16 v60 = [v53 characteristicType];
                  id v61 = HAPShortUUIDType();
                  uint64_t v62 = [v53 characteristicTypeDescription];
                  *(_DWORD *)buf = 138544130;
                  long long v120 = v57;
                  __int16 v121 = 2112;
                  long long v122 = v59;
                  __int16 v123 = 2112;
                  long long v124 = v61;
                  __int16 v125 = 2112;
                  __int16 v126 = v62;
                  _os_log_impl(&dword_22F52A000, v56, OS_LOG_TYPE_INFO, "%{public}@+ monitoring service: '%@', characteristic: '[%@] (%@)'", buf, 0x2Au);

                  uint64_t v50 = v81;
                  long long v54 = v87;

                  uint64_t v51 = v78;
                }

                ++v52;
              }
              while (v50 != v52);
              uint64_t v50 = [v83 countByEnumeratingWithState:&v90 objects:v114 count:16];
            }
            while (v50);
          }

          uint64_t v63 = [v83 allObjects];
          uint64_t v64 = [(HMDWidgetTimelineRefresher *)v89 clientIdentifier];
          [v79 setNotificationsEnabled:1 forCharacteristics:v63 clientIdentifier:v64];
        }
        [v72 unionSet:v22];

        uint64_t v21 = v75 + 1;
      }
      while (v75 + 1 != v73);
      uint64_t v73 = [v69 countByEnumeratingWithState:&v106 objects:v118 count:16];
    }
    while (v73);
  }

  uint64_t v65 = (void *)[v72 copy];
  return v65;
}

- (id)internalMonitorCharacteristicsForCurrentHome:(id)a3 activeWidgetKinds:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  if (v6)
  {
    if (self && [v6 hasAnyResident])
    {
      uint64_t v9 = (void *)MEMORY[0x230FBD990]();
      uint64_t v10 = self;
      uint64_t v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        uint64_t v13 = [v6 shortDescription];
        *(_DWORD *)buf = 138543618;
        uint64_t v39 = v12;
        __int16 v40 = 2112;
        long long v41 = v13;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating monitored characteristics for current home: %@", buf, 0x16u);
      }
      uint64_t v14 = [(id)objc_opt_class() fetchSpecificationsForWidgetKinds:v7];
      int v15 = [(HMDWidgetTimelineRefresher *)v10 monitorCharacteristicsForHome:v6 fetchSpecifications:v14];
      [v8 unionSet:v15];
    }
    else
    {
      dispatch_time_t v16 = (void *)MEMORY[0x230FBD990]();
      __int16 v17 = self;
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = HMFGetLogIdentifier();
        uint64_t v20 = [v6 shortDescription];
        *(_DWORD *)buf = 138543618;
        uint64_t v39 = v19;
        __int16 v40 = 2112;
        long long v41 = v20;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Not updating monitored characteristics for current home: %@ because there is no resident", buf, 0x16u);
      }
    }
  }
  if ([v7 containsObject:@"com.apple.Home.widget.security.singleAccessory"])
  {
    id v32 = v7;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v21 = [(HMDWidgetTimelineRefresher *)self homeManager];
    uint64_t v22 = [v21 homes];

    uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          char v28 = HMFEqualObjects();
          if (self && (v28 & 1) == 0 && [v27 hasAnyResident])
          {
            uint64_t v29 = +[HMDWidgetFetchSpecification allOtherHomesSingleAccessorySecurityFetchSpecifications];
            uint64_t v30 = [(HMDWidgetTimelineRefresher *)self monitorCharacteristicsForHome:v27 fetchSpecifications:v29];

            [v8 unionSet:v30];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v24);
    }

    id v7 = v32;
  }

  return v8;
}

- (void)registerForDarwinNotifications
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  id v3 = [(HMDWidgetTimelineRefresher *)self darwinNotificationProvider];
  id v4 = [(HMDWidgetTimelineRefresher *)self workQueue];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __60__HMDWidgetTimelineRefresher_registerForDarwinNotifications__block_invoke;
  v19[3] = &unk_264A28768;
  objc_copyWeak(&v20, &location);
  int v5 = [v3 notifyRegisterDispatch:"com.apple.Home.homeSensingChanged" outToken:&self->_homeSensingChangedNotificationToken queue:v4 handler:v19];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    HMFGetOSLogHandle();
    uint64_t v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v9;
      __int16 v24 = 2080;
      uint64_t v25 = "com.apple.Home.homeSensingChanged";
      __int16 v26 = 1024;
      int v27 = v5;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to register notification for %s with error: %d", buf, 0x1Cu);
    }
  }
  uint64_t v10 = [(HMDWidgetTimelineRefresher *)self darwinNotificationProvider];
  uint64_t v11 = [(HMDWidgetTimelineRefresher *)self workQueue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __60__HMDWidgetTimelineRefresher_registerForDarwinNotifications__block_invoke_180;
  v17[3] = &unk_264A28768;
  objc_copyWeak(&v18, &location);
  int v12 = [v10 notifyRegisterDispatch:"com.apple.Home.selectedHomeChanged" outToken:&self->_selectedHomeChangedNotificationToken queue:v11 handler:v17];

  if (v12)
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    uint64_t v14 = self;
    HMFGetOSLogHandle();
    int v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      dispatch_time_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v16;
      __int16 v24 = 2080;
      uint64_t v25 = "com.apple.Home.selectedHomeChanged";
      __int16 v26 = 1024;
      int v27 = v12;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to register notification for %s with error: %d", buf, 0x1Cu);
    }
  }
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __60__HMDWidgetTimelineRefresher_registerForDarwinNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleHomeSensingChangedNotification];
}

void __60__HMDWidgetTimelineRefresher_registerForDarwinNotifications__block_invoke_180(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleSelectedHomeChangedNotification];
}

- (void)registerForMessagesWithMessageDispatcher:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v7[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];

  [v4 registerForMessage:*MEMORY[0x263F0DE40] receiver:self policies:v6 selector:sel_handleMonitorCharacteristicsForWidget_];
  [v4 registerForMessage:*MEMORY[0x263F0DE28] receiver:self policies:v6 selector:sel_handleFetchState_];
  [v4 registerForMessage:*MEMORY[0x263F0DE50] receiver:self policies:v6 selector:sel_handlePerformRequests_];
  [v4 registerForMessage:*MEMORY[0x263F0DE38] receiver:self policies:v6 selector:sel_handleMonitorActionSetsForWidget_];
  [v4 registerForMessage:*MEMORY[0x263F0DE30] receiver:self policies:v6 selector:sel_handleFetchStateForActionSets_];
  [v4 registerForMessage:*MEMORY[0x263F0DE48] receiver:self policies:v6 selector:sel_handleMonitorMTRAttributes_];
}

- (void)configure
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  long long v36 = [(HMDWidgetTimelineRefresher *)self homeManager];
  if (v36)
  {
    id v3 = [(HMDWidgetTimelineRefresher *)self notificationCenter];
    [v3 addObserver:self selector:sel_processCharacteristicsChangedNotification_ name:@"HMDAccessoryCharacteristicsChangedNotification" object:0];

    id v4 = [(HMDWidgetTimelineRefresher *)self notificationCenter];
    [v4 addObserver:self selector:sel_handleCurrentOrPrimaryHomeChangedNotification_ name:@"HMDNotificationCurrentHomeDidChange" object:v36];

    int v5 = [(HMDWidgetTimelineRefresher *)self notificationCenter];
    [v5 addObserver:self selector:sel_handleCurrentOrPrimaryHomeChangedNotification_ name:@"HMDNotificationPrimaryHomeDidChange" object:v36];

    id v6 = [(HMDWidgetTimelineRefresher *)self notificationCenter];
    [v6 addObserver:self selector:sel_handleHomeAddedNotification_ name:@"HMDHomeAddedNotification" object:v36];

    id v7 = [(HMDWidgetTimelineRefresher *)self notificationCenter];
    [v7 addObserver:self selector:sel_handleHomeRemovedNotification_ name:@"HMDHomeRemovedNotification" object:v36];

    uint64_t v8 = [(HMDWidgetTimelineRefresher *)self notificationCenter];
    [v8 addObserver:self selector:sel_handleAccessoryAddedNotification_ name:@"HMDNotificationHomeAddedAccessory" object:0];

    uint64_t v9 = [(HMDWidgetTimelineRefresher *)self notificationCenter];
    [v9 addObserver:self selector:sel_handleAccessoryRemovedNotification_ name:@"HMDHomeAccessoryRemovedNotification" object:0];

    uint64_t v10 = [(HMDWidgetTimelineRefresher *)self notificationCenter];
    [v10 addObserver:self selector:sel_handleResidentDeviceChangedNotification_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:0];

    uint64_t v11 = [(HMDWidgetTimelineRefresher *)self notificationCenter];
    [v11 addObserver:self selector:sel_handleResidentDeviceAddedOrRemovedNotification_ name:@"HMDResidentDeviceManagerAddResidentNotification" object:0];

    int v12 = [(HMDWidgetTimelineRefresher *)self notificationCenter];
    [v12 addObserver:self selector:sel_handleResidentDeviceAddedOrRemovedNotification_ name:@"HMDResidentDeviceManagerRemoveResidentNotification" object:0];

    uint64_t v13 = [(HMDWidgetTimelineRefresher *)self notificationCenter];
    [v13 addObserver:self selector:sel_handleAccessoryReachabilityChangedNotification_ name:@"HMDAccessoryIsRemotelyReachableNotification" object:0];

    uint64_t v14 = [(HMDWidgetTimelineRefresher *)self notificationCenter];
    [v14 addObserver:self selector:sel_handleAccessoryReachabilityChangedNotification_ name:@"HMDAccessoryIsNotRemotelyReachableNotification" object:0];

    int v15 = [(HMDWidgetTimelineRefresher *)self notificationCenter];
    [v15 addObserver:self selector:sel_handleAccessoryRemoteReachabilityChangedNotification_ name:@"HMDAccessoryIsRemotelyReachableNotification" object:0];

    dispatch_time_t v16 = [(HMDWidgetTimelineRefresher *)self notificationCenter];
    [v16 addObserver:self selector:sel_handleAccessoryRemoteReachabilityChangedNotification_ name:@"HMDAccessoryIsNotRemotelyReachableNotification" object:0];

    __int16 v17 = [(HMDWidgetTimelineRefresher *)self notificationCenter];
    [v17 addObserver:self selector:sel_handleNotifiedXPCClientsOfHomeConfigurationChangeNotification_ name:@"HMDHomeManagerNotifiedXPCClientsOfHomeConfigurationChangeNotification" object:0];

    id v18 = [(HMDWidgetTimelineRefresher *)self notificationCenter];
    [v18 addObserver:self selector:sel_handleRestrictedGuestScheduleStartedNotification_ name:@"HMDUserRestrictedGuestScheduleStartedNotification" object:0];

    uint64_t v19 = [(HMDWidgetTimelineRefresher *)self notificationCenter];
    [v19 addObserver:self selector:sel_handleRestrictedGuestScheduleEndedNotification_ name:@"HMDUserRestrictedGuestScheduleEndedNotification" object:0];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v20 = +[HMDWidgetFetchSpecification allHomeLockScreenWidgetKinds];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v41 != v22) {
            objc_enumerationMutation(v20);
          }
          uint64_t v24 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          uint64_t v25 = [MEMORY[0x263F087C8] defaultCenter];
          [v25 addObserver:self selector:sel_handleNotificationOfPossibleNewWidget_ name:v24 object:0 suspensionBehavior:4];
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v21);
    }

    __int16 v26 = [v36 messageDispatcher];
    [(HMDWidgetTimelineRefresher *)self registerForMessagesWithMessageDispatcher:v26];

    [(HMDWidgetTimelineRefresher *)self registerForDarwinNotifications];
    int v27 = [(HMDWidgetTimelineRefresher *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__HMDWidgetTimelineRefresher_configure__block_invoke;
    block[3] = &unk_264A2F7F8;
    void block[4] = self;
    dispatch_async(v27, block);

    uint64_t v28 = [(HMDWidgetTimelineRefresher *)self widgetRefreshDispatchTimer];
    dispatch_time_t v29 = dispatch_walltime(0, 0);
    dispatch_source_set_timer(v28, v29, 0x68C61714000uLL, 0x8BB2C97000uLL);

    objc_initWeak((id *)location, self);
    uint64_t v30 = [(HMDWidgetTimelineRefresher *)self widgetRefreshDispatchTimer];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __39__HMDWidgetTimelineRefresher_configure__block_invoke_2;
    handler[3] = &unk_264A2C170;
    objc_copyWeak(&v38, (id *)location);
    dispatch_source_set_event_handler(v30, handler);

    id v31 = [(HMDWidgetTimelineRefresher *)self widgetRefreshDispatchTimer];
    dispatch_activate(v31);

    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v32 = (void *)MEMORY[0x230FBD990]();
    long long v33 = self;
    long long v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      long long v35 = HMFGetLogIdentifier();
      *(_DWORD *)locatiouint64_t n = 138543618;
      *(void *)&location[4] = v35;
      __int16 v46 = 2080;
      uint64_t v47 = "-[HMDWidgetTimelineRefresher configure]";
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@Home manager reference is nil during %s, no widgets configured.", location, 0x16u);
    }
  }
}

void __39__HMDWidgetTimelineRefresher_configure__block_invoke(uint64_t a1)
{
}

void __39__HMDWidgetTimelineRefresher_configure__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained fetchAndStoreActiveWidgetKindsHandler];
  v1[2]();

  -[HMDWidgetTimelineRefresher updateMonitoredCharacteristicsAndRefreshWidgetTimelines](WeakRetained);
}

- (void)dealloc
{
  if (self->_homeSensingChangedNotificationToken != -1)
  {
    id v3 = [(HMDWidgetTimelineRefresher *)self darwinNotificationProvider];
    [v3 notifyCancel:self->_homeSensingChangedNotificationToken];
  }
  if (self->_selectedHomeChangedNotificationToken != -1)
  {
    id v4 = [(HMDWidgetTimelineRefresher *)self darwinNotificationProvider];
    [v4 notifyCancel:self->_selectedHomeChangedNotificationToken];
  }
  v5.receiver = self;
  v5.super_class = (Class)HMDWidgetTimelineRefresher;
  [(HMDWidgetTimelineRefresher *)&v5 dealloc];
}

- (HMDWidgetTimelineRefresher)initWithHomeManager:(id)a3 queue:(id)a4 notificationCenter:(id)a5 darwinNotificationProvider:(id)a6 widgetConfigurationReader:(id)a7 timelineController:(id)a8 logEventSubmitter:(id)a9 timerManager:(id)a10 reachabilityUpdateDispatchDelayNs:(int64_t)a11 forceUpdateTimelineDispatchDelayNs:(int64_t)a12
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  id v18 = a3;
  id v19 = a4;
  id v88 = a5;
  id v87 = a6;
  id v86 = a7;
  id v85 = a8;
  id v84 = a9;
  id v83 = a10;
  v93.receiver = self;
  v93.super_class = (Class)HMDWidgetTimelineRefresher;
  id v20 = [(HMDWidgetTimelineRefresher *)&v93 init];
  uint64_t v21 = v20;
  if (v20)
  {
    id v82 = v19;
    objc_storeWeak((id *)&v20->_homeManager, v18);
    objc_storeStrong((id *)&v21->_workQueue, a4);
    uint64_t v22 = [MEMORY[0x263EFFA08] set];
    widgetKindsToUpdate = v21->_widgetKindsToUpdate;
    v21->_widgetKindsToUpdate = (NSSet *)v22;

    uint64_t v24 = objc_opt_new();
    accessoryIsReachableByUUID = v21->_accessoryIsReachableByUUID;
    v21->_accessoryIsReachableByUUID = (NSMutableDictionary *)v24;

    objc_storeStrong((id *)&v21->_notificationCenter, a5);
    objc_storeStrong((id *)&v21->_darwinNotificationProvider, a6);
    objc_storeStrong((id *)&v21->_widgetConfigurationReader, a7);
    objc_storeStrong((id *)&v21->_timelineController, a8);
    objc_storeStrong((id *)&v21->_logEventSubmitter, a9);
    objc_storeStrong((id *)&v21->_timerManager, a10);
    [(HMFTimerManager *)v21->_timerManager setDelegate:v21];
    [(HMFTimerManager *)v21->_timerManager setDelegateQueue:v21->_workQueue];
    __int16 v26 = @"com.apple.HomeKitDaemon";
    uint64_t v27 = [NSString stringWithFormat:@"%@.HMDWidgetTimelineRefresher.Autobahn", @"com.apple.HomeKitDaemon"];
    clientIdentifier = v21->_clientIdentifier;
    v21->_clientIdentifier = (NSString *)v27;

    uint64_t v29 = [MEMORY[0x263EFFA08] set];
    monitoredCharacteristics = v21->_monitoredCharacteristics;
    v21->_monitoredCharacteristics = (NSSet *)v29;

    uint64_t v31 = [NSString stringWithFormat:@"%@.HMDWidgetTimelineRefresher", @"com.apple.HomeKitDaemon"];
    clientIdentifierForExplicitlyMonitoredCharacteristics = v21->_clientIdentifierForExplicitlyMonitoredCharacteristics;
    v21->_clientIdentifierForExplicitlyMonitoredCharacteristics = (NSString *)v31;

    uint64_t v33 = [MEMORY[0x263EFF9A0] dictionary];
    monitoredCharacteristicsMapByWidget = v21->_monitoredCharacteristicsMapByWidget;
    v21->_monitoredCharacteristicsMapByWidget = (NSMutableDictionary *)v33;

    uint64_t v35 = [MEMORY[0x263EFF9A0] dictionary];
    monitoredActionSetsMapByWidget = v21->_monitoredActionSetsMapByWidget;
    v21->_monitoredActionSetsMapByWidget = (NSMutableDictionary *)v35;

    uint64_t v37 = [MEMORY[0x263EFF9A0] dictionary];
    monitoredMTRAttributesByWidget = v21->_monitoredMTRAttributesByWidget;
    v21->_monitoredMTRAttributesByWidget = (NSMutableDictionary *)v37;

    uint64_t v39 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    deviceControllersByID = v21->_deviceControllersByID;
    v21->_deviceControllersByID = (NSMapTable *)v39;

    uint64_t v41 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    devicesByController = v21->_devicesByController;
    v21->_devicesByController = (NSMapTable *)v41;

    uint64_t v43 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    cachedValueByCharacteristic = v21->_cachedValueByCharacteristic;
    v21->_cachedValueByCharacteristic = (NSMapTable *)v43;

    uint64_t v45 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    cachedIsOnStateByActionSet = v21->_cachedIsOnStateByActionSet;
    v21->_cachedIsOnStateByActionSet = (NSMapTable *)v45;

    uint64_t v47 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    pendingRequestValueByUUID = v21->_pendingRequestValueByUUID;
    v21->_pendingRequestValueByUUID = (NSMapTable *)v47;

    uint64_t v49 = [MEMORY[0x263EFF9A0] dictionary];
    cachedActionSetExecuteErrorByUUID = v21->_cachedActionSetExecuteErrorByUUID;
    v21->_cachedActionSetExecuteErrorByUUID = (NSMutableDictionary *)v49;

    uint64_t v51 = [MEMORY[0x263EFF9A0] dictionary];
    cachedActionSetExecuteErrorTimerContextByUUID = v21->_cachedActionSetExecuteErrorTimerContextByUUID;
    v21->_cachedActionSetExecuteErrorTimerContextByUUID = (NSMutableDictionary *)v51;

    uint64_t v53 = [MEMORY[0x263EFFA08] set];
    activeWidgetKinds = v21->_activeWidgetKinds;
    v21->_activeWidgetKinds = (NSSet *)v53;

    uint64_t v55 = [MEMORY[0x263EFF9A0] dictionary];
    characteristicsToPreviouslySeenValues = v21->_characteristicsToPreviouslySeenValues;
    v21->_characteristicsToPreviouslySeenValues = (NSMutableDictionary *)v55;

    dispatch_source_t v57 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)v21->_workQueue);
    widgetRefreshDispatchTimer = v21->_widgetRefreshDispatchTimer;
    v21->_widgetRefreshDispatchTimer = (OS_dispatch_source *)v57;

    v21->_homeSensingChangedNotificationTokeuint64_t n = -1;
    v21->_selectedHomeChangedNotificationTokeuint64_t n = -1;
    v21->_reachabilityUpdateDispatchDelayNs = a11;
    v21->_forceUpdateTimelineDispatchDelayNs = a12;
    uint64_t v59 = [MEMORY[0x263EFFA08] set];
    widgetRefreshCoalesceKinds = v21->_widgetRefreshCoalesceKinds;
    v21->_widgetRefreshCoalesceKinds = (NSSet *)v59;

    uint64_t v61 = [MEMORY[0x263EFF9C0] set];
    actionSetsPendingPrimaryResidentStateUpdates = v21->_actionSetsPendingPrimaryResidentStateUpdates;
    v21->_actionSetsPendingPrimaryResidentStateUpdates = (NSMutableSet *)v61;

    uint64_t v63 = [v18 currentHomeUUID];
    uint64_t v64 = (void *)v63;
    if (v63)
    {
      int v65 = 0;
      BOOL v66 = (void *)v63;
    }
    else
    {
      uint64_t v67 = [v18 primaryHomeUUID];
      __int16 v26 = (__CFString *)v67;
      if (v67)
      {
        int v65 = 0;
        BOOL v66 = (void *)v67;
      }
      else
      {
        BOOL v66 = [MEMORY[0x263F08C38] UUID];
        int v65 = 1;
      }
    }
    objc_storeStrong((id *)&v21->_currentHomeUUID, v66);
    if (v65) {

    }
    if (!v64) {
    id v68 = (void *)MEMORY[0x230FBD990]();
    }
    id v69 = v21;
    uint64_t v70 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
    {
      uint64_t v71 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      unsigned int v72 = [v18 primaryHomeUUID];

      if (v72)
      {
        uint64_t v73 = [v18 primaryHomeUUID];
        [v73 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v95 = *(_OWORD *)buf;
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      id v74 = [v18 currentHomeUUID];

      if (v74)
      {
        uint64_t v75 = [v18 currentHomeUUID];
        [v75 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v94 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v71;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      __int16 v97 = 2096;
      long long v98 = &v95;
      __int16 v99 = 1040;
      int v100 = 16;
      __int16 v101 = 2096;
      long long v102 = &v94;
      _os_log_impl(&dword_22F52A000, v70, OS_LOG_TYPE_INFO, "%{public}@primary home is %{uuid_t}.16P, current home is %{uuid_t}.16P", buf, 0x2Cu);
    }
    objc_initWeak((id *)buf, v69);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __247__HMDWidgetTimelineRefresher_initWithHomeManager_queue_notificationCenter_darwinNotificationProvider_widgetConfigurationReader_timelineController_logEventSubmitter_timerManager_reachabilityUpdateDispatchDelayNs_forceUpdateTimelineDispatchDelayNs___block_invoke;
    aBlock[3] = &unk_264A1B3B0;
    objc_copyWeak(&v92, (id *)buf);
    id v76 = _Block_copy(aBlock);
    id forceUpdateAutobahnTimelineHandler = v69->_forceUpdateAutobahnTimelineHandler;
    v69->_id forceUpdateAutobahnTimelineHandler = v76;

    v89[0] = MEMORY[0x263EF8330];
    v89[1] = 3221225472;
    v89[2] = __247__HMDWidgetTimelineRefresher_initWithHomeManager_queue_notificationCenter_darwinNotificationProvider_widgetConfigurationReader_timelineController_logEventSubmitter_timerManager_reachabilityUpdateDispatchDelayNs_forceUpdateTimelineDispatchDelayNs___block_invoke_2;
    v89[3] = &unk_264A2C170;
    objc_copyWeak(&v90, (id *)buf);
    uint64_t v78 = _Block_copy(v89);
    id fetchAndStoreActiveWidgetKindsHandler = v69->_fetchAndStoreActiveWidgetKindsHandler;
    v69->_id fetchAndStoreActiveWidgetKindsHandler = v78;

    uint64_t v80 = v69;
    objc_destroyWeak(&v90);
    objc_destroyWeak(&v92);
    objc_destroyWeak((id *)buf);
    id v19 = v82;
  }

  return v21;
}

void __247__HMDWidgetTimelineRefresher_initWithHomeManager_queue_notificationCenter_darwinNotificationProvider_widgetConfigurationReader_timelineController_logEventSubmitter_timerManager_reachabilityUpdateDispatchDelayNs_forceUpdateTimelineDispatchDelayNs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained forceUpdateTimelineForWidgetKinds:v3];
}

void __247__HMDWidgetTimelineRefresher_initWithHomeManager_queue_notificationCenter_darwinNotificationProvider_widgetConfigurationReader_timelineController_logEventSubmitter_timerManager_reachabilityUpdateDispatchDelayNs_forceUpdateTimelineDispatchDelayNs___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained fetchAndStoreActiveWidgetKinds];
}

- (HMDWidgetTimelineRefresher)initWithHomeManager:(id)a3
{
  id v4 = a3;
  HMDispatchQueueNameString();
  id v16 = objc_claimAutoreleasedReturnValue();
  objc_super v5 = (const char *)[v16 UTF8String];
  id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v7 = dispatch_queue_create(v5, v6);
  uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
  id v9 = objc_alloc_init(MEMORY[0x263F0E2C0]);
  uint64_t v10 = objc_alloc_init(HMDWidgetConfigurationReader);
  uint64_t v11 = objc_alloc_init(HMDWidgetTimelineController);
  int v12 = +[HMDMetricsManager sharedLogEventSubmitter];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F42660]) initWithOptions:0];
  uint64_t v14 = [(HMDWidgetTimelineRefresher *)self initWithHomeManager:v4 queue:v7 notificationCenter:v8 darwinNotificationProvider:v9 widgetConfigurationReader:v10 timelineController:v11 logEventSubmitter:v12 timerManager:v13 reachabilityUpdateDispatchDelayNs:1000000000 forceUpdateTimelineDispatchDelayNs:333333333];

  return v14;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t151 != -1) {
    dispatch_once(&logCategory__hmf_once_t151, &__block_literal_global_340_58531);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v152;
  return v2;
}

void __41__HMDWidgetTimelineRefresher_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v152;
  logCategory__hmf_once_id v152 = v0;
}

+ (id)fetchSpecificationsForWidgetKinds:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  if ([v3 containsObject:@"com.apple.Home.widget.summary.category"])
  {
    objc_super v5 = +[HMDWidgetFetchSpecification lightsFetchSpecifications];
    [v4 unionSet:v5];

    id v6 = +[HMDWidgetFetchSpecification mainHomeSecurityFetchSpecifications];
    [v4 unionSet:v6];
  }
  if ([v3 containsObject:@"com.apple.Home.widget.lights.category"])
  {
    dispatch_queue_t v7 = +[HMDWidgetFetchSpecification lightsFetchSpecifications];
    [v4 unionSet:v7];
  }
  if ([v3 containsObject:@"com.apple.Home.widget.security.category"])
  {
    uint64_t v8 = +[HMDWidgetFetchSpecification mainHomeSecurityFetchSpecifications];
    [v4 unionSet:v8];
  }
  if ([v3 containsObject:@"com.apple.Home.widget.security.singleAccessory"])
  {
    id v9 = +[HMDWidgetFetchSpecification allOtherHomesSingleAccessorySecurityFetchSpecifications];
    [v4 unionSet:v9];
  }
  uint64_t v10 = (void *)[v4 copy];

  return v10;
}

@end