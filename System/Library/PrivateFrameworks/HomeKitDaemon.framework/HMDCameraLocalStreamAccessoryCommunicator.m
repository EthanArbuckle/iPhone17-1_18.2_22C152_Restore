@interface HMDCameraLocalStreamAccessoryCommunicator
+ (id)logCategory;
- (HMDCameraLocalStreamAccessoryCommunicator)initWithWorkQueue:(id)a3 sessionID:(id)a4 accessory:(id)a5 streamManagementService:(id)a6;
- (HMDCameraStreamSessionID)sessionID;
- (HMDHAPAccessory)accessory;
- (HMDService)streamManagementService;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (void)_handleReadSupportedConfigurationsResponses:(id)a3 completion:(id)a4;
- (void)_handleSelectedStreamConfigurationWriteResponses:(id)a3 completion:(id)a4;
- (void)_handleSetupEndPointReadResponses:(id)a3 completion:(id)a4;
- (void)_handleSetupEndPointWriteResponses:(id)a3 completion:(id)a4;
- (void)_writeSelectedStreamConfigurationData:(id)a3 completion:(id)a4;
- (void)readSetupEndPointWithCompletion:(id)a3;
- (void)readSupportedConfigurationsWithCompletion:(id)a3;
- (void)setAccessory:(id)a3;
- (void)writeReselectedStreamConfiguration:(id)a3 completion:(id)a4;
- (void)writeSelectedStreamConfiguration:(id)a3 completion:(id)a4;
- (void)writeSetupEndPoint:(id)a3 completion:(id)a4;
@end

@implementation HMDCameraLocalStreamAccessoryCommunicator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamManagementService, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (HMDService)streamManagementService
{
  return (HMDService *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAccessory:(id)a3
{
}

- (HMDHAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (HMDCameraStreamSessionID)sessionID
{
  return (HMDCameraStreamSessionID *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDCameraLocalStreamAccessoryCommunicator *)self sessionID];
  v3 = [v2 description];

  return v3;
}

- (void)_handleSelectedStreamConfigurationWriteResponses:(id)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  v8 = [(HMDCameraLocalStreamAccessoryCommunicator *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    int v27 = 138543362;
    v28 = v12;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Received response for selected stream configuration write", (uint8_t *)&v27, 0xCu);
  }
  v13 = [v6 firstObject];
  v14 = v13;
  if (v13)
  {
    v15 = [v13 error];

    if (!v15)
    {
      v7[2](v7, 0);
      goto LABEL_13;
    }
    v16 = (void *)MEMORY[0x230FBD990]();
    v17 = v10;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      v20 = [v14 error];
      int v27 = 138543618;
      v28 = v19;
      __int16 v29 = 2114;
      v30 = v20;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to write selected stream configuration: the write reply ended in error response: %{public}@", (uint8_t *)&v27, 0x16u);
    }
    uint64_t v21 = [v14 error];
  }
  else
  {
    v22 = (void *)MEMORY[0x230FBD990]();
    v23 = v10;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = HMFGetLogIdentifier();
      int v27 = 138543362;
      v28 = v25;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to write selected stream configuration: the write reply did not contain any responses", (uint8_t *)&v27, 0xCu);
    }
    uint64_t v21 = [MEMORY[0x263F087E8] hmErrorWithCode:50];
  }
  v26 = (void *)v21;
  v7[2](v7, v21);

LABEL_13:
}

- (void)_writeSelectedStreamConfigurationData:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDCameraLocalStreamAccessoryCommunicator *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = [(HMDCameraLocalStreamAccessoryCommunicator *)self accessory];
  if (v9)
  {
    v10 = [(HMDCameraLocalStreamAccessoryCommunicator *)self streamManagementService];
    v11 = [v10 findCharacteristicWithType:*MEMORY[0x263F35558]];

    v12 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v11 value:v6 authorizationData:0 type:0];
    uint64_t v21 = v12;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
    v14 = [(HMDCameraLocalStreamAccessoryCommunicator *)self workQueue];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __94__HMDCameraLocalStreamAccessoryCommunicator__writeSelectedStreamConfigurationData_completion___block_invoke;
    v19[3] = &unk_264A290E0;
    v19[4] = self;
    id v20 = v7;
    [v9 writeCharacteristicValues:v13 source:7 queue:v14 completionHandler:v19];
  }
  else
  {
    v15 = (void *)MEMORY[0x230FBD990]();
    v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v23 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to write selected stream configuration: accessory reference is nil", buf, 0xCu);
    }
    v11 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1011];
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

uint64_t __94__HMDCameraLocalStreamAccessoryCommunicator__writeSelectedStreamConfigurationData_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleSelectedStreamConfigurationWriteResponses:a2 completion:*(void *)(a1 + 40)];
}

- (void)_handleSetupEndPointReadResponses:(id)a3 completion:(id)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  v8 = [(HMDCameraLocalStreamAccessoryCommunicator *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  v41 = v10;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v49 = v12;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Received response for setup endpoint read", buf, 0xCu);
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v44 objects:v52 count:16];
  id obj = v13;
  if (v14)
  {
    uint64_t v15 = v14;
    v40 = v7;
    v43 = 0;
    uint64_t v16 = *(void *)v45;
    uint64_t v17 = *MEMORY[0x263F35560];
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v45 != v16) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        id v20 = objc_msgSend(v19, "value", v40);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v21 = v20;
        }
        else {
          uint64_t v21 = 0;
        }
        id v22 = v21;

        if (v22)
        {
          v23 = [v19 request];
          uint64_t v24 = [v23 characteristic];
          v25 = [v24 type];
          int v26 = [v25 isEqualToString:v17];

          if (v26)
          {
            id v27 = v22;

            v43 = v20;
          }
        }
      }
      v28 = obj;
      uint64_t v15 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v15);

    id v7 = v40;
    __int16 v29 = v43;
    if (v43)
    {
      v30 = [(HAPTLVBase *)[HMDSetupEndPointRead alloc] initWithTLVData:v43];
      if (v30)
      {
        ((void (**)(id, HMDSetupEndPointRead *, void *))v40)[2](v40, v30, 0);
      }
      else
      {
        v35 = (void *)MEMORY[0x230FBD990]();
        v36 = v41;
        v37 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v38 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v49 = v38;
          __int16 v50 = 2112;
          v51 = v43;
          _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to read setup endpoint: could not initialize setup endpoint from TLV data: %@", buf, 0x16u);
        }
        v39 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1042];
        v40[2](v40, 0, v39);
      }
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v31 = (void *)MEMORY[0x230FBD990]();
  v32 = v41;
  v33 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    v34 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v49 = v34;
    _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to read setup endpoint: the reply does not contain the expected response", buf, 0xCu);
  }
  __int16 v29 = [MEMORY[0x263F087E8] hmErrorWithCode:50];
  v7[2](v7, 0, v29);
  v28 = obj;
LABEL_27:
}

- (void)_handleSetupEndPointWriteResponses:(id)a3 completion:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v37 = a4;
  id v7 = [(HMDCameraLocalStreamAccessoryCommunicator *)self workQueue];
  dispatch_assert_queue_V2(v7);

  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v43 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Received response for setup endpoint write", buf, 0xCu);
  }
  v36 = v9;

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v39;
    uint64_t v16 = *MEMORY[0x263F35560];
LABEL_5:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v39 != v15) {
        objc_enumerationMutation(v12);
      }
      v18 = *(void **)(*((void *)&v38 + 1) + 8 * v17);
      v19 = objc_msgSend(v18, "request", v36);
      id v20 = [v19 characteristic];
      uint64_t v21 = [v20 type];
      char v22 = [v21 isEqualToString:v16];

      if (v22) {
        break;
      }
      if (v14 == ++v17)
      {
        uint64_t v14 = [v12 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v14) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    id v23 = v18;

    if (!v23) {
      goto LABEL_17;
    }
    uint64_t v24 = [v23 error];

    v25 = v37;
    if (v24)
    {
      int v26 = (void *)MEMORY[0x230FBD990]();
      id v27 = v36;
      v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        __int16 v29 = HMFGetLogIdentifier();
        v30 = [v23 error];
        *(_DWORD *)buf = 138543618;
        v43 = v29;
        __int16 v44 = 2112;
        long long v45 = v30;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to write setup endpoint: %@", buf, 0x16u);
      }
      uint64_t v31 = [v23 error];
      (*((void (**)(id, void *))v37 + 2))(v37, v31);
    }
    else
    {
      (*((void (**)(id, void))v37 + 2))(v37, 0);
    }
  }
  else
  {
LABEL_11:

LABEL_17:
    v32 = (void *)MEMORY[0x230FBD990]();
    v33 = v36;
    v34 = HMFGetOSLogHandle();
    v25 = v37;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v43 = v35;
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to write setup endpoint: the reply does not contain the expected response", buf, 0xCu);
    }
    id v23 = [MEMORY[0x263F087E8] hmErrorWithCode:50];
    (*((void (**)(id, id))v37 + 2))(v37, v23);
  }
}

- (void)_handleReadSupportedConfigurationsResponses:(id)a3 completion:(id)a4
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v71 = a4;
  id v7 = [(HMDCameraLocalStreamAccessoryCommunicator *)self workQueue];
  dispatch_assert_queue_V2(v7);

  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v84 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Received response for supported configurations read", buf, 0xCu);
  }
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v79 objects:v87 count:16];
  if (!v13)
  {

    long long v38 = 0;
    uint64_t v15 = 0;
LABEL_29:
    v43 = (void *)MEMORY[0x230FBD990]();
    __int16 v44 = v9;
    long long v45 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      long long v46 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v84 = v46;
      _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_ERROR, "%{public}@Failed to read supported configurations: Supported configurations read response did not include supported video stream configuration", buf, 0xCu);
    }
    id v37 = [MEMORY[0x263F087E8] hmErrorWithCode:50];
    v42 = v71;
    (*((void (**)(id, void, void, void, HMDSupportedVideoStreamConfiguration *))v71 + 2))(v71, 0, 0, 0, v37);
    v36 = 0;
    goto LABEL_48;
  }
  uint64_t v14 = v13;
  v70 = v9;
  uint64_t v15 = 0;
  v74 = 0;
  v77 = 0;
  uint64_t v78 = *(void *)v80;
  uint64_t v76 = *MEMORY[0x263F35588];
  uint64_t v73 = *MEMORY[0x263F35578];
  uint64_t v72 = *MEMORY[0x263F35580];
  id obj = v12;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v80 != v78) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void **)(*((void *)&v79 + 1) + 8 * i);
      v18 = [v17 value];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v19 = v18;
      }
      else {
        v19 = 0;
      }
      id v20 = v19;

      if (v20)
      {
        uint64_t v21 = v15;
        char v22 = [v17 request];
        id v23 = [v22 characteristic];
        uint64_t v24 = [v23 type];
        char v25 = [v24 isEqualToString:v76];

        if (v25)
        {
          int v26 = v77;
          v77 = v18;
        }
        else
        {
          id v27 = [v17 request];
          v28 = [v27 characteristic];
          __int16 v29 = [v28 type];
          char v30 = [v29 isEqualToString:v73];

          if (v30)
          {
            int v26 = v74;
            v74 = v18;
          }
          else
          {
            uint64_t v31 = [v17 request];
            v32 = [v31 characteristic];
            v33 = [v32 type];
            int v34 = [v33 isEqualToString:v72];

            uint64_t v15 = v21;
            int v26 = v21;
            uint64_t v21 = v18;
            if (!v34) {
              goto LABEL_18;
            }
          }
        }
        id v35 = v20;

        uint64_t v15 = v21;
      }
LABEL_18:
    }
    id v12 = obj;
    uint64_t v14 = [obj countByEnumeratingWithState:&v79 objects:v87 count:16];
  }
  while (v14);

  v36 = v77;
  if (!v77)
  {
    long long v38 = v74;
    v9 = v70;
    goto LABEL_29;
  }
  id v37 = [(HAPTLVBase *)[HMDSupportedVideoStreamConfiguration alloc] initWithTLVData:v77];
  long long v38 = v74;
  if (!v37)
  {
    uint64_t v47 = (void *)MEMORY[0x230FBD990]();
    v48 = v70;
    v49 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      __int16 v50 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v84 = v50;
      __int16 v85 = 2112;
      v86 = v77;
      _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_ERROR, "%{public}@Failed to read supported configurations: Could not initialize video stream configuration from TLV data: %@", buf, 0x16u);
    }
    uint64_t v51 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1040];
    goto LABEL_38;
  }
  if (!v74)
  {
    v52 = (void *)MEMORY[0x230FBD990]();
    uint64_t v53 = v70;
    v54 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      v55 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v84 = v55;
      _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_ERROR, "%{public}@Failed to read supported configurations: Supported configurations read response did not include supported audio stream configuration", buf, 0xCu);
    }
    uint64_t v51 = [MEMORY[0x263F087E8] hmErrorWithCode:50];
LABEL_38:
    long long v39 = (HMDSupportedAudioStreamConfiguration *)v51;
    v42 = v71;
    (*((void (**)(id, void, void, void, uint64_t))v71 + 2))(v71, 0, 0, 0, v51);
    goto LABEL_47;
  }
  long long v39 = [(HAPTLVBase *)[HMDSupportedAudioStreamConfiguration alloc] initWithTLVData:v74];
  if (!v39)
  {
    v56 = (void *)MEMORY[0x230FBD990]();
    v57 = v70;
    v58 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      v59 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v84 = v59;
      __int16 v85 = 2112;
      v86 = v74;
      _os_log_impl(&dword_22F52A000, v58, OS_LOG_TYPE_ERROR, "%{public}@Failed to read supported configurations: Could not initialize audio stream configuration from TLV data: %@", buf, 0x16u);
    }
    uint64_t v60 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1040];
    goto LABEL_45;
  }
  if (!v15)
  {
    v61 = (void *)MEMORY[0x230FBD990]();
    v62 = v70;
    v63 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      v64 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v84 = v64;
      _os_log_impl(&dword_22F52A000, v63, OS_LOG_TYPE_ERROR, "%{public}@Failed to read supported configurations: Supported configurations read response did not include supported RTP configuration", buf, 0xCu);
    }
    uint64_t v60 = [MEMORY[0x263F087E8] hmErrorWithCode:50];
LABEL_45:
    long long v41 = (void *)v60;
    v42 = v71;
    (*((void (**)(id, void, void, void, uint64_t))v71 + 2))(v71, 0, 0, 0, v60);
    goto LABEL_46;
  }
  long long v40 = [(HAPTLVBase *)[HMDSupportedRTPConfiguration alloc] initWithTLVData:v15];
  if (v40)
  {
    long long v41 = v40;
    v42 = v71;
    (*((void (**)(id, HMDSupportedVideoStreamConfiguration *, HMDSupportedAudioStreamConfiguration *, HMDSupportedRTPConfiguration *, void))v71
     + 2))(v71, v37, v39, v40, 0);
  }
  else
  {
    v65 = (void *)MEMORY[0x230FBD990]();
    v66 = v70;
    v67 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      v68 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v84 = v68;
      __int16 v85 = 2112;
      v86 = v15;
      _os_log_impl(&dword_22F52A000, v67, OS_LOG_TYPE_ERROR, "%{public}@Failed to read supported configurations: Could not initialize RTP configuration from TLV data: %@", buf, 0x16u);
    }
    v69 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1040];
    v42 = v71;
    (*((void (**)(id, void, void, void, void *))v71 + 2))(v71, 0, 0, 0, v69);

    long long v41 = 0;
  }
LABEL_46:

LABEL_47:
  id v12 = obj;
LABEL_48:
}

- (void)writeReselectedStreamConfiguration:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDCameraLocalStreamAccessoryCommunicator *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v14 = 138543618;
    uint64_t v15 = v12;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Writing reselected stream configuration %@", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v13 = [v6 tlvData];
  [(HMDCameraLocalStreamAccessoryCommunicator *)v10 _writeSelectedStreamConfigurationData:v13 completion:v7];
}

- (void)writeSelectedStreamConfiguration:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDCameraLocalStreamAccessoryCommunicator *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v14 = 138543618;
    uint64_t v15 = v12;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Writing selected stream configuration: %@", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v13 = [v6 tlvData];
  [(HMDCameraLocalStreamAccessoryCommunicator *)v10 _writeSelectedStreamConfigurationData:v13 completion:v7];
}

- (void)readSetupEndPointWithCompletion:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCameraLocalStreamAccessoryCommunicator *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Reading setup endpoint", buf, 0xCu);
  }
  v10 = [(HMDCameraLocalStreamAccessoryCommunicator *)v7 accessory];
  if (v10)
  {
    v11 = [(HMDCameraLocalStreamAccessoryCommunicator *)v7 streamManagementService];
    id v12 = [v11 findCharacteristicWithType:*MEMORY[0x263F35560]];

    uint64_t v13 = +[HMDCharacteristicRequest requestWithCharacteristic:v12];
    char v22 = v13;
    int v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];

    uint64_t v15 = [(HMDCameraLocalStreamAccessoryCommunicator *)v7 workQueue];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __77__HMDCameraLocalStreamAccessoryCommunicator_readSetupEndPointWithCompletion___block_invoke;
    v20[3] = &unk_264A290E0;
    v20[4] = v7;
    id v21 = v4;
    [v10 readCharacteristicValues:v14 source:7 queue:v15 completionHandler:v20];
  }
  else
  {
    __int16 v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = v7;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to read setup endpoint: accessory reference is nil", buf, 0xCu);
    }
    id v12 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1011];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v12);
  }
}

uint64_t __77__HMDCameraLocalStreamAccessoryCommunicator_readSetupEndPointWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleSetupEndPointReadResponses:a2 completion:*(void *)(a1 + 40)];
}

- (void)writeSetupEndPoint:(id)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDCameraLocalStreamAccessoryCommunicator *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v28 = v12;
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Writing setup endpoint: %@", buf, 0x16u);
  }
  uint64_t v13 = [(HMDCameraLocalStreamAccessoryCommunicator *)v10 accessory];
  if (v13)
  {
    int v14 = [(HMDCameraLocalStreamAccessoryCommunicator *)v10 streamManagementService];
    uint64_t v15 = [v14 findCharacteristicWithType:*MEMORY[0x263F35560]];

    __int16 v16 = [v6 tlvData];
    id v17 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v15 value:v16 authorizationData:0 type:0];

    int v26 = v17;
    uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
    v19 = [(HMDCameraLocalStreamAccessoryCommunicator *)v10 workQueue];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __75__HMDCameraLocalStreamAccessoryCommunicator_writeSetupEndPoint_completion___block_invoke;
    v24[3] = &unk_264A290E0;
    v24[4] = v10;
    id v25 = v7;
    [v13 writeCharacteristicValues:v18 source:7 queue:v19 completionHandler:v24];
  }
  else
  {
    id v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = v10;
    char v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v28 = v23;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to write setup endpoint: accessory reference is nil", buf, 0xCu);
    }
    uint64_t v15 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1011];
    (*((void (**)(id, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __75__HMDCameraLocalStreamAccessoryCommunicator_writeSetupEndPoint_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleSetupEndPointWriteResponses:a2 completion:*(void *)(a1 + 40)];
}

- (void)readSupportedConfigurationsWithCompletion:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCameraLocalStreamAccessoryCommunicator *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v30 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Reading supported configurations", buf, 0xCu);
  }
  v10 = [(HMDCameraLocalStreamAccessoryCommunicator *)v7 accessory];
  if (v10)
  {
    v11 = [(HMDCameraLocalStreamAccessoryCommunicator *)v7 streamManagementService];
    id v12 = [v11 findCharacteristicWithType:*MEMORY[0x263F35588]];

    uint64_t v13 = [(HMDCameraLocalStreamAccessoryCommunicator *)v7 streamManagementService];
    int v14 = [v13 findCharacteristicWithType:*MEMORY[0x263F35578]];

    uint64_t v15 = [(HMDCameraLocalStreamAccessoryCommunicator *)v7 streamManagementService];
    __int16 v16 = [v15 findCharacteristicWithType:*MEMORY[0x263F35580]];

    id v17 = +[HMDCharacteristicRequest requestWithCharacteristic:v12];
    v28[0] = v17;
    uint64_t v18 = +[HMDCharacteristicRequest requestWithCharacteristic:v14];
    v28[1] = v18;
    v19 = +[HMDCharacteristicRequest requestWithCharacteristic:v16];
    v28[2] = v19;
    id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];

    id v21 = [(HMDCameraLocalStreamAccessoryCommunicator *)v7 workQueue];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __87__HMDCameraLocalStreamAccessoryCommunicator_readSupportedConfigurationsWithCompletion___block_invoke;
    v26[3] = &unk_264A290E0;
    v26[4] = v7;
    id v27 = v4;
    [v10 readCharacteristicValues:v20 source:7 queue:v21 completionHandler:v26];
  }
  else
  {
    char v22 = (void *)MEMORY[0x230FBD990]();
    id v23 = v7;
    uint64_t v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v30 = v25;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to read supported configurations: accessory reference is nil", buf, 0xCu);
    }
    id v12 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1011];
    (*((void (**)(id, void, void, void, void *))v4 + 2))(v4, 0, 0, 0, v12);
  }
}

uint64_t __87__HMDCameraLocalStreamAccessoryCommunicator_readSupportedConfigurationsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleReadSupportedConfigurationsResponses:a2 completion:*(void *)(a1 + 40)];
}

- (HMDCameraLocalStreamAccessoryCommunicator)initWithWorkQueue:(id)a3 sessionID:(id)a4 accessory:(id)a5 streamManagementService:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v13)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  uint64_t v15 = v14;
  if (!v14)
  {
LABEL_11:
    v19 = (void *)_HMFPreconditionFailure();
    return (HMDCameraLocalStreamAccessoryCommunicator *)+[HMDCameraLocalStreamAccessoryCommunicator logCategory];
  }
  v21.receiver = self;
  v21.super_class = (Class)HMDCameraLocalStreamAccessoryCommunicator;
  __int16 v16 = [(HMDCameraLocalStreamAccessoryCommunicator *)&v21 init];
  id v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_workQueue, a3);
    objc_storeStrong((id *)&v17->_sessionID, a4);
    objc_storeWeak((id *)&v17->_accessory, v13);
    objc_storeStrong((id *)&v17->_streamManagementService, a6);
  }

  return v17;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t27_100835 != -1) {
    dispatch_once(&logCategory__hmf_once_t27_100835, &__block_literal_global_100836);
  }
  v2 = (void *)logCategory__hmf_once_v28_100837;
  return v2;
}

void __56__HMDCameraLocalStreamAccessoryCommunicator_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v28_100837;
  logCategory__hmf_once_v28_100837 = v0;
}

@end