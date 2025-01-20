@interface AMSSubscriptionEntitlementsResult
- (BOOL)isEqual:(id)a3;
- (NSDictionary)entitlements;
- (NSDictionary)serverResponse;
- (NSNumber)appAdamId;
- (NSNumber)appVersion;
- (id)exportObject;
- (void)setAppAdamId:(id)a3;
- (void)setAppVersion:(id)a3;
- (void)setEntitlements:(id)a3;
- (void)setServerResponse:(id)a3;
@end

@implementation AMSSubscriptionEntitlementsResult

- (id)exportObject
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = [(AMSSubscriptionEntitlementsResult *)self appAdamId];
  v5 = (void *)v4;
  if (v4) {
    v6 = (void *)v4;
  }
  else {
    v6 = &unk_1EDD01780;
  }
  [v3 setObject:v6 forKeyedSubscript:@"appAdamId"];

  uint64_t v7 = [(AMSSubscriptionEntitlementsResult *)self appVersion];
  v8 = (void *)v7;
  if (v7) {
    v9 = (void *)v7;
  }
  else {
    v9 = &unk_1EDD01780;
  }
  [v3 setObject:v9 forKeyedSubscript:@"appVersion"];

  uint64_t v10 = [(AMSSubscriptionEntitlementsResult *)self serverResponse];
  v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = MEMORY[0x1E4F1CC08];
  }
  [v3 setObject:v12 forKeyedSubscript:@"serverResponse"];

  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v14 = [(AMSSubscriptionEntitlementsResult *)self entitlements];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __49__AMSSubscriptionEntitlementsResult_exportObject__block_invoke;
  v17[3] = &unk_1E55A6CA0;
  id v18 = v13;
  id v15 = v13;
  [v14 enumerateKeysAndObjectsUsingBlock:v17];

  [v3 setObject:v15 forKeyedSubscript:@"entitlements"];
  return v3;
}

void __49__AMSSubscriptionEntitlementsResult_exportObject__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 exportObject];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (BOOL)isEqual:(id)a3
{
  v8 = (AMSSubscriptionEntitlementsResult *)a3;
  v9 = v8;
  if (self != v8)
  {
    uint64_t v10 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = 0;
      char v12 = 0;
LABEL_49:

      goto LABEL_50;
    }
    v11 = v10;

    if (!v11)
    {
      char v12 = 0;
LABEL_50:

      goto LABEL_51;
    }
    uint64_t v10 = [(AMSSubscriptionEntitlementsResult *)self appAdamId];
    if (v10
      || ([(AMSSubscriptionEntitlementsResult *)v11 appAdamId],
          (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v4 = [(AMSSubscriptionEntitlementsResult *)self appAdamId];
      id v5 = [(AMSSubscriptionEntitlementsResult *)v11 appAdamId];
      if (([v4 isEqual:v5] & 1) == 0)
      {

        char v12 = 0;
        goto LABEL_47;
      }
      int v40 = 1;
    }
    else
    {
      int v40 = 0;
    }
    id v13 = [(AMSSubscriptionEntitlementsResult *)self appVersion];
    if (v13
      || ([(AMSSubscriptionEntitlementsResult *)v11 appVersion],
          (v39 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v14 = v3;
      id v15 = [(AMSSubscriptionEntitlementsResult *)self appVersion];
      v16 = [(AMSSubscriptionEntitlementsResult *)v11 appVersion];
      if (([v15 isEqual:v16] & 1) == 0)
      {

        if (v13) {
        else
        }

        char v12 = 0;
        id v3 = v14;
        if ((v40 & 1) == 0) {
          goto LABEL_47;
        }
        goto LABEL_46;
      }
      v33 = v15;
      int v38 = 1;
      id v3 = v14;
      id v6 = v16;
    }
    else
    {
      v39 = 0;
      int v38 = 0;
    }
    v17 = [(AMSSubscriptionEntitlementsResult *)self entitlements];
    if (v17
      || ([(AMSSubscriptionEntitlementsResult *)v11 entitlements],
          (v29 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v36 = v13;
      id v18 = v5;
      v19 = v4;
      v20 = v6;
      v21 = [(AMSSubscriptionEntitlementsResult *)self entitlements];
      v34 = [(AMSSubscriptionEntitlementsResult *)v11 entitlements];
      v35 = v21;
      if (![v21 isEqual:v34])
      {
        char v12 = 0;
        id v6 = v20;
        uint64_t v4 = v19;
        id v5 = v18;
        id v13 = v36;
LABEL_38:

LABEL_39:
        if (!v17) {

        }
        if (v38)
        {
        }
        if (!v13) {

        }
        if (!v40) {
          goto LABEL_47;
        }
LABEL_46:

LABEL_47:
        if (!v10) {

        }
        goto LABEL_49;
      }
      v32 = v17;
      int v31 = 1;
      id v6 = v20;
      uint64_t v4 = v19;
      id v5 = v18;
      id v13 = v36;
    }
    else
    {
      v32 = 0;
      v29 = 0;
      int v31 = 0;
    }
    v22 = [(AMSSubscriptionEntitlementsResult *)self serverResponse];
    if (v22
      || ([(AMSSubscriptionEntitlementsResult *)v11 serverResponse],
          (uint64_t v27 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v30 = v6;
      v37 = v3;
      v23 = [(AMSSubscriptionEntitlementsResult *)self serverResponse];
      v24 = [(AMSSubscriptionEntitlementsResult *)v11 serverResponse];
      char v12 = [v23 isEqual:v24];

      if (v22)
      {

        id v6 = v30;
        if (!v31)
        {
          id v3 = v37;
          v17 = v32;
          goto LABEL_39;
        }
        id v3 = v37;
        v17 = v32;
        goto LABEL_38;
      }
      id v3 = v37;
      id v6 = v30;
      v25 = v28;
    }
    else
    {
      v25 = 0;
      char v12 = 1;
    }

    v17 = v32;
    if ((v31 & 1) == 0) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  char v12 = 1;
LABEL_51:

  return v12;
}

- (NSNumber)appAdamId
{
  return self->_appAdamId;
}

- (void)setAppAdamId:(id)a3
{
}

- (NSNumber)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
}

- (NSDictionary)entitlements
{
  return self->_entitlements;
}

- (void)setEntitlements:(id)a3
{
}

- (NSDictionary)serverResponse
{
  return self->_serverResponse;
}

- (void)setServerResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverResponse, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_appAdamId, 0);
}

@end