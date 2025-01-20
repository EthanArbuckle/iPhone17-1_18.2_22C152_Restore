@interface HMDMessageHandler
+ (id)logCategory;
- (BOOL)hasQueuedIncomingMessage:(id)a3;
- (BOOL)hasQueuedIncomingMessages;
- (BOOL)hasQueuedOutgoingMessage:(id)a3;
- (BOOL)hasQueuedOutgoingMessages;
- (BOOL)hasQueuedOutgoingMessagesForDevice:(id)a3;
- (BOOL)isReadyForIncomingMessage:(id)a3 error:(id *)a4;
- (BOOL)isReadyForOutgoingMessaging;
- (BOOL)shouldRelayIncomingMessage:(id)a3 error:(id *)a4;
- (HMDAppleAccountManager)appleAccountManager;
- (HMDHome)home;
- (HMDHomeManager)homeManager;
- (HMDMessageHandler)initWithMessageTargetUUID:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 ownerPrivateRemoteMessages:(id)a6 adminPrivateRemoteMessages:(id)a7 internalMessages:(id)a8 notifications:(id)a9 notificationsToObject:(id)a10;
- (HMDMessageHandler)initWithMessageTargetUUID:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 ownerPrivateRemoteMessages:(id)a6 adminPrivateRemoteMessages:(id)a7 internalMessages:(id)a8 notifications:(id)a9 notificationsToObject:(id)a10 appleAccountManager:(id)a11 metricsDispatcher:(id)a12;
- (HMDMessageHandlerDataSource)dataSource;
- (HMDMessageHandlerMetricsDispatcher)metricsDispatcher;
- (HMFMessageDispatcher)messageDispatcher;
- (NSArray)adminPrivateRemoteMessages;
- (NSArray)internalMessages;
- (NSArray)notifications;
- (NSArray)ownerPrivateRemoteMessages;
- (NSDictionary)notificationsToObject;
- (NSNotificationCenter)notificationCenter;
- (NSUUID)messageTargetUUID;
- (SEL)selectorForName:(id)a3;
- (id)attributeDescriptions;
- (id)currentAccountDevice;
- (id)dequeueIncomingMessage:(id)a3;
- (id)dequeueOutgoingMessage:(id)a3;
- (id)dequeueQueuedIncomingMessages;
- (id)deviceForMessage:(id)a3;
- (id)logIdentifier;
- (id)queuedIncomingMessages;
- (id)queuedOutgoingMessages;
- (id)queuedOutgoingMessagesForDevice:(id)a3;
- (void)_cleanUpDeviceMappingsForMessage:(id)a3;
- (void)_logMediaDestinationControllerUpdateMetricsUsingMessage:(id)a3;
- (void)associateDevice:(id)a3 withOutgoingMessage:(id)a4;
- (void)configureWithHome:(id)a3;
- (void)didTriggerMessageHandlerQueuedMessage:(id)a3;
- (void)didTriggerQueuedIncomingMessage:(id)a3;
- (void)didTriggerQueuedOutgoingMessage:(id)a3;
- (void)handleAccountAddedDeviceNotification:(id)a3;
- (void)queueIncomingMessage:(id)a3;
- (void)queueOutgoingMessage:(id)a3;
- (void)registerForMessagesWithHome:(id)a3;
- (void)registerForNotifications;
- (void)registerForSPIRemoteMessages:(id)a3 home:(id)a4 userPrivilege:(unint64_t)a5 internalBuildOnly:(BOOL)a6;
- (void)relayMessage:(id)a3;
- (void)relayMessage:(id)a3 shouldQueue:(BOOL)a4;
- (void)routeMessage:(id)a3;
- (void)routeMessage:(id)a3 shouldQueue:(BOOL)a4;
- (void)routeQueuedIncomingMessages;
- (void)sendQueuedOutgoingMessages;
- (void)sendQueuedOutgoingMessages:(id)a3;
- (void)sendQueuedOutgoingMessagesForDevice:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setHome:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)triggerQueuedIncomingMessagesTimeouts;
- (void)triggerQueuedOutgoingMessagesTimeouts;
@end

@implementation HMDMessageHandler

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_appleAccountManager, 0);
  objc_storeStrong((id *)&self->_metricsDispatcher, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_notificationsToObject, 0);
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_storeStrong((id *)&self->_internalMessages, 0);
  objc_storeStrong((id *)&self->_adminPrivateRemoteMessages, 0);
  objc_storeStrong((id *)&self->_ownerPrivateRemoteMessages, 0);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
  objc_storeStrong((id *)&self->_deviceIdentifierToQueuedOutgoingMessageNames, 0);
  objc_storeStrong((id *)&self->_messageNameToQueuedOutgoingMessage, 0);
  objc_storeStrong((id *)&self->_messageNameToQueuedIncomingMessages, 0);
}

- (void)setDataSource:(id)a3
{
}

- (HMDMessageHandlerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDMessageHandlerDataSource *)WeakRetained;
}

- (void)setHomeManager:(id)a3
{
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (HMDAppleAccountManager)appleAccountManager
{
  return (HMDAppleAccountManager *)objc_getProperty(self, a2, 112, 1);
}

- (HMDMessageHandlerMetricsDispatcher)metricsDispatcher
{
  return (HMDMessageHandlerMetricsDispatcher *)objc_getProperty(self, a2, 104, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 96, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 88, 1);
}

- (NSDictionary)notificationsToObject
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (NSArray)notifications
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (NSArray)internalMessages
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)adminPrivateRemoteMessages
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)ownerPrivateRemoteMessages
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)messageTargetUUID
{
  return self->_messageTargetUUID;
}

- (id)logIdentifier
{
  v2 = [(HMDMessageHandler *)self messageTargetUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDMessageHandler *)self messageTargetUUID];
  v5 = (void *)[v3 initWithName:@"messageTargetUUID" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (void)didTriggerQueuedOutgoingMessage:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 message];
  v6 = [(HMDMessageHandler *)self dequeueOutgoingMessage:v5];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:13];
    v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v13 = 138543874;
      v14 = v11;
      __int16 v15 = 2112;
      id v16 = v4;
      __int16 v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to send queued outgoing message: %@ error: %@", (uint8_t *)&v13, 0x20u);
    }
    [v6 respondWithError:v7];
    v12 = [(HMDMessageHandler *)v9 metricsDispatcher];
    [v12 submitFailureEventOfType:2 message:v6];
  }
}

- (void)didTriggerQueuedIncomingMessage:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 message];
  v6 = [(HMDMessageHandler *)self dequeueIncomingMessage:v5];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:13];
    v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v13 = 138543874;
      v14 = v11;
      __int16 v15 = 2112;
      id v16 = v4;
      __int16 v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to send queued incoming message: %@ error: %@", (uint8_t *)&v13, 0x20u);
    }
    [v6 respondWithError:v7];
    v12 = [(HMDMessageHandler *)v9 metricsDispatcher];
    [v12 submitFailureEventOfType:1 message:v6];
  }
}

- (void)didTriggerMessageHandlerQueuedMessage:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 message];
  BOOL v6 = [(HMDMessageHandler *)self hasQueuedIncomingMessage:v5];

  if (v6)
  {
    [(HMDMessageHandler *)self didTriggerQueuedIncomingMessage:v4];
  }
  else
  {
    v7 = [v4 message];
    BOOL v8 = [(HMDMessageHandler *)self hasQueuedOutgoingMessage:v7];

    if (v8)
    {
      [(HMDMessageHandler *)self didTriggerQueuedOutgoingMessage:v4];
    }
    else
    {
      v9 = (void *)MEMORY[0x1D9452090]();
      v10 = self;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = HMFGetLogIdentifier();
        int v13 = 138543618;
        v14 = v12;
        __int16 v15 = 2112;
        id v16 = v4;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Dropping unknown triggered queued message: %@", (uint8_t *)&v13, 0x16u);
      }
    }
  }
}

- (void)triggerQueuedIncomingMessagesTimeouts
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableDictionary *)self->_messageNameToQueuedIncomingMessages allValues];
  os_unfair_lock_unlock(p_lock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "delegate", (void)v11);
        [v10 didTriggerMessageHandlerQueuedMessage:v9];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)triggerQueuedOutgoingMessagesTimeouts
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableDictionary *)self->_messageNameToQueuedOutgoingMessage allValues];
  os_unfair_lock_unlock(p_lock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "delegate", (void)v11);
        [v10 didTriggerMessageHandlerQueuedMessage:v9];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)handleAccountAddedDeviceNotification:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKey:@"HMDDeviceNotificationKey"];

  id v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v8 = v7;
  }
  else {
    BOOL v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    v10 = [(HMDMessageHandler *)self currentAccountDevice];
    long long v11 = v10;
    if (v10)
    {
      long long v12 = [v10 identifier];
      long long v13 = [v9 identifier];
      if (objc_msgSend(v12, "hmf_isEqualToUUID:", v13))
      {
        BOOL v14 = [(HMDMessageHandler *)self hasQueuedOutgoingMessages];

        if (v14)
        {
          __int16 v15 = (void *)MEMORY[0x1D9452090]();
          uint64_t v16 = self;
          uint64_t v17 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v18 = HMFGetLogIdentifier();
            int v23 = 138543362;
            v24 = v18;
            _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Sending queued outgoing messages due to new account device added", (uint8_t *)&v23, 0xCu);
          }
          [(HMDMessageHandler *)v16 sendQueuedOutgoingMessages];
        }
      }
      else
      {
      }
    }
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x1D9452090]();
    v20 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      int v23 = 138543618;
      v24 = v22;
      __int16 v25 = 2112;
      id v26 = v4;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to get new device from notification: %@", (uint8_t *)&v23, 0x16u);
    }
  }
}

- (BOOL)isReadyForOutgoingMessaging
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDMessageHandler *)self appleAccountManager];
  id v4 = [v3 device];

  if (!v4)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    uint64_t v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      BOOL v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      long long v11 = v8;
      __int16 v12 = 2112;
      long long v13 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Not ready for outgoing messaging due to no device for account manager: %@", (uint8_t *)&v10, 0x16u);
    }
  }

  return v4 != 0;
}

- (id)currentAccountDevice
{
  v2 = [(HMDMessageHandler *)self appleAccountManager];
  id v3 = [v2 device];

  return v3;
}

- (id)deviceForMessage:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDMessageHandler *)self dataSource];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 messageHandler:self deviceForOutgoingMessage:v4];
  }
  else
  {
    BOOL v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = self;
    int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      long long v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      uint64_t v14 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get remote device message destination due to no data source", (uint8_t *)&v13, 0xCu);
    }
    id v7 = 0;
  }

  return v7;
}

- (SEL)selectorForName:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)[v4 length] >= 4)
  {
    id v5 = [v4 substringToIndex:4];
    uint64_t v6 = [v4 substringToIndex:4];
    id v7 = [v6 uppercaseString];
    if ([v5 isEqualToString:v7])
    {
      BOOL v8 = [v4 substringToIndex:3];
      int v9 = [v8 isEqualToString:@"HMD"];

      if (v9)
      {
        int v10 = NSString;
        long long v11 = v4;
        uint64_t v12 = 3;
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  if ((unint64_t)[v4 length] < 3) {
    goto LABEL_18;
  }
  int v13 = [v4 substringToIndex:3];
  uint64_t v14 = [v4 substringToIndex:3];
  uint64_t v15 = [v14 uppercaseString];
  if (([v13 isEqualToString:v15] & 1) == 0)
  {

    goto LABEL_18;
  }
  uint64_t v16 = [v4 substringToIndex:2];
  int v17 = [v16 isEqualToString:@"HM"];

  if (!v17)
  {
LABEL_18:
    uint64_t v19 = 0;
    goto LABEL_19;
  }
  int v10 = NSString;
  long long v11 = v4;
  uint64_t v12 = 2;
LABEL_10:
  v18 = [v11 substringFromIndex:v12];
  uint64_t v19 = [v10 stringWithFormat:@"handle%@:", v18];

  SEL v20 = NSSelectorFromString(v19);
  if (!v20)
  {
LABEL_19:
    v30 = (void *)MEMORY[0x1D9452090]();
    v31 = self;
    v32 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
LABEL_22:

      v21 = 0;
      goto LABEL_23;
    }
    v33 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v37 = v33;
    __int16 v38 = 2112;
    id v39 = v4;
    __int16 v40 = 2112;
    v41 = v19;
    v34 = "%{public}@Failed to parse name: %@ selector: %@";
LABEL_21:
    _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, v34, buf, 0x20u);

    goto LABEL_22;
  }
  v21 = v20;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v30 = (void *)MEMORY[0x1D9452090]();
    v31 = self;
    v32 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    v33 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v37 = v33;
    __int16 v38 = 2112;
    id v39 = v4;
    __int16 v40 = 2112;
    v41 = v19;
    v34 = "%{public}@Failed to get handler for name: %@ selector: %@";
    goto LABEL_21;
  }
  v22 = [(HMDMessageHandler *)self methodSignatureForSelector:v21];
  int v23 = NSString;
  id v24 = v22;
  __int16 v25 = objc_msgSend(v23, "stringWithUTF8String:", objc_msgSend(v24, "methodReturnType"));
  if (([v25 isEqualToString:@"v"] & 1) == 0)
  {
    id v26 = (void *)MEMORY[0x1D9452090]();
    uint64_t v27 = self;
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v37 = v29;
      __int16 v38 = 2112;
      id v39 = v4;
      __int16 v40 = 2112;
      v41 = v19;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to route message due to unsafe return type on handler for name: %@ selector: %@", buf, 0x20u);
    }
    v21 = 0;
  }

LABEL_23:
  return v21;
}

- (void)routeQueuedIncomingMessages
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDMessageHandler *)self dequeueQueuedIncomingMessages];
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = v7;
    __int16 v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Routing queued incoming messages: %@", buf, 0x16u);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[HMDMessageHandler routeMessage:](v5, "routeMessage:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)sendQueuedOutgoingMessages:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v20 = v8;
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Sending queued messages: %@", buf, 0x16u);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[HMDMessageHandler relayMessage:shouldQueue:](v6, "relayMessage:shouldQueue:", *(void *)(*((void *)&v14 + 1) + 8 * v13++), 0, (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)sendQueuedOutgoingMessagesForDevice:(id)a3
{
  id v4 = [(HMDMessageHandler *)self queuedOutgoingMessagesForDevice:a3];
  [(HMDMessageHandler *)self sendQueuedOutgoingMessages:v4];
}

- (void)sendQueuedOutgoingMessages
{
  id v3 = [(HMDMessageHandler *)self queuedOutgoingMessages];
  [(HMDMessageHandler *)self sendQueuedOutgoingMessages:v3];
}

- (BOOL)hasQueuedOutgoingMessagesForDevice:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  deviceIdentifierToQueuedOutgoingMessageNames = self->_deviceIdentifierToQueuedOutgoingMessageNames;
  id v7 = [v4 identifier];
  id v8 = [(NSMutableDictionary *)deviceIdentifierToQueuedOutgoingMessageNames objectForKey:v7];

  if (v8) {
    BOOL v9 = [v8 count] != 0;
  }
  else {
    BOOL v9 = 0;
  }

  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (BOOL)hasQueuedOutgoingMessages
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = [(NSMutableDictionary *)v2->_messageNameToQueuedOutgoingMessage count] != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)shouldRelayIncomingMessage:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HMDMessageHandler *)self dataSource];
  id v8 = [v7 messageHandler:self shouldRelayIncomingMessage:v6];
  BOOL v9 = v8;
  if (v8)
  {
    char v10 = [v8 BOOLValue];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      long long v14 = HMFGetLogIdentifier();
      int v16 = 138543618;
      long long v17 = v14;
      __int16 v18 = 2112;
      uint64_t v19 = v7;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get relay preference from data source: %@", (uint8_t *)&v16, 0x16u);
    }
    if (a4)
    {
      [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
      char v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (BOOL)isReadyForIncomingMessage:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HMDMessageHandler *)self dataSource];
  if (v7)
  {
    if (objc_opt_respondsToSelector()) {
      char v8 = [v7 messageHandler:self isReadyForIncomingMessage:v6];
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    BOOL v9 = (void *)MEMORY[0x1D9452090]();
    char v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v14 = 138543362;
      long long v15 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to get is ready for message value due to no data source", (uint8_t *)&v14, 0xCu);
    }
    if (a4)
    {
      [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
      char v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (void)relayMessage:(id)a3 shouldQueue:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  char v8 = self;
  BOOL v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    char v10 = HMFGetLogIdentifier();
    uint64_t v11 = HMFBooleanToString();
    int v41 = 138543874;
    uint64_t v42 = v10;
    __int16 v43 = 2112;
    id v44 = v6;
    __int16 v45 = 2112;
    v46 = v11;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Relaying message: %@ should queue: %@", (uint8_t *)&v41, 0x20u);
  }
  if ([v6 isRemote])
  {
    uint64_t v12 = (void *)MEMORY[0x1D9452090]();
    uint64_t v13 = v8;
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      long long v15 = HMFGetLogIdentifier();
      int v41 = 138543618;
      uint64_t v42 = v15;
      __int16 v43 = 2112;
      id v44 = v6;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to relay remote message: %@", (uint8_t *)&v41, 0x16u);
    }
    uint64_t v16 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:5];
    [v6 respondWithError:v16];
    long long v17 = [(HMDMessageHandler *)v13 metricsDispatcher];
    [v17 submitFailureEventOfType:0 message:v6];
  }
  else
  {
    if (v4) {
      [(HMDMessageHandler *)v8 queueOutgoingMessage:v6];
    }
    uint64_t v18 = [(HMDMessageHandler *)v8 deviceForMessage:v6];
    if (v18)
    {
      uint64_t v16 = (void *)v18;
      [(HMDMessageHandler *)v8 associateDevice:v18 withOutgoingMessage:v6];
      if ([(HMDMessageHandler *)v8 isReadyForOutgoingMessaging])
      {
        uint64_t v19 = [(HMDMessageHandler *)v8 dequeueOutgoingMessage:v6];

        if (v19)
        {
          uint64_t v20 = [HMDRemoteDeviceMessageDestination alloc];
          __int16 v21 = [(HMDMessageHandler *)v8 messageTargetUUID];
          id v22 = [(HMDRemoteDeviceMessageDestination *)v20 initWithTarget:v21 device:v16];

          uint64_t v23 = [(HMDMessageHandler *)v8 messageDispatcher];
          id v24 = [v19 name];
          uint64_t v25 = [v19 qualityOfService];
          id v26 = [v19 messagePayload];
          uint64_t v27 = +[HMDRemoteMessage secureMessageWithName:v24 qualityOfService:v25 destination:v22 messagePayload:v26];

          v28 = [v19 responseHandler];
          [v27 setResponseHandler:v28];

          [v23 sendMessage:v27];
          id v6 = v19;
        }
        else
        {
          v37 = (void *)MEMORY[0x1D9452090]();
          __int16 v38 = v8;
          id v39 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            __int16 v40 = HMFGetLogIdentifier();
            int v41 = 138543362;
            uint64_t v42 = v40;
            _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_INFO, "%{public}@Skipping relaying of message due to message already being dequeued on different thread", (uint8_t *)&v41, 0xCu);
          }
          id v6 = 0;
        }
      }
      else
      {
        v33 = (void *)MEMORY[0x1D9452090]();
        v34 = v8;
        v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v36 = HMFGetLogIdentifier();
          int v41 = 138543618;
          uint64_t v42 = v36;
          __int16 v43 = 2112;
          id v44 = v6;
          _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_INFO, "%{public}@Leaving message in queue until ready for outgoing message: %@", (uint8_t *)&v41, 0x16u);
        }
      }
    }
    else
    {
      v29 = (void *)MEMORY[0x1D9452090]();
      v30 = v8;
      v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v32 = HMFGetLogIdentifier();
        int v41 = 138543618;
        uint64_t v42 = v32;
        __int16 v43 = 2112;
        id v44 = v6;
        _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Leaving message in queue until device is found for message: %@", (uint8_t *)&v41, 0x16u);
      }
      uint64_t v16 = 0;
    }
  }
}

- (void)relayMessage:(id)a3
{
}

- (void)_logMediaDestinationControllerUpdateMetricsUsingMessage:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDMessageHandler *)self home];
  uint64_t v6 = [v5 homeTheaterSetupMetricDispatcher];
  id v7 = (void *)v6;
  if (v5 && v6)
  {
    char v8 = [v4 name];
    BOOL v9 = [v4 messagePayload];
    if ([v8 isEqualToString:@"HMMediaDestinationControllerUpdateDestinationRequestMessage"]&& v9)
    {
      char v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F2D8D8]];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = 0;
      }
      id v12 = v11;

      uint64_t v13 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v12];
      int v14 = (void *)MEMORY[0x1D9452090]();
      long long v15 = self;
      uint64_t v16 = HMFGetOSLogHandle();
      long long v17 = v16;
      __int16 v38 = (void *)v13;
      if (v12) {
        BOOL v18 = v13 == 0;
      }
      else {
        BOOL v18 = 1;
      }
      if (v18)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          int v41 = v19;
          __int16 v42 = 2112;
          id v43 = v12;
          __int16 v44 = 2112;
          id v45 = v38;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Destination UUID string %@ or UUID %@ is nil", buf, 0x20u);
        }
      }
      else
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          uint64_t v25 = v36 = v14;
          id v26 = [(HMDMessageHandler *)v15 messageTargetUUID];
          *(_DWORD *)buf = 138543874;
          int v41 = v25;
          __int16 v42 = 2112;
          id v43 = v26;
          __int16 v44 = 2112;
          id v45 = v12;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Received request to update controller %@ with destination identifier %@", buf, 0x20u);

          int v14 = v36;
        }

        if ([v12 isEqualToString:*MEMORY[0x1E4F2D8E0]])
        {
          uint64_t v27 = [(HMDMessageHandler *)v15 messageTargetUUID];
          [v7 markRequestReceivedForGroupIdentifier:v27 metricType:4 setupSessionIdentifier:0 setupSessionStartTimeMS:0];
        }
        else
        {
          double v39 = 0.0;
          v28 = [v5 homeManager];
          v29 = [v28 firstSetupSessionIdentifierOutputStartTime:&v39];

          v30 = (void *)MEMORY[0x1D9452090]();
          v31 = v15;
          v32 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v33 = v37 = v30;
            *(_DWORD *)buf = 138543618;
            int v41 = v33;
            __int16 v42 = 2112;
            id v43 = v29;
            _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_INFO, "%{public}@Found associated setup session identifier %@ during home theater grouping", buf, 0x16u);

            v30 = v37;
          }

          unint64_t v34 = 1000 * (unint64_t)v39;
          v35 = [(HMDMessageHandler *)v31 messageTargetUUID];
          [v7 markRequestReceivedForGroupIdentifier:v35 metricType:3 setupSessionIdentifier:v29 setupSessionStartTimeMS:v34];
        }
      }
    }
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x1D9452090]();
    __int16 v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v41 = v23;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to log media destination controller update metrics due to either no home or metric dispatcher", buf, 0xCu);
    }
  }
}

- (void)routeMessage:(id)a3 shouldQueue:(BOOL)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  char v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    BOOL v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v43 = v9;
    __int16 v44 = 2112;
    id v45 = v5;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Routing message: %@", buf, 0x16u);
  }
  char v10 = [v5 responseHandler];

  if (!v10)
  {
    BOOL v18 = (void *)MEMORY[0x1D9452090]();
    uint64_t v19 = v7;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v43 = v21;
      __int16 v44 = 2112;
      id v45 = v5;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to route message due to no response handler from message: %@", buf, 0x16u);
    }
    uint64_t v13 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
    goto LABEL_11;
  }
  [(HMDMessageHandler *)v7 queueIncomingMessage:v5];
  id v41 = 0;
  BOOL v11 = [(HMDMessageHandler *)v7 isReadyForIncomingMessage:v5 error:&v41];
  id v12 = v41;
  if (v12)
  {
    uint64_t v13 = v12;
    int v14 = (void *)MEMORY[0x1D9452090]();
    long long v15 = v7;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      long long v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v43 = v17;
      __int16 v44 = 2112;
      id v45 = v13;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to route message due to ready preference error: %@", buf, 0x16u);
    }
LABEL_11:
    [v5 respondWithError:v13];

    goto LABEL_12;
  }
  if (!v11) {
    goto LABEL_12;
  }
  id v22 = [(HMDMessageHandler *)v7 dequeueIncomingMessage:v5];

  if (v22)
  {
    id v40 = 0;
    BOOL v23 = [(HMDMessageHandler *)v7 shouldRelayIncomingMessage:v22 error:&v40];
    id v24 = v40;
    if (v24)
    {
      uint64_t v25 = v24;
      id v26 = (void *)MEMORY[0x1D9452090]();
      uint64_t v27 = v7;
      v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v43 = v29;
        __int16 v44 = 2112;
        id v45 = v25;
        _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to route message due to relay preference error: %@", buf, 0x16u);
      }
    }
    else
    {
      [(HMDMessageHandler *)v7 _logMediaDestinationControllerUpdateMetricsUsingMessage:v22];
      if (v23)
      {
        [(HMDMessageHandler *)v7 relayMessage:v22];
        goto LABEL_27;
      }
      unint64_t v34 = [v22 name];
      uint64_t v35 = [(HMDMessageHandler *)v7 selectorForName:v34];

      if (v35)
      {
        [(HMDMessageHandler *)v7 performSelector:v35 withObject:v22];
        goto LABEL_27;
      }
      v36 = (void *)MEMORY[0x1D9452090]();
      v37 = v7;
      __int16 v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        double v39 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v43 = v39;
        __int16 v44 = 2112;
        id v45 = v22;
        _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to route message due to no handler available for message: %@", buf, 0x16u);
      }
      uint64_t v25 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
    }
    [v22 respondWithError:v25];

LABEL_27:
    id v5 = v22;
    goto LABEL_12;
  }
  v30 = (void *)MEMORY[0x1D9452090]();
  v31 = v7;
  v32 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    v33 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v43 = v33;
    _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_INFO, "%{public}@Skipping routing message since message was already dequeued on another thread", buf, 0xCu);
  }
  id v5 = 0;
LABEL_12:
}

- (void)routeMessage:(id)a3
{
}

- (id)queuedOutgoingMessagesForDevice:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  deviceIdentifierToQueuedOutgoingMessageNames = self->_deviceIdentifierToQueuedOutgoingMessageNames;
  id v7 = [v4 identifier];
  char v8 = [(NSMutableDictionary *)deviceIdentifierToQueuedOutgoingMessageNames objectForKey:v7];

  if (v8)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__HMDMessageHandler_queuedOutgoingMessagesForDevice___block_invoke;
    v12[3] = &unk_1E6A17100;
    v12[4] = self;
    BOOL v9 = objc_msgSend(v8, "na_map:", v12);
    char v10 = [v9 allObjects];
  }
  else
  {
    char v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  os_unfair_lock_unlock(p_lock);
  return v10;
}

id __53__HMDMessageHandler_queuedOutgoingMessagesForDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:a2];
  id v3 = [v2 message];

  return v3;
}

- (id)queuedOutgoingMessages
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableDictionary *)self->_messageNameToQueuedOutgoingMessage allValues];
  os_unfair_lock_unlock(p_lock);
  id v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_48_174948);

  return v5;
}

uint64_t __43__HMDMessageHandler_queuedOutgoingMessages__block_invoke(uint64_t a1, void *a2)
{
  return [a2 message];
}

- (BOOL)hasQueuedOutgoingMessage:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v6 = [(NSMutableDictionary *)self->_messageNameToQueuedOutgoingMessage allValues];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__HMDMessageHandler_hasQueuedOutgoingMessage___block_invoke;
  v10[3] = &unk_1E6A170D8;
  id v7 = v4;
  id v11 = v7;
  char v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  os_unfair_lock_unlock(p_lock);
  return v8 != 0;
}

uint64_t __46__HMDMessageHandler_hasQueuedOutgoingMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (void)_cleanUpDeviceMappingsForMessage:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v5 = [(NSMutableDictionary *)self->_deviceIdentifierToQueuedOutgoingMessageNames allKeys];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v11 = [(NSMutableDictionary *)self->_deviceIdentifierToQueuedOutgoingMessageNames objectForKey:v10];
        if (v11)
        {
          id v12 = [v4 name];
          [v11 removeObject:v12];

          if (![v11 count]) {
            [(NSMutableDictionary *)self->_deviceIdentifierToQueuedOutgoingMessageNames removeObjectForKey:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (id)dequeueOutgoingMessage:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v8;
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Dequeueing outgoing message: %@", buf, 0x16u);
  }
  p_lock = &v6->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v10 = [(NSMutableDictionary *)v6->_messageNameToQueuedOutgoingMessage allValues];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __44__HMDMessageHandler_dequeueOutgoingMessage___block_invoke;
  v17[3] = &unk_1E6A170D8;
  id v11 = v4;
  id v18 = v11;
  id v12 = objc_msgSend(v10, "na_firstObjectPassingTest:", v17);

  if (v12)
  {
    [v12 setDelegate:0];
    [v12 suspendTimer];
    messageNameToQueuedOutgoingMessage = v6->_messageNameToQueuedOutgoingMessage;
    long long v14 = [v11 name];
    [(NSMutableDictionary *)messageNameToQueuedOutgoingMessage removeObjectForKey:v14];

    [(HMDMessageHandler *)v6 _cleanUpDeviceMappingsForMessage:v11];
    long long v15 = [v12 message];
  }
  else
  {
    long long v15 = 0;
  }

  os_unfair_lock_unlock(p_lock);
  return v15;
}

uint64_t __44__HMDMessageHandler_dequeueOutgoingMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  return v5;
}

- (void)associateDevice:(id)a3 withOutgoingMessage:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  BOOL v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v16 = 138543874;
    long long v17 = v11;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Associating device: %@ with outgoing message: %@", (uint8_t *)&v16, 0x20u);
  }
  p_lock = &v9->_lock;
  os_unfair_lock_lock_with_options();
  long long v13 = [v6 identifier];
  id v14 = [(NSMutableDictionary *)v9->_deviceIdentifierToQueuedOutgoingMessageNames objectForKey:v13];
  if (!v14)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(NSMutableDictionary *)v9->_deviceIdentifierToQueuedOutgoingMessageNames setObject:v14 forKey:v13];
  }
  long long v15 = [v7 name];
  [v14 addObject:v15];

  os_unfair_lock_unlock(p_lock);
}

- (void)queueOutgoingMessage:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v22 = 138543618;
    uint64_t v23 = v8;
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Queueing outgoing message: %@", (uint8_t *)&v22, 0x16u);
  }
  BOOL v9 = [[HMDMessageHandlerQueuedMessage alloc] initWithMessage:v4 timeInterval:180.0];
  [(HMDMessageHandlerQueuedMessage *)v9 setDelegate:v6];
  [(HMDMessageHandlerQueuedMessage *)v9 resumeTimer];
  os_unfair_lock_lock_with_options();
  messageNameToQueuedOutgoingMessage = v6->_messageNameToQueuedOutgoingMessage;
  id v11 = [(HMDMessageHandlerQueuedMessage *)v9 name];
  id v12 = [(NSMutableDictionary *)messageNameToQueuedOutgoingMessage objectForKey:v11];

  long long v13 = v6->_messageNameToQueuedOutgoingMessage;
  id v14 = [(HMDMessageHandlerQueuedMessage *)v9 name];
  [(NSMutableDictionary *)v13 setObject:v9 forKey:v14];

  os_unfair_lock_unlock(&v6->_lock);
  if (v12)
  {
    long long v15 = (void *)MEMORY[0x1D9452090]();
    int v16 = v6;
    long long v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      __int16 v18 = HMFGetLogIdentifier();
      id v19 = [v12 message];
      int v22 = 138543618;
      uint64_t v23 = v18;
      __int16 v24 = 2112;
      id v25 = v19;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Canceling queued outgoing message due to duplicate message name for message: %@", (uint8_t *)&v22, 0x16u);
    }
    [v12 setDelegate:0];
    [v12 suspendTimer];
    __int16 v20 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:12];
    id v21 = [v12 message];
    [v21 respondWithError:v20];
  }
}

- (BOOL)hasQueuedIncomingMessage:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(NSMutableDictionary *)self->_messageNameToQueuedIncomingMessages allValues];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__HMDMessageHandler_hasQueuedIncomingMessage___block_invoke;
  v10[3] = &unk_1E6A170D8;
  id v7 = v4;
  id v11 = v7;
  uint64_t v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  os_unfair_lock_unlock(p_lock);
  return v8 != 0;
}

uint64_t __46__HMDMessageHandler_hasQueuedIncomingMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (id)dequeueQueuedIncomingMessages
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = [(HMDMessageHandler *)v4 queuedIncomingMessages];
    int v11 = 138543618;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Dequeueing incoming messages: %@", (uint8_t *)&v11, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  uint64_t v8 = [(NSMutableDictionary *)v4->_messageNameToQueuedIncomingMessages allValues];
  [(NSMutableDictionary *)v4->_messageNameToQueuedIncomingMessages removeAllObjects];
  os_unfair_lock_unlock(&v4->_lock);
  BOOL v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_45_174959);

  return v9;
}

id __50__HMDMessageHandler_dequeueQueuedIncomingMessages__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setDelegate:0];
  [v2 suspendTimer];
  id v3 = [v2 message];

  return v3;
}

- (id)dequeueIncomingMessage:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v20 = v8;
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Dequeueing incoming message: %@", buf, 0x16u);
  }
  p_lock = &v6->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v10 = [(NSMutableDictionary *)v6->_messageNameToQueuedIncomingMessages allValues];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __44__HMDMessageHandler_dequeueIncomingMessage___block_invoke;
  v17[3] = &unk_1E6A170D8;
  id v11 = v4;
  id v18 = v11;
  id v12 = objc_msgSend(v10, "na_firstObjectPassingTest:", v17);

  if (v12)
  {
    [v12 setDelegate:0];
    [v12 suspendTimer];
    messageNameToQueuedIncomingMessages = v6->_messageNameToQueuedIncomingMessages;
    id v14 = [v11 name];
    [(NSMutableDictionary *)messageNameToQueuedIncomingMessages removeObjectForKey:v14];

    uint64_t v15 = [v12 message];
  }
  else
  {
    uint64_t v15 = 0;
  }

  os_unfair_lock_unlock(p_lock);
  return v15;
}

uint64_t __44__HMDMessageHandler_dequeueIncomingMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  return v5;
}

- (void)queueIncomingMessage:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v22 = 138543618;
    uint64_t v23 = v8;
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Queueing incoming message: %@", (uint8_t *)&v22, 0x16u);
  }
  BOOL v9 = [[HMDMessageHandlerQueuedMessage alloc] initWithMessage:v4 timeInterval:600.0];
  [(HMDMessageHandlerQueuedMessage *)v9 setDelegate:v6];
  [(HMDMessageHandlerQueuedMessage *)v9 resumeTimer];
  os_unfair_lock_lock_with_options();
  messageNameToQueuedIncomingMessages = v6->_messageNameToQueuedIncomingMessages;
  id v11 = [(HMDMessageHandlerQueuedMessage *)v9 name];
  id v12 = [(NSMutableDictionary *)messageNameToQueuedIncomingMessages objectForKey:v11];

  __int16 v13 = v6->_messageNameToQueuedIncomingMessages;
  id v14 = [(HMDMessageHandlerQueuedMessage *)v9 name];
  [(NSMutableDictionary *)v13 setObject:v9 forKey:v14];

  os_unfair_lock_unlock(&v6->_lock);
  if (v12)
  {
    uint64_t v15 = (void *)MEMORY[0x1D9452090]();
    int v16 = v6;
    long long v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      id v19 = [v12 message];
      int v22 = 138543618;
      uint64_t v23 = v18;
      __int16 v24 = 2112;
      id v25 = v19;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Canceling queued incoming message due to duplicate message name for message: %@", (uint8_t *)&v22, 0x16u);
    }
    [v12 setDelegate:0];
    [v12 suspendTimer];
    __int16 v20 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:12];
    __int16 v21 = [v12 message];
    [v21 respondWithError:v20];
  }
}

- (id)queuedIncomingMessages
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableDictionary *)self->_messageNameToQueuedIncomingMessages allValues];
  os_unfair_lock_unlock(p_lock);
  uint64_t v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_174964);

  return v5;
}

uint64_t __43__HMDMessageHandler_queuedIncomingMessages__block_invoke(uint64_t a1, void *a2)
{
  return [a2 message];
}

- (BOOL)hasQueuedIncomingMessages
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = [(NSMutableDictionary *)v2->_messageNameToQueuedIncomingMessages count] != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)registerForNotifications
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDMessageHandler *)self notifications];
  id v4 = [(HMDMessageHandler *)self notificationsToObject];
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v28 = v8;
    __int16 v29 = 2112;
    v30 = v3;
    __int16 v31 = 2112;
    v32 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Register for notifications: %@ notifications to objects: %@", buf, 0x20u);
  }
  BOOL v9 = [v4 allKeys];
  __int16 v21 = v3;
  uint64_t v10 = [v3 arrayByAddingObjectsFromArray:v9];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v17 = [(HMDMessageHandler *)v6 selectorForName:v16];
        if (v17)
        {
          uint64_t v18 = v17;
          id v19 = [v4 objectForKeyedSubscript:v16];
          __int16 v20 = [(HMDMessageHandler *)v6 notificationCenter];
          [v20 addObserver:v6 selector:v18 name:v16 object:v19];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }
}

- (void)registerForSPIRemoteMessages:(id)a3 home:(id)a4 userPrivilege:(unint64_t)a5 internalBuildOnly:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v27 = a4;
  if (v6 && (isInternalBuild() & 1) == 0)
  {
    id v19 = (void *)MEMORY[0x1D9452090]();
    __int16 v20 = self;
    __int16 v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      long long v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = v22;
      __int16 v36 = 2112;
      id v37 = v9;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Skipping registration for internal build messages: %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v26 = [(HMDMessageHandler *)self messageDispatcher];
    long long v25 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
    uint64_t v10 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v23 = v9;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          if ([(HMDMessageHandler *)self selectorForName:v16])
          {
            uint64_t v17 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v27 userPrivilege:a5 remoteAccessRequired:0];
            v32[0] = v17;
            v32[1] = v10;
            v32[2] = v25;
            uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];
            [v26 registerForMessage:v16 receiver:self policies:v18 selector:sel_routeMessage_];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v13);
    }

    id v9 = v23;
  }
}

- (void)registerForMessagesWithHome:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDMessageHandler *)self ownerPrivateRemoteMessages];
  BOOL v6 = [(HMDMessageHandler *)self adminPrivateRemoteMessages];
  id v7 = [(HMDMessageHandler *)self internalMessages];
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v12 = 138544130;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Registering for messages owner: %@, admin: %@, internal: %@", (uint8_t *)&v12, 0x2Au);
  }
  [(HMDMessageHandler *)v9 registerForSPIRemoteMessages:v5 home:v4 userPrivilege:3 internalBuildOnly:0];
  [(HMDMessageHandler *)v9 registerForSPIRemoteMessages:v6 home:v4 userPrivilege:4 internalBuildOnly:0];
  [(HMDMessageHandler *)v9 registerForSPIRemoteMessages:v7 home:v4 userPrivilege:3 internalBuildOnly:1];
}

- (void)configureWithHome:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  BOOL v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    id v11 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring", (uint8_t *)&v10, 0xCu);
  }
  [(HMDMessageHandler *)v6 registerForMessagesWithHome:v4];
  [(HMDMessageHandler *)v6 registerForNotifications];
  [(HMDMessageHandler *)v6 setHome:v4];
  id v9 = [v4 homeManager];
  [(HMDMessageHandler *)v6 setHomeManager:v9];
}

- (HMDMessageHandler)initWithMessageTargetUUID:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 ownerPrivateRemoteMessages:(id)a6 adminPrivateRemoteMessages:(id)a7 internalMessages:(id)a8 notifications:(id)a9 notificationsToObject:(id)a10 appleAccountManager:(id)a11 metricsDispatcher:(id)a12
{
  id v17 = a3;
  id v44 = a4;
  id v18 = a4;
  id v52 = a5;
  id v45 = a6;
  id v51 = a6;
  id v46 = a7;
  id v19 = a7;
  id v47 = a8;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v50 = a11;
  id v23 = a12;
  if (!v17)
  {
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v18)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v52)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v51)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  if (!v19)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  if (!v20)
  {
LABEL_18:
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  if (!v21)
  {
LABEL_19:
    _HMFPreconditionFailure();
    goto LABEL_20;
  }
  if (!v22)
  {
LABEL_20:
    _HMFPreconditionFailure();
    goto LABEL_21;
  }
  if (!v23)
  {
LABEL_21:
    uint64_t v35 = (HMDMessageHandler *)_HMFPreconditionFailure();
    return [(HMDMessageHandler *)v35 initWithMessageTargetUUID:v37 messageDispatcher:v38 notificationCenter:v39 ownerPrivateRemoteMessages:v40 adminPrivateRemoteMessages:v41 internalMessages:v42 notifications:a9 notificationsToObject:a10];
  }
  long long v24 = v23;
  v48 = v22;
  long long v25 = [v21 arrayByAddingObject:@"HMDAccountAddedDeviceNotification"];

  v53.receiver = self;
  v53.super_class = (Class)HMDMessageHandler;
  uint64_t v26 = [(HMDMessageHandler *)&v53 init];
  id v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_messageTargetUUID, a3);
    objc_storeStrong((id *)&v27->_messageDispatcher, v44);
    objc_storeStrong((id *)&v27->_notificationCenter, a5);
    objc_storeStrong((id *)&v27->_ownerPrivateRemoteMessages, v45);
    objc_storeStrong((id *)&v27->_adminPrivateRemoteMessages, v46);
    objc_storeStrong((id *)&v27->_internalMessages, v47);
    objc_storeStrong((id *)&v27->_notifications, v25);
    objc_storeStrong((id *)&v27->_notificationsToObject, a10);
    objc_storeStrong((id *)&v27->_appleAccountManager, a11);
    uint64_t v28 = [MEMORY[0x1E4F1CA60] dictionary];
    messageNameToQueuedIncomingMessages = v27->_messageNameToQueuedIncomingMessages;
    v27->_messageNameToQueuedIncomingMessages = (NSMutableDictionary *)v28;

    uint64_t v30 = [MEMORY[0x1E4F1CA60] dictionary];
    messageNameToQueuedOutgoingMessage = v27->_messageNameToQueuedOutgoingMessage;
    v27->_messageNameToQueuedOutgoingMessage = (NSMutableDictionary *)v30;

    uint64_t v32 = [MEMORY[0x1E4F1CA60] dictionary];
    deviceIdentifierToQueuedOutgoingMessageNames = v27->_deviceIdentifierToQueuedOutgoingMessageNames;
    v27->_deviceIdentifierToQueuedOutgoingMessageNames = (NSMutableDictionary *)v32;

    objc_storeStrong((id *)&v27->_metricsDispatcher, a12);
  }

  return v27;
}

- (HMDMessageHandler)initWithMessageTargetUUID:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 ownerPrivateRemoteMessages:(id)a6 adminPrivateRemoteMessages:(id)a7 internalMessages:(id)a8 notifications:(id)a9 notificationsToObject:(id)a10
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  long long v24 = [HMDMessageHandlerMetricsDispatcher alloc];
  long long v25 = +[HMDMetricsManager sharedLogEventSubmitter];
  uint64_t v26 = [(HMDMessageHandlerMetricsDispatcher *)v24 initWithIdentifier:v23 logEventSubmitter:v25];

  id v27 = +[HMDAppleAccountManager sharedManager];
  uint64_t v30 = [(HMDMessageHandler *)self initWithMessageTargetUUID:v23 messageDispatcher:v22 notificationCenter:v21 ownerPrivateRemoteMessages:v20 adminPrivateRemoteMessages:v19 internalMessages:v18 notifications:v17 notificationsToObject:v16 appleAccountManager:v27 metricsDispatcher:v26];

  return v30;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t59_175010 != -1) {
    dispatch_once(&logCategory__hmf_once_t59_175010, &__block_literal_global_69_175011);
  }
  id v2 = (void *)logCategory__hmf_once_v60_175012;
  return v2;
}

uint64_t __32__HMDMessageHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v60_175012;
  logCategory__hmf_once_v60_175012 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end