@interface LNApplicationConnection
- (BOOL)shouldRefreshWithOptions:(id)a3;
- (LNApplicationConnection)initWithBundleIdentifier:(id)a3;
- (LNApplicationConnection)initWithEffectiveBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 processInstanceIdentifier:(id)a5 appIntentsEnabledOnly:(BOOL)a6 userIdentity:(id)a7 error:(id *)a8;
- (void)handleConnectionActionResponse:(id)a3;
@end

@implementation LNApplicationConnection

- (LNApplicationConnection)initWithEffectiveBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 processInstanceIdentifier:(id)a5 appIntentsEnabledOnly:(BOOL)a6 userIdentity:(id)a7 error:(id *)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  if ([(LNApplicationConnection *)self isMemberOfClass:objc_opt_class()])
  {
    v18 = [[LNEmbeddedApplicationConnection alloc] initWithEffectiveBundleIdentifier:v14 appBundleIdentifier:v15 processInstanceIdentifier:v16 appIntentsEnabledOnly:v10 userIdentity:v17 error:a8];
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)LNApplicationConnection;
    v18 = [(LNConnection *)&v21 initWithEffectiveBundleIdentifier:v14 appBundleIdentifier:v15 processInstanceIdentifier:v16 appIntentsEnabledOnly:v10 userIdentity:v17 error:a8];
    self = &v18->super;
  }
  p_super = &v18->super;

  return p_super;
}

- (BOOL)shouldRefreshWithOptions:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v6);

  if ([(LNConnection *)self state] != 3)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"LNApplicationConnection.m", 72, @"Invalid parameter not satisfying: %@", @"self.state == LNConnectionStateConnected" object file lineNumber description];
  }
  id v7 = v5;
  v8 = v7;
  if (!v7 || (char v9 = [v7 conformsToProtocol:&unk_1EF7F9CC8], v8, (v9 & 1) == 0))
  {
    BOOL v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"LNApplicationConnection.m", 73, @"Invalid parameter not satisfying: %@", @"IFCastIfConforms(options, LNApplicationConnectionOptions) != nil" object file lineNumber description];
  }
  v11 = (void *)MEMORY[0x1E4F4F6A8];
  [(LNConnection *)self auditToken];
  v12 = [v11 tokenFromAuditToken:v26];
  v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v12, "pid"));
  id v25 = 0;
  id v14 = [MEMORY[0x1E4F963E8] handleForIdentifier:v13 error:&v25];
  id v15 = v25;
  if (!v14)
  {
    id v16 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = [(LNConnection *)self logPrefix];
      *(_DWORD *)buf = 138543874;
      v28 = v17;
      __int16 v29 = 2114;
      v30 = v13;
      __int16 v31 = 2114;
      id v32 = v15;
      _os_log_impl(&dword_1A4419000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Unable to get process handle for pid %{public}@, %{public}@", buf, 0x20u);
    }
  }
  if ([v14 isDaemon])
  {
    v18 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = [(LNConnection *)self logPrefix];
      *(_DWORD *)buf = 138543618;
      v28 = v19;
      __int16 v29 = 2114;
      v30 = v13;
      _os_log_impl(&dword_1A4419000, v18, OS_LOG_TYPE_INFO, "%{public}@ pid %{public}@ is a daemon; refresh is not required",
        buf,
        0x16u);
    }
    BOOL v20 = 0;
  }
  else if ([v8 isForeground])
  {
    objc_super v21 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4419000, v21, OS_LOG_TYPE_INFO, "Should refresh because we need to launch into the foreground", buf, 2u);
    }

    BOOL v20 = 1;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)LNApplicationConnection;
    BOOL v20 = [(LNConnection *)&v24 shouldRefreshWithOptions:v8];
  }

  return v20;
}

- (void)handleConnectionActionResponse:(id)a3
{
  id v5 = a3;
  v6 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v6);

  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"LNApplicationConnection.m", 62, @"Invalid parameter not satisfying: %@", @"actionResponse" object file lineNumber description];
  }
  if ([(LNConnection *)self state] != 1)
  {
    char v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"LNApplicationConnection.m", 63, @"Invalid parameter not satisfying: %@", @"self.state == LNConnectionStateConnecting" object file lineNumber description];
  }
  id v7 = [v5 listenerEndpoint];
  if (v5) {
    [v5 auditToken];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  [(LNConnection *)self connectUsingListenerEndpoint:v7 auditToken:v10 setupWithAssertions:0];
}

- (LNApplicationConnection)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[LNConnectionManager sharedInstance];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F72630]) initWithType:0 bundleIdentifier:v4];
  id v7 = [v5 connectionForEffectiveBundleIdentifier:v6 appBundleIdentifier:v4 processInstanceIdentifier:0 mangledTypeName:0 userIdentity:0 error:0];

  return v7;
}

@end