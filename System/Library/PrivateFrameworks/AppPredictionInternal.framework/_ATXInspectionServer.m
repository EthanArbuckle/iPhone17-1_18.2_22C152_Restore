@interface _ATXInspectionServer
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_ATXInspectionServer)init;
- (void)addToDigestFeedbackHistogramForBundleId:(id)a3 location:(id)a4 feedback:(id)a5 withReply:(id)a6;
- (void)allHistogramsBySize:(id)a3;
- (void)appAndActionHistoryClear:(id)a3;
- (void)appHistoryActionWithUUID:(id)a3 reply:(id)a4;
- (void)appHistoryAddAppIntentLaunch:(id)a3 intent:(id)a4 source:(id)a5 date:(id)a6 timeZone:(id)a7 reply:(id)a8;
- (void)appHistoryAddLaunch:(id)a3 launchReason:(id)a4 date:(id)a5 timeZone:(id)a6 reply:(id)a7;
- (void)appHistoryAddNSUALaunch:(id)a3 requiredString:(id)a4 itemIdentifier:(id)a5 date:(id)a6 timeZone:(id)a7 reply:(id)a8;
- (void)appHistoryClearAppIntent:(id)a3;
- (void)appHistoryStartDeltaRecording:(id)a3;
- (void)appHistoryStopDeltaRecording:(id)a3;
- (void)appHistoryUpdateActionPredictionPipelineWithAction:(id)a3 date:(id)a4 timeZone:(id)a5 reply:(id)a6;
- (void)appInstallHistoryClear:(id)a3;
- (void)appInstallHistorySet:(id)a3 date:(id)a4 reply:(id)a5;
- (void)appInstallHistoryStartDeltaRecording:(id)a3;
- (void)appInstallHistoryStopDeltaRecording:(id)a3;
- (void)appIntentHistoryDonateINIntent:(id)a3 intentType:(id)a4 startDate:(id)a5 endDate:(id)a6 timeZone:(id)a7 reply:(id)a8;
- (void)appIntentHistoryMockIntentLaunch:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 timeZone:(id)a7 reply:(id)a8;
- (void)appLaunchDatesWithReply:(id)a3;
- (void)appLaunchInformationWithReply:(id)a3;
- (void)benchmarkAppPrediction:(unint64_t)a3 reply:(id)a4;
- (void)benchmarkAppPredictionForConsumerSubType:(unsigned __int8)a3 ntimes:(unint64_t)a4 reply:(id)a5;
- (void)blendedSuggestionsForConsumerSubType:(unsigned __int8)a3 reply:(id)a4;
- (void)buildAnchorModelTrainingDataset:(id)a3;
- (void)categoriesWithShouldUseDefault:(BOOL)a3 reply:(id)a4;
- (void)categoryLaunchInformationWithReply:(id)a3;
- (void)clearAllDataForStressTestWithReply:(id)a3;
- (void)clearBlendingSuggestionsForClientModel:(int64_t)a3 withReply:(id)a4;
- (void)clearDigestFeedbackHistogramWithShouldResetBookmarks:(BOOL)a3 reply:(id)a4;
- (void)clearNotificationsWithReply:(id)a3;
- (void)createAppPredictionLogs:(id)a3;
- (void)donateSuggestion:(id)a3 forClientModel:(int64_t)a4 withReply:(id)a5;
- (void)dumpNotificationJSONFromSource:(id)a3 startDate:(id)a4 endDate:(id)a5 inferMessages:(BOOL)a6 reply:(id)a7;
- (void)dumpPredictionTableForMMExpert:(id)a3 reply:(id)a4;
- (void)evaluateInfoSuggestionsWithCompletionHandler:(id)a3;
- (void)feedbackClear:(id)a3;
- (void)feedbackLaunched:(id)a3 rejected:(id)a4 reply:(id)a5;
- (void)feedbackLaunchedWithConsumerSubType:(unsigned __int8)a3 forBundleId:(id)a4 rejected:(id)a5 reply:(id)a6;
- (void)fetchPosterDescriptorsWithReply:(id)a3;
- (void)fetchSuggestionsForSourceId:(id)a3 reply:(id)a4;
- (void)forceMagicalMomentsAppPredictionForBundleId:(id)a3 expert:(id)a4 reply:(id)a5;
- (void)forceNotificationAndSuggestionDbUpdate:(id)a3;
- (void)generateDataForStressTestWithReply:(id)a3;
- (void)generateSerializedAppGroupedNotificationDigestFromSource:(id)a3 digestTimeString:(id)a4 startDate:(id)a5 endDate:(id)a6 inferMessages:(BOOL)a7 reply:(id)a8;
- (void)generateSerializedMissedNotificationBundleFromFileData:(id)a3 modeString:(id)a4 reply:(id)a5;
- (void)generateSerializedMissedNotificationBundleFromSource:(id)a3 modeString:(id)a4 startDate:(id)a5 endDate:(id)a6 inferMessages:(BOOL)a7 reply:(id)a8;
- (void)generateSerializedNotificationDigestFromFileData:(id)a3 digestTimeString:(id)a4 reply:(id)a5;
- (void)generateSerializedNotificationDigestFromSource:(id)a3 digestTimeString:(id)a4 startDate:(id)a5 endDate:(id)a6 inferMessages:(BOOL)a7 reply:(id)a8;
- (void)getActionLogs:(id)a3;
- (void)getAppFeedbackData:(id)a3;
- (void)getCurrentLocationWithReply:(id)a3;
- (void)getInfoPredictionsInString:(id)a3;
- (void)getInfoSuggestionsInString:(id)a3;
- (void)getModeTimelineDataFromStartDate:(id)a3 reply:(id)a4;
- (void)getParseTreeForConsumerSubType:(unsigned __int8)a3 reply:(id)a4;
- (void)getPredictionModelDetailsForConsumerSubType:(unsigned __int8)a3 reply:(id)a4;
- (void)histogramsInMemory:(id)a3;
- (void)histogramsInMemoryBySize:(id)a3;
- (void)inspectInferredActivitySessionStream:(id)a3 fromTimestamp:(double)a4 reply:(id)a5;
- (void)inspectInferredActivityTransitionStream:(id)a3 fromTimestamp:(double)a4 reply:(id)a5;
- (void)lockScreenBundleIdsWithReply:(id)a3;
- (void)logNotificationMetricsFromStartTimestamp:(id)a3 toEndTimestamp:(id)a4 withCompletion:(id)a5;
- (void)nPlusOneStudyDryRunResultFilterByExtensionBundleId:(id)a3 reply:(id)a4;
- (void)performHomeScreenCoreAnalyticsDryRunWithCustomStartDate:(id)a3 reply:(id)a4;
- (void)predictAppsAndReturnInputsAndSubscores:(id)a3;
- (void)predictItemsAndReturnInputsAndSubscoresForConsumerSubType:(unsigned __int8)a3 intent:(id)a4 candidateBundleIds:(id)a5 candidateActiontypes:(id)a6 reply:(id)a7;
- (void)predictItemsAndReturnMetaDataAndInputsAndSubScoresWithCandidateBundleIdentifiers:(id)a3 candidateActiontypes:(id)a4 consumerSubType:(unsigned __int8)a5 reply:(id)a6;
- (void)predictItemsAndReturnStageScoresWithCandidateBundleIdentifiers:(id)a3 candidateActiontypes:(id)a4 consumerSubType:(unsigned __int8)a5 reply:(id)a6;
- (void)processAppDirectoryFeedbackWithReply:(id)a3;
- (void)processHomeScreenFeedbackWithReply:(id)a3;
- (void)processLockscreenFeedbackWithReply:(id)a3;
- (void)processSpotlightActionFeedbackWithReply:(id)a3;
- (void)processSpotlightAppFeedbackWithReply:(id)a3;
- (void)promoteSuggestionsFromClientModel:(id)a3 reply:(id)a4;
- (void)rankAndReturnInfoPredictionsInString:(id)a3;
- (void)refreshBlendingLayer:(id)a3;
- (void)resetActionPredictions:(id)a3;
- (void)retrainActionHistograms:(id)a3;
- (void)retrainActionSlotDatabase:(id)a3;
- (void)schedulePredictionsForAnchorModel:(id)a3 anchorType:(id)a4 reply:(id)a5;
- (void)scheduledPredictionsForAnchorModelWithReply:(id)a3;
- (void)setDigestFeedbackHistogramValueForBundleId:(id)a3 location:(id)a4 feedback:(id)a5 value:(id)a6 withReply:(id)a7;
- (void)showDigestFeedbackHistogramForBundleId:(id)a3 withReply:(id)a4;
- (void)trainAnchorModel:(id)a3;
- (void)trainMagicalMomentsAppPredictor:(id)a3;
- (void)trainModeEntityModelsWithDeferTrainingWhenApplicable:(BOOL)a3 reply:(id)a4;
- (void)trainModeSetupPredictionModelWithReply:(id)a3;
- (void)updateAppDirectoryCache:(id)a3;
- (void)validPredictionsRightNowForAnchorModelWithReply:(id)a3;
- (void)widgetBundleIdentifiersForAllInfoSuggestionsInString:(id)a3;
@end

@implementation _ATXInspectionServer

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_33 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_33, &__block_literal_global_183);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_43;
  return v2;
}

- (_ATXInspectionServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)_ATXInspectionServer;
  v2 = [(_ATXInspectionServer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.duet.appPrediction.inspection"];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  objc_super v6 = [v5 valueForEntitlement:@"com.apple.duet.appPrediction.inspection"];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0 && ([v6 BOOLValue] & 1) != 0)
  {
    v7 = _ATXInspectionInterface();
    [v5 setExportedInterface:v7];

    [v5 setExportedObject:self];
    [v5 setInterruptionHandler:&__block_literal_global_18_1];
    [v5 setInvalidationHandler:&__block_literal_global_21];
    [v5 resume];
    BOOL v8 = 1;
  }
  else
  {
    v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_ATXInspectionServer listener:shouldAcceptNewConnection:]();
    }

    BOOL v8 = 0;
  }

  return v8;
}

- (void)appAndActionHistoryClear:(id)a3
{
  id v5 = (void (**)(id, void))a3;
  uint64_t v3 = +[_ATXAppPredictor sharedInstance];
  v4 = [v3 appLaunchMonitor];
  [v4 clearHistory];

  v5[2](v5, 0);
}

- (void)appHistoryClearAppIntent:(id)a3
{
  id v5 = (void (**)(id, void))a3;
  uint64_t v3 = +[_ATXAppPredictor sharedInstance];
  v4 = [v3 appLaunchMonitor];
  [v4 clearIntentHistogramHistory];

  v5[2](v5, 0);
}

- (void)appHistoryAddLaunch:(id)a3 launchReason:(id)a4 date:(id)a5 timeZone:(id)a6 reply:(id)a7
{
  v17 = (void (**)(id, void))a7;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = +[_ATXAppPredictor sharedInstance];
  v16 = [v15 appLaunchMonitor];
  [v16 addLaunchWithBundleId:v14 date:v12 timeZone:v11 reason:v13];

  v17[2](v17, 0);
}

- (void)appHistoryUpdateActionPredictionPipelineWithAction:(id)a3 date:(id)a4 timeZone:(id)a5 reply:(id)a6
{
  v112[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v98 = a4;
  id v97 = a5;
  v96 = (void (**)(id, void *, void *))a6;
  v10 = (void *)MEMORY[0x1E4F5B518];
  v99 = v9;
  id v11 = [MEMORY[0x1E4F5B5D0] predicateForObjectWithUUID:v9];
  id v12 = [MEMORY[0x1E4F5B5F8] appIntentsStream];
  v112[0] = v12;
  id v13 = [MEMORY[0x1E4F5B5F8] appActivityStream];
  v112[1] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:2];
  v15 = [v10 eventQueryWithPredicate:v11 eventStreams:v14 offset:0 limit:1 sortDescriptors:0];

  v16 = __atxlog_handle_default();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [v15 eventStreams];
    v18 = [v17 firstObject];
    v19 = [v18 name];
    *(_DWORD *)buf = 138543874;
    v107 = v19;
    __int16 v108 = 2080;
    v109 = "-[_ATXInspectionServer appHistoryUpdateActionPredictionPipelineWithAction:date:timeZone:reply:]";
    __int16 v110 = 2112;
    v111 = v15;
    _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "Duet query: %{public}@, %s, %@", buf, 0x20u);
  }
  v20 = [MEMORY[0x1E4F5B560] knowledgeStoreWithDirectReadOnlyAccess];
  id v101 = 0;
  v21 = [v20 executeQuery:v15 error:&v101];
  id v22 = v101;

  if (v21 && [v21 count])
  {
    id v95 = v22;
    v23 = [v21 firstObject];
    v24 = [v23 stream];
    v25 = [MEMORY[0x1E4F5B5F8] appIntentsStream];
    int v26 = [v24 isEqual:v25];

    v94 = v15;
    if (v26)
    {
      v27 = [v23 metadata];
      v28 = [MEMORY[0x1E4F5B550] serializedInteraction];
      v29 = [v27 objectForKeyedSubscript:v28];

      v30 = (void *)MEMORY[0x1D25F6CC0]();
      id v100 = 0;
      v31 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v29 error:&v100];
      id v90 = v100;
      v32 = [v31 intent];
      v33 = objc_msgSend(v32, "_intents_bundleIdForDisplay");
      v34 = v33;
      if (v33)
      {
        id v35 = v33;
      }
      else
      {
        [v23 source];
        v42 = v41 = v21;
        id v35 = [v42 bundleID];

        v21 = v41;
      }

      v43 = [v31 intent];
      uint64_t v44 = [v43 _className];

      id v45 = objc_alloc(MEMORY[0x1E4F4AE38]);
      v46 = [v31 intent];
      v47 = objc_opt_new();
      LOBYTE(v85) = 0;
      v93 = (void *)[v45 initWithIntent:v46 actionUUID:v47 bundleId:v35 heuristic:0 heuristicMetadata:0 criteria:0 isFutureMedia:v85 title:0 subtitle:0];

      v40 = (void *)v44;
    }
    else
    {
      v93 = 0;
      v40 = 0;
      id v35 = 0;
    }
    v48 = [v23 stream];
    v49 = [MEMORY[0x1E4F5B5F8] appActivityStream];
    int v50 = [v48 isEqual:v49];

    if (v50)
    {
      v51 = [v23 metadata];
      v52 = [MEMORY[0x1E4F5B4A8] itemRelatedContentURL];
      uint64_t v53 = [v51 objectForKeyedSubscript:v52];

      v54 = [v23 metadata];
      v55 = [MEMORY[0x1E4F5B4A8] itemRelatedUniqueIdentifier];
      uint64_t v56 = [v54 objectForKeyedSubscript:v55];

      v57 = [v23 metadata];
      v58 = [MEMORY[0x1E4F5B4A8] contentDescription];
      uint64_t v59 = [v57 objectForKeyedSubscript:v58];

      v91 = (void *)v56;
      v92 = v21;
      v88 = v40;
      v89 = (void *)v53;
      v87 = (void *)v59;
      if (v53 || v56 || v59)
      {
        id v62 = objc_alloc(MEMORY[0x1E4F23850]);
        v60 = (void *)[v62 initWithContentType:*MEMORY[0x1E4F44370]];
        [v60 setRelatedUniqueIdentifier:v56];
        [v60 setContentURL:v53];
        [v60 setContentDescription:v59];
      }
      else
      {
        v60 = 0;
      }
      v63 = [v23 value];
      uint64_t v64 = [v63 stringValue];

      v65 = [v23 metadata];
      v66 = [MEMORY[0x1E4F5B4A8] itemIdentifier];
      v67 = [v65 objectForKeyedSubscript:v66];

      v68 = [v23 metadata];
      v69 = [MEMORY[0x1E4F5B4A8] userActivityRequiredString];
      v70 = [v68 objectForKeyedSubscript:v69];

      v71 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) _initWithUserActivityStrings:v70 secondaryString:0 optionalData:0];
      v72 = (void *)MEMORY[0x1E4F4AE38];
      v73 = [v71 activityType];
      uint64_t v74 = [v72 getNSUATypefromActivityType:v73];

      id v75 = objc_alloc(MEMORY[0x1E4F4AE38]);
      v76 = objc_opt_new();
      LOBYTE(v86) = 0;
      v61 = (void *)[v75 initWithNSUserActivityString:v70 actionUUID:v76 bundleId:v64 itemIdentifier:v67 contentAttributeSet:v60 heuristic:0 heuristicMetadata:0 isFutureMedia:v86 title:0 subtitle:0];

      v40 = (void *)v74;
      id v35 = (id)v64;
      v21 = v92;
    }
    else
    {
      v61 = v93;
    }
    v39 = v98;
    if (v35
      && v40
      && v61
      && ([v61 actionTitle], v77 = objc_claimAutoreleasedReturnValue(), v77, v77))
    {
      v78 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v98 endDate:v98];
      v79 = v40;
      v80 = (void *)[objc_alloc(MEMORY[0x1E4F4B0F8]) initWithBundleId:v35 intentType:v40 dateInterval:v78 action:v61];
      v81 = +[_ATXAppPredictor sharedInstance];
      v82 = [v81 appIntentMonitor];
      LODWORD(v83) = 1.0;
      [v82 updateActionPredictionPipelineForIntentEvent:v80 weight:0 appSessionStartDate:0 appSessionEndDate:v83];

      v38 = [v61 description];

      v37 = 0;
    }
    else
    {
      v79 = v40;
      id v84 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v104 = *MEMORY[0x1E4F28568];
      v105 = @"The action does not have a bundleId, intentType, or title.";
      v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v105 forKeys:&v104 count:1];
      v37 = (void *)[v84 initWithDomain:@"appHistoryUpdateActionPredictionPipelineWithAction" code:-1 userInfo:v78];
      v38 = 0;
    }

    v15 = v94;
    id v22 = v95;
  }
  else
  {
    id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v102 = *MEMORY[0x1E4F28568];
    v23 = [NSString stringWithFormat:@"No events found for UUID: %@", v9];
    v103 = v23;
    id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v103 forKeys:&v102 count:1];
    v37 = (void *)[v36 initWithDomain:@"appHistoryUpdateActionPredictionPipelineWithAction" code:-1 userInfo:v35];
    v38 = 0;
    v39 = v98;
  }

  v96[2](v96, v38, v37);
}

- (void)appHistoryActionWithUUID:(id)a3 reply:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_super v6 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__86;
  v25 = __Block_byref_object_dispose__86;
  id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v28 = *MEMORY[0x1E4F28568];
  BOOL v8 = NSString;
  id v9 = [v5 UUIDString];
  v10 = [v8 stringWithFormat:@"There is no action found with UUID: %@", v9];
  v29[0] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
  id v26 = (id)[v7 initWithDomain:@"appHistoryActionWithUUID" code:-1 userInfo:v11];

  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__86;
  v19 = __Block_byref_object_dispose__86;
  id v20 = 0;
  id v12 = +[_ATXDataStore sharedInstance];
  id v27 = v5;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55___ATXInspectionServer_appHistoryActionWithUUID_reply___block_invoke;
  v14[3] = &unk_1E68B41F8;
  v14[4] = &v21;
  v14[5] = &v15;
  [v12 enumerateActionsInUUIDSet:v13 block:v14];

  v6[2](v6, v16[5], v22[5]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

- (void)appHistoryAddNSUALaunch:(id)a3 requiredString:(id)a4 itemIdentifier:(id)a5 date:(id)a6 timeZone:(id)a7 reply:(id)a8
{
  id v29 = a3;
  id v12 = a6;
  id v13 = (void (**)(id, void))a8;
  id v14 = (objc_class *)MEMORY[0x1E4F4AE38];
  id v15 = a5;
  id v16 = a4;
  id v17 = [v14 alloc];
  v18 = objc_opt_new();
  LOBYTE(v28) = 0;
  v19 = (void *)[v17 initWithNSUserActivityString:v16 actionUUID:v18 bundleId:v29 itemIdentifier:v15 contentAttributeSet:0 heuristic:0 heuristicMetadata:0 isFutureMedia:v28 title:0 subtitle:0];

  id v20 = [v19 userActivity];
  uint64_t v21 = [v20 activityType];

  if (v21)
  {
    id v22 = [MEMORY[0x1E4F4AE38] getNSUATypefromActivityType:v21];
    uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v12 endDate:v12];
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F4B0F8]) initWithBundleId:v29 intentType:v22 dateInterval:v23 action:v19];
    v25 = +[_ATXAppPredictor sharedInstance];
    id v26 = [v25 appIntentMonitor];
    LODWORD(v27) = 1.0;
    [v26 updateActionPredictionPipelineForIntentEvent:v24 weight:0 appSessionStartDate:0 appSessionEndDate:v27];
  }
  v13[2](v13, 0);
}

- (void)appHistoryAddAppIntentLaunch:(id)a3 intent:(id)a4 source:(id)a5 date:(id)a6 timeZone:(id)a7 reply:(id)a8
{
  id v21 = a4;
  id v12 = (void (**)(id, void))a8;
  id v13 = a6;
  id v14 = a3;
  id v15 = v21;
  if ([a5 isEqualToString:@"NSUA"])
  {
    id v15 = [MEMORY[0x1E4F4AE38] getNSUATypefromActivityType:v21];
  }
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v13 endDate:v13];

  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F4B0F8]) initWithBundleId:v14 intentType:v15 dateInterval:v16];
  v18 = +[_ATXAppPredictor sharedInstance];
  v19 = [v18 appIntentMonitor];
  LODWORD(v20) = 1.0;
  [v19 updateActionPredictionPipelineForIntentEvent:v17 weight:0 appSessionStartDate:0 appSessionEndDate:v20];

  v12[2](v12, 0);
}

- (void)appIntentHistoryMockIntentLaunch:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 timeZone:(id)a7 reply:(id)a8
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(id, void))a8;
  if (([v12 isEqualToString:@"NSUA"] & 1) != 0
    || [v12 isEqualToString:@"INIntent"])
  {
    id v16 = +[_ATXAppPredictor sharedInstance];
    id v17 = [v16 appIntentMonitor];
    [v17 updateActionPredictionPipelineForAppSession:v18 startDate:v13 endDate:v14];
  }
  v15[2](v15, 0);
}

- (void)appIntentHistoryDonateINIntent:(id)a3 intentType:(id)a4 startDate:(id)a5 endDate:(id)a6 timeZone:(id)a7 reply:(id)a8
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = (objc_class *)MEMORY[0x1E4F305B8];
  v42 = (void (**)(id, void))a8;
  id v40 = a6;
  id v39 = a5;
  id v41 = a3;
  id v14 = [v13 alloc];
  id v15 = [@"alice" stringByAppendingString:@"@example.com"];
  uint64_t v16 = *MEMORY[0x1E4F30170];
  uint64_t v17 = [v14 initWithValue:v15 type:1 label:*MEMORY[0x1E4F30170]];

  id v18 = objc_alloc(MEMORY[0x1E4F305B0]);
  v19 = [MEMORY[0x1E4F29128] UUID];
  double v20 = [v19 UUIDString];
  v43 = (void *)v17;
  uint64_t v21 = [v18 initWithPersonHandle:v17 nameComponents:0 displayName:@"Alice" image:0 contactIdentifier:v20 customIdentifier:0];

  id v22 = objc_alloc(MEMORY[0x1E4F305B8]);
  uint64_t v23 = [@"bob" stringByAppendingString:@"@example.com"];
  v24 = (void *)[v22 initWithValue:v23 type:1 label:v16];

  id v25 = objc_alloc(MEMORY[0x1E4F305B0]);
  id v26 = [MEMORY[0x1E4F29128] UUID];
  double v27 = [v26 UUIDString];
  uint64_t v28 = (void *)[v25 initWithPersonHandle:v24 nameComponents:0 displayName:@"Bob" image:0 contactIdentifier:v27 customIdentifier:0];

  if ([v12 isEqualToString:@"SendMessage"])
  {
    id v29 = objc_alloc(MEMORY[0x1E4F306D0]);
    v47[0] = v21;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
    v31 = (void *)[objc_alloc(MEMORY[0x1E4F30750]) initWithSpokenPhrase:@"Hello"];
    v32 = (void *)[v29 initWithRecipients:v30 outgoingMessageType:0 content:@"Hello" speakableGroupName:v31 conversationIdentifier:@"Conversation" serviceName:@"Service" sender:v28 attachments:0];
  }
  else
  {
    if (![v12 isEqualToString:@"AudioCall"])
    {
      v34 = (void *)v21;
      id v35 = 0;
      goto LABEL_7;
    }
    id v33 = objc_alloc(MEMORY[0x1E4F30760]);
    uint64_t v46 = v21;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
    v32 = (void *)[v33 initWithCallRecordFilter:0 callRecordToCallBack:0 audioRoute:0 destinationType:1 contacts:v30 callCapability:1];
  }
  v34 = (void *)v21;

  id v35 = (void *)[objc_alloc(MEMORY[0x1E4F30508]) initWithIntent:v32 response:0];
LABEL_7:
  id v36 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v39 endDate:v40];

  [v35 setDateInterval:v36];
  dispatch_semaphore_t v37 = dispatch_semaphore_create(0);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __99___ATXInspectionServer_appIntentHistoryDonateINIntent_intentType_startDate_endDate_timeZone_reply___block_invoke;
  v44[3] = &unk_1E68B36D8;
  dispatch_semaphore_t v45 = v37;
  v38 = v37;
  [v35 _donateInteractionWithBundleId:v41 completion:v44];

  [MEMORY[0x1E4F93B18] waitForSemaphore:v38 timeoutSeconds:5.0];
  v42[2](v42, 0);
}

- (void)appHistoryStartDeltaRecording:(id)a3
{
  id v5 = (void (**)(id, void))a3;
  uint64_t v3 = +[_ATXAppPredictor sharedInstance];
  v4 = [v3 appLaunchMonitor];
  [v4 startDeltaRecording];

  v5[2](v5, 0);
}

- (void)appHistoryStopDeltaRecording:(id)a3
{
  uint64_t v3 = (void (**)(id, id, void))a3;
  v4 = +[_ATXAppPredictor sharedInstance];
  id v5 = [v4 appLaunchMonitor];
  id v6 = [v5 stopDeltaRecording];

  v3[2](v3, v6, 0);
}

- (void)appInstallHistoryClear:(id)a3
{
  v4 = (void (**)(id, void))a3;
  uint64_t v3 = +[_ATXAppInfoManager sharedInstance];
  [v3 clearAppInstallInfo];

  v4[2](v4, 0);
}

- (void)appInstallHistorySet:(id)a3 date:(id)a4 reply:(id)a5
{
  v10 = (void (**)(id, void))a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[_ATXAppInfoManager sharedInstance];
  [v9 addInstallForBundleId:v8 date:v7];

  v10[2](v10, 0);
}

- (void)appInstallHistoryStartDeltaRecording:(id)a3
{
  v4 = (void (**)(id, void))a3;
  uint64_t v3 = +[_ATXAppInfoManager sharedInstance];
  [v3 startInstallDeltaRecording];

  v4[2](v4, 0);
}

- (void)appInstallHistoryStopDeltaRecording:(id)a3
{
  uint64_t v3 = (void (**)(id, id, void))a3;
  v4 = +[_ATXAppInfoManager sharedInstance];
  id v5 = [v4 stopInstallDeltaRecording];

  v3[2](v3, v5, 0);
}

- (void)feedbackClear:(id)a3
{
  id v5 = (void (**)(id, void))a3;
  uint64_t v3 = +[_ATXFeedback sharedInstance];
  [v3 resetData];

  v4 = +[ATXActionFeedback sharedInstance];
  [v4 resetData];

  v5[2](v5, 0);
}

- (void)feedbackLaunchedWithConsumerSubType:(unsigned __int8)a3 forBundleId:(id)a4 rejected:(id)a5 reply:(id)a6
{
  uint64_t v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, void))a6;
  id v12 = objc_alloc_init(ATXPredictionContextBuilder);
  id v13 = [(ATXPredictionContextBuilder *)v12 predictionContextForCurrentContext];
  if (v13)
  {
    uint64_t v14 = [MEMORY[0x1E4F4B680] consumerTypeForSubType:v8];
    id v15 = +[_ATXFeedback sharedInstance];
    [v15 feedbackLaunchedWithConsumerType:v14 forBundleId:v9 rejected:v10 explicitlyRejected:0 context:v13];
  }
  else
  {
    uint64_t v16 = __atxlog_handle_default();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[_ATXInspectionServer feedbackLaunchedWithConsumerSubType:forBundleId:rejected:reply:]();
    }
  }
  v11[2](v11, 0);
}

- (void)feedbackLaunched:(id)a3 rejected:(id)a4 reply:(id)a5
{
}

- (void)predictAppsAndReturnInputsAndSubscores:(id)a3
{
}

- (void)predictItemsAndReturnInputsAndSubscoresForConsumerSubType:(unsigned __int8)a3 intent:(id)a4 candidateBundleIds:(id)a5 candidateActiontypes:(id)a6 reply:(id)a7
{
  uint64_t v10 = a3;
  id v18 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void (**)(id, void *, void))a7;
  uint64_t v14 = objc_opt_new();
  id v15 = +[_ATXAppPredictor sharedInstance];
  id v16 = (id)[v15 predictWithLimit:8 consumerSubType:v10 intent:v18 candidateBundleIdentifiers:v11 candidateActiontypes:v12 scoreLogger:v14];

  uint64_t v17 = [v14 inputsAndSubscores];
  v13[2](v13, v17, 0);
}

- (void)predictItemsAndReturnMetaDataAndInputsAndSubScoresWithCandidateBundleIdentifiers:(id)a3 candidateActiontypes:(id)a4 consumerSubType:(unsigned __int8)a5 reply:(id)a6
{
  uint64_t v7 = a5;
  v28[3] = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v23 = a4;
  id v22 = (void (**)(id, void *, void *, void))a6;
  id v9 = objc_opt_new();
  uint64_t v10 = objc_opt_new();
  id v11 = objc_opt_new();
  uint64_t v21 = objc_opt_new();
  id v12 = +[ATXActionPredictions predictionsWithCandidateBundleIdentifiers:v24 candidateActiontypes:v23 consumerSubType:v7 firstStageScoreLogger:v9 secondStageScoreLogger:v10 thirdStageScoreLogger:v11 multiStageScoreLogger:v21];
  v27[0] = @"firstStage";
  id v13 = [v9 actionMetaDataItems];
  v28[0] = v13;
  v27[1] = @"secondStage";
  uint64_t v14 = [v10 actionMetaDataItems];
  v28[1] = v14;
  v27[2] = @"thirdStage";
  id v15 = [v11 actionMetaDataItems];
  v28[2] = v15;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];

  v25[0] = @"firstStage";
  uint64_t v17 = [v9 inputsAndSubscores];
  v26[0] = v17;
  v25[1] = @"secondStage";
  id v18 = [v10 inputsAndSubscores];
  v26[1] = v18;
  v25[2] = @"thirdStage";
  v19 = [v11 inputsAndSubscores];
  v26[2] = v19;
  double v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];

  v22[2](v22, v16, v20, 0);
}

- (void)predictItemsAndReturnStageScoresWithCandidateBundleIdentifiers:(id)a3 candidateActiontypes:(id)a4 consumerSubType:(unsigned __int8)a5 reply:(id)a6
{
  uint64_t v7 = a5;
  id v17 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *, void))a6;
  id v11 = objc_opt_new();
  id v12 = objc_opt_new();
  id v13 = objc_opt_new();
  uint64_t v14 = objc_opt_new();
  id v15 = +[ATXActionPredictions predictionsWithCandidateBundleIdentifiers:v17 candidateActiontypes:v9 consumerSubType:v7 firstStageScoreLogger:v12 secondStageScoreLogger:v13 thirdStageScoreLogger:v14 multiStageScoreLogger:v11];

  id v16 = [v11 stageScores];
  v10[2](v10, v16, 0);
}

- (void)getParseTreeForConsumerSubType:(unsigned __int8)a3 reply:(id)a4
{
  uint64_t v4 = a3;
  id v5 = (void (**)(id, id, void))a4;
  id v6 = +[_ATXAppPredictor getParseTreeForConsumerSubType:v4];
  v5[2](v5, v6, 0);
}

- (void)getPredictionModelDetailsForConsumerSubType:(unsigned __int8)a3 reply:(id)a4
{
  uint64_t v4 = a3;
  id v5 = (void (**)(id, id, void *, void))a4;
  id v6 = +[_ATXAppPredictor sharedInstance];
  id v9 = [v6 getPredictionModelDetailsForConsumerSubType:v4];

  uint64_t v7 = +[_ATXAppPredictor sharedInstance];
  uint64_t v8 = [v7 getABGroups];

  v5[2](v5, v9, v8, 0);
}

- (void)benchmarkAppPrediction:(unint64_t)a3 reply:(id)a4
{
}

- (void)benchmarkAppPredictionForConsumerSubType:(unsigned __int8)a3 ntimes:(unint64_t)a4 reply:(id)a5
{
  uint64_t v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void))a5;
  if (*(double *)&benchmarkAppPredictionForConsumerSubType_ntimes_reply__msPerTick == 0.0)
  {
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    LODWORD(v9) = info.denom;
    LODWORD(v8) = info.numer;
    *(double *)&benchmarkAppPredictionForConsumerSubType_ntimes_reply__msPerTick = (double)v8 / (double)v9 * 0.000001;
  }
  for (i = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4]; a4; --a4)
  {
    id v11 = (void *)MEMORY[0x1D25F6CC0]();
    uint64_t v12 = mach_absolute_time();
    id v13 = +[_ATXAppPredictor sharedInstance];
    id v14 = (id)[v13 predictWithLimit:8 consumerSubType:v6 intent:0 candidateBundleIdentifiers:0 candidateActiontypes:0 scoreLogger:0];

    id v15 = [NSNumber numberWithDouble:*(double *)&benchmarkAppPredictionForConsumerSubType_ntimes_reply__msPerTick* (double)(mach_absolute_time() - v12)];
    [i addObject:v15];
  }
  v7[2](v7, i, 0);
}

- (void)createAppPredictionLogs:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  uint64_t v3 = +[ATXPredictionJSONScoreLogger sharedInstance];
  uint64_t v4 = dispatch_group_create();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = [&unk_1F27F3750 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(&unk_1F27F3750);
        }
        unint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * v8);
        uint64_t v10 = (void *)MEMORY[0x1D25F6CC0]();
        dispatch_group_enter(v4);
        LOBYTE(v9) = [v9 unsignedIntegerValue];
        id v11 = +[_ATXAppPredictor sharedInstance];
        id v12 = (id)[v11 predictWithLimit:8 consumerSubType:v9 intent:0 candidateBundleIdentifiers:0 candidateActiontypes:0 scoreLogger:v3];

        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __48___ATXInspectionServer_createAppPredictionLogs___block_invoke;
        v20[3] = &unk_1E68AB818;
        uint64_t v21 = v4;
        [v3 flushWithCompletion:v20];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [&unk_1F27F3750 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }
  id v13 = (void *)MEMORY[0x1E4F93B18];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __48___ATXInspectionServer_createAppPredictionLogs___block_invoke_128;
  v18[3] = &unk_1E68AB618;
  id v19 = v15;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __48___ATXInspectionServer_createAppPredictionLogs___block_invoke_129;
  v16[3] = &unk_1E68AB618;
  id v17 = v19;
  id v14 = v19;
  [v13 waitForGroup:v4 timeoutSeconds:v18 onGroupComplete:v16 onTimeout:3.0];
}

- (void)getActionLogs:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v33 = (void (**)(id, void *, void))a3;
  uint64_t v3 = +[_ATXDataStore sharedInstance];
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = objc_opt_new();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v36 = v3;
  obuint64_t j = [v3 actionLogKeys];
  uint64_t v6 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v46 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        id v11 = [v10 first];
        id v12 = [v10 second];
        id v13 = [v4 objectForKeyedSubscript:v11];

        if (!v13)
        {
          id v14 = objc_opt_new();
          [v4 setObject:v14 forKeyedSubscript:v11];
        }
        id v15 = [v4 objectForKeyedSubscript:v11];
        id v16 = [v15 objectForKeyedSubscript:v12];

        if (!v16)
        {
          id v16 = objc_opt_new();
          id v17 = [v4 objectForKeyedSubscript:v11];
          [v17 setObject:v16 forKeyedSubscript:v12];
        }
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __38___ATXInspectionServer_getActionLogs___block_invoke;
        v43[3] = &unk_1E68B4220;
        id v44 = v16;
        id v18 = v16;
        [v36 enumerateActionOfType:v12 bundleId:v11 block:v43];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v7);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obja = [v36 actionFeedbackLogKeys];
  uint64_t v19 = [obja countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v40 != v21) {
          objc_enumerationMutation(obja);
        }
        long long v23 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        long long v24 = [v23 first];
        long long v25 = [v23 second];
        id v26 = [v5 objectForKeyedSubscript:v24];

        if (!v26)
        {
          uint64_t v27 = objc_opt_new();
          [v5 setObject:v27 forKeyedSubscript:v24];
        }
        uint64_t v28 = [v5 objectForKeyedSubscript:v24];
        id v29 = [v28 objectForKeyedSubscript:v25];

        if (!v29)
        {
          id v29 = objc_opt_new();
          v30 = [v5 objectForKeyedSubscript:v24];
          [v30 setObject:v29 forKeyedSubscript:v25];
        }
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __38___ATXInspectionServer_getActionLogs___block_invoke_2;
        v37[3] = &unk_1E68B4248;
        id v38 = v29;
        id v31 = v29;
        [v36 enumerateFeedbackForActionOfType:v25 bundleId:v24 block:v37];
      }
      uint64_t v20 = [obja countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v20);
  }

  v49[0] = @"actions";
  v49[1] = @"feedback";
  v50[0] = v4;
  v50[1] = v5;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];
  v33[2](v33, v32, 0);
}

- (void)histogramsInMemory:(id)a3
{
  uint64_t v3 = (void (**)(id, void *, void))a3;
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = +[_ATXAppLaunchHistogramManager sharedInstance];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __43___ATXInspectionServer_histogramsInMemory___block_invoke;
  v15[3] = &unk_1E68B4270;
  id v6 = v4;
  id v16 = v6;
  [v5 enumerateInMemoryHistogramsWithBlock:v15];

  uint64_t v7 = +[_ATXAppLaunchHistogramManager sharedInstance];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __43___ATXInspectionServer_histogramsInMemory___block_invoke_2;
  id v13 = &unk_1E68B4298;
  id v14 = v6;
  id v8 = v6;
  [v7 enumerateInMemoryCategoricalHistogramsWithBlock:&v10];

  unint64_t v9 = objc_msgSend(v8, "copy", v10, v11, v12, v13);
  v3[2](v3, v9, 0);
}

- (void)histogramsInMemoryBySize:(id)a3
{
  uint64_t v3 = (void (**)(id, void *, void))a3;
  uint64_t v4 = +[_ATXDataStore sharedInstance];
  uint64_t v5 = objc_opt_new();
  id v6 = +[_ATXAppLaunchHistogramManager sharedInstance];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __49___ATXInspectionServer_histogramsInMemoryBySize___block_invoke;
  v20[3] = &unk_1E68B42C0;
  id v7 = v4;
  id v21 = v7;
  id v8 = v5;
  id v22 = v8;
  [v6 enumerateInMemoryHistogramsWithBlock:v20];

  unint64_t v9 = +[_ATXAppLaunchHistogramManager sharedInstance];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __49___ATXInspectionServer_histogramsInMemoryBySize___block_invoke_2;
  id v17 = &unk_1E68B42E8;
  id v18 = v7;
  id v19 = v8;
  id v10 = v8;
  id v11 = v7;
  [v9 enumerateInMemoryCategoricalHistogramsWithBlock:&v14];

  id v12 = objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_223, v14, v15, v16, v17);
  id v13 = objc_msgSend(v12, "_pas_mappedArrayWithTransform:", &__block_literal_global_226);
  v3[2](v3, v13, 0);
}

- (void)allHistogramsBySize:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v17 = (void (**)(id, void *, void))a3;
  uint64_t v3 = +[_ATXDataStore sharedInstance];
  uint64_t v4 = objc_opt_new();
  for (uint64_t i = 0; i != 99; ++i)
  {
    uint64_t v6 = [v3 histogramDataForHistogramType:i];
    if (v6)
    {
      id v7 = (void *)v6;
      id v8 = +[_ATXDataStore stringForHistogramType:i];
      uint64_t v20 = v8;
      unint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "length"));
      v21[0] = v9;
      id v10 = (void *)MEMORY[0x1E4F1C9E8];
      id v11 = (void **)v21;
      id v12 = &v20;
    }
    else
    {
      uint64_t v13 = [v3 categoricalHistogramDataForHistogramType:i];
      if (!v13) {
        continue;
      }
      id v7 = (void *)v13;
      id v8 = +[_ATXDataStore stringForHistogramType:i];
      id v18 = v8;
      unint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "length"));
      id v19 = v9;
      id v10 = (void *)MEMORY[0x1E4F1C9E8];
      id v11 = &v19;
      id v12 = &v18;
    }
    uint64_t v14 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:1];
    [v4 addObject:v14];
  }
  uint64_t v15 = [v4 sortedArrayUsingComparator:&__block_literal_global_231];
  id v16 = objc_msgSend(v15, "_pas_mappedArrayWithTransform:", &__block_literal_global_233);
  v17[2](v17, v16, 0);
}

- (void)retrainActionHistograms:(id)a3
{
  uint64_t v3 = (void (**)(id, void))a3;
  +[_ATXActionUtils prefillActionHistograms];
  v3[2](v3, 0);
}

- (void)retrainActionSlotDatabase:(id)a3
{
  uint64_t v3 = (void (**)(id, void))a3;
  +[_ATXActionUtils prefillActionSlotDatabase];
  v3[2](v3, 0);
}

- (void)resetActionPredictions:(id)a3
{
  uint64_t v3 = (void (**)(id, void))a3;
  +[_ATXActionUtils resetActionPredictions];
  v3[2](v3, 0);
}

- (void)getAppFeedbackData:(id)a3
{
  v50[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = +[_ATXFeedback sharedInstance];
  v49[0] = @"baseAlpha";
  uint64_t v5 = NSNumber;
  +[_ATXFeedbackConstants baseAlpha];
  uint64_t v6 = objc_msgSend(v5, "numberWithDouble:");
  v50[0] = v6;
  v49[1] = @"baseBeta";
  id v7 = NSNumber;
  +[_ATXFeedbackConstants baseBeta];
  id v8 = objc_msgSend(v7, "numberWithDouble:");
  v50[1] = v8;
  void v49[2] = @"currentAlpha";
  unint64_t v9 = NSNumber;
  [v4 currentAlpha];
  id v10 = objc_msgSend(v9, "numberWithDouble:");
  void v50[2] = v10;
  v49[3] = @"currentBeta";
  id v11 = NSNumber;
  [v4 currentBeta];
  id v12 = objc_msgSend(v11, "numberWithDouble:");
  v50[3] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:4];

  uint64_t v14 = +[_ATXAppIconState sharedInstance];
  uint64_t v15 = [v14 allInstalledAppsKnownToSpringBoard];
  uint64_t v43 = [v15 count];
  size_t v16 = 8 * v43;
  id v17 = (double *)malloc_type_malloc(8 * v43, 0x100004000313F17uLL);
  if (!v17) {
    goto LABEL_8;
  }
  id v18 = v17;
  long long v41 = (void *)v13;
  unint64_t v19 = 0x1E4F28000uLL;
  uint64_t v20 = (double *)malloc_type_malloc(v16, 0x100004000313F17uLL);
  if (!v20
    || (id v21 = v20,
        long long v39 = v14,
        long long v40 = (void (**)(void, void, void))v3,
        (id v22 = (double *)malloc_type_malloc(v16, 0x100004000313F17uLL)) == 0))
  {
LABEL_8:
    id v37 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v37);
  }
  long long v23 = v22;
  id v38 = v4;
  [v4 putFeedbackScoresForApps:v15 intoScores:v18 confirms:v21 rejects:v22];
  long long v42 = objc_opt_new();
  unint64_t v24 = 0x1E4F1C000uLL;
  long long v25 = v15;
  if (v43)
  {
    for (uint64_t i = 0; i != v43; ++i)
    {
      v47[0] = @"score";
      id v44 = [*(id *)(v19 + 3792) numberWithDouble:v18[i]];
      v48[0] = v44;
      v47[1] = @"confirms";
      uint64_t v27 = [*(id *)(v19 + 3792) numberWithDouble:v21[i]];
      v48[1] = v27;
      void v47[2] = @"rejects";
      uint64_t v28 = [*(id *)(v19 + 3792) numberWithDouble:v23[i]];
      v48[2] = v28;
      id v29 = [*(id *)(v24 + 2536) dictionaryWithObjects:v48 forKeys:v47 count:3];
      [v25 objectAtIndexedSubscript:i];
      unint64_t v30 = v24;
      id v31 = v23;
      v32 = v21;
      id v33 = v18;
      id v35 = v34 = v25;
      [v42 setObject:v29 forKeyedSubscript:v35];

      long long v25 = v34;
      id v18 = v33;
      id v21 = v32;
      long long v23 = v31;
      unint64_t v24 = v30;

      unint64_t v19 = 0x1E4F28000;
    }
  }
  free(v18);
  free(v21);
  free(v23);
  v45[0] = @"params";
  v45[1] = @"apps";
  v46[0] = v41;
  v46[1] = v42;
  id v36 = [*(id *)(v24 + 2536) dictionaryWithObjects:v46 forKeys:v45 count:2];
  ((void (**)(void, void *, void))v40)[2](v40, v36, 0);
}

- (void)trainMagicalMomentsAppPredictor:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t, void))a3;
  id v3 = +[ATXMagicalMomentsAppPredictor sharedInstance];
  [v3 trainWithXPCActivity:0];

  v4[2](v4, 1, 0);
}

- (void)forceMagicalMomentsAppPredictionForBundleId:(id)a3 expert:(id)a4 reply:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (NSString *)a4;
  unint64_t v9 = (void (**)(id, uint64_t, void))a5;
  id v10 = __atxlog_handle_default();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[_ATXInspectionServer forceMagicalMomentsAppPredictionForBundleId:expert:reply:]();
  }

  Class v11 = NSClassFromString(v8);
  if ([(objc_class *)v11 isSubclassOfClass:objc_opt_class()])
  {
    NSClassFromString(v8);
    id v12 = objc_opt_new();
    uint64_t v13 = [[ATXMagicalMomentsPrediction alloc] initWithConfidence:v7 predictionIdentifier:1.0];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = [(id)objc_opt_class() sampleEventForExpert];
    unint64_t v19 = v13;
    size_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    [v14 broadcastMMPredictionsForEvent:v15 predictions:v16];

    v9[2](v9, 1, 0);
  }
  else
  {
    id v17 = __atxlog_handle_default();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[_ATXInspectionServer forceMagicalMomentsAppPredictionForBundleId:expert:reply:]();
    }

    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21[0] = @"ATXMM: Tried to force a MagicalMoments App Prediction with an unrecognized expert. Terminating operation.";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v13 = (ATXMagicalMomentsPrediction *)[v18 initWithDomain:@"ATXMM" code:-1 userInfo:v12];
    ((void (**)(id, uint64_t, ATXMagicalMomentsPrediction *))v9)[2](v9, 0, v13);
  }
}

- (void)dumpPredictionTableForMMExpert:(id)a3 reply:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (NSString *)a3;
  uint64_t v6 = (void (**)(id, void *, void))a4;
  id v7 = __atxlog_handle_default();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[_ATXInspectionServer dumpPredictionTableForMMExpert:reply:]((uint64_t)v5, v7);
  }

  Class v8 = NSClassFromString(v5);
  if ([(objc_class *)v8 isSubclassOfClass:objc_opt_class()])
  {
    NSClassFromString(v5);
    unint64_t v9 = objc_opt_new();
    id v10 = [(id)objc_opt_class() predictionTable];
    Class v11 = [v10 describeTable];
    v6[2](v6, v11, 0);
  }
  else
  {
    id v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_ATXInspectionServer forceMagicalMomentsAppPredictionForBundleId:expert:reply:]();
    }

    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v15[0] = @"ATXMM: Tried to force a MagicalMoments App Prediction with an unrecognized expert. Terminating operation.";
    unint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v10 = (void *)[v13 initWithDomain:@"ATXMM" code:-1 userInfo:v9];
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v10);
  }
}

- (void)evaluateInfoSuggestionsWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = +[ATXInfoSuggestionServer sharedInstance];
  [v4 refreshInfoSuggestionsWithCompletionHandler:v3];
}

- (void)getInfoSuggestionsInString:(id)a3
{
  id v3 = (void (**)(id, void *, void))a3;
  id v4 = +[ATXInfoSuggestionServer sharedInstance];
  uint64_t v5 = [v4 infoEngine];
  id v7 = [v5 allRelevantInfoSuggestions];

  uint64_t v6 = [v7 componentsJoinedByString:@"\n"];
  v3[2](v3, v6, 0);
}

- (void)fetchSuggestionsForSourceId:(id)a3 reply:(id)a4
{
  uint64_t v5 = (void (**)(id, void *, void))a4;
  id v6 = a3;
  id v7 = +[ATXInfoSuggestionServer sharedInstance];
  Class v8 = [v7 infoEngine];
  id v10 = [v8 allInfoSuggestionsForSourceId:v6];

  unint64_t v9 = [v10 componentsJoinedByString:@"\n"];
  v5[2](v5, v9, 0);
}

- (void)widgetBundleIdentifiersForAllInfoSuggestionsInString:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = (void (**)(id, void *, void))a3;
  id v4 = +[ATXInfoSuggestionServer sharedInstance];
  uint64_t v5 = [v4 infoEngine];
  id v6 = [v5 allInfoSuggestions];

  id v7 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12), "widgetBundleIdentifier", (void)v16);
        [v7 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [v7 allObjects];
  uint64_t v15 = [v14 componentsJoinedByString:@"\n"];
  v3[2](v3, v15, 0);
}

- (void)getInfoPredictionsInString:(id)a3
{
  id v3 = (void (**)(id, void *, void))a3;
  id v4 = +[ATXInfoSuggestionServer sharedInstance];
  uint64_t v5 = [v4 infoEngine];
  id v7 = [v5 currentPredictions];

  id v6 = [v7 componentsJoinedByString:@"\n"];
  v3[2](v3, v6, 0);
}

- (void)rankAndReturnInfoPredictionsInString:(id)a3
{
  id v3 = (void (**)(id, void *, void))a3;
  id v4 = +[ATXInfoSuggestionServer sharedInstance];
  uint64_t v5 = [v4 infoEngine];
  id v7 = [v5 forceUpdateAndReturnPredictions];

  id v6 = [v7 componentsJoinedByString:@"\n"];
  v3[2](v3, v6, 0);
}

- (void)categoriesWithShouldUseDefault:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = __atxlog_handle_default();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[_ATXInspectionServer categoriesWithShouldUseDefault:reply:](v4, v6);
  }

  if (v4)
  {
    id v7 = [MEMORY[0x1E4F4AEB8] sharedInstance];
    [v7 categoriesWithShouldUseDefault:1 reply:v5];
  }
  else
  {
    id v7 = +[ATXAppDirectoryOrderingProvider sharedInstance];
    [v7 categoriesWithReply:v5];
  }
}

- (void)getModeTimelineDataFromStartDate:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ATXNotificationsLoggingServer sharedInstance];
  [v7 getModeTimelineDataFromStartDate:v6 reply:v5];
}

- (void)lockScreenBundleIdsWithReply:(id)a3
{
  id v4 = a3;
  id v6 = +[ATXNotificationsLoggingServer sharedInstance];
  id v5 = [v6 getLockscreenBundleIds];
  (*((void (**)(id, void *, void))a3 + 2))(v4, v5, 0);
}

- (void)appLaunchInformationWithReply:(id)a3
{
  id v3 = a3;
  id v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[_ATXInspectionServer appLaunchInformationWithReply:]();
  }

  id v5 = +[ATXAppDirectoryOrderingProvider sharedInstance];
  [v5 appLaunchInformationWithReply:v3];
}

- (void)categoryLaunchInformationWithReply:(id)a3
{
  id v3 = a3;
  id v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[_ATXInspectionServer categoryLaunchInformationWithReply:]();
  }

  id v5 = +[ATXAppDirectoryOrderingProvider sharedInstance];
  [v5 categoryLaunchInformationWithReply:v3];
}

- (void)appLaunchDatesWithReply:(id)a3
{
  id v3 = a3;
  id v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[_ATXInspectionServer categoryLaunchInformationWithReply:]();
  }

  id v5 = +[ATXAppDirectoryOrderingProvider sharedInstance];
  [v5 appLaunchDatesWithReply:v3];
}

- (void)updateAppDirectoryCache:(id)a3
{
  id v3 = a3;
  id v4 = +[ATXAppDirectoryOrderingProvider sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48___ATXInspectionServer_updateAppDirectoryCache___block_invoke;
  v6[3] = &unk_1E68AEE28;
  id v7 = v3;
  id v5 = v3;
  [v4 updateCacheWithActivity:0 completionHandler:v6];
}

- (void)refreshBlendingLayer:(id)a3
{
  id v3 = (void (**)(id, void))a3;
  id v8 = (id)objc_opt_new();
  id v4 = [v8 cachedSuggestionsForAllClientModels];
  id v5 = +[ATXClientModelSuggestionReceiver sharedInstance];
  id v6 = [v5 blendingLayerServer];
  id v7 = [v6 blendingLayer];

  [v7 updateSuggestionsForAllConsumerSubTypesWithClientModelSuggestions:v4];
  v3[2](v3, 0);
}

- (void)promoteSuggestionsFromClientModel:(id)a3 reply:(id)a4
{
  id v5 = (void (**)(id, void))a4;
  id v6 = a3;
  id v7 = +[ATXClientModelSuggestionReceiver sharedInstance];
  id v8 = [v7 blendingLayerServer];
  id v11 = [v8 blendingLayer];

  [v11 promoteSuggestionsFromClientModelWithIdentifier:v6];
  uint64_t v9 = objc_opt_new();
  uint64_t v10 = [v9 cachedSuggestionsForAllClientModels];
  [v11 updateSuggestionsForAllConsumerSubTypesWithClientModelSuggestions:v10];
  v5[2](v5, 0);
}

- (void)donateSuggestion:(id)a3 forClientModel:(int64_t)a4 withReply:(id)a5
{
  id v7 = (void *)MEMORY[0x1E4F93940];
  id v8 = (void (**)(id, void))a5;
  id v9 = a3;
  id v20 = [v7 clientModelIdFromClientModelType:a4];
  id v10 = objc_alloc(MEMORY[0x1E4F93940]);
  id v11 = +[ATXClientModelSuggestionReceiver sharedInstance];
  uint64_t v12 = [v11 blendingLayerServer];
  id v13 = (void *)[v10 initWithClientModelId:v20 blendingLayerServer:v12];

  uint64_t v14 = objc_opt_new();
  uint64_t v15 = [v14 cachedSuggestionsForAllClientModels];

  long long v16 = (void *)MEMORY[0x1E4F1CA48];
  long long v17 = [v15 objectForKeyedSubscript:v20];
  long long v18 = [v17 suggestions];
  long long v19 = [v16 arrayWithArray:v18];

  [v19 addObject:v9];
  [v13 updateSuggestions:v19];
  v8[2](v8, 0);
}

- (void)clearBlendingSuggestionsForClientModel:(int64_t)a3 withReply:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F93940];
  id v6 = (void (**)(id, void))a4;
  id v11 = [v5 clientModelIdFromClientModelType:a3];
  id v7 = objc_alloc(MEMORY[0x1E4F93940]);
  id v8 = +[ATXClientModelSuggestionReceiver sharedInstance];
  id v9 = [v8 blendingLayerServer];
  id v10 = (void *)[v7 initWithClientModelId:v11 blendingLayerServer:v9];

  [v10 updateSuggestions:MEMORY[0x1E4F1CBF0]];
  v6[2](v6, 0);
}

- (void)blendedSuggestionsForConsumerSubType:(unsigned __int8)a3 reply:(id)a4
{
  id v4 = (void (**)(id, void *, void))a4;
  id v5 = +[ATXClientModelSuggestionReceiver sharedInstance];
  id v6 = [v5 blendingLayerServer];
  id v10 = [v6 blendingLayer];

  id v7 = objc_opt_new();
  id v8 = [v7 cachedSuggestionsForAllClientModels];
  id v9 = [v10 rerankedValidSuggestionsFromClientModelSuggestions:v8];
  v4[2](v4, v9, 0);
}

- (void)buildAnchorModelTrainingDataset:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v3 = objc_opt_new();
  [v3 addNewTrainingSamplesToDatabase];

  v4[2](v4, 0);
}

- (void)trainAnchorModel:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v3 = objc_opt_new();
  [v3 train];

  v4[2](v4, 0);
}

- (void)scheduledPredictionsForAnchorModelWithReply:(id)a3
{
  id v3 = (void (**)(id, void *, void))a3;
  id v5 = (id)objc_opt_new();
  id v4 = [v5 predictions];
  v3[2](v3, v4, 0);
}

- (void)validPredictionsRightNowForAnchorModelWithReply:(id)a3
{
  id v3 = (void (**)(id, void *, void))a3;
  id v5 = (id)objc_opt_new();
  id v4 = [v5 predictionsValidNow];
  v3[2](v3, v4, 0);
}

- (void)schedulePredictionsForAnchorModel:(id)a3 anchorType:(id)a4 reply:(id)a5
{
  id v7 = (void (**)(id, void))a5;
  id v8 = a3;
  +[ATXAnchor anchorClassFromAnchorTypeString:a4];
  id v10 = (id)objc_opt_new();
  id v9 = objc_opt_new();
  [v9 schedulePredictions:v8 anchor:v10];

  v7[2](v7, 0);
}

- (void)processLockscreenFeedbackWithReply:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v3 = +[ATXUpdatePredictionsManager sharedInstance];
  [v3 processLockscreenFeedback];

  v4[2](v4, 0);
}

- (void)processHomeScreenFeedbackWithReply:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v3 = +[ATXUpdatePredictionsManager sharedInstance];
  [v3 processHomeScreenFeedback];

  v4[2](v4, 0);
}

- (void)processSpotlightAppFeedbackWithReply:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v3 = +[ATXUpdatePredictionsManager sharedInstance];
  [v3 processSpotlightAppFeedback];

  v4[2](v4, 0);
}

- (void)processSpotlightActionFeedbackWithReply:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v3 = +[ATXUpdatePredictionsManager sharedInstance];
  [v3 processSpotlightActionFeedback];

  v4[2](v4, 0);
}

- (void)processAppDirectoryFeedbackWithReply:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v3 = +[ATXUpdatePredictionsManager sharedInstance];
  [v3 processAppDirectoryFeedback];

  v4[2](v4, 0);
}

- (void)performHomeScreenCoreAnalyticsDryRunWithCustomStartDate:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_opt_new();
  [v7 uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity:0 customStartDate:v6 dryRunCompletionHandler:v5];
}

- (void)nPlusOneStudyDryRunResultFilterByExtensionBundleId:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_opt_new();
  [v7 dryRunResultFilterByExtensionBundleId:v6 completionHandler:v5];
}

- (void)trainModeEntityModelsWithDeferTrainingWhenApplicable:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void))a4;
  id v5 = objc_opt_new();
  [v5 trainWithShouldDeferTrainingOnBackupRestoreOrUpgrade:v4];

  v6[2](v6, 0);
}

- (void)trainModeSetupPredictionModelWithReply:(id)a3
{
  BOOL v4 = (void (**)(id, void))a3;
  id v3 = objc_opt_new();
  [v3 train];

  v4[2](v4, 0);
}

- (void)inspectInferredActivitySessionStream:(id)a3 fromTimestamp:(double)a4 reply:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = __atxlog_handle_default();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    int v12 = 138412802;
    id v13 = v11;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2048;
    double v17 = a4;
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_INFO, "[%@] Inspecting stream %@ from timestamp %f", (uint8_t *)&v12, 0x20u);
  }
  +[ATXUnifiedInferredActivityBiomeInspector retrieveInferredActivitySessionsFromPublisherName:v7 startTime:v8 reply:a4];
}

- (void)inspectInferredActivityTransitionStream:(id)a3 fromTimestamp:(double)a4 reply:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = __atxlog_handle_default();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    int v12 = 138412802;
    id v13 = v11;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2048;
    double v17 = a4;
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_INFO, "[%@] Inspecting stream %@ from timestamp %f", (uint8_t *)&v12, 0x20u);
  }
  +[ATXUnifiedInferredActivityBiomeInspector retrieveInferredActivityTransitionsFromPublisherName:v7 startTime:v8 reply:a4];
}

- (void)forceNotificationAndSuggestionDbUpdate:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void (**)(id, void))a3;
  BOOL v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_INFO, "[%@] Forcing notification and suggestion DB update", (uint8_t *)&v8, 0xCu);
  }
  id v7 = objc_opt_new();
  [v7 updateDatabase];
  v3[2](v3, 0);
}

- (void)generateSerializedNotificationDigestFromFileData:(id)a3 digestTimeString:(id)a4 reply:(id)a5
{
  id v7 = (void (**)(id, void *, id))a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_opt_new();
  id v13 = 0;
  id v11 = [v10 fetchSerializedNotificationDigestFromFileData:v9 digestTimeString:v8 outError:&v13];

  id v12 = v13;
  v7[2](v7, v11, v12);
}

- (void)generateSerializedNotificationDigestFromSource:(id)a3 digestTimeString:(id)a4 startDate:(id)a5 endDate:(id)a6 inferMessages:(BOOL)a7 reply:(id)a8
{
  BOOL v8 = a7;
  id v13 = (void (**)(id, void *, id))a8;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = objc_opt_new();
  id v21 = 0;
  long long v19 = [v18 fetchSerializedNotificationDigestFromSource:v17 digestTimeString:v16 startDate:v15 endDate:v14 shouldInferMessages:v8 outError:&v21];

  id v20 = v21;
  v13[2](v13, v19, v20);
}

- (void)generateSerializedAppGroupedNotificationDigestFromSource:(id)a3 digestTimeString:(id)a4 startDate:(id)a5 endDate:(id)a6 inferMessages:(BOOL)a7 reply:(id)a8
{
  BOOL v8 = a7;
  id v13 = (void (**)(id, void *, id))a8;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = objc_opt_new();
  id v21 = 0;
  long long v19 = [v18 fetchSerializedAppGroupedNotificationDigestFromSource:v17 digestTimeString:v16 startDate:v15 endDate:v14 shouldInferMessages:v8 outError:&v21];

  id v20 = v21;
  v13[2](v13, v19, v20);
}

- (void)generateSerializedMissedNotificationBundleFromFileData:(id)a3 modeString:(id)a4 reply:(id)a5
{
  id v7 = (void (**)(id, void *, id))a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_opt_new();
  id v13 = 0;
  id v11 = [v10 fetchSerializedMissedNotificationRankingFromFileData:v9 modeString:v8 outError:&v13];

  id v12 = v13;
  v7[2](v7, v11, v12);
}

- (void)generateSerializedMissedNotificationBundleFromSource:(id)a3 modeString:(id)a4 startDate:(id)a5 endDate:(id)a6 inferMessages:(BOOL)a7 reply:(id)a8
{
  BOOL v8 = a7;
  id v13 = (void (**)(id, void *, id))a8;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = objc_opt_new();
  id v21 = 0;
  long long v19 = [v18 fetchSerializedMissedNotificationRankingFromSource:v17 modeString:v16 startDate:v15 endDate:v14 shouldInferMessages:v8 outError:&v21];

  id v20 = v21;
  v13[2](v13, v19, v20);
}

- (void)dumpNotificationJSONFromSource:(id)a3 startDate:(id)a4 endDate:(id)a5 inferMessages:(BOOL)a6 reply:(id)a7
{
  BOOL v7 = a6;
  id v11 = (void (**)(id, void *, id))a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = objc_opt_new();
  id v18 = 0;
  id v16 = [v15 fetchSerializedNotificationsFromSource:v14 startDate:v13 endDate:v12 shouldInferMessages:v7 outError:&v18];

  id v17 = v18;
  v11[2](v11, v16, v17);
}

- (void)clearNotificationsWithReply:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  BOOL v4 = objc_opt_new();
  id v6 = 0;
  [v4 clearAllNotificationData:&v6];
  id v5 = v6;
  v3[2](v3, v5);
}

- (void)showDigestFeedbackHistogramForBundleId:(id)a3 withReply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_opt_new();
  [v7 showHistogramForBundleId:v6 withReply:v5];
}

- (void)addToDigestFeedbackHistogramForBundleId:(id)a3 location:(id)a4 feedback:(id)a5 withReply:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = (id)objc_opt_new();
  [v13 addToHistogramForBundleId:v12 location:v11 feedback:v10 withReply:v9];
}

- (void)setDigestFeedbackHistogramValueForBundleId:(id)a3 location:(id)a4 feedback:(id)a5 value:(id)a6 withReply:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = (id)objc_opt_new();
  [v16 setHistogramValueForBundleId:v15 location:v14 feedback:v13 value:v12 withReply:v11];
}

- (void)clearDigestFeedbackHistogramWithShouldResetBookmarks:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = (id)objc_opt_new();
  [v6 clearHistogramWithShouldResetBookmarks:v4 reply:v5];
}

- (void)getCurrentLocationWithReply:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F935D0];
  BOOL v4 = (void (**)(id, void *, void))a3;
  id v6 = [v3 sharedInstance];
  id v5 = [v6 getCurrentLocation];
  v4[2](v4, v5, 0);
}

- (void)generateDataForStressTestWithReply:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59___ATXInspectionServer_generateDataForStressTestWithReply___block_invoke;
  v6[3] = &unk_1E68AD5F0;
  id v7 = v3;
  id v5 = v3;
  [v4 setupForStressCyclerWithCompletion:v6];
}

- (void)clearAllDataForStressTestWithReply:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59___ATXInspectionServer_clearAllDataForStressTestWithReply___block_invoke;
  v6[3] = &unk_1E68AD5F0;
  id v7 = v3;
  id v5 = v3;
  [v4 clearAllDataForStressCyclerWithCompletion:v6];
}

- (void)fetchPosterDescriptorsWithReply:(id)a3
{
  id v4 = a3;
  id v7 = +[ATXPosterDescriptorCache sharedInstance];
  id v5 = [v7 allDescriptors];
  id v6 = [v5 allObjects];
  (*((void (**)(id, void *, void))a3 + 2))(v4, v6, 0);
}

- (void)logNotificationMetricsFromStartTimestamp:(id)a3 toEndTimestamp:(id)a4 withCompletion:(id)a5
{
  id v7 = (void (**)(id, void))a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [ATXNotificationTelemetryLogger alloc];
  id v11 = objc_opt_new();
  id v12 = [(ATXNotificationTelemetryLogger *)v10 initWithContactStore:v11];

  [(ATXNotificationTelemetryLogger *)v12 logNotificationMetricsFromStartTimestamp:v9 toEndTimestamp:v8 withXPCActivity:0];
  v7[2](v7, 0);
}

- (void).cxx_destruct
{
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "Rejecting connection %@ without entitlement %@", v1, 0x16u);
}

- (void)feedbackLaunchedWithConsumerSubType:forBundleId:rejected:reply:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Can't record received feedback since ATXPredictionContext is nil", v2, v3, v4, v5, v6);
}

- (void)forceMagicalMomentsAppPredictionForBundleId:expert:reply:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ATXMM: Tried to force a MagicalMoments App Prediction with an unrecognized expert. Terminating operation.", v2, v3, v4, v5, v6);
}

- (void)forceMagicalMomentsAppPredictionForBundleId:expert:reply:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEBUG, "ATXMM: Forcing MM App Prediction for bundleId: %@, expert: %@", v1, 0x16u);
}

- (void)dumpPredictionTableForMMExpert:(uint64_t)a1 reply:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "ATXMM: Dumping prediction table for expert: %@", (uint8_t *)&v2, 0xCu);
}

- (void)categoriesWithShouldUseDefault:(char)a1 reply:(NSObject *)a2 .cold.1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "AppDirectoryOrdering: getting categories with default: %{BOOL}d", (uint8_t *)v2, 8u);
}

- (void)appLaunchInformationWithReply:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "AppDirectoryOrdering: getting appLaunchCounts", v2, v3, v4, v5, v6);
}

- (void)categoryLaunchInformationWithReply:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "AppDirectoryOrdering: getting categoryLaunchCounts", v2, v3, v4, v5, v6);
}

@end