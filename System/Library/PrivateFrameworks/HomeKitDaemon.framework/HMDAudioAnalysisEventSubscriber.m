@interface HMDAudioAnalysisEventSubscriber
+ (id)logCategory;
- (BOOL)shouldPublishEvent:(id)a3;
- (HMDAudioAnalysisEventSubscriber)initWithContext:(id)a3;
- (HMDAudioAnalysisEventSubscriberContext)context;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)messageReceiveQueue;
- (id)logIdentifier;
- (id)mediaSystemLastKnownEventKeyForAccessoryUUID:(id)a3 pairedAccessoryUUID:(id)a4 reason:(unint64_t)a5;
- (id)stereoPairedCounterpartAccessory;
- (id)transformHMDBulletinToHMBulletin:(id)a3;
- (void)_handleAudioAnalysisEventMessage:(id)a3;
- (void)_postBulletinNotificationWithBulletin:(id)a3;
- (void)_postOrUpdateNotificationWithBulletin:(id)a3;
- (void)_postOrUpdateNotificationWithBulletin:(id)a3 stereoPairedAccessory:(id)a4;
- (void)_postUpdateEventRouterEventIfDifferent:(id)a3;
- (void)configureWithContext:(id)a3;
- (void)deregisterForMessages;
- (void)postNotificationForEvent:(id)a3;
- (void)postOrUpdateNotificationWithBulletinIfneeded:(id)a3;
- (void)registerForMessages;
@end

@implementation HMDAudioAnalysisEventSubscriber

- (void).cxx_destruct
{
}

- (HMDAudioAnalysisEventSubscriberContext)context
{
  return (HMDAudioAnalysisEventSubscriberContext *)objc_getProperty(self, a2, 8, 1);
}

- (void)_postUpdateEventRouterEventIfDifferent:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v58 = v8;
    __int16 v59 = 2112;
    id v60 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Posting audio analysis event for bulletin: %@", buf, 0x16u);
  }
  v9 = [v4 context];
  v10 = [v9 accessory];
  v11 = [v10 uuid];

  v12 = [v11 UUIDString];
  if (v12)
  {
    v13 = [(HMDAudioAnalysisEventSubscriber *)v6 transformHMDBulletinToHMBulletin:v4];
    v14 = (void *)MEMORY[0x263F0E110];
    v15 = [(HMDAudioAnalysisEventSubscriber *)v6 context];
    v16 = [v15 home];
    v17 = [v16 uuid];
    v18 = [v14 topicWithAccessoryUUID:v11 homeUUID:v17];

    if (!v18)
    {
      v37 = (void *)MEMORY[0x230FBD990]();
      v38 = v6;
      v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v40 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v58 = v40;
        _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@nil topic", buf, 0xCu);
      }
      goto LABEL_29;
    }
    v19 = [(HMDAudioAnalysisEventSubscriber *)v6 context];
    v20 = [v19 eventStoreReadHandle];

    v53 = v20;
    uint64_t v21 = [v20 lastEventForTopic:v18];
    v54 = (void *)v21;
    if (!v21) {
      goto LABEL_21;
    }
    id v55 = 0;
    v22 = [MEMORY[0x263F0E110] decodeBulletinsFromEvent:v21 error:&v55];
    id v23 = v55;
    if (!v23)
    {
      if (v22) {
        goto LABEL_11;
      }
    }
    v51 = v13;
    context = (void *)MEMORY[0x230FBD990]();
    v24 = v6;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v58 = v26;
      __int16 v59 = 2112;
      id v60 = v18;
      __int16 v61 = 2112;
      id v62 = v23;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Error reading stored event for topic %@, error: %@", buf, 0x20u);
    }

    v13 = v51;
    if (v22)
    {
LABEL_11:
      v27 = v13;
      int v28 = objc_msgSend(v22, "checkIfBulletinExists:", v13, context);
      v52 = (void *)MEMORY[0x230FBD990]();
      v29 = v6;
      v30 = HMFGetOSLogHandle();
      BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
      if (v28)
      {
        if (v31)
        {
          v32 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v58 = v32;
          __int16 v59 = 2112;
          id v60 = v27;
          _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Bulletin:%@ exists in events", buf, 0x16u);
        }
        v13 = v27;
        goto LABEL_28;
      }
      if (v31)
      {
        v46 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v58 = v46;
        __int16 v59 = 2112;
        id v60 = v27;
        _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Adding bulletin:%@ to events", buf, 0x16u);
      }
      v13 = v27;
      v45 = [v22 bulletinsByAddingOrReplacingBulletin:v27];
    }
    else
    {
LABEL_21:
      v41 = (void *)MEMORY[0x230FBD990]();
      v42 = v6;
      v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        v44 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v58 = v44;
        __int16 v59 = 2112;
        id v60 = v13;
        _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_INFO, "%{public}@Adding new bulletin:%@ to events", buf, 0x16u);
      }
      v56 = v13;
      v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v56 count:1];
      v22 = 0;
    }
    id v47 = objc_alloc(MEMORY[0x263F0E110]);
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    v48 = objc_msgSend(v47, "initWithBulletins:eventSource:eventTimestamp:", v45, v12);
    v49 = [(HMDAudioAnalysisEventSubscriber *)v6 context];
    [v49 forwardEvent:v48 topic:v18 completion:&__block_literal_global_163_52341];

LABEL_28:
LABEL_29:

    goto LABEL_30;
  }
  v33 = (void *)MEMORY[0x230FBD990]();
  v34 = v6;
  v35 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    v36 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v58 = v36;
    _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@nil event source", buf, 0xCu);
  }
LABEL_30:
}

- (id)transformHMDBulletinToHMBulletin:(id)a3
{
  id v3 = a3;
  id v4 = [v3 context];
  v5 = [v4 accessory];

  id v6 = objc_alloc(MEMORY[0x263F0E118]);
  v7 = [v5 spiClientIdentifier];
  v8 = [v5 home];
  v9 = [v8 spiClientIdentifier];
  v10 = [v3 startDate];
  v11 = [v3 dateOfOccurrence];
  uint64_t v12 = [v3 reason];
  uint64_t v13 = [v3 state];

  v14 = (void *)[v6 initWithAccessoryIdentifier:v7 homeIdentifier:v9 startDate:v10 endDate:v11 reason:v12 state:v13];
  return v14;
}

- (void)_handleAudioAnalysisEventMessage:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v20 = 138543618;
    uint64_t v21 = v8;
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Received audio analysis notification message %@", (uint8_t *)&v20, 0x16u);
  }
  v9 = [v4 messagePayload];
  v10 = objc_msgSend(v9, "hmf_dictionaryForKey:", @"HMDAudioAnalysisBulletinDataMessageKey");

  v11 = [[HMDAudioAnalysisEventBulletin alloc] initWithDictionary:v10];
  uint64_t v12 = [HMDAudioAnalysisNotificationReceivedLogEvent alloc];
  uint64_t v13 = [(HMDAudioAnalysisEventBulletin *)v11 reason];
  uint64_t v14 = [(HMDAudioAnalysisEventBulletin *)v11 state];
  v15 = [(HMDAudioAnalysisEventBulletin *)v11 dateOfOccurrence];
  v16 = [(HMDAudioAnalysisNotificationReceivedLogEvent *)v12 initWithReason:v13 state:v14 notificationSentDate:v15];

  v17 = [(HMDAudioAnalysisEventSubscriber *)v6 context];
  [(HMDAudioAnalysisEventBulletin *)v11 configureWithContext:v17];

  if (v11)
  {
    [(HMDAudioAnalysisEventSubscriber *)v6 postNotificationForEvent:v11];
    v18 = [(HMDAudioAnalysisEventSubscriber *)v6 context];
    [v18 submitLogEvent:v16];
  }
  v19 = [(HMDAudioAnalysisEventSubscriber *)v6 context];
  [v19 submitLogEvent:v16];

  [v4 respondWithPayload:0];
}

- (void)_postBulletinNotificationWithBulletin:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v12 = 138543618;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Posting audio analysis bulletin notification: %@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v9 = [v4 state];
  if (v9 == 1)
  {
    v10 = [(HMDAudioAnalysisEventSubscriber *)v6 context];
    v11 = [v10 bulletinBoard];
    [v11 updateAudioAnalysisEventNotification:v4];
    goto LABEL_7;
  }
  if (!v9)
  {
    v10 = [(HMDAudioAnalysisEventSubscriber *)v6 context];
    v11 = [v10 bulletinBoard];
    [v11 insertAudioAnalysisEventNotification:v4];
LABEL_7:
  }
}

- (void)_postOrUpdateNotificationWithBulletin:(id)a3
{
  id v4 = a3;
  [(HMDAudioAnalysisEventSubscriber *)self _postUpdateEventRouterEventIfDifferent:v4];
  [(HMDAudioAnalysisEventSubscriber *)self _postBulletinNotificationWithBulletin:v4];
}

- (id)mediaSystemLastKnownEventKeyForAccessoryUUID:(id)a3 pairedAccessoryUUID:(id)a4 reason:(unint64_t)a5
{
  v5 = 0;
  v18[2] = *MEMORY[0x263EF8340];
  if (a3 && a4)
  {
    id v8 = a4;
    uint64_t v9 = [a3 UUIDString];
    v18[0] = v9;
    v10 = [v8 UUIDString];

    v18[1] = v10;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];

    int v12 = [v11 sortedArrayUsingSelector:sel_compare_];

    uint64_t v13 = NSString;
    __int16 v14 = [v12 objectAtIndexedSubscript:0];
    id v15 = [v12 objectAtIndexedSubscript:1];
    uint64_t v16 = [NSNumber numberWithUnsignedInteger:a5];
    v5 = [v13 stringWithFormat:@"accessory:%@.accessory:%@.reason.%@", v14, v15, v16];
  }
  return v5;
}

- (void)_postOrUpdateNotificationWithBulletin:(id)a3 stereoPairedAccessory:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAudioAnalysisEventSubscriber *)self context];
  uint64_t v9 = [v8 uuid];
  v25 = v7;
  v10 = [v7 uuid];
  v11 = -[HMDAudioAnalysisEventSubscriber mediaSystemLastKnownEventKeyForAccessoryUUID:pairedAccessoryUUID:reason:](self, "mediaSystemLastKnownEventKeyForAccessoryUUID:pairedAccessoryUUID:reason:", v9, v10, [v6 reason]);

  int v12 = (void *)MEMORY[0x230FBD990]();
  uint64_t v13 = self;
  __int16 v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v30 = v15;
    __int16 v31 = 2112;
    v32 = v11;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Comparing key for stereo paired accessory: %@", buf, 0x16u);
  }
  uint64_t v16 = [(HMDAudioAnalysisEventSubscriber *)v13 transformHMDBulletinToHMBulletin:v6];
  v17 = [(HMDAudioAnalysisEventSubscriber *)v13 context];
  v18 = [v17 home];
  v19 = [v18 audioAnalysisStereoPairController];
  int v20 = [v6 context];
  uint64_t v21 = [v20 accessory];
  __int16 v22 = [v6 notificationUUID];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __95__HMDAudioAnalysisEventSubscriber__postOrUpdateNotificationWithBulletin_stereoPairedAccessory___block_invoke;
  v26[3] = &unk_264A1AA48;
  v26[4] = v13;
  id v27 = v11;
  id v28 = v6;
  id v23 = v6;
  id v24 = v11;
  [v19 compareOrUpdateRecentAudioAnalysisStereoPairEvent:v16 key:v24 accessory:v21 notificationUUID:v22 window:20 completion:v26];
}

void __95__HMDAudioAnalysisEventSubscriber__postOrUpdateNotificationWithBulletin_stereoPairedAccessory___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    uint64_t v9 = [*(id *)(a1 + 48) context];
    id v10 = [v9 accessory];

    if (v10 != v7)
    {
      v11 = [HMDAudioAnalysisEventSubscriberContext alloc];
      int v12 = [*(id *)(a1 + 32) context];
      uint64_t v13 = [v12 workQueue];
      __int16 v14 = [(HMDAudioAnalysisEventSubscriberContext *)v11 initWithAccessory:v7 queue:v13];

      [*(id *)(a1 + 48) configureWithContext:v14];
    }
    [*(id *)(a1 + 48) setNotificationUUID:v8];
    [*(id *)(a1 + 32) _postOrUpdateNotificationWithBulletin:*(void *)(a1 + 48)];
  }
  else
  {
    id v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = *(id *)(a1 + 32);
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      uint64_t v19 = *(void *)(a1 + 40);
      int v20 = 138543618;
      uint64_t v21 = v18;
      __int16 v22 = 2112;
      uint64_t v23 = v19;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Home found existing recent notification for key: %@", (uint8_t *)&v20, 0x16u);
    }
  }
}

- (void)postOrUpdateNotificationWithBulletinIfneeded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDAudioAnalysisEventSubscriber *)self stereoPairedCounterpartAccessory];
  id v6 = (id)v5;
  if (v5) {
    [(HMDAudioAnalysisEventSubscriber *)self _postOrUpdateNotificationWithBulletin:v4 stereoPairedAccessory:v5];
  }
  else {
    [(HMDAudioAnalysisEventSubscriber *)self _postOrUpdateNotificationWithBulletin:v4];
  }
}

- (void)postNotificationForEvent:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    uint64_t v9 = [v4 accessoryUUID];
    id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "reason"));
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "state"));
    int v12 = [v4 notificationUUID];
    int v17 = 138544386;
    v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    __int16 v22 = v10;
    __int16 v23 = 2112;
    uint64_t v24 = v11;
    __int16 v25 = 2112;
    v26 = v12;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Posting notification from accessoryUUID: %@, reason: %@, state: %@, notificationUUID: %@", (uint8_t *)&v17, 0x34u);
  }
  if ([(HMDAudioAnalysisEventSubscriber *)v6 shouldPublishEvent:v4])
  {
    [(HMDAudioAnalysisEventSubscriber *)v6 postOrUpdateNotificationWithBulletinIfneeded:v4];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    __int16 v14 = v6;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      int v17 = 138543618;
      v18 = v16;
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Notification predicate evaluation failed, not posting the notification for bulletin: %@", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (void)deregisterForMessages
{
  id v4 = [(HMDAudioAnalysisEventSubscriber *)self context];
  id v3 = [v4 dispatcher];
  [v3 deregisterReceiver:self];
}

- (void)registerForMessages
{
  v12[2] = *MEMORY[0x263EF8340];
  id v3 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  v12[0] = v3;
  id v4 = [(HMDAudioAnalysisEventSubscriber *)self context];
  uint64_t v5 = [v4 home];
  id v6 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v5 userPrivilege:0 remoteAccessRequired:0];
  v12[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];

  id v8 = [(HMDAudioAnalysisEventSubscriber *)self context];
  uint64_t v9 = [v8 dispatcher];
  [v9 registerForMessage:@"HMDAudioAnalysisEventMessageKey" receiver:self policies:v7 selector:sel__handleAudioAnalysisEventMessage_];

  id v10 = [(HMDAudioAnalysisEventSubscriber *)self context];
  v11 = [v10 dispatcher];
  [v11 registerForMessage:@"HMDAudioAnalysisPrimaryResidentRouteEventRequestMessage" receiver:self policies:v7 selector:sel__handleAudioAnalysisEventMessage_];
}

- (void)configureWithContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
  [(HMDAudioAnalysisEventSubscriber *)self registerForMessages];
}

- (HMDAudioAnalysisEventSubscriber)initWithContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDAudioAnalysisEventSubscriber;
  uint64_t v5 = [(HMDAudioAnalysisEventSubscriber *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(HMDAudioAnalysisEventSubscriber *)v5 configureWithContext:v4];
  }

  return v6;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  v2 = [(HMDAudioAnalysisEventSubscriber *)self context];
  id v3 = [v2 workQueue];

  return (OS_dispatch_queue *)v3;
}

- (NSUUID)messageTargetUUID
{
  v2 = [(HMDAudioAnalysisEventSubscriber *)self context];
  id v3 = [v2 uuid];

  return (NSUUID *)v3;
}

- (id)stereoPairedCounterpartAccessory
{
  id v3 = [(HMDAudioAnalysisEventSubscriber *)self context];
  id v4 = [v3 home];

  if (v4)
  {
    uint64_t v5 = [v4 mediaSystemController];
    id v6 = [v5 mediaSystems];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __67__HMDAudioAnalysisEventSubscriber_stereoPairedCounterpartAccessory__block_invoke;
    v14[3] = &unk_264A1BB98;
    v14[4] = self;
    id v7 = objc_msgSend(v6, "na_firstObjectPassingTest:", v14);

    objc_super v8 = [v7 accessories];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __67__HMDAudioAnalysisEventSubscriber_stereoPairedCounterpartAccessory__block_invoke_3;
    v13[3] = &unk_264A27218;
    v13[4] = self;
    uint64_t v9 = objc_msgSend(v8, "na_firstObjectPassingTest:", v13);

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

uint64_t __67__HMDAudioAnalysisEventSubscriber_stereoPairedCounterpartAccessory__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 accessories];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__HMDAudioAnalysisEventSubscriber_stereoPairedCounterpartAccessory__block_invoke_2;
  v6[3] = &unk_264A27218;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __67__HMDAudioAnalysisEventSubscriber_stereoPairedCounterpartAccessory__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 context];
  uint64_t v5 = [v4 accessory];
  id v6 = [v5 uuid];
  id v7 = [v3 uuid];

  uint64_t v8 = objc_msgSend(v6, "hmf_isEqualToUUID:", v7) ^ 1;
  return v8;
}

uint64_t __67__HMDAudioAnalysisEventSubscriber_stereoPairedCounterpartAccessory__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 context];
  uint64_t v5 = [v4 accessory];
  id v6 = [v5 uuid];
  id v7 = [v3 uuid];

  uint64_t v8 = objc_msgSend(v6, "hmf_isEqualToUUID:", v7);
  return v8;
}

- (BOOL)shouldPublishEvent:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!_os_feature_enabled_impl()) {
    goto LABEL_4;
  }
  uint64_t v5 = [v4 context];
  char v6 = [v5 isAudioAnalysisEventNotificationEnabled];

  if ((v6 & 1) == 0)
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = HMFGetLogIdentifier();
      uint64_t v13 = [v4 context];
      __int16 v14 = [v13 uuid];
      int v18 = 138543618;
      __int16 v19 = v12;
      __int16 v20 = 2112;
      __int16 v21 = v14;
      id v15 = "%{public}@Notification is not enabled for uuid %@";
LABEL_9:
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v18, 0x16u);
    }
LABEL_10:

    goto LABEL_11;
  }
  id v7 = [v4 context];
  uint64_t v8 = [v7 audioAnalysisEventNotificationCondition];

  if (!v8)
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    id v16 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = HMFGetLogIdentifier();
      uint64_t v13 = [v4 context];
      __int16 v14 = [v13 uuid];
      int v18 = 138543618;
      __int16 v19 = v12;
      __int16 v20 = 2112;
      __int16 v21 = v14;
      id v15 = "%{public}@Notification does not have a condition set for uuid %@";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_4:
  char v6 = 1;
LABEL_11:

  return v6;
}

- (id)logIdentifier
{
  v2 = [(HMDAudioAnalysisEventSubscriber *)self context];
  id v3 = [v2 uuid];
  id v4 = [v3 UUIDString];

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_52369 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_52369, &__block_literal_global_133);
  }
  v2 = (void *)logCategory__hmf_once_v3_52370;
  return v2;
}

void __46__HMDAudioAnalysisEventSubscriber_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v3_52370;
  logCategory__hmf_once_v3_52370 = v0;
}

@end