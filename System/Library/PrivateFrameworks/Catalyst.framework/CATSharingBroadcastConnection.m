@interface CATSharingBroadcastConnection
- (BOOL)isClosed;
- (CATSharingBroadcastConnection)initWithBroadcastPrimitives:(id)a3 timerSource:(id)a4;
- (CATSharingConnectionDelegate)delegate;
- (CATSharingDevice)remoteDevice;
- (NSError)closedError;
- (void)_close;
- (void)_sendData:(id)a3 completion:(id)a4;
- (void)addBroadcastPrimitiveHandlers;
- (void)close;
- (void)closeWithError:(id)a3 reportToRemote:(BOOL)a4;
- (void)handleCloseMessage:(id)a3;
- (void)handleSentMessage:(id)a3;
- (void)handleUnparsableMessageDictionary:(id)a3;
- (void)messageReceived:(id)a3;
- (void)removeBroadcastPrimitiveHandlers;
- (void)sendData:(id)a3 completion:(id)a4;
- (void)sendMessage:(id)a3 completion:(id)a4;
- (void)sendTearDownMessageWithError:(id)a3;
- (void)setClosed:(BOOL)a3;
- (void)setClosedError:(id)a3;
- (void)setDelegate:(id)a3;
- (void)tombstoneWithError:(id)a3;
@end

@implementation CATSharingBroadcastConnection

- (CATSharingBroadcastConnection)initWithBroadcastPrimitives:(id)a3 timerSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CATSharingBroadcastConnection;
  v9 = [(CATSharingBroadcastConnection *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mBroadcastPrimitives, a3);
    objc_storeStrong((id *)&v10->mTimerSource, a4);
    [(CATSharingBroadcastConnection *)v10 addBroadcastPrimitiveHandlers];
    uint64_t v11 = objc_opt_new();
    mOutgoingQueue = v10->mOutgoingQueue;
    v10->mOutgoingQueue = (CATOperationQueue *)v11;

    uint64_t v13 = objc_opt_new();
    mCatalystQueue = v10->mCatalystQueue;
    v10->mCatalystQueue = (CATOperationQueue *)v13;

    v15 = CATGetCatalystQueue();
    [(CATOperationQueue *)v10->mCatalystQueue setUnderlyingQueue:v15];
  }
  return v10;
}

- (CATSharingDevice)remoteDevice
{
  return (CATSharingDevice *)[(CATSharingBroadcastPrimitives *)self->mBroadcastPrimitives remoteDevice];
}

- (void)sendData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__CATSharingBroadcastConnection_sendData_completion___block_invoke;
  v12[3] = &unk_2641DBFB0;
  objc_copyWeak(&v15, &location);
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  v10 = v12;
  uint64_t v11 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_1;
  block[3] = &unk_2641DBD98;
  id v18 = v10;
  dispatch_async(v11, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __53__CATSharingBroadcastConnection_sendData_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _sendData:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)close
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__CATSharingBroadcastConnection_close__block_invoke;
  v4[3] = &unk_2641DBCB0;
  objc_copyWeak(&v5, &location);
  v2 = v4;
  v3 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_1;
  block[3] = &unk_2641DBD98;
  id v8 = v2;
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __38__CATSharingBroadcastConnection_close__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _close];
}

- (void)_sendData:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, CATSharingSentMessage *))a4;
  id v7 = CATGetCatalystQueue();
  CATAssertIsQueue(v7);

  if (self->mIsClosing || [(CATSharingBroadcastConnection *)self isClosed])
  {
    CATErrorWithCodeAndUserInfo(100, 0);
    id v8 = (CATSharingSentMessage *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v8);
  }
  else
  {
    id v8 = [[CATSharingSentMessage alloc] initWithContent:v10];
    id v9 = [[CATSharingMessage alloc] initWithContentMessage:v8];
    [(CATSharingBroadcastConnection *)self sendMessage:v9 completion:v6];
  }
}

- (void)_close
{
  v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  if (![(CATSharingBroadcastConnection *)self isClosed] && !self->mIsClosing)
  {
    [(CATSharingBroadcastConnection *)self closeWithError:0 reportToRemote:1];
  }
}

- (void)sendMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = CATGetCatalystQueue();
  CATAssertIsQueue(v8);

  if ([(CATSharingBroadcastConnection *)self isClosed])
  {
    id v9 = CATErrorWithCodeAndUserInfo(100, 0);
    v7[2](v7, v9);
  }
  else
  {
    id v10 = [[CATSendBroadcastMessageOperation alloc] initWithBroadcastPrimitive:self->mBroadcastPrimitives message:v6];
    objc_initWeak(&location, self);
    uint64_t v11 = (void *)MEMORY[0x263F086D0];
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __56__CATSharingBroadcastConnection_sendMessage_completion___block_invoke;
    objc_super v17 = &unk_2641DBFD8;
    v12 = v10;
    id v18 = v12;
    v19 = v7;
    objc_copyWeak(&v20, &location);
    id v13 = [v11 blockOperationWithBlock:&v14];
    objc_msgSend(v13, "addDependency:", v12, v14, v15, v16, v17);
    [(CATOperationQueue *)self->mOutgoingQueue addOperation:v12];
    [(CATOperationQueue *)self->mCatalystQueue addOperation:v13];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

void __56__CATSharingBroadcastConnection_sendMessage_completion___block_invoke(uint64_t a1)
{
  v2 = CATGetCatalystQueue();
  CATAssertIsQueue(v2);

  id v4 = [*(id *)(a1 + 32) error];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained closeWithError:v4 reportToRemote:0];
  }
}

- (void)closeWithError:(id)a3 reportToRemote:(BOOL)a4
{
  id v7 = a3;
  id v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  if (![(CATSharingBroadcastConnection *)self isClosed] && !self->mIsClosing)
  {
    self->mIsClosing = 1;
    if (a4) {
      [(CATSharingBroadcastConnection *)self sendTearDownMessageWithError:v7];
    }
    else {
      [(CATSharingBroadcastConnection *)self tombstoneWithError:v7];
    }
  }
}

- (void)tombstoneWithError:(id)a3
{
  id v6 = a3;
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  if (![(CATSharingBroadcastConnection *)self isClosed])
  {
    [(CATSharingBroadcastConnection *)self setClosed:1];
    self->mIsClosing = 0;
    [(CATOperationQueue *)self->mOutgoingQueue cancelAllOperations];
    [(CATSharingBroadcastConnection *)self removeBroadcastPrimitiveHandlers];
    [(CATSharingBroadcastPrimitives *)self->mBroadcastPrimitives deactivate];
    [(CATSharingBroadcastConnection *)self setClosedError:v6];
    id v5 = [(CATSharingBroadcastConnection *)self delegate];
    [v5 connectionClosed:self];
  }
}

- (void)addBroadcastPrimitiveHandlers
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__CATSharingBroadcastConnection_addBroadcastPrimitiveHandlers__block_invoke;
  v5[3] = &unk_2641DC028;
  objc_copyWeak(&v6, &location);
  [(CATSharingBroadcastPrimitives *)self->mBroadcastPrimitives setInvalidationHandler:v5];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __62__CATSharingBroadcastConnection_addBroadcastPrimitiveHandlers__block_invoke_3;
  v3[3] = &unk_2641DC050;
  objc_copyWeak(&v4, &location);
  [(CATSharingBroadcastPrimitives *)self->mBroadcastPrimitives setMessageReceivedHandler:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __62__CATSharingBroadcastConnection_addBroadcastPrimitiveHandlers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained && ([WeakRetained isClosed] & 1) == 0 && !*((unsigned char *)v5 + 16))
  {
    id v6 = (void *)v5[6];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __62__CATSharingBroadcastConnection_addBroadcastPrimitiveHandlers__block_invoke_2;
    v7[3] = &unk_2641DC000;
    v7[4] = v5;
    id v8 = v3;
    [v6 addOperationWithBlock:v7];
  }
}

uint64_t __62__CATSharingBroadcastConnection_addBroadcastPrimitiveHandlers__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeWithError:*(void *)(a1 + 40) reportToRemote:0];
}

void __62__CATSharingBroadcastConnection_addBroadcastPrimitiveHandlers__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained && ([WeakRetained isClosed] & 1) == 0)
  {
    id v6 = (void *)v5[6];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __62__CATSharingBroadcastConnection_addBroadcastPrimitiveHandlers__block_invoke_4;
    v7[3] = &unk_2641DC000;
    v7[4] = v5;
    id v8 = v3;
    [v6 addOperationWithBlock:v7];
  }
}

uint64_t __62__CATSharingBroadcastConnection_addBroadcastPrimitiveHandlers__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) messageReceived:*(void *)(a1 + 40)];
}

- (void)removeBroadcastPrimitiveHandlers
{
  id v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  [(CATSharingBroadcastPrimitives *)self->mBroadcastPrimitives setInvalidationHandler:0];
  mBroadcastPrimitives = self->mBroadcastPrimitives;

  [(CATSharingBroadcastPrimitives *)mBroadcastPrimitives setMessageReceivedHandler:0];
}

- (void)messageReceived:(id)a3
{
  id v4 = a3;
  id v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  id v6 = +[CATSharingMessage instanceWithDictionary:v4];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 messageType];
    id v9 = [v7 contentDictionaryValue];
    if (v8 == 1)
    {
      [(CATSharingBroadcastConnection *)self handleSentMessage:v9];
    }
    else if (v8 == 2)
    {
      [(CATSharingBroadcastConnection *)self handleCloseMessage:v9];
    }
    else
    {
      id v10 = _CATLogGeneral_0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CATSharingBroadcastConnection messageReceived:](v8, v10);
      }

      [(CATSharingBroadcastConnection *)self handleUnparsableMessageDictionary:v9];
    }
  }
  else
  {
    [(CATSharingBroadcastConnection *)self handleUnparsableMessageDictionary:v4];
  }
}

- (void)handleUnparsableMessageDictionary:(id)a3
{
  id v4 = a3;
  id v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  if (![(CATSharingBroadcastConnection *)self isClosed])
  {
    id v6 = _CATLogGeneral_0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CATSharingBroadcastConnection handleUnparsableMessageDictionary:]((uint64_t)v4, v6);
    }

    id v7 = CATErrorWithCodeAndUserInfo(300, 0);
    [(CATSharingBroadcastConnection *)self closeWithError:v7 reportToRemote:!self->mIsClosing];
  }
}

- (void)handleCloseMessage:(id)a3
{
  id v8 = a3;
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  id v5 = +[CATSharingCloseMessage instanceWithDictionary:v8];
  id v6 = v5;
  if (v5)
  {
    if (!self->mIsClosing)
    {
      id v7 = [v5 closeError];
      [(CATSharingBroadcastConnection *)self closeWithError:v7 reportToRemote:0];
    }
  }
  else
  {
    [(CATSharingBroadcastConnection *)self handleUnparsableMessageDictionary:v8];
  }
}

- (void)handleSentMessage:(id)a3
{
  id v8 = a3;
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  id v5 = +[CATSharingSentMessage instanceWithDictionary:v8];
  if (v5)
  {
    id v6 = [(CATSharingBroadcastConnection *)self delegate];
    id v7 = [v5 content];
    [v6 connection:self receivedData:v7];
  }
  else
  {
    [(CATSharingBroadcastConnection *)self handleUnparsableMessageDictionary:v8];
  }
}

- (void)sendTearDownMessageWithError:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    CATErrorWithCodeAndUserInfo(103, 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v7 = v6;
  id v8 = [[CATSharingCloseMessage alloc] initWithError:v6];
  id v9 = [[CATSharingMessage alloc] initWithContentMessage:v8];
  [(CATSharingBroadcastConnection *)self sendMessage:v9 completion:&__block_literal_global_4];
  objc_initWeak(&location, self);
  mTimerSource = self->mTimerSource;
  uint64_t v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  id v13 = CATGetCatalystQueue();
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __62__CATSharingBroadcastConnection_sendTearDownMessageWithError___block_invoke_9;
  v17[3] = &unk_2641DBE88;
  objc_copyWeak(&v19, &location);
  id v14 = v5;
  id v18 = v14;
  uint64_t v15 = [(CATTimerSource *)mTimerSource scheduleOneShotTimerWithIdentifier:v12 timeInterval:v13 queue:v17 fireHandler:0.5];
  mTombstoneTimer = self->mTombstoneTimer;
  self->mTombstoneTimer = v15;

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __62__CATSharingBroadcastConnection_sendTearDownMessageWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _CATLogGeneral_0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __62__CATSharingBroadcastConnection_sendTearDownMessageWithError___block_invoke_cold_1((uint64_t)v2, v3);
    }
  }
}

uint64_t __62__CATSharingBroadcastConnection_sendTearDownMessageWithError___block_invoke_9(uint64_t a1)
{
  uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)WeakRetained;
    uint64_t WeakRetained = [(id)WeakRetained isClosed];
    uint64_t v3 = (uint64_t)v5;
    if ((WeakRetained & 1) == 0)
    {
      uint64_t WeakRetained = [v5 tombstoneWithError:*(void *)(a1 + 32)];
      uint64_t v3 = (uint64_t)v5;
    }
  }

  return MEMORY[0x270F9A758](WeakRetained, v3);
}

- (CATSharingConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CATSharingConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
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
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mCatalystQueue, 0);
  objc_storeStrong((id *)&self->mOutgoingQueue, 0);
  objc_storeStrong((id *)&self->mTombstoneTimer, 0);
  objc_storeStrong((id *)&self->mTimerSource, 0);

  objc_storeStrong((id *)&self->mBroadcastPrimitives, 0);
}

- (void)messageReceived:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSNumber numberWithInteger:a1];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_213B7F000, a2, OS_LOG_TYPE_ERROR, "Unknown message type: %{public}@", (uint8_t *)&v4, 0xCu);
}

- (void)handleUnparsableMessageDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_213B7F000, a2, OS_LOG_TYPE_ERROR, "Unable to decode message: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __62__CATSharingBroadcastConnection_sendTearDownMessageWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_213B7F000, a2, OS_LOG_TYPE_ERROR, "Error sending close message: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end