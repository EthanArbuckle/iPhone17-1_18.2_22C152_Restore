@interface HAP2AccessoryServerPairingDriver
+ (id)_generateWorkItemsForAuthMethod:(unint64_t)a3;
- (HAP2AccessoryServerEncoding)encoding;
- (HAP2AccessoryServerPairingDriver)initWithTransport:(id)a3 secureTransportFactory:(id)a4 encoding:(id)a5 featureFlags:(unint64_t)a6;
- (HAP2AccessoryServerPairingDriver)initWithTransport:(id)a3 secureTransportFactory:(id)a4 encoding:(id)a5 featureFlags:(unint64_t)a6 workItems:(id)a7;
- (HAP2AccessoryServerPairingDriverDelegate)delegate;
- (HAP2AccessoryServerSecureTransportFactory)secureTransportFactory;
- (HAP2AccessoryServerTransport)transport;
- (HAP2PropertyLock)propertyLock;
- (HAP2SerializedOperationQueue)operationQueue;
- (HAP2UnpairedAccessoryServer)accessoryServer;
- (HAPPairSetupSession)pairingSession;
- (HMFActivity)pairingActivity;
- (NSArray)workItems;
- (NSError)cancelError;
- (NSString)description;
- (id)currentWorkItem;
- (id)moveToNextWorkItem;
- (id)pairAccessory:(id)a3 delegate:(id)a4;
- (unint64_t)authMethod;
- (unint64_t)currentWorkItemIndex;
- (unint64_t)featureFlags;
- (void)_cancelWithError:(id)a3;
- (void)_pairingFinishedWithError:(id)a3;
- (void)cancelWithError:(id)a3;
- (void)setAccessoryServer:(id)a3;
- (void)setCancelError:(id)a3;
- (void)setCurrentWorkItemIndex:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPairingActivity:(id)a3;
- (void)setPairingSession:(id)a3;
- (void)workItem:(id)a3 finishedWithError:(id)a4;
@end

@implementation HAP2AccessoryServerPairingDriver

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pairingActivity);
  objc_storeStrong((id *)&self->_workItems, 0);
  objc_storeStrong((id *)&self->_cancelError, 0);
  objc_destroyWeak((id *)&self->_accessoryServer);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_encoding, 0);
  objc_storeStrong((id *)&self->_secureTransportFactory, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_pairingSession, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_propertyLock, 0);
}

- (void)setPairingActivity:(id)a3
{
}

- (HMFActivity)pairingActivity
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairingActivity);

  return (HMFActivity *)WeakRetained;
}

- (NSArray)workItems
{
  return self->_workItems;
}

- (unint64_t)featureFlags
{
  return self->_featureFlags;
}

- (void)setCurrentWorkItemIndex:(unint64_t)a3
{
  self->_currentWorkItemIndex = a3;
}

- (unint64_t)currentWorkItemIndex
{
  return self->_currentWorkItemIndex;
}

- (HAP2AccessoryServerSecureTransportFactory)secureTransportFactory
{
  return self->_secureTransportFactory;
}

- (unint64_t)authMethod
{
  return self->_authMethod;
}

- (HAP2PropertyLock)propertyLock
{
  return self->_propertyLock;
}

- (NSString)description
{
  v3 = [(HAP2AccessoryServerPairingDriver *)self accessoryServer];
  v4 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)HAP2AccessoryServerPairingDriver;
  v5 = [(HAP2LoggingObject *)&v10 description];
  v6 = [v3 name];
  v7 = [v3 deviceID];
  v8 = [v4 stringWithFormat:@"%@ [%@/%@]", v5, v6, v7];

  return (NSString *)v8;
}

- (void)workItem:(id)a3 finishedWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HAP2AccessoryServerPairingDriver *)self operationQueue];
  [v8 assertCurrentQueue];

  v9 = [(HAP2AccessoryServerPairingDriver *)self currentWorkItem];
  int v10 = [v6 isEqual:v9];

  if (v10)
  {
    v11 = [(HAP2AccessoryServerPairingDriver *)self pairingActivity];
    id v12 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HAP2AccessoryServerPairingDriver currentWorkItemIndex](self, "currentWorkItemIndex"));
    v13 = NSNumber;
    v14 = [(HAP2AccessoryServerPairingDriver *)self workItems];
    id v15 = (id)objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));

    [v7 domain];
    [v7 code];
    if (v7)
    {
      [(HAP2AccessoryServerPairingDriver *)self _pairingFinishedWithError:v7];
    }
    else
    {
      v16 = [(HAP2AccessoryServerPairingDriver *)self moveToNextWorkItem];
      if (v16)
      {
        [v11 begin];
        id v17 = v11;
        [v16 startWithPairingDriver:self];
        __HMFActivityScopeLeave();
      }
      else
      {
        [(HAP2AccessoryServerPairingDriver *)self _pairingFinishedWithError:0];
      }
    }
  }
}

- (void)_pairingFinishedWithError:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HAP2AccessoryServerPairingDriver *)self operationQueue];
  [v5 assertCurrentQueue];

  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v6 = hap2Log_accessory;
  BOOL v7 = os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v7) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138412546;
    v22 = self;
    __int16 v23 = 2112;
    id v24 = v4;
    v8 = "%@ Finished with error: %@";
    v9 = v6;
    uint32_t v10 = 22;
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138412290;
    v22 = self;
    v8 = "%@ Finished successfully";
    v9 = v6;
    uint32_t v10 = 12;
  }
  _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_9:
  BOOL v11 = v4 == 0;
  [(HAP2AccessoryServerPairingDriver *)self setPairingSession:0];
  objc_initWeak((id *)buf, self);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __62__HAP2AccessoryServerPairingDriver__pairingFinishedWithError___block_invoke;
  v18[3] = &unk_1E69F4540;
  objc_copyWeak(&v20, (id *)buf);
  id v12 = v4;
  id v19 = v12;
  uint64_t v13 = MEMORY[0x1D944E2D0](v18);
  v14 = (void *)v13;
  if (v11)
  {
    (*(void (**)(uint64_t))(v13 + 16))(v13);
  }
  else
  {
    id v15 = [(HAP2AccessoryServerPairingDriver *)self transport];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__HAP2AccessoryServerPairingDriver__pairingFinishedWithError___block_invoke_2;
    v16[3] = &unk_1E69F3400;
    v16[4] = self;
    id v17 = v14;
    [v15 closeWithError:0 completion:v16];
  }
  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

void __62__HAP2AccessoryServerPairingDriver__pairingFinishedWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained delegate];
  v3 = v2;
  if (v2) {
    [v2 pairingDriver:WeakRetained didCompleteWithError:*(void *)(a1 + 32)];
  }
}

void __62__HAP2AccessoryServerPairingDriver__pairingFinishedWithError___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) operationQueue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__HAP2AccessoryServerPairingDriver__pairingFinishedWithError___block_invoke_3;
  v3[3] = &unk_1E69F3B20;
  id v4 = *(id *)(a1 + 40);
  [v2 addBlock:v3];
}

uint64_t __62__HAP2AccessoryServerPairingDriver__pairingFinishedWithError___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_cancelWithError:(id)a3
{
  id v8 = a3;
  id v4 = [(HAP2AccessoryServerPairingDriver *)self operationQueue];
  [v4 assertCurrentQueue];

  v5 = [(HAP2AccessoryServerPairingDriver *)self cancelError];

  if (!v5)
  {
    [(HAP2AccessoryServerPairingDriver *)self setCancelError:v8];
    uint64_t v6 = [(HAP2AccessoryServerPairingDriver *)self currentWorkItem];
    BOOL v7 = v6;
    if (v6) {
      [v6 cancelWithError:v8];
    }
    else {
      [(HAP2AccessoryServerPairingDriver *)self _pairingFinishedWithError:v8];
    }
  }
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(HAP2AccessoryServerPairingDriver *)self operationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__HAP2AccessoryServerPairingDriver_cancelWithError___block_invoke;
  v7[3] = &unk_1E69F4540;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 addBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __52__HAP2AccessoryServerPairingDriver_cancelWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _cancelWithError:*(void *)(a1 + 32)];
}

- (id)currentWorkItem
{
  v3 = [(HAP2AccessoryServerPairingDriver *)self operationQueue];
  [v3 assertCurrentQueue];

  unint64_t v4 = [(HAP2AccessoryServerPairingDriver *)self currentWorkItemIndex];
  v5 = [(HAP2AccessoryServerPairingDriver *)self workItems];
  unint64_t v6 = [v5 count];

  if (v4 >= v6)
  {
    id v8 = 0;
  }
  else
  {
    BOOL v7 = [(HAP2AccessoryServerPairingDriver *)self workItems];
    id v8 = [v7 objectAtIndexedSubscript:v4];
  }

  return v8;
}

- (id)moveToNextWorkItem
{
  v3 = [(HAP2AccessoryServerPairingDriver *)self operationQueue];
  [v3 assertCurrentQueue];

  [(HAP2AccessoryServerPairingDriver *)self setCurrentWorkItemIndex:[(HAP2AccessoryServerPairingDriver *)self currentWorkItemIndex] + 1];

  return [(HAP2AccessoryServerPairingDriver *)self currentWorkItem];
}

- (id)pairAccessory:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(HAP2AccessoryServerPairingDriver *)self accessoryServer];

  if ([v7 conformsToProtocol:&unk_1F2C8C6F0]) {
    id v9 = v7;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  id v11 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v12 = NSString;
  uint64_t v13 = MEMORY[0x1D944D460](self, a2);
  v14 = [v12 stringWithFormat:@"%@, %s:%ld", v13, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/HAP2/Pairing/HAP2AccessoryServerPairingDriver.m", 296];
  id v15 = (void *)[v11 initWithName:v14];

  [(HAP2AccessoryServerPairingDriver *)self setAccessoryServer:v10];
  [(HAP2AccessoryServerPairingDriver *)self setDelegate:v8];
  [(HAP2AccessoryServerPairingDriver *)self setPairingActivity:v15];
  if (!self->_operationQueue)
  {
    v16 = [v10 operationQueue];
    [(HAP2AccessoryServerPairingDriver *)self setOperationQueue:v16];
  }
  objc_initWeak(&location, self);
  id v17 = [(HAP2AccessoryServerPairingDriver *)self operationQueue];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __59__HAP2AccessoryServerPairingDriver_pairAccessory_delegate___block_invoke;
  v20[3] = &unk_1E69F4540;
  objc_copyWeak(&v22, &location);
  id v18 = v15;
  id v21 = v18;
  [v17 addBlock:v20];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return self;
}

void __59__HAP2AccessoryServerPairingDriver_pairAccessory_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setCurrentWorkItemIndex:0];
  [*(id *)(a1 + 32) begin];
  id v4 = *(id *)(a1 + 32);
  v3 = [WeakRetained currentWorkItem];
  [v3 startWithPairingDriver:WeakRetained];

  __HMFActivityScopeLeave();
}

- (void)setCancelError:(id)a3
{
  id v4 = a3;
  v5 = [(HAP2AccessoryServerPairingDriver *)self propertyLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__HAP2AccessoryServerPairingDriver_setCancelError___block_invoke;
  v7[3] = &unk_1E69F46E0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWritingBlock:v7];
}

void __51__HAP2AccessoryServerPairingDriver_setCancelError___block_invoke(uint64_t a1)
{
}

- (NSError)cancelError
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__18744;
  id v11 = __Block_byref_object_dispose__18745;
  id v12 = 0;
  v3 = [(HAP2AccessoryServerPairingDriver *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__HAP2AccessoryServerPairingDriver_cancelError__block_invoke;
  v6[3] = &unk_1E69F44F0;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performReadingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSError *)v4;
}

void __47__HAP2AccessoryServerPairingDriver_cancelError__block_invoke(uint64_t a1)
{
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(HAP2AccessoryServerPairingDriver *)self propertyLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__HAP2AccessoryServerPairingDriver_setDelegate___block_invoke;
  v7[3] = &unk_1E69F46E0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWritingBlock:v7];
}

id __48__HAP2AccessoryServerPairingDriver_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
}

- (HAP2AccessoryServerPairingDriverDelegate)delegate
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__18744;
  id v11 = __Block_byref_object_dispose__18745;
  id v12 = 0;
  v3 = [(HAP2AccessoryServerPairingDriver *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__HAP2AccessoryServerPairingDriver_delegate__block_invoke;
  v6[3] = &unk_1E69F44F0;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performReadingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HAP2AccessoryServerPairingDriverDelegate *)v4;
}

uint64_t __44__HAP2AccessoryServerPairingDriver_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;

  return MEMORY[0x1F41817F8](WeakRetained, v4);
}

- (void)setAccessoryServer:(id)a3
{
  id v4 = a3;
  v5 = [(HAP2AccessoryServerPairingDriver *)self propertyLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__HAP2AccessoryServerPairingDriver_setAccessoryServer___block_invoke;
  v7[3] = &unk_1E69F46E0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWritingBlock:v7];
}

id __55__HAP2AccessoryServerPairingDriver_setAccessoryServer___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 72), *(id *)(a1 + 40));
}

- (HAP2UnpairedAccessoryServer)accessoryServer
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__18744;
  id v11 = __Block_byref_object_dispose__18745;
  id v12 = 0;
  uint64_t v3 = [(HAP2AccessoryServerPairingDriver *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__HAP2AccessoryServerPairingDriver_accessoryServer__block_invoke;
  v6[3] = &unk_1E69F44F0;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performReadingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HAP2UnpairedAccessoryServer *)v4;
}

uint64_t __51__HAP2AccessoryServerPairingDriver_accessoryServer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;

  return MEMORY[0x1F41817F8](WeakRetained, v4);
}

- (HAP2AccessoryServerEncoding)encoding
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__18744;
  id v11 = __Block_byref_object_dispose__18745;
  id v12 = 0;
  uint64_t v3 = [(HAP2AccessoryServerPairingDriver *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__HAP2AccessoryServerPairingDriver_encoding__block_invoke;
  v6[3] = &unk_1E69F44F0;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performReadingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HAP2AccessoryServerEncoding *)v4;
}

void __44__HAP2AccessoryServerPairingDriver_encoding__block_invoke(uint64_t a1)
{
}

- (HAP2AccessoryServerTransport)transport
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__18744;
  id v11 = __Block_byref_object_dispose__18745;
  id v12 = 0;
  uint64_t v3 = [(HAP2AccessoryServerPairingDriver *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__HAP2AccessoryServerPairingDriver_transport__block_invoke;
  v6[3] = &unk_1E69F44F0;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performReadingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HAP2AccessoryServerTransport *)v4;
}

void __45__HAP2AccessoryServerPairingDriver_transport__block_invoke(uint64_t a1)
{
}

- (void)setPairingSession:(id)a3
{
  id v4 = a3;
  v5 = [(HAP2AccessoryServerPairingDriver *)self propertyLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__HAP2AccessoryServerPairingDriver_setPairingSession___block_invoke;
  v7[3] = &unk_1E69F46E0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWritingBlock:v7];
}

void __54__HAP2AccessoryServerPairingDriver_setPairingSession___block_invoke(uint64_t a1)
{
}

- (HAPPairSetupSession)pairingSession
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__18744;
  id v11 = __Block_byref_object_dispose__18745;
  id v12 = 0;
  uint64_t v3 = [(HAP2AccessoryServerPairingDriver *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__HAP2AccessoryServerPairingDriver_pairingSession__block_invoke;
  v6[3] = &unk_1E69F44F0;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performReadingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HAPPairSetupSession *)v4;
}

void __50__HAP2AccessoryServerPairingDriver_pairingSession__block_invoke(uint64_t a1)
{
}

- (void)setOperationQueue:(id)a3
{
}

- (HAP2SerializedOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (HAP2AccessoryServerPairingDriver)initWithTransport:(id)a3 secureTransportFactory:(id)a4 encoding:(id)a5 featureFlags:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = 1;
  uint64_t v15 = 2;
  uint64_t v16 = 4;
  uint64_t v17 = 5;
  if ((a6 & 0x10) != 0) {
    uint64_t v17 = 6;
  }
  if ((a6 & 8) == 0) {
    uint64_t v16 = v17;
  }
  if ((a6 & 2) == 0) {
    uint64_t v15 = v16;
  }
  if ((a6 & 1) == 0) {
    uint64_t v14 = v15;
  }
  if ((_BYTE)a6) {
    uint64_t v18 = v14;
  }
  else {
    uint64_t v18 = 0;
  }
  id v19 = [v13 _generateWorkItemsForAuthMethod:v18];
  id v20 = [(HAP2AccessoryServerPairingDriver *)self initWithTransport:v12 secureTransportFactory:v11 encoding:v10 featureFlags:a6 workItems:v19];

  if (v20) {
    id v21 = v20;
  }

  return v20;
}

- (HAP2AccessoryServerPairingDriver)initWithTransport:(id)a3 secureTransportFactory:(id)a4 encoding:(id)a5 featureFlags:(unint64_t)a6 workItems:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HAP2AccessoryServerPairingDriver;
  uint64_t v17 = [(HAP2AccessoryServerPairingDriver *)&v23 init];
  if (v17)
  {
    uint64_t v18 = +[HAP2PropertyLock lockWithName:@"HAP2AccessoryServerPairingDriver.propertyLock"];
    propertyLock = v17->_propertyLock;
    v17->_propertyLock = (HAP2PropertyLock *)v18;

    objc_storeStrong((id *)&v17->_transport, a3);
    objc_storeStrong((id *)&v17->_secureTransportFactory, a4);
    objc_storeStrong((id *)&v17->_encoding, a5);
    v17->_featureFlags = a6;
    if ((_BYTE)a6)
    {
      if (a6)
      {
        uint64_t v20 = 1;
      }
      else if ((a6 & 2) != 0)
      {
        uint64_t v20 = 2;
      }
      else if ((a6 & 8) != 0)
      {
        uint64_t v20 = 4;
      }
      else
      {
        uint64_t v20 = 5;
        if ((a6 & 0x10) != 0) {
          uint64_t v20 = 6;
        }
      }
    }
    else
    {
      uint64_t v20 = 0;
    }
    v17->_authMethod = v20;
    objc_storeStrong((id *)&v17->_workItems, a7);
    id v21 = v17;
  }

  return v17;
}

+ (id)_generateWorkItemsForAuthMethod:(unint64_t)a3
{
  v20[7] = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0uLL:
    case 5uLL:
      uint64_t v3 = +[HAP2AccessoryServerPairingDriverAuthPromptWorkItem promptForType:1];
      v17[0] = v3;
      id v4 = +[HAP2AccessoryServerPairingDriverTransportControlWorkItem openConnection];
      v17[1] = v4;
      v5 = +[HAP2AccessoryServerPairingDriverPairSetupWorkItem pairSetupWithType:0];
      v17[2] = v5;
      id v6 = +[HAP2AccessoryServerPairingDriverTransportControlWorkItem closeConnection];
      v17[3] = v6;
      uint64_t v7 = (void *)MEMORY[0x1E4F1C978];
      id v8 = v17;
      goto LABEL_7;
    case 1uLL:
    case 3uLL:
      uint64_t v3 = +[HAP2AccessoryServerPairingDriverAuthPromptWorkItem promptForType:2];
      v16[0] = v3;
      id v4 = +[HAP2AccessoryServerPairingDriverTransportControlWorkItem openConnection];
      v16[1] = v4;
      v5 = +[HAP2AccessoryServerPairingDriverPairSetupWorkItem pairSetupWithType:1];
      v16[2] = v5;
      id v6 = +[HAP2AccessoryServerPairingDriverTransportControlWorkItem closeConnection];
      v16[3] = v6;
      uint64_t v7 = (void *)MEMORY[0x1E4F1C978];
      id v8 = v16;
      goto LABEL_7;
    case 2uLL:
      uint64_t v3 = +[HAP2AccessoryServerPairingDriverTransportControlWorkItem openConnection];
      v20[0] = v3;
      id v4 = +[HAP2AccessoryServerPairingDriverPairSetupWorkItem pairSetupWithType:3];
      v20[1] = v4;
      v5 = +[HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem doSoftwareAuth];
      v20[2] = v5;
      id v6 = +[HAP2AccessoryServerPairingDriverTransportControlWorkItem closeConnection];
      v20[3] = v6;
      id v10 = +[HAP2AccessoryServerPairingDriverTransportControlWorkItem openConnection];
      void v20[4] = v10;
      id v11 = +[HAP2AccessoryServerPairingDriverPairSetupWorkItem pairSetupWithType:4];
      v20[5] = v11;
      id v12 = +[HAP2AccessoryServerPairingDriverTransportControlWorkItem closeConnection];
      v20[6] = v12;
      id v13 = (void *)MEMORY[0x1E4F1C978];
      id v14 = v20;
      goto LABEL_9;
    case 4uLL:
      uint64_t v3 = +[HAP2AccessoryServerPairingDriverTransportControlWorkItem openConnection];
      v19[0] = v3;
      id v4 = +[HAP2AccessoryServerPairingDriverPairSetupWorkItem pairSetupWithType:5];
      v19[1] = v4;
      v5 = +[HAP2AccessoryServerPairingDriverMFiCertWorkItem checkCertificate];
      v19[2] = v5;
      id v6 = +[HAP2AccessoryServerPairingDriverTransportControlWorkItem closeConnection];
      v19[3] = v6;
      uint64_t v7 = (void *)MEMORY[0x1E4F1C978];
      id v8 = v19;
LABEL_7:
      uint64_t v9 = [v7 arrayWithObjects:v8 count:4];
      goto LABEL_10;
    case 6uLL:
      uint64_t v3 = +[HAP2AccessoryServerPairingDriverTransportControlWorkItem openConnection];
      v18[0] = v3;
      id v4 = +[HAP2AccessoryServerPairingDriverPairSetupWorkItem pairSetupWithType:6];
      v18[1] = v4;
      v5 = +[HAP2AccessoryServerPairingDriverMFiCertWorkItem checkCertificate];
      v18[2] = v5;
      id v6 = +[HAP2AccessoryServerPairingDriverTransportControlWorkItem closeConnection];
      v18[3] = v6;
      id v10 = +[HAP2AccessoryServerPairingDriverTransportControlWorkItem openConnection];
      void v18[4] = v10;
      id v11 = +[HAP2AccessoryServerPairingDriverPairSetupWorkItem pairSetupWithType:7];
      v18[5] = v11;
      id v12 = +[HAP2AccessoryServerPairingDriverTransportControlWorkItem closeConnection];
      v18[6] = v12;
      id v13 = (void *)MEMORY[0x1E4F1C978];
      id v14 = v18;
LABEL_9:
      uint64_t v9 = [v13 arrayWithObjects:v14 count:7];

LABEL_10:
      break;
    default:
      uint64_t v9 = 0;
      break;
  }

  return v9;
}

@end