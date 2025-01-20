@interface HMDModernMessagingHandler
+ (id)logCategory;
- (HMDHome)home;
- (HMDModernMessagingHandler)init;
- (HMDModernMessagingXPCEventPublisher)eventPublisher;
- (HMDModernRemoteMessageTransport)modernTransport;
- (HMDModernRemoteMessageTransport)modernTransportEnergyInstance;
- (HMDUserMessagePolicy)adminPolicy;
- (HMDUserMessagePolicy)ownerPolicy;
- (HMDUserMessagePolicy)userPolicy;
- (HMFMessageDispatcher)energyRemoteMessageDispatcher;
- (HMFMessageDispatcher)localMessageDispatcher;
- (HMFMessageDispatcher)remoteMessageDispatcher;
- (NSMutableArray)pendingMessages;
- (NSMutableDictionary)registrationsByMessageName;
- (NSUUID)homeUUID;
- (OS_dispatch_queue)workQueue;
- (id)_createEnergyRemoteMessageDispatcher;
- (id)_createRemoteMessageDispatcher;
- (id)_policiesForHMMMRequestHandlerRestriction:(int64_t)a3;
- (os_unfair_recursive_lock_s)lock;
- (void)_createModernTransportEnergyInstance;
- (void)_createModernTransportInstance;
- (void)_handleHMMMRemoteMessage:(id)a3;
- (void)_handleXPCConnectionDeactivatedNotification:(id)a3;
- (void)_sendHMMMRemoteMessageToClient:(id)a3 clientMessageName:(id)a4 message:(id)a5;
- (void)_sendPendingHMMMRemoteMessagesForClientIdentifier:(id)a3;
- (void)_storePendingHMMMRemoteMessage:(id)a3;
- (void)configureWithHome:(id)a3;
- (void)configureWithHome:(id)a3 xpcEventPublisher:(id)a4;
- (void)handleRegisterHMMMMessage:(id)a3;
- (void)handleSendHMMMMessage:(id)a3;
- (void)handleUnregisterHMMMMessage:(id)a3;
- (void)registerForMessages;
- (void)registerHMMMMessageHandlerWithMessageName:(id)a3 userRestriction:(int64_t)a4 clientConnection:(id)a5 message:(id)a6;
- (void)setAdminPolicy:(id)a3;
- (void)setEnergyRemoteMessageDispatcher:(id)a3;
- (void)setEventPublisher:(id)a3;
- (void)setHome:(id)a3;
- (void)setHomeUUID:(id)a3;
- (void)setLocalMessageDispatcher:(id)a3;
- (void)setLock:(os_unfair_recursive_lock_s)a3;
- (void)setModernTransport:(id)a3;
- (void)setModernTransportEnergyInstance:(id)a3;
- (void)setOwnerPolicy:(id)a3;
- (void)setRemoteMessageDispatcher:(id)a3;
- (void)setUserPolicy:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation HMDModernMessagingHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modernTransport, 0);
  objc_storeStrong((id *)&self->_remoteMessageDispatcher, 0);
  objc_storeStrong((id *)&self->_modernTransportEnergyInstance, 0);
  objc_storeStrong((id *)&self->_userPolicy, 0);
  objc_storeStrong((id *)&self->_adminPolicy, 0);
  objc_storeStrong((id *)&self->_ownerPolicy, 0);
  objc_storeStrong((id *)&self->_energyRemoteMessageDispatcher, 0);
  objc_storeStrong((id *)&self->_localMessageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_pendingMessages, 0);
  objc_storeStrong((id *)&self->_registrationsByMessageName, 0);
  objc_storeStrong((id *)&self->_eventPublisher, 0);
}

- (void)setModernTransport:(id)a3
{
}

- (HMDModernRemoteMessageTransport)modernTransport
{
  return self->_modernTransport;
}

- (void)setRemoteMessageDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)remoteMessageDispatcher
{
  return self->_remoteMessageDispatcher;
}

- (void)setModernTransportEnergyInstance:(id)a3
{
}

- (HMDModernRemoteMessageTransport)modernTransportEnergyInstance
{
  return self->_modernTransportEnergyInstance;
}

- (void)setUserPolicy:(id)a3
{
}

- (HMDUserMessagePolicy)userPolicy
{
  return self->_userPolicy;
}

- (void)setAdminPolicy:(id)a3
{
}

- (HMDUserMessagePolicy)adminPolicy
{
  return self->_adminPolicy;
}

- (void)setOwnerPolicy:(id)a3
{
}

- (HMDUserMessagePolicy)ownerPolicy
{
  return self->_ownerPolicy;
}

- (void)setEnergyRemoteMessageDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)energyRemoteMessageDispatcher
{
  return self->_energyRemoteMessageDispatcher;
}

- (void)setLocalMessageDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)localMessageDispatcher
{
  return self->_localMessageDispatcher;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setHomeUUID:(id)a3
{
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (NSMutableArray)pendingMessages
{
  return self->_pendingMessages;
}

- (void)setLock:(os_unfair_recursive_lock_s)a3
{
  os_unfair_recursive_lock_s src = a3;
  objc_copyStruct(&self->_lock, &src, 8, 1, 0);
}

- (os_unfair_recursive_lock_s)lock
{
  objc_copyStruct(&dest, &self->_lock, 8, 1, 0);
  return dest;
}

- (NSMutableDictionary)registrationsByMessageName
{
  return self->_registrationsByMessageName;
}

- (void)setEventPublisher:(id)a3
{
}

- (HMDModernMessagingXPCEventPublisher)eventPublisher
{
  return self->_eventPublisher;
}

- (void)handleSendHMMMMessage:(id)a3
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [(HMDModernMessagingHandler *)v6 messageTargetUUID];
    *(_DWORD *)buf = 138543874;
    v85 = v8;
    __int16 v86 = 2112;
    uint64_t v87 = (uint64_t)v4;
    __int16 v88 = 2112;
    v89 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@handleSendHMMMMessage with message: %@ for target: %@", buf, 0x20u);
  }
  v10 = [v4 messagePayload];
  uint64_t v11 = *MEMORY[0x263F0D060];
  uint64_t v12 = objc_msgSend(v10, "hmf_stringForKey:", *MEMORY[0x263F0D060]);
  v13 = objc_msgSend(v10, "hmf_stringForKey:", *MEMORY[0x263F0D050]);
  v14 = objc_msgSend(v10, "hmf_stringForKey:", *MEMORY[0x263F0D058]);
  uint64_t v15 = *MEMORY[0x263F0D078];
  v76 = objc_msgSend(v10, "hmf_dataForKey:", *MEMORY[0x263F0D078]);
  v16 = objc_msgSend(v10, "hmf_dictionaryForKey:", *MEMORY[0x263F0D070]);
  v17 = objc_msgSend(v16, "hmf_numberForKey:", *MEMORY[0x263F0D040]);
  v78 = objc_msgSend(v16, "hmf_numberForKey:", *MEMORY[0x263F0D038]);
  v18 = objc_msgSend(v16, "hmf_numberForKey:", *MEMORY[0x263F0D030]);
  v77 = (void *)v12;
  v75 = v18;
  if (v12 && v13 && v14 && v18)
  {
    if (!v17)
    {
      v19 = v18;
      v17 = [NSNumber numberWithInt:2];
      v18 = v19;
    }
    v73 = v13;
    v20 = v78;
    if (!v78) {
      v20 = &unk_26E472538;
    }
    v78 = v20;
    int v71 = [v18 BOOLValue];
    v21 = +[HMDModernMessagingRegistration prefixedHMMMMessageNameWithMessageName:v77];
    v22 = [MEMORY[0x263EFF9A0] dictionary];
    [v22 setObject:v76 forKeyedSubscript:v15];
    v72 = v22;
    [v22 setObject:v11 forKeyedSubscript:v11];
    v23 = v17;
    if ([v17 intValue])
    {
      if ([v17 intValue] == 1) {
        uint64_t v24 = 8;
      }
      else {
        uint64_t v24 = -1;
      }
    }
    else
    {
      uint64_t v24 = 1;
    }
    v67 = v23;
    uint64_t v66 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v73];
    v69 = v14;
    v30 = [[HMDDeviceAddress alloc] initWithIDSIdentifier:v66 idsDestination:v14];
    uint64_t v31 = +[HMDAccountRegistry sharedRegistry];
    v65 = v30;
    uint64_t v32 = [(id)v31 deviceForAddress:v30];

    id v83 = 0;
    LOBYTE(v31) = +[HMDSecureRemoteMessageTransport isDeviceValidDestination:v32 error:&v83];
    id v70 = v83;
    v68 = (void *)v32;
    if ((v31 & 1) == 0)
    {
      v50 = (void *)MEMORY[0x230FBD990]();
      v51 = v6;
      v52 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v53 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v85 = v53;
        __int16 v86 = 2112;
        uint64_t v87 = (uint64_t)v70;
        _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_ERROR, "%{public}@Device is not a valid destination for HMMM Messages, error: %@", buf, 0x16u);
      }
      v48 = v70;
      [v4 respondWithError:v70];
      v13 = v73;
      v14 = v69;
      v54 = (void *)v66;
      v17 = v67;
      v55 = v65;
      goto LABEL_40;
    }
    if (v71) {
      uint64_t v33 = 3;
    }
    else {
      uint64_t v33 = 0;
    }
    v34 = [HMDRemoteDeviceMessageDestination alloc];
    v35 = [(HMDModernMessagingHandler *)v6 messageTargetUUID];
    uint64_t v36 = [(HMDRemoteDeviceMessageDestination *)v34 initWithTarget:v35 device:v32];

    v37 = [HMDRemoteMessage alloc];
    uint64_t v38 = [v4 qualityOfService];
    [v78 doubleValue];
    uint64_t v62 = v24;
    v39 = (void *)v36;
    v64 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:](v37, "initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:", v21, v38, v36, v72, v33, 1, v62);
    v40 = (void *)MEMORY[0x230FBD990]();
    v41 = v6;
    v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      v43 = HMFGetLogIdentifier();
      [v4 identifier];
      v63 = v40;
      v45 = v44 = v39;
      v46 = [(HMDRemoteMessage *)v64 identifier];
      *(_DWORD *)buf = 138543874;
      v85 = v43;
      __int16 v86 = 2112;
      uint64_t v87 = (uint64_t)v45;
      __int16 v88 = 2112;
      v89 = v46;
      _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_INFO, "%{public}@Routing source hmmm message %@ as remote message %@", buf, 0x20u);

      v39 = v44;
      v40 = v63;
    }
    v13 = v73;
    v14 = v69;
    if ((v71 & 1) == 0)
    {
      v47 = [(HMDRemoteMessage *)v64 identifier];
      v79[0] = MEMORY[0x263EF8330];
      v79[1] = 3221225472;
      v79[2] = __51__HMDModernMessagingHandler_handleSendHMMMMessage___block_invoke;
      v79[3] = &unk_264A238E8;
      v79[4] = v41;
      v79[5] = v47;
      id v80 = v73;
      id v81 = v69;
      id v82 = v4;
      [(HMDRemoteMessage *)v64 setResponseHandler:v79];
    }
    v48 = v70;
    if ([v77 isEqualToString:@"com.apple.DistributedTimers.request"])
    {
      v49 = [(HMDModernMessagingHandler *)v41 remoteMessageDispatcher];
    }
    else
    {
      if (![v77 isEqualToString:@"EnergyKitShareRequest_v1"])
      {
        v57 = (void *)MEMORY[0x230FBD990]();
        v58 = v41;
        v59 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          v60 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v85 = v60;
          __int16 v86 = 2112;
          uint64_t v87 = (uint64_t)v77;
          _os_log_impl(&dword_22F52A000, v59, OS_LOG_TYPE_ERROR, "%{public}@Unknown message name: %@, discarding message", buf, 0x16u);
        }
        v61 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
        [v4 respondWithError:v61];

        v14 = v69;
        v48 = v70;
        v55 = v65;
        v54 = (void *)v66;
        goto LABEL_39;
      }
      v49 = [(HMDModernMessagingHandler *)v41 energyRemoteMessageDispatcher];
    }
    v56 = v49;
    [v49 sendMessage:v64];

    v55 = v65;
    v54 = (void *)v66;
    if (v71) {
      [v4 respondWithSuccess];
    }
LABEL_39:

    v17 = v67;
LABEL_40:

    goto LABEL_41;
  }
  v25 = (void *)MEMORY[0x230FBD990]();
  v26 = v6;
  v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    id v74 = v4;
    v29 = v28 = v14;
    *(_DWORD *)buf = 138544386;
    v85 = v29;
    __int16 v86 = 2112;
    uint64_t v87 = v12;
    __int16 v88 = 2112;
    v89 = v13;
    __int16 v90 = 2112;
    v91 = v28;
    __int16 v92 = 2112;
    v93 = v75;
    _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Cannot send HMMM message, missing required data: messageName: %@, idsIdentifier: %@, tokenURI: %@, oneWayNumber: %@", buf, 0x34u);

    v14 = v28;
    id v4 = v74;
  }

  v21 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
  [v4 respondWithError:v21];
LABEL_41:
}

void __51__HMDModernMessagingHandler_handleSendHMMMMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    uint64_t v11 = *(void *)(a1 + 40);
    int v15 = 138543618;
    v16 = v10;
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Received response for HMMM message: %@", (uint8_t *)&v15, 0x16u);
  }
  if (v6)
  {
    uint64_t v12 = (void *)[v6 mutableCopy];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
  }
  v13 = v12;
  [v12 setObject:*(void *)(a1 + 48) forKeyedSubscript:*MEMORY[0x263F0D050]];
  [v13 setObject:*(void *)(a1 + 56) forKeyedSubscript:*MEMORY[0x263F0D058]];
  v14 = [NSDictionary dictionaryWithDictionary:v13];
  [*(id *)(a1 + 64) respondWithPayload:v14 error:v5];
}

- (void)handleUnregisterHMMMMessage:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v25 = 138543618;
    v26 = v8;
    __int16 v27 = 2112;
    id v28 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@handleUnregisterHMMMMessage with message: %@", (uint8_t *)&v25, 0x16u);
  }
  v9 = [v4 messagePayload];
  v10 = objc_msgSend(v9, "hmf_stringForKey:", *MEMORY[0x263F0D060]);
  if (v10)
  {
    uint64_t v11 = +[HMDModernMessagingRegistration prefixedHMMMMessageNameWithMessageName:v10];
    os_unfair_recursive_lock_lock_with_options();
    uint64_t v12 = [(HMDModernMessagingHandler *)v6 registrationsByMessageName];
    [v12 setObject:0 forKeyedSubscript:v10];

    uint64_t v13 = os_unfair_recursive_lock_unlock();
    v14 = (void *)MEMORY[0x230FBD990](v13);
    int v15 = v6;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = HMFGetLogIdentifier();
      uint64_t v18 = [(HMDModernMessagingHandler *)v15 messageTargetUUID];
      int v25 = 138543874;
      v26 = v17;
      __int16 v27 = 2112;
      id v28 = v10;
      __int16 v29 = 2112;
      v30 = v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@(2) Deregistering for remote message with name: %@ for target: %@", (uint8_t *)&v25, 0x20u);
    }
    uint64_t v19 = [(HMDModernMessagingHandler *)v15 remoteMessageDispatcher];
    [v19 deregisterForMessage:v11 receiver:v15];

    v20 = [(HMDModernMessagingHandler *)v15 energyRemoteMessageDispatcher];
    [v20 deregisterForMessage:v11 receiver:v15];

    [v4 respondWithSuccess];
  }
  else
  {
    v21 = (void *)MEMORY[0x230FBD990]();
    v22 = v6;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      int v25 = 138543618;
      v26 = v24;
      __int16 v27 = 2112;
      id v28 = 0;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Error unregistering HMMT request handler with message name: %@", (uint8_t *)&v25, 0x16u);
    }
    uint64_t v11 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    [v4 respondWithError:v11];
  }
}

- (void)_handleHMMMRemoteMessage:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v22 = 138543618;
    v23 = v8;
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Received hm modern messaging remote message: %@", (uint8_t *)&v22, 0x16u);
  }
  v9 = [v4 name];
  v10 = +[HMDModernMessagingRegistration clientHMMMMessageNameFromPrefixedMessageName:v9];

  if (v10)
  {
    os_unfair_recursive_lock_lock_with_options();
    uint64_t v11 = [(HMDModernMessagingHandler *)v6 registrationsByMessageName];
    uint64_t v12 = [v11 objectForKeyedSubscript:v10];
    uint64_t v13 = [v12 xpcConnection];

    os_unfair_recursive_lock_unlock();
    if (v13)
    {
      [(HMDModernMessagingHandler *)v6 _sendHMMMRemoteMessageToClient:v13 clientMessageName:v10 message:v4];
    }
    else
    {
      uint64_t v18 = [(HMDModernMessagingHandler *)v6 eventPublisher];
      uint64_t v19 = [v18 launchOnDemandClientIdentifiersByMessageName];
      v20 = [v19 objectForKeyedSubscript:v10];

      if (v20)
      {
        [(HMDModernMessagingHandler *)v6 _storePendingHMMMRemoteMessage:v4];
        v21 = [(HMDModernMessagingHandler *)v6 eventPublisher];
        [v21 publishLaunchEventForBundleID:v20];
      }
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    int v15 = v6;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = HMFGetLogIdentifier();
      int v22 = 138543618;
      v23 = v17;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@HMMM message received without valid prefix. Discarding: %@", (uint8_t *)&v22, 0x16u);
    }
  }
}

- (void)_sendPendingHMMMRemoteMessagesForClientIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = v8;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Sending pending HMMM messages to client with identifier: %@", buf, 0x16u);
  }
  os_unfair_recursive_lock_lock_with_options();
  v9 = [(HMDModernMessagingHandler *)v6 pendingMessages];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __79__HMDModernMessagingHandler__sendPendingHMMMRemoteMessagesForClientIdentifier___block_invoke;
  v16[3] = &unk_264A238C0;
  v16[4] = v6;
  id v10 = v4;
  id v17 = v10;
  uint64_t v11 = objc_msgSend(v9, "na_filter:", v16);

  uint64_t v12 = [(HMDModernMessagingHandler *)v6 pendingMessages];
  [v12 removeObjectsInArray:v11];

  os_unfair_recursive_lock_unlock();
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__HMDModernMessagingHandler__sendPendingHMMMRemoteMessagesForClientIdentifier___block_invoke_2;
  v14[3] = &unk_264A2AFF0;
  v14[4] = v6;
  id v15 = v10;
  id v13 = v10;
  objc_msgSend(v11, "na_each:", v14);
}

uint64_t __79__HMDModernMessagingHandler__sendPendingHMMMRemoteMessagesForClientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 name];
  id v4 = +[HMDModernMessagingRegistration clientHMMMMessageNameFromPrefixedMessageName:v3];

  id v5 = [*(id *)(a1 + 32) eventPublisher];
  id v6 = [v5 launchOnDemandClientIdentifiersByMessageName];
  v7 = [v6 objectForKeyedSubscript:v4];

  uint64_t v8 = [v7 isEqualToString:*(void *)(a1 + 40)];
  return v8;
}

void __79__HMDModernMessagingHandler__sendPendingHMMMRemoteMessagesForClientIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    uint64_t v8 = [v3 shortDescription];
    int v20 = 138543618;
    id v21 = v7;
    __int16 v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Sending pending message: %@", (uint8_t *)&v20, 0x16u);
  }
  v9 = [v3 name];
  id v10 = +[HMDModernMessagingRegistration clientHMMMMessageNameFromPrefixedMessageName:v9];

  os_unfair_recursive_lock_lock_with_options();
  uint64_t v11 = [*(id *)(a1 + 32) registrationsByMessageName];
  uint64_t v12 = [v11 objectForKeyedSubscript:v10];
  id v13 = [v12 xpcConnection];

  uint64_t v14 = os_unfair_recursive_lock_unlock();
  if (v13)
  {
    [*(id *)(a1 + 32) _sendHMMMRemoteMessageToClient:v13 clientMessageName:v10 message:v3];
  }
  else
  {
    id v15 = (void *)MEMORY[0x230FBD990](v14);
    id v16 = *(id *)(a1 + 32);
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      uint64_t v19 = *(void **)(a1 + 40);
      int v20 = 138543618;
      id v21 = v18;
      __int16 v22 = 2112;
      v23 = v19;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to send pending HMMM Remote message to client with identifier: %@ ... XPC Client is nil", (uint8_t *)&v20, 0x16u);
    }
  }
}

- (void)_storePendingHMMMRemoteMessage:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    v9 = [v4 shortDescription];
    int v13 = 138543618;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Storing pending HMMM message: %@", (uint8_t *)&v13, 0x16u);
  }
  os_unfair_recursive_lock_lock_with_options();
  id v10 = [(HMDModernMessagingHandler *)v6 pendingMessages];
  [v10 addObject:v4];
  while (1)
  {

    uint64_t v11 = [(HMDModernMessagingHandler *)v6 pendingMessages];
    BOOL v12 = (unint64_t)[v11 count] > 0x1E;

    if (!v12) {
      break;
    }
    id v10 = [(HMDModernMessagingHandler *)v6 pendingMessages];
    objc_msgSend(v10, "hmf_removeFirstObject");
  }
  os_unfair_recursive_lock_unlock();
}

- (void)_sendHMMMRemoteMessageToClient:(id)a3 clientMessageName:(id)a4 message:(id)a5
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v9)
  {
    id v12 = v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v13 = v12;
    }
    else {
      int v13 = 0;
    }
    id v14 = v13;

    if (v14)
    {
      uint64_t v62 = v11;
      __int16 v15 = [v12 messagePayload];
      uint64_t v16 = *MEMORY[0x263F0D078];
      uint64_t v17 = objc_msgSend(v15, "hmf_dataForKey:", *MEMORY[0x263F0D078]);
      id v18 = objc_alloc(MEMORY[0x263F42570]);
      uint64_t v19 = [(HMDModernMessagingHandler *)self messageTargetUUID];
      v63 = (void *)[v18 initWithTarget:v19];

      int v20 = [v12 destination];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v21 = v20;
      }
      else {
        id v21 = 0;
      }
      id v22 = v21;

      if (v22)
      {
        v60 = v15;
        id v61 = v8;
        v23 = [v22 device];
        uint64_t v24 = [v23 deviceAddress];

        BOOL v25 = [v14 type] == 3;
        uint64_t v26 = [MEMORY[0x263EFF9A0] dictionary];
        [v26 setObject:v9 forKeyedSubscript:*MEMORY[0x263F0D060]];
        [v26 setObject:v17 forKeyedSubscript:v16];
        BOOL v56 = v25;
        __int16 v27 = [NSNumber numberWithBool:v25];
        [v26 setObject:v27 forKeyedSubscript:*MEMORY[0x263F0D068]];

        id v28 = [v24 idsIdentifier];
        __int16 v29 = [v28 UUIDString];
        [v26 setObject:v29 forKeyedSubscript:*MEMORY[0x263F0D050]];

        v59 = v24;
        v30 = [v24 idsDestination];
        [v26 setObject:v30 forKeyedSubscript:*MEMORY[0x263F0D058]];

        uint64_t v31 = [(HMDModernMessagingHandler *)self home];
        if (v31)
        {
          uint64_t v32 = [v12 userForHome:v31];
          uint64_t v33 = [v32 uuid];
          [v26 setObject:v33 forKeyedSubscript:*MEMORY[0x263F0D080]];
        }
        v58 = (void *)v31;
        v34 = objc_msgSend(MEMORY[0x263F42590], "messageWithName:qualityOfService:destination:payload:", *MEMORY[0x263F0D090], objc_msgSend(v12, "qualityOfService"), v63, v26);
        [v34 setTransport:v61];
        v64[0] = MEMORY[0x263EF8330];
        v64[1] = 3221225472;
        v64[2] = __86__HMDModernMessagingHandler__sendHMMMRemoteMessageToClient_clientMessageName_message___block_invoke;
        v64[3] = &unk_264A23898;
        BOOL v66 = v56;
        id v65 = v12;
        v35 = (void *)MEMORY[0x230FBD990]([v34 setResponseHandler:v64]);
        uint64_t v36 = self;
        v37 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          uint64_t v38 = HMFGetLogIdentifier();
          [v34 identifier];
          v57 = v17;
          v40 = id v39 = v22;
          *(_DWORD *)buf = 138543874;
          v68 = v38;
          __int16 v69 = 2112;
          id v70 = v40;
          __int16 v71 = 2112;
          id v72 = v9;
          _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_INFO, "%{public}@Dispatching HMMM message %@ with name: %@ to client", buf, 0x20u);

          id v22 = v39;
          uint64_t v17 = v57;
        }
        v41 = [(HMDModernMessagingHandler *)v36 localMessageDispatcher];
        [v41 sendMessage:v34];

        __int16 v15 = v60;
        id v8 = v61;
        v42 = v59;
      }
      else
      {
        v51 = (void *)MEMORY[0x230FBD990]();
        v52 = self;
        v53 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v55 = v54 = v15;
          *(_DWORD *)buf = 138543618;
          v68 = v55;
          __int16 v69 = 2112;
          id v70 = v12;
          _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_ERROR, "%{public}@Invalid sender for HMMT request: %@", buf, 0x16u);

          __int16 v15 = v54;
        }

        v42 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
        [v12 respondWithError:v42];
        id v22 = 0;
      }

      uint64_t v11 = v62;
    }
    else
    {
      v47 = (void *)MEMORY[0x230FBD990]();
      v48 = self;
      v49 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v50 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v68 = v50;
        __int16 v69 = 2112;
        id v70 = v12;
        _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_ERROR, "%{public}@Invalid message for HMMT request: %@", buf, 0x16u);
      }
      __int16 v15 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [v12 respondWithError:v15];
    }
  }
  else
  {
    v43 = (void *)MEMORY[0x230FBD990]();
    v44 = self;
    v45 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      v46 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v68 = v46;
      __int16 v69 = 2112;
      id v70 = v11;
      _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_ERROR, "%{public}@HMMM message received without valid prefix. Discarding: %@", buf, 0x16u);
    }
    id v14 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v11 respondWithError:v14];
  }
}

uint64_t __86__HMDModernMessagingHandler__sendHMMMRemoteMessageToClient_clientMessageName_message___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) respondWithPayload:a3 error:a2];
  }
  return result;
}

- (void)handleRegisterHMMMMessage:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [(HMDModernMessagingHandler *)v6 messageTargetUUID];
    int v22 = 138543874;
    v23 = v8;
    __int16 v24 = 2112;
    id v25 = v4;
    __int16 v26 = 2112;
    __int16 v27 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@handleRegisterHMMMMessage with message: %@ for target: %@", (uint8_t *)&v22, 0x20u);
  }
  id v10 = [v4 messagePayload];
  uint64_t v11 = objc_msgSend(v10, "hmf_stringForKey:", *MEMORY[0x263F0D060]);
  id v12 = objc_msgSend(v10, "hmf_dictionaryForKey:", *MEMORY[0x263F0D070]);
  int v13 = objc_msgSend(v12, "hmf_numberForKey:", *MEMORY[0x263F0D048]);
  if (!v13)
  {
    int v13 = [NSNumber numberWithInt:0];
  }
  id v14 = [v4 transport];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v15 = v14;
  }
  else {
    __int16 v15 = 0;
  }
  id v16 = v15;

  if (v16 && v11)
  {
    -[HMDModernMessagingHandler registerHMMMMessageHandlerWithMessageName:userRestriction:clientConnection:message:](v6, "registerHMMMMessageHandlerWithMessageName:userRestriction:clientConnection:message:", v11, [v13 integerValue], v16, v4);
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = v6;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v20 = HMFGetLogIdentifier();
      int v22 = 138543362;
      v23 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Error while registering HMMM request handler: could not determine XPC client or message name", (uint8_t *)&v22, 0xCu);
    }
    id v21 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    [v4 respondWithError:v21];
  }
}

- (void)registerHMMMMessageHandlerWithMessageName:(id)a3 userRestriction:(int64_t)a4 clientConnection:(id)a5 message:(id)a6
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v35 = a6;
  uint64_t v36 = [v11 clientIdentifier];
  id v12 = (void *)MEMORY[0x230FBD990]();
  int v13 = self;
  id v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    __int16 v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint64_t v38 = v15;
    __int16 v39 = 2112;
    id v40 = v10;
    __int16 v41 = 2112;
    v42 = v36;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Registering message name %@ for client identifier %@", buf, 0x20u);
  }
  id v16 = [[HMDModernMessagingRegistration alloc] initWithMessageName:v10 xpcConnection:v11];
  uint64_t v17 = [(HMDModernMessagingHandler *)v13 _policiesForHMMMRequestHandlerRestriction:a4];
  os_unfair_recursive_lock_lock_with_options();
  id v18 = [(HMDModernMessagingHandler *)v13 registrationsByMessageName];
  [v18 setObject:v16 forKeyedSubscript:v10];

  os_unfair_recursive_lock_unlock();
  uint64_t v19 = [(HMDModernMessagingHandler *)v13 eventPublisher];
  int v20 = [v19 launchOnDemandClientIdentifiersByMessageName];
  id v21 = [v20 objectForKeyedSubscript:v10];
  BOOL v22 = v21 == 0;

  v23 = (void *)MEMORY[0x230FBD990]();
  __int16 v24 = v13;
  id v25 = HMFGetOSLogHandle();
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
  if (v22)
  {
    if (v26)
    {
      __int16 v29 = HMFGetLogIdentifier();
      v30 = HMMMUserRestrictionToString();
      *(_DWORD *)buf = 138543874;
      uint64_t v38 = v29;
      __int16 v39 = 2112;
      id v40 = v10;
      __int16 v41 = 2112;
      v42 = v30;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Registering HMMM request handler for message name: %@ with userRestriction: %@", buf, 0x20u);
    }
    uint64_t v31 = [(HMDModernMessagingHandler *)v24 remoteMessageDispatcher];
    uint64_t v32 = [(HMDModernMessagingRegistration *)v16 prefixedMessageName];
    [v31 registerForMessage:v32 receiver:v24 policies:v17 selector:sel__handleHMMMRemoteMessage_];

    uint64_t v33 = [(HMDModernMessagingHandler *)v24 energyRemoteMessageDispatcher];
    v34 = [(HMDModernMessagingRegistration *)v16 prefixedMessageName];
    [v33 registerForMessage:v34 receiver:v24 policies:v17 selector:sel__handleHMMMRemoteMessage_];
  }
  else
  {
    if (v26)
    {
      __int16 v27 = HMFGetLogIdentifier();
      uint64_t v28 = HMMMUserRestrictionToString();
      *(_DWORD *)buf = 138543874;
      uint64_t v38 = v27;
      __int16 v39 = 2112;
      id v40 = v10;
      __int16 v41 = 2112;
      v42 = v28;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Not registering HMMM request handler for message name: %@ with userRestriction: %@, already registered via launch on demand", buf, 0x20u);
    }
  }
  [v35 respondWithSuccess];
  [(HMDModernMessagingHandler *)v24 _sendPendingHMMMRemoteMessagesForClientIdentifier:v36];
}

- (void)_handleXPCConnectionDeactivatedNotification:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"connection"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (!v8) {
    _HMFPreconditionFailure();
  }
  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v13 = [v8 clientIdentifier];
    *(_DWORD *)buf = 138543618;
    __int16 v24 = v12;
    __int16 v25 = 2112;
    BOOL v26 = v13;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@XPC connection deactivated with client identifier: %@", buf, 0x16u);
  }
  id v14 = [MEMORY[0x263EFF980] array];
  os_unfair_recursive_lock_lock_with_options();
  __int16 v15 = [(HMDModernMessagingHandler *)v10 registrationsByMessageName];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __73__HMDModernMessagingHandler__handleXPCConnectionDeactivatedNotification___block_invoke;
  v20[3] = &unk_264A23870;
  id v16 = v8;
  id v21 = v16;
  id v17 = v14;
  id v22 = v17;
  objc_msgSend(v15, "na_each:", v20);

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __73__HMDModernMessagingHandler__handleXPCConnectionDeactivatedNotification___block_invoke_2;
  v19[3] = &unk_264A2DBE8;
  v19[4] = v10;
  objc_msgSend(v17, "na_each:", v19);

  os_unfair_recursive_lock_unlock();
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __73__HMDModernMessagingHandler__handleXPCConnectionDeactivatedNotification___block_invoke_3;
  v18[3] = &unk_264A2DBE8;
  v18[4] = v10;
  objc_msgSend(v17, "na_each:", v18);
}

void __73__HMDModernMessagingHandler__handleXPCConnectionDeactivatedNotification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = [a3 xpcConnection];
  int v6 = [v5 isEqual:*(void *)(a1 + 32)];

  if (v6) {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

void __73__HMDModernMessagingHandler__handleXPCConnectionDeactivatedNotification___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 registrationsByMessageName];
  [v4 setObject:0 forKeyedSubscript:v3];
}

void __73__HMDModernMessagingHandler__handleXPCConnectionDeactivatedNotification___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) eventPublisher];
  id v5 = [v4 launchOnDemandClientIdentifiersByMessageName];
  int v6 = [v5 objectForKeyedSubscript:v3];

  if (!v6)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 32) messageTargetUUID];
      int v16 = 138543874;
      id v17 = v10;
      __int16 v18 = 2112;
      id v19 = v3;
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@(Cleanup) Deregistering for remote message with name: %@ for target: %@", (uint8_t *)&v16, 0x20u);
    }
    id v12 = [*(id *)(a1 + 32) remoteMessageDispatcher];
    int v13 = +[HMDModernMessagingRegistration prefixedHMMMMessageNameWithMessageName:v3];
    [v12 deregisterForMessage:v13 receiver:*(void *)(a1 + 32)];

    id v14 = [*(id *)(a1 + 32) energyRemoteMessageDispatcher];
    __int16 v15 = +[HMDModernMessagingRegistration prefixedHMMMMessageNameWithMessageName:v3];
    [v14 deregisterForMessage:v15 receiver:*(void *)(a1 + 32)];
  }
}

- (id)_policiesForHMMMRequestHandlerRestriction:(int64_t)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  if (a3 == 2)
  {
    id v4 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
    v10[0] = v4;
    id v5 = [(HMDModernMessagingHandler *)self userPolicy];
    v10[1] = v5;
    int v6 = v10;
  }
  else if (a3 == 1)
  {
    id v4 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
    v11[0] = v4;
    id v5 = [(HMDModernMessagingHandler *)self adminPolicy];
    v11[1] = v5;
    int v6 = v11;
  }
  else if (a3)
  {
    id v4 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
    v9[0] = v4;
    id v5 = [(HMDModernMessagingHandler *)self ownerPolicy];
    v9[1] = v5;
    int v6 = v9;
  }
  else
  {
    id v4 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
    v12[0] = v4;
    id v5 = [(HMDModernMessagingHandler *)self ownerPolicy];
    v12[1] = v5;
    int v6 = v12;
  }
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];

  return v7;
}

- (void)registerForMessages
{
  v27[2] = *MEMORY[0x263EF8340];
  id v3 = [(HMDModernMessagingHandler *)self localMessageDispatcher];
  uint64_t v4 = *MEMORY[0x263F0D098];
  id v5 = +[HMDXPCMessagePolicy policyWithEntitlements:4194309];
  v27[0] = v5;
  int v6 = +[HMDXPCBackgroundMessagePolicy policyWithEntitlementRequirement:1];
  v27[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  [v3 registerForMessage:v4 receiver:self policies:v7 selector:sel_handleSendHMMMMessage_];

  id v8 = [(HMDModernMessagingHandler *)self localMessageDispatcher];
  uint64_t v9 = *MEMORY[0x263F0D088];
  id v10 = +[HMDXPCMessagePolicy policyWithEntitlements:4194309];
  v26[0] = v10;
  id v11 = +[HMDXPCBackgroundMessagePolicy policyWithEntitlementRequirement:1];
  v26[1] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  [v8 registerForMessage:v9 receiver:self policies:v12 selector:sel_handleRegisterHMMMMessage_];

  int v13 = [(HMDModernMessagingHandler *)self localMessageDispatcher];
  uint64_t v14 = *MEMORY[0x263F0D0A0];
  __int16 v15 = +[HMDXPCMessagePolicy policyWithEntitlements:4194309];
  v25[0] = v15;
  int v16 = +[HMDXPCBackgroundMessagePolicy policyWithEntitlementRequirement:1];
  v25[1] = v16;
  id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  [v13 registerForMessage:v14 receiver:self policies:v17 selector:sel_handleUnregisterHMMMMessage_];

  __int16 v18 = [(HMDModernMessagingHandler *)self _policiesForHMMMRequestHandlerRestriction:2];
  id v19 = [(HMDModernMessagingHandler *)self eventPublisher];
  __int16 v20 = [v19 launchOnDemandClientIdentifiersByMessageName];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __48__HMDModernMessagingHandler_registerForMessages__block_invoke;
  v23[3] = &unk_264A23848;
  v23[4] = self;
  id v24 = v18;
  id v21 = v18;
  objc_msgSend(v20, "na_each:", v23);

  uint64_t v22 = [MEMORY[0x263F08A00] defaultCenter];
  [v22 addObserver:self selector:sel__handleXPCConnectionDeactivatedNotification_ name:@"HMDXPCClientConnectionDidDeactivateNotification" object:0];
}

void __48__HMDModernMessagingHandler_registerForMessages__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[HMDModernMessagingRegistration prefixedHMMMMessageNameWithMessageName:v5];
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = *(id *)(a1 + 32);
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [*(id *)(a1 + 32) messageTargetUUID];
    int v15 = 138543874;
    int v16 = v11;
    __int16 v17 = 2112;
    __int16 v18 = v7;
    __int16 v19 = 2112;
    __int16 v20 = v12;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Registering for launch on demand message with name: %@ for target: %@", (uint8_t *)&v15, 0x20u);
  }
  int v13 = [*(id *)(a1 + 32) remoteMessageDispatcher];
  [v13 registerForMessage:v7 receiver:*(void *)(a1 + 32) policies:*(void *)(a1 + 40) selector:sel__handleHMMMRemoteMessage_];

  uint64_t v14 = [*(id *)(a1 + 32) energyRemoteMessageDispatcher];
  [v14 registerForMessage:v7 receiver:*(void *)(a1 + 32) policies:*(void *)(a1 + 40) selector:sel__handleHMMMRemoteMessage_];
}

- (void)configureWithHome:(id)a3
{
  id v4 = a3;
  id v5 = +[HMDModernMessagingXPCEventPublisher shared];
  [(HMDModernMessagingHandler *)self configureWithHome:v4 xpcEventPublisher:v5];
}

- (void)configureWithHome:(id)a3 xpcEventPublisher:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(HMDModernMessagingHandler *)self setHome:v7];
  id v8 = [v7 messageTargetUUID];
  [(HMDModernMessagingHandler *)self setHomeUUID:v8];

  id v9 = [v7 messageReceiveQueue];
  [(HMDModernMessagingHandler *)self setWorkQueue:v9];

  id v10 = [v7 msgDispatcher];
  [(HMDModernMessagingHandler *)self setLocalMessageDispatcher:v10];

  [(HMDModernMessagingHandler *)self _createModernTransportInstance];
  [(HMDModernMessagingHandler *)self _createModernTransportEnergyInstance];
  id v11 = [(HMDModernMessagingHandler *)self _createRemoteMessageDispatcher];
  [(HMDModernMessagingHandler *)self setRemoteMessageDispatcher:v11];

  id v12 = [(HMDModernMessagingHandler *)self _createEnergyRemoteMessageDispatcher];
  [(HMDModernMessagingHandler *)self setEnergyRemoteMessageDispatcher:v12];

  int v13 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v7 userPrivilege:3 remoteAccessRequired:0];
  [(HMDModernMessagingHandler *)self setOwnerPolicy:v13];

  uint64_t v14 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v7 userPrivilege:4 remoteAccessRequired:0];
  [(HMDModernMessagingHandler *)self setAdminPolicy:v14];

  int v15 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v7 userPrivilege:0 remoteAccessRequired:0];

  [(HMDModernMessagingHandler *)self setUserPolicy:v15];
  [(HMDModernMessagingHandler *)self setEventPublisher:v6];

  [(HMDModernMessagingHandler *)self registerForMessages];
}

- (void)_createModernTransportEnergyInstance
{
  if (_os_feature_enabled_impl())
  {
    if (_createModernTransportEnergyInstance_onceToken != -1) {
      dispatch_once(&_createModernTransportEnergyInstance_onceToken, &__block_literal_global_48_175674);
    }
    uint64_t v3 = _createModernTransportEnergyInstance_modernTransport;
    [(HMDModernMessagingHandler *)self setModernTransportEnergyInstance:v3];
  }
}

void __65__HMDModernMessagingHandler__createModernTransportEnergyInstance__block_invoke()
{
  v0 = [HMDRapportMessageTransport alloc];
  v1 = +[HMDAccountRegistry sharedRegistry];
  id v10 = [(HMDRapportMessageTransport *)v0 initWithAccountRegistry:v1];

  v2 = [HMDIDSMessageTransport alloc];
  uint64_t v3 = +[HMDAccountRegistry sharedRegistry];
  id v4 = [(HMDIDSMessageTransport *)v2 initHMMMEnergyWithAccountRegistry:v3];

  id v5 = [HMDModernRemoteMessageTransport alloc];
  id v6 = +[HMDAccountRegistry sharedRegistry];
  uint64_t v7 = [(HMDModernRemoteMessageTransport *)v5 initWithAccountRegistry:v6 rapportTransport:v10 idsTransport:v4];
  id v8 = (void *)_createModernTransportEnergyInstance_modernTransport;
  _createModernTransportEnergyInstance_modernTransport = v7;

  [(id)_createModernTransportEnergyInstance_modernTransport setIsHMModernMessagingEnergyInstance:1];
  id v9 = (id)[(id)_createModernTransportEnergyInstance_modernTransport startHMMMEnergy];
}

- (void)_createModernTransportInstance
{
  if (_os_feature_enabled_impl())
  {
    if (_createModernTransportInstance_onceToken != -1) {
      dispatch_once(&_createModernTransportInstance_onceToken, &__block_literal_global_42_175679);
    }
    uint64_t v3 = _createModernTransportInstance_modernTransport;
    [(HMDModernMessagingHandler *)self setModernTransport:v3];
  }
}

void __59__HMDModernMessagingHandler__createModernTransportInstance__block_invoke()
{
  v0 = [HMDRapportMessageTransport alloc];
  v1 = +[HMDAccountRegistry sharedRegistry];
  id v10 = [(HMDRapportMessageTransport *)v0 initWithAccountRegistry:v1];

  v2 = [HMDIDSMessageTransport alloc];
  uint64_t v3 = +[HMDAccountRegistry sharedRegistry];
  id v4 = [(HMDIDSMessageTransport *)v2 initHMMMWithAccountRegistry:v3];

  id v5 = [HMDModernRemoteMessageTransport alloc];
  id v6 = +[HMDAccountRegistry sharedRegistry];
  uint64_t v7 = [(HMDModernRemoteMessageTransport *)v5 initWithAccountRegistry:v6 rapportTransport:v10 idsTransport:v4];
  id v8 = (void *)_createModernTransportInstance_modernTransport;
  _createModernTransportInstance_modernTransport = v7;

  [(id)_createModernTransportInstance_modernTransport setIsHMModernMessagingInstance:1];
  id v9 = (id)[(id)_createModernTransportInstance_modernTransport startHMMM];
}

- (id)_createEnergyRemoteMessageDispatcher
{
  if (_os_feature_enabled_impl())
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__HMDModernMessagingHandler__createEnergyRemoteMessageDispatcher__block_invoke;
    block[3] = &unk_264A2F7F8;
    block[4] = self;
    if (_createEnergyRemoteMessageDispatcher_onceToken != -1) {
      dispatch_once(&_createEnergyRemoteMessageDispatcher_onceToken, block);
    }
    id v3 = (id)_createEnergyRemoteMessageDispatcher_dispatcher;
  }
  else
  {
    id v3 = [(HMDModernMessagingHandler *)self localMessageDispatcher];
  }
  return v3;
}

void __65__HMDModernMessagingHandler__createEnergyRemoteMessageDispatcher__block_invoke(uint64_t a1)
{
  void v11[2] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F42578]);
  id v3 = [*(id *)(a1 + 32) modernTransportEnergyInstance];
  uint64_t v4 = [v2 initWithTransport:v3];
  id v5 = (void *)_createEnergyRemoteMessageDispatcher_dispatcher;
  _createEnergyRemoteMessageDispatcher_dispatcher = v4;

  id v6 = (void *)MEMORY[0x263EFFA08];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  id v8 = [v6 setWithArray:v7];
  [(id)_createEnergyRemoteMessageDispatcher_dispatcher setFilterClasses:v8];

  uint64_t v9 = _createEnergyRemoteMessageDispatcher_dispatcher;
  id v10 = [*(id *)(a1 + 32) modernTransportEnergyInstance];
  [v10 setDelegate:v9];
}

- (id)_createRemoteMessageDispatcher
{
  if (_os_feature_enabled_impl())
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__HMDModernMessagingHandler__createRemoteMessageDispatcher__block_invoke;
    block[3] = &unk_264A2F7F8;
    block[4] = self;
    if (_createRemoteMessageDispatcher_onceToken != -1) {
      dispatch_once(&_createRemoteMessageDispatcher_onceToken, block);
    }
    uint64_t v3 = _createRemoteMessageDispatcher_remoteDispatcher;
    uint64_t v4 = [(HMDModernMessagingHandler *)self modernTransport];
    [v4 setDelegate:v3];

    id v5 = (id)_createRemoteMessageDispatcher_remoteDispatcher;
  }
  else
  {
    id v5 = [(HMDModernMessagingHandler *)self localMessageDispatcher];
  }
  return v5;
}

void __59__HMDModernMessagingHandler__createRemoteMessageDispatcher__block_invoke(uint64_t a1)
{
  void v9[2] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F42578]);
  uint64_t v3 = [*(id *)(a1 + 32) modernTransport];
  uint64_t v4 = [v2 initWithTransport:v3];
  id v5 = (void *)_createRemoteMessageDispatcher_remoteDispatcher;
  _createRemoteMessageDispatcher_remoteDispatcher = v4;

  id v6 = (void *)MEMORY[0x263EFFA08];
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  id v8 = [v6 setWithArray:v7];
  [(id)_createRemoteMessageDispatcher_remoteDispatcher setFilterClasses:v8];
}

- (HMDModernMessagingHandler)init
{
  v8.receiver = self;
  v8.super_class = (Class)HMDModernMessagingHandler;
  id v2 = [(HMDModernMessagingHandler *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    registrationsByMessageName = v2->_registrationsByMessageName;
    v2->_registrationsByMessageName = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF980] arrayWithCapacity:30];
    pendingMessages = v2->_pendingMessages;
    v2->_pendingMessages = (NSMutableArray *)v5;
  }
  return v2;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_175688 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_175688, &__block_literal_global_175689);
  }
  id v2 = (void *)logCategory__hmf_once_v1_175690;
  return v2;
}

void __40__HMDModernMessagingHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_175690;
  logCategory__hmf_once_v1_175690 = v0;
}

@end