@interface _ATXInspectionClient
- (_ATXInspectionClient)init;
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
- (void)dealloc;
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

@implementation _ATXInspectionClient

- (_ATXInspectionClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)_ATXInspectionClient;
  v2 = [(_ATXInspectionClient *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.duet.appPrediction.inspection" options:0];
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    v5 = _ATXInspectionInterface();
    [(NSXPCConnection *)v2->_xpcConnection setRemoteObjectInterface:v5];

    [(NSXPCConnection *)v2->_xpcConnection setInterruptionHandler:&__block_literal_global_35];
    [(NSXPCConnection *)v2->_xpcConnection resume];
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_ATXInspectionClient;
  [(_ATXInspectionClient *)&v3 dealloc];
}

- (void)appAndActionHistoryClear:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49___ATXInspectionClient_appAndActionHistoryClear___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 appAndActionHistoryClear:v6];
}

- (void)appHistoryClearAppIntent:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49___ATXInspectionClient_appHistoryClearAppIntent___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 appHistoryClearAppIntent:v6];
}

- (void)appHistoryAddLaunch:(id)a3 launchReason:(id)a4 date:(id)a5 timeZone:(id)a6 reply:(id)a7
{
  id v12 = a7;
  xpcConnection = self->_xpcConnection;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __77___ATXInspectionClient_appHistoryAddLaunch_launchReason_date_timeZone_reply___block_invoke;
  v20[3] = &unk_1E68AD5F0;
  id v21 = v12;
  id v14 = v12;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v20];
  [v19 appHistoryAddLaunch:v18 launchReason:v17 date:v16 timeZone:v15 reply:v14];
}

- (void)appHistoryUpdateActionPredictionPipelineWithAction:(id)a3 date:(id)a4 timeZone:(id)a5 reply:(id)a6
{
  id v10 = a6;
  xpcConnection = self->_xpcConnection;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __95___ATXInspectionClient_appHistoryUpdateActionPredictionPipelineWithAction_date_timeZone_reply___block_invoke;
  v17[3] = &unk_1E68AD5F0;
  id v18 = v10;
  id v12 = v10;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v17];
  [v16 appHistoryUpdateActionPredictionPipelineWithAction:v15 date:v14 timeZone:v13 reply:v12];
}

- (void)appHistoryActionWithUUID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55___ATXInspectionClient_appHistoryActionWithUUID_reply___block_invoke;
  v11[3] = &unk_1E68AD5F0;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v11];
  [v10 appHistoryActionWithUUID:v9 reply:v8];
}

- (void)appHistoryAddNSUALaunch:(id)a3 requiredString:(id)a4 itemIdentifier:(id)a5 date:(id)a6 timeZone:(id)a7 reply:(id)a8
{
  id v14 = a8;
  xpcConnection = self->_xpcConnection;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __98___ATXInspectionClient_appHistoryAddNSUALaunch_requiredString_itemIdentifier_date_timeZone_reply___block_invoke;
  v23[3] = &unk_1E68AD5F0;
  id v24 = v14;
  id v16 = v14;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v23];
  [v22 appHistoryAddNSUALaunch:v21 requiredString:v20 itemIdentifier:v19 date:v18 timeZone:v17 reply:v16];
}

- (void)appHistoryAddAppIntentLaunch:(id)a3 intent:(id)a4 source:(id)a5 date:(id)a6 timeZone:(id)a7 reply:(id)a8
{
  id v14 = a8;
  xpcConnection = self->_xpcConnection;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __87___ATXInspectionClient_appHistoryAddAppIntentLaunch_intent_source_date_timeZone_reply___block_invoke;
  v23[3] = &unk_1E68AD5F0;
  id v24 = v14;
  id v16 = v14;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v23];
  [v22 appHistoryAddAppIntentLaunch:v21 intent:v20 source:v19 date:v18 timeZone:v17 reply:v16];
}

- (void)appIntentHistoryMockIntentLaunch:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 timeZone:(id)a7 reply:(id)a8
{
  id v14 = a8;
  xpcConnection = self->_xpcConnection;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __97___ATXInspectionClient_appIntentHistoryMockIntentLaunch_source_startDate_endDate_timeZone_reply___block_invoke;
  v23[3] = &unk_1E68AD5F0;
  id v24 = v14;
  id v16 = v14;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v23];
  [v22 appIntentHistoryMockIntentLaunch:v21 source:v20 startDate:v19 endDate:v18 timeZone:v17 reply:v16];
}

- (void)appIntentHistoryDonateINIntent:(id)a3 intentType:(id)a4 startDate:(id)a5 endDate:(id)a6 timeZone:(id)a7 reply:(id)a8
{
  id v14 = a8;
  xpcConnection = self->_xpcConnection;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __99___ATXInspectionClient_appIntentHistoryDonateINIntent_intentType_startDate_endDate_timeZone_reply___block_invoke;
  v23[3] = &unk_1E68AD5F0;
  id v24 = v14;
  id v16 = v14;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v23];
  [v22 appIntentHistoryDonateINIntent:v21 intentType:v20 startDate:v19 endDate:v18 timeZone:v17 reply:v16];
}

- (void)appHistoryStartDeltaRecording:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54___ATXInspectionClient_appHistoryStartDeltaRecording___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 appHistoryStartDeltaRecording:v6];
}

- (void)appHistoryStopDeltaRecording:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53___ATXInspectionClient_appHistoryStopDeltaRecording___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 appHistoryStopDeltaRecording:v6];
}

- (void)appInstallHistoryClear:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47___ATXInspectionClient_appInstallHistoryClear___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 appInstallHistoryClear:v6];
}

- (void)appInstallHistorySet:(id)a3 date:(id)a4 reply:(id)a5
{
  id v8 = a5;
  xpcConnection = self->_xpcConnection;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56___ATXInspectionClient_appInstallHistorySet_date_reply___block_invoke;
  v14[3] = &unk_1E68AD5F0;
  id v15 = v8;
  id v10 = v8;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v14];
  [v13 appInstallHistorySet:v12 date:v11 reply:v10];
}

- (void)appInstallHistoryStartDeltaRecording:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61___ATXInspectionClient_appInstallHistoryStartDeltaRecording___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 appInstallHistoryStartDeltaRecording:v6];
}

- (void)appInstallHistoryStopDeltaRecording:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60___ATXInspectionClient_appInstallHistoryStopDeltaRecording___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 appInstallHistoryStopDeltaRecording:v6];
}

- (void)feedbackClear:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38___ATXInspectionClient_feedbackClear___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 feedbackClear:v6];
}

- (void)feedbackLaunchedWithConsumerSubType:(unsigned __int8)a3 forBundleId:(id)a4 rejected:(id)a5 reply:(id)a6
{
  uint64_t v8 = a3;
  id v10 = a6;
  xpcConnection = self->_xpcConnection;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87___ATXInspectionClient_feedbackLaunchedWithConsumerSubType_forBundleId_rejected_reply___block_invoke;
  v16[3] = &unk_1E68AD5F0;
  id v17 = v10;
  id v12 = v10;
  id v13 = a5;
  id v14 = a4;
  id v15 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v16];
  [v15 feedbackLaunchedWithConsumerSubType:v8 forBundleId:v14 rejected:v13 reply:v12];
}

- (void)feedbackLaunched:(id)a3 rejected:(id)a4 reply:(id)a5
{
  id v8 = a5;
  xpcConnection = self->_xpcConnection;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56___ATXInspectionClient_feedbackLaunched_rejected_reply___block_invoke;
  v14[3] = &unk_1E68AD5F0;
  id v15 = v8;
  id v10 = v8;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v14];
  [v13 feedbackLaunchedWithConsumerSubType:9 forBundleId:v12 rejected:v11 reply:v10];
}

- (void)predictItemsAndReturnInputsAndSubscoresForConsumerSubType:(unsigned __int8)a3 intent:(id)a4 candidateBundleIds:(id)a5 candidateActiontypes:(id)a6 reply:(id)a7
{
  uint64_t v10 = a3;
  id v12 = a7;
  xpcConnection = self->_xpcConnection;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __135___ATXInspectionClient_predictItemsAndReturnInputsAndSubscoresForConsumerSubType_intent_candidateBundleIds_candidateActiontypes_reply___block_invoke;
  v19[3] = &unk_1E68AD5F0;
  id v20 = v12;
  id v14 = v12;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v19];
  [v18 predictItemsAndReturnInputsAndSubscoresForConsumerSubType:v10 intent:v17 candidateBundleIds:v16 candidateActiontypes:v15 reply:v14];
}

- (void)predictItemsAndReturnMetaDataAndInputsAndSubScoresWithCandidateBundleIdentifiers:(id)a3 candidateActiontypes:(id)a4 consumerSubType:(unsigned __int8)a5 reply:(id)a6
{
  uint64_t v6 = a5;
  id v10 = a6;
  xpcConnection = self->_xpcConnection;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __148___ATXInspectionClient_predictItemsAndReturnMetaDataAndInputsAndSubScoresWithCandidateBundleIdentifiers_candidateActiontypes_consumerSubType_reply___block_invoke;
  v16[3] = &unk_1E68AD5F0;
  id v17 = v10;
  id v12 = v10;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v16];
  [v15 predictItemsAndReturnMetaDataAndInputsAndSubScoresWithCandidateBundleIdentifiers:v14 candidateActiontypes:v13 consumerSubType:v6 reply:v12];
}

- (void)predictItemsAndReturnStageScoresWithCandidateBundleIdentifiers:(id)a3 candidateActiontypes:(id)a4 consumerSubType:(unsigned __int8)a5 reply:(id)a6
{
  uint64_t v6 = a5;
  id v10 = a6;
  xpcConnection = self->_xpcConnection;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __130___ATXInspectionClient_predictItemsAndReturnStageScoresWithCandidateBundleIdentifiers_candidateActiontypes_consumerSubType_reply___block_invoke;
  v16[3] = &unk_1E68AD5F0;
  id v17 = v10;
  id v12 = v10;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v16];
  [v15 predictItemsAndReturnStageScoresWithCandidateBundleIdentifiers:v14 candidateActiontypes:v13 consumerSubType:v6 reply:v12];
}

- (void)predictAppsAndReturnInputsAndSubscores:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63___ATXInspectionClient_predictAppsAndReturnInputsAndSubscores___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 predictAppsAndReturnInputsAndSubscores:v6];
}

- (void)getParseTreeForConsumerSubType:(unsigned __int8)a3 reply:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61___ATXInspectionClient_getParseTreeForConsumerSubType_reply___block_invoke;
  v10[3] = &unk_1E68AD5F0;
  id v11 = v6;
  id v8 = v6;
  id v9 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v10];
  [v9 getParseTreeForConsumerSubType:v4 reply:v8];
}

- (void)getPredictionModelDetailsForConsumerSubType:(unsigned __int8)a3 reply:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74___ATXInspectionClient_getPredictionModelDetailsForConsumerSubType_reply___block_invoke;
  v10[3] = &unk_1E68AD5F0;
  id v11 = v6;
  id v8 = v6;
  id v9 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v10];
  [v9 getPredictionModelDetailsForConsumerSubType:v4 reply:v8];
}

- (void)benchmarkAppPredictionForConsumerSubType:(unsigned __int8)a3 ntimes:(unint64_t)a4 reply:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a5;
  xpcConnection = self->_xpcConnection;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78___ATXInspectionClient_benchmarkAppPredictionForConsumerSubType_ntimes_reply___block_invoke;
  v12[3] = &unk_1E68AD5F0;
  id v13 = v8;
  id v10 = v8;
  id v11 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v12];
  [v11 benchmarkAppPredictionForConsumerSubType:v6 ntimes:a4 reply:v10];
}

- (void)benchmarkAppPrediction:(unint64_t)a3 reply:(id)a4
{
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53___ATXInspectionClient_benchmarkAppPrediction_reply___block_invoke;
  v10[3] = &unk_1E68AD5F0;
  id v11 = v6;
  id v8 = v6;
  id v9 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v10];
  [v9 benchmarkAppPrediction:a3 reply:v8];
}

- (void)createAppPredictionLogs:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48___ATXInspectionClient_createAppPredictionLogs___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 createAppPredictionLogs:v6];
}

- (void)getActionLogs:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38___ATXInspectionClient_getActionLogs___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 getActionLogs:v6];
}

- (void)getAppFeedbackData:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43___ATXInspectionClient_getAppFeedbackData___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 getAppFeedbackData:v6];
}

- (void)histogramsInMemory:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43___ATXInspectionClient_histogramsInMemory___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 histogramsInMemory:v6];
}

- (void)histogramsInMemoryBySize:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49___ATXInspectionClient_histogramsInMemoryBySize___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 histogramsInMemoryBySize:v6];
}

- (void)allHistogramsBySize:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44___ATXInspectionClient_allHistogramsBySize___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 allHistogramsBySize:v6];
}

- (void)retrainActionHistograms:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48___ATXInspectionClient_retrainActionHistograms___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 retrainActionHistograms:v6];
}

- (void)retrainActionSlotDatabase:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50___ATXInspectionClient_retrainActionSlotDatabase___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 retrainActionSlotDatabase:v6];
}

- (void)resetActionPredictions:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47___ATXInspectionClient_resetActionPredictions___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 resetActionPredictions:v6];
}

- (void)trainMagicalMomentsAppPredictor:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56___ATXInspectionClient_trainMagicalMomentsAppPredictor___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 trainMagicalMomentsAppPredictor:v6];
}

- (void)forceMagicalMomentsAppPredictionForBundleId:(id)a3 expert:(id)a4 reply:(id)a5
{
  id v8 = a5;
  xpcConnection = self->_xpcConnection;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81___ATXInspectionClient_forceMagicalMomentsAppPredictionForBundleId_expert_reply___block_invoke;
  v14[3] = &unk_1E68AD5F0;
  id v15 = v8;
  id v10 = v8;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v14];
  [v13 forceMagicalMomentsAppPredictionForBundleId:v12 expert:v11 reply:v10];
}

- (void)dumpPredictionTableForMMExpert:(id)a3 reply:(id)a4
{
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61___ATXInspectionClient_dumpPredictionTableForMMExpert_reply___block_invoke;
  v11[3] = &unk_1E68AD5F0;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v11];
  [v10 dumpPredictionTableForMMExpert:v9 reply:v8];
}

- (void)evaluateInfoSuggestionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69___ATXInspectionClient_evaluateInfoSuggestionsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 evaluateInfoSuggestionsWithCompletionHandler:v6];
}

- (void)getInfoSuggestionsInString:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51___ATXInspectionClient_getInfoSuggestionsInString___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 getInfoSuggestionsInString:v6];
}

- (void)fetchSuggestionsForSourceId:(id)a3 reply:(id)a4
{
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58___ATXInspectionClient_fetchSuggestionsForSourceId_reply___block_invoke;
  v11[3] = &unk_1E68AD5F0;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v11];
  [v10 fetchSuggestionsForSourceId:v9 reply:v8];
}

- (void)widgetBundleIdentifiersForAllInfoSuggestionsInString:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77___ATXInspectionClient_widgetBundleIdentifiersForAllInfoSuggestionsInString___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 widgetBundleIdentifiersForAllInfoSuggestionsInString:v6];
}

- (void)getInfoPredictionsInString:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51___ATXInspectionClient_getInfoPredictionsInString___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 getInfoPredictionsInString:v6];
}

- (void)rankAndReturnInfoPredictionsInString:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61___ATXInspectionClient_rankAndReturnInfoPredictionsInString___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 rankAndReturnInfoPredictionsInString:v6];
}

- (void)categoriesWithShouldUseDefault:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61___ATXInspectionClient_categoriesWithShouldUseDefault_reply___block_invoke;
  v10[3] = &unk_1E68AD5F0;
  id v11 = v6;
  id v8 = v6;
  id v9 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v10];
  [v9 categoriesWithShouldUseDefault:v4 reply:v8];
}

- (void)updateAppDirectoryCache:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48___ATXInspectionClient_updateAppDirectoryCache___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 updateAppDirectoryCache:v6];
}

- (void)getModeTimelineDataFromStartDate:(id)a3 reply:(id)a4
{
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63___ATXInspectionClient_getModeTimelineDataFromStartDate_reply___block_invoke;
  v11[3] = &unk_1E68AD5F0;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v11];
  [v10 getModeTimelineDataFromStartDate:v9 reply:v8];
}

- (void)lockScreenBundleIdsWithReply:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53___ATXInspectionClient_lockScreenBundleIdsWithReply___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 lockScreenBundleIdsWithReply:v6];
}

- (void)appLaunchInformationWithReply:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54___ATXInspectionClient_appLaunchInformationWithReply___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 appLaunchInformationWithReply:v6];
}

- (void)categoryLaunchInformationWithReply:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59___ATXInspectionClient_categoryLaunchInformationWithReply___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 categoryLaunchInformationWithReply:v6];
}

- (void)appLaunchDatesWithReply:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48___ATXInspectionClient_appLaunchDatesWithReply___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 appLaunchDatesWithReply:v6];
}

- (void)refreshBlendingLayer:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45___ATXInspectionClient_refreshBlendingLayer___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 refreshBlendingLayer:v6];
}

- (void)promoteSuggestionsFromClientModel:(id)a3 reply:(id)a4
{
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64___ATXInspectionClient_promoteSuggestionsFromClientModel_reply___block_invoke;
  v11[3] = &unk_1E68AD5F0;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v11];
  [v10 promoteSuggestionsFromClientModel:v9 reply:v8];
}

- (void)donateSuggestion:(id)a3 forClientModel:(int64_t)a4 withReply:(id)a5
{
  id v8 = a5;
  xpcConnection = self->_xpcConnection;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66___ATXInspectionClient_donateSuggestion_forClientModel_withReply___block_invoke;
  v13[3] = &unk_1E68AD5F0;
  id v14 = v8;
  id v10 = v8;
  id v11 = a3;
  id v12 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v13];
  [v12 donateSuggestion:v11 forClientModel:a4 withReply:v10];
}

- (void)clearBlendingSuggestionsForClientModel:(int64_t)a3 withReply:(id)a4
{
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73___ATXInspectionClient_clearBlendingSuggestionsForClientModel_withReply___block_invoke;
  v10[3] = &unk_1E68AD5F0;
  id v11 = v6;
  id v8 = v6;
  id v9 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v10];
  [v9 clearBlendingSuggestionsForClientModel:a3 withReply:v8];
}

- (void)blendedSuggestionsForConsumerSubType:(unsigned __int8)a3 reply:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67___ATXInspectionClient_blendedSuggestionsForConsumerSubType_reply___block_invoke;
  v10[3] = &unk_1E68AD5F0;
  id v11 = v6;
  id v8 = v6;
  id v9 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v10];
  [v9 blendedSuggestionsForConsumerSubType:v4 reply:v8];
}

- (void)buildAnchorModelTrainingDataset:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56___ATXInspectionClient_buildAnchorModelTrainingDataset___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 buildAnchorModelTrainingDataset:v6];
}

- (void)trainAnchorModel:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41___ATXInspectionClient_trainAnchorModel___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 trainAnchorModel:v6];
}

- (void)scheduledPredictionsForAnchorModelWithReply:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68___ATXInspectionClient_scheduledPredictionsForAnchorModelWithReply___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 scheduledPredictionsForAnchorModelWithReply:v6];
}

- (void)validPredictionsRightNowForAnchorModelWithReply:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72___ATXInspectionClient_validPredictionsRightNowForAnchorModelWithReply___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 validPredictionsRightNowForAnchorModelWithReply:v6];
}

- (void)schedulePredictionsForAnchorModel:(id)a3 anchorType:(id)a4 reply:(id)a5
{
  id v8 = a5;
  xpcConnection = self->_xpcConnection;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75___ATXInspectionClient_schedulePredictionsForAnchorModel_anchorType_reply___block_invoke;
  v14[3] = &unk_1E68AD5F0;
  id v15 = v8;
  id v10 = v8;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v14];
  [v13 schedulePredictionsForAnchorModel:v12 anchorType:v11 reply:v10];
}

- (void)processLockscreenFeedbackWithReply:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59___ATXInspectionClient_processLockscreenFeedbackWithReply___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 processLockscreenFeedbackWithReply:v6];
}

- (void)processHomeScreenFeedbackWithReply:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59___ATXInspectionClient_processHomeScreenFeedbackWithReply___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 processHomeScreenFeedbackWithReply:v6];
}

- (void)processSpotlightAppFeedbackWithReply:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61___ATXInspectionClient_processSpotlightAppFeedbackWithReply___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 processSpotlightAppFeedbackWithReply:v6];
}

- (void)processSpotlightActionFeedbackWithReply:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64___ATXInspectionClient_processSpotlightActionFeedbackWithReply___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 processSpotlightActionFeedbackWithReply:v6];
}

- (void)processAppDirectoryFeedbackWithReply:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61___ATXInspectionClient_processAppDirectoryFeedbackWithReply___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 processAppDirectoryFeedbackWithReply:v6];
}

- (void)performHomeScreenCoreAnalyticsDryRunWithCustomStartDate:(id)a3 reply:(id)a4
{
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86___ATXInspectionClient_performHomeScreenCoreAnalyticsDryRunWithCustomStartDate_reply___block_invoke;
  v11[3] = &unk_1E68AD5F0;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v11];
  [v10 performHomeScreenCoreAnalyticsDryRunWithCustomStartDate:v9 reply:v8];
}

- (void)nPlusOneStudyDryRunResultFilterByExtensionBundleId:(id)a3 reply:(id)a4
{
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81___ATXInspectionClient_nPlusOneStudyDryRunResultFilterByExtensionBundleId_reply___block_invoke;
  v11[3] = &unk_1E68AD5F0;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v11];
  [v10 nPlusOneStudyDryRunResultFilterByExtensionBundleId:v9 reply:v8];
}

- (void)trainModeEntityModelsWithDeferTrainingWhenApplicable:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83___ATXInspectionClient_trainModeEntityModelsWithDeferTrainingWhenApplicable_reply___block_invoke;
  v10[3] = &unk_1E68AD5F0;
  id v11 = v6;
  id v8 = v6;
  id v9 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v10];
  [v9 trainModeEntityModelsWithDeferTrainingWhenApplicable:v4 reply:v8];
}

- (void)trainModeSetupPredictionModelWithReply:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63___ATXInspectionClient_trainModeSetupPredictionModelWithReply___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 trainModeSetupPredictionModelWithReply:v6];
}

- (void)inspectInferredActivitySessionStream:(id)a3 fromTimestamp:(double)a4 reply:(id)a5
{
  id v8 = a5;
  xpcConnection = self->_xpcConnection;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81___ATXInspectionClient_inspectInferredActivitySessionStream_fromTimestamp_reply___block_invoke;
  v13[3] = &unk_1E68AD5F0;
  id v14 = v8;
  id v10 = v8;
  id v11 = a3;
  id v12 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v13];
  [v12 inspectInferredActivitySessionStream:v11 fromTimestamp:v10 reply:a4];
}

- (void)inspectInferredActivityTransitionStream:(id)a3 fromTimestamp:(double)a4 reply:(id)a5
{
  id v8 = a5;
  xpcConnection = self->_xpcConnection;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84___ATXInspectionClient_inspectInferredActivityTransitionStream_fromTimestamp_reply___block_invoke;
  v13[3] = &unk_1E68AD5F0;
  id v14 = v8;
  id v10 = v8;
  id v11 = a3;
  id v12 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v13];
  [v12 inspectInferredActivityTransitionStream:v11 fromTimestamp:v10 reply:a4];
}

- (void)forceNotificationAndSuggestionDbUpdate:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63___ATXInspectionClient_forceNotificationAndSuggestionDbUpdate___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 forceNotificationAndSuggestionDbUpdate:v6];
}

- (void)generateSerializedNotificationDigestFromFileData:(id)a3 digestTimeString:(id)a4 reply:(id)a5
{
  id v8 = a5;
  xpcConnection = self->_xpcConnection;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __96___ATXInspectionClient_generateSerializedNotificationDigestFromFileData_digestTimeString_reply___block_invoke;
  v14[3] = &unk_1E68AD5F0;
  id v15 = v8;
  id v10 = v8;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v14];
  [v13 generateSerializedNotificationDigestFromFileData:v12 digestTimeString:v11 reply:v10];
}

- (void)generateSerializedNotificationDigestFromSource:(id)a3 digestTimeString:(id)a4 startDate:(id)a5 endDate:(id)a6 inferMessages:(BOOL)a7 reply:(id)a8
{
  BOOL v8 = a7;
  id v14 = a8;
  xpcConnection = self->_xpcConnection;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __126___ATXInspectionClient_generateSerializedNotificationDigestFromSource_digestTimeString_startDate_endDate_inferMessages_reply___block_invoke;
  v22[3] = &unk_1E68AD5F0;
  id v23 = v14;
  id v16 = v14;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v21 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v22];
  [v21 generateSerializedNotificationDigestFromSource:v20 digestTimeString:v19 startDate:v18 endDate:v17 inferMessages:v8 reply:v16];
}

- (void)generateSerializedAppGroupedNotificationDigestFromSource:(id)a3 digestTimeString:(id)a4 startDate:(id)a5 endDate:(id)a6 inferMessages:(BOOL)a7 reply:(id)a8
{
  BOOL v8 = a7;
  id v14 = a8;
  xpcConnection = self->_xpcConnection;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __136___ATXInspectionClient_generateSerializedAppGroupedNotificationDigestFromSource_digestTimeString_startDate_endDate_inferMessages_reply___block_invoke;
  v22[3] = &unk_1E68AD5F0;
  id v23 = v14;
  id v16 = v14;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v21 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v22];
  [v21 generateSerializedAppGroupedNotificationDigestFromSource:v20 digestTimeString:v19 startDate:v18 endDate:v17 inferMessages:v8 reply:v16];
}

- (void)generateSerializedMissedNotificationBundleFromFileData:(id)a3 modeString:(id)a4 reply:(id)a5
{
  id v8 = a5;
  xpcConnection = self->_xpcConnection;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __96___ATXInspectionClient_generateSerializedMissedNotificationBundleFromFileData_modeString_reply___block_invoke;
  v14[3] = &unk_1E68AD5F0;
  id v15 = v8;
  id v10 = v8;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v14];
  [v13 generateSerializedMissedNotificationBundleFromFileData:v12 modeString:v11 reply:v10];
}

- (void)generateSerializedMissedNotificationBundleFromSource:(id)a3 modeString:(id)a4 startDate:(id)a5 endDate:(id)a6 inferMessages:(BOOL)a7 reply:(id)a8
{
  BOOL v8 = a7;
  id v14 = a8;
  xpcConnection = self->_xpcConnection;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __126___ATXInspectionClient_generateSerializedMissedNotificationBundleFromSource_modeString_startDate_endDate_inferMessages_reply___block_invoke;
  v22[3] = &unk_1E68AD5F0;
  id v23 = v14;
  id v16 = v14;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v21 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v22];
  [v21 generateSerializedMissedNotificationBundleFromSource:v20 modeString:v19 startDate:v18 endDate:v17 inferMessages:v8 reply:v16];
}

- (void)dumpNotificationJSONFromSource:(id)a3 startDate:(id)a4 endDate:(id)a5 inferMessages:(BOOL)a6 reply:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  xpcConnection = self->_xpcConnection;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __93___ATXInspectionClient_dumpNotificationJSONFromSource_startDate_endDate_inferMessages_reply___block_invoke;
  v19[3] = &unk_1E68AD5F0;
  id v20 = v12;
  id v14 = v12;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v19];
  [v18 dumpNotificationJSONFromSource:v17 startDate:v16 endDate:v15 inferMessages:v7 reply:v14];
}

- (void)clearNotificationsWithReply:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52___ATXInspectionClient_clearNotificationsWithReply___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  BOOL v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 clearNotificationsWithReply:v6];
}

- (void)showDigestFeedbackHistogramForBundleId:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73___ATXInspectionClient_showDigestFeedbackHistogramForBundleId_withReply___block_invoke;
  v11[3] = &unk_1E68AD5F0;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v11];
  [v10 showDigestFeedbackHistogramForBundleId:v9 withReply:v8];
}

- (void)addToDigestFeedbackHistogramForBundleId:(id)a3 location:(id)a4 feedback:(id)a5 withReply:(id)a6
{
  id v10 = a6;
  xpcConnection = self->_xpcConnection;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __92___ATXInspectionClient_addToDigestFeedbackHistogramForBundleId_location_feedback_withReply___block_invoke;
  v17[3] = &unk_1E68AD5F0;
  id v18 = v10;
  id v12 = v10;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v17];
  [v16 addToDigestFeedbackHistogramForBundleId:v15 location:v14 feedback:v13 withReply:v12];
}

- (void)setDigestFeedbackHistogramValueForBundleId:(id)a3 location:(id)a4 feedback:(id)a5 value:(id)a6 withReply:(id)a7
{
  id v12 = a7;
  xpcConnection = self->_xpcConnection;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __101___ATXInspectionClient_setDigestFeedbackHistogramValueForBundleId_location_feedback_value_withReply___block_invoke;
  v20[3] = &unk_1E68AD5F0;
  id v21 = v12;
  id v14 = v12;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v20];
  [v19 setDigestFeedbackHistogramValueForBundleId:v18 location:v17 feedback:v16 value:v15 withReply:v14];
}

- (void)clearDigestFeedbackHistogramWithShouldResetBookmarks:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83___ATXInspectionClient_clearDigestFeedbackHistogramWithShouldResetBookmarks_reply___block_invoke;
  v10[3] = &unk_1E68AD5F0;
  id v11 = v6;
  id v8 = v6;
  id v9 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v10];
  [v9 clearDigestFeedbackHistogramWithShouldResetBookmarks:v4 reply:v8];
}

- (void)getCurrentLocationWithReply:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52___ATXInspectionClient_getCurrentLocationWithReply___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  BOOL v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 getCurrentLocationWithReply:v6];
}

- (void)generateDataForStressTestWithReply:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59___ATXInspectionClient_generateDataForStressTestWithReply___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  BOOL v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 generateDataForStressTestWithReply:v6];
}

- (void)clearAllDataForStressTestWithReply:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59___ATXInspectionClient_clearAllDataForStressTestWithReply___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  BOOL v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 clearAllDataForStressTestWithReply:v6];
}

- (void)fetchPosterDescriptorsWithReply:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56___ATXInspectionClient_fetchPosterDescriptorsWithReply___block_invoke;
  v8[3] = &unk_1E68AD5F0;
  id v9 = v4;
  id v6 = v4;
  BOOL v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 fetchPosterDescriptorsWithReply:v6];
}

- (void)logNotificationMetricsFromStartTimestamp:(id)a3 toEndTimestamp:(id)a4 withCompletion:(id)a5
{
  id v8 = a5;
  xpcConnection = self->_xpcConnection;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __95___ATXInspectionClient_logNotificationMetricsFromStartTimestamp_toEndTimestamp_withCompletion___block_invoke;
  v14[3] = &unk_1E68AD5F0;
  id v15 = v8;
  id v10 = v8;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v14];
  [v13 logNotificationMetricsFromStartTimestamp:v12 toEndTimestamp:v11 withCompletion:v10];
}

- (void).cxx_destruct
{
}

@end