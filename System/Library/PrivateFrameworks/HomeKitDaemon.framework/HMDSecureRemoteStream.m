@interface HMDSecureRemoteStream
+ (id)logCategory;
- (BOOL)isAuthenticated;
- (BOOL)isIdle;
- (BOOL)isOpen;
- (BOOL)supportsSharedIdentities;
- (HMDDevice)currentDevice;
- (HMDDevice)peerDevice;
- (HMDSecureRemoteStream)initWithCurrentDevice:(id)a3 peerDevice:(id)a4 clientMode:(BOOL)a5 sessionID:(id)a6 accountRegistry:(id)a7;
- (HMDSecureRemoteStreamInternal)remoteSession;
- (HMDUser)peer;
- (HMFPairingIdentity)peerIdentity;
- (NSDate)lastActivity;
- (NSNumber)maximumRemoteStreams;
- (NSString)propertyDescription;
- (NSString)shortDescription;
- (NSUUID)sessionID;
- (id)logIdentifier;
- (int64_t)qualityOfService;
- (int64_t)role;
- (void)__handleAccountRemovedFromRegistry:(id)a3;
- (void)__handleDeviceRemovedFromAccount:(id)a3;
- (void)__handleRemovedIdentity:(id)a3;
- (void)_closeWithError:(id)a3;
- (void)_configureWithCompletionQueue:(id)a3 completionHandler:(id)a4;
- (void)closedWithError:(id)a3;
- (void)dealloc;
- (void)handleCompletedMessage:(id)a3 options:(id)a4 responsePayload:(id)a5 error:(id)a6 completionHandler:(id)a7;
- (void)handleSecureMessage:(id)a3 fromDevice:(id)a4 fromTransport:(id)a5;
- (void)sendMessage:(id)a3 completionHandler:(id)a4;
- (void)setAuthenticated:(BOOL)a3;
- (void)setIdle:(BOOL)a3;
- (void)setMaximumRemoteStreams:(id)a3;
- (void)setOpen:(BOOL)a3;
- (void)setPeer:(id)a3;
- (void)setPeerDevice:(id)a3;
- (void)setPeerIdentity:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setRemoteSession:(id)a3;
- (void)setSupportsSharedIdentities:(BOOL)a3;
- (void)startAndInvokeOnQueue:(id)a3 completionHandler:(id)a4;
- (void)stop;
@end

@implementation HMDSecureRemoteStream

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDevice, 0);
  objc_storeStrong((id *)&self->_remoteSession, 0);
  objc_storeStrong((id *)&self->_peerIdentity, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_lastActivity, 0);
  objc_storeStrong((id *)&self->_maximumRemoteStreams, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setSupportsSharedIdentities:(BOOL)a3
{
  self->_supportsSharedIdentities = a3;
}

- (BOOL)supportsSharedIdentities
{
  return self->_supportsSharedIdentities;
}

- (HMDDevice)currentDevice
{
  return self->_currentDevice;
}

- (void)setRemoteSession:(id)a3
{
}

- (HMDSecureRemoteStreamInternal)remoteSession
{
  return self->_remoteSession;
}

- (void)setPeerIdentity:(id)a3
{
}

- (HMFPairingIdentity)peerIdentity
{
  return self->_peerIdentity;
}

- (void)setPeer:(id)a3
{
}

- (HMDUser)peer
{
  return self->_peer;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (int64_t)role
{
  return self->_role;
}

- (id)logIdentifier
{
  v2 = [(HMDSecureRemoteStream *)self sessionID];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)__handleDeviceRemovedFromAccount:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__HMDSecureRemoteStream___handleDeviceRemovedFromAccount___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __58__HMDSecureRemoteStream___handleDeviceRemovedFromAccount___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) userInfo];
  v3 = [v2 valueForKey:@"HMDDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) peerDevice];
    int v7 = [v5 isEqual:v6];

    if (v7)
    {
      id v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = *(id *)(a1 + 40);
      v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = HMFGetLogIdentifier();
        int v13 = 138543362;
        v14 = v11;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Received notification device was removed from account", (uint8_t *)&v13, 0xCu);
      }
      v12 = [MEMORY[0x263F087E8] hmErrorWithCode:17 description:0 reason:@"Device was removed from account." suggestion:0];
      [*(id *)(a1 + 40) _closeWithError:v12];
    }
  }
}

- (void)__handleAccountRemovedFromRegistry:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__HMDSecureRemoteStream___handleAccountRemovedFromRegistry___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __60__HMDSecureRemoteStream___handleAccountRemovedFromRegistry___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) userInfo];
  v3 = [v2 objectForKeyedSubscript:@"HMDAccountNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) peerDevice];
    int v7 = [v6 account];
    int v8 = [v5 isEqual:v7];

    if (v8)
    {
      id v9 = (void *)MEMORY[0x230FBD990]();
      id v10 = *(id *)(a1 + 40);
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = HMFGetLogIdentifier();
        int v14 = 138543362;
        uint64_t v15 = v12;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Received notification account was removed from registry", (uint8_t *)&v14, 0xCu);
      }
      int v13 = [MEMORY[0x263F087E8] hmErrorWithCode:17 description:0 reason:@"Account was removed from registry." suggestion:0];
      [*(id *)(a1 + 40) _closeWithError:v13];
    }
  }
}

- (void)__handleRemovedIdentity:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__HMDSecureRemoteStream___handleRemovedIdentity___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __49__HMDSecureRemoteStream___handleRemovedIdentity___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) userInfo];
  v3 = [v2 objectForKeyedSubscript:@"HMDIdentityNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) peerIdentity];
    int v7 = HMFEqualObjects();

    if (v7)
    {
      id v8 = [*(id *)(a1 + 32) userInfo];
      id v9 = [v8 objectForKeyedSubscript:@"HMDAccountNotificationKey"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v10 = v9;
      }
      else {
        id v10 = 0;
      }
      id v11 = v10;

      if (v11)
      {
        v12 = [*(id *)(a1 + 40) peerDevice];
        int v13 = [v12 account];
        int v14 = HMFEqualObjects();

        if (v14)
        {
          uint64_t v15 = (void *)MEMORY[0x230FBD990]();
          id v16 = *(id *)(a1 + 40);
          v17 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v18 = HMFGetLogIdentifier();
            int v20 = 138543362;
            v21 = v18;
            _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Received notification peer identity was removed", (uint8_t *)&v20, 0xCu);
          }
          v19 = [MEMORY[0x263F087E8] hmErrorWithCode:17 description:0 reason:@"Identity was removed." suggestion:0];
          [*(id *)(a1 + 40) _closeWithError:v19];
        }
      }
    }
  }
}

- (void)handleSecureMessage:(id)a3 fromDevice:(id)a4 fromTransport:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __70__HMDSecureRemoteStream_handleSecureMessage_fromDevice_fromTransport___block_invoke;
  v15[3] = &unk_264A2E610;
  v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __70__HMDSecureRemoteStream_handleSecureMessage_fromDevice_fromTransport___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = *(void **)(a1 + 40);
    int v7 = [MEMORY[0x263EFFA08] setWithObject:@"kIDSMessageSourceIDKey"];
    id v8 = [v6 secureDescriptionWithBlacklistKeys:v7];
    *(_DWORD *)buf = 138543618;
    v29 = v5;
    __int16 v30 = 2112;
    v31 = v8;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Received encrypted secure message: %@", buf, 0x16u);
  }
  if (([*(id *)(a1 + 32) supportsSharedIdentities] & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 32), "setSupportsSharedIdentities:", objc_msgSend(*(id *)(a1 + 40), "hmf_BOOLForKey:", @"supportsSharedIdentities"));
  }
  id v9 = [*(id *)(a1 + 32) maximumRemoteStreams];

  if (!v9)
  {
    id v10 = objc_msgSend(*(id *)(a1 + 40), "hmf_numberForKey:", @"max");
    if (v10) {
      [*(id *)(a1 + 32) setMaximumRemoteStreams:v10];
    }
  }
  id v11 = *(void **)(a1 + 48);
  if (v11)
  {
    uint64_t v12 = [v11 transportType];
    uint64_t v13 = [(id)objc_opt_class() restriction];
    if (v13 == 2) {
      uint64_t v14 = 3;
    }
    else {
      uint64_t v14 = v13;
    }
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = -1;
  }
  uint64_t v15 = [*(id *)(a1 + 56) productInfo];
  [v15 productClass];
  HMFProductClassToString();
  id v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    id v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = HMFGetLogIdentifier();
      int v20 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      v29 = v19;
      __int16 v30 = 2112;
      v31 = v20;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Unable to map productClass for device %@", buf, 0x16u);
    }
    id v16 = @"Unknown";
  }
  v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v14, @"kRemoteMessageRestrictionKey");
  v27[0] = v21;
  v26[1] = @"kRemoteMessageTransportAttributionKey";
  uint64_t v22 = [NSNumber numberWithInt:v12];
  v27[1] = v22;
  v27[2] = v16;
  v26[2] = @"kRemoteMessagePeerInformationKey";
  v26[3] = @"HMDRemoteMessageReceivedTransportRestrictionKey";
  v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "restriction"));
  v27[3] = v23;
  v24 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];

  v25 = [*(id *)(a1 + 32) remoteSession];
  [v25 transportReceivedMessage:*(void *)(a1 + 40) options:v24];
}

- (void)handleCompletedMessage:(id)a3 options:(id)a4 responsePayload:(id)a5 error:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  queue = self->_queue;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __96__HMDSecureRemoteStream_handleCompletedMessage_options_responsePayload_error_completionHandler___block_invoke;
  v23[3] = &unk_264A2DF78;
  id v24 = v14;
  v25 = self;
  id v26 = v12;
  id v27 = v15;
  id v28 = v13;
  id v29 = v16;
  id v18 = v16;
  id v19 = v13;
  id v20 = v15;
  id v21 = v12;
  id v22 = v14;
  dispatch_async(queue, v23);
}

void __96__HMDSecureRemoteStream_handleCompletedMessage_options_responsePayload_error_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(*(id *)(a1 + 32), "hmf_dataForKey:", @"kIDSMessageResponseErrorDataKey");
  if (v2)
  {
    id v3 = (void *)MEMORY[0x263F08928];
    id v4 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    id v33 = 0;
    id v5 = [v3 _strictlyUnarchivedObjectOfClasses:v4 fromData:v2 error:&v33];
    id v6 = v33;

    if (!v5)
    {
      int v7 = (void *)MEMORY[0x230FBD990]();
      id v8 = *(id *)(a1 + 40);
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v35 = v10;
        __int16 v36 = 2112;
        id v37 = v6;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize error with error: %@", buf, 0x16u);
      }
      id v5 = [MEMORY[0x263F087E8] hmErrorWithCode:52 description:@"Generic error." reason:@"Failed to deserialize remote error." suggestion:0 underlyingError:v6];
    }
  }
  else
  {
    id v5 = 0;
  }

  id v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = *(id *)(a1 + 40);
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    id v15 = [*(id *)(a1 + 32) shortDescription];
    id v16 = [*(id *)(a1 + 48) name];
    id v17 = [*(id *)(a1 + 48) identifier];
    id v18 = [v17 UUIDString];
    uint64_t v19 = *(void *)(a1 + 56);
    uint64_t v20 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 138544898;
    v35 = v14;
    __int16 v36 = 2114;
    id v37 = v15;
    __int16 v38 = 2114;
    v39 = v16;
    __int16 v40 = 2114;
    v41 = v18;
    __int16 v42 = 2114;
    uint64_t v43 = v19;
    __int16 v44 = 2114;
    v45 = v5;
    __int16 v46 = 2114;
    uint64_t v47 = v20;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Received response %{public}@ to secure message: %{public}@ and identifier %{public}@, with transport error: %{public}@, error: %{public}@, options: %{public}@", buf, 0x48u);
  }
  id v21 = [MEMORY[0x263F424F0] currentActivity];
  [v21 markWithReason:@"Calling response handler"];

  id v22 = *(void **)(a1 + 56);
  if (!v22) {
    id v22 = v5;
  }
  id v23 = v22;
  uint64_t v24 = *(void *)(a1 + 72);
  if (v24) {
    (*(void (**)(uint64_t, id))(v24 + 16))(v24, v23);
  }
  v25 = [*(id *)(a1 + 48) responseHandler];

  if (v25)
  {
    id v26 = (void *)[*(id *)(a1 + 32) mutableCopy];
    id v27 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"kRemoteMessageTransportAttributionKey"];
    [v26 setObject:v27 forKeyedSubscript:@"kRemoteMessageTransportAttributionKey"];

    id v28 = [*(id *)(a1 + 48) responseHandler];
    ((void (**)(void, id, void *))v28)[2](v28, v23, v26);
  }
  id v29 = (void *)MEMORY[0x230FBD990]();
  id v30 = *(id *)(a1 + 40);
  v31 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    uint64_t v32 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v35 = v32;
    _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@The session is now idle", buf, 0xCu);
  }
  [*(id *)(a1 + 40) setIdle:1];
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  queue = self->_queue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__HMDSecureRemoteStream_sendMessage_completionHandler___block_invoke;
  v12[3] = &unk_264A2F470;
  id v13 = v7;
  id v14 = self;
  id v15 = v8;
  SEL v16 = a2;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, v12);
}

void __55__HMDSecureRemoteStream_sendMessage_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  if (!v4)
  {
    id v5 = [*(id *)(a1 + 32) name];
    id v6 = [*(id *)(a1 + 32) destination];
    id v7 = [*(id *)(a1 + 32) messagePayload];
    id v2 = +[HMDRemoteMessage secureMessageWithName:v5 destination:v6 messagePayload:v7];

    id v8 = [*(id *)(a1 + 32) identifier];
    [v2 setIdentifier:v8];

    id v9 = [*(id *)(a1 + 32) responseHandler];
    [v2 setResponseHandler:v9];
  }
  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = *(id *)(a1 + 40);
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = HMFGetLogIdentifier();
    id v14 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v41 = v13;
    __int16 v42 = 2112;
    id v43 = v14;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Sending message: %@", buf, 0x16u);
  }
  [*(id *)(a1 + 40) setIdle:0];
  uint64_t v15 = *(void *)(a1 + 32);
  id v37 = 0;
  SEL v16 = +[HMDRemoteMessageSerialization dictionaryForMessage:v15 error:&v37];
  id v17 = v37;
  if (!v16)
  {
    id v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = *(id *)(a1 + 40);
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v41 = v21;
      __int16 v42 = 2112;
      id v43 = v17;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Message serialization failed: %@", buf, 0x16u);
    }
  }
  v38[0] = @"kRemoteMessageRestrictionKey";
  id v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "restriction"));
  v39[0] = v22;
  v38[1] = @"kIDSMessageRequestTransactionIDKey";
  id v23 = [v2 identifier];
  uint64_t v24 = [v23 UUIDString];
  v39[1] = v24;
  v38[2] = @"kRemoteMessageAttributedMessageNameKey";
  v25 = [v2 name];
  v39[2] = v25;
  id v26 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];

  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  id v27 = objc_alloc(MEMORY[0x263F424F0]);
  id v28 = MEMORY[0x230FBBCF0](*(void *)(a1 + 40), *(void *)(a1 + 56));
  id v36 = (id)[v27 initWithName:v28];

  id v29 = [*(id *)(a1 + 40) remoteSession];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __55__HMDSecureRemoteStream_sendMessage_completionHandler___block_invoke_371;
  v31[3] = &unk_264A2DF50;
  id v32 = v36;
  objc_copyWeak(&v35, (id *)buf);
  id v30 = v2;
  id v33 = v30;
  id v34 = *(id *)(a1 + 48);
  [v29 sendRequest:v16 options:v26 responseHandler:v31];

  objc_destroyWeak(&v35);
  __HMFActivityScopeLeave();

  objc_destroyWeak((id *)buf);
}

void __55__HMDSecureRemoteStream_sendMessage_completionHandler___block_invoke_371(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  [*(id *)(a1 + 32) begin];
  id v15 = *(id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained handleCompletedMessage:*(void *)(a1 + 40) options:v8 responsePayload:v7 error:v9 completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    [*(id *)(a1 + 32) markWithReason:@"Calling response handler"];
    uint64_t v12 = *(void *)(a1 + 48);
    if (v12) {
      (*(void (**)(uint64_t, id))(v12 + 16))(v12, v9);
    }
    id v13 = [*(id *)(a1 + 40) responseHandler];

    if (v13)
    {
      id v14 = [*(id *)(a1 + 40) responseHandler];
      ((void (**)(void, id, id))v14)[2](v14, v9, v7);
    }
  }

  __HMFActivityScopeLeave();
  [*(id *)(a1 + 32) invalidate];
}

- (void)stop
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__HMDSecureRemoteStream_stop__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __29__HMDSecureRemoteStream_stop__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isOpen])
  {
    [*(id *)(a1 + 32) setOpen:0];
    id v2 = [*(id *)(a1 + 32) remoteSession];

    if (v2)
    {
      id v3 = [*(id *)(a1 + 32) remoteSession];
      [v3 stop];
    }
    else
    {
      id v3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:20 userInfo:0];
      objc_msgSend(*(id *)(a1 + 32), "_closeWithError:");
    }
  }
}

- (void)_closeWithError:(id)a3
{
  id v7 = a3;
  [(HMDSecureRemoteStream *)self setOpen:0];
  [(HMDSecureRemoteStream *)self setAuthenticated:0];
  id v4 = [(HMFMessageTransport *)self delegate];
  if ([v4 conformsToProtocol:&unk_26E4FD438]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (objc_opt_respondsToSelector()) {
    [v6 secureRemoteStream:self didCloseWithError:v7];
  }
}

- (void)closedWithError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__HMDSecureRemoteStream_closedWithError___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __41__HMDSecureRemoteStream_closedWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeWithError:*(void *)(a1 + 40)];
}

- (void)_configureWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F35AD0] systemStore];
  id v47 = 0;
  id v9 = [v8 getLocalPairingIdentity:&v47];
  id v10 = v47;

  if (v9)
  {
    id v11 = [HMDSecureRemoteStreamInternal alloc];
    int64_t v12 = [(HMDSecureRemoteStream *)self role];
    id v13 = [(HMDSecureRemoteStreamInternal *)v11 initWithType:v12 commitTimeout:hrsCommitTimeoutNanoseconds clientIdleTimeout:hrsIdleClientTimeoutNanoseconds serverIdleTimeout:hrsIdleServertTimeoutNanoseconds sendInternalTimeout:hrsSendInternalRequestTimeoutNanoseconds sendUserTimeout:hrsSendUserRequestTimeoutNanoseconds];
    [(HMDSecureRemoteStream *)self setRemoteSession:v13];

    queue = self->_queue;
    id v15 = [(HMDSecureRemoteStream *)self remoteSession];
    [v15 setDispatchQueue:queue];

    objc_initWeak((id *)location, self);
    if ([(HMDSecureRemoteStream *)self role] == 1)
    {
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_2;
      v40[3] = &unk_264A2DE38;
      objc_copyWeak(&v43, (id *)location);
      v41 = v6;
      id v42 = v7;
      SEL v16 = [(HMDSecureRemoteStream *)self remoteSession];
      [v16 setStartedHandler:v40];

      objc_destroyWeak(&v43);
    }
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_4;
    void v38[3] = &unk_264A2DE60;
    objc_copyWeak(&v39, (id *)location);
    id v17 = [(HMDSecureRemoteStream *)self remoteSession];
    [v17 setStoppedHandler:v38];

    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_344;
    v36[3] = &unk_264A2DE88;
    objc_copyWeak(&v37, (id *)location);
    id v18 = [(HMDSecureRemoteStream *)self remoteSession];
    [v18 setGetLocalIdentityHandler:v36];

    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_348;
    v34[3] = &unk_264A2DEB0;
    objc_copyWeak(&v35, (id *)location);
    id v19 = [(HMDSecureRemoteStream *)self remoteSession];
    [v19 setFindPeerHandler:v34];

    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_356;
    v32[3] = &unk_264A2DF00;
    objc_copyWeak(&v33, (id *)location);
    uint64_t v20 = [(HMDSecureRemoteStream *)self remoteSession];
    [v20 setRequestHandler:v32];

    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_3_366;
    v30[3] = &unk_264A2DF28;
    objc_copyWeak(&v31, (id *)location);
    id v21 = [(HMDSecureRemoteStream *)self remoteSession];
    [v21 setTransportSendMessage:v30];

    id v22 = [(HMDSecureRemoteStream *)self remoteSession];
    [v22 start];

    int64_t v23 = [(HMDSecureRemoteStream *)self role];
    if (v7 && v6 && v23 == 2)
    {
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_368;
      v28[3] = &unk_264A2DFA0;
      id v29 = v7;
      dispatch_async(v6, v28);
    }
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&v39);
    objc_destroyWeak((id *)location);
  }
  else
  {
    uint64_t v24 = (void *)MEMORY[0x230FBD990]();
    v25 = self;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = HMFGetLogIdentifier();
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v27;
      __int16 v49 = 2112;
      id v50 = v10;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot open stream, failed to get local pairing identity with error: %@", location, 0x16u);
    }
    if (v6 && v7)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke;
      block[3] = &unk_264A2F870;
      id v45 = v10;
      id v46 = v7;
      dispatch_async(v6, block);
    }
  }
}

void __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F087E8] hmErrorWithCode:48 description:@"Not supported" reason:@"Cannot send messages without a valid pairing identity" suggestion:0 underlyingError:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (v3) {
    [WeakRetained _closeWithError:v3];
  }
  else {
    [WeakRetained setOpen:1];
  }
  id v6 = *(NSObject **)(a1 + 32);
  if (v6)
  {
    id v7 = *(void **)(a1 + 40);
    if (v7)
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_3;
      v8[3] = &unk_264A2F870;
      id v10 = v7;
      id v9 = v3;
      dispatch_async(v6, v8);
    }
  }
}

void __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = WeakRetained;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      int v9 = 138543618;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Received notification that remote session has stopped due to error: %@", (uint8_t *)&v9, 0x16u);
    }
    [v6 _closeWithError:v3];
  }
}

id __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_344(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = [MEMORY[0x263F35AD0] systemStore];
  id v5 = [v4 getLocalPairingIdentity:a2];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && v5)
  {
    id v7 = +[HMDDeviceCapabilities deviceCapabilities];
    if ([v7 isRemoteGatewayCapable])
    {
      char v8 = [WeakRetained supportsSharedIdentities];

      if ((v8 & 1) == 0)
      {
        int v9 = [WeakRetained currentDevice];
        id v10 = [v9 account];
        __int16 v11 = [v10 identities];
        int v12 = [v11 containsObject:v5];

        if (v12)
        {
          uint64_t v13 = (void *)MEMORY[0x230FBD990]();
          id v14 = WeakRetained;
          id v15 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            SEL v16 = HMFGetLogIdentifier();
            int v25 = 138543362;
            id v26 = v16;
            _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Swapping out the local pairing identifier for legacy remote sessions", (uint8_t *)&v25, 0xCu);
          }
          id v17 = objc_alloc(MEMORY[0x263F425E8]);
          id v18 = [v14 currentDevice];
          id v19 = [v18 identifier];
          uint64_t v20 = [v19 UUIDString];
          id v21 = [v5 publicKey];
          id v22 = [v5 privateKey];
          uint64_t v23 = [v17 initWithIdentifier:v20 publicKey:v21 privateKey:v22];

          id v5 = (void *)v23;
        }
      }
    }
    else
    {
    }
  }

  return v5;
}

id __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_348(uint64_t a1, void *a2, void *a3)
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = +[HMDIdentityRegistry sharedRegistry];
    char v8 = [v7 identityForIdentifier:v5];

    if (v8)
    {
      [WeakRetained setPeerIdentity:v8];
      int v9 = [MEMORY[0x263F08A00] defaultCenter];
      id v10 = +[HMDIdentityRegistry sharedRegistry];
      [v9 addObserver:WeakRetained selector:sel___handleRemovedIdentity_ name:@"HMDIdentityRegistryRemovedIdentity" object:v10];

      __int16 v11 = [WeakRetained peerDevice];
      int v12 = +[HMDAccountRegistry sharedRegistry];
      uint64_t v13 = [v12 deviceForDevice:v11];

      if (v13 && v11 != v13)
      {
        id v14 = (void *)MEMORY[0x230FBD990]();
        id v15 = WeakRetained;
        SEL v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v67 = a3;
          v18 = id v17 = v5;
          *(_DWORD *)buf = 138543874;
          v75 = v18;
          __int16 v76 = 2112;
          id v77 = v11;
          __int16 v78 = 2112;
          v79 = v13;
          _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Peer device resolved from the registry -- tracked: %@, resolved: %@", buf, 0x20u);

          id v5 = v17;
          a3 = v67;
        }

        id v19 = v13;

        [v15 setPeerDevice:v19];
        __int16 v11 = v19;
      }

      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      uint64_t v20 = +[HMDIdentityRegistry sharedRegistry];
      id v21 = [v20 accountsForIdentity:v8];

      uint64_t v22 = [v21 countByEnumeratingWithState:&v70 objects:v82 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v71;
LABEL_10:
        uint64_t v25 = 0;
        while (1)
        {
          if (*(void *)v71 != v24) {
            objc_enumerationMutation(v21);
          }
          if ([*(id *)(*((void *)&v70 + 1) + 8 * v25) isAuthenticated]) {
            break;
          }
          if (v23 == ++v25)
          {
            uint64_t v23 = [v21 countByEnumeratingWithState:&v70 objects:v82 count:16];
            if (v23) {
              goto LABEL_10;
            }
            goto LABEL_16;
          }
        }

        id v31 = [v11 identities];
        char v32 = [v31 containsObject:v8];

        if (v32)
        {
          id v33 = (void *)MEMORY[0x230FBD990]();
          id v34 = WeakRetained;
          id v35 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            id v36 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v75 = v36;
            _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@Successfully authenticated peer identity", buf, 0xCu);
          }
          [v34 setAuthenticated:1];
          goto LABEL_25;
        }
        __int16 v38 = [v11 account];
        id v45 = (void *)MEMORY[0x230FBD990]();
        id v46 = WeakRetained;
        id v47 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v68 = v45;
          v49 = id v48 = v5;
          id v50 = [v11 shortDescription];
          *(_DWORD *)buf = 138543618;
          v75 = v49;
          __int16 v76 = 2112;
          id v77 = v50;
          _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_ERROR, "%{public}@Failed to authenticate peer identity for device: %@", buf, 0x16u);

          id v5 = v48;
          id v45 = v68;
        }

        uint64_t v51 = (void *)MEMORY[0x230FBD990]();
        id v52 = v46;
        v53 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          v54 = HMFGetLogIdentifier();
          [v8 identifier];
          v55 = v69 = v38;
          [v11 shortDescription];
          v66 = v51;
          v57 = id v56 = v5;
          *(_DWORD *)buf = 138544130;
          v75 = v54;
          __int16 v76 = 2112;
          id v77 = v55;
          __int16 v78 = 2112;
          v79 = v57;
          __int16 v80 = 2112;
          v81 = v69;
          _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_INFO, "%{public}@The provided pairing identity, %@, for peer, %@, is not registered to account: %@", buf, 0x2Au);

          id v5 = v56;
          uint64_t v51 = v66;

          __int16 v38 = v69;
        }

        if (a3)
        {
          [MEMORY[0x263F087E8] hmErrorWithCode:55];
          id v30 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v30 = 0;
        }
      }
      else
      {
LABEL_16:

        id v26 = (void *)MEMORY[0x230FBD990]();
        id v27 = WeakRetained;
        id v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          id v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v75 = v29;
          _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping account authentication check as the peer account is not authenticated", buf, 0xCu);
        }
LABEL_25:
        id v37 = [v11 remoteDestinationString];
        __int16 v38 = +[HMDAccountHandle accountHandleForDestination:v37];

        if (v38)
        {
          id v39 = [[HMDUser alloc] initWithAccountHandle:v38 home:0 pairingIdentity:v8 privilege:2];
          [WeakRetained setPeer:v39];
        }
        else
        {
          v58 = (void *)MEMORY[0x230FBD990]();
          id v59 = WeakRetained;
          v60 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            v61 = HMFGetLogIdentifier();
            [v11 remoteDestinationString];
            v63 = id v62 = v5;
            *(_DWORD *)buf = 138543618;
            v75 = v61;
            __int16 v76 = 2112;
            id v77 = v63;
            _os_log_impl(&dword_22F52A000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@[HMDSecureSession] Unable to get the 'userID' from destination '%@'", buf, 0x16u);

            id v5 = v62;
          }
        }
        v64 = [v8 publicKey];
        id v30 = [v64 data];
      }
    }
    else
    {
      __int16 v40 = (void *)MEMORY[0x230FBD990]();
      id v41 = WeakRetained;
      id v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        id v43 = HMFGetLogIdentifier();
        uint64_t v44 = [v41 peerDevice];
        *(_DWORD *)buf = 138543874;
        v75 = v43;
        __int16 v76 = 2112;
        id v77 = v5;
        __int16 v78 = 2112;
        v79 = v44;
        _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to find identity, %@, for peer: %@", buf, 0x20u);
      }
      if (a3)
      {
        [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:2 userInfo:0];
        id v30 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v30 = 0;
      }
    }
  }
  else if (a3)
  {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:20 userInfo:0];
    id v30 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v30 = 0;
  }

  return v30;
}

void __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_356(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v9 = a2;
  queue = a3;
  id v10 = a4;
  id v11 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v69 = 0;
    uint64_t v13 = +[HMDRemoteMessageSerialization remoteMessageWithDictionary:v9 error:&v69];
    id v14 = v69;
    id v15 = [v13 name];
    int v16 = [v15 isEqualToString:@"kRemoteAccessReverseConnectionRequestKey"];

    if (v16)
    {
      id v59 = v14;
      id v17 = v11;
      id v18 = (void *)MEMORY[0x230FBD990]();
      id v19 = WeakRetained;
      uint64_t v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = HMFGetLogIdentifier();
        [v13 name];
        v23 = id v22 = v10;
        *(_DWORD *)buf = 138543618;
        long long v71 = v21;
        __int16 v72 = 2112;
        long long v73 = v23;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Received request to setup reverse secure connection: %@", buf, 0x16u);

        id v10 = v22;
      }

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_358;
      block[3] = &unk_264A2DFA0;
      id v11 = v17;
      id v68 = v17;
      dispatch_async(queue, block);
      uint64_t v24 = v68;
      id v14 = v59;
    }
    else
    {
      v60 = v11;
      uint64_t v25 = objc_msgSend(v10, "hmf_numberForKey:", @"HMDRemoteMessageReceivedTransportRestrictionKey");
      uint64_t v26 = [v25 unsignedIntegerValue];

      [v13 setRestriction:v26];
      id v27 = [v13 messagePayload];
      uint64_t v24 = (void *)[v27 mutableCopy];

      if (!v24)
      {
        uint64_t v24 = [MEMORY[0x263EFF9A0] dictionary];
      }
      id v28 = [WeakRetained peerDevice];
      id v29 = [v28 remoteDestinationString];
      [v24 setObject:v29 forKeyedSubscript:@"kIDSMessageSourceIDKey"];

      [v13 setMessagePayload:v24];
      id v30 = [v13 userInfo];
      id v31 = (void *)[v30 mutableCopy];

      char v32 = [WeakRetained peerDevice];
      id v33 = [v32 remoteDestinationString];
      [v31 setObject:v33 forKeyedSubscript:@"kIDSMessageSourceIDKey"];

      uint64_t v34 = [WeakRetained peer];
      if (v34) {
        [v31 setObject:v34 forKeyedSubscript:@"kIDSMessageSourceUserKey"];
      }
      v57 = (void *)v34;
      id v35 = [v10 objectForKeyedSubscript:@"kRemoteMessageTransportAttributionKey"];
      [v31 setObject:v35 forKeyedSubscript:@"kRemoteMessageTransportAttributionKey"];

      id v36 = [v13 internal];
      v58 = v31;
      [v36 setUserInfo:v31];

      id v37 = [HMDRemoteDeviceMessageDestination alloc];
      __int16 v38 = [v13 destination];
      id v39 = [v38 target];
      __int16 v40 = [WeakRetained peerDevice];
      uint64_t v41 = [(HMDRemoteDeviceMessageDestination *)v37 initWithTarget:v39 device:v40];

      id v56 = (void *)v41;
      [v13 setDestination:v41];
      id v42 = (void *)MEMORY[0x230FBD990]([v13 setSecure:1]);
      id v43 = WeakRetained;
      uint64_t v44 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v45 = v53 = v42;
        [v13 messagePayload];
        id v46 = v55 = v9;
        [MEMORY[0x263EFFA08] setWithObject:@"kIDSMessageSourceIDKey"];
        v48 = id v47 = v14;
        [v46 secureDescriptionWithBlacklistKeys:v48];
        __int16 v49 = v54 = v10;
        *(_DWORD *)buf = 138543874;
        long long v71 = v45;
        __int16 v72 = 2112;
        long long v73 = v13;
        __int16 v74 = 2112;
        v75 = v49;
        _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_INFO, "%{public}@Received decrypted secure message, %@, with payload: %@", buf, 0x20u);

        id v14 = v47;
        id v9 = v55;

        id v10 = v54;
        id v42 = v53;
      }

      id v50 = [v13 name];
      v62[0] = MEMORY[0x263EF8330];
      v62[1] = 3221225472;
      v62[2] = __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_361;
      v62[3] = &unk_264A2DED8;
      v62[4] = v43;
      id v63 = v50;
      v64 = queue;
      id v11 = v60;
      id v66 = v60;
      id v65 = v10;
      id v51 = v50;
      [v13 setInternalResponseHandler:v62];
      id v52 = [v43 delegate];
      [v52 messageTransport:v43 didReceiveMessage:v13];
    }
  }
}

void __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_3_366(uint64_t a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    char v8 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v5];
    id v9 = [WeakRetained sessionID];
    id v10 = [v9 UUIDString];
    [v8 setObject:v10 forKeyedSubscript:@"kIDSSecureSessionIDKey"];

    id v11 = objc_msgSend(v8, "hmf_stringForKey:", @"op");
    LODWORD(v10) = [v11 isEqualToString:@"pv"];

    if (v10)
    {
      [v8 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"supportsSharedIdentities"];
      uint64_t v13 = [NSNumber numberWithUnsignedInteger:maximumSecureRemoteStreams];
      [v8 setObject:v13 forKeyedSubscript:@"max"];

      uint64_t v12 = [WeakRetained role];
      if (v12 == 2) {
        uint64_t v12 = [v8 setObject:0 forKeyedSubscript:@"op"];
      }
    }
    id v14 = (void *)MEMORY[0x230FBD990](v12);
    id v15 = WeakRetained;
    int v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      id v18 = [v5 shortDescription];
      id v19 = [v15 peerDevice];
      int v38 = 138544130;
      id v39 = v17;
      __int16 v40 = 2112;
      uint64_t v41 = v18;
      __int16 v42 = 2112;
      id v43 = v19;
      __int16 v44 = 2112;
      id v45 = v6;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Sending encrypted secure message %@ to %@ with options:\n%@", (uint8_t *)&v38, 0x2Au);
    }
    uint64_t v20 = [HMDRemoteDeviceMessageDestination alloc];
    id v21 = [MEMORY[0x263F08C38] UUID];
    id v22 = [v15 peerDevice];
    uint64_t v23 = [(HMDRemoteDeviceMessageDestination *)v20 initWithTarget:v21 device:v22];

    uint64_t v24 = [v15 remoteSession];
    [v24 requestTimeout];
    double v26 = v25;

    double v27 = 0.0;
    if (v26 > 0.0)
    {
      id v28 = [v15 remoteSession];
      [v28 requestTimeout];
      double v27 = v29;
    }
    uint64_t v30 = [v15 role];
    id v31 = @"kSecureServerIDSMessageRequestKey";
    if (v30 == 1) {
      id v31 = @"kSecureClientIDSMessageRequestKey";
    }
    char v32 = v31;
    id v33 = [[HMDRemoteMessage alloc] initWithName:v32 destination:v23 payload:v8 type:3 timeout:0 secure:17 restriction:v27];
    uint64_t v34 = objc_msgSend(v6, "hmf_stringForKey:", @"kRemoteMessageAttributedMessageNameKey");

    [(HMDRemoteMessage *)v33 setAttributedMessageName:v34];
    id v35 = [v15 delegate];
    if ([v35 conformsToProtocol:&unk_26E4FD438]) {
      id v36 = v35;
    }
    else {
      id v36 = 0;
    }
    id v37 = v36;

    if (v37) {
      [v37 secureRemoteStream:v15 receivedRequestToSendMessage:v33];
    }
  }
}

uint64_t __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_368(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_358(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_361(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = [v6 shortDescription];
    *(_DWORD *)buf = 138544130;
    double v29 = v10;
    __int16 v30 = 2114;
    uint64_t v31 = v11;
    __int16 v32 = 2112;
    id v33 = v12;
    __int16 v34 = 2114;
    id v35 = v5;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Responding to decrypted secure message: %{public}@, payload %@ with error: %{public}@", buf, 0x2Au);
  }
  if (v5)
  {
    double v26 = @"kIDSMessageResponseErrorDataKey";
    uint64_t v13 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
    double v27 = v13;
    id v14 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];

    id v15 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_362;
    block[3] = &unk_264A2EE80;
    id v25 = *(id *)(a1 + 64);
    id v23 = v14;
    id v24 = *(id *)(a1 + 56);
    id v16 = v14;
    dispatch_async(v15, block);
  }
  else
  {
    id v17 = *(NSObject **)(a1 + 48);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_2_363;
    v18[3] = &unk_264A2EE80;
    id v21 = *(id *)(a1 + 64);
    id v19 = v6;
    id v20 = *(id *)(a1 + 56);
    dispatch_async(v17, v18);

    id v16 = v21;
  }
}

uint64_t __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_362(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

uint64_t __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_2_363(void *a1)
{
  if (a1[4]) {
    uint64_t v1 = a1[4];
  }
  else {
    uint64_t v1 = MEMORY[0x263EFFA78];
  }
  return (*(uint64_t (**)(void, uint64_t, void, void))(a1[6] + 16))(a1[6], v1, a1[5], 0);
}

uint64_t __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)startAndInvokeOnQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__HMDSecureRemoteStream_startAndInvokeOnQueue_completionHandler___block_invoke;
  block[3] = &unk_264A2EE80;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __65__HMDSecureRemoteStream_startAndInvokeOnQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = [*(id *)(a1 + 32) role];
    id v7 = @"server";
    if (v6 == 1) {
      id v7 = @"client";
    }
    int v9 = 138543618;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting secure session in %@ mode", (uint8_t *)&v9, 0x16u);
  }
  return [*(id *)(a1 + 32) _configureWithCompletionQueue:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (NSDate)lastActivity
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_lastActivity;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setIdle:(BOOL)a3
{
  int v3 = a3;
  if (a3)
  {
    id obj = 0;
  }
  else
  {
    id obj = [MEMORY[0x263EFF910] date];
  }
  os_unfair_lock_lock_with_options();
  int idle = self->_idle;
  if (idle != v3) {
    self->_int idle = v3;
  }
  if (obj) {
    objc_storeStrong((id *)&self->_lastActivity, obj);
  }
  os_unfair_lock_unlock(&self->_lock);
  if (idle != v3)
  {
    uint64_t v6 = [(HMFMessageTransport *)self delegate];
    if ([v6 conformsToProtocol:&unk_26E4FD438]) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v8 secureRemoteStreamIsIdle:self];
    }
  }
}

- (BOOL)isIdle
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_idle;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAuthenticated:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_authenticated = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isAuthenticated
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_authenticated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setOpen:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_open = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isOpen
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_open;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setMaximumRemoteStreams:(id)a3
{
  id v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  maximumRemoteStreams = self->_maximumRemoteStreams;
  self->_maximumRemoteStreams = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)maximumRemoteStreams
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_maximumRemoteStreams;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setQualityOfService:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_qualityOfService = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)qualityOfService
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t qualityOfService = self->_qualityOfService;
  os_unfair_lock_unlock(p_lock);
  return qualityOfService;
}

- (void)setPeerDevice:(id)a3
{
  id v10 = (HMDDevice *)a3;
  os_unfair_lock_lock_with_options();
  peerDevice = self->_peerDevice;
  if (peerDevice != v10)
  {
    uint64_t v6 = [(HMDDevice *)peerDevice account];
    if (v6)
    {
      id v7 = [MEMORY[0x263F08A00] defaultCenter];
      [v7 removeObserver:self name:@"HMDAccountRemovedDeviceNotification" object:v6];
    }
    objc_storeStrong((id *)&self->_peerDevice, a3);
    id v8 = [(HMDDevice *)self->_peerDevice account];
    if (v8)
    {
      int v9 = [MEMORY[0x263F08A00] defaultCenter];
      [v9 addObserver:self selector:sel___handleDeviceRemovedFromAccount_ name:@"HMDAccountRemovedDeviceNotification" object:v8];
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (HMDDevice)peerDevice
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_peerDevice;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)propertyDescription
{
  int v3 = NSString;
  id v4 = [(HMDSecureRemoteStream *)self sessionID];
  int64_t v5 = [(HMDSecureRemoteStream *)self role];
  uint64_t v6 = @"unknown";
  if (v5 == 2) {
    uint64_t v6 = @"server";
  }
  if (v5 == 1) {
    uint64_t v6 = @"client";
  }
  id v7 = v6;
  [(HMDSecureRemoteStream *)self qualityOfService];
  id v8 = HMFQualityOfServiceToString();
  [(HMDSecureRemoteStream *)self isIdle];
  int v9 = HMFBooleanToString();
  id v10 = [(HMDSecureRemoteStream *)self lastActivity];
  __int16 v11 = [v3 stringWithFormat:@", Identifier = %@, Role = %@, QoS = %@, Idle = %@, Last Activity = %@", v4, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (NSString)shortDescription
{
  int v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  int64_t v5 = [(HMDSecureRemoteStream *)self sessionID];
  uint64_t v6 = [v5 UUIDString];
  id v7 = [v3 stringWithFormat:@"%@ %@", v4, v6];

  return (NSString *)v7;
}

- (void)dealloc
{
  [(HMDSecureRemoteStreamInternal *)self->_remoteSession stop];
  v3.receiver = self;
  v3.super_class = (Class)HMDSecureRemoteStream;
  [(HMDSecureRemoteStream *)&v3 dealloc];
}

- (HMDSecureRemoteStream)initWithCurrentDevice:(id)a3 peerDevice:(id)a4 clientMode:(BOOL)a5 sessionID:(id)a6 accountRegistry:(id)a7
{
  BOOL v9 = a5;
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)HMDSecureRemoteStream;
  id v17 = [(HMDSecureRemoteStream *)&v32 init];
  if (v17)
  {
    id v30 = v14;
    id v31 = v13;
    HMDispatchQueueNameString();
    id v18 = objc_claimAutoreleasedReturnValue();
    id v19 = (const char *)[v18 UTF8String];
    id v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create(v19, v20);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v21;

    objc_storeStrong((id *)&v17->_currentDevice, a3);
    objc_storeStrong((id *)&v17->_peerDevice, a4);
    if (v9) {
      uint64_t v23 = 1;
    }
    else {
      uint64_t v23 = 2;
    }
    v17->_role = v23;
    objc_storeStrong((id *)&v17->_sessionID, a6);
    v17->_int idle = 1;
    v17->_int64_t qualityOfService = 9;
    uint64_t v24 = [MEMORY[0x263EFF910] distantPast];
    lastActivity = v17->_lastActivity;
    v17->_lastActivity = (NSDate *)v24;

    double v26 = [MEMORY[0x263F08A00] defaultCenter];
    [v26 addObserver:v17 selector:sel___handleAccountRemovedFromRegistry_ name:@"HMDAccountRegistryRemovedAccountNotification" object:v16];

    double v27 = [(HMDDevice *)v17->_peerDevice account];
    if (v27)
    {
      id v28 = [MEMORY[0x263F08A00] defaultCenter];
      [v28 addObserver:v17 selector:sel___handleDeviceRemovedFromAccount_ name:@"HMDAccountRemovedDeviceNotification" object:v27];
    }
    id v14 = v30;
    id v13 = v31;
  }

  return v17;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t98 != -1) {
    dispatch_once(&logCategory__hmf_once_t98, &__block_literal_global_397_258912);
  }
  id v2 = (void *)logCategory__hmf_once_v99;
  return v2;
}

void __36__HMDSecureRemoteStream_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v99;
  logCategory__hmf_once_v99 = v0;
}

@end