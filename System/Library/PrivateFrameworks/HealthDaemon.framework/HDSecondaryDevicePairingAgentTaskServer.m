@interface HDSecondaryDevicePairingAgentTaskServer
+ (id)taskIdentifier;
- (HDSecondaryDevicePairingAgentTaskServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (double)tinkerSharingSetupTimeout;
- (id)exportedInterface;
- (id)remoteInterface;
- (id)unitTest_timeoutTriggered;
- (void)_cancelTaskTimeout;
- (void)_finishWithSuccess:(void *)a3 error:;
- (void)_removePrivacyAlerts;
- (void)_scheduleTaskTimeout:(double)a3 timeoutHandler:;
- (void)remote_fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress:(id)a3 completion:(id)a4;
- (void)remote_fetchSharingStatusWithPairedGuardianWithCompletion:(id)a3;
- (void)remote_performEndToEndCloudSyncWithNRDeviceUUID:(id)a3 syncParticipantFirst:(BOOL)a4 completion:(id)a5;
- (void)remote_requestTinkerSharingOptInWithGuardianDisplayName:(id)a3 NRDeviceUUID:(id)a4 completion:(id)a5;
- (void)remote_setupHealthSharingForSecondaryPairedDeviceWithConfiguration:(id)a3 completion:(id)a4;
- (void)remote_tearDownHealthSharingWithPairedGuardianWithCompletion:(id)a3;
- (void)remote_tearDownHealthSharingWithTinkerDeviceWithNRUUID:(id)a3 completion:(id)a4;
- (void)setTinkerSharingSetupTimeout:(double)a3;
- (void)setUnitTest_timeoutTriggered:(id)a3;
@end

@implementation HDSecondaryDevicePairingAgentTaskServer

- (HDSecondaryDevicePairingAgentTaskServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)HDSecondaryDevicePairingAgentTaskServer;
  result = [(HDStandardTaskServer *)&v7 initWithUUID:a3 configuration:a4 client:a5 delegate:a6];
  if (result)
  {
    result->_lock._os_unfair_lock_opaque = 0;
    result->_tinkerSharingSetupTimeout = 300.0;
  }
  return result;
}

- (void)_finishWithSuccess:(void *)a3 error:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    -[HDSecondaryDevicePairingAgentTaskServer _cancelTaskTimeout](a1);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v6 = *(void **)(a1 + 64);
    if (v6)
    {
      id v7 = v6;
      v8 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = 0;

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
      _HKInitializeLogging();
      v9 = (void *)*MEMORY[0x1E4F29FA8];
      v10 = *MEMORY[0x1E4F29FA8];
      if (a2)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = v9;
          v12 = objc_opt_class();
          id v13 = *((id *)v7 + 7);
          id v14 = v12;
          v15 = [v13 profileIdentifier];
          *(_DWORD *)buf = 138543618;
          id v44 = v12;
          __int16 v45 = 2114;
          *(void *)v46 = v15;
          _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@: Finish successfully, profile: %{public}@ (#t0)", buf, 0x16u);
        }
        v16 = [(id)a1 profile];
        v17 = [v16 daemon];
        v18 = [v17 analyticsSubmissionCoordinator];
        id v19 = *((id *)v7 + 4);
        objc_msgSend(v18, "tinker_pairingDidFinishForConfiguration:duration:", v19, CFAbsoluteTimeGetCurrent() - *((double *)v7 + 2));
        goto LABEL_19;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v39 = v9;
        *(_DWORD *)buf = 138543618;
        id v44 = (id)objc_opt_class();
        __int16 v45 = 2114;
        *(void *)v46 = v5;
        id v40 = v44;
        _os_log_error_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@: Failed to successfully setup pairing: %{public}@ (#t0)", buf, 0x16u);
      }
      if (!*((void *)v7 + 7))
      {
LABEL_18:
        v16 = [(id)a1 profile];
        v17 = [v16 daemon];
        v18 = [v17 analyticsSubmissionCoordinator];
        id v19 = *((id *)v7 + 4);
        objc_msgSend(v18, "tinker_pairingDidFailWithError:configuration:duration:stage:", v5, v19, *((void *)v7 + 6), CFAbsoluteTimeGetCurrent() - *((double *)v7 + 2));
LABEL_19:

        id v36 = v5;
        os_unfair_lock_lock((os_unfair_lock_t)v7 + 2);
        v37 = (void (**)(void *, void, id))_Block_copy(*((const void **)v7 + 5));
        v38 = (void *)*((void *)v7 + 5);
        *((void *)v7 + 5) = 0;

        os_unfair_lock_unlock((os_unfair_lock_t)v7 + 2);
        v37[2](v37, a2, v36);

        [*((id *)v7 + 3) invalidate];
        goto LABEL_20;
      }
      v22 = [(id)a1 profile];
      v23 = [v22 daemon];
      v24 = [v23 profileManager];
      id v25 = *((id *)v7 + 7);
      v26 = [v25 profileIdentifier];
      id v42 = 0;
      int v27 = [v24 deleteProfile:v26 error:&v42];
      id v28 = v42;

      _HKInitializeLogging();
      v29 = (void *)*MEMORY[0x1E4F29FA8];
      v30 = *MEMORY[0x1E4F29FA8];
      if (v27)
      {
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
LABEL_17:

          a2 = 0;
          goto LABEL_18;
        }
        v31 = v29;
        v32 = objc_opt_class();
        id v33 = *((id *)v7 + 7);
        id v34 = v32;
        v35 = [v33 profileIdentifier];
        *(_DWORD *)buf = 138543618;
        id v44 = v32;
        __int16 v45 = 2114;
        *(void *)v46 = v35;
        _os_log_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@: Completed profile teardown after pairing failure for %{public}@ (#t0)", buf, 0x16u);
      }
      else
      {
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          goto LABEL_17;
        }
        v31 = v29;
        v41 = objc_opt_class();
        id v33 = *((id *)v7 + 7);
        id v34 = v41;
        v35 = [v33 profileIdentifier];
        *(_DWORD *)buf = 138543874;
        id v44 = v41;
        __int16 v45 = 2114;
        *(void *)v46 = v35;
        *(_WORD *)&v46[8] = 2114;
        *(void *)&v46[10] = v28;
        _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@: Failed to tear down profile %{public}@ after pairing failure: %{public}@ (#t0)", buf, 0x20u);
      }

      goto LABEL_17;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v20;
      *(_DWORD *)buf = 138543874;
      id v44 = (id)objc_opt_class();
      __int16 v45 = 1024;
      *(_DWORD *)v46 = a2;
      *(_WORD *)&v46[4] = 2114;
      *(void *)&v46[6] = v5;
      id v21 = v44;
      _os_log_impl(&dword_1BCB7D000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@: Attempting to finish with no active request (success: %{BOOL}d, %{public}@)", buf, 0x1Cu);

LABEL_20:
    }
  }
}

- (void)_cancelTaskTimeout
{
  if (a1)
  {
    *(unsigned char *)(a1 + 56) = 0;
    v2 = *(NSObject **)(a1 + 48);
    if (v2)
    {
      dispatch_source_cancel(v2);
      v3 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = 0;
    }
  }
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F2BC48];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2B468] clientInterface];
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2B468] serverInterface];
}

- (void)remote_requestTinkerSharingOptInWithGuardianDisplayName:(id)a3 NRDeviceUUID:(id)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  _HKInitializeLogging();
  v11 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    *(_DWORD *)buf = 138543362;
    id v28 = (id)objc_opt_class();
    id v13 = v28;
    _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Preparing to send message to Tinker watch (#t0)", buf, 0xCu);
  }
  id v14 = objc_alloc_init(HDCodableTinkerOptInRequest);
  v15 = [MEMORY[0x1E4F29128] UUID];
  v16 = [v15 UUIDString];
  [(HDCodableTinkerOptInRequest *)v14 setRequestIdentifier:v16];

  [(HDCodableTinkerOptInRequest *)v14 setGuardianDisplayName:v10];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __123__HDSecondaryDevicePairingAgentTaskServer_remote_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke;
  v25[3] = &unk_1E62F4928;
  v25[4] = self;
  id v17 = v8;
  id v26 = v17;
  -[HDSecondaryDevicePairingAgentTaskServer _scheduleTaskTimeout:timeoutHandler:]((dispatch_object_t *)self, v25, 60.0);
  v18 = [(HDStandardTaskServer *)self profile];
  id v19 = [v18 daemon];
  v20 = [v19 primaryProfile];
  id v21 = [v20 nanoSyncManager];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __123__HDSecondaryDevicePairingAgentTaskServer_remote_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke_284;
  v23[3] = &unk_1E62F70B0;
  v23[4] = self;
  id v24 = v17;
  id v22 = v17;
  [v21 sendTinkerSharingOptInRequest:v14 forNRDeviceUUID:v9 completion:v23];
}

void __123__HDSecondaryDevicePairingAgentTaskServer_remote_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    v4 = v2;
    *(_DWORD *)v6 = 138543362;
    *(void *)&v6[4] = objc_opt_class();
    id v5 = *(id *)&v6[4];
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@ Sharing Opt In timed out", v6, 0xCu);
  }
  v3 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 103, @"Operation timed out", *(_OWORD *)v6);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_scheduleTaskTimeout:(double)a3 timeoutHandler:
{
  id v5 = a2;
  if (a1)
  {
    -[HDSecondaryDevicePairingAgentTaskServer _cancelTaskTimeout]((uint64_t)a1);
    dispatch_source_t v6 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    dispatch_object_t v7 = a1[6];
    a1[6] = v6;

    id v8 = a1[6];
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak(&location, a1);
    id v10 = a1[6];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __79__HDSecondaryDevicePairingAgentTaskServer__scheduleTaskTimeout_timeoutHandler___block_invoke;
    handler[3] = &unk_1E62FB2F8;
    objc_copyWeak(&v13, &location);
    id v12 = v5;
    dispatch_source_set_event_handler(v10, handler);
    dispatch_resume(a1[6]);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __123__HDSecondaryDevicePairingAgentTaskServer_remote_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke_284(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v3 + 56))
  {
    id v5 = a3;
    -[HDSecondaryDevicePairingAgentTaskServer _cancelTaskTimeout](v3);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)remote_setupHealthSharingForSecondaryPairedDeviceWithConfiguration:(id)a3 completion:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  dispatch_time_t v9 = (void (**)(id, void, id))a4;
  _HKInitializeLogging();
  id v10 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    LODWORD(buf.receiver) = 138543362;
    *(id *)((char *)&buf.receiver + 4) = (id)objc_opt_class();
    id v12 = *(id *)((char *)&buf.receiver + 4);
    _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@: Received setupHealthSharing call (#t0)", (uint8_t *)&buf, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_currentRequest)
  {
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"A secondary device setup request is already in progress."");
    id v13 = (HDSecondaryDevicePairingRequest *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v13);
  }
  else
  {
    id v14 = [HDSecondaryDevicePairingRequest alloc];
    id v15 = v8;
    v16 = v9;
    if (v14)
    {
      buf.receiver = v14;
      buf.super_class = (Class)HDSecondaryDevicePairingRequest;
      id v17 = [(HDSecondaryDevicePairingAgentTaskServer *)&buf init];
      id v14 = (HDSecondaryDevicePairingRequest *)v17;
      if (v17)
      {
        LODWORD(v17->super._taskUUID) = 0;
        objc_storeStrong((id *)&v17->super._delegate, a3);
        uint64_t v18 = [v16 copy];
        id completion = v14->_completion;
        v14->_id completion = (id)v18;

        uint64_t v20 = [MEMORY[0x1E4F2AE98] transactionWithOwner:v14];
        transaction = v14->_transaction;
        v14->_transaction = (HKDaemonTransaction *)v20;

        v14->_startTime = CFAbsoluteTimeGetCurrent();
        v14->_stage = 1;
      }
    }

    currentRequest = self->_currentRequest;
    self->_currentRequest = v14;
    v23 = v14;

    os_unfair_lock_unlock(&self->_lock);
    double tinkerSharingSetupTimeout = self->_tinkerSharingSetupTimeout;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __121__HDSecondaryDevicePairingAgentTaskServer_remote_setupHealthSharingForSecondaryPairedDeviceWithConfiguration_completion___block_invoke;
    v30[3] = &unk_1E62F3208;
    v30[4] = self;
    -[HDSecondaryDevicePairingAgentTaskServer _scheduleTaskTimeout:timeoutHandler:]((dispatch_object_t *)self, v30, tinkerSharingSetupTimeout);
    id v25 = v23;
    id v26 = v25;
    if (v25) {
      v25->_stage = 2;
    }
    int v27 = [(HDStandardTaskServer *)self profile];
    id v28 = [v27 cloudSyncManager];
    buf.receiver = (id)MEMORY[0x1E4F143A8];
    buf.super_class = (Class)3221225472;
    v32 = __80__HDSecondaryDevicePairingAgentTaskServer__prepareGuardianForSharingForRequest___block_invoke;
    id v33 = &unk_1E62F5D48;
    id v34 = self;
    id v13 = v26;
    v35 = v13;
    id v29 = (id)[v28 prepareForSharingWithCompletion:&buf];
  }
}

void __121__HDSecondaryDevicePairingAgentTaskServer_remote_setupHealthSharingForSecondaryPairedDeviceWithConfiguration_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    v4 = v2;
    *(_DWORD *)dispatch_source_t v6 = 138543362;
    *(void *)&v6[4] = objc_opt_class();
    id v5 = *(id *)&v6[4];
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@ Sharing Setup timed out", v6, 0xCu);
  }
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 103, @"Operation timed out", *(_OWORD *)v6);
  -[HDSecondaryDevicePairingAgentTaskServer _finishWithSuccess:error:](*(void *)(a1 + 32), 0, v3);
}

- (void)remote_performEndToEndCloudSyncWithNRDeviceUUID:(id)a3 syncParticipantFirst:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __123__HDSecondaryDevicePairingAgentTaskServer_remote_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke;
  aBlock[3] = &unk_1E62FB230;
  aBlock[4] = self;
  id v11 = v9;
  id v28 = v11;
  id v12 = _Block_copy(aBlock);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __123__HDSecondaryDevicePairingAgentTaskServer_remote_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke_295;
  v24[3] = &unk_1E62FB258;
  v24[4] = self;
  id v13 = v11;
  id v25 = v13;
  SEL v26 = a2;
  id v14 = _Block_copy(v24);
  id v15 = (void (**)(void, void, void))v14;
  if (v6)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __123__HDSecondaryDevicePairingAgentTaskServer_remote_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke_302;
    v21[3] = &unk_1E62FB280;
    v16 = &v22;
    id v22 = v12;
    id v17 = &v23;
    id v23 = v10;
    ((void (**)(void, uint64_t, void *))v15)[2](v15, 2, v21);
  }
  else
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __123__HDSecondaryDevicePairingAgentTaskServer_remote_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke_2;
    v18[3] = &unk_1E62FB280;
    v16 = &v19;
    id v19 = v14;
    id v17 = &v20;
    id v20 = v10;
    (*((void (**)(void *, void *))v12 + 2))(v12, v18);
  }
}

void __123__HDSecondaryDevicePairingAgentTaskServer_remote_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    *(_DWORD *)objc_super buf = 138543362;
    id v16 = (id)objc_opt_class();
    id v6 = v16;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Preparing to send message to Tinker watch for end to end Cloud Sync (#t0)", buf, 0xCu);
  }
  uint64_t v7 = [*(id *)(a1 + 32) profile];
  id v8 = [v7 daemon];
  id v9 = [v8 primaryProfile];
  id v10 = [v9 nanoSyncManager];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __123__HDSecondaryDevicePairingAgentTaskServer_remote_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke_293;
  v13[3] = &unk_1E62F70B0;
  uint64_t v11 = *(void *)(a1 + 40);
  v13[4] = *(void *)(a1 + 32);
  id v14 = v3;
  id v12 = v3;
  [v10 sendTinkerEndToEndCloudSyncRequestForNRDeviceUUID:v11 completion:v13];
}

void __123__HDSecondaryDevicePairingAgentTaskServer_remote_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke_293(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v6;
    int v10 = 138543874;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 1024;
    int v13 = a2;
    __int16 v14 = 2114;
    id v15 = v5;
    id v9 = v11;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Did finish Gizmo Sync with success: %d, error: %{public}@ (#t0)", (uint8_t *)&v10, 0x1Cu);
  }
  (*(void (**)(void, uint64_t, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, v5, v7);
}

void __123__HDSecondaryDevicePairingAgentTaskServer_remote_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke_295(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) profile];
  uint64_t v7 = [v6 daemon];
  id v8 = [v7 profileManager];
  id v9 = [v8 profileAssociatedWithNRDeviceUUID:*(void *)(a1 + 40)];

  int v10 = [*(id *)(a1 + 32) profile];
  id v11 = [v10 daemon];
  __int16 v12 = [v11 profileManager];
  int v13 = [v12 profileForIdentifier:v9];

  _HKInitializeLogging();
  __int16 v14 = *MEMORY[0x1E4F29FA8];
  id v15 = *MEMORY[0x1E4F29FA8];
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = v14;
      *(_DWORD *)objc_super buf = 138543362;
      id v26 = (id)objc_opt_class();
      id v17 = v26;
      _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Performing Sync for local device (reason: end to end Cloud Sync) (#t0)", buf, 0xCu);
    }
    id v18 = [[HDCloudSyncContext alloc] initForPurpose:a2 options:0 reason:20 xpcActivity:0];
    id v19 = [v13 cloudSyncManager];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __123__HDSecondaryDevicePairingAgentTaskServer_remote_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke_300;
    v23[3] = &unk_1E62F70B0;
    v23[4] = *(void *)(a1 + 32);
    id v24 = v5;
    id v20 = (id)[v19 syncWithContext:v18 completion:v23];
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v21 = *(void **)(a1 + 32);
      uint64_t v22 = *(void *)(a1 + 40);
      *(_DWORD *)objc_super buf = 138543618;
      id v26 = v21;
      __int16 v27 = 2114;
      uint64_t v28 = v22;
      _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Unable to find profile for end-to-end sync for device %{public}@", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), *(void *)(a1 + 48), @"No profile for device UUID %@"", *(void *)(a1 + 40));
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))v5 + 2))(v5, 0, v18);
  }
}

void __123__HDSecondaryDevicePairingAgentTaskServer_remote_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke_300(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v6;
    int v10 = 138543618;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2114;
    id v13 = v5;
    id v9 = v11;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Did finish local device sync for end to end Cloud Sync with error: %{public}@ (#t0)", (uint8_t *)&v10, 0x16u);
  }
  (*(void (**)(void, uint64_t, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, v5, v7);
}

uint64_t __123__HDSecondaryDevicePairingAgentTaskServer_remote_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke_302(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __123__HDSecondaryDevicePairingAgentTaskServer_remote_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 3, *(void *)(a1 + 40));
}

- (void)remote_tearDownHealthSharingWithPairedGuardianWithCompletion:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void, id))a3;
  _HKInitializeLogging();
  id v6 = (os_log_t *)MEMORY[0x1E4F29FA8];
  uint64_t v7 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = objc_opt_class();
    id v10 = v9;
    id v11 = NSStringFromSelector(a2);
    *(_DWORD *)objc_super buf = 138543618;
    uint64_t v36 = v9;
    __int16 v37 = 2114;
    v38 = v11;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ %{public}@ called (#t0)", buf, 0x16u);
  }
  __int16 v12 = [(HDStandardTaskServer *)self profile];
  id v13 = [v12 daemon];
  uint64_t v14 = [v13 behavior];
  char v15 = [v14 isAppleWatch];

  if ((v15 & 1) == 0)
  {
    uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
    v30 = NSStringFromSelector(a2);
    [v29 handleFailureInMethod:a2, self, @"HDSecondaryDevicePairingAgentTaskServer.m", 258, @"%@ must be called from a watch.", v30 object file lineNumber description];
  }
  uint64_t v16 = [(HDStandardTaskServer *)self profile];
  id v34 = 0;
  id v17 = [v16 pairedGuardianParticipantWithError:&v34];
  id v18 = v34;

  if (v18)
  {
    v5[2](v5, 0, v18);
  }
  else if (v17)
  {
    objc_initWeak((id *)buf, self);
    id v19 = [(HDStandardTaskServer *)self profile];
    id v20 = [v19 daemon];
    id v21 = [v20 primaryProfile];
    uint64_t v22 = [v21 cloudSyncManager];
    id v23 = [MEMORY[0x1E4F1CAD0] setWithObject:v17];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __104__HDSecondaryDevicePairingAgentTaskServer_remote_tearDownHealthSharingWithPairedGuardianWithCompletion___block_invoke;
    v31[3] = &unk_1E62FB2A8;
    objc_copyWeak(&v33, (id *)buf);
    v31[4] = self;
    v32 = v5;
    id v24 = (id)[v22 removeParticipants:v23 fromSharesWithCompletion:v31];

    objc_destroyWeak(&v33);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    _HKInitializeLogging();
    os_log_t v25 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = v25;
      __int16 v27 = objc_opt_class();
      *(_DWORD *)objc_super buf = 138543362;
      uint64_t v36 = v27;
      id v28 = v27;
      _os_log_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Guardian participant is nil (#t0)", buf, 0xCu);
    }
    -[HDSecondaryDevicePairingAgentTaskServer _removePrivacyAlerts](self);
    v5[2](v5, 1, 0);
  }
}

- (void)_removePrivacyAlerts
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v1 = [a1 profile];
    v2 = [v1 daemon];
    id v3 = [v2 primaryProfile];
    v4 = [v3 tinkerPrivacyAlertCoordinator];
    id v11 = 0;
    char v5 = [v4 removeAllEventsWithError:&v11];
    id v6 = v11;

    if ((v5 & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v7 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        id v8 = v7;
        id v9 = objc_opt_class();
        *(_DWORD *)objc_super buf = 138543618;
        id v13 = v9;
        __int16 v14 = 2112;
        id v15 = v6;
        id v10 = v9;
        _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@: Error %@ removing alerts", buf, 0x16u);
      }
    }
  }
}

void __104__HDSecondaryDevicePairingAgentTaskServer_remote_tearDownHealthSharingWithPairedGuardianWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    id v6 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    -[HDSecondaryDevicePairingAgentTaskServer _removePrivacyAlerts](WeakRetained);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = a3;
    if (!v8) {
      goto LABEL_6;
    }
    id WeakRetained = objc_alloc_init(MEMORY[0x1E4F65D98]);
    id v10 = HKHealthKitFrameworkBundle();
    id v11 = [v10 localizedStringForKey:@"STOP_SHARING_FAILED_NOTIFICATION_TITLE" value:&stru_1F1728D60 table:@"Localizable-tinker"];
    [WeakRetained setTitle:v11];

    __int16 v12 = HKHealthKitFrameworkBundle();
    id v13 = [v12 localizedStringForKey:@"STOP_SHARING_FAILED_NOTIFICATION_MESSAGE" value:&stru_1F1728D60 table:@"Localizable-tinker"];
    [WeakRetained setMessage:v13];

    [WeakRetained presentWithResponseHandler:&__block_literal_global_63];
  }

LABEL_6:
  uint64_t v14 = *(void *)(a1 + 40);
  objc_msgSend(a3, "hk_sanitizedError");
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, a2, v15);
}

- (void)remote_tearDownHealthSharingWithTinkerDeviceWithNRUUID:(id)a3 completion:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  _HKInitializeLogging();
  id v9 = (os_log_t *)MEMORY[0x1E4F29FA8];
  id v10 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    __int16 v12 = (HDSecondaryDevicePairingAgentTaskServer *)objc_opt_class();
    id v13 = v12;
    uint64_t v14 = NSStringFromSelector(a2);
    *(_DWORD *)objc_super buf = 138543874;
    v52 = v12;
    __int16 v53 = 2114;
    id v54 = v14;
    __int16 v55 = 2114;
    id v56 = v7;
    _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ %{public}@ called with NR UUID %{public}@ (#t0)", buf, 0x20u);
  }
  id v15 = [(HDStandardTaskServer *)self profile];
  uint64_t v16 = [v15 daemon];
  id v17 = [v16 behavior];
  int v18 = [v17 isAppleWatch];

  if (v18)
  {
    id v44 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v45 = NSStringFromSelector(a2);
    [v44 handleFailureInMethod:a2, self, @"HDSecondaryDevicePairingAgentTaskServer.m", 305, @"%@ must be called from a phone.", v45 object file lineNumber description];
  }
  id v19 = [(HDStandardTaskServer *)self profile];
  uint64_t v20 = [v19 profileType];

  if (v20 == 1)
  {
    id v21 = [(HDStandardTaskServer *)self profile];
    uint64_t v22 = [v21 daemon];
    id v23 = [v22 profileManager];
    id v24 = [v23 profileAssociatedWithNRDeviceUUID:v7];

    os_log_t v25 = [(HDStandardTaskServer *)self profile];
    id v26 = [v25 daemon];
    __int16 v27 = [v26 profileManager];
    id v28 = [v27 profileForIdentifier:v24];

    if ([v28 profileType] == 1)
    {
      _HKInitializeLogging();
      os_log_t v29 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        v38 = v29;
        uint64_t v39 = (HDSecondaryDevicePairingAgentTaskServer *)objc_opt_class();
        *(_DWORD *)objc_super buf = 138543874;
        v52 = v39;
        __int16 v53 = 2114;
        id v54 = v28;
        __int16 v55 = 2114;
        id v56 = v7;
        id v40 = v39;
        _os_log_error_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@ Profile %{public}@ associated with NRDeviceUUID:%{public}@ is primary profile. Abort sharing tear down flow (#t0)", buf, 0x20u);
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Profile associated with NRDeviceUUID: %@ is primary profile.", v7);
    }
    else
    {
      if (v28)
      {
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __109__HDSecondaryDevicePairingAgentTaskServer_remote_tearDownHealthSharingWithTinkerDeviceWithNRUUID_completion___block_invoke;
        v49[3] = &unk_1E62F4928;
        v49[4] = self;
        id v31 = v8;
        id v50 = v31;
        -[HDSecondaryDevicePairingAgentTaskServer _scheduleTaskTimeout:timeoutHandler:]((dispatch_object_t *)self, v49, 60.0);
        v32 = [v28 cloudSyncManager];
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __109__HDSecondaryDevicePairingAgentTaskServer_remote_tearDownHealthSharingWithTinkerDeviceWithNRUUID_completion___block_invoke_323;
        v46[3] = &unk_1E62F2A18;
        v46[4] = self;
        id v47 = v28;
        id v48 = v31;
        id v33 = (id)[v32 leaveSharesWithCompletion:v46];

LABEL_19:
        goto LABEL_20;
      }
      _HKInitializeLogging();
      os_log_t v34 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        v41 = v34;
        id v42 = (HDSecondaryDevicePairingAgentTaskServer *)objc_opt_class();
        *(_DWORD *)objc_super buf = 138543618;
        v52 = v42;
        __int16 v53 = 2114;
        id v54 = v7;
        v43 = v42;
        _os_log_error_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@ Unable to find secondary profile associated with NRDeviceUUID: %{public}@ (#t0)", buf, 0x16u);
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Unable to find secondary profile associated with NRDeviceUUID: %@", v7);
    v35 = };
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v35);

    goto LABEL_19;
  }
  _HKInitializeLogging();
  os_log_t v30 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v36 = v30;
    __int16 v37 = NSStringFromSelector(a2);
    *(_DWORD *)objc_super buf = 138543618;
    v52 = self;
    __int16 v53 = 2114;
    id v54 = v37;
    _os_log_error_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ Health sharing pairing agent must be intialized with primary profile health store.", buf, 0x16u);
  }
  id v24 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Tear down health sharing pairing agent not initialized with primary profile health store."");
  (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v24);
LABEL_20:
}

void __109__HDSecondaryDevicePairingAgentTaskServer_remote_tearDownHealthSharingWithTinkerDeviceWithNRUUID_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    v4 = v2;
    *(_DWORD *)id v6 = 138543362;
    *(void *)&v6[4] = objc_opt_class();
    id v5 = *(id *)&v6[4];
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@ Sharing Tear Down timed out", v6, 0xCu);
  }
  id v3 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 103, @"Operation timed out", *(_OWORD *)v6);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __109__HDSecondaryDevicePairingAgentTaskServer_remote_tearDownHealthSharingWithTinkerDeviceWithNRUUID_completion___block_invoke_323(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v6 + 56))
  {
    -[HDSecondaryDevicePairingAgentTaskServer _cancelTaskTimeout](v6);
    if (a2)
    {
      uint64_t v7 = [*(id *)(a1 + 32) profile];
      id v8 = [v7 daemon];
      id v9 = [v8 profileManager];
      id v10 = [*(id *)(a1 + 40) profileIdentifier];
      id v12 = 0;
      [v9 deleteProfile:v10 error:&v12];
      id v11 = v12;

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (void)remote_fetchSharingStatusWithPairedGuardianWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(HDStandardTaskServer *)self profile];
  uint64_t v7 = [v6 daemon];
  id v8 = [v7 behavior];
  char v9 = [v8 isAppleWatch];

  if ((v9 & 1) == 0)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    id v15 = NSStringFromSelector(a2);
    [v14 handleFailureInMethod:a2, self, @"HDSecondaryDevicePairingAgentTaskServer.m", 362, @"%@ must be called from a watch.", v15 object file lineNumber description];
  }
  id v10 = [(HDStandardTaskServer *)self profile];
  id v11 = [v10 cloudSyncManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __101__HDSecondaryDevicePairingAgentTaskServer_remote_fetchSharingStatusWithPairedGuardianWithCompletion___block_invoke;
  v16[3] = &unk_1E62FB2D0;
  v16[4] = self;
  id v17 = v5;
  id v12 = v5;
  id v13 = (id)[v11 fetchShareParticipantsForSharingType:1 completion:v16];
}

void __101__HDSecondaryDevicePairingAgentTaskServer_remote_fetchSharingStatusWithPairedGuardianWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [*(id *)(a1 + 32) profile];
    id v17 = v6;
    id v8 = [v7 pairedGuardianParticipantWithError:&v17];
    id v9 = v17;

    if (v8)
    {
      (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [v5 containsObject:v8], 0);
    }
    else
    {
      _HKInitializeLogging();
      id v11 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = v11;
        id v15 = objc_opt_class();
        *(_DWORD *)objc_super buf = 138543618;
        id v19 = v15;
        __int16 v20 = 2114;
        id v21 = v9;
        id v16 = v15;
        _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@ Failed to fetch persisted paired Guardian participant from key value store, error: %{public}@", buf, 0x16u);
      }
      (*(void (**)(void, void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, v9);
    }

    id v6 = v9;
  }
  else
  {
    _HKInitializeLogging();
    id v10 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      id v12 = v10;
      *(_DWORD *)objc_super buf = 138543618;
      id v19 = (id)objc_opt_class();
      __int16 v20 = 2114;
      id v21 = v6;
      id v13 = v19;
      _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@ Failed to fetch participants from cloud zones, error: %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)remote_fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HDStandardTaskServer *)self profile];
  id v9 = [v8 cloudSyncManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __118__HDSecondaryDevicePairingAgentTaskServer_remote_fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress_completion___block_invoke;
  v12[3] = &unk_1E62F29A0;
  id v13 = v7;
  id v10 = v7;
  id v11 = (id)[v9 fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress:v6 completion:v12];
}

uint64_t __118__HDSecondaryDevicePairingAgentTaskServer_remote_fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__HDSecondaryDevicePairingAgentTaskServer__scheduleTaskTimeout_timeoutHandler___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void (**)(void))*(id *)(a1 + 32);
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 56) = 1;
    _HKInitializeLogging();
    id v3 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      id v6 = v3;
      *(_DWORD *)objc_super buf = 138543362;
      id v10 = (id)objc_opt_class();
      id v7 = v10;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@ Operation timed out", buf, 0xCu);
    }
    v4 = _Block_copy(*((const void **)WeakRetained + 10));
    id v5 = v4;
    if (v4) {
      (*((void (**)(void *))v4 + 2))(v4);
    }
    v2[2](v2);
  }
}

void __80__HDSecondaryDevicePairingAgentTaskServer__prepareGuardianForSharingForRequest___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = [*(id *)(a1 + 32) profile];
    id v7 = [v6 cloudSyncManager];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __80__HDSecondaryDevicePairingAgentTaskServer__prepareGuardianForSharingForRequest___block_invoke_339;
    v12[3] = &unk_1E62FB320;
    id v8 = *(void **)(a1 + 40);
    void v12[4] = *(void *)(a1 + 32);
    id v13 = v8;
    [v7 fetchCloudKitAccountInfoWithCompletion:v12];
  }
  else
  {
    _HKInitializeLogging();
    id v9 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      id v10 = v9;
      *(_DWORD *)objc_super buf = 138543618;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2114;
      id v17 = v5;
      id v11 = v15;
      _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@: Failed to prepare for sharing during setup: %{public}@ (#t0)", buf, 0x16u);
    }
    -[HDSecondaryDevicePairingAgentTaskServer _finishWithSuccess:error:](*(void *)(a1 + 32), 0, v5);
  }
}

void __80__HDSecondaryDevicePairingAgentTaskServer__prepareGuardianForSharingForRequest___block_invoke_339(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  _HKInitializeLogging();
  id v7 = (os_log_t *)MEMORY[0x1E4F29FA8];
  id v8 = (void *)*MEMORY[0x1E4F29FA8];
  id v9 = *MEMORY[0x1E4F29FA8];
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v38 = v8;
      *(_DWORD *)objc_super buf = 138543618;
      *(void *)&uint8_t buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v6;
      id v39 = *(id *)&buf[4];
      _os_log_error_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@: Unable to fetch iCloud ID with error: %{public}@ (#t0)", buf, 0x16u);
    }
    -[HDSecondaryDevicePairingAgentTaskServer _finishWithSuccess:error:](*(void *)(a1 + 32), 0, v6);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v8;
      id v11 = objc_opt_class();
      id v12 = v11;
      id v13 = [v5 emailAddress];
      *(_DWORD *)objc_super buf = 138543619;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2113;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@: Fetched icloud address for guardian: %{private}@ (#t0)", buf, 0x16u);
    }
    id v15 = [v5 emailAddress];
    __int16 v16 = *(void **)(a1 + 40);
    if (v16) {
      objc_setProperty_nonatomic_copy(v16, v14, v15, 64);
    }

    id v17 = *(void **)(a1 + 32);
    id v18 = *(id *)(a1 + 40);
    if (v17)
    {
      _HKInitializeLogging();
      os_log_t v19 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v20 = v19;
        id v21 = objc_opt_class();
        *(_DWORD *)objc_super buf = 138543362;
        *(void *)&uint8_t buf[4] = v21;
        id v22 = v21;
        _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Preparing to send message to Tinker watch (#t0)", buf, 0xCu);
      }
      if (v18) {
        *((void *)v18 + 6) = 3;
      }
      id v40 = [v17 profile];
      id v23 = [v40 daemon];
      id v24 = [v23 primaryProfile];
      os_log_t v25 = [v24 nanoSyncManager];
      if (v18)
      {
        id v26 = objc_alloc_init(HDCodableTinkerPairingRequest);
        __int16 v27 = [MEMORY[0x1E4F29128] UUID];
        id v28 = [v27 UUIDString];
        [(HDCodableTinkerPairingRequest *)v26 setRequestIdentifier:v28];

        -[HDCodableTinkerPairingRequest setSetupType:](v26, "setSetupType:", [*((id *)v18 + 4) setupType]);
        [(HDCodableTinkerPairingRequest *)v26 setGuardianIcloudIdentifier:*((void *)v18 + 8)];
        os_log_t v29 = [*((id *)v18 + 4) guardianFirstName];
        [(HDCodableTinkerPairingRequest *)v26 setGuardianFirstName:v29];

        os_log_t v30 = [*((id *)v18 + 4) guardianLastName];
        [(HDCodableTinkerPairingRequest *)v26 setGuardianLastName:v30];

        id v31 = [*((id *)v18 + 4) guardianDSID];
        -[HDCodableTinkerPairingRequest setGuardianDSID:](v26, "setGuardianDSID:", [v31 longLongValue]);

        v32 = [*((id *)v18 + 4) firstName];
        [(HDCodableTinkerPairingRequest *)v26 setTinkerFirstName:v32];

        id v33 = [*((id *)v18 + 4) lastName];
        [(HDCodableTinkerPairingRequest *)v26 setTinkerLastName:v33];

        os_log_t v34 = (void *)*((void *)v18 + 4);
      }
      else
      {
        id v26 = 0;
        os_log_t v34 = 0;
      }
      id v35 = v34;
      uint64_t v36 = [v35 nanoRegistryDeviceUUID];
      *(void *)objc_super buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __77__HDSecondaryDevicePairingAgentTaskServer__sendSharingRequestToTinkerDevice___block_invoke;
      id v42 = &unk_1E62FB348;
      v43 = v17;
      id v37 = v18;

      id v44 = v37;
      [v25 sendTinkerWatchPairingRequest:v26 forNRDeviceUUID:v36 completion:buf];
    }
  }
}

void __77__HDSecondaryDevicePairingAgentTaskServer__sendSharingRequestToTinkerDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = v6;
LABEL_3:
    -[HDSecondaryDevicePairingAgentTaskServer _finishWithSuccess:error:](v7, 0, v8);
    goto LABEL_4;
  }
  if (!v5)
  {
    _HKInitializeLogging();
    id v12 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v12;
      *(_DWORD *)objc_super buf = 138543362;
      *(void *)&uint8_t buf[4] = objc_opt_class();
      id v14 = *(id *)&buf[4];
      _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Tinker health sharing is disabled (#t0)", buf, 0xCu);
    }
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = 0;
    goto LABEL_3;
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 56))
  {
    _HKInitializeLogging();
    id v9 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      *(_DWORD *)objc_super buf = 138543362;
      *(void *)&uint8_t buf[4] = objc_opt_class();
      id v11 = *(id *)&buf[4];
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ We received a response from the tinker watch but the request has timed out.(#t0)", buf, 0xCu);
    }
  }
  else
  {
    id v30 = 0;
    id v15 = +[HDCloudSyncShareSetupMetadata cloudSyncShareSetupMetadataWithCodableSharingSetupMetadata:v5 error:&v30];
    id v16 = v30;
    if (v15)
    {
      id v17 = *(void **)(a1 + 32);
      id v18 = *(id *)(a1 + 40);
      id v19 = v15;
      if (v17)
      {
        _HKInitializeLogging();
        __int16 v20 = (void *)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          id v21 = v20;
          id v22 = objc_opt_class();
          *(_DWORD *)objc_super buf = 138543619;
          *(void *)&uint8_t buf[4] = v22;
          *(_WORD *)&buf[12] = 2113;
          *(void *)&buf[14] = v19;
          id v23 = v22;
          _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Accept shares with %{private}@ (#t0)", buf, 0x16u);
        }
        if (v18) {
          v18[6] = 4;
        }
        id v24 = [v17 profile];
        os_log_t v25 = [v24 cloudSyncManager];
        *(void *)objc_super buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __77__HDSecondaryDevicePairingAgentTaskServer__acceptSharingForRequest_metadata___block_invoke;
        v32 = &unk_1E62FB370;
        id v33 = v17;
        os_log_t v34 = v18;
        id v35 = v19;
        [v25 acceptShare:v35 completion:buf];
      }
    }
    else
    {
      _HKInitializeLogging();
      id v26 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        __int16 v27 = v26;
        id v28 = objc_opt_class();
        *(_DWORD *)objc_super buf = 138543618;
        *(void *)&uint8_t buf[4] = v28;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v16;
        id v29 = v28;
        _os_log_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@: Failed to decode share setup metadata: %{public}@", buf, 0x16u);
      }
      -[HDSecondaryDevicePairingAgentTaskServer _finishWithSuccess:error:](*(void *)(a1 + 32), 0, v16);
    }
  }
LABEL_4:
}

void __77__HDSecondaryDevicePairingAgentTaskServer__acceptSharingForRequest_metadata___block_invoke(uint64_t *a1, void *a2, void *a3)
{
  uint64_t v204 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!v5)
  {
    -[HDSecondaryDevicePairingAgentTaskServer _finishWithSuccess:error:](a1[4], 0, a3);
    goto LABEL_113;
  }
  id v6 = (void *)a1[5];
  if (v6)
  {
    v6[6] = 5;
    id v6 = (void *)a1[5];
  }
  v163 = a1;
  uint64_t v7 = (void *)a1[6];
  id v8 = (id)a1[4];
  v165 = v6;
  id v9 = v7;
  id v164 = v5;
  v162 = v9;
  if (!v8)
  {
    id v57 = 0;
    goto LABEL_54;
  }
  id v190 = 0;
  id v10 = v9;
  id v11 = [v5 firstObject];
  id v12 = [v11 owner];

  v171 = v8;
  id v13 = [v8 profile];
  id v14 = [v13 daemon];
  id v15 = [v14 profileManager];

  long long v193 = 0u;
  long long v194 = 0u;
  long long v191 = 0u;
  long long v192 = 0u;
  id v16 = [v15 allProfileIdentifiers];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v191 objects:v201 count:16];
  if (!v17)
  {
    id v8 = 0;
    goto LABEL_45;
  }
  uint64_t v18 = v17;
  uint64_t v19 = *(void *)v192;
  id v177 = v10;
  uint64_t v179 = *(void *)v192;
  v173 = v16;
  v175 = v15;
LABEL_7:
  uint64_t v20 = 0;
  uint64_t v187 = v18;
  while (1)
  {
    if (*(void *)v192 != v19) {
      objc_enumerationMutation(v16);
    }
    id v21 = *(void **)(*((void *)&v191 + 1) + 8 * v20);
    if ([v21 type] != 3) {
      goto LABEL_26;
    }
    id v22 = [v15 profileForIdentifier:v21];
    if (v22) {
      break;
    }
    _HKInitializeLogging();
    id v37 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      v38 = v37;
      id v39 = objc_opt_class();
      *(_DWORD *)objc_super buf = 138543618;
      *(void *)&uint8_t buf[4] = v39;
      __int16 v197 = 2114;
      v198 = v21;
      id v40 = v39;
      _os_log_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@: Profile %{public}@ deleted during iteration; skipping.",
        buf,
        0x16u);
LABEL_23:

      uint64_t v19 = v179;
    }
LABEL_25:

    uint64_t v18 = v187;
LABEL_26:
    if (v18 == ++v20)
    {
      uint64_t v43 = [v16 countByEnumeratingWithState:&v191 objects:v201 count:16];
      uint64_t v18 = v43;
      if (!v43)
      {
        id v8 = 0;
        id v5 = v164;
        goto LABEL_45;
      }
      goto LABEL_7;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _HKInitializeLogging();
    v41 = (void *)*MEMORY[0x1E4F29FA8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT)) {
      goto LABEL_25;
    }
    v38 = v41;
    id v42 = objc_opt_class();
    *(_DWORD *)objc_super buf = 138543618;
    *(void *)&uint8_t buf[4] = v42;
    __int16 v197 = 2114;
    v198 = v22;
    id v40 = v42;
    _os_log_fault_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_FAULT, "[sharing-setup] %{public}@: Profile %{public}@ is not actually a Tinker profile; skipping.",
      buf,
      0x16u);
    goto LABEL_23;
  }
  v185 = v22;
  id v23 = [v22 cloudSyncManager];
  id v195 = 0;
  id v24 = [v23 shareOwnerParticipantWithError:&v195];
  id v25 = v195;

  if (v24) {
    BOOL v26 = 1;
  }
  else {
    BOOL v26 = v25 == 0;
  }
  if (!v26)
  {
    _HKInitializeLogging();
    id v44 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      v46 = v44;
      id v47 = objc_opt_class();
      id v48 = v47;
      v49 = [v185 profileIdentifier];
      *(_DWORD *)objc_super buf = 138543874;
      *(void *)&uint8_t buf[4] = v47;
      __int16 v197 = 2114;
      v198 = v49;
      __int16 v199 = 2114;
      id v200 = v25;
      _os_log_impl(&dword_1BCB7D000, v46, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@: Failed to lookup owner participant at existing tinker profile %{public}@: %{public}@", buf, 0x20u);
    }
    id v8 = 0;
    id v190 = v25;
    goto LABEL_43;
  }
  __int16 v27 = [v10 profileIdentifier];
  int v28 = [v27 isEqual:v21];

  if (!v28)
  {
    v182 = v25;
    id v29 = [v24 userIdentity];
    id v30 = [v29 userRecordID];
    id v31 = [v30 recordName];
    v32 = v12;
    id v33 = [v12 userIdentity];
    os_log_t v34 = [v33 userRecordID];
    id v35 = [v34 recordName];
    int v36 = [v31 isEqual:v35];

    if (v36)
    {
      __int16 v53 = v185;
      id v8 = v185;

      id v5 = v164;
      id v15 = v175;
      id v10 = v177;
      id v12 = v32;
      id v16 = v173;
      id v25 = v182;
      goto LABEL_44;
    }

    id v15 = v175;
    id v10 = v177;
    id v12 = v32;
    id v16 = v173;
    id v22 = v185;
    uint64_t v19 = v179;
    goto LABEL_25;
  }
  if (!v12) {
    goto LABEL_38;
  }
  v188 = [v24 userIdentity];
  v183 = [v188 userRecordID];
  id v50 = [v183 recordName];
  v169 = [v12 userIdentity];
  v51 = [v169 userRecordID];
  v52 = [v51 recordName];
  char v180 = [v50 isEqual:v52];

  if (v180)
  {
LABEL_38:
    __int16 v53 = v185;
    id v8 = v185;

    id v5 = v164;
    goto LABEL_44;
  }
  _HKInitializeLogging();
  id v54 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)objc_super buf = 138543874;
    *(void *)&uint8_t buf[4] = v171;
    __int16 v197 = 2114;
    v198 = v24;
    __int16 v199 = 2114;
    id v200 = v12;
    _os_log_fault_impl(&dword_1BCB7D000, v54, OS_LOG_TYPE_FAULT, "%{public}@: Existing profile identifier has an owner (%{public}@) which does not match the incoming owner (%{public}@)", buf, 0x20u);
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v190, 721, @"Existing profile identifier has an owner (%@) which does not match the incoming owner (%@)", v24, v12, v162);

  id v8 = 0;
LABEL_43:
  id v5 = v164;
  __int16 v53 = v185;
LABEL_44:

LABEL_45:
  id v55 = v190;
  id v56 = v55;
  if (v8)
  {
    id v57 = 0;
    goto LABEL_47;
  }
  if (v55)
  {
    id v57 = v55;
    id v8 = 0;
  }
  else
  {
    id v106 = v5;
    if (v165) {
      id v107 = v165[4];
    }
    else {
      id v107 = 0;
    }
    uint64_t v108 = [v107 firstName];
    v109 = (void *)v108;
    v110 = @"Health Jr";
    if (v108) {
      v110 = (__CFString *)v108;
    }
    v111 = v110;
    v112 = [v10 profileIdentifier];
    if ([v112 type] != 3)
    {
      v113 = (void *)MEMORY[0x1E4F2B358];
      v114 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v115 = [v113 _profileWithUUID:v114 type:3];

      v112 = (void *)v115;
    }
    v116 = [v171 profile];
    v117 = [v116 daemon];
    v118 = [v117 profileManager];
    *(void *)&long long v191 = 0;
    id v8 = [v118 createProfileForIdentifier:v112 firstName:v111 lastName:0 error:&v191];

    id v119 = (id)v191;
    if (v8)
    {
      id v120 = v8;
      id v57 = 0;
      id v5 = v106;
    }
    else
    {
      _HKInitializeLogging();
      v137 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        v158 = v137;
        v159 = objc_opt_class();
        *(_DWORD *)v201 = 138543874;
        *(void *)&v201[4] = v159;
        *(_WORD *)&v201[12] = 2114;
        *(void *)&v201[14] = v112;
        *(_WORD *)&v201[22] = 2114;
        v202 = v119;
        id v160 = v159;
        _os_log_error_impl(&dword_1BCB7D000, v158, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@: Failed to create profile %{public}@ with error: %{public}@ (#t0)", v201, 0x20u);
      }
      id v138 = v119;
      id v57 = v138;
      id v5 = v106;
      if (v138) {
        id v139 = v138;
      }
    }
    if (v8)
    {
LABEL_47:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v161 = [MEMORY[0x1E4F28B00] currentHandler];
        [v161 handleFailureInMethod:sel__lookupOrCreateTinkerProfileForRequest_metadata_acceptedShares_error_, v171, @"HDSecondaryDevicePairingAgentTaskServer.m", 683, @"Invalid parameter not satisfying: %@", @"[tinkerProfile isKindOfClass:HDTinkerProfile.class]" object file lineNumber description];
      }
      if (v165) {
        objc_storeStrong(v165 + 7, v8);
      }
    }
  }

LABEL_54:
  id v58 = v57;
  v59 = v58;
  uint64_t v60 = v163[4];
  if (v8)
  {
    id v178 = v58;
    v61 = (void *)v163[6];
    id v62 = (id)v163[5];
    id v186 = v61;
    id v184 = v5;
    if (v60)
    {
      if (v62)
      {
        *((void *)v62 + 6) = 6;
        id v63 = *((id *)v62 + 7);
        v64 = (void *)*((void *)v62 + 4);
      }
      else
      {
        id v63 = 0;
        v64 = 0;
      }
      id v176 = v64;
      v65 = [v176 dateOfBirth];
      if (v62) {
        v66 = (void *)*((void *)v62 + 4);
      }
      else {
        v66 = 0;
      }
      id v174 = v66;
      v67 = [v174 firstName];
      uint64_t v189 = v60;
      if (v62) {
        v68 = (void *)*((void *)v62 + 4);
      }
      else {
        v68 = 0;
      }
      id v172 = v68;
      v69 = [v172 lastName];
      if (v62) {
        v70 = (void *)*((void *)v62 + 4);
      }
      else {
        v70 = 0;
      }
      id v170 = v70;
      v71 = [v170 dsid];
      id v72 = v63;
      id v73 = v65;
      id v74 = v67;
      id v75 = v69;
      id v76 = v71;
      id v181 = v8;
      if (v73)
      {
        v77 = [MEMORY[0x1E4F2ACC8] characteristicTypeForIdentifier:*MEMORY[0x1E4F298B8]];
        v78 = [v72 userCharacteristicsManager];
        *(void *)&long long v191 = 0;
        [v78 setUserCharacteristic:v73 forType:v77 error:&v191];
        id v79 = (id)v191;

        if (v79)
        {
          _HKInitializeLogging();
          v80 = (void *)*MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            v140 = v80;
            v141 = objc_opt_class();
            id v167 = v141;
            uint64_t v142 = [v72 profileIdentifier];
            *(_DWORD *)v201 = 138543874;
            *(void *)&v201[4] = v141;
            *(_WORD *)&v201[12] = 2114;
            *(void *)&v201[14] = v79;
            *(_WORD *)&v201[22] = 2114;
            v202 = (void *)v142;
            v143 = (void *)v142;
            _os_log_error_impl(&dword_1BCB7D000, v140, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@ Error %{public}@ saving date of birth into profile %{public}@ (#t0)", v201, 0x20u);
          }
          id v81 = v79;

          BOOL v82 = 0;
          goto LABEL_81;
        }
      }
      else
      {
        _HKInitializeLogging();
        v83 = (void *)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          v84 = v83;
          v85 = objc_opt_class();
          *(_DWORD *)v201 = 138543362;
          *(void *)&v201[4] = v85;
          id v86 = v85;
          _os_log_error_impl(&dword_1BCB7D000, v84, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@ Did not receive birthdate for user (#t0)", v201, 0xCu);
        }
      }
      *(void *)objc_super buf = 0;
      [v72 setDisplayFirstName:v74 lastName:v75 error:buf];
      id v87 = *(id *)buf;
      if (v87)
      {
        v88 = v87;
        _HKInitializeLogging();
        v89 = (void *)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          v144 = v89;
          v145 = objc_opt_class();
          *(_DWORD *)v201 = 138544130;
          *(void *)&v201[4] = v145;
          *(_WORD *)&v201[12] = 2114;
          *(void *)&v201[14] = v88;
          *(_WORD *)&v201[22] = 2114;
          v202 = v74;
          LOWORD(v203) = 2114;
          *(void *)((char *)&v203 + 2) = v75;
          id v146 = v145;
          _os_log_error_impl(&dword_1BCB7D000, v144, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@ Error %{public}@ saving first %{public}@ and last %{public}@ name (#t0)", v201, 0x2Au);
        }
        id v81 = v88;
        BOOL v82 = 0;
        v77 = v81;
      }
      else
      {
        id v195 = 0;
        [v72 setDSID:v76 error:&v195];
        id v90 = v195;
        BOOL v82 = v90 == 0;
        if (v90)
        {
          _HKInitializeLogging();
          v91 = (void *)*MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            v155 = v91;
            v156 = objc_opt_class();
            *(_DWORD *)v201 = 138543874;
            *(void *)&v201[4] = v156;
            *(_WORD *)&v201[12] = 2114;
            *(void *)&v201[14] = v90;
            *(_WORD *)&v201[22] = 2114;
            v202 = v76;
            id v157 = v156;
            _os_log_error_impl(&dword_1BCB7D000, v155, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@ Error %{public}@ saving DSID %{public}@ (#t0)", v201, 0x20u);
          }
        }

        id v81 = 0;
        v77 = 0;
      }
LABEL_81:

      id v92 = v81;
      if (v82)
      {
        _HKInitializeLogging();
        v93 = (id *)MEMORY[0x1E4F29FA8];
        v94 = (void *)*MEMORY[0x1E4F29FA8];
        uint64_t v95 = v189;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          v96 = v94;
          v97 = objc_opt_class();
          *(_DWORD *)v201 = 138543362;
          *(void *)&v201[4] = v97;
          id v98 = v97;
          _os_log_impl(&dword_1BCB7D000, v96, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Profile name, DoB, DSID saved successfully (#t0)", v201, 0xCu);
        }
        if (v62)
        {
          id v99 = *((id *)v62 + 7);
          v100 = (void *)*((void *)v62 + 4);
        }
        else
        {
          id v99 = 0;
          v100 = 0;
        }
        id v101 = v100;
        v102 = [v101 nanoRegistryDeviceUUID];
        *(void *)&long long v191 = 0;
        [v99 setPairedNRDeviceUUID:v102 error:&v191];
        id v103 = (id)v191;

        _HKInitializeLogging();
        v104 = *v93;
        v105 = v104;
        id v8 = v181;
        if (v103)
        {
          id v5 = v164;
          if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
          {
            v147 = objc_opt_class();
            if (v62) {
              v148 = (void *)*((void *)v62 + 7);
            }
            else {
              v148 = 0;
            }
            id v149 = v148;
            id v150 = v147;
            v151 = [v149 profileIdentifier];
            id v168 = v92;
            if (v62) {
              v152 = (void *)*((void *)v62 + 4);
            }
            else {
              v152 = 0;
            }
            id v153 = v152;
            v154 = [v153 nanoRegistryDeviceUUID];
            *(_DWORD *)v201 = 138544130;
            *(void *)&v201[4] = v147;
            *(_WORD *)&v201[12] = 2114;
            *(void *)&v201[14] = v151;
            *(_WORD *)&v201[22] = 2114;
            v202 = v154;
            LOWORD(v203) = 2114;
            *(void *)((char *)&v203 + 2) = v103;
            _os_log_error_impl(&dword_1BCB7D000, v105, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@: Failed to associate profile (%{public}@) with NRDeviceUUID: (%{public}@) error: %{public}@ (#t0)", v201, 0x2Au);

            id v5 = v164;
            id v8 = v181;
            uint64_t v95 = v189;
            id v92 = v168;
          }

          -[HDSecondaryDevicePairingAgentTaskServer _finishWithSuccess:error:](v95, 0, v92);
        }
        else
        {
          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
          {
            v121 = objc_opt_class();
            if (v62) {
              v122 = (void *)*((void *)v62 + 4);
            }
            else {
              v122 = 0;
            }
            id v123 = v122;
            id v124 = v121;
            v125 = [v123 nanoRegistryDeviceUUID];
            id v166 = v92;
            if (v62) {
              v126 = (void *)*((void *)v62 + 7);
            }
            else {
              v126 = 0;
            }
            id v127 = v126;
            v128 = [v127 profileIdentifier];
            *(_DWORD *)v201 = 138543874;
            *(void *)&v201[4] = v121;
            *(_WORD *)&v201[12] = 2114;
            *(void *)&v201[14] = v125;
            *(_WORD *)&v201[22] = 2114;
            v202 = v128;
            _os_log_impl(&dword_1BCB7D000, v105, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Device %{public}@ associated successfully with profile %{public}@ (#t0)", v201, 0x20u);

            uint64_t v95 = v189;
            id v92 = v166;
            v93 = (id *)MEMORY[0x1E4F29FA8];
          }

          _HKInitializeLogging();
          id v129 = *v93;
          if (os_log_type_enabled((os_log_t)*v93, OS_LOG_TYPE_DEFAULT))
          {
            v130 = v129;
            v131 = objc_opt_class();
            *(_DWORD *)v201 = 138543362;
            *(void *)&v201[4] = v131;
            id v132 = v131;
            _os_log_impl(&dword_1BCB7D000, v130, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Configuring profile for share setup metadata (#t0)", v201, 0xCu);
          }
          if (v62) {
            v133 = (void *)*((void *)v62 + 7);
          }
          else {
            v133 = 0;
          }
          id v134 = v133;
          v135 = [v134 cloudSyncManager];
          *(void *)v201 = MEMORY[0x1E4F143A8];
          *(void *)&v201[8] = 3221225472;
          *(void *)&v201[16] = __97__HDSecondaryDevicePairingAgentTaskServer__setupTinkerProfileForRequest_metadata_acceptedShares___block_invoke;
          v202 = &unk_1E62F5D48;
          *(void *)&long long v203 = v95;
          id v136 = v62;

          *((void *)&v203 + 1) = v136;
          [v135 configureForShareSetupMetadata:v186 acceptedShares:v184 completion:v201];

          id v5 = v164;
        }
      }
      else
      {
        -[HDSecondaryDevicePairingAgentTaskServer _finishWithSuccess:error:](v189, 0, v92);
        id v5 = v164;
        id v8 = v181;
      }
    }
    v59 = v178;
  }
  else
  {
    -[HDSecondaryDevicePairingAgentTaskServer _finishWithSuccess:error:](v163[4], 0, v58);
  }

LABEL_113:
}

void __97__HDSecondaryDevicePairingAgentTaskServer__setupTinkerProfileForRequest_metadata_acceptedShares___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      *(_DWORD *)objc_super buf = 138543362;
      id v14 = (id)objc_opt_class();
      id v6 = v14;
      _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Subscribing to data available notifications (#t0)", buf, 0xCu);
    }
    uint64_t v7 = *(void **)(a1 + 40);
    if (v7) {
      uint64_t v7 = (void *)v7[7];
    }
    id v8 = v7;
    id v9 = [v8 cloudSyncManager];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __97__HDSecondaryDevicePairingAgentTaskServer__setupTinkerProfileForRequest_metadata_acceptedShares___block_invoke_347;
    v12[3] = &unk_1E62F2978;
    uint64_t v10 = *(void *)(a1 + 32);

    void v12[4] = v10;
    [v9 subscribeToDataAvailableNotificationsWithCompletion:v12];

    -[HDSecondaryDevicePairingAgentTaskServer _finishWithSuccess:error:](*(void *)(a1 + 32), 1, 0);
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    -[HDSecondaryDevicePairingAgentTaskServer _finishWithSuccess:error:](v11, 0, a3);
  }
}

void __97__HDSecondaryDevicePairingAgentTaskServer__setupTinkerProfileForRequest_metadata_acceptedShares___block_invoke_347(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v5 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
    {
      id v6 = v5;
      int v8 = 138543618;
      id v9 = (id)objc_opt_class();
      __int16 v10 = 2114;
      id v11 = v4;
      id v7 = v9;
      _os_log_fault_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_FAULT, "[sharing-setup] %{public}@: Failed to set up subscriptions: %{public}@ (#t0)", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (double)tinkerSharingSetupTimeout
{
  return self->_tinkerSharingSetupTimeout;
}

- (void)setTinkerSharingSetupTimeout:(double)a3
{
  self->_double tinkerSharingSetupTimeout = a3;
}

- (id)unitTest_timeoutTriggered
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setUnitTest_timeoutTriggered:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_timeoutTriggered, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);

  objc_storeStrong((id *)&self->_timeoutSource, 0);
}

@end