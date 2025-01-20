@interface _LSDOpenClient
- (BOOL)serviceSelectorRequiresDatabaseContext:(SEL)a3;
- (void)canOpenURL:(id)a3 publicSchemes:(BOOL)a4 privateSchemes:(BOOL)a5 completionHandler:(id)a6;
- (void)failedToOpenApplication:(id)a3 withURL:(id)a4 completionHandler:(id)a5;
- (void)getURLOverrideForURL:(id)a3 completionHandler:(id)a4;
- (void)getiCloudHostNamesWithCompletionHandler:(id)a3;
- (void)invokeServiceInvocation:(id)a3 isReply:(BOOL)a4;
- (void)openAppLink:(id)a3 state:(id)a4 completionHandler:(id)a5;
- (void)openApplicationWithIdentifier:(id)a3 options:(id)a4 useClientProcessHandle:(BOOL)a5 completionHandler:(id)a6;
- (void)openURL:(id)a3 fileHandle:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)openUserActivityWithUniqueIdentifier:(id)a3 activityData:(id)a4 activityType:(id)a5 bundleIdentifier:(id)a6 options:(id)a7 completionHandler:(id)a8;
- (void)performOpenOperationWithURL:(id)a3 fileHandle:(id)a4 bundleIdentifier:(id)a5 documentIdentifier:(id)a6 isContentManaged:(BOOL)a7 sourceAuditToken:(id *)a8 userInfo:(id)a9 options:(id)a10 delegate:(id)a11 completionHandler:(id)a12;
- (void)updateRestrictionKnowledgeWithCompletionHandler:(id)a3;
- (void)willHandleInvocation:(id)a3 isReply:(BOOL)a4;
@end

@implementation _LSDOpenClient

- (void)canOpenURL:(id)a3 publicSchemes:(BOOL)a4 privateSchemes:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  v19[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = (void (**)(id, uint64_t, id))a6;
  _LSAssertRunningInServer((uint64_t)"-[_LSDOpenClient canOpenURL:publicSchemes:privateSchemes:completionHandler:]");
  if (v10 && ([v10 scheme], v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    v13 = +[_LSCanOpenURLManager sharedManager];
    v14 = [(_LSDClient *)self XPCConnection];
    id v17 = 0;
    uint64_t v15 = [v13 canOpenURL:v10 publicSchemes:v8 privateSchemes:v7 XPCConnection:v14 error:&v17];
    id v16 = v17;

    v11[2](v11, v15, v16);
  }
  else
  {
    uint64_t v18 = *MEMORY[0x1E4F28228];
    v19[0] = @"url";
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDOpenClient canOpenURL:publicSchemes:privateSchemes:completionHandler:]", 349, v13);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v16);
  }
}

- (BOOL)serviceSelectorRequiresDatabaseContext:(SEL)a3
{
  return sel_updateRestrictionKnowledgeWithCompletionHandler_ != a3;
}

- (void)willHandleInvocation:(id)a3 isReply:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_LSDOpenClient;
  [(_LSDClient *)&v8 willHandleInvocation:v6 isReply:v4];
  if (!v4)
  {
    BOOL v7 = _LSDatabaseGetSeedingGroup();
    dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)invokeServiceInvocation:(id)a3 isReply:(BOOL)a4
{
  id v6 = a3;
  BOOL v7 = v6;
  if (a4
    || !-[_LSDOpenClient serviceSelectorRequiresDatabaseContext:](self, "serviceSelectorRequiresDatabaseContext:", [v6 selector]))
  {
    [v7 invoke];
  }
  else
  {
    _LSServer_DatabaseExecutionContext();
    objc_super v8 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50___LSDOpenClient_invokeServiceInvocation_isReply___block_invoke;
    v9[3] = &unk_1E522BB38;
    id v10 = v7;
    -[LSDBExecutionContext syncRead:](v8, v9);
  }
}

- (void)performOpenOperationWithURL:(id)a3 fileHandle:(id)a4 bundleIdentifier:(id)a5 documentIdentifier:(id)a6 isContentManaged:(BOOL)a7 sourceAuditToken:(id *)a8 userInfo:(id)a9 options:(id)a10 delegate:(id)a11 completionHandler:(id)a12
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v36 = a4;
  id v38 = a5;
  id v18 = a6;
  id v19 = a9;
  id v20 = a10;
  id v37 = a11;
  id v21 = a12;
  _LSAssertRunningInServer((uint64_t)"-[_LSDOpenClient performOpenOperationWithURL:fileHandle:bundleIdentifier:documentIde"
                                    "ntifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:completionHandler:]");
  v22 = _LSOpenLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = [(_LSDClient *)self XPCConnection];
    int v24 = [v23 processIdentifier];
    if (a8)
    {
      long long v25 = *(_OWORD *)&a8->var0[4];
      *(_OWORD *)atoken.val = *(_OWORD *)a8->var0;
      *(_OWORD *)&atoken.val[4] = v25;
      pid_t v26 = audit_token_to_pid(&atoken);
    }
    else
    {
      pid_t v26 = 0;
    }
    *(_DWORD *)buf = 134219010;
    uint64_t v43 = v24;
    __int16 v44 = 2112;
    id v45 = v17;
    __int16 v46 = 2112;
    id v47 = v38;
    __int16 v48 = 2112;
    id v49 = v18;
    __int16 v50 = 2048;
    uint64_t v51 = v26;
    _os_log_impl(&dword_182959000, v22, OS_LOG_TYPE_DEFAULT, "pid %ld issuing open of %@ by %@, doc %@ on behalf of %ld", buf, 0x34u);
  }
  if (!v17) {
    goto LABEL_14;
  }
  v27 = [v17 scheme];
  int v28 = v27 != 0;

  char v29 = v28 ^ 1;
  if (!v19) {
    char v29 = 1;
  }
  if ((v29 & 1) == 0)
  {
    v30 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    int v28 = _LSIsDictionaryWithKeysAndValuesOfClasses(v19, v30, 0);
  }
  if (!v20 || !v28)
  {
    if (!v28) {
      goto LABEL_14;
    }
LABEL_16:
    v33 = [(_LSDClient *)self XPCConnection];
    _LSServer_PerformOpenOperation(v17, v36, v38, a7, (long long *)a8, v18, v19, v20, v37, v33, v21);
    goto LABEL_17;
  }
  v31 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  char v32 = _LSIsDictionaryWithKeysAndValuesOfClasses(v20, v31, 0);

  if (v32) {
    goto LABEL_16;
  }
LABEL_14:
  uint64_t v40 = *MEMORY[0x1E4F28228];
  v41 = @"invalid input parameters";
  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
  v34 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDOpenClient performOpenOperationWithURL:fileHandle:bundleIdentifier:documentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:completionHandler:]", 213, v33);
  (*((void (**)(id, void, void *))v21 + 2))(v21, 0, v34);

LABEL_17:
}

- (void)openApplicationWithIdentifier:(id)a3 options:(id)a4 useClientProcessHandle:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  _LSAssertRunningInServer((uint64_t)"-[_LSDOpenClient openApplicationWithIdentifier:options:useClientProcessHandle:completionHandler:]");
  v13 = _LSOpenLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [(_LSDClient *)self XPCConnection];
    *(_DWORD *)buf = 134218242;
    uint64_t v23 = (int)[v14 processIdentifier];
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl(&dword_182959000, v13, OS_LOG_TYPE_DEFAULT, "pid %ld requests to open application with identifier %@", buf, 0x16u);
  }
  int v15 = _os_feature_enabled_impl();
  int v16 = v15 | v7;
  if (v15 && !v7)
  {
    id v17 = _LSOpenLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_182959000, v17, OS_LOG_TYPE_INFO, "using client process handle even though the client asked not to", buf, 2u);
    }

    int v16 = 1;
  }
  if (v10)
  {
    id v18 = [(_LSDClient *)self XPCConnection];
    _LSServer_OpenApplication(v10, v11, v18, v16, v12);
  }
  else
  {
    uint64_t v20 = *MEMORY[0x1E4F28228];
    id v21 = @"identifier";
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v19 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDOpenClient openApplicationWithIdentifier:options:useClientProcessHandle:completionHandler:]", 237, v18);
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v19);
  }
}

- (void)openURL:(id)a3 fileHandle:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void, void *))a6;
  _LSAssertRunningInServer((uint64_t)"-[_LSDOpenClient openURL:fileHandle:options:completionHandler:]");
  v14 = _LSOpenLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = [(_LSDClient *)self XPCConnection];
    int v16 = [v15 processIdentifier];
    id v17 = [v10 scheme];
    *(_DWORD *)buf = 134349315;
    id v36 = (id)v16;
    __int16 v37 = 2113;
    id v38 = v17;
    _os_log_impl(&dword_182959000, v14, OS_LOG_TYPE_DEFAULT, "pid %{public}ld requests to open URL with scheme %{private}@", buf, 0x16u);
  }
  if (!v10) {
    goto LABEL_8;
  }
  id v18 = [v10 scheme];

  BOOL v19 = v18 == 0;
  if (!v12) {
    BOOL v19 = 1;
  }
  if (v19)
  {
    if (!v18) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    char v21 = _LSIsDictionaryWithKeysAndValuesOfClasses(v12, v20, 0);

    if ((v21 & 1) == 0)
    {
LABEL_8:
      v22 = _LSOpenLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v10;
        _os_log_impl(&dword_182959000, v22, OS_LOG_TYPE_DEFAULT, "ERROR: paramError, cannot open URL %@", buf, 0xCu);
      }

      uint64_t v33 = *MEMORY[0x1E4F28228];
      v34 = @"invalid input parameters";
      uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      __int16 v24 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDOpenClient openURL:fileHandle:options:completionHandler:]", 284, v23);
      v13[2](v13, 0, v24);
      goto LABEL_23;
    }
  }
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = [v12 objectForKey:@"LSOpenSensitiveURLOption"];
  v27 = (void *)v26;
  if (v25 && v26 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v27 = 0;
  }
  uint64_t v28 = [v27 BOOLValue];

  char v29 = +[LSApplicationWorkspace defaultWorkspace];
  LOBYTE(v28) = [v29 isApplicationAvailableToOpenURL:v10 includePrivateURLSchemes:v28 error:0];

  v30 = [v10 scheme];
  uint64_t v23 = v30;
  if ((v28 & 1) == 0
    && [v30 caseInsensitiveCompare:@"search"]
    && [v23 caseInsensitiveCompare:@"com-apple-audiounit"])
  {
    v31 = _LSOpenLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      char v32 = [v10 scheme];
      *(_DWORD *)buf = 138412290;
      id v36 = v32;
      _os_log_impl(&dword_182959000, v31, OS_LOG_TYPE_DEFAULT, "ERROR: There is no registered handler for URL scheme %@", buf, 0xCu);
    }
    __int16 v24 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10814, (uint64_t)"-[_LSDOpenClient openURL:fileHandle:options:completionHandler:]", 279, 0);
    v13[2](v13, 0, v24);
  }
  else
  {
    __int16 v24 = [(_LSDClient *)self XPCConnection];
    _LSServer_PerformOpenOperation(v10, v11, 0, 0, 0, 0, 0, v12, 0, v24, v13);
  }
LABEL_23:
}

- (void)openUserActivityWithUniqueIdentifier:(id)a3 activityData:(id)a4 activityType:(id)a5 bundleIdentifier:(id)a6 options:(id)a7 completionHandler:(id)a8
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  unint64_t v14 = (unint64_t)a3;
  unint64_t v32 = (unint64_t)a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = (void (**)(id, void, void *))a8;
  _LSAssertRunningInServer((uint64_t)"-[_LSDOpenClient openUserActivityWithUniqueIdentifier:activityData:activityType:bund"
                                    "leIdentifier:options:completionHandler:]");
  BOOL v19 = _LSOpenLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = [(_LSDClient *)self XPCConnection];
    *(_DWORD *)buf = 134218498;
    uint64_t v38 = (int)[v20 processIdentifier];
    __int16 v39 = 2112;
    unint64_t v40 = v14;
    __int16 v41 = 2112;
    id v42 = v15;
    _os_log_impl(&dword_182959000, v19, OS_LOG_TYPE_DEFAULT, "pid %ld opening user activity %@ of type %@", buf, 0x20u);
  }
  if (v14 | v32) {
    BOOL v21 = v15 == 0;
  }
  else {
    BOOL v21 = 1;
  }
  BOOL v22 = v21 || v16 == 0;
  int v23 = !v22;
  if (v22 || !v17)
  {
    if (!v23) {
      goto LABEL_15;
    }
  }
  else
  {
    __int16 v24 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    char v25 = _LSIsDictionaryWithKeysAndValuesOfClasses(v17, v24, 0);

    if ((v25 & 1) == 0)
    {
LABEL_15:
      uint64_t v33 = *MEMORY[0x1E4F28228];
      v34 = @"invalid input parameters";
      uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      v27 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDOpenClient openUserActivityWithUniqueIdentifier:activityData:activityType:bundleIdentifier:options:completionHandler:]", 329, v26);
      v18[2](v18, 0, v27);
LABEL_23:

      goto LABEL_24;
    }
  }
  uint64_t v28 = [(_LSDClient *)self XPCConnection];
  char v29 = [v28 _xpcConnection];
  BOOL v30 = _LSCheckEntitlementForXPCConnection(v29, @"com.apple.private.coreservices.canopenactivity") == 0;

  if (v30)
  {
    if (@"com.apple.private.coreservices.canopenactivity") {
      v31 = @"com.apple.private.coreservices.canopenactivity";
    }
    else {
      v31 = @"unknown entitlement";
    }
    uint64_t v35 = *MEMORY[0x1E4F28228];
    id v36 = v31;
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    v27 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDOpenClient openUserActivityWithUniqueIdentifier:activityData:activityType:bundleIdentifier:options:completionHandler:]", 325, v26);
    v18[2](v18, 0, v27);
    goto LABEL_23;
  }
  uint64_t v26 = [(_LSDClient *)self XPCConnection];
  _LSServer_OpenUserActivity((void *)v14, (void *)v32, v15, 0, v16, 0, 0, v17, v26, v18);
LABEL_24:
}

- (void)getURLOverrideForURL:(id)a3 completionHandler:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void *, void))a4;
  _LSAssertRunningInServer((uint64_t)"-[_LSDOpenClient getURLOverrideForURL:completionHandler:]");
  if (v5)
  {
    BOOL v7 = [[_LSURLOverride alloc] initWithOriginalURL:v5];
    objc_super v8 = v7;
    if (v7)
    {
      v9 = [(_LSURLOverride *)v7 overrideURL];
    }
    else
    {
      v9 = 0;
    }

    v6[2](v6, v9, 0);
  }
  else
  {
    uint64_t v12 = *MEMORY[0x1E4F28228];
    v13[0] = @"invalid input URL";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v11 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDOpenClient getURLOverrideForURL:completionHandler:]", 367, v10);
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v11);
  }
}

- (void)getiCloudHostNamesWithCompletionHandler:(id)a3
{
  id v3 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDOpenClient getiCloudHostNamesWithCompletionHandler:]");
  BOOL v4 = _LSServer_GetIOQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58___LSDOpenClient_getiCloudHostNamesWithCompletionHandler___block_invoke;
  block[3] = &unk_1E522F248;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (void)openAppLink:(id)a3 state:(id)a4 completionHandler:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDOpenClient openAppLink:state:completionHandler:]");
  id v11 = _LSOpenLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [(_LSDClient *)self XPCConnection];
    *(_DWORD *)buf = 134218498;
    uint64_t v32 = (int)[v12 processIdentifier];
    __int16 v33 = 2112;
    id v34 = v8;
    __int16 v35 = 2112;
    id v36 = v9;
    _os_log_impl(&dword_182959000, v11, OS_LOG_TYPE_DEFAULT, "pid %ld opening app link %@ %@", buf, 0x20u);
  }
  if (v8
    && ([(_LSDClient *)self XPCConnection],
        v13 = objc_claimAutoreleasedReturnValue(),
        [v13 _xpcConnection],
        unint64_t v14 = objc_claimAutoreleasedReturnValue(),
        BOOL v15 = _LSXPCConnectionMayMapDatabase(v14) == 0,
        v14,
        v13,
        v15))
  {
    uint64_t v29 = *MEMORY[0x1E4F28228];
    BOOL v30 = @"process may not map database";
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    BOOL v22 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDOpenClient openAppLink:state:completionHandler:]", 394, v20);
    v10[2](v10, 0, v22);
  }
  else if (!v9 {
         || ([v9 URL],
  }
             id v16 = objc_claimAutoreleasedReturnValue(),
             BOOL v17 = v16 == 0,
             v16,
             v17))
  {
    uint64_t v27 = *MEMORY[0x1E4F28228];
    uint64_t v28 = @"openState";
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    BOOL v21 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDOpenClient openAppLink:state:completionHandler:]", 406, v20);
    v10[2](v10, 0, v21);
  }
  else
  {
    id v18 = [(_LSDClient *)self XPCConnection];
    [v9 setXPCConnection:v18];

    BOOL v19 = +[LSAppLink _dispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54___LSDOpenClient_openAppLink_state_completionHandler___block_invoke;
    block[3] = &unk_1E522C040;
    id v24 = v8;
    id v25 = v9;
    uint64_t v26 = v10;
    dispatch_async(v19, block);

    uint64_t v20 = v24;
  }
}

- (void)failedToOpenApplication:(id)a3 withURL:(id)a4 completionHandler:(id)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDOpenClient failedToOpenApplication:withURL:completionHandler:]");
  id v11 = [(_LSDClient *)self XPCConnection];
  uint64_t v12 = [v11 _xpcConnection];
  int MayMapDatabase = _LSXPCConnectionMayMapDatabase(v12);

  if (MayMapDatabase)
  {
    id v28 = 0;
    id v25 = 0;
    id v26 = 0;
    char v27 = 0;
    +[_LSDServiceDomain defaultServiceDomain]();
    unint64_t v14 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v25, v14, 0);

    if (v15)
    {
      _LSServer_DisplayRemovedAppPrompt(v15, v8, v9, v10);
    }
    else
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      uint64_t v20 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v25, v20, 0);

      if (v21) {
        id v22 = 0;
      }
      else {
        id v22 = v28;
      }
      (*((void (**)(id, void, id))v10 + 2))(v10, 0, v22);
    }
    if (v25 && v27) {
      _LSContextDestroy(v25);
    }
    id v23 = v26;
    id v25 = 0;
    id v26 = 0;

    char v27 = 0;
    id v24 = v28;
    id v28 = 0;
  }
  else
  {
    id v16 = _LSOpenLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      BOOL v17 = [(_LSDClient *)self XPCConnection];
      -[_LSDOpenClient failedToOpenApplication:withURL:completionHandler:]([v17 processIdentifier], (uint8_t *)&v25, v16, v17);
    }

    uint64_t v29 = *MEMORY[0x1E4F28228];
    v30[0] = @"process may not map database";
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    BOOL v19 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDOpenClient failedToOpenApplication:withURL:completionHandler:]", 418, v18);
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v19);
  }
}

- (void)updateRestrictionKnowledgeWithCompletionHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, BOOL, void))a3;
  id v5 = [(_LSDClient *)self XPCConnection];
  int v6 = _LSCheckEntitlementForNSXPCConnection(v5, @"com.apple.lsapplicationworkspace.restrictions");

  if (v6)
  {
    +[LSDBExecutionContext sharedServerInstance]();
    id v7 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    -[LSDBExecutionContext assertNotActiveForThisThread](v7);

    id v8 = _LSDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(_LSDClient *)self XPCConnection];
      *(_DWORD *)buf = 134217984;
      uint64_t v17 = (int)[v9 processIdentifier];
      _os_log_impl(&dword_182959000, v8, OS_LOG_TYPE_DEFAULT, "Pid %ld is forcing restriction knowledge update!", buf, 0xCu);
    }
    id v10 = +[LSApplicationRestrictionsManager sharedInstance]();
    BOOL v11 = -[LSApplicationRestrictionsManager forceUpdateRestrictionKnowledgeWithError:](v10);
    id v12 = 0;

    if (v11)
    {
      id v13 = 0;
    }
    else
    {
      uint64_t v15 = _LSDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[_LSDOpenClient updateRestrictionKnowledgeWithCompletionHandler:]((uint64_t)v12, v15);
      }

      id v13 = v12;
    }
    ((void (**)(id, BOOL, id))v4)[2](v4, v11, v13);
  }
  else
  {
    unint64_t v14 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDOpenClient updateRestrictionKnowledgeWithCompletionHandler:]", 447, 0);
    ((void (**)(id, BOOL, void *))v4)[2](v4, 0, v14);
  }
}

- (void)failedToOpenApplication:(os_log_t)log withURL:(void *)a4 completionHandler:.cold.1(int a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "**ERROR** process MAY NOT MAP DATABASE! Ignoring failed URL from pid %llu", buf, 0xCu);
}

- (void)updateRestrictionKnowledgeWithCompletionHandler:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_182959000, a2, OS_LOG_TYPE_ERROR, "error forcing restriction knowledge update: %@", (uint8_t *)&v2, 0xCu);
}

@end