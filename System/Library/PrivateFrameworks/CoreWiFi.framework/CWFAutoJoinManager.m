@interface CWFAutoJoinManager
- (BOOL)__allowAutoJoinWithTrigger:(int64_t)a3 error:(id *)a4;
- (BOOL)__allowHotspot:(id)a3 error:(id *)a4;
- (BOOL)__allowJoinCandidate:(id)a3 context:(id)a4 defer:(BOOL *)a5 error:(id *)a6;
- (BOOL)__allowKnownNetwork:(id)a3 context:(id)a4 allowForSeamlessSSIDTransition:(id)a5 defer:(BOOL *)a6 targetQueue:(id)a7 error:(id *)a8;
- (BOOL)__allowOpportunisticNetworkTransitionWithTrigger:(int64_t)a3;
- (BOOL)__calloutToAllowAutoJoinWithTrigger:(int64_t)a3 error:(id *)a4;
- (BOOL)__calloutToAllowHotspot:(id)a3 error:(id *)a4;
- (BOOL)__calloutToAllowJoinCandidate:(id)a3 trigger:(int64_t)a4 defer:(BOOL *)a5 error:(id *)a6;
- (BOOL)__calloutToAllowKnownNetwork:(id)a3 trigger:(int64_t)a4 allowForSeamlessSSIDTransition:(id)a5 defer:(BOOL *)a6 queue:(id)a7 error:(id *)a8;
- (BOOL)__calloutToAssociateWithParameters:(id)a3 error:(id *)a4;
- (BOOL)__calloutToConnectToHotspot:(id)a3 error:(id *)a4;
- (BOOL)__candidateSupportsSeamlessSSIDTransition:(id)a3 fromNetwork:(id)a4 context:(id)a5;
- (BOOL)__connectToHotspot:(id)a3 error:(id *)a4;
- (BOOL)__didRecentlyJoinAny6GHzOnlyNetworks:(id)a3;
- (BOOL)__discoverKnownNetworksWithContext:(id)a3 error:(id *)a4;
- (BOOL)__does6GHzChannelOverlapWithUWB:(id)a3;
- (BOOL)__forceNearbyNetworkRetrySchedule;
- (BOOL)__hasJoinedAnyKnownNetworkSinceBoot;
- (BOOL)__isAnyKnownNetworkNearby;
- (BOOL)__isAutoJoinCancelled:(id *)a3;
- (BOOL)__isAutoJoinRequeued;
- (BOOL)__isDeferrableJoinCandidate:(id)a3;
- (BOOL)__isDeferrableKnownNetwork:(id)a3;
- (BOOL)__isNonPinnedEAPTLSCandidate:(id)a3;
- (BOOL)__matchAndJoinScanResults:(id)a3 allowPreAssociationScan:(BOOL)a4 context:(id)a5 error:(id *)a6;
- (BOOL)__nextRequest;
- (BOOL)__performAutoHotspotWithBrowseTimeout:(unint64_t)a3 maxCacheAge:(unint64_t)a4 cacheOnly:(BOOL)a5 error:(id *)a6;
- (BOOL)__performJoinWithNetwork:(id)a3 context:(id)a4 error:(id *)a5;
- (BOOL)__preflightMatchKnownNetworksForScanResult:(id)a3;
- (BOOL)__shouldAllowAutoHotspotForTrigger:(int64_t)a3;
- (BOOL)__shouldAllowPreAssocScan;
- (BOOL)__shouldAlwaysUpdateRetrySchedule:(int64_t)a3;
- (BOOL)__shouldBypassLockdownModeCheckForTrigger:(int64_t)a3 targetNetworkSSID:(id)a4 networkSSID:(id)a5;
- (BOOL)__shouldBypassUnusedNetworkPeriodCheckForTrigger:(int64_t)a3 knownNetwork:(id)a4;
- (BOOL)__shouldIgnoreRequestWithTrigger:(int64_t)a3;
- (BOOL)__shouldInvokeImmediatelyForTrigger:(int64_t)a3;
- (BOOL)__shouldPrioritizeRetryOverNewRequest:(int64_t)a3;
- (BOOL)__shouldResetRetryIntervalIndexForTrigger:(int64_t)a3;
- (BOOL)__shouldThrottleAutoJoinTrigger:(int64_t)a3;
- (BOOL)isKnownNetworkDisallowed:(id)a3;
- (BOOL)lockdownModeEnabled;
- (BOOL)maxCompatibilityEnabled;
- (CLLocation)location;
- (CWFAutoJoinManager)init;
- (CWFAutoJoinMetric)metric;
- (CWFAutoJoinStatistics)statistics;
- (CWFScanResult)associatedNetwork;
- (NSSet)knownNetworks;
- (NSSet)supportedChannels;
- (NSString)colocatedScopeID;
- (OS_dispatch_queue)targetQueue;
- (id)__alreadyFoundFollowup6GHzBSSWithSignature:(id)a3;
- (id)__basicChannelRepresentation:(id)a3;
- (id)__browseForHotspotsWithTimeout:(unint64_t)a3 maxCacheAge:(unint64_t)a4 cacheOnly:(BOOL)a5 error:(id *)a6;
- (id)__cachedScanResultsWithChannelList:(id)a3 context:(id)a4;
- (id)__calloutToBrowseForHotspotsWithTimeout:(unint64_t)a3 maxCacheAge:(unint64_t)a4 cacheOnly:(BOOL)a5 error:(id *)a6;
- (id)__calloutToPerformGASQueryWithParameters:(id)a3 GASQueryNetworks:(id *)a4 error:(id *)a5;
- (id)__calloutToScanForNetworksWithParameters:(id)a3 scanChannels:(id *)a4 error:(id *)a5;
- (id)__descriptionForError:(id)a3;
- (id)__knownNetworksList:(id)a3 containsMatchingKnownNetwork:(id)a4;
- (id)__knownNetworksSupportingSeamlessSSIDTransition:(id)a3 fromNetwork:(id)a4 allowSameSSID:(BOOL)a5 context:(id)a6;
- (id)__morePreferredKnownNetworksWithCandidate:(id)a3 knownNetworks:(id)a4 context:(id)a5;
- (id)__passpointScanResults:(id)a3;
- (id)__perform6GHzFollowupDiscoveryWithScanResults:(id)a3 SSIDList:(id)a4 dwellTime:(unint64_t)a5 context:(id)a6 error:(id *)a7;
- (id)__performGASQueryWithScanResults:(id)a3 ANQPElementIDList:(id)a4 maxCacheAge:(unint64_t)a5 cacheOnly:(BOOL)a6 error:(id *)a7;
- (id)__performPreAssociationScanWithContext:(id)a3 network:(id)a4;
- (id)__performScanWithChannelList:(id)a3 SSIDList:(id)a4 passive:(BOOL)a5 dwellTime:(unint64_t)a6 maxCacheAge:(unint64_t)a7 cacheOnly:(BOOL)a8 isPreAssociationScan:(BOOL)a9 error:(id *)a10;
- (id)__retryInterval;
- (id)__retryIntervalWithScheduleIndex:(unint64_t)a3;
- (id)allowAutoHotspotHandler;
- (id)allowAutoJoinHandler;
- (id)allowHotspotHandler;
- (id)allowJoinCandidateHandler;
- (id)allowKnownNetworkHandler;
- (id)associateToNetworkHandler;
- (id)browseForHotspotsHandler;
- (id)connectToHotspotHandler;
- (id)eventHandler;
- (id)invalidationHandler;
- (id)joinCandidateComparator;
- (id)knownNetworkComparator;
- (id)performAutoJoinWithParameters:(id)a3 reply:(id)a4;
- (id)performGASQueryHandler;
- (id)scanForNetworksHandler;
- (id)updateKnownNetworkHandler;
- (int64_t)__allowAutoHotspotWithTrigger:(int64_t)a3 error:(id *)a4;
- (int64_t)__calloutToAllowAutoHotspotWithTrigger:(int64_t)a3 error:(id *)a4;
- (int64_t)__retryTriggerForRetrySchedule:(int64_t)a3;
- (int64_t)retrySchedule;
- (unint64_t)__applyRetryIntervalSkew:(unint64_t)a3;
- (unint64_t)__nextRequestInterval;
- (unsigned)__qosForAutoJoinTrigger:(int64_t)a3;
- (void)__addDependentThrottleInterval:(unint64_t)a3 trigger:(int64_t)a4 dependentTrigger:(int64_t)a5;
- (void)__addDisallowedKnownNetwork:(id)a3;
- (void)__addMatchingThrottleInterval:(unint64_t)a3 triggers:(id)a4;
- (void)__addRequest:(id)a3;
- (void)__addWilcardThrottleInterval:(unint64_t)a3 triggers:(id)a4;
- (void)__invalidateAllowedKnownNetworksCacheForTrigger:(int64_t)a3;
- (void)__performAutoJoin;
- (void)__prepareKnownNetworksContext:(id)a3;
- (void)__removeDisallowedKnownNetwork:(id)a3;
- (void)__removeRedundantRequests:(id)a3;
- (void)__resetRetryIntervalIndex;
- (void)__setupRetryIntervals;
- (void)__setupThrottleIntervals;
- (void)__sortHotspotCandidates:(id)a3;
- (void)__sortJoinCandidates:(id)a3 context:(id)a4;
- (void)__sortKnownNetworks:(id)a3;
- (void)__sortKnownNetworksByJoinTimestamp:(id)a3;
- (void)__updateAutoJoinState:(int64_t)a3;
- (void)__updateCachedMetricAndStatistics:(id)a3;
- (void)__updateDiscoverTimestampForJoinCandidates:(id)a3;
- (void)__updateNextRequestTimer;
- (void)__updateRNRChannel:(id)a3 has6GHzOnlyBSS:(BOOL)a4 joinCandidate:(id)a5;
- (void)__updateRetrySchedule;
- (void)__updateStatisticsWithPreAssocScanChannels:(id)a3;
- (void)__updateStatisticsWithScanChannels:(id)a3;
- (void)cancelAutoJoinWithUUID:(id)a3 error:(id)a4 reply:(id)a5;
- (void)invalidate;
- (void)resetStatistics;
- (void)setAllowAutoHotspotHandler:(id)a3;
- (void)setAllowAutoJoinHandler:(id)a3;
- (void)setAllowHotspotHandler:(id)a3;
- (void)setAllowJoinCandidateHandler:(id)a3;
- (void)setAllowKnownNetworkHandler:(id)a3;
- (void)setAssociateToNetworkHandler:(id)a3;
- (void)setAssociatedNetwork:(id)a3;
- (void)setBrowseForHotspotsHandler:(id)a3;
- (void)setColocatedScopeID:(id)a3;
- (void)setConnectToHotspotHandler:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setJoinCandidateComparator:(id)a3;
- (void)setKnownNetworkComparator:(id)a3;
- (void)setKnownNetworks:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLockdownModeEnabled:(BOOL)a3;
- (void)setMaxCompatibilityEnabled:(BOOL)a3;
- (void)setPerformGASQueryHandler:(id)a3;
- (void)setRetrySchedule:(int64_t)a3;
- (void)setScanForNetworksHandler:(id)a3;
- (void)setSupportedChannels:(id)a3;
- (void)setTargetQueue:(id)a3;
- (void)setUpdateKnownNetworkHandler:(id)a3;
@end

@implementation CWFAutoJoinManager

- (void)setMaxCompatibilityEnabled:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_maxCompatibilityEnabled = a3;
  objc_sync_exit(obj);
}

- (void)setSupportedChannels:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t supportedChannels = (uint64_t)v5->_supportedChannels;
  if ((id)supportedChannels != v4
    && (!v4 || !supportedChannels || (objc_msgSend_isEqual_(v4, v6, supportedChannels, v7, v8) & 1) == 0))
  {
    v10 = CWFGetOSLog();
    if (v10)
    {
      v11 = CWFGetOSLog();
    }
    else
    {
      v11 = MEMORY[0x1E4F14500];
      id v12 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v26 = 0;
      int v25 = 2;
      v24 = &v26;
      _os_log_send_and_compose_impl();
    }

    uint64_t v16 = (uint64_t)v5->_supportedChannels;
    if (v16) {
      char isSubsetOfSet = objc_msgSend_isSubsetOfSet_(v4, v13, v16, v14, v15);
    }
    else {
      char isSubsetOfSet = 0;
    }
    uint64_t v18 = objc_msgSend_copy(v4, v13, v16, v14, v15, v24, v25);
    v19 = v5->_supportedChannels;
    v5->_uint64_t supportedChannels = (NSSet *)v18;

    if ((isSubsetOfSet & 1) == 0)
    {
      v5->_didConfigurationChangeSincePreviousAttempt = 1;
      v5->_resetCachedKnownNetworksContext = 1;
      objc_msgSend___resetRetryIntervalIndex(v5, v20, v21, v22, v23);
    }
  }
  objc_sync_exit(v5);
}

- (void)__updateNextRequestTimer
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!self->_nextRequestTimer)
  {
    v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_internalQueue);
    nextRequestTimer = self->_nextRequestTimer;
    self->_nextRequestTimer = v6;

    uint64_t v8 = self->_nextRequestTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = sub_1B4FADFA4;
    handler[3] = &unk_1E60BB768;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_nextRequestTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_nextRequestTimer);
  }
  if ((unint64_t)objc_msgSend___nextRequestInterval(self, a2, v2, v3, v4) > 0x7FFFFFFFFFFFFFFELL)
  {
    int64_t RequestInterval = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_9;
  }
  int64_t RequestInterval = objc_msgSend___nextRequestInterval(self, v9, v10, v11, v12);
  if (RequestInterval >= 1)
  {
LABEL_9:
    uint64_t v16 = CWFGetOSLog();
    if (v16)
    {
      v17 = CWFGetOSLog();
    }
    else
    {
      v17 = MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      if (self->_isNextRequestScheduled) {
        v19 = @"Re-scheduling";
      }
      else {
        v19 = @"Scheduling";
      }
      int v25 = 138543618;
      __int16 v26 = v19;
      __int16 v27 = 2048;
      unint64_t v28 = RequestInterval / 0xF4240uLL;
      _os_log_send_and_compose_impl();
    }

    self->_isNextRequestScheduled = 1;
    v20 = self->_nextRequestTimer;
    dispatch_time_t v21 = dispatch_walltime(0, RequestInterval);
    uint64_t v22 = v20;
    goto LABEL_18;
  }
  if (!self->_isNextRequestScheduled) {
    return;
  }
  uint64_t v14 = CWFGetOSLog();
  if (v14)
  {
    uint64_t v15 = CWFGetOSLog();
  }
  else
  {
    uint64_t v15 = MEMORY[0x1E4F14500];
    id v23 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v25) = 0;
    _os_log_send_and_compose_impl();
  }

  self->_isNextRequestScheduled = 0;
  uint64_t v22 = self->_nextRequestTimer;
  dispatch_time_t v21 = -1;
LABEL_18:
  dispatch_source_set_timer(v22, v21, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)setLocation:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t location = (uint64_t)v5->_location;
  if ((id)location != v4 && (!v4 || !location || (objc_msgSend_isEqual_(v4, v6, location, v7, v8) & 1) == 0))
  {
    uint64_t v10 = CWFGetOSLog();
    if (v10)
    {
      uint64_t v11 = CWFGetOSLog();
    }
    else
    {
      uint64_t v11 = MEMORY[0x1E4F14500];
      id v12 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      __int16 v23 = 0;
      int v22 = 2;
      dispatch_time_t v21 = &v23;
      _os_log_send_and_compose_impl();
    }

    if (!v4
      || (v17 = v5->_location) == 0
      || (objc_msgSend_distanceFromLocation_(v17, v13, (uint64_t)v4, v15, v16), v18 > 20.0))
    {
      v5->_resetCachedKnownNetworksContext = 1;
    }
    uint64_t v19 = objc_msgSend_copy(v4, v13, v14, v15, v16, v21, v22);
    v20 = v5->_location;
    v5->_uint64_t location = (CLLocation *)v19;
  }
  objc_sync_exit(v5);
}

- (id)performAutoJoinWithParameters:(id)a3 reply:(id)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc_init(CWFAutoJoinRequest);
  v13 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v9, v10, v11, v12);
  objc_msgSend_setUUID_(v8, v14, (uint64_t)v13, v15, v16);

  objc_msgSend_setParameters_(v8, v17, (uint64_t)v6, v18, v19);
  objc_msgSend_setReply_(v8, v20, (uint64_t)v7, v21, v22);
  __int16 v23 = self;
  objc_sync_enter(v23);
  if (v23->_invalidated)
  {
    __int16 v27 = CWFGetOSLog();
    if (v27)
    {
      unint64_t v28 = CWFGetOSLog();
    }
    else
    {
      unint64_t v28 = MEMORY[0x1E4F14500];
      id v29 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v34 = objc_msgSend_UUID(v8, v30, v31, v32, v33);
      v39 = objc_msgSend_UUIDString(v34, v35, v36, v37, v38);
      objc_msgSend_substringToIndex_(v39, v40, 5, v41, v42);
      id v43 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_parameters(v8, v44, v45, v46, v47);
      int v63 = 138543618;
      unint64_t v64 = (unint64_t)v43;
      v66 = __int16 v65 = 2114;
      _os_log_send_and_compose_impl();
    }
    __uint64_t v48 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v49 = CWFGetOSLog();
    if (v49)
    {
      v50 = CWFGetOSLog();
    }
    else
    {
      v50 = MEMORY[0x1E4F14500];
      id v51 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    {
      int v63 = 134219010;
      unint64_t v64 = v48 / 0x3B9ACA00;
      __int16 v65 = 2048;
      unint64_t v66 = v48 % 0x3B9ACA00 / 0x3E8;
      __int16 v67 = 2082;
      v68 = "-[CWFAutoJoinManager performAutoJoinWithParameters:reply:]";
      __int16 v69 = 2082;
      v70 = "CWFAutoJoinManager.m";
      __int16 v71 = 1024;
      int v72 = 747;
      _os_log_send_and_compose_impl();
    }

    targetQueue = v23->_targetQueue;
    qos_class_t v53 = qos_class_self();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F943F8;
    block[3] = &unk_1E60BBCF8;
    id v62 = v7;
    dispatch_block_t v54 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v53, 0, block);
    dispatch_async(targetQueue, v54);
  }
  else
  {
    objc_msgSend___addRequest_(v23, v24, (uint64_t)v8, v25, v26);
  }
  objc_sync_exit(v23);

  v59 = objc_msgSend_UUID(v8, v55, v56, v57, v58);

  return v59;
}

- (void)setRetrySchedule:(int64_t)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_retrySchedule != a3)
  {
    v5 = CWFGetOSLog();
    if (v5)
    {
      id v6 = CWFGetOSLog();
    }
    else
    {
      id v6 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      sub_1B4F54A8C(v4->_retrySchedule, v8, v9, v10, v11);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      v17 = sub_1B4F54A8C(a3, v13, v14, v15, v16);
      int v28 = 138543618;
      id v29 = v12;
      __int16 v30 = 2114;
      uint64_t v31 = v17;
      int v27 = 22;
      uint64_t v26 = &v28;
      _os_log_send_and_compose_impl();
    }
    v4->_retrySchedule = a3;
    objc_msgSend___setupThrottleIntervals(v4, v18, v19, v20, v21);
    if (!v4->_invalidated
      && (v4->_isRetryScheduled || objc_msgSend___shouldAlwaysUpdateRetrySchedule_(v4, v22, a3, v24, v25)))
    {
      objc_msgSend___updateRetrySchedule(v4, v22, v23, v24, v25, v26, v27);
    }
  }
  objc_sync_exit(v4);
}

- (BOOL)__nextRequest
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  if (self->_isNextRequestScheduled)
  {
    id v6 = CWFGetOSLog();
    if (v6)
    {
      id v7 = CWFGetOSLog();
    }
    else
    {
      id v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v95) = 0;
      int v92 = 2;
      v90 = &v95;
      _os_log_send_and_compose_impl();
    }

    self->_isNextRequestScheduled = 0;
    dispatch_source_set_timer((dispatch_source_t)self->_nextRequestTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  p_activeRequest = &self->_activeRequest;
  if (self->_activeRequest) {
    goto LABEL_9;
  }
  uint64_t v10 = objc_msgSend_count(self->_pendingRequests, a2, v2, v3, v4);
  if (!v10) {
    return v10;
  }
  uint64_t v19 = 0;
  if (objc_msgSend_count(self->_pendingRequests, v11, v12, v13, v14))
  {
    unint64_t v20 = 0;
    uint64_t v21 = MEMORY[0x1E4F14500];
    do
    {
      if (*p_activeRequest) {
        goto LABEL_28;
      }
      uint64_t v22 = objc_msgSend_objectAtIndexedSubscript_(self->_pendingRequests, v15, v20, v17, v18);
      int v27 = objc_msgSend_parameters(v22, v23, v24, v25, v26);
      uint64_t v32 = objc_msgSend_trigger(v27, v28, v29, v30, v31);
      if (objc_msgSend___shouldThrottleAutoJoinTrigger_(self, v33, v32, v34, v35))
      {
        v40 = objc_msgSend_parameters(v22, v36, v37, v38, v39);
        uint64_t v45 = objc_msgSend_targetNetworkProfile(v40, v41, v42, v43, v44);

        if (!v45)
        {
          if ((objc_msgSend_throttled(v22, v46, v47, v48, v49) & 1) == 0)
          {
            v50 = CWFGetOSLog();
            if (v50)
            {
              id v51 = CWFGetOSLog();
            }
            else
            {
              uint64_t v56 = v21;
              id v51 = v21;
            }

            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              int v95 = 138543362;
              *(void *)v96 = v22;
              int v92 = 12;
              v90 = &v95;
              _os_log_send_and_compose_impl();
            }

            objc_msgSend_setThrottled_(v22, v57, 1, v58, v59);
          }
          goto LABEL_21;
        }
      }
      else
      {
      }
      objc_storeStrong((id *)&self->_activeRequest, v22);
      uint64_t v19 = v20;
LABEL_21:

      ++v20;
    }
    while (v20 < objc_msgSend_count(self->_pendingRequests, v52, v53, v54, v55));
  }
  if (!*p_activeRequest)
  {
    objc_msgSend___updateNextRequestTimer(self, v15, v16, v17, v18);
LABEL_9:
    LOBYTE(v10) = 0;
    return v10;
  }
LABEL_28:
  objc_msgSend_removeObjectAtIndex_(self->_pendingRequests, v15, v19, v17, v18, v90, v92);
  if (self->_isRetryScheduled)
  {
    unint64_t v64 = CWFGetOSLog();
    if (v64)
    {
      __int16 v65 = CWFGetOSLog();
    }
    else
    {
      __int16 v65 = MEMORY[0x1E4F14500];
      id v66 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v71 = sub_1B4F54A8C(self->_retrySchedule, v67, v68, v69, v70);
      unint64_t retryScheduleIndex = self->_retryScheduleIndex;
      int v95 = 138543618;
      *(void *)v96 = v71;
      *(_WORD *)&v96[8] = 2048;
      *(void *)&v96[10] = retryScheduleIndex;
      LODWORD(v93) = 22;
      v91 = &v95;
      _os_log_send_and_compose_impl();
    }
    self->_isRetryScheduled = 0;
    dispatch_source_set_timer((dispatch_source_t)self->_retryTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  uint64_t v73 = objc_msgSend_parameters(self->_activeRequest, v60, v61, v62, v63, v91, v93);
  uint64_t v78 = objc_msgSend_trigger(v73, v74, v75, v76, v77);
  dispatch_qos_class_t v82 = objc_msgSend___qosForAutoJoinTrigger_(self, v79, v78, v80, v81);

  v83 = CWFGetOSLog();
  if (v83)
  {
    v84 = CWFGetOSLog();
  }
  else
  {
    v84 = MEMORY[0x1E4F14500];
    id v85 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
  {
    v86 = *p_activeRequest;
    int v95 = 67109378;
    *(_DWORD *)v96 = v82;
    *(_WORD *)&v96[4] = 2114;
    *(void *)&v96[6] = v86;
    _os_log_send_and_compose_impl();
  }

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F97928;
  block[3] = &unk_1E60BB768;
  void block[4] = self;
  dispatch_block_t v88 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v82, 0, block);
  dispatch_async(internalQueue, v88);

  LOBYTE(v10) = 1;
  return v10;
}

- (BOOL)__shouldThrottleAutoJoinTrigger:(int64_t)a3
{
  uint64_t v196 = *MEMORY[0x1E4F143B8];
  __uint64_t v168 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  throttleIntervalMap = self->_throttleIntervalMap;
  unint64_t v161 = a3;
  uint64_t v9 = objc_msgSend_numberWithInteger_(NSNumber, v6, a3, v7, v8);
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(throttleIntervalMap, v10, (uint64_t)v9, v11, v12);

  if (!v13)
  {
    uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(self->_throttleIntervalMap, v14, (uint64_t)&unk_1F0DC7818, v16, v17);
  }
  long long v186 = 0u;
  long long v187 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  uint64_t v18 = objc_msgSend_intervals(v13, v14, v15, v16, v17);
  uint64_t v23 = objc_msgSend_allKeys(v18, v19, v20, v21, v22);

  v169 = self;
  v170 = v13;
  uint64_t v162 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v184, (uint64_t)v195, 16);
  if (v162)
  {
    uint64_t v29 = *(void *)v185;
    v166 = v23;
    uint64_t v159 = *(void *)v185;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v185 != v29) {
          objc_enumerationMutation(v23);
        }
        uint64_t v164 = v30;
        uint64_t v31 = *(void **)(*((void *)&v184 + 1) + 8 * v30);
        long long v180 = 0u;
        long long v181 = 0u;
        long long v182 = 0u;
        long long v183 = 0u;
        objc_msgSend_allKeys(self->_throttleTimestampMap, v25, v26, v27, v28);
        id obj = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v32, (uint64_t)&v180, (uint64_t)v194, 16);
        if (v33)
        {
          uint64_t v38 = v33;
          uint64_t v39 = *(void *)v181;
          while (2)
          {
            for (uint64_t i = 0; i != v38; ++i)
            {
              if (*(void *)v181 != v39) {
                objc_enumerationMutation(obj);
              }
              uint64_t v41 = *(void **)(*((void *)&v180 + 1) + 8 * i);
              uint64_t v42 = objc_msgSend_integerValue(v31, v34, v35, v36, v37);
              if (v42 == objc_msgSend_integerValue(v41, v43, v44, v45, v46))
              {
                uint64_t v47 = objc_msgSend_objectForKeyedSubscript_(self->_throttleTimestampMap, v34, (uint64_t)v41, v36, v37);
                v52 = objc_msgSend_intervals(v13, v48, v49, v50, v51);
                uint64_t v56 = objc_msgSend_objectForKeyedSubscript_(v52, v53, (uint64_t)v31, v54, v55);

                if (v47) {
                  BOOL v61 = v56 == 0;
                }
                else {
                  BOOL v61 = 1;
                }
                if (!v61)
                {
                  uint64_t v62 = objc_msgSend_unsignedLongLongValue(v47, v57, v58, v59, v60);
                  unint64_t v67 = objc_msgSend_unsignedLongValue(v56, v63, v64, v65, v66);
                  unint64_t v72 = 1000000000 * objc_msgSend_unsignedLongValue(v56, v68, v69, v70, v71);
                  uint64_t v77 = objc_msgSend_unsignedLongValue(v56, v73, v74, v75, v76);
                  unint64_t v78 = 1000000000 * v77;
                  BOOL v79 = v67 > v72;
                  self = v169;
                  uint64_t v13 = v170;
                  if (v79) {
                    unint64_t v78 = v77;
                  }
                  if (v168 - v62 < v78)
                  {
                    v144 = CWFGetOSLog();
                    if (v144)
                    {
                      v145 = CWFGetOSLog();
                    }
                    else
                    {
                      v145 = MEMORY[0x1E4F14500];
                      id v147 = MEMORY[0x1E4F14500];
                    }
                    v89 = v166;

                    if (os_log_type_enabled(v145, OS_LOG_TYPE_DEBUG))
                    {
                      v152 = sub_1B4F520D4(v161, v148, v149, v150, v151);
                      int v190 = 138543618;
                      v191 = v170;
                      __int16 v192 = 2114;
                      v193 = v152;
LABEL_60:
                      _os_log_send_and_compose_impl();
                    }
LABEL_61:

                    BOOL v143 = 1;
                    goto LABEL_62;
                  }
                }
              }
            }
            uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v180, (uint64_t)v194, 16);
            if (v38) {
              continue;
            }
            break;
          }
        }

        uint64_t v30 = v164 + 1;
        uint64_t v23 = v166;
        uint64_t v29 = v159;
      }
      while (v164 + 1 != v162);
      uint64_t v162 = objc_msgSend_countByEnumeratingWithState_objects_count_(v166, v25, (uint64_t)&v184, (uint64_t)v195, 16);
    }
    while (v162);
  }

  long long v178 = 0u;
  long long v179 = 0u;
  long long v176 = 0u;
  long long v177 = 0u;
  v84 = objc_msgSend_intervalsBasedOnTriggerTimestamp(v13, v80, v81, v82, v83);
  v89 = objc_msgSend_allKeys(v84, v85, v86, v87, v88);

  uint64_t v163 = objc_msgSend_countByEnumeratingWithState_objects_count_(v89, v90, (uint64_t)&v176, (uint64_t)v189, 16);
  if (v163)
  {
    uint64_t v95 = *(void *)v177;
    v167 = v89;
    uint64_t v160 = *(void *)v177;
    do
    {
      uint64_t v96 = 0;
      do
      {
        if (*(void *)v177 != v95) {
          objc_enumerationMutation(v89);
        }
        uint64_t v165 = v96;
        uint64_t v97 = *(void **)(*((void *)&v176 + 1) + 8 * v96);
        long long v172 = 0u;
        long long v173 = 0u;
        long long v174 = 0u;
        long long v175 = 0u;
        objc_msgSend_allKeys(self->_triggerTimestampMap, v91, v92, v93, v94);
        id obj = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v99 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v98, (uint64_t)&v172, (uint64_t)v188, 16);
        if (v99)
        {
          uint64_t v104 = v99;
          uint64_t v105 = *(void *)v173;
LABEL_33:
          uint64_t v106 = 0;
          while (1)
          {
            if (*(void *)v173 != v105) {
              objc_enumerationMutation(obj);
            }
            v107 = *(void **)(*((void *)&v172 + 1) + 8 * v106);
            uint64_t v108 = objc_msgSend_integerValue(v97, v100, v101, v102, v103);
            if (v108 == objc_msgSend_integerValue(v107, v109, v110, v111, v112))
            {
              uint64_t v47 = objc_msgSend_objectForKeyedSubscript_(self->_triggerTimestampMap, v100, (uint64_t)v107, v102, v103);
              v117 = objc_msgSend_intervalsBasedOnTriggerTimestamp(v13, v113, v114, v115, v116);
              uint64_t v56 = objc_msgSend_objectForKeyedSubscript_(v117, v118, (uint64_t)v97, v119, v120);

              if (v47) {
                BOOL v125 = v56 == 0;
              }
              else {
                BOOL v125 = 1;
              }
              if (!v125)
              {
                uint64_t v126 = objc_msgSend_unsignedLongLongValue(v47, v121, v122, v123, v124);
                unint64_t v131 = objc_msgSend_unsignedLongValue(v56, v127, v128, v129, v130);
                unint64_t v136 = 1000000000 * objc_msgSend_unsignedLongValue(v56, v132, v133, v134, v135);
                uint64_t v141 = objc_msgSend_unsignedLongValue(v56, v137, v138, v139, v140);
                unint64_t v142 = 1000000000 * v141;
                BOOL v79 = v131 > v136;
                self = v169;
                uint64_t v13 = v170;
                if (v79) {
                  unint64_t v142 = v141;
                }
                if (v168 - v126 < v142)
                {
                  v146 = CWFGetOSLog();
                  if (v146)
                  {
                    v145 = CWFGetOSLog();
                  }
                  else
                  {
                    v145 = MEMORY[0x1E4F14500];
                    id v153 = MEMORY[0x1E4F14500];
                  }
                  v89 = v167;

                  if (os_log_type_enabled(v145, OS_LOG_TYPE_DEBUG))
                  {
                    v152 = sub_1B4F520D4(v161, v154, v155, v156, v157);
                    int v190 = 138543618;
                    v191 = v170;
                    __int16 v192 = 2114;
                    v193 = v152;
                    goto LABEL_60;
                  }
                  goto LABEL_61;
                }
              }
            }
            if (v104 == ++v106)
            {
              uint64_t v104 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v100, (uint64_t)&v172, (uint64_t)v188, 16);
              if (v104) {
                goto LABEL_33;
              }
              break;
            }
          }
        }

        uint64_t v96 = v165 + 1;
        v89 = v167;
        uint64_t v95 = v160;
      }
      while (v165 + 1 != v163);
      uint64_t v163 = objc_msgSend_countByEnumeratingWithState_objects_count_(v167, v91, (uint64_t)&v176, (uint64_t)v189, 16);
    }
    while (v163);
  }
  BOOL v143 = 0;
LABEL_62:

  return v143;
}

- (unint64_t)__nextRequestInterval
{
  uint64_t v208 = *MEMORY[0x1E4F143B8];
  __uint64_t v178 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  long long v199 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  long long v202 = 0u;
  id obj = self->_pendingRequests;
  uint64_t v166 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v3, (uint64_t)&v199, (uint64_t)v207, 16);
  unint64_t v8 = 0;
  if (v166)
  {
    uint64_t v165 = *(void *)v200;
    long long v180 = self;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v200 != v165) {
          objc_enumerationMutation(obj);
        }
        uint64_t v167 = v9;
        throttleIntervalMap = self->_throttleIntervalMap;
        uint64_t v11 = NSNumber;
        uint64_t v12 = objc_msgSend_parameters(*(void **)(*((void *)&v199 + 1) + 8 * v9), v4, v5, v6, v7);
        uint64_t v17 = objc_msgSend_trigger(v12, v13, v14, v15, v16);
        uint64_t v21 = objc_msgSend_numberWithInteger_(v11, v18, v17, v19, v20);
        uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(throttleIntervalMap, v22, (uint64_t)v21, v23, v24);

        if (!v25)
        {
          uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(v180->_throttleIntervalMap, v26, (uint64_t)&unk_1F0DC7818, v28, v29);
        }
        long long v197 = 0u;
        long long v198 = 0u;
        long long v195 = 0u;
        long long v196 = 0u;
        uint64_t v30 = objc_msgSend_intervals(v25, v26, v27, v28, v29);
        uint64_t v35 = objc_msgSend_allKeys(v30, v31, v32, v33, v34);

        id v168 = v35;
        long long v179 = v25;
        uint64_t v172 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v195, (uint64_t)v206, 16);
        if (v172)
        {
          uint64_t v170 = *(void *)v196;
          self = v180;
          do
          {
            uint64_t v41 = 0;
            do
            {
              if (*(void *)v196 != v170) {
                objc_enumerationMutation(v168);
              }
              uint64_t v174 = v41;
              uint64_t v42 = *(void **)(*((void *)&v195 + 1) + 8 * v41);
              long long v191 = 0u;
              long long v192 = 0u;
              long long v193 = 0u;
              long long v194 = 0u;
              uint64_t v43 = objc_msgSend_allKeys(self->_throttleTimestampMap, v37, v38, v39, v40);
              uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v191, (uint64_t)v205, 16);
              if (v45)
              {
                uint64_t v50 = v45;
                uint64_t v51 = *(void *)v192;
                do
                {
                  uint64_t v52 = 0;
                  uint64_t v181 = v50;
                  do
                  {
                    if (*(void *)v192 != v51) {
                      objc_enumerationMutation(v43);
                    }
                    uint64_t v53 = *(void **)(*((void *)&v191 + 1) + 8 * v52);
                    uint64_t v54 = objc_msgSend_integerValue(v42, v46, v47, v48, v49);
                    if (v54 == objc_msgSend_integerValue(v53, v55, v56, v57, v58))
                    {
                      uint64_t v59 = objc_msgSend_objectForKeyedSubscript_(self->_throttleTimestampMap, v46, (uint64_t)v53, v48, v49);
                      uint64_t v64 = objc_msgSend_intervals(v25, v60, v61, v62, v63);
                      uint64_t v68 = objc_msgSend_objectForKeyedSubscript_(v64, v65, (uint64_t)v42, v66, v67);

                      if (v68 && v59)
                      {
                        uint64_t v176 = objc_msgSend_unsignedLongValue(v59, v69, v70, v71, v72);
                        uint64_t v77 = v42;
                        uint64_t v78 = v51;
                        BOOL v79 = v43;
                        unint64_t v80 = objc_msgSend_unsignedLongValue(v68, v73, v74, v75, v76);
                        unint64_t v85 = 1000000000 * objc_msgSend_unsignedLongValue(v68, v81, v82, v83, v84);
                        uint64_t v90 = objc_msgSend_unsignedLongValue(v68, v86, v87, v88, v89);
                        unint64_t v91 = 1000000000 * v90;
                        BOOL v92 = v80 > v85;
                        uint64_t v43 = v79;
                        uint64_t v51 = v78;
                        uint64_t v42 = v77;
                        uint64_t v25 = v179;
                        self = v180;
                        if (v92) {
                          unint64_t v91 = v90;
                        }
                        unint64_t v93 = v91 - (v178 - v176);
                        if (v8 >= v93) {
                          unint64_t v94 = v91 - (v178 - v176);
                        }
                        else {
                          unint64_t v94 = v8;
                        }
                        if (v8) {
                          unint64_t v93 = v94;
                        }
                        if (v91 > v178 - v176) {
                          unint64_t v8 = v93;
                        }
                      }
                      uint64_t v50 = v181;
                    }
                    ++v52;
                  }
                  while (v50 != v52);
                  uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v191, (uint64_t)v205, 16);
                }
                while (v50);
              }

              uint64_t v41 = v174 + 1;
            }
            while (v174 + 1 != v172);
            uint64_t v172 = objc_msgSend_countByEnumeratingWithState_objects_count_(v168, v37, (uint64_t)&v195, (uint64_t)v206, 16);
          }
          while (v172);
        }
        else
        {
          self = v180;
        }

        long long v189 = 0u;
        long long v190 = 0u;
        long long v187 = 0u;
        long long v188 = 0u;
        uint64_t v99 = objc_msgSend_intervalsBasedOnTriggerTimestamp(v25, v95, v96, v97, v98);
        uint64_t v104 = objc_msgSend_allKeys(v99, v100, v101, v102, v103);

        id v169 = v104;
        uint64_t v173 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v105, (uint64_t)&v187, (uint64_t)v204, 16);
        if (v173)
        {
          uint64_t v171 = *(void *)v188;
          do
          {
            uint64_t v110 = 0;
            do
            {
              if (*(void *)v188 != v171) {
                objc_enumerationMutation(v169);
              }
              uint64_t v175 = v110;
              uint64_t v111 = *(void **)(*((void *)&v187 + 1) + 8 * v110);
              long long v183 = 0u;
              long long v184 = 0u;
              long long v185 = 0u;
              long long v186 = 0u;
              uint64_t v112 = objc_msgSend_allKeys(self->_triggerTimestampMap, v106, v107, v108, v109);
              uint64_t v114 = objc_msgSend_countByEnumeratingWithState_objects_count_(v112, v113, (uint64_t)&v183, (uint64_t)v203, 16);
              if (v114)
              {
                uint64_t v119 = v114;
                uint64_t v120 = *(void *)v184;
                do
                {
                  uint64_t v121 = 0;
                  uint64_t v182 = v119;
                  do
                  {
                    if (*(void *)v184 != v120) {
                      objc_enumerationMutation(v112);
                    }
                    uint64_t v122 = *(void **)(*((void *)&v183 + 1) + 8 * v121);
                    uint64_t v123 = objc_msgSend_integerValue(v111, v115, v116, v117, v118);
                    if (v123 == objc_msgSend_integerValue(v122, v124, v125, v126, v127))
                    {
                      uint64_t v128 = objc_msgSend_objectForKeyedSubscript_(self->_triggerTimestampMap, v115, (uint64_t)v122, v117, v118);
                      uint64_t v133 = objc_msgSend_intervalsBasedOnTriggerTimestamp(v25, v129, v130, v131, v132);
                      v137 = objc_msgSend_objectForKeyedSubscript_(v133, v134, (uint64_t)v111, v135, v136);

                      if (v137 && v128)
                      {
                        uint64_t v177 = objc_msgSend_unsignedLongValue(v128, v138, v139, v140, v141);
                        v146 = v111;
                        uint64_t v147 = v120;
                        v148 = v112;
                        unint64_t v149 = objc_msgSend_unsignedLongValue(v137, v142, v143, v144, v145);
                        unint64_t v154 = 1000000000 * objc_msgSend_unsignedLongValue(v137, v150, v151, v152, v153);
                        uint64_t v159 = objc_msgSend_unsignedLongValue(v137, v155, v156, v157, v158);
                        unint64_t v160 = 1000000000 * v159;
                        BOOL v92 = v149 > v154;
                        uint64_t v112 = v148;
                        uint64_t v120 = v147;
                        uint64_t v111 = v146;
                        uint64_t v25 = v179;
                        self = v180;
                        if (v92) {
                          unint64_t v160 = v159;
                        }
                        unint64_t v161 = v160 - (v178 - v177);
                        if (v8 >= v161) {
                          unint64_t v162 = v160 - (v178 - v177);
                        }
                        else {
                          unint64_t v162 = v8;
                        }
                        if (v8) {
                          unint64_t v161 = v162;
                        }
                        if (v160 > v178 - v177) {
                          unint64_t v8 = v161;
                        }
                      }

                      uint64_t v119 = v182;
                    }
                    ++v121;
                  }
                  while (v119 != v121);
                  uint64_t v119 = objc_msgSend_countByEnumeratingWithState_objects_count_(v112, v115, (uint64_t)&v183, (uint64_t)v203, 16);
                }
                while (v119);
              }

              uint64_t v110 = v175 + 1;
            }
            while (v175 + 1 != v173);
            uint64_t v173 = objc_msgSend_countByEnumeratingWithState_objects_count_(v169, v106, (uint64_t)&v187, (uint64_t)v204, 16);
          }
          while (v173);
        }

        uint64_t v9 = v167 + 1;
      }
      while (v167 + 1 != v166);
      uint64_t v166 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v199, (uint64_t)v207, 16);
    }
    while (v166);
  }

  return v8;
}

- (void)__addRequest:(id)a3
{
  uint64_t v424 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = CWFGetOSLog();
  if (v5)
  {
    uint64_t v6 = CWFGetOSLog();
  }
  else
  {
    uint64_t v6 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v415 = 138543362;
    *(void *)v416 = v4;
    int v374 = 12;
    v372 = &v415;
    _os_log_send_and_compose_impl();
  }

  uint64_t v12 = objc_msgSend_parameters(v4, v8, v9, v10, v11);
  unint64_t v17 = objc_msgSend_trigger(v12, v13, v14, v15, v16);

  uint64_t v18 = NSNumber;
  __uint64_t v19 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v23 = objc_msgSend_numberWithUnsignedLongLong_(v18, v20, v19, v21, v22);
  triggerTimestampMap = self->_triggerTimestampMap;
  uint64_t v28 = objc_msgSend_numberWithInteger_(NSNumber, v25, v17, v26, v27);
  objc_msgSend_setObject_forKeyedSubscript_(triggerTimestampMap, v29, (uint64_t)v23, (uint64_t)v28, v30);

  uint64_t v31 = v17;
  if (v17 - 44 >= 8 && (v17 > 0x3F || ((1 << v17) & 0xC000000000000010) == 0)) {
    self->_previousNonRetryTrigger = v17;
  }
  if (objc_msgSend___shouldResetRetryIntervalIndexForTrigger_(self, v32, v17, v33, v34, v372, v374)) {
    objc_msgSend___resetRetryIntervalIndex(self, v35, v36, v37, v38);
  }
  uint64_t v39 = v4;
  if (v17 - 44 >= 8 && (v17 > 0x3F || ((1 << v17) & 0xC000000000000010) == 0))
  {
    uint64_t shouldAllowAutoHotspotForTrigger = objc_msgSend___shouldAllowAutoHotspotForTrigger_(self, v35, v17, v37, v38);
    objc_msgSend_setAllowAutoHotspotFallback_(v4, v41, shouldAllowAutoHotspotForTrigger, v42, v43);
  }
  objc_msgSend___invalidateAllowedKnownNetworksCacheForTrigger_(self, v35, v17, v37, v38);
  activeRequest = self->_activeRequest;
  v377 = self;
  unint64_t v378 = v17;
  v396 = v4;
  if (!activeRequest || self->_cancelled)
  {
    int v376 = 0;
    goto LABEL_39;
  }
  uint64_t v49 = objc_msgSend_parameters(activeRequest, v44, v45, v46, v47);
  if (objc_msgSend_trigger(v49, v50, v51, v52, v53) == v17)
  {
    objc_msgSend_parameters(self->_activeRequest, v54, v55, v56, v57);
    v59 = uint64_t v58 = v4;
    uint64_t v64 = objc_msgSend_mode(v59, v60, v61, v62, v63);
    uint64_t v69 = objc_msgSend_parameters(v4, v65, v66, v67, v68);
    if (v64 != objc_msgSend_mode(v69, v70, v71, v72, v73))
    {
      int v376 = 0;
LABEL_37:

      uint64_t v31 = v378;
      uint64_t v39 = v4;
      goto LABEL_38;
    }
    uint64_t v78 = objc_msgSend_parameters(self->_activeRequest, v74, v75, v76, v77);
    objc_msgSend_targetNetworkProfile(v78, v79, v80, v81, v82);
    v84 = uint64_t v83 = self;
    uint64_t v89 = objc_msgSend_identifier(v84, v85, v86, v87, v88);
    unint64_t v94 = objc_msgSend_parameters(v58, v90, v91, v92, v93);
    uint64_t v99 = objc_msgSend_targetNetworkProfile(v94, v95, v96, v97, v98);
    uint64_t v108 = objc_msgSend_identifier(v99, v100, v101, v102, v103);
    if (v89 != v108)
    {
      uint64_t v109 = objc_msgSend_parameters(v83->_activeRequest, v104, v105, v106, v107);
      v403 = objc_msgSend_targetNetworkProfile(v109, v110, v111, v112, v113);
      uint64_t v118 = objc_msgSend_identifier(v403, v114, v115, v116, v117);
      if (!v118)
      {
        int v376 = 0;
LABEL_35:

LABEL_36:
        self = v377;
        id v4 = v396;
        goto LABEL_37;
      }
      v399 = (void *)v118;
      v401 = v109;
      v397 = objc_msgSend_parameters(v396, v119, v120, v121, v122);
      v395 = objc_msgSend_targetNetworkProfile(v397, v123, v124, v125, v126);
      uint64_t v131 = objc_msgSend_identifier(v395, v127, v128, v129, v130);
      if (!v131)
      {
        int v376 = 0;
LABEL_34:

        uint64_t v109 = v401;
        goto LABEL_35;
      }
      v394 = (void *)v131;
      v392 = objc_msgSend_parameters(v377->_activeRequest, v132, v133, v134, v135);
      v390 = objc_msgSend_targetNetworkProfile(v392, v136, v137, v138, v139);
      uint64_t v144 = objc_msgSend_identifier(v390, v140, v141, v142, v143);
      v388 = objc_msgSend_parameters(v396, v145, v146, v147, v148);
      v387 = objc_msgSend_targetNetworkProfile(v388, v149, v150, v151, v152);
      v386 = objc_msgSend_identifier(v387, v153, v154, v155, v156);
      if (!objc_msgSend_isEqual_(v144, v157, (uint64_t)v386, v158, v159))
      {
        int v376 = 0;
LABEL_33:

        goto LABEL_34;
      }
      v385 = v144;
    }
    int v160 = objc_msgSend_allowAutoHotspotFallback(v377->_activeRequest, v104, v105, v106, v107);
    int v376 = v160 ^ objc_msgSend_allowAutoHotspotFallback(v396, v161, v162, v163, v164) ^ 1;
    uint64_t v144 = v385;
    if (v89 == v108) {
      goto LABEL_36;
    }
    goto LABEL_33;
  }
  int v376 = 0;
LABEL_38:

LABEL_39:
  long long v413 = 0u;
  long long v414 = 0u;
  long long v411 = 0u;
  long long v412 = 0u;
  uint64_t v165 = self->_pendingRequests;
  uint64_t v167 = objc_msgSend_countByEnumeratingWithState_objects_count_(v165, v166, (uint64_t)&v411, (uint64_t)v423, 16);
  if (v167)
  {
    uint64_t v172 = v167;
    uint64_t v173 = *(void *)v412;
    uint64_t v389 = *(void *)v412;
    v391 = v165;
LABEL_41:
    uint64_t v174 = 0;
    uint64_t v404 = v172;
    while (1)
    {
      if (*(void *)v412 != v173) {
        objc_enumerationMutation(v165);
      }
      uint64_t v175 = *(void **)(*((void *)&v411 + 1) + 8 * v174);
      uint64_t v176 = objc_msgSend_parameters(v175, v168, v169, v170, v171);
      if (objc_msgSend_trigger(v176, v177, v178, v179, v180) != v31) {
        goto LABEL_52;
      }
      long long v185 = objc_msgSend_parameters(v175, v181, v182, v183, v184);
      uint64_t v190 = objc_msgSend_mode(v185, v186, v187, v188, v189);
      long long v195 = objc_msgSend_parameters(v39, v191, v192, v193, v194);
      if (v190 != objc_msgSend_mode(v195, v196, v197, v198, v199))
      {

        uint64_t v172 = v404;
LABEL_52:

        goto LABEL_63;
      }
      v204 = objc_msgSend_parameters(v175, v200, v201, v202, v203);
      v402 = objc_msgSend_targetNetworkProfile(v204, v205, v206, v207, v208);
      v213 = objc_msgSend_identifier(v402, v209, v210, v211, v212);
      v400 = objc_msgSend_parameters(v39, v214, v215, v216, v217);
      v398 = objc_msgSend_targetNetworkProfile(v400, v218, v219, v220, v221);
      v230 = objc_msgSend_identifier(v398, v222, v223, v224, v225);
      if (v213 == v230)
      {
        v231 = v392;
      }
      else
      {
        v231 = objc_msgSend_parameters(v175, v226, v227, v228, v229);
        v395 = objc_msgSend_targetNetworkProfile(v231, v232, v233, v234, v235);
        v394 = objc_msgSend_identifier(v395, v236, v237, v238, v239);
        if (!v394)
        {
          char v285 = 0;
          v394 = 0;
          goto LABEL_61;
        }
        v387 = objc_msgSend_parameters(v396, v240, v241, v242, v243);
        v386 = objc_msgSend_targetNetworkProfile(v387, v244, v245, v246, v247);
        v385 = objc_msgSend_identifier(v386, v248, v249, v250, v251);
        if (!v385)
        {
          v385 = 0;
          char v285 = 0;
          uint64_t v31 = v378;
          goto LABEL_60;
        }
        v393 = v204;
        v384 = objc_msgSend_parameters(v175, v252, v253, v254, v255);
        v383 = objc_msgSend_targetNetworkProfile(v384, v256, v257, v258, v259);
        v264 = objc_msgSend_identifier(v383, v260, v261, v262, v263);
        v381 = objc_msgSend_parameters(v396, v265, v266, v267, v268);
        v380 = objc_msgSend_targetNetworkProfile(v381, v269, v270, v271, v272);
        objc_msgSend_identifier(v380, v273, v274, v275, v276);
        v379 = v382 = v264;
        if (!objc_msgSend_isEqual_(v264, v277, (uint64_t)v379, v278, v279))
        {
          char v285 = 0;
          uint64_t v31 = v378;
          v204 = v393;
LABEL_59:

LABEL_60:
LABEL_61:

          goto LABEL_62;
        }
        uint64_t v31 = v378;
        v204 = v393;
      }
      char v280 = objc_msgSend_allowAutoHotspotFallback(v175, v226, v227, v228, v229);
      char v285 = v280 ^ objc_msgSend_allowAutoHotspotFallback(v396, v281, v282, v283, v284) ^ 1;
      if (v213 != v230) {
        goto LABEL_59;
      }
LABEL_62:
      v392 = v231;

      uint64_t v39 = v396;
      uint64_t v173 = v389;
      uint64_t v165 = v391;
      uint64_t v172 = v404;
      if (v285)
      {
        v286 = v396;

        v287 = v377;
        if (!objc_msgSend___shouldIgnoreRequestWithTrigger_(v377, v300, v31, v301, v302)) {
          goto LABEL_74;
        }
LABEL_72:
        __uint64_t v303 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
        v304 = CWFGetOSLog();
        if (v304)
        {
          v305 = CWFGetOSLog();
        }
        else
        {
          v305 = MEMORY[0x1E4F14500];
          id v308 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v305, OS_LOG_TYPE_DEBUG))
        {
          int v415 = 134219010;
          *(void *)v416 = v303 / 0x3B9ACA00;
          *(_WORD *)&v416[8] = 2048;
          *(void *)v417 = v303 % 0x3B9ACA00 / 0x3E8;
          *(_WORD *)&v417[8] = 2082;
          v418 = "-[CWFAutoJoinManager __addRequest:]";
          __int16 v419 = 2082;
          v420 = "CWFAutoJoinManager.m";
          __int16 v421 = 1024;
          int v422 = 1330;
          LODWORD(v375) = 48;
          v373 = &v415;
          _os_log_send_and_compose_impl();
        }

        targetQueue = v287->_targetQueue;
        qos_class_t v310 = qos_class_self();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1B4F976BC;
        block[3] = &unk_1E60BB768;
        id v410 = v286;
        dispatch_block_t v311 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v310, 0, block);
        dispatch_async(targetQueue, v311);

        v312 = v410;
LABEL_89:

        goto LABEL_90;
      }
LABEL_63:
      if (v172 == ++v174)
      {
        uint64_t v172 = objc_msgSend_countByEnumeratingWithState_objects_count_(v165, v168, (uint64_t)&v411, (uint64_t)v423, 16);
        if (v172) {
          goto LABEL_41;
        }
        break;
      }
    }
  }
  v286 = v39;

  v287 = v377;
  if (objc_msgSend___shouldIgnoreRequestWithTrigger_(v377, v288, v31, v289, v290)) {
    goto LABEL_72;
  }
  if (v376 && !v377->_didConfigurationChangeSincePreviousAttempt)
  {
LABEL_74:
    v306 = CWFGetOSLog();
    if (v306)
    {
      v307 = CWFGetOSLog();
    }
    else
    {
      v307 = MEMORY[0x1E4F14500];
      id v313 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v307, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v415) = 0;
      LODWORD(v375) = 2;
      v373 = &v415;
      _os_log_send_and_compose_impl();
    }

    __uint64_t v314 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v315 = CWFGetOSLog();
    if (v315)
    {
      v316 = CWFGetOSLog();
    }
    else
    {
      v316 = MEMORY[0x1E4F14500];
      id v317 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v316, OS_LOG_TYPE_DEBUG))
    {
      int v415 = 134219010;
      *(void *)v416 = v314 / 0x3B9ACA00;
      *(_WORD *)&v416[8] = 2048;
      *(void *)v417 = v314 % 0x3B9ACA00 / 0x3E8;
      *(_WORD *)&v417[8] = 2082;
      v418 = "-[CWFAutoJoinManager __addRequest:]";
      __int16 v419 = 2082;
      v420 = "CWFAutoJoinManager.m";
      __int16 v421 = 1024;
      int v422 = 1340;
      LODWORD(v375) = 48;
      v373 = &v415;
      _os_log_send_and_compose_impl();
    }

    v318 = v287->_targetQueue;
    qos_class_t v319 = qos_class_self();
    v407[0] = MEMORY[0x1E4F143A8];
    v407[1] = 3221225472;
    v407[2] = sub_1B4F3588C;
    v407[3] = &unk_1E60BB768;
    id v408 = v286;
    dispatch_block_t v320 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v319, 0, v407);
    dispatch_async(v318, v320);

    v312 = v408;
    goto LABEL_89;
  }
  if (objc_msgSend___shouldInvokeImmediatelyForTrigger_(v377, v291, v31, v292, v293))
  {
    v298 = CWFGetOSLog();
    if (v298)
    {
      v299 = CWFGetOSLog();
    }
    else
    {
      v299 = MEMORY[0x1E4F14500];
      id v336 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v299, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v415) = 0;
      LODWORD(v375) = 2;
      v373 = &v415;
      _os_log_send_and_compose_impl();
    }

    v341 = v286;
    if (v377->_activeRequest && !v377->_requeued)
    {
      v342 = CWFGetOSLog();
      if (v342)
      {
        v343 = CWFGetOSLog();
      }
      else
      {
        v343 = MEMORY[0x1E4F14500];
        id v344 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v343, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v415) = 0;
        LODWORD(v375) = 2;
        v373 = &v415;
        _os_log_send_and_compose_impl();
      }

      pendingRequests = v377->_pendingRequests;
      v350 = objc_msgSend_copy(v377->_activeRequest, v346, v347, v348, v349);
      objc_msgSend_insertObject_atIndex_(pendingRequests, v351, (uint64_t)v350, 0, v352);

      v377->_requeued = 1;
      v341 = v286;
    }
    v353 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v337, v338, v339, v340, v373, v375);
    objc_msgSend_setAddedAt_(v341, v354, (uint64_t)v353, v355, v356);

    objc_msgSend_insertObject_atIndex_(v377->_pendingRequests, v357, (uint64_t)v341, 0, v358);
  }
  else
  {
    v329 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v294, v295, v296, v297);
    objc_msgSend_setAddedAt_(v39, v330, (uint64_t)v329, v331, v332);

    objc_msgSend_addObject_(v377->_pendingRequests, v333, (uint64_t)v39, v334, v335);
  }
  if (v377->_activeRequest)
  {
    dispatch_qos_class_t v359 = objc_msgSend___qosForAutoJoinTrigger_(v377, v321, v31, v323, v324);
    if (v359 > v377->_highestPendingQoS)
    {
      dispatch_qos_class_t v360 = v359;
      v361 = CWFGetOSLog();
      if (v361)
      {
        v362 = CWFGetOSLog();
      }
      else
      {
        v362 = MEMORY[0x1E4F14500];
        id v363 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v362, OS_LOG_TYPE_DEBUG))
      {
        unsigned int highestPendingQoS = v377->_highestPendingQoS;
        v369 = sub_1B4F520D4(v378, v364, v365, v366, v367);
        int v415 = 67109634;
        *(_DWORD *)v416 = v360;
        *(_WORD *)&v416[4] = 1024;
        *(_DWORD *)&v416[6] = highestPendingQoS;
        *(_WORD *)v417 = 2114;
        *(void *)&v417[2] = v369;
        LODWORD(v375) = 24;
        v373 = &v415;
        _os_log_send_and_compose_impl();
      }
      v377->_unsigned int highestPendingQoS = v360;
      internalQueue = v377->_internalQueue;
      v405[0] = MEMORY[0x1E4F143A8];
      v405[1] = 3221225472;
      v405[2] = sub_1B4F978B0;
      v405[3] = &unk_1E60BBAD8;
      v405[4] = v377;
      dispatch_qos_class_t v406 = v360;
      dispatch_block_t v371 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v360, 0, v405);
      dispatch_async(internalQueue, v371);
    }
  }
LABEL_90:
  if ((objc_msgSend___nextRequest(v287, v321, v322, v323, v324, v373, v375) & 1) == 0 && !v287->_isRetryScheduled) {
    objc_msgSend___updateRetrySchedule(v287, v325, v326, v327, v328);
  }
}

- (void)__invalidateAllowedKnownNetworksCacheForTrigger:(int64_t)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 <= 0x28 && ((1 << a3) & 0x101A03A0100) != 0)
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    objc_msgSend_allObjects(self->_knownNetworks, a2, a3, v3, v4);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v55, (uint64_t)v59, 16);
    if (v54)
    {
      uint64_t v53 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v54; ++i)
        {
          if (*(void *)v56 != v53) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          uint64_t v16 = objc_msgSend_identifier(v15, v10, v11, v12, v13);

          if (v16)
          {
            if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0x14
              && objc_msgSend_isEAP(v15, v10, v11, v12, v13)
              && (objc_msgSend_isSystemMode(v15, v10, v11, v12, v13) & 1) == 0)
            {
              goto LABEL_19;
            }
            int v17 = 0;
            if (((1 << a3) & 0x101A00A0100) != 0)
            {
              knownNetworkAllowCache = self->_knownNetworkAllowCache;
              uint64_t v5 = objc_msgSend_identifier(v15, v10, v11, v12, v13);
              uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(knownNetworkAllowCache, v19, (uint64_t)v5, v20, v21);
              if (v6)
              {
                uint64_t v22 = self->_knownNetworkAllowCache;
                uint64_t v23 = objc_msgSend_identifier(v15, v10, v11, v12, v13);
                uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v22, v24, (uint64_t)v23, v25, v26);
                int v17 = objc_msgSend_BOOLValue(v27, v28, v29, v30, v31) ^ 1;
              }
              else
              {
                int v17 = 0;
              }
            }
            if (((1 << a3) & 0x101A00A0100) != 0)
            {
            }
            if (v17)
            {
LABEL_19:
              uint64_t v32 = self->_knownNetworkAllowCache;
              uint64_t v33 = objc_msgSend_identifier(v15, v10, v11, v12, v13);
              objc_msgSend_setObject_forKeyedSubscript_(v32, v34, 0, (uint64_t)v33, v35);

              knownNetworkAllowErrorCache = self->_knownNetworkAllowErrorCache;
              uint64_t v41 = objc_msgSend_identifier(v15, v37, v38, v39, v40);
              objc_msgSend_setObject_forKeyedSubscript_(knownNetworkAllowErrorCache, v42, 0, (uint64_t)v41, v43);

              knownNetworkDeferCache = self->_knownNetworkDeferCache;
              uint64_t v49 = objc_msgSend_identifier(v15, v45, v46, v47, v48);
              objc_msgSend_setObject_forKeyedSubscript_(knownNetworkDeferCache, v50, 0, (uint64_t)v49, v51);
            }
          }
        }
        uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v55, (uint64_t)v59, 16);
      }
      while (v54);
    }
  }
}

- (void)setAssociatedNetwork:(id)a3
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  p_uint64_t associatedNetwork = (void **)&v6->_associatedNetwork;
  uint64_t associatedNetwork = (uint64_t)v6->_associatedNetwork;
  if ((id)associatedNetwork != v5
    && (!v5 || !associatedNetwork || !objc_msgSend_isEqual_(v5, v7, associatedNetwork, v8, v9)))
  {
    goto LABEL_13;
  }
  uint64_t v12 = objc_msgSend_matchingKnownNetworkProfile(v5, v7, associatedNetwork, v8, v9);
  uint64_t v21 = objc_msgSend_matchingKnownNetworkProfile(*p_associatedNetwork, v13, v14, v15, v16);
  if (v12 == v21)
  {

    goto LABEL_35;
  }
  uint64_t v26 = objc_msgSend_matchingKnownNetworkProfile(v5, v17, v18, v19, v20);
  if (!v26) {
    goto LABEL_12;
  }
  uint64_t v31 = objc_msgSend_matchingKnownNetworkProfile(*p_associatedNetwork, v22, v23, v24, v25);
  if (!v31)
  {

LABEL_12:
    goto LABEL_13;
  }
  uint64_t v32 = objc_msgSend_matchingKnownNetworkProfile(v5, v27, v28, v29, v30);
  uint64_t v37 = objc_msgSend_matchingKnownNetworkProfile(*p_associatedNetwork, v33, v34, v35, v36);
  HIDWORD(v133) = objc_msgSend_isEqual_(v32, v38, (uint64_t)v37, v39, v40);

  if ((v133 & 0x100000000) != 0) {
    goto LABEL_35;
  }
LABEL_13:
  uint64_t v41 = CWFGetOSLog();
  if (v41)
  {
    uint64_t v42 = CWFGetOSLog();
  }
  else
  {
    uint64_t v42 = MEMORY[0x1E4F14500];
    id v43 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
  {
    int v134 = 138543362;
    id v135 = v5;
    LODWORD(v133) = 12;
    uint64_t v132 = &v134;
    _os_log_send_and_compose_impl();
  }

  if ((v5 != 0) == (*p_associatedNetwork == 0)) {
    v6->_linkChangeTimestamp = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  }
  objc_storeStrong((id *)&v6->_associatedNetwork, a3);
  uint64_t v48 = objc_msgSend_matchingKnownNetworkProfile(v6->_steerToNetwork, v44, v45, v46, v47);
  long long v57 = objc_msgSend_identifier(v48, v49, v50, v51, v52);
  if (!v57) {
    goto LABEL_25;
  }
  long long v58 = objc_msgSend_matchingKnownNetworkProfile(*p_associatedNetwork, v53, v54, v55, v56);
  uint64_t v67 = objc_msgSend_identifier(v58, v59, v60, v61, v62);
  if (!v67)
  {

LABEL_25:
    goto LABEL_26;
  }
  uint64_t v68 = objc_msgSend_matchingKnownNetworkProfile(v6->_steerToNetwork, v63, v64, v65, v66);
  uint64_t v73 = objc_msgSend_identifier(v68, v69, v70, v71, v72);
  uint64_t v78 = objc_msgSend_matchingKnownNetworkProfile(*p_associatedNetwork, v74, v75, v76, v77);
  uint64_t v83 = objc_msgSend_identifier(v78, v79, v80, v81, v82);
  HIDWORD(v133) = objc_msgSend_isEqual_(v73, v84, (uint64_t)v83, v85, v86);

  if ((v133 & 0x100000000) == 0)
  {
LABEL_26:
    steerToNetwork = v6->_steerToNetwork;
    v6->_steerToNetwork = 0;

    steerFromNetwork = v6->_steerFromNetwork;
    v6->_steerFromNetwork = 0;
  }
  if (v5)
  {
    uint64_t v93 = objc_msgSend_networkProfile(v5, v87, v88, v89, v90);
    uint64_t v102 = objc_msgSend_identifier(v93, v94, v95, v96, v97);
    if (v102)
    {
      disallowedKnownNetworks = v6->_disallowedKnownNetworks;
      uint64_t v104 = objc_msgSend_identifier(v93, v98, v99, v100, v101);
      LODWORD(disallowedKnownNetworks) = objc_msgSend_containsObject_(disallowedKnownNetworks, v105, (uint64_t)v104, v106, v107);

      if (disallowedKnownNetworks)
      {
        uint64_t v108 = v6->_disallowedKnownNetworks;
        uint64_t v109 = objc_msgSend_identifier(v93, v98, v99, v100, v101);
        objc_msgSend_removeObject_(v108, v110, (uint64_t)v109, v111, v112);
      }
    }
    uint64_t v117 = objc_msgSend_identifier(v93, v98, v99, v100, v101, v132, v133);
    if (v117)
    {
      failedToJoinKnownNetworkIDs = v6->_failedToJoinKnownNetworkIDs;
      uint64_t v119 = objc_msgSend_identifier(v93, v113, v114, v115, v116);
      LODWORD(failedToJoinKnownNetworkIDs) = objc_msgSend_containsObject_(failedToJoinKnownNetworkIDs, v120, (uint64_t)v119, v121, v122);

      if (failedToJoinKnownNetworkIDs)
      {
        uint64_t v127 = v6->_failedToJoinKnownNetworkIDs;
        uint64_t v128 = objc_msgSend_identifier(v93, v123, v124, v125, v126);
        objc_msgSend_removeObject_(v127, v129, (uint64_t)v128, v130, v131);
      }
    }
  }
LABEL_35:
  objc_sync_exit(v6);
}

- (BOOL)__shouldResetRetryIntervalIndexForTrigger:(int64_t)a3
{
  return ((unint64_t)a3 < 0x3C) & (0x90000032010018CuLL >> a3);
}

- (BOOL)__shouldIgnoreRequestWithTrigger:(int64_t)a3
{
  if (a3 != 32)
  {
    if (a3 == 58 || a3 == 34)
    {
      id v7 = objc_msgSend_associatedNetwork(self, a2, a3, v3, v4);

      if (!v7)
      {
        uint64_t v8 = CWFGetOSLog();
        if (v8)
        {
          uint64_t v9 = CWFGetOSLog();
        }
        else
        {
          uint64_t v9 = MEMORY[0x1E4F14500];
          id v11 = MEMORY[0x1E4F14500];
        }

        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        uint64_t v16 = sub_1B4F520D4(a3, v12, v13, v14, v15);
LABEL_13:
        _os_log_send_and_compose_impl();

LABEL_14:
        LOBYTE(activeRequest) = 1;
        return (char)activeRequest;
      }
    }
    goto LABEL_9;
  }
  activeRequest = self->_activeRequest;
  if (!activeRequest) {
    return (char)activeRequest;
  }
  if (!self->_cancelled)
  {
    int v17 = objc_msgSend_parameters(activeRequest, a2, 32, v3, v4);
    if (objc_msgSend_trigger(v17, v18, v19, v20, v21) == 32)
    {
    }
    else
    {
      uint64_t v26 = objc_msgSend_parameters(self->_activeRequest, v22, v23, v24, v25);
      uint64_t v31 = objc_msgSend_trigger(v26, v27, v28, v29, v30);

      if (v31 != 47) {
        goto LABEL_9;
      }
    }
    uint64_t v32 = CWFGetOSLog();
    if (v32)
    {
      uint64_t v9 = CWFGetOSLog();
    }
    else
    {
      uint64_t v9 = MEMORY[0x1E4F14500];
      id v33 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    uint64_t v16 = sub_1B4F520D4(0x20uLL, v34, v35, v36, v37);
    goto LABEL_13;
  }
LABEL_9:
  LOBYTE(activeRequest) = 0;
  return (char)activeRequest;
}

- (BOOL)__shouldAllowAutoHotspotForTrigger:(int64_t)a3
{
  return a3 == 61;
}

- (CWFAutoJoinManager)init
{
  v78.receiver = self;
  v78.super_class = (Class)CWFAutoJoinManager;
  id v2 = [(CWFAutoJoinManager *)&v78 init];
  if (!v2) {
    goto LABEL_29;
  }
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.corewifi.auto-join", v3);
  id v5 = (void *)*((void *)v2 + 1);
  *((void *)v2 + 1) = v4;

  if (!*((void *)v2 + 1)) {
    goto LABEL_29;
  }
  uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.corewifi.auto-join.target", v6);
  uint64_t v8 = (void *)*((void *)v2 + 68);
  *((void *)v2 + 68) = v7;

  if (!*((void *)v2 + 68)) {
    goto LABEL_29;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v10 = (void *)*((void *)v2 + 12);
  *((void *)v2 + 12) = v9;

  if (!*((void *)v2 + 12)) {
    goto LABEL_29;
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v12 = (void *)*((void *)v2 + 20);
  *((void *)v2 + 20) = v11;

  if (!*((void *)v2 + 20)) {
    goto LABEL_29;
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v14 = (void *)*((void *)v2 + 27);
  *((void *)v2 + 27) = v13;

  if (!*((void *)v2 + 27)) {
    goto LABEL_29;
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v16 = (void *)*((void *)v2 + 28);
  *((void *)v2 + 28) = v15;

  if (!*((void *)v2 + 28)) {
    goto LABEL_29;
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v18 = (void *)*((void *)v2 + 29);
  *((void *)v2 + 29) = v17;

  if (!*((void *)v2 + 29)) {
    goto LABEL_29;
  }
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v20 = (void *)*((void *)v2 + 11);
  *((void *)v2 + 11) = v19;

  if (!*((void *)v2 + 11)) {
    goto LABEL_29;
  }
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v22 = (void *)*((void *)v2 + 21);
  *((void *)v2 + 21) = v21;

  if (!*((void *)v2 + 21)) {
    goto LABEL_29;
  }
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v24 = (void *)*((void *)v2 + 22);
  *((void *)v2 + 22) = v23;

  if (!*((void *)v2 + 22)) {
    goto LABEL_29;
  }
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v26 = (void *)*((void *)v2 + 23);
  *((void *)v2 + 23) = v25;

  if (!*((void *)v2 + 23)) {
    goto LABEL_29;
  }
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v28 = (void *)*((void *)v2 + 24);
  *((void *)v2 + 24) = v27;

  if (!*((void *)v2 + 24)) {
    goto LABEL_29;
  }
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v30 = (void *)*((void *)v2 + 33);
  *((void *)v2 + 33) = v29;

  if (!*((void *)v2 + 33)) {
    goto LABEL_29;
  }
  uint64_t v31 = objc_alloc_init(CWFAutoJoinStatistics);
  uint64_t v32 = (void *)*((void *)v2 + 15);
  *((void *)v2 + 15) = v31;

  if (!*((void *)v2 + 15)) {
    goto LABEL_29;
  }
  uint64_t v37 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v33, v34, v35, v36);
  objc_msgSend_setStartedAt_(*((void **)v2 + 15), v38, (uint64_t)v37, v39, v40);

  dispatch_source_t v41 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v2 + 1));
  uint64_t v42 = (void *)*((void *)v2 + 16);
  *((void *)v2 + 16) = v41;

  id v43 = *((void *)v2 + 16);
  if (!v43) {
    goto LABEL_29;
  }
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = sub_1B4F932E8;
  handler[3] = &unk_1E60BB768;
  uint64_t v44 = (CWFAutoJoinManager *)v2;
  uint64_t v77 = v44;
  dispatch_source_set_event_handler(v43, handler);

  uint64_t v45 = *((void *)v2 + 16);
  dispatch_time_t v46 = dispatch_walltime(0, 86400000000000);
  dispatch_source_set_timer(v45, v46, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume(*((dispatch_object_t *)v2 + 16));
  uint64_t v47 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  hiddenNetworkChannels = v44->_hiddenNetworkChannels;
  v44->_hiddenNetworkChannels = v47;

  if (!v44->_hiddenNetworkChannels) {
    goto LABEL_29;
  }
  uint64_t v49 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  cachedKnownNetworksContexts = v44->_cachedKnownNetworksContexts;
  v44->_cachedKnownNetworksContexts = v49;

  if (!v44->_cachedKnownNetworksContexts) {
    goto LABEL_29;
  }
  uint64_t v51 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  knownNetworkSSIDMap = v44->_knownNetworkSSIDMap;
  v44->_knownNetworkSSIDMap = v51;

  if (!v44->_knownNetworkSSIDMap) {
    goto LABEL_29;
  }
  uint64_t v53 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  knownNetworkPasspointDomainMap = v44->_knownNetworkPasspointDomainMap;
  v44->_knownNetworkPasspointDomainMap = v53;

  if (!v44->_knownNetworkPasspointDomainMap) {
    goto LABEL_29;
  }
  uint64_t v55 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
  deferredKnownNetworks = v44->_deferredKnownNetworks;
  v44->_deferredKnownNetworks = v55;

  if (!v44->_deferredKnownNetworks) {
    goto LABEL_29;
  }
  long long v57 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  knownNetworkAllowCache = v44->_knownNetworkAllowCache;
  v44->_knownNetworkAllowCache = v57;

  if (!v44->_knownNetworkAllowCache) {
    goto LABEL_29;
  }
  uint64_t v59 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  knownNetworkAllowErrorCache = v44->_knownNetworkAllowErrorCache;
  v44->_knownNetworkAllowErrorCache = v59;

  if (!v44->_knownNetworkAllowErrorCache) {
    goto LABEL_29;
  }
  uint64_t v61 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  knownNetworkDeferCache = v44->_knownNetworkDeferCache;
  v44->_knownNetworkDeferCache = v61;

  if (!v44->_knownNetworkDeferCache) {
    goto LABEL_29;
  }
  uint64_t v63 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  updatedAllowCacheKnownNetworks = v44->_updatedAllowCacheKnownNetworks;
  v44->_updatedAllowCacheKnownNetworks = v63;

  if (!v44->_updatedAllowCacheKnownNetworks) {
    goto LABEL_29;
  }
  uint64_t v65 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  disallowedKnownNetworks = v44->_disallowedKnownNetworks;
  v44->_disallowedKnownNetworks = v65;

  if (v44->_disallowedKnownNetworks)
  {
    objc_msgSend___setupRetryIntervals(v44, v67, v68, v69, v70);
    objc_msgSend___setupThrottleIntervals(v44, v71, v72, v73, v74);
  }
  else
  {
LABEL_29:

    return 0;
  }
  return v44;
}

- (void)invalidate
{
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_invalidated)
  {
    *(_WORD *)&v2->_invalidated = 257;
    underlyingCancelError = v2->_underlyingCancelError;
    v2->_underlyingCancelError = 0;

    internalQueue = v2->_internalQueue;
    qos_class_t v5 = qos_class_self();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F936DC;
    block[3] = &unk_1E60BB768;
    void block[4] = v2;
    dispatch_block_t v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v5, 0, block);
    dispatch_async(internalQueue, v6);
  }
  objc_sync_exit(v2);
}

- (NSSet)knownNetworks
{
  id v2 = self;
  objc_sync_enter(v2);
  dispatch_queue_t v7 = objc_msgSend_copy(v2->_knownNetworks, v3, v4, v5, v6);
  objc_sync_exit(v2);

  return (NSSet *)v7;
}

- (CWFScanResult)associatedNetwork
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_associatedNetwork;
  objc_sync_exit(v2);

  return v3;
}

- (void)__resetRetryIntervalIndex
{
  uint64_t v3 = CWFGetOSLog();
  if (v3)
  {
    uint64_t v4 = CWFGetOSLog();
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = sub_1B4F54A8C(self->_retrySchedule, v6, v7, v8, v9);
    _os_log_send_and_compose_impl();
  }
  self->_unint64_t retryScheduleIndex = 0;
  if (self->_isRetryScheduled) {
    objc_msgSend___updateRetrySchedule(self, v10, v11, v12, v13);
  }
}

- (void)setKnownNetworks:(id)a3
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  context = (void *)MEMORY[0x1BA995D10]();
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t knownNetworks = (uint64_t)v5->_knownNetworks;
  uint64_t v118 = v4;
  if ((id)knownNetworks != v4
    && (!v4 || !knownNetworks || (objc_msgSend_isEqual_(v4, v6, knownNetworks, v7, v8) & 1) == 0))
  {
    uint64_t v10 = CWFGetOSLog();
    if (v10)
    {
      uint64_t v11 = CWFGetOSLog();
    }
    else
    {
      uint64_t v11 = MEMORY[0x1E4F14500];
      id v12 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v124 = 0;
      LODWORD(v116) = 2;
      uint64_t v115 = &v124;
      _os_log_send_and_compose_impl();
    }

    id v17 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v13, v14, v15, v16);
    uint64_t v119 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v18, v19, v20, v21);
    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    id v22 = v4;
    char v24 = 0;
    uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v120, (uint64_t)v125, 16);
    if (v28)
    {
      uint64_t v29 = *(void *)v121;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v121 != v29) {
            objc_enumerationMutation(v22);
          }
          uint64_t v31 = *(void **)(*((void *)&v120 + 1) + 8 * i);
          if ((objc_msgSend_containsObject_(v5->_knownNetworks, v25, (uint64_t)v31, v26, v27, v115, v116) & 1) == 0)
          {
            knownNetworkAllowCache = v5->_knownNetworkAllowCache;
            uint64_t v37 = objc_msgSend_identifier(v31, v32, v33, v34, v35);
            objc_msgSend_setObject_forKeyedSubscript_(knownNetworkAllowCache, v38, 0, (uint64_t)v37, v39);

            knownNetworkAllowErrorCache = v5->_knownNetworkAllowErrorCache;
            uint64_t v45 = objc_msgSend_identifier(v31, v41, v42, v43, v44);
            objc_msgSend_setObject_forKeyedSubscript_(knownNetworkAllowErrorCache, v46, 0, (uint64_t)v45, v47);

            knownNetworkDeferCache = v5->_knownNetworkDeferCache;
            uint64_t v53 = objc_msgSend_identifier(v31, v49, v50, v51, v52);
            objc_msgSend_setObject_forKeyedSubscript_(knownNetworkDeferCache, v54, 0, (uint64_t)v53, v55);
          }
          if ((objc_msgSend_isAutoJoinDisabled(v31, v32, v33, v34, v35) & 1) == 0)
          {
            long long v57 = objc_msgSend_SSID(v31, v25, v56, v26, v27);

            if (v57)
            {
              knownNetworkSSIDMap = v5->_knownNetworkSSIDMap;
              uint64_t v63 = objc_msgSend_SSID(v31, v58, v59, v60, v61);
              uint64_t v67 = objc_msgSend_objectForKeyedSubscript_(knownNetworkSSIDMap, v64, (uint64_t)v63, v65, v66);

              if (!v67
                || (uint64_t v72 = objc_msgSend_effectiveSupportedSecurityTypes(v67, v68, v69, v70, v71),
                    v72 != objc_msgSend_effectiveSupportedSecurityTypes(v31, v73, v74, v75, v76)))
              {
                char v24 = 1;
              }
              uint64_t v77 = objc_msgSend_SSID(v31, v68, v69, v70, v71);
              objc_msgSend_setObject_forKeyedSubscript_(v17, v78, (uint64_t)v31, (uint64_t)v77, v79);
            }
            if (objc_msgSend_isPasspoint(v31, v58, v59, v60, v61))
            {
              knownNetworkPasspointDomainMap = v5->_knownNetworkPasspointDomainMap;
              uint64_t v82 = objc_msgSend_domainName(v31, v25, v80, v26, v27);
              uint64_t v86 = objc_msgSend_objectForKeyedSubscript_(knownNetworkPasspointDomainMap, v83, (uint64_t)v82, v84, v85);

              if (!v86
                || (uint64_t v91 = objc_msgSend_effectiveSupportedSecurityTypes(v86, v87, v88, v89, v90),
                    v91 != objc_msgSend_effectiveSupportedSecurityTypes(v31, v92, v93, v94, v95)))
              {
                char v24 = 1;
              }
              uint64_t v96 = objc_msgSend_domainName(v31, v87, v88, v89, v90);
              objc_msgSend_setObject_forKeyedSubscript_(v119, v97, (uint64_t)v31, (uint64_t)v96, v98);
            }
          }
        }
        uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v120, (uint64_t)v125, 16);
      }
      while (v28);
    }

    uint64_t v103 = objc_msgSend_copy(v22, v99, v100, v101, v102);
    uint64_t v104 = v5->_knownNetworks;
    v5->_uint64_t knownNetworks = (NSSet *)v103;

    objc_msgSend_setDictionary_(v5->_knownNetworkSSIDMap, v105, (uint64_t)v17, v106, v107);
    objc_msgSend_setDictionary_(v5->_knownNetworkPasspointDomainMap, v108, (uint64_t)v119, v109, v110);
    if (v24)
    {
      v5->_didConfigurationChangeSincePreviousAttempt = 1;
      v5->_resetCachedKnownNetworksContext = 1;
      objc_msgSend___resetRetryIntervalIndex(v5, v111, v112, v113, v114);
    }
  }
  objc_sync_exit(v5);
}

- (NSSet)supportedChannels
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v7 = objc_msgSend_copy(v2->_supportedChannels, v3, v4, v5, v6);
  objc_sync_exit(v2);

  return (NSSet *)v7;
}

- (CLLocation)location
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v7 = objc_msgSend_copy(v2->_location, v3, v4, v5, v6);
  objc_sync_exit(v2);

  return (CLLocation *)v7;
}

- (int64_t)retrySchedule
{
  id v2 = self;
  objc_sync_enter(v2);
  int64_t retrySchedule = v2->_retrySchedule;
  objc_sync_exit(v2);

  return retrySchedule;
}

- (BOOL)__shouldAlwaysUpdateRetrySchedule:(int64_t)a3
{
  return (unint64_t)(a3 - 3) < 2;
}

- (BOOL)maxCompatibilityEnabled
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL maxCompatibilityEnabled = v2->_maxCompatibilityEnabled;
  objc_sync_exit(v2);

  return maxCompatibilityEnabled;
}

- (void)cancelAutoJoinWithUUID:(id)a3 error:(id)a4 reply:(id)a5
{
  uint64_t v170 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v140 = a4;
  id v138 = a5;
  uint64_t v9 = self;
  objc_sync_enter(v9);
  uint64_t v137 = v8;
  if (v9->_invalidated)
  {
    uint64_t v14 = CWFGetOSLog();
    if (v14)
    {
      uint64_t v15 = CWFGetOSLog();
    }
    else
    {
      uint64_t v15 = MEMORY[0x1E4F14500];
      id v27 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = objc_msgSend_UUIDString(v8, v28, v29, v30, v31);
      objc_msgSend_substringToIndex_(v32, v33, 5, v34, v35);
      v161 = int v160 = 138543362;
      _os_log_send_and_compose_impl();
    }
    __uint64_t v36 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    uint64_t v37 = CWFGetOSLog();
    if (v37)
    {
      uint64_t v38 = CWFGetOSLog();
    }
    else
    {
      uint64_t v38 = MEMORY[0x1E4F14500];
      id v39 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      int v160 = 134219010;
      unint64_t v161 = v36 / 0x3B9ACA00;
      __int16 v162 = 2048;
      unint64_t v163 = v36 % 0x3B9ACA00 / 0x3E8;
      __int16 v164 = 2082;
      uint64_t v165 = "-[CWFAutoJoinManager cancelAutoJoinWithUUID:error:reply:]";
      __int16 v166 = 2082;
      uint64_t v167 = "CWFAutoJoinManager.m";
      __int16 v168 = 1024;
      int v169 = 771;
      _os_log_send_and_compose_impl();
    }

    targetQueue = v9->_targetQueue;
    qos_class_t v41 = qos_class_self();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F95518;
    block[3] = &unk_1E60BBCF8;
    id v158 = v138;
    dispatch_block_t v42 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v41, 0, block);
    dispatch_async(targetQueue, v42);
  }
  else if (v8)
  {
    uint64_t v16 = objc_msgSend_UUID(v9->_activeRequest, v10, v11, v12, v13);
    char isEqual = objc_msgSend_isEqual_(v8, v17, (uint64_t)v16, v18, v19);

    if (isEqual)
    {
      id v25 = CWFGetOSLog();
      if (v25)
      {
        uint64_t v26 = CWFGetOSLog();
      }
      else
      {
        uint64_t v26 = MEMORY[0x1E4F14500];
        id v85 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        activeRequest = v9->_activeRequest;
        int v160 = 138543362;
        unint64_t v161 = (unint64_t)activeRequest;
        _os_log_send_and_compose_impl();
      }

      v9->_cancelled = 1;
      uint64_t v91 = objc_msgSend_copy(v140, v87, v88, v89, v90);
      underlyingCancelError = v9->_underlyingCancelError;
      v9->_underlyingCancelError = (NSError *)v91;

      internalQueue = v9->_internalQueue;
      qos_class_t v94 = qos_class_self();
      v155[0] = MEMORY[0x1E4F143A8];
      v155[1] = 3221225472;
      v155[2] = sub_1B4F956E8;
      v155[3] = &unk_1E60BBF00;
      v155[4] = v9;
      id v156 = v138;
      dispatch_block_t v95 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v94, 0, v155);
      dispatch_async(internalQueue, v95);
    }
    else
    {
      for (unint64_t i = 0; i < objc_msgSend_count(v9->_pendingRequests, v21, v22, v23, v24); ++i)
      {
        uint64_t v49 = objc_msgSend_objectAtIndexedSubscript_(v9->_pendingRequests, v46, i, v47, v48);
        uint64_t v54 = objc_msgSend_UUID(v49, v50, v51, v52, v53);
        char v58 = objc_msgSend_isEqual_(v8, v55, (uint64_t)v54, v56, v57);

        if (v58)
        {
          uint64_t v59 = CWFGetOSLog();
          if (v59)
          {
            uint64_t v60 = CWFGetOSLog();
          }
          else
          {
            uint64_t v60 = MEMORY[0x1E4F14500];
            id v96 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            int v160 = 138543362;
            unint64_t v161 = (unint64_t)v49;
            _os_log_send_and_compose_impl();
          }

          __uint64_t v97 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          uint64_t v98 = CWFGetOSLog();
          if (v98)
          {
            uint64_t v99 = CWFGetOSLog();
          }
          else
          {
            uint64_t v99 = MEMORY[0x1E4F14500];
            id v100 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
          {
            int v160 = 134219010;
            unint64_t v161 = v97 / 0x3B9ACA00;
            __int16 v162 = 2048;
            unint64_t v163 = v97 % 0x3B9ACA00 / 0x3E8;
            __int16 v164 = 2082;
            uint64_t v165 = "-[CWFAutoJoinManager cancelAutoJoinWithUUID:error:reply:]";
            __int16 v166 = 2082;
            uint64_t v167 = "CWFAutoJoinManager.m";
            __int16 v168 = 1024;
            int v169 = 807;
            _os_log_send_and_compose_impl();
          }

          uint64_t v101 = v9->_targetQueue;
          qos_class_t v102 = qos_class_self();
          v151[0] = MEMORY[0x1E4F143A8];
          v151[1] = 3221225472;
          v151[2] = sub_1B4F95AA0;
          v151[3] = &unk_1E60BBD20;
          id v103 = v49;
          id v152 = v103;
          id v153 = v140;
          id v154 = v138;
          dispatch_block_t v104 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v102, 0, v151);
          dispatch_async(v101, v104);

          objc_msgSend_removeObjectAtIndex_(v9->_pendingRequests, v105, i, v106, v107);
          goto LABEL_17;
        }
      }
      uint64_t v119 = CWFGetOSLog();
      if (v119)
      {
        long long v120 = CWFGetOSLog();
      }
      else
      {
        long long v120 = MEMORY[0x1E4F14500];
        id v121 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v126 = objc_msgSend_UUIDString(v8, v122, v123, v124, v125);
        objc_msgSend_substringToIndex_(v126, v127, 5, v128, v129);
        v161 = int v160 = 138543362;
        _os_log_send_and_compose_impl();
      }
      __uint64_t v130 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      uint64_t v131 = CWFGetOSLog();
      if (v131)
      {
        uint64_t v132 = CWFGetOSLog();
      }
      else
      {
        uint64_t v132 = MEMORY[0x1E4F14500];
        id v133 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG))
      {
        int v160 = 134219010;
        unint64_t v161 = v130 / 0x3B9ACA00;
        __int16 v162 = 2048;
        unint64_t v163 = v130 % 0x3B9ACA00 / 0x3E8;
        __int16 v164 = 2082;
        uint64_t v165 = "-[CWFAutoJoinManager cancelAutoJoinWithUUID:error:reply:]";
        __int16 v166 = 2082;
        uint64_t v167 = "CWFAutoJoinManager.m";
        __int16 v168 = 1024;
        int v169 = 823;
        _os_log_send_and_compose_impl();
      }

      int v134 = v9->_targetQueue;
      qos_class_t v135 = qos_class_self();
      v149[0] = MEMORY[0x1E4F143A8];
      v149[1] = 3221225472;
      v149[2] = sub_1B4F95D04;
      v149[3] = &unk_1E60BBCF8;
      id v150 = v138;
      dispatch_block_t v136 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v135, 0, v149);
      dispatch_async(v134, v136);
    }
  }
  else
  {
    uint64_t v43 = CWFGetOSLog();
    if (v43)
    {
      uint64_t v44 = CWFGetOSLog();
    }
    else
    {
      uint64_t v44 = MEMORY[0x1E4F14500];
      id v61 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v160) = 0;
      _os_log_send_and_compose_impl();
    }

    long long v147 = 0u;
    long long v148 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    uint64_t v139 = v9->_pendingRequests;
    uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v139, v62, (uint64_t)&v145, (uint64_t)v159, 16);
    if (v63)
    {
      uint64_t v64 = MEMORY[0x1E4F14500];
      uint64_t v65 = *(void *)v146;
      do
      {
        for (uint64_t j = 0; j != v63; ++j)
        {
          if (*(void *)v146 != v65) {
            objc_enumerationMutation(v139);
          }
          unint64_t v67 = *(void *)(*((void *)&v145 + 1) + 8 * j);
          uint64_t v68 = CWFGetOSLog();
          if (v68)
          {
            uint64_t v69 = CWFGetOSLog();
          }
          else
          {
            uint64_t v70 = v64;
            uint64_t v69 = v64;
          }

          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            int v160 = 138543362;
            unint64_t v161 = v67;
            _os_log_send_and_compose_impl();
          }

          __uint64_t v71 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          uint64_t v72 = CWFGetOSLog();
          if (v72)
          {
            uint64_t v73 = CWFGetOSLog();
          }
          else
          {
            uint64_t v74 = v64;
            uint64_t v73 = v64;
          }

          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
          {
            int v160 = 134219010;
            unint64_t v161 = v71 / 0x3B9ACA00;
            __int16 v162 = 2048;
            unint64_t v163 = v71 % 0x3B9ACA00 / 0x3E8;
            __int16 v164 = 2082;
            uint64_t v165 = "-[CWFAutoJoinManager cancelAutoJoinWithUUID:error:reply:]";
            __int16 v166 = 2082;
            uint64_t v167 = "CWFAutoJoinManager.m";
            __int16 v168 = 1024;
            int v169 = 838;
            _os_log_send_and_compose_impl();
          }

          uint64_t v75 = v9->_targetQueue;
          qos_class_t v76 = qos_class_self();
          v143[0] = MEMORY[0x1E4F143A8];
          v143[1] = 3221225472;
          v143[2] = sub_1B4F95ED4;
          v143[3] = &unk_1E60BB9F0;
          v143[4] = v67;
          id v144 = v140;
          dispatch_block_t v77 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v76, 0, v143);
          dispatch_async(v75, v77);
        }
        uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v139, v78, (uint64_t)&v145, (uint64_t)v159, 16);
      }
      while (v63);
    }

    objc_msgSend_removeAllObjects(v9->_pendingRequests, v79, v80, v81, v82);
    if (v9->_activeRequest)
    {
      uint64_t v83 = CWFGetOSLog();
      if (v83)
      {
        uint64_t v84 = CWFGetOSLog();
      }
      else
      {
        uint64_t v84 = MEMORY[0x1E4F14500];
        id v108 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v109 = v9->_activeRequest;
        int v160 = 138543362;
        unint64_t v161 = (unint64_t)v109;
        _os_log_send_and_compose_impl();
      }

      v9->_cancelled = 1;
      uint64_t v114 = objc_msgSend_copy(v140, v110, v111, v112, v113);
      uint64_t v115 = v9->_underlyingCancelError;
      v9->_underlyingCancelError = (NSError *)v114;
    }
    uint64_t v116 = v9->_internalQueue;
    qos_class_t v117 = qos_class_self();
    v141[0] = MEMORY[0x1E4F143A8];
    v141[1] = 3221225472;
    v141[2] = sub_1B4F96120;
    v141[3] = &unk_1E60BBF00;
    v141[4] = v9;
    id v142 = v138;
    dispatch_block_t v118 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v117, 0, v141);
    dispatch_async(v116, v118);
  }
LABEL_17:
  objc_sync_exit(v9);
}

- (CWFAutoJoinMetric)metric
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v7 = objc_msgSend_copy(v2->_cachedMetric, v3, v4, v5, v6);
  objc_sync_exit(v2);

  return (CWFAutoJoinMetric *)v7;
}

- (CWFAutoJoinStatistics)statistics
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v7 = objc_msgSend_copy(v2->_statistics, v3, v4, v5, v6);
  objc_sync_exit(v2);

  return (CWFAutoJoinStatistics *)v7;
}

- (void)resetStatistics
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = CWFGetOSLog();
  if (v3)
  {
    uint64_t v4 = CWFGetOSLog();
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }

  uint64_t v6 = objc_alloc_init(CWFAutoJoinStatistics);
  statistics = v2->_statistics;
  v2->_statistics = v6;

  uint64_t v12 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v8, v9, v10, v11);
  objc_msgSend_setStartedAt_(v2->_statistics, v13, (uint64_t)v12, v14, v15);

  statisticsSubmissionTimer = v2->_statisticsSubmissionTimer;
  if (statisticsSubmissionTimer)
  {
    dispatch_time_t v17 = dispatch_walltime(0, 86400000000000);
    dispatch_source_set_timer(statisticsSubmissionTimer, v17, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  objc_sync_exit(v2);
}

- (void)__updateStatisticsWithScanChannels:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v47, (uint64_t)v51, 16);
  if (v6)
  {
    uint64_t v11 = v6;
    uint64_t v12 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v48 != v12) {
          objc_enumerationMutation(v4);
        }
        uint64_t v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        if (objc_msgSend_is2GHz(v14, v7, v8, v9, v10))
        {
          statistics = self->_statistics;
          uint64_t v20 = objc_msgSend_scanChannelCount2GHz(statistics, v15, v16, v17, v18);
          objc_msgSend_setScanChannelCount2GHz_(statistics, v21, v20 + 1, v22, v23);
        }
        else if (objc_msgSend_is5GHz(v14, v15, v16, v17, v18))
        {
          uint64_t v32 = self->_statistics;
          uint64_t v33 = objc_msgSend_scanChannelCount5GHz(v32, v28, v29, v30, v31);
          objc_msgSend_setScanChannelCount5GHz_(v32, v34, v33 + 1, v35, v36);
        }
        else if (objc_msgSend_is6GHz(v14, v28, v29, v30, v31))
        {
          uint64_t v37 = self->_statistics;
          uint64_t v38 = objc_msgSend_scanChannelCount6GHz(v37, v24, v25, v26, v27);
          objc_msgSend_setScanChannelCount6GHz_(v37, v39, v38 + 1, v40, v41);
        }
        dispatch_block_t v42 = self->_statistics;
        uint64_t v43 = objc_msgSend_scanChannelCount(v42, v24, v25, v26, v27);
        objc_msgSend_setScanChannelCount_(v42, v44, v43 + 1, v45, v46);
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v47, (uint64_t)v51, 16);
    }
    while (v11);
  }
}

- (void)__updateStatisticsWithPreAssocScanChannels:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v47, (uint64_t)v51, 16);
  if (v6)
  {
    uint64_t v11 = v6;
    uint64_t v12 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v48 != v12) {
          objc_enumerationMutation(v4);
        }
        uint64_t v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        if (objc_msgSend_is2GHz(v14, v7, v8, v9, v10))
        {
          statistics = self->_statistics;
          uint64_t v20 = objc_msgSend_preAssocScanChannelCount2GHz(statistics, v15, v16, v17, v18);
          objc_msgSend_setPreAssocScanChannelCount2GHz_(statistics, v21, v20 + 1, v22, v23);
        }
        else if (objc_msgSend_is5GHz(v14, v15, v16, v17, v18))
        {
          uint64_t v32 = self->_statistics;
          uint64_t v33 = objc_msgSend_preAssocScanChannelCount5GHz(v32, v28, v29, v30, v31);
          objc_msgSend_setPreAssocScanChannelCount5GHz_(v32, v34, v33 + 1, v35, v36);
        }
        else if (objc_msgSend_is6GHz(v14, v28, v29, v30, v31))
        {
          uint64_t v37 = self->_statistics;
          uint64_t v38 = objc_msgSend_preAssocScanChannelCount6GHz(v37, v24, v25, v26, v27);
          objc_msgSend_setPreAssocScanChannelCount6GHz_(v37, v39, v38 + 1, v40, v41);
        }
        dispatch_block_t v42 = self->_statistics;
        uint64_t v43 = objc_msgSend_preAssocScanChannelCount(v42, v24, v25, v26, v27);
        objc_msgSend_setPreAssocScanChannelCount_(v42, v44, v43 + 1, v45, v46);
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v47, (uint64_t)v51, 16);
    }
    while (v11);
  }
}

- (void)__updateCachedMetricAndStatistics:(id)a3
{
  id v204 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v9 = objc_msgSend_copy(v204, v5, v6, v7, v8);
  cachedMetric = v4->_cachedMetric;
  v4->_cachedMetric = (CWFAutoJoinMetric *)v9;

  if (objc_msgSend_wasAlreadyAssociated(v204, v11, v12, v13, v14))
  {
    statistics = v4->_statistics;
    uint64_t v20 = objc_msgSend_autoJoinAlreadyAssociatedCount(statistics, v15, v16, v17, v18);
    objc_msgSend_setAutoJoinAlreadyAssociatedCount_(statistics, v21, v20 + 1, v22, v23);
  }
  uint64_t v24 = objc_msgSend_autoJoinTriggerCounts(v4->_statistics, v15, v16, v17, v18);
  uint64_t v25 = NSNumber;
  uint64_t v30 = objc_msgSend_autoJoinParameters(v204, v26, v27, v28, v29);
  uint64_t v35 = objc_msgSend_trigger(v30, v31, v32, v33, v34);
  id v39 = objc_msgSend_numberWithInteger_(v25, v36, v35, v37, v38);
  uint64_t v43 = objc_msgSend_objectForKeyedSubscript_(v24, v40, (uint64_t)v39, v41, v42);
  uint64_t v48 = objc_msgSend_unsignedIntegerValue(v43, v44, v45, v46, v47);

  uint64_t v52 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v49, v48 + 1, v50, v51);
  uint64_t v57 = objc_msgSend_autoJoinTriggerCounts(v4->_statistics, v53, v54, v55, v56);
  char v58 = NSNumber;
  uint64_t v63 = objc_msgSend_autoJoinParameters(v204, v59, v60, v61, v62);
  uint64_t v68 = objc_msgSend_trigger(v63, v64, v65, v66, v67);
  uint64_t v72 = objc_msgSend_numberWithInteger_(v58, v69, v68, v70, v71);
  objc_msgSend_setObject_forKeyedSubscript_(v57, v73, (uint64_t)v52, (uint64_t)v72, v74);

  uint64_t v79 = objc_msgSend_error(v204, v75, v76, v77, v78);

  if (v79)
  {
    uint64_t v84 = v4->_statistics;
    uint64_t v85 = objc_msgSend_autoJoinAbortedCount(v84, v80, v81, v82, v83);
    objc_msgSend_setAutoJoinAbortedCount_(v84, v86, v85 + 1, v87, v88);
  }
  uint64_t v89 = objc_msgSend_scanChannels(v204, v80, v81, v82, v83);
  objc_msgSend___updateStatisticsWithScanChannels_(v4, v90, (uint64_t)v89, v91, v92);

  __uint64_t v97 = objc_msgSend_preAssociationScanChannels(v204, v93, v94, v95, v96);
  objc_msgSend___updateStatisticsWithPreAssocScanChannels_(v4, v98, (uint64_t)v97, v99, v100);

  uint64_t v101 = v4->_statistics;
  uint64_t v106 = objc_msgSend_followup6GHzScanChannels(v204, v102, v103, v104, v105);
  uint64_t v111 = objc_msgSend_count(v106, v107, v108, v109, v110);
  uint64_t v116 = objc_msgSend_followup6GHzScanChannelCount(v101, v112, v113, v114, v115);
  objc_msgSend_setFollowup6GHzScanChannelCount_(v101, v117, v116 + v111, v118, v119);

  long long v120 = v4->_statistics;
  uint64_t v125 = objc_msgSend_GASQueryNetworks(v204, v121, v122, v123, v124);
  uint64_t v130 = objc_msgSend_count(v125, v126, v127, v128, v129);
  uint64_t v135 = objc_msgSend_GASQueryCount(v120, v131, v132, v133, v134);
  objc_msgSend_setGASQueryCount_(v120, v136, v135 + v130, v137, v138);

  uint64_t v143 = objc_msgSend_network(v204, v139, v140, v141, v142);

  if (v143)
  {
    long long v148 = v4->_statistics;
    uint64_t CandidateCount = objc_msgSend_autoJoinDidFindCandidateCount(v148, v144, v145, v146, v147);
    objc_msgSend_setAutoJoinDidFindCandidateCount_(v148, v150, CandidateCount + 1, v151, v152);
    if (objc_msgSend_result(v204, v153, v154, v155, v156))
    {
      uint64_t v157 = v4->_statistics;
      uint64_t v158 = objc_msgSend_autoJoinDidJoinCount(v157, v144, v145, v146, v147);
      objc_msgSend_setAutoJoinDidJoinCount_(v157, v159, v158 + 1, v160, v161);
    }
  }
  if (objc_msgSend_autoHotspotWasAttempted(v204, v144, v145, v146, v147))
  {
    __int16 v166 = v4->_statistics;
    uint64_t v167 = objc_msgSend_autoHotspotCount(v166, v162, v163, v164, v165);
    objc_msgSend_setAutoHotspotCount_(v166, v168, v167 + 1, v169, v170);
    uint64_t v175 = objc_msgSend_hotspot(v204, v171, v172, v173, v174);

    if (v175)
    {
      uint64_t v180 = v4->_statistics;
      uint64_t v181 = objc_msgSend_autoHotspotDidFindCandidateCount(v180, v176, v177, v178, v179);
      objc_msgSend_setAutoHotspotDidFindCandidateCount_(v180, v182, v181 + 1, v183, v184);
      if (objc_msgSend_autoHotspotResult(v204, v185, v186, v187, v188))
      {
        uint64_t v189 = v4->_statistics;
        uint64_t v190 = objc_msgSend_autoHotspotDidJoinCount(v189, v176, v177, v178, v179);
        objc_msgSend_setAutoHotspotDidJoinCount_(v189, v191, v190 + 1, v192, v193);
      }
    }
    uint64_t v194 = objc_msgSend_autoHotspotError(v204, v176, v177, v178, v179);

    if (v194)
    {
      uint64_t v199 = v4->_statistics;
      uint64_t v200 = objc_msgSend_autoHotspotAbortedCount(v199, v195, v196, v197, v198);
      objc_msgSend_setAutoHotspotAbortedCount_(v199, v201, v200 + 1, v202, v203);
    }
  }
  objc_sync_exit(v4);
}

- (BOOL)__shouldInvokeImmediatelyForTrigger:(int64_t)a3
{
  BOOL result = 0;
  if ((unint64_t)a3 <= 0x3D)
  {
    if (((1 << a3) & 0x1000800300100000) != 0)
    {
      return 1;
    }
    else if (a3 == 61)
    {
      id v5 = self;
      objc_sync_enter(v5);
      unint64_t retryScheduleIndex = v5->_retryScheduleIndex;
      objc_sync_exit(v5);

      return retryScheduleIndex != 0;
    }
  }
  return result;
}

- (BOOL)__shouldPrioritizeRetryOverNewRequest:(int64_t)a3
{
  return a3 == 32 || a3 == 47;
}

- (void)__removeRedundantRequests:(id)a3
{
  uint64_t v194 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __int16 v166 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v5, v6, v7, v8);
  uint64_t v173 = v4;
  if (objc_msgSend_count(self->_pendingRequests, v9, v10, v11, v12))
  {
    uint64_t v16 = 0;
    while (1)
    {
      uint64_t v17 = objc_msgSend_objectAtIndexedSubscript_(self->_pendingRequests, v13, v16, v14, v15);
      uint64_t v22 = objc_msgSend_parameters(v17, v18, v19, v20, v21);
      uint64_t v27 = objc_msgSend_mode(v22, v23, v24, v25, v26);
      uint64_t v32 = objc_msgSend_parameters(v4, v28, v29, v30, v31);
      if (v27 == objc_msgSend_mode(v32, v33, v34, v35, v36)) {
        break;
      }

LABEL_24:
      if (++v16 >= (unint64_t)objc_msgSend_count(self->_pendingRequests, v131, v132, v133, v134)) {
        goto LABEL_27;
      }
    }
    uint64_t v41 = objc_msgSend_parameters(v17, v37, v38, v39, v40);
    objc_msgSend_targetNetworkProfile(v41, v42, v43, v44, v45);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v50 = objc_msgSend_identifier(obj, v46, v47, v48, v49);
    uint64_t v175 = objc_msgSend_parameters(v4, v51, v52, v53, v54);
    uint64_t v59 = objc_msgSend_targetNetworkProfile(v175, v55, v56, v57, v58);
    uint64_t v68 = objc_msgSend_identifier(v59, v60, v61, v62, v63);
    if (v50 == v68)
    {
      uint64_t v174 = v41;
    }
    else
    {
      uint64_t v172 = objc_msgSend_parameters(v17, v64, v65, v66, v67);
      uint64_t v171 = objc_msgSend_targetNetworkProfile(v172, v69, v70, v71, v72);
      uint64_t v170 = objc_msgSend_identifier(v171, v73, v74, v75, v76);
      if (!v170)
      {
        uint64_t v170 = 0;
        int v117 = 0;
LABEL_20:

LABEL_21:
        if (v117) {
          objc_msgSend_addObject_(v166, v128, (uint64_t)v17, v129, v130);
        }
        id v4 = v173;
        goto LABEL_24;
      }
      uint64_t v174 = v41;
      uint64_t v169 = objc_msgSend_parameters(v173, v77, v78, v79, v80);
      __int16 v168 = objc_msgSend_targetNetworkProfile(v169, v81, v82, v83, v84);
      uint64_t v167 = objc_msgSend_identifier(v168, v85, v86, v87, v88);
      if (!v167)
      {
        uint64_t v167 = 0;
        int v117 = 0;
        goto LABEL_19;
      }
      uint64_t v165 = objc_msgSend_parameters(v17, v89, v90, v91, v92);
      uint64_t v164 = objc_msgSend_targetNetworkProfile(v165, v93, v94, v95, v96);
      uint64_t v101 = objc_msgSend_identifier(v164, v97, v98, v99, v100);
      __int16 v162 = objc_msgSend_parameters(v173, v102, v103, v104, v105);
      uint64_t v161 = objc_msgSend_targetNetworkProfile(v162, v106, v107, v108, v109);
      objc_msgSend_identifier(v161, v110, v111, v112, v113);
      uint64_t v160 = v163 = v101;
      if (!objc_msgSend_isEqual_(v101, v114, (uint64_t)v160, v115, v116))
      {
        int v117 = 0;
LABEL_16:

LABEL_19:
        goto LABEL_20;
      }
    }
    uint64_t v118 = objc_msgSend_parameters(v17, v64, v65, v66, v67);
    unint64_t v123 = objc_msgSend_trigger(v118, v119, v120, v121, v122);
    if (v123 - 44 < 8 || v123 <= 0x3F && ((1 << v123) & 0xC000000000000010) != 0)
    {

      int v117 = 0;
    }
    else
    {
      int v117 = objc_msgSend_allowAutoHotspotFallback(v17, v124, v125, v126, v127) ^ 1;
    }
    uint64_t v41 = v174;
    if (v50 == v68) {
      goto LABEL_21;
    }
    goto LABEL_16;
  }
LABEL_27:
  long long v181 = 0u;
  long long v182 = 0u;
  long long v179 = 0u;
  long long v180 = 0u;
  id obja = v166;
  uint64_t v136 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v135, (uint64_t)&v179, (uint64_t)v193, 16);
  if (v136)
  {
    uint64_t v137 = v136;
    uint64_t v138 = MEMORY[0x1E4F14500];
    uint64_t v139 = *(void *)v180;
    do
    {
      for (uint64_t i = 0; i != v137; ++i)
      {
        if (*(void *)v180 != v139) {
          objc_enumerationMutation(obja);
        }
        uint64_t v141 = *(void *)(*((void *)&v179 + 1) + 8 * i);
        uint64_t v142 = CWFGetOSLog();
        if (v142)
        {
          uint64_t v143 = CWFGetOSLog();
        }
        else
        {
          id v144 = v138;
          uint64_t v143 = v138;
        }

        if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
        {
          int v183 = 138543362;
          unint64_t v184 = v141;
          _os_log_send_and_compose_impl();
        }

        __uint64_t v145 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
        uint64_t v146 = CWFGetOSLog();
        if (v146)
        {
          uint64_t v147 = CWFGetOSLog();
        }
        else
        {
          long long v148 = v138;
          uint64_t v147 = v138;
        }

        if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG))
        {
          int v183 = 134219010;
          unint64_t v184 = v145 / 0x3B9ACA00;
          __int16 v185 = 2048;
          unint64_t v186 = v145 % 0x3B9ACA00 / 0x3E8;
          __int16 v187 = 2082;
          uint64_t v188 = "-[CWFAutoJoinManager __removeRedundantRequests:]";
          __int16 v189 = 2082;
          uint64_t v190 = "CWFAutoJoinManager.m";
          __int16 v191 = 1024;
          int v192 = 1187;
          _os_log_send_and_compose_impl();
        }

        targetQueue = self->_targetQueue;
        qos_class_t v150 = qos_class_self();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1B4F9746C;
        block[3] = &unk_1E60BB768;
        void block[4] = v141;
        dispatch_block_t v151 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v150, 0, block);
        dispatch_async(targetQueue, v151);

        objc_msgSend_removeObject_(self->_pendingRequests, v152, v141, v153, v154);
      }
      uint64_t v137 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v155, (uint64_t)&v179, (uint64_t)v193, 16);
    }
    while (v137);
  }

  objc_msgSend_removeAllObjects(obja, v156, v157, v158, v159);
}

- (unsigned)__qosForAutoJoinTrigger:(int64_t)a3
{
  if ((unint64_t)a3 > 0x3F) {
    return 25;
  }
  if (((1 << a3) & 0xC00FF00000000010) != 0) {
    return 21;
  }
  if (((1 << a3) & 0xC0010020010104) != 0) {
    return 33;
  }
  else {
    return 25;
  }
}

- (void)__updateAutoJoinState:(int64_t)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (self->_state != a3)
  {
    self->_state = a3;
    id v4 = self;
    objc_sync_enter(v4);
    uint64_t v9 = objc_msgSend_UUID(v4->_activeRequest, v5, v6, v7, v8);
    uint64_t v14 = objc_msgSend_parameters(v4->_activeRequest, v10, v11, v12, v13);
    objc_sync_exit(v4);

    __uint64_t v15 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    uint64_t v16 = CWFGetOSLog();
    if (v16)
    {
      uint64_t v17 = CWFGetOSLog();
    }
    else
    {
      uint64_t v17 = MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int v28 = 134219010;
      unint64_t v29 = v15 / 0x3B9ACA00;
      __int16 v30 = 2048;
      unint64_t v31 = v15 % 0x3B9ACA00 / 0x3E8;
      __int16 v32 = 2082;
      uint64_t v33 = "-[CWFAutoJoinManager __updateAutoJoinState:]";
      __int16 v34 = 2082;
      uint64_t v35 = "CWFAutoJoinManager.m";
      __int16 v36 = 1024;
      int v37 = 1485;
      _os_log_send_and_compose_impl();
    }

    targetQueue = v4->_targetQueue;
    qos_class_t v20 = qos_class_self();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F97C00;
    block[3] = &unk_1E60BC330;
    void block[4] = v4;
    id v25 = v9;
    id v26 = v14;
    int64_t v27 = a3;
    id v21 = v9;
    id v22 = v14;
    dispatch_block_t v23 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v20, 0, block);
    dispatch_async(targetQueue, v23);
  }
}

- (BOOL)__isAnyKnownNetworkNearby
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v3 = self->_cumulativeScanResults;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v26, (uint64_t)v30, 16);
  BOOL v10 = v5 != 0;
  if (!v5)
  {
LABEL_15:

    return v10;
  }
  uint64_t v11 = v5;
  char v12 = 0;
  uint64_t v13 = *(void *)v27;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v27 != v13) {
        objc_enumerationMutation(v3);
      }
      __uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      uint64_t v16 = objc_msgSend_knownNetworks(self, v6, v7, v8, v9);
      id v21 = objc_msgSend_allObjects(v16, v17, v18, v19, v20);
      id v22 = sub_1B4F542B0(v15, v21);
      v12 |= v22 != 0;
    }
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v26, (uint64_t)v30, 16);
  }
  while (v11);

  if (v12)
  {
    dispatch_block_t v23 = CWFGetOSLog();
    if (v23)
    {
      CWFGetOSLog();
      uint64_t v3 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v3 = (NSMutableSet *)MEMORY[0x1E4F14500];
      id v24 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(&v3->super.super, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }
    goto LABEL_15;
  }
  return 0;
}

- (id)__descriptionForError:(id)a3
{
  id v3 = a3;
  uint64_t v8 = objc_msgSend_userInfo(v3, v4, v5, v6, v7);
  uint64_t v9 = *MEMORY[0x1E4F28568];
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v8, v10, *MEMORY[0x1E4F28568], v11, v12);

  uint64_t v18 = objc_msgSend_userInfo(v3, v14, v15, v16, v17);
  id v22 = objc_msgSend_objectForKeyedSubscript_(v18, v19, *MEMORY[0x1E4F28A50], v20, v21);

  long long v27 = objc_msgSend_userInfo(v22, v23, v24, v25, v26);
  uint64_t v31 = objc_msgSend_objectForKeyedSubscript_(v27, v28, v9, v29, v30);

  __int16 v36 = v22;
  int v37 = v31;
  if (v22 || (__int16 v36 = v3, v37 = v13, v3))
  {
    uint64_t v38 = NSString;
    uint64_t v39 = objc_msgSend_code(v36, v32, v33, v34, v35);
    uint64_t v43 = objc_msgSend_stringWithFormat_(v38, v40, @"%ld '%@'", v41, v42, v39, v37);
  }
  else
  {
    uint64_t v43 = 0;
  }

  return v43;
}

- (void)__performAutoJoin
{
  v1440[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1412 = 0;
  v1413 = &v1412;
  uint64_t v1414 = 0x2020000000;
  char v1415 = 1;
  unint64_t beginTimestamp = self->_beginTimestamp;
  self->_unint64_t beginTimestamp = 0;
  v1366 = objc_msgSend_associatedNetwork(self, a2, v2, v3, v4);
  uint64_t v6 = self;
  objc_sync_enter(v6);
  id obj = v6;
  uint64_t v11 = objc_msgSend_parameters(v6->_activeRequest, v7, v8, v9, v10);
  v1370 = objc_msgSend_copy(v11, v12, v13, v14, v15);

  uint64_t v20 = objc_msgSend_UUID(obj->_activeRequest, v16, v17, v18, v19);
  v1337 = objc_msgSend_copy(v20, v21, v22, v23, v24);

  uint64_t retrySchedule = obj->_retrySchedule;
  unint64_t retryScheduleIndex = obj->_retryScheduleIndex;
  int v1334 = objc_msgSend_allowAutoHotspotFallback(obj->_activeRequest, v27, v28, v29, v30);
  uint64_t v34 = objc_msgSend_objectForKeyedSubscript_(obj->_triggerTimestampMap, v31, (uint64_t)&unk_1F0DC77A0, v32, v33);
  unint64_t v1340 = objc_msgSend_unsignedLongValue(v34, v35, v36, v37, v38);

  triggerTimestampMap = obj->_triggerTimestampMap;
  uint64_t v43 = objc_msgSend_numberWithInteger_(NSNumber, v40, obj->_previousNonRetryTrigger, v41, v42);
  uint64_t v47 = objc_msgSend_objectForKeyedSubscript_(triggerTimestampMap, v44, (uint64_t)v43, v45, v46);
  unint64_t v1338 = objc_msgSend_unsignedLongValue(v47, v48, v49, v50, v51);

  uint64_t previousNonRetryTrigger = obj->_previousNonRetryTrigger;
  uint64_t v52 = obj->_triggerTimestampMap;
  uint64_t v53 = NSNumber;
  uint64_t v58 = objc_msgSend_trigger(v1370, v54, v55, v56, v57);
  uint64_t v62 = objc_msgSend_numberWithInteger_(v53, v59, v58, v60, v61);
  uint64_t v66 = objc_msgSend_objectForKeyedSubscript_(v52, v63, v62, v64, v65);
  uint64_t v1344 = objc_msgSend_unsignedLongValue(v66, v67, v68, v69, v70);

  unint64_t linkChangeTimestamp = obj->_linkChangeTimestamp;
  v1336 = objc_msgSend_copy(obj->_steerFromNetwork, v71, v72, v73, v74);
  BOOL didConfigurationChangeSincePreviousAttempt = obj->_didConfigurationChangeSincePreviousAttempt;
  obj->_BOOL didConfigurationChangeSincePreviousAttempt = 0;
  LOBYTE(v62) = !obj->_resetCachedKnownNetworksContext;
  obj->_resetCachedKnownNetworksContext = 0;
  objc_sync_exit(obj);

  if ((v62 & 1) == 0) {
    objc_msgSend_removeAllObjects(obj->_cachedKnownNetworksContexts, v76, v77, v78, v79);
  }
  uint64_t v80 = objc_msgSend_trigger(v1370, v76, v77, v78, v79);
  id v1411 = 0;
  char v83 = objc_msgSend___allowAutoJoinWithTrigger_error_(obj, v81, v80, (uint64_t)&v1411, v82);
  id v1367 = v1411;
  if ((v83 & 1) == 0)
  {
    __uint64_t v1335 = 0;
    v1361 = 0;
    v1362 = 0;
    v1346 = 0;
    v1347 = 0;
    v1356 = 0;
    v1357 = 0;
    id v1351 = 0;
    v1352 = 0;
    v1374 = 0;
    v1355 = 0;
    v1358 = 0;
    id v1350 = 0;
    id v1365 = 0;
    id v1342 = 0;
    v1343 = 0;
LABEL_363:
    unsigned int v1369 = 0;
    goto LABEL_255;
  }
  uint64_t v88 = objc_alloc_init(CWFAutoJoinMetric);
  metric = obj->_metric;
  obj->_metric = v88;

  obj->_state = 0;
  if (!v1366 && objc_msgSend_count(obj->_failedToJoinKnownNetworkIDs, v90, v91, v92, v93))
  {
    uint64_t v94 = CWFGetOSLog();
    if (v94)
    {
      CWFGetOSLog();
      uint64_t v95 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v95 = MEMORY[0x1E4F14500];
      id v96 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v1418) = 0;
      LODWORD(v1330) = 2;
      v1327 = &v1418;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_removeAllObjects(obj->_failedToJoinKnownNetworkIDs, v97, v98, v99, v100);
  }
  objc_msgSend_removeAllObjects(obj->_deferredColocatedJoinCandidateMap, v90, v91, v92, v93, v1327, v1330);
  objc_msgSend_removeAllObjects(obj->_hiddenNetworkChannels, v101, v102, v103, v104);
  objc_msgSend_removeAllObjects(obj->_deferredKnownNetworks, v105, v106, v107, v108);
  obj->_didDiscoverBSS = 0;
  objc_msgSend_removeAllObjects(obj->_followup6GHzRNRMap, v109, v110, v111, v112);
  objc_msgSend_removeAllObjects(obj->_followup6GHzFILSDMap, v113, v114, v115, v116);
  objc_msgSend_removeAllObjects(obj->_followup6GHzScanResultsMap, v117, v118, v119, v120);
  objc_msgSend_removeAllObjects(obj->_cumulativeScanResults, v121, v122, v123, v124);
  objc_msgSend_removeAllObjects(obj->_updatedAllowCacheKnownNetworks, v125, v126, v127, v128);
  v1368 = obj;
  objc_sync_enter(v1368);
  uint64_t v129 = CWFGetOSLog();
  if (v129)
  {
    CWFGetOSLog();
    uint64_t v130 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v130 = MEMORY[0x1E4F14500];
    id v131 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t activeRequest = (unint64_t)obj->_activeRequest;
    int v1418 = 138543362;
    unint64_t v1419 = activeRequest;
    LODWORD(v1331) = 12;
    v1328 = &v1418;
    _os_log_send_and_compose_impl();
  }

  objc_sync_exit(v1368);
  objc_msgSend_setAutoJoinParameters_(obj->_metric, v133, (uint64_t)v1370, v134, v135);
  objc_msgSend_setRetrySchedule_(obj->_metric, v136, retrySchedule, v137, v138);
  objc_msgSend_setRetryScheduleIndex_(obj->_metric, v139, retryScheduleIndex, v140, v141);
  objc_msgSend_setWasAlreadyAssociated_(obj->_metric, v142, v1366 != 0, v143, v144, v1328, v1331);
  objc_msgSend_setAssociatedNetwork_(obj->_metric, v145, (uint64_t)v1366, v146, v147);
  self->_unint64_t beginTimestamp = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  __uint64_t v1335 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v1371 = objc_alloc_init(CWFAutoJoinContext);
  objc_msgSend_setAutoJoinParameters_(v1371, v148, (uint64_t)v1370, v149, v150);
  BOOL v155 = objc_msgSend_mode(v1370, v151, v152, v153, v154) == 3;
  objc_msgSend_setCacheOnly_(v1371, v156, v155, v157, v158);
  if (objc_msgSend_mode(v1370, v159, v160, v161, v162) == 3) {
    objc_msgSend_setMaxScanSSIDCount_(v1371, v163, -1, v164, v165);
  }
  else {
    objc_msgSend_setMaxScanSSIDCount_(v1371, v163, 9, v164, v165);
  }
  if (v1366) {
    objc_msgSend_setMinRSSI_(v1371, v166, -70, v167, v168);
  }
  else {
    objc_msgSend_setMinRSSI_(v1371, v166, -80, v167, v168);
  }
  objc_msgSend_setMaxBSSChannelAge_(v1371, v169, 2592000, v170, v171);
  objc_msgSend_setMinBSSLocationAccuracy_(v1371, v172, v173, v174, v175, 100.0);
  objc_msgSend_setMaxBSSLocationDistance_(v1371, v176, v177, v178, v179, 300.0);
  objc_msgSend_setMaxBSSChannelCount_(v1371, v180, 3, v181, v182);
  __int16 v187 = objc_msgSend_autoJoinParameters(v1371, v183, v184, v185, v186);
  if (objc_msgSend_trigger(v187, v188, v189, v190, v191) == 54)
  {

LABEL_27:
    objc_msgSend_setMaxScanChannelCount_(v1371, v196, 1, v197, v198);
LABEL_28:
    objc_msgSend_setMaxScanCacheAge_(v1371, v213, 0, v214, v215);
    goto LABEL_29;
  }
  uint64_t v199 = objc_msgSend_autoJoinParameters(v1371, v192, v193, v194, v195);
  BOOL v204 = objc_msgSend_trigger(v199, v200, v201, v202, v203) == 55;

  if (v204) {
    goto LABEL_27;
  }
  uint64_t v206 = objc_msgSend_autoJoinParameters(v1371, v196, v205, v197, v198);
  BOOL v211 = objc_msgSend_trigger(v206, v207, v208, v209, v210) == 45;

  if (v211) {
    goto LABEL_27;
  }
  __uint64_t v314 = objc_msgSend_autoJoinParameters(v1371, v196, v212, v197, v198);
  BOOL v319 = objc_msgSend_trigger(v314, v315, v316, v317, v318) == 58;

  if (v319)
  {
    objc_msgSend_setMaxScanChannelCount_(v1371, v320, 3, v322, v323);
    goto LABEL_28;
  }
  if (objc_msgSend_mode(v1370, v320, v321, v322, v323) == 1) {
    objc_msgSend_setMaxScanChannelCount_(v1371, v1284, 3, v1285, v1286);
  }
  else {
    objc_msgSend_setMaxScanChannelCount_(v1371, v1284, -1, v1285, v1286);
  }
  unint64_t v1291 = objc_msgSend_trigger(v1370, v1287, v1288, v1289, v1290);
  unsigned int v1292 = (v1291 < 0x40) & (0xC00FF00000000010 >> v1291);
  if (v1366) {
    BOOL v1293 = 0;
  }
  else {
    BOOL v1293 = !didConfigurationChangeSincePreviousAttempt;
  }
  if (!v1293) {
    unsigned int v1292 = 1;
  }
  if (v1292) {
    goto LABEL_28;
  }
  objc_msgSend_setMaxScanCacheAge_(v1371, v213, 20000, v214, v215);
LABEL_29:
  objc_msgSend_setMaxANQPCacheAge_(v1371, v216, 3600000, v217, v218);
  objc_msgSend_setMaxScanCycles_(v1371, v219, 1, v220, v221);
  objc_msgSend_setDwellTime_(v1371, v222, 0, v223, v224);
  if (didConfigurationChangeSincePreviousAttempt)
  {
    objc_msgSend_setAlwaysIncludeRemainingNon2GHzChannels_(v1371, v225, 1, v227, v228);
  }
  else
  {
    BOOL v233 = objc_msgSend_mode(v1370, v225, v226, v227, v228) == 1;
    objc_msgSend_setAlwaysIncludeRemainingNon2GHzChannels_(v1371, v234, v233, v235, v236);
  }
  if (objc_msgSend_trigger(v1370, v229, v230, v231, v232) == 2
    || objc_msgSend_trigger(v1370, v237, v238, v239, v240) == 7
    || objc_msgSend_trigger(v1370, v237, v241, v239, v240) == 59
    || objc_msgSend_trigger(v1370, v237, v242, v239, v240) == 60)
  {
    objc_msgSend_setMaxScanChannelCount_(v1371, v237, 2, v239, v240);
  }
  unint64_t v244 = objc_msgSend_trigger(v1370, v237, v243, v239, v240);
  if (v244 - 44 < 8 || v244 <= 0x3F && ((1 << v244) & 0xC000000000000010) != 0)
  {
    uint64_t v249 = objc_msgSend___retryInterval(v1368, v245, v246, v247, v248);
    v1361 = v249;
    if (v249)
    {
      uint64_t v254 = objc_msgSend_BSSChannelsOnly(v249, v250, v251, v252, v253);
      objc_msgSend_setBSSChannelsOnly_(v1371, v255, v254, v256, v257);
      uint64_t v262 = objc_msgSend_maxBSSChannelCount(v1361, v258, v259, v260, v261);
      objc_msgSend_setMaxBSSChannelCount_(v1371, v263, v262, v264, v265);
      uint64_t v270 = objc_msgSend_maxBSSChannelAge(v1361, v266, v267, v268, v269);
      objc_msgSend_setMaxBSSChannelAge_(v1371, v271, v270, v272, v273);
      uint64_t v278 = objc_msgSend_passiveScan(v1361, v274, v275, v276, v277);
      objc_msgSend_setPassiveScan_(v1371, v279, v278, v280, v281);
      uint64_t v286 = objc_msgSend_dwellTime(v1361, v282, v283, v284, v285);
      objc_msgSend_setDwellTime_(v1371, v287, v286, v288, v289);
      uint64_t v294 = objc_msgSend_includeAdjacent5GHzChannel(v1361, v290, v291, v292, v293);
      objc_msgSend_setIncludeAdjacent5GHzChannel_(v1371, v295, v294, v296, v297);
      uint64_t v302 = objc_msgSend_alwaysIncludeRemainingNon2GHzChannels(v1361, v298, v299, v300, v301);
      objc_msgSend_setAlwaysIncludeRemainingNon2GHzChannels_(v1371, v303, v302, v304, v305);
      uint64_t v310 = objc_msgSend_alwaysInclude6GHzPSCChannels(v1361, v306, v307, v308, v309);
      objc_msgSend_setInclude6GHzChannels_(v1371, v311, v310, v312, v313);
      goto LABEL_47;
    }
  }
  else if (objc_msgSend_trigger(v1370, v245, v246, v247, v248) == 32)
  {
    objc_msgSend_setBSSChannelsOnly_(v1371, v250, 1, v252, v253);
    objc_msgSend_setMaxScanCacheAge_(v1371, v324, 0, v325, v326);
    objc_msgSend_setDwellTime_(v1371, v327, 40, v328, v329);
    objc_msgSend_setMaxBSSChannelAge_(v1371, v330, 0, v331, v332);
    objc_msgSend_setAlwaysIncludeRemainingNon2GHzChannels_(v1371, v333, 1, v334, v335);
    uint64_t v340 = objc_msgSend_preferredChannels(v1370, v336, v337, v338, v339);
    uint64_t v345 = objc_msgSend_copy(v340, v341, v342, v343, v344);
    cachedCarPlayPreferredChannels = v1368->_cachedCarPlayPreferredChannels;
    v1368->_cachedCarPlayPreferredChannels = (NSArray *)v345;
  }
  v1361 = 0;
LABEL_47:
  if (objc_msgSend_trigger(v1370, v250, v251, v252, v253) == 47)
  {
    uint64_t v351 = (uint64_t)v1368->_cachedCarPlayPreferredChannels;
    uint64_t v352 = objc_msgSend_autoJoinParameters(v1371, v347, v348, v349, v350);
    objc_msgSend_setPreferredChannels_(v352, v353, v351, v354, v355);

    objc_msgSend_setAlwaysIncludeRemainingNon2GHzChannels_(v1371, v356, 1, v357, v358);
  }
  if (objc_msgSend_mode(v1370, v347, v348, v349, v350) == 4
    && objc_msgSend_trigger(v1370, v359, v360, v361, v362) != 54
    && objc_msgSend_trigger(v1370, v359, v360, v361, v362) != 55)
  {
    objc_msgSend_setBSSChannelsOnly_(v1371, v359, 1, v361, v362);
    objc_msgSend_setMaxBSSChannelCount_(v1371, v363, 2, v364, v365);
    objc_msgSend_setMaxBSSChannelAge_(v1371, v366, 86400, v367, v368);
  }
  v1343 = objc_msgSend_supportedChannels(v1368, v359, v360, v361, v362);
  if (!objc_msgSend_count(v1343, v369, v370, v371, v372))
  {
    v1309 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v1439 = *MEMORY[0x1E4F28568];
    v1440[0] = @"No configured channels";
    v432 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v373, (uint64_t)v1440, (uint64_t)&v1439, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v1309, v1310, *MEMORY[0x1E4F28798], 6, (uint64_t)v432);
    id v765 = (id)objc_claimAutoreleasedReturnValue();

    v1363 = 0;
    id v1365 = 0;
    v1346 = 0;
    v1347 = 0;
    v1356 = 0;
    v1357 = 0;
    id v1351 = 0;
    v1352 = 0;
    v1374 = 0;
    v1355 = 0;
    id v1350 = 0;
    v1359 = 0;
    unsigned int v1369 = 0;
    goto LABEL_254;
  }
  objc_msgSend___updateAutoJoinState_(v1368, v373, 1, v374, v375);
  v1359 = objc_msgSend_knownNetworks(v1368, v376, v377, v378, v379);
  if (!objc_msgSend_count(v1359, v380, v381, v382, v383))
  {
    v1311 = CWFGetOSLog();
    if (v1311)
    {
      CWFGetOSLog();
      v1312 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v1312 = MEMORY[0x1E4F14500];
      id v1315 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v1312, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_385;
    }
    LOWORD(v1418) = 0;
    LODWORD(v1330) = 2;
    v1327 = &v1418;
    goto LABEL_384;
  }
  if (objc_msgSend_trigger(v1370, v384, v385, v386, v387) == 61 && retryScheduleIndex)
  {
    v1314 = CWFGetOSLog();
    if (v1314)
    {
      CWFGetOSLog();
      v1312 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v1312 = MEMORY[0x1E4F14500];
      id v1318 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v1312, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_385;
    }
    LOWORD(v1418) = 0;
    LODWORD(v1330) = 2;
    v1327 = &v1418;
LABEL_384:
    _os_log_send_and_compose_impl();
LABEL_385:
    v1363 = 0;
    id v1365 = 0;
    v1346 = 0;
    v1347 = 0;
    id v1350 = 0;
    id v1351 = 0;
    goto LABEL_386;
  }
  v392 = objc_msgSend_allObjects(v1359, v388, v389, v390, v391);
  objc_msgSend_setKnownNetworks_(obj->_metric, v393, (uint64_t)v392, v394, v395);

  if (_os_feature_enabled_impl())
  {
    if ((objc_msgSend_include6GHzChannels(v1371, v396, v397, v398, v399) & 1) == 0)
    {
      uint64_t v404 = objc_msgSend_allObjects(v1359, v400, v401, v402, v403);
      uint64_t v408 = objc_msgSend___didRecentlyJoinAny6GHzOnlyNetworks_(v1368, v405, (uint64_t)v404, v406, v407);
      objc_msgSend_setInclude6GHzChannels_(v1371, v409, v408, v410, v411);
    }
    long long v412 = CWFGetOSLog();
    if (v412)
    {
      CWFGetOSLog();
      long long v413 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v413 = MEMORY[0x1E4F14500];
      id v414 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v413, OS_LOG_TYPE_DEBUG))
    {
      int v419 = objc_msgSend_include6GHzChannels(v1371, v415, v416, v417, v418);
      v420 = "NOT ";
      if (v419) {
        v420 = "";
      }
      int v1418 = 136446210;
      unint64_t v1419 = (unint64_t)v420;
      LODWORD(v1330) = 12;
      v1327 = &v1418;
      _os_log_send_and_compose_impl();
    }
  }
  v425 = objc_msgSend_targetNetworkProfile(v1370, v396, v397, v398, v399, v1327, v1330);
  if (!v425)
  {
    v1346 = 0;
    v1347 = 0;
LABEL_86:
    v1363 = v425;
    if (didConfigurationChangeSincePreviousAttempt || self->_beginTimestamp - beginTimestamp >= 0x8BEE643A00)
    {
      v464 = CWFGetOSLog();
      if (v464)
      {
        CWFGetOSLog();
        v465 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v465 = MEMORY[0x1E4F14500];
        id v466 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v465, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v471 = objc_msgSend_count(v1359, v467, v468, v469, v470);
        int v1418 = 134217984;
        unint64_t v1419 = v471;
        LODWORD(v1330) = 12;
        v1327 = &v1418;
        _os_log_send_and_compose_impl();
      }

      long long v1406 = 0u;
      long long v1407 = 0u;
      long long v1404 = 0u;
      long long v1405 = 0u;
      id v472 = v1359;
      uint64_t v474 = objc_msgSend_countByEnumeratingWithState_objects_count_(v472, v473, (uint64_t)&v1404, (uint64_t)v1438, 16);
      if (v474)
      {
        uint64_t v475 = *(void *)v1405;
        v476 = MEMORY[0x1E4F14500];
        do
        {
          for (uint64_t i = 0; i != v474; ++i)
          {
            if (*(void *)v1405 != v475) {
              objc_enumerationMutation(v472);
            }
            unint64_t v478 = *(void *)(*((void *)&v1404 + 1) + 8 * i);
            v479 = CWFGetOSLog();
            if (v479)
            {
              CWFGetOSLog();
              v480 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v481 = v476;
              v480 = v476;
            }

            if (os_log_type_enabled(v480, OS_LOG_TYPE_DEFAULT))
            {
              int v1418 = 138543362;
              unint64_t v1419 = v478;
              LODWORD(v1330) = 12;
              v1327 = &v1418;
              _os_log_send_and_compose_impl();
            }
          }
          uint64_t v474 = objc_msgSend_countByEnumeratingWithState_objects_count_(v472, v482, (uint64_t)&v1404, (uint64_t)v1438, 16);
        }
        while (v474);
      }
    }
    v483 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v421, v422, v423, v424, v1327, v1330);
    v488 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v484, v485, v486, v487);
    v493 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v489, v490, v491, v492);
    __uint64_t v494 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v495 = CWFGetOSLog();
    if (v495)
    {
      CWFGetOSLog();
      v496 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v496 = MEMORY[0x1E4F14500];
      id v497 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v496, OS_LOG_TYPE_DEBUG))
    {
      int v1418 = 134219010;
      unint64_t v1419 = v494 / 0x3B9ACA00;
      __int16 v1420 = 2048;
      unint64_t v1421 = v494 % 0x3B9ACA00 / 0x3E8;
      __int16 v1422 = 2082;
      *(void *)v1423 = "-[CWFAutoJoinManager __performAutoJoin]";
      *(_WORD *)&v1423[8] = 2082;
      *(void *)&v1423[10] = "CWFAutoJoinManager.m";
      *(_WORD *)&v1423[18] = 1024;
      *(_DWORD *)v1424 = 1847;
      LODWORD(v1330) = 48;
      v1327 = &v1418;
      _os_log_send_and_compose_impl();
    }

    targetQueue = v1368->_targetQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F9B90C;
    block[3] = &unk_1E60BC358;
    id v1342 = v1359;
    id v1397 = v1342;
    v1398 = v1368;
    v1358 = v1371;
    v1399 = v1358;
    id v1365 = v483;
    id v1400 = v1365;
    id v1351 = v488;
    id v1401 = v1351;
    id v1350 = v493;
    id v1402 = v1350;
    v1403 = &v1412;
    dispatch_sync(targetQueue, block);

    if (!v1366 || !objc_msgSend_count(v1365, v499, v500, v501, v502)) {
      goto LABEL_146;
    }
    v503 = objc_msgSend_matchingKnownNetworkProfile(v1366, v499, v500, v501, v502);
    int isCarPlay = objc_msgSend_isCarPlay(v503, v504, v505, v506, v507);

    if (isCarPlay)
    {
      v1316 = CWFGetOSLog();
      if (v1316)
      {
        CWFGetOSLog();
        v432 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v432 = MEMORY[0x1E4F14500];
        id v1319 = MEMORY[0x1E4F14500];
      }

      if (!os_log_type_enabled(v432, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_400;
      }
      int v1418 = 138543362;
      unint64_t v1419 = (unint64_t)v1366;
      LODWORD(v1330) = 12;
      v1327 = &v1418;
    }
    else
    {
      if (objc_msgSend_trigger(v1370, v509, v510, v511, v512) == 45)
      {
        v432 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v513, v514, v515, v516);
        v521 = objc_msgSend_associatedNetwork(v1368, v517, v518, v519, v520);
        v526 = objc_msgSend_channel(v521, v522, v523, v524, v525);
        if ((objc_msgSend_is6GHz(v526, v527, v528, v529, v530) & 1) == 0)
        {
          v535 = objc_msgSend_channel(v1336, v531, v532, v533, v534);
          int v540 = objc_msgSend_is6GHz(v535, v536, v537, v538, v539);

          if (!v540) {
            goto LABEL_121;
          }
          v545 = objc_msgSend_array(v1365, v541, v542, v543, v544);
          v550 = objc_msgSend_matchingKnownNetworkProfile(v1336, v546, v547, v548, v549);
          v521 = objc_msgSend___knownNetworksList_containsMatchingKnownNetwork_(v1368, v551, (uint64_t)v545, (uint64_t)v550, v552);

          if (!v521)
          {
LABEL_120:

LABEL_121:
            objc_msgSend_intersectSet_(v1365, v541, (uint64_t)v432, v543, v544, v1327, v1330);
            if (!objc_msgSend_count(v1365, v568, v569, v570, v571))
            {
              v572 = CWFGetOSLog();
              if (v572)
              {
                CWFGetOSLog();
                v573 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v573 = MEMORY[0x1E4F14500];
                id v1322 = MEMORY[0x1E4F14500];
              }

              if (os_log_type_enabled(v573, OS_LOG_TYPE_DEFAULT))
              {
                int v1418 = 138543362;
                unint64_t v1419 = (unint64_t)v1366;
                LODWORD(v1330) = 12;
                v1327 = &v1418;
                _os_log_send_and_compose_impl();
              }
LABEL_399:

LABEL_400:
              v1356 = 0;
              v1357 = 0;
              v1352 = 0;
              v1374 = 0;
              v1355 = 0;
              unsigned int v1369 = 1;
              goto LABEL_401;
            }
LABEL_145:

LABEL_146:
            if (objc_msgSend_count(v1365, v499, v500, v501, v502, v1327, v1330))
            {
              v726 = objc_msgSend_set(v1365, v722, v723, v724, v725);
              objc_msgSend_intersectSet_(v1351, v727, (uint64_t)v726, v728, v729);

              deferredKnownNetworks = obj->_deferredKnownNetworks;
              v735 = objc_msgSend_set(v1365, v731, v732, v733, v734);
              objc_msgSend_intersectSet_(deferredKnownNetworks, v736, (uint64_t)v735, v737, v738);

              v743 = objc_msgSend_set(v1365, v739, v740, v741, v742);
              objc_msgSend_intersectSet_(v1350, v744, (uint64_t)v743, v745, v746);

              if (*((unsigned char *)v1413 + 24))
              {
                v751 = CWFGetOSLog();
                if (v751)
                {
                  CWFGetOSLog();
                  v752 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v752 = MEMORY[0x1E4F14500];
                  id v758 = MEMORY[0x1E4F14500];
                }

                if (os_log_type_enabled(v752, OS_LOG_TYPE_DEBUG))
                {
                  LOWORD(v1418) = 0;
                  LODWORD(v1330) = 2;
                  v1327 = &v1418;
                  _os_log_send_and_compose_impl();
                }
              }
              else if (objc_msgSend_count(v1365, v747, v748, v749, v750) == 1)
              {
                v756 = CWFGetOSLog();
                if (v756)
                {
                  CWFGetOSLog();
                  v757 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v757 = MEMORY[0x1E4F14500];
                  id v774 = MEMORY[0x1E4F14500];
                }

                if (os_log_type_enabled(v757, OS_LOG_TYPE_DEBUG))
                {
                  LOWORD(v1418) = 0;
                  LODWORD(v1330) = 2;
                  v1327 = &v1418;
                  _os_log_send_and_compose_impl();
                }

                *((unsigned char *)v1413 + 24) = 1;
              }
              objc_msgSend_setAllowStandalone6GHz_(v1358, v753, *((unsigned __int8 *)v1413 + 24), v754, v755, v1327, v1330);
              objc_msgSend_setWas6GHzDeprioritized_(obj->_metric, v775, *((unsigned char *)v1413 + 24) == 0, v776, v777);
              if (objc_msgSend_count(v1351, v778, v779, v780, v781))
              {
                v782 = CWFGetOSLog();
                if (v782)
                {
                  CWFGetOSLog();
                  v783 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v783 = MEMORY[0x1E4F14500];
                  id v784 = MEMORY[0x1E4F14500];
                }

                if (os_log_type_enabled(v783, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v789 = objc_msgSend_count(v1351, v785, v786, v787, v788);
                  int v1418 = 134217984;
                  unint64_t v1419 = v789;
                  LODWORD(v1330) = 12;
                  v1327 = &v1418;
                  _os_log_send_and_compose_impl();
                }

                v1355 = objc_msgSend_copy(v1358, v790, v791, v792, v793);
                objc_msgSend_setKnownNetworks_(v1355, v794, (uint64_t)v1351, v795, v796);
                v1362 = objc_msgSend_objectForKeyedSubscript_(v1368->_cachedKnownNetworksContexts, v797, (uint64_t)v1355, v798, v799);

                if (v1362)
                {
                  id v804 = v1362;

                  v1355 = v804;
                }
                else
                {
                  uint64_t v807 = objc_msgSend_copy(v1355, v800, v801, v802, v803);

                  objc_msgSend___prepareKnownNetworksContext_(v1368, v808, (uint64_t)v1355, v809, v810);
                  objc_msgSend_setObject_forKeyedSubscript_(v1368->_cachedKnownNetworksContexts, v811, (uint64_t)v1355, v807, v812);
                  v1347 = (void *)v807;
                }
                id v1395 = v1367;
                char v813 = objc_msgSend___discoverKnownNetworksWithContext_error_(v1368, v805, (uint64_t)v1355, (uint64_t)&v1395, v806, v1327, v1330);
                id v814 = v1395;

                if (v813)
                {
                  v1356 = 0;
                  v1357 = 0;
                  goto LABEL_360;
                }
                uint64_t v815 = objc_msgSend_trigger(v1370, v84, v85, v86, v87);
                id v1394 = v814;
                int v818 = objc_msgSend___allowAutoJoinWithTrigger_error_(v1368, v816, v815, (uint64_t)&v1394, v817);
                id v1367 = v1394;

                if (!v818)
                {
                  v1356 = 0;
                  v1357 = 0;
LABEL_362:
                  v1352 = 0;
                  v1374 = 0;
                  goto LABEL_363;
                }
                v1363 = v1362;
              }
              else
              {
                v1355 = 0;
              }
              if (!objc_msgSend_count(obj->_deferredKnownNetworks, v84, v85, v86, v87))
              {
                v1357 = 0;
                goto LABEL_191;
              }
              v819 = CWFGetOSLog();
              if (v819)
              {
                CWFGetOSLog();
                v820 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v820 = MEMORY[0x1E4F14500];
                id v821 = MEMORY[0x1E4F14500];
              }

              if (os_log_type_enabled(v820, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v826 = objc_msgSend_count(obj->_deferredKnownNetworks, v822, v823, v824, v825);
                int v1418 = 134217984;
                unint64_t v1419 = v826;
                LODWORD(v1330) = 12;
                v1327 = &v1418;
                _os_log_send_and_compose_impl();
              }

              v1357 = objc_msgSend_copy(v1358, v827, v828, v829, v830);
              objc_msgSend_setKnownNetworks_(v1357, v831, (uint64_t)obj->_deferredKnownNetworks, v832, v833);
              objc_msgSend_setAllowDeferredCandidates_(v1357, v834, 1, v835, v836);
              objc_msgSend_setUseCacheForPreviouslyScannedChannels_(v1357, v837, 1, v838, v839);
              v1362 = objc_msgSend_objectForKeyedSubscript_(v1368->_cachedKnownNetworksContexts, v840, (uint64_t)v1357, v841, v842);

              if (v1362)
              {
                id v847 = v1362;

                v1357 = v847;
              }
              else
              {
                uint64_t v850 = objc_msgSend_copy(v1357, v843, v844, v845, v846);

                objc_msgSend___prepareKnownNetworksContext_(v1368, v851, (uint64_t)v1357, v852, v853);
                objc_msgSend_setObject_forKeyedSubscript_(v1368->_cachedKnownNetworksContexts, v854, (uint64_t)v1357, v850, v855);
                v1347 = (void *)v850;
              }
              id v1393 = v1367;
              char v856 = objc_msgSend___discoverKnownNetworksWithContext_error_(v1368, v848, (uint64_t)v1357, (uint64_t)&v1393, v849, v1327, v1330);
              id v814 = v1393;

              if ((v856 & 1) == 0)
              {
                uint64_t v857 = objc_msgSend_trigger(v1370, v84, v85, v86, v87);
                id v1392 = v814;
                int v860 = objc_msgSend___allowAutoJoinWithTrigger_error_(v1368, v858, v857, (uint64_t)&v1392, v859);
                id v1367 = v1392;

                if (v860)
                {
                  v1363 = v1362;
LABEL_191:
                  if (!objc_msgSend_count(v1350, v84, v85, v86, v87))
                  {
                    v1374 = 0;
LABEL_226:
                    v999 = obj;
                    if (*((unsigned char *)v1413 + 24))
                    {
                      v1352 = 0;
                    }
                    else
                    {
                      v1000 = CWFGetOSLog();
                      if (v1000)
                      {
                        CWFGetOSLog();
                        v1001 = (id)objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        v1001 = MEMORY[0x1E4F14500];
                        id v1002 = MEMORY[0x1E4F14500];
                      }

                      if (os_log_type_enabled(v1001, OS_LOG_TYPE_DEFAULT))
                      {
                        LOWORD(v1418) = 0;
                        LODWORD(v1330) = 2;
                        v1327 = &v1418;
                        _os_log_send_and_compose_impl();
                      }

                      v1352 = objc_msgSend_copy(v1358, v1003, v1004, v1005, v1006);
                      objc_msgSend_setKnownNetworks_(v1352, v1007, (uint64_t)v1365, v1008, v1009);
                      objc_msgSend_setAllowStandalone6GHz_(v1352, v1010, 1, v1011, v1012);
                      objc_msgSend_setUseCacheForPreviouslyScannedChannels_(v1352, v1013, 1, v1014, v1015);
                      objc_msgSend_setAllowDeferredCandidates_(v1352, v1016, 1, v1017, v1018);
                      v1362 = objc_msgSend_objectForKeyedSubscript_(v1368->_cachedKnownNetworksContexts, v1019, (uint64_t)v1352, v1020, v1021);

                      if (v1362)
                      {
                        id v1026 = v1362;

                        v1352 = v1026;
                      }
                      else
                      {
                        uint64_t v1029 = objc_msgSend_copy(v1352, v1022, v1023, v1024, v1025);

                        objc_msgSend___prepareKnownNetworksContext_(v1368, v1030, (uint64_t)v1352, v1031, v1032);
                        objc_msgSend_setObject_forKeyedSubscript_(v1368->_cachedKnownNetworksContexts, v1033, (uint64_t)v1352, v1029, v1034);
                        v1347 = (void *)v1029;
                      }
                      id v1385 = v1367;
                      char v1035 = objc_msgSend___discoverKnownNetworksWithContext_error_(v1368, v1027, (uint64_t)v1352, (uint64_t)&v1385, v1028, v1327, v1330);
                      id v814 = v1385;

                      if (v1035)
                      {
                        v1356 = 0;
                        goto LABEL_379;
                      }
                      v1363 = v1362;
                      id v1367 = v814;
                      v999 = obj;
                    }
                    if (v1366)
                    {
                      v1356 = 0;
LABEL_251:
                      if (!v1334)
                      {
                        unsigned int v1369 = 0;
                        v1362 = v1363;
                        v1358 = v1371;
                        id v1342 = v1359;
                        goto LABEL_257;
                      }
                      BOOL v1075 = objc_msgSend_mode(v1370, v84, v85, v86, v87) == 3;
                      id v1383 = 0;
                      unsigned int v1369 = objc_msgSend___performAutoHotspotWithBrowseTimeout_maxCacheAge_cacheOnly_error_(v1368, v1076, 10, 10, v1075, &v1383, v1327, v1330);
                      v432 = v1383;
                      goto LABEL_253;
                    }
                    v1036 = CWFGetOSLog();
                    if (v1036)
                    {
                      CWFGetOSLog();
                      v1037 = (id)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v1037 = MEMORY[0x1E4F14500];
                      id v1038 = MEMORY[0x1E4F14500];
                    }

                    if (os_log_type_enabled(v1037, OS_LOG_TYPE_DEFAULT))
                    {
                      LOWORD(v1418) = 0;
                      LODWORD(v1330) = 2;
                      v1327 = &v1418;
                      _os_log_send_and_compose_impl();
                    }

                    v1356 = objc_msgSend_copy(v1358, v1039, v1040, v1041, v1042);
                    objc_msgSend_setKnownNetworks_(v1356, v1043, (uint64_t)v1365, v1044, v1045);
                    objc_msgSend_setMinRSSI_(v1356, v1046, -90, v1047, v1048);
                    objc_msgSend_setAllowStandalone6GHz_(v1356, v1049, 1, v1050, v1051);
                    objc_msgSend_setUseCacheForPreviouslyScannedChannels_(v1356, v1052, 1, v1053, v1054);
                    objc_msgSend_setAllowDeferredCandidates_(v1356, v1055, 1, v1056, v1057);
                    v1362 = objc_msgSend_objectForKeyedSubscript_(v1368->_cachedKnownNetworksContexts, v1058, (uint64_t)v1356, v1059, v1060);

                    if (v1362)
                    {
                      id v1065 = v1362;

                      v1356 = v1065;
                    }
                    else
                    {
                      uint64_t v1068 = objc_msgSend_copy(v1356, v1061, v1062, v1063, v1064);

                      objc_msgSend___prepareKnownNetworksContext_(v1368, v1069, (uint64_t)v1356, v1070, v1071);
                      objc_msgSend_setObject_forKeyedSubscript_(v1368->_cachedKnownNetworksContexts, v1072, (uint64_t)v1356, v1068, v1073);
                      v1347 = (void *)v1068;
                    }
                    id v1384 = v1367;
                    char v1074 = objc_msgSend___discoverKnownNetworksWithContext_error_(v1368, v1066, (uint64_t)v1356, (uint64_t)&v1384, v1067, v1327, v1330);
                    id v814 = v1384;

                    if ((v1074 & 1) == 0)
                    {
                      v1363 = v1362;
                      id v1367 = v814;
LABEL_250:
                      v999 = obj;
                      goto LABEL_251;
                    }
LABEL_379:
                    unsigned int v1369 = 1;
                    id v1367 = v814;
                    goto LABEL_255;
                  }
                  v861 = CWFGetOSLog();
                  if (v861)
                  {
                    CWFGetOSLog();
                    v862 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v862 = MEMORY[0x1E4F14500];
                    id v863 = MEMORY[0x1E4F14500];
                  }

                  if (os_log_type_enabled(v862, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v868 = objc_msgSend_count(v1350, v864, v865, v866, v867);
                    int v1418 = 134217984;
                    unint64_t v1419 = v868;
                    LODWORD(v1330) = 12;
                    v1327 = &v1418;
                    _os_log_send_and_compose_impl();
                  }

                  v1374 = objc_msgSend_copy(v1358, v869, v870, v871, v872);
                  objc_msgSend_setKnownNetworks_(v1374, v873, (uint64_t)v1350, v874, v875);
                  objc_msgSend_setMaxScanCycles_(v1374, v876, -1, v877, v878);
                  objc_msgSend_setPassiveScan_(v1374, v879, 0, v880, v881);
                  objc_msgSend_setDwellTime_(v1374, v882, 0, v883, v884);
                  objc_msgSend_setAllowDeferredCandidates_(v1374, v885, 1, v886, v887);
                  v891 = objc_msgSend_objectForKeyedSubscript_(v1368->_cachedKnownNetworksContexts, v888, (uint64_t)v1374, v889, v890);

                  if (v891)
                  {
                    id v896 = v891;

                    v1374 = v896;
                  }
                  else
                  {
                    uint64_t v901 = objc_msgSend_copy(v1374, v892, v893, v894, v895);

                    objc_msgSend___prepareKnownNetworksContext_(v1368, v902, (uint64_t)v1374, v903, v904);
                    objc_msgSend_setObject_forKeyedSubscript_(v1368->_cachedKnownNetworksContexts, v905, (uint64_t)v1374, v901, v906);
                    v1347 = (void *)v901;
                  }
                  v432 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v897, v898, v899, v900, v1327, v1330);
                  v911 = objc_msgSend_recentChannelList(v1374, v907, v908, v909, v910);
                  v916 = objc_msgSend_remainingChannelList(v1374, v912, v913, v914, v915);
                  v920 = objc_msgSend_arrayByAddingObjectsFromArray_(v911, v917, (uint64_t)v916, v918, v919);

                  v925 = objc_msgSend_recentChannelList(v1374, v921, v922, v923, v924);
                  if ((unint64_t)objc_msgSend_count(v925, v926, v927, v928, v929) >= 2)
                  {

                    uint64_t v939 = 2;
                  }
                  else
                  {
                    v934 = objc_msgSend_recentChannelList(v1374, v930, v931, v932, v933);
                    uint64_t v939 = objc_msgSend_count(v934, v935, v936, v937, v938);

                    if (!v939) {
                      goto LABEL_207;
                    }
                  }
                  for (uint64_t j = 0; j != v939; ++j)
                  {
                    hiddenNetworkChannels = obj->_hiddenNetworkChannels;
                    v946 = objc_msgSend_recentChannelList(v1374, v940, v941, v942, v943);
                    v950 = objc_msgSend_objectAtIndexedSubscript_(v946, v947, j, v948, v949);
                    objc_msgSend_addObject_(hiddenNetworkChannels, v951, (uint64_t)v950, v952, v953);
                  }
LABEL_207:
                  long long v1390 = 0u;
                  long long v1391 = 0u;
                  long long v1388 = 0u;
                  long long v1389 = 0u;
                  id v954 = v920;
                  uint64_t v959 = objc_msgSend_countByEnumeratingWithState_objects_count_(v954, v955, (uint64_t)&v1388, (uint64_t)v1433, 16);
                  if (v959)
                  {
                    uint64_t v960 = *(void *)v1389;
                    do
                    {
                      for (uint64_t k = 0; k != v959; ++k)
                      {
                        if (*(void *)v1389 != v960) {
                          objc_enumerationMutation(v954);
                        }
                        uint64_t v962 = *(void *)(*((void *)&v1388 + 1) + 8 * k);
                        if (objc_msgSend_containsObject_(obj->_hiddenNetworkChannels, v956, v962, v957, v958))objc_msgSend_addObject_(v432, v956, v962, v957, v958); {
                      }
                        }
                      uint64_t v959 = objc_msgSend_countByEnumeratingWithState_objects_count_(v954, v956, (uint64_t)&v1388, (uint64_t)v1433, 16);
                    }
                    while (v959);
                  }

                  v967 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v963, v964, v965, v966);
                  objc_msgSend_setRecentChannelList_(v1374, v968, (uint64_t)v967, v969, v970);

                  objc_msgSend_setRemainingChannelList_(v1374, v971, (uint64_t)v432, v972, v973);
                  v974 = CWFGetOSLog();
                  if (v974)
                  {
                    CWFGetOSLog();
                    v975 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v975 = MEMORY[0x1E4F14500];
                    id v976 = MEMORY[0x1E4F14500];
                  }

                  if (os_log_type_enabled(v975, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v981 = objc_msgSend_count(v432, v977, v978, v979, v980);
                    objc_msgSend_componentsJoinedByString_(v432, v982, @", ", v983, v984);
                    id v985 = (id)objc_claimAutoreleasedReturnValue();
                    int v1418 = 134218242;
                    unint64_t v1419 = v981;
                    __int16 v1420 = 2114;
                    unint64_t v1421 = (unint64_t)v985;
                    LODWORD(v1330) = 22;
                    v1327 = &v1418;
                    _os_log_send_and_compose_impl();
                  }
                  if (objc_msgSend_count(v432, v986, v987, v988, v989))
                  {
                    id v1387 = v1367;
                    char v994 = objc_msgSend___discoverKnownNetworksWithContext_error_(v1368, v990, (uint64_t)v1374, (uint64_t)&v1387, v993);
                    id v765 = v1387;

                    if (v994)
                    {
                      unsigned int v1369 = 1;
LABEL_373:

                      v1356 = 0;
                      v1352 = 0;
                      v1363 = v891;
LABEL_374:
                      v1359 = v1342;
                      goto LABEL_254;
                    }
                    id v1367 = v765;
                  }
                  uint64_t v995 = objc_msgSend_trigger(v1370, v990, v991, v992, v993, v1327, v1330);
                  id v1386 = v1367;
                  char v998 = objc_msgSend___allowAutoJoinWithTrigger_error_(v1368, v996, v995, (uint64_t)&v1386, v997);
                  id v765 = v1386;

                  if (v998)
                  {

                    v1363 = v891;
                    id v1367 = v765;
                    goto LABEL_226;
                  }
                  unsigned int v1369 = 0;
                  goto LABEL_373;
                }
                v1356 = 0;
                goto LABEL_362;
              }
              v1356 = 0;
LABEL_360:
              v1352 = 0;
              v1374 = 0;
              goto LABEL_379;
            }
            v1313 = CWFGetOSLog();
            if (v1313)
            {
              CWFGetOSLog();
              v1312 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v1312 = MEMORY[0x1E4F14500];
              id v1317 = MEMORY[0x1E4F14500];
            }

            if (os_log_type_enabled(v1312, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v1418) = 0;
              LODWORD(v1330) = 2;
              v1327 = &v1418;
              _os_log_send_and_compose_impl();
            }
LABEL_386:

            v1356 = 0;
            v1357 = 0;
            v1352 = 0;
            v1374 = 0;
            v1355 = 0;
            goto LABEL_250;
          }
          objc_msgSend_setInclude6GHzChannels_(v1358, v553, 1, v554, v555);
          v1437 = v521;
          v526 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v556, (uint64_t)&v1437, 1, v557);
          v559 = objc_msgSend___knownNetworksSupportingSeamlessSSIDTransition_fromNetwork_allowSameSSID_context_(v1368, v558, (uint64_t)v526, (uint64_t)v1366, 1, v1358);
          v564 = objc_msgSend_set(v559, v560, v561, v562, v563);
          objc_msgSend_unionSet_(v432, v565, (uint64_t)v564, v566, v567);
        }
        goto LABEL_120;
      }
      if (objc_msgSend_trigger(v1370, v513, v514, v515, v516) == 58)
      {
        v432 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v574, v575, v576, v577);
        v582 = objc_msgSend_associatedNetwork(v1368, v578, v579, v580, v581);
        v587 = objc_msgSend_channel(v582, v583, v584, v585, v586);
        if ((objc_msgSend_is6GHz(v587, v588, v589, v590, v591) & 1) == 0)
        {
          v596 = objc_msgSend_channel(v1336, v592, v593, v594, v595);
          int v601 = objc_msgSend_is6GHz(v596, v597, v598, v599, v600);

          if (!v601)
          {
LABEL_131:
            v629 = objc_msgSend_matchingKnownNetworkProfile(v1366, v602, v603, v604, v605, v1327, v1330);
            v634 = objc_msgSend_array(v1365, v630, v631, v632, v633);
            v636 = objc_msgSend___morePreferredKnownNetworksWithCandidate_knownNetworks_context_(v1368, v635, (uint64_t)v629, (uint64_t)v634, (uint64_t)v1358);
            v641 = objc_msgSend_set(v636, v637, v638, v639, v640);
            objc_msgSend_unionSet_(v432, v642, (uint64_t)v641, v643, v644);

            if (objc_msgSend___isDeferrableJoinCandidate_(v1368, v645, (uint64_t)v1366, v646, v647))
            {
              v652 = objc_msgSend_matchingKnownNetworkProfile(v1366, v648, v649, v650, v651);
              char v657 = objc_msgSend_wasMoreRecentlyJoinedByUser(v652, v653, v654, v655, v656);

              if ((v657 & 1) == 0)
              {
                v659 = objc_msgSend_set(v1351, v648, v658, v650, v651);
                objc_msgSend_unionSet_(v432, v660, (uint64_t)v659, v661, v662);
              }
            }
            objc_msgSend_intersectSet_(v1365, v648, (uint64_t)v432, v650, v651);
            if (!objc_msgSend_count(v1365, v663, v664, v665, v666))
            {
              v667 = CWFGetOSLog();
              if (v667)
              {
                CWFGetOSLog();
                v573 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v573 = MEMORY[0x1E4F14500];
                id v1323 = MEMORY[0x1E4F14500];
              }

              if (os_log_type_enabled(v573, OS_LOG_TYPE_DEFAULT))
              {
                int v1418 = 138543362;
                unint64_t v1419 = (unint64_t)v1366;
                LODWORD(v1330) = 12;
                v1327 = &v1418;
                _os_log_send_and_compose_impl();
              }
              goto LABEL_399;
            }
            goto LABEL_145;
          }
          v606 = objc_msgSend_array(v1365, v602, v603, v604, v605);
          v611 = objc_msgSend_matchingKnownNetworkProfile(v1336, v607, v608, v609, v610);
          v582 = objc_msgSend___knownNetworksList_containsMatchingKnownNetwork_(v1368, v612, (uint64_t)v606, (uint64_t)v611, v613);

          if (!v582)
          {
LABEL_130:

            goto LABEL_131;
          }
          objc_msgSend_setInclude6GHzChannels_(v1358, v614, 1, v615, v616);
          v1436 = v582;
          v587 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v617, (uint64_t)&v1436, 1, v618);
          v620 = objc_msgSend___knownNetworksSupportingSeamlessSSIDTransition_fromNetwork_allowSameSSID_context_(v1368, v619, (uint64_t)v587, (uint64_t)v1366, 1, v1358);
          v625 = objc_msgSend_set(v620, v621, v622, v623, v624);
          objc_msgSend_unionSet_(v432, v626, (uint64_t)v625, v627, v628);
        }
        goto LABEL_130;
      }
      if (objc_msgSend_trigger(v1370, v574, v575, v576, v577) == 54
        || objc_msgSend_trigger(v1370, v668, v669, v670, v671) == 55)
      {
        uint64_t v676 = objc_msgSend_trigger(v1370, v668, v669, v670, v671, v1327, v1330);
        if (v676 != 54 && objc_msgSend_trigger(v1370, v672, v673, v674, v675) == 55)
        {
          v677 = objc_msgSend_array(v1365, v672, v673, v674, v675);
          v682 = objc_msgSend_associatedNetwork(v1368, v678, v679, v680, v681);
          v684 = objc_msgSend___knownNetworksSupportingSeamlessSSIDTransition_fromNetwork_allowSameSSID_context_(v1368, v683, (uint64_t)v677, (uint64_t)v682, 0, v1358);
          BOOL v689 = objc_msgSend_count(v684, v685, v686, v687, v688) == 0;

          if (v689) {
            objc_msgSend_setBSSChannelsOnly_(v1358, v672, 1, v674, v675);
          }
        }
        v690 = objc_msgSend_array(v1365, v672, v673, v674, v675);
        v695 = objc_msgSend_associatedNetwork(v1368, v691, v692, v693, v694);
        v697 = objc_msgSend___knownNetworksSupportingSeamlessSSIDTransition_fromNetwork_allowSameSSID_context_(v1368, v696, (uint64_t)v690, (uint64_t)v695, v676 != 54, v1358);
        BOOL v702 = objc_msgSend_count(v697, v698, v699, v700, v701) == 0;

        if (v702)
        {
          v1320 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v1434 = *MEMORY[0x1E4F28568];
          v1435 = @"Already associated and no seamless SSID transition candidates configured";
          v432 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v703, (uint64_t)&v1435, (uint64_t)&v1434, 1);
          objc_msgSend_errorWithDomain_code_userInfo_(v1320, v1321, *MEMORY[0x1E4F28798], 6, (uint64_t)v432);
          id v765 = (id)objc_claimAutoreleasedReturnValue();

          v1356 = 0;
          v1357 = 0;
          v1352 = 0;
          v1374 = 0;
          v1355 = 0;
          unsigned int v1369 = 0;
          goto LABEL_374;
        }
        v432 = objc_msgSend_array(v1365, v703, v704, v705, v706);
        v711 = objc_msgSend_associatedNetwork(v1368, v707, v708, v709, v710);
        v713 = objc_msgSend___knownNetworksSupportingSeamlessSSIDTransition_fromNetwork_allowSameSSID_context_(v1368, v712, (uint64_t)v432, (uint64_t)v711, 1, v1358);
        v718 = objc_msgSend_set(v713, v714, v715, v716, v717);
        objc_msgSend_intersectSet_(v1365, v719, (uint64_t)v718, v720, v721);

        goto LABEL_145;
      }
      if (objc_msgSend_trigger(v1370, v668, v669, v670, v671) == 32
        || objc_msgSend_trigger(v1370, v1294, v1295, v1296, v1297) == 47
        || (objc_msgSend_matchingKnownNetworkProfile(v1366, v1294, v1295, v1296, v1297),
            v1298 = objc_claimAutoreleasedReturnValue(),
            int v1303 = objc_msgSend_wasMoreRecentlyJoinedByUser(v1298, v1299, v1300, v1301, v1302),
            v1298,
            !v1303))
      {
        uint64_t v1304 = objc_msgSend_trigger(v1370, v1294, v1295, v1296, v1297, v1327, v1330);
        if (objc_msgSend___allowOpportunisticNetworkTransitionWithTrigger_(v1368, v1305, v1304, v1306, v1307)) {
          goto LABEL_146;
        }
        v1308 = CWFGetOSLog();
        if (v1308)
        {
          CWFGetOSLog();
          v432 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v432 = MEMORY[0x1E4F14500];
          id v1324 = MEMORY[0x1E4F14500];
        }

        if (!os_log_type_enabled(v432, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_400;
        }
        int v1418 = 138543362;
        unint64_t v1419 = (unint64_t)v1366;
        LODWORD(v1330) = 12;
        v1327 = &v1418;
      }
      else
      {
        v1325 = CWFGetOSLog();
        if (v1325)
        {
          CWFGetOSLog();
          v432 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v432 = MEMORY[0x1E4F14500];
          id v1326 = MEMORY[0x1E4F14500];
        }

        if (!os_log_type_enabled(v432, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_400;
        }
        int v1418 = 138543362;
        unint64_t v1419 = (unint64_t)v1366;
        LODWORD(v1330) = 12;
        v1327 = &v1418;
      }
    }
    unsigned int v1369 = 1;
    _os_log_send_and_compose_impl();
    v1356 = 0;
    v1357 = 0;
    v1352 = 0;
    v1374 = 0;
    v1355 = 0;
LABEL_401:
    v1359 = v1342;
    goto LABEL_253;
  }
  v426 = objc_msgSend_allObjects(v1359, v421, v422, v423, v424);
  v1346 = objc_msgSend___knownNetworksList_containsMatchingKnownNetwork_(v1368, v427, (uint64_t)v426, (uint64_t)v425, v428);

  if (!v1346)
  {
    v431 = CWFGetOSLog();
    if (v431)
    {
      CWFGetOSLog();
      v432 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v432 = MEMORY[0x1E4F14500];
      id v463 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v432, OS_LOG_TYPE_DEFAULT))
    {
      int v1418 = 138543362;
      unint64_t v1419 = 0;
      LODWORD(v1330) = 12;
      v1327 = &v1418;
      _os_log_send_and_compose_impl();
    }
    goto LABEL_84;
  }
  v429 = CWFGetOSLog();
  if (v429)
  {
    CWFGetOSLog();
    v430 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v430 = MEMORY[0x1E4F14500];
    id v433 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v430, OS_LOG_TYPE_DEFAULT))
  {
    int v1418 = 138543362;
    unint64_t v1419 = (unint64_t)v1346;
    LODWORD(v1330) = 12;
    v1327 = &v1418;
    _os_log_send_and_compose_impl();
  }

  v434 = v1368->_targetQueue;
  id v1410 = 0;
  int v436 = objc_msgSend___allowKnownNetwork_context_allowForSeamlessSSIDTransition_defer_targetQueue_error_(v1368, v435, (uint64_t)v1346, (uint64_t)v1371, 0, 0, v434, &v1410);
  v432 = v1410;
  if (!v436)
  {
LABEL_84:
    v1363 = 0;
    v1347 = 0;
LABEL_85:

    v425 = v1363;
    goto LABEL_86;
  }
  v441 = objc_msgSend_copy(v1371, v437, v438, v439, v440);
  v445 = objc_msgSend_orderedSetWithObject_(MEMORY[0x1E4F1CAA0], v442, (uint64_t)v1346, v443, v444);
  objc_msgSend_setKnownNetworks_(v441, v446, (uint64_t)v445, v447, v448);

  objc_msgSend_setAllowDeferredCandidates_(v441, v449, 1, v450, v451);
  v455 = objc_msgSend_objectForKeyedSubscript_(v1368->_cachedKnownNetworksContexts, v452, (uint64_t)v441, v453, v454);
  v1363 = v455;
  if (v455)
  {
    id v460 = v455;

    v1347 = 0;
    v441 = v460;
  }
  else
  {
    v1347 = objc_msgSend_copy(v441, v456, v457, v458, v459);
    objc_msgSend___prepareKnownNetworksContext_(v1368, v759, (uint64_t)v441, v760, v761);
    objc_msgSend_setObject_forKeyedSubscript_(v1368->_cachedKnownNetworksContexts, v762, (uint64_t)v441, (uint64_t)v1347, v763);
  }
  id v1409 = v1367;
  int v764 = objc_msgSend___discoverKnownNetworksWithContext_error_(v1368, v461, (uint64_t)v441, (uint64_t)&v1409, v462, v1327, v1330);
  id v765 = v1409;

  if (v764)
  {

    v1356 = 0;
    v1357 = 0;
    id v1351 = 0;
    v1352 = 0;
    v1374 = 0;
    v1355 = 0;
    id v1350 = 0;
    id v1365 = 0;
    unsigned int v1369 = 1;
    goto LABEL_254;
  }
  uint64_t v770 = objc_msgSend_trigger(v1370, v766, v767, v768, v769);
  id v1408 = v765;
  int v773 = objc_msgSend___allowAutoJoinWithTrigger_error_(v1368, v771, v770, (uint64_t)&v1408, v772);
  id v1367 = v1408;

  if (v773) {
    goto LABEL_85;
  }
  v1356 = 0;
  v1357 = 0;
  id v1351 = 0;
  v1352 = 0;
  v1374 = 0;
  v1355 = 0;
  id v1350 = 0;
  id v1365 = 0;
  unsigned int v1369 = 0;
LABEL_253:
  id v765 = v1367;
LABEL_254:

  v1362 = v1363;
  v1358 = v1371;
  id v1342 = v1359;
  id v1367 = v765;
LABEL_255:
  v999 = obj;
LABEL_257:
  BOOL v1081 = objc_msgSend_scanDuration(v999->_metric, v84, v85, v86, v87, v1327, v1330)
       || objc_msgSend_autoHotspotBrowseDuration(obj->_metric, v1077, v1078, v1079, v1080);
  v1082 = obj;
  objc_sync_enter(v1082);
  int v1083 = *((unsigned __int8 *)v1082 + 201);
  int v1372 = *((unsigned __int8 *)v1082 + 202);
  v1088 = objc_msgSend_reply(obj->_activeRequest, v1084, v1085, v1086, v1087);
  v1364 = objc_msgSend_copy(v1088, v1089, v1090, v1091, v1092);

  int v1360 = v1372 | v1083;
  if (v1367 || v1372 | v1083)
  {
    v1108 = obj->_activeRequest;
    obj->_unint64_t activeRequest = 0;

    *((unsigned char *)v1082 + 201) = 0;
    v1109 = v1082[26];
    v1082[26] = 0;

    *((unsigned char *)v1082 + 202) = 0;
    v1107 = obj;
  }
  else
  {
    if (!obj->_didConfigurationChangeSincePreviousAttempt) {
      objc_msgSend___removeRedundantRequests_(v1082, v1093, (uint64_t)obj->_activeRequest, v1094, v1095);
    }
    v1096 = obj->_activeRequest;
    obj->_unint64_t activeRequest = 0;

    *((unsigned char *)v1082 + 201) = 0;
    v1097 = v1082[26];
    v1082[26] = 0;

    *((unsigned char *)v1082 + 202) = 0;
    unint64_t v1102 = objc_msgSend_trigger(v1370, v1098, v1099, v1100, v1101);
    v1107 = obj;
    if (v1102 - 44 < 8 || v1102 <= 0x3F && ((1 << v1102) & 0xC000000000000010) != 0) {
      ++obj->_retryScheduleIndex;
    }
  }
  if (!*((unsigned char *)v1082 + 200))
  {
    uint64_t v1185 = objc_msgSend_trigger(v1370, v1103, v1104, v1105, v1106);
    if ((objc_msgSend___shouldPrioritizeRetryOverNewRequest_(v1082, v1186, v1185, v1187, v1188) & 1) != 0
      || (objc_msgSend___nextRequest(v1082, v1103, v1189, v1105, v1106) & 1) == 0)
    {
      if (!v1367
        || v1083
        || (unint64_t v1190 = objc_msgSend_trigger(v1370, v1103, v1189, v1105, v1106), v1190 - 44 >= 8)
        && (v1190 > 0x3F || ((1 << v1190) & 0xC000000000000010) == 0))
      {
        objc_msgSend___updateRetrySchedule(v1082, v1103, v1189, v1105, v1106);
      }
    }
  }
  v1110 = objc_msgSend_objectForKeyedSubscript_(v1107->_triggerTimestampMap, v1103, (uint64_t)&unk_1F0DC77B8, v1105, v1106);
  unint64_t v1115 = objc_msgSend_unsignedLongValue(v1110, v1111, v1112, v1113, v1114);

  v1119 = objc_msgSend_objectForKeyedSubscript_(obj->_triggerTimestampMap, v1116, (uint64_t)&unk_1F0DC77D0, v1117, v1118);
  unint64_t v1124 = objc_msgSend_unsignedLongValue(v1119, v1120, v1121, v1122, v1123);

  v1128 = objc_msgSend_objectForKeyedSubscript_(obj->_triggerTimestampMap, v1125, (uint64_t)&unk_1F0DC77E8, v1126, v1127);
  unint64_t v1133 = objc_msgSend_unsignedLongValue(v1128, v1129, v1130, v1131, v1132);

  if (v1369
    && (objc_msgSend_trigger(v1370, v1134, v1135, v1136, v1137) == 54
     || objc_msgSend_trigger(v1370, v1134, v1138, v1139, v1137) == 55))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1082[29], v1134, 0, (uint64_t)&unk_1F0DC7800, v1137);
  }
  if (v1081)
  {
    v1140 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v1134, v1335, v1136, v1137);
    v1141 = v1082[29];
    v1142 = NSNumber;
    uint64_t v1147 = objc_msgSend_trigger(v1370, v1143, v1144, v1145, v1146);
    v1151 = objc_msgSend_numberWithInteger_(v1142, v1148, v1147, v1149, v1150);
    objc_msgSend_setObject_forKeyedSubscript_(v1141, v1152, (uint64_t)v1140, (uint64_t)v1151, v1153);

    v1157 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v1154, v1335, v1155, v1156);
    objc_msgSend_setObject_forKeyedSubscript_(v1082[29], v1158, (uint64_t)v1157, (uint64_t)&unk_1F0DC7818, v1159);
  }
  objc_sync_exit(v1082);

  if (self->_beginTimestamp)
  {
    __uint64_t v1160 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    __uint64_t v1161 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    unint64_t v1162 = self->_beginTimestamp;
    uint64_t v1167 = objc_msgSend_autoHotspotDuration(obj->_metric, v1163, v1164, v1165, v1166);
    objc_msgSend_setDuration_(obj->_metric, v1168, (v1161 - v1162) / 0xF4240 - v1167, v1169, v1170);
    objc_msgSend_setResult_(obj->_metric, v1171, v1369, v1172, v1173);
    objc_msgSend_setError_(obj->_metric, v1174, (uint64_t)v1367, v1175, v1176);
    if (linkChangeTimestamp < v1340 || v1344 == v1340) {
      objc_msgSend_setDurationFromLinkDownTrigger_(obj->_metric, v1177, (v1160 - v1340) / 0xF4240, v1178, v1179);
    }
    if (linkChangeTimestamp < v1115 || v1344 == v1115) {
      objc_msgSend_setDurationFromDeviceUnlockTrigger_(obj->_metric, v1177, (v1160 - v1115) / 0xF4240, v1178, v1179);
    }
    if (linkChangeTimestamp < v1124 || v1344 == v1124) {
      objc_msgSend_setDurationFromDisplayOnTrigger_(obj->_metric, v1177, (v1160 - v1124) / 0xF4240, v1178, v1179);
    }
    if (linkChangeTimestamp < v1133 || v1344 == v1133) {
      objc_msgSend_setDurationFromWiFiPowerOnTrigger_(obj->_metric, v1177, (v1160 - v1133) / 0xF4240, v1178, v1179);
    }
    if (linkChangeTimestamp < v1338 || v1344 == v1338)
    {
      objc_msgSend_setDurationFromNonRetryAutoJoinTrigger_(obj->_metric, v1177, (v1160 - v1338) / 0xF4240, v1178, v1179);
      objc_msgSend_setPreviousNonRetryAutoJoinTrigger_(obj->_metric, v1180, previousNonRetryTrigger, v1181, v1182);
    }
    objc_msgSend___updateCachedMetricAndStatistics_(v1082, v1177, (uint64_t)obj->_metric, v1178, v1179);
    v1183 = CWFGetOSLog();
    if (v1183)
    {
      CWFGetOSLog();
      v1184 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v1184 = MEMORY[0x1E4F14500];
      id v1191 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v1184, OS_LOG_TYPE_DEFAULT))
    {
      int v1345 = v1083;
      v1196 = objc_msgSend_UUIDString(v1337, v1192, v1193, v1194, v1195);
      objc_msgSend_substringToIndex_(v1196, v1197, 5, v1198, v1199);
      id v1200 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v1341 = objc_msgSend_duration(obj->_metric, v1201, v1202, v1203, v1204);
      int v1339 = objc_msgSend_result(obj->_metric, v1205, v1206, v1207, v1208);
      v1349 = objc_msgSend_error(obj->_metric, v1209, v1210, v1211, v1212);
      objc_msgSend___descriptionForError_(v1082, v1213, (uint64_t)v1349, v1214, v1215);
      id v1354 = (id)objc_claimAutoreleasedReturnValue();
      v1220 = objc_msgSend_scanChannels(obj->_metric, v1216, v1217, v1218, v1219);
      uint64_t v1225 = objc_msgSend_count(v1220, v1221, v1222, v1223, v1224);
      uint64_t v1230 = objc_msgSend_autoHotspotDuration(obj->_metric, v1226, v1227, v1228, v1229);
      int v1235 = objc_msgSend_autoHotspotResult(obj->_metric, v1231, v1232, v1233, v1234);
      v1240 = objc_msgSend_autoHotspotError(obj->_metric, v1236, v1237, v1238, v1239);
      objc_msgSend___descriptionForError_(v1082, v1241, (uint64_t)v1240, v1242, v1243);
      v1244 = v1196;
      id v1245 = (id)objc_claimAutoreleasedReturnValue();
      int v1418 = 138545666;
      unint64_t v1419 = (unint64_t)v1200;
      __int16 v1420 = 2048;
      unint64_t v1421 = v1341;
      __int16 v1422 = 1024;
      *(_DWORD *)v1423 = v1339;
      *(_WORD *)&v1423[4] = 2114;
      *(void *)&v1423[6] = v1354;
      *(_WORD *)&v1423[14] = 1024;
      *(_DWORD *)&v1423[16] = v1345;
      *(_WORD *)v1424 = 1024;
      *(_DWORD *)&v1424[2] = v1372;
      __int16 v1425 = 2048;
      uint64_t v1426 = v1225;
      __int16 v1427 = 2048;
      uint64_t v1428 = v1230;
      __int16 v1429 = 1024;
      int v1430 = v1235;
      __int16 v1431 = 2114;
      id v1432 = v1245;
      LODWORD(v1332) = 86;
      v1329 = &v1418;
      _os_log_send_and_compose_impl();
    }
    v1246 = CWFGetOSLog();
    if (v1246)
    {
      CWFGetOSLog();
      v1247 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v1247 = MEMORY[0x1E4F14500];
      id v1248 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v1247, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v1249 = (unint64_t)obj->_metric;
      int v1418 = 138543362;
      unint64_t v1419 = v1249;
      LODWORD(v1332) = 12;
      v1329 = &v1418;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend___updateAutoJoinState_(v1082, v1250, 0, v1251, v1252);
    uint64_t v1253 = objc_opt_class();
    if (!v1360 && v1253)
    {
      v1258 = objc_msgSend_coreAnalyticsEventName(obj->_metric, v1254, v1255, v1256, v1257);
      v1263 = objc_msgSend_coreAnalyticsEventPayload(obj->_metric, v1259, v1260, v1261, v1262);
      v1264 = CWFGetOSLog();
      if (v1264)
      {
        CWFGetOSLog();
        v1265 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v1265 = MEMORY[0x1E4F14500];
        id v1266 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v1265, OS_LOG_TYPE_DEBUG))
      {
        int v1418 = 138543362;
        unint64_t v1419 = (unint64_t)v1258;
        LODWORD(v1332) = 12;
        v1329 = &v1418;
        _os_log_send_and_compose_impl();
      }

      uint64_t v1378 = MEMORY[0x1E4F143A8];
      uint64_t v1379 = 3221225472;
      v1380 = sub_1B4F9BC24;
      v1381 = &unk_1E60BB9A0;
      id v1382 = v1263;
      AnalyticsSendEventLazy();
    }
    if (v1367) {
      char v1267 = 1;
    }
    else {
      char v1267 = v1369;
    }
    if ((v1267 & 1) == 0)
    {
      if (objc_msgSend_trigger(v1370, v1254, v1255, v1256, v1257) == 54
        || objc_msgSend_trigger(v1370, v1268, v1269, v1270, v1271) == 55)
      {
        v1272 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v1416 = *MEMORY[0x1E4F28568];
        v1417 = @"No candidate found";
        v1273 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v1268, (uint64_t)&v1417, (uint64_t)&v1416, 1, v1329, v1332);
        objc_msgSend_errorWithDomain_code_userInfo_(v1272, v1274, *MEMORY[0x1E4F28798], 2, (uint64_t)v1273);
        id v1367 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v1367 = 0;
      }
    }
  }
  if (!v1372)
  {
    __uint64_t v1275 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v1276 = CWFGetOSLog();
    if (v1276)
    {
      CWFGetOSLog();
      v1277 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v1277 = MEMORY[0x1E4F14500];
      id v1278 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v1277, OS_LOG_TYPE_DEBUG))
    {
      int v1418 = 134219010;
      unint64_t v1419 = v1275 / 0x3B9ACA00;
      __int16 v1420 = 2048;
      unint64_t v1421 = v1275 % 0x3B9ACA00 / 0x3E8;
      __int16 v1422 = 2082;
      *(void *)v1423 = "-[CWFAutoJoinManager __performAutoJoin]";
      *(_WORD *)&v1423[8] = 2082;
      *(void *)&v1423[10] = "CWFAutoJoinManager.m";
      *(_WORD *)&v1423[18] = 1024;
      *(_DWORD *)v1424 = 2327;
      _os_log_send_and_compose_impl();
    }

    v1283 = objc_msgSend_targetQueue(v1082, v1279, v1280, v1281, v1282);
    v1375[0] = MEMORY[0x1E4F143A8];
    v1375[1] = 3221225472;
    v1375[2] = sub_1B4F9BC2C;
    v1375[3] = &unk_1E60BBE60;
    id v1377 = v1364;
    id v1376 = v1367;
    dispatch_sync(v1283, v1375);
  }
  _Block_object_dispose(&v1412, 8);
}

- (void)__sortKnownNetworks:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  objc_msgSend_array(v4, v6, v7, v8, v9);
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = objc_msgSend_knownNetworkComparator(self, v10, v11, v12, v13);
  if (v16)
  {
    uint64_t v17 = objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x1E4F29008], v14, 0, 0, (uint64_t)v16);
    objc_msgSend_addObject_(v34, v18, (uint64_t)v17, v19, v20);
  }
  uint64_t v21 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E4F29008], v14, @"lastJoinedAt", 0, v15);
  objc_msgSend_addObject_(v34, v22, (uint64_t)v21, v23, v24);
  long long v27 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E4F29008], v25, @"addedAt", 0, v26);
  objc_msgSend_addObject_(v34, v28, (uint64_t)v27, v29, v30);
  objc_msgSend_sortUsingDescriptors_(v5, v31, (uint64_t)v34, v32, v33);
}

- (void)__sortKnownNetworksByJoinTimestamp:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  objc_msgSend_array(v3, v5, v6, v7, v8);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E4F29008], v9, @"lastJoinedByUserAt", 0, v10);
  objc_msgSend_addObject_(v24, v12, (uint64_t)v11, v13, v14);
  uint64_t v17 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E4F29008], v15, @"lastJoinedBySystemAt", 0, v16);
  objc_msgSend_addObject_(v24, v18, (uint64_t)v17, v19, v20);
  objc_msgSend_sortUsingDescriptors_(v4, v21, (uint64_t)v24, v22, v23);
}

- (id)__basicChannelRepresentation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v9 = objc_msgSend_channel(v4, v5, v6, v7, v8);
    uint64_t v14 = objc_msgSend_band(v4, v10, v11, v12, v13);

    uint64_t v16 = objc_msgSend_channelWithNumber_band_width_(CWFChannel, v15, v9, v14, 20);
  }
  else
  {
    uint64_t v16 = 0;
  }
  return v16;
}

- (id)__knownNetworksList:(id)a3 containsMatchingKnownNetwork:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v5;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v56, (uint64_t)v60, 16);
  if (v8)
  {
    uint64_t v13 = v8;
    uint64_t v14 = *(void *)v57;
LABEL_3:
    uint64_t v15 = 0;
    uint64_t v53 = v13;
    while (1)
    {
      if (*(void *)v57 != v14) {
        objc_enumerationMutation(obj);
      }
      uint64_t v16 = *(void **)(*((void *)&v56 + 1) + 8 * v15);
      uint64_t v17 = objc_msgSend_identifier(v6, v9, v10, v11, v12);
      uint64_t v22 = objc_msgSend_identifier(v16, v18, v19, v20, v21);
      if (v17 == (void *)v22)
      {

LABEL_17:
        id v51 = v16;
        goto LABEL_18;
      }
      long long v27 = (void *)v22;
      uint64_t v28 = objc_msgSend_identifier(v6, v23, v24, v25, v26);
      if (v28)
      {
        uint64_t v33 = (void *)v28;
        uint64_t v34 = objc_msgSend_identifier(v16, v29, v30, v31, v32);
        if (v34)
        {
          uint64_t v39 = (void *)v34;
          objc_msgSend_identifier(v6, v35, v36, v37, v38);
          id v40 = v6;
          v42 = uint64_t v41 = v14;
          uint64_t v47 = objc_msgSend_identifier(v16, v43, v44, v45, v46);
          int isEqual = objc_msgSend_isEqual_(v42, v48, (uint64_t)v47, v49, v50);

          uint64_t v14 = v41;
          id v6 = v40;
          uint64_t v13 = v53;

          if (isEqual) {
            goto LABEL_17;
          }
          goto LABEL_13;
        }
      }
LABEL_13:
      if (v13 == ++v15)
      {
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v56, (uint64_t)v60, 16);
        if (v13) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  id v51 = 0;
LABEL_18:

  return v51;
}

- (BOOL)__didRecentlyJoinAny6GHzOnlyNetworks:(id)a3
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v9 = objc_msgSend_location(self, v5, v6, v7, v8);
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v10, v11, v12, v13);
  double v15 = v14;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v16 = v4;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v110, (uint64_t)v119, 16);
  if (v18)
  {
    uint64_t v23 = v18;
    uint64_t v24 = *(void *)v111;
    while (2)
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v111 != v24) {
          objc_enumerationMutation(v16);
        }
        uint64_t v26 = *(void **)(*((void *)&v110 + 1) + 8 * v25);
        if (objc_msgSend_wasRecently6GHzOnlyOnAnyDevice(v26, v19, v20, v21, v22, v101, v102))
        {
          long long v27 = objc_msgSend_lastJoinedOnAnyDeviceAt(v26, v19, v20, v21, v22);
          objc_msgSend_timeIntervalSinceReferenceDate(v27, v28, v29, v30, v31);
          double v33 = v15 - v32;

          if (v33 <= 2592000.0)
          {
            if (!v9) {
              goto LABEL_33;
            }
            uint64_t v103 = v23;
            uint64_t v104 = v24;
            id v105 = v16;
            long long v108 = 0u;
            long long v109 = 0u;
            long long v106 = 0u;
            long long v107 = 0u;
            uint64_t v34 = objc_msgSend_BSSList(v26, v19, v20, v21, v22);
            uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v106, (uint64_t)v118, 16);
            if (!v36)
            {
LABEL_32:

              id v16 = v105;
LABEL_33:
              uint64_t v87 = CWFGetOSLog();
              if (v87)
              {
                uint64_t v88 = CWFGetOSLog();
              }
              else
              {
                uint64_t v88 = MEMORY[0x1E4F14500];
                id v89 = MEMORY[0x1E4F14500];
              }

              if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v94 = objc_msgSend_identifier(v26, v90, v91, v92, v93);
                uint64_t v99 = objc_msgSend_redactedForWiFi(v94, v95, v96, v97, v98);
                int v114 = 138543362;
                uint64_t v115 = v99;
                _os_log_send_and_compose_impl();
              }
              BOOL v86 = 1;
              goto LABEL_40;
            }
            uint64_t v41 = v36;
            char v42 = 0;
            uint64_t v43 = *(void *)v107;
            do
            {
              for (uint64_t i = 0; i != v41; ++i)
              {
                if (*(void *)v107 != v43) {
                  objc_enumerationMutation(v34);
                }
                uint64_t v45 = *(void **)(*((void *)&v106 + 1) + 8 * i);
                uint64_t v46 = objc_msgSend_lastAssociatedAt(v45, v37, v38, v39, v40);
                objc_msgSend_timeIntervalSinceReferenceDate(v46, v47, v48, v49, v50);
                double v52 = v15 - v51;

                if (v52 <= 2592000.0)
                {
                  uint64_t v53 = objc_msgSend_location(v45, v37, v38, v39, v40);
                  if (!v53) {
                    goto LABEL_32;
                  }
                  long long v57 = v53;
                  objc_msgSend_distanceFromLocation_(v53, v54, (uint64_t)v9, v55, v56);
                  double v59 = v58;
                  objc_msgSend_horizontalAccuracy(v57, v60, v61, v62, v63);
                  double v65 = v59 - v64;
                  objc_msgSend_horizontalAccuracy(v9, v66, v67, v68, v69);
                  double v71 = v65 - v70;

                  if (v71 <= 3000.0) {
                    goto LABEL_32;
                  }
                  char v42 = 1;
                }
              }
              uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v106, (uint64_t)v118, 16);
            }
            while (v41);

            id v16 = v105;
            uint64_t v23 = v103;
            uint64_t v24 = v104;
            if ((v42 & 1) == 0 || !_os_feature_enabled_impl()) {
              goto LABEL_33;
            }
            uint64_t v72 = CWFGetOSLog();
            if (v72)
            {
              uint64_t v73 = CWFGetOSLog();
            }
            else
            {
              uint64_t v73 = MEMORY[0x1E4F14500];
              id v74 = MEMORY[0x1E4F14500];
            }

            if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v79 = objc_msgSend_identifier(v26, v75, v76, v77, v78);
              uint64_t v84 = objc_msgSend_redactedForWiFi(v79, v80, v81, v82, v83);
              int v114 = 138543618;
              uint64_t v115 = v84;
              __int16 v116 = 1024;
              int v117 = 3000;
              LODWORD(v102) = 18;
              uint64_t v101 = &v114;
              _os_log_send_and_compose_impl();
            }
          }
        }
        ++v25;
      }
      while (v25 != v23);
      uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v110, (uint64_t)v119, 16);
      uint64_t v23 = v85;
      BOOL v86 = 0;
      if (v85) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v86 = 0;
  }
LABEL_40:

  return v86;
}

- (void)__prepareKnownNetworksContext:(id)a3
{
  v1219[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  context = (void *)MEMORY[0x1BA995D10]();
  v1157 = self;
  objc_msgSend___updateAutoJoinState_(self, v5, 1, v6, v7);
  unint64_t v1162 = v4;
  uint64_t v12 = objc_msgSend_knownNetworks(v4, v8, v9, v10, v11);
  uint64_t v17 = objc_msgSend_mutableCopy(v12, v13, v14, v15, v16);

  objc_msgSend___sortKnownNetworks_(v1157, v18, v17, v19, v20);
  v1158 = (void *)v17;
  objc_msgSend_setKnownNetworks_(v1162, v21, v17, v22, v23);
  v1152 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v24, v25, v26, v27);
  uint64_t v1138 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v28, v29, v30, v31);
  v1141 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v32, v33, v34, v35);
  v1140 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v36, v37, v38, v39);
  uint64_t v1137 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v40, v41, v42, v43);
  uint64_t v1136 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v44, v45, v46, v47);
  v1142 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v48, v49, v50, v51);
  __uint64_t v1161 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v52, v53, v54, v55);
  v1119 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E4F29008], v56, @"channel", 1, v57);
  uint64_t v62 = objc_msgSend_supportedChannels(v1157, v58, v59, v60, v61);
  v1219[0] = v1119;
  double v65 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v63, (uint64_t)v1219, 1, v64);
  uint64_t v69 = objc_msgSend_sortedArrayUsingDescriptors_(v62, v66, (uint64_t)v65, v67, v68);

  long long v1189 = 0u;
  long long v1190 = 0u;
  long long v1187 = 0u;
  long long v1188 = 0u;
  id obj = v69;
  uint64_t v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v70, (uint64_t)&v1187, (uint64_t)v1218, 16);
  if (!v75) {
    goto LABEL_28;
  }
  uint64_t v76 = *(void *)v1188;
  do
  {
    for (uint64_t i = 0; i != v75; ++i)
    {
      if (*(void *)v1188 != v76) {
        objc_enumerationMutation(obj);
      }
      uint64_t v78 = *(void **)(*((void *)&v1187 + 1) + 8 * i);
      uint64_t v79 = objc_msgSend_autoJoinParameters(v1162, v71, v72, v73, v74);
      if (objc_msgSend_trigger(v79, v80, v81, v82, v83) == 54)
      {
      }
      else
      {
        id v89 = objc_msgSend_autoJoinParameters(v1162, v84, v85, v86, v87);
        BOOL v94 = objc_msgSend_trigger(v89, v90, v91, v92, v93) == 55;

        if (!v94) {
          goto LABEL_10;
        }
      }
      if (!objc_msgSend_is5GHz(v78, v71, v88, v73, v74)) {
        continue;
      }
LABEL_10:
      uint64_t v95 = objc_msgSend___basicChannelRepresentation_(v1157, v71, (uint64_t)v78, v73, v74);
      objc_msgSend_addObject_(v1161, v96, (uint64_t)v95, v97, v98);
      if (objc_msgSend_is2GHz(v78, v99, v100, v101, v102))
      {
        uint64_t v111 = objc_msgSend_channel(v78, v103, v104, v105, v106);
        long long v112 = v1152;
        if (v111 != 1)
        {
          uint64_t v114 = objc_msgSend_channel(v78, v107, v108, v109, v110);
          long long v112 = v1152;
          if (v114 != 6)
          {
            if (objc_msgSend_channel(v78, v107, v113, v109, v110) == 11) {
              objc_msgSend_addObject_(v1152, v115, (uint64_t)v95, v116, v117);
            }
            else {
              objc_msgSend_addObject_(v1138, v115, (uint64_t)v95, v116, v117);
            }
            goto LABEL_25;
          }
        }
        goto LABEL_24;
      }
      if (objc_msgSend_is5GHz(v78, v103, v104, v105, v106))
      {
        if (objc_msgSend_isDFS(v78, v118, v119, v120, v121)) {
          objc_msgSend_addObject_(v1140, v122, (uint64_t)v95, v123, v124);
        }
        else {
          objc_msgSend_addObject_(v1141, v122, (uint64_t)v95, v123, v124);
        }
        goto LABEL_25;
      }
      int v126 = objc_msgSend_is6GHz(v78, v118, v119, v120, v121);
      long long v112 = v1142;
      if (!v126) {
        goto LABEL_24;
      }
      if (!objc_msgSend_is6GHzPSC(v78, v107, v125, v109, v110))
      {
        long long v112 = v1136;
LABEL_24:
        objc_msgSend_addObject_(v112, v107, (uint64_t)v95, v109, v110);
        goto LABEL_25;
      }
      objc_msgSend_addObject_(v1137, v107, (uint64_t)v95, v109, v110);
LABEL_25:
    }
    uint64_t v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v71, (uint64_t)&v1187, (uint64_t)v1218, 16);
  }
  while (v75);
LABEL_28:

  uint64_t v1145 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v127, v128, v129, v130);
  uint64_t v1130 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v131, v132, v133, v134);
  uint64_t v1126 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v135, v136, v137, v138);
  uint64_t v1121 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v139, v140, v141, v142);
  uint64_t v1114 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v143, v144, v145, v146);
  unint64_t v1115 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v147, v148, v149, v150);
  v1125 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v151, v152, v153, v154);
  uint64_t v1118 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v155, v156, v157, v158);
  uint64_t v1117 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v159, v160, v161, v162);
  uint64_t v1122 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v163, v164, v165, v166);
  v1111 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v167, v168, v169, v170);
  uint64_t v1112 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v171, v172, v173, v174);
  v1116 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v175, v176, v177, v178);
  uint64_t v1146 = objc_msgSend_location(v1157, v179, v180, v181, v182);
  int v183 = CWFGetOSLog();
  if (v183)
  {
    CWFGetOSLog();
    uint64_t v184 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v184 = MEMORY[0x1E4F14500];
    id v185 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v184, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v190 = objc_msgSend_maxBSSChannelAge(v1162, v186, v187, v188, v189);
    objc_msgSend_minBSSLocationAccuracy(v1162, v191, v192, v193, v194);
    uint64_t v196 = v195;
    objc_msgSend_maxBSSLocationDistance(v1162, v197, v198, v199, v200);
    uint64_t v202 = v201;
    uint64_t v207 = objc_msgSend_maxBSSChannelCount(v1162, v203, v204, v205, v206);
    uint64_t v212 = objc_msgSend_maxHiddenKnownNetworkSSIDAge(v1162, v208, v209, v210, v211);
    uint64_t v217 = objc_msgSend_description(v1146, v213, v214, v215, v216);
    v222 = objc_msgSend_redactedForWiFi(v217, v218, v219, v220, v221);
    uint64_t v227 = objc_msgSend_autoJoinParameters(v1162, v223, v224, v225, v226);
    uint64_t v232 = objc_msgSend_preferredChannels(v227, v228, v229, v230, v231);
    int v1191 = 134219522;
    uint64_t v1192 = v190;
    __int16 v1193 = 2048;
    uint64_t v1194 = v196;
    __int16 v1195 = 2048;
    v1196 = v202;
    __int16 v1197 = 2048;
    uint64_t v1198 = v207;
    __int16 v1199 = 2048;
    uint64_t v1200 = v212;
    __int16 v1201 = 2114;
    uint64_t v1202 = v222;
    __int16 v1203 = 2114;
    uint64_t v1204 = v232;
    LODWORD(v1107) = 72;
    uint64_t v1104 = &v1191;
    _os_log_send_and_compose_impl();
  }
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v233, v234, v235, v236);
  double v238 = v237;
  long long v1185 = 0u;
  long long v1186 = 0u;
  long long v1183 = 0u;
  long long v1184 = 0u;
  uint64_t v243 = objc_msgSend_autoJoinParameters(v1162, v239, v240, v241, v242);
  uint64_t v248 = objc_msgSend_preferredChannels(v243, v244, v245, v246, v247);

  uint64_t v253 = objc_msgSend_countByEnumeratingWithState_objects_count_(v248, v249, (uint64_t)&v1183, (uint64_t)v1217, 16);
  if (v253)
  {
    uint64_t v254 = *(void *)v1184;
    uint64_t v255 = MEMORY[0x1E4F14500];
    do
    {
      for (uint64_t j = 0; j != v253; ++j)
      {
        if (*(void *)v1184 != v254) {
          objc_enumerationMutation(v248);
        }
        uint64_t v257 = objc_msgSend___basicChannelRepresentation_(v1157, v250, *(void *)(*((void *)&v1183 + 1) + 8 * j), v251, v252, v1104, v1107);
        if (objc_msgSend_containsObject_(v1161, v258, (uint64_t)v257, v259, v260))
        {
          objc_msgSend_addObject_(v1145, v261, (uint64_t)v257, v262, v263);
        }
        else
        {
          uint64_t v264 = CWFGetOSLog();
          if (v264)
          {
            CWFGetOSLog();
            uint64_t v265 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            uint64_t v266 = v255;
            uint64_t v265 = v255;
          }

          if (os_log_type_enabled(v265, OS_LOG_TYPE_DEFAULT))
          {
            int v1191 = 138543362;
            uint64_t v1192 = (uint64_t)v257;
            LODWORD(v1107) = 12;
            uint64_t v1104 = &v1191;
            _os_log_send_and_compose_impl();
          }
        }
      }
      uint64_t v253 = objc_msgSend_countByEnumeratingWithState_objects_count_(v248, v250, (uint64_t)&v1183, (uint64_t)v1217, 16);
    }
    while (v253);
  }

  uint64_t v271 = objc_msgSend_array(v1145, v267, v268, v269, v270);
  objc_msgSend_addObjectsFromArray_(v1130, v272, (uint64_t)v271, v273, v274);

  long long v1181 = 0u;
  long long v1182 = 0u;
  long long v1179 = 0u;
  long long v1180 = 0u;
  id v1120 = v1158;
  uint64_t v1124 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1120, v275, (uint64_t)&v1179, (uint64_t)v1216, 16);
  if (v1124)
  {
    unint64_t v1123 = 0;
    uint64_t v1113 = *(void *)v1180;
    while (1)
    {
      for (uint64_t k = 0; k != v1124; ++k)
      {
        if (*(void *)v1180 != v1113) {
          objc_enumerationMutation(v1120);
        }
        uint64_t v1159 = *(void **)(*((void *)&v1179 + 1) + 8 * k);
        unint64_t v1133 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v276, v277, v278, v279, v1104, v1107);
        v1151 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v280, v281, v282, v283);
        uint64_t v1150 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v284, v285, v286, v287);
        uint64_t v1135 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v288, v289, v290, v291);
        uint64_t v1132 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v292, v293, v294, v295);
        uint64_t v1149 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v296, v297, v298, v299);
        v1148 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v300, v301, v302, v303);
        v1134 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v304, v305, v306, v307);
        uint64_t v1127 = objc_msgSend_BSSList(v1159, v308, v309, v310, v311);
        v1128 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E4F29008], v312, @"lastAssociatedAt", 0, v313);
        uint64_t v1215 = v1128;
        uint64_t v316 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v314, (uint64_t)&v1215, 1, v315);
        dispatch_block_t v320 = objc_msgSend_sortedArrayUsingDescriptors_(v1127, v317, (uint64_t)v316, v318, v319);

        long long v1177 = 0u;
        long long v1178 = 0u;
        long long v1175 = 0u;
        long long v1176 = 0u;
        id v1139 = v320;
        uint64_t v1144 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1139, v321, (uint64_t)&v1175, (uint64_t)v1214, 16);
        if (!v1144)
        {
          char v1131 = 0;
          goto LABEL_162;
        }
        char v1131 = 0;
        uint64_t v1143 = *(void *)v1176;
        do
        {
          for (uint64_t m = 0; m != v1144; ++m)
          {
            if (*(void *)v1176 != v1143) {
              objc_enumerationMutation(v1139);
            }
            __uint64_t v1160 = *(void **)(*((void *)&v1175 + 1) + 8 * m);
            uint64_t v1155 = objc_msgSend_location(v1160, v322, v323, v324, v325);
            if (v1155) {
              BOOL v330 = v1146 != 0;
            }
            else {
              BOOL v330 = 0;
            }
            if (!v330) {
              goto LABEL_67;
            }
            objc_msgSend_horizontalAccuracy(v1146, v326, v327, v328, v329);
            if (v331 < 0.0) {
              goto LABEL_67;
            }
            objc_msgSend_horizontalAccuracy(v1146, v326, v327, v328, v329);
            double v333 = v332;
            objc_msgSend_minBSSLocationAccuracy(v1162, v334, v335, v336, v337);
            if (v333 > v338) {
              goto LABEL_67;
            }
            objc_msgSend_horizontalAccuracy(v1155, v326, v327, v328, v329);
            if (v339 >= 0.0
              && (objc_msgSend_horizontalAccuracy(v1155, v326, v327, v328, v329),
                  double v341 = v340,
                  objc_msgSend_minBSSLocationAccuracy(v1162, v342, v343, v344, v345),
                  v341 <= v346)
              && (objc_msgSend_distanceFromLocation_(v1155, v326, (uint64_t)v1146, v328, v329),
                  double v348 = v347,
                  objc_msgSend_maxBSSLocationDistance(v1162, v349, v350, v351, v352),
                  v348 <= v353))
            {
              int v354 = 1;
              char v1131 = 1;
            }
            else
            {
LABEL_67:
              int v354 = 0;
            }
            uint64_t v355 = objc_msgSend_channel(v1160, v326, v327, v328, v329, v1105, v1108);
            uint64_t v1156 = objc_msgSend_copy(v355, v356, v357, v358, v359);

            if (v1156)
            {
              uint64_t v364 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v360, v361, v362, v363);
              objc_msgSend___basicChannelRepresentation_(v1157, v365, (uint64_t)v1156, v366, v367);
              v1154 = (char *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend_is6GHz(v1154, v368, v369, v370, v371))
              {
                v380 = objc_msgSend_colocated2GHzRNRChannel(v1160, v372, v373, v374, v375);
                if (v380)
                {
                  uint64_t v381 = objc_msgSend___basicChannelRepresentation_(v1157, v376, (uint64_t)v380, v378, v379);
                  uint64_t v382 = CWFGetOSLog();
                  if (v382)
                  {
                    CWFGetOSLog();
                    uint64_t v383 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    uint64_t v383 = MEMORY[0x1E4F14500];
                    id v384 = MEMORY[0x1E4F14500];
                  }

                  if (os_log_type_enabled(v383, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v389 = objc_msgSend_identifier(v1159, v385, v386, v387, v388);
                    objc_msgSend_redactedForWiFi(v389, v390, v391, v392, v393);
                    uint64_t v394 = (char *)objc_claimAutoreleasedReturnValue();
                    int v1191 = 138543874;
                    uint64_t v1192 = (uint64_t)v381;
                    __int16 v1193 = 2114;
                    uint64_t v1194 = v1154;
                    __int16 v1195 = 2114;
                    v1196 = v394;
                    LODWORD(v1108) = 32;
                    uint64_t v1105 = &v1191;
                    _os_log_send_and_compose_impl();
                  }
                  objc_msgSend_addObject_(v364, v395, (uint64_t)v381, v396, v397);
                }
                uint64_t v401 = objc_msgSend_colocated5GHzRNRChannel(v1160, v376, v377, v378, v379, v1105, v1108);
                if (v401)
                {
                  uint64_t v402 = objc_msgSend___basicChannelRepresentation_(v1157, v398, (uint64_t)v401, v399, v400);
                  uint64_t v403 = CWFGetOSLog();
                  if (v403)
                  {
                    CWFGetOSLog();
                    uint64_t v404 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    uint64_t v404 = MEMORY[0x1E4F14500];
                    id v405 = MEMORY[0x1E4F14500];
                  }

                  if (os_log_type_enabled(v404, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v410 = objc_msgSend_identifier(v1159, v406, v407, v408, v409);
                    objc_msgSend_redactedForWiFi(v410, v411, v412, v413, v414);
                    int v415 = (char *)objc_claimAutoreleasedReturnValue();
                    int v1191 = 138543874;
                    uint64_t v1192 = (uint64_t)v402;
                    __int16 v1193 = 2114;
                    uint64_t v1194 = v1154;
                    __int16 v1195 = 2114;
                    v1196 = v415;
                    LODWORD(v1108) = 32;
                    uint64_t v1105 = &v1191;
                    _os_log_send_and_compose_impl();
                  }
                  objc_msgSend_addObject_(v364, v416, (uint64_t)v402, v417, v418);
                }
              }
              objc_msgSend_addObject_(v364, v372, (uint64_t)v1154, v374, v375, v1105, v1108);
              if (!objc_msgSend_isCarPlay(v1159, v419, v420, v421, v422)
                || !objc_msgSend_is5GHz(v1154, v423, v424, v425, v426)
                || !objc_msgSend_includeAdjacent5GHzChannel(v1162, v427, v428, v429, v430))
              {
                goto LABEL_114;
              }
              uint64_t v435 = objc_msgSend_channel(v1154, v431, v432, v433, v434);
              if (v435 > 148)
              {
                if (v435 > 156)
                {
                  if (v435 == 157)
                  {
                    uint64_t v440 = 161;
                  }
                  else
                  {
                    if (v435 != 161) {
                      goto LABEL_114;
                    }
                    uint64_t v440 = 157;
                  }
                }
                else if (v435 == 149)
                {
                  uint64_t v440 = 153;
                }
                else
                {
                  if (v435 != 153) {
                    goto LABEL_114;
                  }
                  uint64_t v440 = 149;
                }
              }
              else if (v435 > 43)
              {
                if (v435 == 44)
                {
                  uint64_t v440 = 48;
                }
                else
                {
                  if (v435 != 48) {
                    goto LABEL_114;
                  }
                  uint64_t v440 = 44;
                }
              }
              else
              {
                if (v435 != 36)
                {
                  if (v435 == 40)
                  {
                    uint64_t v440 = 36;
                    goto LABEL_108;
                  }
LABEL_114:
                  long long v1173 = 0u;
                  long long v1174 = 0u;
                  long long v1171 = 0u;
                  long long v1172 = 0u;
                  id v461 = v364;
                  uint64_t v466 = objc_msgSend_countByEnumeratingWithState_objects_count_(v461, v462, (uint64_t)&v1171, (uint64_t)v1213, 16);
                  if (!v466) {
                    goto LABEL_157;
                  }
                  uint64_t v467 = *(void *)v1172;
                  if (v354) {
                    uint64_t v468 = v1135;
                  }
                  else {
                    uint64_t v468 = v1134;
                  }
                  if (v354) {
                    uint64_t v469 = v1133;
                  }
                  else {
                    uint64_t v469 = v1132;
                  }
                  while (2)
                  {
                    uint64_t v470 = 0;
LABEL_122:
                    if (*(void *)v1172 != v467) {
                      objc_enumerationMutation(v461);
                    }
                    uint64_t v471 = *(void **)(*((void *)&v1171 + 1) + 8 * v470);
                    if (objc_msgSend_containsObject_(v1161, v463, (uint64_t)v471, v464, v465, v1105, v1108))
                    {
                      if (objc_msgSend_is6GHz(v471, v472, v473, v474, v475))
                      {
                        if (_os_feature_enabled_impl())
                        {
                          if ((_os_feature_enabled_impl() & 1) != 0
                            || (objc_msgSend_is6GHzPSC(v471, v480, v481, v482, v483) & 1) != 0)
                          {
                            if (objc_msgSend_include6GHzChannels(v1162, v480, v481, v482, v483)) {
                              goto LABEL_130;
                            }
                            v517 = CWFGetOSLog();
                            if (v517)
                            {
                              CWFGetOSLog();
                              uint64_t v500 = (id)objc_claimAutoreleasedReturnValue();
                            }
                            else
                            {
                              uint64_t v500 = MEMORY[0x1E4F14500];
                              id v524 = MEMORY[0x1E4F14500];
                            }

                            if (os_log_type_enabled(v500, OS_LOG_TYPE_DEFAULT))
                            {
LABEL_155:
                              v526 = objc_msgSend_identifier(v1159, v520, v521, v522, v523);
                              objc_msgSend_redactedForWiFi(v526, v527, v528, v529, v530);
                              v531 = (char *)objc_claimAutoreleasedReturnValue();
                              int v1191 = 138543618;
                              uint64_t v1192 = (uint64_t)v471;
                              __int16 v1193 = 2114;
                              uint64_t v1194 = v531;
                              LODWORD(v1108) = 22;
                              uint64_t v1105 = &v1191;
                              _os_log_send_and_compose_impl();
                            }
                          }
                          else
                          {
                            uint64_t v518 = CWFGetOSLog();
                            if (v518)
                            {
                              CWFGetOSLog();
                              uint64_t v500 = (id)objc_claimAutoreleasedReturnValue();
                            }
                            else
                            {
                              uint64_t v500 = MEMORY[0x1E4F14500];
                              id v525 = MEMORY[0x1E4F14500];
                            }

                            if (os_log_type_enabled(v500, OS_LOG_TYPE_DEFAULT)) {
                              goto LABEL_155;
                            }
                          }
                        }
                        else
                        {
                          uint64_t v516 = CWFGetOSLog();
                          if (v516)
                          {
                            CWFGetOSLog();
                            uint64_t v500 = (id)objc_claimAutoreleasedReturnValue();
                          }
                          else
                          {
                            uint64_t v500 = MEMORY[0x1E4F14500];
                            id v519 = MEMORY[0x1E4F14500];
                          }

                          if (os_log_type_enabled(v500, OS_LOG_TYPE_DEFAULT)) {
                            goto LABEL_155;
                          }
                        }
                      }
                      else
                      {
LABEL_130:
                        if (!objc_msgSend_maxBSSChannelAge(v1162, v476, v477, v478, v479)
                          || (objc_msgSend_lastAssociatedAt(v1160, v484, v485, v486, v487),
                              v488 = objc_claimAutoreleasedReturnValue(),
                              objc_msgSend_timeIntervalSinceReferenceDate(v488, v489, v490, v491, v492),
                              BOOL v498 = v238 - v497 > (double)(unint64_t)objc_msgSend_maxBSSChannelAge(v1162, v493, v494, v495, v496), v488, v499 = v468, !v498))
                        {
                          v499 = v469;
                        }
                        uint64_t v500 = v499;
                        objc_msgSend_addObject_(v500, v501, (uint64_t)v471, v502, v503);
                      }
                    }
                    else
                    {
                      v504 = CWFGetOSLog();
                      if (v504)
                      {
                        CWFGetOSLog();
                        uint64_t v500 = (id)objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        uint64_t v500 = MEMORY[0x1E4F14500];
                        id v505 = MEMORY[0x1E4F14500];
                      }

                      if (os_log_type_enabled(v500, OS_LOG_TYPE_DEFAULT))
                      {
                        uint64_t v510 = objc_msgSend_identifier(v1159, v506, v507, v508, v509);
                        uint64_t v515 = objc_msgSend_redactedForWiFi(v510, v511, v512, v513, v514);
                        int v1191 = 138543618;
                        uint64_t v1192 = (uint64_t)v515;
                        __int16 v1193 = 2114;
                        uint64_t v1194 = (const char *)v471;
                        LODWORD(v1108) = 22;
                        uint64_t v1105 = &v1191;
                        _os_log_send_and_compose_impl();
                      }
                    }

                    if (v466 == ++v470)
                    {
                      uint64_t v532 = objc_msgSend_countByEnumeratingWithState_objects_count_(v461, v463, (uint64_t)&v1171, (uint64_t)v1213, 16);
                      uint64_t v466 = v532;
                      if (!v532)
                      {
LABEL_157:

                        goto LABEL_158;
                      }
                      continue;
                    }
                    goto LABEL_122;
                  }
                }
                uint64_t v440 = 40;
              }
LABEL_108:
              v441 = objc_msgSend_copy(v1154, v436, v437, v438, v439);
              objc_msgSend_setChannel_(v441, v442, v440, v443, v444);
              objc_msgSend_addObject_(v364, v445, (uint64_t)v441, v446, v447);
              uint64_t v448 = CWFGetOSLog();
              if (v448)
              {
                CWFGetOSLog();
                v449 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v449 = MEMORY[0x1E4F14500];
                id v450 = MEMORY[0x1E4F14500];
              }

              if (os_log_type_enabled(v449, OS_LOG_TYPE_DEBUG))
              {
                v455 = objc_msgSend_identifier(v1159, v451, v452, v453, v454);
                objc_msgSend_redactedForWiFi(v455, v456, v457, v458, v459);
                id v460 = (char *)objc_claimAutoreleasedReturnValue();
                int v1191 = 138543618;
                uint64_t v1192 = (uint64_t)v441;
                __int16 v1193 = 2114;
                uint64_t v1194 = v460;
                LODWORD(v1108) = 22;
                uint64_t v1105 = &v1191;
                _os_log_send_and_compose_impl();
              }
              goto LABEL_114;
            }
LABEL_158:
          }
          uint64_t v1144 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1139, v322, (uint64_t)&v1175, (uint64_t)v1214, 16);
        }
        while (v1144);
LABEL_162:

        long long v1169 = 0u;
        long long v1170 = 0u;
        long long v1167 = 0u;
        long long v1168 = 0u;
        id v533 = v1133;
        uint64_t v535 = 0;
        uint64_t v540 = objc_msgSend_countByEnumeratingWithState_objects_count_(v533, v534, (uint64_t)&v1167, (uint64_t)v1212, 16);
        if (v540)
        {
          uint64_t v541 = *(void *)v1168;
          do
          {
            for (uint64_t n = 0; n != v540; ++n)
            {
              if (*(void *)v1168 != v541) {
                objc_enumerationMutation(v533);
              }
              uint64_t v543 = *(void *)(*((void *)&v1167 + 1) + 8 * n);
              if (v535 + n >= (unint64_t)objc_msgSend_maxBSSChannelCount(v1162, v536, v537, v538, v539, v1105, v1108))objc_msgSend_addObject_(v1150, v544, v543, v545, v546); {
              else
              }
                objc_msgSend_addObject_(v1151, v544, v543, v545, v546);
            }
            v535 += v540;
            uint64_t v540 = objc_msgSend_countByEnumeratingWithState_objects_count_(v533, v536, (uint64_t)&v1167, (uint64_t)v1212, 16);
          }
          while (v540);
        }

        long long v1165 = 0u;
        long long v1166 = 0u;
        long long v1163 = 0u;
        long long v1164 = 0u;
        id v547 = v1132;
        uint64_t v553 = objc_msgSend_countByEnumeratingWithState_objects_count_(v547, v548, (uint64_t)&v1163, (uint64_t)v1211, 16);
        if (v553)
        {
          uint64_t v554 = *(void *)v1164;
          do
          {
            for (iuint64_t i = 0; ii != v553; ++ii)
            {
              if (*(void *)v1164 != v554) {
                objc_enumerationMutation(v547);
              }
              uint64_t v556 = *(void *)(*((void *)&v1163 + 1) + 8 * ii);
              if (v535 + ii >= (unint64_t)objc_msgSend_maxBSSChannelCount(v1162, v549, v550, v551, v552, v1105, v1108))objc_msgSend_addObject_(v1148, v557, v556, v558, v559); {
              else
              }
                objc_msgSend_addObject_(v1149, v557, v556, v558, v559);
            }
            v535 += v553;
            uint64_t v553 = objc_msgSend_countByEnumeratingWithState_objects_count_(v547, v549, (uint64_t)&v1163, (uint64_t)v1211, 16);
          }
          while (v553);
        }

        v564 = objc_msgSend_array(v1151, v560, v561, v562, v563);
        objc_msgSend_addObjectsFromArray_(v1125, v565, (uint64_t)v564, v566, v567);

        v572 = objc_msgSend_array(v1150, v568, v569, v570, v571);
        objc_msgSend_addObjectsFromArray_(v1118, v573, (uint64_t)v572, v574, v575);

        uint64_t v580 = objc_msgSend_array(v1135, v576, v577, v578, v579);
        objc_msgSend_addObjectsFromArray_(v1117, v581, (uint64_t)v580, v582, v583);

        v588 = objc_msgSend_array(v1149, v584, v585, v586, v587);
        objc_msgSend_addObjectsFromArray_(v1121, v589, (uint64_t)v588, v590, v591);

        v596 = objc_msgSend_array(v1148, v592, v593, v594, v595);
        objc_msgSend_addObjectsFromArray_(v1114, v597, (uint64_t)v596, v598, v599);

        uint64_t v604 = objc_msgSend_array(v1134, v600, v601, v602, v603);
        objc_msgSend_addObjectsFromArray_(v1115, v605, (uint64_t)v604, v606, v607);

        uint64_t v616 = objc_msgSend_networkName(v1159, v608, v609, v610, v611);
        if (!v616)
        {
          v617 = "no";
          goto LABEL_197;
        }
        v617 = "no";
        if ((objc_msgSend_isPasspoint(v1159, v612, v613, v614, v615) & 1) == 0)
        {
          if (objc_msgSend_hiddenState(v1159, v612, v613, v614, v615) != 2) {
            goto LABEL_276;
          }
          uint64_t v618 = objc_msgSend_wasHiddenBefore(v1159, v612, v613, v614, v615);
          if (v618)
          {
            v619 = objc_msgSend_wasHiddenBefore(v1159, v612, v613, v614, v615);
            objc_msgSend_timeIntervalSinceReferenceDate(v619, v620, v621, v622, v623);
            BOOL v625 = v624 < 604800.0;

            if (v625)
            {
LABEL_276:
              if (objc_msgSend_maxHiddenKnownNetworkSSIDAge(v1162, v612, v613, v614, v615, v1105, v1108))
              {
                uint64_t v627 = objc_msgSend_lastJoinedAt(v1159, v612, v626, v614, v615);
                objc_msgSend_timeIntervalSinceReferenceDate(v627, v628, v629, v630, v631);
                double v633 = v632;
                if (v238 - v632 <= (double)(unint64_t)objc_msgSend_maxHiddenKnownNetworkSSIDAge(v1162, v634, v635, v636, v637))
                {
                }
                else
                {
                  v642 = objc_msgSend_lastDiscoveredAt(v1159, v638, v639, v640, v641, v238 - v633);
                  objc_msgSend_timeIntervalSinceReferenceDate(v642, v643, v644, v645, v646);
                  BOOL v652 = v238 - v651 > (double)(unint64_t)objc_msgSend_maxHiddenKnownNetworkSSIDAge(v1162, v647, v648, v649, v650);

                  if (v652) {
                    goto LABEL_197;
                  }
                }
              }
              if (v1131) {
                objc_msgSend_addObject_(v1112, v612, (uint64_t)v616, v614, v615);
              }
              else {
                objc_msgSend_addObject_(v1111, v612, (uint64_t)v616, v614, v615);
              }
              v617 = "yes";
            }
          }
        }
LABEL_197:
        v653 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v612, v613, v614, v615, v1105, v1108);
        if (objc_msgSend_isPasspoint(v1159, v654, v655, v656, v657))
        {
          uint64_t v662 = objc_msgSend_domainName(v1159, v658, v659, v660, v661);

          if (v662) {
            objc_msgSend_addObject_(v653, v663, (uint64_t)&unk_1F0DC7830, v665, v666);
          }
          v667 = objc_msgSend_NAIRealmNameList(v1159, v663, v664, v665, v666);
          uint64_t v672 = objc_msgSend_count(v667, v668, v669, v670, v671);

          if (v672) {
            objc_msgSend_addObject_(v653, v673, (uint64_t)&unk_1F0DC7848, v675, v676);
          }
          v677 = objc_msgSend_roamingConsortiumList(v1159, v673, v674, v675, v676);
          uint64_t v682 = objc_msgSend_count(v677, v678, v679, v680, v681);

          if (v682) {
            objc_msgSend_addObject_(v653, v683, (uint64_t)&unk_1F0DC7860, v685, v686);
          }
          uint64_t v687 = objc_msgSend_cellularNetworkInfo(v1159, v683, v684, v685, v686);
          uint64_t v692 = objc_msgSend_count(v687, v688, v689, v690, v691);

          if (v692) {
            objc_msgSend_addObject_(v653, v693, (uint64_t)&unk_1F0DC7878, v695, v696);
          }
          v697 = objc_msgSend_allObjects(v653, v693, v694, v695, v696);
          objc_msgSend_addObjectsFromArray_(v1116, v698, (uint64_t)v697, v699, v700);
        }
        uint64_t v701 = CWFGetOSLog();
        if (v701)
        {
          CWFGetOSLog();
          BOOL v702 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v702 = MEMORY[0x1E4F14500];
          id v703 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v702, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v708 = objc_msgSend_identifier(v1159, v704, v705, v706, v707);
          uint64_t v713 = objc_msgSend_redactedForWiFi(v708, v709, v710, v711, v712);
          v714 = (void *)v713;
          int v1191 = 138545666;
          uint64_t v715 = "no";
          if (v1131) {
            uint64_t v715 = "yes";
          }
          uint64_t v1192 = v713;
          __int16 v1193 = 2082;
          uint64_t v1194 = v715;
          __int16 v1195 = 2082;
          v1196 = v617;
          __int16 v1197 = 2114;
          uint64_t v1198 = (uint64_t)v1151;
          __int16 v1199 = 2114;
          uint64_t v1200 = (uint64_t)v1150;
          __int16 v1201 = 2114;
          uint64_t v1202 = v1135;
          __int16 v1203 = 2114;
          uint64_t v1204 = v1149;
          __int16 v1205 = 2114;
          uint64_t v1206 = v1148;
          __int16 v1207 = 2114;
          uint64_t v1208 = v1134;
          __int16 v1209 = 2114;
          uint64_t v1210 = v653;
          LODWORD(v1107) = 102;
          uint64_t v1104 = &v1191;
          _os_log_send_and_compose_impl();
        }
        v1123 += v1131 & 1;
      }
      uint64_t v1124 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1120, v276, (uint64_t)&v1179, (uint64_t)v1216, 16);
      if (!v1124) {
        goto LABEL_218;
      }
    }
  }
  unint64_t v1123 = 0;
LABEL_218:

  if (objc_msgSend_count(v1125, v716, v717, v718, v719)
    || objc_msgSend_count(v1118, v720, v721, v722, v723)
    || objc_msgSend_count(v1117, v720, v724, v722, v723))
  {
    objc_msgSend_setDidUseLocationOptimizedChannelList_(v1157->_metric, v720, 1, v722, v723, v1104, v1107);
  }
  uint64_t v725 = v1157;
  objc_sync_enter(v725);
  v730 = objc_msgSend_parameters(v725[14], v726, v727, v728, v729);
  uint64_t v735 = objc_msgSend_mode(v730, v731, v732, v733, v734);

  objc_sync_exit(v725);
  LODWORD(v730) = objc_msgSend_BSSChannelsOnly(v1162, v736, v737, v738, v739);
  v744 = objc_msgSend_array(v1125, v740, v741, v742, v743);
  objc_msgSend_addObjectsFromArray_(v1130, v745, (uint64_t)v744, v746, v747);

  if (!v730)
  {
    uint64_t v802 = objc_msgSend_array(v1118, v748, v749, v750, v751);
    objc_msgSend_addObjectsFromArray_(v1130, v803, (uint64_t)v802, v804, v805);

    uint64_t v810 = objc_msgSend_array(v1117, v806, v807, v808, v809);
    objc_msgSend_addObjectsFromArray_(v1130, v811, (uint64_t)v810, v812, v813);

    int v818 = objc_msgSend_array(v1121, v814, v815, v816, v817);
    objc_msgSend_addObjectsFromArray_(v1130, v819, (uint64_t)v818, v820, v821);

    uint64_t v826 = objc_msgSend_array(v1114, v822, v823, v824, v825);
    objc_msgSend_addObjectsFromArray_(v1130, v827, (uint64_t)v826, v828, v829);

    int v764 = objc_msgSend_array(v1115, v830, v831, v832, v833);
    objc_msgSend_addObjectsFromArray_(v1130, v834, (uint64_t)v764, v835, v836);
    goto LABEL_229;
  }
  v752 = objc_msgSend_array(v1121, v748, v749, v750, v751);
  objc_msgSend_addObjectsFromArray_(v1130, v753, (uint64_t)v752, v754, v755);

  if (!objc_msgSend_count(v1130, v756, v757, v758, v759))
  {
    int v764 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v760, v761, v762, v763);
    uint64_t v769 = objc_msgSend_array(v1117, v765, v766, v767, v768);
    objc_msgSend_addObjectsFromArray_(v764, v770, (uint64_t)v769, v771, v772);

    uint64_t v777 = objc_msgSend_array(v1115, v773, v774, v775, v776);
    objc_msgSend_addObjectsFromArray_(v764, v778, (uint64_t)v777, v779, v780);

    v785 = objc_msgSend_array(v764, v781, v782, v783, v784);
    unint64_t v790 = objc_msgSend_count(v764, v786, v787, v788, v789);
    if (v790 >= objc_msgSend_maxBSSChannelCount(v1162, v791, v792, v793, v794)) {
      uint64_t v799 = objc_msgSend_maxBSSChannelCount(v1162, v795, v796, v797, v798);
    }
    else {
      uint64_t v799 = objc_msgSend_count(v764, v795, v796, v797, v798);
    }
    v837 = objc_msgSend_subarrayWithRange_(v785, v800, 0, v799, v801, v1104, v1107);
    objc_msgSend_addObjectsFromArray_(v1130, v838, (uint64_t)v837, v839, v840);

LABEL_229:
  }
  if ((objc_msgSend_BSSChannelsOnly(v1162, v760, v761, v762, v763, v1104, v1107) & 1) == 0)
  {
    uint64_t v845 = objc_msgSend_array(v1152, v841, v842, v843, v844);
    objc_msgSend_addObjectsFromArray_(v1126, v846, (uint64_t)v845, v847, v848);

    uint64_t v853 = objc_msgSend_array(v1138, v849, v850, v851, v852);
    objc_msgSend_addObjectsFromArray_(v1126, v854, (uint64_t)v853, v855, v856);

    v861 = objc_msgSend_array(v1141, v857, v858, v859, v860);
    objc_msgSend_addObjectsFromArray_(v1126, v862, (uint64_t)v861, v863, v864);

    v869 = objc_msgSend_array(v1140, v865, v866, v867, v868);
    objc_msgSend_addObjectsFromArray_(v1126, v870, (uint64_t)v869, v871, v872);

    if (objc_msgSend_include6GHzChannels(v1162, v873, v874, v875, v876))
    {
      if (_os_feature_enabled_impl())
      {
        uint64_t v881 = objc_msgSend_array(v1137, v877, v878, v879, v880);
        objc_msgSend_addObjectsFromArray_(v1126, v882, (uint64_t)v881, v883, v884);

        if (_os_feature_enabled_impl())
        {
          v885 = objc_msgSend_array(v1136, v877, v878, v879, v880);
          objc_msgSend_addObjectsFromArray_(v1126, v886, (uint64_t)v885, v887, v888);
        }
      }
    }
    uint64_t v889 = objc_msgSend_array(v1142, v877, v878, v879, v880);
    objc_msgSend_addObjectsFromArray_(v1126, v890, (uint64_t)v889, v891, v892);

    objc_msgSend_minusOrderedSet_(v1126, v893, (uint64_t)v1130, v894, v895);
  }
  id v896 = objc_msgSend_array(v1112, v841, v842, v843, v844);
  objc_msgSend_addObjectsFromArray_(v1122, v897, (uint64_t)v896, v898, v899);

  uint64_t v904 = objc_msgSend_array(v1111, v900, v901, v902, v903);
  objc_msgSend_addObjectsFromArray_(v1122, v905, (uint64_t)v904, v906, v907);

  if (v735 == 1 && v1123 >= 2)
  {
    v912 = CWFGetOSLog();
    if (v912)
    {
      CWFGetOSLog();
      uint64_t v913 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v913 = MEMORY[0x1E4F14500];
      id v914 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v913, OS_LOG_TYPE_DEFAULT))
    {
      int v1191 = 67109120;
      LODWORD(v1192) = 4;
      LODWORD(v1109) = 8;
      uint64_t v1106 = &v1191;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_setMaxScanChannelCount_(v1162, v915, 4, v916, v917);
    objc_msgSend_setDidDetectColocatedNetworkEnvironment_(v725[18], v918, 1, v919, v920);
  }
  v921 = objc_msgSend_array(v1130, v908, v909, v910, v911, v1106, v1109);
  v926 = objc_msgSend_copy(v921, v922, v923, v924, v925);
  objc_msgSend_setRecentChannelList_(v1162, v927, (uint64_t)v926, v928, v929);

  v934 = objc_msgSend_array(v1126, v930, v931, v932, v933);
  uint64_t v939 = objc_msgSend_copy(v934, v935, v936, v937, v938);
  objc_msgSend_setRemainingChannelList_(v1162, v940, (uint64_t)v939, v941, v942);

  if ((objc_msgSend_passiveScan(v1162, v943, v944, v945, v946) & 1) == 0)
  {
    if (objc_msgSend_count(v1122, v947, v948, v949, v950))
    {
      v955 = objc_msgSend_array(v1122, v951, v952, v953, v954);
      objc_msgSend_setSSIDList_(v1162, v956, (uint64_t)v955, v957, v958);
    }
    else
    {
      objc_msgSend_setSSIDList_(v1162, v951, 0, v953, v954);
    }
  }
  if (objc_msgSend_count(v1116, v947, v948, v949, v950))
  {
    v963 = objc_msgSend_allObjects(v1116, v959, v960, v961, v962);
    objc_msgSend_setANQPElementIDList_(v1162, v964, (uint64_t)v963, v965, v966);
  }
  else
  {
    objc_msgSend_setANQPElementIDList_(v1162, v959, 0, v961, v962);
  }
  v971 = objc_msgSend_optimizedChannelList(v725[18], v967, v968, v969, v970);
  BOOL v972 = v971 == 0;

  if (v972)
  {
    v977 = objc_msgSend_array(v1145, v973, v974, v975, v976);
    uint64_t v979 = v725[18];
    uint64_t v978 = v725 + 18;
    objc_msgSend_setPreferredChannelList_(v979, v980, (uint64_t)v977, v981, v982);

    uint64_t v987 = objc_msgSend_recentChannelList(v1162, v983, v984, v985, v986);
    objc_msgSend_setRecentChannelList_(*v978, v988, (uint64_t)v987, v989, v990);

    uint64_t v995 = objc_msgSend_remainingChannelList(v1162, v991, v992, v993, v994);
    objc_msgSend_setRemainingChannelList_(*v978, v996, (uint64_t)v995, v997, v998);

    v1003 = objc_msgSend_recentChannelList(v1162, v999, v1000, v1001, v1002);
    uint64_t v1008 = objc_msgSend_remainingChannelList(v1162, v1004, v1005, v1006, v1007);
    uint64_t v1012 = objc_msgSend_arrayByAddingObjectsFromArray_(v1003, v1009, (uint64_t)v1008, v1010, v1011);
    objc_msgSend_setOptimizedChannelList_(*v978, v1013, (uint64_t)v1012, v1014, v1015);
  }
  v1016 = CWFGetOSLog();
  if (v1016)
  {
    CWFGetOSLog();
    uint64_t v1017 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1017 = MEMORY[0x1E4F14500];
    id v1018 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v1017, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v1023 = objc_msgSend_SSIDList(v1162, v1019, v1020, v1021, v1022);
    uint64_t v1028 = objc_msgSend_count(v1023, v1024, v1025, v1026, v1027);
    v1033 = objc_msgSend_SSIDList(v1162, v1029, v1030, v1031, v1032);
    objc_msgSend_componentsJoinedByString_(v1033, v1034, @", ", v1035, v1036);
    v1037 = (char *)(id)objc_claimAutoreleasedReturnValue();
    int v1191 = 134218242;
    uint64_t v1192 = v1028;
    __int16 v1193 = 2114;
    uint64_t v1194 = v1037;
    _os_log_send_and_compose_impl();
  }
  id v1038 = CWFGetOSLog();
  if (v1038)
  {
    CWFGetOSLog();
    v1039 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1039 = MEMORY[0x1E4F14500];
    id v1040 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v1039, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v1045 = objc_msgSend_ANQPElementIDList(v1162, v1041, v1042, v1043, v1044);
    uint64_t v1050 = objc_msgSend_count(v1045, v1046, v1047, v1048, v1049);
    v1055 = objc_msgSend_ANQPElementIDList(v1162, v1051, v1052, v1053, v1054);
    objc_msgSend_componentsJoinedByString_(v1055, v1056, @", ", v1057, v1058);
    uint64_t v1059 = (char *)(id)objc_claimAutoreleasedReturnValue();
    int v1191 = 134218242;
    uint64_t v1192 = v1050;
    __int16 v1193 = 2114;
    uint64_t v1194 = v1059;
    _os_log_send_and_compose_impl();
  }
  uint64_t v1060 = CWFGetOSLog();
  if (v1060)
  {
    CWFGetOSLog();
    v1061 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1061 = MEMORY[0x1E4F14500];
    id v1062 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v1061, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v1067 = objc_msgSend_recentChannelList(v1162, v1063, v1064, v1065, v1066);
    uint64_t v1072 = objc_msgSend_count(v1067, v1068, v1069, v1070, v1071);
    v1077 = objc_msgSend_recentChannelList(v1162, v1073, v1074, v1075, v1076);
    objc_msgSend_componentsJoinedByString_(v1077, v1078, @", ", v1079, v1080);
    BOOL v1081 = (char *)(id)objc_claimAutoreleasedReturnValue();
    int v1191 = 134218242;
    uint64_t v1192 = v1072;
    __int16 v1193 = 2114;
    uint64_t v1194 = v1081;
    _os_log_send_and_compose_impl();
  }
  v1082 = CWFGetOSLog();
  if (v1082)
  {
    CWFGetOSLog();
    int v1083 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v1083 = MEMORY[0x1E4F14500];
    id v1084 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v1083, OS_LOG_TYPE_DEFAULT))
  {
    v1089 = objc_msgSend_remainingChannelList(v1162, v1085, v1086, v1087, v1088);
    uint64_t v1094 = objc_msgSend_count(v1089, v1090, v1091, v1092, v1093);
    uint64_t v1099 = objc_msgSend_remainingChannelList(v1162, v1095, v1096, v1097, v1098);
    objc_msgSend_componentsJoinedByString_(v1099, v1100, @", ", v1101, v1102);
    v1103 = (char *)(id)objc_claimAutoreleasedReturnValue();
    int v1191 = 134218242;
    uint64_t v1192 = v1094;
    __int16 v1193 = 2114;
    uint64_t v1194 = v1103;
    _os_log_send_and_compose_impl();
  }
}

- (id)__cachedScanResultsWithChannelList:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v12 = objc_msgSend_maxScanCacheAge(v6, v8, v9, v10, v11);
  uint64_t v14 = objc_msgSend___performScanWithChannelList_SSIDList_passive_dwellTime_maxCacheAge_cacheOnly_isPreAssociationScan_error_(self, v13, (uint64_t)v7, 0, 0, 0, v12, 1, 0, 0);

  if (objc_msgSend_count(v14, v15, v16, v17, v18))
  {
    uint64_t v23 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v19, v20, v21, v22);
    uint64_t v28 = objc_msgSend_ANQPElementIDList(v6, v24, v25, v26, v27);
    uint64_t v33 = objc_msgSend_count(v28, v29, v30, v31, v32);

    if (v33)
    {
      uint64_t v37 = objc_msgSend___passpointScanResults_(self, v34, (uint64_t)v14, v35, v36);
      if (objc_msgSend_count(v37, v38, v39, v40, v41))
      {
        uint64_t v46 = objc_msgSend_ANQPElementIDList(v6, v42, v43, v44, v45);
        uint64_t v51 = objc_msgSend_maxANQPCacheAge(v6, v47, v48, v49, v50);
        uint64_t v56 = objc_msgSend_autoJoinParameters(v6, v52, v53, v54, v55);
        BOOL v61 = objc_msgSend_mode(v56, v57, v58, v59, v60) == 3;
        uint64_t v63 = objc_msgSend___performGASQueryWithScanResults_ANQPElementIDList_maxCacheAge_cacheOnly_error_(self, v62, (uint64_t)v37, (uint64_t)v46, v51, v61, 0);

        if (v63)
        {
          objc_msgSend_addObjectsFromArray_(v23, v64, v63, v65, v66);
          uint64_t v37 = (void *)v63;
        }
        else
        {
          uint64_t v37 = 0;
        }
      }
    }
    objc_msgSend_addObjectsFromArray_(v23, v34, (uint64_t)v14, v35, v36);
    objc_msgSend_allObjects(v23, v67, v68, v69, v70);
  }
  else
  {
    uint64_t v23 = 0;
    objc_msgSend_allObjects(0, v19, v20, v21, v22);
  double v71 = };

  return v71;
}

- (BOOL)__hasJoinedAnyKnownNetworkSinceBoot
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2->_hasJoinedAnyKnownNetworkSinceBoot)
  {
    BOOL hasJoinedAnyKnownNetworkSinceBoot = 1;
  }
  else
  {
    id v4 = CWFGetBootTime();
    uint64_t knownNetworks = v2->_knownNetworks;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B4F9EDDC;
    v11[3] = &unk_1E60BC380;
    id v6 = v4;
    id v12 = v6;
    uint64_t v13 = v2;
    objc_msgSend_enumerateObjectsUsingBlock_(knownNetworks, v7, (uint64_t)v11, v8, v9);

    BOOL hasJoinedAnyKnownNetworkSinceBoot = v2->_hasJoinedAnyKnownNetworkSinceBoot;
  }
  objc_sync_exit(v2);

  return hasJoinedAnyKnownNetworkSinceBoot;
}

- (id)__performPreAssociationScanWithContext:(id)a3 network:(id)a4
{
  v704[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v642 = a4;
  uint64_t v11 = objc_msgSend_matchingKnownNetworkProfile(v642, v7, v8, v9, v10);
  uint64_t v664 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v12, v13, v14, v15);
  double v651 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v16, v17, v18, v19);
  uint64_t v22 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E4F29008], v20, @"channel", 1, v21);
  v667 = self;
  uint64_t v27 = objc_msgSend_supportedChannels(self, v23, v24, v25, v26);
  uint64_t v638 = (void *)v22;
  v704[0] = v22;
  uint64_t v30 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v28, (uint64_t)v704, 1, v29);
  uint64_t v34 = objc_msgSend_sortedArrayUsingDescriptors_(v27, v31, (uint64_t)v30, v32, v33);

  BOOL v652 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v35, v36, v37, v38);
  long long v676 = 0u;
  long long v677 = 0u;
  long long v678 = 0u;
  long long v679 = 0u;
  id obj = v34;
  uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v39, (uint64_t)&v676, (uint64_t)v703, 16);
  if (v40)
  {
    uint64_t v44 = v40;
    uint64_t v45 = *(void *)v677;
    do
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v677 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v47 = *(void **)(*((void *)&v676 + 1) + 8 * i);
        uint64_t v48 = objc_msgSend___basicChannelRepresentation_(v667, v41, (uint64_t)v47, v42, v43);
        objc_msgSend_addObject_(v664, v49, (uint64_t)v48, v50, v51);
        if (objc_msgSend_is6GHzPSC(v47, v52, v53, v54, v55)) {
          objc_msgSend_addObject_(v652, v56, (uint64_t)v48, v58, v59);
        }
        if ((objc_msgSend_is6GHz(v47, v56, v57, v58, v59) & 1) == 0) {
          objc_msgSend_addObject_(v651, v60, (uint64_t)v48, v61, v62);
        }
      }
      uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v41, (uint64_t)&v676, (uint64_t)v703, 16);
    }
    while (v44);
  }

  uint64_t v643 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v63, v64, v65, v66);
  uint64_t v646 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v67, v68, v69, v70);
  uint64_t v645 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v71, v72, v73, v74);
  uint64_t v79 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v75, v76, v77, v78);
  uint64_t v84 = objc_msgSend_location(v667, v80, v81, v82, v83);
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v85, v86, v87, v88);
  double v90 = v89;
  uint64_t v95 = objc_msgSend_channel(v642, v91, v92, v93, v94);
  uint64_t v99 = objc_msgSend___basicChannelRepresentation_(v667, v96, (uint64_t)v95, v97, v98);

  uint64_t v104 = objc_msgSend_scanChannels(v667->_metric, v100, v101, v102, v103);
  objc_msgSend_addObjectsFromArray_(v79, v105, (uint64_t)v104, v106, v107);

  long long v112 = objc_msgSend_preAssociationScanChannels(v667->_metric, v108, v109, v110, v111);
  objc_msgSend_addObjectsFromArray_(v79, v113, (uint64_t)v112, v114, v115);

  uint64_t v120 = objc_msgSend_followup6GHzScanChannels(v667->_metric, v116, v117, v118, v119);
  uint64_t v641 = v79;
  objc_msgSend_addObjectsFromArray_(v79, v121, (uint64_t)v120, v122, v123);

  __uint64_t v128 = (clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v667->_beginTimestamp) / 0xF4240;
  id v654 = v6;
  uint64_t v655 = v84;
  uint64_t v639 = (void *)v99;
  __uint64_t v635 = v128;
  if (v99
    && objc_msgSend_age(v642, v124, v125, v126, v127) > v128
    && (objc_msgSend_containsObject_(v79, v124, v99, v126, v127) & 1) == 0)
  {
    uint64_t v465 = NSString;
    uint64_t v466 = objc_msgSend_shortSSID(v642, v124, v129, v126, v127);
    uint64_t v471 = objc_msgSend_BSSID(v642, v467, v468, v469, v470);
    v476 = objc_msgSend_channel(v642, v472, v473, v474, v475);
    uint64_t v481 = objc_msgSend_channel(v476, v477, v478, v479, v480);
    uint64_t v485 = objc_msgSend_stringWithFormat_(v465, v482, @"%lu/%@/%lu", v483, v484, v466, v471, v481);

    uint64_t v489 = objc_msgSend_objectForKeyedSubscript_(v667->_followup6GHzRNRMap, v486, (uint64_t)v485, v487, v488);
    uint64_t v493 = objc_msgSend_objectForKeyedSubscript_(v667->_followup6GHzFILSDMap, v490, (uint64_t)v485, v491, v492);
    if (!(v489 | v493))
    {
      uint64_t v494 = CWFGetOSLog();
      if (v494)
      {
        CWFGetOSLog();
        uint64_t v495 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v495 = MEMORY[0x1E4F14500];
        id v607 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v495, OS_LOG_TYPE_DEFAULT))
      {
        v612 = objc_msgSend_identifier(v11, v608, v609, v610, v611);
        objc_msgSend_redactedForWiFi(v612, v613, v614, v615, v616);
        v617 = (char *)objc_claimAutoreleasedReturnValue();
        uint64_t v622 = objc_msgSend_age(v642, v618, v619, v620, v621);
        int v680 = 138544130;
        uint64_t v681 = v639;
        __int16 v682 = 2114;
        v683 = v617;
        __int16 v684 = 2048;
        uint64_t v685 = v622;
        __int16 v686 = 2048;
        __uint64_t v687 = v635;
        LODWORD(v631) = 42;
        uint64_t v626 = &v680;
        _os_log_send_and_compose_impl();
      }
      objc_msgSend_addObject_(v643, v623, (uint64_t)v639, v624, v625);
      uint64_t v84 = v655;
    }

    uint64_t v640 = 0;
    id v6 = v654;
  }
  else
  {
    uint64_t v640 = objc_msgSend_orderedSetWithObject_(MEMORY[0x1E4F1CA70], v124, (uint64_t)v642, v126, v127);
  }
  uint64_t v134 = objc_msgSend_BSSList(v11, v130, v131, v132, v133, v626, v631);
  uint64_t v636 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E4F29008], v135, @"lastAssociatedAt", 0, v136);
  BOOL v702 = v636;
  uint64_t v139 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v137, (uint64_t)&v702, 1, v138);
  uint64_t v637 = v134;
  uint64_t v143 = objc_msgSend_sortedArrayUsingDescriptors_(v134, v140, (uint64_t)v139, v141, v142);

  long long v674 = 0u;
  long long v675 = 0u;
  long long v672 = 0u;
  long long v673 = 0u;
  id v650 = v143;
  uint64_t v657 = objc_msgSend_countByEnumeratingWithState_objects_count_(v650, v144, (uint64_t)&v672, (uint64_t)v701, 16);
  if (v657)
  {
    unint64_t v665 = 0;
    char v644 = 0;
    uint64_t v656 = *(void *)v673;
    uint64_t v149 = v664;
    while (1)
    {
      uint64_t v150 = 0;
      do
      {
        if (*(void *)v673 != v656) {
          objc_enumerationMutation(v650);
        }
        dispatch_block_t v151 = *(void **)(*((void *)&v672 + 1) + 8 * v150);
        if (!objc_msgSend_maxBSSChannelAge(v6, v145, v146, v147, v148, v627)
          || (objc_msgSend_lastAssociatedAt(v151, v145, v146, v147, v148),
              uint64_t v152 = objc_claimAutoreleasedReturnValue(),
              objc_msgSend_timeIntervalSinceReferenceDate(v152, v153, v154, v155, v156),
              double v158 = v90 - v157,
              double v163 = (double)(unint64_t)objc_msgSend_maxBSSChannelAge(v6, v159, v160, v161, v162),
              v152,
              v158 <= v163))
        {
          if (objc_msgSend_maxBSSChannelCount(v6, v145, v146, v147, v148)
            && v665 >= objc_msgSend_maxBSSChannelCount(v6, v164, v165, v166, v167))
          {
            goto LABEL_93;
          }
          uint64_t v168 = objc_msgSend_location(v151, v164, v165, v166, v167);
          int v173 = 0;
          uint64_t v661 = (void *)v168;
          if (v84 && v168)
          {
            objc_msgSend_horizontalAccuracy(v84, v169, v170, v171, v172);
            if (v174 < 0.0) {
              goto LABEL_32;
            }
            objc_msgSend_horizontalAccuracy(v84, v169, v170, v171, v172);
            double v176 = v175;
            objc_msgSend_minBSSLocationAccuracy(v6, v177, v178, v179, v180);
            if (v176 > v181) {
              goto LABEL_32;
            }
            objc_msgSend_horizontalAccuracy(v661, v169, v170, v171, v172);
            if (v182 >= 0.0
              && (objc_msgSend_horizontalAccuracy(v661, v169, v170, v171, v172),
                  double v184 = v183,
                  objc_msgSend_minBSSLocationAccuracy(v6, v185, v186, v187, v188),
                  v184 <= v189)
              && (objc_msgSend_distanceFromLocation_(v661, v169, (uint64_t)v84, v171, v172),
                  double v191 = v190,
                  objc_msgSend_maxBSSLocationDistance(v6, v192, v193, v194, v195),
                  v191 <= v196))
            {
              int v173 = 1;
              char v644 = 1;
            }
            else
            {
LABEL_32:
              int v173 = 0;
            }
          }
          uint64_t v197 = objc_msgSend_channel(v151, v169, v170, v171, v172);
          uint64_t v202 = objc_msgSend_copy(v197, v198, v199, v200, v201);

          uint64_t v660 = (void *)v202;
          if (v202)
          {
            uint64_t v207 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v203, v204, v205, v206);
            objc_msgSend___basicChannelRepresentation_(v667, v208, v202, v209, v210);
            uint64_t v211 = (char *)objc_claimAutoreleasedReturnValue();
            uint64_t v220 = v211;
            if (objc_msgSend_is6GHz(v211, v212, v213, v214, v215))
            {
              uint64_t v225 = objc_msgSend_colocated2GHzRNRChannel(v151, v216, v217, v218, v219);
              uint64_t v658 = v225;
              if (v225)
              {
                uint64_t v647 = objc_msgSend___basicChannelRepresentation_(v667, v221, (uint64_t)v225, v223, v224);
                uint64_t v226 = CWFGetOSLog();
                if (v226)
                {
                  CWFGetOSLog();
                  uint64_t v227 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  uint64_t v227 = MEMORY[0x1E4F14500];
                  id v228 = MEMORY[0x1E4F14500];
                }

                if (os_log_type_enabled(v227, OS_LOG_TYPE_DEFAULT))
                {
                  BOOL v233 = objc_msgSend_identifier(v11, v229, v230, v231, v232);
                  double v238 = objc_msgSend_redactedForWiFi(v233, v234, v235, v236, v237);
                  int v680 = 138543874;
                  uint64_t v681 = v647;
                  __int16 v682 = 2114;
                  v683 = v220;
                  __int16 v684 = 2114;
                  uint64_t v685 = (uint64_t)v238;
                  LODWORD(v632) = 32;
                  uint64_t v627 = &v680;
                  _os_log_send_and_compose_impl();

                  uint64_t v211 = (char *)v220;
                }

                objc_msgSend_addObject_(v207, v239, (uint64_t)v647, v240, v241);
                uint64_t v225 = v658;
              }
              uint64_t v245 = objc_msgSend_colocated5GHzRNRChannel(v151, v221, v222, v223, v224, v627, v632);
              if (v245)
              {
                uint64_t v648 = objc_msgSend___basicChannelRepresentation_(v667, v242, (uint64_t)v245, v243, v244);
                uint64_t v246 = CWFGetOSLog();
                if (v246)
                {
                  CWFGetOSLog();
                  uint64_t v247 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  uint64_t v247 = MEMORY[0x1E4F14500];
                  id v248 = MEMORY[0x1E4F14500];
                }

                if (os_log_type_enabled(v247, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v253 = objc_msgSend_identifier(v11, v249, v250, v251, v252);
                  uint64_t v258 = objc_msgSend_redactedForWiFi(v253, v254, v255, v256, v257);
                  int v680 = 138543874;
                  uint64_t v681 = v648;
                  __int16 v682 = 2114;
                  v683 = v220;
                  __int16 v684 = 2114;
                  uint64_t v685 = (uint64_t)v258;
                  LODWORD(v632) = 32;
                  uint64_t v627 = &v680;
                  _os_log_send_and_compose_impl();

                  uint64_t v211 = (char *)v220;
                }

                objc_msgSend_addObject_(v207, v259, (uint64_t)v648, v260, v261);
                uint64_t v225 = v658;
              }
            }
            else
            {
              objc_msgSend_addObject_(v207, v216, (uint64_t)v211, v218, v219);
            }
            uint64_t v659 = v150;
            long long v670 = 0u;
            long long v671 = 0u;
            long long v668 = 0u;
            long long v669 = 0u;
            id v262 = v207;
            uint64_t v264 = objc_msgSend_countByEnumeratingWithState_objects_count_(v262, v263, (uint64_t)&v668, (uint64_t)v700, 16);
            if (v264)
            {
              uint64_t v268 = v264;
              uint64_t v269 = *(void *)v669;
              uint64_t v270 = v646;
              if (v173) {
                uint64_t v270 = v645;
              }
              uint64_t v662 = v270;
              do
              {
                uint64_t v271 = 0;
                do
                {
                  if (*(void *)v669 != v269) {
                    objc_enumerationMutation(v262);
                  }
                  uint64_t v272 = *(char **)(*((void *)&v668 + 1) + 8 * v271);
                  if (!objc_msgSend_containsObject_(v149, v265, (uint64_t)v272, v266, v267, v627))
                  {
                    uint64_t v286 = CWFGetOSLog();
                    if (v286)
                    {
                      CWFGetOSLog();
                      uint64_t v287 = (id)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      uint64_t v287 = MEMORY[0x1E4F14500];
                      id v291 = MEMORY[0x1E4F14500];
                    }

                    if (os_log_type_enabled(v287, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v296 = objc_msgSend_identifier(v11, v292, v293, v294, v295);
                      objc_msgSend_redactedForWiFi(v296, v297, v298, v299, v300);
                      v302 = uint64_t v301 = v11;
                      int v680 = 138543618;
                      uint64_t v681 = v302;
                      __int16 v682 = 2114;
                      v683 = v272;
                      LODWORD(v632) = 22;
                      uint64_t v627 = &v680;
                      _os_log_send_and_compose_impl();

                      uint64_t v11 = v301;
                      uint64_t v149 = v664;
                    }
                    goto LABEL_71;
                  }
                  if (objc_msgSend_is6GHz(v272, v273, v274, v275, v276))
                  {
                    if ((_os_feature_enabled_impl() & 1) == 0)
                    {
                      uint64_t v303 = CWFGetOSLog();
                      if (v303)
                      {
                        CWFGetOSLog();
                        uint64_t v287 = (id)objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        uint64_t v287 = MEMORY[0x1E4F14500];
                        id v305 = MEMORY[0x1E4F14500];
                      }

                      if (!os_log_type_enabled(v287, OS_LOG_TYPE_DEFAULT)) {
                        goto LABEL_71;
                      }
LABEL_83:
                      uint64_t v649 = objc_msgSend_identifier(v11, v306, v307, v308, v309);
                      uint64_t v315 = objc_msgSend_redactedForWiFi(v649, v311, v312, v313, v314);
                      int v680 = 138543618;
                      uint64_t v681 = v315;
                      __int16 v682 = 2114;
                      v683 = v272;
                      LODWORD(v632) = 22;
                      uint64_t v627 = &v680;
                      _os_log_send_and_compose_impl();

                      goto LABEL_71;
                    }
                    if ((_os_feature_enabled_impl() & 1) == 0
                      && (objc_msgSend_is6GHzPSC(v272, v277, v278, v279, v280) & 1) == 0)
                    {
                      uint64_t v304 = CWFGetOSLog();
                      if (v304)
                      {
                        CWFGetOSLog();
                        uint64_t v287 = (id)objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        uint64_t v287 = MEMORY[0x1E4F14500];
                        id v310 = MEMORY[0x1E4F14500];
                      }

                      if (!os_log_type_enabled(v287, OS_LOG_TYPE_DEFAULT)) {
                        goto LABEL_71;
                      }
                      goto LABEL_83;
                    }
                  }
                  uint64_t v281 = objc_msgSend_scanChannels(v667->_metric, v277, v278, v279, v280);
                  char v285 = objc_msgSend_containsObject_(v281, v282, (uint64_t)v272, v283, v284);

                  if (v285)
                  {
                    uint64_t v211 = (char *)v220;
                    goto LABEL_72;
                  }
                  uint64_t v287 = v662;
                  objc_msgSend_addObject_(v287, v288, (uint64_t)v272, v289, v290);
                  ++v665;
LABEL_71:
                  uint64_t v211 = (char *)v220;

LABEL_72:
                  ++v271;
                }
                while (v268 != v271);
                uint64_t v316 = objc_msgSend_countByEnumeratingWithState_objects_count_(v262, v265, (uint64_t)&v668, (uint64_t)v700, 16);
                uint64_t v268 = v316;
              }
              while (v316);
            }

            id v6 = v654;
            uint64_t v84 = v655;
            uint64_t v150 = v659;
          }
        }
        ++v150;
      }
      while (v150 != v657);
      uint64_t v317 = objc_msgSend_countByEnumeratingWithState_objects_count_(v650, v145, (uint64_t)&v672, (uint64_t)v701, 16);
      uint64_t v657 = v317;
      if (!v317) {
        goto LABEL_93;
      }
    }
  }
  char v644 = 0;
  uint64_t v149 = v664;
LABEL_93:

  uint64_t v322 = objc_msgSend_array(v645, v318, v319, v320, v321);
  objc_msgSend_addObjectsFromArray_(v643, v323, (uint64_t)v322, v324, v325);

  BOOL v330 = objc_msgSend_array(v646, v326, v327, v328, v329);
  objc_msgSend_addObjectsFromArray_(v643, v331, (uint64_t)v330, v332, v333);

  uint64_t v342 = objc_msgSend_networkName(v11, v334, v335, v336, v337);
  if (!v342) {
    goto LABEL_95;
  }
  if (objc_msgSend_isPasspoint(v11, v338, v339, v340, v341)) {
    goto LABEL_95;
  }
  if (objc_msgSend_hiddenState(v11, v343, v344, v345, v346) != 2) {
    goto LABEL_99;
  }
  uint64_t v352 = objc_msgSend_wasHiddenBefore(v11, v348, v349, v350, v351);
  if (!v352
    || (uint64_t v357 = (void *)v352,
        objc_msgSend_wasHiddenBefore(v11, v353, v354, v355, v356),
        uint64_t v358 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_timeIntervalSinceReferenceDate(v358, v359, v360, v361, v362),
        double v364 = v363,
        v358,
        v357,
        v364 >= 604800.0))
  {
LABEL_95:
    double v347 = 0;
  }
  else
  {
LABEL_99:
    double v347 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1C978], v348, (uint64_t)v342, v350, v351, v627);
  }
  uint64_t v365 = CWFGetOSLog();
  if (v365)
  {
    CWFGetOSLog();
    uint64_t v366 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v366 = MEMORY[0x1E4F14500];
    id v367 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v366, OS_LOG_TYPE_DEFAULT))
  {
    v663 = objc_msgSend_identifier(v11, v368, v369, v370, v371);
    v380 = objc_msgSend_redactedForWiFi(v663, v372, v373, v374, v375);
    uint64_t v381 = "no";
    uint64_t v666 = v342;
    if (v644) {
      uint64_t v382 = "yes";
    }
    else {
      uint64_t v382 = "no";
    }
    if (objc_msgSend_count(v347, v376, v377, v378, v379, v627)) {
      uint64_t v381 = "yes";
    }
    uint64_t v387 = v347;
    uint64_t v388 = objc_msgSend_maxBSSChannelAge(v6, v383, v384, v385, v386);
    objc_msgSend_minBSSLocationAccuracy(v6, v389, v390, v391, v392);
    uint64_t v394 = v393;
    objc_msgSend_maxBSSLocationDistance(v6, v395, v396, v397, v398);
    uint64_t v400 = v399;
    uint64_t v405 = objc_msgSend_maxBSSChannelCount(v6, v401, v402, v403, v404);
    uint64_t v410 = objc_msgSend_description(v84, v406, v407, v408, v409);
    objc_msgSend_redactedForWiFi(v410, v411, v412, v413, v414);
    v416 = int v415 = v11;
    int v680 = 138545666;
    uint64_t v681 = v380;
    __int16 v682 = 2082;
    v683 = v382;
    uint64_t v149 = v664;
    __int16 v684 = 2082;
    uint64_t v685 = (uint64_t)v381;
    __int16 v686 = 2114;
    __uint64_t v687 = (__uint64_t)v645;
    __int16 v688 = 2114;
    uint64_t v689 = v646;
    __int16 v690 = 2048;
    uint64_t v691 = v388;
    double v347 = v387;
    __int16 v692 = 2048;
    uint64_t v693 = v394;
    __int16 v694 = 2048;
    uint64_t v695 = v400;
    __int16 v696 = 2048;
    uint64_t v697 = v405;
    id v6 = v654;
    __int16 v698 = 2114;
    uint64_t v699 = v416;
    LODWORD(v632) = 102;
    uint64_t v627 = &v680;
    _os_log_send_and_compose_impl();

    uint64_t v11 = v415;
    uint64_t v342 = v666;

    uint64_t v84 = v655;
  }

  uint64_t v421 = objc_msgSend_autoJoinParameters(v6, v417, v418, v419, v420);
  uint64_t v426 = objc_msgSend_mode(v421, v422, v423, v424, v425);

  if (v426 == 2)
  {
    v431 = CWFGetOSLog();
    if (v431)
    {
      CWFGetOSLog();
      uint64_t v432 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v432 = MEMORY[0x1E4F14500];
      id v433 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v432, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v680) = 0;
      LODWORD(v632) = 2;
      uint64_t v627 = &v680;
      _os_log_send_and_compose_impl();
    }

    uint64_t v438 = objc_msgSend_array(v652, v434, v435, v436, v437);
    objc_msgSend_addObjectsFromArray_(v643, v439, (uint64_t)v438, v440, v441);
  }
  v442 = v642;
  uint64_t v443 = objc_msgSend_matchingKnownNetworkProfile(v642, v427, v428, v429, v430, v627, v632);
  uint64_t v448 = objc_msgSend_lastJoinedBySystemAt(v443, v444, v445, v446, v447);
  if (v448)
  {
  }
  else
  {
    uint64_t v453 = objc_msgSend_matchingKnownNetworkProfile(v642, v449, v450, v451, v452);
    uint64_t v458 = objc_msgSend_addReason(v453, v454, v455, v456, v457);

    v442 = v642;
    if (v458 != 8) {
      goto LABEL_130;
    }
    id v463 = CWFGetOSLog();
    if (v463)
    {
      CWFGetOSLog();
      uint64_t v464 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v464 = MEMORY[0x1E4F14500];
      id v496 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v464, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v680) = 0;
      LODWORD(v633) = 2;
      uint64_t v628 = &v680;
      _os_log_send_and_compose_impl();
    }

    uint64_t v443 = objc_msgSend_array(v651, v497, v498, v499, v500);
    objc_msgSend_addObjectsFromArray_(v643, v501, (uint64_t)v443, v502, v503);
    v442 = v642;
  }

LABEL_130:
  v504 = objc_msgSend_channel(v442, v459, v460, v461, v462, v628, v633);
  if (objc_msgSend_is6GHz(v504, v505, v506, v507, v508))
  {
    uint64_t v513 = objc_msgSend_matchingKnownNetworkProfile(v442, v509, v510, v511, v512);
    uint64_t v518 = objc_msgSend_lastJoinedAt(v513, v514, v515, v516, v517);

    v442 = v642;
    if (!v518)
    {
      uint64_t v523 = CWFGetOSLog();
      if (v523)
      {
        CWFGetOSLog();
        id v524 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v524 = MEMORY[0x1E4F14500];
        id v525 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v524, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v680) = 0;
        LODWORD(v634) = 2;
        uint64_t v629 = &v680;
        _os_log_send_and_compose_impl();
      }

      uint64_t v530 = objc_msgSend_array(v651, v526, v527, v528, v529);
      objc_msgSend_addObjectsFromArray_(v643, v531, (uint64_t)v530, v532, v533);

      uint64_t v538 = objc_msgSend_array(v652, v534, v535, v536, v537);
      objc_msgSend_addObjectsFromArray_(v643, v539, (uint64_t)v538, v540, v541);

      objc_msgSend_setDidForceAllRemainingChannels_(v6, v542, 1, v543, v544);
      v442 = v642;
    }
  }
  else
  {
  }
  uint64_t v545 = objc_msgSend_count(v643, v519, v520, v521, v522, v629, v634);
  objc_msgSend_minusSet_(v643, v546, (uint64_t)v641, v547, v548);
  if (objc_msgSend_count(v643, v549, v550, v551, v552))
  {
    uint64_t v553 = CWFGetOSLog();
    if (v553)
    {
      CWFGetOSLog();
      uint64_t v554 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v554 = MEMORY[0x1E4F14500];
      id v558 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v554, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v680) = 0;
      uint64_t v630 = &v680;
      _os_log_send_and_compose_impl();
    }

    uint64_t v563 = objc_msgSend_array(v643, v559, v560, v561, v562);
    LOBYTE(v630) = 1;
    uint64_t v557 = objc_msgSend___performScanWithChannelList_SSIDList_passive_dwellTime_maxCacheAge_cacheOnly_isPreAssociationScan_error_(v667, v564, (uint64_t)v563, (uint64_t)v347, 0, 0, v635, 0, v630, 0);

    if (v557)
    {
      uint64_t v569 = v640;
      if (!v640)
      {
        uint64_t v569 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v565, v566, v567, v568);
      }
      objc_msgSend_removeObjectsInArray_(v569, v565, (uint64_t)v557, v567, v568);
      uint64_t v640 = v569;
      objc_msgSend_addObjectsFromArray_(v569, v570, (uint64_t)v557, v571, v572);
      uint64_t v577 = objc_msgSend_autoJoinParameters(v6, v573, v574, v575, v576);
      if (objc_msgSend_trigger(v577, v578, v579, v580, v581) != 54)
      {
        uint64_t v586 = objc_msgSend_autoJoinParameters(v6, v582, v583, v584, v585);
        uint64_t v591 = objc_msgSend_trigger(v586, v587, v588, v589, v590);

        if (v591 == 55)
        {
          v442 = v642;
          uint64_t v84 = v655;
          goto LABEL_167;
        }
        uint64_t v577 = objc_msgSend___perform6GHzFollowupDiscoveryWithScanResults_SSIDList_dwellTime_context_error_(v667, v592, (uint64_t)v557, (uint64_t)v347, 0, v6, 0);
        uint64_t v84 = v655;
        if (v577)
        {
          objc_msgSend_removeObjectsInArray_(v569, v593, (uint64_t)v577, v594, v595);
          objc_msgSend_addObjectsFromArray_(v569, v596, (uint64_t)v577, v597, v598);
        }
      }
    }
    v442 = v642;
  }
  else
  {
    uint64_t v555 = CWFGetOSLog();
    uint64_t v556 = (void *)v555;
    if (v545)
    {
      if (v555)
      {
        CWFGetOSLog();
        uint64_t v557 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v557 = MEMORY[0x1E4F14500];
        id v599 = MEMORY[0x1E4F14500];
      }

      if (!os_log_type_enabled(v557, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_167;
      }
      LOWORD(v680) = 0;
    }
    else
    {
      if (v555)
      {
        CWFGetOSLog();
        uint64_t v557 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v557 = MEMORY[0x1E4F14500];
        id v600 = MEMORY[0x1E4F14500];
      }

      if (!os_log_type_enabled(v557, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_167;
      }
      LOWORD(v680) = 0;
    }
    _os_log_send_and_compose_impl();
  }
LABEL_167:

  uint64_t v605 = objc_msgSend_array(v640, v601, v602, v603, v604);

  return v605;
}

- (BOOL)__discoverKnownNetworksWithContext:(id)a3 error:(id *)a4
{
  uint64_t v502 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = CWFGetOSLog();
  if (v7)
  {
    uint64_t v8 = CWFGetOSLog();
  }
  else
  {
    uint64_t v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v494 = 134218752;
    uint64_t v495 = objc_msgSend_maxScanCycles(v6, v10, v11, v12, v13);
    __int16 v496 = 2048;
    uint64_t v497 = objc_msgSend_maxScanChannelCount(v6, v14, v15, v16, v17);
    __int16 v498 = 2048;
    uint64_t v499 = objc_msgSend_maxScanSSIDCount(v6, v18, v19, v20, v21);
    __int16 v500 = 2048;
    uint64_t v501 = objc_msgSend_minRSSI(v6, v22, v23, v24, v25);
    int v461 = 42;
    uint64_t v458 = &v494;
    _os_log_send_and_compose_impl();
  }

  uint64_t v30 = objc_msgSend_autoJoinParameters(v6, v26, v27, v28, v29);
  uint64_t v35 = objc_msgSend_trigger(v30, v31, v32, v33, v34);
  id v491 = 0;
  int v38 = objc_msgSend___allowAutoJoinWithTrigger_error_(self, v36, v35, (uint64_t)&v491, v37);
  id v39 = v491;

  if (!v38)
  {
    v476 = 0;
    uint64_t v477 = 0;
    uint64_t v91 = 0;
    uint64_t v467 = 0;
    uint64_t v456 = 0;
    uint64_t v67 = 0;
    BOOL v160 = 0;
    if (a4) {
      goto LABEL_113;
    }
    goto LABEL_115;
  }
  context = (void *)MEMORY[0x1BA995D10](v40, v41);
  uint64_t v44 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E4F29008], v42, @"channel", 1, v43);
  uint64_t v49 = objc_msgSend_supportedChannels(self, v45, v46, v47, v48);
  uint64_t v466 = (void *)v44;
  uint64_t v493 = v44;
  double v52 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v50, (uint64_t)&v493, 1, v51);
  uint64_t v56 = objc_msgSend_sortedArrayUsingDescriptors_(v49, v53, (uint64_t)v52, v54, v55);

  objc_msgSend___updateAutoJoinState_(self, v57, 2, v58, v59);
  uint64_t v467 = (void *)v56;
  if (objc_msgSend_cacheOnly(v6, v60, v61, v62, v63))
  {
    uint64_t v67 = objc_msgSend___cachedScanResultsWithChannelList_context_(self, v64, v56, (uint64_t)v6, v66);
    if (objc_msgSend_count(v67, v68, v69, v70, v71))
    {
      shouldAllowPreAssocScauint64_t n = objc_msgSend___shouldAllowPreAssocScan(self, v64, v72, v65, v66);
      id v490 = v39;
      uint64_t v74 = v67;
      char v76 = objc_msgSend___matchAndJoinScanResults_allowPreAssociationScan_context_error_(self, v75, (uint64_t)v67, shouldAllowPreAssocScan, (uint64_t)v6, &v490);
      id v77 = v490;

      if (v76)
      {
        v476 = 0;
        uint64_t v477 = 0;
        uint64_t v91 = 0;
        BOOL v160 = 1;
        uint64_t v67 = v74;
        goto LABEL_112;
      }
      id v39 = v77;
      uint64_t v67 = v74;
    }
  }
  else
  {
    uint64_t v67 = 0;
  }
  objc_msgSend___updateAutoJoinState_(self, v64, 2, v65, v66, v458, v461);
  if (objc_msgSend_cacheOnly(v6, v78, v79, v80, v81))
  {
    v476 = 0;
    uint64_t v477 = 0;
    uint64_t v91 = 0;
    BOOL v160 = 0;
    id v77 = v39;
    goto LABEL_112;
  }
  id v463 = v67;
  uint64_t v464 = a4;
  uint64_t v86 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v87 = objc_msgSend_recentChannelList(v6, v82, v83, v84, v85);
  uint64_t v91 = objc_msgSend_arrayWithArray_(v86, v88, (uint64_t)v87, v89, v90);

  uint64_t v477 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v92, v93, v94, v95);
  v476 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v96, v97, v98, v99);
  long long v486 = 0u;
  long long v487 = 0u;
  long long v488 = 0u;
  long long v489 = 0u;
  uint64_t v104 = objc_msgSend_remainingChannelList(v6, v100, v101, v102, v103);
  uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v105, (uint64_t)&v486, (uint64_t)v492, 16);
  if (v106)
  {
    uint64_t v111 = v106;
    uint64_t v112 = *(void *)v487;
    do
    {
      for (uint64_t i = 0; i != v111; ++i)
      {
        if (*(void *)v487 != v112) {
          objc_enumerationMutation(v104);
        }
        uint64_t v114 = *(void **)(*((void *)&v486 + 1) + 8 * i);
        if (objc_msgSend_is2GHz(v114, v107, v108, v109, v110)) {
          objc_msgSend_addObject_(v477, v115, (uint64_t)v114, v116, v117);
        }
        else {
          objc_msgSend_addObject_(v476, v115, (uint64_t)v114, v116, v117);
        }
      }
      uint64_t v111 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v107, (uint64_t)&v486, (uint64_t)v492, 16);
    }
    while (v111);
  }

  objc_msgSend_addObjectsFromArray_(v91, v118, (uint64_t)v477, v119, v120);
  objc_msgSend_addObjectsFromArray_(v91, v121, (uint64_t)v476, v122, v123);
  unint64_t v469 = 0;
  uint64_t v470 = v91;
  uint64_t v474 = self;
  while (2)
  {
    __uint64_t v128 = objc_msgSend_SSIDList(v6, v124, v125, v126, v127);
    uint64_t v133 = objc_msgSend_SSIDList(v6, v129, v130, v131, v132);
    unint64_t v138 = objc_msgSend_count(v133, v134, v135, v136, v137) - v469;
    unint64_t v147 = objc_msgSend_maxScanSSIDCount(v6, v139, v140, v141, v142);
    if (v138 >= v147)
    {
      uint64_t v153 = objc_msgSend_maxScanSSIDCount(v6, v143, v144, v145, v146);
    }
    else
    {
      uint64_t v468 = objc_msgSend_SSIDList(v6, v143, v144, v145, v146);
      uint64_t v153 = objc_msgSend_count(v468, v148, v149, v150, v151) - v469;
    }
    uint64_t v471 = objc_msgSend_subarrayWithRange_(v128, v152, v469, v153, v154);
    if (v138 < v147) {

    }
    unint64_t v159 = 0;
    BOOL v160 = 0;
    v469 += objc_msgSend_count(v471, v155, v156, v157, v158);
    char v165 = 1;
    while (1)
    {
      char v170 = v160 | (v159 >= objc_msgSend_count(v91, v161, v162, v163, v164));
      if ((v170 & 1) != 0 || (v165 & 1) == 0)
      {
        v165 &= v170;
        id v77 = v39;
        goto LABEL_105;
      }
      uint64_t v171 = objc_msgSend_autoJoinParameters(v6, v166, v167, v168, v169);
      uint64_t v176 = objc_msgSend_trigger(v171, v172, v173, v174, v175);
      id v485 = v39;
      int v179 = objc_msgSend___allowAutoJoinWithTrigger_error_(self, v177, v176, (uint64_t)&v485, v178);
      id v77 = v485;

      if (!v179) {
        break;
      }
      uint64_t v184 = objc_msgSend_count(v91, v180, v181, v182, v183);
      double v189 = objc_msgSend_recentChannelList(v6, v185, v186, v187, v188);
      if (v159 >= objc_msgSend_count(v189, v190, v191, v192, v193))
      {
      }
      else
      {
        uint64_t v198 = objc_msgSend_autoJoinParameters(v6, v194, v195, v196, v197);
        uint64_t v203 = objc_msgSend_mode(v198, v199, v200, v201, v202);

        if (v203 != 2)
        {
          unint64_t v208 = objc_msgSend_maxScanChannelCount(v6, v204, v205, v206, v207);
          uint64_t v213 = objc_msgSend_recentChannelList(v6, v209, v210, v211, v212);
          uint64_t v184 = objc_msgSend_count(v213, v214, v215, v216, v217);

          int v222 = 0;
          goto LABEL_46;
        }
      }
      if ((objc_msgSend_alwaysIncludeRemainingNon2GHzChannels(v6, v204, v205, v206, v207) & 1) != 0
        || self->_didDiscoverBSS)
      {
        uint64_t v223 = CWFGetOSLog();
        if (v223)
        {
          uint64_t v224 = CWFGetOSLog();
        }
        else
        {
          uint64_t v224 = MEMORY[0x1E4F14500];
          id v225 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v224, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v494) = 0;
          LODWORD(v462) = 2;
          uint64_t v459 = &v494;
          _os_log_send_and_compose_impl();
        }

        objc_msgSend_setDidIncludeRemainingNon2GHzChannels_(self->_metric, v226, 1, v227, v228);
        int v222 = 0;
      }
      else
      {
        uint64_t v288 = CWFGetOSLog();
        if (v288)
        {
          uint64_t v289 = CWFGetOSLog();
        }
        else
        {
          uint64_t v289 = MEMORY[0x1E4F14500];
          id v423 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v289, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v494) = 0;
          LODWORD(v462) = 2;
          uint64_t v459 = &v494;
          _os_log_send_and_compose_impl();
        }

        uint64_t v428 = objc_msgSend_recentChannelList(v6, v424, v425, v426, v427);
        uint64_t v433 = objc_msgSend_count(v428, v429, v430, v431, v432);
        uint64_t v184 = objc_msgSend_count(v477, v434, v435, v436, v437) + v433;

        int v222 = 1;
      }
      unint64_t v208 = -1;
LABEL_46:
      uint64_t v231 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v218, v219, v220, v221, v459, v462);
      if (v184 - v159 >= v208) {
        uint64_t v232 = v208;
      }
      else {
        uint64_t v232 = v184 - v159;
      }
      unint64_t v233 = v159;
      uint64_t v234 = objc_msgSend_subarrayWithRange_(v91, v229, v159, v232, v230);
      uint64_t v239 = objc_msgSend_count(v234, v235, v236, v237, v238);
      uint64_t v244 = objc_msgSend_maxScanCacheAge(v6, v240, v241, v242, v243);
      if (objc_msgSend_useCacheForPreviouslyScannedChannels(v6, v245, v246, v247, v248)) {
        v244 += (clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v474->_beginTimestamp) / 0xF4240;
      }
      uint64_t v253 = objc_msgSend_passiveScan(v6, v249, v250, v251, v252);
      uint64_t v258 = objc_msgSend_dwellTime(v6, v254, v255, v256, v257);
      id v484 = 0;
      uint64_t v462 = &v484;
      LOBYTE(v460) = 0;
      uint64_t v260 = objc_msgSend___performScanWithChannelList_SSIDList_passive_dwellTime_maxCacheAge_cacheOnly_isPreAssociationScan_error_(v474, v259, (uint64_t)v234, (uint64_t)v471, v253, v258, v244, 0);
      id v475 = v484;
      if (objc_msgSend_count(v260, v261, v262, v263, v264))
      {
        objc_msgSend_removeObjectsInArray_(v231, v265, (uint64_t)v260, v267, v268);
        objc_msgSend_addObjectsFromArray_(v231, v269, (uint64_t)v260, v270, v271);
      }
      unint64_t v272 = v239 + v233;
      if (v222)
      {
        uint64_t v273 = objc_msgSend_count(v470, v265, v266, v267, v268);
        uint64_t v276 = objc_msgSend_subarrayWithRange_(v470, v274, v239 + v233, v273 - v272, v275);

        uint64_t v473 = v276;
        unint64_t v281 = objc_msgSend_count(v276, v277, v278, v279, v280) + v272;
        self = v474;
        BOOL didDiscoverBSS = v474->_didDiscoverBSS;
        uint64_t v283 = CWFGetOSLog();
        uint64_t v284 = (void *)v283;
        if (didDiscoverBSS)
        {
          if (v283)
          {
            char v285 = CWFGetOSLog();
          }
          else
          {
            char v285 = MEMORY[0x1E4F14500];
            id v290 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v285, OS_LOG_TYPE_DEBUG))
          {
            LOWORD(v494) = 0;
            uint64_t v460 = &v494;
            _os_log_send_and_compose_impl();
          }

          uint64_t v295 = objc_msgSend_passiveScan(v6, v291, v292, v293, v294);
          uint64_t v300 = objc_msgSend_dwellTime(v6, v296, v297, v298, v299);
          id v483 = v475;
          uint64_t v462 = &v483;
          LOBYTE(v460) = 0;
          uint64_t v286 = objc_msgSend___performScanWithChannelList_SSIDList_passive_dwellTime_maxCacheAge_cacheOnly_isPreAssociationScan_error_(v474, v301, (uint64_t)v473, (uint64_t)v471, v295, v300, v244, 0);
          id v302 = v483;

          if (objc_msgSend_count(v286, v303, v304, v305, v306))
          {
            objc_msgSend_removeObjectsInArray_(v231, v307, (uint64_t)v286, v308, v309);
            objc_msgSend_addObjectsFromArray_(v231, v310, (uint64_t)v286, v311, v312);
          }
          objc_msgSend_setDidIncludeRemainingNon2GHzChannels_(v474->_metric, v307, 1, v308, v309);
          id v475 = v302;
        }
        else
        {
          if (v283)
          {
            uint64_t v287 = CWFGetOSLog();
          }
          else
          {
            uint64_t v287 = MEMORY[0x1E4F14500];
            id v313 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v287, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v494) = 0;
            LODWORD(v462) = 2;
            uint64_t v460 = &v494;
            _os_log_send_and_compose_impl();
          }

          uint64_t v286 = v260;
        }
        unint64_t v159 = v281;
      }
      else
      {
        uint64_t v473 = v234;
        uint64_t v286 = v260;
        unint64_t v159 = v239 + v233;
        self = v474;
      }
      if (!objc_msgSend_count(v231, v265, v266, v267, v268, v460))
      {
        BOOL v160 = 0;
        char v422 = 0;
        goto LABEL_89;
      }
      unint64_t v472 = v159;
      uint64_t v318 = objc_msgSend_autoJoinParameters(v6, v314, v315, v316, v317);
      if (objc_msgSend_trigger(v318, v319, v320, v321, v322) == 54) {
        goto LABEL_78;
      }
      uint64_t v327 = objc_msgSend_autoJoinParameters(v6, v323, v324, v325, v326);
      uint64_t v332 = objc_msgSend_trigger(v327, v328, v329, v330, v331);

      if (v332 != 55)
      {
        uint64_t v337 = objc_msgSend_array(v231, v333, v334, v335, v336);
        uint64_t v482 = 0;
        uint64_t v318 = objc_msgSend___perform6GHzFollowupDiscoveryWithScanResults_SSIDList_dwellTime_context_error_(self, v338, (uint64_t)v337, (uint64_t)v471, 0, v6, &v482);

        if (v318)
        {
          objc_msgSend_removeObjectsInArray_(v231, v339, (uint64_t)v318, v340, v341);
          objc_msgSend_addObjectsFromArray_(v231, v342, (uint64_t)v318, v343, v344);
        }
LABEL_78:
      }
      uint64_t v345 = objc_msgSend_array(v231, v333, v334, v335, v336);
      uint64_t v350 = objc_msgSend___shouldAllowPreAssocScan(self, v346, v347, v348, v349);
      id v481 = v77;
      char v352 = objc_msgSend___matchAndJoinScanResults_allowPreAssociationScan_context_error_(self, v351, (uint64_t)v345, v350, (uint64_t)v6, &v481);
      id v353 = v481;

      if (v352)
      {
        char v422 = 0;
        char v165 = 1;
        id v77 = v353;
        BOOL v160 = 1;
LABEL_100:
        unint64_t v159 = v472;
        goto LABEL_90;
      }
      objc_msgSend___updateAutoJoinState_(self, v354, 2, v355, v356);
      uint64_t v361 = objc_msgSend_autoJoinParameters(v6, v357, v358, v359, v360);
      uint64_t v366 = objc_msgSend_trigger(v361, v362, v363, v364, v365);
      id v480 = v353;
      int v369 = objc_msgSend___allowAutoJoinWithTrigger_error_(self, v367, v366, (uint64_t)&v480, v368);
      id v77 = v480;

      if (!v369)
      {
        char v165 = 0;
        BOOL v160 = 0;
        char v422 = 1;
        goto LABEL_100;
      }
      uint64_t v374 = objc_msgSend_ANQPElementIDList(v6, v370, v371, v372, v373);
      uint64_t v379 = objc_msgSend_count(v374, v375, v376, v377, v378);

      if (!v379)
      {
        BOOL v160 = 0;
        char v422 = 0;
        char v165 = 1;
        goto LABEL_100;
      }
      uint64_t v384 = objc_msgSend_array(v231, v380, v381, v382, v383);
      uint64_t v388 = objc_msgSend___passpointScanResults_(self, v385, (uint64_t)v384, v386, v387);

      if (objc_msgSend_count(v388, v389, v390, v391, v392))
      {
        uint64_t v397 = objc_msgSend_ANQPElementIDList(v6, v393, v394, v395, v396);
        uint64_t v402 = objc_msgSend_maxANQPCacheAge(v6, v398, v399, v400, v401);
        id v479 = 0;
        uint64_t v404 = objc_msgSend___performGASQueryWithScanResults_ANQPElementIDList_maxCacheAge_cacheOnly_error_(self, v403, (uint64_t)v388, (uint64_t)v397, v402, 0, &v479);
        id v405 = v479;

        if (objc_msgSend_count(v404, v406, v407, v408, v409))
        {
          uint64_t v414 = objc_msgSend___shouldAllowPreAssocScan(self, v410, v411, v412, v413);
          id v478 = v77;
          char v416 = objc_msgSend___matchAndJoinScanResults_allowPreAssociationScan_context_error_(self, v415, (uint64_t)v404, v414, (uint64_t)v6, &v478);
          id v417 = v478;

          if (v416)
          {
            int v421 = 1;
          }
          else
          {
            objc_msgSend___updateAutoJoinState_(self, v418, 2, v419, v420);
            int v421 = 0;
          }
          id v77 = v417;
        }
        else
        {
          int v421 = 0;
        }
      }
      else
      {
        int v421 = 0;
        uint64_t v404 = v388;
      }
      unint64_t v159 = v472;

      char v422 = 0;
      BOOL v160 = v421 != 0;
LABEL_89:
      char v165 = 1;
LABEL_90:

      id v39 = v77;
      uint64_t v91 = v470;
      if (v422) {
        goto LABEL_105;
      }
    }
    char v165 = 0;
    BOOL v160 = 0;
LABEL_105:

    v442 = objc_msgSend_SSIDList(v6, v438, v439, v440, v441);
    if (v469 < objc_msgSend_count(v442, v443, v444, v445, v446))
    {
      unint64_t v451 = v469 / objc_msgSend_maxScanSSIDCount(v6, v447, v448, v449, v450);
      if (!(v160 | (v451 >= objc_msgSend_maxScanCycles(v6, v452, v453, v454, v455))))
      {

        id v39 = v77;
        if ((v165 & 1) == 0)
        {
          BOOL v160 = 0;
          goto LABEL_111;
        }
        continue;
      }
    }
    break;
  }

LABEL_111:
  uint64_t v67 = v463;
  a4 = v464;
LABEL_112:
  id v39 = v77;
  uint64_t v456 = v466;
  if (a4)
  {
LABEL_113:
    if (v39) {
      *a4 = v39;
    }
  }
LABEL_115:

  return v160;
}

- (void)__updateDiscoverTimestampForJoinCandidates:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v9 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v5, v6, v7, v8);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v4;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v27, (uint64_t)v41, 16);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        __uint64_t v16 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
        uint64_t v17 = CWFGetOSLog();
        if (v17)
        {
          uint64_t v18 = CWFGetOSLog();
        }
        else
        {
          uint64_t v18 = MEMORY[0x1E4F14500];
          id v19 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          int v31 = 134219010;
          unint64_t v32 = v16 / 0x3B9ACA00;
          __int16 v33 = 2048;
          unint64_t v34 = v16 % 0x3B9ACA00 / 0x3E8;
          __int16 v35 = 2082;
          uint64_t v36 = "-[CWFAutoJoinManager __updateDiscoverTimestampForJoinCandidates:]";
          __int16 v37 = 2082;
          int v38 = "CWFAutoJoinManager.m";
          __int16 v39 = 1024;
          int v40 = 3438;
          _os_log_send_and_compose_impl();
        }

        targetQueue = self->_targetQueue;
        qos_class_t v21 = qos_class_self();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1B4FA1618;
        block[3] = &unk_1E60BB950;
        void block[4] = self;
        void block[5] = v15;
        id v26 = v9;
        dispatch_block_t v22 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v21, 0, block);
        dispatch_async(targetQueue, v22);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v27, (uint64_t)v41, 16);
    }
    while (v12);
  }
}

- (void)__updateRNRChannel:(id)a3 has6GHzOnlyBSS:(BOOL)a4 joinCandidate:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  __uint64_t v10 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v11 = CWFGetOSLog();
  if (v11)
  {
    uint64_t v12 = CWFGetOSLog();
  }
  else
  {
    uint64_t v12 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 134219010;
    unint64_t v24 = v10 / 0x3B9ACA00;
    __int16 v25 = 2048;
    unint64_t v26 = v10 % 0x3B9ACA00 / 0x3E8;
    __int16 v27 = 2082;
    long long v28 = "-[CWFAutoJoinManager __updateRNRChannel:has6GHzOnlyBSS:joinCandidate:]";
    __int16 v29 = 2082;
    long long v30 = "CWFAutoJoinManager.m";
    __int16 v31 = 1024;
    int v32 = 3462;
    _os_log_send_and_compose_impl();
  }

  targetQueue = self->_targetQueue;
  qos_class_t v15 = qos_class_self();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4FA1B24;
  block[3] = &unk_1E60BBDE8;
  void block[4] = self;
  id v20 = v9;
  BOOL v22 = a4;
  id v21 = v8;
  id v16 = v9;
  id v17 = v8;
  dispatch_block_t v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v15, 0, block);
  dispatch_async(targetQueue, v18);
}

- (BOOL)__shouldAllowPreAssocScan
{
  id v5 = objc_msgSend_autoJoinParameters(self->_metric, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_trigger(v5, v6, v7, v8, v9);

  return v10 != 32 && v10 != 47;
}

- (BOOL)__preflightMatchKnownNetworksForScanResult:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v14 = objc_msgSend_SSID(v4, v6, v7, v8, v9);
  if (v14
    && (knownNetworkSSIDMap = v5->_knownNetworkSSIDMap,
        objc_msgSend_SSID(v4, v10, v11, v12, v13),
        id v16 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKeyedSubscript_(knownNetworkSSIDMap, v17, (uint64_t)v16, v18, v19),
        id v20 = objc_claimAutoreleasedReturnValue(),
        v16,
        v14,
        v20))
  {
    BOOL v21 = 1;
  }
  else
  {
    id v20 = 0;
    if (objc_msgSend_isPasspoint(v4, v10, v11, v12, v13)) {
      BOOL v21 = objc_msgSend_count(v5->_knownNetworkPasspointDomainMap, v22, v23, v24, v25) != 0;
    }
    else {
      BOOL v21 = 0;
    }
  }

  objc_sync_exit(v5);
  return v21;
}

- (BOOL)__matchAndJoinScanResults:(id)a3 allowPreAssociationScan:(BOOL)a4 context:(id)a5 error:(id *)a6
{
  BOOL v1174 = a4;
  uint64_t v1278 = *MEMORY[0x1E4F143B8];
  id v1173 = a3;
  id v1191 = a5;
  uint64_t v11 = objc_msgSend_autoJoinParameters(v1191, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_trigger(v11, v12, v13, v14, v15);
  id v1266 = 0;
  int v19 = objc_msgSend___allowAutoJoinWithTrigger_error_(self, v17, v16, (uint64_t)&v1266, v18);
  id v1176 = v1266;

  if (!v19)
  {
    long long v1178 = 0;
    long long v1179 = 0;
    long long v1175 = 0;
    id obj = 0;
    BOOL v713 = 0;
    goto LABEL_359;
  }
  context = (void *)MEMORY[0x1BA995D10]();
  uint64_t v24 = objc_msgSend_mutableCopy(v1173, v20, v21, v22, v23);
  long long v1179 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v25, v26, v27, v28);
  long long v1175 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v29, v30, v31, v32);
  long long v1178 = objc_msgSend_associatedNetwork(self, v33, v34, v35, v36);
  if (v1178 && (objc_msgSend_containsObject_(v24, v37, (uint64_t)v1178, v38, v39) & 1) == 0) {
    objc_msgSend_addObject_(v24, v40, (uint64_t)v1178, v41, v42);
  }
  long long v1264 = 0u;
  long long v1265 = 0u;
  long long v1262 = 0u;
  long long v1263 = 0u;
  id obj = v24;
  uint64_t v1223 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v1262, (uint64_t)v1277, 16);
  if (v1223)
  {
    uint64_t v1219 = *(void *)v1263;
    uint64_t v1205 = 138543362;
    do
    {
      uint64_t v48 = 0;
      do
      {
        if (*(void *)v1263 != v1219) {
          objc_enumerationMutation(obj);
        }
        uint64_t v49 = *(void **)(*((void *)&v1262 + 1) + 8 * (void)v48);
        if ((objc_msgSend_isIBSS(v49, v44, v45, v46, v47, v1168, v1170) & 1) == 0)
        {
          uint64_t v50 = objc_msgSend_scanRecord(v49, v44, v45, v46, v47);
          uint64_t v54 = objc_msgSend_objectForKeyedSubscript_(v50, v51, @"APPLE_P2P_IE", v52, v53);
          BOOL v55 = v54 == 0;

          if (v55 && (objc_msgSend_isFILSDiscoveryFrame(v49, v44, v45, v46, v47) & 1) == 0)
          {
            if (objc_msgSend_isAssociationDisallowed(v49, v44, v45, v46, v47))
            {
              uint64_t v431 = CWFGetOSLog();
              if (v431)
              {
                CWFGetOSLog();
                uint64_t v79 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                uint64_t v79 = MEMORY[0x1E4F14500];
                id v432 = MEMORY[0x1E4F14500];
              }

              if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
              {
                int v1268 = 138543362;
                *(void *)uint64_t v1269 = v49;
                LODWORD(v1170) = 12;
                long long v1168 = &v1268;
                _os_log_send_and_compose_impl();
              }
              goto LABEL_114;
            }
            uint64_t v60 = NSString;
            uint64_t v61 = objc_msgSend_shortSSID(v49, v56, v57, v58, v59);
            uint64_t v66 = objc_msgSend_BSSID(v49, v62, v63, v64, v65);
            uint64_t v71 = objc_msgSend_channel(v49, v67, v68, v69, v70);
            long long v1170 = v66;
            objc_msgSend_channel(v71, v72, v73, v74, v75);
            long long v1168 = (int *)v61;
            uint64_t v79 = objc_msgSend_stringWithFormat_(v60, v76, @"%lu/%@/%lu", v77, v78);

            uint64_t v1225 = objc_msgSend_objectForKeyedSubscript_(self->_followup6GHzRNRMap, v80, (uint64_t)v79, v81, v82);
            uint64_t v87 = objc_msgSend_channel(v49, v83, v84, v85, v86);
            if (!objc_msgSend_is6GHz(v87, v88, v89, v90, v91)
              || (objc_msgSend_include6GHzChannels(v1191, v92, v93, v94, v95) & 1) != 0)
            {

              goto LABEL_17;
            }
            if (!v1225)
            {

              goto LABEL_34;
            }
            uint64_t v139 = objc_msgSend_channel(v1225, v96, v97, v98, v99);
            int v144 = objc_msgSend_is6GHz(v139, v140, v141, v142, v143);

            if (v144)
            {
LABEL_34:
              uint64_t v207 = CWFGetOSLog();
              if (v207)
              {
                CWFGetOSLog();
                uint64_t v156 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                uint64_t v156 = MEMORY[0x1E4F14500];
                id v208 = MEMORY[0x1E4F14500];
              }

              if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
              {
                int v1268 = 138543362;
                *(void *)uint64_t v1269 = v49;
                LODWORD(v1170) = 12;
                long long v1168 = &v1268;
                goto LABEL_60;
              }
              goto LABEL_112;
            }
LABEL_17:
            if (objc_msgSend_lockdownModeEnabled(self, v100, v101, v102, v103))
            {
              uint64_t v108 = objc_msgSend_autoJoinParameters(v1191, v104, v105, v106, v107);
              uint64_t v113 = objc_msgSend_trigger(v108, v109, v110, v111, v112);
              uint64_t v118 = objc_msgSend_autoJoinParameters(v1191, v114, v115, v116, v117);
              uint64_t v123 = objc_msgSend_targetNetworkProfile(v118, v119, v120, v121, v122);
              __uint64_t v128 = objc_msgSend_SSID(v123, v124, v125, v126, v127);
              uint64_t v133 = objc_msgSend_SSID(v49, v129, v130, v131, v132);
              if (objc_msgSend___shouldBypassLockdownModeCheckForTrigger_targetNetworkSSID_networkSSID_(self, v134, v113, (uint64_t)v128, (uint64_t)v133))
              {

                goto LABEL_24;
              }
              char isAllowedInLockdownMode = objc_msgSend_isAllowedInLockdownMode(v49, v135, v136, v137, v138);

              if (isAllowedInLockdownMode) {
                goto LABEL_24;
              }
              uint64_t v206 = CWFGetOSLog();
              if (v206)
              {
                CWFGetOSLog();
                uint64_t v156 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                uint64_t v156 = MEMORY[0x1E4F14500];
                id v297 = MEMORY[0x1E4F14500];
              }

              if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
              {
                int v1268 = 138543362;
                *(void *)uint64_t v1269 = v49;
                LODWORD(v1170) = 12;
                long long v1168 = &v1268;
LABEL_60:
                _os_log_send_and_compose_impl();
              }
LABEL_112:

LABEL_113:
LABEL_114:

              goto LABEL_115;
            }
LABEL_24:
            if (!objc_msgSend___preflightMatchKnownNetworksForScanResult_(self, v104, (uint64_t)v49, v106, v107))goto LABEL_113; {
            uint64_t v150 = objc_msgSend_knownNetworks(v1191, v146, v147, v148, v149);
            }
            uint64_t v155 = objc_msgSend_array(v150, v151, v152, v153, v154);
            sub_1B4F542B0(v49, v155);
            uint64_t v156 = (id)objc_claimAutoreleasedReturnValue();

            if (!v156) {
              goto LABEL_113;
            }
            updatedAllowCacheKnownNetworks = self->_updatedAllowCacheKnownNetworks;
            uint64_t v162 = objc_msgSend_identifier(v156, v157, v158, v159, v160);
            LOBYTE(updatedAllowCacheKnownNetworks) = objc_msgSend_containsObject_(updatedAllowCacheKnownNetworks, v163, (uint64_t)v162, v164, v165);

            if ((updatedAllowCacheKnownNetworks & 1) == 0)
            {
              knownNetworkAllowCache = self->_knownNetworkAllowCache;
              uint64_t v171 = objc_msgSend_identifier(v156, v166, v167, v168, v169);
              objc_msgSend_setObject_forKeyedSubscript_(knownNetworkAllowCache, v172, 0, (uint64_t)v171, v173);

              knownNetworkDeferCache = self->_knownNetworkDeferCache;
              int v179 = objc_msgSend_identifier(v156, v175, v176, v177, v178);
              objc_msgSend_setObject_forKeyedSubscript_(knownNetworkDeferCache, v180, 0, (uint64_t)v179, v181);

              knownNetworkAllowErrorCache = self->_knownNetworkAllowErrorCache;
              uint64_t v187 = objc_msgSend_identifier(v156, v183, v184, v185, v186);
              objc_msgSend_setObject_forKeyedSubscript_(knownNetworkAllowErrorCache, v188, 0, (uint64_t)v187, v189);
            }
            uint64_t v1227 = objc_msgSend_scanResultWithMatchingKnownNetworkProfile_(v49, v166, (uint64_t)v156, v168, v169);
            if (objc_msgSend_RSSI(v1227, v190, v191, v192, v193) <= -91)
            {
              uint64_t v198 = self;
              objc_sync_enter(v198);
              unint64_t lowRSSICandidateFoundTimestamp = self->_lowRSSICandidateFoundTimestamp;
              __uint64_t v200 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
              if (lowRSSICandidateFoundTimestamp <= v200 - 1000000 * objc_msgSend_age(v1227, v201, v202, v203, v204))
              {
                __uint64_t v209 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
                unint64_t v205 = v209 - 1000000 * objc_msgSend_age(v1227, v210, v211, v212, v213);
              }
              else
              {
                unint64_t v205 = self->_lowRSSICandidateFoundTimestamp;
              }
              self->_unint64_t lowRSSICandidateFoundTimestamp = v205;
              objc_sync_exit(v198);
            }
            uint64_t v214 = objc_msgSend_RSSI(v49, v194, v195, v196, v197);
            if (v214 < objc_msgSend_minRSSI(v1191, v215, v216, v217, v218))
            {
              uint64_t v433 = CWFGetOSLog();
              if (v433)
              {
                CWFGetOSLog();
                uint64_t v295 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                uint64_t v295 = MEMORY[0x1E4F14500];
                id v434 = MEMORY[0x1E4F14500];
              }

              if (os_log_type_enabled(v295, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v439 = objc_msgSend_minRSSI(v1191, v435, v436, v437, v438);
                int v1268 = 134218242;
                *(void *)uint64_t v1269 = v439;
                *(_WORD *)&v1269[8] = 2114;
                *(void *)&v1269[10] = v49;
                LODWORD(v1170) = 22;
                long long v1168 = &v1268;
                _os_log_send_and_compose_impl();
              }
            }
            else
            {
              uint64_t v223 = objc_msgSend_autoJoinParameters(v1191, v219, v220, v221, v222);
              if (objc_msgSend_trigger(v223, v224, v225, v226, v227) == 54)
              {

                goto LABEL_45;
              }
              uint64_t v236 = objc_msgSend_autoJoinParameters(v1191, v228, v229, v230, v231);
              BOOL v241 = objc_msgSend_trigger(v236, v237, v238, v239, v240) == 55;

              if (v241)
              {
LABEL_45:
                uint64_t v242 = objc_msgSend_SSID(v1227, v232, v233, v234, v235);
                uint64_t v251 = objc_msgSend_SSID(v1178, v243, v244, v245, v246);
                if (v242 == v251)
                {

                  goto LABEL_69;
                }
                uint64_t v256 = objc_msgSend_SSID(v1227, v247, v248, v249, v250);
                if (v256)
                {
                  __int16 v1203 = objc_msgSend_SSID(v1178, v252, v253, v254, v255);
                  if (v1203)
                  {
                    objc_msgSend_SSID(v1227, v252, v253, v254, v255);
                    id v1193 = (id)objc_claimAutoreleasedReturnValue();
                    v1196 = objc_msgSend_SSID(v1178, v257, v258, v259, v260);
                    if (objc_msgSend_isEqual_(v1193, v261, (uint64_t)v1196, v262, v263))
                    {

                      char v264 = 1;
                      goto LABEL_67;
                    }
                    int v296 = 1;
                  }
                  else
                  {
                    int v296 = 0;
                    __int16 v1203 = 0;
                  }
                }
                else
                {
                  int v296 = 0;
                }
                uint64_t v298 = objc_msgSend_associatedNetwork(self, v252, v253, v254, v255);
                char v264 = objc_msgSend___candidateSupportsSeamlessSSIDTransition_fromNetwork_context_(self, v299, (uint64_t)v1227, (uint64_t)v298, (uint64_t)v1191);

                if (v296)
                {

                  if (!v256) {
                    goto LABEL_65;
                  }
LABEL_67:
                }
                else
                {
                  if (v256) {
                    goto LABEL_67;
                  }
LABEL_65:
                }
                if (v264)
                {
LABEL_69:
                  uint64_t v300 = CWFGetOSLog();
                  if (v300)
                  {
                    CWFGetOSLog();
                    uint64_t v301 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    uint64_t v301 = MEMORY[0x1E4F14500];
                    id v302 = MEMORY[0x1E4F14500];
                  }

                  if (os_log_type_enabled(v301, OS_LOG_TYPE_DEFAULT))
                  {
                    int v1268 = 138543362;
                    *(void *)uint64_t v1269 = v1227;
                    LODWORD(v1170) = 12;
                    long long v1168 = &v1268;
                    _os_log_send_and_compose_impl();
                  }

                  uint64_t v307 = objc_msgSend_channel(v49, v303, v304, v305, v306);
                  if (objc_msgSend_is6GHz(v307, v308, v309, v310, v311))
                  {
                    char v316 = objc_msgSend_allowStandalone6GHz(v1191, v312, v313, v314, v315);

                    if ((v316 & 1) == 0)
                    {
                      uint64_t v321 = objc_msgSend_matchingKnownNetworkProfile(v1227, v317, v318, v319, v320);
                      int isStandalone6G = objc_msgSend_isStandalone6G(v321, v322, v323, v324, v325);

                      if (isStandalone6G)
                      {
                        uint64_t v331 = objc_msgSend_knownNetworks(self, v327, v328, v329, v330);
                        uint64_t v336 = objc_msgSend_allObjects(v331, v332, v333, v334, v335);
                        double v338 = objc_msgSend___knownNetworksSupportingSeamlessSSIDTransition_fromNetwork_allowSameSSID_context_(self, v337, (uint64_t)v336, (uint64_t)v1227, 0, v1191);

                        long long v1260 = 0u;
                        long long v1261 = 0u;
                        long long v1258 = 0u;
                        long long v1259 = 0u;
                        id v1207 = v338;
                        uint64_t v1215 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1207, v339, (uint64_t)&v1258, (uint64_t)v1275, 16);
                        if (v1215)
                        {
                          char v1200 = 0;
                          uint64_t v1211 = *(void *)v1259;
LABEL_79:
                          uint64_t v344 = 0;
                          while (1)
                          {
                            if (*(void *)v1259 != v1211) {
                              objc_enumerationMutation(v1207);
                            }
                            uint64_t v345 = *(void **)(*((void *)&v1258 + 1) + 8 * v344);
                            if ((objc_msgSend_isStandalone6G(v345, v340, v341, v342, v343, v1168) & 1) == 0)
                            {
                              uint64_t v346 = objc_msgSend_matchingKnownNetworkProfile(v1227, v340, v341, v342, v343);
                              uint64_t v351 = objc_msgSend_lastDiscoveredAt(v346, v347, v348, v349, v350);

                              uint64_t v356 = objc_msgSend_matchingKnownNetworkProfile(v1227, v352, v353, v354, v355);
                              uint64_t v361 = objc_msgSend_lastJoinedAt(v356, v357, v358, v359, v360);

                              uint64_t v366 = objc_msgSend_lastDiscoveredAt(v345, v362, v363, v364, v365);
                              uint64_t v375 = objc_msgSend_lastJoinedAt(v345, v367, v368, v369, v370);
                              if (v351)
                              {
                                if (v366)
                                {
                                  objc_msgSend_timeIntervalSinceReferenceDate(v351, v371, v372, v373, v374);
                                  double v377 = v376;
                                  objc_msgSend_timeIntervalSinceReferenceDate(v366, v378, v379, v380, v381);
                                  BOOL v383 = floor(v377) - floor(v382) < 0.0;
                                  objc_msgSend_timeIntervalSinceReferenceDate(v351, v384, v385, v386, v387);
                                  double v389 = v388;
                                  objc_msgSend_timeIntervalSinceReferenceDate(v366, v390, v391, v392, v393);
                                  double v395 = floor(v389) - floor(v394);
                                  if (v383) {
                                    double v395 = -v395;
                                  }
                                  if (v395 < 86400.0) {
                                    goto LABEL_93;
                                  }
                                }
                              }
                              if (!v361 || !v375) {
                                goto LABEL_94;
                              }
                              objc_msgSend_timeIntervalSinceReferenceDate(v361, v371, v372, v373, v374);
                              double v397 = v396;
                              objc_msgSend_timeIntervalSinceReferenceDate(v375, v398, v399, v400, v401);
                              BOOL v403 = floor(v397) - floor(v402) < 0.0;
                              objc_msgSend_timeIntervalSinceReferenceDate(v361, v404, v405, v406, v407);
                              double v409 = v408;
                              objc_msgSend_timeIntervalSinceReferenceDate(v375, v410, v411, v412, v413);
                              double v415 = floor(v409) - floor(v414);
                              if (v403) {
                                double v415 = -v415;
                              }
                              if (v415 < 86400.0)
                              {
LABEL_93:
                                int v416 = 0;
                                char v1200 = 1;
                              }
                              else
                              {
LABEL_94:
                                int v416 = 1;
                              }

                              if (!v416) {
                                break;
                              }
                            }
                            if (v1215 == ++v344)
                            {
                              uint64_t v1215 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1207, v340, (uint64_t)&v1258, (uint64_t)v1275, 16);
                              if (v1215) {
                                goto LABEL_79;
                              }
                              break;
                            }
                          }

                          if (v1200)
                          {
                            id v417 = CWFGetOSLog();
                            if (v417)
                            {
                              CWFGetOSLog();
                              uint64_t v418 = (id)objc_claimAutoreleasedReturnValue();
                            }
                            else
                            {
                              uint64_t v418 = MEMORY[0x1E4F14500];
                              id v421 = MEMORY[0x1E4F14500];
                            }

                            if (os_log_type_enabled(v418, OS_LOG_TYPE_DEBUG))
                            {
                              uint64_t v426 = objc_msgSend_networkName(v1227, v422, v423, v424, v425);
                              int v1268 = 138543362;
                              *(void *)uint64_t v1269 = v426;
                              LODWORD(v1170) = 12;
                              long long v1168 = &v1268;
                              _os_log_send_and_compose_impl();
                            }
                            objc_msgSend_addObject_(v1179, v427, (uint64_t)v1227, v428, v429);
                            goto LABEL_111;
                          }
                        }
                        else
                        {
                        }
                      }
                      objc_msgSend_addObject_(v1175, v327, (uint64_t)v1227, v329, v330, v1168);
LABEL_111:

                      goto LABEL_112;
                    }
                  }
                  else
                  {
                  }
                  objc_msgSend_addObject_(v1179, v317, (uint64_t)v1227, v319, v320, v1168);
                  goto LABEL_111;
                }
                uint64_t v419 = CWFGetOSLog();
                if (v419)
                {
                  CWFGetOSLog();
                  uint64_t v295 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  uint64_t v295 = MEMORY[0x1E4F14500];
                  id v420 = MEMORY[0x1E4F14500];
                }

                if (os_log_type_enabled(v295, OS_LOG_TYPE_DEFAULT))
                {
                  int v1268 = 138543362;
                  *(void *)uint64_t v1269 = v1227;
                  LODWORD(v1170) = 12;
                  long long v1168 = &v1268;
                  _os_log_send_and_compose_impl();
                }
              }
              else
              {
                uint64_t v265 = objc_msgSend_associatedNetwork(self, v232, v233, v234, v235);
                int v267 = objc_msgSend___candidateSupportsSeamlessSSIDTransition_fromNetwork_context_(self, v266, (uint64_t)v1227, (uint64_t)v265, (uint64_t)v1191);

                if (!v267) {
                  goto LABEL_69;
                }
                unint64_t v272 = objc_msgSend_matchingKnownNetworkProfile(v1178, v268, v269, v270, v271);
                uint64_t v277 = objc_msgSend_matchingKnownNetworkProfile(v1227, v273, v274, v275, v276);
                v1276 = v277;
                uint64_t v280 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v278, (uint64_t)&v1276, 1, v279);
                uint64_t v282 = objc_msgSend___morePreferredKnownNetworksWithCandidate_knownNetworks_context_(self, v281, (uint64_t)v272, (uint64_t)v280, (uint64_t)v1191);
                BOOL v283 = v282 == 0;

                if (!v283) {
                  goto LABEL_69;
                }
                uint64_t v288 = objc_msgSend_channel(v1227, v284, v285, v286, v287);
                int v293 = objc_msgSend_is2GHz(v288, v289, v290, v291, v292);

                if (!v293) {
                  goto LABEL_69;
                }
                uint64_t v294 = CWFGetOSLog();
                if (v294)
                {
                  CWFGetOSLog();
                  uint64_t v295 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  uint64_t v295 = MEMORY[0x1E4F14500];
                  id v430 = MEMORY[0x1E4F14500];
                }

                if (os_log_type_enabled(v295, OS_LOG_TYPE_DEFAULT))
                {
                  int v1268 = 138543362;
                  *(void *)uint64_t v1269 = v1227;
                  LODWORD(v1170) = 12;
                  long long v1168 = &v1268;
                  _os_log_send_and_compose_impl();
                }
              }
            }

            goto LABEL_111;
          }
        }
LABEL_115:
        uint64_t v48 = (char *)v48 + 1;
      }
      while (v48 != v1223);
      uint64_t v440 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v44, (uint64_t)&v1262, (uint64_t)v1277, 16);
      uint64_t v1223 = (void *)v440;
    }
    while (v440);
  }

  if (!objc_msgSend_count(v1175, v441, v442, v443, v444)) {
    goto LABEL_189;
  }
  long long v1180 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v445, v446, v447, v448);
  long long v1256 = 0u;
  long long v1257 = 0u;
  long long v1254 = 0u;
  long long v1255 = 0u;
  id v1177 = v1175;
  uint64_t v1182 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1177, v449, (uint64_t)&v1254, (uint64_t)v1274, 16);
  if (!v1182) {
    goto LABEL_188;
  }
  uint64_t v1181 = *(void *)v1255;
  do
  {
    for (uint64_t i = 0; i != v1182; ++i)
    {
      if (*(void *)v1255 != v1181) {
        objc_enumerationMutation(v1177);
      }
      uint64_t v1228 = *(void **)(*((void *)&v1254 + 1) + 8 * i);
      objc_msgSend_autoJoinParameters(v1191, v450, v451, v452, v453, v1168, v1170);
      id v1201 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v458 = objc_msgSend_targetNetworkProfile(v1201, v454, v455, v456, v457);
      id v463 = objc_msgSend_identifier(v458, v459, v460, v461, v462);
      uint64_t v468 = objc_msgSend_matchingKnownNetworkProfile(v1228, v464, v465, v466, v467);
      uint64_t v477 = objc_msgSend_identifier(v468, v469, v470, v471, v472);
      if (v463 == v477)
      {

LABEL_149:
LABEL_150:
        objc_msgSend_addObject_(v1180, v523, (uint64_t)v1228, v524, v525);
        continue;
      }
      v1220 = objc_msgSend_autoJoinParameters(v1191, v473, v474, v475, v476);
      uint64_t v482 = objc_msgSend_targetNetworkProfile(v1220, v478, v479, v480, v481);
      id v491 = objc_msgSend_identifier(v482, v483, v484, v485, v486);
      if (v491)
      {
        v1216 = objc_msgSend_matchingKnownNetworkProfile(v1228, v487, v488, v489, v490);
        __int16 v500 = objc_msgSend_identifier(v1216, v492, v493, v494, v495);
        if (v500)
        {
          uint64_t v1212 = objc_msgSend_autoJoinParameters(v1191, v496, v497, v498, v499);
          objc_msgSend_targetNetworkProfile(v1212, v501, v502, v503, v504);
          id v1208 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v509 = objc_msgSend_identifier(v1208, v505, v506, v507, v508);
          uint64_t v514 = objc_msgSend_matchingKnownNetworkProfile(v1228, v510, v511, v512, v513);
          id v519 = objc_msgSend_identifier(v514, v515, v516, v517, v518);
          char isEqual = objc_msgSend_isEqual_(v509, v520, (uint64_t)v519, v521, v522);

          if (isEqual) {
            goto LABEL_150;
          }
          goto LABEL_153;
        }
      }
LABEL_153:
      long long v1252 = 0u;
      long long v1253 = 0u;
      long long v1250 = 0u;
      long long v1251 = 0u;
      id v1201 = v1179;
      uint64_t v1221 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1201, v526, (uint64_t)&v1250, (uint64_t)v1273, 16);
      if (!v1221) {
        goto LABEL_180;
      }
      uint64_t v1217 = *(void *)v1251;
      do
      {
        for (uint64_t j = 0; j != v1221; ++j)
        {
          if (*(void *)v1251 != v1217) {
            objc_enumerationMutation(v1201);
          }
          uint64_t v532 = *(void **)(*((void *)&v1250 + 1) + 8 * j);
          uint64_t v533 = objc_msgSend_SSID(v1228, v527, v528, v529, v530);
          uint64_t v542 = objc_msgSend_SSID(v532, v534, v535, v536, v537);
          if (v533 != v542)
          {
            uint64_t v1225 = objc_msgSend_SSID(v1228, v538, v539, v540, v541);
            if (!v1225) {
              goto LABEL_169;
            }
            uint64_t v1223 = objc_msgSend_SSID(v532, v543, v544, v545, v546);
            if (!v1223) {
              goto LABEL_168;
            }
            __int16 v1203 = objc_msgSend_SSID(v1228, v547, v548, v549, v550);
            uint64_t v1205 = objc_msgSend_SSID(v532, v551, v552, v553, v554);
            if ((objc_msgSend_isEqual_(v1203, v555, v1205, v556, v557) & 1) == 0)
            {

LABEL_168:
LABEL_169:

              continue;
            }
          }
          id v558 = objc_msgSend_matchingKnownNetworkProfile(v1228, v538, v539, v540, v541);
          uint64_t v563 = objc_msgSend_identifier(v558, v559, v560, v561, v562);
          uint64_t v568 = objc_msgSend_matchingKnownNetworkProfile(v532, v564, v565, v566, v567);
          uint64_t v577 = objc_msgSend_identifier(v568, v569, v570, v571, v572);
          if (v563 == v577)
          {
            char v1213 = 1;
          }
          else
          {
            objc_msgSend_matchingKnownNetworkProfile(v1228, v573, v574, v575, v576);
            id v1209 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v586 = objc_msgSend_identifier(v1209, v578, v579, v580, v581);
            if (v586)
            {
              uint64_t v1198 = objc_msgSend_matchingKnownNetworkProfile(v532, v582, v583, v584, v585);
              objc_msgSend_identifier(v1198, v587, v588, v589, v590);
              id v1194 = (id)objc_claimAutoreleasedReturnValue();
              if (v1194)
              {
                long long v1189 = objc_msgSend_matchingKnownNetworkProfile(v1228, v591, v592, v593, v594);
                long long v1187 = objc_msgSend_identifier(v1189, v595, v596, v597, v598);
                uint64_t v603 = objc_msgSend_matchingKnownNetworkProfile(v532, v599, v600, v601, v602);
                uint64_t v608 = objc_msgSend_identifier(v603, v604, v605, v606, v607);
                char v1213 = objc_msgSend_isEqual_(v1187, v609, (uint64_t)v608, v610, v611);
              }
              else
              {
                char v1213 = 0;
              }
            }
            else
            {
              char v1213 = 0;
            }
          }
          if (v533 == v542)
          {
          }
          else
          {
          }
          if (v1213) {
            goto LABEL_149;
          }
        }
        uint64_t v1221 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1201, v527, (uint64_t)&v1250, (uint64_t)v1273, 16);
      }
      while (v1221);
LABEL_180:

      v612 = CWFGetOSLog();
      if (v612)
      {
        CWFGetOSLog();
        uint64_t v613 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v613 = MEMORY[0x1E4F14500];
        id v614 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v613, OS_LOG_TYPE_DEBUG))
      {
        int v1268 = 138543362;
        *(void *)uint64_t v1269 = v1228;
        LODWORD(v1170) = 12;
        long long v1168 = &v1268;
        _os_log_send_and_compose_impl();
      }
    }
    uint64_t v1182 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1177, v450, (uint64_t)&v1254, (uint64_t)v1274, 16);
  }
  while (v1182);
LABEL_188:

  objc_msgSend_addObjectsFromArray_(v1179, v615, (uint64_t)v1180, v616, v617);
LABEL_189:
  id v618 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v623 = objc_msgSend_candidates(self->_metric, v619, v620, v621, v622);

  if (v623)
  {
    uint64_t v628 = objc_msgSend_candidates(self->_metric, v624, v625, v626, v627);
    objc_msgSend_addObjectsFromArray_(v618, v629, (uint64_t)v628, v630, v631);
  }
  objc_msgSend_addObjectsFromArray_(v618, v624, (uint64_t)v1179, v626, v627, v1168);
  objc_msgSend_addObjectsFromArray_(v618, v632, (uint64_t)v1175, v633, v634);
  uint64_t v639 = objc_msgSend_allObjects(v618, v635, v636, v637, v638);
  objc_msgSend_setCandidates_(self->_metric, v640, (uint64_t)v639, v641, v642);

  if (!objc_msgSend_count(v1179, v643, v644, v645, v646))
  {
    unint64_t v665 = CWFGetOSLog();
    if (v665)
    {
      CWFGetOSLog();
      uint64_t v666 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v666 = MEMORY[0x1E4F14500];
      id v712 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v666, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v1268) = 0;
      _os_log_send_and_compose_impl();
    }

    BOOL v713 = 0;
    goto LABEL_358;
  }
  objc_msgSend___updateAutoJoinState_(self, v647, 3, v648, v649);
  objc_msgSend___sortJoinCandidates_context_(self, v650, (uint64_t)v1179, (uint64_t)v1191, v651);
  if (!v1178) {
    goto LABEL_214;
  }
  uint64_t v656 = objc_msgSend_autoJoinParameters(v1191, v652, v653, v654, v655);
  if (objc_msgSend_trigger(v656, v657, v658, v659, v660) == 54)
  {

    goto LABEL_198;
  }
  v667 = objc_msgSend_autoJoinParameters(v1191, v661, v662, v663, v664);
  BOOL v672 = objc_msgSend_trigger(v667, v668, v669, v670, v671) == 55;

  if (v672)
  {
LABEL_198:
    long long v1248 = 0u;
    long long v1249 = 0u;
    long long v1246 = 0u;
    long long v1247 = 0u;
    id v1229 = v1179;
    uint64_t v675 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1229, v673, (uint64_t)&v1246, (uint64_t)v1272, 16);
    if (v675)
    {
      uint64_t v676 = *(void *)v1247;
LABEL_200:
      uint64_t v677 = 0;
      while (1)
      {
        if (*(void *)v1247 != v676) {
          objc_enumerationMutation(v1229);
        }
        long long v678 = *(void **)(*((void *)&v1246 + 1) + 8 * v677);
        if (objc_msgSend___allowJoinCandidate_context_defer_error_(self, v674, (uint64_t)v678, (uint64_t)v1191, 0, 0))
        {
          __int16 v682 = objc_msgSend_SSID(v678, v674, v679, v680, v681);
          uint64_t v691 = objc_msgSend_SSID(v1178, v683, v684, v685, v686);
          if (v682 == v691)
          {

LABEL_220:
            int v1214 = 1;
            goto LABEL_221;
          }
          __int16 v696 = objc_msgSend_SSID(v678, v687, v688, v689, v690);
          if (v696)
          {
            uint64_t v701 = objc_msgSend_SSID(v1178, v692, v693, v694, v695);
            if (v701)
            {
              BOOL v702 = objc_msgSend_SSID(v678, v697, v698, v699, v700);
              uint64_t v707 = objc_msgSend_SSID(v1178, v703, v704, v705, v706);
              char v711 = objc_msgSend_isEqual_(v702, v708, (uint64_t)v707, v709, v710);

              if (v711) {
                goto LABEL_220;
              }
              goto LABEL_211;
            }
          }
        }
LABEL_211:
        if (v675 == ++v677)
        {
          uint64_t v675 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1229, v674, (uint64_t)&v1246, (uint64_t)v1272, 16);
          if (v675) {
            goto LABEL_200;
          }
          break;
        }
      }
    }
    int v1214 = 0;
LABEL_221:
  }
  else
  {
LABEL_214:
    int v1214 = 0;
  }
  long long v1244 = 0u;
  long long v1245 = 0u;
  long long v1242 = 0u;
  long long v1243 = 0u;
  id v1195 = v1179;
  id v1210 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v1195, v714, (uint64_t)&v1242, (uint64_t)v1271, 16);
  if (!v1210)
  {
LABEL_341:
    int v1155 = 0;
LABEL_355:

    id v1224 = v1176;
LABEL_356:
    objc_msgSend___updateDiscoverTimestampForJoinCandidates_(self, v1161, (uint64_t)v1195, v1162, v1163, v1169, v1170);
    objc_msgSend___updateDiscoverTimestampForJoinCandidates_(self, v1164, (uint64_t)v1175, v1165, v1166);
    goto LABEL_357;
  }
  uint64_t v719 = MEMORY[0x1E4F14500];
  uint64_t v1206 = *(void *)v1243;
  while (2)
  {
    uint64_t v720 = 0;
LABEL_225:
    if (*(void *)v1243 != v1206)
    {
      uint64_t v721 = v720;
      objc_enumerationMutation(v1195);
      uint64_t v720 = v721;
    }
    uint64_t v1218 = v720;
    v1226 = *(void **)(*((void *)&v1242 + 1) + 8 * v720);
    uint64_t v722 = objc_msgSend_autoJoinParameters(v1191, v715, v716, v717, v718, v1169, v1170);
    uint64_t v727 = objc_msgSend_trigger(v722, v723, v724, v725, v726);
    id v1241 = v1176;
    char v730 = objc_msgSend___allowAutoJoinWithTrigger_error_(self, v728, v727, (uint64_t)&v1241, v729);
    id v1224 = v1241;

    if ((v730 & 1) == 0)
    {

      goto LABEL_364;
    }
    char v1240 = 0;
    id v1239 = 0;
    int v732 = objc_msgSend___allowJoinCandidate_context_defer_error_(self, v731, (uint64_t)v1226, (uint64_t)v1191, (uint64_t)&v1240, &v1239);
    id v733 = v1239;
    if (!v732)
    {
      id v1149 = v1224;
LABEL_336:
      id v1176 = v1149;

      uint64_t v720 = v1218 + 1;
      if ((id)(v1218 + 1) == v1210)
      {
        uint64_t v1154 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1195, v715, (uint64_t)&v1242, (uint64_t)v1271, 16);
        id v1210 = (id)v1154;
        if (!v1154) {
          goto LABEL_341;
        }
        continue;
      }
      goto LABEL_225;
    }
    break;
  }
  uint64_t v1222 = v733;
  char v738 = objc_msgSend_allowDeferredCandidates(v1191, v734, v735, v736, v737);
  if (v1240) {
    char v743 = v738;
  }
  else {
    char v743 = 1;
  }
  if ((v743 & 1) == 0)
  {
    deferredKnownNetworks = self->_deferredKnownNetworks;
    objc_msgSend_matchingKnownNetworkProfile(v1226, v739, v740, v741, v742);
    id v744 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(deferredKnownNetworks, v1151, (uint64_t)v744, v1152, v1153);
    goto LABEL_334;
  }
  if (!v1214) {
    goto LABEL_240;
  }
  objc_msgSend_SSID(v1226, v739, v740, v741, v742);
  id v744 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_SSID(v1178, v745, v746, v747, v748);
  id v753 = (id)objc_claimAutoreleasedReturnValue();
  if (v744 == v753)
  {

    goto LABEL_240;
  }
  uint64_t v758 = objc_msgSend_SSID(v1226, v749, v750, v751, v752);
  if (!v758)
  {

    goto LABEL_334;
  }
  uint64_t v763 = objc_msgSend_SSID(v1178, v754, v755, v756, v757);
  if (!v763)
  {

    goto LABEL_334;
  }
  int v764 = objc_msgSend_SSID(v1226, v759, v760, v761, v762);
  uint64_t v769 = objc_msgSend_SSID(v1178, v765, v766, v767, v768);
  int v773 = objc_msgSend_isEqual_(v764, v770, (uint64_t)v769, v771, v772);

  if (!v773)
  {
LABEL_335:
    id v733 = v1222;
    id v1149 = v1224;
    goto LABEL_336;
  }
LABEL_240:
  uint64_t v774 = objc_msgSend_allKeys(self->_deferredColocatedJoinCandidateMap, v739, v740, v741, v742);
  uint64_t v779 = objc_msgSend_matchingKnownNetworkProfile(v1226, v775, v776, v777, v778);
  uint64_t v784 = objc_msgSend_identifier(v779, v780, v781, v782, v783);
  char v788 = objc_msgSend_containsObject_(v774, v785, (uint64_t)v784, v786, v787);

  if (v788)
  {
    uint64_t v793 = objc_msgSend_allValues(self->_deferredColocatedJoinCandidateMap, v789, v790, v791, v792);
    id v744 = (id)objc_msgSend_mutableCopy(v793, v794, v795, v796, v797);

    objc_msgSend___sortKnownNetworksByJoinTimestamp_(self, v798, (uint64_t)v744, v799, v800);
    uint64_t v805 = objc_msgSend_matchingKnownNetworkProfile(v1226, v801, v802, v803, v804);
    uint64_t v810 = objc_msgSend_identifier(v805, v806, v807, v808, v809);
    uint64_t v815 = objc_msgSend_firstObject(v744, v811, v812, v813, v814);
    uint64_t v824 = objc_msgSend_identifier(v815, v816, v817, v818, v819);
    if (v810 == v824)
    {
      int v1204 = 1;
    }
    else
    {
      objc_msgSend_matchingKnownNetworkProfile(v1226, v820, v821, v822, v823);
      id v1202 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v1199 = objc_msgSend_identifier(v1202, v825, v826, v827, v828);
      if (v1199)
      {
        long long v1190 = objc_msgSend_firstObject(v744, v829, v830, v831, v832);
        long long v1188 = objc_msgSend_identifier(v1190, v833, v834, v835, v836);
        if (v1188)
        {
          long long v1186 = objc_msgSend_matchingKnownNetworkProfile(v1226, v837, v838, v839, v840);
          long long v1183 = objc_msgSend_identifier(v1186, v841, v842, v843, v844);
          uint64_t v849 = objc_msgSend_firstObject(v744, v845, v846, v847, v848);
          v854 = objc_msgSend_identifier(v849, v850, v851, v852, v853);
          int v1204 = objc_msgSend_isEqual_(v1183, v855, (uint64_t)v854, v856, v857);
        }
        else
        {
          int v1204 = 0;
        }
      }
      else
      {
        int v1204 = 0;
      }
    }
    uint64_t v952 = CWFGetOSLog();
    uint64_t v953 = (void *)v952;
    if (v1204)
    {
      if (v952)
      {
        CWFGetOSLog();
        uint64_t v919 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v955 = v719;
        uint64_t v919 = v719;
      }

      if (os_log_type_enabled(v919, OS_LOG_TYPE_DEFAULT))
      {
        int v1268 = 138543362;
        *(void *)uint64_t v1269 = v1226;
        LODWORD(v1170) = 12;
        long long v1169 = &v1268;
        _os_log_send_and_compose_impl();
      }
      goto LABEL_306;
    }
    if (v952)
    {
      CWFGetOSLog();
      uint64_t v954 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v956 = v719;
      uint64_t v954 = v719;
    }

    if (os_log_type_enabled(v954, OS_LOG_TYPE_DEFAULT))
    {
      int v1268 = 138543362;
      *(void *)uint64_t v1269 = v1226;
      LODWORD(v1170) = 12;
      long long v1169 = &v1268;
      _os_log_send_and_compose_impl();
    }

LABEL_334:
    goto LABEL_335;
  }
  uint64_t v858 = objc_msgSend_matchingKnownNetworkProfile(v1226, v789, v790, v791, v792);
  uint64_t v863 = objc_msgSend_knownNetworks(self, v859, v860, v861, v862);
  uint64_t v868 = objc_msgSend_allObjects(v863, v864, v865, v866, v867);
  objc_msgSend___morePreferredKnownNetworksWithCandidate_knownNetworks_context_(self, v869, (uint64_t)v858, (uint64_t)v868, (uint64_t)v1191);
  id v744 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend_count(v744, v870, v871, v872, v873))
  {
LABEL_307:

    if (v1214) {
      goto LABEL_309;
    }
    uint64_t v1010 = objc_msgSend_matchingKnownNetworkProfile(v1178, v1006, v1007, v1008, v1009);
    uint64_t v1015 = objc_msgSend_identifier(v1010, v1011, v1012, v1013, v1014);
    uint64_t v1020 = objc_msgSend_matchingKnownNetworkProfile(v1226, v1016, v1017, v1018, v1019);
    uint64_t v1025 = objc_msgSend_identifier(v1020, v1021, v1022, v1023, v1024);
    int v1029 = objc_msgSend_isEqual_(v1015, v1026, (uint64_t)v1025, v1027, v1028);

    if (v1029)
    {
      uint64_t v1156 = CWFGetOSLog();
      if (v1156)
      {
        CWFGetOSLog();
        v1157 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v1157 = MEMORY[0x1E4F14500];
        id v1159 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v1157, OS_LOG_TYPE_DEFAULT))
      {
        int v1268 = 138543362;
        *(void *)uint64_t v1269 = v1178;
        LODWORD(v1170) = 12;
        long long v1169 = &v1268;
        _os_log_send_and_compose_impl();
      }
    }
    else
    {
LABEL_309:
      uint64_t v1030 = objc_msgSend_autoJoinParameters(v1191, v1006, v1007, v1008, v1009, v1169);
      if (objc_msgSend_trigger(v1030, v1031, v1032, v1033, v1034) == 54)
      {

        goto LABEL_313;
      }
      uint64_t v1041 = objc_msgSend_autoJoinParameters(v1191, v1035, v1036, v1037, v1038);
      BOOL v1046 = objc_msgSend_trigger(v1041, v1042, v1043, v1044, v1045) == 55;

      if (v1046) {
        goto LABEL_313;
      }
      uint64_t v1049 = objc_msgSend_associatedNetwork(self, v1039, v1047, v1048, v1040);
      uint64_t v1054 = objc_msgSend_matchingKnownNetworkProfile(v1049, v1050, v1051, v1052, v1053);
      uint64_t v1059 = objc_msgSend_matchingKnownNetworkProfile(v1226, v1055, v1056, v1057, v1058);
      BOOL v1063 = objc_msgSend_compareUserPriority_(v1054, v1060, (uint64_t)v1059, v1061, v1062) == 1;

      if (!v1063)
      {
LABEL_313:
        if (v1174)
        {
          objc_msgSend___performPreAssociationScanWithContext_network_(self, v1039, (uint64_t)v1191, (uint64_t)v1226, v1040);
          id v744 = (id)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend_count(v744, v1064, v1065, v1066, v1067)) {
            goto LABEL_334;
          }
          id v1232 = v1224;
          int v1069 = objc_msgSend___matchAndJoinScanResults_allowPreAssociationScan_context_error_(self, v1068, (uint64_t)v744, 0, (uint64_t)v1191, &v1232);
          id v1070 = v1232;

          if (!v1069)
          {
            id v1224 = v1070;
            goto LABEL_334;
          }

          id v1224 = v1070;
        }
        else
        {
          id v1231 = 0;
          char v1071 = objc_msgSend___performJoinWithNetwork_context_error_(self, v1039, (uint64_t)v1226, (uint64_t)v1191, (uint64_t)&v1231);
          id v1072 = v1231;
          id v744 = v1072;
          if ((v1071 & 1) == 0)
          {
            if (objc_msgSend_code(v1072, v1073, v1074, v1075, v1076) == -3936
              || objc_msgSend_code(v744, v1077, v1078, v1079, v1080) == -3947)
            {
              uint64_t v1085 = CWFGetOSLog();
              if (v1085)
              {
                CWFGetOSLog();
                uint64_t v1086 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                uint64_t v1087 = v719;
                uint64_t v1086 = v719;
              }

              if (os_log_type_enabled(v1086, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v1092 = objc_msgSend_code(v744, v1088, v1089, v1090, v1091);
                int v1268 = 134217984;
                *(void *)uint64_t v1269 = v1092;
                long long v1169 = &v1268;
                _os_log_send_and_compose_impl();
              }

              uint64_t v1097 = objc_msgSend_channel(v1226, v1093, v1094, v1095, v1096);
              uint64_t v1267 = v1097;
              uint64_t v1100 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1098, (uint64_t)&v1267, 1, v1099);
              uint64_t v1105 = objc_msgSend_SSIDList(v1191, v1101, v1102, v1103, v1104);
              uint64_t v1110 = objc_msgSend_dwellTime(v1191, v1106, v1107, v1108, v1109);
              LOBYTE(v1169) = 0;
              id v1112 = (id)objc_msgSend___performScanWithChannelList_SSIDList_passive_dwellTime_maxCacheAge_cacheOnly_isPreAssociationScan_error_(self, v1111, (uint64_t)v1100, (uint64_t)v1105, 0, v1110, 0, 0, v1169, 0);

              id v1230 = v744;
              LOBYTE(v1097) = objc_msgSend___performJoinWithNetwork_context_error_(self, v1113, (uint64_t)v1226, (uint64_t)v1191, (uint64_t)&v1230);
              id v1114 = v1230;

              id v744 = v1114;
              if (v1097) {
                goto LABEL_366;
              }
            }
            if (objc_msgSend_code(v744, v1081, v1082, v1083, v1084) != -3936
              && objc_msgSend_code(v744, v1115, v1116, v1117, v1118) != -3947)
            {
              v1119 = CWFGetOSLog();
              if (v1119)
              {
                CWFGetOSLog();
                id v1120 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                uint64_t v1121 = v719;
                id v1120 = v719;
              }

              if (os_log_type_enabled(v1120, OS_LOG_TYPE_DEBUG))
              {
                LOWORD(v1268) = 0;
                LODWORD(v1170) = 2;
                long long v1169 = &v1268;
                _os_log_send_and_compose_impl();
              }

              failedToJoinKnownNetworkIDs = self->_failedToJoinKnownNetworkIDs;
              uint64_t v1127 = objc_msgSend_matchingKnownNetworkProfile(v1226, v1123, v1124, v1125, v1126);
              uint64_t v1132 = objc_msgSend_identifier(v1127, v1128, v1129, v1130, v1131);
              objc_msgSend_addObject_(failedToJoinKnownNetworkIDs, v1133, (uint64_t)v1132, v1134, v1135);

              deferredColocatedJoinCandidateMap = self->_deferredColocatedJoinCandidateMap;
              v1141 = objc_msgSend_matchingKnownNetworkProfile(v1226, v1137, v1138, v1139, v1140);
              uint64_t v1146 = objc_msgSend_identifier(v1141, v1142, v1143, v1144, v1145);
              objc_msgSend_setObject_forKeyedSubscript_(deferredColocatedJoinCandidateMap, v1147, 0, (uint64_t)v1146, v1148);
            }
            goto LABEL_334;
          }
          id v1114 = v1072;
LABEL_366:
        }
LABEL_354:

        int v1155 = 1;
        id v1176 = v1224;
        goto LABEL_355;
      }
      v1158 = CWFGetOSLog();
      if (v1158)
      {
        CWFGetOSLog();
        v1157 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v1157 = MEMORY[0x1E4F14500];
        id v1160 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v1157, OS_LOG_TYPE_DEFAULT))
      {
        int v1268 = 138543362;
        *(void *)uint64_t v1269 = v1178;
        LODWORD(v1170) = 12;
        long long v1169 = &v1268;
        _os_log_send_and_compose_impl();
      }
    }

    goto LABEL_354;
  }
  uint64_t v874 = CWFGetOSLog();
  if (v874)
  {
    CWFGetOSLog();
    uint64_t v875 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v876 = v719;
    uint64_t v875 = v719;
  }

  if (os_log_type_enabled(v875, OS_LOG_TYPE_DEFAULT))
  {
    int v1268 = 138543362;
    *(void *)uint64_t v1269 = v1226;
    LODWORD(v1170) = 12;
    long long v1169 = &v1268;
    _os_log_send_and_compose_impl();
  }

  uint64_t v877 = CWFGetOSLog();
  if (v877)
  {
    CWFGetOSLog();
    uint64_t v878 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v879 = v719;
    uint64_t v878 = v719;
  }

  if (os_log_type_enabled(v878, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v884 = objc_msgSend_count(v744, v880, v881, v882, v883);
    int v1268 = 134217984;
    *(void *)uint64_t v1269 = v884;
    LODWORD(v1170) = 12;
    long long v1169 = &v1268;
    _os_log_send_and_compose_impl();
  }

  long long v1237 = 0u;
  long long v1238 = 0u;
  long long v1235 = 0u;
  long long v1236 = 0u;
  id v744 = v744;
  uint64_t v886 = objc_msgSend_countByEnumeratingWithState_objects_count_(v744, v885, (uint64_t)&v1235, (uint64_t)v1270, 16);
  if (v886)
  {
    uint64_t v887 = *(void *)v1236;
    do
    {
      for (uint64_t k = 0; k != v886; ++k)
      {
        if (*(void *)v1236 != v887) {
          objc_enumerationMutation(v744);
        }
        uint64_t v889 = *(void *)(*((void *)&v1235 + 1) + 8 * k);
        uint64_t v890 = CWFGetOSLog();
        if (v890)
        {
          CWFGetOSLog();
          uint64_t v891 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v892 = v719;
          uint64_t v891 = v719;
        }

        if (os_log_type_enabled(v891, OS_LOG_TYPE_DEFAULT))
        {
          int v1268 = 138543362;
          *(void *)uint64_t v1269 = v889;
          LODWORD(v1170) = 12;
          long long v1169 = &v1268;
          _os_log_send_and_compose_impl();
        }
      }
      uint64_t v886 = objc_msgSend_countByEnumeratingWithState_objects_count_(v744, v893, (uint64_t)&v1235, (uint64_t)v1270, 16);
    }
    while (v886);
  }

  uint64_t v898 = objc_msgSend_matchingKnownNetworkProfile(v1226, v894, v895, v896, v897);
  uint64_t v899 = self->_deferredColocatedJoinCandidateMap;
  uint64_t v904 = objc_msgSend_matchingKnownNetworkProfile(v1226, v900, v901, v902, v903);
  uint64_t v909 = objc_msgSend_identifier(v904, v905, v906, v907, v908);
  objc_msgSend_setObject_forKeyedSubscript_(v899, v910, (uint64_t)v898, (uint64_t)v909, v911);

  objc_msgSend_setDidDeferJoinToDiscoverMorePreferredNetwork_(self->_metric, v912, 1, v913, v914);
  uint64_t v919 = objc_msgSend_copy(v1191, v915, v916, v917, v918);
  objc_msgSend_setKnownNetworks_(v919, v920, (uint64_t)v744, v921, v922);
  objc_msgSend_setPassiveScan_(v919, v923, 0, v924, v925);
  objc_msgSend_setUseCacheForPreviouslyScannedChannels_(v919, v926, 1, v927, v928);
  objc_msgSend_setAllowDeferredCandidates_(v919, v929, 1, v930, v931);
  uint64_t v936 = objc_msgSend_RSSI(v1226, v932, v933, v934, v935);
  if (v936 - 3 < objc_msgSend_minRSSI(v1191, v937, v938, v939, v940)
    && objc_msgSend_RSSI(v1226, v941, v942, v943, v944) >= -87)
  {
    uint64_t v946 = objc_msgSend_RSSI(v1226, v941, v945, v943, v944);
    objc_msgSend_setMinRSSI_(v919, v947, v946 - 3, v948, v949);
    uint64_t v950 = CWFGetOSLog();
    if (v950)
    {
      CWFGetOSLog();
      v951 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v957 = v719;
      v951 = v719;
    }

    if (os_log_type_enabled(v951, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v962 = objc_msgSend_minRSSI(v1191, v958, v959, v960, v961);
      uint64_t v967 = objc_msgSend_minRSSI(v919, v963, v964, v965, v966);
      int v1268 = 67109632;
      *(_DWORD *)uint64_t v1269 = 3;
      *(_WORD *)&v1269[4] = 2048;
      *(void *)&v1269[6] = v962;
      *(_WORD *)&v1269[14] = 2048;
      *(void *)&v1269[16] = v967;
      LODWORD(v1170) = 28;
      long long v1169 = &v1268;
      _os_log_send_and_compose_impl();
    }
  }
  uint64_t v968 = objc_msgSend_objectForKeyedSubscript_(self->_cachedKnownNetworksContexts, v941, (uint64_t)v919, v943, v944, v1169);
  uint64_t v973 = v968;
  if (v968)
  {
    uint64_t v974 = v919;
    uint64_t v919 = v968;
  }
  else
  {
    uint64_t v974 = objc_msgSend_copy(v919, v969, v970, v971, v972);
    objc_msgSend___prepareKnownNetworksContext_(self, v975, (uint64_t)v919, v976, v977);
    objc_msgSend_setObject_forKeyedSubscript_(self->_cachedKnownNetworksContexts, v978, (uint64_t)v919, (uint64_t)v974, v979);
  }

  id v1234 = v1224;
  char v982 = objc_msgSend___discoverKnownNetworksWithContext_error_(self, v980, (uint64_t)v919, (uint64_t)&v1234, v981);
  id v983 = v1234;

  if ((v982 & 1) == 0)
  {
    uint64_t v988 = objc_msgSend_autoJoinParameters(v1191, v984, v985, v986, v987);
    uint64_t v993 = objc_msgSend_trigger(v988, v989, v990, v991, v992);
    id v1233 = v983;
    int v996 = objc_msgSend___allowAutoJoinWithTrigger_error_(self, v994, v993, (uint64_t)&v1233, v995);
    id v1224 = v1233;

    if (!v996) {
      goto LABEL_368;
    }
    uint64_t v997 = CWFGetOSLog();
    if (v997)
    {
      CWFGetOSLog();
      uint64_t v998 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v999 = v719;
      uint64_t v998 = v719;
    }

    if (os_log_type_enabled(v998, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v1268) = 0;
      LODWORD(v1170) = 2;
      long long v1169 = &v1268;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_setDidFallbackToJoinLessPreferredNetwork_(self->_metric, v1000, 1, v1001, v1002);
    objc_msgSend___updateAutoJoinState_(self, v1003, 3, v1004, v1005);

LABEL_306:
    goto LABEL_307;
  }
  id v1224 = v983;
LABEL_368:

  if (v982)
  {
    int v1155 = 1;
    goto LABEL_356;
  }
LABEL_364:
  int v1155 = 0;
LABEL_357:
  BOOL v713 = v1155 != 0;
  id v1176 = v1224;
LABEL_358:
LABEL_359:
  if (a6 && v1176) {
    *a6 = v1176;
  }

  return v713;
}

- (BOOL)__isAutoJoinCancelled:(id *)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  BOOL cancelled = v4->_cancelled;
  uint64_t v6 = v4->_underlyingCancelError;
  objc_sync_exit(v4);

  if (cancelled)
  {
    uint64_t v11 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9, v10);
    objc_msgSend_setObject_forKeyedSubscript_(v11, v12, @"Auto-join has been cancelled", *MEMORY[0x1E4F28568], v13);
    objc_msgSend_setObject_forKeyedSubscript_(v11, v14, (uint64_t)v6, *MEMORY[0x1E4F28A50], v15);
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28798];
    uint64_t v22 = objc_msgSend_copy(v11, v18, v19, v20, v21);
    objc_msgSend_errorWithDomain_code_userInfo_(v16, v23, v17, 89, (uint64_t)v22);
    id v24 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setWasCancelled_(v4->_metric, v25, 1, v26, v27);
    if (a3 && v24)
    {
      id v24 = v24;
      *a3 = v24;
    }
  }
  else
  {
    id v24 = 0;
  }

  return cancelled;
}

- (BOOL)__isAutoJoinRequeued
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL requeued = v2->_requeued;
  objc_sync_exit(v2);

  return requeued;
}

- (BOOL)__allowOpportunisticNetworkTransitionWithTrigger:(int64_t)a3
{
  char v4 = _os_feature_enabled_impl();
  unint64_t v5 = (0x30C00110100000uLL >> a3) & 1;
  if ((unint64_t)a3 > 0x35) {
    LOBYTE(v5) = 0;
  }
  if (v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (BOOL)__allowAutoJoinWithTrigger:(int64_t)a3 error:(id *)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  int isAutoJoinRequeued = objc_msgSend___isAutoJoinRequeued(self, a2, a3, (uint64_t)a4, v4);
  if (isAutoJoinRequeued)
  {
    id v17 = 0;
    int v35 = 0;
  }
  else
  {
    id v48 = 0;
    char isAutoJoinCancelled = objc_msgSend___isAutoJoinCancelled_(self, v8, (uint64_t)&v48, v9, v10);
    id v17 = v48;
    if (isAutoJoinCancelled)
    {
      int v35 = 1;
    }
    else
    {
      uint64_t v18 = objc_msgSend_allowAutoJoinHandler(self, v13, v14, v15, v16);

      if (!v18) {
        goto LABEL_6;
      }
      id v47 = 0;
      char v21 = objc_msgSend___calloutToAllowAutoJoinWithTrigger_error_(self, v19, a3, (uint64_t)&v47, v20);
      id v22 = v47;
      uint64_t v27 = v22;
      if (v21)
      {

LABEL_6:
        BOOL v28 = 1;
        if (!a4) {
          goto LABEL_19;
        }
        goto LABEL_17;
      }
      __int16 v29 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v23, v24, v25, v26);
      objc_msgSend_setObject_forKeyedSubscript_(v29, v30, @"Auto-join is not allowed", *MEMORY[0x1E4F28568], v31);
      if (v27) {
        objc_msgSend_setObject_forKeyedSubscript_(v29, v32, (uint64_t)v27, *MEMORY[0x1E4F28A50], v33);
      }
      uint64_t v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v32, *MEMORY[0x1E4F28798], 1, (uint64_t)v29);

      int v35 = 0;
      id v17 = (id)v34;
    }
  }
  uint64_t v36 = CWFGetOSLog();
  if (v36)
  {
    __int16 v37 = CWFGetOSLog();
  }
  else
  {
    __int16 v37 = MEMORY[0x1E4F14500];
    id v38 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v42 = objc_msgSend___descriptionForError_(self, v39, (uint64_t)v17, v40, v41);
    int v49 = 67109634;
    int v50 = isAutoJoinRequeued;
    __int16 v51 = 1024;
    int v52 = v35;
    __int16 v53 = 2114;
    uint64_t v54 = v42;
    _os_log_send_and_compose_impl();
  }
  objc_msgSend_setWasAborted_(self->_metric, v43, 1, v44, v45);
  BOOL v28 = 0;
  if (a4)
  {
LABEL_17:
    if (v17) {
      *a4 = v17;
    }
  }
LABEL_19:

  return v28;
}

- (BOOL)__shouldBypassUnusedNetworkPeriodCheckForTrigger:(int64_t)a3 knownNetwork:(id)a4
{
  id v5 = a4;
  uint64_t v10 = v5;
  char v11 = a3 == 47 || a3 == 32;
  if (a3 != 32 && a3 != 47)
  {
    if (objc_msgSend_addReason(v5, v6, v7, v8, v9) == 7 || objc_msgSend_addReason(v10, v12, v13, v14, v15) == 12)
    {
      uint64_t v16 = objc_msgSend_lastJoinedBySystemAt(v10, v12, v13, v14, v15);
      BOOL v17 = v16 == 0;
    }
    else
    {
      BOOL v17 = 0;
    }
    v11 |= v17;
  }

  return v11;
}

- (BOOL)__shouldBypassLockdownModeCheckForTrigger:(int64_t)a3 targetNetworkSSID:(id)a4 networkSSID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v12 = v8;
  if (a3 == 7)
  {
    if (v7 == v8)
    {
      char isEqual = 1;
    }
    else
    {
      char isEqual = 0;
      if (v7 && v8) {
        char isEqual = objc_msgSend_isEqual_(v7, v9, (uint64_t)v8, v10, v11);
      }
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (BOOL)__isDeferrableKnownNetwork:(id)a3
{
  id v3 = a3;
  BOOL v12 = (objc_msgSend_isCarPlay(v3, v4, v5, v6, v7) & 1) == 0
     && ((objc_msgSend_isHotspot(v3, v8, v9, v10, v11) & 1) != 0
      || (objc_msgSend_isPersonalHotspot(v3, v13, v14, v15, v16) & 1) != 0
      || objc_msgSend_addReason(v3, v17, v18, v19, v20) == 10
      || (objc_msgSend_isOpen(v3, v21, v22, v23, v24) & 1) != 0
      || (objc_msgSend_isOWE(v3, v25, v26, v27, v28) & 1) != 0
      || (objc_msgSend_isWAPI(v3, v29, v30, v31, v32) & 1) != 0
      || objc_msgSend_isPSK(v3, v33, v34, v35, v36)
      && ((objc_msgSend_isWEP(v3, v37, v38, v39, v40) & 1) != 0
       || objc_msgSend_isWPA(v3, v41, v42, v43, v44)));

  return v12;
}

- (BOOL)__does6GHzChannelOverlapWithUWB:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_is6GHz(v3, v4, v5, v6, v7)) {
    BOOL v16 = (unint64_t)objc_msgSend_channel(v3, v8, v9, v10, v11) > 0x5E
  }
       || (unint64_t)objc_msgSend_channel(v3, v12, v13, v14, v15) < 0xEA;
  else {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)__isDeferrableJoinCandidate:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_matchingKnownNetworkProfile(v4, v5, v6, v7, v8);
  if (objc_msgSend_isCarPlay(v9, v10, v11, v12, v13))
  {
    char hasWEP40Cipher = 0;
  }
  else
  {
    uint64_t v19 = objc_msgSend_matchingKnownNetworkProfile(v4, v14, v15, v16, v17);
    if ((objc_msgSend___isDeferrableKnownNetwork_(self, v20, (uint64_t)v19, v21, v22) & 1) != 0
      || (objc_msgSend_isHotspot(v4, v23, v24, v25, v26) & 1) != 0
      || (objc_msgSend_isPersonalHotspot(v4, v27, v28, v29, v30) & 1) != 0
      || (objc_msgSend_isOpen(v4, v31, v32, v33, v34) & 1) != 0
      || (objc_msgSend_isOWE(v4, v35, v36, v37, v38) & 1) != 0
      || objc_msgSend_isPSK(v4, v39, v40, v41, v42)
      && ((objc_msgSend_isWEP(v4, v43, v44, v45, v46) & 1) != 0 || (objc_msgSend_isWPA(v4, v47, v48, v49, v50) & 1) != 0)
      || (objc_msgSend_hasTKIPCipher(v4, v43, v44, v45, v46) & 1) != 0
      || (objc_msgSend_hasWEP104Cipher(v4, v51, v52, v53, v54) & 1) != 0)
    {
      char hasWEP40Cipher = 1;
    }
    else
    {
      char hasWEP40Cipher = objc_msgSend_hasWEP40Cipher(v4, v55, v56, v57, v58);
    }
  }
  return hasWEP40Cipher;
}

- (BOOL)__allowKnownNetwork:(id)a3 context:(id)a4 allowForSeamlessSSIDTransition:(id)a5 defer:(BOOL *)a6 targetQueue:(id)a7 error:(id *)a8
{
  uint64_t v290 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v275 = v13;
  id v276 = a7;
  unsigned __int8 v283 = 0;
  uint64_t v19 = objc_msgSend_autoJoinParameters(v13, v15, v16, v17, v18);
  uint64_t v24 = objc_msgSend_trigger(v19, v20, v21, v22, v23);

  uint64_t v25 = self;
  objc_sync_enter(v25);
  knownNetworkAllowCache = v25->_knownNetworkAllowCache;
  uint64_t v31 = objc_msgSend_identifier(v12, v27, v28, v29, v30);
  uint64_t v279 = objc_msgSend_objectForKeyedSubscript_(knownNetworkAllowCache, v32, (uint64_t)v31, v33, v34);

  knownNetworkDeferCache = v25->_knownNetworkDeferCache;
  uint64_t v40 = objc_msgSend_identifier(v12, v36, v37, v38, v39);
  uint64_t v277 = objc_msgSend_objectForKeyedSubscript_(knownNetworkDeferCache, v41, (uint64_t)v40, v42, v43);

  knownNetworkAllowErrorCache = v25->_knownNetworkAllowErrorCache;
  uint64_t v49 = objc_msgSend_identifier(v12, v45, v46, v47, v48);
  uint64_t v278 = objc_msgSend_objectForKeyedSubscript_(knownNetworkAllowErrorCache, v50, (uint64_t)v49, v51, v52);

  objc_sync_exit(v25);
  if (objc_msgSend_isAutoJoinDisabled(v12, v53, v54, v55, v56))
  {
    uint64_t v61 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v57, v58, v59, v60);
    objc_msgSend_setObject_forKeyedSubscript_(v61, v62, @"Known network profile is disabled", *MEMORY[0x1E4F28568], v63);
    uint64_t v65 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v64, *MEMORY[0x1E4F28798], 1, (uint64_t)v61);
LABEL_3:
    uint64_t v69 = (void *)v65;
LABEL_4:
    LOBYTE(v70) = 0;
    goto LABEL_5;
  }
  if ((objc_msgSend___shouldBypassUnusedNetworkPeriodCheckForTrigger_knownNetwork_(v25, v57, v24, (uint64_t)v12, v60) & 1) == 0
    && ((objc_msgSend_isCaptive(v12, v74, v75, v76, v77) & 1) != 0
     || objc_msgSend_wasCaptive(v12, v74, v161, v162, v77))
    && ((objc_msgSend_isOpen(v12, v74, v161, v162, v77) & 1) != 0
     || objc_msgSend_isOWE(v12, v74, v163, v164, v77)))
  {
    uint64_t v167 = objc_msgSend_lastJoinedOnAnyDeviceAt(v12, v74, v163, v164, v77);
    if (v167)
    {
      objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v74, v165, v166, v77);
      double v169 = v168;
      uint64_t v174 = objc_msgSend_lastJoinedOnAnyDeviceAt(v12, v170, v171, v172, v173);
      objc_msgSend_timeIntervalSinceReferenceDate(v174, v175, v176, v177, v178);
      double v180 = v169 - v179;

      if (v180 > 1209600.0)
      {
        uint64_t v61 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v74, v181, v182, v77);
        uint64_t v186 = objc_msgSend_stringWithFormat_(NSString, v183, @"Captive known network profile unused for %d weeks", v184, v185, 2);
        objc_msgSend_setObject_forKeyedSubscript_(v61, v187, (uint64_t)v186, *MEMORY[0x1E4F28568], v188);

        uint64_t v65 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v189, *MEMORY[0x1E4F28798], 1, (uint64_t)v61);
        goto LABEL_3;
      }
    }
  }
  if ((objc_msgSend___shouldBypassUnusedNetworkPeriodCheckForTrigger_knownNetwork_(v25, v74, v24, (uint64_t)v12, v77) & 1) == 0
    && ((objc_msgSend_isOpen(v12, v78, v79, v80, v81) & 1) != 0
     || objc_msgSend_isOWE(v12, v78, v82, v83, v81)))
  {
    uint64_t v86 = objc_msgSend_lastJoinedOnAnyDeviceAt(v12, v78, v82, v83, v81);
    if (v86)
    {
      objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v78, v84, v85, v81);
      double v88 = v87;
      uint64_t v93 = objc_msgSend_lastJoinedOnAnyDeviceAt(v12, v89, v90, v91, v92);
      objc_msgSend_timeIntervalSinceReferenceDate(v93, v94, v95, v96, v97);
      double v99 = v88 - v98;

      if (v99 > 1209600.0)
      {
        uint64_t v61 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v78, v100, v101, v81);
        uint64_t v105 = objc_msgSend_stringWithFormat_(NSString, v102, @"Open known network profile unused for %d weeks", v103, v104, 2);
        objc_msgSend_setObject_forKeyedSubscript_(v61, v106, (uint64_t)v105, *MEMORY[0x1E4F28568], v107);

        uint64_t v65 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v108, *MEMORY[0x1E4F28798], 1, (uint64_t)v61);
        goto LABEL_3;
      }
    }
  }
  if ((objc_msgSend___shouldBypassUnusedNetworkPeriodCheckForTrigger_knownNetwork_(v25, v78, v24, (uint64_t)v12, v81) & 1) == 0)
  {
    uint64_t v115 = objc_msgSend_lastJoinedOnAnyDeviceAt(v12, v111, v112, v113, v114);
    if (v115)
    {
      objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v111, v112, v113, v114);
      double v117 = v116;
      uint64_t v122 = objc_msgSend_lastJoinedOnAnyDeviceAt(v12, v118, v119, v120, v121);
      objc_msgSend_timeIntervalSinceReferenceDate(v122, v123, v124, v125, v126);
      double v128 = v117 - v127;

      if (v128 > 43545600.0)
      {
        uint64_t v61 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v111, v112, v113, v114);
        uint64_t v132 = objc_msgSend_stringWithFormat_(NSString, v129, @"Known network profile unused for %d weeks", v130, v131, 72);
        objc_msgSend_setObject_forKeyedSubscript_(v61, v133, (uint64_t)v132, *MEMORY[0x1E4F28568], v134);

        uint64_t v65 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v135, *MEMORY[0x1E4F28798], 1, (uint64_t)v61);
        goto LABEL_3;
      }
    }
  }
  if (!v14 && v279)
  {
    char v136 = objc_msgSend_BOOLValue(v279, v111, v112, v113, v114);
    unsigned __int8 v283 = objc_msgSend_BOOLValue(v277, v137, v138, v139, v140);
    if ((v136 & 1) == 0)
    {
      uint64_t v142 = objc_msgSend_userInfo(v278, v66, v141, v67, v68);
      uint64_t v61 = objc_msgSend_mutableCopy(v142, v143, v144, v145, v146);

      objc_msgSend_setObject_forKeyedSubscript_(v61, v147, @"Known network profile is not allowed by daemon (cached)", *MEMORY[0x1E4F28568], v148);
      uint64_t v149 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v154 = objc_msgSend_domain(v278, v150, v151, v152, v153);
      uint64_t v159 = objc_msgSend_code(v278, v155, v156, v157, v158);
      uint64_t v69 = objc_msgSend_errorWithDomain_code_userInfo_(v149, v160, (uint64_t)v154, v159, (uint64_t)v61);

      goto LABEL_4;
    }
    goto LABEL_54;
  }
  uint64_t v222 = objc_msgSend_allowKnownNetworkHandler(v25, v111, v112, v113, v114);

  if (!v222)
  {
LABEL_54:
    uint64_t v61 = 0;
    uint64_t v69 = 0;
    LOBYTE(v70) = 1;
    goto LABEL_5;
  }
  id v282 = 0;
  uint64_t v70 = objc_msgSend___calloutToAllowKnownNetwork_trigger_allowForSeamlessSSIDTransition_defer_queue_error_(v25, v66, (uint64_t)v12, v24, (uint64_t)v14, &v283, v276, &v282);
  id v274 = v282;
  if (v70)
  {
    uint64_t v61 = 0;
    uint64_t v69 = 0;
    if (!v14) {
      goto LABEL_56;
    }
  }
  else
  {
    uint64_t v61 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v223, v224, v225, v226);
    objc_msgSend_setObject_forKeyedSubscript_(v61, v227, @"Known network profile is not allowed by daemon", *MEMORY[0x1E4F28568], v228);
    objc_msgSend_setObject_forKeyedSubscript_(v61, v229, (uint64_t)v274, *MEMORY[0x1E4F28A50], v230);
    uint64_t v69 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v231, *MEMORY[0x1E4F28798], 1, (uint64_t)v61);
    if (!v14)
    {
LABEL_56:
      uint64_t v232 = v25;
      objc_sync_enter(v232);
      uint64_t v236 = objc_msgSend_numberWithBool_(NSNumber, v233, v70, v234, v235);
      uint64_t v237 = v25->_knownNetworkAllowCache;
      uint64_t v242 = objc_msgSend_identifier(v12, v238, v239, v240, v241);
      objc_msgSend_setObject_forKeyedSubscript_(v237, v243, (uint64_t)v236, (uint64_t)v242, v244);

      uint64_t v245 = v25->_knownNetworkAllowErrorCache;
      uint64_t v250 = objc_msgSend_identifier(v12, v246, v247, v248, v249);
      objc_msgSend_setObject_forKeyedSubscript_(v245, v251, (uint64_t)v69, (uint64_t)v250, v252);

      uint64_t v256 = objc_msgSend_numberWithBool_(NSNumber, v253, v283, v254, v255);
      uint64_t v257 = v25->_knownNetworkDeferCache;
      uint64_t v262 = objc_msgSend_identifier(v12, v258, v259, v260, v261);
      objc_msgSend_setObject_forKeyedSubscript_(v257, v263, (uint64_t)v256, (uint64_t)v262, v264);

      updatedAllowCacheKnownNetworks = v232->_updatedAllowCacheKnownNetworks;
      uint64_t v270 = objc_msgSend_identifier(v12, v266, v267, v268, v269);
      objc_msgSend_addObject_(updatedAllowCacheKnownNetworks, v271, (uint64_t)v270, v272, v273);

      objc_sync_exit(v232);
    }
  }

LABEL_5:
  if (objc_msgSend___isDeferrableKnownNetwork_(v25, v66, (uint64_t)v12, v67, v68)) {
    unsigned __int8 v283 = 1;
  }
  if (v70)
  {
    objc_msgSend___removeDisallowedKnownNetwork_(v25, v71, (uint64_t)v12, v72, v73);
  }
  else
  {
    uint64_t v109 = CWFGetOSLog();
    if (v109)
    {
      uint64_t v110 = CWFGetOSLog();
    }
    else
    {
      uint64_t v110 = MEMORY[0x1E4F14500];
      id v190 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v195 = objc_msgSend_identifier(v12, v191, v192, v193, v194);
      __uint64_t v200 = objc_msgSend_redactedForWiFi(v195, v196, v197, v198, v199);
      uint64_t v204 = objc_msgSend___descriptionForError_(v25, v201, (uint64_t)v69, v202, v203);
      int v284 = 138543874;
      uint64_t v285 = v200;
      __int16 v286 = 2114;
      id v287 = v204;
      __int16 v288 = 2114;
      id v289 = v12;
      _os_log_send_and_compose_impl();
    }
    if (!v14) {
      objc_msgSend___addDisallowedKnownNetwork_(v25, v205, (uint64_t)v12, v206, v207);
    }
  }
  if (a6 && v283)
  {
    id v208 = CWFGetOSLog();
    if (v208)
    {
      __uint64_t v209 = CWFGetOSLog();
    }
    else
    {
      __uint64_t v209 = MEMORY[0x1E4F14500];
      id v210 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v209, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v215 = objc_msgSend_identifier(v12, v211, v212, v213, v214);
      uint64_t v220 = objc_msgSend_redactedForWiFi(v215, v216, v217, v218, v219);
      int v284 = 138543618;
      uint64_t v285 = v220;
      __int16 v286 = 2114;
      id v287 = v12;
      _os_log_send_and_compose_impl();
    }
    *a6 = v283;
  }
  if (a8 && v69) {
    *a8 = v69;
  }

  return v70;
}

- (BOOL)isKnownNetworkDisallowed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v14 = objc_msgSend_identifier(v4, v6, v7, v8, v9);
  if (v14)
  {
    disallowedKnownNetworks = v5->_disallowedKnownNetworks;
    uint64_t v16 = objc_msgSend_identifier(v4, v10, v11, v12, v13);
    char v20 = objc_msgSend_containsObject_(disallowedKnownNetworks, v17, (uint64_t)v16, v18, v19);
  }
  else
  {
    char v20 = 0;
  }

  objc_sync_exit(v5);
  return v20;
}

- (void)__removeDisallowedKnownNetwork:(id)a3
{
  id v19 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v9 = objc_msgSend_identifier(v19, v5, v6, v7, v8);

  if (v9)
  {
    disallowedKnownNetworks = v4->_disallowedKnownNetworks;
    uint64_t v15 = objc_msgSend_identifier(v19, v10, v11, v12, v13);
    objc_msgSend_removeObject_(disallowedKnownNetworks, v16, (uint64_t)v15, v17, v18);
  }
  objc_sync_exit(v4);
}

- (void)__addDisallowedKnownNetwork:(id)a3
{
  id v19 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v9 = objc_msgSend_identifier(v19, v5, v6, v7, v8);

  if (v9)
  {
    disallowedKnownNetworks = v4->_disallowedKnownNetworks;
    uint64_t v15 = objc_msgSend_identifier(v19, v10, v11, v12, v13);
    objc_msgSend_addObject_(disallowedKnownNetworks, v16, (uint64_t)v15, v17, v18);
  }
  objc_sync_exit(v4);
}

- (id)__knownNetworksSupportingSeamlessSSIDTransition:(id)a3 fromNetwork:(id)a4 allowSameSSID:(BOOL)a5 context:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v17 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v13, v14, v15, v16);
  uint64_t v18 = CWFKnownNetworksSupportingSeamlessSSIDTransitionForScanResult(v11, v10, a5);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v33, (uint64_t)v37, 16);
  if (v20)
  {
    uint64_t v25 = v20;
    uint64_t v26 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v34 != v26) {
          objc_enumerationMutation(v18);
        }
        uint64_t v28 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        if (objc_msgSend___allowKnownNetwork_context_allowForSeamlessSSIDTransition_defer_targetQueue_error_(self, v21, v28, (uint64_t)v12, (uint64_t)v11, 0, self->_targetQueue, 0))objc_msgSend_addObject_(v17, v21, v28, v29, v30); {
      }
        }
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v33, (uint64_t)v37, 16);
    }
    while (v25);
  }
  uint64_t v31 = objc_msgSend_copy(v17, v21, v22, v23, v24);

  return v31;
}

- (BOOL)__candidateSupportsSeamlessSSIDTransition:(id)a3 fromNetwork:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (CWFScanResultSupportsSeamlessSSIDTransition(v9, v8))
  {
    uint64_t v15 = objc_msgSend_matchingKnownNetworkProfile(v8, v11, v12, v13, v14);
    char v17 = objc_msgSend___allowKnownNetwork_context_allowForSeamlessSSIDTransition_defer_targetQueue_error_(self, v16, (uint64_t)v15, (uint64_t)v10, (uint64_t)v9, 0, self->_targetQueue, 0);
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (id)__performGASQueryWithScanResults:(id)a3 ANQPElementIDList:(id)a4 maxCacheAge:(unint64_t)a5 cacheOnly:(BOOL)a6 error:(id *)a7
{
  BOOL v7 = a6;
  uint64_t v223 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = CWFGetOSLog();
  if (v13)
  {
    uint64_t v14 = CWFGetOSLog();
  }
  else
  {
    uint64_t v14 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v212 = 67109376;
    *(_DWORD *)uint64_t v213 = v7;
    *(_WORD *)&v213[4] = 2048;
    *(void *)&v213[6] = a5;
    LODWORD(v191) = 18;
    id v190 = &v212;
    _os_log_send_and_compose_impl();
  }
  BOOL v193 = v7;
  unint64_t v198 = a5;

  __uint64_t v200 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v16, v17, v18, v19);
  long long v207 = 0u;
  long long v208 = 0u;
  long long v209 = 0u;
  long long v210 = 0u;
  id obj = v11;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v207, (uint64_t)v222, 16);
  if (v21)
  {
    uint64_t v26 = v21;
    uint64_t v27 = *(void *)v208;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v208 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = *(void **)(*((void *)&v207 + 1) + 8 * i);
        uint64_t v30 = NSString;
        objc_msgSend_networkName(v29, v22, v23, v24, v25, v190, v191);
        uint64_t v31 = (int *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_BSSID(v29, v32, v33, v34, v35);
        v191 = id v190 = v31;
        uint64_t v39 = objc_msgSend_stringWithFormat_(v30, v36, @"'%@'/%@", v37, v38);
        objc_msgSend_addObject_(v200, v40, (uint64_t)v39, v41, v42);
      }
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v207, (uint64_t)v222, 16);
    }
    while (v26);
  }

  uint64_t v43 = CWFGetOSLog();
  if (v43)
  {
    uint64_t v44 = CWFGetOSLog();
  }
  else
  {
    uint64_t v44 = MEMORY[0x1E4F14500];
    id v45 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v50 = objc_msgSend_count(obj, v46, v47, v48, v49);
    uint64_t v54 = objc_msgSend_componentsJoinedByString_(v200, v51, @", ", v52, v53);
    int v212 = 134218242;
    *(void *)uint64_t v213 = v50;
    *(_WORD *)&v213[8] = 2114;
    *(void *)&v213[10] = v54;
    LODWORD(v191) = 22;
    id v190 = &v212;
    _os_log_send_and_compose_impl();
  }
  uint64_t v55 = CWFGetOSLog();
  if (v55)
  {
    uint64_t v56 = CWFGetOSLog();
  }
  else
  {
    uint64_t v56 = MEMORY[0x1E4F14500];
    id v57 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v62 = objc_msgSend_count(v12, v58, v59, v60, v61);
    uint64_t v66 = objc_msgSend_componentsJoinedByString_(v12, v63, @", ", v64, v65);
    int v212 = 134218242;
    *(void *)uint64_t v213 = v62;
    *(_WORD *)&v213[8] = 2114;
    *(void *)&v213[10] = v66;
    LODWORD(v191) = 22;
    id v190 = &v212;
    _os_log_send_and_compose_impl();
  }
  __uint64_t v67 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  uint64_t v72 = objc_msgSend_performGASQueryHandler(self, v68, v69, v70, v71);

  uint64_t v196 = v12;
  if (v72)
  {
    uint64_t v77 = objc_alloc_init(CWFANQPParameters);
    objc_msgSend_setScanResults_(v77, v78, (uint64_t)obj, v79, v80);
    objc_msgSend_setANQPElementIDList_(v77, v81, (uint64_t)v12, v82, v83);
    objc_msgSend_setAcceptableCacheAge_(v77, v84, v198, v85, v86);
    id v205 = 0;
    id v206 = 0;
    double v88 = objc_msgSend___calloutToPerformGASQueryWithParameters_GASQueryNetworks_error_(self, v87, (uint64_t)v77, (uint64_t)&v206, (uint64_t)&v205);
    id v89 = v206;
    id v94 = v205;
    if (v88)
    {
      if (objc_msgSend_count(v89, v90, v91, v92, v93))
      {
        uint64_t v103 = objc_msgSend_GASQueryNetworks(self->_metric, v95, v96, v97, v98);
        metric = self->_metric;
        if (v103)
        {
          uint64_t v105 = objc_msgSend_GASQueryNetworks(metric, v99, v100, v101, v102);
          objc_msgSend_arrayByAddingObjectsFromArray_(v105, v106, (uint64_t)v89, v107, v108);
          uint64_t v110 = v109 = v89;
          objc_msgSend_setGASQueryNetworks_(self->_metric, v111, (uint64_t)v110, v112, v113);

          id v89 = v109;
        }
        else
        {
          objc_msgSend_setGASQueryNetworks_(metric, v99, (uint64_t)v89, v101, v102);
        }
      }
      id v125 = v88;
      uint64_t v192 = 0;
      uint64_t v118 = 0;
    }
    else
    {
      uint64_t v119 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v90, v91, v92, v93);
      objc_msgSend_setObject_forKeyedSubscript_(v119, v120, @"Failed to perform GAS/ANQP", *MEMORY[0x1E4F28568], v121);
      objc_msgSend_setObject_forKeyedSubscript_(v119, v122, (uint64_t)v94, *MEMORY[0x1E4F28A50], v123);
      uint64_t v192 = v119;
      uint64_t v118 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v124, *MEMORY[0x1E4F28798], 2, (uint64_t)v119);
    }
  }
  else
  {
    uint64_t v114 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v73, v74, v75, v76);
    objc_msgSend_setObject_forKeyedSubscript_(v114, v115, @"CWFAutoJoinManager.performGASQueryHandler() not configured", *MEMORY[0x1E4F28568], v116);
    uint64_t v192 = v114;
    uint64_t v118 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v117, *MEMORY[0x1E4F28798], 6, (uint64_t)v114);
    id v89 = 0;
    double v88 = 0;
  }
  __uint64_t v126 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v67;
  uint64_t v131 = objc_msgSend_GASQueryDuration(self->_metric, v127, v128, v129, v130);
  objc_msgSend_setGASQueryDuration_(self->_metric, v132, v131 + v126 / 0xF4240, v133, v134);
  if (v118)
  {
    uint64_t v143 = objc_msgSend_GASQueryErrors(self->_metric, v135, v136, v137, v138);
    if (v143)
    {
      uint64_t v144 = objc_msgSend_GASQueryErrors(self->_metric, v139, v140, v141, v142);
      uint64_t v148 = objc_msgSend_arrayByAddingObject_(v144, v145, v118, v146, v147);
      objc_msgSend_setGASQueryErrors_(self->_metric, v149, (uint64_t)v148, v150, v151);
    }
    else
    {
      uint64_t v144 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1C978], v139, v118, v141, v142);
      objc_msgSend_setGASQueryErrors_(self->_metric, v152, (uint64_t)v144, v153, v154);
    }
  }
  uint64_t v155 = CWFGetOSLog();
  if (v155)
  {
    uint64_t v156 = CWFGetOSLog();
  }
  else
  {
    uint64_t v156 = MEMORY[0x1E4F14500];
    id v157 = MEMORY[0x1E4F14500];
  }
  id v197 = (id)v118;

  if (os_log_type_enabled(v156, (os_log_type_t)(16 * (v88 == 0))))
  {
    if (v88) {
      uint64_t v161 = "SUCCEEDED";
    }
    else {
      uint64_t v161 = "FAILED";
    }
    uint64_t v162 = objc_msgSend___descriptionForError_(self, v158, v118, v159, v160, v190, v191);
    uint64_t v167 = objc_msgSend_count(v89, v163, v164, v165, v166);
    int v212 = 136447490;
    *(void *)uint64_t v213 = v161;
    *(_WORD *)&v213[8] = 2048;
    *(void *)&v213[10] = v126 / 0xF4240;
    __int16 v214 = 2114;
    uint64_t v215 = v162;
    __int16 v216 = 2048;
    uint64_t v217 = v167;
    __int16 v218 = 1024;
    BOOL v219 = v193;
    __int16 v220 = 2048;
    unint64_t v221 = v198;
    _os_log_send_and_compose_impl();
  }
  double v168 = CWFGetOSLog();
  if (v168)
  {
    double v169 = CWFGetOSLog();
  }
  else
  {
    double v169 = MEMORY[0x1E4F14500];
    id v170 = MEMORY[0x1E4F14500];
  }
  uint64_t v194 = v89;

  if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v175 = objc_msgSend_count(v88, v171, v172, v173, v174);
    int v212 = 134217984;
    *(void *)uint64_t v213 = v175;
    _os_log_send_and_compose_impl();
  }

  long long v203 = 0u;
  long long v204 = 0u;
  long long v201 = 0u;
  long long v202 = 0u;
  id v176 = v88;
  uint64_t v178 = objc_msgSend_countByEnumeratingWithState_objects_count_(v176, v177, (uint64_t)&v201, (uint64_t)v211, 16);
  if (v178)
  {
    uint64_t v179 = v178;
    uint64_t v180 = *(void *)v202;
    uint64_t v181 = MEMORY[0x1E4F14500];
    do
    {
      for (uint64_t j = 0; j != v179; ++j)
      {
        if (*(void *)v202 != v180) {
          objc_enumerationMutation(v176);
        }
        uint64_t v183 = *(void *)(*((void *)&v201 + 1) + 8 * j);
        uint64_t v184 = CWFGetOSLog();
        if (v184)
        {
          uint64_t v185 = CWFGetOSLog();
        }
        else
        {
          uint64_t v186 = v181;
          uint64_t v185 = v181;
        }

        if (os_log_type_enabled(v185, OS_LOG_TYPE_DEFAULT))
        {
          int v212 = 138543362;
          *(void *)uint64_t v213 = v183;
          _os_log_send_and_compose_impl();
        }
      }
      uint64_t v179 = objc_msgSend_countByEnumeratingWithState_objects_count_(v176, v187, (uint64_t)&v201, (uint64_t)v211, 16);
    }
    while (v179);
  }

  if (a7 && v197) {
    *a7 = v197;
  }
  id v188 = v176;

  return v188;
}

- (id)__performScanWithChannelList:(id)a3 SSIDList:(id)a4 passive:(BOOL)a5 dwellTime:(unint64_t)a6 maxCacheAge:(unint64_t)a7 cacheOnly:(BOOL)a8 isPreAssociationScan:(BOOL)a9 error:(id *)a10
{
  BOOL v10 = a8;
  BOOL v12 = a5;
  uint64_t v279 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  uint64_t v17 = CWFGetOSLog();
  if (v17)
  {
    uint64_t v18 = CWFGetOSLog();
  }
  else
  {
    uint64_t v18 = MEMORY[0x1E4F14500];
    id v19 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v266 = 134218496;
    unint64_t v267 = a6;
    __int16 v268 = 1024;
    *(_DWORD *)uint64_t v269 = v10;
    *(_WORD *)&v269[4] = 2048;
    *(void *)&v269[6] = a7;
    LODWORD(v244) = 28;
    uint64_t v243 = &v266;
    _os_log_send_and_compose_impl();
  }

  uint64_t v20 = CWFGetOSLog();
  if (v20)
  {
    uint64_t v21 = CWFGetOSLog();
  }
  else
  {
    uint64_t v21 = MEMORY[0x1E4F14500];
    id v22 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = objc_msgSend_count(v15, v23, v24, v25, v26);
    uint64_t v31 = objc_msgSend_componentsJoinedByString_(v15, v28, @", ", v29, v30);
    int v266 = 134218242;
    unint64_t v267 = v27;
    __int16 v268 = 2114;
    *(void *)uint64_t v269 = v31;
    LODWORD(v244) = 22;
    uint64_t v243 = &v266;
    _os_log_send_and_compose_impl();
  }
  uint64_t v32 = CWFGetOSLog();
  if (v32)
  {
    uint64_t v33 = CWFGetOSLog();
  }
  else
  {
    uint64_t v33 = MEMORY[0x1E4F14500];
    id v34 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v39 = objc_msgSend_count(v16, v35, v36, v37, v38);
    uint64_t v43 = objc_msgSend_componentsJoinedByString_(v16, v40, @", ", v41, v42);
    int v266 = 134218242;
    unint64_t v267 = v39;
    __int16 v268 = 2114;
    *(void *)uint64_t v269 = v43;
    LODWORD(v244) = 22;
    uint64_t v243 = &v266;
    _os_log_send_and_compose_impl();
  }
  __uint64_t v44 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  uint64_t v49 = objc_msgSend_scanForNetworksHandler(self, v45, v46, v47, v48);

  uint64_t v249 = v16;
  uint64_t v250 = v15;
  if (v49)
  {
    uint64_t v54 = objc_alloc_init(CWFScanParameters);
    objc_msgSend_setBSSType_(v54, v55, 3, v56, v57);
    objc_msgSend_setPHYMode_(v54, v58, 1, v59, v60);
    objc_msgSend_setNumberOfScans_(v54, v61, 1, v62, v63);
    objc_msgSend_setIncludeHiddenNetworks_(v54, v64, 1, v65, v66);
    objc_msgSend_setChannels_(v54, v67, (uint64_t)v15, v68, v69);
    objc_msgSend_setSSIDList_(v54, v70, (uint64_t)v16, v71, v72);
    objc_msgSend_setDwellTime_(v54, v73, a6, v74, v75);
    objc_msgSend_setScanFlags_(v54, v76, 2592, v77, v78);
    if (v10)
    {
      objc_msgSend_setScanType_(v54, v79, 3, v80, v81);
      objc_msgSend_setMaximumAge_(v54, v82, a7, v83, v84);
    }
    else
    {
      if (v12) {
        objc_msgSend_setScanType_(v54, v79, 2, v80, v81, v243, v244);
      }
      else {
        objc_msgSend_setScanType_(v54, v79, 1, v80, v81, v243, v244);
      }
      objc_msgSend_setAcceptableCacheAge_(v54, v93, a7, v94, v95);
    }
    id v263 = 0;
    id v264 = 0;
    uint64_t v92 = objc_msgSend___calloutToScanForNetworksWithParameters_scanChannels_error_(self, v85, (uint64_t)v54, (uint64_t)&v264, (uint64_t)&v263, v243, v244);
    id v91 = v264;
    id v100 = v263;
    if (v92)
    {
      if (objc_msgSend_count(v91, v96, v97, v98, v99))
      {
        metric = self->_metric;
        if (a9) {
          objc_msgSend_preAssociationScanChannels(metric, v101, v102, v103, v104);
        }
        else {
        uint64_t v106 = objc_msgSend_scanChannels(metric, v101, v102, v103, v104);
        }
        uint64_t v252 = v91;
        BOOL v246 = v10;
        __uint64_t v245 = v44;
        uint64_t v248 = v106;
        if (v106)
        {
          uint64_t v118 = objc_msgSend_mutableCopy(v106, v107, v108, v109, v110);
        }
        else
        {
          uint64_t v118 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v107, v108, v109, v110);
        }
        uint64_t v119 = (void *)v118;
        long long v261 = 0u;
        long long v262 = 0u;
        long long v259 = 0u;
        long long v260 = 0u;
        id v120 = v252;
        uint64_t v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(v120, v121, (uint64_t)&v259, (uint64_t)v278, 16);
        if (v122)
        {
          uint64_t v126 = v122;
          uint64_t v127 = *(void *)v260;
          do
          {
            for (uint64_t i = 0; i != v126; ++i)
            {
              if (*(void *)v260 != v127) {
                objc_enumerationMutation(v120);
              }
              uint64_t v129 = objc_msgSend___basicChannelRepresentation_(self, v123, *(void *)(*((void *)&v259 + 1) + 8 * i), v124, v125);
              objc_msgSend_addObject_(v119, v130, (uint64_t)v129, v131, v132);
            }
            uint64_t v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(v120, v123, (uint64_t)&v259, (uint64_t)v278, 16);
          }
          while (v126);
        }

        uint64_t v136 = self->_metric;
        if (a9) {
          objc_msgSend_setPreAssociationScanChannels_(v136, v133, (uint64_t)v119, v134, v135);
        }
        else {
          objc_msgSend_setScanChannels_(v136, v133, (uint64_t)v119, v134, v135);
        }
        BOOL v10 = v246;
        __uint64_t v44 = v245;

        id v91 = v252;
      }
      id v137 = v92;
      uint64_t v247 = 0;
      uint64_t v117 = 0;
    }
    else
    {
      uint64_t v111 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v96, v97, v98, v99);
      objc_msgSend_setObject_forKeyedSubscript_(v111, v112, @"Failed to perform scan", *MEMORY[0x1E4F28568], v113);
      objc_msgSend_setObject_forKeyedSubscript_(v111, v114, (uint64_t)v100, *MEMORY[0x1E4F28A50], v115);
      uint64_t v247 = v111;
      uint64_t v117 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v116, *MEMORY[0x1E4F28798], 2, (uint64_t)v111);
    }

    uint64_t v90 = v117;
  }
  else
  {
    uint64_t v86 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v50, v51, v52, v53);
    objc_msgSend_setObject_forKeyedSubscript_(v86, v87, @"CWFAutoJoinManager.scanForNetworksHandler() not configured", *MEMORY[0x1E4F28568], v88);
    uint64_t v247 = v86;
    uint64_t v90 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v89, *MEMORY[0x1E4F28798], 6, (uint64_t)v86);
    id v91 = 0;
    uint64_t v92 = 0;
  }
  __uint64_t v142 = (clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v44) / 0xF4240;
  uint64_t v143 = self->_metric;
  if (a9)
  {
    uint64_t v144 = objc_msgSend_preAssociationScanDuration(v143, v138, v139, v140, v141);
    objc_msgSend_setPreAssociationScanDuration_(self->_metric, v145, v144 + v142, v146, v147);
    if (!v90) {
      goto LABEL_54;
    }
  }
  else
  {
    uint64_t v152 = objc_msgSend_scanDuration(v143, v138, v139, v140, v141);
    objc_msgSend_setScanDuration_(self->_metric, v153, v152 + v142, v154, v155);
    if (!v90) {
      goto LABEL_54;
    }
  }
  uint64_t v160 = objc_msgSend_scanErrors(self->_metric, v148, v149, v150, v151, v243, v244);
  if (v160)
  {
    uint64_t v161 = objc_msgSend_scanErrors(self->_metric, v156, v157, v158, v159);
    uint64_t v165 = objc_msgSend_arrayByAddingObject_(v161, v162, v90, v163, v164);
    objc_msgSend_setScanErrors_(self->_metric, v166, (uint64_t)v165, v167, v168);
  }
  else
  {
    uint64_t v161 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1C978], v156, v90, v158, v159);
    objc_msgSend_setScanErrors_(self->_metric, v169, (uint64_t)v161, v170, v171);
  }

LABEL_54:
  uint64_t v172 = CWFGetOSLog();
  if (v172)
  {
    uint64_t v173 = CWFGetOSLog();
  }
  else
  {
    uint64_t v173 = MEMORY[0x1E4F14500];
    id v174 = MEMORY[0x1E4F14500];
  }

  id v251 = (id)v90;
  if (os_log_type_enabled(v173, (os_log_type_t)(16 * (v92 == 0))))
  {
    if (v92) {
      uint64_t v179 = "SUCCEEDED";
    }
    else {
      uint64_t v179 = "FAILED";
    }
    uint64_t v180 = objc_msgSend_count(v92, v175, v176, v177, v178, v243, v244);
    uint64_t v184 = objc_msgSend___descriptionForError_(self, v181, v90, v182, v183);
    uint64_t v189 = objc_msgSend_count(v91, v185, v186, v187, v188);
    int v266 = 136447746;
    unint64_t v267 = (unint64_t)v179;
    __int16 v268 = 2048;
    *(void *)uint64_t v269 = v142;
    *(_WORD *)&v269[8] = 2048;
    *(void *)&v269[10] = v180;
    __int16 v270 = 2114;
    uint64_t v271 = v184;
    __int16 v272 = 2048;
    uint64_t v273 = v189;
    __int16 v274 = 1024;
    BOOL v275 = v10;
    __int16 v276 = 2048;
    unint64_t v277 = a7;
    LODWORD(v244) = 68;
    uint64_t v243 = &v266;
    _os_log_send_and_compose_impl();
  }
  id v190 = CWFGetOSLog();
  if (v190)
  {
    uint64_t v191 = CWFGetOSLog();
  }
  else
  {
    uint64_t v191 = MEMORY[0x1E4F14500];
    id v192 = MEMORY[0x1E4F14500];
  }
  uint64_t v253 = v91;

  if (os_log_type_enabled(v191, OS_LOG_TYPE_DEFAULT))
  {
    if (v10) {
      id v197 = " Cache";
    }
    else {
      id v197 = "";
    }
    uint64_t v198 = objc_msgSend_count(v92, v193, v194, v195, v196, v243, v244);
    int v266 = 136446466;
    unint64_t v267 = (unint64_t)v197;
    __int16 v268 = 2048;
    *(void *)uint64_t v269 = v198;
    _os_log_send_and_compose_impl();
  }

  long long v257 = 0u;
  long long v258 = 0u;
  long long v255 = 0u;
  long long v256 = 0u;
  id v199 = v92;
  uint64_t v201 = objc_msgSend_countByEnumeratingWithState_objects_count_(v199, v200, (uint64_t)&v255, (uint64_t)v265, 16);
  if (v201)
  {
    uint64_t v202 = v201;
    uint64_t v203 = *(void *)v256;
    long long v204 = MEMORY[0x1E4F14500];
    do
    {
      for (uint64_t j = 0; j != v202; ++j)
      {
        if (*(void *)v256 != v203) {
          objc_enumerationMutation(v199);
        }
        id v206 = *(void **)(*((void *)&v255 + 1) + 8 * j);
        long long v207 = CWFGetOSLog();
        if (v207)
        {
          long long v208 = CWFGetOSLog();
        }
        else
        {
          long long v209 = v204;
          long long v208 = v204;
        }

        if (os_log_type_enabled(v208, OS_LOG_TYPE_DEFAULT))
        {
          int v266 = 138543362;
          unint64_t v267 = (unint64_t)v206;
          _os_log_send_and_compose_impl();
        }

        __int16 v214 = objc_msgSend_channel(v206, v210, v211, v212, v213);
        __int16 v218 = objc_msgSend___basicChannelRepresentation_(self, v215, (uint64_t)v214, v216, v217);

        uint64_t v223 = objc_msgSend_scanChannels(self->_metric, v219, v220, v221, v222);
        int v227 = objc_msgSend_containsObject_(v223, v224, (uint64_t)v218, v225, v226);

        if (v227)
        {
          self->_BOOL didDiscoverBSS = 1;
          uint64_t v232 = objc_msgSend_SSID(v206, v228, v229, v230, v231);
          uint64_t v237 = objc_msgSend_length(v232, v233, v234, v235, v236);

          if (!v237) {
            objc_msgSend_addObject_(self->_hiddenNetworkChannels, v238, (uint64_t)v218, v239, v240);
          }
        }
      }
      uint64_t v202 = objc_msgSend_countByEnumeratingWithState_objects_count_(v199, v241, (uint64_t)&v255, (uint64_t)v265, 16);
    }
    while (v202);
  }

  if (a10 && v251) {
    *a10 = v251;
  }

  return v199;
}

- (id)__alreadyFoundFollowup6GHzBSSWithSignature:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  objc_msgSend_allValues(self->_followup6GHzScanResultsMap, v5, v6, v7, v8);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v58, (uint64_t)v63, 16);
  if (v52)
  {
    uint64_t v51 = *(void *)v59;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v59 != v51) {
          objc_enumerationMutation(obj);
        }
        uint64_t v53 = v10;
        id v11 = *(void **)(*((void *)&v58 + 1) + 8 * v10);
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v12 = v11;
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v54, (uint64_t)v62, 16);
        if (v14)
        {
          uint64_t v19 = v14;
          uint64_t v20 = *(void *)v55;
LABEL_8:
          uint64_t v21 = 0;
          while (1)
          {
            if (*(void *)v55 != v20) {
              objc_enumerationMutation(v12);
            }
            id v22 = *(void **)(*((void *)&v54 + 1) + 8 * v21);
            uint64_t v23 = NSString;
            uint64_t v24 = objc_msgSend_shortSSID(v22, v15, v16, v17, v18);
            uint64_t v29 = objc_msgSend_BSSID(v22, v25, v26, v27, v28);
            id v34 = objc_msgSend_channel(v22, v30, v31, v32, v33);
            uint64_t v39 = objc_msgSend_channel(v34, v35, v36, v37, v38);
            uint64_t v43 = objc_msgSend_stringWithFormat_(v23, v40, @"%lu/%@/%lu", v41, v42, v24, v29, v39);

            if (v4)
            {
              if (v43 && (objc_msgSend_isEqual_(v43, v44, (uint64_t)v4, v45, v46) & 1) != 0) {
                break;
              }
            }

            if (v19 == ++v21)
            {
              uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v54, (uint64_t)v62, 16);
              if (v19) {
                goto LABEL_8;
              }
              goto LABEL_16;
            }
          }
          id v48 = v22;

          if (v48) {
            goto LABEL_21;
          }
        }
        else
        {
LABEL_16:
        }
        uint64_t v10 = v53 + 1;
      }
      while (v53 + 1 != v52);
      uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v58, (uint64_t)v63, 16);
    }
    while (v52);
  }
  id v48 = 0;
LABEL_21:

  return v48;
}

- (id)__perform6GHzFollowupDiscoveryWithScanResults:(id)a3 SSIDList:(id)a4 dwellTime:(unint64_t)a5 context:(id)a6 error:(id *)a7
{
  uint64_t v610 = *MEMORY[0x1E4F143B8];
  id v526 = a3;
  id v525 = a4;
  id v538 = a6;
  uint64_t v547 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v10, v11, v12, v13);
  uint64_t v560 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v14, v15, v16, v17);
  objc_msgSend_supportedChannels(self, v18, v19, v20, v21);
  long long v589 = 0u;
  long long v590 = 0u;
  long long v591 = 0u;
  long long v592 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v589, (uint64_t)v609, 16);
  if (v23)
  {
    uint64_t v27 = v23;
    uint64_t v28 = *(void *)v590;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v590 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = objc_msgSend___basicChannelRepresentation_(self, v24, *(void *)(*((void *)&v589 + 1) + 8 * i), v25, v26);
        objc_msgSend_addObject_(v560, v31, (uint64_t)v30, v32, v33);
      }
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v24, (uint64_t)&v589, (uint64_t)v609, 16);
    }
    while (v27);
  }

  objc_msgSend_sortedArrayUsingComparator_(v526, v34, (uint64_t)&unk_1F0DA3F50, v35, v36);
  long long v585 = 0u;
  long long v586 = 0u;
  long long v587 = 0u;
  long long v588 = 0u;
  id v528 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v554 = self;
  uint64_t v532 = objc_msgSend_countByEnumeratingWithState_objects_count_(v528, v37, (uint64_t)&v585, (uint64_t)v608, 16);
  if (!v532)
  {
    id v563 = 0;
    goto LABEL_121;
  }
  id v563 = 0;
  uint64_t v530 = *(void *)v586;
  do
  {
    uint64_t v42 = 0;
    do
    {
      if (*(void *)v586 != v530)
      {
        uint64_t v43 = v42;
        objc_enumerationMutation(v528);
        uint64_t v42 = v43;
      }
      uint64_t v533 = v42;
      __uint64_t v44 = *(void **)(*((void *)&v585 + 1) + 8 * v42);
      id v558 = v44;
      if (objc_msgSend_isFILSDiscoveryFrame(v44, v38, v39, v40, v41, v519, v521)
        && (objc_msgSend_channel(v44, v45, v46, v47, v48),
            uint64_t v49 = objc_claimAutoreleasedReturnValue(),
            int v54 = objc_msgSend_is6GHz(v49, v50, v51, v52, v53),
            v49,
            v54))
      {
        long long v55 = objc_msgSend_channel(v44, v45, v46, v47, v48);
        long long v59 = objc_msgSend___basicChannelRepresentation_(self, v56, (uint64_t)v55, v57, v58);

        if (objc_msgSend_containsObject_(v560, v60, (uint64_t)v59, v61, v62))
        {
          id v551 = v59;
          __uint64_t v67 = objc_msgSend_SSID(v44, v63, v64, v65, v66);
          uint64_t v72 = objc_msgSend_shortSSID(v44, v68, v69, v70, v71);
          long long v581 = 0u;
          long long v582 = 0u;
          long long v583 = 0u;
          long long v584 = 0u;
          objc_msgSend_knownNetworks(v538, v73, v74, v75, v76);
          id v555 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v555, v77, (uint64_t)&v581, (uint64_t)v607, 16);
          if (!v78) {
            goto LABEL_57;
          }
          uint64_t v83 = v78;
          uint64_t v561 = *(void *)v582;
          while (1)
          {
            for (uint64_t j = 0; j != v83; ++j)
            {
              if (*(void *)v582 != v561) {
                objc_enumerationMutation(v555);
              }
              uint64_t v85 = *(void **)(*((void *)&v581 + 1) + 8 * j);
              uint64_t v86 = objc_msgSend_SSID(v85, v79, v80, v81, v82);
              uint64_t v91 = objc_msgSend_shortSSID(v85, v87, v88, v89, v90);
              uint64_t v96 = v91;
              if (v86) {
                BOOL v97 = v67 == 0;
              }
              else {
                BOOL v97 = 1;
              }
              if (v97)
              {
                if (!v72 || v72 != v91) {
                  goto LABEL_55;
                }
              }
              else
              {
                char isEqual = objc_msgSend_isEqual_(v86, v92, (uint64_t)v67, v94, v95);
                if (v72) {
                  BOOL v99 = v72 == v96;
                }
                else {
                  BOOL v99 = 0;
                }
                char v100 = v99;
                if ((isEqual & 1) == 0 && (v100 & 1) == 0) {
                  goto LABEL_55;
                }
              }
              uint64_t v101 = NSString;
              uint64_t v102 = objc_msgSend_BSSID(v44, v92, v93, v94, v95);
              uint64_t v107 = objc_msgSend_channel(v44, v103, v104, v105, v106);
              uint64_t v112 = objc_msgSend_channel(v107, v108, v109, v110, v111);
              uint64_t v116 = objc_msgSend_stringWithFormat_(v101, v113, @"%lu/%@/%lu", v114, v115, v72, v102, v112);

              uint64_t v117 = CWFGetOSLog();
              if (v117)
              {
                CWFGetOSLog();
                uint64_t v118 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                uint64_t v118 = MEMORY[0x1E4F14500];
                id v119 = MEMORY[0x1E4F14500];
              }
              self = v554;

              if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
              {
                int v594 = 138543618;
                uint64_t v595 = (uint64_t)v558;
                __int16 v596 = 2114;
                unint64_t v597 = (unint64_t)v85;
                LODWORD(v522) = 22;
                uint64_t v520 = &v594;
                _os_log_send_and_compose_impl();
              }

              uint64_t v123 = objc_msgSend_objectForKeyedSubscript_(v554->_followup6GHzFILSDMap, v120, (uint64_t)v116, v121, v122);

              if (!v123) {
                objc_msgSend_setObject_forKeyedSubscript_(v554->_followup6GHzFILSDMap, v124, (uint64_t)v558, (uint64_t)v116, v126);
              }
              uint64_t v127 = objc_msgSend___alreadyFoundFollowup6GHzBSSWithSignature_(v554, v124, (uint64_t)v116, v125, v126, v520, v522);
              if (v127)
              {
                uint64_t v128 = CWFGetOSLog();
                if (v128)
                {
                  CWFGetOSLog();
                  uint64_t v129 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  uint64_t v129 = MEMORY[0x1E4F14500];
                  id v180 = MEMORY[0x1E4F14500];
                }

                if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(v594) = 0;
                  LODWORD(v521) = 2;
                  id v519 = &v594;
                  _os_log_send_and_compose_impl();
                }

                uint64_t v185 = v563;
                if (!v563)
                {
                  uint64_t v185 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v181, v182, v183, v184);
                }
                id v563 = v185;
                objc_msgSend_addObject_(v185, v181, (uint64_t)v127, v183, v184, v519, v521);
              }
              else
              {
                uint64_t v130 = objc_alloc_init(CWFScanParameters);
                uint64_t v135 = objc_msgSend_networkName(v85, v131, v132, v133, v134);
                objc_msgSend_setSSID_(v130, v136, (uint64_t)v135, v137, v138);

                uint64_t v143 = objc_msgSend_BSSID(v558, v139, v140, v141, v142);
                objc_msgSend_setBSSID_(v130, v144, (uint64_t)v143, v145, v146);

                id v606 = v551;
                uint64_t v149 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v147, (uint64_t)&v606, 1, v148);
                objc_msgSend_setChannels_(v130, v150, (uint64_t)v149, v151, v152);

                self = v554;
                objc_msgSend_setBSSType_(v130, v153, 3, v154, v155);
                objc_msgSend_setPHYMode_(v130, v156, 1, v157, v158);
                objc_msgSend_setNumberOfScans_(v130, v159, 1, v160, v161);
                objc_msgSend_setIncludeHiddenNetworks_(v130, v162, 1, v163, v164);
                objc_msgSend_setAcceptableCacheAge_(v130, v165, 0, v166, v167);
                objc_msgSend_setDwellTime_(v130, v168, a5, v169, v170);
                objc_msgSend_setScanFlags_(v130, v171, 1056, v172, v173);
                objc_msgSend_setScanType_(v130, v174, 1, v175, v176);
                objc_msgSend_addObject_(v547, v177, (uint64_t)v130, v178, v179);
              }
              __uint64_t v44 = v558;
LABEL_55:
            }
            uint64_t v83 = objc_msgSend_countByEnumeratingWithState_objects_count_(v555, v79, (uint64_t)&v581, (uint64_t)v607, 16);
            if (!v83)
            {
LABEL_57:

              goto LABEL_58;
            }
          }
        }
        uint64_t v312 = CWFGetOSLog();
        if (v312)
        {
          uint64_t v313 = CWFGetOSLog();
        }
        else
        {
          uint64_t v313 = MEMORY[0x1E4F14500];
          id v314 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v313, OS_LOG_TYPE_DEFAULT))
        {
          int v594 = 138543362;
          uint64_t v595 = (uint64_t)v59;
          LODWORD(v521) = 12;
          id v519 = &v594;
          _os_log_send_and_compose_impl();
        }
        uint64_t v187 = v313;
      }
      else
      {
LABEL_58:
        uint64_t v186 = objc_msgSend_RNRBSSList(v44, v45, v46, v47, v48);
        long long v577 = 0u;
        long long v578 = 0u;
        long long v579 = 0u;
        long long v580 = 0u;
        uint64_t v187 = v186;
        id v540 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v187, v188, (uint64_t)&v577, (uint64_t)v605, 16);
        if (v540)
        {
          uint64_t v536 = v187;
          uint64_t v539 = *(void *)v578;
          do
          {
            for (uint64_t k = 0; k != v540; uint64_t k = (char *)k + 1)
            {
              if (*(void *)v578 != v539) {
                objc_enumerationMutation(v536);
              }
              uint64_t v194 = *(void **)(*((void *)&v577 + 1) + 8 * (void)k);
              uint64_t v195 = objc_msgSend_channel(v194, v189, v190, v191, v192, v519, v521);
              if (objc_msgSend_is6GHz(v195, v196, v197, v198, v199))
              {
                uint64_t v208 = objc_msgSend_shortSSID(v194, v200, v201, v202, v203);
                if (v208
                  || objc_msgSend_isSameSSID(v194, v204, v205, v206, v207)
                  && (uint64_t v208 = objc_msgSend_shortSSID(v558, v209, v210, v211, v212)) != 0)
                {
                  uint64_t v217 = objc_msgSend_BSSID(v194, v204, v205, v206, v207);
                  if (v217)
                  {
                    uint64_t v542 = k;
                    long long v575 = 0u;
                    long long v576 = 0u;
                    long long v573 = 0u;
                    long long v574 = 0u;
                    objc_msgSend_knownNetworks(v538, v213, v214, v215, v216);
                    id v552 = (id)objc_claimAutoreleasedReturnValue();
                    uint64_t v219 = objc_msgSend_countByEnumeratingWithState_objects_count_(v552, v218, (uint64_t)&v573, (uint64_t)v604, 16);
                    if (v219)
                    {
                      uint64_t v224 = v219;
                      id v556 = v194;
                      uint64_t v562 = *(void *)v574;
                      do
                      {
                        uint64_t v225 = 0;
                        do
                        {
                          if (*(void *)v574 != v562) {
                            objc_enumerationMutation(v552);
                          }
                          uint64_t v226 = *(void **)(*((void *)&v573 + 1) + 8 * v225);
                          if (v208 == objc_msgSend_shortSSID(v226, v220, v221, v222, v223, v519, v521))
                          {
                            int v227 = NSString;
                            uint64_t v228 = objc_msgSend_channel(v195, v220, v221, v222, v223);
                            uint64_t v232 = objc_msgSend_stringWithFormat_(v227, v229, @"%lu/%@/%lu", v230, v231, v208, v217, v228);
                            uint64_t v233 = CWFGetOSLog();
                            if (v233)
                            {
                              CWFGetOSLog();
                              uint64_t v234 = (id)objc_claimAutoreleasedReturnValue();
                            }
                            else
                            {
                              uint64_t v234 = MEMORY[0x1E4F14500];
                              id v235 = MEMORY[0x1E4F14500];
                            }

                            if (os_log_type_enabled(v234, OS_LOG_TYPE_DEFAULT))
                            {
                              int v594 = 138543874;
                              uint64_t v595 = (uint64_t)v558;
                              __int16 v596 = 2114;
                              unint64_t v597 = (unint64_t)v556;
                              __int16 v598 = 2114;
                              uint64_t v599 = (uint64_t)v226;
                              LODWORD(v521) = 32;
                              id v519 = &v594;
                              _os_log_send_and_compose_impl();
                            }

                            uint64_t v239 = objc_msgSend___basicChannelRepresentation_(self, v236, (uint64_t)v195, v237, v238);
                            if (objc_msgSend_containsObject_(v560, v240, (uint64_t)v239, v241, v242))
                            {
                              BOOL v246 = objc_msgSend_objectForKeyedSubscript_(self->_followup6GHzRNRMap, v243, (uint64_t)v232, v244, v245);

                              if (!v246) {
                                objc_msgSend_setObject_forKeyedSubscript_(self->_followup6GHzRNRMap, v247, (uint64_t)v558, (uint64_t)v232, v249);
                              }
                              uint64_t v250 = objc_msgSend___alreadyFoundFollowup6GHzBSSWithSignature_(self, v247, (uint64_t)v232, v248, v249, v519, v521);
                              if (v250)
                              {
                                id v251 = v250;
                                uint64_t v252 = CWFGetOSLog();
                                if (v252)
                                {
                                  CWFGetOSLog();
                                  uint64_t v253 = (id)objc_claimAutoreleasedReturnValue();
                                }
                                else
                                {
                                  uint64_t v253 = MEMORY[0x1E4F14500];
                                  id v303 = MEMORY[0x1E4F14500];
                                }

                                if (os_log_type_enabled(v253, OS_LOG_TYPE_DEFAULT))
                                {
                                  LOWORD(v594) = 0;
                                  LODWORD(v521) = 2;
                                  id v519 = &v594;
                                  _os_log_send_and_compose_impl();
                                }

                                self = v554;
                                uint64_t v308 = v563;
                                if (!v563)
                                {
                                  uint64_t v308 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v304, v305, v306, v307);
                                }
                                id v563 = v308;
                                objc_msgSend_addObject_(v308, v304, (uint64_t)v251, v306, v307, v519, v521);
                              }
                              else
                              {
                                uint64_t v254 = objc_alloc_init(CWFScanParameters);
                                long long v259 = objc_msgSend_networkName(v226, v255, v256, v257, v258);
                                objc_msgSend_setSSID_(v254, v260, (uint64_t)v259, v261, v262);

                                objc_msgSend_setBSSID_(v254, v263, (uint64_t)v217, v264, v265);
                                uint64_t v603 = v239;
                                __int16 v268 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v266, (uint64_t)&v603, 1, v267);
                                objc_msgSend_setChannels_(v254, v269, (uint64_t)v268, v270, v271);

                                objc_msgSend_setBSSType_(v254, v272, 3, v273, v274);
                                objc_msgSend_setPHYMode_(v254, v275, 1, v276, v277);
                                objc_msgSend_setNumberOfScans_(v254, v278, 1, v279, v280);
                                objc_msgSend_setIncludeHiddenNetworks_(v254, v281, 1, v282, v283);
                                objc_msgSend_setAcceptableCacheAge_(v254, v284, 0, v285, v286);
                                objc_msgSend_setDwellTime_(v254, v287, a5, v288, v289);
                                if (objc_msgSend_isUPRActive(v556, v290, v291, v292, v293)) {
                                  objc_msgSend_setScanFlags_(v254, v294, 32, v295, v296);
                                }
                                else {
                                  objc_msgSend_setScanFlags_(v254, v294, 1056, v295, v296);
                                }
                                objc_msgSend_setScanType_(v254, v297, 1, v298, v299);
                                objc_msgSend_addObject_(v547, v300, (uint64_t)v254, v301, v302);

                                id v251 = 0;
                              }
                            }
                            else
                            {
                              uint64_t v309 = CWFGetOSLog();
                              if (v309)
                              {
                                CWFGetOSLog();
                                id v251 = (id)objc_claimAutoreleasedReturnValue();
                              }
                              else
                              {
                                id v251 = MEMORY[0x1E4F14500];
                                id v310 = MEMORY[0x1E4F14500];
                              }

                              if (os_log_type_enabled(v251, OS_LOG_TYPE_DEFAULT))
                              {
                                int v594 = 138543362;
                                uint64_t v595 = (uint64_t)v239;
                                LODWORD(v521) = 12;
                                id v519 = &v594;
                                _os_log_send_and_compose_impl();
                              }
                            }
                          }
                          ++v225;
                        }
                        while (v224 != v225);
                        uint64_t v311 = objc_msgSend_countByEnumeratingWithState_objects_count_(v552, v220, (uint64_t)&v573, (uint64_t)v604, 16);
                        uint64_t v224 = v311;
                      }
                      while (v311);
                    }

                    uint64_t k = v542;
                  }
                }
              }
            }
            id v540 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v536, v189, (uint64_t)&v577, (uint64_t)v605, 16);
          }
          while (v540);
          uint64_t v187 = v536;
        }
        long long v59 = v187;
      }

      uint64_t v42 = v533 + 1;
    }
    while (v533 + 1 != v532);
    uint64_t v315 = objc_msgSend_countByEnumeratingWithState_objects_count_(v528, v38, (uint64_t)&v585, (uint64_t)v608, 16);
    uint64_t v532 = v315;
  }
  while (v315);
LABEL_121:

  if (objc_msgSend_count(v547, v316, v317, v318, v319))
  {
    uint64_t v324 = objc_msgSend_followup6GHzScanChannels(self->_metric, v320, v321, v322, v323);
    uint64_t v523 = v324;
    if (v324)
    {
      uint64_t v329 = objc_msgSend_mutableCopy(v324, v325, v326, v327, v328);
    }
    else
    {
      uint64_t v329 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v325, v326, v327, v328);
    }
    id v531 = v329;

    long long v571 = 0u;
    long long v572 = 0u;
    long long v569 = 0u;
    long long v570 = 0u;
    id v541 = v547;
    uint64_t v332 = objc_msgSend_countByEnumeratingWithState_objects_count_(v541, v331, (uint64_t)&v569, (uint64_t)v602, 16);
    if (v332)
    {
      uint64_t v336 = v332;
      id v537 = 0;
      id v559 = 0;
      uint64_t v337 = MEMORY[0x1E4F14500];
      id v557 = *(id *)v570;
      uint64_t v535 = *MEMORY[0x1E4F28568];
      uint64_t v527 = *MEMORY[0x1E4F28A50];
      uint64_t v534 = *MEMORY[0x1E4F28798];
      do
      {
        id v338 = 0;
        uint64_t v546 = v336;
        do
        {
          if (*(id *)v570 != v557) {
            objc_enumerationMutation(v541);
          }
          uint64_t v339 = *(void **)(*((void *)&v569 + 1) + 8 * (void)v338);
          objc_msgSend_objectForKeyedSubscript_(v554->_followup6GHzScanResultsMap, v333, (uint64_t)v339, v334, v335, v519, v521);
          id v340 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v341 = CWFGetOSLog();
          uint64_t v342 = (void *)v341;
          if (v340)
          {
            if (v341)
            {
              uint64_t v343 = CWFGetOSLog();
            }
            else
            {
              uint64_t v345 = v337;
              uint64_t v343 = v337;
            }

            if (os_log_type_enabled(v343, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v350 = objc_msgSend_SSID(v339, v346, v347, v348, v349);
              uint64_t v543 = objc_msgSend_shortSSID(v339, v351, v352, v353, v354);
              uint64_t v548 = objc_msgSend_BSSID(v339, v355, v356, v357, v358);
              uint64_t v363 = objc_msgSend_redactedForWiFi(v548, v359, v360, v361, v362);
              uint64_t v368 = objc_msgSend_channels(v339, v364, v365, v366, v367);
              objc_msgSend_firstObject(v368, v369, v370, v371, v372);
              uint64_t v374 = v373 = v338;
              int v594 = 138544130;
              uint64_t v595 = (uint64_t)v350;
              __int16 v596 = 2048;
              unint64_t v597 = v543;
              __int16 v598 = 2114;
              uint64_t v599 = (uint64_t)v363;
              __int16 v600 = 2114;
              id v601 = v374;
              LODWORD(v521) = 42;
              id v519 = &v594;
              _os_log_send_and_compose_impl();

              id v338 = v373;
              uint64_t v336 = v546;
            }
            uint64_t v379 = v563;
            if (!v563)
            {
              uint64_t v379 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v375, v376, v377, v378);
            }
            id v563 = v379;
            objc_msgSend_addObjectsFromArray_(v379, v375, (uint64_t)v340, v377, v378, v519, v521);
            self = v554;
          }
          else
          {
            if (v341)
            {
              CWFGetOSLog();
              uint64_t v344 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              uint64_t v380 = v337;
              uint64_t v344 = v337;
            }

            if (os_log_type_enabled(v344, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v385 = objc_msgSend_SSID(v339, v381, v382, v383, v384);
              uint64_t v544 = objc_msgSend_shortSSID(v339, v386, v387, v388, v389);
              uint64_t v549 = objc_msgSend_BSSID(v339, v390, v391, v392, v393);
              objc_msgSend_redactedForWiFi(v549, v394, v395, v396, v397);
              v399 = id v398 = v338;
              uint64_t v404 = objc_msgSend_channels(v339, v400, v401, v402, v403);
              double v409 = objc_msgSend_firstObject(v404, v405, v406, v407, v408);
              int v594 = 138544130;
              uint64_t v595 = (uint64_t)v385;
              __int16 v596 = 2048;
              unint64_t v597 = v544;
              __int16 v598 = 2114;
              uint64_t v599 = (uint64_t)v399;
              __int16 v600 = 2114;
              id v601 = v409;
              LODWORD(v521) = 42;
              id v519 = &v594;
              _os_log_send_and_compose_impl();

              id v338 = v398;
            }

            __uint64_t v410 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
            uint64_t v411 = v554;
            int v416 = objc_msgSend_scanForNetworksHandler(v554, v412, v413, v414, v415);

            id v553 = v338;
            if (v416)
            {
              id v568 = 0;
              id v421 = objc_msgSend___calloutToScanForNetworksWithParameters_scanChannels_error_(v554, v417, (uint64_t)v339, 0, (uint64_t)&v568);
              id v422 = v568;
              uint64_t v550 = v422;
              if (v421)
              {
                uint64_t v427 = objc_msgSend_channels(v339, v423, v424, v425, v426);
                id v432 = objc_msgSend_firstObject(v427, v428, v429, v430, v431);

                objc_msgSend_addObject_(v531, v433, (uint64_t)v432, v434, v435);
                uint64_t v440 = v563;
                if (!v563)
                {
                  uint64_t v440 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v436, v437, v438, v439);
                }
                id v563 = v440;
                objc_msgSend_addObjectsFromArray_(v440, v436, (uint64_t)v421, v438, v439, v519, v521);
                uint64_t v411 = v554;
                objc_msgSend_setObject_forKeyedSubscript_(v554->_followup6GHzScanResultsMap, v441, (uint64_t)v421, (uint64_t)v339, v442);
              }
              else
              {
                uint64_t v447 = (uint64_t)v422;
                uint64_t v448 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v423, v424, v425, v426);

                objc_msgSend_setObject_forKeyedSubscript_(v448, v449, @"Failed to perform 6GHz followup scan", v535, v450);
                objc_msgSend_setObject_forKeyedSubscript_(v448, v451, v447, v527, v452);
                objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v453, v534, 2, (uint64_t)v448);
                id v432 = v559;
                id v537 = v448;
                id v559 = (id)objc_claimAutoreleasedReturnValue();
                uint64_t v411 = v554;
              }
            }
            else
            {
              uint64_t v443 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v417, v418, v419, v420);

              objc_msgSend_setObject_forKeyedSubscript_(v443, v444, @"CWFAutoJoinManager.scanForNetworksHandler() not configured", v535, v445);
              objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v446, v534, 6, (uint64_t)v443);
              id v421 = 0;
              uint64_t v550 = 0;
              id v432 = v559;
              id v537 = v443;
              id v559 = (id)objc_claimAutoreleasedReturnValue();
            }

            __uint64_t v454 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v410;
            uint64_t v459 = objc_msgSend_followup6GHzScanDuration(v411->_metric, v455, v456, v457, v458);
            objc_msgSend_setFollowup6GHzScanDuration_(v411->_metric, v460, v459 + v454 / 0xF4240, v461, v462);
            if (v559)
            {
              uint64_t v471 = objc_msgSend_scanErrors(v554->_metric, v463, v464, v465, v466);
              if (v471)
              {
                uint64_t v472 = objc_msgSend_scanErrors(v554->_metric, v467, v468, v469, v470);
                uint64_t v476 = objc_msgSend_arrayByAddingObject_(v472, v473, (uint64_t)v559, v474, v475);
                objc_msgSend_setScanErrors_(v554->_metric, v477, (uint64_t)v476, v478, v479);
              }
              else
              {
                uint64_t v472 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1C978], v467, (uint64_t)v559, v469, v470);
                objc_msgSend_setScanErrors_(v554->_metric, v480, (uint64_t)v472, v481, v482);
              }
            }
            id v483 = CWFGetOSLog();
            if (v483)
            {
              CWFGetOSLog();
              uint64_t v484 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              uint64_t v485 = v337;
              uint64_t v484 = v337;
            }

            if (os_log_type_enabled(v484, (os_log_type_t)(16 * (v421 == 0))))
            {
              if (v563) {
                uint64_t v490 = "SUCCEEDED";
              }
              else {
                uint64_t v490 = "FAILED";
              }
              uint64_t v491 = objc_msgSend_count(v421, v486, v487, v488, v489, v519, v521);
              objc_msgSend___descriptionForError_(v554, v492, (uint64_t)v559, v493, v494);
              id v495 = (id)objc_claimAutoreleasedReturnValue();
              int v594 = 136446978;
              uint64_t v595 = (uint64_t)v490;
              __int16 v596 = 2048;
              unint64_t v597 = v454 / 0xF4240;
              __int16 v598 = 2048;
              uint64_t v599 = v491;
              __int16 v600 = 2114;
              id v601 = v495;
              LODWORD(v521) = 42;
              id v519 = &v594;
              _os_log_send_and_compose_impl();
            }
            __int16 v496 = CWFGetOSLog();
            if (v496)
            {
              CWFGetOSLog();
              uint64_t v497 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              uint64_t v498 = v337;
              uint64_t v497 = v337;
            }
            self = v554;

            if (os_log_type_enabled(v497, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v503 = objc_msgSend_count(v421, v499, v500, v501, v502);
              int v594 = 134217984;
              uint64_t v595 = v503;
              LODWORD(v521) = 12;
              id v519 = &v594;
              _os_log_send_and_compose_impl();
            }

            long long v566 = 0u;
            long long v567 = 0u;
            long long v564 = 0u;
            long long v565 = 0u;
            id v340 = v421;
            uint64_t v505 = objc_msgSend_countByEnumeratingWithState_objects_count_(v340, v504, (uint64_t)&v564, (uint64_t)v593, 16);
            if (v505)
            {
              uint64_t v506 = v505;
              uint64_t v507 = *(void *)v565;
              do
              {
                for (uint64_t m = 0; m != v506; ++m)
                {
                  if (*(void *)v565 != v507) {
                    objc_enumerationMutation(v340);
                  }
                  uint64_t v509 = *(void *)(*((void *)&v564 + 1) + 8 * m);
                  uint64_t v510 = CWFGetOSLog();
                  if (v510)
                  {
                    CWFGetOSLog();
                    uint64_t v511 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    uint64_t v512 = v337;
                    uint64_t v511 = v337;
                  }

                  if (os_log_type_enabled(v511, OS_LOG_TYPE_DEFAULT))
                  {
                    int v594 = 138543362;
                    uint64_t v595 = v509;
                    LODWORD(v521) = 12;
                    id v519 = &v594;
                    _os_log_send_and_compose_impl();
                  }

                  self = v554;
                }
                uint64_t v506 = objc_msgSend_countByEnumeratingWithState_objects_count_(v340, v513, (uint64_t)&v564, (uint64_t)v593, 16);
              }
              while (v506);
            }

            uint64_t v336 = v546;
            id v338 = v553;
          }

          id v338 = (char *)v338 + 1;
        }
        while (v338 != (id)v336);
        uint64_t v336 = objc_msgSend_countByEnumeratingWithState_objects_count_(v541, v333, (uint64_t)&v569, (uint64_t)v602, 16);
      }
      while (v336);
    }
    else
    {
      id v537 = 0;
      id v559 = 0;
    }

    objc_msgSend_setFollowup6GHzScanChannels_(self->_metric, v514, (uint64_t)v531, v515, v516);
    if (a7)
    {
      uint64_t v330 = v537;
      if (v559)
      {
        id v559 = v559;
        *a7 = v559;
      }
    }
    else
    {
      uint64_t v330 = v537;
    }
  }
  else
  {
    id v559 = 0;
    uint64_t v330 = 0;
  }
  id v517 = v563;

  return v517;
}

- (id)__passpointScanResults:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v5)
  {
    uint64_t v10 = v5;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v3);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend_isPasspoint(v14, v6, v7, v8, v9))
        {
          if (!v11)
          {
            uint64_t v11 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v6, v7, v8, v9);
          }
          objc_msgSend_addObject_(v11, v6, (uint64_t)v14, v8, v9);
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v17, (uint64_t)v21, 16);
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v15 = objc_msgSend_copy(v11, v6, v7, v8, v9);

  return v15;
}

- (BOOL)__isNonPinnedEAPTLSCandidate:(id)a3
{
  uint64_t v5 = objc_msgSend_matchingKnownNetworkProfile(a3, a2, (uint64_t)a3, v3, v4);
  if (!objc_msgSend_isEAP(v5, v6, v7, v8, v9)) {
    goto LABEL_9;
  }
  uint64_t v14 = objc_msgSend_acceptedEAPTypes(v5, v10, v11, v12, v13);
  int v18 = objc_msgSend_containsObject_(v14, v15, (uint64_t)&unk_1F0DC7890, v16, v17);

  uint64_t v23 = objc_msgSend_acceptedEAPTypes(v5, v19, v20, v21, v22);
  int v27 = objc_msgSend_containsObject_(v23, v24, (uint64_t)&unk_1F0DC78A8, v25, v26);

  if (v18 && v27)
  {
    uint64_t v32 = objc_msgSend_acceptedEAPTypes(v5, v28, v29, v30, v31);
    uint64_t v37 = objc_msgSend_count(v32, v33, v34, v35, v36);

    if (v37 != 2)
    {
LABEL_9:
      BOOL v53 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    if ((v18 | v27) != 1) {
      goto LABEL_9;
    }
    uint64_t v42 = objc_msgSend_acceptedEAPTypes(v5, v28, v29, v30, v31);
    uint64_t v47 = objc_msgSend_count(v42, v43, v44, v45, v46);

    if (v47 != 1) {
      goto LABEL_9;
    }
  }
  uint64_t v48 = objc_msgSend_TLSTrustedServerNames(v5, v38, v39, v40, v41);
  BOOL v53 = objc_msgSend_count(v48, v49, v50, v51, v52) == 0;

LABEL_10:
  return v53;
}

- (BOOL)__allowJoinCandidate:(id)a3 context:(id)a4 defer:(BOOL *)a5 error:(id *)a6
{
  uint64_t v211 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  BOOL v204 = 0;
  uint64_t v16 = objc_msgSend_autoJoinParameters(v11, v12, v13, v14, v15);
  uint64_t v21 = objc_msgSend_trigger(v16, v17, v18, v19, v20);

  failedToJoinKnownNetworkIDs = self->_failedToJoinKnownNetworkIDs;
  int v27 = objc_msgSend_matchingKnownNetworkProfile(v10, v23, v24, v25, v26);
  uint64_t v32 = objc_msgSend_identifier(v27, v28, v29, v30, v31);
  LODWORD(failedToJoinKnownNetworkIDs) = objc_msgSend_containsObject_(failedToJoinKnownNetworkIDs, v33, (uint64_t)v32, v34, v35);

  if (failedToJoinKnownNetworkIDs)
  {
    objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v36, v37, v38, v39);
    id v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v40, v41, @"Already failed to auto-join known network profile", *MEMORY[0x1E4F28568], v42);
LABEL_18:
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v43, *MEMORY[0x1E4F28798], 1, (uint64_t)v40);
    id v107 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v108 = 0;
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v44 = objc_msgSend_channel(v10, v36, v37, v38, v39);
  if (objc_msgSend_is6GHz(v44, v45, v46, v47, v48)
    && !objc_msgSend_maxCompatibilityEnabled(self, v49, v50, v51, v52))
  {
    BOOL v99 = objc_msgSend_matchingKnownNetworkProfile(v10, v53, v54, v55, v56);
    int isStandalone6G = objc_msgSend_isStandalone6G(v99, v100, v101, v102, v103);

    if (isStandalone6G) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  uint64_t v61 = objc_msgSend_channel(v10, v57, v58, v59, v60);
  if (objc_msgSend_is6GHz(v61, v62, v63, v64, v65))
  {

    if ((v21 & 0xFFFFFFFFFFFFFFFELL) == 0x36)
    {
      objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v66, v67, v68, v69);
      id v40 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v40, v70, @"6G is not allowed with current trigger", *MEMORY[0x1E4F28568], v71);
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v72 = objc_msgSend_channel(v10, v66, v67, v68, v69);
  char v77 = objc_msgSend_is6GHz(v72, v73, v74, v75, v76);

  if ((v77 & 1) == 0 && v21 == 45)
  {
    objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v78, v79, v80, v81);
    id v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v40, v82, @"non-6G is not allowed with current trigger", *MEMORY[0x1E4F28568], v83);
    goto LABEL_18;
  }
  uint64_t v84 = objc_msgSend_channel(v10, v78, v79, v80, v81);
  if ((objc_msgSend_is6GHz(v84, v85, v86, v87, v88) & 1) == 0)
  {

    goto LABEL_43;
  }
  uint64_t v93 = objc_msgSend_matchingKnownNetworkProfile(v10, v89, v90, v91, v92);
  uint64_t v98 = objc_msgSend_disable6EMode(v93, v94, v95, v96, v97);

  if (v98 == 2)
  {
LABEL_17:
    objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v57, v58, v59, v60);
    id v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v40, v105, @"6G is not allowed with this network", *MEMORY[0x1E4F28568], v106);
    goto LABEL_18;
  }
LABEL_43:
  uint64_t v155 = objc_msgSend_matchingKnownNetworkProfile(v10, v57, v58, v59, v60);
  targetQueue = self->_targetQueue;
  id v203 = 0;
  int v158 = objc_msgSend___allowKnownNetwork_context_allowForSeamlessSSIDTransition_defer_targetQueue_error_(self, v157, (uint64_t)v155, (uint64_t)v11, 0, &v204, targetQueue, &v203);
  id v107 = v203;

  if (v158)
  {
    uint64_t v160 = a6;
    uint64_t v161 = objc_msgSend_matchingKnownNetworkProfile(v10, v109, v159, v110, v111);
    if (objc_msgSend_addReason(v161, v162, v163, v164, v165) == 10
      && ((objc_msgSend_isOpen(v10, v166, v167, v168, v169) & 1) != 0
       || (objc_msgSend_isOWE(v10, v170, v171, v172, v173) & 1) != 0
       || (objc_msgSend_isWAPI(v10, v170, v171, v172, v173) & 1) != 0
       || objc_msgSend_isPSK(v10, v170, v171, v172, v173)
       && ((objc_msgSend_isWEP(v10, v170, v171, v172, v173) & 1) != 0
        || (objc_msgSend_isWPA(v10, v170, v171, v172, v173) & 1) != 0)
       || (objc_msgSend_hasWEP104Cipher(v10, v170, v171, v172, v173) & 1) != 0
       || (objc_msgSend_hasWEP40Cipher(v10, v170, v171, v172, v173) & 1) != 0
       || (objc_msgSend_hasTKIPCipher(v10, v170, v171, v172, v173) & 1) != 0))
    {
      id v174 = objc_msgSend_matchingKnownNetworkProfile(v10, v170, v171, v172, v173);
      uint64_t v179 = objc_msgSend_lastJoinedByUserAt(v174, v175, v176, v177, v178);

      if (!v179)
      {
        objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v180, v181, v182, v183);
        id v40 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v40, v184, @"Carrier-based known network profile with weak security never joined by user", *MEMORY[0x1E4F28568], v185);
        uint64_t v187 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v186, *MEMORY[0x1E4F28798], 1, (uint64_t)v40);

        BOOL v108 = 0;
        id v107 = (id)v187;
        a6 = v160;
        goto LABEL_19;
      }
    }
    else
    {
    }
    uint64_t v188 = objc_msgSend_allowJoinCandidateHandler(self, v180, v181, v182, v183);

    if (v188)
    {
      id v202 = 0;
      char v189 = objc_msgSend___calloutToAllowJoinCandidate_trigger_defer_error_(self, v109, (uint64_t)v10, v21, (uint64_t)&v204, &v202);
      id v40 = v202;
      a6 = v160;
      if (v189)
      {
        BOOL v108 = 1;
      }
      else
      {
        uint64_t v194 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v190, v191, v192, v193);
        objc_msgSend_setObject_forKeyedSubscript_(v194, v195, @"Join candidate is not allowed by daemon", *MEMORY[0x1E4F28568], v196);
        objc_msgSend_setObject_forKeyedSubscript_(v194, v197, (uint64_t)v40, *MEMORY[0x1E4F28A50], v198);
        uint64_t v200 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v199, *MEMORY[0x1E4F28798], 1, (uint64_t)v194);

        BOOL v108 = 0;
        id v107 = (id)v200;
      }
      goto LABEL_19;
    }
    BOOL v108 = 1;
    a6 = v160;
  }
  else
  {
    BOOL v108 = 0;
  }
LABEL_20:
  if (objc_msgSend___isDeferrableJoinCandidate_(self, v109, (uint64_t)v10, v110, v111))
  {
    BOOL v204 = 1;
    if (v108)
    {
LABEL_22:
      if (!a5) {
        goto LABEL_38;
      }
      goto LABEL_31;
    }
  }
  else if (v108)
  {
    goto LABEL_22;
  }
  uint64_t v112 = CWFGetOSLog();
  if (v112)
  {
    uint64_t v113 = CWFGetOSLog();
  }
  else
  {
    uint64_t v113 = MEMORY[0x1E4F14500];
    id v114 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
  {
    id v119 = objc_msgSend_matchingKnownNetworkProfile(v10, v115, v116, v117, v118);
    objc_msgSend_identifier(v119, v120, v121, v122, v123);
    id v201 = v11;
    uint64_t v124 = a5;
    v126 = uint64_t v125 = a6;
    uint64_t v131 = objc_msgSend_redactedForWiFi(v126, v127, v128, v129, v130);
    uint64_t v135 = objc_msgSend___descriptionForError_(self, v132, (uint64_t)v107, v133, v134);
    int v205 = 138543874;
    uint64_t v206 = v131;
    __int16 v207 = 2114;
    id v208 = v135;
    __int16 v209 = 2114;
    id v210 = v10;
    _os_log_send_and_compose_impl();

    a6 = v125;
    a5 = v124;
    id v11 = v201;
  }
  if (a5)
  {
LABEL_31:
    if (v204)
    {
      uint64_t v136 = CWFGetOSLog();
      if (v136)
      {
        uint64_t v137 = CWFGetOSLog();
      }
      else
      {
        uint64_t v137 = MEMORY[0x1E4F14500];
        id v138 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v143 = objc_msgSend_matchingKnownNetworkProfile(v10, v139, v140, v141, v142);
        uint64_t v148 = objc_msgSend_identifier(v143, v144, v145, v146, v147);
        uint64_t v153 = objc_msgSend_redactedForWiFi(v148, v149, v150, v151, v152);
        int v205 = 138543618;
        uint64_t v206 = v153;
        __int16 v207 = 2114;
        id v208 = v10;
        _os_log_send_and_compose_impl();
      }
      *a5 = v204;
    }
  }
LABEL_38:
  if (a6 && v107) {
    *a6 = v107;
  }

  return v108;
}

- (BOOL)__performJoinWithNetwork:(id)a3 context:(id)a4 error:(id *)a5
{
  uint64_t v503 = *MEMORY[0x1E4F143B8];
  uint64_t v487 = (char *)a3;
  id v482 = a4;
  uint64_t v488 = self;
  uint64_t v476 = objc_msgSend_associatedNetwork(self, v7, v8, v9, v10);
  id v11 = CWFGetOSLog();
  if (v11)
  {
    uint64_t v12 = CWFGetOSLog();
  }
  else
  {
    uint64_t v12 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v494 = 138543362;
    id v495 = v487;
    LODWORD(v458) = 12;
    uint64_t v457 = &v494;
    _os_log_send_and_compose_impl();
  }

  __uint64_t v473 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  uint64_t v18 = objc_msgSend_associateToNetworkHandler(v488, v14, v15, v16, v17);

  if (!v18)
  {
    uint64_t v475 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v19, v20, v21, v22);
    objc_msgSend_setObject_forKeyedSubscript_(v475, v61, @"CWFAutoJoinManager.associateToNetworkHandler() not configured", *MEMORY[0x1E4F28568], v62);
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v63, *MEMORY[0x1E4F28798], 6, (uint64_t)v475);
    id v485 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v64 = 0;
    uint64_t v479 = 0;
    int v483 = 0;
    goto LABEL_56;
  }
  uint64_t v479 = objc_alloc_init(CWFAssocParameters);
  objc_msgSend_setScanResult_(v479, v23, (uint64_t)v487, v24, v25);
  uint64_t v30 = objc_msgSend_SSID(v487, v26, v27, v28, v29);
  uint64_t v39 = objc_msgSend_SSID(v476, v31, v32, v33, v34);
  if (v30 == v39)
  {
  }
  else
  {
    uint64_t v44 = objc_msgSend_SSID(v487, v35, v36, v37, v38);
    if (v44)
    {
      uint64_t v49 = objc_msgSend_SSID(v476, v40, v41, v42, v43);
      if (v49)
      {
        uint64_t v50 = objc_msgSend_SSID(v487, v45, v46, v47, v48);
        uint64_t v55 = objc_msgSend_SSID(v476, v51, v52, v53, v54);
        if (objc_msgSend_isEqual_(v50, v56, (uint64_t)v55, v57, v58)) {
          int v60 = 1;
        }
        else {
          int v60 = objc_msgSend___candidateSupportsSeamlessSSIDTransition_fromNetwork_context_(v488, v59, (uint64_t)v487, (uint64_t)v476, (uint64_t)v482);
        }
      }
      else
      {
        int v60 = objc_msgSend___candidateSupportsSeamlessSSIDTransition_fromNetwork_context_(v488, v45, (uint64_t)v487, (uint64_t)v476, (uint64_t)v482);
      }

      if (v60) {
        goto LABEL_20;
      }
LABEL_15:
      BOOL v70 = 0;
      goto LABEL_41;
    }
    char v69 = objc_msgSend___candidateSupportsSeamlessSSIDTransition_fromNetwork_context_(v488, v40, (uint64_t)v487, (uint64_t)v476, (uint64_t)v482);

    if ((v69 & 1) == 0) {
      goto LABEL_15;
    }
  }
LABEL_20:
  uint64_t v71 = objc_msgSend_colocatedScopeID(v488, v65, v66, v67, v68, v457, v458);
  objc_msgSend_setColocatedScopeID_(v479, v72, (uint64_t)v71, v73, v74);

  uint64_t v79 = objc_msgSend_autoJoinParameters(v482, v75, v76, v77, v78);
  if (objc_msgSend_trigger(v79, v80, v81, v82, v83) == 54)
  {
  }
  else
  {
    uint64_t v88 = objc_msgSend_autoJoinParameters(v482, v84, v85, v86, v87);
    BOOL v70 = objc_msgSend_trigger(v88, v89, v90, v91, v92) == 55;

    if (!v70) {
      goto LABEL_41;
    }
  }
  long long v492 = 0u;
  long long v493 = 0u;
  long long v490 = 0u;
  long long v491 = 0u;
  uint64_t v93 = objc_msgSend_autoJoinParameters(v482, v65, v66, v67, v68);
  objc_msgSend_preferredChannels(v93, v94, v95, v96, v97);
  id obj = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v484 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v98, (uint64_t)&v490, (uint64_t)v502, 16);
  if (v484)
  {
    uint64_t v480 = *(void *)v491;
LABEL_25:
    uint64_t v102 = 0;
    while (1)
    {
      if (*(void *)v491 != v480) {
        objc_enumerationMutation(obj);
      }
      uint64_t v103 = *(void *)(*((void *)&v490 + 1) + 8 * v102);
      objc_msgSend___basicChannelRepresentation_(v488, v99, v103, v100, v101);
      id v486 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v108 = objc_msgSend_channel(v487, v104, v105, v106, v107);
      objc_msgSend___basicChannelRepresentation_(v488, v109, (uint64_t)v108, v110, v111);
      id v115 = (id)objc_claimAutoreleasedReturnValue();
      if (v486 == v115)
      {

LABEL_39:
        objc_msgSend_setForceBSSID_(v479, v146, 1, v147, v148);
        goto LABEL_40;
      }
      id v120 = objc_msgSend___basicChannelRepresentation_(v488, v112, v103, v113, v114);
      if (v120)
      {
        uint64_t v121 = objc_msgSend_channel(v487, v116, v117, v118, v119);
        uint64_t v128 = objc_msgSend___basicChannelRepresentation_(v488, v122, (uint64_t)v121, v123, v124);
        if (v128)
        {
          uint64_t v129 = objc_msgSend___basicChannelRepresentation_(v488, v125, v103, v126, v127);
          uint64_t v134 = objc_msgSend_channel(v487, v130, v131, v132, v133);
          id v138 = objc_msgSend___basicChannelRepresentation_(v488, v135, (uint64_t)v134, v136, v137);
          char isEqual = objc_msgSend_isEqual_(v129, v139, (uint64_t)v138, v140, v141);

          if (isEqual) {
            goto LABEL_39;
          }
          goto LABEL_35;
        }
      }
LABEL_35:
      if (v484 == ++v102)
      {
        uint64_t v484 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v99, (uint64_t)&v490, (uint64_t)v502, 16);
        if (v484) {
          goto LABEL_25;
        }
        break;
      }
    }
  }

  objc_msgSend_setBandPreference_(v479, v143, 4, v144, v145);
LABEL_40:
  BOOL v70 = 1;
LABEL_41:
  uint64_t v149 = objc_msgSend_autoJoinParameters(v482, v65, v66, v67, v68, v457, v458);
  if (objc_msgSend_mode(v149, v150, v151, v152, v153) == 2
    && !objc_msgSend_BSSChannelsOnly(v482, v154, v155, v156, v157))
  {
  }
  else
  {
    char v158 = objc_msgSend_didForceAllRemainingChannels(v482, v154, v155, v156, v157);

    if ((v158 & 1) == 0) {
      goto LABEL_48;
    }
  }
  uint64_t v163 = objc_msgSend_allObjects(v488->_cumulativeScanResults, v159, v160, v161, v162);
  char v164 = CWFScanResultHas6GHzOnlyBSS(v487, v163, &unk_1F0DA4250);

  if (v164)
  {
    uint64_t v64 = 1;
LABEL_49:
    objc_msgSend_setHas6GHzOnlyBSS_(v479, v159, 1, v161, v162);
    goto LABEL_50;
  }
LABEL_48:
  uint64_t v165 = objc_msgSend_matchingKnownNetworkProfile(v487, v159, v160, v161, v162);
  int v170 = objc_msgSend_wasRecently6GHzOnlyOnAnyDevice(v165, v166, v167, v168, v169);

  uint64_t v64 = 0;
  if (v170) {
    goto LABEL_49;
  }
LABEL_50:
  id v489 = 0;
  int v483 = objc_msgSend___calloutToAssociateWithParameters_error_(v488, v159, (uint64_t)v479, (uint64_t)&v489, v162);
  id v175 = v489;
  if (v483)
  {
    if (v70)
    {
      uint64_t v176 = v488;
      objc_sync_enter(v176);
      uint64_t v181 = objc_msgSend_copy(v476, v177, v178, v179, v180);
      steerFromNetworuint64_t k = v176->_steerFromNetwork;
      v176->_steerFromNetworuint64_t k = (CWFScanResult *)v181;

      uint64_t v187 = objc_msgSend_copy(v487, v183, v184, v185, v186);
      steerToNetworuint64_t k = v176->_steerToNetwork;
      v176->_steerToNetworuint64_t k = (CWFScanResult *)v187;

      objc_sync_exit(v176);
    }
    uint64_t v475 = 0;
    id v485 = 0;
  }
  else
  {
    uint64_t v475 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v171, v172, v173, v174);
    objc_msgSend_setObject_forKeyedSubscript_(v475, v189, @"Failed to join to network", *MEMORY[0x1E4F28568], v190);
    uint64_t v191 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v196 = objc_msgSend_code(v175, v192, v193, v194, v195);
    objc_msgSend_errorWithDomain_code_userInfo_(v191, v197, *MEMORY[0x1E4F28798], v196, (uint64_t)v475);
    id v485 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_56:
  __uint64_t v198 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  uint64_t v203 = objc_msgSend_joinDuration(v488->_metric, v199, v200, v201, v202);
  unint64_t v469 = (v198 - v473) / 0xF4240;
  objc_msgSend_setJoinDuration_(v488->_metric, v204, v203 + v469, v205, v206);
  if (v485)
  {
    uint64_t v215 = objc_msgSend_joinErrors(v488->_metric, v207, v208, v209, v210);
    if (v215)
    {
      uint64_t v216 = objc_msgSend_joinErrors(v488->_metric, v211, v212, v213, v214);
      uint64_t v220 = objc_msgSend_arrayByAddingObject_(v216, v217, (uint64_t)v485, v218, v219);
      objc_msgSend_setJoinErrors_(v488->_metric, v221, (uint64_t)v220, v222, v223);
    }
    else
    {
      uint64_t v216 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1C978], v211, (uint64_t)v485, v213, v214);
      objc_msgSend_setJoinErrors_(v488->_metric, v224, (uint64_t)v216, v225, v226);
    }
  }
  int v227 = NSString;
  uint64_t v228 = objc_msgSend_shortSSID(v487, v207, v208, v209, v210, v457, v458);
  uint64_t v233 = objc_msgSend_BSSID(v487, v229, v230, v231, v232);
  uint64_t v238 = objc_msgSend_channel(v487, v234, v235, v236, v237);
  uint64_t v243 = objc_msgSend_channel(v238, v239, v240, v241, v242);
  uint64_t v481 = objc_msgSend_stringWithFormat_(v227, v244, @"%lu/%@/%lu", v245, v246, v228, v233, v243);

  objc_msgSend_objectForKeyedSubscript_(v488->_followup6GHzRNRMap, v247, (uint64_t)v481, v248, v249);
  id obja = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v470 = objc_msgSend_objectForKeyedSubscript_(v488->_followup6GHzFILSDMap, v250, (uint64_t)v481, v251, v252);
  uint64_t v257 = objc_msgSend_maxCompatibilityEnabled(v488, v253, v254, v255, v256);
  objc_msgSend_setWas6EPreferOn_(v488->_metric, v258, v257, v259, v260);
  uint64_t v474 = objc_msgSend_matchingKnownNetworkProfile(v487, v261, v262, v263, v264);
  BOOL v269 = objc_msgSend_disable6EMode(v474, v265, v266, v267, v268) == 2;
  objc_msgSend_setWas6EDisabled_(v488->_metric, v270, v269, v271, v272);
  if (v483)
  {
    uint64_t v277 = objc_msgSend_channel(obja, v273, v274, v275, v276);
    objc_msgSend___updateRNRChannel_has6GHzOnlyBSS_joinCandidate_(v488, v278, (uint64_t)v277, v64, (uint64_t)v487);

    uint64_t v283 = objc_msgSend_channel(v487, v279, v280, v281, v282);
    if (objc_msgSend_is6GHz(v283, v284, v285, v286, v287))
    {
      char v292 = objc_msgSend_allowStandalone6GHz(v482, v288, v289, v290, v291);

      if ((v292 & 1) == 0) {
        objc_msgSend_setWas6GHzDeprioritized_(v488->_metric, v293, 0, v295, v296);
      }
    }
    else
    {
    }
    id v297 = objc_msgSend_associatedNetwork(v488, v293, v294, v295, v296);
    uint64_t v302 = objc_msgSend_SSID(v297, v298, v299, v300, v301);
    uint64_t v311 = objc_msgSend_SSID(v487, v303, v304, v305, v306);
    if (v302 == v311)
    {
      objc_msgSend_setDidTriggerReassoc_(v488->_metric, v307, 1, v309, v310);
    }
    else
    {
      uint64_t v312 = objc_msgSend_associatedNetwork(v488, v307, v308, v309, v310);
      uint64_t v321 = objc_msgSend_SSID(v312, v313, v314, v315, v316);
      if (v321)
      {
        uint64_t v326 = objc_msgSend_SSID(v487, v317, v318, v319, v320);
        if (v326)
        {
          uint64_t v327 = objc_msgSend_associatedNetwork(v488, v322, v323, v324, v325);
          uint64_t v332 = objc_msgSend_SSID(v327, v328, v329, v330, v331);
          uint64_t v337 = objc_msgSend_SSID(v487, v333, v334, v335, v336);
          uint64_t v341 = objc_msgSend_isEqual_(v332, v338, (uint64_t)v337, v339, v340);
          objc_msgSend_setDidTriggerReassoc_(v488->_metric, v342, v341, v343, v344);
        }
        else
        {
          objc_msgSend_setDidTriggerReassoc_(v488->_metric, v322, 0, v324, v325);
        }
      }
      else
      {
        objc_msgSend_setDidTriggerReassoc_(v488->_metric, v317, 0, v319, v320);
      }
    }
    if ((objc_msgSend_didTriggerReassoc(v488->_metric, v345, v346, v347, v348) & 1) == 0)
    {
      uint64_t v350 = objc_msgSend_colocatedScopeID(v479, v273, v349, v275, v276);
      objc_msgSend_setDidPerformSeamlessSSIDTransition_(v488->_metric, v351, v350 != 0, v352, v353);
    }
  }
  if (obja)
  {
    objc_msgSend_setWasDiscoveredViaRNR_(v488->_metric, v273, 1, v275, v276);
  }
  else if (v470)
  {
    objc_msgSend_setWasDiscoveredViaFILSD_(v488->_metric, v273, 1, v275, v276);
  }
  objc_msgSend_setNetwork_(v488->_metric, v273, (uint64_t)v487, v275, v276);
  uint64_t v358 = objc_msgSend_associatedNetwork(v488, v354, v355, v356, v357);
  uint64_t v363 = objc_msgSend_BSSID(v358, v359, v360, v361, v362);
  uint64_t v372 = objc_msgSend_BSSID(v487, v364, v365, v366, v367);
  if (v363 == v372)
  {

    goto LABEL_106;
  }
  uint64_t v471 = objc_msgSend_BSSID(v358, v368, v369, v370, v371);
  if (v471)
  {
    uint64_t v468 = objc_msgSend_BSSID(v487, v373, v374, v375, v376);
    if (v468)
    {
      id v463 = objc_msgSend_BSSID(v358, v373, v374, v375, v376);
      uint64_t v464 = objc_msgSend_BSSID(v487, v377, v378, v379, v380);
      if (objc_msgSend_isEqual_(v463, v381, (uint64_t)v464, v382, v383))
      {

        goto LABEL_106;
      }
      int v467 = 1;
    }
    else
    {
      uint64_t v468 = 0;
      int v467 = 0;
    }
  }
  else
  {
    int v467 = 0;
  }
  uint64_t v384 = objc_msgSend_matchingKnownNetworkProfile(v358, v373, v374, v375, v376);
  uint64_t v389 = objc_msgSend_identifier(v384, v385, v386, v387, v388);
  double v394 = objc_msgSend_matchingKnownNetworkProfile(v487, v390, v391, v392, v393);
  uint64_t v403 = objc_msgSend_identifier(v394, v395, v396, v397, v398);
  if (v389 == v403)
  {
    int v466 = 1;
  }
  else
  {
    uint64_t v465 = objc_msgSend_matchingKnownNetworkProfile(v358, v399, v400, v401, v402);
    uint64_t v412 = objc_msgSend_identifier(v465, v404, v405, v406, v407);
    if (v412)
    {
      uint64_t v462 = objc_msgSend_matchingKnownNetworkProfile(v487, v408, v409, v410, v411);
      uint64_t v461 = objc_msgSend_identifier(v462, v413, v414, v415, v416);
      if (v461)
      {
        uint64_t v460 = objc_msgSend_matchingKnownNetworkProfile(v358, v417, v418, v419, v420);
        uint64_t v459 = objc_msgSend_identifier(v460, v421, v422, v423, v424);
        uint64_t v429 = objc_msgSend_matchingKnownNetworkProfile(v487, v425, v426, v427, v428);
        uint64_t v434 = objc_msgSend_identifier(v429, v430, v431, v432, v433);
        int v466 = objc_msgSend_isEqual_(v459, v435, (uint64_t)v434, v436, v437);
      }
      else
      {
        int v466 = 0;
      }
    }
    else
    {
      int v466 = 0;
    }
  }
  if (v467)
  {

    if (!v471) {
      goto LABEL_101;
    }
LABEL_104:

    if ((v466 & 1) == 0) {
      goto LABEL_106;
    }
    goto LABEL_105;
  }
  if (v471) {
    goto LABEL_104;
  }
LABEL_101:

  if (v466) {
LABEL_105:
  }
    objc_msgSend_setNetwork_(v488->_metric, v438, (uint64_t)v358, v439, v440);
LABEL_106:
  uint64_t v441 = CWFGetOSLog();
  if (v441)
  {
    uint64_t v442 = CWFGetOSLog();
  }
  else
  {
    uint64_t v442 = MEMORY[0x1E4F14500];
    id v443 = MEMORY[0x1E4F14500];
  }

  if (v483) {
    os_log_type_t v444 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v444 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(v442, v444))
  {
    if (v483) {
      uint64_t v448 = "SUCCEEDED";
    }
    else {
      uint64_t v448 = "FAILED";
    }
    uint64_t v449 = objc_msgSend___descriptionForError_(v488, v445, (uint64_t)v485, v446, v447);
    __uint64_t v454 = objc_msgSend_network(v488->_metric, v450, v451, v452, v453);
    int v494 = 136446978;
    id v495 = v448;
    __int16 v496 = 2048;
    unint64_t v497 = v469;
    __int16 v498 = 2114;
    uint64_t v499 = v449;
    __int16 v500 = 2114;
    uint64_t v501 = v454;
    _os_log_send_and_compose_impl();
  }
  BOOL v455 = v485 == 0;
  if (!a5) {
    BOOL v455 = 1;
  }
  if (!v455) {
    *a5 = v485;
  }

  return v483;
}

- (void)__sortJoinCandidates:(id)a3 context:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA48];
  id v138 = a3;
  uint64_t v12 = objc_msgSend_array(v7, v8, v9, v10, v11);
  uint64_t v17 = objc_msgSend_autoJoinParameters(v6, v13, v14, v15, v16);
  uint64_t v139 = v6;
  if (objc_msgSend_trigger(v17, v18, v19, v20, v21) == 54)
  {
  }
  else
  {
    uint64_t v30 = objc_msgSend_autoJoinParameters(v6, v22, v23, v24, v25);
    uint64_t v35 = objc_msgSend_trigger(v30, v31, v32, v33, v34);

    if (v35 != 55) {
      goto LABEL_5;
    }
  }
  uint64_t v36 = objc_msgSend_associatedNetwork(self, v26, v27, v28, v29);
  uint64_t v41 = objc_msgSend_SSID(v36, v37, v38, v39, v40);
  uint64_t v42 = (void *)MEMORY[0x1E4F29008];
  v145[0] = MEMORY[0x1E4F143A8];
  v145[1] = 3221225472;
  v145[2] = sub_1B4FAAE78;
  v145[3] = &unk_1E60BB800;
  id v146 = v41;
  id v43 = v41;
  uint64_t v45 = objc_msgSend_sortDescriptorWithKey_ascending_comparator_(v42, v44, 0, 0, (uint64_t)v145);
  objc_msgSend_addObject_(v12, v46, (uint64_t)v45, v47, v48);
  uint64_t v50 = objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x1E4F29008], v49, @"matchingKnownNetworkProfile", 0, (uint64_t)&unk_1F0DA4270);
  objc_msgSend_addObject_(v12, v51, (uint64_t)v50, v52, v53);
  uint64_t v54 = (void *)MEMORY[0x1E4F29008];
  v143[0] = MEMORY[0x1E4F143A8];
  v143[1] = 3221225472;
  v143[2] = sub_1B4FAB06C;
  v143[3] = &unk_1E60BB800;
  id v144 = v36;
  id v55 = v36;
  uint64_t v57 = objc_msgSend_sortDescriptorWithKey_ascending_comparator_(v54, v56, 0, 0, (uint64_t)v143);
  objc_msgSend_addObject_(v12, v58, (uint64_t)v57, v59, v60);
  uint64_t v62 = objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x1E4F29008], v61, 0, 0, (uint64_t)&unk_1F0DA4290);
  objc_msgSend_addObject_(v12, v63, (uint64_t)v62, v64, v65);

LABEL_5:
  uint64_t v67 = objc_msgSend_joinCandidateComparator(self, v26, v27, v28, v29);
  if (v67)
  {
    uint64_t v68 = objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x1E4F29008], v66, 0, 0, v67);
    objc_msgSend_addObject_(v12, v69, (uint64_t)v68, v70, v71);
  }
  uint64_t v137 = objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x1E4F29008], v66, @"matchingKnownNetworkProfile", 0, (uint64_t)&unk_1F0DA2890);
  objc_msgSend_addObject_(v12, v72, (uint64_t)v137, v73, v74);
  uint64_t v136 = objc_msgSend_sortDescriptorWithKey_ascending_selector_(MEMORY[0x1E4F29008], v75, 0, 0, (uint64_t)sel_compareLowDataModes_);
  objc_msgSend_addObject_(v12, v76, (uint64_t)v136, v77, v78);
  uint64_t v135 = objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x1E4F29008], v79, 0, 0, (uint64_t)&unk_1F0DA31F0);
  objc_msgSend_addObject_(v12, v80, (uint64_t)v135, v81, v82);
  uint64_t v134 = objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x1E4F29008], v83, 0, 0, (uint64_t)&unk_1F0DA3590);
  objc_msgSend_addObject_(v12, v84, (uint64_t)v134, v85, v86);
  uint64_t v88 = objc_msgSend_sortDescriptorWithKey_ascending_selector_(MEMORY[0x1E4F29008], v87, 0, 0, (uint64_t)sel_compareSupportedPHYModes_);
  objc_msgSend_addObject_(v12, v89, (uint64_t)v88, v90, v91);
  v142[0] = MEMORY[0x1E4F143A8];
  v142[1] = 3221225472;
  v142[2] = sub_1B4FAB724;
  v142[3] = &unk_1E60BC418;
  v142[4] = self;
  objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x1E4F29008], v92, @"channel", 0, (uint64_t)v142);
  uint64_t v93 = v133 = (void *)v67;
  objc_msgSend_addObject_(v12, v94, (uint64_t)v93, v95, v96);
  uint64_t v98 = objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x1E4F29008], v97, 0, 0, (uint64_t)&unk_1F0DA35F0);
  objc_msgSend_addObject_(v12, v99, (uint64_t)v98, v100, v101);
  uint64_t v103 = objc_msgSend_sortDescriptorWithKey_ascending_selector_(MEMORY[0x1E4F29008], v102, @"matchingKnownNetworkProfile", 0, (uint64_t)sel_compareSupportedSecurityTypes_);
  objc_msgSend_addObject_(v12, v104, (uint64_t)v103, v105, v106);
  BOOL v108 = objc_msgSend_sortDescriptorWithKey_ascending_selector_(MEMORY[0x1E4F29008], v107, 0, 0, (uint64_t)sel_compareSupportedSecurityTypes_);
  objc_msgSend_addObject_(v12, v109, (uint64_t)v108, v110, v111);
  uint64_t v116 = objc_msgSend_associatedNetwork(self, v112, v113, v114, v115);
  uint64_t v117 = (void *)MEMORY[0x1E4F29008];
  v140[0] = MEMORY[0x1E4F143A8];
  v140[1] = 3221225472;
  v140[2] = sub_1B4FABB18;
  v140[3] = &unk_1E60BB800;
  id v141 = v116;
  id v118 = v116;
  id v120 = objc_msgSend_sortDescriptorWithKey_ascending_comparator_(v117, v119, 0, 0, (uint64_t)v140);
  objc_msgSend_addObject_(v12, v121, (uint64_t)v120, v122, v123);
  uint64_t v126 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E4F29008], v124, @"RSSI", 0, v125);
  objc_msgSend_addObject_(v12, v127, (uint64_t)v126, v128, v129);
  objc_msgSend_sortUsingDescriptors_(v138, v130, (uint64_t)v12, v131, v132);
}

- (id)__morePreferredKnownNetworksWithCandidate:(id)a3 knownNetworks:(id)a4 context:(id)a5
{
  uint64_t v193 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v14 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v10, v11, v12, v13);
  uint64_t v184 = v9;
  uint64_t v19 = objc_msgSend_autoJoinParameters(v9, v15, v16, v17, v18);
  uint64_t v24 = objc_msgSend_trigger(v19, v20, v21, v22, v23);

  uint64_t v181 = objc_msgSend_lastJoinedAt(v7, v25, v26, v27, v28);
  uint64_t v180 = objc_msgSend_lastDiscoveredAt(v7, v29, v30, v31, v32);
  uint64_t v187 = objc_msgSend_networkGroupID(v7, v33, v34, v35, v36);
  unint64_t v182 = objc_msgSend_networkGroupPriority(v7, v37, v38, v39, v40);
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v41, v42, v43, v44);
  double v46 = v45;
  long long v188 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  id obj = v8;
  uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v188, (uint64_t)v192, 16);
  if (v48)
  {
    uint64_t v53 = v48;
    uint64_t v54 = *(void *)v189;
    unint64_t v185 = v24 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      uint64_t v55 = 0;
      do
      {
        if (*(void *)v189 != v54) {
          objc_enumerationMutation(obj);
        }
        uint64_t v56 = *(void **)(*((void *)&v188 + 1) + 8 * v55);
        uint64_t v57 = objc_msgSend_identifier(v7, v49, v50, v51, v52);
        uint64_t v62 = objc_msgSend_identifier(v56, v58, v59, v60, v61);
        char isEqual = objc_msgSend_isEqual_(v57, v63, (uint64_t)v62, v64, v65);

        if ((isEqual & 1) == 0 && (objc_msgSend_isPersonalHotspot(v56, v49, v50, v51, v52) & 1) == 0)
        {
          if (objc_msgSend_compareUserPriority_(v7, v49, (uint64_t)v56, v51, v52) == -1)
          {
            uint64_t v80 = objc_msgSend_addedAt(v56, v67, v68, v69, v70);
            uint64_t v85 = objc_msgSend_lastJoinedAt(v56, v81, v82, v83, v84);
            uint64_t v90 = objc_msgSend_lastDiscoveredAt(v56, v86, v87, v88, v89);
            objc_msgSend_timeIntervalSinceReferenceDate(v85, v91, v92, v93, v94);
            if (v46 - v99 < 1209600.0) {
              goto LABEL_27;
            }
            objc_msgSend_timeIntervalSinceReferenceDate(v90, v95, v96, v97, v98);
            if (v46 - v104 < 1209600.0) {
              goto LABEL_27;
            }
            objc_msgSend_timeIntervalSinceReferenceDate(v80, v100, v101, v102, v103);
            if (v46 - v109 < 1209600.0) {
              goto LABEL_27;
            }
            objc_msgSend_timeIntervalSinceReferenceDate(v85, v105, v106, v107, v108);
            double v111 = v110;
            objc_msgSend_timeIntervalSinceReferenceDate(v181, v112, v113, v114, v115);
            if (v111 > v120) {
              goto LABEL_27;
            }
            objc_msgSend_timeIntervalSinceReferenceDate(v90, v116, v117, v118, v119);
            double v122 = v121;
            objc_msgSend_timeIntervalSinceReferenceDate(v180, v123, v124, v125, v126);
            if (v122 > v131) {
              goto LABEL_27;
            }
            if (!v85 || !v181) {
              goto LABEL_22;
            }
            objc_msgSend_timeIntervalSinceReferenceDate(v85, v127, v128, v129, v130);
            double v133 = floor(v132);
            objc_msgSend_timeIntervalSinceReferenceDate(v181, v134, v135, v136, v137);
            double v139 = v133 - floor(v138);
            objc_msgSend_timeIntervalSinceReferenceDate(v85, v140, v141, v142, v143);
            double v145 = floor(v144);
            objc_msgSend_timeIntervalSinceReferenceDate(v181, v146, v147, v148, v149);
            double v151 = v145 - floor(v150);
            if (v139 < 0.0) {
              double v151 = -v151;
            }
            if (v151 < 1209600.0)
            {
LABEL_27:
              char v152 = 0;
            }
            else
            {
LABEL_22:
              char v152 = 1;
              if (v90 && v180)
              {
                objc_msgSend_timeIntervalSinceReferenceDate(v90, v127, v128, v129, v130);
                double v154 = floor(v153);
                objc_msgSend_timeIntervalSinceReferenceDate(v180, v155, v156, v157, v158);
                double v160 = v154 - floor(v159);
                objc_msgSend_timeIntervalSinceReferenceDate(v90, v161, v162, v163, v164);
                double v166 = floor(v165);
                objc_msgSend_timeIntervalSinceReferenceDate(v180, v167, v168, v169, v170);
                double v172 = v166 - floor(v171);
                if (v160 < 0.0) {
                  double v172 = -v172;
                }
                if (v172 < 1209600.0) {
                  goto LABEL_27;
                }
                char v152 = 1;
              }
            }

            if (v185 == 52 || (v152 & 1) != 0) {
              goto LABEL_35;
            }
LABEL_30:
            if (objc_msgSend___allowKnownNetwork_context_allowForSeamlessSSIDTransition_defer_targetQueue_error_(self, v49, (uint64_t)v56, (uint64_t)v184, 0, 0, self->_targetQueue, 0))
            {
              if (!v14)
              {
                uint64_t v14 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v49, v50, v51, v52);
              }
              objc_msgSend_addObject_(v14, v49, (uint64_t)v56, v51, v52);
            }
            goto LABEL_35;
          }
          uint64_t v71 = objc_msgSend_networkGroupID(v56, v67, v68, v69, v70);
          if ((objc_msgSend_isEqualToString_(v187, v72, (uint64_t)v71, v73, v74) & 1) == 0)
          {

            goto LABEL_35;
          }
          unint64_t v79 = objc_msgSend_networkGroupPriority(v56, v75, v76, v77, v78);

          if (v182 < v79) {
            goto LABEL_30;
          }
        }
LABEL_35:
        ++v55;
      }
      while (v53 != v55);
      uint64_t v173 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v49, (uint64_t)&v188, (uint64_t)v192, 16);
      uint64_t v53 = v173;
    }
    while (v173);
  }

  uint64_t v178 = objc_msgSend_copy(v14, v174, v175, v176, v177);
  return v178;
}

- (BOOL)__connectToHotspot:(id)a3 error:(id *)a4
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v6 = (char *)a3;
  id v7 = CWFGetOSLog();
  if (v7)
  {
    id v8 = CWFGetOSLog();
  }
  else
  {
    id v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v82 = 138543362;
    uint64_t v83 = v6;
    int v80 = 12;
    unint64_t v79 = &v82;
    _os_log_send_and_compose_impl();
  }

  __uint64_t v10 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  uint64_t v15 = objc_msgSend_connectToHotspotHandler(self, v11, v12, v13, v14);

  if (v15)
  {
    id v81 = 0;
    LODWORD(v15) = objc_msgSend___calloutToConnectToHotspot_error_(self, v16, (uint64_t)v6, (uint64_t)&v81, v19);
    id v24 = v81;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    if ((v15 & 1) == 0)
    {
      uint64_t v25 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v20, v21, v22, v23);
      objc_msgSend_setObject_forKeyedSubscript_(v25, v27, @"Failed to connect to hotspot", *MEMORY[0x1E4F28568], v28);
      uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v30 = *MEMORY[0x1E4F28798];
      uint64_t v35 = objc_msgSend_code(v24, v31, v32, v33, v34);
      uint64_t v26 = objc_msgSend_errorWithDomain_code_userInfo_(v29, v36, v30, v35, (uint64_t)v25);
    }
  }
  else
  {
    uint64_t v25 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v16, v17, v18, v19);
    objc_msgSend_setObject_forKeyedSubscript_(v25, v37, @"CWFAutoJoinManager.connectToHotspotHandler() not configured", *MEMORY[0x1E4F28568], v38);
    uint64_t v26 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v39, *MEMORY[0x1E4F28798], 6, (uint64_t)v25);
  }
  __uint64_t v40 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v10;
  uint64_t v45 = objc_msgSend_autoHotspotJoinDuration(self->_metric, v41, v42, v43, v44);
  objc_msgSend_setAutoHotspotJoinDuration_(self->_metric, v46, v45 + v40 / 0xF4240, v47, v48);
  if (v26)
  {
    uint64_t v57 = objc_msgSend_autoHotspotJoinErrors(self->_metric, v49, v50, v51, v52);
    if (v57)
    {
      uint64_t v58 = objc_msgSend_autoHotspotJoinErrors(self->_metric, v53, v54, v55, v56);
      uint64_t v62 = objc_msgSend_arrayByAddingObject_(v58, v59, (uint64_t)v26, v60, v61);
      objc_msgSend_setAutoHotspotJoinErrors_(self->_metric, v63, (uint64_t)v62, v64, v65);
    }
    else
    {
      uint64_t v58 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1C978], v53, (uint64_t)v26, v55, v56);
      objc_msgSend_setAutoHotspotJoinErrors_(self->_metric, v66, (uint64_t)v58, v67, v68);
    }
  }
  objc_msgSend_setHotspot_(self->_metric, v49, (uint64_t)v6, v51, v52, v79, v80);
  uint64_t v69 = CWFGetOSLog();
  if (v69)
  {
    uint64_t v70 = CWFGetOSLog();
  }
  else
  {
    uint64_t v70 = MEMORY[0x1E4F14500];
    id v71 = MEMORY[0x1E4F14500];
  }

  if (v15) {
    os_log_type_t v72 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v72 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(v70, v72))
  {
    if (v15) {
      uint64_t v76 = "SUCCEEDED";
    }
    else {
      uint64_t v76 = "FAILED";
    }
    uint64_t v77 = objc_msgSend___descriptionForError_(self, v73, (uint64_t)v26, v74, v75);
    int v82 = 136446978;
    uint64_t v83 = v76;
    __int16 v84 = 2048;
    unint64_t v85 = v40 / 0xF4240;
    __int16 v86 = 2114;
    uint64_t v87 = v77;
    __int16 v88 = 2114;
    uint64_t v89 = v6;
    _os_log_send_and_compose_impl();
  }
  if (a4 && v26) {
    *a4 = v26;
  }

  return v15;
}

- (id)__browseForHotspotsWithTimeout:(unint64_t)a3 maxCacheAge:(unint64_t)a4 cacheOnly:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  __uint64_t v10 = CWFGetOSLog();
  if (v10)
  {
    uint64_t v11 = CWFGetOSLog();
  }
  else
  {
    uint64_t v11 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      uint64_t v13 = " [cache-only]";
    }
    else {
      uint64_t v13 = "";
    }
    int v95 = 136446722;
    uint64_t v96 = (uint64_t)v13;
    __int16 v97 = 2048;
    unint64_t v98 = a3;
    __int16 v99 = 2048;
    unint64_t v100 = a4;
    int v85 = 32;
    __int16 v84 = &v95;
    _os_log_send_and_compose_impl();
  }

  __uint64_t v14 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  uint64_t v19 = objc_msgSend_browseForHotspotsHandler(self, v15, v16, v17, v18);

  if (v19)
  {
    id v93 = 0;
    id v24 = objc_msgSend___calloutToBrowseForHotspotsWithTimeout_maxCacheAge_cacheOnly_error_(self, v20, a3, a4, v6, &v93);
    id v29 = v93;
    if (v24)
    {
      id v30 = v24;
      __int16 v86 = 0;
      uint64_t v31 = 0;
    }
    else
    {
      uint64_t v36 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v25, v26, v27, v28);
      objc_msgSend_setObject_forKeyedSubscript_(v36, v37, @"Failed to browse for hotspots", *MEMORY[0x1E4F28568], v38);
      objc_msgSend_setObject_forKeyedSubscript_(v36, v39, (uint64_t)v29, *MEMORY[0x1E4F28A50], v40);
      __int16 v86 = v36;
      uint64_t v31 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v41, *MEMORY[0x1E4F28798], 2, (uint64_t)v36);
    }
  }
  else
  {
    uint64_t v32 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v20, v21, v22, v23);
    objc_msgSend_setObject_forKeyedSubscript_(v32, v33, @"CWFAutoJoinManager.browseForHotspotsHandler() not configured", *MEMORY[0x1E4F28568], v34);
    __int16 v86 = v32;
    uint64_t v31 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v35, *MEMORY[0x1E4F28798], 6, (uint64_t)v32);
    id v24 = 0;
  }
  __uint64_t v42 = (clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v14) / 0xF4240;
  objc_msgSend_setAutoHotspotBrowseDuration_(self->_metric, v43, v42, v44, v45);
  objc_msgSend_setAutoHotspotBrowseError_(self->_metric, v46, v31, v47, v48);
  uint64_t v49 = CWFGetOSLog();
  if (v49)
  {
    uint64_t v50 = CWFGetOSLog();
  }
  else
  {
    uint64_t v50 = MEMORY[0x1E4F14500];
    id v51 = MEMORY[0x1E4F14500];
  }
  __int16 v88 = (void *)v31;

  if (os_log_type_enabled(v50, (os_log_type_t)(16 * (v24 == 0))))
  {
    if (v6) {
      uint64_t v56 = " [cache-only]";
    }
    else {
      uint64_t v56 = "";
    }
    if (v24) {
      uint64_t v57 = "SUCCEEDED";
    }
    else {
      uint64_t v57 = "FAILED";
    }
    uint64_t v58 = objc_msgSend_count(v24, v52, v53, v54, v55, v84, v85);
    uint64_t v62 = objc_msgSend___descriptionForError_(self, v59, (uint64_t)v88, v60, v61);
    int v95 = 136447746;
    uint64_t v96 = (uint64_t)v56;
    __int16 v97 = 2082;
    unint64_t v98 = (unint64_t)v57;
    __int16 v99 = 2048;
    unint64_t v100 = v42;
    __int16 v101 = 2048;
    uint64_t v102 = v58;
    __int16 v103 = 2114;
    double v104 = v62;
    __int16 v105 = 2048;
    unint64_t v106 = a3;
    __int16 v107 = 2048;
    unint64_t v108 = a4;
    _os_log_send_and_compose_impl();
  }
  uint64_t v63 = CWFGetOSLog();
  if (v63)
  {
    uint64_t v64 = CWFGetOSLog();
  }
  else
  {
    uint64_t v64 = MEMORY[0x1E4F14500];
    id v65 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v70 = objc_msgSend_count(v24, v66, v67, v68, v69);
    int v95 = 134217984;
    uint64_t v96 = v70;
    _os_log_send_and_compose_impl();
  }

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v71 = v24;
  uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v72, (uint64_t)&v89, (uint64_t)v94, 16);
  if (v73)
  {
    uint64_t v74 = v73;
    uint64_t v75 = *(void *)v90;
    uint64_t v76 = MEMORY[0x1E4F14500];
    do
    {
      for (uint64_t i = 0; i != v74; ++i)
      {
        if (*(void *)v90 != v75) {
          objc_enumerationMutation(v71);
        }
        uint64_t v78 = *(void *)(*((void *)&v89 + 1) + 8 * i);
        unint64_t v79 = CWFGetOSLog();
        if (v79)
        {
          int v80 = CWFGetOSLog();
        }
        else
        {
          id v81 = v76;
          int v80 = v76;
        }

        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        {
          int v95 = 138543362;
          uint64_t v96 = v78;
          _os_log_send_and_compose_impl();
        }
      }
      uint64_t v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v82, (uint64_t)&v89, (uint64_t)v94, 16);
    }
    while (v74);
  }

  if (a6 && v88) {
    *a6 = v88;
  }

  return v71;
}

- (void)__sortHotspotCandidates:(id)a3
{
  v24[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F29008];
  id v4 = a3;
  BOOL v6 = objc_msgSend_sortDescriptorWithKey_ascending_comparator_(v3, v5, 0, 1, (uint64_t)&unk_1F0DA27F0);
  id v8 = objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x1E4F29008], v7, 0, 1, (uint64_t)&unk_1F0DA2810);
  uint64_t v11 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E4F29008], v9, @"networkType", 0, v10);
  __uint64_t v14 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E4F29008], v12, @"signalStrength", 0, v13);
  uint64_t v17 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E4F29008], v15, @"batteryLife", 0, v16);
  v24[0] = v6;
  v24[1] = v8;
  v24[2] = v11;
  v24[3] = v14;
  v24[4] = v17;
  uint64_t v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v18, (uint64_t)v24, 5, v19);
  objc_msgSend_sortUsingDescriptors_(v4, v21, (uint64_t)v20, v22, v23);
}

- (int64_t)__allowAutoHotspotWithTrigger:(int64_t)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v42 = 0;
  char isAutoJoinCancelled = objc_msgSend___isAutoJoinCancelled_(self, a2, (uint64_t)&v42, (uint64_t)a4, v4);
  id v13 = v42;
  if ((isAutoJoinCancelled & 1) == 0)
  {
    __uint64_t v14 = objc_msgSend_allowAutoHotspotHandler(self, v9, v10, v11, v12);

    if (v14)
    {
      id v41 = 0;
      int64_t v17 = objc_msgSend___calloutToAllowAutoHotspotWithTrigger_error_(self, v15, a3, (uint64_t)&v41, v16);
      id v18 = v41;
      uint64_t v23 = v18;
      if (v17)
      {

        if (!a4) {
          goto LABEL_17;
        }
        goto LABEL_15;
      }
      id v24 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v19, v20, v21, v22);
      objc_msgSend_setObject_forKeyedSubscript_(v24, v25, @"Auto-hotspot is not allowed", *MEMORY[0x1E4F28568], v26);
      if (v23) {
        objc_msgSend_setObject_forKeyedSubscript_(v24, v27, (uint64_t)v23, *MEMORY[0x1E4F28A50], v28);
      }
      uint64_t v29 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v27, *MEMORY[0x1E4F28798], 1, (uint64_t)v24);

      id v13 = (id)v29;
    }
  }
  id v30 = CWFGetOSLog();
  if (v30)
  {
    uint64_t v31 = CWFGetOSLog();
  }
  else
  {
    uint64_t v31 = MEMORY[0x1E4F14500];
    id v32 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v36 = objc_msgSend___descriptionForError_(self, v33, (uint64_t)v13, v34, v35);
    int v43 = 138543362;
    uint64_t v44 = v36;
    _os_log_send_and_compose_impl();
  }
  objc_msgSend_setAutoHotspotWasAborted_(self->_metric, v37, 1, v38, v39);
  int64_t v17 = 0;
  if (a4)
  {
LABEL_15:
    if (v13) {
      *a4 = v13;
    }
  }
LABEL_17:

  return v17;
}

- (BOOL)__allowHotspot:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_msgSend_allowHotspotHandler(self, v7, v8, v9, v10);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  if (!v11) {
    goto LABEL_4;
  }
  id v35 = 0;
  int v14 = objc_msgSend___calloutToAllowHotspot_error_(self, v12, (uint64_t)v6, (uint64_t)&v35, v13);
  id v15 = v35;
  uint64_t v20 = v15;
  if (v14)
  {

    id v11 = 0;
LABEL_4:
    BOOL v21 = 1;
    goto LABEL_5;
  }
  uint64_t v23 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v16, v17, v18, v19);
  objc_msgSend_setObject_forKeyedSubscript_(v23, v24, @"Hotspot is not allowed by daemon", *MEMORY[0x1E4F28568], v25);
  if (v20) {
    objc_msgSend_setObject_forKeyedSubscript_(v23, v26, (uint64_t)v20, *MEMORY[0x1E4F28A50], v27);
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v26, *MEMORY[0x1E4F28798], 1, (uint64_t)v23);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v28 = CWFGetOSLog();
  if (v28)
  {
    uint64_t v29 = CWFGetOSLog();
  }
  else
  {
    uint64_t v29 = MEMORY[0x1E4F14500];
    id v30 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = objc_msgSend___descriptionForError_(self, v31, (uint64_t)v11, v32, v33);
    int v36 = 138543618;
    id v37 = v6;
    __int16 v38 = 2114;
    uint64_t v39 = v34;
    _os_log_send_and_compose_impl();
  }
  BOOL v21 = 0;
  if (a4 && v11)
  {
    id v11 = v11;
    BOOL v21 = 0;
    *a4 = v11;
  }
LABEL_5:

  return v21;
}

- (BOOL)__performAutoHotspotWithBrowseTimeout:(unint64_t)a3 maxCacheAge:(unint64_t)a4 cacheOnly:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  v164[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = self;
  objc_sync_enter(v9);
  int v14 = objc_msgSend_UUID(v9->_activeRequest, v10, v11, v12, v13);
  uint64_t v143 = objc_msgSend_copy(v14, v15, v16, v17, v18);

  uint64_t v23 = objc_msgSend_parameters(v9->_activeRequest, v19, v20, v21, v22);
  uint64_t v28 = objc_msgSend_trigger(v23, v24, v25, v26, v27);

  objc_sync_exit(v9);
  if (objc_msgSend___isAnyKnownNetworkNearby(v9, v29, v30, v31, v32))
  {
    uint64_t v134 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v163 = *MEMORY[0x1E4F28568];
    v164[0] = @"Known network is nearby";
    uint64_t v135 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v33, (uint64_t)v164, (uint64_t)&v163, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v134, v136, *MEMORY[0x1E4F28798], 1, (uint64_t)v135);
    id v144 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v35 = 0;
    goto LABEL_33;
  }
  id v153 = 0;
  uint64_t v139 = v28;
  uint64_t v35 = objc_msgSend___allowAutoHotspotWithTrigger_error_(v9, v33, v28, (uint64_t)&v153, v34);
  id v144 = v153;
  if ((v35 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
LABEL_33:
    objc_msgSend_setAutoHotspotMode_(v9->_metric, v36, v35, v37, v38);
    LOBYTE(v97) = 0;
    id v98 = 0;
    id v140 = 0;
    uint64_t v63 = 0;
    id v66 = 0;
    goto LABEL_28;
  }
  uint64_t v39 = CWFGetOSLog();
  if (v39)
  {
    uint64_t v40 = CWFGetOSLog();
  }
  else
  {
    uint64_t v40 = MEMORY[0x1E4F14500];
    id v41 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    double v46 = sub_1B4F549C4(v35, v42, v43, v44, v45);
    id v51 = objc_msgSend_UUIDString(v143, v47, v48, v49, v50);
    uint64_t v55 = objc_msgSend_substringToIndex_(v51, v52, 5, v53, v54);
    int v154 = 138543618;
    uint64_t v155 = (uint64_t)v46;
    __int16 v156 = 2114;
    uint64_t v157 = v55;
    LODWORD(v138) = 22;
    uint64_t v137 = &v154;
    _os_log_send_and_compose_impl();
  }
  __uint64_t v142 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  objc_msgSend___updateAutoJoinState_(v9, v56, 2, v57, v58);
  uint64_t v63 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v59, v60, v61, v62);
  id v152 = 0;
  id v65 = objc_msgSend___browseForHotspotsWithTimeout_maxCacheAge_cacheOnly_error_(v9, v64, a3, a4, v6, &v152);
  id v140 = v152;
  long long v148 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  id v66 = v65;
  uint64_t v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v67, (uint64_t)&v148, (uint64_t)v162, 16);
  if (v70)
  {
    uint64_t v71 = *(void *)v149;
    do
    {
      for (uint64_t i = 0; i != v70; ++i)
      {
        if (*(void *)v149 != v71) {
          objc_enumerationMutation(v66);
        }
        uint64_t v73 = *(void *)(*((void *)&v148 + 1) + 8 * i);
        id v147 = 0;
        int v74 = objc_msgSend___allowHotspot_error_(v9, v68, v73, (uint64_t)&v147, v69, v137, v138);
        id v78 = v147;
        if (v74) {
          objc_msgSend_addObject_(v63, v75, v73, v76, v77);
        }
      }
      uint64_t v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v68, (uint64_t)&v148, (uint64_t)v162, 16);
    }
    while (v70);
  }

  if (objc_msgSend_count(v63, v79, v80, v81, v82))
  {
    id v146 = v144;
    uint64_t v35 = objc_msgSend___allowAutoHotspotWithTrigger_error_(v9, v83, v139, (uint64_t)&v146, v85);
    id v86 = v146;

    if ((v35 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      objc_msgSend___sortHotspotCandidates_(v9, v83, (uint64_t)v63, v84, v85);
      objc_msgSend___updateAutoJoinState_(v9, v87, 3, v88, v89);
      uint64_t v94 = objc_msgSend_firstObject(v63, v90, v91, v92, v93);
      id v145 = 0;
      uint64_t v97 = objc_msgSend___connectToHotspot_error_(v9, v95, (uint64_t)v94, (uint64_t)&v145, v96);
      id v98 = v145;
    }
    else
    {
      id v98 = 0;
      uint64_t v97 = 0;
    }
    id v144 = v86;
  }
  else
  {
    id v98 = 0;
    uint64_t v97 = 0;
  }
  objc_msgSend_setAutoHotspotMode_(v9->_metric, v83, v35, v84, v85, v137, v138);
  if (v142)
  {
    __uint64_t v99 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    objc_msgSend_setAutoHotspotWasAttempted_(v9->_metric, v100, 1, v101, v102);
    objc_msgSend_setAutoHotspotDuration_(v9->_metric, v103, (v99 - v142) / 0xF4240, v104, v105);
    objc_msgSend_setAutoHotspotResult_(v9->_metric, v106, v97, v107, v108);
    objc_msgSend_setAutoHotspotError_(v9->_metric, v109, (uint64_t)v144, v110, v111);
    uint64_t v112 = CWFGetOSLog();
    if (v112)
    {
      uint64_t v113 = CWFGetOSLog();
    }
    else
    {
      uint64_t v113 = MEMORY[0x1E4F14500];
      id v114 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v119 = objc_msgSend_autoHotspotDuration(v9->_metric, v115, v116, v117, v118);
      uint64_t v124 = objc_msgSend_UUIDString(v143, v120, v121, v122, v123);
      uint64_t v128 = objc_msgSend_substringToIndex_(v124, v125, 5, v126, v127);
      double v132 = objc_msgSend___descriptionForError_(v9, v129, (uint64_t)v144, v130, v131);
      int v154 = 134218754;
      uint64_t v155 = v119;
      __int16 v156 = 2114;
      uint64_t v157 = v128;
      __int16 v158 = 1024;
      int v159 = v97;
      __int16 v160 = 2114;
      uint64_t v161 = v132;
      _os_log_send_and_compose_impl();
    }
  }
LABEL_28:
  if (a6 && v144) {
    *a6 = v144;
  }

  return v97;
}

- (void)__addDependentThrottleInterval:(unint64_t)a3 trigger:(int64_t)a4 dependentTrigger:(int64_t)a5
{
  v34[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = objc_alloc_init(CWFAutoJoinThrottle);
  objc_msgSend_setTrigger_(v9, v10, a4, v11, v12);
  uint64_t v16 = objc_msgSend_numberWithInteger_(NSNumber, v13, a5, v14, v15);
  uint64_t v33 = v16;
  uint64_t v20 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v17, a3, v18, v19);
  v34[0] = v20;
  uint64_t v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v21, (uint64_t)v34, (uint64_t)&v33, 1);
  objc_msgSend_setIntervalsBasedOnTriggerTimestamp_(v9, v23, (uint64_t)v22, v24, v25);

  throttleIntervalMap = self->_throttleIntervalMap;
  uint64_t v30 = objc_msgSend_numberWithInteger_(NSNumber, v27, a4, v28, v29);
  objc_msgSend_setObject_forKeyedSubscript_(throttleIntervalMap, v31, (uint64_t)v9, (uint64_t)v30, v32);
}

- (void)__addMatchingThrottleInterval:(unint64_t)a3 triggers:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = a4;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v29, (uint64_t)v35, 16);
  if (v7)
  {
    uint64_t v12 = v7;
    uint64_t v13 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend_integerValue(v15, v8, v9, v10, v11);
        uint64_t v33 = v15;
        uint64_t v20 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v17, a3, v18, v19);
        uint64_t v34 = v20;
        uint64_t v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v21, (uint64_t)&v34, (uint64_t)&v33, 1);
        uint64_t v25 = objc_msgSend_autoJoinThrottleWithTrigger_intervals_(CWFAutoJoinThrottle, v23, v16, (uint64_t)v22, v24);
        objc_msgSend_setObject_forKeyedSubscript_(self->_throttleIntervalMap, v26, (uint64_t)v25, (uint64_t)v15, v27);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v29, (uint64_t)v35, 16);
    }
    while (v12);
  }
}

- (void)__addWilcardThrottleInterval:(unint64_t)a3 triggers:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = a4;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v29, (uint64_t)v35, 16);
  if (v7)
  {
    uint64_t v12 = v7;
    uint64_t v13 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend_integerValue(v15, v8, v9, v10, v11);
        uint64_t v33 = &unk_1F0DC7818;
        uint64_t v20 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v17, a3, v18, v19);
        uint64_t v34 = v20;
        uint64_t v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v21, (uint64_t)&v34, (uint64_t)&v33, 1);
        uint64_t v25 = objc_msgSend_autoJoinThrottleWithTrigger_intervals_(CWFAutoJoinThrottle, v23, v16, (uint64_t)v22, v24);
        objc_msgSend_setObject_forKeyedSubscript_(self->_throttleIntervalMap, v26, (uint64_t)v25, (uint64_t)v15, v27);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v29, (uint64_t)v35, 16);
    }
    while (v12);
  }
}

- (void)__setupThrottleIntervals
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  objc_msgSend_removeAllObjects(self->_throttleIntervalMap, a2, v2, v3, v4);
  switch(self->_retrySchedule)
  {
    case 3:
      objc_msgSend___addWilcardThrottleInterval_triggers_(self, v6, -1, (uint64_t)&unk_1F0DC8808, v7);
      objc_msgSend___addWilcardThrottleInterval_triggers_(self, v8, 0, (uint64_t)&unk_1F0DC8820, v9);
      if (os_variant_has_internal_content())
      {
        uint64_t v14 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], v10, v11, v12, v13);
        uint64_t v18 = objc_msgSend_objectForKey_(v14, v15, @"assoc_retry_awdl_rt_throttle_interval", v16, v17);

        if (v18)
        {
          uint64_t v19 = CWFGetOSLog();
          if (v19)
          {
            uint64_t v20 = CWFGetOSLog();
          }
          else
          {
            uint64_t v20 = MEMORY[0x1E4F14500];
            id v30 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            int v42 = 134218240;
            uint64_t v43 = 900;
            __int16 v44 = 2048;
            uint64_t v45 = objc_msgSend_unsignedIntegerValue(v18, v31, v32, v33, v34);
            int v41 = 22;
            uint64_t v40 = &v42;
            _os_log_send_and_compose_impl();
          }

          uint64_t v29 = objc_msgSend_unsignedIntegerValue(v18, v35, v36, v37, v38);
        }
        else
        {
          uint64_t v29 = 900;
        }

        objc_msgSend___addDependentThrottleInterval_trigger_dependentTrigger_(self, v39, v29, 45, 57, v40, v41);
      }
      else
      {
        objc_msgSend___addDependentThrottleInterval_trigger_dependentTrigger_(self, v10, 900, 45, 57);
      }
      return;
    case 5:
      objc_msgSend___addWilcardThrottleInterval_triggers_(self, v6, -1, (uint64_t)&unk_1F0DC87D8, v7);
      uint64_t v26 = &unk_1F0DC87F0;
      goto LABEL_9;
    case 8:
      objc_msgSend___addWilcardThrottleInterval_triggers_(self, v6, -1, (uint64_t)&unk_1F0DC87A8, v7);
      uint64_t v26 = &unk_1F0DC87C0;
LABEL_9:
      objc_msgSend___addWilcardThrottleInterval_triggers_(self, v24, 0, (uint64_t)v26, v25);
      return;
    case 9:
      objc_msgSend___addWilcardThrottleInterval_triggers_(self, v6, -1, (uint64_t)&unk_1F0DC8760, v7);
      objc_msgSend___addWilcardThrottleInterval_triggers_(self, v27, 0, (uint64_t)&unk_1F0DC8778, v28);
      uint64_t v21 = &unk_1F0DC8790;
      uint64_t v22 = self;
      uint64_t v23 = 900;
      goto LABEL_13;
    default:
      uint64_t v21 = &unk_1F0DC8838;
      uint64_t v22 = self;
      uint64_t v23 = 60;
LABEL_13:
      MEMORY[0x1F4181798](v22, sel___addMatchingThrottleInterval_triggers_, v23, v21, v7);
      return;
  }
}

- (void)__setupRetryIntervals
{
  BOOL v6 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3, v4);
  uint64_t v7 = objc_alloc_init(CWFAutoJoinRetryInterval);
  objc_msgSend_setBSSChannelsOnly_(v7, v8, 0, v9, v10);
  objc_msgSend_setMaxBSSChannelAge_(v7, v11, 2592000, v12, v13);
  objc_msgSend_setMaxBSSChannelCount_(v7, v14, 3, v15, v16);
  objc_msgSend_setPassiveScan_(v7, v17, 1, v18, v19);
  objc_msgSend_setDwellTime_(v7, v20, 110, v21, v22);
  uint64_t v27 = objc_msgSend_copy(v7, v23, v24, v25, v26);
  objc_msgSend_setAllowAutoHotspotFallback_(v27, v28, 1, v29, v30);
  long long v31 = objc_alloc_init(CWFAutoJoinRetryInterval);
  objc_msgSend_setBSSChannelsOnly_(v31, v32, 1, v33, v34);
  objc_msgSend_setMaxBSSChannelAge_(v31, v35, 0, v36, v37);
  objc_msgSend_setMaxBSSChannelCount_(v31, v38, 3, v39, v40);
  objc_msgSend_setDwellTime_(v31, v41, 110, v42, v43);
  uint64_t v513 = objc_alloc_init(CWFAutoJoinRetryInterval);
  objc_msgSend_setBSSChannelsOnly_(v513, v44, 1, v45, v46);
  objc_msgSend_setMaxBSSChannelAge_(v513, v47, 604800, v48, v49);
  objc_msgSend_setMaxBSSChannelCount_(v513, v50, 3, v51, v52);
  objc_msgSend_setDwellTime_(v513, v53, 110, v54, v55);
  objc_msgSend_setPassiveScan_(v513, v56, 1, v57, v58);
  uint64_t v63 = objc_msgSend_copy(v31, v59, v60, v61, v62);
  objc_msgSend_setDwellTime_(v63, v64, 40, v65, v66);
  uint64_t v71 = objc_msgSend_copy(v63, v67, v68, v69, v70);
  objc_msgSend_setIncludeAdjacent5GHzChannel_(v71, v72, 1, v73, v74);
  uint64_t v512 = objc_msgSend_copy(v31, v75, v76, v77, v78);
  objc_msgSend_setAlwaysIncludeRemainingNon2GHzChannels_(v512, v79, 1, v80, v81);
  objc_msgSend_setAlwaysInclude6GHzPSCChannels_(v512, v82, 1, v83, v84);
  uint64_t v89 = objc_msgSend_copy(v7, v85, v86, v87, v88);
  objc_msgSend_setAlwaysIncludeRemainingNon2GHzChannels_(v89, v90, 1, v91, v92);
  objc_msgSend_setAlwaysInclude6GHzPSCChannels_(v89, v93, 1, v94, v95);
  uint64_t v511 = objc_msgSend_copy(v89, v96, v97, v98, v99);
  objc_msgSend_setAllowAutoHotspotFallback_(v511, v100, 1, v101, v102);
  uint64_t v105 = objc_msgSend_autoJoinRetryInterval_count_(v31, v103, 0, 1, v104);
  objc_msgSend_addObject_(v6, v106, (uint64_t)v105, v107, v108);

  uint64_t v111 = objc_msgSend_autoJoinRetryInterval_count_(v27, v109, 20, 1, v110);
  objc_msgSend_addObject_(v6, v112, (uint64_t)v111, v113, v114);

  uint64_t v117 = objc_msgSend_autoJoinRetryInterval_count_(v27, v115, 120, 1, v116);
  objc_msgSend_addObject_(v6, v118, (uint64_t)v117, v119, v120);

  uint64_t v123 = objc_msgSend_autoJoinRetryInterval_count_(v27, v121, 240, 1, v122);
  objc_msgSend_addObject_(v6, v124, (uint64_t)v123, v125, v126);

  uint64_t v129 = objc_msgSend_autoJoinRetryInterval_count_(v27, v127, 480, -1, v128);
  objc_msgSend_addObject_(v6, v130, (uint64_t)v129, v131, v132);

  uint64_t v137 = objc_msgSend_copy(v6, v133, v134, v135, v136);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v138, (uint64_t)v137, (uint64_t)&unk_1F0DC7AD0, v139);

  objc_msgSend_removeAllObjects(v6, v140, v141, v142, v143);
  id v146 = objc_msgSend_autoJoinRetryInterval_count_(v31, v144, 0, 1, v145);
  objc_msgSend_addObject_(v6, v147, (uint64_t)v146, v148, v149);

  int v150 = 5;
  id v153 = objc_msgSend_autoJoinRetryInterval_count_(v31, v151, 5, 2, v152);
  objc_msgSend_addObject_(v6, v154, (uint64_t)v153, v155, v156);

  int v159 = objc_msgSend_autoJoinRetryInterval_count_(v27, v157, 10, 1, v158);
  objc_msgSend_addObject_(v6, v160, (uint64_t)v159, v161, v162);

  double v165 = objc_msgSend_autoJoinRetryInterval_count_(v27, v163, 120, 1, v164);
  objc_msgSend_addObject_(v6, v166, (uint64_t)v165, v167, v168);

  double v171 = objc_msgSend_autoJoinRetryInterval_count_(v27, v169, 240, 1, v170);
  objc_msgSend_addObject_(v6, v172, (uint64_t)v171, v173, v174);

  uint64_t v177 = objc_msgSend_autoJoinRetryInterval_count_(v27, v175, 480, -1, v176);
  objc_msgSend_addObject_(v6, v178, (uint64_t)v177, v179, v180);

  unint64_t v185 = objc_msgSend_copy(v6, v181, v182, v183, v184);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v186, (uint64_t)v185, (uint64_t)&unk_1F0DC7AE8, v187);

  objc_msgSend_removeAllObjects(v6, v188, v189, v190, v191);
  uint64_t v194 = objc_msgSend_autoJoinRetryInterval_count_(v512, v192, 0, 1, v193);
  objc_msgSend_addObject_(v6, v195, (uint64_t)v194, v196, v197);

  uint64_t v200 = objc_msgSend_autoJoinRetryInterval_count_(v89, v198, 5, 2, v199);
  objc_msgSend_addObject_(v6, v201, (uint64_t)v200, v202, v203);

  uint64_t v206 = objc_msgSend_autoJoinRetryInterval_count_(v511, v204, 10, 12, v205);
  objc_msgSend_addObject_(v6, v207, (uint64_t)v206, v208, v209);

  uint64_t v212 = objc_msgSend_autoJoinRetryInterval_count_(v511, v210, 20, -1, v211);
  objc_msgSend_addObject_(v6, v213, (uint64_t)v212, v214, v215);

  uint64_t v220 = objc_msgSend_copy(v6, v216, v217, v218, v219);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v221, (uint64_t)v220, (uint64_t)&unk_1F0DC77A0, v222);

  objc_msgSend_removeAllObjects(v6, v223, v224, v225, v226);
  uint64_t v229 = objc_msgSend_autoJoinRetryInterval_count_(v513, v227, 120, 1, v228);
  objc_msgSend_addObject_(v6, v230, (uint64_t)v229, v231, v232);

  uint64_t v235 = objc_msgSend_autoJoinRetryInterval_count_(v513, v233, 240, 1, v234);
  objc_msgSend_addObject_(v6, v236, (uint64_t)v235, v237, v238);

  uint64_t v241 = objc_msgSend_autoJoinRetryInterval_count_(v513, v239, 480, -1, v240);
  objc_msgSend_addObject_(v6, v242, (uint64_t)v241, v243, v244);

  uint64_t v249 = objc_msgSend_copy(v6, v245, v246, v247, v248);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v250, (uint64_t)v249, (uint64_t)&unk_1F0DC7908, v251);

  objc_msgSend_removeAllObjects(v6, v252, v253, v254, v255);
  uint64_t v258 = objc_msgSend_autoJoinRetryInterval_count_(v31, v256, 20, 1, v257);
  objc_msgSend_addObject_(v6, v259, (uint64_t)v258, v260, v261);

  uint64_t v264 = objc_msgSend_autoJoinRetryInterval_count_(v31, v262, 60, 4, v263);
  objc_msgSend_addObject_(v6, v265, (uint64_t)v264, v266, v267);

  uint64_t v270 = objc_msgSend_autoJoinRetryInterval_count_(v7, v268, 120, 1, v269);
  objc_msgSend_addObject_(v6, v271, (uint64_t)v270, v272, v273);

  uint64_t v276 = objc_msgSend_autoJoinRetryInterval_count_(v7, v274, 240, 1, v275);
  objc_msgSend_addObject_(v6, v277, (uint64_t)v276, v278, v279);

  uint64_t v282 = objc_msgSend_autoJoinRetryInterval_count_(v7, v280, 480, -1, v281);
  objc_msgSend_addObject_(v6, v283, (uint64_t)v282, v284, v285);

  uint64_t v290 = objc_msgSend_copy(v6, v286, v287, v288, v289);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v291, (uint64_t)v290, (uint64_t)&unk_1F0DC7B00, v292);

  objc_msgSend_removeAllObjects(v6, v293, v294, v295, v296);
  uint64_t v299 = objc_msgSend_autoJoinRetryInterval_count_(v31, v297, 20, 1, v298);
  objc_msgSend_addObject_(v6, v300, (uint64_t)v299, v301, v302);

  uint64_t v305 = objc_msgSend_autoJoinRetryInterval_count_(v27, v303, 20, 1, v304);
  objc_msgSend_addObject_(v6, v306, (uint64_t)v305, v307, v308);

  uint64_t v311 = objc_msgSend_autoJoinRetryInterval_count_(v27, v309, 120, 1, v310);
  objc_msgSend_addObject_(v6, v312, (uint64_t)v311, v313, v314);

  uint64_t v317 = objc_msgSend_autoJoinRetryInterval_count_(v27, v315, 240, 1, v316);
  objc_msgSend_addObject_(v6, v318, (uint64_t)v317, v319, v320);

  uint64_t v323 = objc_msgSend_autoJoinRetryInterval_count_(v27, v321, 480, -1, v322);
  objc_msgSend_addObject_(v6, v324, (uint64_t)v323, v325, v326);

  uint64_t v331 = objc_msgSend_copy(v6, v327, v328, v329, v330);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v332, (uint64_t)v331, (uint64_t)&unk_1F0DC7968, v333);

  objc_msgSend_removeAllObjects(v6, v334, v335, v336, v337);
  do
  {
    uint64_t v340 = objc_msgSend_autoJoinRetryInterval_count_(v63, v338, 0, 2, v339);
    objc_msgSend_addObject_(v6, v341, (uint64_t)v340, v342, v343);

    uint64_t v346 = objc_msgSend_autoJoinRetryInterval_count_(v71, v344, 0, 2, v345);
    objc_msgSend_addObject_(v6, v347, (uint64_t)v346, v348, v349);

    uint64_t v352 = objc_msgSend_autoJoinRetryInterval_count_(v7, v350, 0, 1, v351);
    objc_msgSend_addObject_(v6, v353, (uint64_t)v352, v354, v355);

    uint64_t v358 = objc_msgSend_autoJoinRetryInterval_count_(v63, v356, 1, 1, v357);
    objc_msgSend_addObject_(v6, v359, (uint64_t)v358, v360, v361);

    --v150;
  }
  while (v150);
  uint64_t v364 = objc_msgSend_copy(v6, v338, v362, v363, v339);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v365, (uint64_t)v364, (uint64_t)&unk_1F0DC78F0, v366);

  objc_msgSend_removeAllObjects(v6, v367, v368, v369, v370);
  id v373 = objc_msgSend_autoJoinRetryInterval_count_(v7, v371, 360, 1, v372);
  objc_msgSend_addObject_(v6, v374, (uint64_t)v373, v375, v376);

  uint64_t v379 = objc_msgSend_autoJoinRetryInterval_count_(v7, v377, 900, -1, v378);
  objc_msgSend_addObject_(v6, v380, (uint64_t)v379, v381, v382);

  uint64_t v387 = objc_msgSend_copy(v6, v383, v384, v385, v386);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v388, (uint64_t)v387, (uint64_t)&unk_1F0DC77E8, v389);

  objc_msgSend_removeAllObjects(v6, v390, v391, v392, v393);
  uint64_t v396 = objc_msgSend_autoJoinRetryInterval_count_(v7, v394, 900, -1, v395);
  objc_msgSend_addObject_(v6, v397, (uint64_t)v396, v398, v399);

  uint64_t v404 = objc_msgSend_copy(v6, v400, v401, v402, v403);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v405, (uint64_t)v404, (uint64_t)&unk_1F0DC79E0, v406);

  objc_msgSend_removeAllObjects(v6, v407, v408, v409, v410);
  uint64_t v413 = objc_msgSend_autoJoinRetryInterval_count_(v89, v411, 0, 1, v412);
  objc_msgSend_addObject_(v6, v414, (uint64_t)v413, v415, v416);

  uint64_t v419 = objc_msgSend_autoJoinRetryInterval_count_(v89, v417, 5, 2, v418);
  objc_msgSend_addObject_(v6, v420, (uint64_t)v419, v421, v422);

  uint64_t v425 = objc_msgSend_autoJoinRetryInterval_count_(v89, v423, 10, 2, v424);
  objc_msgSend_addObject_(v6, v426, (uint64_t)v425, v427, v428);

  uint64_t v431 = objc_msgSend_autoJoinRetryInterval_count_(v89, v429, 20, 16, v430);
  objc_msgSend_addObject_(v6, v432, (uint64_t)v431, v433, v434);

  uint64_t v437 = objc_msgSend_autoJoinRetryInterval_count_(v89, v435, 120, 1, v436);
  objc_msgSend_addObject_(v6, v438, (uint64_t)v437, v439, v440);

  id v443 = objc_msgSend_autoJoinRetryInterval_count_(v89, v441, 240, 1, v442);
  objc_msgSend_addObject_(v6, v444, (uint64_t)v443, v445, v446);

  uint64_t v449 = objc_msgSend_autoJoinRetryInterval_count_(v89, v447, 480, -1, v448);
  objc_msgSend_addObject_(v6, v450, (uint64_t)v449, v451, v452);

  uint64_t v457 = objc_msgSend_copy(v6, v453, v454, v455, v456);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v458, (uint64_t)v457, (uint64_t)&unk_1F0DC7B18, v459);

  objc_msgSend_removeAllObjects(v6, v460, v461, v462, v463);
  int v466 = objc_msgSend_autoJoinRetryInterval_count_(v31, v464, 0, 1, v465);
  objc_msgSend_addObject_(v6, v467, (uint64_t)v466, v468, v469);

  uint64_t v472 = objc_msgSend_autoJoinRetryInterval_count_(v27, v470, 5, 2, v471);
  objc_msgSend_addObject_(v6, v473, (uint64_t)v472, v474, v475);

  uint64_t v478 = objc_msgSend_autoJoinRetryInterval_count_(v27, v476, 30, 5, v477);
  objc_msgSend_addObject_(v6, v479, (uint64_t)v478, v480, v481);

  uint64_t v484 = objc_msgSend_autoJoinRetryInterval_count_(v27, v482, 60, 5, v483);
  objc_msgSend_addObject_(v6, v485, (uint64_t)v484, v486, v487);

  long long v490 = objc_msgSend_autoJoinRetryInterval_count_(v27, v488, 480, -1, v489);
  objc_msgSend_addObject_(v6, v491, (uint64_t)v490, v492, v493);

  __int16 v498 = objc_msgSend_copy(v6, v494, v495, v496, v497);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v499, (uint64_t)v498, (uint64_t)&unk_1F0DC7B30, v500);

  objc_msgSend_removeAllObjects(v6, v501, v502, v503, v504);
  uint64_t v505 = CWFGetOSLog();
  if (v505)
  {
    uint64_t v506 = CWFGetOSLog();
  }
  else
  {
    uint64_t v506 = MEMORY[0x1E4F14500];
    id v507 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v506, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }

  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(self->_retryIntervalMap, v508, (uint64_t)&unk_1F0DA2850, v509, v510);
}

- (BOOL)__forceNearbyNetworkRetrySchedule
{
  unint64_t v2 = self->_retrySchedule - 3;
  return (v2 >= 7 || ((0x67u >> v2) & 1) == 0)
      && self->_lowRSSICandidateFoundTimestamp
      && clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - self->_lowRSSICandidateFoundTimestamp < 0x45D964B800;
}

- (id)__retryIntervalWithScheduleIndex:(unint64_t)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  int64_t retrySchedule = self->_retrySchedule;
  if (objc_msgSend___forceNearbyNetworkRetrySchedule(self, a2, a3, v3, v4))
  {
    uint64_t v11 = CWFGetOSLog();
    if (v11)
    {
      uint64_t v12 = CWFGetOSLog();
    }
    else
    {
      uint64_t v12 = MEMORY[0x1E4F14500];
      id v13 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v41[0] = 67109376;
      v41[1] = 300;
      __int16 v42 = 1024;
      int v43 = -90;
      int v35 = 14;
      uint64_t v34 = v41;
      _os_log_send_and_compose_impl();
    }

    int64_t retrySchedule = 10;
  }
  retryIntervalMap = self->_retryIntervalMap;
  uint64_t v15 = objc_msgSend_numberWithInteger_(NSNumber, v8, retrySchedule, v9, v10, v34, v35);
  uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(retryIntervalMap, v16, (uint64_t)v15, v17, v18);

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v20 = v19;
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v36, (uint64_t)v40, 16);
  if (v22)
  {
    uint64_t v27 = v22;
    unint64_t v28 = 0;
    uint64_t v29 = *(void *)v37;
    while (2)
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v37 != v29) {
          objc_enumerationMutation(v20);
        }
        long long v31 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (__CFADD__(v28, objc_msgSend_count(v31, v23, v24, v25, v26))) {
          unint64_t v28 = -1;
        }
        else {
          v28 += objc_msgSend_count(v31, v23, v24, v25, v26);
        }
        if (v28 > a3)
        {
          id v32 = v31;
          goto LABEL_21;
        }
      }
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v36, (uint64_t)v40, 16);
      if (v27) {
        continue;
      }
      break;
    }
  }
  id v32 = 0;
LABEL_21:

  return v32;
}

- (id)__retryInterval
{
  unint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v6 = objc_msgSend___retryIntervalWithScheduleIndex_(v2, v3, v2->_retryScheduleIndex, v4, v5);
  objc_sync_exit(v2);

  return v6;
}

- (unint64_t)__applyRetryIntervalSkew:(unint64_t)a3
{
  double v3 = (double)a3 * 0.1;
  unint64_t v4 = a3 - (unint64_t)v3;
  unint64_t v5 = (unint64_t)v3 + a3;
  uint32_t v6 = arc4random();
  return v4
       + (v5 - v4) * (unint64_t)((double)(v6 + ((v6 / 0x7FFFFFFF) | ((v6 / 0x7FFFFFFF) << 31))) / 2147483650.0);
}

- (int64_t)__retryTriggerForRetrySchedule:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 9) {
    return 4;
  }
  else {
    return qword_1B50317E0[a3 - 2];
  }
}

- (void)__updateRetrySchedule
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  if (!self->_retryTimer)
  {
    unint64_t v5 = dispatch_get_global_queue(0, 0);
    uint32_t v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v5);
    retryTimer = self->_retryTimer;
    self->_retryTimer = v6;

    uint64_t v8 = self->_retryTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = sub_1B4FAF564;
    handler[3] = &unk_1E60BB768;
    void handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_retryTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_retryTimer);
  }
  if (!self->_activeRequest)
  {
    uint64_t v9 = objc_msgSend___retryIntervalWithScheduleIndex_(self, a2, self->_retryScheduleIndex, v2, v3);
    uint64_t v14 = v9;
    if (v9)
    {
      unint64_t v15 = objc_msgSend_interval(v9, v10, v11, v12, v13);
      unint64_t v20 = 1000000000 * objc_msgSend_interval(v14, v16, v17, v18, v19);
      uint64_t v25 = objc_msgSend_interval(v14, v21, v22, v23, v24);
      if (v15 <= v20) {
        unint64_t v29 = objc_msgSend___applyRetryIntervalSkew_(self, v26, 1000000000 * v25, v27, v28);
      }
      else {
        unint64_t v29 = objc_msgSend___applyRetryIntervalSkew_(self, v26, v25, v27, v28);
      }
      if (v29 > 0x7FFFFFFFFFFFFFFELL)
      {
        unint64_t v49 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        unint64_t v34 = objc_msgSend_interval(v14, v30, v31, v32, v33);
        unint64_t v39 = 1000000000 * objc_msgSend_interval(v14, v35, v36, v37, v38);
        uint64_t v44 = objc_msgSend_interval(v14, v40, v41, v42, v43);
        if (v34 <= v39) {
          uint64_t v48 = objc_msgSend___applyRetryIntervalSkew_(self, v45, 1000000000 * v44, v46, v47);
        }
        else {
          uint64_t v48 = objc_msgSend___applyRetryIntervalSkew_(self, v45, v44, v46, v47);
        }
        unint64_t v49 = v48;
      }
      uint64_t v54 = CWFGetOSLog();
      if (v54)
      {
        uint64_t v55 = CWFGetOSLog();
      }
      else
      {
        uint64_t v55 = MEMORY[0x1E4F14500];
        id v56 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_isRetryScheduled) {
          uint64_t v61 = @"Re-scheduling";
        }
        else {
          uint64_t v61 = @"Scheduling";
        }
        uint64_t v62 = sub_1B4F54A8C(self->_retrySchedule, v57, v58, v59, v60);
        unint64_t retryScheduleIndex = self->_retryScheduleIndex;
        int v83 = 138544386;
        uint64_t v84 = v61;
        __int16 v85 = 2048;
        unint64_t v86 = v49 / 0xF4240;
        __int16 v87 = 2114;
        uint64_t v88 = v62;
        __int16 v89 = 2048;
        unint64_t v90 = retryScheduleIndex;
        __int16 v91 = 2114;
        uint64_t v92 = v14;
        _os_log_send_and_compose_impl();
      }
      self->_BOOL isRetryScheduled = 1;
      uint64_t v64 = self->_retryTimer;
      dispatch_time_t v65 = dispatch_walltime(0, v49);
      uint64_t v66 = v64;
    }
    else
    {
      BOOL isRetryScheduled = self->_isRetryScheduled;
      uint64_t v51 = CWFGetOSLog();
      uint64_t v52 = (void *)v51;
      if (!isRetryScheduled)
      {
        if (v51)
        {
          uint64_t v67 = CWFGetOSLog();
        }
        else
        {
          uint64_t v67 = MEMORY[0x1E4F14500];
          id v75 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          sub_1B4F54A8C(self->_retrySchedule, v76, v77, v78, v79);
          uint64_t v80 = (__CFString *)objc_claimAutoreleasedReturnValue();
          unint64_t v81 = self->_retryScheduleIndex;
          int v83 = 138543618;
          uint64_t v84 = v80;
          __int16 v85 = 2048;
          unint64_t v86 = v81;
          _os_log_send_and_compose_impl();
        }
        goto LABEL_33;
      }
      if (v51)
      {
        uint64_t v53 = CWFGetOSLog();
      }
      else
      {
        uint64_t v53 = MEMORY[0x1E4F14500];
        id v68 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        sub_1B4F54A8C(self->_retrySchedule, v69, v70, v71, v72);
        uint64_t v73 = (__CFString *)objc_claimAutoreleasedReturnValue();
        unint64_t v74 = self->_retryScheduleIndex;
        int v83 = 138543618;
        uint64_t v84 = v73;
        __int16 v85 = 2048;
        unint64_t v86 = v74;
        _os_log_send_and_compose_impl();
      }
      self->_BOOL isRetryScheduled = 0;
      uint64_t v66 = self->_retryTimer;
      dispatch_time_t v65 = -1;
    }
    dispatch_source_set_timer(v66, v65, 0xFFFFFFFFFFFFFFFFLL, 0);
LABEL_33:
  }
}

- (BOOL)__calloutToAllowAutoJoinWithTrigger:(int64_t)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v33 = 0;
  unint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = sub_1B4F51C4C;
  uint64_t v31 = sub_1B4F51BD4;
  id v32 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  int v26 = 0;
  dispatch_block_t v7 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1F0DA3550);
  __uint64_t v8 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v9 = CWFGetOSLog();
  if (v9)
  {
    uint64_t v10 = CWFGetOSLog();
  }
  else
  {
    uint64_t v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v37 = 134219010;
    unint64_t v38 = v8 / 0x3B9ACA00;
    __int16 v39 = 2048;
    unint64_t v40 = v8 % 0x3B9ACA00 / 0x3E8;
    __int16 v41 = 2082;
    uint64_t v42 = "-[CWFAutoJoinManager __calloutToAllowAutoJoinWithTrigger:error:]";
    __int16 v43 = 2082;
    uint64_t v44 = "CWFAutoJoinManager.m";
    __int16 v45 = 1024;
    int v46 = 6676;
    _os_log_send_and_compose_impl();
  }

  targetQueue = self->_targetQueue;
  qos_class_t v13 = qos_class_self();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4FAF9E8;
  block[3] = &unk_1E60BC4A8;
  void block[4] = self;
  uint64_t v21 = &v33;
  uint64_t v22 = &v27;
  uint64_t v23 = v25;
  int64_t v24 = a3;
  id v14 = v7;
  id v20 = v14;
  dispatch_block_t v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v13, 0, block);
  dispatch_async(targetQueue, v15);

  dispatch_block_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
  {
    uint64_t v16 = (void *)v28[5];
    if (v16) {
      *a4 = v16;
    }
  }
  BOOL v17 = *((unsigned char *)v34 + 24) != 0;

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v17;
}

- (BOOL)__calloutToAllowKnownNetwork:(id)a3 trigger:(int64_t)a4 allowForSeamlessSSIDTransition:(id)a5 defer:(BOOL *)a6 queue:(id)a7 error:(id *)a8
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  uint64_t v19 = a7;
  uint64_t v65 = 0;
  uint64_t v66 = &v65;
  uint64_t v67 = 0x2020000000;
  char v68 = 0;
  uint64_t v61 = 0;
  uint64_t v62 = &v61;
  uint64_t v63 = 0x2020000000;
  char v64 = 0;
  uint64_t v55 = 0;
  id v56 = &v55;
  uint64_t v57 = 0x3032000000;
  uint64_t v58 = sub_1B4F51C4C;
  uint64_t v59 = sub_1B4F51BD4;
  id v60 = 0;
  if (v19)
  {
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x2020000000;
    int v54 = 0;
    dispatch_block_t v20 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1F0DA34B0);
    __uint64_t v21 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    uint64_t v22 = CWFGetOSLog();
    if (v22)
    {
      uint64_t v23 = CWFGetOSLog();
    }
    else
    {
      uint64_t v23 = MEMORY[0x1E4F14500];
      id v30 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      int v71 = 134219010;
      unint64_t v72 = v21 / 0x3B9ACA00;
      __int16 v73 = 2048;
      unint64_t v74 = v21 % 0x3B9ACA00 / 0x3E8;
      __int16 v75 = 2082;
      uint64_t v76 = "-[CWFAutoJoinManager __calloutToAllowKnownNetwork:trigger:allowForSeamlessSSIDTransition:defer:queue:error:]";
      __int16 v77 = 2082;
      uint64_t v78 = "CWFAutoJoinManager.m";
      __int16 v79 = 1024;
      int v80 = 6717;
      _os_log_send_and_compose_impl();
    }

    qos_class_t v31 = qos_class_self();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4FB02A0;
    block[3] = &unk_1E60BC4F8;
    void block[4] = self;
    id v45 = v13;
    int64_t v52 = a4;
    uint64_t v48 = &v65;
    unint64_t v49 = &v61;
    uint64_t v50 = &v55;
    uint64_t v51 = v53;
    id v46 = v14;
    id v47 = v20;
    id v32 = v20;
    dispatch_block_t v33 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v31, 0, block);
    dispatch_async(v19, v33);

    dispatch_block_wait(v32, 0xFFFFFFFFFFFFFFFFLL);
    _Block_object_dispose(v53, 8);
  }
  else
  {
    int64_t v24 = objc_msgSend_allowKnownNetworkHandler(self, v15, v16, v17, v18);

    if (v24)
    {
      objc_msgSend_allowKnownNetworkHandler(self, v25, v26, v27, v28);
      uint64_t v29 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = sub_1B4FB0658;
      v43[3] = &unk_1E60BC520;
      v43[4] = &v65;
      v43[5] = &v61;
      v43[6] = &v55;
      ((void (**)(void, id, int64_t, id, void *))v29)[2](v29, v13, a4, v14, v43);
    }
    else
    {
      int v37 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v69 = *MEMORY[0x1E4F28568];
      uint64_t v70 = @"CWFAutoJoinManager.allowKnownNetworkHandler() not configured";
      unint64_t v38 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v25, (uint64_t)&v70, (uint64_t)&v69, 1);
      uint64_t v40 = objc_msgSend_errorWithDomain_code_userInfo_(v37, v39, *MEMORY[0x1E4F28798], 6, (uint64_t)v38);
      __int16 v41 = (void *)v56[5];
      v56[5] = v40;
    }
  }
  if (a6 && *((unsigned char *)v62 + 24)) {
    *a6 = 1;
  }
  if (a8)
  {
    unint64_t v34 = (void *)v56[5];
    if (v34) {
      *a8 = v34;
    }
  }
  BOOL v35 = *((unsigned char *)v66 + 24) != 0;
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);

  return v35;
}

- (id)__calloutToScanForNetworksWithParameters:(id)a3 scanChannels:(id *)a4 error:(id *)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v53 = 0;
  int v54 = &v53;
  uint64_t v55 = 0x3032000000;
  id v56 = sub_1B4F51C4C;
  uint64_t v57 = sub_1B4F51BD4;
  id v58 = 0;
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x3032000000;
  uint64_t v50 = sub_1B4F51C4C;
  uint64_t v51 = sub_1B4F51BD4;
  id v52 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3032000000;
  uint64_t v44 = sub_1B4F51C4C;
  id v45 = sub_1B4F51BD4;
  id v46 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  int v40 = 0;
  dispatch_block_t v9 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1F0DA3570);
  __uint64_t v10 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  id v11 = CWFGetOSLog();
  if (v11)
  {
    uint64_t v12 = CWFGetOSLog();
  }
  else
  {
    uint64_t v12 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v59 = 134219010;
    unint64_t v60 = v10 / 0x3B9ACA00;
    __int16 v61 = 2048;
    unint64_t v62 = v10 % 0x3B9ACA00 / 0x3E8;
    __int16 v63 = 2082;
    char v64 = "-[CWFAutoJoinManager __calloutToScanForNetworksWithParameters:scanChannels:error:]";
    __int16 v65 = 2082;
    uint64_t v66 = "CWFAutoJoinManager.m";
    __int16 v67 = 1024;
    int v68 = 6776;
    int v31 = 48;
    id v30 = &v59;
    _os_log_send_and_compose_impl();
  }

  targetQueue = self->_targetQueue;
  qos_class_t v15 = qos_class_self();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4FB0AD0;
  block[3] = &unk_1E60BC570;
  void block[4] = self;
  id v16 = v8;
  id v33 = v16;
  BOOL v35 = &v53;
  char v36 = &v47;
  int v37 = &v41;
  unint64_t v38 = v39;
  id v17 = v9;
  id v34 = v17;
  dispatch_block_t v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v15, 0, block);
  dispatch_async(targetQueue, v18);

  dispatch_block_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
  {
    uint64_t v23 = (void *)v48[5];
    if (v23) {
      *a4 = v23;
    }
  }
  if (a5)
  {
    int64_t v24 = (void *)v42[5];
    if (v24) {
      *a5 = v24;
    }
  }
  if (objc_msgSend_count((void *)v54[5], v19, v20, v21, v22, v30, v31)) {
    objc_msgSend_addObjectsFromArray_(self->_cumulativeScanResults, v25, v54[5], v26, v27);
  }
  id v28 = (id)v54[5];

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  return v28;
}

- (id)__calloutToPerformGASQueryWithParameters:(id)a3 GASQueryNetworks:(id *)a4 error:(id *)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v44 = 0;
  id v45 = &v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = sub_1B4F51C4C;
  uint64_t v48 = sub_1B4F51BD4;
  id v49 = 0;
  uint64_t v38 = 0;
  __int16 v39 = &v38;
  uint64_t v40 = 0x3032000000;
  uint64_t v41 = sub_1B4F51C4C;
  uint64_t v42 = sub_1B4F51BD4;
  id v43 = 0;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  BOOL v35 = sub_1B4F51C4C;
  char v36 = sub_1B4F51BD4;
  id v37 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  int v31 = 0;
  dispatch_block_t v9 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1F0DA2D90);
  __uint64_t v10 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  id v11 = CWFGetOSLog();
  if (v11)
  {
    uint64_t v12 = CWFGetOSLog();
  }
  else
  {
    uint64_t v12 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v50 = 134219010;
    unint64_t v51 = v10 / 0x3B9ACA00;
    __int16 v52 = 2048;
    unint64_t v53 = v10 % 0x3B9ACA00 / 0x3E8;
    __int16 v54 = 2082;
    uint64_t v55 = "-[CWFAutoJoinManager __calloutToPerformGASQueryWithParameters:GASQueryNetworks:error:]";
    __int16 v56 = 2082;
    uint64_t v57 = "CWFAutoJoinManager.m";
    __int16 v58 = 1024;
    int v59 = 6827;
    _os_log_send_and_compose_impl();
  }

  targetQueue = self->_targetQueue;
  qos_class_t v15 = qos_class_self();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4FB12D8;
  block[3] = &unk_1E60BC570;
  void block[4] = self;
  id v16 = v8;
  id v24 = v16;
  uint64_t v26 = &v44;
  uint64_t v27 = &v38;
  id v28 = &v32;
  uint64_t v29 = v30;
  id v17 = v9;
  id v25 = v17;
  dispatch_block_t v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v15, 0, block);
  dispatch_async(targetQueue, v18);

  dispatch_block_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
  {
    uint64_t v19 = (void *)v39[5];
    if (v19) {
      *a4 = v19;
    }
  }
  if (a5)
  {
    uint64_t v20 = (void *)v33[5];
    if (v20) {
      *a5 = v20;
    }
  }
  id v21 = (id)v45[5];

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return v21;
}

- (BOOL)__calloutToAllowJoinCandidate:(id)a3 trigger:(int64_t)a4 defer:(BOOL *)a5 error:(id *)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v44 = 0;
  id v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  uint64_t v34 = 0;
  BOOL v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = sub_1B4F51C4C;
  uint64_t v38 = sub_1B4F51BD4;
  id v39 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  int v33 = 0;
  dispatch_block_t v11 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1F0DA2DF0);
  __uint64_t v12 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  id v13 = CWFGetOSLog();
  if (v13)
  {
    id v14 = CWFGetOSLog();
  }
  else
  {
    id v14 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v48 = 134219010;
    unint64_t v49 = v12 / 0x3B9ACA00;
    __int16 v50 = 2048;
    unint64_t v51 = v12 % 0x3B9ACA00 / 0x3E8;
    __int16 v52 = 2082;
    unint64_t v53 = "-[CWFAutoJoinManager __calloutToAllowJoinCandidate:trigger:defer:error:]";
    __int16 v54 = 2082;
    uint64_t v55 = "CWFAutoJoinManager.m";
    __int16 v56 = 1024;
    int v57 = 6874;
    _os_log_send_and_compose_impl();
  }

  targetQueue = self->_targetQueue;
  qos_class_t v17 = qos_class_self();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4FB1A7C;
  block[3] = &unk_1E60BC598;
  void block[4] = self;
  id v18 = v10;
  id v25 = v18;
  uint64_t v27 = &v44;
  id v28 = &v40;
  uint64_t v29 = &v34;
  id v30 = v32;
  int64_t v31 = a4;
  id v19 = v11;
  id v26 = v19;
  dispatch_block_t v20 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v17, 0, block);
  dispatch_async(targetQueue, v20);

  dispatch_block_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
  if (a5 && *((unsigned char *)v41 + 24)) {
    *a5 = 1;
  }
  if (a6)
  {
    id v21 = (void *)v35[5];
    if (v21) {
      *a6 = v21;
    }
  }
  BOOL v22 = *((unsigned char *)v45 + 24) != 0;

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  return v22;
}

- (BOOL)__calloutToAssociateWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_1B4F51C4C;
  int64_t v31 = sub_1B4F51BD4;
  id v32 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  int v26 = 0;
  dispatch_block_t v7 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1F0DA3CB0);
  __uint64_t v8 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  dispatch_block_t v9 = CWFGetOSLog();
  if (v9)
  {
    id v10 = CWFGetOSLog();
  }
  else
  {
    id v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v33 = 134219010;
    unint64_t v34 = v8 / 0x3B9ACA00;
    __int16 v35 = 2048;
    unint64_t v36 = v8 % 0x3B9ACA00 / 0x3E8;
    __int16 v37 = 2082;
    uint64_t v38 = "-[CWFAutoJoinManager __calloutToAssociateWithParameters:error:]";
    __int16 v39 = 2082;
    uint64_t v40 = "CWFAutoJoinManager.m";
    __int16 v41 = 1024;
    int v42 = 6917;
    _os_log_send_and_compose_impl();
  }

  targetQueue = self->_targetQueue;
  qos_class_t v13 = qos_class_self();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4FB2170;
  block[3] = &unk_1E60BC5E8;
  void block[4] = self;
  id v14 = v6;
  id v21 = v14;
  uint64_t v23 = &v27;
  id v24 = v25;
  id v15 = v7;
  id v22 = v15;
  dispatch_block_t v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v13, 0, block);
  dispatch_async(targetQueue, v16);

  dispatch_block_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  qos_class_t v17 = (void *)v28[5];
  if (a4 && v17)
  {
    *a4 = v17;
    qos_class_t v17 = (void *)v28[5];
  }
  BOOL v18 = v17 == 0;

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

  return v18;
}

- (int64_t)__calloutToAllowAutoHotspotWithTrigger:(int64_t)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v33 = 0;
  unint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_1B4F51C4C;
  int64_t v31 = sub_1B4F51BD4;
  id v32 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  int v26 = 0;
  dispatch_block_t v7 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1F0DA42B0);
  __uint64_t v8 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  dispatch_block_t v9 = CWFGetOSLog();
  if (v9)
  {
    id v10 = CWFGetOSLog();
  }
  else
  {
    id v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v37 = 134219010;
    unint64_t v38 = v8 / 0x3B9ACA00;
    __int16 v39 = 2048;
    unint64_t v40 = v8 % 0x3B9ACA00 / 0x3E8;
    __int16 v41 = 2082;
    int v42 = "-[CWFAutoJoinManager __calloutToAllowAutoHotspotWithTrigger:error:]";
    __int16 v43 = 2082;
    uint64_t v44 = "CWFAutoJoinManager.m";
    __int16 v45 = 1024;
    int v46 = 6954;
    _os_log_send_and_compose_impl();
  }

  targetQueue = self->_targetQueue;
  qos_class_t v13 = qos_class_self();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4FB2838;
  block[3] = &unk_1E60BC4A8;
  void block[4] = self;
  id v21 = &v33;
  id v22 = &v27;
  uint64_t v23 = v25;
  int64_t v24 = a3;
  id v14 = v7;
  id v20 = v14;
  dispatch_block_t v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v13, 0, block);
  dispatch_async(targetQueue, v15);

  dispatch_block_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
  {
    dispatch_block_t v16 = (void *)v28[5];
    if (v16) {
      *a4 = v16;
    }
  }
  int64_t v17 = v34[3];

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v17;
}

- (BOOL)__calloutToAllowHotspot:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  int64_t v31 = sub_1B4F51C4C;
  id v32 = sub_1B4F51BD4;
  id v33 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  int v27 = 0;
  dispatch_block_t v7 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1F0DA42D0);
  __uint64_t v8 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  dispatch_block_t v9 = CWFGetOSLog();
  if (v9)
  {
    id v10 = CWFGetOSLog();
  }
  else
  {
    id v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v38 = 134219010;
    unint64_t v39 = v8 / 0x3B9ACA00;
    __int16 v40 = 2048;
    unint64_t v41 = v8 % 0x3B9ACA00 / 0x3E8;
    __int16 v42 = 2082;
    __int16 v43 = "-[CWFAutoJoinManager __calloutToAllowHotspot:error:]";
    __int16 v44 = 2082;
    __int16 v45 = "CWFAutoJoinManager.m";
    __int16 v46 = 1024;
    int v47 = 6992;
    _os_log_send_and_compose_impl();
  }

  targetQueue = self->_targetQueue;
  qos_class_t v13 = qos_class_self();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4FB2F38;
  block[3] = &unk_1E60BC638;
  void block[4] = self;
  id v14 = v6;
  id v21 = v14;
  uint64_t v23 = &v34;
  int64_t v24 = &v28;
  id v25 = v26;
  id v15 = v7;
  id v22 = v15;
  dispatch_block_t v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v13, 0, block);
  dispatch_async(targetQueue, v16);

  dispatch_block_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
  {
    int64_t v17 = (void *)v29[5];
    if (v17) {
      *a4 = v17;
    }
  }
  BOOL v18 = *((unsigned char *)v35 + 24) != 0;

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v18;
}

- (id)__calloutToBrowseForHotspotsWithTimeout:(unint64_t)a3 maxCacheAge:(unint64_t)a4 cacheOnly:(BOOL)a5 error:(id *)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v39 = 0;
  __int16 v40 = &v39;
  uint64_t v41 = 0x3032000000;
  __int16 v42 = sub_1B4F51C4C;
  __int16 v43 = sub_1B4F51BD4;
  id v44 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = sub_1B4F51C4C;
  char v37 = sub_1B4F51BD4;
  id v38 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  int v32 = 0;
  dispatch_block_t v11 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1F0DA34D0);
  __uint64_t v12 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  qos_class_t v13 = CWFGetOSLog();
  if (v13)
  {
    id v14 = CWFGetOSLog();
  }
  else
  {
    id v14 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v45 = 134219010;
    unint64_t v46 = v12 / 0x3B9ACA00;
    __int16 v47 = 2048;
    unint64_t v48 = v12 % 0x3B9ACA00 / 0x3E8;
    __int16 v49 = 2082;
    __int16 v50 = "-[CWFAutoJoinManager __calloutToBrowseForHotspotsWithTimeout:maxCacheAge:cacheOnly:error:]";
    __int16 v51 = 2082;
    __int16 v52 = "CWFAutoJoinManager.m";
    __int16 v53 = 1024;
    int v54 = 7030;
    _os_log_send_and_compose_impl();
  }

  targetQueue = self->_targetQueue;
  qos_class_t v17 = qos_class_self();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4FB366C;
  block[3] = &unk_1E60BC688;
  unint64_t v28 = a3;
  unint64_t v29 = a4;
  BOOL v30 = a5;
  void block[4] = self;
  id v25 = &v39;
  int v26 = &v33;
  int v27 = v31;
  id v18 = v11;
  id v24 = v18;
  dispatch_block_t v19 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v17, 0, block);
  dispatch_async(targetQueue, v19);

  dispatch_block_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  if (a6)
  {
    id v20 = (void *)v34[5];
    if (v20) {
      *a6 = v20;
    }
  }
  id v21 = (id)v40[5];

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  return v21;
}

- (BOOL)__calloutToConnectToHotspot:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v27 = 0;
  unint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  BOOL v30 = sub_1B4F51C4C;
  int64_t v31 = sub_1B4F51BD4;
  id v32 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  int v26 = 0;
  dispatch_block_t v7 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1F0DA42F0);
  __uint64_t v8 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  dispatch_block_t v9 = CWFGetOSLog();
  if (v9)
  {
    id v10 = CWFGetOSLog();
  }
  else
  {
    id v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v33 = 134219010;
    unint64_t v34 = v8 / 0x3B9ACA00;
    __int16 v35 = 2048;
    unint64_t v36 = v8 % 0x3B9ACA00 / 0x3E8;
    __int16 v37 = 2082;
    id v38 = "-[CWFAutoJoinManager __calloutToConnectToHotspot:error:]";
    __int16 v39 = 2082;
    __int16 v40 = "CWFAutoJoinManager.m";
    __int16 v41 = 1024;
    int v42 = 7067;
    _os_log_send_and_compose_impl();
  }

  targetQueue = self->_targetQueue;
  qos_class_t v13 = qos_class_self();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4FB3D60;
  block[3] = &unk_1E60BC5E8;
  void block[4] = self;
  id v14 = v6;
  id v21 = v14;
  uint64_t v23 = &v27;
  id v24 = v25;
  id v15 = v7;
  id v22 = v15;
  dispatch_block_t v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v13, 0, block);
  dispatch_async(targetQueue, v16);

  dispatch_block_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  qos_class_t v17 = (void *)v28[5];
  if (a4 && v17)
  {
    *a4 = v17;
    qos_class_t v17 = (void *)v28[5];
  }
  BOOL v18 = v17 == 0;

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

  return v18;
}

- (id)allowAutoJoinHandler
{
  return objc_getProperty(self, a2, 424, 1);
}

- (void)setAllowAutoJoinHandler:(id)a3
{
}

- (id)allowKnownNetworkHandler
{
  return objc_getProperty(self, a2, 432, 1);
}

- (void)setAllowKnownNetworkHandler:(id)a3
{
}

- (id)knownNetworkComparator
{
  return objc_getProperty(self, a2, 440, 1);
}

- (void)setKnownNetworkComparator:(id)a3
{
}

- (id)scanForNetworksHandler
{
  return objc_getProperty(self, a2, 448, 1);
}

- (void)setScanForNetworksHandler:(id)a3
{
}

- (id)performGASQueryHandler
{
  return objc_getProperty(self, a2, 456, 1);
}

- (void)setPerformGASQueryHandler:(id)a3
{
}

- (id)allowJoinCandidateHandler
{
  return objc_getProperty(self, a2, 464, 1);
}

- (void)setAllowJoinCandidateHandler:(id)a3
{
}

- (id)joinCandidateComparator
{
  return objc_getProperty(self, a2, 472, 1);
}

- (void)setJoinCandidateComparator:(id)a3
{
}

- (id)associateToNetworkHandler
{
  return objc_getProperty(self, a2, 480, 1);
}

- (void)setAssociateToNetworkHandler:(id)a3
{
}

- (id)allowAutoHotspotHandler
{
  return objc_getProperty(self, a2, 488, 1);
}

- (void)setAllowAutoHotspotHandler:(id)a3
{
}

- (id)allowHotspotHandler
{
  return objc_getProperty(self, a2, 496, 1);
}

- (void)setAllowHotspotHandler:(id)a3
{
}

- (id)browseForHotspotsHandler
{
  return objc_getProperty(self, a2, 504, 1);
}

- (void)setBrowseForHotspotsHandler:(id)a3
{
}

- (id)connectToHotspotHandler
{
  return objc_getProperty(self, a2, 512, 1);
}

- (void)setConnectToHotspotHandler:(id)a3
{
}

- (id)updateKnownNetworkHandler
{
  return objc_getProperty(self, a2, 520, 1);
}

- (void)setUpdateKnownNetworkHandler:(id)a3
{
}

- (id)eventHandler
{
  return objc_getProperty(self, a2, 528, 1);
}

- (void)setEventHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 536, 1);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (OS_dispatch_queue)targetQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 544, 1);
}

- (void)setTargetQueue:(id)a3
{
}

- (NSString)colocatedScopeID
{
  return self->_colocatedScopeID;
}

- (void)setColocatedScopeID:(id)a3
{
}

- (BOOL)lockdownModeEnabled
{
  return self->_lockdownModeEnabled;
}

- (void)setLockdownModeEnabled:(BOOL)a3
{
  self->_lockdownModeEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colocatedScopeID, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong(&self->_updateKnownNetworkHandler, 0);
  objc_storeStrong(&self->_connectToHotspotHandler, 0);
  objc_storeStrong(&self->_browseForHotspotsHandler, 0);
  objc_storeStrong(&self->_allowHotspotHandler, 0);
  objc_storeStrong(&self->_allowAutoHotspotHandler, 0);
  objc_storeStrong(&self->_associateToNetworkHandler, 0);
  objc_storeStrong(&self->_joinCandidateComparator, 0);
  objc_storeStrong(&self->_allowJoinCandidateHandler, 0);
  objc_storeStrong(&self->_performGASQueryHandler, 0);
  objc_storeStrong(&self->_scanForNetworksHandler, 0);
  objc_storeStrong(&self->_knownNetworkComparator, 0);
  objc_storeStrong(&self->_allowKnownNetworkHandler, 0);
  objc_storeStrong(&self->_allowAutoJoinHandler, 0);
  objc_storeStrong((id *)&self->_cachedCarPlayPreferredChannels, 0);
  objc_storeStrong((id *)&self->_steerToNetwork, 0);
  objc_storeStrong((id *)&self->_steerFromNetwork, 0);
  objc_storeStrong((id *)&self->_deferredKnownNetworks, 0);
  objc_storeStrong((id *)&self->_disallowedKnownNetworks, 0);
  objc_storeStrong((id *)&self->_updatedAllowCacheKnownNetworks, 0);
  objc_storeStrong((id *)&self->_knownNetworkDeferCache, 0);
  objc_storeStrong((id *)&self->_knownNetworkAllowErrorCache, 0);
  objc_storeStrong((id *)&self->_knownNetworkAllowCache, 0);
  objc_storeStrong((id *)&self->_knownNetworkPasspointDomainMap, 0);
  objc_storeStrong((id *)&self->_knownNetworkSSIDMap, 0);
  objc_storeStrong((id *)&self->_cachedKnownNetworksContexts, 0);
  objc_storeStrong((id *)&self->_hiddenNetworkChannels, 0);
  objc_storeStrong((id *)&self->_deferredColocatedJoinCandidateMap, 0);
  objc_storeStrong((id *)&self->_nextRequestTimer, 0);
  objc_storeStrong((id *)&self->_throttleTimestampMap, 0);
  objc_storeStrong((id *)&self->_throttleIntervalMap, 0);
  objc_storeStrong((id *)&self->_triggerTimestampMap, 0);
  objc_storeStrong((id *)&self->_underlyingCancelError, 0);
  objc_storeStrong((id *)&self->_cumulativeScanResults, 0);
  objc_storeStrong((id *)&self->_followup6GHzScanResultsMap, 0);
  objc_storeStrong((id *)&self->_followup6GHzFILSDMap, 0);
  objc_storeStrong((id *)&self->_followup6GHzRNRMap, 0);
  objc_storeStrong((id *)&self->_failedToJoinKnownNetworkIDs, 0);
  objc_storeStrong((id *)&self->_metric, 0);
  objc_storeStrong((id *)&self->_cachedMetric, 0);
  objc_storeStrong((id *)&self->_statisticsSubmissionTimer, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_activeRequest, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_retryIntervalMap, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_associatedNetwork, 0);
  objc_storeStrong((id *)&self->_knownNetworks, 0);
  objc_storeStrong((id *)&self->_supportedChannels, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end