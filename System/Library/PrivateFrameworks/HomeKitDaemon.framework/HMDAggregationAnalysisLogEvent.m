@interface HMDAggregationAnalysisLogEvent
- (BOOL)cloudSyncLastDecryptionFailed;
- (BOOL)cloudSyncMaximumDelayReached;
- (BOOL)isActiveDay;
- (BOOL)v2ElectionCurrentDeviceInSecondaryCoordinationMesh;
- (HMDEventCountersManager)eventCountersManager;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)dataSyncState;
- (NSString)description;
- (int64_t)countOfDaysSinceLastActive;
- (int64_t)primaryResidentDurationMinutes;
- (int64_t)processAbnormalExitCount;
- (int64_t)v2ElectionPercentageDurationCurrentDeviceIsInPrimaryMesh;
- (unint64_t)acceptedXPCRequestsCount;
- (unint64_t)activeDaysPerMonthCount;
- (unint64_t)averageLatencyBT;
- (unint64_t)averageLatencyIDS;
- (unint64_t)averageLatencyIP;
- (unint64_t)bulletinNotificationsPostedCount;
- (unint64_t)cameraRecordingReachabilityChangedCount;
- (unint64_t)cameraRecordingReachabilityOfflineDuration;
- (unint64_t)cameraStreamStartFailureCount;
- (unint64_t)cameraStreamStartSuccessCount;
- (unint64_t)cloudStoreCoreDataTransactionCount;
- (unint64_t)cloudSyncDecryptionFailedCount;
- (unint64_t)cloudSyncFetchCount;
- (unint64_t)cloudSyncPushCount;
- (unint64_t)cloudSyncUploadCount;
- (unint64_t)cloudSyncUploadErrorCount;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)coreDataCloudKitExportCount;
- (unint64_t)coreDataCloudKitImportCount;
- (unint64_t)currentDeviceStartedLegacyElectionCount;
- (unint64_t)erroredXPCRequestsCount;
- (unint64_t)fetchCameraClipVideoSegmentAssetCount;
- (unint64_t)filteredXPCNotificationsCount;
- (unint64_t)generationCounterIncrementCount;
- (unint64_t)hapBTLEConnectionPerReasonsCount;
- (unint64_t)hapBTLEConnectionsCount;
- (unint64_t)hapBTLEDiscoveriesCount;
- (unint64_t)hapIPInvalidationCount;
- (unint64_t)hapIPReceivedHTTPEventCount;
- (unint64_t)hapIPReceivedHTTPResponsesCount;
- (unint64_t)hapIPSentHTTPRequestsCount;
- (unint64_t)homeDataBytesFetched;
- (unint64_t)homeDataBytesPushed;
- (unint64_t)homeHubReachabilityChangedCount;
- (unint64_t)ipAccessoryReachabilityChangedCount;
- (unint64_t)jetsamReasonHighwaterCount;
- (unint64_t)jetsamReasonOtherCount;
- (unint64_t)jetsamReasonProcessLimitCount;
- (unint64_t)legacyCloudSyncPushCount;
- (unint64_t)legacyHomeDataBytesFetched;
- (unint64_t)legacyHomeDataBytesPushed;
- (unint64_t)notifyXPCClientsHomeDataChangedCount;
- (unint64_t)numAccessoriesAdded;
- (unint64_t)numReadFirstPartyApp;
- (unint64_t)numReadInternalRequested;
- (unint64_t)numReadSiri;
- (unint64_t)numReadThirdPartyApp;
- (unint64_t)numReadUnknownSource;
- (unint64_t)numReadWriteFailureBT;
- (unint64_t)numReadWriteFailureIDS;
- (unint64_t)numReadWriteFailureIP;
- (unint64_t)numReadWriteSuccessBT;
- (unint64_t)numReadWriteSuccessIDS;
- (unint64_t)numReadWriteSuccessIP;
- (unint64_t)numScenesAdded;
- (unint64_t)numScenesUserRun;
- (unint64_t)numShortcutsAdded;
- (unint64_t)numShortcutsRun;
- (unint64_t)numTriggersAdded;
- (unint64_t)numTriggersFired;
- (unint64_t)numWriteFirstPartyApp;
- (unint64_t)numWriteInternalRequested;
- (unint64_t)numWriteSiri;
- (unint64_t)numWriteThirdPartyApp;
- (unint64_t)numWriteUnknownSource;
- (unint64_t)peakConcurrentBLEAccessoryUpdateApply;
- (unint64_t)peakConcurrentBLEAccessoryUpdateStaging;
- (unint64_t)peakConcurrentIPAccessoryUpdateApply;
- (unint64_t)peakConcurrentIPAccessoryUpdateStaging;
- (unint64_t)peakConcurrentThreadAccessoryUpdateApply;
- (unint64_t)peakConcurrentThreadAccessoryUpdateStaging;
- (unint64_t)processCrashCount;
- (unint64_t)processJetsamCount;
- (unint64_t)processLaunchCount;
- (unint64_t)processMemoryPressureStateCriticalCount;
- (unint64_t)processMemoryPressureStateWarningCount;
- (unint64_t)remoteMessagesReceivedCount;
- (unint64_t)remoteMessagesSentCount;
- (unint64_t)residentSelectionPrimaryResidentChangedCount;
- (unint64_t)residentSyncFetchHomeDataRequestCount;
- (unint64_t)residentSyncHomeDataChangedNotificationCount;
- (unint64_t)rxIDSMessagesCount;
- (unint64_t)rxIDSProxyMessagesCount;
- (unint64_t)rxLoxyMessagesCount;
- (unint64_t)rxRapportMessagesCount;
- (unint64_t)rxSecureMessagesCount;
- (unint64_t)sampledAverageProcessMemoryUsageMB;
- (unint64_t)sampledPeakProcessMemoryUsageMB;
- (unint64_t)sentXPCNotificationsCount;
- (unint64_t)txIDSMessagesCount;
- (unint64_t)txIDSProxyMessagesCount;
- (unint64_t)txLoxyMessagesCount;
- (unint64_t)txRapportMessagesCount;
- (unint64_t)txSecureMessagesCount;
- (unint64_t)v2ElectionCoordinationCurrentDeviceFlapCount;
- (unint64_t)v2ElectionCoordinationMeshLeaderChangedCount;
- (unint64_t)v2ElectionCoordinationMeshLeaderElectedCount;
- (unint64_t)v2ElectionCoordinationMeshUpdateCount;
- (unint64_t)v2ElectionPrimaryResidentChangedCount;
- (unint64_t)v2ElectionPrimaryResidentElectionRunCount;
- (unint64_t)widgetMaxRefreshCountForKind;
- (unint64_t)workingStoreCoreDataTransactionCount;
- (void)setAcceptedXPCRequestsCount:(unint64_t)a3;
- (void)setActiveDay:(BOOL)a3;
- (void)setActiveDaysPerMonthCount:(unint64_t)a3;
- (void)setAverageLatencyBT:(unint64_t)a3;
- (void)setAverageLatencyIDS:(unint64_t)a3;
- (void)setAverageLatencyIP:(unint64_t)a3;
- (void)setBulletinNotificationsPostedCount:(unint64_t)a3;
- (void)setCameraRecordingReachabilityChangedCount:(unint64_t)a3;
- (void)setCameraRecordingReachabilityOfflineDuration:(unint64_t)a3;
- (void)setCameraStreamStartFailureCount:(unint64_t)a3;
- (void)setCameraStreamStartSuccessCount:(unint64_t)a3;
- (void)setCloudStoreCoreDataTransactionCount:(unint64_t)a3;
- (void)setCloudSyncDecryptionFailedCount:(unint64_t)a3;
- (void)setCloudSyncFetchCount:(unint64_t)a3;
- (void)setCloudSyncLastDecryptionFailed:(BOOL)a3;
- (void)setCloudSyncMaximumDelayReached:(BOOL)a3;
- (void)setCloudSyncPushCount:(unint64_t)a3;
- (void)setCloudSyncUploadCount:(unint64_t)a3;
- (void)setCloudSyncUploadErrorCount:(unint64_t)a3;
- (void)setCoreDataCloudKitExportCount:(unint64_t)a3;
- (void)setCoreDataCloudKitImportCount:(unint64_t)a3;
- (void)setCountOfDaysSinceLastActive:(int64_t)a3;
- (void)setCurrentDeviceStartedLegacyElectionCount:(unint64_t)a3;
- (void)setDataSyncState:(id)a3;
- (void)setErroredXPCRequestsCount:(unint64_t)a3;
- (void)setFetchCameraClipVideoSegmentAssetCount:(unint64_t)a3;
- (void)setFilteredXPCNotificationsCount:(unint64_t)a3;
- (void)setGenerationCounterIncrementCount:(unint64_t)a3;
- (void)setHapBTLEConnectionPerReasonsCount:(unint64_t)a3;
- (void)setHapBTLEConnectionsCount:(unint64_t)a3;
- (void)setHapBTLEDiscoveriesCount:(unint64_t)a3;
- (void)setHapIPInvalidationCount:(unint64_t)a3;
- (void)setHapIPReceivedHTTPEventCount:(unint64_t)a3;
- (void)setHapIPReceivedHTTPResponsesCount:(unint64_t)a3;
- (void)setHapIPSentHTTPRequestsCount:(unint64_t)a3;
- (void)setHomeDataBytesFetched:(unint64_t)a3;
- (void)setHomeDataBytesPushed:(unint64_t)a3;
- (void)setHomeHubReachabilityChangedCount:(unint64_t)a3;
- (void)setIpAccessoryReachabilityChangedCount:(unint64_t)a3;
- (void)setJetsamReasonHighwaterCount:(unint64_t)a3;
- (void)setJetsamReasonOtherCount:(unint64_t)a3;
- (void)setJetsamReasonProcessLimitCount:(unint64_t)a3;
- (void)setLegacyCloudSyncPushCount:(unint64_t)a3;
- (void)setLegacyHomeDataBytesFetched:(unint64_t)a3;
- (void)setLegacyHomeDataBytesPushed:(unint64_t)a3;
- (void)setNotifyXPCClientsHomeDataChangedCount:(unint64_t)a3;
- (void)setNumAccessoriesAdded:(unint64_t)a3;
- (void)setNumReadFirstPartyApp:(unint64_t)a3;
- (void)setNumReadInternalRequested:(unint64_t)a3;
- (void)setNumReadSiri:(unint64_t)a3;
- (void)setNumReadThirdPartyApp:(unint64_t)a3;
- (void)setNumReadUnknownSource:(unint64_t)a3;
- (void)setNumReadWriteFailureBT:(unint64_t)a3;
- (void)setNumReadWriteFailureIDS:(unint64_t)a3;
- (void)setNumReadWriteFailureIP:(unint64_t)a3;
- (void)setNumReadWriteSuccessBT:(unint64_t)a3;
- (void)setNumReadWriteSuccessIDS:(unint64_t)a3;
- (void)setNumReadWriteSuccessIP:(unint64_t)a3;
- (void)setNumScenesAdded:(unint64_t)a3;
- (void)setNumScenesUserRun:(unint64_t)a3;
- (void)setNumShortcutsAdded:(unint64_t)a3;
- (void)setNumShortcutsRun:(unint64_t)a3;
- (void)setNumTriggersAdded:(unint64_t)a3;
- (void)setNumTriggersFired:(unint64_t)a3;
- (void)setNumWriteFirstPartyApp:(unint64_t)a3;
- (void)setNumWriteInternalRequested:(unint64_t)a3;
- (void)setNumWriteSiri:(unint64_t)a3;
- (void)setNumWriteThirdPartyApp:(unint64_t)a3;
- (void)setNumWriteUnknownSource:(unint64_t)a3;
- (void)setPeakConcurrentBLEAccessoryUpdateApply:(unint64_t)a3;
- (void)setPeakConcurrentBLEAccessoryUpdateStaging:(unint64_t)a3;
- (void)setPeakConcurrentIPAccessoryUpdateApply:(unint64_t)a3;
- (void)setPeakConcurrentIPAccessoryUpdateStaging:(unint64_t)a3;
- (void)setPeakConcurrentThreadAccessoryUpdateApply:(unint64_t)a3;
- (void)setPeakConcurrentThreadAccessoryUpdateStaging:(unint64_t)a3;
- (void)setPrimaryResidentDurationMinutes:(int64_t)a3;
- (void)setProcessAbnormalExitCount:(int64_t)a3;
- (void)setProcessCrashCount:(unint64_t)a3;
- (void)setProcessJetsamCount:(unint64_t)a3;
- (void)setProcessLaunchCount:(unint64_t)a3;
- (void)setProcessMemoryPressureStateCriticalCount:(unint64_t)a3;
- (void)setProcessMemoryPressureStateWarningCount:(unint64_t)a3;
- (void)setRemoteMessagesReceivedCount:(unint64_t)a3;
- (void)setRemoteMessagesSentCount:(unint64_t)a3;
- (void)setResidentSelectionPrimaryResidentChangedCount:(unint64_t)a3;
- (void)setResidentSyncFetchHomeDataRequestCount:(unint64_t)a3;
- (void)setResidentSyncHomeDataChangedNotificationCount:(unint64_t)a3;
- (void)setRxIDSMessagesCount:(unint64_t)a3;
- (void)setRxIDSProxyMessagesCount:(unint64_t)a3;
- (void)setRxLoxyMessagesCount:(unint64_t)a3;
- (void)setRxRapportMessagesCount:(unint64_t)a3;
- (void)setRxSecureMessagesCount:(unint64_t)a3;
- (void)setSampledAverageProcessMemoryUsageMB:(unint64_t)a3;
- (void)setSampledPeakProcessMemoryUsageMB:(unint64_t)a3;
- (void)setSentXPCNotificationsCount:(unint64_t)a3;
- (void)setTxIDSMessagesCount:(unint64_t)a3;
- (void)setTxIDSProxyMessagesCount:(unint64_t)a3;
- (void)setTxLoxyMessagesCount:(unint64_t)a3;
- (void)setTxRapportMessagesCount:(unint64_t)a3;
- (void)setTxSecureMessagesCount:(unint64_t)a3;
- (void)setV2ElectionCoordinationCurrentDeviceFlapCount:(unint64_t)a3;
- (void)setV2ElectionCoordinationMeshLeaderChangedCount:(unint64_t)a3;
- (void)setV2ElectionCoordinationMeshLeaderElectedCount:(unint64_t)a3;
- (void)setV2ElectionCoordinationMeshUpdateCount:(unint64_t)a3;
- (void)setV2ElectionCurrentDeviceInSecondaryCoordinationMesh:(BOOL)a3;
- (void)setV2ElectionPercentageDurationCurrentDeviceIsInPrimaryMesh:(int64_t)a3;
- (void)setV2ElectionPrimaryResidentChangedCount:(unint64_t)a3;
- (void)setV2ElectionPrimaryResidentElectionRunCount:(unint64_t)a3;
- (void)setWidgetMaxRefreshCountForKind:(unint64_t)a3;
- (void)setWorkingStoreCoreDataTransactionCount:(unint64_t)a3;
@end

@implementation HMDAggregationAnalysisLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventCountersManager, 0);
  objc_storeStrong((id *)&self->_dataSyncState, 0);
}

- (HMDEventCountersManager)eventCountersManager
{
  return self->_eventCountersManager;
}

- (void)setWidgetMaxRefreshCountForKind:(unint64_t)a3
{
  self->_widgetMaxRefreshCountForKind = a3;
}

- (unint64_t)widgetMaxRefreshCountForKind
{
  return self->_widgetMaxRefreshCountForKind;
}

- (void)setPeakConcurrentThreadAccessoryUpdateApply:(unint64_t)a3
{
  self->_peakConcurrentThreadAccessoryUpdateApply = a3;
}

- (unint64_t)peakConcurrentThreadAccessoryUpdateApply
{
  return self->_peakConcurrentThreadAccessoryUpdateApply;
}

- (void)setPeakConcurrentThreadAccessoryUpdateStaging:(unint64_t)a3
{
  self->_peakConcurrentThreadAccessoryUpdateStaging = a3;
}

- (unint64_t)peakConcurrentThreadAccessoryUpdateStaging
{
  return self->_peakConcurrentThreadAccessoryUpdateStaging;
}

- (void)setPeakConcurrentBLEAccessoryUpdateApply:(unint64_t)a3
{
  self->_peakConcurrentBLEAccessoryUpdateApply = a3;
}

- (unint64_t)peakConcurrentBLEAccessoryUpdateApply
{
  return self->_peakConcurrentBLEAccessoryUpdateApply;
}

- (void)setPeakConcurrentBLEAccessoryUpdateStaging:(unint64_t)a3
{
  self->_peakConcurrentBLEAccessoryUpdateStaging = a3;
}

- (unint64_t)peakConcurrentBLEAccessoryUpdateStaging
{
  return self->_peakConcurrentBLEAccessoryUpdateStaging;
}

- (void)setPeakConcurrentIPAccessoryUpdateApply:(unint64_t)a3
{
  self->_peakConcurrentIPAccessoryUpdateApply = a3;
}

- (unint64_t)peakConcurrentIPAccessoryUpdateApply
{
  return self->_peakConcurrentIPAccessoryUpdateApply;
}

- (void)setPeakConcurrentIPAccessoryUpdateStaging:(unint64_t)a3
{
  self->_peakConcurrentIPAccessoryUpdateStaging = a3;
}

- (unint64_t)peakConcurrentIPAccessoryUpdateStaging
{
  return self->_peakConcurrentIPAccessoryUpdateStaging;
}

- (void)setCountOfDaysSinceLastActive:(int64_t)a3
{
  self->_countOfDaysSinceLastActive = a3;
}

- (int64_t)countOfDaysSinceLastActive
{
  return self->_countOfDaysSinceLastActive;
}

- (void)setActiveDaysPerMonthCount:(unint64_t)a3
{
  self->_activeDaysPerMonthCount = a3;
}

- (unint64_t)activeDaysPerMonthCount
{
  return self->_activeDaysPerMonthCount;
}

- (void)setActiveDay:(BOOL)a3
{
  self->_activeDay = a3;
}

- (BOOL)isActiveDay
{
  return self->_activeDay;
}

- (void)setBulletinNotificationsPostedCount:(unint64_t)a3
{
  self->_bulletinNotificationsPostedCount = a3;
}

- (unint64_t)bulletinNotificationsPostedCount
{
  return self->_bulletinNotificationsPostedCount;
}

- (void)setPrimaryResidentDurationMinutes:(int64_t)a3
{
  self->_primaryResidentDurationMinutes = a3;
}

- (int64_t)primaryResidentDurationMinutes
{
  return self->_primaryResidentDurationMinutes;
}

- (void)setV2ElectionPercentageDurationCurrentDeviceIsInPrimaryMesh:(int64_t)a3
{
  self->_v2ElectionPercentageDurationCurrentDeviceIsInPrimaryMesh = a3;
}

- (int64_t)v2ElectionPercentageDurationCurrentDeviceIsInPrimaryMesh
{
  return self->_v2ElectionPercentageDurationCurrentDeviceIsInPrimaryMesh;
}

- (void)setV2ElectionCoordinationCurrentDeviceFlapCount:(unint64_t)a3
{
  self->_v2ElectionCoordinationCurrentDeviceFlapCount = a3;
}

- (unint64_t)v2ElectionCoordinationCurrentDeviceFlapCount
{
  return self->_v2ElectionCoordinationCurrentDeviceFlapCount;
}

- (void)setV2ElectionCurrentDeviceInSecondaryCoordinationMesh:(BOOL)a3
{
  self->_v2ElectionCurrentDeviceInSecondaryCoordinationMesh = a3;
}

- (BOOL)v2ElectionCurrentDeviceInSecondaryCoordinationMesh
{
  return self->_v2ElectionCurrentDeviceInSecondaryCoordinationMesh;
}

- (void)setResidentSelectionPrimaryResidentChangedCount:(unint64_t)a3
{
  self->_residentSelectionPrimaryResidentChangedCount = a3;
}

- (unint64_t)residentSelectionPrimaryResidentChangedCount
{
  return self->_residentSelectionPrimaryResidentChangedCount;
}

- (void)setV2ElectionPrimaryResidentChangedCount:(unint64_t)a3
{
  self->_v2ElectionPrimaryResidentChangedCount = a3;
}

- (unint64_t)v2ElectionPrimaryResidentChangedCount
{
  return self->_v2ElectionPrimaryResidentChangedCount;
}

- (void)setV2ElectionPrimaryResidentElectionRunCount:(unint64_t)a3
{
  self->_v2ElectionPrimaryResidentElectionRunCount = a3;
}

- (unint64_t)v2ElectionPrimaryResidentElectionRunCount
{
  return self->_v2ElectionPrimaryResidentElectionRunCount;
}

- (void)setV2ElectionCoordinationMeshLeaderChangedCount:(unint64_t)a3
{
  self->_v2ElectionCoordinationMeshLeaderChangedCount = a3;
}

- (unint64_t)v2ElectionCoordinationMeshLeaderChangedCount
{
  return self->_v2ElectionCoordinationMeshLeaderChangedCount;
}

- (void)setV2ElectionCoordinationMeshLeaderElectedCount:(unint64_t)a3
{
  self->_v2ElectionCoordinationMeshLeaderElectedCount = a3;
}

- (unint64_t)v2ElectionCoordinationMeshLeaderElectedCount
{
  return self->_v2ElectionCoordinationMeshLeaderElectedCount;
}

- (void)setV2ElectionCoordinationMeshUpdateCount:(unint64_t)a3
{
  self->_v2ElectionCoordinationMeshUpdateCount = a3;
}

- (unint64_t)v2ElectionCoordinationMeshUpdateCount
{
  return self->_v2ElectionCoordinationMeshUpdateCount;
}

- (void)setCurrentDeviceStartedLegacyElectionCount:(unint64_t)a3
{
  self->_currentDeviceStartedLegacyElectionCount = a3;
}

- (unint64_t)currentDeviceStartedLegacyElectionCount
{
  return self->_currentDeviceStartedLegacyElectionCount;
}

- (void)setIpAccessoryReachabilityChangedCount:(unint64_t)a3
{
  self->_ipAccessoryReachabilityChangedCount = a3;
}

- (unint64_t)ipAccessoryReachabilityChangedCount
{
  return self->_ipAccessoryReachabilityChangedCount;
}

- (void)setHomeHubReachabilityChangedCount:(unint64_t)a3
{
  self->_homeHubReachabilityChangedCount = a3;
}

- (unint64_t)homeHubReachabilityChangedCount
{
  return self->_homeHubReachabilityChangedCount;
}

- (void)setCameraRecordingReachabilityOfflineDuration:(unint64_t)a3
{
  self->_cameraRecordingReachabilityOfflineDuration = a3;
}

- (unint64_t)cameraRecordingReachabilityOfflineDuration
{
  return self->_cameraRecordingReachabilityOfflineDuration;
}

- (void)setCameraRecordingReachabilityChangedCount:(unint64_t)a3
{
  self->_cameraRecordingReachabilityChangedCount = a3;
}

- (unint64_t)cameraRecordingReachabilityChangedCount
{
  return self->_cameraRecordingReachabilityChangedCount;
}

- (void)setFilteredXPCNotificationsCount:(unint64_t)a3
{
  self->_filteredXPCNotificationsCount = a3;
}

- (unint64_t)filteredXPCNotificationsCount
{
  return self->_filteredXPCNotificationsCount;
}

- (void)setSentXPCNotificationsCount:(unint64_t)a3
{
  self->_sentXPCNotificationsCount = a3;
}

- (unint64_t)sentXPCNotificationsCount
{
  return self->_sentXPCNotificationsCount;
}

- (void)setErroredXPCRequestsCount:(unint64_t)a3
{
  self->_erroredXPCRequestsCount = a3;
}

- (unint64_t)erroredXPCRequestsCount
{
  return self->_erroredXPCRequestsCount;
}

- (void)setAcceptedXPCRequestsCount:(unint64_t)a3
{
  self->_acceptedXPCRequestsCount = a3;
}

- (unint64_t)acceptedXPCRequestsCount
{
  return self->_acceptedXPCRequestsCount;
}

- (void)setFetchCameraClipVideoSegmentAssetCount:(unint64_t)a3
{
  self->_fetchCameraClipVideoSegmentAssetCount = a3;
}

- (unint64_t)fetchCameraClipVideoSegmentAssetCount
{
  return self->_fetchCameraClipVideoSegmentAssetCount;
}

- (void)setCameraStreamStartFailureCount:(unint64_t)a3
{
  self->_cameraStreamStartFailureCount = a3;
}

- (unint64_t)cameraStreamStartFailureCount
{
  return self->_cameraStreamStartFailureCount;
}

- (void)setCameraStreamStartSuccessCount:(unint64_t)a3
{
  self->_cameraStreamStartSuccessCount = a3;
}

- (unint64_t)cameraStreamStartSuccessCount
{
  return self->_cameraStreamStartSuccessCount;
}

- (void)setHapBTLEDiscoveriesCount:(unint64_t)a3
{
  self->_hapBTLEDiscoveriesCount = a3;
}

- (unint64_t)hapBTLEDiscoveriesCount
{
  return self->_hapBTLEDiscoveriesCount;
}

- (void)setHapBTLEConnectionPerReasonsCount:(unint64_t)a3
{
  self->_hapBTLEConnectionPerReasonsCount = a3;
}

- (unint64_t)hapBTLEConnectionPerReasonsCount
{
  return self->_hapBTLEConnectionPerReasonsCount;
}

- (void)setHapBTLEConnectionsCount:(unint64_t)a3
{
  self->_hapBTLEConnectionsCount = a3;
}

- (unint64_t)hapBTLEConnectionsCount
{
  return self->_hapBTLEConnectionsCount;
}

- (void)setHapIPReceivedHTTPEventCount:(unint64_t)a3
{
  self->_hapIPReceivedHTTPEventCount = a3;
}

- (unint64_t)hapIPReceivedHTTPEventCount
{
  return self->_hapIPReceivedHTTPEventCount;
}

- (void)setHapIPReceivedHTTPResponsesCount:(unint64_t)a3
{
  self->_hapIPReceivedHTTPResponsesCount = a3;
}

- (unint64_t)hapIPReceivedHTTPResponsesCount
{
  return self->_hapIPReceivedHTTPResponsesCount;
}

- (void)setHapIPSentHTTPRequestsCount:(unint64_t)a3
{
  self->_hapIPSentHTTPRequestsCount = a3;
}

- (unint64_t)hapIPSentHTTPRequestsCount
{
  return self->_hapIPSentHTTPRequestsCount;
}

- (void)setHapIPInvalidationCount:(unint64_t)a3
{
  self->_hapIPInvalidationCount = a3;
}

- (unint64_t)hapIPInvalidationCount
{
  return self->_hapIPInvalidationCount;
}

- (void)setNumTriggersFired:(unint64_t)a3
{
  self->_numTriggersFired = a3;
}

- (unint64_t)numTriggersFired
{
  return self->_numTriggersFired;
}

- (void)setNumShortcutsRun:(unint64_t)a3
{
  self->_numShortcutsRun = a3;
}

- (unint64_t)numShortcutsRun
{
  return self->_numShortcutsRun;
}

- (void)setNumScenesUserRun:(unint64_t)a3
{
  self->_numScenesUserRun = a3;
}

- (unint64_t)numScenesUserRun
{
  return self->_numScenesUserRun;
}

- (void)setNumShortcutsAdded:(unint64_t)a3
{
  self->_numShortcutsAdded = a3;
}

- (unint64_t)numShortcutsAdded
{
  return self->_numShortcutsAdded;
}

- (void)setNumTriggersAdded:(unint64_t)a3
{
  self->_numTriggersAdded = a3;
}

- (unint64_t)numTriggersAdded
{
  return self->_numTriggersAdded;
}

- (void)setNumScenesAdded:(unint64_t)a3
{
  self->_numScenesAdded = a3;
}

- (unint64_t)numScenesAdded
{
  return self->_numScenesAdded;
}

- (void)setNumAccessoriesAdded:(unint64_t)a3
{
  self->_numAccessoriesAdded = a3;
}

- (unint64_t)numAccessoriesAdded
{
  return self->_numAccessoriesAdded;
}

- (void)setAverageLatencyIDS:(unint64_t)a3
{
  self->_averageLatencyIDS = a3;
}

- (unint64_t)averageLatencyIDS
{
  return self->_averageLatencyIDS;
}

- (void)setAverageLatencyBT:(unint64_t)a3
{
  self->_averageLatencyBT = a3;
}

- (unint64_t)averageLatencyBT
{
  return self->_averageLatencyBT;
}

- (void)setAverageLatencyIP:(unint64_t)a3
{
  self->_averageLatencyIP = a3;
}

- (unint64_t)averageLatencyIP
{
  return self->_averageLatencyIP;
}

- (void)setNumReadWriteFailureIDS:(unint64_t)a3
{
  self->_numReadWriteFailureIDS = a3;
}

- (unint64_t)numReadWriteFailureIDS
{
  return self->_numReadWriteFailureIDS;
}

- (void)setNumReadWriteSuccessIDS:(unint64_t)a3
{
  self->_numReadWriteSuccessIDS = a3;
}

- (unint64_t)numReadWriteSuccessIDS
{
  return self->_numReadWriteSuccessIDS;
}

- (void)setNumReadWriteFailureBT:(unint64_t)a3
{
  self->_numReadWriteFailureBT = a3;
}

- (unint64_t)numReadWriteFailureBT
{
  return self->_numReadWriteFailureBT;
}

- (void)setNumReadWriteSuccessBT:(unint64_t)a3
{
  self->_numReadWriteSuccessBT = a3;
}

- (unint64_t)numReadWriteSuccessBT
{
  return self->_numReadWriteSuccessBT;
}

- (void)setNumReadWriteFailureIP:(unint64_t)a3
{
  self->_numReadWriteFailureIP = a3;
}

- (unint64_t)numReadWriteFailureIP
{
  return self->_numReadWriteFailureIP;
}

- (void)setNumReadWriteSuccessIP:(unint64_t)a3
{
  self->_numReadWriteSuccessIP = a3;
}

- (unint64_t)numReadWriteSuccessIP
{
  return self->_numReadWriteSuccessIP;
}

- (void)setNumWriteUnknownSource:(unint64_t)a3
{
  self->_numWriteUnknownSource = a3;
}

- (unint64_t)numWriteUnknownSource
{
  return self->_numWriteUnknownSource;
}

- (void)setNumReadUnknownSource:(unint64_t)a3
{
  self->_numReadUnknownSource = a3;
}

- (unint64_t)numReadUnknownSource
{
  return self->_numReadUnknownSource;
}

- (void)setNumWriteInternalRequested:(unint64_t)a3
{
  self->_numWriteInternalRequested = a3;
}

- (unint64_t)numWriteInternalRequested
{
  return self->_numWriteInternalRequested;
}

- (void)setNumReadInternalRequested:(unint64_t)a3
{
  self->_numReadInternalRequested = a3;
}

- (unint64_t)numReadInternalRequested
{
  return self->_numReadInternalRequested;
}

- (void)setNumWriteThirdPartyApp:(unint64_t)a3
{
  self->_numWriteThirdPartyApp = a3;
}

- (unint64_t)numWriteThirdPartyApp
{
  return self->_numWriteThirdPartyApp;
}

- (void)setNumReadThirdPartyApp:(unint64_t)a3
{
  self->_numReadThirdPartyApp = a3;
}

- (unint64_t)numReadThirdPartyApp
{
  return self->_numReadThirdPartyApp;
}

- (void)setNumWriteFirstPartyApp:(unint64_t)a3
{
  self->_numWriteFirstPartyApp = a3;
}

- (unint64_t)numWriteFirstPartyApp
{
  return self->_numWriteFirstPartyApp;
}

- (void)setNumReadFirstPartyApp:(unint64_t)a3
{
  self->_numReadFirstPartyApp = a3;
}

- (unint64_t)numReadFirstPartyApp
{
  return self->_numReadFirstPartyApp;
}

- (void)setNumWriteSiri:(unint64_t)a3
{
  self->_numWriteSiri = a3;
}

- (unint64_t)numWriteSiri
{
  return self->_numWriteSiri;
}

- (void)setNumReadSiri:(unint64_t)a3
{
  self->_numReadSiri = a3;
}

- (unint64_t)numReadSiri
{
  return self->_numReadSiri;
}

- (void)setNotifyXPCClientsHomeDataChangedCount:(unint64_t)a3
{
  self->_notifyXPCClientsHomeDataChangedCount = a3;
}

- (unint64_t)notifyXPCClientsHomeDataChangedCount
{
  return self->_notifyXPCClientsHomeDataChangedCount;
}

- (void)setGenerationCounterIncrementCount:(unint64_t)a3
{
  self->_generationCounterIncrementCount = a3;
}

- (unint64_t)generationCounterIncrementCount
{
  return self->_generationCounterIncrementCount;
}

- (void)setResidentSyncHomeDataChangedNotificationCount:(unint64_t)a3
{
  self->_residentSyncHomeDataChangedNotificationCount = a3;
}

- (unint64_t)residentSyncHomeDataChangedNotificationCount
{
  return self->_residentSyncHomeDataChangedNotificationCount;
}

- (void)setResidentSyncFetchHomeDataRequestCount:(unint64_t)a3
{
  self->_residentSyncFetchHomeDataRequestCount = a3;
}

- (unint64_t)residentSyncFetchHomeDataRequestCount
{
  return self->_residentSyncFetchHomeDataRequestCount;
}

- (void)setCoreDataCloudKitExportCount:(unint64_t)a3
{
  self->_coreDataCloudKitExportCount = a3;
}

- (unint64_t)coreDataCloudKitExportCount
{
  return self->_coreDataCloudKitExportCount;
}

- (void)setCoreDataCloudKitImportCount:(unint64_t)a3
{
  self->_coreDataCloudKitImportCount = a3;
}

- (unint64_t)coreDataCloudKitImportCount
{
  return self->_coreDataCloudKitImportCount;
}

- (void)setWorkingStoreCoreDataTransactionCount:(unint64_t)a3
{
  self->_workingStoreCoreDataTransactionCount = a3;
}

- (unint64_t)workingStoreCoreDataTransactionCount
{
  return self->_workingStoreCoreDataTransactionCount;
}

- (void)setCloudStoreCoreDataTransactionCount:(unint64_t)a3
{
  self->_cloudStoreCoreDataTransactionCount = a3;
}

- (unint64_t)cloudStoreCoreDataTransactionCount
{
  return self->_cloudStoreCoreDataTransactionCount;
}

- (void)setCloudSyncMaximumDelayReached:(BOOL)a3
{
  self->_cloudSyncMaximumDelayReached = a3;
}

- (BOOL)cloudSyncMaximumDelayReached
{
  return self->_cloudSyncMaximumDelayReached;
}

- (void)setCloudSyncLastDecryptionFailed:(BOOL)a3
{
  self->_cloudSyncLastDecryptionFailed = a3;
}

- (BOOL)cloudSyncLastDecryptionFailed
{
  return self->_cloudSyncLastDecryptionFailed;
}

- (void)setCloudSyncDecryptionFailedCount:(unint64_t)a3
{
  self->_cloudSyncDecryptionFailedCount = a3;
}

- (unint64_t)cloudSyncDecryptionFailedCount
{
  return self->_cloudSyncDecryptionFailedCount;
}

- (void)setLegacyHomeDataBytesPushed:(unint64_t)a3
{
  self->_legacyHomeDataBytesPushed = a3;
}

- (unint64_t)legacyHomeDataBytesPushed
{
  return self->_legacyHomeDataBytesPushed;
}

- (void)setLegacyHomeDataBytesFetched:(unint64_t)a3
{
  self->_legacyHomeDataBytesFetched = a3;
}

- (unint64_t)legacyHomeDataBytesFetched
{
  return self->_legacyHomeDataBytesFetched;
}

- (void)setHomeDataBytesPushed:(unint64_t)a3
{
  self->_homeDataBytesPushed = a3;
}

- (unint64_t)homeDataBytesPushed
{
  return self->_homeDataBytesPushed;
}

- (void)setHomeDataBytesFetched:(unint64_t)a3
{
  self->_homeDataBytesFetched = a3;
}

- (unint64_t)homeDataBytesFetched
{
  return self->_homeDataBytesFetched;
}

- (void)setCloudSyncUploadErrorCount:(unint64_t)a3
{
  self->_cloudSyncUploadErrorCount = a3;
}

- (unint64_t)cloudSyncUploadErrorCount
{
  return self->_cloudSyncUploadErrorCount;
}

- (void)setCloudSyncUploadCount:(unint64_t)a3
{
  self->_cloudSyncUploadCount = a3;
}

- (unint64_t)cloudSyncUploadCount
{
  return self->_cloudSyncUploadCount;
}

- (void)setCloudSyncFetchCount:(unint64_t)a3
{
  self->_cloudSyncFetchCount = a3;
}

- (unint64_t)cloudSyncFetchCount
{
  return self->_cloudSyncFetchCount;
}

- (void)setLegacyCloudSyncPushCount:(unint64_t)a3
{
  self->_legacyCloudSyncPushCount = a3;
}

- (unint64_t)legacyCloudSyncPushCount
{
  return self->_legacyCloudSyncPushCount;
}

- (void)setCloudSyncPushCount:(unint64_t)a3
{
  self->_cloudSyncPushCount = a3;
}

- (unint64_t)cloudSyncPushCount
{
  return self->_cloudSyncPushCount;
}

- (void)setRxSecureMessagesCount:(unint64_t)a3
{
  self->_rxSecureMessagesCount = a3;
}

- (unint64_t)rxSecureMessagesCount
{
  return self->_rxSecureMessagesCount;
}

- (void)setTxSecureMessagesCount:(unint64_t)a3
{
  self->_txSecureMessagesCount = a3;
}

- (unint64_t)txSecureMessagesCount
{
  return self->_txSecureMessagesCount;
}

- (void)setRxRapportMessagesCount:(unint64_t)a3
{
  self->_rxRapportMessagesCount = a3;
}

- (unint64_t)rxRapportMessagesCount
{
  return self->_rxRapportMessagesCount;
}

- (void)setTxRapportMessagesCount:(unint64_t)a3
{
  self->_txRapportMessagesCount = a3;
}

- (unint64_t)txRapportMessagesCount
{
  return self->_txRapportMessagesCount;
}

- (void)setRxLoxyMessagesCount:(unint64_t)a3
{
  self->_rxLoxyMessagesCount = a3;
}

- (unint64_t)rxLoxyMessagesCount
{
  return self->_rxLoxyMessagesCount;
}

- (void)setTxLoxyMessagesCount:(unint64_t)a3
{
  self->_txLoxyMessagesCount = a3;
}

- (unint64_t)txLoxyMessagesCount
{
  return self->_txLoxyMessagesCount;
}

- (void)setRxIDSProxyMessagesCount:(unint64_t)a3
{
  self->_rxIDSProxyMessagesCount = a3;
}

- (unint64_t)rxIDSProxyMessagesCount
{
  return self->_rxIDSProxyMessagesCount;
}

- (void)setTxIDSProxyMessagesCount:(unint64_t)a3
{
  self->_txIDSProxyMessagesCount = a3;
}

- (unint64_t)txIDSProxyMessagesCount
{
  return self->_txIDSProxyMessagesCount;
}

- (void)setRxIDSMessagesCount:(unint64_t)a3
{
  self->_rxIDSMessagesCount = a3;
}

- (unint64_t)rxIDSMessagesCount
{
  return self->_rxIDSMessagesCount;
}

- (void)setTxIDSMessagesCount:(unint64_t)a3
{
  self->_txIDSMessagesCount = a3;
}

- (unint64_t)txIDSMessagesCount
{
  return self->_txIDSMessagesCount;
}

- (void)setRemoteMessagesReceivedCount:(unint64_t)a3
{
  self->_remoteMessagesReceivedCount = a3;
}

- (unint64_t)remoteMessagesReceivedCount
{
  return self->_remoteMessagesReceivedCount;
}

- (void)setRemoteMessagesSentCount:(unint64_t)a3
{
  self->_remoteMessagesSentCount = a3;
}

- (unint64_t)remoteMessagesSentCount
{
  return self->_remoteMessagesSentCount;
}

- (void)setSampledPeakProcessMemoryUsageMB:(unint64_t)a3
{
  self->_sampledPeakProcessMemoryUsageMB = a3;
}

- (unint64_t)sampledPeakProcessMemoryUsageMB
{
  return self->_sampledPeakProcessMemoryUsageMB;
}

- (void)setSampledAverageProcessMemoryUsageMB:(unint64_t)a3
{
  self->_sampledAverageProcessMemoryUsageMB = a3;
}

- (unint64_t)sampledAverageProcessMemoryUsageMB
{
  return self->_sampledAverageProcessMemoryUsageMB;
}

- (void)setProcessMemoryPressureStateCriticalCount:(unint64_t)a3
{
  self->_processMemoryPressureStateCriticalCount = a3;
}

- (unint64_t)processMemoryPressureStateCriticalCount
{
  return self->_processMemoryPressureStateCriticalCount;
}

- (void)setProcessMemoryPressureStateWarningCount:(unint64_t)a3
{
  self->_processMemoryPressureStateWarningCount = a3;
}

- (unint64_t)processMemoryPressureStateWarningCount
{
  return self->_processMemoryPressureStateWarningCount;
}

- (void)setJetsamReasonOtherCount:(unint64_t)a3
{
  self->_jetsamReasonOtherCount = a3;
}

- (unint64_t)jetsamReasonOtherCount
{
  return self->_jetsamReasonOtherCount;
}

- (void)setJetsamReasonProcessLimitCount:(unint64_t)a3
{
  self->_jetsamReasonProcessLimitCount = a3;
}

- (unint64_t)jetsamReasonProcessLimitCount
{
  return self->_jetsamReasonProcessLimitCount;
}

- (void)setJetsamReasonHighwaterCount:(unint64_t)a3
{
  self->_jetsamReasonHighwaterCount = a3;
}

- (unint64_t)jetsamReasonHighwaterCount
{
  return self->_jetsamReasonHighwaterCount;
}

- (void)setProcessCrashCount:(unint64_t)a3
{
  self->_processCrashCount = a3;
}

- (unint64_t)processCrashCount
{
  return self->_processCrashCount;
}

- (void)setProcessJetsamCount:(unint64_t)a3
{
  self->_processJetsamCount = a3;
}

- (unint64_t)processJetsamCount
{
  return self->_processJetsamCount;
}

- (void)setProcessAbnormalExitCount:(int64_t)a3
{
  self->_processAbnormalExitCount = a3;
}

- (int64_t)processAbnormalExitCount
{
  return self->_processAbnormalExitCount;
}

- (void)setProcessLaunchCount:(unint64_t)a3
{
  self->_processLaunchCount = a3;
}

- (unint64_t)processLaunchCount
{
  return self->_processLaunchCount;
}

- (void)setDataSyncState:(id)a3
{
}

- (NSString)dataSyncState
{
  return self->_dataSyncState;
}

- (NSString)description
{
  v66 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v65 = NSStringFromClass(v3);
  v64 = [(HMDAggregationAnalysisLogEvent *)self dataSyncState];
  unint64_t v63 = [(HMDAggregationAnalysisLogEvent *)self processLaunchCount];
  unint64_t v62 = [(HMDAggregationAnalysisLogEvent *)self jetsamReasonHighwaterCount];
  unint64_t v61 = [(HMDAggregationAnalysisLogEvent *)self jetsamReasonProcessLimitCount];
  unint64_t v60 = [(HMDAggregationAnalysisLogEvent *)self jetsamReasonOtherCount];
  unint64_t v59 = [(HMDAggregationAnalysisLogEvent *)self processCrashCount];
  unint64_t v58 = [(HMDAggregationAnalysisLogEvent *)self processMemoryPressureStateWarningCount];
  unint64_t v57 = [(HMDAggregationAnalysisLogEvent *)self processMemoryPressureStateCriticalCount];
  unint64_t v56 = [(HMDAggregationAnalysisLogEvent *)self sampledAverageProcessMemoryUsageMB];
  unint64_t v55 = [(HMDAggregationAnalysisLogEvent *)self sampledPeakProcessMemoryUsageMB];
  unint64_t v54 = [(HMDAggregationAnalysisLogEvent *)self remoteMessagesSentCount];
  unint64_t v53 = [(HMDAggregationAnalysisLogEvent *)self remoteMessagesReceivedCount];
  unint64_t v52 = [(HMDAggregationAnalysisLogEvent *)self txIDSMessagesCount];
  unint64_t v51 = [(HMDAggregationAnalysisLogEvent *)self rxIDSMessagesCount];
  unint64_t v50 = [(HMDAggregationAnalysisLogEvent *)self txIDSProxyMessagesCount];
  unint64_t v49 = [(HMDAggregationAnalysisLogEvent *)self rxIDSProxyMessagesCount];
  unint64_t v48 = [(HMDAggregationAnalysisLogEvent *)self txLoxyMessagesCount];
  unint64_t v47 = [(HMDAggregationAnalysisLogEvent *)self rxLoxyMessagesCount];
  unint64_t v46 = [(HMDAggregationAnalysisLogEvent *)self txRapportMessagesCount];
  unint64_t v45 = [(HMDAggregationAnalysisLogEvent *)self rxRapportMessagesCount];
  unint64_t v44 = [(HMDAggregationAnalysisLogEvent *)self txSecureMessagesCount];
  unint64_t v43 = [(HMDAggregationAnalysisLogEvent *)self rxSecureMessagesCount];
  unint64_t v42 = [(HMDAggregationAnalysisLogEvent *)self cloudSyncPushCount];
  unint64_t v41 = [(HMDAggregationAnalysisLogEvent *)self cloudSyncFetchCount];
  unint64_t v40 = [(HMDAggregationAnalysisLogEvent *)self cloudSyncUploadCount];
  unint64_t v39 = [(HMDAggregationAnalysisLogEvent *)self cloudSyncUploadErrorCount];
  unint64_t v38 = [(HMDAggregationAnalysisLogEvent *)self homeDataBytesFetched];
  unint64_t v37 = [(HMDAggregationAnalysisLogEvent *)self homeDataBytesPushed];
  unint64_t v36 = [(HMDAggregationAnalysisLogEvent *)self legacyHomeDataBytesFetched];
  unint64_t v35 = [(HMDAggregationAnalysisLogEvent *)self legacyHomeDataBytesPushed];
  unint64_t v34 = [(HMDAggregationAnalysisLogEvent *)self numReadSiri];
  unint64_t v33 = [(HMDAggregationAnalysisLogEvent *)self numWriteSiri];
  unint64_t v32 = [(HMDAggregationAnalysisLogEvent *)self numReadFirstPartyApp];
  unint64_t v31 = [(HMDAggregationAnalysisLogEvent *)self numWriteFirstPartyApp];
  unint64_t v30 = [(HMDAggregationAnalysisLogEvent *)self numReadThirdPartyApp];
  unint64_t v29 = [(HMDAggregationAnalysisLogEvent *)self numWriteThirdPartyApp];
  unint64_t v28 = [(HMDAggregationAnalysisLogEvent *)self averageLatencyIP];
  unint64_t v27 = [(HMDAggregationAnalysisLogEvent *)self averageLatencyBT];
  unint64_t v26 = [(HMDAggregationAnalysisLogEvent *)self averageLatencyIDS];
  unint64_t v25 = [(HMDAggregationAnalysisLogEvent *)self numAccessoriesAdded];
  unint64_t v24 = [(HMDAggregationAnalysisLogEvent *)self numScenesAdded];
  unint64_t v23 = [(HMDAggregationAnalysisLogEvent *)self numTriggersAdded];
  unint64_t v22 = [(HMDAggregationAnalysisLogEvent *)self numShortcutsAdded];
  unint64_t v21 = [(HMDAggregationAnalysisLogEvent *)self numScenesUserRun];
  unint64_t v20 = [(HMDAggregationAnalysisLogEvent *)self numShortcutsRun];
  unint64_t v19 = [(HMDAggregationAnalysisLogEvent *)self numTriggersFired];
  unint64_t v18 = [(HMDAggregationAnalysisLogEvent *)self hapIPInvalidationCount];
  unint64_t v17 = [(HMDAggregationAnalysisLogEvent *)self hapIPSentHTTPRequestsCount];
  unint64_t v16 = [(HMDAggregationAnalysisLogEvent *)self hapIPReceivedHTTPResponsesCount];
  unint64_t v15 = [(HMDAggregationAnalysisLogEvent *)self hapIPReceivedHTTPEventCount];
  unint64_t v14 = [(HMDAggregationAnalysisLogEvent *)self hapBTLEConnectionsCount];
  unint64_t v13 = [(HMDAggregationAnalysisLogEvent *)self hapBTLEConnectionPerReasonsCount];
  unint64_t v12 = [(HMDAggregationAnalysisLogEvent *)self hapBTLEDiscoveriesCount];
  unint64_t v11 = [(HMDAggregationAnalysisLogEvent *)self cameraStreamStartSuccessCount];
  unint64_t v10 = [(HMDAggregationAnalysisLogEvent *)self cameraStreamStartFailureCount];
  unint64_t v9 = [(HMDAggregationAnalysisLogEvent *)self fetchCameraClipVideoSegmentAssetCount];
  unint64_t v8 = [(HMDAggregationAnalysisLogEvent *)self acceptedXPCRequestsCount];
  unint64_t v7 = [(HMDAggregationAnalysisLogEvent *)self erroredXPCRequestsCount];
  unint64_t v6 = [(HMDAggregationAnalysisLogEvent *)self sentXPCNotificationsCount];
  [(HMDAggregationAnalysisLogEvent *)self filteredXPCNotificationsCount];
  [(HMDAggregationAnalysisLogEvent *)self cameraRecordingReachabilityChangedCount];
  [(HMDAggregationAnalysisLogEvent *)self cameraRecordingReachabilityOfflineDuration];
  [(HMDAggregationAnalysisLogEvent *)self homeHubReachabilityChangedCount];
  [(HMDAggregationAnalysisLogEvent *)self currentDeviceStartedLegacyElectionCount];
  [(HMDAggregationAnalysisLogEvent *)self v2ElectionCurrentDeviceInSecondaryCoordinationMesh];
  [(HMDAggregationAnalysisLogEvent *)self v2ElectionCoordinationMeshUpdateCount];
  [(HMDAggregationAnalysisLogEvent *)self v2ElectionCoordinationMeshLeaderElectedCount];
  [(HMDAggregationAnalysisLogEvent *)self v2ElectionCoordinationMeshLeaderChangedCount];
  [(HMDAggregationAnalysisLogEvent *)self v2ElectionPrimaryResidentElectionRunCount];
  [(HMDAggregationAnalysisLogEvent *)self v2ElectionPrimaryResidentChangedCount];
  [(HMDAggregationAnalysisLogEvent *)self workingStoreCoreDataTransactionCount];
  [(HMDAggregationAnalysisLogEvent *)self cloudStoreCoreDataTransactionCount];
  [(HMDAggregationAnalysisLogEvent *)self coreDataCloudKitImportCount];
  [(HMDAggregationAnalysisLogEvent *)self coreDataCloudKitExportCount];
  [(HMDAggregationAnalysisLogEvent *)self residentSyncFetchHomeDataRequestCount];
  [(HMDAggregationAnalysisLogEvent *)self residentSyncHomeDataChangedNotificationCount];
  [(HMDAggregationAnalysisLogEvent *)self generationCounterIncrementCount];
  [(HMDAggregationAnalysisLogEvent *)self notifyXPCClientsHomeDataChangedCount];
  [(HMDAggregationAnalysisLogEvent *)self isActiveDay];
  [(HMDAggregationAnalysisLogEvent *)self countOfDaysSinceLastActive];
  [(HMDAggregationAnalysisLogEvent *)self activeDaysPerMonthCount];
  [(HMDAggregationAnalysisLogEvent *)self widgetMaxRefreshCountForKind];
  objc_msgSend(v66, "stringWithFormat:", @"%@: \ndataSyncState: %@ \nprocessLaunchCount: %lu \njetsamReasonHighwaterCount: %lu \njetsamReasonProcessLimitCount: %lu \njetsamReasonOtherCount: %lu \nprocessCrashCount: %lu \nprocessMemoryPressureStateWarningCount: %lu \nprocessMemoryPressureStateCriticalCount: %lu \nsampledAverageProcessMemoryUsageMB: %lu \nsampledPeakProcessMemoryUsageMB: %lu \nremoteMessagesSentCount: %lu \nremoteMessagesReceivedCount: %lu \ntxIDSMessagesCount: %lu \nrxIDSMessagesCount: %lu \ntxIDSProxyMessagesCount: %lu \ntxIDSProxyMessagesCount: %lu \ntxLoxyMessagesCount: %lu \nrxLoxyMessagesCount: %lu \ntxRapportMessagesCount: %lu \nrxRapportMessagesCount: %lu \ntxSecureMessagesCount: %lu \nrxSecureMessagesCount: %lu \ncloudSyncPushCount: %lu \ncloudSyncFetchCount: %lu \ncloudSyncUploadCount: %lu \ncloudSyncUploadErrorCount: %lu \nhomeDataBytesFetched: %lu \nhomeDataBytesPushed: %lu \nlegacyHomeDataBytesFetched: %lu \nlegacyHomeDataBytesPushed: %lu \nnumReadSiri: %lu \nnumWriteSiri: %lu \nnumReadFirstPartyApp: %lu \nnumWriteFirstPartyApp: %lu \nnumReadThirdPartyApp: %lu \nnumWriteThirdPartyApp: %lu \naverageLatencyIP: %lu \naverageLatencyBT: %lu \naverageLatencyIDS: %lu \nnumAccessoriesAdded: %lu \nnumScenesAdded: %lu \nnumTriggersAdded: %lu \nnumShortcutsAdded: %lu \nnumScenesUserRun: %lu \nnumShortcutsRun: %lu \nnumTriggersFired: %lu \nhapIPInvalidationCount: %lu \nhapIPSentHTTPRequestsCount: %lu \nhapIPReceivedHTTPResponsesCount: %lu \nhapIPReceivedHTTPEventCount: %lu \nhapBTLEConnectionsCount: %lu \nhapBTLEConnectionPerReasonsCount: %lu \nhapBTLEDiscoveriesCount: %lu \ncameraStreamStartSuccessCount: %lu \ncameraStreamStartFailureCount: %lu \nfetchCameraClipVideoSegmentAssetCount: %lu \nacceptedXPCRequestsCount: %lu \nerroredXPCRequestsCount: %lu \nsentXPCNotificationsCount: %lu \nfilteredXPCNotificationsCount: %lu \ncameraRecordingReachabilityChangedCount: %lu \ncameraRecordingReachabilityOfflineDuration: %lu \nhomeHubReachabilityChangedCount: %lu \ncurrentDeviceStartedLegacyElectionCount: %lu \nv2ElectionCoordinationDeviceInSecondaryMesh: %d \nv2ElectionCoordinationMeshUpdateCount: %lu \nv2ElectionCoordinationMeshLeaderElectedCount: %lu \nv2ElectionCoordinationMeshLeaderChangedCount: %lu \nv2ElectionPrimaryResidentElectionRunCount: %lu \nv2ElectionPrimaryResidentChangedCount: %lu \nworkingStoreCoreDataTransactionCount: %lu \ncloudStoreCoreDataTransactionCount %lu \ncoreDataCloudKitImportCount %lu \ncoreDataCloudKitExportCount %lu \nresidentSyncFetchHomeDataRequestCount %lu \nresidentSyncHomeDataChangedNotificationCount %lu \ngenerationCounterIncrementCount %lu \nnotifyXPCClientsHomeDataChangedCount %lu \nactiveDay: %d \ncountOfDaysSinceLastActive %ld \nactiveDaysPerMonthCount: %lu \nwidgetMaxRefreshCountForKind: %lu", v65, v64, v63, v62, v61, v60, v59, v58, v57, v56, v55, v54, v53, v52, v51, v50,
    v49,
    v48,
    v47,
    v46,
    v45,
    v44,
    v43,
    v42,
    v41,
    v40,
    v39,
    v38,
    v37,
    v36,
    v35,
    v34,
    v33,
    v32,
    v31,
    v30,
    v29,
    v28,
    v27,
    v26,
    v25,
    v24,
    v23,
    v22,
    v21,
    v20,
    v19,
    v18,
    v17,
    v16,
    v15,
    v14,
    v13,
    v12,
    v11,
    v10,
    v9,
    v8,
    v7,
  v4 = v6);

  return (NSString *)v4;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v224[106] = *MEMORY[0x263EF8340];
  v223[0] = @"processLaunchCount";
  v222 = +[HMDLogEventHistograms lowVolumeHistogram];
  v221 = objc_msgSend(v222, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent processLaunchCount](self, "processLaunchCount"));
  v224[0] = v221;
  v223[1] = @"processAbnormalExitCount";
  v220 = +[HMDLogEventHistograms lowVolumeHistogram];
  v219 = objc_msgSend(v220, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent processAbnormalExitCount](self, "processAbnormalExitCount"));
  v224[1] = v219;
  v223[2] = @"processJetsamCount";
  v218 = +[HMDLogEventHistograms lowVolumeHistogram];
  v217 = objc_msgSend(v218, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent processJetsamCount](self, "processJetsamCount"));
  v224[2] = v217;
  v223[3] = @"processCrashCount";
  v216 = +[HMDLogEventHistograms lowVolumeHistogram];
  v215 = objc_msgSend(v216, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent processCrashCount](self, "processCrashCount"));
  v224[3] = v215;
  v223[4] = @"jetsamReasonHighwaterCount";
  v214 = +[HMDLogEventHistograms lowVolumeHistogram];
  v213 = objc_msgSend(v214, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent jetsamReasonHighwaterCount](self, "jetsamReasonHighwaterCount"));
  v224[4] = v213;
  v223[5] = @"jetsamReasonProcessLimitCount";
  v212 = +[HMDLogEventHistograms lowVolumeHistogram];
  v211 = objc_msgSend(v212, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent jetsamReasonProcessLimitCount](self, "jetsamReasonProcessLimitCount"));
  v224[5] = v211;
  v223[6] = @"jetsamReasonOtherCount";
  v210 = +[HMDLogEventHistograms lowVolumeHistogram];
  v209 = objc_msgSend(v210, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent jetsamReasonOtherCount](self, "jetsamReasonOtherCount"));
  v224[6] = v209;
  v223[7] = @"processMemoryPressureStateWarningCount";
  v208 = +[HMDLogEventHistograms lowVolumeHistogram];
  v207 = objc_msgSend(v208, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent processMemoryPressureStateWarningCount](self, "processMemoryPressureStateWarningCount"));
  v224[7] = v207;
  v223[8] = @"processMemoryPressureStateCriticalCount";
  v206 = +[HMDLogEventHistograms lowVolumeHistogram];
  v205 = objc_msgSend(v206, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent processMemoryPressureStateCriticalCount](self, "processMemoryPressureStateCriticalCount"));
  v224[8] = v205;
  v223[9] = @"averageSampledProcessMemoryUsage";
  v204 = +[HMDLogEventHistograms memoryHistogram];
  v203 = objc_msgSend(v204, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent sampledAverageProcessMemoryUsageMB](self, "sampledAverageProcessMemoryUsageMB"));
  v224[9] = v203;
  v223[10] = @"peakSampledProcessMemoryUsage";
  v202 = +[HMDLogEventHistograms memoryHistogram];
  v201 = objc_msgSend(v202, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent sampledPeakProcessMemoryUsageMB](self, "sampledPeakProcessMemoryUsageMB"));
  v224[10] = v201;
  v223[11] = @"averageMemoryMB";
  v200 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAggregationAnalysisLogEvent sampledAverageProcessMemoryUsageMB](self, "sampledAverageProcessMemoryUsageMB"));
  v224[11] = v200;
  v223[12] = @"peakMemoryMB";
  v199 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAggregationAnalysisLogEvent sampledPeakProcessMemoryUsageMB](self, "sampledPeakProcessMemoryUsageMB"));
  v224[12] = v199;
  v223[13] = @"remoteMessagesSentCount";
  v198 = +[HMDLogEventHistograms highVolumeHistogram];
  v197 = objc_msgSend(v198, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent remoteMessagesSentCount](self, "remoteMessagesSentCount"));
  v224[13] = v197;
  v223[14] = @"remoteMessagesReceivedCount";
  v196 = +[HMDLogEventHistograms highVolumeHistogram];
  v195 = objc_msgSend(v196, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent remoteMessagesReceivedCount](self, "remoteMessagesReceivedCount"));
  v224[14] = v195;
  v223[15] = @"txIDSMessagesCount";
  v194 = +[HMDLogEventHistograms highVolumeHistogram];
  v193 = objc_msgSend(v194, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent txIDSMessagesCount](self, "txIDSMessagesCount"));
  v224[15] = v193;
  v223[16] = @"rxIDSMessagesCount";
  v192 = +[HMDLogEventHistograms highVolumeHistogram];
  v191 = objc_msgSend(v192, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent rxIDSMessagesCount](self, "rxIDSMessagesCount"));
  v224[16] = v191;
  v223[17] = @"txIDSProxyMessagesCount";
  v190 = +[HMDLogEventHistograms highVolumeHistogram];
  v189 = objc_msgSend(v190, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent txIDSProxyMessagesCount](self, "txIDSProxyMessagesCount"));
  v224[17] = v189;
  v223[18] = @"rxIDSProxyMessagesCount";
  v188 = +[HMDLogEventHistograms highVolumeHistogram];
  v187 = objc_msgSend(v188, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent rxIDSProxyMessagesCount](self, "rxIDSProxyMessagesCount"));
  v224[18] = v187;
  v223[19] = @"txLoxyMessagesCount";
  v186 = +[HMDLogEventHistograms highVolumeHistogram];
  v185 = objc_msgSend(v186, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent txLoxyMessagesCount](self, "txLoxyMessagesCount"));
  v224[19] = v185;
  v223[20] = @"rxLoxyMessagesCount";
  v184 = +[HMDLogEventHistograms highVolumeHistogram];
  v183 = objc_msgSend(v184, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent rxLoxyMessagesCount](self, "rxLoxyMessagesCount"));
  v224[20] = v183;
  v223[21] = @"txRapportMessagesCount";
  v182 = +[HMDLogEventHistograms highVolumeHistogram];
  v181 = objc_msgSend(v182, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent txRapportMessagesCount](self, "txRapportMessagesCount"));
  v224[21] = v181;
  v223[22] = @"rxRapportMessagesCount";
  v180 = +[HMDLogEventHistograms highVolumeHistogram];
  v179 = objc_msgSend(v180, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent rxRapportMessagesCount](self, "rxRapportMessagesCount"));
  v224[22] = v179;
  v223[23] = @"txSecureMessagesCount";
  v178 = +[HMDLogEventHistograms highVolumeHistogram];
  v177 = objc_msgSend(v178, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent txSecureMessagesCount](self, "txSecureMessagesCount"));
  v224[23] = v177;
  v223[24] = @"rxSecureMessagesCount";
  v176 = +[HMDLogEventHistograms highVolumeHistogram];
  v175 = objc_msgSend(v176, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent rxSecureMessagesCount](self, "rxSecureMessagesCount"));
  v224[24] = v175;
  v223[25] = @"siriReadCount";
  v174 = +[HMDLogEventHistograms lowVolumeHistogram];
  v173 = objc_msgSend(v174, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numReadSiri](self, "numReadSiri"));
  v224[25] = v173;
  v223[26] = @"siriWriteCount";
  v172 = +[HMDLogEventHistograms lowVolumeHistogram];
  v171 = objc_msgSend(v172, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numWriteSiri](self, "numWriteSiri"));
  v224[26] = v171;
  v223[27] = @"firstPartyReadCount";
  v170 = +[HMDLogEventHistograms highVolumeHistogram];
  v169 = objc_msgSend(v170, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numReadFirstPartyApp](self, "numReadFirstPartyApp"));
  v224[27] = v169;
  v223[28] = @"firstPartyWriteCount";
  v168 = +[HMDLogEventHistograms highVolumeHistogram];
  v167 = objc_msgSend(v168, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numWriteFirstPartyApp](self, "numWriteFirstPartyApp"));
  v224[28] = v167;
  v223[29] = @"thirdPartyReadCount";
  v166 = +[HMDLogEventHistograms highVolumeHistogram];
  v165 = objc_msgSend(v166, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numReadThirdPartyApp](self, "numReadThirdPartyApp"));
  v224[29] = v165;
  v223[30] = @"thirdPartyWriteCount";
  v164 = +[HMDLogEventHistograms highVolumeHistogram];
  v163 = objc_msgSend(v164, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numWriteThirdPartyApp](self, "numWriteThirdPartyApp"));
  v224[30] = v163;
  v223[31] = @"internalRequestedReadCount";
  v162 = +[HMDLogEventHistograms highVolumeHistogram];
  v161 = objc_msgSend(v162, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numReadInternalRequested](self, "numReadInternalRequested"));
  v224[31] = v161;
  v223[32] = @"internalRequestedWriteCount";
  v160 = +[HMDLogEventHistograms highVolumeHistogram];
  v159 = objc_msgSend(v160, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numWriteInternalRequested](self, "numWriteInternalRequested"));
  v224[32] = v159;
  v223[33] = @"unknownSourceReadCount";
  v158 = +[HMDLogEventHistograms highVolumeHistogram];
  v157 = objc_msgSend(v158, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numReadUnknownSource](self, "numReadUnknownSource"));
  v224[33] = v157;
  v223[34] = @"unknownSourceWriteCount";
  v156 = +[HMDLogEventHistograms highVolumeHistogram];
  v155 = objc_msgSend(v156, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numWriteUnknownSource](self, "numWriteUnknownSource"));
  v224[34] = v155;
  v223[35] = @"accessoryReadWriteIPSuccessCount";
  v154 = +[HMDLogEventHistograms successRateHistogram];
  v153 = objc_msgSend(v154, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numReadWriteSuccessIP](self, "numReadWriteSuccessIP"));
  v224[35] = v153;
  v223[36] = @"accessoryReadWriteIPFailureCount";
  v152 = +[HMDLogEventHistograms successRateHistogram];
  v151 = objc_msgSend(v152, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numReadWriteFailureIP](self, "numReadWriteFailureIP"));
  v224[36] = v151;
  v223[37] = @"accessoryReadWriteBTSuccessCount";
  v150 = +[HMDLogEventHistograms successRateHistogram];
  v149 = objc_msgSend(v150, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numReadWriteSuccessBT](self, "numReadWriteSuccessBT"));
  v224[37] = v149;
  v223[38] = @"accessoryReadWriteBTFailureCount";
  v148 = +[HMDLogEventHistograms successRateHistogram];
  v147 = objc_msgSend(v148, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numReadWriteFailureBT](self, "numReadWriteFailureBT"));
  v224[38] = v147;
  v223[39] = @"accessoryReadWriteIDSSuccessCount";
  v146 = +[HMDLogEventHistograms successRateHistogram];
  v145 = objc_msgSend(v146, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numReadWriteSuccessIDS](self, "numReadWriteSuccessIDS"));
  v224[39] = v145;
  v223[40] = @"accessoryReadWriteIDSFailureCount";
  v144 = +[HMDLogEventHistograms successRateHistogram];
  v143 = objc_msgSend(v144, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numReadWriteFailureIDS](self, "numReadWriteFailureIDS"));
  v224[40] = v143;
  v223[41] = @"accessoryReadWriteAverageIPLatency";
  v142 = +[HMDLogEventHistograms latencyHistogram];
  v141 = objc_msgSend(v142, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent averageLatencyIP](self, "averageLatencyIP"));
  v224[41] = v141;
  v223[42] = @"accessoryReadWriteAverageBTLatency";
  v140 = +[HMDLogEventHistograms latencyHistogram];
  v139 = objc_msgSend(v140, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent averageLatencyBT](self, "averageLatencyBT"));
  v224[42] = v139;
  v223[43] = @"accessoryReadWriteAverageIDSLatency";
  v138 = +[HMDLogEventHistograms latencyHistogram];
  v137 = objc_msgSend(v138, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent averageLatencyIDS](self, "averageLatencyIDS"));
  v224[43] = v137;
  v223[44] = @"accessoriesAddedCount";
  v136 = +[HMDLogEventHistograms lowVolumeHistogram];
  v135 = objc_msgSend(v136, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numAccessoriesAdded](self, "numAccessoriesAdded"));
  v224[44] = v135;
  v223[45] = @"scenesAddedCount";
  v134 = +[HMDLogEventHistograms lowVolumeHistogram];
  v133 = objc_msgSend(v134, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numScenesAdded](self, "numScenesAdded"));
  v224[45] = v133;
  v223[46] = @"triggersAddedCount";
  v132 = +[HMDLogEventHistograms lowVolumeHistogram];
  v131 = objc_msgSend(v132, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numTriggersAdded](self, "numTriggersAdded"));
  v224[46] = v131;
  v223[47] = @"shortcutsAddedCount";
  v130 = +[HMDLogEventHistograms lowVolumeHistogram];
  v129 = objc_msgSend(v130, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numShortcutsAdded](self, "numShortcutsAdded"));
  v224[47] = v129;
  v223[48] = @"scenesRunCount";
  v128 = +[HMDLogEventHistograms lowVolumeHistogram];
  v127 = objc_msgSend(v128, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numScenesUserRun](self, "numScenesUserRun"));
  v224[48] = v127;
  v223[49] = @"triggersRunCount";
  v126 = +[HMDLogEventHistograms lowVolumeHistogram];
  v125 = objc_msgSend(v126, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numTriggersFired](self, "numTriggersFired"));
  v224[49] = v125;
  v223[50] = @"shortcutsRunCount";
  v124 = +[HMDLogEventHistograms lowVolumeHistogram];
  v123 = objc_msgSend(v124, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numShortcutsRun](self, "numShortcutsRun"));
  v224[50] = v123;
  v223[51] = @"hapIPInvalidationCount";
  v122 = +[HMDLogEventHistograms highVolumeHistogram];
  v121 = objc_msgSend(v122, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent hapIPInvalidationCount](self, "hapIPInvalidationCount"));
  v224[51] = v121;
  v223[52] = @"sentHTTPMessagesCount";
  v120 = +[HMDLogEventHistograms highVolumeHistogram];
  v119 = objc_msgSend(v120, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent hapIPSentHTTPRequestsCount](self, "hapIPSentHTTPRequestsCount"));
  v224[52] = v119;
  v223[53] = @"receivedHTTPMessagesCount";
  v118 = +[HMDLogEventHistograms highVolumeHistogram];
  v117 = objc_msgSend(v118, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent hapIPReceivedHTTPResponsesCount](self, "hapIPReceivedHTTPResponsesCount"));
  v224[53] = v117;
  v223[54] = @"receivedHTTPEventCount";
  v116 = +[HMDLogEventHistograms highVolumeHistogram];
  v115 = objc_msgSend(v116, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent hapIPReceivedHTTPEventCount](self, "hapIPReceivedHTTPEventCount"));
  v224[54] = v115;
  v223[55] = @"hapBTLEConnectionsCount";
  v114 = +[HMDLogEventHistograms highVolumeHistogram];
  v113 = objc_msgSend(v114, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent hapBTLEConnectionsCount](self, "hapBTLEConnectionsCount"));
  v224[55] = v113;
  v223[56] = @"hapBTLEDiscoveryCount";
  v112 = +[HMDLogEventHistograms highVolumeHistogram];
  v111 = objc_msgSend(v112, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent hapBTLEDiscoveriesCount](self, "hapBTLEDiscoveriesCount"));
  v224[56] = v111;
  v223[57] = @"hapBTLEConnectionPerReasonCount";
  v110 = +[HMDLogEventHistograms highVolumeHistogram];
  v109 = objc_msgSend(v110, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent hapBTLEConnectionPerReasonsCount](self, "hapBTLEConnectionPerReasonsCount"));
  v224[57] = v109;
  v223[58] = @"cameraStreamStartSuccessCount";
  v108 = +[HMDLogEventHistograms lowVolumeHistogram];
  v107 = objc_msgSend(v108, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent cameraStreamStartSuccessCount](self, "cameraStreamStartSuccessCount"));
  v224[58] = v107;
  v223[59] = @"cameraStreamStartFailureCount";
  v106 = +[HMDLogEventHistograms lowVolumeHistogram];
  v105 = objc_msgSend(v106, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent cameraStreamStartFailureCount](self, "cameraStreamStartFailureCount"));
  v224[59] = v105;
  v223[60] = @"fetchVideoSegmentsAssetCount";
  v104 = +[HMDLogEventHistograms lowVolumeHistogram];
  v103 = objc_msgSend(v104, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent fetchCameraClipVideoSegmentAssetCount](self, "fetchCameraClipVideoSegmentAssetCount"));
  v224[60] = v103;
  v223[61] = @"acceptedXPCRequestsCount";
  v102 = +[HMDLogEventHistograms highVolumeHistogram];
  v101 = objc_msgSend(v102, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent acceptedXPCRequestsCount](self, "acceptedXPCRequestsCount"));
  v224[61] = v101;
  v223[62] = @"erroredXPCRequestsCount";
  v100 = +[HMDLogEventHistograms highVolumeHistogram];
  v99 = objc_msgSend(v100, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent erroredXPCRequestsCount](self, "erroredXPCRequestsCount"));
  v224[62] = v99;
  v223[63] = @"sentXPCNotificationsCount";
  v98 = +[HMDLogEventHistograms highVolumeHistogram];
  v97 = objc_msgSend(v98, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent sentXPCNotificationsCount](self, "sentXPCNotificationsCount"));
  v224[63] = v97;
  v223[64] = @"filteredXPCNotificationsCount";
  v96 = +[HMDLogEventHistograms highVolumeHistogram];
  v95 = objc_msgSend(v96, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent filteredXPCNotificationsCount](self, "filteredXPCNotificationsCount"));
  v224[64] = v95;
  v223[65] = @"cameraRecordingReachabilityChangedCount";
  v94 = +[HMDLogEventHistograms lowVolumeHistogram];
  v93 = objc_msgSend(v94, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent cameraRecordingReachabilityChangedCount](self, "cameraRecordingReachabilityChangedCount"));
  v224[65] = v93;
  v223[66] = @"cameraRecordingOfflineDuration";
  v92 = +[HMDLogEventHistograms lowVolumeHistogram];
  v91 = objc_msgSend(v92, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent cameraRecordingReachabilityOfflineDuration](self, "cameraRecordingReachabilityOfflineDuration"));
  v224[66] = v91;
  v223[67] = @"homeHubReachabilityChangedCount";
  v90 = +[HMDLogEventHistograms lowVolumeHistogram];
  v89 = objc_msgSend(v90, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent homeHubReachabilityChangedCount](self, "homeHubReachabilityChangedCount"));
  v224[67] = v89;
  v223[68] = @"ipReachabilityCount";
  v88 = +[HMDLogEventHistograms lowVolumeHistogram];
  v87 = objc_msgSend(v88, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent ipAccessoryReachabilityChangedCount](self, "ipAccessoryReachabilityChangedCount"));
  v224[68] = v87;
  v223[69] = @"currentDeviceStartedElectionCount";
  v86 = +[HMDLogEventHistograms lowVolumeHistogram];
  v85 = objc_msgSend(v86, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent currentDeviceStartedLegacyElectionCount](self, "currentDeviceStartedLegacyElectionCount"));
  v224[69] = v85;
  v223[70] = @"v2ElectionCoordinationCurrentDeviceInSecondaryMesh";
  v84 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAggregationAnalysisLogEvent v2ElectionCurrentDeviceInSecondaryCoordinationMesh](self, "v2ElectionCurrentDeviceInSecondaryCoordinationMesh"));
  v224[70] = v84;
  v223[71] = @"v2ElectionCoordinationCurrentDeviceFlapCount";
  v83 = +[HMDLogEventHistograms lowVolumeHistogram];
  v82 = objc_msgSend(v83, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent v2ElectionCoordinationCurrentDeviceFlapCount](self, "v2ElectionCoordinationCurrentDeviceFlapCount"));
  v224[71] = v82;
  v223[72] = @"v2ElectionPercentageDurationCurrentDeviceIsInPrimaryMesh";
  v81 = +[HMDLogEventHistograms successRateHistogram];
  v80 = objc_msgSend(v81, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent v2ElectionPercentageDurationCurrentDeviceIsInPrimaryMesh](self, "v2ElectionPercentageDurationCurrentDeviceIsInPrimaryMesh"));
  v224[72] = v80;
  v223[73] = @"v2ElectionCoordinationMeshUpdateCount";
  v79 = +[HMDLogEventHistograms lowVolumeHistogram];
  v78 = objc_msgSend(v79, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent v2ElectionCoordinationMeshUpdateCount](self, "v2ElectionCoordinationMeshUpdateCount"));
  v224[73] = v78;
  v223[74] = @"v2ElectionCoordinationMeshLeaderElectedCount";
  v77 = +[HMDLogEventHistograms lowVolumeHistogram];
  v76 = objc_msgSend(v77, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent v2ElectionCoordinationMeshLeaderElectedCount](self, "v2ElectionCoordinationMeshLeaderElectedCount"));
  v224[74] = v76;
  v223[75] = @"v2ElectionCoordinationMeshLeaderChangedCount";
  v75 = +[HMDLogEventHistograms lowVolumeHistogram];
  v74 = objc_msgSend(v75, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent v2ElectionCoordinationMeshLeaderChangedCount](self, "v2ElectionCoordinationMeshLeaderChangedCount"));
  v224[75] = v74;
  v223[76] = @"v2ElectionPrimaryResidentElectionRunCount";
  v73 = +[HMDLogEventHistograms lowVolumeHistogram];
  v72 = objc_msgSend(v73, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent v2ElectionPrimaryResidentElectionRunCount](self, "v2ElectionPrimaryResidentElectionRunCount"));
  v224[76] = v72;
  v223[77] = @"v2ElectionPrimaryResidentChangedCount";
  v71 = +[HMDLogEventHistograms lowVolumeHistogram];
  v70 = objc_msgSend(v71, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent v2ElectionPrimaryResidentChangedCount](self, "v2ElectionPrimaryResidentChangedCount"));
  v224[77] = v70;
  v223[78] = @"PrimaryResidentDurationMinutes";
  v69 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDAggregationAnalysisLogEvent primaryResidentDurationMinutes](self, "primaryResidentDurationMinutes"));
  v224[78] = v69;
  v223[79] = @"cloudSyncPushCount";
  v68 = +[HMDLogEventHistograms highVolumeHistogram];
  v67 = objc_msgSend(v68, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent cloudSyncPushCount](self, "cloudSyncPushCount"));
  v224[79] = v67;
  v223[80] = @"cloudSyncFetchCount";
  v66 = +[HMDLogEventHistograms highVolumeHistogram];
  v65 = objc_msgSend(v66, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent cloudSyncFetchCount](self, "cloudSyncFetchCount"));
  v224[80] = v65;
  v223[81] = @"cloudSyncUploadCount";
  v64 = +[HMDLogEventHistograms highVolumeHistogram];
  unint64_t v63 = objc_msgSend(v64, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent cloudSyncUploadCount](self, "cloudSyncUploadCount"));
  v224[81] = v63;
  v223[82] = @"uploadErrorCount";
  unint64_t v62 = +[HMDLogEventHistograms highVolumeHistogram];
  unint64_t v61 = objc_msgSend(v62, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent cloudSyncUploadErrorCount](self, "cloudSyncUploadErrorCount"));
  v224[82] = v61;
  v223[83] = @"cloudStoreCoreDataTransactionCount";
  unint64_t v60 = +[HMDLogEventHistograms lowVolumeHistogram];
  unint64_t v59 = objc_msgSend(v60, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent cloudStoreCoreDataTransactionCount](self, "cloudStoreCoreDataTransactionCount"));
  v224[83] = v59;
  v223[84] = @"workingStoreCoreDataTransactionCount";
  unint64_t v58 = +[HMDLogEventHistograms highVolumeHistogram];
  unint64_t v57 = objc_msgSend(v58, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent workingStoreCoreDataTransactionCount](self, "workingStoreCoreDataTransactionCount"));
  v224[84] = v57;
  v223[85] = @"coreDataCloudKitImportCount";
  unint64_t v56 = +[HMDLogEventHistograms lowVolumeHistogram];
  unint64_t v55 = objc_msgSend(v56, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent coreDataCloudKitImportCount](self, "coreDataCloudKitImportCount"));
  v224[85] = v55;
  v223[86] = @"coreDataCloudKitExportCount";
  unint64_t v54 = +[HMDLogEventHistograms lowVolumeHistogram];
  unint64_t v53 = objc_msgSend(v54, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent coreDataCloudKitExportCount](self, "coreDataCloudKitExportCount"));
  v224[86] = v53;
  v223[87] = @"residentSyncFetchHomeDataRequestCount";
  unint64_t v52 = +[HMDLogEventHistograms lowVolumeHistogram];
  unint64_t v51 = objc_msgSend(v52, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent residentSyncFetchHomeDataRequestCount](self, "residentSyncFetchHomeDataRequestCount"));
  v224[87] = v51;
  v223[88] = @"residentSyncHomeDataChangedNotificationCount";
  unint64_t v50 = +[HMDLogEventHistograms lowVolumeHistogram];
  unint64_t v49 = objc_msgSend(v50, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent residentSyncHomeDataChangedNotificationCount](self, "residentSyncHomeDataChangedNotificationCount"));
  v224[88] = v49;
  v223[89] = @"homeManagerGenerationCounterIncrementCount";
  unint64_t v48 = +[HMDLogEventHistograms highVolumeHistogram];
  unint64_t v47 = objc_msgSend(v48, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent generationCounterIncrementCount](self, "generationCounterIncrementCount"));
  v224[89] = v47;
  v223[90] = @"homeManagerNotifyXPCClientsCount";
  unint64_t v46 = +[HMDLogEventHistograms highVolumeHistogram];
  unint64_t v45 = objc_msgSend(v46, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent notifyXPCClientsHomeDataChangedCount](self, "notifyXPCClientsHomeDataChangedCount"));
  v224[90] = v45;
  v223[91] = @"homeDataMBFetched";
  unint64_t v3 = [(HMDAggregationAnalysisLogEvent *)self homeDataBytesFetched];
  v4 = NSNumber;
  unint64_t v5 = [(HMDAggregationAnalysisLogEvent *)self homeDataBytesFetched];
  if (v3 >> 21 <= 2) {
    unint64_t v6 = v5 >> 20;
  }
  else {
    unint64_t v6 = v5 / 0x500000 + 5;
  }
  unint64_t v44 = [v4 numberWithUnsignedInteger:v6];
  v224[91] = v44;
  v223[92] = @"homeDataMBPushed";
  unint64_t v7 = [(HMDAggregationAnalysisLogEvent *)self homeDataBytesPushed];
  unint64_t v8 = NSNumber;
  unint64_t v9 = [(HMDAggregationAnalysisLogEvent *)self homeDataBytesPushed];
  if (v7 <= 0x5FFFFF) {
    unint64_t v10 = v9 >> 20;
  }
  else {
    unint64_t v10 = v9 / 0x500000 + 5;
  }
  unint64_t v43 = [v8 numberWithUnsignedInteger:v10];
  v224[92] = v43;
  v223[93] = @"legacyHomeDataMBFetched";
  unint64_t v11 = [(HMDAggregationAnalysisLogEvent *)self legacyHomeDataBytesFetched];
  unint64_t v12 = NSNumber;
  unint64_t v13 = [(HMDAggregationAnalysisLogEvent *)self legacyHomeDataBytesFetched];
  if (v11 <= 0x5FFFFF) {
    unint64_t v14 = v13 >> 20;
  }
  else {
    unint64_t v14 = v13 / 0x500000 + 5;
  }
  unint64_t v42 = [v12 numberWithUnsignedInteger:v14];
  v224[93] = v42;
  v223[94] = @"legacyHomeDataMBPushed";
  unint64_t v15 = [(HMDAggregationAnalysisLogEvent *)self legacyHomeDataBytesPushed];
  unint64_t v16 = NSNumber;
  unint64_t v17 = [(HMDAggregationAnalysisLogEvent *)self legacyHomeDataBytesPushed];
  if (v15 <= 0x5FFFFF) {
    unint64_t v18 = v17 >> 20;
  }
  else {
    unint64_t v18 = v17 / 0x500000 + 5;
  }
  unint64_t v41 = [v16 numberWithUnsignedInteger:v18];
  v224[94] = v41;
  v223[95] = @"peakConcurrentIPAccessoryUpdateStaging";
  unint64_t v40 = +[HMDLogEventHistograms lowVolumeHistogram];
  unint64_t v39 = objc_msgSend(v40, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent peakConcurrentIPAccessoryUpdateStaging](self, "peakConcurrentIPAccessoryUpdateStaging"));
  v224[95] = v39;
  v223[96] = @"peakConcurrentIPAccessoryUpdateApply";
  unint64_t v38 = +[HMDLogEventHistograms lowVolumeHistogram];
  unint64_t v37 = objc_msgSend(v38, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent peakConcurrentIPAccessoryUpdateApply](self, "peakConcurrentIPAccessoryUpdateApply"));
  v224[96] = v37;
  v223[97] = @"peakConcurrentBLEAccessoryUpdateStaging";
  unint64_t v36 = +[HMDLogEventHistograms lowVolumeHistogram];
  unint64_t v35 = objc_msgSend(v36, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent peakConcurrentBLEAccessoryUpdateStaging](self, "peakConcurrentBLEAccessoryUpdateStaging"));
  v224[97] = v35;
  v223[98] = @"peakConcurrentBLEAccessoryUpdateApply";
  unint64_t v34 = +[HMDLogEventHistograms lowVolumeHistogram];
  unint64_t v33 = objc_msgSend(v34, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent peakConcurrentBLEAccessoryUpdateApply](self, "peakConcurrentBLEAccessoryUpdateApply"));
  v224[98] = v33;
  v223[99] = @"peakConcurrentThreadAccessoryUpdateStaging";
  unint64_t v32 = +[HMDLogEventHistograms lowVolumeHistogram];
  unint64_t v31 = objc_msgSend(v32, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent peakConcurrentThreadAccessoryUpdateStaging](self, "peakConcurrentThreadAccessoryUpdateStaging"));
  v224[99] = v31;
  v223[100] = @"peakConcurrentThreadAccessoryUpdateApply";
  unint64_t v19 = +[HMDLogEventHistograms lowVolumeHistogram];
  unint64_t v20 = objc_msgSend(v19, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent peakConcurrentThreadAccessoryUpdateApply](self, "peakConcurrentThreadAccessoryUpdateApply"));
  v224[100] = v20;
  v223[101] = @"bulletinNotificationsPostedCount";
  unint64_t v21 = +[HMDLogEventHistograms lowVolumeHistogram];
  unint64_t v22 = objc_msgSend(v21, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent bulletinNotificationsPostedCount](self, "bulletinNotificationsPostedCount"));
  v224[101] = v22;
  v223[102] = @"activeDay";
  unint64_t v23 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAggregationAnalysisLogEvent isActiveDay](self, "isActiveDay"));
  v224[102] = v23;
  v223[103] = @"activeDaysPerMonthCount";
  unint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAggregationAnalysisLogEvent activeDaysPerMonthCount](self, "activeDaysPerMonthCount"));
  v224[103] = v24;
  v223[104] = @"widgetMaxRefreshCountForKind";
  unint64_t v25 = +[HMDLogEventHistograms lowVolumeHistogram];
  unint64_t v26 = objc_msgSend(v25, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent widgetMaxRefreshCountForKind](self, "widgetMaxRefreshCountForKind"));
  v224[104] = v26;
  v223[105] = @"residentSelectionPrimaryResidentChangedCount";
  unint64_t v27 = +[HMDLogEventHistograms lowVolumeHistogram];
  unint64_t v28 = objc_msgSend(v27, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent residentSelectionPrimaryResidentChangedCount](self, "residentSelectionPrimaryResidentChangedCount"));
  v224[105] = v28;
  id v30 = [NSDictionary dictionaryWithObjects:v224 forKeys:v223 count:106];

  return (NSDictionary *)v30;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.eventAggregation.processOverview";
}

@end