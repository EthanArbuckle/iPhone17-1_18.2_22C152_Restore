@interface HAP2AccessoryServerController
+ (HAP2AccessoryServerController)new;
+ (NSString)controllerIdentifier;
- (BOOL)mergeWithNewController:(id)a3;
- (HAP2AccessoryServerController)init;
- (HAP2AccessoryServerController)initWithEncoding:(id)a3 secureTransport:(id)a4 operationQueue:(id)a5;
- (HAP2AccessoryServerController)initWithEncoding:(id)a3 secureTransport:(id)a4 operationQueue:(id)a5 accessoryFactory:(id)a6;
- (HAP2AccessoryServerControllerOperation)_notificationOperationForRequest:(void *)a3 operationDescription:(uint64_t)a4 options:;
- (HAP2AccessoryServerEncoding)encoding;
- (HAP2AccessoryServerPrivate)accessoryServer;
- (HAP2AccessoryServerSecureTransport)transport;
- (NSString)description;
- (id)_createOperationsToReadCharacteristics:(uint64_t)a3 timeout:(void *)a4 options:(double)a5 error:;
- (id)_getPairingsCharacteristicForServer:(void *)a3 error:;
- (id)_maybeBeginCharacteristicOperations:(void *)a3 error:(void *)a4 completion:;
- (id)addPairing:(id)a3 completion:(id)a4;
- (id)disableNotificationsForCharacteristics:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (id)enableNotificationsForCharacteristics:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (id)listPairingsWithCompletion:(id)a3;
- (id)readAttributeDatabaseWithCompletion:(id)a3;
- (id)readValuesForCharacteristics:(id)a3 timeout:(double)a4 options:(unint64_t)a5 completion:(id)a6;
- (id)removePairing:(id)a3 cleanupLocalData:(BOOL)a4 completion:(id)a5;
- (id)unpairedIdentifyWithCompletion:(id)a3;
- (id)writeValuesForCharacteristics:(id)a3 timeout:(double)a4 options:(unint64_t)a5 completion:(id)a6;
- (uint64_t)currentAccessoryIPTryCount;
- (uint64_t)isSessionExpired;
- (uint64_t)sessionNumber;
- (uint64_t)setCurrentAccessoryIPTryCount:(uint64_t)result;
- (uint64_t)setFlagNotificationEnableConsistencyWarning:(uint64_t)result;
- (uint64_t)setReadingAttributeDatabase:(uint64_t)result;
- (uint64_t)setSessionStartTime:(uint64_t)result;
- (void)_callCharacteristicCompletion:(void *)a3 operations:(void *)a4 error:;
- (void)_handleUpdatedValuesFromResponse:(void *)a1;
- (void)_updateMaxRequestTimeout:(id *)a1;
- (void)closeSession;
- (void)dealloc;
- (void)handleUpdatedMetadataWithOldMetadata:(id)a3;
- (void)openTransportWithResume:(void *)a3 completion:;
- (void)saveAccessoryCache;
- (void)secureTransport:(id)a3 didChangeState:(unint64_t)a4 error:(id)a5;
- (void)secureTransport:(id)a3 didReceiveEvent:(id)a4;
- (void)secureTransport:(id)a3 needsLocalPairingIdentityWithCompletion:(id)a4;
- (void)secureTransport:(id)a3 needsRemotePairingIdentityForDeviceID:(id)a4 completion:(id)a5;
- (void)setAccessoryServer:(id)a3;
- (void)updateMaxRequestTimeout:(double)a3;
@end

@implementation HAP2AccessoryServerController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryFactory, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_propertyLock, 0);
  objc_storeStrong((id *)&self->_accessoryCache, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_encoding, 0);

  objc_destroyWeak((id *)&self->_accessoryServer);
}

- (HAP2AccessoryServerSecureTransport)transport
{
  return self->_transport;
}

- (HAP2AccessoryServerEncoding)encoding
{
  return self->_encoding;
}

- (void)setAccessoryServer:(id)a3
{
}

- (HAP2AccessoryServerPrivate)accessoryServer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryServer);

  return (HAP2AccessoryServerPrivate *)WeakRetained;
}

- (NSString)description
{
  v3 = [(HAP2AccessoryServerController *)self accessoryServer];
  v4 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)HAP2AccessoryServerController;
  v5 = [(HAP2LoggingObject *)&v10 description];
  v6 = [v3 name];
  v7 = [v3 deviceID];
  v8 = [v4 stringWithFormat:@"%@ [%@/%@]", v5, v6, v7];

  return (NSString *)v8;
}

- (void)secureTransport:(id)a3 needsRemotePairingIdentityForDeviceID:(id)a4 completion:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = (void (**)(id, void, void *))a5;
  v9 = [(HAP2AccessoryServerController *)self accessoryServer];
  objc_super v10 = v9;
  if (!v9)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    v17 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = self;
      _os_log_error_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%@ No accessory server", buf, 0xCu);
    }
    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = 2;
    goto LABEL_15;
  }
  v11 = [v9 deviceID];
  char v12 = [v11 isEqualToDeviceID:v7];

  if ((v12 & 1) == 0)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    v20 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v22 = v20;
      v23 = [v10 deviceID];
      *(_DWORD *)buf = 138412802;
      v28 = self;
      __int16 v29 = 2112;
      v30 = v23;
      __int16 v31 = 2112;
      id v32 = v7;
      _os_log_error_impl(&dword_1D4758000, v22, OS_LOG_TYPE_ERROR, "%@ Accessory device ID doesn't match %@ -> %@", buf, 0x20u);
    }
    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = 9;
LABEL_15:
    v14 = [v18 hapErrorWithCode:v19];
    v8[2](v8, 0, v14);
    goto LABEL_22;
  }
  v13 = [v10 browser];
  v14 = [v13 storage];

  if (v14)
  {
    v15 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __98__HAP2AccessoryServerController_secureTransport_needsRemotePairingIdentityForDeviceID_completion___block_invoke;
    v24[3] = &unk_1E69F33D8;
    id v25 = v7;
    v26 = v8;
    [v14 fetchKeysForIdentifiers:v15 completion:v24];

    v16 = v25;
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    v21 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = self;
      _os_log_error_impl(&dword_1D4758000, v21, OS_LOG_TYPE_ERROR, "%@ No storage server", buf, 0xCu);
    }
    v16 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
    v8[2](v8, 0, v16);
  }

LABEL_22:
}

void __98__HAP2AccessoryServerController_secureTransport_needsRemotePairingIdentityForDeviceID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v10 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (v10)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F65510]) initWithPairingKeyData:v10];
    if (v3)
    {
      v4 = [HAPPairingIdentity alloc];
      v5 = [*(id *)(a1 + 32) deviceIDString];
      v6 = [(HAPPairingIdentity *)v4 initWithIdentifier:v5 publicKey:v3 privateKey:0 permissions:0];

      id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      uint64_t v9 = *(void *)(a1 + 40);
      v6 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12];
      id v7 = *(void (**)(void))(v9 + 16);
    }
    v7();
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    v3 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v3);
  }
}

- (void)secureTransport:(id)a3 needsLocalPairingIdentityWithCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, void, void *))a4;
  v6 = [(HAP2AccessoryServerController *)self accessoryServer];
  id v7 = [v6 browser];
  uint64_t v8 = [v7 storage];

  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
    v5[2](v5, 0, v13);
    goto LABEL_13;
  }
  if (HAPIsHH2Enabled_onceToken != -1) {
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_12024);
  }
  if (HAPIsHH2Enabled_hh2Enabled != 1) {
    goto LABEL_11;
  }
  uint64_t v9 = [(HAP2AccessoryServerController *)self accessoryServer];
  id v10 = [v9 delegate];
  v11 = [v10 currentIdentity];

  if (!v11)
  {
LABEL_11:
    v13 = [(HAP2AccessoryServerController *)self accessoryServer];
    v14 = [v13 deviceID];
    [v8 fetchControllerKeyForDeviceId:v14 completion:v5];

LABEL_13:
    goto LABEL_14;
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  char v12 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    v16 = v11;
    _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_DEFAULT, "Using Pairing Identity: %@", (uint8_t *)&v15, 0xCu);
  }
  ((void (**)(id, void *, void *))v5)[2](v5, v11, 0);

LABEL_14:
}

- (void)secureTransport:(id)a3 didReceiveEvent:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [(HAP2AccessoryServerController *)self encoding];
  id v18 = 0;
  id v7 = [v6 eventsForData:v5 error:&v18];

  id v8 = v18;
  if (v7)
  {
    uint64_t v9 = [(HAP2AccessoryServerController *)self accessoryServer];
    if ([v9 conformsToProtocol:&unk_1F2C8CD98])
    {
      id v10 = [(HAP2AccessoryServerController *)self accessoryServer];

      if (v10 && ([v10 isPaired] & 1) != 0)
      {
        if (-[HAP2AccessoryServerController isSessionExpired]((uint64_t)self))
        {
          if (hap2LogInitialize_onceToken != -1) {
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
          }
          v11 = hap2Log_accessory;
          if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = self;
            _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%@ Received event on session that lasted too long, restarting session", buf, 0xCu);
          }
          if (self)
          {
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            v21 = __Block_byref_object_copy__18139;
            v22 = __Block_byref_object_dispose__18140;
            id v23 = 0;
            v19[0] = MEMORY[0x1E4F143A8];
            v19[1] = 3221225472;
            v19[2] = __56__HAP2AccessoryServerController__scheduleRestartSession__block_invoke;
            v19[3] = &unk_1E69F44F0;
            v19[4] = self;
            v19[5] = buf;
            char v12 = (void *)MEMORY[0x1D944E2D0](v19);
            v13 = [[HAP2AsynchronousBlockOperation alloc] initWithName:@"Restart security session" block:v12];
            v14 = *(void **)(*(void *)&buf[8] + 40);
            *(void *)(*(void *)&buf[8] + 40) = v13;

            int v15 = self->_operationQueue;
            [(HAP2SerializedOperationQueue *)v15 addOperation:*(void *)(*(void *)&buf[8] + 40)];

            _Block_object_dispose(buf, 8);
          }
        }
        [v10 handleEvents:v7];
LABEL_22:

        goto LABEL_23;
      }
    }
    else
    {

      id v10 = 0;
    }
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v17 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_error_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%@ Ignoring event when no longer paired", buf, 0xCu);
    }
    goto LABEL_22;
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  v16 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_error_impl(&dword_1D4758000, v16, OS_LOG_TYPE_ERROR, "%@ Failed to parse event data: %@", buf, 0x16u);
  }
LABEL_23:
}

- (uint64_t)isSessionExpired
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v5 = 0;
    v6 = &v5;
    uint64_t v7 = 0x2020000000;
    uint64_t v8 = 0;
    id v2 = *(id *)(result + 72);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __49__HAP2AccessoryServerController_sessionStartTime__block_invoke;
    v4[3] = &unk_1E69F44F0;
    v4[4] = v1;
    v4[5] = &v5;
    [v2 performReadingBlock:v4];

    uint64_t v3 = v6[3];
    _Block_object_dispose(&v5, 8);
    if (v3)
    {
      if (v3 == 1)
      {
        return 1;
      }
      else
      {
        mach_absolute_time();
        return (unint64_t)(UpTicksToMilliseconds() - v3) > 0x240C83FF;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void __56__HAP2AccessoryServerController__scheduleRestartSession__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (-[HAP2AccessoryServerController isSessionExpired](*(void *)(a1 + 32)))
  {
    id v2 = [*(id *)(a1 + 32) transport];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__HAP2AccessoryServerController__scheduleRestartSession__block_invoke_362;
    v5[3] = &unk_1E69F3120;
    long long v6 = *(_OWORD *)(a1 + 32);
    [v2 closeWithError:0 completion:v5];
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v3 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = v4;
      _os_log_impl(&dword_1D4758000, v3, OS_LOG_TYPE_INFO, "%@ Aborting restart operation", buf, 0xCu);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) finish];
  }
}

void __56__HAP2AccessoryServerController__scheduleRestartSession__block_invoke_362(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) transport];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__HAP2AccessoryServerController__scheduleRestartSession__block_invoke_2;
  v3[3] = &unk_1E69F3120;
  long long v4 = *(_OWORD *)(a1 + 32);
  [v2 openWithCompletion:v3];
}

uint64_t __56__HAP2AccessoryServerController__scheduleRestartSession__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v2 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D4758000, v2, OS_LOG_TYPE_INFO, "%@ Done restarting session", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) finish];
}

uint64_t __49__HAP2AccessoryServerController_sessionStartTime__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 40);
  return result;
}

- (void)secureTransport:(id)a3 didChangeState:(unint64_t)a4 error:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  if (!a4 || a4 == 3)
  {
    -[HAP2AccessoryServerController setSessionStartTime:]((uint64_t)self, 0);
    id v10 = [(HAP2AccessoryServerController *)self accessoryServer];
    if ([v10 conformsToProtocol:&unk_1F2C8CD98])
    {
      v11 = [(HAP2AccessoryServerController *)self accessoryServer];

      if (v11 && [v11 isPaired])
      {
        char v12 = [v11 accessories];
        [v12 enumerateObjectsUsingBlock:&__block_literal_global_379];
      }
    }
    else
    {

      v11 = 0;
    }
  }
  else if (a4 == 1 && self)
  {
    propertyLock = self->_propertyLock;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__HAP2AccessoryServerController_bumpSessionNumber__block_invoke;
    v14[3] = &unk_1E69F4330;
    v14[4] = self;
    [(HAP2PropertyLock *)propertyLock performWritingBlock:v14];
  }
}

- (uint64_t)setSessionStartTime:(uint64_t)result
{
  if (result)
  {
    id v2 = *(void **)(result + 72);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __53__HAP2AccessoryServerController_setSessionStartTime___block_invoke;
    v3[3] = &unk_1E69F3A58;
    void v3[4] = result;
    v3[5] = a2;
    return [v2 performWritingBlock:v3];
  }
  return result;
}

void __70__HAP2AccessoryServerController_secureTransport_didChangeState_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 services];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_381];
}

void __70__HAP2AccessoryServerController_secureTransport_didChangeState_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 characteristics];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_383];
}

uint64_t __70__HAP2AccessoryServerController_secureTransport_didChangeState_error___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setEventNotificationsEnabled:0];
}

uint64_t __53__HAP2AccessoryServerController_setSessionStartTime___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 40) = *(void *)(result + 40);
  return result;
}

uint64_t __50__HAP2AccessoryServerController_bumpSessionNumber__block_invoke(uint64_t result)
{
  return result;
}

- (void)updateMaxRequestTimeout:(double)a3
{
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__HAP2AccessoryServerController_updateMaxRequestTimeout___block_invoke;
  v8[3] = &unk_1E69F4680;
  objc_copyWeak(v9, &location);
  v9[1] = *(id *)&a3;
  int v5 = (void *)MEMORY[0x1D944E2D0](v8);
  if (self) {
    operationQueue = self->_operationQueue;
  }
  else {
    operationQueue = 0;
  }
  uint64_t v7 = operationQueue;
  [(HAP2SerializedOperationQueue *)v7 addBlock:v5];

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __57__HAP2AccessoryServerController_updateMaxRequestTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    -[HAP2AccessoryServerController _updateMaxRequestTimeout:](WeakRetained, *(double *)(a1 + 40));
    id WeakRetained = v3;
  }
}

- (void)_updateMaxRequestTimeout:(id *)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1[10] assertCurrentQueue];
    long long v4 = [a1 accessoryServer];
    if ([v4 conformsToProtocol:&unk_1F2C8CB20])
    {
      int v5 = [a1 accessoryServer];
    }
    else
    {
      int v5 = 0;
    }

    char v6 = [v5 isPaired];
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v7 = hap2Log_accessory;
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412546;
        uint64_t v17 = a1;
        __int16 v18 = 2048;
        double v19 = a2;
        _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%@ Setting max request timeout to %f seconds", (uint8_t *)&v16, 0x16u);
      }
      id v8 = [a1 transport];
      [v8 updateMaxRequestTimeout:a2];

      if (fabs(a2) >= 2.22044605e-16)
      {
        id v9 = a1[8];
        if (v9)
        {
          id v10 = v9;
          v11 = [a1[8] sleepInterval];
          char v12 = [NSNumber numberWithDouble:a2];
          char v13 = [v11 isEqualToNumber:v12];

          if ((v13 & 1) == 0)
          {
            v14 = [NSNumber numberWithDouble:a2];
            if (hap2LogInitialize_onceToken != -1) {
              dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
            }
            int v15 = hap2Log_accessory;
            if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
            {
              int v16 = 138412546;
              uint64_t v17 = a1;
              __int16 v18 = 2112;
              double v19 = *(double *)&v14;
              _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_INFO, "%@ Updating cached sleep interval to: %@", (uint8_t *)&v16, 0x16u);
            }
            [a1[8] setSleepInterval:v14];
            -[HAP2AccessoryServerController saveAccessoryCache]((uint64_t)a1);
          }
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 138412290;
      uint64_t v17 = a1;
      _os_log_debug_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%@ Ignoring max request timeout update for unpaired accessory", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)saveAccessoryCache
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 80) assertCurrentQueue];
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v2 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = a1;
    _os_log_impl(&dword_1D4758000, v2, OS_LOG_TYPE_INFO, "%@ Request to save the accessory cache", buf, 0xCu);
  }
  if (*(void *)(a1 + 64))
  {
    uint64_t v3 = [(id)a1 accessoryServer];
    long long v4 = [v3 browser];
    int v5 = [v4 storage];

    if (v5)
    {
      char v6 = [(id)objc_opt_class() controllerIdentifier];
      uint64_t v7 = cacheFileIdentifierForAccessoryServer(v6, v3);

      id v8 = (void *)MEMORY[0x1E4F28DB0];
      id v9 = *(void **)(a1 + 64);
      id v17 = 0;
      id v10 = v9;
      v11 = [v8 archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v17];
      id v12 = v17;

      if (v11)
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __51__HAP2AccessoryServerController_saveAccessoryCache__block_invoke;
        v16[3] = &unk_1E69F4380;
        v16[4] = a1;
        [v5 saveCacheForIdentifier:v7 data:v11 completion:v16];
      }
      else
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        int v15 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v19 = a1;
          __int16 v20 = 2112;
          id v21 = v12;
          _os_log_error_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%@ Unable to serialize accessory cache: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      v14 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = a1;
        _os_log_error_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%@ Unable to get to the storage to save accessory cache", buf, 0xCu);
      }
    }
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    char v13 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = a1;
      _os_log_error_impl(&dword_1D4758000, v13, OS_LOG_TYPE_ERROR, "%@ No cache to save", buf, 0xCu);
    }
  }
}

void __51__HAP2AccessoryServerController_saveAccessoryCache__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    long long v4 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_error_impl(&dword_1D4758000, v4, OS_LOG_TYPE_ERROR, "%@ Unable to save cache to disk: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)closeSession
{
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__18139;
  __int16 v18 = __Block_byref_object_dispose__18140;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __45__HAP2AccessoryServerController_closeSession__block_invoke;
  v13[3] = &unk_1E69F44F0;
  v13[4] = self;
  v13[5] = &v14;
  id v3 = (void *)MEMORY[0x1D944E2D0](v13, a2);
  long long v4 = [[HAP2AsynchronousBlockOperation alloc] initWithName:@"Close session" block:v3];
  uint64_t v5 = (void *)v15[5];
  v15[5] = (uint64_t)v4;

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__HAP2AccessoryServerController_closeSession__block_invoke_290;
  v12[3] = &unk_1E69F44F0;
  v12[4] = self;
  v12[5] = &v14;
  id v6 = (id)MEMORY[0x1D944E2D0](v12);
  uint64_t v7 = v6;
  if (self)
  {
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__18139;
    v27 = __Block_byref_object_dispose__18140;
    id v28 = 0;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __72__HAP2AccessoryServerController__disableAllCharacteristicsNotification___block_invoke;
    v20[3] = &unk_1E69F3830;
    v20[4] = self;
    uint64_t v22 = &v23;
    id v21 = v6;
    __int16 v8 = (void *)MEMORY[0x1D944E2D0](v20);
    id v9 = [[HAP2AsynchronousBlockOperation alloc] initWithName:@"Disable-all-notifications" block:v8];
    uint64_t v10 = (void *)v24[5];
    v24[5] = (uint64_t)v9;

    v11 = self->_operationQueue;
    [(HAP2SerializedOperationQueue *)v11 addOperation:v24[5]];

    _Block_object_dispose(&v23, 8);
  }

  _Block_object_dispose(&v14, 8);
}

void __45__HAP2AccessoryServerController_closeSession__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  -[HAP2AccessoryServerController setFlagNotificationEnableConsistencyWarning:](*(void *)(a1 + 32), 0);
  if ((-[HAP2AccessoryServerController isSessionExpired](*(void *)(a1 + 32)) & 1) == 0)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v2 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = v3;
      _os_log_impl(&dword_1D4758000, v2, OS_LOG_TYPE_INFO, "%@ Closing active session", buf, 0xCu);
    }
  }
  long long v4 = [*(id *)(a1 + 32) transport];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__HAP2AccessoryServerController_closeSession__block_invoke_286;
  v5[3] = &unk_1E69F3120;
  long long v6 = *(_OWORD *)(a1 + 32);
  [v4 closeWithError:0 completion:v5];
}

uint64_t __45__HAP2AccessoryServerController_closeSession__block_invoke_290(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    uint64_t v1 = (void *)v1[10];
  }
  return [v1 addOperation:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __72__HAP2AccessoryServerController__disableAllCharacteristicsNotification___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) accessoryServer];
  if (([v2 conformsToProtocol:&unk_1F2C8CD98] & 1) == 0)
  {

    uint64_t v3 = 0;
LABEL_11:
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) finish];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_12;
  }
  uint64_t v3 = [*(id *)(a1 + 32) accessoryServer];

  if (!v3 || ([v3 isPaired] & 1) == 0) {
    goto LABEL_11;
  }
  long long v4 = [MEMORY[0x1E4F1CA48] array];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __72__HAP2AccessoryServerController__disableAllCharacteristicsNotification___block_invoke_2;
  v23[3] = &unk_1E69F31C0;
  v23[4] = *(void *)(a1 + 32);
  uint64_t v5 = (void *)MEMORY[0x1D944E2D0](v23);
  -[HAP2AccessoryServerController setFlagNotificationEnableConsistencyWarning:](*(void *)(a1 + 32), 1);
  long long v6 = [v3 accessories];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  __int16 v20 = __72__HAP2AccessoryServerController__disableAllCharacteristicsNotification___block_invoke_331;
  id v21 = &unk_1E69F37E0;
  id v7 = v4;
  id v22 = v7;
  [v6 enumerateObjectsUsingBlock:&v18];

  uint64_t v8 = objc_msgSend(v7, "count", v18, v19, v20, v21);
  if (hap2LogInitialize_onceToken != -1)
  {
    uint64_t v17 = v8;
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    uint64_t v8 = v17;
  }
  uint64_t v9 = hap2Log_accessory;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      v11 = v9;
      uint64_t v12 = [v7 count];
      *(_DWORD *)buf = 138412546;
      uint64_t v25 = v10;
      __int16 v26 = 2048;
      uint64_t v27 = v12;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_DEFAULT, "%@ Disabling all %lu accessory characteristic notification(s)", buf, 0x16u);
    }
    char v13 = *(void **)(a1 + 32);
    uint64_t v14 = (void *)[v7 copy];
    id v15 = (id)[v13 disableNotificationsForCharacteristics:v14 options:2 completion:v5];
  }
  else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v25 = v16;
    _os_log_debug_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEBUG, "%@ Accessory has no characteristic notification enabled", buf, 0xCu);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) finish];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

LABEL_12:
}

void __72__HAP2AccessoryServerController__disableAllCharacteristicsNotification___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v4 = a3;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = @"success";
    if (v4) {
      id v7 = v4;
    }
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEFAULT, "%@ Disabled all notifications (%@)", (uint8_t *)&v8, 0x16u);
  }
}

- (uint64_t)setFlagNotificationEnableConsistencyWarning:(uint64_t)result
{
  if (result)
  {
    id v2 = *(void **)(result + 72);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __77__HAP2AccessoryServerController_setFlagNotificationEnableConsistencyWarning___block_invoke;
    v3[3] = &unk_1E69F3DF8;
    void v3[4] = result;
    char v4 = a2;
    return [v2 performWritingBlock:v3];
  }
  return result;
}

void __72__HAP2AccessoryServerController__disableAllCharacteristicsNotification___block_invoke_331(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 services];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__HAP2AccessoryServerController__disableAllCharacteristicsNotification___block_invoke_2_332;
  v4[3] = &unk_1E69F31E8;
  id v5 = *(id *)(a1 + 32);
  [v3 enumerateObjectsUsingBlock:v4];
}

void __72__HAP2AccessoryServerController__disableAllCharacteristicsNotification___block_invoke_2_332(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 characteristics];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__HAP2AccessoryServerController__disableAllCharacteristicsNotification___block_invoke_3;
  v4[3] = &unk_1E69F3740;
  id v5 = *(id *)(a1 + 32);
  [v3 enumerateObjectsUsingBlock:v4];
}

void __72__HAP2AccessoryServerController__disableAllCharacteristicsNotification___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 eventNotificationsEnabled]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

uint64_t __77__HAP2AccessoryServerController_setFlagNotificationEnableConsistencyWarning___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 9) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __45__HAP2AccessoryServerController_closeSession__block_invoke_286(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v2 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D4758000, v2, OS_LOG_TYPE_INFO, "%@ Done closing session", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) finish];
}

- (BOOL)mergeWithNewController:(id)a3
{
  id v4 = a3;
  int v5 = [(HAP2AccessoryServerController *)self transport];
  uint64_t v6 = [v4 transport];

  LOBYTE(v4) = [v5 mergeWithNewTransport:v6];
  return (char)v4;
}

- (void)handleUpdatedMetadataWithOldMetadata:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(HAP2AccessoryServerController *)self accessoryServer];
  if ([v5 conformsToProtocol:&unk_1F2C8CD98])
  {
    uint64_t v6 = [(HAP2AccessoryServerController *)self accessoryServer];

    if (v6 && [v6 isPaired])
    {
      int v7 = [v4 configNumber];
      if (v7 == [v6 configNumber])
      {
        int v8 = [v4 stateNumber];
        if (v8 != [v6 stateNumber])
        {
          if (hap2LogInitialize_onceToken != -1) {
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
          }
          uint64_t v9 = (void *)hap2Log_accessory;
          if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
          {
            __int16 v10 = v9;
            int v15 = 138412802;
            uint64_t v16 = self;
            __int16 v17 = 1024;
            int v18 = [v4 stateNumber];
            __int16 v19 = 1024;
            int v20 = [v6 stateNumber];
            _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_INFO, "%@ Actively pinging accessory due to updated s#: %u -> %u", (uint8_t *)&v15, 0x18u);
          }
          [v6 verifyConnection];
        }
      }
      else
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        v11 = (void *)hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = v11;
          int v15 = 138412802;
          uint64_t v16 = self;
          __int16 v17 = 1024;
          int v18 = [v4 configNumber];
          __int16 v19 = 1024;
          int v20 = [v6 configNumber];
          _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_INFO, "%@ Re-reading attribute database due updated c#: %u -> %u", (uint8_t *)&v15, 0x18u);
        }
        if (self) {
          accessoryCache = self->_accessoryCache;
        }
        else {
          accessoryCache = 0;
        }
        [(HAP2AccessoryServerAccessoryCache *)accessoryCache invalidateAccessoryCache];
        [v6 clearAccessories];
        id v14 = (id)[v6 updateAccessoriesWithReason:@"bonjourUpdate.configNumberChanged"];
      }
    }
  }
  else
  {

    uint64_t v6 = 0;
  }
}

- (id)unpairedIdentifyWithCompletion:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  int v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = self;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEFAULT, "%@ Performing unpaired identify", buf, 0xCu);
  }
  uint64_t v6 = [(HAP2AccessoryServerController *)self encoding];
  id v30 = 0;
  int v7 = [v6 unpairedIdentifyRequestWithError:&v30];
  id v8 = v30;

  uint64_t v9 = [(HAP2AccessoryServerController *)self transport];
  __int16 v10 = [v9 wellKnownEndpoint:1];

  v11 = [(HAP2AccessoryServerController *)self transport];
  uint64_t v12 = [v11 mimeTypeForWellKnownEndpoint:1];

  char v13 = [HAP2AccessoryServerControllerOperation alloc];
  id v14 = [(HAP2AccessoryServerController *)self encoding];
  int v15 = [(HAP2AccessoryServerController *)self transport];
  uint64_t v16 = [(HAP2AccessoryServerControllerOperation *)v13 initWithName:@"Unpaired identify" controller:self encoding:v14 transport:v15 request:v7 endpoint:v10 mimeType:0.0 timeout:v12 options:0];

  __int16 v17 = (void *)MEMORY[0x1E4F28B48];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __64__HAP2AccessoryServerController_unpairedIdentifyWithCompletion___block_invoke;
  v26[3] = &unk_1E69F4070;
  int v18 = v16;
  uint64_t v27 = v18;
  uint64_t v28 = self;
  id v19 = v4;
  id v29 = v19;
  int v20 = [v17 blockOperationWithBlock:v26];
  [v20 addDependency:v18];
  if (self) {
    operationQueue = self->_operationQueue;
  }
  else {
    operationQueue = 0;
  }
  [(HAP2SerializedOperationQueue *)operationQueue addOperation:v20];
  objc_initWeak((id *)buf, v18);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __64__HAP2AccessoryServerController_unpairedIdentifyWithCompletion___block_invoke_282;
  v24[3] = &unk_1E69F4420;
  objc_copyWeak(&v25, (id *)buf);
  id v22 = +[HAP2Cancelable cancelableWithBlock:v24];
  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);

  return v22;
}

void __64__HAP2AccessoryServerController_unpairedIdentifyWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[45];
  }
  uint64_t v3 = v2;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v4 = hap2Log_accessory;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v12 = 138412290;
      uint64_t v13 = v5;
      _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%@ Identify completed successfully", (uint8_t *)&v12, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      id v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      __int16 v10 = v4;
      v11 = [v8 error];
      int v12 = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      int v15 = v11;
      _os_log_error_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%@ Unpaired identify failed with error: %@", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v6 = *(void *)(a1 + 48);
    int v7 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

void __64__HAP2AccessoryServerController_unpairedIdentifyWithCompletion___block_invoke_282(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained cancelWithError:v3];
}

- (id)listPairingsWithCompletion:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = self;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEFAULT, "%@ Asking accessory to list pairings", buf, 0xCu);
  }
  uint64_t v6 = [(HAP2AccessoryServerController *)self accessoryServer];
  if ([v6 conformsToProtocol:&unk_1F2C8CB20])
  {
    int v7 = [(HAP2AccessoryServerController *)self accessoryServer];

    if (v7 && ([v7 isPaired] & 1) != 0)
    {
      id v35 = 0;
      id v8 = -[HAP2AccessoryServerController _getPairingsCharacteristicForServer:error:](self, v7, &v35);
      id v9 = v35;
      if (v8)
      {
        __int16 v10 = [(HAP2AccessoryServerController *)self encoding];
        id v34 = v9;
        v11 = [v10 requestToListPairingsWithCharacteristic:v8 error:&v34];
        id v12 = v34;

        if (v11)
        {
          uint64_t v13 = [(HAP2AccessoryServerController *)self transport];
          uint64_t v28 = [v13 endpointForCharacteristic:v8];

          __int16 v14 = [(HAP2AccessoryServerController *)self transport];
          int v15 = [v14 mimeTypeForCharacteristicRequests];

          uint64_t v16 = [HAP2AccessoryServerControllerOperation alloc];
          __int16 v17 = [(HAP2AccessoryServerController *)self encoding];
          int v18 = [(HAP2AccessoryServerController *)self transport];
          id v19 = [(HAP2AccessoryServerControllerOperation *)v16 initWithName:@"List pairings" controller:self encoding:v17 transport:v18 request:v11 endpoint:v28 mimeType:0.0 timeout:v15 options:0];

          int v20 = (void *)MEMORY[0x1E4F28B48];
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __60__HAP2AccessoryServerController_listPairingsWithCompletion___block_invoke;
          v31[3] = &unk_1E69F4070;
          v31[4] = self;
          uint64_t v21 = v19;
          id v32 = v21;
          id v33 = v4;
          id v22 = [v20 blockOperationWithBlock:v31];
          [v22 addDependency:v21];
          if (self) {
            operationQueue = self->_operationQueue;
          }
          else {
            operationQueue = 0;
          }
          [(HAP2SerializedOperationQueue *)operationQueue addOperation:v22];
          objc_initWeak((id *)buf, v21);
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __60__HAP2AccessoryServerController_listPairingsWithCompletion___block_invoke_2;
          v29[3] = &unk_1E69F4420;
          objc_copyWeak(&v30, (id *)buf);
          uint64_t v24 = +[HAP2Cancelable cancelableWithBlock:v29];
          objc_destroyWeak(&v30);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          (*((void (**)(id, void, id))v4 + 2))(v4, 0, v12);
          uint64_t v24 = +[HAP2Cancelable ignore];
        }

        id v9 = v12;
      }
      else
      {
        (*((void (**)(id, void, id))v4 + 2))(v4, 0, v9);
        uint64_t v24 = +[HAP2Cancelable ignore];
      }

      goto LABEL_19;
    }
  }
  else
  {

    int v7 = 0;
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v25 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v37 = self;
    _os_log_error_impl(&dword_1D4758000, v25, OS_LOG_TYPE_ERROR, "%@ Cannot call remove pairing on an unpaired accessory", buf, 0xCu);
  }
  __int16 v26 = [MEMORY[0x1E4F28C58] hapErrorWithCode:16];
  (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v26);

  uint64_t v24 = +[HAP2Cancelable ignore];
LABEL_19:

  return v24;
}

- (id)_getPairingsCharacteristicForServer:(void *)a3 error:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    int v7 = [v5 primaryAccessory];
    id v8 = v7;
    if (v7)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v23 = 0x3032000000;
      uint64_t v24 = __Block_byref_object_copy__18139;
      id v25 = __Block_byref_object_dispose__18140;
      id v26 = 0;
      id v9 = [v7 services];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __75__HAP2AccessoryServerController__getPairingsCharacteristicForServer_error___block_invoke;
      v16[3] = &unk_1E69F3A80;
      v16[4] = &buf;
      [v9 enumerateObjectsUsingBlock:v16];

      __int16 v10 = *(void **)(*((void *)&buf + 1) + 40);
      if (v10)
      {
        *(void *)&long long v17 = 0;
        *((void *)&v17 + 1) = &v17;
        uint64_t v18 = 0x3032000000;
        id v19 = __Block_byref_object_copy__18139;
        int v20 = __Block_byref_object_dispose__18140;
        id v21 = 0;
        v11 = [v10 characteristics];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __75__HAP2AccessoryServerController__getPairingsCharacteristicForServer_error___block_invoke_262;
        v15[3] = &unk_1E69F3898;
        v15[4] = &v17;
        [v11 enumerateObjectsUsingBlock:v15];

        a1 = *(id *)(*((void *)&v17 + 1) + 40);
        _Block_object_dispose(&v17, 8);

LABEL_19:
        _Block_object_dispose(&buf, 8);

        goto LABEL_20;
      }
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v13 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v17) = 138412290;
        *(void *)((char *)&v17 + 4) = a1;
        _os_log_error_impl(&dword_1D4758000, v13, OS_LOG_TYPE_ERROR, "%@ Cannot find pairing service", (uint8_t *)&v17, 0xCu);
        if (a3) {
          goto LABEL_14;
        }
      }
      else if (a3)
      {
LABEL_14:
        [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
        a1 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
      a1 = 0;
      goto LABEL_19;
    }
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v12 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = a1;
      _os_log_error_impl(&dword_1D4758000, v12, OS_LOG_TYPE_ERROR, "%@ Cannot call remove pairing before reading the attribute database", (uint8_t *)&buf, 0xCu);
      if (a3) {
        goto LABEL_9;
      }
    }
    else if (a3)
    {
LABEL_9:
      [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
      a1 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

      goto LABEL_21;
    }
    a1 = 0;
    goto LABEL_20;
  }
LABEL_21:

  return a1;
}

void __60__HAP2AccessoryServerController_listPairingsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 48);
  id v3 = (id *)*(id *)(a1 + 40);
  id v4 = v2;
  if (v1)
  {
    [*(id *)(v1 + 80) assertCurrentQueue];
    if (v3 && (id v5 = v3[45]) != 0)
    {
      uint64_t v6 = v5;
      if ([v5 conformsToProtocol:&unk_1F2C9EC00]) {
        int v7 = v6;
      }
      else {
        int v7 = 0;
      }
      id v8 = [v7 pairings];
      v4[2](v4, v8, 0);
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v9 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        v11 = v9;
        id v12 = [v3 error];
        int v13 = 138412546;
        uint64_t v14 = v1;
        __int16 v15 = 2112;
        uint64_t v16 = v12;
        _os_log_error_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%@ List pairings failed with error: %@", (uint8_t *)&v13, 0x16u);
      }
      __int16 v10 = [v3 error];
      ((void (**)(id, void *, void *))v4)[2](v4, 0, v10);

      uint64_t v6 = 0;
    }
  }
}

void __60__HAP2AccessoryServerController_listPairingsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained cancelWithError:v3];
}

void __75__HAP2AccessoryServerController__getPairingsCharacteristicForServer_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  int v7 = [v9 type];
  int v8 = [v7 isEqualToString:@"00000055-0000-1000-8000-0026BB765291"];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __75__HAP2AccessoryServerController__getPairingsCharacteristicForServer_error___block_invoke_262(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  int v7 = [v9 type];
  int v8 = [v7 isEqualToString:@"00000050-0000-1000-8000-0026BB765291"];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)addPairing:(id)a3 completion:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  int v8 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    __int16 v10 = [v6 identifier];
    *(_DWORD *)long long buf = 138412546;
    v43 = self;
    __int16 v44 = 2112;
    v45 = v10;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEFAULT, "%@ Asking accessory to add pairing with identifier: %@", buf, 0x16u);
  }
  v11 = [(HAP2AccessoryServerController *)self accessoryServer];
  if ([v11 conformsToProtocol:&unk_1F2C8CB20])
  {
    id v12 = [(HAP2AccessoryServerController *)self accessoryServer];

    if (v12 && ([v12 isPaired] & 1) != 0)
    {
      id v41 = 0;
      int v13 = -[HAP2AccessoryServerController _getPairingsCharacteristicForServer:error:](self, v12, &v41);
      id v14 = v41;
      if (v13)
      {
        __int16 v15 = [(HAP2AccessoryServerController *)self encoding];
        id v40 = v14;
        uint64_t v16 = [v15 requestToAddPairing:v6 characteristic:v13 error:&v40];
        id v33 = v40;

        if (v16)
        {
          uint64_t v17 = [(HAP2AccessoryServerController *)self transport];
          id v32 = [v17 endpointForCharacteristic:v13];

          uint64_t v18 = [(HAP2AccessoryServerController *)self transport];
          id v19 = [v18 mimeTypeForCharacteristicRequests];

          int v20 = [HAP2AccessoryServerControllerOperation alloc];
          id v21 = [(HAP2AccessoryServerController *)self encoding];
          id v22 = [(HAP2AccessoryServerController *)self transport];
          uint64_t v23 = [(HAP2AccessoryServerControllerOperation *)v20 initWithName:@"Add pairing" controller:self encoding:v21 transport:v22 request:v16 endpoint:v32 mimeType:0.0 timeout:v19 options:0];

          uint64_t v24 = (void *)MEMORY[0x1E4F28B48];
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __55__HAP2AccessoryServerController_addPairing_completion___block_invoke;
          v36[3] = &unk_1E69F4070;
          id v25 = v23;
          v37 = v25;
          uint64_t v38 = self;
          id v39 = v7;
          id v26 = [v24 blockOperationWithBlock:v36];
          [v26 addDependency:v25];
          if (self) {
            operationQueue = self->_operationQueue;
          }
          else {
            operationQueue = 0;
          }
          [(HAP2SerializedOperationQueue *)operationQueue addOperation:v26];
          objc_initWeak((id *)buf, v25);
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __55__HAP2AccessoryServerController_addPairing_completion___block_invoke_272;
          v34[3] = &unk_1E69F4420;
          objc_copyWeak(&v35, (id *)buf);
          uint64_t v28 = +[HAP2Cancelable cancelableWithBlock:v34];
          objc_destroyWeak(&v35);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          (*((void (**)(id, id))v7 + 2))(v7, v33);
          uint64_t v28 = +[HAP2Cancelable ignore];
        }

        id v14 = v33;
      }
      else
      {
        (*((void (**)(id, id))v7 + 2))(v7, v14);
        uint64_t v28 = +[HAP2Cancelable ignore];
      }

      goto LABEL_19;
    }
  }
  else
  {

    id v12 = 0;
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v29 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    v43 = self;
    _os_log_error_impl(&dword_1D4758000, v29, OS_LOG_TYPE_ERROR, "%@ Cannot call remove pairing on an unpaired accessory", buf, 0xCu);
  }
  id v30 = [MEMORY[0x1E4F28C58] hapErrorWithCode:16];
  (*((void (**)(id, void *))v7 + 2))(v7, v30);

  uint64_t v28 = +[HAP2Cancelable ignore];
LABEL_19:

  return v28;
}

void __55__HAP2AccessoryServerController_addPairing_completion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && (id v3 = *(id *)(v2 + 360)) != 0)
  {
    id v4 = v3;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v5 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      int v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      __int16 v10 = v5;
      v11 = [v8 error];
      int v12 = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      __int16 v15 = v11;
      _os_log_error_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%@ Add pairing failed with error: %@", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    id v4 = 0;
  }
}

void __55__HAP2AccessoryServerController_addPairing_completion___block_invoke_272(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained cancelWithError:v3];
}

- (id)removePairing:(id)a3 cleanupLocalData:(BOOL)a4 completion:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  __int16 v10 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    int v12 = [v8 identifier];
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v12;
    _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_DEFAULT, "%@ Asking accessory to remove pairing with identifier: %@", buf, 0x16u);
  }
  uint64_t v13 = [(HAP2AccessoryServerController *)self accessoryServer];
  if ([v13 conformsToProtocol:&unk_1F2C8CB20])
  {
    __int16 v14 = [(HAP2AccessoryServerController *)self accessoryServer];

    if (v14 && ([v14 isPaired] & 1) != 0)
    {
      id v48 = 0;
      __int16 v15 = -[HAP2AccessoryServerController _getPairingsCharacteristicForServer:error:](self, v14, &v48);
      id v16 = v48;
      if (v15)
      {
        uint64_t v17 = [(HAP2AccessoryServerController *)self encoding];
        id v47 = v16;
        uint64_t v18 = [v17 requestToRemovePairing:v8 characteristic:v15 error:&v47];
        id v37 = v47;

        if (v18)
        {
          id v19 = [(HAP2AccessoryServerController *)self transport];
          v36 = [v19 endpointForCharacteristic:v15];

          int v20 = [(HAP2AccessoryServerController *)self transport];
          id v35 = [v20 mimeTypeForCharacteristicRequests];

          id v21 = [HAP2AccessoryServerControllerOperation alloc];
          id v22 = [(HAP2AccessoryServerController *)self encoding];
          uint64_t v23 = [(HAP2AccessoryServerController *)self transport];
          uint64_t v24 = [(HAP2AccessoryServerControllerOperation *)v21 initWithName:@"Remove pairing" controller:self encoding:v22 transport:v23 request:v18 endpoint:v36 mimeType:0.0 timeout:v35 options:0];

          *(void *)long long buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v50 = __Block_byref_object_copy__18139;
          v51 = __Block_byref_object_dispose__18140;
          id v52 = 0;
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __75__HAP2AccessoryServerController_removePairing_cleanupLocalData_completion___block_invoke;
          v41[3] = &unk_1E69F30F8;
          v41[4] = self;
          id v42 = v8;
          BOOL v46 = a4;
          id v25 = v24;
          v43 = v25;
          v45 = buf;
          id v44 = v9;
          id v26 = (void *)MEMORY[0x1D944E2D0](v41);
          uint64_t v27 = [[HAP2AsynchronousBlockOperation alloc] initWithBlock:v26];
          uint64_t v28 = *(void **)(*(void *)&buf[8] + 40);
          *(void *)(*(void *)&buf[8] + 40) = v27;

          [*(id *)(*(void *)&buf[8] + 40) addDependency:v25];
          if (self) {
            operationQueue = self->_operationQueue;
          }
          else {
            operationQueue = 0;
          }
          id v30 = operationQueue;
          [(HAP2SerializedOperationQueue *)v30 addOperation:*(void *)(*(void *)&buf[8] + 40)];

          objc_initWeak(&location, v25);
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __75__HAP2AccessoryServerController_removePairing_cleanupLocalData_completion___block_invoke_3;
          v38[3] = &unk_1E69F4420;
          objc_copyWeak(&v39, &location);
          __int16 v31 = +[HAP2Cancelable cancelableWithBlock:v38];
          objc_destroyWeak(&v39);
          objc_destroyWeak(&location);

          _Block_object_dispose(buf, 8);
        }
        else
        {
          (*((void (**)(id, id))v9 + 2))(v9, v37);
          __int16 v31 = +[HAP2Cancelable ignore];
        }

        id v16 = v37;
      }
      else
      {
        (*((void (**)(id, id))v9 + 2))(v9, v16);
        __int16 v31 = +[HAP2Cancelable ignore];
      }

      goto LABEL_19;
    }
  }
  else
  {

    __int16 v14 = 0;
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v32 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_error_impl(&dword_1D4758000, v32, OS_LOG_TYPE_ERROR, "%@ Cannot call remove pairing on an unpaired accessory", buf, 0xCu);
  }
  id v33 = [MEMORY[0x1E4F28C58] hapErrorWithCode:16];
  (*((void (**)(id, void *))v9 + 2))(v9, v33);

  __int16 v31 = +[HAP2Cancelable ignore];
LABEL_19:

  return v31;
}

void __75__HAP2AccessoryServerController_removePairing_cleanupLocalData_completion___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 72);
  id v3 = *(void **)(a1 + 48);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__HAP2AccessoryServerController_removePairing_cleanupLocalData_completion___block_invoke_2;
  v16[3] = &unk_1E69F30D0;
  long long v15 = *(_OWORD *)(a1 + 56);
  id v4 = (id)v15;
  long long v17 = v15;
  id v5 = v3;
  uint64_t v6 = v16;
  if (v1)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __108__HAP2AccessoryServerController__removePairingCompletionWithIdentity_cleanupLocalData_operation_completion___block_invoke;
    v18[3] = &unk_1E69F4070;
    id v19 = v5;
    int v20 = v1;
    id v21 = v6;
    id v7 = (void (**)(void))MEMORY[0x1D944E2D0](v18);
    if (v2)
    {
      id v8 = [v1 accessoryServer];
      uint64_t v9 = [v8 browser];
      if (v9)
      {
        __int16 v10 = (void *)v9;
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        v11 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v1;
          _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%@ Removing accessory database cache", (uint8_t *)&buf, 0xCu);
        }
        int v12 = [(id)objc_opt_class() controllerIdentifier];
        uint64_t v13 = cacheFileIdentifierForAccessoryServer(v12, v8);

        __int16 v14 = [v10 storage];
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        uint64_t v23 = __108__HAP2AccessoryServerController__removePairingCompletionWithIdentity_cleanupLocalData_operation_completion___block_invoke_268;
        uint64_t v24 = &unk_1E69F3E20;
        id v25 = v1;
        id v26 = v7;
        [v14 removeCacheForIdentifier:v13 completion:&buf];

        goto LABEL_11;
      }
    }
    v7[2](v7);
LABEL_11:
  }
}

void __75__HAP2AccessoryServerController_removePairing_cleanupLocalData_completion___block_invoke_3(uint64_t a1, void *a2)
{
  int v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained cancelWithError:v3];
}

void __75__HAP2AccessoryServerController_removePairing_cleanupLocalData_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v4 = a2;
  [v3 finish];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __108__HAP2AccessoryServerController__removePairingCompletionWithIdentity_cleanupLocalData_operation_completion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && (id v3 = *(id *)(v2 + 360)) != 0)
  {
    id v4 = v3;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v5 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      id v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      __int16 v10 = v5;
      v11 = [v8 error];
      int v12 = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      long long v15 = v11;
      _os_log_error_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%@ Remove pairing failed with error: %@", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    id v4 = 0;
  }
}

void __108__HAP2AccessoryServerController__removePairingCompletionWithIdentity_cleanupLocalData_operation_completion___block_invoke_268(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __108__HAP2AccessoryServerController__removePairingCompletionWithIdentity_cleanupLocalData_operation_completion___block_invoke_2;
  v8[3] = &unk_1E69F4070;
  void v8[4] = *(void *)(a1 + 32);
  id v4 = v3;
  id v9 = v4;
  id v10 = *(id *)(a1 + 40);
  id v5 = (void *)MEMORY[0x1D944E2D0](v8);
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    id v7 = *(void **)(v6 + 80);
  }
  else {
    id v7 = 0;
  }
  [v7 addConcurrentBlock:v5];
}

uint64_t __108__HAP2AccessoryServerController__removePairingCompletionWithIdentity_cleanupLocalData_operation_completion___block_invoke_2(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v2 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1D4758000, v2, OS_LOG_TYPE_INFO, "%@ Cache removal finished with error: %@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (id)disableNotificationsForCharacteristics:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v10 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    uint64_t v12 = [v8 count];
    uint64_t v13 = [v8 count];
    __int16 v14 = "s";
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    if (v13 == 1) {
      __int16 v14 = "";
    }
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2080;
    id v33 = (uint64_t (*)(uint64_t, uint64_t))v14;
    _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_DEFAULT, "%@ Disabling notifications for %lu characteristic%s", buf, 0x20u);
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __91__HAP2AccessoryServerController_disableNotificationsForCharacteristics_options_completion___block_invoke;
  v31[3] = &unk_1E69F3740;
  v31[4] = self;
  [v8 enumerateObjectsUsingBlock:v31];
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v33 = __Block_byref_object_copy__18139;
  id v34 = __Block_byref_object_dispose__18140;
  id v35 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __91__HAP2AccessoryServerController_disableNotificationsForCharacteristics_options_completion___block_invoke_250;
  v30[3] = &unk_1E69F2FE0;
  v30[4] = self;
  v30[5] = buf;
  [v8 enumerateObjectsUsingBlock:v30];
  long long v15 = *(void **)(*(void *)&buf[8] + 40);
  if (v15)
  {
    uint64_t v16 = -[HAP2AccessoryServerController _maybeBeginCharacteristicOperations:error:completion:]((id *)&self->super.super.isa, MEMORY[0x1E4F1CBF0], v15, v9);
  }
  else
  {
    long long v17 = [(HAP2AccessoryServerController *)self encoding];
    uint64_t v18 = *(void *)&buf[8];
    id obj = *(id *)(*(void *)&buf[8] + 40);
    id v19 = [v17 notificationRequestsForCharacteristics:v8 type:1 error:&obj];
    objc_storeStrong((id *)(v18 + 40), obj);

    int v20 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v19, "count"));
    id v21 = v20;
    if (!*(void *)(*(void *)&buf[8] + 40))
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __91__HAP2AccessoryServerController_disableNotificationsForCharacteristics_options_completion___block_invoke_255;
      v26[3] = &unk_1E69F3050;
      void v26[4] = self;
      unint64_t v28 = a4;
      id v27 = v20;
      [v19 enumerateObjectsUsingBlock:v26];
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __91__HAP2AccessoryServerController_disableNotificationsForCharacteristics_options_completion___block_invoke_2;
    v24[3] = &unk_1E69F3028;
    id v25 = v9;
    id v22 = (void *)MEMORY[0x1D944E2D0](v24);
    uint64_t v16 = -[HAP2AccessoryServerController _maybeBeginCharacteristicOperations:error:completion:]((id *)&self->super.super.isa, v21, *(void **)(*(void *)&buf[8] + 40), v22);
  }
  _Block_object_dispose(buf, 8);

  return v16;
}

void __91__HAP2AccessoryServerController_disableNotificationsForCharacteristics_options_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v4 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = v4;
    uint64_t v7 = characteristicDescriptionFromCharacteristic(v3);
    int v8 = 138412546;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%@  - %@", (uint8_t *)&v8, 0x16u);
  }
}

void __91__HAP2AccessoryServerController_disableNotificationsForCharacteristics_options_completion___block_invoke_250(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if ([v6 properties])
  {
    [v6 instanceID];

    [v6 type];
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v7 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v15 = v13;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_error_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, "%@ Unable to change notification configuration characteristic: %@", buf, 0x16u);
    }
    int v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = [NSString stringWithFormat:@"Failed to update notification configuration for characteristic %@.", v6];
    uint64_t v10 = [v8 hapErrorWithCode:3 description:v9 reason:@"Characteristic does not support notifications." suggestion:0 underlyingError:0];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a4 = 1;
  }
}

- (id)_maybeBeginCharacteristicOperations:(void *)a3 error:(void *)a4 completion:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (a1)
  {
    if (v8)
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __86__HAP2AccessoryServerController__maybeBeginCharacteristicOperations_error_completion___block_invoke;
      v33[3] = &unk_1E69F4070;
      v33[4] = a1;
      uint64_t v11 = &v35;
      id v35 = v9;
      id v34 = v8;
      uint64_t v12 = (void *)MEMORY[0x1D944E2D0](v33);
      [a1[10] addBlock:v12];
      a1 = +[HAP2Cancelable ignore];

      uint64_t v13 = v34;
    }
    else if ([v7 count])
    {
      __int16 v14 = (void *)MEMORY[0x1E4F28B48];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __86__HAP2AccessoryServerController__maybeBeginCharacteristicOperations_error_completion___block_invoke_3;
      v28[3] = &unk_1E69F4070;
      v28[4] = a1;
      id v30 = v10;
      id v15 = v7;
      id v29 = v15;
      __int16 v16 = [v14 blockOperationWithBlock:v28];
      v26[0] = 0;
      v26[1] = v26;
      v26[2] = 0x3032000000;
      v26[3] = __Block_byref_object_copy__18139;
      void v26[4] = __Block_byref_object_dispose__18140;
      id v27 = 0;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __86__HAP2AccessoryServerController__maybeBeginCharacteristicOperations_error_completion___block_invoke_4;
      v23[3] = &unk_1E69F3148;
      id v25 = v26;
      id v17 = v16;
      id v24 = v17;
      [v15 enumerateObjectsUsingBlock:v23];
      id v18 = a1[10];
      [v18 addOperation:v17];

      objc_initWeak(&location, v15);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __86__HAP2AccessoryServerController__maybeBeginCharacteristicOperations_error_completion___block_invoke_5;
      v20[3] = &unk_1E69F4420;
      objc_copyWeak(&v21, &location);
      a1 = +[HAP2Cancelable cancelableWithBlock:v20];
      uint64_t v11 = &v30;
      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);

      _Block_object_dispose(v26, 8);
      uint64_t v13 = v29;
    }
    else
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __86__HAP2AccessoryServerController__maybeBeginCharacteristicOperations_error_completion___block_invoke_2;
      v31[3] = &unk_1E69F3C68;
      v31[4] = a1;
      uint64_t v11 = &v32;
      id v32 = v10;
      uint64_t v13 = (void *)MEMORY[0x1D944E2D0](v31);
      [a1[10] addBlock:v13];
      a1 = +[HAP2Cancelable ignore];
    }
  }

  return a1;
}

void __91__HAP2AccessoryServerController_disableNotificationsForCharacteristics_options_completion___block_invoke_255(uint64_t a1, void *a2)
{
  -[HAP2AccessoryServerController _notificationOperationForRequest:operationDescription:options:](*(HAP2AccessoryServerControllerOperation **)(a1 + 32), a2, @"Disable-Notify", *(void *)(a1 + 48));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) addObject:v3];
}

void __91__HAP2AccessoryServerController_disableNotificationsForCharacteristics_options_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6) {
    [v6 enumerateObjectsUsingBlock:&__block_literal_global_260];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __91__HAP2AccessoryServerController_disableNotificationsForCharacteristics_options_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v2 = [v4 error];

  if (!v2)
  {
    id v3 = [v4 characteristic];
    [v3 setEventNotificationsEnabled:0];
  }
}

- (HAP2AccessoryServerControllerOperation)_notificationOperationForRequest:(void *)a3 operationDescription:(uint64_t)a4 options:
{
  id v4 = a1;
  if (a1)
  {
    id v6 = NSString;
    id v7 = a3;
    id v8 = a2;
    id v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    uint64_t v11 = [v8 characteristics];
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __characteristicDescriptionsFromRequest_block_invoke;
    v32[3] = &unk_1E69F2F90;
    id v33 = v12;
    id v13 = v12;
    [v11 enumerateObjectsUsingBlock:v32];
    __int16 v14 = [v13 componentsJoinedByString:@", "];

    id v15 = [v6 stringWithFormat:@"%@ %@: %@", v10, v7, v14];

    __int16 v16 = (void *)MEMORY[0x1E4F1CA48];
    id v17 = [v8 characteristics];
    id v18 = objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));

    id v19 = [v8 characteristics];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __95__HAP2AccessoryServerController__notificationOperationForRequest_operationDescription_options___block_invoke;
    v30[3] = &unk_1E69F2F90;
    id v31 = v18;
    id v20 = v18;
    [v19 enumerateObjectsUsingBlock:v30];

    id v21 = [(HAP2AccessoryServerControllerOperation *)v4 transport];
    id v22 = [v21 endpointForCharacteristics:v20];

    uint64_t v23 = [(HAP2AccessoryServerControllerOperation *)v4 transport];
    id v24 = [v23 mimeTypeForCharacteristicRequests];

    id v25 = [HAP2AccessoryServerControllerOperation alloc];
    id v26 = [(HAP2AccessoryServerControllerOperation *)v4 encoding];
    id v27 = [(HAP2AccessoryServerControllerOperation *)v4 transport];
    id v4 = [(HAP2AccessoryServerControllerOperation *)v25 initWithName:v15 controller:v4 encoding:v26 transport:v27 request:v8 endpoint:v22 mimeType:0.0 timeout:v24 options:a4];
  }

  return v4;
}

void __95__HAP2AccessoryServerController__notificationOperationForRequest_operationDescription_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 characteristic];
  [v2 addObject:v3];
}

void __86__HAP2AccessoryServerController__maybeBeginCharacteristicOperations_error_completion___block_invoke(void **a1)
{
}

void __86__HAP2AccessoryServerController__maybeBeginCharacteristicOperations_error_completion___block_invoke_2(uint64_t a1)
{
}

void __86__HAP2AccessoryServerController__maybeBeginCharacteristicOperations_error_completion___block_invoke_3(void **a1)
{
}

void __86__HAP2AccessoryServerController__maybeBeginCharacteristicOperations_error_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(void *)(v5 + 40))
  {
    objc_msgSend(v3, "addDependency:");
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
  }
  else
  {
    id v6 = 0;
  }
  *(void *)(v5 + 40) = v4;
  id v7 = v4;

  [*(id *)(a1 + 32) addDependency:v7];
}

void __86__HAP2AccessoryServerController__maybeBeginCharacteristicOperations_error_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__HAP2AccessoryServerController__maybeBeginCharacteristicOperations_error_completion___block_invoke_6;
  v6[3] = &unk_1E69F3170;
  id v7 = v3;
  id v5 = v3;
  [WeakRetained enumerateObjectsUsingBlock:v6];
}

uint64_t __86__HAP2AccessoryServerController__maybeBeginCharacteristicOperations_error_completion___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 cancelWithError:*(void *)(a1 + 32)];
}

- (void)_callCharacteristicCompletion:(void *)a3 operations:(void *)a4 error:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (a1)
  {
    if (v9)
    {
      v7[2](v7, 0, v9);
    }
    else if ([v8 count])
    {
      uint64_t v29 = 0;
      id v30 = &v29;
      uint64_t v31 = 0x3032000000;
      id v32 = __Block_byref_object_copy__18139;
      id v33 = __Block_byref_object_dispose__18140;
      id v34 = 0;
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
      uint64_t v23 = 0;
      id v24 = &v23;
      uint64_t v25 = 0x3032000000;
      id v26 = __Block_byref_object_copy__18139;
      id v27 = __Block_byref_object_dispose__18140;
      id v28 = 0;
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      id v17 = __80__HAP2AccessoryServerController__callCharacteristicCompletion_operations_error___block_invoke;
      id v18 = &unk_1E69F32B0;
      id v19 = a1;
      id v21 = &v23;
      id v12 = v11;
      id v20 = v12;
      id v22 = &v29;
      [v8 enumerateObjectsUsingBlock:&v15];
      id v13 = (void *)v30[5];
      if (v13) {
        -[HAP2AccessoryServerController _handleUpdatedValuesFromResponse:](a1, v13);
      }
      if (v24[5])
      {
        ((void (*)(void (**)(id, void, id), void))v7[2])(v7, 0);
      }
      else
      {
        __int16 v14 = objc_msgSend(v12, "copy", v15, v16, v17, v18, v19);
        ((void (**)(id, void *, id))v7)[2](v7, v14, 0);
      }
      _Block_object_dispose(&v23, 8);

      _Block_object_dispose(&v29, 8);
    }
    else
    {
      v7[2](v7, MEMORY[0x1E4F1CBF0], 0);
    }
  }
}

void __80__HAP2AccessoryServerController__callCharacteristicCompletion_operations_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  int v7 = [v6 isCancelled];
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v8 = hap2Log_accessory;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v43 = v12;
      __int16 v44 = 2112;
      v45 = v6;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%@ Operation completed successfully: %@", buf, 0x16u);
    }
    if (v6) {
      id v13 = (void *)v6[44];
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;
    if ([v14 conformsToProtocol:&unk_1F2C886F0])
    {
      if (v6) {
        uint64_t v15 = (void *)v6[44];
      }
      else {
        uint64_t v15 = 0;
      }
      id v16 = v15;
    }
    else
    {
      id v16 = 0;
    }

    if (v6) {
      id v17 = (void *)v6[45];
    }
    else {
      id v17 = 0;
    }
    id v18 = v17;
    if ([v18 conformsToProtocol:&unk_1F2C8ADE8])
    {
      if (v6) {
        id v19 = (void *)v6[45];
      }
      else {
        id v19 = 0;
      }
      id v20 = v19;

      if (v20)
      {
        id v21 = *(void **)(a1 + 40);
        id v22 = [v20 characteristics];
        [v21 addObjectsFromArray:v22];

        if ([v20 conformsToProtocol:&unk_1F2C8AE58]) {
          uint64_t v23 = v20;
        }
        else {
          uint64_t v23 = 0;
        }
        id v24 = v23;
        uint64_t v25 = [v24 updatedValues];

        if (v25)
        {
          if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
          {
            id v26 = (void *)MEMORY[0x1E4F1CA48];
            id v27 = [v24 updatedValues];
            uint64_t v28 = objc_msgSend(v26, "arrayWithCapacity:", objc_msgSend(v27, "count"));
            uint64_t v29 = *(void *)(*(void *)(a1 + 56) + 8);
            id v30 = *(void **)(v29 + 40);
            *(void *)(v29 + 40) = v28;
          }
          uint64_t v31 = [v24 updatedValues];
          id v32 = v31;
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __80__HAP2AccessoryServerController__callCharacteristicCompletion_operations_error___block_invoke_358;
          v41[3] = &unk_1E69F3238;
          uint64_t v33 = *(void *)(a1 + 56);
          v41[4] = *(void *)(a1 + 32);
          void v41[5] = v33;
          id v34 = v41;
        }
        else
        {
          uint64_t v31 = [v20 characteristics];
          id v32 = v31;
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __80__HAP2AccessoryServerController__callCharacteristicCompletion_operations_error___block_invoke_360;
          v40[3] = &unk_1E69F3260;
          v40[4] = *(void *)(a1 + 32);
          id v34 = v40;
        }
        [v31 enumerateObjectsUsingBlock:v34];

        goto LABEL_33;
      }
    }
    else
    {
    }
    id v35 = [v16 characteristics];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __80__HAP2AccessoryServerController__callCharacteristicCompletion_operations_error___block_invoke_361;
    v37[3] = &unk_1E69F3288;
    v37[4] = *(void *)(a1 + 32);
    uint64_t v38 = v6;
    id v39 = *(id *)(a1 + 40);
    [v35 enumerateObjectsUsingBlock:v37];

LABEL_33:
    goto LABEL_34;
  }
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v36 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412546;
    uint64_t v43 = v36;
    __int16 v44 = 2112;
    v45 = v6;
    _os_log_debug_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEBUG, "%@ Operation was canceled: %@", buf, 0x16u);
  }
  uint64_t v9 = [v6 error];
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  *a4 = 1;
LABEL_34:
}

- (void)_handleUpdatedValuesFromResponse:(void *)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = [a1 accessoryServer];
    if ([v4 conformsToProtocol:&unk_1F2C8CD98])
    {
      id v5 = [a1 accessoryServer];

      if (v5 && ([v5 isPaired] & 1) != 0)
      {
        id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
        uint64_t v10 = MEMORY[0x1E4F143A8];
        uint64_t v11 = 3221225472;
        uint64_t v12 = __66__HAP2AccessoryServerController__handleUpdatedValuesFromResponse___block_invoke;
        id v13 = &unk_1E69F3210;
        id v7 = v6;
        id v14 = v7;
        uint64_t v15 = a1;
        [v3 enumerateObjectsUsingBlock:&v10];
        if (objc_msgSend(v7, "count", v10, v11, v12, v13))
        {
          id v8 = (void *)[v7 copy];
          [v5 handleUpdatedCharacteristicValues:v8];
        }
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {

      id v5 = 0;
    }
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v9 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v17 = a1;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%@ Accessory server has become nil or unpaired", buf, 0xCu);
    }
    goto LABEL_13;
  }
LABEL_14:
}

void __66__HAP2AccessoryServerController__handleUpdatedValuesFromResponse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 error];

  if (v4)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v5 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = v5;
      id v8 = [v3 characteristic];
      uint64_t v9 = [v3 error];
      int v12 = 138412802;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_error_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, "%@ Ignoring failed read for characteristic %@: %@", (uint8_t *)&v12, 0x20u);
    }
  }
  else
  {
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = [v3 characteristic];
    [v10 addObject:v11];
  }
}

void __80__HAP2AccessoryServerController__callCharacteristicCompletion_operations_error___block_invoke_358(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 error];

  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v5 = (void *)hap2Log_accessory;
  BOOL v6 = os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = v5;
      uint64_t v9 = [v3 characteristic];
      uint64_t v10 = characteristicDescriptionFromCharacteristic(v9);
      uint64_t v11 = [v3 error];
      *(_DWORD *)__int16 v14 = 138412802;
      *(void *)&v14[4] = v7;
      *(_WORD *)&v14[12] = 2112;
      *(void *)&v14[14] = v10;
      *(_WORD *)&v14[22] = 2112;
      uint64_t v15 = v11;
      int v12 = "%@  - %@ (%@)";
LABEL_8:
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, v12, v14, 0x20u);
    }
  }
  else if (v6)
  {
    uint64_t v13 = *(void *)(a1 + 32);
    id v8 = v5;
    uint64_t v9 = [v3 characteristic];
    uint64_t v10 = characteristicDescriptionFromCharacteristic(v9);
    uint64_t v11 = [v3 value];
    *(_DWORD *)__int16 v14 = 138412803;
    *(void *)&v14[4] = v13;
    *(_WORD *)&v14[12] = 2112;
    *(void *)&v14[14] = v10;
    *(_WORD *)&v14[22] = 2113;
    uint64_t v15 = v11;
    int v12 = "%@  - %@ -> %{private}@";
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "addObject:", v3, *(_OWORD *)v14, *(void *)&v14[16], v15);
}

void __80__HAP2AccessoryServerController__callCharacteristicCompletion_operations_error___block_invoke_360(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 error];

  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v5 = (void *)hap2Log_accessory;
  BOOL v6 = os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = v5;
      uint64_t v9 = [v3 characteristic];
      uint64_t v10 = characteristicDescriptionFromCharacteristic(v9);
      uint64_t v11 = [v3 error];
      int v14 = 138412802;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      id v17 = v10;
      __int16 v18 = 2112;
      id v19 = v11;
      int v12 = "%@  - %@ (%@)";
LABEL_8:
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v14, 0x20u);
    }
  }
  else if (v6)
  {
    uint64_t v13 = *(void *)(a1 + 32);
    id v8 = v5;
    uint64_t v9 = [v3 characteristic];
    uint64_t v10 = characteristicDescriptionFromCharacteristic(v9);
    uint64_t v11 = [v3 value];
    int v14 = 138412803;
    uint64_t v15 = v13;
    __int16 v16 = 2112;
    id v17 = v10;
    __int16 v18 = 2113;
    id v19 = v11;
    int v12 = "%@  - %@ -> %{private}@";
    goto LABEL_8;
  }
}

void __80__HAP2AccessoryServerController__callCharacteristicCompletion_operations_error___block_invoke_361(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v4 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    BOOL v6 = v4;
    uint64_t v7 = [v3 characteristic];
    id v8 = characteristicDescriptionFromCharacteristic(v7);
    uint64_t v9 = [*(id *)(a1 + 40) error];
    int v13 = 138412802;
    uint64_t v14 = v5;
    __int16 v15 = 2112;
    __int16 v16 = v8;
    __int16 v17 = 2112;
    __int16 v18 = v9;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%@  - %@ (%@)", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v10 = [v3 characteristic];
  uint64_t v11 = [*(id *)(a1 + 40) error];
  int v12 = +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:v10 error:v11];

  [*(id *)(a1 + 48) addObject:v12];
}

- (id)enableNotificationsForCharacteristics:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = (void *)0x1E4F1C000;
  uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v11 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = v11;
    uint64_t v13 = [v7 count];
    uint64_t v14 = [v7 count];
    __int16 v15 = "s";
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    if (v14 == 1) {
      __int16 v15 = "";
    }
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2080;
    *(void *)&unsigned char buf[24] = v15;
    _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_DEFAULT, "%@ Enabling notifications for %lu characteristic%s", buf, 0x20u);
  }
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke;
  v80[3] = &unk_1E69F2FB8;
  v80[4] = self;
  id v16 = v10;
  id v81 = v16;
  [v7 enumerateObjectsUsingBlock:v80];
  uint64_t v17 = [v16 count];
  if (v17 == [v7 count])
  {
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_226;
    v77[3] = &unk_1E69F36A0;
    v77[4] = self;
    id v79 = v8;
    id v78 = v16;
    uint64_t v9 = -[HAP2AccessoryServerController _maybeBeginCharacteristicOperations:error:completion:]((id *)&self->super.super.isa, MEMORY[0x1E4F1CBF0], 0, v77);

    goto LABEL_35;
  }
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__18139;
  v75 = __Block_byref_object_dispose__18140;
  id v76 = 0;
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_228;
  v70[3] = &unk_1E69F2FE0;
  v70[4] = self;
  v70[5] = &v71;
  [v7 enumerateObjectsUsingBlock:v70];
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_239;
  v68[3] = &unk_1E69F3028;
  id v18 = v8;
  id v69 = v18;
  uint64_t v19 = (void *)MEMORY[0x1D944E2D0](v68);
  uint64_t v20 = (void *)v72[5];
  if (!v20)
  {
    if (self)
    {
      uint64_t v57 = 0;
      v58 = &v57;
      uint64_t v59 = 0x2020000000;
      LOBYTE(v60) = 0;
      id v21 = self->_propertyLock;
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __75__HAP2AccessoryServerController_isFlagNotificationEnableConsistencyWarning__block_invoke;
      *(void *)&unsigned char buf[24] = &unk_1E69F44F0;
      v83 = self;
      v84 = &v57;
      [(HAP2PropertyLock *)v21 performReadingBlock:buf];

      LODWORD(v21) = *((unsigned __int8 *)v58 + 24);
      _Block_object_dispose(&v57, 8);
      if (v21)
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        id v22 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = self;
          _os_log_error_impl(&dword_1D4758000, v22, OS_LOG_TYPE_ERROR, "%@ Enabling notification while all notifications disable request has been issued; some notifications will remain enabled",
            buf,
            0xCu);
        }
      }
    }
    uint64_t v23 = [(HAP2AccessoryServerController *)self encoding];
    id v24 = (id *)(v72 + 5);
    id obj = (id)v72[5];
    uint64_t v46 = [v23 notificationRequestsForCharacteristics:v7 type:0 error:&obj];
    objc_storeStrong(v24, obj);

    uint64_t v25 = (void *)v72[5];
    if (v25)
    {
      id v48 = 0;
      id v26 = 0;
      id v27 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_29;
    }
    uint64_t v28 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v46, "count"));
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_243;
    v64[3] = &unk_1E69F3050;
    v64[4] = self;
    unint64_t v66 = a4;
    id v45 = v28;
    id v65 = v45;
    [v46 enumerateObjectsUsingBlock:v64];
    uint64_t v29 = [(HAP2AccessoryServerController *)self encoding];
    char v30 = [v29 encodingFeatures];

    if ((v30 & 0x10) != 0)
    {
      uint64_t v31 = (id *)(v72 + 5);
      id v63 = (id)v72[5];
      id v48 = -[HAP2AccessoryServerController _createOperationsToReadCharacteristics:timeout:options:error:](self, v7, a4, &v63, 0.0);
      objc_storeStrong(v31, v63);
      if (!v48)
      {
        uint64_t v9 = -[HAP2AccessoryServerController _maybeBeginCharacteristicOperations:error:completion:]((id *)&self->super.super.isa, MEMORY[0x1E4F1CBF0], (void *)v72[5], v18);
        id v48 = 0;
        id v27 = 0;
        id v26 = 0;
        int v36 = 0;
        goto LABEL_27;
      }
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v32 = (id)hap2Log_accessory;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        int v42 = [v48 count];
        unint64_t v43 = [v48 count];
        __int16 v44 = "";
        *(_DWORD *)long long buf = 138412802;
        *(void *)&uint8_t buf[4] = self;
        if (v43 > 1) {
          __int16 v44 = "s";
        }
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v42;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = v44;
        _os_log_debug_impl(&dword_1D4758000, v32, OS_LOG_TYPE_DEBUG, "%@ Adding %d read operation%s after enabling notify", buf, 0x1Cu);
      }

      *(void *)long long buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      *(void *)&unsigned char buf[24] = __Block_byref_object_copy__18139;
      v83 = (HAP2AccessoryServerController *)__Block_byref_object_dispose__18140;
      v84 = 0;
      uint64_t v57 = 0;
      v58 = &v57;
      uint64_t v59 = 0x3032000000;
      v60 = __Block_byref_object_copy__18139;
      v61 = __Block_byref_object_dispose__18140;
      id v62 = 0;
      uint64_t v33 = (void *)MEMORY[0x1D944E2D0](v19);
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_248;
      v56[3] = &unk_1E69F3078;
      v56[4] = buf;
      v56[5] = &v57;
      uint64_t v34 = MEMORY[0x1D944E2D0](v56);

      uint64_t v9 = v52;
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_2_249;
      v52[3] = &unk_1E69F30A0;
      v52[4] = self;
      id v53 = v33;
      v54 = buf;
      v55 = &v57;
      id v35 = v33;
      id v26 = (void *)MEMORY[0x1D944E2D0](v52);

      _Block_object_dispose(&v57, 8);
      _Block_object_dispose(buf, 8);

      uint64_t v19 = (void *)v34;
    }
    else
    {
      id v48 = 0;
      id v26 = 0;
    }
    id v27 = (void *)[v45 copy];
    int v36 = 1;
LABEL_27:

    if (!v36)
    {
LABEL_33:

      goto LABEL_34;
    }
    uint64_t v25 = (void *)v72[5];
LABEL_29:
    id v37 = -[HAP2AccessoryServerController _maybeBeginCharacteristicOperations:error:completion:]((id *)&self->super.super.isa, v27, v25, v19);
    if (v48)
    {
      uint64_t v38 = -[HAP2AccessoryServerController _maybeBeginCharacteristicOperations:error:completion:]((id *)&self->super.super.isa, v48, 0, v26);
    }
    else
    {
      uint64_t v38 = 0;
    }
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_3;
    v49[3] = &unk_1E69F4128;
    id v39 = v37;
    id v50 = v39;
    id v40 = v38;
    id v51 = v40;
    uint64_t v9 = +[HAP2Cancelable cancelableWithBlock:v49];

    goto LABEL_33;
  }
  uint64_t v9 = -[HAP2AccessoryServerController _maybeBeginCharacteristicOperations:error:completion:]((id *)&self->super.super.isa, MEMORY[0x1E4F1CBF0], v20, v18);
LABEL_34:

  _Block_object_dispose(&v71, 8);
LABEL_35:

  return v9;
}

void __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [v3 eventNotificationsEnabled];
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v5 = (void *)hap2Log_accessory;
  BOOL v6 = os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = v5;
      uint64_t v9 = characteristicDescriptionFromCharacteristic(v3);
      int v14 = 138412546;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%@ Detected duplicate enable notify for %@", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v10 = +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:v3 error:0];
    [*(id *)(a1 + 40) addObject:v10];
  }
  else if (v6)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = v5;
    uint64_t v13 = characteristicDescriptionFromCharacteristic(v3);
    int v14 = 138412546;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    uint64_t v17 = v13;
    _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_INFO, "%@  - %@", (uint8_t *)&v14, 0x16u);
  }
}

uint64_t __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_226(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v2 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D4758000, v2, OS_LOG_TYPE_INFO, "%@ Returning characteristics with notifications already enabled", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_228(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if ([v6 properties])
  {
    [v6 instanceID];

    [v6 type];
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v7 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v15 = v13;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_error_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, "%@ Unable to change notification configuration characteristic: %@", buf, 0x16u);
    }
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = [NSString stringWithFormat:@"Failed to update notification configuration for characteristic %@.", v6];
    uint64_t v10 = [v8 hapErrorWithCode:3 description:v9 reason:@"Characteristic does not support notifications." suggestion:0 underlyingError:0];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    int v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a4 = 1;
  }
}

void __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_239(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6) {
    [v6 enumerateObjectsUsingBlock:&__block_literal_global_242];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_243(uint64_t a1, void *a2)
{
  -[HAP2AccessoryServerController _notificationOperationForRequest:operationDescription:options:](*(HAP2AccessoryServerControllerOperation **)(a1 + 32), a2, @"Enable-Notify", *(void *)(a1 + 48));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) addObject:v3];
}

- (id)_createOperationsToReadCharacteristics:(uint64_t)a3 timeout:(void *)a4 options:(double)a5 error:
{
  id v9 = a2;
  uint64_t v10 = v9;
  if (a1)
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000;
    char v30 = __Block_byref_object_copy__18139;
    uint64_t v31 = __Block_byref_object_dispose__18140;
    id v32 = 0;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __94__HAP2AccessoryServerController__createOperationsToReadCharacteristics_timeout_options_error___block_invoke;
    v26[3] = &unk_1E69F2F40;
    *(double *)&v26[6] = a5;
    void v26[4] = a1;
    void v26[5] = &v27;
    [v10 enumerateObjectsUsingBlock:v26];
    if (!v28[5])
    {
      int v12 = [a1 encoding];
      uint64_t v13 = [v12 groupingsForReadRequestsForCharacteristics:v10];

      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      uint64_t v19 = __94__HAP2AccessoryServerController__createOperationsToReadCharacteristics_timeout_options_error___block_invoke_219;
      uint64_t v20 = &unk_1E69F2F68;
      double v24 = a5;
      uint64_t v25 = a3;
      id v21 = a1;
      uint64_t v23 = &v27;
      id v22 = v11;
      [v13 enumerateObjectsUsingBlock:&v17];
    }
    if (a4)
    {
      int v14 = (void *)v28[5];
      if (v14) {
        *a4 = v14;
      }
    }
    uint64_t v15 = objc_msgSend(v11, "copy", v17, v18, v19, v20, v21);
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

void __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_248(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

uint64_t __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_2_249(uint64_t a1, void *a2)
{
  -[HAP2AccessoryServerController _handleUpdatedValuesFromResponse:](*(void **)(a1 + 32), a2);
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 cancelWithError:v4];
  [*(id *)(a1 + 40) cancelWithError:v4];
}

void __94__HAP2AccessoryServerController__createOperationsToReadCharacteristics_timeout_options_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  [v6 instanceID];

  [v6 type];
  id v7 = (id)[NSNumber numberWithDouble:*(double *)(a1 + 48)];
  if (([v6 properties] & 2) == 0)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v8 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v16 = v14;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_error_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%@ Unable to read characteristic (does not support secured reads): %@", buf, 0x16u);
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = [NSString stringWithFormat:@"Failed to read from characteristic %@.", v6];
    uint64_t v11 = [v9 hapErrorWithCode:11 description:v10 reason:@"Characteristic does not support secured reads." suggestion:0 underlyingError:0];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    *a4 = 1;
  }
}

void __94__HAP2AccessoryServerController__createOperationsToReadCharacteristics_timeout_options_error___block_invoke_219(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v32 = *(void **)(v6 + 40);
  uint64_t v33 = (id *)(v6 + 40);
  if (v5)
  {
    double v7 = *(double *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 64);
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA48];
    id v10 = a2;
    uint64_t v11 = objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __88__HAP2AccessoryServerController__readOperationForCharacteristics_timeout_options_error___block_invoke;
    v35[3] = &unk_1E69F3740;
    id v12 = v11;
    id v36 = v12;
    [v10 enumerateObjectsUsingBlock:v35];
    uint64_t v13 = NSString;
    uint64_t v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    uint64_t v31 = v12;
    uint64_t v16 = [v12 componentsJoinedByString:@", "];
    char v30 = [v13 stringWithFormat:@"%@ Read: %@", v15, v16];

    __int16 v17 = [v5 transport];
    id v18 = [v17 endpointForCharacteristics:v10];

    uint64_t v19 = [v5 transport];
    uint64_t v20 = [v19 mimeTypeForCharacteristicRequests];

    id v21 = [[HAP2ControllerReadRequest alloc] initWithCharacteristics:v10];
    id v22 = [v5 accessoryServer];
    if ([v22 conformsToProtocol:&unk_1F2C8CD98])
    {
      uint64_t v23 = [v5 accessoryServer];
    }
    else
    {
      uint64_t v23 = 0;
    }

    if ([v23 isConfirming]) {
      uint64_t v24 = v8;
    }
    else {
      uint64_t v24 = v8 | 4;
    }
    uint64_t v25 = [HAP2AccessoryServerControllerReadOperation alloc];
    id v26 = [v5 encoding];
    uint64_t v27 = [v5 transport];
    uint64_t v34 = [(HAP2AccessoryServerControllerReadOperation *)v25 initWithName:v30 controller:v5 encoding:v26 transport:v27 readRequest:v21 endpoint:v18 mimeType:v7 timeout:v20 options:v24];
  }
  else
  {
    uint64_t v34 = 0;
  }
  objc_storeStrong(v33, v32);
  uint64_t v28 = v34;
  if (v34)
  {
    [*(id *)(a1 + 40) addObject:v34];
    uint64_t v28 = v34;
  }
  else
  {
    *a4 = 1;
  }
}

void __88__HAP2AccessoryServerController__readOperationForCharacteristics_timeout_options_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  characteristicDescriptionFromCharacteristic(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

uint64_t __75__HAP2AccessoryServerController_isFlagNotificationEnableConsistencyWarning__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 9);
  return result;
}

void __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v2 = [v4 error];

  if (!v2)
  {
    id v3 = [v4 characteristic];
    [v3 setEventNotificationsEnabled:1];
  }
}

- (id)writeValuesForCharacteristics:(id)a3 timeout:(double)a4 options:(unint64_t)a5 completion:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v12 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v12;
    uint64_t v14 = [v10 count];
    uint64_t v15 = [v10 count];
    uint64_t v16 = "s";
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    if (v15 == 1) {
      uint64_t v16 = "";
    }
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2080;
    char v30 = (uint64_t (*)(uint64_t, uint64_t))v16;
    _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_DEFAULT, "%@ Writing %lu characteristic%s", buf, 0x20u);
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __90__HAP2AccessoryServerController_writeValuesForCharacteristics_timeout_options_completion___block_invoke;
  v28[3] = &unk_1E69F2F90;
  v28[4] = self;
  [v10 enumerateObjectsUsingBlock:v28];
  __int16 v17 = [(HAP2AccessoryServerController *)self encoding];
  id v18 = [v17 groupingsForWriteRequestsForCharacteristics:v10];

  uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v18, "count"));
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  char v30 = __Block_byref_object_copy__18139;
  uint64_t v31 = __Block_byref_object_dispose__18140;
  id v32 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __90__HAP2AccessoryServerController_writeValuesForCharacteristics_timeout_options_completion___block_invoke_224;
  v23[3] = &unk_1E69F2F68;
  double v26 = a4;
  unint64_t v27 = a5;
  void v23[4] = self;
  uint64_t v25 = buf;
  id v20 = v19;
  id v24 = v20;
  [v18 enumerateObjectsUsingBlock:v23];
  id v21 = -[HAP2AccessoryServerController _maybeBeginCharacteristicOperations:error:completion:]((id *)&self->super.super.isa, v20, *(void **)(*(void *)&buf[8] + 40), v11);

  _Block_object_dispose(buf, 8);

  return v21;
}

void __90__HAP2AccessoryServerController_writeValuesForCharacteristics_timeout_options_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v4 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = v4;
    double v7 = [v3 characteristic];
    uint64_t v8 = characteristicDescriptionFromCharacteristic(v7);
    uint64_t v9 = [v3 value];
    int v10 = 138412803;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2113;
    uint64_t v15 = v9;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%@  - %@ -> %{private}@", (uint8_t *)&v10, 0x20u);
  }
}

void __90__HAP2AccessoryServerController_writeValuesForCharacteristics_timeout_options_completion___block_invoke_224(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v5 = *(HAP2AccessoryServerControllerTimedWriteOperation **)(a1 + 32);
  double v6 = *(double *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  int v10 = *(void **)(v8 + 40);
  uint64_t v9 = (id *)(v8 + 40);
  id obj = v10;
  id v11 = a2;
  if (v5)
  {
    uint64_t v66 = 0;
    v67 = &v66;
    uint64_t v68 = 0x3032000000;
    id v69 = __Block_byref_object_copy__18139;
    v70 = __Block_byref_object_dispose__18140;
    id v71 = 0;
    uint64_t v62 = 0;
    id v63 = &v62;
    uint64_t v64 = 0x2020000000;
    char v65 = 0;
    v60[0] = 0;
    v60[1] = v60;
    v60[2] = 0x3032000000;
    v60[3] = __Block_byref_object_copy__18139;
    v60[4] = __Block_byref_object_dispose__18140;
    +[HAPMetadata getSharedInstance];
    uint64_t v51 = v7;
    id v61 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __94__HAP2AccessoryServerController__writeOperationForCharacteristicTuples_timeout_options_error___block_invoke;
    v54[3] = &unk_1E69F3198;
    v54[4] = v5;
    uint64_t v57 = &v66;
    v58 = &v62;
    uint64_t v59 = v60;
    id v14 = v12;
    id v55 = v14;
    id v15 = v13;
    id v56 = v15;
    [v11 enumerateObjectsUsingBlock:v54];
    uint64_t v16 = (void *)v67[5];
    if (v16)
    {
      uint64_t v5 = 0;
      id obj = v16;
    }
    else if (*((unsigned char *)v63 + 24))
    {
      id v49 = v11;
      id v47 = v15;
      __int16 v17 = NSString;
      id v18 = v14;
      uint64_t v19 = (objc_class *)objc_opt_class();
      id v20 = NSStringFromClass(v19);
      id v21 = [v18 componentsJoinedByString:@", "];

      id v45 = [v17 stringWithFormat:@"%@ Timed-Write: %@", v20, v21];

      id v22 = [(HAP2AccessoryServerControllerTimedWriteOperation *)v5 encoding];
      uint64_t v23 = [v22 prepareWriteRequestForCharacteristics:v49 ttl:&obj error:2.5];

      if (v23)
      {
        id v24 = [(HAP2AccessoryServerControllerTimedWriteOperation *)v5 encoding];
        uint64_t v25 = [v24 executeWriteRequestForCharacteristics:v49 error:&obj];

        if (v25)
        {
          double v26 = [(HAP2AccessoryServerControllerTimedWriteOperation *)v5 transport];
          __int16 v44 = [v26 endpointForCharacteristics:v47];

          unint64_t v27 = [(HAP2AccessoryServerControllerTimedWriteOperation *)v5 transport];
          unint64_t v43 = [v27 mimeTypeForCharacteristicRequests];

          int v42 = [HAP2AccessoryServerControllerTimedWriteOperation alloc];
          uint64_t v28 = [(HAP2AccessoryServerControllerTimedWriteOperation *)v5 encoding];
          uint64_t v29 = [(HAP2AccessoryServerControllerTimedWriteOperation *)v5 transport];
          uint64_t v5 = [(HAP2AccessoryServerControllerTimedWriteOperation *)v42 initWithName:v45 controller:v5 encoding:v28 transport:v29 prepareRequest:v23 executeRequest:v25 endpoint:v6 mimeType:v44 timeout:v43 options:v51];
        }
        else
        {
          uint64_t v5 = 0;
        }
      }
      else
      {
        uint64_t v5 = 0;
      }
    }
    else
    {
      char v30 = NSString;
      uint64_t v31 = (objc_class *)objc_opt_class();
      id v32 = NSStringFromClass(v31);
      uint64_t v33 = [v14 componentsJoinedByString:@", "];
      uint64_t v34 = [v30 stringWithFormat:@"%@ Write: %@", v32, v33];

      id v35 = [(HAP2AccessoryServerControllerTimedWriteOperation *)v5 encoding];
      id v36 = [v35 writeRequestForCharacteristics:v11 shouldEncrypt:1 error:&obj];

      if (v36)
      {
        id v50 = v34;
        id v37 = [(HAP2AccessoryServerControllerTimedWriteOperation *)v5 transport];
        id v48 = [v37 endpointForCharacteristics:v15];

        uint64_t v38 = [(HAP2AccessoryServerControllerTimedWriteOperation *)v5 transport];
        uint64_t v46 = [v38 mimeTypeForCharacteristicRequests];

        id v39 = [HAP2AccessoryServerControllerOperation alloc];
        id v40 = [(HAP2AccessoryServerControllerTimedWriteOperation *)v5 encoding];
        id v41 = [(HAP2AccessoryServerControllerTimedWriteOperation *)v5 transport];
        uint64_t v5 = [(HAP2AccessoryServerControllerOperation *)v39 initWithName:v50 controller:v5 encoding:v40 transport:v41 request:v36 endpoint:v48 mimeType:v6 timeout:v46 options:v51];

        uint64_t v34 = v50;
      }
      else
      {
        uint64_t v5 = 0;
      }
    }
    _Block_object_dispose(v60, 8);

    _Block_object_dispose(&v62, 8);
    _Block_object_dispose(&v66, 8);
  }
  objc_storeStrong(v9, obj);
  if (v5) {
    [*(id *)(a1 + 40) addObject:v5];
  }
  else {
    *a4 = 1;
  }
}

void __94__HAP2AccessoryServerController__writeOperationForCharacteristicTuples_timeout_options_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v7 = [v6 characteristic];
  if (([v7 properties] & 4) != 0)
  {
    if (([v7 properties] & 0x20) != 0) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
    id v14 = [v7 type];
    if ([v14 isEqualToString:@"00000131-0000-1000-8000-0026BB765291"]) {
      goto LABEL_18;
    }
    id v15 = [v7 type];
    if (![v15 isEqualToString:@"00000138-0000-1000-8000-0026BB765291"])
    {
      uint64_t v16 = [v7 type];
      if (![v16 isEqualToString:@"00000143-0000-1000-8000-0026BB765291"])
      {
        __int16 v17 = [v7 type];
        if (([v17 isEqualToString:@"00000262-0000-1000-8000-0026BB765291"] & 1) == 0)
        {
          id v18 = [v7 type];
          if (([v18 isEqualToString:@"00000264-0000-1000-8000-0026BB765291"] & 1) == 0)
          {
            id v22 = [v7 type];
            char v23 = [v22 isEqualToString:@"00000704-0000-1000-8000-0026BB765291"];

            if (v23) {
              goto LABEL_19;
            }
            id v24 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
            uint64_t v25 = [v6 characteristic];
            double v26 = [v25 type];
            unint64_t v27 = objc_msgSend(v26, "hap_validatedAndNormalizedUUIDString");
            id v14 = [v24 getDefaultCharacteristicProperties:v27];

            if (v14 && ([v14 unsignedIntegerValue] & 0x80) == 0) {
              [v6 setIncludeResponseValue:0];
            }
LABEL_18:

LABEL_19:
            uint64_t v19 = *(void **)(a1 + 40);
            id v20 = characteristicDescriptionFromCharacteristic(v7);
            [v19 addObject:v20];

            [*(id *)(a1 + 48) addObject:v7];
            goto LABEL_20;
          }
        }
      }
    }
    goto LABEL_18;
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v8 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412546;
    uint64_t v29 = v21;
    __int16 v30 = 2112;
    uint64_t v31 = v7;
    _os_log_error_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%@ Unable to write characteristic (does not support secured writes): %@", buf, 0x16u);
  }
  uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
  int v10 = [NSString stringWithFormat:@"Failed to write to characteristic %@.", v7];
  uint64_t v11 = [v9 hapErrorWithCode:10 description:v10 reason:@"Characteristic does not support secured writes." suggestion:0 underlyingError:0];
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  *a4 = 1;
LABEL_20:
}

- (id)readValuesForCharacteristics:(id)a3 timeout:(double)a4 options:(unint64_t)a5 completion:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v12 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v12;
    uint64_t v14 = [v10 count];
    uint64_t v15 = [v10 count];
    uint64_t v16 = "s";
    *(_DWORD *)long long buf = 138412802;
    id v24 = self;
    if (v15 == 1) {
      uint64_t v16 = "";
    }
    __int16 v25 = 2048;
    uint64_t v26 = v14;
    __int16 v27 = 2080;
    uint64_t v28 = v16;
    _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_DEFAULT, "%@ Reading %lu characteristic%s", buf, 0x20u);
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __89__HAP2AccessoryServerController_readValuesForCharacteristics_timeout_options_completion___block_invoke;
  v22[3] = &unk_1E69F3740;
  v22[4] = self;
  [v10 enumerateObjectsUsingBlock:v22];
  id v21 = 0;
  __int16 v17 = -[HAP2AccessoryServerController _createOperationsToReadCharacteristics:timeout:options:error:](self, v10, a5, &v21, a4);
  id v18 = v21;
  uint64_t v19 = -[HAP2AccessoryServerController _maybeBeginCharacteristicOperations:error:completion:]((id *)&self->super.super.isa, v17, v18, v11);

  return v19;
}

void __89__HAP2AccessoryServerController_readValuesForCharacteristics_timeout_options_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v4 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = v4;
    uint64_t v7 = characteristicDescriptionFromCharacteristic(v3);
    int v8 = 138412546;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%@  - %@", (uint8_t *)&v8, 0x16u);
  }
}

- (id)readAttributeDatabaseWithCompletion:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    __int16 v30 = self;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%@ Reading the attribute database", buf, 0xCu);
  }
  id v6 = [(HAP2AccessoryServerController *)self encoding];
  id v28 = 0;
  uint64_t v7 = [v6 readRequestForAttributeDatabaseWithEncryption:1 error:&v28];
  id v8 = v28;

  if (v7)
  {
    uint64_t v9 = [(HAP2AccessoryServerController *)self transport];
    __int16 v10 = [v9 wellKnownEndpoint:5];

    id v11 = [(HAP2AccessoryServerController *)self transport];
    uint64_t v12 = [v11 mimeTypeForWellKnownEndpoint:5];

    uint64_t v13 = [HAP2AccessoryServerControllerAttributeRequestOperation alloc];
    uint64_t v14 = [(HAP2AccessoryServerController *)self encoding];
    uint64_t v15 = [(HAP2AccessoryServerController *)self transport];
    uint64_t v16 = [(HAP2AccessoryServerControllerOperation *)v13 initWithName:@"Fetch attribute database" controller:self encoding:v14 transport:v15 request:v7 endpoint:v10 mimeType:0.0 timeout:v12 options:0];

    __int16 v17 = (void *)MEMORY[0x1E4F28B48];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __69__HAP2AccessoryServerController_readAttributeDatabaseWithCompletion___block_invoke;
    v25[3] = &unk_1E69F4070;
    v25[4] = self;
    id v18 = v16;
    uint64_t v26 = v18;
    id v27 = v4;
    uint64_t v19 = [v17 blockOperationWithBlock:v25];
    [v19 addDependency:v18];
    if (self) {
      operationQueue = self->_operationQueue;
    }
    else {
      operationQueue = 0;
    }
    [(HAP2SerializedOperationQueue *)operationQueue addOperation:v19];
    objc_initWeak((id *)buf, v18);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __69__HAP2AccessoryServerController_readAttributeDatabaseWithCompletion___block_invoke_2;
    v23[3] = &unk_1E69F4420;
    objc_copyWeak(&v24, (id *)buf);
    id v21 = +[HAP2Cancelable cancelableWithBlock:v23];
    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

void __69__HAP2AccessoryServerController_readAttributeDatabaseWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  if (v1)
  {
    if (v3) {
      uint64_t v5 = (void *)v3[45];
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = v5;
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v7 = hap2Log_accessory;
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v1;
        _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%@ Received accessory database response", buf, 0xCu);
      }
      *(unsigned char *)(v1 + 10) = 0;
      id v8 = [(id)v1 accessoryServer];
      if ([v8 conformsToProtocol:&unk_1F2C8CD98])
      {
        id v9 = [(id)v1 accessoryServer];

        if (v9)
        {
          if ([v9 isPaired])
          {
            if ([v6 conformsToProtocol:&unk_1F2C8B860]) {
              __int16 v10 = v6;
            }
            else {
              __int16 v10 = 0;
            }
            id v48 = v10;
            id v50 = [v48 attributeDatabase];
            id v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v50, "count"));
            uint64_t v54 = 0;
            id v55 = &v54;
            uint64_t v56 = 0x3032000000;
            uint64_t v57 = __Block_byref_object_copy__18139;
            v58 = __Block_byref_object_dispose__18140;
            id v59 = 0;
            *(void *)long long buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __77__HAP2AccessoryServerController__handleAttributeDatabaseResponse_completion___block_invoke;
            v67 = &unk_1E69F2EF8;
            uint64_t v68 = v1;
            id v9 = v9;
            id v69 = v9;
            id v71 = &v54;
            id v52 = v11;
            id v70 = v52;
            [v50 enumerateKeysAndObjectsUsingBlock:buf];
            [v52 sortUsingComparator:&__block_literal_global_203];
            if (![v52 count]
              || ([v52 objectAtIndexedSubscript:0],
                  uint64_t v12 = objc_claimAutoreleasedReturnValue(),
                  char v13 = [v12 isPrimary],
                  v12,
                  (v13 & 1) == 0))
            {
              if (hap2LogInitialize_onceToken != -1) {
                dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
              }
              uint64_t v14 = hap2Log_accessory;
              if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v60 = 138412290;
                uint64_t v61 = v1;
                _os_log_error_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%@ Didn't find a primary accessory", v60, 0xCu);
              }
              if (!v55[5])
              {
                uint64_t v15 = [MEMORY[0x1E4F28C58] hapErrorWithCode:7];
                uint64_t v16 = (void *)v55[5];
                v55[5] = v15;
              }
            }
            if ((unint64_t)[v52 count] >= 2)
            {
              if (hap2LogInitialize_onceToken != -1) {
                dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
              }
              __int16 v17 = (id)hap2Log_accessory;
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                uint64_t v46 = [v52 count];
                *(_DWORD *)v60 = 138412546;
                uint64_t v61 = v1;
                __int16 v62 = 2048;
                uint64_t v63 = v46;
                _os_log_error_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%@ Accessory returned %lu accessories, only 1 supported at this time", v60, 0x16u);
              }

              if (!v55[5])
              {
                uint64_t v18 = [MEMORY[0x1E4F28C58] hapErrorWithCode:15];
                uint64_t v19 = (void *)v55[5];
                v55[5] = v18;
              }
            }
            id v20 = *(id *)(v1 + 64);
            id v21 = [v20 accessoryCache];

            if (v55[5])
            {
              if (v21)
              {
                if (hap2LogInitialize_onceToken != -1) {
                  dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
                }
                id v22 = hap2Log_accessory;
                if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v60 = 138412290;
                  uint64_t v61 = v1;
                  _os_log_error_impl(&dword_1D4758000, v22, OS_LOG_TYPE_ERROR, "%@ Invalidating accessory cache after error instantiating it and trying again", v60, 0xCu);
                }
                id v23 = *(id *)(v1 + 64);
                [v23 invalidateAccessoryCache];

                -[HAP2AccessoryServerController saveAccessoryCache](v1);
                [v9 clearAccessories];
                id v24 = (id)[(id)v1 readAttributeDatabaseWithCompletion:v4];
              }
              else
              {
                v4[2](v4, 0);
              }
            }
            else
            {
              id v47 = (void *)[v52 copy];
              if (hap2LogInitialize_onceToken != -1) {
                dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
              }
              uint64_t v34 = (id)hap2Log_accessory;
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                uint64_t v35 = [v47 count];
                uint64_t v36 = [v47 count];
                id v37 = "ies";
                *(_DWORD *)v60 = 138412802;
                uint64_t v61 = v1;
                if (v36 == 1) {
                  id v37 = "y";
                }
                __int16 v62 = 2048;
                uint64_t v63 = v35;
                __int16 v64 = 2080;
                char v65 = v37;
                _os_log_impl(&dword_1D4758000, v34, OS_LOG_TYPE_INFO, "%@ Found %lu accessor%s", v60, 0x20u);
              }

              if (!v21)
              {
                uint64_t v38 = *(void **)(v1 + 64);
                if (v38)
                {
                  id v39 = v38;
                  id v40 = [(id)v1 accessoryServer];
                  [(HAP2AccessoryServerAccessoryCache *)v39 updateWithMetadata:v40 discoveredAccessories:v47];
                }
                else
                {
                  unint64_t v43 = [HAP2AccessoryServerAccessoryCache alloc];
                  __int16 v44 = [(id)v1 accessoryServer];
                  id v45 = [(HAP2AccessoryServerAccessoryCache *)v43 initWithMetadata:v44 discoveredAccessories:v47 sleepInterval:0];

                  id v39 = v45;
                  id v40 = *(void **)(v1 + 64);
                  *(void *)(v1 + 64) = v39;
                }

                -[HAP2AccessoryServerController saveAccessoryCache](v1);
              }
              ((void (*)(void (**)(id, void), void *, void))v4[2])(v4, v47, 0);
            }
            _Block_object_dispose(&v54, 8);
          }
          else
          {
            if (hap2LogInitialize_onceToken != -1) {
              dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
            }
            __int16 v30 = hap2Log_accessory;
            if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              *(void *)&uint8_t buf[4] = v1;
              _os_log_error_impl(&dword_1D4758000, v30, OS_LOG_TYPE_ERROR, "%@ Accessory server is no longer paired", buf, 0xCu);
            }
            uint64_t v31 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
            ((void (*)(void (**)(id, void), void, void *))v4[2])(v4, 0, v31);
          }
LABEL_47:

          goto LABEL_48;
        }
      }
      else
      {
      }
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v26 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v1;
        _os_log_error_impl(&dword_1D4758000, v26, OS_LOG_TYPE_ERROR, "%@ Unexpected accessory type", buf, 0xCu);
      }
      id v9 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
      ((void (*)(void (**)(id, void), void, id))v4[2])(v4, 0, v9);
      goto LABEL_47;
    }
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      id v41 = v7;
      int v42 = [v3 error];
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v1;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v42;
      _os_log_error_impl(&dword_1D4758000, v41, OS_LOG_TYPE_ERROR, "%@ Failed to fetch attribute database: %@", buf, 0x16u);
    }
    if (*(unsigned char *)(v1 + 10))
    {
LABEL_40:
      *(unsigned char *)(v1 + 10) = 0;
      __int16 v25 = [v3 error];
      ((void (*)(void (**)(id, void), void, void *))v4[2])(v4, 0, v25);

LABEL_48:
      goto LABEL_49;
    }
    id v27 = [v3 error];
    id v28 = [v27 domain];
    if ([v28 isEqualToString:@"HAPErrorDomain"])
    {
      uint64_t v29 = [v3 error];
      if ([v29 code] == 9)
      {
LABEL_54:

        goto LABEL_40;
      }
      id v53 = [v3 error];
      if ([v53 code] == 15)
      {

        goto LABEL_54;
      }
      uint64_t v51 = [v3 error];
      BOOL v49 = [v51 code] == 2;

      if (v49) {
        goto LABEL_40;
      }
    }
    else
    {
    }
    *(unsigned char *)(v1 + 10) = 1;
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v32 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v1;
      _os_log_error_impl(&dword_1D4758000, v32, OS_LOG_TYPE_ERROR, "%@ Retrying attribute database read", buf, 0xCu);
    }
    id v33 = (id)[(id)v1 readAttributeDatabaseWithCompletion:v4];
    goto LABEL_48;
  }
LABEL_49:
}

void __69__HAP2AccessoryServerController_readAttributeDatabaseWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained cancelWithError:v3];
}

void __77__HAP2AccessoryServerController__handleAttributeDatabaseResponse_completion___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [v7 unsignedIntegerValue];
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    id v11 = *(void **)(v10 + 88);
  }
  else {
    id v11 = 0;
  }
  uint64_t v12 = [v11 accessoryWithAccessoryServer:*(void *)(a1 + 40) instanceID:v9 discoveredServices:v8];
  if (v12)
  {
    [*(id *)(a1 + 48) addObject:v12];
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    char v13 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      int v18 = 138412802;
      uint64_t v19 = v17;
      __int16 v20 = 2112;
      id v21 = v7;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_error_impl(&dword_1D4758000, v13, OS_LOG_TYPE_ERROR, "%@ Failed to validate accessory with instance id %@: %@", (uint8_t *)&v18, 0x20u);
    }
    uint64_t v14 = [MEMORY[0x1E4F28C58] hapErrorWithCode:7];
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    *a4 = 1;
  }
}

uint64_t __77__HAP2AccessoryServerController__handleAttributeDatabaseResponse_completion___block_invoke_200(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 instanceID];
  unint64_t v6 = [v4 instanceID];

  if (v5 < v6) {
    return -1;
  }
  else {
    return 1;
  }
}

- (void)dealloc
{
  transport = self->_transport;
  id v4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
  [(HAP2AccessoryServerSecureTransport *)transport closeWithError:v4 completion:&__block_literal_global_18321];

  v5.receiver = self;
  v5.super_class = (Class)HAP2AccessoryServerController;
  [(HAP2AccessoryServerController *)&v5 dealloc];
}

- (HAP2AccessoryServerController)initWithEncoding:(id)a3 secureTransport:(id)a4 operationQueue:(id)a5 accessoryFactory:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HAP2AccessoryServerController;
  uint64_t v15 = [(HAP2AccessoryServerController *)&v19 init];
  if (v15)
  {
    uint64_t v16 = +[HAP2PropertyLock lockWithName:@"HAP2AccessoryServerController.propertyLock"];
    propertyLock = v15->_propertyLock;
    v15->_propertyLock = (HAP2PropertyLock *)v16;

    objc_storeStrong((id *)&v15->_encoding, a3);
    objc_storeStrong((id *)&v15->_transport, a4);
    objc_storeStrong((id *)&v15->_operationQueue, a5);
    objc_storeStrong((id *)&v15->_accessoryFactory, a6);
    [v12 setDelegate:v15];
  }

  return v15;
}

- (HAP2AccessoryServerController)initWithEncoding:(id)a3 secureTransport:(id)a4 operationQueue:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_opt_new();
  id v12 = [(HAP2AccessoryServerController *)self initWithEncoding:v10 secureTransport:v9 operationQueue:v8 accessoryFactory:v11];

  return v12;
}

- (HAP2AccessoryServerController)init
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  objc_super v5 = NSStringFromSelector(a2);
  unint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (NSString)controllerIdentifier
{
  return (NSString *)@"thread";
}

+ (HAP2AccessoryServerController)new
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  objc_super v5 = NSStringFromSelector(a2);
  unint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

uint64_t __59__HAP2AccessoryServerController_isReadingAttributeDatabase__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (uint64_t)setReadingAttributeDatabase:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = *(void **)(result + 72);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __61__HAP2AccessoryServerController_setReadingAttributeDatabase___block_invoke;
    v3[3] = &unk_1E69F3DF8;
    void v3[4] = result;
    char v4 = a2;
    return [v2 performWritingBlock:v3];
  }
  return result;
}

uint64_t __61__HAP2AccessoryServerController_setReadingAttributeDatabase___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = *(unsigned char *)(result + 40);
  return result;
}

- (uint64_t)sessionNumber
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v5 = 0;
    unint64_t v6 = &v5;
    uint64_t v7 = 0x2020000000;
    uint64_t v8 = 0;
    id v2 = *(id *)(a1 + 72);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __46__HAP2AccessoryServerController_sessionNumber__block_invoke;
    v4[3] = &unk_1E69F44F0;
    void v4[4] = v1;
    v4[5] = &v5;
    [v2 performReadingBlock:v4];

    uint64_t v1 = v6[3];
    _Block_object_dispose(&v5, 8);
  }
  return v1;
}

uint64_t __46__HAP2AccessoryServerController_sessionNumber__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 48);
  return result;
}

- (uint64_t)currentAccessoryIPTryCount
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v5 = 0;
    unint64_t v6 = &v5;
    uint64_t v7 = 0x2020000000;
    uint64_t v8 = 0;
    id v2 = *(id *)(a1 + 72);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __59__HAP2AccessoryServerController_currentAccessoryIPTryCount__block_invoke;
    v4[3] = &unk_1E69F44F0;
    void v4[4] = v1;
    v4[5] = &v5;
    [v2 performReadingBlock:v4];

    uint64_t v1 = v6[3];
    _Block_object_dispose(&v5, 8);
  }
  return v1;
}

uint64_t __59__HAP2AccessoryServerController_currentAccessoryIPTryCount__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 56);
  return result;
}

- (uint64_t)setCurrentAccessoryIPTryCount:(uint64_t)result
{
  if (result)
  {
    id v2 = *(void **)(result + 72);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __63__HAP2AccessoryServerController_setCurrentAccessoryIPTryCount___block_invoke;
    v3[3] = &unk_1E69F3A58;
    void v3[4] = result;
    void v3[5] = a2;
    return [v2 performWritingBlock:v3];
  }
  return result;
}

uint64_t __63__HAP2AccessoryServerController_setCurrentAccessoryIPTryCount___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 56) = *(void *)(result + 40);
  return result;
}

void __68__HAP2AccessoryServerController_lookupAccessoryCacheWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__HAP2AccessoryServerController_lookupAccessoryCacheWithCompletion___block_invoke_2;
  v13[3] = &unk_1E69F32D8;
  id v7 = v5;
  uint64_t v8 = *(void *)(a1 + 32);
  id v14 = v7;
  uint64_t v15 = v8;
  id v9 = v6;
  id v16 = v9;
  id v18 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 40);
  id v10 = (void *)MEMORY[0x1D944E2D0](v13);
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    id v12 = *(void **)(v11 + 80);
  }
  else {
    id v12 = 0;
  }
  [v12 addConcurrentBlock:v10];
}

void __68__HAP2AccessoryServerController_lookupAccessoryCacheWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v2 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 32);
    id v49 = 0;
    id v5 = [v2 unarchivedObjectOfClass:v3 fromData:v4 error:&v49];
    id v6 = v49;
    if (v5)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      if (v7) {
        objc_storeStrong((id *)(v7 + 64), v5);
      }
      uint64_t v8 = [v5 peripheralInfo];
      id v9 = [v8 configNumber];
      id v10 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(*(id *)(a1 + 56), "configNumber"));
      char v11 = [v9 isEqualToNumber:v10];

      id v12 = &selRef_setPeripheralDisconnectionTimeout_;
      if ((v11 & 1) == 0)
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        id v13 = (void *)hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
        {
          uint64_t v14 = *(void *)(a1 + 40);
          uint64_t v15 = v13;
          id v16 = [v5 peripheralInfo];
          id v17 = [v16 configNumber];
          int v18 = [v17 unsignedIntValue];
          int v19 = [*(id *)(a1 + 56) configNumber];
          *(_DWORD *)long long buf = 138412802;
          uint64_t v51 = v14;
          id v12 = &selRef_setPeripheralDisconnectionTimeout_;
          __int16 v52 = 1024;
          *(_DWORD *)id v53 = v18;
          *(_WORD *)&v53[4] = 1024;
          *(_DWORD *)&v53[6] = v19;
          _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_INFO, "%@ Invalidating stored cache due to updated c# (%u -> %u)", buf, 0x18u);
        }
        [v5 invalidateAccessoryCache];
        __int16 v20 = [*(id *)(a1 + 40) accessoryServer];
        if ([v20 conformsToProtocol:v12[230]])
        {
          id v21 = [*(id *)(a1 + 40) accessoryServer];
        }
        else
        {
          id v21 = 0;
        }

        [v21 clearAccessories];
      }
      uint64_t v24 = [v5 peripheralInfo];
      unint64_t v25 = [v24 advertisedProtocolVersion];

      uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F65590]) initWithMajorVersion:v25 / 0xA minorVersion:v25 % 0xA updateVersion:0];
      id v27 = [*(id *)(a1 + 56) protocolVersion];
      char v28 = [v26 isEqualToVersion:v27];

      if ((v28 & 1) == 0)
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        uint64_t v29 = (void *)hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
        {
          uint64_t v30 = *(void *)(a1 + 40);
          uint64_t v31 = *(void **)(a1 + 56);
          uint64_t v32 = v29;
          id v33 = [v31 protocolVersion];
          *(_DWORD *)long long buf = 138412802;
          uint64_t v51 = v30;
          __int16 v52 = 2112;
          *(void *)id v53 = v26;
          *(_WORD *)&v53[8] = 2112;
          uint64_t v54 = v33;
          _os_log_impl(&dword_1D4758000, v32, OS_LOG_TYPE_INFO, "%@ Invalidating stored cache due to updated protocol version (%@ -> %@)", buf, 0x20u);
        }
        [v5 invalidateAccessoryCache];
        uint64_t v34 = [*(id *)(a1 + 40) accessoryServer];
        if ([v34 conformsToProtocol:v12[230]])
        {
          uint64_t v35 = [*(id *)(a1 + 40) accessoryServer];
        }
        else
        {
          uint64_t v35 = 0;
        }

        [v35 clearAccessories];
      }
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v36 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        uint64_t v37 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v51 = v37;
        _os_log_impl(&dword_1D4758000, v36, OS_LOG_TYPE_INFO, "%@ Found valid cache", buf, 0xCu);
      }
      uint64_t v38 = [v5 sleepInterval];

      if (v38)
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        id v39 = (void *)hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
        {
          uint64_t v40 = *(void *)(a1 + 40);
          id v41 = v39;
          int v42 = [v5 sleepInterval];
          *(_DWORD *)long long buf = 138412546;
          uint64_t v51 = v40;
          __int16 v52 = 2112;
          *(void *)id v53 = v42;
          _os_log_impl(&dword_1D4758000, v41, OS_LOG_TYPE_INFO, "%@ Found cached sleep interval: %@", buf, 0x16u);
        }
        unint64_t v43 = *(id **)(a1 + 40);
        __int16 v44 = [v5 sleepInterval];
        [v44 doubleValue];
        -[HAP2AccessoryServerController _updateMaxRequestTimeout:](v43, v45);
      }
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v23 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        uint64_t v48 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v51 = v48;
        __int16 v52 = 2112;
        *(void *)id v53 = v6;
        _os_log_error_impl(&dword_1D4758000, v23, OS_LOG_TYPE_ERROR, "%@ Unable to decode found accessory cache: %@", buf, 0x16u);
      }
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    __int16 v22 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v46 = *(void *)(a1 + 40);
      uint64_t v47 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v51 = v46;
      __int16 v52 = 2112;
      *(void *)id v53 = v47;
      _os_log_debug_impl(&dword_1D4758000, v22, OS_LOG_TYPE_DEBUG, "%@ No saved cache at all: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)openTransportWithResume:(void *)a3 completion:
{
  id v5 = a3;
  if (a1)
  {
    [a1[10] assertCurrentQueue];
    if (HAPIsHH2Enabled_onceToken != -1) {
      dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_12024);
    }
    if (HAPIsHH2Enabled_hh2Enabled == 1)
    {
      id v6 = [a1 accessoryServer];
      uint64_t v7 = [v6 delegate];
      [v7 initializeKeyBagIfNecessary];
    }
    if ((a2 & 1) == 0) {
      -[HAP2AccessoryServerController setCurrentAccessoryIPTryCount:]((uint64_t)a1, 1);
    }
    uint64_t v8 = -[HAP2AccessoryServerController sessionNumber]((uint64_t)a1);
    id v9 = [a1 transport];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__HAP2AccessoryServerController_openTransportWithResume_completion___block_invoke;
    v10[3] = &unk_1E69F3350;
    v10[4] = a1;
    uint64_t v12 = v8;
    id v11 = v5;
    [v9 openWithCompletion:v10];
  }
}

void __68__HAP2AccessoryServerController_openTransportWithResume_completion___block_invoke(void *a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  int v19 = __68__HAP2AccessoryServerController_openTransportWithResume_completion___block_invoke_2;
  __int16 v20 = &unk_1E69F3328;
  id v9 = v7;
  uint64_t v10 = a1[4];
  id v21 = v9;
  uint64_t v22 = v10;
  id v11 = v8;
  id v13 = (void *)a1[5];
  uint64_t v12 = a1[6];
  id v23 = v11;
  uint64_t v25 = v12;
  id v24 = v13;
  char v26 = a2;
  uint64_t v14 = (void *)MEMORY[0x1D944E2D0](&v17);
  uint64_t v15 = a1[4];
  if (v15) {
    id v16 = *(void **)(v15 + 80);
  }
  else {
    id v16 = 0;
  }
  objc_msgSend(v16, "addConcurrentBlock:", v14, v17, v18, v19, v20);
}

void __68__HAP2AccessoryServerController_openTransportWithResume_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v2 = [*(id *)(a1 + 40) accessoryServer];
    uint64_t v3 = [v2 delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = [*(id *)(a1 + 40) accessoryServer];
      id v6 = [v5 delegate];
      objc_msgSend(v6, "setSessionInfoWithNumIPsResolved:numIPsTried:numBonjourNames:", objc_msgSend(*(id *)(a1 + 32), "numIPAddresses"), objc_msgSend(*(id *)(a1 + 32), "numIPAddressesTried"), objc_msgSend(*(id *)(a1 + 32), "numBonjourNames"));
    }
  }
  if (*(void *)(a1 + 48)) {
    goto LABEL_5;
  }
  uint64_t v12 = *(void *)(a1 + 64);
  if (v12 != -[HAP2AccessoryServerController sessionNumber](*(void *)(a1 + 40)))
  {
    uint64_t v21 = *(void *)(a1 + 32);
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v22 = (void *)hap2Log_accessory;
    BOOL v23 = os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO);
    if (v21)
    {
      if (v23)
      {
        uint64_t v24 = *(void *)(a1 + 40);
        uint64_t v25 = v22;
        uint64_t v26 = -[HAP2AccessoryServerController currentAccessoryIPTryCount](v24);
        uint64_t v27 = [*(id *)(a1 + 32) numIPAddresses];
        uint64_t v28 = [*(id *)(a1 + 32) numIPAddressesTried];
        uint64_t v29 = [*(id *)(a1 + 32) numBonjourNames];
        *(_DWORD *)long long buf = 138413314;
        *(void *)&uint8_t buf[4] = v24;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v26;
        *(_WORD *)&buf[22] = 2048;
        double v45 = (void *)v27;
        *(_WORD *)uint64_t v46 = 2048;
        *(void *)&v46[2] = v28;
        *(_WORD *)&v46[10] = 2048;
        *(void *)&v46[12] = v29;
        _os_log_impl(&dword_1D4758000, v25, OS_LOG_TYPE_INFO, "%@ Open established a new session after trying %lu IP address(es) (total=%lu, tried=%lu with %lu names)", buf, 0x34u);
      }
    }
    else if (v23)
    {
      uint64_t v30 = *(void *)(a1 + 40);
      uint64_t v31 = v22;
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v30;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = -[HAP2AccessoryServerController currentAccessoryIPTryCount](v30);
      _os_log_impl(&dword_1D4758000, v31, OS_LOG_TYPE_INFO, "%@ Open established a new session after trying %lu IP address(es)", buf, 0x16u);
    }
    uint64_t v32 = [*(id *)(a1 + 40) accessoryServer];
    if ([v32 conformsToProtocol:&unk_1F2C8CD98])
    {
      id v33 = [*(id *)(a1 + 40) accessoryServer];
    }
    else
    {
      id v33 = 0;
    }

    mach_absolute_time();
    uint64_t v34 = UpTicksToMilliseconds();
    -[HAP2AccessoryServerController setSessionStartTime:](*(void *)(a1 + 40), v34);
    uint64_t v35 = *(void *)(a1 + 40);
    if (!v35) {
      goto LABEL_35;
    }
    uint64_t v40 = 0;
    id v41 = &v40;
    uint64_t v42 = 0x2020000000;
    char v43 = 0;
    id v36 = *(id *)(v35 + 72);
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __59__HAP2AccessoryServerController_isReadingAttributeDatabase__block_invoke;
    double v45 = &unk_1E69F44F0;
    *(void *)uint64_t v46 = v35;
    *(void *)&v46[8] = &v40;
    [v36 performReadingBlock:buf];

    LODWORD(v36) = *((unsigned __int8 *)v41 + 24);
    _Block_object_dispose(&v40, 8);
    if (v36)
    {
LABEL_36:
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

      return;
    }
    uint64_t v37 = *(id **)(a1 + 40);
    if (!v37)
    {
LABEL_35:
      [v33 handleReestablishedSession];
      goto LABEL_36;
    }
    [v37[10] assertCurrentQueue];
    uint64_t v38 = [v37 accessoryServer];
    if ([v38 conformsToProtocol:&unk_1F2C8CD98])
    {
      id v39 = [v37 accessoryServer];

      if (!v39 || ![v39 isPaired]) {
        goto LABEL_34;
      }
      uint64_t v38 = [v39 accessories];
      [v38 enumerateObjectsUsingBlock:&__block_literal_global_373];
    }
    else
    {
      id v39 = 0;
    }

LABEL_34:
    goto LABEL_35;
  }
  if (!*(void *)(a1 + 48))
  {
    id v13 = [*(id *)(a1 + 40) accessoryServer];
    uint64_t v14 = [v13 delegate];
    uint64_t v15 = [*(id *)(a1 + 40) accessoryServer];
    id v16 = [v15 deviceID];
    uint64_t v17 = [v16 deviceIDString];
    [v14 associateAccessoryWithControllerKeyUsingAccessoryIdentifier:v17];

    goto LABEL_12;
  }
LABEL_5:
  id v7 = [*(id *)(a1 + 40) accessoryServer];
  id v8 = [v7 delegate];
  int v9 = [v8 shouldRetryPVDueToAuthenticationError:*(void *)(a1 + 48)];

  if (v9)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 56);
    -[HAP2AccessoryServerController openTransportWithResume:completion:](v10, 0, v11);
    return;
  }
LABEL_12:
  uint64_t v18 = *(void *)(a1 + 40);
  uint64_t v19 = -[HAP2AccessoryServerController currentAccessoryIPTryCount](v18);
  -[HAP2AccessoryServerController setCurrentAccessoryIPTryCount:](v18, v19 + 1);
  __int16 v20 = *(void (**)(void))(*(void *)(a1 + 56) + 16);

  v20();
}

void __60__HAP2AccessoryServerController__handleReestablishedSession__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 services];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_375];
}

void __60__HAP2AccessoryServerController__handleReestablishedSession__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 characteristics];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_377];
}

uint64_t __60__HAP2AccessoryServerController__handleReestablishedSession__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setEventNotificationsEnabled:0];
}

@end