@interface AMSPushPayload
+ (id)actionTypeFromPayload:(id)a3;
- (ACAccount)account;
- (ACAccountType)accountType;
- (AMSPushPayload)initWithPayload:(id)a3;
- (BOOL)isAccountTypeActive;
- (NSDictionary)aps;
- (NSDictionary)payload;
- (NSNumber)accountIdentifier;
- (NSString)URLString;
- (NSString)actionType;
- (NSString)clientIdentifier;
- (NSString)logKey;
- (id)objectForKeyedSubscript:(id)a3;
- (int64_t)alertType;
- (int64_t)priority;
@end

@implementation AMSPushPayload

- (AMSPushPayload)initWithPayload:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)AMSPushPayload;
  v6 = [(AMSPushPayload *)&v35 init];
  v7 = v6;
  if (v6)
  {
    p_payload = (void **)&v6->_payload;
    objc_storeStrong((id *)&v6->_payload, a3);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.AppleMediaServices.notification", 0);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = AMSGenerateLogCorrelationKey();
    logKey = v7->_logKey;
    v7->_logKey = (NSString *)v11;

    v13 = [v5 objectForKeyedSubscript:@"10"];
    objc_opt_class();
    id v14 = 0;
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }

    v15 = [v5 objectForKeyedSubscript:@"aps"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v16 = 0;
LABEL_21:

LABEL_22:
      goto LABEL_23;
    }
    id v16 = v15;

    if (!v16 || ![v14 containsString:@"gzip"]) {
      goto LABEL_22;
    }
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v16 options:0];
    v17 = objc_msgSend(v15, "ams_decompressedData");
    if (!v17)
    {
LABEL_20:

      goto LABEL_21;
    }
    id v34 = 0;
    v18 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v17 options:0 error:&v34];
    id v19 = v34;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v20 = v18;

      BOOL v21 = v20 == 0;
      if (!v19 && v20)
      {
LABEL_19:
        v27 = (void *)[v5 mutableCopy];
        [v27 setObject:v20 forKeyedSubscript:@"aps"];
        uint64_t v28 = [v27 copy];
        v29 = *p_payload;
        *p_payload = (void *)v28;

        goto LABEL_20;
      }
    }
    else
    {

      id v20 = 0;
      BOOL v21 = 1;
    }
    BOOL v31 = v21;
    id v32 = v20;
    v33 = v19;
    v22 = +[AMSLogConfig sharedConfig];
    if (!v22)
    {
      v22 = +[AMSLogConfig sharedConfig];
    }
    v23 = [v22 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = objc_opt_class();
      uint64_t v25 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v37 = v24;
      __int16 v38 = 2114;
      uint64_t v39 = v25;
      v26 = (void *)v25;
      __int16 v40 = 2114;
      v41 = v33;
      _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to deserialize APS. %{public}@", buf, 0x20u);
    }
    id v20 = v32;
    if (v31) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_23:

  return v7;
}

- (ACAccount)account
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_queue_t v9 = __Block_byref_object_copy__60;
  v10 = __Block_byref_object_dispose__60;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__AMSPushPayload_account__block_invoke;
  v5[3] = &unk_1E55A30A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (void *)[(id)v7[5] copy];
  _Block_object_dispose(&v6, 8);

  return (ACAccount *)v3;
}

uint64_t __25__AMSPushPayload_account__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = (void *)v2[1];
  if (v3)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v4 + 40) = v3;
  }
  else
  {
    uint64_t v5 = [v2 accountIdentifier];
    if (v5)
    {
      uint64_t v12 = v5;
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
      v7 = objc_msgSend(v6, "ams_iTunesAccountWithDSID:", v12);
      uint64_t v8 = [v7 copy];
      uint64_t v9 = *(void *)(a1 + 32);
      v10 = *(void **)(v9 + 8);
      *(void *)(v9 + 8) = v8;

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 8));
    }
  }
  return MEMORY[0x1F41817F8]();
}

- (NSNumber)accountIdentifier
{
  v2 = [(AMSPushPayload *)self payload];
  v3 = [v2 objectForKeyedSubscript:@"0"];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSNumber *)v4;
}

- (ACAccountType)accountType
{
  id v3 = objc_alloc(MEMORY[0x1E4F179D8]);
  uint64_t v4 = (void *)[v3 initWithIdentifier:*MEMORY[0x1E4F17890] description:&stru_1EDCA7308];
  uint64_t v5 = [(AMSPushPayload *)self payload];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"12"];
  uint64_t v7 = [v6 integerValue];

  if (v7 == 1)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F179D8]);
    uint64_t v9 = [v8 initWithIdentifier:*MEMORY[0x1E4F17750] description:&stru_1EDCA7308];

    uint64_t v4 = (void *)v9;
  }
  return (ACAccountType *)v4;
}

- (NSString)actionType
{
  id v3 = objc_opt_class();
  uint64_t v4 = [(AMSPushPayload *)self payload];
  uint64_t v5 = [v3 actionTypeFromPayload:v4];

  return (NSString *)v5;
}

- (int64_t)alertType
{
  id v3 = [(AMSPushPayload *)self payload];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"7"];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = [(AMSPushPayload *)self payload];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"7"];
  uint64_t v8 = [v7 integerValue];

  if (v8) {
    return 2 * (v8 == 1);
  }
  else {
    return 1;
  }
}

- (NSDictionary)aps
{
  v2 = [(AMSPushPayload *)self payload];
  id v3 = [v2 objectForKeyedSubscript:@"aps"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSString)clientIdentifier
{
  v2 = [(AMSPushPayload *)self payload];
  id v3 = [v2 objectForKeyedSubscript:@"2"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (BOOL)isAccountTypeActive
{
  id v3 = [(AMSPushPayload *)self accountType];
  id v4 = [v3 identifier];
  char v5 = v4;
  if (v4 == (void *)*MEMORY[0x1E4F17890])
  {
    uint64_t v6 = [(AMSPushPayload *)self account];
    char v7 = [v6 isActive];

    if (v7) {
      return 1;
    }
  }
  else
  {
  }
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  v10 = objc_msgSend(v9, "ams_activeiCloudAccount");

  id v11 = objc_msgSend(v10, "ams_DSID");
  uint64_t v12 = [(AMSPushPayload *)self account];
  v13 = objc_msgSend(v12, "ams_DSID");
  char v14 = [v11 isEqual:v13];

  return v14;
}

- (int64_t)priority
{
  v2 = [(AMSPushPayload *)self payload];
  id v3 = [v2 objectForKeyedSubscript:@"11"];

  if (objc_opt_respondsToSelector()) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (NSString)URLString
{
  v2 = [(AMSPushPayload *)self payload];
  id v3 = [v2 objectForKeyedSubscript:@"3"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  char v5 = [(AMSPushPayload *)self payload];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

+ (id)actionTypeFromPayload:(id)a3
{
  id v3 = NSString;
  id v4 = [a3 objectForKeyedSubscript:@"1"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  uint64_t v6 = &unk_1EDD01738;
  if (v5) {
    uint64_t v6 = v5;
  }
  char v7 = [v3 stringWithFormat:@"%@", v6];

  return v7;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end