@interface CONodeController
- (BOOL)_isActiveState:(int64_t)a3;
- (BOOL)handlersRegistered;
- (BOOL)isLocalNodeController;
- (BOOL)stopped;
- (BOOL)supportsLeaderElection;
- (COConstituent)leader;
- (CODiscoveryRecord)ipDiscoveryRecord;
- (CODiscoveryRecordProtocol)originalRecord;
- (COExecutionContext)executionContext;
- (CONode)node;
- (CONodeController)initWithDiscoveryRecord:(id)a3 executionContext:(id)a4;
- (CONodeControllerDelegate)delegate;
- (COTransportProtocol)preferredTransport;
- (NSMutableArray)records;
- (NSMutableArray)transports;
- (NSMutableDictionary)knownDiscoveryRecords;
- (NSMutableDictionary)sentElements;
- (NSSet)acceptableCommands;
- (NSString)description;
- (id)_acceptResponseWithElectionInfo:(id)a3;
- (id)_ballotResponseWithElectionInfo:(id)a3;
- (id)_electionInfoByDiffingCurrentElectionInfo:(id)a3;
- (id)_electionRequestWithElectionInfo:(id)a3;
- (id)_voteRequestWithElectionInfo:(id)a3;
- (id)computePreferredTransport;
- (id)electionSummaryDetails;
- (id)nodeAfterReconciliation;
- (id)rapportTransport;
- (id)remote;
- (id)shortDescription;
- (int64_t)_nodeControllerStateFromNodeState;
- (void)_adjustNodeDiscoveryInformationUsingRecord:(id)a3;
- (void)_createAndActivateTransportForRecord:(id)a3 withCompletionHandler:(id)a4;
- (void)_handleAcceptResponse:(id)a3 fromTransport:(id)a4;
- (void)_handleBallotResponse:(id)a3 fromTransport:(id)a4;
- (void)_handleElectionRequest:(id)a3 fromTransport:(id)a4 callback:(id)a5;
- (void)_handlePingError:(id)a3 fromTransport:(id)a4;
- (void)_handleResponseToCoreRequest:(id)a3 response:(id)a4 error:(id)a5 usingTransport:(id)a6;
- (void)_handleVoteRequest:(id)a3 fromTransport:(id)a4 callback:(id)a5;
- (void)_handleWithdraw:(id)a3 fromTransport:(id)a4;
- (void)_sendAcceptResponse:(id)a3 usingTransport:(id)a4 callback:(id)a5;
- (void)_sendBallotResponse:(id)a3 usingTransport:(id)a4 callback:(id)a5;
- (void)_sendElectionRequest:(id)a3 usingTransport:(id)a4;
- (void)_sendPingUsingTransport:(id)a3;
- (void)_sendProbeRequest:(id)a3 withState:(int64_t)a4 usingTransport:(id)a5;
- (void)_sendVoteRequest:(id)a3 usingTransport:(id)a4;
- (void)_updateDelegateWithBallotCommand:(id)a3 withCompletionHandler:(id)a4;
- (void)_updateKnownDiscovery:(id)a3;
- (void)_updateNodeState:(int64_t)a3 currentElectionInfo:(id)a4 incomingElectionInfo:(id)a5 reason:(int64_t)a6;
- (void)activateWithCompletionHandler:(id)a3;
- (void)addDiscoveryRecord:(id)a3;
- (void)didFireBackoffTimer;
- (void)inquireForTransport:(id)a3;
- (void)invalidateWithReason:(int64_t)a3;
- (void)markInactive;
- (void)reconcileNode;
- (void)removeDiscoveryRecord:(id)a3;
- (void)sendCommand:(id)a3 withCompletionHandler:(id)a4;
- (void)sendPing;
- (void)setAcceptableCommands:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHandlersRegistered:(BOOL)a3;
- (void)setIpDiscoveryRecord:(id)a3;
- (void)setKnownDiscoveryRecords:(id)a3;
- (void)setLeader:(id)a3;
- (void)setOriginalRecord:(id)a3;
- (void)setPreferredTransport:(id)a3;
- (void)setSentElements:(id)a3;
- (void)setStopped:(BOOL)a3;
- (void)stopWithCompletionHandler:(id)a3;
- (void)transport:(id)a3 didInvalidateWithError:(id)a4;
- (void)transport:(id)a3 didReceiveCommand:(id)a4;
- (void)transport:(id)a3 didReceiveError:(id)a4 forCommand:(id)a5;
- (void)transport:(id)a3 didReceiveRequest:(id)a4 callback:(id)a5;
- (void)transport:(id)a3 didReceiveUnhandledRequest:(id)a4;
- (void)transport:(id)a3 didUpdateRemoteConstituent:(id)a4 to:(id)a5;
- (void)transport:(id)a3 shouldUpdateRemoteConstituent:(id)a4 to:(id)a5 forCommand:(id)a6 completionHandler:(id)a7;
- (void)transport:(id)a3 willUpdateRemoteConstituent:(id)a4 to:(id)a5;
- (void)updateElectionInfo:(id)a3;
@end

@implementation CONodeController

- (CONodeController)initWithDiscoveryRecord:(id)a3 executionContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CONodeController;
  v9 = [(CONodeController *)&v22 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_originalRecord, a3);
    uint64_t v11 = [MEMORY[0x263EFF980] array];
    records = v10->_records;
    v10->_records = (NSMutableArray *)v11;

    uint64_t v13 = [MEMORY[0x263EFF980] array];
    transports = v10->_transports;
    v10->_transports = (NSMutableArray *)v13;

    objc_storeStrong((id *)&v10->_executionContext, a4);
    v15 = [[CONode alloc] initWithRecord:v7 executionContext:v8 delegate:v10];
    node = v10->_node;
    v10->_node = v15;

    uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
    sentElements = v10->_sentElements;
    v10->_sentElements = (NSMutableDictionary *)v17;

    uint64_t v19 = [MEMORY[0x263EFF9A0] dictionary];
    knownDiscoveryRecords = v10->_knownDiscoveryRecords;
    v10->_knownDiscoveryRecords = (NSMutableDictionary *)v19;
  }
  return v10;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(CONodeController *)self executionContext];
  id v7 = [v6 constituentForMe];
  id v8 = [(CONodeController *)self remote];
  v9 = [(CONodeController *)self node];
  v10 = [v3 stringWithFormat:@"<%@: %p,/\n, %@->%@/\n, State: %ld/\n, Records:%@, Transports: %@>", v5, self, v7, v8, objc_msgSend(v9, "state"), self->_records, self->_transports];

  return (NSString *)v10;
}

- (id)shortDescription
{
  v3 = NSString;
  v4 = [(CONodeController *)self executionContext];
  v5 = [v4 meshControllerDescription];
  v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = [v3 stringWithFormat:@"[m:%@] <%@: %p>", v5, v7, self];

  return v8;
}

- (id)remote
{
  v2 = [(CONodeController *)self node];
  v3 = [v2 remote];

  return v3;
}

- (COTransportProtocol)preferredTransport
{
  preferredTransport = self->_preferredTransport;
  if (!preferredTransport)
  {
    v4 = [(CONodeController *)self computePreferredTransport];
    v5 = self->_preferredTransport;
    self->_preferredTransport = v4;

    preferredTransport = self->_preferredTransport;
  }
  return preferredTransport;
}

- (BOOL)isLocalNodeController
{
  v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  return [v2 isSubclassOfClass:v3];
}

- (BOOL)supportsLeaderElection
{
  return [(COTransportProtocol *)self->_preferredTransport supportsLeaderElection];
}

- (id)rapportTransport
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(CONodeController *)self transports];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;

          v5 = v9;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CODiscoveryRecord)ipDiscoveryRecord
{
  ipDiscoveryRecord = self->_ipDiscoveryRecord;
  if (!ipDiscoveryRecord)
  {
    uint64_t v4 = +[CODiscoveryRecord discoveryRecordWithNodeController:self];
    v5 = self->_ipDiscoveryRecord;
    self->_ipDiscoveryRecord = v4;

    ipDiscoveryRecord = self->_ipDiscoveryRecord;
  }
  uint64_t v6 = ipDiscoveryRecord;
  return v6;
}

- (id)electionSummaryDetails
{
  uint64_t v3 = [(CONodeController *)self node];
  uint64_t v4 = [v3 remote];

  v5 = [(CONodeController *)self preferredTransport];
  uint64_t v6 = [(CONodeController *)self node];
  id v7 = [v6 meConstituent];
  id v8 = [(CONodeController *)self node];
  id v9 = [v8 remote];
  int v10 = [v7 isEqual:v9];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v26 = v5;
    long long v11 = [v26 client];
    long long v12 = v11;
    if (v10)
    {
      long long v13 = [v11 localDevice];

      long long v14 = @"SELF";
    }
    else
    {
      long long v13 = [v11 destinationDevice];

      long long v14 = [v13 name];
    }
    uint64_t v17 = [v13 identifier];
    v18 = [(CONodeController *)self node];
    unint64_t v19 = [v18 connectionType];

    if (v19 > 2) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = off_2645CE9A0[v19];
    }
    v20 = [(CONodeController *)self node];
    char v21 = [v20 discoveryType];

    uint64_t v22 = 67;
    if ((v21 & 2) == 0) {
      uint64_t v22 = 99;
    }
    uint64_t v23 = 82;
    if ((v21 & 1) == 0) {
      uint64_t v23 = 114;
    }
    v15 = objc_msgSend(NSString, "stringWithFormat:", @"%c%c", v23, v22);
  }
  else
  {
    v15 = 0;
    uint64_t v16 = 0;
    long long v14 = 0;
    uint64_t v17 = 0;
  }
  v24 = [NSString stringWithFormat:@"[COMeshController : %p] %@ [Name] - %@ [Rapport ID] - %@ [Conn] - %@ [Disc] - %@", self, v4, v14, v17, v16, v15];

  return v24;
}

- (id)nodeAfterReconciliation
{
  uint64_t v3 = [(CONodeController *)self node];
  uint64_t v4 = [v3 HomeKitIdentifier];

  if (!v4) {
    [(CONodeController *)self reconcileNode];
  }
  return v3;
}

- (void)reconcileNode
{
  uint64_t v3 = [(CONodeController *)self node];
  uint64_t v4 = self;
  objc_sync_enter(v4);
  v5 = [(CONodeController *)v4 records];
  uint64_t v6 = (void *)[v5 copy];

  objc_sync_exit(v4);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __33__CONodeController_reconcileNode__block_invoke;
  v8[3] = &unk_2645CE740;
  id v9 = v3;
  id v7 = v3;
  [v6 enumerateObjectsUsingBlock:v8];
}

uint64_t __33__CONodeController_reconcileNode__block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  uint64_t v6 = [a2 HomeKitIdentifier];
  uint64_t v7 = v6;
  *a4 = v6 != 0;
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v6 = [*(id *)(a1 + 32) setHomeKitIdentifier:v6];
    uint64_t v7 = v9;
  }
  return MEMORY[0x270F9A758](v6, v7);
}

- (void)activateWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  v5 = [(CONodeController *)self executionContext];
  [v5 assertDispatchQueue];

  uint64_t v6 = [(CONodeController *)self preferredTransport];

  if (v6)
  {
    v4[2](v4, 0);
  }
  else
  {
    uint64_t v7 = self;
    objc_sync_enter(v7);
    id v8 = [(CONodeController *)v7 records];
    uint64_t v9 = [(CONodeController *)v7 originalRecord];
    [v8 addObject:v9];

    objc_sync_exit(v7);
    int v10 = [(CONodeController *)v7 originalRecord];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __50__CONodeController_activateWithCompletionHandler___block_invoke;
    v11[3] = &unk_2645CE768;
    long long v12 = v4;
    [(CONodeController *)v7 _createAndActivateTransportForRecord:v10 withCompletionHandler:v11];
  }
}

uint64_t __50__CONodeController_activateWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_createAndActivateTransportForRecord:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v28 = a3;
  id v6 = a4;
  uint64_t v7 = [(CONodeController *)self executionContext];
  id v8 = (void *)[v28 newTransportWithExecutionContext:v7];

  objc_initWeak(&location, v8);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_initWeak((id *)from, self);
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke;
    v45[3] = &unk_2645CB080;
    objc_copyWeak(&v46, (id *)from);
    objc_copyWeak(&v47, &location);
    [v8 setClientIsUsingOnDemandConnection:v45];
    objc_destroyWeak(&v47);
    objc_destroyWeak(&v46);
    objc_destroyWeak((id *)from);
  }
  uint64_t v9 = COCoreLogForCategory(16);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [(CONodeController *)self shortDescription];
    *(_DWORD *)from = 138543874;
    *(void *)&from[4] = v10;
    __int16 v51 = 2112;
    v52 = v8;
    __int16 v53 = 2112;
    v54 = (COTransportProtocol *)v28;
    _os_log_impl(&dword_2217C1000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ created new transport %@ with record %@", from, 0x20u);
  }
  [v8 setDelegate:self];
  long long v11 = [(CONodeController *)self transports];
  [v11 addObject:v8];

  long long v12 = [(CONodeController *)self computePreferredTransport];
  preferredTransport = self->_preferredTransport;
  self->_preferredTransport = v12;

  long long v14 = COCoreLogForCategory(16);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [(CONodeController *)self shortDescription];
    uint64_t v16 = self->_preferredTransport;
    *(_DWORD *)from = 138543874;
    *(void *)&from[4] = v15;
    __int16 v51 = 2048;
    v52 = v8;
    __int16 v53 = 2048;
    v54 = v16;
    _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ recomputing preferred transport after addition of %p. Preferred transport = %p", from, 0x20u);
  }
  uint64_t v17 = [(CONodeController *)self originalRecord];
  [(CONodeController *)self _adjustNodeDiscoveryInformationUsingRecord:v17];

  objc_initWeak((id *)from, self);
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_64;
  v40[3] = &unk_2645CE7B8;
  objc_copyWeak(&v43, (id *)from);
  objc_copyWeak(&v44, &location);
  id v29 = v8;
  id v41 = v29;
  id v27 = v6;
  id v42 = v27;
  v18 = (void (**)(void))MEMORY[0x223C8B4A0](v40);
  unint64_t v19 = [(CONodeController *)self acceptableCommands];
  self->_expectedRegisteredCommandCount = [v19 count];

  if (!self->_expectedRegisteredCommandCount)
  {
    v18[2](v18);
    goto LABEL_22;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v20 = [(CONodeController *)self acceptableCommands];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (!v21) {
    goto LABEL_20;
  }
  uint64_t v22 = *(void *)v37;
  do
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if (*(void *)v37 != v22) {
        objc_enumerationMutation(v20);
      }
      v24 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      if ([v24 isSubclassOfClass:objc_opt_class()])
      {
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_70;
        v33[3] = &unk_2645CE7E0;
        objc_copyWeak(v35, (id *)from);
        v35[1] = v24;
        v34 = v18;
        [v29 registerRequestForClass:v24 withCompletion:v33];
        v25 = (id *)&v34;
        id v26 = v35;
      }
      else
      {
        if (![v24 isSubclassOfClass:objc_opt_class()]) {
          continue;
        }
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_73;
        v30[3] = &unk_2645CE7E0;
        objc_copyWeak(v32, (id *)from);
        v32[1] = v24;
        v31 = v18;
        [v29 registerCommandForClass:v24 withCompletion:v30];
        v25 = (id *)&v31;
        id v26 = v32;
      }

      objc_destroyWeak(v26);
    }
    uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v49 count:16];
  }
  while (v21);
LABEL_20:

LABEL_22:
  objc_destroyWeak(&v44);
  objc_destroyWeak(&v43);
  objc_destroyWeak((id *)from);
  objc_destroyWeak(&location);
}

void __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = v3;
  if (WeakRetained && v3)
  {
    v5 = [WeakRetained executionContext];
    [v5 assertDispatchQueue];

    id v6 = COCoreLogForCategory(16);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [WeakRetained shortDescription];
      int v10 = 138543618;
      long long v11 = v7;
      __int16 v12 = 2112;
      long long v13 = v4;
      _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ is using an on-demand connection for transport %@", (uint8_t *)&v10, 0x16u);
    }
    id v8 = [WeakRetained node];
    [v8 setConnectionType:2];

    uint64_t v9 = [WeakRetained node];
    [v9 setDiscoveryType:2];
  }
}

void __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_64(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = v4;
  if (WeakRetained && v4)
  {
    id v6 = [WeakRetained executionContext];
    [v6 assertDispatchQueue];

    [WeakRetained setHandlersRegistered:1];
    uint64_t v7 = COCoreLogForCategory(16);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [WeakRetained shortDescription];
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v15 = v8;
      __int16 v16 = 2048;
      uint64_t v17 = v9;
      _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Handlers registered. Activating transport %p", buf, 0x16u);
    }
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_65;
    v10[3] = &unk_2645CE790;
    objc_copyWeak(&v12, v2);
    objc_copyWeak(&v13, (id *)(a1 + 56));
    id v11 = *(id *)(a1 + 40);
    [v5 activateWithCompletion:v10];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v12);
  }
}

void __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_65(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = v5;
  if (WeakRetained && v5)
  {
    uint64_t v7 = [WeakRetained executionContext];
    [v7 assertDispatchQueue];

    if (v3)
    {
      id v8 = COCoreLogForCategory(16);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_65_cold_1();
      }

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      WeakRetained[8] = 1;
      uint64_t v9 = COCoreLogForCategory(16);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = [WeakRetained shortDescription];
        int v12 = 138543618;
        id v13 = v10;
        __int16 v14 = 2048;
        v15 = v6;
        _os_log_impl(&dword_2217C1000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully activated transport %p", (uint8_t *)&v12, 0x16u);
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      id v11 = [WeakRetained delegate];
      if (objc_opt_respondsToSelector()) {
        [v11 nodeController:WeakRetained didAddTransport:v6];
      }
    }
  }
}

void __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_70(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained executionContext];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_2;
    v6[3] = &unk_2645CBC70;
    uint64_t v5 = *(void *)(a1 + 48);
    v6[4] = v3;
    uint64_t v8 = v5;
    id v7 = *(id *)(a1 + 32);
    [v4 dispatchAsync:v6];
  }
}

void __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = COCoreLogForCategory(16);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) shortDescription];
    uint64_t v4 = *(void *)(a1 + 48);
    int v5 = 138543618;
    id v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully registered request %@", (uint8_t *)&v5, 0x16u);
  }
  if (!--*(void *)(*(void *)(a1 + 32) + 16)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_73(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained executionContext];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_2_74;
    v6[3] = &unk_2645CBC70;
    uint64_t v5 = *(void *)(a1 + 48);
    v6[4] = v3;
    uint64_t v8 = v5;
    id v7 = *(id *)(a1 + 32);
    [v4 dispatchAsync:v6];
  }
}

void __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_2_74(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = COCoreLogForCategory(16);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) shortDescription];
    uint64_t v4 = *(void *)(a1 + 48);
    int v5 = 138543618;
    id v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully registered command %@", (uint8_t *)&v5, 0x16u);
  }
  if (!--*(void *)(*(void *)(a1 + 32) + 16)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)invalidateWithReason:(int64_t)a3
{
  int v5 = [(CONodeController *)self executionContext];
  [v5 assertDispatchQueue];

  id v6 = self;
  objc_sync_enter(v6);
  records = v6->_records;
  v6->_records = 0;

  objc_sync_exit(v6);
  transports = v6->_transports;
  v6->_transports = 0;

  id v12 = [(CONodeController *)v6 node];
  uint64_t v9 = [v12 lastElectionInfoSent];
  int v10 = [(CONodeController *)v6 node];
  id v11 = [v10 lastElectionInfoReceived];
  [(CONodeController *)v6 _updateNodeState:4 currentElectionInfo:v9 incomingElectionInfo:v11 reason:a3];
}

- (void)stopWithCompletionHandler:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(CONodeController *)self executionContext];
  [v5 assertDispatchQueue];

  id v6 = [(CONodeController *)self node];
  __int16 v7 = [v6 lastElectionInfoSent];
  uint64_t v8 = [(CONodeController *)self node];
  uint64_t v9 = [v8 lastElectionInfoReceived];
  [(CONodeController *)self _updateNodeState:3 currentElectionInfo:v7 incomingElectionInfo:v9 reason:15];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  int v10 = [(CONodeController *)self acceptableCommands];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v11) {
    goto LABEL_13;
  }
  uint64_t v12 = *(void *)v28;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v28 != v12) {
        objc_enumerationMutation(v10);
      }
      __int16 v14 = *(void **)(*((void *)&v27 + 1) + 8 * v13);
      if ([v14 isSubclassOfClass:objc_opt_class()])
      {
        v15 = [(CONodeController *)self preferredTransport];
        [v15 deregisterRequestForClass:v14];
      }
      else
      {
        if (![v14 isSubclassOfClass:objc_opt_class()]) {
          goto LABEL_11;
        }
        v15 = [(CONodeController *)self preferredTransport];
        [v15 deregisterCommandForClass:v14];
      }

LABEL_11:
      ++v13;
    }
    while (v11 != v13);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  }
  while (v11);
LABEL_13:

  uint64_t v16 = objc_alloc_init(COMeshWithdrawalCommand);
  objc_initWeak(&location, self);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __46__CONodeController_stopWithCompletionHandler___block_invoke;
  v23[3] = &unk_2645CBA60;
  objc_copyWeak(&v25, &location);
  id v17 = v4;
  id v24 = v17;
  uint64_t v18 = (void (**)(void))MEMORY[0x223C8B4A0](v23);
  unint64_t v19 = [(CONodeController *)self preferredTransport];

  if (v19)
  {
    v20 = [(CONodeController *)self preferredTransport];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __46__CONodeController_stopWithCompletionHandler___block_invoke_2;
    v21[3] = &unk_2645CC808;
    uint64_t v22 = v18;
    [v20 sendCommand:v16 withCompletionHandler:v21];
  }
  else
  {
    v18[2](v18);
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __46__CONodeController_stopWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained executionContext];
    [v4 assertDispatchQueue];

    int v5 = [v3 node];
    id v6 = [v5 lastElectionInfoSent];
    __int16 v7 = [v3 node];
    uint64_t v8 = [v7 lastElectionInfoReceived];
    [v3 _updateNodeState:4 currentElectionInfo:v6 incomingElectionInfo:v8 reason:16];

    [v3 setPreferredTransport:0];
    uint64_t v9 = [MEMORY[0x263EFF980] array];
    int v10 = (void *)v3[10];
    v3[10] = v9;

    uint64_t v11 = v3;
    objc_sync_enter(v11);
    uint64_t v12 = [MEMORY[0x263EFF980] array];
    uint64_t v13 = (void *)v11[9];
    v11[9] = v12;

    objc_sync_exit(v11);
    __int16 v14 = [v11 transports];
    v15 = (void *)[v14 copy];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v21;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v16);
          }
          objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v19++), "invalidateWithError:", 0, (void)v20);
        }
        while (v17 != v19);
        uint64_t v17 = [v16 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v17);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __46__CONodeController_stopWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addDiscoveryRecord:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(CONodeController *)self executionContext];
  [v5 assertDispatchQueue];

  id v6 = [(CONodeController *)self node];
  [v6 discoveryRecordAdded:v4];

  __int16 v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = [(CONodeController *)v7 records];
  objc_sync_exit(v7);

  if ([v4 conformsToProtocol:&unk_26D3EFB70])
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v41 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v31;
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v9);
          }
          if ([*(id *)(*((void *)&v30 + 1) + 8 * v12) conformsToProtocol:&unk_26D3EFB70])
          {

            goto LABEL_31;
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v41 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
  }
  if ([v4 conformsToProtocol:&unk_26D3EEEF0])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = v8;
    uint64_t v13 = [v9 countByEnumeratingWithState:&v26 objects:v40 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v27;
      while (2)
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v9);
          }
          if ([*(id *)(*((void *)&v26 + 1) + 8 * v15) conformsToProtocol:&unk_26D3EEEF0])
          {

            goto LABEL_31;
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v9 countByEnumeratingWithState:&v26 objects:v40 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
  }
  id v16 = v7;
  objc_sync_enter(v16);
  uint64_t v17 = [(CONodeController *)v16 records];
  [v17 addObject:v4];

  id v9 = [(CONodeController *)v16 records];

  objc_sync_exit(v16);
  uint64_t v18 = COCoreLogForCategory(16);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [(CONodeController *)v16 shortDescription];
    *(_DWORD *)buf = 138543874;
    v35 = v19;
    __int16 v36 = 2112;
    id v37 = v4;
    __int16 v38 = 2112;
    id v39 = v9;
    _os_log_impl(&dword_2217C1000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Adding discovery record %@ to our list. New list = %@", buf, 0x20u);
  }
  if ([v4 conformsToProtocol:&unk_26D3EFB70]
    && ([(CONodeController *)v16 rapportTransport],
        long long v20 = objc_claimAutoreleasedReturnValue(),
        v20,
        v20))
  {
    long long v21 = COCoreLogForCategory(16);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      long long v22 = [(CONodeController *)v16 shortDescription];
      *(_DWORD *)buf = 138543618;
      v35 = v22;
      __int16 v36 = 2112;
      id v37 = v4;
      _os_log_impl(&dword_2217C1000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ rapport transport already exists. Ignoring record %@.", buf, 0x16u);
    }
  }
  else
  {
    objc_initWeak((id *)buf, v16);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __39__CONodeController_addDiscoveryRecord___block_invoke;
    v23[3] = &unk_2645CE808;
    objc_copyWeak(&v25, (id *)buf);
    id v24 = v4;
    [(CONodeController *)v16 _createAndActivateTransportForRecord:v24 withCompletionHandler:v23];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
LABEL_31:
}

void __39__CONodeController_addDiscoveryRecord___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained executionContext];
    [v9 assertDispatchQueue];

    if (v6)
    {
      uint64_t v10 = COCoreLogForCategory(16);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __39__CONodeController_addDiscoveryRecord___block_invoke_cold_1(v8);
      }

      id v11 = v8;
      objc_sync_enter(v11);
      uint64_t v12 = [v11 records];
      [v12 removeObject:*(void *)(a1 + 32)];

      objc_sync_exit(v11);
    }
  }
}

- (void)removeDiscoveryRecord:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CONodeController *)self executionContext];
  [v5 assertDispatchQueue];

  id v6 = &selRef__alarmManagerAlarmFired_;
  uint64_t v7 = [v4 conformsToProtocol:&unk_26D3EFB70];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = [(CONodeController *)self transports];
  uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v24 = self;
    uint64_t v10 = *(void *)v28;
    while (2)
    {
      uint64_t v11 = 0;
      uint64_t v25 = v9;
      do
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * v11);
        uint64_t v13 = [v12 record];
        if ((v7 & [v13 conformsToProtocol:v6[5]]) == 1)
        {
          [v4 IDSIdentifier];
          uint64_t v14 = v10;
          uint64_t v15 = v7;
          id v16 = v4;
          v18 = uint64_t v17 = v6;
          uint64_t v19 = [v13 IDSIdentifier];
          char v20 = [v18 isEqualToString:v19];

          id v6 = v17;
          id v4 = v16;
          uint64_t v7 = v15;
          uint64_t v10 = v14;
          uint64_t v9 = v25;
          if (v20) {
            goto LABEL_13;
          }
        }
        else if ([v4 isEqual:v13])
        {
LABEL_13:
          id v21 = v12;

          goto LABEL_14;
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v9) {
        continue;
      }
      break;
    }
    id v21 = 0;
LABEL_14:
    self = v24;
  }
  else
  {
    id v21 = 0;
  }

  long long v22 = [(CONodeController *)self node];
  [v22 discoveryRecordRemoved:v4];

  long long v23 = [MEMORY[0x263F087E8] errorWithDomain:0x26D3D6748 code:-5001 userInfo:0];
  [v21 invalidateWithError:v23];
}

- (void)sendCommand:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CONodeController *)self executionContext];
  [v8 assertDispatchQueue];

  objc_opt_class();
  objc_opt_class();
  objc_opt_class();
  uint64_t v9 = [(CONodeController *)self sentElements];
  uint64_t v10 = (void *)MEMORY[0x223C8B4A0](v7);
  [v9 setObject:v10 forKey:v6];

  objc_initWeak(&location, self);
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [(CONodeController *)self preferredTransport];
    uint64_t v12 = [v6 command];
    uint64_t v13 = v17;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __54__CONodeController_sendCommand_withCompletionHandler___block_invoke;
    v17[3] = &unk_2645CE830;
    uint64_t v14 = &v18;
    objc_copyWeak(&v18, &location);
    v17[4] = v6;
    [v11 sendRequest:v12 withResponseHandler:v17];
  }
  else
  {
    uint64_t v11 = [(CONodeController *)self preferredTransport];
    uint64_t v12 = [v6 command];
    uint64_t v13 = v15;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __54__CONodeController_sendCommand_withCompletionHandler___block_invoke_133;
    v15[3] = &unk_2645CCC20;
    uint64_t v14 = &v16;
    objc_copyWeak(&v16, &location);
    v15[4] = v6;
    [v11 sendCommand:v12 withCompletionHandler:v15];
  }

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __54__CONodeController_sendCommand_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained) {
    goto LABEL_14;
  }
  if (v6)
  {
    uint64_t v9 = [COMeshNode alloc];
    uint64_t v10 = [WeakRetained node];
    uint64_t v11 = [(COMeshNode *)v9 initWithNode:v10];

    [v6 _setSender:v11];
  }
  if (v7)
  {
    uint64_t v12 = COCoreLogForCategory(16);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v21 = [WeakRetained shortDescription];
      long long v22 = [*(id *)(a1 + 32) command];
      int v23 = 138543874;
      id v24 = v21;
      __int16 v25 = 2112;
      long long v26 = v22;
      __int16 v27 = 2112;
      id v28 = v7;
      _os_log_error_impl(&dword_2217C1000, v12, OS_LOG_TYPE_ERROR, "%{public}@ request %@ failed with error %@", (uint8_t *)&v23, 0x20u);
    }
    uint64_t v13 = [v7 domain];
    if (![v13 isEqualToString:@"COMeshNodeErrorDomain"]) {
      goto LABEL_10;
    }
    uint64_t v14 = [v7 code];

    if (v14 == -4000)
    {
      uint64_t v13 = [WeakRetained node];
      uint64_t v15 = [v13 lastElectionInfoSent];
      id v16 = [WeakRetained node];
      uint64_t v17 = [v16 lastElectionInfoReceived];
      [WeakRetained _updateNodeState:2 currentElectionInfo:v15 incomingElectionInfo:v17 reason:14];

LABEL_10:
    }
  }
  id v18 = [WeakRetained sentElements];
  uint64_t v19 = [v18 objectForKey:*(void *)(a1 + 32)];

  if (v19) {
    ((void (**)(void, void, id, id))v19)[2](v19, *(void *)(a1 + 32), v6, v7);
  }
  char v20 = [WeakRetained sentElements];
  [v20 removeObjectForKey:*(void *)(a1 + 32)];

LABEL_14:
}

void __54__CONodeController_sendCommand_withCompletionHandler___block_invoke_133(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
    {
      id v5 = COCoreLogForCategory(16);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = [WeakRetained shortDescription];
        uint64_t v10 = [*(id *)(a1 + 32) command];
        int v11 = 138543874;
        uint64_t v12 = v9;
        __int16 v13 = 2112;
        uint64_t v14 = v10;
        __int16 v15 = 2112;
        id v16 = v3;
        _os_log_error_impl(&dword_2217C1000, v5, OS_LOG_TYPE_ERROR, "%{public}@ command %@ failed with error %@", (uint8_t *)&v11, 0x20u);
      }
    }
    id v6 = [WeakRetained sentElements];
    id v7 = [v6 objectForKey:*(void *)(a1 + 32)];

    if (v7) {
      ((void (**)(void, void, void, id))v7)[2](v7, *(void *)(a1 + 32), 0, v3);
    }
    uint64_t v8 = [WeakRetained sentElements];
    [v8 removeObjectForKey:*(void *)(a1 + 32)];
  }
}

- (void)sendPing
{
  id v3 = [(CONodeController *)self executionContext];
  [v3 assertDispatchQueue];

  id v4 = [(CONodeController *)self preferredTransport];
  [(CONodeController *)self _sendPingUsingTransport:v4];
}

- (void)markInactive
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = COCoreLogForCategory(16);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(CONodeController *)self shortDescription];
    int v7 = 138543362;
    uint64_t v8 = v4;
    _os_log_impl(&dword_2217C1000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ clearing remote constituent identifier to nil", (uint8_t *)&v7, 0xCu);
  }
  id v5 = [(CONodeController *)self node];
  [v5 setRemote:0];

  id v6 = [(CONodeController *)self preferredTransport];
  [v6 setRemote:0];
}

- (id)computePreferredTransport
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [(CONodeController *)self executionContext];
  [v3 assertDispatchQueue];

  id v4 = [(CONodeController *)self transports];
  id v5 = (id)[v4 count];

  if (v5)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [(CONodeController *)self transports];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v5 = v11;

      if (v5) {
        goto LABEL_13;
      }
    }
    else
    {
LABEL_10:
    }
    uint64_t v12 = [(CONodeController *)self transports];
    id v5 = [v12 firstObject];
  }
LABEL_13:
  return v5;
}

- (void)updateElectionInfo:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CONodeController *)self executionContext];
  [v5 assertDispatchQueue];

  id v6 = [(CONodeController *)self executionContext];
  int v7 = [v6 leaderElectionConfigured];

  if (v7)
  {
    uint64_t v8 = [(CONodeController *)self node];
    uint64_t v9 = [v8 state];

    if (self->_activated && v9 != 3 && v9 != 4)
    {
      switch([(CONodeController *)self _nodeControllerStateFromNodeState])
      {
        case 0:
          uint64_t v10 = [(CONodeController *)self _electionRequestWithElectionInfo:v4];
          int v11 = [(CONodeController *)self preferredTransport];
          uint64_t v12 = self;
          __int16 v13 = v10;
          uint64_t v14 = 1;
          goto LABEL_8;
        case 2:
          uint64_t v10 = [(CONodeController *)self _electionRequestWithElectionInfo:v4];
          int v11 = [(CONodeController *)self preferredTransport];
          uint64_t v12 = self;
          __int16 v13 = v10;
          uint64_t v14 = 2;
LABEL_8:
          [(CONodeController *)v12 _sendProbeRequest:v13 withState:v14 usingTransport:v11];
          break;
        case 5:
          long long v15 = [(CONodeController *)self node];
          uint64_t v16 = [v15 state];

          if (v16 != 5) {
            goto LABEL_10;
          }
          long long v17 = [(CONodeController *)self node];
          id v18 = [v17 lastElectionInfoSent];
          char v19 = [v4 isEqual:v18];

          if (v19) {
            goto LABEL_10;
          }
          char v20 = [(CONodeController *)self node];
          uint64_t v10 = [v20 backoffResponse];

          id v21 = COCoreLogForCategory(16);
          BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
          if (v10)
          {
            if (v22)
            {
              int v23 = [(CONodeController *)self shortDescription];
              int v31 = 138543618;
              uint64_t v32 = v23;
              __int16 v33 = 2048;
              uint64_t v34 = [v4 generation];
              _os_log_impl(&dword_2217C1000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ delayed BALLOT (%llu) response since our ballot or generation has changed", (uint8_t *)&v31, 0x16u);
            }
            int v11 = [(CONodeController *)self _ballotResponseWithElectionInfo:v4];
            ((void (**)(void, void *, void))v10)[2](v10, v11, 0);
            id v24 = [(CONodeController *)self node];
            [v24 setBackoffResponse:0];
          }
          else
          {
            if (v22)
            {
              long long v30 = [(CONodeController *)self shortDescription];
              int v31 = 138543618;
              uint64_t v32 = v30;
              __int16 v33 = 2048;
              uint64_t v34 = [v4 generation];
              _os_log_impl(&dword_2217C1000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ our ballot or generation has changed. Issuing a new election with generation (%llu)", (uint8_t *)&v31, 0x16u);
            }
            int v11 = [(CONodeController *)self _electionRequestWithElectionInfo:v4];
            id v24 = [(CONodeController *)self preferredTransport];
            [(CONodeController *)self _sendElectionRequest:v11 usingTransport:v24];
          }

          break;
        case 6:
          __int16 v25 = [(CONodeController *)self node];
          long long v26 = [v25 lastElectionInfoSent];
          char v27 = [v4 hasSameGenerationAndLeader:v26];

          if (v27) {
            goto LABEL_10;
          }
          id v28 = COCoreLogForCategory(16);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v29 = [(CONodeController *)self shortDescription];
            int v31 = 138543618;
            uint64_t v32 = v29;
            __int16 v33 = 2048;
            uint64_t v34 = [v4 generation];
            _os_log_impl(&dword_2217C1000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ starting ELECTION (%llu)", (uint8_t *)&v31, 0x16u);
          }
          uint64_t v10 = [(CONodeController *)self _electionRequestWithElectionInfo:v4];
          int v11 = [(CONodeController *)self preferredTransport];
          [(CONodeController *)self _sendElectionRequest:v10 usingTransport:v11];
          break;
        default:
          goto LABEL_10;
      }
    }
  }
LABEL_10:
}

- (void)inquireForTransport:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 record];
  char v6 = [v5 requiresInquiry];

  int v7 = COCoreLogForCategory(16);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = self;
      _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ attempting to inquire", buf, 0xCu);
    }

    uint64_t v9 = -[_COMeshControllerPing initWithTimeout:listeningPort:]([_COMeshControllerPing alloc], "initWithTimeout:listeningPort:", [v4 listeningPort], 0.0);
    if ([(CONodeController *)self state] != 6) {
      [(CONodeController *)self _updateNodeState:1 currentElectionInfo:0 incomingElectionInfo:0 reason:1];
    }
    objc_initWeak((id *)buf, self);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __40__CONodeController_inquireForTransport___block_invoke;
    v11[3] = &unk_2645CE858;
    objc_copyWeak(&v12, (id *)buf);
    [v4 sendRequest:v9 withResponseHandler:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v8)
    {
      uint64_t v10 = [(CONodeController *)self shortDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ transport %@ does not require inquiry. Moving to processing", buf, 0x16u);
    }
    [(CONodeController *)self _updateNodeState:14 currentElectionInfo:0 incomingElectionInfo:0 reason:2];
  }
}

void __40__CONodeController_inquireForTransport___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v7 = COCoreLogForCategory(16);
    BOOL v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __40__CONodeController_inquireForTransport___block_invoke_cold_1();
      }
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [WeakRetained shortDescription];
        int v10 = 138543362;
        int v11 = v9;
        _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Inquiry successful", (uint8_t *)&v10, 0xCu);
      }
      [WeakRetained _updateNodeState:14 currentElectionInfo:0 incomingElectionInfo:0 reason:2];
    }
  }
}

- (void)_sendProbeRequest:(id)a3 withState:(int64_t)a4 usingTransport:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (self->_activated)
  {
    int v10 = [(CONodeController *)self node];
    char v11 = [v10 hasOutstandingProbe];

    if ((v11 & 1) == 0)
    {
      uint64_t v12 = [MEMORY[0x263EFF9D0] null];
      [v9 isEqual:v12];

      __int16 v13 = COCoreLogForCategory(16);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [(CONodeController *)self shortDescription];
        *(_DWORD *)buf = 138543618;
        id v24 = v14;
        __int16 v25 = 2112;
        id v26 = v8;
        _os_log_impl(&dword_2217C1000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ probing with election request %@", buf, 0x16u);
      }
      __int16 v15 = [[COElectionInfo alloc] initWithCommand:v8];
      id v16 = [(CONodeController *)self node];
      uint64_t v17 = [v16 lastElectionInfoReceived];
      [(CONodeController *)self _updateNodeState:a4 currentElectionInfo:v15 incomingElectionInfo:v17 reason:0];

      id v18 = [(CONodeController *)self node];
      [v18 setLastElectionInfoSent:v15];

      char v19 = [(CONodeController *)self node];
      [v19 setOutstandingProbe:1];

      objc_initWeak((id *)buf, self);
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __63__CONodeController__sendProbeRequest_withState_usingTransport___block_invoke;
      v20[3] = &unk_2645CE830;
      objc_copyWeak(&v22, (id *)buf);
      id v21 = v9;
      [v21 sendRequest:v8 withResponseHandler:v20];

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __63__CONodeController__sendProbeRequest_withState_usingTransport___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v10 = WeakRetained;
  if (WeakRetained)
  {
    char v11 = [WeakRetained node];
    [v11 setOutstandingProbe:0];

    [v10 _handleResponseToCoreRequest:v12 response:v7 error:v8 usingTransport:*(void *)(a1 + 32)];
  }
}

- (void)_sendElectionRequest:(id)a3 usingTransport:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_activated)
  {
    id v8 = [(CONodeController *)self node];
    char v9 = [v8 hasOutstandingRequest];

    if ((v9 & 1) == 0)
    {
      int v10 = [[COElectionInfo alloc] initWithCommand:v6];
      char v11 = [(CONodeController *)self node];
      id v12 = [v11 lastElectionInfoReceived];
      [(CONodeController *)self _updateNodeState:6 currentElectionInfo:v10 incomingElectionInfo:v12 reason:10];

      __int16 v13 = [[COElectionInfo alloc] initWithCommand:v6];
      uint64_t v14 = [(CONodeController *)self node];
      [v14 setLastElectionInfoSent:v13];

      objc_initWeak(&location, self);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __56__CONodeController__sendElectionRequest_usingTransport___block_invoke;
      v15[3] = &unk_2645CE830;
      objc_copyWeak(&v17, &location);
      id v16 = v7;
      [v16 sendRequest:v6 withResponseHandler:v15];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
}

void __56__CONodeController__sendElectionRequest_usingTransport___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v10 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleResponseToCoreRequest:v11 response:v7 error:v8 usingTransport:*(void *)(a1 + 32)];
  }
}

- (void)_sendPingUsingTransport:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_activated)
  {
    if ([v4 conformsToProtocol:&unk_26D3EE1A0])
    {
      id v6 = [(CONodeController *)self node];
      char v7 = [v6 hasPendingPing];

      if ((v7 & 1) == 0)
      {
        id v8 = [(CONodeController *)self node];
        [v8 setPendingPing:1];

        objc_initWeak(&location, self);
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __44__CONodeController__sendPingUsingTransport___block_invoke;
        v10[3] = &unk_2645CE830;
        objc_copyWeak(&v12, &location);
        id v11 = v5;
        [v11 pingWithCallback:v10];

        objc_destroyWeak(&v12);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      char v9 = COCoreLogForCategory(16);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        [(CONodeController *)self _sendPingUsingTransport:v9];
      }
    }
  }
}

void __44__CONodeController__sendPingUsingTransport___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v10 = WeakRetained;
  if (WeakRetained)
  {
    id v11 = [WeakRetained node];
    [v11 setPendingPing:0];

    [v10 _handleResponseToCoreRequest:v12 response:v7 error:v8 usingTransport:*(void *)(a1 + 32)];
  }
}

- (void)_sendBallotResponse:(id)a3 usingTransport:(id)a4 callback:(id)a5
{
  if (self->_activated)
  {
    id v7 = (void (**)(id, id, void))a5;
    id v8 = a3;
    __int16 v13 = [[COElectionInfo alloc] initWithCommand:v8];
    char v9 = [(CONodeController *)self node];
    int v10 = [v9 lastElectionInfoReceived];
    [(CONodeController *)self _updateNodeState:7 currentElectionInfo:v13 incomingElectionInfo:v10 reason:10];

    id v11 = [[COElectionInfo alloc] initWithCommand:v8];
    id v12 = [(CONodeController *)self node];
    [v12 setLastElectionInfoSent:v11];

    v7[2](v7, v8, 0);
  }
}

- (void)_sendVoteRequest:(id)a3 usingTransport:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_activated)
  {
    id v8 = [(CONodeController *)self node];
    char v9 = [v8 hasOutstandingRequest];

    if ((v9 & 1) == 0)
    {
      int v10 = [[COElectionInfo alloc] initWithCommand:v6];
      id v11 = [(CONodeController *)self node];
      id v12 = [v11 lastElectionInfoReceived];
      [(CONodeController *)self _updateNodeState:8 currentElectionInfo:v10 incomingElectionInfo:v12 reason:10];

      __int16 v13 = [[COElectionInfo alloc] initWithCommand:v6];
      uint64_t v14 = [(CONodeController *)self node];
      [v14 setLastElectionInfoSent:v13];

      objc_initWeak(&location, self);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __52__CONodeController__sendVoteRequest_usingTransport___block_invoke;
      v15[3] = &unk_2645CE830;
      objc_copyWeak(&v17, &location);
      id v16 = v7;
      [v16 sendRequest:v6 withResponseHandler:v15];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
}

void __52__CONodeController__sendVoteRequest_usingTransport___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v10 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleResponseToCoreRequest:v11 response:v7 error:v8 usingTransport:*(void *)(a1 + 32)];
  }
}

- (void)_sendAcceptResponse:(id)a3 usingTransport:(id)a4 callback:(id)a5
{
  if (self->_activated)
  {
    id v7 = (void (**)(id, id, void))a5;
    id v8 = a3;
    __int16 v13 = [[COElectionInfo alloc] initWithCommand:v8];
    char v9 = [(CONodeController *)self node];
    int v10 = [v9 lastElectionInfoReceived];
    [(CONodeController *)self _updateNodeState:9 currentElectionInfo:v13 incomingElectionInfo:v10 reason:10];

    id v11 = [[COElectionInfo alloc] initWithCommand:v8];
    id v12 = [(CONodeController *)self node];
    [v12 setLastElectionInfoSent:v11];

    v7[2](v7, v8, 0);
  }
}

- (void)_handleElectionRequest:(id)a3 fromTransport:(id)a4 callback:(id)a5
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_activated)
  {
    id v30 = v10;
    id v11 = [[COElectionInfo alloc] initWithCommand:v8];
    id v12 = [(CONodeController *)self node];
    id v28 = [v12 lastElectionInfoReceived];

    __int16 v13 = [(CONodeController *)self node];
    [v13 setLastElectionInfoReceived:v11];

    uint64_t v14 = [v8 ballot];
    [(CONodeController *)self _updateKnownDiscovery:v14];

    uint64_t v29 = [v9 remote];
    uint64_t v15 = [(COElectionInfo *)v11 generation];
    int v16 = [v8 variant];
    int v31 = [(COElectionInfo *)v11 ballot];
    id v17 = COCoreLogForCategory(16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = [(CONodeController *)self shortDescription];
      id v26 = [v29 software];
      uint64_t v25 = [v8 rapportTransactionID];
      id v18 = [v31 candidates];
      uint64_t v24 = [v18 count];
      char v19 = [v31 candidates];
      char v20 = [v19 firstObject];

      *(_DWORD *)buf = 138545154;
      v40 = v27;
      __int16 v41 = 2048;
      uint64_t v42 = v15;
      __int16 v43 = 1024;
      int v44 = v16;
      __int16 v45 = 2048;
      id v46 = v9;
      __int16 v47 = 2114;
      v48 = v26;
      __int16 v49 = 2048;
      uint64_t v50 = v25;
      __int16 v51 = 2048;
      uint64_t v52 = v24;
      __int16 v53 = 2114;
      v54 = v20;
      _os_log_impl(&dword_2217C1000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ received ELECTION (%llu:%d) from %p (%{public}@) XID 0x%llX - (%lu, %{public}@)", buf, 0x4Eu);
    }
    objc_initWeak((id *)buf, self);
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    id v32[2] = __66__CONodeController__handleElectionRequest_fromTransport_callback___block_invoke;
    v32[3] = &unk_2645CE880;
    objc_copyWeak(&v38, (id *)buf);
    id v21 = v11;
    __int16 v33 = v21;
    id v22 = v29;
    id v34 = v22;
    id v23 = v28;
    id v35 = v23;
    id v36 = v9;
    id v37 = v30;
    [(CONodeController *)self _updateDelegateWithBallotCommand:v8 withCompletionHandler:v32];

    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)buf);

    id v10 = v30;
  }
}

void __66__CONodeController__handleElectionRequest_fromTransport_callback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _updateNodeState:10 currentElectionInfo:v3 incomingElectionInfo:*(void *)(a1 + 32) reason:10];
    id v6 = [v5 executionContext];
    id v7 = [v6 constituentForMe];

    if (([*(id *)(a1 + 40) supportsBackoff] & 1) == 0
      && (unint64_t)[v7 flags] >> 31
      && [*(id *)(a1 + 32) isEqual:*(void *)(a1 + 48)])
    {
      id v8 = COCoreLogForCategory(16);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [v5 shortDescription];
        int v11 = 138543362;
        id v12 = v9;
        _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ backed off legacy node", (uint8_t *)&v11, 0xCu);
      }
      [v5 _updateNodeState:5 currentElectionInfo:v3 incomingElectionInfo:*(void *)(a1 + 32) reason:10];
    }
    else
    {
      id v10 = [v5 _ballotResponseWithElectionInfo:v3];
      [v5 _sendBallotResponse:v10 usingTransport:*(void *)(a1 + 56) callback:*(void *)(a1 + 64)];
    }
  }
}

- (void)_handleBallotResponse:(id)a3 fromTransport:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (self->_activated)
  {
    id v8 = [[COElectionInfo alloc] initWithCommand:v6];
    id v9 = [(CONodeController *)self node];
    [v9 setLastElectionInfoReceived:v8];

    id v10 = [v6 ballot];
    [(CONodeController *)self _updateKnownDiscovery:v10];

    id v22 = [v7 remote];
    int v11 = [v6 variant];
    id v12 = COCoreLogForCategory(16);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [(CONodeController *)self shortDescription];
      uint64_t v19 = [(COElectionInfo *)v8 generation];
      char v20 = [v22 software];
      uint64_t v18 = [v6 rapportTransactionID];
      uint64_t v13 = [(COElectionInfo *)v8 ballot];
      uint64_t v14 = [v13 candidates];
      uint64_t v15 = [v14 count];
      int v16 = [(COElectionInfo *)v8 leader];
      *(_DWORD *)buf = 138545154;
      id v28 = v21;
      __int16 v29 = 2048;
      uint64_t v30 = v19;
      __int16 v31 = 1024;
      int v32 = v11;
      __int16 v33 = 2048;
      id v34 = v7;
      __int16 v35 = 2114;
      id v36 = v20;
      __int16 v37 = 2048;
      uint64_t v38 = v18;
      __int16 v39 = 2048;
      uint64_t v40 = v15;
      __int16 v41 = 2114;
      uint64_t v42 = v16;
      _os_log_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ received BALLOT (%llu:%d) from %p (%{public}@) XID 0x%llX - (%lu, %{public}@)", buf, 0x4Eu);
    }
    objc_initWeak((id *)buf, self);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __56__CONodeController__handleBallotResponse_fromTransport___block_invoke;
    v23[3] = &unk_2645CE8A8;
    objc_copyWeak(&v26, (id *)buf);
    id v17 = v8;
    uint64_t v24 = v17;
    id v25 = v7;
    [(CONodeController *)self _updateDelegateWithBallotCommand:v6 withCompletionHandler:v23];

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
}

void __56__CONodeController__handleBallotResponse_fromTransport___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _updateNodeState:11 currentElectionInfo:v3 incomingElectionInfo:*(void *)(a1 + 32) reason:10];
    if ([v3 hasSameGenerationAndLeader:*(void *)(a1 + 32)])
    {
      id v6 = [v5 _voteRequestWithElectionInfo:v3];
      [v5 _sendVoteRequest:v6 usingTransport:*(void *)(a1 + 40)];
    }
    else
    {
      id v7 = [v5 node];
      id v8 = [v7 lastElectionInfoSent];
      int v9 = [v3 isEqual:v8];

      if (v9)
      {
        [v5 _updateNodeState:5 currentElectionInfo:v3 incomingElectionInfo:*(void *)(a1 + 32) reason:10];
        id v6 = COCoreLogForCategory(16);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = [v5 shortDescription];
          uint64_t v11 = *(void *)(a1 + 40);
          int v12 = 138543618;
          uint64_t v13 = v10;
          __int16 v14 = 2048;
          uint64_t v15 = v11;
          _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ backed off %p", (uint8_t *)&v12, 0x16u);
        }
      }
      else
      {
        id v6 = [v5 _electionRequestWithElectionInfo:v3];
        [v5 _sendElectionRequest:v6 usingTransport:*(void *)(a1 + 40)];
      }
    }
  }
}

- (void)_handleVoteRequest:(id)a3 fromTransport:(id)a4 callback:(id)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_activated)
  {
    id v26 = v10;
    uint64_t v11 = [[COElectionInfo alloc] initWithCommand:v8];
    int v12 = [(CONodeController *)self node];
    [v12 setLastElectionInfoReceived:v11];

    uint64_t v13 = [v8 ballot];
    [(CONodeController *)self _updateKnownDiscovery:v13];

    id v25 = [v9 remote];
    uint64_t v24 = [(COElectionInfo *)v11 generation];
    int v23 = [v8 variant];
    uint64_t v27 = [(COElectionInfo *)v11 ballot];
    __int16 v14 = COCoreLogForCategory(16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = [(CONodeController *)self shortDescription];
      uint64_t v15 = [v25 software];
      uint64_t v21 = [v8 rapportTransactionID];
      uint64_t v16 = [v27 candidates];
      uint64_t v17 = [v16 count];
      uint64_t v18 = [v27 candidates];
      uint64_t v19 = [v18 firstObject];

      *(_DWORD *)buf = 138545154;
      id v34 = v22;
      __int16 v35 = 2048;
      uint64_t v36 = v24;
      __int16 v37 = 1024;
      int v38 = v23;
      __int16 v39 = 2048;
      id v40 = v9;
      __int16 v41 = 2114;
      uint64_t v42 = v15;
      __int16 v43 = 2048;
      uint64_t v44 = v21;
      __int16 v45 = 2048;
      uint64_t v46 = v17;
      __int16 v47 = 2114;
      v48 = v19;
      _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ received VOTE (%llu:%d) from %p (%{public}@) XID 0x%llX - (%lu, %{public}@)", buf, 0x4Eu);
    }
    objc_initWeak((id *)buf, self);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __62__CONodeController__handleVoteRequest_fromTransport_callback___block_invoke;
    v28[3] = &unk_2645CE8D0;
    objc_copyWeak(&v32, (id *)buf);
    char v20 = v11;
    __int16 v29 = v20;
    id v30 = v9;
    id v31 = v26;
    [(CONodeController *)self _updateDelegateWithBallotCommand:v8 withCompletionHandler:v28];

    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);

    id v10 = v26;
  }
}

void __62__CONodeController__handleVoteRequest_fromTransport_callback___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _updateNodeState:12 currentElectionInfo:v8 incomingElectionInfo:*(void *)(a1 + 32) reason:10];
    if ([v8 hasSameGenerationAndLeader:*(void *)(a1 + 32)])
    {
      id v5 = [v4 _acceptResponseWithElectionInfo:v8];
      [v4 _sendAcceptResponse:v5 usingTransport:*(void *)(a1 + 40) callback:*(void *)(a1 + 48)];
      id v6 = [v4 node];
      uint64_t v7 = [v6 state];

      if (v7 != 14) {
        [v4 _updateNodeState:14 currentElectionInfo:v8 incomingElectionInfo:*(void *)(a1 + 32) reason:9];
      }
    }
    else
    {
      id v5 = [v4 _ballotResponseWithElectionInfo:v8];
      [v4 _sendBallotResponse:v5 usingTransport:*(void *)(a1 + 40) callback:*(void *)(a1 + 48)];
    }
  }
}

- (void)_handleAcceptResponse:(id)a3 fromTransport:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (self->_activated)
  {
    id v8 = [[COElectionInfo alloc] initWithCommand:v6];
    id v9 = [(CONodeController *)self node];
    [v9 setLastElectionInfoReceived:v8];

    id v10 = [v6 ballot];
    [(CONodeController *)self _updateKnownDiscovery:v10];

    id v22 = [v7 remote];
    uint64_t v21 = [(COElectionInfo *)v8 generation];
    int v20 = [v6 variant];
    int v23 = [(COElectionInfo *)v8 ballot];
    uint64_t v11 = COCoreLogForCategory(16);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [(CONodeController *)self shortDescription];
      int v12 = [v22 software];
      uint64_t v18 = [v6 rapportTransactionID];
      uint64_t v13 = [v23 candidates];
      uint64_t v14 = [v13 count];
      uint64_t v15 = [v23 candidates];
      uint64_t v16 = [v15 firstObject];

      *(_DWORD *)buf = 138545154;
      __int16 v29 = v19;
      __int16 v30 = 2048;
      uint64_t v31 = v21;
      __int16 v32 = 1024;
      int v33 = v20;
      __int16 v34 = 2048;
      id v35 = v7;
      __int16 v36 = 2114;
      __int16 v37 = v12;
      __int16 v38 = 2048;
      uint64_t v39 = v18;
      __int16 v40 = 2048;
      uint64_t v41 = v14;
      __int16 v42 = 2114;
      __int16 v43 = v16;
      _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ received ACCEPT (%llu:%d) from %p (%{public}@) XID 0x%llX - (%lu, %{public}@)", buf, 0x4Eu);
    }
    objc_initWeak((id *)buf, self);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __56__CONodeController__handleAcceptResponse_fromTransport___block_invoke;
    v24[3] = &unk_2645CE8A8;
    objc_copyWeak(&v27, (id *)buf);
    uint64_t v17 = v8;
    id v25 = v17;
    id v26 = v7;
    [(CONodeController *)self _updateDelegateWithBallotCommand:v6 withCompletionHandler:v24];

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }
}

void __56__CONodeController__handleAcceptResponse_fromTransport___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _updateNodeState:13 currentElectionInfo:v3 incomingElectionInfo:*(void *)(a1 + 32) reason:10];
    int v6 = [v3 hasSameGenerationAndLeader:*(void *)(a1 + 32)];
    id v7 = [v5 node];
    id v8 = v7;
    if (v6)
    {
      uint64_t v9 = [v7 state];

      if (v9 != 14) {
        [v5 _updateNodeState:14 currentElectionInfo:v3 incomingElectionInfo:*(void *)(a1 + 32) reason:9];
      }
    }
    else
    {
      id v10 = [v7 lastElectionInfoSent];
      int v11 = [v3 isEqual:v10];

      if (v11)
      {
        [v5 _updateNodeState:5 currentElectionInfo:v3 incomingElectionInfo:*(void *)(a1 + 32) reason:10];
        int v12 = COCoreLogForCategory(16);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = [v5 shortDescription];
          uint64_t v14 = *(void *)(a1 + 40);
          int v15 = 138543618;
          uint64_t v16 = v13;
          __int16 v17 = 2048;
          uint64_t v18 = v14;
          _os_log_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ backed off %p", (uint8_t *)&v15, 0x16u);
        }
      }
      else
      {
        int v12 = [v5 _electionRequestWithElectionInfo:v3];
        [v5 _sendElectionRequest:v12 usingTransport:*(void *)(a1 + 40)];
      }
    }
  }
}

- (void)_handleWithdraw:(id)a3 fromTransport:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (self->_activated)
  {
    id v5 = COCoreLogForCategory(16);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(CONodeController *)self shortDescription];
      int v11 = 138543362;
      int v12 = v6;
      _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ received a withdraw command", (uint8_t *)&v11, 0xCu);
    }
    id v7 = [(CONodeController *)self node];
    id v8 = [v7 lastElectionInfoSent];
    uint64_t v9 = [(CONodeController *)self node];
    id v10 = [v9 lastElectionInfoReceived];
    [(CONodeController *)self _updateNodeState:1 currentElectionInfo:v8 incomingElectionInfo:v10 reason:17];
  }
}

- (void)_handleResponseToCoreRequest:(id)a3 response:(id)a4 error:(id)a5 usingTransport:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  char v15 = objc_opt_isKindOfClass();
  objc_opt_class();
  char v16 = objc_opt_isKindOfClass();
  if (v12)
  {
    if (isKindOfClass)
    {
      [(CONodeController *)self _handlePingError:v12 fromTransport:v13];
      goto LABEL_27;
    }
    __int16 v17 = COCoreLogForCategory(16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      __int16 v29 = [(CONodeController *)self shortDescription];
      int v30 = 138544130;
      uint64_t v31 = v29;
      __int16 v32 = 2112;
      int64_t v33 = (int64_t)v10;
      __int16 v34 = 2112;
      id v35 = v12;
      __int16 v36 = 2048;
      id v37 = v13;
      _os_log_error_impl(&dword_2217C1000, v17, OS_LOG_TYPE_ERROR, "%{public}@ request %@ failed with error %@ on transport %p", (uint8_t *)&v30, 0x2Au);
    }
    id v18 = [(CONodeController *)self preferredTransport];
    if (v18 == v13)
    {
      uint64_t v19 = [(CONodeController *)self transports];
      unint64_t v20 = [v19 count];

      if (v20 >= 2)
      {
        COCoreLogForCategory(16);
        uint64_t v21 = (COElectionInfo *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(&v21->super, OS_LOG_TYPE_DEFAULT))
        {
LABEL_26:

          goto LABEL_27;
        }
        id v22 = [(CONodeController *)self shortDescription];
        int64_t v23 = [(CONodeController *)self state];
        int v30 = 138543618;
        uint64_t v31 = v22;
        __int16 v32 = 2048;
        int64_t v33 = v23;
        _os_log_impl(&dword_2217C1000, &v21->super, OS_LOG_TYPE_DEFAULT, "%{public}@ alternate transport available, remaining in state %ld", (uint8_t *)&v30, 0x16u);
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
    }
    uint64_t v21 = [[COElectionInfo alloc] initWithCommand:v10];
    id v22 = [[COElectionInfo alloc] initWithCommand:v11];
    uint64_t v24 = [v12 domain];
    if ([v24 isEqualToString:*MEMORY[0x263F62C18]])
    {
      uint64_t v25 = [v12 code];

      if (v25 == -6714)
      {
        uint64_t v26 = 8;
LABEL_24:
        [(CONodeController *)self _updateNodeState:1 currentElectionInfo:v21 incomingElectionInfo:v22 reason:v26];
        goto LABEL_25;
      }
    }
    else
    {
    }
    id v27 = [v12 domain];
    if ([v27 isEqualToString:@"COMeshNodeErrorDomain"])
    {
      uint64_t v28 = [v12 code];

      if (v28 == -4000)
      {
        uint64_t v26 = 7;
        goto LABEL_24;
      }
    }
    else
    {
    }
    uint64_t v26 = 6;
    goto LABEL_24;
  }
  if (v15)
  {
    [(CONodeController *)self _handleBallotResponse:v11 fromTransport:v13];
  }
  else if (v16)
  {
    [(CONodeController *)self _handleAcceptResponse:v11 fromTransport:v13];
  }
LABEL_27:
}

- (void)_handlePingError:(id)a3 fromTransport:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CONodeController *)self executionContext];
  [v8 assertDispatchQueue];

  uint64_t v9 = COCoreLogForCategory(16);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v26 = [(CONodeController *)self shortDescription];
    int v27 = 138543874;
    uint64_t v28 = v26;
    __int16 v29 = 2112;
    id v30 = v6;
    __int16 v31 = 2048;
    id v32 = v7;
    _os_log_error_impl(&dword_2217C1000, v9, OS_LOG_TYPE_ERROR, "%{public}@ ping error %@ on transport %p", (uint8_t *)&v27, 0x20u);
  }
  id v10 = [v6 domain];
  if ([v10 isEqualToString:*MEMORY[0x263F62C18]])
  {
    if ([v6 code] == -6722)
    {

LABEL_8:
      id v12 = COCoreLogForCategory(16);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [(CONodeController *)self shortDescription];
        int v27 = 138543362;
        uint64_t v28 = v13;
        _os_log_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Going dormant", (uint8_t *)&v27, 0xCu);
      }
      uint64_t v14 = [(CONodeController *)self node];
      char v15 = [v14 lastElectionInfoSent];
      char v16 = [(CONodeController *)self node];
      __int16 v17 = [v16 lastElectionInfoReceived];
      if ([v6 code] == -6722) {
        uint64_t v18 = 11;
      }
      else {
        uint64_t v18 = 12;
      }
      uint64_t v19 = self;
      uint64_t v20 = 2;
      uint64_t v21 = v15;
      id v22 = v17;
LABEL_19:
      [(CONodeController *)v19 _updateNodeState:v20 currentElectionInfo:v21 incomingElectionInfo:v22 reason:v18];

      goto LABEL_20;
    }
    uint64_t v11 = [v6 code];

    if (v11 == -6714) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v14 = [v6 domain];
  if (![v14 isEqualToString:@"COMeshNodeErrorDomain"])
  {
LABEL_20:

    goto LABEL_21;
  }
  uint64_t v23 = [v6 code];

  if (v23 == -4000)
  {
    uint64_t v24 = COCoreLogForCategory(16);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = [(CONodeController *)self shortDescription];
      int v27 = 138543362;
      uint64_t v28 = v25;
      _os_log_impl(&dword_2217C1000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ ping failed with a framing error. Marking node as discovered", (uint8_t *)&v27, 0xCu);
    }
    uint64_t v14 = [(CONodeController *)self node];
    char v15 = [v14 lastElectionInfoSent];
    char v16 = [(CONodeController *)self node];
    __int16 v17 = [v16 lastElectionInfoReceived];
    uint64_t v19 = self;
    uint64_t v20 = 1;
    uint64_t v21 = v15;
    id v22 = v17;
    uint64_t v18 = 13;
    goto LABEL_19;
  }
LABEL_21:
}

- (void)_updateDelegateWithBallotCommand:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CONodeController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __75__CONodeController__updateDelegateWithBallotCommand_withCompletionHandler___block_invoke;
    v10[3] = &unk_2645CE8F8;
    id v11 = v7;
    [v8 nodeController:self didReceiveElectionCmd:v6 withCompletionHandler:v10];
  }
  else
  {
    uint64_t v9 = [[COElectionInfo alloc] initWithCommand:v6];
    (*((void (**)(id, COElectionInfo *))v7 + 2))(v7, v9);
  }
}

uint64_t __75__CONodeController__updateDelegateWithBallotCommand_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)_nodeControllerStateFromNodeState
{
  if ([(CONode *)self->_node state] < 1) {
    return 0;
  }
  if ([(CONode *)self->_node state] < 2) {
    return 1;
  }
  if ([(CONode *)self->_node state] < 3) {
    return 2;
  }
  if ([(CONode *)self->_node state] < 4) {
    return 3;
  }
  if ([(CONode *)self->_node state] < 5) {
    return 4;
  }
  if ([(CONode *)self->_node state] < 14) {
    return 5;
  }
  return 6;
}

- (BOOL)_isActiveState:(int64_t)a3
{
  return a3 > 4;
}

- (void)_updateNodeState:(int64_t)a3 currentElectionInfo:(id)a4 incomingElectionInfo:(id)a5 reason:(int64_t)a6
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v45 = a4;
  id v9 = a5;
  id v10 = [(CONodeController *)self transports];
  if ([v10 count] == 1)
  {
    id v11 = [v10 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      a3 = 14;
    }
  }
  int64_t v13 = [(CONodeController *)self _nodeControllerStateFromNodeState];
  if (![(CONodeController *)self _isActiveState:a3]
    || v13 != 6
    || ([v45 hasSameGenerationAndLeader:v9] & 1) == 0)
  {
    uint64_t v14 = [(CONodeController *)self node];
    int v15 = [v14 isInElectionState];

    char v16 = [(CONodeController *)self node];
    [v16 setState:a3];

    __int16 v17 = [(CONodeController *)self node];
    int v18 = [v17 isInElectionState];

    int64_t v19 = [(CONodeController *)self _nodeControllerStateFromNodeState];
    if (v13 != v19)
    {
      uint64_t v20 = COCoreLogForCategory(16);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        __int16 v43 = [(CONodeController *)self shortDescription];
        *(_DWORD *)buf = 138543874;
        uint64_t v49 = v43;
        __int16 v50 = 2048;
        int64_t v51 = v13;
        __int16 v52 = 2048;
        int64_t v53 = v19;
        _os_log_debug_impl(&dword_2217C1000, v20, OS_LOG_TYPE_DEBUG, "%{public}@ moving from state %lu to state %lu", buf, 0x20u);
      }
    }
    if (((v15 ^ 1 | v18) & 1) == 0)
    {
      uint64_t v21 = [(CONodeController *)self node];
      BOOL v22 = [v21 backoffBucket] == 0;

      if (!v22)
      {
        uint64_t v23 = [(CONodeController *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [v23 backedOffNodeMovedOutOfElection:self];
        }
      }
    }
    if (v18)
    {
      if (v15) {
        goto LABEL_21;
      }
      uint64_t v24 = [(CONodeController *)self node];
      [v24 setTotalBackedOffTime:0];

      uint64_t v25 = [(CONodeController *)self knownDiscoveryRecords];
      [v25 removeAllObjects];
    }
    else
    {
      uint64_t v26 = [(CONodeController *)self node];
      [v26 setBackoffTimer:0];

      int v27 = [(CONodeController *)self node];
      [v27 setBackoffResponse:0];

      uint64_t v25 = [(CONodeController *)self node];
      [v25 setBackoffBucket:0];
    }

LABEL_21:
    if (a3 == 5)
    {
      uint64_t v28 = [(CONodeController *)self node];
      __int16 v29 = [v28 backoffTimer];
      BOOL v30 = v29 == 0;

      if (v30)
      {
        __int16 v31 = COCoreLogForCategory(16);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          id v32 = [(CONodeController *)self shortDescription];
          *(_DWORD *)buf = 138543362;
          uint64_t v49 = v32;
          _os_log_impl(&dword_2217C1000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ creating a backoff timer for bucket 0", buf, 0xCu);
        }
        uint64_t v33 = [(CONodeController *)self executionContext];
        __int16 v34 = [v33 dispatchQueue];
        id v35 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v34);

        if (v35)
        {
          dispatch_time_t v36 = dispatch_walltime(0, 100000000);
          dispatch_source_set_timer(v35, v36, 0x5F5E100uLL, 0);
          objc_initWeak((id *)buf, self);
          handler[0] = MEMORY[0x263EF8330];
          handler[1] = 3221225472;
          handler[2] = __85__CONodeController__updateNodeState_currentElectionInfo_incomingElectionInfo_reason___block_invoke;
          handler[3] = &unk_2645CB2E0;
          objc_copyWeak(&v47, (id *)buf);
          dispatch_source_set_event_handler(v35, handler);
          id v37 = [(CONodeController *)self node];
          [v37 setBackoffBucket:0];

          uint64_t v38 = [(CONodeController *)self node];
          [v38 setBackoffTimer:v35];

          objc_destroyWeak(&v47);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          uint64_t v39 = COCoreLogForCategory(16);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            -[COMeshNodeStateTracker setElectionStage:](v39);
          }
        }
      }
    }
    if (v13 != v19)
    {
      __int16 v40 = [(CONodeController *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v41 = [(CONodeController *)self node];
        __int16 v42 = [v41 lastElectionInfoSent];
        [v40 nodeController:self didUpdateState:v13 to:v19 reason:a6 withLastSentElectionInfo:v42];
      }
    }
  }
}

void __85__CONodeController__updateNodeState_currentElectionInfo_incomingElectionInfo_reason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained didFireBackoffTimer];
    id WeakRetained = v2;
  }
}

- (void)didFireBackoffTimer
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = [(CONodeController *)self node];
  unint64_t v4 = [v3 backoffBucket];

  id v5 = [(CONodeController *)self node];
  uint64_t v6 = [v5 totalBackedOffTime];

  uint64_t v7 = CONodeStateBackoffSeries[v4];
  id v8 = [(CONodeController *)self node];
  [v8 setTotalBackedOffTime:v7 + v6];

  if (v4 <= 0xC)
  {
    id v9 = [(CONodeController *)self node];
    [v9 setBackoffBucket:++v4];

    uint64_t v7 = CONodeStateBackoffSeries[v4];
  }
  uint64_t v10 = 1000000 * v7;
  dispatch_time_t v11 = dispatch_walltime(0, 1000000 * v7);
  id v12 = [(CONodeController *)self node];
  int64_t v13 = [v12 backoffTimer];
  dispatch_source_set_timer(v13, v11, v10, 0);

  uint64_t v14 = COCoreLogForCategory(16);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = [(CONodeController *)self shortDescription];
    *(_DWORD *)buf = 138412546;
    BOOL v30 = v15;
    __int16 v31 = 2048;
    unint64_t v32 = v4;
    _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%@ back off (%ld) firing", buf, 0x16u);
  }
  char v16 = [(CONodeController *)self node];
  __int16 v17 = [v16 backoffResponse];

  int v18 = [(CONodeController *)self node];
  int64_t v19 = [v18 lastElectionInfoReceived];
  if (v17)
  {
    uint64_t v20 = [(CONodeController *)self _electionRequestWithElectionInfo:v19];

    uint64_t v21 = COCoreLogForCategory(16);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v22 = [(CONodeController *)self shortDescription];
      uint64_t v23 = [v20 generation];
      *(_DWORD *)buf = 138543618;
      BOOL v30 = v22;
      __int16 v31 = 2048;
      unint64_t v32 = v23;
      _os_log_impl(&dword_2217C1000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ delayed BALLOT (%llu) response", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __39__CONodeController_didFireBackoffTimer__block_invoke;
    v26[3] = &unk_2645CE920;
    objc_copyWeak(&v28, (id *)buf);
    id v27 = v17;
    [(CONodeController *)self _updateDelegateWithBallotCommand:v20 withCompletionHandler:v26];

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v20 = [(CONodeController *)self _ballotResponseWithElectionInfo:v19];

    objc_initWeak((id *)buf, self);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __39__CONodeController_didFireBackoffTimer__block_invoke_2;
    v24[3] = &unk_2645CE948;
    objc_copyWeak(&v25, (id *)buf);
    void v24[4] = self;
    [(CONodeController *)self _updateDelegateWithBallotCommand:v20 withCompletionHandler:v24];
    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
}

void __39__CONodeController_didFireBackoffTimer__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained _ballotResponseWithElectionInfo:v8];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v6 = [v4 node];
    [v6 setBackoffResponse:0];

    uint64_t v7 = [v4 node];
    [v7 setLastElectionInfoSent:v8];
  }
}

void __39__CONodeController_didFireBackoffTimer__block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    unint64_t v4 = [*(id *)(a1 + 32) node];
    char v5 = [v4 hasOutstandingRequest];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = [*(id *)(a1 + 32) _electionRequestWithElectionInfo:v9];
      uint64_t v7 = *(void **)(a1 + 32);
      id v8 = [v7 preferredTransport];
      [v7 _sendElectionRequest:v6 usingTransport:v8];
    }
  }
}

- (id)_electionRequestWithElectionInfo:(id)a3
{
  id v4 = a3;
  char v5 = [(CONodeController *)self preferredTransport];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = [v5 listeningPort];
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(CONodeController *)self _electionInfoByDiffingCurrentElectionInfo:v4];
  id v8 = [COMeshElectionRequest alloc];
  id v9 = [v7 ballot];
  uint64_t v10 = -[COMeshElectionRequest initWithBallot:generation:listeningPort:](v8, "initWithBallot:generation:listeningPort:", v9, [v7 generation], v6);

  return v10;
}

- (id)_ballotResponseWithElectionInfo:(id)a3
{
  id v3 = [(CONodeController *)self _electionInfoByDiffingCurrentElectionInfo:a3];
  id v4 = [COMeshBallotResponse alloc];
  char v5 = [v3 ballot];
  uint64_t v6 = -[COMeshBaseBallotResponse initWithBallot:generation:](v4, "initWithBallot:generation:", v5, [v3 generation]);

  return v6;
}

- (id)_voteRequestWithElectionInfo:(id)a3
{
  id v3 = [(CONodeController *)self _electionInfoByDiffingCurrentElectionInfo:a3];
  id v4 = [COMeshVoteRequest alloc];
  char v5 = [v3 ballot];
  uint64_t v6 = -[COMeshBaseBallotRequest initWithBallot:generation:](v4, "initWithBallot:generation:", v5, [v3 generation]);

  return v6;
}

- (id)_acceptResponseWithElectionInfo:(id)a3
{
  id v3 = [(CONodeController *)self _electionInfoByDiffingCurrentElectionInfo:a3];
  id v4 = [COMeshAcceptResponse alloc];
  char v5 = [v3 ballot];
  uint64_t v6 = -[COMeshBaseBallotResponse initWithBallot:generation:](v4, "initWithBallot:generation:", v5, [v3 generation]);

  return v6;
}

- (void)_updateKnownDiscovery:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [MEMORY[0x263F33F80] isIPDiscoveryDiffingEnabled];
  id v5 = v8;
  if (v4)
  {
    uint64_t v6 = [v8 discovery];
    if (v6)
    {
      uint64_t v7 = [(CONodeController *)self knownDiscoveryRecords];
      [v7 addEntriesFromDictionary:v6];
    }
    id v5 = v8;
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (id)_electionInfoByDiffingCurrentElectionInfo:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([MEMORY[0x263F33F80] isIPDiscoveryDiffingEnabled])
  {
    id v5 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v23 = v4;
    uint64_t v6 = [v4 ballot];
    uint64_t v7 = [v6 discovery];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = [v7 allKeys];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v14 = [(CONodeController *)self knownDiscoveryRecords];
          int v15 = [v14 objectForKey:v13];

          char v16 = [v7 objectForKey:v13];
          __int16 v17 = v16;
          if (!v15 || ([v16 isEqualToDiscoveryRecord:v15] & 1) == 0) {
            [v5 setObject:v17 forKey:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v10);
    }

    int v18 = [(CONodeController *)self knownDiscoveryRecords];
    [v18 addEntriesFromDictionary:v5];

    id v4 = v23;
    int64_t v19 = [v23 ballot];
    uint64_t v20 = (void *)[v19 mutableCopy];

    [v20 setDiscovery:v5];
    uint64_t v21 = objc_alloc_init(COElectionInfo);
    -[COElectionInfo setGeneration:](v21, "setGeneration:", [v23 generation]);
    [(COElectionInfo *)v21 setBallot:v20];
  }
  else
  {
    uint64_t v21 = (COElectionInfo *)v4;
  }

  return v21;
}

- (void)_adjustNodeDiscoveryInformationUsingRecord:(id)a3
{
  id v10 = a3;
  id v4 = [(CONodeController *)self node];
  uint64_t v5 = [v4 discoveryType];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 |= 2uLL;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v5 |= 1uLL;
      uint64_t v6 = [(CONodeController *)self node];
      uint64_t v7 = [v6 connectionType];

      if (!v7)
      {
        id v8 = [(CONodeController *)self node];
        [v8 setConnectionType:1];
      }
    }
  }
  uint64_t v9 = [(CONodeController *)self node];
  [v9 setDiscoveryType:v5];
}

- (void)transport:(id)a3 didReceiveCommand:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CONodeController *)self executionContext];
  [v8 assertDispatchQueue];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CONodeController *)self _handleWithdraw:v7 fromTransport:v6];
  }
  else
  {
    uint64_t v9 = [(CONodeController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      [v9 nodeController:self didReceiveCommand:v7];
    }
    else
    {
      id v10 = COCoreLogForCategory(16);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CONodeManager nodeController:didReceiveCommand:]();
      }
    }
  }
}

- (void)transport:(id)a3 didReceiveRequest:(id)a4 callback:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  uint64_t v11 = [(CONodeController *)self executionContext];
  [v11 assertDispatchQueue];

  if (![(CONodeController *)self handlersRegistered])
  {
    __int16 v17 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F62C18] code:-6714 userInfo:0];
    int v18 = COCoreLogForCategory(16);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

      v10[2](v10, 0, v17);
LABEL_14:

      goto LABEL_15;
    }
    int64_t v19 = [(CONodeController *)self shortDescription];
    int v24 = 138543874;
    long long v25 = v19;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    id v29 = v17;
    uint64_t v20 = "%{public}@ acceptable commands not registered. Responding to %@ with error %@";
    uint64_t v21 = v18;
    uint32_t v22 = 32;
LABEL_24:
    _os_log_error_impl(&dword_2217C1000, v21, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v24, v22);

    goto LABEL_13;
  }
  if (!self->_activated)
  {
    __int16 v17 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F62C18] code:-6714 userInfo:0];
    int v18 = COCoreLogForCategory(16);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    int64_t v19 = [(CONodeController *)self shortDescription];
    int v24 = 138544130;
    long long v25 = v19;
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    __int16 v30 = 2112;
    __int16 v31 = v17;
    uint64_t v20 = "%{public}@ transport %@ has not finished activating. Responding to %@ with error %@";
    uint64_t v21 = v18;
    uint32_t v22 = 42;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(CONodeController *)self _handleElectionRequest:v9 fromTransport:v8 callback:v10];
      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(CONodeController *)self _handleVoteRequest:v9 fromTransport:v8 callback:v10];
      goto LABEL_15;
    }
    __int16 v17 = [(CONodeController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      [v17 nodeController:self didReceiveRequest:v9 callback:v10];
    }
    else
    {
      uint64_t v23 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4001 userInfo:0];
      v10[2](v10, 0, v23);
    }
    goto LABEL_14;
  }
  id v12 = [(CONodeController *)self executionContext];
  char v13 = [v12 leaderElectionConfigured];

  if ((v13 & 1) == 0 && [(CONodeController *)self state] == 1)
  {
    uint64_t v14 = COCoreLogForCategory(16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = [(CONodeController *)self shortDescription];
      int v24 = 138543362;
      long long v25 = v15;
      _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ discovered node with an incoming ping will move to processing", (uint8_t *)&v24, 0xCu);
    }
    [(CONodeController *)self _updateNodeState:14 currentElectionInfo:0 incomingElectionInfo:0 reason:2];
  }
  char v16 = objc_alloc_init(COMeshResponse);
  ((void (**)(id, COMeshResponse *, void *))v10)[2](v10, v16, 0);

LABEL_15:
}

- (void)transport:(id)a3 didReceiveError:(id)a4 forCommand:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = [(CONodeController *)self executionContext];
  [v9 assertDispatchQueue];

  id v10 = [(CONodeController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v10 nodeController:self didReceiveError:v7 forCommand:v8];
  }
  else
  {
    uint64_t v11 = COCoreLogForCategory(16);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = [(CONodeController *)self shortDescription];
      int v13 = 138543874;
      uint64_t v14 = v12;
      __int16 v15 = 2112;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_error_impl(&dword_2217C1000, v11, OS_LOG_TYPE_ERROR, "%{public}@ failed to send a command %@ with error %@", (uint8_t *)&v13, 0x20u);
    }
  }
}

- (void)transport:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = COCoreLogForCategory(16);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[CONodeController transport:didInvalidateWithError:](self);
  }

  id v9 = [(CONodeController *)self executionContext];
  [v9 assertDispatchQueue];

  id v10 = [v6 record];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v12 = [(CONodeController *)self acceptableCommands];
    self->_expectedRegisteredCommandCount = [v12 count];
  }
  else
  {
    int v13 = self;
    objc_sync_enter(v13);
    uint64_t v14 = [(CONodeController *)v13 records];
    __int16 v15 = [v6 record];
    [v14 removeObject:v15];

    objc_sync_exit(v13);
    id v16 = [(CONodeController *)v13 transports];
    [v16 removeObject:v6];

    id v12 = [(CONodeController *)v13 computePreferredTransport];
    __int16 v17 = COCoreLogForCategory(16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [(CONodeController *)v13 shortDescription];
      int v24 = 138543618;
      long long v25 = v18;
      __int16 v26 = 2112;
      id v27 = v12;
      _os_log_impl(&dword_2217C1000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ recomputing preferred transport %@", (uint8_t *)&v24, 0x16u);
    }
    [(CONodeController *)v13 setPreferredTransport:v12];
    uint64_t v19 = [(CONodeController *)v13 delegate];
    if (objc_opt_respondsToSelector()) {
      [v19 nodeController:v13 didRemoveTransport:v6 withError:v7];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v20 = [(CONodeController *)v13 node];
      uint64_t v21 = [v20 lastElectionInfoSent];
      uint32_t v22 = [(CONodeController *)v13 node];
      uint64_t v23 = [v22 lastElectionInfoReceived];
      [(CONodeController *)v13 _updateNodeState:14 currentElectionInfo:v21 incomingElectionInfo:v23 reason:21];
    }
  }
}

- (void)transport:(id)a3 shouldUpdateRemoteConstituent:(id)a4 to:(id)a5 forCommand:(id)a6 completionHandler:(id)a7
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  __int16 v15 = (void (**)(id, void))a7;
  id v16 = a6;
  __int16 v17 = [(CONodeController *)self executionContext];
  [v17 assertDispatchQueue];

  id v18 = [(CONodeController *)self executionContext];
  char v19 = [v18 leaderElectionConfigured];

  if (v19)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v21 = COCoreLogForCategory(16);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint32_t v22 = [(CONodeController *)self shortDescription];
        int v29 = 138544130;
        __int16 v30 = v22;
        __int16 v31 = 2112;
        id v32 = v13;
        __int16 v33 = 2112;
        id v34 = v14;
        __int16 v35 = 2048;
        id v36 = v12;
        _os_log_impl(&dword_2217C1000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ remote constituent will change from %@ to %@ on transport %p", (uint8_t *)&v29, 0x2Au);
      }
      uint64_t v23 = [(CONodeController *)self node];
      [v23 setRemote:v14];

      int v24 = [(CONodeController *)self ipDiscoveryRecord];
      if (v24)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v25 = [v24 constituent];
          if (([v25 isEqual:v14] & 1) == 0)
          {
            id v26 = [v24 mutableCopy];
            [v26 rollConstituent:v14];
            id v27 = [[CODiscoveryRecord alloc] initWithDiscoveryRecord:v26];
            [(CONodeController *)self setIpDiscoveryRecord:v27];
            [v12 setRecord:v27];
          }
        }
      }
LABEL_13:
    }
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      int v24 = COCoreLogForCategory(16);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = [(CONodeController *)self shortDescription];
        int v29 = 138544130;
        __int16 v30 = v28;
        __int16 v31 = 2112;
        id v32 = v13;
        __int16 v33 = 2112;
        id v34 = v14;
        __int16 v35 = 2048;
        id v36 = v12;
        _os_log_impl(&dword_2217C1000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ remote constituent will change from %@ to %@ on transport %p", (uint8_t *)&v29, 0x2Au);
      }
      goto LABEL_13;
    }
  }
  v15[2](v15, isKindOfClass & 1);
}

- (void)transport:(id)a3 willUpdateRemoteConstituent:(id)a4 to:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(CONodeController *)self executionContext];
  [v11 assertDispatchQueue];

  id v12 = COCoreLogForCategory(16);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(CONodeController *)self shortDescription];
    int v19 = 138544130;
    uint64_t v20 = v13;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    __int16 v25 = 2048;
    id v26 = v8;
    _os_log_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ remote constituent will change from %@ to %@ on transport %p", (uint8_t *)&v19, 0x2Au);
  }
  id v14 = [(CONodeController *)self node];
  [v14 setRemote:v10];

  __int16 v15 = [(CONodeController *)self ipDiscoveryRecord];
  if (v15)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = [v15 constituent];
      if (([v16 isEqual:v10] & 1) == 0)
      {
        __int16 v17 = (void *)[v15 mutableCopy];
        [v17 rollConstituent:v10];
        id v18 = [[CODiscoveryRecord alloc] initWithDiscoveryRecord:v17];
        [(CONodeController *)self setIpDiscoveryRecord:v18];
        [v8 setRecord:v18];
      }
    }
  }
}

- (void)transport:(id)a3 didUpdateRemoteConstituent:(id)a4 to:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(CONodeController *)self executionContext];
  [v11 assertDispatchQueue];

  id v12 = COCoreLogForCategory(16);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(CONodeController *)self shortDescription];
    int v15 = 138544130;
    id v16 = v13;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v10;
    __int16 v21 = 2048;
    id v22 = v8;
    _os_log_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ remote constituent has changed from %@ to %@ on transport %p", (uint8_t *)&v15, 0x2Au);
  }
  if (v9)
  {
    id v14 = [(CONodeController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v14 nodeController:self didUpdateRemoteConstituent:v9 to:v10];
    }
  }
}

- (void)transport:(id)a3 didReceiveUnhandledRequest:(id)a4
{
  id v5 = a4;
  id v6 = [(CONodeController *)self executionContext];
  [v6 assertDispatchQueue];

  id v7 = [v5 request];
  uint64_t v8 = [(CONodeController *)self executionContext];
  [(id)v8 leaderElectionConfigured];

  objc_opt_class();
  LODWORD(v8) = objc_opt_isKindOfClass();
  int v9 = [v7 conformsToProtocol:&unk_26D3F7A00] & v8;
  id v10 = COCoreLogForCategory(16);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[CONodeController transport:didReceiveUnhandledRequest:]();
  }

  uint64_t v11 = [(CONodeController *)self delegate];
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v11 nodeController:self didReceiveOnDemandNodeCreationRequest:v5];
  }
  else
  {
    id v12 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4000 userInfo:0];
    id v13 = [v5 handler];
    ((void (**)(void, void, void, void *))v13)[2](v13, 0, 0, v12);
  }
}

- (CONode)node
{
  return self->_node;
}

- (COExecutionContext)executionContext
{
  return self->_executionContext;
}

- (CONodeControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CONodeControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSSet)acceptableCommands
{
  return self->_acceptableCommands;
}

- (void)setAcceptableCommands:(id)a3
{
}

- (void)setIpDiscoveryRecord:(id)a3
{
}

- (NSMutableArray)records
{
  return self->_records;
}

- (NSMutableArray)transports
{
  return self->_transports;
}

- (NSMutableDictionary)sentElements
{
  return self->_sentElements;
}

- (void)setSentElements:(id)a3
{
}

- (CODiscoveryRecordProtocol)originalRecord
{
  return self->_originalRecord;
}

- (void)setOriginalRecord:(id)a3
{
}

- (void)setPreferredTransport:(id)a3
{
}

- (COConstituent)leader
{
  return self->_leader;
}

- (void)setLeader:(id)a3
{
}

- (BOOL)stopped
{
  return self->_stopped;
}

- (void)setStopped:(BOOL)a3
{
  self->_stopped = a3;
}

- (BOOL)handlersRegistered
{
  return self->_handlersRegistered;
}

- (void)setHandlersRegistered:(BOOL)a3
{
  self->_handlersRegistered = a3;
}

- (NSMutableDictionary)knownDiscoveryRecords
{
  return self->_knownDiscoveryRecords;
}

- (void)setKnownDiscoveryRecords:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownDiscoveryRecords, 0);
  objc_storeStrong((id *)&self->_leader, 0);
  objc_storeStrong((id *)&self->_preferredTransport, 0);
  objc_storeStrong((id *)&self->_originalRecord, 0);
  objc_storeStrong((id *)&self->_sentElements, 0);
  objc_storeStrong((id *)&self->_transports, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_ipDiscoveryRecord, 0);
  objc_storeStrong((id *)&self->_acceptableCommands, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_executionContext, 0);
  objc_storeStrong((id *)&self->_node, 0);
}

void __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_65_cold_1()
{
  OUTLINED_FUNCTION_9();
  v1 = [v0 shortDescription];
  OUTLINED_FUNCTION_10_0(&dword_2217C1000, v2, v3, "%{public}@ failed activation with error %{public}@", v4, v5, v6, v7, 2u);
}

void __39__CONodeController_addDiscoveryRecord___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortDescription];
  OUTLINED_FUNCTION_10_0(&dword_2217C1000, v2, v3, "%{public}@ failed to create a transport with record %@", v4, v5, v6, v7, 2u);
}

void __40__CONodeController_inquireForTransport___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  v1 = [v0 shortDescription];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_0(&dword_2217C1000, v2, v3, "%{public}@ Failed inquiry with error %@", v4, v5, v6, v7, v8);
}

- (void)_sendPingUsingTransport:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 shortDescription];
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_2217C1000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ transport %@ doesn't support pings", (uint8_t *)&v6, 0x16u);
}

- (void)transport:(void *)a1 didInvalidateWithError:.cold.1(void *a1)
{
  v1 = [a1 shortDescription];
  OUTLINED_FUNCTION_10_0(&dword_2217C1000, v2, v3, "%{public}@ transport %p reported as invalidated", v4, v5, v6, v7, 2u);
}

- (void)transport:didReceiveUnhandledRequest:.cold.1()
{
  OUTLINED_FUNCTION_9();
  uint64_t v2 = [v1 shortDescription];
  uint64_t v9 = [v0 _sendingConstituent];
  OUTLINED_FUNCTION_10_0(&dword_2217C1000, v3, v4, "%{public}@ received a request from an unknown node %@", v5, v6, v7, v8, 2u);
}

@end