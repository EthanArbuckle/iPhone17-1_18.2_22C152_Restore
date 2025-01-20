@interface HMAccessorySetupCoordinator
+ (BOOL)isCHIPSetupPayloadURL:(id)a3;
+ (BOOL)isHAPSetupPayloadURL:(id)a3;
+ (BOOL)isSetupPayloadURL:(id)a3;
+ (BOOL)isSetupPayloadURLString:(id)a3;
+ (NSUUID)UUID;
+ (id)communicationProtocolForSetupPayloadURLString:(id)a3;
+ (id)logCategory;
+ (id)setupPayloadURLFromSetupPayloadURLString:(id)a3;
- (HMAccessorySetupCoordinator)init;
- (HMAccessorySetupCoordinator)initWithContext:(id)a3;
- (NSUUID)messageTargetUUID;
- (void)_createCHIPSetupAccessoryPayloadWithMessagePayload:(void *)a3 activity:(void *)a4 completionHandler:;
- (void)cancelStagedCHIPAccessoryPairingWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)cancelStagingForStagingRequestUUID:(id)a3 completionHandler:(id)a4;
- (void)configure;
- (void)confirmDeviceCredentialForStagingRequestUUID:(id)a3;
- (void)createCHIPSetupPayloadStringForStagedPairingWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)createSetupAccessoryPayloadWithCHIPDecimalStringRepresentation:(id)a3 completionHandler:(id)a4;
- (void)createSetupAccessoryPayloadWithSetupPayloadURL:(id)a3 completionHandler:(id)a4;
- (void)createSetupAccessoryPayloadWithSetupPayloadURLString:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)handleMultiStepStageResponseError:(void *)a3 payload:(void *)a4 activity:;
- (void)handleUpdateStagingProgressMessage:(id)a3;
- (void)rejectDeviceCredentialForStagingRequestUUID:(id)a3;
- (void)selectThreadNetworkAssociation:(id)a3 forStagingRequestUUID:(id)a4;
- (void)selectWiFiNetworkAssociation:(id)a3 forStagingRequestUUID:(id)a4;
- (void)stageCHIPAccessoryPairingInStepsWithPayload:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (void)stageCHIPAccessoryPairingInStepsWithPayload:(id)a3 delegate:(id)a4 scanningNetworks:(BOOL)a5 completionHandler:(id)a6;
@end

@implementation HMAccessorySetupCoordinator

- (HMAccessorySetupCoordinator)init
{
  v3 = [(HMXPCMessageTransportConfiguration *)[HMMutableXPCMessageTransportConfiguration alloc] initWithMachServiceName:@"com.apple.homed.xpc.accessory-setup"];
  HMDispatchQueueNameString(self, 0);
  id v4 = objc_claimAutoreleasedReturnValue();
  v5 = (const char *)[v4 UTF8String];
  v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v7 = dispatch_queue_create(v5, v6);
  [(HMXPCMessageTransportConfiguration *)v3 setQueue:v7];

  [(HMXPCMessageTransportConfiguration *)v3 setRequiresHomeDataAccess:0];
  v8 = [[_HMContext alloc] initWithXPCClientConfiguration:v3];
  v9 = [(HMAccessorySetupCoordinator *)self initWithContext:v8];

  return v9;
}

- (HMAccessorySetupCoordinator)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMAccessorySetupCoordinator;
  v6 = [(HMAccessorySetupCoordinator *)&v9 init];
  dispatch_queue_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (void)configure
{
  if (self)
  {
    objc_msgSend(objc_getProperty(self, a2, 8, 1), "messageDispatcher");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v3 registerForMessage:@"HMASC.m.updateStagingProgress" receiver:self selector:sel_handleUpdateStagingProgressMessage_];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiStepStageDelegate, 0);
  objc_storeStrong(&self->_multiStepStageCompletionHandler, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (NSUUID)messageTargetUUID
{
  v2 = objc_opt_class();

  return (NSUUID *)[v2 UUID];
}

- (void)handleUpdateStagingProgressMessage:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 messagePayload];
  v6 = objc_msgSend(v5, "hmf_UUIDForKey:", @"HMASC.mk.stagingRequestUUID");

  dispatch_queue_t v7 = [v4 messagePayload];
  v8 = objc_msgSend(v7, "hmf_numberForKey:", @"HMASC.mk.setupAccessoryProgress");

  if (v6 && v8)
  {
    unint64_t v9 = [v8 unsignedIntegerValue];
    v10 = (void *)MEMORY[0x19F3A64A0]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      v14 = HMSetupAccessoryProgressAsString(v9);
      *(_DWORD *)buf = 138543874;
      v27 = v13;
      __int16 v28 = 2112;
      v29 = v14;
      __int16 v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdateProgress with '%@' for staging request %@", buf, 0x20u);
    }
    if (v11) {
      objc_getProperty(v11, v15, 24, 1);
    }
    if (objc_opt_respondsToSelector())
    {
      if (v11) {
        id Property = objc_getProperty(v11, v16, 8, 1);
      }
      else {
        id Property = 0;
      }
      v18 = [Property delegateCaller];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __66__HMAccessorySetupCoordinator_handleUpdateStagingProgressMessage___block_invoke;
      v23[3] = &unk_1E5945160;
      v23[4] = v11;
      unint64_t v25 = v9;
      id v24 = v6;
      [v18 invokeBlock:v23];
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x19F3A64A0]();
    v20 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v27 = v22;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Ignoring Update Staging Progress message without required parameters", buf, 0xCu);
    }
  }
}

uint64_t __66__HMAccessorySetupCoordinator_handleUpdateStagingProgressMessage___block_invoke(void *a1, const char *a2)
{
  id Property = (id)a1[4];
  if (Property) {
    id Property = objc_getProperty(Property, a2, 24, 1);
  }
  uint64_t v5 = a1[5];
  uint64_t v4 = a1[6];

  return [Property didUpdateProgress:v4 forStagingRequestUUID:v5];
}

- (void)cancelStagedCHIPAccessoryPairingWithIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (!v10)
  {
    _HMFPreconditionFailure();
LABEL_8:
    id Property = 0;
    goto LABEL_6;
  }
  v12 = v11;
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Cancel staged CHIP accessory pairing"];
  v14 = (void *)MEMORY[0x19F3A64A0]();
  v15 = self;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = HMFGetLogIdentifier();
    v18 = [v13 identifier];
    v19 = [v18 shortDescription];
    *(_DWORD *)buf = 138543874;
    v31 = v17;
    __int16 v32 = 2114;
    v33 = v19;
    __int16 v34 = 2112;
    id v35 = v10;
    _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Canceling staged CHIP accessory pairing with identifier: %@", buf, 0x20u);
  }
  id v20 = objc_alloc(MEMORY[0x1E4F65488]);
  v21 = [(id)objc_opt_class() UUID];
  uint64_t v5 = (void *)[v20 initWithTarget:v21];

  __int16 v28 = @"HMASC.mk.chipAccessoryPairingIdentifier";
  id v29 = v10;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  dispatch_queue_t v7 = [MEMORY[0x1E4F654B0] messageWithName:@"HMASC.m.cancelStagedCHIPAccessoryPairing" destination:v5 payload:v6];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __96__HMAccessorySetupCoordinator_cancelStagedCHIPAccessoryPairingWithIdentifier_completionHandler___block_invoke;
  v25[3] = &unk_1E5945510;
  v25[4] = v15;
  id v26 = v13;
  id v27 = v12;
  a4 = v12;
  id v4 = v13;
  [v7 setResponseHandler:v25];
  if (!v15) {
    goto LABEL_8;
  }
  id Property = objc_getProperty(v15, v22, 8, 1);
LABEL_6:
  id v24 = [Property messageDispatcher];
  [v24 sendMessage:v7];
}

void __96__HMAccessorySetupCoordinator_cancelStagedCHIPAccessoryPairingWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_queue_t v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  unint64_t v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    id v11 = HMFGetLogIdentifier();
    v12 = [*(id *)(a1 + 40) identifier];
    v13 = [v12 shortDescription];
    *(_DWORD *)v21 = 138543874;
    *(void *)&v21[4] = v11;
    *(_WORD *)&v21[12] = 2114;
    *(void *)&v21[14] = v13;
    *(_WORD *)&v21[22] = 2112;
    id v22 = v5;
    v14 = "%{public}@[%{public}@] Failed to cancel CHIP accessory pairing: %@";
    v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    uint32_t v17 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    id v11 = HMFGetLogIdentifier();
    v12 = [*(id *)(a1 + 40) identifier];
    v13 = [v12 shortDescription];
    *(_DWORD *)v21 = 138543618;
    *(void *)&v21[4] = v11;
    *(_WORD *)&v21[12] = 2114;
    *(void *)&v21[14] = v13;
    v14 = "%{public}@[%{public}@] Successfully canceled CHIP accessory pairing";
    v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    uint32_t v17 = 22;
  }
  _os_log_impl(&dword_19D1A8000, v15, v16, v14, v21, v17);

LABEL_7:
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v18, 8, 1);
  }
  id v20 = objc_msgSend(Property, "delegateCaller", *(_OWORD *)v21, *(void *)&v21[16], v22);
  [v20 callCompletion:*(void *)(a1 + 48) error:v5];
}

- (void)createCHIPSetupPayloadStringForStagedPairingWithIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  a4 = v11;
  if (!v11)
  {
LABEL_9:
    _HMFPreconditionFailure();
LABEL_10:
    id Property = 0;
    goto LABEL_7;
  }
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Create CHIP setup code"];
  v13 = (void *)MEMORY[0x19F3A64A0]();
  v14 = self;
  v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    os_log_type_t v16 = HMFGetLogIdentifier();
    uint32_t v17 = [v12 identifier];
    v18 = [v17 shortDescription];
    *(_DWORD *)buf = 138543874;
    __int16 v30 = v16;
    __int16 v31 = 2114;
    __int16 v32 = v18;
    __int16 v33 = 2112;
    id v34 = v10;
    _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Creating CHIP setup payload string for staged accessory pairing with identifier: %@", buf, 0x20u);
  }
  id v19 = objc_alloc(MEMORY[0x1E4F65488]);
  id v20 = [(id)objc_opt_class() UUID];
  id v5 = (void *)[v19 initWithTarget:v20];

  id v27 = @"HMASC.mk.chipAccessoryPairingIdentifier";
  id v28 = v10;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  dispatch_queue_t v7 = [MEMORY[0x1E4F654B0] messageWithName:@"HMASC.m.createCHIPSetupPayloadString" destination:v5 payload:v6];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __108__HMAccessorySetupCoordinator_createCHIPSetupPayloadStringForStagedPairingWithIdentifier_completionHandler___block_invoke;
  v24[3] = &unk_1E5945510;
  v24[4] = v14;
  id v25 = v12;
  id v26 = a4;
  a4 = a4;
  id v4 = v12;
  [v7 setResponseHandler:v24];
  if (!v14) {
    goto LABEL_10;
  }
  id Property = objc_getProperty(v14, v21, 8, 1);
LABEL_7:
  uint64_t v23 = [Property messageDispatcher];
  [v23 sendMessage:v7];
}

void __108__HMAccessorySetupCoordinator_createCHIPSetupPayloadStringForStagedPairingWithIdentifier_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_queue_t v7 = objc_msgSend(v6, "hmf_stringForKey:", @"HMASC.mk.setupPayloadString");
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = a1[4];
  id v10 = HMFGetOSLogHandle();
  id v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      v13 = [a1[5] identifier];
      v14 = [v13 shortDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v36 = v12;
      __int16 v37 = 2114;
      v38 = v14;
      __int16 v39 = 2112;
      id v40 = v7;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully created CHIP setup payload string: %@", buf, 0x20u);
    }
    id Property = a1[4];
    if (Property) {
      id Property = objc_getProperty(Property, v15, 8, 1);
    }
    uint32_t v17 = [Property delegateCaller];
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    id v28 = __108__HMAccessorySetupCoordinator_createCHIPSetupPayloadStringForStagedPairingWithIdentifier_completionHandler___block_invoke_137;
    id v29 = &unk_1E59454E8;
    v18 = &v31;
    id v31 = a1[6];
    id v19 = &v30;
    id v30 = v7;
    id v20 = &v26;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      id v22 = [a1[5] identifier];
      uint64_t v23 = [v22 shortDescription];
      *(_DWORD *)buf = 138544130;
      uint64_t v36 = v21;
      __int16 v37 = 2114;
      v38 = v23;
      __int16 v39 = 2112;
      id v40 = v6;
      __int16 v41 = 2112;
      id v42 = v5;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Could not find CHIP setup payload string in response payload %@: %@", buf, 0x2Au);
    }
    id v25 = a1[4];
    if (v25) {
      id v25 = objc_getProperty(v25, v24, 8, 1);
    }
    uint32_t v17 = [v25 delegateCaller];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __108__HMAccessorySetupCoordinator_createCHIPSetupPayloadStringForStagedPairingWithIdentifier_completionHandler___block_invoke_136;
    v32[3] = &unk_1E59454E8;
    v18 = &v34;
    id v34 = a1[6];
    id v19 = &v33;
    id v33 = v5;
    id v20 = v32;
  }
  objc_msgSend(v17, "invokeBlock:", v20, v26, v27, v28, v29, v30);
}

uint64_t __108__HMAccessorySetupCoordinator_createCHIPSetupPayloadStringForStagedPairingWithIdentifier_completionHandler___block_invoke_136(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __108__HMAccessorySetupCoordinator_createCHIPSetupPayloadStringForStagedPairingWithIdentifier_completionHandler___block_invoke_137(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)cancelStagingForStagingRequestUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (!v10)
  {
    _HMFPreconditionFailure();
LABEL_8:
    id Property = 0;
    goto LABEL_6;
  }
  v12 = v11;
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Cancel staging"];
  v14 = (void *)MEMORY[0x19F3A64A0]();
  v15 = self;
  os_log_type_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint32_t v17 = HMFGetLogIdentifier();
    v18 = [v13 identifier];
    id v19 = [v18 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v31 = v17;
    __int16 v32 = 2114;
    id v33 = v19;
    __int16 v34 = 2112;
    id v35 = v10;
    _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Cancelling staging with request UUID: %@", buf, 0x20u);
  }
  id v20 = objc_alloc(MEMORY[0x1E4F65488]);
  v21 = [(id)objc_opt_class() UUID];
  id v5 = (void *)[v20 initWithTarget:v21];

  id v28 = @"HMASC.mk.stagingRequestUUID";
  id v29 = v10;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  dispatch_queue_t v7 = [MEMORY[0x1E4F654B0] messageWithName:@"HMASC.m.cancelStaging" destination:v5 payload:v6];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __84__HMAccessorySetupCoordinator_cancelStagingForStagingRequestUUID_completionHandler___block_invoke;
  v25[3] = &unk_1E5945510;
  v25[4] = v15;
  id v26 = v13;
  id v27 = v12;
  a4 = v12;
  id v4 = v13;
  [v7 setResponseHandler:v25];
  if (!v15) {
    goto LABEL_8;
  }
  id Property = objc_getProperty(v15, v22, 8, 1);
LABEL_6:
  id v24 = [Property messageDispatcher];
  [v24 sendMessage:v7];
}

void __84__HMAccessorySetupCoordinator_cancelStagingForStagingRequestUUID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_queue_t v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    id v11 = HMFGetLogIdentifier();
    v12 = [*(id *)(a1 + 40) identifier];
    v13 = [v12 shortDescription];
    *(_DWORD *)v21 = 138543874;
    *(void *)&v21[4] = v11;
    *(_WORD *)&v21[12] = 2114;
    *(void *)&v21[14] = v13;
    *(_WORD *)&v21[22] = 2112;
    id v22 = v5;
    v14 = "%{public}@[%{public}@] Failed to cancel staging: %@";
    v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    uint32_t v17 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    id v11 = HMFGetLogIdentifier();
    v12 = [*(id *)(a1 + 40) identifier];
    v13 = [v12 shortDescription];
    *(_DWORD *)v21 = 138543618;
    *(void *)&v21[4] = v11;
    *(_WORD *)&v21[12] = 2114;
    *(void *)&v21[14] = v13;
    v14 = "%{public}@[%{public}@] Successfully cancelled staging";
    v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    uint32_t v17 = 22;
  }
  _os_log_impl(&dword_19D1A8000, v15, v16, v14, v21, v17);

LABEL_7:
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v18, 8, 1);
  }
  id v20 = objc_msgSend(Property, "delegateCaller", *(_OWORD *)v21, *(void *)&v21[16], v22);
  [v20 callCompletion:*(void *)(a1 + 48) error:v5];
}

- (void)selectWiFiNetworkAssociation:(id)a3 forStagingRequestUUID:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    _HMFPreconditionFailure();
  }
  id v8 = v7;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Select WiFi network association"];
  id v10 = (void *)MEMORY[0x19F3A64A0]();
  id v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = HMFGetLogIdentifier();
    v14 = [v9 identifier];
    v15 = [v14 shortDescription];
    *(_DWORD *)buf = 138544130;
    id v42 = v13;
    __int16 v43 = 2114;
    v44 = v15;
    __int16 v45 = 2112;
    id v46 = v6;
    __int16 v47 = 2112;
    v48 = v8;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Selecting WiFi network association %@ for request UUID: %@", buf, 0x2Au);
  }
  if (!v6)
  {
    id v16 = 0;
    goto LABEL_8;
  }
  id v40 = 0;
  id v16 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v40];
  id v17 = v40;
  v18 = v17;
  if (v16)
  {

LABEL_8:
    id v19 = objc_alloc(MEMORY[0x1E4F65488]);
    id v20 = [(id)objc_opt_class() UUID];
    v21 = (void *)[v19 initWithTarget:v20];

    id v22 = [MEMORY[0x1E4F1CA60] dictionary];
    [v22 setObject:v8 forKeyedSubscript:@"HMASC.mk.stagingRequestUUID"];
    [v22 setObject:v16 forKeyedSubscript:@"HMASC.mk.wifiNetworkAssociation"];
    uint64_t v23 = [MEMORY[0x1E4F654B0] messageWithName:@"HMASC.m.selectWiFiNetworkAssociation" destination:v21 payload:v22];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __82__HMAccessorySetupCoordinator_selectWiFiNetworkAssociation_forStagingRequestUUID___block_invoke_2;
    v36[3] = &unk_1E59455E8;
    v36[4] = v11;
    id v37 = v9;
    [v23 setResponseHandler:v36];
    if (v11) {
      id Property = objc_getProperty(v11, v24, 8, 1);
    }
    else {
      id Property = 0;
    }
    id v26 = [Property messageDispatcher];
    [v26 sendMessage:v23];

    goto LABEL_16;
  }
  id v27 = (void *)MEMORY[0x19F3A64A0]();
  id v28 = v11;
  id v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    id v30 = HMFGetLogIdentifier();
    id v31 = [v9 identifier];
    __int16 v32 = [v31 shortDescription];
    *(_DWORD *)buf = 138544130;
    id v42 = v30;
    __int16 v43 = 2114;
    v44 = v32;
    __int16 v45 = 2112;
    id v46 = v6;
    __int16 v47 = 2112;
    v48 = v18;
    _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to encode WiFi network association %@: %@", buf, 0x2Au);
  }
  if (v28) {
    id v34 = objc_getProperty(v28, v33, 8, 1);
  }
  else {
    id v34 = 0;
  }
  id v35 = [v34 delegateCaller];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __82__HMAccessorySetupCoordinator_selectWiFiNetworkAssociation_forStagingRequestUUID___block_invoke;
  v38[3] = &unk_1E5945628;
  v38[4] = v28;
  id v39 = v18;
  id v16 = v18;
  [v35 invokeBlock:v38];

LABEL_16:
}

uint64_t __82__HMAccessorySetupCoordinator_selectWiFiNetworkAssociation_forStagingRequestUUID___block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(void **)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 16, 1);
  }
  id v3 = (uint64_t (*)(void))Property[2];

  return v3();
}

void __82__HMAccessorySetupCoordinator_selectWiFiNetworkAssociation_forStagingRequestUUID___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
}

- (void)handleMultiStepStageResponseError:(void *)a3 payload:(void *)a4 activity:
{
  v91[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v56 = objc_msgSend(v8, "hmf_UUIDForKey:", @"HMASC.mk.stagingRequestUUID");
    v91[0] = NSClassFromString(&cfstr_Mtsdevicecrede.isa);
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:1];
    uint64_t v11 = objc_msgSend(v8, "hmf_unarchivedObjectForKey:ofClasses:", @"HMASC.mk.deviceCredential", v10);

    v90[0] = objc_opt_class();
    v90[1] = NSClassFromString(&cfstr_Mtswifiscanres.isa);
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:2];
    uint64_t v13 = objc_msgSend(v8, "hmf_unarchivedObjectForKey:ofClasses:", @"HMASC.mk.wifiScanResults", v12);

    v89[0] = objc_opt_class();
    v89[1] = NSClassFromString(&cfstr_Mtsthreadscanr.isa);
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:2];
    v15 = objc_msgSend(v8, "hmf_unarchivedObjectForKey:ofClasses:", @"HMASC.mk.threadScanResults", v14);

    id v16 = objc_msgSend(v8, "hmf_stringForKey:", @"HMASC.mk.chipAccessoryPairingIdentifier");
    v53 = objc_msgSend(v8, "hmf_UUIDForKey:", @"HMASC.mk.devicePairingUUID");
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = a1;
    id v19 = HMFGetOSLogHandle();
    id v20 = v19;
    v54 = (void *)v13;
    v55 = (void *)v11;
    if (v11 || v13 || v15 || v16)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        uint64_t v36 = v52 = v7;
        id v37 = [v9 identifier];
        [v37 shortDescription];
        v38 = v16;
        v40 = id v39 = v15;
        *(_DWORD *)buf = 138545154;
        v74 = v36;
        __int16 v75 = 2114;
        v76 = v40;
        __int16 v77 = 2112;
        v78 = v56;
        __int16 v79 = 2112;
        v80 = v55;
        __int16 v81 = 2112;
        v82 = v54;
        __int16 v83 = 2112;
        v84 = v39;
        __int16 v85 = 2112;
        v86 = v38;
        __int16 v87 = 2112;
        v88 = v53;
        _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully completed a step in staged CHIP accessory pairing with response staging request UUID: %@, device credential: %@, WiFi scan results: %@, Thread scan results: %@, pairing identifier: %@, device pairing UUID: %@", buf, 0x52u);

        v15 = v39;
        id v16 = v38;

        id v7 = v52;
      }

      if (v55)
      {
        id v42 = objc_msgSend(objc_getProperty(v18, v41, 8, 1), "delegateCaller");
        v67[0] = MEMORY[0x1E4F143A8];
        v67[1] = 3221225472;
        v67[2] = __82__HMAccessorySetupCoordinator_handleMultiStepStageResponseError_payload_activity___block_invoke_164;
        v67[3] = &unk_1E5945650;
        v67[4] = v18;
        id v68 = v55;
        id v69 = v56;
        [v42 invokeBlock:v67];
      }
      id v35 = v53;
      __int16 v43 = v54;
      if (v54)
      {
        v44 = objc_msgSend(objc_getProperty(v18, v41, 8, 1), "delegateCaller");
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __82__HMAccessorySetupCoordinator_handleMultiStepStageResponseError_payload_activity___block_invoke_2;
        v64[3] = &unk_1E5945650;
        v64[4] = v18;
        id v65 = v54;
        id v66 = v56;
        [v44 invokeBlock:v64];
      }
      if (v15)
      {
        __int16 v45 = objc_msgSend(objc_getProperty(v18, v41, 8, 1), "delegateCaller");
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __82__HMAccessorySetupCoordinator_handleMultiStepStageResponseError_payload_activity___block_invoke_3;
        v61[3] = &unk_1E5945650;
        v61[4] = v18;
        id v62 = v15;
        id v63 = v56;
        [v45 invokeBlock:v61];
      }
      if (!v16) {
        goto LABEL_20;
      }
      v51 = v15;
      id v46 = objc_getProperty(v18, v41, 16, 1);
      objc_setProperty_atomic_copy(v18, v47, 0, 16);
      objc_setProperty_atomic(v18, v48, 0, 24);
      v50 = objc_msgSend(objc_getProperty(v18, v49, 8, 1), "delegateCaller");
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __82__HMAccessorySetupCoordinator_handleMultiStepStageResponseError_payload_activity___block_invoke_4;
      v57[3] = &unk_1E5945138;
      __int16 v32 = &v60;
      id v60 = v46;
      id v33 = &v58;
      id v58 = v16;
      id v59 = v53;
      id v34 = v46;
      [v50 invokeBlock:v57];

      id v31 = v59;
    }
    else
    {
      v51 = 0;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = v9;
        v23 = id v22 = v7;
        id v24 = [v21 identifier];
        id v25 = [v24 shortDescription];
        *(_DWORD *)buf = 138543874;
        v74 = v23;
        __int16 v75 = 2114;
        v76 = v25;
        __int16 v77 = 2112;
        v78 = v22;
        _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to stage CHIP accessory pairing in steps: %@", buf, 0x20u);

        id v7 = v22;
        id v9 = v21;
        id v16 = 0;
      }

      id v27 = objc_getProperty(v18, v26, 16, 1);
      objc_setProperty_atomic_copy(v18, v28, 0, 16);
      objc_setProperty_atomic(v18, v29, 0, 24);
      id v31 = objc_msgSend(objc_getProperty(v18, v30, 8, 1), "delegateCaller");
      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = __82__HMAccessorySetupCoordinator_handleMultiStepStageResponseError_payload_activity___block_invoke;
      v70[3] = &unk_1E59454E8;
      __int16 v32 = &v72;
      id v72 = v27;
      id v33 = &v71;
      id v71 = v7;
      id v34 = v27;
      [v31 invokeBlock:v70];
      id v35 = v53;
    }

    __int16 v43 = v54;
    v15 = v51;
LABEL_20:
  }
}

uint64_t __82__HMAccessorySetupCoordinator_handleMultiStepStageResponseError_payload_activity___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

uint64_t __82__HMAccessorySetupCoordinator_handleMultiStepStageResponseError_payload_activity___block_invoke_164(void *a1, const char *a2)
{
  id Property = (id)a1[4];
  if (Property) {
    id Property = objc_getProperty(Property, a2, 24, 1);
  }
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];

  return [Property didReceiveDeviceCredential:v4 forStagingRequestUUID:v5];
}

uint64_t __82__HMAccessorySetupCoordinator_handleMultiStepStageResponseError_payload_activity___block_invoke_2(void *a1, const char *a2)
{
  id Property = (id)a1[4];
  if (Property) {
    id Property = objc_getProperty(Property, a2, 24, 1);
  }
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];

  return [Property didReceiveWiFiScanResults:v4 forStagingRequestUUID:v5];
}

uint64_t __82__HMAccessorySetupCoordinator_handleMultiStepStageResponseError_payload_activity___block_invoke_3(void *a1, const char *a2)
{
  id Property = (id)a1[4];
  if (Property) {
    id Property = objc_getProperty(Property, a2, 24, 1);
  }
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];

  return [Property didReceiveThreadScanResults:v4 forStagingRequestUUID:v5];
}

uint64_t __82__HMAccessorySetupCoordinator_handleMultiStepStageResponseError_payload_activity___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (void)selectThreadNetworkAssociation:(id)a3 forStagingRequestUUID:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    _HMFPreconditionFailure();
  }
  id v8 = v7;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Select Thread network association"];
  id v10 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    v14 = [v9 identifier];
    v15 = [v14 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v40 = v13;
    __int16 v41 = 2114;
    id v42 = v15;
    __int16 v43 = 2112;
    v44 = v8;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Select Thread network association with request UUID: %@", buf, 0x20u);
  }
  if (!v6)
  {
    id v16 = 0;
    goto LABEL_8;
  }
  id v38 = 0;
  id v16 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v38];
  id v17 = v38;
  id v18 = v17;
  if (v16)
  {

LABEL_8:
    id v19 = objc_alloc(MEMORY[0x1E4F65488]);
    id v20 = [(id)objc_opt_class() UUID];
    v21 = (void *)[v19 initWithTarget:v20];

    id v22 = [MEMORY[0x1E4F1CA60] dictionary];
    [v22 setObject:v8 forKeyedSubscript:@"HMASC.mk.stagingRequestUUID"];
    [v22 setObject:v16 forKeyedSubscript:@"HMASC.mk.threadNetworkAssociation"];
    uint64_t v23 = [MEMORY[0x1E4F654B0] messageWithName:@"HMASC.m.selectThreadNetworkAssociation" destination:v21 payload:v22];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __84__HMAccessorySetupCoordinator_selectThreadNetworkAssociation_forStagingRequestUUID___block_invoke_2;
    v34[3] = &unk_1E59455E8;
    v34[4] = v11;
    id v35 = v9;
    [v23 setResponseHandler:v34];
    if (v11) {
      id Property = objc_getProperty(v11, v24, 8, 1);
    }
    else {
      id Property = 0;
    }
    SEL v26 = [Property messageDispatcher];
    [v26 sendMessage:v23];

    goto LABEL_16;
  }
  id v27 = (void *)MEMORY[0x19F3A64A0]();
  SEL v28 = v11;
  SEL v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    SEL v30 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v40 = v30;
    __int16 v41 = 2112;
    id v42 = v6;
    __int16 v43 = 2112;
    v44 = v18;
    _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode Thread network association %@: %@", buf, 0x20u);
  }
  if (v28) {
    id v32 = objc_getProperty(v28, v31, 8, 1);
  }
  else {
    id v32 = 0;
  }
  id v33 = [v32 delegateCaller];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __84__HMAccessorySetupCoordinator_selectThreadNetworkAssociation_forStagingRequestUUID___block_invoke;
  v36[3] = &unk_1E5945628;
  v36[4] = v28;
  id v37 = v18;
  id v16 = v18;
  [v33 invokeBlock:v36];

LABEL_16:
}

uint64_t __84__HMAccessorySetupCoordinator_selectThreadNetworkAssociation_forStagingRequestUUID___block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(void **)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 16, 1);
  }
  id v3 = (uint64_t (*)(void))Property[2];

  return v3();
}

void __84__HMAccessorySetupCoordinator_selectThreadNetworkAssociation_forStagingRequestUUID___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
}

- (void)rejectDeviceCredentialForStagingRequestUUID:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!v9)
  {
    _HMFPreconditionFailure();
LABEL_8:
    id Property = 0;
    goto LABEL_6;
  }
  id v3 = v9;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Reject device credential"];
  uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
  v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    v15 = [v10 identifier];
    id v16 = [v15 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v31 = v14;
    __int16 v32 = 2114;
    id v33 = v16;
    __int16 v34 = 2112;
    id v35 = v3;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Rejecting device credential with request UUID: %@", buf, 0x20u);
  }
  id v17 = objc_alloc(MEMORY[0x1E4F65488]);
  id v18 = [(id)objc_opt_class() UUID];
  uint64_t v5 = (void *)[v17 initWithTarget:v18];

  SEL v28 = @"HMASC.mk.stagingRequestUUID";
  SEL v29 = v3;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  id v7 = [MEMORY[0x1E4F654B0] messageWithName:@"HMASC.m.rejectDeviceCredential" destination:v5 payload:v6];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = __75__HMAccessorySetupCoordinator_rejectDeviceCredentialForStagingRequestUUID___block_invoke;
  id v25 = &unk_1E59455E8;
  SEL v26 = v12;
  id v27 = v10;
  id v4 = v10;
  [v7 setResponseHandler:&v22];
  if (!v12) {
    goto LABEL_8;
  }
  id Property = objc_getProperty(v12, v19, 8, 1);
LABEL_6:
  v21 = objc_msgSend(Property, "messageDispatcher", v22, v23, v24, v25, v26);
  [v21 sendMessage:v7];
}

void __75__HMAccessorySetupCoordinator_rejectDeviceCredentialForStagingRequestUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
}

- (void)confirmDeviceCredentialForStagingRequestUUID:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!v9)
  {
    _HMFPreconditionFailure();
LABEL_8:
    id Property = 0;
    goto LABEL_6;
  }
  id v3 = v9;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Confirm device credential"];
  uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
  v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    v15 = [v10 identifier];
    id v16 = [v15 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v31 = v14;
    __int16 v32 = 2114;
    id v33 = v16;
    __int16 v34 = 2112;
    id v35 = v3;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Confirm device credential with request UUID: %@", buf, 0x20u);
  }
  id v17 = objc_alloc(MEMORY[0x1E4F65488]);
  id v18 = [(id)objc_opt_class() UUID];
  uint64_t v5 = (void *)[v17 initWithTarget:v18];

  SEL v28 = @"HMASC.mk.stagingRequestUUID";
  SEL v29 = v3;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  id v7 = [MEMORY[0x1E4F654B0] messageWithName:@"HMASC.m.confirmDeviceCredential" destination:v5 payload:v6];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = __76__HMAccessorySetupCoordinator_confirmDeviceCredentialForStagingRequestUUID___block_invoke;
  id v25 = &unk_1E59455E8;
  SEL v26 = v12;
  id v27 = v10;
  id v4 = v10;
  [v7 setResponseHandler:&v22];
  if (!v12) {
    goto LABEL_8;
  }
  id Property = objc_getProperty(v12, v19, 8, 1);
LABEL_6:
  v21 = objc_msgSend(Property, "messageDispatcher", v22, v23, v24, v25, v26);
  [v21 sendMessage:v7];
}

void __76__HMAccessorySetupCoordinator_confirmDeviceCredentialForStagingRequestUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
}

- (void)stageCHIPAccessoryPairingInStepsWithPayload:(id)a3 delegate:(id)a4 scanningNetworks:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v11 = a5;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v15)
  {
LABEL_9:
    _HMFPreconditionFailure();
LABEL_10:
    id Property = 0;
    goto LABEL_7;
  }
  id v9 = v16;
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Stage CHIP accessory pairing in steps"];
  id v18 = (void *)MEMORY[0x19F3A64A0]();
  id v19 = self;
  id v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = id v35 = v15;
    [v17 identifier];
    v22 = __int16 v34 = v9;
    uint64_t v23 = [v22 shortDescription];
    id v24 = HMFBooleanToString();
    *(_DWORD *)buf = 138544130;
    __int16 v41 = v21;
    __int16 v42 = 2114;
    __int16 v43 = v23;
    __int16 v44 = 2112;
    id v45 = v14;
    __int16 v46 = 2112;
    SEL v47 = v24;
    _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Staging CHIP accessory pairing in steps with payload: %@, shouldScanNetworks: %@", buf, 0x2Au);

    id v9 = v34;
    id v15 = v35;
  }

  id v25 = objc_alloc(MEMORY[0x1E4F65488]);
  SEL v26 = [(id)objc_opt_class() UUID];
  id v7 = (void *)[v25 initWithTarget:v26];

  v38[0] = @"HMASC.mk.shouldScanNetworks";
  id v27 = [NSNumber numberWithBool:v11];
  v38[1] = @"HMASC.mk.setupAccessoryPayload";
  v39[0] = v27;
  SEL v28 = encodeRootObject(v14);
  v39[1] = v28;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];

  id v8 = [MEMORY[0x1E4F654B0] messageWithName:@"HMASC.m.stageCHIPAccessoryPairingInSteps" destination:v7 payload:v11];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __119__HMAccessorySetupCoordinator_stageCHIPAccessoryPairingInStepsWithPayload_delegate_scanningNetworks_completionHandler___block_invoke;
  v36[3] = &unk_1E59455E8;
  v36[4] = v19;
  id v37 = v17;
  id v6 = v17;
  [v8 setResponseHandler:v36];
  if (!v19) {
    goto LABEL_10;
  }
  objc_setProperty_atomic(v19, v29, v15, 24);
  objc_setProperty_atomic_copy(v19, v30, v9, 16);
  id Property = objc_getProperty(v19, v31, 8, 1);
LABEL_7:
  id v33 = [Property messageDispatcher];
  [v33 sendMessage:v8];
}

void __119__HMAccessorySetupCoordinator_stageCHIPAccessoryPairingInStepsWithPayload_delegate_scanningNetworks_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
}

- (void)stageCHIPAccessoryPairingInStepsWithPayload:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v12)
  {
    _HMFPreconditionFailure();
LABEL_8:
    id Property = 0;
    goto LABEL_6;
  }
  a5 = v14;
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Stage CHIP accessory pairing in steps"];
  id v16 = (void *)MEMORY[0x19F3A64A0]();
  id v17 = self;
  id v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = HMFGetLogIdentifier();
    id v20 = [v15 identifier];
    v21 = [v20 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v39 = v19;
    __int16 v40 = 2114;
    __int16 v41 = v21;
    __int16 v42 = 2112;
    id v43 = v12;
    _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Staging CHIP accessory pairing in steps with payload: %@", buf, 0x20u);
  }
  id v22 = objc_alloc(MEMORY[0x1E4F65488]);
  uint64_t v23 = [(id)objc_opt_class() UUID];
  id v6 = (void *)[v22 initWithTarget:v23];

  v36[0] = @"HMASC.mk.shouldScanNetworks";
  v36[1] = @"HMASC.mk.setupAccessoryPayload";
  v37[0] = MEMORY[0x1E4F1CC38];
  id v24 = encodeRootObject(v12);
  v37[1] = v24;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];

  id v8 = [MEMORY[0x1E4F654B0] messageWithName:@"HMASC.m.stageCHIPAccessoryPairingInSteps" destination:v6 payload:v7];
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  __int16 v32 = __102__HMAccessorySetupCoordinator_stageCHIPAccessoryPairingInStepsWithPayload_delegate_completionHandler___block_invoke;
  id v33 = &unk_1E59455E8;
  __int16 v34 = v17;
  id v35 = v15;
  id v5 = v15;
  [v8 setResponseHandler:&v30];
  if (!v17) {
    goto LABEL_8;
  }
  objc_setProperty_atomic(v17, v25, v13, 24);
  objc_setProperty_atomic_copy(v17, v26, a5, 16);
  id Property = objc_getProperty(v17, v27, 8, 1);
LABEL_6:
  SEL v29 = objc_msgSend(Property, "messageDispatcher", v30, v31, v32, v33, v34);
  [v29 sendMessage:v8];
}

void __102__HMAccessorySetupCoordinator_stageCHIPAccessoryPairingInStepsWithPayload_delegate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
}

- (void)createSetupAccessoryPayloadWithCHIPDecimalStringRepresentation:(id)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  id v8 = v7;
  if (!v7) {
    goto LABEL_7;
  }
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Create setup accessory payload with CHIP decimal string representation"];
  id v10 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = HMFGetLogIdentifier();
    id v14 = [v9 identifier];
    id v15 = [v14 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v20 = v13;
    __int16 v21 = 2114;
    id v22 = v15;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Creating setup accessory payload with CHIP decimal string representation: %@", buf, 0x20u);
  }
  id v17 = @"HMASC.mk.chipSetupPayloadDecimalStringRepresentation";
  id v18 = v6;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  -[HMAccessorySetupCoordinator _createCHIPSetupAccessoryPayloadWithMessagePayload:activity:completionHandler:](v11, v16, v9, v8);
}

- (void)_createCHIPSetupAccessoryPayloadWithMessagePayload:(void *)a3 activity:(void *)a4 completionHandler:
{
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    id v9 = (objc_class *)MEMORY[0x1E4F65488];
    id v10 = a2;
    id v11 = [v9 alloc];
    id v12 = [(id)objc_opt_class() UUID];
    id v13 = (void *)[v11 initWithTarget:v12];

    id v14 = [MEMORY[0x1E4F654B0] messageWithName:@"HMASC.m.createCHIPSetupAccessoryPayload" destination:v13 payload:v10];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __109__HMAccessorySetupCoordinator__createCHIPSetupAccessoryPayloadWithMessagePayload_activity_completionHandler___block_invoke;
    v17[3] = &unk_1E5945510;
    v17[4] = a1;
    id v18 = v7;
    id v19 = v8;
    [v14 setResponseHandler:v17];
    id v16 = objc_msgSend(objc_getProperty(a1, v15, 8, 1), "messageDispatcher");
    [v16 sendMessage:v14];
  }
}

void __109__HMAccessorySetupCoordinator__createCHIPSetupAccessoryPayloadWithMessagePayload_activity_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v39[0] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
  id v8 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMASC.mk.setupAccessoryPayload", v7);

  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = a1[4];
  id v11 = HMFGetOSLogHandle();
  id v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      id v14 = [a1[5] identifier];
      SEL v15 = [v14 shortDescription];
      *(_DWORD *)buf = 138543874;
      __int16 v32 = v13;
      __int16 v33 = 2114;
      __int16 v34 = v15;
      __int16 v35 = 2112;
      id v36 = v8;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully created setup accessory payload: %@", buf, 0x20u);
    }
    id Property = a1[4];
    if (Property) {
      id Property = objc_getProperty(Property, v16, 8, 1);
    }
    id v18 = [Property delegateCaller];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __109__HMAccessorySetupCoordinator__createCHIPSetupAccessoryPayloadWithMessagePayload_activity_completionHandler___block_invoke_166;
    v26[3] = &unk_1E59454E8;
    id v19 = &v28;
    id v28 = a1[6];
    id v27 = v8;
    [v18 invokeBlock:v26];

    id v20 = v27;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = HMFGetLogIdentifier();
      id v22 = [a1[5] identifier];
      __int16 v23 = [v22 shortDescription];
      *(_DWORD *)buf = 138544130;
      __int16 v32 = v21;
      __int16 v33 = 2114;
      __int16 v34 = v23;
      __int16 v35 = 2112;
      id v36 = v6;
      __int16 v37 = 2112;
      id v38 = v5;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Could not find setup accessory payload in response payload %@: %@", buf, 0x2Au);
    }
    id v25 = a1[4];
    if (v25) {
      id v25 = objc_getProperty(v25, v24, 8, 1);
    }
    id v20 = [v25 delegateCaller];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __109__HMAccessorySetupCoordinator__createCHIPSetupAccessoryPayloadWithMessagePayload_activity_completionHandler___block_invoke_165;
    v29[3] = &unk_1E59454C0;
    id v19 = &v30;
    id v30 = a1[6];
    [v20 invokeBlock:v29];
  }
}

void __109__HMAccessorySetupCoordinator__createCHIPSetupAccessoryPayloadWithMessagePayload_activity_completionHandler___block_invoke_165(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __109__HMAccessorySetupCoordinator__createCHIPSetupAccessoryPayloadWithMessagePayload_activity_completionHandler___block_invoke_166(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)createSetupAccessoryPayloadWithSetupPayloadURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_14:
    _HMFPreconditionFailure();
  }
  id v8 = (void (**)(void, void, void))v7;
  if (!v7) {
    goto LABEL_14;
  }
  if ([(id)objc_opt_class() isHAPSetupPayloadURL:v6])
  {
    id v23 = 0;
    id v9 = [[HMSetupAccessoryPayload alloc] initWithHAPSetupPayloadURL:v6 error:&v23];
    id v10 = v23;
    ((void (**)(void, HMSetupAccessoryPayload *, id))v8)[2](v8, v9, v10);
  }
  else if ([(id)objc_opt_class() isCHIPSetupPayloadURL:v6])
  {
    id v10 = (id)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Create setup accessory payload for CHIP setup payload URL"];
    id v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      SEL v15 = [v10 identifier];
      id v16 = [v15 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v27 = v14;
      __int16 v28 = 2114;
      SEL v29 = v16;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Creating setup accessory payload for CHIP setup payload URL: %@", buf, 0x20u);
    }
    id v24 = @"HMASC.mk.setupPayloadURL";
    id v25 = v6;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    -[HMAccessorySetupCoordinator _createCHIPSetupAccessoryPayloadWithMessagePayload:activity:completionHandler:](v12, v17, v10, v8);
  }
  else
  {
    id v18 = (void *)MEMORY[0x19F3A64A0]();
    id v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = HMFGetLogIdentifier();
      id v22 = [v6 scheme];
      *(_DWORD *)buf = 138543874;
      id v27 = v21;
      __int16 v28 = 2112;
      SEL v29 = v22;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unsupported URL scheme %@ in setupPayloadURL: %@", buf, 0x20u);
    }
    id v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    ((void (**)(void, void, id))v8)[2](v8, 0, v10);
  }
}

- (void)createSetupAccessoryPayloadWithSetupPayloadURLString:(id)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_10:
    _HMFPreconditionFailure();
  }
  id v8 = (void (**)(void, void, void))v7;
  if (!v7) {
    goto LABEL_10;
  }
  id v9 = +[HMAccessorySetupCoordinator setupPayloadURLFromSetupPayloadURLString:v6];
  if (v9)
  {
    [(HMAccessorySetupCoordinator *)self createSetupAccessoryPayloadWithSetupPayloadURL:v9 completionHandler:v8];
  }
  else
  {
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v15 = 138543618;
      id v16 = v13;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to create setup payload URL from string: %@", (uint8_t *)&v15, 0x16u);
    }
    id v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    ((void (**)(void, void, void *))v8)[2](v8, 0, v14);
  }
}

- (void)dealloc
{
  id v2 = self;
  if (self) {
    self = (HMAccessorySetupCoordinator *)objc_getProperty(self, a2, 8, 1);
  }
  id v3 = [(HMAccessorySetupCoordinator *)self messageDispatcher];
  [v3 deregisterReceiver:v2];

  v4.receiver = v2;
  v4.super_class = (Class)HMAccessorySetupCoordinator;
  [(HMAccessorySetupCoordinator *)&v4 dealloc];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t27_45295 != -1) {
    dispatch_once(&logCategory__hmf_once_t27_45295, &__block_literal_global_45296);
  }
  id v2 = (void *)logCategory__hmf_once_v28_45297;

  return v2;
}

uint64_t __42__HMAccessorySetupCoordinator_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v28_45297;
  logCategory__hmf_once_v28_45297 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)setupPayloadURLFromSetupPayloadURLString:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  id v5 = [v3 whitespaceCharacterSet];
  id v6 = [v5 invertedSet];
  id v7 = [v4 stringByAddingPercentEncodingWithAllowedCharacters:v6];

  id v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];

  return v8;
}

+ (BOOL)isCHIPSetupPayloadURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 scheme];
  if ([v4 isEqualToString:@"CH"])
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [v3 scheme];
    char v5 = [v6 isEqualToString:@"MT"];
  }
  return v5;
}

+ (BOOL)isHAPSetupPayloadURL:(id)a3
{
  id v3 = [a3 scheme];
  char v4 = [v3 isEqualToString:@"X-HM"];

  return v4;
}

+ (id)communicationProtocolForSetupPayloadURLString:(id)a3
{
  id v3 = a3;
  char v4 = [(id)objc_opt_class() setupPayloadURLFromSetupPayloadURLString:v3];

  if ([(id)objc_opt_class() isHAPSetupPayloadURL:v4])
  {
    char v5 = &unk_1EEF08118;
  }
  else if ([(id)objc_opt_class() isCHIPSetupPayloadURL:v4])
  {
    char v5 = &unk_1EEF08130;
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (NSUUID)UUID
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"188914BD-5163-425C-9E59-CAE9BFA1A288"];

  return (NSUUID *)v2;
}

+ (BOOL)isSetupPayloadURL:(id)a3
{
  id v4 = a3;
  if ([a1 isHAPSetupPayloadURL:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = [a1 isCHIPSetupPayloadURL:v4];
  }

  return v5;
}

+ (BOOL)isSetupPayloadURLString:(id)a3
{
  id v3 = a1;
  id v4 = [a1 setupPayloadURLFromSetupPayloadURLString:a3];
  LOBYTE(v3) = [v3 isSetupPayloadURL:v4];

  return (char)v3;
}

@end