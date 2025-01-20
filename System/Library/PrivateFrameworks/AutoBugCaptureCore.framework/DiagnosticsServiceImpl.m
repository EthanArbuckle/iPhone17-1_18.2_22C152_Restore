@interface DiagnosticsServiceImpl
- (BOOL)_checkRateLimitForAllowance:(id)a3 time:(id)a4;
- (BOOL)assertEntitlement:(void *)a3 entitlement:(int)a4 private:;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)validateSignature:(BOOL)a1;
- (DiagnosticsServiceImpl)initWithQueue:(id)a3;
- (id)responseDictWithSuccess:(uint64_t)a1 reasonCode:(uint64_t)a2 expiresIn:(uint64_t)a3;
- (id)responseDictWithSuccess:(uint64_t)a3 reasonCode:;
- (id)responseDictWithSuccess:(void *)a3 sessionId:;
- (id)responseDictWithSuccess:(void *)a3 sessionId:(void *)a4 groupId:(void *)a5 additionalDict:(uint64_t)a6 reasonCode:;
- (id)responseDictWithSuccess:(void *)a3 sessionId:(void *)a4 groupId:(void *)a5 additionalDict:(uint64_t)a6 reasonCode:(void *)a7 expiresIn:;
- (void)_checkRateLimitForConnection:(void *)a3 signature:(void *)a4 reply:;
- (void)abcEnabledAndReadyWithReply:(uint64_t)a1;
- (void)addSignatureContentForSession:(id)a3 key:(id)a4 content:(id)a5 reply:(id)a6;
- (void)addToSession:(id)a3 event:(id)a4 payload:(id)a5 reply:(id)a6;
- (void)addToSession:(id)a3 events:(id)a4 payload:(id)a5 reply:(id)a6;
- (void)cancelSession:(id)a3;
- (void)cloudKitUploadDecisionForCaseIdentifiers:(id)a3 reply:(id)a4;
- (void)endSession:(id)a3;
- (void)getAutoBugCaptureConfiguration:(id)a3;
- (void)getCasesListFromIdentifier:(id)a3 count:(unint64_t)a4 reply:(id)a5;
- (void)getDiagnosticPayloadsForSignatures:(id)a3 reply:(id)a4;
- (void)getExpertSystemsStatus:(id)a3;
- (void)getSessionStatisticsWithReply:(id)a3;
- (void)homeKitResidentDevicesIDSIdentifiersWithReply:(id)a3;
- (void)listCaseSummariesOfType:(id)a3 fromIdentifier:(id)a4 count:(unint64_t)a5 reply:(id)a6;
- (void)listCaseSummariesWithIdentifiers:(id)a3 reply:(id)a4;
- (void)purgeAutoBugCaptureFilesWithSubPaths:(id)a3 reply:(id)a4;
- (void)requestGroupCaseIdentifierForSignature:(id)a3 reply:(id)a4;
- (void)resetAllWithReply:(id)a3;
- (void)resetDiagnosticCaseStorageWithReply:(id)a3;
- (void)resetDiagnosticCaseUsageWithReply:(id)a3;
- (void)snapshotWithSignature:(id)a3 delay:(unint64_t)a4 events:(id)a5 payload:(id)a6 actions:(id)a7 wantsRemoteCase:(BOOL)a8 reply:(id)a9;
- (void)startSessionWithSignature:(id)a3 duration:(unint64_t)a4 events:(id)a5 payload:(id)a6 actions:(id)a7 wantsRemoteCase:(BOOL)a8 reply:(id)a9;
- (void)submitRecentCaseSummariesWithCount:(unint64_t)a3 reply:(id)a4;
- (void)submitRecentCaseSummariesWithIdentifiers:(id)a3 reply:(id)a4;
- (void)triggerRemoteSessionForSignature:(id)a3 groupIdentifier:(id)a4 reply:(id)a5;
- (void)uploadCasesWithIdentifiersToCloudKit:(id)a3;
- (void)uploadRecentCases:(unint64_t)a3;
@end

@implementation DiagnosticsServiceImpl

- (DiagnosticsServiceImpl)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DiagnosticsServiceImpl;
  v6 = [(DiagnosticsServiceImpl *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->queue, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    allowanceCache = v7->allowanceCache;
    v7->allowanceCache = v8;
  }
  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  BOOL v6 = -[DiagnosticsServiceImpl assertEntitlement:entitlement:private:]((uint64_t)self, v5, @"com.apple.symptom_diagnostics.report", 0);
  if (v6)
  {
    if (listener_shouldAcceptNewConnection__onceToken != -1) {
      dispatch_once(&listener_shouldAcceptNewConnection__onceToken, &__block_literal_global_1);
    }
    [v5 setExportedInterface:listener_shouldAcceptNewConnection__diagnosticsServiceInterface];
    [v5 setExportedObject:self];
    [v5 resume];
  }
  else
  {
    v7 = xpcLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_ERROR, "DiagnosticsService: connection (%@) lacks proper entitlements", (uint8_t *)&v9, 0xCu);
    }
  }
  return v6;
}

- (BOOL)assertEntitlement:(void *)a3 entitlement:(int)a4 private:
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  BOOL v9 = a1 != 0;
  if (a1 && a4)
  {
    id v10 = [v7 valueForEntitlement:v8];
    uint64_t v11 = v10;
    if (v10 && ([v10 BOOLValue] & 1) != 0)
    {
      BOOL v9 = 1;
    }
    else
    {
      v12 = xpcLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412546;
        id v15 = v8;
        __int16 v16 = 1024;
        int v17 = [v7 processIdentifier];
        _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_DEFAULT, "SymptomAnalytics DiagnosticsService: entitlement %@ is missing (%d)", (uint8_t *)&v14, 0x12u);
      }

      BOOL v9 = 0;
    }
  }
  return v9;
}

uint64_t __61__DiagnosticsServiceImpl_listener_shouldAcceptNewConnection___block_invoke()
{
  listener_shouldAcceptNewConnection__diagnosticsServiceInterface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26BDF9828];

  return MEMORY[0x270F9A758]();
}

- (void)_checkRateLimitForConnection:(void *)a3 signature:(void *)a4 reply:
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void, void, double))v9;
  if (!a1 || !v9) {
    goto LABEL_28;
  }
  uint64_t v11 = +[ABCAdministrator sharedInstance];
  v12 = [v11 configurationManager];
  int v13 = [v12 disableAPIRateLimit];

  if (v13)
  {
    v10[2](v10, 0, 0.0);
    goto LABEL_28;
  }
  uint64_t v14 = [v7 processIdentifier];
  id v15 = a1[2];
  objc_sync_enter(v15);
  __int16 v16 = [MEMORY[0x263EFF910] date];
  int v17 = +[ABCAdministrator sharedInstance];
  uint64_t v18 = [v17 configurationManager];
  [v18 apiRateLimit];
  double v20 = v19;

  v21 = +[ABCAdministrator sharedInstance];
  v22 = [v21 configurationManager];
  [v22 apiLimitWindow];
  double v24 = v23;

  v25 = xpcLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v59 = v14;
    __int16 v60 = 2112;
    id v61 = v8;
    _os_log_impl(&dword_209DBA000, v25, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: API rate limit check for client: %d signature:%@", buf, 0x12u);
  }

  id v26 = a1[2];
  v27 = [NSNumber numberWithInt:v14];
  v28 = [v26 objectForKeyedSubscript:v27];

  if (!v28)
  {
    v28 = objc_alloc_init(RateLimitAllowance);
    [(RateLimitAllowance *)v28 setAllowance:v20];
    id v29 = a1[2];
    v30 = [NSNumber numberWithInt:v14];
    [v29 setObject:v28 forKeyedSubscript:v30];
  }
  int v31 = [a1 _checkRateLimitForAllowance:v28 time:v16];
  if (!_checkRateLimitForConnection_signature_reply__lastCleanedAt) {
    goto LABEL_17;
  }
  objc_msgSend(v16, "timeIntervalSinceDate:");
  if (v32 > 3600.0)
  {
    v33 = xpcLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v33, OS_LOG_TYPE_INFO, "DiagnosticsService: Cleaning API rate limit cache", buf, 2u);
    }

    id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v35 = a1[2];
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __71__DiagnosticsServiceImpl__checkRateLimitForConnection_signature_reply___block_invoke;
    v53[3] = &unk_263FC3180;
    id v54 = v16;
    double v56 = v24;
    double v57 = v20;
    id v36 = v34;
    id v55 = v36;
    [v35 enumerateKeysAndObjectsUsingBlock:v53];
    if ([v36 count]) {
      [a1[2] removeObjectsForKeys:v36];
    }
    objc_storeStrong((id *)&_checkRateLimitForConnection_signature_reply__lastCleanedAt, v16);

    goto LABEL_18;
  }
  if (!_checkRateLimitForConnection_signature_reply__lastCleanedAt)
  {
LABEL_17:
    id v37 = v16;
    id v36 = (id)_checkRateLimitForConnection_signature_reply__lastCleanedAt;
    _checkRateLimitForConnection_signature_reply__lastCleanedAt = (uint64_t)v37;
LABEL_18:
  }
  double v38 = 0.0;
  if ((v31 & 1) == 0)
  {
    [(RateLimitAllowance *)v28 allowance];
    double v40 = 1.0 - v39;
    double v41 = v24 / v20;
    if (v20 <= 0.0) {
      double v41 = 0.0;
    }
    float v42 = v41 * v40;
    double v38 = ceilf(v42);
  }

  objc_sync_exit(v15);
  if (v31)
  {
    v10[2](v10, 0, 0.0);
  }
  else
  {
    v43 = [v8 objectForKeyedSubscript:@"groupID"];

    if (v43)
    {
      v44 = +[ABCAdministrator sharedInstance];
      v45 = [v44 caseManager];
      v46 = [v8 objectForKeyedSubscript:@"domain"];
      v47 = [v8 objectForKeyedSubscript:@"type"];
      v48 = [v8 objectForKeyedSubscript:@"subtype"];
      v49 = [v8 objectForKeyedSubscript:@"detected"];
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __71__DiagnosticsServiceImpl__checkRateLimitForConnection_signature_reply___block_invoke_127;
      v50[3] = &unk_263FC31A8;
      v51 = v10;
      double v52 = v38;
      [v45 countOfCasesMatchingDomain:v46 type:v47 subtype:v48 process:v49 groupCaseIDIsPresent:1 withinLast:v50 reply:3600.0];
    }
    else
    {
      v10[2](v10, 1, v38);
    }
  }
LABEL_28:
}

void __71__DiagnosticsServiceImpl__checkRateLimitForConnection_signature_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  id v8 = [v6 lastCheckedAt];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  double v11 = *(double *)(a1 + 48);
  double v12 = 0.0;
  if (v11 > 0.0) {
    double v12 = *(double *)(a1 + 56) / v11;
  }
  [v6 allowance];
  [v6 setAllowance:v13 + v10 * v12];
  [v6 setLastCheckedAt:*(void *)(a1 + 32)];
  [v6 allowance];
  if (v14 >= *(double *)(a1 + 56))
  {
    [*(id *)(a1 + 40) addObject:v5];
    id v15 = xpcLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      [v6 allowance];
      int v17 = 138412546;
      id v18 = v5;
      __int16 v19 = 2048;
      uint64_t v20 = v16;
      _os_log_impl(&dword_209DBA000, v15, OS_LOG_TYPE_DEBUG, "DiagnosticsService: API rate limit allowance for client %@ has fully recovered (%.1f). Cleaning out.", (uint8_t *)&v17, 0x16u);
    }
  }
}

uint64_t __71__DiagnosticsServiceImpl__checkRateLimitForConnection_signature_reply___block_invoke_127(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v4 = xpcLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = "";
    if (a2) {
      id v5 = " Not";
    }
    int v7 = 136315138;
    id v8 = v5;
    _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_DEFAULT, "DiagnosticsService:%s overriding rate limit for group case", (uint8_t *)&v7, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, double))(result + 16))(result, a2 != 0, *(double *)(a1 + 40));
  }
  return result;
}

- (BOOL)_checkRateLimitForAllowance:(id)a3 time:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  int v7 = +[ABCAdministrator sharedInstance];
  id v8 = [v7 configurationManager];
  [v8 apiRateLimit];
  double v10 = v9;

  double v11 = +[ABCAdministrator sharedInstance];
  double v12 = [v11 configurationManager];
  [v12 apiLimitWindow];
  double v14 = v13;

  id v15 = xpcLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    [v5 allowance];
    uint64_t v17 = v16;
    id v18 = [v5 lastCheckedAt];
    if (v18) {
      __int16 v19 = "last checked at: ";
    }
    else {
      __int16 v19 = "(no previous checks)";
    }
    uint64_t v20 = [v5 lastCheckedAt];
    uint64_t v21 = (void *)v20;
    *(_DWORD *)double v39 = 134219010;
    v22 = &stru_26BDE2C70;
    *(void *)&v39[4] = v17;
    if (v20) {
      v22 = (__CFString *)v20;
    }
    *(_WORD *)&v39[12] = 2048;
    *(double *)&v39[14] = v10;
    __int16 v40 = 2048;
    double v41 = v14;
    __int16 v42 = 2080;
    v43 = v19;
    __int16 v44 = 2112;
    v45 = v22;
    _os_log_impl(&dword_209DBA000, v15, OS_LOG_TYPE_DEBUG, "DiagnosticsService: API rate limit check - allowance: %.1f  current rate: %.0f calls per %.0f seconds. %s%@", v39, 0x34u);
  }
  double v23 = [v5 lastCheckedAt];

  if (v23)
  {
    double v24 = [v5 lastCheckedAt];
    [v6 timeIntervalSinceDate:v24];
    double v26 = v25;

    [v5 allowance];
    [v5 setAllowance:v27 + v26 * (v10 / v14)];
    [v5 allowance];
    if (v28 > v10) {
      [v5 setAllowance:v10];
    }
    id v29 = xpcLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      [v5 allowance];
      *(_DWORD *)double v39 = 134217984;
      *(void *)&v39[4] = v30;
      _os_log_impl(&dword_209DBA000, v29, OS_LOG_TYPE_DEBUG, "DiagnosticsService: API rate limit allowance recovered to %.1f", v39, 0xCu);
    }
  }
  objc_msgSend(v5, "allowance", *(_OWORD *)v39);
  double v32 = v31;
  if (v31 < 1.0)
  {
    id v34 = xpcLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      [v5 allowance];
      *(_DWORD *)double v39 = 134217984;
      *(void *)&v39[4] = v37;
      id v36 = "DiagnosticsService: API rate limit allowance is insufficient (%.1f), disallowed";
      goto LABEL_19;
    }
  }
  else
  {
    [v5 allowance];
    [v5 setAllowance:v33 + -1.0];
    id v34 = xpcLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      [v5 allowance];
      *(_DWORD *)double v39 = 134217984;
      *(void *)&v39[4] = v35;
      id v36 = "DiagnosticsService: API rate limit allowance reduced to %.1f, allowing";
LABEL_19:
      _os_log_impl(&dword_209DBA000, v34, OS_LOG_TYPE_INFO, v36, v39, 0xCu);
    }
  }

  [v5 setLastCheckedAt:v6];
  return v32 >= 1.0;
}

- (id)responseDictWithSuccess:(void *)a3 sessionId:(void *)a4 groupId:(void *)a5 additionalDict:(uint64_t)a6 reasonCode:(void *)a7 expiresIn:
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (a1)
  {
    uint64_t v17 = (void *)MEMORY[0x263EFF9A0];
    id v18 = [NSNumber numberWithBool:a2];
    __int16 v19 = objc_msgSend(v17, "dictionaryWithObjectsAndKeys:", v18, @"success", 0);

    if (v15) {
      [v19 addEntriesFromDictionary:v15];
    }
    if ([v13 length]) {
      [v19 setObject:v13 forKey:@"session"];
    }
    if ([v14 length]) {
      [v19 setObject:v14 forKey:@"groupID"];
    }
    if (a6)
    {
      uint64_t v20 = [NSNumber numberWithInteger:a6];
      [v19 setObject:v20 forKey:@"reason"];

      uint64_t v21 = diagnosticErrorStringForCode(a6);
      [v19 setObject:v21 forKey:@"reasonStr"];
    }
    if (v16) {
      [v19 setObject:v16 forKey:@"expiresIn"];
    }
  }
  else
  {
    __int16 v19 = 0;
  }

  return v19;
}

- (id)responseDictWithSuccess:(uint64_t)a3 reasonCode:
{
  if (a1)
  {
    a1 = -[DiagnosticsServiceImpl responseDictWithSuccess:sessionId:groupId:additionalDict:reasonCode:expiresIn:]((uint64_t)a1, a2, 0, 0, 0, a3, 0);
    uint64_t v3 = vars8;
  }
  return a1;
}

- (id)responseDictWithSuccess:(uint64_t)a1 reasonCode:(uint64_t)a2 expiresIn:(uint64_t)a3
{
  if (a1)
  {
    id v6 = objc_msgSend(NSNumber, "numberWithDouble:");
    int v7 = -[DiagnosticsServiceImpl responseDictWithSuccess:sessionId:groupId:additionalDict:reasonCode:expiresIn:](a1, a2, 0, 0, 0, a3, v6);
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (id)responseDictWithSuccess:(void *)a3 sessionId:
{
  if (a1)
  {
    a1 = -[DiagnosticsServiceImpl responseDictWithSuccess:sessionId:groupId:additionalDict:reasonCode:expiresIn:]((uint64_t)a1, a2, a3, 0, 0, 0, 0);
    uint64_t v3 = vars8;
  }
  return a1;
}

- (id)responseDictWithSuccess:(void *)a3 sessionId:(void *)a4 groupId:(void *)a5 additionalDict:(uint64_t)a6 reasonCode:
{
  if (a1)
  {
    a1 = -[DiagnosticsServiceImpl responseDictWithSuccess:sessionId:groupId:additionalDict:reasonCode:expiresIn:]((uint64_t)a1, a2, a3, a4, a5, a6, 0);
    uint64_t v6 = vars8;
  }
  return a1;
}

- (BOOL)validateSignature:(BOOL)a1
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    a1 = v3 != 0;
    id v5 = [v3 objectForKeyedSubscript:@"domain"];

    if (!v5)
    {
      uint64_t v6 = xpcLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = [v4 objectForKeyedSubscript:@"domain"];
        int v12 = 138412546;
        id v13 = @"domain";
        __int16 v14 = 2112;
        id v15 = v7;
        _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: signature validation failed! '%@' must be specified: %@", (uint8_t *)&v12, 0x16u);
      }
      a1 = 0;
    }
    id v8 = [v4 objectForKeyedSubscript:@"type"];

    if (!v8)
    {
      double v9 = xpcLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        double v10 = [v4 objectForKeyedSubscript:@"type"];
        int v12 = 138412546;
        id v13 = @"type";
        __int16 v14 = 2112;
        id v15 = v10;
        _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: signature validation failed! '%@' must be specified: %@", (uint8_t *)&v12, 0x16u);
      }
      a1 = 0;
    }
  }

  return a1;
}

- (void)abcEnabledAndReadyWithReply:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = +[ABCAdministrator sharedInstance];
    id v5 = [v4 configurationManager];
    uint64_t v6 = [v5 autoBugCaptureEnabled];

    if ((v6 & 1) == 0)
    {
      int v7 = xpcLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_INFO, "DiagnosticsService: AutoBugCapture is disabled", buf, 2u);
      }
    }
    id v8 = [v4 caseManager];

    if (v8)
    {
      if (!v3)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      double v9 = xpcLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)double v10 = 0;
        _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_INFO, "DiagnosticsService: AutoBugCapture is not ready yet", v10, 2u);
      }

      if (!v3) {
        goto LABEL_9;
      }
    }
    v3[2](v3, v6, v8 != 0);
    goto LABEL_9;
  }
LABEL_10:
}

- (void)snapshotWithSignature:(id)a3 delay:(unint64_t)a4 events:(id)a5 payload:(id)a6 actions:(id)a7 wantsRemoteCase:(BOOL)a8 reply:(id)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __99__DiagnosticsServiceImpl_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke;
  v25[3] = &unk_263FC3220;
  v25[4] = self;
  id v26 = v15;
  id v30 = v19;
  unint64_t v31 = a4;
  id v27 = v17;
  id v28 = v16;
  id v29 = v18;
  BOOL v32 = a8;
  id v20 = v18;
  id v21 = v16;
  id v22 = v17;
  id v23 = v15;
  id v24 = v19;
  -[DiagnosticsServiceImpl abcEnabledAndReadyWithReply:]((uint64_t)self, v25);
}

void __99__DiagnosticsServiceImpl_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke(uint64_t a1, char a2, char a3)
{
  if (a2)
  {
    if (a3)
    {
      v4 = *(id **)(a1 + 32);
      id v5 = [MEMORY[0x263F08D68] currentConnection];
      uint64_t v6 = *(void **)(a1 + 40);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __99__DiagnosticsServiceImpl_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_139;
      v18[3] = &unk_263FC31F8;
      id v7 = *(id *)(a1 + 72);
      uint64_t v8 = *(void *)(a1 + 32);
      double v9 = *(void **)(a1 + 40);
      id v23 = v7;
      v18[4] = v8;
      id v19 = v9;
      id v10 = *(id *)(a1 + 48);
      uint64_t v11 = *(void *)(a1 + 80);
      id v20 = v10;
      uint64_t v24 = v11;
      id v21 = *(id *)(a1 + 56);
      id v22 = *(id *)(a1 + 64);
      char v25 = *(unsigned char *)(a1 + 88);
      -[DiagnosticsServiceImpl _checkRateLimitForConnection:signature:reply:](v4, v5, v6, v18);

      int v12 = v23;
LABEL_13:

      return;
    }
    id v17 = xpcLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v17, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: snapshotWithSignature - ABC is not ready", buf, 2u);
    }

    uint64_t v14 = *(void *)(a1 + 72);
    if (v14)
    {
      id v15 = *(void **)(a1 + 32);
      id v16 = &kSymptomDiagnosticErrorServiceNotReady;
      goto LABEL_12;
    }
  }
  else
  {
    id v13 = xpcLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: snapshotWithSignature - ABC is not enabled", buf, 2u);
    }

    uint64_t v14 = *(void *)(a1 + 72);
    if (v14)
    {
      id v15 = *(void **)(a1 + 32);
      id v16 = &kSymptomDiagnosticErrorServiceUnavailable;
LABEL_12:
      int v12 = -[DiagnosticsServiceImpl responseDictWithSuccess:reasonCode:](v15, 0, *v16);
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v12);
      goto LABEL_13;
    }
  }
}

void __99__DiagnosticsServiceImpl_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_139(uint64_t a1, int a2)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    BOOL v14 = -[DiagnosticsServiceImpl validateSignature:](*(void *)(a1 + 32), *(void **)(a1 + 40));
    id v13 = *(id *)(a1 + 48);
    id v15 = [v13 objectForKeyedSubscript:@"sandbox_ext_token_dict"];

    if (v15)
    {
      id v16 = (void *)[v13 mutableCopy];
      [v16 removeObjectForKey:@"sandbox_ext_token_dict"];

      id v17 = xpcLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209DBA000, v17, OS_LOG_TYPE_DEBUG, "> DiagnosticsService: redacting sandbox extension token", buf, 2u);
      }

      id v13 = v16;
    }
    id v18 = xpcLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(a1 + 40);
      uint64_t v20 = *(void *)(a1 + 80);
      uint64_t v21 = *(void *)(a1 + 56);
      uint64_t v22 = *(void *)(a1 + 64);
      id v23 = "invalid";
      if (v14) {
        id v23 = "valid";
      }
      uint64_t v24 = "(trigger remote diags)";
      if (!*(unsigned char *)(a1 + 88)) {
        uint64_t v24 = "";
      }
      *(_DWORD *)buf = 138413826;
      uint64_t v40 = v19;
      __int16 v41 = 2048;
      uint64_t v42 = v20;
      __int16 v43 = 2112;
      id v44 = v13;
      __int16 v45 = 2112;
      uint64_t v46 = v21;
      __int16 v47 = 2112;
      uint64_t v48 = v22;
      __int16 v49 = 2080;
      v50 = v23;
      __int16 v51 = 2080;
      double v52 = v24;
      _os_log_impl(&dword_209DBA000, v18, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request to SNAPSHOT with signature: %@, for Delay: %ld, payload: %@, events: %@, actions: %@ (signature %s) %s", buf, 0x48u);
    }

    if (v14)
    {
      if (*(unsigned char *)(a1 + 88))
      {
        uint64_t v25 = 5;
      }
      else
      {
        id v28 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"groupID"];

        if (v28) {
          uint64_t v25 = 3;
        }
        else {
          uint64_t v25 = 1;
        }
      }
      id v29 = +[ABCAdministrator sharedInstance];
      id v30 = [v29 caseManager];
      double v31 = (double)*(unint64_t *)(a1 + 80);
      uint64_t v32 = *(void *)(a1 + 40);
      uint64_t v33 = *(void *)(a1 + 48);
      uint64_t v34 = *(void *)(a1 + 56);
      uint64_t v35 = *(void *)(a1 + 64);
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __99__DiagnosticsServiceImpl_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_143;
      v37[3] = &unk_263FC31D0;
      id v36 = *(id *)(a1 + 72);
      v37[4] = *(void *)(a1 + 32);
      id v38 = v36;
      [v30 startSessionWithSignature:v32 flags:v25 preferredTimeout:v34 events:v33 payload:v35 actions:v37 reply:v31];

      id v27 = v38;
    }
    else
    {
      uint64_t v26 = *(void *)(a1 + 72);
      if (!v26) {
        goto LABEL_26;
      }
      id v27 = -[DiagnosticsServiceImpl responseDictWithSuccess:reasonCode:](*(void **)(a1 + 32), 0, 20);
      (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v27);
    }

    goto LABEL_26;
  }
  id v3 = +[ABCAdministrator sharedInstance];
  v4 = [v3 configurationManager];
  [v4 apiRateLimit];
  uint64_t v6 = v5;

  id v7 = +[ABCAdministrator sharedInstance];
  uint64_t v8 = [v7 configurationManager];
  [v8 apiLimitWindow];
  uint64_t v10 = v9;

  uint64_t v11 = xpcLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v40 = v6;
    __int16 v41 = 2048;
    uint64_t v42 = v10;
    _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: API rate limited. (Allowed limit is %.0f calls per %.0f second window)", buf, 0x16u);
  }

  uint64_t v12 = *(void *)(a1 + 72);
  if (v12)
  {
    -[DiagnosticsServiceImpl responseDictWithSuccess:reasonCode:expiresIn:](*(void *)(a1 + 32), 0, 41);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v13);
LABEL_26:
  }
}

void __99__DiagnosticsServiceImpl_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_143(uint64_t a1, void *a2, void *a3, void *a4, int a5)
{
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    -[DiagnosticsServiceImpl responseDictWithSuccess:sessionId:groupId:additionalDict:reasonCode:](*(void **)(a1 + 32), a5 == 0, a2, a3, a4, a5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

- (void)startSessionWithSignature:(id)a3 duration:(unint64_t)a4 events:(id)a5 payload:(id)a6 actions:(id)a7 wantsRemoteCase:(BOOL)a8 reply:(id)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __106__DiagnosticsServiceImpl_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke;
  v25[3] = &unk_263FC3220;
  v25[4] = self;
  id v26 = v15;
  id v30 = v19;
  unint64_t v31 = a4;
  id v27 = v17;
  id v28 = v16;
  id v29 = v18;
  BOOL v32 = a8;
  id v20 = v18;
  id v21 = v16;
  id v22 = v17;
  id v23 = v15;
  id v24 = v19;
  -[DiagnosticsServiceImpl abcEnabledAndReadyWithReply:]((uint64_t)self, v25);
}

void __106__DiagnosticsServiceImpl_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke(uint64_t a1, char a2, char a3)
{
  if (a2)
  {
    if (a3)
    {
      v4 = *(id **)(a1 + 32);
      uint64_t v5 = [MEMORY[0x263F08D68] currentConnection];
      id v6 = *(void **)(a1 + 40);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __106__DiagnosticsServiceImpl_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_147;
      v18[3] = &unk_263FC31F8;
      id v7 = *(id *)(a1 + 72);
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void **)(a1 + 40);
      id v23 = v7;
      v18[4] = v8;
      id v10 = v9;
      uint64_t v11 = *(void *)(a1 + 80);
      id v19 = v10;
      uint64_t v24 = v11;
      id v20 = *(id *)(a1 + 48);
      id v21 = *(id *)(a1 + 56);
      id v22 = *(id *)(a1 + 64);
      char v25 = *(unsigned char *)(a1 + 88);
      -[DiagnosticsServiceImpl _checkRateLimitForConnection:signature:reply:](v4, v5, v6, v18);

      uint64_t v12 = v23;
LABEL_13:

      return;
    }
    id v17 = xpcLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v17, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: startSessionWithSignature - ABC is not ready", buf, 2u);
    }

    uint64_t v14 = *(void *)(a1 + 72);
    if (v14)
    {
      id v15 = *(void **)(a1 + 32);
      id v16 = &kSymptomDiagnosticErrorServiceNotReady;
      goto LABEL_12;
    }
  }
  else
  {
    id v13 = xpcLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: startSessionWithSignature - ABC is not enabled", buf, 2u);
    }

    uint64_t v14 = *(void *)(a1 + 72);
    if (v14)
    {
      id v15 = *(void **)(a1 + 32);
      id v16 = &kSymptomDiagnosticErrorServiceUnavailable;
LABEL_12:
      uint64_t v12 = -[DiagnosticsServiceImpl responseDictWithSuccess:reasonCode:](v15, 0, *v16);
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v12);
      goto LABEL_13;
    }
  }
}

void __106__DiagnosticsServiceImpl_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_147(uint64_t a1, int a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    BOOL v7 = -[DiagnosticsServiceImpl validateSignature:](*(void *)(a1 + 32), *(void **)(a1 + 40));
    uint64_t v8 = xpcLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 80);
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 56);
      uint64_t v13 = *(void *)(a1 + 64);
      uint64_t v14 = "invalid";
      if (v7) {
        uint64_t v14 = "valid";
      }
      *(_DWORD *)buf = 138413570;
      uint64_t v30 = v10;
      __int16 v31 = 2048;
      uint64_t v32 = v9;
      __int16 v33 = 2112;
      uint64_t v34 = v11;
      __int16 v35 = 2112;
      uint64_t v36 = v12;
      __int16 v37 = 2112;
      uint64_t v38 = v13;
      __int16 v39 = 2080;
      uint64_t v40 = v14;
      _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request to START logging session with signature: %@, duration: %ld, payload: %@, events: %@, actions: %@ (signature %s)", buf, 0x3Eu);
    }

    if (v7)
    {
      if (*(unsigned char *)(a1 + 88))
      {
        uint64_t v15 = 4;
      }
      else
      {
        id v17 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"groupID"];
        BOOL v18 = v17 != 0;

        uint64_t v15 = 2 * v18;
      }
      id v19 = +[ABCAdministrator sharedInstance];
      id v20 = [v19 caseManager];
      double v21 = (double)*(unint64_t *)(a1 + 80);
      uint64_t v22 = *(void *)(a1 + 40);
      uint64_t v23 = *(void *)(a1 + 48);
      uint64_t v24 = *(void *)(a1 + 56);
      uint64_t v25 = *(void *)(a1 + 64);
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __106__DiagnosticsServiceImpl_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_148;
      v27[3] = &unk_263FC31D0;
      id v26 = *(id *)(a1 + 72);
      v27[4] = *(void *)(a1 + 32);
      id v28 = v26;
      [v20 startSessionWithSignature:v22 flags:v15 preferredTimeout:v24 events:v23 payload:v25 actions:v27 reply:v21];

      id v16 = v28;
      goto LABEL_18;
    }
    uint64_t v4 = *(void *)(a1 + 72);
    if (!v4) {
      return;
    }
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = &kSymptomDiagnosticErrorInvalidParameters;
LABEL_15:
    id v16 = -[DiagnosticsServiceImpl responseDictWithSuccess:reasonCode:](v5, 0, *v6);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v16);
LABEL_18:

    return;
  }
  id v3 = xpcLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_INFO, "DiagnosticsService: API rate limited.", buf, 2u);
  }

  uint64_t v4 = *(void *)(a1 + 72);
  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = &kSymptomDiagnosticErrorRequestThrottled;
    goto LABEL_15;
  }
}

void __106__DiagnosticsServiceImpl_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_148(uint64_t a1, void *a2, void *a3, void *a4, int a5)
{
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    -[DiagnosticsServiceImpl responseDictWithSuccess:sessionId:groupId:additionalDict:reasonCode:](*(void **)(a1 + 32), a5 == 0, a2, a3, a4, a5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

- (void)addToSession:(id)a3 event:(id)a4 payload:(id)a5 reply:(id)a6
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (a4)
  {
    id v15 = a4;
    uint64_t v13 = (void *)MEMORY[0x263EFF8C0];
    id v14 = a4;
    a4 = [v13 arrayWithObjects:&v15 count:1];
  }
  -[DiagnosticsServiceImpl addToSession:events:payload:reply:](self, "addToSession:events:payload:reply:", v10, a4, v11, v12, v15, v16);
}

- (void)addToSession:(id)a3 events:(id)a4 payload:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __60__DiagnosticsServiceImpl_addToSession_events_payload_reply___block_invoke;
  v18[3] = &unk_263FC3270;
  id v21 = v12;
  id v22 = v13;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v13;
  -[DiagnosticsServiceImpl abcEnabledAndReadyWithReply:]((uint64_t)self, v18);
}

void __60__DiagnosticsServiceImpl_addToSession_events_payload_reply___block_invoke(uint64_t a1, int a2, char a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = xpcLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2 && (a3 & 1) != 0)
  {
    if (v7)
    {
      uint64_t v8 = *(const char **)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412802;
      uint64_t v24 = v8;
      __int16 v25 = 2112;
      uint64_t v26 = v9;
      __int16 v27 = 2112;
      uint64_t v28 = v10;
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request ADD EVENTS to session: %@. events: %@ payload: %@", buf, 0x20u);
    }

    id v11 = +[ABCAdministrator sharedInstance];
    id v12 = [v11 caseManager];
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 48);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __60__DiagnosticsServiceImpl_addToSession_events_payload_reply___block_invoke_152;
    v21[3] = &unk_263FC3248;
    uint64_t v15 = *(void *)(a1 + 56);
    id v16 = *(id *)(a1 + 64);
    v21[4] = *(void *)(a1 + 32);
    id v22 = v16;
    [v12 addToSession:v13 events:v14 payload:v15 reply:v21];

    id v17 = v22;
LABEL_14:

    return;
  }
  if (v7)
  {
    BOOL v18 = "enabled";
    if (a2) {
      BOOL v18 = "ready";
    }
    *(_DWORD *)buf = 136446210;
    uint64_t v24 = v18;
    _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: addToSession - ABC is not %{public}s", buf, 0xCu);
  }

  uint64_t v19 = *(void *)(a1 + 64);
  if (v19)
  {
    id v20 = &kSymptomDiagnosticErrorServiceUnavailable;
    if (a2) {
      id v20 = &kSymptomDiagnosticErrorServiceNotReady;
    }
    id v17 = -[DiagnosticsServiceImpl responseDictWithSuccess:reasonCode:](*(void **)(a1 + 32), 0, *v20);
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v17);
    goto LABEL_14;
  }
}

void __60__DiagnosticsServiceImpl_addToSession_events_payload_reply___block_invoke_152(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    -[DiagnosticsServiceImpl responseDictWithSuccess:reasonCode:](*(void **)(a1 + 32), a2 == 0, a2);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)addSignatureContentForSession:(id)a3 key:(id)a4 content:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __74__DiagnosticsServiceImpl_addSignatureContentForSession_key_content_reply___block_invoke;
  v18[3] = &unk_263FC3270;
  id v21 = v12;
  id v22 = v13;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v13;
  -[DiagnosticsServiceImpl abcEnabledAndReadyWithReply:]((uint64_t)self, v18);
}

void __74__DiagnosticsServiceImpl_addSignatureContentForSession_key_content_reply___block_invoke(uint64_t a1, int a2, char a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = xpcLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2 && (a3 & 1) != 0)
  {
    if (v7)
    {
      uint64_t v8 = *(const char **)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412802;
      uint64_t v24 = v8;
      __int16 v25 = 2112;
      uint64_t v26 = v9;
      __int16 v27 = 2112;
      uint64_t v28 = v10;
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request APPEND SIGNATURE to session: %@. key: %@ content: %@", buf, 0x20u);
    }

    id v11 = +[ABCAdministrator sharedInstance];
    id v12 = [v11 caseManager];
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 48);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __74__DiagnosticsServiceImpl_addSignatureContentForSession_key_content_reply___block_invoke_154;
    v21[3] = &unk_263FC3248;
    uint64_t v15 = *(void *)(a1 + 56);
    id v16 = *(id *)(a1 + 64);
    v21[4] = *(void *)(a1 + 32);
    id v22 = v16;
    [v12 addSignatureContentForSession:v13 key:v14 content:v15 reply:v21];

    id v17 = v22;
LABEL_14:

    return;
  }
  if (v7)
  {
    BOOL v18 = "enabled";
    if (a2) {
      BOOL v18 = "ready";
    }
    *(_DWORD *)buf = 136446210;
    uint64_t v24 = v18;
    _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: addSignatureContentForSession - ABC is not %{public}s", buf, 0xCu);
  }

  uint64_t v19 = *(void *)(a1 + 64);
  if (v19)
  {
    id v20 = &kSymptomDiagnosticErrorServiceUnavailable;
    if (a2) {
      id v20 = &kSymptomDiagnosticErrorServiceNotReady;
    }
    id v17 = -[DiagnosticsServiceImpl responseDictWithSuccess:reasonCode:](*(void **)(a1 + 32), 0, *v20);
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v17);
    goto LABEL_14;
  }
}

void __74__DiagnosticsServiceImpl_addSignatureContentForSession_key_content_reply___block_invoke_154(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    -[DiagnosticsServiceImpl responseDictWithSuccess:reasonCode:](*(void **)(a1 + 32), a2 == 0, a2);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)endSession:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__DiagnosticsServiceImpl_endSession___block_invoke;
  v6[3] = &unk_263FC3298;
  id v7 = v4;
  id v5 = v4;
  -[DiagnosticsServiceImpl abcEnabledAndReadyWithReply:]((uint64_t)self, v6);
}

void __37__DiagnosticsServiceImpl_endSession___block_invoke(uint64_t a1, int a2, char a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = xpcLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2 && (a3 & 1) != 0)
  {
    if (v7)
    {
      uint64_t v8 = *(const char **)(a1 + 32);
      int v11 = 138412290;
      id v12 = v8;
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request to END logging session: %@", (uint8_t *)&v11, 0xCu);
    }

    id v6 = +[ABCAdministrator sharedInstance];
    uint64_t v9 = [v6 caseManager];
    [v9 endSessionWithIdentifier:*(void *)(a1 + 32) forced:0];
  }
  else if (v7)
  {
    uint64_t v10 = "enabled";
    if (a2) {
      uint64_t v10 = "ready";
    }
    int v11 = 136446210;
    id v12 = v10;
    _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: endSession - ABC is not %{public}s", (uint8_t *)&v11, 0xCu);
  }
}

- (void)cancelSession:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__DiagnosticsServiceImpl_cancelSession___block_invoke;
  v6[3] = &unk_263FC3298;
  id v7 = v4;
  id v5 = v4;
  -[DiagnosticsServiceImpl abcEnabledAndReadyWithReply:]((uint64_t)self, v6);
}

void __40__DiagnosticsServiceImpl_cancelSession___block_invoke(uint64_t a1, int a2, char a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = xpcLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2 && (a3 & 1) != 0)
  {
    if (v7)
    {
      uint64_t v8 = *(const char **)(a1 + 32);
      int v11 = 138412290;
      id v12 = v8;
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request to CANCEL logging session: %@", (uint8_t *)&v11, 0xCu);
    }

    id v6 = +[ABCAdministrator sharedInstance];
    uint64_t v9 = [v6 caseManager];
    [v9 cancelSessionWithIdentifier:*(void *)(a1 + 32)];
  }
  else if (v7)
  {
    uint64_t v10 = "enabled";
    if (a2) {
      uint64_t v10 = "ready";
    }
    int v11 = 136446210;
    id v12 = v10;
    _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: cancelSession - ABC is not %{public}s", (uint8_t *)&v11, 0xCu);
  }
}

- (void)requestGroupCaseIdentifierForSignature:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__DiagnosticsServiceImpl_requestGroupCaseIdentifierForSignature_reply___block_invoke;
  v10[3] = &unk_263FC3310;
  id v11 = v6;
  id v12 = v7;
  v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  -[DiagnosticsServiceImpl abcEnabledAndReadyWithReply:]((uint64_t)self, v10);
}

void __71__DiagnosticsServiceImpl_requestGroupCaseIdentifierForSignature_reply___block_invoke(uint64_t a1, char a2, char a3)
{
  if (a2)
  {
    if (a3)
    {
      if (!*(void *)(a1 + 48)) {
        return;
      }
      id v4 = *(id **)(a1 + 32);
      id v5 = [MEMORY[0x263F08D68] currentConnection];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __71__DiagnosticsServiceImpl_requestGroupCaseIdentifierForSignature_reply___block_invoke_155;
      v16[3] = &unk_263FC32E8;
      id v6 = *(void **)(a1 + 40);
      id v7 = *(id *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = *(void **)(a1 + 40);
      id v18 = v7;
      v16[4] = v8;
      id v17 = v9;
      -[DiagnosticsServiceImpl _checkRateLimitForConnection:signature:reply:](v4, v5, v6, v16);

      uint64_t v10 = v18;
      goto LABEL_14;
    }
    uint64_t v15 = xpcLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v15, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: groupCaseIdentifierForSignature - ABC is not ready", buf, 2u);
    }

    uint64_t v12 = *(void *)(a1 + 48);
    if (v12)
    {
      uint64_t v13 = *(void **)(a1 + 32);
      uint64_t v14 = &kSymptomDiagnosticErrorServiceNotReady;
      goto LABEL_13;
    }
  }
  else
  {
    id v11 = xpcLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: groupCaseIdentifierForSignature - ABC is not enabled", buf, 2u);
    }

    uint64_t v12 = *(void *)(a1 + 48);
    if (v12)
    {
      uint64_t v13 = *(void **)(a1 + 32);
      uint64_t v14 = &kSymptomDiagnosticErrorServiceUnavailable;
LABEL_13:
      uint64_t v10 = -[DiagnosticsServiceImpl responseDictWithSuccess:reasonCode:](v13, 0, *v14);
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v10);
LABEL_14:
    }
  }
}

void __71__DiagnosticsServiceImpl_requestGroupCaseIdentifierForSignature_reply___block_invoke_155(uint64_t a1, int a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = +[ABCAdministrator sharedInstance];
    id v4 = [v3 configurationManager];
    [v4 apiRateLimit];
    uint64_t v6 = v5;

    id v7 = +[ABCAdministrator sharedInstance];
    uint64_t v8 = [v7 configurationManager];
    [v8 apiLimitWindow];
    uint64_t v10 = v9;

    id v11 = xpcLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v27 = v6;
      __int16 v28 = 2048;
      uint64_t v29 = v10;
      _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: API rate limited. (Allowed limit is %.0f calls per %.0f second window)", buf, 0x16u);
    }

    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v14 = &kSymptomDiagnosticErrorRequestThrottled;
    goto LABEL_12;
  }
  BOOL v15 = -[DiagnosticsServiceImpl validateSignature:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  id v16 = xpcLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = "invalid";
    uint64_t v18 = *(void *)(a1 + 40);
    if (v15) {
      id v17 = "valid";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v27 = v18;
    __int16 v28 = 2080;
    uint64_t v29 = v17;
    _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request for a group case identifier with signature: %@ (signature %s)", buf, 0x16u);
  }

  if (!v15)
  {
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v14 = &kSymptomDiagnosticErrorInvalidParameters;
LABEL_12:
    uint64_t v23 = -[DiagnosticsServiceImpl responseDictWithSuccess:reasonCode:](v13, 0, *v14);
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v23);
    goto LABEL_13;
  }
  uint64_t v19 = +[ABCAdministrator sharedInstance];
  id v20 = [v19 caseManager];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __71__DiagnosticsServiceImpl_requestGroupCaseIdentifierForSignature_reply___block_invoke_156;
  v24[3] = &unk_263FC32C0;
  uint64_t v21 = *(void *)(a1 + 40);
  id v22 = *(id *)(a1 + 48);
  v24[4] = *(void *)(a1 + 32);
  id v25 = v22;
  [v20 requestGroupCaseIdentifierForSignature:v21 reply:v24];

  uint64_t v23 = v25;
LABEL_13:
}

void __71__DiagnosticsServiceImpl_requestGroupCaseIdentifierForSignature_reply___block_invoke_156(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  int v8 = +[DiagnosticCaseManager symptomDiagnosticErrorForDiagnosticCaseDampeningType:a3];
  uint64_t v9 = *(void *)(a1 + 40);
  -[DiagnosticsServiceImpl responseDictWithSuccess:sessionId:groupId:additionalDict:reasonCode:](*(void **)(a1 + 32), a2, 0, v7, 0, v8);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);
}

- (void)triggerRemoteSessionForSignature:(id)a3 groupIdentifier:(id)a4 reply:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = xpcLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_DEFAULT, "DiagnosticsService(PRIVATE): request to trigger remote session with group identifier %@ and signature %@", buf, 0x16u);
  }

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __81__DiagnosticsServiceImpl_triggerRemoteSessionForSignature_groupIdentifier_reply___block_invoke;
  v15[3] = &unk_263FC3338;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  -[DiagnosticsServiceImpl abcEnabledAndReadyWithReply:]((uint64_t)self, v15);
}

void __81__DiagnosticsServiceImpl_triggerRemoteSessionForSignature_groupIdentifier_reply___block_invoke(uint64_t a1, int a2, char a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a2 && (a3 & 1) != 0)
  {
    uint64_t v5 = [MEMORY[0x263F08D68] currentConnection];
    BOOL v6 = -[DiagnosticsServiceImpl assertEntitlement:entitlement:private:](*(void *)(a1 + 32), v5, @"com.apple.symptom_diagnostics.private", 1);
    id v7 = xpcLogHandle();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: remote trigger authorized", buf, 2u);
      }

      id v9 = +[ABCAdministrator sharedInstance];
      id v10 = [v9 diagnosticLiaison];
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __81__DiagnosticsServiceImpl_triggerRemoteSessionForSignature_groupIdentifier_reply___block_invoke_162;
      v20[3] = &unk_263FC2FC8;
      id v21 = *(id *)(a1 + 56);
      [v10 remotelyTriggerSessionForSignature:v12 groupIdentifier:v11 event:0 queue:v13 reply:v20];

      id v14 = v21;
    }
    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: not entitled to access private API", buf, 2u);
      }

      uint64_t v19 = *(void *)(a1 + 56);
      if (!v19) {
        goto LABEL_20;
      }
      id v22 = @"success";
      uint64_t v23 = MEMORY[0x263EFFA80];
      id v14 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v14);
    }

LABEL_20:
    return;
  }
  BOOL v15 = xpcLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = "enabled";
    if (a2) {
      id v16 = "ready";
    }
    *(_DWORD *)buf = 136446210;
    id v25 = v16;
    _os_log_impl(&dword_209DBA000, v15, OS_LOG_TYPE_DEFAULT, "DiagnosticsService(PRIVATE): triggerRemoteSessionForSignature - ABC is not %{public}s", buf, 0xCu);
  }

  uint64_t v17 = *(void *)(a1 + 56);
  if (v17)
  {
    id v18 = &kSymptomDiagnosticErrorServiceUnavailable;
    if (a2) {
      id v18 = &kSymptomDiagnosticErrorServiceNotReady;
    }
    uint64_t v5 = -[DiagnosticsServiceImpl responseDictWithSuccess:reasonCode:](*(void **)(a1 + 32), 0, *v18);
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v5);
    goto LABEL_20;
  }
}

void __81__DiagnosticsServiceImpl_triggerRemoteSessionForSignature_groupIdentifier_reply___block_invoke_162(uint64_t a1, uint64_t a2)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v5 = @"success";
    id v3 = [NSNumber numberWithBool:a2];
    v6[0] = v3;
    id v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  }
}

- (void)getSessionStatisticsWithReply:(id)a3
{
  id v4 = a3;
  uint64_t v5 = xpcLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, "DiagnosticsService(PRIVATE): request to get statistics", buf, 2u);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__DiagnosticsServiceImpl_getSessionStatisticsWithReply___block_invoke;
  v7[3] = &unk_263FC3360;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[DiagnosticsServiceImpl abcEnabledAndReadyWithReply:]((uint64_t)self, v7);
}

void __56__DiagnosticsServiceImpl_getSessionStatisticsWithReply___block_invoke(uint64_t a1, int a2, char a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a2 && (a3 & 1) != 0)
  {
    uint64_t v5 = [MEMORY[0x263F08D68] currentConnection];
    if (-[DiagnosticsServiceImpl assertEntitlement:entitlement:private:](*(void *)(a1 + 32), v5, @"com.apple.symptom_diagnostics.private", 1))
    {
      id v6 = xpcLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: statistics authorized", (uint8_t *)&v14, 2u);
      }

      id v7 = +[ABCAdministrator sharedInstance];
      id v8 = [v7 caseManager];
      id v9 = [v8 statsManager];
      [v9 getDiagnosticCaseUsageStatistics:*(void *)(a1 + 40)];
    }
    else if (*(void *)(a1 + 40))
    {
      uint64_t v13 = xpcLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_ERROR, "DiagnosticsService: not entitled to access private API", (uint8_t *)&v14, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    id v10 = xpcLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = "enabled";
      if (a2) {
        uint64_t v11 = "ready";
      }
      int v14 = 136446210;
      BOOL v15 = v11;
      _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEFAULT, "DiagnosticsService(PRIVATE): getSessionStatisticsWithReply - ABC is not %{public}s", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v12 = *(void *)(a1 + 40);
    if (v12) {
      (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0);
    }
  }
}

- (void)getCasesListFromIdentifier:(id)a3 count:(unint64_t)a4 reply:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = xpcLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v18 = a4;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEFAULT, "DiagnosticsService(PRIVATE): request to get list of %ld cases from identifier %@", buf, 0x16u);
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__DiagnosticsServiceImpl_getCasesListFromIdentifier_count_reply___block_invoke;
  v13[3] = &unk_263FC3388;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v8;
  id v12 = v9;
  -[DiagnosticsServiceImpl abcEnabledAndReadyWithReply:]((uint64_t)self, v13);
}

void __65__DiagnosticsServiceImpl_getCasesListFromIdentifier_count_reply___block_invoke(uint64_t *a1, int a2, char a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a2 && (a3 & 1) != 0)
  {
    uint64_t v5 = [MEMORY[0x263F08D68] currentConnection];
    if (-[DiagnosticsServiceImpl assertEntitlement:entitlement:private:](a1[4], v5, @"com.apple.symptom_diagnostics.private", 1))
    {
      id v6 = xpcLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: incremental case listing authorized", (uint8_t *)&v13, 2u);
      }

      id v7 = +[ABCAdministrator sharedInstance];
      id v8 = [v7 caseManager];
      [v8 getHistoricalDiagnosicCaseDictionaryFromIdentifier:a1[5] withEvents:0 count:a1[7] reply:a1[6]];
    }
    else if (a1[6])
    {
      id v12 = xpcLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_ERROR, "DiagnosticsService: not entitled to access private API", (uint8_t *)&v13, 2u);
      }

      (*(void (**)(void))(a1[6] + 16))();
    }
  }
  else
  {
    id v9 = xpcLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = "enabled";
      if (a2) {
        id v10 = "ready";
      }
      int v13 = 136446210;
      id v14 = v10;
      _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_DEFAULT, "DiagnosticsService(PRIVATE): getCasesListFromIdentifier - ABC is not %{public}s", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v11 = a1[6];
    if (v11) {
      (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0);
    }
  }
}

- (void)resetDiagnosticCaseStorageWithReply:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  uint64_t v5 = xpcLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: reqeust to reset DiagnosticCaseStorage backing store", buf, 2u);
  }

  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v7 = [MEMORY[0x263F08D68] currentConnection];
  BOOL v8 = -[DiagnosticsServiceImpl assertEntitlement:entitlement:private:]((uint64_t)self, v7, @"com.apple.symptom_diagnostics.reset", 1);
  id v9 = xpcLogHandle();
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: reset case storage authorized", v14, 2u);
    }

    [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"success"];
    uint64_t v11 = +[ABCAdministrator sharedInstance];
    id v12 = [v11 caseManager];
    [v12 resetDiagnosticCaseStorage];

    if (!v4) {
      goto LABEL_12;
    }
LABEL_11:
    v4[2](v4, v6);
    goto LABEL_12;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)int v13 = 0;
    _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_ERROR, "DiagnosticsService: no entitlement to execute reset", v13, 2u);
  }

  [v6 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"success"];
  if (v4) {
    goto LABEL_11;
  }
LABEL_12:
}

- (void)resetDiagnosticCaseUsageWithReply:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  uint64_t v5 = xpcLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request to reset DiagnosticCaseUsage backing store", buf, 2u);
  }

  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v7 = [MEMORY[0x263F08D68] currentConnection];
  BOOL v8 = -[DiagnosticsServiceImpl assertEntitlement:entitlement:private:]((uint64_t)self, v7, @"com.apple.symptom_diagnostics.reset", 1);
  id v9 = xpcLogHandle();
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: reset case usage authorized", v15, 2u);
    }

    [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"success"];
    uint64_t v11 = +[ABCAdministrator sharedInstance];
    id v12 = [v11 caseManager];
    int v13 = [v12 statsManager];
    [v13 resetDiagnosticCaseUsage];

    if (!v4) {
      goto LABEL_12;
    }
LABEL_11:
    v4[2](v4, v6);
    goto LABEL_12;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_ERROR, "DiagnosticsService: no entitlement to execute reset", v14, 2u);
  }

  [v6 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"success"];
  if (v4) {
    goto LABEL_11;
  }
LABEL_12:
}

- (void)resetAllWithReply:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  uint64_t v5 = xpcLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request to reset DiagnosticCaseStorage and DiagnosticCaseUsage backing store", buf, 2u);
  }

  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v7 = [MEMORY[0x263F08D68] currentConnection];
  BOOL v8 = -[DiagnosticsServiceImpl assertEntitlement:entitlement:private:]((uint64_t)self, v7, @"com.apple.symptom_diagnostics.reset", 1);
  id v9 = xpcLogHandle();
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: reset all authorized", v14, 2u);
    }

    [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"success"];
    uint64_t v11 = +[ABCAdministrator sharedInstance];
    id v12 = [v11 caseManager];
    [v12 resetAll];

    if (!v4) {
      goto LABEL_12;
    }
LABEL_11:
    v4[2](v4, v6);
    goto LABEL_12;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)int v13 = 0;
    _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_ERROR, "DiagnosticsService: no entitlement to execute reset", v13, 2u);
  }

  [v6 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"success"];
  if (v4) {
    goto LABEL_11;
  }
LABEL_12:
}

- (void)getExpertSystemsStatus:(id)a3
{
  id v4 = a3;
  uint64_t v5 = xpcLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: requesting service status", buf, 2u);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__DiagnosticsServiceImpl_getExpertSystemsStatus___block_invoke;
  v7[3] = &unk_263FC3360;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[DiagnosticsServiceImpl abcEnabledAndReadyWithReply:]((uint64_t)self, v7);
}

void __49__DiagnosticsServiceImpl_getExpertSystemsStatus___block_invoke(uint64_t a1, char a2)
{
  v16[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v4 = [MEMORY[0x263F08D68] currentConnection];
    BOOL v5 = -[DiagnosticsServiceImpl assertEntitlement:entitlement:private:](*(void *)(a1 + 32), v4, @"com.apple.symptom_diagnostics.private", 1);
    id v6 = xpcLogHandle();
    id v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request service status authorized", v12, 2u);
      }

      id v7 = +[ABCAdministrator sharedInstance];
      id v8 = [v7 internalStateDictionary];
      [v3 setObject:v8 forKeyedSubscript:@"AutoBugCaptureAdministrator"];
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_ERROR, "DiagnosticsService: not entitled to request service status", v12, 2u);
    }

    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);
    }

    goto LABEL_15;
  }
  id v9 = xpcLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_DEFAULT, "DiagnosticsService(PRIVATE): getExpertSystemsStatus - ABC is not enabled", v12, 2u);
  }

  if (*(void *)(a1 + 40))
  {
    uint64_t v15 = @"AutoBugCaptureAdministrator";
    int v13 = @"serviceEnabled";
    uint64_t v14 = MEMORY[0x263EFFA80];
    id v10 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    v16[0] = v10;
    id v3 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_15:
  }
}

- (void)getDiagnosticPayloadsForSignatures:(id)a3 reply:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = xpcLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request collected payloads for the given signatures: %@", buf, 0xCu);
  }

  id v9 = +[ABCAdministrator sharedInstance];
  id v10 = [v9 caseManager];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__DiagnosticsServiceImpl_getDiagnosticPayloadsForSignatures_reply___block_invoke;
  v12[3] = &unk_263FC33D8;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [v10 payloadsForSignatures:v6 reply:v12];
}

void __67__DiagnosticsServiceImpl_getDiagnosticPayloadsForSignatures_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__DiagnosticsServiceImpl_getDiagnosticPayloadsForSignatures_reply___block_invoke_2;
    block[3] = &unk_263FC33B0;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __67__DiagnosticsServiceImpl_getDiagnosticPayloadsForSignatures_reply___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)homeKitResidentDevicesIDSIdentifiersWithReply:(id)a3
{
  id v4 = a3;
  id v5 = xpcLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request IDS identifiers of HomeKit resident devices", buf, 2u);
  }

  id v6 = [MEMORY[0x263F08D68] currentConnection];
  BOOL v7 = -[DiagnosticsServiceImpl assertEntitlement:entitlement:private:]((uint64_t)self, v6, @"com.apple.symptom_diagnostics.private", 1);
  id v8 = xpcLogHandle();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: authorized request for IDS identifiers of HomeKit resident devices", buf, 2u);
    }

    id v10 = +[ABCAdministrator sharedInstance];
    id v11 = [v10 diagnosticLiaison];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __72__DiagnosticsServiceImpl_homeKitResidentDevicesIDSIdentifiersWithReply___block_invoke;
    v12[3] = &unk_263FC2FF0;
    id v13 = v4;
    [v11 residentDevicesIDSIdentifiersWithReply:v12];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_ERROR, "DiagnosticsService: not entitled to request IDS identifiers of HomeKit resident devices", buf, 2u);
    }

    if (v4) {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

uint64_t __72__DiagnosticsServiceImpl_homeKitResidentDevicesIDSIdentifiersWithReply___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)getAutoBugCaptureConfiguration:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = xpcLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request current AutoBugCapture configuration", buf, 2u);
  }

  id v6 = [MEMORY[0x263F08D68] currentConnection];
  BOOL v7 = -[DiagnosticsServiceImpl assertEntitlement:entitlement:private:]((uint64_t)self, v6, @"com.apple.symptom_diagnostics.private", 1);
  id v8 = xpcLogHandle();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: authorized request for current AutoBugCapture configuration", v13, 2u);
    }

    id v10 = +[ABCAdministrator sharedInstance];
    id v9 = [v10 configurationManager];

    id v11 = [v9 getAutoBugCaptureConfiguration];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_ERROR, "DiagnosticsService: not entitled to retrive current AutoBugCapture configuration", v12, 2u);
    }
    id v11 = 0;
  }

  if (v4) {
    v4[2](v4, v11);
  }
}

- (void)purgeAutoBugCaptureFilesWithSubPaths:(id)a3 reply:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = (void (**)(id, void))a4;
  id v8 = xpcLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v42 = v6;
    _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request purge AutoBugCapture files with subpaths: %@", buf, 0xCu);
  }

  id v9 = [MEMORY[0x263F08D68] currentConnection];
  BOOL v10 = -[DiagnosticsServiceImpl assertEntitlement:entitlement:private:]((uint64_t)self, v9, @"com.apple.symptom_diagnostics.private", 1);
  id v11 = xpcLogHandle();
  id v12 = v11;
  if (v10)
  {
    uint64_t v32 = v9;
    __int16 v33 = v7;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: authorized purging of AutoBugCapture files", buf, 2u);
    }

    id v13 = +[ABCAdministrator sharedInstance];
    uint64_t v14 = [v13 configurationManager];

    __int16 v31 = v14;
    id v15 = [v14 logArchivePath];
    uint64_t v16 = [MEMORY[0x263F08850] defaultManager];
    context = (void *)MEMORY[0x21050CEB0]();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v34 = v6;
    id v17 = v6;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      id v20 = 0;
      uint64_t v21 = 0;
      uint64_t v22 = *(void *)v38;
      char v35 = 1;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v38 != v22) {
            objc_enumerationMutation(v17);
          }
          uint64_t v24 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          id v25 = (void *)[v15 copy];

          id v20 = [v25 stringByAppendingPathComponent:v24];

          if ([v16 fileExistsAtPath:v20])
          {
            id v36 = v21;
            char v26 = [v16 removeItemAtPath:v20 error:&v36];
            id v27 = v36;

            if ((v26 & 1) == 0)
            {
              __int16 v28 = xpcLogHandle();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                id v42 = v20;
                __int16 v43 = 2112;
                id v44 = v27;
                _os_log_impl(&dword_209DBA000, v28, OS_LOG_TYPE_ERROR, "DiagnosticsService: Couldn't delete file: %@ because %@", buf, 0x16u);
              }

              char v35 = 0;
            }
            uint64_t v21 = v27;
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v19);
    }
    else
    {
      id v20 = 0;
      uint64_t v21 = 0;
      char v35 = 1;
    }

    uint64_t v29 = v35 & 1;
    BOOL v7 = v33;
    id v6 = v34;
    id v9 = v32;
    if (v33) {
LABEL_26:
    }
      v7[2](v7, v29);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_ERROR, "DiagnosticsService: not entitled to purge AutoBugCapture files", buf, 2u);
    }

    uint64_t v29 = 0;
    if (v7) {
      goto LABEL_26;
    }
  }
}

- (void)uploadCasesWithIdentifiersToCloudKit:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = xpcLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v4;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request CloudKit upload for case identifiers %@", (uint8_t *)&v18, 0xCu);
  }

  id v6 = [MEMORY[0x263F08D68] currentConnection];
  if (-[DiagnosticsServiceImpl assertEntitlement:entitlement:private:]((uint64_t)self, v6, @"com.apple.symptom_diagnostics.private", 1))
  {
    BOOL v7 = xpcLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: authorized CloudKit upload of ABC cases", (uint8_t *)&v18, 2u);
    }

    id v8 = +[ABCAdministrator sharedInstance];
    id v9 = [v8 configurationManager];
    int v10 = [v9 cloudKitEnabled];

    if (v10)
    {
      id v11 = +[ABCAdministrator sharedInstance];
      id v12 = [v11 ckUploadController];

      if (v12)
      {
        id v13 = +[ABCAdministrator sharedInstance];
        uint64_t v14 = [v13 ckUploadController];
        [v14 uploadCasesWithIdentifiers:v4];

LABEL_14:
        goto LABEL_15;
      }
      id v13 = xpcLogHandle();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
        goto LABEL_14;
      }
      LOWORD(v18) = 0;
      id v15 = "CloudKit upload controller is not instantiated!";
      uint64_t v16 = v13;
      os_log_type_t v17 = OS_LOG_TYPE_INFO;
    }
    else
    {
      id v13 = xpcLogHandle();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      LOWORD(v18) = 0;
      id v15 = "CloudKit upload is disabled";
      uint64_t v16 = v13;
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
    }
    _os_log_impl(&dword_209DBA000, v16, v17, v15, (uint8_t *)&v18, 2u);
    goto LABEL_14;
  }
LABEL_15:
}

- (void)uploadRecentCases:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = xpcLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 134217984;
    unint64_t v19 = a3;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request CloudKit upload for recent %ld cases", (uint8_t *)&v18, 0xCu);
  }

  id v6 = [MEMORY[0x263F08D68] currentConnection];
  if (-[DiagnosticsServiceImpl assertEntitlement:entitlement:private:]((uint64_t)self, v6, @"com.apple.symptom_diagnostics.private", 1))
  {
    BOOL v7 = xpcLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: authorized CloudKit upload of recent ABC cases", (uint8_t *)&v18, 2u);
    }

    id v8 = +[ABCAdministrator sharedInstance];
    id v9 = [v8 configurationManager];
    int v10 = [v9 cloudKitEnabled];

    if (v10)
    {
      id v11 = +[ABCAdministrator sharedInstance];
      id v12 = [v11 ckUploadController];

      if (v12)
      {
        id v13 = +[ABCAdministrator sharedInstance];
        uint64_t v14 = [v13 ckUploadController];
        [v14 uploadMostRecentCases:a3];

LABEL_14:
        goto LABEL_15;
      }
      id v13 = xpcLogHandle();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
        goto LABEL_14;
      }
      LOWORD(v18) = 0;
      id v15 = "CloudKit upload controller is not instantiated!";
      uint64_t v16 = v13;
      os_log_type_t v17 = OS_LOG_TYPE_INFO;
    }
    else
    {
      id v13 = xpcLogHandle();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      LOWORD(v18) = 0;
      id v15 = "CloudKit upload is disabled";
      uint64_t v16 = v13;
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
    }
    _os_log_impl(&dword_209DBA000, v16, v17, v15, (uint8_t *)&v18, 2u);
    goto LABEL_14;
  }
LABEL_15:
}

- (void)cloudKitUploadDecisionForCaseIdentifiers:(id)a3 reply:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *, void *))a4;
  id v8 = xpcLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v6;
    _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request CloudKit upload decision for case identifiers %@", (uint8_t *)&v20, 0xCu);
  }

  id v9 = [MEMORY[0x263F08D68] currentConnection];
  if (-[DiagnosticsServiceImpl assertEntitlement:entitlement:private:]((uint64_t)self, v9, @"com.apple.symptom_diagnostics.private", 1))
  {
    int v10 = xpcLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: authorized CloudKit Upload Decision of ABC cases", (uint8_t *)&v20, 2u);
    }

    id v11 = +[ABCAdministrator sharedInstance];
    id v12 = [v11 configurationManager];
    int v13 = [v12 cloudKitEnabled];

    if (v13)
    {
      uint64_t v14 = +[ABCAdministrator sharedInstance];
      id v15 = [v14 ckUploadController];

      if (v15)
      {
        uint64_t v16 = +[ABCAdministrator sharedInstance];
        os_log_type_t v17 = [v16 ckUploadController];
        [v17 uploadDecisionWithIdentifiers:v6 reply:v7];

LABEL_17:
        goto LABEL_18;
      }
      unint64_t v19 = xpcLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_209DBA000, v19, OS_LOG_TYPE_INFO, "CloudKit upload controller is not instantiated!", (uint8_t *)&v20, 2u);
      }

      if (v7)
      {
        uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:2 userInfo:0];
        v7[2](v7, &unk_26BDF57B8, v16);
        goto LABEL_17;
      }
    }
    else
    {
      int v18 = xpcLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_209DBA000, v18, OS_LOG_TYPE_DEFAULT, "CloudKit upload is disabled", (uint8_t *)&v20, 2u);
      }

      if (v7)
      {
        uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:45 userInfo:0];
        v7[2](v7, &unk_26BDF57E0, v16);
        goto LABEL_17;
      }
    }
  }
LABEL_18:
}

- (void)listCaseSummariesWithIdentifiers:(id)a3 reply:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = xpcLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: DiagnosticsService: list case summaries with identifiers %@", buf, 0xCu);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__DiagnosticsServiceImpl_listCaseSummariesWithIdentifiers_reply___block_invoke;
  v11[3] = &unk_263FC3310;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  -[DiagnosticsServiceImpl abcEnabledAndReadyWithReply:]((uint64_t)self, v11);
}

void __65__DiagnosticsServiceImpl_listCaseSummariesWithIdentifiers_reply___block_invoke(uint64_t *a1, int a2, char a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a2 && (a3 & 1) != 0)
  {
    id v5 = [MEMORY[0x263F08D68] currentConnection];
    if (-[DiagnosticsServiceImpl assertEntitlement:entitlement:private:](a1[4], v5, @"com.apple.symptom_diagnostics.private", 1))
    {
      id v6 = xpcLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: DiagnosticsService: authorized for CloudKit ABC activities", (uint8_t *)&v22, 2u);
      }

      id v7 = +[ABCAdministrator sharedInstance];
      id v8 = [v7 configurationManager];
      int v9 = [v8 cloudKitEnabled];

      id v10 = +[ABCAdministrator sharedInstance];
      id v11 = [v10 configurationManager];
      int v12 = [v11 caseSummaryEnabled];

      id v13 = xpcLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = @"disabled";
        if (v9) {
          id v15 = @"enabled";
        }
        else {
          id v15 = @"disabled";
        }
        if (v12) {
          uint64_t v14 = @"enabled";
        }
        int v22 = 138412546;
        uint64_t v23 = v15;
        __int16 v24 = 2112;
        id v25 = v14;
        _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_INFO, "DiagnosticCaseSummaryLog: CloudKitUpload is %@, CaseSummary is %@", (uint8_t *)&v22, 0x16u);
      }

      uint64_t v16 = +[ABCAdministrator sharedInstance];
      os_log_type_t v17 = [v16 caseManager];
      [v17 listCaseSummariesWithIdentifiers:a1[5] reply:a1[6]];
    }
    else if (a1[6])
    {
      id v21 = xpcLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_209DBA000, v21, OS_LOG_TYPE_ERROR, "DiagnosticCaseSummaryLog: DiagnosticsService: not entitled to access private API", (uint8_t *)&v22, 2u);
      }

      (*(void (**)(void))(a1[6] + 16))();
    }
  }
  else
  {
    int v18 = xpcLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v19 = "enabled";
      if (a2) {
        unint64_t v19 = "ready";
      }
      int v22 = 136446210;
      uint64_t v23 = (void *)v19;
      _os_log_impl(&dword_209DBA000, v18, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: DiagnosticsService(PRIVATE): listCaseSummariesWithIdentifiers - ABC is not %{public}s", (uint8_t *)&v22, 0xCu);
    }

    uint64_t v20 = a1[6];
    if (v20) {
      (*(void (**)(uint64_t, void))(v20 + 16))(v20, 0);
    }
  }
}

- (void)listCaseSummariesOfType:(id)a3 fromIdentifier:(id)a4 count:(unint64_t)a5 reply:(id)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = xpcLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v10;
    _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: DiagnosticsService: list '%@' case summaries", buf, 0xCu);
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __77__DiagnosticsServiceImpl_listCaseSummariesOfType_fromIdentifier_count_reply___block_invoke;
  v17[3] = &unk_263FC3400;
  v17[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  unint64_t v21 = a5;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  -[DiagnosticsServiceImpl abcEnabledAndReadyWithReply:]((uint64_t)self, v17);
}

void __77__DiagnosticsServiceImpl_listCaseSummariesOfType_fromIdentifier_count_reply___block_invoke(uint64_t *a1, int a2, char a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a2 && (a3 & 1) != 0)
  {
    id v5 = [MEMORY[0x263F08D68] currentConnection];
    if (-[DiagnosticsServiceImpl assertEntitlement:entitlement:private:](a1[4], v5, @"com.apple.symptom_diagnostics.private", 1))
    {
      id v6 = xpcLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: DiagnosticsService: authorized for CloudKit ABC activities", (uint8_t *)&v22, 2u);
      }

      id v7 = +[ABCAdministrator sharedInstance];
      id v8 = [v7 configurationManager];
      int v9 = [v8 cloudKitEnabled];

      id v10 = +[ABCAdministrator sharedInstance];
      id v11 = [v10 configurationManager];
      int v12 = [v11 caseSummaryEnabled];

      id v13 = xpcLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = @"disabled";
        if (v9) {
          id v15 = @"enabled";
        }
        else {
          id v15 = @"disabled";
        }
        if (v12) {
          id v14 = @"enabled";
        }
        int v22 = 138412546;
        id v23 = v15;
        __int16 v24 = 2112;
        id v25 = v14;
        _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_INFO, "DiagnosticCaseSummaryLog: CloudKitUpload is %@, CaseSummary is %@", (uint8_t *)&v22, 0x16u);
      }

      id v16 = +[ABCAdministrator sharedInstance];
      os_log_type_t v17 = [v16 caseManager];
      [v17 listCaseSummariesOfType:a1[5] fromIdentifier:a1[6] count:a1[8] reply:a1[7]];
    }
    else if (a1[7])
    {
      unint64_t v21 = xpcLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_209DBA000, v21, OS_LOG_TYPE_ERROR, "DiagnosticCaseSummaryLog: DiagnosticsService: not entitled to access private API", (uint8_t *)&v22, 2u);
      }

      (*(void (**)(void))(a1[7] + 16))();
    }
  }
  else
  {
    id v18 = xpcLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = "enabled";
      if (a2) {
        id v19 = "ready";
      }
      int v22 = 136446210;
      id v23 = (void *)v19;
      _os_log_impl(&dword_209DBA000, v18, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: DiagnosticsService(PRIVATE): listCaseSummariesOfType - ABC is not %{public}s", (uint8_t *)&v22, 0xCu);
    }

    uint64_t v20 = a1[7];
    if (v20) {
      (*(void (**)(uint64_t, void))(v20 + 16))(v20, 0);
    }
  }
}

- (void)submitRecentCaseSummariesWithIdentifiers:(id)a3 reply:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = (__CFString *)a3;
  id v7 = (void (**)(id, __CFString *))a4;
  id v8 = xpcLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    uint64_t v26 = v6;
    _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: DiagnosticsService: request CloudKit submission for identifiers %@", (uint8_t *)&v25, 0xCu);
  }

  int v9 = [MEMORY[0x263F08D68] currentConnection];
  if (-[DiagnosticsServiceImpl assertEntitlement:entitlement:private:]((uint64_t)self, v9, @"com.apple.symptom_diagnostics.private", 1))
  {
    id v10 = xpcLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: DiagnosticsService: authorized CloudKit submission for ABC case summaries", (uint8_t *)&v25, 2u);
    }

    id v11 = +[ABCAdministrator sharedInstance];
    int v12 = [v11 configurationManager];
    int v13 = [v12 cloudKitEnabled];

    id v14 = +[ABCAdministrator sharedInstance];
    id v15 = [v14 configurationManager];
    int v16 = [v15 caseSummaryEnabled];

    if (v13 && v16)
    {
      os_log_type_t v17 = +[ABCAdministrator sharedInstance];
      id v18 = [v17 ckUploadController];

      if (v18)
      {
        id v19 = +[ABCAdministrator sharedInstance];
        uint64_t v20 = [v19 ckUploadController];
        [v20 submitCaseSummariesWithIdentifiers:v6 reply:v7];
      }
      else
      {
        id v19 = xpcLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          LOWORD(v25) = 0;
          _os_log_impl(&dword_209DBA000, v19, OS_LOG_TYPE_INFO, "DiagnosticCaseSummaryLog: CloudKit upload controller is not instantiated!", (uint8_t *)&v25, 2u);
        }
      }
    }
    else
    {
      int v22 = xpcLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = @"disabled";
        if (v13) {
          __int16 v24 = @"enabled";
        }
        else {
          __int16 v24 = @"disabled";
        }
        if (v16) {
          id v23 = @"enabled";
        }
        int v25 = 138412546;
        uint64_t v26 = v24;
        __int16 v27 = 2112;
        __int16 v28 = v23;
        _os_log_impl(&dword_209DBA000, v22, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: cannot submit! CloudKitUpload is %@, CaseSummary is %@", (uint8_t *)&v25, 0x16u);
      }
    }
  }
  else if (v7)
  {
    unint64_t v21 = xpcLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_209DBA000, v21, OS_LOG_TYPE_ERROR, "DiagnosticCaseSummaryLog: DiagnosticsService: not entitled to access private API", (uint8_t *)&v25, 2u);
    }

    v7[2](v7, @"No access to private API");
  }
}

- (void)submitRecentCaseSummariesWithCount:(unint64_t)a3 reply:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, __CFString *))a4;
  id v7 = xpcLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 134217984;
    unint64_t v29 = a3;
    _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: DiagnosticsService: request CloudKit submission for recent %ld case summaries", (uint8_t *)&v28, 0xCu);
  }

  id v8 = [MEMORY[0x263F08D68] currentConnection];
  if (-[DiagnosticsServiceImpl assertEntitlement:entitlement:private:]((uint64_t)self, v8, @"com.apple.symptom_diagnostics.private", 1))
  {
    int v9 = xpcLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: DiagnosticsService: authorized CloudKit submission for recent ABC case summaries", (uint8_t *)&v28, 2u);
    }

    id v10 = +[ABCAdministrator sharedInstance];
    id v11 = [v10 configurationManager];
    int v12 = [v11 cloudKitEnabled];

    int v13 = +[ABCAdministrator sharedInstance];
    id v14 = [v13 configurationManager];
    int v15 = [v14 caseSummaryEnabled];

    if (v12 && v15)
    {
      int v16 = +[ABCAdministrator sharedInstance];
      os_log_type_t v17 = [v16 ckUploadController];

      if (v17)
      {
        id v18 = +[ABCAdministrator sharedInstance];
        id v19 = [v18 ckUploadController];
        [v19 submitRecentCaseSummaries:a3 reply:v6];

        goto LABEL_25;
      }
      unint64_t v21 = xpcLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        LOWORD(v28) = 0;
        __int16 v24 = "DiagnosticCaseSummaryLog: CloudKit upload controller is not instantiated!";
        int v25 = v21;
        os_log_type_t v26 = OS_LOG_TYPE_INFO;
        uint32_t v27 = 2;
LABEL_23:
        _os_log_impl(&dword_209DBA000, v25, v26, v24, (uint8_t *)&v28, v27);
      }
    }
    else
    {
      unint64_t v21 = xpcLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = @"disabled";
        if (v12) {
          id v23 = @"enabled";
        }
        else {
          id v23 = @"disabled";
        }
        if (v15) {
          int v22 = @"enabled";
        }
        int v28 = 138412546;
        unint64_t v29 = (unint64_t)v23;
        __int16 v30 = 2112;
        __int16 v31 = v22;
        __int16 v24 = "DiagnosticCaseSummaryLog: cannot submit! CloudKitUpload is %@, CaseSummary is %@";
        int v25 = v21;
        os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
        uint32_t v27 = 22;
        goto LABEL_23;
      }
    }

    goto LABEL_25;
  }
  if (v6)
  {
    uint64_t v20 = xpcLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_209DBA000, v20, OS_LOG_TYPE_ERROR, "DiagnosticCaseSummaryLog: DiagnosticsService: not entitled to access private API", (uint8_t *)&v28, 2u);
    }

    v6[2](v6, @"No access to private API");
  }
LABEL_25:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->allowanceCache, 0);

  objc_storeStrong((id *)&self->queue, 0);
}

@end