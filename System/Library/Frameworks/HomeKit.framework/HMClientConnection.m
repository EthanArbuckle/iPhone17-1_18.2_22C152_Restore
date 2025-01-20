@interface HMClientConnection
+ (BOOL)areAnyAccessoriesConfigured;
+ (BOOL)areAnyAppleTVAccessoriesConfigured;
+ (BOOL)areAnyHomePodMiniConfigured;
+ (BOOL)areAnyHomePodsConfigured;
+ (BOOL)areAnyLargeHomePodConfigured;
+ (BOOL)areAnySpeakersConfigured;
+ (BOOL)areAnyTelevisionAccessoriesConfigured;
+ (BOOL)areHomesConfigured;
+ (NSURL)siriHomeIdentifier;
+ (NSUUID)UUID;
+ (id)logCategory;
+ (id)sharedInstance;
+ (id)siriCurrentHome;
- (BOOL)areHomesConfigured;
- (BOOL)shouldRetrySendingSignOutMessageDueToError:(id)a3;
- (BOOL)shouldWeRetrySendingSignOutMessageToHomeKitDaemon;
- (HMClientConnection)init;
- (HMClientConnection)initWithAreHomesConfigured:(BOOL)a3;
- (HMClientConnection)initWithContext:(id)a3 areHomesConfigured:(BOOL)a4;
- (HMClientConnection)initWithNoValidation;
- (_HMContext)context;
- (void)_IDMSAccountUsernameModifiedWithCompletionHandler:(id)a3;
- (void)_primaryAccountDidChange:(id)a3 modified:(BOOL)a4 completionHandler:(id)a5;
- (void)_primaryAccountWasDeletedWithCompletionHandler:(id)a3;
- (void)_retrySendingSignOutWithCompletion:(id)a3;
- (void)notifyAccountStatusUpdate:(unint64_t)a3 accountIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)requestSiriSyncDataWithValidity:(id)a3 completion:(id)a4;
- (void)sendIntentRequestCommand:(id)a3 withPayload:(id)a4 completionHandler:(id)a5;
- (void)sendSiriCommand:(id)a3 completionHandler:(id)a4;
- (void)setShouldWeRetrySendingSignOutMessageToHomeKitDaemon:(BOOL)a3;
@end

@implementation HMClientConnection

- (void).cxx_destruct
{
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)setShouldWeRetrySendingSignOutMessageToHomeKitDaemon:(BOOL)a3
{
  self->_shouldWeRetrySendingSignOutMessageToHomeKitDaemon = a3;
}

- (BOOL)shouldWeRetrySendingSignOutMessageToHomeKitDaemon
{
  return self->_shouldWeRetrySendingSignOutMessageToHomeKitDaemon;
}

- (BOOL)areHomesConfigured
{
  return self->_homesConfigured;
}

- (BOOL)shouldRetrySendingSignOutMessageDueToError:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    goto LABEL_14;
  }
  v5 = (void *)MEMORY[0x19F3A64A0]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = HMFGetLogIdentifier();
    int v17 = 138543618;
    v18 = v8;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_ERROR, "%{public}@Error occurred while notifying homed about signout : %@", (uint8_t *)&v17, 0x16u);
  }
  v9 = [v4 domain];
  char v10 = [v9 isEqualToString:*MEMORY[0x1E4F281F8]];

  if (v10) {
    goto LABEL_5;
  }
  v12 = [v4 domain];
  if ([v12 isEqualToString:@"HMErrorDomain"])
  {
    uint64_t v13 = [v4 code];

    if (v13 == 2) {
      goto LABEL_5;
    }
  }
  else
  {
  }
  v14 = [v4 domain];
  if (![v14 isEqualToString:*MEMORY[0x1E4F64ED0]])
  {

LABEL_14:
    BOOL v11 = 0;
    goto LABEL_15;
  }
  uint64_t v15 = [v4 code];

  if (v15 != 2) {
    goto LABEL_14;
  }
LABEL_5:
  BOOL v11 = 1;
LABEL_15:

  return v11;
}

- (void)_retrySendingSignOutWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  v6 = [(HMClientConnection *)self context];
  v7 = [v6 queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__HMClientConnection__retrySendingSignOutWithCompletion___block_invoke;
  v9[3] = &unk_1E59454E8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_after(v5, v7, v9);
}

void __57__HMClientConnection__retrySendingSignOutWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) shouldWeRetrySendingSignOutMessageToHomeKitDaemon])
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    [v2 _primaryAccountWasDeletedWithCompletionHandler:v3];
  }
  else
  {
    id v4 = (void *)MEMORY[0x19F3A64A0]();
    id v5 = *(id *)(a1 + 32);
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      int v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Backing off from retrying to send the sign out message to homed.", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_primaryAccountWasDeletedWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F654B0]);
  id v6 = objc_alloc(MEMORY[0x1E4F65488]);
  v7 = [(id)objc_opt_class() UUID];
  int v8 = (void *)[v6 initWithTarget:v7];
  v9 = (void *)[v5 initWithName:@"kPrimaryAccountWasDeletedRequestKey" destination:v8 payload:0];

  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __69__HMClientConnection__primaryAccountWasDeletedWithCompletionHandler___block_invoke;
  v16 = &unk_1E5944EF0;
  int v17 = self;
  id v18 = v4;
  id v10 = v4;
  [v9 setResponseHandler:&v13];
  BOOL v11 = [(HMClientConnection *)self context];
  v12 = [v11 messageDispatcher];
  [v12 sendMessage:v9];
}

void __69__HMClientConnection__primaryAccountWasDeletedWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) shouldRetrySendingSignOutMessageDueToError:v5];
  int v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = *(id *)(a1 + 32);
  id v10 = HMFGetOSLogHandle();
  BOOL v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      int v14 = 138543618;
      uint64_t v15 = v12;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not deliver sign out message to homed. Going to retry it.: %@", (uint8_t *)&v14, 0x16u);
    }
    [*(id *)(a1 + 32) setShouldWeRetrySendingSignOutMessageToHomeKitDaemon:1];
    [*(id *)(a1 + 32) _retrySendingSignOutWithCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      uint64_t v15 = v13;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Successfully delivered sign out message to homed.", (uint8_t *)&v14, 0xCu);
    }
    [*(id *)(a1 + 32) setShouldWeRetrySendingSignOutMessageToHomeKitDaemon:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_IDMSAccountUsernameModifiedWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(HMClientConnection *)self setShouldWeRetrySendingSignOutMessageToHomeKitDaemon:0];
  id v5 = objc_alloc(MEMORY[0x1E4F654B0]);
  id v6 = objc_alloc(MEMORY[0x1E4F65488]);
  int v7 = [(id)objc_opt_class() UUID];
  int v8 = (void *)[v6 initWithTarget:v7];
  id v9 = (void *)[v5 initWithName:@"HMHM.idmsun" destination:v8 payload:0];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__HMClientConnection__IDMSAccountUsernameModifiedWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E5943468;
  id v14 = v4;
  id v10 = v4;
  [v9 setResponseHandler:v13];
  BOOL v11 = [(HMClientConnection *)self context];
  v12 = [v11 messageDispatcher];
  [v12 sendMessage:v9];
}

uint64_t __72__HMClientConnection__IDMSAccountUsernameModifiedWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_primaryAccountDidChange:(id)a3 modified:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  v25[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (a3)
  {
    id v9 = a3;
    [(HMClientConnection *)self setShouldWeRetrySendingSignOutMessageToHomeKitDaemon:0];
    id v10 = objc_alloc(MEMORY[0x1E4F654B0]);
    id v11 = objc_alloc(MEMORY[0x1E4F65488]);
    v12 = [(id)objc_opt_class() UUID];
    uint64_t v13 = (void *)[v11 initWithTarget:v12];
    v24[0] = @"kPrimaryAccountIdentifierKey";
    v24[1] = @"kPrimaryAccountWasModifiedRequestKey";
    v25[0] = v9;
    id v14 = [NSNumber numberWithBool:v5];
    v25[1] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
    __int16 v16 = (void *)[v10 initWithName:@"kPrimaryAccountWasModifiedRequestKey" destination:v13 payload:v15];

    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __74__HMClientConnection__primaryAccountDidChange_modified_completionHandler___block_invoke;
    v22 = &unk_1E5943468;
    id v23 = v8;
    [v16 setResponseHandler:&v19];
    id v17 = [(HMClientConnection *)self context];
    uint64_t v18 = [v17 messageDispatcher];
    [v18 sendMessage:v16];
  }
}

uint64_t __74__HMClientConnection__primaryAccountDidChange_modified_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)notifyAccountStatusUpdate:(unint64_t)a3 accountIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = (__CFString *)a4;
  id v9 = (void (**)(id, void *))a5;
  BOOL v10 = [(HMClientConnection *)self areHomesConfigured];
  id v11 = (void *)MEMORY[0x19F3A64A0]();
  v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  id v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      __int16 v16 = (void *)v15;
      if (a3 - 1 > 2) {
        id v17 = @"HMAccountStatus_PrimaryAccountAdded";
      }
      else {
        id v17 = off_1E5943228[a3 - 1];
      }
      int v25 = 138543874;
      uint64_t v26 = v15;
      __int16 v27 = 2112;
      v28 = v8;
      __int16 v29 = 2112;
      v30 = v17;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Primary account with identifier %@ updated status: %@", (uint8_t *)&v25, 0x20u);
    }
    switch(a3)
    {
      case 0uLL:
        uint64_t v21 = v12;
        v22 = v8;
        uint64_t v23 = 0;
        goto LABEL_17;
      case 1uLL:
        [(HMClientConnection *)v12 _primaryAccountWasDeletedWithCompletionHandler:v9];
        break;
      case 2uLL:
        uint64_t v21 = v12;
        v22 = v8;
        uint64_t v23 = 1;
LABEL_17:
        [(HMClientConnection *)v21 _primaryAccountDidChange:v22 modified:v23 completionHandler:v9];
        break;
      case 3uLL:
        [(HMClientConnection *)v12 _IDMSAccountUsernameModifiedWithCompletionHandler:v9];
        break;
      default:
        break;
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      uint64_t v19 = (void *)v18;
      if (a3 - 1 > 2) {
        uint64_t v20 = @"HMAccountStatus_PrimaryAccountAdded";
      }
      else {
        uint64_t v20 = off_1E5943228[a3 - 1];
      }
      int v25 = 138543618;
      uint64_t v26 = v18;
      __int16 v27 = 2112;
      v28 = v20;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@No homes are configured so unable to notify homed about account status: %@", (uint8_t *)&v25, 0x16u);
    }
    v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23];
    v9[2](v9, v24);
  }
}

- (void)requestSiriSyncDataWithValidity:(id)a3 completion:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([(HMClientConnection *)self areHomesConfigured])
  {
    id v9 = objc_alloc(MEMORY[0x1E4F653F0]);
    BOOL v10 = NSString;
    id v11 = MEMORY[0x19F3A5D00](self, a2);
    v12 = [v10 stringWithFormat:@"%@, %s:%ld", v11, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/HMClientConnection.m", 332];
    id v37 = (id)[v9 initWithName:v12];

    uint64_t v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = self;
    HMFGetOSLogHandle();
    uint64_t v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      id v17 = [v37 identifier];
      uint64_t v18 = [v17 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v39 = v16;
      __int16 v40 = 2114;
      v41 = v18;
      __int16 v42 = 2112;
      id v43 = v7;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Requesting Siri sync data with validity: %@", buf, 0x20u);
    }
    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
    [v19 setObject:v7 forKeyedSubscript:@"kSiriSyncDataValidityKey"];
    id v20 = objc_alloc(MEMORY[0x1E4F654B0]);
    id v21 = objc_alloc(MEMORY[0x1E4F65488]);
    v22 = [(id)objc_opt_class() UUID];
    uint64_t v23 = (void *)[v21 initWithTarget:v22];
    v24 = (void *)[v20 initWithName:@"HMCC.m.siriSyncData" destination:v23 payload:v19];

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __65__HMClientConnection_requestSiriSyncDataWithValidity_completion___block_invoke;
    v34[3] = &unk_1E5945510;
    v34[4] = v14;
    id v35 = v37;
    id v36 = v8;
    [v24 setResponseHandler:v34];
    int v25 = [(HMClientConnection *)v14 context];
    uint64_t v26 = [v25 messageDispatcher];
    [v26 sendMessage:v24];

    __HMFActivityScopeLeave();
  }
  else
  {
    __int16 v27 = (void *)MEMORY[0x19F3A64A0]();
    v28 = self;
    __int16 v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v39 = v30;
      _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_ERROR, "%{public}@Reporting send Siri sync data failure since there are no homes configured", buf, 0xCu);
    }
    id v31 = objc_alloc_init(MEMORY[0x1E4F96680]);
    [v31 setCommandOutcome:*MEMORY[0x1E4F96EC8]];
    v32 = [MEMORY[0x1E4F1C978] array];
    [v31 setActionResults:v32];

    v33 = [v31 dictionary];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v33);
  }
}

void __65__HMClientConnection_requestSiriSyncDataWithValidity_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  BOOL v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      v12 = [*(id *)(a1 + 40) identifier];
      uint64_t v13 = [v12 shortDescription];
      int v19 = 138543874;
      id v20 = v11;
      __int16 v21 = 2114;
      v22 = v13;
      __int16 v23 = 2112;
      id v24 = v5;
      id v14 = "%{public}@[%{public}@] Siri sync data request failed: %@";
      uint64_t v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 32;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v15, v16, v14, (uint8_t *)&v19, v17);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    v12 = [*(id *)(a1 + 40) identifier];
    uint64_t v13 = [v12 shortDescription];
    int v19 = 138543618;
    id v20 = v11;
    __int16 v21 = 2114;
    v22 = v13;
    id v14 = "%{public}@[%{public}@] Siri sync data request succeeded";
    uint64_t v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    uint32_t v17 = 22;
    goto LABEL_6;
  }

  (*(void (**)(void, id, id, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v5, v6, v18);
}

- (void)sendIntentRequestCommand:(id)a3 withPayload:(id)a4 completionHandler:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([(HMClientConnection *)self areHomesConfigured])
  {
    id v12 = objc_alloc(MEMORY[0x1E4F653F0]);
    uint64_t v13 = NSString;
    id v14 = MEMORY[0x19F3A5D00](self, a2);
    uint64_t v15 = [v13 stringWithFormat:@"%@, %s:%ld", v14, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/HMClientConnection.m", 296];
    id v37 = (id)[v12 initWithName:v15];

    os_log_type_t v16 = (void *)MEMORY[0x19F3A64A0]();
    uint32_t v17 = self;
    HMFGetOSLogHandle();
    uint64_t v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      id v20 = [v37 identifier];
      __int16 v21 = [v20 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v39 = v19;
      __int16 v40 = 2114;
      v41 = v21;
      __int16 v42 = 2112;
      id v43 = v9;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Sending control home intent: %@", buf, 0x20u);
    }
    id v22 = objc_alloc(MEMORY[0x1E4F654B0]);
    id v23 = objc_alloc(MEMORY[0x1E4F65488]);
    id v24 = [(id)objc_opt_class() UUID];
    uint64_t v25 = (void *)[v23 initWithTarget:v24];
    uint64_t v26 = (void *)[v22 initWithName:@"kSiriIntentRequestKey" destination:v25 payload:v10];

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __77__HMClientConnection_sendIntentRequestCommand_withPayload_completionHandler___block_invoke;
    v34[3] = &unk_1E5945510;
    v34[4] = v17;
    id v35 = v37;
    id v36 = v11;
    [v26 setResponseHandler:v34];
    __int16 v27 = [(HMClientConnection *)v17 context];
    v28 = [v27 messageDispatcher];
    [v28 sendMessage:v26];

    __HMFActivityScopeLeave();
  }
  else
  {
    __int16 v29 = (void *)MEMORY[0x19F3A64A0]();
    v30 = self;
    id v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v39 = v32;
      _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@Reporting send intent request failure since there are no homes configured", buf, 0xCu);
    }
    v33 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    (*((void (**)(id, void *, void))v11 + 2))(v11, v33, 0);
  }
}

void __77__HMClientConnection_sendIntentRequestCommand_withPayload_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
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
      id v12 = [*(id *)(a1 + 40) identifier];
      uint64_t v13 = [v12 shortDescription];
      int v19 = 138543874;
      id v20 = v11;
      __int16 v21 = 2114;
      id v22 = v13;
      __int16 v23 = 2112;
      id v24 = v5;
      id v14 = "%{public}@[%{public}@] Control home intent failed: %@";
      uint64_t v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 32;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v15, v16, v14, (uint8_t *)&v19, v17);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [*(id *)(a1 + 40) identifier];
    uint64_t v13 = [v12 shortDescription];
    int v19 = 138543618;
    id v20 = v11;
    __int16 v21 = 2114;
    id v22 = v13;
    id v14 = "%{public}@[%{public}@] Control home intent succeeded";
    uint64_t v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    uint32_t v17 = 22;
    goto LABEL_6;
  }

  (*(void (**)(void, id, id, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v5, v6, v18);
}

- (void)sendSiriCommand:(id)a3 completionHandler:(id)a4
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([(HMClientConnection *)self areHomesConfigured])
  {
    id v9 = objc_alloc(MEMORY[0x1E4F653F0]);
    id v10 = NSString;
    id v11 = MEMORY[0x19F3A5D00](self, a2);
    id v12 = [v10 stringWithFormat:@"%@, %s:%ld", v11, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/HMClientConnection.m", 262];
    id v40 = (id)[v9 initWithName:v12];

    uint64_t v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = self;
    HMFGetOSLogHandle();
    uint64_t v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      uint32_t v17 = [v40 identifier];
      uint64_t v18 = [v17 shortDescription];
      int v19 = [v7 actionRequests];
      *(_DWORD *)buf = 138543874;
      id v44 = v16;
      __int16 v45 = 2114;
      v46 = v18;
      __int16 v47 = 2048;
      uint64_t v48 = [v19 count];
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Sending Siri command with %lu action requests", buf, 0x20u);
    }
    id v20 = objc_alloc(MEMORY[0x1E4F654B0]);
    id v21 = objc_alloc(MEMORY[0x1E4F65488]);
    id v22 = [(id)objc_opt_class() UUID];
    __int16 v23 = (void *)[v21 initWithTarget:v22];
    v41 = @"kSiriCommandKey";
    id v24 = encodeRootObject(v7);
    __int16 v42 = v24;
    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    uint64_t v26 = (void *)[v20 initWithName:@"HMCC.m.siriCommand" destination:v23 payload:v25];

    [v26 setActivity:v40];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __56__HMClientConnection_sendSiriCommand_completionHandler___block_invoke;
    v37[3] = &unk_1E5945510;
    v37[4] = v14;
    id v38 = v40;
    id v39 = v8;
    [v26 setResponseHandler:v37];
    __int16 v27 = [(HMClientConnection *)v14 context];
    v28 = [v27 messageDispatcher];
    [v28 sendMessage:v26];

    __HMFActivityScopeLeave();
  }
  else
  {
    __int16 v29 = (void *)MEMORY[0x19F3A64A0]();
    v30 = self;
    id v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v44 = v32;
      _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@Reporting send Siri command failure since no homes are configured", buf, 0xCu);
    }
    id v33 = objc_alloc_init(MEMORY[0x1E4F96680]);
    [v33 setCommandOutcome:*MEMORY[0x1E4F96EB8]];
    id v34 = objc_alloc_init(MEMORY[0x1E4F96670]);
    [v34 setOutcome:*MEMORY[0x1E4F96CF8]];
    v49[0] = v34;
    id v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
    [v33 setActionResults:v35];

    id v36 = [v33 dictionary];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v36);
  }
}

void __56__HMClientConnection_sendSiriCommand_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
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
      id v12 = [*(id *)(a1 + 40) identifier];
      uint64_t v13 = [v12 shortDescription];
      int v19 = 138543874;
      id v20 = v11;
      __int16 v21 = 2114;
      id v22 = v13;
      __int16 v23 = 2112;
      id v24 = v5;
      id v14 = "%{public}@[%{public}@] Siri command failed: %@";
      uint64_t v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 32;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v15, v16, v14, (uint8_t *)&v19, v17);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [*(id *)(a1 + 40) identifier];
    uint64_t v13 = [v12 shortDescription];
    int v19 = 138543618;
    id v20 = v11;
    __int16 v21 = 2114;
    id v22 = v13;
    id v14 = "%{public}@[%{public}@] Siri command succeeded";
    uint64_t v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    uint32_t v17 = 22;
    goto LABEL_6;
  }

  (*(void (**)(void, id, id, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v5, v6, v18);
}

- (HMClientConnection)initWithContext:(id)a3 areHomesConfigured:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMClientConnection;
  id v8 = [(HMClientConnection *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_context, a3);
    v9->_homesConfigured = a4;
  }

  return v9;
}

- (HMClientConnection)initWithAreHomesConfigured:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [[_HMContext alloc] initWithName:@"com.apple.HMClientConnection"];
  id v6 = [(HMClientConnection *)self initWithContext:v5 areHomesConfigured:v3];

  return v6;
}

- (HMClientConnection)initWithNoValidation
{
  return [(HMClientConnection *)self initWithAreHomesConfigured:1];
}

- (HMClientConnection)init
{
  uint64_t v3 = [(id)objc_opt_class() areHomesConfigured];

  return [(HMClientConnection *)self initWithAreHomesConfigured:v3];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18_40512 != -1) {
    dispatch_once(&logCategory__hmf_once_t18_40512, &__block_literal_global_101_40513);
  }
  v2 = (void *)logCategory__hmf_once_v19_40514;

  return v2;
}

uint64_t __33__HMClientConnection_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v19_40514;
  logCategory__hmf_once_v19_40514 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)areAnyAppleTVAccessoriesConfigured
{
  return CFPreferencesGetAppBooleanValue(@"HMAppleTVAccessoriesConfiguredStatusKey", @"com.apple.homed", 0) != 0;
}

+ (BOOL)areAnyTelevisionAccessoriesConfigured
{
  return CFPreferencesGetAppBooleanValue(@"HMTelevisionAccessoriesConfiguredStatusKey", @"com.apple.homed", 0) != 0;
}

+ (BOOL)areAnyHomePodsConfigured
{
  return CFPreferencesGetAppBooleanValue(@"HMHomePodsConfiguredStatusKey", @"com.apple.homed", 0) != 0;
}

+ (BOOL)areAnyLargeHomePodConfigured
{
  return CFPreferencesGetAppBooleanValue(@"HMHomePod_6_1_ConfiguredStatusKey", @"com.apple.homed", 0) != 0;
}

+ (BOOL)areAnyHomePodMiniConfigured
{
  return CFPreferencesGetAppBooleanValue(@"HMSmallHomePodsConfiguredStatusKey", @"com.apple.homed", 0) != 0;
}

+ (BOOL)areAnySpeakersConfigured
{
  return CFPreferencesGetAppBooleanValue(@"kSpeakersConfiguredStatusKey", @"com.apple.homed", 0) != 0;
}

+ (BOOL)areAnyAccessoriesConfigured
{
  return CFPreferencesGetAppBooleanValue(@"kAccessoriesConfiguredStatusKey", @"com.apple.homed", 0) != 0;
}

+ (NSURL)siriHomeIdentifier
{
  v2 = +[HMClientConnection siriCurrentHome];
  uint64_t v3 = [v2 currentHomeIdentifier];

  id v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];

  return (NSURL *)v4;
}

+ (id)siriCurrentHome
{
  v2 = (void *)CFPreferencesCopyAppValue(@"kAssistantCurrentHomeIdentifierKey", @"com.apple.homed.notbackedup");
  uint64_t v3 = (void *)CFPreferencesCopyAppValue(@"kAssistantCurrentHomeNameKey", @"com.apple.homed.notbackedup");
  id v4 = objc_alloc_init(MEMORY[0x1E4F96688]);
  [v4 setCurrentHomeName:v3];
  [v4 setCurrentHomeIdentifier:v2];

  return v4;
}

+ (BOOL)areHomesConfigured
{
  return CFPreferencesGetAppBooleanValue(@"kHomesConfigured", @"com.apple.homed", 0) != 0;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_40522 != -1) {
    dispatch_once(&sharedInstance_onceToken_40522, &__block_literal_global_68);
  }
  v2 = (void *)sharedInstance_singletonClientConnection;

  return v2;
}

uint64_t __36__HMClientConnection_sharedInstance__block_invoke()
{
  uint64_t v0 = [[HMClientConnection alloc] initWithNoValidation];
  uint64_t v1 = sharedInstance_singletonClientConnection;
  sharedInstance_singletonClientConnection = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (NSUUID)UUID
{
  if (UUID_onceToken != -1) {
    dispatch_once(&UUID_onceToken, &__block_literal_global_40523);
  }
  v2 = (void *)UUID_UUID;

  return (NSUUID *)v2;
}

uint64_t __26__HMClientConnection_UUID__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"0BE06C66-413E-4DCC-8506-8DCE342DEFE4"];
  uint64_t v1 = UUID_UUID;
  UUID_UUID = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end