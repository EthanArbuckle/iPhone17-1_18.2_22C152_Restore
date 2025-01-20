@interface TKTokenAccessRequest
- (BOOL)clientHasAccessTokenEntitlement;
- (BOOL)isEqual:(id)a3;
- (NSString)clientBundleID;
- (NSString)clientName;
- (NSString)providerBundleID;
- (NSString)providerName;
- (NSUUID)correlationID;
- (NSXPCConnection)clientConnection;
- (TKTokenAccessRequest)initWithCaller:(id)a3 tokenID:(id)a4 extension:(id)a5;
- (TKTokenAccessRequest)initWithClientBundleID:(id)a3 clientName:(id)a4 clientConnection:(id)a5 clientHasAccessTokenEntitlement:(BOOL)a6 tokenID:(id)a7 providerBundleID:(id)a8 providerName:(id)a9 correlationID:(id)a10;
- (TKTokenID)tokenID;
@end

@implementation TKTokenAccessRequest

- (TKTokenAccessRequest)initWithClientBundleID:(id)a3 clientName:(id)a4 clientConnection:(id)a5 clientHasAccessTokenEntitlement:(BOOL)a6 tokenID:(id)a7 providerBundleID:(id)a8 providerName:(id)a9 correlationID:(id)a10
{
  id v26 = a3;
  id v25 = a4;
  id v24 = a5;
  id v23 = a7;
  id v22 = a8;
  id v16 = a9;
  id v17 = a10;
  v27.receiver = self;
  v27.super_class = (Class)TKTokenAccessRequest;
  v18 = [(TKTokenAccessRequest *)&v27 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_clientBundleID, a3);
    objc_storeStrong((id *)&v19->_clientName, a4);
    objc_storeStrong((id *)&v19->_clientConnection, a5);
    v19->_clientHasAccessTokenEntitlement = a6;
    objc_storeStrong((id *)&v19->_tokenID, a7);
    objc_storeStrong((id *)&v19->_providerBundleID, a8);
    objc_storeStrong((id *)&v19->_providerName, a9);
    objc_storeStrong((id *)&v19->_correlationID, a10);
  }

  return v19;
}

- (TKTokenAccessRequest)initWithCaller:(id)a3 tokenID:(id)a4 extension:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    [v8 auditToken];
  }
  else
  {
    long long v32 = 0u;
    long long v33 = 0u;
  }
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2050000000;
  v11 = (void *)getBSAuditTokenClass_softClass;
  uint64_t v40 = getBSAuditTokenClass_softClass;
  if (!getBSAuditTokenClass_softClass)
  {
    *(void *)&long long v34 = MEMORY[0x1E4F143A8];
    *((void *)&v34 + 1) = 3221225472;
    *(void *)&long long v35 = __getBSAuditTokenClass_block_invoke;
    *((void *)&v35 + 1) = &unk_1E63C8158;
    v36 = &v37;
    __getBSAuditTokenClass_block_invoke((uint64_t)&v34);
    v11 = (void *)v38[3];
  }
  v28 = v9;
  v29 = self;
  id v12 = v11;
  _Block_object_dispose(&v37, 8);
  long long v34 = v32;
  long long v35 = v33;
  v13 = [v12 tokenFromAuditToken:&v34];
  v14 = [v13 bundleID];

  id v15 = v14;
  id v16 = objc_alloc_init(TKApplicationProxy);
  v31 = [(TKApplicationProxy *)v16 displayNameForBundleID:v15];

  id v17 = [TKTokenAccessRequest alloc];
  v18 = [v8 valueForEntitlement:@"com.apple.private.ctk.token-access.allow"];
  uint64_t v19 = [v18 BOOLValue];
  v20 = [v10 _extensionBundle];
  v21 = [v20 bundleIdentifier];
  v30 = v10;
  id v22 = [v10 _localizedShortName];
  id v23 = v8;
  id v24 = v22;
  if (!v22)
  {
    id v24 = [v30 _localizedShortName];
  }
  id v25 = objc_alloc_init(MEMORY[0x1E4F29128]);
  id v26 = [(TKTokenAccessRequest *)v17 initWithClientBundleID:v15 clientName:v31 clientConnection:v23 clientHasAccessTokenEntitlement:v19 tokenID:v28 providerBundleID:v21 providerName:v24 correlationID:v25];

  if (!v22) {
  return v26;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (!v5) {
      goto LABEL_15;
    }
    v6 = [(TKTokenAccessRequest *)self correlationID];
    v7 = [v5 correlationID];
    int v8 = [v6 isEqual:v7];

    if (!v8) {
      goto LABEL_15;
    }
    uint64_t v9 = [(TKTokenAccessRequest *)self clientBundleID];
    if (v9)
    {
      id v10 = (void *)v9;
      v11 = [(TKTokenAccessRequest *)self clientBundleID];
      id v12 = [v5 clientBundleID];
      int v13 = [v11 isEqualToString:v12];

      if (!v13) {
        goto LABEL_15;
      }
    }
    uint64_t v14 = [(TKTokenAccessRequest *)self clientName];
    if (v14)
    {
      id v15 = (void *)v14;
      id v16 = [(TKTokenAccessRequest *)self clientName];
      id v17 = [v5 clientName];
      int v18 = [v16 isEqualToString:v17];

      if (!v18) {
        goto LABEL_15;
      }
    }
    int v19 = [(TKTokenAccessRequest *)self clientHasAccessTokenEntitlement];
    if (v19 != [v5 clientHasAccessTokenEntitlement]) {
      goto LABEL_15;
    }
    v20 = [(TKTokenAccessRequest *)self tokenID];
    v21 = [v5 tokenID];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_15;
    }
    uint64_t v23 = [(TKTokenAccessRequest *)self providerBundleID];
    if (!v23) {
      goto LABEL_12;
    }
    id v24 = (void *)v23;
    id v25 = [(TKTokenAccessRequest *)self providerBundleID];
    id v26 = [v5 providerBundleID];
    int v27 = [v25 isEqual:v26];

    if (v27)
    {
LABEL_12:
      uint64_t v28 = [(TKTokenAccessRequest *)self providerName];
      if (v28)
      {
        v29 = (void *)v28;
        v30 = [(TKTokenAccessRequest *)self providerName];
        v31 = [v5 providerName];
        char v32 = [v30 isEqual:v31];
      }
      else
      {
        char v32 = 1;
      }
    }
    else
    {
LABEL_15:
      char v32 = 0;
    }
  }
  else
  {
    char v32 = 0;
  }

  return v32;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (BOOL)clientHasAccessTokenEntitlement
{
  return self->_clientHasAccessTokenEntitlement;
}

- (TKTokenID)tokenID
{
  return self->_tokenID;
}

- (NSString)providerBundleID
{
  return self->_providerBundleID;
}

- (NSString)providerName
{
  return self->_providerName;
}

- (NSUUID)correlationID
{
  return self->_correlationID;
}

- (NSXPCConnection)clientConnection
{
  return self->_clientConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_providerBundleID, 0);
  objc_storeStrong((id *)&self->_tokenID, 0);
  objc_storeStrong((id *)&self->_clientName, 0);

  objc_storeStrong((id *)&self->_clientBundleID, 0);
}

@end