@interface BNSuspensionController
+ (void)initialize;
- (BOOL)isSuspended;
- (BOOL)setSuspended:(BOOL)a3 forReason:(id)a4;
- (NSSet)activeSuspensionReasons;
- (NSString)identifier;
- (void)setIdentifier:(id)a3;
@end

@implementation BNSuspensionController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    BNRegisterBannerKitLogging();
  }
}

- (BOOL)isSuspended
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NSMutableSet *)v2->_suspensionReasons count] != 0;
  objc_sync_exit(v2);

  return v3;
}

- (NSSet)activeSuspensionReasons
{
  v2 = self;
  objc_sync_enter(v2);
  suspensionReasons = v2->_suspensionReasons;
  if (suspensionReasons) {
    v4 = suspensionReasons;
  }
  else {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }
  v5 = v4;
  objc_sync_exit(v2);

  return (NSSet *)v5;
}

- (BOOL)setSuspended:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v7 = (NSMutableSet *)a4;
  if (!v7)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"BNSuspensionController.m", 43, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    BOOL v27 = 0;
    goto LABEL_17;
  }
  v8 = self;
  objc_sync_enter(v8);
  BOOL v9 = [(BNSuspensionController *)v8 isSuspended];
  if (v4)
  {
    suspensionReasons = v8->_suspensionReasons;
    if (!suspensionReasons)
    {
      v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v12 = v8->_suspensionReasons;
      v8->_suspensionReasons = v11;

      suspensionReasons = v8->_suspensionReasons;
    }
    [(NSMutableSet *)suspensionReasons addObject:v7];
    v13 = BNLogSuspending;
    if (os_log_type_enabled((os_log_t)BNLogSuspending, OS_LOG_TYPE_DEFAULT))
    {
      identifier = v8->_identifier;
      *(_DWORD *)buf = 138543618;
      v31 = identifier;
      __int16 v32 = 2114;
      v33 = v7;
      _os_log_impl(&dword_1BEC04000, v13, OS_LOG_TYPE_DEFAULT, "(%{public}@) Suspension requested with reason: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v15 = BNLogSuspending;
    if (os_log_type_enabled((os_log_t)BNLogSuspending, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v8->_identifier;
      *(_DWORD *)buf = 138543618;
      v31 = v16;
      __int16 v32 = 2114;
      v33 = v7;
      _os_log_impl(&dword_1BEC04000, v15, OS_LOG_TYPE_DEFAULT, "(%{public}@) Resumption requested with reason: %{public}@", buf, 0x16u);
    }
    [(NSMutableSet *)v8->_suspensionReasons removeObject:v7];
  }
  BOOL v17 = [(BNSuspensionController *)v8 isSuspended];
  uint64_t v18 = BNLogSuspending;
  BOOL v19 = os_log_type_enabled((os_log_t)BNLogSuspending, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v19)
    {
      v21 = v8->_suspensionReasons;
      v20 = v8->_identifier;
      *(_DWORD *)buf = 138543618;
      v31 = v20;
      __int16 v32 = 2114;
      v33 = v21;
      v22 = "(%{public}@) Suspended: %{public}@";
      v23 = v18;
      uint32_t v24 = 22;
LABEL_15:
      _os_log_impl(&dword_1BEC04000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
    }
  }
  else if (v19)
  {
    v25 = v8->_identifier;
    *(_DWORD *)buf = 138543362;
    v31 = v25;
    v22 = "(%{public}@) Resumed";
    v23 = v18;
    uint32_t v24 = 12;
    goto LABEL_15;
  }
  BOOL v26 = [(BNSuspensionController *)v8 isSuspended];
  objc_sync_exit(v8);

  BOOL v27 = v9 ^ v26;
LABEL_17:

  return v27;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_suspensionReasons, 0);
}

@end