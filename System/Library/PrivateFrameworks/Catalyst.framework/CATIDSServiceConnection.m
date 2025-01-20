@interface CATIDSServiceConnection
+ (CATIDSServiceConnection)connectionWithMetadata:(id)a3 configuration:(id)a4 IDSPrimitives:(id)a5 messageBroadcaster:(id)a6 timerSource:(id)a7 dataMessageQueue:(id)a8 dataAggregator:(id)a9 assertion:(id)a10 workQueue:(id)a11 delegateQueue:(id)a12 destinationAddress:(id)a13 sourceAppleID:(id)a14;
+ (CATIDSServiceConnection)connectionWithMetadata:(id)a3 configuration:(id)a4 capabilities:(id)a5 IDSPrimitives:(id)a6 messageBroadcaster:(id)a7 timerSource:(id)a8 assertion:(id)a9 workQueue:(id)a10 delegateQueue:(id)a11 destinationAddress:(id)a12 sourceAppleID:(id)a13;
+ (id)acknowledgeContent;
+ (id)closeContentWithError:(id)a3;
+ (id)keepAliveContent;
+ (id)keepAliveTimerIdentifier;
- (BOOL)isClosed;
- (CATIDSServiceConnection)initWithMetadata:(id)a3 configuration:(id)a4 IDSPrimitives:(id)a5 messageBroadcaster:(id)a6 timerSource:(id)a7 dataMessageQueue:(id)a8 dataAggregator:(id)a9 assertion:(id)a10 workQueue:(id)a11 delegateQueue:(id)a12 destinationAddress:(id)a13 sourceAppleID:(id)a14;
- (CATIDSServiceConnectionDelegate)delegate;
- (CATIDSServiceConnectionMetadata)metadata;
- (NSError)closedError;
- (id)description;
- (id)requestMissingDataContentWithExpectedSequenceNumber:(unint64_t)a3;
- (id)retransmitContentForSequenceNumbers:(id)a3;
- (void)_close;
- (void)_sendData:(id)a3 completion:(id)a4;
- (void)close;
- (void)connectionDataAggregator:(id)a3 aggregatedData:(id)a4 withNumber:(unint64_t)a5;
- (void)connectionDataAggregator:(id)a3 isMissingSequenceNumbers:(id)a4;
- (void)connectionDataAggregatorWantsToReportSequenceNumber:(id)a3;
- (void)dataMessageQueue:(id)a3 needsToSendContents:(id)a4 shouldSkipTheLine:(BOOL)a5 completion:(id)a6;
- (void)dataMessageQueue:(id)a3 wantsToCheckRemote:(unint64_t)a4;
- (void)keepAliveTimerDidFire:(id)a3 fireCount:(unint64_t)a4 isFinalFire:(BOOL)a5;
- (void)messageProcessor:(id)a3 receivedExpectedSequence:(unint64_t)a4;
- (void)messageProcessor:(id)a3 wantsAggregation:(id)a4;
- (void)messageProcessor:(id)a3 wantsRetransmission:(id)a4;
- (void)messageProcessor:(id)a3 wantsToAckUpTo:(unint64_t)a4;
- (void)messageProcessor:(id)a3 wantsToCloseWithError:(id)a4;
- (void)messageProcessorWantsToAcknowledgeRemote:(id)a3;
- (void)messageProcessorWantsToExtendKeepAlive:(id)a3;
- (void)processMessage:(id)a3 senderAppleID:(id)a4 senderAddress:(id)a5;
- (void)sendContent:(id)a3;
- (void)sendData:(id)a3 completion:(id)a4;
- (void)setClosed:(BOOL)a3;
- (void)setClosedError:(id)a3;
- (void)setDelegate:(id)a3;
- (void)tearDownWithError:(id)a3 shouldReportToRemote:(BOOL)a4;
@end

@implementation CATIDSServiceConnection

- (CATIDSServiceConnection)initWithMetadata:(id)a3 configuration:(id)a4 IDSPrimitives:(id)a5 messageBroadcaster:(id)a6 timerSource:(id)a7 dataMessageQueue:(id)a8 dataAggregator:(id)a9 assertion:(id)a10 workQueue:(id)a11 delegateQueue:(id)a12 destinationAddress:(id)a13 sourceAppleID:(id)a14
{
  id v54 = a3;
  id v19 = a4;
  id v52 = a5;
  id v51 = a6;
  id v55 = a7;
  id v50 = a8;
  id v49 = a9;
  id v48 = a10;
  id v20 = a11;
  id v47 = a12;
  id v21 = a13;
  v22 = v19;
  id v23 = a14;
  v59.receiver = self;
  v59.super_class = (Class)CATIDSServiceConnection;
  v24 = [(CATIDSServiceConnection *)&v59 init];
  if (v24)
  {
    objc_initWeak(&location, v24);
    objc_storeStrong((id *)&v24->_metadata, a3);
    objc_storeStrong((id *)&v24->mIDSPrimitives, a5);
    objc_storeStrong((id *)&v24->mAssertion, a10);
    objc_storeStrong((id *)&v24->mMessageBroadcaster, a6);
    objc_storeStrong((id *)&v24->mWorkQueue, a11);
    objc_storeStrong((id *)&v24->mDelegateQueue, a12);
    id v25 = v21;
    uint64_t v26 = [v21 copy];
    mDestinationAddress = v24->mDestinationAddress;
    v24->mDestinationAddress = (NSString *)v26;

    uint64_t v28 = [v23 copy];
    mSourceAppleID = v24->mSourceAppleID;
    v24->mSourceAppleID = (NSString *)v28;

    uint64_t v30 = objc_opt_new();
    mSendQueue = v24->mSendQueue;
    v24->mSendQueue = (CATOperationQueue *)v30;

    [(CATOperationQueue *)v24->mSendQueue setUnderlyingQueue:v20];
    v32 = objc_opt_new();
    [v32 setUnderlyingQueue:v20];
    v33 = [[CATSerialOperationEnqueuer alloc] initWithTargetOperationQueue:v32];
    mControlOperationEnqueuer = v24->mControlOperationEnqueuer;
    v24->mControlOperationEnqueuer = v33;

    objc_storeStrong((id *)&v24->mDataMessageQueue, a8);
    objc_storeStrong((id *)&v24->mDataAggregator, a9);
    v35 = [(id)objc_opt_class() keepAliveTimerIdentifier];
    [v22 keepAliveCheckinInterval];
    double v37 = v36;
    uint64_t v38 = [v22 keepAliveAttemptCount];
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __202__CATIDSServiceConnection_initWithMetadata_configuration_IDSPrimitives_messageBroadcaster_timerSource_dataMessageQueue_dataAggregator_assertion_workQueue_delegateQueue_destinationAddress_sourceAppleID___block_invoke;
    v56[3] = &unk_2641DC1B0;
    objc_copyWeak(&v57, &location);
    uint64_t v39 = [v55 scheduleRepeatTimerWithIdentifier:v35 timeInterval:v20 queue:v38 totalFires:v56 fireHandler:v37];
    mKeepAliveTimer = v24->mKeepAliveTimer;
    v24->mKeepAliveTimer = (CATResettableTimer *)v39;

    v41 = [CATIDSServiceConnectionMessageProcessor alloc];
    v42 = [v54 connectionIdentifier];
    uint64_t v43 = [(CATIDSServiceConnectionMessageProcessor *)v41 initWithWorkQueue:v20 connectionIdentifier:v42];
    mMessageProcessor = v24->mMessageProcessor;
    v24->mMessageProcessor = (CATIDSServiceConnectionMessageProcessor *)v43;

    [(CATIDSServiceConnectionDataMessageQueue *)v24->mDataMessageQueue setDelegate:v24];
    [(CATIDSServiceConnectionDataAggregator *)v24->mDataAggregator setDelegate:v24];
    [(CATIDSServiceConnectionMessageProcessor *)v24->mMessageProcessor setDelegate:v24];
    objc_destroyWeak(&v57);

    objc_destroyWeak(&location);
    id v21 = v25;
  }

  return v24;
}

void __202__CATIDSServiceConnection_initWithMetadata_configuration_IDSPrimitives_messageBroadcaster_timerSource_dataMessageQueue_dataAggregator_assertion_workQueue_delegateQueue_destinationAddress_sourceAppleID___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v6 = (id *)(a1 + 32);
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained keepAliveTimerDidFire:v7 fireCount:a3 isFinalFire:a4];
}

+ (CATIDSServiceConnection)connectionWithMetadata:(id)a3 configuration:(id)a4 IDSPrimitives:(id)a5 messageBroadcaster:(id)a6 timerSource:(id)a7 dataMessageQueue:(id)a8 dataAggregator:(id)a9 assertion:(id)a10 workQueue:(id)a11 delegateQueue:(id)a12 destinationAddress:(id)a13 sourceAppleID:(id)a14
{
  id v32 = a14;
  id v30 = a13;
  id v24 = a12;
  id v29 = a11;
  id v28 = a10;
  id v25 = a9;
  id v27 = a8;
  id v18 = a7;
  id v19 = a6;
  id v26 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = [[CATIDSServiceConnection alloc] initWithMetadata:v21 configuration:v20 IDSPrimitives:v26 messageBroadcaster:v19 timerSource:v18 dataMessageQueue:v27 dataAggregator:v25 assertion:v28 workQueue:v29 delegateQueue:v24 destinationAddress:v30 sourceAppleID:v32];

  [v19 addBroadcastHandler:v22];

  return v22;
}

+ (CATIDSServiceConnection)connectionWithMetadata:(id)a3 configuration:(id)a4 capabilities:(id)a5 IDSPrimitives:(id)a6 messageBroadcaster:(id)a7 timerSource:(id)a8 assertion:(id)a9 workQueue:(id)a10 delegateQueue:(id)a11 destinationAddress:(id)a12 sourceAppleID:(id)a13
{
  id v45 = a13;
  id v44 = a12;
  id v18 = a11;
  id v19 = a10;
  id v43 = a9;
  id v20 = a8;
  id v42 = a7;
  id v39 = a6;
  id v21 = a5;
  id v22 = a4;
  id v38 = a3;
  id v23 = v22;
  v41 = -[CATConcreteIDSServiceConnectionDataChunker initWithWorkQueue:maxDataLength:]([CATConcreteIDSServiceConnectionDataChunker alloc], "initWithWorkQueue:maxDataLength:", v19, [v22 maxDataSendSize]);
  id v24 = [CATConcreteIDSServiceConnectionDataMessageQueue alloc];
  id v25 = v23;
  [v23 messageQueueFlushPromptInterval];
  id v26 = v19;
  id v28 = -[CATConcreteIDSServiceConnectionDataMessageQueue initWithWorkQueue:timerSource:dataChunker:flushPromptInterval:supportsRetransmit:](v24, "initWithWorkQueue:timerSource:dataChunker:flushPromptInterval:supportsRetransmit:", v19, v20, v41, [v21 supportsReliableDelivery], v27);
  id v29 = [CATConcreteIDSServiceConnectionDataAggregator alloc];
  id v30 = v25;
  v35 = v25;
  [v25 missingItemsCheckinInterval];
  double v32 = v31;
  uint64_t v33 = [v21 supportsReliableDelivery];

  double v36 = [(CATConcreteIDSServiceConnectionDataAggregator *)v29 initWithWorkQueue:v26 timerSource:v20 missingItemInterval:v33 supportsSequenceCorrection:v32];
  id v37 = +[CATIDSServiceConnection connectionWithMetadata:v38 configuration:v30 IDSPrimitives:v39 messageBroadcaster:v42 timerSource:v20 dataMessageQueue:v28 dataAggregator:v36 assertion:v43 workQueue:v26 delegateQueue:v18 destinationAddress:v44 sourceAppleID:v45];

  return (CATIDSServiceConnection *)v37;
}

- (void)sendData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mWorkQueue = self->mWorkQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__CATIDSServiceConnection_sendData_completion___block_invoke;
  v13[3] = &unk_2641DC1D8;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v9 = v13;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_7;
  block[3] = &unk_2641DBD98;
  id v17 = v9;
  v10 = mWorkQueue;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, block);
}

uint64_t __47__CATIDSServiceConnection_sendData_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendData:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)close
{
  mWorkQueue = self->mWorkQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __32__CATIDSServiceConnection_close__block_invoke;
  v5[3] = &unk_2641DBE60;
  v5[4] = self;
  v3 = v5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_7;
  block[3] = &unk_2641DBD98;
  id v7 = v3;
  v4 = mWorkQueue;
  dispatch_async(v4, block);
}

uint64_t __32__CATIDSServiceConnection_close__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _close];
}

- (void)_sendData:(id)a3 completion:(id)a4
{
  mWorkQueue = self->mWorkQueue;
  id v7 = a4;
  id v8 = a3;
  CATAssertIsQueue(mWorkQueue);
  [(CATIDSServiceConnectionDataMessageQueue *)self->mDataMessageQueue receiveData:v8 completion:v7];
}

- (void)_close
{
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if (![(CATIDSServiceConnection *)self isClosed])
  {
    [(CATIDSServiceConnection *)self tearDownWithError:0 shouldReportToRemote:1];
  }
}

- (void)connectionDataAggregator:(id)a3 aggregatedData:(id)a4 withNumber:(unint64_t)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a4;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if (![(CATIDSServiceConnection *)self isClosed])
  {
    id v8 = _CATLogGeneral_2();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a5;
      _os_log_impl(&dword_213B7F000, v8, OS_LOG_TYPE_INFO, "%{public}@ received data number %lu", buf, 0x16u);
    }

    mDelegateQueue = self->mDelegateQueue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __78__CATIDSServiceConnection_connectionDataAggregator_aggregatedData_withNumber___block_invoke;
    v12[3] = &unk_2641DC000;
    v12[4] = self;
    id v13 = v7;
    v10 = v12;
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __CATPerformBlock_block_invoke_7;
    id v15 = &unk_2641DBD98;
    id v16 = v10;
    id v11 = mDelegateQueue;
    dispatch_async(v11, buf);
  }
}

void __78__CATIDSServiceConnection_connectionDataAggregator_aggregatedData_withNumber___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 connection:*(void *)(a1 + 32) receivedData:*(void *)(a1 + 40)];
}

- (void)connectionDataAggregator:(id)a3 isMissingSequenceNumbers:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if (![(CATIDSServiceConnection *)self isClosed])
  {
    id v6 = _CATLogGeneral_2();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 138543618;
      v9 = self;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_impl(&dword_213B7F000, v6, OS_LOG_TYPE_INFO, "%{public}@ missing sequence numbers. Requesting retransmission of %{public}@", (uint8_t *)&v8, 0x16u);
    }

    id v7 = [(CATIDSServiceConnection *)self retransmitContentForSequenceNumbers:v5];
    [(CATIDSServiceConnection *)self sendContent:v7];
  }
}

- (void)connectionDataAggregatorWantsToReportSequenceNumber:(id)a3
{
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  id v4 = [(id)objc_opt_class() acknowledgeContent];
  [(CATIDSServiceConnection *)self sendContent:v4];
}

- (void)messageProcessorWantsToAcknowledgeRemote:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  id v4 = _CATLogGeneral_2();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl(&dword_213B7F000, v4, OS_LOG_TYPE_INFO, "%{public}@ sending acknowledge to remote", (uint8_t *)&v6, 0xCu);
  }

  id v5 = [(id)objc_opt_class() acknowledgeContent];
  [(CATIDSServiceConnection *)self sendContent:v5];
}

- (void)messageProcessorWantsToExtendKeepAlive:(id)a3
{
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  mKeepAliveTimer = self->mKeepAliveTimer;

  [(CATResettableTimer *)mKeepAliveTimer reset];
}

- (void)messageProcessor:(id)a3 wantsToCloseWithError:(id)a4
{
  v10[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if (![(CATIDSServiceConnection *)self isClosed])
  {
    int v6 = _CATLogGeneral_2();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CATIDSServiceConnection messageProcessor:wantsToCloseWithError:]((uint64_t)self, v5, v6);
    }

    if (v5)
    {
      uint64_t v9 = *MEMORY[0x263F08608];
      v10[0] = v5;
      id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    }
    else
    {
      id v7 = 0;
    }
    uint64_t v8 = CATErrorWithCodeAndUserInfo(603, v7);
    [(CATIDSServiceConnection *)self tearDownWithError:v8 shouldReportToRemote:0];
  }
}

- (void)messageProcessor:(id)a3 wantsAggregation:(id)a4
{
  mWorkQueue = self->mWorkQueue;
  id v6 = a4;
  CATAssertIsQueue(mWorkQueue);
  [(CATIDSServiceConnectionDataAggregator *)self->mDataAggregator receiveDataContent:v6];
}

- (void)messageProcessor:(id)a3 wantsRetransmission:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  uint64_t v6 = [v5 count];
  id v7 = _CATLogGeneral_2();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      int v12 = 138543618;
      id v13 = self;
      __int16 v14 = 2114;
      id v15 = v5;
      uint64_t v9 = "%{public}@ attempting to retransmit %{public}@";
      __int16 v10 = v7;
      uint32_t v11 = 22;
LABEL_6:
      _os_log_impl(&dword_213B7F000, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v12, v11);
    }
  }
  else if (v8)
  {
    int v12 = 138543362;
    id v13 = self;
    uint64_t v9 = "%{public}@ attempting to retransmit the world";
    __int16 v10 = v7;
    uint32_t v11 = 12;
    goto LABEL_6;
  }

  [(CATIDSServiceConnectionDataMessageQueue *)self->mDataMessageQueue retransmitSequenceNumbers:v5];
}

- (void)messageProcessor:(id)a3 receivedExpectedSequence:(unint64_t)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  uint64_t v6 = _CATLogGeneral_2();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543618;
    BOOL v8 = self;
    __int16 v9 = 2048;
    unint64_t v10 = a4;
    _os_log_impl(&dword_213B7F000, v6, OS_LOG_TYPE_INFO, "%{public}@ received request to compute missing sequence numbers with expected sequence number %lu", (uint8_t *)&v7, 0x16u);
  }

  [(CATIDSServiceConnectionDataAggregator *)self->mDataAggregator receiveExpectedSequenceNumber:a4];
}

- (void)messageProcessor:(id)a3 wantsToAckUpTo:(unint64_t)a4
{
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  mDataMessageQueue = self->mDataMessageQueue;

  [(CATIDSServiceConnectionDataMessageQueue *)mDataMessageQueue receiveRemoteSequenceNumber:a4];
}

- (void)processMessage:(id)a3 senderAppleID:(id)a4 senderAddress:(id)a5
{
  id v19 = a3;
  id v7 = a5;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if (![(CATIDSServiceConnection *)self isClosed]
    && [v7 isEqual:self->mDestinationAddress])
  {
    BOOL v8 = +[CATIDSMessagePayload instanceWithDictionary:v19];
    __int16 v9 = v8;
    if (v8)
    {
      unint64_t v10 = [v8 metadata];
      uint64_t v11 = [v10 messageType];

      if (v11 == 102)
      {
        int v12 = [v9 message];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v13 = [MEMORY[0x263F08690] currentHandler];
          __int16 v14 = [NSString stringWithUTF8String:"-[CATIDSServiceConnection processMessage:senderAppleID:senderAddress:]"];
          id v15 = (objc_class *)objc_opt_class();
          uint64_t v16 = NSStringFromClass(v15);
          uint64_t v17 = (objc_class *)objc_opt_class();
          id v18 = NSStringFromClass(v17);
          [v13 handleFailureInFunction:v14, @"CATIDSServiceConnection.m", 393, @"expected %@, got %@", v16, v18 file lineNumber description];
        }
        [(CATIDSServiceConnectionMessageProcessor *)self->mMessageProcessor receiveMessage:v12];
      }
    }
  }
}

- (void)dataMessageQueue:(id)a3 wantsToCheckRemote:(unint64_t)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  uint64_t v6 = _CATLogGeneral_2();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543362;
    __int16 v9 = self;
    _os_log_impl(&dword_213B7F000, v6, OS_LOG_TYPE_INFO, "%{public}@ requesting remote computes missing data.", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(CATIDSServiceConnection *)self requestMissingDataContentWithExpectedSequenceNumber:a4];
  [(CATIDSServiceConnection *)self sendContent:v7];
}

- (void)dataMessageQueue:(id)a3 needsToSendContents:(id)a4 shouldSkipTheLine:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  int v12 = (void (**)(id, void *))a6;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if ([(CATIDSServiceConnection *)self isClosed])
  {
    id v13 = CATErrorWithCodeAndUserInfo(100, 0);
    v12[2](v12, v13);
  }
  else if (v7)
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __93__CATIDSServiceConnection_dataMessageQueue_needsToSendContents_shouldSkipTheLine_completion___block_invoke;
    v34[3] = &unk_2641DC200;
    v34[4] = self;
    objc_msgSend(v11, "cat_forEach:", v34);
    v12[2](v12, 0);
  }
  else
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __93__CATIDSServiceConnection_dataMessageQueue_needsToSendContents_shouldSkipTheLine_completion___block_invoke_2;
    v33[3] = &unk_2641DC228;
    v33[4] = self;
    uint64_t v14 = objc_msgSend(v11, "cat_map:", v33);
    id v15 = objc_opt_new();
    [v15 setFireAndForget:1];
    id v24 = v15;
    id v25 = (void *)v14;
    uint64_t v16 = [[CATSendSerialIDSMessagesOperation alloc] initWithIDSPrimitives:self->mIDSPrimitives workQueue:self->mWorkQueue messages:v14 destinationAddress:self->mDestinationAddress sourceAppleID:self->mSourceAppleID options:v15];
    objc_initWeak(&location, self);
    uint64_t v17 = self->mWorkQueue;
    id v18 = self->mDelegateQueue;
    id v19 = (void *)MEMORY[0x263F086D0];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __93__CATIDSServiceConnection_dataMessageQueue_needsToSendContents_shouldSkipTheLine_completion___block_invoke_3;
    v26[3] = &unk_2641DC250;
    id v20 = v17;
    double v27 = v20;
    id v21 = v18;
    id v28 = v21;
    id v30 = v12;
    id v22 = v16;
    id v29 = v22;
    objc_copyWeak(&v31, &location);
    id v23 = [v19 blockOperationWithBlock:v26];
    [v23 addDependency:v22];
    [(CATOperationQueue *)self->mSendQueue addOperation:v22];
    [(CATSerialOperationEnqueuer *)self->mControlOperationEnqueuer addOperation:v23];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
}

uint64_t __93__CATIDSServiceConnection_dataMessageQueue_needsToSendContents_shouldSkipTheLine_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sendContent:a2];
}

CATActiveServiceConnectionIDSMessage *__93__CATIDSServiceConnection_dataMessageQueue_needsToSendContents_shouldSkipTheLine_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [CATActiveServiceConnectionIDSMessage alloc];
  id v5 = [*(id *)(a1 + 32) metadata];
  uint64_t v6 = [v5 connectionIdentifier];
  BOOL v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "receivedSequenceNumber"));
  int v8 = [(CATActiveServiceConnectionIDSMessage *)v4 initWithConnectionIdentifier:v6 receivedSequenceNumber:v7 content:v3];

  return v8;
}

void __93__CATIDSServiceConnection_dataMessageQueue_needsToSendContents_shouldSkipTheLine_completion___block_invoke_3(uint64_t a1)
{
  v20[1] = *MEMORY[0x263EF8340];
  CATAssertIsQueue(*(dispatch_queue_t *)(a1 + 32));
  id v2 = *(void **)(a1 + 40);
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __93__CATIDSServiceConnection_dataMessageQueue_needsToSendContents_shouldSkipTheLine_completion___block_invoke_4;
  uint64_t v14 = &unk_2641DBD70;
  id v16 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 48);
  id v3 = &v11;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_7;
  block[3] = &unk_2641DBD98;
  id v18 = v3;
  id v4 = v2;
  dispatch_async(v4, block);

  id v5 = objc_msgSend(*(id *)(a1 + 48), "error", v11, v12, v13, v14);

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    BOOL v7 = WeakRetained;
    if (WeakRetained && ([WeakRetained isClosed] & 1) == 0)
    {
      uint64_t v19 = *MEMORY[0x263F08608];
      int v8 = [*(id *)(a1 + 48) error];
      v20[0] = v8;
      __int16 v9 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
      id v10 = CATErrorWithCodeAndUserInfo(604, v9);

      [v7 tearDownWithError:v10 shouldReportToRemote:0];
    }
  }
}

void __93__CATIDSServiceConnection_dataMessageQueue_needsToSendContents_shouldSkipTheLine_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

+ (id)keepAliveTimerIdentifier
{
  id v2 = NSString;
  id v3 = NSStringFromClass((Class)a1);
  id v4 = [v2 stringWithFormat:@"%@-KeepAliveTimer", v3];

  return v4;
}

- (void)keepAliveTimerDidFire:(id)a3 fireCount:(unint64_t)a4 isFinalFire:(BOOL)a5
{
  BOOL v5 = a5;
  char v6 = a4;
  uint64_t v13 = *MEMORY[0x263EF8340];
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if (v5)
  {
    int v8 = _CATLogGeneral_2();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CATIDSServiceConnection keepAliveTimerDidFire:fireCount:isFinalFire:]((uint64_t)self, v8);
    }

    __int16 v9 = CATErrorWithCodeAndUserInfo(600, 0);
    [(CATIDSServiceConnection *)self tearDownWithError:v9 shouldReportToRemote:1];
  }
  else
  {
    if ((v6 & 1) == 0) {
      return;
    }
    id v10 = _CATLogGeneral_2();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 138543362;
      uint64_t v12 = self;
      _os_log_impl(&dword_213B7F000, v10, OS_LOG_TYPE_INFO, "%{public}@ sending keepalive to remote", (uint8_t *)&v11, 0xCu);
    }

    __int16 v9 = [(id)objc_opt_class() keepAliveContent];
    [(CATIDSServiceConnection *)self sendContent:v9];
  }
}

- (void)sendContent:(id)a3
{
  id v4 = a3;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  BOOL v5 = [CATActiveServiceConnectionIDSMessage alloc];
  char v6 = [(CATIDSServiceConnection *)self metadata];
  BOOL v7 = [v6 connectionIdentifier];
  int v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CATIDSServiceConnectionDataAggregator receivedSequenceNumber](self->mDataAggregator, "receivedSequenceNumber"));
  __int16 v9 = [(CATActiveServiceConnectionIDSMessage *)v5 initWithConnectionIdentifier:v7 receivedSequenceNumber:v8 content:v4];

  id v10 = [[CATIDSMessagePayload alloc] initWithMessage:v9];
  int v11 = [(CATIDSMessagePayload *)v10 dictionaryValue];
  if (![(CATIDSServiceConnection *)self isClosed])
  {
    objc_initWeak(&location, self);
    uint64_t v12 = self->mWorkQueue;
    uint64_t v13 = objc_opt_new();
    [v13 setFireAndForget:1];
    mSourceAppleID = self->mSourceAppleID;
    mIDSPrimitives = self->mIDSPrimitives;
    mDestinationAddress = self->mDestinationAddress;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __39__CATIDSServiceConnection_sendContent___block_invoke;
    v18[3] = &unk_2641DC2A0;
    uint64_t v17 = v12;
    uint64_t v19 = v17;
    objc_copyWeak(&v21, &location);
    id v20 = v11;
    [(CATIDSPrimitives *)mIDSPrimitives sendMessage:v20 toAddress:mDestinationAddress fromID:mSourceAppleID options:v13 completion:v18];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

void __39__CATIDSServiceConnection_sendContent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__CATIDSServiceConnection_sendContent___block_invoke_2;
  v8[3] = &unk_2641DC278;
  id v9 = v3;
  id v5 = v3;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  id v10 = *(id *)(a1 + 40);
  char v6 = v8;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_7;
  block[3] = &unk_2641DBD98;
  id v13 = v6;
  BOOL v7 = v4;
  dispatch_async(v7, block);

  objc_destroyWeak(&v11);
}

void __39__CATIDSServiceConnection_sendContent___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      id v3 = _CATLogGeneral_2();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = *(void *)(a1 + 40);
        int v8 = [*(id *)(a1 + 32) verboseDescription];
        *(_DWORD *)buf = 138543874;
        id v12 = WeakRetained;
        __int16 v13 = 2114;
        uint64_t v14 = v7;
        __int16 v15 = 2114;
        id v16 = v8;
        _os_log_error_impl(&dword_213B7F000, v3, OS_LOG_TYPE_ERROR, "%{public}@ Failed to send IDS message %{public}@ from. Error: %{public}@", buf, 0x20u);
      }
      if (([WeakRetained isClosed] & 1) == 0)
      {
        uint64_t v4 = *(void *)(a1 + 32);
        uint64_t v9 = *MEMORY[0x263F08608];
        uint64_t v10 = v4;
        id v5 = [NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
        char v6 = CATErrorWithCodeAndUserInfo(604, v5);

        [WeakRetained tearDownWithError:v6 shouldReportToRemote:0];
      }
    }
  }
}

- (void)tearDownWithError:(id)a3 shouldReportToRemote:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if (![(CATIDSServiceConnection *)self isClosed])
  {
    [(CATOperationQueue *)self->mSendQueue cancelAllOperations];
    [(CATIDSSubscription *)self->mMessageSubscription cancel];
    [(CATResettableTimer *)self->mKeepAliveTimer invalidate];
    if (v4)
    {
      uint64_t v7 = [(id)objc_opt_class() closeContentWithError:v6];
      [(CATIDSServiceConnection *)self sendContent:v7];
    }
    [(CATCancelable *)self->mAssertion cancel];
    [(CATIDSServiceConnection *)self setClosed:1];
    [(CATIDSServiceConnection *)self setClosedError:v6];
    mDelegateQueue = self->mDelegateQueue;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __66__CATIDSServiceConnection_tearDownWithError_shouldReportToRemote___block_invoke;
    v11[3] = &unk_2641DBE60;
    v11[4] = self;
    uint64_t v9 = v11;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __CATPerformBlock_block_invoke_7;
    block[3] = &unk_2641DBD98;
    id v13 = v9;
    uint64_t v10 = mDelegateQueue;
    dispatch_async(v10, block);
  }
}

void __66__CATIDSServiceConnection_tearDownWithError_shouldReportToRemote___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 connectionClosed:*(void *)(a1 + 32)];
}

+ (id)closeContentWithError:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[CATActiveIDSServiceConnectionContentClose alloc] initWithError:v3];

  return v4;
}

+ (id)acknowledgeContent
{
  id v2 = objc_opt_new();

  return v2;
}

+ (id)keepAliveContent
{
  id v2 = objc_opt_new();

  return v2;
}

- (id)retransmitContentForSequenceNumbers:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[CATActiveIDSServiceConnectionContentRetransmit alloc] initWithSequenceNumbers:v3];

  return v4;
}

- (id)requestMissingDataContentWithExpectedSequenceNumber:(unint64_t)a3
{
  id v3 = [[CATActiveIDSServiceConnectionContentRequestMissingData alloc] initWithExpectedSequenceNumber:a3];

  return v3;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CATIDSServiceConnection *)self metadata];
  mDestinationAddress = self->mDestinationAddress;
  if ([(CATIDSServiceConnection *)self isClosed]) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  int v8 = [(CATIDSServiceConnection *)self closedError];
  uint64_t v9 = [v3 stringWithFormat:@"<%@: %p { metadata = %@, destinationAddress = %@, isClosed = %@, closedError = %@ }>", v4, self, v5, mDestinationAddress, v7, v8];

  return v9;
}

- (CATIDSServiceConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CATIDSServiceConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CATIDSServiceConnectionMetadata)metadata
{
  return self->_metadata;
}

- (BOOL)isClosed
{
  return self->_closed;
}

- (void)setClosed:(BOOL)a3
{
  self->_closed = a3;
}

- (NSError)closedError
{
  return self->_closedError;
}

- (void)setClosedError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closedError, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mMessageSubscription, 0);
  objc_storeStrong((id *)&self->mMessageProcessor, 0);
  objc_storeStrong((id *)&self->mKeepAliveTimer, 0);
  objc_storeStrong((id *)&self->mControlOperationEnqueuer, 0);
  objc_storeStrong((id *)&self->mSendQueue, 0);
  objc_storeStrong((id *)&self->mDelegateQueue, 0);
  objc_storeStrong((id *)&self->mWorkQueue, 0);
  objc_storeStrong((id *)&self->mDataAggregator, 0);
  objc_storeStrong((id *)&self->mDataMessageQueue, 0);
  objc_storeStrong((id *)&self->mMessageBroadcaster, 0);
  objc_storeStrong((id *)&self->mAssertion, 0);
  objc_storeStrong((id *)&self->mIDSPrimitives, 0);
  objc_storeStrong((id *)&self->mSourceAppleID, 0);

  objc_storeStrong((id *)&self->mDestinationAddress, 0);
}

- (void)messageProcessor:(NSObject *)a3 wantsToCloseWithError:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [a2 verboseDescription];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_213B7F000, a3, OS_LOG_TYPE_ERROR, "%{public}@ closed by the remote. Error: %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)keepAliveTimerDidFire:(uint64_t)a1 fireCount:(NSObject *)a2 isFinalFire:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 56);
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_213B7F000, a2, OS_LOG_TYPE_ERROR, "%{public}@ timed out waiting to hear anything from the remote. Aggregator: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end