@interface CNContactProviderSupportManager
+ (BOOL)isConnectionForContactProvider:(id)a3;
+ (void)invalidateCache;
- (BOOL)addDomain:(id)a3 error:(id *)a4;
- (BOOL)disableDomain:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)enableDomain:(id)a3 bundleIdentifier:(id)a4 shouldSynchronize:(BOOL)a5 error:(id *)a6;
- (BOOL)invalidateExtensionForDomain:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)removeDomain:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)resetEnumerationForDomain:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)synchronizeProviderDomainUsingSession:(id)a3 error:(id *)a4;
- (CNContactProviderSupportManager)initWithAuditToken:(id)a3;
- (CNContactProviderSupportModerator)moderator;
- (CNContainer)providerContainer;
- (NSString)clientBundleIdentifier;
- (_TtC8Contacts28CNContactProviderSupportHost)providerHost;
- (id)fetchExtensionCount;
- (id)fetchExtensionItems;
- (id)getActualBundleIdentifier:(id)a3;
- (id)isProviderDomainEnabledWithBundleIdentifier:(id)a3;
- (id)providerContainerWithBundleIdentifier:(id)a3;
- (id)registeredDomainsForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)requestHostDomainCommand:(id)a3 error:(id *)a4;
- (void)setModerator:(id)a3;
- (void)setProviderHost:(id)a3;
@end

@implementation CNContactProviderSupportManager

void __54__CNContactProviderSupportManager_initWithAuditToken___block_invoke()
{
  v0 = +[CNContactProviderSupportCache sharedCache];
}

- (CNContactProviderSupportManager)initWithAuditToken:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_3 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_3, &__block_literal_global_57);
    }
    v5 = CNGuardOSLog_cn_once_object_0_3;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_3, OS_LOG_TYPE_FAULT)) {
      -[CNContactProviderSupportManager initWithAuditToken:](v5);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)CNContactProviderSupportManager;
  v6 = [(CNContactProviderSupportManager *)&v17 init];
  if (v6)
  {
    v7 = [MEMORY[0x1E4F5A348] bundleIdentifierForAuditToken:v4];
    clientBundleIdentifier = v6->_clientBundleIdentifier;
    v6->_clientBundleIdentifier = v7;
    v9 = v7;

    v10 = objc_alloc_init(_TtC8Contacts28CNContactProviderSupportHost);
    providerHost = v6->_providerHost;
    v6->_providerHost = v10;

    uint64_t v12 = +[CNContactProviderSupportModerator sharedInstance];
    moderator = v6->_moderator;
    v6->_moderator = (CNContactProviderSupportModerator *)v12;

    v14 = [MEMORY[0x1E4F5A4E8] offMainThreadScheduler];

    [v14 performBlock:&__block_literal_global_49];
    v15 = v6;
  }

  return v6;
}

+ (BOOL)isConnectionForContactProvider:(id)a3
{
  v3 = [a3 serviceName];
  char v4 = [v3 isEqualToString:@"com.apple.contactsd.contact-provider"];

  return v4;
}

+ (void)invalidateCache
{
  id v2 = +[CNContactProviderSupportCache sharedCache];
  [v2 invalidateCache];
}

- (id)requestHostDomainCommand:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 commandType];
  int v8 = [v7 isEqualToString:@"FetchDomainEnabled"];

  if (v8)
  {
    v9 = [v6 bundleIdentifier];
    v10 = [(CNContactProviderSupportManager *)self isProviderDomainEnabledWithBundleIdentifier:v9];

LABEL_3:
    id v11 = 0;
    goto LABEL_26;
  }
  uint64_t v12 = [v6 commandType];
  int v13 = [v12 isEqualToString:@"FetchDomainContainerIdentifier"];

  if (v13)
  {
    v14 = [(CNContactProviderSupportManager *)self providerContainer];
    v15 = [v14 identifier];

    goto LABEL_30;
  }
  v16 = [v6 commandType];
  int v17 = [v16 isEqualToString:@"SynchronizeDomain"];

  if (!v17)
  {
    v20 = [v6 commandType];
    int v21 = [v20 isEqualToString:@"InvalidateExtension"];

    if (v21)
    {
      v18 = [v6 domainIdentifier];
      v22 = [v6 bundleIdentifier];
      v50 = 0;
      [(CNContactProviderSupportManager *)self invalidateExtensionForDomain:v18 bundleIdentifier:v22 error:&v50];
      v23 = v50;
    }
    else
    {
      v24 = [v6 commandType];
      int v25 = [v24 isEqualToString:@"ResetEnumeration"];

      if (v25)
      {
        v18 = [v6 domainIdentifier];
        v22 = [v6 bundleIdentifier];
        v49 = 0;
        [(CNContactProviderSupportManager *)self resetEnumerationForDomain:v18 bundleIdentifier:v22 error:&v49];
        v23 = v49;
      }
      else
      {
        v26 = [v6 commandType];
        int v27 = [v26 isEqualToString:@"AddDomain"];

        if (v27)
        {
          v18 = [v6 domain];
          v48 = 0;
          [(CNContactProviderSupportManager *)self addDomain:v18 error:&v48];
          v19 = v48;
          goto LABEL_8;
        }
        v28 = [v6 commandType];
        int v29 = [v28 isEqualToString:@"RemoveDomain"];

        if (v29)
        {
          v18 = [v6 domainIdentifier];
          v22 = [v6 bundleIdentifier];
          v47 = 0;
          [(CNContactProviderSupportManager *)self removeDomain:v18 bundleIdentifier:v22 error:&v47];
          v23 = v47;
        }
        else
        {
          v30 = [v6 commandType];
          int v31 = [v30 isEqualToString:@"FetchRegisteredDomains"];

          if (v31)
          {
            v32 = [v6 bundleIdentifier];
            id v46 = 0;
            v10 = [(CNContactProviderSupportManager *)self registeredDomainsForBundleIdentifier:v32 error:&v46];
            id v11 = v46;

            goto LABEL_26;
          }
          v33 = [v6 commandType];
          int v34 = [v33 isEqualToString:@"EnableDomain"];

          if (v34)
          {
            v18 = [v6 domainIdentifier];
            v22 = [v6 bundleIdentifier];
            v45 = 0;
            -[CNContactProviderSupportManager enableDomain:bundleIdentifier:shouldSynchronize:error:](self, "enableDomain:bundleIdentifier:shouldSynchronize:error:", v18, v22, [v6 shouldSynchronize], &v45);
            v23 = v45;
          }
          else
          {
            v35 = [v6 commandType];
            int v36 = [v35 isEqualToString:@"DisableDomain"];

            if (!v36)
            {
              v39 = [v6 commandType];
              int v40 = [v39 isEqualToString:@"FetchAllDomainsCount"];

              if (v40)
              {
                uint64_t v41 = [(CNContactProviderSupportManager *)self fetchExtensionCount];
              }
              else
              {
                v42 = [v6 commandType];
                int v43 = [v42 isEqualToString:@"FetchAllDomains"];

                if (!v43)
                {
                  id v11 = +[CNErrorFactory errorWithCode:1002];
                  goto LABEL_25;
                }
                uint64_t v41 = [(CNContactProviderSupportManager *)self fetchExtensionItems];
              }
              v10 = (void *)v41;
              goto LABEL_3;
            }
            v18 = [v6 domainIdentifier];
            v22 = [v6 bundleIdentifier];
            v44 = 0;
            [(CNContactProviderSupportManager *)self disableDomain:v18 bundleIdentifier:v22 error:&v44];
            v23 = v44;
          }
        }
      }
    }
    id v11 = v23;

    goto LABEL_24;
  }
  v18 = [v6 session];
  v51 = 0;
  [(CNContactProviderSupportManager *)self synchronizeProviderDomainUsingSession:v18 error:&v51];
  v19 = v51;
LABEL_8:
  id v11 = v19;
LABEL_24:

LABEL_25:
  v10 = 0;
LABEL_26:
  id v37 = v10;
  v15 = v37;
  if (a4 && !v37) {
    *a4 = v11;
  }

LABEL_30:

  return v15;
}

- (CNContainer)providerContainer
{
  v3 = [(CNContactProviderSupportManager *)self clientBundleIdentifier];
  char v4 = [(CNContactProviderSupportManager *)self providerContainerWithBundleIdentifier:v3];

  return (CNContainer *)v4;
}

- (id)providerContainerWithBundleIdentifier:(id)a3
{
  char v4 = [(CNContactProviderSupportManager *)self getActualBundleIdentifier:a3];
  v5 = [(CNContactProviderSupportManager *)self providerHost];
  id v6 = [v5 providerContainerFor:v4];

  return v6;
}

- (BOOL)synchronizeProviderDomainUsingSession:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    if (CNGuardOSLog_cn_once_token_0_3 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_3, &__block_literal_global_57);
    }
    v7 = CNGuardOSLog_cn_once_object_0_3;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_3, OS_LOG_TYPE_FAULT)) {
      -[CNContactProviderSupportManager synchronizeProviderDomainUsingSession:error:](v7);
    }
  }
  int v8 = [(CNContactProviderSupportManager *)self moderator];
  v9 = [(CNContactProviderSupportManager *)self clientBundleIdentifier];
  v10 = [(CNContactProviderSupportManager *)self providerHost];
  id v11 = [v8 synchronizeProviderDomainUsingSession:v6 bundleIdentifier:v9 providerHost:v10];

  uint64_t v12 = [MEMORY[0x1E4F5A4E0] resultWithFuture:v11 timeout:1800.0];
  char v13 = [v12 isSuccess];
  if ((v13 & 1) == 0)
  {
    v14 = [v12 error];
    v15 = v14;
    if (a4) {
      *a4 = v14;
    }
  }
  return v13;
}

- (BOOL)invalidateExtensionForDomain:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [(CNContactProviderSupportManager *)self getActualBundleIdentifier:a4];
  id v10 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
  id v11 = [(CNContactProviderSupportManager *)self providerHost];
  uint64_t v12 = [v10 errorOnlyCompletionHandlerAdapter];
  [v11 invalidateExtensionFor:v8 bundleIdentifier:v9 completionHandler:v12];

  char v13 = (void *)MEMORY[0x1E4F5A4E0];
  v14 = [v10 future];
  v15 = [v13 resultWithFuture:v14];

  id v16 = v15;
  char v17 = [v16 isSuccess];
  if ((v17 & 1) == 0)
  {
    v18 = [v16 error];
    v19 = v18;
    if (a5) {
      *a5 = v18;
    }
  }
  return v17;
}

- (BOOL)resetEnumerationForDomain:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [(CNContactProviderSupportManager *)self getActualBundleIdentifier:a4];
  id v10 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
  id v11 = [(CNContactProviderSupportManager *)self providerHost];
  uint64_t v12 = [v10 errorOnlyCompletionHandlerAdapter];
  [v11 resetEnumerationFor:v8 bundleIdentifier:v9 completionHandler:v12];

  char v13 = (void *)MEMORY[0x1E4F5A4E0];
  v14 = [v10 future];
  v15 = [v13 resultWithFuture:v14];

  id v16 = v15;
  char v17 = [v16 isSuccess];
  if ((v17 & 1) == 0)
  {
    v18 = [v16 error];
    v19 = v18;
    if (a5) {
      *a5 = v18;
    }
  }
  return v17;
}

- (id)isProviderDomainEnabledWithBundleIdentifier:(id)a3
{
  v3 = [(CNContactProviderSupportManager *)self providerContainerWithBundleIdentifier:a3];
  char v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isEnabled"));

  return v4;
}

- (BOOL)addDomain:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 bundleIdentifier];
  id v8 = [(CNContactProviderSupportManager *)self getActualBundleIdentifier:v7];

  id v9 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
  id v10 = [(CNContactProviderSupportManager *)self providerHost];
  id v11 = [v9 errorOnlyCompletionHandlerAdapter];
  [v10 addDomain:v6 bundleIdentifier:v8 completionHandler:v11];

  uint64_t v12 = (void *)MEMORY[0x1E4F5A4E0];
  char v13 = [v9 future];
  v14 = [v12 resultWithFuture:v13];

  id v15 = v14;
  char v16 = [v15 isSuccess];
  if ((v16 & 1) == 0)
  {
    char v17 = [v15 error];
    v18 = v17;
    if (a4) {
      *a4 = v17;
    }
  }
  return v16;
}

- (BOOL)removeDomain:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(CNContactProviderSupportManager *)self getActualBundleIdentifier:a4];
  id v10 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
  id v11 = [(CNContactProviderSupportManager *)self providerHost];
  uint64_t v12 = [v10 errorOnlyCompletionHandlerAdapter];
  [v11 removeDomainFor:v8 bundleIdentifier:v9 completionHandler:v12];

  char v13 = (void *)MEMORY[0x1E4F5A4E0];
  v14 = [v10 future];
  id v15 = [v13 resultWithFuture:v14];

  id v16 = v15;
  char v17 = [v16 isSuccess];
  if ((v17 & 1) == 0)
  {
    v18 = [v16 error];
    v19 = v18;
    if (a5) {
      *a5 = v18;
    }
  }
  return v17;
}

- (id)registeredDomainsForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = [(CNContactProviderSupportManager *)self getActualBundleIdentifier:a3];
  id v7 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
  id v8 = [(CNContactProviderSupportManager *)self providerHost];
  id v9 = [v7 completionHandlerAdapter];
  [v8 registeredDomainsFor:v6 completionHandler:v9];

  id v10 = (void *)MEMORY[0x1E4F5A4E0];
  id v11 = [v7 future];
  uint64_t v12 = [v10 resultWithFuture:v11];

  id v13 = v12;
  v14 = [v13 value];

  if (v14)
  {
    id v15 = [v13 value];
  }
  else
  {
    id v16 = [v13 error];
    char v17 = v16;
    if (a4) {
      *a4 = v16;
    }

    id v15 = 0;
  }

  return v15;
}

- (BOOL)enableDomain:(id)a3 bundleIdentifier:(id)a4 shouldSynchronize:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = [(CNContactProviderSupportManager *)self getActualBundleIdentifier:a4];
  uint64_t v12 = [(CNContactProviderSupportManager *)self isProviderDomainEnabledWithBundleIdentifier:v11];
  int v13 = [v12 BOOLValue];

  if (a4) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = v13 ^ 1u;
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
  id v16 = [(CNContactProviderSupportManager *)self providerHost];
  char v17 = [v15 errorOnlyCompletionHandlerAdapter];
  [v16 enableDomainFor:v10 bundleIdentifier:v11 showPrompt:v14 shouldSynchronize:v7 completionHandler:v17];

  v18 = (void *)MEMORY[0x1E4F5A4E0];
  v19 = [v15 future];
  v20 = [v18 resultWithFuture:v19];

  id v21 = v20;
  char v22 = [v21 isSuccess];
  if ((v22 & 1) == 0)
  {
    v23 = [v21 error];
    v24 = v23;
    if (a6) {
      *a6 = v23;
    }
  }
  return v22;
}

- (BOOL)disableDomain:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(CNContactProviderSupportManager *)self getActualBundleIdentifier:a4];
  id v10 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
  id v11 = [(CNContactProviderSupportManager *)self providerHost];
  uint64_t v12 = [v10 errorOnlyCompletionHandlerAdapter];
  [v11 disableDomainFor:v8 bundleIdentifier:v9 completionHandler:v12];

  int v13 = (void *)MEMORY[0x1E4F5A4E0];
  uint64_t v14 = [v10 future];
  id v15 = [v13 resultWithFuture:v14];

  id v16 = v15;
  char v17 = [v16 isSuccess];
  if ((v17 & 1) == 0)
  {
    v18 = [v16 error];
    v19 = v18;
    if (a5) {
      *a5 = v18;
    }
  }
  return v17;
}

- (id)getActualBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(CNContactProviderSupportManager *)self clientBundleIdentifier];
  }

  return v4;
}

- (id)fetchExtensionCount
{
  id v2 = [(CNContactProviderSupportManager *)self providerHost];
  v3 = [v2 extensionCount];

  return v3;
}

- (id)fetchExtensionItems
{
  id v2 = [(CNContactProviderSupportManager *)self providerHost];
  v3 = [v2 extensionItems];

  return v3;
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (_TtC8Contacts28CNContactProviderSupportHost)providerHost
{
  return self->_providerHost;
}

- (void)setProviderHost:(id)a3
{
}

- (CNContactProviderSupportModerator)moderator
{
  return self->_moderator;
}

- (void)setModerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moderator, 0);
  objc_storeStrong((id *)&self->_providerHost, 0);

  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
}

- (void)initWithAuditToken:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1909E3000, log, OS_LOG_TYPE_FAULT, "parameter ‘cnAuditToken’ must be nonnull", v1, 2u);
}

- (void)synchronizeProviderDomainUsingSession:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1909E3000, log, OS_LOG_TYPE_FAULT, "parameter ‘session’ must be nonnull", v1, 2u);
}

@end