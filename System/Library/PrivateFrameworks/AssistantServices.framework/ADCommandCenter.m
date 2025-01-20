@interface ADCommandCenter
+ (id)sharedCommandCenter;
+ (id)sharedQueue;
+ (int)_orchBluetoothStateEnumFromBluetoothState:(int64_t)a3;
+ (int64_t)_fetchBluetoothState;
- (ADCommandCenter)init;
- (ADCommandCenterClient)_currentClient;
- (ADCommandCenterCurrentRequest)_currentRequest;
- (ADCommandCenterRequestDelegate)_requestDelegate;
- (ADCommandCenterSpeechDelegate)_speechDelegate;
- (ADCommandCenterSpeechDelegate)_speechFileDelegate;
- (ADRequestDispatcherService)_requestDispatcherService;
- (ADResponseModeProvider)_responseModeProvider;
- (ADSpeechManager)_speechManager;
- (AFBridgeConnectionListener)_uiBridgeServiceListener;
- (AFInstanceContext)_instanceContext;
- (BOOL)_acousticId_hasCommandForRefId:(id)a3;
- (BOOL)_areRequiredAssetsMissing;
- (BOOL)_assetsCheckRan;
- (BOOL)_callIsLikely;
- (BOOL)_context_bundleIdHasSupportForCarPlayRequiredMessageIntents:(id)a3;
- (BOOL)_deviceIsLocked;
- (BOOL)_didAlreadyAcceptResultCandidate:(id)a3;
- (BOOL)_hasActiveClientOrSyncingOrInCall;
- (BOOL)_hasCompletionForCommandId:(id)a3;
- (BOOL)_hasIncomingCall;
- (BOOL)_hasOutstandingAnchorsRequestId:(id)a3;
- (BOOL)_hasOutstandingRequestId:(id)a3;
- (BOOL)_hasOutstandingRequests;
- (BOOL)_hasOutstandingSyncChunkId:(id)a3;
- (BOOL)_hasRemoteExecutionContextForExecutionID:(id)a3;
- (BOOL)_hasRemoteExecutionContextForRequestID:(id)a3;
- (BOOL)_hasRootExecutionContextForRequestID:(id)a3;
- (BOOL)_isClientBoundCommand:(id)a3;
- (BOOL)_isFauxPeer:(id)a3;
- (BOOL)_isHeadGestureRecognitionAvailable;
- (BOOL)_isInCall;
- (BOOL)_isInCarDNDMode;
- (BOOL)_isInStarkMode;
- (BOOL)_isRelevantCancellationCommand:(id)a3;
- (BOOL)_isRequestDelaying;
- (BOOL)_isServerBoundCommand:(id)a3;
- (BOOL)_isTimeoutSuspended;
- (BOOL)_isWatchAuthenticated;
- (BOOL)_metrics_isAssistantOrDictationEnabled;
- (BOOL)_metrics_isSystemIdle;
- (BOOL)_outputVoice_setOutputVoice:(id)a3;
- (BOOL)_peerIsPairedPhone:(id)a3;
- (BOOL)_peerIsPairedWatch:(id)a3;
- (BOOL)_refIdIsSpeechStart:(id)a3;
- (BOOL)_remoteExecute_shouldSendCommandToPrimaryUser:(id)a3;
- (BOOL)_shouldDumpSiriOnDeviceAnalyticsBiomeStreams;
- (BOOL)_shouldIgnoreCommand:(id)a3 executionContext:(id)a4;
- (BOOL)_shouldImmediatelyDismissSiriDueToMissingRequiredAssets;
- (BOOL)_shouldRetryForError:(id)a3;
- (BOOL)_siriFullUODSupported;
- (BOOL)_siriHybridUODSupported;
- (BOOL)_siriSAESupported;
- (BOOL)_siriUODSupported;
- (BOOL)_speechDelegateHasReceivedPartialResult;
- (BOOL)_syncChunkWindowFull;
- (BOOL)_syncController_hasCommandForRefId:(id)a3;
- (BOOL)_sync_hasCommandForRefId:(id)a3;
- (BOOL)_sync_isRequestBlockingSync;
- (BOOL)_sync_isRequestBlockingSyncVerification;
- (BOOL)_sync_isSyncing;
- (BOOL)assistantSessionManager:(id)a3 shouldLogVisibleRequestFailureForError:(id)a4;
- (BOOL)assistantSessionManagerShouldAttemptRetry:(id)a3;
- (BOOL)canLogWithSpeechManager:(id)a3;
- (BOOL)isDeviceLocked;
- (BOOL)isDeviceShowingLockScreen;
- (BOOL)isHeadGestureRecognitionAvailable;
- (BOOL)isInCarDNDMode;
- (BOOL)isInStarkMode;
- (BOOL)isStereoPairLeader;
- (BOOL)isTimeoutSuspended;
- (NSDictionary)rootExecutionContexts;
- (NSMapTable)_clientBoundCommandLookup;
- (NSMapTable)_serverBoundCommandLookup;
- (NSString)_selectedSharedUserID;
- (OS_dispatch_queue)_queue;
- (SABaseCommand)_lastRequest;
- (id)_account;
- (id)_accounts;
- (id)_acousticIDHelper;
- (id)_activeAccountIdentifier;
- (id)_allAnchorsFromRequest:(id)a3 andResponse:(id)a4;
- (id)_appMetaDataForAppProxy:(id)a3 clientIdentifier:(id)a4 syncSlots:(id)a5;
- (id)_appMetaDataListFromVocabSources:(id)a3 appIdentifyingInfoList:(id)a4;
- (id)_approximatePreviousTTSInterval:(id)a3;
- (id)_assetManager;
- (id)_bargeInModes;
- (id)_beginRemoteExecutionContextForCommand:(id)a3 fromPeer:(id)a4 withRemoteExecutionInfo:(id)a5;
- (id)_contextManager;
- (id)_createDefaultRequestContextData:(BOOL)a3;
- (id)_createMuxStartAsrOnServerRequestWithSpeechRequest:(id)a3;
- (id)_createStartServerRequestWithStartRequest:(id)a3;
- (id)_deviceRouter;
- (id)_deviceSyncCoordinator;
- (id)_diagnosticsManager;
- (id)_directInvocationContextForSpeechRequestOptions:(id)a3 textToSpeechEnabled:(BOOL)a4;
- (id)_domainObjectCache;
- (id)_dumpAssistantState;
- (id)_dumpOnDeviceAnalyticsBiomeStream:(id)a3;
- (id)_dumpSiriOnDeviceAnalyticsBiomeStreams;
- (id)_emptyVerificationSyncAnchorForKey:(id)a3 appBundleID:(id)a4 syncSlotName:(id)a5;
- (id)_executionContextMatchingExecutionInfo:(id)a3 fallbackRequestID:(id)a4;
- (id)_executionDevicesForLocalRequestWithId:(id)a3;
- (id)_experimentationAnalyticsManager;
- (id)_fetchComputedModeAndUpdateRequestDelegate;
- (id)_fetchUODStatusForLanguageCode:(id)a3;
- (id)_firstChanceServiceForCommand:(id)a3;
- (id)_flowServiceListener;
- (id)_getEventsDataForStream:(id)a3 numEvents:(int64_t *)a4;
- (id)_getPreheatOptionsForHorseman;
- (id)_handleConfidenceScores:(id)a3 classification:(unint64_t)a4 classifiedUser:(id)a5 unknownUserScore:(int64_t)a6 duration:(int64_t)a7 version:(int64_t)a8 thresholdingType:(id)a9 assetVersion:(id)a10;
- (id)_handledCommandIdsForRequestId:(id)a3;
- (id)_headphonesAnnouncementRequestCapabilityManager;
- (id)_languageModelForSpeechRequest:(id)a3;
- (id)_locationManager;
- (id)_managedStoreObjectForKey:(id)a3;
- (id)_motionManager;
- (id)_offlineMetricsManager;
- (id)_powerAssertionManager;
- (id)_remoteExecute_primaryUserDevicesWithTypes:(unint64_t)a3;
- (id)_remoteExecutionContextForExecutionID:(id)a3;
- (id)_remoteRequestHelper;
- (id)_remoteSpeechRequestHelper;
- (id)_requestDelayManager;
- (id)_requestDispatcherSessionConfiguration;
- (id)_restrictedCommands;
- (id)_resultObjectCache;
- (id)_rootExecutionContextForRequestID:(id)a3;
- (id)_sendContextPromiseForTypes:(int64_t)a3;
- (id)_sendContextPromiseForTypes:(int64_t)a3 withAceId:(id)a4;
- (id)_serviceManager;
- (id)_sessionManager;
- (id)_sharedDataService;
- (id)_sharedMultiUserService;
- (id)_speechCapturingContext;
- (id)_speechCapturingContextForSessionUUID:(id)a3;
- (id)_startServerRequestWithSpeechRequest:(id)a3 recordingContext:(id)a4 recordingInfo:(id)a5;
- (id)_startServerRequestWithStartRequest:(id)a3 requestInfo:(id)a4;
- (id)_syncManager;
- (id)_syncMetadata;
- (id)_syncRecordForKey:(id)a3 fromDomainObject:(id)a4 appMeta:(id)a5;
- (id)_testAgent;
- (id)_updateUODAssetStatusForLanguage:(id)a3;
- (id)acquireShutdownAssertion;
- (id)assistantSessionManagerCommandsToRestoreStateOnNewConnection:(id)a3;
- (id)dumpAssistantState;
- (id)getAssistantIdentifier;
- (int)getHomeDevicesAudioTopology;
- (int64_t)_context_deviceState;
- (unint64_t)callState;
- (unsigned)_sharedVoiceAudioSessionID;
- (void)UIService:(id)a3 didPresentUIResponseForCommand:(id)a4 withExecutionInfo:(id)a5;
- (void)UIService:(id)a3 executeHandler:(id)a4 forCommand:(id)a5;
- (void)_acceptResultCandidate:(id)a3 isMitigated:(BOOL)a4 featuresToLog:(id)a5 completion:(id)a6;
- (void)_accessRecordedAudioWithIdentifier:(id)a3 completion:(id)a4;
- (void)_acousticId_clearPartialResultTimer;
- (void)_acousticId_commandFailed:(id)a3;
- (void)_acousticId_handleFingerprint:(id)a3 duration:(double)a4;
- (void)_acousticId_musicWasDetected;
- (void)_acousticId_reset;
- (void)_acousticId_sessionFailed;
- (void)_acousticId_speechCaptureCompleted;
- (void)_acousticId_startSessionForSpeechRequest:(id)a3;
- (void)_acousticId_startSessionWithContext:(id)a3;
- (void)_addCompletion:(id)a3 forCommand:(id)a4 forKey:(id)a5;
- (void)_addExecutionDevice:(id)a3 forCommandExecutionContext:(id)a4;
- (void)_addHandledCommandId:(id)a3 forRequestId:(id)a4;
- (void)_addNetworkActivityTracingForLabel:(int64_t)a3 start:(BOOL)a4 withCompletionReason:(int64_t)a5 andError:(id)a6;
- (void)_addOutstandingAnchorsRequestId:(id)a3;
- (void)_addOutstandingRequestId:(id)a3 forReason:(id)a4;
- (void)_addOutstandingSyncChunkId:(id)a3;
- (void)_addPostCommandHandlingBlock:(id)a3 forCommandId:(id)a4 requestId:(id)a5;
- (void)_addRecordedSpeechSampleData:(id)a3 delegate:(id)a4;
- (void)_adviseSessionArbiterToContinueWithPreviousWinner:(BOOL)a3;
- (void)_amosSADomainObjectCancel:(id)a3 completion:(id)a4;
- (void)_amosSADomainObjectCommit:(id)a3 completion:(id)a4;
- (void)_amosSADomainObjectCreate:(id)a3 completion:(id)a4;
- (void)_amosSADomainObjectDelete:(id)a3 completion:(id)a4;
- (void)_amosSADomainObjectPunchOut:(id)a3 completion:(id)a4;
- (void)_amosSADomainObjectRetrieve:(id)a3 completion:(id)a4;
- (void)_amosSADomainObjectUpdate:(id)a3 completion:(id)a4;
- (void)_attachPersonaIdIfNeeded:(id)a3 aceCommand:(id)a4;
- (void)_broadcastCommand:(id)a3;
- (void)_cancelCallKeepAlive;
- (void)_cancelCrossDeviceRequestOperationsForLocalRequestWithId:(id)a3;
- (void)_cancelCrossDeviceRequestOperationsForRemoteRequest;
- (void)_cancelCurrentRequestForReason:(int64_t)a3 andError:(id)a4 successorInfo:(id)a5;
- (void)_cancelLocalRecognitionIfRequired;
- (void)_cancelRequestForDelegate:(id)a3 reason:(int64_t)a4 error:(id)a5;
- (void)_cancelSessionManager;
- (void)_cancelSpeechForDelegate:(id)a3;
- (void)_cleanUpForFailureCommandWithRefId:(id)a3;
- (void)_clearAccount;
- (void)_clearAllExecutionDevices;
- (void)_clearContext;
- (void)_clearContextAndStartAssistantSession;
- (void)_clearContextAndStartDictationSessionWithLanguageCode:(id)a3 dictationOptions:(id)a4;
- (void)_clearQueuedLanguageCode;
- (void)_clearQueuedOutputVoice;
- (void)_clearRequestDelegateState;
- (void)_clearSpeechDelegateState;
- (void)_cloudSyncPreferenceDidChange;
- (void)_completeNotificationSearch:(id)a3 bulletins:(id)a4 completion:(id)a5;
- (void)_completeRequestForCurrentDelegate:(BOOL)a3 error:(id)a4;
- (void)_context_acknowledgeBulletinForObject:(id)a3;
- (void)_context_clearContextWithClearSiriKitContext:(BOOL)a3;
- (void)_context_fetchAppicationContextForApplicationInfo:(id)a3 supplementalContext:(id)a4 refID:(id)a5;
- (void)_context_fetchApplicationContextForApplicationInfos:(id)a3 completion:(id)a4;
- (void)_context_reset;
- (void)_context_rollbackClearContext;
- (void)_context_setAlertContextDirty;
- (void)_context_setApplicationContext:(id)a3;
- (void)_context_setApplicationContextForApplicationInfos:(id)a3 withRefId:(id)a4;
- (void)_context_setOverriddenApplicationContext:(id)a3 withContext:(id)a4;
- (void)_context_setSTApplicationContext:(id)a3;
- (void)_context_updateContext;
- (void)_context_willSetApplicationContextWithRefId:(id)a3;
- (void)_createAssistantLocallyIfNeeded:(BOOL)a3;
- (void)_createRootExecutionContextForRequestID:(id)a3;
- (void)_deleteAccountWithIdentifier:(id)a3;
- (void)_deleteSiriAudioDataOnDevice;
- (void)_deleteSiriHistoryOnDeviceOnDestroyAssistant;
- (void)_deleteSiriHistoryWithContext:(id)a3 withCompletion:(id)a4;
- (void)_destroyActiveAccount;
- (void)_destroyRootExecutionContextForRequestID:(id)a3;
- (void)_dictationSessionDidComplete;
- (void)_didLaunchAppForRequestWithIdentifier:(id)a3;
- (void)_dispatchAndRemovePostCommandHandlingBlocksForCommandId:(id)a3 requestId:(id)a4;
- (void)_downloadMorphunAssets:(id)a3;
- (void)_emitAudioTopologyForRequestId:(id)a3;
- (void)_emitDeviceDynamicContextForRequest:(id)a3;
- (void)_emitDeviceDynamicContextForRequest:(id)a3 withTimestamp:(unint64_t)a4;
- (void)_emitTriggerWithCachingForUUID:(id)a3 namespace:(id)a4 requestID:(id)a5;
- (void)_endRemoteExecutionContext:(id)a3;
- (void)_endSessionForDelegate:(id)a3;
- (void)_endSpeechRequestForCommand:(id)a3 withError:(id)a4 suppressAlert:(BOOL)a5 secureOfflineOnlyDictation:(BOOL)a6;
- (void)_ensureBackgroundContextSentToServer;
- (void)_fetchAllAppSourcesForSyncingWithCustomVocabInfo:(id)a3 completion:(id)a4;
- (void)_fetchAndSendApplicationContextForApplicationInfos:(id)a3 fetchedOrderedContextDictionaries:(id)a4 applicationContexts:(id)a5 refID:(id)a6;
- (void)_fetchStarkDeviceLockedStateWithCompletion:(id)a3;
- (void)_fetchSupportedLanguagesWithCompletion:(id)a3;
- (void)_fillInSyncAndPrimeTokens:(id)a3;
- (void)_finishVerificationWithKeys:(id)a3;
- (void)_firstChanceServiceChangeIdFrom:(id)a3 to:(id)a4;
- (void)_forceAudioSessionActiveWithContext:(id)a3 completion:(id)a4;
- (void)_forceAudioSessionInactiveWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)_getDeferredObjectsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)_getDictationLanguages:(id)a3 options:(id)a4 speechOptions:(id)a5 delegate:(id)a6 completion:(id)a7;
- (void)_getOrderedContextDictionaryForTransformedAFApplicationContext:(id)a3 completion:(id)a4;
- (void)_getSiriOutputVolumeForAudioRoute:(id)a3 completion:(id)a4;
- (void)_getTransformedApplicationContextForContext:(id)a3 completion:(id)a4;
- (void)_handleAceCommand:(id)a3 afterCurrentRequest:(BOOL)a4 waitForResponse:(BOOL)a5 withDelegate:(id)a6 completion:(id)a7;
- (void)_handleBareRequestCompleted:(id)a3;
- (void)_handleClientReply:(id)a3 error:(id)a4 forSessionCommand:(id)a5;
- (void)_handleCommand:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_handleCommandAndClientReply:(id)a3 executionContext:(id)a4 commandCompletion:(id)a5;
- (void)_handleCommandInAMOS:(id)a3 completion:(id)a4;
- (void)_handleCommandResponse:(id)a3 error:(id)a4 forCommand:(id)a5 executionContext:(id)a6 completion:(id)a7;
- (void)_handleExternalActivationRequest:(id)a3 completion:(id)a4;
- (void)_handleExtractSpeechDataCompleted:(id)a3 inResponseTo:(id)a4 completion:(id)a5;
- (void)_handleGenericAceCommand:(id)a3 withDelegate:(id)a4 interruptOutstandingRequest:(BOOL)a5 reply:(id)a6;
- (void)_handleGenericConcreteAceCommand:(id)a3 withDelegate:(id)a4 interruptOutstandingRequest:(BOOL)a5 reply:(id)a6;
- (void)_handleIgnoredCommand:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_handleIntent:(id)a3 inBackgroundAppWithBundleId:(id)a4 reply:(id)a5;
- (void)_handleLocalSpeechRecognitionForOfflineSupport:(id)a3 logText:(BOOL)a4;
- (void)_handleNextCallbacksForReply:(id)a3 forCommand:(id)a4 forRequestId:(id)a5 withExecutionContext:(id)a6;
- (void)_handlePartialSpeechRecognitionForElapsedTime:(double)a3 WithDelegateBlock:(id)a4;
- (void)_handleQuickStopCommandRoutedFromRemote:(id)a3 completion:(id)a4;
- (void)_handleRemoteSpeechRequest:(id)a3 completion:(id)a4;
- (void)_handleSADOCommandIfServiceDoesNotUseAMOS:(id)a3 allowInterposing:(BOOL)a4 completion:(id)a5;
- (void)_handleSendCommands:(id)a3 forRequestDelegate:(id)a4 completion:(id)a5;
- (void)_handleServiceCommand:(id)a3 afterMyriadDecision:(BOOL)a4 executionContext:(id)a5 completion:(id)a6;
- (void)_handleServiceCommand:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_handleSpeechRecognizedWithDelegateBlock:(id)a3;
- (void)_handleSuspendClientEndpointer:(id)a3;
- (void)_handleUpdatedSyncAndTokens:(id)a3;
- (void)_handleValidatedSyncGetAnchorsResponse:(id)a3 forGetAnchors:(id)a4;
- (void)_invokeAllCompletionsWithError:(id)a3;
- (void)_invokeCompletionForCommand:(id)a3;
- (void)_listInstalledServicesWithCompletion:(id)a3;
- (void)_logAudioTopologyForRequestId:(id)a3;
- (void)_logCrossDeviceCommandEndedMetricsForCommand:(id)a3 targetProductType:(id)a4 targetDeviceID:(id)a5 targetDeviceContextIdentifier:(id)a6 targetProximity:(int64_t)a7 coreAnalyticsEvent:(id)a8 response:(id)a9 error:(id)a10;
- (void)_logExecuteOnRemoteRequestForRequestId:(id)a3 turnId:(id)a4 event:(int64_t)a5;
- (void)_metrics_awdRequestEnd;
- (void)_metrics_destroyAllMetrics;
- (void)_metrics_destroyAllMetricsIfNeeded;
- (void)_metrics_logSpeechRecognized:(id)a3 resultId:(id)a4;
- (void)_metrics_markLocalEagerRecognitionCandidate:(id)a3;
- (void)_metrics_markLocalPartialSpeechRecognition;
- (void)_metrics_markLocalSpeechCompletedWithStatistics:(id)a3;
- (void)_metrics_markLocalSpeechPackage:(id)a3 interactionId:(id)a4 optedIn:(BOOL)a5;
- (void)_metrics_markLocalSpeechStartedWithContext:(id)a3;
- (void)_metrics_processEventRecordsFromStore:(id)a3 batch:(id)a4 deliveryStream:(unint64_t)a5 eventStreamUID:(id)a6 streamSpeechId:(id)a7 untilLimit:(double)a8 uploadRecords:(id)a9 completion:(id)a10;
- (void)_metrics_publishDailyDeviceStatus:(id)a3 completion:(id)a4;
- (void)_metrics_recordCancellationMetrics;
- (void)_metrics_recordFailureMetricsForError:(id)a3;
- (void)_metrics_recordNetworkSnapshotForEvent:(int64_t)a3 completion:(id)a4;
- (void)_metrics_recordSNNetworkSnapshotForEvent:(int64_t)a3 completion:(id)a4;
- (void)_metrics_sendEngagementFeedback:(int64_t)a3 voiceQueryIdentifier:(id)a4;
- (void)_metrics_sendMetricsToServerUntilLimit:(double)a3 requiresUnlimitedPower:(BOOL)a4 requiresActiveSession:(BOOL)a5 purgesOversizedStorage:(BOOL)a6 scheduledActivity:(BOOL)a7 completion:(id)a8;
- (void)_metrics_sendNextAnalyticsEventStreamToServerUntilLimit:(double)a3 requiresUnlimitedPower:(BOOL)a4 requiresActiveSession:(BOOL)a5 prioritizedEventStreamUID:(id)a6 deliveryStreamContinuations:(id *)a7 scheduledActivity:(BOOL)a8 completion:(id)a9;
- (void)_metrics_sendNextOfflineMetricsToServerUntilLimit:(double)a3 requiresUnlimitedPower:(BOOL)a4 requiresActiveSession:(BOOL)a5 completion:(id)a6;
- (void)_notifyUSTForAceCommand:(id)a3;
- (void)_notifyUSTForRequestCompleted:(id)a3;
- (void)_notifyUSTForRequestStarted:(id)a3;
- (void)_openURL:(id)a3 completion:(id)a4;
- (void)_pauseRecognition;
- (void)_performCallbacksForCommand:(id)a3 reply:(id)a4 executionContext:(id)a5 error:(id)a6;
- (void)_postPersonalDomainActivityNotificationWithBody:(id)a3 command:(id)a4 executionContext:(id)a5 completion:(id)a6;
- (void)_postUpdatePersonalRequestSettingsNotification:(id)a3 forLocalizationKey:(id)a4 executionContext:(id)a5 completion:(id)a6;
- (void)_postWatchNotificationWithContext:(id)a3 withError:(id)a4;
- (void)_preheatAllServices;
- (void)_preheatCallbacksForCommand:(id)a3;
- (void)_preheatViaRequestDispatcher;
- (void)_preheatWithStyle:(int64_t)a3 forOptions:(id)a4 completion:(id)a5;
- (void)_prepareAndStartSyncVerification;
- (void)_prepareForAppLaunchForRequest:(id)a3;
- (void)_prepareForPhoneCall;
- (void)_processQueuedLanguageCode;
- (void)_processQueuedLanguageCodeAndOutputVoice;
- (void)_processQueuedOutputVoice;
- (void)_reallyCommitOrSaveMetrics:(id)a3;
- (void)_reallyEndSessionForDelegate:(id)a3;
- (void)_reallyHandleNewStartLocalRequest:(id)a3;
- (void)_reallyHandleNewStartRequest:(id)a3 info:(id)a4;
- (void)_refreshAssistantValidation;
- (void)_registerDomainSignalServiceWithServiceManager:(id)a3;
- (void)_registerNanoServicesWithServiceManager:(id)a3;
- (void)_remoteExecute_remoteDeviceExecuteCommand:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_remoteExecute_remoteDeviceExecuteCommand:(id)a3 onDeviceForAssistantId:(id)a4 executionContext:(id)a5 completion:(id)a6;
- (void)_remoteExecute_remoteDeviceExecuteCommand:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 throughProxyDevice:(id)a6 executionContext:(id)a7 completion:(id)a8;
- (void)_remoteExecute_remoteDeviceExecuteSerializedCommand:(id)a3 onDeviceForAssistantId:(id)a4 allowFallbackOnAWDL:(BOOL)a5 executionContext:(id)a6 completion:(id)a7;
- (void)_remoteExecute_remoteDeviceExecuteSerializedCommand:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 allowFallbackOnAWDL:(BOOL)a6 executionContext:(id)a7 completion:(id)a8;
- (void)_remoteExecute_remoteDeviceExecuteSerializedCommand:(id)a3 onSpecifiedDeviceTypes:(unint64_t)a4 preferredMessagingOption:(unint64_t)a5 allowFallbackOnAWDL:(BOOL)a6 executionContext:(id)a7 completion:(id)a8;
- (void)_removeAllHandledCommandIds;
- (void)_removeAllPostCommandHandlingBlocks;
- (void)_removeAllSpeechCapturingContexts;
- (void)_removeDelegate:(id)a3;
- (void)_removeExecutionDevicesForLocalRequestWithId:(id)a3;
- (void)_removeFirstChanceServiceForAceId:(id)a3;
- (void)_removeHandledCommandIdsForRequestId:(id)a3;
- (void)_removeOutstandingAnchorsRequestId:(id)a3;
- (void)_removeOutstandingRequestId:(id)a3 forReason:(id)a4;
- (void)_removeOutstandingSyncChunkId:(id)a3;
- (void)_removePostCommandHandlingBlocksForRequestId:(id)a3;
- (void)_replaceRequestDelegate:(id)a3 reason:(int64_t)a4;
- (void)_replaceRequestDelegate:(id)a3 withInfo:(id)a4 reason:(int64_t)a5 andCompletion:(id)a6;
- (void)_replaceSpeechDelegateWhenReady:(id)a3 suppressAlert:(BOOL)a4 withCompletion:(id)a5;
- (void)_replaceSpeechDelegateWhenReady:(id)a3 waitForRecordingToFinish:(BOOL)a4 suppressAlert:(BOOL)a5 withCompletion:(id)a6;
- (void)_requestAnchorsForKeys:(id)a3 appSources:(id)a4 watchAppSources:(id)a5 forceReset:(BOOL)a6 includeAllKnownAnchors:(BOOL)a7 reasons:(id)a8;
- (void)_requestBarrier:(id)a3;
- (void)_requestBarrierIfNecessary:(id)a3;
- (void)_requestDidEnd;
- (void)_requestWillStartWithInfo:(id)a3 showNetworkActivityIndicator:(BOOL)a4;
- (void)_rescheduleValidationRefresh;
- (void)_resetPeerAccountSettingsWithSharedData:(id)a3;
- (void)_resetServices;
- (void)_resetSyncVerification;
- (void)_resumeRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5;
- (void)_rollbackRequestForDelegate:(id)a3;
- (void)_runMaintenanceForServices:(id)a3 completion:(id)a4;
- (void)_saAIRequestSearch:(id)a3 completion:(id)a4;
- (void)_saAIRetrySearch:(id)a3 completion:(id)a4;
- (void)_saAISearchCompleted:(id)a3 completion:(id)a4;
- (void)_saAcknowledgeAlert:(id)a3 completion:(id)a4;
- (void)_saAddResultObjects:(id)a3 completion:(id)a4;
- (void)_saAssistantDestroyed:(id)a3 completion:(id)a4;
- (void)_saCancelCrossDeviceRequest:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_saCancelSucceeded:(id)a3 completion:(id)a4;
- (void)_saClientSetupInfo:(id)a3 completion:(id)a4;
- (void)_saCommandFailed:(id)a3 completion:(id)a4;
- (void)_saCommandIgnored:(id)a3 completion:(id)a4;
- (void)_saDeviceConfiguration:(id)a3 completion:(id)a4;
- (void)_saDeviceMyriadConfiguration:(id)a3 completion:(id)a4;
- (void)_saDismissRemoteAnnouncement:(id)a3 completion:(id)a4;
- (void)_saDomainObjectCancel:(id)a3 completion:(id)a4;
- (void)_saDomainObjectCommit:(id)a3 completion:(id)a4;
- (void)_saDomainObjectCreate:(id)a3 completion:(id)a4;
- (void)_saDomainObjectDelete:(id)a3 completion:(id)a4;
- (void)_saDomainObjectPunchOut:(id)a3 completion:(id)a4;
- (void)_saDomainObjectRetrieve:(id)a3 completion:(id)a4;
- (void)_saDomainObjectUpdate:(id)a3 completion:(id)a4;
- (void)_saExecuteCallbacks:(id)a3 completion:(id)a4;
- (void)_saExecuteOnRemoteRequest:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_saGetAssistantData:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_saGetRequestOrigin:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_saInitiateHandoffOnCompanion:(id)a3 completion:(id)a4;
- (void)_saLogNumericEvent:(id)a3 completion:(id)a4;
- (void)_saLogSignatureWithABC:(id)a3 completion:(id)a4;
- (void)_saLogStringEvent:(id)a3 completion:(id)a4;
- (void)_saNotificationSearch:(id)a3 completion:(id)a4;
- (void)_saPerformDataDetection:(id)a3 completion:(id)a4;
- (void)_saPerformRemoteAnnouncement:(id)a3 completion:(id)a4;
- (void)_saPing:(id)a3 completion:(id)a4;
- (void)_saPostCalendarActivityNotification:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_saPostPersonalDomainActivityNotification:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_saPostUpdatePersonalRequestSettingsNotification:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_saQuickStop:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_saReplayRequestFromDMHypothesis:(id)a3 completion:(id)a4;
- (void)_saRequestCompleted:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_saRollbackSucceeded:(id)a3 completion:(id)a4;
- (void)_saSASyncGetCachedSyncAnchors:(id)a3 completion:(id)a4;
- (void)_saSendCommands:(id)a3 completion:(id)a4;
- (void)_saSetClientData:(id)a3 completion:(id)a4;
- (void)_saSetDeviceTTSMuteState:(id)a3 completion:(id)a4;
- (void)_saSetHandoffPayload:(id)a3 completion:(id)a4;
- (void)_saSetLatencyDiagnosticConfiguration:(id)a3 completion:(id)a4;
- (void)_saSetMultilingualDictationConfig:(id)a3 completion:(id)a4;
- (void)_saStartLocalRequest:(id)a3 completion:(id)a4;
- (void)_saStartUIRequest:(id)a3 completion:(id)a4;
- (void)_saStructuredDictationFailure:(id)a3 completion:(id)a4;
- (void)_saStructuredDictationResult:(id)a3 completion:(id)a4;
- (void)_saSyncChunkAccepted:(id)a3 completion:(id)a4;
- (void)_saSyncChunkDenied:(id)a3 completion:(id)a4;
- (void)_saSyncClientVerify:(id)a3 completion:(id)a4;
- (void)_saSyncFinished:(id)a3 completion:(id)a4;
- (void)_saSyncGetAnchors:(id)a3 completion:(id)a4;
- (void)_saSyncGetAnchorsResponse:(id)a3 completion:(id)a4;
- (void)_saSyncServerVerifyResponse:(id)a3 completion:(id)a4;
- (void)_saTTSGetSpeechSynthesisVolume:(id)a3 completion:(id)a4;
- (void)_saTTSSetSpeechSynthesisVolume:(id)a3 completion:(id)a4;
- (void)_saUnhandledObject:(id)a3 completion:(id)a4;
- (void)_saWaitForCommands:(id)a3 completion:(id)a4;
- (void)_sasAbortSpeechRequest:(id)a3 completion:(id)a4;
- (void)_sasClientBoundConfusionNetwork:(id)a3 completion:(id)a4;
- (void)_sasConfirmEndpoint:(id)a3 completion:(id)a4;
- (void)_sasExtractSpeechData:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_sasPronunciationRecognized:(id)a3 completion:(id)a4;
- (void)_sasResultCandidate:(id)a3 completion:(id)a4;
- (void)_sasServerEndpointFeatures:(id)a3 completion:(id)a4;
- (void)_sasSpeechFailure:(id)a3 completion:(id)a4;
- (void)_sasSpeechMultilingualSpeechRecognized:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_sasSpeechPartialResult:(id)a3 completion:(id)a4;
- (void)_sasSpeechRecognized:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_sasSpeechServerEndpointIdentified:(id)a3 completion:(id)a4;
- (void)_sasSuspendClientEndpointer:(id)a3 completion:(id)a4;
- (void)_sasVoiceIdentificationSignal:(id)a3 completion:(id)a4;
- (void)_sasVoiceSearchFinalResult:(id)a3 completion:(id)a4;
- (void)_sasVoiceSearchPartialResult:(id)a3 completion:(id)a4;
- (void)_scheduleCallKeepAlive;
- (void)_sendAMOSCommand:(id)a3 domain:(id)a4 toBundleWithIdentifier:(id)a5 completion:(id)a6;
- (void)_sendAMOSCommandToService:(id)a3 responseHandler:(id)a4;
- (void)_sendCancelSpeechForCommand:(id)a3;
- (void)_sendCommandFailedForCommand:(id)a3 error:(id)a4;
- (void)_sendCommandFailedForCommand:(id)a3 reason:(id)a4;
- (void)_sendCommandToServer:(id)a3;
- (void)_sendCommandToServer:(id)a3 completion:(id)a4;
- (void)_sendCommandToServer:(id)a3 opportunistically:(BOOL)a4;
- (void)_sendCommandToServer:(id)a3 opportunistically:(BOOL)a4 completion:(id)a5;
- (void)_sendContextAndRestrictionsForSpeechRequestWithInfo:(id)a3;
- (void)_sendEnableServerEndpointerCommandWithRefID:(id)a3;
- (void)_sendGizmoSharedDataIfNeeded;
- (void)_sendLocationIfNeededForRequest;
- (void)_sendMetrics:(id)a3 requiresActiveSession:(BOOL)a4 batch:(id)a5 completion:(id)a6;
- (void)_sendRequestToServer:(id)a3;
- (void)_sendRestrictionsInPreparationForRequest;
- (void)_sendRollbackCommandForCommand:(id)a3;
- (void)_sendServiceCommand:(id)a3 completion:(id)a4;
- (void)_sendSessionObject:(id)a3 opportunistically:(BOOL)a4;
- (void)_sendSpeechCorrectionInfo:(id)a3 forCorrectionContext:(id)a4;
- (void)_sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4;
- (void)_sendStartSpeechCommandWithSpeechManager:(id)a3 info:(id)a4 context:(id)a5;
- (void)_sendSyncFinishedAndReferenceCurrentSyncPromise:(BOOL)a3;
- (void)_sendWillStopRecordingForCommand:(id)a3;
- (void)_sessionDidFailWithError:(id)a3;
- (void)_setActiveAccountIdentifier:(id)a3;
- (void)_setAlertContext;
- (void)_setBackgroundContext;
- (void)_setCallIsLikely:(BOOL)a3;
- (void)_setCarDNDRestriction:(BOOL)a3;
- (void)_setConfiguration:(id)a3 forClient:(id)a4;
- (void)_setCurrentRequest:(id)a3;
- (void)_setCurrentRequestWithCommand:(id)a3;
- (void)_setCurrentRequestWithRequestId:(id)a3;
- (void)_setFirstChanceService:(id)a3 forAceId:(id)a4;
- (void)_setHasIncomingCall:(BOOL)a3;
- (void)_setHeadGestureRecognitionAvailability:(BOOL)a3;
- (void)_setHeadphonesAuthenticated:(BOOL)a3;
- (void)_setIsInCall:(BOOL)a3;
- (void)_setIsTimeoutSuspended:(BOOL)a3;
- (void)_setLanguageCode:(id)a3 outputVoice:(id)a4;
- (void)_setLanguageCode:(id)a3 outputVoice:(id)a4 isDefaultValue:(BOOL)a5;
- (void)_setLanguageCode:(id)a3 outputVoice:(id)a4 isDefaultValue:(BOOL)a5 withCompletion:(id)a6;
- (void)_setLanguageCodeIfNeeded;
- (void)_setLastRequest:(id)a3;
- (void)_setLockState:(BOOL)a3 showingLockScreen:(BOOL)a4;
- (void)_setManagedStoreObject:(id)a3 forKey:(id)a4;
- (void)_setModesConfiguration:(id)a3;
- (void)_setRequestDispatcherService:(id)a3;
- (void)_setResponseModeProvider:(id)a3;
- (void)_setRestrictedAppContext;
- (void)_setSiriFullUODSupported:(BOOL)a3;
- (void)_setSiriHybridUODSupported:(BOOL)a3;
- (void)_setSiriOutputVolume:(float)a3 forAudioRoute:(id)a4 operationType:(int64_t)a5 completion:(id)a6;
- (void)_setSiriSAESupported:(BOOL)a3;
- (void)_setSiriUODSupported:(BOOL)a3;
- (void)_setSpeechCapturingContext:(id)a3;
- (void)_setSpeechRecognizedContext:(id)a3;
- (void)_setStarkRestriction:(BOOL)a3;
- (void)_setSupportsCarPlayVehicleDataRestriction:(BOOL)a3;
- (void)_setSyncContext;
- (void)_setUIService:(id)a3;
- (void)_setWatchAuthenticated:(BOOL)a3;
- (void)_setupUIBridgeServiceListener;
- (void)_shutdownAfterDelay:(double)a3;
- (void)_shutdownSessionWhenIdle;
- (void)_signalUSTTestRequestWithStartRequest:(id)a3 requestInfo:(id)a4;
- (void)_speechCaptureCompleted;
- (void)_startAcousticIDRequestWithDelegate:(id)a3 withOptions:(id)a4 context:(id)a5;
- (void)_startDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 sessionUUID:(id)a6 delegate:(id)a7;
- (void)_startDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 sessionUUID:(id)a6 delegate:(id)a7 completion:(id)a8;
- (void)_startDictationWithURL:(id)a3 isNarrowBand:(BOOL)a4 language:(id)a5 options:(id)a6 sessionUUID:(id)a7 delegate:(id)a8;
- (void)_startLanguageDetectionWaitTimer;
- (void)_startLocalRequest:(id)a3 withRequestInfo:(id)a4 forDelegate:(id)a5 suppressCancelationAlertIfCapturingSpeech:(BOOL)a6 completion:(id)a7;
- (void)_startNonSpeechRequest:(id)a3 forDelegate:(id)a4;
- (void)_startNonSpeechRequest:(id)a3 forDelegate:(id)a4 withInfo:(id)a5 options:(id)a6 suppressAlert:(BOOL)a7 completion:(id)a8;
- (void)_startObservingCallState;
- (void)_startRecordedDictationWithLanguage:(id)a3 options:(id)a4 sessionUUID:(id)a5 narrowband:(BOOL)a6 delegate:(id)a7;
- (void)_startRecordingForPendingDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 sessionUUID:(id)a6 delegate:(id)a7 completion:(id)a8;
- (void)_startRecordingForPendingSpeechRequestForDelegate:(id)a3 withOptions:(id)a4 sessionUUID:(id)a5 completion:(id)a6;
- (void)_startRemoteRequest:(id)a3 onPeer:(id)a4 completion:(id)a5;
- (void)_startRemoteRequest:(id)a3 onPeer:(id)a4 withContext:(id)a5 completion:(id)a6;
- (void)_startRequest:(id)a3 withDelegate:(id)a4;
- (void)_startSpeechPronunciationRequestWithDelegate:(id)a3 withOptions:(id)a4 pronunciationContext:(id)a5;
- (void)_startSpeechRequestWithDelegate:(id)a3 withOptions:(id)a4 sessionUUID:(id)a5;
- (void)_startSpeechRequestWithDelegate:(id)a3 withOptions:(id)a4 sessionUUID:(id)a5 completion:(id)a6;
- (void)_startSpeechRequestWithURL:(id)a3 isNarrowBand:(BOOL)a4 withDelegate:(id)a5 completion:(id)a6;
- (void)_startUpdatingMotionActivity;
- (void)_stopLanguageDetectionWaitTimerIfNeeded;
- (void)_stopObservingCallStateWithCompletion:(id)a3;
- (void)_stopSpeechWithOptions:(id)a3 forDelegate:(id)a4;
- (void)_stopUpdatingMotionActivity;
- (void)_storeExtractedSpeechLocally:(id)a3;
- (void)_sync_assistantLoadedSyncRequest:(BOOL)a3;
- (void)_sync_commandFailed:(id)a3;
- (void)_sync_commandIgnored:(id)a3;
- (void)_sync_continueIfConditionsMet;
- (void)_sync_continueVerificationIfConditionsMet;
- (void)_sync_reset;
- (void)_sync_setSyncDelegate:(id)a3;
- (void)_sync_setSyncVerificationNeededAndFullReportNeeded:(BOOL)a3 shouldPostNotification:(BOOL)a4;
- (void)_sync_syncAnchorKeys:(id)a3 forceReset:(BOOL)a4 reasons:(id)a5 forSyncPromise:(id)a6;
- (void)_sync_syncIfNeeded;
- (void)_telephonyRequestCompleted;
- (void)_triggerABCforType:(id)a3 subType:(id)a4 context:(id)a5;
- (void)_trimRecordedAudioWithIdentifier:(id)a3 offset:(double)a4 duration:(double)a5 outputFileType:(int64_t)a6 completion:(id)a7;
- (void)_trySendingShowRequestHandlingStatusForAsrOnDevice:(BOOL)a3 startSpeechRequestId:(id)a4;
- (void)_updateAutoDownloadedVoiceAssetsForOutputVoice;
- (void)_updateFlowContext;
- (void)_updateObjectFromService:(id)a3 sadIdentifier:(id)a4 completion:(id)a5;
- (void)_updateSharedDataFromPeers:(id)a3 completion:(id)a4;
- (void)_updateSharedDataWithPairedPeerData:(id)a3;
- (void)_updateSpeechOptions:(id)a3 forDelegate:(id)a4;
- (void)_updateSpeechOptions:(id)a3 forDelegate:(id)a4 allowUpdateInSpeechCompletion:(BOOL)a5;
- (void)_updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10;
- (void)_writeDataToDisk:(id)a3 withFileName:(id)a4;
- (void)_writeTextToDisk:(id)a3 withFileName:(id)a4;
- (void)accessRecordedAudioWithIdentifier:(id)a3 completion:(id)a4;
- (void)acousticIDHelper:(id)a3 didCompleteSessionSuccessfully:(BOOL)a4;
- (void)acousticIDHelperDidStartSession:(id)a3;
- (void)adCallStateChangedCallInProcess:(BOOL)a3;
- (void)adCallStateChangedCallIncoming:(BOOL)a3;
- (void)addRecordedSpeechSampleData:(id)a3 delegate:(id)a4;
- (void)addService:(id)a3;
- (void)adviseSessionArbiterToContinueWithPreviousWinner:(BOOL)a3;
- (void)announceNotificationHandlingStateUpdatedToState:(int64_t)a3;
- (void)appLaunchHandler:(id)a3 didLaunchAppForRequestId:(id)a4;
- (void)areAnnouncementRequestsPermittedByPresentationWhileActiveWithCompletion:(id)a3;
- (void)assistantSessionManager:(id)a3 didChangeRequestIdFrom:(id)a4 toId:(id)a5;
- (void)assistantSessionManager:(id)a3 didLoadAssistantSyncRequested:(BOOL)a4;
- (void)assistantSessionManager:(id)a3 didObserverIntermediateError:(id)a4;
- (void)assistantSessionManager:(id)a3 receivedCommand:(id)a4;
- (void)assistantSessionManager:(id)a3 receivedError:(id)a4 isRetryableError:(BOOL)a5;
- (void)assistantSessionManager:(id)a3 willRetryOnError:(id)a4;
- (void)assistantSessionManagerConnectionDidBecomeActive:(id)a3;
- (void)assistantSessionManagerDidCreateAssistant:(id)a3;
- (void)assistantSessionManagerDidDestroyAssistant:(id)a3;
- (void)assistantSessionManagerSessionConnectionDidReset:(id)a3;
- (void)assistantSessionManagerSessionRemoteConnectionDidReset:(id)a3;
- (void)cancelCurrentRequest;
- (void)cancelCurrentRequestForReason:(int64_t)a3;
- (void)cancelRequestForDelegate:(id)a3 reason:(int64_t)a4 error:(id)a5;
- (void)cancelSpeechForDelegate:(id)a3;
- (void)clearContext;
- (void)clientConnected:(id)a3;
- (void)clientDisconnected:(id)a3;
- (void)contextManagerDidUpdateBackgroundContext:(id)a3;
- (void)dealloc;
- (void)defrost;
- (void)deleteAccountWithIdentifier:(id)a3;
- (void)destroyActiveAccount;
- (void)dictationRequestDidCompleteRecognitionWithError:(id)a3 secureOfflineOnlyRecognition:(BOOL)a4 sessionUUID:(id)a5 statistics:(id)a6;
- (void)dictationRequestDidRecognizeFinalResultCandidatePackage:(id)a3 sessionUUID:(id)a4;
- (void)dictationRequestDidRecognizePackage:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5;
- (void)dictationRequestDidRecognizePartialPackage:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5;
- (void)dictationRequestDidRecognizeTokens:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5;
- (void)dictationRequestDidRecognizeVoiceCommandCandidatePackage:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5;
- (void)dismissAssistant;
- (void)dismissAssistantWithReason:(int64_t)a3;
- (void)dismissedAllVisibleAssistantUIForReason:(id)a3;
- (void)endSessionForDelegate:(id)a3;
- (void)executeCommand:(id)a3 fromPeer:(id)a4 remoteExecutionInfo:(id)a5 reply:(id)a6;
- (void)extendRequestTimeoutBy:(double)a3 forRequestID:(id)a4;
- (void)failedToLaunchAppWithBundleIdentifier:(id)a3;
- (void)fetchAccounts:(id)a3;
- (void)fetchActiveAccount:(id)a3;
- (void)fetchActiveAccountIdentifier:(id)a3;
- (void)fetchAppicationContextForApplicationInfo:(id)a3 supplementalContext:(id)a4 refID:(id)a5;
- (void)fetchBulletinsOnLockScreenForNotificationManager:(id)a3 completion:(id)a4;
- (void)fetchContextForApplicationInfo:(id)a3 completion:(id)a4;
- (void)fetchLastLocationWithCompletion:(id)a3;
- (void)fetchLocationAuthorization:(id)a3;
- (void)fetchManagedStoreObjectForKey:(id)a3 completion:(id)a4;
- (void)fetchSupportedLanguages;
- (void)fetchSupportedLanguagesWithCompletion:(id)a3;
- (void)forceAudioSessionActiveWithContext:(id)a3 completion:(id)a4;
- (void)forceAudioSessionInactiveWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)getAccessoryInfoForAccessoryWithUUID:(id)a3 completionHandler:(id)a4;
- (void)getCrossDeviceContextWithCompletion:(id)a3;
- (void)getCurrentContextSnapshotWithCompletion:(id)a3;
- (void)getDeferredObjectsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)getDeviceContextsForKeys:(id)a3 forRequestID:(id)a4 includesNearbyDevices:(BOOL)a5 completion:(id)a6;
- (void)getOfflineDictationStatusIgnoringCache:(BOOL)a3 completion:(id)a4;
- (void)getOriginDeviceInfoForContextIdentifier:(id)a3 completion:(id)a4;
- (void)getRecordedAudioDirectoryPathsWithCompletion:(id)a3;
- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6;
- (void)getSharedDataForPeer:(id)a3;
- (void)getSiriOutputVolumeForAudioRoute:(id)a3 completion:(id)a4;
- (void)getSpeakerCapabilityForAccessoryWithUUID:(id)a3 completionHandler:(id)a4;
- (void)handleAceCommand:(id)a3 afterCurrentRequest:(BOOL)a4 waitForResponse:(BOOL)a5 withDelegate:(id)a6 completion:(id)a7;
- (void)handleCommand:(id)a3 completion:(id)a4;
- (void)handleCommand:(id)a3 withExecutionContextMatchingInfo:(id)a4 completion:(id)a5;
- (void)handleExternalActivationRequest:(id)a3 completion:(id)a4;
- (void)handleFailedStartPlaybackWithDestination:(int64_t)a3 completion:(id)a4;
- (void)handleGenericAceCommand:(id)a3 withDelegate:(id)a4 interruptOutstandingRequest:(BOOL)a5 targetReplyQueue:(id)a6 reply:(id)a7;
- (void)handleRemoteSpeechRequest:(id)a3 completion:(id)a4;
- (void)handleSpeechRecognized:(id)a3 completion:(id)a4;
- (void)handleSpeechServerEndpointIdentified:(id)a3 completion:(id)a4;
- (void)isHeadGestureRecognitionAvailableWithCompletion:(id)a3;
- (void)isInCarDNDModeWithCompletion:(id)a3;
- (void)isWatchAuthenticatedWithCompletion:(id)a3;
- (void)listenForSharedDataFromCloud;
- (void)metrics_publishDailyDeviceStatus:(id)a3 completion:(id)a4;
- (void)notificationManagerDidChangeBulletins:(id)a3;
- (void)notifySpeechDetectedIsUndirected;
- (void)openApplicationWithBundleID:(id)a3 URL:(id)a4 completion:(id)a5;
- (void)openURL:(id)a3 completion:(id)a4;
- (void)pauseRecognition;
- (void)postTestResultCandidateWithRcId:(id)a3 recognitionSausage:(id)a4;
- (void)postTestResultSelectedWithRcId:(id)a3;
- (void)preheatServicesForDomain:(id)a3;
- (void)preheatWithRecordDeviceIdentifier:(id)a3;
- (void)preheatWithStyle:(int64_t)a3 forOptions:(id)a4 completion:(id)a5;
- (void)prepareForPhoneCall;
- (void)prepareForShutdown;
- (void)prepareForStartPlaybackWithDestination:(int64_t)a3 intent:(id)a4 completion:(id)a5;
- (void)pushMyriadAdvertisementContext:(id)a3 completionHandler:(id)a4;
- (void)pushSCDAAdvertisementContext:(id)a3 completionHandler:(id)a4;
- (void)refreshAssistantValidation;
- (void)releaseShutdownAssertion:(id)a3;
- (void)reloadServiceForNotification:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)removeService:(id)a3;
- (void)requestBarrier:(id)a3;
- (void)requestBarrierIfNecessary:(id)a3;
- (void)rescheduleValidationRefresh;
- (void)resumeInterruptedAudioPlaybackIfNeeded;
- (void)resumeRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5;
- (void)rollbackClearContext;
- (void)rollbackRequestForDelegate:(id)a3;
- (void)runBootTimeServiceMaintenanceWithCompletion:(id)a3;
- (void)runServiceMaintenanceWithCompletion:(id)a3;
- (void)sanityCheckAutodownloadedAssetsForced:(BOOL)a3;
- (void)selectResultWithResultCandidate:(id)a3 completionHandler:(id)a4;
- (void)sendEngagementFeedback:(int64_t)a3 voiceQueryIdentifier:(id)a4;
- (void)sendGizmoData;
- (void)sendMetricsToServerWithTimeout:(double)a3 requiresUnlimitedPower:(BOOL)a4 requiresActiveSession:(BOOL)a5 purgesOversizedStorage:(BOOL)a6 ignoresMetricsSenderDisabledSetting:(BOOL)a7 scheduledActivity:(BOOL)a8 completion:(id)a9;
- (void)sendMultiUserInfoToMUX;
- (void)sendPowerLogs:(id)a3 peerInfo:(id)a4;
- (void)sendSpeechCorrectionInfo:(id)a3 forCorrectionContext:(id)a4;
- (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4;
- (void)setActiveAccountIdentifier:(id)a3;
- (void)setAlertContextDirty;
- (void)setApplicationContext:(id)a3;
- (void)setApplicationContextForApplicationInfos:(id)a3 withRefId:(id)a4;
- (void)setAssistantEnabled:(BOOL)a3;
- (void)setCarDNDActive:(BOOL)a3;
- (void)setConfiguration:(id)a3 forClient:(id)a4;
- (void)setDictationEnabled:(BOOL)a3;
- (void)setHeadphonesAuthenticated:(BOOL)a3;
- (void)setLanguageCode:(id)a3 outputVoice:(id)a4 withCompletion:(id)a5;
- (void)setLanguageCode:(id)a3 withCompletion:(id)a4;
- (void)setLanguageCodeIfNeeded;
- (void)setLockState:(BOOL)a3 showingLockScreen:(BOOL)a4;
- (void)setManagedStoreObject:(id)a3 forKey:(id)a4;
- (void)setModesConfiguration:(id)a3;
- (void)setOutputVoice:(id)a3;
- (void)setOutputVoice:(id)a3 withCompletion:(id)a4;
- (void)setOverriddenApplicationContext:(id)a3 withContext:(id)a4;
- (void)setQueuedLanguageCode:(id)a3;
- (void)setQueuedLanguageCode:(id)a3 andQueuedOutputVoice:(id)a4;
- (void)setQueuedOutputVoice:(id)a3;
- (void)setSiriOutputVolume:(float)a3 forAudioRoute:(id)a4 operationType:(int64_t)a5 completion:(id)a6;
- (void)setSuppressAudioInterruptionEndedNotifications:(BOOL)a3;
- (void)setSyncDelegate:(id)a3;
- (void)setSyncVerificationNeededAndFullReportNeeded:(BOOL)a3 shouldPostNotification:(BOOL)a4;
- (void)setWatchAuthenticated:(BOOL)a3;
- (void)set_clientBoundCommandLookup:(id)a3;
- (void)set_serverBoundCommandLookup:(id)a3;
- (void)set_uiBridgeServiceListener:(id)a3;
- (void)sharedDataConnection:(id)a3 didUpdateSharedData:(id)a4;
- (void)showingVisibleAssistantUIForReason:(id)a3 completion:(id)a4;
- (void)shutdownSessionIfIdle;
- (void)speechManager:(id)a3 audioSessionDidBecomeActive:(BOOL)a4;
- (void)speechManager:(id)a3 audioSessionWillBecomeActive:(BOOL)a4;
- (void)speechManager:(id)a3 capturedFingerprint:(id)a4 duration:(double)a5;
- (void)speechManager:(id)a3 capturedPackets:(id)a4 atTimestamp:(double)a5 totalCount:(int64_t)a6 context:(id)a7;
- (void)speechManager:(id)a3 didBeginLocalRecognitionWithContext:(id)a4 sessionUUID:(id)a5;
- (void)speechManager:(id)a3 didCancelWithContext:(id)a4;
- (void)speechManager:(id)a3 didChangeRecordingState:(BOOL)a4;
- (void)speechManager:(id)a3 didDetectEndpointAtTime:(double)a4 context:(id)a5;
- (void)speechManager:(id)a3 didDetectLanguage:(id)a4 confidenceScores:(id)a5 isConfident:(BOOL)a6;
- (void)speechManager:(id)a3 didDetectStartpointAtTime:(double)a4 context:(id)a5;
- (void)speechManager:(id)a3 didFailWithError:(id)a4 context:(id)a5;
- (void)speechManager:(id)a3 didFinishWithCapturingMode:(int64_t)a4 context:(id)a5;
- (void)speechManager:(id)a3 didFinishWritingAudioFile:(id)a4 error:(id)a5 context:(id)a6;
- (void)speechManager:(id)a3 didProduceLocalLoggablePackage:(id)a4 sessionUUID:(id)a5;
- (void)speechManager:(id)a3 didReceiveConfidenceScores:(id)a4 classification:(unint64_t)a5 classifiedUser:(id)a6 unknownUserScore:(int64_t)a7 duration:(int64_t)a8 version:(int64_t)a9 thresholdingType:(id)a10 assetVersion:(id)a11;
- (void)speechManager:(id)a3 didReceiveLastAudioBufferWithEndpointMode:(int64_t)a4 totalPacketCount:(int64_t)a5 endpointerMetrics:(id)a6 context:(id)a7;
- (void)speechManager:(id)a3 didRecognizePackage:(id)a4 sessionUUID:(id)a5;
- (void)speechManager:(id)a3 didRecognizeRawEagerRecognitionCandidate:(id)a4 sessionUUID:(id)a5;
- (void)speechManager:(id)a3 didRecognizeTokens:(id)a4 sessionUUID:(id)a5;
- (void)speechManager:(id)a3 didRequestQuickStopWithContext:(id)a4;
- (void)speechManager:(id)a3 didStartRecordingWithInfo:(id)a4 context:(id)a5;
- (void)speechManager:(id)a3 didUpdateRecordingWithInfo:(id)a4 context:(id)a5;
- (void)speechManager:(id)a3 languageDetectorDidFail:(id)a4;
- (void)speechManager:(id)a3 performTwoShotPromptWithType:(int64_t)a4 context:(id)a5 completion:(id)a6;
- (void)speechManager:(id)a3 preheatWithRecordingInfo:(id)a4 context:(id)a5;
- (void)speechManager:(id)a3 recognitionDidCompleteWithError:(id)a4 secureOfflineOnlyRecognition:(BOOL)a5 sessionUUID:(id)a6 statistics:(id)a7;
- (void)speechManager:(id)a3 recognitionUpdateWillBeginForTask:(id)a4;
- (void)speechManager:(id)a3 willStartRecordingAtTimestamp:(double)a4 isFromFile:(BOOL)a5 inputAudioPowerWrapper:(id)a6 context:(id)a7;
- (void)speechManager:(id)a3 willStopRecordingWithSignpostID:(unint64_t)a4;
- (void)speechManagerDidDelayEndpointForMusic:(id)a3;
- (void)speechManagerDidDetectMusic:(id)a3;
- (void)startAcousticIDRequestWithDelegate:(id)a3 withOptions:(id)a4 context:(id)a5;
- (void)startCloudKitSyncWeeklyForActivity:(id)a3;
- (void)startDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 sessionUUID:(id)a6 delegate:(id)a7;
- (void)startDictationWithURL:(id)a3 isNarrowBand:(BOOL)a4 language:(id)a5 options:(id)a6 sessionUUID:(id)a7 delegate:(id)a8;
- (void)startObservingCallState;
- (void)startRecordedDictationWithLanguage:(id)a3 options:(id)a4 sessionUUID:(id)a5 narrowband:(BOOL)a6 delegate:(id)a7;
- (void)startRecordingForPendingDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 sessionUUID:(id)a6 delegate:(id)a7 completion:(id)a8;
- (void)startRecordingForPendingSpeechRequestForDelegate:(id)a3 withOptions:(id)a4 sessionUUID:(id)a5 completion:(id)a6;
- (void)startRemoteRequest:(id)a3 completion:(id)a4;
- (void)startRemoteRequest:(id)a3 onTargetDevice:(id)a4 completion:(id)a5;
- (void)startRequest:(id)a3 withDelegate:(id)a4;
- (void)startSpeechPronunciationRequestWithDelegate:(id)a3 withOptions:(id)a4 pronunciationContext:(id)a5;
- (void)startSpeechRequestWithDelegate:(id)a3 withOptions:(id)a4;
- (void)startSpeechRequestWithURL:(id)a3 isNarrowBand:(BOOL)a4 withDelegate:(id)a5;
- (void)stopSpeechWithOptions:(id)a3 forDelegate:(id)a4;
- (void)suppressLowStorageNotificationForLanguage:(id)a3 suppress:(BOOL)a4;
- (void)syncAnchorKeys:(id)a3 forceReset:(BOOL)a4 reasons:(id)a5;
- (void)syncManager:(id)a3 chunkForSyncInfo:(id)a4 chunkInfo:(id)a5;
- (void)syncManager:(id)a3 finishedSyncForKeys:(id)a4 postNotification:(BOOL)a5;
- (void)syncManager:(id)a3 finishedSyncForSyncKey:(id)a4 generation:(id)a5;
- (void)syncManagerDidResetInProgressSync:(id)a3;
- (void)taskmaster:(id)a3 didLaunchApplicationForRequestWithId:(id)a4;
- (void)taskmaster:(id)a3 didReceivePunchoutOutcome:(id)a4;
- (void)telephonyRequestCompleted;
- (void)trimRecordedAudioWithIdentifier:(id)a3 offset:(double)a4 duration:(double)a5 outputFileType:(int64_t)a6 completion:(id)a7;
- (void)updateSharedDataFromCloudPeers:(id)a3 completion:(id)a4;
- (void)updateSharedDataFromCompanion;
- (void)updateSharedDataFromPeerUseCache:(BOOL)a3 allowCloudMessaging:(BOOL)a4 completion:(id)a5;
- (void)updateSharedDataFromPeerUseCache:(BOOL)a3 completion:(id)a4;
- (void)updateSharedDataWithCloudData:(id)a3 fromPeer:(id)a4;
- (void)updateSpeechOptions:(id)a3 forDelegate:(id)a4;
- (void)updateSpeechSynthesisRecord:(id)a3;
- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10;
- (void)willProcessAppLaunchWithBundleIdentifier:(id)a3;
- (void)willSetApplicationContextWithRefId:(id)a3;
- (void)withContextManager:(id)a3;
@end

@implementation ADCommandCenter

- (void)sendPowerLogs:(id)a3 peerInfo:(id)a4
{
  v5 = (__CFString *)a3;
  id v6 = a4;
  if (v6 && AFHasPerfPowerEntitlement())
  {
    if (qword_100585700 != -1) {
      dispatch_once(&qword_100585700, &stru_1004FF178);
    }
    v7 = +[ADCompanionService sharedInstance];
    v8 = [ADPeerInfo alloc];
    v9 = [v6 afPeerInfo];
    v10 = [(ADPeerInfo *)v8 initWithAFPeerInfo:v9];
    v11 = [v7 discoveryTypeForPeer:v10];

    if (v5) {
      CFStringRef v12 = v5;
    }
    else {
      CFStringRef v12 = @"unknown";
    }
    v23[0] = @"requestType";
    v23[1] = @"linkDiscoveryType";
    if (v11) {
      CFStringRef v13 = v11;
    }
    else {
      CFStringRef v13 = @"unknown";
    }
    v24[0] = v12;
    v24[1] = v13;
    v23[2] = @"sourceDeviceType";
    uint64_t v14 = [v6 productType];
    v15 = (void *)v14;
    if (v14) {
      CFStringRef v16 = (const __CFString *)v14;
    }
    else {
      CFStringRef v16 = @"unknown";
    }
    v24[2] = v16;
    v17 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];

    v18 = AFSiriLogContextPower;
    if (os_log_type_enabled(AFSiriLogContextPower, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315394;
      v20 = "-[ADCommandCenter(Instrumentation) sendPowerLogs:peerInfo:]";
      __int16 v21 = 2112;
      v22 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Sending PerfPower Telemetry for %@", (uint8_t *)&v19, 0x16u);
    }
    PPSSendTelemetry();
  }
}

- (BOOL)isStereoPairLeader
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.airplay"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"tightSyncIsGroupLeader"];

  return v3;
}

- (int)getHomeDevicesAudioTopology
{
  if (!AFIsHorseman()) {
    return 0;
  }
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.airplay"];
  unsigned __int8 v3 = [v2 objectForKey:@"persistentGroupUUID"];
  v4 = [v2 objectForKey:@"tightSyncGroupUUID"];
  if (v3) {
    int v5 = 4;
  }
  else {
    int v5 = 2;
  }
  if (v3) {
    int v6 = 3;
  }
  else {
    int v6 = 1;
  }
  if (v4) {
    int v7 = v5;
  }
  else {
    int v7 = v6;
  }

  return v7;
}

- (void)_emitAudioTopologyForRequestId:(id)a3
{
  id v4 = a3;
  id v15 = objc_alloc_init((Class)HomeKitSchemaHKClientEvent);
  id v5 = objc_alloc_init((Class)HomeKitSchemaHomeKitEventMetadata);
  int v6 = +[NSUUID UUID];
  id v7 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:v6];
  [v5 setHkId:v7];

  [v15 setEventMetadata:v5];
  id v8 = objc_alloc_init((Class)HomeKitSchemaHKAudioTopologyReported);
  [v8 setHasAudioTopology:1];
  uint64_t v9 = [(ADCommandCenter *)self getHomeDevicesAudioTopology];
  [v8 setAudioTopology:v9];
  if (v9 == 4 || v9 == 2) {
    objc_msgSend(v8, "setHasIsLeader:", -[ADCommandCenter isStereoPairLeader](self, "isStereoPairLeader"));
  }
  [v15 setAudioTopologyReported:v8];
  v10 = +[AssistantSiriAnalytics sharedStream];
  [v10 emitMessage:v15];

  v11 = [v4 UUIDString];

  CFStringRef v12 = ADCreateRequestLinkInfo();

  CFStringRef v13 = [v6 UUIDString];
  uint64_t v14 = ADCreateRequestLinkInfo();

  ADEmitRequestLinkEventMessage();
}

- (void)_logAudioTopologyForRequestId:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  int v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);

  id v7 = dispatch_queue_create("ADInstrumentationQueue", v6);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004D9B4;
  v9[3] = &unk_10050E160;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (void)_logExecuteOnRemoteRequestForRequestId:(id)a3 turnId:(id)a4 event:(int64_t)a5
{
  id v18 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)ORCHSchemaORCHClientEvent);
  id v9 = objc_alloc_init((Class)ORCHSchemaORCHClientEventMetadata);
  id v10 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:v18];
  [v9 setRequestId:v10];

  [v8 setEventMetadata:v9];
  id v11 = objc_alloc_init((Class)ORCHSchemaORCHExecuteOnRemoteRequestContext);
  if (a5 == 2)
  {
    id v12 = objc_alloc_init((Class)ORCHSchemaORCHExecuteOnRemoteRequestFailed);
    [v11 setFailed:v12];
    [v11 setHasFailed:1];
  }
  else if (a5 == 1)
  {
    id v12 = objc_alloc_init((Class)ORCHSchemaORCHExecuteOnRemoteRequestEnded);
    [v11 setEnded:v12];
    [v11 setHasEnded:1];
  }
  else
  {
    if (a5) {
      goto LABEL_8;
    }
    id v12 = objc_alloc_init((Class)ORCHSchemaORCHExecuteOnRemoteRequestStarted);
    [v11 setStartedOrChanged:v12];
    [v11 setHasStartedOrChanged:1];
  }

LABEL_8:
  [v8 setExecuteOnRemoteRequestContext:v11];
  CFStringRef v13 = +[AssistantSiriAnalytics sharedStream];
  [v13 emitMessage:v8];

  uint64_t v14 = [v7 UUIDString];

  id v15 = ADCreateRequestLinkInfo();

  CFStringRef v16 = [v18 UUIDString];
  v17 = ADCreateRequestLinkInfo();

  ADEmitRequestLinkEventMessage();
}

- (BOOL)_syncController_hasCommandForRefId:(id)a3
{
  return 0;
}

- (void)_sync_setSyncDelegate:(id)a3
{
}

- (void)_sync_setSyncVerificationNeededAndFullReportNeeded:(BOOL)a3 shouldPostNotification:(BOOL)a4
{
  self->_shouldPostSyncVerifyFinishedNotification = a4;
  self->_needVerificationFullReport = a3;
  id v5 = objc_alloc_init((Class)SASyncClientVerify);
  [v5 setAceId:@"ClientSideInitiatedSyncVerification"];
  [(ADCommandCenter *)self _saSyncClientVerify:v5 completion:0];
}

- (void)_sync_syncAnchorKeys:(id)a3 forceReset:(BOOL)a4 reasons:(id)a5 forSyncPromise:(id)a6
{
  id v10 = a3;
  id v53 = a5;
  id obj = a6;
  id v54 = a6;
  v52 = v10;
  if (sub_1001FC284())
  {
    *(void *)v83 = 0;
    *(void *)&v83[8] = v83;
    *(void *)&v83[16] = 0x3032000000;
    v84 = sub_100052954;
    v85 = sub_100052964;
    id v86 = [v10 mutableCopy];
    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x2020000000;
    char v74 = 0;
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_10005296C;
    v66[3] = &unk_1004FF418;
    v68 = v83;
    v69 = &v71;
    v66[4] = self;
    BOOL v70 = a4;
    id v11 = v53;
    id v67 = v11;
    v51 = objc_retainBlock(v66);
    id v12 = [(ADCommandCenter *)self _syncManager];
    if ([*(id *)(*(void *)&v83[8] + 40) count])
    {
      id v13 = objc_alloc((Class)NSMutableArray);
      id v14 = objc_msgSend(v13, "initWithCapacity:", objc_msgSend(*(id *)(*(void *)&v83[8] + 40), "count"));
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v15 = *(id *)(*(void *)&v83[8] + 40);
      id v16 = [v15 countByEnumeratingWithState:&v58 objects:v81 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v59;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v59 != v17) {
              objc_enumerationMutation(v15);
            }
            uint64_t v19 = *(void *)(*((void *)&v58 + 1) + 8 * i);
            v20 = [(ADCommandCenter *)self _serviceManager];
            __int16 v21 = [v20 serviceForSyncAnchorKey:v19];
            BOOL v22 = v21 == 0;

            if (v22)
            {
              v23 = AFSiriLogContextSync;
              if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v78 = "-[ADCommandCenter(Sync) _sync_syncAnchorKeys:forceReset:reasons:forSyncPromise:]";
                __int16 v79 = 2112;
                uint64_t v80 = v19;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s Not syncing %@ because there's no sync plugin for it", buf, 0x16u);
              }
              uint64_t v76 = v19;
              v24 = +[NSArray arrayWithObjects:&v76 count:1];
              sub_1002E7490(v24);
            }
            else
            {
              [v14 addObject:v19];
            }
          }
          id v16 = [v15 countByEnumeratingWithState:&v58 objects:v81 count:16];
        }
        while (v16);
      }

      objc_storeStrong((id *)(*(void *)&v83[8] + 40), v14);
      if (v54)
      {
        objc_storeStrong((id *)&self->_outstandingSyncPromiseID, obj);
        id v25 = objc_alloc((Class)NSMutableSet);
        v26 = (NSMutableSet *)[v25 initWithArray:*(void *)(*(void *)&v83[8] + 40)];
        outstandingSyncPromiseKeys = self->_outstandingSyncPromiseKeys;
        self->_outstandingSyncPromiseKeys = v26;

        self->_needsToSendSyncFinished = 1;
      }
    }
    else
    {
      id v14 = objc_alloc_init((Class)NSMutableSet);
      long long v64 = 0u;
      long long v65 = 0u;
      long long v63 = 0u;
      long long v62 = 0u;
      id v31 = v11;
      id v32 = [v31 countByEnumeratingWithState:&v62 objects:v82 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v63;
        do
        {
          for (j = 0; j != v32; j = (char *)j + 1)
          {
            if (*(void *)v63 != v33) {
              objc_enumerationMutation(v31);
            }
            uint64_t v35 = *(void *)(*((void *)&v62 + 1) + 8 * (void)j);
            v36 = [v12 syncKeysForReason:v35];
            [v14 addObjectsFromArray:v36];
            v37 = v72;
            if (*((unsigned char *)v72 + 24))
            {
              unsigned __int8 v38 = 1;
            }
            else
            {
              unsigned __int8 v38 = [v12 shouldIncludeAllKnownSiriKitAnchorsForReason:v35];
              v37 = v72;
            }
            *((unsigned char *)v37 + 24) = v38;
            if ([v12 shouldSyncEverythingForReason:v35]) {
              sub_1002E70B8(v36);
            }
          }
          id v32 = [v31 countByEnumeratingWithState:&v62 objects:v82 count:16];
        }
        while (v32);
      }

      v39 = [v14 allObjects];
      id v40 = [v39 mutableCopy];
      v41 = *(void **)(*(void *)&v83[8] + 40);
      *(void *)(*(void *)&v83[8] + 40) = v40;
    }
    v42 = [(ADCommandCenter *)self _serviceManager];
    unsigned int v43 = [v12 shouldSyncThirdPartyUserVocabularyForSyncKeys:*(void *)(*(void *)&v83[8] + 40)];
    unsigned int v44 = [v12 shouldSyncIntentPolicyForSyncKeys:*(void *)(*(void *)&v83[8] + 40)];
    char v45 = v44;
    if (v43)
    {
      v46 = [v42 allVocabSyncInfo];
      if (![v46 count])
      {
        CFStringRef v75 = @"com.apple.siri.vocabularyupdates";
        v47 = +[NSArray arrayWithObjects:&v75 count:1];
        sub_1002E7490(v47);

        if (v54) {
          [(NSMutableSet *)self->_outstandingSyncPromiseKeys removeObject:@"com.apple.siri.vocabularyupdates"];
        }
      }
      if ((v45 & 1) == 0)
      {
        v48 = [(ADCommandCenter *)self _appMetaDataListFromVocabSources:v46 appIdentifyingInfoList:0];
        id v49 = [v48 mutableCopy];
        ((void (*)(void *, id, void))v51[2])(v51, v49, 0);

LABEL_42:
LABEL_44:

        _Block_object_dispose(&v71, 8);
        _Block_object_dispose(v83, 8);

        goto LABEL_45;
      }
    }
    else
    {
      if (!v44)
      {
        ((void (*)(void *, void, void))v51[2])(v51, 0, 0);
        goto LABEL_44;
      }
      v46 = 0;
    }
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_100052AD0;
    v55[3] = &unk_1004FF440;
    v55[4] = self;
    id v56 = v54;
    v57 = v51;
    [(ADCommandCenter *)self _fetchAllAppSourcesForSyncingWithCustomVocabInfo:v46 completion:v55];

    goto LABEL_42;
  }
  v28 = AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v83 = 136315394;
    *(void *)&v83[4] = "-[ADCommandCenter(Sync) _sync_syncAnchorKeys:forceReset:reasons:forSyncPromise:]";
    *(_WORD *)&v83[12] = 2112;
    *(void *)&v83[14] = v10;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%s Sync not allowed - posting sync finished notification for %@", v83, 0x16u);
  }
  v29 = +[NSNotification notificationWithName:@"ADSyncFinishedNotification" object:v10];
  v30 = +[NSNotificationCenter defaultCenter];
  [v30 postNotification:v29];

LABEL_45:
}

- (BOOL)_sync_hasCommandForRefId:(id)a3
{
  id v4 = a3;
  if ([(ADCommandCenter *)self _hasOutstandingSyncChunkId:v4]) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = [(ADCommandCenter *)self _hasOutstandingAnchorsRequestId:v4];
  }

  return v5;
}

- (void)_sync_assistantLoadedSyncRequest:(BOOL)a3
{
  BOOL v3 = a3;
  if (sub_1001FC284())
  {
    BOOL v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315394;
      id v11 = "-[ADCommandCenter(Sync) _sync_assistantLoadedSyncRequest:]";
      __int16 v12 = 1024;
      BOOL v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v10, 0x12u);
    }
    int v6 = [(ADCommandCenter *)self _syncManager];
    if (([v6 isSyncing] & 1) == 0)
    {
      id v7 = [(ADCommandCenter *)self _sessionManager];
      [v7 beginUpdatingAssistantData];
    }
    if (v3)
    {
      id v8 = [(ADCommandCenter *)self _syncManager];
      id v9 = [v8 syncKeysForReason:@"requested_by_server"];
      sub_1002E70B8(v9);
    }
  }
}

- (void)_sync_commandIgnored:(id)a3
{
  id v4 = [a3 refId];
  [(ADCommandCenter *)self _cleanUpForFailureCommandWithRefId:v4];
}

- (void)_sync_commandFailed:(id)a3
{
  id v4 = [a3 refId];
  [(ADCommandCenter *)self _cleanUpForFailureCommandWithRefId:v4];
}

- (void)_cleanUpForFailureCommandWithRefId:(id)a3
{
  id v4 = a3;
  [(ADCommandCenter *)self _removeOutstandingAnchorsRequestId:v4];
  [(ADCommandCenter *)self _removeOutstandingSyncChunkId:v4];

  [(ADCommandCenter *)self _sync_continueIfConditionsMet];
}

- (void)_sync_syncIfNeeded
{
  BOOL v3 = AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[ADCommandCenter(Sync) _sync_syncIfNeeded]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v4 = [(ADCommandCenter *)self _syncManager];
  BOOL v5 = [v4 getAnchorsRequest];

  if (!v5)
  {
    if ([v4 isSyncing])
    {
      [(ADCommandCenter *)self _sync_continueIfConditionsMet];
    }
    else
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1000530C4;
      v6[3] = &unk_10050E2A0;
      v6[4] = self;
      sub_1002E6D88(v6);
    }
  }
}

- (void)_sync_continueVerificationIfConditionsMet
{
  if (sub_1001FC284())
  {
    id v3 = [(ADCommandCenter *)self _syncManager];
    if (![(ADCommandCenter *)self _sync_isRequestBlockingSyncVerification]
      && ![(ADCommandCenter *)self _isInCall]
      && [v3 isSyncing])
    {
      [v3 continueSync];
    }
  }
}

- (void)_sync_continueIfConditionsMet
{
  if (sub_1001FC284())
  {
    id v3 = [(ADCommandCenter *)self _syncManager];
    if ((![(ADCommandCenter *)self _sync_isRequestBlockingSync]
       || [(NSMutableSet *)self->_outstandingSyncPromiseKeys count])
      && ![(ADCommandCenter *)self _syncChunkWindowFull]
      && ![(ADCommandCenter *)self _isInCall]
      && [v3 isSyncing])
    {
      [v3 continueSync];
    }
  }
}

- (BOOL)_sync_isRequestBlockingSyncVerification
{
  if ([(ADCommandCenter *)self _sync_isRequestBlockingSync]) {
    return 1;
  }
  id v4 = [(ADCommandCenter *)self _currentClient];
  if (v4)
  {
    BOOL v3 = 1;
  }
  else
  {
    BOOL v5 = [(ADCommandCenter *)self _speechDelegate];
    BOOL v3 = v5 != 0;
  }
  return v3;
}

- (BOOL)_sync_isRequestBlockingSync
{
  id v2 = [(ADCommandCenter *)self _currentRequest];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_sync_isSyncing
{
  return [(ADSyncManager *)self->_syncManager isSyncing];
}

- (void)_sync_reset
{
  [(ADSyncManager *)self->_syncManager reset];
  [(NSMutableSet *)self->_outstandingSyncChunks removeAllObjects];
  [(ADCommandCenter *)self _resetSyncVerification];
}

- (void)syncManager:(id)a3 finishedSyncForSyncKey:(id)a4 generation:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (AFIsMultiUserCompanion())
  {
    id v9 = +[AFPreferences sharedPreferences];
    unsigned __int8 v10 = [v9 deviceHasAtvOrHomepodInHome];

    if (v10)
    {
      v29[0] = @"com.apple.contact.people";
      v29[1] = @"com.apple.siri.applications";
      *(void *)id v25 = SASyncSyncTypeContactsValue;
      *(void *)&v25[8] = SASyncSyncTypeAppInfoValue;
      v29[2] = @"com.apple.siri.vocabularyupdates";
      *(void *)&v25[16] = SASyncSyncTypeAppCustomVocabValue;
      id v11 = v7;
      __int16 v12 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v29 count:3];
      BOOL v13 = objc_msgSend(v12, "objectForKeyedSubscript:", v11, *(void *)v25, *(void *)&v25[8], *(void *)&v25[16]);

      if (v13)
      {
        v27[0] = @"syncGeneration";
        id v14 = v8;
        if (!v8)
        {
          __int16 v12 = +[NSUUID UUID];
          id v14 = [v12 UUIDString];
        }
        v27[1] = @"syncTimestamp";
        v28[0] = v14;
        id v15 = +[NSDate date];
        [v15 timeIntervalSince1970];
        id v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        v28[1] = v16;
        uint64_t v17 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];

        if (!v8)
        {
        }
        id v18 = [(ADCommandCenter *)self _syncMetadata];
        [v18 setObject:v17 forKey:v13];
        uint64_t v19 = AFSiriLogContextSync;
        if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)id v25 = 136315650;
          *(void *)&v25[4] = "-[ADCommandCenter(Sync) syncManager:finishedSyncForSyncKey:generation:]";
          *(_WORD *)&v25[12] = 2112;
          *(void *)&v25[14] = v13;
          *(_WORD *)&v25[22] = 2112;
          v26 = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s %@, setting syncMetadata: %@", v25, 0x20u);
        }
        v20 = +[ADPreferences sharedPreferences];
        id v21 = [v18 copy];
        [v20 setSyncMetadata:v21];

        BOOL v22 = +[NSNotification notificationWithName:@"ADSyncMetadataUpdatedNotification" object:v13];
        v23 = +[NSNotificationCenter defaultCenter];
        [v23 postNotification:v22];
      }
    }
    else
    {
      v24 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id v25 = 136315138;
        *(void *)&v25[4] = "-[ADCommandCenter(Sync) syncManager:finishedSyncForSyncKey:generation:]";
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s Skipping manatee update of sync metadata because device has no ATV or Homepod in Home", v25, 0xCu);
      }
    }
  }
}

- (void)syncManagerDidResetInProgressSync:(id)a3
{
  id v4 = [(ADCommandCenter *)self _currentClient];

  if (!v4) {
    [(ADCommandCenter *)self _resetServices];
  }
  BOOL v5 = +[SiriCoreSyncDatabase currentSyncDatabase];
  id v9 = 0;
  unsigned __int8 v6 = [v5 rollbackTransactionWithError:&v9];
  id v7 = v9;

  if ((v6 & 1) == 0)
  {
    id v8 = AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v11 = "-[ADCommandCenter(Sync) syncManagerDidResetInProgressSync:]";
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Could not rollback database after sync manager reset err: %@", buf, 0x16u);
    }
  }
}

- (void)syncManager:(id)a3 finishedSyncForKeys:(id)a4 postNotification:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([v8 isVerifying])
  {
    [(ADCommandCenter *)self _finishVerificationWithKeys:v9];
  }
  else
  {
    if (v5)
    {
      unsigned __int8 v10 = +[NSNotificationCenter defaultCenter];
      id v11 = +[NSNotification notificationWithName:@"ADSyncFinishedNotification" object:v9];
      [v10 postNotification:v11];
    }
    sub_1001FD584(@"sync_flag");
    __int16 v12 = [v8 queuedAnchors];
    id v13 = [v8 queuedReasons];
    id v14 = [(ADCommandCenter *)self _syncManager];
    unsigned __int8 v15 = [v14 isSyncing];

    if ((v15 & 1) == 0)
    {
      id v16 = [objc_alloc((Class)NSSet) initWithArray:v9];
      id v17 = [(NSMutableSet *)self->_outstandingSyncPromiseKeys isSubsetOfSet:v16];
      if ([v12 count])
      {
        [v8 clearQueuedAnchorsAndReasons];
        [v8 setGetAnchorsRequest:0];
        id v18 = [v13 allObjects];
        [v8 prepareSyncWithAnchors:v12 forReasons:v18 delegate:self];

        if (v17) {
          [(ADCommandCenter *)self _sendSyncFinishedAndReferenceCurrentSyncPromise:1];
        }
      }
      else
      {
        if (self->_needsToSendSyncFinished) {
          BOOL v19 = 1;
        }
        else {
          BOOL v19 = (int)v17;
        }
        self->_needsToSendSyncFinished = v19;
        if (v19)
        {
          self->_needsToSendSyncFinished = 0;
          [(ADCommandCenter *)self _sendSyncFinishedAndReferenceCurrentSyncPromise:v17];
          v20 = [(ADCommandCenter *)self _currentRequest];

          if (!v20)
          {
            id v21 = [(ADCommandCenter *)self _sessionManager];
            [v21 setHasActiveRequest:0];
          }
        }
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_100053BCC;
        v31[3] = &unk_100504A70;
        v31[4] = self;
        id v32 = v9;
        id v33 = v8;
        sub_1002E6D88(v31);
      }
      [(NSMutableSet *)self->_outstandingSyncPromiseKeys minusSet:v16];
      BOOL v22 = +[AFPreferences sharedPreferences];
      unsigned int v23 = [v22 databaseSyncEnabled];

      if (v23)
      {
        v24 = +[SiriCoreSyncDatabase currentSyncDatabase];
        unsigned int v25 = [v24 inTransaction];

        if (v25)
        {
          v26 = +[SiriCoreSyncDatabase currentSyncDatabase];
          id v30 = 0;
          unsigned __int8 v27 = [v26 commitTransactionWithError:&v30];
          id v28 = v30;

          if ((v27 & 1) == 0)
          {
            v29 = AFSiriLogContextSync;
            if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              uint64_t v35 = "-[ADCommandCenter(Sync) syncManager:finishedSyncForKeys:postNotification:]";
              __int16 v36 = 2112;
              id v37 = v28;
              _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s Could not commit to sync database for sync chunk  err: %@", buf, 0x16u);
            }
          }
        }
      }
    }
  }
}

- (id)_syncRecordForKey:(id)a3 fromDomainObject:(id)a4 appMeta:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  unsigned __int8 v10 = [v7 identifier];
  id v11 = [v10 absoluteString];
  __int16 v12 = +[SiriCoreSyncRecord syncRecordWithKey:v9 identifier:v11 priority:0 debugValue:0 dataValue:0 addedValue:0 appMeta:0];

  id v13 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v13 encodeObject:v7];
  [v13 finishEncoding];
  id v14 = [v13 encodedData];
  [v12 setDataValue:v14];

  if (v8)
  {
    id v15 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [v15 encodeObject:v8];
    [v15 finishEncoding];
    id v16 = [v15 encodedData];
    [v12 setMetaValue:v16];
  }
  id v17 = [v8 fullDescription];
  id v18 = [v7 fullDescription];
  BOOL v19 = +[NSString stringWithFormat:@"META:%@\nDATA:%@", v17, v18];
  [v12 setDebugValue:v19];

  return v12;
}

- (void)syncManager:(id)a3 chunkForSyncInfo:(id)a4 chunkInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[ADDaemon sharedDaemon];
  [v11 keepAlive];

  if ([v8 isVerifying])
  {
    verificationHelper = self->_verificationHelper;
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472;
    v77[2] = sub_1000547A8;
    v77[3] = &unk_1004FF3F0;
    v77[4] = self;
    [(ADSyncVerificationHelper *)verificationHelper handleSyncChunkInfo:v10 withSyncInfo:v9 completion:v77];
    [(ADCommandCenter *)self _sync_continueVerificationIfConditionsMet];
    goto LABEL_41;
  }
  id v59 = v8;
  self->_needsToSendSyncFinished = 1;
  id v13 = objc_alloc_init((Class)SASyncChunk);
  id v14 = SiriCoreUUIDStringCreate();
  [v13 setAceId:v14];

  id v15 = [v9 key];
  [v13 setKey:v15];

  id v16 = [v9 appMetadata];
  [v13 setAppMetaData:v16];

  id v17 = [v10 pre];
  [v13 setPreGen:v17];

  id v18 = [v10 post];
  [v13 setPostGen:v18];

  BOOL v19 = [v10 validity];
  [v13 setValidity:v19];

  id v21 = [v10 toAdd];
  BOOL v22 = [v10 toRemove];
  long long v64 = v13;
  if (!v21)
  {
    [v13 setToAdd:0];
    if (v22) {
      goto LABEL_5;
    }
LABEL_7:
    unsigned int v25 = v13;
    [v13 setToRemove:0];
    goto LABEL_8;
  }
  unsigned int v23 = +[AceObject aceObjectArrayWithDictionaryArray:v21 baseClass:objc_opt_class()];
  [v13 setToAdd:v23];

  if (!v22) {
    goto LABEL_7;
  }
LABEL_5:
  v24 = +[AceObject aceObjectArrayWithDictionaryArray:v22 baseClass:objc_opt_class()];
  unsigned int v25 = v13;
  [v13 setToRemove:v24];

LABEL_8:
  v26 = +[ADSyncSnapshot sharedInstance];
  [v26 noteSendingChunk:v25];

  unsigned __int8 v27 = +[AFPreferences sharedPreferences];
  LODWORD(v26) = [v27 databaseSyncEnabled];

  if (v26)
  {
    id v28 = +[SiriCoreSyncDatabase currentSyncDatabase];
    long long v62 = self;
    if ([v28 inTransaction])
    {
      id v29 = 0;
    }
    else
    {
      id v76 = 0;
      unsigned __int8 v30 = [v28 openWithError:&v76];
      id v31 = v76;
      if ((v30 & 1) == 0)
      {
        id v32 = AFSiriLogContextSync;
        if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v80 = "-[ADCommandCenter(Sync) syncManager:chunkForSyncInfo:chunkInfo:]";
          __int16 v81 = 2112;
          id v82 = v31;
          _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%s Could not open sync database for sync chunk processing err: %@", buf, 0x16u);
        }
      }
      id v75 = v31;
      unsigned __int8 v33 = [v28 beginTransactionWithError:&v75];
      id v29 = v75;

      if ((v33 & 1) == 0)
      {
        v34 = AFSiriLogContextSync;
        if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v80 = "-[ADCommandCenter(Sync) syncManager:chunkForSyncInfo:chunkInfo:]";
          __int16 v81 = 2112;
          id v82 = v29;
          _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s Could not begin sync database transaction for sync chunk processing err: %@", buf, 0x16u);
        }
      }
    }
    long long v63 = v9;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    objc_msgSend(v25, "toAdd", v10);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v35 = [obj countByEnumeratingWithState:&v71 objects:v85 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v72;
      do
      {
        for (i = 0; i != v36; i = (char *)i + 1)
        {
          v39 = v29;
          if (*(void *)v72 != v37) {
            objc_enumerationMutation(obj);
          }
          id v40 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          v41 = [v40 identifier];
          v42 = [v25 key];
          unsigned int v43 = [v63 appMetadata];
          unsigned int v44 = [(ADCommandCenter *)v62 _syncRecordForKey:v42 fromDomainObject:v40 appMeta:v43];

          id v70 = v39;
          LOBYTE(v40) = [v28 donate:v44 error:&v70];
          id v29 = v70;

          if ((v40 & 1) == 0)
          {
            char v45 = AFSiriLogContextSync;
            if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              uint64_t v80 = "-[ADCommandCenter(Sync) syncManager:chunkForSyncInfo:chunkInfo:]";
              __int16 v81 = 2112;
              id v82 = v41;
              __int16 v83 = 2112;
              id v84 = v29;
              _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%s Could not add to sync database for sync chunk add %@ err: %@", buf, 0x20u);
            }
          }

          unsigned int v25 = v64;
        }
        id v36 = [obj countByEnumeratingWithState:&v71 objects:v85 count:16];
      }
      while (v36);
    }

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id obja = [v25 toRemove];
    id v46 = [obja countByEnumeratingWithState:&v66 objects:v78 count:16];
    if (v46)
    {
      id v47 = v46;
      uint64_t v48 = *(void *)v67;
      self = v62;
      do
      {
        for (j = 0; j != v47; j = (char *)j + 1)
        {
          v50 = v29;
          if (*(void *)v67 != v48) {
            objc_enumerationMutation(obja);
          }
          v51 = *(void **)(*((void *)&v66 + 1) + 8 * (void)j);
          v52 = [v51 identifier];
          id v53 = [v64 key];
          id v54 = self;
          v55 = [(ADCommandCenter *)self _syncRecordForKey:v53 fromDomainObject:v51 appMeta:0];

          id v65 = v50;
          LOBYTE(v51) = [v28 remove:v55 error:&v65];
          id v29 = v65;

          if ((v51 & 1) == 0)
          {
            id v56 = AFSiriLogContextSync;
            if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              uint64_t v80 = "-[ADCommandCenter(Sync) syncManager:chunkForSyncInfo:chunkInfo:]";
              __int16 v81 = 2112;
              id v82 = v52;
              __int16 v83 = 2112;
              id v84 = v29;
              _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%s Could not add to sync database for sync chunk remove %@ err: %@", buf, 0x20u);
            }
          }

          self = v54;
        }
        id v47 = [obja countByEnumeratingWithState:&v66 objects:v78 count:16];
      }
      while (v47);
    }
    else
    {
      self = v62;
    }

    id v10 = v58;
    id v8 = v59;
    id v9 = v63;
    unsigned int v25 = v64;
  }
  [(ADCommandCenter *)self _sendCommandToServer:v25];
  v57 = [v25 aceId];
  [(ADCommandCenter *)self _addOutstandingSyncChunkId:v57];

LABEL_41:
}

- (void)_finishVerificationWithKeys:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[ADPreferences sharedPreferences];
  unsigned __int8 v6 = +[NSDate date];
  [v5 setLastSyncVerificationDate:v6];

  id v7 = [(ADSyncVerificationHelper *)self->_verificationHelper checksums];
  if ([v7 count])
  {
    id v8 = AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      unsigned __int8 v30 = "-[ADCommandCenter(Sync) _finishVerificationWithKeys:]";
      __int16 v31 = 2112;
      id v32 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Sending checksums for keys: %@", buf, 0x16u);
    }
    id v9 = objc_alloc_init((Class)SASyncClientVerifyResult);
    [v9 setChecksums:v7];
    [(ADCommandCenter *)self _sendCommandToServer:v9];
    outstandingSyncVerificationRequestID = self->_outstandingSyncVerificationRequestID;
    self->_outstandingSyncVerificationRequestID = 0;

    id v11 = [(ADCommandCenter *)self _syncManager];
    [v11 setIsVerifying:0];

    verificationHelper = self->_verificationHelper;
    self->_verificationHelper = 0;

    id v13 = [(ADCommandCenter *)self _currentRequest];

    if (!v13)
    {
      id v14 = [(ADCommandCenter *)self _sessionManager];
      [v14 setHasActiveRequest:0];
    }
    if (self->_shouldPostSyncVerifyFinishedNotification)
    {
      id v15 = objc_alloc_init((Class)NSMutableArray);
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v16 = v7;
      id v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v25;
        do
        {
          v20 = 0;
          do
          {
            if (*(void *)v25 != v19) {
              objc_enumerationMutation(v16);
            }
            id v21 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * (void)v20), "dictionary", (void)v24);
            [v15 addObject:v21];

            v20 = (char *)v20 + 1;
          }
          while (v18 != v20);
          id v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v18);
      }

      BOOL v22 = +[NSNotificationCenter defaultCenter];
      unsigned int v23 = +[NSNotification notificationWithName:@"ADSyncVerificationFinishedNotification" object:v15];
      [v22 postNotification:v23];

      self->_shouldPostSyncVerifyFinishedNotification = 0;
    }
  }
  [(ADCommandCenter *)self _shutdownSessionWhenIdle];
}

- (void)_prepareAndStartSyncVerification
{
  BOOL v3 = AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v31 = "-[ADCommandCenter(Sync) _prepareAndStartSyncVerification]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (self->_needVerificationFullReport)
  {
    id v4 = objc_alloc_init((Class)SASyncServerVerify);
    [v4 setPerformInternalVerification:1];
    [v4 setFetchSyncDebugInfo:1];
    [(ADCommandCenter *)self _sendCommandToServer:v4];
  }
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  unsigned __int8 v6 = [(ADCommandCenter *)self _serviceManager];
  id v7 = [v6 allSyncAnchorKeys];

  id v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        __int16 v12 = [(ADCommandCenter *)self _emptyVerificationSyncAnchorForKey:*(void *)(*((void *)&v25 + 1) + 8 * (void)v11) appBundleID:0 syncSlotName:0];
        [v5 addObject:v12];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  id v13 = [(ADCommandCenter *)self _serviceManager];
  id v14 = [v13 allVocabSyncInfo];
  uint64_t v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  id v21 = sub_100054DB0;
  BOOL v22 = &unk_100500958;
  unsigned int v23 = self;
  id v24 = v5;
  id v15 = v5;
  [v14 enumerateKeysAndObjectsUsingBlock:&v19];

  id v16 = [(ADCommandCenter *)self _syncManager];
  [v16 setIsVerifying:1];
  id v17 = objc_alloc_init(ADSyncVerificationHelper);
  verificationHelper = self->_verificationHelper;
  self->_verificationHelper = v17;

  [v16 prepareSyncWithAnchors:v15 forReasons:&off_100523270 delegate:self];
}

- (id)_emptyVerificationSyncAnchorForKey:(id)a3 appBundleID:(id)a4 syncSlotName:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)SASyncAnchor);
  [v10 setCount:-1];
  [v10 setKey:v9];

  if (v7)
  {
    id v11 = objc_alloc_init((Class)SASyncAppMetaData);
    if (v8)
    {
      id v16 = v8;
      __int16 v12 = +[NSArray arrayWithObjects:&v16 count:1];
      [v11 setSyncSlots:v12];
    }
    id v13 = objc_alloc_init((Class)SASyncAppIdentifyingInfo);
    [v13 setBundleId:v7];
    id v14 = AFApplicationClientIdentifierForApp();
    [v13 setClientIdentifier:v14];

    [v11 setAppIdentifyingInfo:v13];
    [v10 setAppMetaData:v11];
  }
  return v10;
}

- (void)_saSyncServerVerifyResponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    id v14 = "-[ADCommandCenter(Sync) _saSyncServerVerifyResponse:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v13, 0xCu);
  }
  if (self->_needVerificationFullReport)
  {
    id v9 = [(ADCommandCenter *)self _syncManager];
    unsigned int v10 = [v9 isVerifying];

    if (v10)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_syncDelegate);
      __int16 v12 = [v6 dictionary];
      [WeakRetained adSyncVerificationServerReport:v12];
    }
  }
  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)_saSyncClientVerify:(id)a3 completion:(id)a4
{
  id v6 = (NSString *)a3;
  id v7 = (void (**)(id, id, void))a4;
  id v8 = AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    int v22 = 136315394;
    unsigned int v23 = "-[ADCommandCenter(Sync) _saSyncClientVerify:completion:]";
    __int16 v24 = 2112;
    long long v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v22, 0x16u);
  }
  outstandingSyncVerificationRequestID = self->_outstandingSyncVerificationRequestID;
  if (!outstandingSyncVerificationRequestID)
  {
    int v13 = +[ADPreferences sharedPreferences];
    id v11 = [v13 lastSyncVerificationDate];

    if (v11
      && ([v11 timeIntervalSinceNow], v14 > -86400.0)
      && ([(NSString *)v6 aceId],
          id v15 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v16 = [v15 isEqualToString:@"ClientSideInitiatedSyncVerification"],
          v15,
          (v16 & 1) == 0))
    {
      uint64_t v19 = AFSiriLogContextSync;
      if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
      {
        int v22 = 136315138;
        unsigned int v23 = "-[ADCommandCenter(Sync) _saSyncClientVerify:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s Already verified sync data over the last 24 hours, ignoring", (uint8_t *)&v22, 0xCu);
      }
      if (v7)
      {
        id v20 = objc_alloc_init((Class)SACommandIgnored);
        id v21 = [(NSString *)v6 aceId];
        [v20 setRefId:v21];

        v7[2](v7, v20, 0);
      }
    }
    else
    {
      id v17 = [(NSString *)v6 aceId];
      id v18 = self->_outstandingSyncVerificationRequestID;
      self->_outstandingSyncVerificationRequestID = v17;

      if (v7) {
        v7[2](v7, 0, 0);
      }
    }
    goto LABEL_13;
  }
  unsigned int v10 = AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    int v22 = 136315650;
    unsigned int v23 = "-[ADCommandCenter(Sync) _saSyncClientVerify:completion:]";
    __int16 v24 = 2112;
    long long v25 = outstandingSyncVerificationRequestID;
    __int16 v26 = 2112;
    long long v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Sync Verification request %@ is enqueued; ignoring %@",
      (uint8_t *)&v22,
      0x20u);
  }
  if (v7)
  {
    id v11 = objc_alloc_init((Class)SACommandIgnored);
    __int16 v12 = [(NSString *)v6 aceId];
    [v11 setRefId:v12];

    v7[2](v7, v11, 0);
LABEL_13:
  }
}

- (void)_saSyncFinished:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    id v9 = "-[ADCommandCenter(Sync) _saSyncFinished:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Server is done sending sync data", (uint8_t *)&v8, 0xCu);
  }
  if (v6) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)_saSyncChunkAccepted:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    id v11 = "-[ADCommandCenter(Sync) _saSyncChunkAccepted:completion:]";
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v10, 0x16u);
  }
  id v9 = [v6 refId];
  [(ADCommandCenter *)self _removeOutstandingSyncChunkId:v9];

  [(ADCommandCenter *)self _sync_continueIfConditionsMet];
  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)_saSyncChunkDenied:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
  {
    int v12 = 136315394;
    id v13 = "-[ADCommandCenter(Sync) _saSyncChunkDenied:completion:]";
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v12, 0x16u);
  }
  id v9 = [(ADCommandCenter *)self _syncManager];
  int v10 = [v6 current];
  [v9 cancelSyncForAnchor:v10];

  id v11 = [v6 refId];
  [(ADCommandCenter *)self _removeOutstandingSyncChunkId:v11];

  [(ADCommandCenter *)self _sync_continueIfConditionsMet];
  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)_saSASyncGetCachedSyncAnchors:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v17 = "-[ADCommandCenter(Sync) _saSASyncGetCachedSyncAnchors:completion:]";
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  id v9 = +[ADSyncSnapshot sharedInstance];
  int v10 = [(ADCommandCenter *)self _queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100055974;
  v13[3] = &unk_10050DEC0;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [v9 fetchSentAnchorsOnQueue:v10 completion:v13];
}

- (void)_saSyncGetAnchorsResponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315394;
    unsigned __int8 v16 = "-[ADCommandCenter(Sync) _saSyncGetAnchorsResponse:completion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v15, 0x16u);
  }
  id v9 = [v6 refId];
  [(ADCommandCenter *)self _removeOutstandingAnchorsRequestId:v9];
  int v10 = [(ADCommandCenter *)self _syncManager];
  id v11 = [v10 getAnchorsRequest];
  id v12 = [v11 aceId];

  if ([v12 isEqualToString:v9])
  {
    id v13 = [v10 getAnchorsRequest];
    [(ADCommandCenter *)self _handleValidatedSyncGetAnchorsResponse:v6 forGetAnchors:v13];

    [v10 setGetAnchorsRequest:0];
  }
  else
  {
    id v14 = AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315650;
      unsigned __int8 v16 = "-[ADCommandCenter(Sync) _saSyncGetAnchorsResponse:completion:]";
      __int16 v17 = 2112;
      id v18 = v9;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s %@ isn't the get anchors response we were expecting. getAnchorsRequest:%@", (uint8_t *)&v15, 0x20u);
    }
  }
  [(ADCommandCenter *)self _handleUpdatedSyncAndTokens:v6];
  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)_handleUpdatedSyncAndTokens:(id)a3
{
  id v4 = a3;
  id v5 = [v4 authToken];
  id v6 = +[ADAccount activeAccount];
  id v7 = [v6 aceHostCluster];

  if (v5 && v7)
  {
    int v8 = +[ADMUXCompanionSyncTokenContainer sharedInstance];
    id v9 = [v4 primeToken];
    if (v9) {
      [v8 setPrimeToken:v9 forAceHost:v7];
    }
    int v10 = AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v19 = "-[ADCommandCenter(Sync) _handleUpdatedSyncAndTokens:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s Setting new sync token is container", buf, 0xCu);
    }
    [v8 putSyncToken:v5 forAceHost:v7];
    id v11 = +[ADDeviceCircleManager sharedInstance];
    [v11 sendSyncTokenToPersonalRequestsEnabledAccessories];

    id v12 = [v4 syncDataReset];

    if (v12)
    {
      syncAnchorsRequestQueue = self->_syncAnchorsRequestQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100055EAC;
      block[3] = &unk_10050E138;
      block[4] = self;
      dispatch_async(syncAnchorsRequestQueue, block);
    }
  }
  else
  {
    id v14 = (void *)AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_DEBUG))
    {
      int v15 = v14;
      unsigned __int8 v16 = [v4 refId];
      *(_DWORD *)buf = 136315394;
      __int16 v19 = "-[ADCommandCenter(Sync) _handleUpdatedSyncAndTokens:]";
      __int16 v20 = 2112;
      id v21 = v16;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s Sync token is nil for response refId=%@", buf, 0x16u);
    }
  }
}

- (void)_saSyncGetAnchors:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    int v10 = [v6 forceEagerDeserialization];
    *(_DWORD *)buf = 136315394;
    __int16 v24 = "-[ADCommandCenter(Sync) _saSyncGetAnchors:completion:]";
    __int16 v25 = 2112;
    __int16 v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  id v11 = [v6 aceId];
  id v12 = [(ADCommandCenter *)self _syncManager];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100056218;
  v20[3] = &unk_10050E188;
  id v13 = v7;
  id v22 = v13;
  id v14 = v11;
  id v21 = v14;
  int v15 = objc_retainBlock(v20);
  if ([(ADCommandCenter *)self _sync_isRequestBlockingSyncVerification]
    || ([v12 isSyncing] & 1) != 0
    || [v12 isVerifying])
  {
    ((void (*)(void *))v15[2])(v15);
  }
  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10005629C;
    v16[3] = &unk_1004FF3C8;
    v16[4] = self;
    id v18 = v15;
    id v17 = v6;
    id v19 = v13;
    sub_1002E6D88(v16);
  }
}

- (void)_sendSyncFinishedAndReferenceCurrentSyncPromise:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    outstandingSyncPromiseID = self->_outstandingSyncPromiseID;
    int v11 = 136315650;
    id v12 = "-[ADCommandCenter(Sync) _sendSyncFinishedAndReferenceCurrentSyncPromise:]";
    __int16 v13 = 2112;
    id v14 = outstandingSyncPromiseID;
    __int16 v15 = 1024;
    BOOL v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s will reference promise %@: %d", (uint8_t *)&v11, 0x1Cu);
  }
  id v7 = objc_alloc_init((Class)SASyncFinished);
  int v8 = v7;
  if (v3)
  {
    [v7 setRefId:self->_outstandingSyncPromiseID];
    id v9 = self->_outstandingSyncPromiseID;
    self->_outstandingSyncPromiseID = 0;

    outstandingSyncPromiseKeys = self->_outstandingSyncPromiseKeys;
    self->_outstandingSyncPromiseKeys = 0;
  }
  [(ADCommandCenter *)self _sendCommandToServer:v8];
}

- (void)_requestAnchorsForKeys:(id)a3 appSources:(id)a4 watchAppSources:(id)a5 forceReset:(BOOL)a6 includeAllKnownAnchors:(BOOL)a7 reasons:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v47 = a4;
  id v15 = a5;
  id v16 = a8;
  id v17 = AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v56 = "-[ADCommandCenter(Sync) _requestAnchorsForKeys:appSources:watchAppSources:forceReset:includeAllKnownAnchors:reasons:]";
    __int16 v57 = 2112;
    id v58 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Asking for anchor keys %@", buf, 0x16u);
  }
  id v18 = [(ADCommandCenter *)self _syncManager];
  id v19 = v18;
  if (v10)
  {
    if ([v18 isSyncing])
    {
      __int16 v20 = AFSiriLogContextSync;
      if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v56 = "-[ADCommandCenter(Sync) _requestAnchorsForKeys:appSources:watchAppSources:forceReset:includeAllKnownAnchors:reasons:]";
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s Not forcing a reset since we're already in the middle of a sync. Wait and try again", buf, 0xCu);
      }
    }
    else
    {
      [v19 _setForceResetOnNextSync:1];
      id v21 = AFSiriLogContextSync;
      if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v56 = "-[ADCommandCenter(Sync) _requestAnchorsForKeys:appSources:watchAppSources:forceReset:includeAllKnownAnchors:reasons:]";
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s Forcing a reset sync", buf, 0xCu);
      }
    }
  }
  id v22 = [(ADCommandCenter *)self _sessionManager];
  [v22 beginUpdatingAssistantData];

  id v23 = objc_alloc_init((Class)SASyncGetAnchors);
  id v24 = v14;
  [v23 setSources:v14];
  __int16 v25 = [v16 componentsJoinedByString:@"+"];
  [v23 setSyncReason:v25];
  [v23 setIncludeAllKnownAnchors:v9];
  [v23 setAppMetaDataList:v47];
  id v46 = v15;
  [v23 setWatchAppMetaDataList:v15];
  __int16 v26 = SiriCoreUUIDStringCreate();
  [v23 setAceId:v26];

  long long v27 = [v23 aceId];
  [(ADCommandCenter *)self _fillInSyncAndPrimeTokens:v23];
  long long v28 = +[ADMultiUserMeDevice sharedInstance];
  id v29 = [v28 isMeDevice];
  id v30 = [v29 BOOLValue];

  __int16 v31 = AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v56 = "-[ADCommandCenter(Sync) _requestAnchorsForKeys:appSources:watchAppSources:forceReset:includeAllKnownAnchors:reasons:]";
    __int16 v57 = 1024;
    LODWORD(v58) = v30;
    _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "%s Is MeDevice?=%d", buf, 0x12u);
  }
  [v23 setCompanionOfMUDevice:v30];
  id v32 = AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v56 = "-[ADCommandCenter(Sync) _requestAnchorsForKeys:appSources:watchAppSources:forceReset:includeAllKnownAnchors:reasons:]";
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%s Waiting for sync queue to start sync", buf, 0xCu);
  }
  syncAnchorsRequestQueue = self->_syncAnchorsRequestQueue;
  v34 = v24;
  if (!syncAnchorsRequestQueue)
  {
    id v35 = [(ADCommandCenter *)self _queue];
    id v36 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v37 = dispatch_queue_attr_make_with_qos_class(v36, QOS_CLASS_UNSPECIFIED, 0);

    if (v35) {
      dispatch_queue_t v38 = dispatch_queue_create_with_target_V2("SyncAnchorsQueue", v37, v35);
    }
    else {
      dispatch_queue_t v38 = dispatch_queue_create("SyncAnchorsQueue", v37);
    }
    v39 = (OS_dispatch_queue *)v38;

    id v40 = self->_syncAnchorsRequestQueue;
    self->_syncAnchorsRequestQueue = v39;

    syncAnchorsRequestQueue = self->_syncAnchorsRequestQueue;
    v34 = v24;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100056F40;
  block[3] = &unk_100506008;
  id v49 = v27;
  id v50 = v16;
  v51 = syncAnchorsRequestQueue;
  v52 = self;
  id v53 = v23;
  id v54 = v19;
  id v41 = v27;
  id v42 = v16;
  unsigned int v43 = v51;
  id v44 = v23;
  id v45 = v19;
  dispatch_async(v43, block);
}

- (void)_fillInSyncAndPrimeTokens:(id)a3
{
  id v3 = a3;
  id v4 = +[ADAccount activeAccount];
  id v14 = [v4 aceHostCluster];

  id v5 = +[ADMUXCompanionSyncTokenContainer sharedInstance];
  id v6 = [v5 getSyncTokenForAceHost:v14];
  id v7 = [v5 primeTokenWrapperForAceHost:v14];
  int v8 = +[NSDate now];
  [v8 timeIntervalSince1970];
  double v10 = v9;
  [v7 lastPrimeTokenTimestamp];
  double v12 = v10 - v11;

  if (v12 >= 259200.0)
  {
    __int16 v13 = [v7 primeToken];
  }
  else
  {
    __int16 v13 = 0;
  }
  [v3 setAuthToken:v6];
  [v3 setPrimeToken:v13];
}

- (void)_fetchAllAppSourcesForSyncingWithCustomVocabInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    long long v27 = self;
    id v8 = objc_alloc_init((Class)NSMutableArray);
    id v9 = objc_alloc_init((Class)NSMutableArray);
    id v10 = objc_alloc_init((Class)NSMutableArray);
    id v11 = objc_alloc_init((Class)NSMutableArray);
    id v12 = objc_alloc((Class)NSString);
    __int16 v13 = +[NSUUID UUID];
    id v14 = [v12 initWithFormat:@"ADCommandCenterSyncAppSourcesFetching-%@", v13];

    id v28 = v14;
    id v15 = (const char *)[v28 UTF8String];
    id v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create(v15, v16);

    id v18 = dispatch_group_create();
    dispatch_group_enter(v18);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1000577D0;
    v41[3] = &unk_1004FF378;
    id v19 = v17;
    id v42 = v19;
    id v20 = v10;
    id v43 = v20;
    id v21 = v18;
    id v44 = v21;
    +[NSExtension _intents_findAppsWithAnIntentsServiceExtension:v41];
    if (AFSupportsPairedDevice())
    {
      dispatch_group_enter(v21);
      id v22 = +[ACXDeviceConnection sharedDeviceConnection];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_1000578B8;
      v37[3] = &unk_1005007C8;
      dispatch_queue_t v38 = v19;
      v39 = v21;
      id v40 = v11;
      [v22 fetchInstalledApplicationsForPairedDevice:0 completion:v37];
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000579A0;
    block[3] = &unk_100507D58;
    id v30 = v8;
    __int16 v31 = v27;
    id v32 = v6;
    id v33 = v20;
    id v34 = v11;
    id v35 = v9;
    id v36 = v7;
    id v23 = v9;
    id v24 = v11;
    id v25 = v20;
    id v26 = v8;
    dispatch_group_notify(v21, v19, block);
  }
}

- (id)_appMetaDataListFromVocabSources:(id)a3 appIdentifyingInfoList:(id)a4
{
  id v21 = self;
  id v22 = a3;
  id v5 = a4;
  id v23 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "bundleId", v21);
        __int16 v13 = +[LSApplicationProxy applicationProxyForIdentifier:v12];

        id v14 = objc_alloc_init((Class)SASyncAppMetaData);
        [v14 setAppIdentifyingInfo:v11];
        id v15 = +[NSNumber numberWithBool:sub_100057DB4(v13)];
        [v14 setDeveloperMode:v15];

        id v16 = [v11 clientIdentifier];
        if (v16)
        {
          [v23 setObject:v14 forKey:v16];
        }
        else
        {
          dispatch_queue_t v17 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            id v32 = "-[ADCommandCenter(Sync) _appMetaDataListFromVocabSources:appIdentifyingInfoList:]";
            __int16 v33 = 2112;
            id v34 = v11;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Malformed app source - no clientIdentifier: %@", buf, 0x16u);
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v8);
  }

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000584C8;
  void v24[3] = &unk_100500958;
  id v25 = v23;
  id v26 = v21;
  id v18 = v23;
  [v22 enumerateKeysAndObjectsUsingBlock:v24];
  id v19 = [v18 allValues];

  return v19;
}

- (id)_appMetaDataForAppProxy:(id)a3 clientIdentifier:(id)a4 syncSlots:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)SASyncAppMetaData);
  id v11 = sub_100057E6C(v9, v8);

  [v10 setAppIdentifyingInfo:v11];
  [v10 setSyncSlots:v7];

  uint64_t v12 = sub_100057DB4(v9);
  __int16 v13 = +[NSNumber numberWithBool:v12];
  [v10 setDeveloperMode:v13];

  return v10;
}

- (void)_handleValidatedSyncGetAnchorsResponse:(id)a3 forGetAnchors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ADCommandCenter *)self _syncManager];
  id v9 = [(ADCommandCenter *)self _allAnchorsFromRequest:v7 andResponse:v6];
  id v10 = [v7 syncReason];

  id v11 = [v10 componentsSeparatedByString:@"+"];

  if ([v8 isSyncing] && (objc_msgSend(v8, "isVerifying") & 1) == 0)
  {
    uint64_t v12 = (void *)AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = v12;
      id v14 = [v6 aceId];
      id v15 = [(ADCommandCenter *)self _currentRequest];
      id v16 = [v15 currentRequestId];
      int v17 = 136315650;
      id v18 = "-[ADCommandCenter(Sync) _handleValidatedSyncGetAnchorsResponse:forGetAnchors:]";
      __int16 v19 = 2112;
      id v20 = v14;
      __int16 v21 = 2112;
      id v22 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Queuing anchors from %@ because we are already syncing; active request: %@",
        (uint8_t *)&v17,
        0x20u);
    }
    [v8 addQueuedAnchors:v9 forReasons:v11];
  }
  else
  {
    [(ADCommandCenter *)self _resetSyncVerification];
    [v8 prepareSyncWithAnchors:v9 forReasons:v11 delegate:self];
  }
}

- (id)_allAnchorsFromRequest:(id)a3 andResponse:(id)a4
{
  id v4 = a4;
  id v5 = +[NSMutableDictionary dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  int v17 = v4;
  id v6 = [v4 anchors];
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v11, "_af_isValid"))
        {
          uint64_t v12 = objc_msgSend(v11, "_af_normalizedKey");
          [v5 setObject:v11 forKey:v12];
        }
        else
        {
          __int16 v13 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            id v23 = "-[ADCommandCenter(Sync) _allAnchorsFromRequest:andResponse:]";
            __int16 v24 = 2112;
            id v25 = v11;
            _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Ignoring invalid anchor from server: %@", buf, 0x16u);
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v8);
  }

  id v14 = +[ADSyncBlacklist sharedInstance];
  [v14 filterBlacklistedAnchorsFrom:v5 includingNewRestrictionsFromResponse:v17];

  id v15 = [v5 allValues];

  return v15;
}

- (BOOL)_syncChunkWindowFull
{
  return (unint64_t)[(NSMutableSet *)self->_outstandingSyncChunks count] > 4;
}

- (BOOL)_hasOutstandingSyncChunkId:(id)a3
{
  if (a3) {
    return -[NSMutableSet containsObject:](self->_outstandingSyncChunks, "containsObject:");
  }
  else {
    return 0;
  }
}

- (void)_removeOutstandingSyncChunkId:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSMutableSet *)self->_outstandingSyncChunks removeObject:v4];
    if (![(NSMutableSet *)self->_outstandingSyncChunks count])
    {
      outstandingSyncChunks = self->_outstandingSyncChunks;
      self->_outstandingSyncChunks = 0;
    }
  }
  _objc_release_x1();
}

- (void)_addOutstandingSyncChunkId:(id)a3
{
  id v4 = a3;
  outstandingSyncChunks = self->_outstandingSyncChunks;
  id v8 = v4;
  if (!outstandingSyncChunks)
  {
    id v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v7 = self->_outstandingSyncChunks;
    self->_outstandingSyncChunks = v6;

    id v4 = v8;
    outstandingSyncChunks = self->_outstandingSyncChunks;
  }
  [(NSMutableSet *)outstandingSyncChunks addObject:v4];
}

- (BOOL)_hasOutstandingAnchorsRequestId:(id)a3
{
  if (a3) {
    return -[NSMutableSet containsObject:](self->_outstandingAnchorsRequests, "containsObject:");
  }
  else {
    return 0;
  }
}

- (void)_removeOutstandingAnchorsRequestId:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSMutableSet *)self->_outstandingAnchorsRequests removeObject:v4];
    if (![(NSMutableSet *)self->_outstandingAnchorsRequests count])
    {
      outstandingAnchorsRequests = self->_outstandingAnchorsRequests;
      self->_outstandingAnchorsRequests = 0;
    }
  }
  _objc_release_x1();
}

- (void)_addOutstandingAnchorsRequestId:(id)a3
{
  id v4 = a3;
  outstandingAnchorsRequests = self->_outstandingAnchorsRequests;
  id v8 = v4;
  if (!outstandingAnchorsRequests)
  {
    id v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v7 = self->_outstandingAnchorsRequests;
    self->_outstandingAnchorsRequests = v6;

    id v4 = v8;
    outstandingAnchorsRequests = self->_outstandingAnchorsRequests;
  }
  [(NSMutableSet *)outstandingAnchorsRequests addObject:v4];
}

- (id)_syncMetadata
{
  syncMetadata = self->_syncMetadata;
  if (!syncMetadata)
  {
    id v4 = +[ADPreferences sharedPreferences];
    uint64_t v5 = [v4 syncMetadata];
    id v6 = (void *)v5;
    id v7 = &__NSDictionary0__struct;
    if (v5) {
      id v7 = (void *)v5;
    }
    id v8 = v7;

    uint64_t v9 = (NSMutableDictionary *)[v8 mutableCopy];
    id v10 = self->_syncMetadata;
    self->_syncMetadata = v9;

    syncMetadata = self->_syncMetadata;
  }
  return syncMetadata;
}

- (void)_resetSyncVerification
{
  id v4 = [(ADCommandCenter *)self _syncManager];
  if ([v4 isVerifying])
  {
    [v4 reset];
    verificationHelper = self->_verificationHelper;
    self->_verificationHelper = 0;
  }
}

- (id)_syncManager
{
  syncManager = self->_syncManager;
  if (!syncManager)
  {
    id v4 = [ADSyncManager alloc];
    uint64_t v5 = [(ADCommandCenter *)self _serviceManager];
    id v6 = [(ADCommandCenter *)self _queue];
    id v7 = [(ADSyncManager *)v4 initWithServiceManager:v5 queue:v6];
    id v8 = self->_syncManager;
    self->_syncManager = v7;

    syncManager = self->_syncManager;
  }
  return syncManager;
}

- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6
{
  id v6 = (void (*)(id, id, id))*((void *)a6 + 2);
  if (a5 == 10) {
    v6(a6, a3, a4);
  }
  else {
    ((void (*)(id, void, void, id))v6)(a6, 0, 0, a4);
  }
}

- (void)notificationManagerDidChangeBulletins:(id)a3
{
  id v4 = [(ADCommandCenter *)self _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005BA6C;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)fetchBulletinsOnLockScreenForNotificationManager:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = [(ADCommandCenter *)self _queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005BB28;
  v8[3] = &unk_10050E188;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)contextManagerDidUpdateBackgroundContext:(id)a3
{
  id v4 = a3;
  id v5 = [(ADCommandCenter *)self _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005BC4C;
  block[3] = &unk_10050E138;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)_context_reset
{
  if ((AFIsHorseman() & 1) == 0 && (AFIsNano() & 1) == 0)
  {
    id v3 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      contextManager = self->_contextManager;
      int v5 = 136315394;
      id v6 = "-[ADCommandCenter(Context) _context_reset]";
      __int16 v7 = 2048;
      id v8 = contextManager;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Resetting ContextManager %p", (uint8_t *)&v5, 0x16u);
    }
    [(ADContextManager *)self->_contextManager reset];
    [(ADContextManager *)self->_contextManager setDelegate:0];
  }
}

- (void)_context_fetchApplicationContextForApplicationInfos:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ADCommandCenter *)self _contextManager];
  int64_t v9 = [(ADCommandCenter *)self _context_deviceState];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005BE0C;
  v11[3] = &unk_10050A5E8;
  id v12 = v6;
  id v10 = v6;
  [v8 getAppContextForDeviceState:v9 applicationInfos:v7 completion:v11];
}

- (void)_context_acknowledgeBulletinForObject:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(ADCommandCenter *)self _contextManager];
    [v5 markBulletinAsAcknolwedgedForDomainObject:v4];
  }
}

- (void)_context_setApplicationContextForApplicationInfos:(id)a3 withRefId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v22 = "-[ADCommandCenter(Context) _context_setApplicationContextForApplicationInfos:withRefId:]";
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  [(ADCommandCenter *)self _ensureBackgroundContextSentToServer];
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    SiriCoreUUIDStringCreate();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v10 = v9;
  id v11 = [(ADCommandCenter *)self _contextManager];
  int64_t v12 = [(ADCommandCenter *)self _context_deviceState];
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  int v17 = sub_10005C038;
  long long v18 = &unk_1004FF620;
  long long v19 = self;
  id v20 = v10;
  id v13 = v10;
  [v11 getAppContextForDeviceState:v12 applicationInfos:v6 completion:&v15];

  id v14 = -[ADCommandCenter _sendContextPromiseForTypes:withAceId:](self, "_sendContextPromiseForTypes:withAceId:", 1, v13, v15, v16, v17, v18, v19);
}

- (int64_t)_context_deviceState
{
  int64_t v3 = [(ADCommandCenter *)self _deviceIsLocked];
  if ([(ADCommandCenter *)self _isInStarkMode]) {
    return v3 | 2;
  }
  else {
    return v3;
  }
}

- (BOOL)_context_bundleIdHasSupportForCarPlayRequiredMessageIntents:(id)a3
{
  id v3 = a3;
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x2050000000;
  id v4 = (void *)qword_100585708;
  uint64_t v29 = qword_100585708;
  if (!qword_100585708)
  {
    long long v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    __int16 v23 = sub_10005C564;
    id v24 = &unk_10050E318;
    id v25 = &v26;
    sub_10005C564((uint64_t)&v21);
    id v4 = (void *)v27[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v26, 8);
  id v6 = +[LSApplicationProxy applicationProxyForIdentifier:v3];
  id v7 = [v5 appInfoWithAppProxy:v6];

  id v8 = [v7 supportedIntents];
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x2020000000;
  id v9 = (id *)qword_100585718;
  uint64_t v29 = qword_100585718;
  if (!qword_100585718)
  {
    long long v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    __int16 v23 = sub_10005C62C;
    id v24 = &unk_10050E318;
    id v25 = &v26;
    id v10 = sub_10005C67C();
    id v11 = dlsym(v10, "INSendMessageIntentIdentifier");
    *(void *)(v25[1] + 24) = v11;
    qword_100585718 = *(void *)(v25[1] + 24);
    id v9 = (id *)v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (v9)
  {
    id v12 = *v9;
    if (![v8 containsObject:v12])
    {
      unsigned __int8 v17 = 0;
      goto LABEL_12;
    }
    id v13 = [v7 supportedIntents];
    uint64_t v26 = 0;
    long long v27 = &v26;
    uint64_t v28 = 0x2020000000;
    id v14 = (void *)qword_100585720;
    uint64_t v29 = qword_100585720;
    if (!qword_100585720)
    {
      long long v21 = _NSConcreteStackBlock;
      uint64_t v22 = 3221225472;
      __int16 v23 = sub_10005C7D0;
      id v24 = &unk_10050E318;
      id v25 = &v26;
      id v15 = sub_10005C67C();
      uint64_t v16 = dlsym(v15, "INSearchForMessagesIntentIdentifier");
      *(void *)(v25[1] + 24) = v16;
      qword_100585720 = *(void *)(v25[1] + 24);
      id v14 = (void *)v27[3];
    }
    _Block_object_dispose(&v26, 8);
    if (v14)
    {
      unsigned __int8 v17 = [v13 containsObject:*v14];

LABEL_12:
      return v17;
    }
    long long v19 = +[NSAssertionHandler currentHandler];
    id v20 = +[NSString stringWithUTF8String:"NSString *getINSearchForMessagesIntentIdentifier(void)"];
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"ADCommandCenter_Context.m", 62, @"%s", dlerror());
  }
  else
  {
    long long v19 = +[NSAssertionHandler currentHandler];
    id v20 = +[NSString stringWithUTF8String:"NSString *getINSendMessageIntentIdentifier(void)"];
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"ADCommandCenter_Context.m", 63, @"%s", dlerror());
  }

  __break(1u);
  return result;
}

- (void)_context_setOverriddenApplicationContext:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v59 = "-[ADCommandCenter(Context) _context_setOverriddenApplicationContext:withContext:]";
    __int16 v60 = 2112;
    long long v61 = v6;
    __int16 v62 = 2112;
    id v63 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }
  [(ADCommandCenter *)self _ensureBackgroundContextSentToServer];
  if (v6)
  {
    id v9 = objc_alloc_init((Class)SASyncAppIdentifyingInfo);
    [v9 setBundleId:v6];
    id v10 = objc_alloc_init((Class)SAAppInfo);
    [v10 setAppIdentifyingInfo:v9];
    id v11 = objc_alloc_init((Class)NSMutableArray);
    id v12 = [v10 dictionary];
    __int16 v57 = v12;
    id v13 = +[NSArray arrayWithObjects:&v57 count:1];
    [v11 addObject:v13];

    id v14 = [(ADCommandCenter *)self _sendContextPromiseForTypes:1];
    id v15 = dispatch_group_create();
    if ([v6 caseInsensitiveCompare:@"com.apple.mobilePhone"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v39 = v15;
        id v16 = v10;
        id v17 = v7;
        uint64_t v18 = [v17 saNotificationObject];
        long long v19 = (void *)v18;
        if (v18)
        {
          id v42 = v14;
          uint64_t v56 = v18;
          id v20 = +[NSArray arrayWithObjects:&v56 count:1];
          long long v21 = +[AceObject dictionaryArrayWithAceObjectArray:v20];
          [v11 addObject:v21];

          id v14 = v42;
        }

        id v10 = v16;
        id v15 = v39;
      }
      else if (v7)
      {
        if ([v6 caseInsensitiveCompare:@"com.apple.MobileSMS"]
          && ![(ADCommandCenter *)self _context_bundleIdHasSupportForCarPlayRequiredMessageIntents:v6])
        {
          if (![v6 caseInsensitiveCompare:@"com.apple.siri"])
          {
            id v55 = v7;
            +[NSArray arrayWithObjects:&v55 count:1];
            v37 = id v36 = v14;
            dispatch_queue_t v38 = +[AceObject dictionaryArrayWithAceObjectArray:v37];

            id v14 = v36;
            [v11 addObject:v38];
          }
        }
        else
        {
          dispatch_group_enter(v15);
          __int16 v23 = [(ADCommandCenter *)self _contextManager];
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_10005D0A4;
          v48[3] = &unk_100504A70;
          v48[4] = self;
          id v49 = v11;
          id v50 = v15;
          [v23 getDomainObjectFromMessageContext:v7 completion:v48];
        }
      }
    }
    else
    {
      dispatch_group_enter(v15);
      objc_opt_class();
      id v40 = v10;
      id v41 = v9;
      id v43 = v14;
      if (objc_opt_isKindOfClass()) {
        id v22 = v7;
      }
      else {
        id v22 = 0;
      }
      id v24 = objc_alloc_init((Class)SAPhoneSearch);
      [v24 setIsNew:&off_100523420];
      id v25 = [v22 date];
      [v24 setStart:v25];

      uint64_t v26 = [v22 endDate];
      [v24 setEnd:v26];

      long long v27 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v22 sectionSubtype] == (id)3);
      [v24 setVoiceMail:v27];

      uint64_t v28 = [(ADCommandCenter *)self _serviceManager];
      uint64_t v29 = [v24 encodedClassName];
      long long v30 = [v28 serviceForDomain:@"com.apple.ace.phone" command:v29];

      if (v30)
      {
        __int16 v31 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          id v32 = v31;
          v39 = [v30 identifier];
          *(_DWORD *)buf = 136315394;
          id v59 = "-[ADCommandCenter(Context) _context_setOverriddenApplicationContext:withContext:]";
          __int16 v60 = 2112;
          long long v61 = v39;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%s Dispatching phone search for overridden application context %@", buf, 0x16u);
        }
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472;
        v51[2] = sub_10005CF00;
        v51[3] = &unk_1004FF5F8;
        id v52 = v24;
        id v53 = self;
        id v54 = v15;
        [v30 handleCommand:v52 forDomain:@"com.apple.ace.phone" executionContext:0 reply:v51];
      }
      id v10 = v40;
      id v9 = v41;
      id v14 = v43;
    }
    __int16 v33 = [(ADCommandCenter *)self _queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005D180;
    block[3] = &unk_10050DCB8;
    id v45 = v11;
    id v46 = v14;
    id v47 = self;
    id v34 = v14;
    id v35 = v11;
    dispatch_group_notify(v15, v33, block);
  }
}

- (void)_getOrderedContextDictionaryForTransformedAFApplicationContext:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id))a4;
  if (v6)
  {
    id v7 = objc_alloc_init((Class)NSMutableArray);
    id v8 = [v5 associatedBundleIdentifier];
    if (v8)
    {
      id v9 = objc_alloc_init((Class)SASyncAppIdentifyingInfo);
      [v9 setBundleId:v8];
      id v10 = objc_alloc_init((Class)SAAppInfo);
      [v10 setAppIdentifyingInfo:v9];
      id v11 = [v10 dictionary];
      id v15 = v11;
      id v12 = +[NSArray arrayWithObjects:&v15 count:1];
      [v7 addObject:v12];
    }
    id v13 = [v5 aceContexts];
    if (v13)
    {
      id v14 = +[AceObject dictionaryArrayWithAceObjectArray:v13];
      [v7 addObject:v14];
    }
    v6[2](v6, v7);
  }
}

- (void)_getTransformedApplicationContextForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  if (a4)
  {
    id v7 = (void (**)(id, void *))a4;
    id v8 = [v6 associatedBundleIdentifier];
    id v9 = [v6 bulletin];
    id v10 = [v6 aceContext];
    uint64_t v11 = [v6 contextDictionary];
    id v12 = (void *)v11;
    if (v9)
    {
      uint64_t v13 = [v9 saNotificationObject];
      id v14 = (void *)v13;
      if (v13)
      {
        uint64_t v24 = v13;
        id v15 = +[NSArray arrayWithObjects:&v24 count:1];
        if (!v8)
        {
          id v8 = [v14 applicationId];
        }
      }
      else
      {
        id v15 = 0;
      }

      goto LABEL_16;
    }
    if (v11
      && (![v8 caseInsensitiveCompare:@"com.apple.MobileSMS"]
       || [(ADCommandCenter *)self _context_bundleIdHasSupportForCarPlayRequiredMessageIntents:v8]))
    {
      uint64_t v16 = AFMessagesGetAceDomainObjectsFromContext();
    }
    else
    {
      if (!v10)
      {
        id v15 = 0;
        goto LABEL_16;
      }
      __int16 v23 = v10;
      uint64_t v16 = +[NSArray arrayWithObjects:&v23 count:1];
    }
    id v15 = (void *)v16;
LABEL_16:
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10005D5F0;
    v20[3] = &unk_100501950;
    id v21 = v8;
    id v22 = v15;
    id v17 = v15;
    id v18 = v8;
    long long v19 = [v6 mutatedCopyWithMutator:v20];
    v7[2](v7, v19);
  }
}

- (void)_fetchAndSendApplicationContextForApplicationInfos:(id)a3 fetchedOrderedContextDictionaries:(id)a4 applicationContexts:(id)a5 refID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = SiriCoreUUIDStringCreate();
  id v15 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v28 = "-[ADCommandCenter(Context) _fetchAndSendApplicationContextForApplicationInfos:fetchedOrderedContextDictionarie"
          "s:applicationContexts:refID:]";
    __int16 v29 = 2112;
    id v30 = v10;
    __int16 v31 = 2112;
    id v32 = v13;
    __int16 v33 = 2112;
    id v34 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s #context Starting app context fetch for - %@ with refId - %@, aceId - %@", buf, 0x2Au);
  }
  uint64_t v16 = [(ADCommandCenter *)self _contextManager];
  int64_t v17 = [(ADCommandCenter *)self _context_deviceState];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10005D840;
  v22[3] = &unk_1004FF5D0;
  v22[4] = self;
  id v23 = v11;
  id v24 = v13;
  id v25 = v14;
  id v26 = v12;
  id v18 = v12;
  id v19 = v14;
  id v20 = v13;
  id v21 = v11;
  [v16 getAppContextForDeviceState:v17 applicationInfos:v10 completion:v22];
}

- (void)_context_fetchAppicationContextForApplicationInfo:(id)a3 supplementalContext:(id)a4 refID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v46 = "-[ADCommandCenter(Context) _context_fetchAppicationContextForApplicationInfo:supplementalContext:refID:]";
    __int16 v47 = 2112;
    uint64_t v48 = v8;
    __int16 v49 = 2112;
    id v50 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s fetching context from %@, additional context provided: %@", buf, 0x20u);
  }
  [(ADCommandCenter *)self _ensureBackgroundContextSentToServer];
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [(ADCommandCenter *)self _sendContextPromiseForTypes:1];
  }
  id v13 = v12;
  id v14 = objc_alloc_init((Class)NSMutableArray);
  id v15 = objc_alloc_init((Class)NSMutableArray);
  if ([v9 count])
  {
    uint64_t v16 = v14;
    id v26 = v13;
    uint64_t v28 = v8;
    int64_t v17 = dispatch_group_create();
    id v18 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v46 = "-[ADCommandCenter(Context) _context_fetchAppicationContextForApplicationInfo:supplementalContext:refID:]";
      __int16 v47 = 2048;
      uint64_t v48 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v27 = v9;
    id obj = v9;
    id v19 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v41;
      do
      {
        id v22 = 0;
        do
        {
          if (*(void *)v41 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void *)(*((void *)&v40 + 1) + 8 * (void)v22);
          dispatch_group_enter(v17);
          id v24 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            id v46 = "-[ADCommandCenter(Context) _context_fetchAppicationContextForApplicationInfo:supplementalContext:refID:]";
            __int16 v47 = 2048;
            uint64_t v48 = v17;
            _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%s #context Starting ordered fetch for context - %p", buf, 0x16u);
          }
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_10005E3D0;
          v35[3] = &unk_1004FF530;
          id v36 = v16;
          uint64_t v37 = self;
          dispatch_queue_t v38 = v17;
          id v39 = v15;
          [(ADCommandCenter *)self _getTransformedApplicationContextForContext:v23 completion:v35];

          id v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v20 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v20);
    }

    id v25 = [(ADCommandCenter *)self _queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005E49C;
    block[3] = &unk_100507F88;
    void block[4] = self;
    id v8 = v28;
    __int16 v31 = v28;
    id v32 = v15;
    id v14 = v16;
    id v33 = v16;
    id v13 = v26;
    id v34 = v26;
    dispatch_group_notify(v17, v25, block);

    id v9 = v27;
  }
  else
  {
    [(ADCommandCenter *)self _fetchAndSendApplicationContextForApplicationInfos:v8 fetchedOrderedContextDictionaries:v15 applicationContexts:v14 refID:v13];
  }
}

- (void)_context_setApplicationContext:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v48 = "-[ADCommandCenter(Context) _context_setApplicationContext:]";
    __int16 v49 = 2112;
    id v50 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  [(ADCommandCenter *)self _ensureBackgroundContextSentToServer];
  __int16 v29 = self;
  [(ADCommandCenter *)self _sendCommandToServer:v4];
  id v32 = objc_alloc_init((Class)NSMutableArray);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v30 = v4;
  id obj = [v4 orderedContext];
  id v6 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v42;
    uint64_t v31 = *(void *)v42;
    do
    {
      id v9 = 0;
      id v33 = v7;
      do
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v35 = v9;
          id v36 = objc_alloc_init((Class)NSMutableArray);
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v11 = v10;
          id v12 = [v11 countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (v12)
          {
            id v13 = v12;
            id v14 = 0;
            uint64_t v15 = *(void *)v38;
            do
            {
              for (i = 0; i != v13; i = (char *)i + 1)
              {
                if (*(void *)v38 != v15) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v17 = *(void *)(*((void *)&v37 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v18 = +[AceObject aceObjectWithDictionary:v17];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v19 = [v18 appIdentifyingInfo];
                    uint64_t v20 = [v19 bundleId];

                    id v14 = (void *)v20;
                  }
                  else
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      [v36 addObject:v18];
                    }
                  }
                }
              }
              id v13 = [v11 countByEnumeratingWithState:&v37 objects:v45 count:16];
            }
            while (v13);
          }
          else
          {
            id v14 = 0;
          }

          id v21 = [objc_alloc((Class)AFApplicationContext) initWithAssociatedBundleIdentifier:v14 bulletin:0 aceContext:0 contextDictionary:0 aceContexts:v36];
          [v32 addObject:v21];

          id v7 = v33;
          uint64_t v8 = v31;
          id v9 = v35;
        }
        id v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      id v7 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v7);
  }

  id v22 = [objc_alloc((Class)AFApplicationContextSnapshot) initWithApplicationContexts:v32];
  id v23 = objc_alloc((Class)AFDeviceContextMetadata);
  uint64_t v24 = AFDeviceContextKeyApplication;
  id v25 = +[NSDate date];
  id v26 = +[NSDate dateWithTimeIntervalSinceNow:15.0];
  id v27 = [v23 initWithType:v24 deliveryDate:v25 expirationDate:v26 redactedKeyPaths:0 historyConfiguration:0];

  uint64_t v28 = +[AFContextDonationService defaultService];
  [v28 registerContextTransformer:v29 forType:v24];
  [v28 donateContext:v22 withMetadata:v27 pushToRemote:0];
}

- (void)_context_setSTApplicationContext:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[ADCommandCenter(Context) _context_setSTApplicationContext:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (v4)
  {
    id v6 = [v4 _aceValue];
    if ([v6 count])
    {
      id v7 = objc_alloc_init((Class)SASetApplicationContext);
      id v9 = v6;
      uint64_t v8 = +[NSArray arrayWithObjects:&v9 count:1];
      [v7 setOrderedContext:v8];

      [(ADCommandCenter *)self _sendCommandToServer:v7];
    }
  }
}

- (void)_context_willSetApplicationContextWithRefId:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[ADCommandCenter(Context) _context_willSetApplicationContextWithRefId:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  id v6 = [(ADCommandCenter *)self _sendContextPromiseForTypes:1 withAceId:v4];
}

- (void)_ensureBackgroundContextSentToServer
{
  id v3 = [(ADCommandCenter *)self _contextManager];
  unsigned int v4 = [v3 backgroundContextIsDirty];

  if (v4)
  {
    [(ADCommandCenter *)self _setBackgroundContext];
  }
}

- (void)_updateFlowContext
{
  if (AFSupportsHALFlowRouting())
  {
    id v3 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      int v7 = "-[ADCommandCenter(Context) _updateFlowContext]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }
    unsigned int v4 = [(ADCommandCenter *)self _contextManager];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10005EE4C;
    v5[3] = &unk_10050E2A0;
    v5[4] = self;
    [v4 getContextSnapshotForCurrentRequestWithCompletion:v5];
  }
}

- (void)_setRestrictedAppContext
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADCommandCenter(Context) _setRestrictedAppContext]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&buf, 0xCu);
  }
  unsigned int v4 = SiriCoreUUIDStringCreate();
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_10005F238;
  id v26 = sub_10005F248;
  id v27 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10005F250;
  v19[3] = &unk_10050C700;
  id v5 = v4;
  id v21 = self;
  p_long long buf = &buf;
  id v20 = v5;
  id v6 = objc_retainBlock(v19);
  if ((AFIsHorseman() & 1) != 0 || AFIsATV())
  {
    id v7 = [(ADCommandCenter *)self _sendContextPromiseForTypes:16 withAceId:v5];
    uint64_t v8 = _AFPreferencesNotificationPreviewRestrictedApps();
    __int16 v9 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v8;

    ((void (*)(void *))v6[2])(v6);
  }
  else
  {
    id v10 = +[ADNotificationManager sharedManager];
    __int16 v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    id v14 = sub_10005F2C4;
    uint64_t v15 = &unk_10050B4F0;
    id v18 = &buf;
    uint64_t v16 = self;
    uint64_t v17 = v6;
    [v10 fetchSiriRelatedNotificationPreviewRestrictedAppsWithCompletion:&v12];

    id v11 = -[ADCommandCenter _sendContextPromiseForTypes:withAceId:](self, "_sendContextPromiseForTypes:withAceId:", 16, v5, v12, v13, v14, v15, v16);
  }

  _Block_object_dispose(&buf, 8);
}

- (void)_setSyncContext
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v6 = "-[ADCommandCenter(Context) _setSyncContext]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005F4C8;
  v4[3] = &unk_10050E2A0;
  v4[4] = self;
  sub_1002E6D88(v4);
}

- (void)_setBackgroundContext
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v14 = "-[ADCommandCenter(Context) _setBackgroundContext]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  unsigned int v4 = [(ADCommandCenter *)self _contextManager];
  [v4 clearBackgroundContextDirtyState];
  SiriCoreUUIDStringCreate();
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  __int16 v9 = sub_10005F770;
  id v10 = &unk_1004FF508;
  id v11 = self;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v12;
  [v4 getBackgroundContext:&v7];
  id v6 = -[ADCommandCenter _sendContextPromiseForTypes:withAceId:](self, "_sendContextPromiseForTypes:withAceId:", 4, v5, v7, v8, v9, v10, v11);
}

- (void)_setAlertContext
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADCommandCenter(Context) _setAlertContext]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&buf, 0xCu);
  }
  unsigned int v4 = [(ADCommandCenter *)self _contextManager];
  [v4 clearAlertContextDirtyState];
  id v5 = dispatch_group_create();
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000;
  long long v37 = sub_10005F238;
  long long v38 = sub_10005F248;
  id v39 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = sub_10005F238;
  v33[4] = sub_10005F248;
  id v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = sub_10005F238;
  v31[4] = sub_10005F248;
  id v32 = 0;
  if ((AFIsNano() & 1) == 0)
  {
    id v6 = +[ADNotificationManager sharedManager];
    [v6 setDataSource:self];
    dispatch_group_enter(v5);
    if (AFIsDeviceUnlocked())
    {
      id v7 = v30;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10005FDEC;
      v30[3] = &unk_100503C70;
      v30[5] = &buf;
      v30[4] = v5;
      [v6 fetchAllBulletinsWithCompletion:v30];
    }
    else
    {
      id v7 = v29;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10005FE4C;
      void v29[3] = &unk_100503C70;
      v29[5] = &buf;
      v29[4] = v5;
      [v6 fetchBulletinsOnLockScreenWithCompletion:v29];
    }
  }
  uint64_t v8 = +[ADClockService sharedService];
  if (v8)
  {
    dispatch_group_enter(v5);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10005FEAC;
    v25[3] = &unk_1004FF468;
    id v27 = v33;
    uint64_t v28 = v31;
    id v26 = v5;
    [v8 getSnapshotsWithCompletion:v25];
  }
  __int16 v9 = SiriCoreUUIDStringCreate();
  id v10 = [(ADCommandCenter *)self _sendContextPromiseForTypes:32 withAceId:v9];
  id v11 = SiriCoreUUIDStringCreate();
  id v12 = [(ADCommandCenter *)self _sendContextPromiseForTypes:2 withAceId:v11];
  uint64_t v13 = [(ADCommandCenter *)self _queue];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10005FF48;
  v17[3] = &unk_1004FF4E0;
  p_long long buf = &buf;
  id v23 = v33;
  uint64_t v24 = v31;
  id v18 = v4;
  id v19 = self;
  id v20 = v9;
  id v21 = v11;
  id v14 = v11;
  id v15 = v9;
  id v16 = v4;
  dispatch_group_notify(v5, v13, v17);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);

  _Block_object_dispose(&buf, 8);
}

- (void)_context_updateContext
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v8 = "-[ADCommandCenter(Context) _context_updateContext]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if ((AFSupportsHALFlowRouting() & 1) == 0) {
    [(ADCommandCenter *)self _updateFlowContext];
  }
  unsigned int v4 = [(ADCommandCenter *)self _contextManager];
  [v4 keepReportingNowPlayingTimingEventsHeuristically];
  if ([v4 alertContextIsDirty])
  {
    [(ADCommandCenter *)self _setAlertContext];
  }
  else if ((AFIsMac() & 1) == 0)
  {
    id v5 = +[ADDeviceCircleManager sharedInstance];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100060424;
    v6[3] = &unk_100505130;
    v6[4] = self;
    [v5 getContextCollectorDeviceIdentifiersWithCompletion:v6];
  }
  if ([v4 backgroundContextIsDirty]) {
    [(ADCommandCenter *)self _setBackgroundContext];
  }
  [(ADCommandCenter *)self _setRestrictedAppContext];
  [(ADCommandCenter *)self _setSyncContext];
}

- (void)_context_setAlertContextDirty
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[ADCommandCenter(Context) _context_setAlertContextDirty]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  unsigned int v4 = [(ADCommandCenter *)self _contextManager];
  [v4 setAlertContextDirty];
}

- (void)_context_clearContextWithClearSiriKitContext:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    __int16 v9 = "-[ADCommandCenter(Context) _context_clearContextWithClearSiriKitContext:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  id v6 = objc_alloc_init((Class)SAClearContext);
  [(ADCommandCenter *)self _sendCommandToServer:v6];
  objc_storeStrong((id *)&self->_lastClearContext, v6);
  if (v3)
  {
    id v7 = objc_alloc_init((Class)SAIntentGroupSiriKitClearContext);
    [v7 setReason:@"client_clear_context"];
    [(ADCommandCenter *)self handleCommand:v7 completion:0];
  }
  [(ADCommandCenter *)self _setBackgroundContext];
}

- (void)_context_rollbackClearContext
{
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[ADCommandCenter(Context) _context_rollbackClearContext]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  if (self->_lastClearContext)
  {
    id v4 = objc_alloc_init((Class)SARollbackRequest);
    int v5 = [(SAClearContext *)self->_lastClearContext aceId];
    [v4 setRequestId:v5];

    [(ADCommandCenter *)self _sendCommandToServer:v4];
    [(ADCommandCenter *)self _setBackgroundContext];
  }
}

- (id)_sendContextPromiseForTypes:(int64_t)a3 withAceId:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)SAContextPromise);
  id v8 = objc_alloc_init((Class)NSMutableArray);
  __int16 v9 = v8;
  if (v4)
  {
    [v8 addObject:SAContextTypeAPPLICATION_CONTEXTValue];
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v9 addObject:SAContextTypeALERT_CONTEXTValue];
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v9 addObject:SAContextTypeBACKGROUND_CONTEXTValue];
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v9 addObject:SAContextTypeREQUEST_ORIGINValue];
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_14:
  [v9 addObject:SAContextTypeRESTRICTED_APP_CONTEXTValue];
  if ((v4 & 0x20) != 0) {
LABEL_7:
  }
    [v9 addObject:SAContextTypeNL_ALERT_CONTEXTValue];
LABEL_8:
  [v7 setPromiseTypes:v9];

  if (v6)
  {
    [v7 setAceId:v6];
  }
  else
  {
    id v10 = SiriCoreUUIDStringCreate();
    [v7 setAceId:v10];
  }
  [(ADCommandCenter *)self _sendCommandToServer:v7];
  id v11 = [v7 aceId];

  return v11;
}

- (id)_sendContextPromiseForTypes:(int64_t)a3
{
  return [(ADCommandCenter *)self _sendContextPromiseForTypes:a3 withAceId:0];
}

- (void)withContextManager:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v5 = [(ADCommandCenter *)self _queue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000609E8;
    v6[3] = &unk_10050E188;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (id)_contextManager
{
  contextManager = self->_contextManager;
  if (!contextManager)
  {
    id v4 = [[ADContextManager alloc] initWithDelegate:self];
    int v5 = self->_contextManager;
    self->_contextManager = v4;

    id v6 = +[AFContextDonationService defaultService];
    id v7 = [(ADContextManager *)self->_contextManager localContextStore];
    [v6 setDonationService:v7];

    id v8 = +[ADNotificationManager sharedManager];
    [v8 addDelegate:self];

    contextManager = self->_contextManager;
  }
  __int16 v9 = [(ADContextManager *)contextManager delegate];

  if (!v9) {
    [(ADContextManager *)self->_contextManager setDelegate:self];
  }
  id v10 = self->_contextManager;
  return v10;
}

- (void)_notifyUSTForRequestCompleted:(id)a3
{
  id v4 = a3;
  int v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[ADCommandCenter(UnifiedSiriTest) _notifyUSTForRequestCompleted:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Notify USTAgent for RequestCompleted with requestId '%@'", (uint8_t *)&v7, 0x16u);
  }
  id v6 = [(ADCommandCenter *)self _testAgent];
  [v6 signalRequestCompletedForRequestId:v4];
}

- (void)_notifyUSTForRequestStarted:(id)a3
{
  id v4 = a3;
  int v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[ADCommandCenter(UnifiedSiriTest) _notifyUSTForRequestStarted:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Notify USTAgent for RequestStarted with requestId '%@'", (uint8_t *)&v7, 0x16u);
  }
  id v6 = [(ADCommandCenter *)self _testAgent];
  [v6 signalRequestStartedWithRequestId:v4];
}

- (void)_notifyUSTForAceCommand:(id)a3
{
  id v4 = a3;
  int v5 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    int v7 = [v4 encodedClassName];
    int v9 = 136315394;
    id v10 = "-[ADCommandCenter(UnifiedSiriTest) _notifyUSTForAceCommand:]";
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Notify USTAgent for AceObject '%@'", (uint8_t *)&v9, 0x16u);
  }
  id v8 = [(ADCommandCenter *)self _testAgent];
  [v8 logAceEvent:v4];
}

- (id)_testAgent
{
  if (!os_variant_allows_internal_security_policies()) {
    goto LABEL_12;
  }
  id v2 = _AFPreferencesValueForKey();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_12:
    id v8 = 0;
    goto LABEL_13;
  }
  *(void *)long long buf = 0;
  if (!sub_100115104())
  {
    id v2 = +[NSAssertionHandler currentHandler];
    id v10 = +[NSString stringWithUTF8String:"void *USTFoundationLibrary(void)"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v10, @"ADCommandCenter_UnifiedSiriTest.m", 19, @"%s", *(void *)buf);

    __break(1u);
    free(v11);
  }
  id v3 = sub_1001151D4();

  if (!v3) {
    goto LABEL_12;
  }
  id v4 = (void *)qword_100585BB0;
  if (!qword_100585BB0)
  {
    id v5 = objc_alloc_init((Class)sub_1001151D4());
    id v6 = (void *)qword_100585BB0;
    qword_100585BB0 = (uint64_t)v5;

    int v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ADCommandCenter(UnifiedSiriTest) _testAgent]";
      __int16 v13 = 2112;
      uint64_t v14 = qword_100585BB0;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s Created %@", buf, 0x16u);
    }
    id v4 = (void *)qword_100585BB0;
  }
  id v8 = v4;
LABEL_13:
  return v8;
}

- (void)appLaunchHandler:(id)a3 didLaunchAppForRequestId:(id)a4
{
  id v5 = a4;
  id v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v12 = "-[ADCommandCenter(NanoServices) appLaunchHandler:didLaunchAppForRequestId:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  int v7 = [(ADCommandCenter *)self _queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100144858;
  v9[3] = &unk_10050E160;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

- (void)taskmaster:(id)a3 didLaunchApplicationForRequestWithId:(id)a4
{
  id v5 = a4;
  id v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v12 = "-[ADCommandCenter(NanoServices) taskmaster:didLaunchApplicationForRequestWithId:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  int v7 = [(ADCommandCenter *)self _queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001449A8;
  v9[3] = &unk_10050E160;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

- (void)taskmaster:(id)a3 didReceivePunchoutOutcome:(id)a4
{
  id v5 = a4;
  id v6 = [(ADCommandCenter *)self _queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100144A68;
  v8[3] = &unk_10050E160;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)_registerNanoServicesWithServiceManager:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(ADSiriAppLaunchRequestHandler);
  [(ADSiriAppLaunchRequestHandler *)v5 setDelegate:self];
  id v6 = [ADServiceCommandType alloc];
  uint64_t v7 = SAAppsGroupIdentifier;
  v144 = [(ADServiceCommandType *)v6 initWithDomainName:SAAppsGroupIdentifier className:SAAppsLaunchAppClassIdentifier];
  id v8 = [ADSiriTaskService alloc];
  id v9 = objc_alloc_init(ADAcePassthroughRequestTransformer);
  id v10 = objc_alloc_init(ADAcePassthroughResponseTransformer);
  __int16 v11 = [(ADSiriTaskService *)v8 initWithCommandType:v144 requestTransformer:v9 responseTransformer:v10 requestHandler:v5];
  [v4 addService:v11];

  id v12 = [ADServiceCommandType alloc];
  v140 = [(ADServiceCommandType *)v12 initWithDomainName:v7 className:SAAppsCheckRestrictionClassIdentifier];
  __int16 v13 = [ADSiriTaskService alloc];
  id v14 = objc_alloc_init(ADAcePassthroughRequestTransformer);
  id v15 = objc_alloc_init(ADAcePassthroughResponseTransformer);
  id v16 = [(ADSiriTaskService *)v13 initWithCommandType:v140 requestTransformer:v14 responseTransformer:v15 requestHandler:v5];
  [v4 addService:v16];

  uint64_t v17 = [ADServiceCommandType alloc];
  id v18 = [(ADServiceCommandType *)v17 initWithDomainName:v7 className:SAAppsGetRestrictedAppsClassIdentifier];
  id v19 = [ADSiriTaskService alloc];
  id v20 = objc_alloc_init(ADAcePassthroughRequestTransformer);
  id v21 = objc_alloc_init(ADAcePassthroughResponseTransformer);
  id v22 = [(ADSiriTaskService *)v19 initWithCommandType:v18 requestTransformer:v20 responseTransformer:v21 requestHandler:v5];
  [v4 addService:v22];

  id v23 = [ADServiceCommandType alloc];
  uint64_t v24 = [(ADServiceCommandType *)v23 initWithDomainName:v7 className:SAAppsAppSearchClassIdentifier];
  id v25 = [ADSiriTaskService alloc];
  id v26 = objc_alloc_init(ADAcePassthroughRequestTransformer);
  id v27 = objc_alloc_init(ADAcePassthroughResponseTransformer);
  uint64_t v28 = [(ADSiriTaskService *)v25 initWithCommandType:v24 requestTransformer:v26 responseTransformer:v27 requestHandler:v5];
  [v4 addService:v28];

  __int16 v29 = +[AFSiriTaskmaster taskmasterForUIApplicationWithBundleIdentifier:@"com.apple.MobileSMS"];
  [v29 setDelegate:self];
  id v30 = objc_alloc_init(ADMessagesTransformer);
  uint64_t v31 = [ADServiceCommandType alloc];
  uint64_t v32 = SASmsGroupIdentifier;
  id v33 = [(ADServiceCommandType *)v31 initWithDomainName:SASmsGroupIdentifier className:SASmsDraftShowClassIdentifier];
  id v34 = [ADSiriTaskService alloc];
  id v35 = objc_alloc_init(ADSiriRequestSucceededResponseTransformer);
  uint64_t v36 = [(ADSiriTaskService *)v34 initWithCommandType:v33 requestTransformer:v30 responseTransformer:v35 requestHandler:v29];
  [v4 addService:v36];

  long long v37 = +[ADServiceCommandType domainObjectCommitTypeForDomainNamed:v32];
  long long v38 = [[ADSiriTaskService alloc] initWithCommandType:v37 requestTransformer:v30 responseTransformer:v30 requestHandler:v29];
  [v4 addService:v38];

  id v39 = [[ADManagedObjectService alloc] initWithDomainName:v32];
  [v4 addService:v39];

  long long v40 = [ADServiceCommandType alloc];
  long long v41 = [(ADServiceCommandType *)v40 initWithDomainName:SACalendarGroupIdentifier className:SACalendarShowNextEventClassIdentifier];
  long long v42 = [ADSiriTaskService alloc];
  long long v43 = objc_alloc_init(ADCalendarTransformer);
  long long v44 = objc_alloc_init(ADCalendarTransformer);
  id v45 = objc_alloc_init(ADShowNextEventRequestHandler);
  id v46 = [(ADSiriTaskService *)v42 initWithCommandType:v41 requestTransformer:v43 responseTransformer:v44 requestHandler:v45];
  [v4 addService:v46];

  __int16 v47 = objc_alloc_init(ADTimerTransformer);
  uint64_t v48 = objc_alloc_init(ADTimerRequestHandler);
  __int16 v49 = [ADServiceCommandType alloc];
  uint64_t v50 = SATimerGroupIdentifier;
  v145 = [(ADServiceCommandType *)v49 initWithDomainName:SATimerGroupIdentifier className:SATimerGetClassIdentifier];
  v51 = [[ADSiriTaskService alloc] initWithCommandType:v145 requestTransformer:v47 responseTransformer:v47 requestHandler:v48];
  [v4 addService:v51];

  id v52 = [ADServiceCommandType alloc];
  v141 = [(ADServiceCommandType *)v52 initWithDomainName:v50 className:SATimerSetClassIdentifier];
  id v53 = [[ADSiriTaskService alloc] initWithCommandType:v141 requestTransformer:v47 responseTransformer:v47 requestHandler:v48];
  [v4 addService:v53];

  id v54 = [ADServiceCommandType alloc];
  v138 = [(ADServiceCommandType *)v54 initWithDomainName:v50 className:SATimerPauseClassIdentifier];
  id v55 = [[ADSiriTaskService alloc] initWithCommandType:v138 requestTransformer:v47 responseTransformer:v47 requestHandler:v48];
  [v4 addService:v55];

  uint64_t v56 = [ADServiceCommandType alloc];
  __int16 v57 = [(ADServiceCommandType *)v56 initWithDomainName:v50 className:SATimerResumeClassIdentifier];
  id v58 = [[ADSiriTaskService alloc] initWithCommandType:v57 requestTransformer:v47 responseTransformer:v47 requestHandler:v48];
  [v4 addService:v58];

  id v59 = [ADServiceCommandType alloc];
  __int16 v60 = [(ADServiceCommandType *)v59 initWithDomainName:v50 className:SATimerCancelClassIdentifier];
  long long v61 = [[ADSiriTaskService alloc] initWithCommandType:v60 requestTransformer:v47 responseTransformer:v47 requestHandler:v48];
  [v4 addService:v61];

  __int16 v62 = [ADServiceCommandType alloc];
  id v63 = [(ADServiceCommandType *)v62 initWithDomainName:v50 className:SATimerDismissClassIdentifier];
  long long v64 = [[ADSiriTaskService alloc] initWithCommandType:v63 requestTransformer:v47 responseTransformer:v47 requestHandler:v48];
  [v4 addService:v64];

  id v65 = +[AFSiriTaskmaster taskmasterForUIApplicationWithBundleIdentifier:@"com.apple.private.NanoTimer"];
  [v65 setDelegate:self];
  long long v66 = [ADServiceCommandType alloc];
  long long v67 = [(ADServiceCommandType *)v66 initWithDomainName:v50 className:SATimerShowTimerAndPerformActionClassIdentifier];
  long long v68 = [[ADSiriTaskService alloc] initWithCommandType:v67 requestTransformer:v47 responseTransformer:v47 requestHandler:v65];
  [v4 addService:v68];

  long long v69 = objc_alloc_init(ADAlarmTransformer);
  id v70 = objc_alloc_init(ADAlarmRequestHandler);
  long long v71 = [ADServiceCommandType alloc];
  uint64_t v72 = SAAlarmGroupIdentifier;
  v146 = [(ADServiceCommandType *)v71 initWithDomainName:SAAlarmGroupIdentifier className:SAAlarmCreateClassIdentifier];
  long long v73 = [[ADSiriTaskService alloc] initWithCommandType:v146 requestTransformer:v69 responseTransformer:v69 requestHandler:v70];
  [v4 addService:v73];

  long long v74 = [ADServiceCommandType alloc];
  v142 = [(ADServiceCommandType *)v74 initWithDomainName:v72 className:SAAlarmUpdateClassIdentifier];
  id v75 = [[ADSiriTaskService alloc] initWithCommandType:v142 requestTransformer:v69 responseTransformer:v69 requestHandler:v70];
  [v4 addService:v75];

  id v76 = [ADServiceCommandType alloc];
  v139 = [(ADServiceCommandType *)v76 initWithDomainName:v72 className:SAAlarmSearchClassIdentifier];
  v77 = [[ADSiriTaskService alloc] initWithCommandType:v139 requestTransformer:v69 responseTransformer:v69 requestHandler:v70];
  [v4 addService:v77];

  v78 = [ADServiceCommandType alloc];
  __int16 v79 = [(ADServiceCommandType *)v78 initWithDomainName:v72 className:SAAlarmDeleteClassIdentifier];
  uint64_t v80 = [[ADSiriTaskService alloc] initWithCommandType:v79 requestTransformer:v69 responseTransformer:v69 requestHandler:v70];
  [v4 addService:v80];

  __int16 v81 = +[AFSiriTaskmaster taskmasterForUIApplicationWithBundleIdentifier:@"com.apple.NanoAlarm"];
  [v81 setDelegate:self];
  id v82 = [ADServiceCommandType alloc];
  __int16 v83 = [(ADServiceCommandType *)v82 initWithDomainName:v72 className:SAAlarmShowAndPerformAlarmActionClassIdentifier];
  id v84 = [[ADSiriTaskService alloc] initWithCommandType:v83 requestTransformer:v69 responseTransformer:v69 requestHandler:v81];
  [v4 addService:v84];

  v85 = [ADServiceCommandType alloc];
  id v86 = [(ADServiceCommandType *)v85 initWithDomainName:v72 className:SAAlarmDismissClassIdentifier];
  v87 = [[ADSiriTaskService alloc] initWithCommandType:v86 requestTransformer:v69 responseTransformer:v69 requestHandler:v70];
  [v4 addService:v87];

  v88 = objc_alloc_init(ADSettingsTransformer);
  v89 = objc_alloc_init(ADSettingsRequestHandler);
  v90 = [ADServiceCommandType alloc];
  uint64_t v91 = SASettingGroupIdentifier;
  v147 = [(ADServiceCommandType *)v90 initWithDomainName:SASettingGroupIdentifier className:SASettingGetAirplaneModeClassIdentifier];
  v92 = [[ADSiriTaskService alloc] initWithCommandType:v147 requestTransformer:v88 responseTransformer:v88 requestHandler:v89];
  [v4 addService:v92];

  v93 = [ADServiceCommandType alloc];
  v143 = [(ADServiceCommandType *)v93 initWithDomainName:v91 className:SASettingSetAirplaneModeClassIdentifier];
  v94 = [[ADSiriTaskService alloc] initWithCommandType:v143 requestTransformer:v88 responseTransformer:v88 requestHandler:v89];
  [v4 addService:v94];

  v95 = [ADServiceCommandType alloc];
  v96 = [(ADServiceCommandType *)v95 initWithDomainName:v91 className:SASettingGetVoiceOverClassIdentifier];
  v97 = [[ADSiriTaskService alloc] initWithCommandType:v96 requestTransformer:v88 responseTransformer:v88 requestHandler:v89];
  [v4 addService:v97];

  v98 = [ADServiceCommandType alloc];
  v99 = [(ADServiceCommandType *)v98 initWithDomainName:v91 className:SASettingSetVoiceOverClassIdentifier];
  v100 = [[ADSiriTaskService alloc] initWithCommandType:v99 requestTransformer:v88 responseTransformer:v88 requestHandler:v89];
  [v4 addService:v100];

  v101 = [ADServiceCommandType alloc];
  v102 = [(ADServiceCommandType *)v101 initWithDomainName:v91 className:SASettingShowAndPerformSettingsActionClassIdentifier];
  v103 = +[AFSiriTaskmaster taskmasterForUIApplicationWithBundleIdentifier:@"com.apple.NanoSettings"];
  [v103 setDelegate:self];
  v104 = [[ADSiriTaskService alloc] initWithCommandType:v102 requestTransformer:v88 responseTransformer:v88 requestHandler:v103];
  [v4 addService:v104];

  v105 = +[AFSiriTaskmaster taskmasterForUIApplicationWithBundleIdentifier:@"com.apple.NanoMaps"];
  [v105 setDelegate:self];
  v106 = objc_alloc_init(ADMapsTransformer);
  v107 = [ADServiceCommandType alloc];
  uint64_t v108 = SALocalSearchGroupIdentifier;
  v109 = [(ADServiceCommandType *)v107 initWithDomainName:SALocalSearchGroupIdentifier className:SALocalSearchShowMapPointsClassIdentifier];
  v110 = [[ADSiriTaskService alloc] initWithCommandType:v109 requestTransformer:v106 responseTransformer:v106 requestHandler:v105];
  [v4 addService:v110];

  v111 = [ADServiceCommandType alloc];
  v112 = [(ADServiceCommandType *)v111 initWithDomainName:v108 className:SALocalSearchNavigationEndClassIdentifier];
  v113 = [[ADSiriTaskService alloc] initWithCommandType:v112 requestTransformer:v106 responseTransformer:v106 requestHandler:v105];
  [v4 addService:v113];

  v114 = [ADServiceCommandType alloc];
  v115 = [(ADServiceCommandType *)v114 initWithDomainName:v108 className:SALocalSearchNavigationPromptManeuverClassIdentifier];
  v116 = [[ADSiriTaskService alloc] initWithCommandType:v115 requestTransformer:v106 responseTransformer:v106 requestHandler:v105];
  [v4 addService:v116];

  v117 = [ADServiceCommandType alloc];
  v118 = [(ADServiceCommandType *)v117 initWithDomainName:v108 className:SALocalSearchShowLocalSearchResultClassIdentifier];
  v119 = [[ADSiriTaskService alloc] initWithCommandType:v118 requestTransformer:v106 responseTransformer:v106 requestHandler:v105];
  [v4 addService:v119];

  v120 = +[AFSiriTaskmaster taskmasterForUIApplicationWithBundleIdentifier:@"com.apple.SessionTrackerApp"];
  [v120 setDelegate:self];
  v121 = objc_alloc_init(ADWorkoutTransformer);
  v122 = [ADServiceCommandType alloc];
  uint64_t v123 = SAHLGroupIdentifier;
  v124 = [(ADServiceCommandType *)v122 initWithDomainName:SAHLGroupIdentifier className:SAHLStartWorkoutClassIdentifier];
  v125 = [[ADSiriTaskService alloc] initWithCommandType:v124 requestTransformer:v121 responseTransformer:v121 requestHandler:v120];
  [v4 addService:v125];

  v126 = [ADServiceCommandType alloc];
  v127 = [(ADServiceCommandType *)v126 initWithDomainName:v123 className:SAHLSetWorkoutStateClassIdentifier];
  v128 = [[ADSiriTaskService alloc] initWithCommandType:v127 requestTransformer:v121 responseTransformer:v121 requestHandler:v120];
  [v4 addService:v128];

  v129 = +[AFSiriTaskmaster taskmasterForUIApplicationWithBundleIdentifier:@"com.apple.ActivityMonitorApp"];
  [v129 setDelegate:self];
  v130 = objc_alloc_init(ADHealthTransformer);
  v131 = [ADServiceCommandType alloc];
  v132 = [(ADServiceCommandType *)v131 initWithDomainName:v123 className:SAHLShowActivityClassIdentifier];
  v133 = [[ADSiriTaskService alloc] initWithCommandType:v132 requestTransformer:v130 responseTransformer:v130 requestHandler:v129];
  [v4 addService:v133];

  id v148 = +[AFSiriTaskmaster taskmasterForUIApplicationWithBundleIdentifier:@"com.apple.NanoMail"];
  [v148 setDelegate:self];
  v134 = objc_alloc_init(ADMailTransformer);
  v135 = [ADServiceCommandType alloc];
  v136 = [(ADServiceCommandType *)v135 initWithDomainName:SAEmailGroupIdentifier className:SAEmailSendClassIdentifier];
  v137 = [[ADSiriTaskService alloc] initWithCommandType:v136 requestTransformer:v134 responseTransformer:v134 requestHandler:v148];
  [v4 addService:v137];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseModeProvider, 0);
  objc_storeStrong((id *)&self->_clientBoundCommandLookup, 0);
  objc_storeStrong((id *)&self->_serverBoundCommandLookup, 0);
  objc_storeStrong((id *)&self->_requestDispatcherService, 0);
  objc_storeStrong((id *)&self->_uiBridgeServiceListener, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_sharedDataService, 0);
  objc_storeStrong((id *)&self->_partialResultAcousticIDTimer, 0);
  objc_storeStrong((id *)&self->_acousticIDHelper, 0);
  objc_storeStrong((id *)&self->_verificationHelper, 0);
  objc_storeStrong((id *)&self->_outstandingSyncVerificationRequestID, 0);
  objc_storeStrong((id *)&self->_syncMetadata, 0);
  objc_storeStrong((id *)&self->_syncAnchorsRequestQueue, 0);
  objc_storeStrong((id *)&self->_outstandingSyncPromiseID, 0);
  objc_storeStrong((id *)&self->_outstandingSyncPromiseKeys, 0);
  objc_storeStrong((id *)&self->_outstandingSyncChunks, 0);
  objc_storeStrong((id *)&self->_outstandingAnchorsRequests, 0);
  objc_destroyWeak((id *)&self->_syncDelegate);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_lastClearContext, 0);
  objc_storeStrong((id *)&self->_contextManager, 0);
  objc_storeStrong((id *)&self->_serviceMaintenanceGroup, 0);
  objc_storeStrong((id *)&self->_accountStoreQueue, 0);
  objc_storeStrong((id *)&self->_vtStateManagerAccessQueue, 0);
  objc_storeStrong((id *)&self->_offlineMetricsManager, 0);
  objc_storeStrong((id *)&self->_requestStatistics, 0);
  objc_storeStrong((id *)&self->_experimentationAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_cachedConfidenceScoresFromRemote, 0);
  objc_storeStrong((id *)&self->_selectedSharedUserID, 0);
  objc_storeStrong(&self->_multilingualSpeechRecognizedCommandHandler, 0);
  objc_storeStrong((id *)&self->_languageDetectionWaitTimer, 0);
  objc_storeStrong((id *)&self->_awdRequestRecord, 0);
  objc_storeStrong((id *)&self->_awdSiriSession, 0);
  objc_storeStrong((id *)&self->_queuedOutputVoice, 0);
  objc_storeStrong((id *)&self->_queuedLanguageCode, 0);
  objc_storeStrong((id *)&self->_callTransaction, 0);
  objc_storeStrong((id *)&self->_callTransactionUUID, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->_firstChanceServices, 0);
  objc_storeStrong((id *)&self->_deferredRequestEndIdentifier, 0);
  objc_storeStrong(&self->_requestEndCompletion, 0);
  objc_storeStrong((id *)&self->_clientConfiguration, 0);
  objc_storeStrong((id *)&self->_shutdownAssertions, 0);
  objc_storeStrong((id *)&self->_remoteExecutionContextsByExecutionID, 0);
  objc_storeStrong((id *)&self->_mostRecentVisibleRemoteExecutionContext, 0);
  objc_storeStrong((id *)&self->_rootExecutionContextsByRequestID, 0);
  objc_storeStrong((id *)&self->_mostRecentRootExecutionContext, 0);
  objc_storeStrong((id *)&self->_executionDevicesByExecutionID, 0);
  objc_storeStrong((id *)&self->_postCommandHandlingBlockMap, 0);
  objc_storeStrong((id *)&self->_handledCommandIdsByRequestId, 0);
  objc_storeStrong((id *)&self->_aceCompletionMap, 0);
  objc_storeStrong((id *)&self->_outstandingRequestIds, 0);
  objc_storeStrong((id *)&self->_speechRequestGroup, 0);
  objc_storeStrong((id *)&self->_selectedResultCandidate, 0);
  objc_storeStrong((id *)&self->_currentUodStatus, 0);
  objc_storeStrong((id *)&self->_pronunciationContext, 0);
  objc_storeStrong((id *)&self->_associatedRequestId, 0);
  objc_storeStrong((id *)&self->_lastRequest, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_currentRequestInfo, 0);
  objc_storeStrong((id *)&self->_finishSpeechCommand, 0);
  objc_storeStrong((id *)&self->_speechRecognitionResultUUID, 0);
  objc_storeStrong((id *)&self->_startSpeechCommand, 0);
  objc_storeStrong((id *)&self->_currentSpeechRequestOptions, 0);
  objc_storeStrong(&self->_requestBarrier, 0);
  objc_storeStrong(&self->_speechCompletion, 0);
  objc_storeStrong((id *)&self->_speechCapturingContextsBySessionUUID, 0);
  objc_storeStrong((id *)&self->_speechCapturingContextSessionUUID, 0);
  objc_storeStrong((id *)&self->_vtInCallDiscoverabilitySignalManager, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_deviceResolutionServiceListener, 0);
  objc_storeStrong((id *)&self->_carPlayAnnouncementRequestCapabilityManager, 0);
  objc_storeStrong((id *)&self->_headphonesAnnouncementRequestCapabilityManager, 0);
  objc_storeStrong((id *)&self->_flowServiceListener, 0);
  objc_storeStrong((id *)&self->_deviceRouter, 0);
  objc_storeStrong((id *)&self->_requestDelayManager, 0);
  objc_storeStrong((id *)&self->_deviceSyncCoordinator, 0);
  objc_storeStrong((id *)&self->_remoteSpeechRequestHelper, 0);
  objc_storeStrong((id *)&self->_remoteRequestHelper, 0);
  objc_storeStrong((id *)&self->_powerAssertionManager, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_resultObjectCache, 0);
  objc_storeStrong((id *)&self->_domainObjectCache, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_speechManager, 0);
  objc_storeStrong((id *)&self->_diagnosticsManager, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_fauxUIService, 0);
  objc_storeStrong((id *)&self->_uiService, 0);
  objc_storeStrong((id *)&self->_requestAssertion, 0);
  objc_storeStrong((id *)&self->_requestGroup, 0);
  objc_storeStrong((id *)&self->_speechFileDelegate, 0);
  objc_storeStrong((id *)&self->_speechDelegate, 0);
  objc_storeStrong(&self->_requestCompletion, 0);
  objc_storeStrong((id *)&self->_requestDelegate, 0);
  objc_storeStrong((id *)&self->_currentClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_setResponseModeProvider:(id)a3
{
}

- (ADResponseModeProvider)_responseModeProvider
{
  return self->_responseModeProvider;
}

- (void)set_clientBoundCommandLookup:(id)a3
{
}

- (NSMapTable)_clientBoundCommandLookup
{
  return self->_clientBoundCommandLookup;
}

- (void)set_serverBoundCommandLookup:(id)a3
{
}

- (NSMapTable)_serverBoundCommandLookup
{
  return self->_serverBoundCommandLookup;
}

- (void)_setRequestDispatcherService:(id)a3
{
}

- (void)set_uiBridgeServiceListener:(id)a3
{
}

- (AFBridgeConnectionListener)_uiBridgeServiceListener
{
  return self->_uiBridgeServiceListener;
}

- (BOOL)_assetsCheckRan
{
  return self->_assetsCheckRan;
}

- (void)_setSiriSAESupported:(BOOL)a3
{
  self->_siriSAESupported = a3;
}

- (BOOL)_siriSAESupported
{
  return self->_siriSAESupported;
}

- (void)_setSiriHybridUODSupported:(BOOL)a3
{
  self->_siriHybridUODSupported = a3;
}

- (BOOL)_siriHybridUODSupported
{
  return self->_siriHybridUODSupported;
}

- (void)_setSiriFullUODSupported:(BOOL)a3
{
  self->_siriFullUODSupported = a3;
}

- (BOOL)_siriFullUODSupported
{
  return self->_siriFullUODSupported;
}

- (void)_setSiriUODSupported:(BOOL)a3
{
  self->_siriUODSupported = a3;
}

- (BOOL)_siriUODSupported
{
  return self->_siriUODSupported;
}

- (AFInstanceContext)_instanceContext
{
  return self->_instanceContext;
}

- (NSString)_selectedSharedUserID
{
  return self->_selectedSharedUserID;
}

- (BOOL)_isTimeoutSuspended
{
  return self->_isTimeoutSuspended;
}

- (BOOL)_isWatchAuthenticated
{
  return self->_isWatchAuthenticated;
}

- (BOOL)_isHeadGestureRecognitionAvailable
{
  return self->_isHeadGestureRecognitionAvailable;
}

- (BOOL)_isInCarDNDMode
{
  return self->_isInCarDNDMode;
}

- (BOOL)_isInStarkMode
{
  return self->_isInStarkMode;
}

- (BOOL)_deviceIsLocked
{
  return self->_deviceIsLocked;
}

- (BOOL)_speechDelegateHasReceivedPartialResult
{
  return self->_speechDelegateHasReceivedPartialResult;
}

- (ADCommandCenterSpeechDelegate)_speechFileDelegate
{
  return self->_speechFileDelegate;
}

- (ADCommandCenterSpeechDelegate)_speechDelegate
{
  return self->_speechDelegate;
}

- (ADCommandCenterRequestDelegate)_requestDelegate
{
  return self->_requestDelegate;
}

- (ADCommandCenterClient)_currentClient
{
  return self->_currentClient;
}

- (void)_setLastRequest:(id)a3
{
}

- (SABaseCommand)_lastRequest
{
  return self->_lastRequest;
}

- (ADCommandCenterCurrentRequest)_currentRequest
{
  return self->_currentRequest;
}

- (OS_dispatch_queue)_queue
{
  return self->_queue;
}

- (BOOL)_isServerBoundCommand:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMapTable *)self->_serverBoundCommandLookup objectForKey:objc_opt_class()];
  id v6 = v5;
  if (v5)
  {
    LOBYTE(v7) = [v5 BOOLValue];
  }
  else
  {
    id v7 = [v4 conformsToProtocol:&OBJC_PROTOCOL___SAServerBoundCommand];
    serverBoundCommandLookup = self->_serverBoundCommandLookup;
    id v9 = +[NSNumber numberWithBool:v7];
    [(NSMapTable *)serverBoundCommandLookup setObject:v9 forKey:objc_opt_class()];
  }
  return (char)v7;
}

- (BOOL)_isClientBoundCommand:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMapTable *)self->_clientBoundCommandLookup objectForKey:objc_opt_class()];
  id v6 = v5;
  if (v5)
  {
    LOBYTE(v7) = [v5 BOOLValue];
  }
  else
  {
    id v7 = [v4 conformsToProtocol:&OBJC_PROTOCOL___SAClientBoundCommand];
    clientBoundCommandLookup = self->_clientBoundCommandLookup;
    id v9 = +[NSNumber numberWithBool:v7];
    [(NSMapTable *)clientBoundCommandLookup setObject:v9 forKey:objc_opt_class()];
  }
  return (char)v7;
}

- (id)_fetchComputedModeAndUpdateRequestDelegate
{
  id v3 = [(ADResponseModeProvider *)self->_responseModeProvider fetchCurrentMode];
  if (self->_requestDelegate && (objc_opt_respondsToSelector() & 1) != 0) {
    [(ADCommandCenterRequestDelegate *)self->_requestDelegate adRequestDidUpdateResponseMode:v3];
  }
  return v3;
}

- (unsigned)_sharedVoiceAudioSessionID
{
  id v2 = +[ADSpeechManager sharedManager];
  id v3 = [v2 audioSessionController];
  unsigned int v4 = [v3 getAudioSessionID];

  return v4;
}

- (id)_approximatePreviousTTSInterval:(id)a3
{
  id v4 = a3;
  id v5 = [(AFSpeechRequestOptions *)self->_currentSpeechRequestOptions speechSynthesisRecord];
  id v6 = v5;
  if (!v5) {
    goto LABEL_17;
  }
  [v5 beginTimestamp];
  uint64_t Milliseconds = AFMachAbsoluteTimeGetMilliseconds();
  [v6 endTimestamp];
  uint64_t v8 = AFMachAbsoluteTimeGetMilliseconds();
  id v9 = [(AFSpeechRequestOptions *)self->_currentSpeechRequestOptions activationEventMachAbsoluteTime];
  currentSpeechRequestOptions = self->_currentSpeechRequestOptions;
  if (v9)
  {
    [(AFSpeechRequestOptions *)currentSpeechRequestOptions activationEventMachAbsoluteTime];
    uint64_t v11 = AFMachAbsoluteTimeGetMilliseconds();
    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
    [(AFSpeechRequestOptions *)currentSpeechRequestOptions activationEventTime];
    if (v12 <= 0.0) {
      goto LABEL_17;
    }
    [(AFSpeechRequestOptions *)self->_currentSpeechRequestOptions activationEventTime];
    uint64_t v11 = (uint64_t)(v13 * 1000.0);
    if (!v11) {
      goto LABEL_17;
    }
  }
  if (Milliseconds < 1)
  {
    uint64_t v14 = 0;
    goto LABEL_11;
  }
  uint64_t v14 = v11 - Milliseconds;
  if (v4)
  {
    id v15 = +[NSNumber numberWithLongLong:v11 - Milliseconds];
    [v4 setDurationSincePreviousTTSStart:v15];

LABEL_11:
    if (v8 <= 0) {
      goto LABEL_17;
    }
    if (v4)
    {
      id v16 = +[NSNumber numberWithLongLong:v11 - v8];
      [v4 setDurationSincePreviousTTSFinish:v16];
    }
    if (Milliseconds < 1) {
      goto LABEL_17;
    }
LABEL_15:
    uint64_t v17 = v8 - Milliseconds;
    id v18 = +[NSDate dateWithTimeIntervalSinceNow:(double)-v14 / 1000.0];
    id v19 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v18 duration:(double)v17 / 1000.0];

    goto LABEL_18;
  }
  if (v8 > 0) {
    goto LABEL_15;
  }
LABEL_17:
  id v19 = 0;
LABEL_18:

  return v19;
}

- (id)_bargeInModes
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(AFSpeechRequestOptions *)self->_currentSpeechRequestOptions bargeInOptions];
  if (!v4) {
    goto LABEL_7;
  }
  char v5 = (char)v4;
  if ((v4 & 4) == 0)
  {
    if ((v4 & 1) == 0) {
      goto LABEL_4;
    }
LABEL_11:
    [v3 addObject:SASBargeInModeOVER_MEDIAValue];
    if ((v5 & 0x10) == 0)
    {
LABEL_5:
      if ((v5 & 8) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
    goto LABEL_12;
  }
  [v3 addObject:SASBargeInModeOVER_SIRI_OUTPUTValue];
  if (v5) {
    goto LABEL_11;
  }
LABEL_4:
  if ((v5 & 0x10) == 0) {
    goto LABEL_5;
  }
LABEL_12:
  [v3 addObject:SASBargeInModeOVER_TIMERValue];
  if ((v5 & 8) != 0) {
LABEL_6:
  }
    [v3 addObject:SASBargeInModeOVER_ALARMValue];
LABEL_7:
  return v3;
}

- (void)_listInstalledServicesWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001B4C90;
  v7[3] = &unk_10050E188;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)_broadcastCommand:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v15 = self;
  char v5 = [(ADCommandCenter *)self _serviceManager];
  id v6 = [v5 allServices];

  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v12 = [v4 groupIdentifier];
          double v13 = [v4 refId];
          uint64_t v14 = [(ADCommandCenter *)v15 _rootExecutionContextForRequestID:v13];
          [v11 handleCommand:v4 forDomain:v12 executionContext:v14 reply:0];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

- (void)adviseSessionArbiterToContinueWithPreviousWinner:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001B5228;
  v4[3] = &unk_10050CD50;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)_removeAllSpeechCapturingContexts
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[ADCommandCenter _removeAllSpeechCapturingContexts]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }
  [(ADCommandCenter *)self _setSpeechCapturingContext:0];
  speechCapturingContextsBySessionUUID = self->_speechCapturingContextsBySessionUUID;
  self->_speechCapturingContextsBySessionUUID = 0;

  speechCapturingContextSessionUUID = self->_speechCapturingContextSessionUUID;
  self->_speechCapturingContextSessionUUID = 0;

  if (!AFIsInternalInstall() || (_AFPreferencesKeepRecorededAudioFiles() & 1) == 0)
  {
    id v6 = +[NSFileManager defaultManager];
    id v7 = CSSiriSpeechRecordingTrimmedAudioDirectoryPath();
    [v6 removeItemAtPath:v7 error:0];

    id v8 = +[NSFileManager defaultManager];
    uint64_t v9 = CSSiriSpeechRecordingRecordedAudioDirectoryPath();
    [v8 removeItemAtPath:v9 error:0];
  }
}

- (id)_speechCapturingContextForSessionUUID:(id)a3
{
  if (a3)
  {
    id v4 = -[NSMutableDictionary objectForKey:](self->_speechCapturingContextsBySessionUUID, "objectForKey:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)_setSpeechCapturingContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315394;
    id v15 = "-[ADCommandCenter _setSpeechCapturingContext:]";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s speechCapturingContext = %@", (uint8_t *)&v14, 0x16u);
  }
  id v6 = [(ADCommandCenter *)self _speechCapturingContext];
  [v6 resignCurrent];

  if (v4)
  {
    id v7 = [v4 sessionUUID];
    speechCapturingContextsBySessionUUID = self->_speechCapturingContextsBySessionUUID;
    if (!speechCapturingContextsBySessionUUID)
    {
      uint64_t v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      int v10 = self->_speechCapturingContextsBySessionUUID;
      self->_speechCapturingContextsBySessionUUID = v9;

      speechCapturingContextsBySessionUUID = self->_speechCapturingContextsBySessionUUID;
    }
    [(NSMutableDictionary *)speechCapturingContextsBySessionUUID setObject:v4 forKey:v7];
    uint64_t v11 = (NSString *)[v7 copy];
    speechCapturingContextSessionUUID = self->_speechCapturingContextSessionUUID;
    self->_speechCapturingContextSessionUUID = v11;
  }
  else
  {
    id v7 = self->_speechCapturingContextSessionUUID;
    self->_speechCapturingContextSessionUUID = 0;
  }

  double v13 = [(ADCommandCenter *)self _speechCapturingContext];
  [v13 becomeCurrent];
}

- (id)_speechCapturingContext
{
  return [(ADCommandCenter *)self _speechCapturingContextForSessionUUID:self->_speechCapturingContextSessionUUID];
}

- (void)getRecordedAudioDirectoryPathsWithCompletion:(id)a3
{
  if (a3)
  {
    uint64_t v3 = (void (**)(id, void *, void))a3;
    id v4 = CSSiriSpeechRecordingRecordedAudioDirectoryPath();
    v7[0] = v4;
    BOOL v5 = CSSiriSpeechRecordingTrimmedAudioDirectoryPath();
    v7[1] = v5;
    id v6 = +[NSArray arrayWithObjects:v7 count:2];

    v3[2](v3, v6, 0);
  }
}

- (void)_trimRecordedAudioWithIdentifier:(id)a3 offset:(double)a4 duration:(double)a5 outputFileType:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  if (v13)
  {
    int v14 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136316162;
      id v22 = "-[ADCommandCenter _trimRecordedAudioWithIdentifier:offset:duration:outputFileType:completion:]";
      __int16 v23 = 2112;
      double v24 = *(double *)&v12;
      __int16 v25 = 2048;
      double v26 = a4;
      __int16 v27 = 2048;
      double v28 = a5;
      __int16 v29 = 2048;
      int64_t v30 = a6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s identifier = %@, offset = %f, duration = %f, outputFileType = %ld", buf, 0x34u);
      int v14 = AFSiriLogContextDaemon;
    }
    double v15 = fmax(a4, 0.0);
    if (a5 <= 0.0) {
      a5 = 60.0;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315650;
      id v22 = "-[ADCommandCenter _trimRecordedAudioWithIdentifier:offset:duration:outputFileType:completion:]";
      __int16 v23 = 2048;
      double v24 = v15;
      __int16 v25 = 2048;
      double v26 = a5;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s offset = %f, duration = %f (effective)", buf, 0x20u);
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1001B5808;
    v16[3] = &unk_100506890;
    double v18 = v15;
    double v19 = a5;
    int64_t v20 = a6;
    id v17 = v13;
    [(ADCommandCenter *)self _accessRecordedAudioWithIdentifier:v12 completion:v16];
  }
}

- (void)trimRecordedAudioWithIdentifier:(id)a3 offset:(double)a4 duration:(double)a5 outputFileType:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  queue = self->_queue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001B6BDC;
  v17[3] = &unk_100506868;
  void v17[4] = self;
  id v18 = v12;
  double v20 = a4;
  double v21 = a5;
  int64_t v22 = a6;
  id v19 = v13;
  id v15 = v13;
  id v16 = v12;
  dispatch_async(queue, v17);
}

- (void)_accessRecordedAudioWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = (NSString *)a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      id v16 = "-[ADCommandCenter _accessRecordedAudioWithIdentifier:completion:]";
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s identifier = %@", buf, 0x16u);
    }
    if (!v6) {
      id v6 = self->_speechCapturingContextSessionUUID;
    }
    uint64_t v9 = [(ADCommandCenter *)self _speechCapturingContextForSessionUUID:v6];
    int v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v16 = "-[ADCommandCenter _accessRecordedAudioWithIdentifier:completion:]";
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s speechCapturingContext = %@", buf, 0x16u);
      if (v9) {
        goto LABEL_8;
      }
    }
    else if (v9)
    {
LABEL_8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1001B6E6C;
      v13[3] = &unk_100506840;
      void v13[4] = self;
      id v14 = v7;
      [(NSString *)v9 acquireRecordedAudioWithHandler:v13];

LABEL_13:
      goto LABEL_14;
    }
    uint64_t v11 = +[AFError errorWithCode:225 description:@"Unable to locate recorded audio because there's no active speech request and speech request id is not specified."];
    id v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v16 = "-[ADCommandCenter _accessRecordedAudioWithIdentifier:completion:]";
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
    }
    (*((void (**)(id, void, NSString *))v7 + 2))(v7, 0, v11);

    goto LABEL_13;
  }
LABEL_14:
}

- (void)accessRecordedAudioWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B70EC;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_setSiriOutputVolume:(float)a3 forAudioRoute:(id)a4 operationType:(int64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315906;
    __int16 v23 = "-[ADCommandCenter _setSiriOutputVolume:forAudioRoute:operationType:completion:]";
    __int16 v24 = 2048;
    double v25 = a3;
    __int16 v26 = 2112;
    id v27 = v10;
    __int16 v28 = 2048;
    int64_t v29 = a5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s volume = %f, routeName = %@, operationType = %ld", buf, 0x2Au);
  }
  id v13 = [(ADCommandCenter *)self _speechManager];
  id v14 = [v13 volumeServiceProvider];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001B72A8;
  v17[3] = &unk_100506818;
  float v21 = a3;
  id v19 = v11;
  int64_t v20 = a5;
  id v18 = v10;
  id v15 = v11;
  id v16 = v10;
  [v14 getVolumeServiceUsingBlock:v17];
}

- (void)setSiriOutputVolume:(float)a3 forAudioRoute:(id)a4 operationType:(int64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B7698;
  block[3] = &unk_1005067F0;
  float v19 = a3;
  void block[4] = self;
  id v16 = v10;
  id v17 = v11;
  int64_t v18 = a5;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(queue, block);
}

- (void)_getSiriOutputVolumeForAudioRoute:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v17 = "-[ADCommandCenter _getSiriOutputVolumeForAudioRoute:completion:]";
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s routeName = %@", buf, 0x16u);
  }
  id v9 = [(ADCommandCenter *)self _speechManager];
  id v10 = [v9 volumeServiceProvider];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001B7820;
  v13[3] = &unk_1005067C8;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [v10 getVolumeServiceUsingBlock:v13];
}

- (void)getSiriOutputVolumeForAudioRoute:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B7C08;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)announceNotificationHandlingStateUpdatedToState:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001B7C8C;
  v4[3] = &unk_10050D8C0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)getAccessoryInfoForAccessoryWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001B7E78;
  v11[3] = &unk_10050E188;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);
}

- (void)getSpeakerCapabilityForAccessoryWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001B7F90;
  v11[3] = &unk_10050E188;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);
}

- (void)pushSCDAAdvertisementContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B80AC;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)pushMyriadAdvertisementContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B8234;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (id)_assetManager
{
  return self->_assetManager;
}

- (id)_requestDispatcherSessionConfiguration
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001B8394;
  v4[3] = &unk_1005067A0;
  v4[4] = self;
  id v2 = [objc_alloc((Class)SMTRequestDispatcherSessionConfiguration) initWithBuilder:v4];
  return v2;
}

- (id)_createDefaultRequestContextData:(BOOL)a3
{
  BOOL v5 = [(ADCommandCenter *)self _fetchComputedModeAndUpdateRequestDelegate];
  id v6 = objc_alloc((Class)SMTRequestContextData);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001B8584;
  v10[3] = &unk_100506778;
  id v11 = v5;
  id v12 = self;
  BOOL v13 = a3;
  id v7 = v5;
  id v8 = [v6 initWithBuilder:v10];

  return v8;
}

- (id)_startServerRequestWithStartRequest:(id)a3 requestInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v62 = "-[ADCommandCenter _startServerRequestWithStartRequest:requestInfo:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (!self->_siriUODSupported && ([v6 isMemberOfClass:objc_opt_class()] & 1) == 0)
  {
    int64_t v30 = (void *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
LABEL_15:
      id v9 = 0;
      goto LABEL_21;
    }
    id v9 = v30;
    id v55 = [v6 aceId];
    uint64_t v56 = [v6 encodedClassName];
    *(_DWORD *)long long buf = 136315650;
    __int16 v62 = "-[ADCommandCenter _startServerRequestWithStartRequest:requestInfo:]";
    __int16 v63 = 2112;
    long long v64 = v55;
    __int16 v65 = 2112;
    long long v66 = v56;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s UOD is not supported and request %@ is of type %@ so must be handled on server", buf, 0x20u);

LABEL_29:
    goto LABEL_15;
  }
  id v9 = [(ADCommandCenter *)self _createStartServerRequestWithStartRequest:v6];
  id v10 = [v7 speechRequestOptions];
  id v11 = [v10 activationEvent];

  if (!self->_siriUODSupported)
  {
    BOOL v14 = v11 == (id)17;
    id v15 = [(ADCommandCenter *)self _requestDispatcherService];
    id v16 = [(ADCommandCenter *)self _requestDispatcherSessionConfiguration];
    id v17 = [v6 aceId];
    __int16 v18 = [v6 origin];
    id v19 = [v6 utterance];
    int64_t v20 = [(ADCommandCenter *)self _createDefaultRequestContextData:v14];
    [v15 startUnderstandingOnServerTextRequestWithConfiguration:v16 requestId:v17 inputOrigin:v18 utterance:v19 requestContextData:v20];

    float v21 = [v6 aceId];
    [(ADCommandCenter *)self _emitDeviceDynamicContextForRequest:v21];
    goto LABEL_10;
  }
  id v12 = [v7 testRequestOptions];
  id v13 = [v12 requestPath];

  if (v13 == (id)1)
  {
    [v9 setTextRequest:0];
    [(ADCommandCenter *)self _signalUSTTestRequestWithStartRequest:v6 requestInfo:v7];
    if (!v9) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v58 = [(ADCommandCenter *)self _fetchComputedModeAndUpdateRequestDelegate];
    id v59 = [(ADCommandCenter *)self _createDefaultRequestContextData:v11 == (id)17];
    id v22 = v6;
    __int16 v23 = [(ADCommandCenter *)self _requestDispatcherService];
    [(ADCommandCenter *)self _requestDispatcherSessionConfiguration];
    __int16 v24 = v57 = v9;
    double v25 = [v22 aceId];
    __int16 v26 = [v22 origin];
    id v27 = [v22 utterance];
    __int16 v28 = [v22 directAction];
    [v22 requestExecutionParameters];
    v29 = id v60 = v7;
    [v23 startDirectActionRequestWithConfiguration:v24 requestId:v25 inputOrigin:v26 utterance:v27 directAction:v28 requestExecutionParameters:v29 requestContextData:v59];

    id v9 = v57;
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ([v6 isMemberOfClass:objc_opt_class()])
    {
      float v21 = [(ADCommandCenter *)self _createDefaultRequestContextData:v11 == (id)17];
      [(ADCommandCenter *)self _requestDispatcherService];
      v41 = id v40 = v7;
      long long v42 = [(ADCommandCenter *)self _requestDispatcherSessionConfiguration];
      long long v43 = [v6 aceId];
      long long v44 = [v6 origin];
      id v45 = [v6 utterance];
      [v41 startTextRequestWithConfiguration:v42 requestId:v43 inputOrigin:v44 utterance:v45 requestContextData:v21];

      id v46 = [v6 aceId];
      [(ADCommandCenter *)self _emitDeviceDynamicContextForRequest:v46];

      id v7 = v40;
LABEL_10:

      if (!v9) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
    __int16 v47 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v48 = v7;
      __int16 v49 = v47;
      uint64_t v50 = [v6 encodedClassName];
      *(_DWORD *)long long buf = 136315394;
      __int16 v62 = "-[ADCommandCenter _startServerRequestWithStartRequest:requestInfo:]";
      __int16 v63 = 2112;
      long long v64 = v50;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "%s Request type %@ unsupported on Siri X UOD. Support might come soon", buf, 0x16u);

      id v7 = v48;
    }
    goto LABEL_29;
  }
  id v60 = v7;
  id v58 = [(ADCommandCenter *)self _fetchComputedModeAndUpdateRequestDelegate];
  id v59 = [(ADCommandCenter *)self _createDefaultRequestContextData:v11 == (id)17];
  id v22 = v6;
  uint64_t v31 = [(ADCommandCenter *)self _requestDispatcherService];
  uint64_t v32 = [(ADCommandCenter *)self _requestDispatcherSessionConfiguration];
  id v33 = [v22 aceId];
  id v34 = [v22 origin];
  id v35 = [v22 utterance];
  uint64_t v36 = [v22 previousUtterance];
  [v31 startCorrectionSpeechRequestWithConfiguration:v32 requestId:v33 inputOrigin:v34 utterance:v35 previousUtterance:v36 requestContextData:v59];

LABEL_18:
  long long v37 = [v22 aceId];

  [(ADCommandCenter *)self _emitDeviceDynamicContextForRequest:v37];
  id v7 = v60;

  if (!v9) {
    goto LABEL_21;
  }
LABEL_19:
  long long v38 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v51 = v7;
    id v52 = v38;
    id v53 = [v6 encodedClassName];
    id v54 = [v6 aceId];
    *(_DWORD *)long long buf = 136315650;
    __int16 v62 = "-[ADCommandCenter _startServerRequestWithStartRequest:requestInfo:]";
    __int16 v63 = 2112;
    long long v64 = v53;
    __int16 v65 = 2112;
    long long v66 = v54;
    _os_log_debug_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "%s Replaced current request %@ %@ with an SARDStartServerRequest", buf, 0x20u);

    id v7 = v51;
  }
LABEL_21:

  return v9;
}

- (id)_createStartServerRequestWithStartRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)SARDStartServerRequest);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    id v7 = objc_alloc_init((Class)SARDStartCorrectedServerRequest);
    id v8 = [v6 interactionId];
    [v7 setInteractionIdToBeCorrected:v8];

    id v9 = [v6 utterance];

    [v7 setUtteranceToBeCorrected:v9];
    id v5 = v7;
  }
  id v10 = [v4 aceId];
  [v5 setAceId:v10];

  [v5 setTextRequest:1];
  id v11 = [v4 origin];
  [v5 setInputOrigin:v11];

  id v12 = [v4 origin];
  [v5 setOrigin:v12];

  id v13 = [(ADCommandCenter *)self _motionManager];
  BOOL v14 = [v13 motionConfidence];
  [v5 setMotionConfidence:v14];

  id v15 = [v13 motionActivity];
  [v5 setMotionActivity:v15];

  objc_msgSend(v5, "setTextToSpeechIsMuted:", -[ADCommandCenterClient adTextToSpeechIsMuted](self->_currentClient, "adTextToSpeechIsMuted"));
  id v16 = [v4 turnId];
  [v5 setTurnId:v16];

  objc_msgSend(v5, "setEyesFree:", objc_msgSend(v4, "eyesFree"));
  if (AFIsInternalInstall())
  {
    id v17 = +[NSNumber numberWithBool:byte_100585E38];
    [v5 setIsCarryDevice:v17];
  }
  return v5;
}

- (id)_startServerRequestWithSpeechRequest:(id)a3 recordingContext:(id)a4 recordingInfo:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)SARDStartServerRequest);
  id v12 = [v9 sessionUUID];

  [v11 setAceId:v12];
  [v11 setTextRequest:0];
  id v13 = [(ADCommandCenter *)self _motionManager];
  BOOL v14 = [v13 motionConfidence];
  [v11 setMotionConfidence:v14];

  id v15 = [v13 motionActivity];
  [v11 setMotionActivity:v15];

  objc_msgSend(v11, "setTextToSpeechIsMuted:", -[ADCommandCenterClient adTextToSpeechIsMuted](self->_currentClient, "adTextToSpeechIsMuted"));
  id v16 = [v10 voiceTriggerEventInfo];
  [v11 setVoiceTriggerEventInfo:v16];

  id v17 = [(ADCommandCenter *)self _fetchComputedModeAndUpdateRequestDelegate];
  [v11 setResponseMode:v17];
  objc_msgSend(v11, "ad_setAFSpeechRequestOptions:", self->_currentSpeechRequestOptions);
  objc_msgSend(v11, "ad_setCSSiriRecordingInfo:", v8);

  __int16 v18 = [v10 bargeInModes];
  [v11 setBargeInModes:v18];

  id v19 = [v10 durationSincePreviousTTSStart];
  [v11 setDurationSincePreviousTTSStart:v19];

  int64_t v20 = [v10 durationSincePreviousTTSFinish];

  [v11 setDurationSincePreviousTTSFinish:v20];
  if (AFIsInternalInstall())
  {
    float v21 = +[NSNumber numberWithBool:byte_100585E38];
    [v11 setIsCarryDevice:v21];
  }
  return v11;
}

- (id)_createMuxStartAsrOnServerRequestWithSpeechRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)SASMUXStartAsrOnServerRequest);
  objc_msgSend(v5, "setTextToSpeechIsMuted:", -[ADCommandCenterClient adTextToSpeechIsMuted](self->_currentClient, "adTextToSpeechIsMuted"));
  id v6 = [v4 bargeInModes];
  [v5 setBargeInModes:v6];

  objc_msgSend(v5, "setAutoPunctuationEnabled:", objc_msgSend(v4, "autoPunctuationEnabled"));
  id v7 = [v4 clientModelVersion];

  [v5 setClientModelVersion:v7];
  return v5;
}

- (void)dictationRequestDidCompleteRecognitionWithError:(id)a3 secureOfflineOnlyRecognition:(BOOL)a4 sessionUUID:(id)a5 statistics:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B9470;
  block[3] = &unk_100506058;
  void block[4] = self;
  id v18 = v12;
  BOOL v21 = a4;
  id v19 = v10;
  id v20 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  dispatch_async(queue, block);
}

- (void)dictationRequestDidRecognizePackage:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001B98A8;
  v15[3] = &unk_10050DC68;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)dictationRequestDidRecognizeVoiceCommandCandidatePackage:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001BA460;
  v15[3] = &unk_10050DC68;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)dictationRequestDidRecognizeFinalResultCandidatePackage:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BA82C;
  block[3] = &unk_10050DCB8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)dictationRequestDidRecognizePartialPackage:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001BAC24;
  v15[3] = &unk_10050DC68;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)dictationRequestDidRecognizeTokens:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001BAFD0;
  v15[3] = &unk_10050DC68;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)notifySpeechDetectedIsUndirected
{
  uint64_t v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADCommandCenter notifySpeechDetectedIsUndirected]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s MAF: Obtained undirected speech decision from SRD.", (uint8_t *)&v4, 0xCu);
  }
  dispatch_async((dispatch_queue_t)self->_queue, &stru_100506640);
}

- (void)handleSpeechRecognized:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v16 = "-[ADCommandCenter handleSpeechRecognized:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BB4C4;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

- (void)handleSpeechServerEndpointIdentified:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v16 = "-[ADCommandCenter handleSpeechServerEndpointIdentified:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BB694;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

- (void)selectResultWithResultCandidate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v16 = "-[ADCommandCenter selectResultWithResultCandidate:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BB7F0;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

- (void)shutdownSessionIfIdle
{
  uint64_t v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v7 = "-[ADCommandCenter shutdownSessionIfIdle]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BB900;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)releaseShutdownAssertion:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v12 = "-[ADCommandCenter releaseShutdownAssertion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001BBA34;
  v8[3] = &unk_10050E160;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (id)acquireShutdownAssertion
{
  uint64_t v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v13 = "-[ADCommandCenter acquireShutdownAssertion]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v4 = +[NSUUID UUID];
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001BBB88;
  v10[3] = &unk_10050E160;
  void v10[4] = self;
  id v6 = v4;
  id v11 = v6;
  dispatch_async(queue, v10);
  id v7 = v11;
  id v8 = v6;

  return v8;
}

- (void)cancelCurrentRequestForReason:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001BBC60;
  v4[3] = &unk_10050D8C0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)cancelCurrentRequest
{
}

- (void)updateSpeechSynthesisRecord:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001BBD18;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)handleAceCommand:(id)a3 afterCurrentRequest:(BOOL)a4 waitForResponse:(BOOL)a5 withDelegate:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BBE68;
  block[3] = &unk_100506620;
  void block[4] = self;
  id v20 = v12;
  BOOL v23 = a4;
  BOOL v24 = a5;
  id v21 = v13;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(queue, block);
}

- (void)getDeferredObjectsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BBF44;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)prepareForShutdown
{
  dispatch_group_t v3 = dispatch_group_create();
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001BC008;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  dispatch_group_t v8 = v3;
  id v5 = v3;
  dispatch_group_async(v5, queue, v7);
  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  dispatch_group_wait(v5, v6);
}

- (void)getOfflineDictationStatusIgnoringCache:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BC1F4;
  block[3] = &unk_10050D378;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)extendRequestTimeoutBy:(double)a3 forRequestID:(id)a4
{
  id v6 = a4;
  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315650;
    id v14 = "-[ADCommandCenter extendRequestTimeoutBy:forRequestID:]";
    __int16 v15 = 2048;
    double v16 = a3;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s durationInSeconds: %f, requestID: %@", buf, 0x20u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BC3A0;
  block[3] = &unk_10050E278;
  void block[4] = self;
  id v11 = v6;
  double v12 = a3;
  id v9 = v6;
  dispatch_async(queue, block);
}

- (BOOL)isTimeoutSuspended
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001BC55C;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)handleCommand:(id)a3 completion:(id)a4
{
}

- (void)handleCommand:(id)a3 withExecutionContextMatchingInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    id v21 = "-[ADCommandCenter handleCommand:withExecutionContextMatchingInfo:completion:]";
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s command = %@, executionInfoToMatch = %@", buf, 0x20u);
  }
  queue = self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001BC704;
  v16[3] = &unk_10050E228;
  void v16[4] = self;
  id v17 = v9;
  id v18 = v8;
  id v19 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  dispatch_async(queue, v16);
}

- (void)areAnnouncementRequestsPermittedByPresentationWhileActiveWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001BC8A0;
  v7[3] = &unk_10050E188;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)isWatchAuthenticatedWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001BC980;
  v7[3] = &unk_10050E188;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)isHeadGestureRecognitionAvailable
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001BCA44;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)isHeadGestureRecognitionAvailableWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001BCAF0;
  v7[3] = &unk_10050E188;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)isInCarDNDMode
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001BCBB4;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)isInCarDNDModeWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001BCC60;
  v7[3] = &unk_10050E188;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)isInStarkMode
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001BCD24;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isDeviceShowingLockScreen
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001BCDE4;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isDeviceLocked
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001BCEA4;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)failedToLaunchAppWithBundleIdentifier:(id)a3
{
}

- (void)willProcessAppLaunchWithBundleIdentifier:(id)a3
{
}

- (void)dismissAssistantWithReason:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001BCF3C;
  v4[3] = &unk_10050D8C0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)dismissAssistant
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BCFBC;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)openURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BD08C;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)openApplicationWithBundleID:(id)a3 URL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001BD180;
  v15[3] = &unk_10050E228;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)reloadServiceForNotification:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001BD250;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeService:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001BD354;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addService:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001BD440;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)clientDisconnected:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001BD52C;
  v7[3] = &unk_10050E160;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)clientConnected:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001BD9F8;
  v7[3] = &unk_10050E160;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)fetchContextForApplicationInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BDD7C;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)setManagedStoreObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BDF44;
  block[3] = &unk_10050DCB8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)fetchManagedStoreObjectForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BE01C;
  block[3] = &unk_10050E1D8;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)rescheduleValidationRefresh
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BE108;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)refreshAssistantValidation
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BE184;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)destroyActiveAccount
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BE200;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)setActiveAccountIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001BE2A0;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)fetchActiveAccountIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001BE344;
  v7[3] = &unk_10050E188;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)getAssistantIdentifier
{
  char v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADCommandCenter getAssistantIdentifier]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1001BE52C;
  id v11 = sub_1001BE53C;
  id v12 = 0;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001BE544;
  v7[3] = &unk_10050D5F0;
  void v7[4] = self;
  void v7[5] = &buf;
  dispatch_sync(queue, v7);
  id v5 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v5;
}

- (void)fetchActiveAccount:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001BE644;
  v7[3] = &unk_10050E188;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)deleteAccountWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001BE750;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)fetchAccounts:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001BE7F4;
  v7[3] = &unk_10050E188;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)fetchSupportedLanguages
{
}

- (void)fetchSupportedLanguagesWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001BE908;
  v7[3] = &unk_10050E188;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)sendMetricsToServerWithTimeout:(double)a3 requiresUnlimitedPower:(BOOL)a4 requiresActiveSession:(BOOL)a5 purgesOversizedStorage:(BOOL)a6 ignoresMetricsSenderDisabledSetting:(BOOL)a7 scheduledActivity:(BOOL)a8 completion:(id)a9
{
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1001BEBFC;
  v35[3] = &unk_10050D0D0;
  id v16 = a9;
  id v36 = v16;
  id v17 = objc_retainBlock(v35);
  if (a7
    || (+[ADPreferences sharedPreferences],
        id v18 = objc_claimAutoreleasedReturnValue(),
        unsigned int v19 = [v18 metricsSenderDisabled],
        v18,
        !v19))
  {
    if (AFHasUnlockedSinceBoot())
    {
      __int16 v22 = +[AFPreferences sharedPreferences];
      unsigned int v23 = [v22 isDictationHIPAACompliant];

      if (!v23)
      {
        __int16 v24 = +[NSProcessInfo processInfo];
        [v24 systemUptime];
        double v26 = v25 + a3;

        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1001BEC64;
        block[3] = &unk_1005065F8;
        void block[4] = self;
        double v30 = v26;
        BOOL v31 = a4;
        BOOL v32 = a5;
        BOOL v33 = a6;
        BOOL v34 = a8;
        int64_t v29 = v17;
        dispatch_async(queue, block);

        goto LABEL_13;
      }
      id v20 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        long long v38 = "-[ADCommandCenter sendMetricsToServerWithTimeout:requiresUnlimitedPower:requiresActiveSession:purgesOversi"
              "zedStorage:ignoresMetricsSenderDisabledSetting:scheduledActivity:completion:]";
        id v21 = "%s Skipped sending metrics to server because we have HIPAA On-Device Dictation enabled.";
        goto LABEL_11;
      }
    }
    else
    {
      id v20 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        long long v38 = "-[ADCommandCenter sendMetricsToServerWithTimeout:requiresUnlimitedPower:requiresActiveSession:purgesOversi"
              "zedStorage:ignoresMetricsSenderDisabledSetting:scheduledActivity:completion:]";
        id v21 = "%s Skipped sending metrics to server because the device has not been unlocked since boot.";
        goto LABEL_11;
      }
    }
  }
  else
  {
    id v20 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      long long v38 = "-[ADCommandCenter sendMetricsToServerWithTimeout:requiresUnlimitedPower:requiresActiveSession:purgesOversize"
            "dStorage:ignoresMetricsSenderDisabledSetting:scheduledActivity:completion:]";
      id v21 = "%s Skipped sending metrics to server because metrics sender is disabled.";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v21, buf, 0xCu);
    }
  }
  ((void (*)(void *))v17[2])(v17);
LABEL_13:
}

- (void)requestBarrierIfNecessary:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001BED20;
  v7[3] = &unk_10050E188;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)requestBarrier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001BEDC4;
  v7[3] = &unk_10050E188;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)telephonyRequestCompleted
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BEE44;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)prepareForPhoneCall
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BEEC0;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)getOriginDeviceInfoForContextIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BEF8C;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)getDeviceContextsForKeys:(id)a3 forRequestID:(id)a4 includesNearbyDevices:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BF398;
  block[3] = &unk_100509CF0;
  id v18 = v11;
  unsigned int v19 = self;
  BOOL v22 = a5;
  id v20 = v10;
  id v21 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async(queue, block);
}

- (void)getCrossDeviceContextWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001BF4D4;
  v7[3] = &unk_10050E188;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)getCurrentContextSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001BF694;
  v7[3] = &unk_10050E188;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setAlertContextDirty
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BF75C;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)setApplicationContextForApplicationInfos:(id)a3 withRefId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BF828;
  block[3] = &unk_10050DCB8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)setOverriddenApplicationContext:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BF8FC;
  block[3] = &unk_10050DCB8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)fetchAppicationContextForApplicationInfo:(id)a3 supplementalContext:(id)a4 refID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001BF9F0;
  v15[3] = &unk_10050DC68;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)setApplicationContext:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001BFA98;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)willSetApplicationContextWithRefId:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001BFB3C;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)rollbackClearContext
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BFBBC;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)clearContext
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BFC38;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)handleGenericAceCommand:(id)a3 withDelegate:(id)a4 interruptOutstandingRequest:(BOOL)a5 targetReplyQueue:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  queue = self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001BFD64;
  v21[3] = &unk_1005065D0;
  v21[4] = self;
  id v22 = v12;
  BOOL v26 = a5;
  id v24 = v14;
  id v25 = v15;
  id v23 = v13;
  id v17 = v14;
  id v18 = v15;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(queue, v21);
}

- (void)suppressLowStorageNotificationForLanguage:(id)a3 suppress:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001BFFB0;
  v9[3] = &unk_10050CD50;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10
{
  id v32 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C01B4;
  block[3] = &unk_1005065A8;
  void block[4] = self;
  id v34 = v32;
  id v35 = v16;
  id v36 = v17;
  id v37 = v18;
  id v38 = v19;
  id v39 = v20;
  id v40 = v21;
  id v41 = v22;
  id v24 = v22;
  id v25 = v21;
  id v26 = v20;
  id v27 = v19;
  id v28 = v18;
  id v29 = v17;
  id v30 = v16;
  id v31 = v32;
  dispatch_async(queue, block);
}

- (void)resumeRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001C02D4;
  v15[3] = &unk_10050DC68;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)pauseRecognition
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C0358;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C0424;
  block[3] = &unk_10050DCB8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)sendSpeechCorrectionInfo:(id)a3 forCorrectionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C04F8;
  block[3] = &unk_10050DCB8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)prepareForStartPlaybackWithDestination:(int64_t)a3 intent:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001C05DC;
  v13[3] = &unk_10050C278;
  id v15 = v9;
  int64_t v16 = a3;
  void v13[4] = self;
  id v14 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(queue, v13);
}

- (void)handleFailedStartPlaybackWithDestination:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C0A6C;
  block[3] = &unk_10050C148;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)setSuppressAudioInterruptionEndedNotifications:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001C0BB4;
  v4[3] = &unk_10050CD50;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

- (void)updateSpeechOptions:(id)a3 forDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C0D78;
  block[3] = &unk_10050DCB8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)cancelSpeechForDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001C0E20;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)stopSpeechWithOptions:(id)a3 forDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C0EF0;
  block[3] = &unk_10050DCB8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001C0F98;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)sendEngagementFeedback:(int64_t)a3 voiceQueryIdentifier:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C104C;
  block[3] = &unk_10050E278;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)startDictationWithURL:(id)a3 isNarrowBand:(BOOL)a4 language:(id)a5 options:(id)a6 sessionUUID:(id)a7 delegate:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C119C;
  block[3] = &unk_100506558;
  void block[4] = self;
  id v26 = v14;
  BOOL v31 = a4;
  id v27 = v15;
  id v28 = v16;
  id v29 = v17;
  id v30 = v18;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  dispatch_async(queue, block);
}

- (void)addRecordedSpeechSampleData:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C1278;
  block[3] = &unk_10050DCB8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)startRecordedDictationWithLanguage:(id)a3 options:(id)a4 sessionUUID:(id)a5 narrowband:(BOOL)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  queue = self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001C13A0;
  v21[3] = &unk_100509A60;
  v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  BOOL v26 = a6;
  id v25 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(queue, v21);
}

- (void)startDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 sessionUUID:(id)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  queue = self->_queue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001C14F0;
  void v23[3] = &unk_100506008;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(queue, v23);
}

- (void)startRecordingForPendingDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 sessionUUID:(id)a6 delegate:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C1660;
  block[3] = &unk_100507D58;
  void block[4] = self;
  id v28 = v14;
  id v29 = v15;
  id v30 = v16;
  id v31 = v17;
  id v32 = v18;
  id v33 = v19;
  id v21 = v19;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  id v25 = v15;
  id v26 = v14;
  dispatch_async(queue, block);
}

- (void)rollbackRequestForDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001C1710;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)cancelRequestForDelegate:(id)a3 reason:(int64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001C17E4;
  v13[3] = &unk_10050DD08;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)startSpeechRequestWithURL:(id)a3 isNarrowBand:(BOOL)a4 withDelegate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001C18C0;
  v13[3] = &unk_10050CAD0;
  void v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)startAcousticIDRequestWithDelegate:(id)a3 withOptions:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001C19BC;
  v15[3] = &unk_10050DC68;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)startSpeechPronunciationRequestWithDelegate:(id)a3 withOptions:(id)a4 pronunciationContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001C1AB0;
  v15[3] = &unk_10050DC68;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)startRecordingForPendingSpeechRequestForDelegate:(id)a3 withOptions:(id)a4 sessionUUID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  kdebug_trace();
  id v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v26 = "-[ADCommandCenter startRecordingForPendingSpeechRequestForDelegate:withOptions:sessionUUID:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  sub_1001C1C7C(v11);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C1DAC;
  block[3] = &unk_10050D3F0;
  void block[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  dispatch_async(queue, block);
}

- (void)startSpeechRequestWithDelegate:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  kdebug_trace();
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v16 = "-[ADCommandCenter startSpeechRequestWithDelegate:withOptions:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  sub_1001C1C7C(v7);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C26EC;
  block[3] = &unk_10050DCB8;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

- (void)handleRemoteSpeechRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C2808;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)handleExternalActivationRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C28DC;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)startRequest:(id)a3 withDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C29B0;
  block[3] = &unk_10050DCB8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)endSessionForDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001C2A58;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setConfiguration:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C2B28;
  block[3] = &unk_10050DCB8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)setModesConfiguration:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001C2BD0;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setCarDNDActive:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001C2C54;
  v4[3] = &unk_10050CD50;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)setWatchAuthenticated:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001C2CDC;
  v4[3] = &unk_10050CD50;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)setHeadphonesAuthenticated:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001C2D64;
  v4[3] = &unk_10050CD50;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)setLockState:(BOOL)a3 showingLockScreen:(BOOL)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001C2DF0;
  v5[3] = &unk_100505AD0;
  v5[4] = self;
  BOOL v6 = a3;
  BOOL v7 = a4;
  dispatch_async(queue, v5);
}

- (void)_clearQueuedOutputVoice
{
  if (self->_hasQueuedOutputVoice)
  {
    char v3 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      queuedOutputVoice = self->_queuedOutputVoice;
      int v6 = 136315394;
      BOOL v7 = "-[ADCommandCenter _clearQueuedOutputVoice]";
      __int16 v8 = 2112;
      id v9 = queuedOutputVoice;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Ignoring queued output voice: %@", (uint8_t *)&v6, 0x16u);
    }
    BOOL v5 = self->_queuedOutputVoice;
    self->_queuedOutputVoice = 0;

    self->_hasQueuedOutputVoice = 0;
  }
}

- (void)_processQueuedOutputVoice
{
  if (self->_hasQueuedOutputVoice)
  {
    char v3 = self->_queuedOutputVoice;
    queuedOutputVoice = self->_queuedOutputVoice;
    self->_queuedOutputVoice = 0;

    self->_hasQueuedOutputVoice = 0;
    BOOL v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315394;
      BOOL v7 = "-[ADCommandCenter _processQueuedOutputVoice]";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v6, 0x16u);
    }
    [(ADCommandCenter *)self _setLanguageCode:@"ADLanguageCodeKeepSame" outputVoice:v3];
  }
}

- (void)setQueuedOutputVoice:(id)a3
{
  id v4 = a3;
  BOOL v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v11 = "-[ADCommandCenter setQueuedOutputVoice:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001C3108;
  v8[3] = &unk_10050E160;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)_processQueuedLanguageCodeAndOutputVoice
{
  if (self->_hasQueuedLanguageCode)
  {
    if (self->_hasQueuedOutputVoice)
    {
      char v3 = self->_queuedLanguageCode;
      queuedLanguageCode = self->_queuedLanguageCode;
      self->_queuedLanguageCode = 0;

      self->_hasQueuedLanguageCode = 0;
      BOOL v5 = self->_queuedOutputVoice;
      queuedOutputVoice = self->_queuedOutputVoice;
      self->_queuedOutputVoice = 0;

      self->_hasQueuedOutputVoice = 0;
      id v7 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v8 = 136315650;
        id v9 = "-[ADCommandCenter _processQueuedLanguageCodeAndOutputVoice]";
        __int16 v10 = 2112;
        id v11 = v3;
        __int16 v12 = 2112;
        id v13 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %@ %@", (uint8_t *)&v8, 0x20u);
      }
      [(ADCommandCenter *)self _setLanguageCode:v3 outputVoice:v5];
    }
    else
    {
      [(ADCommandCenter *)self _processQueuedLanguageCode];
    }
  }
  else if (self->_hasQueuedOutputVoice)
  {
    [(ADCommandCenter *)self _processQueuedOutputVoice];
  }
}

- (void)setQueuedLanguageCode:(id)a3 andQueuedOutputVoice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    id v16 = "-[ADCommandCenter setQueuedLanguageCode:andQueuedOutputVoice:]";
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C3478;
  block[3] = &unk_10050DCB8;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

- (void)_clearQueuedLanguageCode
{
  if (self->_hasQueuedLanguageCode)
  {
    char v3 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      queuedLanguageCode = self->_queuedLanguageCode;
      int v6 = 136315394;
      id v7 = "-[ADCommandCenter _clearQueuedLanguageCode]";
      __int16 v8 = 2112;
      id v9 = queuedLanguageCode;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Ignoring queued language code: %@", (uint8_t *)&v6, 0x16u);
    }
    BOOL v5 = self->_queuedLanguageCode;
    self->_queuedLanguageCode = 0;

    self->_hasQueuedLanguageCode = 0;
  }
}

- (void)_processQueuedLanguageCode
{
  if (self->_hasQueuedLanguageCode)
  {
    char v3 = self->_queuedLanguageCode;
    queuedLanguageCode = self->_queuedLanguageCode;
    self->_queuedLanguageCode = 0;

    self->_hasQueuedLanguageCode = 0;
    BOOL v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315394;
      id v7 = "-[ADCommandCenter _processQueuedLanguageCode]";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v6, 0x16u);
    }
    [(ADCommandCenter *)self _setLanguageCode:v3 outputVoice:0];
  }
}

- (void)setQueuedLanguageCode:(id)a3
{
  id v4 = a3;
  BOOL v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v11 = "-[ADCommandCenter setQueuedLanguageCode:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001C37F0;
  v8[3] = &unk_10050E160;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)setOutputVoice:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C3914;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)setOutputVoice:(id)a3
{
}

- (void)setLanguageCodeIfNeeded
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C3A44;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_setLanguageCodeIfNeeded
{
  char v3 = +[AFPreferences sharedPreferences];
  if ([v3 assistantIsEnabled])
  {
    id v4 = [v3 _languageCodeWithFallback:0];
    BOOL v5 = [v3 _outputVoiceWithFallback:0];
    id v6 = [v5 languageCode];
    unsigned __int8 v7 = [v6 isEqualToString:v4];

    if (![v4 length] || (v7 & 1) == 0)
    {
      id v8 = [v3 languageCode];
      if (!v8) {
        id v8 = AFDefaultLanguageCode;
      }
      id v9 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v10 = 136315394;
        id v11 = "-[ADCommandCenter _setLanguageCodeIfNeeded]";
        __int16 v12 = 2112;
        id v13 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s No language code saved, but Assistant is enabled - saving language: %@", (uint8_t *)&v10, 0x16u);
      }
      [(ADCommandCenter *)self _setLanguageCode:v8 outputVoice:0 isDefaultValue:1 withCompletion:0];
    }
  }
}

- (void)setLanguageCode:(id)a3 outputVoice:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001C3CB8;
  v15[3] = &unk_10050E228;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)_setLanguageCode:(id)a3 outputVoice:(id)a4 isDefaultValue:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [v10 length];
  id v14 = +[AFPreferences sharedPreferences];
  id v15 = v14;
  if (v13
    || ([v14 languageCode],
        id v16 = objc_claimAutoreleasedReturnValue(),
        id v17 = [v16 length],
        v16,
        v17))
  {
    id v18 = v10;
    if (([v18 isEqualToString:@"ADLanguageCodeKeepSame"] & 1) == 0)
    {
      __int16 v19 = +[AFPreferences sharedPreferences];
      uint64_t v20 = [v19 bestSupportedLanguageCodeForLanguageCode:v18];

      id v18 = (id)v20;
    }
    [(ADCommandCenter *)self _setLanguageCode:v18 outputVoice:v11 isDefaultValue:v7];
    [(ADCommandCenter *)self _clearQueuedLanguageCode];
    [(ADCommandCenter *)self _clearQueuedOutputVoice];
    if (!v11)
    {
      [v15 setInProgressOutputVoice:0];
      [v15 synchronize];
    }
  }
  else
  {
    id v21 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v22 = 136315138;
      id v23 = "-[ADCommandCenter _setLanguageCode:outputVoice:isDefaultValue:withCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s Ignoring attempt to set the language based on current system config, because we already have a language code saved.", (uint8_t *)&v22, 0xCu);
    }
  }
  if (v12) {
    (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
  }
}

- (void)setLanguageCode:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C3F78;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)setDictationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v8 = "-[ADCommandCenter setDictationEnabled:]";
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s %d", buf, 0x12u);
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001C4130;
  v5[3] = &unk_1005064A8;
  BOOL v6 = v3;
  sub_1001C4190(v5);
}

- (void)setAssistantEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v15 = "-[ADCommandCenter setAssistantEnabled:]";
    __int16 v16 = 1024;
    LODWORD(v17) = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %d", buf, 0x12u);
  }
  [(ADCommandCenter *)self _createAssistantLocallyIfNeeded:v3];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001C4814;
  v11[3] = &unk_1005064A8;
  BOOL v12 = v3;
  sub_1001C4190(v11);
  if (v3)
  {
    +[ADLocationManager prepareForAssistantEnablementInBackground];
  }
  else
  {
    BOOL v6 = sub_1001FD4FC(@"session_did_finish_timestamp");
    id v7 = +[NSFileManager defaultManager];
    id v13 = 0;
    unsigned __int8 v8 = [v7 removeItemAtPath:v6 error:&v13];
    id v9 = v13;
    if ((v8 & 1) == 0 && (AFIsFileNotFoundError() & 1) == 0)
    {
      BOOL v10 = AFSiriLogContextUtility;
      if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315650;
        id v15 = "ADClearTimestampForFileName";
        __int16 v16 = 2112;
        id v17 = v6;
        __int16 v18 = 2112;
        id v19 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Failed to remove timestamp at %@: %@", buf, 0x20u);
      }
    }
  }
}

- (void)_downloadMorphunAssets:(id)a3
{
  if (a3)
  {
    BOOL v3 = +[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:");
    id v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      id v11 = "-[ADCommandCenter _downloadMorphunAssets:]";
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Starting Morphun assets download for %@", buf, 0x16u);
    }
    BOOL v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    BOOL v6 = dispatch_queue_create("(ADCommandCenter) _downloadMorphunAssets", v5);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001C4A04;
    block[3] = &unk_10050E138;
    id v9 = v3;
    id v7 = v3;
    dispatch_async(v6, block);
  }
}

- (void)forceAudioSessionInactiveWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C4D38;
  block[3] = &unk_10050C148;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)forceAudioSessionActiveWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C4E0C;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)preheatServicesForDomain:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001C4EB4;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)preheatWithRecordDeviceIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C5004;
  block[3] = &unk_10050E138;
  id v9 = v4;
  dispatch_async(v5, block);

  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001C5198;
  v7[3] = &unk_10050E138;
  void v7[4] = self;
  dispatch_async(queue, v7);
}

- (void)preheatWithStyle:(int64_t)a3 forOptions:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3 != 2 || v8)
  {
    if (a3 != 4 || v8)
    {
      id v11 = v8;
      if (a3 == 3) {
        goto LABEL_11;
      }
      goto LABEL_8;
    }
    uint64_t v10 = 13;
  }
  else
  {
    uint64_t v10 = 8;
  }
  id v11 = [objc_alloc((Class)AFSpeechRequestOptions) initWithActivationEvent:v10];
LABEL_8:
  id v12 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v25 = "_ADPreheatSpeechWithStyle";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Preheating speech manager", buf, 0xCu);
  }
  id v13 = +[ADSpeechManager sharedManager];
  [v13 preheatWithOptions:v11];
  [v13 preheatRecognizerWithOptions:v11];

LABEL_11:
  if (AFIsNano())
  {
    BOOL v14 = (a3 & 0xFFFFFFFFFFFFFFFBLL) == 0 || a3 == 2;
    if (v14 && v11)
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001C5448;
      block[3] = &unk_10050E138;
      void block[4] = self;
      dispatch_async(queue, block);
    }
  }
  __int16 v16 = self->_queue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001C5450;
  v19[3] = &unk_10050C278;
  void v19[4] = self;
  id v20 = v11;
  id v21 = v9;
  int64_t v22 = a3;
  id v17 = v9;
  id v18 = v11;
  dispatch_async(v16, v19);
}

- (void)defrost
{
}

- (void)_removeDelegate:(id)a3
{
  id v4 = a3;
  BOOL v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v9 = "-[ADCommandCenter _removeDelegate:]";
    __int16 v10 = 2048;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  [(ADCommandCenter *)self _reallyEndSessionForDelegate:v4];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C55A8;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)startCloudKitSyncWeeklyForActivity:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C567C;
  block[3] = &unk_10050E138;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (void)setSyncDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001C57EC;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)syncAnchorKeys:(id)a3 forceReset:(BOOL)a4 reasons:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001C58C4;
  v13[3] = &unk_10050CAD0;
  void v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (id)_managedStoreObjectForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ADCommandCenter *)self _domainObjectCache];
  id v6 = [v5 domainObjectForKey:v4];

  return v6;
}

- (void)_setManagedStoreObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ADCommandCenter *)self _domainObjectCache];
  [v8 setDomainObject:v7 forKey:v6];
}

- (void)_handleRemoteSpeechRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v24 = "-[ADCommandCenter _handleRemoteSpeechRequest:completion:]";
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  id v9 = +[AFAnalytics sharedAnalytics];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001C5C34;
  v21[3] = &unk_10050E0C8;
  id v22 = v6;
  id v10 = v6;
  [v9 logEventWithType:120 contextProvider:v21];

  id v11 = [(ADCommandCenter *)self _remoteSpeechRequestHelper];
  id v12 = [v11 setSpeechRequestOptions:v10 withCompletion:v7];
  id v13 = +[ADDaemon sharedDaemon];
  [v13 startUISpeechRequest];

  dispatch_time_t v14 = dispatch_time(0, 5000000000);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C5C3C;
  block[3] = &unk_10050E160;
  id v19 = v12;
  id v20 = v11;
  id v16 = v11;
  id v17 = v12;
  dispatch_after(v14, queue, block);
}

- (void)_openURL:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void))a4;
  currentClient = self->_currentClient;
  if (currentClient)
  {
    [(ADCommandCenterClient *)currentClient adRequestRequestedOpenURL:v8 completion:v6];
  }
  else if (v6)
  {
    v6[2](v6, 0);
  }
}

- (void)_handleIntent:(id)a3 inBackgroundAppWithBundleId:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315394;
    id v13 = "-[ADCommandCenter _handleIntent:inBackgroundAppWithBundleId:reply:]";
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v12, 0x16u);
  }
  id v11 = +[AFSiriActivationConnection sharedConnection];
  [v11 handleIntent:v7 inBackgroundAppWithBundleId:v8 reply:v9];
}

- (void)_handleExternalActivationRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void))a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v41 = "-[ADCommandCenter _handleExternalActivationRequest:completion:]";
    __int16 v42 = 2112;
    id v43 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  id v9 = +[AFAnalytics sharedAnalytics];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1001C6328;
  v38[3] = &unk_10050E0C8;
  id v10 = v6;
  id v39 = v10;
  [v9 logEventWithType:122 contextProvider:v38];

  id v11 = [v10 speechRequestOptions];
  int v12 = [v10 handoffURLString];

  if (v12)
  {
    id v13 = objc_alloc((Class)NSURL);
    __int16 v14 = [v10 handoffURLString];
    id v15 = [v13 initWithString:v14];
    id v16 = sub_1001FC3D8(v15);

    if (v7) {
      v7[2](v7, v16, 0);
    }
  }
  else
  {
    id v17 = [(ADCommandCenter *)self _remoteRequestHelper];
    [v17 setRemoteRequestInfo:v10];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1001C6330;
    v35[3] = &unk_10050E160;
    id v36 = v11;
    id v18 = v10;
    id v37 = v18;
    id v19 = objc_retainBlock(v35);
    if ([v18 handoffRequiresUserInteraction])
    {
      if (v7) {
        v7[2](v7, (id)1, 0);
      }
      id v20 = [v17 userNotificationRequestForRemoteRequest];
      id v21 = +[ADUserNotificationServiceProvider personalDomainNotificationProvider];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1001C64A4;
      v33[3] = &unk_100506488;
      id v34 = v19;
      [v21 postNotificationRequest:v20 options:1 responseHandler:v33];

      id v22 = [v20 identifier];

      double v23 = 185.0;
    }
    else
    {
      [v17 setCompletion:v7];
      ((void (*)(void *))v19[2])(v19);
      id v22 = 0;
      double v23 = 5.0;
    }
    dispatch_time_t v24 = dispatch_time(0, (uint64_t)(v23 * 1000000000.0));
    queue = self->_queue;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    void v28[2] = sub_1001C6524;
    v28[3] = &unk_10050DD08;
    id v29 = v18;
    id v30 = v17;
    double v32 = v23;
    id v31 = v22;
    id v26 = v22;
    id v27 = v17;
    dispatch_after(v24, queue, v28);
  }
}

- (void)_rescheduleValidationRefresh
{
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    __int16 v14 = "-[ADCommandCenter _rescheduleValidationRefresh]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v13, 0xCu);
  }
  id v4 = +[AFPreferences sharedPreferences];
  if ([v4 assistantIsEnabled])
  {

LABEL_6:
    id v7 = [(ADCommandCenter *)self _account];
    id v8 = [v7 validationExpiration];

    if (v8)
    {
      [v8 timeIntervalSinceNow];
      if (v9 < 0.0) {
        double v10 = 0.0;
      }
      else {
        double v10 = v9;
      }
    }
    else
    {
      double v10 = 0.0;
    }
    id v11 = +[ADDaemon sharedDaemon];
    [v11 scheduleValidationRefreshForInterval:v10];

    return;
  }
  BOOL v5 = +[AFPreferences sharedPreferences];
  unsigned __int8 v6 = [v5 dictationIsEnabled];

  if (v6) {
    goto LABEL_6;
  }
  int v12 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    __int16 v14 = "-[ADCommandCenter _rescheduleValidationRefresh]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Ignoring reschedule refresh request because assistant isn't enabled", (uint8_t *)&v13, 0xCu);
  }
}

- (void)_refreshAssistantValidation
{
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    unsigned __int8 v6 = "-[ADCommandCenter _refreshAssistantValidation]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  id v4 = [(ADCommandCenter *)self _sessionManager];
  [v4 refreshValidationData];
}

- (void)_postWatchNotificationWithContext:(id)a3 withError:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  if (v5)
  {
    CFStringRef v6 = [v10 errorTitle];
    CFStringRef v7 = [v10 errorBody];
    [v10 errorButtonText];
  }
  else
  {
    CFStringRef v6 = [v10 successTitle];
    CFStringRef v7 = [v10 successBody];
    [v10 successButtonText];
  }
  CFStringRef v8 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  CFStringRef v9 = v8;
  if (v6 && v7 && v8)
  {
    CFUserNotificationDisplayNotice(0.0, 3uLL, 0, 0, 0, v6, v7, v8);
  }
  else if (!v6)
  {
    goto LABEL_10;
  }
  CFRelease(v6);
LABEL_10:
  if (v7) {
    CFRelease(v7);
  }
  if (v9) {
    CFRelease(v9);
  }
}

- (void)_deleteSiriAudioDataOnDevice
{
  id v2 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADCommandCenter _deleteSiriAudioDataOnDevice]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  BOOL v3 = dispatch_get_global_queue(-2, 0);
  dispatch_async(v3, &stru_100506418);
}

- (void)_deleteSiriHistoryOnDeviceOnDestroyAssistant
{
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    CFStringRef v7 = "-[ADCommandCenter _deleteSiriHistoryOnDeviceOnDestroyAssistant]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  [(ADCommandCenter *)self _deleteSiriAudioDataOnDevice];
  int v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    CFStringRef v7 = "-[ADCommandCenter _deleteSiriHistoryOnDeviceOnDestroyAssistant]";
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s #RPI skipping SADeleteAssistantHistory because it is redundant with SADestroyAssistant.", (uint8_t *)&v6, 0xCu);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kAFSiriAndDictationHistoryDeletionRequestedDarwinNotification, 0, 0, 1u);
  sub_1001C6DE8(0);
}

- (void)_deleteSiriHistoryWithContext:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADCommandCenter _deleteSiriHistoryWithContext:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&buf, 0xCu);
  }
  [(ADCommandCenter *)self _deleteSiriAudioDataOnDevice];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v46 = 0x3032000000;
  __int16 v47 = sub_1001BE52C;
  id v48 = sub_1001BE53C;
  id v49 = 0;
  objc_initWeak(&location, self);
  id v9 = objc_alloc((Class)AFOneArgumentSafetyBlock);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1001C74F8;
  v35[3] = &unk_1005063F8;
  id v10 = v6;
  id v36 = v10;
  objc_copyWeak(&v39, &location);
  p_long long buf = &buf;
  id v11 = v7;
  id v37 = v11;
  int v12 = +[AFError errorWithCode:0 description:@"Completion block was dropped unexpectedly."];
  id v13 = [v9 initWithBlock:v35 defaultValue:v12];

  id v14 = objc_alloc((Class)AFWatchdogTimer);
  id v15 = dispatch_get_global_queue(33, 0);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1001C7730;
  v33[3] = &unk_10050E138;
  id v16 = v13;
  id v34 = v16;
  id v17 = [v14 initWithTimeoutInterval:v15 onQueue:v33 timeoutHandler:20.0];
  id v18 = *(void **)(*((void *)&buf + 1) + 40);
  *(void *)(*((void *)&buf + 1) + 40) = v17;

  [*(id *)(*((void *)&buf + 1) + 40) start];
  id v19 = objc_alloc_init((Class)SADeleteAssistantHistory);
  id v20 = objc_alloc_init((Class)NSUUID);
  id v21 = [v20 UUIDString];
  [v19 setAceId:v21];

  id v22 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id v41 = 136315394;
    __int16 v42 = "-[ADCommandCenter _deleteSiriHistoryWithContext:withCompletion:]";
    __int16 v43 = 2112;
    id v44 = v19;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s request = %@", v41, 0x16u);
  }
  double v23 = +[ADCommandCenter sharedCommandCenter];
  dispatch_time_t v24 = [v23 _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C7798;
  block[3] = &unk_10050DCB8;
  id v25 = v23;
  id v30 = v25;
  id v26 = v19;
  id v31 = v26;
  id v27 = v16;
  id v32 = v27;
  dispatch_async(v24, block);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kAFSiriAndDictationHistoryDeletionRequestedDarwinNotification, 0, 0, 1u);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);
}

- (void)_destroyActiveAccount
{
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v30 = "-[ADCommandCenter _destroyActiveAccount]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  int v4 = [(ADCommandCenter *)self _account];
  uint64_t v5 = [v4 assistantIdentifier];
  uint64_t v6 = [v4 speechIdentifier];
  if (v5 | v6)
  {
    id v7 = objc_alloc_init(ADAddressBookManager);
    [(ADAddressBookManager *)v7 unregisterChangeHistory];
    if ([v4 needsCreation])
    {
      [v4 setNeedsCreation:0];
      [v4 setNeedsDestruction:0];
      [v4 save];
    }
    else if (([v4 needsDestruction] & 1) == 0)
    {
      CFStringRef v8 = +[ADDaemon sharedDaemon];
      [v8 scheduleDestroyJob];

      [v4 setNeedsDestruction:1];
      [v4 save];
      unsigned int v9 = +[AFFeatureFlags isOnDeviceHistoryDeletionEnabled];
      id v10 = +[AFPreferences sharedPreferences];
      unsigned __int8 v11 = [v10 longLivedIdentifierUploadingEnabled];

      if (v9)
      {
        if ((v11 & 1) == 0)
        {
          int v12 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 136315138;
            id v30 = "-[ADCommandCenter _destroyActiveAccount]";
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s #RPI delete Siri History when Siri + Dictation are disabled", buf, 0xCu);
          }
          [(ADCommandCenter *)self _deleteSiriHistoryOnDeviceOnDestroyAssistant];
        }
      }
    }
    +[_INVocabularyStoreManager deleteAllUserVocabularyFromAllAppsAsync];
    id v13 = [(ADCommandCenter *)self _speechManager];
    [v13 disableDESWithCompletion:&stru_1005063D0];

    id v14 = +[ADSyncSnapshot sharedInstance];
    [v14 deleteSavedSnapshots];

    [(ADCommandCenter *)self _metrics_destroyAllMetrics];
    id v15 = [(ADCommandCenter *)self _sessionManager];
    [v15 resetSessionsAndMakeQuiet:0];

    id v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.siri.duet", v17);
    AFDeleteCoreDuetEventsInStream();
    AFRecordCoreDuetContext();

    id v19 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
    id v20 = [v19 firstObject];

    id v21 = [v20 stringByAppendingPathComponent:@"SiriEdutainment"];
    id v22 = +[NSFileManager defaultManager];
    id v28 = 0;
    unsigned int v23 = [v22 removeItemAtPath:v21 error:&v28];
    id v24 = v28;
    if (v23)
    {
      id v25 = AFSiriLogContextUtility;
      if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315394;
        id v30 = "ADDeleteItemAtPath";
        __int16 v31 = 2112;
        id v32 = v21;
        id v26 = "%s Successfully deleted item %@";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, v26, buf, 0x16u);
      }
    }
    else
    {
      int found = AFIsFileNotFoundError();
      id v25 = AFSiriLogContextUtility;
      if (!found)
      {
        if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315650;
          id v30 = "ADDeleteItemAtPath";
          __int16 v31 = 2112;
          id v32 = v21;
          __int16 v33 = 2112;
          id v34 = v24;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s Failed to delete item at %@ - %@", buf, 0x20u);
        }
        goto LABEL_21;
      }
      if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315394;
        id v30 = "ADDeleteItemAtPath";
        __int16 v31 = 2112;
        id v32 = v21;
        id v26 = "%s Not Found %@";
        goto LABEL_18;
      }
    }
LABEL_21:
  }
}

- (void)_setActiveAccountIdentifier:(id)a3
{
  unsigned int v4 = +[ADAccount setActiveAccountIdentifier:a3];
  [(ADCommandCenter *)self _clearAccount];
  uint64_t v5 = sub_1002E6F70(@"encryption_key_did_change");
  [(ADCommandCenter *)self syncAnchorKeys:v5 forceReset:1 reasons:&off_100523330];

  notify_post("com.apple.assistant.sync_needed");
  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 postNotificationName:@"ADActiveAccountIdentifierDidChangeNotification" object:0];
  if (v4)
  {
    if (AFIsHorseman()) {
      [(ADCommandCenter *)self updateSharedDataFromCompanion];
    }
    [v6 postNotificationName:@"ADSharedDataDidChangeNotification" object:0];
  }
}

- (id)_activeAccountIdentifier
{
  id v2 = [(ADCommandCenter *)self _account];
  BOOL v3 = [v2 identifier];

  return v3;
}

- (void)_deleteAccountWithIdentifier:(id)a3
{
  if (a3)
  {
    +[ADAccount accountForIdentifier:](ADAccount, "accountForIdentifier:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v3 removeAndSave];
  }
}

- (void)_createAssistantLocallyIfNeeded:(BOOL)a3
{
  uint64_t v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    int v12 = "-[ADCommandCenter _createAssistantLocallyIfNeeded:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v11, 0xCu);
  }
  id v6 = [(ADCommandCenter *)self _account];
  id v7 = v6;
  if (a3)
  {
    if ([v6 needsDestruction])
    {
      [v7 setNeedsDestruction:0];
      [v7 setNeedsCreation:1];
      CFStringRef v8 = +[ADDaemon sharedDaemon];
      [v8 unscheduleDestroyJob];

      [v7 save];
    }
    unsigned int v9 = [v7 assistantIdentifier];

    if (!v9)
    {
      [v7 clearAssistantData];
      [v7 updateAssistantIdentifiers];
      [v7 setNeedsCreation:1];
      [v7 save];
      id v10 = dispatch_get_global_queue(9, 0);
      dispatch_async(v10, &stru_1005063B0);
    }
  }
  else if ([v6 needsCreation])
  {
    [v7 setNeedsCreation:0];
    [v7 save];
  }
}

- (id)_accounts
{
  id v2 = +[NSMutableArray array];
  id v3 = +[ADPreferences sharedPreferences];
  unsigned int v4 = [v3 accountIdentifiers];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = +[ADAccount accountForIdentifier:](ADAccount, "accountForIdentifier:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        if (v10) {
          [v2 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v7);
  }

  int v11 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = v11;
    id v13 = [v2 description];
    *(_DWORD *)long long buf = 136315394;
    id v20 = "-[ADCommandCenter _accounts]";
    __int16 v21 = 2112;
    id v22 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  return v2;
}

- (void)_getDeferredObjectsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ADCommandCenter *)self _resultObjectCache];
  id v16 = 0;
  unsigned int v9 = [v8 objectsForIds:v6 missingReferences:&v16];
  id v10 = v16;

  if ([v10 count])
  {
    id v11 = objc_alloc_init((Class)SAGetResultObjects);
    [v11 setObjectIdentifiers:v10];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001C8650;
    v12[3] = &unk_100505BF8;
    v12[4] = self;
    id v13 = v9;
    id v14 = v6;
    id v15 = v7;
    [(ADCommandCenter *)self _sendCommandToServer:v11 opportunistically:0 completion:v12];
  }
  else if (v7)
  {
    (*((void (**)(id, void *, void))v7 + 2))(v7, v9, 0);
  }
}

- (void)_fetchSupportedLanguagesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v11 = "-[ADCommandCenter _fetchSupportedLanguagesWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v6 = objc_alloc_init((Class)SAGetSupportedLocales);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001C8BA8;
  v8[3] = &unk_10050CF00;
  id v9 = v4;
  id v7 = v4;
  [(ADCommandCenter *)self _sendCommandToServer:v6 completion:v8];
}

- (void)_clearContextAndStartDictationSessionWithLanguageCode:(id)a3 dictationOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ADCommandCenter *)self _clearContext];
  if ([v7 shouldClassifyIntent])
  {
    uint64_t v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v20 = "-[ADCommandCenter _clearContextAndStartDictationSessionWithLanguageCode:dictationOptions:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s shouldClassifyIntent is YES; will update UoD status",
        buf,
        0xCu);
    }
    id v9 = [(ADCommandCenter *)self _updateUODAssetStatusForLanguage:v6];
  }
  id v10 = +[ADDictationOfflineStatusObserver sharedDictationOfflineStatusObserver];
  id v11 = [v10 offlineDictationStatus];

  uint64_t v12 = AFIsDictationLanguageInstalledForOfflineRecognition();
  if (v12) {
    uint64_t v13 = AFIsNLAssetAvailableFromUodStatus();
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = [(ADCommandCenter *)self _requestDispatcherService];
  id v15 = [(ADCommandCenter *)self _account];
  id v16 = [v15 assistantIdentifier];
  objc_msgSend(v14, "startDictationSessionWithAssistantId:languageCode:recognitionOnDevice:shouldClassifyIntent:understandingOnDevice:", v16, v6, v12, objc_msgSend(v7, "shouldClassifyIntent"), v13);

  if (self->_serviceManager)
  {
    long long v17 = [(ADCommandCenter *)self _queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001C8F44;
    block[3] = &unk_10050E138;
    void block[4] = self;
    dispatch_async(v17, block);
  }
}

- (void)_clearContextAndStartAssistantSession
{
  [(ADCommandCenter *)self _clearContext];
  id v3 = [(ADCommandCenter *)self _sessionManager];
  id v4 = [v3 languageCode];

  if ((AFDeviceSupportsSiriUOD() & 1) != 0 || AFDeviceSupportsHybridUOD())
  {
    id v5 = [(ADCommandCenter *)self _updateUODAssetStatusForLanguage:v4];
    BOOL v6 = self->_siriFullUODSupported && !self->_siriHybridUODSupported;
    [(ADSessionManager *)self->_sessionManager resetSessionsIfRequiredBasedOnOrchestrationMode:v6];
  }
  id v7 = [(ADCommandCenter *)self _requestDispatcherService];
  uint64_t v8 = [(ADCommandCenter *)self _requestDispatcherSessionConfiguration];
  [v7 startSessionWithConfiguration:v8];

  if (self->_serviceManager)
  {
    id v9 = [(ADCommandCenter *)self _queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001C90D4;
    block[3] = &unk_10050E138;
    void block[4] = self;
    dispatch_async(v9, block);
  }
}

- (id)_fetchUODStatusForLanguageCode:(id)a3
{
  id v4 = AFSiriLogContextDaemon;
  id v5 = a3;
  os_signpost_id_t v6 = os_signpost_id_generate(v4);
  id v7 = AFSiriLogContextDaemon;
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "AssetFetch", (const char *)&unk_100458042, buf, 2u);
  }

  id v9 = [(ADAssetManager *)self->_assetManager assetsAvailableStatusForLanguage:v5];

  id v10 = AFSiriLogContextDaemon;
  id v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, v6, "AssetFetch", (const char *)&unk_100458042, v13, 2u);
  }

  return v9;
}

- (id)_updateUODAssetStatusForLanguage:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    os_signpost_id_t v6 = [(ADCommandCenter *)self _sessionManager];
    id v5 = [v6 languageCode];
  }
  id v7 = [(ADCommandCenter *)self _fetchUODStatusForLanguageCode:v5];
  self->_BOOL siriHybridUODSupported = AFUODStatusSupportedHybrid();
  self->_int siriSAESupported = AFUODStatusSupportedSAE();
  if (AFDeviceSupportsSAE()) {
    int siriSAESupported = self->_siriSAESupported;
  }
  else {
    int siriSAESupported = AFUODStatusSupportedFull();
  }
  self->_BOOL siriFullUODSupported = siriSAESupported;
  if (siriSAESupported && !self->_siriHybridUODSupported)
  {
    id v9 = [(ADCommandCenter *)self _locationManager];
    id v10 = v9;
    uint64_t v11 = 0;
  }
  else
  {
    id v9 = [(ADCommandCenter *)self _locationManager];
    id v10 = v9;
    uint64_t v11 = 1;
  }
  [v9 setAllowAdHocSendingLocationToServer:v11];

  uint64_t v12 = +[ADPreferences sharedPreferences];
  uint64_t v13 = v12;
  BOOL v14 = self->_siriFullUODSupported && !self->_siriHybridUODSupported;
  [v12 setIsSiriFullUODSupported:v14];

  BOOL siriHybridUODSupported = 1;
  if (!self->_siriFullUODSupported) {
    BOOL siriHybridUODSupported = self->_siriHybridUODSupported;
  }
  self->_siriUODSupported = siriHybridUODSupported;
  self->_assetsCheckRan = 1;
  objc_storeStrong((id *)&self->_currentUodStatus, v7);
  BOOL v16 = self->_siriHybridUODSupported;
  if (self->_siriHybridUODSupported)
  {
    CFStringRef v17 = @"Hybrid";
  }
  else if (self->_siriSAESupported)
  {
    CFStringRef v17 = @"SAE";
  }
  else if (self->_siriFullUODSupported)
  {
    CFStringRef v17 = @"FullUOD";
  }
  else
  {
    CFStringRef v17 = @"Classic";
  }
  long long v18 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    currentUodStatus = self->_currentUodStatus;
    BOOL siriFullUODSupported = self->_siriFullUODSupported;
    BOOL v21 = self->_siriSAESupported;
    int v23 = 136316674;
    id v24 = "-[ADCommandCenter _updateUODAssetStatusForLanguage:]";
    __int16 v25 = 2112;
    id v26 = currentUodStatus;
    __int16 v27 = 1024;
    BOOL v28 = siriFullUODSupported;
    __int16 v29 = 1024;
    BOOL v30 = v16;
    __int16 v31 = 1024;
    BOOL v32 = v21;
    __int16 v33 = 2112;
    id v34 = v5;
    __int16 v35 = 2112;
    CFStringRef v36 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s #AsrOnServer Siri understanding on device status: uodStatus:%@, _siriFullUODSupported:%d, _siriHybridUODSupported:%d, _siriSAESupported:%d, fetchLanguageCode:%@, orchestration mode chosen: %@", (uint8_t *)&v23, 0x3Cu);
  }

  return v7;
}

- (void)_clearContext
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[ADCommandCenter _clearContext]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  [(ADDomainObjectCache *)self->_domainObjectCache reset];
  self->_restrictionsWereSetForRequest = 0;
  selectedSharedUserID = self->_selectedSharedUserID;
  self->_selectedSharedUserID = 0;

  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    id v7 = "-[ADCommandCenter _clearContext]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s _selectedSharedUserID cleared in _clearContext.", (uint8_t *)&v6, 0xCu);
  }
  [(ADSessionManager *)self->_sessionManager resetWinningState];
  [(ADCommandCenter *)self _context_clearContextWithClearSiriKitContext:0];
}

- (BOOL)_areRequiredAssetsMissing
{
  if (AFShouldRunAsrOnServerForUOD())
  {
    uint64_t v3 = 914;
LABEL_6:
    BOOL v5 = *((unsigned __int8 *)&self->super.isa + v3) == 0;
    goto LABEL_8;
  }
  if (AFDeviceSupportsSiriUOD())
  {
    int v4 = AFDeviceSupportsSAE();
    uint64_t v3 = 913;
    if (v4) {
      uint64_t v3 = 915;
    }
    goto LABEL_6;
  }
  BOOL v5 = 0;
LABEL_8:
  int v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    BOOL siriHybridUODSupported = self->_siriHybridUODSupported;
    BOOL siriFullUODSupported = self->_siriFullUODSupported;
    BOOL siriSAESupported = self->_siriSAESupported;
    int v11 = 136316162;
    uint64_t v12 = "-[ADCommandCenter _areRequiredAssetsMissing]";
    __int16 v13 = 1024;
    BOOL v14 = v5;
    __int16 v15 = 1024;
    BOOL v16 = siriHybridUODSupported;
    __int16 v17 = 1024;
    BOOL v18 = siriFullUODSupported;
    __int16 v19 = 1024;
    BOOL v20 = siriSAESupported;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s #AsrOnServer assetsMissing = %d, _siriHybridUODSupported= %d, _siriFullUODSupported=%d, _siriSAESupported=%d", (uint8_t *)&v11, 0x24u);
  }
  return v5;
}

- (void)_emitDeviceDynamicContextForRequest:(id)a3 withTimestamp:(unint64_t)a4
{
  id v6 = a3;
  id v7 = sub_1000D4598(v6);
  if (v7)
  {
    id v8 = objc_alloc_init((Class)ORCHSchemaORCHDeviceDynamicContext);
    id v9 = [(ADCommandCenter *)self _motionManager];
    id v10 = [v9 motionActivity];

    if ([v10 isEqualToString:SAMotionActivityInVehicleStationaryValue])
    {
      uint64_t v11 = 4;
    }
    else if ([v10 isEqualToString:SAMotionActivityStationaryValue])
    {
      uint64_t v11 = 2;
    }
    else if (([v10 isEqualToString:SAMotionActivityWalkingValue] & 1) != 0 {
           || ([v10 isEqualToString:SAMotionActivityRunningValue] & 1) != 0
    }
           || ([v10 isEqualToString:SAMotionActivityCyclingValue] & 1) != 0)
    {
      uint64_t v11 = 1;
    }
    else if ([v10 isEqualToString:SAMotionActivityInVehicleMovingValue])
    {
      uint64_t v11 = 3;
    }
    else
    {
      uint64_t v11 = 0;
    }
    [v8 setMotionActivity:v11];
    __int16 v13 = +[NSProcessInfo processInfo];
    id v14 = [v13 thermalState];

    if ((unint64_t)v14 < 4) {
      uint64_t v15 = (v14 + 1);
    }
    else {
      uint64_t v15 = 0;
    }
    [v8 setThermalState:v15];
    BOOL v16 = -[ADRequestDispatcherServiceHelper headGestureConfiguration]_0();
    objc_msgSend(v8, "setHeadGesturesSupported:", objc_msgSend(v16, "isSupported"));
    objc_msgSend(v8, "setHeadGesturesEnabled:", objc_msgSend(v16, "isEnabled"));
    id v17 = [v16 acceptGesture];
    if (v17 == (id)2) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = 2 * (v17 == (id)1);
    }
    id v19 = [v16 rejectGesture];
    if (v19 == (id)2) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = 2 * (v19 == (id)1);
    }
    [v8 setAcceptProceedGesture:v18];
    [v8 setDeclineDismissGesture:v20];
    id v21 = objc_alloc_init((Class)SiriCoreWiFiManagerClient);
    objc_msgSend(v8, "setIsWifiEnabled:", objc_msgSend(v21, "isWifiEnabled"));
    objc_msgSend(v8, "setBluetoothState:", +[ADCommandCenter _orchBluetoothStateEnumFromBluetoothState:](ADCommandCenter, "_orchBluetoothStateEnumFromBluetoothState:", +[ADCommandCenter _fetchBluetoothState](ADCommandCenter, "_fetchBluetoothState")));
    objc_msgSend(v8, "setIsChatGPTEnabled:", +[GATSettings isEnabled](GATSettings, "isEnabled") & ~AFMontaraRestricted());
    id v22 = objc_alloc_init((Class)ORCHSchemaORCHClientEvent);
    [v22 setOrchDeviceDynamicContext:v8];
    id v23 = objc_alloc_init((Class)ORCHSchemaORCHClientEventMetadata);
    [v23 setRequestId:v7];
    [v22 setEventMetadata:v23];
    id v24 = +[AssistantSiriAnalytics sharedStream];
    [v24 emitMessage:v22 timestamp:a4];
  }
  else
  {
    uint64_t v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v25 = 136315394;
      id v26 = "-[ADCommandCenter _emitDeviceDynamicContextForRequest:withTimestamp:]";
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s The requestId=%@ is malformed for request, not logging motion activity as a device dynamic context.", (uint8_t *)&v25, 0x16u);
    }
  }
}

- (void)_emitDeviceDynamicContextForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  id v6 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C9B8C;
  block[3] = &unk_10050E278;
  void block[4] = self;
  id v9 = v4;
  uint64_t v10 = v5;
  id v7 = v4;
  dispatch_async(v6, block);
}

- (void)_handleAceCommand:(id)a3 afterCurrentRequest:(BOOL)a4 waitForResponse:(BOOL)a5 withDelegate:(id)a6 completion:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    BOOL v32 = "-[ADCommandCenter _handleAceCommand:afterCurrentRequest:waitForResponse:withDelegate:completion:]";
    __int16 v33 = 2112;
    id v34 = v12;
    __int16 v35 = 2112;
    id v36 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s command = %@, delegate = %@", buf, 0x20u);
  }
  if (v10)
  {
    BOOL v16 = +[NSDate date];
  }
  else
  {
    BOOL v16 = 0;
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001C9DA0;
  void v23[3] = &unk_100507D08;
  id v17 = v12;
  id v24 = v17;
  id v18 = v16;
  id v25 = v18;
  BOOL v29 = v10;
  id v19 = v13;
  id v26 = v19;
  __int16 v27 = self;
  BOOL v30 = a5;
  id v20 = v14;
  id v28 = v20;
  id v21 = objc_retainBlock(v23);
  id v22 = v21;
  if (v10) {
    dispatch_group_notify((dispatch_group_t)self->_requestGroup, (dispatch_queue_t)self->_queue, v21);
  }
  else {
    ((void (*)(void *))v21[2])(v21);
  }
}

- (void)_firstChanceServiceChangeIdFrom:(id)a3 to:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_firstChanceServices objectForKey:v9];
    id v8 = (void *)v7;
    if (v6 && v7) {
      [(NSMutableDictionary *)self->_firstChanceServices setObject:v7 forKey:v6];
    }
    [(NSMutableDictionary *)self->_firstChanceServices removeObjectForKey:v9];
  }
}

- (id)_firstChanceServiceForCommand:(id)a3
{
  firstChanceServices = self->_firstChanceServices;
  id v4 = [a3 refId];
  uint64_t v5 = [(NSMutableDictionary *)firstChanceServices objectForKey:v4];

  return v5;
}

- (void)_removeFirstChanceServiceForAceId:(id)a3
{
  if (a3) {
    -[NSMutableDictionary removeObjectForKey:](self->_firstChanceServices, "removeObjectForKey:");
  }
}

- (void)_setFirstChanceService:(id)a3 forAceId:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v6)
  {
    firstChanceServices = self->_firstChanceServices;
    if (!firstChanceServices)
    {
      id v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      id v9 = self->_firstChanceServices;
      self->_firstChanceServices = v8;

      firstChanceServices = self->_firstChanceServices;
    }
    [(NSMutableDictionary *)firstChanceServices setObject:v10 forKey:v6];
  }
}

- (void)_handleGenericConcreteAceCommand:(id)a3 withDelegate:(id)a4 interruptOutstandingRequest:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, BOOL))a6;
  id v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315906;
    BOOL v29 = "-[ADCommandCenter _handleGenericConcreteAceCommand:withDelegate:interruptOutstandingRequest:reply:]";
    __int16 v30 = 2112;
    id v31 = v11;
    __int16 v32 = 2112;
    id v33 = v10;
    __int16 v34 = 1024;
    BOOL v35 = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s %@ %@ %d", buf, 0x26u);
  }
  id v14 = [(ADCommandCenter *)self _currentRequest];
  uint64_t v15 = [v14 currentRequestCommand];

  if (v12) {
    v12[2](v12, v15 != 0);
  }
  if (v15 && !v7)
  {
    BOOL v16 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      BOOL v29 = "-[ADCommandCenter _handleGenericConcreteAceCommand:withDelegate:interruptOutstandingRequest:reply:]";
      __int16 v30 = 2112;
      id v31 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Requested command conflicts with existing: %@", buf, 0x16u);
    }
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v18 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)long long buf = 136315394;
    BOOL v29 = "-[ADCommandCenter _handleGenericConcreteAceCommand:withDelegate:interruptOutstandingRequest:reply:]";
    __int16 v30 = 2112;
    id v31 = v10;
    id v23 = "%s Ignoring invalid ace command %@";
    id v24 = v18;
LABEL_31:
    _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v23, buf, 0x16u);
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      BOOL v29 = "-[ADCommandCenter _handleGenericConcreteAceCommand:withDelegate:interruptOutstandingRequest:reply:]";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Handling generic send commands", buf, 0xCu);
    }
    [(ADCommandCenter *)self _handleSendCommands:v10 forRequestDelegate:v11 completion:0];
    goto LABEL_15;
  }
  if ([(ADCommandCenter *)self _isServerBoundCommand:v10])
  {
    id v19 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      BOOL v29 = "-[ADCommandCenter _handleGenericConcreteAceCommand:withDelegate:interruptOutstandingRequest:reply:]";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s Handling generic server bound command", buf, 0xCu);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(ADCommandCenter *)self _startNonSpeechRequest:v10 forDelegate:v11];
    }
    else if (objc_msgSend(v10, "ad_willHaveReply"))
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1001CB290;
      v25[3] = &unk_1005062F0;
      void v25[4] = self;
      id v26 = v10;
      id v27 = v11;
      [(ADCommandCenter *)self _sendCommandToServer:v26 opportunistically:0 completion:v25];
    }
    else
    {
      [(ADCommandCenter *)self _sendCommandToServer:v10];
    }
    goto LABEL_15;
  }
  unsigned int v20 = [(ADCommandCenter *)self _isClientBoundCommand:v10];
  id v21 = AFSiriLogContextDaemon;
  if (!v20)
  {
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)long long buf = 136315394;
    BOOL v29 = "-[ADCommandCenter _handleGenericConcreteAceCommand:withDelegate:interruptOutstandingRequest:reply:]";
    __int16 v30 = 2112;
    id v31 = v10;
    id v23 = "%s Don't know how to handle generic ace command %@";
    id v24 = v21;
    goto LABEL_31;
  }
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    BOOL v29 = "-[ADCommandCenter _handleGenericConcreteAceCommand:withDelegate:interruptOutstandingRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s Handling generic client bound command", buf, 0xCu);
  }
  id v22 = [(ADCommandCenter *)self _sessionManager];
  [v22 handleCommand:v10];

LABEL_15:
}

- (void)_handleGenericAceCommand:(id)a3 withDelegate:(id)a4 interruptOutstandingRequest:(BOOL)a5 reply:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = +[AceObject aceObjectWithDictionary:a3];
  [(ADCommandCenter *)self _handleGenericConcreteAceCommand:v12 withDelegate:v11 interruptOutstandingRequest:v6 reply:v10];
}

- (void)_updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10
{
  id v17 = a10;
  id v27 = a9;
  id v26 = a8;
  id v24 = a7;
  id v25 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v29 = [(ADCommandCenter *)self _requestDispatcherService];
  id v28 = [(ADCommandCenter *)self _account];
  id v23 = [v28 assistantIdentifier];
  id v21 = [(ADCommandCenter *)self _speechCapturingContext];
  id v22 = [v21 sessionUUID];
  [v29 updateVoiceCommandContextWithAssistantId:v23 requestId:v22 prefixText:v20 postfixText:v19 selectedText:v18 disambiguationActive:v25 cursorInVisibleText:v24 favorCommandSuppression:v26 abortCommandSuppression:v27 undoEvent:v17];
}

- (void)_resumeRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315138;
    id v18 = "-[ADCommandCenter _resumeRecognitionWithPrefixText:postfixText:selectedText:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v17, 0xCu);
  }
  id v12 = [(ADCommandCenter *)self _requestDispatcherService];
  id v13 = [(ADCommandCenter *)self _account];
  id v14 = [v13 assistantIdentifier];
  uint64_t v15 = [(ADCommandCenter *)self _speechCapturingContext];
  BOOL v16 = [v15 sessionUUID];
  [v12 resumeDictationRecognitionWithAssistantId:v14 requestId:v16 prefixText:v8 postfixText:v9 selectedText:v10];
}

- (void)_pauseRecognition
{
  uint64_t v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = "-[ADCommandCenter _pauseRecognition]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }
  id v4 = [(ADCommandCenter *)self _requestDispatcherService];
  uint64_t v5 = [(ADCommandCenter *)self _account];
  BOOL v6 = [v5 assistantIdentifier];
  BOOL v7 = [(ADCommandCenter *)self _speechCapturingContext];
  id v8 = [v7 sessionUUID];
  [v4 pauseDictationRecognitionWithAssistantId:v6 requestId:v8];
}

- (void)_sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = "-[ADCommandCenter _sendSpeechCorrectionInfo:interactionIdentifier:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }
  id v8 = [objc_alloc((Class)LBLocalSpeechRecognizerClient) initWithDelegate:0];
  [v8 sendSpeechCorrectionInfo:v5 interactionIdentifier:v6];
  [v8 invalidate];
}

- (void)_sendSpeechCorrectionInfo:(id)a3 forCorrectionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    id v11 = "-[ADCommandCenter _sendSpeechCorrectionInfo:forCorrectionContext:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }
  id v9 = objc_alloc_init((Class)SASSpeechCorrectionStatistics);
  objc_msgSend(v9, "ad_setAFSpeechCorrectionInfo:", v6);
  objc_msgSend(v9, "ad_setAFCorrectionContext:", v7);
  [(ADCommandCenter *)self _sendCommandToServer:v9];
}

- (void)_cancelSpeechForDelegate:(id)a3
{
  id v4 = (ADCommandCenterSpeechDelegate *)a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    id v9 = "-[ADCommandCenter _cancelSpeechForDelegate:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  if (self->_speechDelegate == v4)
  {
    if ((unint64_t)(self->_speechManagerState - 1) <= 1)
    {
      id v7 = [(ADCommandCenter *)self _speechManager];
      [v7 cancelSpeechCaptureSuppressingAlert:AFIsNano()];

      [(ADCommandCenter *)self _cancelCurrentRequestForReason:12 andError:0 successorInfo:0];
    }
  }
  else
  {
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      id v9 = "-[ADCommandCenter _cancelSpeechForDelegate:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Ignoring cancel speech from invalid delegate", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_stopSpeechWithOptions:(id)a3 forDelegate:(id)a4
{
  id v6 = a3;
  id v7 = (ADCommandCenterSpeechDelegate *)a4;
  int v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v15 = "-[ADCommandCenter _stopSpeechWithOptions:forDelegate:]";
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (self->_speechDelegate == v7)
  {
    int v10 = [(ADCommandCenter *)self _speechManager];
    [v10 stopSpeechCaptureWithOptions:v6];

    speechRequestGroup = self->_speechRequestGroup;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001CBDA8;
    block[3] = &unk_10050E138;
    void block[4] = self;
    dispatch_group_notify(speechRequestGroup, queue, block);
  }
  else
  {
    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v15 = "-[ADCommandCenter _stopSpeechWithOptions:forDelegate:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Ignoring stop speech from invalid delegate", buf, 0xCu);
    }
  }
}

- (void)_updateSpeechOptions:(id)a3 forDelegate:(id)a4 allowUpdateInSpeechCompletion:(BOOL)a5
{
  id v8 = a3;
  id v9 = (ADCommandCenterSpeechDelegate *)a4;
  int v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v27 = "-[ADCommandCenter _updateSpeechOptions:forDelegate:allowUpdateInSpeechCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (self->_speechDelegate == v9)
  {
    if (v8)
    {
      if (CSSiriSpeechRecordingGetUsesServerEndpointingFromRequestOptions()
        && (CSSiriSpeechRecordingGetUsesServerEndpointingFromRequestOptions() & 1) == 0)
      {
        -[AFSpeechRequestOptions setEndpointerOperationMode:](self->_currentSpeechRequestOptions, "setEndpointerOperationMode:", [v8 endpointerOperationMode]);
        speechRequestGroup = self->_speechRequestGroup;
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1001CC220;
        block[3] = &unk_10050E138;
        void block[4] = self;
        dispatch_group_notify(speechRequestGroup, queue, block);
      }
      else
      {
        __int16 v16 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315138;
          id v27 = "-[ADCommandCenter _updateSpeechOptions:forDelegate:allowUpdateInSpeechCompletion:]";
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Skipped enable server endpointer command because ADSpeechCapturingGetUsesServerEndpointingFromRequestOptions == NO", buf, 0xCu);
        }
      }
      id v19 = [(ADCommandCenter *)self _speechManager];
      [v19 updateSpeechOptions:v8];
    }
  }
  else
  {
    if (a5)
    {
      id v11 = AFSiriLogContextDaemon;
      if (self->_speechCompletion)
      {
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315138;
          id v27 = "-[ADCommandCenter _updateSpeechOptions:forDelegate:allowUpdateInSpeechCompletion:]";
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s We're not the current delegate, but we have a speech completion. Will try to update in completion", buf, 0xCu);
        }
        objc_initWeak((id *)buf, self);
        id v12 = objc_retainBlock(self->_speechCompletion);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_1001CC1BC;
        v21[3] = &unk_10050E000;
        id v24 = v12;
        id v13 = v12;
        objc_copyWeak(&v25, (id *)buf);
        id v22 = v8;
        id v23 = v9;
        id v14 = objc_retainBlock(v21);
        id speechCompletion = self->_speechCompletion;
        self->_id speechCompletion = v14;

        objc_destroyWeak(&v25);
        objc_destroyWeak((id *)buf);
        goto LABEL_19;
      }
    }
    else
    {
      id v11 = AFSiriLogContextDaemon;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v27 = "-[ADCommandCenter _updateSpeechOptions:forDelegate:allowUpdateInSpeechCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Ignoring update speech options from invalid delegate", buf, 0xCu);
    }
  }
LABEL_19:
}

- (void)_updateSpeechOptions:(id)a3 forDelegate:(id)a4
{
}

- (void)_rollbackRequestForDelegate:(id)a3
{
  id v4 = (ADCommandCenterRequestDelegate *)a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    id v11 = "-[ADCommandCenter _rollbackRequestForDelegate:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }
  if (self->_requestDelegate == v4)
  {
    id v6 = [(ADCommandCenter *)self _currentRequest];
    id v7 = [v6 currentRequestCommand];

    if (v7)
    {
      id v8 = v7;
      [(ADCommandCenter *)self _cancelCurrentRequestForReason:10 andError:0 successorInfo:0];
    }
    else
    {
      id v8 = [(ADCommandCenter *)self _lastRequest];
      if (!v8)
      {
        id v9 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v10 = 136315138;
          id v11 = "-[ADCommandCenter _rollbackRequestForDelegate:]";
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Trying to rollback a request, but don't have one", (uint8_t *)&v10, 0xCu);
        }
        id v8 = 0;
        goto LABEL_8;
      }
    }
    [(ADCommandCenter *)self _sendRollbackCommandForCommand:v8];
LABEL_8:
  }
}

- (void)_cancelRequestForDelegate:(id)a3 reason:(int64_t)a4 error:(id)a5
{
  id v8 = (ADCommandCenterRequestDelegate *)a3;
  id v9 = a5;
  int v10 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    id v12 = AFRequestCancellationReasonGetName();
    int v15 = 136315394;
    __int16 v16 = "-[ADCommandCenter _cancelRequestForDelegate:reason:error:]";
    __int16 v17 = 2112;
    id v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Reason for cancelling the request - %@", (uint8_t *)&v15, 0x16u);
  }
  if (self->_requestDelegate == v8)
  {
    if ((unint64_t)(self->_speechManagerState - 1) <= 1)
    {
      id v13 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v15 = 136315394;
        __int16 v16 = "-[ADCommandCenter _cancelRequestForDelegate:reason:error:]";
        __int16 v17 = 1024;
        LODWORD(v18) = a4 == 1;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Cancelling speech capture (suppressing alert: %d)", (uint8_t *)&v15, 0x12u);
      }
      id v14 = [(ADCommandCenter *)self _speechManager];
      [v14 cancelSpeechCaptureSuppressingAlert:a4 == 1];
    }
    [(ADCommandCenter *)self _cancelCurrentRequestForReason:a4 andError:v9 successorInfo:0];
  }
}

- (void)_startDictationWithURL:(id)a3 isNarrowBand:(BOOL)a4 language:(id)a5 options:(id)a6 sessionUUID:(id)a7 delegate:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v32 = "-[ADCommandCenter _startDictationWithURL:isNarrowBand:language:options:sessionUUID:delegate:]";
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v20 = +[AFAnalytics sharedAnalytics];
  [v20 logEventWithType:121 context:0];

  [(ADCommandCenter *)self _replaceRequestDelegate:0 reason:4];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1001CC8AC;
  v25[3] = &unk_100509A60;
  void v25[4] = self;
  id v26 = v16;
  id v27 = v15;
  id v28 = v14;
  BOOL v30 = a4;
  id v29 = v17;
  id v21 = v17;
  id v22 = v14;
  id v23 = v15;
  id v24 = v16;
  [(ADCommandCenter *)self _replaceSpeechDelegateWhenReady:v18 suppressAlert:0 withCompletion:v25];
}

- (void)_addRecordedSpeechSampleData:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = (ADCommandCenterSpeechDelegate *)a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    id v11 = "-[ADCommandCenter _addRecordedSpeechSampleData:delegate:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }
  if (self->_speechDelegate == v7)
  {
    id v9 = [(ADCommandCenter *)self _speechManager];
    [v9 addRecordedDictationAudioSampleData:v6];
  }
}

- (void)_startRecordedDictationWithLanguage:(id)a3 options:(id)a4 sessionUUID:(id)a5 narrowband:(BOOL)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v27 = "-[ADCommandCenter _startRecordedDictationWithLanguage:options:sessionUUID:narrowband:delegate:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v17 = +[AFAnalytics sharedAnalytics];
  [v17 logEventWithType:121 context:0];

  [(ADCommandCenter *)self _replaceRequestDelegate:0 reason:4];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001CCC74;
  v21[3] = &unk_100506058;
  void v21[4] = self;
  id v22 = v13;
  id v23 = v12;
  id v24 = v14;
  BOOL v25 = a6;
  id v18 = v14;
  id v19 = v12;
  id v20 = v13;
  [(ADCommandCenter *)self _replaceSpeechDelegateWhenReady:v15 suppressAlert:0 withCompletion:v21];
}

- (void)_startDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 sessionUUID:(id)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315650;
    id v19 = "-[ADCommandCenter _startDictationWithLanguageCode:options:speechOptions:sessionUUID:delegate:]";
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s %@ %@", (uint8_t *)&v18, 0x20u);
  }
  [(ADCommandCenter *)self _startDictationWithLanguageCode:v12 options:v13 speechOptions:v14 sessionUUID:v15 delegate:v16 completion:0];
}

- (void)_startRecordingForPendingDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 sessionUUID:(id)a6 delegate:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  __int16 v20 = (OS_dispatch_group *)[objc_alloc((Class)NSString) initWithFormat:@"languageCode = %@, dictationOptions = %@, speechOptions = %@, sessionUUID = %@, delegate = %@", v14, v15, v16, v17, v18];
  id v21 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v33 = "-[ADCommandCenter _startRecordingForPendingDictationWithLanguageCode:options:speechOptions:sessionUUID:delegate:completion:]";
    __int16 v34 = 2112;
    BOOL v35 = v20;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  __int16 v22 = self->_requestGroup;
  id v23 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315650;
    id v33 = "-[ADCommandCenter _startRecordingForPendingDictationWithLanguageCode:options:speechOptions:sessionUUID:delegate:completion:]";
    __int16 v34 = 2112;
    BOOL v35 = v22;
    __int16 v36 = 2112;
    id v37 = v20;
    _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%s Entering request group %@ (%@)...", buf, 0x20u);
  }
  dispatch_group_enter((dispatch_group_t)v22);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  void v27[2] = sub_1001CD154;
  v27[3] = &unk_100509CF0;
  v27[4] = self;
  id v28 = v20;
  unsigned __int8 v31 = [v16 usePrelisteningMode];
  id v29 = v22;
  id v30 = v19;
  id v24 = v22;
  BOOL v25 = v20;
  id v26 = v19;
  [(ADCommandCenter *)self _startDictationWithLanguageCode:v14 options:v15 speechOptions:v16 sessionUUID:v17 delegate:v18 completion:v27];
}

- (void)_startDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 sessionUUID:(id)a6 delegate:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  __int16 v20 = +[AFAnalytics sharedAnalytics];
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_1001CDC68;
  v54[3] = &unk_10050E0C8;
  id v21 = v16;
  id v55 = v21;
  [v20 logEventWithType:121 contextProvider:v54];

  __int16 v34 = v17;
  __int16 v22 = dispatch_group_create();
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = sub_1001BE52C;
  v52[4] = sub_1001BE53C;
  id v53 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = sub_1001BE52C;
  v50[4] = sub_1001BE53C;
  id v51 = 0;
  id v23 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v57 = "-[ADCommandCenter _startDictationWithLanguageCode:options:speechOptions:sessionUUID:delegate:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%s Entering _replaceSpeechDelegateWhenReady group", buf, 0xCu);
  }
  dispatch_group_enter(v22);
  [(ADCommandCenter *)self _replaceRequestDelegate:0 reason:4];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_1001CDC70;
  v48[3] = &unk_10050E138;
  id v24 = v22;
  id v49 = v24;
  [(ADCommandCenter *)self _replaceSpeechDelegateWhenReady:v18 suppressAlert:0 withCompletion:v48];
  BOOL v25 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v57 = "-[ADCommandCenter _startDictationWithLanguageCode:options:speechOptions:sessionUUID:delegate:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%s Entering _getDictationLanguages group", buf, 0xCu);
  }
  dispatch_group_enter(v24);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1001CDD28;
  v44[3] = &unk_1005062A0;
  uint64_t v46 = v52;
  __int16 v47 = v50;
  id v26 = v24;
  id v45 = v26;
  [(ADCommandCenter *)self _getDictationLanguages:v14 options:v15 speechOptions:v21 delegate:v18 completion:v44];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001CDE3C;
  block[3] = &unk_1005062C8;
  void block[4] = self;
  id v36 = v18;
  __int16 v42 = v52;
  __int16 v43 = v50;
  id v37 = v34;
  id v38 = v15;
  id v39 = v21;
  id v40 = v14;
  id v41 = v19;
  id v28 = v19;
  id v29 = v14;
  id v30 = v21;
  id v31 = v15;
  id v32 = v34;
  id v33 = v18;
  dispatch_group_notify(v26, queue, block);

  _Block_object_dispose(v50, 8);
  _Block_object_dispose(v52, 8);
}

- (void)_startSpeechRequestWithURL:(id)a3 isNarrowBand:(BOOL)a4 withDelegate:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v22 = "-[ADCommandCenter _startSpeechRequestWithURL:isNarrowBand:withDelegate:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v14 = +[AFAnalytics sharedAnalytics];
  [v14 logEventWithType:120 context:0];

  [(ADCommandCenter *)self _replaceRequestDelegate:v11 reason:0];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001CE5A4;
  v17[3] = &unk_10050C840;
  void v17[4] = self;
  id v18 = v10;
  BOOL v20 = a4;
  id v19 = v12;
  id v15 = v12;
  id v16 = v10;
  [(ADCommandCenter *)self _replaceSpeechDelegateWhenReady:v11 suppressAlert:0 withCompletion:v17];
}

- (void)_startAcousticIDRequestWithDelegate:(id)a3 withOptions:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = +[AFAnalytics sharedAnalytics];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001CE794;
  v18[3] = &unk_10050E0C8;
  id v12 = v8;
  id v19 = v12;
  [v11 logEventWithType:122 contextProvider:v18];

  [(ADCommandCenter *)self _replaceRequestDelegate:v10 reason:5];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001CE79C;
  v15[3] = &unk_10050DCB8;
  v15[4] = self;
  id v16 = v12;
  id v17 = v9;
  id v13 = v9;
  id v14 = v12;
  [(ADCommandCenter *)self _replaceSpeechDelegateWhenReady:v10 waitForRecordingToFinish:1 suppressAlert:0 withCompletion:v15];
}

- (void)_startSpeechPronunciationRequestWithDelegate:(id)a3 withOptions:(id)a4 pronunciationContext:(id)a5
{
  id v8 = (ADCommandCenterRequestDelegate *)a3;
  id v9 = a4;
  id v10 = (ADCommandCenterRequestDelegate *)a5;
  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v12 = v11;
    *(_DWORD *)long long buf = 136315650;
    id v27 = "-[ADCommandCenter _startSpeechPronunciationRequestWithDelegate:withOptions:pronunciationContext:]";
    __int16 v28 = 2112;
    id v29 = v8;
    __int16 v30 = 2048;
    id v31 = [v9 activationEvent];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s %@ Event %ld", buf, 0x20u);

    id v11 = AFSiriLogContextDaemon;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v13 = v11;
    id v14 = [v9 serverCommandId];
    *(_DWORD *)long long buf = 136315650;
    id v27 = "-[ADCommandCenter _startSpeechPronunciationRequestWithDelegate:withOptions:pronunciationContext:]";
    __int16 v28 = 2112;
    id v29 = v10;
    __int16 v30 = 2112;
    id v31 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Pronunciation Context: %@ refId %@", buf, 0x20u);
  }
  id v15 = +[AFAnalytics sharedAnalytics];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1001CEAFC;
  void v24[3] = &unk_10050E0C8;
  id v16 = v9;
  id v25 = v16;
  [v15 logEventWithType:122 contextProvider:v24];

  id v17 = [v16 serverCommandId];
  if (v17)
  {
  }
  else if (self->_requestDelegate == v8)
  {
    [(ADCommandCenter *)self _replaceRequestDelegate:v8 reason:3];
  }
  BOOL v18 = self->_siriFullUODSupported && !self->_siriHybridUODSupported;
  [v16 setSkipGeneratingSpeechPacket:v18];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001CEB04;
  v21[3] = &unk_10050DCB8;
  void v21[4] = self;
  id v22 = v16;
  id v23 = v10;
  id v19 = v10;
  id v20 = v16;
  [(ADCommandCenter *)self _replaceSpeechDelegateWhenReady:v8 waitForRecordingToFinish:1 suppressAlert:0 withCompletion:v21];
}

- (void)_startRecordingForPendingSpeechRequestForDelegate:(id)a3 withOptions:(id)a4 sessionUUID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (OS_dispatch_group *)[objc_alloc((Class)NSString) initWithFormat:@"speechOptions = %@, sessionUUID = %@, delegate = %@", v11, v12, v10];
  id v15 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    __int16 v28 = "-[ADCommandCenter _startRecordingForPendingSpeechRequestForDelegate:withOptions:sessionUUID:completion:]";
    __int16 v29 = 2112;
    __int16 v30 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  id v16 = self->_requestGroup;
  id v17 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315650;
    __int16 v28 = "-[ADCommandCenter _startRecordingForPendingSpeechRequestForDelegate:withOptions:sessionUUID:completion:]";
    __int16 v29 = 2112;
    __int16 v30 = v16;
    __int16 v31 = 2112;
    id v32 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s Entering request group %@ (%@)...", buf, 0x20u);
  }
  dispatch_group_enter((dispatch_group_t)v16);
  unsigned __int8 v18 = [v11 usePrelisteningMode];
  -[ADCommandCenter _setHeadphonesAuthenticated:](self, "_setHeadphonesAuthenticated:", [v11 isHeadphonesAuthenticated]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1001CEE50;
  v22[3] = &unk_100509CF0;
  v22[4] = self;
  id v23 = v14;
  unsigned __int8 v26 = v18;
  id v24 = v16;
  id v25 = v13;
  id v19 = v16;
  id v20 = v14;
  id v21 = v13;
  [(ADCommandCenter *)self _startSpeechRequestWithDelegate:v10 withOptions:v11 sessionUUID:v12 completion:v22];
}

- (void)_startSpeechRequestWithDelegate:(id)a3 withOptions:(id)a4 sessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v12 = v11;
    int v13 = 136315650;
    id v14 = "-[ADCommandCenter _startSpeechRequestWithDelegate:withOptions:sessionUUID:]";
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2048;
    id v18 = [v9 activationEvent];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s %@ Event %ld", (uint8_t *)&v13, 0x20u);
  }
  [(ADCommandCenter *)self _startSpeechRequestWithDelegate:v8 withOptions:v9 sessionUUID:v10 completion:0];
}

- (void)_startSpeechRequestWithDelegate:(id)a3 withOptions:(id)a4 sessionUUID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [objc_alloc((Class)NSString) initWithFormat:@"speechOptions = %@, sessionUUID = %@, delegate = %@", v11, v12, v10];
  __int16 v15 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    v77 = "-[ADCommandCenter _startSpeechRequestWithDelegate:withOptions:sessionUUID:completion:]";
    __int16 v78 = 2112;
    id v79 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  id v59 = v14;
  id v16 = +[AFAnalytics sharedAnalytics];
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_1001CFDD0;
  v74[3] = &unk_10050E0C8;
  id v17 = v11;
  id v75 = v17;
  [v16 logEventWithType:120 contextProvider:v74];

  id v18 = [(ADCommandCenter *)self _contextManager];
  if (AFIsHorseman()) {
    [v18 updateBackgroundContextIfNowPlayingInfoChanged];
  }
  long long v61 = v18;
  unint64_t v19 = (unint64_t)[v17 activationEvent];
  if (v19 == 5)
  {
    id v20 = [(ADCommandCenter *)self _lastRequest];
    id v21 = [v20 aceId];
    associatedRequestId = self->_associatedRequestId;
    self->_associatedRequestId = v21;

    id v23 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_9;
    }
    id v24 = self->_associatedRequestId;
    *(_DWORD *)long long buf = 136315394;
    v77 = "-[ADCommandCenter _startSpeechRequestWithDelegate:withOptions:sessionUUID:completion:]";
    __int16 v78 = 2112;
    id v79 = v24;
    id v25 = "%s _associatedRequestId set to %@";
    unsigned __int8 v26 = v23;
    uint32_t v27 = 22;
  }
  else
  {
    selectedSharedUserID = self->_selectedSharedUserID;
    self->_selectedSharedUserID = 0;

    __int16 v29 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_9;
    }
    *(_DWORD *)long long buf = 136315138;
    v77 = "-[ADCommandCenter _startSpeechRequestWithDelegate:withOptions:sessionUUID:completion:]";
    id v25 = "%s [[ADMultiUserService sharedService] selectedSharedUserID] cleared on new user initiated activation";
    unsigned __int8 v26 = v29;
    uint32_t v27 = 12;
  }
  _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, v25, buf, v27);
LABEL_9:
  __int16 v30 = +[ADNotificationManager sharedManager];
  unsigned int v31 = [v30 hasIncomingCallNotification];

  id v32 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v56 = "NO";
    if (v31) {
      uint64_t v56 = "YES";
    }
    *(_DWORD *)long long buf = 136315394;
    v77 = "-[ADCommandCenter _startSpeechRequestWithDelegate:withOptions:sessionUUID:completion:]";
    __int16 v78 = 2080;
    id v79 = (id)v56;
    _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "%s hasIncomingCallNotification: %s", buf, 0x16u);
  }
  if (self->_isInCall) {
    uint64_t v33 = 1;
  }
  else {
    uint64_t v33 = v31;
  }
  [v17 setIsOnPhoneCall:v33];
  id v60 = v12;
  BOOL v34 = self->_siriFullUODSupported && !self->_siriHybridUODSupported;
  BOOL v35 = v13;
  [v17 setSkipGeneratingSpeechPacket:v34];
  [v17 setHybridUODEnabled:self->_siriHybridUODSupported];
  id v36 = [v17 notifyState];

  if (!v36)
  {
    id v38 = 0;
    id v37 = 0;
    goto LABEL_27;
  }
  id v37 = [(ADRemoteSpeechRequestHelper *)self->_remoteSpeechRequestHelper speechRequestOptions];
  id v38 = [(ADRemoteSpeechRequestHelper *)self->_remoteSpeechRequestHelper completion];
  [(ADRemoteSpeechRequestHelper *)self->_remoteSpeechRequestHelper reset];
  if (!v37)
  {
    id v39 = [(ADRemoteRequestHelper *)self->_remoteRequestHelper remoteRequestInfo];
    id v37 = [v39 speechRequestOptions];

    if (!v37) {
      goto LABEL_27;
    }
    id v40 = [(ADRemoteRequestHelper *)self->_remoteRequestHelper completion];
    id v41 = v40;
    if (v40)
    {
      v72[0] = _NSConcreteStackBlock;
      v72[1] = 3221225472;
      v72[2] = sub_1001CFDD8;
      v72[3] = &unk_10050E250;
      id v73 = v40;
      __int16 v42 = objc_retainBlock(v72);

      id v38 = v42;
    }
    [(ADRemoteRequestHelper *)self->_remoteRequestHelper setRemoteRequestInfo:0];
    [(ADRemoteRequestHelper *)self->_remoteRequestHelper setCompletion:0];
  }
  __int16 v43 = [v37 audioFileURL];
  if (!AFIsInternalInstall() || !v43)
  {
    id v37 = v37;

    id v17 = v37;
LABEL_27:
    if (!self->_speechManagerState) {
      self->_speechManagerState = 1;
    }
    unsigned int v57 = (v19 < 0x20) & (0x8000A120 >> v19);
    uint64_t v50 = self->_requestGroup;
    id v51 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315650;
      v77 = "-[ADCommandCenter _startSpeechRequestWithDelegate:withOptions:sessionUUID:completion:]";
      __int16 v78 = 2112;
      id v79 = v50;
      __int16 v80 = 2112;
      __int16 v81 = v59;
      _os_log_debug_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, "%s Entering request group %@ (%@)...", buf, 0x20u);
    }
    dispatch_group_enter((dispatch_group_t)v50);
    id v52 = [v17 activationEventMachAbsoluteTime];
    [v17 activationEventTime];
    id v58 = v37;
    if (!v52)
    {
      if (v53 <= 0.0)
      {
        id v54 = objc_alloc_init((Class)AFRequestInfo);
        goto LABEL_35;
      }
      id v52 = (id)AFGetMachAbsoluteTimeFromTimeInterval();
    }
    id v54 = [objc_alloc((Class)AFRequestInfo) initWithTimestamp:v52];
LABEL_35:
    __int16 v43 = v54;
    [v54 setSpeechRequestOptions:v17];
    id v55 = [v17 turnIdentifier];
    [v43 setTurnIdentifier:v55];

    [(ADCommandCenter *)self _replaceRequestDelegate:v10 withInfo:v43 reason:0 andCompletion:0];
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_1001CFE08;
    v62[3] = &unk_100506230;
    v62[4] = self;
    id v17 = v17;
    id v63 = v17;
    long long v64 = v50;
    id v65 = v59;
    id v49 = v59;
    __int16 v47 = v10;
    id v48 = v60;
    id v66 = v60;
    id v67 = v47;
    id v68 = v35;
    id v45 = v38;
    id v69 = v45;
    uint64_t v46 = v50;
    [(ADCommandCenter *)self _replaceSpeechDelegateWhenReady:v67 waitForRecordingToFinish:v57 suppressAlert:0 withCompletion:v62];

    goto LABEL_36;
  }
  id v58 = v37;
  id v44 = +[AFSetAudioSessionActiveContext newWithBuilder:&stru_100506208];
  [(ADCommandCenter *)self _forceAudioSessionActiveWithContext:v44 completion:0];

  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_1001CFDEC;
  v70[3] = &unk_10050D0D0;
  id v45 = v38;
  long long v71 = (OS_dispatch_group *)v45;
  [(ADCommandCenter *)self _startSpeechRequestWithURL:v43 isNarrowBand:0 withDelegate:v10 completion:v70];
  uint64_t v46 = v71;
  __int16 v47 = v10;
  id v49 = v59;
  id v48 = v60;
LABEL_36:
}

- (void)_startNonSpeechRequest:(id)a3 forDelegate:(id)a4 withInfo:(id)a5 options:(id)a6 suppressAlert:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  id v14 = (OS_dispatch_group *)a3;
  __int16 v15 = (OS_dispatch_group *)a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  BOOL v32 = v9;
  unint64_t v19 = (OS_dispatch_group *)[objc_alloc((Class)NSString) initWithFormat:@"request = %@, requestInfo = %@, speechOptions = %@, suppressAlert = %d, delegate = %@", v14, v16, v17, v9, v15];
  id v20 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    __int16 v43 = "-[ADCommandCenter _startNonSpeechRequest:forDelegate:withInfo:options:suppressAlert:completion:]";
    __int16 v44 = 2112;
    id v45 = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    id v20 = AFSiriLogContextDaemon;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    id v21 = v20;
    id v22 = +[NSNumber numberWithBool:v9];
    *(_DWORD *)long long buf = 136315906;
    __int16 v43 = "-[ADCommandCenter _startNonSpeechRequest:forDelegate:withInfo:options:suppressAlert:completion:]";
    __int16 v44 = 2112;
    id v45 = v14;
    __int16 v46 = 2112;
    __int16 v47 = v15;
    __int16 v48 = 2112;
    id v49 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s %@ %@ %@", buf, 0x2Au);
  }
  id v23 = +[AFAnalytics sharedAnalytics];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1001D0594;
  v40[3] = &unk_10050E0C8;
  id v24 = v17;
  id v41 = v24;
  [v23 logEventWithType:122 contextProvider:v40];

  id v25 = self->_requestGroup;
  unsigned __int8 v26 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315650;
    __int16 v43 = "-[ADCommandCenter _startNonSpeechRequest:forDelegate:withInfo:options:suppressAlert:completion:]";
    __int16 v44 = 2112;
    id v45 = v25;
    __int16 v46 = 2112;
    __int16 v47 = v19;
    _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%s Entering request group %@ (%@)...", buf, 0x20u);
  }
  dispatch_group_enter((dispatch_group_t)v25);
  [(ADCommandCenter *)self _replaceRequestDelegate:v15 withInfo:v16 reason:2 andCompletion:v18];

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1001D059C;
  v33[3] = &unk_100506008;
  id v34 = v24;
  BOOL v35 = self;
  id v36 = v14;
  id v37 = v16;
  id v38 = v25;
  id v39 = v19;
  uint32_t v27 = v19;
  __int16 v28 = v25;
  id v29 = v16;
  __int16 v30 = v14;
  id v31 = v24;
  [(ADCommandCenter *)self _replaceSpeechDelegateWhenReady:0 suppressAlert:v32 withCompletion:v33];
}

- (void)_startNonSpeechRequest:(id)a3 forDelegate:(id)a4
{
}

- (void)_startRequest:(id)a3 withDelegate:(id)a4
{
  id v6 = (ADCommandCenter *)a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    __int16 v62 = "-[ADCommandCenter _startRequest:withDelegate:]";
    __int16 v63 = 2112;
    long long v64 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  BOOL v9 = [(ADCommandCenter *)v6 speechRequestOptions];
  id v10 = +[AFAnalytics sharedAnalytics];
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_1001D0E58;
  v59[3] = &unk_10050E0C8;
  id v11 = v6;
  id v60 = v11;
  [v10 logEventWithType:122 contextProvider:v59];

  id v12 = [(ADRemoteRequestHelper *)self->_remoteRequestHelper completion];
  uint64_t v13 = [(ADRemoteRequestHelper *)self->_remoteRequestHelper remoteRequestInfo];
  id v14 = (void *)v13;
  if (v13) {
    __int16 v15 = (void *)v13;
  }
  else {
    __int16 v15 = v11;
  }
  id v16 = v15;
  id v17 = [(ADCommandCenter *)v11 _ad_requestCommandWithRequestHelper:self->_remoteRequestHelper];
  id v18 = [(ADCommandCenter *)v11 _ad_speechRequestOptionsWithClientConfiguration:self->_clientConfiguration];
  __int16 v46 = v12;
  if (!v17)
  {
    id v24 = [(ADCommandCenter *)v11 _ad_localRequestCommandWithRequestHelper:self->_remoteRequestHelper];
    if (v24)
    {
      [(ADCommandCenter *)self _startLocalRequest:v24 withRequestInfo:v16 forDelegate:v7 suppressCancelationAlertIfCapturingSpeech:1 completion:v46];
LABEL_27:

      goto LABEL_28;
    }
    id v25 = [(ADCommandCenter *)v11 handoffURLString];

    if (!v25)
    {
      id v17 = 0;
      if (v46)
      {
        id v31 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          id v33 = v16;
          id v34 = v9;
          id v35 = v7;
          remoteRequestHelper = self->_remoteRequestHelper;
          id v37 = v31;
          id v38 = [(ADRemoteRequestHelper *)remoteRequestHelper remoteRequestInfo];
          *(_DWORD *)long long buf = 136315650;
          __int16 v62 = "-[ADCommandCenter _startRequest:withDelegate:]";
          __int16 v63 = 2112;
          long long v64 = self;
          __int16 v65 = 2112;
          id v66 = v38;
          _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s Don't know how to make a local request for this info %@ %@", buf, 0x20u);

          id v7 = v35;
          BOOL v9 = v34;
          id v16 = v33;
        }
        v46[2](v46, 0, 0);
        id v17 = 0;
      }
      goto LABEL_27;
    }
    id v42 = v16;
    id v45 = v9;
    id v26 = v7;
    id v27 = objc_alloc((Class)NSURL);
    __int16 v28 = [(ADCommandCenter *)v11 handoffURLString];
    id v29 = [v27 initWithString:v28];

    if (v29)
    {
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_1001D0FA8;
      v47[3] = &unk_10050E250;
      __int16 v48 = v46;
      __int16 v30 = v29;
      [(ADCommandCenter *)self _openURL:v29 completion:v47];

      id v7 = v26;
    }
    else
    {
      __int16 v30 = 0;
      id v7 = v26;
      id v17 = 0;
      if (!v46)
      {
LABEL_26:

        BOOL v9 = v45;
        id v16 = v42;
        goto LABEL_27;
      }
      BOOL v32 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        id v39 = self->_remoteRequestHelper;
        id v40 = v32;
        id v41 = [(ADRemoteRequestHelper *)v39 remoteRequestInfo];
        *(_DWORD *)long long buf = 136315650;
        __int16 v62 = "-[ADCommandCenter _startRequest:withDelegate:]";
        __int16 v63 = 2112;
        long long v64 = self;
        __int16 v65 = 2112;
        id v66 = v41;
        _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%s Don't know how to make a local request for this info %@ %@", buf, 0x20u);

        id v7 = v26;
      }
      v46[2](v46, 0, 0);
    }
    id v17 = 0;
    goto LABEL_26;
  }
  __int16 v44 = v9;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1001D0E60;
  v52[3] = &unk_100507D58;
  v52[4] = self;
  unint64_t v19 = v17;
  id v53 = v17;
  id v43 = v7;
  id v20 = v7;
  id v54 = v20;
  id v55 = v16;
  id v56 = v18;
  unsigned int v57 = v11;
  id v58 = v12;
  id v21 = objc_retainBlock(v52);
  id v22 = [v14 text];
  if (v22 && (currentClient = self->_currentClient) != 0)
  {
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_1001D0EFC;
    v49[3] = &unk_1005061E8;
    v49[4] = self;
    id v51 = v21;
    id v50 = v20;
    [(ADCommandCenterClient *)currentClient adStartUIRequestWithText:v22 completion:v49];
  }
  else
  {
    ((void (*)(void *))v21[2])(v21);
  }
  id v17 = v19;

  id v7 = v43;
  BOOL v9 = v44;
LABEL_28:
  -[ADRemoteRequestHelper setRemoteRequestInfo:](self->_remoteRequestHelper, "setRemoteRequestInfo:", 0, v42);
  [(ADRemoteRequestHelper *)self->_remoteRequestHelper setCompletion:0];
}

- (void)_telephonyRequestCompleted
{
  uint64_t v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    id v11 = "-[ADCommandCenter _telephonyRequestCompleted]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }
  id v4 = [(ADCommandCenter *)self _currentRequest];
  id v5 = [v4 currentRequestId];

  if ([(ADCommandCenter *)self _callIsLikely] && v5)
  {
    id v6 = objc_alloc_init((Class)SARequestCompleted);
    id v7 = SiriCoreUUIDStringCreate();
    [v6 setAceId:v7];

    [v6 setRefId:v5];
    id v8 = [(ADCommandCenter *)self _rootExecutionContextForRequestID:v5];
    BOOL v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315394;
      id v11 = "-[ADCommandCenter _telephonyRequestCompleted]";
      __int16 v12 = 2112;
      uint64_t v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Looking up and sending the SARequestCompleted callback for %@", (uint8_t *)&v10, 0x16u);
    }
    [(ADCommandCenter *)self _handleCommand:v6 executionContext:v8 completion:0];
  }
}

- (void)_prepareForPhoneCall
{
  uint64_t v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADCommandCenter _prepareForPhoneCall]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(ADCommandCenter *)self _setCallIsLikely:1];
}

- (void)_reallyEndSessionForDelegate:(id)a3
{
  int v4 = (ADCommandCenterSpeechDelegate *)a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    speechDelegate = self->_speechDelegate;
    requestDelegate = self->_requestDelegate;
    *(_DWORD *)long long buf = 136315906;
    id v27 = "-[ADCommandCenter _reallyEndSessionForDelegate:]";
    __int16 v28 = 2048;
    id v29 = v4;
    __int16 v30 = 2048;
    id v31 = speechDelegate;
    __int16 v32 = 2048;
    id v33 = requestDelegate;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s delegate %p, _speechDelegate %p, _requestDelegate %p", buf, 0x2Au);
  }
  if (objc_opt_respondsToSelector()) {
    [(ADCommandCenterSpeechDelegate *)v4 setAdSpeechSessionEnded:1];
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001D170C;
  void v23[3] = &unk_10050E160;
  id v8 = v4;
  id v24 = v8;
  id v25 = self;
  BOOL v9 = objc_retainBlock(v23);
  int v10 = self->_speechDelegate;
  id v11 = AFSiriLogContextDaemon;
  BOOL v12 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  BOOL v13 = v10 == v8;
  if (v10 == v8)
  {
    if (v12)
    {
      *(_DWORD *)long long buf = 136315138;
      id v27 = "-[ADCommandCenter _reallyEndSessionForDelegate:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Asking command center to replace speech delegate with nil...", buf, 0xCu);
    }
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1001D186C;
    v21[3] = &unk_10050D0D0;
    id v22 = v9;
    [(ADCommandCenter *)self _replaceSpeechDelegateWhenReady:0 waitForRecordingToFinish:0 suppressAlert:1 withCompletion:v21];
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)long long buf = 136315394;
      id v27 = "-[ADCommandCenter _reallyEndSessionForDelegate:]";
      __int16 v28 = 2048;
      id v29 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Ignored replacing speech delegate with nil because speech delegate is %p.", buf, 0x16u);
    }
    ((void (*)(void *))v9[2])(v9);
  }
  id v14 = self->_requestDelegate;
  __int16 v15 = AFSiriLogContextDaemon;
  BOOL v16 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v14 == v8)
  {
    if (v16)
    {
      *(_DWORD *)long long buf = 136315138;
      id v27 = "-[ADCommandCenter _reallyEndSessionForDelegate:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Asking command center to replace request delegate with nil...", buf, 0xCu);
    }
    [(ADCommandCenter *)self _replaceRequestDelegate:0 reason:6];
    currentClient = self->_currentClient;
    __int16 v15 = AFSiriLogContextDaemon;
    BOOL v19 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (currentClient == v8 || !currentClient)
    {
      if (v19)
      {
        *(_DWORD *)long long buf = 136315138;
        id v27 = "-[ADCommandCenter _reallyEndSessionForDelegate:]";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Asking command center to reset request context...", buf, 0xCu);
      }
      [(ADCommandCenter *)self _context_reset];
    }
    else if (v19)
    {
      *(_DWORD *)long long buf = 136315394;
      id v27 = "-[ADCommandCenter _reallyEndSessionForDelegate:]";
      __int16 v28 = 2048;
      id v29 = currentClient;
      id v17 = "%s Ignored resetting request context because current client is %p.";
      BOOL v13 = 1;
      goto LABEL_21;
    }
    BOOL v13 = 1;
    goto LABEL_26;
  }
  if (v16)
  {
    *(_DWORD *)long long buf = 136315394;
    id v27 = "-[ADCommandCenter _reallyEndSessionForDelegate:]";
    __int16 v28 = 2048;
    id v29 = v14;
    id v17 = "%s Ignored replacing request delegate with nil and resetting request context because request delegate is %p.";
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v17, buf, 0x16u);
  }
LABEL_26:
  id v20 = self->_currentClient;
  if (!v20 || v20 == v8)
  {
    if (v13) {
      [(ADSessionManager *)self->_sessionManager setHasActiveRequest:0];
    }
    [(ADCommandCenter *)self _removeAllSpeechCapturingContexts];
  }
}

- (void)_endSessionForDelegate:(id)a3
{
  id v4 = a3;
  if (self->_deferredRequestEndIdentifier
    && ([(ADCommandCenterCurrentRequest *)self->_currentRequest currentRequestId],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 isEqualToString:self->_deferredRequestEndIdentifier],
        v5,
        v6))
  {
    id v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v18 = "-[ADCommandCenter _endSessionForDelegate:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s delaying session end because there is an active request", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    id v8 = self->_deferredRequestEndIdentifier;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1001D1A84;
    v13[3] = &unk_10050A280;
    objc_copyWeak(&v16, (id *)buf);
    id v14 = v4;
    __int16 v15 = v8;
    BOOL v9 = v8;
    int v10 = objc_retainBlock(v13);
    id requestEndCompletion = self->_requestEndCompletion;
    self->_id requestEndCompletion = v10;

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    BOOL v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v18 = "-[ADCommandCenter _endSessionForDelegate:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s ending session immediately", buf, 0xCu);
    }
    [(ADCommandCenter *)self _reallyEndSessionForDelegate:v4];
  }
}

- (void)_setConfiguration:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = (ADCommandCenterClient *)a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    BOOL v12 = "-[ADCommandCenter _setConfiguration:forClient:]";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s configuration = %@, client = %@", (uint8_t *)&v11, 0x20u);
  }
  if (self->_currentClient == v7)
  {
    BOOL v9 = (AFClientConfiguration *)[v6 copy];
    clientConfiguration = self->_clientConfiguration;
    self->_clientConfiguration = v9;

    [(ADSpeechManager *)self->_speechManager setClientConfiguration:self->_clientConfiguration];
    [(ADCommandCenter *)self _setStarkRestriction:[(AFClientConfiguration *)self->_clientConfiguration isDeviceInStarkMode]];
    [(ADCommandCenter *)self _setCarDNDRestriction:[(AFClientConfiguration *)self->_clientConfiguration isDeviceInCarDNDMode]];
    [(ADCommandCenter *)self _setSupportsCarPlayVehicleDataRestriction:[(AFClientConfiguration *)self->_clientConfiguration supportsCarPlayVehicleData]];
    [(ADCommandCenter *)self _setWatchAuthenticated:[(AFClientConfiguration *)self->_clientConfiguration isDeviceWatchAuthenticated]];
    if (v6) {
      goto LABEL_9;
    }
  }
  else if (v6)
  {
    goto LABEL_9;
  }
  if (AFIsInternalInstall()) {
    byte_100585E38 = AFFetchDeviceCarryStatus();
  }
LABEL_9:
}

- (void)_prepareForAppLaunchForRequest:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001D1D0C;
  v7[3] = &unk_10050E160;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_setIsTimeoutSuspended:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001D1E58;
  v4[3] = &unk_10050CD50;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)_setModesConfiguration:(id)a3
{
  id v4 = a3;
  if (!self->_responseModeProvider)
  {
    BOOL v5 = objc_alloc_init(ADResponseModeProvider);
    responseModeProvider = self->_responseModeProvider;
    self->_responseModeProvider = v5;

    id v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      id v8 = self->_responseModeProvider;
      *(_DWORD *)long long buf = 136315394;
      id v21 = "-[ADCommandCenter _setModesConfiguration:]";
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s #modes Creating ResponseModeProvider %@", buf, 0x16u);
    }
  }
  BOOL v9 = [(ADCommandCenter *)self _contextManager];
  int v10 = [v9 localContextWithPrivacyClass:10];

  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_1001D2060;
  id v17 = &unk_1005061C0;
  id v11 = v10;
  id v18 = v11;
  BOOL v19 = self;
  BOOL v12 = [v4 mutatedCopyWithMutator:&v14];

  __int16 v13 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v21 = "-[ADCommandCenter _setModesConfiguration:]";
    __int16 v22 = 2112;
    id v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s #modes Updating modesconfiguration %@", buf, 0x16u);
  }
  -[ADResponseModeProvider updateModesConfiguration:](self->_responseModeProvider, "updateModesConfiguration:", v12, v14, v15, v16, v17);
}

- (void)_setHeadGestureRecognitionAvailability:(BOOL)a3
{
  if (self->_isHeadGestureRecognitionAvailable != a3)
  {
    BOOL v3 = a3;
    BOOL v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      CFStringRef v6 = @"#Bobble Unset bobble availability";
      if (v3) {
        CFStringRef v6 = @"#Bobble Set bobble availability";
      }
      int v7 = 136315394;
      id v8 = "-[ADCommandCenter _setHeadGestureRecognitionAvailability:]";
      __int16 v9 = 2112;
      CFStringRef v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
    }
    self->_isHeadGestureRecognitionAvailable = v3;
    self->_restrictionsWereSetForRequest = 0;
  }
}

- (void)_setCarDNDRestriction:(BOOL)a3
{
  if (self->_isInCarDNDMode != a3)
  {
    BOOL v3 = a3;
    BOOL v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      CFStringRef v6 = @"#rhodes Remove Car DND Restriction";
      if (v3) {
        CFStringRef v6 = @"#rhodes Add Car DND Restriction";
      }
      int v7 = 136315394;
      id v8 = "-[ADCommandCenter _setCarDNDRestriction:]";
      __int16 v9 = 2112;
      CFStringRef v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
    }
    self->_isInCarDNDMode = v3;
    self->_restrictionsWereSetForRequest = 0;
  }
}

- (void)_setSupportsCarPlayVehicleDataRestriction:(BOOL)a3
{
  if (self->_supportsCarPlayVehicleData != a3)
  {
    BOOL v3 = a3;
    BOOL v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      CFStringRef v6 = @"#CarPlay Remove supportsVehicleData Restriction";
      if (v3) {
        CFStringRef v6 = @"#CarPlay Add supportsCarPlayVehicleData Restriction";
      }
      int v7 = 136315394;
      id v8 = "-[ADCommandCenter _setSupportsCarPlayVehicleDataRestriction:]";
      __int16 v9 = 2112;
      CFStringRef v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
    }
    self->_supportsCarPlayVehicleData = v3;
    self->_restrictionsWereSetForRequest = 0;
  }
}

- (void)_setStarkRestriction:(BOOL)a3
{
  if (self->_isInStarkMode != a3)
  {
    BOOL v3 = a3;
    BOOL v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      CFStringRef v6 = @"#CarPlay Remove Stark Restriction";
      if (v3) {
        CFStringRef v6 = @"#CarPlay Add Stark Restriction";
      }
      int v7 = 136315394;
      id v8 = "-[ADCommandCenter _setStarkRestriction:]";
      __int16 v9 = 2112;
      CFStringRef v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
    }
    self->_isInStarkMode = v3;
    self->_restrictionsWereSetForRequest = 0;
  }
}

- (void)_setWatchAuthenticated:(BOOL)a3
{
  if (self->_isWatchAuthenticated != a3)
  {
    BOOL v3 = a3;
    BOOL v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      CFStringRef v6 = @"Not Authenticated";
      if (v3) {
        CFStringRef v6 = @"Authenticated";
      }
      int v7 = 136315394;
      id v8 = "-[ADCommandCenter _setWatchAuthenticated:]";
      __int16 v9 = 2112;
      CFStringRef v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s #WatchAuth authenticated: %@", (uint8_t *)&v7, 0x16u);
    }
    self->_isWatchAuthenticated = v3;
    self->_restrictionsWereSetForRequest = 0;
  }
}

- (void)_setHeadphonesAuthenticated:(BOOL)a3
{
  if (self->_isHeadphonesAuthenticated != a3)
  {
    BOOL v3 = a3;
    BOOL v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      CFStringRef v6 = @"Not Authenticated";
      if (v3) {
        CFStringRef v6 = @"Authenticated";
      }
      int v7 = 136315394;
      id v8 = "-[ADCommandCenter _setHeadphonesAuthenticated:]";
      __int16 v9 = 2112;
      CFStringRef v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s #HeadphonesAuth authenticated: %@", (uint8_t *)&v7, 0x16u);
    }
    self->_isHeadphonesAuthenticated = v3;
    self->_restrictionsWereSetForRequest = 0;
  }
}

- (void)_setLockState:(BOOL)a3 showingLockScreen:(BOOL)a4
{
  int v4 = a4;
  BOOL v5 = a3;
  int v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    CFStringRef v8 = @"Unlocked";
    if (v5) {
      CFStringRef v8 = @"Locked";
    }
    CFStringRef v9 = @"Not on lock screen";
    BOOL v12 = "-[ADCommandCenter _setLockState:showingLockScreen:]";
    int v11 = 136315650;
    CFStringRef v14 = v8;
    __int16 v13 = 2112;
    if (v4) {
      CFStringRef v9 = @"On Lock Screen";
    }
    __int16 v15 = 2112;
    CFStringRef v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %@, %@", (uint8_t *)&v11, 0x20u);
  }
  if (self->_deviceIsLocked != v5)
  {
    self->_deviceIsLocked = v5;
    self->_int deviceIsShowingLockScreen = v4;
    goto LABEL_11;
  }
  int deviceIsShowingLockScreen = self->_deviceIsShowingLockScreen;
  self->_deviceIsLocked = v5;
  self->_int deviceIsShowingLockScreen = v4;
  if (deviceIsShowingLockScreen != v4) {
LABEL_11:
  }
    self->_restrictionsWereSetForRequest = 0;
}

- (void)_setLanguageCode:(id)a3 outputVoice:(id)a4 isDefaultValue:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  CFStringRef v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    id v60 = "-[ADCommandCenter _setLanguageCode:outputVoice:isDefaultValue:]";
    __int16 v61 = 2112;
    id v62 = v8;
    __int16 v63 = 2112;
    id v64 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }
  int v11 = +[ADPreferences sharedPreferences];
  BOOL v12 = [v11 languageCodeWithFallback:0];
  __int16 v13 = [v11 outputVoiceWithFallback:0];
  BOOL v57 = [v11 isUsingDefaultLanguageSettings] ^ v5;
  if (v57)
  {
    [v11 setIsUsingDefaultLanguageSettings:v5];
    CFStringRef v14 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      id v60 = "-[ADCommandCenter _setLanguageCode:outputVoice:isDefaultValue:]";
      __int16 v61 = 1024;
      LODWORD(v62) = v5;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Using default language settings: %d", buf, 0x12u);
    }
  }
  id v58 = self;
  if ([v8 isEqualToString:@"ADLanguageCodeKeepSame"])
  {
    __int16 v15 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v60 = "-[ADCommandCenter _setLanguageCode:outputVoice:isDefaultValue:]";
      CFStringRef v16 = "%s Keeping language code the same";
      id v17 = v15;
      uint32_t v18 = 12;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, v16, buf, v18);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if ((AFPreferencesLanguageIsSupported() & 1) == 0)
  {
    __int16 v22 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      id v60 = "-[ADCommandCenter _setLanguageCode:outputVoice:isDefaultValue:]";
      __int16 v61 = 2112;
      id v62 = v8;
      CFStringRef v16 = "%s language code %@ is not supported for this device";
      id v17 = v22;
      uint32_t v18 = 22;
      goto LABEL_15;
    }
LABEL_16:
    id v23 = v12;

    int v24 = 0;
    id v8 = v23;
    goto LABEL_17;
  }
  if (([v8 isEqualToString:v12] & 1) == 0)
  {
    [v11 setLanguageCode:v8];
    id v35 = AFSiriLogContextDaemon;
    int v24 = 1;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_17;
    }
    *(_DWORD *)long long buf = 136315650;
    id v60 = "-[ADCommandCenter _setLanguageCode:outputVoice:isDefaultValue:]";
    __int16 v61 = 2112;
    id v62 = v12;
    __int16 v63 = 2112;
    id v64 = v8;
    id v36 = "%s language code changed from %@ to %@";
    goto LABEL_69;
  }
  BOOL v19 = +[AFLocalization sharedInstance];
  id v20 = [v19 allOutputVoiceIdentifiersForSiriLanguage:v8];
  id v21 = [v13 languageCode];
  if (![v20 containsObject:v21])
  {
    id v56 = +[AFLocalization sharedInstance];
    id v52 = objc_msgSend(v56, "voiceNamesForOutputLanguageCode:gender:", v8, objc_msgSend(v13, "gender"));
    id v53 = [v13 name];
    unsigned __int8 v55 = [v52 containsObject:v53];

    if (v55) {
      goto LABEL_64;
    }
    id v35 = AFSiriLogContextDaemon;
    int v24 = 1;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_17;
    }
    *(_DWORD *)long long buf = 136315650;
    id v60 = "-[ADCommandCenter _setLanguageCode:outputVoice:isDefaultValue:]";
    __int16 v61 = 2112;
    id v62 = v12;
    __int16 v63 = 2112;
    id v64 = v13;
    id v36 = "%s output voice language code updated to %@ due to mismatch voice info %@";
LABEL_69:
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, v36, buf, 0x20u);
    goto LABEL_17;
  }

LABEL_64:
  id v54 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v60 = "-[ADCommandCenter _setLanguageCode:outputVoice:isDefaultValue:]";
    __int16 v61 = 2112;
    id v62 = v8;
    _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "%s no need to change language code to %@ because it is already set to that language code", buf, 0x16u);
  }
  int v24 = 0;
LABEL_17:
  if (v9 && v8 && ([v9 isValidForSiriSessionLanguage:v8] & 1) == 0)
  {
    id v25 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315650;
      id v60 = "-[ADCommandCenter _setLanguageCode:outputVoice:isDefaultValue:]";
      __int16 v61 = 2112;
      id v62 = v9;
      __int16 v63 = 2112;
      id v64 = v8;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s output voice %@ is not supported for language code %@ for this device", buf, 0x20u);
    }
    if (v24) {
      id v26 = 0;
    }
    else {
      id v26 = v13;
    }
    id v27 = v26;

    id v9 = v27;
  }
  __int16 v28 = [v9 languageCode];
  id v29 = [v28 length];

  if (v29)
  {
    p_isa = (id *)&v58->super.isa;
  }
  else
  {
    id v31 = AFOutputVoiceLanguageForRecognitionLanguage();
    p_isa = (id *)&v58->super.isa;
    if (v24)
    {
      if (v13)
      {
        __int16 v32 = +[AFLocalization sharedInstance];
        id v33 = [v32 voiceSimilarToVoice:v13 inSiriSessionLanguage:v31];

        id v34 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315650;
          id v60 = "-[ADCommandCenter _setLanguageCode:outputVoice:isDefaultValue:]";
          __int16 v61 = 2112;
          id v62 = v33;
          __int16 v63 = 2112;
          id v64 = v13;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%s Language code changed, using similar voice %@ to previously selected voice %@", buf, 0x20u);
        }
        p_isa = (id *)&v58->super.isa;
      }
      else
      {
        id v33 = +[AFVoiceInfo voiceInfoForLanguageCode:v31];

        id v37 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315394;
          id v60 = "-[ADCommandCenter _setLanguageCode:outputVoice:isDefaultValue:]";
          __int16 v61 = 2112;
          id v62 = v33;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%s Language code changed and no previous output voice selected. Using %@", buf, 0x16u);
        }
      }
      if (!v33)
      {
        id v38 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315138;
          id v60 = "-[ADCommandCenter _setLanguageCode:outputVoice:isDefaultValue:]";
          _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s Voice info nil", buf, 0xCu);
        }
        id v33 = 0;
      }
    }
    else
    {
      id v33 = v13;
    }
    id v9 = v33;
  }
  unsigned int v39 = objc_msgSend(p_isa, "_outputVoice_setOutputVoice:", v9);
  char v40 = v39;
  int v41 = v57 | v24 | v39;
  if ((v57 | v24) == 1 && (v39 & 1) == 0)
  {
    [v11 synchronize];
    int v41 = 0;
  }
  if (v24)
  {
    [v11 setIsSiriFullUODSupported:0];
    [p_isa[29] languageCodeWasChangedTo:v8];
    id v42 = +[ADDaemon sharedDaemon];
    [v42 syncForReason:@"siri_locale_change" withCoalescing:0];

    id v43 = +[SSRVoiceProfileManager sharedInstance];
    __int16 v44 = +[CSPreferences sharedPreferences];
    unsigned int v45 = [v44 isPHSSupported];

    if (v45 && ([v43 isSATEnrolledForSiriProfileId:0 forLanguageCode:v8] & 1) == 0)
    {
      __int16 v46 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        id v60 = "-[ADCommandCenter _setLanguageCode:outputVoice:isDefaultValue:]";
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "%s Disabling voice trigger", buf, 0xCu);
      }
      sub_1001FD70C(0, 0);
    }
  }
  else if ((v40 & 1) == 0)
  {
    goto LABEL_60;
  }
  id v47 = objc_alloc_init((Class)NSMutableDictionary);
  __int16 v48 = v47;
  if (!v13)
  {
    id v49 = +[NSNull null];
    [v48 setObject:v49 forKey:@"ADSharedDataDidChangePreviousOutputVoiceKey"];

    if (v12) {
      goto LABEL_56;
    }
LABEL_58:
    id v50 = +[NSNull null];
    [v48 setObject:v50 forKey:@"ADSharedDataDidChangePreviousLanguageCodeKey"];

    goto LABEL_59;
  }
  [v47 setObject:v13 forKey:@"ADSharedDataDidChangePreviousOutputVoiceKey"];
  if (!v12) {
    goto LABEL_58;
  }
LABEL_56:
  [v48 setObject:v12 forKey:@"ADSharedDataDidChangePreviousLanguageCodeKey"];
LABEL_59:
  id v51 = +[NSNotificationCenter defaultCenter];
  [v51 postNotificationName:@"ADSharedDataDidChangeNotification" object:0 userInfo:v48];

LABEL_60:
  if (v41) {
    [v11 synchronize];
  }
}

- (void)_setLanguageCode:(id)a3 outputVoice:(id)a4
{
}

- (void)resumeInterruptedAudioPlaybackIfNeeded
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D3178;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_forceAudioSessionInactiveWithOptions:(unint64_t)a3 completion:(id)a4
{
  CFStringRef v6 = (void (**)(void))a4;
  int v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    CFStringRef v10 = "-[ADCommandCenter _forceAudioSessionInactiveWithOptions:completion:]";
    __int16 v11 = 2048;
    unint64_t v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s options = %lu", (uint8_t *)&v9, 0x16u);
  }
  speechManager = self->_speechManager;
  if (speechManager)
  {
    [(ADSpeechManager *)speechManager endSession:a3 & 1 completion:v6];
  }
  else if (v6)
  {
    v6[2](v6);
  }
}

- (void)_forceAudioSessionActiveWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    uint32_t v18 = "-[ADCommandCenter _forceAudioSessionActiveWithContext:completion:]";
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  id v9 = v6;
  unint64_t v10 = (unint64_t)[v9 options];
  if (self->_hasIncomingCall || self->_isInCall)
  {
    LODWORD(v11) = 1;
    [(AFSpeechRequestOptions *)self->_currentSpeechRequestOptions setIsOnPhoneCall:1];
  }
  else
  {
    uint64_t v11 = (v10 >> 1) & 1;
  }
  unint64_t v12 = v9;
  if (self->_currentSpeechRequestOptions)
  {
    __int16 v13 = [v9 speechRequestOptions];
    if (v13) {
      LODWORD(v11) = 0;
    }

    unint64_t v12 = v9;
    if (v11 == 1)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1001D35DC;
      v16[3] = &unk_100508698;
      void v16[4] = self;
      unint64_t v12 = [v9 mutatedCopyWithMutator:v16];

      CFStringRef v14 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315394;
        uint32_t v18 = "-[ADCommandCenter _forceAudioSessionActiveWithContext:completion:]";
        __int16 v19 = 2112;
        id v20 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s context = %@ (updated)", buf, 0x16u);
      }
    }
  }
  __int16 v15 = [(ADCommandCenter *)self _speechManager];
  [v15 prepareAudioSystemWithContext:v12 completion:v7];
}

- (void)_preheatWithStyle:(int64_t)a3 forOptions:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  kdebug_trace();
  unint64_t v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315650;
    CFStringRef v16 = "-[ADCommandCenter _preheatWithStyle:forOptions:completion:]";
    __int16 v17 = 2048;
    int64_t v18 = a3;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s %ld %@", (uint8_t *)&v15, 0x20u);
  }
  id v11 = +[CSSiriVibrationManager sharedManager];
  if (a3 != 5)
  {
    unint64_t v12 = [(ADCommandCenter *)self _sessionManager];
    [v12 preheatAndMakeQuiet:a3 == 1];
  }
  [v8 activationEvent];
  if (AFSpeechEventIsBluetooth())
  {
    __int16 v13 = +[ADBluetoothManager sharedInstance];
    CFStringRef v14 = [v8 activationDeviceIdentifier];
    [v13 prewarmDeviceWithIdentifier:v14];
  }
  if (v9) {
    v9[2](v9);
  }
}

- (void)_preheatViaRequestDispatcher
{
  BOOL v3 = [(ADCommandCenter *)self _sessionManager];
  id v13 = [v3 languageCode];

  if ((AFShouldRunAsrOnServerForUOD() & 1) != 0 || AFDeviceSupportsSiriUOD()) {
    id v4 = [(ADCommandCenter *)self _updateUODAssetStatusForLanguage:v13];
  }
  if (self->_siriHybridUODSupported || self->_siriFullUODSupported)
  {
    BOOL v5 = +[ADMultiUserService sharedService];
    uint64_t v6 = [v5 getDeviceOwnerSharedUserId];
    id v7 = (void *)v6;
    id v8 = (void *)AFMultiUserDefaultSharedUserId;
    if (v6) {
      id v8 = (void *)v6;
    }
    id v9 = v8;

    unint64_t v10 = [(ADCommandCenter *)self _requestDispatcherService];
    id v11 = [(ADCommandCenter *)self _account];
    unint64_t v12 = [v11 assistantIdentifier];
    [v10 prewarmWithAssistantId:v12 languageCode:v13 prewarmOptions:2 sharedUserId:v9];
  }
}

- (void)_getDictationLanguages:(id)a3 options:(id)a4 speechOptions:(id)a5 delegate:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  CFStringRef v16 = (void (**)(id, void *, void *))a7;
  __int16 v17 = [v13 languageDetectionUserContext];
  int v18 = AFShouldUseLanguageDetector();
  __int16 v19 = AFSiriLogContextDaemon;
  BOOL v20 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (!v18)
  {
    if (v20)
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[ADCommandCenter _getDictationLanguages:options:speechOptions:delegate:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s Language detector is unavailable/disabled. Falling back to non LID dictation flow", buf, 0xCu);
    }
    id v29 = [v13 languageCodeOverride];
    __int16 v30 = AFOverrideLanguageCode();

    if (v30)
    {
      unsigned int v45 = v30;
      id v31 = +[NSArray arrayWithObjects:&v45 count:1];
      if (!v16) {
        goto LABEL_12;
      }
    }
    else
    {
      id v31 = 0;
      if (!v16)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    v16[2](v16, v30, v31);
    goto LABEL_12;
  }
  if (v20)
  {
    *(_DWORD *)long long buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[ADCommandCenter _getDictationLanguages:options:speechOptions:delegate:completion:]";
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    id v47 = v17;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s Trying to use language detector with language code: %@, user context: %@", buf, 0x20u);
  }
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = sub_1001BE52C;
  v43[4] = sub_1001BE53C;
  id v44 = 0;
  id v21 = [v13 languageCodeOverride];
  __int16 v22 = AFOverrideLanguageCode();

  __int16 v32 = _NSConcreteStackBlock;
  uint64_t v33 = 3221225472;
  id v34 = sub_1001D3CB8;
  id v35 = &unk_100506198;
  id v36 = self;
  id v42 = v43;
  id v37 = v17;
  id v38 = v15;
  id v23 = v22;
  id v39 = v23;
  id v40 = v14;
  int v41 = v16;
  id v24 = v37;
  id v25 = &v32;
  id v26 = +[CSLanguageDetectorAssetMonitor sharedInstance];
  *(void *)long long buf = _NSConcreteStackBlock;
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = sub_1002288AC;
  id v47 = &unk_10050DF10;
  id v48 = v24;
  id v49 = v25;
  id v27 = v25;
  id v28 = v24;
  [v26 supportedLocale:buf];

  _Block_object_dispose(v43, 8);
LABEL_13:
}

- (void)UIService:(id)a3 didPresentUIResponseForCommand:(id)a4 withExecutionInfo:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D42BC;
  block[3] = &unk_10050DCB8;
  void block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(queue, block);
}

- (void)UIService:(id)a3 executeHandler:(id)a4 forCommand:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(void))a4;
  id v10 = a5;
  if (v9)
  {
    if ([(AFSpeechRequestOptions *)self->_currentSpeechRequestOptions activationEvent] != (id)17)
    {
LABEL_30:
      v9[2](v9);
      goto LABEL_31;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id v26 = 136315138;
        *(void *)&v26[4] = "-[ADCommandCenter UIService:executeHandler:forCommand:]";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Unrelated reply to announced notification", v26, 0xCu);
      }
      id v12 = +[AFAnalytics sharedAnalytics];
      id v13 = v12;
      uint64_t v14 = 6013;
      goto LABEL_20;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFStringRef v16 = [v10 views];
      id v13 = [v16 firstObject];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int16 v17 = [v13 dialogIdentifier];
        if ([v17 isEqualToString:@"unsupportedFeatureIdiomDucs#unsupportedDuringRingingCall"])
        {
          int v18 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)id v26 = 136315138;
            *(void *)&v26[4] = "-[ADCommandCenter UIService:executeHandler:forCommand:]";
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Unrelated reply to announce call", v26, 0xCu);
          }
          __int16 v19 = +[AFAnalytics sharedAnalytics];
          [v19 logEventWithType:6013 context:0];

          v9[2](v9);
          goto LABEL_31;
        }
      }
      id v24 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id v26 = 136315138;
        *(void *)&v26[4] = "-[ADCommandCenter UIService:executeHandler:forCommand:]";
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s Related reply to triggerless request", v26, 0xCu);
      }
      id v25 = +[AFAnalytics sharedAnalytics];
      [v25 logEventWithType:6011 context:0];

      goto LABEL_29;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v20 = AFSiriLogContextDaemon;
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
LABEL_19:
        id v12 = +[AFAnalytics sharedAnalytics];
        id v13 = v12;
        uint64_t v14 = 6011;
LABEL_20:
        [v12 logEventWithType:v14 context:0];
LABEL_29:

        goto LABEL_30;
      }
      *(_DWORD *)id v26 = 136315138;
      *(void *)&v26[4] = "-[ADCommandCenter UIService:executeHandler:forCommand:]";
      id v21 = "%s Related reply to triggerless request";
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_30;
      }
      __int16 v22 = [v10 notificationType];
      unsigned int v23 = [v22 isEqualToString:SANotificationTypeConnectedCallValue];

      if (!v23) {
        goto LABEL_30;
      }
      BOOL v20 = AFSiriLogContextDaemon;
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
        goto LABEL_19;
      }
      *(_DWORD *)id v26 = 136315138;
      *(void *)&v26[4] = "-[ADCommandCenter UIService:executeHandler:forCommand:]";
      id v21 = "%s Related reply to announce call request";
    }
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v21, v26, 0xCu);
    goto LABEL_19;
  }
  id v15 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id v26 = 136315138;
    *(void *)&v26[4] = "-[ADCommandCenter UIService:executeHandler:forCommand:]";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s called with nil command handler; returning",
      v26,
      0xCu);
  }
LABEL_31:
}

- (void)speechManager:(id)a3 willStopRecordingWithSignpostID:(unint64_t)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001D4918;
  v5[3] = &unk_10050D8C0;
  void v5[4] = self;
  void v5[5] = a4;
  dispatch_async(queue, v5);
}

- (id)_handleConfidenceScores:(id)a3 classification:(unint64_t)a4 classifiedUser:(id)a5 unknownUserScore:(int64_t)a6 duration:(int64_t)a7 version:(int64_t)a8 thresholdingType:(id)a9 assetVersion:(id)a10
{
  id v16 = a3;
  id v17 = a5;
  id v61 = a9;
  id v60 = a10;
  int v18 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315395;
    *(void *)&uint8_t buf[4] = "-[ADCommandCenter _handleConfidenceScores:classification:classifiedUser:unknownUserScore:durati"
                         "on:version:thresholdingType:assetVersion:]";
    *(_WORD *)&unsigned char buf[12] = 2113;
    id v19 = v16;
    *(void *)&buf[14] = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s confidenceScores = %{private}@", buf, 0x16u);
    int v18 = AFSiriLogContextDaemon;
  }
  else
  {
    id v19 = v16;
  }
  BOOL v20 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
  int64_t v21 = a8;
  int64_t v22 = a6;
  unsigned int v23 = v17;
  id v24 = self;
  unint64_t v25 = a4;
  int64_t v26 = a7;
  int64_t v27 = v21;
  if (v20)
  {
    *(_DWORD *)long long buf = 136316931;
    *(void *)&uint8_t buf[4] = "-[ADCommandCenter _handleConfidenceScores:classification:classifiedUser:unknownUserScore:durati"
                         "on:version:thresholdingType:assetVersion:]";
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = v25;
    *(_WORD *)&buf[22] = 2113;
    v85 = (uint64_t (*)(uint64_t, uint64_t))v17;
    *(_WORD *)id v86 = 2048;
    *(void *)&v86[2] = v22;
    *(_WORD *)&v86[10] = 2048;
    *(void *)&v86[12] = v26;
    __int16 v87 = 2048;
    int64_t v88 = v21;
    __int16 v89 = 2112;
    id v90 = v61;
    __int16 v91 = 2112;
    id v92 = v60;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s classification = %ld, classifiedUser = %{private}@, unknownScore = %ld, duration = %ld, version = %ld, thresholdingType = %@, assetVersion = %@", buf, 0x52u);
  }
  v24->_hasSentAtLeastOneUserConfidenceScore = 1;
  id v28 = objc_alloc_init((Class)SAConfidenceScores);
  id v29 = v19;
  __int16 v30 = SiriCoreUUIDStringCreate();
  [v28 setAceId:v30];

  id v31 = [(ADCommandCenter *)v24 _currentRequest];
  __int16 v32 = [v31 currentRequestId];
  [v28 setRefId:v32];

  [v28 setProcessedAudioDurationMilliseconds:v26];
  if ([v61 isEqualToString:kCSSpeakerIdentificationVTInvocationScoreThresholdingType])
  {
    uint64_t v33 = (id *)&SAVoiceIDConfidenceScoresThresholdTypeVOICE_TRIGGERValue;
LABEL_10:
    id v34 = *v33;
    goto LABEL_12;
  }
  if ([v61 isEqualToString:kCSSpeakerIdentificationNonVTInvocationScoreThresholdingType])
  {
    uint64_t v33 = (id *)&SAVoiceIDConfidenceScoresThresholdTypeTAP_INVOCATIONValue;
    goto LABEL_10;
  }
  id v34 = 0;
LABEL_12:
  id v59 = v34;
  [v28 setThresholdType:v34];
  [v28 setAssetVersion:v60];
  switch(v25)
  {
    case 0uLL:
      [v28 setUserIdentityClassification:SAUserIdentityClassificationUnknownValue];
      break;
    case 1uLL:
      [v28 setUserIdentityClassification:SAUserIdentityClassificationUnsure1Value];
      break;
    case 2uLL:
      [v28 setUserIdentityClassification:SAUserIdentityClassificationUnsureNValue];
      break;
    case 3uLL:
      [v28 setUserIdentityClassification:SAUserIdentityClassificationKnownValue];
      break;
    case 4uLL:
      [v28 setUserIdentityClassification:SAUserIdentityClassificationConfidentValue];
      break;
    default:
      id v35 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[ADCommandCenter _handleConfidenceScores:classification:classifiedUser:unknownUserScore:du"
                             "ration:version:thresholdingType:assetVersion:]";
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = v25;
        _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%s Invalid classification: %ld", buf, 0x16u);
      }
      break;
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v85 = sub_1001BE52C;
  *(void *)id v86 = sub_1001BE53C;
  *(void *)&v86[8] = 0;
  uint64_t v72 = 0;
  id v73 = &v72;
  uint64_t v74 = 0x3032000000;
  id v75 = sub_1001BE52C;
  id v76 = sub_1001BE53C;
  id v77 = 0;
  if (AFIsInternalInstall() && AFSupportsMultiUser())
  {
    id v36 = +[ADMultiUserTestSupport sharedService];
    id v37 = [v36 getDebugVoiceIdScores];

    id v38 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int16 v78 = 136315394;
      id v79 = "-[ADCommandCenter _handleConfidenceScores:classification:classifiedUser:unknownUserScore:duration:version:th"
            "resholdingType:assetVersion:]";
      __int16 v80 = 2112;
      __int16 v81 = v37;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%s Setting debug scores: %@", v78, 0x16u);
    }
  }
  else
  {
    id v37 = 0;
  }
  id v39 = +[ADMultiUserService sharedService];
  [v39 setRawScores:v29];

  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_1001D5294;
  v62[3] = &unk_100506148;
  id v68 = &v72;
  v62[4] = v24;
  id v40 = v37;
  __int16 v63 = v40;
  id v41 = v29;
  id v64 = v41;
  id v65 = 0;
  id v42 = v23;
  id v66 = v42;
  id v69 = buf;
  int64_t v70 = v22;
  id v43 = v28;
  id v67 = v43;
  int64_t v71 = v27;
  id v44 = objc_retainBlock(v62);
  unsigned int v45 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    cachedConfidenceScoresFromRemote = v24->_cachedConfidenceScoresFromRemote;
    *(_DWORD *)__int16 v78 = 136315394;
    id v79 = "-[ADCommandCenter _handleConfidenceScores:classification:classifiedUser:unknownUserScore:duration:version:thre"
          "sholdingType:assetVersion:]";
    __int16 v80 = 2112;
    __int16 v81 = cachedConfidenceScoresFromRemote;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "%s Using cached scores: %@", v78, 0x16u);
  }
  ((void (*)(void *, NSDictionary *))v44[2])(v44, v24->_cachedConfidenceScoresFromRemote);
  id v47 = [(id)v73[5] objectForKey:v42];
  if (v47)
  {

    goto LABEL_29;
  }
  id v49 = *(NSDictionary **)(*(void *)&buf[8] + 40);
  if (!v49)
  {
LABEL_29:
    id v48 = AFSiriLogContextDaemon;
    id v49 = v42;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int16 v78 = 136315394;
      id v79 = "-[ADCommandCenter _handleConfidenceScores:classification:classifiedUser:unknownUserScore:duration:version:th"
            "resholdingType:assetVersion:]";
      __int16 v80 = 2112;
      __int16 v81 = v42;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "%s Using classifiedUser: %@", v78, 0x16u);
      id v49 = v42;
    }
    goto LABEL_34;
  }
  id v50 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int16 v78 = 136315651;
    id v79 = "-[ADCommandCenter _handleConfidenceScores:classification:classifiedUser:unknownUserScore:duration:version:thre"
          "sholdingType:assetVersion:]";
    __int16 v80 = 2113;
    __int16 v81 = v42;
    __int16 v82 = 2113;
    __int16 v83 = v49;
    _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%s There is not a score for the classifiedUser %{private}@. Using highestScoreUser %{private}@", v78, 0x20u);
    id v49 = *(NSDictionary **)(*(void *)&buf[8] + 40);
  }
LABEL_34:
  [v43 setClassifiedUser:v49];
  if (v40)
  {
    id v51 = +[ADMultiUserTestSupport sharedService];
    id v52 = [v51 getClassifiedUser];

    [v43 setClassifiedUser:v52];
    id v53 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int16 v78 = 136315394;
      id v79 = "-[ADCommandCenter _handleConfidenceScores:classification:classifiedUser:unknownUserScore:duration:version:th"
            "resholdingType:assetVersion:]";
      __int16 v80 = 2112;
      __int16 v81 = v52;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "%s Overriding classifiedUser: %@", v78, 0x16u);
    }
    id v54 = +[ADMultiUserTestSupport sharedService];
    unsigned __int8 v55 = [v54 getUserIdentityClassification];

    [v43 setUserIdentityClassification:v55];
    id v56 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int16 v78 = 136315394;
      id v79 = "-[ADCommandCenter _handleConfidenceScores:classification:classifiedUser:unknownUserScore:duration:version:th"
            "resholdingType:assetVersion:]";
      __int16 v80 = 2112;
      __int16 v81 = v55;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "%s Overriding userIdentityClassification: %@", v78, 0x16u);
    }
  }
  else
  {
    id v52 = 0;
  }
  [(ADCommandCenter *)v24 _sendCommandToServer:v43 opportunistically:0];
  id v57 = v43;

  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(buf, 8);

  return v57;
}

- (id)_sharedMultiUserService
{
  return +[ADMultiUserService sharedService];
}

- (void)speechManager:(id)a3 didReceiveConfidenceScores:(id)a4 classification:(unint64_t)a5 classifiedUser:(id)a6 unknownUserScore:(int64_t)a7 duration:(int64_t)a8 version:(int64_t)a9 thresholdingType:(id)a10 assetVersion:(id)a11
{
  id v16 = a4;
  id v17 = a6;
  id v18 = a10;
  id v19 = a11;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D57F0;
  block[3] = &unk_100506120;
  void block[4] = self;
  id v26 = v16;
  int64_t v31 = a7;
  int64_t v32 = a8;
  int64_t v33 = a9;
  id v27 = v17;
  id v28 = v18;
  id v29 = v19;
  unint64_t v30 = a5;
  id v21 = v19;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  dispatch_async(queue, block);
}

- (void)speechManager:(id)a3 audioSessionDidBecomeActive:(BOOL)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001D58AC;
  v5[3] = &unk_10050CD50;
  BOOL v6 = a4;
  void v5[4] = self;
  dispatch_async(queue, v5);
}

- (void)speechManager:(id)a3 audioSessionWillBecomeActive:(BOOL)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001D5A14;
  v5[3] = &unk_10050CD50;
  BOOL v6 = a4;
  void v5[4] = self;
  dispatch_async(queue, v5);
}

- (void)speechManager:(id)a3 didChangeRecordingState:(BOOL)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001D5B58;
  v5[3] = &unk_10050CD50;
  BOOL v6 = a4;
  void v5[4] = self;
  dispatch_async(queue, v5);
}

- (void)speechManager:(id)a3 didRequestQuickStopWithContext:(id)a4
{
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    BOOL v6 = "-[ADCommandCenter speechManager:didRequestQuickStopWithContext:]";
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s This code path should not be used. Please file a radar.", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_handleExtractSpeechDataCompleted:(id)a3 inResponseTo:(id)a4 completion:(id)a5
{
  id v6 = a3;
  [(ADCommandCenter *)self _storeExtractedSpeechLocally:v6];
  [(ADCommandCenter *)self _invokeCompletionForCommand:v6];
}

- (void)_saQuickStop:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315650;
    id v29 = "-[ADCommandCenter _saQuickStop:executionContext:completion:]";
    __int16 v30 = 2112;
    id v31 = v8;
    __int16 v32 = 2112;
    id v33 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s %@ %@", buf, 0x20u);
  }
  if (AFSupportsHALDeviceRouting())
  {
    if ([v9 isFromRemote])
    {
      [(ADCommandCenter *)self _handleQuickStopCommandRoutedFromRemote:v8 completion:v10];
    }
    else
    {
      uint64_t v14 = [(AFRequestInfo *)self->_currentRequestInfo speechRequestOptions];
      id v15 = [(ADCommandCenter *)self _directInvocationContextForSpeechRequestOptions:v14 textToSpeechEnabled:[(ADCommandCenterClient *)self->_currentClient adTextToSpeechIsMuted] ^ 1];

      id v16 = +[SKIMediaControlsInvocation quickStopDirectInvocationPayload];
      if (!v16)
      {
        id v17 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315138;
          id v29 = "-[ADCommandCenter _saQuickStop:executionContext:completion:]";
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Nil payload returned by SKIMediaControlsInvocation", buf, 0xCu);
        }
      }
      id v18 = +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:v15 payload:v16];
      if (!v18)
      {
        id v19 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315650;
          id v29 = "-[ADCommandCenter _saQuickStop:executionContext:completion:]";
          __int16 v30 = 2112;
          id v31 = v15;
          __int16 v32 = 2112;
          id v33 = v16;
          _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s Nil RunSKE command returned by SKIDirectInvocation for context: %@, payload: %@", buf, 0x20u);
        }
      }
      BOOL v20 = [(ADCommandCenterCurrentRequest *)self->_currentRequest currentRequestId];
      id v21 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 136315394;
        id v29 = "-[ADCommandCenter _saQuickStop:executionContext:completion:]";
        __int16 v30 = 2112;
        id v31 = v20;
        _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%s Current request ID: %@", buf, 0x16u);
      }
      [v18 setRefId:v20];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1001D614C;
      v25[3] = &unk_100509690;
      id v26 = v8;
      id v27 = v10;
      [(ADCommandCenter *)self _handleCommand:v18 executionContext:v9 completion:v25];
    }
  }
  else
  {
    id v12 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      id v22 = v12;
      id v23 = objc_opt_class();
      *(_DWORD *)long long buf = 136315394;
      id v29 = "-[ADCommandCenter _saQuickStop:executionContext:completion:]";
      __int16 v30 = 2112;
      id v31 = v23;
      id v24 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s %@ is not supported on this platform", buf, 0x16u);
    }
    id v13 = [objc_alloc((Class)SACommandFailed) initWithReason:@"Not supported on this platform"];
    (*((void (**)(id, id, void))v10 + 2))(v10, v13, 0);
  }
}

- (void)_handleQuickStopCommandRoutedFromRemote:(id)a3 completion:(id)a4
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001D64F8;
  v13[3] = &unk_1005060D0;
  id v14 = a3;
  id v15 = a4;
  id v6 = v15;
  id v7 = v14;
  id v8 = objc_retainBlock(v13);
  id v9 = [(ADCommandCenter *)self _contextManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001D65C8;
  v11[3] = &unk_1005060F8;
  void v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 getLocalContextWithPrivacyClass:10 completion:v11];
}

- (id)_directInvocationContextForSpeechRequestOptions:(id)a3 textToSpeechEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc_init((Class)SKIDirectInvocationContext);
  [v6 setVoiceTriggerEnabled:sub_1001FD6CC()];
  [v6 setTextToSpeechEnabled:v4];
  objc_msgSend(v6, "setEyesFree:", objc_msgSend(v5, "isEyesFree"));
  id v7 = [v5 activationEvent];

  id v8 = sub_10035C6FC((uint64_t)v7);
  [v6 setInputOrigin:v8];

  [v6 setInteractionType:SAIntentGroupAceInteractionTypeDialogDrivenValue];
  return v6;
}

- (void)speechManager:(id)a3 performTwoShotPromptWithType:(int64_t)a4 context:(id)a5 completion:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001D6C7C;
  v14[3] = &unk_10050C278;
  v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  int64_t v17 = a4;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(queue, v14);
}

- (void)speechManager:(id)a3 languageDetectorDidFail:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001D70E4;
  v8[3] = &unk_10050E160;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)speechManager:(id)a3 didDetectLanguage:(id)a4 confidenceScores:(id)a5 isConfident:(BOOL)a6
{
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001D7220;
  v14[3] = &unk_10050CAD0;
  v14[4] = self;
  id v15 = v10;
  id v16 = v9;
  BOOL v17 = a6;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(queue, v14);
}

- (void)speechManager:(id)a3 didDetectEndpointAtTime:(double)a4 context:(id)a5
{
  id v7 = a3;
  speechRequestGroup = self->_speechRequestGroup;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D74F8;
  block[3] = &unk_10050E278;
  id v12 = v7;
  id v13 = self;
  double v14 = a4;
  id v10 = v7;
  dispatch_group_notify(speechRequestGroup, queue, block);
}

- (void)speechManager:(id)a3 didDetectStartpointAtTime:(double)a4 context:(id)a5
{
  id v6 = a5;
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001D7678;
  v9[3] = &unk_10050E160;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (void)speechManager:(id)a3 recognitionDidCompleteWithError:(id)a4 secureOfflineOnlyRecognition:(BOOL)a5 sessionUUID:(id)a6 statistics:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D77CC;
  block[3] = &unk_100506058;
  BOOL v23 = a5;
  id v19 = v13;
  id v20 = v11;
  id v21 = self;
  id v22 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  dispatch_async(queue, block);
}

- (void)speechManager:(id)a3 didProduceLocalLoggablePackage:(id)a4 sessionUUID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D7B48;
  block[3] = &unk_10050DCB8;
  id v13 = v7;
  double v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

- (void)_handleLocalSpeechRecognitionForOfflineSupport:(id)a3 logText:(BOOL)a4
{
  id v6 = a3;
  id v11 = objc_alloc_init((Class)SASSpeechRecognized);
  id v7 = [v6 aceRecognition];

  [v11 setRecognition:v7];
  id v8 = [(SASStartSpeech *)self->_startSpeechCommand aceId];
  id v9 = SiriCoreUUIDStringCreate();
  [v11 setAceId:v9];

  [v11 setRefId:v8];
  [v11 setSessionId:v8];
  if (a4)
  {
    id v10 = objc_msgSend(v11, "af_bestTextInterpretation");
    [(ADCommandCenter *)self _metrics_logSpeechRecognized:v10 resultId:@"0"];
  }
  else
  {
    [(ADCommandCenter *)self _metrics_logSpeechRecognized:0 resultId:@"0"];
  }
}

- (void)speechManager:(id)a3 didRecognizePackage:(id)a4 sessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001D7EC4;
  v15[3] = &unk_10050DC68;
  id v16 = v9;
  id v17 = v8;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(queue, v15);
}

- (void)speechManager:(id)a3 didRecognizeRawEagerRecognitionCandidate:(id)a4 sessionUUID:(id)a5
{
  id v6 = a4;
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001D8970;
  v9[3] = &unk_10050E160;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (void)speechManager:(id)a3 didRecognizeTokens:(id)a4 sessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001D8BB8;
  v15[3] = &unk_10050DC68;
  id v16 = v9;
  id v17 = v8;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(queue, v15);
}

- (void)speechManager:(id)a3 didBeginLocalRecognitionWithContext:(id)a4 sessionUUID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D8EF8;
  block[3] = &unk_10050DCB8;
  id v13 = v7;
  id v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

- (void)speechManager:(id)a3 didFinishWritingAudioFile:(id)a4 error:(id)a5 context:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    id v22 = "-[ADCommandCenter speechManager:didFinishWritingAudioFile:error:context:]";
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }
  queue = self->_queue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001D9104;
  v17[3] = &unk_10050DC68;
  void v17[4] = self;
  id v18 = v9;
  id v19 = v10;
  id v20 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  dispatch_async(queue, v17);
}

- (void)speechManager:(id)a3 didFailWithError:(id)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v29 = "-[ADCommandCenter speechManager:didFailWithError:context:]";
    __int16 v30 = 2112;
    id v31 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (!v10)
  {
    id v10 = +[AFError errorWithCode:213];
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D9390;
  block[3] = &unk_10050DCB8;
  void block[4] = self;
  id v14 = v10;
  id v26 = v14;
  id v27 = v11;
  id v15 = v11;
  dispatch_async(queue, block);
  speechRequestGroup = self->_speechRequestGroup;
  id v17 = self->_queue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001D93A4;
  v20[3] = &unk_10050DD08;
  id v21 = v9;
  id v22 = self;
  id v23 = v14;
  SEL v24 = a2;
  id v18 = v14;
  id v19 = v9;
  dispatch_group_notify(speechRequestGroup, v17, v20);
}

- (void)speechManager:(id)a3 didCancelWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v20 = "-[ADCommandCenter speechManager:didCancelWithContext:]";
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D9738;
  block[3] = &unk_10050E160;
  void block[4] = self;
  id v18 = v7;
  id v10 = v7;
  dispatch_async(queue, block);
  speechRequestGroup = self->_speechRequestGroup;
  id v12 = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001D9744;
  v14[3] = &unk_10050E160;
  id v15 = v6;
  id v16 = self;
  id v13 = v6;
  dispatch_group_notify(speechRequestGroup, v12, v14);
}

- (void)speechManager:(id)a3 didFinishWithCapturingMode:(int64_t)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    id v27 = "-[ADCommandCenter speechManager:didFinishWithCapturingMode:context:]";
    __int16 v28 = 2048;
    int64_t v29 = a4;
    __int16 v30 = 2112;
    id v31 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s capturingMode = %zd, context = %@", buf, 0x20u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D9A68;
  block[3] = &unk_10050E160;
  void block[4] = self;
  id v12 = v9;
  id v25 = v12;
  dispatch_async(queue, block);
  speechRequestGroup = self->_speechRequestGroup;
  id v14 = self->_queue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001D9AC4;
  v20[3] = &unk_10050E278;
  id v15 = v8;
  id v21 = v15;
  id v22 = self;
  int64_t v23 = a4;
  dispatch_group_notify(speechRequestGroup, v14, v20);
  int v16 = AFIsNano();
  if (a4 == 1 && v16)
  {
    id v17 = AFSiriLogContextDaemon;
    BOOL v18 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    id v19 = (const char *)kAssistantDarwinNotificationSpeechCaptureFinished;
    if (v18)
    {
      *(_DWORD *)long long buf = 136315394;
      id v27 = "-[ADCommandCenter speechManager:didFinishWithCapturingMode:context:]";
      __int16 v28 = 2080;
      int64_t v29 = kAssistantDarwinNotificationSpeechCaptureFinished;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Post XPC event to notifyd: %s", buf, 0x16u);
    }
    notify_post(v19);
  }
}

- (void)speechManager:(id)a3 didReceiveLastAudioBufferWithEndpointMode:(int64_t)a4 totalPacketCount:(int64_t)a5 endpointerMetrics:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136316162;
    int64_t v29 = "-[ADCommandCenter speechManager:didReceiveLastAudioBufferWithEndpointMode:totalPacketCount:endpointerMetrics:context:]";
    __int16 v30 = 2048;
    int64_t v31 = a4;
    __int16 v32 = 2048;
    int64_t v33 = a5;
    __int16 v34 = 2112;
    id v35 = v13;
    __int16 v36 = 2112;
    id v37 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s endpointMode = %zd, totalPacketCount = %zd, endpointerMetrics = %@, context = %@", buf, 0x34u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D9D68;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
  speechRequestGroup = self->_speechRequestGroup;
  BOOL v18 = self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001D9E20;
  v21[3] = &unk_10050D778;
  int64_t v25 = a5;
  int64_t v26 = a4;
  id v22 = v12;
  id v23 = v13;
  SEL v24 = self;
  id v19 = v13;
  id v20 = v12;
  dispatch_group_notify(speechRequestGroup, v18, v21);
}

- (void)speechManagerDidDelayEndpointForMusic:(id)a3
{
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADCommandCenter speechManagerDidDelayEndpointForMusic:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
}

- (void)speechManagerDidDetectMusic:(id)a3
{
  int v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v9 = "-[ADCommandCenter speechManagerDidDetectMusic:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  speechRequestGroup = self->_speechRequestGroup;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001DA1B4;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_group_notify(speechRequestGroup, queue, block);
}

- (void)speechManager:(id)a3 capturedFingerprint:(id)a4 duration:(double)a5
{
  id v7 = a4;
  speechRequestGroup = self->_speechRequestGroup;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001DA274;
  block[3] = &unk_10050E278;
  void block[4] = self;
  id v12 = v7;
  double v13 = a5;
  id v10 = v7;
  dispatch_group_notify(speechRequestGroup, queue, block);
}

- (void)speechManager:(id)a3 capturedPackets:(id)a4 atTimestamp:(double)a5 totalCount:(int64_t)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  if ([a7 wantsRecordedAudioBufferLogs])
  {
    id v14 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v15 = v14;
      *(_DWORD *)long long buf = 136315906;
      int64_t v26 = "-[ADCommandCenter speechManager:capturedPackets:atTimestamp:totalCount:context:]";
      __int16 v27 = 2048;
      id v28 = [v13 count];
      __int16 v29 = 2048;
      double v30 = a5;
      __int16 v31 = 2048;
      int64_t v32 = a6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s packets.count = %llu, timestamp = %f, count = %lld", buf, 0x2Au);
    }
  }
  speechRequestGroup = self->_speechRequestGroup;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001DA434;
  block[3] = &unk_10050D778;
  void block[4] = self;
  id v21 = v12;
  double v24 = a5;
  id v22 = v13;
  int64_t v23 = a6;
  id v18 = v13;
  id v19 = v12;
  dispatch_group_notify(speechRequestGroup, queue, block);
}

- (void)speechManager:(id)a3 didUpdateRecordingWithInfo:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  speechRequestGroup = self->_speechRequestGroup;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001DA7F0;
  block[3] = &unk_10050DCB8;
  id v23 = v8;
  double v24 = self;
  id v13 = v9;
  id v25 = v13;
  id v14 = v8;
  dispatch_group_notify(speechRequestGroup, queue, block);
  id v15 = self->_queue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001DAA18;
  v18[3] = &unk_10050DCB8;
  id v19 = v13;
  id v20 = self;
  id v21 = v10;
  id v16 = v10;
  id v17 = v13;
  dispatch_async(v15, v18);
}

- (void)speechManager:(id)a3 didStartRecordingWithInfo:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001DAE60;
  block[3] = &unk_10050DC68;
  void block[4] = self;
  id v12 = v9;
  id v34 = v12;
  id v13 = v10;
  id v35 = v13;
  id v14 = v8;
  id v36 = v14;
  dispatch_async(queue, block);
  id v15 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v16 = v15;
    id v17 = [v12 route];
    *(_DWORD *)long long buf = 136315394;
    id v38 = "-[ADCommandCenter speechManager:didStartRecordingWithInfo:context:]";
    __int16 v39 = 2112;
    id v40 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Recording started on route: %@", buf, 0x16u);
  }
  speechRequestGroup = self->_speechRequestGroup;
  id v19 = self->_queue;
  id v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  __int16 v27 = sub_1001DAF7C;
  id v28 = &unk_10050DC68;
  __int16 v29 = self;
  id v30 = v12;
  id v31 = v13;
  id v32 = v14;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_group_notify(speechRequestGroup, v19, &v25);
  id v23 = +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing];
  [v23 networkActivityStart:3 activate:1];

  double v24 = +[SNNetworkActivityTracing sharedInstance];
  [v24 networkActivityStart:3 activate:1 completion:0];
}

- (void)speechManager:(id)a3 willStartRecordingAtTimestamp:(double)a4 isFromFile:(BOOL)a5 inputAudioPowerWrapper:(id)a6 context:(id)a7
{
  id v11 = a6;
  id v12 = a7;
  id v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v23 = "-[ADCommandCenter speechManager:willStartRecordingAtTimestamp:isFromFile:inputAudioPowerWrapper:context:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001DB3E4;
  block[3] = &unk_1005086C0;
  void block[4] = self;
  id v18 = v11;
  id v19 = v12;
  BOOL v21 = a5;
  double v20 = a4;
  id v15 = v12;
  id v16 = v11;
  dispatch_async(queue, block);
}

- (void)_sendContextAndRestrictionsForSpeechRequestWithInfo:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[ADCommandCenter _sendContextAndRestrictionsForSpeechRequestWithInfo:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Recording info: %@", (uint8_t *)&v7, 0x16u);
  }
  id v6 = [(ADCommandCenter *)self _requestDelayManager];
  [v6 releaseStoredContextCommandsAndSendCommands:1];

  if (([v4 isDictation] & 1) == 0) {
    [(ADCommandCenter *)self _context_updateContext];
  }
  [(ADCommandCenter *)self _sendRestrictionsInPreparationForRequest];
}

- (void)_sendGizmoSharedDataIfNeeded
{
  if (AFSupportsPairedDevice() && (AFIsNano() & 1) == 0)
  {
    [(ADCommandCenter *)self sendGizmoData];
  }
}

- (void)_sendEnableServerEndpointerCommandWithRefID:(id)a3
{
  id v4 = a3;
  id v5 = +[AFPreferences sharedPreferences];
  unsigned int v6 = [v5 isAccessibleEndpointerEnabled];

  if (v6)
  {
    int v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      id v11 = "-[ADCommandCenter _sendEnableServerEndpointerCommandWithRefID:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Don't enable server endpointer when accessible endpointer is enabled", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    id v8 = objc_alloc_init((Class)SASEnableServerEndpointer);
    [v8 setRefId:v4];
    [(ADCommandCenter *)self _sendCommandToServer:v8];
    __int16 v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      id v11 = "-[ADCommandCenter _sendEnableServerEndpointerCommandWithRefID:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Sent enable server endpointer command.", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_trySendingShowRequestHandlingStatusForAsrOnDevice:(BOOL)a3 startSpeechRequestId:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  int v7 = (id *)&SAUIShowRequestHandlingStatusAsrStatusON_DEVICEValue;
  if (!v4) {
    int v7 = (id *)&SAUIShowRequestHandlingStatusAsrStatusON_SERVERValue;
  }
  id v8 = *v7;
  __int16 v9 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315650;
    id v17 = "-[ADCommandCenter _trySendingShowRequestHandlingStatusForAsrOnDevice:startSpeechRequestId:]";
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s #AsrOnServer Sending SAUIShowRequestHandlingStatus with asrStatus = %@ for startSpeechRequestId = %@", buf, 0x20u);
  }
  if (AFIsInternalInstall())
  {
    id v10 = objc_alloc_init((Class)SAUIShowRequestHandlingStatus);
    id v11 = +[NSUUID UUID];
    id v12 = [v11 UUIDString];
    [v10 setAceId:v12];

    [v10 setRefId:v6];
    [v10 setAsrStatus:v8];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1001DB8E4;
    v13[3] = &unk_100505BB0;
    id v14 = v8;
    id v15 = v6;
    [(ADCommandCenter *)self handleCommand:v10 completion:v13];
  }
}

- (void)_sendStartSpeechCommandWithSpeechManager:(id)a3 info:(id)a4 context:(id)a5
{
  id v144 = a3;
  v145 = (NSString *)a4;
  id v8 = a5;
  __int16 v9 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    v153 = "-[ADCommandCenter _sendStartSpeechCommandWithSpeechManager:info:context:]";
    __int16 v154 = 2112;
    v155 = v145;
    __int16 v156 = 2112;
    id v157 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s info = %@, context = %@", buf, 0x20u);
  }
  [(ADCommandCenter *)self _sendContextAndRestrictionsForSpeechRequestWithInfo:v145];
  if ([(NSString *)v145 isDictation])
  {
    id v10 = [v144 dictationOptions];
    id v11 = [v10 transcriptionMode];
    BOOL v138 = v11 == 0;
    if (v11)
    {
      if ([v10 transcriptionMode] != (id)3)
      {
        id v15 = objc_alloc_init((Class)SASStartStructuredDictationSpeechRequest);
        objc_msgSend(v15, "setTextToSpeechIsMuted:", -[ADCommandCenterClient adTextToSpeechIsMuted](self->_currentClient, "adTextToSpeechIsMuted"));
        id v49 = [v10 transcriptionMode];
        if (v49 == (id)1)
        {
          id v59 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 136315138;
            v153 = "-[ADCommandCenter _sendStartSpeechCommandWithSpeechManager:info:context:]";
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "%s starting location dictation request", buf, 0xCu);
          }
          id v51 = &SAStartStructuredDictationRequestStructuredDictationTypePLACEValue;
        }
        else
        {
          if (v49 != (id)2)
          {
LABEL_41:

            goto LABEL_42;
          }
          id v50 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 136315138;
            v153 = "-[ADCommandCenter _sendStartSpeechCommandWithSpeechManager:info:context:]";
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "%s starting person dictation request", buf, 0xCu);
          }
          id v51 = &SAStartStructuredDictationRequestStructuredDictationTypePERSONValue;
        }
        [v15 setStructuredDictationType:*v51];
        goto LABEL_41;
      }
      id v12 = [v144 dictationLanguages];
      if ([v12 count])
      {
        id v13 = [v144 dictationLanguages];
        id v14 = [v13 firstObject];
      }
      else
      {
        id v14 = 0;
      }

      id v52 = (SASPronunciationContext *)objc_alloc_init((Class)SASPronunciationContext);
      pronunciationContext = self->_pronunciationContext;
      self->_pronunciationContext = v52;

      [(SASPronunciationContext *)self->_pronunciationContext setTokenOffset:&off_100523870];
      [(SASPronunciationContext *)self->_pronunciationContext setDomainObjectPropertyIdentifier:@"PhonemeTranscription"];
      id v54 = self->_pronunciationContext;
      unsigned __int8 v55 = [v10 orthography];
      [(SASPronunciationContext *)v54 setOrthography:v55];

      [(SASPronunciationContext *)self->_pronunciationContext setLanguage:v14];
      id v15 = objc_alloc_init((Class)SASStartPronunciationRequest);
      id v56 = [(ADCommandCenter *)self _currentRequest];
      id v57 = [v56 currentRequestCommand];
      objc_msgSend(v15, "ad_setParentRequest:", v57);

      id v58 = [(AFSpeechRequestOptions *)self->_currentSpeechRequestOptions serverCommandId];
      [v15 setRefId:v58];

      [v15 setContext:self->_pronunciationContext];
    }
    else
    {
      id v14 = [v144 dictationLanguages];
      id v15 = +[SASStartSpeechDictation ad_startSpeechDictationWithAFDictationOptions:v10];
      [v15 setLanguages:v14];
      id v19 = +[NSLocale currentLocale];
      __int16 v20 = [v19 localeIdentifier];
      [v15 setRegion:v20];

      [v15 setCensorSpeech:sub_1001FB870()];
      id v21 = [v15 applicationName];

      if (!v21)
      {
        id v22 = +[NSBundle mainBundle];
        id v23 = [v22 bundleIdentifier];
        [v15 setApplicationName:v23];
      }
      double v24 = [v15 applicationName];
      unsigned int v25 = [v24 isEqualToString:@"OnDeviceDictationAudioData"];

      if (v25)
      {
        uint64_t v26 = [v10 samplingInfo];
        __int16 v27 = (void *)v26;
        if (v26) {
          CFStringRef v28 = (const __CFString *)v26;
        }
        else {
          CFStringRef v28 = &stru_10050F7D8;
        }
        [v15 setSelectedText:v28];
      }
      __int16 v29 = [v15 applicationVersion];

      if (!v29)
      {
        id v30 = +[NSBundle mainBundle];
        id v31 = [v30 objectForInfoDictionaryKey:kCFBundleVersionKey];
        [v15 setApplicationVersion:v31];
      }
      id v32 = [v15 interactionId];

      if (!v32)
      {
        int64_t v33 = SiriCoreUUIDStringCreate();
        [v15 setInteractionId:v33];
      }
    }

    goto LABEL_41;
  }
  [v144 setDictationOptions:0];
  if (self->_startingPronunciationRequest)
  {
    id v15 = objc_alloc_init((Class)SASStartPronunciationRequest);
    id v16 = [(ADCommandCenter *)self _currentRequest];
    id v17 = [v16 currentRequestCommand];
    objc_msgSend(v15, "ad_setParentRequest:", v17);

    __int16 v18 = [(AFSpeechRequestOptions *)self->_currentSpeechRequestOptions serverCommandId];
    [v15 setRefId:v18];

    [v15 setContext:self->_pronunciationContext];
    BOOL v138 = 0;
LABEL_42:
    id v60 = 0;
    id v47 = 0;
    goto LABEL_43;
  }
  id v34 = v8;
  id v35 = objc_alloc_init((Class)SASStartSpeechRequest);
  if (AFIsHorseman())
  {
    id v36 = [(ADCommandCenter *)self _locationManager];
    id v37 = [v36 createSetRequestOrigin];
    [v35 setSetRequestOrigin:v37];
  }
  objc_msgSend(v35, "setTextToSpeechIsMuted:", -[ADCommandCenterClient adTextToSpeechIsMuted](self->_currentClient, "adTextToSpeechIsMuted"));
  id v38 = [(ADCommandCenter *)self _fetchComputedModeAndUpdateRequestDelegate];
  [v35 setResponseMode:v38];
  __int16 v39 = +[AFPreferences sharedPreferences];
  objc_msgSend(v35, "setAutoPunctuationEnabled:", objc_msgSend(v39, "dictationAutoPunctuationEnabled"));

  id v40 = [(ADCommandCenter *)self _bargeInModes];
  if ([v40 count]) {
    [v35 setBargeInModes:v40];
  }
  id v41 = [v144 endpointerModelVersion];
  [v35 setClientModelVersion:v41];

  id v42 = [(ADCommandCenter *)self _approximatePreviousTTSInterval:v35];
  id v43 = v35;
  if (self->_siriHybridUODSupported)
  {
    id v44 = objc_alloc_init((Class)SASStartAsrOnServerRequest);
    objc_msgSend(v44, "setTextToSpeechIsMuted:", -[ADCommandCenterClient adTextToSpeechIsMuted](self->_currentClient, "adTextToSpeechIsMuted"));
    unsigned int v45 = [v43 bargeInModes];
    [v44 setBargeInModes:v45];

    objc_msgSend(v44, "setAutoPunctuationEnabled:", objc_msgSend(v43, "autoPunctuationEnabled"));
    __int16 v46 = [v43 clientModelVersion];
    [v44 setClientModelVersion:v46];

    [v44 setRunCamFtm:&__kCFBooleanFalse];
    id v15 = v44;

    id v47 = 0;
    id v48 = v15;
  }
  else
  {
    if (self->_siriFullUODSupported)
    {
      id v47 = [(ADCommandCenter *)self _startServerRequestWithSpeechRequest:v43 recordingContext:v34 recordingInfo:v145];
      id v48 = 0;
    }
    else
    {
      id v48 = 0;
      id v47 = 0;
    }
    id v15 = v43;
  }

  BOOL v138 = 0;
  id v8 = v34;
  id v60 = v48;
LABEL_43:
  if (!self->_currentSpeechRequestOptions
    && ([(NSString *)v145 isDictation] & 1) == 0
    && AFIsInternalInstall())
  {
    id v61 = +[SiriCoreSymptomsReporter sharedInstance];
    id v62 = +[NSProcessInfo processInfo];
    id v63 = [v62 processIdentifier];
    [v61 reportIssueForType:@"start_speech_request_without_speech_request_options" subType:0 context:0 processIdentifier:v63 walkboutStatus:byte_100585E38];
  }
  objc_msgSend(v15, "ad_setAFSpeechRequestOptions:", self->_currentSpeechRequestOptions);
  objc_msgSend(v15, "ad_setCSSiriRecordingInfo:", v145);
  id v64 = [v8 sessionUUID];
  [v15 setAceId:v64];

  if (AFIsInternalInstall())
  {
    id v65 = +[NSNumber numberWithBool:byte_100585E38];
    [v15 setIsCarryDevice:v65];
  }
  id v66 = [(ADCommandCenter *)self _motionManager];
  id v67 = [v66 motionActivity];
  [v15 setMotionActivity:v67];

  v141 = v66;
  id v68 = [v66 motionConfidence];
  [v15 setMotionConfidence:v68];

  [(ADCommandCenterClient *)self->_currentClient adInvalidateCurrentUserActivity];
  v142 = v47;
  if (!v47)
  {
    if (v60)
    {
      id v69 = v60;
      int64_t v71 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        uint64_t v72 = v71;
        id v73 = [v69 origin];
        uint64_t v74 = [v69 audioSource];
        *(_DWORD *)long long buf = 136315906;
        v153 = "-[ADCommandCenter _sendStartSpeechCommandWithSpeechManager:info:context:]";
        __int16 v154 = 2112;
        v155 = (NSString *)v69;
        __int16 v156 = 2112;
        id v157 = v73;
        __int16 v158 = 2112;
        v159 = v74;
        id v75 = "%s #AsrOnServer Sending %@ (origin = %@, source = %@)...instead of StartSpeechRequest since session suppor"
              "ts understanding on device and ASR is on server.";
LABEL_57:
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, v75, buf, 0x2Au);
      }
    }
    else
    {
      id v69 = v15;
      id v76 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        uint64_t v72 = v76;
        id v73 = [v69 origin];
        uint64_t v74 = [v69 audioSource];
        *(_DWORD *)long long buf = 136315906;
        v153 = "-[ADCommandCenter _sendStartSpeechCommandWithSpeechManager:info:context:]";
        __int16 v154 = 2112;
        v155 = (NSString *)v69;
        __int16 v156 = 2112;
        id v157 = v73;
        __int16 v158 = 2112;
        v159 = v74;
        id v75 = "%s Sending %@ (origin = %@, source = %@)...";
        goto LABEL_57;
      }
    }
    id v47 = 0;
    goto LABEL_59;
  }
  id v69 = v47;
  int64_t v70 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    v153 = "-[ADCommandCenter _sendStartSpeechCommandWithSpeechManager:info:context:]";
    __int16 v154 = 2112;
    v155 = (NSString *)v69;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "%s Sending %@ instead of StartSpeechRequest since session supports understanding on device", buf, 0x16u);
  }
LABEL_59:
  v143 = v69;
  if ([(NSString *)v145 isDictation])
  {
    id v77 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_71;
    }
    *(_DWORD *)long long buf = 136315138;
    v153 = "-[ADCommandCenter _sendStartSpeechCommandWithSpeechManager:info:context:]";
    __int16 v78 = "%s Not checking _areRequiredAssetsMissing since this is a Dictation request.";
    goto LABEL_62;
  }
  if (![(ADCommandCenter *)self _areRequiredAssetsMissing])
  {
LABEL_71:
    objc_opt_class();
    v139 = v60;
    id v140 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0 && self->_siriUODSupported)
    {
      id v84 = [(ADCommandCenter *)self _fetchComputedModeAndUpdateRequestDelegate];
      BOOL v85 = [(NSString *)v145 speechEvent] == (id)17;
      id v86 = objc_alloc((Class)SMTRequestContextData);
      v147[0] = _NSConcreteStackBlock;
      v147[1] = 3221225472;
      v147[2] = sub_1001DCF94;
      v147[3] = &unk_100505C48;
      id v87 = v15;
      id v148 = v87;
      id v88 = v84;
      id v149 = v88;
      v150 = self;
      BOOL v151 = v85;
      id v137 = [v86 initWithBuilder:v147];
      if ([(AFSpeechRequestOptions *)self->_currentSpeechRequestOptions isTest])
      {
        __int16 v89 = [(AFSpeechRequestOptions *)self->_currentSpeechRequestOptions testRequestOptions];
        id v90 = [(ADCommandCenter *)self _requestDispatcherService];
        v134 = [(ADCommandCenter *)self _account];
        __int16 v91 = [v134 assistantIdentifier];
        id v92 = [v143 aceId];
        v93 = [v87 origin];
        v94 = [(ADCommandCenter *)self _locationManager];
        [v94 knownLocation];
        v95 = id v135 = v88;
        [v89 jitContext];
        v96 = id v133 = v15;
        v97 = [v89 overrideModelPath];
        [v90 startTestSpeechRequestWithAssistantId:v91 requestId:v92 enableASR:1 inputOrigin:v93 location:v95 jitContext:v96 overrideModelPath:v97 requestContextData:v137];

        id v15 = v133;
        id v88 = v135;

        id v69 = v143;
        v98 = [v143 aceId];
        [(ADCommandCenter *)self _emitDeviceDynamicContextForRequest:v98];
      }
      else
      {
        v99 = [(ADCommandCenter *)self _requestDispatcherService];
        v100 = [(ADCommandCenter *)self _requestDispatcherSessionConfiguration];
        v101 = [v143 aceId];
        v102 = [v87 origin];
        v103 = [(ADCommandCenter *)self _locationManager];
        v104 = [v103 knownLocation];
        [v99 startSpeechRequestWithConfiguration:v100 requestId:v101 inputOrigin:v102 location:v104 asrOnServer:self->_siriHybridUODSupported requestContextData:v137];

        id v69 = v143;
        __int16 v89 = [v143 aceId];
        [(ADCommandCenter *)self _emitDeviceDynamicContextForRequest:v89];
      }

      id v60 = v139;
      id v8 = v140;
      id v47 = v142;
    }
    [(ADCommandCenter *)self _sendRetryableRequestToServer:v69];
    v105 = [v15 aceId];
    if (v47)
    {
      id v106 = v47;
    }
    else if (v60)
    {
      id v106 = v60;
    }
    else
    {
      id v106 = v15;
    }
    [(ADCommandCenter *)self _setCurrentRequestWithCommand:v106];
    [v8 updateStartSpeechId:v105];
    objc_storeStrong((id *)&self->_startSpeechCommand, v15);
    if (self->_siriFullUODSupported)
    {
      SiriCoreUUIDStringCreate();
      v107 = (NSString *)objc_claimAutoreleasedReturnValue();
      speechRecognitionResultUUID = self->_speechRecognitionResultUUID;
      self->_speechRecognitionResultUUID = v107;
    }
    v109 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v110 = self->_speechRecognitionResultUUID;
      *(_DWORD *)long long buf = 136315650;
      v153 = "-[ADCommandCenter _sendStartSpeechCommandWithSpeechManager:info:context:]";
      __int16 v154 = 2112;
      v155 = v110;
      __int16 v156 = 2112;
      id v157 = v105;
      _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_INFO, "%s StartSpeech resultUUID : %@ AceID : %@", buf, 0x20u);
    }
    v111 = [(ADCommandCenterCurrentRequest *)self->_currentRequest currentRequestId];
    unint64_t v112 = +[ADDaemon processLaunchMachTime];
    unint64_t v113 = +[ADDaemon processLoadedMachTime];
    BOOL hasReceivedFirstRequest = self->_hasReceivedFirstRequest;
    id v115 = v111;
    v116 = sub_1000D4598(v115);
    if (v116)
    {
      BOOL v117 = !hasReceivedFirstRequest;
      id v118 = objc_alloc_init((Class)ORCHSchemaORCHClientEvent);
      v136 = v105;
      id v119 = objc_alloc_init((Class)ORCHSchemaORCHClientEventMetadata);
      [v119 setRequestId:v116];
      [v118 setEventMetadata:v119];
      id v120 = objc_alloc_init((Class)ORCHSchemaORCHAssistantDaemonLaunchMetadataReported);
      [v120 setAssistantDaemonSpawnTimestampInNs:v112];
      [v120 setAssistantDaemonLoadedTimestampInNs:v113];
      [v120 setIsFirstRequest:v117];
      [v118 setAssistantdLaunchMetadataReported:v120];
      v121 = +[AssistantSiriAnalytics sharedStream];
      [v121 emitMessage:v118];

      v105 = v136;
    }
    else
    {
      v122 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        v153 = "_EmitDaemonLaunchMetadataReportedForRequestId";
        __int16 v154 = 2112;
        v155 = (NSString *)v115;
        _os_log_error_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_ERROR, "%s The requestId=%@ is malformed, unable to log SELF command", buf, 0x16u);
      }
    }
    id v47 = v142;

    self->_BOOL hasReceivedFirstRequest = 1;
    self->_speechHasAcceptedResultCandidate = 0;
    selectedResultCandidate = self->_selectedResultCandidate;
    self->_speechAcceptedResultCandidateDuration = 0.0;
    self->_selectedResultCandidate = 0;

    *(_WORD *)&self->_hasReceivedAtLeastOneResultCandidate = 0;
    [v144 setContext:v15];
    objc_msgSend(v144, "setIsDriving:", objc_msgSend(v141, "isDriving"));
    [(ADCommandCenter *)self _trySendingShowRequestHandlingStatusForAsrOnDevice:v142 != 0 startSpeechRequestId:v105];
    id v60 = v139;
    id v8 = v140;
    __int16 v83 = v143;
    if (v138)
    {
      v124 = _AFPreferencesMultilingualDictationTimeoutInMilliSeconds();
      v125 = v124;
      if (v124) {
        v126 = v124;
      }
      else {
        v126 = &off_100523F38;
      }
      v127 = +[AFPreferences sharedPreferences];
      unsigned int v128 = [v127 isLanguageDetectorEnabledByServer];

      id v129 = objc_alloc_init((Class)SASGetMultilingualDictationConfig);
      [v129 setMultilingualDisabled:v128 ^ 1];
      [v129 setMultilingualTimeoutInMillis:v126];
      v146[0] = _NSConcreteStackBlock;
      v146[1] = 3221225472;
      v146[2] = sub_1001DD174;
      v146[3] = &unk_10050B308;
      v146[4] = self;
      [(ADCommandCenter *)self _sendCommandToServer:v129 completion:v146];

      id v47 = v142;
      __int16 v83 = v143;
    }
    if (self->_isSmartLanguageSelectionActive)
    {
      id v130 = [v105 copy];
      [v144 setEARLanguageDetectorSpeechRequestId:v130];
    }
    if (CSSiriSpeechRecordingGetUsesServerEndpointingFromRequestOptions())
    {
      v131 = [v15 aceId];
      [(ADCommandCenter *)self _sendEnableServerEndpointerCommandWithRefID:v131];
    }
    else
    {
      v132 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        v153 = "-[ADCommandCenter _sendStartSpeechCommandWithSpeechManager:info:context:]";
        _os_log_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_INFO, "%s Skipped enable server endpointer command because ADSpeechCapturingGetUsesServerEndpointingFromRequestOptions == NO", buf, 0xCu);
      }
    }
    [(ADCommandCenter *)self _sendLocationIfNeededForRequest];
    [(ADCommandCenter *)self _sendGizmoSharedDataIfNeeded];

    goto LABEL_102;
  }
  id v79 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    v153 = "-[ADCommandCenter _sendStartSpeechCommandWithSpeechManager:info:context:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEBUG, "%s _areRequiredAssetsMissing is true even when the device supports UOD", buf, 0xCu);
  }
  currentUodStatus = self->_currentUodStatus;
  __int16 v81 = [v69 aceId];
  sub_1001DCD90(currentUodStatus, v81);

  LODWORD(v81) = [(ADCommandCenter *)self _shouldImmediatelyDismissSiriDueToMissingRequiredAssets];
  id v77 = AFSiriLogContextDaemon;
  BOOL v82 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
  if (!v81)
  {
    id v69 = v143;
    if (v82)
    {
      *(_DWORD *)long long buf = 136315138;
      v153 = "-[ADCommandCenter _sendStartSpeechCommandWithSpeechManager:info:context:]";
      __int16 v78 = "%s Not dismissing Siri request due to lack of assets.";
LABEL_62:
      _os_log_debug_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEBUG, v78, buf, 0xCu);
      goto LABEL_71;
    }
    goto LABEL_71;
  }
  if (v82)
  {
    *(_DWORD *)long long buf = 136315138;
    v153 = "-[ADCommandCenter _sendStartSpeechCommandWithSpeechManager:info:context:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEBUG, "%s [_sendStartSpeechCommandWithSpeechManager] Dismissing Siri with reason AFDismissalAssetsNotReady", buf, 0xCu);
  }
  [(ADCommandCenter *)self dismissAssistantWithReason:5];
  __int16 v83 = v143;
LABEL_102:
}

- (void)speechManager:(id)a3 preheatWithRecordingInfo:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  speechRequestGroup = self->_speechRequestGroup;
  queue = self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001DD2E8;
  v16[3] = &unk_10050DC68;
  id v17 = v9;
  __int16 v18 = self;
  id v19 = v8;
  id v20 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  dispatch_group_notify(speechRequestGroup, queue, v16);
}

- (void)speechManager:(id)a3 recognitionUpdateWillBeginForTask:(id)a4
{
  id v5 = a4;
  id v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v12 = "-[ADCommandCenter speechManager:recognitionUpdateWillBeginForTask:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001DD46C;
  v9[3] = &unk_10050E160;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (BOOL)canLogWithSpeechManager:(id)a3
{
  id v3 = a3;
  if (AFIsInternalInstall())
  {
    BOOL v4 = [v3 dictationOptions];
    if ([v4 forceOfflineRecognition])
    {
      id v5 = +[AFPreferences sharedPreferences];
      BOOL v6 = [v5 siriDataSharingOptInStatus] == (id)1;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)assistantSessionManager:(id)a3 didObserverIntermediateError:(id)a4
{
}

- (void)assistantSessionManager:(id)a3 willRetryOnError:(id)a4
{
  selectedResultCandidate = self->_selectedResultCandidate;
  self->_selectedResultCandidate = 0;
  id v6 = a4;

  self->_hasReceivedAtLeastOneResultCandidate = 0;
  [(ADCommandCenterRequestDelegate *)self->_requestDelegate adRequestEncounteredIntermediateError:v6];
}

- (void)assistantSessionManager:(id)a3 didLoadAssistantSyncRequested:(BOOL)a4
{
}

- (void)assistantSessionManagerDidDestroyAssistant:(id)a3
{
  [(ADCommandCenter *)self _metrics_destroyAllMetricsIfNeeded];
  [(ADCommandCenter *)self _shutdownSessionWhenIdle];
}

- (void)assistantSessionManagerDidCreateAssistant:(id)a3
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"ADSharedDataDidChangeNotification" object:0];
}

- (void)assistantSessionManager:(id)a3 didChangeRequestIdFrom:(id)a4 toId:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    id v10 = "-[ADCommandCenter assistantSessionManager:didChangeRequestIdFrom:toId:]";
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Session is changing our request identifier from %@ to %@. Should not be called.", (uint8_t *)&v9, 0x20u);
  }
}

- (id)assistantSessionManagerCommandsToRestoreStateOnNewConnection:(id)a3
{
  if (self->_isInStarkMode)
  {
    id v3 = objc_alloc_init((Class)SAUpdateRestrictions);
    uint64_t v8 = SADeviceRestrictionSTARKValue;
    BOOL v4 = +[NSArray arrayWithObjects:&v8 count:1];
    [v3 setRestrictionsToAdd:v4];

    id v7 = v3;
    id v5 = +[NSArray arrayWithObjects:&v7 count:1];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)assistantSessionManagerSessionRemoteConnectionDidReset:(id)a3
{
  BOOL v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[ADCommandCenter assistantSessionManagerSessionRemoteConnectionDidReset:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(ADCommandCenter *)self _locationManager];
  [v5 setNeedsToSendLocation:1];

  self->_restrictionsWereSetForRequest = 0;
  [(ADCommandCenter *)self _sync_reset];
}

- (void)assistantSessionManagerSessionConnectionDidReset:(id)a3
{
  BOOL v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[ADCommandCenter assistantSessionManagerSessionConnectionDidReset:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(ADCommandCenter *)self _locationManager];
  [v5 setNeedsToSendLocation:1];

  self->_restrictionsWereSetForRequest = 0;
}

- (BOOL)assistantSessionManagerShouldAttemptRetry:(id)a3
{
  BOOL v4 = [(ADCommandCenterCurrentRequest *)self->_currentRequest currentRequestCommand];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_6;
  }
  unsigned int v5 = [(ADSpeechManager *)self->_speechManager isLocallyRecognizing];

  if (!v5)
  {
LABEL_6:
    LOBYTE(v7) = self->_startSpeechCommand != 0;
    return v7;
  }
  int v6 = AFSiriLogContextSession;
  BOOL v7 = os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO);
  if (v7)
  {
    int v9 = 136315138;
    id v10 = "-[ADCommandCenter assistantSessionManagerShouldAttemptRetry:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Telling session not to retry because local dictation is active", (uint8_t *)&v9, 0xCu);
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)assistantSessionManager:(id)a3 receivedError:(id)a4 isRetryableError:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v14 = 136315394;
    id v15 = "-[ADCommandCenter assistantSessionManager:receivedError:isRetryableError:]";
    __int16 v16 = 2114;
    id v17 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v14, 0x16u);
    if (!v5) {
      goto LABEL_7;
    }
  }
  else if (!v5)
  {
    goto LABEL_7;
  }
  if ([(ADCommandCenter *)self _shouldRetryForError:v9])
  {
    [(ADCommandCenterRequestDelegate *)self->_requestDelegate adRequestEncounteredIntermediateError:v9];
    if (self->_currentRequest) {
      [(ADSessionManager *)self->_sessionManager startRetry];
    }
    goto LABEL_14;
  }
LABEL_7:
  [(ADCommandCenter *)self _awdSessionEnd];
  [(ADSessionManager *)self->_sessionManager resetRetryManager];
  if (AFDeviceSupportsFullSiriUOD()
    && ![(ADSessionManager *)self->_sessionManager hasSessionRequiringServerConnection])
  {
    self->_sessionExperiencedError = 1;
    __int16 v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      id v15 = "-[ADCommandCenter assistantSessionManager:receivedError:isRetryableError:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Ignoring session error because Siri supports Full UOD, and server connection is not required.", (uint8_t *)&v14, 0xCu);
    }
    [(ADSessionManager *)self->_sessionManager cancelSessions];
    [(ADCommandCenter *)self _invokeAllCompletionsWithError:v9];
  }
  else
  {
    [(ADSessionManager *)self->_sessionManager cancelSessions];
    [(ADCommandCenter *)self _sessionDidFailWithError:v9];
  }
  id v12 = +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing];
  [v12 networkActivityTracingCancel];

  __int16 v13 = +[SNNetworkActivityTracing sharedInstance];
  [v13 networkActivityTracingCancel:0];

LABEL_14:
  [(ADCommandCenter *)self _sync_reset];
}

- (BOOL)assistantSessionManager:(id)a3 shouldLogVisibleRequestFailureForError:(id)a4
{
  return ![(ADCommandCenter *)self _shouldRetryForError:a4];
}

- (BOOL)_shouldRetryForError:(id)a3
{
  if (!self->_requestDelegate && !self->_speechDelegate) {
    return 0;
  }
  resultObjectCache = self->_resultObjectCache;
  BOOL v5 = [(ADCommandCenterCurrentRequest *)self->_currentRequest currentRequestId];
  if ([(ADResultObjectCache *)resultObjectCache hasResultObjectsForRequestId:v5]) {
    BOOL v6 = self->_speechManagerState != 0;
  }
  else {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)_sessionDidFailWithError:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ADCommandCenterCurrentRequest *)self->_currentRequest currentRequestId];
  if (!-[ADResultObjectCache hasResultObjectsForRequestId:](self->_resultObjectCache, "hasResultObjectsForRequestId:", v5)|| -[ADResultObjectCache hasMissingRefContextsForId:](self->_resultObjectCache, "hasMissingRefContextsForId:", v5)|| (objc_msgSend(v4, "ad_isInAssistantErrorDomain") & 1) != 0)
  {
    if (objc_msgSend(v4, "ad_isInAssistantErrorDomain"))
    {
      id v6 = [v4 code];
      if (!v5 && v6 == (id)33) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v7 = +[AFError errorWithCode:4 description:0 underlyingError:v4];

      id v8 = +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing];
      [v8 networkActivityStop:1 withReason:4 andError:v7];

      id v9 = +[SNNetworkActivityTracing sharedInstance];
      [v9 networkActivityStop:1 withReason:4 andError:v7 completion:0];

      id v4 = (id)v7;
    }
    self->_sessionExperiencedError = 1;
    unsigned int v10 = [(ADSpeechManager *)self->_speechManager isLocallyRecognizingInDictationMode];
    __int16 v11 = AFSiriLogContextDaemon;
    BOOL v12 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (v12)
      {
        int v17 = 136315394;
        __int16 v18 = "-[ADCommandCenter _sessionDidFailWithError:]";
        __int16 v19 = 2112;
        id v20 = v4;
        __int16 v13 = "%s Ignoring session error (%@) because the speech manager is doing local speech recognition in dictation mode";
        int v14 = v11;
        uint32_t v15 = 22;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v17, v15);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
    if (v12)
    {
      int v17 = 136315138;
      __int16 v18 = "-[ADCommandCenter _sessionDidFailWithError:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Propagating session error because the speech manager is not doing local speech recognition or is not in dictation mode", (uint8_t *)&v17, 0xCu);
    }
    [(ADCommandCenter *)self _endSpeechRequestForCommand:0 withError:v4 suppressAlert:0 secureOfflineOnlyDictation:0];
    [(ADCommandCenter *)self _acousticId_sessionFailed];
LABEL_15:
    [(ADCommandCenter *)self _invokeAllCompletionsWithError:v4];
    goto LABEL_19;
  }
  __int16 v16 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315138;
    __int16 v18 = "-[ADCommandCenter _sessionDidFailWithError:]";
    __int16 v13 = "%s Ignoring session error since we're in a callback context";
    int v14 = v16;
    uint32_t v15 = 12;
    goto LABEL_18;
  }
LABEL_19:
}

- (void)_handleClientReply:(id)a3 error:(id)a4 forSessionCommand:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v26 = 136315906;
    __int16 v27 = "-[ADCommandCenter _handleClientReply:error:forSessionCommand:]";
    __int16 v28 = 2112;
    id v29 = v8;
    __int16 v30 = 2112;
    id v31 = v9;
    __int16 v32 = 2112;
    id v33 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s %@ %@ %@", (uint8_t *)&v26, 0x2Au);
  }
  if (objc_msgSend(v10, "ad_hasCallbacks")
    && (objc_msgSend(v10, "ad_sendReplyEvenIfCallbacksExist") & 1) == 0)
  {
    __int16 v18 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_30;
    }
    int v26 = 136315138;
    __int16 v27 = "-[ADCommandCenter _handleClientReply:error:forSessionCommand:]";
    __int16 v19 = "%s Suppressing reply since it was handled in callbacks";
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v8;
    __int16 v13 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      id v23 = v13;
      id v24 = [v12 errorCode];
      unsigned int v25 = [v12 reason];
      int v26 = 136315650;
      __int16 v27 = "-[ADCommandCenter _handleClientReply:error:forSessionCommand:]";
      __int16 v28 = 2048;
      id v29 = v24;
      __int16 v30 = 2112;
      id v31 = v25;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s CommandFailed errorCode = %ld, reason %@", (uint8_t *)&v26, 0x20u);
    }
  }
  int v14 = [v8 refId];

  if (!v14)
  {
    uint32_t v15 = [v10 aceId];
    [v8 setRefId:v15];
  }
  if (!objc_msgSend(v10, "ad_requiresResponse"))
  {
    if (v8)
    {
      __int16 v16 = [v8 encodedClassName];
      unsigned __int8 v17 = [v16 isEqualToString:SACommandSucceededClassIdentifier];

      if ((v17 & 1) == 0)
      {
        id v22 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v26 = 136315138;
          __int16 v27 = "-[ADCommandCenter _handleClientReply:error:forSessionCommand:]";
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s Command does not require a response, but we have a reply, so sending it along anyway.", (uint8_t *)&v26, 0xCu);
        }
        goto LABEL_28;
      }
    }
    __int16 v18 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_30;
    }
    int v26 = 136315138;
    __int16 v27 = "-[ADCommandCenter _handleClientReply:error:forSessionCommand:]";
    __int16 v19 = "%s Command has an unnecessary response. Suppressing";
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v26, 0xCu);
    goto LABEL_30;
  }
  if (!v8 && v9)
  {
    [(ADCommandCenter *)self _sendCommandFailedForCommand:v10 error:v9];
    goto LABEL_30;
  }
  if (!v8)
  {
    [(ADCommandCenter *)self _sendCommandFailedForCommand:v10 reason:@"bad response"];
    goto LABEL_30;
  }
  id v20 = [v10 aceId];

  if (v20)
  {
LABEL_28:
    [(ADCommandCenter *)self _sendCommandToServer:v8];
    goto LABEL_30;
  }
  id v21 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v26 = 136315138;
    __int16 v27 = "-[ADCommandCenter _handleClientReply:error:forSessionCommand:]";
    _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s Command requires a response but it has no aceId to set as ref. Suppressing.", (uint8_t *)&v26, 0xCu);
  }
LABEL_30:
}

- (void)_logCrossDeviceCommandEndedMetricsForCommand:(id)a3 targetProductType:(id)a4 targetDeviceID:(id)a5 targetDeviceContextIdentifier:(id)a6 targetProximity:(int64_t)a7 coreAnalyticsEvent:(id)a8 response:(id)a9 error:(id)a10
{
  id v24 = a3;
  id v12 = a6;
  id v13 = a8;
  id v14 = a9;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = objc_alloc((Class)NSString);
      __int16 v16 = [v24 encodedClassName];
      id v17 = [v15 initWithFormat:@"%@.succeeded", v16];
LABEL_13:
      id v22 = v17;
      goto LABEL_14;
    }
    if (a10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v18 = objc_alloc((Class)NSString);
      goto LABEL_12;
    }
LABEL_23:
    id v22 = 0;
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v18 = objc_alloc((Class)NSString);
    if (a10)
    {
LABEL_12:
      __int16 v16 = [v24 encodedClassName];
      id v17 = [v18 initWithFormat:@"%@.error", v16];
      goto LABEL_13;
    }
    __int16 v19 = (uint64_t *)&SAAlarmGroupAcronym;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_23;
    }
    id v18 = objc_alloc((Class)NSString);
    if (a10) {
      goto LABEL_12;
    }
    __int16 v19 = (uint64_t *)&SATimerGroupAcronym;
  }
  uint64_t v20 = *v19;
  __int16 v16 = [v24 encodedClassName];
  id v21 = [v14 encodedClassName];
  id v22 = [v18 initWithFormat:@"%@%@.%@", v20, v16, v21];

LABEL_14:
  if (v13 && v22)
  {
    [v13 addCoreAnalyticsDeviceTargetedWithContextIdentifier:v12 commandResultDescription:v22];
    id v23 = +[AFCoreAnalyticsLoggingService sharedLoggingService];
    [v23 logToCoreAnalyticsCrossDeviceRequestEvent:v13];
  }
LABEL_17:
}

- (void)_handleCommandAndClientReply:(id)a3 executionContext:(id)a4 commandCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_1001DE784;
  id v18 = &unk_10050E228;
  id v22 = a5;
  __int16 v19 = self;
  id v20 = v8;
  id v10 = v9;
  id v21 = v10;
  id v11 = v8;
  id v12 = v22;
  id v13 = objc_retainBlock(&v15);
  id v14 = v13;
  if (v10) {
    objc_msgSend(v10, "performBlock:", v13, v15, v16, v17, v18, v19, v20, v21, v22);
  }
  else {
    ((void (*)(void ***))v13[2])(v13);
  }
}

- (void)assistantSessionManager:(id)a3 receivedCommand:(id)a4
{
  id v5 = a4;
  id v6 = [v5 refId];
  id v7 = [(ADCommandCenter *)self _rootExecutionContextForRequestID:v6];

  [(ADCommandCenter *)self _handleCommandAndClientReply:v5 executionContext:v7 commandCompletion:0];
}

- (void)assistantSessionManagerConnectionDidBecomeActive:(id)a3
{
}

- (void)_saPerformDataDetection:(id)a3 completion:(id)a4
{
  id v5 = a3;
  __int16 v19 = (void (**)(id, id, void))a4;
  id v28 = 0;
  id v6 = +[NSDataDetector dataDetectorWithTypes:32 error:&v28];
  id v18 = v28;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v20 = v5;
  id obj = [v5 detectionTargets];
  id v8 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v13 = objc_alloc_init((Class)SAPerformDataDetectionResult);
        [v13 setDetectionTarget:v12];
        id v14 = objc_alloc_init((Class)NSMutableArray);
        id v15 = [v12 length];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1001DF2D8;
        v22[3] = &unk_100505EC0;
        id v23 = v14;
        id v16 = v14;
        objc_msgSend(v6, "enumerateMatchesInString:options:range:usingBlock:", v12, 0, 0, v15, v22);
        [v13 setMatches:v16];
        [v7 addObject:v13];
      }
      id v9 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }

  id v17 = objc_alloc_init((Class)SAPerformDataDetectionResults);
  [v17 setResults:v7];
  if (v19) {
    v19[2](v19, v17, 0);
  }
}

- (void)_stopLanguageDetectionWaitTimerIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  languageDetectionWaitTimer = self->_languageDetectionWaitTimer;
  if (languageDetectionWaitTimer)
  {
    id v4 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      id v7 = "-[ADCommandCenter _stopLanguageDetectionWaitTimerIfNeeded]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
      languageDetectionWaitTimer = self->_languageDetectionWaitTimer;
    }
    [(AFWatchdogTimer *)languageDetectionWaitTimer cancel];
    id v5 = self->_languageDetectionWaitTimer;
    self->_languageDetectionWaitTimer = 0;
  }
}

- (void)_startLanguageDetectionWaitTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v10 = "-[ADCommandCenter _startLanguageDetectionWaitTimer]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  [(ADCommandCenter *)self _stopLanguageDetectionWaitTimerIfNeeded];
  id v4 = objc_alloc((Class)AFWatchdogTimer);
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001DF60C;
  v8[3] = &unk_10050E138;
  void v8[4] = self;
  int v6 = (AFWatchdogTimer *)[v4 initWithTimeoutInterval:queue onQueue:v8 timeoutHandler:1.0];
  languageDetectionWaitTimer = self->_languageDetectionWaitTimer;
  self->_languageDetectionWaitTimer = v6;

  [(AFWatchdogTimer *)self->_languageDetectionWaitTimer start];
}

- (void)_cancelLocalRecognitionIfRequired
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    int v6 = "-[ADCommandCenter _cancelLocalRecognitionIfRequired]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  self->_hasReceivedServerSpeechRecognitions = 1;
  id v4 = [(ADCommandCenter *)self _speechManager];
  [v4 cancelLocalRecognitionIfActive];
}

- (void)_dictationSessionDidComplete
{
  id v3 = [(ADCommandCenter *)self _speechManager];
  [v3 dictationSessionDidComplete];

  [(ADCommandCenter *)self _setCurrentRequest:0];
  [(ADCommandCenter *)self _requestDidEnd];
  [(ADCommandCenter *)self _clearSpeechDelegateState];
}

- (void)_saSetMultilingualDictationConfig:(id)a3 completion:(id)a4
{
  id v5 = a3;
  int v6 = +[AFPreferences sharedPreferences];
  id v7 = [v5 multilingualTimeoutInMillis];
  [v7 doubleValue];
  double v9 = v8;

  uint64_t v10 = _AFPreferencesMultilingualDictationTimeoutInMilliSeconds();
  id v11 = v10;
  if (v10)
  {
    [v10 floatValue];
    double v13 = v12;
  }
  else
  {
    double v13 = 2000.0;
  }
  unsigned int v14 = [v5 multilingualDisabled];
  unsigned int v15 = [v6 isLanguageDetectorEnabledByServer];
  id v16 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v19 = 136316162;
    id v20 = "-[ADCommandCenter _saSetMultilingualDictationConfig:completion:]";
    __int16 v21 = 2048;
    double v22 = v13;
    __int16 v23 = 2048;
    double v24 = v9;
    __int16 v25 = 1024;
    unsigned int v26 = v15;
    __int16 v27 = 1024;
    int v28 = v14 ^ 1;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Client timeout: %f server timeout: %f, client enabled %d, server enabled %d", (uint8_t *)&v19, 0x2Cu);
  }
  if (v13 != v9)
  {
    id v17 = +[NSNumber numberWithDouble:v9];
    _AFPreferencesSetMultilingualDictationTimeoutInMilliSeconds();
  }
  if (v14 == v15)
  {
    _AFPreferencesSetDictationLanguageDetectorEnabledByServer();
    if (v14)
    {
      if (objc_opt_respondsToSelector())
      {
        id v18 = +[AFError errorWithCode:2805 description:@"Server has disabled smart language selection" underlyingError:0];
        [(ADCommandCenterSpeechDelegate *)self->_speechDelegate adSpeechLanguageDetectorFailedWithError:v18];
      }
    }
  }
}

- (void)_storeExtractedSpeechLocally:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 speechData];
  if (!v4
    || (id v5 = (void *)v4,
        [v3 speechDataUrl],
        int v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    float v12 = (void *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    double v13 = v12;
    unsigned int v14 = [v3 speechData];
    unsigned int v15 = [v3 speechDataUrl];
    *(_DWORD *)long long buf = 136315650;
    id v34 = "-[ADCommandCenter _storeExtractedSpeechLocally:]";
    __int16 v35 = 2112;
    id v36 = v14;
    __int16 v37 = 2112;
    id v38 = v15;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s data = %@ or URL = %@ are missing", buf, 0x20u);

    goto LABEL_25;
  }
  char v32 = 0;
  id v7 = CSSiriSpeechRecordingTrimmedAudioDirectoryPath();
  double v8 = +[NSFileManager defaultManager];
  unsigned int v9 = [v8 fileExistsAtPath:v7 isDirectory:&v32];

  if (v9)
  {
    if (!v32)
    {
      id v10 = [objc_alloc((Class)NSString) initWithFormat:@"File exists at path %@, but it is expected to be directory.", v7];
      id v11 = +[AFError errorWithCode:226 description:v10];
      goto LABEL_11;
    }
LABEL_15:
    id v20 = 0;
    int v21 = 1;
    goto LABEL_16;
  }
  id v16 = +[NSFileManager defaultManager];
  id v31 = 0;
  unsigned int v17 = [v16 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v31];
  id v10 = v31;

  if (v17)
  {

    goto LABEL_15;
  }
  id v18 = [objc_alloc((Class)NSString) initWithFormat:@"Unable to create directory at path %@.", v7];
  id v11 = +[AFError errorWithCode:226 description:v18 underlyingError:v10];

LABEL_11:
  if (!v11) {
    goto LABEL_15;
  }
  int v19 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    id v34 = "ADCreateTrimmedAudioDirectory";
    __int16 v35 = 2112;
    id v36 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
  }
  id v20 = v11;
  int v21 = 0;
LABEL_16:

  double v13 = v20;
  if (!v21)
  {
    __int16 v27 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v34 = "-[ADCommandCenter _storeExtractedSpeechLocally:]";
      __int16 v35 = 2112;
      id v36 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
    }
    goto LABEL_26;
  }
  double v22 = [v3 speechData];
  __int16 v23 = [v3 speechDataUrl];
  double v24 = +[NSURL URLWithString:v23];
  __int16 v30 = v13;
  [v22 writeToURL:v24 options:2 error:&v30];
  __int16 v25 = v30;

  unsigned int v26 = (void *)AFSiriLogContextDaemon;
  if (!v25)
  {
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_27;
    }
    double v13 = v26;
    unsigned int v14 = [v3 speechDataUrl];
    *(_DWORD *)long long buf = 136315650;
    id v34 = "-[ADCommandCenter _storeExtractedSpeechLocally:]";
    __int16 v35 = 2112;
    id v36 = v3;
    __int16 v37 = 2112;
    id v38 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s extractSpeechDataCompleted = %@ (speechDataUrl = %@)", buf, 0x20u);
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v28 = v26;
    id v29 = [v25 userInfo];
    *(_DWORD *)long long buf = 136315394;
    id v34 = "-[ADCommandCenter _storeExtractedSpeechLocally:]";
    __int16 v35 = 2112;
    id v36 = v29;
    _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s error writing data %@", buf, 0x16u);
  }
LABEL_27:
}

- (void)_sasExtractSpeechData:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 speechRequestId];
  id v11 = [v7 audioOutputType];
  uint64_t v12 = [v7 startTime];
  double v13 = [v7 endTime];
  unsigned int v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136316418;
    char v32 = "-[ADCommandCenter _sasExtractSpeechData:executionContext:completion:]";
    __int16 v33 = 2112;
    id v34 = v7;
    __int16 v35 = 2112;
    id v36 = v10;
    __int16 v37 = 2112;
    id v38 = v11;
    __int16 v39 = 2112;
    uint64_t v40 = v12;
    __int16 v41 = 2112;
    id v42 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s extractSpeechData = %@ (speechRequestId = %@, audioOutputType = %@, startTime = %@, endTime = %@)", buf, 0x3Eu);
  }
  __int16 v25 = (void *)v12;
  if ([v11 isEqualToString:SASExtractSpeechDataAudioOutputTypeAudioFormatOpusValue])
  {
    uint64_t v15 = 3;
  }
  else if ([v11 isEqualToString:SASExtractSpeechDataAudioOutputTypeAudioFormatLinearPCMValue])
  {
    uint64_t v15 = 2;
  }
  else
  {
    uint64_t v15 = 3;
  }
  id v16 = [v7 startTime];
  double v17 = (double)(uint64_t)[v16 longValue] / 1000.0;

  id v18 = [v7 endTime];
  int v19 = [v18 longValue];
  id v20 = [v7 startTime];
  double v21 = (double)(v19 - (unsigned char *)[v20 longValue]) / 1000.0;

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  void v27[2] = sub_1001E01F0;
  v27[3] = &unk_100505E98;
  id v28 = v7;
  id v29 = v8;
  id v30 = v9;
  id v22 = v9;
  id v23 = v8;
  id v24 = v7;
  [(ADCommandCenter *)self _trimRecordedAudioWithIdentifier:v10 offset:v15 duration:v27 outputFileType:v17 completion:v21];
}

- (void)_saUnhandledObject:(id)a3 completion:(id)a4
{
  id v7 = (void (**)(id, id, void))a4;
  [(ADCommandCenter *)self _invokeCompletionForCommand:a3];
  if (v7)
  {
    id v6 = [objc_alloc((Class)SACommandFailed) initWithReason:@"Unhandled Object"];
    v7[2](v7, v6, 0);
  }
}

- (void)_postUpdatePersonalRequestSettingsNotification:(id)a3 forLocalizationKey:(id)a4 executionContext:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[ADUserNotificationServiceProvider alloc] initWithConnection:0 bundleIdentifier:@"com.apple.Home" notificationCategories:0];
  id v12 = objc_alloc_init((Class)UNMutableNotificationContent);
  double v13 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v14 = +[AFLocalization sharedInstance];
  uint64_t v15 = [v14 localizedStringForKey:v9 table:0 bundle:v13 languageCode:0];

  [v12 setBody:v15];
  [v12 setHasDefaultAction:1];
  id v16 = [v10 homeId];

  id v17 = [objc_alloc((Class)NSString) initWithFormat:@"%@?showEnablementSheet=%@", @"com.apple.HOME-PRIVATE://personalRequestOptIn", @"YES"];
  if ([v16 length])
  {
    uint64_t v18 = [v17 stringByAppendingFormat:@"&homeId=%@", v16];

    id v17 = (id)v18;
  }
  int v19 = +[NSURL URLWithString:v17];

  [v12 setDefaultActionURL:v19];
  id v20 = +[UNNotificationRequest requestWithIdentifier:@"com.apple.siri.PersonalRequestsActivity" content:v12 trigger:0];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1001E0678;
  v22[3] = &unk_10050D440;
  id v23 = v8;
  id v21 = v8;
  [(ADUserNotificationServiceProvider *)v11 postNotificationRequest:v20 completion:v22];
}

- (void)_saPostUpdatePersonalRequestSettingsNotification:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23[0] = @"ADHomeKitAccessoryCategoryTypeHomePod";
  v23[1] = @"ADHomeKitAccessoryCategoryTypeRemoraSpeaker";
  v24[0] = @"ASSISTANT_SERVICES_HOMEPOD_PROMPT_ENABLE_PERSONAL_DOMAINS_NOTIFICATION_BODY";
  v24[1] = @"ASSISTANT_SERVICES_REMORA_SPEAKER_PROMPT_ENABLE_PERSONAL_DOMAINS_NOTIFICATION_BODY";
  v23[2] = @"ADHomeKitAccessoryCategoryTypeRemoraAccessory";
  void v23[3] = @"ADHomeKitAccessoryCategoryTypeRemoraOtherDevice";
  v24[2] = @"ASSISTANT_SERVICES_REMORA_ACCESSORY_PROMPT_ENABLE_PERSONAL_DOMAINS_NOTIFICATION_BODY";
  void v24[3] = @"ASSISTANT_SERVICES_REMORA_DEVICE_PROMPT_ENABLE_PERSONAL_DOMAINS_NOTIFICATION_BODY";
  id v11 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
  id v12 = +[ADHomeInfoManager sharedInfoManager];
  double v13 = [v9 info];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001E0920;
  v18[3] = &unk_100505E70;
  void v18[4] = self;
  id v19 = v8;
  id v20 = v11;
  id v21 = v9;
  id v22 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v11;
  id v17 = v8;
  [v12 getAccessoryCategoryForExecutionInfo:v13 completion:v18];
}

- (void)_postPersonalDomainActivityNotificationWithBody:(id)a3 command:(id)a4 executionContext:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, id, void))a6;
  double v13 = [v11 info];
  id v14 = [v13 currentHomeInfo];

  if (v14 && ![v14 activityNotificationsEnabledForPersonalRequests]
    || (+[ADHomeInfoManager sharedInfoManager],
        id v15 = objc_claimAutoreleasedReturnValue(),
        unsigned int v16 = [v15 areActivityNotificationsOffForAllHomes],
        v15,
        v16))
  {
    id v17 = objc_alloc_init((Class)SACommandIgnored);
    v12[2](v12, v17, 0);
  }
  else
  {
    uint64_t v18 = [v10 homeId];
    id v19 = v9;
    uint64_t v40 = [v10 originatingDeviceName];
    id v42 = v9;
    if (![v19 length])
    {
      +[AFLocalization sharedInstance];
      id v21 = v20 = v19;
      id v22 = v18;
      id v23 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v24 = [v21 localizedStringForKey:@"ASSISTANT_SERVICES_HOMEPOD_ACTIVITY_DEFAULT_BODY" table:0 bundle:v23 languageCode:0];

      uint64_t v18 = v22;
      id v19 = (id)v24;
    }
    __int16 v25 = [[ADUserNotificationServiceProvider alloc] initWithConnection:0 bundleIdentifier:@"com.apple.Home" notificationCategories:0];
    id v26 = objc_alloc_init((Class)UNMutableNotificationContent);
    __int16 v41 = v19;
    [v26 setBody:v19];
    [v26 setShouldSuppressDefaultAction:1];
    if ([v18 length])
    {
      __int16 v27 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315394;
        id v52 = "-[ADCommandCenter _postPersonalDomainActivityNotificationWithBody:command:executionContext:completion:]";
        __int16 v53 = 2112;
        id v54 = v18;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s Adding home id: %@ to notification content's user info.", buf, 0x16u);
      }
      uint64_t v49 = AFPersonalDomainsNotificationUserInfoHomeKey;
      id v50 = v18;
      id v28 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      [v26 setUserInfo:v28];
    }
    [v26 setCategoryIdentifier:@"PersonalRequestsActivityCategory"];
    id v29 = objc_alloc((Class)NSString);
    +[NSUUID UUID];
    id v30 = v39 = v18;
    id v31 = [v30 UUIDString];
    id v32 = [v29 initWithFormat:@"%@:%@", @"com.apple.siri.PersonalRequestsActivity", v31];

    __int16 v33 = +[ADHomeInfoManager sharedInfoManager];
    id v34 = [v11 info];
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1001E0E70;
    v43[3] = &unk_100505E70;
    id v44 = v40;
    id v45 = v26;
    id v46 = v32;
    id v47 = v25;
    id v48 = v12;
    __int16 v35 = v25;
    id v36 = v32;
    id v37 = v26;
    id v38 = v40;
    [v33 getLocalizedAccessoryCategoryForExecutionInfo:v34 completion:v43];

    id v9 = v42;
  }
}

- (void)_saPostPersonalDomainActivityNotification:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 notificationBody];
  [(ADCommandCenter *)self _postPersonalDomainActivityNotificationWithBody:v11 command:v10 executionContext:v9 completion:v8];
}

- (void)_saPostCalendarActivityNotification:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[AFLocalization sharedInstance];
  id v12 = +[NSBundle bundleForClass:objc_opt_class()];
  id v13 = [v11 localizedStringForKey:@"ASSISTANT_SERVICES_HOMEPOD_CALENDAR_ACTIVITY_NOTIFICATION_BODY" table:0 bundle:v12 languageCode:0];

  [(ADCommandCenter *)self _postPersonalDomainActivityNotificationWithBody:v13 command:v10 executionContext:v9 completion:v8];
}

- (void)_saDismissRemoteAnnouncement:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ADAnnounceDeviceSelector sharedDeviceSelector];
  [v7 handleRemoteDismissRequest:v6 completion:v5];
}

- (void)_saPerformRemoteAnnouncement:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ADAnnounceDeviceSelector sharedDeviceSelector];
  [v7 handleRemoteAnnounceRequest:v6 completion:v5];
}

- (void)_saNotificationSearch:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 supportsSpokenNotifications];
  unsigned int v9 = [v8 BOOLValue];

  if (v9)
  {
    id v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v28 = "-[ADCommandCenter _saNotificationSearch:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Announcement notification search", buf, 0xCu);
    }
    id v11 = +[ADExternalNotificationRequestHandler sharedNotificationRequestHandler];
    id v12 = [v6 afterNotificationId];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1001E1634;
    void v24[3] = &unk_10050D008;
    void v24[4] = self;
    id v25 = v6;
    id v26 = v7;
    id v13 = v7;
    id v14 = v6;
    [v11 fetchUnreadNotificationsFromThreadAfterNotificationWithID:v12 completion:v24];

    id v15 = v25;
  }
  else
  {
    unsigned int v16 = +[ADNotificationManager sharedManager];
    id v17 = [v6 afterNotificationId];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1001E1648;
    v20[3] = &unk_10050D008;
    id v21 = v6;
    id v22 = self;
    id v23 = v7;
    id v18 = v7;
    id v19 = v6;
    [v16 fetchBulletinsAfterBulletinWithID:v17 completion:v20];

    id v15 = v21;
  }
}

- (void)_completeNotificationSearch:(id)a3 bulletins:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, id, void))a5;
  unsigned int v9 = [a3 isOnDeviceSearch];
  unsigned int v10 = [v9 BOOLValue];

  id v11 = objc_alloc_init((Class)NSMutableArray);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v7;
  id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      unsigned int v16 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v16);
        if (v10) {
          [v17 saOnDeviceNotificationObject];
        }
        else {
        id v18 = objc_msgSend(v17, "saNotificationObject", (void)v21);
        }
        objc_msgSend(v11, "addObject:", v18, (void)v21);

        unsigned int v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  if (v10) {
    id v19 = (objc_class *)SAOnDeviceNotificationsSearchCompleted;
  }
  else {
    id v19 = (objc_class *)SANotificationsSearchCompleted;
  }
  id v20 = objc_alloc_init(v19);
  [v20 setNotifications:v11];
  if (v8) {
    v8[2](v8, v20, 0);
  }
}

- (void)_saTTSSetSpeechSynthesisVolume:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[CSPreferences sharedPreferences];
  unsigned int v9 = [v8 smartSiriVolumeContextAwareEnabled];

  unsigned int v10 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    id v12 = [v6 actionType];
    id v13 = [v6 volumeValue];
    *(_DWORD *)long long buf = 136316162;
    id v36 = "-[ADCommandCenter _saTTSSetSpeechSynthesisVolume:completion:]";
    __int16 v37 = 2112;
    id v38 = v6;
    __int16 v39 = 2112;
    uint64_t v40 = v12;
    __int16 v41 = 2112;
    id v42 = v13;
    __int16 v43 = 1024;
    unsigned int v44 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s ttsSetSpeechSynthesisVolume = %@ (actionType = %@, volumeLevel = %@), smartSiriVolumeContextAwareEnabled = %d", buf, 0x30u);
  }
  id v14 = [v6 actionType];
  uint64_t v15 = SATTSSpeechVolumeActionTypeSETValue;
  if ([v14 isEqualToString:SATTSSpeechVolumeActionTypeSETValue])
  {
    uint64_t v16 = 1;
    if (v9) {
      goto LABEL_5;
    }
LABEL_16:
    long long v22 = [v6 volumeValue];
    [v22 floatValue];
    int v24 = v23;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1001E1F20;
    v32[3] = &unk_10050DEE8;
    id v34 = v7;
    id v33 = v6;
    LODWORD(v25) = v24;
    [(ADCommandCenter *)self _setSiriOutputVolume:0 forAudioRoute:v16 operationType:v32 completion:v25];

    id v26 = v34;
LABEL_28:

    goto LABEL_29;
  }
  if ([v14 isEqualToString:SATTSSpeechVolumeActionTypeINCREASEValue])
  {
    uint64_t v16 = 2;
    if (!v9) {
      goto LABEL_16;
    }
  }
  else
  {
    if ([v14 isEqualToString:SATTSSpeechVolumeActionTypeDECREASEValue]) {
      uint64_t v16 = 3;
    }
    else {
      uint64_t v16 = 0;
    }
    if (!v9) {
      goto LABEL_16;
    }
  }
LABEL_5:
  uint64_t v17 = mach_absolute_time();
  if ([v14 isEqualToString:v15])
  {
    id v18 = +[CSSpeechController sharedController];
    id v19 = [v6 volumeValue];
    [v19 floatValue];
    objc_msgSend(v18, "setSmartSiriVolumePercentage:");

    goto LABEL_25;
  }
  if ([v14 isEqualToString:SATTSSpeechVolumeActionTypeINCREASEValue])
  {
    id v20 = +[CSSpeechController sharedController];
    id v18 = v20;
    uint64_t v21 = 1;
LABEL_19:
    [v20 setSmartSiriVolumeDirection:v21];
    goto LABEL_25;
  }
  if ([v14 isEqualToString:SATTSSpeechVolumeActionTypeDECREASEValue])
  {
    id v20 = +[CSSpeechController sharedController];
    id v18 = v20;
    uint64_t v21 = 0;
    goto LABEL_19;
  }
  if ([v14 isEqualToString:SATTSSpeechVolumeActionTypeENABLE_OFFSET_AND_INCREASEValue])
  {
    __int16 v27 = +[CSSpeechController sharedController];
    id v18 = v27;
    uint64_t v28 = 1;
  }
  else
  {
    if (![v14 isEqualToString:SATTSSpeechVolumeActionTypeENABLE_OFFSET_AND_DECREASEValue])goto LABEL_26; {
    __int16 v27 = +[CSSpeechController sharedController];
    }
    id v18 = v27;
    uint64_t v28 = 0;
  }
  [v27 setPermanentVolumeOffsetWithDirection:v28];
LABEL_25:

  id v29 = [(ADCommandCenter *)self _speechManager];
  id v30 = [v29 volumeTracker];
  [v30 setDirtySiriOutputVolumeHostTime:v17];

LABEL_26:
  if (v7)
  {
    id v26 = objc_alloc_init((Class)SACommandSucceeded);
    id v31 = [v6 aceId];
    [v26 setRefId:v31];

    (*((void (**)(id, id, void))v7 + 2))(v7, v26, 0);
    goto LABEL_28;
  }
LABEL_29:
}

- (void)_saTTSGetSpeechSynthesisVolume:(id)a3 completion:(id)a4
{
  double v6 = COERCE_DOUBLE(a3);
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v30 = "-[ADCommandCenter _saTTSGetSpeechSynthesisVolume:completion:]";
    __int16 v31 = 2112;
    double v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ttsGetSpeechSynthesisVolume = %@", buf, 0x16u);
  }
  int v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  double v25 = sub_1001E22EC;
  id v26 = &unk_100505E48;
  id v9 = v7;
  id v28 = v9;
  double v10 = COERCE_DOUBLE(*(id *)&v6);
  double v27 = v10;
  id v11 = objc_retainBlock(&v23);
  id v12 = +[CSPreferences sharedPreferences];
  unsigned int v13 = [v12 smartSiriVolumeContextAwareEnabled];

  id v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    id v30 = "-[ADCommandCenter _saTTSGetSpeechSynthesisVolume:completion:]";
    __int16 v31 = 2112;
    double v32 = v10;
    __int16 v33 = 1024;
    unsigned int v34 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s ttsGetSpeechSynthesisVolume = %@, smartSiriVolumeContextAwareEnabled = %d", buf, 0x1Cu);
  }
  if (v13)
  {
    uint64_t v15 = +[CSSpeechController sharedController];
    [v15 getVolumeForTTSType:2];
    float v17 = v16;

    id v18 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      id v30 = "-[ADCommandCenter _saTTSGetSpeechSynthesisVolume:completion:]";
      __int16 v31 = 2048;
      double v32 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s smartSiriVolume = %f", buf, 0x16u);
    }
    if (v9)
    {
      id v19 = objc_alloc_init((Class)SATTSGetSpeechSynthesisVolumeResponse);
      id v20 = [*(id *)&v10 aceId];
      [v19 setRefId:v20];

      *(float *)&double v21 = v17;
      long long v22 = +[NSNumber numberWithFloat:v21];
      [v19 setVolumeLevel:v22];

      (*((void (**)(id, id, void))v9 + 2))(v9, v19, 0);
    }
  }
  else
  {
    [(ADCommandCenter *)self _getSiriOutputVolumeForAudioRoute:0 completion:v11];
  }
}

- (void)_saLogStringEvent:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v19 = "-[ADCommandCenter _saLogStringEvent:completion:]";
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  uint64_t v8 = objc_msgSend(v5, "eventName", SALogStringEventEventNamePListKey);
  id v9 = (void *)v8;
  if (v8) {
    CFStringRef v10 = (const __CFString *)v8;
  }
  else {
    CFStringRef v10 = &stru_10050F7D8;
  }
  v17[0] = v10;
  v16[1] = SALogStringEventEventValuePListKey;
  uint64_t v11 = [v5 eventValue];
  id v12 = (void *)v11;
  if (v11) {
    CFStringRef v13 = (const __CFString *)v11;
  }
  else {
    CFStringRef v13 = &stru_10050F7D8;
  }
  v17[1] = v13;
  id v14 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

  uint64_t v15 = +[AFAnalytics sharedAnalytics];
  [v15 logEventWithType:141 context:v14];

  if (v6) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)_saLogNumericEvent:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    long long v22 = "-[ADCommandCenter _saLogNumericEvent:completion:]";
    __int16 v23 = 2112;
    id v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  uint64_t v8 = objc_msgSend(v5, "eventName", SALogNumericEventEventNamePListKey);
  id v9 = (void *)v8;
  if (v8) {
    CFStringRef v10 = (const __CFString *)v8;
  }
  else {
    CFStringRef v10 = &stru_10050F7D8;
  }
  v20[0] = v10;
  v19[1] = SALogNumericEventEventOperationPListKey;
  uint64_t v11 = [v5 eventOperation];
  id v12 = (void *)v11;
  if (v11) {
    CFStringRef v13 = (const __CFString *)v11;
  }
  else {
    CFStringRef v13 = &stru_10050F7D8;
  }
  v20[1] = v13;
  v19[2] = SALogNumericEventEventValuePListKey;
  uint64_t v14 = [v5 eventValue];
  uint64_t v15 = (void *)v14;
  float v16 = &off_100523870;
  if (v14) {
    float v16 = (_UNKNOWN **)v14;
  }
  v20[2] = v16;
  float v17 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];

  id v18 = +[AFAnalytics sharedAnalytics];
  [v18 logEventWithType:140 context:v17];

  if (v6) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)_saLogSignatureWithABC:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    uint64_t v14 = "-[ADCommandCenter _saLogSignatureWithABC:completion:]";
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v8 = +[SiriCoreSymptomsReporter sharedInstance];
  id v9 = [v5 subType];
  CFStringRef v10 = [v5 subTypeContext];
  uint64_t v11 = +[NSProcessInfo processInfo];
  id v12 = [v11 processIdentifier];
  [v8 reportIssueForType:@"server_request" subType:v9 context:v10 processIdentifier:v12 walkboutStatus:byte_100585E38];

  if (v6) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)_saSetLatencyDiagnosticConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(ADCommandCenter *)self _diagnosticsManager];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001E2A3C;
  v10[3] = &unk_100505E20;
  id v11 = v6;
  id v9 = v6;
  [v8 updateLatencyDiagnosticConfiguration:v7 completion:v10];
}

- (void)_saGetAssistantData:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  uint64_t v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v14 = "-[ADCommandCenter _saGetAssistantData:executionContext:completion:]";
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  id v9 = +[ADAssistantDataManager sharedDataManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001E2C1C;
  v11[3] = &unk_100505DF8;
  id v12 = v7;
  id v10 = v7;
  [v9 getAssistantDataWithCompletion:v11];
}

- (void)_saGetRequestOrigin:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v29 = "-[ADCommandCenter _saGetRequestOrigin:executionContext:completion:]";
    __int16 v30 = 2112;
    id v31 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  id v12 = [v9 info];
  int v13 = [v12 requestID];

  currentRequest = self->_currentRequest;
  if (currentRequest
    && ([(ADCommandCenterCurrentRequest *)currentRequest currentRequestId],
        __int16 v15 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v16 = [v15 isEqualToString:v13],
        v15,
        (v16 & 1) != 0))
  {
    float v17 = [(ADCommandCenter *)self _locationManager];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1001E3290;
    void v23[3] = &unk_100505DD0;
    id v18 = &v24;
    id v24 = v10;
    id v19 = v10;
    [v17 updateLocationForCommand:v8 completion:v23];
  }
  else
  {
    __int16 v20 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315138;
      id v29 = "-[ADCommandCenter _saGetRequestOrigin:executionContext:completion:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%s Fetching location for request on a different device", buf, 0xCu);
    }
    id v21 = [(ADCommandCenter *)self _contextManager];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1001E2F9C;
    v25[3] = &unk_10050DEC0;
    id v18 = &v26;
    id v26 = v8;
    id v27 = v10;
    id v22 = v10;
    [v21 getContextSnapshotForForeignRequestID:v13 completion:v25];

    float v17 = v27;
  }
}

- (void)_saAcknowledgeAlert:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void))a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    id v12 = "-[ADCommandCenter _saAcknowledgeAlert:completion:]";
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v11, 0x16u);
  }
  id v9 = [v6 object];
  [(ADCommandCenter *)self _context_acknowledgeBulletinForObject:v9];

  if (v7)
  {
    id v10 = objc_alloc_init((Class)SACommandSucceeded);
    v7[2](v7, v10, 0);
  }
}

- (void)_endSpeechRequestForCommand:(id)a3 withError:(id)a4 suppressAlert:(BOOL)a5 secureOfflineOnlyDictation:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136316162;
    __int16 v39 = "-[ADCommandCenter _endSpeechRequestForCommand:withError:suppressAlert:secureOfflineOnlyDictation:]";
    __int16 v40 = 2112;
    id v41 = v10;
    __int16 v42 = 2112;
    id v43 = v11;
    __int16 v44 = 1024;
    BOOL v45 = v7;
    __int16 v46 = 1024;
    BOOL v47 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s command %@ error %@ suppressAlert %d secureOfflineOnlyDictation %d", buf, 0x2Cu);
  }
  unsigned int v13 = [(ADCommandCenterSpeechDelegate *)self->_speechDelegate adWaitingForAudioFile];
  id v14 = [(ADCommandCenter *)self _speechManager];
  __int16 v15 = [(ADCommandCenter *)self _speechCapturingContext];
  if (self->_speechManagerState == 2)
  {
    if (v13)
    {
      unsigned __int8 v16 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        __int16 v39 = "-[ADCommandCenter _endSpeechRequestForCommand:withError:suppressAlert:secureOfflineOnlyDictation:]";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Recognition failed, but we're waiting to write an audio file. Don't cancel recording", buf, 0xCu);
      }
    }
    else
    {
      [v14 cancelSpeechCaptureSuppressingAlert:v7];
      [v14 setContext:0];
      [(ADCommandCenterSpeechDelegate *)self->_speechDelegate adSpeechRecordingDidEndWithContext:v15];
    }
  }
  if (self->_startSpeechCommand)
  {
    if (v11) {
      BOOL v17 = v6;
    }
    else {
      BOOL v17 = 0;
    }
    if (v17 || !self->_speechDelegateHasReceivedSpeechRecognized) {
      goto LABEL_17;
    }
  }
  else if (v11 && v6)
  {
LABEL_17:
    speechDelegate = self->_speechDelegate;
    id v19 = [v15 sessionUUID];
    [(ADCommandCenterSpeechDelegate *)speechDelegate adSpeechRecognitionDidFail:v11 sessionUUID:v19];
    goto LABEL_20;
  }
  if (!v6) {
    goto LABEL_21;
  }
  __int16 v20 = self->_speechDelegate;
  id v19 = [v15 sessionUUID];
  [(ADCommandCenterSpeechDelegate *)v20 adSpeechLocalRecognitionDidSucceedWithSessionUUID:v19];
LABEL_20:

LABEL_21:
  currentRequest = self->_currentRequest;
  if (v10 || !currentRequest || v6)
  {
    id v22 = [(ADCommandCenterCurrentRequest *)currentRequest currentRequestId];
    __int16 v23 = [v10 refId];
    unsigned int v24 = [v22 isEqualToString:v23];

    if (!v24)
    {
      if (v10 || !v11)
      {
        BOOL v30 = v11 == 0;
        id v29 = self;
      }
      else
      {
        id v29 = self;
        BOOL v30 = 0;
      }
      [(ADCommandCenter *)v29 _completeRequestForCurrentDelegate:v30 error:v11];
      if (v13) {
        goto LABEL_28;
      }
LABEL_34:
      [(ADCommandCenter *)self _clearSpeechDelegateState];
      goto LABEL_35;
    }
  }
  if (!v11)
  {
    id v11 = +[AFError errorWithCode:212];
  }
  [(ADCommandCenter *)self _completeRequestForCurrentDelegate:0 error:v11];
  [(ADCommandCenter *)self _setCurrentRequest:0];
  if (!v13) {
    goto LABEL_34;
  }
LABEL_28:
  id v25 = objc_retainBlock(self->_speechCompletion);
  objc_initWeak((id *)buf, self);
  double v32 = _NSConcreteStackBlock;
  uint64_t v33 = 3221225472;
  unsigned int v34 = sub_1001E381C;
  __int16 v35 = &unk_100505DA8;
  objc_copyWeak(&v37, (id *)buf);
  id v36 = v25;
  id v26 = v25;
  id v27 = objc_retainBlock(&v32);
  id speechCompletion = self->_speechCompletion;
  self->_id speechCompletion = v27;

  objc_destroyWeak(&v37);
  objc_destroyWeak((id *)buf);
LABEL_35:
  id v31 = [(ADCommandCenter *)self _sessionManager];
  [v31 endRetryableRequestForCommand:v10];

  [(ADCommandCenter *)self _requestDidEnd];
}

- (void)_saClientSetupInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 refId];
  unsigned int v9 = [(ADCommandCenter *)self _refIdIsSpeechStart:v8];

  if (v9)
  {
    speechManager = self->_speechManager;
    [v6 threshold];
    -[ADSpeechManager setEndpointerThreshold:](speechManager, "setEndpointerThreshold:");
    -[ADSpeechManager setEndpointerDelayedTrigger:](self->_speechManager, "setEndpointerDelayedTrigger:", [v6 delay]);
  }
  else
  {
    id v11 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v12 = v11;
      unsigned int v13 = [v6 refId];
      int v14 = 136315394;
      __int16 v15 = "-[ADCommandCenter _saClientSetupInfo:completion:]";
      __int16 v16 = 2112;
      BOOL v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Got clientSetupInfo for refId %@. Ignoring. ", (uint8_t *)&v14, 0x16u);
    }
  }
  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)_sasClientBoundConfusionNetwork:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 refId];
  LOBYTE(self) = [(ADCommandCenter *)self _refIdIsSpeechStart:v7];

  if ((self & 1) == 0)
  {
    id v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      id v10 = "-[ADCommandCenter _sasClientBoundConfusionNetwork:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Got confusionNetwork for something other than our current speech command. Ignoring.", (uint8_t *)&v9, 0xCu);
    }
  }
  if (v6) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)_sasServerEndpointFeatures:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 refId];
  unsigned int v9 = [(ADCommandCenter *)self _refIdIsSpeechStart:v8];

  if (v9)
  {
    id v10 = [(ADCommandCenter *)self _speechManager];
    id v11 = objc_msgSend(v6, "ad_csASRFeatures");
    [v10 updateASRFeatures:v11];
  }
  else
  {
    id v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315138;
      int v14 = "-[ADCommandCenter _sasServerEndpointFeatures:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Got serverEndpointFeatures for something other than our current speech command. Ignoring.", (uint8_t *)&v13, 0xCu);
    }
  }
  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)_sasConfirmEndpoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 refId];
  unsigned int v9 = [(ADCommandCenter *)self _refIdIsSpeechStart:v8];

  if (v9)
  {
    id v10 = [v6 endpointConfirmationTimestamp];
    double v11 = (double)(unint64_t)[v10 unsignedLongLongValue] / 1000.0;

    id v12 = [(ADCommandCenter *)self _speechManager];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001E3E9C;
    v15[3] = &unk_100505D80;
    double v17 = v11;
    id v16 = v7;
    [v12 getLastStartpointTimestampAndCurrentTime:v15];

    id v13 = v16;
LABEL_7:

    goto LABEL_8;
  }
  int v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v19 = "-[ADCommandCenter _sasConfirmEndpoint:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Got confirmEndpointRequest for something other than our current speech command. Ignoring.", buf, 0xCu);
  }
  if (v7)
  {
    id v13 = objc_alloc_init((Class)SACommandFailed);
    (*((void (**)(id, id, void))v7 + 2))(v7, v13, 0);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_handleSuspendClientEndpointer:(id)a3
{
  id v4 = a3;
  id v5 = [v4 audioProcessedMs];
  double v6 = (double)(unint64_t)[v5 unsignedLongLongValue] / 1000.0;
  id v7 = [v4 suspendDurationMs];

  double v8 = (double)(unint64_t)[v7 unsignedLongLongValue] / 1000.0;
  id v9 = [(ADCommandCenter *)self _speechManager];
  objc_msgSend(v9, "suspendAutomaticEndpointingInRange:", v6, v8);
}

- (void)_sasSuspendClientEndpointer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 refId];
  unsigned int v9 = [(ADCommandCenter *)self _refIdIsSpeechStart:v8];

  if (v9)
  {
    [(ADCommandCenter *)self _handleSuspendClientEndpointer:v6];
  }
  else
  {
    id v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      id v12 = "-[ADCommandCenter _sasSuspendClientEndpointer:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Got suspendClientEndpointer for something other than our current speech command. Ignoring.", (uint8_t *)&v11, 0xCu);
    }
  }
  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)_sasVoiceSearchFinalResult:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 refId];
  unsigned int v9 = [(ADCommandCenter *)self _refIdIsSpeechStart:v8];

  if (v9)
  {
    if (objc_opt_respondsToSelector()) {
      [(ADCommandCenterSpeechDelegate *)self->_speechDelegate adSpeechDidFindVoiceSearchFinalResult:v6];
    }
    [(ADCommandCenter *)self _dictationSessionDidComplete];
  }
  else
  {
    id v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      id v12 = "-[ADCommandCenter _sasVoiceSearchFinalResult:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Got voiceSearchFinalResult for something other than our current speech command. Ignoring.", (uint8_t *)&v11, 0xCu);
    }
  }
  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)_sasVoiceSearchPartialResult:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 refId];
  unsigned int v9 = [(ADCommandCenter *)self _refIdIsSpeechStart:v8];

  if (v9)
  {
    if (objc_opt_respondsToSelector()) {
      [(ADCommandCenterSpeechDelegate *)self->_speechDelegate adSpeechDidFindVoiceSearchPartialResult:v6];
    }
  }
  else
  {
    id v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      id v12 = "-[ADCommandCenter _sasVoiceSearchPartialResult:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Got VoiceSearchPartialResult for something other than our current speech command. Ignoring.", (uint8_t *)&v11, 0xCu);
    }
  }
  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)_sasAbortSpeechRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 refId];
  unsigned __int8 v9 = [(ADCommandCenter *)self _refIdIsSpeechStart:v8];

  if (v9)
  {
    id v10 = [v6 reason];
    if ([v10 isEqualToString:SASAbortSpeechRequestReasonACOUSTIC_ID_DETECTEDValue])
    {
      unsigned int v11 = 1;
      uint64_t v12 = 218;
    }
    else
    {
      unsigned int v11 = [v10 isEqualToString:SASAbortSpeechRequestReasonFALSE_TRIGGER_DETECTEDValue];
      if (v11) {
        uint64_t v12 = 219;
      }
      else {
        uint64_t v12 = 211;
      }
    }
    uint64_t v14 = AFIsNano() | v11;
    __int16 v15 = +[AFError errorWithCode:v12 description:v10 underlyingError:0];
    [(ADCommandCenter *)self _endSpeechRequestForCommand:v6 withError:v15 suppressAlert:v14 secureOfflineOnlyDictation:0];
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
  else
  {
    id v13 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315138;
      double v17 = "-[ADCommandCenter _sasAbortSpeechRequest:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Abort for a different request. Ignoring.", (uint8_t *)&v16, 0xCu);
    }
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

- (void)_sasSpeechFailure:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 refId];
  unsigned __int8 v9 = [(ADCommandCenter *)self _refIdIsSpeechStart:v8];

  if (v9)
  {
    id v10 = [v6 reasonDescription];
    unsigned int v11 = objc_msgSend(v6, "ad_error");
    uint64_t v12 = +[AFError errorWithCode:203 description:v10 underlyingError:v11];

    [(ADCommandCenter *)self _endSpeechRequestForCommand:v6 withError:v12 suppressAlert:0 secureOfflineOnlyDictation:0];
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
  else
  {
    id v13 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      __int16 v15 = "-[ADCommandCenter _sasSpeechFailure:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Failure for a different request. Ignoring.", (uint8_t *)&v14, 0xCu);
    }
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

- (void)_saStructuredDictationFailure:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    id v10 = v8;
    unsigned int v11 = [v6 recognition];
    int v12 = 136315394;
    id v13 = "-[ADCommandCenter _saStructuredDictationFailure:completion:]";
    __int16 v14 = 2112;
    __int16 v15 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v12, 0x16u);
  }
  unsigned __int8 v9 = objc_msgSend(v6, "ad_error");
  [(ADCommandCenterSpeechDelegate *)self->_speechDelegate adSpeechRecognitionDidFail:v9 sessionUUID:self->_speechCapturingContextSessionUUID];
  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)_saStructuredDictationResult:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v11 = 136315394;
    int v12 = "-[ADCommandCenter _saStructuredDictationResult:completion:]";
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v11, 0x16u);
  }
  if (objc_opt_respondsToSelector())
  {
    speechDelegate = self->_speechDelegate;
    id v10 = [(ADCommandCenter *)self _languageModelForSpeechRequest:self->_startSpeechCommand];
    [(ADCommandCenterSpeechDelegate *)speechDelegate adSpeechRecognizedStructuredResult:v6 usingSpeechModel:v10 sessionUUID:0];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(ADCommandCenter *)self _dictationSessionDidComplete];
  }
  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)_sasSpeechPartialResult:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v27 = "-[ADCommandCenter _sasSpeechPartialResult:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  unsigned __int8 v9 = [v6 refId];
  unsigned __int8 v10 = [(ADCommandCenter *)self _refIdIsSpeechStart:v9];

  if (v10)
  {
    if (AFIsInternalInstall()) {
      id v11 = [v6 copy];
    }
    else {
      id v11 = 0;
    }
    __int16 v13 = +[AFAnalytics sharedAnalytics];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1001E4D6C;
    void v24[3] = &unk_10050E0C8;
    id v14 = v11;
    id v25 = v14;
    [v13 logEventWithType:1101 contextProvider:v24];

    if (sub_1001E4E20(self->_currentRequest, v6))
    {
      __int16 v15 = [(ADCommandCenterCurrentRequest *)self->_currentRequest currentRequestId];
      int v16 = [v6 encodedClassName];
      double v17 = [v6 aceId];
      sub_1001E4F30(v15, v16, v17, 3);
    }
    self->_hasReceivedServerSpeechRecognitions = 1;
    id v18 = [v6 tokens];
    id v19 = [v18 lastObject];

    __int16 v20 = [v19 endTime];
    double v21 = (double)(uint64_t)[v20 longLongValue] / 1000.0;

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1001E5124;
    v22[3] = &unk_10050E160;
    void v22[4] = self;
    id v23 = v6;
    [(ADCommandCenter *)self _handlePartialSpeechRecognitionForElapsedTime:v22 WithDelegateBlock:v21];
    [(ADCommandCenter *)self _acousticId_clearPartialResultTimer];
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
  else
  {
    int v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v27 = "-[ADCommandCenter _sasSpeechPartialResult:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Partial for a different request. Ignoring.", buf, 0xCu);
    }
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

- (void)_handleSpeechRecognizedWithDelegateBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = [(ADCommandCenter *)self _speechManager];
  [v5 updateOptionsAfterRecognitionForElapsedTime:1 isFinal:0.0];

  if (self->_speechDelegateHasReceivedSpeechRecognized)
  {
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v11 = "-[ADCommandCenter _handleSpeechRecognizedWithDelegateBlock:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Ignoring Recognition, SpeechRecognized has already been received", buf, 0xCu);
    }
  }
  else
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001E532C;
    block[3] = &unk_10050E138;
    void block[4] = self;
    dispatch_async(queue, block);
    if (v4) {
      v4[2](v4);
    }
    self->_speechDelegateHasReceivedSpeechRecognized = 1;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [(ADCommandCenter *)self _dictationSessionDidComplete];
      }
    }
    double v8 = +[AFDiagnostics sharedDiagnostics];
    [v8 logSpeechRecognized];
  }
}

- (void)_handlePartialSpeechRecognitionForElapsedTime:(double)a3 WithDelegateBlock:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v7 = [(ADCommandCenter *)self _speechManager];
  [v7 updateOptionsAfterRecognitionForElapsedTime:0 isFinal:a3];

  if (self->_speechDelegateHasReceivedSpeechRecognized)
  {
    double v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      unsigned __int8 v10 = "-[ADCommandCenter _handlePartialSpeechRecognitionForElapsedTime:WithDelegateBlock:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Ignoring Partial, SpeechRecognized has already been received", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v6)
  {
    v6[2](v6);
  }
}

- (void)_sasPronunciationRecognized:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 refId];
  unsigned __int8 v9 = [(ADCommandCenter *)self _refIdIsSpeechStart:v8];

  if (v9)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001E5684;
    v11[3] = &unk_10050E160;
    void v11[4] = self;
    id v12 = v6;
    [(ADCommandCenter *)self _handleSpeechRecognizedWithDelegateBlock:v11];
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
  else
  {
    unsigned __int8 v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v14 = "-[ADCommandCenter _sasPronunciationRecognized:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s PronunciationRecognized for a different request. Ignoring", buf, 0xCu);
    }
  }
}

- (void)_sasSpeechMultilingualSpeechRecognized:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 refId];
  unsigned __int8 v12 = [(ADCommandCenter *)self _refIdIsSpeechStart:v11];

  __int16 v13 = AFSiriLogContextDaemon;
  BOOL v14 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v14)
    {
      *(_DWORD *)long long buf = 136315394;
      id v31 = "-[ADCommandCenter _sasSpeechMultilingualSpeechRecognized:executionContext:completion:]";
      __int16 v32 = 2112;
      id v33 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }
    if (self->_isSmartLanguageSelectionActive)
    {
      objc_initWeak((id *)buf, self);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1001E5AA4;
      v26[3] = &unk_100507F60;
      objc_copyWeak(&v29, (id *)buf);
      id v27 = v8;
      id v28 = v10;
      __int16 v15 = objc_retainBlock(v26);
      id multilingualSpeechRecognizedCommandHandler = self->_multilingualSpeechRecognizedCommandHandler;
      self->_id multilingualSpeechRecognizedCommandHandler = v15;

      if (self->_hasReceivedDetectedLanguage)
      {
        double v17 = (void (**)(void))objc_retainBlock(self->_multilingualSpeechRecognizedCommandHandler);
        id v18 = self->_multilingualSpeechRecognizedCommandHandler;
        self->_id multilingualSpeechRecognizedCommandHandler = 0;

        v17[2](v17);
      }
      else
      {
        [(ADCommandCenter *)self _startLanguageDetectionWaitTimer];
      }

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      id v19 = [(SASStartSpeech *)self->_startSpeechCommand ad_languageModel];
      if (v19)
      {
        __int16 v20 = [v8 speechRecognizedByLanguage];
        double v21 = [v20 objectForKey:v19];

        id v22 = [(SASStartSpeech *)self->_startSpeechCommand aceId];
        [v21 setRefId:v22];

        [(ADCommandCenter *)self _sasSpeechRecognized:v21 executionContext:v9 completion:v10];
      }
      else
      {
        id v23 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          unsigned int v24 = v23;
          id v25 = [v8 speechRecognizedByLanguage];
          *(_DWORD *)long long buf = 136315650;
          id v31 = "-[ADCommandCenter _sasSpeechMultilingualSpeechRecognized:executionContext:completion:]";
          __int16 v32 = 2112;
          id v33 = v8;
          __int16 v34 = 2112;
          __int16 v35 = v25;
          _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s SASMultilingualSpeechRecognized failed to return speech recognized command for primary language\n %@ %@", buf, 0x20u);
        }
        if (v10) {
          (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
        }
      }
    }
  }
  else
  {
    if (v14)
    {
      *(_DWORD *)long long buf = 136315138;
      id v31 = "-[ADCommandCenter _sasSpeechMultilingualSpeechRecognized:executionContext:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Multilingual SpeechRecognized for a different request. Ignoring.", buf, 0xCu);
    }
    if (v10) {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
}

- (void)_sasSpeechRecognized:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id, void))a5;
  id v11 = [v8 refId];
  unsigned __int8 v12 = [(ADCommandCenter *)self _refIdIsSpeechStart:v11];

  __int16 v13 = AFSiriLogContextDaemon;
  BOOL v14 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v14)
    {
      __int16 v15 = v13;
      *(_DWORD *)long long buf = 136315394;
      id v31 = "-[ADCommandCenter _sasSpeechRecognized:executionContext:completion:]";
      __int16 v32 = 1024;
      unsigned int v33 = [v8 eager];
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s isEager %d", buf, 0x12u);
    }
    int v16 = [(ADCommandCenter *)self _queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001E64C4;
    block[3] = &unk_10050E138;
    void block[4] = self;
    dispatch_async(v16, block);

    id v17 = [v8 copy];
    id v18 = [(ADCommandCenter *)self _languageModelForSpeechRequest:self->_startSpeechCommand];
    id v19 = sub_1001E5EEC(v17, v18);
    __int16 v20 = +[AFAnalytics sharedAnalytics];
    [v20 logEventWithType:1102 context:v19];

    [(ADCommandCenter *)self _setSpeechRecognizedContext:v19];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    void v27[2] = sub_1001E6654;
    v27[3] = &unk_100505D58;
    id v21 = v8;
    id v28 = v21;
    [v9 updateInfoUsingBlock:v27];
    [(ADCommandCenter *)self _cancelLocalRecognitionIfRequired];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1001E6708;
    void v24[3] = &unk_10050DCB8;
    void v24[4] = self;
    id v25 = v21;
    id v22 = v18;
    id v26 = v22;
    [(ADCommandCenter *)self _handleSpeechRecognizedWithDelegateBlock:v24];
    if (v10)
    {
      id v23 = objc_alloc_init((Class)SACommandSucceeded);
      v10[2](v10, v23, 0);
    }
  }
  else
  {
    if (v14)
    {
      *(_DWORD *)long long buf = 136315138;
      id v31 = "-[ADCommandCenter _sasSpeechRecognized:executionContext:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s SpeechRecognized for a different request. Ignoring.", buf, 0xCu);
    }
    if (v10) {
      v10[2](v10, 0, 0);
    }
  }
}

- (void)_sasVoiceIdentificationSignal:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 refId];
  unsigned __int8 v9 = [(ADCommandCenter *)self _refIdIsSpeechStart:v8];

  if (v9)
  {
    id v10 = [v6 recordUserAudio];
    id v11 = [v6 resultCandidateId];
    unsigned __int8 v12 = [v6 selectedSharedUserId];
    NSUInteger v13 = [(NSString *)self->_selectedSharedUserID length];
    if (v12)
    {
      if (v13) {
        goto LABEL_12;
      }
      objc_storeStrong((id *)&self->_selectedSharedUserID, v12);
      BOOL v14 = AFSiriLogContextDaemon;
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_12;
      }
      selectedSharedUserID = self->_selectedSharedUserID;
      *(_DWORD *)unsigned int v24 = 136315394;
      *(void *)&void v24[4] = "-[ADCommandCenter _sasVoiceIdentificationSignal:completion:]";
      *(_WORD *)&v24[12] = 2112;
      *(void *)&v24[14] = selectedSharedUserID;
      int v16 = "%s Updated _selectedSharedUserID from SASVoiceIdentificationSignal to: %@";
      id v17 = v14;
      uint32_t v18 = 22;
    }
    else
    {
      if (!v13) {
        goto LABEL_12;
      }
      __int16 v20 = AFSiriLogContextDaemon;
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_12;
      }
      *(_DWORD *)unsigned int v24 = 136315138;
      *(void *)&void v24[4] = "-[ADCommandCenter _sasVoiceIdentificationSignal:completion:]";
      int v16 = "%s Not updating _selectedSharedUserID with nil selectedSharedUserID from SASVoiceIdentificationSignal";
      id v17 = v20;
      uint32_t v18 = 12;
    }
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, v16, v24, v18);
LABEL_12:
    id v21 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)unsigned int v24 = 136316162;
      *(void *)&void v24[4] = "-[ADCommandCenter _sasVoiceIdentificationSignal:completion:]";
      *(_WORD *)&v24[12] = 2112;
      *(void *)&v24[14] = v6;
      *(_WORD *)&v24[22] = 1024;
      int v25 = (int)v10;
      __int16 v26 = 2112;
      id v27 = v11;
      __int16 v28 = 2112;
      id v29 = v12;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s %@ (recordUserAudio = %d, resultCandidateId = %@, selectedSharedUserId = %@)", v24, 0x30u);
    }
    id v22 = [(ADCommandCenter *)self _speechCapturingContext];
    id v23 = [v6 selectedSharedUserId];
    [v22 updateAccessToRecordedAudioForVoiceIdentificationTraining:v10 forResultCandidateId:v11 sharedUserId:v23];

    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    goto LABEL_15;
  }
  id v19 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)unsigned int v24 = 136315138;
    *(void *)&void v24[4] = "-[ADCommandCenter _sasVoiceIdentificationSignal:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s VoiceIdentificationSignal for a different request. Ignoring.", v24, 0xCu);
  }
  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
LABEL_15:
}

- (void)_setSpeechRecognizedContext:(id)a3
{
  id v4 = a3;
  id v5 = [(ADCommandCenter *)self _speechManager];
  [v5 setSpeechRecognizedContext:v4];
}

- (void)_sasSpeechServerEndpointIdentified:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 refId];
  unsigned __int8 v8 = [(ADCommandCenter *)self _refIdIsSpeechStart:v7];

  unsigned __int8 v9 = AFSiriLogContextDaemon;
  BOOL v10 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      int v12 = 136315138;
      NSUInteger v13 = "-[ADCommandCenter _sasSpeechServerEndpointIdentified:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v12, 0xCu);
    }
    id v11 = [(ADCommandCenter *)self _speechManager];
    [v11 enforcePreviousEndpointHint];

LABEL_8:
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
    goto LABEL_9;
  }
  if (v10)
  {
    int v12 = 136315138;
    NSUInteger v13 = "-[ADCommandCenter _sasSpeechServerEndpointIdentified:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s ServerEndpoint for a different request. Ignoring.", (uint8_t *)&v12, 0xCu);
  }
  if (v6) {
    goto LABEL_8;
  }
LABEL_9:
}

- (BOOL)_didAlreadyAcceptResultCandidate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_speechHasAcceptedResultCandidate
    && (self->_selectedResultCandidate
     || ([v4 processedAudioDuration],
         id v6 = objc_claimAutoreleasedReturnValue(),
         [v6 doubleValue],
         double v8 = v7,
         double v9 = self->_speechAcceptedResultCandidateDuration,
         v6,
         v8 < v9)))
  {
    BOOL v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v20 = 136315138;
      id v21 = "-[ADCommandCenter _didAlreadyAcceptResultCandidate:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Already accepted result candidate for request", (uint8_t *)&v20, 0xCu);
      BOOL v10 = AFSiriLogContextDaemon;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      selectedResultCandidate = self->_selectedResultCandidate;
      int v12 = v10;
      NSUInteger v13 = [(SASResultCandidate *)selectedResultCandidate processedAudioDuration];
      [v13 doubleValue];
      uint64_t v15 = v14;
      int v16 = [(SASResultCandidate *)self->_selectedResultCandidate resultId];
      int v20 = 136315906;
      id v21 = "-[ADCommandCenter _didAlreadyAcceptResultCandidate:]";
      __int16 v22 = 2112;
      double v23 = *(double *)&selectedResultCandidate;
      __int16 v24 = 2048;
      uint64_t v25 = v15;
      __int16 v26 = 2112;
      id v27 = v16;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s selectedResultCandidate = %@ (processedAudioDuration = %f, resultId = %@)", (uint8_t *)&v20, 0x2Au);

      BOOL v10 = AFSiriLogContextDaemon;
    }
    BOOL v17 = 1;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      double speechAcceptedResultCandidateDuration = self->_speechAcceptedResultCandidateDuration;
      int v20 = 136315394;
      id v21 = "-[ADCommandCenter _didAlreadyAcceptResultCandidate:]";
      __int16 v22 = 2048;
      double v23 = speechAcceptedResultCandidateDuration;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s double speechAcceptedResultCandidateDuration = %f", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (void)_acceptResultCandidate:(id)a3 isMitigated:(BOOL)a4 featuresToLog:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v11 refId];
  if ([(ADCommandCenter *)self _refIdIsSpeechStart:v14])
  {
    BOOL v41 = v8;
    uint64_t v15 = [v11 resultId];
    int v16 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      BOOL v17 = v16;
      uint32_t v18 = [v11 aceId];
      *(_DWORD *)long long buf = 136315906;
      __int16 v46 = "-[ADCommandCenter _acceptResultCandidate:isMitigated:featuresToLog:completion:]";
      __int16 v47 = 2112;
      id v48 = v18;
      __int16 v49 = 2112;
      id v50 = v14;
      __int16 v51 = 2112;
      id v52 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Check if ResultCandidate has already been accepted rcId: %@ refId: %@ with resultId: %@", buf, 0x2Au);
    }
    if ([(ADCommandCenter *)self _didAlreadyAcceptResultCandidate:v11])
    {
      if (v13) {
        (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
      }
    }
    else
    {
      p_selectedResultCandidate = (id *)&self->_selectedResultCandidate;
      objc_storeStrong((id *)&self->_selectedResultCandidate, a3);
      id v21 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        id v22 = *p_selectedResultCandidate;
        double v23 = v21;
        __int16 v24 = [v22 processedAudioDuration];
        [v24 doubleValue];
        __int16 v26 = v25;
        id v27 = [*p_selectedResultCandidate resultId];
        *(_DWORD *)long long buf = 136315906;
        __int16 v46 = "-[ADCommandCenter _acceptResultCandidate:isMitigated:featuresToLog:completion:]";
        __int16 v47 = 2112;
        id v48 = v22;
        __int16 v49 = 2048;
        id v50 = v26;
        __int16 v51 = 2112;
        id v52 = v27;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s selectedResultCandidate = %@ (processedAudioDuration = %f, resultId = %@)", buf, 0x2Au);
      }
      __int16 v28 = AFAnalyticsContextCreateWithCommand();
      v44[0] = v28;
      if (v12)
      {
        CFStringRef v42 = @"features";
        id v43 = v12;
        id v29 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      }
      else
      {
        id v29 = &__NSDictionary0__struct;
      }
      v44[1] = v29;
      BOOL v30 = +[NSArray arrayWithObjects:v44 count:2];
      id v31 = AFAnalyticsContextsMerge();

      if (v12) {
      __int16 v32 = +[AFAnalytics sharedAnalytics];
      }
      [v32 logEventWithType:310 context:v31];

      unsigned int v33 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        __int16 v34 = v33;
        __int16 v35 = [v11 aceId];
        *(_DWORD *)long long buf = 136315906;
        __int16 v46 = "-[ADCommandCenter _acceptResultCandidate:isMitigated:featuresToLog:completion:]";
        __int16 v47 = 2112;
        id v48 = v35;
        __int16 v49 = 2112;
        id v50 = v14;
        __int16 v51 = 2112;
        id v52 = v15;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%s Accepted this ResultCandidate aceId: %@ refId: %@ with resultId %@", buf, 0x2Au);
      }
      id v36 = [(ADCommandCenter *)self _speechCapturingContext];
      id v37 = [v11 aceId];
      [v36 updateSelectedResultCandidateId:v37];

      if (v13)
      {
        id v38 = objc_alloc_init((Class)SAResultSelected);
        [v38 setRefId:v14];
        __int16 v39 = [v11 processedAudioDuration];
        [v38 setProcessedAudioDuration:v39];

        [v38 setResultId:v15];
        __int16 v40 = +[NSNumber numberWithBool:v41];
        [v38 setIsMitigated:v40];

        (*((void (**)(id, id, void))v13 + 2))(v13, v38, 0);
      }
    }
  }
  else
  {
    id v19 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      __int16 v46 = "-[ADCommandCenter _acceptResultCandidate:isMitigated:featuresToLog:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s ResultCandidate is out of scope in accept. Ignoring.", buf, 0xCu);
    }
    if (v13) {
      (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
    }
  }
}

- (void)_sasResultCandidate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v31 = "-[ADCommandCenter _sasResultCandidate:completion:]";
    __int16 v32 = 2112;
    id v33 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s resultCandidate = %@", buf, 0x16u);
  }
  double v9 = [v6 refId];
  if ([(ADCommandCenter *)self _refIdIsSpeechStart:v9])
  {
    self->_hasReceivedAtLeastOneResultCandidate = 1;
    BOOL v10 = [v6 processedAudioDuration];
    [v10 doubleValue];
    id v12 = v11;

    id v13 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = v13;
      uint64_t v15 = [v6 resultId];
      *(_DWORD *)long long buf = 136315906;
      id v31 = "-[ADCommandCenter _sasResultCandidate:completion:]";
      __int16 v32 = 2112;
      id v33 = v6;
      __int16 v34 = 2048;
      __int16 v35 = v12;
      __int16 v36 = 2112;
      id v37 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s %@ (processedAudioDuration = %f, resultId = %@)", buf, 0x2Au);

      id v13 = AFSiriLogContextDaemon;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v16 = v13;
      BOOL v17 = [v6 aceId];
      uint32_t v18 = [v6 resultId];
      *(_DWORD *)long long buf = 136315906;
      id v31 = "-[ADCommandCenter _sasResultCandidate:completion:]";
      __int16 v32 = 2112;
      id v33 = v17;
      __int16 v34 = 2112;
      __int16 v35 = v9;
      __int16 v36 = 2112;
      id v37 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Check if ResultCandidate has already been accepted rcId: %@ refId: %@ with resultId: %@", buf, 0x2Au);
    }
    if (![(ADCommandCenter *)self _didAlreadyAcceptResultCandidate:v6])
    {
      id v19 = +[AFAnalytics sharedAnalytics];
      [v19 logEventWithType:308 context:0];

      int v20 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        BOOL speechHasAcceptedResultCandidate = self->_speechHasAcceptedResultCandidate;
        *(_DWORD *)long long buf = 136315394;
        id v31 = "-[ADCommandCenter _sasResultCandidate:completion:]";
        __int16 v32 = 1024;
        LODWORD(v33) = speechHasAcceptedResultCandidate;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s forceAccept = %d", buf, 0x12u);
      }
      id v22 = [(ADCommandCenter *)self _speechManager];
      BOOL v23 = self->_speechHasAcceptedResultCandidate;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1001E773C;
      v25[3] = &unk_100505D08;
      void v25[4] = self;
      id v26 = v9;
      id v29 = v12;
      id v28 = v7;
      id v27 = v6;
      [v22 updateEndpointHintForRC:v27 forceAccept:v23 completion:v25];

      goto LABEL_16;
    }
  }
  else
  {
    __int16 v24 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v31 = "-[ADCommandCenter _sasResultCandidate:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s ResultCandidate for a different request. Ignoring.", buf, 0xCu);
    }
  }
  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
LABEL_16:
}

- (void)_saDeviceMyriadConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = +[AFPreferences sharedPreferences];
  if ([v8 myriadServerProvisioning])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001E7D10;
    block[3] = &unk_10050E138;
    void block[4] = self;
    if (qword_100585DF0 != -1) {
      dispatch_once(&qword_100585DF0, block);
    }
    uint64_t v9 = arc4random_uniform(0xFFu);
    BOOL v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      uint32_t v18 = "-[ADCommandCenter _saDeviceMyriadConfiguration:completion:]";
      __int16 v19 = 2048;
      uint64_t v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Server sent Myriad device configuration. Notifying clients with state %llu", buf, 0x16u);
    }
    [v6 deviceClass];
    [v8 setMyriadDeviceClass:(int)v11];
    [v6 deviceAdjustment];
    *(float *)&double v12 = v12;
    [v8 setMyriadDeviceAdjust:v12];
    [v6 deviceDelay];
    objc_msgSend(v8, "setMyriadDeviceDelay:");
    [v6 deviceTrumpDelay];
    objc_msgSend(v8, "setMyriadDeviceTrumpDelay:");
    [v8 setMyriadServerHasProvisioned:1];
    [v6 deviceVTEndtimeDistanceThreshold];
    objc_msgSend(v8, "setMyriadDeviceVTEndTimeDistanceThreshold:");
    int v13 = AFSupportsSCDAFramework();
    uint64_t v14 = &qword_100585DE8;
    if (!v13) {
      uint64_t v14 = &qword_100585DE0;
    }
    [(id)*v14 publishState:v9];
  }
  else
  {
    uint64_t v15 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      uint32_t v18 = "-[ADCommandCenter _saDeviceMyriadConfiguration:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Server sent Myriad device configuration, but it was ignored", buf, 0xCu);
    }
  }
  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)_saDeviceConfiguration:(id)a3 completion:(id)a4
{
  double v5 = COERCE_DOUBLE(a3);
  id v6 = a4;
  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v36 = 136315394;
    id v37 = "-[ADCommandCenter _saDeviceConfiguration:completion:]";
    __int16 v38 = 2112;
    double v39 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s deviceConfiguration = %@", (uint8_t *)&v36, 0x16u);
  }
  [*(id *)&v5 initialInterstitialDelay];
  double v9 = v8;
  BOOL v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v36 = 136315394;
    id v37 = "-[ADCommandCenter _saDeviceConfiguration:completion:]";
    __int16 v38 = 2048;
    double v39 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s initialInterstitialDelay = %f", (uint8_t *)&v36, 0x16u);
  }
  _AFPreferencesSetInitialInterstitialDelay();
  [*(id *)&v5 initialInterstitialDelayForCarPlay];
  double v12 = v11;
  int v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v36 = 136315394;
    id v37 = "-[ADCommandCenter _saDeviceConfiguration:completion:]";
    __int16 v38 = 2048;
    double v39 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s initialInterstitialDelayForCarPlay = %f", (uint8_t *)&v36, 0x16u);
  }
  _AFPreferencesSetInitialInterstitialDelay();
  [*(id *)&v5 initialInterstitialDelayForVoiceTriggerOneShotWithoutAudioDucking];
  double v15 = v14;
  int v16 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v36 = 136315394;
    id v37 = "-[ADCommandCenter _saDeviceConfiguration:completion:]";
    __int16 v38 = 2048;
    double v39 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s initialInterstitialDelayForVoiceTriggerOneShotWithoutAudioDucking = %f", (uint8_t *)&v36, 0x16u);
  }
  _AFPreferencesSetInitialInterstitialDelayForVoiceTriggerOneShotWithoutAudioDucking();
  unsigned int v17 = [*(id *)&v5 hasAudioSessionActivationDelay];
  uint32_t v18 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v36 = 136315394;
    id v37 = "-[ADCommandCenter _saDeviceConfiguration:completion:]";
    __int16 v38 = 1024;
    LODWORD(v39) = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s hasAudioSessionActivationDelay = %d", (uint8_t *)&v36, 0x12u);
  }
  if (v17)
  {
    [*(id *)&v5 audioSessionActivationDelay];
    double v20 = v19;
    id v21 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v36 = 136315394;
      id v37 = "-[ADCommandCenter _saDeviceConfiguration:completion:]";
      __int16 v38 = 2048;
      double v39 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s audioSessionActivationDelay = %f", (uint8_t *)&v36, 0x16u);
    }
    id v22 = +[ADPreferences sharedPreferences];
    BOOL v23 = +[NSNumber numberWithDouble:v20];
    [v22 setServerAudioSessionActivationDelay:v23];

    [*(id *)&v5 mediaPlaybackVolumeThresholdForAudioSessionActivationDelay];
    double v25 = v24;
    id v26 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v36 = 136315394;
      id v37 = "-[ADCommandCenter _saDeviceConfiguration:completion:]";
      __int16 v38 = 2048;
      double v39 = v25;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s mediaPlaybackVolumeThresholdForAudioSessionActivationDelay = %f", (uint8_t *)&v36, 0x16u);
    }
    id v27 = +[ADPreferences sharedPreferences];
    id v28 = +[NSNumber numberWithDouble:v25];
    [v27 setServerMediaPlaybackVolumeThresholdForAudioSessionActivationDelay:v28];

    [*(id *)&v5 audioSessionActivationDelayAboveMediaPlaybackVolumeThreshold];
    double v30 = v29;
    id v31 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v36 = 136315394;
      id v37 = "-[ADCommandCenter _saDeviceConfiguration:completion:]";
      __int16 v38 = 2048;
      double v39 = v30;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%s audioSessionActivationDelayAboveMediaPlaybackVolumeThreshold = %f", (uint8_t *)&v36, 0x16u);
    }
    __int16 v32 = +[ADPreferences sharedPreferences];
    id v33 = +[NSNumber numberWithDouble:v30];
    [v32 setServerAudioSessionActivationDelayAboveMediaPlaybackVolumeThreshold:v33];
  }
  else
  {
    __int16 v34 = +[ADPreferences sharedPreferences];
    [v34 setServerAudioSessionActivationDelay:0];

    __int16 v35 = +[ADPreferences sharedPreferences];
    [v35 setServerMediaPlaybackVolumeThresholdForAudioSessionActivationDelay:0];

    __int16 v32 = +[ADPreferences sharedPreferences];
    [v32 setServerAudioSessionActivationDelayAboveMediaPlaybackVolumeThreshold:0];
  }

  AFInternalPreferencesSynchronize();
  if (v6) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)_saCancelCrossDeviceRequest:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v6 = a3;
  id v7 = [v6 requestId];
  double v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    double v14 = v8;
    *(_DWORD *)long long buf = 136315650;
    unsigned int v17 = "-[ADCommandCenter _saCancelCrossDeviceRequest:executionContext:completion:]";
    __int16 v18 = 2112;
    double v19 = v7;
    __int16 v20 = 1024;
    unsigned int v21 = [v6 cancelAssociatedRequests];
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%s %@, shouldCancelAssociatedRequest? %d", buf, 0x1Cu);
  }
  double v9 = [(ADCommandCenterCurrentRequest *)self->_currentRequest currentRequestId];
  if ([v9 isEqualToString:v7])
  {

LABEL_7:
    [(ADCommandCenter *)self cancelCurrentRequest];
    [(ADCommandCenter *)self _clearContext];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001E84A8;
    v15[3] = &unk_100505CB8;
    void v15[4] = mach_absolute_time();
    id v11 = +[AFSiriActivationContext newWithBuilder:v15];
    double v12 = +[AFSiriActivationConnection sharedConnection];
    [v12 deactivateForReason:15 options:1 context:v11 completion:0];
LABEL_12:

    goto LABEL_13;
  }
  if ([(NSString *)self->_associatedRequestId isEqualToString:v7])
  {
    unsigned __int8 v10 = [v6 cancelAssociatedRequests];

    if (v10) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  if ([(ADCommandCenter *)self _hasRemoteExecutionContextForRequestID:v7]
    || self->_mostRecentVisibleRemoteExecutionContext)
  {
    id v11 = [(ADCommandCenter *)self _serviceManager];
    double v12 = [(ADCommandCenter *)self _account];
    int v13 = [v12 assistantIdentifier];
    [v11 cancelOperationsForRequest:v7 forAssistantID:v13 fromRemote:1 reason:2];

    goto LABEL_12;
  }
LABEL_13:
}

- (void)_saReplayRequestFromDMHypothesis:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)AFRequestInfo);
  [v8 setStartRequest:v7];

  double v9 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    double v14 = "-[ADCommandCenter _saReplayRequestFromDMHypothesis:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001E866C;
  v11[3] = &unk_10050CF78;
  id v12 = v6;
  id v10 = v6;
  [(ADCommandCenter *)self handleExternalActivationRequest:v8 completion:v11];
}

- (void)_saStartUIRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)AFRequestInfo);
  double v9 = [v7 startRequest];
  [v8 setStartRequest:v9];

  id v10 = [v7 startLocalRequest];

  [v8 setStartLocalRequest:v10];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001E879C;
  v12[3] = &unk_10050CF78;
  id v13 = v6;
  id v11 = v6;
  [(ADCommandCenter *)self handleExternalActivationRequest:v8 completion:v12];
}

- (void)_saWaitForCommands:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v37 = [v5 refId];
  id v7 = [v5 commandAceIds];
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    id v57 = "-[ADCommandCenter _saWaitForCommands:completion:]";
    __int16 v58 = 2112;
    id v59 = v5;
    __int16 v60 = 2112;
    id v61 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@ (commands = %@)", buf, 0x20u);
  }
  if (![(ADCommandCenter *)self _hasOutstandingRequestId:v37])
  {
    double v29 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315650;
      id v57 = "-[ADCommandCenter _saWaitForCommands:completion:]";
      __int16 v58 = 2112;
      id v59 = v5;
      __int16 v60 = 2112;
      id v61 = v37;
      _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s Ignored %@ because request id %@ is unknown.", buf, 0x20u);
      if (!v6) {
        goto LABEL_24;
      }
    }
    else if (!v6)
    {
      goto LABEL_24;
    }
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
    goto LABEL_24;
  }
  id v9 = objc_alloc((Class)AFTwoArgumentSafetyBlock);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_1001E8DE0;
  v53[3] = &unk_10050CF00;
  id v54 = v6;
  id v10 = [v9 initWithBlock:v53 defaultValue1:0 defaultValue2:0];
  if ([v7 count])
  {
    id v35 = v6;
    id v11 = objc_alloc((Class)AFWatchdogTimer);
    queue = self->_queue;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1001E8E8C;
    v50[3] = &unk_10050E160;
    id v33 = v10;
    id v32 = v10;
    id v51 = v32;
    id v31 = v5;
    id v52 = v31;
    id v30 = [v11 initWithTimeoutInterval:queue onQueue:v50 timeoutHandler:30.0];
    [v30 start];
    id v13 = dispatch_group_create();
    double v14 = [(ADCommandCenter *)self _handledCommandIdsForRequestId:v37];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    __int16 v34 = v7;
    id v15 = v7;
    id v16 = [v15 countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v47;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v47 != v18) {
            objc_enumerationMutation(v15);
          }
          __int16 v20 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          unsigned __int8 v21 = [v14 containsObject:v20];
          id v22 = AFSiriLogContextDaemon;
          BOOL v23 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
          if (v21)
          {
            if (v23)
            {
              *(_DWORD *)long long buf = 136315394;
              id v57 = "-[ADCommandCenter _saWaitForCommands:completion:]";
              __int16 v58 = 2112;
              id v59 = v20;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s Command %@ is already handled. No need to wait.", buf, 0x16u);
            }
          }
          else
          {
            if (v23)
            {
              *(_DWORD *)long long buf = 136315394;
              id v57 = "-[ADCommandCenter _saWaitForCommands:completion:]";
              __int16 v58 = 2112;
              id v59 = v20;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s Start waiting for command %@ ...", buf, 0x16u);
            }
            dispatch_group_enter(v13);
            id v24 = objc_alloc((Class)AFSafetyBlock);
            v44[0] = _NSConcreteStackBlock;
            v44[1] = 3221225472;
            void v44[2] = sub_1001E8F60;
            v44[3] = &unk_10050C2A0;
            void v44[4] = v20;
            BOOL v45 = v13;
            id v25 = [v24 initWithBlock:v44];
            v42[0] = _NSConcreteStackBlock;
            v42[1] = 3221225472;
            v42[2] = sub_1001E9024;
            v42[3] = &unk_10050E138;
            id v43 = v25;
            id v26 = v25;
            [(ADCommandCenter *)self _addPostCommandHandlingBlock:v42 forCommandId:v20 requestId:v37];
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v46 objects:v55 count:16];
      }
      while (v17);
    }

    id v27 = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001E9030;
    block[3] = &unk_10050DCB8;
    id v39 = v30;
    id v40 = v32;
    id v41 = v31;
    id v28 = v30;
    dispatch_group_notify(v13, v27, block);

    id v6 = v35;
    id v10 = v33;
    id v7 = v34;
  }
  else
  {
    [v10 invokeWithValue:0 andValue:0];
  }

LABEL_24:
}

- (void)_saPing:(id)a3 completion:(id)a4
{
  id v8 = (void (**)(id, id, void))a4;
  id v5 = a3;
  id v6 = objc_alloc_init((Class)SAPong);
  id v7 = [v5 aceId];

  [v6 setRefId:v7];
  if (v8) {
    v8[2](v8, v6, 0);
  }
}

- (void)_saSetDeviceTTSMuteState:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = "-[ADCommandCenter _saSetDeviceTTSMuteState:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }
  -[ADCommandCenterClient adServerRequestsTTSStateUnmuted:](self->_currentClient, "adServerRequestsTTSStateUnmuted:", [v6 textToSpeechIsMuted] ^ 1);
  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)_saInitiateHandoffOnCompanion:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v30 = "-[ADCommandCenter _saInitiateHandoffOnCompanion:completion:]";
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  id v9 = objc_alloc_init((Class)AFRequestInfo);
  id v10 = [(AFSpeechRequestOptions *)self->_currentSpeechRequestOptions turnIdentifier];
  [v9 setTurnIdentifier:v10];

  id v11 = [v6 notificationText];
  if (AFIsATV())
  {
    [v9 setIsATVHandoff:1];
    id v12 = +[NSBundle bundleForClass:objc_opt_class()];
    id v13 = v12;
    if (!v11)
    {
      id v11 = [v12 localizedStringForKey:@"ASSISTANT_SERVICES_ATV_REQUEST_HANDOFF_NOTIFICATION_BODY" value:0 table:0];
    }
  }
  if (v11)
  {
    [v9 setHandoffNotification:v11];
    [v9 setHandoffRequiresUserInteraction:1];
  }
  double v14 = [v6 isSiriXRequest];
  objc_msgSend(v9, "setIsSiriXRequest:", objc_msgSend(v14, "BOOLValue"));

  id v15 = [v6 handoffPayload];
  objc_msgSend(v9, "_ad_setHandoffPayload:", v15);

  id v16 = [v6 targetDevice];
  id v17 = [v16 assistantId];

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1001E9610;
  v26[3] = &unk_10050DEE8;
  id v18 = v6;
  id v27 = v18;
  id v19 = v7;
  id v28 = v19;
  __int16 v20 = objc_retainBlock(v26);
  if (!AFIsATV() || v17)
  {
    [(ADCommandCenter *)self startRemoteRequest:v9 onTargetDevice:v17 completion:v20];
  }
  else
  {
    unsigned __int8 v21 = +[ADMultiUserService sharedService];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1001E96C0;
    v22[3] = &unk_100505C98;
    void v22[4] = self;
    id v23 = v9;
    id v24 = v20;
    id v25 = v19;
    [v21 getCompanionAssistantIdForRecognizedUser:v22];
  }
}

- (void)_saExecuteCallbacks:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id, void))a4;
  id v7 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    id v9 = [v5 callbacks];
    id v10 = [v9 firstObject];
    id v11 = [v10 commandReferences];
    int v13 = 136315394;
    double v14 = "-[ADCommandCenter _saExecuteCallbacks:completion:]";
    __int16 v15 = 2112;
    id v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s first callback ACE IDs: %@", (uint8_t *)&v13, 0x16u);
  }
  if (objc_msgSend(v5, "ad_hasCallbacks"))
  {
    id v12 = objc_alloc_init((Class)SACommandSucceeded);
    v6[2](v6, v12, 0);
  }
  else
  {
    v6[2](v6, 0, 0);
  }
}

- (void)_saAddResultObjects:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v34 = a4;
  id v6 = v5;
  id v7 = [v6 objects];
  __int16 v31 = [v6 resultObjects];
  id v29 = [v31 count];
  id v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    id v10 = [v7 count];
    id v11 = [v6 aceId];
    id v12 = [v6 refId];
    *(_DWORD *)long long buf = 136315906;
    long long v46 = "_LogARO";
    __int16 v47 = 2048;
    id v48 = v10;
    __int16 v49 = 2112;
    id v50 = v11;
    __int16 v51 = 2112;
    id v52 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Got AddResultObjects with %lu objects aceID=%@, refId=%@ ", buf, 0x2Au);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v33 = v6;
  int v13 = objc_msgSend(v6, "objects", v29);
  id v14 = [v13 countByEnumeratingWithState:&v35 objects:buf count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v36;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          id v19 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          __int16 v20 = v18;
          unsigned __int8 v21 = [v19 encodedClassName];
          id v22 = [v19 aceId];
          *(_DWORD *)id v39 = 136315650;
          id v40 = "_LogARO";
          __int16 v41 = 2112;
          CFStringRef v42 = v21;
          __int16 v43 = 2112;
          __int16 v44 = v22;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s  - %@ %@", v39, 0x20u);
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v35 objects:buf count:16];
    }
    while (v15);
  }

  id v23 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    if (v30)
    {
      id v24 = [v33 valueForKey:@"aceId"];
    }
    else
    {
      id v24 = &stru_10050F7D8;
    }
    *(_DWORD *)id v39 = 136315650;
    id v40 = "_LogARO";
    __int16 v41 = 2048;
    CFStringRef v42 = v30;
    __int16 v43 = 2112;
    __int16 v44 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s And %lu resultObjects %@", v39, 0x20u);
    if (v30) {
  }
    }
  id v25 = [(ADCommandCenterCurrentRequest *)self->_currentRequest currentRequestId];
  id v26 = [v33 refId];

  if (!v26) {
    [v33 setRefId:v25];
  }
  id v27 = [(ADSessionManager *)self->_sessionManager sessionRequestIdForRefId:v25];
  id v28 = [(ADCommandCenter *)self _resultObjectCache];
  [v28 addResultObjects:v33 sessionRequestId:v27];

  if (v34) {
    (*((void (**)(id, void, void))v34 + 2))(v34, 0, 0);
  }
}

- (void)_emitTriggerWithCachingForUUID:(id)a3 namespace:(id)a4 requestID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(ADCommandCenter *)self _experimentationAnalyticsManager];
  id v21 = v9;
  id v12 = +[NSArray arrayWithObjects:&v21 count:1];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  void v16[2] = sub_1001E9E08;
  v16[3] = &unk_100505C70;
  id v17 = v8;
  id v18 = v9;
  id v19 = self;
  id v20 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [v11 cacheTrialExperimentsIdentifiersForCodePathID:v15 namespaces:v12 completionHandler:v16];
}

- (void)_saStartLocalRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void))a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    id v11 = "-[ADCommandCenter _saStartLocalRequest:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }
  [(ADCommandCenter *)self _startLocalRequest:v6 withRequestInfo:0 forDelegate:0 suppressCancelationAlertIfCapturingSpeech:0 completion:0];
  if (v7)
  {
    id v9 = objc_alloc_init((Class)SACommandSucceeded);
    v7[2](v7, v9, 0);
  }
}

- (void)_saSetHandoffPayload:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void))a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v15 = "-[ADCommandCenter _saSetHandoffPayload:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v12 = 0;
  id v13 = 0;
  +[ADRemoteRequestHelper getInfoForHandoffPayload:v6 userInfo:&v13 wepageURL:&v12];
  id v9 = v13;
  id v10 = v12;
  [(ADCommandCenterClient *)self->_currentClient adSetUserActivityInfo:v9 webpageURL:v10];
  if (v7)
  {
    id v11 = objc_alloc_init((Class)SACommandSucceeded);
    v7[2](v7, v11, 0);
  }
}

- (void)_saSetClientData:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    id v9 = [v5 holdToTalkThresholdInMilliseconds];
    int v16 = 136315394;
    id v17 = "-[ADCommandCenter _saSetClientData:completion:]";
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s holdToTalkThresholdInMilliseconds: %@", (uint8_t *)&v16, 0x16u);
  }
  id v10 = +[AFPreferences sharedPreferences];
  unsigned int v11 = [v10 ignoreServerManualEndpointingThreshold];

  if (v11)
  {
    id v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315138;
      id v17 = "-[ADCommandCenter _saSetClientData:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s ignoring server configured HTT threshold", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    id v13 = +[AFPreferences sharedPreferences];
    id v14 = [v5 holdToTalkThresholdInMilliseconds];
    id v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(uint64_t)[v14 integerValue] / 1000.0);
    [v13 setManualEndpointingThreshold:v15];
  }
  if (v6) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)_saRollbackSucceeded:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0, 0);
  }
}

- (void)_saCancelSucceeded:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0, 0);
  }
}

- (void)_saAssistantDestroyed:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0, 0);
  }
}

- (void)_handleSendCommands:(id)a3 forRequestDelegate:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, id, void))a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = objc_msgSend(a3, "commands", 0);
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v14);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(ADCommandCenter *)self _startNonSpeechRequest:v15 forDelegate:v8 withInfo:0 options:0 suppressAlert:1 completion:0];
        }
        else {
          [(ADCommandCenter *)self _sendCommandToServer:v15 opportunistically:0];
        }
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  if (v9)
  {
    id v16 = objc_alloc_init((Class)SACommandSucceeded);
    v9[2](v9, v16, 0);
  }
}

- (void)_saSendCommands:(id)a3 completion:(id)a4
{
}

- (void)_saCommandIgnored:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [v8 refId];
  id v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v13 = 136315394;
    id v14 = "-[ADCommandCenter _saCommandIgnored:completion:]";
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s CommandIgnored for refId %@", (uint8_t *)&v13, 0x16u);
  }
  id v11 = [(ADCommandCenter *)self _sessionManager];
  [v11 endRetryableRequestForCommand:v8];

  id v12 = NSStringFromSelector(a2);
  [(ADCommandCenter *)self _removeOutstandingRequestId:v9 forReason:v12];

  [(ADCommandCenter *)self _sync_commandIgnored:v8];
  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)_saCommandFailed:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 refId];
  id v10 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    id v24 = v10;
    id v25 = [v7 reason];
    int v26 = 136315650;
    id v27 = "-[ADCommandCenter _saCommandFailed:completion:]";
    __int16 v28 = 2112;
    id v29 = v9;
    __int16 v30 = 2114;
    __int16 v31 = v25;
    _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s CommandFailed for refId: %@ reason: %{public}@", (uint8_t *)&v26, 0x20u);
  }
  id v11 = [(ADCommandCenter *)self _sessionManager];
  [v11 endRetryableRequestForCommand:v7];

  id v12 = NSStringFromSelector(a2);
  [(ADCommandCenter *)self _removeOutstandingRequestId:v9 forReason:v12];

  if ([(ADCommandCenter *)self _refIdIsSpeechStart:v9]
    || ([(SASFinishSpeech *)self->_finishSpeechCommand aceId],
        int v13 = objc_claimAutoreleasedReturnValue(),
        unsigned int v14 = [v13 isEqualToString:v9],
        v13,
        v14))
  {
    __int16 v15 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v26 = 136315138;
      id v27 = "-[ADCommandCenter _saCommandFailed:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s SpeechCommand failed", (uint8_t *)&v26, 0xCu);
    }
    id v16 = [v7 errorCode];
    if (v16 == (id)SASDictationNotReadyErrorCode)
    {
      long long v17 = objc_msgSend(v7, "ad_error");
      long long v18 = +[AFError errorWithCode:6 description:@"Speech not ready" underlyingError:v17];
    }
    else
    {
      if ([v7 errorCode] == (id)1101 || objc_msgSend(v7, "errorCode") == (id)1107)
      {
        long long v18 = +[AFError errorWithCode:description:](AFError, "errorWithCode:description:", [v7 errorCode], @"Local speech recognition failed");
LABEL_16:
        [(ADCommandCenter *)self _endSpeechRequestForCommand:v7 withError:v18 suppressAlert:0 secureOfflineOnlyDictation:0];
        goto LABEL_17;
      }
      long long v17 = [v7 reason];
      id v23 = objc_msgSend(v7, "ad_error");
      long long v18 = +[AFError errorWithCode:2 description:v17 underlyingError:v23];
    }
    goto LABEL_16;
  }
  long long v19 = [(ADCommandCenterCurrentRequest *)self->_currentRequest currentRequestId];
  unsigned int v20 = [v19 isEqualToString:v9];

  if (!v20) {
    goto LABEL_18;
  }
  id v21 = [v7 reason];
  id v22 = objc_msgSend(v7, "ad_error");
  long long v18 = +[AFError errorWithCode:2 description:v21 underlyingError:v22];

  [(ADCommandCenter *)self _completeRequestForCurrentDelegate:0 error:v18];
  [(ADCommandCenter *)self _setCurrentRequest:0];
  [(ADCommandCenter *)self _requestDidEnd];
LABEL_17:

LABEL_18:
  [(ADCommandCenter *)self _acousticId_commandFailed:v7];
  [(ADCommandCenter *)self _sync_commandFailed:v7];
  if (v8) {
    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
  }
}

- (void)_saRequestCompleted:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v12 = v11;
    int v13 = [(ADCommandCenter *)self _currentRequest];
    unsigned int v14 = [v13 currentRequestId];
    *(_DWORD *)long long buf = 136315906;
    id v25 = "-[ADCommandCenter _saRequestCompleted:executionContext:completion:]";
    __int16 v26 = 2112;
    id v27 = v14;
    __int16 v28 = 2112;
    id v29 = v8;
    __int16 v30 = 2112;
    id v31 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Request completed for id %@: %@ %@", buf, 0x2Au);
  }
  if (objc_msgSend(v8, "ad_hasCallbacks"))
  {
    id v15 = [v8 copy];
    [v15 setCallbacks:0];
    id v16 = objc_alloc_init((Class)SAAddResultObjects);
    long long v17 = [v15 refId];
    [v16 setRefId:v17];
    id v23 = v15;
    long long v18 = +[NSArray arrayWithObjects:&v23 count:1];
    [v16 setObjects:v18];

    long long v19 = [(ADSessionManager *)self->_sessionManager sessionRequestIdForRefId:v17];
    unsigned int v20 = [(ADCommandCenter *)self _resultObjectCache];
    [v20 addResultObjects:v16 sessionRequestId:v19];

    id v21 = objc_alloc_init((Class)SACommandSucceeded);
    id v22 = [v8 refId];
    [(ADCommandCenter *)self _handleNextCallbacksForReply:v21 forCommand:v8 forRequestId:v22 withExecutionContext:v9];

    if (!v10) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  [(ADCommandCenter *)self _handleBareRequestCompleted:v8];
  if (v10) {
LABEL_7:
  }
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
LABEL_8:
}

- (void)_handleBareRequestCompleted:(id)a3
{
  id v5 = a3;
  id v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315394;
    id v21 = "-[ADCommandCenter _handleBareRequestCompleted:]";
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s requestCompleted = %@", (uint8_t *)&v20, 0x16u);
  }
  id v7 = [v5 refId];
  id v8 = [(ADCommandCenter *)self _resultObjectCache];
  [v8 clearResultObjectsForRequestId:v7];

  id v9 = [(ADCommandCenter *)self _sessionManager];
  [v9 endRetryableRequestForCommand:v5];

  id v10 = [(ADCommandCenter *)self _currentRequest];
  id v11 = [v10 currentRequestCommand];
  [(ADCommandCenter *)self _setLastRequest:v11];

  [(ADCommandCenter *)self _setCurrentRequest:0];
  [(ADCommandCenter *)self _requestDidEnd];
  id v12 = NSStringFromSelector(a2);
  [(ADCommandCenter *)self _removeOutstandingRequestId:v7 forReason:v12];

  int v13 = [v5 refId];
  if (![(ADCommandCenter *)self _refIdIsSpeechStart:v13]) {
    goto LABEL_8;
  }
  BOOL speechDelegateHasReceivedSpeechRecognized = self->_speechDelegateHasReceivedSpeechRecognized;

  if (!speechDelegateHasReceivedSpeechRecognized)
  {
    id v15 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315138;
      id v21 = "-[ADCommandCenter _handleBareRequestCompleted:]";
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Failing speech request on request completed since we never got a speech recognized", (uint8_t *)&v20, 0xCu);
    }
    int v13 = +[AFError errorWithCode:22];
    [(ADCommandCenter *)self _endSpeechRequestForCommand:v5 withError:v13 suppressAlert:0 secureOfflineOnlyDictation:0];
LABEL_8:
  }
  id v16 = [v5 refId];
  [(ADCommandCenter *)self _removeFirstChanceServiceForAceId:v16];

  [(ADCommandCenter *)self _completeRequestForCurrentDelegate:1 error:0];
  [(ADCommandCenter *)self _sync_continueIfConditionsMet];
  long long v17 = [(ADCommandCenter *)self _requestDispatcherService];
  long long v18 = [(ADCommandCenter *)self _account];
  long long v19 = [v18 assistantIdentifier];
  [v17 requestCompletedWithAssistantId:v19 requestId:v7];
}

- (BOOL)_isRequestDelaying
{
  id v2 = [(ADCommandCenter *)self _requestDelayManager];
  unsigned __int8 v3 = [v2 isDelaying];

  return v3;
}

- (id)_experimentationAnalyticsManager
{
  return self->_experimentationAnalyticsManager;
}

- (void)adCallStateChangedCallIncoming:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001EB278;
  v4[3] = &unk_10050CD50;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

- (void)adCallStateChangedCallInProcess:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001EB3D0;
  v4[3] = &unk_10050CD50;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

- (void)_scheduleCallKeepAlive
{
  [(ADCommandCenter *)self _cancelCallKeepAlive];
  id v3 = objc_alloc_init((Class)NSUUID);
  objc_storeStrong((id *)&self->_callTransactionUUID, v3);
  id v4 = (OS_os_transaction *)os_transaction_create();
  callTransaction = self->_callTransaction;
  self->_callTransaction = v4;

  dispatch_time_t v6 = dispatch_time(0, 300000000000);
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001EB5B0;
  v9[3] = &unk_10050E160;
  void v9[4] = self;
  id v10 = v3;
  id v8 = v3;
  dispatch_after(v6, queue, v9);
}

- (void)_cancelCallKeepAlive
{
  if (self->_callTransactionUUID)
  {
    callTransaction = self->_callTransaction;
    self->_callTransaction = 0;

    callTransactionUUID = self->_callTransactionUUID;
    self->_callTransactionUUID = 0;

    [(ADCommandCenter *)self _shutdownSessionWhenIdle];
  }
}

- (void)_stopObservingCallStateWithCompletion:(id)a3
{
  id v4 = (uint64_t (**)(id))a3;
  callObserver = self->_callObserver;
  if (callObserver)
  {
    id v7 = v4;
    [(ADCallObserver *)callObserver stopObservingCallStateWithCompletion:v4];
    dispatch_time_t v6 = self->_callObserver;
    self->_callObserver = 0;

    [(ADCommandCenter *)self _setIsInCall:0];
    callObserver = (ADCallObserver *)[(ADCommandCenter *)self _setHasIncomingCall:0];
  }
  else
  {
    if (!v4) {
      goto LABEL_6;
    }
    id v7 = v4;
    callObserver = (ADCallObserver *)v4[2](v4);
  }
  id v4 = v7;
LABEL_6:
  _objc_release_x1(callObserver, v4);
}

- (void)_startObservingCallState
{
  if (!self->_callObserver)
  {
    id v3 = objc_alloc_init(ADCallObserver);
    callObserver = self->_callObserver;
    self->_callObserver = v3;

    BOOL v5 = self->_callObserver;
    [(ADCallObserver *)v5 startObservingCallStateWithDelegate:self];
  }
}

- (void)startObservingCallState
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001EB7D0;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (unint64_t)callState
{
  unint64_t result = (unint64_t)self->_callObserver;
  if (result) {
    return (unint64_t)_[(id)result currentCallState];
  }
  return result;
}

- (void)_setHasIncomingCall:(BOOL)a3
{
  if (self->_hasIncomingCall != a3)
  {
    self->_hasIncomingCall = a3;
    [(ADContextManager *)self->_contextManager setBackgroundContextDirty];
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 postNotificationName:@"ADCallStateDidChangeNotification" object:0];
  }
}

- (BOOL)_hasIncomingCall
{
  return self->_hasIncomingCall;
}

- (void)_setIsInCall:(BOOL)a3
{
  if (self->_isInCall != a3)
  {
    BOOL v3 = a3;
    BOOL v5 = +[AFAnalytics sharedAnalytics];
    dispatch_time_t v6 = v5;
    if (v3) {
      uint64_t v7 = 4901;
    }
    else {
      uint64_t v7 = 4902;
    }
    [v5 logEventWithType:v7 context:0];

    self->_isInCall = v3;
    [(ADSessionManager *)self->_sessionManager updateForCallState:v3];
    [(ADContextManager *)self->_contextManager setBackgroundContextDirty];
    if (self->_isInCall)
    {
      [(ADCommandCenter *)self _scheduleCallKeepAlive];
    }
    else
    {
      [(ADCommandCenter *)self _setCallIsLikely:0];
      dispatch_time_t v8 = dispatch_time(0, 60000000000);
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001EB99C;
      block[3] = &unk_10050E138;
      void block[4] = self;
      dispatch_after(v8, queue, block);
    }
    id v10 = +[NSNotificationCenter defaultCenter];
    [v10 postNotificationName:@"ADCallStateDidChangeNotification" object:0];
  }
}

- (BOOL)_isInCall
{
  return self->_isInCall;
}

- (void)_setCallIsLikely:(BOOL)a3
{
  if (self->_callIsLikely != a3)
  {
    self->_callIsLikely = a3;
    -[ADSessionManager updateForCallIsLikelyDueToRequest:](self->_sessionManager, "updateForCallIsLikelyDueToRequest:");
  }
}

- (BOOL)_callIsLikely
{
  return self->_callIsLikely;
}

- (void)postTestResultSelectedWithRcId:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1001EBA68;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)postTestResultCandidateWithRcId:(id)a3 recognitionSausage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001EBBE4;
  block[3] = &unk_10050DCB8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_signalUSTTestRequestWithStartRequest:(id)a3 requestInfo:(id)a4
{
  id v6 = a3;
  id v7 = [a4 speechRequestOptions];
  BOOL v8 = [v7 activationEvent] == (id)17;

  id v9 = [(ADCommandCenter *)self _fetchComputedModeAndUpdateRequestDelegate];
  id v10 = objc_alloc((Class)SMTRequestContextData);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1001EBE88;
  v22[3] = &unk_100505C48;
  id v23 = v9;
  id v24 = v6;
  id v25 = self;
  BOOL v26 = v8;
  id v11 = v6;
  id v21 = v9;
  id v12 = [v10 initWithBuilder:v22];
  id v13 = [(ADCommandCenter *)self _requestDispatcherService];
  unsigned int v14 = [(ADCommandCenter *)self _account];
  id v15 = [v14 assistantIdentifier];
  id v16 = [v11 aceId];
  long long v17 = [v11 origin];
  long long v18 = [(ADCommandCenter *)self _locationManager];
  long long v19 = [v18 knownLocation];
  [v13 startTestSpeechRequestWithAssistantId:v15 requestId:v16 enableASR:0 inputOrigin:v17 location:v19 jitContext:0 overrideModelPath:0 requestContextData:v12];

  int v20 = [v11 aceId];
  [(ADCommandCenter *)self _emitDeviceDynamicContextForRequest:v20];
}

- (void)_sendServiceCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001EC0E4;
  block[3] = &unk_10050E1D8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_handleServiceCommand:(id)a3 afterMyriadDecision:(BOOL)a4 executionContext:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!self->_disableServiceCommandExecution)
  {
    BOOL v48 = v8;
    id v14 = [v10 encodedClassName];
    id v15 = [v10 groupIdentifier];
    id v16 = [(ADCommandCenter *)self _serviceManager];
    long long v17 = [v16 serviceForDomain:v15 command:v14];
    long long v18 = [(ADCommandCenter *)self _firstChanceServiceForCommand:v10];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v18 != v17)
    {
      long long v19 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315650;
        id v59 = "-[ADCommandCenter _handleServiceCommand:afterMyriadDecision:executionContext:completion:]";
        __int16 v60 = 2112;
        *(void *)id v61 = v18;
        *(_WORD *)&v61[8] = 2112;
        *(void *)&v61[10] = v17;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s Using first chance service %@ instead of originally found service %@", buf, 0x20u);
      }
      id v20 = v18;

      long long v17 = v20;
    }
    id v21 = AFSiriLogContextDaemon;
    BOOL v22 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (v17)
    {
      __int16 v43 = v18;
      __int16 v44 = v16;
      if (v22)
      {
        id v23 = v21;
        id v24 = (objc_class *)objc_opt_class();
        id v25 = NSStringFromClass(v24);
        BOOL v26 = [v17 identifier];
        *(_DWORD *)long long buf = 136315650;
        id v59 = "-[ADCommandCenter _handleServiceCommand:afterMyriadDecision:executionContext:completion:]";
        __int16 v60 = 2112;
        *(void *)id v61 = v25;
        *(_WORD *)&v61[8] = 2112;
        *(void *)&v61[10] = v26;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s Dispatching command %@ to service %@", buf, 0x20u);
      }
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_1001ECA48;
      v51[3] = &unk_100507D58;
      void v51[4] = self;
      id v27 = v10;
      id v52 = v27;
      id v47 = v11;
      id v53 = v11;
      id v57 = v12;
      long long v46 = v14;
      id v54 = v14;
      id v28 = v17;
      id v55 = v28;
      BOOL v45 = v15;
      id v29 = v15;
      id v56 = v29;
      CFStringRef v42 = objc_retainBlock(v51);
      __int16 v30 = (objc_class *)objc_opt_class();
      id v31 = NSStringFromClass(v30);
      id v32 = [v27 aceId];
      id v33 = [(ADCommandCenterCurrentRequest *)self->_currentRequest currentRequestId];
      id v34 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"(Service: %@, Domain %@, Command: %@(%@), RequestId: %@"), v28, v29, v31, v32, v33;

      long long v35 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315650;
        id v59 = "-[ADCommandCenter _handleServiceCommand:afterMyriadDecision:executionContext:completion:]";
        __int16 v60 = 1024;
        *(_DWORD *)id v61 = v48;
        *(_WORD *)&v61[4] = 2112;
        *(void *)&v61[6] = v34;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%s Wait for Myriad decision: %d  with reason: %@", buf, 0x1Cu);
      }
      long long v18 = v43;
      id v16 = v44;
      if (v48)
      {
        int v36 = AFSupportsSCDAFramework();
        long long v37 = (id *)SCDAMonitor_ptr;
        if (!v36) {
          long long v37 = (id *)AFMyriadMonitor_ptr;
        }
        long long v38 = [*v37 sharedMonitor];
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_1001ECEC4;
        v49[3] = &unk_10050C890;
        v49[4] = self;
        id v39 = v42;
        id v50 = v42;
        [v38 waitForMyriadDecisionForReason:v34 withCompletion:v49];
      }
      else
      {
        id v39 = v42;
        ((void (*)(void *))v42[2])(v42);
      }
      id v14 = v46;
      id v11 = v47;

      id v15 = v45;
    }
    else
    {
      if (v22)
      {
        *(_DWORD *)long long buf = 136315650;
        id v59 = "-[ADCommandCenter _handleServiceCommand:afterMyriadDecision:executionContext:completion:]";
        __int16 v60 = 2112;
        *(void *)id v61 = v15;
        *(_WORD *)&v61[8] = 2112;
        *(void *)&v61[10] = v14;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s Couldn't find service for %@ %@", buf, 0x20u);
      }
      if (v12)
      {
        +[AFError errorWithCode:100];
        v41 = id v40 = v15;
        (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v41);

        id v15 = v40;
      }
    }

    goto LABEL_27;
  }
  id v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v59 = "-[ADCommandCenter _handleServiceCommand:afterMyriadDecision:executionContext:completion:]";
    __int16 v60 = 2112;
    *(void *)id v61 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Command %@ will not be executed because service command execution is disabled.", buf, 0x16u);
  }
  if (v12)
  {
    id v14 = +[AFError errorWithCode:46];
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v14);
LABEL_27:
  }
}

- (void)_handleServiceCommand:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(ADCommandCenter *)self _handleServiceCommand:v10 afterMyriadDecision:sub_100180A4C(v10) executionContext:v9 completion:v8];
}

- (void)_performCallbacksForCommand:(id)a3 reply:(id)a4 executionContext:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (objc_msgSend(v10, "ad_hasCallbacks"))
  {
    unsigned int v13 = objc_msgSend(v10, "ad_shouldIgnoreCallbacksOnReply");
    id v14 = AFSiriLogContextDaemon;
    BOOL v15 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v15)
      {
        int v18 = 136315138;
        long long v19 = "-[ADCommandCenter _performCallbacksForCommand:reply:executionContext:error:]";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Ignoring callbacks in reply", (uint8_t *)&v18, 0xCu);
      }
    }
    else
    {
      if (v15)
      {
        int v18 = 136315138;
        long long v19 = "-[ADCommandCenter _performCallbacksForCommand:reply:executionContext:error:]";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s We're in a callback context, asking callback manager for next commands", (uint8_t *)&v18, 0xCu);
      }
      if (a6) {
        id v16 = 0;
      }
      else {
        id v16 = v11;
      }
      long long v17 = [v10 refId];
      [(ADCommandCenter *)self _handleNextCallbacksForReply:v16 forCommand:v10 forRequestId:v17 withExecutionContext:v12];
    }
  }
}

- (void)_preheatCallbacksForCommand:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "ad_hasCallbacks"))
  {
    BOOL v5 = [v4 refId];
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      BOOL v15 = "-[ADCommandCenter _preheatCallbacksForCommand:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Searching callbacks for phone call command", (uint8_t *)&v14, 0xCu);
    }
    if ([(ADCommandCenter *)self _callIsLikely])
    {
      id v7 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v14 = 136315138;
        BOOL v15 = "-[ADCommandCenter _preheatCallbacksForCommand:]";
        id v8 = "%s Call is already likely not checking again";
        id v9 = v7;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v14, 0xCu);
      }
    }
    else
    {
      id v10 = [(ADCommandCenter *)self _resultObjectCache];
      unsigned int v11 = [v10 callIsPossibleForRequestId:v5];

      id v12 = AFSiriLogContextDaemon;
      BOOL v13 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
      if (v11)
      {
        if (v13)
        {
          int v14 = 136315138;
          BOOL v15 = "-[ADCommandCenter _preheatCallbacksForCommand:]";
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Found phone call command", (uint8_t *)&v14, 0xCu);
        }
        [(ADCommandCenter *)self _setCallIsLikely:1];
        goto LABEL_14;
      }
      if (v13)
      {
        int v14 = 136315138;
        BOOL v15 = "-[ADCommandCenter _preheatCallbacksForCommand:]";
        id v8 = "%s No phone call command found";
        id v9 = v12;
        goto LABEL_13;
      }
    }
LABEL_14:
  }
}

- (void)_handleCommandResponse:(id)a3 error:(id)a4 forCommand:(id)a5 executionContext:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  long long v17 = v16;
  if (v16) {
    (*((void (**)(id, id, id))v16 + 2))(v16, v12, v13);
  }
  id v34 = v13;
  int v18 = [v14 aceId];
  long long v19 = [v14 refId];
  id v20 = [v15 info];
  id v21 = [v20 requestID];

  if (v19
    && ([(ADCommandCenter *)self _hasOutstandingRequestId:v19]
     || [(ADCommandCenter *)self _hasRootExecutionContextForRequestID:v19])
    || v21
    && ([(ADCommandCenter *)self _hasOutstandingRequestId:v21]
     || [(ADCommandCenter *)self _hasRootExecutionContextForRequestID:v21]))
  {
    [(ADCommandCenter *)self _addHandledCommandId:v18 forRequestId:v19];
    [(ADCommandCenter *)self _dispatchAndRemovePostCommandHandlingBlocksForCommandId:v18 requestId:v19];
  }
  BOOL v22 = [v15 originPeerInfo];
  unsigned int v23 = objc_msgSend(v12, "ad_shouldBeHandledByClientAsResponseToCommand:fromPeer:", v14, v22);

  if (v23)
  {
    id v24 = [v14 encodedClassName];
    uint64_t v25 = [v14 groupIdentifier];
    id v32 = [(ADCommandCenter *)self _serviceManager];
    id v33 = (void *)v25;
    BOOL v26 = [v32 serviceForDomain:v25 command:v24];
    if (v26)
    {
      id v31 = v24;
      id v27 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        id v28 = v27;
        __int16 v30 = [v26 identifier];
        *(_DWORD *)long long buf = 136315394;
        __int16 v41 = "-[ADCommandCenter _handleCommandResponse:error:forCommand:executionContext:completion:]";
        __int16 v42 = 2112;
        __int16 v43 = v30;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%s Dispatching response to service %@", buf, 0x16u);
      }
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_1001EDC50;
      v35[3] = &unk_100507F88;
      void v35[4] = self;
      id v36 = v14;
      id v37 = v12;
      id v38 = v15;
      id v39 = v34;
      [v26 handleResponse:v37 toCommand:v36 completion:v35];

      id v24 = v31;
    }
    else
    {
      [(ADCommandCenter *)self _performCallbacksForCommand:v14 reply:v12 executionContext:v15 error:v34];
    }

    id v29 = v34;
  }
  else
  {
    id v29 = v34;
    [(ADCommandCenter *)self _performCallbacksForCommand:v14 reply:v12 executionContext:v15 error:v34];
  }
}

- (void)_handleCommand:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    long long v46 = "-[ADCommandCenter _handleCommand:executionContext:completion:]";
    __int16 v47 = 2112;
    id v48 = v8;
    __int16 v49 = 2112;
    id v50 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s %@ (executionContext = %@)", buf, 0x20u);
  }
  if (AFIsInternalInstall())
  {
    id v12 = AFSiriLogContextDaemon;
    os_signpost_id_t v13 = os_signpost_id_generate(AFSiriLogContextDaemon);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        id v15 = (char *)objc_opt_class();
        *(_DWORD *)long long buf = 138412290;
        long long v46 = v15;
        id v16 = v15;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, v14, "HandleCommand", "type=%@", buf, 0xCu);
      }
    }
  }
  long long v17 = [v8 refId];
  if ([(ADCommandCenter *)self _shouldIgnoreCommand:v8 executionContext:v9])
  {
    [(ADCommandCenter *)self _handleIgnoredCommand:v8 executionContext:v9 completion:v10];
  }
  else
  {
    [(ADCommandCenter *)self _preheatCallbacksForCommand:v8];
    unsigned __int8 v18 = [v9 isFromRemote];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1001EE1B0;
    v41[3] = &unk_100505BF8;
    uint8_t v41[4] = self;
    id v19 = v8;
    id v42 = v19;
    id v20 = v9;
    id v43 = v20;
    id v21 = v10;
    id v44 = v21;
    BOOL v22 = objc_retainBlock(v41);
    if ([(ADCommandCenter *)self _isClientBoundCommand:v19])
    {
      id v32 = v22;
      [(ADCommandCenter *)self _notifyUSTForAceCommand:v19];
      id v23 = v19;
      id v24 = self->_requestDelegate;
      id v31 = v10;
      if (v18) {
        uint64_t v25 = 0;
      }
      else {
        uint64_t v25 = sub_100180A4C(v23);
      }
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_1001EE1C8;
      v35[3] = &unk_100505F38;
      id v36 = v17;
      id v37 = self;
      id v38 = v24;
      id v39 = v23;
      id v40 = v32;
      id v28 = v23;
      id v29 = v24;
      [(ADCommandCenter *)self _handleServiceCommand:v28 afterMyriadDecision:v25 executionContext:v20 completion:v35];

      BOOL v22 = v32;
    }
    else if ([(ADCommandCenter *)self _isServerBoundCommand:v19])
    {
      id v26 = v19;
      unsigned int v27 = objc_msgSend(v26, "ad_willHaveReply");
      if (v21 && v27)
      {
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_1001EE2A4;
        v33[3] = &unk_10050CF00;
        id v34 = v22;
        [(ADCommandCenter *)self _sendCommandToServer:v26 opportunistically:0 completion:v33];
      }
      else
      {
        [(ADCommandCenter *)self _sendCommandToServer:v26 opportunistically:0];
        ((void (*)(void *, void, void))v22[2])(v22, 0, 0);
      }
      id v30 = objc_msgSend(v26, "ad_getNetworkActivityTracingLabel");

      [(ADCommandCenter *)self _addNetworkActivityTracingForLabel:v30 start:1 withCompletionReason:0 andError:0];
    }
    -[ADCommandCenter _invokeCompletionForCommand:](self, "_invokeCompletionForCommand:", v19, v31);
  }
}

- (void)_handleIgnoredCommand:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id, void))a5;
  unsigned int v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v14 = 136315650;
    id v15 = "-[ADCommandCenter _handleIgnoredCommand:executionContext:completion:]";
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s %@ (executionContext = %@)", (uint8_t *)&v14, 0x20u);
    if (!v10) {
      goto LABEL_8;
    }
  }
  else if (!v10)
  {
    goto LABEL_8;
  }
  if ([(ADCommandCenter *)self _isClientBoundCommand:v8]
    && !objc_msgSend(v8, "ad_requiresResponse"))
  {
    id v12 = 0;
  }
  else
  {
    id v12 = objc_alloc_init((Class)SACommandIgnored);
    os_signpost_id_t v13 = [v8 aceId];
    [v12 setRefId:v13];
  }
  v10[2](v10, v12, 0);

LABEL_8:
  [(ADCommandCenter *)self _invokeCompletionForCommand:v8];
}

- (BOOL)_shouldIgnoreCommand:(id)a3 executionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 refId];
  id v9 = [v7 info];
  id v10 = [v9 requestHandlingContextSnapshot];
  uint64_t v11 = [v10 inputDeviceID];

  id v12 = [v7 info];
  os_signpost_id_t v13 = [v12 requestHandlingContextSnapshot];
  uint64_t v14 = [v13 inputAssistantID];

  if (v14 | v11)
  {
    id v15 = +[ADDeviceCircleManager sharedInstance];
    __int16 v16 = [v15 localPeerInfo];

    id v17 = [v16 assistantIdentifier];
    if ([(id)v14 isEqualToString:v17])
    {
      __int16 v18 = [v16 idsDeviceUniqueIdentifier];
      unsigned int v19 = [(id)v11 isEqualToString:v18];

      if (v19)
      {

        goto LABEL_10;
      }
    }
    else
    {
    }
    unsigned __int8 v22 = [v7 isFromRemote];

    if ((v22 & 1) == 0)
    {
LABEL_10:
      id v23 = [v7 info];
      uint64_t v24 = [v23 requestID];

      if (!(v8 | v24))
      {
        uint64_t v25 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)id v33 = 136315650;
          *(void *)&void v33[4] = "-[ADCommandCenter _shouldIgnoreCommand:executionContext:]";
          *(_WORD *)&v33[12] = 2112;
          *(void *)&v33[14] = v6;
          *(_WORD *)&v33[22] = 2112;
          id v34 = v7;
          _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%s Handling %@ because both ref id and request id are nil. (executionContext = %@)", v33, 0x20u);
        }
        goto LABEL_31;
      }
      if (v8)
      {
        if (![(ADCommandCenter *)self _hasOutstandingRequestId:v8]
          && ![(ADCommandCenter *)self _sync_hasCommandForRefId:v8]
          && ![(ADCommandCenter *)self _acousticId_hasCommandForRefId:v8]
          && ![(ADCommandCenter *)self _hasRootExecutionContextForRequestID:v8]&& ![(ADCommandCenter *)self _syncController_hasCommandForRefId:v8])
        {
          id v26 = AFSiriLogContextDaemon;
          if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_28;
          }
          *(_DWORD *)id v33 = 136315394;
          *(void *)&void v33[4] = "-[ADCommandCenter _shouldIgnoreCommand:executionContext:]";
          *(_WORD *)&v33[12] = 2112;
          *(void *)&v33[14] = v6;
          unsigned int v27 = "%s Command %@ does not belong to an outstanding request or sync session or acoustic fingerprinting sessi"
                "on, and an associated local execution context can not be found.";
          goto LABEL_40;
        }
      }
      else if (![(ADCommandCenter *)self _isRelevantCancellationCommand:v6])
      {
        id v26 = AFSiriLogContextDaemon;
        if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_28;
        }
        *(_DWORD *)id v33 = 136315394;
        *(void *)&void v33[4] = "-[ADCommandCenter _shouldIgnoreCommand:executionContext:]";
        *(_WORD *)&v33[12] = 2112;
        *(void *)&v33[14] = v6;
        unsigned int v27 = "%s Command %@ does not have ref id and is not relevant cancellation command.";
LABEL_40:
        _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, v27, v33, 0x16u);
LABEL_28:
        char v28 = 0;
        if (!v24) {
          goto LABEL_29;
        }
        goto LABEL_23;
      }
      char v28 = 1;
      if (!v24)
      {
LABEL_29:
        id v29 = AFSiriLogContextDaemon;
        if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_30;
        }
        *(_DWORD *)id v33 = 136315394;
        *(void *)&void v33[4] = "-[ADCommandCenter _shouldIgnoreCommand:executionContext:]";
        *(_WORD *)&v33[12] = 2112;
        *(void *)&v33[14] = v7;
        id v30 = "%s Execution context %@ does not have request id.";
        goto LABEL_35;
      }
LABEL_23:
      if (-[ADCommandCenter _hasOutstandingRequestId:](self, "_hasOutstandingRequestId:", v24, *(_OWORD *)v33, *(void *)&v33[16])|| [(ADCommandCenter *)self _hasRootExecutionContextForRequestID:v24])
      {
        goto LABEL_31;
      }
      id v29 = AFSiriLogContextDaemon;
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
LABEL_30:
        if (v28)
        {
LABEL_31:
          BOOL v21 = 0;
LABEL_32:

          goto LABEL_33;
        }
LABEL_36:
        id v32 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)id v33 = 136315650;
          *(void *)&void v33[4] = "-[ADCommandCenter _shouldIgnoreCommand:executionContext:]";
          *(_WORD *)&v33[12] = 2112;
          *(void *)&v33[14] = v6;
          *(_WORD *)&v33[22] = 2112;
          id v34 = v7;
          _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "%s Ignoring %@ because it is not in scope. (executionContext = %@)", v33, 0x20u);
        }
        BOOL v21 = 1;
        goto LABEL_32;
      }
      *(_DWORD *)id v33 = 136315394;
      *(void *)&void v33[4] = "-[ADCommandCenter _shouldIgnoreCommand:executionContext:]";
      *(_WORD *)&v33[12] = 2112;
      *(void *)&v33[14] = v24;
      id v30 = "%s Execution context %@ does not belong to an outstanding request, and an associated local execution context"
            " can not be found";
LABEL_35:
      _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, v30, v33, 0x16u);
      if (v28) {
        goto LABEL_31;
      }
      goto LABEL_36;
    }
  }
  else if (![v7 isFromRemote])
  {
    goto LABEL_10;
  }
  id v20 = AFSiriLogContextDaemon;
  BOOL v21 = 0;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v33 = 136315650;
    *(void *)&void v33[4] = "-[ADCommandCenter _shouldIgnoreCommand:executionContext:]";
    *(_WORD *)&v33[12] = 2112;
    *(void *)&v33[14] = v6;
    *(_WORD *)&v33[22] = 2112;
    id v34 = v7;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s Handling %@ for a request initiated on another device. (executionContext = %@)", v33, 0x20u);
    BOOL v21 = 0;
  }
LABEL_33:

  return v21;
}

- (void)_addNetworkActivityTracingForLabel:(int64_t)a3 start:(BOOL)a4 withCompletionReason:(int64_t)a5 andError:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  if (a3)
  {
    id v13 = v9;
    id v10 = +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing];
    uint64_t v11 = v10;
    if (v7)
    {
      [v10 networkActivityStart:a3 activate:1];

      id v12 = +[SNNetworkActivityTracing sharedInstance];
      [v12 networkActivityStart:a3 activate:1 completion:0];
    }
    else
    {
      [v10 networkActivityStop:a3 withReason:a5 andError:v13];

      id v12 = +[SNNetworkActivityTracing sharedInstance];
      [v12 networkActivityStop:a3 withReason:a5 andError:v13 completion:0];
    }

    id v9 = v13;
  }
}

- (void)_adviseSessionArbiterToContinueWithPreviousWinner:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ADCommandCenter *)self _sessionManager];
  [v4 adviseSessionArbiterToContinueWithPreviousWinner:v3];
}

- (void)_sendRestrictionsInPreparationForRequest
{
  if (!self->_restrictionsWereSetForRequest)
  {
    id v3 = objc_alloc_init((Class)SASetRestrictions);
    id v4 = [(ADCommandCenter *)self _restrictedCommands];
    [v3 setRestrictions:v4];

    [(ADCommandCenter *)self _sendCommandToServer:v3];
    BOOL v5 = [(ADCommandCenter *)self _headphonesAnnouncementRequestCapabilityManager];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001EEBA0;
    v6[3] = &unk_10050C458;
    v6[4] = self;
    [v5 fetchAvailableAnnouncementRequestTypesWithCompletion:v6];

    self->_restrictionsWereSetForRequest = 1;
  }
}

- (id)_restrictedCommands
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  if (AFDeviceSupportsBobble()) {
    self->_BOOL isHeadGestureRecognitionAvailable = -[ADRequestDispatcherServiceHelper isBobbleAvailable]_0();
  }
  id v4 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    BOOL deviceIsLocked = self->_deviceIsLocked;
    id v6 = v4;
    int v7 = AFHasUnlockedSinceBoot();
    BOOL v8 = sub_1001FB914();
    BOOL deviceIsShowingLockScreen = self->_deviceIsShowingLockScreen;
    BOOL v10 = sub_1001FB964();
    BOOL isInStarkMode = self->_isInStarkMode;
    BOOL isInCarDNDMode = self->_isInCarDNDMode;
    BOOL isWatchAuthenticated = self->_isWatchAuthenticated;
    BOOL isHeadphonesAuthenticated = self->_isHeadphonesAuthenticated;
    BOOL isHeadGestureRecognitionAvailable = self->_isHeadGestureRecognitionAvailable;
    *(_DWORD *)long long buf = 136317698;
    id v30 = "-[ADCommandCenter _restrictedCommands]";
    __int16 v31 = 1024;
    BOOL v32 = deviceIsLocked;
    __int16 v33 = 1024;
    int v34 = v7;
    __int16 v35 = 1024;
    BOOL v36 = v8;
    __int16 v37 = 1024;
    BOOL v38 = deviceIsShowingLockScreen;
    __int16 v39 = 1024;
    BOOL v40 = v10;
    __int16 v41 = 1024;
    BOOL v42 = isInStarkMode;
    __int16 v43 = 1024;
    BOOL v44 = isInCarDNDMode;
    __int16 v45 = 1024;
    BOOL v46 = isWatchAuthenticated;
    __int16 v47 = 1024;
    BOOL v48 = isHeadphonesAuthenticated;
    __int16 v49 = 1024;
    BOOL v50 = isHeadGestureRecognitionAvailable;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s _deviceIsLocked=%d AFHasUnlockedSinceBoot=%d ADVoiceDialingDisabledWhileLocked=%d _deviceIsShowingLockScreen=%d ADControlCenterDisabledWhileLocked=%d _isInStarkMode=%d _isInCarDNDMode=%d _isWatchAuthenticated=%d _isheadphonesAuthenticated=%d _isHeadGestureRecognitionAvailable=%d", buf, 0x48u);
  }
  if (!self->_deviceIsShowingLockScreen)
  {
    __int16 v16 = +[NSString stringWithFormat:@"%@#%@", SANotificationGroupIdentifier, SANotificationObjectClassIdentifier];
    [v3 addObject:v16];
  }
  if (self->_deviceIsLocked)
  {
    if (sub_1001FB964())
    {
      id v17 = [(ADCommandCenter *)self _serviceManager];
      __int16 v18 = [v17 controlCenterLockRestrictedCommands];
      [v3 addObjectsFromArray:v18];
    }
    if ((AFHasUnlockedSinceBoot() & 1) == 0)
    {
      unsigned int v19 = [(ADCommandCenter *)self _serviceManager];
      id v20 = [v19 firstUnlockRestrictedCommands];
      [v3 addObjectsFromArray:v20];
    }
    if (sub_1001FB914())
    {
      BOOL v21 = +[NSString stringWithFormat:@"%@#%@", SAPhoneGroupIdentifier, SAPhoneCallClassIdentifier];
      [v3 addObject:v21];
    }
    if (!self->_isHeadphonesAuthenticated) {
      [v3 addObject:SADeviceRestrictionUNAUTHENTICATED_BY_HEADPHONES_STATEValue];
    }
    if (!self->_isWatchAuthenticated) {
      [v3 addObject:SADeviceRestrictionUNAUTHENTICATED_BY_WATCH_PROXIMITYValue];
    }
    unsigned __int8 v22 = [(ADCommandCenter *)self _serviceManager];
    id v23 = [v22 lockRestrictedCommands];

    if (v23) {
      [v3 addObjectsFromArray:v23];
    }
  }
  if (self->_isInStarkMode)
  {
    [v3 addObject:SADeviceRestrictionSTARKValue];
    if (self->_supportsCarPlayVehicleData) {
      [v3 addObject:SADeviceRestrictionCAR_SUPPORTS_VEHICLE_DATAValue];
    }
    uint64_t v24 = +[NSString stringWithFormat:@"%@#%@", SASmsGroupIdentifier, SAUISayItClassIdentifier];
    [v3 removeObject:v24];

    uint64_t v25 = +[NSString stringWithFormat:@"%@#%@", SAPhoneGroupIdentifier, SAPhoneCallClassIdentifier];
    [v3 removeObject:v25];

    id v26 = +[NSString stringWithFormat:@"%@#%@", SAAppsGroupIdentifier, SAAppsLaunchAppClassIdentifier];
    [v3 removeObject:v26];
  }
  else if (self->_isInCarDNDMode)
  {
    [v3 addObject:SADeviceRestrictionCAR_DNDValue];
  }
  if (self->_isHeadGestureRecognitionAvailable) {
    [v3 addObject:SADeviceRestrictionHEAD_GESTURE_RECOGNITIONValue];
  }
  unsigned int v27 = [v3 allObjects];

  return v27;
}

- (void)setSyncVerificationNeededAndFullReportNeeded:(BOOL)a3 shouldPostNotification:(BOOL)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001EF1B0;
  v5[3] = &unk_100505AD0;
  void v5[4] = self;
  BOOL v6 = a3;
  BOOL v7 = a4;
  dispatch_async(queue, v5);
}

- (void)_shutdownAfterDelay:(double)a3
{
  if ([(ADCommandCenter *)self _hasActiveClientOrSyncingOrInCall])
  {
    BOOL v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      unsigned int v19 = "-[ADCommandCenter _shutdownAfterDelay:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Still active. Ignoring session shutdown request", buf, 0xCu);
    }
  }
  else if (a3 <= 0.0)
  {
    uint64_t v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      unsigned int v19 = "-[ADCommandCenter _shutdownAfterDelay:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Shutting down session now...", buf, 0xCu);
    }
    [(ADCommandCenter *)self _removeAllSpeechCapturingContexts];
    [(ADCommandCenter *)self _removeAllHandledCommandIds];
    [(ADCommandCenter *)self _removeAllPostCommandHandlingBlocks];
    id v12 = +[AFError errorWithCode:4];
    [(ADCommandCenter *)self _invokeAllCompletionsWithError:v12];

    id v13 = [(ADCommandCenter *)self _sessionManager];
    [v13 cancel];

    [(ADCommandCenter *)self _awdSessionEnd];
    uint64_t v14 = +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing];
    [v14 networkActivityTracingCancel];

    id v15 = +[SNNetworkActivityTracing sharedInstance];
    [v15 networkActivityTracingCancel:0];
  }
  else
  {
    dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a3 / 3.0 * 1000000000.0));
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001EF4C8;
    block[3] = &unk_10050D8C0;
    *(double *)&void block[5] = a3;
    void block[4] = self;
    dispatch_after(v6, queue, block);
    BOOL v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      unsigned int v19 = "-[ADCommandCenter _shutdownAfterDelay:]";
      __int16 v20 = 2048;
      double v21 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Delaying shutdown block for %f seconds...", buf, 0x16u);
    }
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    BOOL v10 = self->_queue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    void v16[2] = sub_1001EF5BC;
    v16[3] = &unk_10050E138;
    void v16[4] = self;
    dispatch_after(v9, v10, v16);
  }
}

- (void)_shutdownSessionWhenIdle
{
  id v3 = _AFPreferencesSessionShutdownDelayOverride();
  id v5 = v3;
  if (v3) {
    [v3 doubleValue];
  }
  else {
    double v4 = 60.0;
  }
  [(ADCommandCenter *)self _shutdownAfterDelay:v4];
}

- (BOOL)_hasActiveClientOrSyncingOrInCall
{
  return self->_currentClient
      || self->_requestDelegate
      || self->_speechDelegate
      || self->_speechFileDelegate
      || [(ADCommandCenter *)self _sync_isSyncing]
      || [(ADCommandCenter *)self _isInCall]
      || [(NSMutableSet *)self->_shutdownAssertions count] != 0;
}

- (BOOL)_isRelevantCancellationCommand:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 requestId];
    if ([(ADCommandCenter *)self _hasOutstandingRequestId:v5]) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = [(NSString *)self->_associatedRequestId isEqualToString:v5];
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_cancelCrossDeviceRequestOperationsForRemoteRequest
{
  id v3 = [(ADCommandExecutionContext *)self->_mostRecentVisibleRemoteExecutionContext creationDate];
  id v4 = [(ADCommandExecutionContext *)self->_mostRecentRootExecutionContext creationDate];
  id v5 = v4;
  if (self->_mostRecentVisibleRemoteExecutionContext && (!v4 || [v4 compare:v3] == (id)-1))
  {
    BOOL v6 = +[NSDate now];
    [v6 timeIntervalSinceDate:v3];
    double v8 = v7;

    if (v8 < 300.0)
    {
      dispatch_time_t v9 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 136315138;
        uint64_t v25 = "-[ADCommandCenter _cancelCrossDeviceRequestOperationsForRemoteRequest]";
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
      }
      BOOL v10 = [(ADCommandExecutionContext *)self->_mostRecentVisibleRemoteExecutionContext info];
      uint64_t v11 = [v10 originPeerInfo];
      id v12 = [v10 requestID];
      id v13 = objc_alloc_init((Class)SACancelCrossDeviceRequest);
      uint64_t v14 = +[NSUUID UUID];
      id v15 = [v14 UUIDString];
      [v13 setAceId:v15];

      [v13 setRequestId:v12];
      [v13 setCancelAssociatedRequests:1];
      __int16 v16 = [[ADPeerInfo alloc] initWithAFPeerInfo:v11];
      mostRecentVisibleRemoteExecutionContext = self->_mostRecentVisibleRemoteExecutionContext;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1001EFA7C;
      v21[3] = &unk_100505BB0;
      id v22 = v12;
      id v23 = v11;
      id v18 = v11;
      id v19 = v12;
      [(ADCommandCenter *)self _remoteExecute_remoteDeviceExecuteCommand:v13 onPeer:v16 allowsRelay:0 throughProxyDevice:0 executionContext:mostRecentVisibleRemoteExecutionContext completion:v21];

      __int16 v20 = self->_mostRecentVisibleRemoteExecutionContext;
      self->_mostRecentVisibleRemoteExecutionContext = 0;
    }
  }
}

- (void)_cancelCrossDeviceRequestOperationsForLocalRequestWithId:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001EFD28;
  v8[3] = &unk_100509F60;
  void v8[4] = self;
  id v4 = a3;
  id v5 = objc_retainBlock(v8);
  ((void (*)(void *, id))v5[2])(v5, v4);

  associatedRequestId = self->_associatedRequestId;
  if (associatedRequestId)
  {
    double v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315138;
      BOOL v10 = "-[ADCommandCenter _cancelCrossDeviceRequestOperationsForLocalRequestWithId:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s Cancelling associated request...", buf, 0xCu);
      associatedRequestId = self->_associatedRequestId;
    }
    ((void (*)(void *, NSString *))v5[2])(v5, associatedRequestId);
  }
}

- (void)_cancelCurrentRequestForReason:(int64_t)a3 andError:(id)a4 successorInfo:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(ADCommandCenter *)self _currentRequest];
  id v12 = [v11 currentRequestId];

  if (v12)
  {
    id v13 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v36 = 136315650;
      __int16 v37 = "-[ADCommandCenter _cancelCurrentRequestForReason:andError:successorInfo:]";
      __int16 v38 = 2048;
      int64_t v39 = a3;
      __int16 v40 = 2112;
      id v41 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Canceling current request with reason: %ld and error: %@", (uint8_t *)&v36, 0x20u);
    }
    if (self->_requestEffectiveStartTime != 0.0)
    {
      uint64_t v14 = +[NSProcessInfo processInfo];
      [v14 systemUptime];
      double v16 = v15 - self->_requestEffectiveStartTime;

      id v17 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v36 = 136315394;
        __int16 v37 = "-[ADCommandCenter _cancelCurrentRequestForReason:andError:successorInfo:]";
        __int16 v38 = 1024;
        LODWORD(v39) = (int)v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Logging Cancel for %d seconds", (uint8_t *)&v36, 0x12u);
      }
      +[AFAggregator logRequestCancelAfterSeconds:v16];
      self->_requestEffectiveStartTime = 0.0;
    }
    id v18 = [(ADCommandCenterCurrentRequest *)self->_currentRequest currentRequestCommand];

    if (v18)
    {
      id v19 = objc_alloc_init((Class)SACancelRequest);
      [v19 setRefId:v12];
      [v19 setClientCancellationCode:a3];
      [(ADCommandCenter *)self _sendRequestToServer:v19];
    }
    __int16 v20 = +[ADRequestLifecycleObserver sharedObserver];
    [v20 requestWasCancelledWithInfo:self->_currentRequestInfo forReason:a3 origin:5 client:self->_currentClient successorInfo:v10];

    double v21 = [(ADCommandCenter *)self _resultObjectCache];
    [v21 clearResultObjectsForRequestId:v12];

    [(ADCommandCenter *)self _requestDidEnd];
    id v22 = NSStringFromSelector(a2);
    [(ADCommandCenter *)self _removeOutstandingRequestId:v12 forReason:v22];

    id v23 = [(ADCommandCenterCurrentRequest *)self->_currentRequest currentRequestCommand];
    uint64_t v24 = objc_msgSend(v23, "ad_parentRequest");
    uint64_t v25 = [v24 aceId];
    id v26 = NSStringFromSelector(a2);
    [(ADCommandCenter *)self _removeOutstandingRequestId:v25 forReason:v26];

    unsigned int v27 = [(ADCommandCenter *)self _serviceManager];
    char v28 = [(ADCommandCenter *)self _account];
    id v29 = [v28 assistantIdentifier];
    [v27 cancelOperationsForRequest:v12 forAssistantID:v29 fromRemote:0 reason:a3];

    [(ADCommandCenter *)self _setCurrentRequest:0];
    [(ADCommandCenter *)self _cancelCrossDeviceRequestOperationsForLocalRequestWithId:v12];
    uint64_t v30 = 4;
    if (a3 != 3) {
      uint64_t v30 = 5;
    }
    if (a3 == 4) {
      uint64_t v31 = 3;
    }
    else {
      uint64_t v31 = v30;
    }
    [(ADCommandCenter *)self _addNetworkActivityTracingForLabel:1 start:0 withCompletionReason:v31 andError:v9];
  }
  requestCompletion = (void (**)(id, void, void *))self->_requestCompletion;
  if (requestCompletion)
  {
    __int16 v33 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v36 = 136315138;
      __int16 v37 = "-[ADCommandCenter _cancelCurrentRequestForReason:andError:successorInfo:]";
      _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s Invoking request completion on request cancelation", (uint8_t *)&v36, 0xCu);
      requestCompletion = (void (**)(id, void, void *))self->_requestCompletion;
    }
    int v34 = +[AFError errorWithCode:5];
    requestCompletion[2](requestCompletion, 0, v34);

    id v35 = self->_requestCompletion;
    self->_requestCompletion = 0;
  }
}

- (void)_handleNextCallbacksForReply:(id)a3 forCommand:(id)a4 forRequestId:(id)a5 withExecutionContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(ADCommandCenter *)self _resultObjectCache];
  id v57 = 0;
  double v15 = [v14 commandsForReply:v10 toCommand:v11 missingReferences:&v57];
  id v16 = v57;
  id v17 = [(ADCommandCenterCurrentRequest *)self->_currentRequest currentRequestId];
  __int16 v40 = v12;
  if ([v17 isEqualToString:v12])
  {
    if (v15)
    {
      __int16 v37 = v17;
      id v38 = v16;
      int v34 = v14;
      id v35 = v11;
      id v36 = v10;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v18 = v15;
      id v19 = [v18 countByEnumeratingWithState:&v53 objects:v58 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v54;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v54 != v21) {
              objc_enumerationMutation(v18);
            }
            id v23 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            uint64_t v24 = [v23 refId];

            if (!v24) {
              [v23 setRefId:v12];
            }
            uint64_t v25 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 136315394;
              __int16 v60 = "-[ADCommandCenter _handleNextCallbacksForReply:forCommand:forRequestId:withExecutionContext:]";
              __int16 v61 = 2112;
              id v62 = v23;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s Handling command from result object cache %@", buf, 0x16u);
            }
            [(ADCommandCenter *)self _handleCommandAndClientReply:v23 executionContext:v13 commandCompletion:0];
          }
          id v20 = [v18 countByEnumeratingWithState:&v53 objects:v58 count:16];
        }
        while (v20);
      }

      id v11 = v35;
      id v10 = v36;
      uint64_t v14 = v34;
      id v16 = v38;
LABEL_21:
      id v17 = v37;
      goto LABEL_22;
    }
    if (v16)
    {
      __int16 v37 = v17;
      unsigned int v27 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        __int16 v60 = "-[ADCommandCenter _handleNextCallbacksForReply:forCommand:forRequestId:withExecutionContext:]";
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s Missing command identifiers, asking for objects from the server", buf, 0xCu);
      }
      char v28 = [[ADMissingReferencesContext alloc] initWithMissingReferences:v16 forRequestId:v12];
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_1001F0A6C;
      v48[3] = &unk_100507F88;
      void v48[4] = self;
      id v49 = v10;
      id v29 = v11;
      id v50 = v29;
      id v39 = v16;
      id v30 = v12;
      id v51 = v30;
      id v41 = v13;
      id v52 = v41;
      [(ADMissingReferencesContext *)v28 setFulfillmentBlock:v48];
      [v14 addMissingReferencesContext:v28];
      id v31 = objc_alloc_init((Class)SAGetResultObjects);
      [v31 setRefId:v30];
      [v31 setObjectIdentifiers:v39];
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_1001F0B28;
      v42[3] = &unk_100505B88;
      __int16 v43 = v28;
      id v44 = v29;
      id v32 = v30;
      id v16 = v39;
      id v45 = v32;
      BOOL v46 = self;
      id v47 = v41;
      __int16 v33 = v28;
      [(ADCommandCenter *)self _sendCommandToServer:v31 opportunistically:0 completion:v42];

      goto LABEL_21;
    }
  }
  else
  {
    id v26 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      __int16 v60 = "-[ADCommandCenter _handleNextCallbacksForReply:forCommand:forRequestId:withExecutionContext:]";
      __int16 v61 = 2112;
      id v62 = v12;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s Ignoring command whose request %@ is not the current request", buf, 0x16u);
    }
  }
LABEL_22:
}

- (void)_startLocalRequest:(id)a3 withRequestInfo:(id)a4 forDelegate:(id)a5 suppressCancelationAlertIfCapturingSpeech:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = (OS_dispatch_group *)[objc_alloc((Class)NSString) initWithFormat:@"request = %@, requestInfo = %@, delegate = %@", v12, v13, v14];
  id v17 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v32 = "-[ADCommandCenter _startLocalRequest:withRequestInfo:forDelegate:suppressCancelationAlertIfCapturingSpeech:completion:]";
    __int16 v33 = 2112;
    int v34 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  id v18 = +[NSProcessInfo processInfo];
  [v18 systemUptime];
  self->_requestEffectiveStartTime = v19;

  id v20 = self->_requestGroup;
  uint64_t v21 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315650;
    id v32 = "-[ADCommandCenter _startLocalRequest:withRequestInfo:forDelegate:suppressCancelationAlertIfCapturingSpeech:completion:]";
    __int16 v33 = 2112;
    int v34 = v20;
    __int16 v35 = 2112;
    id v36 = v16;
    _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%s Entering request group %@ (%@)...", buf, 0x20u);
  }
  dispatch_group_enter((dispatch_group_t)v20);
  [(ADCommandCenter *)self _replaceRequestDelegate:v14 withInfo:v13 reason:1 andCompletion:v15];

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1001F1248;
  v26[3] = &unk_100507F88;
  void v26[4] = self;
  id v27 = v13;
  id v28 = v12;
  id v29 = v20;
  id v30 = v16;
  id v22 = v16;
  id v23 = v20;
  id v24 = v12;
  id v25 = v13;
  [(ADCommandCenter *)self _replaceSpeechDelegateWhenReady:0 suppressAlert:v8 withCompletion:v26];
}

- (void)_reallyHandleNewStartLocalRequest:(id)a3
{
  id v5 = a3;
  BOOL v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v27 = "-[ADCommandCenter _reallyHandleNewStartLocalRequest:]";
    __int16 v28 = 2112;
    id v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s startLocalRequest = %@", buf, 0x16u);
  }
  [(ADCommandCenterClient *)self->_currentClient adInvalidateCurrentUserActivity];
  [(ADCommandCenter *)self _setCurrentRequestWithCommand:v5];
  double v7 = [v5 aceId];
  BOOL v8 = NSStringFromSelector(a2);
  [(ADCommandCenter *)self _addOutstandingRequestId:v7 forReason:v8];

  id v9 = [(AFSpeechRequestOptions *)self->_currentSpeechRequestOptions activationEvent];
  sub_10035C6FC((uint64_t)v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10) {
    id v10 = SAInputOriginClientGeneratedValue;
  }
  id v11 = [(ADCommandCenter *)self _createDefaultRequestContextData:v9 == (id)17];
  id v12 = [(ADCommandCenter *)self _requestDispatcherService];
  id v13 = [(ADCommandCenter *)self _requestDispatcherSessionConfiguration];
  id v14 = [v5 aceId];
  [v12 startLocalRequestWithConfiguration:v13 requestId:v14 inputOrigin:v10 requestContextData:v11];

  id v15 = [v5 aceId];
  [(ADCommandCenter *)self _emitDeviceDynamicContextForRequest:v15];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = objc_msgSend(v5, "clientBoundCommands", 0);
  id v17 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      id v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        [(ADCommandCenter *)self _handleGenericConcreteAceCommand:*(void *)(*((void *)&v21 + 1) + 8 * (void)v20) withDelegate:self->_currentClient interruptOutstandingRequest:1 reply:0];
        id v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v18);
  }
}

- (BOOL)_shouldImmediatelyDismissSiriDueToMissingRequiredAssets
{
  int v3 = AFDeviceSupportsDisablingServerFallbackWhenMissingAsset();
  int v4 = AFDeviceSupportsSAE();
  int v5 = v4;
  BOOL v6 = ((v3 & 1) != 0 || v4) && !self->_isInStarkMode;
  double v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    BOOL isInStarkMode = self->_isInStarkMode;
    int v10 = 136316418;
    id v11 = "-[ADCommandCenter _shouldImmediatelyDismissSiriDueToMissingRequiredAssets]";
    __int16 v12 = 1024;
    int v13 = v3;
    __int16 v14 = 1024;
    int v15 = v5;
    __int16 v16 = 1024;
    int v17 = 0;
    __int16 v18 = 1024;
    BOOL v19 = isInStarkMode;
    __int16 v20 = 1024;
    BOOL v21 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s AFDeviceSupportsDisablingServerFallbackWhenMissingAsset = %u, AFDeviceSupportsSAE = %u, shouldAllowProceedingWithoutNLRouterAsset = %u, while missing asset; #carplay active = %u; dismissing Siri right away: %u",
      (uint8_t *)&v10,
      0x2Au);
  }
  return v6;
}

- (void)_reallyHandleNewStartRequest:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    __int16 v20 = "-[ADCommandCenter _reallyHandleNewStartRequest:info:]";
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s startRequest = %@", (uint8_t *)&v19, 0x16u);
  }
  [(ADCommandCenterClient *)self->_currentClient adInvalidateCurrentUserActivity];
  if (AFIsInternalInstall())
  {
    id v9 = +[NSNumber numberWithBool:byte_100585E38];
    [v6 setIsCarryDevice:v9];
  }
  objc_msgSend(v6, "setTextToSpeechIsMuted:", -[ADCommandCenterClient adTextToSpeechIsMuted](self->_currentClient, "adTextToSpeechIsMuted"));
  int v10 = [v6 aceId];

  if (!v10)
  {
    id v11 = SiriCoreUUIDStringCreate();
    [v6 setAceId:v11];
  }
  __int16 v12 = [(ADCommandCenter *)self _startServerRequestWithStartRequest:v6 requestInfo:v7];
  if (![(ADCommandCenter *)self _areRequiredAssetsMissing]) {
    goto LABEL_16;
  }
  int v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 136315138;
    __int16 v20 = "-[ADCommandCenter _reallyHandleNewStartRequest:info:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s _areRequiredAssetsMissing is true even when understanding on device is enabled", (uint8_t *)&v19, 0xCu);
  }
  currentUodStatus = self->_currentUodStatus;
  int v15 = [v6 aceId];
  sub_1001DCD90(currentUodStatus, v15);

  LODWORD(v15) = [(ADCommandCenter *)self _shouldImmediatelyDismissSiriDueToMissingRequiredAssets];
  __int16 v16 = AFSiriLogContextDaemon;
  BOOL v17 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
  if (!v15)
  {
    if (v17)
    {
      int v19 = 136315138;
      __int16 v20 = "-[ADCommandCenter _reallyHandleNewStartRequest:info:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s Not dismissing Siri request due to lack of assets.", (uint8_t *)&v19, 0xCu);
    }
LABEL_16:
    [(ADCommandCenter *)self _setCurrentRequestWithCommand:v6];
    if (v12) {
      id v18 = v12;
    }
    else {
      id v18 = v6;
    }
    [(ADCommandCenter *)self _sendRetryableRequestToServer:v18];
    goto LABEL_20;
  }
  if (v17)
  {
    int v19 = 136315138;
    __int16 v20 = "-[ADCommandCenter _reallyHandleNewStartRequest:info:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s [_reallyHandleNewStartRequest] Dismissing Siri with reason AFDismissalAssetsNotReady", (uint8_t *)&v19, 0xCu);
  }
  [(ADCommandCenter *)self dismissAssistantWithReason:5];
LABEL_20:
}

- (void)_triggerABCforType:(id)a3 subType:(id)a4 context:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = a5;
  if (AFIsInternalInstall())
  {
    id v9 = +[SiriCoreSymptomsReporter sharedInstance];
    int v10 = +[NSProcessInfo processInfo];
    id v11 = [v10 processIdentifier];
    [v9 reportIssueForType:v12 subType:v7 context:v8 processIdentifier:v11 walkboutStatus:byte_100585E38];
  }
}

- (void)_sendCancelSpeechForCommand:(id)a3
{
  id v4 = a3;
  id v7 = objc_alloc_init((Class)SASCancelSpeech);
  int v5 = [v4 aceId];

  [v7 setRefId:v5];
  [(ADCommandCenter *)self _sendCommandToServer:v7];
  id v6 = [(ADCommandCenter *)self _sessionManager];
  [v6 endRetryableRequestForCommand:v7];
}

- (void)_sendWillStopRecordingForCommand:(id)a3
{
  id v4 = a3;
  id v6 = objc_alloc_init((Class)SASWillStopRecording);
  int v5 = [v4 aceId];

  [v6 setRefId:v5];
  [(ADCommandCenter *)self _sendCommandToServer:v6];
}

- (void)_sendRollbackCommandForCommand:(id)a3
{
  id v4 = a3;
  int v5 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    int v10 = "-[ADCommandCenter _sendRollbackCommandForCommand:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }
  id v6 = objc_alloc_init((Class)SARollbackRequest);
  id v7 = [v4 aceId];
  [v6 setRequestId:v7];

  [(ADCommandCenter *)self _sendCommandToServer:v6];
  id v8 = [(ADCommandCenter *)self _sessionManager];
  [v8 endRetryableRequestForCommand:v4];
}

- (void)_sendCommandFailedForCommand:(id)a3 reason:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [objc_alloc((Class)SACommandFailed) initWithReason:v6];

  id v8 = [v7 aceId];

  [v9 setRefId:v8];
  [(ADCommandCenter *)self _sendCommandToServer:v9];
}

- (void)_sendCommandFailedForCommand:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)SACommandFailed);
  id v9 = [v6 description];
  id v12 = [v8 initWithReason:v9];

  id v10 = [v6 code];
  [v12 setErrorCode:v10];
  id v11 = [v7 aceId];

  [v12 setRefId:v11];
  [(ADCommandCenter *)self _sendCommandToServer:v12];
}

- (void)_sendRequestToServer:(id)a3
{
  id v5 = a3;
  id v6 = sub_1001CA890(v5);
  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315394;
    __int16 v16 = "-[ADCommandCenter _sendRequestToServer:]";
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s command = %@", (uint8_t *)&v15, 0x16u);
  }
  id v8 = NSStringFromSelector(a2);
  [(ADCommandCenter *)self _addOutstandingRequestId:v6 forReason:v8];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          objc_opt_class();
          objc_opt_isKindOfClass();
          id v9 = [v5 origin];
          id v10 = [(ADCommandCenter *)self _requestDispatcherService];
          id v11 = [(ADCommandCenter *)self _requestDispatcherSessionConfiguration];
          id v12 = [v5 aceId];
          [v10 startUnderstandingOnServerRequestWithConfiguration:v11 requestId:v12 inputOrigin:v9];

          int v13 = [v5 aceId];
          [(ADCommandCenter *)self _emitDeviceDynamicContextForRequest:v13];
        }
      }
    }
  }
  __int16 v14 = [(ADCommandCenter *)self _sessionManager];
  [v14 sendRawCommand:v5 opportunistically:0 logEvent:1];
}

- (void)_sendCommandToServer:(id)a3 opportunistically:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  sub_1001CA890(v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [(ADCommandCenter *)self _addCompletion:v8 forCommand:v9 forKey:v10];

  [(ADCommandCenter *)self _sendCommandToServer:v9 opportunistically:v5];
}

- (void)_sendCommandToServer:(id)a3 completion:(id)a4
{
}

- (void)_sendCommandToServer:(id)a3
{
}

- (void)_sendCommandToServer:(id)a3 opportunistically:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(ADCommandCenter *)self _sessionManager];
  [v7 sendCommand:v6 opportunistically:v4 logEvent:1];
}

- (void)_sendSessionObject:(id)a3 opportunistically:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(ADCommandCenter *)self _sessionManager];
  [v7 sendCommand:v6 opportunistically:v4 logEvent:0];
}

- (BOOL)_refIdIsSpeechStart:(id)a3
{
  startSpeechCommand = self->_startSpeechCommand;
  id v4 = a3;
  BOOL v5 = [(SASStartSpeech *)startSpeechCommand aceId];
  id v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    id v10 = "-[ADCommandCenter _refIdIsSpeechStart:]";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s StartSpeech msg id is %@", (uint8_t *)&v9, 0x16u);
  }
  unsigned __int8 v7 = [v5 isEqualToString:v4];

  return v7;
}

- (void)_preheatAllServices
{
  id v3 = [(ADCommandCenter *)self _serviceManager];
  id v2 = [v3 allServices];
  [v2 makeObjectsPerformSelector:"preheatDomain:" withObject:0];
}

- (void)_fetchStarkDeviceLockedStateWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    void v7[2] = sub_1001F258C;
    v7[3] = &unk_10050E188;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)_resetServices
{
  id v3 = [(ADCommandCenter *)self _serviceManager];
  id v4 = [v3 allServices];
  [v4 makeObjectsPerformSelector:"resetExternalResources"];

  id v5 = [(ADCommandCenter *)self _serviceManager];
  [v5 reloadServicesForAllPendingServiceNotifications];
}

- (id)_languageModelForSpeechRequest:(id)a3
{
  id v4 = objc_msgSend(a3, "ad_languageModel");
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    unsigned __int8 v7 = [(ADCommandCenter *)self _sessionManager];
    id v6 = [v7 languageCode];
  }
  return v6;
}

- (void)_didLaunchAppForRequestWithIdentifier:(id)a3
{
  id v4 = a3;
  currentRequest = self->_currentRequest;
  if (!currentRequest
    || ([(ADCommandCenterCurrentRequest *)currentRequest currentRequestId],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 isEqualToString:v4],
        v6,
        v7))
  {
    id v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      __int16 v11 = "-[ADCommandCenter _didLaunchAppForRequestWithIdentifier:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Marking request did finish on app launch callback", (uint8_t *)&v10, 0xCu);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, AFSiriDidLaunchAppNotification, 0, 0, 1u);
    +[AFAggregator logRequestLaunchedApp];
  }
}

- (void)_speechCaptureCompleted
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    int v13 = "-[ADCommandCenter _speechCaptureCompleted]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v12, 0xCu);
  }
  if (self->_currentClient
    || (unsigned int v7 = self->_speechDelegate) != 0
    && ![(ADCommandCenterSpeechDelegate *)v7 adSpeechSessionEnded])
  {
    id v4 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      currentClient = self->_currentClient;
      speechDelegate = self->_speechDelegate;
      int v12 = 136315650;
      int v13 = "-[ADCommandCenter _speechCaptureCompleted]";
      __int16 v14 = 2048;
      int v15 = currentClient;
      __int16 v16 = 2048;
      __int16 v17 = speechDelegate;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Ignored releasing audio session because current client is %p and speech delegate is %p.", (uint8_t *)&v12, 0x20u);
    }
  }
  else
  {
    id v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      int v13 = "-[ADCommandCenter _speechCaptureCompleted]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Asking speech manager to release audio session...", (uint8_t *)&v12, 0xCu);
    }
    [(ADSpeechManager *)self->_speechManager endSession];
  }
  [(ADCommandCenter *)self _acousticId_speechCaptureCompleted];
  id speechCompletion = (void (**)(id))self->_speechCompletion;
  if (speechCompletion)
  {
    int v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      int v13 = "-[ADCommandCenter _speechCaptureCompleted]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Invoking Speech Completion", (uint8_t *)&v12, 0xCu);
      id speechCompletion = (void (**)(id))self->_speechCompletion;
    }
    speechCompletion[2](speechCompletion);
    id v11 = self->_speechCompletion;
    self->_id speechCompletion = 0;
  }
}

- (void)_replaceSpeechDelegateWhenReady:(id)a3 waitForRecordingToFinish:(BOOL)a4 suppressAlert:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v11 = (ADCommandCenterSpeechDelegate *)a3;
  int v12 = (void (**)(void))a6;
  int v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v35 = "-[ADCommandCenter _replaceSpeechDelegateWhenReady:waitForRecordingToFinish:suppressAlert:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  speechDelegate = self->_speechDelegate;
  BOOL v15 = speechDelegate == v11 && !v8;
  if (v15 || (speechManager = self->_speechManager) == 0 || [(ADSpeechManager *)speechManager isStopped])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || [(ADSpeechManager *)self->_speechManager isLocallyRecognizingInDictationMode])
    {
      __int16 v17 = self->_speechDelegate;
      id v18 = +[AFError errorWithCode:209];
      [(ADCommandCenterSpeechDelegate *)v17 adSpeechRecognitionDidFail:v18 sessionUUID:self->_speechCapturingContextSessionUUID];
    }
    [(ADCommandCenter *)self _clearSpeechDelegateState];
    objc_storeStrong((id *)&self->_speechDelegate, a3);
    [(ADCommandCenter *)self _setSpeechCapturingContext:0];
    if (v12) {
      v12[2](v12);
    }
  }
  else
  {
    int v19 = AFSiriLogContextDaemon;
    BOOL v20 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (speechDelegate == v11)
    {
      if (v20)
      {
        *(_DWORD *)long long buf = 136315138;
        __int16 v35 = "-[ADCommandCenter _replaceSpeechDelegateWhenReady:waitForRecordingToFinish:suppressAlert:withCompletion:]";
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s Waiting for recording to finish", buf, 0xCu);
      }
    }
    else
    {
      if (v20)
      {
        *(_DWORD *)long long buf = 136315138;
        __int16 v35 = "-[ADCommandCenter _replaceSpeechDelegateWhenReady:waitForRecordingToFinish:suppressAlert:withCompletion:]";
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s Interrupting current recording speech delegate", buf, 0xCu);
      }
      [(ADSpeechManager *)self->_speechManager cancelSpeechCaptureSuppressingAlert:v7];
      __int16 v21 = self->_speechDelegate;
      id v22 = +[AFError errorWithCode:209];
      long long v23 = [(ADCommandCenter *)self _speechCapturingContext];
      [(ADCommandCenterSpeechDelegate *)v21 adSpeechRecordingDidFail:v22 context:v23];

      long long v24 = self->_speechDelegate;
      self->_speechDelegate = 0;

      [(ADCommandCenter *)self _setSpeechCapturingContext:0];
    }
    id v25 = objc_retainBlock(self->_speechCompletion);
    objc_initWeak((id *)buf, self);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1001F2D50;
    void v29[3] = &unk_100505B38;
    id v31 = v25;
    id v26 = v25;
    objc_copyWeak(&v33, (id *)buf);
    id v30 = v11;
    id v32 = v12;
    id v27 = objc_retainBlock(v29);
    id speechCompletion = self->_speechCompletion;
    self->_id speechCompletion = v27;

    objc_destroyWeak(&v33);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_replaceSpeechDelegateWhenReady:(id)a3 suppressAlert:(BOOL)a4 withCompletion:(id)a5
{
}

- (void)_completeRequestForCurrentDelegate:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = AFSiriLogContextDaemon;
  if (v6 || !v4)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136315650;
      id v22 = "-[ADCommandCenter _completeRequestForCurrentDelegate:error:]";
      __int16 v23 = 1024;
      BOOL v24 = v4;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s success = %d, error = %@", (uint8_t *)&v21, 0x1Cu);
    }
    BOOL v8 = [(ADCommandCenter *)self _currentRequest];
    int v9 = [v8 currentRequestId];

    if (v9)
    {
      int v10 = [(ADCommandCenter *)self _requestDispatcherService];
      id v11 = [(ADCommandCenter *)self _account];
      int v12 = [v11 assistantIdentifier];
      int v13 = [(ADCommandCenter *)self _currentRequest];
      __int16 v14 = [v13 currentRequestId];
      [v10 requestFailedWithAssistantId:v12 requestId:v14];
    }
  }
  else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v21 = 136315138;
    id v22 = "-[ADCommandCenter _completeRequestForCurrentDelegate:error:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v21, 0xCu);
  }
  if (v4) {
    [(ADCommandCenter *)self _addNetworkActivityTracingForLabel:1 start:0 withCompletionReason:2 andError:0];
  }
  requestDelegate = self->_requestDelegate;
  if (requestDelegate)
  {
    [(ADCommandCenterRequestDelegate *)requestDelegate adRequestDidCompleteWithSuccess:v4 error:v6];
    __int16 v16 = self->_requestDelegate;
    self->_requestDelegate = 0;

    __int16 v17 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315138;
      id v22 = "-[ADCommandCenter _completeRequestForCurrentDelegate:error:]";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s requestDelegate is set to nil.", (uint8_t *)&v21, 0xCu);
    }
  }
  requestCompletion = (void (**)(id, BOOL, id))self->_requestCompletion;
  if (requestCompletion)
  {
    requestCompletion[2](requestCompletion, v4, v6);
    id v19 = self->_requestCompletion;
    self->_requestCompletion = 0;

    BOOL v20 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315138;
      id v22 = "-[ADCommandCenter _completeRequestForCurrentDelegate:error:]";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s requestCompletion invoked.", (uint8_t *)&v21, 0xCu);
    }
  }
}

- (void)_replaceRequestDelegate:(id)a3 withInfo:(id)a4 reason:(int64_t)a5 andCompletion:(id)a6
{
  unint64_t v11 = (unint64_t)a3;
  id v12 = a4;
  id v13 = a6;
  __int16 v14 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    BOOL v15 = v14;
    if ((unint64_t)a5 > 6) {
      __int16 v16 = @"(unknown)";
    }
    else {
      __int16 v16 = *(&off_10050E3C0 + a5);
    }
    __int16 v17 = v16;
    *(_DWORD *)long long buf = 136315394;
    BOOL v42 = "-[ADCommandCenter _replaceRequestDelegate:withInfo:reason:andCompletion:]";
    __int16 v43 = 2112;
    id v44 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s ReplaceRequestDelegateReason: %@", buf, 0x16u);
  }
  p_unint64_t requestDelegate = (id *)&self->_requestDelegate;
  unint64_t requestDelegate = (unint64_t)self->_requestDelegate;
  if (v11 | requestDelegate)
  {
    if (requestDelegate == v11 || !requestDelegate)
    {
      if (!v11 || requestDelegate)
      {
LABEL_23:
        if ((unint64_t)a5 > 6) {
          uint64_t v27 = 9;
        }
        else {
          uint64_t v27 = qword_1003E2F20[a5];
        }
        [(ADCommandCenter *)self _cancelCurrentRequestForReason:v27 andError:0 successorInfo:v12];
        [(ADCommandCenter *)self _clearRequestDelegateState];
        id v28 = objc_retainBlock(v13);
        id requestCompletion = self->_requestCompletion;
        self->_id requestCompletion = v28;

        id v30 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          id v31 = self->_requestCompletion;
          id v32 = v30;
          id v33 = (__CFString *)objc_retainBlock(v31);
          *(_DWORD *)long long buf = 136315394;
          BOOL v42 = "-[ADCommandCenter _replaceRequestDelegate:withInfo:reason:andCompletion:]";
          __int16 v43 = 2112;
          id v44 = v33;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%s requestCompletion is set to %@.", buf, 0x16u);
        }
        if (*p_requestDelegate != (id)v11)
        {
          int v34 = [(ADCommandCenter *)self _serviceManager];
          __int16 v35 = +[ADUIService serviceIdentifierForRequestDelegate:v11];
          id v36 = [v34 serviceForIdentifier:v35];

          [v34 reprioritizeService:v36];
        }
        objc_storeStrong((id *)&self->_requestDelegate, a3);
        __int16 v37 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          id v38 = (__CFString *)*p_requestDelegate;
          *(_DWORD *)long long buf = 136315394;
          BOOL v42 = "-[ADCommandCenter _replaceRequestDelegate:withInfo:reason:andCompletion:]";
          __int16 v43 = 2112;
          id v44 = v38;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%s requestDelegate is set to %@.", buf, 0x16u);
        }
        if (v11) {
          [(ADCommandCenter *)self _requestWillStartWithInfo:v12 showNetworkActivityIndicator:1];
        }
        goto LABEL_34;
      }
      id v22 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        BOOL v42 = "-[ADCommandCenter _replaceRequestDelegate:withInfo:reason:andCompletion:]";
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s Informing session it's ok to send assistant data", buf, 0xCu);
      }
      __int16 v23 = [(ADCommandCenter *)self _sessionManager];
      [v23 beginUpdatingAssistantData];
LABEL_22:

      goto LABEL_23;
    }
    BOOL v20 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      BOOL v42 = "-[ADCommandCenter _replaceRequestDelegate:withInfo:reason:andCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s Interrupting current request delegate", buf, 0xCu);
    }
    if ((unint64_t)a5 > 4)
    {
      CFStringRef v39 = @"ADReplaceRequestDelegateReason";
      uint64_t v21 = 5;
      if ((unint64_t)a5 > 6)
      {
        BOOL v24 = @"(unknown)";
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v21 = qword_1003E2F58[a5];
      CFStringRef v39 = @"ADReplaceRequestDelegateReason";
    }
    BOOL v24 = *(&off_10050E3C0 + a5);
LABEL_21:
    __int16 v25 = v24;
    __int16 v40 = v25;
    __int16 v23 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];

    id v26 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kAFAssistantErrorDomain, v21, v23, v39);
    [*p_requestDelegate adRequestDidCompleteWithSuccess:0 error:v26];

    goto LABEL_22;
  }
LABEL_34:
}

- (void)_replaceRequestDelegate:(id)a3 reason:(int64_t)a4
{
}

- (void)_clearSpeechDelegateState
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    id v12 = "-[ADCommandCenter _clearSpeechDelegateState]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Clearing speech delegate state", (uint8_t *)&v11, 0xCu);
  }
  startSpeechCommand = self->_startSpeechCommand;
  self->_startSpeechCommand = 0;

  speechRecognitionResultUUID = self->_speechRecognitionResultUUID;
  self->_speechRecognitionResultUUID = 0;

  finishSpeechCommand = self->_finishSpeechCommand;
  self->_finishSpeechCommand = 0;

  currentSpeechRequestOptions = self->_currentSpeechRequestOptions;
  self->_currentSpeechRequestOptions = 0;

  self->_startingPronunciationRequest = 0;
  pronunciationContext = self->_pronunciationContext;
  self->_pronunciationContext = 0;

  *(_DWORD *)&self->_BOOL speechDelegateHasReceivedSpeechRecognized = 0;
  speechDelegate = self->_speechDelegate;
  self->_speechDelegate = 0;

  *(_WORD *)&self->_isSmartLanguageSelectionActive = 0;
  id multilingualSpeechRecognizedCommandHandler = self->_multilingualSpeechRecognizedCommandHandler;
  self->_id multilingualSpeechRecognizedCommandHandler = 0;

  [(ADCommandCenter *)self _stopLanguageDetectionWaitTimerIfNeeded];
  [(ADCommandCenter *)self _acousticId_clearPartialResultTimer];
}

- (void)_clearRequestDelegateState
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADCommandCenter _clearRequestDelegateState]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Clearing request delegate state", (uint8_t *)&v4, 0xCu);
  }
  [(ADCommandCenter *)self _setCurrentRequest:0];
  [(ADCommandCenter *)self _setLastRequest:0];
}

- (void)_requestBarrier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_retainBlock(self->_requestBarrier);
    id v6 = v5;
    if (v5)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1001F384C;
      v11[3] = &unk_10050C868;
      id v12 = v5;
      id v13 = v4;
      BOOL v7 = objc_retainBlock(v11);
      id requestBarrier = self->_requestBarrier;
      self->_id requestBarrier = v7;

      id v9 = v12;
    }
    else
    {
      id v10 = objc_retainBlock(v4);
      id v9 = self->_requestBarrier;
      self->_id requestBarrier = v10;
    }
  }
}

- (void)_requestBarrierIfNecessary:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (v4)
  {
    if (self->_currentRequest)
    {
      [(ADCommandCenter *)self _requestBarrier:v4];
    }
    else
    {
      id v5 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v6 = 136315138;
        BOOL v7 = "-[ADCommandCenter _requestBarrierIfNecessary:]";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s No current request - Invoking Request Barrier", (uint8_t *)&v6, 0xCu);
      }
      v4[2](v4);
    }
  }
}

- (void)_requestDidEnd
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    int v11 = "-[ADCommandCenter _requestDidEnd]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }
  id v4 = [(ADCommandCenter *)self _sessionManager];
  [v4 setHasActiveRequest:0];

  sub_1001FB7C0();
  id v5 = +[ADRequestLifecycleObserver sharedObserver];
  [v5 requestDidEndWithInfo:self->_currentRequestInfo fromOrigin:5 client:self->_currentClient];

  [(ADCommandCenter *)self _metrics_recordNetworkSnapshotForEvent:2 completion:0];
  [(ADCommandCenter *)self _metrics_recordSNNetworkSnapshotForEvent:2 completion:0];
  [(ADCommandCenter *)self _setSpeechCapturingContext:0];
  requestAssertion = self->_requestAssertion;
  self->_requestAssertion = 0;

  int v7 = AFSupportsSCDAFramework();
  BOOL v8 = (id *)SCDAMonitor_ptr;
  if (!v7) {
    BOOL v8 = (id *)AFMyriadMonitor_ptr;
  }
  id v9 = [*v8 sharedMonitor];
  [v9 dequeueBlocksWaitingForMyriadDecision];
}

- (void)_requestWillStartWithInfo:(id)a3 showNetworkActivityIndicator:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  BOOL v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v28 = "-[ADCommandCenter _requestWillStartWithInfo:showNetworkActivityIndicator:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v9 = [(ADCommandCenter *)self _sessionManager];
  [v9 setHasActiveRequest:1];

  [(ADCommandCenter *)self _setCallIsLikely:0];
  [(ADCommandCenter *)self _awdRequestStart];
  if (v4)
  {
    int v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v28 = "ADShowNetworkActivityIndicatorForApplicationIdentifier";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s *** Turning on data spinny", buf, 0xCu);
    }
    sub_1001FB658(1);
  }
  objc_storeStrong((id *)&self->_currentRequestInfo, a3);
  int v11 = +[ADRequestLifecycleObserver sharedObserver];
  [v11 requestWillBeginWithInfo:self->_currentRequestInfo fromOrigin:5 client:self->_currentClient];

  int v12 = AFSupportsSCDAFramework();
  id v13 = (id *)SCDAMonitor_ptr;
  if (!v12) {
    id v13 = (id *)AFMyriadMonitor_ptr;
  }
  __int16 v14 = [*v13 sharedMonitor];
  [v14 dequeueBlocksWaitingForMyriadDecision];

  BOOL v15 = [v7 speechRequestOptions];
  unsigned int v16 = [v15 isVoiceTrigger];

  if (AFSupportsSCDAFramework()) {
    __int16 v17 = SCDAMonitor;
  }
  else {
    __int16 v17 = AFMyriadMonitor;
  }
  id v18 = [v17 sharedMonitor];
  id v19 = v18;
  if (v16) {
    BOOL isInStarkMode = self->_isInStarkMode;
  }
  else {
    BOOL isInStarkMode = 1;
  }
  [v18 ignoreMyriadEvents:isInStarkMode];

  if (v7 || self->_requestDelegate)
  {
    uint64_t v21 = [(ADCommandCenter *)self _contextManager];
    id v22 = [(ADCommandCenter *)self _locationManager];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1001F3DA0;
    void v24[3] = &unk_10050E160;
    id v25 = v21;
    id v26 = self;
    id v23 = v21;
    [v22 updateLocationSnapshotWithCompletion:v24];
  }
}

- (ADSpeechManager)_speechManager
{
  speechManager = self->_speechManager;
  if (!speechManager)
  {
    BOOL v4 = (OS_dispatch_group *)dispatch_group_create();
    speechRequestGroup = self->_speechRequestGroup;
    self->_speechRequestGroup = v4;

    int v6 = +[ADSpeechManager sharedManager];
    id v7 = self->_speechManager;
    self->_speechManager = v6;

    [(ADSpeechManager *)self->_speechManager setClientConfiguration:self->_clientConfiguration];
    [(ADSpeechManager *)self->_speechManager setDelegate:self];
    speechManager = self->_speechManager;
  }
  return speechManager;
}

- (void)_clearAccount
{
  [(ADCommandCenter *)self _cancelSessionManager];
  [(ADCommandCenter *)self _sync_reset];
  account = self->_account;
  self->_account = 0;
}

- (id)_account
{
  account = self->_account;
  if (!account)
  {
    BOOL v4 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      id v9 = "-[ADCommandCenter _account]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s no saved account - fetching from ADAccount", (uint8_t *)&v8, 0xCu);
    }
    id v5 = +[ADAccount activeAccount];
    int v6 = self->_account;
    self->_account = v5;

    account = self->_account;
  }
  return account;
}

- (void)_setCurrentRequest:(id)a3
{
  id v5 = (ADCommandCenterCurrentRequest *)a3;
  int v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    currentRequest = self->_currentRequest;
    int v25 = 136315650;
    id v26 = "-[ADCommandCenter _setCurrentRequest:]";
    __int16 v27 = 2112;
    id v28 = currentRequest;
    __int16 v29 = 2112;
    id v30 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@ -> %@", (uint8_t *)&v25, 0x20u);
  }
  int v8 = self->_currentRequest;
  objc_storeStrong((id *)&self->_currentRequest, a3);
  id v9 = [(ADCommandCenter *)self _sessionManager];
  int v10 = [(ADCommandCenterCurrentRequest *)v5 currentRequestCommand];
  [v9 setCurrentRequest:v10];

  int v11 = self->_currentRequest;
  if (!v11 && v8)
  {
    id requestEndCompletion = (void (**)(id))self->_requestEndCompletion;
    if (!requestEndCompletion) {
      goto LABEL_10;
    }
    id v13 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v25 = 136315138;
      id v26 = "-[ADCommandCenter _setCurrentRequest:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Invoking Request End Completion", (uint8_t *)&v25, 0xCu);
      id requestEndCompletion = (void (**)(id))self->_requestEndCompletion;
    }
    requestEndCompletion[2](requestEndCompletion);
    id v14 = self->_requestEndCompletion;
    self->_id requestEndCompletion = 0;

    int v11 = self->_currentRequest;
  }
  if (v11) {
    goto LABEL_14;
  }
LABEL_10:
  id requestBarrier = (void (**)(id))self->_requestBarrier;
  if (requestBarrier)
  {
    unsigned int v16 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v25 = 136315138;
      id v26 = "-[ADCommandCenter _setCurrentRequest:]";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Invoking Request Barrier", (uint8_t *)&v25, 0xCu);
      id requestBarrier = (void (**)(id))self->_requestBarrier;
    }
    requestBarrier[2](requestBarrier);
    id v17 = self->_requestBarrier;
    self->_id requestBarrier = 0;

    int v11 = self->_currentRequest;
LABEL_14:
    if (v8) {
      goto LABEL_15;
    }
    goto LABEL_20;
  }
  int v11 = 0;
  if (v8)
  {
LABEL_15:
    if (!v11)
    {
      id v18 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        requestGroup = self->_requestGroup;
        int v25 = 136315650;
        id v26 = "-[ADCommandCenter _setCurrentRequest:]";
        __int16 v27 = 2112;
        id v28 = requestGroup;
        __int16 v29 = 2112;
        id v30 = v8;
        _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%s Leaving request group %@ because there is no current request and the previous request is %@...", (uint8_t *)&v25, 0x20u);
      }
      dispatch_group_leave((dispatch_group_t)self->_requestGroup);
      id v19 = [(ADCommandCenterCurrentRequest *)v8 currentRequestId];
      [(ADCommandCenter *)self _notifyUSTForRequestCompleted:v19];
    }
    goto LABEL_24;
  }
LABEL_20:
  if (v11)
  {
    BOOL v20 = [(ADCommandCenterCurrentRequest *)v11 currentRequestId];
    [(ADCommandCenter *)self _notifyUSTForRequestStarted:v20];

    uint64_t v21 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      id v23 = self->_requestGroup;
      BOOL v24 = self->_currentRequest;
      int v25 = 136315650;
      id v26 = "-[ADCommandCenter _setCurrentRequest:]";
      __int16 v27 = 2112;
      id v28 = v23;
      __int16 v29 = 2112;
      id v30 = v24;
      _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%s Entering request group %@ because there is no previous request and the current request is %@...", (uint8_t *)&v25, 0x20u);
    }
    dispatch_group_enter((dispatch_group_t)self->_requestGroup);
  }
LABEL_24:
}

- (void)_setCurrentRequestWithRequestId:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = objc_alloc_init(ADCommandCenterCurrentRequest);
    [(ADCommandCenterCurrentRequest *)v5 setCurrentRequestId:v4];
  }
  else
  {
    id v5 = 0;
  }
  [(ADCommandCenter *)self _setCurrentRequest:v5];
}

- (void)_setCurrentRequestWithCommand:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = objc_alloc_init(ADCommandCenterCurrentRequest);
    [(ADCommandCenterCurrentRequest *)v5 setCurrentRequestCommand:v4];
  }
  else
  {
    id v5 = 0;
  }
  [(ADCommandCenter *)self _setCurrentRequest:v5];
}

- (void)_cancelSessionManager
{
  [(ADSessionManager *)self->_sessionManager setDelegate:0];
  [(ADSessionManager *)self->_sessionManager cancel];
  sessionManager = self->_sessionManager;
  self->_sessionManager = 0;

  [(ADCommandCenter *)self _awdSessionEnd];
  locationManager = self->_locationManager;
  [(ADLocationManager *)locationManager setNeedsToSendLocation:1];
}

- (void)_stopUpdatingMotionActivity
{
  motionManager = self->_motionManager;
  NSStringFromSelector(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(ADMotionManager *)motionManager stopUpdatingMotionActivityForReason:v3 completion:&stru_100505B10];
}

- (void)_startUpdatingMotionActivity
{
  id v4 = [(ADCommandCenter *)self _motionManager];
  id v3 = NSStringFromSelector(a2);
  [v4 startUpdatingMotionActivityForReason:v3 completion:&stru_100505AF0];
}

- (id)_motionManager
{
  motionManager = self->_motionManager;
  if (!motionManager)
  {
    id v4 = objc_alloc_init(ADMotionManager);
    id v5 = self->_motionManager;
    self->_motionManager = v4;

    motionManager = self->_motionManager;
  }
  return motionManager;
}

- (void)sendMultiUserInfoToMUX
{
  id v2 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    id v4 = "-[ADCommandCenter sendMultiUserInfoToMUX]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v3, 0xCu);
  }
  AFIsATV();
}

- (void)_setupUIBridgeServiceListener
{
  char v3 = AFDeviceSupportsMedoc();
  id v4 = AFSiriLogContextDaemon;
  BOOL v5 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      int v11 = 136315138;
      int v12 = "-[ADCommandCenter _setupUIBridgeServiceListener]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Launching UIBridge service listener", (uint8_t *)&v11, 0xCu);
    }
    int v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AFUIBridgeService];
    id v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AFUIBridgeServiceDelegate];
    id v8 = objc_alloc((Class)AFBridgeConnectionListener);
    id v9 = (AFBridgeConnectionListener *)[v8 initWithBridgeName:@"UI" machService:kAssistantRequestDispatcherUIBridgeServiceName withServiceInterface:v6 withDelegateInterface:v7];
    uiBridgeServiceListener = self->_uiBridgeServiceListener;
    self->_uiBridgeServiceListener = v9;
  }
  else if (v5)
  {
    int v11 = 136315138;
    int v12 = "-[ADCommandCenter _setupUIBridgeServiceListener]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Medoc is not supported/enabled, skipping", (uint8_t *)&v11, 0xCu);
  }
}

- (id)_flowServiceListener
{
  flowServiceListener = self->_flowServiceListener;
  if (!flowServiceListener)
  {
    id v4 = objc_alloc_init(ADFlowServiceListener);
    BOOL v5 = self->_flowServiceListener;
    self->_flowServiceListener = v4;

    flowServiceListener = self->_flowServiceListener;
  }
  return flowServiceListener;
}

- (id)_deviceRouter
{
  deviceRouter = self->_deviceRouter;
  if (!deviceRouter)
  {
    id v4 = [[ADDeviceRouter alloc] initWithQueue:self->_queue];
    BOOL v5 = self->_deviceRouter;
    self->_deviceRouter = v4;

    deviceRouter = self->_deviceRouter;
  }
  return deviceRouter;
}

- (id)_getPreheatOptionsForHorseman
{
  id v2 = [objc_alloc((Class)AFSpeechRequestOptions) initWithActivationEvent:8];
  return v2;
}

- (id)_headphonesAnnouncementRequestCapabilityManager
{
  headphonesAnnouncementRequestCapabilityManager = self->_headphonesAnnouncementRequestCapabilityManager;
  if (!headphonesAnnouncementRequestCapabilityManager)
  {
    id v4 = [(AFSiriAnnouncementRequestCapabilityManager *)[ADSiriAnnouncementRequestCapabilityManager alloc] initWithPlatform:1];
    BOOL v5 = self->_headphonesAnnouncementRequestCapabilityManager;
    self->_headphonesAnnouncementRequestCapabilityManager = v4;

    headphonesAnnouncementRequestCapabilityManager = self->_headphonesAnnouncementRequestCapabilityManager;
  }
  return headphonesAnnouncementRequestCapabilityManager;
}

- (id)_requestDelayManager
{
  requestDelayManager = self->_requestDelayManager;
  if (!requestDelayManager)
  {
    id v4 = [[ADRequestDelayManager alloc] initWithQueue:self->_queue];
    BOOL v5 = self->_requestDelayManager;
    self->_requestDelayManager = v4;

    requestDelayManager = self->_requestDelayManager;
  }
  return requestDelayManager;
}

- (id)_deviceSyncCoordinator
{
  if (!self->_deviceSyncCoordinator && AFIsHorseman())
  {
    char v3 = objc_alloc_init(ADDeviceSyncCoordinator);
    deviceSyncCoordinator = self->_deviceSyncCoordinator;
    self->_deviceSyncCoordinator = v3;
  }
  BOOL v5 = self->_deviceSyncCoordinator;
  return v5;
}

- (id)_remoteSpeechRequestHelper
{
  remoteSpeechRequestHelper = self->_remoteSpeechRequestHelper;
  if (!remoteSpeechRequestHelper)
  {
    id v4 = objc_alloc_init(ADRemoteSpeechRequestHelper);
    BOOL v5 = self->_remoteSpeechRequestHelper;
    self->_remoteSpeechRequestHelper = v4;

    remoteSpeechRequestHelper = self->_remoteSpeechRequestHelper;
  }
  return remoteSpeechRequestHelper;
}

- (id)_remoteRequestHelper
{
  remoteRequestHelper = self->_remoteRequestHelper;
  if (!remoteRequestHelper)
  {
    id v4 = [[ADRemoteRequestHelper alloc] initWithQueue:self->_queue];
    BOOL v5 = self->_remoteRequestHelper;
    self->_remoteRequestHelper = v4;

    remoteRequestHelper = self->_remoteRequestHelper;
  }
  return remoteRequestHelper;
}

- (id)_powerAssertionManager
{
  powerAssertionManager = self->_powerAssertionManager;
  if (!powerAssertionManager)
  {
    id v4 = (AFPowerAssertionManager *)[objc_alloc((Class)AFPowerAssertionManager) initWithIdentifier:@"com.apple.assistand"];
    BOOL v5 = self->_powerAssertionManager;
    self->_powerAssertionManager = v4;

    powerAssertionManager = self->_powerAssertionManager;
  }
  return powerAssertionManager;
}

- (id)_diagnosticsManager
{
  diagnosticsManager = self->_diagnosticsManager;
  if (!diagnosticsManager)
  {
    id v4 = [ADDiagnosticsManager alloc];
    BOOL v5 = [(ADCommandCenter *)self _queue];
    int v6 = [(ADDiagnosticsManager *)v4 initWithQueue:v5];
    id v7 = self->_diagnosticsManager;
    self->_diagnosticsManager = v6;

    diagnosticsManager = self->_diagnosticsManager;
  }
  return diagnosticsManager;
}

- (id)_resultObjectCache
{
  resultObjectCache = self->_resultObjectCache;
  if (!resultObjectCache)
  {
    id v4 = objc_alloc_init(ADResultObjectCache);
    BOOL v5 = self->_resultObjectCache;
    self->_resultObjectCache = v4;

    resultObjectCache = self->_resultObjectCache;
  }
  return resultObjectCache;
}

- (id)_sessionManager
{
  sessionManager = self->_sessionManager;
  if (!sessionManager)
  {
    id v4 = [ADSessionManager alloc];
    BOOL v5 = [(ADCommandCenter *)self _queue];
    int v6 = [(ADCommandCenter *)self _account];
    id v7 = [(ADSessionManager *)v4 initOnQueue:v5 account:v6 instanceContext:self->_instanceContext];
    id v8 = self->_sessionManager;
    self->_sessionManager = v7;

    [(ADSessionManager *)self->_sessionManager setDelegate:self];
    id v9 = self->_sessionManager;
    int v10 = [(ADCommandCenter *)self _requestDelayManager];
    [(ADSessionManager *)v9 setInterceptor:v10];

    [(ADCommandCenter *)self _awdSessionStart];
    sessionManager = self->_sessionManager;
  }
  return sessionManager;
}

- (ADRequestDispatcherService)_requestDispatcherService
{
  requestDispatcherService = self->_requestDispatcherService;
  if (!requestDispatcherService)
  {
    id v4 = [ADRequestDispatcherService alloc];
    BOOL v5 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", self->_uiBridgeServiceListener, 0);
    int v6 = [(ADRequestDispatcherService *)v4 initWithBridgeConnectionListeners:v5];
    id v7 = self->_requestDispatcherService;
    self->_requestDispatcherService = v6;

    requestDispatcherService = self->_requestDispatcherService;
  }
  return requestDispatcherService;
}

- (id)_serviceManager
{
  serviceManager = self->_serviceManager;
  if (!serviceManager)
  {
    id v4 = [[ADServiceManager alloc] initWithInstanceContext:self->_instanceContext];
    BOOL v5 = self->_serviceManager;
    self->_serviceManager = v4;

    int v6 = self->_serviceManager;
    id v7 = objc_alloc_init(ADSystemService);
    [(ADServiceManager *)v6 addService:v7];

    id v8 = self->_serviceManager;
    id v9 = objc_alloc_init(ADHomeKitService);
    [(ADServiceManager *)v8 addService:v9];

    int v10 = self->_serviceManager;
    int v11 = objc_alloc_init(ADGenericIntentService);
    [(ADServiceManager *)v10 addService:v11];

    int v12 = self->_serviceManager;
    id v13 = objc_alloc_init(ADDeleteSyncDataService);
    [(ADServiceManager *)v12 addService:v13];

    if (AFIsHorseman())
    {
      id v14 = self->_serviceManager;
      BOOL v15 = objc_alloc_init(ADCompanionRoutingService);
      [(ADServiceManager *)v14 addService:v15];

      unsigned int v16 = self->_serviceManager;
      id v17 = objc_alloc_init(ADCompanionRoutingPhoneService);
      [(ADServiceManager *)v16 addService:v17];
    }
    [(ADCommandCenter *)self _registerDomainSignalServiceWithServiceManager:self->_serviceManager];
    if (AFIsNano()) {
      [(ADCommandCenter *)self _registerNanoServicesWithServiceManager:self->_serviceManager];
    }
    id v18 = self->_serviceManager;
    id v19 = [ADSettingsService alloc];
    BOOL v20 = [(ADCommandCenter *)self _speechManager];
    uint64_t v21 = [v20 recordingInfoProvider];
    id v22 = [(ADSettingsService *)v19 initWithRecordingInfoProvider:v21 instanceContext:self->_instanceContext];
    [(ADServiceManager *)v18 addService:v22];

    id v23 = self->_serviceManager;
    BOOL v24 = objc_alloc_init(ADExtensionService);
    [(ADServiceManager *)v23 addService:v24];

    if (!self->_fauxUIService)
    {
      int v25 = objc_alloc_init(ADFauxUIService);
      fauxUIService = self->_fauxUIService;
      self->_fauxUIService = v25;

      [(ADServiceManager *)self->_serviceManager addService:self->_fauxUIService];
    }
    __int16 v27 = [(ADCommandCenter *)self _speechManager];
    id v28 = [v27 volumeTracker];

    __int16 v29 = [(ADServiceManager *)self->_serviceManager serviceForIdentifier:@"com.apple.mobileipod.assistant"];
    if (!v29)
    {
      id v30 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v40 = 136315138;
        id v41 = "-[ADCommandCenter _serviceManager]";
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s No Media plugin could be found, but one was expected. Please file a radar on Siri Frameworks.", (uint8_t *)&v40, 0xCu);
      }
    }
    id v31 = self->_serviceManager;
    id v32 = [ADMediaRemoteService alloc];
    id v33 = [(ADCommandCenter *)self _queue];
    int v34 = [(ADMediaRemoteService *)v32 initWithQueue:v33 volumeTracker:v28 whaService:v29];
    [(ADServiceManager *)v31 addService:v34];

    __int16 v35 = self->_serviceManager;
    id v36 = [(ADCommandCenter *)self _requestDispatcherService];
    [(ADServiceManager *)v35 addService:v36];

    __int16 v37 = self->_serviceManager;
    id v38 = objc_opt_new();
    [(ADServiceManager *)v37 addService:v38];

    serviceManager = self->_serviceManager;
  }
  return serviceManager;
}

- (void)_registerDomainSignalServiceWithServiceManager:(id)a3
{
  id v3 = a3;
  int v10 = objc_alloc_init(ADAceDomainSignalRequestHandler);
  id v4 = [ADServiceCommandType alloc];
  BOOL v5 = [(ADServiceCommandType *)v4 initWithDomainName:SAGroupIdentifier className:SAAceDomainSignalClassIdentifier];
  int v6 = [ADSiriTaskService alloc];
  id v7 = objc_alloc_init(ADAcePassthroughRequestTransformer);
  id v8 = objc_alloc_init(ADAcePassthroughResponseTransformer);
  id v9 = [(ADSiriTaskService *)v6 initWithCommandType:v5 requestTransformer:v7 responseTransformer:v8 requestHandler:v10];
  [v3 addService:v9];
}

- (id)_domainObjectCache
{
  domainObjectCache = self->_domainObjectCache;
  if (!domainObjectCache)
  {
    id v4 = objc_alloc_init(ADDomainObjectCache);
    BOOL v5 = self->_domainObjectCache;
    self->_domainObjectCache = v4;

    domainObjectCache = self->_domainObjectCache;
  }
  return domainObjectCache;
}

- (void)_setUIService:(id)a3
{
  id v4 = (ADUIService *)a3;
  [(ADUIService *)self->_uiService setDelegate:0];
  uiService = self->_uiService;
  self->_uiService = v4;
  int v6 = v4;

  [(ADUIService *)self->_uiService setDelegate:self];
}

- (void)_removeAllPostCommandHandlingBlocks
{
  self->_postCommandHandlingBlockMap = 0;
  _objc_release_x1();
}

- (void)_removePostCommandHandlingBlocksForRequestId:(id)a3
{
  if (a3) {
    -[NSMutableDictionary removeObjectForKey:](self->_postCommandHandlingBlockMap, "removeObjectForKey:");
  }
}

- (void)_dispatchAndRemovePostCommandHandlingBlocksForCommandId:(id)a3 requestId:(id)a4
{
  id v6 = a3;
  if (v6 && a4)
  {
    id v7 = [(NSMutableDictionary *)self->_postCommandHandlingBlockMap objectForKey:a4];
    id v8 = [v7 objectForKey:v6];
    [v7 removeObjectForKey:v6];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        id v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * (void)v13) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * (void)v13));
          id v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void)_addPostCommandHandlingBlock:(id)a3 forCommandId:(id)a4 requestId:(id)a5
{
  id v8 = (void (**)(void))a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v8 && v9 && v10)
  {
    if ([(ADCommandCenter *)self _hasOutstandingRequestId:v10]
      || [(ADCommandCenter *)self _hasRootExecutionContextForRequestID:v11])
    {
      uint64_t v12 = [(ADCommandCenter *)self _handledCommandIdsForRequestId:v11];
      unsigned int v13 = [v12 containsObject:v9];

      if (v13)
      {
        v8[2](v8);
      }
      else
      {
        id v15 = [(NSMutableDictionary *)self->_postCommandHandlingBlockMap objectForKey:v11];
        if (!v15)
        {
          id v15 = objc_alloc_init((Class)NSMutableDictionary);
          postCommandHandlingBlockMap = self->_postCommandHandlingBlockMap;
          if (!postCommandHandlingBlockMap)
          {
            long long v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            id v18 = self->_postCommandHandlingBlockMap;
            self->_postCommandHandlingBlockMap = v17;

            postCommandHandlingBlockMap = self->_postCommandHandlingBlockMap;
          }
          [(NSMutableDictionary *)postCommandHandlingBlockMap setObject:v15 forKey:v11];
        }
        id v19 = [v15 objectForKey:v9];
        if (!v19)
        {
          id v19 = objc_alloc_init((Class)NSMutableArray);
          [v15 setObject:v19 forKey:v9];
        }
        BOOL v20 = objc_retainBlock(v8);
        [v19 addObject:v20];
      }
    }
    else
    {
      uint64_t v21 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v22 = 136315650;
        id v23 = "-[ADCommandCenter _addPostCommandHandlingBlock:forCommandId:requestId:]";
        __int16 v24 = 2112;
        id v25 = v9;
        __int16 v26 = 2112;
        __int16 v27 = v11;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s Ignored post command handling block for command id %@ because request id %@ is unknown.", (uint8_t *)&v22, 0x20u);
      }
    }
  }
  else
  {
    long long v14 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v22 = 136315138;
      id v23 = "-[ADCommandCenter _addPostCommandHandlingBlock:forCommandId:requestId:]";
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Ignored because commandId, requestId and block are all required.", (uint8_t *)&v22, 0xCu);
    }
  }
}

- (id)_handledCommandIdsForRequestId:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(ADCommandCenter *)self _hasOutstandingRequestId:v4]
      || [(ADCommandCenter *)self _hasRootExecutionContextForRequestID:v4])
    {
      BOOL v5 = [(NSMutableDictionary *)self->_handledCommandIdsByRequestId objectForKey:v4];
      id v6 = v5;
      if (v5)
      {
        id v7 = [v5 copy];
      }
      else
      {
        id v7 = +[NSSet set];
      }
      id v8 = v7;

      goto LABEL_11;
    }
    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315394;
      uint64_t v12 = "-[ADCommandCenter _handledCommandIdsForRequestId:]";
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Ignored because request id %@ is unknown.", (uint8_t *)&v11, 0x16u);
    }
  }
  id v8 = 0;
LABEL_11:

  return v8;
}

- (void)_removeAllHandledCommandIds
{
  self->_handledCommandIdsByRequestId = 0;
  _objc_release_x1();
}

- (void)_removeHandledCommandIdsForRequestId:(id)a3
{
  if (a3) {
    -[NSMutableDictionary removeObjectForKey:](self->_handledCommandIdsByRequestId, "removeObjectForKey:");
  }
}

- (void)_addHandledCommandId:(id)a3 forRequestId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    if ([(ADCommandCenter *)self _hasOutstandingRequestId:v7]
      || [(ADCommandCenter *)self _hasRootExecutionContextForRequestID:v8])
    {
      handledCommandIdsByRequestId = self->_handledCommandIdsByRequestId;
      if (!handledCommandIdsByRequestId)
      {
        id v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        int v11 = self->_handledCommandIdsByRequestId;
        self->_handledCommandIdsByRequestId = v10;

        handledCommandIdsByRequestId = self->_handledCommandIdsByRequestId;
      }
      id v12 = [(NSMutableDictionary *)handledCommandIdsByRequestId objectForKey:v8];
      if (!v12)
      {
        id v12 = objc_alloc_init((Class)NSMutableSet);
        [(NSMutableDictionary *)self->_handledCommandIdsByRequestId setObject:v12 forKey:v8];
      }
      [v12 addObject:v6];
    }
    else
    {
      __int16 v13 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v14 = 136315650;
        id v15 = "-[ADCommandCenter _addHandledCommandId:forRequestId:]";
        __int16 v16 = 2112;
        id v17 = v6;
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Ignored command id %@ because request id %@ is unknown.", (uint8_t *)&v14, 0x20u);
      }
    }
  }
}

- (void)_invokeAllCompletionsWithError:(id)a3
{
  id v4 = a3;
  BOOL v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v23 = "-[ADCommandCenter _invokeAllCompletionsWithError:]";
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s error = %@", buf, 0x16u);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = self->_aceCompletionMap;
  id v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v18;
    *(void *)&long long v8 = 136315394;
    long long v16 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        __int16 v13 = -[NSMutableDictionary objectForKey:](self->_aceCompletionMap, "objectForKey:", v12, v16, (void)v17);
        int v14 = v13;
        if (v13)
        {
          if (([v13 invokeWithValue:0 andValue:v4] & 1) == 0)
          {
            id v15 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = v16;
              id v23 = "-[ADCommandCenter _invokeAllCompletionsWithError:]";
              __int16 v24 = 2112;
              id v25 = v12;
              _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Attempting to invoke completion block for command with msgId %@ again", buf, 0x16u);
            }
          }
        }
      }
      id v9 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  [(NSMutableDictionary *)self->_aceCompletionMap removeAllObjects];
}

- (void)_invokeCompletionForCommand:(id)a3
{
  id v4 = a3;
  BOOL v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    int v11 = "-[ADCommandCenter _invokeCompletionForCommand:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s command = %@", (uint8_t *)&v10, 0x16u);
  }
  id v6 = [v4 refId];
  if (v6)
  {
    id v7 = [(NSMutableDictionary *)self->_aceCompletionMap objectForKey:v6];
    long long v8 = v7;
    if (v7)
    {
      if (([v7 invokeWithValue:v4 andValue:0] & 1) == 0)
      {
        id v9 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          int v10 = 136315394;
          int v11 = "-[ADCommandCenter _invokeCompletionForCommand:]";
          __int16 v12 = 2112;
          id v13 = v6;
          _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Attempting to invoke completion block for command with msgId %@ again", (uint8_t *)&v10, 0x16u);
        }
      }
      [(NSMutableDictionary *)self->_aceCompletionMap removeObjectForKey:v6];
    }
  }
}

- (BOOL)_hasCompletionForCommandId:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_aceCompletionMap objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_addCompletion:(id)a3 forCommand:(id)a4 forKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = v10;
  if (v8 && v9 && v10)
  {
    if (!self->_aceCompletionMap)
    {
      __int16 v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      aceCompletionMap = self->_aceCompletionMap;
      self->_aceCompletionMap = v12;
    }
    int v14 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      __int16 v24 = "-[ADCommandCenter _addCompletion:forCommand:forKey:]";
      __int16 v25 = 2112;
      __int16 v26 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Adding completion for %@", buf, 0x16u);
    }
    id v15 = objc_alloc((Class)AFTwoArgumentSafetyBlock);
    long long v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    long long v19 = sub_1001F6134;
    long long v20 = &unk_100509690;
    id v21 = v9;
    id v22 = v8;
    id v16 = [v15 initWithBlock:&v17];
    -[NSMutableDictionary setObject:forKey:](self->_aceCompletionMap, "setObject:forKey:", v16, v11, v17, v18, v19, v20);
  }
}

- (void)_clearAllExecutionDevices
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    id v6 = "-[ADCommandCenter _clearAllExecutionDevices]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }
  executionDevicesByExecutionID = self->_executionDevicesByExecutionID;
  self->_executionDevicesByExecutionID = 0;
}

- (void)_removeExecutionDevicesForLocalRequestWithId:(id)a3
{
  id v4 = a3;
  int v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    id v7 = "-[ADCommandCenter _removeExecutionDevicesForLocalRequestWithId:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  [(NSMutableDictionary *)self->_executionDevicesByExecutionID removeObjectForKey:v4];
}

- (id)_executionDevicesForLocalRequestWithId:(id)a3
{
  return [(NSMutableDictionary *)self->_executionDevicesByExecutionID objectForKey:a3];
}

- (void)_addExecutionDevice:(id)a3 forCommandExecutionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = v7;
  if (v6 && v7)
  {
    id v9 = [v7 info];
    id v10 = [v9 executionID];

    if (v10)
    {
      executionDevicesByExecutionID = self->_executionDevicesByExecutionID;
      if (!executionDevicesByExecutionID)
      {
        __int16 v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        id v13 = self->_executionDevicesByExecutionID;
        self->_executionDevicesByExecutionID = v12;

        executionDevicesByExecutionID = self->_executionDevicesByExecutionID;
      }
      id v14 = [(NSMutableDictionary *)executionDevicesByExecutionID objectForKey:v10];
      if (!v14)
      {
        id v14 = objc_alloc_init((Class)NSMutableArray);
        [(NSMutableDictionary *)self->_executionDevicesByExecutionID setObject:v14 forKey:v10];
      }
      id v15 = [v6 afPeerInfo];
      id v16 = +[ADDeviceCircleManager sharedInstance];
      uint64_t v17 = [v16 managedPeerInfoMatchingPeerInfo:v15];
      uint64_t v18 = (void *)v17;
      if (v17) {
        long long v19 = (void *)v17;
      }
      else {
        long long v19 = v15;
      }
      id v20 = v19;

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v21 = v14;
      id v22 = [v21 countByEnumeratingWithState:&v28 objects:v38 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v29;
        while (2)
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v29 != v24) {
              objc_enumerationMutation(v21);
            }
            if (sub_100174BB8(v20, *(void **)(*((void *)&v28 + 1) + 8 * i)))
            {

              goto LABEL_23;
            }
          }
          id v23 = [v21 countByEnumeratingWithState:&v28 objects:v38 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }

      __int16 v26 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 136315650;
        id v33 = "-[ADCommandCenter _addExecutionDevice:forCommandExecutionContext:]";
        __int16 v34 = 2112;
        id v35 = v20;
        __int16 v36 = 2112;
        __int16 v37 = v8;
        _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%s Added %@ for %@", buf, 0x20u);
      }
      objc_msgSend(v21, "addObject:", v20, (void)v28);
LABEL_23:
    }
    else
    {
      __int16 v27 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315394;
        id v33 = "-[ADCommandCenter _addExecutionDevice:forCommandExecutionContext:]";
        __int16 v34 = 2112;
        id v35 = v8;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s Missing executionID for %@", buf, 0x16u);
      }
    }
  }
}

- (void)_endRemoteExecutionContext:(id)a3
{
  id v4 = a3;
  int v5 = [v4 info];
  id v6 = [v5 executionID];

  if (v6)
  {
    id v7 = [(NSMutableDictionary *)self->_remoteExecutionContextsByExecutionID objectForKey:v6];

    if (v7)
    {
      __int16 v8 = [(ADCommandCenter *)self _powerAssertionManager];
      [v8 releasePowerAssertionWithName:v6];

      [(NSMutableDictionary *)self->_remoteExecutionContextsByExecutionID removeObjectForKey:v6];
      if (![(NSMutableDictionary *)self->_remoteExecutionContextsByExecutionID count])
      {
        remoteExecutionContextsByExecutionID = self->_remoteExecutionContextsByExecutionID;
        self->_remoteExecutionContextsByExecutionID = 0;
      }
      id v10 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v11 = 136315394;
        __int16 v12 = "-[ADCommandCenter _endRemoteExecutionContext:]";
        __int16 v13 = 2112;
        id v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s context = %@", (uint8_t *)&v11, 0x16u);
      }
    }
  }
}

- (id)_beginRemoteExecutionContextForCommand:(id)a3 fromPeer:(id)a4 withRemoteExecutionInfo:(id)a5
{
  id v7 = (ADCommandExecutionContext *)a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315906;
    BOOL v42 = "-[ADCommandCenter _beginRemoteExecutionContextForCommand:fromPeer:withRemoteExecutionInfo:]";
    __int16 v43 = 2112;
    id v44 = v7;
    __int16 v45 = 2112;
    id v46 = v8;
    __int16 v47 = 2112;
    id v48 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s command = %@, peer = %@, remoteExecutionInfo = %@", buf, 0x2Au);
  }
  id v11 = objc_alloc_init((Class)NSUUID);
  __int16 v36 = [v11 UUIDString];

  __int16 v12 = [v9 currentHomeInfo];
  CFStringRef v39 = v7;
  if (AFIsHorseman())
  {
    int v40 = v12;
  }
  else
  {
    __int16 v13 = +[ADHomeInfoManager sharedInfoManager];
    id v14 = [v9 currentHomeInfo];
    uint64_t v15 = [v13 updatedHomeInfoForRootInfo:v14];

    int v40 = (void *)v15;
  }
  __int16 v34 = [ADCommandExecutionContext alloc];
  id v33 = objc_alloc((Class)AFCommandExecutionInfo);
  id v32 = [v9 requestID];
  id v16 = [v9 turnId];
  id v38 = v8;
  uint64_t v17 = [v8 afPeerInfo];
  uint64_t v18 = [v9 endpointInfo];
  long long v31 = [v9 instanceInfo];
  long long v19 = [v9 speechInfo];
  id v20 = [v9 requestHandlingContextSnapshot];
  id v21 = [v9 deviceRestrictions];
  id v22 = [v9 userInfo];
  id v23 = (void *)v17;
  id v24 = [v33 initWithExecutionID:v36 requestID:v32 turnId:v16 originPeerInfo:v17 currentHomeInfo:v40 endpointInfo:v18 instanceInfo:v31 speechInfo:v19 requestHandlingContextSnapshot:v20 deviceRestrictions:v21 userInfo:v22];
  id v35 = [(ADCommandExecutionContext *)v34 initWithInfo:v24];

  remoteExecutionContextsByExecutionID = self->_remoteExecutionContextsByExecutionID;
  if (!remoteExecutionContextsByExecutionID)
  {
    __int16 v26 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    __int16 v27 = self->_remoteExecutionContextsByExecutionID;
    self->_remoteExecutionContextsByExecutionID = v26;

    remoteExecutionContextsByExecutionID = self->_remoteExecutionContextsByExecutionID;
  }
  [(NSMutableDictionary *)remoteExecutionContextsByExecutionID setObject:v35 forKey:v36];
  long long v28 = [(ADCommandCenter *)self _powerAssertionManager];
  [v28 takePowerAssertionWithName:v36];

  long long v29 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    BOOL v42 = "-[ADCommandCenter _beginRemoteExecutionContextForCommand:fromPeer:withRemoteExecutionInfo:]";
    __int16 v43 = 2112;
    id v44 = v35;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }

  return v35;
}

- (BOOL)_hasRemoteExecutionContextForRequestID:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v5 = [(NSMutableDictionary *)self->_remoteExecutionContextsByExecutionID allValues];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) info];
        id v10 = [v9 requestID];
        unsigned __int8 v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (id)_remoteExecutionContextForExecutionID:(id)a3
{
  if (a3)
  {
    id v4 = -[NSMutableDictionary objectForKey:](self->_remoteExecutionContextsByExecutionID, "objectForKey:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (BOOL)_hasRemoteExecutionContextForExecutionID:(id)a3
{
  uint64_t v3 = [(ADCommandCenter *)self _remoteExecutionContextForExecutionID:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_destroyRootExecutionContextForRequestID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v5 = [(NSMutableDictionary *)self->_rootExecutionContextsByRequestID objectForKey:v4];
    if (v5)
    {
      [(NSMutableDictionary *)self->_rootExecutionContextsByRequestID removeObjectForKey:v4];
      if (![(NSMutableDictionary *)self->_rootExecutionContextsByRequestID count])
      {
        rootExecutionContextsByRequestID = self->_rootExecutionContextsByRequestID;
        self->_rootExecutionContextsByRequestID = 0;
      }
      uint64_t v7 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v8 = 136315394;
        id v9 = "-[ADCommandCenter _destroyRootExecutionContextForRequestID:]";
        __int16 v10 = 2112;
        unsigned __int8 v11 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s context = %@", (uint8_t *)&v8, 0x16u);
      }
    }
  }
}

- (void)_createRootExecutionContextForRequestID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v5 = [(NSMutableDictionary *)self->_rootExecutionContextsByRequestID objectForKey:v4];

    if (!v5)
    {
      if (!self->_rootExecutionContextsByRequestID)
      {
        id v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        rootExecutionContextsByRequestID = self->_rootExecutionContextsByRequestID;
        self->_rootExecutionContextsByRequestID = v6;
      }
      int v8 = +[ADDeviceCircleManager sharedInstance];
      id v9 = [v8 localPeerInfo];

      id v10 = objc_alloc((Class)AFRequestHandlingContext);
      unsigned __int8 v11 = [v9 idsDeviceUniqueIdentifier];
      __int16 v12 = [v9 assistantIdentifier];
      id v13 = [v10 initWithRequestID:v4 inputDeviceID:v11 inputAssistantID:v12];

      if (AFIsHorseman())
      {
        long long v14 = +[ADHomeInfoManager sharedInfoManager];
        long long v15 = [v14 rootAfHomeInfoForThisDevice];
      }
      else
      {
        long long v15 = 0;
      }
      id v16 = objc_alloc((Class)AFCommandExecutionInfo);
      uint64_t v17 = [(AFRequestInfo *)self->_currentRequestInfo turnIdentifier];
      uint64_t v18 = [(AFInstanceContext *)self->_instanceContext info];
      long long v19 = [(ADCommandCenter *)self _restrictedCommands];
      id v20 = [v16 initWithExecutionID:v4 requestID:v4 turnId:v17 originPeerInfo:0 currentHomeInfo:v15 endpointInfo:0 instanceInfo:v18 speechInfo:0 requestHandlingContextSnapshot:v13 deviceRestrictions:v19 userInfo:0];

      id v21 = [[ADCommandExecutionContext alloc] initWithInfo:v20];
      [(NSMutableDictionary *)self->_rootExecutionContextsByRequestID setObject:v21 forKey:v4];
      objc_storeStrong((id *)&self->_mostRecentRootExecutionContext, v21);
      objc_initWeak(&location, self);
      dispatch_time_t v22 = dispatch_time(0, 305000000000);
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001F71D4;
      block[3] = &unk_10050B790;
      objc_copyWeak(&v26, &location);
      dispatch_after(v22, queue, block);
      id v24 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315394;
        long long v29 = "-[ADCommandCenter _createRootExecutionContextForRequestID:]";
        __int16 v30 = 2112;
        long long v31 = v21;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
      }
      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
  }
}

- (id)_rootExecutionContextForRequestID:(id)a3
{
  if (a3)
  {
    id v4 = -[NSMutableDictionary objectForKey:](self->_rootExecutionContextsByRequestID, "objectForKey:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (BOOL)_hasRootExecutionContextForRequestID:(id)a3
{
  uint64_t v3 = [(ADCommandCenter *)self _rootExecutionContextForRequestID:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (NSDictionary)rootExecutionContexts
{
  return (NSDictionary *)self->_rootExecutionContextsByRequestID;
}

- (id)_executionContextMatchingExecutionInfo:(id)a3 fallbackRequestID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_4;
  }
  int v8 = [v6 requestID];
  id v9 = [(ADCommandCenter *)self _rootExecutionContextForRequestID:v8];

  if (!v9)
  {
    id v10 = [v6 executionID];
    id v9 = [(ADCommandCenter *)self _remoteExecutionContextForExecutionID:v10];

    if (!v9)
    {
LABEL_4:
      id v9 = [(ADCommandCenter *)self _rootExecutionContextForRequestID:v7];
    }
  }

  return v9;
}

- (BOOL)_hasOutstandingRequests
{
  return [(NSMutableSet *)self->_outstandingRequestIds count] != 0;
}

- (BOOL)_hasOutstandingRequestId:(id)a3
{
  if (a3) {
    return -[NSMutableSet containsObject:](self->_outstandingRequestIds, "containsObject:");
  }
  else {
    return 0;
  }
}

- (void)_removeOutstandingRequestId:(id)a3 forReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    id v10 = "-[ADCommandCenter _removeOutstandingRequestId:forReason:]";
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s requestId = %@, reason = %@", (uint8_t *)&v9, 0x20u);
  }
  if (v6)
  {
    [(ADCommandCenter *)self _removeHandledCommandIdsForRequestId:v6];
    [(ADCommandCenter *)self _removePostCommandHandlingBlocksForRequestId:v6];
    [(ADCommandCenter *)self _destroyRootExecutionContextForRequestID:v6];
    [(NSMutableSet *)self->_outstandingRequestIds removeObject:v6];
  }
}

- (void)_addOutstandingRequestId:(id)a3 forReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315650;
    __int16 v13 = "-[ADCommandCenter _addOutstandingRequestId:forReason:]";
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s requestId = %@, reason = %@", (uint8_t *)&v12, 0x20u);
  }
  if (v6)
  {
    outstandingRequestIds = self->_outstandingRequestIds;
    if (!outstandingRequestIds)
    {
      id v10 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      __int16 v11 = self->_outstandingRequestIds;
      self->_outstandingRequestIds = v10;

      outstandingRequestIds = self->_outstandingRequestIds;
    }
    [(NSMutableSet *)outstandingRequestIds addObject:v6];
    [(ADCommandCenter *)self _createRootExecutionContextForRequestID:v6];
  }
}

- (void)dealloc
{
  [(ADSessionManager *)self->_sessionManager setDelegate:0];
  [(ADSessionManager *)self->_sessionManager cancel];
  [(ADSpeechManager *)self->_speechManager setDelegate:0];
  [(ADCommandCenter *)self _context_reset];
  [(ADLocationManager *)self->_locationManager setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)ADCommandCenter;
  [(ADCommandCenter *)&v3 dealloc];
}

- (ADCommandCenter)init
{
  v25.receiver = self;
  v25.super_class = (Class)ADCommandCenter;
  id v2 = [(ADCommandCenter *)&v25 init];
  if (v2)
  {
    dispatch_group_t v3 = dispatch_group_create();
    BOOL v4 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v3;

    int v5 = (id)qword_100585E48;
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UNSPECIFIED, 0);

    dispatch_queue_t v8 = dispatch_queue_create_with_target_V2("ADCommandCenterQueue", v7, v5);
    int v9 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v8;

    *((void *)v2 + 65) = 0;
    uint64_t v10 = +[AFInstanceContext currentContext];
    __int16 v11 = (void *)*((void *)v2 + 86);
    *((void *)v2 + 86) = v10;

    id v12 = objc_alloc_init((Class)AIMLExperimentationAnalyticsManager);
    __int16 v13 = (void *)*((void *)v2 + 88);
    *((void *)v2 + 88) = v12;

    __int16 v14 = +[AFPreferences sharedPreferences];
    id v15 = [v14 assistantIsEnabled];
    unsigned int v16 = [v14 dictationIsEnabled];
    id v17 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      __int16 v27 = "-[ADCommandCenter init]";
      __int16 v28 = 1024;
      unsigned int v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s assistantIsEnabled = %d", buf, 0x12u);
      id v17 = AFSiriLogContextDaemon;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      __int16 v27 = "-[ADCommandCenter init]";
      __int16 v28 = 1024;
      unsigned int v29 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s dictationIsEnabled = %d", buf, 0x12u);
    }
    [v2 _createAssistantLocallyIfNeeded:v15];
    uint64_t v18 = +[ADPreferences sharedPreferences];
    [v18 setDeviceWasRedirectedToProduction:0];

    long long v19 = *((void *)v2 + 1);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1001F7A90;
    v21[3] = &unk_100505AD0;
    char v23 = (char)v15;
    char v24 = v16;
    id v22 = v2;
    dispatch_async(v19, v21);
  }
  return (ADCommandCenter *)v2;
}

+ (int)_orchBluetoothStateEnumFromBluetoothState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 9) {
    return 0;
  }
  else {
    return dword_1003E2BB8[a3 - 1];
  }
}

+ (int64_t)_fetchBluetoothState
{
  id v7 = 0;
  id v2 = +[CBController controllerInfoAndReturnError:&v7];
  id v3 = v7;
  if (v3)
  {
    BOOL v4 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315394;
      int v9 = "+[ADCommandCenter _fetchBluetoothState]";
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s Failed to fetch bluetooth controller info when logging bluetooth status: %@", buf, 0x16u);
    }
  }
  id v5 = [v2 bluetoothState];

  return (int64_t)v5;
}

+ (id)sharedQueue
{
  id v2 = [a1 sharedCommandCenter];
  id v3 = [v2 _queue];

  return v3;
}

+ (id)sharedCommandCenter
{
  if (qword_100585DD8 != -1) {
    dispatch_once(&qword_100585DD8, &stru_100505AA8);
  }
  id v2 = (void *)qword_100585DD0;
  return v2;
}

- (void)acousticIDHelper:(id)a3 didCompleteSessionSuccessfully:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    id v11 = "-[ADCommandCenter(AcousticId) acousticIDHelper:didCompleteSessionSuccessfully:]";
    __int16 v12 = 1024;
    BOOL v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v10, 0x12u);
  }
  id v7 = [(ADCommandCenter *)self _speechManager];
  [v7 stopFingerprintingForSuccess:v4];
  id v8 = [objc_alloc((Class)AFSpeechRequestOptions) initWithActivationEvent:5];
  [v8 setSuppressStopAlert:v4];
  [v7 stopSpeechCaptureIfFingerprintingOnlyWithOptions:v8];
  int v9 = [(ADCommandCenter *)self _currentClient];
  [v9 adAcousticIDRequestDidFinishSuccessfully:v4];
}

- (void)acousticIDHelperDidStartSession:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    id v8 = "-[ADCommandCenter(AcousticId) acousticIDHelperDidStartSession:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [v4 currentSession];
  [(ADCommandCenter *)self _sendCommandToServer:v6];
}

- (void)_saAIRetrySearch:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    id v11 = "-[ADCommandCenter(AcousticId) _saAIRetrySearch:completion:]";
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v10, 0x16u);
  }
  int v9 = [(ADCommandCenter *)self _acousticIDHelper];
  [v9 handleRetrySearch:v6];

  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)_saAISearchCompleted:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v20 = "-[ADCommandCenter(AcousticId) _saAISearchCompleted:completion:]";
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  int v9 = [(ADCommandCenter *)self _speechManager];
  [v9 setFingerprintWasRecognized];

  if (_AFPreferencesAcousticIDAutoEndpoint()
    && ![(ADCommandCenter *)self _speechDelegateHasReceivedPartialResult]
    && !self->_partialResultAcousticIDTimer)
  {
    int v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v20 = "-[ADCommandCenter(AcousticId) _saAISearchCompleted:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Scheduling partial result acoustic ID timer", buf, 0xCu);
    }
    id v11 = [(ADCommandCenter *)self _queue];
    __int16 v12 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v11);
    partialResultAcousticIDTimer = self->_partialResultAcousticIDTimer;
    self->_partialResultAcousticIDTimer = v12;

    __int16 v14 = self->_partialResultAcousticIDTimer;
    dispatch_time_t v15 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0);
    unsigned int v16 = self->_partialResultAcousticIDTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1002100C8;
    handler[3] = &unk_10050E138;
    handler[4] = self;
    dispatch_source_set_event_handler(v16, handler);
    dispatch_resume((dispatch_object_t)self->_partialResultAcousticIDTimer);
  }
  id v17 = [(ADCommandCenter *)self _acousticIDHelper];
  [v17 handleSearchCompleted:v6];

  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)_saAIRequestSearch:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315394;
    id v13 = "-[ADCommandCenter(AcousticId) _saAIRequestSearch:completion:]";
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v12, 0x16u);
  }
  int v9 = [(ADCommandCenter *)self _currentClient];
  [v9 adAcousticIDRequestWillStart];
  id v10 = [objc_alloc((Class)AFSpeechRequestOptions) initWithActivationEvent:5];
  id v11 = [v6 acousticIdSearchSessionId];
  [(ADCommandCenter *)self _startAcousticIDRequestWithDelegate:v9 withOptions:v10 context:v11];

  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)_acousticId_clearPartialResultTimer
{
  partialResultAcousticIDTimer = self->_partialResultAcousticIDTimer;
  if (partialResultAcousticIDTimer)
  {
    dispatch_source_cancel(partialResultAcousticIDTimer);
    id v4 = self->_partialResultAcousticIDTimer;
    self->_partialResultAcousticIDTimer = 0;
  }
}

- (void)_acousticId_reset
{
}

- (void)_acousticId_sessionFailed
{
}

- (void)_acousticId_commandFailed:(id)a3
{
  id v7 = a3;
  id v4 = [(ADCommandCenter *)self _acousticIDHelper];
  id v5 = [v7 refId];
  unsigned int v6 = [v4 hasRelatedCommandForRefId:v5];

  if (v6) {
    [v4 handleCommandFailed:v7];
  }
}

- (void)_acousticId_speechCaptureCompleted
{
  uint64_t v3 = [(ADAcousticIDHelper *)self->_acousticIDHelper currentSession];
  if (v3)
  {
    id v4 = (void *)v3;
    unsigned __int8 v5 = [(ADAcousticIDHelper *)self->_acousticIDHelper sessionIsComplete];

    if ((v5 & 1) == 0)
    {
      unsigned int v6 = [(ADAcousticIDHelper *)self->_acousticIDHelper cancelSessionCommand];
      [(ADCommandCenter *)self _sendCommandToServer:v6];

      acousticIDHelper = self->_acousticIDHelper;
      [(ADAcousticIDHelper *)acousticIDHelper failCurrentSession];
    }
  }
}

- (BOOL)_acousticId_hasCommandForRefId:(id)a3
{
  return [(ADAcousticIDHelper *)self->_acousticIDHelper hasRelatedCommandForRefId:a3];
}

- (void)_acousticId_musicWasDetected
{
  uint64_t v3 = [(ADAcousticIDHelper *)self->_acousticIDHelper currentSession];

  if (!v3)
  {
    id v4 = [(ADCommandCenter *)self _speechManager];
    unsigned __int8 v5 = [v4 context];
    unsigned int v6 = [v5 aceId];
    [(ADCommandCenter *)self _acousticId_startSessionForSpeechRequest:v6];

    id v7 = [(ADCommandCenter *)self _currentClient];
    [v7 adMusicWasDetected];
  }
}

- (void)_acousticId_handleFingerprint:(id)a3 duration:(double)a4
{
  id v6 = a3;
  id v7 = [(ADCommandCenter *)self _acousticIDHelper];
  if ([v7 shouldSendFingerprintForDuration:a4])
  {
    id v8 = [v7 searchCommandForFingerprintData:v6 withDuration:a4];
    [(ADCommandCenter *)self _sendCommandToServer:v8];
  }
  else
  {
    int v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      id v11 = "-[ADCommandCenter(AcousticId) _acousticId_handleFingerprint:duration:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Not sending SAAISearch because aidHelper said not to", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_acousticId_startSessionForSpeechRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(ADCommandCenter *)self _acousticIDHelper];
  [v5 startNewAcousticIDSessionWithRequestId:0 refId:v4];
}

- (void)_acousticId_startSessionWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(ADCommandCenter *)self _acousticIDHelper];
  [v5 startNewAcousticIDSessionWithRequestId:v4 refId:0];
}

- (id)_acousticIDHelper
{
  acousticIDHelper = self->_acousticIDHelper;
  if (!acousticIDHelper)
  {
    id v4 = objc_alloc_init(ADAcousticIDHelper);
    id v5 = self->_acousticIDHelper;
    self->_acousticIDHelper = v4;

    [(ADAcousticIDHelper *)self->_acousticIDHelper setDelegate:self];
    acousticIDHelper = self->_acousticIDHelper;
  }
  return acousticIDHelper;
}

- (void)getSharedDataForPeer:(id)a3
{
  id v4 = a3;
  id v5 = [(ADCommandCenter *)self _queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_100258194;
  v7[3] = &unk_10050E188;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)sendGizmoData
{
  uint64_t v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    id v7 = "-[ADCommandCenter(SharedDataClient) sendGizmoData]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  sharedDataService = self->_sharedDataService;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002586C0;
  v5[3] = &unk_100508188;
  void v5[4] = self;
  [(ADSharedDataService *)sharedDataService deviceIsNearby:v5];
}

- (void)updateSharedDataWithCloudData:(id)a3 fromPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    id v15 = "-[ADCommandCenter(SharedDataClient) updateSharedDataWithCloudData:fromPeer:]";
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }
  if (v6)
  {
    int v9 = [(ADCommandCenter *)self _queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100258944;
    block[3] = &unk_10050DCB8;
    id v11 = v6;
    id v12 = v7;
    id v13 = self;
    dispatch_async(v9, block);
  }
}

- (void)_updateSharedDataFromPeers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v17 = "-[ADCommandCenter(SharedDataClient) _updateSharedDataFromPeers:completion:]";
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s peers: %@", buf, 0x16u);
  }
  int v9 = [(ADCommandCenter *)self _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100258CA8;
  block[3] = &unk_10050E1D8;
  id v13 = v6;
  __int16 v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)updateSharedDataFromCloudPeers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v16 = "-[ADCommandCenter(SharedDataClient) updateSharedDataFromCloudPeers:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  int v9 = [(ADCommandCenter *)self _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10025909C;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)_resetPeerAccountSettingsWithSharedData:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v50 = "-[ADCommandCenter(SharedDataClient) _resetPeerAccountSettingsWithSharedData:]";
    __int16 v51 = 2112;
    id v52 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  id v6 = [(ADCommandCenter *)self _queue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(ADCommandCenter *)self _account];
  id v8 = [v7 peerAssistantIdentifier];
  int v9 = [v4 assistantId];
  id v10 = v9;
  if (v8 == v9 || ([v9 isEqualToString:v8] & 1) != 0)
  {
    int v11 = 0;
  }
  else
  {
    id v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      id v50 = "-[ADCommandCenter(SharedDataClient) _resetPeerAccountSettingsWithSharedData:]";
      __int16 v51 = 2112;
      id v52 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Updating peer assistant id: %@", buf, 0x16u);
    }
    [v7 setPeerAssistantIdentifier:v10];
    int v11 = 1;
  }
  id v13 = [v7 peerSpeechIdentifier];

  id v14 = [v4 speechId];

  if (v13 != v14 && ([v14 isEqualToString:v13] & 1) == 0)
  {
    id v15 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      id v50 = "-[ADCommandCenter(SharedDataClient) _resetPeerAccountSettingsWithSharedData:]";
      __int16 v51 = 2112;
      id v52 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Updating peer speech id: %@", buf, 0x16u);
    }
    [v7 setPeerSpeechIdentifier:v14];
    int v11 = 1;
  }
  __int16 v16 = [v7 peerUserAgentString];

  id v17 = [v4 userAgent];

  if (v16 != v17 && ([v17 isEqualToString:v16] & 1) == 0)
  {
    __int16 v18 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      id v50 = "-[ADCommandCenter(SharedDataClient) _resetPeerAccountSettingsWithSharedData:]";
      __int16 v51 = 2112;
      id v52 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Updating peer user agent string: \"%@\"", buf, 0x16u);
    }
    [v7 setPeerUserAgentString:v17];
    int v11 = 1;
  }
  id v19 = [v7 peerLanguageCode];

  id v20 = [v4 languageCode];

  if (v19 != v20 && ([v20 isEqualToString:v19] & 1) == 0)
  {
    __int16 v21 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      id v50 = "-[ADCommandCenter(SharedDataClient) _resetPeerAccountSettingsWithSharedData:]";
      __int16 v51 = 2112;
      id v52 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s Updating peer language code: %@", buf, 0x16u);
    }
    [v7 setPeerLanguageCode:v20];
    int v11 = 1;
  }
  unsigned int v22 = [v7 peerSiriEnabled];
  id v23 = [v4 siriEnabled];
  if (v22 != v23)
  {
    [v7 setPeerSiriEnabled:v23];
    goto LABEL_27;
  }
  if (v11)
  {
LABEL_27:
    [v7 save];
    int v24 = 1;
    if (!v4) {
      goto LABEL_28;
    }
    goto LABEL_31;
  }
  int v24 = 0;
  if (!v4)
  {
LABEL_28:
    if (!v24) {
      goto LABEL_52;
    }
    goto LABEL_49;
  }
LABEL_31:
  int v48 = v24;
  if ((AFIsHorseman() & 1) == 0)
  {
    objc_super v25 = +[ADPreferences sharedPreferences];
    id v26 = [v25 languageCode];

    __int16 v27 = [v4 previousLanguageCode];
    if (v26 == v27 || [v26 isEqualToString:v27])
    {
      __int16 v28 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        id v50 = "-[ADCommandCenter(SharedDataClient) _resetPeerAccountSettingsWithSharedData:]";
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%s Setting new language code from cloud data", buf, 0xCu);
      }
      unsigned int v29 = [v4 languageCode];
      __int16 v30 = [v4 outputVoice];
      [(ADCommandCenter *)self _setLanguageCode:v29 outputVoice:v30];
    }
    else
    {
      __int16 v47 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        id v50 = "-[ADCommandCenter(SharedDataClient) _resetPeerAccountSettingsWithSharedData:]";
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "%s Not setting language code due to previous mismatch", buf, 0xCu);
      }
    }
  }
  id v31 = objc_alloc((Class)NSSet);
  id v32 = _AFPreferencesNotificationPreviewRestrictedApps();
  id v33 = [v31 initWithArray:v32];

  id v34 = objc_alloc((Class)NSSet);
  id v35 = [v4 notificationPreviewRestrictedApps];
  id v36 = [v34 initWithArray:v35];

  __int16 v37 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315650;
    id v50 = "-[ADCommandCenter(SharedDataClient) _resetPeerAccountSettingsWithSharedData:]";
    __int16 v51 = 2112;
    id v52 = v33;
    __int16 v53 = 2112;
    id v54 = v36;
    _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "%s current restricted: %@ new restricted: %@", buf, 0x20u);
  }
  if (([v33 isEqualToSet:v36] & 1) == 0)
  {
    id v38 = [v4 notificationPreviewRestrictedApps];
    _AFPreferencesSetNotificationPreviewRestrictedApps();
  }
  CFStringRef v39 = [v4 temperatureUnit];
  if (v39)
  {
    int v40 = self;
    id v41 = +[NSLocale currentLocale];
    BOOL v42 = objc_msgSend(v41, "af_aceTemperatureUnit");

    if (([v39 isEqualToString:v42] & 1) == 0)
    {
      __int16 v43 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315394;
        id v50 = "-[ADCommandCenter(SharedDataClient) _resetPeerAccountSettingsWithSharedData:]";
        __int16 v51 = 2112;
        id v52 = v39;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "%s Updating temperature unit to: %@", buf, 0x16u);
      }
      +[NSLocale af_setAceTemperatureUnit:v39];
    }

    self = v40;
  }

  if (v48)
  {
LABEL_49:
    id v44 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v50 = "-[ADCommandCenter(SharedDataClient) _resetPeerAccountSettingsWithSharedData:]";
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "%s Resetting sessions due to account settings change", buf, 0xCu);
    }
    __int16 v45 = +[AFAnalytics sharedAnalytics];
    [v45 logEventWithType:5001 context:0];

    id v46 = [(ADCommandCenter *)self _sessionManager];
    [v46 resetSessionsAtNextRequestBoundary];
  }
LABEL_52:
}

- (void)updateSharedDataFromCompanion
{
  uint64_t v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v7 = "-[ADCommandCenter(SharedDataClient) updateSharedDataFromCompanion]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v4 = [(ADCommandCenter *)self _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10025997C;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)_cloudSyncPreferenceDidChange
{
  id v2 = [(ADCommandCenter *)self _queue];
  dispatch_async(v2, &stru_100508160);
}

- (void)listenForSharedDataFromCloud
{
  uint64_t v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v8 = "-[ADCommandCenter(SharedDataClient) listenForSharedDataFromCloud]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v4 = +[ADPeerCloudService sharedInstance];
  [v4 setSharedDataRequestObserver:&stru_100508118 withHandler:&unk_100586018];
  if ((AFIsHorseman() & 1) != 0 || AFIsATV())
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100259ECC;
    v6[3] = &unk_100508140;
    v6[4] = self;
    [v4 setSharedDataObserver:v6 withHandle:&unk_100586020];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100259EDC, kAFCloudSyncPreferenceDidChangeDarwinNotification, 0, CFNotificationSuspensionBehaviorDrop);
  }
}

- (void)sharedDataConnection:(id)a3 didUpdateSharedData:(id)a4
{
  id v5 = a4;
  id v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v12 = "-[ADCommandCenter(SharedDataClient) sharedDataConnection:didUpdateSharedData:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v7 = [(ADCommandCenter *)self _queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10025A114;
  v9[3] = &unk_10050E160;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

- (void)updateSharedDataFromPeerUseCache:(BOOL)a3 allowCloudMessaging:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  int v9 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    __int16 v18 = "-[ADCommandCenter(SharedDataClient) updateSharedDataFromPeerUseCache:allowCloudMessaging:completion:]";
    __int16 v19 = 1024;
    BOOL v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %d", buf, 0x12u);
  }
  [(ADCommandCenter *)self _queue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10025A28C;
  v12[3] = &unk_1005080D8;
  BOOL v15 = a3;
  BOOL v16 = v5;
  void v12[4] = self;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v8;
  id v10 = v8;
  int v11 = v13;
  dispatch_async(v11, v12);
}

- (void)updateSharedDataFromPeerUseCache:(BOOL)a3 completion:(id)a4
{
}

- (void)_updateSharedDataWithPairedPeerData:(id)a3
{
  id v4 = a3;
  BOOL v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v59 = "-[ADCommandCenter(SharedDataClient) _updateSharedDataWithPairedPeerData:]";
    __int16 v60 = 2112;
    uint64_t v61 = (uint64_t)v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (v4)
  {
    id v6 = [(ADCommandCenter *)self _account];
    if (AFSupportsPairedDevice() && (AFIsNano() & 1) == 0)
    {
      sharedDataService = self->_sharedDataService;
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_10025ACF0;
      v55[3] = &unk_100508088;
      v55[4] = self;
      id v56 = v6;
      id v57 = v4;
      [(ADSharedDataService *)sharedDataService deviceIsNearby:v55];

LABEL_64:
      goto LABEL_65;
    }
    *((void *)&v54 + 1) = [v6 peerHostname];
    *(void *)&long long v54 = [v4 hostname];
    id v7 = [v4 assistantId];
    [v6 setPeerAssistantIdentifier:v7];

    id v8 = [v4 loggingAssistantId];
    [v6 setPeerLoggingAssistantIdentifier:v8];

    int v9 = [v4 speechId];
    [v6 setPeerSpeechIdentifier:v9];

    id v10 = [v4 hostname];
    [v6 setPeerHostname:v10];

    [v6 save];
    int v11 = [v4 languageCode];
    id v12 = [v4 outputVoice];
    [(ADCommandCenter *)self _setLanguageCode:v11 outputVoice:v12];

    id v13 = +[ADPreferences sharedPreferences];
    id v14 = [v4 sharedUserId];
    BOOL v15 = [v4 loggingSharedUserId];
    [v13 setSharedUserIdentifier:v14 loggingSharedUserIdentifier:v15];

    BOOL v16 = _AFSupportPreferencesBoolValueForKey();

    id v17 = _AFSupportPreferencesBoolValueForKey();

    uint64_t v18 = _AFPreferencesSiriDataSharingOptInStatus();
    __int16 v19 = +[AFPreferences sharedPreferences];
    unsigned int v20 = [v19 assistantIsEnabled];
    unsigned int v21 = [v19 dictationIsEnabled];
    if (v16)
    {
      unsigned int v22 = 0;
      if (v17) {
        goto LABEL_8;
      }
    }
    else
    {
      objc_msgSend(v19, "_setAssistantIsEnabledLocal:", objc_msgSend(v4, "siriEnabled"));
      unsigned int v22 = v20 ^ [v4 siriEnabled];
      if (v17)
      {
LABEL_8:
        int v23 = 0;
        if (v18) {
          goto LABEL_42;
        }
        goto LABEL_16;
      }
    }
    if ([v4 dictationEnabled]) {
      uint64_t v24 = 1;
    }
    else {
      uint64_t v24 = (uint64_t)[v4 siriEnabled];
    }
    [v19 _setDictationIsEnabledLocal:v24];
    int v23 = v21 ^ v24;
    if (v18)
    {
LABEL_42:
      int v41 = _AFPreferencesCloudSyncEnabled();
      unsigned int v42 = v41 ^ [v4 cloudSyncEnabled];
      if (v42 == 1)
      {
        _AFPreferencesEnableCloudSync();
        __int16 v43 = +[NSDate date];
        _AFPreferencesSetCloudSyncEnabledModificationDate();
      }
      if (AFIsNano())
      {
        int ShouldCensorSpeechInternal = _AFPreferencesShouldCensorSpeechInternal();
        if (ShouldCensorSpeechInternal != [v4 shouldCensorSpeech])
        {
          _AFPreferencesSetShouldCensorSpeechInternal();
          AFBackedUpPreferencesSynchronize();
          __int16 v45 = +[NSNotificationCenter defaultCenter];
          [v45 postNotificationName:@"ADShouldCensorSpeechDidChangeNotification" object:0];
        }
      }
      [v19 synchronize];
      if ((v22 | v23) == 1)
      {
        id v46 = +[NSNotificationCenter defaultCenter];
        [v46 postNotificationName:@"ADPreferencesEnabledBitsDidChangeNotification" object:0];

        if (!v42)
        {
LABEL_49:
          if (!v22) {
            goto LABEL_56;
          }
          goto LABEL_53;
        }
      }
      else if (!v42)
      {
        goto LABEL_49;
      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, kAFCloudSyncPreferenceDidChangeDarwinNotification, 0, 0, 1u);
      if (!v22) {
        goto LABEL_56;
      }
LABEL_53:
      if (([v19 assistantIsEnabled] & 1) == 0
        && ((v23 ^ 1) & 1) == 0
        && ([v19 dictationIsEnabled] & 1) == 0)
      {
        __int16 v51 = +[ADCommandCenter sharedCommandCenter];
        [v51 destroyActiveAccount];
        int v48 = (void *)*((void *)&v54 + 1);
        id v49 = (void *)v54;
        goto LABEL_62;
      }
LABEL_56:
      int v48 = (void *)*((void *)&v54 + 1);
      id v49 = (void *)v54;
      if (v54 == 0 || ([*((id *)&v54 + 1) isEqualToString:(void)v54] & 1) != 0) {
        goto LABEL_63;
      }
      id v50 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        id v59 = "-[ADCommandCenter(SharedDataClient) _updateSharedDataWithPairedPeerData:]";
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "%s Resetting sessions due to hostname change", buf, 0xCu);
      }
      __int16 v51 = [(ADCommandCenter *)self _sessionManager];
      [v51 resetSessionsAndMakeQuiet:1];
LABEL_62:

LABEL_63:
      goto LABEL_64;
    }
LABEL_16:
    id v26 = [v4 dataSharingOptInStatus];
    __int16 v27 = v26;
    if (!v26)
    {
LABEL_41:

      goto LABEL_42;
    }
    if ([v26 isEqualToString:SADataSharingOptInStatusOptedInValue])
    {
      uint64_t v28 = 1;
    }
    else if ([v27 isEqualToString:SADataSharingOptInStatusOptedOutValue])
    {
      uint64_t v28 = 2;
    }
    else
    {
      unsigned int v29 = [v27 isEqualToString:SADataSharingOptInStatusDismissedValue];
      uint64_t v28 = 3;
      if (!v29) {
        uint64_t v28 = 0;
      }
    }
    uint64_t v53 = v28;
    __int16 v30 = [off_100582F00() sharedInstance];
    id v31 = [v30 getActivePairedDevice];

    id v52 = v31;
    if (v31)
    {
      id v32 = off_100582F08();
      id v33 = [v31 valueForProperty:v32];
      id v34 = [v33 stringValue];

      id v35 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315394;
        id v59 = "-[ADCommandCenter(SharedDataClient) _updateSharedDataWithPairedPeerData:]";
        __int16 v60 = 2112;
        uint64_t v61 = (uint64_t)v34;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%s Fetched companion build version %@", buf, 0x16u);
      }
      if (v34 && !AFShouldOptOutDataSharingForMigrationFromBuildVersion())
      {
        int IsTinker = AFDeviceIsTinker();
        if (v53 == 2 || !IsTinker)
        {
          if (!v53)
          {
LABEL_40:

            goto LABEL_41;
          }
LABEL_37:
          CFStringRef v39 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 136315395;
            id v59 = "-[ADCommandCenter(SharedDataClient) _updateSharedDataWithPairedPeerData:]";
            __int16 v60 = 2049;
            uint64_t v61 = v53;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%s Updating sharing opt-in status: %{private}ld", buf, 0x16u);
          }
          int v40 = +[ADPreferences sharedPreferences];
          [v40 setSiriDataSharingOptInStatus:v53 propagateToHomeAccessories:0 source:8 reason:@"SharedData" completion:0];

          goto LABEL_40;
        }
        __int16 v37 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315138;
          id v59 = "-[ADCommandCenter(SharedDataClient) _updateSharedDataWithPairedPeerData:]";
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%s Tinker device should not sync Siri Data Sharing value", buf, 0xCu);
        }
LABEL_36:
        uint64_t v53 = 2;
        goto LABEL_37;
      }
    }
    else
    {
      id v34 = 0;
    }
    id v38 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      id v59 = "-[ADCommandCenter(SharedDataClient) _updateSharedDataWithPairedPeerData:]";
      __int16 v60 = 2112;
      uint64_t v61 = (uint64_t)v34;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%s Companion build version %@ requires Siri Data Sharing migration", buf, 0x16u);
    }
    AFDeviceIsTinker();
    goto LABEL_36;
  }
LABEL_65:
}

- (id)_sharedDataService
{
  sharedDataService = self->_sharedDataService;
  if (!sharedDataService)
  {
    id v4 = [[ADSharedDataService alloc] initWithDelegate:self];
    BOOL v5 = self->_sharedDataService;
    self->_sharedDataService = v4;

    sharedDataService = self->_sharedDataService;
  }
  return sharedDataService;
}

- (void)_writeDataToDisk:(id)a3 withFileName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = AFLogDirectory();
  id v8 = [v7 stringByAppendingPathComponent:v5];

  id v11 = 0;
  [v6 writeToFile:v8 options:1 error:&v11];

  id v9 = v11;
  id v10 = AFSiriLogContextDaemon;
  if (v9)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315650;
      id v13 = "-[ADCommandCenter(ServiceMaintenance) _writeDataToDisk:withFileName:]";
      __int16 v14 = 2112;
      BOOL v15 = v8;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Couldn't write to %@: %@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v13 = "-[ADCommandCenter(ServiceMaintenance) _writeDataToDisk:withFileName:]";
    __int16 v14 = 2112;
    BOOL v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Written to %@", buf, 0x16u);
  }
}

- (void)_writeTextToDisk:(id)a3 withFileName:(id)a4
{
  id v6 = a4;
  id v8 = [a3 stringByAppendingString:@"\n"];
  id v7 = [v8 dataUsingEncoding:4];
  [(ADCommandCenter *)self _writeDataToDisk:v7 withFileName:v6];
}

- (id)_getEventsDataForStream:(id)a3 numEvents:(int64_t *)a4
{
  id v5 = a3;
  uint64_t v21 = 0;
  unsigned int v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  id v6 = objc_alloc_init((Class)NSMutableData);
  id v7 = [objc_alloc((Class)BMPublisherOptions) initWithStartDate:0 endDate:0 maxEvents:1000 lastN:0 reversed:1];
  id v8 = [v5 publisherWithOptions:v7];

  BOOL v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_100278174;
  uint64_t v18 = &unk_100508ED8;
  id v9 = v6;
  id v19 = v9;
  unsigned int v20 = &v21;
  id v10 = [v8 sinkWithCompletion:&stru_100508EB0 receiveInput:&v15];
  *a4 = v22[3];
  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int64_t v13 = *a4;
    __int16 v14 = objc_msgSend(v5, "identifier", v15, v16, v17, v18);
    *(_DWORD *)long long buf = 136315650;
    id v26 = "-[ADCommandCenter(ServiceMaintenance) _getEventsDataForStream:numEvents:]";
    __int16 v27 = 2048;
    int64_t v28 = v13;
    __int16 v29 = 2112;
    __int16 v30 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s Gathered %ld events for stream %@", buf, 0x20u);
  }
  _Block_object_dispose(&v21, 8);

  return v9;
}

- (id)_dumpOnDeviceAnalyticsBiomeStream:(id)a3
{
  id v4 = a3;
  id v5 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int64_t v13 = v5;
    __int16 v14 = [v4 identifier];
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ADCommandCenter(ServiceMaintenance) _dumpOnDeviceAnalyticsBiomeStream:]";
    __int16 v18 = 2112;
    id v19 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s Dumping data for stream %@", buf, 0x16u);
  }
  *(void *)long long buf = 0;
  id v6 = [(ADCommandCenter *)self _getEventsDataForStream:v4 numEvents:buf];
  id v7 = [v4 identifier];
  id v8 = +[NSString stringWithFormat:@"%@.log", v7];

  [(ADCommandCenter *)self _writeDataToDisk:v6 withFileName:v8];
  id v9 = [v4 identifier];
  BOOL v15 = v9;
  id v10 = +[NSString stringWithFormat:@"%ld events", *(void *)buf];
  uint64_t v16 = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];

  return v11;
}

- (id)_dumpSiriOnDeviceAnalyticsBiomeStreams
{
  uint64_t v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 136315138;
    id v26 = "-[ADCommandCenter(ServiceMaintenance) _dumpSiriOnDeviceAnalyticsBiomeStreams]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v25, 0xCu);
  }
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = BiomeLibrary();
  id v6 = [v5 Siri];
  id v7 = [v6 Metrics];
  id v8 = [v7 OnDeviceDigestUsageMetrics];
  id v9 = [(ADCommandCenter *)self _dumpOnDeviceAnalyticsBiomeStream:v8];
  [v4 addEntriesFromDictionary:v9];

  id v10 = BiomeLibrary();
  id v11 = [v10 Siri];
  id v12 = [v11 Metrics];
  int64_t v13 = [v12 OnDeviceDigestSegmentsCohorts];
  __int16 v14 = [(ADCommandCenter *)self _dumpOnDeviceAnalyticsBiomeStream:v13];
  [v4 addEntriesFromDictionary:v14];

  BOOL v15 = BiomeLibrary();
  uint64_t v16 = [v15 Siri];
  id v17 = [v16 Metrics];
  __int16 v18 = [v17 OnDeviceDigestExperimentMetrics];
  id v19 = [(ADCommandCenter *)self _dumpOnDeviceAnalyticsBiomeStream:v18];
  [v4 addEntriesFromDictionary:v19];

  unsigned int v20 = BiomeLibrary();
  uint64_t v21 = [v20 Siri];
  unsigned int v22 = [v21 SELFProcessedEvent];
  uint64_t v23 = [(ADCommandCenter *)self _dumpOnDeviceAnalyticsBiomeStream:v22];
  [v4 addEntriesFromDictionary:v23];

  return v4;
}

- (BOOL)_shouldDumpSiriOnDeviceAnalyticsBiomeStreams
{
  if ((AFIsInternalInstall() & 1) == 0)
  {
    uint64_t v3 = AFSiriLogContextDaemon;
    BOOL v2 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
    if (!v2) {
      return v2;
    }
    int v6 = 136315138;
    id v7 = "-[ADCommandCenter(ServiceMaintenance) _shouldDumpSiriOnDeviceAnalyticsBiomeStreams]";
    id v4 = "%s Not dumping on device analytics Biome stream because not internal install.";
    goto LABEL_9;
  }
  if ((_AFPreferencesShouldWriteSODABiomeStreamsToSysdiagnose() & 1) == 0)
  {
    uint64_t v3 = AFSiriLogContextDaemon;
    BOOL v2 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
    if (!v2) {
      return v2;
    }
    int v6 = 136315138;
    id v7 = "-[ADCommandCenter(ServiceMaintenance) _shouldDumpSiriOnDeviceAnalyticsBiomeStreams]";
    id v4 = "%s Not dumping on device analytics Biome stream because setting not enabled.";
LABEL_9:
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, v4, (uint8_t *)&v6, 0xCu);
    LOBYTE(v2) = 0;
    return v2;
  }
  LOBYTE(v2) = 1;
  return v2;
}

- (id)_dumpAssistantState
{
  uint64_t v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADCommandCenter(ServiceMaintenance) _dumpAssistantState]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Dumping assistant state", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000;
  __int16 v27 = sub_100278C10;
  int64_t v28 = sub_100278C20;
  id v29 = +[NSMutableDictionary dictionary];
  id v4 = objc_alloc((Class)NSArray);
  id v5 = +[ADAssetManager sharedInstance];
  int v6 = +[ADDeviceCircleManager sharedInstance];
  id v7 = +[ADPreferences sharedPreferences];
  id v8 = +[ADMultiUserService sharedService];
  id v9 = objc_msgSend(v4, "initWithObjects:", v5, v6, v7, v8, 0);

  id v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v21 = 136315394;
    unsigned int v22 = "-[ADCommandCenter(ServiceMaintenance) _dumpAssistantState]";
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Taking a state snapshot from providers: %@", v21, 0x16u);
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100278C28;
  v18[3] = &unk_100508E70;
  id v11 = dispatch_group_create();
  id v19 = v11;
  p_long long buf = &buf;
  [v9 enumerateObjectsUsingBlock:v18];
  dispatch_time_t v12 = dispatch_time(0, 2000000000);
  if (dispatch_group_wait(v11, v12))
  {
    int64_t v13 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v21 = 136315138;
      unsigned int v22 = "-[ADCommandCenter(ServiceMaintenance) _dumpAssistantState]";
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Timed out waiting for state chunks", v21, 0xCu);
    }
  }
  __int16 v14 = [*(id *)(*((void *)&buf + 1) + 40) description];
  BOOL v15 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v21 = 136315394;
    unsigned int v22 = "-[ADCommandCenter(ServiceMaintenance) _dumpAssistantState]";
    __int16 v23 = 2112;
    id v24 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Result: %@", v21, 0x16u);
  }
  [(ADCommandCenter *)self _writeTextToDisk:v14 withFileName:@"assistant_dump.log"];
  uint64_t v16 = +[NSDictionary dictionaryWithDictionary:*(void *)(*((void *)&buf + 1) + 40)];

  _Block_object_dispose(&buf, 8);
  return v16;
}

- (id)dumpAssistantState
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(ADCommandCenter *)self _dumpAssistantState];
  [v3 addEntriesFromDictionary:v4];
  if ([(ADCommandCenter *)self _shouldDumpSiriOnDeviceAnalyticsBiomeStreams])
  {
    id v5 = [(ADCommandCenter *)self _dumpSiriOnDeviceAnalyticsBiomeStreams];
    [v3 addEntriesFromDictionary:v5];
  }
  return v3;
}

- (void)runBootTimeServiceMaintenanceWithCompletion:(id)a3
{
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v8 = "-[ADCommandCenter(ServiceMaintenance) runBootTimeServiceMaintenanceWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v5 = [(ADCommandCenter *)self _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002790A8;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(v5, block);
}

- (void)runServiceMaintenanceWithCompletion:(id)a3
{
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v8 = "-[ADCommandCenter(ServiceMaintenance) runServiceMaintenanceWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v5 = [(ADCommandCenter *)self _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100279224;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(v5, block);
}

- (void)_runMaintenanceForServices:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADCommandCenter(ServiceMaintenance) _runMaintenanceForServices:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&buf, 0xCu);
  }
  serviceMaintenanceGroup = self->_serviceMaintenanceGroup;
  if (!serviceMaintenanceGroup)
  {
    id v10 = (OS_dispatch_group *)dispatch_group_create();
    id v11 = self->_serviceMaintenanceGroup;
    self->_serviceMaintenanceGroup = v10;

    serviceMaintenanceGroup = self->_serviceMaintenanceGroup;
  }
  dispatch_time_t v12 = serviceMaintenanceGroup;
  id v13 = [v6 count];
  __int16 v14 = +[AFAnalytics sharedAnalytics];
  [v14 logEventWithType:1204 context:0];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3042000000;
  id v32 = sub_100279584;
  id v33 = sub_100279590;
  id v34 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100279598;
  void v24[3] = &unk_100508E20;
  id v29 = v13;
  BOOL v15 = v12;
  int v25 = v15;
  p_long long buf = &buf;
  id v16 = v6;
  id v26 = v16;
  __int16 v27 = self;
  id v17 = [v24 copy];
  objc_storeWeak((id *)(*((void *)&buf + 1) + 40), v17);
  (*((void (**)(id, void))v17 + 2))(v17, 0);
  __int16 v18 = [(ADCommandCenter *)self _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002798D0;
  block[3] = &unk_10050C868;
  id v22 = v17;
  id v23 = v7;
  id v19 = v7;
  id v20 = v17;
  dispatch_group_notify(v15, v18, block);

  _Block_object_dispose(&buf, 8);
  objc_destroyWeak(&v34);
}

- (void)_metrics_awdRequestEnd
{
  id v3 = [(ADCommandCenter *)self _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10027C748;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)_metrics_recordSNNetworkSnapshotForEvent:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(ADCommandCenter *)self _sessionManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10027C80C;
  v9[3] = &unk_100509410;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  [v7 getSNConnectionMetrics:v9];
}

- (void)_metrics_recordNetworkSnapshotForEvent:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(ADCommandCenter *)self _sessionManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10027CE74;
  v9[3] = &unk_100509410;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  [v7 getConnectionMetrics:v9];
}

- (void)_metrics_destroyAllMetrics
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[ADCommandCenter(Metrics) _metrics_destroyAllMetrics]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  id v4 = [(ADCommandCenter *)self _offlineMetricsManager];
  [v4 deleteAllMetrics];
}

- (void)_metrics_destroyAllMetricsIfNeeded
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    int v5 = "-[ADCommandCenter(Metrics) _metrics_destroyAllMetricsIfNeeded]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  if (![(ADCommandCenter *)self _metrics_isAssistantOrDictationEnabled]) {
    [(ADCommandCenter *)self _metrics_destroyAllMetrics];
  }
}

- (void)_metrics_sendEngagementFeedback:(int64_t)a3 voiceQueryIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init((Class)SAMetrics);
  [v7 setCategory:@"SpotlightEngagementFeedback"];
  [v7 setOriginalCommandId:v6];
  if ((unint64_t)a3 > 3) {
    CFStringRef v8 = @"unknown";
  }
  else {
    CFStringRef v8 = *(&off_100509430 + a3);
  }
  v21[0] = @"type";
  id v9 = +[NSNumber numberWithInteger:a3];
  v21[1] = @"description";
  v22[0] = v9;
  v22[1] = v8;
  id v10 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];

  CFStringRef v19 = @"engagementInfo";
  id v20 = v10;
  int64_t v11 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  [v7 setEventInformation:v11];

  dispatch_time_t v12 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315650;
    __int16 v14 = "-[ADCommandCenter(Metrics) _metrics_sendEngagementFeedback:voiceQueryIdentifier:]";
    __int16 v15 = 2112;
    CFStringRef v16 = v8;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Sending engagement feedback \"%@\" for aceId %@", (uint8_t *)&v13, 0x20u);
  }
  [(ADCommandCenter *)self _reallyCommitOrSaveMetrics:v7];
}

- (void)_metrics_publishDailyDeviceStatus:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v24 = "-[ADCommandCenter(Metrics) _metrics_publishDailyDeviceStatus:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10027DBB8;
  void v20[3] = &unk_10050D0D0;
  id v9 = v7;
  id v21 = v9;
  id v10 = objc_retainBlock(v20);
  if ([(ADCommandCenter *)self _metrics_isAssistantOrDictationEnabled])
  {
    int64_t v11 = +[AFPreferences sharedPreferences];
    unsigned int v12 = [v11 isDictationHIPAACompliant];

    if (!v12)
    {
      __int16 v15 = [v6 wrapAsAnyEvent];
      CFStringRef v16 = +[ADAnalyticsService sharedService];
      id v22 = v15;
      __int16 v17 = +[NSArray arrayWithObjects:&v22 count:1];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10027DBD0;
      v18[3] = &unk_10050D0D0;
      CFStringRef v19 = v10;
      [v16 storeGenericInstrumentation:v17 completion:v18];

      goto LABEL_12;
    }
    int v13 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v24 = "-[ADCommandCenter(Metrics) _metrics_publishDailyDeviceStatus:completion:]";
      __int16 v14 = "%s HIPAA On-Device Dictation enabled. Dropping DailyDeviceStatus.";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v14, buf, 0xCu);
    }
  }
  else
  {
    int v13 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v24 = "-[ADCommandCenter(Metrics) _metrics_publishDailyDeviceStatus:completion:]";
      __int16 v14 = "%s Assistant and Dictation are disabled. Dropping DailyDeviceStatus.";
      goto LABEL_9;
    }
  }
  ((void (*)(void *))v10[2])(v10);
LABEL_12:
}

- (void)metrics_publishDailyDeviceStatus:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = [(ADCommandCenter *)self _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10027DCB8;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_metrics_processEventRecordsFromStore:(id)a3 batch:(id)a4 deliveryStream:(unint64_t)a5 eventStreamUID:(id)a6 streamSpeechId:(id)a7 untilLimit:(double)a8 uploadRecords:(id)a9 completion:(id)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  id v22 = a10;
  id v23 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315906;
    __int16 v51 = "-[ADCommandCenter(Metrics) _metrics_processEventRecordsFromStore:batch:deliveryStream:eventStreamUID:streamSpe"
          "echId:untilLimit:uploadRecords:completion:]";
    __int16 v52 = 2112;
    id v53 = v19;
    __int16 v54 = 2112;
    id v55 = v20;
    __int16 v56 = 2048;
    unint64_t v57 = a5;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s Fetching 128 events from event stream with UID %@ speechId %@ in delivery stream %tu", buf, 0x2Au);
  }
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_10027DF98;
  v45[3] = &unk_100509320;
  id v24 = v17;
  id v46 = v24;
  unint64_t v49 = a5;
  id v25 = v18;
  id v47 = v25;
  id v26 = v22;
  id v48 = v26;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10027E050;
  v34[3] = &unk_1005093E8;
  id v42 = v21;
  unint64_t v43 = a5;
  id v35 = v25;
  id v36 = v19;
  double v44 = a8;
  int v40 = objc_retainBlock(v45);
  id v41 = v26;
  __int16 v37 = self;
  id v38 = v20;
  id v39 = v24;
  id v27 = v24;
  id v28 = v20;
  id v29 = v21;
  id v30 = v26;
  id v31 = v19;
  id v32 = v40;
  id v33 = v25;
  [v27 fetchEventRecords:128 eventStreamUID:v31 streamSpeechId:v28 deliveryStream:a5 completion:v34];
}

- (void)_metrics_sendNextAnalyticsEventStreamToServerUntilLimit:(double)a3 requiresUnlimitedPower:(BOOL)a4 requiresActiveSession:(BOOL)a5 prioritizedEventStreamUID:(id)a6 deliveryStreamContinuations:(id *)a7 scheduledActivity:(BOOL)a8 completion:(id)a9
{
  BOOL v11 = a5;
  BOOL v12 = a4;
  id v15 = a6;
  id v16 = a9;
  id v17 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    unint64_t var3 = a7->var3;
    *(_DWORD *)long long buf = 136315394;
    __int16 v54 = "-[ADCommandCenter(Metrics) _metrics_sendNextAnalyticsEventStreamToServerUntilLimit:requiresUnlimitedPower:requ"
          "iresActiveSession:prioritizedEventStreamUID:deliveryStreamContinuations:scheduledActivity:completion:]";
    __int16 v55 = 2048;
    unint64_t v56 = var3;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Remaining batch runs: %lu", buf, 0x16u);
  }
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_10027F098;
  v51[3] = &unk_10050D0D0;
  id v19 = v16;
  id v52 = v19;
  id v20 = objc_retainBlock(v51);
  unint64_t v21 = a7->var3;
  if (v21) {
    a7->unint64_t var3 = v21 - 1;
  }
  id v22 = +[NSProcessInfo processInfo];
  [v22 systemUptime];
  double v24 = v23;

  if (v24 >= a3)
  {
    id v28 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_DWORD *)long long buf = 136315138;
    __int16 v54 = "-[ADCommandCenter(Metrics) _metrics_sendNextAnalyticsEventStreamToServerUntilLimit:requiresUnlimitedPower:requ"
          "iresActiveSession:prioritizedEventStreamUID:deliveryStreamContinuations:scheduledActivity:completion:]";
    id v29 = "%s Attempted to send analytics event stream when time limit is reached.";
    goto LABEL_17;
  }
  if (![(ADCommandCenter *)self _metrics_isSystemIdle])
  {
    id v28 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_DWORD *)long long buf = 136315138;
    __int16 v54 = "-[ADCommandCenter(Metrics) _metrics_sendNextAnalyticsEventStreamToServerUntilLimit:requiresUnlimitedPower:requ"
          "iresActiveSession:prioritizedEventStreamUID:deliveryStreamContinuations:scheduledActivity:completion:]";
    id v29 = "%s Attempted to send analytics event stream when system is busy.";
    goto LABEL_17;
  }
  if (![(ADCommandCenter *)self _metrics_isAssistantOrDictationEnabled])
  {
    id v28 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_DWORD *)long long buf = 136315138;
    __int16 v54 = "-[ADCommandCenter(Metrics) _metrics_sendNextAnalyticsEventStreamToServerUntilLimit:requiresUnlimitedPower:requ"
          "iresActiveSession:prioritizedEventStreamUID:deliveryStreamContinuations:scheduledActivity:completion:]";
    id v29 = "%s Attempted to send analytics event stream when Assistant and Dictation are disabled.";
    goto LABEL_17;
  }
  __int16 v37 = v15;
  id v25 = +[AFPreferences sharedPreferences];
  unsigned int v26 = [v25 isDictationHIPAACompliant];

  if (!v26)
  {
    id v30 = +[AFSiriDataSharingSensitivityManager shared];
    unsigned int v31 = [v30 isOptedOutOfMTE];

    if (!v31)
    {
      if (v12 && (IOPSDrawingUnlimitedPower() & 1) == 0)
      {
        id v27 = AFSiriLogContextDaemon;
        if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
          goto LABEL_10;
        }
        *(_DWORD *)long long buf = 136315138;
        __int16 v54 = "-[ADCommandCenter(Metrics) _metrics_sendNextAnalyticsEventStreamToServerUntilLimit:requiresUnlimitedPower:"
              "requiresActiveSession:prioritizedEventStreamUID:deliveryStreamContinuations:scheduledActivity:completion:]";
        id v36 = "%s Attempted to send analytics event stream when the device is on battery.";
      }
      else
      {
        if (!v11
          || ([(ADCommandCenter *)self _sessionManager],
              id v32 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v33 = [v32 hasActiveSessionForSendingMetrics],
              v32,
              (v33 & 1) != 0))
        {
          id v34 = +[ADAnalyticsService sharedService];
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          v39[2] = sub_10027F0B0;
          v39[3] = &unk_1005092D0;
          uint8_t v39[4] = self;
          id v41 = v20;
          double v43 = a3;
          id v15 = v37;
          id v40 = v37;
          $85E40A55691FE2F31975A98F57E3065D var1 = a7->var1;
          $85E40A55691FE2F31975A98F57E3065D var0 = a7->var0;
          $85E40A55691FE2F31975A98F57E3065D v45 = var1;
          $85E40A55691FE2F31975A98F57E3065D var2 = a7->var2;
          unint64_t v47 = a7->var3;
          BOOL v48 = a8;
          BOOL v49 = v11;
          BOOL v50 = v12;
          id v42 = v19;
          [v34 accessStoreUsingBlock:v39];

          goto LABEL_21;
        }
        id v27 = AFSiriLogContextDaemon;
        if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
          goto LABEL_10;
        }
        *(_DWORD *)long long buf = 136315138;
        __int16 v54 = "-[ADCommandCenter(Metrics) _metrics_sendNextAnalyticsEventStreamToServerUntilLimit:requiresUnlimitedPower:"
              "requiresActiveSession:prioritizedEventStreamUID:deliveryStreamContinuations:scheduledActivity:completion:]";
        id v36 = "%s Skipped sending metrics to server because the session is not active.";
      }
LABEL_32:
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, v36, buf, 0xCu);
      goto LABEL_10;
    }
    id v28 = AFSiriLogContextDaemon;
    id v15 = v37;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
LABEL_20:
      ((void (*)(void *))v20[2])(v20);
      goto LABEL_21;
    }
    *(_DWORD *)long long buf = 136315138;
    __int16 v54 = "-[ADCommandCenter(Metrics) _metrics_sendNextAnalyticsEventStreamToServerUntilLimit:requiresUnlimitedPower:requ"
          "iresActiveSession:prioritizedEventStreamUID:deliveryStreamContinuations:scheduledActivity:completion:]";
    id v29 = "%s #MTEOptOut Attempted to send analytics event stream when device is opted out of MTE";
LABEL_17:
    _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, v29, buf, 0xCu);
    goto LABEL_20;
  }
  id v27 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v54 = "-[ADCommandCenter(Metrics) _metrics_sendNextAnalyticsEventStreamToServerUntilLimit:requiresUnlimitedPower:requ"
          "iresActiveSession:prioritizedEventStreamUID:deliveryStreamContinuations:scheduledActivity:completion:]";
    id v36 = "%s Attempted to send analytics event stream when HIPAA compliance for On-Device Dictation.";
    goto LABEL_32;
  }
LABEL_10:
  ((void (*)(void *))v20[2])(v20);
  id v15 = v37;
LABEL_21:
}

- (void)_metrics_sendNextOfflineMetricsToServerUntilLimit:(double)a3 requiresUnlimitedPower:(BOOL)a4 requiresActiveSession:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  BOOL v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v36 = "-[ADCommandCenter(Metrics) _metrics_sendNextOfflineMetricsToServerUntilLimit:requiresUnlimitedPower:requiresAc"
          "tiveSession:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100281E14;
  v33[3] = &unk_10050D0D0;
  id v12 = v10;
  id v34 = v12;
  id v13 = objc_retainBlock(v33);
  __int16 v14 = +[NSProcessInfo processInfo];
  [v14 systemUptime];
  double v16 = v15;

  if (v16 >= a3)
  {
    id v19 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      id v36 = "-[ADCommandCenter(Metrics) _metrics_sendNextOfflineMetricsToServerUntilLimit:requiresUnlimitedPower:requires"
            "ActiveSession:completion:]";
      id v20 = "%s Attempted to send offline metrics when time limit is reached.";
      goto LABEL_15;
    }
LABEL_18:
    ((void (*)(void *))v13[2])(v13);
    goto LABEL_19;
  }
  if (![(ADCommandCenter *)self _metrics_isSystemIdle])
  {
    id v19 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      id v36 = "-[ADCommandCenter(Metrics) _metrics_sendNextOfflineMetricsToServerUntilLimit:requiresUnlimitedPower:requires"
            "ActiveSession:completion:]";
      id v20 = "%s Attempted to send offline metrics when system is busy.";
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  if (![(ADCommandCenter *)self _metrics_isAssistantOrDictationEnabled])
  {
    id v19 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      id v36 = "-[ADCommandCenter(Metrics) _metrics_sendNextOfflineMetricsToServerUntilLimit:requiresUnlimitedPower:requires"
            "ActiveSession:completion:]";
      id v20 = "%s Attempted to send offline metrics when Assistant and Dictation are disabled.";
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  id v17 = +[AFPreferences sharedPreferences];
  unsigned int v18 = [v17 isDictationHIPAACompliant];

  if (v18)
  {
    id v19 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      id v36 = "-[ADCommandCenter(Metrics) _metrics_sendNextOfflineMetricsToServerUntilLimit:requiresUnlimitedPower:requires"
            "ActiveSession:completion:]";
      id v20 = "%s Attempted to send offline metrics when HIPAA compliance for On-Device Dictation.";
LABEL_15:
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v20, buf, 0xCu);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  unint64_t v21 = +[AFSiriDataSharingSensitivityManager shared];
  unsigned int v22 = [v21 isOptedOutOfMTE];

  if (v22)
  {
    id v19 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)long long buf = 136315138;
    id v36 = "-[ADCommandCenter(Metrics) _metrics_sendNextOfflineMetricsToServerUntilLimit:requiresUnlimitedPower:requiresAc"
          "tiveSession:completion:]";
    id v20 = "%s #MTEOptOut Attempted to send offline metrics when device is opted out of MTE";
    goto LABEL_15;
  }
  if (v7 && (IOPSDrawingUnlimitedPower() & 1) == 0)
  {
    id v19 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)long long buf = 136315138;
    id v36 = "-[ADCommandCenter(Metrics) _metrics_sendNextOfflineMetricsToServerUntilLimit:requiresUnlimitedPower:requiresAc"
          "tiveSession:completion:]";
    id v20 = "%s Attempted to send offline metrics when the device is on battery.";
    goto LABEL_15;
  }
  if (v6)
  {
    double v23 = [(ADCommandCenter *)self _sessionManager];
    unsigned __int8 v24 = [v23 hasActiveSessionForSendingMetrics];

    if ((v24 & 1) == 0)
    {
      id v19 = AFSiriLogContextDaemon;
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      *(_DWORD *)long long buf = 136315138;
      id v36 = "-[ADCommandCenter(Metrics) _metrics_sendNextOfflineMetricsToServerUntilLimit:requiresUnlimitedPower:requires"
            "ActiveSession:completion:]";
      id v20 = "%s Skipped sending metrics to server because the session is not active.";
      goto LABEL_15;
    }
  }
  id v25 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v36 = "-[ADCommandCenter(Metrics) _metrics_sendNextOfflineMetricsToServerUntilLimit:requiresUnlimitedPower:requiresAc"
          "tiveSession:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s Fetching next offline metrics...", buf, 0xCu);
  }
  unsigned int v26 = [(ADCommandCenter *)self _offlineMetricsManager];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  void v27[2] = sub_100281E2C;
  v27[3] = &unk_100509190;
  void v27[4] = self;
  double v30 = a3;
  BOOL v31 = v6;
  BOOL v32 = v7;
  id v28 = v12;
  id v29 = v13;
  [v26 fetchNextMetricsUsingBlock:v27];

LABEL_19:
}

- (void)_metrics_sendMetricsToServerUntilLimit:(double)a3 requiresUnlimitedPower:(BOOL)a4 requiresActiveSession:(BOOL)a5 purgesOversizedStorage:(BOOL)a6 scheduledActivity:(BOOL)a7 completion:(id)a8
{
  BOOL v10 = a5;
  BOOL v11 = a4;
  __int16 v14 = (void (**)(void))a8;
  double v15 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315906;
    id v39 = "-[ADCommandCenter(Metrics) _metrics_sendMetricsToServerUntilLimit:requiresUnlimitedPower:requiresActiveSession"
          ":purgesOversizedStorage:scheduledActivity:completion:]";
    __int16 v40 = 2048;
    double v41 = a3;
    __int16 v42 = 1024;
    BOOL v43 = v11;
    __int16 v44 = 1024;
    BOOL v45 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s limit = %f, requiresUnlimitedPower = %d, requiresActiveSession = %d", buf, 0x22u);
  }
  if (self->_isSendingAnalyticsEventStreamsAndOfflineMetrics)
  {
    double v16 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    *(_DWORD *)long long buf = 136315138;
    id v39 = "-[ADCommandCenter(Metrics) _metrics_sendMetricsToServerUntilLimit:requiresUnlimitedPower:requiresActiveSession"
          ":purgesOversizedStorage:scheduledActivity:completion:]";
    id v17 = "%s Skipped sending metrics to server because it is already sending.";
    goto LABEL_6;
  }
  if (v10)
  {
    unsigned int v18 = [(ADCommandCenter *)self _sessionManager];
    unsigned __int8 v19 = [v18 hasActiveSessionForSendingMetrics];

    if ((v19 & 1) == 0)
    {
      double v16 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        id v39 = "-[ADCommandCenter(Metrics) _metrics_sendMetricsToServerUntilLimit:requiresUnlimitedPower:requiresActiveSes"
              "sion:purgesOversizedStorage:scheduledActivity:completion:]";
        id v17 = "%s Skipped sending metrics to server because the session is not active.";
        goto LABEL_6;
      }
LABEL_7:
      if (v14) {
        v14[2](v14);
      }
      goto LABEL_22;
    }
  }
  id v20 = +[AFSiriDataSharingSensitivityManager shared];
  unsigned int v21 = [v20 isOptedOutOfMTE];

  if (v21)
  {
    double v16 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v39 = "-[ADCommandCenter(Metrics) _metrics_sendMetricsToServerUntilLimit:requiresUnlimitedPower:requiresActiveSessi"
            "on:purgesOversizedStorage:scheduledActivity:completion:]";
      id v17 = "%s #MTEOptOut Skipped sending metrics to server because the device is opted out of MTE.";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, v17, buf, 0xCu);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  self->_isSendingAnalyticsEventStreamsAndOfflineMetrics = 1;
  unsigned int v22 = +[ADAnalyticsService sharedService];
  [v22 suspendEventsStaging];

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10028270C;
  v35[3] = &unk_10050D378;
  BOOL v37 = a6;
  void v35[4] = self;
  id v36 = v14;
  double v23 = objc_retainBlock(v35);
  unsigned __int8 v24 = +[NSProcessInfo processInfo];
  [v24 systemUptime];
  double v26 = v25;

  if (v26 >= a3)
  {
    id v28 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      id v39 = "-[ADCommandCenter(Metrics) _metrics_sendMetricsToServerUntilLimit:requiresUnlimitedPower:requiresActiveSessi"
            "on:purgesOversizedStorage:scheduledActivity:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s Skipped sending offline metrics to server because time limit is reached.", buf, 0xCu);
    }
    ((void (*)(void *))v23[2])(v23);
  }
  else
  {
    id v27 = +[ADSiriAnalyticsServiceHost sharedSiriAnalyticsServiceHost];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1002828B8;
    void v29[3] = &unk_100509118;
    void v29[4] = self;
    double v31 = a3;
    BOOL v32 = v11;
    BOOL v33 = v10;
    BOOL v34 = a7;
    double v30 = v23;
    [v27 deleteLegacyMetricsAffectedBySensitiveConditionsWithCompletion:v29];
  }
LABEL_22:
}

- (void)_metrics_recordCancellationMetrics
{
  id v3 = [(ADCommandCenter *)self _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10028308C;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)_metrics_recordFailureMetricsForError:(id)a3
{
  id v4 = a3;
  int v5 = [(ADCommandCenter *)self _queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_10028321C;
  v7[3] = &unk_10050E160;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_metrics_logSpeechRecognized:(id)a3 resultId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = +[AFAnalytics sharedAnalytics];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100283440;
  v10[3] = &unk_10050A230;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 logEventWithType:1102 contextProvider:v10];
}

- (void)_metrics_markLocalSpeechCompletedWithStatistics:(id)a3
{
  id v3 = a3;
  id v4 = +[AFAnalytics sharedAnalytics];
  [v4 logEventWithType:4405 context:v3];
}

- (void)_metrics_markLocalSpeechPackage:(id)a3 interactionId:(id)a4 optedIn:(BOOL)a5
{
  id v7 = a3;
  id v67 = a4;
  if (a5)
  {
    id v8 = [v7 recognition];
    id v9 = sub_100283B50(v8);

    BOOL v10 = [v7 rawRecognition];
    id v11 = sub_100283B50(v10);

    id v12 = objc_alloc_init((Class)NSMutableDictionary);
    [v12 setValue:v9 forKey:@"recognition"];
    [v12 setValue:v11 forKey:@"rawRecognition"];
    id v13 = [v7 dictionaryRepresentation];
    id v66 = v12;
    [v12 setValue:v13 forKey:@"speechPackage"];
  }
  else
  {
    id v66 = objc_alloc_init((Class)NSMutableDictionary);
  }
  __int16 v14 = [v7 rawRecognition];
  id v15 = objc_alloc_init((Class)NSMutableArray);
  double v16 = [v14 utterances];
  id v17 = [v16 firstObject];

  id v65 = v14;
  unsigned int v18 = [v14 phrases];
  if ([v18 count])
  {
    unint64_t v19 = 0;
    id v68 = v18;
    id v69 = v17;
    do
    {
      id v20 = [v17 interpretationIndices];
      id v21 = [v20 count];

      if (v19 >= (unint64_t)v21) {
        break;
      }
      unsigned int v22 = [v18 objectAtIndex:v19];
      double v23 = [v17 interpretationIndices];
      unsigned __int8 v24 = [v23 objectAtIndex:v19];
      id v25 = [v24 unsignedIntegerValue];

      double v26 = [v22 interpretations];
      id v27 = [v26 count];

      if (v25 >= v27)
      {

        break;
      }
      id v28 = [v22 interpretations];
      id v29 = [v28 objectAtIndex:v25];

      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      double v30 = [v29 tokens];
      id v31 = [v30 countByEnumeratingWithState:&v70 objects:v74 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v71;
        do
        {
          for (i = 0; i != v32; i = (char *)i + 1)
          {
            if (*(void *)v71 != v33) {
              objc_enumerationMutation(v30);
            }
            id v35 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(*((void *)&v70 + 1) + 8 * i) confidenceScore]);
            [v15 addObject:v35];
          }
          id v32 = [v30 countByEnumeratingWithState:&v70 objects:v74 count:16];
        }
        while (v32);
      }

      ++v19;
      unsigned int v18 = v68;
      id v17 = v69;
    }
    while (v19 < (unint64_t)[v68 count]);
  }

  id v36 = [v7 rawRecognition];
  double v37 = sub_100283E34(v36);

  id v38 = [v7 recognition];
  double v39 = sub_100283E34(v38);

  __int16 v40 = [v7 rawRecognition];
  double v41 = [v40 phrases];
  __int16 v42 = [v41 firstObject];

  BOOL v43 = [v42 interpretations];
  __int16 v44 = [v43 firstObject];

  BOOL v45 = [v44 tokens];
  id v46 = [v45 firstObject];

  [v46 startTime];
  double v48 = v47;

  BOOL v49 = [v7 rawRecognition];
  BOOL v50 = [v49 phrases];
  __int16 v51 = [v50 lastObject];

  id v52 = [v51 interpretations];
  id v53 = [v52 firstObject];

  __int16 v54 = [v53 tokens];
  __int16 v55 = [v54 lastObject];

  [v55 endTime];
  double v57 = v56;
  [v55 silenceStartTime];
  double v59 = v57 - v58;

  [v66 setValue:v15 forKey:@"rawRecognitionTokenConfidenceScores"];
  __int16 v60 = +[NSNumber numberWithDouble:v37];
  [v66 setValue:v60 forKey:@"rawRecognitionFirstTokenSilenceStartTime"];

  uint64_t v61 = +[NSNumber numberWithDouble:v39];
  [v66 setValue:v61 forKey:@"recognitionFirstTokenSilenceStartTime"];

  id v62 = +[NSNumber numberWithDouble:v48];
  [v66 setValue:v62 forKey:@"rawRecognitionLeadingSilence"];

  id v63 = +[NSNumber numberWithDouble:v59];
  [v66 setValue:v63 forKey:@"rawRecognitionTrailingSilence"];

  [v66 setValue:v67 forKey:@"dictationUIInteractionIdentifier"];
  id v64 = +[AFAnalytics sharedAnalytics];
  [v64 logEventWithType:4404 context:v66];
}

- (void)_metrics_markLocalEagerRecognitionCandidate:(id)a3
{
  id v3 = a3;
  id v4 = [v3 utterances];
  id v5 = [v4 firstObject];

  if (v5)
  {
    id v43 = v3;
    id v6 = [v3 phrases];
    __int16 v42 = v5;
    id v7 = v5;
    id v41 = [v7 confidenceScore];
    id v49 = objc_alloc_init((Class)NSMutableString);
    int v8 = AFIsInternalInstall();
    BOOL v45 = v7;
    if ([v6 count])
    {
      id v9 = 0;
      BOOL v10 = 0;
      unint64_t v11 = 0;
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      __int16 v44 = v6;
      do
      {
        id v13 = [v7 interpretationIndices];
        id v14 = [v13 count];

        if (v11 >= (unint64_t)v14) {
          break;
        }
        id v15 = [v6 objectAtIndex:v11];
        double v16 = [v7 interpretationIndices];
        [v16 objectAtIndex:v11];
        unsigned int v18 = v17 = v6;
        id v19 = [v18 unsignedIntegerValue];

        id v20 = [v15 interpretations];
        id v21 = [v20 count];

        if (v19 >= v21)
        {
          id v5 = v42;
          id v3 = v43;
          id v38 = v49;
          id v34 = &__NSDictionary0__struct;
          id v6 = v17;
          goto LABEL_31;
        }
        double v47 = v15;
        unint64_t v48 = v11;
        unsigned int v22 = [v15 interpretations];
        double v23 = [v22 objectAtIndex:v19];

        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v46 = v23;
        unsigned __int8 v24 = [v23 tokens];
        id v25 = [v24 countByEnumeratingWithState:&v50 objects:buf count:16];
        if (v25)
        {
          id v26 = v25;
          uint64_t v27 = *(void *)v51;
          do
          {
            for (i = 0; i != v26; i = (char *)i + 1)
            {
              if (*(void *)v51 != v27) {
                objc_enumerationMutation(v24);
              }
              id v29 = *(void **)(*((void *)&v50 + 1) + 8 * i);
              id v30 = [v29 confidenceScore];
              if (v12 >= (uint64_t)v30) {
                uint64_t v12 = (uint64_t)v30;
              }
              id v31 = [v29 confidenceScore];
              if ((uint64_t)v9 <= (uint64_t)v31) {
                id v9 = v31;
              }
              if (v8)
              {
                if (([v29 removeSpaceBefore] & 1) == 0
                  && ([v10 removeSpaceAfter] & 1) == 0
                  && v10)
                {
                  [v49 appendString:@" "];
                }
                id v32 = [v29 text];
                [v49 appendString:v32];
                id v33 = v29;

                BOOL v10 = v33;
              }
            }
            id v26 = [v24 countByEnumeratingWithState:&v50 objects:buf count:16];
          }
          while (v26);
        }

        unint64_t v11 = v48 + 1;
        id v6 = v44;
        id v7 = v45;
      }
      while (v48 + 1 < (unint64_t)[v44 count]);
    }
    else
    {
      BOOL v10 = 0;
      id v9 = 0;
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v54[0] = @"ConfidenceMean";
    id v35 = +[NSNumber numberWithInteger:v41];
    v55[0] = v35;
    v54[1] = @"ConfidenceMax";
    id v36 = +[NSNumber numberWithInteger:v9];
    v55[1] = v36;
    v54[2] = @"ConfidenceMin";
    double v37 = +[NSNumber numberWithInteger:v12];
    v55[2] = v37;
    id v15 = +[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:3];

    if (v8)
    {
      id v34 = [v15 mutableCopy];
      id v38 = v49;
      [v34 setObject:v49 forKey:@"BestTranscription"];
      id v5 = v42;
      id v3 = v43;
    }
    else
    {
      id v15 = v15;
      id v34 = v15;
      id v5 = v42;
      id v3 = v43;
      id v38 = v49;
    }
LABEL_31:
  }
  else
  {
    id v34 = &__NSDictionary0__struct;
  }
  double v39 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    double v57 = "-[ADCommandCenter(Metrics) _metrics_markLocalEagerRecognitionCandidate:]";
    __int16 v58 = 2112;
    id v59 = v34;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%s Local eager candidate log context: %@", buf, 0x16u);
  }
  __int16 v40 = +[AFAnalytics sharedAnalytics];
  [v40 logEventWithType:4403 context:v34];
}

- (void)_metrics_markLocalPartialSpeechRecognition
{
  id v2 = +[AFAnalytics sharedAnalytics];
  [v2 logEventWithType:4402 context:0];
}

- (void)_metrics_markLocalSpeechStartedWithContext:(id)a3
{
  id v3 = a3;
  id v4 = +[AFAnalytics sharedAnalytics];
  [v4 logEventWithType:4401 context:v3];
}

- (BOOL)_metrics_isSystemIdle
{
  if ([(ADCommandCenter *)self _callIsLikely])
  {
    id v3 = AFSiriLogContextDaemon;
    int v4 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (v4)
    {
      int v14 = 136315138;
      id v15 = "-[ADCommandCenter(Metrics) _metrics_isSystemIdle]";
      id v5 = "%s NO (callIsLikely == YES)";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v14, 0xCu);
      LOBYTE(v4) = 0;
      return v4;
    }
    return v4;
  }
  if (![(ADCommandCenter *)self _isInCall])
  {
    id v6 = [(ADCommandCenter *)self _currentRequest];

    if (v6)
    {
      id v3 = AFSiriLogContextDaemon;
      int v4 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
      if (v4)
      {
        int v14 = 136315138;
        id v15 = "-[ADCommandCenter(Metrics) _metrics_isSystemIdle]";
        id v5 = "%s NO (hasCurrentRequest == YES)";
        goto LABEL_16;
      }
      return v4;
    }
    id v7 = [(ADCommandCenter *)self _currentClient];
    if (v7
      || ([(ADCommandCenter *)self _requestDelegate],
          (id v7 = objc_claimAutoreleasedReturnValue()) != 0)
      || ([(ADCommandCenter *)self _speechDelegate],
          (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {

      goto LABEL_14;
    }
    int v8 = [(ADCommandCenter *)self _speechFileDelegate];

    if (v8)
    {
LABEL_14:
      id v3 = AFSiriLogContextDaemon;
      int v4 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
      if (v4)
      {
        int v14 = 136315138;
        id v15 = "-[ADCommandCenter(Metrics) _metrics_isSystemIdle]";
        id v5 = "%s NO (hasActiveClients == YES)";
        goto LABEL_16;
      }
      return v4;
    }
    unsigned int v9 = [(ADCommandCenter *)self _isRequestDelaying];
    BOOL v10 = AFSiriLogContextDaemon;
    BOOL v11 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v11)
      {
        int v14 = 136315138;
        id v15 = "-[ADCommandCenter(Metrics) _metrics_isSystemIdle]";
        uint64_t v12 = "%s NO (isRequestDelaying == YES)";
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v14, 0xCu);
      }
    }
    else if (v11)
    {
      int v14 = 136315138;
      id v15 = "-[ADCommandCenter(Metrics) _metrics_isSystemIdle]";
      uint64_t v12 = "%s YES";
      goto LABEL_24;
    }
    LOBYTE(v4) = v9 ^ 1;
    return v4;
  }
  id v3 = AFSiriLogContextDaemon;
  int v4 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v4)
  {
    int v14 = 136315138;
    id v15 = "-[ADCommandCenter(Metrics) _metrics_isSystemIdle]";
    id v5 = "%s NO (isInCall == YES)";
    goto LABEL_16;
  }
  return v4;
}

- (BOOL)_metrics_isAssistantOrDictationEnabled
{
  id v2 = +[AFPreferences sharedPreferences];
  if (([v2 assistantIsEnabled] & 1) != 0
    || ([v2 dictationIsEnabled] & 1) != 0)
  {
    BOOL v3 = 1;
  }
  else
  {
    int v4 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      id v7 = "-[ADCommandCenter(Metrics) _metrics_isAssistantOrDictationEnabled]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s NO (!assistantIsEnabled && !dictationIsEnabled)", (uint8_t *)&v6, 0xCu);
    }
    BOOL v3 = 0;
  }

  return v3;
}

- (void)_sendMetrics:(id)a3 requiresActiveSession:(BOOL)a4 batch:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v38 = "-[ADCommandCenter(Metrics) _sendMetrics:requiresActiveSession:batch:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (!v10)
  {
    double v16 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    *(_DWORD *)long long buf = 136315138;
    id v38 = "-[ADCommandCenter(Metrics) _sendMetrics:requiresActiveSession:batch:completion:]";
    id v17 = "%s No metrics to send.";
    goto LABEL_15;
  }
  if (![(ADCommandCenter *)self _metrics_isSystemIdle])
  {
    [v11 markFailedWithType:3];
    double v16 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    *(_DWORD *)long long buf = 136315138;
    id v38 = "-[ADCommandCenter(Metrics) _sendMetrics:requiresActiveSession:batch:completion:]";
    id v17 = "%s Attempted to send metrics when system is busy.";
    goto LABEL_15;
  }
  if (![(ADCommandCenter *)self _metrics_isAssistantOrDictationEnabled])
  {
    [v11 markFailedWithType:4];
    double v16 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    *(_DWORD *)long long buf = 136315138;
    id v38 = "-[ADCommandCenter(Metrics) _sendMetrics:requiresActiveSession:batch:completion:]";
    id v17 = "%s Attempted to send metrics when Assistant and Dictation are disabled.";
    goto LABEL_15;
  }
  int v14 = +[AFPreferences sharedPreferences];
  unsigned int v15 = [v14 isDictationHIPAACompliant];

  if (v15)
  {
    [v11 markFailedWithType:7];
    double v16 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    *(_DWORD *)long long buf = 136315138;
    id v38 = "-[ADCommandCenter(Metrics) _sendMetrics:requiresActiveSession:batch:completion:]";
    id v17 = "%s Attempted to send metrics when HIPAA compliance for On-Device Dictation.";
    goto LABEL_15;
  }
  unsigned int v18 = +[AFSiriDataSharingSensitivityManager shared];
  unsigned int v19 = [v18 isOptedOutOfMTE];

  if (v19)
  {
    [v11 markFailedWithType:8];
    id v20 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      id v38 = "-[ADCommandCenter(Metrics) _sendMetrics:requiresActiveSession:batch:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s #MTEOptOut Attempted to send metrics when device is opted out of MTE", buf, 0xCu);
    }
    goto LABEL_16;
  }
  if (!v8
    || ([(ADCommandCenter *)self _sessionManager],
        id v21 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v22 = [v21 hasActiveSessionForSendingMetrics],
        v21,
        (v22 & 1) != 0))
  {
    double v23 = [v10 aceId];
    if (!v23)
    {
      double v23 = SiriCoreUUIDStringCreate();
      [v10 setAceId:v23];
    }
    unsigned __int8 v24 = [v10 category];
    id v25 = AFSiriLogContextDaemon;
    BOOL v26 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (v24)
    {
      if (v26)
      {
        *(_DWORD *)long long buf = 136315650;
        id v38 = "-[ADCommandCenter(Metrics) _sendMetrics:requiresActiveSession:batch:completion:]";
        __int16 v39 = 2112;
        __int16 v40 = v24;
        __int16 v41 = 2112;
        __int16 v42 = v23;
        uint64_t v27 = "%s Sending metrics (%@:%@)...";
        id v28 = v25;
        uint32_t v29 = 32;
LABEL_31:
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, v27, buf, v29);
      }
    }
    else if (v26)
    {
      *(_DWORD *)long long buf = 136315394;
      id v38 = "-[ADCommandCenter(Metrics) _sendMetrics:requiresActiveSession:batch:completion:]";
      __int16 v39 = 2112;
      __int16 v40 = v23;
      uint64_t v27 = "%s Sending metrics (%@)...";
      id v28 = v25;
      uint32_t v29 = 22;
      goto LABEL_31;
    }
    [(ADCommandCenter *)self _sendCommandToServer:v10 opportunistically:v8];
    id v30 = [(ADCommandCenter *)self _sessionManager];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100284CE0;
    v33[3] = &unk_100509068;
    void v33[4] = self;
    id v34 = v24;
    id v35 = v23;
    id v36 = v12;
    id v31 = v23;
    id v32 = v24;
    [v30 barrier:v33];

    goto LABEL_18;
  }
  [v11 markFailedWithType:5];
  double v16 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v38 = "-[ADCommandCenter(Metrics) _sendMetrics:requiresActiveSession:batch:completion:]";
    id v17 = "%s Attempted to send metrics when session is inactive and active session is a requirement.";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, v17, buf, 0xCu);
  }
LABEL_16:
  if (v12) {
    (*((void (**)(id, void))v12 + 2))(v12, 0);
  }
LABEL_18:
}

- (void)_reallyCommitOrSaveMetrics:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v27 = "-[ADCommandCenter(Metrics) _reallyCommitOrSaveMetrics:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (v4)
  {
    if ([(ADCommandCenter *)self _metrics_isAssistantOrDictationEnabled])
    {
      int v6 = +[AFSiriDataSharingSensitivityManager shared];
      unsigned int v7 = [v6 isOptedOutOfMTE];

      if (!v7)
      {
        id v14 = objc_alloc((Class)AFSafetyBlock);
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_100285388;
        void v24[3] = &unk_10050C2A0;
        void v24[4] = self;
        id v15 = v4;
        id v25 = v15;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        void v22[2] = sub_10028543C;
        v22[3] = &unk_10050B918;
        id v16 = [v14 initWithBlock:v24];
        id v23 = v16;
        [(ADCommandCenter *)self _sendMetrics:v15 requiresActiveSession:1 batch:0 completion:v22];
        dispatch_time_t v17 = dispatch_time(0, 8000000000);
        unsigned int v18 = [(ADCommandCenter *)self _queue];
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100285450;
        void v20[3] = &unk_10050E138;
        id v21 = v16;
        id v19 = v16;
        dispatch_after(v17, v18, v20);

        goto LABEL_14;
      }
      BOOL v8 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v9 = v8;
        id v10 = [v4 category];
        id v11 = [v4 aceId];
        *(_DWORD *)long long buf = 136315650;
        uint64_t v27 = "-[ADCommandCenter(Metrics) _reallyCommitOrSaveMetrics:]";
        __int16 v28 = 2112;
        uint32_t v29 = v10;
        __int16 v30 = 2112;
        id v31 = v11;
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s #MTEOptOut Dropped metrics (%@:%@) because device is opted out of MTE.", buf, 0x20u);
LABEL_12:
      }
    }
    else
    {
      id v13 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        unsigned int v9 = v13;
        id v10 = [v4 category];
        id v11 = [v4 aceId];
        *(_DWORD *)long long buf = 136315650;
        uint64_t v27 = "-[ADCommandCenter(Metrics) _reallyCommitOrSaveMetrics:]";
        __int16 v28 = 2112;
        uint32_t v29 = v10;
        __int16 v30 = 2112;
        id v31 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Dropped metrics (%@:%@) because Assistant and Dictation are not enabled.", buf, 0x20u);
        goto LABEL_12;
      }
    }
  }
  else
  {
    id v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v27 = "-[ADCommandCenter(Metrics) _reallyCommitOrSaveMetrics:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s No metrics to send.", buf, 0xCu);
    }
  }
LABEL_14:
}

- (id)_offlineMetricsManager
{
  offlineMetricsManager = self->_offlineMetricsManager;
  if (!offlineMetricsManager)
  {
    id v4 = objc_alloc_init(ADOfflineMetricsManager);
    id v5 = self->_offlineMetricsManager;
    self->_offlineMetricsManager = v4;

    offlineMetricsManager = self->_offlineMetricsManager;
  }
  return offlineMetricsManager;
}

- (void)sanityCheckAutodownloadedAssetsForced:(BOOL)a3
{
  id v5 = [(ADCommandCenter *)self _queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100285670;
  v6[3] = &unk_10050CD50;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (void)_updateAutoDownloadedVoiceAssetsForOutputVoice
{
  id v2 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    unsigned __int8 v22 = "-[ADCommandCenter(OutputVoice) _updateAutoDownloadedVoiceAssetsForOutputVoice]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (sub_1001FA16C())
  {
    BOOL v3 = +[ADPreferences sharedPreferences];
    id v4 = [v3 outputVoice];

    id v5 = [v4 languageCode];
    if (v5)
    {
      int v6 = [v4 name];
      BOOL v7 = +[AFLocalization sharedInstance];
      BOOL v8 = [v4 languageCode];
      unsigned int v9 = objc_msgSend(v7, "voiceNamesForOutputLanguageCode:gender:", v8, objc_msgSend(v4, "gender"));

      if (!v6 || ([v9 containsObject:v6] & 1) == 0)
      {
        id v10 = [v9 firstObject];
        if (v10 != v6)
        {
          id v11 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 136315650;
            unsigned __int8 v22 = "-[ADCommandCenter(OutputVoice) _updateAutoDownloadedVoiceAssetsForOutputVoice]";
            __int16 v23 = 2112;
            unsigned __int8 v24 = v6;
            __int16 v25 = 2112;
            BOOL v26 = v10;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Substituting subscription for output voice '%@' with subscription for preferred Siri voice '%@'", buf, 0x20u);
          }
          id v12 = v10;

          int v6 = v12;
        }
      }
      id v13 = [objc_alloc((Class)SiriTTSSynthesisVoice) initWithLanguage:v5 name:v6];
      id v14 = objc_alloc_init((Class)SiriTTSDaemonSession);
      id v20 = v13;
      id v15 = +[NSArray arrayWithObjects:&v20 count:1];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1002859BC;
      v18[3] = &unk_10050C610;
      id v19 = v13;
      id v16 = v13;
      [v14 subscribeWithVoices:v15 reply:v18];
    }
  }
  else
  {
    dispatch_time_t v17 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      unsigned __int8 v22 = "-[ADCommandCenter(OutputVoice) _updateAutoDownloadedVoiceAssetsForOutputVoice]";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Not updating auto-downloaded voice assets because the platform doesn't support TTS", buf, 0xCu);
    }
  }
}

- (BOOL)_outputVoice_setOutputVoice:(id)a3
{
  id v4 = a3;
  if (sub_1001FA16C())
  {
    id v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315394;
      id v15 = "-[ADCommandCenter(OutputVoice) _outputVoice_setOutputVoice:]";
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v14, 0x16u);
    }
    int v6 = +[ADPreferences sharedPreferences];
    BOOL v7 = +[AFLocalization sharedInstance];
    BOOL v8 = [v7 getValidOutputVoiceWithDialects:v4];

    unsigned int v9 = [v6 outputVoiceWithFallback:0];
    if ([v8 isEqual:v9]
      && ([v9 wasInitializedFromDictionaryRepresentation] & 1) != 0)
    {
      id v10 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v14 = 136315650;
        id v15 = "-[ADCommandCenter(OutputVoice) _outputVoice_setOutputVoice:]";
        __int16 v16 = 2112;
        id v17 = v8;
        __int16 v18 = 2112;
        id v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s no need to change output voice to %@ because it is already set to %@", (uint8_t *)&v14, 0x20u);
      }
      BOOL v11 = 0;
    }
    else
    {
      [v6 setOutputVoice:v8];
      [v6 synchronize];
      id v12 = AFSiriLogContextDaemon;
      BOOL v11 = 1;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v14 = 136315650;
        id v15 = "-[ADCommandCenter(OutputVoice) _outputVoice_setOutputVoice:]";
        __int16 v16 = 2112;
        id v17 = v9;
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s output voice changed from %@ to %@", (uint8_t *)&v14, 0x20u);
      }
    }
    [(ADCommandCenter *)self _updateAutoDownloadedVoiceAssetsForOutputVoice];
    [v4 languageCode];
    VSPreferencesSetSpokenLanguageIdentifier();
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_handleCommandInAMOS:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, id, void))a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(ADCommandCenter *)self _amosSADomainObjectCreate:v6 completion:v7];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(ADCommandCenter *)self _amosSADomainObjectRetrieve:v6 completion:v7];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(ADCommandCenter *)self _amosSADomainObjectUpdate:v6 completion:v7];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(ADCommandCenter *)self _amosSADomainObjectCancel:v6 completion:v7];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [(ADCommandCenter *)self _amosSADomainObjectDelete:v6 completion:v7];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [(ADCommandCenter *)self _amosSADomainObjectCommit:v6 completion:v7];
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                BOOL v8 = AFSiriLogContextDaemon;
                if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
                {
                  int v10 = 136315394;
                  BOOL v11 = "-[ADCommandCenter(AMOS) _handleCommandInAMOS:completion:]";
                  __int16 v12 = 2112;
                  id v13 = v6;
                  _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Unsuccessfully tried to handle non AMOS command as AMOS %@", (uint8_t *)&v10, 0x16u);
                  if (!v7) {
                    goto LABEL_18;
                  }
                }
                else if (!v7)
                {
                  goto LABEL_18;
                }
                id v9 = [objc_alloc((Class)SACommandFailed) initWithReason:@"Tried to handle non AMOS command as AMOS"];
                v7[2](v7, v9, 0);

                goto LABEL_18;
              }
              [(ADCommandCenter *)self _amosSADomainObjectPunchOut:v6 completion:v7];
            }
          }
        }
      }
    }
  }
LABEL_18:
}

- (void)_saDomainObjectPunchOut:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_10028C9E8;
  v7[3] = &unk_100509668;
  BOOL v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(ADCommandCenter *)v8 _handleSADOCommandIfServiceDoesNotUseAMOS:v6 allowInterposing:0 completion:v7];
}

- (void)_amosSADomainObjectPunchOut:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id, void))a4;
  BOOL v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136315138;
    id v10 = "-[ADCommandCenter(AMOS) _amosSADomainObjectPunchOut:completion:]";
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s We don't know how to generically punch out to domain objects. A non-ui plugin needs to handle this.", (uint8_t *)&v9, 0xCu);
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v6)
  {
LABEL_3:
    id v8 = [objc_alloc((Class)SACommandFailed) initWithReason:@"No plugin for command"];
    v6[2](v6, v8, 0);
  }
LABEL_4:
}

- (void)_saDomainObjectCommit:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_10028CC50;
  v7[3] = &unk_100509668;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(ADCommandCenter *)v8 _handleSADOCommandIfServiceDoesNotUseAMOS:v6 allowInterposing:0 completion:v7];
}

- (void)_amosSADomainObjectCommit:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  id v9 = [v8 identifier];

  id v10 = [v9 absoluteString];
  BOOL v11 = [(ADCommandCenter *)self _domainObjectCache];
  __int16 v12 = [v11 domainObjectForKey:v10];
  if (v12)
  {
    id v20 = self;
    id v13 = [v11 oldIdForKey:v10];
    if (v13)
    {
      id v14 = +[NSURL URLWithString:v13];
    }
    else
    {
      id v14 = v9;
    }
    __int16 v16 = v14;
    id v17 = +[AceObject aceObjectWithDictionary:v12];
    [v17 setIdentifier:v16];
    [v6 setIdentifier:v17];
    __int16 v18 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315650;
      uint32_t v29 = "-[ADCommandCenter(AMOS) _amosSADomainObjectCommit:completion:]";
      __int16 v30 = 2112;
      id v31 = v6;
      __int16 v32 = 2112;
      id v33 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Committing %@ with oldId %@", buf, 0x20u);
    }
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    void v21[2] = sub_10028D020;
    v21[3] = &unk_100509730;
    id v22 = v9;
    id v23 = v17;
    id v24 = v11;
    id v25 = v10;
    id v26 = v6;
    id v27 = v7;
    id v19 = v17;
    [(ADCommandCenter *)v20 _sendAMOSCommandToService:v26 responseHandler:v21];
  }
  else
  {
    id v15 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint32_t v29 = "-[ADCommandCenter(AMOS) _amosSADomainObjectCommit:completion:]";
      __int16 v30 = 2112;
      id v31 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Object not found in AMOS %@", buf, 0x16u);
    }
    id v13 = [objc_alloc((Class)SACommandFailed) initWithReason:@"Object not found in amos"];
    if (v7) {
      (*((void (**)(id, id, void))v7 + 2))(v7, v13, 0);
    }
  }
}

- (void)_saDomainObjectDelete:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_10028D320;
  v7[3] = &unk_100509668;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(ADCommandCenter *)v8 _handleSADOCommandIfServiceDoesNotUseAMOS:v6 allowInterposing:0 completion:v7];
}

- (void)_amosSADomainObjectDelete:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  id v9 = [v8 identifier];

  if ([v9 isAMOSIdentifier])
  {
    id v10 = [v9 absoluteString];
    BOOL v11 = [(ADCommandCenter *)self _domainObjectCache];
    __int16 v12 = [v11 oldIdForKey:v10];
    id v13 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315650;
      id v23 = "-[ADCommandCenter(AMOS) _amosSADomainObjectDelete:completion:]";
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2112;
      id v27 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Removing object with identifier %@ old identifier %@ from amos", buf, 0x20u);
    }
    id v14 = [v6 identifier];
    id v15 = v14;
    if (v12)
    {
      __int16 v16 = +[NSURL URLWithString:v12];
      [v15 setIdentifier:v16];
    }
    else
    {
      [v14 setIdentifier:0];
    }

    [v11 setDomainObject:0 forKey:v10];
  }
  id v17 = [v6 identifier];
  __int16 v18 = [v17 identifier];

  if (v18)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10028D634;
    void v20[3] = &unk_100509708;
    id v21 = v7;
    [(ADCommandCenter *)self _sendAMOSCommandToService:v6 responseHandler:v20];
    id v19 = v21;
LABEL_12:

    goto LABEL_13;
  }
  if (v7)
  {
    id v19 = objc_alloc_init((Class)SADomainObjectDeleteCompleted);
    (*((void (**)(id, id, void))v7 + 2))(v7, v19, 0);
    goto LABEL_12;
  }
LABEL_13:
}

- (void)_saDomainObjectCancel:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_10028D784;
  v7[3] = &unk_100509668;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(ADCommandCenter *)v8 _handleSADOCommandIfServiceDoesNotUseAMOS:v6 allowInterposing:0 completion:v7];
}

- (void)_amosSADomainObjectCancel:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = objc_alloc_init((Class)SADomainObjectCancelCompleted);
    (*((void (**)(id, id, void))a4 + 2))(v5, v6, 0);
  }
}

- (void)_saDomainObjectUpdate:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_10028D95C;
  v7[3] = &unk_100509668;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(ADCommandCenter *)v8 _handleSADOCommandIfServiceDoesNotUseAMOS:v6 allowInterposing:0 completion:v7];
}

- (void)_amosSADomainObjectUpdate:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, id, void))a4;
  id v7 = a3;
  id v8 = [v7 identifier];
  id v9 = [v8 identifier];
  id v10 = [v9 absoluteString];
  BOOL v11 = [(ADCommandCenter *)self _domainObjectCache];
  __int16 v12 = [v11 domainObjectForKey:v10];
  id v13 = AFSiriLogContextDaemon;
  BOOL v14 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v12)
  {
    id v21 = v8;
    if (v14)
    {
      *(_DWORD *)long long buf = 136315394;
      id v23 = "-[ADCommandCenter(AMOS) _amosSADomainObjectUpdate:completion:]";
      __int16 v24 = 2112;
      id v25 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Updating store object %@", buf, 0x16u);
    }
    id v15 = +[AceObject aceObjectWithDictionary:v12];
    __int16 v16 = [v7 setFields];
    id v17 = [v7 addFields];
    __int16 v18 = [v7 removeFields];

    [v15 updateUsingSet:v16 add:v17 remove:v18];
    id v19 = [v15 dictionary];
    [v11 setDomainObject:v19 forKey:v10];

    id v20 = objc_alloc_init((Class)SADomainObjectUpdateCompleted);
    [v20 setIdentifier:v9];
    if (v6) {
      v6[2](v6, v20, 0);
    }

    id v7 = v15;
    id v8 = v21;
  }
  else
  {
    if (v14)
    {
      *(_DWORD *)long long buf = 136315138;
      id v23 = "-[ADCommandCenter(AMOS) _amosSADomainObjectUpdate:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Going to bundle for object update", buf, 0xCu);
    }
    [(ADCommandCenter *)self _updateObjectFromService:v7 sadIdentifier:v8 completion:v6];
  }
}

- (void)_updateObjectFromService:(id)a3 sadIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = objc_alloc_init((Class)SADomainObjectRetrieve);
  id v12 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v10, 0);

  [v11 setIdentifiers:v12];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10028DD8C;
  v15[3] = &unk_1005096E0;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v13 = v9;
  id v14 = v8;
  [(ADCommandCenter *)self _sendAMOSCommandToService:v11 responseHandler:v15];
}

- (void)_saDomainObjectRetrieve:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_10028E1F4;
  v7[3] = &unk_100509668;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(ADCommandCenter *)v8 _handleSADOCommandIfServiceDoesNotUseAMOS:v6 allowInterposing:0 completion:v7];
}

- (void)_amosSADomainObjectRetrieve:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v24 = a4;
  id v25 = v6;
  id v7 = [v6 identifiers];
  id v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v7, "count"));
  id v26 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v7, "count"));
  id v9 = [(ADCommandCenter *)self _domainObjectCache];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v7;
  id v10 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v10)
  {
    id v11 = v10;
    id v27 = 0;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v15 = [v14 identifier];
        id v16 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315394;
          double v37 = "-[ADCommandCenter(AMOS) _amosSADomainObjectRetrieve:completion:]";
          __int16 v38 = 2112;
          id v39 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Retrieve looking in amos for key %@", buf, 0x16u);
        }
        id v17 = [v15 absoluteString];
        id v18 = [v9 domainObjectForKey:v17];

        if (v18)
        {
          id v19 = +[SADomainObject aceObjectWithDictionary:v18];
          [v19 setIdentifier:v15];
          [v8 addObject:v19];
        }
        else
        {
          if (!v27)
          {
            id v27 = [v14 groupIdentifier];
          }
          [v26 addObject:v14];
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v11);
  }
  else
  {
    id v27 = 0;
  }

  if ([v26 count])
  {
    id v20 = AFSiriLogContextDaemon;
    id v22 = v24;
    id v21 = v25;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      double v37 = "-[ADCommandCenter(AMOS) _amosSADomainObjectRetrieve:completion:]";
      __int16 v38 = 2112;
      id v39 = v26;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s Retrieve going to bundle for remaining identifiers %@", buf, 0x16u);
    }
    [v25 setIdentifiers:v26];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10028E668;
    void v29[3] = &unk_1005096B8;
    id v30 = v8;
    id v31 = v24;
    [(ADCommandCenter *)self _sendAMOSCommandToService:v25 responseHandler:v29];

    id v23 = v30;
  }
  else
  {
    id v23 = objc_alloc_init((Class)SADomainObjectRetrieveCompleted);
    [v23 setObjects:v8];
    id v22 = v24;
    id v21 = v25;
    if (v24) {
      (*((void (**)(id, id, void))v24 + 2))(v24, v23, 0);
    }
  }
}

- (void)_saDomainObjectCreate:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_10028E7E8;
  v7[3] = &unk_100509668;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(ADCommandCenter *)v8 _handleSADOCommandIfServiceDoesNotUseAMOS:v6 allowInterposing:1 completion:v7];
}

- (void)_amosSADomainObjectCreate:(id)a3 completion:(id)a4
{
  id v13 = (void (**)(id, id, void))a4;
  id v6 = a3;
  id v7 = sub_1001FB43C();
  id v8 = [v6 object];

  [v8 setIdentifier:v7];
  id v9 = [(ADCommandCenter *)self _domainObjectCache];
  id v10 = [v8 dictionary];
  id v11 = [v7 absoluteString];
  [v9 setDomainObject:v10 forKey:v11];

  id v12 = objc_alloc_init((Class)SADomainObjectCreateCompleted);
  [v12 setIdentifier:v7];
  if (v13) {
    v13[2](v13, v12, 0);
  }
}

- (void)_sendAMOSCommandToService:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ADCommandCenter *)self _serviceManager];
  id v9 = [v6 domainFromSADObject];
  id v10 = [v6 encodedClassName];
  id v11 = [v8 serviceForDomain:v9 command:v10];

  if (v11)
  {
    id v12 = [v6 domainFromSADObject];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10028EB28;
    v15[3] = &unk_100509690;
    id v16 = v6;
    id v17 = v7;
    [v11 handleCommand:v16 forDomain:v12 executionContext:0 reply:v15];
  }
  else
  {
    id v13 = objc_alloc_init((Class)SACommandIgnored);
    id v14 = [v6 aceId];
    [v13 setRefId:v14];

    (*((void (**)(id, id, uint64_t))v7 + 2))(v7, v13, 2);
  }
}

- (void)_handleSADOCommandIfServiceDoesNotUseAMOS:(id)a3 allowInterposing:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 encodedClassName];
  id v11 = [v8 domainFromSADObject];
  id v12 = [(ADCommandCenter *)self _serviceManager];
  id v13 = [v12 serviceForDomain:v11 command:v10];
  id v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315906;
    id v24 = "-[ADCommandCenter(AMOS) _handleSADOCommandIfServiceDoesNotUseAMOS:allowInterposing:completion:]";
    __int16 v25 = 2112;
    id v26 = v13;
    __int16 v27 = 2112;
    __int16 v28 = v10;
    __int16 v29 = 2112;
    id v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Found service %@ for command %@ in domain %@", buf, 0x2Au);
  }
  if (v13 && ([v13 usesManagedStorageForDomain:v11] & 1) == 0)
  {
    id v16 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v24 = "-[ADCommandCenter(AMOS) _handleSADOCommandIfServiceDoesNotUseAMOS:allowInterposing:completion:]";
      id v17 = "%s Service does NOT use AMOS for command";
      goto LABEL_15;
    }
LABEL_16:
    id v18 = [v13 identifier];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10028F114;
    void v19[3] = &unk_100509668;
    id v20 = v8;
    id v21 = v13;
    id v22 = v9;
    [(ADCommandCenter *)self _sendAMOSCommand:v20 domain:v11 toBundleWithIdentifier:v18 completion:v19];

    goto LABEL_17;
  }
  if (a4)
  {
    unsigned int v15 = [v13 implementsCommand:v10 forDomain:v11];
    id v16 = AFSiriLogContextDaemon;
    if (v15)
    {
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        id v24 = "-[ADCommandCenter(AMOS) _handleSADOCommandIfServiceDoesNotUseAMOS:allowInterposing:completion:]";
        id v17 = "%s Services uses AMOS, but wants to intercept command";
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, v17, buf, 0xCu);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
  }
  else
  {
    id v16 = AFSiriLogContextDaemon;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v24 = "-[ADCommandCenter(AMOS) _handleSADOCommandIfServiceDoesNotUseAMOS:allowInterposing:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Service uses AMOS for command", buf, 0xCu);
  }
  (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);
LABEL_17:
}

- (void)_sendAMOSCommand:(id)a3 domain:(id)a4 toBundleWithIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(ADCommandCenter *)self _serviceManager];
  unsigned int v15 = [v14 serviceForIdentifier:v12];

  if (v15)
  {
    if (![v15 isSystemService])
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10028F4A0;
      v18[3] = &unk_10050B420;
      void v18[4] = self;
      id v19 = v10;
      id v20 = v13;
      [v15 handleCommand:v19 forDomain:v11 executionContext:0 reply:v18];

      goto LABEL_9;
    }
    id v16 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315650;
      id v22 = "-[ADCommandCenter(AMOS) _sendAMOSCommand:domain:toBundleWithIdentifier:completion:]";
      __int16 v23 = 2112;
      id v24 = v10;
      __int16 v25 = 2112;
      id v26 = v12;
      id v17 = "%s Can't route to system service for command %@ identifier %@";
      goto LABEL_11;
    }
  }
  else
  {
    id v16 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315650;
      id v22 = "-[ADCommandCenter(AMOS) _sendAMOSCommand:domain:toBundleWithIdentifier:completion:]";
      __int16 v23 = 2112;
      id v24 = v10;
      __int16 v25 = 2112;
      id v26 = v12;
      id v17 = "%s No service connection for command %@ identifier %@";
LABEL_11:
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x20u);
      if (!v13) {
        goto LABEL_9;
      }
      goto LABEL_7;
    }
  }
  if (v13) {
LABEL_7:
  }
    (*((void (**)(id, void, void, void))v13 + 2))(v13, 0, 0, 0);
LABEL_9:
}

- (BOOL)_isFauxPeer:(id)a3
{
  id v3 = a3;
  id v4 = [v3 idsDeviceUniqueIdentifier];
  if (v4)
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = [v3 idsIdentifier];
    if (v6)
    {
      BOOL v5 = 0;
    }
    else
    {
      id v7 = [v3 rapportEffectiveIdentifier];
      if (v7)
      {
        BOOL v5 = 0;
      }
      else
      {
        id v8 = [v3 homeKitAccessoryIdentifier];
        BOOL v5 = v8 == 0;
      }
    }
  }
  return v5;
}

- (BOOL)_peerIsPairedPhone:(id)a3
{
  id v3 = [a3 rapportEffectiveIdentifier];
  unsigned __int8 v4 = [v3 isEqualToString:@"BTPipe-Phone"];

  return v4;
}

- (BOOL)_peerIsPairedWatch:(id)a3
{
  id v3 = [a3 rapportEffectiveIdentifier];
  unsigned __int8 v4 = [v3 isEqualToString:@"BTPipe-Watch"];

  return v4;
}

- (void)startRemoteRequest:(id)a3 onTargetDevice:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = AFSupportsMultiUser();
  if (v9 && v11)
  {
    id v12 = +[ADMultiUserService sharedService];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1002EA650;
    v13[3] = &unk_10050B490;
    id v14 = v9;
    unsigned int v15 = self;
    id v16 = v8;
    id v17 = v10;
    [v12 getIDSIdentifierForAssistantId:v14 completion:v13];
  }
  else
  {
    [(ADCommandCenter *)self startRemoteRequest:v8 completion:v10];
  }
}

- (void)_startRemoteRequest:(id)a3 onPeer:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[AFInstanceContext currentContext];
  [(ADCommandCenter *)self _startRemoteRequest:v10 onPeer:v9 withContext:v11 completion:v8];
}

- (void)_startRemoteRequest:(id)a3 onPeer:(id)a4 withContext:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v39 = a5;
  id v12 = a6;
  id v13 = [v10 handoffOriginDeviceName];

  if (!v13)
  {
    id v14 = AFUserAssignedDeviceName();
    [v10 setHandoffOriginDeviceName:v14];
  }
  if (AFIsNano())
  {
    unsigned int v15 = [(ADCommandCenter *)self _sharedDataService];
    [v15 startRemoteRequest:v10 completion:v12];
  }
  else
  {
    id v16 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ADCommandCenter(RemoteExecute) _startRemoteRequest:onPeer:withContext:completion:]";
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }
    id v36 = +[ADPeerCloudService sharedInstance];
    if (v11)
    {
      id v38 = v11;
    }
    else
    {
      id v38 = [v36 companionPeer];
    }
    id v17 = +[NSUUID UUID];
    id v18 = [v17 UUIDString];

    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    long long v51 = sub_1002EADF4;
    long long v52 = sub_1002EAE04;
    id v53 = 0;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1002EAE0C;
    v40[3] = &unk_10050B468;
    id v42 = v12;
    id v43 = buf;
    id v19 = v18;
    id v41 = v19;
    id v20 = objc_retainBlock(v40);
    int v21 = _AFPreferencesCompanionMessagingEnabled();
    id v22 = *(void **)(*(void *)&buf[8] + 40);
    if (v21)
    {
      *(void *)(*(void *)&buf[8] + 40) = @"rapport";

      __int16 v23 = +[AFAnalytics sharedAnalytics];
      id v24 = AFAnalyticsContextCreateWithRequestInfo();
      v48[1] = v19;
      v49[0] = v24;
      uint64_t v25 = *(void *)(*(void *)&buf[8] + 40);
      v47[0] = @"transport type";
      v47[1] = @"id";
      v48[0] = v25;
      id v26 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
      v49[1] = v26;
      __int16 v27 = +[NSArray arrayWithObjects:v49 count:2];
      __int16 v28 = AFAnalyticsContextsMerge();
      [v23 logEventWithType:4803 context:v28];

      __int16 v29 = +[ADCompanionService sharedInstance];
      [v29 startRemoteRequest:v10 onPeer:v38 completion:v20];
    }
    else
    {
      *(void *)(*(void *)&buf[8] + 40) = @"ids";

      id v30 = +[AFAnalytics sharedAnalytics];
      id v31 = AFAnalyticsContextCreateWithRequestInfo();
      v45[1] = v19;
      v46[0] = v31;
      uint64_t v32 = *(void *)(*(void *)&buf[8] + 40);
      v44[0] = @"transport type";
      v44[1] = @"id";
      v45[0] = v32;
      long long v33 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
      v46[1] = v33;
      long long v34 = +[NSArray arrayWithObjects:v46 count:2];
      long long v35 = AFAnalyticsContextsMerge();
      [v30 logEventWithType:4803 context:v35];

      [v37 startRemoteRequest:v10 onPeer:v38 completion:v20];
    }

    _Block_object_dispose(buf, 8);
  }
}

- (void)startRemoteRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ADCommandCenter *)self _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002EB03C;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (id)_remoteExecute_primaryUserDevicesWithTypes:(unint64_t)a3
{
  unsigned __int8 v4 = +[ADPeerCloudService sharedInstance];
  BOOL v5 = [v4 peers];
  id v6 = [v5 allObjects];
  id v7 = +[NSMutableArray arrayWithArray:v6];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002EB180;
  v11[3] = &unk_10050B440;
  void v11[4] = a3;
  id v8 = +[NSPredicate predicateWithBlock:v11];
  [v7 filterUsingPredicate:v8];

  id v9 = +[NSArray arrayWithArray:v7];

  return v9;
}

- (BOOL)_remoteExecute_shouldSendCommandToPrimaryUser:(id)a3
{
  id v3 = a3;
  id v4 = [v3 length];
  if (v4)
  {
    BOOL v5 = +[ADMultiUserService sharedService];
    id v6 = [v5 primaryUser];
    id v7 = [v6 sharedUserID];
    unsigned __int8 v8 = [v7 isEqualToString:v3];

    if (v8)
    {
      BOOL v9 = 0;
      uint64_t v10 = 1;
      goto LABEL_7;
    }
    id v11 = +[ADMultiUserService sharedService];
    id v12 = [v11 sharedUsersBySharedUserID];
    id v13 = [v12 objectForKey:v3];

    id v14 = [v13 companionAssistantID];
    BOOL v9 = v14 == 0;
  }
  else
  {
    BOOL v9 = 0;
  }
  uint64_t v10 = 0;
LABEL_7:
  if (v4) {
    int v15 = v10;
  }
  else {
    int v15 = 1;
  }
  uint64_t v16 = v15 | v9;
  id v17 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    BOOL v19 = v4 == 0;
    id v20 = v17;
    int v21 = +[NSNumber numberWithBool:v16];
    id v22 = +[NSNumber numberWithBool:v19];
    __int16 v23 = +[NSNumber numberWithBool:v10];
    id v24 = +[NSNumber numberWithBool:v9];
    int v25 = 136316162;
    id v26 = "-[ADCommandCenter(RemoteExecute) _remoteExecute_shouldSendCommandToPrimaryUser:]";
    __int16 v27 = 2112;
    __int16 v28 = v21;
    __int16 v29 = 2112;
    id v30 = v22;
    __int16 v31 = 2112;
    uint64_t v32 = v23;
    __int16 v33 = 2112;
    long long v34 = v24;
    _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%s shouldSendToPrimaryUser: %@ (isSharedUserNil=%@, isServerSelectedUserEqualToPrimaryUser=%@, isServerSelectedSharedUserInvalid=%@)", (uint8_t *)&v25, 0x34u);
  }
  return v16;
}

- (void)_saExecuteOnRemoteRequest:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v36 = "-[ADCommandCenter(RemoteExecute) _saExecuteOnRemoteRequest:executionContext:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v12 = [v8 serializedCommand];
  if (v12)
  {
    id v13 = [v8 personaId];
    [v8 setPersonaId:0];
    id v30 = v9;
    [v9 setPersonaId:v13];
    [(ADCommandCenter *)self _addNetworkActivityTracingForLabel:7 start:1 withCompletionReason:0 andError:0];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1002EB998;
    v31[3] = &unk_10050B420;
    id v14 = v8;
    id v32 = v14;
    __int16 v33 = self;
    id v34 = v10;
    __int16 v29 = objc_retainBlock(v31);
    int v15 = [v14 remoteDevice];
    uint64_t v16 = [v15 assistantId];

    objc_msgSend(v14, "ad_recipientDevicesType");
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    if ([v17 isEqualToString:@"MobileDevices"])
    {
      uint64_t v18 = 2;
    }
    else if ([v17 isEqualToString:@"HomeDevices"])
    {
      uint64_t v18 = 4;
    }
    else if ([v17 isEqualToString:@"Companion"])
    {
      uint64_t v18 = 1;
    }
    else if ([v17 isEqualToString:@"All"])
    {
      uint64_t v18 = 7;
    }
    else
    {
      uint64_t v18 = 0;
    }

    objc_msgSend(v14, "ad_preferredMessagingOption");
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    if ([v20 isEqualToString:@"IDS"])
    {
      uint64_t v21 = 1;
    }
    else if ([v20 isEqualToString:@"Rapport"])
    {
      uint64_t v21 = 2;
    }
    else if ([v20 isEqualToString:@"Bluetooth"])
    {
      uint64_t v21 = 1024;
    }
    else if ([v20 isEqualToString:@"Wifi"])
    {
      uint64_t v21 = 2048;
    }
    else if ([v20 isEqualToString:@"Cloud"])
    {
      uint64_t v21 = 4096;
    }
    else if ([v20 isEqualToString:@"All"])
    {
      uint64_t v21 = 7171;
    }
    else
    {
      uint64_t v21 = 0;
    }

    if ([v16 length] || !v18)
    {
      int v25 = [v14 remoteDevice];
      id v26 = [v25 assistantId];
      id v27 = [v14 shouldFallbackOnAWDL];
      __int16 v28 = self;
      id v24 = v29;
      id v9 = v30;
      [(ADCommandCenter *)v28 _remoteExecute_remoteDeviceExecuteSerializedCommand:v12 onDeviceForAssistantId:v26 allowFallbackOnAWDL:v27 executionContext:v30 completion:v29];
    }
    else
    {
      id v22 = [v14 shouldFallbackOnAWDL];
      __int16 v23 = self;
      id v24 = v29;
      id v9 = v30;
      [(ADCommandCenter *)v23 _remoteExecute_remoteDeviceExecuteSerializedCommand:v12 onSpecifiedDeviceTypes:v18 preferredMessagingOption:v21 allowFallbackOnAWDL:v22 executionContext:v30 completion:v29];
    }
  }
  else
  {
    BOOL v19 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      id v36 = "-[ADCommandCenter(RemoteExecute) _saExecuteOnRemoteRequest:executionContext:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s Unable to find command for remote execution", buf, 0xCu);
    }
    id v13 = +[AFError errorWithCode:11];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v13);
  }
}

- (void)_remoteExecute_remoteDeviceExecuteSerializedCommand:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 allowFallbackOnAWDL:(BOOL)a6 executionContext:(id)a7 completion:(id)a8
{
  BOOL v10 = a6;
  BOOL v61 = a5;
  id v63 = a3;
  id v13 = a4;
  id v64 = a7;
  id v14 = a8;
  int v15 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADCommandCenter(RemoteExecute) _remoteExecute_remoteDeviceExecuteSerializedCommand"
                                    ":onPeer:allowsRelay:allowFallbackOnAWDL:executionContext:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v91 = 0x3032000000;
  id v92 = sub_1002EADF4;
  v93 = sub_1002EAE04;
  id v94 = 0;
  +[NSUUID UUID];
  v62 = BOOL v60 = v10;
  uint64_t v16 = [v62 UUIDString];
  id v17 = objc_alloc((Class)NSUUID);
  uint64_t v18 = [(ADCommandCenter *)self _currentRequest];
  BOOL v19 = [v18 currentRequestId];
  id v20 = [v17 initWithUUIDString:v19];

  uint64_t v21 = [v64 info];
  id v22 = [v21 turnId];

  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_1002EC3EC;
  v74[3] = &unk_10050B3D0;
  id v23 = v14;
  id v78 = v23;
  void v74[4] = self;
  id v24 = v20;
  id v75 = v24;
  id v25 = v22;
  id v76 = v25;
  p_long long buf = &buf;
  id v26 = v16;
  id v77 = v26;
  id v27 = objc_retainBlock(v74);
  if (!v13)
  {
    id v42 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = @"ids";

    id v43 = +[AFAnalytics sharedAnalytics];
    uint64_t v44 = *(void *)(*((void *)&buf + 1) + 40);
    v88[0] = @"transport type";
    v88[1] = @"id";
    v89[0] = v44;
    v89[1] = v26;
    BOOL v45 = +[NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:2];
    [v43 logEventWithType:4801 context:v45];

    [(ADSharedDataService *)self->_sharedDataService executeRemoteCommand:v63 completion:v27];
    [(ADCommandCenter *)self _logExecuteOnRemoteRequestForRequestId:v24 turnId:v25 event:0];
    goto LABEL_12;
  }
  if ([(ADCommandCenter *)self _peerIsPairedWatch:v13]
    || [(ADCommandCenter *)self _peerIsPairedPhone:v13])
  {
    __int16 v28 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v86 = 136315138;
      id v87 = "-[ADCommandCenter(RemoteExecute) _remoteExecute_remoteDeviceExecuteSerializedCommand:onPeer:allowsRelay:allo"
            "wFallbackOnAWDL:executionContext:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%s Sending command to paired watch or phone through Rapport.", v86, 0xCu);
    }
    __int16 v29 = +[ADDeviceCircleManager sharedInstance];
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_1002EC7A8;
    v67[3] = &unk_10050B3F8;
    v72[1] = &buf;
    v72[0] = v27;
    id v68 = v26;
    id v69 = v63;
    id v30 = v13;
    id v31 = v26;
    id v32 = v25;
    id v33 = v24;
    id v34 = v13;
    long long v35 = v27;
    id v36 = v23;
    id v37 = v30;
    id v70 = v30;
    BOOL v73 = v61;
    id v71 = v64;
    id v38 = v37;
    id v23 = v36;
    id v27 = v35;
    id v13 = v34;
    id v24 = v33;
    id v25 = v32;
    id v26 = v31;
    [v29 executeCommand:v69 onPeer:v38 executionContext:v71 completion:v67];

    [(ADCommandCenter *)self _logExecuteOnRemoteRequestForRequestId:v24 turnId:v25 event:0];
    id v39 = (void **)v72;
    __int16 v40 = v68;
  }
  else
  {
    if (!AFSupportsHALOnDemandRapportConnection())
    {
      if (_AFPreferencesCompanionMessagingEnabled()
        && [v13 preferredMessagingOptionsForCommands] != (id)1)
      {
        if (!v61)
        {
          id v53 = [(ADCommandCenter *)self _contextManager];
          __int16 v54 = [(ADCommandCenter *)self _currentRequest];
          __int16 v55 = [v54 currentRequestId];
          [v53 pushContextSnapshotForCurrentRequestWithID:v55 toDevice:v13];
        }
        [(ADCommandCenter *)self _addExecutionDevice:v13 forCommandExecutionContext:v64];
        double v56 = *(void **)(*((void *)&buf + 1) + 40);
        *(void *)(*((void *)&buf + 1) + 40) = @"rapport";

        double v57 = +[AFAnalytics sharedAnalytics];
        uint64_t v58 = *(void *)(*((void *)&buf + 1) + 40);
        v82[0] = @"transport type";
        v82[1] = @"id";
        v83[0] = v58;
        v83[1] = v26;
        id v59 = +[NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:2];
        [v57 logEventWithType:4801 context:v59];

        [(ADCommandCenter *)self _logExecuteOnRemoteRequestForRequestId:v24 turnId:v25 event:0];
        id v41 = +[ADCompanionService sharedInstance];
        [v41 startRemoteSerialzedCommandExecution:v63 onPeer:v13 allowsRelay:v61 allowFallbackOnAWDL:v60 executionContext:v64 completion:v27];
      }
      else
      {
        id v49 = *(void **)(*((void *)&buf + 1) + 40);
        *(void *)(*((void *)&buf + 1) + 40) = @"ids";

        long long v50 = +[AFAnalytics sharedAnalytics];
        uint64_t v51 = *(void *)(*((void *)&buf + 1) + 40);
        v80[0] = @"transport type";
        v80[1] = @"id";
        v81[0] = v51;
        v81[1] = v26;
        long long v52 = +[NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:2];
        [v50 logEventWithType:4801 context:v52];

        id v41 = +[ADPeerCloudService sharedInstance];
        [v41 startRemoteSerialzedCommandExecution:v63 onPeer:v13 allowsRelay:v61 allowFallbackOnAWDL:0 executionContext:v64 completion:v27];
      }
      goto LABEL_10;
    }
    id v46 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v86 = 136315138;
      id v87 = "-[ADCommandCenter(RemoteExecute) _remoteExecute_remoteDeviceExecuteSerializedCommand:onPeer:allowsRelay:allo"
            "wFallbackOnAWDL:executionContext:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "%s Sending command to peer through #on-demand Rapport connection.", v86, 0xCu);
    }
    double v47 = +[AFAnalytics sharedAnalytics];
    v84[0] = @"transport type";
    v84[1] = @"id";
    v85[0] = @"rapport";
    v85[1] = v26;
    unint64_t v48 = +[NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:2];
    [v47 logEventWithType:4801 context:v48];

    __int16 v40 = +[ADDeviceCircleManager sharedInstance];
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_1002EC978;
    v65[3] = &unk_10050D058;
    id v66 = v27;
    [v40 executeCommand:v63 onPeer:v13 executionContext:v64 throughOnDemandRapportConnection:v65];
    id v39 = (void **)&v66;
  }

  id v41 = *v39;
LABEL_10:

LABEL_12:
  _Block_object_dispose(&buf, 8);
}

- (void)_remoteExecute_remoteDeviceExecuteSerializedCommand:(id)a3 onDeviceForAssistantId:(id)a4 allowFallbackOnAWDL:(BOOL)a5 executionContext:(id)a6 completion:(id)a7
{
  BOOL v46 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  int v15 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v69 = "-[ADCommandCenter(RemoteExecute) _remoteExecute_remoteDeviceExecuteSerializedCommand:onDeviceForAssistantId:al"
          "lowFallbackOnAWDL:executionContext:completion:]";
    __int16 v70 = 2112;
    id v71 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Executing command on device for assistant id: %@", buf, 0x16u);
  }
  uint64_t v16 = +[ADPeerCloudService sharedInstance];
  id v17 = v16;
  double v47 = v16;
  if (v12)
  {
    id v45 = v11;
    char v67 = 0;
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_1002ED0BC;
    v65[3] = &unk_10050DB08;
    id v18 = v12;
    id v66 = v18;
    id v19 = +[AFPeerInfo newWithBuilder:v65];
    id v20 = sub_10016A938(v19, &v67);
    if (v67)
    {
      uint64_t v21 = [[ADPeerInfo alloc] initWithAFPeerInfo:v20];
    }
    else
    {
      uint64_t v21 = [v17 peerInfoForAssistantId:v18 allowNonPeers:1];
    }
    id v22 = v21;
    if (v21)
    {
      BOOL v23 = 0;
    }
    else
    {
      id v24 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        id v69 = "-[ADCommandCenter(RemoteExecute) _remoteExecute_remoteDeviceExecuteSerializedCommand:onDeviceForAssistantI"
              "d:allowFallbackOnAWDL:executionContext:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s Unable to retrieve peer info from device circle manager or peer cloud service", buf, 0xCu);
      }
      id v25 = +[ADDeviceCircleManager sharedInstance];
      id v26 = [v25 idsDeviceUniqueIdentifierForDeviceWithAssistantId:v18];

      id v27 = [v26 length];
      BOOL v23 = v27 == 0;
      __int16 v28 = AFSiriLogContextDaemon;
      if (v27)
      {
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315138;
          id v69 = "-[ADCommandCenter(RemoteExecute) _remoteExecute_remoteDeviceExecuteSerializedCommand:onDeviceForAssistan"
                "tId:allowFallbackOnAWDL:executionContext:completion:]";
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%s Creating faux peer element", buf, 0xCu);
        }
        __int16 v29 = [[ADPeerInfo alloc] initWithUniqueIdentifer:v26];
      }
      else
      {
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 136315138;
          id v69 = "-[ADCommandCenter(RemoteExecute) _remoteExecute_remoteDeviceExecuteSerializedCommand:onDeviceForAssistan"
                "tId:allowFallbackOnAWDL:executionContext:completion:]";
          _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%s Falling back to basic peer info with only assistantId set", buf, 0xCu);
        }
        if (AFIsInternalInstall())
        {
          log = AFSiriLogContextPerformance;
          os_signpost_id_t v30 = os_signpost_id_generate(AFSiriLogContextPerformance);
          if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v31 = v30;
            if (os_signpost_enabled(log))
            {
              *(_WORD *)long long buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, log, OS_SIGNPOST_EVENT, v31, "PeerWithOnlyAssistantId", (const char *)&unk_100458042, buf, 2u);
            }
          }
        }
        __int16 v29 = [[ADPeerInfo alloc] initWithAFPeerInfo:v19];
      }
      id v22 = v29;
    }
    id v32 = [v18 uppercaseString];
    [v22 setAssistantIdentifier:v32];

    id v11 = v45;
    if (!v22) {
      goto LABEL_28;
    }
  }
  else
  {
    id v22 = [v16 companionPeer];
    BOOL v23 = 0;
    if (!v22) {
      goto LABEL_28;
    }
  }
  if (![(ADCommandCenter *)self _isFauxPeer:v22])
  {
LABEL_31:
    [(ADCommandCenter *)self _remoteExecute_remoteDeviceExecuteSerializedCommand:v11 onPeer:v22 allowsRelay:v23 allowFallbackOnAWDL:v46 executionContext:v13 completion:v14];
    goto LABEL_32;
  }
LABEL_28:
  id v33 = [(ADCommandCenter *)self _sharedDataService];
  if ([v33 watchIsNearbyForAssistantId:v12])
  {

    goto LABEL_31;
  }
  id v34 = +[ADAccount activeAccount];
  unsigned int v35 = [v34 watchExistsForAssistantId:v12];

  if (v35) {
    goto LABEL_31;
  }
  if ((!v22 || [(ADCommandCenter *)self _isFauxPeer:v22])
    && (unsigned int v37 = [(ADCommandCenter *)self _localDeviceIsHomePod], v12)
    && v37)
  {
    id v38 = +[ADMultiUserService sharedService];
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_1002ED0C8;
    v57[3] = &unk_10050B380;
    id v58 = v12;
    id v59 = self;
    id v60 = v11;
    BOOL v63 = v23;
    BOOL v64 = v46;
    id v61 = v13;
    id v62 = v14;
    [v38 getIDSIdentifierForAssistantId:v58 completion:v57];

    id v39 = v58;
  }
  else
  {
    char v40 = !v23;
    if (!v12) {
      char v40 = 1;
    }
    if (v40)
    {
      id v42 = AFSiriLogContextDaemon;
      id v36 = v47;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315138;
        id v69 = "-[ADCommandCenter(RemoteExecute) _remoteExecute_remoteDeviceExecuteSerializedCommand:onDeviceForAssistantI"
              "d:allowFallbackOnAWDL:executionContext:completion:]";
        _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%s Unable to find remote device for execution", buf, 0xCu);
        if (!v14) {
          goto LABEL_33;
        }
      }
      else if (!v14)
      {
        goto LABEL_33;
      }
      id v43 = +[AFError errorWithCode:1000];
      (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v43);

      goto LABEL_33;
    }
    id v41 = +[ADDeviceCircleManager sharedInstance];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    void v48[2] = sub_1002ED27C;
    v48[3] = &unk_10050B3A8;
    id v49 = v12;
    long long v50 = self;
    id v51 = v11;
    id v52 = v22;
    char v55 = 1;
    BOOL v56 = v46;
    id v53 = v13;
    id v54 = v14;
    [v41 getContextCollectorDeviceIdentifiersWithCompletion:v48];

    id v39 = v49;
  }

LABEL_32:
  id v36 = v47;
LABEL_33:
}

- (void)_remoteExecute_remoteDeviceExecuteSerializedCommand:(id)a3 onSpecifiedDeviceTypes:(unint64_t)a4 preferredMessagingOption:(unint64_t)a5 allowFallbackOnAWDL:(BOOL)a6 executionContext:(id)a7 completion:(id)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  id v17 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v33 = "-[ADCommandCenter(RemoteExecute) _remoteExecute_remoteDeviceExecuteSerializedCommand:onSpecifiedDeviceTypes:pr"
          "eferredMessagingOption:allowFallbackOnAWDL:executionContext:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v18 = [(ADCommandCenter *)self _selectedSharedUserID];
  if ([v18 length])
  {
    id v19 = +[AFAnalytics sharedAnalytics];
    [v19 logEventWithType:6116 context:0];
  }
  if ([(ADCommandCenter *)self _remoteExecute_shouldSendCommandToPrimaryUser:v18])
  {
    id v20 = [(ADCommandCenter *)self _remoteExecute_primaryUserDevicesWithTypes:a4];
    if ([v20 count])
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1002ED7A0;
      v26[3] = &unk_10050B358;
      unint64_t v30 = a5;
      void v26[4] = self;
      id v27 = v14;
      BOOL v31 = v10;
      id v28 = v15;
      id v29 = v16;
      [v20 enumerateObjectsUsingBlock:v26];
    }
    else
    {
      id v25 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 136315138;
        id v33 = "-[ADCommandCenter(RemoteExecute) _remoteExecute_remoteDeviceExecuteSerializedCommand:onSpecifiedDeviceType"
              "s:preferredMessagingOption:allowFallbackOnAWDL:executionContext:completion:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%s No eligible devices from primary user found for specified device types. Skipping.", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v21 = +[ADMultiUserService sharedService];
    id v22 = [v21 sharedUsersBySharedUserID];
    id v20 = [v22 objectForKey:v18];

    BOOL v23 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315394;
      id v33 = "-[ADCommandCenter(RemoteExecute) _remoteExecute_remoteDeviceExecuteSerializedCommand:onSpecifiedDeviceTypes:"
            "preferredMessagingOption:allowFallbackOnAWDL:executionContext:completion:]";
      __int16 v34 = 2112;
      unsigned int v35 = v18;
      _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%s Executing command on shared user companion device with sharedUserID: %@", buf, 0x16u);
    }
    id v24 = [v20 companionAssistantID];
    [(ADCommandCenter *)self _remoteExecute_remoteDeviceExecuteSerializedCommand:v14 onDeviceForAssistantId:v24 allowFallbackOnAWDL:v10 executionContext:v15 completion:v16];
  }
}

- (void)_remoteExecute_remoteDeviceExecuteCommand:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 throughProxyDevice:(id)a6 executionContext:(id)a7 completion:(id)a8
{
  BOOL v45 = a5;
  id v13 = a3;
  id v14 = a4;
  id v46 = a6;
  id v47 = a7;
  id v15 = a8;
  unsigned __int8 v16 = [v14 preferredMessagingOptionsForCommands];
  id v17 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v18 = v17;
    id v19 = AFDeviceMessagingOptionsGetNames();
    *(_DWORD *)long long buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[ADCommandCenter(RemoteExecute) _remoteExecute_remoteDeviceExecuteCommand:onPeer:allowsRelay:t"
                         "hroughProxyDevice:executionContext:completion:]";
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v19;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v59) = v45;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s preferred routing options: %@, allows relay: %d", buf, 0x1Cu);
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  id v59 = sub_1002EADF4;
  id v60 = sub_1002EAE04;
  id v61 = 0;
  id v20 = [v13 aceId];
  uint64_t v21 = v20;
  if (v20)
  {
    id v22 = v20;
  }
  else
  {
    BOOL v23 = +[NSUUID UUID];
    id v22 = [v23 UUIDString];
  }
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  void v48[2] = sub_1002EDDCC;
  v48[3] = &unk_10050B330;
  id v24 = v15;
  id v50 = v24;
  id v51 = buf;
  id v25 = v22;
  id v49 = v25;
  id v26 = objc_retainBlock(v48);
  if ((v16 & 1) != 0 || !_AFPreferencesCompanionMessagingEnabled())
  {
    id v38 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = @"ids";

    id v39 = +[AFAnalytics sharedAnalytics];
    char v40 = AFAnalyticsContextCreateWithCommand();
    v53[1] = v25;
    v54[0] = v40;
    uint64_t v41 = *(void *)(*(void *)&buf[8] + 40);
    v52[0] = @"transport type";
    v52[1] = @"id";
    v53[0] = v41;
    id v42 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];
    v54[1] = v42;
    id v43 = +[NSArray arrayWithObjects:v54 count:2];
    uint64_t v44 = AFAnalyticsContextsMerge();
    [v39 logEventWithType:4801 context:v44];

    unsigned int v37 = +[ADPeerCloudService sharedInstance];
    [v37 startRemoteExecution:v13 onPeer:v14 allowsRelay:0 throughProxyDevice:0 executionContext:v47 completion:v26];
  }
  else
  {
    id v27 = [(ADCommandCenter *)self _contextManager];
    id v28 = [(ADCommandCenter *)self _currentRequest];
    id v29 = [v28 currentRequestId];
    [v27 pushContextSnapshotForCurrentRequestWithID:v29 toDevice:v14];

    [(ADCommandCenter *)self _addExecutionDevice:v14 forCommandExecutionContext:v47];
    unint64_t v30 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = @"rapport";

    BOOL v31 = +[AFAnalytics sharedAnalytics];
    id v32 = AFAnalyticsContextCreateWithCommand();
    v56[1] = v25;
    v57[0] = v32;
    uint64_t v33 = *(void *)(*(void *)&buf[8] + 40);
    v55[0] = @"transport type";
    v55[1] = @"id";
    v56[0] = v33;
    __int16 v34 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
    v57[1] = v34;
    unsigned int v35 = +[NSArray arrayWithObjects:v57 count:2];
    id v36 = AFAnalyticsContextsMerge();
    [v31 logEventWithType:4801 context:v36];

    unsigned int v37 = +[ADCompanionService sharedInstance];
    [v37 startRemoteExecution:v13 onPeer:v14 allowsRelay:v45 throughProxyDevice:v46 executionContext:v47 completion:v26];
  }

  _Block_object_dispose(buf, 8);
}

- (void)_remoteExecute_remoteDeviceExecuteCommand:(id)a3 onDeviceForAssistantId:(id)a4 executionContext:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315650;
    id v19 = "-[ADCommandCenter(RemoteExecute) _remoteExecute_remoteDeviceExecuteCommand:onDeviceForAssistantId:executionCon"
          "text:completion:]";
    __int16 v20 = 2112;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Executing command %@ on device for assistant id %@", (uint8_t *)&v18, 0x20u);
  }
  id v15 = +[ADPeerCloudService sharedInstance];
  unsigned __int8 v16 = v15;
  if (v11) {
    [v15 peerInfoForAssistantId:v11 allowNonPeers:1];
  }
  else {
  id v17 = [v15 companionPeer];
  }
  [(ADCommandCenter *)self _remoteExecute_remoteDeviceExecuteCommand:v10 onPeer:v17 allowsRelay:0 throughProxyDevice:0 executionContext:v12 completion:v13];
}

- (void)_remoteExecute_remoteDeviceExecuteCommand:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    id v13 = "-[ADCommandCenter(RemoteExecute) _remoteExecute_remoteDeviceExecuteCommand:executionContext:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v12, 0xCu);
  }
  [(ADCommandCenter *)self _remoteExecute_remoteDeviceExecuteCommand:v8 onDeviceForAssistantId:0 executionContext:v9 completion:v10];
}

- (void)_attachPersonaIdIfNeeded:(id)a3 aceCommand:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  id v6 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [v5 setPersonaId:v8];
  }
}

- (void)executeCommand:(id)a3 fromPeer:(id)a4 remoteExecutionInfo:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[AFPreferences sharedPreferences];
  unsigned __int8 v15 = [v14 assistantIsEnabled];

  if (v15)
  {
    unsigned __int8 v16 = +[SABaseCommand aceObjectWithDictionary:v10];
    [v16 setRefId:0];
    id v17 = [objc_alloc((Class)AFCommandExecutionInfo) initWithDictionaryRepresentation:v12];
    int v18 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315906;
      unint64_t v30 = "-[ADCommandCenter(RemoteExecute) executeCommand:fromPeer:remoteExecutionInfo:reply:]";
      __int16 v31 = 2112;
      id v32 = v11;
      __int16 v33 = 2112;
      __int16 v34 = v16;
      __int16 v35 = 2112;
      id v36 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s peer = %@, command = %@, remoteExecutionInfo = %@", buf, 0x2Au);
    }
    id v19 = +[ADCommandCenter sharedCommandCenter];
    [v19 sendPowerLogs:@"ExecuteOnRemoteRequest" peerInfo:v11];

    __int16 v20 = [(ADCommandCenter *)self _queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002EE6B0;
    block[3] = &unk_10050D3F0;
    void block[4] = self;
    id v25 = v16;
    id v26 = v11;
    id v27 = v17;
    id v28 = v13;
    id v21 = v17;
    id v22 = v16;
    dispatch_async(v20, block);
  }
  else
  {
    id v23 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      unint64_t v30 = "-[ADCommandCenter(RemoteExecute) executeCommand:fromPeer:remoteExecutionInfo:reply:]";
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s Rejecting remote command because Siri is disabled", buf, 0xCu);
    }
    id v22 = +[AFError errorWithCode:18];
    (*((void (**)(id, void, id))v13 + 2))(v13, 0, v22);
  }
}

- (void)_sendLocationIfNeededForRequest
{
  id v3 = [(ADCommandCenter *)self _locationManager];
  if (([v3 needsToSendLocation] & 1) != 0
    || [v3 isNavigating])
  {
    [v3 setNeedsToSendLocation:0];
    id v4 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v7 = "-[ADCommandCenter(LocationInternal) _sendLocationIfNeededForRequest]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Location manager says we need to send location for this request", buf, 0xCu);
    }
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1003563F4;
    v5[3] = &unk_10050D618;
    void v5[4] = self;
    [v3 updateLocationForCommand:0 completion:v5];
  }
}

- (id)_locationManager
{
  id v2 = +[ADLocationService sharedService];
  id v3 = [v2 locationManager];

  return v3;
}

- (void)fetchLastLocationWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(ADCommandCenter *)self _queue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100356654;
    v6[3] = &unk_10050E188;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)dismissedAllVisibleAssistantUIForReason:(id)a3
{
  id v4 = a3;
  id v5 = [(ADCommandCenter *)self _queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_100356778;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)showingVisibleAssistantUIForReason:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ADCommandCenter *)self _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003568B8;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)fetchLocationAuthorization:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(ADCommandCenter *)self _queue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1003569CC;
    v6[3] = &unk_10050E188;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

@end