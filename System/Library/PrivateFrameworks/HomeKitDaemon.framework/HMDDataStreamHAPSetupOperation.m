@interface HMDDataStreamHAPSetupOperation
- (HMDDataStreamHAPSetupOperation)initWithAccessory:(id)a3 queue:(id)a4 logIdentifier:(id)a5 transferManagementService:(id)a6 maxControllerTransportMTU:(unint64_t)a7 setupOperationReadRequired:(BOOL)a8;
- (int64_t)sessionIdentifier;
- (unint64_t)maxControllerTransportMTU;
- (void)_readRequiredTransportCharacteristics;
- (void)processTransportSetupResponse:(id)a3;
- (void)setMaxControllerTransportMTU:(unint64_t)a3;
- (void)setSessionIdentifier:(int64_t)a3;
- (void)startSetup;
@end

@implementation HMDDataStreamHAPSetupOperation

- (void)setSessionIdentifier:(int64_t)a3
{
  self->_sessionIdentifier = a3;
}

- (int64_t)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (unint64_t)maxControllerTransportMTU
{
  return self->_maxControllerTransportMTU;
}

- (void)processTransportSetupResponse:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 parameters];
  v6 = [v5 sessionIdentifier];

  v7 = (void *)MEMORY[0x230FBD990]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v11 = HMFGetLogIdentifier();
      v12 = [v4 parameters];
      v13 = [v12 sessionIdentifier];
      int v29 = 138543618;
      v30 = v11;
      __int16 v31 = 2112;
      v32 = v13;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@[Start Stream] The setup transfer succeeded; will use session identifier %@",
        (uint8_t *)&v29,
        0x16u);
    }
    v14 = [v4 parameters];
    v15 = [v14 sessionIdentifier];
    v16 = [v15 value];
    -[HMDDataStreamHAPSetupOperation setSessionIdentifier:](v8, "setSessionIdentifier:", [v16 integerValue]);

    v17 = (void *)MEMORY[0x230FBD990]();
    v18 = v8;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = HMFGetLogIdentifier();
      int v29 = 138543362;
      v30 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@[Start Stream] DataStream configuration valid; starting stream",
        (uint8_t *)&v29,
        0xCu);
    }
    v21 = [HMDDataStreamHAPTransport alloc];
    v22 = [(HMDDataStreamSetupOperation *)v18 accessory];
    uint64_t v23 = [(HMDDataStreamHAPSetupOperation *)v18 sessionIdentifier];
    uint64_t v24 = [(HMDDataStreamHAPSetupOperation *)v18 maxControllerTransportMTU];
    v25 = [(HMDDataStreamSetupOperation *)v18 queue];
    v26 = [(HMDDataStreamSetupOperation *)v18 logIdentifier];
    v27 = [(HMDDataStreamHAPTransport *)v21 initWithAccessory:v22 sessionIdentifier:v23 maxControllerTransportMTU:v24 workQueue:v25 logIdentifier:v26];

    [(HMDDataStreamSetupOperation *)v18 postDidSucceedWithTransport:v27 sessionEncryption:0];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v28 = HMFGetLogIdentifier();
      int v29 = 138543362;
      v30 = v28;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Start Stream] The setup transfer write reply did not contain a session identifier", (uint8_t *)&v29, 0xCu);
    }
    v27 = [MEMORY[0x263F087E8] hmErrorWithCode:50];
    [(HMDDataStreamSetupOperation *)v8 postDidFailWithError:v27];
  }
}

- (void)startSetup
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v27 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Creating new DataStream using HAP", buf, 0xCu);
  }
  v7 = (void *)[objc_alloc(MEMORY[0x263F35960]) initWithValue:0];
  v8 = (void *)[objc_alloc(MEMORY[0x263F35970]) initWithValue:1];
  v9 = (void *)[objc_alloc(MEMORY[0x263F35978]) initWithCommand:v7 transportType:v8 controllerKeySalt:0];

  id v24 = 0;
  v10 = [v9 serializeWithError:&v24];
  id v11 = v24;
  if (v10)
  {
    v12 = [(HMDDataStreamSetupOperation *)v4 transferManagementService];
    v13 = [v12 findCharacteristicWithType:@"00000131-0000-1000-8000-0026BB765291"];

    v14 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v13 value:v10 authorizationData:0 identifier:0 type:0 includeResponseValue:1];
    objc_initWeak((id *)buf, v4);
    v15 = [(HMDDataStreamSetupOperation *)v4 accessory];
    v25 = v14;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
    v17 = [(HMDDataStreamSetupOperation *)v4 queue];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __44__HMDDataStreamHAPSetupOperation_startSetup__block_invoke;
    v22[3] = &unk_264A2E9A8;
    objc_copyWeak(&v23, (id *)buf);
    [v15 writeCharacteristicValues:v16 source:7 queue:v17 completionHandler:v22];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v18 = (void *)MEMORY[0x230FBD990]();
    v19 = v4;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v27 = v21;
      __int16 v28 = 2112;
      id v29 = v11;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to create new DataStream; cannot serialize request (%@)",
        buf,
        0x16u);
    }
    [(HMDDataStreamSetupOperation *)v19 postDidFailWithError:v11];
  }
}

void __44__HMDDataStreamHAPSetupOperation_startSetup__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained continueStreamSetupWithResponse:v5];
  }
}

- (void)_readRequiredTransportCharacteristics
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v3 = [(HMDDataStreamSetupOperation *)self transferManagementService];
  id v4 = [v3 findCharacteristicWithType:*MEMORY[0x263F0C588]];

  id v5 = [(HMDDataStreamSetupOperation *)self transferManagementService];
  v6 = [v5 findCharacteristicWithType:@"00000130-0000-1000-8000-0026BB765291"];

  if (v4) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    context = (void *)MEMORY[0x230FBD990]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      id v11 = [(HMDDataStreamSetupOperation *)v8 accessory];
      v12 = [v11 name];
      v13 = [(HMDDataStreamSetupOperation *)v8 accessory];
      v14 = [v13 uuid];
      v15 = [v14 UUIDString];
      *(_DWORD *)buf = 138543874;
      __int16 v28 = v10;
      __int16 v29 = 2112;
      uint64_t v30 = v12;
      __int16 v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@HDS characteristic(s) not found configuration/version (%@/%@)", buf, 0x20u);
    }
    v16 = [(HMDDataStreamSetupOperation *)v8 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__HMDDataStreamHAPSetupOperation__readRequiredTransportCharacteristics__block_invoke;
    block[3] = &unk_264A2F7F8;
    block[4] = v8;
    dispatch_async(v16, block);
  }
  else
  {
    v17 = +[HMDCharacteristicRequest requestWithCharacteristic:v4];
    v26[0] = v17;
    v18 = +[HMDCharacteristicRequest requestWithCharacteristic:v6];
    v26[1] = v18;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];

    objc_initWeak((id *)buf, self);
    v20 = [(HMDDataStreamSetupOperation *)self accessory];
    v21 = [(HMDDataStreamSetupOperation *)self queue];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __71__HMDDataStreamHAPSetupOperation__readRequiredTransportCharacteristics__block_invoke_2;
    v23[3] = &unk_264A2E9A8;
    objc_copyWeak(&v24, (id *)buf);
    [v20 readCharacteristicValues:v19 source:7 queue:v21 completionHandler:v23];

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
}

void __71__HMDDataStreamHAPSetupOperation__readRequiredTransportCharacteristics__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  if ([v4 conformsToProtocol:&unk_26E4FC4C8])
  {
    v2 = [*(id *)(a1 + 32) delegate];

    if (!v2) {
      return;
    }
    [v2 dataStreamInitializationSetupOperation:*(void *)(a1 + 32) didCompleteSupportReadWithStatus:0];
    v3 = v2;
  }
  else
  {
    v3 = v4;
  }
}

void __71__HMDDataStreamHAPSetupOperation__readRequiredTransportCharacteristics__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v7 = WeakRetained;
    id v5 = [WeakRetained delegate];
    if ([v5 conformsToProtocol:&unk_26E4FC4C8])
    {
      v6 = [v7 delegate];

      id v4 = v7;
      if (!v6) {
        goto LABEL_6;
      }
      [v6 dataStreamInitializationSetupOperation:v7 didCompleteSupportReadWithStatus:a2 != 0];
      id v5 = v6;
    }

    id v4 = v7;
  }
LABEL_6:
}

- (void)setMaxControllerTransportMTU:(unint64_t)a3
{
  if (!self->_maxControllerTransportMTU) {
    self->_maxControllerTransportMTU = a3;
  }
}

- (HMDDataStreamHAPSetupOperation)initWithAccessory:(id)a3 queue:(id)a4 logIdentifier:(id)a5 transferManagementService:(id)a6 maxControllerTransportMTU:(unint64_t)a7 setupOperationReadRequired:(BOOL)a8
{
  BOOL v8 = a8;
  v13.receiver = self;
  v13.super_class = (Class)HMDDataStreamHAPSetupOperation;
  v10 = [(HMDDataStreamSetupOperation *)&v13 initWithAccessory:a3 queue:a4 logIdentifier:a5 transferManagementService:a6];
  id v11 = v10;
  if (v10)
  {
    v10->_maxControllerTransportMTU = a7;
    if (v8) {
      [(HMDDataStreamHAPSetupOperation *)v10 _readRequiredTransportCharacteristics];
    }
  }
  return v11;
}

@end