@interface CNQueryAnalyticsLogger
- (CNAuditToken)auditToken;
- (CNKeyboardStateMonitor)keyboardStateMonitor;
- (CNPair)processIdentity;
- (CNQueryAnalyticsLogger)initWithAuditToken:(id)a3 assumedIdentity:(id)a4;
- (OS_tcc_identity)assumedIdentity;
- (void)recordQueryWithFetchRequest:(id)a3;
- (void)setAssumedIdentity:(id)a3;
- (void)setAuditToken:(id)a3;
- (void)setKeyboardStateMonitor:(id)a3;
- (void)setProcessIdentity:(id)a3;
@end

@implementation CNQueryAnalyticsLogger

id __54__CNQueryAnalyticsLogger_recordQueryWithFetchRequest___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v10[0] = @"keyboardState";
  unint64_t v2 = *(void *)(a1 + 64);
  if (v2 > 3) {
    v3 = @"INVALID";
  }
  else {
    v3 = off_1E56B4C20[v2];
  }
  v11[0] = v3;
  v10[1] = @"hasHighSpecificity";
  v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "cn_hasHighSpecificity"));
  v11[1] = v4;
  v10[2] = @"predicateClass";
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = @"(Null)";
  }
  v11[2] = v7;
  long long v12 = *(_OWORD *)(a1 + 40);
  v10[3] = @"processIdentity";
  v10[4] = @"processIdentityType";
  v10[5] = @"assumedIdentity";
  uint64_t v13 = *(void *)(a1 + 56);
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:6];
  if (v5) {

  }
  return v8;
}

- (void)recordQueryWithFetchRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 predicate];
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    v7 = [v4 keyboardState];
    if (v7)
    {
      v8 = [v4 keyboardState];
      [v8 integerValue];
    }
    else
    {
      v8 = [(CNQueryAnalyticsLogger *)self keyboardStateMonitor];
      [v8 keyboardState];
    }

    v9 = [(CNQueryAnalyticsLogger *)self assumedIdentity];
    if (v9)
    {
      v10 = [(CNQueryAnalyticsLogger *)self assumedIdentity];
      v11 = (__CFString *)tcc_object_copy_description();
    }
    else
    {
      v11 = &stru_1EE052B80;
    }

    long long v12 = [(CNQueryAnalyticsLogger *)self processIdentity];
    uint64_t v13 = [v12 first];
    uint64_t v14 = [v12 second];
    v21 = v11;
    v19 = v6;
    v20 = v13;
    v15 = v11;
    id v16 = v14;
    id v17 = v13;
    id v18 = v6;
    AnalyticsSendEventLazy();
  }
}

- (CNPair)processIdentity
{
  unint64_t v2 = cn_objectResultWithObjectLock();

  return (CNPair *)v2;
}

- (CNKeyboardStateMonitor)keyboardStateMonitor
{
  return self->_keyboardStateMonitor;
}

- (OS_tcc_identity)assumedIdentity
{
  return self->_assumedIdentity;
}

id __41__CNQueryAnalyticsLogger_processIdentity__block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  v3 = (void *)v2[1];
  if (!v3)
  {
    id v4 = [v2 auditToken];
    if (v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F5A348] bundleIdentifierForAuditToken:v4];
      if (v5)
      {
        id v6 = (void *)v5;
        uint64_t v7 = [MEMORY[0x1E4F5A490] pairWithFirst:v5 second:@"b"];
      }
      else
      {
        v10 = [MEMORY[0x1E4F5A348] processNameForAuditToken:v4];
        if (v10)
        {
          v11 = @"p";
          long long v12 = v10;
        }
        else
        {
          long long v12 = &stru_1EE052B80;
          v11 = @"u";
        }
        uint64_t v7 = [MEMORY[0x1E4F5A490] pairWithFirst:v12 second:v11];

        id v6 = 0;
      }
    }
    else
    {
      v8 = (void *)MEMORY[0x1E4F5A490];
      id v6 = [MEMORY[0x1E4F28F80] processInfo];
      v9 = [v6 processName];
      uint64_t v7 = [v8 pairWithFirst:v9 second:@"p"];
    }
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void **)(v13 + 8);
    *(void *)(v13 + 8) = v7;

    v3 = *(void **)(*(void *)(a1 + 32) + 8);
  }

  return v3;
}

- (CNAuditToken)auditToken
{
  return self->_auditToken;
}

- (CNQueryAnalyticsLogger)initWithAuditToken:(id)a3 assumedIdentity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CNQueryAnalyticsLogger;
  v9 = [(CNQueryAnalyticsLogger *)&v18 init];
  if (v9
    && ([MEMORY[0x1E4F5A3D8] currentEnvironment],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 featureFlags],
        v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 isFeatureEnabled:2],
        v11,
        v10,
        v12))
  {
    objc_storeStrong((id *)&v9->_auditToken, a3);
    objc_storeStrong((id *)&v9->_assumedIdentity, a4);
    uint64_t v13 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    uint64_t v14 = [v13 keyboardStateMonitor];
    keyboardStateMonitor = v9->_keyboardStateMonitor;
    v9->_keyboardStateMonitor = (CNKeyboardStateMonitor *)v14;

    id v16 = v9;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardStateMonitor, 0);
  objc_storeStrong((id *)&self->_assumedIdentity, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);

  objc_storeStrong((id *)&self->_processIdentity, 0);
}

- (void)setProcessIdentity:(id)a3
{
}

- (void)setAuditToken:(id)a3
{
}

- (void)setAssumedIdentity:(id)a3
{
}

- (void)setKeyboardStateMonitor:(id)a3
{
}

@end