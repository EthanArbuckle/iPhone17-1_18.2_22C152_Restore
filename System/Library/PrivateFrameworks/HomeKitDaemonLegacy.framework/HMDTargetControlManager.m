@interface HMDTargetControlManager
+ (id)logCategory;
- (HMDAccessory)targetAccessory;
- (HMDSiriServer)siriServer;
- (HMDTargetControlManager)init;
- (HMDTargetControlManager)initWithTargetAccessory:(id)a3 controllers:(id)a4;
- (NSMutableArray)activeControlServices;
- (NSMutableArray)configuredControllers;
- (NSMutableArray)eventReceivers;
- (NSString)logID;
- (OS_dispatch_queue)workQueue;
- (id)__getOrCreateEventReceiver:(id)a3;
- (id)__selectButtonConfiguration:(id)a3 receiver:(id)a4;
- (void)__accessoryAdded:(id)a3;
- (void)__accessoryConnected:(id)a3;
- (void)__accessoryDisconnected:(id)a3;
- (void)__accessoryNameUpdated:(id)a3;
- (void)__accessoryRemoved:(id)a3;
- (void)__activeSelectionChanged:(id)a3;
- (void)__activeSelectionReset:(id)a3;
- (void)__characteristicsEventsReceived:(id)a3;
- (void)__controllerRefreshedConfiguration:(id)a3;
- (void)__serviceRemoved:(id)a3;
- (void)__targetAccessoryConfiguredForControl:(id)a3;
- (void)__targetAccessoryUnconfiguredForControl:(id)a3;
- (void)_addController:(id)a3;
- (void)_handleButtonEvent:(id)a3 fromControlService:(id)a4;
- (void)_handleControllerDisconnected:(id)a3;
- (void)_handleTargetControlServiceDeselection:(id)a3;
- (void)_handleTargetControlServiceSelection:(id)a3;
- (void)_removeController:(id)a3;
- (void)_targetAccessoryConfiguredWithController:(id)a3;
- (void)_targetAccessoryRefreshConfigurationWithController:(id)a3 userInfo:(id)a4;
- (void)_targetAccessoryUnconfiguredWithController:(id)a3;
- (void)addControlService:(id)a3;
- (void)addReceiver:(id)a3;
- (void)addTargetControllers:(id)a3;
- (void)invalidate;
- (void)removeControlService:(id)a3;
- (void)removeReceiver:(id)a3;
- (void)setSiriServer:(id)a3;
@end

@implementation HMDTargetControlManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriServer, 0);
  objc_storeStrong((id *)&self->_logID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_eventReceivers, 0);
  objc_storeStrong((id *)&self->_activeControlServices, 0);
  objc_storeStrong((id *)&self->_configuredControllers, 0);
  objc_destroyWeak((id *)&self->_targetAccessory);
}

- (void)setSiriServer:(id)a3
{
}

- (HMDSiriServer)siriServer
{
  return self->_siriServer;
}

- (NSString)logID
{
  return self->_logID;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDAccessory)targetAccessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetAccessory);
  return (HMDAccessory *)WeakRetained;
}

- (void)__activeSelectionReset:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  v8 = [v7 accessory];
  v9 = (void *)MEMORY[0x1D9452090]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    v13 = [v8 name];
    v14 = [v7 name];
    *(_DWORD *)buf = 138543874;
    v31 = v12;
    __int16 v32 = 2112;
    v33 = v13;
    __int16 v34 = 2112;
    v35 = v14;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Received notification that controller %@ service %@ reset its active selection", buf, 0x20u);
  }
  v15 = [(HMDTargetControlManager *)v10 configuredControllers];
  if ([v15 containsObject:v8])
  {
    v16 = (void *)MEMORY[0x1D9452090]();
    v17 = v10;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = HMFGetLogIdentifier();
      v20 = [v8 name];
      v21 = [v7 name];
      *(_DWORD *)buf = 138543874;
      v31 = v19;
      __int16 v32 = 2112;
      v33 = v20;
      __int16 v34 = 2112;
      v35 = v21;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Received notification that a configured controller %@ service %@ has reset its active selection", buf, 0x20u);
    }
    v22 = [(HMDTargetControlManager *)v17 activeControlServices];
    if ([v22 containsObject:v7])
    {
      v23 = (void *)MEMORY[0x1D9452090]();
      v24 = v17;
      v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = HMFGetLogIdentifier();
        v27 = [v8 name];
        [v7 name];
        v28 = v29 = v23;
        *(_DWORD *)buf = 138543874;
        v31 = v26;
        __int16 v32 = 2112;
        v33 = v27;
        __int16 v34 = 2112;
        v35 = v28;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Received notification that a configured controller %@ service %@ has deselected this target accessory", buf, 0x20u);

        v23 = v29;
      }

      [(HMDTargetControlManager *)v24 _handleTargetControlServiceDeselection:v7];
    }
  }
}

- (void)__activeSelectionChanged:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  v8 = [v7 accessory];
  v9 = [(HMDTargetControlManager *)self configuredControllers];
  v10 = [v4 userInfo];
  v60 = objc_msgSend(v10, "hmf_numberForKey:", @"activeIdentifier");

  v11 = (void *)MEMORY[0x1D9452090]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    [v8 name];
    v58 = v9;
    v15 = v8;
    v17 = id v16 = v4;
    v18 = [v7 name];
    v19 = [(HMDTargetControlManager *)v12 configuredControllers];
    *(_DWORD *)buf = 138544386;
    v62 = v14;
    __int16 v63 = 2112;
    v64 = v17;
    __int16 v65 = 2112;
    uint64_t v66 = (uint64_t)v18;
    __int16 v67 = 2112;
    v68 = v19;
    __int16 v69 = 2112;
    v70 = v60;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Received notification that controller %@ service %@ changed active selection - configuredControllers %@  identifier %@", buf, 0x34u);

    id v4 = v16;
    v8 = v15;
    v9 = v58;
  }
  if ([v9 containsObject:v8] && v60)
  {
    v20 = (void *)MEMORY[0x1D9452090]();
    v21 = v12;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      v24 = [v8 name];
      v25 = [v7 name];
      *(_DWORD *)buf = 138544130;
      v62 = v23;
      __int16 v63 = 2112;
      v64 = v24;
      __int16 v65 = 2112;
      uint64_t v66 = (uint64_t)v25;
      __int16 v67 = 2112;
      v68 = v60;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Received notification that a configured controller %@ service %@ changed active selection to %@", buf, 0x2Au);
    }
    id v59 = v4;

    v26 = [(HMDTargetControlManager *)v21 targetAccessory];
    v27 = [v26 home];
    if (v27)
    {
      int v28 = [v60 unsignedIntegerValue];
      v29 = [v26 uuid];
      v30 = [v27 uuid];
      int v31 = identifierForTargetWithUUID(v29, v30);

      __int16 v32 = [(HMDTargetControlManager *)v21 activeControlServices];
      v33 = v32;
      if (v31 == v28)
      {
        __int16 v34 = (void *)MEMORY[0x1D9452090]();
        v35 = v21;
        uint64_t v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v37 = v52 = v34;
          v38 = [v8 name];
          [v7 name];
          v39 = v55 = v33;
          *(_DWORD *)buf = 138543874;
          v62 = v37;
          __int16 v63 = 2112;
          v64 = v38;
          __int16 v65 = 2112;
          uint64_t v66 = (uint64_t)v39;
          _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_INFO, "%{public}@Received notification that a configured controller %@ service %@ has selected this target accessory", buf, 0x20u);

          v33 = v55;
          __int16 v34 = v52;
        }

        [(HMDTargetControlManager *)v35 _handleTargetControlServiceSelection:v7];
      }
      else if ([v32 containsObject:v7])
      {
        v47 = (void *)MEMORY[0x1D9452090]();
        v48 = v21;
        v49 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          v57 = HMFGetLogIdentifier();
          v50 = [v8 name];
          [v7 name];
          v51 = v54 = v47;
          *(_DWORD *)buf = 138543874;
          v62 = v57;
          __int16 v63 = 2112;
          v64 = v50;
          __int16 v65 = 2112;
          uint64_t v66 = (uint64_t)v51;
          _os_log_impl(&dword_1D49D5000, v49, OS_LOG_TYPE_INFO, "%{public}@Received notification that a configured controller %@ service %@ has deselected this target accessory", buf, 0x20u);

          v47 = v54;
        }

        [(HMDTargetControlManager *)v48 _handleTargetControlServiceDeselection:v7];
      }
    }
    else
    {
      v40 = (void *)MEMORY[0x1D9452090]();
      v41 = v21;
      v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v53 = HMFGetLogIdentifier();
        [v26 name];
        v43 = v56 = v40;
        v44 = [v26 uuid];
        uint64_t v45 = [v44 UUIDString];
        *(_DWORD *)buf = 138543874;
        v62 = v53;
        __int16 v63 = 2112;
        v64 = v43;
        __int16 v65 = 2112;
        uint64_t v66 = v45;
        v46 = (void *)v45;
        _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@Attempting to process active selection change for a target %@/%@ that is not configured with a home", buf, 0x20u);

        v40 = v56;
      }
    }
    id v4 = v59;
  }
}

- (void)_handleTargetControlServiceDeselection:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDTargetControlManager *)self activeControlServices];
  v6 = [v4 type];
  if ([v6 isEqualToString:*MEMORY[0x1E4F2DEE0]])
  {
  }
  else
  {
    char v7 = [v5 containsObject:v4];

    if ((v7 & 1) == 0) {
      goto LABEL_7;
    }
  }
  v8 = [v4 accessory];
  v9 = (void *)MEMORY[0x1D9452090]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    v13 = [v8 name];
    v14 = [v4 instanceID];
    int v16 = 138543874;
    v17 = v12;
    __int16 v18 = 2112;
    v19 = v13;
    __int16 v20 = 2112;
    v21 = v14;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Received notification that control service %@/%@  is not actively controlling this target accessory", (uint8_t *)&v16, 0x20u);
  }
  [(HMDTargetControlManager *)v10 removeControlService:v4];
  v15 = [(HMDTargetControlManager *)v10 __getOrCreateEventReceiver:v8];
  [v15 setSelected:0];
  [v8 acknowledgeTargetControlService:v4 active:0];

LABEL_7:
}

- (void)_handleTargetControlServiceSelection:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 accessory];
  v6 = (void *)MEMORY[0x1D9452090]();
  char v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = [v5 name];
    v11 = [v4 name];
    int v13 = 138543874;
    v14 = v9;
    __int16 v15 = 2112;
    int v16 = v10;
    __int16 v17 = 2112;
    __int16 v18 = v11;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Tracking controller %@ service %@ for active selection", (uint8_t *)&v13, 0x20u);
  }
  [(HMDTargetControlManager *)v7 addControlService:v4];
  v12 = [(HMDTargetControlManager *)v7 __getOrCreateEventReceiver:v5];
  [v12 setSelected:1];
  [v5 acknowledgeTargetControlService:v4 active:1];
}

- (void)_handleControllerDisconnected:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  char v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [v4 name];
    v10 = [(HMDTargetControlManager *)v6 targetAccessory];
    v11 = [v10 name];
    *(_DWORD *)buf = 138543874;
    int v28 = v8;
    __int16 v29 = 2112;
    v30 = v9;
    __int16 v31 = 2112;
    __int16 v32 = v11;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Received notification that controller %@ for target accessory %@ is disconnected - marking as deselected for target control", buf, 0x20u);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v12 = objc_msgSend(v4, "services", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    uint64_t v16 = *MEMORY[0x1E4F2DEE0];
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        __int16 v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v19 = [v18 type];
        int v20 = [v19 isEqualToString:v16];

        if (v20)
        {
          [(HMDTargetControlManager *)v6 removeControlService:v18];
          v21 = [(HMDTargetControlManager *)v6 __getOrCreateEventReceiver:v4];
          [v21 setConnected:0];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }
}

- (void)_targetAccessoryUnconfiguredWithController:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDTargetControlManager *)self configuredControllers];
  int v6 = [v5 containsObject:v4];
  char v7 = (void *)MEMORY[0x1D9452090]();
  v46 = self;
  v8 = HMFGetOSLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v9)
    {
      v10 = HMFGetLogIdentifier();
      v11 = [v4 name];
      *(_DWORD *)buf = 138543618;
      v53 = v10;
      __int16 v54 = 2112;
      v55 = v11;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing controller %@ from list of controllers", buf, 0x16u);
    }
    [(HMDTargetControlManager *)v46 _removeController:v4];
  }
  else
  {
    if (v9)
    {
      v12 = HMFGetLogIdentifier();
      uint64_t v13 = [v4 name];
      uint64_t v14 = [(HMDTargetControlManager *)v46 targetAccessory];
      uint64_t v15 = [v14 name];
      *(_DWORD *)buf = 138543874;
      v53 = v12;
      __int16 v54 = 2112;
      v55 = v13;
      __int16 v56 = 2112;
      v57 = v15;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Controller %@ is not configured for controlling target accessory %@", buf, 0x20u);
    }
  }
  uint64_t v16 = [v4 home];
  if (v16)
  {
    v43 = v5;
    __int16 v17 = [v4 uuid];
    v42 = v16;
    __int16 v18 = [v16 uuid];
    uint64_t v19 = identifierForTargetWithUUID(v17, v18);

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    int v20 = [(HMDTargetControlManager *)v46 eventReceivers];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v48;
      do
      {
        uint64_t v24 = 0;
        uint64_t v44 = v22;
        do
        {
          if (*(void *)v48 != v23) {
            objc_enumerationMutation(v20);
          }
          long long v25 = *(void **)(*((void *)&v47 + 1) + 8 * v24);
          if ([v25 identifier] == v19)
          {
            v26 = (void *)MEMORY[0x1D9452090]();
            v27 = v46;
            int v28 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v29 = uint64_t v45 = v26;
              [v4 name];
              uint64_t v30 = v23;
              __int16 v31 = v20;
              uint64_t v32 = v19;
              __int16 v34 = v33 = v4;
              *(_DWORD *)buf = 138543618;
              v53 = v29;
              __int16 v54 = 2112;
              v55 = v34;
              _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Removing receiver %@ from list of receivers", buf, 0x16u);

              id v4 = v33;
              uint64_t v19 = v32;
              int v20 = v31;
              uint64_t v23 = v30;
              uint64_t v22 = v44;

              v26 = v45;
            }

            [(HMDTargetControlManager *)v27 removeReceiver:v25];
          }
          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v22);
    }

    uint64_t v16 = v42;
    v5 = v43;
  }
  else
  {
    v35 = (void *)MEMORY[0x1D9452090]();
    uint64_t v36 = v46;
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = HMFGetLogIdentifier();
      v39 = [v4 name];
      v40 = [v4 uuid];
      v41 = [v40 UUIDString];
      *(_DWORD *)buf = 138543874;
      v53 = v38;
      __int16 v54 = 2112;
      v55 = v39;
      __int16 v56 = 2112;
      v57 = v41;
      _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_ERROR, "%{public}@Attempting to lookup or create an event receiver for a %@/%@ that is not configured with a home", buf, 0x20u);
    }
  }
}

- (void)_targetAccessoryConfiguredWithController:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDTargetControlManager *)self configuredControllers];
  int v6 = [v5 containsObject:v4];
  char v7 = (void *)MEMORY[0x1D9452090]();
  v8 = self;
  BOOL v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v10)
    {
      v11 = HMFGetLogIdentifier();
      v12 = [v4 name];
      uint64_t v13 = [(HMDTargetControlManager *)v8 targetAccessory];
      uint64_t v14 = [v13 name];
      int v18 = 138543874;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      uint64_t v21 = v12;
      __int16 v22 = 2112;
      uint64_t v23 = v14;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Controller %@ already configured for controlling target accessory %@", (uint8_t *)&v18, 0x20u);
    }
  }
  else
  {
    if (v10)
    {
      uint64_t v15 = HMFGetLogIdentifier();
      uint64_t v16 = [v4 name];
      int v18 = 138543618;
      uint64_t v19 = v15;
      __int16 v20 = 2112;
      uint64_t v21 = v16;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Adding controller %@ to the list of configuredControllers and registering for notifications ", (uint8_t *)&v18, 0x16u);
    }
    [(HMDTargetControlManager *)v8 _addController:v4];
    __int16 v17 = [(HMDTargetControlManager *)v8 __getOrCreateEventReceiver:v4];
    objc_msgSend(v17, "setConnected:", objc_msgSend(v4, "isReachable"));
  }
  [v4 registerForActiveIdentifierNotifications];
}

- (void)__characteristicsEventsReceived:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  uint64_t v30 = [v31 userInfo];
  id v4 = objc_msgSend(v30, "hmf_arrayForKey:", *MEMORY[0x1E4F5B7D0]);
  v5 = [(HMDTargetControlManager *)self activeControlServices];
  v38 = self;
  v42 = [(HMDTargetControlManager *)self targetAccessory];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v41 = *(void *)v44;
    uint64_t v8 = *MEMORY[0x1E4F2DEE0];
    uint64_t v39 = *MEMORY[0x1E4F2CE68];
    v37 = v5;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v44 != v41) {
          objc_enumerationMutation(obj);
        }
        BOOL v10 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v11 = [v42 home];
        v12 = [v10 serverIdentifier];
        uint64_t v13 = [v10 accessoryInstanceID];
        uint64_t v14 = [v11 hapAccessoryWithIdentifier:v12 instanceID:v13];

        uint64_t v15 = [v10 serviceInstanceID];
        uint64_t v16 = [v14 findService:v15];

        __int16 v17 = [v16 type];
        if ([v17 isEqualToString:v8])
        {
          int v18 = [v5 containsObject:v16];

          if (!v18) {
            goto LABEL_19;
          }
          uint64_t v19 = [v10 characteristicInstanceID];
          __int16 v17 = [v16 findCharacteristic:v19];

          __int16 v20 = [v17 type];
          int v21 = [v20 isEqualToString:v39];

          if (v21)
          {
            __int16 v22 = [v10 value];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v23 = v22;
            }
            else {
              uint64_t v23 = 0;
            }
            id v24 = v23;

            if (v24)
            {
              [(HMDTargetControlManager *)v38 _handleButtonEvent:v24 fromControlService:v16];
            }
            else
            {
              context = (void *)MEMORY[0x1D9452090]();
              long long v25 = v38;
              v26 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                v35 = HMFGetLogIdentifier();
                [v10 value];
                uint64_t v32 = v34 = v25;
                id v33 = [v16 accessory];
                v27 = [v33 name];
                uint64_t v28 = [v16 instanceID];
                *(_DWORD *)buf = 138544130;
                long long v48 = v35;
                __int16 v49 = 2112;
                long long v50 = v32;
                __int16 v51 = 2112;
                v52 = v27;
                __int16 v53 = 2112;
                uint64_t v54 = v28;
                __int16 v29 = (void *)v28;
                _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Button event data not NSData but %@ from control service %@/%@", buf, 0x2Au);

                long long v25 = v34;
              }
            }

            v5 = v37;
          }
        }

LABEL_19:
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v43 objects:v55 count:16];
    }
    while (v7);
  }
}

- (void)_handleButtonEvent:(id)a3 fromControlService:(id)a4
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  [v8 bytes];
  [v8 length];
  int v107 = 0;
  v102 = v7;
  BOOL v9 = [v7 accessory];
  BOOL v10 = [v9 home];
  v101 = [(HMDTargetControlManager *)self targetAccessory];
  unsigned __int8 UInt64 = TLV8GetUInt64();
  unint64_t v97 = TLV8GetUInt64();
  uint64_t v96 = TLV8GetUInt64();
  unsigned int v98 = TLV8GetUInt64();
  v12 = (void *)MEMORY[0x1D9452090]();
  uint64_t v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  v100 = v10;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    uint64_t v16 = v9;
    id v17 = v8;
    unint64_t v18 = UInt64;
    unsigned __int8 v94 = UInt64;
    if (v97 == 1) {
      uint64_t v19 = @"Down";
    }
    else {
      uint64_t v19 = @"Up";
    }
    v92 = v12;
    __int16 v20 = [v102 accessory];
    int v21 = [v20 name];
    __int16 v22 = [v102 instanceID];
    *(_DWORD *)buf = 138544898;
    v114 = v15;
    __int16 v115 = 2048;
    unint64_t v116 = v18;
    id v8 = v17;
    BOOL v9 = v16;
    __int16 v117 = 2112;
    uint64_t v118 = (uint64_t)v19;
    unsigned __int8 UInt64 = v94;
    __int16 v119 = 2048;
    uint64_t v120 = v96;
    __int16 v121 = 2048;
    uint64_t v122 = v98;
    __int16 v123 = 2112;
    v124 = v21;
    __int16 v125 = 2112;
    v126 = v22;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Button %lu changed to '%@' with timestamp %lu for target %lu from control service %@/%@", buf, 0x48u);

    v12 = v92;
    BOOL v10 = v100;
  }
  if (!v10)
  {
    long long v46 = (void *)MEMORY[0x1D9452090]();
    long long v47 = v13;
    long long v48 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      __int16 v49 = HMFGetLogIdentifier();
      long long v50 = [v9 name];
      __int16 v51 = [v9 uuid];
      [v51 UUIDString];
      __int16 v53 = v52 = v9;
      *(_DWORD *)buf = 138543874;
      v114 = v49;
      __int16 v115 = 2112;
      unint64_t v116 = (unint64_t)v50;
      __int16 v117 = 2112;
      uint64_t v118 = (uint64_t)v53;
      _os_log_impl(&dword_1D49D5000, v48, OS_LOG_TYPE_ERROR, "%{public}@Attempting to lookup or create an event receiver for a configured controller %@/%@ that is not configured with a home", buf, 0x20u);

      BOOL v9 = v52;
      BOOL v10 = 0;
    }
    uint64_t v54 = 0;
    id v29 = 0;
    goto LABEL_39;
  }
  uint64_t v23 = [v9 uuid];
  id v24 = [v10 uuid];
  int v25 = identifierForTargetWithUUID(v23, v24);

  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  v26 = [(HMDTargetControlManager *)v13 eventReceivers];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v103 objects:v112 count:16];
  if (!v27)
  {

LABEL_31:
    v55 = (void *)MEMORY[0x1D9452090]();
    uint64_t v56 = v13;
    v57 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      uint64_t v58 = HMFGetLogIdentifier();
      id v59 = [v9 name];
      v60 = [v9 uuid];
      [v60 UUIDString];
      v62 = v61 = v9;
      *(_DWORD *)buf = 138543874;
      v114 = v58;
      __int16 v115 = 2112;
      unint64_t v116 = (unint64_t)v59;
      __int16 v117 = 2112;
      uint64_t v118 = (uint64_t)v62;
      _os_log_impl(&dword_1D49D5000, v57, OS_LOG_TYPE_INFO, "%{public}@No event receiver set up for controller %@/%@", buf, 0x20u);

      BOOL v9 = v61;
    }

    uint64_t v54 = 0;
    id v29 = 0;
    goto LABEL_38;
  }
  uint64_t v28 = v27;
  id v93 = v8;
  unsigned __int8 v95 = UInt64;
  id v29 = 0;
  uint64_t v30 = *(void *)v104;
  do
  {
    for (uint64_t i = 0; i != v28; ++i)
    {
      if (*(void *)v104 != v30) {
        objc_enumerationMutation(v26);
      }
      uint64_t v32 = *(void **)(*((void *)&v103 + 1) + 8 * i);
      if ([v32 identifier] == v25)
      {
        id v33 = v32;

        id v29 = v33;
      }
    }
    uint64_t v28 = [v26 countByEnumeratingWithState:&v103 objects:v112 count:16];
  }
  while (v28);

  id v8 = v93;
  if (!v29) {
    goto LABEL_31;
  }
  __int16 v34 = [v101 uuid];
  v35 = [v101 home];
  uint64_t v36 = [v35 uuid];
  unsigned int v37 = identifierForTargetWithUUID(v34, v36);

  if (v37 != v98)
  {
    __int16 v63 = (void *)MEMORY[0x1D9452090]();
    v64 = v13;
    __int16 v65 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      uint64_t v66 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v114 = v66;
      __int16 v115 = 2048;
      unint64_t v116 = v98;
      __int16 v117 = 2048;
      uint64_t v118 = v37;
      _os_log_impl(&dword_1D49D5000, v65, OS_LOG_TYPE_INFO, "%{public}@Event targetID %lu does not match our target identifier %lu - treating as deselection to avoid receiving additional events", buf, 0x20u);
    }
    [(HMDTargetControlManager *)v64 _handleTargetControlServiceDeselection:v102];
    goto LABEL_37;
  }
  if (v97 >= 2)
  {
    v38 = (void *)MEMORY[0x1D9452090]();
    uint64_t v39 = v13;
    v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      uint64_t v41 = HMFGetLogIdentifier();
      v42 = [v9 name];
      [v9 uuid];
      long long v44 = v43 = v9;
      long long v45 = [v44 UUIDString];
      *(_DWORD *)buf = 138544130;
      v114 = v41;
      __int16 v115 = 2048;
      unint64_t v116 = v97;
      __int16 v117 = 2112;
      uint64_t v118 = (uint64_t)v42;
      __int16 v119 = 2112;
      uint64_t v120 = (uint64_t)v45;
      _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_INFO, "%{public}@Invalid buttonState %lu for controller %@/%@", buf, 0x2Au);

      BOOL v9 = v43;
    }

LABEL_37:
    uint64_t v54 = 0;
LABEL_38:
    BOOL v10 = v100;
    goto LABEL_39;
  }
  __int16 v67 = v13;
  id v29 = v29;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  v68 = [v29 selectedButtons];
  uint64_t v69 = [v68 countByEnumeratingWithState:&v108 objects:buf count:16];
  BOOL v10 = v100;
  if (v69)
  {
    uint64_t v70 = v69;
    uint64_t v71 = *(void *)v109;
    unsigned __int8 v72 = v95;
LABEL_42:
    uint64_t v73 = 0;
    while (1)
    {
      if (*(void *)v109 != v71) {
        objc_enumerationMutation(v68);
      }
      v74 = *(void **)(*((void *)&v108 + 1) + 8 * v73);
      if ([v74 identifier] == v95) {
        break;
      }
      if (v70 == ++v73)
      {
        uint64_t v70 = [v68 countByEnumeratingWithState:&v108 objects:buf count:16];
        if (v70) {
          goto LABEL_42;
        }
        uint64_t v54 = 0;
        goto LABEL_54;
      }
    }
    id v75 = v74;

    if (v75)
    {
      uint64_t v54 = objc_alloc_init(THAButtonEvent);
      [(THAButtonEvent *)v54 setButton:v75];
      if (v97) {
        uint64_t v76 = 1;
      }
      else {
        uint64_t v76 = 2;
      }
      [(THAButtonEvent *)v54 setState:v76];
      -[THAButtonEvent setTimestamp:](v54, "setTimestamp:", (double)(unint64_t)v96 / (double)(unint64_t)[v29 ticksPerSecond]);
      v68 = v75;
LABEL_54:
      id v8 = v93;
      goto LABEL_56;
    }

    id v8 = v93;
  }
  else
  {
    uint64_t v54 = 0;
    unsigned __int8 v72 = v95;
LABEL_56:

    if (v54)
    {
      if ([v29 dispatchButtonEvent:v54]) {
        goto LABEL_39;
      }
      v77 = v9;
      v78 = (void *)MEMORY[0x1D9452090]();
      v79 = v67;
      v80 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
      {
        v81 = HMFGetLogIdentifier();
        unint64_t v82 = v72;
        v83 = [(THAButtonEvent *)v54 button];
        uint64_t v84 = [v83 type];
        *(_DWORD *)buf = 138543874;
        v114 = v81;
        __int16 v115 = 2048;
        unint64_t v116 = v82;
        id v8 = v93;
        __int16 v117 = 2048;
        uint64_t v118 = v84;
        _os_log_impl(&dword_1D49D5000, v80, OS_LOG_TYPE_INFO, "%{public}@Received an event for button with ID %lu/type %lu - consuming in HomeKit layer", buf, 0x20u);
      }
      BOOL v9 = v77;
      goto LABEL_38;
    }
  }
  v85 = (void *)MEMORY[0x1D9452090]();
  v86 = v67;
  v87 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v88 = v99 = v9;
    v89 = [v102 accessory];
    v90 = [v89 name];
    id v8 = v93;
    v91 = [v102 instanceID];
    *(_DWORD *)buf = 138544130;
    v114 = v88;
    __int16 v115 = 2112;
    unint64_t v116 = (unint64_t)v90;
    __int16 v117 = 2112;
    uint64_t v118 = (uint64_t)v91;
    __int16 v119 = 2048;
    uint64_t v120 = v72;
    _os_log_impl(&dword_1D49D5000, v87, OS_LOG_TYPE_INFO, "%{public}@Received an event from control service %@/%@ for a button id %lu that is not mapped into the receiver's selected buttons", buf, 0x2Au);

    BOOL v10 = v100;
    BOOL v9 = v99;
  }

  uint64_t v54 = 0;
LABEL_39:
}

- (id)__getOrCreateEventReceiver:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 home];
  if (v5)
  {
    id v6 = [v4 uuid];
    id v7 = [v5 uuid];
    uint64_t v8 = identifierForTargetWithUUID(v6, v7);

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    BOOL v9 = [(HMDTargetControlManager *)self eventReceivers];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v40 objects:v52 count:16];
    if (!v10)
    {

LABEL_17:
      uint64_t v24 = [v4 supportsSiri];
      int v25 = (void *)MEMORY[0x1D9452090]();
      v26 = self;
      uint64_t v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        uint64_t v28 = HMFGetLogIdentifier();
        HMFBooleanToString();
        id v29 = v39 = v24;
        uint64_t v30 = [v4 name];
        [v4 uuid];
        id v31 = v38 = v25;
        uint64_t v32 = [v31 UUIDString];
        *(_DWORD *)buf = 138544130;
        long long v45 = v28;
        __int16 v46 = 2112;
        long long v47 = v29;
        __int16 v48 = 2112;
        __int16 v49 = v30;
        __int16 v50 = 2112;
        __int16 v51 = v32;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Creating an event receiver (supportsSiri: %@) to handle events from controller %@/%@", buf, 0x2Au);

        int v25 = v38;
        uint64_t v24 = v39;
      }
      id v33 = [v4 targetControllerButtonConfiguration];
      __int16 v34 = mapButtonConfigurationForTVReceiver(v33);

      v35 = [THAController alloc];
      uint64_t v36 = [v4 name];
      v12 = -[THAController initWithName:identifier:ticksPerSecond:supportedButtons:supportsSiri:](v35, "initWithName:identifier:ticksPerSecond:supportedButtons:supportsSiri:", v36, v8, [v4 targetControllerTicksPerSecond], v34, v24);

      [(HMDTargetControlManager *)v26 addReceiver:v12];
      -[THAController setConnected:](v12, "setConnected:", [v4 isReachable]);

      goto LABEL_20;
    }
    uint64_t v11 = v10;
    v12 = 0;
    uint64_t v13 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if ([v15 identifier] == v8)
        {
          uint64_t v16 = v15;

          v12 = v16;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v11);

    if (!v12) {
      goto LABEL_17;
    }
  }
  else
  {
    id v17 = (void *)MEMORY[0x1D9452090]();
    unint64_t v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      int v21 = [v4 name];
      __int16 v22 = [v4 uuid];
      uint64_t v23 = [v22 UUIDString];
      *(_DWORD *)buf = 138543874;
      long long v45 = v20;
      __int16 v46 = 2112;
      long long v47 = v21;
      __int16 v48 = 2112;
      __int16 v49 = v23;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Attempting to lookup or create an event receiver for a configured controller %@/%@ that is not configured with a home", buf, 0x20u);
    }
    v12 = 0;
  }
LABEL_20:

  return v12;
}

- (void)__serviceRemoved:(id)a3
{
  id v4 = a3;
  v5 = [(HMDTargetControlManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__HMDTargetControlManager___serviceRemoved___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __44__HMDTargetControlManager___serviceRemoved___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) userInfo];
  v3 = [v2 objectForKey:@"HMDServiceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 accessory];
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(v1 + 40);
  BOOL v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    uint64_t v11 = [v5 instanceID];
    v12 = [v5 type];
    [v6 name];
    uint64_t v41 = v1;
    uint64_t v13 = v42 = v5;
    [v6 uuid];
    uint64_t v15 = v14 = v7;
    uint64_t v16 = [v15 UUIDString];
    *(_DWORD *)buf = 138544386;
    __int16 v46 = v10;
    __int16 v47 = 2112;
    __int16 v48 = v11;
    __int16 v49 = 2112;
    __int16 v50 = v12;
    __int16 v51 = 2112;
    v52 = v13;
    __int16 v53 = 2112;
    uint64_t v54 = v16;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Received notification that a service %@/%@ has been removed from the accessory %@/%@", buf, 0x34u);

    id v7 = v14;
    uint64_t v1 = v41;
    id v5 = v42;
  }
  id v17 = [v5 type];
  int v18 = [v17 isEqualToString:*MEMORY[0x1E4F2DEE8]];

  if (v18)
  {
    uint64_t v19 = [*(id *)(v1 + 40) configuredControllers];
    int v20 = [v19 containsObject:v6];

    if (v20)
    {
      int v21 = (void *)MEMORY[0x1D9452090]();
      id v22 = *(id *)(v1 + 40);
      uint64_t v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = HMFGetLogIdentifier();
        int v25 = [v5 instanceID];
        v26 = [v6 name];
        uint64_t v27 = [v6 uuid];
        [v27 UUIDString];
        uint64_t v28 = v43 = v6;
        *(_DWORD *)buf = 138544130;
        __int16 v46 = v24;
        __int16 v47 = 2112;
        __int16 v48 = v25;
        __int16 v49 = 2112;
        __int16 v50 = v26;
        __int16 v51 = 2112;
        v52 = v28;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Received notification target configuration service %@ of controller %@/%@ has been removed - treating as unconfiguration", buf, 0x2Au);

        id v6 = v43;
      }

      [*(id *)(v1 + 40) _targetAccessoryUnconfiguredWithController:v6];
    }
  }
  else
  {
    id v29 = [v5 type];
    int v30 = [v29 isEqualToString:*MEMORY[0x1E4F2DEE0]];

    if (v30)
    {
      id v31 = [*(id *)(v1 + 40) configuredControllers];
      int v32 = [v31 containsObject:v6];

      if (v32)
      {
        id v33 = (void *)MEMORY[0x1D9452090]();
        id v34 = *(id *)(v1 + 40);
        v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          uint64_t v36 = HMFGetLogIdentifier();
          unsigned int v37 = [v5 instanceID];
          v38 = [v6 name];
          unsigned int v39 = [v6 uuid];
          [v39 UUIDString];
          v40 = long long v44 = v6;
          *(_DWORD *)buf = 138544130;
          __int16 v46 = v36;
          __int16 v47 = 2112;
          __int16 v48 = v37;
          __int16 v49 = 2112;
          __int16 v50 = v38;
          __int16 v51 = 2112;
          v52 = v40;
          _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_INFO, "%{public}@Received notification target control service %@ of controller %@/%@ has been removed - treating as deselection", buf, 0x2Au);

          id v6 = v44;
        }

        [*(id *)(v1 + 40) _handleTargetControlServiceDeselection:v5];
      }
    }
  }
}

- (void)__accessoryRemoved:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDTargetControlManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__HMDTargetControlManager___accessoryRemoved___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __46__HMDTargetControlManager___accessoryRemoved___block_invoke(uint64_t a1)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) userInfo];
  v3 = [v2 objectForKey:@"HMDAccessoryNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = *(id *)(a1 + 40);
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    BOOL v9 = HMFGetLogIdentifier();
    uint64_t v10 = [v5 name];
    uint64_t v11 = [v5 uuid];
    v12 = [v11 UUIDString];
    *(_DWORD *)buf = 138543874;
    __int16 v63 = v9;
    __int16 v64 = 2112;
    __int16 v65 = v10;
    __int16 v66 = 2112;
    __int16 v67 = v12;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Received notification that an accessory %@/%@ has been removed from the home", buf, 0x20u);
  }
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = v14;

  if (v15)
  {
    uint64_t v16 = [*(id *)(a1 + 40) configuredControllers];
    int v17 = [v16 containsObject:v15];

    if (v17)
    {
      int v18 = (void *)MEMORY[0x1D9452090]();
      id v19 = *(id *)(a1 + 40);
      int v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v21 = HMFGetLogIdentifier();
        id v22 = [v15 name];
        uint64_t v23 = [v15 uuid];
        uint64_t v24 = [v23 UUIDString];
        *(_DWORD *)buf = 138543874;
        __int16 v63 = v21;
        __int16 v64 = 2112;
        __int16 v65 = v22;
        __int16 v66 = 2112;
        __int16 v67 = v24;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Received notification that controller %@/%@ has been removed", buf, 0x20u);
      }
      [*(id *)(a1 + 40) _handleControllerDisconnected:v15];
      [*(id *)(a1 + 40) _removeController:v15];
      int v25 = [v15 home];
      if (!v25)
      {
        __int16 v49 = (void *)MEMORY[0x1D9452090]();
        id v50 = *(id *)(a1 + 40);
        __int16 v51 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          v52 = HMFGetLogIdentifier();
          __int16 v53 = [v15 name];
          uint64_t v54 = [v15 uuid];
          uint64_t v55 = [v54 UUIDString];
          *(_DWORD *)buf = 138543874;
          __int16 v63 = v52;
          __int16 v64 = 2112;
          __int16 v65 = v53;
          __int16 v66 = 2112;
          __int16 v67 = v55;
          _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_ERROR, "%{public}@Removed controller %@/%@ is not configured with a home", buf, 0x20u);
        }
        goto LABEL_34;
      }
      v26 = [v15 uuid];
      uint64_t v27 = [v25 uuid];
      int v28 = identifierForTargetWithUUID(v26, v27);

      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v29 = [*(id *)(a1 + 40) eventReceivers];
      uint64_t v30 = [v29 countByEnumeratingWithState:&v57 objects:v61 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v56 = v25;
        int v32 = 0;
        uint64_t v33 = *(void *)v58;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v58 != v33) {
              objc_enumerationMutation(v29);
            }
            v35 = *(void **)(*((void *)&v57 + 1) + 8 * i);
            if ([v35 identifier] == v28)
            {
              id v36 = v35;

              int v32 = v36;
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v57 objects:v61 count:16];
        }
        while (v31);

        int v25 = v56;
        if (!v32) {
          goto LABEL_34;
        }
        unsigned int v37 = [*(id *)(a1 + 40) eventReceivers];
        [v37 removeObject:v32];
      }
      else
      {
        int v32 = v29;
      }

LABEL_34:
    }
  }
  else
  {
    v38 = [v13 uuid];
    unsigned int v39 = [*(id *)(a1 + 40) targetAccessory];
    long long v40 = [v39 uuid];
    int v41 = [v38 isEqual:v40];

    if (v41)
    {
      id v42 = (void *)MEMORY[0x1D9452090]();
      id v43 = *(id *)(a1 + 40);
      long long v44 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        long long v45 = HMFGetLogIdentifier();
        __int16 v46 = [v13 name];
        __int16 v47 = [v13 uuid];
        __int16 v48 = [v47 UUIDString];
        *(_DWORD *)buf = 138543874;
        __int16 v63 = v45;
        __int16 v64 = 2112;
        __int16 v65 = v46;
        __int16 v66 = 2112;
        __int16 v67 = v48;
        _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_INFO, "%{public}@Received notification that this target accessory  %@/%@ has been removed - invalidating...", buf, 0x20u);
      }
      [*(id *)(a1 + 40) invalidate];
    }
  }
}

- (void)__accessoryAdded:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDTargetControlManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__HMDTargetControlManager___accessoryAdded___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __44__HMDTargetControlManager___accessoryAdded___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) userInfo];
  v3 = [v2 objectForKey:@"HMDNotificationAddedAccessoryKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = *(id *)(a1 + 40);
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    BOOL v9 = HMFGetLogIdentifier();
    uint64_t v10 = [v5 name];
    uint64_t v11 = [v5 uuid];
    v12 = [v11 UUIDString];
    [v5 supportsTargetController];
    id v13 = HMFBooleanToString();
    int v14 = 138544130;
    id v15 = v9;
    __int16 v16 = 2112;
    int v17 = v10;
    __int16 v18 = 2112;
    id v19 = v12;
    __int16 v20 = 2112;
    int v21 = v13;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Received notification that an accessory %@/%@ (supportsTargetController %@) has been added to the home", (uint8_t *)&v14, 0x2Au);
  }
}

- (void)__accessoryDisconnected:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDTargetControlManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__HMDTargetControlManager___accessoryDisconnected___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __51__HMDTargetControlManager___accessoryDisconnected___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = *(id *)(a1 + 40);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    BOOL v9 = [v4 name];
    uint64_t v10 = [v4 uuid];
    uint64_t v11 = [v10 UUIDString];
    int v24 = 138543874;
    int v25 = v8;
    __int16 v26 = 2112;
    uint64_t v27 = v9;
    __int16 v28 = 2112;
    id v29 = v11;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Disconnected from accessory %@/%@", (uint8_t *)&v24, 0x20u);
  }
  id v12 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  if (v14)
  {
    id v15 = [*(id *)(a1 + 40) configuredControllers];
    int v16 = [v15 containsObject:v14];

    if (v16)
    {
      int v17 = (void *)MEMORY[0x1D9452090]();
      id v18 = *(id *)(a1 + 40);
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        __int16 v20 = HMFGetLogIdentifier();
        int v21 = [v12 name];
        uint64_t v22 = [*(id *)(a1 + 40) targetAccessory];
        uint64_t v23 = [v22 name];
        int v24 = 138543874;
        int v25 = v20;
        __int16 v26 = 2112;
        uint64_t v27 = v21;
        __int16 v28 = 2112;
        id v29 = v23;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Disconnected from controller %@ for target accessory %@", (uint8_t *)&v24, 0x20u);
      }
      [*(id *)(a1 + 40) _handleControllerDisconnected:v14];
    }
  }
}

- (void)__accessoryConnected:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDTargetControlManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__HMDTargetControlManager___accessoryConnected___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __48__HMDTargetControlManager___accessoryConnected___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = *(id *)(a1 + 40);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    BOOL v9 = [v4 name];
    uint64_t v10 = [v4 uuid];
    uint64_t v11 = [v10 UUIDString];
    int v25 = 138543874;
    __int16 v26 = v8;
    __int16 v27 = 2112;
    __int16 v28 = v9;
    __int16 v29 = 2112;
    uint64_t v30 = v11;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Connected to accessory %@/%@", (uint8_t *)&v25, 0x20u);
  }
  id v12 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  if (v14)
  {
    id v15 = [*(id *)(a1 + 40) configuredControllers];
    int v16 = [v15 containsObject:v14];

    if (v16)
    {
      int v17 = (void *)MEMORY[0x1D9452090]();
      id v18 = *(id *)(a1 + 40);
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        __int16 v20 = HMFGetLogIdentifier();
        int v21 = [v12 name];
        uint64_t v22 = [*(id *)(a1 + 40) targetAccessory];
        uint64_t v23 = [v22 name];
        int v25 = 138543874;
        __int16 v26 = v20;
        __int16 v27 = 2112;
        __int16 v28 = v21;
        __int16 v29 = 2112;
        uint64_t v30 = v23;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Connected to controller %@ for target accessory %@", (uint8_t *)&v25, 0x20u);
      }
      int v24 = objc_msgSend(*(id *)(a1 + 40), "__getOrCreateEventReceiver:", v14);
      [v24 setConnected:1];
    }
  }
}

- (void)__accessoryNameUpdated:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDTargetControlManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__HMDTargetControlManager___accessoryNameUpdated___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __50__HMDTargetControlManager___accessoryNameUpdated___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  if (!v4 || ![v4 supportsTargetController]) {
    goto LABEL_18;
  }
  id v5 = [v4 home];

  if (!v5)
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v18 = *(id *)(a1 + 40);
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      int v21 = [v4 name];
      uint64_t v22 = [v4 uuid];
      uint64_t v23 = [v22 UUIDString];
      int v29 = 138543874;
      uint64_t v30 = v20;
      __int16 v31 = 2112;
      int v32 = v21;
      __int16 v33 = 2112;
      id v34 = v23;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Attempting to process name update for a controller %@/%@ that is not configured with a home", (uint8_t *)&v29, 0x20u);
    }
    goto LABEL_17;
  }
  id v6 = [*(id *)(a1 + 40) configuredControllers];
  char v7 = [v6 containsObject:v4];

  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if ((v7 & 1) == 0)
  {
    if (v11)
    {
      int v24 = HMFGetLogIdentifier();
      int v25 = [v4 name];
      __int16 v26 = [v4 uuid];
      __int16 v27 = [v26 UUIDString];
      __int16 v28 = [*(id *)(a1 + 40) configuredControllers];
      int v29 = 138544130;
      uint64_t v30 = v24;
      __int16 v31 = 2112;
      int v32 = v25;
      __int16 v33 = 2112;
      id v34 = v27;
      __int16 v35 = 2112;
      id v36 = v28;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Controller %@/%@ that has updated its name not one of the configured controllers %@", (uint8_t *)&v29, 0x2Au);
    }
LABEL_17:
    goto LABEL_18;
  }
  if (v11)
  {
    id v12 = HMFGetLogIdentifier();
    id v13 = [v4 name];
    id v14 = [v4 uuid];
    id v15 = [v14 UUIDString];
    int v29 = 138543874;
    uint64_t v30 = v12;
    __int16 v31 = 2112;
    int v32 = v13;
    __int16 v33 = 2112;
    id v34 = v15;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Received notification that the name of a controller %@/%@ has been updated", (uint8_t *)&v29, 0x20u);
  }
  int v16 = objc_msgSend(*(id *)(a1 + 40), "__getOrCreateEventReceiver:", v4);
  int v17 = [v4 name];
  [v16 setName:v17];

LABEL_18:
}

- (void)__controllerRefreshedConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDTargetControlManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__HMDTargetControlManager___controllerRefreshedConfiguration___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __62__HMDTargetControlManager___controllerRefreshedConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = *(id *)(a1 + 40);
    char v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [v4 name];
      uint64_t v10 = [v4 uuid];
      BOOL v11 = [v10 UUIDString];
      id v12 = [*(id *)(a1 + 32) userInfo];
      int v25 = 138544130;
      __int16 v26 = v8;
      __int16 v27 = 2112;
      __int16 v28 = v9;
      __int16 v29 = 2112;
      uint64_t v30 = v11;
      __int16 v31 = 2112;
      int v32 = v12;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Received notification that a controller %@/%@ has refreshed its configuration - userInfo %@", (uint8_t *)&v25, 0x2Au);
    }
    id v13 = [*(id *)(a1 + 40) configuredControllers];
    char v14 = [v13 containsObject:v4];

    if (v14)
    {
      id v15 = *(void **)(a1 + 40);
      int v16 = [*(id *)(a1 + 32) userInfo];
      [v15 _targetAccessoryRefreshConfigurationWithController:v4 userInfo:v16];
    }
    else
    {
      int v17 = (void *)MEMORY[0x1D9452090]();
      id v18 = *(id *)(a1 + 40);
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        __int16 v20 = HMFGetLogIdentifier();
        int v21 = [v4 name];
        uint64_t v22 = [v4 uuid];
        uint64_t v23 = [v22 UUIDString];
        int v24 = [*(id *)(a1 + 40) configuredControllers];
        int v25 = 138544130;
        __int16 v26 = v20;
        __int16 v27 = 2112;
        __int16 v28 = v21;
        __int16 v29 = 2112;
        uint64_t v30 = v23;
        __int16 v31 = 2112;
        int v32 = v24;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Controller %@/%@ that has refreshed its configuration not one of the configured controllers %@", (uint8_t *)&v25, 0x2Au);
      }
    }
  }
}

- (void)_targetAccessoryRefreshConfigurationWithController:(id)a3 userInfo:(id)a4
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 supportsSiri];
  id v9 = (void *)MEMORY[0x1D9452090]();
  uint64_t v10 = self;
  BOOL v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    id v13 = HMFBooleanToString();
    [v6 name];
    char v14 = v75 = v9;
    [v6 uuid];
    int v16 = v15 = v10;
    int v17 = [v16 UUIDString];
    *(_DWORD *)buf = 138544386;
    v83 = v12;
    __int16 v84 = 2112;
    v85 = v13;
    __int16 v86 = 2112;
    v87 = v14;
    __int16 v88 = 2112;
    v89 = v17;
    __int16 v90 = 2112;
    id v91 = v7;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Handling configuration refresh from controller (supportsSiri %@) %@/%@: %@", buf, 0x34u);

    uint64_t v10 = v15;
    id v9 = v75;
  }
  id v18 = [(HMDTargetControlManager *)v10 __getOrCreateEventReceiver:v6];
  [v18 setSupportsSiri:v8];
  id v19 = objc_msgSend(v7, "hmf_numberForKey:", @"ticksPerSecond");
  if (v19)
  {
    uint64_t v20 = [v18 ticksPerSecond];
    if (v20 != [v19 unsignedLongValue]) {
      objc_msgSend(v18, "setTicksPerSecond:", objc_msgSend(v19, "unsignedLongValue"));
    }
  }
  int v21 = [(HMDTargetControlManager *)v10 targetAccessory];
  uint64_t v22 = [v21 home];
  v74 = (void *)v22;
  uint64_t v76 = v21;
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    unsigned __int8 v72 = v19;
    uint64_t v68 = v6;
    int v24 = [v21 uuid];
    int v25 = [v23 uuid];
    uint64_t v26 = identifierForTargetWithUUID(v24, v25);

    objc_msgSend(v7, "hmf_arrayForKey:", @"buttonConfiguration");
    __int16 v66 = v10;
    v69 = __int16 v67 = v18;
    -[HMDTargetControlManager __selectButtonConfiguration:receiver:](v10, "__selectButtonConfiguration:receiver:");
    uint64_t v71 = v70 = v7;
    objc_msgSend(v7, "hmf_arrayForKey:", @"targetConfiguration");
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = [v27 countByEnumeratingWithState:&v77 objects:v81 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v78;
LABEL_9:
      uint64_t v31 = 0;
      while (1)
      {
        if (*(void *)v78 != v30) {
          objc_enumerationMutation(v27);
        }
        int v32 = *(void **)(*((void *)&v77 + 1) + 8 * v31);
        uint64_t v33 = [v32 identifier];
        id v34 = [NSNumber numberWithUnsignedInt:v26];
        char v35 = [v33 isEqual:v34];

        if (v35) {
          break;
        }
        if (v29 == ++v31)
        {
          uint64_t v29 = [v27 countByEnumeratingWithState:&v77 objects:v81 count:16];
          if (v29) {
            goto LABEL_9;
          }
          goto LABEL_15;
        }
      }
      id v36 = v32;

      int v21 = v76;
      if (!v36) {
        goto LABEL_19;
      }
      uint64_t v37 = [v36 name];
      v38 = [v76 name];
      char v39 = [v37 isEqualToString:v38];

      id v19 = v72;
      if (v39)
      {
        long long v40 = 0;
      }
      else
      {
        long long v40 = [v76 name];
        long long v57 = (void *)MEMORY[0x1D9452090]();
        long long v58 = v66;
        long long v59 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          long long v60 = HMFGetLogIdentifier();
          v61 = [v36 name];
          *(_DWORD *)buf = 138543874;
          v83 = v60;
          __int16 v84 = 2112;
          v85 = v61;
          __int16 v86 = 2112;
          v87 = v40;
          _os_log_impl(&dword_1D49D5000, v59, OS_LOG_TYPE_INFO, "%{public}@Target name in the controller configuration %@ is stale - updating to %@", buf, 0x20u);
        }
      }
      id v18 = v67;
      v62 = (void *)MEMORY[0x1E4F1CAD0];
      __int16 v63 = [v36 buttonConfiguration];
      __int16 v64 = [v62 setWithArray:v63];

      id v6 = v68;
      int v21 = v76;
      if (v40 || (HMFEqualObjects() & 1) == 0)
      {
        __int16 v65 = [v71 allObjects];
        [v68 updateTarget:v76 name:v40 buttonConfiguration:v65];
      }
      [v68 registerForActiveIdentifierNotifications];
    }
    else
    {
LABEL_15:

      int v21 = v76;
LABEL_19:
      int v41 = (void *)MEMORY[0x1D9452090]();
      id v42 = v66;
      id v43 = HMFGetOSLogHandle();
      id v19 = v72;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        long long v44 = HMFGetLogIdentifier();
        long long v45 = [v21 name];
        __int16 v46 = [v21 uuid];
        __int16 v47 = [v46 UUIDString];
        *(_DWORD *)buf = 138543874;
        v83 = v44;
        __int16 v84 = 2112;
        v85 = v45;
        __int16 v86 = 2112;
        v87 = v47;
        _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_INFO, "%{public}@Target %@/%@ does not exist in controller configuration - for now, not adding", buf, 0x20u);

        int v21 = v76;
      }

      id v6 = v68;
    }

    id v7 = v70;
  }
  else
  {
    __int16 v48 = (void *)MEMORY[0x1D9452090]();
    __int16 v49 = v10;
    id v50 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      __int16 v51 = HMFGetLogIdentifier();
      [v21 name];
      uint64_t v73 = v19;
      id v52 = v7;
      uint64_t v54 = v53 = v6;
      uint64_t v55 = [v21 uuid];
      uint64_t v56 = [v55 UUIDString];
      *(_DWORD *)buf = 138543874;
      v83 = v51;
      __int16 v84 = 2112;
      v85 = v54;
      __int16 v86 = 2112;
      v87 = v56;
      _os_log_impl(&dword_1D49D5000, v50, OS_LOG_TYPE_ERROR, "%{public}@Attempting to process configuration refresh for target accessory %@/%@ that is not configured with a home", buf, 0x20u);

      id v6 = v53;
      id v7 = v52;
      id v19 = v73;

      int v21 = v76;
    }
  }
}

- (id)__selectButtonConfiguration:(id)a3 receiver:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  id v9 = 0;
  if (v7 && v8)
  {
    uint64_t v10 = mapButtonConfigurationForTVReceiver(v6);
    BOOL v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      char v14 = HMFGetLogIdentifier();
      id v15 = buttonConfigurationAsString(v6);
      *(_DWORD *)buf = 138543874;
      long long v57 = v14;
      __int16 v58 = 2112;
      id v59 = v15;
      __int16 v60 = 2112;
      v61 = v10;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Supported button configuration %@  Mapped supported button set: %@", buf, 0x20u);
    }
    if (v10)
    {
      id v51 = v6;
      id v50 = v10;
      int v16 = +[THAController selectButtonConfiguration:supportsSiri:](THAController, "selectButtonConfiguration:supportsSiri:", v10, [v7 supportsSiri]);
      [v7 updateSelectedButtons:v16];
      id v17 = v16;
      id v18 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v17, "count"));
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v19 = v17;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v52 objects:buf count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v53;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v53 != v22) {
              objc_enumerationMutation(v19);
            }
            int v24 = *(void **)(*((void *)&v52 + 1) + 8 * i);
            switch([v24 type])
            {
              case 1:
                int v25 = [HMDTargetButtonConfiguration alloc];
                uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v24, "identifier"));
                id v27 = v25;
                uint64_t v28 = 1;
                goto LABEL_24;
              case 2:
                uint64_t v30 = [HMDTargetButtonConfiguration alloc];
                uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v24, "identifier"));
                id v27 = v30;
                uint64_t v28 = 3;
                goto LABEL_24;
              case 3:
                uint64_t v31 = [HMDTargetButtonConfiguration alloc];
                uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v24, "identifier"));
                id v27 = v31;
                uint64_t v28 = 6;
                goto LABEL_24;
              case 4:
                int v32 = [HMDTargetButtonConfiguration alloc];
                uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v24, "identifier"));
                id v27 = v32;
                uint64_t v28 = 8;
                goto LABEL_24;
              case 5:
                uint64_t v33 = [HMDTargetButtonConfiguration alloc];
                uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v24, "identifier"));
                id v27 = v33;
                uint64_t v28 = 5;
                goto LABEL_24;
              case 6:
                id v34 = [HMDTargetButtonConfiguration alloc];
                uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v24, "identifier"));
                id v27 = v34;
                uint64_t v28 = 7;
                goto LABEL_24;
              case 7:
                char v35 = [HMDTargetButtonConfiguration alloc];
                uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v24, "identifier"));
                id v27 = v35;
                uint64_t v28 = 4;
                goto LABEL_24;
              case 8:
                id v36 = [HMDTargetButtonConfiguration alloc];
                uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v24, "identifier"));
                id v27 = v36;
                uint64_t v28 = 2;
                goto LABEL_24;
              case 9:
                uint64_t v37 = [HMDTargetButtonConfiguration alloc];
                uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v24, "identifier"));
                id v27 = v37;
                uint64_t v28 = 9;
                goto LABEL_24;
              case 10:
                v38 = [HMDTargetButtonConfiguration alloc];
                uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v24, "identifier"));
                id v27 = v38;
                uint64_t v28 = 10;
                goto LABEL_24;
              case 11:
                char v39 = [HMDTargetButtonConfiguration alloc];
                uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v24, "identifier"));
                id v27 = v39;
                uint64_t v28 = 12;
                goto LABEL_24;
              case 12:
                uint64_t v29 = [HMDTargetButtonConfiguration alloc];
                uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v24, "identifier"));
                id v27 = v29;
                uint64_t v28 = 11;
LABEL_24:
                long long v40 = [(HMDTargetButtonConfiguration *)v27 initWithType:v28 identifier:v26 name:0];

                if (v40)
                {
                  [v18 addObject:v40];
                }
                break;
              default:
                continue;
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v52 objects:buf count:16];
        }
        while (v21);
      }

      int v41 = (void *)[v18 copy];
      id v42 = (void *)[v41 mutableCopy];

      id v43 = (void *)MEMORY[0x1D9452090]();
      long long v44 = v12;
      long long v45 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        __int16 v46 = HMFGetLogIdentifier();
        __int16 v47 = [v42 allObjects];
        __int16 v48 = buttonConfigurationAsString(v47);
        *(_DWORD *)buf = 138543874;
        long long v57 = v46;
        __int16 v58 = 2112;
        id v59 = v19;
        __int16 v60 = 2112;
        v61 = v48;
        _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_DEBUG, "%{public}@Selected button set %@, Mapped and augmented button configuration: %@", buf, 0x20u);
      }
      id v9 = (void *)[v42 copy];

      id v6 = v51;
      uint64_t v10 = v50;
    }
    else
    {
      id v9 = 0;
    }
  }
  return v9;
}

- (void)__targetAccessoryUnconfiguredForControl:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDTargetControlManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__HMDTargetControlManager___targetAccessoryUnconfiguredForControl___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __67__HMDTargetControlManager___targetAccessoryUnconfiguredForControl___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  id v5 = [*(id *)(a1 + 32) userInfo];
  id v6 = objc_msgSend(v5, "hmf_arrayForKey:", @"HMDTargetAccessoriesUUIDKey");

  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 40);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    BOOL v11 = [v4 name];
    int v18 = 138543874;
    id v19 = v10;
    __int16 v20 = 2112;
    uint64_t v21 = v6;
    __int16 v22 = 2112;
    uint64_t v23 = v11;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Received notification that target accessories %@ have been unconfigured for control by controller %@", (uint8_t *)&v18, 0x20u);
  }
  id v12 = [*(id *)(a1 + 40) targetAccessory];
  id v13 = [v12 uuid];
  int v14 = [v6 containsObject:v13];

  if (v14)
  {
    id v15 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v16 = v15;
    }
    else {
      int v16 = 0;
    }
    id v17 = v16;

    if (v17) {
      [*(id *)(a1 + 40) _targetAccessoryUnconfiguredWithController:v17];
    }
  }
}

- (void)__targetAccessoryConfiguredForControl:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDTargetControlManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__HMDTargetControlManager___targetAccessoryConfiguredForControl___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __65__HMDTargetControlManager___targetAccessoryConfiguredForControl___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  id v5 = [*(id *)(a1 + 32) userInfo];
  id v6 = objc_msgSend(v5, "hmf_arrayForKey:", @"HMDTargetAccessoriesUUIDKey");

  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 40);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    BOOL v11 = [v4 name];
    id v12 = [v4 uuid];
    id v13 = [v12 UUIDString];
    int v24 = 138544130;
    int v25 = v10;
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2112;
    uint64_t v29 = v11;
    __int16 v30 = 2112;
    uint64_t v31 = v13;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Received notification that target accessories %@ have been configured for control by controller %@/%@", (uint8_t *)&v24, 0x2Au);
  }
  if (v4)
  {
    int v14 = [*(id *)(a1 + 40) targetAccessory];
    id v15 = [v14 uuid];
    int v16 = [v6 containsObject:v15];

    if (v16)
    {
      id v17 = (void *)MEMORY[0x1D9452090]();
      id v18 = *(id *)(a1 + 40);
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        __int16 v20 = HMFGetLogIdentifier();
        uint64_t v21 = [v4 name];
        __int16 v22 = [v4 uuid];
        uint64_t v23 = [v22 UUIDString];
        int v24 = 138543874;
        int v25 = v20;
        __int16 v26 = 2112;
        id v27 = v21;
        __int16 v28 = 2112;
        uint64_t v29 = v23;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Received notification that this target has been configured for control by controller %@/%@", (uint8_t *)&v24, 0x20u);
      }
      [*(id *)(a1 + 40) _targetAccessoryConfiguredWithController:v4];
    }
  }
}

- (void)addTargetControllers:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = a3;
  uint64_t v40 = [obj countByEnumeratingWithState:&v42 objects:v56 count:16];
  if (v40)
  {
    uint64_t v5 = *(void *)v43;
    *(void *)&long long v4 = 138543874;
    long long v32 = v4;
    uint64_t v33 = *(void *)v43;
    id v34 = self;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v43 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(id *)(*((void *)&v42 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v8 = v7;
        }
        else {
          id v8 = 0;
        }
        id v9 = v8;

        if (v9)
        {
          uint64_t v10 = [(HMDTargetControlManager *)self __getOrCreateEventReceiver:v9];
          uint64_t v11 = [v9 targetControllerTicksPerSecond];
          if (v11)
          {
            uint64_t v12 = v11;
            if ([v10 ticksPerSecond] != v11) {
              [v10 setTicksPerSecond:v12];
            }
          }
          int v41 = objc_msgSend(v9, "targetControllerButtonConfiguration", v32);
          id v13 = -[HMDTargetControlManager __selectButtonConfiguration:receiver:](self, "__selectButtonConfiguration:receiver:");
          int v14 = [v13 allObjects];

          id v15 = (void *)MEMORY[0x1D9452090]();
          int v16 = self;
          id v17 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            id v18 = v39 = v14;
            id v36 = [(HMDTargetControlManager *)v16 targetAccessory];
            [v36 name];
            id v19 = v37 = v15;
            [v9 name];
            __int16 v20 = v38 = v10;
            uint64_t v21 = [v9 uuid];
            __int16 v22 = [v21 UUIDString];
            uint64_t v23 = buttonConfigurationAsString(v39);
            *(_DWORD *)buf = 138544386;
            __int16 v47 = v18;
            __int16 v48 = 2112;
            __int16 v49 = v19;
            __int16 v50 = 2112;
            id v51 = v20;
            __int16 v52 = 2112;
            long long v53 = v22;
            __int16 v54 = 2112;
            long long v55 = v23;
            _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Adding target %@ to controller %@/%@ with button configuration %@", buf, 0x34u);

            uint64_t v10 = v38;
            id v15 = v37;

            self = v34;
            uint64_t v5 = v33;

            int v14 = v39;
          }

          int v24 = [(HMDTargetControlManager *)v16 targetAccessory];
          [v9 addTarget:v24 buttonConfiguration:v14];

          [v9 registerForActiveIdentifierNotifications];
        }
        else
        {
          int v25 = (void *)MEMORY[0x1D9452090]();
          __int16 v26 = self;
          id v27 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            __int16 v28 = HMFGetLogIdentifier();
            uint64_t v29 = [0 name];
            __int16 v30 = [0 uuid];
            uint64_t v31 = [v30 UUIDString];
            *(_DWORD *)buf = v32;
            __int16 v47 = v28;
            __int16 v48 = 2112;
            __int16 v49 = v29;
            __int16 v50 = 2112;
            id v51 = v31;
            _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Attempt to add a target controller %@/%@ that is not a HAP accessory", buf, 0x20u);

            self = v34;
            uint64_t v5 = v33;
          }
        }
      }
      uint64_t v40 = [obj countByEnumeratingWithState:&v42 objects:v56 count:16];
    }
    while (v40);
  }
}

- (void)removeReceiver:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_eventReceivers removeObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)addReceiver:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_eventReceivers addObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (NSMutableArray)eventReceivers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_eventReceivers copy];
  os_unfair_lock_unlock(p_lock);
  return (NSMutableArray *)v4;
}

- (void)removeControlService:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_activeControlServices removeObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)addControlService:(id)a3
{
  id v4 = a3;
  if ((-[NSMutableArray containsObject:](self->_activeControlServices, "containsObject:") & 1) == 0)
  {
    os_unfair_lock_lock_with_options();
    [(NSMutableArray *)self->_activeControlServices addObject:v4];
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (NSMutableArray)activeControlServices
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_activeControlServices copy];
  os_unfair_lock_unlock(p_lock);
  return (NSMutableArray *)v4;
}

- (void)_removeController:(id)a3
{
  id v8 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_configuredControllers removeObject:v8];
  os_unfair_lock_unlock(&self->_lock);
  id v4 = [(HMDTargetControlManager *)self siriServer];

  if (v4)
  {
    uint64_t v5 = [(HMDTargetControlManager *)self siriServer];
    id v6 = [(HMDTargetControlManager *)self targetAccessory];
    id v7 = [(HMDTargetControlManager *)self configuredControllers];
    [v5 setTargetableAccessory:v6 withControllers:v7];
  }
}

- (void)_addController:(id)a3
{
  id v10 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_configuredControllers addObject:v10];
  os_unfair_lock_unlock(&self->_lock);
  id v4 = [(HMDTargetControlManager *)self siriServer];

  if (!v4)
  {
    uint64_t v5 = +[HMDSiriServer sharedSiriServer];
    [(HMDTargetControlManager *)self setSiriServer:v5];
  }
  id v6 = [(HMDTargetControlManager *)self siriServer];

  if (v6)
  {
    id v7 = [(HMDTargetControlManager *)self siriServer];
    id v8 = [(HMDTargetControlManager *)self targetAccessory];
    id v9 = [(HMDTargetControlManager *)self configuredControllers];
    [v7 setTargetableAccessory:v8 withControllers:v9];
  }
}

- (NSMutableArray)configuredControllers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_configuredControllers copy];
  os_unfair_lock_unlock(p_lock);
  return (NSMutableArray *)v4;
}

- (void)invalidate
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v32 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Invalidating target control manager", buf, 0xCu);
  }
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:v4];

  id v8 = [(HMDTargetControlManager *)v4 siriServer];

  if (v8)
  {
    id v9 = [(HMDTargetControlManager *)v4 siriServer];
    id v10 = [(HMDTargetControlManager *)v4 targetAccessory];
    [v9 setTargetableAccessory:v10 withControllers:MEMORY[0x1E4F1CBF0]];

    [(HMDTargetControlManager *)v4 setSiriServer:0];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v11 = [(HMDTargetControlManager *)v4 activeControlServices];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        [(HMDTargetControlManager *)v4 _handleTargetControlServiceDeselection:*(void *)(*((void *)&v25 + 1) + 8 * v15++)];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v13);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v16 = [(HMDTargetControlManager *)v4 configuredControllers];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        [(HMDTargetControlManager *)v4 _targetAccessoryUnconfiguredWithController:*(void *)(*((void *)&v21 + 1) + 8 * v20++)];
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v18);
  }
}

- (HMDTargetControlManager)initWithTargetAccessory:(id)a3 controllers:(id)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v71.receiver = self;
  v71.super_class = (Class)HMDTargetControlManager;
  id v8 = [(HMDTargetControlManager *)&v71 init];
  if (v8)
  {
    HMDispatchQueueNameString();
    id v9 = objc_claimAutoreleasedReturnValue();
    id v10 = (const char *)[v9 UTF8String];
    uint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
    workQueue = v8->_workQueue;
    v8->_workQueue = (OS_dispatch_queue *)v12;

    objc_storeWeak((id *)&v8->_targetAccessory, v6);
    if (v7) {
      id v14 = v7;
    }
    else {
      id v14 = (id)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v15 = [MEMORY[0x1E4F1CA48] arrayWithArray:v14];
    configuredControllers = v8->_configuredControllers;
    v8->_configuredControllers = (NSMutableArray *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
    activeControlServices = v8->_activeControlServices;
    v8->_activeControlServices = (NSMutableArray *)v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
    eventReceivers = v8->_eventReceivers;
    v8->_eventReceivers = (NSMutableArray *)v19;

    long long v21 = NSString;
    long long v22 = [v6 name];
    long long v23 = [v6 uuid];
    long long v24 = [v23 UUIDString];
    uint64_t v25 = [v21 stringWithFormat:@"%@/%@", v22, v24];
    logID = v8->_logID;
    v8->_logID = (NSString *)v25;

    long long v27 = (void *)MEMORY[0x1D9452090]();
    v61 = v8;
    long long v28 = v8;
    uint64_t v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      __int16 v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v73 = v30;
      __int16 v74 = 2112;
      id v75 = v7;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@Initializing target control manager with controllers %@", buf, 0x16u);
    }
    uint64_t v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v31 addObserver:v28 selector:sel___targetAccessoryConfiguredForControl_ name:@"HMDTargetAccessoryConfiguredNotificationKey" object:0];

    long long v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v32 addObserver:v28 selector:sel___targetAccessoryUnconfiguredForControl_ name:@"HMDTargetAccessoryUnconfiguredNotificationKey" object:0];

    uint64_t v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v33 addObserver:v28 selector:sel___controllerRefreshedConfiguration_ name:@"HMDTargetControllerAccessoryConfigurationUpdatedNotificationKey" object:0];

    id v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v34 addObserver:v28 selector:sel___accessoryNameUpdated_ name:@"HMDAccessoryNameUpdatedNotification" object:0];

    char v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v35 addObserver:v28 selector:sel___activeSelectionChanged_ name:@"HMDTargetControlServiceSelectedNotificationKey" object:0];

    id v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v36 addObserver:v28 selector:sel___activeSelectionReset_ name:@"HMDTargetControlServiceDeselectedNotificationKey" object:0];

    uint64_t v37 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v37 addObserver:v28 selector:sel___accessoryConfigured_ name:@"HMDAccessoryConnectedNotification" object:0];

    v38 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v38 addObserver:v28 selector:sel___accessoryUnconfigured_ name:@"HMDAccessoryDisconnectedNotification" object:0];

    char v39 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v39 addObserver:v28 selector:sel___characteristicsEventsReceived_ name:*MEMORY[0x1E4F5B7C8] object:0];

    uint64_t v40 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v40 addObserver:v28 selector:sel___accessoryAdded_ name:@"HMDNotificationHomeAddedAccessory" object:0];

    int v41 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v41 addObserver:v28 selector:sel___accessoryRemoved_ name:@"HMDHomeAccessoryRemovedNotification" object:0];

    long long v42 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v42 addObserver:v28 selector:sel___serviceRemoved_ name:@"HMDHomeServiceRemovedNotification" object:0];

    id v62 = v6;
    [v6 home];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    v60 = long long v70 = 0u;
    long long v43 = [v60 accessories];
    uint64_t v44 = [v43 countByEnumeratingWithState:&v67 objects:v78 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v68;
      __int16 v63 = v43;
      id v64 = v7;
      do
      {
        uint64_t v47 = 0;
        uint64_t v65 = v45;
        do
        {
          if (*(void *)v68 != v46) {
            objc_enumerationMutation(v43);
          }
          id v48 = *(id *)(*((void *)&v67 + 1) + 8 * v47);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            __int16 v49 = v48;
          }
          else {
            __int16 v49 = 0;
          }
          id v50 = v49;

          if ([v50 supportsTargetController]
            && ([v7 containsObject:v50] & 1) == 0)
          {
            context = (void *)MEMORY[0x1D9452090]();
            id v51 = v28;
            __int16 v52 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              long long v53 = HMFGetLogIdentifier();
              __int16 v54 = [v50 name];
              [v50 uuid];
              uint64_t v55 = v46;
              v57 = uint64_t v56 = v28;
              __int16 v58 = [v57 UUIDString];
              *(_DWORD *)buf = 138543874;
              uint64_t v73 = v53;
              __int16 v74 = 2112;
              id v75 = v54;
              __int16 v76 = 2112;
              long long v77 = v58;
              _os_log_impl(&dword_1D49D5000, v52, OS_LOG_TYPE_INFO, "%{public}@Adding %@/%@ as a configured controller", buf, 0x20u);

              long long v28 = v56;
              uint64_t v46 = v55;

              uint64_t v45 = v65;
              long long v43 = v63;

              id v7 = v64;
            }

            [(HMDTargetControlManager *)v51 _addController:v50];
            [(HMDTargetControlManager *)v51 __getOrCreateEventReceiver:v50];
          }
          ++v47;
        }
        while (v45 != v47);
        uint64_t v45 = [v43 countByEnumeratingWithState:&v67 objects:v78 count:16];
      }
      while (v45);
    }

    id v8 = v61;
    id v6 = v62;
  }

  return v8;
}

- (HMDTargetControlManager)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_89882 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_89882, &__block_literal_global_89883);
  }
  v2 = (void *)logCategory__hmf_once_v5_89884;
  return v2;
}

uint64_t __38__HMDTargetControlManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v5_89884;
  logCategory__hmf_once_v5_89884 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end