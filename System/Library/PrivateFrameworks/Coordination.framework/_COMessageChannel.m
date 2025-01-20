@interface _COMessageChannel
- (COMessageChannelRapportTransport)rapportTransport;
- (Class)_payloadClassFromType:(id)a3;
- (_COMessageChannel)initWithTopic:(id)a3 cluster:(id)a4 manualGrouping:(BOOL)a5;
- (id)_payloadTypeFromClass:(Class)a3;
- (id)groupedHomeKitIdentifiers;
- (void)_onqueue_deliverDidEndDelegateForSession:(id)a3 notice:(id)a4 initiator:(id)a5 error:(id)a6;
- (void)_onqueue_deliverDidFailToStartSessionWithMember:(id)a3 consumer:(id)a4 error:(id)a5;
- (void)_onqueue_deliverDidFailToStartSessionWithMember:(id)a3 producer:(id)a4 error:(id)a5;
- (void)_onqueue_deliverSuccessfullyStartedSession:(id)a3 withMember:(id)a4 consumer:(id)a5;
- (void)_onqueue_deliverSuccessfullyStartedSession:(id)a3 withResponse:(id)a4 withMember:(id)a5 producer:(id)a6;
- (void)_onqueue_handleCapableCommand:(id)a3 fromMember:(id)a4 callback:(id)a5;
- (void)_onqueue_handleStartCommand:(id)a3 withMember:(id)a4 callback:(id)a5;
- (void)_onqueue_handleStopCommand:(id)a3 fromMember:(id)a4 callback:(id)a5;
- (void)_onqueue_sendRequest:(id)a3 members:(id)a4 withCompletionHandler:(id)a5;
- (void)_onqueue_startSessionWithProducer:(id)a3 member:(id)a4;
- (void)_onqueue_startSessionWithProducer:(id)a3 member:(id)a4 request:(id)a5;
- (void)activateWithCompletion:(id)a3;
- (void)addGroupedHomeKitIdentifiers:(id)a3;
- (void)addSessionConsumerWithSubTopic:(id)a3 delegate:(id)a4 dispatchQueue:(id)a5;
- (void)addSessionProducerWithSubTopic:(id)a3 delegate:(id)a4 dispatchQueue:(id)a5;
- (void)broadcastRequest:(id)a3 recipientsCallback:(id)a4 responseCompletionHandler:(id)a5;
- (void)didFindMember:(id)a3;
- (void)didLoseMember:(id)a3;
- (void)didReceiveRequest:(id)a3 from:(id)a4 withCompletionHandler:(id)a5;
- (void)registerHandler:(id)a3 forRequestClass:(Class)a4;
- (void)registerMemberFoundHandler:(id)a3;
- (void)registerMemberLostHandler:(id)a3;
- (void)removeGroupedHomeKitIdentifiers:(id)a3;
- (void)sendRequest:(id)a3 members:(id)a4 withCompletionHandler:(id)a5;
- (void)setRapportTransport:(id)a3;
@end

@implementation _COMessageChannel

- (_COMessageChannel)initWithTopic:(id)a3 cluster:(id)a4 manualGrouping:(BOOL)a5
{
  id v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_COMessageChannel;
  v8 = [(COMessageChannel *)&v18 initWithConnectionProvider:0 roleMonitorConnectionProvider:0 topic:v7 cluster:a4];
  v9 = v8;
  if (v8)
  {
    v10 = NSString;
    v11 = [(COMessageChannel *)v8 cluster];
    v12 = [v10 stringWithFormat:@"%@-%@", v7, v11];

    v13 = [COMessageChannelRapportTransport alloc];
    v14 = [(COMessageChannel *)v9 workQueue];
    uint64_t v15 = [(COMessageChannelRapportTransport *)v13 initWithIdentifier:v12 delegate:v9 dispatchQueue:v14];
    rapportTransport = v9->_rapportTransport;
    v9->_rapportTransport = (COMessageChannelRapportTransport *)v15;
  }
  return v9;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(COMessageChannel *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44___COMessageChannel_activateWithCompletion___block_invoke;
  v7[3] = &unk_264444338;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)sendRequest:(id)a3 members:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(COMessageChannel *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __63___COMessageChannel_sendRequest_members_withCompletionHandler___block_invoke;
  v15[3] = &unk_264444508;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)broadcastRequest:(id)a3 recipientsCallback:(id)a4 responseCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(COMessageChannel *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __83___COMessageChannel_broadcastRequest_recipientsCallback_responseCompletionHandler___block_invoke;
  v15[3] = &unk_264444CE0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (void)_onqueue_sendRequest:(id)a3 members:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(COMessageChannel *)self workQueue];
  dispatch_assert_queue_V2(v11);

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v9;
  uint64_t v12 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * v15);
        id v17 = [(_COMessageChannel *)self rapportTransport];
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __72___COMessageChannel__onqueue_sendRequest_members_withCompletionHandler___block_invoke;
        v19[3] = &unk_264445658;
        v19[4] = v16;
        id v20 = v10;
        [v17 sendRequest:v8 to:v16 withCompletionHandler:v19];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }
}

- (void)registerHandler:(id)a3 forRequestClass:(Class)a4
{
  id v6 = a3;
  id v7 = [(COMessageChannel *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53___COMessageChannel_registerHandler_forRequestClass___block_invoke;
  block[3] = &unk_264445680;
  block[4] = self;
  id v10 = v6;
  Class v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)registerMemberFoundHandler:(id)a3
{
  id v4 = a3;
  v5 = [(COMessageChannel *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48___COMessageChannel_registerMemberFoundHandler___block_invoke;
  v7[3] = &unk_264444338;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)registerMemberLostHandler:(id)a3
{
  id v4 = a3;
  v5 = [(COMessageChannel *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47___COMessageChannel_registerMemberLostHandler___block_invoke;
  v7[3] = &unk_264444338;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)groupedHomeKitIdentifiers
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__9;
  id v9 = __Block_byref_object_dispose__9;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46___COMessageChannel_groupedHomeKitIdentifiers__block_invoke;
  v4[3] = &unk_264444468;
  v4[4] = self;
  v4[5] = &v5;
  [(COMessageChannel *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)addGroupedHomeKitIdentifiers:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50___COMessageChannel_addGroupedHomeKitIdentifiers___block_invoke;
  v6[3] = &unk_2644444E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COMessageChannel *)self _withLock:v6];
}

- (void)removeGroupedHomeKitIdentifiers:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53___COMessageChannel_removeGroupedHomeKitIdentifiers___block_invoke;
  v6[3] = &unk_2644444E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COMessageChannel *)self _withLock:v6];
}

- (void)addSessionProducerWithSubTopic:(id)a3 delegate:(id)a4 dispatchQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  Class v11 = [(COMessageChannel *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __75___COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke;
  v15[3] = &unk_264444FE8;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (void)addSessionConsumerWithSubTopic:(id)a3 delegate:(id)a4 dispatchQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  Class v11 = [(COMessageChannel *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __75___COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke;
  v15[3] = &unk_264444FE8;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (void)_onqueue_startSessionWithProducer:(id)a3 member:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 sessions];
  id v9 = [v8 objectForKey:v7];

  id v10 = COLogForCategory(6);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 134218242;
      long long v24 = self;
      __int16 v25 = 2112;
      id v26 = v7;
      _os_log_impl(&dword_21D3E0000, v10, OS_LOG_TYPE_DEFAULT, "%p Session with member %@ is already active. Not starting again", buf, 0x16u);
    }
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 134218498;
      long long v24 = self;
      __int16 v25 = 2112;
      id v26 = v7;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl(&dword_21D3E0000, v10, OS_LOG_TYPE_DEFAULT, "%p Attempting to start a session with member %@ using producer %@", buf, 0x20u);
    }

    id v10 = [v6 delegateQueue];
    id v12 = [v6 delegate];
    if (objc_opt_respondsToSelector())
    {
      objc_initWeak((id *)buf, self);
      id v13 = +[COClusterMemberRoleSnapshot snapshotWithParticipantRoleForMember:v7];
      id v14 = COLogForCategory(6);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[_COMessageChannel _onqueue_startSessionWithProducer:member:]((uint64_t)self);
      }

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __62___COMessageChannel__onqueue_startSessionWithProducer_member___block_invoke;
      block[3] = &unk_2644452E0;
      id v18 = v12;
      id v19 = v6;
      id v20 = v13;
      id v15 = v13;
      objc_copyWeak(&v22, (id *)buf);
      id v21 = v7;
      dispatch_async(v10, block);

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      id v16 = COLogForCategory(6);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        long long v24 = self;
        _os_log_impl(&dword_21D3E0000, v16, OS_LOG_TYPE_DEFAULT, "%p Client does not implement producer:shouldStartSessionWithMember:completionHandler:", buf, 0xCu);
      }

      [(_COMessageChannel *)self _onqueue_startSessionWithProducer:v6 member:v7 request:0];
    }
  }
}

- (void)_onqueue_startSessionWithProducer:(id)a3 member:(id)a4 request:(id)a5
{
  v31[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = +[COClusterMemberRoleSnapshot snapshotWithParticipantRoleForMember:v9];
  id v29 = 0;
  id v22 = [MEMORY[0x263F08910] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v29];
  id v12 = v29;
  id v13 = v12;
  if (v12)
  {
    id v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08608];
    v31[0] = v12;
    id v15 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    id v16 = [v14 errorWithDomain:@"COMessageSessionErrorDomain" code:-1205 userInfo:v15];

    [(_COMessageChannel *)self _onqueue_deliverDidFailToStartSessionWithMember:v11 producer:v8 error:v16];
  }
  else
  {
    id v17 = [COMessageSessionManagementRequest alloc];
    id v18 = [(_COMessageChannel *)self _payloadTypeFromClass:objc_opt_class()];
    id v19 = [(COMessageChannel *)self topic];
    id v20 = [v8 subTopic];
    id v16 = [(COMessageSessionManagementRequest *)v17 initWithCommandType:1 payload:v22 payloadType:v18 topic:v19 subTopic:v20];

    objc_initWeak(&location, self);
    id v21 = [MEMORY[0x263EFFA08] setWithObject:v9];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __70___COMessageChannel__onqueue_startSessionWithProducer_member_request___block_invoke;
    v23[3] = &unk_264445088;
    objc_copyWeak(&v27, &location);
    id v24 = v10;
    id v25 = v8;
    id v26 = v9;
    [(_COMessageChannel *)self _onqueue_sendRequest:v16 members:v21 withCompletionHandler:v23];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
}

- (void)_onqueue_handleStartCommand:(id)a3 withMember:(id)a4 callback:(id)a5
{
  v55[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v34 = a4;
  id v9 = (void (**)(id, COMessageSessionManagementResponse *, void))a5;
  v32 = [v8 subTopic];
  id v10 = [(COMessageChannel *)self sessionConsumers];
  BOOL v11 = [v10 objectForKey:v32];

  v33 = [v11 delegate];
  queue = [v11 delegateQueue];
  id v12 = [v8 payload];
  uint64_t v13 = [v8 payloadType];
  id v14 = (void *)v13;
  id v15 = 0;
  if (v12 && v13)
  {
    id v16 = [(_COMessageChannel *)self _payloadClassFromType:v13];
    if (v16)
    {
      id v45 = 0;
      id v15 = [MEMORY[0x263F08928] unarchivedObjectOfClass:v16 fromData:v12 error:&v45];
      id v17 = v45;
      if (v17)
      {
LABEL_5:
        id v18 = (void *)MEMORY[0x263F087E8];
        uint64_t v52 = *MEMORY[0x263F08608];
        id v53 = v17;
        id v19 = [NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
        id v20 = [v18 errorWithDomain:@"COMessageSessionErrorDomain" code:-1206 userInfo:v19];

        id v21 = COLogForCategory(6);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          uint64_t v30 = [v34 member];
          *(_DWORD *)buf = 138412802;
          v47 = v11;
          __int16 v48 = 2112;
          v49 = v14;
          __int16 v50 = 2112;
          v51 = v30;
          _os_log_error_impl(&dword_21D3E0000, v21, OS_LOG_TYPE_ERROR, "%@ Consumer failed to unarchive request of type %@. Session start with member %@ failed", buf, 0x20u);
        }
        id v22 = [[COMessageSessionManagementResponse alloc] initWithRemoteError:v20];
        v9[2](v9, v22, 0);

        goto LABEL_14;
      }
    }
    else
    {
      long long v23 = (void *)MEMORY[0x263F087E8];
      v54 = @"COMessageSessionUnknownClassErrorKey";
      v55[0] = v14;
      id v24 = [NSDictionary dictionaryWithObjects:v55 forKeys:&v54 count:1];
      id v17 = [v23 errorWithDomain:@"COMessageSessionErrorDomain" code:-1206 userInfo:v24];

      id v15 = 0;
      if (v17) {
        goto LABEL_5;
      }
    }
  }
  id v25 = [COMessageConsumedSession alloc];
  id v26 = [v34 member];
  id v20 = [(COMessageConsumedSession *)v25 initWithMember:v26 consumer:v11];

  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    id v27 = COLogForCategory(6);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      id v28 = [v8 subTopic];
      -[COMessageChannel _handleStartCommand:withMember:callback:]((uint64_t)self, v28, buf, v27);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69___COMessageChannel__onqueue_handleStartCommand_withMember_callback___block_invoke;
    block[3] = &unk_264445268;
    id v36 = v33;
    id v37 = v11;
    id v38 = v34;
    id v15 = v15;
    id v39 = v15;
    objc_copyWeak(&v43, &location);
    v40 = self;
    id v20 = v20;
    v41 = v20;
    v42 = v9;
    dispatch_async(queue, block);

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }
  else
  {
    id v29 = objc_alloc_init(COMessageSessionManagementResponse);
    v9[2](v9, v29, 0);
  }
LABEL_14:
}

- (void)_onqueue_handleStopCommand:(id)a3 fromMember:(id)a4 callback:(id)a5
{
  v33[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, COMessageSessionManagementResponse *, void))a5;
  BOOL v11 = [v8 subTopic];
  id v12 = [(COMessageChannel *)self sessionConsumers];
  uint64_t v13 = [v12 objectForKey:v11];

  id v14 = [v13 sessions];
  id v15 = [v9 member];
  id v16 = [v14 objectForKey:v15];

  if (v16) {
    goto LABEL_3;
  }
  id v17 = [(COMessageChannel *)self sessionProducers];
  id v18 = [v17 objectForKey:v11];

  id v19 = [v18 sessions];
  id v20 = [v9 member];
  id v16 = [v19 objectForKey:v20];

  if (v16)
  {
LABEL_3:
    uint64_t v30 = v13;
    id v21 = [v8 payload];
    id v22 = [v8 payloadType];
    uint64_t v23 = [v8 remoteError];
    if (v23)
    {
      id v24 = (id)v23;
    }
    else
    {
      id v25 = 0;
      id v24 = 0;
      if (!v21 || !v22) {
        goto LABEL_6;
      }
      id v27 = [(_COMessageChannel *)self _payloadClassFromType:v22];
      if (v27)
      {
        id v31 = 0;
        id v25 = [MEMORY[0x263F08928] unarchivedObjectOfClass:v27 fromData:v21 error:&v31];
        id v24 = v31;
        goto LABEL_6;
      }
      id v29 = (void *)MEMORY[0x263F087E8];
      v32 = @"COMessageSessionUnknownClassErrorKey";
      v33[0] = v22;
      id v28 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
      id v24 = [v29 errorWithDomain:@"COMessageSessionErrorDomain" code:-1206 userInfo:v28];
    }
    id v25 = 0;
LABEL_6:
    [(_COMessageChannel *)self _onqueue_deliverDidEndDelegateForSession:v16 notice:v25 initiator:v9 error:v24];

    uint64_t v13 = v30;
  }
  id v26 = objc_alloc_init(COMessageSessionManagementResponse);
  v10[2](v10, v26, 0);
}

- (void)_onqueue_handleCapableCommand:(id)a3 fromMember:(id)a4 callback:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, COMessageSessionManagementResponse *, void))a5;
  BOOL v11 = objc_alloc_init(COMessageSessionManagementResponse);
  v10[2](v10, v11, 0);

  id v12 = [(COMessageChannel *)self sessionsInflight];
  uint64_t v13 = [v9 member];
  id v14 = [v12 objectForKey:v13];

  if (v14)
  {
    id v15 = COLogForCategory(6);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v9 member];
      id v17 = [v8 subTopic];
      int v27 = 134218498;
      id v28 = self;
      __int16 v29 = 2112;
      uint64_t v30 = v16;
      __int16 v31 = 2112;
      v32 = v17;
      _os_log_impl(&dword_21D3E0000, v15, OS_LOG_TYPE_DEFAULT, "%p Received a command indicating inflight member %@ is now capable of consuming subTopic %@", (uint8_t *)&v27, 0x20u);
    }
    id v18 = [(COMessageChannel *)self sessionProducers];
    id v19 = [v8 subTopic];
    id v20 = [v18 objectForKey:v19];

    id v21 = [MEMORY[0x263EFF9D0] null];
    if ([v14 isEqual:v21]) {
      id v22 = 0;
    }
    else {
      id v22 = v14;
    }
    id v23 = v22;

    id v24 = [(COMessageChannel *)self sessionsInflight];
    id v25 = [v9 member];
    [v24 removeObjectForKey:v25];

    id v26 = [v9 member];
    [(_COMessageChannel *)self _onqueue_startSessionWithProducer:v20 member:v26 request:v23];
  }
}

- (void)_onqueue_deliverDidFailToStartSessionWithMember:(id)a3 producer:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 delegate];
  BOOL v11 = [v8 delegateQueue];
  if (objc_opt_respondsToSelector())
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __84___COMessageChannel__onqueue_deliverDidFailToStartSessionWithMember_producer_error___block_invoke;
    v12[3] = &unk_264444FE8;
    id v13 = v10;
    id v14 = v8;
    id v15 = v7;
    id v16 = v9;
    dispatch_async(v11, v12);
  }
}

- (void)_onqueue_deliverDidFailToStartSessionWithMember:(id)a3 consumer:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 delegate];
  BOOL v11 = [v8 delegateQueue];
  if (objc_opt_respondsToSelector())
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __84___COMessageChannel__onqueue_deliverDidFailToStartSessionWithMember_consumer_error___block_invoke;
    v12[3] = &unk_264444FE8;
    id v13 = v10;
    id v14 = v8;
    id v15 = v7;
    id v16 = v9;
    dispatch_async(v11, v12);
  }
}

- (void)_onqueue_deliverSuccessfullyStartedSession:(id)a3 withResponse:(id)a4 withMember:(id)a5 producer:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v12 sessions];
  id v14 = [v11 member];
  [v13 setObject:v9 forKey:v14];

  id v15 = COLogForCategory(6);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = v12;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl(&dword_21D3E0000, v15, OS_LOG_TYPE_DEFAULT, "%@ Producer successfully created a session %@", buf, 0x16u);
  }

  id v16 = [v12 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v17 = [v12 delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __97___COMessageChannel__onqueue_deliverSuccessfullyStartedSession_withResponse_withMember_producer___block_invoke;
    block[3] = &unk_264445060;
    id v19 = v16;
    id v20 = v12;
    id v21 = v9;
    id v22 = v11;
    id v23 = v10;
    dispatch_async(v17, block);
  }
}

- (void)_onqueue_deliverSuccessfullyStartedSession:(id)a3 withMember:(id)a4 consumer:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [v8 sessions];
  id v11 = [v9 member];

  [v10 setObject:v7 forKey:v11];
  id v12 = COLogForCategory(6);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_21D3E0000, v12, OS_LOG_TYPE_DEFAULT, "%@ Consumer successfully created a session %@", buf, 0x16u);
  }

  id v13 = [v8 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v14 = [v8 delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __84___COMessageChannel__onqueue_deliverSuccessfullyStartedSession_withMember_consumer___block_invoke;
    block[3] = &unk_2644448B0;
    id v16 = v13;
    id v17 = v8;
    id v18 = v7;
    dispatch_async(v14, block);
  }
}

- (void)_onqueue_deliverDidEndDelegateForSession:(id)a3 notice:(id)a4 initiator:(id)a5 error:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [v9 producer];
    id v14 = [v13 delegate];
    if (objc_opt_respondsToSelector())
    {
      id v15 = [v13 delegateQueue];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __85___COMessageChannel__onqueue_deliverDidEndDelegateForSession_notice_initiator_error___block_invoke;
      v30[3] = &unk_264445328;
      id v22 = &v31;
      id v14 = v14;
      id v31 = v14;
      __int16 v21 = &v32;
      id v13 = v13;
      id v32 = v13;
      id v20 = &v33;
      id v33 = v9;
      id v16 = &v34;
      id v34 = v11;
      id v17 = &v35;
      id v35 = v10;
      id v18 = &v36;
      id v36 = v12;
      id v19 = v30;
LABEL_6:
      dispatch_async(v15, v19);
    }
  }
  else
  {
    id v13 = [v9 consumer];
    id v14 = [v13 delegate];
    if (objc_opt_respondsToSelector())
    {
      id v15 = [v13 delegateQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __85___COMessageChannel__onqueue_deliverDidEndDelegateForSession_notice_initiator_error___block_invoke_2;
      block[3] = &unk_264445328;
      id v22 = &v24;
      id v14 = v14;
      id v24 = v14;
      __int16 v21 = &v25;
      id v13 = v13;
      id v25 = v13;
      id v20 = &v26;
      id v26 = v9;
      id v16 = &v27;
      id v27 = v11;
      id v17 = &v28;
      id v28 = v10;
      id v18 = &v29;
      id v29 = v12;
      id v19 = block;
      goto LABEL_6;
    }
  }
}

- (void)didFindMember:(id)a3
{
  id v4 = a3;
  id v5 = [(COMessageChannel *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35___COMessageChannel_didFindMember___block_invoke;
  v7[3] = &unk_2644444E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)didLoseMember:(id)a3
{
  id v4 = a3;
  id v5 = [(COMessageChannel *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35___COMessageChannel_didLoseMember___block_invoke;
  v7[3] = &unk_2644444E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)didReceiveRequest:(id)a3 from:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(COMessageChannel *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __66___COMessageChannel_didReceiveRequest_from_withCompletionHandler___block_invoke;
  v15[3] = &unk_264445720;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (id)_payloadTypeFromClass:(Class)a3
{
  if (a3)
  {
    id v4 = NSStringFromClass(a3);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (Class)_payloadClassFromType:(id)a3
{
  return NSClassFromString((NSString *)a3);
}

- (COMessageChannelRapportTransport)rapportTransport
{
  return self->_rapportTransport;
}

- (void)setRapportTransport:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_onqueue_startSessionWithProducer:(uint64_t)a1 member:.cold.1(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_1_1();
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_21D3E0000, v2, OS_LOG_TYPE_DEBUG, "%p Reaching out to client delegate producer:shouldStartSessionWithMember:completionHandler: with member %@", (uint8_t *)&v3, 0x16u);
}

@end