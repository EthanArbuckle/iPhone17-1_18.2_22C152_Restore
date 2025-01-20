@interface CDPSOSCircleProxyImpl
+ (unint64_t)syncingStatusForAltDSID:(id)a3;
- (BOOL)_performSOSCBlock:(id)a3 error:(id *)a4;
- (BOOL)_registerCredentialsOnlyIfNeeded:(BOOL)a3;
- (BOOL)_viewMemberForView:(__CFString *)a3 error:(id *)a4;
- (BOOL)anyPeerHasEnabledViewsInSet:(id)a3 error:(id *)a4;
- (BOOL)canAuthenticate;
- (BOOL)fetchUserControllableViewsSyncingEnabled:(id *)a3;
- (BOOL)hasNonViewAwarePeers;
- (BOOL)isLastBackupMakingPeer:(id *)a3;
- (BOOL)registerCredentials;
- (BOOL)registerCredentialsIfMissing;
- (BOOL)removeNonViewAwarePeers:(id *)a3;
- (BOOL)removeThisDeviceFromCircle:(id *)a3;
- (BOOL)requestToJoinCircle:(id *)a3;
- (BOOL)requestToJoinCircleAfterRestore:(id *)a3;
- (BOOL)requestToResetCircle:(id *)a3;
- (BOOL)requestToResetCloudKitDataForReason:(id)a3 error:(id *)a4;
- (BOOL)resetToOffering:(id *)a3;
- (BOOL)setUserControllableViewsSyncStatus:(BOOL)a3 error:(id *)a4;
- (BOOL)setViewsWithEnableSet:(id)a3 disableSet:(id)a4;
- (BOOL)synchronizeCircleViews;
- (BOOL)tryRegisteringCredentials;
- (BOOL)viewMemberForAutofillPasswords:(id *)a3;
- (BOOL)viewMemberForPCSMaster:(id *)a3;
- (CDPContext)cdpContext;
- (CDPSOSCircleProxyImpl)initWithContext:(id)a3;
- (id)generateRecoveryKeyWithInfo:(id)a3 error:(id *)a4;
- (id)generateVerifierWithRcoveryKey:(id)a3 error:(id *)a4;
- (id)generateVerifierWithRecoveryKey:(id)a3 error:(id *)a4;
- (id)pairingChannelAcceptor;
- (id)pairingChannelInitiator;
- (id)peerDeviceNamesByPeerID;
- (id)peerId;
- (id)requestToResetProtectedData:(id *)a3;
- (int)_authenticatedCircleStatus:(id *)a3;
- (int)_circleStatus:(id *)a3;
- (int)cachedSOSCircleStatus:(id *)a3;
- (int64_t)cliqueStatus:(id *)a3;
- (unint64_t)cachedCliqueStatus:(id *)a3;
- (unint64_t)cdpStatusFromSOS:(int)a3;
- (unint64_t)combinedCachedCircleStatus:(id *)a3;
- (unint64_t)combinedCircleStatus:(id *)a3;
- (unint64_t)peerCount;
- (void)hasNonViewAwarePeers;
- (void)peerCount;
- (void)peerDeviceNamesByPeerID;
- (void)peerId;
- (void)recoverOctagonUsingCustodianInfo:(id)a3 completion:(id)a4;
- (void)reportFailure:(id)a3;
- (void)reportSuccess;
- (void)synchronizeCircleViews;
- (void)tryRegisteringCredentials;
- (void)waitForUpdate;
@end

@implementation CDPSOSCircleProxyImpl

- (CDPSOSCircleProxyImpl)initWithContext:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [v5 dsid];

  if (v6)
  {
    v16.receiver = self;
    v16.super_class = (Class)CDPSOSCircleProxyImpl;
    v7 = [(CDPSOSCircleProxyImpl *)&v16 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_cdpContext, a3);
    }
    v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [v5 appleID];
      v11 = [v5 dsid];
      uint64_t v12 = [v5 type];
      *(_DWORD *)buf = 141559042;
      uint64_t v18 = 1752392040;
      __int16 v19 = 2112;
      v20 = v10;
      __int16 v21 = 2160;
      uint64_t v22 = 1752392040;
      __int16 v23 = 2112;
      v24 = v11;
      __int16 v25 = 2048;
      uint64_t v26 = v12;
      _os_log_impl(&dword_2182AE000, v9, OS_LOG_TYPE_DEFAULT, "CDPSOSCircleProxyImpl: appleID:%{mask.hash}@, dsid: %{mask.hash}@, type: %ld", buf, 0x34u);
    }
    self = v8;
    v13 = self;
  }
  else
  {
    v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[CDPSOSCircleProxyImpl initWithContext:]();
    }

    v13 = 0;
  }

  return v13;
}

- (unint64_t)cdpStatusFromSOS:(int)a3
{
  if ((a3 + 1) > 4) {
    return 0;
  }
  else {
    return qword_218305178[a3 + 1];
  }
}

- (void)waitForUpdate
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "This is probably a no op here...", v2, v3, v4, v5, v6);
}

- (unint64_t)combinedCircleStatus:(id *)a3
{
  uint64_t v4 = [(CDPSOSCircleProxyImpl *)self _authenticatedCircleStatus:a3];
  return [(CDPSOSCircleProxyImpl *)self cdpStatusFromSOS:v4];
}

- (int)cachedSOSCircleStatus:(id *)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([(CDPContext *)self->_cdpContext isBeneficiaryAccount])
  {
    uint64_t v4 = _CDPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl(&dword_2182AE000, v4, OS_LOG_TYPE_DEFAULT, "Beneficiary account detected. Faking cached SOS circle status.", (uint8_t *)v9, 2u);
    }

    return 0;
  }
  else
  {
    v9[0] = 0;
    uint8_t v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2182AE000, v6, OS_LOG_TYPE_DEFAULT, "Checking circle status with SOSCCThisDeviceIsInCircle", buf, 2u);
    }

    int v5 = SOSCCThisDeviceIsInCircle();
    v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v11 = v5;
      _os_log_impl(&dword_2182AE000, v7, OS_LOG_TYPE_DEFAULT, "Call to SOSCCThisDeviceIsInCircle returned a status: %d", buf, 8u);
    }

    if (a3) {
      *a3 = v9[0];
    }
  }
  return v5;
}

- (unint64_t)combinedCachedCircleStatus:(id *)a3
{
  uint64_t v4 = [(CDPSOSCircleProxyImpl *)self cachedSOSCircleStatus:a3];
  return [(CDPSOSCircleProxyImpl *)self cdpStatusFromSOS:v4];
}

- (int)_circleStatus:(id *)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if ([(CDPContext *)self->_cdpContext isBeneficiaryAccount])
  {
    uint64_t v4 = _CDPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2182AE000, v4, OS_LOG_TYPE_DEFAULT, "Beneficiary account detected. Faking non-cached SOS circle status.", buf, 2u);
    }

    return 0;
  }
  else
  {
    uint8_t v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2182AE000, v6, OS_LOG_TYPE_DEFAULT, "Checking circle status with SOSCCThisDeviceIsInCircle", buf, 2u);
    }

    v7 = _CDPSignpostLogSystem();
    os_signpost_id_t v8 = _CDPSignpostCreate(v7);
    uint64_t v10 = v9;

    int v11 = _CDPSignpostLogSystem();
    uint64_t v12 = v11;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2182AE000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SOSCircleStatus", " enableTelemetry=YES ", buf, 2u);
    }

    v13 = _CDPSignpostLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      os_signpost_id_t v21 = v8;
      _os_log_impl(&dword_2182AE000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SOSCircleStatus  enableTelemetry=YES ", buf, 0xCu);
    }

    int v5 = SOSCCThisDeviceIsInCircleNonCached();
    v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = v5;
      _os_log_impl(&dword_2182AE000, v14, OS_LOG_TYPE_DEFAULT, "Call to SOSCCThisDeviceIsInCircle returned a status: %d", buf, 8u);
    }

    if (a3) {
      *a3 = 0;
    }
    unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(v8, v10);
    objc_super v16 = _CDPSignpostLogSystem();
    v17 = v16;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_DWORD *)buf = 67240192;
      LODWORD(v21) = v5;
      _os_signpost_emit_with_name_impl(&dword_2182AE000, v17, OS_SIGNPOST_INTERVAL_END, v8, "SOSCircleStatus", " status=%{public,signpost.telemetry:number1,name=status}d ", buf, 8u);
    }

    uint64_t v18 = _CDPSignpostLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      os_signpost_id_t v21 = v8;
      __int16 v22 = 2048;
      double v23 = (double)Nanoseconds / 1000000000.0;
      __int16 v24 = 1026;
      int v25 = v5;
      _os_log_impl(&dword_2182AE000, v18, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SOSCircleStatus  status=%{public,signpost.telemetry:number1,name=status}d ", buf, 0x1Cu);
    }
  }
  return v5;
}

- (int)_authenticatedCircleStatus:(id *)a3
{
  id v11 = 0;
  int v5 = [(CDPSOSCircleProxyImpl *)self _circleStatus:&v11];
  id v6 = v11;
  if ((v5 + 1) <= 4 && ((1 << (v5 + 1)) & 0x15) != 0)
  {
    if (![(CDPSOSCircleProxyImpl *)self tryRegisteringCredentials]) {
      [(CDPSOSCircleProxyImpl *)self registerCredentials];
    }
    id v10 = v6;
    int v5 = [(CDPSOSCircleProxyImpl *)self _circleStatus:&v10];
    id v8 = v10;

    id v6 = v8;
  }
  if (a3) {
    *a3 = v6;
  }

  return v5;
}

- (id)peerId
{
  uint64_t v2 = SOSCCCopyMyPeerInfo();
  if (v2)
  {
    uint64_t v3 = (const void *)v2;
    uint64_t v4 = (void *)[(id)SOSPeerInfoGetPeerID() copy];
    CFRelease(v3);
  }
  else
  {
    uint64_t v4 = 0;
    int v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CDPSOSCircleProxyImpl peerId]();
    }

    CFRelease(0);
  }
  return v4;
}

- (unint64_t)peerCount
{
  CFArrayRef v2 = (const __CFArray *)SOSCCCopyPeerPeerInfo();
  if (!v2) {
    return 0;
  }
  CFArrayRef v3 = v2;
  CFIndex Count = CFArrayGetCount(v2);
  CFRelease(v3);
  return Count;
}

- (id)peerDeviceNamesByPeerID
{
  CFArrayRef v2 = [MEMORY[0x263EFF9A0] dictionary];
  CFArrayRef v3 = (const __CFArray *)SOSCCCopyPeerPeerInfo();
  if (v3)
  {
    CFArrayRef v4 = v3;
    if (CFArrayGetCount(v3) >= 1)
    {
      CFIndex v5 = 0;
      do
      {
        CFArrayGetValueAtIndex(v4, v5);
        id v6 = SOSPeerInfoGetPeerName();
        v7 = SOSPeerInfoGetPeerID();
        id v8 = (void *)[v6 copy];
        [v2 setObject:v8 forKey:v7];

        ++v5;
      }
      while (v5 < CFArrayGetCount(v4));
    }
    CFRelease(v4);
  }
  return v2;
}

- (id)generateRecoveryKeyWithInfo:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x270EFDC08](a4, a2, a3);
}

- (id)generateVerifierWithRcoveryKey:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x270EFDC00](a3, a4);
}

- (BOOL)synchronizeCircleViews
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  CFArrayRef v3 = _CDPSignpostLogSystem();
  os_signpost_id_t v4 = _CDPSignpostCreate(v3);
  uint64_t v6 = v5;

  v7 = _CDPSignpostLogSystem();
  id v8 = v7;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v4, "SynchronizeCircleViews", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v9 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)uint64_t v26 = v4;
    _os_log_impl(&dword_2182AE000, v9, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SynchronizeCircleViews  enableTelemetry=YES ", buf, 0xCu);
  }

  unint64_t v10 = [(CDPSOSCircleProxyImpl *)self combinedCircleStatus:0];
  id v11 = _CDPLogSystem();
  uint64_t v12 = v11;
  if (v10 == 1)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2182AE000, v12, OS_LOG_TYPE_DEFAULT, "Calling SOSCCWaitForInitialSync to wait for views to sync", buf, 2u);
    }

    id v24 = 0;
    BOOL v13 = [(CDPSOSCircleProxyImpl *)self _performSOSCBlock:&__block_literal_global_14 error:&v24];
    uint64_t v12 = v24;
    v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)uint64_t v26 = v13;
      *(_WORD *)&v26[4] = 2112;
      *(void *)&v26[6] = v12;
      _os_log_impl(&dword_2182AE000, v14, OS_LOG_TYPE_DEFAULT, "Finished calling SOSCCWaitForInitialSync didSync=%i error=%@", buf, 0x12u);
    }

    if (!v13)
    {
      uint64_t v23 = 0;
      BOOL v15 = [(CDPSOSCircleProxyImpl *)self removeThisDeviceFromCircle:&v23];
      objc_super v16 = _CDPLogSystem();
      v17 = v16;
      if (v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          -[CDPSOSCircleProxyImpl synchronizeCircleViews]();
        }
      }
      else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        -[CDPCircleProxyImpl synchronizeCircleViews]();
      }
    }
    unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(v4, v6);
    __int16 v19 = _CDPSignpostLogSystem();
    v20 = v19;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)uint64_t v26 = v13;
      _os_signpost_emit_with_name_impl(&dword_2182AE000, v20, OS_SIGNPOST_INTERVAL_END, v4, "SynchronizeCircleViews", " didSync=%{public,signpost.telemetry:number1,name=didSync}d ", buf, 8u);
    }

    os_signpost_id_t v21 = _CDPSignpostLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(void *)uint64_t v26 = v4;
      *(_WORD *)&v26[8] = 2048;
      *(double *)&v26[10] = (double)Nanoseconds / 1000000000.0;
      __int16 v27 = 1026;
      BOOL v28 = v13;
      _os_log_impl(&dword_2182AE000, v21, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SynchronizeCircleViews  didSync=%{public,signpost.telemetry:number1,name=didSync}d ", buf, 0x1Cu);
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[CDPSOSCircleProxyImpl synchronizeCircleViews]();
    }
    LOBYTE(v13) = 1;
  }

  return v13;
}

uint64_t __47__CDPSOSCircleProxyImpl_synchronizeCircleViews__block_invoke(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270EFD4C8](a2);
}

- (BOOL)removeThisDeviceFromCircle:(id *)a3
{
  uint64_t v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2182AE000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to remove self from circle", buf, 2u);
  }

  BOOL v6 = [(CDPSOSCircleProxyImpl *)self _performSOSCBlock:&__block_literal_global_18 error:a3];
  v7 = _CDPLogSystem();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v10 = 0;
      _os_log_impl(&dword_2182AE000, v8, OS_LOG_TYPE_DEFAULT, "Removed device from circle successfully", v10, 2u);
    }
LABEL_11:

    return v6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[CDPSOSCircleProxyImpl removeThisDeviceFromCircle:]();
  }

  if (a3)
  {
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CDPCircleProxyImpl removeThisDeviceFromCircle:]();
    }
    goto LABEL_11;
  }
  return v6;
}

uint64_t __52__CDPSOSCircleProxyImpl_removeThisDeviceFromCircle___block_invoke(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270EFD468](a2);
}

- (BOOL)resetToOffering:(id *)a3
{
  uint64_t v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2182AE000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to reset to offering", buf, 2u);
  }

  BOOL v6 = [(CDPSOSCircleProxyImpl *)self _performSOSCBlock:&__block_literal_global_20 error:a3];
  v7 = _CDPLogSystem();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v10 = 0;
      _os_log_impl(&dword_2182AE000, v8, OS_LOG_TYPE_DEFAULT, "Reset to offering succeeded.", v10, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[CDPSOSCircleProxyImpl resetToOffering:]();
  }

  return v6;
}

uint64_t __41__CDPSOSCircleProxyImpl_resetToOffering___block_invoke(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270EFD488](a2);
}

- (BOOL)requestToJoinCircle:(id *)a3
{
  return [(CDPSOSCircleProxyImpl *)self _performSOSCBlock:&__block_literal_global_22 error:a3];
}

uint64_t __45__CDPSOSCircleProxyImpl_requestToJoinCircle___block_invoke(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270EFD470](a2);
}

- (BOOL)requestToJoinCircleAfterRestore:(id *)a3
{
  return [(CDPSOSCircleProxyImpl *)self _performSOSCBlock:&__block_literal_global_24 error:a3];
}

uint64_t __57__CDPSOSCircleProxyImpl_requestToJoinCircleAfterRestore___block_invoke(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270EFD478](a2);
}

- (BOOL)requestToResetCircle:(id *)a3
{
  return [(CDPSOSCircleProxyImpl *)self _performSOSCBlock:&__block_literal_global_26 error:a3];
}

uint64_t __46__CDPSOSCircleProxyImpl_requestToResetCircle___block_invoke(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270EFD480](a2);
}

- (BOOL)requestToResetCloudKitDataForReason:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  int v25 = __Block_byref_object_copy__5;
  uint64_t v26 = __Block_byref_object_dispose__5;
  id v27 = 0;
  id v21 = 0;
  BOOL v6 = [MEMORY[0x263F16CD8] controlObject:&v21];
  id v7 = v21;
  if (v6)
  {
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __67__CDPSOSCircleProxyImpl_requestToResetCloudKitDataForReason_error___block_invoke;
    v16[3] = &unk_264317E90;
    uint64_t v18 = &v22;
    __int16 v19 = &v28;
    uint64_t v9 = v8;
    v17 = v9;
    [v6 rpcResetCloudKit:0 reason:v5 reply:v16];
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    unint64_t v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2182AE000, v10, OS_LOG_TYPE_DEFAULT, "CKKS control unavailable", buf, 2u);
    }

    id v11 = v23;
    id v12 = v7;
    uint64_t v9 = v11[5];
    v11[5] = (uint64_t)v12;
  }

  if (v23[5])
  {
    BOOL v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CDPSOSCircleProxyImpl requestToResetCloudKitDataForReason:error:]();
    }

    if (a4) {
      *a4 = (id) v23[5];
    }
  }
  char v14 = *((unsigned char *)v29 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v14;
}

void __67__CDPSOSCircleProxyImpl_requestToResetCloudKitDataForReason_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    id v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_2182AE000, v5, OS_LOG_TYPE_DEFAULT, "Cloud data reset!", v6, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)viewMemberForPCSMaster:(id *)a3
{
  return [(CDPSOSCircleProxyImpl *)self _viewMemberForView:*MEMORY[0x263F16E38] error:a3];
}

- (BOOL)viewMemberForAutofillPasswords:(id *)a3
{
  return [(CDPSOSCircleProxyImpl *)self _viewMemberForView:*MEMORY[0x263F16E28] error:a3];
}

- (BOOL)_viewMemberForView:(__CFString *)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v6 = SOSCCView();
  id v7 = _CDPLogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6 == 1)
  {
    if (!v8) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412546;
    *(void *)char v14 = a3;
    *(_WORD *)&v14[8] = 2112;
    *(void *)&v14[10] = 0;
    uint64_t v9 = "Calling SOSCCView for view %@ reported device is MEMBER - (error: %@)";
    unint64_t v10 = v7;
    uint32_t v11 = 22;
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)char v14 = v6;
    *(_WORD *)&v14[4] = 2112;
    *(void *)&v14[6] = a3;
    *(_WORD *)&v14[14] = 2112;
    *(void *)&v14[16] = 0;
    uint64_t v9 = "Calling SOSCCView returned status %i for view %@ - (error: %@)";
    unint64_t v10 = v7;
    uint32_t v11 = 28;
  }
  _os_log_impl(&dword_2182AE000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_7:

  if (a4) {
    *a4 = 0;
  }
  return v6 == 1;
}

- (BOOL)anyPeerHasEnabledViewsInSet:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  id v9[2] = __59__CDPSOSCircleProxyImpl_anyPeerHasEnabledViewsInSet_error___block_invoke;
  v9[3] = &unk_264316B90;
  id v10 = v6;
  id v7 = v6;
  LOBYTE(a4) = [(CDPSOSCircleProxyImpl *)self _performSOSCBlock:v9 error:a4];

  return (char)a4;
}

BOOL __59__CDPSOSCircleProxyImpl_anyPeerHasEnabledViewsInSet_error___block_invoke(uint64_t a1)
{
  return SOSCCPeersHaveViewsEnabled() == *MEMORY[0x263EFFB40];
}

- (BOOL)hasNonViewAwarePeers
{
  CFArrayRef v2 = (const __CFArray *)SOSCCCopyViewUnawarePeerInfo();
  if (!v2) {
    return 0;
  }
  BOOL v3 = CFArrayGetCount(v2) > 0;
  CFRelease(v2);
  return v3;
}

- (BOOL)removeNonViewAwarePeers:(id *)a3
{
  [(CDPSOSCircleProxyImpl *)self registerCredentials];
  uint64_t v4 = SOSCCCopyViewUnawarePeerInfo();
  if (v4)
  {
    id v5 = (const void *)v4;
    LODWORD(v6) = SOSCCRemovePeersFromCircle();

    id v7 = _CDPLogSystem();
    BOOL v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[CDPSOSCircleProxyImpl removeNonViewAwarePeers:]();
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[CDPCircleProxyImpl removeNonViewAwarePeers:]();
    }

    CFRelease(v5);
    if (a3) {
LABEL_12:
    }
      *a3 = 0;
  }
  else
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[CDPSOSCircleProxyImpl removeNonViewAwarePeers:]();
    }

    LOBYTE(v6) = 0;
    if (a3) {
      goto LABEL_12;
    }
  }

  return (char)v6;
}

- (BOOL)isLastBackupMakingPeer:(id *)a3
{
  return 0;
}

- (BOOL)setUserControllableViewsSyncStatus:(BOOL)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = _os_activity_create(&dword_2182AE000, "cdp: Updating keychain views", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  id v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F16E48], *MEMORY[0x263F16E28], *MEMORY[0x263F16E40], *MEMORY[0x263F16E30], 0);
  BOOL v8 = v7;
  if (a3)
  {
    id v9 = v7;
    id v10 = [MEMORY[0x263EFFA08] set];
  }
  else
  {
    id v9 = [MEMORY[0x263EFFA08] set];
    id v10 = v8;
  }
  uint32_t v11 = v10;
  BOOL v12 = [(CDPSOSCircleProxyImpl *)self setViewsWithEnableSet:v9 disableSet:v10];
  BOOL v13 = _CDPLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v17 = v9;
    __int16 v18 = 2112;
    __int16 v19 = v11;
    __int16 v20 = 1024;
    BOOL v21 = v12;
    _os_log_debug_impl(&dword_2182AE000, v13, OS_LOG_TYPE_DEBUG, "Calling SOSCCViewSet with enable=%@ disable=%@ returned success=%i", buf, 0x1Cu);
  }

  os_activity_scope_leave(&state);
  return v12;
}

- (BOOL)setViewsWithEnableSet:(id)a3 disableSet:(id)a4
{
  return MEMORY[0x270EFD4C0](a3, a4);
}

- (BOOL)_performSOSCBlock:(id)a3 error:(id *)a4
{
  id v6 = (uint64_t (**)(id, CFErrorRef *))a3;
  CFErrorRef err = 0;
  if (v6[2](v6, &err))
  {
    char v7 = 1;
  }
  else if (err {
         && (CFStringRef v8 = (const __CFString *)*MEMORY[0x263F16E20],
  }
             CFStringRef Domain = CFErrorGetDomain(err),
             CFEqual(v8, Domain))
         && (CFErrorGetCode(err) == 1 || CFErrorGetCode(err) == 2)
         && [(CDPSOSCircleProxyImpl *)self registerCredentials])
  {
    CFRelease(err);
    CFErrorRef err = 0;
    char v7 = v6[2](v6, &err);
  }
  else
  {
    char v7 = 0;
  }
  if (a4)
  {
    *a4 = err;
  }
  else if (err)
  {
    CFRelease(err);
  }

  return v7;
}

- (BOOL)registerCredentials
{
  return [(CDPSOSCircleProxyImpl *)self _registerCredentialsOnlyIfNeeded:0];
}

- (BOOL)_registerCredentialsOnlyIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = self->_cdpContext;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    char v7 = [(CDPContext *)v5 appleID];
    CFStringRef v8 = [(CDPContext *)v5 dsid];
    *(_DWORD *)buf = 141559042;
    uint64_t v38 = 1752392040;
    __int16 v39 = 2112;
    double v40 = *(double *)&v7;
    __int16 v41 = 2160;
    uint64_t v42 = 1752392040;
    __int16 v43 = 2112;
    v44 = v8;
    __int16 v45 = 2048;
    uint64_t v46 = [(CDPContext *)v5 type];
    _os_log_impl(&dword_2182AE000, v6, OS_LOG_TYPE_DEFAULT, "_registerCredentialsOnlyIfNeeded: appleID:%{mask.hash}@, dsid: %{mask.hash}@, type: %ld", buf, 0x34u);
  }
  uint64_t v9 = [(CDPContext *)v5 appleID];
  if (!v9) {
    goto LABEL_11;
  }
  id v10 = (void *)v9;
  uint64_t v11 = [(CDPContext *)v5 password];
  if (!v11)
  {

LABEL_11:
    char v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[CDPSOSCircleProxyImpl _registerCredentialsOnlyIfNeeded:]();
    }
    goto LABEL_13;
  }
  BOOL v12 = (void *)v11;
  BOOL v13 = [(CDPContext *)v5 dsid];

  if (!v13) {
    goto LABEL_11;
  }
  if (v3 && [(CDPSOSCircleProxyImpl *)self canAuthenticate])
  {
    char v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2182AE000, v14, OS_LOG_TYPE_DEFAULT, "Security indicated that no credential is needed nor did we force", buf, 2u);
    }
LABEL_13:

    char v15 = 0;
    goto LABEL_14;
  }
  id v17 = _CDPLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2182AE000, v17, OS_LOG_TYPE_DEFAULT, "Calling SOSCCSetUserCredentialsAndDSID", buf, 2u);
  }

  __int16 v18 = [(CDPContext *)v5 password];
  __int16 v19 = [v18 dataUsingEncoding:4];

  __int16 v20 = _CDPSignpostLogSystem();
  os_signpost_id_t v21 = _CDPSignpostCreate(v20);
  uint64_t v23 = v22;

  uint64_t v24 = _CDPSignpostLogSystem();
  int v25 = v24;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v21, "SetUserCredentialsAndDSID", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v26 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v38 = v21;
    _os_log_impl(&dword_2182AE000, v26, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SetUserCredentialsAndDSID  enableTelemetry=YES ", buf, 0xCu);
  }

  id v27 = [(CDPContext *)v5 appleID];
  uint64_t v28 = [(CDPContext *)v5 dsid];
  [v28 stringValue];
  char v15 = SOSCCSetUserCredentialsAndDSID();

  if ((v15 & 1) == 0)
  {
    uint64_t v29 = _CDPLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[CDPCircleProxyImpl _registerCredentialsOnlyIfNeeded:]();
    }
  }
  id v30 = 0;
  unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(v21, v23);
  v32 = _CDPSignpostLogSystem();
  v33 = v32;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    int v34 = [v30 code];
    *(_DWORD *)buf = 67240192;
    LODWORD(v38) = v34;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v33, OS_SIGNPOST_INTERVAL_END, v21, "SetUserCredentialsAndDSID", " Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 8u);
  }

  v35 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    int v36 = [v30 code];
    *(_DWORD *)buf = 134218496;
    uint64_t v38 = v21;
    __int16 v39 = 2048;
    double v40 = (double)Nanoseconds / 1000000000.0;
    __int16 v41 = 1026;
    LODWORD(v42) = v36;
    _os_log_impl(&dword_2182AE000, v35, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SetUserCredentialsAndDSID  Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 0x1Cu);
  }

LABEL_14:
  return v15;
}

- (BOOL)tryRegisteringCredentials
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  CFArrayRef v2 = self->_cdpContext;
  uint64_t v3 = [(CDPContext *)v2 appleID];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = [(CDPContext *)v2 dsid];
    if (v5)
    {
      id v6 = (void *)v5;
      char v7 = [(CDPContext *)v2 password];

      if (v7)
      {
        CFStringRef v8 = [(CDPContext *)v2 password];
        uint64_t v9 = [v8 dataUsingEncoding:4];

        id v10 = _CDPSignpostLogSystem();
        os_signpost_id_t v11 = _CDPSignpostCreate(v10);
        uint64_t v13 = v12;

        char v14 = _CDPSignpostLogSystem();
        char v15 = v14;
        if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_2182AE000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "TryUserCredentialsAndDSID", " enableTelemetry=YES ", buf, 2u);
        }

        objc_super v16 = _CDPSignpostLogSystem();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          os_signpost_id_t v32 = v11;
          _os_log_impl(&dword_2182AE000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: TryUserCredentialsAndDSID  enableTelemetry=YES ", buf, 0xCu);
        }

        id v17 = [(CDPContext *)v2 appleID];
        __int16 v18 = [(CDPContext *)v2 dsid];
        [v18 stringValue];
        char v19 = SOSCCTryUserCredentialsAndDSID();

        __int16 v20 = _CDPLogSystem();
        os_signpost_id_t v21 = v20;
        if (v19)
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2182AE000, v21, OS_LOG_TYPE_DEFAULT, "Registered credentials through try attempt", buf, 2u);
          }
        }
        else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          -[CDPCircleProxyImpl tryRegisteringCredentials]();
        }

        id v23 = 0;
        unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(v11, v13);
        int v25 = _CDPSignpostLogSystem();
        uint64_t v26 = v25;
        if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
        {
          int v27 = [v23 code];
          *(_DWORD *)buf = 67240192;
          LODWORD(v32) = v27;
          _os_signpost_emit_with_name_impl(&dword_2182AE000, v26, OS_SIGNPOST_INTERVAL_END, v11, "TryUserCredentialsAndDSID", " Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 8u);
        }

        uint64_t v28 = _CDPSignpostLogSystem();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          int v29 = [v23 code];
          *(_DWORD *)buf = 134218496;
          os_signpost_id_t v32 = v11;
          __int16 v33 = 2048;
          double v34 = (double)Nanoseconds / 1000000000.0;
          __int16 v35 = 1026;
          int v36 = v29;
          _os_log_impl(&dword_2182AE000, v28, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: TryUserCredentialsAndDSID  Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 0x1Cu);
        }

        goto LABEL_24;
      }
    }
    else
    {
    }
  }
  uint64_t v22 = _CDPLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    -[CDPSOSCircleProxyImpl tryRegisteringCredentials]();
  }

  char v19 = 0;
LABEL_24:

  return v19;
}

- (BOOL)canAuthenticate
{
  char v2 = SOSCCCanAuthenticate();
  if ((v2 & 1) == 0)
  {
    uint64_t v3 = _CDPLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[CDPCircleProxyImpl canAuthenticate]();
    }
  }
  return v2;
}

- (void)reportSuccess
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  char v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315394;
    uint64_t v4 = "-[CDPSOSCircleProxyImpl reportSuccess]";
    __int16 v5 = 1024;
    int v6 = 544;
    _os_log_impl(&dword_2182AE000, v2, OS_LOG_TYPE_DEFAULT, "%s (%d) called", (uint8_t *)&v3, 0x12u);
  }
}

- (void)reportFailure:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    __int16 v5 = "-[CDPSOSCircleProxyImpl reportFailure:]";
    __int16 v6 = 1024;
    int v7 = 550;
    _os_log_impl(&dword_2182AE000, v3, OS_LOG_TYPE_DEFAULT, "%s (%d) called", (uint8_t *)&v4, 0x12u);
  }
}

+ (unint64_t)syncingStatusForAltDSID:(id)a3
{
  id v3 = a3;
  int v4 = SOSCCFetchCompatibilityMode();
  __int16 v5 = +[CDPContext contextForAccountWithAltDSID:v3];

  if (v4)
  {
    __int16 v6 = [[CDPSOSCircleProxyImpl alloc] initWithContext:v5];
    id v11 = 0;
    unint64_t v7 = [(CDPSOSCircleProxyImpl *)v6 combinedCircleStatus:&v11];
    uint64_t v8 = v11;
    if (v8)
    {
      uint64_t v9 = _CDPLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[CDPSOSCircleProxyImpl syncingStatusForAltDSID:]();
      }
    }
  }
  else
  {
    uint64_t v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[CDPSOSCircleProxyImpl syncingStatusForAltDSID:]();
    }
    unint64_t v7 = 0;
  }

  return v7;
}

- (int64_t)cliqueStatus:(id *)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5004);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return -1;
}

- (BOOL)fetchUserControllableViewsSyncingEnabled:(id *)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5004);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (unint64_t)cachedCliqueStatus:(id *)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5004);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return -1;
}

- (id)generateVerifierWithRecoveryKey:(id)a3 error:(id *)a4
{
  if (a4)
  {
    objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5004);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)pairingChannelAcceptor
{
  return 0;
}

- (id)pairingChannelInitiator
{
  return 0;
}

- (void)recoverOctagonUsingCustodianInfo:(id)a3 completion:(id)a4
{
  if (a4)
  {
    __int16 v5 = (void *)MEMORY[0x263F087E8];
    id v6 = a4;
    objc_msgSend(v5, "cdp_errorWithCode:", -5004);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a4 + 2))(v6, v7);
  }
}

- (BOOL)registerCredentialsIfMissing
{
  return 0;
}

- (id)requestToResetProtectedData:(id *)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5004);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (CDPContext)cdpContext
{
  return self->_cdpContext;
}

- (void).cxx_destruct
{
}

- (void)initWithContext:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_2182AE000, v0, OS_LOG_TYPE_FAULT, "CDPSOSCircleProxyImpl init is missing required dsid. Barring no primary account, problems lie ahead…", v1, 2u);
}

- (void)peerId
{
  OUTLINED_FUNCTION_5_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to get peer ID: %@", v2, v3, v4, v5, v6);
}

- (void)peerCount
{
  OUTLINED_FUNCTION_5_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to get peer info from circle: %@", v2, v3, v4, v5, v6);
}

- (void)peerDeviceNamesByPeerID
{
  OUTLINED_FUNCTION_5_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to get peer info to find device names: %@", v2, v3, v4, v5, v6);
}

- (void)synchronizeCircleViews
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_2182AE000, v0, v1, "Skipping call to SOSCCWaitForInitialSync because circle status is not kSOSCCInCircle (%lu)", v2, v3, v4, v5, v6);
}

- (void)removeThisDeviceFromCircle:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to remove self from circle - %@", v2, v3, v4, v5, v6);
}

- (void)resetToOffering:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to reset to offering - %@", v2, v3, v4, v5, v6);
}

- (void)requestToResetCloudKitDataForReason:error:.cold.1()
{
  OUTLINED_FUNCTION_5_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to reset cloud data with error: %@", v2, v3, v4, v5, v6);
}

- (void)hasNonViewAwarePeers
{
  OUTLINED_FUNCTION_5_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to check for non-view-aware peers with error %@", v2, v3, v4, v5, v6);
}

- (void)removeNonViewAwarePeers:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_2182AE000, v0, v1, "Failed to check for non-view-aware peers before removing them from circle with error %@", v2, v3, v4, v5, v6);
}

- (void)removeNonViewAwarePeers:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_2182AE000, v0, v1, "Removed old peers from circle: %@", v2, v3, v4, v5, v6);
}

- (void)_registerCredentialsOnlyIfNeeded:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Skipping registering credentials, insufficient parameters", v2, v3, v4, v5, v6);
}

- (void)tryRegisteringCredentials
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Skipping try registering credentials, insufficient parameters", v2, v3, v4, v5, v6);
}

+ (void)syncingStatusForAltDSID:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "CDPDFollowUpController: Error fetching SOS Status: %@", v2, v3, v4, v5, v6);
}

+ (void)syncingStatusForAltDSID:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "CDPDFollowUpController: Cannot fetch sos status because SOS Compatibility mode is disabled", v2, v3, v4, v5, v6);
}

@end