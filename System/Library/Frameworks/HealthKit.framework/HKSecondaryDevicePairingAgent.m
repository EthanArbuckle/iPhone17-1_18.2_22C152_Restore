@interface HKSecondaryDevicePairingAgent
+ (id)clientInterface;
+ (id)serverInterface;
- (HKSecondaryDevicePairingAgent)initWithHealthStore:(id)a3;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress:(id)a3 completion:(id)a4;
- (void)fetchSharingStatusWithPairedGuardianWithCompletion:(id)a3;
- (void)performEndToEndCloudSyncWithNRDeviceUUID:(id)a3 syncParticipantFirst:(BOOL)a4 completion:(id)a5;
- (void)requestTinkerSharingOptInWithGuardianDisplayName:(id)a3 NRDeviceUUID:(id)a4 completion:(id)a5;
- (void)setupHealthSharingForSecondaryPairedDeviceWithConfiguration:(id)a3 completion:(id)a4;
- (void)tearDownHealthSharingWithPairedGuardianWithCompletion:(id)a3;
- (void)tearDownHealthSharingWithTinkerDeviceWithNRUUID:(id)a3 completion:(id)a4;
@end

@implementation HKSecondaryDevicePairingAgent

- (HKSecondaryDevicePairingAgent)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKSecondaryDevicePairingAgent;
  v6 = [(HKSecondaryDevicePairingAgent *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
    identifier = v7->_identifier;
    v7->_identifier = (NSUUID *)v8;

    v10 = [[HKTaskServerProxyProvider alloc] initWithHealthStore:v7->_healthStore taskIdentifier:@"HKSecondaryDevicePairingAgentServerIdentifier" exportedObject:v7 taskUUID:v7->_identifier];
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = v10;

    [(HKProxyProvider *)v7->_proxyProvider setShouldRetryOnInterruption:0];
  }

  return v7;
}

- (void)requestTinkerSharingOptInWithGuardianDisplayName:(id)a3 NRDeviceUUID:(id)a4 completion:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  _HKInitializeLogging();
  v12 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v13 = v12;
    v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138544130;
    v27 = self;
    __int16 v28 = 2114;
    v29 = v14;
    __int16 v30 = 2114;
    id v31 = v9;
    __int16 v32 = 2114;
    id v33 = v10;
    _os_log_impl(&dword_19C023000, v13, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ %{public}@ called with guardian display name: %{public}@, NRDevice UUID: %{public}@ (#t0)", buf, 0x2Au);
  }
  proxyProvider = self->_proxyProvider;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __106__HKSecondaryDevicePairingAgent_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke;
  v22[3] = &unk_1E58C8A58;
  id v23 = v9;
  id v24 = v10;
  id v25 = v11;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __106__HKSecondaryDevicePairingAgent_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke_2;
  v19[3] = &unk_1E58BED18;
  id v20 = v25;
  SEL v21 = a2;
  v19[4] = self;
  id v16 = v25;
  id v17 = v10;
  id v18 = v9;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v22 errorHandler:v19];
}

uint64_t __106__HKSecondaryDevicePairingAgent_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_requestTinkerSharingOptInWithGuardianDisplayName:NRDeviceUUID:completion:", a1[4], a1[5], a1[6]);
}

void __106__HKSecondaryDevicePairingAgent_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR)) {
    __106__HKSecondaryDevicePairingAgent_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke_2_cold_1(a1, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setupHealthSharingForSecondaryPairedDeviceWithConfiguration:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  _HKInitializeLogging();
  id v9 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    id v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    v22 = self;
    __int16 v23 = 2114;
    id v24 = v11;
    __int16 v25 = 2114;
    id v26 = v7;
    _os_log_impl(&dword_19C023000, v10, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ %{public}@ called with configuration: %{public}@ (#t0)", buf, 0x20u);
  }
  proxyProvider = self->_proxyProvider;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __104__HKSecondaryDevicePairingAgent_setupHealthSharingForSecondaryPairedDeviceWithConfiguration_completion___block_invoke;
  v18[3] = &unk_1E58C8A80;
  id v19 = v7;
  id v20 = v8;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __104__HKSecondaryDevicePairingAgent_setupHealthSharingForSecondaryPairedDeviceWithConfiguration_completion___block_invoke_2;
  v15[3] = &unk_1E58BED18;
  id v16 = v20;
  SEL v17 = a2;
  v15[4] = self;
  id v13 = v20;
  id v14 = v7;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v18 errorHandler:v15];
}

uint64_t __104__HKSecondaryDevicePairingAgent_setupHealthSharingForSecondaryPairedDeviceWithConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setupHealthSharingForSecondaryPairedDeviceWithConfiguration:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __104__HKSecondaryDevicePairingAgent_setupHealthSharingForSecondaryPairedDeviceWithConfiguration_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR)) {
    __106__HKSecondaryDevicePairingAgent_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke_2_cold_1(a1, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)performEndToEndCloudSyncWithNRDeviceUUID:(id)a3 syncParticipantFirst:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  _HKInitializeLogging();
  id v11 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    uint64_t v13 = NSStringFromSelector(a2);
    id v14 = (void *)v13;
    v15 = @"NO";
    *(_DWORD *)buf = 138544130;
    uint64_t v27 = self;
    if (v6) {
      v15 = @"YES";
    }
    __int16 v28 = 2114;
    uint64_t v29 = v13;
    __int16 v30 = 2114;
    id v31 = v9;
    __int16 v32 = 2114;
    id v33 = v15;
    _os_log_impl(&dword_19C023000, v12, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ %{public}@ called with NRDevice UUID: %{public}@, syncParticipantFirst: %{public}@ (#t0)", buf, 0x2Au);
  }
  proxyProvider = self->_proxyProvider;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __106__HKSecondaryDevicePairingAgent_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke;
  v22[3] = &unk_1E58C8AA8;
  id v23 = v9;
  BOOL v25 = v6;
  id v24 = v10;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __106__HKSecondaryDevicePairingAgent_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke_2;
  v19[3] = &unk_1E58BED18;
  id v20 = v24;
  SEL v21 = a2;
  v19[4] = self;
  id v17 = v24;
  id v18 = v9;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v22 errorHandler:v19];
}

uint64_t __106__HKSecondaryDevicePairingAgent_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_performEndToEndCloudSyncWithNRDeviceUUID:syncParticipantFirst:completion:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

void __106__HKSecondaryDevicePairingAgent_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR)) {
    __106__HKSecondaryDevicePairingAgent_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke_2_cold_1(a1, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)tearDownHealthSharingWithPairedGuardianWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  BOOL v6 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    id v17 = self;
    __int16 v18 = 2114;
    id v19 = v8;
    _os_log_impl(&dword_19C023000, v7, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ %{public}@ called (#t0)", buf, 0x16u);
  }
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__HKSecondaryDevicePairingAgent_tearDownHealthSharingWithPairedGuardianWithCompletion___block_invoke;
  v14[3] = &unk_1E58C8AD0;
  id v15 = v5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__HKSecondaryDevicePairingAgent_tearDownHealthSharingWithPairedGuardianWithCompletion___block_invoke_2;
  v11[3] = &unk_1E58BED18;
  id v12 = v15;
  SEL v13 = a2;
  v11[4] = self;
  id v10 = v15;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v14 errorHandler:v11];
}

uint64_t __87__HKSecondaryDevicePairingAgent_tearDownHealthSharingWithPairedGuardianWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_tearDownHealthSharingWithPairedGuardianWithCompletion:", *(void *)(a1 + 32));
}

void __87__HKSecondaryDevicePairingAgent_tearDownHealthSharingWithPairedGuardianWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR)) {
    __106__HKSecondaryDevicePairingAgent_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke_2_cold_1(a1, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)tearDownHealthSharingWithTinkerDeviceWithNRUUID:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  _HKInitializeLogging();
  id v9 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    id v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    v22 = self;
    __int16 v23 = 2114;
    id v24 = v11;
    _os_log_impl(&dword_19C023000, v10, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ %{public}@ called (#t0)", buf, 0x16u);
  }
  proxyProvider = self->_proxyProvider;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __92__HKSecondaryDevicePairingAgent_tearDownHealthSharingWithTinkerDeviceWithNRUUID_completion___block_invoke;
  v18[3] = &unk_1E58C8A80;
  id v19 = v7;
  id v20 = v8;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __92__HKSecondaryDevicePairingAgent_tearDownHealthSharingWithTinkerDeviceWithNRUUID_completion___block_invoke_2;
  v15[3] = &unk_1E58BED18;
  id v16 = v20;
  SEL v17 = a2;
  v15[4] = self;
  id v13 = v20;
  id v14 = v7;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v18 errorHandler:v15];
}

uint64_t __92__HKSecondaryDevicePairingAgent_tearDownHealthSharingWithTinkerDeviceWithNRUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_tearDownHealthSharingWithTinkerDeviceWithNRUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __92__HKSecondaryDevicePairingAgent_tearDownHealthSharingWithTinkerDeviceWithNRUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR)) {
    __106__HKSecondaryDevicePairingAgent_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke_2_cold_1(a1, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchSharingStatusWithPairedGuardianWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  BOOL v6 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    __int16 v18 = self;
    __int16 v19 = 2114;
    id v20 = v8;
    _os_log_impl(&dword_19C023000, v7, OS_LOG_TYPE_INFO, "[sharing-setup] %{public}@ %{public}@", buf, 0x16u);
  }
  id v9 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v5];

  proxyProvider = self->_proxyProvider;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__HKSecondaryDevicePairingAgent_fetchSharingStatusWithPairedGuardianWithCompletion___block_invoke;
  v15[3] = &unk_1E58C8AD0;
  id v16 = v9;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__HKSecondaryDevicePairingAgent_fetchSharingStatusWithPairedGuardianWithCompletion___block_invoke_2;
  v12[3] = &unk_1E58BED18;
  id v13 = v16;
  SEL v14 = a2;
  v12[4] = self;
  id v11 = v16;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v15 errorHandler:v12];
}

uint64_t __84__HKSecondaryDevicePairingAgent_fetchSharingStatusWithPairedGuardianWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchSharingStatusWithPairedGuardianWithCompletion:", *(void *)(a1 + 32));
}

void __84__HKSecondaryDevicePairingAgent_fetchSharingStatusWithPairedGuardianWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR)) {
    __84__HKSecondaryDevicePairingAgent_fetchSharingStatusWithPairedGuardianWithCompletion___block_invoke_2_cold_1(a1, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  _HKInitializeLogging();
  id v9 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_INFO))
  {
    id v10 = v9;
    id v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    __int16 v23 = self;
    __int16 v24 = 2114;
    uint64_t v25 = v11;
    _os_log_impl(&dword_19C023000, v10, OS_LOG_TYPE_INFO, "[sharing-setup] %{public}@ %{public}@", buf, 0x16u);
  }
  id v12 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v8];

  proxyProvider = self->_proxyProvider;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __101__HKSecondaryDevicePairingAgent_fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress_completion___block_invoke;
  v19[3] = &unk_1E58C8A80;
  id v20 = v7;
  id v21 = v12;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __101__HKSecondaryDevicePairingAgent_fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress_completion___block_invoke_2;
  v16[3] = &unk_1E58BED18;
  id v17 = v21;
  SEL v18 = a2;
  v16[4] = self;
  id v14 = v21;
  id v15 = v7;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v19 errorHandler:v16];
}

uint64_t __101__HKSecondaryDevicePairingAgent_fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __101__HKSecondaryDevicePairingAgent_fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR)) {
    __84__HKSecondaryDevicePairingAgent_fetchSharingStatusWithPairedGuardianWithCompletion___block_invoke_2_cold_1(a1, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED53AB0];
}

+ (id)serverInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED53B10];
}

- (id)exportedInterface
{
  v2 = objc_opt_class();

  return (id)[v2 clientInterface];
}

- (id)remoteInterface
{
  v2 = objc_opt_class();

  return (id)[v2 serverInterface];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __106__HKSecondaryDevicePairingAgent_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_2_5(a1, a2);
  id v3 = (const char *)OUTLINED_FUNCTION_5();
  v4 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_0_21();
  OUTLINED_FUNCTION_2_3(&dword_19C023000, v5, v6, "[sharing-setup] %{public}@: %{public}@ call failed: %{public}@ (#t0)", v7, v8, v9, v10, v11);
}

void __84__HKSecondaryDevicePairingAgent_fetchSharingStatusWithPairedGuardianWithCompletion___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_2_5(a1, a2);
  id v3 = (const char *)OUTLINED_FUNCTION_5();
  v4 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_0_21();
  OUTLINED_FUNCTION_2_3(&dword_19C023000, v5, v6, "%{public}@: %{public}@ call failed: %{public}@ (#t0)", v7, v8, v9, v10, v11);
}

@end