@interface HMAccessorySoftwareUpdateControllerV2
+ (id)accessoryUUIDsForAccessoryIdentifiers:(id)a3 home:(id)a4;
+ (id)logCategory;
+ (id)softwareUpdateFromSoftwareUpdateV2:(id)a3;
+ (id)topicFiltersForAccessoryIdentifiers:(id)a3 home:(id)a4;
- (HMAccessorySoftwareUpdateControllerV2)initWithContext:(id)a3 home:(id)a4 subscriptionProvider:(id)a5 documentationManager:(id)a6;
- (HMAccessorySoftwareUpdateControllerV2Delegate)delegate;
- (HMESubscriptionProviding)subscriptionProvider;
- (HMHome)home;
- (HMSoftwareUpdateDocumentationManager)documentationManager;
- (NSMutableDictionary)softwareUpdateByAccessory;
- (_HMContext)context;
- (id)messageDestinationForAccessory:(id)a3;
- (id)softwareUpdateForAccessory:(id)a3 withDescriptor:(id)a4;
- (id)softwareUpdateProgressForAccessory:(id)a3 withProgress:(id)a4;
- (void)applySoftwareUpdate:(id)a3 accessory:(id)a4 completion:(id)a5;
- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5;
- (void)didReceiveEvent:(id)a3 topic:(id)a4;
- (void)fetchDocumentationFromMetadata:(id)a3 completion:(id)a4;
- (void)handleDidReceiveDescriptorEvent:(id)a3 forAccessory:(id)a4;
- (void)handleDidReceiveEvent:(id)a3 topic:(id)a4;
- (void)handleDidReceiveProgressEvent:(id)a3 forAccessory:(id)a4;
- (void)scanForSoftwareUpdateOnAccessories:(id)a3 withOptions:(unint64_t)a4 completion:(id)a5;
- (void)scanForSoftwareUpdateRepeatedlyOnAccessory:(id)a3 andInstallUpdate:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)subscribe:(id)a3 completion:(id)a4;
- (void)unsubscribe:(id)a3;
@end

@implementation HMAccessorySoftwareUpdateControllerV2

- (HMAccessorySoftwareUpdateControllerV2)initWithContext:(id)a3 home:(id)a4 subscriptionProvider:(id)a5 documentationManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMAccessorySoftwareUpdateControllerV2;
  v15 = [(HMAccessorySoftwareUpdateControllerV2 *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_context, a3);
    objc_storeStrong((id *)&v16->_subscriptionProvider, a5);
    objc_storeWeak((id *)&v16->_home, v12);
    objc_storeStrong((id *)&v16->_documentationManager, a6);
    uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
    softwareUpdateByAccessory = v16->_softwareUpdateByAccessory;
    v16->_softwareUpdateByAccessory = (NSMutableDictionary *)v17;
  }
  return v16;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareUpdateByAccessory, 0);
  objc_storeStrong((id *)&self->_documentationManager, 0);
  objc_storeStrong((id *)&self->_subscriptionProvider, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_context, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (NSMutableDictionary)softwareUpdateByAccessory
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (HMSoftwareUpdateDocumentationManager)documentationManager
{
  return self->_documentationManager;
}

- (HMESubscriptionProviding)subscriptionProvider
{
  return (HMESubscriptionProviding *)objc_getProperty(self, a2, 40, 1);
}

- (HMHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);

  return (HMHome *)WeakRetained;
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 24, 1);
}

- (HMAccessorySoftwareUpdateControllerV2Delegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HMAccessorySoftwareUpdateControllerV2Delegate *)WeakRetained;
}

- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x19F3A64A0]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    int v15 = 138544130;
    v16 = v14;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Did receive cached event: %@, topic: %@, source: %@", (uint8_t *)&v15, 0x2Au);
  }
  [(HMAccessorySoftwareUpdateControllerV2 *)v12 handleDidReceiveEvent:v8 topic:v9];
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v12 = 138543874;
    id v13 = v11;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Did receive event: %@, topic: %@", (uint8_t *)&v12, 0x20u);
  }
  [(HMAccessorySoftwareUpdateControllerV2 *)v9 handleDidReceiveEvent:v6 topic:v7];
}

- (id)messageDestinationForAccessory:(id)a3
{
  id v4 = a3;
  v5 = [(HMAccessorySoftwareUpdateControllerV2 *)self home];
  id v6 = [v5 accessoryWithUUID:v4];

  id v7 = objc_alloc(MEMORY[0x1E4F65488]);
  id v8 = [v6 messageTargetUUID];
  id v9 = (void *)[v7 initWithTarget:v8];

  return v9;
}

- (id)softwareUpdateForAccessory:(id)a3 withDescriptor:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v16 = 138543874;
    id v17 = v11;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Creating HMSoftwareUpdateV2 for accessory: %@, descriptor: %@", (uint8_t *)&v16, 0x20u);
  }
  p_lock = &v9->_lock;
  os_unfair_lock_lock_with_options();
  id v13 = +[HMSoftwareUpdateV2 softwareUpdateFromDescriptor:v7];
  __int16 v14 = [(HMAccessorySoftwareUpdateControllerV2 *)v9 softwareUpdateByAccessory];
  [v14 setObject:v13 forKeyedSubscript:v6];

  os_unfair_lock_unlock(p_lock);

  return v13;
}

- (id)softwareUpdateProgressForAccessory:(id)a3 withProgress:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v26 = 138543874;
    v27 = v11;
    __int16 v28 = 2112;
    id v29 = v6;
    __int16 v30 = 2112;
    id v31 = v7;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Creating HMSoftwareUpdateV2 for accessory: %@, progress: %@", (uint8_t *)&v26, 0x20u);
  }
  p_lock = &v9->_lock;
  os_unfair_lock_lock_with_options();
  id v13 = [(HMAccessorySoftwareUpdateControllerV2 *)v9 softwareUpdateByAccessory];
  __int16 v14 = [v13 objectForKeyedSubscript:v6];

  if (v14)
  {
    id v15 = [HMSoftwareUpdateProgressV2 alloc];
    [v7 percentageComplete];
    int v17 = v16;
    [v7 estimatedTimeRemaining];
    double v19 = v18;
    LODWORD(v18) = v17;
    __int16 v20 = [(HMSoftwareUpdateProgressV2 *)v15 initWithPercentageComplete:v18 estimatedTimeRemaining:v19];
  }
  else
  {
    id v21 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v22 = v9;
    HMFGetOSLogHandle();
    uint64_t v23 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      int v26 = 138543618;
      v27 = v24;
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Attempted to update progress without existing software update for accessory: %@", (uint8_t *)&v26, 0x16u);
    }
    __int16 v20 = 0;
  }

  os_unfair_lock_unlock(p_lock);

  return v20;
}

- (void)handleDidReceiveProgressEvent:(id)a3 forAccessory:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMAccessorySoftwareUpdateControllerV2 *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  id v10 = (void *)MEMORY[0x19F3A64A0]();
  id v11 = self;
  int v12 = HMFGetOSLogHandle();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v13)
    {
      __int16 v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v41 = v14;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling did receive progress event", buf, 0xCu);
    }
    id v15 = +[HMSoftwareUpdateProgress progressFromEvent:v6];
    if (v15)
    {
      int v16 = [(HMAccessorySoftwareUpdateControllerV2 *)v11 home];
      int v17 = [v16 accessoryWithUUID:v7];
      double v18 = [v17 uniqueIdentifier];

      if (v18)
      {
        double v19 = [(HMAccessorySoftwareUpdateControllerV2 *)v11 softwareUpdateProgressForAccessory:v7 withProgress:v15];
        if (v19)
        {
          __int16 v20 = (void *)MEMORY[0x19F3A64A0]();
          id v21 = v11;
          uint64_t v22 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            uint64_t v23 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v41 = v23;
            __int16 v42 = 2112;
            id v43 = v18;
            __int16 v44 = 2112;
            v45 = v19;
            _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_INFO, "%{public}@Telling delegate that accessory did receive software update progress. Accessory: %@, progress:\n%@", buf, 0x20u);
          }
          v24 = [(HMAccessorySoftwareUpdateControllerV2 *)v21 context];
          v25 = [v24 delegateCaller];
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __84__HMAccessorySoftwareUpdateControllerV2_handleDidReceiveProgressEvent_forAccessory___block_invoke;
          v37[3] = &unk_1E5945650;
          v37[4] = v21;
          id v38 = v18;
          id v39 = v19;
          [v25 invokeBlock:v37];
        }
      }
      else
      {
        v33 = (void *)MEMORY[0x19F3A64A0]();
        v34 = v11;
        v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v36 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v41 = v36;
          __int16 v42 = 2112;
          id v43 = v7;
          _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to find accessory with uuid: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      id v29 = (void *)MEMORY[0x19F3A64A0]();
      __int16 v30 = v11;
      id v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v41 = v32;
        __int16 v42 = 2112;
        id v43 = v6;
        _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse progress from event: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    if (v13)
    {
      int v26 = HMFGetLogIdentifier();
      v27 = NSStringFromSelector(sel_softwareUpdateController_accessory_didUpdateProgress_);
      __int16 v28 = [(HMAccessorySoftwareUpdateControllerV2 *)v11 delegate];
      *(_DWORD *)buf = 138543874;
      v41 = v26;
      __int16 v42 = 2112;
      id v43 = v27;
      __int16 v44 = 2112;
      v45 = v28;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Delegate does not respond to %@: %@", buf, 0x20u);
    }
  }
}

void __84__HMAccessorySoftwareUpdateControllerV2_handleDidReceiveProgressEvent_forAccessory___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 softwareUpdateController:*(void *)(a1 + 32) accessory:*(void *)(a1 + 40) didUpdateProgress:*(void *)(a1 + 48)];
}

- (void)handleDidReceiveDescriptorEvent:(id)a3 forAccessory:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  char v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v36 = v11;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling did receive descriptor event", buf, 0xCu);
  }
  int v12 = +[HMSoftwareUpdateDescriptor descriptorFromEvent:v6];
  if (v12)
  {
    BOOL v13 = [(HMAccessorySoftwareUpdateControllerV2 *)v9 home];
    __int16 v14 = [v13 accessoryWithUUID:v7];
    id v15 = [v14 uniqueIdentifier];

    if (v15)
    {
      int v16 = [(HMAccessorySoftwareUpdateControllerV2 *)v9 softwareUpdateForAccessory:v7 withDescriptor:v12];
      int v17 = (void *)MEMORY[0x19F3A64A0]();
      double v18 = v9;
      double v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        __int16 v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v36 = v20;
        __int16 v37 = 2112;
        id v38 = v15;
        __int16 v39 = 2112;
        v40 = v16;
        _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_INFO, "%{public}@Telling delegate that accessory did receive software update. Accessory: %@, update:\n%@", buf, 0x20u);
      }
      id v21 = [(HMAccessorySoftwareUpdateControllerV2 *)v18 context];
      uint64_t v22 = [v21 delegateCaller];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __86__HMAccessorySoftwareUpdateControllerV2_handleDidReceiveDescriptorEvent_forAccessory___block_invoke;
      v32[3] = &unk_1E5945650;
      v32[4] = v18;
      id v33 = v15;
      id v34 = v16;
      id v23 = v16;
      [v22 invokeBlock:v32];
    }
    else
    {
      __int16 v28 = (void *)MEMORY[0x19F3A64A0]();
      id v29 = v9;
      __int16 v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        id v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v36 = v31;
        __int16 v37 = 2112;
        id v38 = v7;
        _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to find accessory with uuid: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v24 = (void *)MEMORY[0x19F3A64A0]();
    v25 = v9;
    int v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v36 = v27;
      __int16 v37 = 2112;
      id v38 = v6;
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse descriptor from event: %@", buf, 0x16u);
    }
  }
}

void __86__HMAccessorySoftwareUpdateControllerV2_handleDidReceiveDescriptorEvent_forAccessory___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 softwareUpdateController:*(void *)(a1 + 32) accessory:*(void *)(a1 + 40) didReceiveUpdate:*(void *)(a1 + 48)];
}

- (void)handleDidReceiveEvent:(id)a3 topic:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  char v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v15 = 138543362;
    int v16 = v11;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling did receive event", (uint8_t *)&v15, 0xCu);
  }
  int v12 = +[HMEventTopicHelper decodeTopic:v7];
  BOOL v13 = [v12 asAccessoryTopic];

  if (v13)
  {
    if ([v13 accessoryEventTopicSuffixID] == 506)
    {
      __int16 v14 = [v13 accessoryUUID];
      [(HMAccessorySoftwareUpdateControllerV2 *)v9 handleDidReceiveDescriptorEvent:v6 forAccessory:v14];
LABEL_8:

      goto LABEL_9;
    }
    if ([v13 accessoryEventTopicSuffixID] == 507)
    {
      __int16 v14 = [v13 accessoryUUID];
      [(HMAccessorySoftwareUpdateControllerV2 *)v9 handleDidReceiveProgressEvent:v6 forAccessory:v14];
      goto LABEL_8;
    }
  }
LABEL_9:
}

- (void)scanForSoftwareUpdateRepeatedlyOnAccessory:(id)a3 andInstallUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = self;
  char v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v31 = v10;
    __int16 v32 = 2112;
    id v33 = v6;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Scanning for software update repeatedly on accessory with identifier: %@", buf, 0x16u);
  }
  id v11 = [(HMAccessorySoftwareUpdateControllerV2 *)v8 home];
  int v12 = [v11 accessoryWithUniqueIdentifier:v6];
  BOOL v13 = [v12 uuid];

  if (v13)
  {
    __int16 v28 = @"HMAccessorySoftwareUpdateControllerV2MessageKeyShouldApplyUpdate";
    __int16 v14 = [NSNumber numberWithBool:v4];
    id v29 = v14;
    int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];

    int v16 = (void *)MEMORY[0x1E4F654B0];
    uint64_t v17 = [(HMAccessorySoftwareUpdateControllerV2 *)v8 messageDestinationForAccessory:v13];
    double v18 = [v16 messageWithName:@"HMAccessorySoftwareUpdateControllerV2ScanRepeatedlyAndApplyMessage" destination:v17 payload:v15];

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __101__HMAccessorySoftwareUpdateControllerV2_scanForSoftwareUpdateRepeatedlyOnAccessory_andInstallUpdate___block_invoke;
    v25[3] = &unk_1E59450E8;
    v25[4] = v8;
    id v26 = v6;
    id v27 = v13;
    [v18 setResponseHandler:v25];
    double v19 = [(HMAccessorySoftwareUpdateControllerV2 *)v8 context];
    __int16 v20 = [v19 messageDispatcher];
    [v20 sendMessage:v18];
  }
  else
  {
    id v21 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v22 = v8;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v24;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@SRAISU: Failed to find accessory for uniqueIdentifier: %@", buf, 0x16u);
    }
  }
}

void __101__HMAccessorySoftwareUpdateControllerV2_scanForSoftwareUpdateRepeatedlyOnAccessory_andInstallUpdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  char v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      int v19 = 138544130;
      __int16 v20 = v11;
      __int16 v21 = 2112;
      uint64_t v22 = v12;
      __int16 v23 = 2112;
      uint64_t v24 = v13;
      __int16 v25 = 2112;
      id v26 = v5;
      __int16 v14 = "%{public}@SRAISU: Failed to initiate scanning for updates repeatedly on accessory with identifier: %@ UUID: %@ error: %@";
      int v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v15, v16, v14, (uint8_t *)&v19, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = *(void *)(a1 + 48);
    int v19 = 138544130;
    __int16 v20 = v11;
    __int16 v21 = 2112;
    uint64_t v22 = v17;
    __int16 v23 = 2112;
    uint64_t v24 = v18;
    __int16 v25 = 2112;
    id v26 = 0;
    __int16 v14 = "%{public}@SRAISU: Successfully started scanning for updates repeatedly on accessory with identifier: %@ UUID: %@ error: %@";
    int v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }
}

- (void)unsubscribe:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v21 = 138543618;
    uint64_t v22 = v8;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing from accessories with identifiers: %@", (uint8_t *)&v21, 0x16u);
  }
  if (objc_msgSend(v4, "hmf_isEmpty"))
  {
    char v9 = (void *)MEMORY[0x19F3A64A0]();
    id v10 = v6;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v21 = 138543362;
      uint64_t v22 = v12;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing from all topics", (uint8_t *)&v21, 0xCu);
    }
    uint64_t v13 = [(HMAccessorySoftwareUpdateControllerV2 *)v10 subscriptionProvider];
    [v13 unregisterConsumer:v10 completion:0];
  }
  else
  {
    __int16 v14 = objc_opt_class();
    int v15 = [(HMAccessorySoftwareUpdateControllerV2 *)v6 home];
    uint64_t v13 = [v14 topicFiltersForAccessoryIdentifiers:v4 home:v15];

    os_log_type_t v16 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v17 = v6;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = HMFGetLogIdentifier();
      int v21 = 138543618;
      uint64_t v22 = v19;
      __int16 v23 = 2112;
      id v24 = v13;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing from topicFilters: %@", (uint8_t *)&v21, 0x16u);
    }
    __int16 v20 = [(HMAccessorySoftwareUpdateControllerV2 *)v17 subscriptionProvider];
    [v20 unregisterConsumer:v17 topicFilters:v13 completion:0];
  }
}

- (void)fetchDocumentationFromMetadata:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMAccessorySoftwareUpdateControllerV2 *)self documentationManager];
  [v8 documentationForMetadata:v7 completion:v6];
}

- (void)applySoftwareUpdate:(id)a3 accessory:(id)a4 completion:(id)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    __int16 v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v52 = v14;
    __int16 v53 = 2112;
    id v54 = v8;
    __int16 v55 = 2112;
    id v56 = v9;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Applying software update: %@ on accessory with identifier: %@", buf, 0x20u);
  }
  int v15 = [v8 version];

  if (v15)
  {
    os_log_type_t v16 = [(id)objc_opt_class() softwareUpdateFromSoftwareUpdateV2:v8];
    uint64_t v17 = [(HMAccessorySoftwareUpdateControllerV2 *)v12 home];
    uint64_t v18 = [v17 accessoryWithUniqueIdentifier:v9];
    int v19 = [v18 uuid];

    if (v19)
    {
      v49 = @"update";
      __int16 v20 = encodeRootObject(v16);
      v50 = v20;
      int v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];

      uint64_t v22 = (void *)MEMORY[0x1E4F654B0];
      __int16 v23 = [(HMAccessorySoftwareUpdateControllerV2 *)v12 messageDestinationForAccessory:v19];
      id v24 = [v22 messageWithName:@"HMSU.su" destination:v23 payload:v21];

      uint64_t v39 = MEMORY[0x1E4F143A8];
      uint64_t v40 = 3221225472;
      uint64_t v41 = __82__HMAccessorySoftwareUpdateControllerV2_applySoftwareUpdate_accessory_completion___block_invoke_2;
      __int16 v42 = &unk_1E5944EF0;
      id v43 = v12;
      id v44 = v10;
      [v24 setResponseHandler:&v39];
      uint64_t v25 = [(HMAccessorySoftwareUpdateControllerV2 *)v12 context];
      id v26 = [v25 messageDispatcher];
      [v26 sendMessage:v24];
    }
    else
    {
      id v33 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v34 = v12;
      v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v52 = v36;
        __int16 v53 = 2112;
        id v54 = v9;
        _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to find accessory for uniqueIdentifier: %@", buf, 0x16u);
      }
      __int16 v37 = [(HMAccessorySoftwareUpdateControllerV2 *)v34 context];
      id v38 = [v37 delegateCaller];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __82__HMAccessorySoftwareUpdateControllerV2_applySoftwareUpdate_accessory_completion___block_invoke_47;
      v45[3] = &unk_1E59454C0;
      id v46 = v10;
      [v38 invokeBlock:v45];

      int v21 = v46;
    }
  }
  else
  {
    uint64_t v27 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v28 = v12;
    id v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      __int16 v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v52 = v30;
      __int16 v53 = 2112;
      id v54 = v8;
      _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_ERROR, "%{public}@Cannot apply software update with no version: %@", buf, 0x16u);
    }
    id v31 = [(HMAccessorySoftwareUpdateControllerV2 *)v28 context];
    __int16 v32 = [v31 delegateCaller];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __82__HMAccessorySoftwareUpdateControllerV2_applySoftwareUpdate_accessory_completion___block_invoke;
    v47[3] = &unk_1E59454C0;
    id v48 = v10;
    [v32 invokeBlock:v47];

    os_log_type_t v16 = v48;
  }
}

void __82__HMAccessorySoftwareUpdateControllerV2_applySoftwareUpdate_accessory_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __82__HMAccessorySoftwareUpdateControllerV2_applySoftwareUpdate_accessory_completion___block_invoke_47(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __82__HMAccessorySoftwareUpdateControllerV2_applySoftwareUpdate_accessory_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v24 = v11;
      __int16 v25 = 2112;
      id v26 = v5;
      uint64_t v12 = "%{public}@Failed to start software update with error: %@";
      uint64_t v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 22;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v13, v14, v12, buf, v15);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v24 = v11;
    uint64_t v12 = "%{public}@Successfully started software update";
    uint64_t v13 = v10;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    uint32_t v15 = 12;
    goto LABEL_6;
  }

  os_log_type_t v16 = [*(id *)(a1 + 32) context];
  uint64_t v17 = [v16 delegateCaller];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __82__HMAccessorySoftwareUpdateControllerV2_applySoftwareUpdate_accessory_completion___block_invoke_48;
  v20[3] = &unk_1E59454E8;
  id v18 = *(id *)(a1 + 40);
  id v21 = v5;
  id v22 = v18;
  id v19 = v5;
  [v17 invokeBlock:v20];
}

uint64_t __82__HMAccessorySoftwareUpdateControllerV2_applySoftwareUpdate_accessory_completion___block_invoke_48(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)scanForSoftwareUpdateOnAccessories:(id)a3 withOptions:(unint64_t)a4 completion:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x19F3A64A0]();
  id v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v31 = v13;
    __int16 v32 = 2112;
    id v33 = v8;
    __int16 v34 = 2048;
    unint64_t v35 = a4;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Scanning for software update on accessories: %@ with options: %lu", buf, 0x20u);
  }
  os_log_type_t v14 = objc_opt_class();
  uint32_t v15 = [(HMAccessorySoftwareUpdateControllerV2 *)v11 home];
  os_log_type_t v16 = [v14 accessoryUUIDsForAccessoryIdentifiers:v8 home:v15];
  uint64_t v17 = objc_msgSend(v16, "na_map:", &__block_literal_global_30_8390);

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __99__HMAccessorySoftwareUpdateControllerV2_scanForSoftwareUpdateOnAccessories_withOptions_completion___block_invoke_2;
  v29[3] = &unk_1E593EC28;
  v29[4] = v11;
  v29[5] = a4;
  id v18 = objc_msgSend(v17, "na_map:", v29);
  id v19 = (void *)MEMORY[0x1E4F7A0D8];
  __int16 v20 = (void *)MEMORY[0x1E4F7A0F0];
  id v21 = [(HMAccessorySoftwareUpdateControllerV2 *)v11 context];
  id v22 = [v21 queue];
  __int16 v23 = [v20 schedulerWithDispatchQueue:v22];
  id v24 = [v19 combineAllFutures:v18 scheduler:v23];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __99__HMAccessorySoftwareUpdateControllerV2_scanForSoftwareUpdateOnAccessories_withOptions_completion___block_invoke_39;
  v27[3] = &unk_1E593EC70;
  v27[4] = v11;
  id v28 = v9;
  id v25 = v9;
  id v26 = (id)[v24 addCompletionBlock:v27];
}

id __99__HMAccessorySoftwareUpdateControllerV2_scanForSoftwareUpdateOnAccessories_withOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F654B0];
  id v19 = @"HMAccessorySoftwareUpdateControllerV2MessageKeyScanOptions";
  id v4 = NSNumber;
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a2;
  id v7 = [v4 numberWithUnsignedInteger:v5];
  v20[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  id v9 = [v3 messageWithName:@"HMAccessorySoftwareUpdateControllerV2ScanMessage" destination:v6 payload:v8];

  id v10 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __99__HMAccessorySoftwareUpdateControllerV2_scanForSoftwareUpdateOnAccessories_withOptions_completion___block_invoke_3;
  v17[3] = &unk_1E59455E8;
  v17[4] = *(void *)(a1 + 32);
  id v11 = v10;
  id v18 = v11;
  [v9 setResponseHandler:v17];
  uint64_t v12 = [*(id *)(a1 + 32) context];
  uint64_t v13 = [v12 messageDispatcher];
  [v13 sendMessage:v9];

  os_log_type_t v14 = v18;
  id v15 = v11;

  return v15;
}

void __99__HMAccessorySoftwareUpdateControllerV2_scanForSoftwareUpdateOnAccessories_withOptions_completion___block_invoke_39(uint64_t a1, void *a2)
{
  char v3 = objc_msgSend(a2, "na_any:", &__block_literal_global_43);
  id v4 = [*(id *)(a1 + 32) context];
  uint64_t v5 = [v4 delegateCaller];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __99__HMAccessorySoftwareUpdateControllerV2_scanForSoftwareUpdateOnAccessories_withOptions_completion___block_invoke_3_44;
  v7[3] = &unk_1E5941420;
  id v6 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  char v9 = v3;
  id v8 = v6;
  [v5 invokeBlock:v7];
}

uint64_t __99__HMAccessorySoftwareUpdateControllerV2_scanForSoftwareUpdateOnAccessories_withOptions_completion___block_invoke_3_44(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    id v6 = HMFBooleanToString();
    int v8 = 138543618;
    char v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling completion with didFindUpdate: %@", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __99__HMAccessorySoftwareUpdateControllerV2_scanForSoftwareUpdateOnAccessories_withOptions_completion___block_invoke_2_40(uint64_t a1, void *a2)
{
  return [a2 BOOLValue];
}

void __99__HMAccessorySoftwareUpdateControllerV2_scanForSoftwareUpdateOnAccessories_withOptions_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  char v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    __int16 v10 = HMFGetLogIdentifier();
    int v21 = 138543362;
    id v22 = v10;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Received response for HMAccessorySoftwareUpdateControllerV2ScanMessage", (uint8_t *)&v21, 0xCu);
  }
  if (v5)
  {
    id v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      os_log_type_t v14 = HMFGetLogIdentifier();
      int v21 = 138543618;
      id v22 = v14;
      __int16 v23 = 2112;
      id v24 = v5;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Scan message failed with error: %@", (uint8_t *)&v21, 0x16u);
    }
    [*(id *)(a1 + 40) finishWithResult:MEMORY[0x1E4F1CC28]];
  }
  else
  {
    id v15 = objc_msgSend(v6, "hmf_numberForKey:", @"HMAccessorySoftwareUpdateControllerV2MessageKeyScanDidFindUpdate");
    os_log_type_t v16 = v15;
    if (!v15)
    {
      uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
      id v18 = *(id *)(a1 + 32);
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        __int16 v20 = HMFGetLogIdentifier();
        int v21 = 138543362;
        id v22 = v20;
        _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Message did not contain required key in response: HMAccessorySoftwareUpdateControllerV2MessageKeyScanDidFindUpdate", (uint8_t *)&v21, 0xCu);
      }
      os_log_type_t v16 = (void *)MEMORY[0x1E4F1CC28];
    }
    [*(id *)(a1 + 40) finishWithResult:v16];
  }
}

id __99__HMAccessorySoftwareUpdateControllerV2_scanForSoftwareUpdateOnAccessories_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F65488];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithTarget:v3];

  return v4;
}

- (void)subscribe:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  char v9 = self;
  __int16 v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v24 = v11;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Subscribing to accessories with identifiers: %@", buf, 0x16u);
  }
  id v12 = objc_opt_class();
  uint64_t v13 = [(HMAccessorySoftwareUpdateControllerV2 *)v9 home];
  os_log_type_t v14 = [v12 topicFiltersForAccessoryIdentifiers:v6 home:v13];

  id v15 = (void *)MEMORY[0x19F3A64A0]();
  os_log_type_t v16 = v9;
  uint64_t v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v24 = v18;
    __int16 v25 = 2112;
    id v26 = v14;
    _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_INFO, "%{public}@Subscribing to topicFilters: %@", buf, 0x16u);
  }
  id v19 = [(HMAccessorySoftwareUpdateControllerV2 *)v16 subscriptionProvider];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __62__HMAccessorySoftwareUpdateControllerV2_subscribe_completion___block_invoke;
  v21[3] = &unk_1E5941AC0;
  v21[4] = v16;
  id v22 = v7;
  id v20 = v7;
  [v19 registerConsumer:v16 topicFilters:v14 completion:v21];
}

void __62__HMAccessorySoftwareUpdateControllerV2_subscribe_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = [NSString stringWithFormat:@"error: %@, ", v6];
  }
  else
  {
    id v7 = &stru_1EEE9DD88;
  }
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = *(id *)(a1 + 32);
  __int16 v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v24 = v11;
    __int16 v25 = 2112;
    id v26 = v7;
    __int16 v27 = 2112;
    id v28 = v5;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Subscribed with %@cachedEvents: %@", buf, 0x20u);
  }
  id v12 = [*(id *)(a1 + 32) context];
  uint64_t v13 = [v12 delegateCaller];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __62__HMAccessorySoftwareUpdateControllerV2_subscribe_completion___block_invoke_20;
  v20[3] = &unk_1E59454E8;
  id v14 = *(id *)(a1 + 40);
  id v21 = v6;
  id v22 = v14;
  id v15 = v6;
  [v13 invokeBlock:v20];

  os_log_type_t v16 = objc_msgSend(v5, "na_filter:", &__block_literal_global_8408);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __62__HMAccessorySoftwareUpdateControllerV2_subscribe_completion___block_invoke_3;
  v19[3] = &unk_1E5941A98;
  v19[4] = *(void *)(a1 + 32);
  objc_msgSend(v16, "na_each:", v19);

  uint64_t v17 = objc_msgSend(v5, "na_filter:", &__block_literal_global_26);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __62__HMAccessorySoftwareUpdateControllerV2_subscribe_completion___block_invoke_5;
  v18[3] = &unk_1E5941A98;
  v18[4] = *(void *)(a1 + 32);
  objc_msgSend(v17, "na_each:", v18);
}

uint64_t __62__HMAccessorySoftwareUpdateControllerV2_subscribe_completion___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __62__HMAccessorySoftwareUpdateControllerV2_subscribe_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleDidReceiveEvent:a3 topic:a2];
}

uint64_t __62__HMAccessorySoftwareUpdateControllerV2_subscribe_completion___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleDidReceiveEvent:a3 topic:a2];
}

BOOL __62__HMAccessorySoftwareUpdateControllerV2_subscribe_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v2 = +[HMEventTopicHelper decodeTopic:a2];
  id v3 = [v2 asAccessoryTopic];

  BOOL v4 = [v3 accessoryEventTopicSuffixID] == 507;
  return v4;
}

BOOL __62__HMAccessorySoftwareUpdateControllerV2_subscribe_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = +[HMEventTopicHelper decodeTopic:a2];
  id v3 = [v2 asAccessoryTopic];

  BOOL v4 = [v3 accessoryEventTopicSuffixID] == 506;
  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t39 != -1) {
    dispatch_once(&logCategory__hmf_once_t39, &__block_literal_global_61);
  }
  id v2 = (void *)logCategory__hmf_once_v40;

  return v2;
}

uint64_t __52__HMAccessorySoftwareUpdateControllerV2_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v40;
  logCategory__hmf_once_uint64_t v40 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)softwareUpdateFromSoftwareUpdateV2:(id)a3
{
  id v3 = a3;
  BOOL v4 = [HMSoftwareUpdate alloc];
  id v5 = [v3 version];
  uint64_t v6 = [v3 downloadSize];
  id v7 = [v3 documentationMetadata];

  id v8 = [(HMSoftwareUpdate *)v4 initWithVersion:v5 downloadSize:v6 state:2 documentationMetadata:v7];

  return v8;
}

+ (id)accessoryUUIDsForAccessoryIdentifiers:(id)a3 home:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 allObjects];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84__HMAccessorySoftwareUpdateControllerV2_accessoryUUIDsForAccessoryIdentifiers_home___block_invoke;
  v17[3] = &unk_1E593ECC0;
  id v9 = v7;
  id v18 = v9;
  __int16 v10 = objc_msgSend(v8, "na_map:", v17);

  uint64_t v11 = [v10 count];
  if (v11 != [v6 count])
  {
    id v12 = (void *)MEMORY[0x19F3A64A0]();
    id v13 = a1;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v20 = v15;
      __int16 v21 = 2112;
      id v22 = v6;
      __int16 v23 = 2112;
      id v24 = v10;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert all identifiers to uuids. Identifiers: %@, uuids: %@", buf, 0x20u);
    }
  }

  return v10;
}

id __84__HMAccessorySoftwareUpdateControllerV2_accessoryUUIDsForAccessoryIdentifiers_home___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) accessoryWithUniqueIdentifier:a2];
  id v3 = [v2 uuid];

  return v3;
}

+ (id)topicFiltersForAccessoryIdentifiers:(id)a3 home:(id)a4
{
  id v6 = a4;
  id v7 = [a3 allObjects];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__HMAccessorySoftwareUpdateControllerV2_topicFiltersForAccessoryIdentifiers_home___block_invoke;
  v11[3] = &unk_1E593EC98;
  id v12 = v6;
  id v13 = a1;
  id v8 = v6;
  id v9 = objc_msgSend(v7, "na_flatMap:", v11);

  return v9;
}

id __82__HMAccessorySoftwareUpdateControllerV2_topicFiltersForAccessoryIdentifiers_home___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) accessoryWithUniqueIdentifier:v3];
  id v5 = [v4 uuid];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) uuid];
    id v7 = +[HMAccessoryEventTopic topicFromSuffixID:506 homeUUID:v6 accessoryUUID:v5];
    id v8 = objc_msgSend(*(id *)(a1 + 32), "uuid", v7);
    id v9 = +[HMAccessoryEventTopic topicFromSuffixID:507 homeUUID:v8 accessoryUUID:v5];
    v16[1] = v9;
    __int16 v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = *(id *)(a1 + 40);
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v18 = v14;
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to find accessory UUID for uniqueIdentifier: %@", buf, 0x16u);
    }
    __int16 v10 = 0;
  }

  return v10;
}

@end