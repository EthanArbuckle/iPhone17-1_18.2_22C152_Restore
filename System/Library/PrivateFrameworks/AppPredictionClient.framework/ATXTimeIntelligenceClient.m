@interface ATXTimeIntelligenceClient
- (ATXTimeIntelligenceClient)init;
- (NSXPCConnection)xpcConnection;
- (void)_notifyObserversOfReload;
- (void)computeCompactTimeSummaryWithOptions:(int64_t)a3 completionHandler:(id)a4;
- (void)computeDailySummaryWithDate:(id)a3 completionHandler:(id)a4;
- (void)dataSourcesDidUpdateWithCompletionHandler:(id)a3;
- (void)deletePinnedTimeEvent:(id)a3 completionHandler:(id)a4;
- (void)dumpTimeFeedbackStream:(id)a3;
- (void)invokeActionWithIdentifier:(id)a3 forEvent:(id)a4 completionHandler:(id)a5;
- (void)invokeFeedbackOption:(id)a3 forEvent:(id)a4 referenceDate:(id)a5 completionHandler:(id)a6;
- (void)loadPinnedTimeEventsWithCompletionHandler:(id)a3;
- (void)logDidInvokeWidgetForEvent:(id)a3 completionHandler:(id)a4;
- (void)logFocusFilterDidChange:(int64_t)a3 completionHandler:(id)a4;
- (void)predictedDailyOverviewWithDate:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)predictedFreeMomentsWithDateRange:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)predictedTimelineWithDate:(id)a3 completionHandler:(id)a4;
- (void)printRLPolicyTable:(id)a3;
- (void)registerGoalWithData:(id)a3 completionHandler:(id)a4;
- (void)registerObserver:(id)a3;
- (void)rescheduleEvent:(id)a3 proposedDate:(id)a4 referenceDate:(id)a5 completionHandler:(id)a6;
- (void)savePinnedTimeEvent:(id)a3 completionHandler:(id)a4;
- (void)saveScheduledPinnedTimeEvent:(id)a3 completionHandler:(id)a4;
- (void)setXpcConnection:(id)a3;
- (void)triggerNudgerToPollWithCompletionHandler:(id)a3;
- (void)unhideAllEventsFromSource:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation ATXTimeIntelligenceClient

- (ATXTimeIntelligenceClient)init
{
  v12.receiver = self;
  v12.super_class = (Class)ATXTimeIntelligenceClient;
  v2 = [(ATXTimeIntelligenceClient *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.proactive.timeIntelligence" options:0];
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    [(NSXPCConnection *)v2->_xpcConnection setExportedObject:v2];
    v5 = v2->_xpcConnection;
    v6 = ATXTimeIntelligenceClientInterface();
    [(NSXPCConnection *)v5 setExportedInterface:v6];

    v7 = v2->_xpcConnection;
    v8 = ATXTimeIntelligenceInterface();
    [(NSXPCConnection *)v7 setRemoteObjectInterface:v8];

    [(NSXPCConnection *)v2->_xpcConnection setInterruptionHandler:&__block_literal_global_54];
    [(NSXPCConnection *)v2->_xpcConnection setInvalidationHandler:&__block_literal_global_4_3];
    [(NSXPCConnection *)v2->_xpcConnection resume];
    uint64_t v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v9;
  }
  return v2;
}

void __33__ATXTimeIntelligenceClient_init__block_invoke()
{
  v0 = __atxlog_handle_time_intelligence();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __33__ATXTimeIntelligenceClient_init__block_invoke_cold_1(v0);
  }
}

void __33__ATXTimeIntelligenceClient_init__block_invoke_2()
{
  v0 = __atxlog_handle_time_intelligence();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A790D000, v0, OS_LOG_TYPE_INFO, "ATXTimeIntelligenceClient: invalidation handler called", v1, 2u);
  }
}

- (void)dataSourcesDidUpdateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__ATXTimeIntelligenceClient_dataSourcesDidUpdateWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5D053E8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __71__ATXTimeIntelligenceClient_dataSourcesDidUpdateWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _notifyObserversOfReload];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)_notifyObserversOfReload
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self->_observers;
  objc_sync_enter(v3);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_observers;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "timeIntelligenceClientDidRefresh", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v3);
}

- (void)registerObserver:(id)a3
{
  id v5 = a3;
  id v4 = self->_observers;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_observers addObject:v5];
  objc_sync_exit(v4);
}

- (void)predictedTimelineWithDate:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v8 = [(ATXTimeIntelligenceClient *)self xpcConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__ATXTimeIntelligenceClient_predictedTimelineWithDate_completionHandler___block_invoke;
  v11[3] = &unk_1E5D04F50;
  id v12 = v6;
  id v9 = v6;
  long long v10 = [v8 remoteObjectProxyWithErrorHandler:v11];
  [v10 predictedTimelineWithDate:v7 completionHandler:v9];
}

void __73__ATXTimeIntelligenceClient_predictedTimelineWithDate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_time_intelligence();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__ATXTimeIntelligenceClient_predictedTimelineWithDate_completionHandler___block_invoke_cold_1(v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)predictedDailyOverviewWithDate:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  long long v11 = [(ATXTimeIntelligenceClient *)self xpcConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__ATXTimeIntelligenceClient_predictedDailyOverviewWithDate_options_completionHandler___block_invoke;
  v14[3] = &unk_1E5D04F50;
  id v15 = v8;
  id v12 = v8;
  uint64_t v13 = [v11 remoteObjectProxyWithErrorHandler:v14];
  [v13 predictedDailyOverviewWithDate:v10 options:v9 completionHandler:v12];
}

void __86__ATXTimeIntelligenceClient_predictedDailyOverviewWithDate_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_time_intelligence();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__ATXTimeIntelligenceClient_predictedTimelineWithDate_completionHandler___block_invoke_cold_1(v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)predictedFreeMomentsWithDateRange:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  long long v11 = [(ATXTimeIntelligenceClient *)self xpcConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__ATXTimeIntelligenceClient_predictedFreeMomentsWithDateRange_options_completionHandler___block_invoke;
  v14[3] = &unk_1E5D04F50;
  id v15 = v8;
  id v12 = v8;
  uint64_t v13 = [v11 remoteObjectProxyWithErrorHandler:v14];
  [v13 predictedFreeMomentsWithDateRange:v10 options:v9 completionHandler:v12];
}

void __89__ATXTimeIntelligenceClient_predictedFreeMomentsWithDateRange_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_time_intelligence();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __89__ATXTimeIntelligenceClient_predictedFreeMomentsWithDateRange_options_completionHandler___block_invoke_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)computeDailySummaryWithDate:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ATXTimeIntelligenceClient *)self xpcConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__ATXTimeIntelligenceClient_computeDailySummaryWithDate_completionHandler___block_invoke;
  v11[3] = &unk_1E5D04F50;
  id v12 = v6;
  id v9 = v6;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v11];
  [v10 computeDailySummaryWithDate:v7 completionHandler:v9];
}

uint64_t __75__ATXTimeIntelligenceClient_computeDailySummaryWithDate_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)computeCompactTimeSummaryWithOptions:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(ATXTimeIntelligenceClient *)self xpcConnection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__ATXTimeIntelligenceClient_computeCompactTimeSummaryWithOptions_completionHandler___block_invoke;
  v10[3] = &unk_1E5D04F50;
  id v11 = v6;
  id v8 = v6;
  id v9 = [v7 remoteObjectProxyWithErrorHandler:v10];
  [v9 computeCompactTimeSummaryWithOptions:a3 completionHandler:v8];
}

uint64_t __84__ATXTimeIntelligenceClient_computeCompactTimeSummaryWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invokeActionWithIdentifier:(id)a3 forEvent:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(ATXTimeIntelligenceClient *)self xpcConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__ATXTimeIntelligenceClient_invokeActionWithIdentifier_forEvent_completionHandler___block_invoke;
  v14[3] = &unk_1E5D04F50;
  id v15 = v8;
  id v12 = v8;
  uint64_t v13 = [v11 remoteObjectProxyWithErrorHandler:v14];
  [v13 invokeActionWithIdentifier:v10 forEvent:v9 completionHandler:v12];
}

uint64_t __83__ATXTimeIntelligenceClient_invokeActionWithIdentifier_forEvent_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invokeFeedbackOption:(id)a3 forEvent:(id)a4 referenceDate:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [(ATXTimeIntelligenceClient *)self xpcConnection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __91__ATXTimeIntelligenceClient_invokeFeedbackOption_forEvent_referenceDate_completionHandler___block_invoke;
  v17[3] = &unk_1E5D04F50;
  id v18 = v10;
  id v15 = v10;
  v16 = [v14 remoteObjectProxyWithErrorHandler:v17];
  [v16 invokeFeedbackOption:v13 forEvent:v12 referenceDate:v11 completionHandler:v15];
}

uint64_t __91__ATXTimeIntelligenceClient_invokeFeedbackOption_forEvent_referenceDate_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rescheduleEvent:(id)a3 proposedDate:(id)a4 referenceDate:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [(ATXTimeIntelligenceClient *)self xpcConnection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __90__ATXTimeIntelligenceClient_rescheduleEvent_proposedDate_referenceDate_completionHandler___block_invoke;
  v17[3] = &unk_1E5D04F50;
  id v18 = v10;
  id v15 = v10;
  v16 = [v14 remoteObjectProxyWithErrorHandler:v17];
  [v16 rescheduleEvent:v13 proposedDate:v12 referenceDate:v11 completionHandler:v15];
}

uint64_t __90__ATXTimeIntelligenceClient_rescheduleEvent_proposedDate_referenceDate_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadPinnedTimeEventsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXTimeIntelligenceClient *)self xpcConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__ATXTimeIntelligenceClient_loadPinnedTimeEventsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5D04F50;
  id v9 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v8];
  [v7 loadPinnedTimeEventsWithCompletionHandler:v6];
}

uint64_t __71__ATXTimeIntelligenceClient_loadPinnedTimeEventsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)savePinnedTimeEvent:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ATXTimeIntelligenceClient *)self xpcConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__ATXTimeIntelligenceClient_savePinnedTimeEvent_completionHandler___block_invoke;
  v11[3] = &unk_1E5D04F50;
  id v12 = v6;
  id v9 = v6;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v11];
  [v10 savePinnedTimeEvent:v7 completionHandler:v9];
}

uint64_t __67__ATXTimeIntelligenceClient_savePinnedTimeEvent_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deletePinnedTimeEvent:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ATXTimeIntelligenceClient *)self xpcConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__ATXTimeIntelligenceClient_deletePinnedTimeEvent_completionHandler___block_invoke;
  v11[3] = &unk_1E5D04F50;
  id v12 = v6;
  id v9 = v6;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v11];
  [v10 deletePinnedTimeEvent:v7 completionHandler:v9];
}

uint64_t __69__ATXTimeIntelligenceClient_deletePinnedTimeEvent_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveScheduledPinnedTimeEvent:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ATXTimeIntelligenceClient *)self xpcConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__ATXTimeIntelligenceClient_saveScheduledPinnedTimeEvent_completionHandler___block_invoke;
  v11[3] = &unk_1E5D04F50;
  id v12 = v6;
  id v9 = v6;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v11];
  [v10 saveScheduledPinnedTimeEvent:v7 completionHandler:v9];
}

uint64_t __76__ATXTimeIntelligenceClient_saveScheduledPinnedTimeEvent_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)logFocusFilterDidChange:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(ATXTimeIntelligenceClient *)self xpcConnection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__ATXTimeIntelligenceClient_logFocusFilterDidChange_completionHandler___block_invoke;
  v10[3] = &unk_1E5D04F50;
  id v11 = v6;
  id v8 = v6;
  id v9 = [v7 remoteObjectProxyWithErrorHandler:v10];
  [v9 logFocusFilterDidChange:a3 completionHandler:v8];
}

uint64_t __71__ATXTimeIntelligenceClient_logFocusFilterDidChange_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)logDidInvokeWidgetForEvent:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ATXTimeIntelligenceClient *)self xpcConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__ATXTimeIntelligenceClient_logDidInvokeWidgetForEvent_completionHandler___block_invoke;
  v11[3] = &unk_1E5D04F50;
  id v12 = v6;
  id v9 = v6;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v11];
  [v10 logDidInvokeWidgetForEvent:v7 completionHandler:v9];
}

uint64_t __74__ATXTimeIntelligenceClient_logDidInvokeWidgetForEvent_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)triggerNudgerToPollWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXTimeIntelligenceClient *)self xpcConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__ATXTimeIntelligenceClient_triggerNudgerToPollWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5D04F50;
  id v9 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v8];
  [v7 triggerNudgerToPollWithCompletionHandler:v6];
}

uint64_t __70__ATXTimeIntelligenceClient_triggerNudgerToPollWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dumpTimeFeedbackStream:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXTimeIntelligenceClient *)self xpcConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__ATXTimeIntelligenceClient_dumpTimeFeedbackStream___block_invoke;
  v8[3] = &unk_1E5D04F50;
  id v9 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v8];
  [v7 dumpTimeFeedbackStream:v6];
}

uint64_t __52__ATXTimeIntelligenceClient_dumpTimeFeedbackStream___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unhideAllEventsFromSource:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(ATXTimeIntelligenceClient *)self xpcConnection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__ATXTimeIntelligenceClient_unhideAllEventsFromSource_completionHandler___block_invoke;
  v10[3] = &unk_1E5D04F50;
  id v11 = v6;
  id v8 = v6;
  id v9 = [v7 remoteObjectProxyWithErrorHandler:v10];
  [v9 unhideAllEventsFromSource:a3 completionHandler:v8];
}

uint64_t __73__ATXTimeIntelligenceClient_unhideAllEventsFromSource_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerGoalWithData:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ATXTimeIntelligenceClient *)self xpcConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__ATXTimeIntelligenceClient_registerGoalWithData_completionHandler___block_invoke;
  v11[3] = &unk_1E5D04F50;
  id v12 = v6;
  id v9 = v6;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v11];
  [v10 registerGoalWithData:v7 completionHandler:v9];
}

uint64_t __68__ATXTimeIntelligenceClient_registerGoalWithData_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)printRLPolicyTable:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXTimeIntelligenceClient *)self xpcConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__ATXTimeIntelligenceClient_printRLPolicyTable___block_invoke;
  v8[3] = &unk_1E5D04F50;
  id v9 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v8];
  [v7 printRLPolicyTable:v6];
}

uint64_t __48__ATXTimeIntelligenceClient_printRLPolicyTable___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

void __33__ATXTimeIntelligenceClient_init__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "ATXTimeIntelligenceClient: interruption handler called", v1, 2u);
}

void __73__ATXTimeIntelligenceClient_predictedTimelineWithDate_completionHandler___block_invoke_cold_1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0_4(&dword_1A790D000, v2, v3, "ATXTimeIntelligenceClient: XPC failed: %@", v4, v5, v6, v7, 2u);
}

void __89__ATXTimeIntelligenceClient_predictedFreeMomentsWithDateRange_options_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "ATXTimeIntelligenceClient: Could not fetch free moments: %@", (uint8_t *)&v2, 0xCu);
}

@end