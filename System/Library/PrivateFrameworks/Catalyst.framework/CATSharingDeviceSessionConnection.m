@interface CATSharingDeviceSessionConnection
- (BOOL)isClosed;
- (CATSharingConnectionDelegate)delegate;
- (CATSharingDevice)remoteDevice;
- (CATSharingDeviceSessionConnection)initWithDeviceSession:(id)a3 timerSource:(id)a4;
- (NSError)closedError;
- (void)_close;
- (void)_sendData:(id)a3 completion:(id)a4;
- (void)addDeviceSessionHandlers;
- (void)close;
- (void)closeWithError:(id)a3 reportToRemote:(BOOL)a4;
- (void)didReceiveMessage:(id)a3;
- (void)handleCloseMessage:(id)a3;
- (void)handleSentMessage:(id)a3;
- (void)handleUnparsableMessageDictionary:(id)a3;
- (void)removeDeviceSessionHandlers;
- (void)sendData:(id)a3 completion:(id)a4;
- (void)sendMessage:(id)a3 completion:(id)a4;
- (void)sendTearDownMessageWithError:(id)a3;
- (void)setClosed:(BOOL)a3;
- (void)setClosedError:(id)a3;
- (void)setDelegate:(id)a3;
- (void)tombstoneWithError:(id)a3;
@end

@implementation CATSharingDeviceSessionConnection

- (CATSharingDeviceSessionConnection)initWithDeviceSession:(id)a3 timerSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CATSharingDeviceSessionConnection;
  v9 = [(CATSharingDeviceSessionConnection *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mDeviceSession, a3);
    objc_storeStrong((id *)&v10->mTimerSource, a4);
    [(CATSharingDeviceSessionConnection *)v10 addDeviceSessionHandlers];
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
  return (CATSharingDevice *)[(CATSharingDeviceSession *)self->mDeviceSession remoteDevice];
}

- (void)sendData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__CATSharingDeviceSessionConnection_sendData_completion___block_invoke;
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
  block[2] = __CATPerformBlock_block_invoke_3;
  block[3] = &unk_2641DBD98;
  id v18 = v10;
  dispatch_async(v11, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __57__CATSharingDeviceSessionConnection_sendData_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _sendData:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)close
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__CATSharingDeviceSessionConnection_close__block_invoke;
  v4[3] = &unk_2641DBCB0;
  objc_copyWeak(&v5, &location);
  v2 = v4;
  v3 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_3;
  block[3] = &unk_2641DBD98;
  id v8 = v2;
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __42__CATSharingDeviceSessionConnection_close__block_invoke(uint64_t a1)
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

  if (self->mIsClosing || [(CATSharingDeviceSessionConnection *)self isClosed])
  {
    CATErrorWithCodeAndUserInfo(100, 0);
    id v8 = (CATSharingSentMessage *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v8);
  }
  else
  {
    id v8 = [[CATSharingSentMessage alloc] initWithContent:v10];
    id v9 = [[CATSharingMessage alloc] initWithContentMessage:v8];
    [(CATSharingDeviceSessionConnection *)self sendMessage:v9 completion:v6];
  }
}

- (void)_close
{
  v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  if (![(CATSharingDeviceSessionConnection *)self isClosed] && !self->mIsClosing)
  {
    [(CATSharingDeviceSessionConnection *)self closeWithError:0 reportToRemote:1];
  }
}

- (void)sendMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = CATGetCatalystQueue();
  CATAssertIsQueue(v8);

  if ([(CATSharingDeviceSessionConnection *)self isClosed])
  {
    uint64_t v9 = 100;
LABEL_8:
    objc_super v17 = CATErrorWithCodeAndUserInfo(v9, 0);
    v7[2](v7, v17);

    goto LABEL_9;
  }
  p_mDeviceSession = (uint64_t *)&self->mDeviceSession;
  if (([(CATSharingDeviceSession *)self->mDeviceSession isReady] & 1) == 0)
  {
    id v15 = _CATLogGeneral_1();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CATSharingDeviceSessionConnection sendMessage:completion:](p_mDeviceSession, v15, v16);
    }

    uint64_t v9 = 504;
    goto LABEL_8;
  }
  uint64_t v11 = [[CATSendDeviceSessionMessageOperation alloc] initWithDeviceSession:self->mDeviceSession message:v6];
  v12 = (void *)MEMORY[0x263F086D0];
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __60__CATSharingDeviceSessionConnection_sendMessage_completion___block_invoke;
  v21 = &unk_2641DC0E8;
  v22 = v11;
  v23 = v7;
  id v13 = v11;
  id v14 = [v12 blockOperationWithBlock:&v18];
  objc_msgSend(v14, "addDependency:", v13, v18, v19, v20, v21);
  [(CATOperationQueue *)self->mOutgoingQueue addOperation:v13];
  [(CATOperationQueue *)self->mCatalystQueue addOperation:v14];

LABEL_9:
}

void __60__CATSharingDeviceSessionConnection_sendMessage_completion___block_invoke(uint64_t a1)
{
  v2 = CATGetCatalystQueue();
  CATAssertIsQueue(v2);

  v3 = [*(id *)(a1 + 32) error];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v3)
  {
    v4 = _CATLogGeneral_1();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __60__CATSharingDeviceSessionConnection_sendMessage_completion___block_invoke_cold_1(v3, v4);
    }
  }
}

- (void)closeWithError:(id)a3 reportToRemote:(BOOL)a4
{
  id v7 = a3;
  id v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  if (![(CATSharingDeviceSessionConnection *)self isClosed] && !self->mIsClosing)
  {
    self->mIsClosing = 1;
    if (a4) {
      [(CATSharingDeviceSessionConnection *)self sendTearDownMessageWithError:v7];
    }
    else {
      [(CATSharingDeviceSessionConnection *)self tombstoneWithError:v7];
    }
  }
}

- (void)tombstoneWithError:(id)a3
{
  id v6 = a3;
  v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  if (![(CATSharingDeviceSessionConnection *)self isClosed])
  {
    [(CATSharingDeviceSessionConnection *)self setClosed:1];
    self->mIsClosing = 0;
    [(CATOperationQueue *)self->mOutgoingQueue cancelAllOperations];
    [(CATSharingDeviceSessionConnection *)self removeDeviceSessionHandlers];
    [(CATSharingDeviceSession *)self->mDeviceSession deactivate];
    [(CATSharingDeviceSessionConnection *)self setClosedError:v6];
    id v5 = [(CATSharingDeviceSessionConnection *)self delegate];
    [v5 connectionClosed:self];
  }
}

- (void)addDeviceSessionHandlers
{
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__CATSharingDeviceSessionConnection_addDeviceSessionHandlers__block_invoke;
  v6[3] = &unk_2641DC028;
  objc_copyWeak(&v7, &location);
  v3 = (void *)MEMORY[0x216693330](v6);
  [(CATSharingDeviceSession *)self->mDeviceSession setDeviceSessionInvalidatedHandler:v3];
  [(CATSharingDeviceSession *)self->mDeviceSession setDeviceSessionErrorHandler:v3];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__CATSharingDeviceSessionConnection_addDeviceSessionHandlers__block_invoke_3;
  v4[3] = &unk_2641DC050;
  objc_copyWeak(&v5, &location);
  [(CATSharingDeviceSession *)self->mDeviceSession setMessageReceivedHandler:v4];
  objc_destroyWeak(&v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __61__CATSharingDeviceSessionConnection_addDeviceSessionHandlers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained && ([WeakRetained isClosed] & 1) == 0)
  {
    id v6 = (void *)v5[6];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __61__CATSharingDeviceSessionConnection_addDeviceSessionHandlers__block_invoke_2;
    v7[3] = &unk_2641DC000;
    v7[4] = v5;
    id v8 = v3;
    [v6 addOperationWithBlock:v7];
  }
}

uint64_t __61__CATSharingDeviceSessionConnection_addDeviceSessionHandlers__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeWithError:*(void *)(a1 + 40) reportToRemote:0];
}

void __61__CATSharingDeviceSessionConnection_addDeviceSessionHandlers__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained && ([WeakRetained isClosed] & 1) == 0)
  {
    id v6 = (void *)v5[6];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __61__CATSharingDeviceSessionConnection_addDeviceSessionHandlers__block_invoke_4;
    v7[3] = &unk_2641DC000;
    v7[4] = v5;
    id v8 = v3;
    [v6 addOperationWithBlock:v7];
  }
}

uint64_t __61__CATSharingDeviceSessionConnection_addDeviceSessionHandlers__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) didReceiveMessage:*(void *)(a1 + 40)];
}

- (void)removeDeviceSessionHandlers
{
  id v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  [(CATSharingDeviceSession *)self->mDeviceSession setDeviceSessionInvalidatedHandler:0];
  mDeviceSession = self->mDeviceSession;

  [(CATSharingDeviceSession *)mDeviceSession setDeviceSessionInvalidatedHandler:0];
}

- (void)didReceiveMessage:(id)a3
{
  id v4 = a3;
  id v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  id v6 = +[CATSharingMessage instanceWithDictionary:v4];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 messageType];
    uint64_t v9 = [v7 contentDictionaryValue];
    if (v8 == 1)
    {
      [(CATSharingDeviceSessionConnection *)self handleSentMessage:v9];
    }
    else if (v8 == 2)
    {
      [(CATSharingDeviceSessionConnection *)self handleCloseMessage:v9];
    }
    else
    {
      id v10 = _CATLogGeneral_1();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CATSharingDeviceSessionConnection didReceiveMessage:](v8, v10);
      }

      [(CATSharingDeviceSessionConnection *)self handleUnparsableMessageDictionary:v9];
    }
  }
  else
  {
    [(CATSharingDeviceSessionConnection *)self handleUnparsableMessageDictionary:v4];
  }
}

- (void)handleUnparsableMessageDictionary:(id)a3
{
  id v4 = a3;
  id v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  if (![(CATSharingDeviceSessionConnection *)self isClosed])
  {
    id v6 = _CATLogGeneral_1();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(CATSharingDeviceSessionConnection *)(uint64_t)v4 handleUnparsableMessageDictionary:v7];
    }

    uint64_t v8 = CATErrorWithCodeAndUserInfo(300, 0);
    [(CATSharingDeviceSessionConnection *)self closeWithError:v8 reportToRemote:!self->mIsClosing];
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
      uint64_t v7 = [v5 closeError];
      [(CATSharingDeviceSessionConnection *)self closeWithError:v7 reportToRemote:0];
    }
  }
  else
  {
    [(CATSharingDeviceSessionConnection *)self handleUnparsableMessageDictionary:v8];
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
    id v6 = [(CATSharingDeviceSessionConnection *)self delegate];
    uint64_t v7 = [v5 content];
    [v6 connection:self receivedData:v7];
  }
  else
  {
    [(CATSharingDeviceSessionConnection *)self handleUnparsableMessageDictionary:v8];
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
  uint64_t v7 = v6;
  id v8 = [[CATSharingCloseMessage alloc] initWithError:v6];
  uint64_t v9 = [[CATSharingMessage alloc] initWithContentMessage:v8];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __66__CATSharingDeviceSessionConnection_sendTearDownMessageWithError___block_invoke;
  v21[3] = &unk_2641DC110;
  v21[4] = self;
  [(CATSharingDeviceSessionConnection *)self sendMessage:v9 completion:v21];
  objc_initWeak(&location, self);
  mTimerSource = self->mTimerSource;
  uint64_t v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  id v13 = CATGetCatalystQueue();
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __66__CATSharingDeviceSessionConnection_sendTearDownMessageWithError___block_invoke_9;
  v17[3] = &unk_2641DBE88;
  objc_copyWeak(&v19, &location);
  id v14 = v5;
  id v18 = v14;
  id v15 = [(CATTimerSource *)mTimerSource scheduleOneShotTimerWithIdentifier:v12 timeInterval:v13 queue:v17 fireHandler:0.5];
  mTombstoneTimer = self->mTombstoneTimer;
  self->mTombstoneTimer = v15;

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __66__CATSharingDeviceSessionConnection_sendTearDownMessageWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _CATLogGeneral_1();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __66__CATSharingDeviceSessionConnection_sendTearDownMessageWithError___block_invoke_cold_1(a1, v3, v4);
    }
  }
}

uint64_t __66__CATSharingDeviceSessionConnection_sendTearDownMessageWithError___block_invoke_9(uint64_t a1)
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

  objc_storeStrong((id *)&self->mDeviceSession, 0);
}

- (void)sendMessage:(uint64_t)a3 completion:.cold.1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138543362;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_0(&dword_213B7F000, a2, a3, "deviceSession: %{public}@ is not ready, refusing to send it messages.", (uint8_t *)&v4);
}

void __60__CATSharingDeviceSessionConnection_sendMessage_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 verboseDescription];
  int v5 = 138543362;
  uint64_t v6 = v3;
  OUTLINED_FUNCTION_0(&dword_213B7F000, a2, v4, "Error sending message: %{public}@", (uint8_t *)&v5);
}

- (void)didReceiveMessage:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSNumber numberWithInteger:a1];
  int v5 = 138543362;
  uint64_t v6 = v3;
  OUTLINED_FUNCTION_0(&dword_213B7F000, a2, v4, "Unknown message type: %{public}@", (uint8_t *)&v5);
}

- (void)handleUnparsableMessageDictionary:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 138543362;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0(&dword_213B7F000, a2, a3, "Message was unable to be parsed as %{public}@", (uint8_t *)&v3);
}

void __66__CATSharingDeviceSessionConnection_sendTearDownMessageWithError___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = [a2 verboseDescription];
  int v8 = 138543618;
  uint64_t v9 = v6;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  _os_log_error_impl(&dword_213B7F000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Error sending close message: %{public}@", (uint8_t *)&v8, 0x16u);
}

@end