@interface IRCandidateManager
- (IRAVOutputDeviceProvider)avOutputDeviceProvider;
- (IRCandidateManager)initWithQueue:(id)a3 contextObserver:(id)a4 avOutputDeviceProvider:(id)a5 rapportDeviceProvider:(id)a6 store:(id)a7;
- (IRCandidatesContainerDO)candidatesContainer;
- (IRPolicyManagerContextObserver)contextObserver;
- (IRRapportProvider)rapportDeviceProvider;
- (IRServiceStore)store;
- (NSSet)avodDevices;
- (NSSet)rapportDevices;
- (OS_dispatch_queue)queue;
- (id)_lastUsedDateForCandidate:(id)a3 fromHistoryEventsContainer:(id)a4;
- (id)_nodesForCandidate:(id)a3 fromExistingCandidate:(id)a4;
- (id)_oldestCandidatesFrom:(id)a3 forKey:(id)a4 limit:(unint64_t)a5;
- (void)_addCandidates:(id)a3;
- (void)_deleteCandidates:(id)a3;
- (void)_didUpdateContextWithReason:(id)a3;
- (void)_handleCandidatesCleanup;
- (void)_updateCandidate:(id)a3;
- (void)dealloc;
- (void)deallocSync;
- (void)deleteBrokerCandidates;
- (void)deleteCandidate:(id)a3;
- (void)notifyAddEventForCandidateIdentifier:(id)a3;
- (void)provider:(id)a3 didUpdateAVOutputDevices:(id)a4;
- (void)provider:(id)a3 didUpdateRapportDevices:(id)a4;
- (void)setAvOutputDeviceProvider:(id)a3;
- (void)setAvodDevices:(id)a3;
- (void)setCandidatesContainer:(id)a3;
- (void)setContextObserver:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRapportDeviceProvider:(id)a3;
- (void)setRapportDevices:(id)a3;
- (void)setStore:(id)a3;
- (void)synchronizeAndFetchFromDBOnDisk;
- (void)updateCandidates:(id)a3 withHistoryEventsContainer:(id)a4;
@end

@implementation IRCandidateManager

- (IRCandidatesContainerDO)candidatesContainer
{
  return self->_candidatesContainer;
}

- (IRCandidateManager)initWithQueue:(id)a3 contextObserver:(id)a4 avOutputDeviceProvider:(id)a5 rapportDeviceProvider:(id)a6 store:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)IRCandidateManager;
  v17 = [(IRCandidateManager *)&v22 init];
  v18 = v17;
  if (v17)
  {
    [(IRCandidateManager *)v17 setQueue:v12];
    [(IRCandidateManager *)v18 setContextObserver:v13];
    [(IRCandidateManager *)v18 setAvOutputDeviceProvider:v14];
    [(IRCandidateManager *)v18 setRapportDeviceProvider:v15];
    [(IRCandidateManager *)v18 setStore:v16];
    [(IRCandidateManager *)v18 synchronizeAndFetchFromDBOnDisk];
    v19 = [(IRCandidateManager *)v18 avOutputDeviceProvider];
    [v19 addObserver:v18];

    v20 = [(IRCandidateManager *)v18 rapportDeviceProvider];
    [v20 addObserver:v18];
  }
  return v18;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)IRCandidateManager;
  [(IRCandidateManager *)&v2 dealloc];
}

- (void)deallocSync
{
  v3 = [(IRCandidateManager *)self avOutputDeviceProvider];
  [v3 removeObserver:self];

  id v4 = [(IRCandidateManager *)self rapportDeviceProvider];
  [v4 removeObserver:self];
}

- (void)updateCandidates:(id)a3 withHistoryEventsContainer:(id)a4
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v55 = a4;
  v7 = [MEMORY[0x263EFF9C0] set];
  v58 = [MEMORY[0x263EFF9C0] set];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v8 = v6;
  uint64_t v61 = [v8 countByEnumeratingWithState:&v62 objects:v74 count:16];
  if (v61)
  {
    v56 = v7;
    char v57 = 0;
    uint64_t v10 = *(void *)v63;
    v11 = (const void **)MEMORY[0x263F50120];
    *(void *)&long long v9 = 136315906;
    long long v54 = v9;
    id v12 = v8;
    uint64_t v60 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v61; ++i)
      {
        if (*(void *)v63 != v10) {
          objc_enumerationMutation(v12);
        }
        id v14 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        id v15 = [(IRCandidateManager *)self candidatesContainer];
        id v16 = [v14 candidateIdentifier];
        v17 = [v15 candidateForCandidateIdentifier:v16];

        v18 = [(IRCandidateManager *)self _nodesForCandidate:v14 fromExistingCandidate:v17];
        v19 = (void *)[v14 copyWithReplacementNodes:v18];

        v20 = [v17 lastUsedDate];
        uint64_t v21 = [v19 copyWithReplacementLastUsedDate:v20];

        objc_super v22 = [v17 firstSeenDate];
        v23 = (void *)[(id)v21 copyWithReplacementFirstSeenDate:v22];

        LOBYTE(v21) = [v23 containsAirPlayOrUnknownAVODTarget];
        v24 = dispatch_get_specific(*v11);
        if (v21)
        {
          v25 = (void *)*MEMORY[0x263F500A0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F500A0], OS_LOG_TYPE_DEFAULT))
          {
            v26 = v25;
            v27 = +[IRLogQEUtility getCandidateAsString:v23];
            *(_DWORD *)buf = 136315650;
            v67 = "#candidate-manager, ";
            __int16 v68 = 2112;
            v69 = v24;
            __int16 v70 = 2112;
            v71 = v27;
            _os_log_impl(&dword_25418E000, v26, OS_LOG_TYPE_DEFAULT, "%s[%@], Updating candidate:\n %@", buf, 0x20u);
          }
          if (![v17 isEqual:v23]) {
            goto LABEL_17;
          }
          v59 = [v23 lastSeenDate];
          v28 = [v17 lastSeenDate];
          v29 = +[IRPreferences shared];
          v30 = [v29 candidateUpdateTimeIntervalSeconds];
          objc_msgSend(v28, "dateByAddingTimeInterval:", (double)(unint64_t)objc_msgSend(v30, "unsignedIntegerValue"));
          v31 = self;
          v33 = v32 = v12;
          int v34 = [v59 isEarlierThan:v33];

          id v12 = v32;
          self = v31;

          v11 = (const void **)MEMORY[0x263F50120];
          if (v34)
          {
            v35 = dispatch_get_specific(*v11);
            v36 = (void *)*MEMORY[0x263F50090];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEBUG))
            {
              v37 = v36;
              v38 = [v17 lastSeenDate];
              v39 = [v23 lastSeenDate];
              *(_DWORD *)buf = v54;
              v67 = "#candidate-manager, ";
              __int16 v68 = 2112;
              v69 = v35;
              __int16 v70 = 2112;
              v71 = v38;
              __int16 v72 = 2112;
              v73 = v39;
              _os_log_impl(&dword_25418E000, v37, OS_LOG_TYPE_DEBUG, "%s[%@], Update candidate was requested but not needed, lastSeenDate: %@, currentDate: %@", buf, 0x2Au);

              v11 = (const void **)MEMORY[0x263F50120];
            }
          }
          else
          {
LABEL_17:
            if (v17)
            {
              [v56 addObject:v17];
            }
            else
            {
              v43 = [(IRCandidateManager *)self _lastUsedDateForCandidate:v23 fromHistoryEventsContainer:v55];
              v44 = (void *)[v23 copyWithReplacementLastUsedDate:v43];

              v45 = [v44 lastSeenDate];
              v23 = (void *)[v44 copyWithReplacementFirstSeenDate:v45];
            }
            [v58 addObject:v23];
            char v57 = 1;
          }
          uint64_t v10 = v60;
        }
        else
        {
          v40 = (void *)*MEMORY[0x263F50090];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR))
          {
            v41 = v40;
            v42 = +[IRLogQEUtility getCandidateAsString:v23];
            *(_DWORD *)buf = 136315650;
            v67 = "#candidate-manager, ";
            __int16 v68 = 2112;
            v69 = v24;
            __int16 v70 = 2112;
            v71 = v42;
            _os_log_impl(&dword_25418E000, v41, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Candidate update error] Candidate is not valid to be updated:\n %@", buf, 0x20u);
          }
        }
      }
      uint64_t v61 = [v12 countByEnumeratingWithState:&v62 objects:v74 count:16];
    }
    while (v61);

    id v8 = v12;
    v7 = v56;
    if (v57)
    {
      id v46 = v8;
      if ([v56 count]) {
        [(IRCandidateManager *)self _deleteCandidates:v56];
      }
      [(IRCandidateManager *)self _addCandidates:v58];
      [(IRCandidateManager *)self _handleCandidatesCleanup];
      v47 = dispatch_get_specific(*v11);
      v48 = (void *)*MEMORY[0x263F50090];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
      {
        v49 = NSNumber;
        v50 = v48;
        v51 = [(IRCandidateManager *)self candidatesContainer];
        v52 = [v51 candidates];
        v53 = objc_msgSend(v49, "numberWithUnsignedInteger:", objc_msgSend(v52, "count"));
        *(_DWORD *)buf = 136315650;
        v67 = "#candidate-manager, ";
        __int16 v68 = 2112;
        v69 = v47;
        __int16 v70 = 2112;
        v71 = v53;
        _os_log_impl(&dword_25418E000, v50, OS_LOG_TYPE_INFO, "%s[%@], Number of candidates: %@", buf, 0x20u);
      }
      [(IRCandidateManager *)self _didUpdateContextWithReason:@"Update candidate"];
      id v8 = v46;
    }
  }
  else
  {
  }
}

- (void)deleteBrokerCandidates
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [(IRCandidateManager *)self candidatesContainer];
  id v4 = [v3 candidates];
  v5 = [v4 allWhere:&__block_literal_global_11];

  if ([v5 count])
  {
    [(IRCandidateManager *)self _deleteCandidates:v5];
    [(IRCandidateManager *)self _handleCandidatesCleanup];
    id v6 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    v7 = (void *)*MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
    {
      id v8 = NSNumber;
      long long v9 = v7;
      uint64_t v10 = [(IRCandidateManager *)self candidatesContainer];
      v11 = [v10 candidates];
      id v12 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
      int v13 = 136315650;
      id v14 = "#candidate-manager, ";
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_25418E000, v9, OS_LOG_TYPE_INFO, "%s[%@], Number of candidates: %@", (uint8_t *)&v13, 0x20u);
    }
    [(IRCandidateManager *)self _didUpdateContextWithReason:@"Delete Broker candidates"];
  }
}

BOOL __44__IRCandidateManager_deleteBrokerCandidates__block_invoke(uint64_t a1, void *a2)
{
  objc_super v2 = [a2 nodes];
  v3 = [v2 firstWhere:&__block_literal_global_9];

  return v3 != 0;
}

uint64_t __44__IRCandidateManager_deleteBrokerCandidates__block_invoke_2(uint64_t a1, void *a2)
{
  objc_super v2 = [a2 avOutputDevice];
  uint64_t v3 = [v2 discoveredWithBroker];

  return v3;
}

- (void)deleteCandidate:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(IRCandidateManager *)self candidatesContainer];
  id v6 = [v4 candidateIdentifier];
  v7 = [v5 candidateForCandidateIdentifier:v6];

  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = v4;
  }
  id v9 = v8;

  uint64_t v10 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  v11 = (void *)*MEMORY[0x263F500A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F500A0], OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    uint64_t v13 = +[IRLogQEUtility getCandidateAsString:v9];
    id v14 = (void *)v13;
    __int16 v15 = @"YES";
    int v17 = 136315906;
    v18 = "#candidate-manager, ";
    if (!v7) {
      __int16 v15 = @"NO";
    }
    __int16 v19 = 2112;
    v20 = v10;
    __int16 v21 = 2112;
    uint64_t v22 = v13;
    __int16 v23 = 2112;
    v24 = v15;
    _os_log_impl(&dword_25418E000, v12, OS_LOG_TYPE_DEFAULT, "%s[%@], Deleting candidate:\n %@,\n is known candidate: %@", (uint8_t *)&v17, 0x2Au);
  }
  if (v7)
  {
    id v16 = [MEMORY[0x263EFFA08] setWithObject:v7];
    [(IRCandidateManager *)self _deleteCandidates:v16];

    [(IRCandidateManager *)self _didUpdateContextWithReason:@"Delete candidate"];
  }
}

- (void)notifyAddEventForCandidateIdentifier:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(IRCandidateManager *)self candidatesContainer];
  id v6 = [v5 candidateForCandidateIdentifier:v4];

  if (v6)
  {
    id v26 = v4;
    v7 = [MEMORY[0x263EFF9C0] setWithObject:v6];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v25 = v6;
    id v8 = [v6 nodes];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v14 = [v13 avOutpuDeviceIdentifier];

          if (v14)
          {
            __int16 v15 = [(IRCandidateManager *)self candidatesContainer];
            id v16 = [v15 candidates];
            v31[0] = MEMORY[0x263EF8330];
            v31[1] = 3221225472;
            v31[2] = __59__IRCandidateManager_notifyAddEventForCandidateIdentifier___block_invoke;
            v31[3] = &unk_26539F7C8;
            v31[4] = v13;
            int v17 = [v16 allWhere:v31];
            [v7 unionSet:v17];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v10);
    }

    v18 = [MEMORY[0x263EFF910] date];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v19 = v7;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * j) copyWithReplacementLastUsedDate:v18];
          [(IRCandidateManager *)self _updateCandidate:v24];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v21);
    }

    [(IRCandidateManager *)self _handleCandidatesCleanup];
    id v6 = v25;
    id v4 = v26;
  }
}

uint64_t __59__IRCandidateManager_notifyAddEventForCandidateIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 nodes];
  if ([v4 count] == 1)
  {
    v5 = [*(id *)(a1 + 32) avOutpuDeviceIdentifier];
    id v6 = [v3 nodes];
    v7 = [v6 anyObject];
    id v8 = [v7 avOutpuDeviceIdentifier];
    uint64_t v9 = [v5 isEqual:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)provider:(id)a3 didUpdateAVOutputDevices:(id)a4
{
  id v5 = a4;
  id v6 = [(IRCandidateManager *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__IRCandidateManager_provider_didUpdateAVOutputDevices___block_invoke;
  v8[3] = &unk_2653A0210;
  id v9 = v5;
  id v7 = v5;
  IRDispatchAsyncWithStrongSelf(v6, self, v8);
}

void __56__IRCandidateManager_provider_didUpdateAVOutputDevices___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [v3 setAvodDevices:*(void *)(a1 + 32)];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v4 = [v3 avodDevices];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__IRCandidateManager_provider_didUpdateAVOutputDevices___block_invoke_2;
  v10[3] = &unk_2653A01E8;
  v10[4] = v3;
  v10[5] = &v11;
  [v4 enumerateObjectsUsingBlock:v10];

  id v5 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  id v6 = (id)*MEMORY[0x263F50090];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = NSNumber;
    id v8 = [v3 avodDevices];
    id v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    *(_DWORD *)buf = 136315650;
    id v16 = "#candidate-manager, ";
    __int16 v17 = 2112;
    v18 = v5;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    _os_log_impl(&dword_25418E000, v6, OS_LOG_TYPE_DEBUG, "%s[%@], Memory: Number of Avod Devices: %@", buf, 0x20u);
  }
  if (*((unsigned char *)v12 + 24)) {
    [v3 _didUpdateContextWithReason:@"Avod device updated"];
  }
  _Block_object_dispose(&v11, 8);
}

void __56__IRCandidateManager_provider_didUpdateAVOutputDevices___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) candidatesContainer];
  id v5 = [v4 candidates];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__IRCandidateManager_provider_didUpdateAVOutputDevices___block_invoke_3;
  v7[3] = &unk_2653A01C0;
  id v8 = v3;
  long long v9 = *(_OWORD *)(a1 + 32);
  id v6 = v3;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __56__IRCandidateManager_provider_didUpdateAVOutputDevices___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 nodes];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __56__IRCandidateManager_provider_didUpdateAVOutputDevices___block_invoke_4;
  v21[3] = &unk_2653A0170;
  id v22 = *(id *)(a1 + 32);
  id v5 = [v4 firstWhere:v21];

  if (v5
    && ([v5 avOutputDevice],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isEqual:*(void *)(a1 + 32)],
        v6,
        (v7 & 1) == 0))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    long long v9 = (void *)[v5 copyWithReplacementAvOutputDevice:*(void *)(a1 + 32)];

    uint64_t v10 = [v3 nodes];
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __56__IRCandidateManager_provider_didUpdateAVOutputDevices___block_invoke_5;
    __int16 v19 = &unk_2653A0198;
    id v5 = v9;
    id v20 = v5;
    uint64_t v11 = [v10 map:&v16];
    id v8 = objc_msgSend(v3, "copyWithReplacementNodes:", v11, v16, v17, v18, v19);

    [*(id *)(a1 + 40) _updateCandidate:v8];
    id v12 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    uint64_t v13 = (void *)*MEMORY[0x263F500A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F500A0], OS_LOG_TYPE_DEFAULT))
    {
      char v14 = v13;
      __int16 v15 = [v8 candidateIdentifier];
      *(_DWORD *)buf = 136315906;
      v24 = "#candidate-manager, ";
      __int16 v25 = 2112;
      id v26 = v12;
      __int16 v27 = 2112;
      long long v28 = v15;
      __int16 v29 = 2112;
      long long v30 = v8;
      _os_log_impl(&dword_25418E000, v14, OS_LOG_TYPE_DEFAULT, "%s[%@], Candidate [%@] updated with new avoutput device: %@", buf, 0x2Au);
    }
  }
  else
  {
    id v8 = v3;
  }
}

uint64_t __56__IRCandidateManager_provider_didUpdateAVOutputDevices___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 avOutpuDeviceIdentifier];
  id v4 = [*(id *)(a1 + 32) deviceID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

id __56__IRCandidateManager_provider_didUpdateAVOutputDevices___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 avOutpuDeviceIdentifier];
  uint64_t v5 = [*(id *)(a1 + 32) avOutpuDeviceIdentifier];
  int v6 = [v4 isEqual:v5];

  char v7 = v3;
  if (v6) {
    char v7 = *(void **)(a1 + 32);
  }
  id v8 = v7;

  return v8;
}

- (void)provider:(id)a3 didUpdateRapportDevices:(id)a4
{
  id v5 = a4;
  int v6 = [(IRCandidateManager *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke;
  v8[3] = &unk_2653A0210;
  id v9 = v5;
  id v7 = v5;
  IRDispatchAsyncWithStrongSelf(v6, self, v8);
}

void __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [v3 setRapportDevices:*(void *)(a1 + 32)];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v4 = [v3 rapportDevices];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke_2;
  v10[3] = &unk_2653A0238;
  v10[4] = v3;
  v10[5] = &v11;
  [v4 enumerateObjectsUsingBlock:v10];

  id v5 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  int v6 = (id)*MEMORY[0x263F50090];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = NSNumber;
    id v8 = [v3 rapportDevices];
    id v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = "#candidate-manager, ";
    __int16 v17 = 2112;
    v18 = v5;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_25418E000, v6, OS_LOG_TYPE_DEBUG, "%s[%@], Memory: Number of Rapport Devices: %@", buf, 0x20u);
  }
  if (*((unsigned char *)v12 + 24)) {
    [v3 _didUpdateContextWithReason:@"Raport device updated"];
  }
  _Block_object_dispose(&v11, 8);
}

void __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) candidatesContainer];
  id v5 = [v4 candidates];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke_3;
  v7[3] = &unk_2653A01C0;
  id v8 = v3;
  long long v9 = *(_OWORD *)(a1 + 32);
  id v6 = v3;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 nodes];
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke_4;
  v49[3] = &unk_2653A0170;
  id v50 = *(id *)(a1 + 32);
  id v5 = [v4 firstWhere:v49];

  if (!v5)
  {
    id v6 = [v3 nodes];
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke_5;
    v47[3] = &unk_2653A0170;
    id v48 = *(id *)(a1 + 32);
    id v5 = [v6 firstWhere:v47];

    if (!v5)
    {
      id v7 = [v3 nodes];
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke_6;
      v45[3] = &unk_2653A0170;
      id v46 = *(id *)(a1 + 32);
      id v5 = [v7 firstWhere:v45];

      if (!v5)
      {
        id v8 = [v3 nodes];
        v43[0] = MEMORY[0x263EF8330];
        v43[1] = 3221225472;
        v43[2] = __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke_7;
        v43[3] = &unk_2653A0170;
        id v44 = *(id *)(a1 + 32);
        id v5 = [v8 firstWhere:v43];

        if (!v5)
        {
          uint64_t v11 = 0;
          goto LABEL_7;
        }
      }
    }
  }
  long long v9 = [v5 rapportDevice];
  char v10 = [v9 isEqual:*(void *)(a1 + 32)];

  if (v10)
  {
    uint64_t v11 = v5;
LABEL_7:
    id v12 = v3;
    goto LABEL_22;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  uint64_t v36 = a1;
  uint64_t v11 = (void *)[v5 copyWithReplacementRapportDevice:*(void *)(a1 + 32)];

  uint64_t v38 = objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v35 = v3;
  obuint64_t j = [v3 nodes];
  uint64_t v13 = [obj countByEnumeratingWithState:&v39 objects:v59 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(obj);
        }
        __int16 v17 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v18 = [v17 rapportIdentifier];
        __int16 v19 = [v11 rapportIdentifier];
        char v20 = [v18 isEqual:v19];

        uint64_t v21 = [v17 avOutpuDeviceIdentifier];
        id v22 = [v11 avOutpuDeviceIdentifier];
        int v23 = [v21 isEqual:v22];

        v24 = [v17 idsIdentifier];
        __int16 v25 = [v11 idsIdentifier];
        int v26 = [v24 isEqual:v25];

        __int16 v27 = v11;
        if ((v20 & 1) == 0)
        {
          long long v28 = [v11 rapportIdentifier];
          BOOL v29 = v28 == 0;

          if ((v29 & (v23 | v26)) != 0) {
            __int16 v27 = v11;
          }
          else {
            __int16 v27 = v17;
          }
        }
        id v30 = v27;
        [v38 addObject:v30];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v39 objects:v59 count:16];
    }
    while (v14);
  }

  id v12 = (void *)[v35 copyWithReplacementNodes:v38];
  [*(id *)(v36 + 40) _updateCandidate:v12];
  uint64_t v31 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  long long v32 = (void *)*MEMORY[0x263F500A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F500A0], OS_LOG_TYPE_DEFAULT))
  {
    long long v33 = v32;
    long long v34 = [v12 candidateIdentifier];
    *(_DWORD *)buf = 136315906;
    v52 = "#candidate-manager, ";
    __int16 v53 = 2112;
    long long v54 = v31;
    __int16 v55 = 2112;
    v56 = v34;
    __int16 v57 = 2112;
    v58 = v12;
    _os_log_impl(&dword_25418E000, v33, OS_LOG_TYPE_DEFAULT, "%s[%@], Candidate [%@] updated with new rapport device: %@", buf, 0x2Au);
  }
LABEL_22:
}

uint64_t __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 rapportIdentifier];
  id v4 = [*(id *)(a1 + 32) rapportEffectiveID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = [a2 avOutpuDeviceIdentifier];
  id v4 = [*(id *)(a1 + 32) mediaRemoteIdentifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = [a2 avOutpuDeviceIdentifier];
  id v4 = [*(id *)(a1 + 32) mediaRouteIdentifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = [a2 idsIdentifier];
  id v4 = [*(id *)(a1 + 32) idsID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (void)synchronizeAndFetchFromDBOnDisk
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [(IRCandidateManager *)self store];
  id v4 = [v3 fetchCandidatesContainer];
  [(IRCandidateManager *)self setCandidatesContainer:v4];

  uint64_t v5 = [(IRCandidateManager *)self candidatesContainer];

  id v6 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  id v7 = *MEMORY[0x263F50090];
  id v8 = *MEMORY[0x263F50090];
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      long long v9 = NSNumber;
      char v10 = v7;
      uint64_t v11 = [(IRCandidateManager *)self candidatesContainer];
      id v12 = [v11 candidates];
      uint64_t v13 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
      int v14 = 136315650;
      uint64_t v15 = "#candidate-manager, ";
      __int16 v16 = 2112;
      __int16 v17 = v6;
      __int16 v18 = 2112;
      __int16 v19 = v13;
      _os_log_impl(&dword_25418E000, v10, OS_LOG_TYPE_DEFAULT, "%s[%@], Loading candidates container from store with %@ candidates", (uint8_t *)&v14, 0x20u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v14 = 136315394;
    uint64_t v15 = "#candidate-manager, ";
    __int16 v16 = 2112;
    __int16 v17 = v6;
    _os_log_impl(&dword_25418E000, v7, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Candidate container fetch error] Could not fetch candidates container", (uint8_t *)&v14, 0x16u);
  }
}

- (void)_addCandidates:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(IRCandidateManager *)self candidatesContainer];
  id v6 = [v5 candidates];
  id v7 = [v6 setByAddingObjectsFromSet:v4];
  uint64_t v8 = +[IRCandidatesContainerDO candidatesContainerDOWithCandidates:v7];
  [(IRCandidateManager *)self setCandidatesContainer:v8];

  long long v9 = [(IRCandidateManager *)self store];
  LOBYTE(v8) = [v9 addCandidates:v4];

  if ((v8 & 1) == 0)
  {
    char v10 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    uint64_t v11 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315650;
      uint64_t v13 = "#candidate-manager, ";
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_25418E000, v11, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Candidate Manager add error] Could not add a new candidates: %@", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (void)_updateCandidate:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(IRCandidateManager *)self candidatesContainer];
  id v6 = [(id)v5 candidates];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __39__IRCandidateManager__updateCandidate___block_invoke;
  v13[3] = &unk_2653A0260;
  id v7 = v4;
  id v14 = v7;
  uint64_t v8 = [v6 map:v13];
  long long v9 = +[IRCandidatesContainerDO candidatesContainerDOWithCandidates:v8];
  [(IRCandidateManager *)self setCandidatesContainer:v9];

  char v10 = [(IRCandidateManager *)self store];
  LOBYTE(v5) = [v10 updateCandidate:v7];

  if ((v5 & 1) == 0)
  {
    uint64_t v11 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    int v12 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v16 = "#candidate-manager, ";
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_25418E000, v12, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Candidate Manager update error] Could not update candidate: %@", buf, 0x20u);
    }
  }
}

id __39__IRCandidateManager__updateCandidate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 candidateIdentifier];
  uint64_t v5 = [*(id *)(a1 + 32) candidateIdentifier];
  int v6 = [v4 isEqual:v5];

  id v7 = v3;
  if (v6) {
    id v7 = *(void **)(a1 + 32);
  }
  id v8 = v7;

  return v8;
}

- (void)_deleteCandidates:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(IRCandidateManager *)self candidatesContainer];
  int v6 = [(id)v5 candidates];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __40__IRCandidateManager__deleteCandidates___block_invoke;
  v13[3] = &unk_26539F7C8;
  id v7 = v4;
  id v14 = v7;
  id v8 = [v6 allWhere:v13];
  long long v9 = +[IRCandidatesContainerDO candidatesContainerDOWithCandidates:v8];
  [(IRCandidateManager *)self setCandidatesContainer:v9];

  char v10 = [(IRCandidateManager *)self store];
  LOBYTE(v5) = [v10 deleteCandidates:v7];

  if ((v5 & 1) == 0)
  {
    uint64_t v11 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    int v12 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v16 = "#candidate-manager, ";
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_25418E000, v12, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Candidate Manager delete error] Could not delete candidates: %@", buf, 0x20u);
    }
  }
}

BOOL __40__IRCandidateManager__deleteCandidates___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 candidateIdentifier];
  id v4 = +[IRCandidateDO candidateForIdentifier:v3 within:*(void *)(a1 + 32)];

  return v4 == 0;
}

- (void)_didUpdateContextWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [(IRCandidateManager *)self contextObserver];
  [v5 didUpdateContextWithReason:v4 andOverrides:0];
}

- (void)_handleCandidatesCleanup
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9C0] set];
  id v4 = [MEMORY[0x263EFF9C0] set];
  id v5 = [(IRCandidateManager *)self candidatesContainer];
  int v6 = [v5 candidates];
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  v24 = __46__IRCandidateManager__handleCandidatesCleanup__block_invoke;
  __int16 v25 = &unk_2653A0288;
  id v7 = v3;
  id v26 = v7;
  id v8 = v4;
  id v27 = v8;
  [v6 enumerateObjectsUsingBlock:&v22];

  long long v9 = objc_msgSend(MEMORY[0x263EFF9C0], "set", v22, v23, v24, v25);
  char v10 = +[IRPreferences shared];
  uint64_t v11 = [v10 numberOfUsedCandidates];
  int v12 = -[IRCandidateManager _oldestCandidatesFrom:forKey:limit:](self, "_oldestCandidatesFrom:forKey:limit:", v7, @"lastUsedDate", [v11 unsignedIntegerValue]);
  [v9 addObjectsFromArray:v12];

  uint64_t v13 = +[IRPreferences shared];
  id v14 = [v13 numberOfSeenCandidates];
  uint64_t v15 = -[IRCandidateManager _oldestCandidatesFrom:forKey:limit:](self, "_oldestCandidatesFrom:forKey:limit:", v8, @"lastSeenDate", [v14 unsignedIntegerValue]);
  [v9 addObjectsFromArray:v15];

  if ([v9 count])
  {
    __int16 v16 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    __int16 v17 = (void *)*MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = NSNumber;
      __int16 v19 = v17;
      id v20 = objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      *(_DWORD *)buf = 136315906;
      BOOL v29 = "#candidate-manager, ";
      __int16 v30 = 2112;
      uint64_t v31 = v16;
      __int16 v32 = 2112;
      long long v33 = v20;
      __int16 v34 = 2112;
      long long v35 = v21;
      _os_log_impl(&dword_25418E000, v19, OS_LOG_TYPE_INFO, "%s[%@], Candidates cleanup: usedCandidates: %@ seenCandidates: %@", buf, 0x2Au);
    }
    [(IRCandidateManager *)self _deleteCandidates:v9];
  }
}

void __46__IRCandidateManager__handleCandidatesCleanup__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 lastUsedDate];

  uint64_t v4 = 32;
  if (!v3) {
    uint64_t v4 = 40;
  }
  [*(id *)(a1 + v4) addObject:v5];
}

- (id)_lastUsedDateForCandidate:(id)a3 fromHistoryEventsContainer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  __int16 v17 = __Block_byref_object_copy__2;
  uint64_t v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  id v7 = [v6 historyEvents];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__IRCandidateManager__lastUsedDateForCandidate_fromHistoryEventsContainer___block_invoke;
  v11[3] = &unk_26539F7F0;
  id v8 = v5;
  id v12 = v8;
  uint64_t v13 = &v14;
  [v7 enumerateObjectsWithOptions:2 usingBlock:v11];

  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __75__IRCandidateManager__lastUsedDateForCandidate_fromHistoryEventsContainer___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  id v6 = [v12 candidateIdentifier];
  id v7 = [*(id *)(a1 + 32) candidateIdentifier];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    uint64_t v9 = [v12 date];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a4 = 1;
  }
}

- (id)_nodesForCandidate:(id)a3 fromExistingCandidate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = objc_opt_new();
  uint64_t v9 = [v7 nodes];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke;
  v14[3] = &unk_2653A0300;
  v14[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v10 = v8;
  id v11 = v6;
  [v9 enumerateObjectsUsingBlock:v14];

  id v12 = (void *)[v10 copy];

  return v12;
}

void __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) avodDevices];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke_2;
  v34[3] = &unk_2653A02B0;
  id v5 = v3;
  id v35 = v5;
  id v6 = [v4 firstWhere:v34];

  if (!v6)
  {
    id v7 = [*(id *)(a1 + 40) nodes];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke_3;
    v32[3] = &unk_2653A0170;
    id v33 = v5;
    int v8 = [v7 firstWhere:v32];

    id v6 = [v8 avOutputDevice];
  }
  uint64_t v9 = [*(id *)(a1 + 32) rapportDevices];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke_4;
  v30[3] = &unk_2653A02D8;
  id v10 = v5;
  id v31 = v10;
  id v11 = [v9 firstWhere:v30];

  if (!v11)
  {
    id v12 = [*(id *)(a1 + 32) rapportDevices];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke_5;
    v28[3] = &unk_2653A02D8;
    id v13 = v10;
    id v29 = v13;
    id v11 = [v12 firstWhere:v28];

    if (!v11)
    {
      uint64_t v14 = [*(id *)(a1 + 32) rapportDevices];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke_6;
      v26[3] = &unk_2653A02D8;
      id v15 = v13;
      id v27 = v15;
      id v11 = [v14 firstWhere:v26];

      if (!v11)
      {
        id v16 = [*(id *)(a1 + 40) nodes];
        uint64_t v21 = MEMORY[0x263EF8330];
        uint64_t v22 = 3221225472;
        uint64_t v23 = __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke_7;
        v24 = &unk_2653A0170;
        id v25 = v15;
        __int16 v17 = [v16 firstWhere:&v21];

        id v11 = objc_msgSend(v17, "rapportDevice", v21, v22, v23, v24);
      }
    }
  }
  uint64_t v18 = *(void **)(a1 + 48);
  id v19 = (void *)[v10 copyWithReplacementRapportDevice:v11];
  id v20 = (void *)[v19 copyWithReplacementAvOutputDevice:v6];
  [v18 addObject:v20];
}

uint64_t __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 deviceID];
  uint64_t v4 = [*(id *)(a1 + 32) avOutpuDeviceIdentifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 avOutpuDeviceIdentifier];
  uint64_t v4 = [*(id *)(a1 + 32) avOutpuDeviceIdentifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 rapportEffectiveID];
  uint64_t v4 = [*(id *)(a1 + 32) rapportIdentifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = [a2 mediaRemoteIdentifier];
  uint64_t v4 = [*(id *)(a1 + 32) avOutpuDeviceIdentifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = [a2 mediaRouteIdentifier];
  uint64_t v4 = [*(id *)(a1 + 32) avOutpuDeviceIdentifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = [a2 rapportIdentifier];
  uint64_t v4 = [*(id *)(a1 + 32) rapportIdentifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (id)_oldestCandidatesFrom:(id)a3 forKey:(id)a4 limit:(unint64_t)a5
{
  v16[1] = *MEMORY[0x263EF8340];
  id v7 = (void *)MEMORY[0x263F08B30];
  id v8 = a3;
  uint64_t v9 = [v7 sortDescriptorWithKey:a4 ascending:1];
  id v10 = [v8 allObjects];

  v16[0] = v9;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  id v12 = [v10 sortedArrayUsingDescriptors:v11];

  if ([v12 count] <= a5) {
    unint64_t v13 = 0;
  }
  else {
    unint64_t v13 = [v12 count] - a5;
  }
  uint64_t v14 = objc_msgSend(v12, "subarrayWithRange:", 0, v13);

  return v14;
}

- (void)setCandidatesContainer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IRPolicyManagerContextObserver)contextObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contextObserver);

  return (IRPolicyManagerContextObserver *)WeakRetained;
}

- (void)setContextObserver:(id)a3
{
}

- (IRAVOutputDeviceProvider)avOutputDeviceProvider
{
  return self->_avOutputDeviceProvider;
}

- (void)setAvOutputDeviceProvider:(id)a3
{
}

- (IRRapportProvider)rapportDeviceProvider
{
  return self->_rapportDeviceProvider;
}

- (void)setRapportDeviceProvider:(id)a3
{
}

- (IRServiceStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (NSSet)avodDevices
{
  return self->_avodDevices;
}

- (void)setAvodDevices:(id)a3
{
}

- (NSSet)rapportDevices
{
  return self->_rapportDevices;
}

- (void)setRapportDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rapportDevices, 0);
  objc_storeStrong((id *)&self->_avodDevices, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_rapportDeviceProvider, 0);
  objc_storeStrong((id *)&self->_avOutputDeviceProvider, 0);
  objc_destroyWeak((id *)&self->_contextObserver);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_candidatesContainer, 0);
}

@end