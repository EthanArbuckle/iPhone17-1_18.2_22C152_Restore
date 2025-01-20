@interface CDPCircleProxyImpl
+ (unint64_t)syncingStatusForAltDSID:(id)a3;
- (BOOL)_registerCredentialsOnlyIfNeeded:(BOOL)a3;
- (BOOL)anyPeerHasEnabledViewsInSet:(id)a3 error:(id *)a4;
- (BOOL)canAuthenticate;
- (BOOL)fetchUserControllableViewsSyncingEnabled:(id *)a3;
- (BOOL)hasNonViewAwarePeers;
- (BOOL)isLastBackupMakingPeer:(id *)a3;
- (BOOL)isRecoveryKeySet:(id)a3 error:(id *)a4;
- (BOOL)platformSupportsSOS;
- (BOOL)registerCredentials;
- (BOOL)registerCredentialsIfMissing;
- (BOOL)removeNonViewAwarePeers:(id *)a3;
- (BOOL)removeThisDeviceFromCircle:(id *)a3;
- (BOOL)requestToJoinCircle:(id *)a3;
- (BOOL)requestToJoinCircleAfterRestore:(id *)a3;
- (BOOL)setUserControllableViewsSyncStatus:(BOOL)a3 error:(id *)a4;
- (BOOL)synchronizeCircleViews;
- (BOOL)tryRegisteringCredentials;
- (BOOL)waitForInitialSync:(id *)a3;
- (CDPCircleProxyImpl)initWithContext:(id)a3;
- (CDPCircleProxyImpl)initWithContext:(id)a3 clique:(id)a4;
- (CDPContext)cdpContext;
- (id)_initializeRecoveryKeyWithInfo:(id)a3 error:(id *)a4;
- (id)_pairingChannelContext;
- (id)contextType;
- (id)generateRecoveryKeyWithInfo:(id)a3 error:(id *)a4;
- (id)generateVerifierWithRecoveryKey:(id)a3 error:(id *)a4;
- (id)pairingChannelAcceptor;
- (id)pairingChannelInitiator;
- (id)peerDeviceNamesByPeerID;
- (id)peerId;
- (id)requestToResetProtectedData:(id *)a3;
- (int)_sos_authenticatedCircleStatus:(id *)a3;
- (int)_sos_circleStatus:(id *)a3;
- (int)cachedSOSCircleStatus:(id *)a3;
- (int)nonCachedSOSCircleStatus:(id *)a3;
- (int64_t)_authenticatedCliqueStatus:(id *)a3;
- (int64_t)cliqueStatus:(id *)a3;
- (unint64_t)cachedCliqueStatus:(id *)a3;
- (unint64_t)cdpStatusFromOT:(int64_t)a3;
- (unint64_t)cdpStatusFromSOS:(int)a3;
- (unint64_t)combinedCachedCircleStatus:(id *)a3;
- (unint64_t)combinedCircleStatus:(id *)a3;
- (void)_recoverOctagonUsingRecoveryKey:(id)a3 completion:(id)a4;
- (void)canAuthenticate;
- (void)didJoinCircleAfterRecovery:(id)a3;
- (void)hasNonViewAwarePeers;
- (void)recoverOctagonUsingCustodianInfo:(id)a3 completion:(id)a4;
- (void)reportFailure:(id)a3;
- (void)reportSuccess;
- (void)synchronizeCircleViews;
- (void)tryRegisteringCredentials;
- (void)waitForUpdate;
@end

@implementation CDPCircleProxyImpl

- (CDPCircleProxyImpl)initWithContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 cliqueConfiguration];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F16D30]);
    v7 = [v4 cliqueConfiguration];
    v8 = (void *)[v6 initWithContextData:v7];
    self = [(CDPCircleProxyImpl *)self initWithContext:v4 clique:v8];

    v9 = self;
  }
  else
  {
    v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[CDPCircleProxyImpl initWithContext:]();
    }

    v9 = 0;
  }

  return v9;
}

- (CDPCircleProxyImpl)initWithContext:(id)a3 clique:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 dsid];

  if (v9)
  {
    v19.receiver = self;
    v19.super_class = (Class)CDPCircleProxyImpl;
    v10 = [(CDPCircleProxyImpl *)&v19 init];
    p_isa = (id *)&v10->super.isa;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_cdpContext, a3);
      objc_storeStrong(p_isa + 1, a4);
    }
    v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v7 appleID];
      v14 = [v7 dsid];
      uint64_t v15 = [v7 type];
      *(_DWORD *)buf = 141559042;
      uint64_t v21 = 1752392040;
      __int16 v22 = 2112;
      v23 = v13;
      __int16 v24 = 2160;
      uint64_t v25 = 1752392040;
      __int16 v26 = 2112;
      v27 = v14;
      __int16 v28 = 2048;
      uint64_t v29 = v15;
      _os_log_impl(&dword_2182AE000, v12, OS_LOG_TYPE_DEFAULT, "CDPCircleProxyImpl: appleID:%{mask.hash}@, dsid: %{mask.hash}@, type: %ld", buf, 0x34u);
    }
    self = p_isa;
    v16 = self;
  }
  else
  {
    v17 = _CDPLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[CDPCircleProxyImpl initWithContext:clique:]();
    }

    v16 = 0;
  }

  return v16;
}

- (void)didJoinCircleAfterRecovery:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_clique, a3);
    id v5 = v6;
  }
}

- (unint64_t)cachedCliqueStatus:(id *)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  if (self->_clique)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F16D58]);
    [v5 setUseCachedAccountStatus:1];
    clique = self->_clique;
    id v14 = 0;
    uint64_t v7 = [(OTClique *)clique fetchCliqueStatus:v5 error:&v14];
    id v8 = v14;
    v9 = _CDPLogSystem();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[CDPCircleProxyImpl cachedCliqueStatus:]();
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [NSNumber numberWithInteger:v7];
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_impl(&dword_2182AE000, v10, OS_LOG_TYPE_DEFAULT, "Call to cachedCliqueStatus returned a status: %@", buf, 0xCu);
    }
    if (a3) {
      *a3 = v8;
    }
    unint64_t v11 = [(CDPCircleProxyImpl *)self cdpStatusFromOT:v7];
  }
  else
  {
    uint64_t v17 = *MEMORY[0x263F08320];
    v18[0] = @"CDPContext was missing DSID when CircleProxyImpl was initialized. Its OTClique was not created.";
    id v8 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    if (!a3)
    {
      unint64_t v11 = -1;
      goto LABEL_15;
    }
    _CDPStateError(-5003, (uint64_t)v8);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CDPCircleProxyImpl cachedCliqueStatus:]();
    }
    unint64_t v11 = -1;
  }

LABEL_15:
  return v11;
}

- (BOOL)platformSupportsSOS
{
  return [MEMORY[0x263F16D30] platformSupportsSOS];
}

- (unint64_t)combinedCachedCircleStatus:(id *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = _CDPSignpostLogSystem();
  os_signpost_id_t v6 = _CDPSignpostCreate(v5);
  uint64_t v8 = v7;

  v9 = _CDPSignpostLogSystem();
  v10 = v9;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CachedCircleStatus", " enableTelemetry=YES ", (uint8_t *)&v18, 2u);
  }

  unint64_t v11 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 134217984;
    os_signpost_id_t v19 = v6;
    _os_log_impl(&dword_2182AE000, v11, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CachedCircleStatus  enableTelemetry=YES ", (uint8_t *)&v18, 0xCu);
  }

  unint64_t v12 = [(CDPCircleProxyImpl *)self cachedCliqueStatus:a3];
  if (!+[CDPUtilities deferSOSFromSignIn] && v12 == 1)
  {
    if ([(CDPCircleProxyImpl *)self platformSupportsSOS]) {
      unint64_t v12 = [(CDPCircleProxyImpl *)self cdpStatusFromSOS:[(CDPCircleProxyImpl *)self cachedSOSCircleStatus:a3]];
    }
    else {
      unint64_t v12 = 1;
    }
  }
  unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(v6, v8);
  id v14 = _CDPSignpostLogSystem();
  uint64_t v15 = v14;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    int v18 = 67240192;
    LODWORD(v19) = v12;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v15, OS_SIGNPOST_INTERVAL_END, v6, "CachedCircleStatus", " status=%{public,signpost.telemetry:number1,name=status}d ", (uint8_t *)&v18, 8u);
  }

  v16 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 134218496;
    os_signpost_id_t v19 = v6;
    __int16 v20 = 2048;
    double v21 = (double)Nanoseconds / 1000000000.0;
    __int16 v22 = 1026;
    int v23 = v12;
    _os_log_impl(&dword_2182AE000, v16, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CachedCircleStatus  status=%{public,signpost.telemetry:number1,name=status}d ", (uint8_t *)&v18, 0x1Cu);
  }

  return v12;
}

- (int)cachedSOSCircleStatus:(id *)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([(CDPContext *)self->_cdpContext isBeneficiaryAccount])
  {
    id v4 = _CDPLogSystem();
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
    os_signpost_id_t v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2182AE000, v6, OS_LOG_TYPE_DEFAULT, "Checking circle status with SOSCCThisDeviceIsInCircle", buf, 2u);
    }

    int v5 = SOSCCThisDeviceIsInCircle();
    uint64_t v7 = _CDPLogSystem();
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

- (unint64_t)combinedCircleStatus:(id *)a3
{
  int v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2182AE000, v5, OS_LOG_TYPE_DEFAULT, "Checking combined circle status", buf, 2u);
  }

  int64_t v6 = [(CDPCircleProxyImpl *)self _authenticatedCliqueStatus:a3];
  if (+[CDPUtilities deferSOSFromSignIn]
    || v6
    || ![(CDPCircleProxyImpl *)self platformSupportsSOS])
  {
    return [(CDPCircleProxyImpl *)self cdpStatusFromOT:v6];
  }
  uint64_t v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2182AE000, v7, OS_LOG_TYPE_DEFAULT, "Checking SOS status.", v9, 2u);
  }

  return [(CDPCircleProxyImpl *)self cdpStatusFromSOS:[(CDPCircleProxyImpl *)self _sos_circleStatus:a3]];
}

- (void)waitForUpdate
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)v13 = "-[CDPCircleProxyImpl waitForUpdate]";
    *(_WORD *)&v13[8] = 1024;
    *(_DWORD *)&v13[10] = 147;
    _os_log_impl(&dword_2182AE000, v3, OS_LOG_TYPE_DEFAULT, "%s (%d) called", buf, 0x12u);
  }

  if ([(CDPContext *)self->_cdpContext isiCDPEligible])
  {
    clique = self->_clique;
    id v11 = 0;
    int v5 = [(OTClique *)clique waitForOctagonUpgrade:&v11];
    int64_t v6 = v11;
    uint64_t v7 = _CDPLogSystem();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:

      goto LABEL_10;
    }
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v13 = v5;
    *(_WORD *)&v13[4] = 2114;
    *(void *)&v13[6] = v6;
    uint64_t v8 = "Clique waitForOctagonUpgrade %{BOOL}d with error %{public}@";
    v9 = v7;
    uint32_t v10 = 18;
LABEL_8:
    _os_log_impl(&dword_2182AE000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    goto LABEL_9;
  }
  int64_t v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(CDPContext *)self->_cdpContext altDSID];
    *(_DWORD *)buf = 141558274;
    *(void *)v13 = 1752392040;
    *(_WORD *)&v13[8] = 2112;
    *(void *)&v13[10] = v7;
    uint64_t v8 = "Account for %{mask.hash}@ is not eligible for iCDP, not calling waitForOctagonUpgrade";
    v9 = v6;
    uint32_t v10 = 22;
    goto LABEL_8;
  }
LABEL_10:
}

- (void)reportSuccess
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    clique = self->_clique;
    int v7 = 138412290;
    uint64_t v8 = clique;
    _os_log_impl(&dword_2182AE000, v3, OS_LOG_TYPE_DEFAULT, "Reporting success for %@", (uint8_t *)&v7, 0xCu);
  }

  int v5 = self->_clique;
  int64_t v6 = [(CDPCircleProxyImpl *)self contextType];
  [(OTClique *)v5 performedSuccessfulCDPStateMachineRun:v6 reply:&__block_literal_global_0];
}

- (void)reportFailure:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    clique = self->_clique;
    int v9 = 138412290;
    uint32_t v10 = clique;
    _os_log_impl(&dword_2182AE000, v5, OS_LOG_TYPE_DEFAULT, "Reporting failure for %@", (uint8_t *)&v9, 0xCu);
  }

  int v7 = self->_clique;
  uint64_t v8 = [(CDPCircleProxyImpl *)self contextType];
  [(OTClique *)v7 performedFailureCDPStateMachineRun:v8 error:v4 reply:&__block_literal_global_37];
}

- (id)contextType
{
  int64_t v2 = [(CDPContext *)self->_cdpContext type];
  if ((unint64_t)(v2 - 1) > 6) {
    v3 = (void **)MEMORY[0x263F16D88];
  }
  else {
    v3 = (void **)qword_264316F88[v2 - 1];
  }
  id v4 = *v3;
  return v4;
}

- (unint64_t)cdpStatusFromSOS:(int)a3
{
  if ((a3 + 1) > 4) {
    return 0;
  }
  else {
    return qword_2183050E0[a3 + 1];
  }
}

- (unint64_t)cdpStatusFromOT:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 5) {
    return 0;
  }
  else {
    return qword_218305108[a3 + 1];
  }
}

- (int64_t)cliqueStatus:(id *)a3
{
  v33[1] = *MEMORY[0x263EF8340];
  int v5 = _CDPSignpostLogSystem();
  os_signpost_id_t v6 = _CDPSignpostCreate(v5);
  uint64_t v8 = v7;

  int v9 = _CDPSignpostLogSystem();
  uint32_t v10 = v9;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CircleStatus", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v11 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v27 = v6;
    _os_log_impl(&dword_2182AE000, v11, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CircleStatus  enableTelemetry=YES ", buf, 0xCu);
  }

  clique = self->_clique;
  if (clique)
  {
    v13 = clique;
    uint64_t v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      os_signpost_id_t v27 = (os_signpost_id_t)v13;
      _os_log_impl(&dword_2182AE000, v14, OS_LOG_TYPE_DEFAULT, "Checking clique status with fetchCliqueStatus from %@", buf, 0xCu);
    }

    id v25 = 0;
    int64_t v15 = [v13 fetchCliqueStatus:&v25];
    id v16 = v25;
    uint64_t v17 = _CDPLogSystem();
    int v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[CDPCircleProxyImpl cliqueStatus:]();
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      os_signpost_id_t v19 = [NSNumber numberWithInteger:v15];
      *(_DWORD *)buf = 138412290;
      os_signpost_id_t v27 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_2182AE000, v18, OS_LOG_TYPE_DEFAULT, "Call to fetchCliqueStatus returned a status: %@", buf, 0xCu);
    }
    if (a3) {
      *a3 = v16;
    }
    unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(v6, v8);
    double v21 = _CDPSignpostLogSystem();
    __int16 v22 = v21;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_DWORD *)buf = 67240192;
      LODWORD(v27) = v15;
      _os_signpost_emit_with_name_impl(&dword_2182AE000, v22, OS_SIGNPOST_INTERVAL_END, v6, "CircleStatus", " status=%{public,signpost.telemetry:number1,name=status}d ", buf, 8u);
    }

    int v23 = _CDPSignpostLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      os_signpost_id_t v27 = v6;
      __int16 v28 = 2048;
      double v29 = (double)Nanoseconds / 1000000000.0;
      __int16 v30 = 1026;
      int v31 = v15;
      _os_log_impl(&dword_2182AE000, v23, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CircleStatus  status=%{public,signpost.telemetry:number1,name=status}d ", buf, 0x1Cu);
    }
  }
  else
  {
    uint64_t v32 = *MEMORY[0x263F08320];
    v33[0] = @"CDPContext was missing DSID when CircleProxyImpl was initialized. Its OTClique was not created.";
    id v16 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
    if (!a3)
    {
      int64_t v15 = -1;
      goto LABEL_27;
    }
    _CDPStateError(-5003, (uint64_t)v16);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CDPCircleProxyImpl cachedCliqueStatus:]();
    }
    int64_t v15 = -1;
  }

LABEL_27:
  return v15;
}

- (int64_t)_authenticatedCliqueStatus:(id *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v9 = 0;
  int64_t v4 = [(CDPCircleProxyImpl *)self cliqueStatus:&v9];
  id v5 = v9;
  os_signpost_id_t v6 = v5;
  if (a3) {
    *a3 = v5;
  }
  uint64_t v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    int64_t v11 = v4;
    __int16 v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_2182AE000, v7, OS_LOG_TYPE_DEFAULT, "Got authenticated clique status %lu with error: %@", buf, 0x16u);
  }

  return v4;
}

- (int)_sos_authenticatedCircleStatus:(id *)a3
{
  id v11 = 0;
  int v5 = [(CDPCircleProxyImpl *)self _sos_circleStatus:&v11];
  id v6 = v11;
  if ((v5 + 1) <= 4 && ((1 << (v5 + 1)) & 0x15) != 0)
  {
    if (![(CDPCircleProxyImpl *)self tryRegisteringCredentials]) {
      [(CDPCircleProxyImpl *)self registerCredentials];
    }
    id v10 = v6;
    int v5 = [(CDPCircleProxyImpl *)self _sos_circleStatus:&v10];
    id v8 = v10;

    id v6 = v8;
  }
  if (a3) {
    *a3 = v6;
  }

  return v5;
}

- (int)_sos_circleStatus:(id *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ([(CDPContext *)self->_cdpContext isBeneficiaryAccount])
  {
    int v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_2182AE000, v5, OS_LOG_TYPE_DEFAULT, "Beneficiary account detected. Faking non-cached SOS circle status.", (uint8_t *)&v18, 2u);
    }
    int v6 = 0;
  }
  else
  {
    uint64_t v7 = _CDPSignpostLogSystem();
    os_signpost_id_t v8 = _CDPSignpostCreate(v7);
    uint64_t v10 = v9;

    id v11 = _CDPSignpostLogSystem();
    __int16 v12 = v11;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      LOWORD(v18) = 0;
      _os_signpost_emit_with_name_impl(&dword_2182AE000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SOSCircleStatus", " enableTelemetry=YES ", (uint8_t *)&v18, 2u);
    }

    v13 = _CDPSignpostLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134217984;
      os_signpost_id_t v19 = v8;
      _os_log_impl(&dword_2182AE000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SOSCircleStatus  enableTelemetry=YES ", (uint8_t *)&v18, 0xCu);
    }

    int v6 = [(CDPCircleProxyImpl *)self nonCachedSOSCircleStatus:a3];
    unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(v8, v10);
    int64_t v15 = _CDPSignpostLogSystem();
    id v16 = v15;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      int v18 = 67240192;
      LODWORD(v19) = v6;
      _os_signpost_emit_with_name_impl(&dword_2182AE000, v16, OS_SIGNPOST_INTERVAL_END, v8, "SOSCircleStatus", " status=%{public,signpost.telemetry:number1,name=status}d ", (uint8_t *)&v18, 8u);
    }

    int v5 = _CDPSignpostLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134218496;
      os_signpost_id_t v19 = v8;
      __int16 v20 = 2048;
      double v21 = (double)Nanoseconds / 1000000000.0;
      __int16 v22 = 1026;
      int v23 = v6;
      _os_log_impl(&dword_2182AE000, v5, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SOSCircleStatus  status=%{public,signpost.telemetry:number1,name=status}d ", (uint8_t *)&v18, 0x1Cu);
    }
  }

  return v6;
}

- (int)nonCachedSOSCircleStatus:(id *)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int64_t v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2182AE000, v4, OS_LOG_TYPE_DEFAULT, "Checking circle status with SOSCCThisDeviceIsInCircle", buf, 2u);
  }

  int v5 = SOSCCThisDeviceIsInCircleNonCached();
  int v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v9 = v5;
    _os_log_impl(&dword_2182AE000, v6, OS_LOG_TYPE_DEFAULT, "Call to SOSCCThisDeviceIsInCircle returned a status: %d", buf, 8u);
  }

  if (a3) {
    *a3 = 0;
  }
  return v5;
}

- (id)peerId
{
  return (id)[(OTClique *)self->_clique cliqueMemberIdentifier];
}

- (id)peerDeviceNamesByPeerID
{
  clique = self->_clique;
  uint64_t v5 = 0;
  v3 = [(OTClique *)clique peerDeviceNamesByPeerID:&v5];
  return v3;
}

- (id)generateRecoveryKeyWithInfo:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x270EFDC08](a4, a2, a3);
}

- (id)generateVerifierWithRecoveryKey:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x270EFDC00](a3, a4);
}

- (BOOL)waitForInitialSync:(id *)a3
{
  uint64_t v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_2182AE000, v5, OS_LOG_TYPE_DEFAULT, "Calling waitForPriorityViewKeychainDataRecovery", v13, 2u);
  }

  int v6 = (void *)MEMORY[0x263F202A8];
  uint64_t v7 = [(CDPCircleProxyImpl *)self cdpContext];
  os_signpost_id_t v8 = [v6 analyticsEventWithContext:v7 eventName:@"com.apple.corecdp.waitForPriorityViewKeychainDataRecovery" category:0x26C984850];

  uint64_t v9 = [(OTClique *)self->_clique waitForPriorityViewKeychainDataRecovery:a3];
  uint64_t v10 = [NSNumber numberWithBool:v9];
  [v8 setObject:v10 forKeyedSubscript:*MEMORY[0x263F20330]];

  if (a3) {
    [v8 populateUnderlyingErrorsStartingWithRootError:*a3];
  }
  id v11 = +[CDPAnalyticsReporterRTC rtcAnalyticsReporter];
  [v11 sendEvent:v8];

  return v9;
}

- (BOOL)synchronizeCircleViews
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v3 = _CDPSignpostLogSystem();
  os_signpost_id_t v4 = _CDPSignpostCreate(v3);
  uint64_t v6 = v5;

  uint64_t v7 = _CDPSignpostLogSystem();
  os_signpost_id_t v8 = v7;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v4, "SynchronizeCircleViews", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v9 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)uint64_t v24 = v4;
    _os_log_impl(&dword_2182AE000, v9, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SynchronizeCircleViews  enableTelemetry=YES ", buf, 0xCu);
  }

  if ([(CDPCircleProxyImpl *)self combinedCircleStatus:0] == 1)
  {
    id v22 = 0;
    BOOL v10 = [(CDPCircleProxyImpl *)self waitForInitialSync:&v22];
    id v11 = v22;
    __int16 v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)uint64_t v24 = v10;
      *(_WORD *)&v24[4] = 2112;
      *(void *)&v24[6] = v11;
      _os_log_impl(&dword_2182AE000, v12, OS_LOG_TYPE_DEFAULT, "Finished calling SOSCCWaitForInitialSync didSync=%i error=%@", buf, 0x12u);
    }

    if (!v10)
    {
      uint64_t v21 = 0;
      BOOL v13 = [(CDPCircleProxyImpl *)self removeThisDeviceFromCircle:&v21];
      uint64_t v14 = _CDPLogSystem();
      int64_t v15 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[CDPCircleProxyImpl synchronizeCircleViews]();
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[CDPCircleProxyImpl synchronizeCircleViews]();
      }
    }
  }
  else
  {
    id v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2182AE000, v11, OS_LOG_TYPE_DEFAULT, "Skipping initial sync because we are not in a circle", buf, 2u);
    }
    BOOL v10 = 1;
  }

  unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(v4, v6);
  uint64_t v17 = _CDPSignpostLogSystem();
  int v18 = v17;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)uint64_t v24 = v10;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v18, OS_SIGNPOST_INTERVAL_END, v4, "SynchronizeCircleViews", " didSync=%{public,signpost.telemetry:number1,name=didSync}d ", buf, 8u);
  }

  os_signpost_id_t v19 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    *(void *)uint64_t v24 = v4;
    *(_WORD *)&v24[8] = 2048;
    *(double *)&v24[10] = (double)Nanoseconds / 1000000000.0;
    __int16 v25 = 1026;
    BOOL v26 = v10;
    _os_log_impl(&dword_2182AE000, v19, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SynchronizeCircleViews  didSync=%{public,signpost.telemetry:number1,name=didSync}d ", buf, 0x1Cu);
  }

  return v10;
}

- (BOOL)removeThisDeviceFromCircle:(id *)a3
{
  uint64_t v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2182AE000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to remove self from circle", buf, 2u);
  }

  clique = self->_clique;
  id v13 = 0;
  int v7 = [(OTClique *)clique leaveClique:&v13];
  id v8 = v13;
  uint64_t v9 = v8;
  if (v7)
  {
    BOOL v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v12 = 0;
      _os_log_impl(&dword_2182AE000, v10, OS_LOG_TYPE_DEFAULT, "Removed device from circle successfully", v12, 2u);
    }
  }
  else
  {
    *a3 = v8;
    BOOL v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CDPCircleProxyImpl removeThisDeviceFromCircle:]();
    }
  }

  return v7;
}

- (BOOL)requestToJoinCircle:(id *)a3
{
  uint64_t v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CDPCircleProxyImpl requestToJoinCircle:]();
  }

  return [(OTClique *)self->_clique requestToJoinCircle:a3];
}

- (BOOL)requestToJoinCircleAfterRestore:(id *)a3
{
  uint64_t v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CDPCircleProxyImpl requestToJoinCircleAfterRestore:]();
  }

  return [(OTClique *)self->_clique joinAfterRestore:a3];
}

- (id)requestToResetProtectedData:(id *)a3
{
  uint64_t v5 = [(CDPContext *)self->_cdpContext cliqueConfiguration];
  uint64_t v6 = [(CDPContext *)self->_cdpContext passwordEquivToken];
  [v5 setPasswordEquivalentToken:v6];

  int v7 = [(CDPContext *)self->_cdpContext appleID];
  [v5 setAuthenticationAppleID:v7];

  id v13 = 0;
  id v8 = [MEMORY[0x263F16D30] resetProtectedData:v5 error:&v13];
  id v9 = v13;
  BOOL v10 = v9;
  if (!v8 || v9)
  {
    id v11 = 0;
    if (a3 && v9)
    {
      id v11 = 0;
      *a3 = v9;
    }
  }
  else
  {
    id v11 = v8;
  }

  return v11;
}

- (BOOL)fetchUserControllableViewsSyncingEnabled:(id *)a3
{
  return [(OTClique *)self->_clique fetchUserControllableViewsSyncingEnabled:a3];
}

- (BOOL)anyPeerHasEnabledViewsInSet:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (MEMORY[0x21D466740]())
  {
    clique = self->_clique;
    id v8 = [v6 allObjects];
    char v9 = [(OTClique *)clique peersHaveViewsEnabled:v8 error:a4];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (BOOL)hasNonViewAwarePeers
{
  clique = self->_clique;
  id v8 = 0;
  v3 = (void *)[(OTClique *)clique copyViewUnawarePeerInfo:&v8];
  id v4 = v8;
  if (v4)
  {
    uint64_t v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CDPCircleProxyImpl hasNonViewAwarePeers]();
    }
  }
  BOOL v6 = [v3 count] != 0;

  return v6;
}

- (BOOL)removeNonViewAwarePeers:(id *)a3
{
  [(CDPCircleProxyImpl *)self registerCredentials];
  clique = self->_clique;
  id v16 = 0;
  BOOL v6 = (void *)[(OTClique *)clique copyViewUnawarePeerInfo:&v16];
  id v7 = v16;
  id v8 = v7;
  if (a3) {
    *a3 = v7;
  }
  if (v6)
  {
    char v9 = self->_clique;
    id v15 = 0;
    int v10 = [(OTClique *)v9 removeFriendsInClique:v6 error:&v15];
    id v11 = v15;
    __int16 v12 = _CDPLogSystem();
    id v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[CDPCircleProxyImpl removeNonViewAwarePeers:]();
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[CDPCircleProxyImpl removeNonViewAwarePeers:]();
    }

    if (a3)
    {
      id v11 = v11;
      *a3 = v11;
    }
  }
  else
  {
    id v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[CDPCircleProxyImpl removeNonViewAwarePeers:]();
    }
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)isLastBackupMakingPeer:(id *)a3
{
  return 0;
}

- (BOOL)setUserControllableViewsSyncStatus:(BOOL)a3 error:(id *)a4
{
  return [(OTClique *)self->_clique setUserControllableViewsSyncStatus:a3 error:a4];
}

- (BOOL)registerCredentialsIfMissing
{
  return [(CDPCircleProxyImpl *)self _registerCredentialsOnlyIfNeeded:1];
}

- (BOOL)registerCredentials
{
  return [(CDPCircleProxyImpl *)self _registerCredentialsOnlyIfNeeded:0];
}

- (BOOL)_registerCredentialsOnlyIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v53 = *MEMORY[0x263EF8340];
  uint64_t v5 = self->_cdpContext;
  BOOL v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(CDPContext *)v5 appleID];
    id v8 = [(CDPContext *)v5 dsid];
    *(_DWORD *)buf = 141559042;
    *(void *)&uint8_t buf[4] = 1752392040;
    __int16 v45 = 2112;
    double v46 = *(double *)&v7;
    __int16 v47 = 2160;
    uint64_t v48 = 1752392040;
    __int16 v49 = 2112;
    v50 = v8;
    __int16 v51 = 2048;
    uint64_t v52 = [(CDPContext *)v5 type];
    _os_log_impl(&dword_2182AE000, v6, OS_LOG_TYPE_DEFAULT, "_registerCredentialsOnlyIfNeeded: appleID:%{mask.hash}@, dsid: %{mask.hash}@, type: %ld", buf, 0x34u);
  }
  uint64_t v9 = [(CDPContext *)v5 appleID];
  if (!v9) {
    goto LABEL_11;
  }
  int v10 = (void *)v9;
  uint64_t v11 = [(CDPContext *)v5 password];
  if (!v11)
  {

LABEL_11:
    uint64_t v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[CDPCircleProxyImpl _registerCredentialsOnlyIfNeeded:]();
    }
    goto LABEL_13;
  }
  __int16 v12 = (void *)v11;
  id v13 = [(CDPContext *)v5 dsid];

  if (!v13) {
    goto LABEL_11;
  }
  if (v3 && [(CDPCircleProxyImpl *)self canAuthenticate])
  {
    uint64_t v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2182AE000, v14, OS_LOG_TYPE_DEFAULT, "Security indicated that no credential is needed nor did we force", buf, 2u);
    }
LABEL_13:
    char v15 = 0;
    goto LABEL_14;
  }
  uint64_t v17 = _CDPLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2182AE000, v17, OS_LOG_TYPE_DEFAULT, "Calling Clique setUserCredentialsAndDSID", buf, 2u);
  }

  int v18 = [(CDPContext *)v5 password];
  os_signpost_id_t v19 = [v18 dataUsingEncoding:4];

  __int16 v20 = _CDPSignpostLogSystem();
  os_signpost_id_t v21 = _CDPSignpostCreate(v20);
  uint64_t v23 = v22;

  uint64_t v24 = _CDPSignpostLogSystem();
  __int16 v25 = v24;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v21, "SetUserCredentialsAndDSID", " enableTelemetry=YES ", buf, 2u);
  }

  BOOL v26 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v21;
    _os_log_impl(&dword_2182AE000, v26, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SetUserCredentialsAndDSID  enableTelemetry=YES ", buf, 0xCu);
  }

  v43[1] = 0;
  if (+[CDPUtilities deferSOSFromSignIn]
    && SOSCCFetchCompatibilityMode())
  {
    uint64_t v27 = _CDPLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2182AE000, v27, OS_LOG_TYPE_DEFAULT, "Calling SOSCCSetUserCredentialsAndDSID", buf, 2u);
    }

    *(void *)buf = 0;
    __int16 v28 = [(CDPContext *)v5 appleID];
    double v29 = [(CDPContext *)v5 dsid];
    [v29 stringValue];
    char v15 = SOSCCSetUserCredentialsAndDSID();

    if ((v15 & 1) == 0)
    {
      __int16 v30 = _CDPLogSystem();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[CDPCircleProxyImpl _registerCredentialsOnlyIfNeeded:]();
      }
    }
    uint64_t v14 = 0;
  }
  else
  {
    clique = self->_clique;
    uint64_t v32 = [(CDPContext *)v5 dsid];
    v33 = [v32 stringValue];
    v43[0] = 0;
    int v34 = [(OTClique *)clique setUserCredentialsAndDSID:v33 password:v19 error:v43];
    uint64_t v14 = v43[0];

    v35 = _CDPLogSystem();
    v36 = v35;
    if (v34)
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2182AE000, v36, OS_LOG_TYPE_DEFAULT, "Credentials set through Clique setUserCredentialsAndDSID", buf, 2u);
      }

      char v15 = 1;
    }
    else
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        -[CDPCircleProxyImpl _registerCredentialsOnlyIfNeeded:]();
      }

      char v15 = 0;
    }
  }
  unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(v21, v23);
  v38 = _CDPSignpostLogSystem();
  v39 = v38;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    int v40 = [v14 code];
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&uint8_t buf[4] = v40;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v39, OS_SIGNPOST_INTERVAL_END, v21, "SetUserCredentialsAndDSID", " Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 8u);
  }

  v41 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    int v42 = [v14 code];
    *(_DWORD *)buf = 134218496;
    *(void *)&uint8_t buf[4] = v21;
    __int16 v45 = 2048;
    double v46 = (double)Nanoseconds / 1000000000.0;
    __int16 v47 = 1026;
    LODWORD(v48) = v42;
    _os_log_impl(&dword_2182AE000, v41, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SetUserCredentialsAndDSID  Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 0x1Cu);
  }

LABEL_14:
  return v15;
}

- (BOOL)tryRegisteringCredentials
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  BOOL v3 = self->_cdpContext;
  uint64_t v4 = [(CDPContext *)v3 appleID];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = [(CDPContext *)v3 dsid];
    if (v6)
    {
      id v7 = (void *)v6;
      id v8 = [(CDPContext *)v3 password];

      if (v8)
      {
        uint64_t v9 = [(CDPContext *)v3 password];
        int v10 = [v9 dataUsingEncoding:4];

        uint64_t v11 = [(CDPContext *)v3 dsid];
        __int16 v12 = [v11 stringValue];

        id v13 = _CDPSignpostLogSystem();
        os_signpost_id_t v14 = _CDPSignpostCreate(v13);
        uint64_t v16 = v15;

        uint64_t v17 = _CDPSignpostLogSystem();
        int v18 = v17;
        if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_2182AE000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v14, "TryUserCredentialsAndDSID", " enableTelemetry=YES ", buf, 2u);
        }

        os_signpost_id_t v19 = _CDPSignpostLogSystem();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v14;
          _os_log_impl(&dword_2182AE000, v19, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: TryUserCredentialsAndDSID  enableTelemetry=YES ", buf, 0xCu);
        }

        uint64_t v39 = 0;
        if (+[CDPUtilities deferSOSFromSignIn]
          && SOSCCFetchCompatibilityMode())
        {
          *(void *)buf = 0;
          __int16 v20 = [(CDPContext *)v3 appleID];
          os_signpost_id_t v21 = [(CDPContext *)v3 dsid];
          [v21 stringValue];
          char v22 = SOSCCTryUserCredentialsAndDSID();

          uint64_t v23 = _CDPLogSystem();
          uint64_t v24 = v23;
          if (v22)
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v38 = 0;
              _os_log_impl(&dword_2182AE000, v24, OS_LOG_TYPE_DEFAULT, "Registered credentials through try attempt", v38, 2u);
            }
          }
          else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            -[CDPCircleProxyImpl tryRegisteringCredentials]();
          }

          __int16 v25 = 0;
        }
        else
        {
          clique = self->_clique;
          id v37 = 0;
          int v27 = [(OTClique *)clique tryUserCredentialsAndDSID:v12 password:v10 error:&v37];
          __int16 v25 = v37;
          __int16 v28 = _CDPLogSystem();
          double v29 = v28;
          if (v27)
          {
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2182AE000, v29, OS_LOG_TYPE_DEFAULT, "Registered credentials through OT tryUserCredentialsAndDSID", buf, 2u);
            }

            char v22 = 1;
          }
          else
          {
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
              -[CDPCircleProxyImpl tryRegisteringCredentials]();
            }

            char v22 = 0;
          }
        }
        unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(v14, v16);
        int v31 = _CDPSignpostLogSystem();
        uint64_t v32 = v31;
        if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
        {
          int v33 = [v25 code];
          *(_DWORD *)buf = 67240192;
          *(_DWORD *)&uint8_t buf[4] = v33;
          _os_signpost_emit_with_name_impl(&dword_2182AE000, v32, OS_SIGNPOST_INTERVAL_END, v14, "TryUserCredentialsAndDSID", " Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 8u);
        }

        int v34 = _CDPSignpostLogSystem();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          int v35 = [v25 code];
          *(_DWORD *)buf = 134218496;
          *(void *)&uint8_t buf[4] = v14;
          __int16 v41 = 2048;
          double v42 = (double)Nanoseconds / 1000000000.0;
          __int16 v43 = 1026;
          int v44 = v35;
          _os_log_impl(&dword_2182AE000, v34, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: TryUserCredentialsAndDSID  Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 0x1Cu);
        }

        goto LABEL_34;
      }
    }
    else
    {
    }
  }
  __int16 v25 = _CDPLogSystem();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    -[CDPCircleProxyImpl tryRegisteringCredentials]();
  }
  char v22 = 0;
LABEL_34:

  return v22;
}

- (BOOL)canAuthenticate
{
  char v2 = [(OTClique *)self->_clique accountUserKeyAvailable];
  if ((v2 & 1) == 0)
  {
    BOOL v3 = _CDPLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[CDPCircleProxyImpl canAuthenticate]();
    }
  }
  return v2;
}

- (id)pairingChannelInitiator
{
  clique = self->_clique;
  BOOL v3 = [(CDPCircleProxyImpl *)self _pairingChannelContext];
  uint64_t v4 = [(OTClique *)clique setupPairingChannelAsInitiator:v3];

  return v4;
}

- (id)pairingChannelAcceptor
{
  clique = self->_clique;
  BOOL v3 = [(CDPCircleProxyImpl *)self _pairingChannelContext];
  uint64_t v4 = [(OTClique *)clique setupPairingChannelAsAcceptor:v3];

  return v4;
}

- (id)_pairingChannelContext
{
  id v3 = objc_alloc_init(MEMORY[0x263F50FA0]);
  uint64_t v4 = +[CDPLocalDevice sharedInstance];
  uint64_t v5 = [v4 hardwareModel];
  [v3 setModel:v5];

  uint64_t v6 = +[CDPLocalDevice sharedInstance];
  id v7 = [v6 modelVersion];
  [v3 setModelVersion:v7];

  id v8 = +[CDPLocalDevice sharedInstance];
  uint64_t v9 = [v8 deviceClass];
  [v3 setModelClass:v9];

  int v10 = +[CDPLocalDevice sharedInstance];
  uint64_t v11 = [v10 osVersion];
  [v3 setOsVersion:v11];

  if (objc_opt_respondsToSelector())
  {
    __int16 v12 = [(CDPContext *)self->_cdpContext telemetryFlowID];
    [v3 setFlowID:v12];
  }
  if (objc_opt_respondsToSelector())
  {
    id v13 = [(CDPContext *)self->_cdpContext telemetryDeviceSessionID];
    [v3 setDeviceSessionID:v13];
  }
  return v3;
}

- (void)recoverOctagonUsingCustodianInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263F202A8];
  uint64_t v9 = [(CDPCircleProxyImpl *)self cdpContext];
  int v10 = [v8 analyticsEventWithContext:v9 eventName:@"com.apple.corecdp.custodianRecovery" category:0x26C984850];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [v6 recordBuildVersion];
    [v10 setObject:v11 forKeyedSubscript:@"recordBuildVersion"];
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __66__CDPCircleProxyImpl_recoverOctagonUsingCustodianInfo_completion___block_invoke;
  v21[3] = &unk_264316F68;
  id v12 = v10;
  id v22 = v12;
  id v13 = v7;
  id v23 = v13;
  os_signpost_id_t v14 = (void (**)(void, void))MEMORY[0x21D4671C0](v21);
  id v20 = 0;
  uint64_t v15 = [(CDPCircleProxyImpl *)self _initializeRecoveryKeyWithInfo:v6 error:&v20];
  id v16 = v20;
  uint64_t v17 = _CDPLogSystem();
  int v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CDPCircleProxyImpl recoverOctagonUsingCustodianInfo:completion:]();
    }

    ((void (**)(void, id))v14)[2](v14, v16);
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)os_signpost_id_t v19 = 0;
      _os_log_impl(&dword_2182AE000, v18, OS_LOG_TYPE_DEFAULT, "Attempting to recover octagon usign custodian recovery key", v19, 2u);
    }

    [(CDPCircleProxyImpl *)self _recoverOctagonUsingRecoveryKey:v15 completion:v14];
  }
}

void __66__CDPCircleProxyImpl_recoverOctagonUsingCustodianInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v6 = v3;
  if (v3)
  {
    [v4 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"didSucceed"];
    [*(id *)(a1 + 32) populateUnderlyingErrorsStartingWithRootError:v6];
  }
  else
  {
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"didSucceed"];
  }
  uint64_t v5 = +[CDPAnalyticsReporterRTC rtcAnalyticsReporter];
  [v5 sendEvent:*(void *)(a1 + 32)];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_recoverOctagonUsingRecoveryKey:(id)a3 completion:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x263F16D30];
  cdpContext = self->_cdpContext;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(CDPContext *)cdpContext cliqueConfiguration];
  [v5 recoverOctagonUsingCustodianRecoveryKey:v9 custodianRecoveryKey:v8 reply:v7];
}

- (id)_initializeRecoveryKeyWithInfo:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[CDPCircleProxyImpl _initializeRecoveryKeyWithInfo:error:](v5, v6);
  }

  id v7 = objc_alloc(MEMORY[0x263F5B728]);
  id v8 = [v5 wrappedRKC];
  id v9 = [v5 wrappingKey];
  int v10 = [v5 custodianUUID];
  uint64_t v11 = (void *)[v7 initWithWrappedKey:v8 wrappingKey:v9 uuid:v10 error:a4];

  return v11;
}

- (BOOL)isRecoveryKeySet:(id)a3 error:(id *)a4
{
  return [MEMORY[0x263F16D30] isRecoveryKeySet:a3 error:a4];
}

+ (unint64_t)syncingStatusForAltDSID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    +[CDPCircleProxyImpl syncingStatusForAltDSID:]((uint64_t)v3, v4);
  }

  id v5 = +[CDPContext contextForAccountWithAltDSID:v3];
  id v6 = [[CDPCircleProxyImpl alloc] initWithContext:v5];
  id v11 = 0;
  unint64_t v7 = [(CDPCircleProxyImpl *)v6 combinedCircleStatus:&v11];
  id v8 = v11;
  if (v8)
  {
    id v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[CDPCircleProxyImpl syncingStatusForAltDSID:]();
    }
  }
  return v7;
}

- (CDPContext)cdpContext
{
  return self->_cdpContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdpContext, 0);
  objc_storeStrong((id *)&self->_clique, 0);
}

- (void)initWithContext:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_2182AE000, v0, OS_LOG_TYPE_FAULT, "CircleProxyImpl init is missing required cliqueConfiguration. Problems lie ahead …", v1, 2u);
}

- (void)initWithContext:clique:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_2182AE000, v0, OS_LOG_TYPE_FAULT, "CircleProxyImpl init is missing required dsid. Barring no primary account, problems lie ahead …", v1, 2u);
}

- (void)cachedCliqueStatus:.cold.1()
{
  OUTLINED_FUNCTION_5_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Circle status check failed with error: %@", v2, v3, v4, v5, v6);
}

- (void)cachedCliqueStatus:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to retrieve cachedCliqueStatus: %@", v2, v3, v4, v5, v6);
}

- (void)cachedSOSCircleStatus:.cold.1()
{
  OUTLINED_FUNCTION_5_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to check circle status: %@", v2, v3, v4, v5, v6);
}

- (void)cliqueStatus:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to check circle status: %@", v2, v3, v4, v5, v6);
}

- (void)synchronizeCircleViews
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_2182AE000, v0, OS_LOG_TYPE_ERROR, "We failed to sync and now we failed to remove self form circle, nothing good will happen here", v1, 2u);
}

- (void)removeThisDeviceFromCircle:.cold.1()
{
  OUTLINED_FUNCTION_5_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to remove self from circle - %@", v2, v3, v4, v5, v6);
}

- (void)requestToJoinCircle:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Requesting to join circle with OT requestToJoinCircle", v2, v3, v4, v5, v6);
}

- (void)requestToJoinCircleAfterRestore:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Requesting to join circle with OT joinAfterRestore", v2, v3, v4, v5, v6);
}

- (void)hasNonViewAwarePeers
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to check for non-view-aware peers with error %@", v2, v3, v4, v5, v6);
}

- (void)removeNonViewAwarePeers:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_2182AE000, v0, OS_LOG_TYPE_DEBUG, "Failed to check for non-view-aware peers before removing them from circle with error %@", v1, 0xCu);
}

- (void)removeNonViewAwarePeers:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_2182AE000, v0, OS_LOG_TYPE_DEBUG, "Removed old peers from circle: %@", v1, 0xCu);
}

- (void)removeNonViewAwarePeers:.cold.3()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_2182AE000, v1, OS_LOG_TYPE_ERROR, "Failed to remove old peers from circle with error %@ (peers: %@)", v2, 0x16u);
}

- (void)_registerCredentialsOnlyIfNeeded:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Skipping registering credentials, insufficient parameters", v2, v3, v4, v5, v6);
}

- (void)_registerCredentialsOnlyIfNeeded:.cold.2()
{
  OUTLINED_FUNCTION_5_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to call SOSCCSetUserCredentialsAndDSID with error %@", v2, v3, v4, v5, v6);
}

- (void)_registerCredentialsOnlyIfNeeded:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed Clique setUserCredentialsAndDSID with error %@", v2, v3, v4, v5, v6);
}

- (void)tryRegisteringCredentials
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed OT tryUserCredentialsAndDSID with error %@", v2, v3, v4, v5, v6);
}

- (void)canAuthenticate
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_2182AE000, v0, OS_LOG_TYPE_ERROR, "Security requires credentials...", v1, 2u);
}

- (void)recoverOctagonUsingCustodianInfo:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to obtain custodian recovery key from security with error: %@", v2, v3, v4, v5, v6);
}

- (void)_initializeRecoveryKeyWithInfo:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 custodianUUID];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_2182AE000, a2, OS_LOG_TYPE_DEBUG, "Obtaining recovery key from security for custodian recovery with UUID: %@", v4, 0xCu);
}

+ (void)syncingStatusForAltDSID:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "CDPDFollowUpController: Error fetching OT Status: %@", v2, v3, v4, v5, v6);
}

+ (void)syncingStatusForAltDSID:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 141558274;
  uint64_t v3 = 1752392040;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_2182AE000, a2, OS_LOG_TYPE_ERROR, "CDPCircleProxyImpl: fetching OT Status for altDSID: %{mask.hash}@", (uint8_t *)&v2, 0x16u);
}

@end