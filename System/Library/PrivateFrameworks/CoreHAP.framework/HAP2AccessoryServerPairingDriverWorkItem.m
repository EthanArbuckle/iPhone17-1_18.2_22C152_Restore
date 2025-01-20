@interface HAP2AccessoryServerPairingDriverWorkItem
- (HAP2AccessoryServerPairingDriverWorkItemInfo)pairingDriver;
- (HAP2SerializedOperationQueue)operationQueue;
- (HMFActivity)pairingActivity;
- (NSString)description;
- (id)maybePairingDriver;
- (void)cancelWithError:(id)a3;
- (void)finishWithError:(id)a3;
- (void)runForPairingDriver:(id)a3;
- (void)startWithPairingDriver:(id)a3;
@end

@implementation HAP2AccessoryServerPairingDriverWorkItem

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pairingActivity);
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_destroyWeak((id *)&self->_pairingDriver);
}

- (HMFActivity)pairingActivity
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairingActivity);

  return (HMFActivity *)WeakRetained;
}

- (HAP2SerializedOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)runForPairingDriver:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (NSString)description
{
  v3 = [(HAP2AccessoryServerPairingDriverWorkItem *)self maybePairingDriver];
  id v4 = [v3 accessoryServer];

  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)HAP2AccessoryServerPairingDriverWorkItem;
  uint64_t v6 = [(HAP2LoggingObject *)&v11 description];
  v7 = [v4 name];
  v8 = [v4 deviceID];
  v9 = [v5 stringWithFormat:@"%@ [%@/%@]", v6, v7, v8];

  return (NSString *)v9;
}

- (void)finishWithError:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  [v5 assertCurrentQueue];

  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v6 = hap2Log_accessory;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      v9 = self;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_error_impl(&dword_1D4758000, v6, OS_LOG_TYPE_ERROR, "%@ Finished with error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    v9 = self;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEFAULT, "%@ Finished successfully", (uint8_t *)&v8, 0xCu);
  }
  v7 = [(HAP2AccessoryServerPairingDriverWorkItem *)self pairingDriver];
  objc_storeWeak((id *)&self->_pairingDriver, 0);
  [v7 workItem:self finishedWithError:v4];
}

- (void)startWithPairingDriver:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  [v5 assertCurrentQueue];

  objc_storeWeak((id *)&self->_pairingDriver, v4);
  uint64_t v6 = [v4 operationQueue];
  operationQueue = self->_operationQueue;
  self->_operationQueue = v6;

  int v8 = [MEMORY[0x1E4F653F0] currentActivity];
  objc_storeWeak((id *)&self->_pairingActivity, v8);

  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  v9 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = self;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEFAULT, "%@ Starting", (uint8_t *)&v10, 0xCu);
  }
  [(HAP2AccessoryServerPairingDriverWorkItem *)self runForPairingDriver:v4];
}

- (HAP2AccessoryServerPairingDriverWorkItemInfo)pairingDriver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairingDriver);

  return (HAP2AccessoryServerPairingDriverWorkItemInfo *)WeakRetained;
}

- (id)maybePairingDriver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairingDriver);

  return WeakRetained;
}

@end