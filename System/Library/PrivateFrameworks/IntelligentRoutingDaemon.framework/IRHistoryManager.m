@interface IRHistoryManager
- (IRHistoryEventsContainerDO)historyEventsContainer;
- (IRHistoryManager)initWithStore:(id)a3 miloFeedback:(id)a4;
- (IRMiLoFeedbackProvider)miloFeedback;
- (IRServiceStore)store;
- (NSString)lastMiLoLabel;
- (id)_labelMiLoIfNeeded:(id)a3 lastMiLoLabel:(id)a4 shouldLabelEventWithMilo:(BOOL)a5;
- (void)addEvent:(id)a3 forCandidateIdentifier:(id)a4 withSystemState:(id)a5 andMiloPrediction:(id)a6;
- (void)setHistoryEventsContainer:(id)a3;
- (void)setLastMiLoLabel:(id)a3;
- (void)setMiloFeedback:(id)a3;
- (void)setStore:(id)a3;
- (void)synchronizeAndFetchFromDBOnDisk;
@end

@implementation IRHistoryManager

- (IRHistoryEventsContainerDO)historyEventsContainer
{
  return self->_historyEventsContainer;
}

- (IRHistoryManager)initWithStore:(id)a3 miloFeedback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IRHistoryManager;
  v8 = [(IRHistoryManager *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(IRHistoryManager *)v8 setStore:v6];
    [(IRHistoryManager *)v9 setMiloFeedback:v7];
    [(IRHistoryManager *)v9 synchronizeAndFetchFromDBOnDisk];
  }

  return v9;
}

- (void)addEvent:(id)a3 forCandidateIdentifier:(id)a4 withSystemState:(id)a5 andMiloPrediction:(id)a6
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  LODWORD(a6) = [v10 isUserIntentionEvent];
  uint64_t v14 = a6 & ~[v12 isContinuityDisplay];
  v15 = [(IRHistoryManager *)self lastMiLoLabel];
  v16 = [(IRHistoryManager *)self _labelMiLoIfNeeded:v13 lastMiLoLabel:v15 shouldLabelEventWithMilo:v14];
  [(IRHistoryManager *)self setLastMiLoLabel:v16];

  v54 = v13;
  if (v14 == 1 && [v13 canLabel])
  {
    v17 = [v13 predictionId];
    v18 = [v13 predictionId];
    v57 = +[IRMiLoPredictionEventDO miLoPredictionEventDOWithLabel:v17 predictionId:v18];
  }
  else
  {
    v57 = +[IRMiLoPredictionEventDO miLoPredictionEventDOWithLabel:0 predictionId:0];
  }
  v19 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  v20 = (void *)*MEMORY[0x263F50098];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50098], OS_LOG_TYPE_DEFAULT))
  {
    v21 = v20;
    [v10 name];
    v22 = id v55 = v12;
    v23 = [MEMORY[0x263F500D8] eventTypeStringEventDO:v10];
    v24 = [MEMORY[0x263F500D8] eventSubTypeStringEventDO:v10];
    v25 = [v57 label];
    v26 = [NSNumber numberWithBool:v14];
    *(_DWORD *)buf = 136316930;
    v59 = "#history-manager, ";
    __int16 v60 = 2112;
    v61 = v19;
    __int16 v62 = 2112;
    v63 = v22;
    __int16 v64 = 2112;
    v65 = v23;
    __int16 v66 = 2112;
    v67 = v24;
    __int16 v68 = 2112;
    id v69 = v11;
    __int16 v70 = 2112;
    v71 = v25;
    __int16 v72 = 2112;
    v73 = v26;
    _os_log_impl(&dword_25418E000, v21, OS_LOG_TYPE_DEFAULT, "%s[%@], Adding event (%@) type:%@, subtype:%@ to candidate:%@, miloLabel:%@, shouldLabelEventWithMilo:%@", buf, 0x52u);

    id v12 = v55;
  }

  v27 = [MEMORY[0x263EFF910] now];
  v28 = [v10 bundleID];
  v29 = IRAVInitialRouteSharingPolicyForBundleIdentifier(v28);
  v56 = v11;
  v30 = +[IRHistoryEventDO historyEventDOWithDate:v27 candidateIdentifier:v11 event:v10 miloPredictionEvent:v57 systemState:v12 sharingPolicy:v29];

  v31 = (void *)MEMORY[0x263EFF980];
  v32 = [(IRHistoryManager *)self historyEventsContainer];
  v33 = [v32 historyEvents];
  v34 = [v31 arrayWithArray:v33];

  [v34 addObject:v30];
  unint64_t v35 = [v34 count];
  v36 = +[IRPreferences shared];
  v37 = [v36 numberOfHistoryEventsInCache];
  unsigned int v38 = [v37 unsignedIntValue];

  if (v35 > v38) {
    [v34 removeObjectAtIndex:0];
  }
  v39 = [[IRHistoryEventsContainerDO alloc] initWithHistoryEvents:v34];
  [(IRHistoryManager *)self setHistoryEventsContainer:v39];

  v40 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  v41 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEBUG))
  {
    v42 = NSNumber;
    v43 = v41;
    v44 = [(IRHistoryManager *)self historyEventsContainer];
    [v44 historyEvents];
    v46 = id v45 = v12;
    v47 = objc_msgSend(v42, "numberWithUnsignedInteger:", objc_msgSend(v46, "count"));
    *(_DWORD *)buf = 136315650;
    v59 = "#history-manager, ";
    __int16 v60 = 2112;
    v61 = v40;
    __int16 v62 = 2112;
    v63 = v47;
    _os_log_impl(&dword_25418E000, v43, OS_LOG_TYPE_DEBUG, "%s[%@], Memory: Number of History events: %@", buf, 0x20u);

    id v12 = v45;
  }

  v48 = [(IRHistoryManager *)self store];
  v49 = +[IRPreferences shared];
  v50 = [v49 numberOfEventsToSaveInDisk];
  char v51 = objc_msgSend(v48, "addHistoryEvent:withLimit:", v30, objc_msgSend(v50, "unsignedIntegerValue"));

  if ((v51 & 1) == 0)
  {
    v52 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    v53 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v59 = "#history-manager, ";
      __int16 v60 = 2112;
      v61 = v52;
      _os_log_impl(&dword_25418E000, v53, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - History manager save event error] Could not save new history event", buf, 0x16u);
    }
  }
}

- (id)_labelMiLoIfNeeded:(id)a3 lastMiLoLabel:(id)a4 shouldLabelEventWithMilo:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(IRHistoryManager *)self miloFeedback];
  id v11 = v9;
  id v12 = v11;
  if (v5)
  {
    id v12 = v11;
    if ([v8 canLabel])
    {
      uint64_t v13 = [v8 predictionId];
      id v12 = v11;
      if (v13)
      {
        uint64_t v14 = (void *)v13;
        v15 = [v8 predictionId];
        char v16 = [v15 isEqual:v11];

        id v12 = v11;
        if ((v16 & 1) == 0)
        {
          id v12 = [v8 predictionId];

          v17 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v12];
          [v10 labelPredictionUuid:v17 withEventUuid:v17];
        }
      }
    }
  }

  return v12;
}

- (void)synchronizeAndFetchFromDBOnDisk
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [(IRHistoryManager *)self store];
  v4 = +[IRPreferences shared];
  BOOL v5 = [v4 numberOfHistoryEventsInCache];
  id v6 = objc_msgSend(v3, "fetchHistoryEventsContainerWithLimit:", objc_msgSend(v5, "unsignedIntegerValue"));
  [(IRHistoryManager *)self setHistoryEventsContainer:v6];

  id v7 = [(IRHistoryManager *)self historyEventsContainer];

  id v8 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  id v9 = *MEMORY[0x263F50090];
  id v10 = *MEMORY[0x263F50090];
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = NSNumber;
      id v12 = v9;
      uint64_t v13 = [(IRHistoryManager *)self historyEventsContainer];
      uint64_t v14 = [v13 historyEvents];
      v15 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
      int v16 = 136315650;
      v17 = "#history-manager, ";
      __int16 v18 = 2112;
      v19 = v8;
      __int16 v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_25418E000, v12, OS_LOG_TYPE_DEFAULT, "%s[%@], Loading history Events container from store with %@ events", (uint8_t *)&v16, 0x20u);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v16 = 136315394;
    v17 = "#history-manager, ";
    __int16 v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_25418E000, v9, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - History manager fetch events error] Could not fetch history events container", (uint8_t *)&v16, 0x16u);
  }
}

- (IRMiLoFeedbackProvider)miloFeedback
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_miloFeedback);

  return (IRMiLoFeedbackProvider *)WeakRetained;
}

- (void)setMiloFeedback:(id)a3
{
}

- (void)setHistoryEventsContainer:(id)a3
{
}

- (IRServiceStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (NSString)lastMiLoLabel
{
  return self->_lastMiLoLabel;
}

- (void)setLastMiLoLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastMiLoLabel, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_historyEventsContainer, 0);

  objc_destroyWeak((id *)&self->_miloFeedback);
}

@end