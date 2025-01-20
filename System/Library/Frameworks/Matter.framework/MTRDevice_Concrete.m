@interface MTRDevice_Concrete
+ (id)deviceWithNodeID:(unint64_t)a3 deviceController:(id)a4;
- (BOOL)_attributeAffectsDeviceConfiguration:(id)a3;
- (BOOL)_attributeDataValue:(id)a3 isEqualToDataValue:(id)a4;
- (BOOL)_attributePathAffectsDescriptionData:(id)a3;
- (BOOL)_dataStoreExists;
- (BOOL)_deviceHasActiveSubscription;
- (BOOL)_deviceIsReportingExcessively;
- (BOOL)_deviceUsesThread;
- (BOOL)_interestedPaths:(id)a3 includesAttributePath:(id)a4;
- (BOOL)_interestedPaths:(id)a3 includesEventPath:(id)a4;
- (BOOL)_subscriptionAbleToReport;
- (BOOL)_subscriptionsAllowed;
- (BOOL)deviceCachePrimed;
- (BOOL)deviceUsesThread;
- (BOOL)expirationCheckScheduled;
- (BOOL)reattemptingSubscription;
- (BOOL)receivingPrimingReport;
- (BOOL)receivingReport;
- (BOOL)suspended;
- (BOOL)timeUpdateScheduled;
- (MTRAsyncWorkQueue)asyncWorkQueue;
- (MTRDevice_Concrete)initWithNodeID:(id)a3 controller:(id)a4;
- (NSDate)estimatedStartTime;
- (NSDate)estimatedStartTimeFromGeneralDiagnosticsUpTime;
- (NSMutableArray)unreportedEvents;
- (NSMutableDictionary)expectedValueCache;
- (NSNumber)estimatedSubscriptionLatency;
- (double)_reportToPersistenceDelayTimeAfterMutiplier;
- (double)_reportToPersistenceDelayTimeMaxAfterMutiplier;
- (id)_attributeListForEndpointID:(id)a3 clusterID:(id)a4;
- (id)_attributeValueDictionaryForAttributePath:(id)a3;
- (id)_cachedAttributeValueForPath:(id)a3;
- (id)_cachedListOfNumbersValueForEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5;
- (id)_clusterDataForPath:(id)a3;
- (id)_clusterDataToPersistSnapshot;
- (id)_concreteController;
- (id)_dataValueWithoutDataVersion:(id)a3;
- (id)_endpointList;
- (id)_endpointsWithTimeSyncClusterServer;
- (id)_filteredAttributes:(id)a3 forInterestedPaths:(id)a4;
- (id)_filteredEvents:(id)a3 forInterestedPaths:(id)a4;
- (id)_getAttributesToReportWithNewExpectedValues:(id)a3 expirationTime:(id)a4 expectedValueID:(unint64_t *)a5;
- (id)_getAttributesToReportWithReportedValues:(id)a3 fromSubscription:(BOOL)a4;
- (id)_getCachedDataVersions;
- (id)_informationalNumberAtAttributePath:(id)a3;
- (id)_informationalProductID;
- (id)_informationalVendorID;
- (id)_internalProperties;
- (id)_knownClusters;
- (id)_lockedAttributeValueDictionaryForAttributePath:(id)a3;
- (id)_networkFeatures;
- (id)_serverListForEndpointID:(id)a3;
- (id)arrayOfNumbersFromAttributeValue:(id)a3;
- (id)description;
- (id)getAllAttributesReport;
- (id)newBaseDevice;
- (id)queue;
- (id)readAttributePaths:(id)a3;
- (id)readAttributeWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5 params:(id)a6;
- (os_unfair_lock_s)timeSyncLock;
- (unint64_t)expectedValueNextID;
- (unint64_t)internalDeviceState;
- (unint64_t)state;
- (unsigned)lastSubscriptionAttemptWait;
- (void)_addInformationalAttributesToCurrentMetricScope;
- (void)_callDelegateDeviceCachePrimed;
- (void)_changeInternalState:(unint64_t)a3;
- (void)_changeState:(unint64_t)a3;
- (void)_checkExpiredExpectedValues;
- (void)_clearSubscriptionPoolWork;
- (void)_createDataVersionFilterListFromDictionary:(id)a3 dataVersionFilterList:(DataVersionFilter *)a4 count:(unint64_t *)a5;
- (void)_delegateAdded;
- (void)_deviceMayBeReachable;
- (void)_doHandleSubscriptionError:(id)a3;
- (void)_doHandleSubscriptionReset:(id)a3;
- (void)_ensureSubscriptionForExistingDelegates:(id)a3;
- (void)_handleAttributeReport:(id)a3 fromSubscription:(BOOL)a4;
- (void)_handleEventReport:(id)a3;
- (void)_handleReportBegin;
- (void)_handleReportEnd;
- (void)_handleResubscriptionNeededWithDelay:(id)a3;
- (void)_handleResubscriptionNeededWithDelayOnDeviceQueue:(id)a3;
- (void)_handleSubscriptionError:(id)a3;
- (void)_handleSubscriptionEstablished;
- (void)_handleSubscriptionReset:(id)a3;
- (void)_handleUnsolicitedMessageFromPublisher;
- (void)_injectAttributeReport:(id)a3 fromSubscription:(BOOL)a4;
- (void)_injectEventReport:(id)a3;
- (void)_invokeCommandWithEndpointID:(id)a3 clusterID:(id)a4 commandID:(id)a5 commandFields:(id)a6 expectedValues:(id)a7 expectedValueInterval:(id)a8 timedInvokeTimeout:(id)a9 serverSideProcessingTimeout:(id)a10 queue:(id)a11 completion:(id)a12;
- (void)_markDeviceAsUnreachableIfNeverSubscribed;
- (void)_noteDataVersion:(id)a3 forClusterPath:(id)a4;
- (void)_notifyDelegateOfPrivateInternalPropertiesChanges;
- (void)_performScheduledExpirationCheck;
- (void)_performScheduledTimeUpdate;
- (void)_persistClusterData;
- (void)_persistClusterDataAsNeeded;
- (void)_pruneAttributesIn:(id)a3 missingFrom:(id)a4 forCluster:(id)a5;
- (void)_pruneClustersIn:(id)a3 missingFrom:(id)a4 forEndpoint:(id)a5;
- (void)_pruneEndpointsIn:(id)a3 missingFrom:(id)a4;
- (void)_pruneStoredDataForPath:(id)a3 missingFrom:(id)a4;
- (void)_readThroughSkipped;
- (void)_reattemptSubscriptionNowIfNeededWithReason:(id)a3;
- (void)_reconcilePersistedClustersWithStorage;
- (void)_removeAttributes:(id)a3 fromCluster:(id)a4;
- (void)_removeCachedAttribute:(id)a3 fromCluster:(id)a4;
- (void)_removeClusters:(id)a3 doRemoveFromDataStore:(BOOL)a4;
- (void)_removeExpectedValueForAttributePath:(id)a3 expectedValueID:(unint64_t)a4;
- (void)_reportAttributes:(id)a3;
- (void)_resetStorageBehaviorState;
- (void)_resetSubscriptionWithReasonString:(id)a3;
- (void)_scheduleClusterDataPersistence;
- (void)_scheduleNextUpdate:(unint64_t)a3;
- (void)_scheduleSubscriptionPoolWork:(id)a3 inNanoseconds:(int64_t)a4 description:(id)a5;
- (void)_setCachedAttributeValue:(id)a3 forPath:(id)a4 fromSubscription:(BOOL)a5;
- (void)_setDSTOffsets:(id)a3 forEndpoint:(id)a4;
- (void)_setExpectedValue:(id)a3 attributePath:(id)a4 expirationTime:(id)a5 shouldReportValue:(BOOL *)a6 attributeValueToReport:(id *)a7 expectedValueID:(unint64_t)a8 previousValue:(id *)a9;
- (void)_setLastInitialSubscribeLatency:(id)a3;
- (void)_setLastSubscriptionAttemptWait:(unsigned int)a3;
- (void)_setTimeOnDevice;
- (void)_setUTCTime:(unint64_t)a3 withGranularity:(unsigned __int8)a4 forEndpoint:(id)a5;
- (void)_setupSubscriptionWithReason:(id)a3;
- (void)_stopConnectivityMonitoring;
- (void)_storePersistedDeviceData;
- (void)_triggerResubscribeWithReason:(id)a3 nodeLikelyReachable:(BOOL)a4;
- (void)_updateAttributeDependentDescriptionData;
- (void)_updateDeviceTimeAndScheduleNextUpdate;
- (void)controllerResumed;
- (void)controllerSuspended;
- (void)currentReadClient;
- (void)currentSubscriptionCallback;
- (void)dealloc;
- (void)downloadLogOfType:(int64_t)a3 timeout:(double)a4 queue:(id)a5 completion:(id)a6;
- (void)invalidate;
- (void)nodeMayBeAdvertisingOperational;
- (void)openCommissioningWindowWithDiscriminator:(id)a3 duration:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)openCommissioningWindowWithSetupPasscode:(id)a3 discriminator:(id)a4 duration:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)removeExpectedValueForAttributePath:(id)a3 expectedValueID:(unint64_t)a4;
- (void)removeExpectedValuesForAttributePaths:(id)a3 expectedValueID:(unint64_t)a4;
- (void)setAsyncWorkQueue:(id)a3;
- (void)setCurrentReadClient:(void *)a3;
- (void)setCurrentSubscriptionCallback:(void *)a3;
- (void)setEstimatedStartTime:(id)a3;
- (void)setEstimatedStartTimeFromGeneralDiagnosticsUpTime:(id)a3;
- (void)setEstimatedSubscriptionLatency:(id)a3;
- (void)setExpectedValueCache:(id)a3;
- (void)setExpectedValueNextID:(unint64_t)a3;
- (void)setExpectedValues:(id)a3 expectedValueInterval:(id)a4 expectedValueID:(unint64_t *)a5;
- (void)setExpirationCheckScheduled:(BOOL)a3;
- (void)setInternalDeviceState:(unint64_t)a3;
- (void)setLastSubscriptionAttemptWait:(unsigned int)a3;
- (void)setPersistedClusterData:(id)a3;
- (void)setPersistedDeviceData:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReattemptingSubscription:(BOOL)a3;
- (void)setReceivingPrimingReport:(BOOL)a3;
- (void)setReceivingReport:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setStorageBehaviorConfiguration:(id)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setTimeUpdateScheduled:(BOOL)a3;
- (void)setUnreportedEvents:(id)a3;
- (void)writeAttributeWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5 value:(id)a6 expectedValueInterval:(id)a7 timedWriteTimeout:(id)a8;
@end

@implementation MTRDevice_Concrete

- (MTRDevice_Concrete)initWithNodeID:(id)a3 controller:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v50.receiver = self;
  v50.super_class = (Class)MTRDevice_Concrete;
  v8 = [(MTRDevice *)&v50 initForSubclassesWithNodeID:v6 controller:v7];
  v9 = v8;
  if (v8)
  {
    v8->_timeSyncLock._os_unfair_lock_opaque = 0;
    v8->_descriptionLock._os_unfair_lock_opaque = 0;
    uint64_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("org.csa-iot.matter.framework.device.workqueue", (dispatch_queue_attr_t)v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    uint64_t v15 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v13, v14);
    expectedValueCache = v9->_expectedValueCache;
    v9->_expectedValueCache = (NSMutableDictionary *)v15;

    v17 = [MTRAsyncWorkQueue alloc];
    uint64_t v19 = objc_msgSend_initWithContext_(v17, v18, (uint64_t)v9);
    asyncWorkQueue = v9->_asyncWorkQueue;
    v9->_asyncWorkQueue = (MTRAsyncWorkQueue *)v19;

    v9->_state = 0;
    v9->_internalDeviceState = 0;
    v9->_internalDeviceStateForDescription = 0;
    v23 = objc_msgSend_controllerDataStore(v7, v21, v22);
    LOBYTE(v10) = v23 == 0;

    if (v10)
    {
      persistedClusterData = v9->_persistedClusterData;
      v9->_persistedClusterData = 0;
    }
    else
    {
      v24 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
      persistedClusterData = v9->_persistedClusterData;
      v9->_persistedClusterData = v24;
    }

    clusterDataToPersist = v9->_clusterDataToPersist;
    v9->_clusterDataToPersist = 0;

    uint64_t v29 = objc_msgSend_set(MEMORY[0x263EFF9C0], v27, v28);
    persistedClusters = v9->_persistedClusters;
    v9->_persistedClusters = (NSMutableSet *)v29;

    if (v9->_persistedClusterData)
    {
      objc_initWeak((id *)location, v9);
      v35 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v33, v34);
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = sub_244C7F490;
      v48[3] = &unk_26519B268;
      objc_copyWeak(&v49, (id *)location);
      uint64_t v37 = objc_msgSend_addObserverForName_object_queue_usingBlock_(v35, v36, *MEMORY[0x263EFF5C8], 0, 0, v48);
      id systemTimeChangeObserverToken = v9->_systemTimeChangeObserverToken;
      v9->_id systemTimeChangeObserverToken = (id)v37;

      objc_destroyWeak(&v49);
      objc_destroyWeak((id *)location);
    }
    uint64_t isSuspended = objc_msgSend_isSuspended(v7, v31, v32);
    objc_msgSend_setSuspended_(v9, v40, isSuspended);
    v41 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      uint64_t v44 = objc_msgSend_unsignedLongLongValue(v9->super._nodeID, v42, v43);
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = v9;
      __int16 v52 = 2048;
      uint64_t v53 = v44;
      _os_log_impl(&dword_2446BD000, v41, OS_LOG_TYPE_INFO, "%@ init with hex nodeID 0x%016llX", location, 0x16u);
    }

    if (sub_244CC4E58(3u))
    {
      objc_msgSend_unsignedLongLongValue(v9->super._nodeID, v45, v46);
      sub_244CC4DE0(0, 3);
    }
  }

  return v9;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2);
  objc_msgSend_removeObserver_(v4, v5, (uint64_t)self->_systemTimeChangeObserverToken);

  id v6 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v10 = self;
    _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_DEFAULT, "MTRDevice dealloc: %p", buf, 0xCu);
  }

  if (sub_244CC4E58(2u))
  {
    id v7 = self;
    sub_244CC4DE0(0, 2);
  }
  v8.receiver = self;
  v8.super_class = (Class)MTRDevice_Concrete;
  [(MTRDevice *)&v8 dealloc];
}

- (id)description
{
  p_descriptionLock = &self->_descriptionLock;
  os_unfair_lock_lock(&self->_descriptionLock);
  v4 = self->_vid;
  v5 = self->_pid;
  id v6 = self->_allNetworkFeatures;
  unint64_t internalDeviceStateForDescription = self->_internalDeviceStateForDescription;
  uint64_t lastSubscriptionAttemptWaitForDescription = self->_lastSubscriptionAttemptWaitForDescription;
  v9 = self->_mostRecentReportTimeForDescription;
  uint64_t v10 = self->_lastSubscriptionFailureTimeForDescription;
  os_unfair_lock_unlock(p_descriptionLock);
  v13 = @"Unknown";
  if (v4) {
    uint64_t v14 = (__CFString *)v4;
  }
  else {
    uint64_t v14 = @"Unknown";
  }
  v58 = v9;
  v59 = v14;
  if (v5) {
    v13 = (__CFString *)v5;
  }
  v57 = v13;
  uint64_t v15 = @"NO";
  if (v6)
  {
    if (objc_msgSend_unsignedLongLongValue(v6, v11, v12)) {
      v16 = @"YES";
    }
    else {
      v16 = @"NO";
    }
    v56 = v16;
    if ((objc_msgSend_unsignedLongLongValue(v6, v17, v18) & 2) != 0) {
      uint64_t v19 = @"YES";
    }
    else {
      uint64_t v19 = @"NO";
    }
    uint64_t v15 = v19;
  }
  else
  {
    v56 = @"NO";
  }
  if (v9)
  {
    v20 = NSString;
    objc_msgSend_timeIntervalSinceNow(v9, v11, v12);
    objc_msgSend_stringWithFormat_(v20, v22, @" (%.0lfs ago)", -v21);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = &stru_26F969DC8;
  }
  uint64_t v53 = lastSubscriptionAttemptWaitForDescription;
  v55 = v23;
  if (v10)
  {
    v24 = NSString;
    objc_msgSend_timeIntervalSinceNow(v10, v11, v12);
    objc_msgSend_stringWithFormat_(v24, v26, @" (%.0lfs ago)", -v25);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = &stru_26F969DC8;
  }
  uint64_t v28 = NSString;
  uint64_t v29 = (objc_class *)objc_opt_class();
  NSStringFromClass(v29);
  uint64_t v54 = v51 = v28;
  __int16 v52 = objc_msgSend_compressedFabricID(self->super._deviceController, v30, v31);
  uint64_t v49 = objc_msgSend_unsignedLongLongValue(v52, v32, v33);
  uint64_t v50 = objc_msgSend_unsignedLongLongValue(self->super._nodeID, v34, v35);
  uint64_t v40 = objc_msgSend_unsignedLongLongValue(self->super._nodeID, v36, v37);
  if (internalDeviceStateForDescription > 4) {
    v41 = @"Unknown";
  }
  else {
    v41 = off_26519B640[internalDeviceStateForDescription];
  }
  uint64_t v42 = objc_msgSend_itemCount(self->_asyncWorkQueue, v38, v39);
  v45 = objc_msgSend_uniqueIdentifier(self->super._deviceController, v43, v44);
  objc_msgSend_stringWithFormat_(v51, v46, @"<%@: %p, node: %016llX-%016llX (%llu), VID: %@, PID: %@, WiFi: %@, Thread: %@, state: %@, last subscription attempt wait: %lus, queued work: %lu, last report: %@%@, last subscription failure: %@%@, controller: %@>", v54, self, v49, v50, v40, v59, v57, v56, v15, v41, v53, v42, v58, v55, v10, v27,
  v47 = v45);

  return v47;
}

- (id)_internalProperties
{
  objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2);
  v4 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_descriptionLock);
  v5 = self->_vid;
  if (v5) {
    CFDictionarySetValue(v4, @"MTRDeviceInternalStateKeyVendorID", v5);
  }

  id v6 = self->_pid;
  if (v6) {
    CFDictionarySetValue(v4, @"MTRDeviceInternalStateKeyProductID", v6);
  }

  id v7 = self->_allNetworkFeatures;
  if (v7) {
    CFDictionarySetValue(v4, @"MTRDeviceInternalPropertyNetworkFeatures", v7);
  }

  v9 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v8, self->_internalDeviceStateForDescription);
  if (v9) {
    CFDictionarySetValue(v4, @"MTRDeviceInternalPropertyDeviceState", v9);
  }

  uint64_t v11 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v10, self->_lastSubscriptionAttemptWaitForDescription);
  if (v11) {
    CFDictionarySetValue(v4, @"kMTRDeviceInternalPropertyLastSubscriptionAttemptWait", v11);
  }

  uint64_t v12 = self->_mostRecentReportTimeForDescription;
  if (v12) {
    CFDictionarySetValue(v4, @"MTRDeviceInternalPropertyMostRecentReportTime", v12);
  }

  v13 = self->_lastSubscriptionFailureTimeForDescription;
  if (v13) {
    CFDictionarySetValue(v4, @"MTRDeviceInternalPropertyLastSubscriptionFailureTime", v13);
  }

  os_unfair_lock_unlock(&self->_descriptionLock);

  return v4;
}

- (void)_notifyDelegateOfPrivateInternalPropertiesChanges
{
  os_unfair_lock_assert_owner(&self->super._lock);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_244C7FD20;
  v4[3] = &unk_265199E78;
  v4[4] = self;
  objc_msgSend__callDelegatesWithBlock_(self, v3, (uint64_t)v4);
}

- (void)_setTimeOnDevice
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend_date(MEMORY[0x263EFF910], a2, v2);
  __int16 v52 = v4;
  if (v4)
  {
    uint64_t v58 = 0;
    if (sub_244B2BE50(v4, (char *)&v58, v5))
    {
      objc_msgSend__endpointsWithTimeSyncClusterServer(self, v6, v7);
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v54, v61, 16);
      if (v9)
      {
        uint64_t v10 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v55 != v10) {
              objc_enumerationMutation(obj);
            }
            uint64_t v12 = *(void *)(*((void *)&v54 + 1) + 8 * i);
            v13 = sub_244CC8484(0, "NotSpecified");
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v63 = self;
              __int16 v64 = 2112;
              uint64_t v65 = v12;
              _os_log_impl(&dword_2446BD000, v13, OS_LOG_TYPE_INFO, "%@ Setting Time on Endpoint %@", buf, 0x16u);
            }

            if (sub_244CC4E58(3u))
            {
              uint64_t v50 = self;
              uint64_t v51 = v12;
              sub_244CC4DE0(0, 3);
            }
            objc_msgSend__setUTCTime_withGranularity_forEndpoint_(self, v14, v58, 4, v12, v50, v51);
            v16 = objc_msgSend_attributePathWithEndpointID_clusterID_attributeID_(MTRAttributePath, v15, v12, &unk_26F9CD600, &unk_26F9CD618);
            uint64_t v19 = objc_msgSend_endpoint(v16, v17, v18);
            uint64_t v22 = objc_msgSend_cluster(v16, v20, v21);
            double v25 = objc_msgSend_attribute(v16, v23, v24);
            v27 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(self, v26, (uint64_t)v19, v22, v25, 0);

            if (v27)
            {
              uint64_t v28 = [MTRAttributeReport alloc];
              v59[0] = @"attributePath";
              v59[1] = @"data";
              v60[0] = v16;
              v60[1] = v27;
              v30 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v29, (uint64_t)v60, v59, 2);
              uint64_t v32 = objc_msgSend_initWithResponseValue_error_(v28, v31, (uint64_t)v30, 0);

              if (v32)
              {
                uint64_t v35 = objc_msgSend_value(v32, v33, v34);
                unsigned int v38 = objc_msgSend_unsignedCharValue(v35, v36, v37);
                if (!v38)
                {
                  uint64_t v39 = sub_244CC8484(0, "NotSpecified");
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v63 = self;
                    __int16 v64 = 2112;
                    uint64_t v65 = v12;
                    _os_log_impl(&dword_2446BD000, v39, OS_LOG_TYPE_ERROR, "%@ DSTOffsetListMaxSize value on endpoint %@ is 0, which is not allowed. Defaulting to 1.", buf, 0x16u);
                  }

                  unsigned int v38 = 1;
                  if (sub_244CC4E58(1u))
                  {
                    uint64_t v50 = self;
                    uint64_t v51 = v12;
                    sub_244CC4DE0(0, 1);
                  }
                }
              }
              else
              {
                uint64_t v43 = sub_244CC8484(0, "NotSpecified");
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v63 = self;
                  __int16 v64 = 2112;
                  uint64_t v65 = v12;
                  _os_log_impl(&dword_2446BD000, v43, OS_LOG_TYPE_ERROR, "%@ DSTOffsetListMaxSize value on endpoint %@ is invalid. Defaulting to 1.", buf, 0x16u);
                }

                unsigned int v38 = 1;
                if (sub_244CC4E58(1u))
                {
                  uint64_t v50 = self;
                  uint64_t v51 = v12;
                  sub_244CC4DE0(0, 1);
                }
              }
              v45 = sub_244C9D794(v38, v40, v41);
              if (v45)
              {
                objc_msgSend__setDSTOffsets_forEndpoint_(self, v44, (uint64_t)v45, v12);
              }
              else
              {
                uint64_t v46 = sub_244CC8484(0, "NotSpecified");
                if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v63 = self;
                  __int16 v64 = 2112;
                  uint64_t v65 = v12;
                  _os_log_impl(&dword_2446BD000, v46, OS_LOG_TYPE_ERROR, "%@ Could not retrieve DST offset information. Unable to setDSTOffset on endpoint %@.", buf, 0x16u);
                }

                if (sub_244CC4E58(1u))
                {
                  uint64_t v50 = self;
                  uint64_t v51 = v12;
                  sub_244CC4DE0(0, 1);
                }
              }
            }
            else
            {
              uint64_t v42 = sub_244CC8484(0, "NotSpecified");
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v63 = self;
                __int16 v64 = 2112;
                uint64_t v65 = v12;
                _os_log_impl(&dword_2446BD000, v42, OS_LOG_TYPE_DEFAULT, "%@ Unable to SetDSTOffset on endpoint %@, since it does not support the TZ feature", buf, 0x16u);
              }

              if (sub_244CC4E58(2u))
              {
                uint64_t v50 = self;
                uint64_t v51 = v12;
                sub_244CC4DE0(0, 2);
              }
            }
          }
          uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v54, v61, 16);
        }
        while (v9);
      }
    }
    else
    {
      uint64_t v49 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v63 = self;
        __int16 v64 = 2112;
        uint64_t v65 = (uint64_t)v52;
        _os_log_impl(&dword_2446BD000, v49, OS_LOG_TYPE_ERROR, "%@ Could not convert NSDate (%@) to Matter Epoch Time. Unable to setUTCTime on endpoints.", buf, 0x16u);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
    }
  }
  else
  {
    v48 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v63 = self;
      _os_log_impl(&dword_2446BD000, v48, OS_LOG_TYPE_ERROR, "%@ Could not retrieve current date. Unable to setUTCTime on endpoints.", buf, 0xCu);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
  }
}

- (void)_scheduleNextUpdate:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  dispatch_time_t v5 = dispatch_time(0, 1000000000 * a3);
  objc_super v8 = objc_msgSend_queue(self, v6, v7);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244C8072C;
  block[3] = &unk_26519B290;
  block[4] = self;
  objc_copyWeak(&v12, &location);
  dispatch_after(v5, v8, block);

  objc_msgSend_setTimeUpdateScheduled_(self, v9, 1);
  uint64_t v10 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = self;
    __int16 v16 = 2048;
    unint64_t v17 = a3;
    _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_INFO, "%@ Timer Scheduled for next Device Time Update, in %llu seconds", buf, 0x16u);
  }

  if (sub_244CC4E58(3u)) {
    sub_244CC4DE0(0, 3);
  }
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_updateDeviceTimeAndScheduleNextUpdate
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(&self->_timeSyncLock);
  if (objc_msgSend_timeUpdateScheduled(self, v3, v4))
  {
    uint64_t v7 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = self;
      _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_INFO, "%@ Device Time Update already scheduled", buf, 0xCu);
    }

    if (sub_244CC4E58(3u)) {
      sub_244CC4DE0(0, 3);
    }
  }
  else
  {
    objc_msgSend__setTimeOnDevice(self, v5, v6);
    objc_msgSend__scheduleNextUpdate_(self, v8, 86400);
  }
}

- (void)_performScheduledTimeUpdate
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  p_timeSyncLock = &self->_timeSyncLock;
  os_unfair_lock_lock(&self->_timeSyncLock);
  if (objc_msgSend_state(self, v4, v5) == 1)
  {
    if (objc_msgSend_timeUpdateScheduled(self, v6, v7))
    {
      objc_msgSend_setTimeUpdateScheduled_(self, v8, 0);
      objc_msgSend__updateDeviceTimeAndScheduleNextUpdate(self, v9, v10);
      goto LABEL_12;
    }
    id v12 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = self;
      _os_log_impl(&dword_2446BD000, v12, OS_LOG_TYPE_INFO, "%@ Device Time Update is no longer scheduled, MTRDevice may have been invalidated.", buf, 0xCu);
    }

    if (sub_244CC4E58(3u)) {
LABEL_11:
    }
      sub_244CC4DE0(0, 3);
  }
  else
  {
    uint64_t v11 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = self;
      _os_log_impl(&dword_2446BD000, v11, OS_LOG_TYPE_INFO, "%@ Device is not reachable, canceling Device Time Updates.", buf, 0xCu);
    }

    if (sub_244CC4E58(3u)) {
      goto LABEL_11;
    }
  }
LABEL_12:
  os_unfair_lock_unlock(p_timeSyncLock);
}

- (id)_endpointsWithTimeSyncClusterServer
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  uint64_t v6 = objc_msgSend__endpointList(self, v4, v5);
  os_unfair_lock_unlock(p_lock);
  id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v6;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v23, v31, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v13 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(self, v8, v12, &unk_26F9CD630, &unk_26F9CD648, 0);
        uint64_t v15 = objc_msgSend_arrayOfNumbersFromAttributeValue_(self, v14, (uint64_t)v13);
        unint64_t v17 = v15;
        if (v15 && objc_msgSend_containsObject_(v15, v16, (uint64_t)&unk_26F9CD600)) {
          objc_msgSend_addObject_(v21, v18, v12);
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v23, v31, 16);
    }
    while (v9);
  }

  uint64_t v19 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v28 = self;
    __int16 v29 = 2112;
    id v30 = v21;
    _os_log_impl(&dword_2446BD000, v19, OS_LOG_TYPE_INFO, "%@ Device has following endpoints with Time Sync Cluster Server: %@", buf, 0x16u);
  }

  if (sub_244CC4E58(3u)) {
    sub_244CC4DE0(0, 3);
  }

  return v21;
}

- (void)_setUTCTime:(unint64_t)a3 withGranularity:(unsigned __int8)a4 forEndpoint:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a5;
  uint64_t v9 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v35 = self;
    __int16 v36 = 2048;
    unint64_t v37 = a3;
    __int16 v38 = 2112;
    id v39 = v8;
    _os_log_impl(&dword_2446BD000, v9, OS_LOG_TYPE_INFO, " %@ _setUTCTime with matterEpochTime: %llu, endpoint %@", buf, 0x20u);
  }

  if (sub_244CC4E58(3u)) {
    sub_244CC4DE0(0, 3);
  }
  uint64_t v10 = objc_alloc_init(MTRTimeSynchronizationClusterSetUTCTimeParams);
  uint64_t v12 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v11, a3);
  objc_msgSend_setUtcTime_(v10, v13, (uint64_t)v12);

  uint64_t v15 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v14, v5);
  objc_msgSend_setGranularity_(v10, v16, (uint64_t)v15);

  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  __int16 v29 = sub_244C8116C;
  id v30 = &unk_26519B2B8;
  uint64_t v31 = self;
  id v17 = v8;
  id v32 = v17;
  uint64_t v18 = v10;
  uint64_t v33 = v18;
  uint64_t v19 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v22 = objc_msgSend_serverSideProcessingTimeout(v18, v20, v21);
  long long v25 = objc_msgSend_queue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(self, v26, (uint64_t)v17, &unk_26F9CD600, &unk_26F9CD660, v18, 0, 0, 0, v22, 0, v25, v19, v27, v28, v29, v30, v31);
}

- (void)_setDSTOffsets:(id)a3 forEndpoint:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    __int16 v29 = self;
    __int16 v30 = 2112;
    id v31 = v6;
    __int16 v32 = 2112;
    id v33 = v7;
    _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_INFO, "%@ _setDSTOffsets with offsets: %@, endpoint %@", buf, 0x20u);
  }

  if (sub_244CC4E58(3u)) {
    sub_244CC4DE0(0, 3);
  }
  uint64_t v9 = objc_alloc_init(MTRTimeSynchronizationClusterSetDSTOffsetParams);
  objc_msgSend_setDstOffset_(v9, v10, (uint64_t)v6);
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  long long v23 = sub_244C8153C;
  uint64_t v24 = &unk_26519B2B8;
  long long v25 = self;
  id v11 = v7;
  id v26 = v11;
  uint64_t v12 = v9;
  uint64_t v27 = v12;
  v13 = (void *)MEMORY[0x2456969D0](&v21);
  __int16 v16 = objc_msgSend_serverSideProcessingTimeout(v12, v14, v15);
  uint64_t v19 = objc_msgSend_queue(self, v17, v18);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(self, v20, (uint64_t)v11, &unk_26F9CD600, &unk_26F9CD678, v12, 0, 0, 0, v16, 0, v19, v13, v21, v22, v23, v24, v25);
}

- (id)arrayOfNumbersFromAttributeValue:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v37 = a3;
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(v37, v3, @"type");
  char isEqual = objc_msgSend_isEqual_(@"Array", v5, (uint64_t)v4);

  if (isEqual)
  {
    id v8 = objc_msgSend_objectForKeyedSubscript_(v37, v7, @"value");
    uint64_t v34 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      uint64_t v10 = (void *)MEMORY[0x263EFF980];
      uint64_t v13 = objc_msgSend_count(v9, v11, v12);
      __int16 v36 = objc_msgSend_arrayWithCapacity_(v10, v14, v13);
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id obj = v9;
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v38, v42, 16);
      if (v16)
      {
        uint64_t v17 = *(void *)v39;
        id v33 = v9;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v39 != v17) {
              objc_enumerationMutation(obj);
            }
            uint64_t v19 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_19;
            }
            id v20 = v19;
            uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v20, v21, @"data", v33, v34);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_18;
            }
            id v23 = v22;
            long long v25 = objc_msgSend_objectForKeyedSubscript_(v23, v24, @"type");
            uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v23, v26, @"value");
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {

LABEL_18:
LABEL_19:

              id v31 = 0;
              __int16 v30 = v36;
              goto LABEL_20;
            }
            objc_msgSend_addObject_(v36, v28, (uint64_t)v27);
          }
          uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v38, v42, 16);
          if (v16) {
            continue;
          }
          break;
        }
      }

      __int16 v30 = v36;
      id v31 = v36;
LABEL_20:
    }
    else
    {
      id v31 = 0;
    }
  }
  else
  {
    id v31 = 0;
  }

  return v31;
}

- (BOOL)_subscriptionsAllowed
{
  os_unfair_lock_assert_owner(&self->super._lock);
  if (objc_msgSend_suspended(self, v3, v4))
  {
    char v5 = 0;
  }
  else
  {
    objc_opt_class();
    char v5 = objc_opt_isKindOfClass() ^ 1;
  }
  return v5 & 1;
}

- (void)_delegateAdded
{
  os_unfair_lock_assert_owner(&self->super._lock);
  v4.receiver = self;
  v4.super_class = (Class)MTRDevice_Concrete;
  [(MTRDevice *)&v4 _delegateAdded];
  objc_msgSend__ensureSubscriptionForExistingDelegates_(self, v3, @"delegate is set");
}

- (void)_ensureSubscriptionForExistingDelegates:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->super._lock);
  if (objc_msgSend__subscriptionsAllowed(self, v5, v6))
  {
    id v7 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = self;
      _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_DEFAULT, "%@ - starting subscription setup", buf, 0xCu);
    }

    if (sub_244CC4E58(2u))
    {
      uint64_t v16 = self;
      sub_244CC4DE0(0, 2);
    }
    if (!self->_initialSubscribeStart)
    {
      objc_msgSend_now(MEMORY[0x263EFF910], v8, v9);
      uint64_t v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
      initialSubscribeStart = self->_initialSubscribeStart;
      self->_initialSubscribeStart = v10;
    }
    if (objc_msgSend__deviceUsesThread(self, v8, v9, v16))
    {
      uint64_t v12 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = self;
        _os_log_impl(&dword_2446BD000, v12, OS_LOG_TYPE_DEFAULT, " => %@ - device is a thread device, scheduling in pool", buf, 0xCu);
      }

      if (sub_244CC4E58(2u)) {
        sub_244CC4DE0(0, 2);
      }
      objc_initWeak((id *)buf, self);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = sub_244C81E3C;
      v19[3] = &unk_26519B2E0;
      objc_copyWeak(&v21, (id *)buf);
      id v20 = v4;
      objc_msgSend__scheduleSubscriptionPoolWork_inNanoseconds_description_(self, v13, (uint64_t)v19, 0, @"MTRDevice setDelegate first subscription");

      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      deviceController = self->super._deviceController;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = sub_244C81FC8;
      v17[3] = &unk_265193DC8;
      v17[4] = self;
      id v18 = v4;
      objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(deviceController, v15, (uint64_t)v17, 0);
    }
  }
}

- (void)invalidate
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = self;
    _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_DEFAULT, "%@ invalidate", buf, 0xCu);
  }

  if (sub_244CC4E58(2u))
  {
    uint64_t v10 = self;
    sub_244CC4DE0(0, 2);
  }
  objc_msgSend_invalidate(self->_asyncWorkQueue, v4, v5, v10);
  os_unfair_lock_lock(&self->_timeSyncLock);
  self->_timeUpdateScheduled = 0;
  os_unfair_lock_unlock(&self->_timeSyncLock);
  os_unfair_lock_lock(&self->super._lock);
  self->_state = 0;
  self->_reattemptingSubscription = 0;
  deviceController = self->super._deviceController;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_244C82254;
  v12[3] = &unk_265193E58;
  v12[4] = self;
  objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(deviceController, v7, (uint64_t)v12, 0);
  objc_msgSend__stopConnectivityMonitoring(self, v8, v9);
  os_unfair_lock_unlock(&self->super._lock);
  v11.receiver = self;
  v11.super_class = (Class)MTRDevice_Concrete;
  [(MTRDevice *)&v11 invalidate];
}

- (void)nodeMayBeAdvertisingOperational
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDevice_Concrete.mm", 827);
  v3 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = self;
    _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_DEFAULT, "%@ saw new operational advertisement", buf, 0xCu);
  }

  if (sub_244CC4E58(2u))
  {
    uint64_t v5 = self;
    sub_244CC4DE0(0, 2);
  }
  objc_msgSend__triggerResubscribeWithReason_nodeLikelyReachable_(self, v4, @"operational advertisement seen", 1, v5);
}

- (void)_triggerResubscribeWithReason:(id)a3 nodeLikelyReachable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = self;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_DEFAULT, "%@ _triggerResubscribeWithReason called with reason %@", buf, 0x16u);
  }

  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(0, 2);
  }
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDevice_Concrete.mm", 841);
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  if (objc_msgSend_reattemptingSubscription(self, v9, v10))
  {
    objc_msgSend__reattemptSubscriptionNowIfNeededWithReason_(self, v11, (uint64_t)v6);
    os_unfair_lock_unlock(&self->super._lock);
  }
  else
  {
    currentReadClient = self->_currentReadClient;
    currentSubscriptionCallback = self->_currentSubscriptionCallback;
    os_unfair_lock_unlock(p_lock);
    if (currentReadClient)
    {
      if (v4) {
        currentSubscriptionCallback[48] = 0;
      }
      id v14 = v6;
      uint64_t v17 = objc_msgSend_UTF8String(v14, v15, v16);
      sub_244DD1A58((uint64_t)currentReadClient, v17);
    }
  }
}

- (BOOL)_subscriptionAbleToReport
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  if (objc_msgSend__delegateExists(self, v4, v5)) {
    char v8 = objc_msgSend__subscriptionsAllowed(self, v6, v7);
  }
  else {
    char v8 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)_readThroughSkipped
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  if (self->_state != 1 && self->_lastSubscriptionFailureTime)
  {
    id v6 = objc_msgSend_now(MEMORY[0x263EFF910], v4, v5);
    objc_msgSend_timeIntervalSinceDate_(v6, v7, (uint64_t)self->_lastSubscriptionFailureTime);
    double v9 = v8;

    if (v9 >= 600.0)
    {
      deviceController = self->super._deviceController;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_244C828F4;
      v14[3] = &unk_265193E58;
      v14[4] = self;
      objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(deviceController, v10, (uint64_t)v14, 0);
    }
    else
    {
      objc_super v11 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        lastSubscriptionFailureTime = self->_lastSubscriptionFailureTime;
        *(_DWORD *)buf = 138412546;
        uint64_t v16 = self;
        __int16 v17 = 2112;
        id v18 = lastSubscriptionFailureTime;
        _os_log_impl(&dword_2446BD000, v11, OS_LOG_TYPE_INFO, "%@ skipping resubscribe from skipped read-through: not enough time has passed since %@", buf, 0x16u);
      }

      if (sub_244CC4E58(3u)) {
        sub_244CC4DE0(0, 3);
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_callDelegateDeviceCachePrimed
{
  os_unfair_lock_assert_owner(&self->super._lock);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_244C8299C;
  v4[3] = &unk_265199E78;
  v4[4] = self;
  objc_msgSend__callDelegatesWithBlock_(self, v3, (uint64_t)v4);
}

- (void)_changeState:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDevice_Concrete.mm", 967);
  os_unfair_lock_assert_owner(&self->super._lock);
  unint64_t state = self->_state;
  self->_unint64_t state = a3;
  if (state == a3)
  {
    id v6 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v17 = self;
      __int16 v18 = 2048;
      unint64_t v19 = a3;
      __int16 v20 = 2048;
      unint64_t v21 = a3;
      _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_DEFAULT, "%@ Not reporting reachability state change, since no change in state %lu => %lu", buf, 0x20u);
    }

    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(0, 2);
    }
  }
  else
  {
    uint64_t v7 = sub_244CC8484(0, "NotSpecified");
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (a3 == 1)
    {
      if (v8)
      {
        *(_DWORD *)buf = 138412802;
        __int16 v17 = self;
        __int16 v18 = 2048;
        unint64_t v19 = state;
        __int16 v20 = 2048;
        unint64_t v21 = 1;
        _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_DEFAULT, "%@ reachability state change %lu => %lu", buf, 0x20u);
      }

      if (sub_244CC4E58(2u))
      {
        unint64_t v13 = state;
        unint64_t v14 = 1;
        uint64_t v12 = self;
        sub_244CC4DE0(0, 2);
      }
    }
    else
    {
      if (v8)
      {
        *(_DWORD *)buf = 138412802;
        __int16 v17 = self;
        __int16 v18 = 2048;
        unint64_t v19 = state;
        __int16 v20 = 2048;
        unint64_t v21 = a3;
        _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_DEFAULT, "%@ reachability state change %lu => %lu, set estimated start time to nil", buf, 0x20u);
      }

      if (sub_244CC4E58(2u))
      {
        unint64_t v13 = state;
        unint64_t v14 = a3;
        uint64_t v12 = self;
        sub_244CC4DE0(0, 2);
      }
      estimatedStartTime = self->_estimatedStartTime;
      self->_estimatedStartTime = 0;

      estimatedStartTimeFromGeneralDiagnosticsUpTime = self->_estimatedStartTimeFromGeneralDiagnosticsUpTime;
      self->_estimatedStartTimeFromGeneralDiagnosticsUpTime = 0;
    }
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_244C82CFC;
    v15[3] = &unk_265199E28;
    v15[4] = self;
    v15[5] = a3;
    objc_msgSend__callDelegatesWithBlock_(self, v9, (uint64_t)v15, v12, v13, v14);
  }
}

- (void)_changeInternalState:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDevice_Concrete.mm", 1000);
  os_unfair_lock_assert_owner(&self->super._lock);
  unint64_t internalDeviceState = self->_internalDeviceState;
  self->_unint64_t internalDeviceState = a3;
  os_unfair_lock_lock(&self->_descriptionLock);
  self->_unint64_t internalDeviceStateForDescription = self->_internalDeviceState;
  os_unfair_lock_unlock(&self->_descriptionLock);
  if (internalDeviceState != a3)
  {
    id v6 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v15 = self;
      __int16 v16 = 2048;
      unint64_t v17 = internalDeviceState;
      __int16 v18 = 2048;
      unint64_t v19 = a3;
      _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_DEFAULT, "%@ internal state change %lu => %lu", buf, 0x20u);
    }

    if (sub_244CC4E58(2u))
    {
      unint64_t v11 = internalDeviceState;
      unint64_t v12 = a3;
      uint64_t v10 = self;
      sub_244CC4DE0(0, 2);
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_244C82ED8;
    v13[3] = &unk_26519B308;
    v13[4] = self;
    objc_msgSend__callDelegatesWithBlock_(self, v7, (uint64_t)v13, v10, v11, v12);
    objc_msgSend__notifyDelegateOfPrivateInternalPropertiesChanges(self, v8, v9);
  }
}

- (void)_handleSubscriptionEstablished
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  unint64_t internalDeviceState = self->_internalDeviceState;
  if (internalDeviceState == 2 || internalDeviceState == 4)
  {
    objc_msgSend__clearSubscriptionPoolWork(self, v4, v5);
    objc_msgSend__stopConnectivityMonitoring(self, v8, v9);
    objc_msgSend__setLastSubscriptionAttemptWait_(self, v10, 0);
    __int16 v32 = self->_initialSubscribeStart;
    initialSubscribeStart = self->_initialSubscribeStart;
    self->_initialSubscribeStart = 0;

    if (v32)
    {
      objc_msgSend_timeIntervalSinceNow(v32, v12, v13);
      double v17 = -v16;
      estimatedSubscriptionLatency = self->_estimatedSubscriptionLatency;
      if (estimatedSubscriptionLatency)
      {
        objc_msgSend_doubleValue(estimatedSubscriptionLatency, v14, v15);
        objc_msgSend_numberWithDouble_(NSNumber, v20, v21, v19 * 0.666666667 + v17 * 0.333333333);
      }
      else
      {
        objc_msgSend_numberWithDouble_(NSNumber, v14, v15, -v16);
      }
      uint64_t v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      id v26 = self->_estimatedSubscriptionLatency;
      self->_estimatedSubscriptionLatency = v22;

      objc_msgSend__storePersistedDeviceData(self, v27, v28);
    }
    os_unfair_lock_unlock(p_lock);
    os_unfair_lock_lock(&self->_timeSyncLock);
    if ((objc_msgSend_timeUpdateScheduled(self, v29, v30) & 1) == 0) {
      objc_msgSend__scheduleNextUpdate_(self, v31, 120);
    }
    os_unfair_lock_unlock(&self->_timeSyncLock);
  }
  else
  {
    id v23 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v25 = self->_internalDeviceState;
      *(_DWORD *)buf = 138412546;
      uint64_t v34 = self;
      __int16 v35 = 2048;
      unint64_t v36 = v25;
      _os_log_impl(&dword_2446BD000, v23, OS_LOG_TYPE_DEFAULT, "%@ _handleSubscriptionEstablished run with internal state %lu - skipping subscription establishment logic", buf, 0x16u);
    }

    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(0, 2);
    }
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)_handleSubscriptionError:(id)a3
{
  id v5 = a3;
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDevice_Concrete.mm", 1085);
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend__doHandleSubscriptionError_(self, v4, (uint64_t)v5);
  os_unfair_lock_unlock(&self->super._lock);
}

- (void)_doHandleSubscriptionError:(id)a3
{
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDevice_Concrete.mm", 1093);
  os_unfair_lock_assert_owner(&self->super._lock);
  objc_msgSend__changeInternalState_(self, v4, 0);
  unreportedEvents = self->_unreportedEvents;
  self->_unreportedEvents = 0;

  objc_msgSend__changeState_(self, v6, 2);
}

- (BOOL)deviceUsesThread
{
  uint64_t v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  LOBYTE(v2) = objc_msgSend__deviceUsesThread(v2, v4, v5);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_deviceUsesThread
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(&self->super._lock);
  BOOL v4 = objc_msgSend_clusterPathWithEndpointID_clusterID_(MTRClusterPath, v3, (uint64_t)&unk_26F9CD690, &unk_26F9CD6A8);
  id v6 = objc_msgSend__clusterDataForPath_(self, v5, (uint64_t)v4);
  uint64_t v9 = objc_msgSend_attributes(v6, v7, v8);
  unint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)&unk_26F9CD6C0);
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v11, v12, @"value");

  if (!v13) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v17 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = self;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      _os_log_impl(&dword_2446BD000, v17, OS_LOG_TYPE_ERROR, "%@ Unexpected NetworkCommissioning FeatureMap value %@", buf, 0x16u);
    }

    if (sub_244CC4E58(1u))
    {
      sub_244CC4DE0(0, 1);
      LOBYTE(v16) = 0;
      goto LABEL_9;
    }
LABEL_8:
    LOBYTE(v16) = 0;
    goto LABEL_9;
  }
  unint64_t v16 = ((unint64_t)objc_msgSend_unsignedLongValue(v13, v14, v15) >> 1) & 1;
LABEL_9:

  return v16;
}

- (void)_clearSubscriptionPoolWork
{
  os_unfair_lock_assert_owner(&self->super._lock);
  BOOL v4 = (void (**)(id, void))MEMORY[0x2456969D0](self->_subscriptionPoolWorkCompletionBlock);
  if (v4)
  {
    id subscriptionPoolWorkCompletionBlock = self->_subscriptionPoolWorkCompletionBlock;
    self->_id subscriptionPoolWorkCompletionBlock = 0;

    v4[2](v4, 0);
  }
}

- (void)_scheduleSubscriptionPoolWork:(id)a3 inNanoseconds:(int64_t)a4 description:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  os_unfair_lock_assert_owner(&self->super._lock);
  if (self->_subscriptionPoolWorkCompletionBlock)
  {
    uint64_t v10 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = self;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_DEFAULT, "%@ already scheduled in subscription pool for this device - ignoring: %@", buf, 0x16u);
    }

    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(0, 2);
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = sub_244C83884;
    v17[3] = &unk_26519B358;
    objc_copyWeak(&v20, (id *)buf);
    id v18 = v9;
    id v19 = v8;
    uint64_t v11 = MEMORY[0x2456969D0](v17);
    unint64_t v12 = (void *)v11;
    if (a4 < 1)
    {
      (*(void (**)(uint64_t))(v11 + 16))(v11);
    }
    else
    {
      dispatch_time_t v13 = dispatch_time(0, a4);
      unint64_t v16 = objc_msgSend_queue(self, v14, v15);
      dispatch_after(v13, v16, v12);
    }
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_handleResubscriptionNeededWithDelay:(id)a3
{
  id v4 = a3;
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDevice_Concrete.mm", 1226);
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend__changeState_(self, v5, 0);
  objc_msgSend__changeInternalState_(self, v6, 3);
  id v9 = objc_msgSend_queue(self, v7, v8);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_244C83E1C;
  v11[3] = &unk_265193DC8;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);

  os_unfair_lock_unlock(&self->super._lock);
}

- (void)_handleResubscriptionNeededWithDelayOnDeviceQueue:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend_now(MEMORY[0x263EFF910], v5, v6);
  uint64_t v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastSubscriptionFailureTime = self->_lastSubscriptionFailureTime;
  self->_lastSubscriptionFailureTime = v7;

  os_unfair_lock_lock(&self->_descriptionLock);
  objc_storeStrong((id *)&self->_lastSubscriptionFailureTimeForDescription, self->_lastSubscriptionFailureTime);
  os_unfair_lock_unlock(&self->_descriptionLock);
  int v11 = objc_msgSend__deviceUsesThread(self, v9, v10);
  objc_msgSend__clearSubscriptionPoolWork(self, v12, v13);
  os_unfair_lock_unlock(&self->super._lock);
  objc_initWeak(&location, self);
  uint64_t v25 = MEMORY[0x263EF8330];
  uint64_t v26 = 3221225472;
  uint64_t v27 = sub_244C8403C;
  uint64_t v28 = &unk_265194F70;
  objc_copyWeak(&v29, &location);
  unint64_t v14 = (void *)MEMORY[0x2456969D0](&v25);
  int64_t v17 = 1000000 * objc_msgSend_unsignedIntValue(v4, v15, v16, v25, v26, v27, v28);
  if (v11)
  {
    os_unfair_lock_lock(&self->super._lock);
    objc_msgSend__scheduleSubscriptionPoolWork_inNanoseconds_description_(self, v18, (uint64_t)v14, v17, @"ReadClient resubscription");
    os_unfair_lock_unlock(&self->super._lock);
  }
  else
  {
    dispatch_time_t v21 = dispatch_time(0, v17);
    id v24 = objc_msgSend_queue(self, v22, v23);
    dispatch_after(v21, v24, v14);
  }
  objc_msgSend__setupConnectivityMonitoring(self, v19, v20);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

- (void)_handleSubscriptionReset:(id)a3
{
  id v5 = a3;
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDevice_Concrete.mm", 1293);
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend__doHandleSubscriptionReset_(self, v4, (uint64_t)v5);
  os_unfair_lock_unlock(&self->super._lock);
}

- (void)_setLastSubscriptionAttemptWait:(unsigned int)a3
{
  os_unfair_lock_assert_owner(&self->super._lock);
  self->_lastSubscriptionAttemptWait = a3;
  os_unfair_lock_lock(&self->_descriptionLock);
  self->_uint64_t lastSubscriptionAttemptWaitForDescription = a3;
  os_unfair_lock_unlock(&self->_descriptionLock);

  objc_msgSend__notifyDelegateOfPrivateInternalPropertiesChanges(self, v5, v6);
}

- (void)_doHandleSubscriptionReset:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDevice_Concrete.mm", 1314);
  os_unfair_lock_assert_owner(&self->super._lock);
  if (objc_msgSend_suspended(self, v5, v6))
  {
    id v9 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v44 = self;
      _os_log_impl(&dword_2446BD000, v9, OS_LOG_TYPE_DEFAULT, "%@ ignoring expected subscription reset on controller suspend", buf, 0xCu);
    }

    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(0, 2);
    }
  }
  else
  {
    objc_msgSend_now(MEMORY[0x263EFF910], v7, v8);
    uint64_t v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastSubscriptionFailureTime = self->_lastSubscriptionFailureTime;
    self->_lastSubscriptionFailureTime = v10;

    os_unfair_lock_lock(&self->_descriptionLock);
    objc_storeStrong((id *)&self->_lastSubscriptionFailureTimeForDescription, self->_lastSubscriptionFailureTime);
    os_unfair_lock_unlock(&self->_descriptionLock);
    if (objc_msgSend__delegateExists(self, v12, v13)
      && (objc_msgSend_reattemptingSubscription(self, v14, v15) & 1) == 0)
    {
      objc_msgSend_setReattemptingSubscription_(self, v16, 1);
      unsigned int lastSubscriptionAttemptWait = self->_lastSubscriptionAttemptWait;
      if (lastSubscriptionAttemptWait)
      {
        if (v4)
        {
          objc_msgSend__setLastSubscriptionAttemptWait_(self, v17, 0);
          objc_msgSend_doubleValue(v4, v19, v20);
          double v22 = v21;
          uint64_t v23 = sub_244CC8484(0, "NotSpecified");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v44 = self;
            __int16 v45 = 2048;
            double v46 = v22;
            _os_log_impl(&dword_2446BD000, v23, OS_LOG_TYPE_DEFAULT, "%@ resetting resubscribe attempt counter, and delaying by the server-provided delay: %f", buf, 0x16u);
          }

          if (sub_244CC4E58(2u))
          {
            double v40 = v22;
            long long v39 = self;
            sub_244CC4DE0(0, 2);
          }
        }
        else
        {
          if (2 * lastSubscriptionAttemptWait >= 0xE10)
          {
            unsigned int v24 = 3600;
            objc_msgSend__setLastSubscriptionAttemptWait_(self, v17, 3600);
          }
          else
          {
            unsigned int v24 = 2 * lastSubscriptionAttemptWait;
            objc_msgSend__setLastSubscriptionAttemptWait_(self, v17, 2 * lastSubscriptionAttemptWait);
          }
          double v22 = (double)v24;
        }
      }
      else
      {
        self->_unsigned int lastSubscriptionAttemptWait = 1;
        double v22 = 1.0;
      }
      uint64_t v25 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v44 = self;
        __int16 v45 = 2048;
        double v46 = v22;
        _os_log_impl(&dword_2446BD000, v25, OS_LOG_TYPE_DEFAULT, "%@ scheduling to reattempt subscription in %f seconds", buf, 0x16u);
      }

      if (sub_244CC4E58(2u))
      {
        double v40 = v22;
        long long v39 = self;
        sub_244CC4DE0(0, 2);
      }
      objc_msgSend__clearSubscriptionPoolWork(self, v26, v27, v39, *(void *)&v40);
      objc_initWeak((id *)buf, self);
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = sub_244C84820;
      v41[3] = &unk_265194F70;
      objc_copyWeak(&v42, (id *)buf);
      uint64_t v28 = (void *)MEMORY[0x2456969D0](v41);
      int v31 = objc_msgSend__deviceUsesThread(self, v29, v30);
      __int16 v32 = (const char *)(uint64_t)(v22 * 1000000000.0);
      if (v31)
      {
        objc_msgSend__scheduleSubscriptionPoolWork_inNanoseconds_description_(self, v32, (uint64_t)v28, (uint64_t)(v22 * 1000000000.0), @"MTRDevice resubscription");
      }
      else
      {
        dispatch_time_t v35 = dispatch_time(0, (int64_t)v32);
        long long v38 = objc_msgSend_queue(self, v36, v37);
        dispatch_after(v35, v38, v28);
      }
      objc_msgSend__notifyDelegateOfPrivateInternalPropertiesChanges(self, v33, v34);

      objc_destroyWeak(&v42);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)_reattemptSubscriptionNowIfNeededWithReason:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDevice_Concrete.mm", 1401);
  os_unfair_lock_assert_owner(&self->super._lock);
  if (objc_msgSend_reattemptingSubscription(self, v5, v6))
  {
    uint64_t v7 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = self;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_DEFAULT, "%@ reattempting subscription with reason %@", buf, 0x16u);
    }

    if (sub_244CC4E58(2u))
    {
      id v9 = self;
      id v10 = v4;
      sub_244CC4DE0(0, 2);
    }
    objc_msgSend__setupSubscriptionWithReason_(self, v8, (uint64_t)v4, v9, v10);
  }
}

- (void)_handleUnsolicitedMessageFromPublisher
{
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDevice_Concrete.mm", 1414);
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend__changeState_(self, v3, 1);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_244C84B70;
  v6[3] = &unk_265199E78;
  v6[4] = self;
  objc_msgSend__callDelegatesWithBlock_(self, v4, (uint64_t)v6);
  objc_msgSend__reattemptSubscriptionNowIfNeededWithReason_(self, v5, @"got unsolicited message from publisher");
  os_unfair_lock_unlock(&self->super._lock);
}

- (void)_markDeviceAsUnreachableIfNeverSubscribed
{
  deviceController = self->super._deviceController;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_244C84C6C;
  v3[3] = &unk_265193E58;
  v3[4] = self;
  objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(deviceController, a2, (uint64_t)v3, 0);
}

- (void)_handleReportBegin
{
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDevice_Concrete.mm", 1451);
  os_unfair_lock_lock(&self->super._lock);
  self->_receivingReport = 1;
  if (self->_state != 1) {
    objc_msgSend__changeState_(self, v3, 1);
  }
  unint64_t internalDeviceState = self->_internalDeviceState;
  BOOL v6 = internalDeviceState != 2 && internalDeviceState != 4;
  self->_receivingPrimingReport = v6;

  os_unfair_lock_unlock(&self->super._lock);
}

- (id)_clusterDataToPersistSnapshot
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(&self->super._lock);
  id v5 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v3, v4);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v6 = self->_clusterDataToPersist;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v19, v23, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        __int16 v13 = objc_msgSend_objectForKeyedSubscript_(self->_clusterDataToPersist, v8, v12, (void)v19);
        uint64_t v16 = objc_msgSend_copy(v13, v14, v15);
        objc_msgSend_setObject_forKeyedSubscript_(v5, v17, (uint64_t)v16, v12);
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v19, v23, 16);
    }
    while (v9);
  }

  return v5;
}

- (double)_reportToPersistenceDelayTimeAfterMutiplier
{
  objc_msgSend_reportToPersistenceDelayTime(self->_storageBehaviorConfiguration, a2, v2);
  return v4 * self->_reportToPersistenceDelayCurrentMultiplier;
}

- (double)_reportToPersistenceDelayTimeMaxAfterMutiplier
{
  objc_msgSend_reportToPersistenceDelayTimeMax(self->_storageBehaviorConfiguration, a2, v2);
  return v4 * self->_reportToPersistenceDelayCurrentMultiplier;
}

- (BOOL)_dataStoreExists
{
  return self->_persistedClusterData != 0;
}

- (void)_persistClusterData
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(&self->super._lock);
  if (objc_msgSend__dataStoreExists(self, v3, v4))
  {
    if (objc_msgSend_count(self->_clusterDataToPersist, v5, v6))
    {
      uint64_t v7 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = objc_msgSend_count(self->_clusterDataToPersist, v8, v9);
        *(_DWORD *)buf = 138412546;
        long long v39 = self;
        __int16 v40 = 2048;
        uint64_t v41 = v10;
        _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_DEFAULT, "%@ Storing cluster information (data version and attributes) count: %lu", buf, 0x16u);
      }

      if (sub_244CC4E58(2u))
      {
        id v29 = self;
        uint64_t v30 = objc_msgSend_count(self->_clusterDataToPersist, v11, v12);
        sub_244CC4DE0(0, 2);
      }
      int v31 = objc_msgSend__clusterDataToPersistSnapshot(self, v11, v12, v29, v30);
      uint64_t v15 = objc_msgSend_controllerDataStore(self->super._deviceController, v13, v14);
      objc_msgSend_storeClusterData_forNodeID_(v15, v16, (uint64_t)v31, self->super._nodeID);

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id obj = self->_clusterDataToPersist;
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v33, v37, 16);
      if (v19)
      {
        uint64_t v20 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v34 != v20) {
              objc_enumerationMutation(obj);
            }
            uint64_t v22 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            persistedClusterData = self->_persistedClusterData;
            uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(self->_clusterDataToPersist, v18, v22);
            objc_msgSend_setObject_forKey_(persistedClusterData, v25, (uint64_t)v24, v22);

            objc_msgSend_addObject_(self->_persistedClusters, v26, v22);
          }
          uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v33, v37, 16);
        }
        while (v19);
      }

      clusterDataToPersist = self->_clusterDataToPersist;
      self->_clusterDataToPersist = 0;
    }
  }
  else
  {
    uint64_t v28 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v39 = self;
      _os_log_impl(&dword_2446BD000, v28, OS_LOG_TYPE_ERROR, "%@ storage behavior: no data store in _persistClusterData!", buf, 0xCu);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
  }
}

- (BOOL)_deviceIsReportingExcessively
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(&self->super._lock);
  deviceReportingExcessivelyStartTime = self->_deviceReportingExcessivelyStartTime;
  if (deviceReportingExcessivelyStartTime)
  {
    objc_msgSend_timeIntervalSinceNow(deviceReportingExcessivelyStartTime, v3, v4);
    double v7 = -v6;
    objc_msgSend_deviceReportingExcessivelyIntervalThreshold(self->_storageBehaviorConfiguration, v8, v9);
    if (v10 >= v7)
    {
      LOBYTE(deviceReportingExcessivelyStartTime) = 0;
    }
    else
    {
      int v11 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v14 = self;
        __int16 v15 = 2048;
        double v16 = v7;
        _os_log_impl(&dword_2446BD000, v11, OS_LOG_TYPE_DEFAULT, "%@ storage behavior: device has been reporting excessively for %.3lf seconds", buf, 0x16u);
      }

      if (sub_244CC4E58(2u)) {
        sub_244CC4DE0(0, 2);
      }
      LOBYTE(deviceReportingExcessivelyStartTime) = 1;
    }
  }
  return (char)deviceReportingExcessivelyStartTime;
}

- (void)_persistClusterDataAsNeeded
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  if (objc_msgSend_count(self->_clusterDataToPersist, v4, v5)
    && (objc_msgSend__deviceIsReportingExcessively(self, v6, v7) & 1) == 0)
  {
    double v10 = objc_msgSend_lastObject(self->_mostRecentReportTimes, v8, v9);
    objc_msgSend_timeIntervalSinceNow(v10, v11, v12);
    double v14 = v13;
    objc_msgSend__reportToPersistenceDelayTimeAfterMutiplier(self, v15, v16);
    double v19 = -v14;
    if (v20 <= -v14) {
      goto LABEL_6;
    }
    clusterDataPersistenceFirstScheduledTime = self->_clusterDataPersistenceFirstScheduledTime;
    if (!clusterDataPersistenceFirstScheduledTime)
    {
      id v29 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v32 = self;
        _os_log_impl(&dword_2446BD000, v29, OS_LOG_TYPE_ERROR, "%@ storage behavior: expects _clusterDataPersistenceFirstScheduledTime if _clusterDataToPersist exists", buf, 0xCu);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
      goto LABEL_7;
    }
    objc_msgSend_timeIntervalSinceNow(clusterDataPersistenceFirstScheduledTime, v17, v18);
    double v23 = v22;
    objc_msgSend__reportToPersistenceDelayTimeMaxAfterMutiplier(self, v24, v25);
    double v26 = -v23;
    if (v27 > v26)
    {
      uint64_t v30 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        __int16 v32 = self;
        __int16 v33 = 2048;
        double v34 = v19;
        __int16 v35 = 2048;
        double v36 = v26;
        _os_log_impl(&dword_2446BD000, v30, OS_LOG_TYPE_DEFAULT, "%@ storage behavior: not persisting: intervalSinceLastReport %lf intervalSinceFirstScheduledPersistence %lf", buf, 0x20u);
      }

      if (sub_244CC4E58(2u)) {
        sub_244CC4DE0(0, 2);
      }
    }
    else
    {
LABEL_6:
      objc_msgSend__persistClusterData(self, v17, v18);
      uint64_t v28 = self->_clusterDataPersistenceFirstScheduledTime;
      self->_clusterDataPersistenceFirstScheduledTime = 0;
    }
LABEL_7:
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_scheduleClusterDataPersistence
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(&self->super._lock);
  if (objc_msgSend__dataStoreExists(self, v3, v4))
  {
    if (objc_msgSend_count(self->_clusterDataToPersist, v5, v6))
    {
      storageBehaviorConfiguration = self->_storageBehaviorConfiguration;
      if (!storageBehaviorConfiguration)
      {
        double v10 = objc_alloc_init(MTRDeviceStorageBehaviorConfiguration);
        int v11 = self->_storageBehaviorConfiguration;
        self->_storageBehaviorConfiguration = v10;

        objc_msgSend_checkValuesAndResetToDefaultIfNecessary(self->_storageBehaviorConfiguration, v12, v13);
        storageBehaviorConfiguration = self->_storageBehaviorConfiguration;
      }
      if (objc_msgSend_disableStorageBehaviorOptimization(storageBehaviorConfiguration, v7, v8)
        || !self->_deviceCachePrimed)
      {
        objc_msgSend__persistClusterData(self, v14, v15);
      }
      else
      {
        if (!self->_mostRecentReportTimes)
        {
          objc_msgSend_array(MEMORY[0x263EFF980], v14, v15);
          uint64_t v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          mostRecentReportTimes = self->_mostRecentReportTimes;
          self->_mostRecentReportTimes = v16;
        }
        if (!self->_clusterDataPersistenceFirstScheduledTime)
        {
          objc_msgSend_now(MEMORY[0x263EFF910], v14, v15);
          uint64_t v18 = (NSDate *)objc_claimAutoreleasedReturnValue();
          clusterDataPersistenceFirstScheduledTime = self->_clusterDataPersistenceFirstScheduledTime;
          self->_clusterDataPersistenceFirstScheduledTime = v18;
        }
        while (1)
        {
          unint64_t v20 = objc_msgSend_count(self->_mostRecentReportTimes, v14, v15);
          if (v20 < objc_msgSend_recentReportTimesMaxCount(self->_storageBehaviorConfiguration, v21, v22)) {
            break;
          }
          objc_msgSend_removeObjectAtIndex_(self->_mostRecentReportTimes, v23, 0);
        }
        uint64_t v25 = self->_mostRecentReportTimes;
        double v26 = objc_msgSend_now(MEMORY[0x263EFF910], v23, v24);
        objc_msgSend_addObject_(v25, v27, (uint64_t)v26);

        os_unfair_lock_lock(&self->_descriptionLock);
        objc_msgSend_lastObject(self->_mostRecentReportTimes, v28, v29);
        uint64_t v30 = (NSDate *)objc_claimAutoreleasedReturnValue();
        mostRecentReportTimeForDescription = self->_mostRecentReportTimeForDescription;
        self->_mostRecentReportTimeForDescription = v30;

        os_unfair_lock_unlock(&self->_descriptionLock);
        if ((unint64_t)objc_msgSend_count(self->_mostRecentReportTimes, v32, v33) >= 3)
        {
          double v38 = 0.0;
          if ((unint64_t)objc_msgSend_count(self->_mostRecentReportTimes, v34, v35) >= 2)
          {
            unint64_t v39 = 1;
            do
            {
              __int16 v40 = objc_msgSend_objectAtIndex_(self->_mostRecentReportTimes, v36, v39 - 1);
              uint64_t v42 = objc_msgSend_objectAtIndex_(self->_mostRecentReportTimes, v41, v39);
              objc_msgSend_timeIntervalSinceDate_(v42, v43, (uint64_t)v40);
              if (v44 <= 0.0) {
                double v44 = -0.0;
              }
              double v38 = v38 + v44;

              ++v39;
            }
            while (objc_msgSend_count(self->_mostRecentReportTimes, v45, v46) > v39);
          }
          double v47 = v38 / (double)(unint64_t)(objc_msgSend_count(self->_mostRecentReportTimes, v36, v37) - 1);
          objc_msgSend_timeBetweenReportsTooShortThreshold(self->_storageBehaviorConfiguration, v48, v49);
          if (v47 >= v52)
          {
            self->_double reportToPersistenceDelayCurrentMultiplier = 1.0;
          }
          else
          {
            objc_msgSend_timeBetweenReportsTooShortThreshold(self->_storageBehaviorConfiguration, v50, v51);
            double v54 = v53 - v47;
            objc_msgSend_timeBetweenReportsTooShortThreshold(self->_storageBehaviorConfiguration, v55, v56);
            double v58 = v57;
            objc_msgSend_timeBetweenReportsTooShortMinThreshold(self->_storageBehaviorConfiguration, v59, v60);
            double v64 = v54 / (v58 - v63);
            if (v64 <= 1.0) {
              double v65 = v64;
            }
            else {
              double v65 = 1.0;
            }
            objc_msgSend_reportToPersistenceDelayMaxMultiplier(self->_storageBehaviorConfiguration, v61, v62);
            self->_double reportToPersistenceDelayCurrentMultiplier = v65 * (v66 + -1.0) + 1.0;
            v67 = sub_244CC8484(0, "NotSpecified");
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              double reportToPersistenceDelayCurrentMultiplier = self->_reportToPersistenceDelayCurrentMultiplier;
              *(_DWORD *)buf = 138412546;
              v88 = self;
              __int16 v89 = 2048;
              double v90 = reportToPersistenceDelayCurrentMultiplier;
              _os_log_impl(&dword_2446BD000, v67, OS_LOG_TYPE_DEFAULT, "%@ storage behavior: device reporting frequently - setting delay multiplier to %lf", buf, 0x16u);
            }

            if (sub_244CC4E58(2u))
            {
              double v85 = self->_reportToPersistenceDelayCurrentMultiplier;
              v84 = self;
              sub_244CC4DE0(0, 2);
            }
          }
          objc_msgSend_timeBetweenReportsTooShortMinThreshold(self->_storageBehaviorConfiguration, v50, v51, v84, *(void *)&v85);
          deviceReportingExcessivelyStartTime = self->_deviceReportingExcessivelyStartTime;
          if (v47 >= v72)
          {
            self->_deviceReportingExcessivelyStartTime = 0;
          }
          else if (!deviceReportingExcessivelyStartTime)
          {
            objc_msgSend_now(MEMORY[0x263EFF910], v34, v35);
            v73 = (NSDate *)objc_claimAutoreleasedReturnValue();
            v74 = self->_deviceReportingExcessivelyStartTime;
            self->_deviceReportingExcessivelyStartTime = v73;

            v75 = sub_244CC8484(0, "NotSpecified");
            if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
            {
              v76 = self->_deviceReportingExcessivelyStartTime;
              *(_DWORD *)buf = 138412546;
              v88 = self;
              __int16 v89 = 2112;
              double v90 = *(double *)&v76;
              _os_log_impl(&dword_2446BD000, v75, OS_LOG_TYPE_INFO, "%@ storage behavior: device is reporting excessively @%@", buf, 0x16u);
            }

            if (sub_244CC4E58(3u))
            {
              v84 = self;
              double v85 = *(double *)&self->_deviceReportingExcessivelyStartTime;
              sub_244CC4DE0(0, 3);
            }
          }
        }
        if ((objc_msgSend__deviceIsReportingExcessively(self, v34, v35, v84, *(void *)&v85) & 1) == 0)
        {
          objc_msgSend__reportToPersistenceDelayTimeAfterMutiplier(self, v77, v78);
          dispatch_time_t v80 = dispatch_time(0, (uint64_t)(v79 * 1000000000.0));
          v83 = objc_msgSend_queue(self, v81, v82);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = sub_244C85E90;
          block[3] = &unk_265193E58;
          block[4] = self;
          dispatch_after(v80, v83, block);
        }
      }
      return;
    }
    v70 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v88 = self;
      _os_log_impl(&dword_2446BD000, v70, OS_LOG_TYPE_INFO, "%@ storage behavior: nothing to persist", buf, 0xCu);
    }

    if (sub_244CC4E58(3u)) {
LABEL_30:
    }
      sub_244CC4DE0(0, 3);
  }
  else
  {
    v69 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v88 = self;
      _os_log_impl(&dword_2446BD000, v69, OS_LOG_TYPE_INFO, "%@ storage behavior: no data store", buf, 0xCu);
    }

    if (sub_244CC4E58(3u)) {
      goto LABEL_30;
    }
  }
}

- (void)_resetStorageBehaviorState
{
  os_unfair_lock_assert_owner(&self->super._lock);
  clusterDataPersistenceFirstScheduledTime = self->_clusterDataPersistenceFirstScheduledTime;
  self->_clusterDataPersistenceFirstScheduledTime = 0;

  mostRecentReportTimes = self->_mostRecentReportTimes;
  self->_mostRecentReportTimes = 0;

  os_unfair_lock_lock(&self->_descriptionLock);
  mostRecentReportTimeForDescription = self->_mostRecentReportTimeForDescription;
  self->_mostRecentReportTimeForDescription = 0;

  os_unfair_lock_unlock(&self->_descriptionLock);
  deviceReportingExcessivelyStartTime = self->_deviceReportingExcessivelyStartTime;
  self->_deviceReportingExcessivelyStartTime = 0;

  self->_double reportToPersistenceDelayCurrentMultiplier = 1.0;
  if (objc_msgSend__dataStoreExists(self, v7, v8)) {
    objc_msgSend__persistClusterData(self, v9, v10);
  }

  objc_msgSend__notifyDelegateOfPrivateInternalPropertiesChanges(self, v9, v10);
}

- (void)setStorageBehaviorConfiguration:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v12 = self;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_DEFAULT, "%@ storage behavior: setStorageBehaviorConfiguration %@", buf, 0x16u);
  }

  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(0, 2);
  }
  os_unfair_lock_lock(&self->super._lock);
  objc_storeStrong((id *)&self->_storageBehaviorConfiguration, a3);
  objc_msgSend_checkValuesAndResetToDefaultIfNecessary(self->_storageBehaviorConfiguration, v7, v8);
  objc_msgSend__resetStorageBehaviorState(self, v9, v10);
  os_unfair_lock_unlock(&self->super._lock);
}

- (void)_handleReportEnd
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = self;
    _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_DEFAULT, "%@ handling report end", buf, 0xCu);
  }

  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(0, 2);
  }
  os_unfair_lock_lock(&self->super._lock);
  self->_receivingReport = 0;
  self->_receivingPrimingReport = 0;
  estimatedStartTimeFromGeneralDiagnosticsUpTime = self->_estimatedStartTimeFromGeneralDiagnosticsUpTime;
  self->_estimatedStartTimeFromGeneralDiagnosticsUpTime = 0;

  objc_msgSend__scheduleClusterDataPersistence(self, v5, v6);
  if (self->_deviceConfigurationChanged)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_244C862D0;
    v13[3] = &unk_265199E78;
    v13[4] = self;
    objc_msgSend__callDelegatesWithBlock_(self, v7, (uint64_t)v13);
    objc_msgSend__notifyDelegateOfPrivateInternalPropertiesChanges(self, v9, v10);
    self->_deviceConfigurationChanged = 0;
  }
  if (!self->_deviceCachePrimed)
  {
    self->_deviceCachePrimed = 1;
    objc_msgSend__callDelegateDeviceCachePrimed(self, v7, v8);
    objc_msgSend__notifyDelegateOfPrivateInternalPropertiesChanges(self, v11, v12);
  }
  os_unfair_lock_unlock(&self->super._lock);
}

- (BOOL)_interestedPaths:(id)a3 includesAttributePath:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v5;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v46, v50, 16);
  if (v8)
  {
    uint64_t v9 = *(void *)v47;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v47 != v9) {
          objc_enumerationMutation(obj);
        }
        int v11 = *(void **)(*((void *)&v46 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          uint64_t v15 = objc_msgSend_endpoint(v6, v13, v14);
          char isEqualToNumber = objc_msgSend_isEqualToNumber_(v12, v16, (uint64_t)v15);

          goto LABEL_10;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v19 = v11;
          uint64_t v22 = objc_msgSend_cluster(v19, v20, v21);
          uint64_t v25 = objc_msgSend_cluster(v6, v23, v24);
          char isEqualToNumber = objc_msgSend_isEqualToNumber_(v22, v26, (uint64_t)v25);

LABEL_10:
          if (isEqualToNumber) {
            goto LABEL_20;
          }
          goto LABEL_11;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v27 = v11;
          uint64_t v30 = objc_msgSend_cluster(v27, v28, v29);
          uint64_t v33 = objc_msgSend_cluster(v6, v31, v32);
          if (objc_msgSend_isEqualToNumber_(v30, v34, (uint64_t)v33))
          {
            uint64_t v37 = objc_msgSend_attribute(v27, v35, v36);
            __int16 v40 = objc_msgSend_attribute(v6, v38, v39);
            char v42 = objc_msgSend_isEqualToNumber_(v37, v41, (uint64_t)v40);

            if (v42)
            {
LABEL_20:
              LOBYTE(v8) = 1;
              goto LABEL_21;
            }
          }
          else
          {
          }
        }
LABEL_11:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v46, v50, 16);
      uint64_t v8 = v43;
    }
    while (v43);
  }
LABEL_21:

  return v8;
}

- (id)_filteredAttributes:(id)a3 forInterestedPaths:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = v7;
  char v42 = v6;
  if (v7)
  {
    if (objc_msgSend_count(v7, v8, v9))
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v11 = v6;
      id v13 = 0;
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v43, v53, 16);
      if (v15)
      {
        uint64_t v16 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v44 != v16) {
              objc_enumerationMutation(v11);
            }
            uint64_t v18 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            id v19 = objc_msgSend_objectForKeyedSubscript_(v18, v14, @"attributePath");
            if (objc_msgSend__interestedPaths_includesAttributePath_(self, v20, (uint64_t)v10, v19))
            {
              if (!v13)
              {
                objc_msgSend_array(MEMORY[0x263EFF980], v21, v22);
                id v13 = (id)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend_addObject_(v13, v21, (uint64_t)v18);
            }
          }
          uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v43, v53, 16);
        }
        while (v15);
      }

      if (objc_msgSend_count(v13, v23, v24))
      {
        uint64_t v27 = objc_msgSend_count(v13, v25, v26);
        if (v27 != objc_msgSend_count(v11, v28, v29))
        {
          uint64_t v30 = sub_244CC8484(0, "NotSpecified");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v33 = objc_msgSend_count(v11, v31, v32);
            uint64_t v36 = objc_msgSend_count(v13, v34, v35);
            *(_DWORD *)buf = 138412802;
            long long v48 = self;
            __int16 v49 = 2048;
            uint64_t v50 = v33;
            __int16 v51 = 2048;
            uint64_t v52 = v36;
            _os_log_impl(&dword_2446BD000, v30, OS_LOG_TYPE_DEFAULT, "%@ filtered attribute report %lu => %lu", buf, 0x20u);
          }

          if (sub_244CC4E58(2u))
          {
            objc_msgSend_count(v11, v37, v38);
            objc_msgSend_count(v13, v39, v40);
            sub_244CC4DE0(0, 2);
          }
        }
      }
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = v6;
  }

  return v13;
}

- (void)_reportAttributes:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->super._lock);
  if (objc_msgSend_count(v4, v5, v6))
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = sub_244C86A50;
    v8[3] = &unk_26519B3A8;
    v8[4] = self;
    id v9 = v4;
    objc_msgSend__iterateDelegatesWithBlock_(self, v7, (uint64_t)v8);
  }
}

- (void)_handleAttributeReport:(id)a3 fromSubscription:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v13 = self;
    if (v4) {
      uint64_t v8 = @"YES";
    }
    __int16 v14 = 2048;
    id v15 = v6;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_DEFAULT, "%@ handling attribute report %p, fromSubscription: %@", buf, 0x20u);
  }

  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(0, 2);
  }
  os_unfair_lock_lock(&self->super._lock);
  uint64_t v10 = objc_msgSend__getAttributesToReportWithReportedValues_fromSubscription_(self, v9, (uint64_t)v6, v4);
  objc_msgSend__reportAttributes_(self, v11, (uint64_t)v10);

  os_unfair_lock_unlock(&self->super._lock);
}

- (void)_injectAttributeReport:(id)a3 fromSubscription:(BOOL)a4
{
  id v6 = a3;
  deviceController = self->super._deviceController;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_244C86E04;
  v10[3] = &unk_26519B3D0;
  v10[4] = self;
  id v11 = v6;
  BOOL v12 = a4;
  id v8 = v6;
  objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(deviceController, v9, (uint64_t)v10, 0);
}

- (void)_injectEventReport:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_queue(self, v5, v6);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_244C87090;
  v9[3] = &unk_265193DC8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (BOOL)_interestedPaths:(id)a3 includesEventPath:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v5;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v46, v50, 16);
  if (v8)
  {
    uint64_t v9 = *(void *)v47;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v47 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v46 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          id v15 = objc_msgSend_endpoint(v6, v13, v14);
          char isEqualToNumber = objc_msgSend_isEqualToNumber_(v12, v16, (uint64_t)v15);

          goto LABEL_10;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v19 = v11;
          uint64_t v22 = objc_msgSend_cluster(v19, v20, v21);
          uint64_t v25 = objc_msgSend_cluster(v6, v23, v24);
          char isEqualToNumber = objc_msgSend_isEqualToNumber_(v22, v26, (uint64_t)v25);

LABEL_10:
          if (isEqualToNumber) {
            goto LABEL_20;
          }
          goto LABEL_11;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v27 = v11;
          uint64_t v30 = objc_msgSend_cluster(v27, v28, v29);
          uint64_t v33 = objc_msgSend_cluster(v6, v31, v32);
          if (objc_msgSend_isEqualToNumber_(v30, v34, (uint64_t)v33))
          {
            uint64_t v37 = objc_msgSend_event(v27, v35, v36);
            uint64_t v40 = objc_msgSend_event(v6, v38, v39);
            char v42 = objc_msgSend_isEqualToNumber_(v37, v41, (uint64_t)v40);

            if (v42)
            {
LABEL_20:
              LOBYTE(v8) = 1;
              goto LABEL_21;
            }
          }
          else
          {
          }
        }
LABEL_11:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v46, v50, 16);
      uint64_t v8 = v43;
    }
    while (v43);
  }
LABEL_21:

  return v8;
}

- (id)_filteredEvents:(id)a3 forInterestedPaths:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = v7;
  char v42 = v6;
  if (v7)
  {
    if (objc_msgSend_count(v7, v8, v9))
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v11 = v6;
      id v13 = 0;
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v43, v53, 16);
      if (v15)
      {
        uint64_t v16 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v44 != v16) {
              objc_enumerationMutation(v11);
            }
            uint64_t v18 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            id v19 = objc_msgSend_objectForKeyedSubscript_(v18, v14, @"eventPath");
            if (objc_msgSend__interestedPaths_includesEventPath_(self, v20, (uint64_t)v10, v19))
            {
              if (!v13)
              {
                objc_msgSend_array(MEMORY[0x263EFF980], v21, v22);
                id v13 = (id)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend_addObject_(v13, v21, (uint64_t)v18);
            }
          }
          uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v43, v53, 16);
        }
        while (v15);
      }

      if (objc_msgSend_count(v13, v23, v24))
      {
        uint64_t v27 = objc_msgSend_count(v13, v25, v26);
        if (v27 != objc_msgSend_count(v11, v28, v29))
        {
          uint64_t v30 = sub_244CC8484(0, "NotSpecified");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v33 = objc_msgSend_count(v11, v31, v32);
            uint64_t v36 = objc_msgSend_count(v13, v34, v35);
            *(_DWORD *)buf = 138412802;
            long long v48 = self;
            __int16 v49 = 2048;
            uint64_t v50 = v33;
            __int16 v51 = 2048;
            uint64_t v52 = v36;
            _os_log_impl(&dword_2446BD000, v30, OS_LOG_TYPE_DEFAULT, "%@ filtered event report %lu => %lu", buf, 0x20u);
          }

          if (sub_244CC4E58(2u))
          {
            objc_msgSend_count(v11, v37, v38);
            objc_msgSend_count(v13, v39, v40);
            sub_244CC4DE0(0, 2);
          }
        }
      }
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = v6;
  }

  return v13;
}

- (void)_handleEventReport:(id)a3
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v61 = a3;
  os_unfair_lock_lock(&self->super._lock);
  id location = (id *)&self->_estimatedStartTime;
  uint64_t v62 = self->_estimatedStartTime;
  unreportedEvents = self->_unreportedEvents;
  if (unreportedEvents)
  {
    id v7 = unreportedEvents;
  }
  else
  {
    objc_msgSend_array(MEMORY[0x263EFF980], v4, v5);
    id v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  }
  double v65 = v7;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id obj = v61;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v71, v77, 16);
  if (v10)
  {
    uint64_t v67 = *(void *)v72;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v72 != v67) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(NSDate **)(*((void *)&v71 + 1) + 8 * v11);
        id v13 = objc_msgSend_objectForKeyedSubscript_(v12, v9, @"eventPath", v58);
        objc_msgSend_cluster(v13, v14, v15);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_unsignedLongValue(v16, v17, v18) == 40)
        {
          uint64_t v21 = objc_msgSend_event(v13, v19, v20);
          BOOL v24 = objc_msgSend_unsignedLongValue(v21, v22, v23) == 0;

          if (!v24) {
            goto LABEL_24;
          }
          if (self->_estimatedStartTimeFromGeneralDiagnosticsUpTime)
          {
            uint64_t v26 = sub_244CC8484(0, "NotSpecified");
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              estimatedStartTimeFromGeneralDiagnosticsUpTime = self->_estimatedStartTimeFromGeneralDiagnosticsUpTime;
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = self;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = estimatedStartTimeFromGeneralDiagnosticsUpTime;
              _os_log_impl(&dword_2446BD000, v26, OS_LOG_TYPE_DEFAULT, "%@ StartUp event: set estimated start time forward to %@", buf, 0x16u);
            }

            if (sub_244CC4E58(2u))
            {
              v59 = self;
              uint64_t v60 = self->_estimatedStartTimeFromGeneralDiagnosticsUpTime;
              sub_244CC4DE0(0, 2);
            }
            uint64_t v28 = self->_estimatedStartTimeFromGeneralDiagnosticsUpTime;
          }
          else
          {
            uint64_t v29 = sub_244CC8484(0, "NotSpecified");
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = self;
              _os_log_impl(&dword_2446BD000, v29, OS_LOG_TYPE_DEFAULT, "%@ StartUp event: set estimated start time to nil", buf, 0xCu);
            }

            if (sub_244CC4E58(2u))
            {
              v59 = self;
              sub_244CC4DE0(0, 2);
            }
            uint64_t v28 = 0;
          }
          id v16 = *location;
          *id location = v28;
        }

LABEL_24:
        uint64_t v30 = objc_msgSend_objectForKeyedSubscript_(v12, v25, @"eventTimeType", v59, v60);
        uint64_t v33 = v30;
        if (v30)
        {
          if (objc_msgSend_unsignedIntegerValue(v30, v31, v32)) {
            goto LABEL_31;
          }
          uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(v12, v34, @"eventSystemUpTime");
          uint64_t v39 = v36;
          if (v36)
          {
            objc_msgSend_doubleValue(v36, v37, v38);
            long long v43 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x263EFF910], v41, v42, -v40);
            long long v45 = v43;
            if (!*location || objc_msgSend_compare_(v43, v44, (uint64_t)*location) == -1) {
              objc_storeStrong(location, v45);
            }

LABEL_31:
            long long v46 = objc_msgSend_mutableCopy(v12, v34, v35);
            long long v48 = v46;
            if (self->_receivingPrimingReport) {
              objc_msgSend_setObject_forKeyedSubscript_(v46, v47, MEMORY[0x263EFFA88], @"eventIsHistorical");
            }
            else {
              objc_msgSend_setObject_forKeyedSubscript_(v46, v47, MEMORY[0x263EFFA80], @"eventIsHistorical");
            }
            objc_msgSend_addObject_(v65, v49, (uint64_t)v48);

            goto LABEL_39;
          }
          __int16 v51 = sub_244CC8484(0, "NotSpecified");
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v12;
            _os_log_impl(&dword_2446BD000, v51, OS_LOG_TYPE_ERROR, "%@ Event %@ missing event time value", buf, 0x16u);
          }

          if (sub_244CC4E58(1u)) {
            goto LABEL_38;
          }
        }
        else
        {
          uint64_t v50 = sub_244CC8484(0, "NotSpecified");
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v12;
            _os_log_impl(&dword_2446BD000, v50, OS_LOG_TYPE_ERROR, "%@ Event %@ missing event time type", buf, 0x16u);
          }

          if (sub_244CC4E58(1u))
          {
LABEL_38:
            double v58 = self;
            uint64_t v60 = v12;
            sub_244CC4DE0(0, 1);
          }
        }
LABEL_39:

        ++v11;
      }
      while (v10 != v11);
      uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v71, v77, 16);
      uint64_t v10 = v52;
    }
    while (v52);
  }

  if (v62 != *location)
  {
    double v53 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      id v54 = *location;
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v54;
      _os_log_impl(&dword_2446BD000, v53, OS_LOG_TYPE_DEFAULT, "%@ updated estimated start time to %@", buf, 0x16u);
    }

    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(0, 2);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v76 = 0;
  v68[0] = MEMORY[0x263EF8330];
  v68[1] = 3221225472;
  v68[2] = sub_244C87EBC;
  v68[3] = &unk_26519B3F8;
  v68[4] = self;
  double v66 = v65;
  v69 = v66;
  v70 = buf;
  objc_msgSend__iterateDelegatesWithBlock_(self, v55, (uint64_t)v68);
  if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
    uint64_t v56 = 0;
  }
  else {
    uint64_t v56 = v66;
  }
  double v57 = self->_unreportedEvents;
  self->_unreportedEvents = v56;

  _Block_object_dispose(buf, 8);
  os_unfair_lock_unlock(&self->super._lock);
}

- (void)_reconcilePersistedClustersWithStorage
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(&self->super._lock);
  uint64_t v37 = objc_msgSend_set(MEMORY[0x263EFF9C0], v3, v4);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = self->_persistedClusters;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v39, v49, 16);
  if (v8)
  {
    uint64_t v9 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v12 = objc_msgSend_controllerDataStore(self->super._deviceController, v6, v7);
        nodeID = self->super._nodeID;
        id v16 = objc_msgSend_endpoint(v11, v14, v15);
        id v19 = objc_msgSend_cluster(v11, v17, v18);
        uint64_t v21 = objc_msgSend_getStoredClusterDataForNodeID_endpointID_clusterID_(v12, v20, (uint64_t)nodeID, v16, v19);

        if (!v21) {
          objc_msgSend_addObject_(v37, v22, (uint64_t)v11);
        }
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v39, v49, 16);
    }
    while (v8);
  }

  uint64_t v23 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    uint64_t v26 = objc_msgSend_count(v37, v24, v25);
    uint64_t v29 = objc_msgSend_count(self->_persistedClusters, v27, v28);
    *(_DWORD *)buf = 138412802;
    long long v44 = self;
    __int16 v45 = 2048;
    uint64_t v46 = v26;
    __int16 v47 = 2048;
    uint64_t v48 = v29;
    _os_log_impl(&dword_2446BD000, v23, OS_LOG_TYPE_ERROR, "%@ Storage missing %lu / %lu clusters - reconciling in-memory records", buf, 0x20u);
  }

  if (sub_244CC4E58(1u))
  {
    uint64_t v35 = objc_msgSend_count(v37, v30, v31);
    uint64_t v36 = objc_msgSend_count(self->_persistedClusters, v32, v33);
    double v34 = self;
    sub_244CC4DE0(0, 1);
  }
  objc_msgSend_minusSet_(self->_persistedClusters, v30, (uint64_t)v37, v34, v35, v36);
}

- (id)_clusterDataForPath:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->super._lock);
  clusterDataToPersist = self->_clusterDataToPersist;
  if (!clusterDataToPersist
    || (objc_msgSend_objectForKeyedSubscript_(clusterDataToPersist, v5, (uint64_t)v4),
        (uint64_t v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (!objc_msgSend__dataStoreExists(self, v5, v6)
      || (objc_msgSend_objectForKey_(self->_persistedClusterData, v9, (uint64_t)v4),
          (uint64_t v8 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (objc_msgSend_containsObject_(self->_persistedClusters, v9, (uint64_t)v4))
      {
        id v12 = objc_msgSend_controllerDataStore(self->super._deviceController, v10, v11);
        nodeID = self->super._nodeID;
        id v16 = objc_msgSend_endpoint(v4, v14, v15);
        id v19 = objc_msgSend_cluster(v4, v17, v18);
        uint64_t v8 = objc_msgSend_getStoredClusterDataForNodeID_endpointID_clusterID_(v12, v20, (uint64_t)nodeID, v16, v19);

        uint64_t v21 = sub_244CC8484(0, "NotSpecified");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = @"YES";
          *(_DWORD *)buf = 138412802;
          uint64_t v30 = self;
          __int16 v31 = 2112;
          if (!v8) {
            uint64_t v22 = @"NO";
          }
          id v32 = v4;
          __int16 v33 = 2112;
          double v34 = v22;
          _os_log_impl(&dword_2446BD000, v21, OS_LOG_TYPE_DEFAULT, "%@ cluster path %@ cache miss - load from storage success %@", buf, 0x20u);
        }

        if (sub_244CC4E58(2u)) {
          sub_244CC4DE0(0, 2);
        }
        if (v8)
        {
          objc_msgSend_setObject_forKey_(self->_persistedClusterData, v23, (uint64_t)v8, v4);
        }
        else
        {
          objc_msgSend__reconcilePersistedClustersWithStorage(self, v23, v24);
          uint64_t v26 = objc_msgSend_stringWithFormat_(NSString, v25, @"Data store has no data for cluster %@", v4);
          objc_msgSend__resetSubscriptionWithReasonString_(self, v27, (uint64_t)v26);
        }
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
  }

  return v8;
}

- (id)_knownClusters
{
  os_unfair_lock_assert_owner(&self->super._lock);
  uint64_t v7 = objc_msgSend_mutableCopy(self->_persistedClusters, v3, v4);
  clusterDataToPersist = self->_clusterDataToPersist;
  if (clusterDataToPersist)
  {
    uint64_t v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = objc_msgSend_allKeys(clusterDataToPersist, v5, v6);
    id v12 = objc_msgSend_setWithArray_(v9, v11, (uint64_t)v10);
    objc_msgSend_unionSet_(v7, v13, (uint64_t)v12);
  }

  return v7;
}

- (id)_getCachedDataVersions
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2);
  os_unfair_lock_lock(&self->super._lock);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v7 = objc_msgSend__knownClusters(self, v5, v6);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v26, v34, 16);
  if (v10)
  {
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend__clusterDataForPath_(self, v9, v13);
        uint64_t v17 = objc_msgSend_dataVersion(v14, v15, v16);
        objc_msgSend_setObject_forKeyedSubscript_(v4, v18, (uint64_t)v17, v13);
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v26, v34, 16);
    }
    while (v10);
  }

  id v19 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v22 = objc_msgSend_count(v4, v20, v21);
    *(_DWORD *)buf = 138412546;
    __int16 v31 = self;
    __int16 v32 = 2048;
    uint64_t v33 = v22;
    _os_log_impl(&dword_2446BD000, v19, OS_LOG_TYPE_INFO, "%@ _getCachedDataVersions dataVersions count: %lu", buf, 0x16u);
  }

  if (sub_244CC4E58(3u))
  {
    objc_msgSend_count(v4, v23, v24);
    sub_244CC4DE0(0, 3);
  }
  os_unfair_lock_unlock(&self->super._lock);

  return v4;
}

- (id)_cachedAttributeValueForPath:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->super._lock);
  uint64_t v7 = objc_msgSend_endpoint(v4, v5, v6);
  uint64_t v10 = objc_msgSend_cluster(v4, v8, v9);
  id v12 = objc_msgSend_clusterPathWithEndpointID_clusterID_(MTRClusterPath, v11, (uint64_t)v7, v10);

  uint64_t v14 = objc_msgSend__clusterDataForPath_(self, v13, (uint64_t)v12);
  uint64_t v17 = v14;
  if (v14)
  {
    uint64_t v18 = objc_msgSend_attributes(v14, v15, v16);
    uint64_t v21 = objc_msgSend_attribute(v4, v19, v20);
    uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v18, v22, (uint64_t)v21);
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

- (void)_setCachedAttributeValue:(id)a3 forPath:(id)a4 fromSubscription:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_assert_owner(&self->super._lock);
  id v12 = objc_msgSend_endpoint(v9, v10, v11);
  uint64_t v15 = objc_msgSend_cluster(v9, v13, v14);
  uint64_t v17 = objc_msgSend_clusterPathWithEndpointID_clusterID_(MTRClusterPath, v16, (uint64_t)v12, v15);

  objc_msgSend__clusterDataForPath_(self, v18, (uint64_t)v17);
  uint64_t v21 = (MTRDeviceClusterData *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    if (!v8)
    {
      uint64_t v21 = 0;
      goto LABEL_14;
    }
    uint64_t v21 = objc_alloc_init(MTRDeviceClusterData);
  }
  uint64_t v22 = objc_msgSend_attribute(v9, v19, v20);
  objc_msgSend_storeValue_forAttribute_(v21, v23, (uint64_t)v8, v22);

  if (objc_msgSend__attributePathAffectsDescriptionData_(self, v24, (uint64_t)v9)) {
    objc_msgSend__updateAttributeDependentDescriptionData(self, v25, v26);
  }
  if (v8 && v5 && !self->_receivingPrimingReport && sub_244C88CF4(v9))
  {
    int v32 = 0;
    uint64_t v33 = "dwnpm_bad_c_attr_update";
    char v34 = 0;
    sub_244D7E78C((uint64_t)&v32);
    objc_msgSend__addInformationalAttributesToCurrentMetricScope(self, v27, v28);
    int v32 = 1;
    uint64_t v33 = "dwnpm_bad_c_attr_update";
    char v34 = 0;
    sub_244D7E78C((uint64_t)&v32);
  }
  else
  {
    clusterDataToPersist = self->_clusterDataToPersist;
    if (!clusterDataToPersist)
    {
      objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v25, v26);
      uint64_t v30 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      __int16 v31 = self->_clusterDataToPersist;
      self->_clusterDataToPersist = v30;

      clusterDataToPersist = self->_clusterDataToPersist;
    }
    objc_msgSend_setObject_forKeyedSubscript_(clusterDataToPersist, v25, (uint64_t)v21, v17);
  }
LABEL_14:
}

- (void)_removeCachedAttribute:(id)a3 fromCluster:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  os_unfair_lock_assert_owner(&self->super._lock);
  clusterDataToPersist = self->_clusterDataToPersist;
  if (clusterDataToPersist)
  {
    id v9 = objc_msgSend_objectForKeyedSubscript_(clusterDataToPersist, v7, (uint64_t)v6);
    objc_msgSend_removeValueForAttribute_(v9, v10, (uint64_t)v11);
  }
}

- (void)_createDataVersionFilterListFromDictionary:(id)a3 dataVersionFilterList:(DataVersionFilter *)a4 count:(unint64_t *)a5
{
  id v5 = a3;
  if (objc_msgSend_count(v5, v6, v7)) {
    operator new[]();
  }
  *a5 = 0;
  *a4 = 0;
}

- (void)_stopConnectivityMonitoring
{
  os_unfair_lock_assert_owner(&self->super._lock);
  connectivityMonitor = self->_connectivityMonitor;
  if (connectivityMonitor)
  {
    objc_msgSend_stopMonitoring(connectivityMonitor, v3, v4);
    id v6 = self->_connectivityMonitor;
    self->_connectivityMonitor = 0;
  }
}

- (void)_resetSubscriptionWithReasonString:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->super._lock);
  id v5 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_2446BD000, v5, OS_LOG_TYPE_ERROR, "%@ %@ - resetting subscription", buf, 0x16u);
  }

  if (sub_244CC4E58(1u))
  {
    id v8 = self;
    id v9 = v4;
    sub_244CC4DE0(0, 1);
  }
  deviceController = self->super._deviceController;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_244C89478;
  v10[3] = &unk_265193E58;
  v10[4] = self;
  objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(deviceController, v6, (uint64_t)v10, 0, v8, v9);
}

- (void)_setupSubscriptionWithReason:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDevice_Concrete.mm", 2348);
  os_unfair_lock_assert_owner(&self->super._lock);
  objc_msgSend_setReattemptingSubscription_(self, v5, 0);
  if (objc_msgSend__subscriptionsAllowed(self, v6, v7))
  {
    if (self->_internalDeviceState)
    {
      id v9 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t internalDeviceState = self->_internalDeviceState;
        *(_DWORD *)buf = 138412802;
        *(void *)uint64_t v30 = self;
        *(_WORD *)&v30[8] = 2048;
        *(void *)&v30[10] = internalDeviceState;
        __int16 v31 = 2112;
        id v32 = v4;
        _os_log_impl(&dword_2446BD000, v9, OS_LOG_TYPE_DEFAULT, "%@ setupSubscription: no need to subscribe due to internal state %lu (reason: %@)", buf, 0x20u);
      }

      if (sub_244CC4E58(2u)) {
LABEL_6:
      }
        sub_244CC4DE0(0, 2);
    }
    else
    {
      objc_msgSend__changeInternalState_(self, v8, 1);
      id v12 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)uint64_t v30 = self;
        *(_WORD *)&v30[8] = 2112;
        *(void *)&v30[10] = v4;
        _os_log_impl(&dword_2446BD000, v12, OS_LOG_TYPE_DEFAULT, "%@ setting up subscription with reason: %@", buf, 0x16u);
      }

      if (sub_244CC4E58(2u)) {
        sub_244CC4DE0(0, 2);
      }
      objc_initWeak((id *)buf, self);
      dispatch_time_t v13 = dispatch_time(0, 10000000000);
      uint64_t v16 = objc_msgSend_queue(self, v14, v15);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_244C89A24;
      block[3] = &unk_265194F70;
      objc_copyWeak(&v28, (id *)buf);
      dispatch_after(v13, v16, block);

      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)buf);
      *(_DWORD *)buf = 0;
      *(void *)&v30[4] = "dwnpm_dev_initial_subscription_setup";
      v30[16] = 0;
      sub_244D7E78C((uint64_t)buf);
      id v19 = objc_msgSend__concreteController(self, v17, v18);
      uint64_t v22 = objc_msgSend_unsignedLongLongValue(self->super._nodeID, v20, v21);
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = sub_244C89A88;
      v26[3] = &unk_26519B470;
      v26[4] = self;
      objc_msgSend_directlyGetSessionForNode_completion_(v19, v23, v22, v26);

      objc_msgSend__setupConnectivityMonitoring(self, v24, v25);
    }
  }
  else
  {
    id v11 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)uint64_t v30 = self;
      *(_WORD *)&v30[8] = 2112;
      *(void *)&v30[10] = v4;
      _os_log_impl(&dword_2446BD000, v11, OS_LOG_TYPE_DEFAULT, "%@ _setupSubscription: Subscriptions not allowed. Do not set up subscription (reason: %@)", buf, 0x16u);
    }

    if (sub_244CC4E58(2u)) {
      goto LABEL_6;
    }
  }
}

- (id)readAttributeWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5 params:(id)a6
{
  v111[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v88 = v10;
  id v89 = a6;
  double v90 = objc_msgSend_attributePathWithEndpointID_clusterID_attributeID_(MTRAttributePath, v13, (uint64_t)v10, v11, v12);
  LODWORD(a6) = objc_msgSend_unsignedIntValue(v11, v14, v15);
  unsigned int v18 = objc_msgSend_unsignedIntValue(v12, v16, v17);
  if (sub_244799464((int)a6, v18))
  {
    int v21 = sub_244C88CF4(v90);
  }
  else if (v89)
  {
    int v21 = objc_msgSend_shouldAssumeUnknownAttributesReportable(v89, v19, v20) ^ 1;
  }
  else
  {
    int v21 = 0;
  }
  objc_msgSend__attributeValueDictionaryForAttributePath_(self, v19, (uint64_t)v90);
  id v87 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->super._lock);
  char v24 = objc_msgSend_suspended(self, v22, v23);
  os_unfair_lock_unlock(&self->super._lock);
  if ((v24 & 1) != 0 || (objc_msgSend__subscriptionAbleToReport(self, v25, v26) ^ 1 | v21) != 1)
  {
    objc_msgSend__readThroughSkipped(self, v25, v26);
  }
  else
  {
    double v85 = objc_msgSend_requestPathWithEndpointID_clusterID_attributeID_(MTRAttributeRequestPath, v25, (uint64_t)v88, v11, v12);
    v111[0] = v85;
    long long v29 = v89;
    if (!v89)
    {
      long long v29 = objc_msgSend_null(MEMORY[0x263EFF9D0], v27, v28);
    }
    v111[1] = v29;
    v86 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v27, (uint64_t)v111, 2);
    if (!v89) {

    }
    if ((objc_msgSend_hasDuplicateForTypeID_workItemData_(self->_asyncWorkQueue, v30, 1, v86) & 1) == 0)
    {
      id v32 = objc_msgSend_arrayWithObject_(MEMORY[0x263EFF980], v31, (uint64_t)v86);
      uint64_t v33 = [MTRAsyncWorkItem alloc];
      uint64_t v36 = objc_msgSend_queue(self, v34, v35);
      uint64_t v38 = objc_msgSend_initWithQueue_(v33, v37, (uint64_t)v36);

      uint64_t v41 = objc_msgSend_uniqueID(v38, v39, v40);
      long long v44 = objc_msgSend_nodeID(self, v42, v43);
      v105[0] = MEMORY[0x263EF8330];
      v105[1] = 3221225472;
      v105[2] = sub_244C8B974;
      v105[3] = &unk_26519B498;
      uint64_t v110 = v41;
      id v45 = v44;
      id v106 = v45;
      id v46 = v88;
      id v107 = v46;
      id v47 = v11;
      id v108 = v47;
      id v48 = v12;
      id v109 = v48;
      objc_msgSend_setBatchingID_data_handler_(v38, v49, 1, v32, v105);
      v98[0] = MEMORY[0x263EF8330];
      v98[1] = 3221225472;
      v98[2] = sub_244C8BE88;
      v98[3] = &unk_26519B4C0;
      id v50 = v32;
      id v99 = v50;
      uint64_t v104 = v41;
      id v51 = v45;
      id v100 = v51;
      uint64_t v83 = v41;
      id v52 = v46;
      id v101 = v52;
      id v53 = v47;
      id v102 = v53;
      id v54 = v48;
      id v103 = v54;
      uint64_t v82 = v38;
      objc_msgSend_setDuplicateTypeID_handler_(v38, v55, 1, v98);
      v91[0] = MEMORY[0x263EF8330];
      v91[1] = 3221225472;
      v91[2] = sub_244C8C104;
      v91[3] = &unk_26519B510;
      id v81 = v50;
      id v92 = v81;
      uint64_t v97 = v83;
      id v84 = v51;
      id v93 = v84;
      id v56 = v52;
      id v94 = v56;
      id v57 = v53;
      id v95 = v57;
      id v58 = v54;
      id v96 = v58;
      objc_msgSend_setReadyHandler_(v38, v59, (uint64_t)v91);
      asyncWorkQueue = self->_asyncWorkQueue;
      uint64_t v63 = objc_msgSend_unsignedLongLongValue(v57, v61, v62);
      uint64_t v66 = objc_msgSend_unsignedLongLongValue(v57, v64, v65);
      v68 = MTRClusterNameForID(v66, v67);
      uint64_t v71 = objc_msgSend_unsignedLongLongValue(v58, v69, v70);
      uint64_t v74 = objc_msgSend_unsignedLongLongValue(v57, v72, v73);
      v77 = (const char *)objc_msgSend_unsignedLongLongValue(v58, v75, v76);
      uint64_t v78 = MTRAttributeNameForID(v74, v77);
      objc_msgSend_enqueueWorkItem_descriptionWithFormat_(asyncWorkQueue, v79, (uint64_t)v82, @"read %@ 0x%llx (%@) 0x%llx (%@)", v56, v63, v68, v71, v78);
    }
  }

  return v87;
}

- (void)writeAttributeWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5 value:(id)a6 expectedValueInterval:(id)a7 timedWriteTimeout:(id)a8
{
  v92[2] = *MEMORY[0x263EF8340];
  id v74 = a3;
  id v77 = a4;
  id v76 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  uint64_t v19 = objc_msgSend_copy(v14, v17, v18);

  if (v16)
  {
    uint64_t v20 = sub_2446BE6EC(v16, &unk_26F9CD6D8, &unk_26F9CD6F0);

    id v16 = (id)v20;
  }
  uint64_t v73 = sub_2446BE6EC(v15, &unk_26F9CD6D8, &unk_26F9CD708);

  long long v72 = (void *)v19;
  v75 = v16;
  uint64_t v22 = objc_msgSend_attributePathWithEndpointID_clusterID_attributeID_(MTRAttributePath, v21, (uint64_t)v74, v77, v76);
  v87[0] = 0;
  v87[1] = v87;
  v87[2] = 0x2020000000;
  char v88 = 1;
  uint64_t v86 = 0;
  v91[0] = @"attributePath";
  v91[1] = @"data";
  v92[0] = v22;
  v92[1] = v19;
  char v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v23, (uint64_t)v92, v91, 2);
  double v90 = v24;
  uint64_t v26 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v25, (uint64_t)&v90, 1);
  objc_msgSend_setExpectedValues_expectedValueInterval_expectedValueID_(self, v27, (uint64_t)v26, v73, &v86);

  uint64_t v28 = [MTRAsyncWorkItem alloc];
  __int16 v31 = objc_msgSend_queue(self, v29, v30);
  uint64_t v33 = objc_msgSend_initWithQueue_(v28, v32, (uint64_t)v31);

  uint64_t v36 = objc_msgSend_uniqueID(v33, v34, v35);
  uint64_t v70 = self->super._nodeID;
  v89[0] = v22;
  v89[1] = v19;
  long long v39 = v16;
  if (!v16)
  {
    long long v39 = objc_msgSend_null(MEMORY[0x263EFF9D0], v37, v38);
  }
  v89[2] = v39;
  uint64_t v40 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v37, v86);
  v89[3] = v40;
  uint64_t v71 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v41, (uint64_t)v89, 4);

  if (!v16) {
  uint64_t v43 = objc_msgSend_arrayWithObject_(MEMORY[0x263EFF980], v42, (uint64_t)v71);
  }
  v83[0] = MEMORY[0x263EF8330];
  v83[1] = 3221225472;
  v83[2] = sub_244C8CF50;
  v83[3] = &unk_26519B538;
  uint64_t v85 = v36;
  long long v44 = v70;
  id v84 = v44;
  objc_msgSend_setBatchingID_data_handler_(v33, v45, 2, v43, v83);
  objc_msgSend_setDuplicateTypeID_handler_(v33, v46, 1, &unk_26F952840);
  v78[0] = MEMORY[0x263EF8330];
  v78[1] = 3221225472;
  v78[2] = sub_244C8D354;
  v78[3] = &unk_26519B5A8;
  id v47 = v43;
  id v79 = v47;
  id v81 = v87;
  uint64_t v82 = v36;
  id v48 = v22;
  id v80 = v48;
  objc_msgSend_setReadyHandler_(v33, v49, (uint64_t)v78);
  asyncWorkQueue = self->_asyncWorkQueue;
  uint64_t v53 = objc_msgSend_unsignedLongLongValue(v77, v51, v52);
  uint64_t v56 = objc_msgSend_unsignedLongLongValue(v77, v54, v55);
  id v58 = MTRClusterNameForID(v56, v57);
  uint64_t v61 = objc_msgSend_unsignedLongLongValue(v76, v59, v60);
  uint64_t v64 = objc_msgSend_unsignedLongLongValue(v77, v62, v63);
  uint64_t v67 = (const char *)objc_msgSend_unsignedLongLongValue(v76, v65, v66);
  v68 = MTRAttributeNameForID(v64, v67);
  objc_msgSend_enqueueWorkItem_descriptionWithFormat_(asyncWorkQueue, v69, (uint64_t)v33, @"write %@ 0x%llx (%@) 0x%llx (%@): %@", v74, v53, v58, v61, v68, v72);

  _Block_object_dispose(v87, 8);
}

- (id)readAttributePaths:(id)a3
{
  uint64_t v129 = *MEMORY[0x263EF8340];
  id v92 = a3;
  id v106 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v99 = self;
  locuint64_t k = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id obj = v92;
  uint64_t v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v119, v128, 16, v92);
  if (v94)
  {
    uint64_t v95 = *(void *)v120;
    do
    {
      for (uint64_t i = 0; i != v94; ++i)
      {
        if (*(void *)v120 != v95) {
          objc_enumerationMutation(obj);
        }
        v105 = *(void **)(*((void *)&v119 + 1) + 8 * i);
        long long v115 = 0u;
        long long v116 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        objc_msgSend__knownClusters(v99, v5, v6);
        id v98 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v98, v7, (uint64_t)&v115, v127, 16);
        if (v8)
        {
          uint64_t v100 = *(void *)v116;
          do
          {
            id v103 = 0;
            id v101 = (id)v8;
            do
            {
              if (*(void *)v116 != v100) {
                objc_enumerationMutation(v98);
              }
              id v11 = *(void **)(*((void *)&v115 + 1) + 8 * (void)v103);
              id v12 = objc_msgSend_endpoint(v105, v9, v10);
              if (!v12) {
                goto LABEL_45;
              }
              dispatch_time_t v13 = objc_msgSend_endpoint(v105, v9, v10);
              id v16 = objc_msgSend_endpoint(v11, v14, v15);
              char isEqual = objc_msgSend_isEqual_(v13, v17, (uint64_t)v16);

              if (isEqual)
              {
LABEL_45:
                uint64_t v20 = objc_msgSend_cluster(v105, v9, v10);
                if (!v20) {
                  goto LABEL_15;
                }
                int v21 = objc_msgSend_cluster(v105, v9, v19);
                char v24 = objc_msgSend_cluster(v11, v22, v23);
                char v26 = objc_msgSend_isEqual_(v21, v25, (uint64_t)v24);

                if (v26)
                {
LABEL_15:
                  id v102 = objc_msgSend__clusterDataForPath_(v99, v9, (uint64_t)v11);
                  long long v29 = objc_msgSend_attribute(v105, v27, v28);
                  BOOL v30 = v29 == 0;

                  if (v30)
                  {
                    long long v113 = 0u;
                    long long v114 = 0u;
                    long long v111 = 0u;
                    long long v112 = 0u;
                    long long v42 = objc_msgSend_attributes(v102, v31, v32);
                    uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v52, (uint64_t)&v111, v126, 16);
                    if (v55)
                    {
                      uint64_t v56 = *(void *)v112;
                      do
                      {
                        for (uint64_t j = 0; j != v55; ++j)
                        {
                          if (*(void *)v112 != v56) {
                            objc_enumerationMutation(v42);
                          }
                          uint64_t v58 = *(void *)(*((void *)&v111 + 1) + 8 * j);
                          v59 = objc_msgSend_endpoint(v11, v53, v54);
                          uint64_t v62 = objc_msgSend_cluster(v11, v60, v61);
                          uint64_t v64 = objc_msgSend_attributePathWithEndpointID_clusterID_attributeID_(MTRAttributePath, v63, (uint64_t)v59, v62, v58);
                          objc_msgSend_addObject_(v106, v65, (uint64_t)v64);
                        }
                        uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v53, (uint64_t)&v111, v126, 16);
                      }
                      while (v55);
                    }
LABEL_25:
                  }
                  else
                  {
                    uint64_t v33 = objc_msgSend_attributes(v102, v31, v32);
                    uint64_t v36 = objc_msgSend_attribute(v105, v34, v35);
                    uint64_t v38 = objc_msgSend_objectForKey_(v33, v37, (uint64_t)v36);
                    BOOL v39 = v38 == 0;

                    if (!v39)
                    {
                      long long v42 = objc_msgSend_endpoint(v11, v40, v41);
                      id v45 = objc_msgSend_cluster(v11, v43, v44);
                      id v48 = objc_msgSend_attribute(v105, v46, v47);
                      id v50 = objc_msgSend_attributePathWithEndpointID_clusterID_attributeID_(MTRAttributePath, v49, (uint64_t)v42, v45, v48);
                      objc_msgSend_addObject_(v106, v51, (uint64_t)v50);

                      goto LABEL_25;
                    }
                  }
                }
              }
              id v103 = (char *)v103 + 1;
            }
            while (v103 != v101);
            uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v98, v9, (uint64_t)&v115, v127, 16);
          }
          while (v8);
        }
      }
      uint64_t v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v119, v128, 16);
    }
    while (v94);
  }

  os_unfair_lock_unlock(lock);
  uint64_t v66 = (void *)MEMORY[0x263EFF980];
  uint64_t v69 = objc_msgSend_count(v106, v67, v68);
  uint64_t v71 = objc_msgSend_arrayWithCapacity_(v66, v70, v69);
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v104 = v106;
  uint64_t v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v72, (uint64_t)&v107, v125, 16);
  if (v75)
  {
    uint64_t v76 = *(void *)v108;
    do
    {
      for (uint64_t k = 0; k != v75; ++k)
      {
        if (*(void *)v108 != v76) {
          objc_enumerationMutation(v104);
        }
        uint64_t v78 = *(void **)(*((void *)&v107 + 1) + 8 * k);
        id v79 = objc_msgSend_endpoint(v78, v73, v74);
        uint64_t v82 = objc_msgSend_cluster(v78, v80, v81);
        uint64_t v85 = objc_msgSend_attribute(v78, v83, v84);
        id v87 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v99, v86, (uint64_t)v79, v82, v85, 0);

        if (v87)
        {
          v123[0] = @"attributePath";
          v123[1] = @"data";
          v124[0] = v78;
          v124[1] = v87;
          id v89 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v88, (uint64_t)v124, v123, 2);
          objc_msgSend_addObject_(v71, v90, (uint64_t)v89);
        }
      }
      uint64_t v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v73, (uint64_t)&v107, v125, 16);
    }
    while (v75);
  }

  return v71;
}

- (void)_invokeCommandWithEndpointID:(id)a3 clusterID:(id)a4 commandID:(id)a5 commandFields:(id)a6 expectedValues:(id)a7 expectedValueInterval:(id)a8 timedInvokeTimeout:(id)a9 serverSideProcessingTimeout:(id)a10 queue:(id)a11 completion:(id)a12
{
  uint64_t v123 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v99 = a4;
  id v100 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v97 = a12;
  if (!v20 || (uint64_t v25 = v19, objc_msgSend_compare_(v20, v24, (uint64_t)&unk_26F9CD720) == -1))
  {
    uint64_t v25 = 0;
  }
  else
  {
    sub_2446BE6EC(v20, &unk_26F9CD6D8, &unk_26F9CD708);
    id v19 = v20;
    id v20 = (id)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v28 = objc_msgSend_copy(v22, v26, v27);
  __int16 v31 = objc_msgSend_copy(v21, v29, v30);

  id v101 = objc_msgSend_copy(v18, v32, v33);
  uint64_t v94 = v20;
  id v96 = (void *)v28;
  if (v31) {
    goto LABEL_8;
  }
  if (sub_244BDA134(v99, v100))
  {
    __int16 v31 = &unk_26F9CD738;
LABEL_8:
    uint64_t v36 = (void *)MEMORY[0x263EFF910];
    objc_msgSend_doubleValue(v31, v34, v35);
    id v98 = objc_msgSend_dateWithTimeIntervalSinceNow_(v36, v38, v39, v37 / 1000.0);
    goto LABEL_9;
  }
  __int16 v31 = 0;
  id v98 = 0;
LABEL_9:
  uint64_t v95 = v31;
  uint64_t v121 = 0;
  if (v25)
  {
    objc_msgSend_setExpectedValues_expectedValueInterval_expectedValueID_(self, v34, (uint64_t)v25, v20, &v121);
    long long v42 = objc_msgSend_array(MEMORY[0x263EFF980], v40, v41);
    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    id v43 = v25;
    uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v117, v122, 16);
    if (v46)
    {
      uint64_t v47 = *(void *)v118;
      do
      {
        uint64_t v48 = 0;
        do
        {
          if (*(void *)v118 != v47) {
            objc_enumerationMutation(v43);
          }
          __int16 v49 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*((void *)&v117 + 1) + 8 * v48), v45, @"attributePath");
          objc_msgSend_addObject_(v42, v50, (uint64_t)v49);

          ++v48;
        }
        while (v46 != v48);
        uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v45, (uint64_t)&v117, v122, 16);
      }
      while (v46);
    }
  }
  else
  {
    long long v42 = 0;
  }
  id v51 = [MTRAsyncWorkItem alloc];
  uint64_t v54 = objc_msgSend_queue(self, v52, v53);
  uint64_t v56 = objc_msgSend_initWithQueue_(v51, v55, (uint64_t)v54);

  id v93 = v56;
  uint64_t v59 = objc_msgSend_uniqueID(v56, v57, v58);
  objc_msgSend_setDuplicateTypeID_handler_(v56, v60, 1, &unk_26F952860);
  v103[0] = MEMORY[0x263EF8330];
  v103[1] = 3221225472;
  v103[2] = sub_244C8E6D0;
  v103[3] = &unk_26519B620;
  id v89 = v23;
  id v104 = v89;
  id v90 = v97;
  id v114 = v90;
  id v86 = v25;
  id v105 = v86;
  id v92 = v42;
  id v106 = v92;
  uint64_t v115 = v121;
  id v87 = v95;
  id v107 = v87;
  id v91 = v98;
  id v108 = v91;
  id v61 = v17;
  id v109 = v61;
  id v62 = v99;
  id v110 = v62;
  id v63 = v100;
  id v111 = v63;
  id v64 = v101;
  id v112 = v64;
  id v88 = v96;
  id v113 = v88;
  uint64_t v116 = v59;
  objc_msgSend_setReadyHandler_(v56, v65, (uint64_t)v103);
  asyncWorkQueue = self->_asyncWorkQueue;
  uint64_t v69 = objc_msgSend_unsignedLongLongValue(v62, v67, v68);
  uint64_t v72 = objc_msgSend_unsignedLongLongValue(v62, v70, v71);
  uint64_t v74 = MTRClusterNameForID(v72, v73);
  uint64_t v77 = objc_msgSend_unsignedLongLongValue(v63, v75, v76);
  uint64_t v80 = objc_msgSend_unsignedLongLongValue(v62, v78, v79);
  uint64_t v83 = (const char *)objc_msgSend_unsignedLongLongValue(v63, v81, v82);
  uint64_t v84 = MTRRequestCommandNameForID(v80, v83);
  objc_msgSend_enqueueWorkItem_descriptionWithFormat_(asyncWorkQueue, v85, (uint64_t)v93, @"invoke %@ 0x%llx (%@) 0x%llx (%@): %@", v61, v69, v74, v77, v84, v64);
}

- (void)openCommissioningWindowWithSetupPasscode:(id)a3 discriminator:(id)a4 duration:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v20 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v18 = objc_msgSend_newBaseDevice(self, v16, v17);
  objc_msgSend_openCommissioningWindowWithSetupPasscode_discriminator_duration_queue_completion_(v18, v19, (uint64_t)v20, v12, v13, v14, v15);
}

- (void)openCommissioningWindowWithDiscriminator:(id)a3 duration:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v15 = objc_msgSend_newBaseDevice(self, v13, v14);
  objc_msgSend_openCommissioningWindowWithDiscriminator_duration_queue_completion_(v15, v16, (uint64_t)v17, v10, v11, v12);
}

- (void)downloadLogOfType:(int64_t)a3 timeout:(double)a4 queue:(id)a5 completion:(id)a6
{
  id v15 = a5;
  id v10 = a6;
  id v13 = objc_msgSend_newBaseDevice(self, v11, v12);
  objc_msgSend_downloadLogOfType_timeout_queue_completion_(v13, v14, a3, v15, v10, a4);
}

- (void)_checkExpiredExpectedValues
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(&self->super._lock);
  id v63 = objc_msgSend_date(MEMORY[0x263EFF910], v3, v4);
  id v61 = objc_msgSend_set(MEMORY[0x263EFF9C0], v5, v6);
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  uint64_t v7 = self->_expectedValueCache;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v71, v83, 16);
  if (!v10)
  {
    id v64 = 0;
    goto LABEL_17;
  }
  id v64 = 0;
  uint64_t v11 = *(void *)v72;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v72 != v11) {
        objc_enumerationMutation(v7);
      }
      uint64_t v13 = *(void *)(*((void *)&v71 + 1) + 8 * i);
      uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(self->_expectedValueCache, v9, v13);
      id v17 = objc_msgSend_objectAtIndexedSubscript_(v14, v15, 0);
      if (v14)
      {
        if (objc_msgSend_compare_(v63, v16, (uint64_t)v17) == 1)
        {
          v82[0] = v13;
          id v19 = objc_msgSend_objectAtIndexedSubscript_(v14, v18, 1);
          v82[1] = v19;
          id v21 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v20, (uint64_t)v82, 2);
          objc_msgSend_addObject_(v61, v22, (uint64_t)v21);

LABEL_12:
          goto LABEL_13;
        }
        id v19 = v64;
        if (!v64 || (id v19 = v64, objc_msgSend_compare_(v64, v18, (uint64_t)v17) == 1))
        {
          id v64 = v17;
          goto LABEL_12;
        }
      }
LABEL_13:
    }
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v71, v83, 16);
  }
  while (v10);
LABEL_17:

  uint64_t v60 = objc_msgSend_array(MEMORY[0x263EFF980], v23, v24);
  uint64_t v59 = objc_msgSend_array(MEMORY[0x263EFF980], v25, v26);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = v61;
  uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v67, v81, 16);
  if (v29)
  {
    uint64_t v30 = *(void *)v68;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v68 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = *(void **)(*((void *)&v67 + 1) + 8 * j);
        uint64_t v33 = objc_msgSend_objectAtIndexedSubscript_(v32, v28, 0);
        uint64_t v35 = objc_msgSend_objectAtIndexedSubscript_(v32, v34, 1);
        uint64_t v38 = objc_msgSend__cachedAttributeValueForPath_(self, v36, (uint64_t)v33);
        if (v38 && (objc_msgSend__attributeDataValue_isEqualToDataValue_(self, v37, (uint64_t)v35, v38) & 1) == 0)
        {
          v79[0] = @"attributePath";
          v79[1] = @"data";
          v80[0] = v33;
          v80[1] = v38;
          v79[2] = @"previousData";
          v80[2] = v35;
          uint64_t v39 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v37, (uint64_t)v80, v79, 3);
          objc_msgSend_addObject_(v60, v40, (uint64_t)v39);

          objc_msgSend_addObject_(v59, v41, (uint64_t)v33);
        }
        objc_msgSend_setObject_forKeyedSubscript_(self->_expectedValueCache, v37, 0, v33);
      }
      uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v67, v81, 16);
    }
    while (v29);
  }

  long long v42 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v76 = self;
    __int16 v77 = 2112;
    uint64_t v78 = v59;
    _os_log_impl(&dword_2446BD000, v42, OS_LOG_TYPE_DEFAULT, "%@ report from expired expected values %@", buf, 0x16u);
  }

  if (sub_244CC4E58(2u))
  {
    id v57 = self;
    uint64_t v58 = v59;
    sub_244CC4DE0(0, 2);
  }
  objc_msgSend__reportAttributes_(self, v43, (uint64_t)v60, v57, v58);
  if (v64
    && objc_msgSend_count(self->_expectedValueCache, v44, v45)
    && (objc_msgSend_expirationCheckScheduled(self, v46, v47) & 1) == 0)
  {
    objc_msgSend_timeIntervalSinceDate_(v64, v48, (uint64_t)v63);
    double v50 = v49;
    BOOL v51 = v49 < 0.1;
    objc_initWeak((id *)buf, self);
    double v52 = v50 * 1000000000.0;
    if (v51) {
      double v52 = 100000000.0;
    }
    dispatch_time_t v53 = dispatch_time(0, (uint64_t)v52);
    uint64_t v56 = objc_msgSend_queue(self, v54, v55);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_244C8F660;
    block[3] = &unk_265194F70;
    objc_copyWeak(&v66, (id *)buf);
    dispatch_after(v53, v56, block);

    objc_destroyWeak(&v66);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_performScheduledExpirationCheck
{
  p_locuint64_t k = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend_setExpirationCheckScheduled_(self, v4, 0);
  objc_msgSend__checkExpiredExpectedValues(self, v5, v6);

  os_unfair_lock_unlock(p_lock);
}

- (id)_attributeValueDictionaryForAttributePath:(id)a3
{
  id v4 = a3;
  p_locuint64_t k = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  uint64_t v7 = objc_msgSend__lockedAttributeValueDictionaryForAttributePath_(self, v6, (uint64_t)v4);
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)_lockedAttributeValueDictionaryForAttributePath:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->super._lock);
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(self->_expectedValueCache, v5, (uint64_t)v4);
  if (v8)
  {
    id v9 = objc_msgSend_date(MEMORY[0x263EFF910], v6, v7);
    uint64_t v11 = objc_msgSend_objectAtIndexedSubscript_(v8, v10, 0);
    uint64_t v13 = objc_msgSend_compare_(v9, v12, (uint64_t)v11);

    if (v13 != 1)
    {
      id v16 = objc_msgSend_objectAtIndexedSubscript_(v8, v14, 1);

      goto LABEL_12;
    }
    objc_msgSend_setObject_forKeyedSubscript_(self->_expectedValueCache, v14, 0, v4);
  }
  id v15 = objc_msgSend__cachedAttributeValueForPath_(self, v6, (uint64_t)v4);
  id v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    id v18 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = self;
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_impl(&dword_2446BD000, v18, OS_LOG_TYPE_DEFAULT, "%@ _attributeValueDictionaryForAttributePath: could not find cached attribute values for attribute %@", buf, 0x16u);
    }

    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(0, 2);
    }
  }

LABEL_12:

  return v16;
}

- (BOOL)_attributeDataValue:(id)a3 isEqualToDataValue:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  id v9 = (void *)v7;
  if (v6 | v7)
  {
    char isEqual = 0;
    if (v6 && v7)
    {
      uint64_t v11 = objc_msgSend_objectForKeyedSubscript_((void *)v6, v8, @"type");
      uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v9, v12, @"type");
      if (objc_msgSend_isEqual_(v11, v14, (uint64_t)v13))
      {
        id v16 = objc_msgSend_objectForKeyedSubscript_((void *)v6, v15, @"value");
        id v19 = objc_msgSend_objectForKeyedSubscript_(v9, v17, @"value");
        if (v16 == v19)
        {
          char isEqual = 1;
        }
        else
        {
          id v20 = objc_msgSend_objectForKeyedSubscript_((void *)v6, v18, @"value");
          __int16 v22 = objc_msgSend_objectForKeyedSubscript_(v9, v21, @"value");
          char isEqual = objc_msgSend_isEqual_(v20, v23, (uint64_t)v22);
        }
      }
      else
      {
        char isEqual = 0;
      }
    }
  }
  else
  {
    uint64_t v24 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = self;
      _os_log_impl(&dword_2446BD000, v24, OS_LOG_TYPE_ERROR, "%@ attribute data-value comparison does not expect comparing two nil dictionaries", buf, 0xCu);
    }

    char isEqual = 1;
    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
  }

  return isEqual;
}

- (id)_dataValueWithoutDataVersion:(id)a3
{
  v21[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v5 = v3;
  if (v3
    && (objc_msgSend_objectForKeyedSubscript_(v3, v4, @"type"),
        unint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v5, v7, @"value");

    if (v8)
    {
      v20[0] = @"type";
      uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v5, v9, @"type");
      v20[1] = @"value";
      v21[0] = v10;
      uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v5, v11, @"value");
      v21[1] = v12;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v13, (uint64_t)v21, v20, 2);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v18 = @"type";
      id v16 = objc_msgSend_objectForKeyedSubscript_(v5, v9, @"type");
      id v19 = v16;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v17, (uint64_t)&v19, &v18, 1);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v14 = v5;
  }

  return v14;
}

- (void)_noteDataVersion:(id)a3 forClusterPath:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->super._lock);
  id v9 = objc_msgSend__clusterDataForPath_(self, v8, (uint64_t)v7);
  uint64_t v12 = v9;
  if (v9)
  {
    uint64_t v13 = objc_msgSend_dataVersion(v9, v10, v11);
    char isEqualToNumber = objc_msgSend_isEqualToNumber_(v13, v14, (uint64_t)v6);

    if (isEqualToNumber) {
      goto LABEL_11;
    }
    objc_msgSend_setDataVersion_(v12, v16, (uint64_t)v6);
  }
  else
  {
    id v19 = [MTRDeviceClusterData alloc];
    uint64_t v12 = objc_msgSend_initWithDataVersion_attributes_(v19, v20, (uint64_t)v6, 0);
  }
  clusterDataToPersist = self->_clusterDataToPersist;
  if (!clusterDataToPersist)
  {
    objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v17, v18);
    __int16 v22 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    id v23 = self->_clusterDataToPersist;
    self->_clusterDataToPersist = v22;

    clusterDataToPersist = self->_clusterDataToPersist;
  }
  objc_msgSend_setObject_forKeyedSubscript_(clusterDataToPersist, v17, (uint64_t)v12, v7);
  uint64_t v24 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v26 = self;
    __int16 v27 = 2112;
    id v28 = v7;
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_impl(&dword_2446BD000, v24, OS_LOG_TYPE_DEFAULT, "%@ updated DataVersion for %@ to %@", buf, 0x20u);
  }

  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(0, 2);
  }
LABEL_11:
}

- (BOOL)_attributeAffectsDeviceConfiguration:(id)a3
{
  id v3 = a3;
  id v6 = objc_msgSend_cluster(v3, v4, v5);
  uint64_t v9 = objc_msgSend_unsignedLongValue(v6, v7, v8);

  if (v9 != 29
    || (objc_msgSend_attribute(v3, v10, v11),
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        unint64_t v15 = objc_msgSend_unsignedLongValue(v12, v13, v14),
        v12,
        v15 > 3)
    || v15 == 2)
  {
    id v17 = objc_msgSend_attribute(v3, v10, v11);
    uint64_t v20 = objc_msgSend_unsignedLongValue(v17, v18, v19);

    if ((unint64_t)(v20 - 65529) >= 5) {
      LOBYTE(v16) = 0;
    }
    else {
      unsigned int v16 = (0x1Du >> (v20 + 7)) & 1;
    }
  }
  else
  {
    LOBYTE(v16) = 1;
  }

  return v16;
}

- (void)_removeClusters:(id)a3 doRemoveFromDataStore:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->super._lock);
  objc_msgSend_minusSet_(self->_persistedClusters, v7, (uint64_t)v6, v6);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v6;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v31, v35, 16);
  if (v10)
  {
    uint64_t v11 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        objc_msgSend_removeObjectForKey_(self->_persistedClusterData, v9, (uint64_t)v13);
        objc_msgSend_removeObjectForKey_(self->_clusterDataToPersist, v14, (uint64_t)v13);
        if (v4)
        {
          unsigned int v16 = objc_msgSend_deviceController(self, v9, v15);
          uint64_t v19 = objc_msgSend_controllerDataStore(v16, v17, v18);
          __int16 v22 = objc_msgSend_nodeID(self, v20, v21);
          uint64_t v25 = objc_msgSend_endpoint(v13, v23, v24);
          id v28 = objc_msgSend_cluster(v13, v26, v27);
          objc_msgSend_clearStoredClusterDataForNodeID_endpointID_clusterID_(v19, v29, (uint64_t)v22, v25, v28);
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v31, v35, 16);
    }
    while (v10);
  }
}

- (void)_removeAttributes:(id)a3 fromCluster:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->super._lock);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v6;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v25, v29, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v26;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend__removeCachedAttribute_fromCluster_(self, v10, *(void *)(*((void *)&v25 + 1) + 8 * v13++), v7, (void)v25);
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v25, v29, 16);
    }
    while (v11);
  }

  objc_msgSend_removeObjectForKey_(self->_persistedClusterData, v14, (uint64_t)v7);
  id v17 = objc_msgSend_deviceController(self, v15, v16);
  uint64_t v20 = objc_msgSend_controllerDataStore(v17, v18, v19);
  id v23 = objc_msgSend_nodeID(self, v21, v22);
  objc_msgSend_removeAttributes_fromCluster_forNodeID_(v20, v24, (uint64_t)v8, v7, v23);
}

- (void)_pruneEndpointsIn:(id)a3 missingFrom:(id)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v48 = a4;
  id v6 = (void *)MEMORY[0x263EFF9C0];
  id v8 = objc_msgSend_arrayOfNumbersFromAttributeValue_(self, v7, (uint64_t)a3);
  uint64_t v47 = objc_msgSend_setWithArray_(v6, v9, (uint64_t)v8);

  uint64_t v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v12 = objc_msgSend_arrayOfNumbersFromAttributeValue_(self, v11, (uint64_t)v48);
  uint64_t v14 = objc_msgSend_setWithArray_(v10, v13, (uint64_t)v12);

  uint64_t v46 = (void *)v14;
  objc_msgSend_minusSet_(v47, v15, v14);
  double v52 = self;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v47;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v58, v63, 16);
  if (v17)
  {
    uint64_t v50 = *(void *)v59;
    do
    {
      uint64_t v51 = v17;
      for (uint64_t i = 0; i != v51; ++i)
      {
        if (*(void *)v59 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v58 + 1) + 8 * i);
        id v20 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        uint64_t v21 = v52->_persistedClusters;
        uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v54, v62, 16);
        if (v25)
        {
          uint64_t v26 = *(void *)v55;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v55 != v26) {
                objc_enumerationMutation(v21);
              }
              long long v28 = *(void **)(*((void *)&v54 + 1) + 8 * j);
              __int16 v29 = objc_msgSend_endpoint(v28, v23, v24);
              int isEqualToNumber = objc_msgSend_isEqualToNumber_(v29, v30, v19);

              if (isEqualToNumber) {
                objc_msgSend_addObject_(v20, v23, (uint64_t)v28);
              }
            }
            uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v54, v62, 16);
          }
          while (v25);
        }

        objc_msgSend__removeClusters_doRemoveFromDataStore_(v52, v32, (uint64_t)v20, 0);
        uint64_t v35 = objc_msgSend_deviceController(v52, v33, v34);
        uint64_t v38 = objc_msgSend_controllerDataStore(v35, v36, v37);
        uint64_t v41 = objc_msgSend_nodeID(v52, v39, v40);
        objc_msgSend_clearStoredClusterDataForNodeID_endpointID_(v38, v42, (uint64_t)v41, v19);

        deviceController = v52->super._deviceController;
        v53[0] = MEMORY[0x263EF8330];
        v53[1] = 3221225472;
        v53[2] = sub_244C90964;
        v53[3] = &unk_265193DC8;
        v53[4] = v52;
        v53[5] = v19;
        objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(deviceController, v44, (uint64_t)v53, 0);
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v45, (uint64_t)&v58, v63, 16);
    }
    while (v17);
  }
}

- (void)_pruneClustersIn:(id)a3 missingFrom:(id)a4 forEndpoint:(id)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v43 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v44 = self;
  uint64_t v41 = v8;
  uint64_t v12 = objc_msgSend_arrayOfNumbersFromAttributeValue_(self, v11, (uint64_t)v8);
  uint64_t v14 = objc_msgSend_setWithArray_(v10, v13, (uint64_t)v12);

  uint64_t v15 = (void *)MEMORY[0x263EFFA08];
  uint64_t v17 = objc_msgSend_arrayOfNumbersFromAttributeValue_(self, v16, (uint64_t)v43);
  uint64_t v19 = objc_msgSend_setWithArray_(v15, v18, (uint64_t)v17);

  long long v42 = (void *)v19;
  objc_msgSend_minusSet_(v14, v20, v19);
  id v45 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v21 = self->_persistedClusters;
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v49, v53, 16);
  if (v25)
  {
    uint64_t v26 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v50 != v26) {
          objc_enumerationMutation(v21);
        }
        long long v28 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        __int16 v29 = objc_msgSend_endpoint(v28, v23, v24);
        if (objc_msgSend_isEqualToNumber_(v29, v30, (uint64_t)v9))
        {
          long long v33 = objc_msgSend_cluster(v28, v31, v32);
          int v35 = objc_msgSend_containsObject_(v14, v34, (uint64_t)v33);

          if (v35) {
            objc_msgSend_addObject_(v45, v23, (uint64_t)v28);
          }
        }
        else
        {
        }
      }
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v49, v53, 16);
    }
    while (v25);
  }

  objc_msgSend__removeClusters_doRemoveFromDataStore_(v44, v36, (uint64_t)v45, 1);
  deviceController = v44->super._deviceController;
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = sub_244C90D80;
  v46[3] = &unk_2651995E0;
  v46[4] = v44;
  id v38 = v14;
  id v47 = v38;
  id v39 = v9;
  id v48 = v39;
  objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(deviceController, v40, (uint64_t)v46, 0);
}

- (void)_pruneAttributesIn:(id)a3 missingFrom:(id)a4 forCluster:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v13 = objc_msgSend_arrayOfNumbersFromAttributeValue_(self, v12, (uint64_t)v8);
  uint64_t v15 = objc_msgSend_setWithArray_(v11, v14, (uint64_t)v13);

  uint64_t v16 = (void *)MEMORY[0x263EFFA08];
  uint64_t v18 = objc_msgSend_arrayOfNumbersFromAttributeValue_(self, v17, (uint64_t)v9);
  id v20 = objc_msgSend_setWithArray_(v16, v19, (uint64_t)v18);

  objc_msgSend_minusSet_(v15, v21, (uint64_t)v20);
  objc_msgSend__removeAttributes_fromCluster_(self, v22, (uint64_t)v15, v10);
  deviceController = self->super._deviceController;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = sub_244C910F4;
  v27[3] = &unk_2651995E0;
  v27[4] = self;
  id v24 = v15;
  id v28 = v24;
  id v25 = v10;
  id v29 = v25;
  objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(deviceController, v26, (uint64_t)v27, 0);
}

- (void)_pruneStoredDataForPath:(id)a3 missingFrom:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->super._lock);
  if ((objc_msgSend__dataStoreExists(self, v8, v9) & 1) != 0
    || objc_msgSend_count(self->_clusterDataToPersist, v10, v11))
  {
    uint64_t v12 = objc_msgSend_cluster(v6, v10, v11);
    uint64_t v15 = objc_msgSend_unsignedLongValue(v12, v13, v14);

    if (v15 == 29)
    {
      uint64_t v18 = objc_msgSend_attribute(v6, v16, v17);
      if (objc_msgSend_unsignedLongValue(v18, v19, v20) == 3)
      {
        id v23 = objc_msgSend_endpoint(v6, v21, v22);
        int isEqualToNumber = objc_msgSend_isEqualToNumber_(v23, v24, (uint64_t)&unk_26F9CD690);

        if (isEqualToNumber)
        {
          id v28 = objc_msgSend__cachedAttributeValueForPath_(self, v26, (uint64_t)v6);
          objc_msgSend__pruneEndpointsIn_missingFrom_(self, v29, (uint64_t)v28, v7);
LABEL_13:

          goto LABEL_14;
        }
      }
      else
      {
      }
      uint64_t v30 = objc_msgSend_attribute(v6, v26, v27);
      uint64_t v33 = objc_msgSend_unsignedLongValue(v30, v31, v32);

      if (v33 == 1)
      {
        id v28 = objc_msgSend__cachedAttributeValueForPath_(self, v16, (uint64_t)v6);
        uint64_t v36 = objc_msgSend_endpoint(v6, v34, v35);
        objc_msgSend__pruneClustersIn_missingFrom_forEndpoint_(self, v37, (uint64_t)v28, v7, v36);
LABEL_12:

        goto LABEL_13;
      }
    }
    id v38 = objc_msgSend_attribute(v6, v16, v17);
    uint64_t v41 = objc_msgSend_unsignedLongValue(v38, v39, v40);

    if (v41 == 65531)
    {
      id v28 = objc_msgSend__cachedAttributeValueForPath_(self, v42, (uint64_t)v6);
      uint64_t v36 = objc_msgSend_endpoint(v6, v43, v44);
      id v47 = objc_msgSend_cluster(v6, v45, v46);
      long long v49 = objc_msgSend_clusterPathWithEndpointID_clusterID_(MTRClusterPath, v48, (uint64_t)v36, v47);
      objc_msgSend__pruneAttributesIn_missingFrom_forCluster_(self, v50, (uint64_t)v28, v7, v49);

      goto LABEL_12;
    }
  }
  else
  {
    long long v51 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      dispatch_time_t v53 = self;
      _os_log_impl(&dword_2446BD000, v51, OS_LOG_TYPE_INFO, "%@ No data store to prune from", buf, 0xCu);
    }

    if (sub_244CC4E58(3u)) {
      sub_244CC4DE0(0, 3);
    }
  }
LABEL_14:
}

- (id)_getAttributesToReportWithReportedValues:(id)a3 fromSubscription:(BOOL)a4
{
  BOOL v93 = a4;
  uint64_t v117 = *MEMORY[0x263EF8340];
  id v90 = a3;
  os_unfair_lock_assert_owner(&self->super._lock);
  objc_msgSend_array(MEMORY[0x263EFF980], v5, v6);
  id v94 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v95 = objc_msgSend_array(MEMORY[0x263EFF980], v7, v8);
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id obj = v90;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v102, v116, 16);
  if (v10)
  {
    uint64_t v100 = *(void *)v103;
    do
    {
      uint64_t v101 = v10;
      for (uint64_t i = 0; i != v101; ++i)
      {
        if (*(void *)v103 != v100) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v102 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v13, v11, @"attributePath", v85, *(void *)&v86);
        uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v13, v15, @"data");
        uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v13, v17, @"error");
        if (v16 | v19)
        {
          if (self->_receivingReport && sub_244C88CF4(v14)) {
            self->_receivingPrimingReport = 1;
          }
          if (v19)
          {
            uint64_t v20 = objc_msgSend__cachedAttributeValueForPath_(self, v18, (uint64_t)v14);
            uint64_t v21 = sub_244CC8484(0, "NotSpecified");
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend_objectForKeyedSubscript_(self->_expectedValueCache, v22, (uint64_t)v14);
              id v23 = (NSDate *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              id v107 = self;
              __int16 v108 = 2112;
              double v109 = *(double *)&v14;
              __int16 v110 = 2112;
              uint64_t v111 = v19;
              __int16 v112 = 2112;
              id v113 = v23;
              __int16 v114 = 2112;
              uint64_t v115 = v20;
              _os_log_impl(&dword_2446BD000, v21, OS_LOG_TYPE_ERROR, "%@ report %@ error %@ purge expected value %@ read cache %@", buf, 0x34u);
            }
            if (sub_244CC4E58(1u))
            {
              id v88 = objc_msgSend_objectForKeyedSubscript_(self->_expectedValueCache, v24, (uint64_t)v14);
              uint64_t v89 = v20;
              double v86 = *(double *)&v14;
              id v87 = (void *)v19;
              uint64_t v85 = self;
              sub_244CC4DE0(0, 1);
            }
            objc_msgSend_setObject_forKeyedSubscript_(self->_expectedValueCache, v24, 0, v14, v85, *(void *)&v86, v87, v88, v89);
            objc_msgSend__setCachedAttributeValue_forPath_fromSubscription_(self, v25, 0, v14, v93);
            id v28 = (void *)v20;
LABEL_57:
            if (v28)
            {
              __int16 v77 = objc_msgSend_mutableCopy(v13, v26, v27);
              objc_msgSend_setObject_forKeyedSubscript_(v77, v78, (uint64_t)v28, @"previousData");
              objc_msgSend_addObject_(v94, v79, (uint64_t)v77);
            }
            else
            {
              objc_msgSend_addObject_(v94, v26, (uint64_t)v13);
            }
            objc_msgSend_addObject_(v95, v80, (uint64_t)v14, v85, *(void *)&v86);
            goto LABEL_61;
          }
          id v98 = objc_msgSend_objectForKeyedSubscript_((void *)v16, v18, @"dataVersion");
          uint64_t v32 = objc_msgSend_endpoint(v14, v30, v31);
          uint64_t v35 = objc_msgSend_cluster(v14, v33, v34);
          id v96 = objc_msgSend_clusterPathWithEndpointID_clusterID_(MTRClusterPath, v36, (uint64_t)v32, v35);

          if (v98)
          {
            objc_msgSend__noteDataVersion_forClusterPath_(self, v37, (uint64_t)v98, v96);
            uint64_t v39 = objc_msgSend__dataValueWithoutDataVersion_(self, v38, v16);

            uint64_t v16 = v39;
          }
          id v28 = objc_msgSend__cachedAttributeValueForPath_(self, v37, (uint64_t)v14);
          char isEqualToDataValue = objc_msgSend__attributeDataValue_isEqualToDataValue_(self, v40, v16, v28);
          if ((isEqualToDataValue & 1) == 0)
          {
            objc_msgSend__pruneStoredDataForPath_missingFrom_(self, v41, (uint64_t)v14, v16);
            if (!self->_deviceConfigurationChanged)
            {
              int v44 = objc_msgSend__attributeAffectsDeviceConfiguration_(self, v43, (uint64_t)v14);
              self->_deviceConfigurationChanged = v44;
              if (v44)
              {
                id v45 = sub_244CC8484(0, "NotSpecified");
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  id v107 = self;
                  __int16 v108 = 2112;
                  double v109 = *(double *)&v14;
                  _os_log_impl(&dword_2446BD000, v45, OS_LOG_TYPE_DEFAULT, "%@ device configuration changed due to changes in attribute %@", buf, 0x16u);
                }

                if (sub_244CC4E58(2u))
                {
                  uint64_t v85 = self;
                  double v86 = *(double *)&v14;
                  sub_244CC4DE0(0, 2);
                }
              }
            }
            objc_msgSend__setCachedAttributeValue_forPath_fromSubscription_(self, v43, v16, v14, v93, v85, *(void *)&v86);
          }
          id v99 = objc_msgSend_objectForKeyedSubscript_(self->_expectedValueCache, v41, (uint64_t)v14);
          if (v99) {
            char v48 = 1;
          }
          else {
            char v48 = isEqualToDataValue;
          }
          char v92 = v48;
          if (v48)
          {
            if (v99)
            {
              long long v49 = sub_244CC8484(0, "NotSpecified");
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v107 = self;
                __int16 v108 = 2112;
                double v109 = *(double *)&v14;
                _os_log_impl(&dword_2446BD000, v49, OS_LOG_TYPE_DEFAULT, "%@ report %@ value filtered - expected value still present", buf, 0x16u);
              }

              if (sub_244CC4E58(2u)) {
                goto LABEL_43;
              }
            }
            else
            {
              long long v50 = sub_244CC8484(0, "NotSpecified");
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v107 = self;
                __int16 v108 = 2112;
                double v109 = *(double *)&v14;
                _os_log_impl(&dword_2446BD000, v50, OS_LOG_TYPE_DEFAULT, "%@ report %@ value filtered - same as read cache", buf, 0x16u);
              }

              if (sub_244CC4E58(2u))
              {
LABEL_43:
                uint64_t v85 = self;
                double v86 = *(double *)&v14;
                sub_244CC4DE0(0, 2);
              }
            }
          }
          long long v51 = objc_msgSend_cluster(v14, v46, v47, v85, *(void *)&v86);
          if (objc_msgSend_unsignedLongValue(v51, v52, v53) == 51)
          {
            long long v56 = objc_msgSend_attribute(v14, v54, v55);
            BOOL v59 = objc_msgSend_unsignedLongValue(v56, v57, v58) == 2;

            if (v59)
            {
              long long v61 = objc_msgSend_objectForKeyedSubscript_((void *)v16, v60, @"type");
              int isEqual = objc_msgSend_isEqual_(v61, v62, @"UnsignedInteger");

              if (isEqual)
              {
                long long v51 = objc_msgSend_objectForKeyedSubscript_((void *)v16, v64, @"value");
                double v67 = (double)(unint64_t)objc_msgSend_unsignedLongLongValue(v51, v65, v66);
                objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x263EFF910], v68, v69, -v67);
                long long v70 = (NSDate *)objc_claimAutoreleasedReturnValue();
                id v91 = self->_estimatedStartTime;
                estimatedStartTime = self->_estimatedStartTime;
                if (!estimatedStartTime || objc_msgSend_compare_(v70, v71, (uint64_t)estimatedStartTime) == -1)
                {
                  long long v73 = sub_244CC8484(0, "NotSpecified");
                  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138413058;
                    id v107 = self;
                    __int16 v108 = 2048;
                    double v109 = v67;
                    __int16 v110 = 2112;
                    uint64_t v111 = (uint64_t)v91;
                    __int16 v112 = 2112;
                    id v113 = v70;
                    _os_log_impl(&dword_2446BD000, v73, OS_LOG_TYPE_DEFAULT, "%@ General Diagnostics UpTime %.3lf: estimated start time %@ => %@", buf, 0x2Au);
                  }

                  if (sub_244CC4E58(2u))
                  {
                    id v87 = v91;
                    id v88 = v70;
                    double v86 = v67;
                    uint64_t v85 = self;
                    sub_244CC4DE0(0, 2);
                  }
                  objc_storeStrong((id *)&self->_estimatedStartTime, v70);
                }
                long long v74 = v70;
                estimatedStartTimeFromGeneralDiagnosticsUpTime = self->_estimatedStartTimeFromGeneralDiagnosticsUpTime;
                self->_estimatedStartTimeFromGeneralDiagnosticsUpTime = v74;
                uint64_t v76 = v74;

                goto LABEL_55;
              }
            }
          }
          else
          {
LABEL_55:
          }
          if (v92) {
            goto LABEL_61;
          }
          goto LABEL_57;
        }
        id v29 = sub_244CC8484(0, "NotSpecified");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v107 = self;
          __int16 v108 = 2112;
          double v109 = *(double *)&v14;
          __int16 v110 = 2112;
          uint64_t v111 = (uint64_t)v13;
          _os_log_impl(&dword_2446BD000, v29, OS_LOG_TYPE_DEFAULT, "%@ report %@ no data value or error: %@", buf, 0x20u);
        }

        if (sub_244CC4E58(2u))
        {
          uint64_t v16 = 0;
          double v86 = *(double *)&v14;
          id v87 = v13;
          uint64_t v85 = self;
          sub_244CC4DE0(0, 2);
          id v28 = 0;
        }
        else
        {
          id v28 = 0;
          uint64_t v16 = 0;
        }
LABEL_61:
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v102, v116, 16);
    }
    while (v10);
  }

  if (objc_msgSend_count(v95, v81, v82))
  {
    uint64_t v83 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v107 = self;
      __int16 v108 = 2112;
      double v109 = *(double *)&v95;
      _os_log_impl(&dword_2446BD000, v83, OS_LOG_TYPE_DEFAULT, "%@ report from reported values %@", buf, 0x16u);
    }

    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(0, 2);
    }
  }

  return v94;
}

- (id)getAllAttributesReport
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  locuint64_t k = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend_array(MEMORY[0x263EFF980], v3, v4);
  id v39 = (id)objc_claimAutoreleasedReturnValue();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  objc_msgSend__knownClusters(self, v5, v6);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v44, v51, 16);
  if (v35)
  {
    uint64_t v34 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v45 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend__clusterDataForPath_(self, v8, (uint64_t)v9);
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        uint64_t v36 = v10;
        objc_msgSend_attributes(v10, v11, v12);
        id v38 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v13, (uint64_t)&v40, v50, 16);
        if (v16)
        {
          uint64_t v17 = *(void *)v41;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v41 != v17) {
                objc_enumerationMutation(v38);
              }
              uint64_t v19 = *(void *)(*((void *)&v40 + 1) + 8 * j);
              uint64_t v20 = objc_msgSend_endpoint(v9, v14, v15);
              id v23 = objc_msgSend_cluster(v9, v21, v22);
              id v25 = objc_msgSend_attributePathWithEndpointID_clusterID_attributeID_(MTRAttributePath, v24, (uint64_t)v20, v23, v19);

              v48[1] = @"data";
              v49[0] = v25;
              v48[0] = @"attributePath";
              uint64_t v27 = objc_msgSend__lockedAttributeValueDictionaryForAttributePath_(self, v26, (uint64_t)v25);
              v49[1] = v27;
              id v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v28, (uint64_t)v49, v48, 2);
              objc_msgSend_addObject_(v39, v30, (uint64_t)v29);
            }
            uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v14, (uint64_t)&v40, v50, 16);
          }
          while (v16);
        }
      }
      uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v44, v51, 16);
    }
    while (v35);
  }

  os_unfair_lock_unlock(lock);

  return v39;
}

- (void)setPersistedClusterData:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v24 = a3;
  uint64_t v4 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v31 = self;
    __int16 v32 = 2048;
    uint64_t v33 = objc_msgSend_count(v24, v5, v6);
    _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_DEFAULT, "%@ setPersistedClusterData count: %lu", buf, 0x16u);
  }

  if (sub_244CC4E58(2u))
  {
    uint64_t v22 = self;
    uint64_t v23 = objc_msgSend_count(v24, v7, v8);
    sub_244CC4DE0(0, 2);
  }
  if (objc_msgSend_count(v24, v7, v8, v22, v23))
  {
    os_unfair_lock_lock(&self->super._lock);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = v24;
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v25, v29, 16);
    if (v12)
    {
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          objc_msgSend_addObject_(self->_persistedClusters, v11, v15);
          persistedClusterData = self->_persistedClusterData;
          uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v9, v17, v15);
          objc_msgSend_setObject_forKey_(persistedClusterData, v19, (uint64_t)v18, v15);
        }
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v25, v29, 16);
      }
      while (v12);
    }

    objc_msgSend__updateAttributeDependentDescriptionData(self, v20, v21);
    self->_deviceCachePrimed = 1;
    os_unfair_lock_unlock(&self->super._lock);
  }
}

- (void)_setLastInitialSubscribeLatency:(id)a3
{
  id v5 = a3;
  os_unfair_lock_assert_owner(&self->super._lock);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_estimatedSubscriptionLatency, a3);
  }
}

- (void)setPersistedDeviceData:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_2446BD000, v5, OS_LOG_TYPE_INFO, "%@ setPersistedDeviceData: %@", buf, 0x16u);
  }

  if (sub_244CC4E58(3u)) {
    sub_244CC4DE0(0, 3);
  }
  os_unfair_lock_lock(&self->super._lock);
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v4, v6, @"lastInitialSubscribeLatency");
  if (v8) {
    objc_msgSend__setLastInitialSubscribeLatency_(self, v7, (uint64_t)v8);
  }

  os_unfair_lock_unlock(&self->super._lock);
}

- (void)_storePersistedDeviceData
{
  os_unfair_lock_assert_owner(&self->super._lock);
  objc_msgSend_controllerDataStore(self->super._deviceController, v3, v4);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    id v7 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v5, v6);
    id v9 = v7;
    estimatedSubscriptionLatency = self->_estimatedSubscriptionLatency;
    if (estimatedSubscriptionLatency) {
      objc_msgSend_setObject_forKeyedSubscript_(v7, v8, (uint64_t)estimatedSubscriptionLatency, @"lastInitialSubscribeLatency");
    }
    __int16 v11 = objc_msgSend_copy(v9, v8, (uint64_t)estimatedSubscriptionLatency);
    uint64_t v14 = objc_msgSend_nodeID(self, v12, v13);
    objc_msgSend_storeDeviceData_forNodeID_(v16, v15, (uint64_t)v11, v14);
  }
}

- (BOOL)deviceCachePrimed
{
  uint64_t v2 = self;
  p_locuint64_t k = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  LOBYTE(v2) = v2->_deviceCachePrimed;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_setExpectedValue:(id)a3 attributePath:(id)a4 expirationTime:(id)a5 shouldReportValue:(BOOL *)a6 attributeValueToReport:(id *)a7 expectedValueID:(unint64_t)a8 previousValue:(id *)a9
{
  v44[3] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v43 = a5;
  os_unfair_lock_assert_owner(&self->super._lock);
  *a6 = 0;
  uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(self->_expectedValueCache, v16, (uint64_t)v15);
  uint64_t v19 = v17;
  if (v17)
  {
    if (v14)
    {
      uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(v17, v18, 1);
      char isEqualToDataValue = objc_msgSend__attributeDataValue_isEqualToDataValue_(self, v21, (uint64_t)v14, v20);

      if ((isEqualToDataValue & 1) == 0)
      {
        *a6 = 1;
        *a7 = v14;
        objc_msgSend_objectAtIndexedSubscript_(v19, v24, 1);
        *a9 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_16:
      v44[0] = v43;
      v44[1] = v14;
      uint64_t v37 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v23, a8);
      v44[2] = v37;
      id v39 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v38, (uint64_t)v44, 3);
      objc_msgSend_setObject_forKeyedSubscript_(self->_expectedValueCache, v40, (uint64_t)v39, v15);

      goto LABEL_17;
    }
    long long v26 = objc_msgSend_objectAtIndexedSubscript_(v17, v18, 2);
    if (objc_msgSend_unsignedLongLongValue(v26, v28, v29) == a8)
    {
      objc_msgSend__cachedAttributeValueForPath_(self, v30, (uint64_t)v15);
      id v41 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v32 = objc_msgSend_objectAtIndexedSubscript_(v19, v31, 1);
      char v34 = objc_msgSend__attributeDataValue_isEqualToDataValue_(self, v33, (uint64_t)v32, v41);

      if ((v34 & 1) == 0)
      {
        *a6 = 1;
        *a7 = v41;
        objc_msgSend_objectAtIndexedSubscript_(v19, v35, 1);
        *a9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(self->_expectedValueCache, v36, 0, v15);
      }
    }
  }
  else
  {
    long long v26 = objc_msgSend__cachedAttributeValueForPath_(self, v18, (uint64_t)v15);
    if (v14)
    {
      if (objc_msgSend__attributeDataValue_isEqualToDataValue_(self, v25, (uint64_t)v14, v26))
      {
        id v27 = 0;
      }
      else
      {
        *a6 = 1;
        *a7 = v14;
        id v27 = v26;
      }
      *a9 = v27;

      goto LABEL_16;
    }
    *a9 = 0;
  }

LABEL_17:
}

- (id)_getAttributesToReportWithNewExpectedValues:(id)a3 expirationTime:(id)a4 expectedValueID:(unint64_t *)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v37 = a4;
  os_unfair_lock_assert_owner(&self->super._lock);
  unint64_t expectedValueNextID = self->_expectedValueNextID;
  uint64_t v36 = self;
  self->_unint64_t expectedValueNextID = expectedValueNextID + 1;
  objc_msgSend_array(MEMORY[0x263EFF980], v8, v9);
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v33 = objc_msgSend_array(MEMORY[0x263EFF980], v10, v11);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v7;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v40, v52, 16);
  if (v14)
  {
    uint64_t v34 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v41 != v34) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v16, v13, @"attributePath");
        uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v16, v18, @"data");
        buf[0] = 0;
        id v38 = 0;
        id v39 = 0;
        objc_msgSend__setExpectedValue_attributePath_expirationTime_shouldReportValue_attributeValueToReport_expectedValueID_previousValue_(v36, v20, (uint64_t)v19, v17, v37, buf, &v39, expectedValueNextID, &v38);
        id v21 = v39;
        id v22 = v38;
        id v24 = v22;
        if (buf[0])
        {
          if (v22)
          {
            v50[0] = @"attributePath";
            v50[1] = @"data";
            v51[0] = v17;
            v51[1] = v21;
            v50[2] = @"previousData";
            v51[2] = v22;
            objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v23, (uint64_t)v51, v50, 3);
          }
          else
          {
            v48[0] = @"attributePath";
            v48[1] = @"data";
            v49[0] = v17;
            v49[1] = v21;
            objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v23, (uint64_t)v49, v48, 2);
          long long v25 = };
          objc_msgSend_addObject_(v32, v26, (uint64_t)v25);

          objc_msgSend_addObject_(v33, v27, (uint64_t)v17);
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v40, v52, 16);
    }
    while (v14);
  }

  if (a5) {
    *a5 = expectedValueNextID;
  }
  long long v28 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    long long v45 = v36;
    __int16 v46 = 2112;
    long long v47 = v33;
    _os_log_impl(&dword_2446BD000, v28, OS_LOG_TYPE_DEFAULT, "%@ report from new expected values %@", buf, 0x16u);
  }

  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(0, 2);
  }

  return v32;
}

- (void)setExpectedValues:(id)a3 expectedValueInterval:(id)a4 expectedValueID:(unint64_t *)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)MEMORY[0x263EFF910];
  objc_msgSend_doubleValue(v9, v11, v12);
  id v16 = objc_msgSend_dateWithTimeIntervalSinceNow_(v10, v14, v15, v13 / 1000.0);
  uint64_t v17 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_timeIntervalSinceNow(v16, v18, v19);
    *(_DWORD *)buf = 138412802;
    uint64_t v29 = self;
    __int16 v30 = 2112;
    id v31 = v8;
    __int16 v32 = 2048;
    uint64_t v33 = v20;
    _os_log_impl(&dword_2446BD000, v17, OS_LOG_TYPE_DEFAULT, "%@ Setting expected values %@ with expiration time %f seconds from now", buf, 0x20u);
  }

  if (sub_244CC4E58(2u))
  {
    objc_msgSend_timeIntervalSinceNow(v16, v21, v22);
    sub_244CC4DE0(0, 2);
  }
  os_unfair_lock_lock(&self->super._lock);
  id v24 = objc_msgSend__getAttributesToReportWithNewExpectedValues_expirationTime_expectedValueID_(self, v23, (uint64_t)v8, v16, a5);
  objc_msgSend__reportAttributes_(self, v25, (uint64_t)v24);
  objc_msgSend__checkExpiredExpectedValues(self, v26, v27);

  os_unfair_lock_unlock(&self->super._lock);
}

- (void)removeExpectedValuesForAttributePaths:(id)a3 expectedValueID:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  os_unfair_lock_lock(&self->super._lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v13, v17, 16);
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend__removeExpectedValueForAttributePath_expectedValueID_(self, v9, *(void *)(*((void *)&v13 + 1) + 8 * v12++), a4, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v13, v17, 16);
    }
    while (v10);
  }

  os_unfair_lock_unlock(&self->super._lock);
}

- (void)removeExpectedValueForAttributePath:(id)a3 expectedValueID:(unint64_t)a4
{
  p_locuint64_t k = &self->super._lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend__removeExpectedValueForAttributePath_expectedValueID_(self, v8, (uint64_t)v7, a4);

  os_unfair_lock_unlock(p_lock);
}

- (void)_removeExpectedValueForAttributePath:(id)a3 expectedValueID:(unint64_t)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->super._lock);
  char v24 = 0;
  id v22 = 0;
  id v23 = 0;
  objc_msgSend__setExpectedValue_attributePath_expirationTime_shouldReportValue_attributeValueToReport_expectedValueID_previousValue_(self, v7, 0, v6, 0, &v24, &v23, a4, &v22);
  id v8 = v23;
  id v9 = v22;
  uint64_t v10 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    if (v24) {
      uint64_t v11 = @"YES";
    }
    else {
      uint64_t v11 = @"NO";
    }
    uint64_t v27 = self;
    __int16 v28 = 2112;
    id v29 = v6;
    __int16 v30 = 2112;
    id v31 = v11;
    _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_DEFAULT, "%@ remove expected value for path %@ should report %@", buf, 0x20u);
  }

  if (sub_244CC4E58(2u))
  {
    if (v24) {
      long long v13 = @"YES";
    }
    else {
      long long v13 = @"NO";
    }
    id v20 = v6;
    id v21 = v13;
    uint64_t v19 = self;
    sub_244CC4DE0(0, 2);
  }
  if (v24)
  {
    long long v14 = objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x263EFF9A0], v12, (uint64_t)v6, @"attributePath");
    long long v16 = v14;
    if (v8) {
      objc_msgSend_setObject_forKeyedSubscript_(v14, v15, (uint64_t)v8, @"data");
    }
    if (v9) {
      objc_msgSend_setObject_forKeyedSubscript_(v16, v15, (uint64_t)v9, @"previousData");
    }
    long long v25 = v16;
    uint64_t v17 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v15, (uint64_t)&v25, 1, v19, v20, v21);
    objc_msgSend__reportAttributes_(self, v18, (uint64_t)v17);
  }
}

- (id)newBaseDevice
{
  uint64_t v4 = objc_msgSend_nodeID(self, a2, v2);
  id v7 = objc_msgSend_deviceController(self, v5, v6);
  id v9 = objc_msgSend_deviceWithNodeID_controller_(MTRBaseDevice, v8, (uint64_t)v4, v7);

  return v9;
}

- (id)_informationalNumberAtAttributePath:(id)a3
{
  v17[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v6 = objc_msgSend__cachedAttributeValueForPath_(self, v5, (uint64_t)v4);
  if (v6)
  {
    id v7 = [MTRAttributeReport alloc];
    v16[0] = @"attributePath";
    v16[1] = @"data";
    v17[0] = v4;
    v17[1] = v6;
    id v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v8, (uint64_t)v17, v16, 2);
    uint64_t v11 = objc_msgSend_initWithResponseValue_error_(v7, v10, (uint64_t)v9, 0);

    long long v14 = objc_msgSend_value(v11, v12, v13);
  }
  else
  {
    long long v14 = 0;
  }

  return v14;
}

- (id)_informationalVendorID
{
  id v3 = objc_msgSend_attributePathWithEndpointID_clusterID_attributeID_(MTRAttributePath, a2, (uint64_t)&unk_26F9CD690, &unk_26F9CD750, &unk_26F9CD768);
  id v5 = objc_msgSend__informationalNumberAtAttributePath_(self, v4, (uint64_t)v3);

  return v5;
}

- (id)_informationalProductID
{
  id v3 = objc_msgSend_attributePathWithEndpointID_clusterID_attributeID_(MTRAttributePath, a2, (uint64_t)&unk_26F9CD690, &unk_26F9CD750, &unk_26F9CD678);
  id v5 = objc_msgSend__informationalNumberAtAttributePath_(self, v4, (uint64_t)v3);

  return v5;
}

- (void)_addInformationalAttributesToCurrentMetricScope
{
  os_unfair_lock_assert_owner(&self->super._lock);
  id v5 = objc_msgSend__informationalVendorID(self, v3, v4);
  int v17 = 2;
  uint64_t v18 = "dwnfw_device_vendor_id";
  int v19 = objc_msgSend_unsignedShortValue(v5, v6, v7);
  char v20 = 2;

  sub_244D7E78C((uint64_t)&v17);
  uint64_t v10 = objc_msgSend__informationalProductID(self, v8, v9);
  int v13 = objc_msgSend_unsignedShortValue(v10, v11, v12);
  int v17 = 2;
  uint64_t v18 = "dwnfw_device_product_id";
  int v19 = v13;
  char v20 = 2;

  sub_244D7E78C((uint64_t)&v17);
  int v16 = objc_msgSend__deviceUsesThread(self, v14, v15);
  int v17 = 2;
  uint64_t v18 = "dwnfw_device_uses_thread_BOOL";
  int v19 = v16;
  char v20 = 1;
  sub_244D7E78C((uint64_t)&v17);
}

- (BOOL)_attributePathAffectsDescriptionData:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->super._lock);
  uint64_t v7 = objc_msgSend_cluster(v4, v5, v6);
  uint64_t v10 = objc_msgSend_unsignedLongLongValue(v7, v8, v9);

  if (v10 == 40)
  {
    int v17 = objc_msgSend_attribute(v4, v11, v12);
    uint64_t v20 = objc_msgSend_unsignedLongLongValue(v17, v18, v19);

    BOOL v16 = ((v20 - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0;
  }
  else if (v10 == 49)
  {
    int v13 = objc_msgSend_attribute(v4, v11, v12);
    BOOL v16 = objc_msgSend_unsignedLongLongValue(v13, v14, v15) == 65532;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)_updateAttributeDependentDescriptionData
{
  os_unfair_lock_assert_owner(&self->super._lock);
  objc_msgSend__informationalVendorID(self, v3, v4);
  id v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__informationalProductID(self, v6, v7);
  id v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__networkFeatures(self, v9, v10);
  uint64_t v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_descriptionLock);
  vid = self->_vid;
  self->_vid = v5;
  int v13 = v5;

  pid = self->_pid;
  self->_pid = v8;
  uint64_t v15 = v8;

  allNetworkFeatures = self->_allNetworkFeatures;
  self->_allNetworkFeatures = v11;

  os_unfair_lock_unlock(&self->_descriptionLock);
}

- (id)_endpointList
{
  os_unfair_lock_assert_owner(&self->super._lock);
  uint64_t v4 = objc_msgSend__cachedListOfNumbersValueForEndpointID_clusterID_attributeID_(self, v3, (uint64_t)&unk_26F9CD690, &unk_26F9CD630, &unk_26F9CD780);
  uint64_t v7 = objc_msgSend_mutableCopy(v4, v5, v6);
  objc_msgSend_addObject_(v7, v8, (uint64_t)&unk_26F9CD690);

  return v7;
}

- (id)_cachedListOfNumbersValueForEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_assert_owner(&self->super._lock);
  uint64_t v12 = objc_msgSend_attributePathWithEndpointID_clusterID_attributeID_(MTRAttributePath, v11, (uint64_t)v8, v9, v10);
  long long v14 = objc_msgSend__cachedAttributeValueForPath_(self, v13, (uint64_t)v12);
  BOOL v16 = objc_msgSend_arrayOfNumbersFromAttributeValue_(self, v15, (uint64_t)v14);
  uint64_t v19 = v16;
  if (v16)
  {
    id v20 = v16;
  }
  else
  {
    objc_msgSend_array(MEMORY[0x263EFF8C0], v17, v18);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v21 = v20;

  return v21;
}

- (id)_serverListForEndpointID:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->super._lock);
  uint64_t v6 = objc_msgSend__cachedListOfNumbersValueForEndpointID_clusterID_attributeID_(self, v5, (uint64_t)v4, &unk_26F9CD630, &unk_26F9CD648);

  return v6;
}

- (id)_attributeListForEndpointID:(id)a3 clusterID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->super._lock);
  id v9 = objc_msgSend__cachedListOfNumbersValueForEndpointID_clusterID_attributeID_(self, v8, (uint64_t)v6, v7, &unk_26F9CD798);

  return v9;
}

- (id)_networkFeatures
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  objc_msgSend__endpointList(self, a2, v2);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v5 = 0;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v25, v29, 16);
  if (v7)
  {
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = objc_msgSend_attributePathWithEndpointID_clusterID_attributeID_(MTRAttributePath, v6, *(void *)(*((void *)&v25 + 1) + 8 * i), &unk_26F9CD6A8, &unk_26F9CD6C0);
        uint64_t v12 = objc_msgSend__informationalNumberAtAttributePath_(self, v11, (uint64_t)v10);
        uint64_t v15 = v12;
        if (v12)
        {
          if (v5)
          {
            BOOL v16 = NSNumber;
            uint64_t v17 = objc_msgSend_unsignedLongLongValue(v12, v13, v14);
            uint64_t v20 = objc_msgSend_unsignedLongLongValue(v5, v18, v19);
            uint64_t v22 = objc_msgSend_numberWithUnsignedLongLong_(v16, v21, v20 | v17);

            id v5 = (id)v22;
          }
          else
          {
            id v5 = v12;
          }
        }
      }
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v25, v29, 16);
    }
    while (v7);
  }

  return v5;
}

- (void)controllerSuspended
{
  v5.receiver = self;
  v5.super_class = (Class)MTRDevice_Concrete;
  [(MTRDevice *)&v5 controllerSuspended];
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend_setSuspended_(self, v3, 1);
  objc_msgSend__resetSubscriptionWithReasonString_(self, v4, @"Controller suspended");
  self->_reattemptingSubscription = 0;
  os_unfair_lock_unlock(&self->super._lock);
}

- (void)controllerResumed
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)MTRDevice_Concrete;
  [(MTRDevice *)&v8 controllerResumed];
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend_setSuspended_(self, v3, 0);
  if (objc_msgSend__delegateExists(self, v4, v5))
  {
    objc_msgSend__ensureSubscriptionForExistingDelegates_(self, v6, @"Controller resumed");
  }
  else
  {
    uint64_t v7 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = self;
      _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_DEFAULT, "%@ ignoring controller resume: no delegates", buf, 0xCu);
    }

    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(0, 2);
    }
  }
  os_unfair_lock_unlock(&self->super._lock);
}

- (id)_concreteController
{
  return self->super._deviceController;
}

- (id)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (MTRAsyncWorkQueue)asyncWorkQueue
{
  return self->_asyncWorkQueue;
}

- (void)setAsyncWorkQueue:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_unint64_t state = a3;
}

- (NSDate)estimatedStartTime
{
  return self->_estimatedStartTime;
}

- (void)setEstimatedStartTime:(id)a3
{
}

- (NSNumber)estimatedSubscriptionLatency
{
  return self->_estimatedSubscriptionLatency;
}

- (void)setEstimatedSubscriptionLatency:(id)a3
{
}

- (os_unfair_lock_s)timeSyncLock
{
  return self->_timeSyncLock;
}

- (NSMutableArray)unreportedEvents
{
  return self->_unreportedEvents;
}

- (void)setUnreportedEvents:(id)a3
{
}

- (BOOL)receivingReport
{
  return self->_receivingReport;
}

- (void)setReceivingReport:(BOOL)a3
{
  self->_receivingReport = a3;
}

- (BOOL)receivingPrimingReport
{
  return self->_receivingPrimingReport;
}

- (void)setReceivingPrimingReport:(BOOL)a3
{
  self->_receivingPrimingReport = a3;
}

- (unint64_t)internalDeviceState
{
  return self->_internalDeviceState;
}

- (void)setInternalDeviceState:(unint64_t)a3
{
  self->_unint64_t internalDeviceState = a3;
}

- (unsigned)lastSubscriptionAttemptWait
{
  return self->_lastSubscriptionAttemptWait;
}

- (void)setLastSubscriptionAttemptWait:(unsigned int)a3
{
  self->_unsigned int lastSubscriptionAttemptWait = a3;
}

- (BOOL)reattemptingSubscription
{
  return self->_reattemptingSubscription;
}

- (void)setReattemptingSubscription:(BOOL)a3
{
  self->_reattemptingSubscription = a3;
}

- (NSMutableDictionary)expectedValueCache
{
  return self->_expectedValueCache;
}

- (void)setExpectedValueCache:(id)a3
{
}

- (unint64_t)expectedValueNextID
{
  return self->_expectedValueNextID;
}

- (void)setExpectedValueNextID:(unint64_t)a3
{
  self->_unint64_t expectedValueNextID = a3;
}

- (BOOL)expirationCheckScheduled
{
  return self->_expirationCheckScheduled;
}

- (void)setExpirationCheckScheduled:(BOOL)a3
{
  self->_expirationCheckScheduled = a3;
}

- (BOOL)timeUpdateScheduled
{
  return self->_timeUpdateScheduled;
}

- (void)setTimeUpdateScheduled:(BOOL)a3
{
  self->_timeUpdateScheduled = a3;
}

- (NSDate)estimatedStartTimeFromGeneralDiagnosticsUpTime
{
  return self->_estimatedStartTimeFromGeneralDiagnosticsUpTime;
}

- (void)setEstimatedStartTimeFromGeneralDiagnosticsUpTime:(id)a3
{
}

- (void)currentReadClient
{
  return self->_currentReadClient;
}

- (void)setCurrentReadClient:(void *)a3
{
  self->_currentReadClient = a3;
}

- (void)currentSubscriptionCallback
{
  return self->_currentSubscriptionCallback;
}

- (void)setCurrentSubscriptionCallback:(void *)a3
{
  self->_currentSubscriptionCallbacuint64_t k = a3;
}

- (BOOL)suspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_estimatedStartTimeFromGeneralDiagnosticsUpTime, 0);
  objc_storeStrong((id *)&self->_expectedValueCache, 0);
  objc_storeStrong((id *)&self->_unreportedEvents, 0);
  objc_storeStrong((id *)&self->_estimatedSubscriptionLatency, 0);
  objc_storeStrong((id *)&self->_estimatedStartTime, 0);
  objc_storeStrong((id *)&self->_asyncWorkQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lastSubscriptionFailureTimeForDescription, 0);
  objc_storeStrong((id *)&self->_mostRecentReportTimeForDescription, 0);
  objc_storeStrong((id *)&self->_allNetworkFeatures, 0);
  objc_storeStrong((id *)&self->_pid, 0);
  objc_storeStrong((id *)&self->_vid, 0);
  objc_storeStrong(&self->_systemTimeChangeObserverToken, 0);
  objc_storeStrong((id *)&self->_deviceReportingExcessivelyStartTime, 0);
  objc_storeStrong((id *)&self->_mostRecentReportTimes, 0);
  objc_storeStrong((id *)&self->_clusterDataPersistenceFirstScheduledTime, 0);
  objc_storeStrong((id *)&self->_storageBehaviorConfiguration, 0);
  objc_storeStrong((id *)&self->_initialSubscribeStart, 0);
  objc_storeStrong(&self->_subscriptionPoolWorkCompletionBlock, 0);
  objc_storeStrong((id *)&self->_connectivityMonitor, 0);
  objc_storeStrong((id *)&self->_lastSubscriptionFailureTime, 0);
  objc_storeStrong((id *)&self->_persistedClusters, 0);
  objc_storeStrong((id *)&self->_clusterDataToPersist, 0);

  objc_storeStrong((id *)&self->_persistedClusterData, 0);
}

- (BOOL)_deviceHasActiveSubscription
{
  p_locuint64_t k = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  unint64_t internalDeviceState = self->_internalDeviceState;
  BOOL v6 = internalDeviceState == 2 || internalDeviceState == 4;
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)_deviceMayBeReachable
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = self;
    _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_DEFAULT, "%@ _deviceMayBeReachable called", buf, 0xCu);
  }

  if (sub_244CC4E58(2u))
  {
    BOOL v6 = self;
    sub_244CC4DE0(0, 2);
  }
  deviceController = self->super._deviceController;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244C94D68;
  v7[3] = &unk_265193E58;
  v7[4] = self;
  objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(deviceController, v4, (uint64_t)v7, 0, v6);
}

+ (id)deviceWithNodeID:(unint64_t)a3 deviceController:(id)a4
{
  id v6 = a4;
  objc_super v8 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v7, a3);
  uint64_t v10 = objc_msgSend_deviceWithNodeID_controller_(a1, v9, (uint64_t)v8, v6);

  return v10;
}

@end