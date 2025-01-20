@interface CDPCompatibilityModeUpdater
+ (BOOL)_onlyOctagonRKNotSetWithContext:(id)a3;
+ (BOOL)setSOSCompatibilityMode:(BOOL)a3 context:(id)a4 error:(id *)a5;
@end

@implementation CDPCompatibilityModeUpdater

+ (BOOL)setSOSCompatibilityMode:(BOOL)a3 context:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a4;
  if (![MEMORY[0x263F34400] deferSOSFromSignIn]
    || !+[CDPDOctagonTrustProxyImpl octagonIsSOSFeatureEnabled])
  {
    v19 = _CDPLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v19, OS_LOG_TYPE_DEFAULT, "DeferSOSFromSignIn is false or platform does not support SOS, SOSCCSetCompatibilityMode will not be called.", buf, 2u);
    }

    if (a5)
    {
      v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v21 = -5004;
LABEL_21:
      objc_msgSend(v20, "cdp_errorWithCode:", v21);
      LOBYTE(v15) = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    }
LABEL_36:
    LOBYTE(v15) = 0;
    goto LABEL_37;
  }
  if (!v6 && ![a1 _onlyOctagonRKNotSetWithContext:v8])
  {
    v29 = _CDPLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v29, OS_LOG_TYPE_DEFAULT, "Ignore disable SOSCCSetCompatibilityMode", buf, 2u);
    }

    if (a5)
    {
      v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v21 = -5315;
      goto LABEL_21;
    }
    goto LABEL_36;
  }
  v31 = 0;
  v9 = _CDPSignpostLogSystem();
  os_signpost_id_t v10 = _CDPSignpostCreate();

  v11 = _CDPSignpostLogSystem();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_218640000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SOSCCSetCompatibilityMode", " enableTelemetry=YES ", buf, 2u);
  }

  v13 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)v33 = v10;
    _os_log_impl(&dword_218640000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SOSCCSetCompatibilityMode  enableTelemetry=YES ", buf, 0xCu);
  }

  v14 = _CDPLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v33 = v6;
    _os_log_impl(&dword_218640000, v14, OS_LOG_TYPE_DEFAULT, "Setting SOSCCSetCompatibilityMode: %d", buf, 8u);
  }

  int v15 = SOSCCSetCompatibilityMode();
  v16 = _CDPLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v33 = v15;
    *(_WORD *)&v33[4] = 2112;
    *(void *)&v33[6] = v31;
    _os_log_impl(&dword_218640000, v16, OS_LOG_TYPE_DEFAULT, "Set compatibility mode initial success state: %d, error: %@", buf, 0x12u);
  }

  v17 = _CDPLogSystem();
  v18 = v17;
  if (v15)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v18, OS_LOG_TYPE_DEFAULT, "Successfully set SOSCCSetCompatibilityMode", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    +[CDPCompatibilityModeUpdater setSOSCompatibilityMode:context:error:]((uint64_t *)&v31, v18);
  }

  v22 = v31;
  uint64_t Nanoseconds = _CDPSignpostGetNanoseconds();
  v24 = _CDPSignpostLogSystem();
  v25 = v24;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    int v26 = [v22 code];
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)v33 = v26;
    _os_signpost_emit_with_name_impl(&dword_218640000, v25, OS_SIGNPOST_INTERVAL_END, v10, "SOSCCSetCompatibilityMode", " releaseError=%{public,signpost.telemetry:number1,name=releaseError}d ", buf, 8u);
  }

  v27 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = [v22 code];
    *(_DWORD *)buf = 134218496;
    *(void *)v33 = v10;
    *(_WORD *)&v33[8] = 2048;
    *(double *)&v33[10] = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v34 = 1026;
    int v35 = v28;
    _os_log_impl(&dword_218640000, v27, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SOSCCSetCompatibilityMode  releaseError=%{public,signpost.telemetry:number1,name=releaseError}d ", buf, 0x1Cu);
  }

  if (a5) {
    *a5 = v22;
  }

LABEL_37:
  return v15;
}

+ (BOOL)_onlyOctagonRKNotSetWithContext:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [[CDPRecoveryKeyStatusProvider alloc] initWithContext:v3];

  if ([(CDPRecoveryKeyStatusProvider *)v4 idmsHasRK])
  {
    id v13 = 0;
    BOOL v5 = [(CDPRecoveryKeyStatusProvider *)v4 isRecoveryKeySetInOctagonWithError:&v13];
    id v6 = v13;
    id v12 = 0;
    BOOL v7 = [(CDPRecoveryKeyStatusProvider *)v4 isRecoveryKeySetInOctagonWithError:&v12];
    id v8 = v12;
    v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67110146;
      int v15 = 1;
      __int16 v16 = 1024;
      BOOL v17 = v5;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 1024;
      BOOL v21 = v7;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_debug_impl(&dword_218640000, v9, OS_LOG_TYPE_DEBUG, "_onlyOctagonHasMissingRKWithContext idMSHasRK: %d, octagonHasRK: %d, octagonError: %@, sosHasRK: %d, sosError: %@", buf, 0x28u);
    }

    BOOL v10 = v7 && !v5;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (void)setSOSCompatibilityMode:(uint64_t *)a1 context:(NSObject *)a2 error:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_218640000, a2, OS_LOG_TYPE_ERROR, "Failed to update SOSCCSetCompatibilityMode with error: %@", (uint8_t *)&v3, 0xCu);
}

@end