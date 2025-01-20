@interface OTClique
+ (BOOL)clearCliqueFromAccount:(id)a3 error:(id *)a4;
+ (BOOL)isCloudServicesAvailable;
+ (BOOL)performCKServerUnreadableDataRemoval:(id)a3 error:(id *)a4;
+ (BOOL)platformSupportsSOS;
+ (BOOL)setCDPEnabled:(id)a3 error:(id *)a4;
+ (id)fetchEscrowRecordsInternal:(id)a3 error:(id *)a4;
+ (id)findOptimalBottleIDsWithContextData:(id)a3 error:(id *)a4;
+ (id)newFriendsWithContextData:(id)a3 error:(id *)a4;
+ (id)newFriendsWithContextData:(id)a3 resetReason:(int64_t)a4 error:(id *)a5;
+ (id)performEscrowRecoveryWithContextData:(id)a3 escrowArguments:(id)a4 error:(id *)a5;
+ (id)recoverWithContextData:(id)a3 bottleID:(id)a4 escrowedEntropy:(id)a5 error:(id *)a6;
+ (id)resetProtectedData:(id)a3 error:(id *)a4;
+ (id)resetProtectedData:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 error:(id *)a7;
+ (int64_t)getCDPStatus:(id)a3 error:(id *)a4;
+ (void)checkCustodianRecoveryKey:(id)a3 custodianRecoveryKeyUUID:(id)a4 reply:(id)a5;
+ (void)checkInheritanceKey:(id)a3 inheritanceKeyUUID:(id)a4 reply:(id)a5;
+ (void)createCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5;
+ (void)createInheritanceKey:(id)a3 uuid:(id)a4 claimTokenData:(id)a5 wrappingKeyData:(id)a6 reply:(id)a7;
+ (void)createInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5;
+ (void)generateInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5;
+ (void)preflightRecoverOctagonUsingCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5;
+ (void)preflightRecoverOctagonUsingInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5;
+ (void)recoverOctagonUsingCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5;
+ (void)recoverOctagonUsingInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5;
+ (void)recreateInheritanceKey:(id)a3 uuid:(id)a4 oldIK:(id)a5 reply:(id)a6;
+ (void)removeCustodianRecoveryKey:(id)a3 custodianRecoveryKeyUUID:(id)a4 reply:(id)a5;
+ (void)removeInheritanceKey:(id)a3 inheritanceKeyUUID:(id)a4 reply:(id)a5;
+ (void)setNewRecoveryKeyWithData:(id)a3 recoveryKey:(id)a4 reply:(id)a5;
+ (void)storeInheritanceKey:(id)a3 ik:(id)a4 reply:(id)a5;
- (BOOL)accountUserKeyAvailable;
- (BOOL)establish:(id *)a3;
- (BOOL)fetchUserControllableViewsSyncingEnabled:(id *)a3;
- (BOOL)joinAfterRestore:(id *)a3;
- (BOOL)leaveClique:(id *)a3;
- (BOOL)peersHaveViewsEnabled:(id)a3 error:(id *)a4;
- (BOOL)removeFriendsInClique:(id)a3 error:(id *)a4;
- (BOOL)requestToJoinCircle:(id *)a3;
- (BOOL)resetAndEstablish:(int64_t)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 accountSettings:(id)a7 isGuitarfish:(BOOL)a8 error:(id *)a9;
- (BOOL)setOctagonUserControllableViewsSyncEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)setUserCredentialsAndDSID:(id)a3 password:(id)a4 error:(id *)a5;
- (BOOL)setUserCredentialsWithLabel:(id)a3 password:(id)a4 dsid:(id)a5 error:(id *)a6;
- (BOOL)tryUserCredentialsAndDSID:(id)a3 password:(id)a4 error:(id *)a5;
- (BOOL)tryUserCredentialsWithLabel:(id)a3 password:(id)a4 dsid:(id)a5 error:(id *)a6;
- (BOOL)waitForInitialSync:(id *)a3;
- (BOOL)waitForOctagonUpgrade:(id *)a3;
- (NSString)cliqueMemberIdentifier;
- (OTClique)initWithContextData:(id)a3;
- (OTConfigurationContext)ctx;
- (id)cliqueMemberIdentifier:(id *)a3;
- (id)copyPeerPeerInfo:(id *)a3;
- (id)copyViewUnawarePeerInfo:(id *)a3;
- (id)description;
- (id)makeOTControl:(id *)a3;
- (id)peerDeviceNamesByPeerID:(id *)a3;
- (id)setupPairingChannelAsAcceptor:(id)a3;
- (id)setupPairingChannelAsAcceptor:(id)a3 error:(id *)a4;
- (id)setupPairingChannelAsInitator:(id)a3 error:(id *)a4;
- (id)setupPairingChannelAsInitiator:(id)a3;
- (int64_t)_fetchCliqueStatus:(id)a3 error:(id *)a4;
- (int64_t)cachedCliqueStatus:(BOOL)a3 error:(id *)a4;
- (int64_t)fetchCliqueStatus:(id *)a3;
- (void)fetchEscrowContents:(id)a3;
- (void)fetchUserControllableViewsSyncingEnabledAsync:(id)a3;
- (void)performedCDPStateMachineRun:(id)a3 success:(BOOL)a4 error:(id)a5 reply:(id)a6;
- (void)performedFailureCDPStateMachineRun:(id)a3 error:(id)a4 reply:(id)a5;
- (void)performedSuccessfulCDPStateMachineRun:(id)a3 reply:(id)a4;
- (void)setCliqueMemberIdentifier:(id)a3;
@end

@implementation OTClique

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ctx, 0);

  objc_storeStrong((id *)&self->_cliqueMemberIdentifier, 0);
}

- (OTConfigurationContext)ctx
{
  return self->_ctx;
}

- (void)setCliqueMemberIdentifier:(id)a3
{
}

- (void)performedSuccessfulCDPStateMachineRun:(id)a3 reply:(id)a4
{
}

- (void)performedFailureCDPStateMachineRun:(id)a3 error:(id)a4 reply:(id)a5
{
}

- (BOOL)waitForOctagonUpgrade:(id *)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v5 = _OctagonSignpostLogSystem();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  uint64_t v7 = mach_continuous_time();

  v8 = _OctagonSignpostLogSystem();
  v9 = v8;
  unint64_t v10 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v6, "WaitForOctagonUpgrade", " enableTelemetry=YES ", buf, 2u);
  }

  v11 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v6;
    _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: WaitForOctagonUpgrade  enableTelemetry=YES ", buf, 0xCu);
  }

  id v35 = 0;
  v12 = [(OTClique *)self makeOTControl:&v35];
  id v13 = v35;
  if (v12)
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v43 = __Block_byref_object_copy__5170;
    v44 = __Block_byref_object_dispose__5171;
    id v45 = 0;
    v14 = [OTControlArguments alloc];
    v15 = [(OTClique *)self ctx];
    v16 = [(OTControlArguments *)v14 initWithConfiguration:v15];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __34__OTClique_waitForOctagonUpgrade___block_invoke;
    v30[3] = &unk_1E54778D0;
    v30[4] = buf;
    v30[5] = &v31;
    [v12 waitForOctagonUpgrade:v16 reply:v30];

    if (a3)
    {
      v17 = *(void **)(*(void *)&buf[8] + 40);
      if (v17) {
        *a3 = v17;
      }
    }
    int v18 = *((unsigned __int8 *)v32 + 24);
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v6, v7);
    v20 = _OctagonSignpostLogSystem();
    v21 = v20;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_DWORD *)v36 = 67240192;
      LODWORD(v37) = v18;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v21, OS_SIGNPOST_INTERVAL_END, v6, "WaitForOctagonUpgrade", " OctagonSignpostNameWaitForOctagonUpgrade=%{public,signpost.telemetry:number1,name=OctagonSignpostNameWaitForOctagonUpgrade}d ", v36, 8u);
    }

    v22 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v36 = 134218496;
      os_signpost_id_t v37 = v6;
      __int16 v38 = 2048;
      double v39 = (double)Nanoseconds / 1000000000.0;
      __int16 v40 = 1026;
      int v41 = v18;
      _os_log_impl(&dword_18B299000, v22, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: WaitForOctagonUpgrade  OctagonSignpostNameWaitForOctagonUpgrade=%{public,signpost.telemetry:number1,name=OctagonSignpostNameWaitForOctagonUpgrade}d ", v36, 0x1Cu);
    }

    BOOL v23 = *((unsigned char *)v32 + 24) != 0;
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    v24 = secLogObjForScope("clique-waitforoctagonupgrade");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v13;
      _os_log_impl(&dword_18B299000, v24, OS_LOG_TYPE_DEFAULT, "octagon, failed to fetch OTControl object: %@", buf, 0xCu);
    }

    if (a3) {
      *a3 = v13;
    }
    unint64_t v25 = _OctagonSignpostGetNanoseconds(v6, v7);
    v26 = _OctagonSignpostLogSystem();
    v27 = v26;
    if (v10 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v26))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&buf[4] = 0;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v27, OS_SIGNPOST_INTERVAL_END, v6, "WaitForOctagonUpgrade", " OctagonSignpostNameWaitForOctagonUpgrade=%{public,signpost.telemetry:number1,name=OctagonSignpostNameWaitForOctagonUpgrade}d ", buf, 8u);
    }

    v28 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(void *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)v25 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v43) = 0;
      _os_log_impl(&dword_18B299000, v28, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: WaitForOctagonUpgrade  OctagonSignpostNameWaitForOctagonUpgrade=%{public,signpost.telemetry:number1,name=OctagonSignpostNameWaitForOctagonUpgrade}d ", buf, 0x1Cu);
    }

    BOOL v23 = 0;
  }

  return v23;
}

void __34__OTClique_waitForOctagonUpgrade___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = secLogObjForScope("clique-waitforoctagonupgrade");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "error from control: %@", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = v3;
    char v8 = 0;
    v4 = *(NSObject **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else
  {
    if (v5)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "successfully upgraded to octagon", (uint8_t *)&v9, 2u);
    }
    char v8 = 1;
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
}

- (void)performedCDPStateMachineRun:(id)a3 success:(BOOL)a4 error:(id)a5 reply:(id)a6
{
  BOOL v8 = a4;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = _OctagonSignpostLogSystem();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  uint64_t v14 = mach_continuous_time();

  v15 = _OctagonSignpostLogSystem();
  v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PerformedCDPStateMachineRun", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  v17 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_18B299000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PerformedCDPStateMachineRun  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v47 = 0x2020000000;
  char v48 = 0;
  id v39 = 0;
  int v18 = [(OTClique *)self makeOTControl:&v39];
  id v19 = v39;
  if (v18)
  {
    v20 = [OTControlArguments alloc];
    v21 = [(OTClique *)self ctx];
    v22 = [(OTControlArguments *)v20 initWithConfiguration:v21];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __60__OTClique_performedCDPStateMachineRun_success_error_reply___block_invoke;
    v31[3] = &unk_1E5477B28;
    os_signpost_id_t v36 = v13;
    uint64_t v37 = v14;
    id v32 = v30;
    p_long long buf = &buf;
    id v34 = v11;
    BOOL v38 = v8;
    id v33 = v10;
    [v18 postCDPFollowupResult:v22 success:v8 type:v32 error:v33 reply:v31];
  }
  else
  {
    BOOL v23 = secLogObjForScope("clique-cdp-sm");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v40 = 138412290;
      os_signpost_id_t v41 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_18B299000, v23, OS_LOG_TYPE_DEFAULT, "octagon, failed to fetch OTControl object: %@", v40, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    unint64_t v25 = _OctagonSignpostLogSystem();
    v26 = v25;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      int v27 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      *(_DWORD *)__int16 v40 = 67240192;
      LODWORD(v41) = v27;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v26, OS_SIGNPOST_INTERVAL_END, v13, "PerformedCDPStateMachineRun", " OctagonSignpostNamePerformedCDPStateMachineRun=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformedCDPStateMachineRun}d ", v40, 8u);
    }

    v28 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v40 = 134218496;
      int v29 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      os_signpost_id_t v41 = v13;
      __int16 v42 = 2048;
      double v43 = (double)Nanoseconds / 1000000000.0;
      __int16 v44 = 1026;
      int v45 = v29;
      _os_log_impl(&dword_18B299000, v28, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformedCDPStateMachineRun  OctagonSignpostNamePerformedCDPStateMachineRun=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformedCDPStateMachineRun}d ", v40, 0x1Cu);
    }

    (*((void (**)(id, id))v11 + 2))(v11, v19);
  }

  _Block_object_dispose(&buf, 8);
}

void __60__OTClique_performedCDPStateMachineRun_success_error_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  double v3 = COERCE_DOUBLE(a2);
  if (v3 != 0.0)
  {
    v4 = secLogObjForScope("clique-cdp-sm");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v28 = 138412546;
      uint64_t v29 = v5;
      __int16 v30 = 2112;
      double v31 = v3;
      _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "failed to post %@ result: %@ ", (uint8_t *)&v28, 0x16u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(*(void *)(a1 + 64), *(void *)(a1 + 72));
    id v7 = _OctagonSignpostLogSystem();
    BOOL v8 = v7;
    os_signpost_id_t v9 = *(void *)(a1 + 64);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v10 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      int v28 = 67240192;
      LODWORD(v29) = v10;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PerformedCDPStateMachineRun", " OctagonSignpostNamePerformedCDPStateMachineRun=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformedCDPStateMachineRun}d ", (uint8_t *)&v28, 8u);
    }

    id v11 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 134218496;
      int v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      uint64_t v29 = *(void *)(a1 + 64);
      __int16 v30 = 2048;
      double v31 = (double)Nanoseconds / 1000000000.0;
      __int16 v32 = 1026;
      int v33 = v12;
      _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformedCDPStateMachineRun  OctagonSignpostNamePerformedCDPStateMachineRun=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformedCDPStateMachineRun}d ", (uint8_t *)&v28, 0x1Cu);
    }
    goto LABEL_21;
  }
  int v13 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v14 = secLogObjForScope("clique-cdp-sm");
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (!v15) {
      goto LABEL_16;
    }
    uint64_t v16 = *(void *)(a1 + 32);
    int v28 = 138412290;
    uint64_t v29 = v16;
    v17 = "posted success: %@";
    int v18 = v14;
    uint32_t v19 = 12;
  }
  else
  {
    if (!v15) {
      goto LABEL_16;
    }
    uint64_t v20 = *(void *)(a1 + 32);
    double v21 = *(double *)(a1 + 40);
    int v28 = 138412546;
    uint64_t v29 = v20;
    __int16 v30 = 2112;
    double v31 = v21;
    v17 = "posted error: %@:  %@";
    int v18 = v14;
    uint32_t v19 = 22;
  }
  _os_log_impl(&dword_18B299000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v28, v19);
LABEL_16:

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned char *)(a1 + 80);
  unint64_t v22 = _OctagonSignpostGetNanoseconds(*(void *)(a1 + 64), *(void *)(a1 + 72));
  BOOL v23 = _OctagonSignpostLogSystem();
  v24 = v23;
  os_signpost_id_t v25 = *(void *)(a1 + 64);
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    int v26 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    int v28 = 67240192;
    LODWORD(v29) = v26;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v24, OS_SIGNPOST_INTERVAL_END, v25, "PerformedCDPStateMachineRun", " OctagonSignpostNamePerformedCDPStateMachineRun=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformedCDPStateMachineRun}d ", (uint8_t *)&v28, 8u);
  }

  id v11 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 134218496;
    int v27 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v29 = *(void *)(a1 + 64);
    __int16 v30 = 2048;
    double v31 = (double)v22 / 1000000000.0;
    __int16 v32 = 1026;
    int v33 = v27;
    _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformedCDPStateMachineRun  OctagonSignpostNamePerformedCDPStateMachineRun=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformedCDPStateMachineRun}d ", (uint8_t *)&v28, 0x1Cu);
  }
LABEL_21:

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)fetchEscrowContents:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = secLogObjForScope("clique-fetchescrow");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(OTClique *)self ctx];
    id v7 = [v6 context];
    BOOL v8 = [(OTClique *)self ctx];
    os_signpost_id_t v9 = [v8 altDSID];
    *(_DWORD *)long long buf = 138412546;
    *(void *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, "fetching entropy for bottling for context:%@, altdsid:%@", buf, 0x16u);
  }
  int v10 = _OctagonSignpostLogSystem();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  uint64_t v12 = mach_continuous_time();

  int v13 = _OctagonSignpostLogSystem();
  uint64_t v14 = v13;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "FetchEscrowContents", " enableTelemetry=YES ", buf, 2u);
  }

  BOOL v15 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)&buf[4] = v11;
    _os_log_impl(&dword_18B299000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchEscrowContents  enableTelemetry=YES ", buf, 0xCu);
  }

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v40 = 0;
  id v32 = 0;
  uint64_t v16 = [(OTClique *)self makeOTControl:&v32];
  id v17 = v32;
  if (v16)
  {
    int v18 = [OTControlArguments alloc];
    uint32_t v19 = [(OTClique *)self ctx];
    uint64_t v20 = [(OTControlArguments *)v18 initWithConfiguration:v19];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __32__OTClique_fetchEscrowContents___block_invoke;
    v27[3] = &unk_1E5477A38;
    uint64_t v29 = buf;
    os_signpost_id_t v30 = v11;
    uint64_t v31 = v12;
    id v28 = v4;
    [v16 fetchEscrowContents:v20 reply:v27];
  }
  else
  {
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
    unint64_t v22 = _OctagonSignpostLogSystem();
    BOOL v23 = v22;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      int v24 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
      *(_DWORD *)int v33 = 67240192;
      LODWORD(v34) = v24;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v23, OS_SIGNPOST_INTERVAL_END, v11, "FetchEscrowContents", " OctagonSignpostNameFetchEscrowContents=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEscrowContents}d ", v33, 8u);
    }

    os_signpost_id_t v25 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v33 = 134218496;
      int v26 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
      os_signpost_id_t v34 = v11;
      __int16 v35 = 2048;
      double v36 = (double)Nanoseconds / 1000000000.0;
      __int16 v37 = 1026;
      int v38 = v26;
      _os_log_impl(&dword_18B299000, v25, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchEscrowContents  OctagonSignpostNameFetchEscrowContents=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEscrowContents}d ", v33, 0x1Cu);
    }

    (*((void (**)(id, void, void, void, id))v4 + 2))(v4, 0, 0, 0, v17);
  }

  _Block_object_dispose(buf, 8);
}

void __32__OTClique_fetchEscrowContents___block_invoke(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = secLogObjForScope("clique-fetchescrow");
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      int v25 = 138412290;
      id v26 = v12;
      BOOL v15 = "fetchEscrowContents errored: %@";
      uint64_t v16 = v13;
      uint32_t v17 = 12;
LABEL_6:
      _os_log_impl(&dword_18B299000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v25, v17);
    }
  }
  else if (v14)
  {
    LOWORD(v25) = 0;
    BOOL v15 = "fetchEscrowContents succeeded";
    uint64_t v16 = v13;
    uint32_t v17 = 2;
    goto LABEL_6;
  }

  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v12 == 0;
  unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
  uint32_t v19 = _OctagonSignpostLogSystem();
  uint64_t v20 = v19;
  os_signpost_id_t v21 = a1[6];
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    int v22 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
    int v25 = 67240192;
    LODWORD(v26) = v22;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v20, OS_SIGNPOST_INTERVAL_END, v21, "FetchEscrowContents", " OctagonSignpostNameFetchEscrowContents=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEscrowContents}d ", (uint8_t *)&v25, 8u);
  }

  BOOL v23 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 134218496;
    int v24 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
    id v26 = (id)a1[6];
    __int16 v27 = 2048;
    double v28 = (double)Nanoseconds / 1000000000.0;
    __int16 v29 = 1026;
    int v30 = v24;
    _os_log_impl(&dword_18B299000, v23, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchEscrowContents  OctagonSignpostNameFetchEscrowContents=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEscrowContents}d ", (uint8_t *)&v25, 0x1Cu);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

- (BOOL)accountUserKeyAvailable
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  double v3 = secLogObjForScope("clique-legacy");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(OTClique *)self ctx];
    uint64_t v5 = [v4 context];
    uint64_t v6 = [(OTClique *)self ctx];
    id v7 = [v6 altDSID];
    int v26 = 138412546;
    os_signpost_id_t v27 = (os_signpost_id_t)v5;
    __int16 v28 = 2112;
    double v29 = *(double *)&v7;
    _os_log_impl(&dword_18B299000, v3, OS_LOG_TYPE_DEFAULT, "accountUserKeyAvailable for context:%@, altdsid:%@", (uint8_t *)&v26, 0x16u);
  }
  BOOL v8 = _OctagonSignpostLogSystem();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  uint64_t v10 = mach_continuous_time();

  id v11 = _OctagonSignpostLogSystem();
  id v12 = v11;
  unint64_t v13 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v9, "AccountUserKeyAvailable", " enableTelemetry=YES ", (uint8_t *)&v26, 2u);
  }

  BOOL v14 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 134217984;
    os_signpost_id_t v27 = v9;
    _os_log_impl(&dword_18B299000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: AccountUserKeyAvailable  enableTelemetry=YES ", (uint8_t *)&v26, 0xCu);
  }

  if (+[OTClique platformSupportsSOS])
  {
    int v15 = SOSCCCanAuthenticate(0);
    if ((v15 & 1) == 0)
    {
      uint64_t v16 = secLogObjForScope("clique-legacy");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_18B299000, v16, OS_LOG_TYPE_DEFAULT, "Security requires credentials...", (uint8_t *)&v26, 2u);
      }
    }
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v9, v10);
    int v18 = _OctagonSignpostLogSystem();
    uint32_t v19 = v18;
    if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      int v26 = 67240192;
      LODWORD(v27) = v15;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v19, OS_SIGNPOST_INTERVAL_END, v9, "AccountUserKeyAvailable", " OctagonSignpostNameAccountUserKeyAvailable=%{public,signpost.telemetry:number1,name=OctagonSignpostNameAccountUserKeyAvailable}d ", (uint8_t *)&v26, 8u);
    }

    uint64_t v20 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 134218496;
      os_signpost_id_t v27 = v9;
      __int16 v28 = 2048;
      double v29 = (double)Nanoseconds / 1000000000.0;
      __int16 v30 = 1026;
      int v31 = v15;
      _os_log_impl(&dword_18B299000, v20, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: AccountUserKeyAvailable  OctagonSignpostNameAccountUserKeyAvailable=%{public,signpost.telemetry:number1,name=OctagonSignpostNameAccountUserKeyAvailable}d ", (uint8_t *)&v26, 0x1Cu);
    }
  }
  else
  {
    os_signpost_id_t v21 = secLogObjForScope("clique-legacy");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_18B299000, v21, OS_LOG_TYPE_DEFAULT, "SOS disabled for this platform, returning NO", (uint8_t *)&v26, 2u);
    }

    unint64_t v22 = _OctagonSignpostGetNanoseconds(v9, v10);
    BOOL v23 = _OctagonSignpostLogSystem();
    int v24 = v23;
    if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      int v26 = 67240192;
      LODWORD(v27) = 0;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v24, OS_SIGNPOST_INTERVAL_END, v9, "AccountUserKeyAvailable", " OctagonSignpostNameAccountUserKeyAvailable=%{public,signpost.telemetry:number1,name=OctagonSignpostNameAccountUserKeyAvailable}d ", (uint8_t *)&v26, 8u);
    }

    uint64_t v20 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 134218496;
      os_signpost_id_t v27 = v9;
      __int16 v28 = 2048;
      double v29 = (double)v22 / 1000000000.0;
      __int16 v30 = 1026;
      int v31 = 0;
      _os_log_impl(&dword_18B299000, v20, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: AccountUserKeyAvailable  OctagonSignpostNameAccountUserKeyAvailable=%{public,signpost.telemetry:number1,name=OctagonSignpostNameAccountUserKeyAvailable}d ", (uint8_t *)&v26, 0x1Cu);
    }
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (BOOL)requestToJoinCircle:(id *)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _OctagonSignpostLogSystem();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  uint64_t v7 = mach_continuous_time();

  BOOL v8 = _OctagonSignpostLogSystem();
  os_signpost_id_t v9 = v8;
  unint64_t v10 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v6, "RequestToJoinCircle", " enableTelemetry=YES ", buf, 2u);
  }

  id v11 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)char v48 = v6;
    _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RequestToJoinCircle  enableTelemetry=YES ", buf, 0xCu);
  }

  id v12 = secLogObjForScope("clique-legacy");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v13 = [(OTClique *)self ctx];
    BOOL v14 = [v13 context];
    int v15 = [(OTClique *)self ctx];
    uint64_t v16 = [v15 altDSID];
    *(_DWORD *)long long buf = 138412546;
    *(void *)char v48 = v14;
    *(_WORD *)&v48[8] = 2112;
    *(void *)&v48[10] = v16;
    _os_log_impl(&dword_18B299000, v12, OS_LOG_TYPE_DEFAULT, "requestToJoinCircle for context:%@, altdsid:%@", buf, 0x16u);
  }
  id v46 = 0;
  int64_t v17 = [(OTClique *)self fetchCliqueStatus:&v46];
  int v18 = v46;
  if (v18)
  {
    uint32_t v19 = v18;
    uint64_t v20 = secLogObjForScope("clique-legacy");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)char v48 = v19;
      _os_log_impl(&dword_18B299000, v20, OS_LOG_TYPE_DEFAULT, "fetching clique status failed: %@", buf, 0xCu);
    }

    if (a3) {
      *a3 = v19;
    }
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v6, v7);
    unint64_t v22 = _OctagonSignpostLogSystem();
    BOOL v23 = v22;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)char v48 = 0;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v23, OS_SIGNPOST_INTERVAL_END, v6, "RequestToJoinCircle", " OctagonSignpostNameRequestToJoinCircle=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRequestToJoinCircle}d ", buf, 8u);
    }

    int v24 = _OctagonSignpostLogSystem();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  os_signpost_id_t v27 = secLogObjForScope("clique-legacy");
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
  if (v17 != 3)
  {
    if (!v28) {
      goto LABEL_39;
    }
    if ((unint64_t)(v17 + 1) > 5) {
      uint64_t v32 = @"CliqueStatusIn";
    }
    else {
      uint64_t v32 = off_1E5477BD0[v17 + 1];
    }
    *(_DWORD *)long long buf = 138412290;
    *(void *)char v48 = v32;
    int v33 = "clique status is %@; performing no Octagon actions";
    os_signpost_id_t v34 = v27;
    uint32_t v35 = 12;
    goto LABEL_38;
  }
  if (v28)
  {
    *(_DWORD *)long long buf = 138412290;
    *(void *)char v48 = @"CliqueStatusAbsent";
    _os_log_impl(&dword_18B299000, v27, OS_LOG_TYPE_DEFAULT, "clique status is %@; beginning an establish", buf, 0xCu);
  }

  id v45 = 0;
  [(OTClique *)self establish:&v45];
  double v29 = v45;
  if (v29)
  {
    uint32_t v19 = v29;
    if (a3) {
      *a3 = v29;
    }
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v6, v7);
    __int16 v30 = _OctagonSignpostLogSystem();
    int v31 = v30;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)char v48 = 0;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v31, OS_SIGNPOST_INTERVAL_END, v6, "RequestToJoinCircle", " OctagonSignpostNameRequestToJoinCircle=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRequestToJoinCircle}d ", buf, 8u);
    }

    int v24 = _OctagonSignpostLogSystem();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
LABEL_17:
    *(_DWORD *)long long buf = 134218496;
    *(void *)char v48 = v6;
    *(_WORD *)&v48[8] = 2048;
    *(double *)&v48[10] = (double)Nanoseconds / 1000000000.0;
    __int16 v49 = 1026;
    int v50 = 0;
    _os_log_impl(&dword_18B299000, v24, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RequestToJoinCircle  OctagonSignpostNameRequestToJoinCircle=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRequestToJoinCircle}d ", buf, 0x1Cu);
LABEL_18:

    LOBYTE(v25) = 0;
    goto LABEL_19;
  }
  os_signpost_id_t v27 = secLogObjForScope("clique-legacy");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    int v33 = "establish succeeded";
    os_signpost_id_t v34 = v27;
    uint32_t v35 = 2;
LABEL_38:
    _os_log_impl(&dword_18B299000, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
  }
LABEL_39:

  if (+[OTClique platformSupportsSOS])
  {
    if (+[OTClique platformSupportsSOS])
    {
      id v44 = 0;
      int v25 = SOSCCRequestToJoinCircle((CFTypeRef *)&v44);
      double v36 = secLogObjForScope("clique-legacy");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 67109378;
        *(_DWORD *)char v48 = v25;
        *(_WORD *)&v48[4] = 2112;
        *(void *)&v48[6] = v44;
        _os_log_impl(&dword_18B299000, v36, OS_LOG_TYPE_DEFAULT, "sos requestToJoinCircle complete: %d %@", buf, 0x12u);
      }

      if (a3) {
        *a3 = v44;
      }
      else {
    }
      }
    else
    {
      int v25 = 0;
    }
    unint64_t v41 = _OctagonSignpostGetNanoseconds(v6, v7);
    __int16 v42 = _OctagonSignpostLogSystem();
    double v43 = v42;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
    {
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)char v48 = v25;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v43, OS_SIGNPOST_INTERVAL_END, v6, "RequestToJoinCircle", " OctagonSignpostNameRequestToJoinCircle=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRequestToJoinCircle}d ", buf, 8u);
    }

    uint32_t v19 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)char v48 = v6;
      *(_WORD *)&v48[8] = 2048;
      *(double *)&v48[10] = (double)v41 / 1000000000.0;
      __int16 v49 = 1026;
      int v50 = v25;
      goto LABEL_59;
    }
  }
  else
  {
    __int16 v37 = secLogObjForScope("clique-legacy");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18B299000, v37, OS_LOG_TYPE_DEFAULT, "requestToJoinCircle platform does not support SOS", buf, 2u);
    }

    unint64_t v38 = _OctagonSignpostGetNanoseconds(v6, v7);
    id v39 = _OctagonSignpostLogSystem();
    char v40 = v39;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
    {
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)char v48 = 1;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v40, OS_SIGNPOST_INTERVAL_END, v6, "RequestToJoinCircle", " OctagonSignpostNameRequestToJoinCircle=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRequestToJoinCircle}d ", buf, 8u);
    }

    uint32_t v19 = _OctagonSignpostLogSystem();
    LOBYTE(v25) = 1;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)char v48 = v6;
      *(_WORD *)&v48[8] = 2048;
      *(double *)&v48[10] = (double)v38 / 1000000000.0;
      __int16 v49 = 1026;
      int v50 = 1;
LABEL_59:
      _os_log_impl(&dword_18B299000, v19, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RequestToJoinCircle  OctagonSignpostNameRequestToJoinCircle=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRequestToJoinCircle}d ", buf, 0x1Cu);
    }
  }
LABEL_19:

  return v25;
}

- (BOOL)peersHaveViewsEnabled:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = secLogObjForScope("clique-legacy");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = [(OTClique *)self ctx];
    os_signpost_id_t v9 = [v8 context];
    unint64_t v10 = [(OTClique *)self ctx];
    id v11 = [v10 altDSID];
    *(_DWORD *)long long buf = 138412546;
    *(void *)id v39 = v9;
    *(_WORD *)&v39[8] = 2112;
    *(void *)&v39[10] = v11;
    _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, "peersHaveViewsEnabled for context:%@, altdsid:%@", buf, 0x16u);
  }
  id v12 = _OctagonSignpostLogSystem();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  uint64_t v14 = mach_continuous_time();

  int v15 = _OctagonSignpostLogSystem();
  uint64_t v16 = v15;
  unint64_t v17 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PeersHaveViewsEnabled", " enableTelemetry=YES ", buf, 2u);
  }

  int v18 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)id v39 = v13;
    _os_log_impl(&dword_18B299000, v18, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PeersHaveViewsEnabled  enableTelemetry=YES ", buf, 0xCu);
  }

  if (+[OTClique platformSupportsSOS])
  {
    id v35 = 0;
    CFBooleanRef HaveViewsEnabled = (const __CFBoolean *)SOSCCPeersHaveViewsEnabled((uint64_t)v6, (CFTypeRef *)&v35);
    if (HaveViewsEnabled) {
      BOOL v20 = CFBooleanGetValue(HaveViewsEnabled) != 0;
    }
    else {
      BOOL v20 = 0;
    }
    double v29 = secLogObjForScope("clique-legacy");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109378;
      *(_DWORD *)id v39 = v20;
      *(_WORD *)&v39[4] = 2112;
      *(void *)&v39[6] = v35;
      _os_log_impl(&dword_18B299000, v29, OS_LOG_TYPE_DEFAULT, "peersHaveViewsEnabled results: %{BOOL}d (%@)", buf, 0x12u);
    }

    if (a4) {
      *a4 = v35;
    }
    else {

    }
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    int v31 = _OctagonSignpostLogSystem();
    uint64_t v32 = v31;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)id v39 = v20;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v32, OS_SIGNPOST_INTERVAL_END, v13, "PeersHaveViewsEnabled", " OctagonSignpostNamePeersHaveViewsEnabled=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePeersHaveViewsEnabled}d ", buf, 8u);
    }

    int v33 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)id v39 = v13;
      *(_WORD *)&v39[8] = 2048;
      *(double *)&v39[10] = (double)Nanoseconds / 1000000000.0;
      __int16 v40 = 1026;
      BOOL v41 = v20;
      _os_log_impl(&dword_18B299000, v33, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PeersHaveViewsEnabled  OctagonSignpostNamePeersHaveViewsEnabled=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePeersHaveViewsEnabled}d ", buf, 0x1Cu);
    }
  }
  else
  {
    os_signpost_id_t v21 = secLogObjForScope("clique-legacy");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18B299000, v21, OS_LOG_TYPE_DEFAULT, "SOS disabled for this platform, returning NO", buf, 2u);
    }

    if (a4)
    {
      unint64_t v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F28760];
      uint64_t v36 = *MEMORY[0x1E4F28568];
      __int16 v37 = @"peers have views enabled unimplemented";
      int v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      *a4 = [v22 errorWithDomain:v23 code:-4 userInfo:v24];
    }
    unint64_t v25 = _OctagonSignpostGetNanoseconds(v13, v14);
    int v26 = _OctagonSignpostLogSystem();
    os_signpost_id_t v27 = v26;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)id v39 = 0;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v27, OS_SIGNPOST_INTERVAL_END, v13, "PeersHaveViewsEnabled", " OctagonSignpostNamePeersHaveViewsEnabled=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePeersHaveViewsEnabled}d ", buf, 8u);
    }

    BOOL v28 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)id v39 = v13;
      *(_WORD *)&v39[8] = 2048;
      *(double *)&v39[10] = (double)v25 / 1000000000.0;
      __int16 v40 = 1026;
      BOOL v41 = 0;
      _os_log_impl(&dword_18B299000, v28, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PeersHaveViewsEnabled  OctagonSignpostNamePeersHaveViewsEnabled=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePeersHaveViewsEnabled}d ", buf, 0x1Cu);
    }

    LOBYTE(v20) = 0;
  }

  return v20;
}

- (id)copyPeerPeerInfo:(id *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = secLogObjForScope("clique-legacy");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(OTClique *)self ctx];
    uint64_t v7 = [v6 context];
    BOOL v8 = [(OTClique *)self ctx];
    os_signpost_id_t v9 = [v8 altDSID];
    *(_DWORD *)long long buf = 138412546;
    os_signpost_id_t v36 = (os_signpost_id_t)v7;
    __int16 v37 = 2112;
    double v38 = *(double *)&v9;
    _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, "copyPeerPeerInfo for context:%@, altdsid:%@", buf, 0x16u);
  }
  unint64_t v10 = _OctagonSignpostLogSystem();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  uint64_t v12 = mach_continuous_time();

  os_signpost_id_t v13 = _OctagonSignpostLogSystem();
  uint64_t v14 = v13;
  unint64_t v15 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CopyPeerPeerInfo", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v16 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    os_signpost_id_t v36 = v11;
    _os_log_impl(&dword_18B299000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CopyPeerPeerInfo  enableTelemetry=YES ", buf, 0xCu);
  }

  if (+[OTClique platformSupportsSOS])
  {
    id v32 = 0;
    unint64_t v17 = (void *)SOSCCCopyPeerPeerInfo((CFTypeRef *)&v32);
    int v18 = secLogObjForScope("clique-legacy");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      os_signpost_id_t v36 = (os_signpost_id_t)v17;
      __int16 v37 = 2112;
      double v38 = *(double *)&v32;
      _os_log_impl(&dword_18B299000, v18, OS_LOG_TYPE_DEFAULT, "copyPeerPeerInfo results: %@ (%@)", buf, 0x16u);
    }

    if (a3) {
      *a3 = v32;
    }
    else {

    }
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
    BOOL v28 = _OctagonSignpostLogSystem();
    double v29 = v28;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_DWORD *)long long buf = 67240192;
      LODWORD(v36) = v17 != 0;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v29, OS_SIGNPOST_INTERVAL_END, v11, "CopyPeerPeerInfo", " OctagonSignpostNameCopyPeerPeerInfo=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCopyPeerPeerInfo}d ", buf, 8u);
    }

    __int16 v30 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      os_signpost_id_t v36 = v11;
      __int16 v37 = 2048;
      double v38 = (double)Nanoseconds / 1000000000.0;
      __int16 v39 = 1026;
      BOOL v40 = v17 != 0;
      _os_log_impl(&dword_18B299000, v30, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CopyPeerPeerInfo  OctagonSignpostNameCopyPeerPeerInfo=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCopyPeerPeerInfo}d ", buf, 0x1Cu);
    }
  }
  else
  {
    uint32_t v19 = secLogObjForScope("clique-legacy");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18B299000, v19, OS_LOG_TYPE_DEFAULT, "SOS disabled for this platform, returning NO", buf, 2u);
    }

    if (a3)
    {
      BOOL v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F28760];
      uint64_t v33 = *MEMORY[0x1E4F28568];
      os_signpost_id_t v34 = @"copy peer peer info unimplemented";
      unint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      *a3 = [v20 errorWithDomain:v21 code:-4 userInfo:v22];
    }
    unint64_t v23 = _OctagonSignpostGetNanoseconds(v11, v12);
    int v24 = _OctagonSignpostLogSystem();
    unint64_t v25 = v24;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_DWORD *)long long buf = 67240192;
      LODWORD(v36) = 0;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v25, OS_SIGNPOST_INTERVAL_END, v11, "CopyPeerPeerInfo", " OctagonSignpostNameCopyPeerPeerInfo=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCopyPeerPeerInfo}d ", buf, 8u);
    }

    int v26 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      os_signpost_id_t v36 = v11;
      __int16 v37 = 2048;
      double v38 = (double)v23 / 1000000000.0;
      __int16 v39 = 1026;
      BOOL v40 = 0;
      _os_log_impl(&dword_18B299000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CopyPeerPeerInfo  OctagonSignpostNameCopyPeerPeerInfo=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCopyPeerPeerInfo}d ", buf, 0x1Cu);
    }

    return 0;
  }
  return v17;
}

- (BOOL)tryUserCredentialsAndDSID:(id)a3 password:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  unint64_t v10 = [(OTClique *)self ctx];
  os_signpost_id_t v11 = [v10 dsid];
  LOBYTE(a5) = [(OTClique *)self tryUserCredentialsWithLabel:v9 password:v8 dsid:v11 error:a5];

  return (char)a5;
}

- (BOOL)tryUserCredentialsWithLabel:(id)a3 password:(id)a4 dsid:(id)a5 error:(id *)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (__CFString *)a5;
  os_signpost_id_t v13 = secLogObjForScope("clique-legacy");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [(OTClique *)self ctx];
    unint64_t v15 = [v14 context];
    uint64_t v16 = [(OTClique *)self ctx];
    unint64_t v17 = [v16 altDSID];
    *(_DWORD *)long long buf = 138412546;
    *(void *)id v44 = v15;
    *(_WORD *)&v44[8] = 2112;
    *(void *)&v44[10] = v17;
    _os_log_impl(&dword_18B299000, v13, OS_LOG_TYPE_DEFAULT, "tryUserCredentialsAndDSID for context:%@, altdsid:%@", buf, 0x16u);
  }
  int v18 = _OctagonSignpostLogSystem();
  os_signpost_id_t v19 = os_signpost_id_generate(v18);
  uint64_t v20 = mach_continuous_time();

  uint64_t v21 = _OctagonSignpostLogSystem();
  unint64_t v22 = v21;
  unint64_t v23 = v19 - 1;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v19, "TryUserCredentialsAndDSID", " enableTelemetry=YES ", buf, 2u);
  }

  int v24 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)id v44 = v19;
    _os_log_impl(&dword_18B299000, v24, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: TryUserCredentialsAndDSID  enableTelemetry=YES ", buf, 0xCu);
  }

  if (+[OTClique platformSupportsSOS])
  {
    id v40 = 0;
    int v25 = SOSCCTryUserCredentialsAndDSID((uint64_t)v10, (uint64_t)v11, v12, (CFTypeRef *)&v40);
    int v26 = secLogObjForScope("clique-legacy");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109378;
      *(_DWORD *)id v44 = v25;
      *(_WORD *)&v44[4] = 2112;
      *(void *)&v44[6] = v40;
      _os_log_impl(&dword_18B299000, v26, OS_LOG_TYPE_DEFAULT, "tryUserCredentialsAndDSID results: %d %@", buf, 0x12u);
    }

    if (a6) {
      *a6 = v40;
    }
    else {

    }
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v19, v20);
    os_signpost_id_t v36 = _OctagonSignpostLogSystem();
    __int16 v37 = v36;
    if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)id v44 = v25;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v37, OS_SIGNPOST_INTERVAL_END, v19, "TryUserCredentialsAndDSID", " OctagonSignpostNameTryUserCredentialsAndDSID=%{public,signpost.telemetry:number1,name=OctagonSignpostNameTryUserCredentialsAndDSID}d ", buf, 8u);
    }

    double v38 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)id v44 = v19;
      *(_WORD *)&v44[8] = 2048;
      *(double *)&v44[10] = (double)Nanoseconds / 1000000000.0;
      __int16 v45 = 1026;
      int v46 = v25;
      _os_log_impl(&dword_18B299000, v38, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: TryUserCredentialsAndDSID  OctagonSignpostNameTryUserCredentialsAndDSID=%{public,signpost.telemetry:number1,name=OctagonSignpostNameTryUserCredentialsAndDSID}d ", buf, 0x1Cu);
    }
  }
  else
  {
    os_signpost_id_t v27 = secLogObjForScope("clique-legacy");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18B299000, v27, OS_LOG_TYPE_DEFAULT, "SOS disabled for this platform, returning NO", buf, 2u);
    }

    if (a6)
    {
      BOOL v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F28760];
      uint64_t v41 = *MEMORY[0x1E4F28568];
      uint64_t v42 = @"try user credentials unimplemented";
      __int16 v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      *a6 = [v28 errorWithDomain:v29 code:-4 userInfo:v30];
    }
    unint64_t v31 = _OctagonSignpostGetNanoseconds(v19, v20);
    id v32 = _OctagonSignpostLogSystem();
    uint64_t v33 = v32;
    if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)id v44 = 0;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v33, OS_SIGNPOST_INTERVAL_END, v19, "TryUserCredentialsAndDSID", " OctagonSignpostNameTryUserCredentialsAndDSID=%{public,signpost.telemetry:number1,name=OctagonSignpostNameTryUserCredentialsAndDSID}d ", buf, 8u);
    }

    os_signpost_id_t v34 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)id v44 = v19;
      *(_WORD *)&v44[8] = 2048;
      *(double *)&v44[10] = (double)v31 / 1000000000.0;
      __int16 v45 = 1026;
      int v46 = 0;
      _os_log_impl(&dword_18B299000, v34, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: TryUserCredentialsAndDSID  OctagonSignpostNameTryUserCredentialsAndDSID=%{public,signpost.telemetry:number1,name=OctagonSignpostNameTryUserCredentialsAndDSID}d ", buf, 0x1Cu);
    }

    LOBYTE(v25) = 0;
  }

  return v25;
}

- (BOOL)setUserCredentialsAndDSID:(id)a3 password:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(OTClique *)self ctx];
  id v11 = [v10 dsid];
  LOBYTE(a5) = [(OTClique *)self setUserCredentialsWithLabel:v9 password:v8 dsid:v11 error:a5];

  return (char)a5;
}

- (BOOL)setUserCredentialsWithLabel:(id)a3 password:(id)a4 dsid:(id)a5 error:(id *)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  os_signpost_id_t v13 = secLogObjForScope("clique-legacy");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [(OTClique *)self ctx];
    unint64_t v15 = [v14 context];
    uint64_t v16 = [(OTClique *)self ctx];
    unint64_t v17 = [v16 altDSID];
    *(_DWORD *)long long buf = 138412546;
    *(void *)id v44 = v15;
    *(_WORD *)&v44[8] = 2112;
    *(void *)&v44[10] = v17;
    _os_log_impl(&dword_18B299000, v13, OS_LOG_TYPE_DEFAULT, "setUserCredentialsAndDSID for context:%@, altdsid:%@", buf, 0x16u);
  }
  int v18 = _OctagonSignpostLogSystem();
  os_signpost_id_t v19 = os_signpost_id_generate(v18);
  uint64_t v20 = mach_continuous_time();

  uint64_t v21 = _OctagonSignpostLogSystem();
  unint64_t v22 = v21;
  unint64_t v23 = v19 - 1;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v19, "SetUserCredentialsAndDSID", " enableTelemetry=YES ", buf, 2u);
  }

  int v24 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)id v44 = v19;
    _os_log_impl(&dword_18B299000, v24, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SetUserCredentialsAndDSID  enableTelemetry=YES ", buf, 0xCu);
  }

  if (+[OTClique platformSupportsSOS])
  {
    id v40 = 0;
    int v25 = SOSCCSetUserCredentialsAndDSID(v10, (uint64_t)v11, (uint64_t)v12, (CFTypeRef *)&v40);
    int v26 = secLogObjForScope("clique-legacy");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109378;
      *(_DWORD *)id v44 = v25;
      *(_WORD *)&v44[4] = 2112;
      *(void *)&v44[6] = v40;
      _os_log_impl(&dword_18B299000, v26, OS_LOG_TYPE_DEFAULT, "setUserCredentialsAndDSID results: %d %@", buf, 0x12u);
    }

    if (a6) {
      *a6 = v40;
    }
    else {

    }
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v19, v20);
    os_signpost_id_t v36 = _OctagonSignpostLogSystem();
    __int16 v37 = v36;
    if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)id v44 = v25;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v37, OS_SIGNPOST_INTERVAL_END, v19, "SetUserCredentialsAndDSID", " OctagonSignpostNameSetUserCredentialsAndDSID=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetUserCredentialsAndDSID}d ", buf, 8u);
    }

    double v38 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)id v44 = v19;
      *(_WORD *)&v44[8] = 2048;
      *(double *)&v44[10] = (double)Nanoseconds / 1000000000.0;
      __int16 v45 = 1026;
      int v46 = v25;
      _os_log_impl(&dword_18B299000, v38, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SetUserCredentialsAndDSID  OctagonSignpostNameSetUserCredentialsAndDSID=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetUserCredentialsAndDSID}d ", buf, 0x1Cu);
    }
  }
  else
  {
    os_signpost_id_t v27 = secLogObjForScope("clique-legacy");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18B299000, v27, OS_LOG_TYPE_DEFAULT, "SOS disabled for this platform, returning NO", buf, 2u);
    }

    if (a6)
    {
      BOOL v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F28760];
      uint64_t v41 = *MEMORY[0x1E4F28568];
      uint64_t v42 = @"set user credentials unimplemented";
      __int16 v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      *a6 = [v28 errorWithDomain:v29 code:-4 userInfo:v30];
    }
    unint64_t v31 = _OctagonSignpostGetNanoseconds(v19, v20);
    id v32 = _OctagonSignpostLogSystem();
    uint64_t v33 = v32;
    if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)id v44 = 0;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v33, OS_SIGNPOST_INTERVAL_END, v19, "SetUserCredentialsAndDSID", " OctagonSignpostNameSetUserCredentialsAndDSID=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetUserCredentialsAndDSID}d ", buf, 8u);
    }

    os_signpost_id_t v34 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)id v44 = v19;
      *(_WORD *)&v44[8] = 2048;
      *(double *)&v44[10] = (double)v31 / 1000000000.0;
      __int16 v45 = 1026;
      int v46 = 0;
      _os_log_impl(&dword_18B299000, v34, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SetUserCredentialsAndDSID  OctagonSignpostNameSetUserCredentialsAndDSID=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetUserCredentialsAndDSID}d ", buf, 0x1Cu);
    }

    LOBYTE(v25) = 0;
  }

  return v25;
}

- (id)copyViewUnawarePeerInfo:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = secLogObjForScope("clique-legacy");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(OTClique *)self ctx];
    uint64_t v7 = [v6 context];
    id v8 = [(OTClique *)self ctx];
    id v9 = [v8 altDSID];
    *(_DWORD *)long long buf = 138412546;
    os_signpost_id_t v35 = (os_signpost_id_t)v7;
    __int16 v36 = 2112;
    double v37 = *(double *)&v9;
    _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, "copyViewUnawarePeerInfo for context:%@, altdsid:%@", buf, 0x16u);
  }
  id v10 = _OctagonSignpostLogSystem();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  uint64_t v12 = mach_continuous_time();

  os_signpost_id_t v13 = _OctagonSignpostLogSystem();
  uint64_t v14 = v13;
  unint64_t v15 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CopyViewUnawarePeerInfo", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v16 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    os_signpost_id_t v35 = v11;
    _os_log_impl(&dword_18B299000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CopyViewUnawarePeerInfo  enableTelemetry=YES ", buf, 0xCu);
  }

  if (+[OTClique platformSupportsSOS])
  {
    id v31 = 0;
    unint64_t v17 = (void *)SOSCCCopyViewUnawarePeerInfo((CFTypeRef *)&v31);
    if (a3) {
      *a3 = v31;
    }
    else {

    }
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
    os_signpost_id_t v27 = _OctagonSignpostLogSystem();
    BOOL v28 = v27;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_DWORD *)long long buf = 67240192;
      LODWORD(v35) = v17 != 0;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v28, OS_SIGNPOST_INTERVAL_END, v11, "CopyViewUnawarePeerInfo", " OctagonSignpostNameCopyViewUnawarePeerInfo=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCopyViewUnawarePeerInfo}d ", buf, 8u);
    }

    uint64_t v29 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      os_signpost_id_t v35 = v11;
      __int16 v36 = 2048;
      double v37 = (double)Nanoseconds / 1000000000.0;
      __int16 v38 = 1026;
      BOOL v39 = v17 != 0;
      _os_log_impl(&dword_18B299000, v29, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CopyViewUnawarePeerInfo  OctagonSignpostNameCopyViewUnawarePeerInfo=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCopyViewUnawarePeerInfo}d ", buf, 0x1Cu);
    }
  }
  else
  {
    int v18 = secLogObjForScope("clique-legacy");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18B299000, v18, OS_LOG_TYPE_DEFAULT, "SOS disabled for this platform, returning NULL", buf, 2u);
    }

    if (a3)
    {
      os_signpost_id_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F28760];
      uint64_t v32 = *MEMORY[0x1E4F28568];
      uint64_t v33 = @"copy view unaware peer info unimplemented";
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      *a3 = [v19 errorWithDomain:v20 code:-4 userInfo:v21];
    }
    unint64_t v22 = _OctagonSignpostGetNanoseconds(v11, v12);
    unint64_t v23 = _OctagonSignpostLogSystem();
    int v24 = v23;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_DWORD *)long long buf = 67240192;
      LODWORD(v35) = 0;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v24, OS_SIGNPOST_INTERVAL_END, v11, "CopyViewUnawarePeerInfo", " OctagonSignpostNameCopyViewUnawarePeerInfo=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCopyViewUnawarePeerInfo}d ", buf, 8u);
    }

    int v25 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      os_signpost_id_t v35 = v11;
      __int16 v36 = 2048;
      double v37 = (double)v22 / 1000000000.0;
      __int16 v38 = 1026;
      BOOL v39 = 0;
      _os_log_impl(&dword_18B299000, v25, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CopyViewUnawarePeerInfo  OctagonSignpostNameCopyViewUnawarePeerInfo=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCopyViewUnawarePeerInfo}d ", buf, 0x1Cu);
    }

    return 0;
  }
  return v17;
}

- (BOOL)waitForInitialSync:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = secLogObjForScope("clique-legacy");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(OTClique *)self ctx];
    uint64_t v7 = [v6 context];
    id v8 = [(OTClique *)self ctx];
    id v9 = [v8 altDSID];
    *(_DWORD *)long long buf = 138412546;
    *(void *)double v37 = v7;
    *(_WORD *)&v37[8] = 2112;
    *(void *)&v37[10] = v9;
    _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, "waitForInitialSync for context:%@, altdsid:%@", buf, 0x16u);
  }
  id v10 = _OctagonSignpostLogSystem();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  uint64_t v12 = mach_continuous_time();

  os_signpost_id_t v13 = _OctagonSignpostLogSystem();
  uint64_t v14 = v13;
  unint64_t v15 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "WaitForInitialSync", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v16 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)double v37 = v11;
    _os_log_impl(&dword_18B299000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: WaitForInitialSync  enableTelemetry=YES ", buf, 0xCu);
  }

  if (+[OTClique platformSupportsSOS])
  {
    id v33 = 0;
    int v17 = SOSCCWaitForInitialSync((CFTypeRef *)&v33);
    if (a3) {
      *a3 = v33;
    }
    else {

    }
    int v26 = secLogObjForScope("clique-legacy");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        os_signpost_id_t v27 = (__CFString *)*a3;
      }
      else {
        os_signpost_id_t v27 = @"no error pointer provided";
      }
      *(_DWORD *)long long buf = 67109378;
      *(_DWORD *)double v37 = v17;
      *(_WORD *)&v37[4] = 2112;
      *(void *)&v37[6] = v27;
      _os_log_impl(&dword_18B299000, v26, OS_LOG_TYPE_DEFAULT, "waitForInitialSync waited: %d %@", buf, 0x12u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
    uint64_t v29 = _OctagonSignpostLogSystem();
    __int16 v30 = v29;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)double v37 = v17;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v30, OS_SIGNPOST_INTERVAL_END, v11, "WaitForInitialSync", " OctagonSignpostNameWaitForInitialSync=%{public,signpost.telemetry:number1,name=OctagonSignpostNameWaitForInitialSync}d ", buf, 8u);
    }

    id v31 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)double v37 = v11;
      *(_WORD *)&v37[8] = 2048;
      *(double *)&v37[10] = (double)Nanoseconds / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = v17;
      _os_log_impl(&dword_18B299000, v31, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: WaitForInitialSync  OctagonSignpostNameWaitForInitialSync=%{public,signpost.telemetry:number1,name=OctagonSignpostNameWaitForInitialSync}d ", buf, 0x1Cu);
    }
  }
  else
  {
    int v18 = secLogObjForScope("clique-legacy");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18B299000, v18, OS_LOG_TYPE_DEFAULT, "SOS disabled for this platform, returning NO", buf, 2u);
    }

    if (a3)
    {
      os_signpost_id_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F28760];
      uint64_t v34 = *MEMORY[0x1E4F28568];
      os_signpost_id_t v35 = @"wait for initial sync unimplemented";
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      *a3 = [v19 errorWithDomain:v20 code:-4 userInfo:v21];
    }
    unint64_t v22 = _OctagonSignpostGetNanoseconds(v11, v12);
    unint64_t v23 = _OctagonSignpostLogSystem();
    int v24 = v23;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)double v37 = 0;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v24, OS_SIGNPOST_INTERVAL_END, v11, "WaitForInitialSync", " OctagonSignpostNameWaitForInitialSync=%{public,signpost.telemetry:number1,name=OctagonSignpostNameWaitForInitialSync}d ", buf, 8u);
    }

    int v25 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)double v37 = v11;
      *(_WORD *)&v37[8] = 2048;
      *(double *)&v37[10] = (double)v22 / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = 0;
      _os_log_impl(&dword_18B299000, v25, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: WaitForInitialSync  OctagonSignpostNameWaitForInitialSync=%{public,signpost.telemetry:number1,name=OctagonSignpostNameWaitForInitialSync}d ", buf, 0x1Cu);
    }

    LOBYTE(v17) = 0;
  }
  return v17;
}

- (void)fetchUserControllableViewsSyncingEnabledAsync:(id)a3
{
  id v4 = a3;
  id v12 = 0;
  uint64_t v5 = [(OTClique *)self makeOTControl:&v12];
  id v6 = v12;
  if (v5)
  {
    uint64_t v7 = [OTControlArguments alloc];
    id v8 = [(OTClique *)self ctx];
    id v9 = [(OTControlArguments *)v7 initWithConfiguration:v8];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__OTClique_fetchUserControllableViewsSyncingEnabledAsync___block_invoke;
    v10[3] = &unk_1E547F640;
    id v11 = v4;
    [v5 fetchUserControllableViewsSyncStatusAsync:v9 reply:v10];
  }
  else
  {
    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v6);
  }
}

void __58__OTClique_fetchUserControllableViewsSyncingEnabledAsync___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a3;
  id v6 = secLogObjForScope("clique-user-sync-async");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v10 = 138412290;
      id v11 = v5;
      id v8 = "fetching user-controllable-sync-async status errored: %@";
LABEL_8:
      _os_log_impl(&dword_18B299000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0xCu);
    }
  }
  else if (v7)
  {
    id v9 = @"paused";
    if (a2) {
      id v9 = @"enabled";
    }
    int v10 = 138412290;
    id v11 = v9;
    id v8 = "fetched user-controllable-sync-async status as : %@";
    goto LABEL_8;
  }

  (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2);
}

- (BOOL)fetchUserControllableViewsSyncingEnabled:(id *)a3
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__5170;
  int v17 = __Block_byref_object_dispose__5171;
  id v18 = 0;
  uint64_t v5 = -[OTClique makeOTControl:](self, "makeOTControl:");
  if (v5)
  {
    id v6 = [OTControlArguments alloc];
    BOOL v7 = [(OTClique *)self ctx];
    id v8 = [(OTControlArguments *)v6 initWithConfiguration:v7];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__OTClique_fetchUserControllableViewsSyncingEnabled___block_invoke;
    v12[3] = &unk_1E54779C0;
    v12[4] = &v19;
    v12[5] = &v13;
    [v5 fetchUserControllableViewsSyncStatus:v8 reply:v12];

    id v9 = (void *)v14[5];
    if (v9 && a3) {
      *a3 = v9;
    }
    BOOL v10 = *((unsigned char *)v20 + 24) != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

void __53__OTClique_fetchUserControllableViewsSyncingEnabled___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a3;
  id v6 = secLogObjForScope("clique-user-sync");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v12 = 138412290;
      uint64_t v13 = v5;
      id v8 = "fetching user-controllable-sync status errored: %@";
LABEL_8:
      _os_log_impl(&dword_18B299000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, 0xCu);
    }
  }
  else if (v7)
  {
    id v9 = @"paused";
    if (a2) {
      id v9 = @"enabled";
    }
    int v12 = 138412290;
    uint64_t v13 = v9;
    id v8 = "fetched user-controllable-sync status as : %@";
    goto LABEL_8;
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

- (BOOL)setOctagonUserControllableViewsSyncEnabled:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v7 = [(OTClique *)self makeOTControl:a4];
  if (v7)
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy__5170;
    char v22 = __Block_byref_object_dispose__5171;
    id v23 = 0;
    id v8 = secLogObjForScope("clique-user-sync");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = @"paused";
      if (v5) {
        id v9 = @"enabled";
      }
      *(_DWORD *)long long buf = 138412290;
      int v25 = v9;
      _os_log_impl(&dword_18B299000, v8, OS_LOG_TYPE_DEFAULT, "setting user-controllable-sync status to %@", buf, 0xCu);
    }

    uint64_t v10 = [OTControlArguments alloc];
    id v11 = [(OTClique *)self ctx];
    int v12 = [(OTControlArguments *)v10 initWithConfiguration:v11];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __61__OTClique_setOctagonUserControllableViewsSyncEnabled_error___block_invoke;
    v17[3] = &unk_1E5477998;
    v17[4] = &v18;
    [v7 setUserControllableViewsSyncStatus:v12 enabled:v5 reply:v17];

    uint64_t v13 = v19;
    if (a4)
    {
      uint64_t v14 = (void *)v19[5];
      if (v14)
      {
        *a4 = v14;
        uint64_t v13 = v19;
      }
    }
    BOOL v15 = v13[5] == 0;
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

void __61__OTClique_setOctagonUserControllableViewsSyncEnabled_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v5 = a3;
  id v6 = secLogObjForScope("clique-user-sync");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v11 = 138412290;
      int v12 = v5;
      _os_log_impl(&dword_18B299000, v6, OS_LOG_TYPE_DEFAULT, "setting user-controllable-sync status errored: %@", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = v5;
    id v6 = *(NSObject **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
  }
  else if (v7)
  {
    uint64_t v10 = @"paused";
    if (a2) {
      uint64_t v10 = @"enabled";
    }
    int v11 = 138412290;
    int v12 = v10;
    _os_log_impl(&dword_18B299000, v6, OS_LOG_TYPE_DEFAULT, "setting user-controllable-sync status succeeded, now : %@", (uint8_t *)&v11, 0xCu);
  }
}

- (BOOL)joinAfterRestore:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  BOOL v5 = secLogObjForScope("clique-recovery");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(OTClique *)self ctx];
    BOOL v7 = [v6 context];
    uint64_t v8 = [(OTClique *)self ctx];
    id v9 = [v8 altDSID];
    *(_DWORD *)long long buf = 138412546;
    *(void *)double v37 = v7;
    *(_WORD *)&v37[8] = 2112;
    *(void *)&v37[10] = v9;
    _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, "joinAfterRestore for context:%@, altdsid:%@", buf, 0x16u);
  }
  uint64_t v10 = _OctagonSignpostLogSystem();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  uint64_t v12 = mach_continuous_time();

  uint64_t v13 = _OctagonSignpostLogSystem();
  uint64_t v14 = v13;
  unint64_t v15 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "JoinAfterRestore", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v16 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)double v37 = v11;
    _os_log_impl(&dword_18B299000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: JoinAfterRestore  enableTelemetry=YES ", buf, 0xCu);
  }

  if (+[OTClique platformSupportsSOS])
  {
    id v33 = 0;
    int v17 = SOSCCRequestToJoinCircleAfterRestore((CFTypeRef *)&v33);
    if (a3) {
      *a3 = v33;
    }
    else {

    }
    uint64_t v26 = secLogObjForScope("clique-recovery");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        os_signpost_id_t v27 = (__CFString *)*a3;
      }
      else {
        os_signpost_id_t v27 = @"no error pointer provided";
      }
      *(_DWORD *)long long buf = 67109378;
      *(_DWORD *)double v37 = v17;
      *(_WORD *)&v37[4] = 2112;
      *(void *)&v37[6] = v27;
      _os_log_impl(&dword_18B299000, v26, OS_LOG_TYPE_DEFAULT, "joinAfterRestore complete: %d %@", buf, 0x12u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
    uint64_t v29 = _OctagonSignpostLogSystem();
    __int16 v30 = v29;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)double v37 = v17;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v30, OS_SIGNPOST_INTERVAL_END, v11, "JoinAfterRestore", " OctagonSignpostNameJoinAfterRestore=%{public,signpost.telemetry:number1,name=OctagonSignpostNameJoinAfterRestore}d ", buf, 8u);
    }

    id v31 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)double v37 = v11;
      *(_WORD *)&v37[8] = 2048;
      *(double *)&v37[10] = (double)Nanoseconds / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = v17;
      _os_log_impl(&dword_18B299000, v31, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: JoinAfterRestore  OctagonSignpostNameJoinAfterRestore=%{public,signpost.telemetry:number1,name=OctagonSignpostNameJoinAfterRestore}d ", buf, 0x1Cu);
    }
  }
  else
  {
    uint64_t v18 = secLogObjForScope("clique-recovery");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18B299000, v18, OS_LOG_TYPE_DEFAULT, "SOS disabled for this platform, returning NO", buf, 2u);
    }

    if (a3)
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F28760];
      uint64_t v34 = *MEMORY[0x1E4F28568];
      os_signpost_id_t v35 = @"join after restore unimplemented";
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      *a3 = [v19 errorWithDomain:v20 code:-4 userInfo:v21];
    }
    unint64_t v22 = _OctagonSignpostGetNanoseconds(v11, v12);
    id v23 = _OctagonSignpostLogSystem();
    int v24 = v23;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)double v37 = 0;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v24, OS_SIGNPOST_INTERVAL_END, v11, "JoinAfterRestore", " OctagonSignpostNameJoinAfterRestore=%{public,signpost.telemetry:number1,name=OctagonSignpostNameJoinAfterRestore}d ", buf, 8u);
    }

    int v25 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)double v37 = v11;
      *(_WORD *)&v37[8] = 2048;
      *(double *)&v37[10] = (double)v22 / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = 0;
      _os_log_impl(&dword_18B299000, v25, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: JoinAfterRestore  OctagonSignpostNameJoinAfterRestore=%{public,signpost.telemetry:number1,name=OctagonSignpostNameJoinAfterRestore}d ", buf, 0x1Cu);
    }

    LOBYTE(v17) = 0;
  }
  return v17;
}

- (id)peerDeviceNamesByPeerID:(id *)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  BOOL v5 = secLogObjForScope("clique");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(OTClique *)self ctx];
    BOOL v7 = [v6 context];
    uint64_t v8 = [(OTClique *)self ctx];
    id v9 = [v8 altDSID];
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, "peerDeviceNamesByPeerID invoked using context:%@, altdsid:%@", buf, 0x16u);
  }
  uint64_t v10 = _OctagonSignpostLogSystem();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  uint64_t v12 = mach_continuous_time();

  uint64_t v13 = _OctagonSignpostLogSystem();
  uint64_t v14 = v13;
  unint64_t v15 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PeerDeviceNamesByPeerID", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v16 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)&uint8_t buf[4] = v11;
    _os_log_impl(&dword_18B299000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PeerDeviceNamesByPeerID  enableTelemetry=YES ", buf, 0xCu);
  }

  int v17 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v18 = [(OTClique *)self makeOTControl:a3];
  if (v18)
  {
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v54 = __Block_byref_object_copy__5170;
    v55 = __Block_byref_object_dispose__5171;
    id v56 = 0;
    uint64_t v41 = 0;
    uint64_t v42 = &v41;
    uint64_t v43 = 0x3032000000;
    id v44 = __Block_byref_object_copy__5170;
    __int16 v45 = __Block_byref_object_dispose__5171;
    id v46 = 0;
    uint64_t v19 = [OTControlArguments alloc];
    uint64_t v20 = [(OTClique *)self ctx];
    uint64_t v21 = [(OTControlArguments *)v19 initWithConfiguration:v20];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __36__OTClique_peerDeviceNamesByPeerID___block_invoke;
    v40[3] = &unk_1E5477970;
    uint8_t v40[4] = buf;
    v40[5] = &v41;
    [v18 peerDeviceNamesByPeerID:v21 reply:v40];

    uint64_t v22 = *(void *)&buf[8];
    if (a3)
    {
      id v23 = *(void **)(*(void *)&buf[8] + 40);
      if (v23)
      {
        *a3 = v23;
        uint64_t v22 = *(void *)&buf[8];
      }
    }
    if (*(void *)(v22 + 40))
    {
      unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
      int v25 = _OctagonSignpostLogSystem();
      uint64_t v26 = v25;
      if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        *(_DWORD *)uint64_t v47 = 67240192;
        LODWORD(v48) = 0;
        _os_signpost_emit_with_name_impl(&dword_18B299000, v26, OS_SIGNPOST_INTERVAL_END, v11, "PeerDeviceNamesByPeerID", " OctagonSignpostNamePeerDeviceNamesByPeerID=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePeerDeviceNamesByPeerID}d ", v47, 8u);
      }

      os_signpost_id_t v27 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v47 = 134218496;
        os_signpost_id_t v48 = v11;
        __int16 v49 = 2048;
        double v50 = (double)Nanoseconds / 1000000000.0;
        __int16 v51 = 1026;
        int v52 = 0;
        _os_log_impl(&dword_18B299000, v27, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PeerDeviceNamesByPeerID  OctagonSignpostNamePeerDeviceNamesByPeerID=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePeerDeviceNamesByPeerID}d ", v47, 0x1Cu);
      }

      id v28 = 0;
    }
    else
    {
      [v17 addEntriesFromDictionary:v42[5]];
      id v33 = secLogObjForScope("clique");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = [(id)v42[5] count];
        *(_DWORD *)uint64_t v47 = 134217984;
        os_signpost_id_t v48 = v34;
        _os_log_impl(&dword_18B299000, v33, OS_LOG_TYPE_DEFAULT, "Received %lu Octagon peers", v47, 0xCu);
      }

      unint64_t v35 = _OctagonSignpostGetNanoseconds(v11, v12);
      __int16 v36 = _OctagonSignpostLogSystem();
      double v37 = v36;
      if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
      {
        *(_DWORD *)uint64_t v47 = 67240192;
        LODWORD(v48) = 0;
        _os_signpost_emit_with_name_impl(&dword_18B299000, v37, OS_SIGNPOST_INTERVAL_END, v11, "PeerDeviceNamesByPeerID", " OctagonSignpostNamePeerDeviceNamesByPeerID=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePeerDeviceNamesByPeerID}d ", v47, 8u);
      }

      __int16 v38 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v47 = 134218496;
        os_signpost_id_t v48 = v11;
        __int16 v49 = 2048;
        double v50 = (double)v35 / 1000000000.0;
        __int16 v51 = 1026;
        int v52 = 0;
        _os_log_impl(&dword_18B299000, v38, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PeerDeviceNamesByPeerID  OctagonSignpostNamePeerDeviceNamesByPeerID=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePeerDeviceNamesByPeerID}d ", v47, 0x1Cu);
      }

      id v28 = v17;
    }
    _Block_object_dispose(&v41, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    unint64_t v29 = _OctagonSignpostGetNanoseconds(v11, v12);
    __int16 v30 = _OctagonSignpostLogSystem();
    id v31 = v30;
    if (v15 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v30))
    {
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)&uint8_t buf[4] = 0;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v31, OS_SIGNPOST_INTERVAL_END, v11, "PeerDeviceNamesByPeerID", " OctagonSignpostNamePeerDeviceNamesByPeerID=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePeerDeviceNamesByPeerID}d ", buf, 8u);
    }

    uint64_t v32 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)v29 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v54) = 0;
      _os_log_impl(&dword_18B299000, v32, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PeerDeviceNamesByPeerID  OctagonSignpostNamePeerDeviceNamesByPeerID=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePeerDeviceNamesByPeerID}d ", buf, 0x1Cu);
    }

    id v28 = 0;
  }

  return v28;
}

void __36__OTClique_peerDeviceNamesByPeerID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = secLogObjForScope("clique");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v15 = 138412290;
      id v16 = v6;
      id v9 = "peerDeviceNamesByPeerID errored: %@";
LABEL_6:
      _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, 0xCu);
    }
  }
  else if (v8)
  {
    int v15 = 138412290;
    id v16 = v5;
    id v9 = "peerDeviceNamesByPeerID succeeded: %@";
    goto LABEL_6;
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  os_signpost_id_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
  id v12 = v6;

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v5;
}

- (BOOL)leaveClique:(id *)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = secLogObjForScope("clique-leaveClique");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(OTClique *)self ctx];
    BOOL v7 = [v6 context];
    BOOL v8 = [(OTClique *)self ctx];
    id v9 = [v8 altDSID];
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, "leaveClique invoked using context:%@, altdsid:%@", buf, 0x16u);
  }
  uint64_t v10 = _OctagonSignpostLogSystem();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  uint64_t v12 = mach_continuous_time();

  uint64_t v13 = _OctagonSignpostLogSystem();
  uint64_t v14 = v13;
  unint64_t v15 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "LeaveClique", " enableTelemetry=YES ", buf, 2u);
  }

  id v16 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)&uint8_t buf[4] = v11;
    _os_log_impl(&dword_18B299000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: LeaveClique  enableTelemetry=YES ", buf, 0xCu);
  }

  uint64_t v17 = [(OTClique *)self makeOTControl:a3];
  if (v17)
  {
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v54 = __Block_byref_object_copy__5170;
    v55 = __Block_byref_object_dispose__5171;
    id v56 = 0;
    uint64_t v18 = objc_alloc_init(OTOperationConfiguration);
    uint64_t v19 = (id *)(*(void *)&buf[8] + 40);
    id obj = *(id *)(*(void *)&buf[8] + 40);
    int64_t v20 = [(OTClique *)self fetchCliqueStatus:v18 error:&obj];
    objc_storeStrong(v19, obj);

    if (*(void *)(*(void *)&buf[8] + 40))
    {
      uint64_t v21 = secLogObjForScope("clique-leaveClique");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        os_signpost_id_t v22 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)uint64_t v47 = 138412290;
        os_signpost_id_t v48 = v22;
        _os_log_impl(&dword_18B299000, v21, OS_LOG_TYPE_DEFAULT, "fetching current status errored: %@", v47, 0xCu);
      }

      if (a3) {
        *a3 = *(id *)(*(void *)&buf[8] + 40);
      }
      unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
      int v24 = _OctagonSignpostLogSystem();
      int v25 = v24;
      if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_DWORD *)uint64_t v47 = 67240192;
        LODWORD(v48) = 0;
        _os_signpost_emit_with_name_impl(&dword_18B299000, v25, OS_SIGNPOST_INTERVAL_END, v11, "LeaveClique", " OctagonSignpostNameLeaveClique=%{public,signpost.telemetry:number1,name=OctagonSignpostNameLeaveClique}d ", v47, 8u);
      }

      uint64_t v26 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v47 = 134218496;
        os_signpost_id_t v48 = v11;
        __int16 v49 = 2048;
        double v50 = (double)Nanoseconds / 1000000000.0;
        __int16 v51 = 1026;
        BOOL v52 = 0;
        _os_log_impl(&dword_18B299000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: LeaveClique  OctagonSignpostNameLeaveClique=%{public,signpost.telemetry:number1,name=OctagonSignpostNameLeaveClique}d ", v47, 0x1Cu);
      }
      BOOL v27 = 0;
    }
    else
    {
      if (v20 == 1)
      {
        uint64_t v32 = secLogObjForScope("clique-leaveClique");
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v47 = 0;
          _os_log_impl(&dword_18B299000, v32, OS_LOG_TYPE_DEFAULT, "current status is Not In; no need to leave",
            v47,
            2u);
        }

        unint64_t v33 = _OctagonSignpostGetNanoseconds(v11, v12);
        uint64_t v34 = _OctagonSignpostLogSystem();
        unint64_t v35 = v34;
        if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
        {
          *(_DWORD *)uint64_t v47 = 67240192;
          LODWORD(v48) = 1;
          _os_signpost_emit_with_name_impl(&dword_18B299000, v35, OS_SIGNPOST_INTERVAL_END, v11, "LeaveClique", " OctagonSignpostNameLeaveClique=%{public,signpost.telemetry:number1,name=OctagonSignpostNameLeaveClique}d ", v47, 8u);
        }

        uint64_t v26 = _OctagonSignpostLogSystem();
        BOOL v27 = 1;
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_44;
        }
        *(_DWORD *)uint64_t v47 = 134218496;
        os_signpost_id_t v48 = v11;
        __int16 v49 = 2048;
        double v50 = (double)v33 / 1000000000.0;
        __int16 v51 = 1026;
        BOOL v52 = 1;
      }
      else
      {
        __int16 v36 = [OTControlArguments alloc];
        double v37 = [(OTClique *)self ctx];
        __int16 v38 = [(OTControlArguments *)v36 initWithConfiguration:v37];
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __24__OTClique_leaveClique___block_invoke;
        v45[3] = &unk_1E5481470;
        v45[4] = buf;
        [v17 leaveClique:v38 reply:v45];

        if (a3) {
          *a3 = *(id *)(*(void *)&buf[8] + 40);
        }
        uint64_t v39 = *(void *)(*(void *)&buf[8] + 40);
        BOOL v27 = v39 == 0;
        uint64_t v40 = secLogObjForScope("clique-leaveClique");
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v47 = 67109120;
          LODWORD(v48) = v39 == 0;
          _os_log_impl(&dword_18B299000, v40, OS_LOG_TYPE_DEFAULT, "leaveClique complete: %d", v47, 8u);
        }

        unint64_t v41 = _OctagonSignpostGetNanoseconds(v11, v12);
        uint64_t v42 = _OctagonSignpostLogSystem();
        uint64_t v43 = v42;
        if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
        {
          *(_DWORD *)uint64_t v47 = 67240192;
          LODWORD(v48) = v39 == 0;
          _os_signpost_emit_with_name_impl(&dword_18B299000, v43, OS_SIGNPOST_INTERVAL_END, v11, "LeaveClique", " OctagonSignpostNameLeaveClique=%{public,signpost.telemetry:number1,name=OctagonSignpostNameLeaveClique}d ", v47, 8u);
        }

        uint64_t v26 = _OctagonSignpostLogSystem();
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_44;
        }
        *(_DWORD *)uint64_t v47 = 134218496;
        os_signpost_id_t v48 = v11;
        __int16 v49 = 2048;
        double v50 = (double)v41 / 1000000000.0;
        __int16 v51 = 1026;
        BOOL v52 = v39 == 0;
      }
      _os_log_impl(&dword_18B299000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: LeaveClique  OctagonSignpostNameLeaveClique=%{public,signpost.telemetry:number1,name=OctagonSignpostNameLeaveClique}d ", v47, 0x1Cu);
    }
LABEL_44:

    _Block_object_dispose(buf, 8);
    goto LABEL_45;
  }
  unint64_t v28 = _OctagonSignpostGetNanoseconds(v11, v12);
  unint64_t v29 = _OctagonSignpostLogSystem();
  __int16 v30 = v29;
  if (v15 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v29))
  {
    *(_DWORD *)long long buf = 67240192;
    *(_DWORD *)&uint8_t buf[4] = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v30, OS_SIGNPOST_INTERVAL_END, v11, "LeaveClique", " OctagonSignpostNameLeaveClique=%{public,signpost.telemetry:number1,name=OctagonSignpostNameLeaveClique}d ", buf, 8u);
  }

  id v31 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218496;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (double)v28 / 1000000000.0;
    *(_WORD *)&buf[22] = 1026;
    LODWORD(v54) = 0;
    _os_log_impl(&dword_18B299000, v31, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: LeaveClique  OctagonSignpostNameLeaveClique=%{public,signpost.telemetry:number1,name=OctagonSignpostNameLeaveClique}d ", buf, 0x1Cu);
  }

  BOOL v27 = 0;
LABEL_45:

  return v27;
}

void __24__OTClique_leaveClique___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = secLogObjForScope("clique-leaveClique");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "leaveClique errored: %@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = v3;
    id v4 = *(NSObject **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else if (v5)
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "leaveClique success.", (uint8_t *)&v8, 2u);
  }
}

- (BOOL)removeFriendsInClique:(id)a3 error:(id *)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = secLogObjForScope("clique-removefriends");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(OTClique *)self ctx];
    int v8 = [v7 context];
    id v9 = [(OTClique *)self ctx];
    uint64_t v10 = [v9 altDSID];
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_18B299000, v6, OS_LOG_TYPE_DEFAULT, "removeFriendsInClique invoked using context:%@, altdsid:%@", buf, 0x16u);
  }
  os_signpost_id_t v11 = _OctagonSignpostLogSystem();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  uint64_t v42 = mach_continuous_time();

  uint64_t v13 = _OctagonSignpostLogSystem();
  uint64_t v14 = v13;
  unint64_t v41 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "RemoveFriendsInClique", " enableTelemetry=YES ", buf, 2u);
  }

  unint64_t v15 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)&uint8_t buf[4] = v12;
    _os_log_impl(&dword_18B299000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RemoveFriendsInClique  enableTelemetry=YES ", buf, 0xCu);
  }

  id v16 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v18 = v5;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v47 objects:v61 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v48 != v20) {
          objc_enumerationMutation(v18);
        }
        os_signpost_id_t v22 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        if ([v22 hasPrefix:@"SHA256:"]) {
          id v23 = v16;
        }
        else {
          id v23 = v17;
        }
        [v23 addObject:v22];
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v47 objects:v61 count:16];
    }
    while (v19);
  }

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v58 = __Block_byref_object_copy__5170;
  v59 = __Block_byref_object_dispose__5171;
  id v60 = 0;
  if (![v16 count]) {
    goto LABEL_23;
  }
  int v24 = [(OTClique *)self makeOTControl:a4];
  if (v24)
  {
    int v25 = secLogObjForScope("clique-removefriends");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v51 = 138412290;
      os_signpost_id_t v52 = (os_signpost_id_t)v16;
      _os_log_impl(&dword_18B299000, v25, OS_LOG_TYPE_DEFAULT, "octagon: removing octagon friends: %@", v51, 0xCu);
    }

    uint64_t v26 = [OTControlArguments alloc];
    BOOL v27 = [(OTClique *)self ctx];
    unint64_t v28 = [(OTControlArguments *)v26 initWithConfiguration:v27];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __40__OTClique_removeFriendsInClique_error___block_invoke;
    v44[3] = &unk_1E5477948;
    id v46 = buf;
    id v45 = v16;
    [v24 removeFriendsInClique:v28 peerIDs:v45 reply:v44];

LABEL_23:
    if (a4)
    {
      unint64_t v29 = *(void **)(*(void *)&buf[8] + 40);
      if (v29) {
        *a4 = v29;
      }
    }
    __int16 v30 = secLogObjForScope("clique-removefriends");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v51 = 67109120;
      LODWORD(v52) = 1;
      _os_log_impl(&dword_18B299000, v30, OS_LOG_TYPE_DEFAULT, "removeFriendsInClique complete: %d", v51, 8u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v12, v42);
    uint64_t v32 = _OctagonSignpostLogSystem();
    unint64_t v33 = v32;
    if (v41 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_DWORD *)__int16 v51 = 67240192;
      LODWORD(v52) = 1;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v33, OS_SIGNPOST_INTERVAL_END, v12, "RemoveFriendsInClique", " OctagonSignpostNameRemoveFriendsInClique=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveFriendsInClique}d ", v51, 8u);
    }

    uint64_t v34 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v51 = 134218496;
      os_signpost_id_t v52 = v12;
      __int16 v53 = 2048;
      double v54 = (double)Nanoseconds / 1000000000.0;
      __int16 v55 = 1026;
      int v56 = 1;
      _os_log_impl(&dword_18B299000, v34, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RemoveFriendsInClique  OctagonSignpostNameRemoveFriendsInClique=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveFriendsInClique}d ", v51, 0x1Cu);
    }

    BOOL v35 = *(void *)(*(void *)&buf[8] + 40) == 0;
    goto LABEL_40;
  }
  unint64_t v36 = _OctagonSignpostGetNanoseconds(v12, v42);
  double v37 = _OctagonSignpostLogSystem();
  __int16 v38 = v37;
  if (v41 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    *(_DWORD *)__int16 v51 = 67240192;
    LODWORD(v52) = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v38, OS_SIGNPOST_INTERVAL_END, v12, "RemoveFriendsInClique", " OctagonSignpostNameRemoveFriendsInClique=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveFriendsInClique}d ", v51, 8u);
  }

  uint64_t v39 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int16 v51 = 134218496;
    os_signpost_id_t v52 = v12;
    __int16 v53 = 2048;
    double v54 = (double)v36 / 1000000000.0;
    __int16 v55 = 1026;
    int v56 = 0;
    _os_log_impl(&dword_18B299000, v39, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RemoveFriendsInClique  OctagonSignpostNameRemoveFriendsInClique=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveFriendsInClique}d ", v51, 0x1Cu);
  }

  BOOL v35 = 0;
LABEL_40:
  _Block_object_dispose(buf, 8);

  return v35;
}

void __40__OTClique_removeFriendsInClique_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = secLogObjForScope("clique-removefriends");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "removeFriendsInClique failed: unable to remove friends: %@", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = v3;
    id v4 = *(NSObject **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else if (v5)
  {
    int v8 = *(void **)(a1 + 32);
    int v9 = 138412290;
    id v10 = v8;
    _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "octagon: friends removed: %@", (uint8_t *)&v9, 0xCu);
  }
}

- (int64_t)cachedCliqueStatus:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  id v7 = objc_alloc_init(OTOperationConfiguration);
  [(OTOperationConfiguration *)v7 setTimeoutWaitForCKAccount:0];
  if (v5) {
    [(OTOperationConfiguration *)v7 setUseCachedAccountStatus:1];
  }
  int64_t v8 = [(OTClique *)self _fetchCliqueStatus:v7 error:a4];

  return v8;
}

- (int64_t)fetchCliqueStatus:(id *)a3
{
  BOOL v5 = objc_alloc_init(OTOperationConfiguration);
  [(OTOperationConfiguration *)v5 setTimeoutWaitForCKAccount:0];
  int64_t v6 = [(OTClique *)self _fetchCliqueStatus:v5 error:a3];

  return v6;
}

- (int64_t)_fetchCliqueStatus:(id)a3 error:(id *)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x2020000000;
  uint64_t v65 = -1;
  int64_t v6 = _OctagonSignpostLogSystem();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);
  uint64_t v48 = mach_continuous_time();

  int64_t v8 = _OctagonSignpostLogSystem();
  int v9 = v8;
  unint64_t v10 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FetchCliqueStatus", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v11 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)&uint8_t buf[4] = v7;
    _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchCliqueStatus  enableTelemetry=YES ", buf, 0xCu);
  }

  os_signpost_id_t v12 = [(OTClique *)self makeOTControl:a4];
  if (v12)
  {
    uint64_t v56 = 0;
    uint64_t v57 = &v56;
    uint64_t v58 = 0x3032000000;
    v59 = __Block_byref_object_copy__5170;
    id v60 = __Block_byref_object_dispose__5171;
    id v61 = 0;
    uint64_t v13 = [OTControlArguments alloc];
    uint64_t v14 = [(OTClique *)self ctx];
    unint64_t v15 = [(OTControlArguments *)v13 initWithConfiguration:v14];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __37__OTClique__fetchCliqueStatus_error___block_invoke;
    v55[3] = &unk_1E54778F8;
    v55[4] = &v62;
    v55[5] = &v56;
    [v12 fetchCliqueStatus:v15 configuration:v49 reply:v55];

    if (_fetchCliqueStatus_error__onceToken != -1) {
      dispatch_once(&_fetchCliqueStatus_error__onceToken, &__block_literal_global_293);
    }
    uint64_t v51 = 0;
    os_signpost_id_t v52 = &v51;
    uint64_t v53 = 0x2020000000;
    char v54 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__OTClique__fetchCliqueStatus_error___block_invoke_2;
    block[3] = &unk_1E5477920;
    block[4] = self;
    block[5] = &v51;
    block[6] = &v62;
    dispatch_sync((dispatch_queue_t)_fetchCliqueStatus_error__statusReturnsQueue, block);
    if (v57[5] || ![v49 useCachedAccountStatus] || *((unsigned char *)v52 + 24))
    {
      id v16 = secLogObjForScope("clique-status");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        if ([v49 useCachedAccountStatus]) {
          uint64_t v17 = (const char *)&unk_18B41CA07;
        }
        else {
          uint64_t v17 = "non-";
        }
        id v18 = [(OTClique *)self ctx];
        uint64_t v19 = [v18 context];
        uint64_t v20 = [(OTClique *)self ctx];
        uint64_t v21 = [v20 altDSID];
        os_signpost_id_t v22 = (void *)v21;
        unint64_t v23 = v63[3] + 1;
        if (v23 > 5) {
          int v24 = @"CliqueStatusIn";
        }
        else {
          int v24 = off_1E5477BA0[v23];
        }
        uint64_t v31 = v57[5];
        *(_DWORD *)long long buf = 136447234;
        *(void *)&uint8_t buf[4] = v17;
        __int16 v67 = 2112;
        double v68 = *(double *)&v19;
        __int16 v69 = 2112;
        uint64_t v70 = v21;
        __int16 v71 = 2112;
        v72 = v24;
        __int16 v73 = 2112;
        uint64_t v74 = v31;
        _os_log_impl(&dword_18B299000, v16, OS_LOG_TYPE_DEFAULT, "cliqueStatus(%{public}scached)(context:%@, altDSID:%@) returning %@ (error: %@)", buf, 0x34u);
      }
    }
    else
    {
      id v16 = secLogObjForScope("clique-status");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        if ([v49 useCachedAccountStatus]) {
          uint64_t v39 = (const char *)&unk_18B41CA07;
        }
        else {
          uint64_t v39 = "non-";
        }
        uint64_t v40 = [(OTClique *)self ctx];
        unint64_t v41 = [v40 context];
        uint64_t v42 = [(OTClique *)self ctx];
        uint64_t v43 = [v42 altDSID];
        id v44 = (void *)v43;
        unint64_t v45 = v63[3] + 1;
        if (v45 > 5) {
          id v46 = @"CliqueStatusIn";
        }
        else {
          id v46 = off_1E5477BA0[v45];
        }
        uint64_t v47 = v57[5];
        *(_DWORD *)long long buf = 136447234;
        *(void *)&uint8_t buf[4] = v39;
        __int16 v67 = 2112;
        double v68 = *(double *)&v41;
        __int16 v69 = 2112;
        uint64_t v70 = v43;
        __int16 v71 = 2112;
        v72 = v46;
        __int16 v73 = 2112;
        uint64_t v74 = v47;
        _os_log_debug_impl(&dword_18B299000, v16, OS_LOG_TYPE_DEBUG, "cliqueStatus(%{public}scached)(context:%@, altDSID:%@) returning %@ (error: %@)", buf, 0x34u);
      }
    }

    _Block_object_dispose(&v51, 8);
    int v32 = 1;
    if (a4)
    {
      unint64_t v33 = (void *)v57[5];
      if (v33)
      {
        int v32 = 0;
        *a4 = v33;
      }
    }
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v7, v48);
    BOOL v35 = _OctagonSignpostLogSystem();
    unint64_t v36 = v35;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)&uint8_t buf[4] = v32;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v36, OS_SIGNPOST_INTERVAL_END, v7, "FetchCliqueStatus", " OctagonSignpostNameFetchCliqueStatus=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchCliqueStatus}d ", buf, 8u);
    }

    double v37 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)&uint8_t buf[4] = v7;
      __int16 v67 = 2048;
      double v68 = (double)Nanoseconds / 1000000000.0;
      __int16 v69 = 1026;
      LODWORD(v70) = v32;
      _os_log_impl(&dword_18B299000, v37, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchCliqueStatus  OctagonSignpostNameFetchCliqueStatus=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchCliqueStatus}d ", buf, 0x1Cu);
    }

    int64_t v30 = v63[3];
    _Block_object_dispose(&v56, 8);
  }
  else
  {
    int v25 = secLogObjForScope("clique-status");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18B299000, v25, OS_LOG_TYPE_DEFAULT, "cliqueStatus noOTControl", buf, 2u);
    }

    unint64_t v26 = _OctagonSignpostGetNanoseconds(v7, v48);
    BOOL v27 = _OctagonSignpostLogSystem();
    unint64_t v28 = v27;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(void *)long long buf = 67240192;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v28, OS_SIGNPOST_INTERVAL_END, v7, "FetchCliqueStatus", " OctagonSignpostNameFetchCliqueStatus=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchCliqueStatus}d ", buf, 8u);
    }

    unint64_t v29 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)&uint8_t buf[4] = v7;
      __int16 v67 = 2048;
      double v68 = (double)v26 / 1000000000.0;
      __int16 v69 = 1026;
      LODWORD(v70) = 0;
      _os_log_impl(&dword_18B299000, v29, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchCliqueStatus  OctagonSignpostNameFetchCliqueStatus=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchCliqueStatus}d ", buf, 0x1Cu);
    }

    int64_t v30 = -1;
  }

  _Block_object_dispose(&v62, 8);
  return v30;
}

void __37__OTClique__fetchCliqueStatus_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v6)
  {
    *(void *)(v7 + 24) = -1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    int64_t v8 = secLogObjForScope("clique-status");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_debug_impl(&dword_18B299000, v8, OS_LOG_TYPE_DEBUG, "octagon clique status errored: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    *(void *)(v7 + 24) = a2;
  }
}

uint64_t __37__OTClique__fetchCliqueStatus_error___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) ctx];
  uint64_t v9 = [v2 context];

  if (!v9)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    goto LABEL_9;
  }
  id v3 = objc_msgSend((id)_fetchCliqueStatus_error__statusReturns, "objectForKeyedSubscript:");
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 integerValue];
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v5 == v6) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  uint64_t v7 = [NSNumber numberWithInteger:v6];
  [(id)_fetchCliqueStatus_error__statusReturns setObject:v7 forKeyedSubscript:v9];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
LABEL_8:

LABEL_9:

  return MEMORY[0x1F4181820]();
}

uint64_t __37__OTClique__fetchCliqueStatus_error___block_invoke_291()
{
  dispatch_queue_t v0 = dispatch_queue_create("status_returns", 0);
  v1 = (void *)_fetchCliqueStatus_error__statusReturnsQueue;
  _fetchCliqueStatus_error__statusReturnsQueue = (uint64_t)v0;

  _fetchCliqueStatus_error__statusReturns = [MEMORY[0x1E4F1CA60] dictionary];

  return MEMORY[0x1F41817F8]();
}

- (id)setupPairingChannelAsAcceptor:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  return [(OTClique *)self setupPairingChannelAsAcceptor:a3];
}

- (id)setupPairingChannelAsAcceptor:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 altDSID];
  if (v5)
  {
  }
  else
  {
    uint64_t v14 = [(OTClique *)self ctx];
    unint64_t v15 = [v14 altDSID];

    if (v15)
    {
      id v16 = secLogObjForScope("octagon-account");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [(OTClique *)self ctx];
        id v18 = [v17 altDSID];
        int v24 = 138412290;
        int v25 = v18;
        _os_log_impl(&dword_18B299000, v16, OS_LOG_TYPE_DEFAULT, "Configuring pairing channel with configured altDSID: %@", (uint8_t *)&v24, 0xCu);
      }
      uint64_t v11 = [(OTClique *)self ctx];
      uint64_t v13 = [v11 altDSID];
      [v4 setAltDSID:v13];
      goto LABEL_11;
    }
  }
  uint64_t v6 = [v4 altDSID];

  if (!v6) {
    goto LABEL_15;
  }
  uint64_t v7 = [v4 altDSID];
  int64_t v8 = [(OTClique *)self ctx];
  uint64_t v9 = [v8 altDSID];
  int v10 = [v7 isEqualToString:v9];

  uint64_t v11 = secLogObjForScope("octagon-account");
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (v12)
    {
      uint64_t v19 = [v4 altDSID];
      uint64_t v20 = [(OTClique *)self ctx];
      uint64_t v21 = [v20 altDSID];
      int v24 = 138412546;
      int v25 = v19;
      __int16 v26 = 2112;
      BOOL v27 = v21;
      _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "Pairing channel context configured with altDSID (%@) which does not match Clique altDSID (%@), possible issues ahead", (uint8_t *)&v24, 0x16u);
    }
    goto LABEL_14;
  }
  if (v12)
  {
    uint64_t v13 = [v4 altDSID];
    int v24 = 138412290;
    int v25 = v13;
    _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "Pairing channel context already configured with altDSID: %@", (uint8_t *)&v24, 0xCu);
LABEL_11:
  }
LABEL_14:

LABEL_15:
  os_signpost_id_t v22 = [getKCPairingChannelClass() pairingChannelAcceptor:v4];

  return v22;
}

- (id)setupPairingChannelAsInitator:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  return [(OTClique *)self setupPairingChannelAsInitiator:a3];
}

- (id)setupPairingChannelAsInitiator:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 altDSID];
  if (v5)
  {
  }
  else
  {
    uint64_t v14 = [(OTClique *)self ctx];
    unint64_t v15 = [v14 altDSID];

    if (v15)
    {
      id v16 = secLogObjForScope("octagon-account");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [(OTClique *)self ctx];
        id v18 = [v17 altDSID];
        int v24 = 138412290;
        int v25 = v18;
        _os_log_impl(&dword_18B299000, v16, OS_LOG_TYPE_DEFAULT, "Configuring pairing channel with configured altDSID: %@", (uint8_t *)&v24, 0xCu);
      }
      uint64_t v11 = [(OTClique *)self ctx];
      uint64_t v13 = [v11 altDSID];
      [v4 setAltDSID:v13];
      goto LABEL_11;
    }
  }
  uint64_t v6 = [v4 altDSID];

  if (!v6) {
    goto LABEL_15;
  }
  uint64_t v7 = [v4 altDSID];
  int64_t v8 = [(OTClique *)self ctx];
  uint64_t v9 = [v8 altDSID];
  int v10 = [v7 isEqualToString:v9];

  uint64_t v11 = secLogObjForScope("octagon-account");
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (v12)
    {
      uint64_t v19 = [v4 altDSID];
      uint64_t v20 = [(OTClique *)self ctx];
      uint64_t v21 = [v20 altDSID];
      int v24 = 138412546;
      int v25 = v19;
      __int16 v26 = 2112;
      BOOL v27 = v21;
      _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "Pairing channel context configured with altDSID (%@) which does not match Clique altDSID (%@), possible issues ahead", (uint8_t *)&v24, 0x16u);
    }
    goto LABEL_14;
  }
  if (v12)
  {
    uint64_t v13 = [v4 altDSID];
    int v24 = 138412290;
    int v25 = v13;
    _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "Pairing channel context already configured with altDSID: %@", (uint8_t *)&v24, 0xCu);
LABEL_11:
  }
LABEL_14:

LABEL_15:
  os_signpost_id_t v22 = [getKCPairingChannelClass() pairingChannelInitiator:v4];

  return v22;
}

- (BOOL)resetAndEstablish:(int64_t)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 accountSettings:(id)a7 isGuitarfish:(BOOL)a8 error:(id *)a9
{
  BOOL v11 = a6;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v42 = a4;
  id v43 = a5;
  id v44 = a7;
  unint64_t v15 = secLogObjForScope("clique-resetandestablish");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_18B299000, v15, OS_LOG_TYPE_DEFAULT, "resetAndEstablish started", buf, 2u);
  }

  id v16 = _OctagonSignpostLogSystem();
  os_signpost_id_t v17 = os_signpost_id_generate(v16);
  uint64_t v18 = mach_continuous_time();

  uint64_t v19 = _OctagonSignpostLogSystem();
  uint64_t v20 = v19;
  unint64_t v21 = v17 - 1;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v17, "ResetAndEstablish", " enableTelemetry=YES ", buf, 2u);
  }

  os_signpost_id_t v22 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)&uint8_t buf[4] = v17;
    _os_log_impl(&dword_18B299000, v22, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: ResetAndEstablish  enableTelemetry=YES ", buf, 0xCu);
  }

  unint64_t v23 = [(OTClique *)self makeOTControl:a9];
  if (v23)
  {
    uint64_t v46 = 0;
    uint64_t v47 = &v46;
    uint64_t v48 = 0x2020000000;
    char v49 = 0;
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v57 = __Block_byref_object_copy__5170;
    uint64_t v58 = __Block_byref_object_dispose__5171;
    id v59 = 0;
    int v24 = [OTControlArguments alloc];
    int v25 = [(OTClique *)self ctx];
    __int16 v26 = [(OTControlArguments *)v24 initWithConfiguration:v25];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __117__OTClique_resetAndEstablish_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_accountSettings_isGuitarfish_error___block_invoke;
    v45[3] = &unk_1E54778D0;
    v45[4] = &v46;
    void v45[5] = buf;
    LOBYTE(v41) = a8;
    [v23 resetAndEstablish:v26 resetReason:a3 idmsTargetContext:v42 idmsCuttlefishPassword:v43 notifyIdMS:v11 accountSettings:v44 isGuitarfish:v41 reply:v45];

    if (a9)
    {
      BOOL v27 = *(void **)(*(void *)&buf[8] + 40);
      if (v27) {
        *a9 = v27;
      }
    }
    uint64_t v28 = secLogObjForScope("clique-resetandestablish");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = *((unsigned __int8 *)v47 + 24);
      *(_DWORD *)long long v50 = 67109120;
      LODWORD(v51) = v29;
      _os_log_impl(&dword_18B299000, v28, OS_LOG_TYPE_DEFAULT, "establish complete: %{BOOL}d", v50, 8u);
    }

    int v30 = *((unsigned __int8 *)v47 + 24);
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v17, v18);
    int v32 = _OctagonSignpostLogSystem();
    unint64_t v33 = v32;
    if (v21 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_DWORD *)long long v50 = 67240192;
      LODWORD(v51) = v30;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v33, OS_SIGNPOST_INTERVAL_END, v17, "ResetAndEstablish", " OctagonSignpostNameResetAndEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameResetAndEstablish}d ", v50, 8u);
    }

    uint64_t v34 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long v50 = 134218496;
      os_signpost_id_t v51 = v17;
      __int16 v52 = 2048;
      double v53 = (double)Nanoseconds / 1000000000.0;
      __int16 v54 = 1026;
      int v55 = v30;
      _os_log_impl(&dword_18B299000, v34, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: ResetAndEstablish  OctagonSignpostNameResetAndEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameResetAndEstablish}d ", v50, 0x1Cu);
    }

    BOOL v35 = *((unsigned char *)v47 + 24) != 0;
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v46, 8);
  }
  else
  {
    unint64_t v36 = _OctagonSignpostGetNanoseconds(v17, v18);
    double v37 = _OctagonSignpostLogSystem();
    __int16 v38 = v37;
    if (v21 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v37))
    {
      *(void *)long long buf = 67240192;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v38, OS_SIGNPOST_INTERVAL_END, v17, "ResetAndEstablish", " OctagonSignpostNameResetAndEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameResetAndEstablish}d ", buf, 8u);
    }

    uint64_t v39 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)&uint8_t buf[4] = v17;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(double *)&buf[14] = (double)v36 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v57) = 0;
      _os_log_impl(&dword_18B299000, v39, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: ResetAndEstablish  OctagonSignpostNameResetAndEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameResetAndEstablish}d ", buf, 0x1Cu);
    }

    BOOL v35 = 0;
  }

  return v35;
}

void __117__OTClique_resetAndEstablish_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_accountSettings_isGuitarfish_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = secLogObjForScope("clique-resetandestablish");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "resetAndEstablish returned an error: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3 == 0;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (BOOL)establish:(id *)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  uint64_t v5 = secLogObjForScope("clique-establish");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, "establish started", buf, 2u);
  }

  uint64_t v6 = _OctagonSignpostLogSystem();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);
  uint64_t v8 = mach_continuous_time();

  uint64_t v9 = _OctagonSignpostLogSystem();
  int v10 = v9;
  unint64_t v11 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Establish", " enableTelemetry=YES ", buf, 2u);
  }

  BOOL v12 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)&uint8_t buf[4] = v7;
    _os_log_impl(&dword_18B299000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: Establish  enableTelemetry=YES ", buf, 0xCu);
  }

  uint64_t v13 = [(OTClique *)self makeOTControl:a3];
  if (!v13)
  {
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v7, v8);
    unint64_t v23 = _OctagonSignpostLogSystem();
    int v24 = v23;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)&uint8_t buf[4] = 0;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v24, OS_SIGNPOST_INTERVAL_END, v7, "Establish", " OctagonSignpostNameEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameEstablish}d ", buf, 8u);
    }

    id v16 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(double *)&buf[14] = (double)Nanoseconds / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v57) = 0;
      _os_log_impl(&dword_18B299000, v16, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: Establish  OctagonSignpostNameEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameEstablish}d ", buf, 0x1Cu);
    }
    goto LABEL_25;
  }
  id v45 = 0;
  int64_t v14 = [(OTClique *)self fetchCliqueStatus:&v45];
  unint64_t v15 = v45;
  if (v15)
  {
    id v16 = v15;
    os_signpost_id_t v17 = secLogObjForScope("clique-establish");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v16;
      _os_log_impl(&dword_18B299000, v17, OS_LOG_TYPE_DEFAULT, "fetching clique status failed: %@", buf, 0xCu);
    }

    if (a3) {
      *a3 = v16;
    }
    unint64_t v18 = _OctagonSignpostGetNanoseconds(v7, v8);
    uint64_t v19 = _OctagonSignpostLogSystem();
    uint64_t v20 = v19;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)&uint8_t buf[4] = 0;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v20, OS_SIGNPOST_INTERVAL_END, v7, "Establish", " OctagonSignpostNameEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameEstablish}d ", buf, 8u);
    }

    unint64_t v21 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(double *)&buf[14] = (double)v18 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v57) = 0;
      _os_log_impl(&dword_18B299000, v21, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: Establish  OctagonSignpostNameEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameEstablish}d ", buf, 0x1Cu);
    }

LABEL_25:
    BOOL v25 = 0;
    goto LABEL_26;
  }
  if (v14 == 3)
  {
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v57 = __Block_byref_object_copy__5170;
    uint64_t v58 = __Block_byref_object_dispose__5171;
    id v59 = 0;
    BOOL v27 = [OTControlArguments alloc];
    uint64_t v28 = [(OTClique *)self ctx];
    int v29 = [(OTControlArguments *)v27 initWithConfiguration:v28];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __22__OTClique_establish___block_invoke;
    v44[3] = &unk_1E54778D0;
    void v44[4] = &v46;
    v44[5] = buf;
    [v13 establish:v29 reply:v44];

    if (a3)
    {
      int v30 = *(void **)(*(void *)&buf[8] + 40);
      if (v30) {
        *a3 = v30;
      }
    }
    uint64_t v31 = secLogObjForScope("clique-establish");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = *((unsigned __int8 *)v47 + 24);
      *(_DWORD *)long long v50 = 67109120;
      LODWORD(v51) = v32;
      _os_log_impl(&dword_18B299000, v31, OS_LOG_TYPE_DEFAULT, "establish complete: %{BOOL}d", v50, 8u);
    }

    int v33 = *((unsigned __int8 *)v47 + 24);
    unint64_t v34 = _OctagonSignpostGetNanoseconds(v7, v8);
    BOOL v35 = _OctagonSignpostLogSystem();
    unint64_t v36 = v35;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      *(_DWORD *)long long v50 = 67240192;
      LODWORD(v51) = v33;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v36, OS_SIGNPOST_INTERVAL_END, v7, "Establish", " OctagonSignpostNameEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameEstablish}d ", v50, 8u);
    }

    double v37 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long v50 = 134218496;
      os_signpost_id_t v51 = v7;
      __int16 v52 = 2048;
      double v53 = (double)v34 / 1000000000.0;
      __int16 v54 = 1026;
      int v55 = v33;
      _os_log_impl(&dword_18B299000, v37, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: Establish  OctagonSignpostNameEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameEstablish}d ", v50, 0x1Cu);
    }

    BOOL v25 = *((unsigned char *)v47 + 24) != 0;
    _Block_object_dispose(buf, 8);

    id v16 = 0;
  }
  else
  {
    __int16 v38 = secLogObjForScope("clique-establish");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(v14 + 1) > 5) {
        uint64_t v39 = @"CliqueStatusIn";
      }
      else {
        uint64_t v39 = off_1E5477BD0[v14 + 1];
      }
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v39;
      _os_log_impl(&dword_18B299000, v38, OS_LOG_TYPE_DEFAULT, "clique status is %@; performing no Octagon actions",
        buf,
        0xCu);
    }

    unint64_t v40 = _OctagonSignpostGetNanoseconds(v7, v8);
    uint64_t v41 = _OctagonSignpostLogSystem();
    id v42 = v41;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)&uint8_t buf[4] = 0;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v42, OS_SIGNPOST_INTERVAL_END, v7, "Establish", " OctagonSignpostNameEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameEstablish}d ", buf, 8u);
    }

    id v43 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(double *)&buf[14] = (double)v40 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v57) = 0;
      _os_log_impl(&dword_18B299000, v43, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: Establish  OctagonSignpostNameEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameEstablish}d ", buf, 0x1Cu);
    }

    id v16 = 0;
    BOOL v25 = 1;
  }
LABEL_26:

  _Block_object_dispose(&v46, 8);
  return v25;
}

void __22__OTClique_establish___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = secLogObjForScope("clique-establish");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "establish returned an error: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3 == 0;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (id)makeOTControl:(id *)a3
{
  id v4 = [(OTClique *)self ctx];
  uint64_t v5 = [v4 makeOTControl:a3];

  return v5;
}

- (id)cliqueMemberIdentifier:(id *)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  uint64_t v59 = 0;
  uint64_t v60 = &v59;
  uint64_t v61 = 0x3032000000;
  uint64_t v62 = __Block_byref_object_copy__5170;
  v63 = __Block_byref_object_dispose__5171;
  id v64 = 0;
  id v4 = _OctagonSignpostLogSystem();
  os_signpost_id_t spid = os_signpost_id_generate(v4);
  uint64_t v49 = mach_continuous_time();

  uint64_t v5 = _OctagonSignpostLogSystem();
  uint64_t v6 = v5;
  unint64_t v48 = spid - 1;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v6, OS_SIGNPOST_INTERVAL_BEGIN, spid, "FetchEgoPeer", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  int v7 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = spid;
    _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchEgoPeer  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  id v50 = objc_alloc((Class)getAAFAnalyticsEventSecurityClass());
  __int16 v52 = [(OTClique *)self ctx];
  id v8 = [v52 altDSID];
  uint64_t v9 = [(OTClique *)self ctx];
  int v10 = [v9 flowID];
  unint64_t v11 = [(OTClique *)self ctx];
  BOOL v12 = [v11 deviceSessionID];
  *(void *)uint64_t v70 = 0;
  *(void *)&v70[8] = v70;
  *(void *)&v70[16] = 0x2020000000;
  uint64_t v13 = (id *)getkSecurityRTCEventNameCliqueMemberIdentifierSymbolLoc_ptr;
  uint64_t v71 = getkSecurityRTCEventNameCliqueMemberIdentifierSymbolLoc_ptr;
  if (!getkSecurityRTCEventNameCliqueMemberIdentifierSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v66 = (uint64_t)__getkSecurityRTCEventNameCliqueMemberIdentifierSymbolLoc_block_invoke;
    __int16 v67 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E5484FA0;
    double v68 = (void (*)(uint64_t))v70;
    int64_t v14 = KeychainCircleLibrary();
    unint64_t v15 = dlsym(v14, "kSecurityRTCEventNameCliqueMemberIdentifier");
    *(void *)(*((void *)v68 + 1) + 24) = v15;
    getkSecurityRTCEventNameCliqueMemberIdentifierSymbolLoc_ptr = *(void *)(*((void *)v68 + 1) + 24);
    uint64_t v13 = *(id **)(*(void *)&v70[8] + 24);
  }
  _Block_object_dispose(v70, 8);
  if (!v13)
  {
    id v44 = [MEMORY[0x1E4F28B00] currentHandler];
    id v45 = [NSString stringWithUTF8String:"NSString *getkSecurityRTCEventNameCliqueMemberIdentifier(void)"];
    objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, @"OTClique.m", 73, @"%s", dlerror());

    __break(1u);
  }
  id v16 = *v13;
  os_signpost_id_t v17 = [(OTClique *)self ctx];
  uint64_t v18 = [v17 testsEnabled];
  uint64_t v19 = getkSecurityRTCEventCategoryAccountDataAccessRecovery();
  LOBYTE(v46) = 1;
  os_signpost_id_t v51 = (void *)[v50 initWithKeychainCircleMetrics:0 altDSID:v8 flowID:v10 deviceSessionID:v12 eventName:v16 testsAreEnabled:v18 canSendMetrics:v46 category:v19];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v66 = 0x3032000000;
  __int16 v67 = __Block_byref_object_copy__5170;
  double v68 = __Block_byref_object_dispose__5171;
  id v69 = 0;
  id obj = 0;
  uint64_t v20 = [(OTClique *)self makeOTControl:&obj];
  objc_storeStrong(&v69, obj);
  if (v20)
  {
    unint64_t v21 = [OTControlArguments alloc];
    os_signpost_id_t v22 = [(OTClique *)self ctx];
    unint64_t v23 = [(OTControlArguments *)v21 initWithConfiguration:v22];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __35__OTClique_cliqueMemberIdentifier___block_invoke;
    v54[3] = &unk_1E54778A8;
    p_long long buf = &buf;
    id v55 = v51;
    uint64_t v57 = &v59;
    [v20 fetchEgoPeerID:v23 reply:v54];

    int v24 = *(void **)(*((void *)&buf + 1) + 40);
    if (v24)
    {
      if (a3) {
        *a3 = v24;
      }
      unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(spid, v49);
      __int16 v26 = _OctagonSignpostLogSystem();
      BOOL v27 = v26;
      if (v48 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(void *)uint64_t v70 = 67240192;
        _os_signpost_emit_with_name_impl(&dword_18B299000, v27, OS_SIGNPOST_INTERVAL_END, spid, "FetchEgoPeer", " OctagonSignpostNameFetchEgoPeer=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEgoPeer}d ", v70, 8u);
      }

      uint64_t v28 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v70 = 134218496;
        *(void *)&v70[4] = spid;
        *(_WORD *)&v70[12] = 2048;
        *(double *)&v70[14] = (double)Nanoseconds / 1000000000.0;
        *(_WORD *)&v70[22] = 1026;
        LODWORD(v71) = 0;
        _os_log_impl(&dword_18B299000, v28, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchEgoPeer  OctagonSignpostNameFetchEgoPeer=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEgoPeer}d ", v70, 0x1Cu);
      }

      id v29 = 0;
    }
    else
    {
      unint64_t v36 = secLogObjForScope("clique");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v37 = v60[5];
        *(_DWORD *)uint64_t v70 = 138412290;
        *(void *)&v70[4] = v37;
        _os_log_impl(&dword_18B299000, v36, OS_LOG_TYPE_DEFAULT, "cliqueMemberIdentifier complete: %@", v70, 0xCu);
      }

      uint64_t v38 = v60[5];
      unint64_t v39 = _OctagonSignpostGetNanoseconds(spid, v49);
      unint64_t v40 = _OctagonSignpostLogSystem();
      uint64_t v41 = v40;
      if (v48 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
      {
        *(_DWORD *)uint64_t v70 = 67240192;
        *(_DWORD *)&v70[4] = v38 != 0;
        _os_signpost_emit_with_name_impl(&dword_18B299000, v41, OS_SIGNPOST_INTERVAL_END, spid, "FetchEgoPeer", " OctagonSignpostNameFetchEgoPeer=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEgoPeer}d ", v70, 8u);
      }

      id v42 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v70 = 134218496;
        *(void *)&v70[4] = spid;
        *(_WORD *)&v70[12] = 2048;
        *(double *)&v70[14] = (double)v39 / 1000000000.0;
        *(_WORD *)&v70[22] = 1026;
        LODWORD(v71) = v38 != 0;
        _os_log_impl(&dword_18B299000, v42, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchEgoPeer  OctagonSignpostNameFetchEgoPeer=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEgoPeer}d ", v70, 0x1Cu);
      }

      id v29 = (id)v60[5];
    }
  }
  else
  {
    int v30 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)uint64_t v70 = 138412290;
      *(void *)&v70[4] = v31;
      _os_log_impl(&dword_18B299000, v30, OS_LOG_TYPE_DEFAULT, "octagon: Failed to create OTControl: %@", v70, 0xCu);
    }

    unint64_t v32 = _OctagonSignpostGetNanoseconds(spid, v49);
    int v33 = _OctagonSignpostLogSystem();
    unint64_t v34 = v33;
    if (v48 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      *(void *)uint64_t v70 = 67240192;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v34, OS_SIGNPOST_INTERVAL_END, spid, "FetchEgoPeer", " OctagonSignpostNameFetchEgoPeer=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEgoPeer}d ", v70, 8u);
    }

    BOOL v35 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v70 = 134218496;
      *(void *)&v70[4] = spid;
      *(_WORD *)&v70[12] = 2048;
      *(double *)&v70[14] = (double)v32 / 1000000000.0;
      *(_WORD *)&v70[22] = 1026;
      LODWORD(v71) = 0;
      _os_log_impl(&dword_18B299000, v35, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchEgoPeer  OctagonSignpostNameFetchEgoPeer=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEgoPeer}d ", v70, 0x1Cu);
    }

    [getSecurityAnalyticsReporterRTCClass() sendMetricWithEvent:v51 success:0 error:*(void *)(*((void *)&buf + 1) + 40)];
    id v29 = 0;
  }

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v59, 8);

  return v29;
}

void __35__OTClique_cliqueMemberIdentifier___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_18B299000, v8, OS_LOG_TYPE_DEFAULT, "octagon: Failed to fetch octagon peer ID: %@", (uint8_t *)&v13, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
    id SecurityAnalyticsReporterRTCClass = getSecurityAnalyticsReporterRTCClass();
    uint64_t v10 = a1[4];
    BOOL v11 = 0;
    id v12 = v7;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    id SecurityAnalyticsReporterRTCClass = getSecurityAnalyticsReporterRTCClass();
    uint64_t v10 = a1[4];
    BOOL v11 = v6 != 0;
    id v12 = 0;
  }
  [SecurityAnalyticsReporterRTCClass sendMetricWithEvent:v10 success:v11 error:v12];
}

- (NSString)cliqueMemberIdentifier
{
  return (NSString *)[(OTClique *)self cliqueMemberIdentifier:0];
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(OTClique *)self ctx];
  uint64_t v5 = [v4 altDSID];
  id v6 = [(OTClique *)self ctx];
  id v7 = [v6 context];
  id v8 = [(OTClique *)self cliqueMemberIdentifier];
  uint64_t v9 = [v3 stringWithFormat:@"<OTClique: altDSID:%@ contextID:%@ memberID:%@>", v5, v7, v8];

  return v9;
}

- (OTClique)initWithContextData:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)OTClique;
  uint64_t v5 = [(OTClique *)&v20 init];
  if (v5)
  {
    id v6 = objc_alloc_init(OTConfigurationContext);
    ctx = v5->_ctx;
    v5->_ctx = v6;

    uint64_t v8 = [v4 context];
    uint64_t v9 = (void *)v8;
    if (v8) {
      uint64_t v10 = v8;
    }
    else {
      uint64_t v10 = OTDefaultContext;
    }
    [(OTConfigurationContext *)v5->_ctx setContext:v10];

    BOOL v11 = [v4 containerName];
    [(OTConfigurationContext *)v5->_ctx setContainerName:v11];

    id v12 = [v4 dsid];
    int v13 = (void *)[v12 copy];
    [(OTConfigurationContext *)v5->_ctx setDsid:v13];

    id v14 = [v4 altDSID];
    uint64_t v15 = (void *)[v14 copy];
    [(OTConfigurationContext *)v5->_ctx setAltDSID:v15];

    id v16 = [v4 otControl];
    [(OTConfigurationContext *)v5->_ctx setOtControl:v16];

    os_signpost_id_t v17 = [v4 ckksControl];
    [(OTConfigurationContext *)v5->_ctx setCkksControl:v17];

    -[OTConfigurationContext setEscrowFetchSource:](v5->_ctx, "setEscrowFetchSource:", [v4 escrowFetchSource]);
    -[OTConfigurationContext setOverrideForSetupAccountScript:](v5->_ctx, "setOverrideForSetupAccountScript:", [v4 overrideForSetupAccountScript]);
    uint64_t v18 = [v4 sbd];
    [(OTConfigurationContext *)v5->_ctx setSbd:v18];
  }
  return v5;
}

+ (BOOL)performCKServerUnreadableDataRemoval:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v16 = 0;
  id v6 = [v5 makeOTControl:&v16];
  id v7 = v16;
  if (v6)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__5170;
    objc_super v20 = __Block_byref_object_dispose__5171;
    id v21 = 0;
    uint64_t v8 = [[OTControlArguments alloc] initWithConfiguration:v5];
    uint64_t v9 = [v5 isGuitarfish];
    uint64_t v10 = [v5 altDSID];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__OTClique_performCKServerUnreadableDataRemoval_error___block_invoke;
    v15[3] = &unk_1E5481470;
    v15[4] = &buf;
    [v6 performCKServerUnreadableDataRemoval:v8 isGuitarfish:v9 altDSID:v10 reply:v15];

    BOOL v11 = *(void **)(*((void *)&buf + 1) + 40);
    BOOL v12 = v11 == 0;
    if (a4 && v11) {
      *a4 = v11;
    }
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    int v13 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_18B299000, v13, OS_LOG_TYPE_DEFAULT, "clique-perform-ckserver-unreadable-data-removal: unable to create otcontrol: %@", (uint8_t *)&buf, 0xCu);
    }

    BOOL v12 = 0;
    if (a4) {
      *a4 = v7;
    }
  }

  return v12;
}

void __55__OTClique_performCKServerUnreadableDataRemoval_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "clique-perform-ckserver-unreadable-data-removal: failed to remove data from ckserver: %@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = v3;
    id v7 = *(NSObject **)(v5 + 40);
    *(void *)(v5 + 40) = v6;
  }
  else
  {
    id v7 = secLogObjForScope("clique-perform-ckserver-unreadable-data-removal");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, "removed unreadable data from ckserver", (uint8_t *)&v8, 2u);
    }
  }
}

+ (BOOL)clearCliqueFromAccount:(id)a3 error:(id *)a4
{
  v45[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (+[OTClique isCloudServicesAvailable])
  {
    id v36 = 0;
    unint64_t v34 = [v5 makeOTControl:&v36];
    id v33 = v36;
    if (!v34)
    {
      id v9 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v33;
        _os_log_impl(&dword_18B299000, v9, OS_LOG_TYPE_DEFAULT, "clique-reset-account-data: unable to create otcontrol: %@", (uint8_t *)&buf, 0xCu);
      }

      BOOL v8 = 0;
      if (a4) {
        *a4 = v33;
      }
      goto LABEL_37;
    }
    id v6 = [v5 sbd];
    id v7 = v6;
    if (v6) {
      id v32 = v6;
    }
    else {
      id v32 = objc_alloc_init((Class)getSecureBackupClass());
    }

    uint64_t v10 = [v5 authenticationAppleID];
    BOOL v11 = v10 == 0;

    if (v11)
    {
      id v21 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        int v24 = "clique-reset-account-data: authenticationAppleID not set on configuration context";
LABEL_24:
        _os_log_impl(&dword_18B299000, v21, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&buf, 2u);
      }
    }
    else
    {
      BOOL v12 = [v5 passwordEquivalentToken];
      BOOL v13 = v12 == 0;

      if (!v13)
      {
        id v14 = getkSecureBackupAuthenticationAppleID();
        v44[0] = v14;
        uint64_t v15 = [v5 authenticationAppleID];
        v45[0] = v15;
        id v16 = getkSecureBackupAuthenticationPassword();
        v44[1] = v16;
        os_signpost_id_t v17 = [v5 passwordEquivalentToken];
        v45[1] = v17;
        uint64_t v18 = getkSecureBackupiCloudDataProtectionDeleteAllRecordsKey();
        v44[2] = v18;
        uint64_t v19 = MEMORY[0x1E4F1CC38];
        v45[2] = MEMORY[0x1E4F1CC38];
        objc_super v20 = getkSecureBackupContainsiCDPDataKey();
        v44[3] = v20;
        v45[3] = v19;
        id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:4];

        uint64_t v22 = [v32 disableWithInfo:v21];
        if (v22)
        {
          unint64_t v23 = secLogObjForScope("SecError");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v22;
            _os_log_impl(&dword_18B299000, v23, OS_LOG_TYPE_DEFAULT, "clique-reset-account-data: secure backup escrow record deletion failed: %@", (uint8_t *)&buf, 0xCu);
          }

          BOOL v8 = 0;
          if (a4) {
            *a4 = v22;
          }
        }
        else
        {
          BOOL v25 = secLogObjForScope("clique-reset-account-data");
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_18B299000, v25, OS_LOG_TYPE_DEFAULT, "sbd disableWithInfo succeeded", (uint8_t *)&buf, 2u);
          }

          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v40 = 0x3032000000;
          uint64_t v41 = __Block_byref_object_copy__5170;
          id v42 = __Block_byref_object_dispose__5171;
          id v43 = 0;
          __int16 v26 = [[OTControlArguments alloc] initWithConfiguration:v5];
          uint64_t v27 = [v5 isGuitarfish];
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __41__OTClique_clearCliqueFromAccount_error___block_invoke;
          v35[3] = &unk_1E5481470;
          v35[4] = &buf;
          [v34 clearCliqueFromAccount:v26 resetReason:1 isGuitarfish:v27 reply:v35];

          uint64_t v28 = *(void *)(*((void *)&buf + 1) + 40);
          BOOL v8 = v28 == 0;
          if (v28)
          {
            id v29 = secLogObjForScope("SecError");
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v30 = *(void *)(*((void *)&buf + 1) + 40);
              *(_DWORD *)uint64_t v37 = 138412290;
              uint64_t v38 = v30;
              _os_log_impl(&dword_18B299000, v29, OS_LOG_TYPE_DEFAULT, "clique-reset-account-data: account reset failed: %@", v37, 0xCu);
            }

            if (a4) {
              *a4 = *(id *)(*((void *)&buf + 1) + 40);
            }
          }
          _Block_object_dispose(&buf, 8);
        }
        goto LABEL_36;
      }
      id v21 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        int v24 = "clique-reset-account-data: passwordEquivalentToken not set on configuration context";
        goto LABEL_24;
      }
    }
    BOOL v8 = 0;
LABEL_36:

LABEL_37:
    goto LABEL_38;
  }
  if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-4 userInfo:0];
    BOOL v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v8 = 0;
  }
LABEL_38:

  return v8;
}

void __41__OTClique_clearCliqueFromAccount_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "clique-reset-account-data: failed to reset: %@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = v3;
    id v7 = *(NSObject **)(v5 + 40);
    *(void *)(v5 + 40) = v6;
  }
  else
  {
    id v7 = secLogObjForScope("clique-reset-account-data");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, "reset octagon", (uint8_t *)&v8, 2u);
    }
  }
}

+ (id)resetProtectedData:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 error:(id *)a7
{
  BOOL v61 = a6;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v64 = a4;
  id v11 = a5;
  if (+[OTClique isCloudServicesAvailable])
  {
    id v67 = 0;
    v63 = [v10 makeOTControl:&v67];
    id v62 = v67;
    if (!v63)
    {
      id v16 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v62;
        _os_log_impl(&dword_18B299000, v16, OS_LOG_TYPE_DEFAULT, "clique-reset-protected-data: unable to create otcontrol: %@", (uint8_t *)&buf, 0xCu);
      }

      uint64_t v15 = 0;
      if (a7) {
        *a7 = v62;
      }
      goto LABEL_59;
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v75 = 0x3032000000;
    v76 = __Block_byref_object_copy__5170;
    v77 = __Block_byref_object_dispose__5171;
    id v78 = 0;
    BOOL v12 = [[OTControlArguments alloc] initWithConfiguration:v10];
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __89__OTClique_resetProtectedData_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_error___block_invoke;
    v66[3] = &unk_1E5477B50;
    v66[4] = &buf;
    [v63 fetchAccountWideSettingsWithForceFetch:1 arguments:v12 reply:v66];

    BOOL v13 = [v10 sbd];
    id v14 = v13;
    if (v13) {
      id v60 = v13;
    }
    else {
      id v60 = objc_alloc_init((Class)getSecureBackupClass());
    }

    os_signpost_id_t v17 = [v10 authenticationAppleID];
    BOOL v18 = v17 == 0;

    if (v18)
    {
      id v42 = secLogObjForScope("SecError");
      uint64_t v59 = v42;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v79) = 0;
        id v43 = "clique-reset-protected-data: authenticationAppleID not set on configuration context";
LABEL_28:
        _os_log_impl(&dword_18B299000, v42, OS_LOG_TYPE_DEFAULT, v43, (uint8_t *)&v79, 2u);
      }
    }
    else
    {
      uint64_t v19 = [v10 passwordEquivalentToken];
      BOOL v20 = v19 == 0;

      if (!v20)
      {
        id v21 = objc_alloc((Class)getAAFAnalyticsEventSecurityClass());
        uint64_t v22 = [v10 altDSID];
        unint64_t v23 = [v10 flowID];
        int v24 = [v10 deviceSessionID];
        CFTypeRef cf = 0;
        p_CFTypeRef cf = &cf;
        uint64_t v70 = 0x2020000000;
        BOOL v25 = (id *)getkSecurityRTCEventNameRPDDeleteAllRecordsSymbolLoc_ptr;
        uint64_t v71 = getkSecurityRTCEventNameRPDDeleteAllRecordsSymbolLoc_ptr;
        if (!getkSecurityRTCEventNameRPDDeleteAllRecordsSymbolLoc_ptr)
        {
          *(void *)&long long v79 = MEMORY[0x1E4F143A8];
          *((void *)&v79 + 1) = 3221225472;
          v80 = __getkSecurityRTCEventNameRPDDeleteAllRecordsSymbolLoc_block_invoke;
          v81 = &unk_1E5484FA0;
          v82 = &cf;
          __int16 v26 = KeychainCircleLibrary();
          uint64_t v27 = dlsym(v26, "kSecurityRTCEventNameRPDDeleteAllRecords");
          *((void *)v82[1] + 3) = v27;
          getkSecurityRTCEventNameRPDDeleteAllRecordsSymbolLoc_ptr = *((void *)v82[1] + 3);
          BOOL v25 = (id *)p_cf[3];
        }
        _Block_object_dispose(&cf, 8);
        if (!v25)
        {
          uint64_t v56 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v57 = [NSString stringWithUTF8String:"NSString *getkSecurityRTCEventNameRPDDeleteAllRecords(void)"];
          objc_msgSend(v56, "handleFailureInFunction:file:lineNumber:description:", v57, @"OTClique.m", 75, @"%s", dlerror());

          __break(1u);
        }
        id v28 = *v25;
        uint64_t v29 = [v10 testsEnabled];
        uint64_t v30 = getkSecurityRTCEventCategoryAccountDataAccessRecovery();
        LOBYTE(v58) = 1;
        uint64_t v59 = [v21 initWithKeychainCircleMetrics:0 altDSID:v22 flowID:v23 deviceSessionID:v24 eventName:v28 testsAreEnabled:v29 canSendMetrics:v58 category:v30];

        uint64_t v31 = getkSecureBackupAuthenticationAppleID();
        v72[0] = v31;
        id v32 = [v10 authenticationAppleID];
        v73[0] = v32;
        id v33 = getkSecureBackupAuthenticationPassword();
        v72[1] = v33;
        unint64_t v34 = [v10 passwordEquivalentToken];
        v73[1] = v34;
        BOOL v35 = getkSecureBackupiCloudDataProtectionDeleteAllRecordsKey();
        v72[2] = v35;
        uint64_t v36 = MEMORY[0x1E4F1CC38];
        v73[2] = MEMORY[0x1E4F1CC38];
        uint64_t v37 = getkSecureBackupContainsiCDPDataKey();
        v72[3] = v37;
        v73[3] = v36;
        uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:4];

        unint64_t v39 = [v60 disableWithInfo:v38];
        if (v39)
        {
          uint64_t v40 = secLogObjForScope("SecError");
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v79) = 138412290;
            *(void *)((char *)&v79 + 4) = v39;
            _os_log_impl(&dword_18B299000, v40, OS_LOG_TYPE_DEFAULT, "clique-reset-protected-data: secure backup escrow record deletion failed: %@", (uint8_t *)&v79, 0xCu);
          }

          if (a7) {
            *a7 = v39;
          }
          [getSecurityAnalyticsReporterRTCClass() sendMetricWithEvent:v59 success:0 error:v39];
          id v41 = 0;
          uint64_t v15 = 0;
LABEL_57:

          goto LABEL_58;
        }
        id v44 = secLogObjForScope("clique-reset-protected-data");
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v79) = 0;
          _os_log_impl(&dword_18B299000, v44, OS_LOG_TYPE_DEFAULT, "sbd disableWithInfo succeeded", (uint8_t *)&v79, 2u);
        }

        [getSecurityAnalyticsReporterRTCClass() sendMetricWithEvent:v59 success:1 error:0];
        if (SOSCCIsSOSTrustAndSyncingEnabledCachedValue())
        {
          CFTypeRef cf = 0;
          char v45 = SOSCCResetToOffering(&cf);
          if (cf) {
            char v46 = 0;
          }
          else {
            char v46 = v45;
          }
          if ((v46 & 1) == 0)
          {
            unint64_t v48 = secLogObjForScope("SecError");
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v79) = 138412290;
              *(void *)((char *)&v79 + 4) = cf;
              _os_log_impl(&dword_18B299000, v48, OS_LOG_TYPE_DEFAULT, "clique-reset-protected-data: sos reset failed: %@, ignoring error and continuing with reset", (uint8_t *)&v79, 0xCu);
            }

            CFTypeRef v49 = cf;
            if (cf)
            {
              CFTypeRef cf = 0;
              CFRelease(v49);
            }
            goto LABEL_48;
          }
          uint64_t v47 = secLogObjForScope("clique-reset-protected-data");
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v79) = 0;
            _os_log_impl(&dword_18B299000, v47, OS_LOG_TYPE_DEFAULT, "sos reset succeeded", (uint8_t *)&v79, 2u);
          }
        }
        else
        {
          uint64_t v47 = secLogObjForScope("clique-reset-protected-data");
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v79) = 0;
            _os_log_impl(&dword_18B299000, v47, OS_LOG_TYPE_DEFAULT, "platform does not support sos", (uint8_t *)&v79, 2u);
          }
        }

LABEL_48:
        id v50 = [[OTClique alloc] initWithContextData:v10];
        uint64_t v51 = *(void *)(*((void *)&buf + 1) + 40);
        id v65 = 0;
        -[OTClique resetAndEstablish:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:isGuitarfish:error:](v50, "resetAndEstablish:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:isGuitarfish:error:", 1, v64, v11, v61, v51, [v10 isGuitarfish], &v65);
        id v41 = v65;
        if (v41)
        {
          __int16 v52 = secLogObjForScope("SecError");
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v79) = 138412290;
            *(void *)((char *)&v79 + 4) = v41;
            _os_log_impl(&dword_18B299000, v52, OS_LOG_TYPE_DEFAULT, "clique-reset-protected-data: account reset failed: %@", (uint8_t *)&v79, 0xCu);
          }

          uint64_t v15 = 0;
          if (a7) {
            *a7 = v41;
          }
        }
        else
        {
          double v53 = secLogObjForScope("clique-reset-protected-data");
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v79) = 0;
            _os_log_impl(&dword_18B299000, v53, OS_LOG_TYPE_DEFAULT, "Octagon account reset succeeded", (uint8_t *)&v79, 2u);
          }

          __int16 v54 = [MEMORY[0x1E4F28C40] defaultCenter];
          [v54 postNotificationName:@"com.apple.security.resetprotecteddata.complete" object:0 userInfo:0 deliverImmediately:1];

          uint64_t v15 = v50;
        }

        goto LABEL_57;
      }
      id v42 = secLogObjForScope("SecError");
      uint64_t v59 = v42;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v79) = 0;
        id v43 = "clique-reset-protected-data: passwordEquivalentToken not set on configuration context";
        goto LABEL_28;
      }
    }
    id v41 = 0;
    uint64_t v15 = 0;
LABEL_58:

    _Block_object_dispose(&buf, 8);
LABEL_59:

    goto LABEL_60;
  }
  if (a7)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-4 userInfo:0];
    uint64_t v15 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v15 = 0;
  }
LABEL_60:

  return v15;
}

void __89__OTClique_resetProtectedData_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, "clique-reset-protected-data: failed to fetch account settings: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    int v8 = secLogObjForScope("clique-reset-protected-data");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_18B299000, v8, OS_LOG_TYPE_DEFAULT, "fetched account settings: %@", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    id v10 = v5;
    id v7 = *(NSObject **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }
}

+ (id)resetProtectedData:(id)a3 error:(id *)a4
{
  return +[OTClique resetProtectedData:a3 idmsTargetContext:0 idmsCuttlefishPassword:0 notifyIdMS:0 error:a4];
}

+ (int64_t)getCDPStatus:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v18 = 0;
  id v6 = [v5 makeOTControl:&v18];
  id v7 = v18;
  if (v6)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v20 = 0x3032000000;
    id v21 = __Block_byref_object_copy__5170;
    uint64_t v22 = __Block_byref_object_dispose__5171;
    id v23 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 0;
    int v8 = [[OTControlArguments alloc] initWithConfiguration:v5];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __31__OTClique_getCDPStatus_error___block_invoke;
    v13[3] = &unk_1E54778F8;
    v13[4] = &buf;
    v13[5] = &v14;
    [v6 getCDPStatus:v8 reply:v13];

    if (a4)
    {
      uint64_t v9 = *(void **)(*((void *)&buf + 1) + 40);
      if (v9) {
        *a4 = v9;
      }
    }
    int64_t v10 = v15[3];
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    int v11 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "octagon-cdp-status: failed to fetch OTControl object: %@", (uint8_t *)&buf, 0xCu);
    }

    int64_t v10 = 0;
    if (a4) {
      *a4 = v7;
    }
  }

  return v10;
}

void __31__OTClique_getCDPStatus_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = secLogObjForScope("octagon-cdp-status");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, "failed to fetch CDP status: %@", (uint8_t *)&v11, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  else
  {
    if (v8)
    {
      uint64_t v9 = @"unknown";
      if (a2 == 1) {
        uint64_t v9 = @"disabled";
      }
      if (a2 == 2) {
        uint64_t v9 = @"enabled";
      }
      int64_t v10 = v9;
      int v11 = 138412290;
      id v12 = v10;
      _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, "successfully fetched CDP status as %@", (uint8_t *)&v11, 0xCu);
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

+ (BOOL)setCDPEnabled:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v14 = 0;
  id v6 = [v5 makeOTControl:&v14];
  id v7 = v14;
  if (v6)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy__5170;
    id v18 = __Block_byref_object_dispose__5171;
    id v19 = 0;
    BOOL v8 = [[OTControlArguments alloc] initWithConfiguration:v5];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __32__OTClique_setCDPEnabled_error___block_invoke;
    v13[3] = &unk_1E5481470;
    v13[4] = &buf;
    [v6 setCDPEnabled:v8 reply:v13];

    uint64_t v9 = *(void **)(*((void *)&buf + 1) + 40);
    if (a4 && v9)
    {
      *a4 = v9;
      uint64_t v9 = *(void **)(*((void *)&buf + 1) + 40);
    }
    BOOL v10 = v9 == 0;
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    int v11 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "octagon-setcdpenabled: failed to fetch OTControl object: %@", (uint8_t *)&buf, 0xCu);
    }

    BOOL v10 = 0;
    if (a4) {
      *a4 = v7;
    }
  }

  return v10;
}

void __32__OTClique_setCDPEnabled_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = secLogObjForScope("octagon-setcdpenabled");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "failed to set CDP bit: %@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = v3;
    id v4 = *(NSObject **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else if (v5)
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "successfully set CDP bit", (uint8_t *)&v8, 2u);
  }
}

+ (void)createInheritanceKey:(id)a3 uuid:(id)a4 claimTokenData:(id)a5 wrappingKeyData:(id)a6 reply:(id)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v33 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = secLogObjForScope("octagon-createinheritancekeyclaimtokenwrappingkey");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v11 context];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v16;
    _os_log_impl(&dword_18B299000, v15, OS_LOG_TYPE_DEFAULT, "createInheritanceKey w/claimToken+wrappingKey invoked for context: %@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v17 = _OctagonSignpostLogSystem();
  os_signpost_id_t v18 = os_signpost_id_generate(v17);
  uint64_t v19 = mach_continuous_time();

  uint64_t v20 = _OctagonSignpostLogSystem();
  id v21 = v20;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v18, "CreateInheritanceKeyWithClaimTokenAndWrappingKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  uint64_t v22 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v18;
    _os_log_impl(&dword_18B299000, v22, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CreateInheritanceKeyWithClaimTokenAndWrappingKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v47 = 0x2020000000;
  char v48 = 0;
  id v39 = 0;
  id v23 = [v11 makeOTControl:&v39];
  id v24 = v39;
  if (v23)
  {
    BOOL v25 = [[OTControlArguments alloc] initWithConfiguration:v11];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __75__OTClique_createInheritanceKey_uuid_claimTokenData_wrappingKeyData_reply___block_invoke;
    v34[3] = &unk_1E5477B00;
    os_signpost_id_t v37 = v18;
    uint64_t v38 = v19;
    p_long long buf = &buf;
    id v35 = v14;
    [v23 createInheritanceKey:v25 uuid:v33 claimTokenData:v12 wrappingKeyData:v13 reply:v34];
  }
  else
  {
    __int16 v26 = secLogObjForScope("octagon-createinheritancekeyclaimtokenwrappingkey");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v40 = 138412290;
      os_signpost_id_t v41 = (os_signpost_id_t)v24;
      _os_log_impl(&dword_18B299000, v26, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v40, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v18, v19);
    id v28 = _OctagonSignpostLogSystem();
    uint64_t v29 = v28;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      int v30 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      *(_DWORD *)uint64_t v40 = 67240192;
      LODWORD(v41) = v30;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v29, OS_SIGNPOST_INTERVAL_END, v18, "CreateInheritanceKeyWithClaimTokenAndWrappingKey", " OctagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey}d ", v40, 8u);
    }

    uint64_t v31 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v40 = 134218496;
      int v32 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      os_signpost_id_t v41 = v18;
      __int16 v42 = 2048;
      double v43 = (double)Nanoseconds / 1000000000.0;
      __int16 v44 = 1026;
      int v45 = v32;
      _os_log_impl(&dword_18B299000, v31, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CreateInheritanceKeyWithClaimTokenAndWrappingKey  OctagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey}d ", v40, 0x1Cu);
    }

    (*((void (**)(id, void, id))v14 + 2))(v14, 0, v24);
  }

  _Block_object_dispose(&buf, 8);
}

void __75__OTClique_createInheritanceKey_uuid_claimTokenData_wrappingKeyData_reply___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, "octagon-createinheritancekeyclaimtokenwrappingkey, failed to create octagon inheritance recovery key (w/claim+wrappingkey)", (uint8_t *)&v22, 2u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    id v9 = _OctagonSignpostLogSystem();
    uint64_t v10 = v9;
    os_signpost_id_t v11 = a1[6];
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      int v12 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v22 = 67240192;
      LODWORD(v23) = v12;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v10, OS_SIGNPOST_INTERVAL_END, v11, "CreateInheritanceKeyWithClaimTokenAndWrappingKey", " OctagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey}d ", (uint8_t *)&v22, 8u);
    }

    id v13 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v14 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)Nanoseconds / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v14;
      _os_log_impl(&dword_18B299000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CreateInheritanceKeyWithClaimTokenAndWrappingKey  OctagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey}d ", (uint8_t *)&v22, 0x1Cu);
    }
  }
  else
  {
    uint64_t v15 = secLogObjForScope("octagon-createinheritancekeyclaimtokenwrappingkey");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18B299000, v15, OS_LOG_TYPE_DEFAULT, "successfully created octagon inheritance recovery key (w/claim+wrappingkey)", (uint8_t *)&v22, 2u);
    }

    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    unint64_t v16 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    uint64_t v17 = _OctagonSignpostLogSystem();
    os_signpost_id_t v18 = v17;
    os_signpost_id_t v19 = a1[6];
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      int v20 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v22 = 67240192;
      LODWORD(v23) = v20;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v18, OS_SIGNPOST_INTERVAL_END, v19, "CreateInheritanceKeyWithClaimTokenAndWrappingKey", " OctagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey}d ", (uint8_t *)&v22, 8u);
    }

    id v13 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v21 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)v16 / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v21;
      _os_log_impl(&dword_18B299000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CreateInheritanceKeyWithClaimTokenAndWrappingKey  OctagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey}d ", (uint8_t *)&v22, 0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16))();
}

+ (void)recreateInheritanceKey:(id)a3 uuid:(id)a4 oldIK:(id)a5 reply:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = secLogObjForScope("octagon-recreateinheritancekey");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = [v9 context];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v14;
    _os_log_impl(&dword_18B299000, v13, OS_LOG_TYPE_DEFAULT, "recreateInheritanceKey invoked for context: %@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v15 = _OctagonSignpostLogSystem();
  os_signpost_id_t v16 = os_signpost_id_generate(v15);
  uint64_t v17 = mach_continuous_time();

  os_signpost_id_t v18 = _OctagonSignpostLogSystem();
  os_signpost_id_t v19 = v18;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v16, "RecreateInheritanceKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  int v20 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v16;
    _os_log_impl(&dword_18B299000, v20, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RecreateInheritanceKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  id v36 = 0;
  int v21 = [v9 makeOTControl:&v36];
  id v22 = v36;
  if (v21)
  {
    uint64_t v23 = [[OTControlArguments alloc] initWithConfiguration:v9];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __52__OTClique_recreateInheritanceKey_uuid_oldIK_reply___block_invoke;
    v31[3] = &unk_1E5477B00;
    os_signpost_id_t v34 = v16;
    uint64_t v35 = v17;
    p_long long buf = &buf;
    id v32 = v12;
    [v21 recreateInheritanceKey:v23 uuid:v10 oldIK:v11 reply:v31];
  }
  else
  {
    __int16 v24 = secLogObjForScope("octagon-recreateinheritancekey");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v37 = 138412290;
      os_signpost_id_t v38 = (os_signpost_id_t)v22;
      _os_log_impl(&dword_18B299000, v24, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v37, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v16, v17);
    __int16 v26 = _OctagonSignpostLogSystem();
    int v27 = v26;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      int v28 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      *(_DWORD *)os_signpost_id_t v37 = 67240192;
      LODWORD(v38) = v28;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v27, OS_SIGNPOST_INTERVAL_END, v16, "RecreateInheritanceKey", " OctagonSignpostNameRecreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecreateInheritanceKey}d ", v37, 8u);
    }

    uint64_t v29 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v37 = 134218496;
      int v30 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      os_signpost_id_t v38 = v16;
      __int16 v39 = 2048;
      double v40 = (double)Nanoseconds / 1000000000.0;
      __int16 v41 = 1026;
      int v42 = v30;
      _os_log_impl(&dword_18B299000, v29, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecreateInheritanceKey  OctagonSignpostNameRecreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecreateInheritanceKey}d ", v37, 0x1Cu);
    }

    (*((void (**)(id, void, id))v12 + 2))(v12, 0, v22);
  }

  _Block_object_dispose(&buf, 8);
}

void __52__OTClique_recreateInheritanceKey_uuid_oldIK_reply___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, "octagon-recreateinheritancekey, failed to recreate octagon inheritance recovery key", (uint8_t *)&v22, 2u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    id v9 = _OctagonSignpostLogSystem();
    id v10 = v9;
    os_signpost_id_t v11 = a1[6];
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      int v12 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v22 = 67240192;
      LODWORD(v23) = v12;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v10, OS_SIGNPOST_INTERVAL_END, v11, "RecreateInheritanceKey", " OctagonSignpostNameRecreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecreateInheritanceKey}d ", (uint8_t *)&v22, 8u);
    }

    id v13 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v14 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)Nanoseconds / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v14;
      _os_log_impl(&dword_18B299000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecreateInheritanceKey  OctagonSignpostNameRecreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecreateInheritanceKey}d ", (uint8_t *)&v22, 0x1Cu);
    }
  }
  else
  {
    uint64_t v15 = secLogObjForScope("octagon-recreateinheritancekey");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18B299000, v15, OS_LOG_TYPE_DEFAULT, "successfully recreated octagon inheritance recovery key", (uint8_t *)&v22, 2u);
    }

    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    unint64_t v16 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    uint64_t v17 = _OctagonSignpostLogSystem();
    os_signpost_id_t v18 = v17;
    os_signpost_id_t v19 = a1[6];
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      int v20 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v22 = 67240192;
      LODWORD(v23) = v20;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v18, OS_SIGNPOST_INTERVAL_END, v19, "RecreateInheritanceKey", " OctagonSignpostNameRecreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecreateInheritanceKey}d ", (uint8_t *)&v22, 8u);
    }

    id v13 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v21 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)v16 / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v21;
      _os_log_impl(&dword_18B299000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecreateInheritanceKey  OctagonSignpostNameRecreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecreateInheritanceKey}d ", (uint8_t *)&v22, 0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16))();
}

+ (void)checkInheritanceKey:(id)a3 inheritanceKeyUUID:(id)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = secLogObjForScope("octagon-checkinheritancekey");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    os_signpost_id_t v11 = [v7 context];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_18B299000, v10, OS_LOG_TYPE_DEFAULT, "checkInheritanceKey invoked for context: %@", (uint8_t *)&buf, 0xCu);
  }
  int v12 = _OctagonSignpostLogSystem();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  uint64_t v14 = mach_continuous_time();

  uint64_t v15 = _OctagonSignpostLogSystem();
  unint64_t v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v13, "CheckInheritanceKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  uint64_t v17 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_18B299000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CheckInheritanceKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  id v33 = 0;
  os_signpost_id_t v18 = [v7 makeOTControl:&v33];
  id v19 = v33;
  if (v18)
  {
    int v20 = [[OTControlArguments alloc] initWithConfiguration:v7];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __57__OTClique_checkInheritanceKey_inheritanceKeyUUID_reply___block_invoke;
    v28[3] = &unk_1E5477AD8;
    os_signpost_id_t v31 = v13;
    uint64_t v32 = v14;
    p_long long buf = &buf;
    id v29 = v9;
    [v18 checkInheritanceKey:v20 uuid:v8 reply:v28];
  }
  else
  {
    int v21 = secLogObjForScope("octagon-checkinheritancekey");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 138412290;
      os_signpost_id_t v35 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_18B299000, v21, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v34, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    uint64_t v23 = _OctagonSignpostLogSystem();
    __int16 v24 = v23;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      int v25 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      *(_DWORD *)os_signpost_id_t v34 = 67240192;
      LODWORD(v35) = v25;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v24, OS_SIGNPOST_INTERVAL_END, v13, "CheckInheritanceKey", " OctagonSignpostNameCheckInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckInheritanceKey}d ", v34, 8u);
    }

    __int16 v26 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 134218496;
      int v27 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      os_signpost_id_t v35 = v13;
      __int16 v36 = 2048;
      double v37 = (double)Nanoseconds / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = v27;
      _os_log_impl(&dword_18B299000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CheckInheritanceKey  OctagonSignpostNameCheckInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckInheritanceKey}d ", v34, 0x1Cu);
    }

    (*((void (**)(id, void, id))v9 + 2))(v9, 0, v19);
  }

  _Block_object_dispose(&buf, 8);
}

void __57__OTClique_checkInheritanceKey_inheritanceKeyUUID_reply___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, "octagon-checkinheritancekey, failed to check inheritance key", (uint8_t *)&v22, 2u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    id v7 = _OctagonSignpostLogSystem();
    id v8 = v7;
    os_signpost_id_t v9 = a1[6];
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v10 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v22 = 67240192;
      LODWORD(v23) = v10;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CheckInheritanceKey", " OctagonSignpostNameCheckInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckInheritanceKey}d ", (uint8_t *)&v22, 8u);
    }

    os_signpost_id_t v11 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v12 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)Nanoseconds / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v12;
      _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CheckInheritanceKey  OctagonSignpostNameCheckInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckInheritanceKey}d ", (uint8_t *)&v22, 0x1Cu);
    }

    os_signpost_id_t v13 = *(void (**)(void))(a1[4] + 16);
  }
  else
  {
    uint64_t v14 = secLogObjForScope("octagon-checkinheritancekey");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18B299000, v14, OS_LOG_TYPE_DEFAULT, "successfully checked inerhitance key", (uint8_t *)&v22, 2u);
    }

    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    unint64_t v15 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    unint64_t v16 = _OctagonSignpostLogSystem();
    uint64_t v17 = v16;
    os_signpost_id_t v18 = a1[6];
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      int v19 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v22 = 67240192;
      LODWORD(v23) = v19;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v17, OS_SIGNPOST_INTERVAL_END, v18, "CheckInheritanceKey", " OctagonSignpostNameCheckInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckInheritanceKey}d ", (uint8_t *)&v22, 8u);
    }

    int v20 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v21 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)v15 / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v21;
      _os_log_impl(&dword_18B299000, v20, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CheckInheritanceKey  OctagonSignpostNameCheckInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckInheritanceKey}d ", (uint8_t *)&v22, 0x1Cu);
    }

    os_signpost_id_t v13 = *(void (**)(void))(a1[4] + 16);
  }
  v13();
}

+ (void)removeInheritanceKey:(id)a3 inheritanceKeyUUID:(id)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = secLogObjForScope("octagon-removeinheritancekey");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    os_signpost_id_t v11 = [v7 context];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_18B299000, v10, OS_LOG_TYPE_DEFAULT, "removeInheritanceKey invoked for context: %@", (uint8_t *)&buf, 0xCu);
  }
  int v12 = _OctagonSignpostLogSystem();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  uint64_t v14 = mach_continuous_time();

  unint64_t v15 = _OctagonSignpostLogSystem();
  unint64_t v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v13, "RemoveInheritanceKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  uint64_t v17 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_18B299000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RemoveInheritanceKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  id v33 = 0;
  os_signpost_id_t v18 = [v7 makeOTControl:&v33];
  id v19 = v33;
  if (v18)
  {
    int v20 = [[OTControlArguments alloc] initWithConfiguration:v7];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __58__OTClique_removeInheritanceKey_inheritanceKeyUUID_reply___block_invoke;
    v28[3] = &unk_1E5477AB0;
    os_signpost_id_t v31 = v13;
    uint64_t v32 = v14;
    p_long long buf = &buf;
    id v29 = v9;
    [v18 removeInheritanceKey:v20 uuid:v8 reply:v28];
  }
  else
  {
    int v21 = secLogObjForScope("octagon-removeinheritancekey");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 138412290;
      os_signpost_id_t v35 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_18B299000, v21, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v34, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    uint64_t v23 = _OctagonSignpostLogSystem();
    __int16 v24 = v23;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      int v25 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      *(_DWORD *)os_signpost_id_t v34 = 67240192;
      LODWORD(v35) = v25;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v24, OS_SIGNPOST_INTERVAL_END, v13, "RemoveInheritanceKey", " OctagonSignpostNameRemoveInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveInheritanceKey}d ", v34, 8u);
    }

    __int16 v26 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 134218496;
      int v27 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      os_signpost_id_t v35 = v13;
      __int16 v36 = 2048;
      double v37 = (double)Nanoseconds / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = v27;
      _os_log_impl(&dword_18B299000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RemoveInheritanceKey  OctagonSignpostNameRemoveInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveInheritanceKey}d ", v34, 0x1Cu);
    }

    (*((void (**)(id, id))v9 + 2))(v9, v19);
  }

  _Block_object_dispose(&buf, 8);
}

void __58__OTClique_removeInheritanceKey_inheritanceKeyUUID_reply___block_invoke(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "octagon-removeinheritancekey, failed to remove inheritance key", (uint8_t *)&v19, 2u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    id v6 = _OctagonSignpostLogSystem();
    id v7 = v6;
    os_signpost_id_t v8 = a1[6];
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      int v9 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v19 = 67240192;
      LODWORD(v20) = v9;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v7, OS_SIGNPOST_INTERVAL_END, v8, "RemoveInheritanceKey", " OctagonSignpostNameRemoveInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveInheritanceKey}d ", (uint8_t *)&v19, 8u);
    }

    int v10 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v11 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      uint64_t v20 = a1[6];
      __int16 v21 = 2048;
      double v22 = (double)Nanoseconds / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v11;
      _os_log_impl(&dword_18B299000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RemoveInheritanceKey  OctagonSignpostNameRemoveInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveInheritanceKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }
  else
  {
    int v12 = secLogObjForScope("octagon-removeinheritancekey");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_18B299000, v12, OS_LOG_TYPE_DEFAULT, "successfully removed inerhitance key", (uint8_t *)&v19, 2u);
    }

    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    unint64_t v13 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    uint64_t v14 = _OctagonSignpostLogSystem();
    unint64_t v15 = v14;
    os_signpost_id_t v16 = a1[6];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      int v17 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v19 = 67240192;
      LODWORD(v20) = v17;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v15, OS_SIGNPOST_INTERVAL_END, v16, "RemoveInheritanceKey", " OctagonSignpostNameRemoveInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveInheritanceKey}d ", (uint8_t *)&v19, 8u);
    }

    int v10 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v18 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      uint64_t v20 = a1[6];
      __int16 v21 = 2048;
      double v22 = (double)v13 / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v18;
      _os_log_impl(&dword_18B299000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RemoveInheritanceKey  OctagonSignpostNameRemoveInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveInheritanceKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16))();
}

+ (void)preflightRecoverOctagonUsingInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = _OctagonSignpostLogSystem();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  uint64_t v12 = mach_continuous_time();

  unint64_t v13 = _OctagonSignpostLogSystem();
  uint64_t v14 = v13;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PreflightRecoverOctagonUsingInheritanceKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  unint64_t v15 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_18B299000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PreflightRecoverOctagonUsingInheritanceKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  id v32 = 0;
  os_signpost_id_t v16 = [v7 makeOTControl:&v32];
  id v17 = v32;
  int v18 = secLogObjForScope("clique-inheritancekey");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v33 = 0;
    _os_log_impl(&dword_18B299000, v18, OS_LOG_TYPE_DEFAULT, "preflight join using inheritance key", v33, 2u);
  }

  if (v16)
  {
    int v19 = [[OTControlArguments alloc] initWithConfiguration:v7];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __76__OTClique_preflightRecoverOctagonUsingInheritanceKey_inheritanceKey_reply___block_invoke;
    v27[3] = &unk_1E5477AB0;
    os_signpost_id_t v30 = v11;
    uint64_t v31 = v12;
    p_long long buf = &buf;
    id v28 = v9;
    [v16 preflightJoinWithInheritanceKey:v19 inheritanceKey:v8 reply:v27];
  }
  else
  {
    uint64_t v20 = secLogObjForScope("clique-inheritancekey");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v33 = 138412290;
      os_signpost_id_t v34 = (os_signpost_id_t)v17;
      _os_log_impl(&dword_18B299000, v20, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v33, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
    double v22 = _OctagonSignpostLogSystem();
    __int16 v23 = v22;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      int v24 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      *(_DWORD *)id v33 = 67240192;
      LODWORD(v34) = v24;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v23, OS_SIGNPOST_INTERVAL_END, v11, "PreflightRecoverOctagonUsingInheritanceKey", " OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey}d ", v33, 8u);
    }

    uint64_t v25 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v33 = 134218496;
      int v26 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      os_signpost_id_t v34 = v11;
      __int16 v35 = 2048;
      double v36 = (double)Nanoseconds / 1000000000.0;
      __int16 v37 = 1026;
      int v38 = v26;
      _os_log_impl(&dword_18B299000, v25, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PreflightRecoverOctagonUsingInheritanceKey  OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey}d ", v33, 0x1Cu);
    }

    (*((void (**)(id, id))v9 + 2))(v9, v17);
  }

  _Block_object_dispose(&buf, 8);
}

void __76__OTClique_preflightRecoverOctagonUsingInheritanceKey_inheritanceKey_reply___block_invoke(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = secLogObjForScope("clique-inheritancekey");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "failed to preflight join using inheritance key: %@", (uint8_t *)&v19, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    id v7 = _OctagonSignpostLogSystem();
    id v8 = v7;
    os_signpost_id_t v9 = a1[6];
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v10 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v19 = 67240192;
      LODWORD(v20) = v10;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PreflightRecoverOctagonUsingInheritanceKey", " OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey}d ", (uint8_t *)&v19, 8u);
    }

    os_signpost_id_t v11 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v12 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      id v20 = (id)a1[6];
      __int16 v21 = 2048;
      double v22 = (double)Nanoseconds / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v12;
      _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PreflightRecoverOctagonUsingInheritanceKey  OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "successful preflight join using inheritance key", (uint8_t *)&v19, 2u);
    }

    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    unint64_t v13 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    uint64_t v14 = _OctagonSignpostLogSystem();
    unint64_t v15 = v14;
    os_signpost_id_t v16 = a1[6];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      int v17 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v19 = 67240192;
      LODWORD(v20) = v17;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PreflightRecoverOctagonUsingInheritanceKey", " OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey}d ", (uint8_t *)&v19, 8u);
    }

    os_signpost_id_t v11 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v18 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      id v20 = (id)a1[6];
      __int16 v21 = 2048;
      double v22 = (double)v13 / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v18;
      _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PreflightRecoverOctagonUsingInheritanceKey  OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16))();
}

+ (void)recoverOctagonUsingInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = _OctagonSignpostLogSystem();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  uint64_t v12 = mach_continuous_time();

  unint64_t v13 = _OctagonSignpostLogSystem();
  uint64_t v14 = v13;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "RecoverOctagonUsingInheritanceKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  unint64_t v15 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_18B299000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RecoverOctagonUsingInheritanceKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  id v32 = 0;
  os_signpost_id_t v16 = [v7 makeOTControl:&v32];
  id v17 = v32;
  int v18 = secLogObjForScope("clique-inheritancekey");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v33 = 0;
    _os_log_impl(&dword_18B299000, v18, OS_LOG_TYPE_DEFAULT, "join using inheritance key", v33, 2u);
  }

  if (v16)
  {
    int v19 = [[OTControlArguments alloc] initWithConfiguration:v7];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __67__OTClique_recoverOctagonUsingInheritanceKey_inheritanceKey_reply___block_invoke;
    v27[3] = &unk_1E5477AB0;
    os_signpost_id_t v30 = v11;
    uint64_t v31 = v12;
    p_long long buf = &buf;
    id v28 = v9;
    [v16 joinWithInheritanceKey:v19 inheritanceKey:v8 reply:v27];
  }
  else
  {
    id v20 = secLogObjForScope("clique-inheritancekey");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v33 = 138412290;
      os_signpost_id_t v34 = (os_signpost_id_t)v17;
      _os_log_impl(&dword_18B299000, v20, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v33, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
    double v22 = _OctagonSignpostLogSystem();
    __int16 v23 = v22;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      int v24 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      *(_DWORD *)id v33 = 67240192;
      LODWORD(v34) = v24;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v23, OS_SIGNPOST_INTERVAL_END, v11, "RecoverOctagonUsingInheritanceKey", " OctagonSignpostNameRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingInheritanceKey}d ", v33, 8u);
    }

    uint64_t v25 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v33 = 134218496;
      int v26 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      os_signpost_id_t v34 = v11;
      __int16 v35 = 2048;
      double v36 = (double)Nanoseconds / 1000000000.0;
      __int16 v37 = 1026;
      int v38 = v26;
      _os_log_impl(&dword_18B299000, v25, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecoverOctagonUsingInheritanceKey  OctagonSignpostNameRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingInheritanceKey}d ", v33, 0x1Cu);
    }

    (*((void (**)(id, id))v9 + 2))(v9, v17);
  }

  _Block_object_dispose(&buf, 8);
}

void __67__OTClique_recoverOctagonUsingInheritanceKey_inheritanceKey_reply___block_invoke(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = secLogObjForScope("clique-inheritancekey");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "failed to join using inheritance key: %@", (uint8_t *)&v19, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    id v7 = _OctagonSignpostLogSystem();
    id v8 = v7;
    os_signpost_id_t v9 = a1[6];
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v10 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v19 = 67240192;
      LODWORD(v20) = v10;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RecoverOctagonUsingInheritanceKey", " OctagonSignpostNameRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingInheritanceKey}d ", (uint8_t *)&v19, 8u);
    }

    os_signpost_id_t v11 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v12 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      id v20 = (id)a1[6];
      __int16 v21 = 2048;
      double v22 = (double)Nanoseconds / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v12;
      _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecoverOctagonUsingInheritanceKey  OctagonSignpostNameRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingInheritanceKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "successfully joined using inheritance key", (uint8_t *)&v19, 2u);
    }

    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    unint64_t v13 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    uint64_t v14 = _OctagonSignpostLogSystem();
    unint64_t v15 = v14;
    os_signpost_id_t v16 = a1[6];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      int v17 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v19 = 67240192;
      LODWORD(v20) = v17;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v15, OS_SIGNPOST_INTERVAL_END, v16, "RecoverOctagonUsingInheritanceKey", " OctagonSignpostNameRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingInheritanceKey}d ", (uint8_t *)&v19, 8u);
    }

    os_signpost_id_t v11 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v18 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      id v20 = (id)a1[6];
      __int16 v21 = 2048;
      double v22 = (double)v13 / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v18;
      _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecoverOctagonUsingInheritanceKey  OctagonSignpostNameRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingInheritanceKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16))();
}

+ (void)storeInheritanceKey:(id)a3 ik:(id)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = secLogObjForScope("octagon-storeinheritancekey");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    os_signpost_id_t v11 = [v7 context];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_18B299000, v10, OS_LOG_TYPE_DEFAULT, "storeInheritanceKey invoked for context: %@", (uint8_t *)&buf, 0xCu);
  }
  int v12 = _OctagonSignpostLogSystem();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  uint64_t v14 = mach_continuous_time();

  unint64_t v15 = _OctagonSignpostLogSystem();
  os_signpost_id_t v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v13, "StoreInheritanceKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  int v17 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_18B299000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: StoreInheritanceKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  id v33 = 0;
  int v18 = [v7 makeOTControl:&v33];
  id v19 = v33;
  if (v18)
  {
    id v20 = [[OTControlArguments alloc] initWithConfiguration:v7];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __41__OTClique_storeInheritanceKey_ik_reply___block_invoke;
    v28[3] = &unk_1E5477AB0;
    os_signpost_id_t v31 = v13;
    uint64_t v32 = v14;
    p_long long buf = &buf;
    id v29 = v9;
    [v18 storeInheritanceKey:v20 ik:v8 reply:v28];
  }
  else
  {
    __int16 v21 = secLogObjForScope("octagon-storeinheritancekey");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 138412290;
      os_signpost_id_t v35 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_18B299000, v21, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v34, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    __int16 v23 = _OctagonSignpostLogSystem();
    int v24 = v23;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      int v25 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      *(_DWORD *)os_signpost_id_t v34 = 67240192;
      LODWORD(v35) = v25;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v24, OS_SIGNPOST_INTERVAL_END, v13, "StoreInheritanceKey", " OctagonSignpostNameStoreInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameStoreInheritanceKey}d ", v34, 8u);
    }

    int v26 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 134218496;
      int v27 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      os_signpost_id_t v35 = v13;
      __int16 v36 = 2048;
      double v37 = (double)Nanoseconds / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = v27;
      _os_log_impl(&dword_18B299000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: StoreInheritanceKey  OctagonSignpostNameStoreInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameStoreInheritanceKey}d ", v34, 0x1Cu);
    }

    (*((void (**)(id, id))v9 + 2))(v9, v19);
  }

  _Block_object_dispose(&buf, 8);
}

void __41__OTClique_storeInheritanceKey_ik_reply___block_invoke(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "octagon-storeinheritancekey, failed to store octagon inheritance recovery key", (uint8_t *)&v19, 2u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    id v6 = _OctagonSignpostLogSystem();
    id v7 = v6;
    os_signpost_id_t v8 = a1[6];
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      int v9 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v19 = 67240192;
      LODWORD(v20) = v9;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v7, OS_SIGNPOST_INTERVAL_END, v8, "StoreInheritanceKey", " OctagonSignpostNameStoreInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameStoreInheritanceKey}d ", (uint8_t *)&v19, 8u);
    }

    int v10 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v11 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      uint64_t v20 = a1[6];
      __int16 v21 = 2048;
      double v22 = (double)Nanoseconds / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v11;
      _os_log_impl(&dword_18B299000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: StoreInheritanceKey  OctagonSignpostNameStoreInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameStoreInheritanceKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }
  else
  {
    int v12 = secLogObjForScope("octagon-storeinheritancekey");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_18B299000, v12, OS_LOG_TYPE_DEFAULT, "successfully stored octagon inheritance recovery key", (uint8_t *)&v19, 2u);
    }

    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    unint64_t v13 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    uint64_t v14 = _OctagonSignpostLogSystem();
    unint64_t v15 = v14;
    os_signpost_id_t v16 = a1[6];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      int v17 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v19 = 67240192;
      LODWORD(v20) = v17;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v15, OS_SIGNPOST_INTERVAL_END, v16, "StoreInheritanceKey", " OctagonSignpostNameStoreInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameStoreInheritanceKey}d ", (uint8_t *)&v19, 8u);
    }

    int v10 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v18 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      uint64_t v20 = a1[6];
      __int16 v21 = 2048;
      double v22 = (double)v13 / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v18;
      _os_log_impl(&dword_18B299000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: StoreInheritanceKey  OctagonSignpostNameStoreInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameStoreInheritanceKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16))();
}

+ (void)generateInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = secLogObjForScope("octagon-generateinheritancekey");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = [v7 context];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_18B299000, v10, OS_LOG_TYPE_DEFAULT, "generateInheritanceKey invoked for context: %@", (uint8_t *)&buf, 0xCu);
  }
  int v12 = _OctagonSignpostLogSystem();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  uint64_t v14 = mach_continuous_time();

  unint64_t v15 = _OctagonSignpostLogSystem();
  os_signpost_id_t v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v13, "GenerateInheritanceKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  int v17 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_18B299000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: GenerateInheritanceKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  id v33 = 0;
  int v18 = [v7 makeOTControl:&v33];
  id v19 = v33;
  if (v18)
  {
    uint64_t v20 = [[OTControlArguments alloc] initWithConfiguration:v7];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __46__OTClique_generateInheritanceKey_uuid_reply___block_invoke;
    v28[3] = &unk_1E5477B00;
    os_signpost_id_t v31 = v13;
    uint64_t v32 = v14;
    p_long long buf = &buf;
    id v29 = v9;
    [v18 generateInheritanceKey:v20 uuid:v8 reply:v28];
  }
  else
  {
    __int16 v21 = secLogObjForScope("octagon-generateinheritancekey");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 138412290;
      os_signpost_id_t v35 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_18B299000, v21, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v34, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    __int16 v23 = _OctagonSignpostLogSystem();
    int v24 = v23;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      int v25 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      *(_DWORD *)os_signpost_id_t v34 = 67240192;
      LODWORD(v35) = v25;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v24, OS_SIGNPOST_INTERVAL_END, v13, "GenerateInheritanceKey", " OctagonSignpostNameGenerateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameGenerateInheritanceKey}d ", v34, 8u);
    }

    int v26 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 134218496;
      int v27 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      os_signpost_id_t v35 = v13;
      __int16 v36 = 2048;
      double v37 = (double)Nanoseconds / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = v27;
      _os_log_impl(&dword_18B299000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: GenerateInheritanceKey  OctagonSignpostNameGenerateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameGenerateInheritanceKey}d ", v34, 0x1Cu);
    }

    (*((void (**)(id, void, id))v9 + 2))(v9, 0, v19);
  }

  _Block_object_dispose(&buf, 8);
}

void __46__OTClique_generateInheritanceKey_uuid_reply___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, "octagon-generateinheritancekey, failed to generate octagon inheritance recovery key", (uint8_t *)&v22, 2u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    id v9 = _OctagonSignpostLogSystem();
    int v10 = v9;
    os_signpost_id_t v11 = a1[6];
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      int v12 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v22 = 67240192;
      LODWORD(v23) = v12;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v10, OS_SIGNPOST_INTERVAL_END, v11, "GenerateInheritanceKey", " OctagonSignpostNameGenerateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameGenerateInheritanceKey}d ", (uint8_t *)&v22, 8u);
    }

    os_signpost_id_t v13 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v14 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)Nanoseconds / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v14;
      _os_log_impl(&dword_18B299000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: GenerateInheritanceKey  OctagonSignpostNameGenerateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameGenerateInheritanceKey}d ", (uint8_t *)&v22, 0x1Cu);
    }
  }
  else
  {
    unint64_t v15 = secLogObjForScope("octagon-generateinheritancekey");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18B299000, v15, OS_LOG_TYPE_DEFAULT, "successfully generated octagon inheritance recovery key", (uint8_t *)&v22, 2u);
    }

    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    unint64_t v16 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    int v17 = _OctagonSignpostLogSystem();
    int v18 = v17;
    os_signpost_id_t v19 = a1[6];
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      int v20 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v22 = 67240192;
      LODWORD(v23) = v20;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v18, OS_SIGNPOST_INTERVAL_END, v19, "GenerateInheritanceKey", " OctagonSignpostNameGenerateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameGenerateInheritanceKey}d ", (uint8_t *)&v22, 8u);
    }

    os_signpost_id_t v13 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v21 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)v16 / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v21;
      _os_log_impl(&dword_18B299000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: GenerateInheritanceKey  OctagonSignpostNameGenerateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameGenerateInheritanceKey}d ", (uint8_t *)&v22, 0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16))();
}

+ (void)createInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = secLogObjForScope("octagon-createinheritancekey");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    os_signpost_id_t v11 = [v7 context];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_18B299000, v10, OS_LOG_TYPE_DEFAULT, "createInheritanceKey invoked for context: %@", (uint8_t *)&buf, 0xCu);
  }
  int v12 = _OctagonSignpostLogSystem();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  uint64_t v14 = mach_continuous_time();

  unint64_t v15 = _OctagonSignpostLogSystem();
  unint64_t v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v13, "CreateInheritanceKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  int v17 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_18B299000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CreateInheritanceKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  id v33 = 0;
  int v18 = [v7 makeOTControl:&v33];
  id v19 = v33;
  if (v18)
  {
    int v20 = [[OTControlArguments alloc] initWithConfiguration:v7];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __44__OTClique_createInheritanceKey_uuid_reply___block_invoke;
    v28[3] = &unk_1E5477B00;
    os_signpost_id_t v31 = v13;
    uint64_t v32 = v14;
    p_long long buf = &buf;
    id v29 = v9;
    [v18 createInheritanceKey:v20 uuid:v8 reply:v28];
  }
  else
  {
    int v21 = secLogObjForScope("octagon-createinheritancekey");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 138412290;
      os_signpost_id_t v35 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_18B299000, v21, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v34, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    uint64_t v23 = _OctagonSignpostLogSystem();
    __int16 v24 = v23;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      int v25 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      *(_DWORD *)os_signpost_id_t v34 = 67240192;
      LODWORD(v35) = v25;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v24, OS_SIGNPOST_INTERVAL_END, v13, "CreateInheritanceKey", " OctagonSignpostNameCreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKey}d ", v34, 8u);
    }

    __int16 v26 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 134218496;
      int v27 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      os_signpost_id_t v35 = v13;
      __int16 v36 = 2048;
      double v37 = (double)Nanoseconds / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = v27;
      _os_log_impl(&dword_18B299000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CreateInheritanceKey  OctagonSignpostNameCreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKey}d ", v34, 0x1Cu);
    }

    (*((void (**)(id, void, id))v9 + 2))(v9, 0, v19);
  }

  _Block_object_dispose(&buf, 8);
}

void __44__OTClique_createInheritanceKey_uuid_reply___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, "octagon-createinheritancekey, failed to create octagon inheritance recovery key", (uint8_t *)&v22, 2u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    id v9 = _OctagonSignpostLogSystem();
    int v10 = v9;
    os_signpost_id_t v11 = a1[6];
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      int v12 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v22 = 67240192;
      LODWORD(v23) = v12;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v10, OS_SIGNPOST_INTERVAL_END, v11, "CreateInheritanceKey", " OctagonSignpostNameCreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKey}d ", (uint8_t *)&v22, 8u);
    }

    os_signpost_id_t v13 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v14 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)Nanoseconds / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v14;
      _os_log_impl(&dword_18B299000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CreateInheritanceKey  OctagonSignpostNameCreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKey}d ", (uint8_t *)&v22, 0x1Cu);
    }
  }
  else
  {
    unint64_t v15 = secLogObjForScope("octagon-createinheritancekey");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18B299000, v15, OS_LOG_TYPE_DEFAULT, "successfully created octagon inheritance recovery key", (uint8_t *)&v22, 2u);
    }

    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    unint64_t v16 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    int v17 = _OctagonSignpostLogSystem();
    int v18 = v17;
    os_signpost_id_t v19 = a1[6];
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      int v20 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v22 = 67240192;
      LODWORD(v23) = v20;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v18, OS_SIGNPOST_INTERVAL_END, v19, "CreateInheritanceKey", " OctagonSignpostNameCreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKey}d ", (uint8_t *)&v22, 8u);
    }

    os_signpost_id_t v13 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v21 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)v16 / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v21;
      _os_log_impl(&dword_18B299000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CreateInheritanceKey  OctagonSignpostNameCreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKey}d ", (uint8_t *)&v22, 0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16))();
}

+ (void)checkCustodianRecoveryKey:(id)a3 custodianRecoveryKeyUUID:(id)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = secLogObjForScope("octagon-checkcustodianrecoverykey");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    os_signpost_id_t v11 = [v7 context];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_18B299000, v10, OS_LOG_TYPE_DEFAULT, "checkCustodianRecoveryKey invoked for context: %@", (uint8_t *)&buf, 0xCu);
  }
  int v12 = _OctagonSignpostLogSystem();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  uint64_t v14 = mach_continuous_time();

  unint64_t v15 = _OctagonSignpostLogSystem();
  unint64_t v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v13, "CheckCustodianRecoveryKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  int v17 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_18B299000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CheckCustodianRecoveryKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  id v33 = 0;
  int v18 = [v7 makeOTControl:&v33];
  id v19 = v33;
  if (v18)
  {
    int v20 = [[OTControlArguments alloc] initWithConfiguration:v7];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __69__OTClique_checkCustodianRecoveryKey_custodianRecoveryKeyUUID_reply___block_invoke;
    v28[3] = &unk_1E5477AD8;
    os_signpost_id_t v31 = v13;
    uint64_t v32 = v14;
    p_long long buf = &buf;
    id v29 = v9;
    [v18 checkCustodianRecoveryKey:v20 uuid:v8 reply:v28];
  }
  else
  {
    int v21 = secLogObjForScope("octagon-checkcustodianrecoverykey");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 138412290;
      os_signpost_id_t v35 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_18B299000, v21, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v34, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    uint64_t v23 = _OctagonSignpostLogSystem();
    __int16 v24 = v23;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      int v25 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      *(_DWORD *)os_signpost_id_t v34 = 67240192;
      LODWORD(v35) = v25;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v24, OS_SIGNPOST_INTERVAL_END, v13, "CheckCustodianRecoveryKey", " OctagonSignpostNameCheckCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckCustodianRecoveryKey}d ", v34, 8u);
    }

    __int16 v26 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 134218496;
      int v27 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      os_signpost_id_t v35 = v13;
      __int16 v36 = 2048;
      double v37 = (double)Nanoseconds / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = v27;
      _os_log_impl(&dword_18B299000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CheckCustodianRecoveryKey  OctagonSignpostNameCheckCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckCustodianRecoveryKey}d ", v34, 0x1Cu);
    }

    (*((void (**)(id, void, id))v9 + 2))(v9, 0, v19);
  }

  _Block_object_dispose(&buf, 8);
}

void __69__OTClique_checkCustodianRecoveryKey_custodianRecoveryKeyUUID_reply___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, "octagon-checkcustodianrecoverykey, failed to check custodian recovery key", (uint8_t *)&v22, 2u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    id v7 = _OctagonSignpostLogSystem();
    id v8 = v7;
    os_signpost_id_t v9 = a1[6];
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v10 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v22 = 67240192;
      LODWORD(v23) = v10;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CheckCustodianRecoveryKey", " OctagonSignpostNameCheckCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckCustodianRecoveryKey}d ", (uint8_t *)&v22, 8u);
    }

    os_signpost_id_t v11 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v12 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)Nanoseconds / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v12;
      _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CheckCustodianRecoveryKey  OctagonSignpostNameCheckCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckCustodianRecoveryKey}d ", (uint8_t *)&v22, 0x1Cu);
    }

    os_signpost_id_t v13 = *(void (**)(void))(a1[4] + 16);
  }
  else
  {
    uint64_t v14 = secLogObjForScope("octagon-checkcheckcustodianrecoverykey");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18B299000, v14, OS_LOG_TYPE_DEFAULT, "successfully checked custodian recovery key", (uint8_t *)&v22, 2u);
    }

    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    unint64_t v15 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    unint64_t v16 = _OctagonSignpostLogSystem();
    int v17 = v16;
    os_signpost_id_t v18 = a1[6];
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      int v19 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v22 = 67240192;
      LODWORD(v23) = v19;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v17, OS_SIGNPOST_INTERVAL_END, v18, "CheckCustodianRecoveryKey", " OctagonSignpostNameCheckCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckCustodianRecoveryKey}d ", (uint8_t *)&v22, 8u);
    }

    int v20 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v21 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)v15 / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v21;
      _os_log_impl(&dword_18B299000, v20, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CheckCustodianRecoveryKey  OctagonSignpostNameCheckCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckCustodianRecoveryKey}d ", (uint8_t *)&v22, 0x1Cu);
    }

    os_signpost_id_t v13 = *(void (**)(void))(a1[4] + 16);
  }
  v13();
}

+ (void)removeCustodianRecoveryKey:(id)a3 custodianRecoveryKeyUUID:(id)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = secLogObjForScope("octagon-removecustodianrecoverykey");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    os_signpost_id_t v11 = [v7 context];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_18B299000, v10, OS_LOG_TYPE_DEFAULT, "removeCustodianRecoveryKey invoked for context: %@", (uint8_t *)&buf, 0xCu);
  }
  int v12 = _OctagonSignpostLogSystem();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  uint64_t v14 = mach_continuous_time();

  unint64_t v15 = _OctagonSignpostLogSystem();
  unint64_t v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v13, "RemoveCustodianRecoveryKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  int v17 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_18B299000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RemoveCustodianRecoveryKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  id v33 = 0;
  os_signpost_id_t v18 = [v7 makeOTControl:&v33];
  id v19 = v33;
  if (v18)
  {
    int v20 = [[OTControlArguments alloc] initWithConfiguration:v7];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __70__OTClique_removeCustodianRecoveryKey_custodianRecoveryKeyUUID_reply___block_invoke;
    v28[3] = &unk_1E5477AB0;
    os_signpost_id_t v31 = v13;
    uint64_t v32 = v14;
    p_long long buf = &buf;
    id v29 = v9;
    [v18 removeCustodianRecoveryKey:v20 uuid:v8 reply:v28];
  }
  else
  {
    int v21 = secLogObjForScope("octagon-removecustodianrecoverykey");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 138412290;
      os_signpost_id_t v35 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_18B299000, v21, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v34, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    uint64_t v23 = _OctagonSignpostLogSystem();
    __int16 v24 = v23;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      int v25 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      *(_DWORD *)os_signpost_id_t v34 = 67240192;
      LODWORD(v35) = v25;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v24, OS_SIGNPOST_INTERVAL_END, v13, "RemoveCustodianRecoveryKey", " OctagonSignpostNameRemoveCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveCustodianRecoveryKey}d ", v34, 8u);
    }

    __int16 v26 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 134218496;
      int v27 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      os_signpost_id_t v35 = v13;
      __int16 v36 = 2048;
      double v37 = (double)Nanoseconds / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = v27;
      _os_log_impl(&dword_18B299000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RemoveCustodianRecoveryKey  OctagonSignpostNameRemoveCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveCustodianRecoveryKey}d ", v34, 0x1Cu);
    }

    (*((void (**)(id, id))v9 + 2))(v9, v19);
  }

  _Block_object_dispose(&buf, 8);
}

void __70__OTClique_removeCustodianRecoveryKey_custodianRecoveryKeyUUID_reply___block_invoke(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "octagon-removecustodianrecoverykey, failed to remove custodian recovery key", (uint8_t *)&v19, 2u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    id v6 = _OctagonSignpostLogSystem();
    id v7 = v6;
    os_signpost_id_t v8 = a1[6];
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      int v9 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v19 = 67240192;
      LODWORD(v20) = v9;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v7, OS_SIGNPOST_INTERVAL_END, v8, "RemoveCustodianRecoveryKey", " OctagonSignpostNameRemoveCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveCustodianRecoveryKey}d ", (uint8_t *)&v19, 8u);
    }

    int v10 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v11 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      uint64_t v20 = a1[6];
      __int16 v21 = 2048;
      double v22 = (double)Nanoseconds / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v11;
      _os_log_impl(&dword_18B299000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RemoveCustodianRecoveryKey  OctagonSignpostNameRemoveCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveCustodianRecoveryKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }
  else
  {
    int v12 = secLogObjForScope("octagon-removecustodianrecoverykey");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_18B299000, v12, OS_LOG_TYPE_DEFAULT, "successfully removed custodian recovery key", (uint8_t *)&v19, 2u);
    }

    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    unint64_t v13 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    uint64_t v14 = _OctagonSignpostLogSystem();
    unint64_t v15 = v14;
    os_signpost_id_t v16 = a1[6];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      int v17 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v19 = 67240192;
      LODWORD(v20) = v17;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v15, OS_SIGNPOST_INTERVAL_END, v16, "RemoveCustodianRecoveryKey", " OctagonSignpostNameRemoveCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveCustodianRecoveryKey}d ", (uint8_t *)&v19, 8u);
    }

    int v10 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v18 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      uint64_t v20 = a1[6];
      __int16 v21 = 2048;
      double v22 = (double)v13 / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v18;
      _os_log_impl(&dword_18B299000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RemoveCustodianRecoveryKey  OctagonSignpostNameRemoveCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveCustodianRecoveryKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16))();
}

+ (void)preflightRecoverOctagonUsingCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = _OctagonSignpostLogSystem();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  uint64_t v12 = mach_continuous_time();

  unint64_t v13 = _OctagonSignpostLogSystem();
  uint64_t v14 = v13;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PreflightRecoverOctagonUsingCustodianRecoveryKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  unint64_t v15 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_18B299000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PreflightRecoverOctagonUsingCustodianRecoveryKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  id v32 = 0;
  os_signpost_id_t v16 = [v7 makeOTControl:&v32];
  id v17 = v32;
  int v18 = secLogObjForScope("clique-custodianrecoverykey");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v33 = 0;
    _os_log_impl(&dword_18B299000, v18, OS_LOG_TYPE_DEFAULT, "preflight join using custodian recovery key", v33, 2u);
  }

  if (v16)
  {
    int v19 = [[OTControlArguments alloc] initWithConfiguration:v7];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __88__OTClique_preflightRecoverOctagonUsingCustodianRecoveryKey_custodianRecoveryKey_reply___block_invoke;
    v27[3] = &unk_1E5477AB0;
    os_signpost_id_t v30 = v11;
    uint64_t v31 = v12;
    p_long long buf = &buf;
    id v28 = v9;
    [v16 preflightJoinWithCustodianRecoveryKey:v19 custodianRecoveryKey:v8 reply:v27];
  }
  else
  {
    uint64_t v20 = secLogObjForScope("clique-custodianrecoverykey");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v33 = 138412290;
      os_signpost_id_t v34 = (os_signpost_id_t)v17;
      _os_log_impl(&dword_18B299000, v20, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v33, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
    double v22 = _OctagonSignpostLogSystem();
    __int16 v23 = v22;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      int v24 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      *(_DWORD *)id v33 = 67240192;
      LODWORD(v34) = v24;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v23, OS_SIGNPOST_INTERVAL_END, v11, "PreflightRecoverOctagonUsingCustodianRecoveryKey", " OctagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey}d ", v33, 8u);
    }

    uint64_t v25 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v33 = 134218496;
      int v26 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      os_signpost_id_t v34 = v11;
      __int16 v35 = 2048;
      double v36 = (double)Nanoseconds / 1000000000.0;
      __int16 v37 = 1026;
      int v38 = v26;
      _os_log_impl(&dword_18B299000, v25, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PreflightRecoverOctagonUsingCustodianRecoveryKey  OctagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey}d ", v33, 0x1Cu);
    }

    (*((void (**)(id, id))v9 + 2))(v9, v17);
  }

  _Block_object_dispose(&buf, 8);
}

void __88__OTClique_preflightRecoverOctagonUsingCustodianRecoveryKey_custodianRecoveryKey_reply___block_invoke(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = secLogObjForScope("clique-custodianrecoverykey");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "failed to preflight join using custodian recovery key: %@", (uint8_t *)&v19, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    id v7 = _OctagonSignpostLogSystem();
    id v8 = v7;
    os_signpost_id_t v9 = a1[6];
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v10 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v19 = 67240192;
      LODWORD(v20) = v10;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PreflightRecoverOctagonUsingCustodianRecoveryKey", " OctagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey}d ", (uint8_t *)&v19, 8u);
    }

    os_signpost_id_t v11 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v12 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      id v20 = (id)a1[6];
      __int16 v21 = 2048;
      double v22 = (double)Nanoseconds / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v12;
      _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PreflightRecoverOctagonUsingCustodianRecoveryKey  OctagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "successful preflight join using custodian recovery key", (uint8_t *)&v19, 2u);
    }

    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    unint64_t v13 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    uint64_t v14 = _OctagonSignpostLogSystem();
    unint64_t v15 = v14;
    os_signpost_id_t v16 = a1[6];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      int v17 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v19 = 67240192;
      LODWORD(v20) = v17;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PreflightRecoverOctagonUsingCustodianRecoveryKey", " OctagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey}d ", (uint8_t *)&v19, 8u);
    }

    os_signpost_id_t v11 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v18 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      id v20 = (id)a1[6];
      __int16 v21 = 2048;
      double v22 = (double)v13 / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v18;
      _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PreflightRecoverOctagonUsingCustodianRecoveryKey  OctagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16))();
}

+ (void)recoverOctagonUsingCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = _OctagonSignpostLogSystem();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  uint64_t v12 = mach_continuous_time();

  unint64_t v13 = _OctagonSignpostLogSystem();
  uint64_t v14 = v13;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "RecoverOctagonUsingCustodianRecoveryKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  unint64_t v15 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_18B299000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RecoverOctagonUsingCustodianRecoveryKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  id v32 = 0;
  os_signpost_id_t v16 = [v7 makeOTControl:&v32];
  id v17 = v32;
  int v18 = secLogObjForScope("clique-custodianrecoverykey");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v33 = 0;
    _os_log_impl(&dword_18B299000, v18, OS_LOG_TYPE_DEFAULT, "join using custodian recovery key", v33, 2u);
  }

  if (v16)
  {
    int v19 = [[OTControlArguments alloc] initWithConfiguration:v7];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __79__OTClique_recoverOctagonUsingCustodianRecoveryKey_custodianRecoveryKey_reply___block_invoke;
    v27[3] = &unk_1E5477AB0;
    os_signpost_id_t v30 = v11;
    uint64_t v31 = v12;
    p_long long buf = &buf;
    id v28 = v9;
    [v16 joinWithCustodianRecoveryKey:v19 custodianRecoveryKey:v8 reply:v27];
  }
  else
  {
    id v20 = secLogObjForScope("clique-custodianrecoverykey");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v33 = 138412290;
      os_signpost_id_t v34 = (os_signpost_id_t)v17;
      _os_log_impl(&dword_18B299000, v20, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v33, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
    double v22 = _OctagonSignpostLogSystem();
    __int16 v23 = v22;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      int v24 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      *(_DWORD *)id v33 = 67240192;
      LODWORD(v34) = v24;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v23, OS_SIGNPOST_INTERVAL_END, v11, "RecoverOctagonUsingCustodianRecoveryKey", " OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey}d ", v33, 8u);
    }

    uint64_t v25 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v33 = 134218496;
      int v26 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      os_signpost_id_t v34 = v11;
      __int16 v35 = 2048;
      double v36 = (double)Nanoseconds / 1000000000.0;
      __int16 v37 = 1026;
      int v38 = v26;
      _os_log_impl(&dword_18B299000, v25, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecoverOctagonUsingCustodianRecoveryKey  OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey}d ", v33, 0x1Cu);
    }

    (*((void (**)(id, id))v9 + 2))(v9, v17);
  }

  _Block_object_dispose(&buf, 8);
}

void __79__OTClique_recoverOctagonUsingCustodianRecoveryKey_custodianRecoveryKey_reply___block_invoke(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = secLogObjForScope("clique-custodianrecoverykey");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "failed to join using custodian recovery key: %@", (uint8_t *)&v19, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    id v7 = _OctagonSignpostLogSystem();
    id v8 = v7;
    os_signpost_id_t v9 = a1[6];
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v10 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v19 = 67240192;
      LODWORD(v20) = v10;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RecoverOctagonUsingCustodianRecoveryKey", " OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey}d ", (uint8_t *)&v19, 8u);
    }

    os_signpost_id_t v11 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v12 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      id v20 = (id)a1[6];
      __int16 v21 = 2048;
      double v22 = (double)Nanoseconds / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v12;
      _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecoverOctagonUsingCustodianRecoveryKey  OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "successfully joined using custodian recovery key", (uint8_t *)&v19, 2u);
    }

    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    unint64_t v13 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    uint64_t v14 = _OctagonSignpostLogSystem();
    unint64_t v15 = v14;
    os_signpost_id_t v16 = a1[6];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      int v17 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v19 = 67240192;
      LODWORD(v20) = v17;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v15, OS_SIGNPOST_INTERVAL_END, v16, "RecoverOctagonUsingCustodianRecoveryKey", " OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey}d ", (uint8_t *)&v19, 8u);
    }

    os_signpost_id_t v11 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v18 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      id v20 = (id)a1[6];
      __int16 v21 = 2048;
      double v22 = (double)v13 / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v18;
      _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecoverOctagonUsingCustodianRecoveryKey  OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16))();
}

+ (void)createCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = secLogObjForScope("octagon-createcustodianrecoverykey");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    os_signpost_id_t v11 = [v7 context];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_18B299000, v10, OS_LOG_TYPE_DEFAULT, "createCustodianRecoveryKey invoked for context: %@", (uint8_t *)&buf, 0xCu);
  }
  int v12 = _OctagonSignpostLogSystem();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  uint64_t v14 = mach_continuous_time();

  unint64_t v15 = _OctagonSignpostLogSystem();
  os_signpost_id_t v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v13, "CreateCustodianRecoveryKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  int v17 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_18B299000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CreateCustodianRecoveryKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  id v33 = 0;
  int v18 = [v7 makeOTControl:&v33];
  id v19 = v33;
  if (v18)
  {
    id v20 = [[OTControlArguments alloc] initWithConfiguration:v7];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __50__OTClique_createCustodianRecoveryKey_uuid_reply___block_invoke;
    v28[3] = &unk_1E5477A88;
    os_signpost_id_t v31 = v13;
    uint64_t v32 = v14;
    p_long long buf = &buf;
    id v29 = v9;
    [v18 createCustodianRecoveryKey:v20 uuid:v8 reply:v28];
  }
  else
  {
    __int16 v21 = secLogObjForScope("octagon-createcustodianrecoverykey");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 138412290;
      os_signpost_id_t v35 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_18B299000, v21, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v34, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    __int16 v23 = _OctagonSignpostLogSystem();
    int v24 = v23;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      int v25 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      *(_DWORD *)os_signpost_id_t v34 = 67240192;
      LODWORD(v35) = v25;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v24, OS_SIGNPOST_INTERVAL_END, v13, "CreateCustodianRecoveryKey", " OctagonSignpostNameCreateCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateCustodianRecoveryKey}d ", v34, 8u);
    }

    int v26 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 134218496;
      int v27 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      os_signpost_id_t v35 = v13;
      __int16 v36 = 2048;
      double v37 = (double)Nanoseconds / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = v27;
      _os_log_impl(&dword_18B299000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CreateCustodianRecoveryKey  OctagonSignpostNameCreateCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateCustodianRecoveryKey}d ", v34, 0x1Cu);
    }

    (*((void (**)(id, void, id))v9 + 2))(v9, 0, v19);
  }

  _Block_object_dispose(&buf, 8);
}

void __50__OTClique_createCustodianRecoveryKey_uuid_reply___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, "octagon-createcustodianrecoverykey, failed to create octagon custodian recovery key", (uint8_t *)&v22, 2u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    id v9 = _OctagonSignpostLogSystem();
    int v10 = v9;
    os_signpost_id_t v11 = a1[6];
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      int v12 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v22 = 67240192;
      LODWORD(v23) = v12;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v10, OS_SIGNPOST_INTERVAL_END, v11, "CreateCustodianRecoveryKey", " OctagonSignpostNameCreateCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateCustodianRecoveryKey}d ", (uint8_t *)&v22, 8u);
    }

    os_signpost_id_t v13 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v14 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)Nanoseconds / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v14;
      _os_log_impl(&dword_18B299000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CreateCustodianRecoveryKey  OctagonSignpostNameCreateCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateCustodianRecoveryKey}d ", (uint8_t *)&v22, 0x1Cu);
    }
  }
  else
  {
    unint64_t v15 = secLogObjForScope("octagon-createcustodianrecoverykey");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18B299000, v15, OS_LOG_TYPE_DEFAULT, "successfully created octagon custodian recovery key", (uint8_t *)&v22, 2u);
    }

    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    unint64_t v16 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    int v17 = _OctagonSignpostLogSystem();
    int v18 = v17;
    os_signpost_id_t v19 = a1[6];
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      int v20 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      int v22 = 67240192;
      LODWORD(v23) = v20;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v18, OS_SIGNPOST_INTERVAL_END, v19, "CreateCustodianRecoveryKey", " OctagonSignpostNameCreateCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateCustodianRecoveryKey}d ", (uint8_t *)&v22, 8u);
    }

    os_signpost_id_t v13 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v21 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)v16 / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v21;
      _os_log_impl(&dword_18B299000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CreateCustodianRecoveryKey  OctagonSignpostNameCreateCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateCustodianRecoveryKey}d ", (uint8_t *)&v22, 0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16))();
}

+ (void)setNewRecoveryKeyWithData:(id)a3 recoveryKey:(id)a4 reply:(id)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v47 = a4;
  id v8 = a5;
  id v9 = secLogObjForScope("octagon-setrecoverykey");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [v7 context];
    *(_DWORD *)long long buf = 138412290;
    *(void *)&uint8_t buf[4] = v10;
    _os_log_impl(&dword_18B299000, v9, OS_LOG_TYPE_DEFAULT, "setNewRecoveryKeyWithData invoked for context: %@", buf, 0xCu);
  }
  os_signpost_id_t v11 = objc_opt_new();
  int v12 = _OctagonSignpostLogSystem();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  uint64_t v14 = mach_continuous_time();

  unint64_t v15 = _OctagonSignpostLogSystem();
  unint64_t v16 = v15;
  unint64_t v17 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SetNewRecoveryKeyWithData", " enableTelemetry=YES ", buf, 2u);
  }

  int v18 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)&uint8_t buf[4] = v13;
    _os_log_impl(&dword_18B299000, v18, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SetNewRecoveryKeyWithData  enableTelemetry=YES ", buf, 0xCu);
  }

  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x2020000000;
  char v59 = 0;
  id v55 = 0;
  os_signpost_id_t v19 = SecRKCreateRecoveryKeyWithError(v47, &v55);
  id v46 = v55;
  if (v19)
  {
    id v54 = 0;
    int v20 = [v7 makeOTControl:&v54];
    id v21 = v54;
    if (v20)
    {
      int v22 = [[OTControlArguments alloc] initWithConfiguration:v7];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __56__OTClique_setNewRecoveryKeyWithData_recoveryKey_reply___block_invoke;
      v48[3] = &unk_1E5477A60;
      os_signpost_id_t v52 = v13;
      uint64_t v53 = v14;
      uint64_t v51 = &v56;
      id v50 = v8;
      id v49 = v19;
      [v20 createRecoveryKey:v22 recoveryKey:v47 reply:v48];
    }
    else
    {
      os_signpost_id_t v31 = secLogObjForScope("octagon-setrecoverykey");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v21;
        _os_log_impl(&dword_18B299000, v31, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", buf, 0xCu);
      }

      unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
      id v33 = _OctagonSignpostLogSystem();
      os_signpost_id_t v34 = v33;
      if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
      {
        int v35 = *((unsigned __int8 *)v57 + 24);
        *(_DWORD *)long long buf = 67240192;
        *(_DWORD *)&uint8_t buf[4] = v35;
        _os_signpost_emit_with_name_impl(&dword_18B299000, v34, OS_SIGNPOST_INTERVAL_END, v13, "SetNewRecoveryKeyWithData", " OctagonSignpostNameSetNewRecoveryKeyWithData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetNewRecoveryKeyWithData}d ", buf, 8u);
      }

      __int16 v36 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134218496;
        int v37 = *((unsigned __int8 *)v57 + 24);
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(double *)&buf[14] = (double)Nanoseconds / 1000000000.0;
        *(_WORD *)&buf[22] = 1026;
        LODWORD(v65) = v37;
        _os_log_impl(&dword_18B299000, v36, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SetNewRecoveryKeyWithData  OctagonSignpostNameSetNewRecoveryKeyWithData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetNewRecoveryKeyWithData}d ", buf, 0x1Cu);
      }

      (*((void (**)(id, void, id))v8 + 2))(v8, 0, v21);
    }

    os_signpost_id_t v30 = 0;
  }
  else
  {
    uint64_t v23 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v46;
      _os_log_impl(&dword_18B299000, v23, OS_LOG_TYPE_DEFAULT, "octagon-setrecoverykey, SecRKCreateRecoveryKeyWithError() failed: %@", buf, 0xCu);
    }

    [v11 setObject:@"SecRKCreateRecoveryKeyWithError() failed" forKeyedSubscript:*MEMORY[0x1E4F28568]];
    [v11 setObject:v46 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    BOOL v24 = +[OTClique isCloudServicesAvailable];
    double v25 = (void *)MEMORY[0x1E4F28C58];
    if (v24)
    {
      uint64_t v60 = 0;
      BOOL v61 = &v60;
      uint64_t v62 = 0x2020000000;
      __int16 v26 = (id *)getkSecureBackupErrorDomainSymbolLoc_ptr;
      uint64_t v63 = getkSecureBackupErrorDomainSymbolLoc_ptr;
      if (!getkSecureBackupErrorDomainSymbolLoc_ptr)
      {
        *(void *)long long buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getkSecureBackupErrorDomainSymbolLoc_block_invoke;
        id v65 = &unk_1E5484FA0;
        uint64_t v66 = &v60;
        int v27 = CloudServicesLibrary();
        uint64_t v28 = dlsym(v27, "kSecureBackupErrorDomain");
        *(void *)(v66[1] + 24) = v28;
        getkSecureBackupErrorDomainSymbolLoc_ptr = *(void *)(v66[1] + 24);
        __int16 v26 = (id *)v61[3];
      }
      _Block_object_dispose(&v60, 8);
      if (!v26)
      {
        uint64_t v44 = [MEMORY[0x1E4F28B00] currentHandler];
        char v45 = [NSString stringWithUTF8String:"NSErrorDomain getkSecureBackupErrorDomain(void)"];
        objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, @"OTClique.m", 77, @"%s", dlerror());

        __break(1u);
      }
      id v29 = *v26;
      os_signpost_id_t v30 = [v25 errorWithDomain:v29 code:24 userInfo:v11];
    }
    else
    {
      os_signpost_id_t v30 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-4 userInfo:v11];
    }
    unint64_t v38 = _OctagonSignpostGetNanoseconds(v13, v14);
    int v39 = _OctagonSignpostLogSystem();
    uint64_t v40 = v39;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
    {
      int v41 = *((unsigned __int8 *)v57 + 24);
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)&uint8_t buf[4] = v41;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v40, OS_SIGNPOST_INTERVAL_END, v13, "SetNewRecoveryKeyWithData", " OctagonSignpostNameSetNewRecoveryKeyWithData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetNewRecoveryKeyWithData}d ", buf, 8u);
    }

    char v42 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      int v43 = *((unsigned __int8 *)v57 + 24);
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(double *)&buf[14] = (double)v38 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v65) = v43;
      _os_log_impl(&dword_18B299000, v42, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SetNewRecoveryKeyWithData  OctagonSignpostNameSetNewRecoveryKeyWithData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetNewRecoveryKeyWithData}d ", buf, 0x1Cu);
    }

    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v30);
  }

  _Block_object_dispose(&v56, 8);
}

void __56__OTClique_setNewRecoveryKeyWithData_recoveryKey_reply___block_invoke(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "octagon-setrecoverykey, failed to create octagon recovery key", (uint8_t *)&v19, 2u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[7], a1[8]);
    id v6 = _OctagonSignpostLogSystem();
    id v7 = v6;
    os_signpost_id_t v8 = a1[7];
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      int v9 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
      int v19 = 67240192;
      LODWORD(v20) = v9;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v7, OS_SIGNPOST_INTERVAL_END, v8, "SetNewRecoveryKeyWithData", " OctagonSignpostNameSetNewRecoveryKeyWithData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetNewRecoveryKeyWithData}d ", (uint8_t *)&v19, 8u);
    }

    int v10 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v11 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
      uint64_t v20 = a1[7];
      __int16 v21 = 2048;
      double v22 = (double)Nanoseconds / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v11;
      _os_log_impl(&dword_18B299000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SetNewRecoveryKeyWithData  OctagonSignpostNameSetNewRecoveryKeyWithData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetNewRecoveryKeyWithData}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }
  else
  {
    int v12 = secLogObjForScope("octagon-setrecoverykey");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_18B299000, v12, OS_LOG_TYPE_DEFAULT, "successfully set octagon recovery key", (uint8_t *)&v19, 2u);
    }

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    unint64_t v13 = _OctagonSignpostGetNanoseconds(a1[7], a1[8]);
    uint64_t v14 = _OctagonSignpostLogSystem();
    unint64_t v15 = v14;
    os_signpost_id_t v16 = a1[7];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      int v17 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
      int v19 = 67240192;
      LODWORD(v20) = v17;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v15, OS_SIGNPOST_INTERVAL_END, v16, "SetNewRecoveryKeyWithData", " OctagonSignpostNameSetNewRecoveryKeyWithData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetNewRecoveryKeyWithData}d ", (uint8_t *)&v19, 8u);
    }

    int v10 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v18 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
      uint64_t v20 = a1[7];
      __int16 v21 = 2048;
      double v22 = (double)v13 / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v18;
      _os_log_impl(&dword_18B299000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SetNewRecoveryKeyWithData  OctagonSignpostNameSetNewRecoveryKeyWithData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetNewRecoveryKeyWithData}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }

  (*(void (**)(void))(a1[5] + 16))();
}

+ (id)recoverWithContextData:(id)a3 bottleID:(id)a4 escrowedEntropy:(id)a5 error:(id *)a6
{
  id v6 = secLogObjForScope("octagon");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_signpost_id_t v8 = 0;
    _os_log_impl(&dword_18B299000, v6, OS_LOG_TYPE_DEFAULT, "replaced by performEscrowRecoveryWithContextData:escrowArguments:error: remove call", v8, 2u);
  }

  return 0;
}

+ (id)findOptimalBottleIDsWithContextData:(id)a3 error:(id *)a4
{
  v56[2] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = secLogObjForScope("clique-findbottle");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 context];
    os_signpost_id_t v8 = [v5 altDSID];
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_18B299000, v6, OS_LOG_TYPE_DEFAULT, "finding optimal bottles for context:%@, altdsid:%@", buf, 0x16u);
  }
  int v9 = _OctagonSignpostLogSystem();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  uint64_t v11 = mach_continuous_time();

  int v12 = _OctagonSignpostLogSystem();
  unint64_t v13 = v12;
  unint64_t v14 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v10, "FindOptimalBottleIDsWithContextData", " enableTelemetry=YES ", buf, 2u);
  }

  unint64_t v15 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)&uint8_t buf[4] = v10;
    _os_log_impl(&dword_18B299000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FindOptimalBottleIDsWithContextData  enableTelemetry=YES ", buf, 0xCu);
  }

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v54 = __Block_byref_object_copy__5170;
  id v55 = __Block_byref_object_dispose__5171;
  v56[0] = 0;
  uint64_t v41 = 0;
  char v42 = &v41;
  uint64_t v43 = 0x3032000000;
  uint64_t v44 = __Block_byref_object_copy__5170;
  char v45 = __Block_byref_object_dispose__5171;
  id v46 = 0;
  uint64_t v35 = 0;
  __int16 v36 = &v35;
  uint64_t v37 = 0x3032000000;
  unint64_t v38 = __Block_byref_object_copy__5170;
  int v39 = __Block_byref_object_dispose__5171;
  id v40 = 0;
  id obj = 0;
  os_signpost_id_t v16 = [v5 makeOTControl:&obj];
  objc_storeStrong(v56, obj);
  if (v16)
  {
    int v17 = [[OTControlArguments alloc] initWithConfiguration:v5];
    uint64_t v18 = [v5 escrowFetchSource];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __54__OTClique_findOptimalBottleIDsWithContextData_error___block_invoke;
    v33[3] = &unk_1E5477A10;
    uint8_t v33[4] = buf;
    v33[5] = &v41;
    v33[6] = &v35;
    [v16 fetchAllViableBottles:v17 source:v18 reply:v33];

    if (a4)
    {
      int v19 = *(void **)(*(void *)&buf[8] + 40);
      if (v19) {
        *a4 = v19;
      }
    }
    uint64_t v20 = objc_alloc_init(OTBottleIDs);
    [(OTBottleIDs *)v20 setPreferredBottleIDs:v42[5]];
    [(OTBottleIDs *)v20 setPartialRecoveryBottleIDs:v36[5]];
    __int16 v21 = secLogObjForScope("clique-findbottle");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v47 = 0;
      _os_log_impl(&dword_18B299000, v21, OS_LOG_TYPE_DEFAULT, "findOptimalBottleIDsWithContextData complete", v47, 2u);
    }

    uint64_t v22 = *(void *)(*(void *)&buf[8] + 40);
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v10, v11);
    int v24 = _OctagonSignpostLogSystem();
    uint64_t v25 = v24;
    if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_DWORD *)id v47 = 67240192;
      LODWORD(v48) = v22 == 0;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v25, OS_SIGNPOST_INTERVAL_END, v10, "FindOptimalBottleIDsWithContextData", " OctagonSignpostNameFindOptimalBottleIDsWithContextData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFindOptimalBottleIDsWithContextData}d ", v47, 8u);
    }

    __int16 v26 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v47 = 134218496;
      os_signpost_id_t v48 = v10;
      __int16 v49 = 2048;
      double v50 = (double)Nanoseconds / 1000000000.0;
      __int16 v51 = 1026;
      BOOL v52 = v22 == 0;
      _os_log_impl(&dword_18B299000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FindOptimalBottleIDsWithContextData  OctagonSignpostNameFindOptimalBottleIDsWithContextData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFindOptimalBottleIDsWithContextData}d ", v47, 0x1Cu);
    }
  }
  else
  {
    int v27 = secLogObjForScope("clique-findbottle");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      os_signpost_id_t v28 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)id v47 = 138412290;
      os_signpost_id_t v48 = v28;
      _os_log_impl(&dword_18B299000, v27, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", v47, 0xCu);
    }

    if (a4) {
      *a4 = *(id *)(*(void *)&buf[8] + 40);
    }
    unint64_t v29 = _OctagonSignpostGetNanoseconds(v10, v11);
    os_signpost_id_t v30 = _OctagonSignpostLogSystem();
    os_signpost_id_t v31 = v30;
    if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_DWORD *)id v47 = 67240192;
      LODWORD(v48) = 0;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v31, OS_SIGNPOST_INTERVAL_END, v10, "FindOptimalBottleIDsWithContextData", " OctagonSignpostNameFindOptimalBottleIDsWithContextData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFindOptimalBottleIDsWithContextData}d ", v47, 8u);
    }

    __int16 v26 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v47 = 134218496;
      os_signpost_id_t v48 = v10;
      __int16 v49 = 2048;
      double v50 = (double)v29 / 1000000000.0;
      __int16 v51 = 1026;
      BOOL v52 = 0;
      _os_log_impl(&dword_18B299000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FindOptimalBottleIDsWithContextData  OctagonSignpostNameFindOptimalBottleIDsWithContextData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFindOptimalBottleIDsWithContextData}d ", v47, 0x1Cu);
    }
    uint64_t v20 = 0;
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(buf, 8);

  return v20;
}

void __54__OTClique_findOptimalBottleIDsWithContextData_error___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  os_signpost_id_t v10 = secLogObjForScope("clique-findbottle");
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      int v23 = 138412290;
      id v24 = v9;
      int v12 = "findOptimalBottleIDsWithContextData errored: %@";
      unint64_t v13 = v10;
      uint32_t v14 = 12;
LABEL_6:
      _os_log_impl(&dword_18B299000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v23, v14);
    }
  }
  else if (v11)
  {
    int v23 = 138412546;
    id v24 = v7;
    __int16 v25 = 2112;
    id v26 = v8;
    int v12 = "findOptimalBottleIDsWithContextData succeeded: %@, %@";
    unint64_t v13 = v10;
    uint32_t v14 = 22;
    goto LABEL_6;
  }

  uint64_t v15 = *(void *)(a1[4] + 8);
  os_signpost_id_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
  id v17 = v9;

  uint64_t v18 = *(void *)(a1[5] + 8);
  int v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v7;
  id v20 = v7;

  uint64_t v21 = *(void *)(a1[6] + 8);
  uint64_t v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v8;
}

+ (id)fetchEscrowRecordsInternal:(id)a3 error:(id *)a4
{
  v31[2] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = secLogObjForScope("clique-fetchrecords");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 context];
    id v8 = [v5 altDSID];
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_18B299000, v6, OS_LOG_TYPE_DEFAULT, "fetching escrow records for context:%@, altdsid:%@", buf, 0x16u);
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  unint64_t v29 = __Block_byref_object_copy__5170;
  os_signpost_id_t v30 = __Block_byref_object_dispose__5171;
  v31[0] = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  int v23 = __Block_byref_object_copy__5170;
  id v24 = __Block_byref_object_dispose__5171;
  id v25 = 0;
  id obj = 0;
  id v9 = [v5 makeOTControl:&obj];
  objc_storeStrong(v31, obj);
  if (v9)
  {
    os_signpost_id_t v10 = [[OTControlArguments alloc] initWithConfiguration:v5];
    uint64_t v11 = [v5 escrowFetchSource];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __45__OTClique_fetchEscrowRecordsInternal_error___block_invoke;
    v18[3] = &unk_1E54779E8;
    v18[4] = buf;
    v18[5] = &v20;
    [v9 fetchEscrowRecords:v10 source:v11 reply:v18];

    if (a4)
    {
      int v12 = *(void **)(*(void *)&buf[8] + 40);
      if (v12) {
        *a4 = v12;
      }
    }
    unint64_t v13 = secLogObjForScope("clique-fetchrecords");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v26 = 0;
      _os_log_impl(&dword_18B299000, v13, OS_LOG_TYPE_DEFAULT, "fetchEscrowRecords complete", v26, 2u);
    }

    id v14 = (id)v21[5];
  }
  else
  {
    uint64_t v15 = secLogObjForScope("clique-fetchrecords");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)id v26 = 138412290;
      uint64_t v27 = v16;
      _os_log_impl(&dword_18B299000, v15, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", v26, 0xCu);
    }

    id v14 = 0;
    if (a4) {
      *a4 = *(id *)(*(void *)&buf[8] + 40);
    }
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(buf, 8);

  return v14;
}

void __45__OTClique_fetchEscrowRecordsInternal_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = secLogObjForScope("clique-fetchrecords");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v15 = 138412290;
      id v16 = v6;
      id v9 = "fetchEscrowRecords errored: %@";
LABEL_6:
      _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, 0xCu);
    }
  }
  else if (v8)
  {
    int v15 = 138412290;
    id v16 = v5;
    id v9 = "fetchEscrowRecords succeeded: %@";
    goto LABEL_6;
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
  id v12 = v6;

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v5;
}

+ (id)performEscrowRecoveryWithContextData:(id)a3 escrowArguments:(id)a4 error:(id *)a5
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (+[OTClique isCloudServicesAvailable])
  {
    id v9 = _OctagonSignpostLogSystem();
    os_signpost_id_t v10 = os_signpost_id_generate(v9);
    uint64_t v109 = mach_continuous_time();

    uint64_t v11 = _OctagonSignpostLogSystem();
    id v12 = v11;
    unint64_t v110 = v10 - 1;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PerformEscrowRecovery", " enableTelemetry=YES ", buf, 2u);
    }

    uint64_t v13 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      *(void *)&uint8_t buf[4] = v10;
      _os_log_impl(&dword_18B299000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PerformEscrowRecovery  enableTelemetry=YES ", buf, 0xCu);
    }

    v114 = [[OTClique alloc] initWithContextData:v7];
    id v14 = secLogObjForScope("clique-recovery");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = [v7 context];
      id v16 = [v7 altDSID];
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_18B299000, v14, OS_LOG_TYPE_DEFAULT, "attempting an escrow recovery for context:%@, altdsid:%@", buf, 0x16u);
    }
    uint64_t v17 = [v7 sbd];
    uint64_t v18 = v17;
    if (v17) {
      id v113 = v17;
    }
    else {
      id v113 = objc_alloc_init((Class)getSecureBackupClass());
    }

    uint64_t v20 = _OctagonSignpostLogSystem();
    os_signpost_id_t v21 = os_signpost_id_generate(v20);
    uint64_t v22 = mach_continuous_time();

    int v23 = _OctagonSignpostLogSystem();
    id v24 = v23;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v21, "PerformRecoveryFromSBD", " enableTelemetry=YES ", buf, 2u);
    }

    id v25 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      *(void *)&uint8_t buf[4] = v21;
      _os_log_impl(&dword_18B299000, v25, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PerformRecoveryFromSBD  enableTelemetry=YES ", buf, 0xCu);
    }

    id v119 = 0;
    id v26 = [v113 recoverWithInfo:v8 results:&v119];
    id v112 = v119;
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v21, v22);
    os_signpost_id_t v28 = _OctagonSignpostLogSystem();
    unint64_t v29 = v28;
    if (v21 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v28))
    {
      *(_DWORD *)long long buf = 67240192;
      *(_DWORD *)&uint8_t buf[4] = v26 == 0;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v29, OS_SIGNPOST_INTERVAL_END, v21, "PerformRecoveryFromSBD", " OctagonSignpostNamePerformRecoveryFromSBD=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformRecoveryFromSBD}d ", buf, 8u);
    }

    os_signpost_id_t v30 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(double *)&buf[14] = (double)Nanoseconds / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v121) = v26 == 0;
      _os_log_impl(&dword_18B299000, v30, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformRecoveryFromSBD  OctagonSignpostNamePerformRecoveryFromSBD=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformRecoveryFromSBD}d ", buf, 0x1Cu);
    }

    if (v26)
    {
      os_signpost_id_t v31 = secLogObjForScope("clique-recovery");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v26;
        _os_log_impl(&dword_18B299000, v31, OS_LOG_TYPE_DEFAULT, "sbd escrow recovery failed: %@", buf, 0xCu);
      }

      if (a5) {
        *a5 = v26;
      }
      unint64_t v32 = _OctagonSignpostGetNanoseconds(v10, v109);
      id v33 = _OctagonSignpostLogSystem();
      os_signpost_id_t v34 = v33;
      if (v110 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v33))
      {
        *(_DWORD *)long long buf = 67240192;
        *(_DWORD *)&uint8_t buf[4] = 0;
        _os_signpost_emit_with_name_impl(&dword_18B299000, v34, OS_SIGNPOST_INTERVAL_END, v10, "PerformEscrowRecovery", " OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", buf, 8u);
      }

      uint64_t v35 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134218496;
        *(void *)&uint8_t buf[4] = v10;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(double *)&buf[14] = (double)v32 / 1000000000.0;
        *(_WORD *)&buf[22] = 1026;
        LODWORD(v121) = 0;
        _os_log_impl(&dword_18B299000, v35, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformEscrowRecovery  OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", buf, 0x1Cu);
      }
      int v19 = 0;
      id v111 = 0;
      goto LABEL_131;
    }
    *(void *)v124 = 0;
    *(void *)&v124[8] = v124;
    *(void *)&v124[16] = 0x2020000000;
    __int16 v36 = (void *)getkSecureBackupRecoveryKeyKeySymbolLoc_ptr;
    uint64_t v125 = getkSecureBackupRecoveryKeyKeySymbolLoc_ptr;
    if (!getkSecureBackupRecoveryKeyKeySymbolLoc_ptr)
    {
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getkSecureBackupRecoveryKeyKeySymbolLoc_block_invoke;
      v121 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E5484FA0;
      v122 = (void (*)(uint64_t))v124;
      uint64_t v37 = CloudServicesLibrary();
      unint64_t v38 = dlsym(v37, "kSecureBackupRecoveryKeyKey");
      *(void *)(*((void *)v122 + 1) + 24) = v38;
      getkSecureBackupRecoveryKeyKeySymbolLoc_ptr = *(void *)(*((void *)v122 + 1) + 24);
      __int16 v36 = *(void **)(*(void *)&v124[8] + 24);
    }
    _Block_object_dispose(v124, 8);
    if (v36)
    {
      uint64_t v108 = [v8 objectForKeyedSubscript:*v36];
      *(void *)v124 = 0;
      *(void *)&v124[8] = v124;
      *(void *)&v124[16] = 0x2020000000;
      int v39 = (void *)getkSecureBackupUsesRecoveryKeyKeySymbolLoc_ptr;
      uint64_t v125 = getkSecureBackupUsesRecoveryKeyKeySymbolLoc_ptr;
      if (!getkSecureBackupUsesRecoveryKeyKeySymbolLoc_ptr)
      {
        *(void *)long long buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getkSecureBackupUsesRecoveryKeyKeySymbolLoc_block_invoke;
        v121 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E5484FA0;
        v122 = (void (*)(uint64_t))v124;
        id v40 = CloudServicesLibrary();
        uint64_t v41 = dlsym(v40, "kSecureBackupUsesRecoveryKeyKey");
        *(void *)(*((void *)v122 + 1) + 24) = v41;
        getkSecureBackupUsesRecoveryKeyKeySymbolLoc_ptr = *(void *)(*((void *)v122 + 1) + 24);
        int v39 = *(void **)(*(void *)&v124[8] + 24);
      }
      _Block_object_dispose(v124, 8);
      if (v39)
      {
        v107 = [v8 objectForKeyedSubscript:*v39];
        if (v108 || [v107 BOOLValue])
        {
          id v118 = 0;
          uint64_t v42 = [(OTClique *)v114 fetchCliqueStatus:&v118];
          id v43 = v118;
          if (!v42)
          {
            id v111 = v43;
            char v45 = secLogObjForScope("clique-recovery");
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl(&dword_18B299000, v45, OS_LOG_TYPE_DEFAULT, "recovery key used during secure backup recovery, skipping bottle check", buf, 2u);
            }

            id v46 = secLogObjForScope("clique-recovery");
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412290;
              *(void *)&uint8_t buf[4] = v114;
              _os_log_impl(&dword_18B299000, v46, OS_LOG_TYPE_DEFAULT, "recovery complete: %@", buf, 0xCu);
            }

            unint64_t v47 = _OctagonSignpostGetNanoseconds(v10, v109);
            os_signpost_id_t v48 = _OctagonSignpostLogSystem();
            __int16 v49 = v48;
            if (v110 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v48))
            {
              *(_DWORD *)long long buf = 67240192;
              *(_DWORD *)&uint8_t buf[4] = v114 != 0;
              _os_signpost_emit_with_name_impl(&dword_18B299000, v49, OS_SIGNPOST_INTERVAL_END, v10, "PerformEscrowRecovery", " OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", buf, 8u);
            }

            double v50 = _OctagonSignpostLogSystem();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 134218496;
              *(void *)&uint8_t buf[4] = v10;
              *(_WORD *)&unsigned char buf[12] = 2048;
              *(double *)&buf[14] = (double)v47 / 1000000000.0;
              *(_WORD *)&buf[22] = 1026;
              LODWORD(v121) = v114 != 0;
              _os_log_impl(&dword_18B299000, v50, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformEscrowRecovery  OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", buf, 0x1Cu);
            }

            int v19 = v114;
            goto LABEL_130;
          }
          uint64_t v44 = v43;
        }
        else
        {
          uint64_t v44 = 0;
        }
        id v117 = v44;
        v106 = [(OTClique *)v114 makeOTControl:&v117];
        id v111 = v117;

        if (!v106)
        {
          v88 = secLogObjForScope("clique-recovery");
          if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v111;
            _os_log_impl(&dword_18B299000, v88, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", buf, 0xCu);
          }

          if (a5) {
            *a5 = v111;
          }
          unint64_t v89 = _OctagonSignpostGetNanoseconds(v10, v109);
          v90 = _OctagonSignpostLogSystem();
          v91 = v90;
          if (v110 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v90))
          {
            *(_DWORD *)long long buf = 67240192;
            *(_DWORD *)&uint8_t buf[4] = 0;
            _os_signpost_emit_with_name_impl(&dword_18B299000, v91, OS_SIGNPOST_INTERVAL_END, v10, "PerformEscrowRecovery", " OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", buf, 8u);
          }

          v92 = _OctagonSignpostLogSystem();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 134218496;
            *(void *)&uint8_t buf[4] = v10;
            *(_WORD *)&unsigned char buf[12] = 2048;
            *(double *)&buf[14] = (double)v89 / 1000000000.0;
            *(_WORD *)&buf[22] = 1026;
            LODWORD(v121) = 0;
            _os_log_impl(&dword_18B299000, v92, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformEscrowRecovery  OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", buf, 0x1Cu);
          }
          int v19 = 0;
          goto LABEL_129;
        }
        uint64_t v105 = [v112 objectForKeyedSubscript:@"bottleID"];
        v103 = [v112 objectForKeyedSubscript:@"bottleValid"];
        __int16 v51 = [v112 objectForKeyedSubscript:@"EscrowServiceEscrowData"];
        v104 = [v51 objectForKeyedSubscript:@"BottledPeerEntropy"];

        if (v104 && v105 && [v103 isEqualToString:@"valid"])
        {
          BOOL v52 = secLogObjForScope("clique-recovery");
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v105;
            _os_log_impl(&dword_18B299000, v52, OS_LOG_TYPE_DEFAULT, "recovering from bottle: %@", buf, 0xCu);
          }

          *(void *)long long buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v121 = __Block_byref_object_copy__5170;
          v122 = __Block_byref_object_dispose__5171;
          id v123 = 0;
          uint64_t v53 = _OctagonSignpostLogSystem();
          os_signpost_id_t v54 = os_signpost_id_generate(v53);
          uint64_t v55 = mach_continuous_time();

          uint64_t v56 = _OctagonSignpostLogSystem();
          uint64_t v57 = v56;
          if (v54 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
          {
            *(_WORD *)v124 = 0;
            _os_signpost_emit_with_name_impl(&dword_18B299000, v57, OS_SIGNPOST_INTERVAL_BEGIN, v54, "PerformOctagonJoin", " enableTelemetry=YES ", v124, 2u);
          }

          uint64_t v58 = _OctagonSignpostLogSystem();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v124 = 134217984;
            *(void *)&v124[4] = v54;
            _os_log_impl(&dword_18B299000, v58, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PerformOctagonJoin  enableTelemetry=YES ", v124, 0xCu);
          }

          char v59 = [[OTControlArguments alloc] initWithConfiguration:v7];
          v116[0] = MEMORY[0x1E4F143A8];
          v116[1] = 3221225472;
          v116[2] = __71__OTClique_performEscrowRecoveryWithContextData_escrowArguments_error___block_invoke;
          v116[3] = &unk_1E5481470;
          v116[4] = buf;
          [v106 restoreFromBottle:v59 entropy:v104 bottleID:v105 reply:v116];

          uint64_t v60 = *(void *)(*(void *)&buf[8] + 40);
          unint64_t v61 = _OctagonSignpostGetNanoseconds(v54, v55);
          uint64_t v62 = _OctagonSignpostLogSystem();
          uint64_t v63 = v62;
          if (v54 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
          {
            *(_DWORD *)v124 = 67240192;
            *(_DWORD *)&v124[4] = v60 == 0;
            _os_signpost_emit_with_name_impl(&dword_18B299000, v63, OS_SIGNPOST_INTERVAL_END, v54, "PerformOctagonJoin", " OctagonSignpostNamePerformOctagonJoin=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformOctagonJoin}d ", v124, 8u);
          }

          id v64 = _OctagonSignpostLogSystem();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v124 = 134218496;
            *(void *)&v124[4] = v54;
            *(_WORD *)&v124[12] = 2048;
            *(double *)&v124[14] = (double)v61 / 1000000000.0;
            *(_WORD *)&v124[22] = 1026;
            LODWORD(v125) = v60 == 0;
            _os_log_impl(&dword_18B299000, v64, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformOctagonJoin  OctagonSignpostNamePerformOctagonJoin=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformOctagonJoin}d ", v124, 0x1Cu);
          }

          id v65 = *(void **)(*(void *)&buf[8] + 40);
          if (v65)
          {
            if (a5) {
              *a5 = v65;
            }
            unint64_t v66 = _OctagonSignpostGetNanoseconds(v10, v109);
            uint64_t v67 = _OctagonSignpostLogSystem();
            double v68 = v67;
            if (v110 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
            {
              *(void *)v124 = 67240192;
              _os_signpost_emit_with_name_impl(&dword_18B299000, v68, OS_SIGNPOST_INTERVAL_END, v10, "PerformEscrowRecovery", " OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", v124, 8u);
            }

            id v69 = _OctagonSignpostLogSystem();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v124 = 134218496;
              *(void *)&v124[4] = v10;
              *(_WORD *)&v124[12] = 2048;
              *(double *)&v124[14] = (double)v66 / 1000000000.0;
              *(_WORD *)&v124[22] = 1026;
              LODWORD(v125) = 0;
              _os_log_impl(&dword_18B299000, v69, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformEscrowRecovery  OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", v124, 0x1Cu);
            }

            _Block_object_dispose(buf, 8);
LABEL_105:
            int v19 = 0;
LABEL_128:

            v92 = v105;
LABEL_129:

LABEL_130:
            uint64_t v35 = v108;
LABEL_131:

            goto LABEL_132;
          }
          _Block_object_dispose(buf, 8);
        }
        else
        {
          uint64_t v70 = secLogObjForScope("clique-recovery");
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v105;
            _os_log_impl(&dword_18B299000, v70, OS_LOG_TYPE_DEFAULT, "bottle %@ is not valid, resetting octagon", buf, 0xCu);
          }

          uint64_t v71 = _OctagonSignpostLogSystem();
          os_signpost_id_t v72 = os_signpost_id_generate(v71);
          uint64_t v73 = mach_continuous_time();

          uint64_t v74 = _OctagonSignpostLogSystem();
          uint64_t v75 = v74;
          if (v72 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v74))
          {
            *(_WORD *)long long buf = 0;
            _os_signpost_emit_with_name_impl(&dword_18B299000, v75, OS_SIGNPOST_INTERVAL_BEGIN, v72, "PerformResetAndEstablishAfterFailedBottle", " enableTelemetry=YES ", buf, 2u);
          }

          v76 = _OctagonSignpostLogSystem();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 134217984;
            *(void *)&uint8_t buf[4] = v72;
            _os_log_impl(&dword_18B299000, v76, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PerformResetAndEstablishAfterFailedBottle  enableTelemetry=YES ", buf, 0xCu);
          }

          id v115 = 0;
          -[OTClique resetAndEstablish:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:isGuitarfish:error:](v114, "resetAndEstablish:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:isGuitarfish:error:", 3, 0, 0, 0, 0, [v7 isGuitarfish], &v115);
          id v77 = v115;
          unint64_t v78 = _OctagonSignpostGetNanoseconds(v72, v73);
          long long v79 = _OctagonSignpostLogSystem();
          v80 = v79;
          if (v72 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v79))
          {
            *(_DWORD *)long long buf = 67240192;
            *(_DWORD *)&uint8_t buf[4] = v77 == 0;
            _os_signpost_emit_with_name_impl(&dword_18B299000, v80, OS_SIGNPOST_INTERVAL_END, v72, "PerformResetAndEstablishAfterFailedBottle", " OctagonSignpostNamePerformResetAndEstablishAfterFailedBottle=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformResetAndEstablishAfterFailedBottle}d ", buf, 8u);
          }

          v81 = _OctagonSignpostLogSystem();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 134218496;
            *(void *)&uint8_t buf[4] = v72;
            *(_WORD *)&unsigned char buf[12] = 2048;
            *(double *)&buf[14] = (double)v78 / 1000000000.0;
            *(_WORD *)&buf[22] = 1026;
            LODWORD(v121) = v77 == 0;
            _os_log_impl(&dword_18B299000, v81, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformResetAndEstablishAfterFailedBottle  OctagonSignpostNamePerformResetAndEstablishAfterFailedBottle=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformResetAndEstablishAfterFailedBottle}d ", buf, 0x1Cu);
          }

          v82 = secLogObjForScope("clique-recovery");
          BOOL v83 = os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT);
          if (v77)
          {
            if (v83)
            {
              *(_DWORD *)long long buf = 138412290;
              *(void *)&uint8_t buf[4] = v77;
              _os_log_impl(&dword_18B299000, v82, OS_LOG_TYPE_DEFAULT, "failed to reset octagon: %@", buf, 0xCu);
            }

            if (a5) {
              *a5 = v77;
            }
            unint64_t v84 = _OctagonSignpostGetNanoseconds(v10, v109);
            v85 = _OctagonSignpostLogSystem();
            v86 = v85;
            if (v110 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v85))
            {
              *(_DWORD *)long long buf = 67240192;
              *(_DWORD *)&uint8_t buf[4] = 0;
              _os_signpost_emit_with_name_impl(&dword_18B299000, v86, OS_SIGNPOST_INTERVAL_END, v10, "PerformEscrowRecovery", " OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", buf, 8u);
            }

            v87 = _OctagonSignpostLogSystem();
            if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 134218496;
              *(void *)&uint8_t buf[4] = v10;
              *(_WORD *)&unsigned char buf[12] = 2048;
              *(double *)&buf[14] = (double)v84 / 1000000000.0;
              *(_WORD *)&buf[22] = 1026;
              LODWORD(v121) = 0;
              _os_log_impl(&dword_18B299000, v87, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformEscrowRecovery  OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", buf, 0x1Cu);
            }

            goto LABEL_105;
          }
          if (v83)
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_18B299000, v82, OS_LOG_TYPE_DEFAULT, "reset octagon succeeded", buf, 2u);
          }
        }
        v93 = secLogObjForScope("clique-recovery");
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v114;
          _os_log_impl(&dword_18B299000, v93, OS_LOG_TYPE_DEFAULT, "recovery complete: %@", buf, 0xCu);
        }

        unint64_t v94 = _OctagonSignpostGetNanoseconds(v10, v109);
        v95 = _OctagonSignpostLogSystem();
        v96 = v95;
        if (v110 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v95))
        {
          *(_DWORD *)long long buf = 67240192;
          *(_DWORD *)&uint8_t buf[4] = v114 != 0;
          _os_signpost_emit_with_name_impl(&dword_18B299000, v96, OS_SIGNPOST_INTERVAL_END, v10, "PerformEscrowRecovery", " OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", buf, 8u);
        }

        v97 = _OctagonSignpostLogSystem();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 134218496;
          *(void *)&uint8_t buf[4] = v10;
          *(_WORD *)&unsigned char buf[12] = 2048;
          *(double *)&buf[14] = (double)v94 / 1000000000.0;
          *(_WORD *)&buf[22] = 1026;
          LODWORD(v121) = v114 != 0;
          _os_log_impl(&dword_18B299000, v97, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformEscrowRecovery  OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", buf, 0x1Cu);
        }

        int v19 = v114;
        goto LABEL_128;
      }
      v101 = [MEMORY[0x1E4F28B00] currentHandler];
      v102 = [NSString stringWithUTF8String:"NSString *getkSecureBackupUsesRecoveryKeyKey(void)"];
      objc_msgSend(v101, "handleFailureInFunction:file:lineNumber:description:", v102, @"OTClique.m", 83, @"%s", dlerror());
    }
    else
    {
      v99 = [MEMORY[0x1E4F28B00] currentHandler];
      v100 = [NSString stringWithUTF8String:"NSString *getkSecureBackupRecoveryKeyKey(void)"];
      objc_msgSend(v99, "handleFailureInFunction:file:lineNumber:description:", v100, @"OTClique.m", 82, @"%s", dlerror());
    }
    __break(1u);
  }
  if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-4 userInfo:0];
    int v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v19 = 0;
  }
LABEL_132:

  return v19;
}

void __71__OTClique_performEscrowRecoveryWithContextData_escrowArguments_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = secLogObjForScope("clique-recovery");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v11 = 138412290;
      id v12 = v3;
      id v6 = "restore bottle errored: %@";
      id v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v11) = 0;
    id v6 = "restoring bottle succeeded";
    id v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  os_signpost_id_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v3;
}

+ (BOOL)isCloudServicesAvailable
{
  uint64_t v2 = CloudServicesLibraryCore();
  if (!v2 && isCloudServicesAvailable_onceToken != -1) {
    dispatch_once(&isCloudServicesAvailable_onceToken, &__block_literal_global_5234);
  }
  return v2 != 0;
}

void __36__OTClique_isCloudServicesAvailable__block_invoke()
{
  dispatch_queue_t v0 = secLogObjForScope("octagon");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_18B299000, v0, OS_LOG_TYPE_DEFAULT, "CloudServices is unavailable on this platform", v1, 2u);
  }
}

+ (id)newFriendsWithContextData:(id)a3 resetReason:(int64_t)a4 error:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint32_t v8 = secLogObjForScope("clique-newfriends");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v7 context];
    os_signpost_id_t v10 = [v7 altDSID];
    *(_DWORD *)long long buf = 138412546;
    os_signpost_id_t v35 = (os_signpost_id_t)v9;
    __int16 v36 = 2112;
    double v37 = *(double *)&v10;
    _os_log_impl(&dword_18B299000, v8, OS_LOG_TYPE_DEFAULT, "makeNewFriends invoked using context: %@, altdsid: %@", buf, 0x16u);
  }
  int v11 = _OctagonSignpostLogSystem();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  uint64_t v13 = mach_continuous_time();

  id v14 = _OctagonSignpostLogSystem();
  int v15 = v14;
  unint64_t v16 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B299000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v12, "MakeNewFriends", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v17 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    os_signpost_id_t v35 = v12;
    _os_log_impl(&dword_18B299000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: MakeNewFriends  enableTelemetry=YES ", buf, 0xCu);
  }

  uint64_t v18 = [[OTClique alloc] initWithContextData:v7];
  id v33 = 0;
  -[OTClique resetAndEstablish:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:isGuitarfish:error:](v18, "resetAndEstablish:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:isGuitarfish:error:", a4, 0, 0, 0, 0, [v7 isGuitarfish], &v33);
  id v19 = v33;
  uint64_t v20 = secLogObjForScope("clique-newfriends");
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v21)
    {
      *(_DWORD *)long long buf = 138412290;
      os_signpost_id_t v35 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_18B299000, v20, OS_LOG_TYPE_DEFAULT, "account reset failed: %@", buf, 0xCu);
    }

    if (a5) {
      *a5 = v19;
    }
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v12, v13);
    int v23 = _OctagonSignpostLogSystem();
    id v24 = v23;
    if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_DWORD *)long long buf = 67240192;
      LODWORD(v35) = 0;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v24, OS_SIGNPOST_INTERVAL_END, v12, "MakeNewFriends", " OctagonSignpostNameMakeNewFriends=%{public,signpost.telemetry:number1,name=OctagonSignpostNameMakeNewFriends}d ", buf, 8u);
    }

    id v25 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      os_signpost_id_t v35 = v12;
      __int16 v36 = 2048;
      double v37 = (double)Nanoseconds / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = 0;
      _os_log_impl(&dword_18B299000, v25, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: MakeNewFriends  OctagonSignpostNameMakeNewFriends=%{public,signpost.telemetry:number1,name=OctagonSignpostNameMakeNewFriends}d ", buf, 0x1Cu);
    }

    id v26 = 0;
  }
  else
  {
    if (v21)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18B299000, v20, OS_LOG_TYPE_DEFAULT, "Octagon account reset succeeded", buf, 2u);
    }

    uint64_t v27 = secLogObjForScope("clique-newfriends");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18B299000, v27, OS_LOG_TYPE_DEFAULT, "makeNewFriends complete", buf, 2u);
    }

    unint64_t v28 = _OctagonSignpostGetNanoseconds(v12, v13);
    unint64_t v29 = _OctagonSignpostLogSystem();
    os_signpost_id_t v30 = v29;
    if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_DWORD *)long long buf = 67240192;
      LODWORD(v35) = 1;
      _os_signpost_emit_with_name_impl(&dword_18B299000, v30, OS_SIGNPOST_INTERVAL_END, v12, "MakeNewFriends", " OctagonSignpostNameMakeNewFriends=%{public,signpost.telemetry:number1,name=OctagonSignpostNameMakeNewFriends}d ", buf, 8u);
    }

    os_signpost_id_t v31 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      os_signpost_id_t v35 = v12;
      __int16 v36 = 2048;
      double v37 = (double)v28 / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = 1;
      _os_log_impl(&dword_18B299000, v31, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: MakeNewFriends  OctagonSignpostNameMakeNewFriends=%{public,signpost.telemetry:number1,name=OctagonSignpostNameMakeNewFriends}d ", buf, 0x1Cu);
    }

    id v26 = v18;
  }

  return v26;
}

+ (id)newFriendsWithContextData:(id)a3 error:(id *)a4
{
  return +[OTClique newFriendsWithContextData:a3 resetReason:1 error:a4];
}

+ (BOOL)platformSupportsSOS
{
  int IsSOSFeatureEnabled = OctagonIsSOSFeatureEnabled();
  if (IsSOSFeatureEnabled) {
    LOBYTE(IsSOSFeatureEnabled) = !SOSCompatibilityModeEnabled();
  }
  return IsSOSFeatureEnabled;
}

@end