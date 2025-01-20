@interface CNContactProviderSupport
+ (BOOL)addDomain:(id)a3 error:(id *)a4;
+ (BOOL)disableDomain:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5;
+ (BOOL)enableDomain:(id)a3 bundleIdentifier:(id)a4 shouldSynchronize:(BOOL)a5 error:(id *)a6;
+ (BOOL)removeDomain:(id)a3 error:(id *)a4;
+ (CNContactProviderSupport)sharedInstance;
+ (id)allDomainsWithError:(id *)a3;
+ (id)registeredDomainsWithError:(id *)a3;
+ (int64_t)allDomainsCountWithError:(id *)a3;
- (BOOL)addDomain:(id)a3 error:(id *)a4;
- (BOOL)instanceDisableDomain:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)instanceEnableDomain:(id)a3 bundleIdentifier:(id)a4 shouldSynchronize:(BOOL)a5 error:(id *)a6;
- (BOOL)isDomainEnabled;
- (BOOL)isSessionRunning;
- (BOOL)removeDomain:(id)a3 error:(id *)a4;
- (BOOL)requestProviderDomainCommand:(id)a3 error:(id *)a4;
- (CNContactProviderSupport)initWithDomainIdentifier:(id)a3;
- (CNContactProviderSupportSession)currentSession;
- (CNContactStore)contactStore;
- (CNContactStore)providerStore;
- (CNUnfairLock)lock;
- (CNXPCContactsSupport)contactsSupport;
- (NSString)domainContainerIdentifier;
- (NSString)domainIdentifier;
- (id)allDomainsWithError:(id *)a3;
- (id)registeredDomainsWithError:(id *)a3;
- (int64_t)allDomainsCountWithError:(id *)a3;
- (void)disableDomainWithCompletionHandler:(id)a3;
- (void)enableDomainWithCompletionHandler:(id)a3;
- (void)endSession;
- (void)invalidateExtensionWithCompletionHandler:(id)a3;
- (void)requestProviderDomainCommand:(id)a3 completionHandler:(id)a4;
- (void)resetEnumerationWithCompletionHandler:(id)a3;
- (void)setContactsSupport:(id)a3;
- (void)setCurrentSession:(id)a3;
- (void)setProviderStore:(id)a3;
- (void)startSession:(id)a3;
- (void)synchronizeDomainUsingSession:(id)a3 completionHandler:(id)a4;
@end

@implementation CNContactProviderSupport

+ (CNContactProviderSupport)sharedInstance
{
  if (sharedInstance_cn_once_token_0_1 != -1) {
    dispatch_once(&sharedInstance_cn_once_token_0_1, &__block_literal_global_81);
  }
  v2 = (void *)sharedInstance_cn_once_object_0_1;

  return (CNContactProviderSupport *)v2;
}

uint64_t __42__CNContactProviderSupport_sharedInstance__block_invoke()
{
  sharedInstance_cn_once_object_0_1 = [[CNContactProviderSupport alloc] initWithDomainIdentifier:&stru_1EE052B80];

  return MEMORY[0x1F41817F8]();
}

- (CNContactProviderSupport)initWithDomainIdentifier:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CNContactProviderSupport;
  v6 = [(CNContactProviderSupport *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_domainIdentifier, a3);
    providerStore = v7->_providerStore;
    v7->_providerStore = 0;

    uint64_t v9 = +[CNXPCContactsSupport sharedInstance];
    contactsSupport = v7->_contactsSupport;
    v7->_contactsSupport = (CNXPCContactsSupport *)v9;

    v11 = objc_alloc_init(CNContactStoreConfiguration);
    [(CNContactStoreConfiguration *)v11 setIsContactProvider:1];
    [(CNContactStoreConfiguration *)v11 setUseOutOfProcessMapperExclusively:1];
    v12 = [[CNContactStore alloc] initWithConfiguration:v11];
    v13 = v7->_providerStore;
    v7->_providerStore = v12;

    v14 = (CNUnfairLock *)objc_alloc_init(MEMORY[0x1E4F5A558]);
    lock = v7->_lock;
    v7->_lock = v14;

    v16 = v7;
  }

  return v7;
}

- (NSString)domainContainerIdentifier
{
  if ([(CNContactProviderSupport *)self isDomainEnabled])
  {
    v3 = [(CNContactProviderSupport *)self domainIdentifier];
    v4 = +[CNContactProviderSupportDomainCommand fetchContainerIdentifierForDomain:v3];

    id v5 = [(CNContactProviderSupport *)self contactsSupport];
    v6 = [v5 requestProviderDomainCommand:v4 error:0];
  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (BOOL)isDomainEnabled
{
  v3 = [(CNContactProviderSupport *)self domainIdentifier];
  v4 = +[CNContactProviderSupportDomainCommand fetchDomainEnabled:v3];

  id v5 = [(CNContactProviderSupport *)self contactsSupport];
  v6 = [v5 requestProviderDomainCommand:v4 error:0];

  LOBYTE(v5) = [v6 BOOLValue];
  return (char)v5;
}

- (CNContactStore)contactStore
{
  if ([(CNContactProviderSupport *)self isDomainEnabled]) {
    v3 = self->_providerStore;
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)enableDomainWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactProviderSupport *)self domainIdentifier];
  id v6 = +[CNContactProviderSupportDomainCommand enableDomain:v5];

  [(CNContactProviderSupport *)self requestProviderDomainCommand:v6 completionHandler:v4];
}

- (void)disableDomainWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactProviderSupport *)self domainIdentifier];
  id v6 = +[CNContactProviderSupportDomainCommand disableDomain:v5];

  [(CNContactProviderSupport *)self requestProviderDomainCommand:v6 completionHandler:v4];
}

- (void)synchronizeDomainUsingSession:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(CNContactProviderSupport *)self isSessionRunning])
  {
    if (v6) {
      v8 = (CNContactProviderSupportSession *)v6;
    }
    else {
      v8 = objc_alloc_init(CNContactProviderSupportSession);
    }
    uint64_t v9 = v8;
    [(CNContactProviderSupport *)self startSession:v8];
    v10 = [(CNContactProviderSupport *)self domainIdentifier];
    v11 = +[CNContactProviderSupportDomainCommand synchronizeDomain:v10 usingSession:v9];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __76__CNContactProviderSupport_synchronizeDomainUsingSession_completionHandler___block_invoke;
    v12[3] = &unk_1E56B75F8;
    v12[4] = self;
    id v13 = v7;
    [(CNContactProviderSupport *)self requestProviderDomainCommand:v11 completionHandler:v12];
  }
}

uint64_t __76__CNContactProviderSupport_synchronizeDomainUsingSession_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(void **)(a1 + 32);

  return [v3 endSession];
}

- (void)invalidateExtensionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactProviderSupport *)self domainIdentifier];
  id v6 = +[CNContactProviderSupportDomainCommand invalidateExtensionForDomain:v5];

  [(CNContactProviderSupport *)self requestProviderDomainCommand:v6 completionHandler:v4];
}

- (void)resetEnumerationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactProviderSupport *)self domainIdentifier];
  id v6 = +[CNContactProviderSupportDomainCommand resetEnumerationForDomain:v5];

  [(CNContactProviderSupport *)self requestProviderDomainCommand:v6 completionHandler:v4];
}

- (void)startSession:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactProviderSupport *)self lock];
  id v6 = v4;
  CNRunWithLock();
}

uint64_t __41__CNContactProviderSupport_startSession___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentSession:*(void *)(a1 + 40)];
}

- (BOOL)isSessionRunning
{
  uint64_t v2 = [(CNContactProviderSupport *)self lock];
  v3 = CNResultWithLock();

  LOBYTE(v2) = [v3 BOOLValue];
  return (char)v2;
}

id __44__CNContactProviderSupport_isSessionRunning__block_invoke(uint64_t a1)
{
  v1 = NSNumber;
  uint64_t v2 = [*(id *)(a1 + 32) currentSession];
  v3 = [v1 numberWithInt:v2 != 0];

  return v3;
}

- (void)endSession
{
  uint64_t v2 = [(CNContactProviderSupport *)self lock];
  CNRunWithLock();
}

uint64_t __38__CNContactProviderSupport_endSession__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentSession:0];
}

+ (BOOL)addDomain:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[CNContactProviderSupport sharedInstance];
  LOBYTE(a4) = [v6 addDomain:v5 error:a4];

  return (char)a4;
}

+ (BOOL)removeDomain:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[CNContactProviderSupport sharedInstance];
  LOBYTE(a4) = [v6 removeDomain:v5 error:a4];

  return (char)a4;
}

+ (id)registeredDomainsWithError:(id *)a3
{
  id v4 = +[CNContactProviderSupport sharedInstance];
  id v5 = [v4 registeredDomainsWithError:a3];

  return v5;
}

+ (int64_t)allDomainsCountWithError:(id *)a3
{
  id v4 = +[CNContactProviderSupport sharedInstance];
  int64_t v5 = [v4 allDomainsCountWithError:a3];

  return v5;
}

+ (id)allDomainsWithError:(id *)a3
{
  id v4 = +[CNContactProviderSupport sharedInstance];
  int64_t v5 = [v4 allDomainsWithError:a3];

  return v5;
}

+ (BOOL)enableDomain:(id)a3 bundleIdentifier:(id)a4 shouldSynchronize:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[CNContactProviderSupport sharedInstance];
  LOBYTE(a6) = [v11 instanceEnableDomain:v10 bundleIdentifier:v9 shouldSynchronize:v7 error:a6];

  return (char)a6;
}

+ (BOOL)disableDomain:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = +[CNContactProviderSupport sharedInstance];
  LOBYTE(a5) = [v9 instanceDisableDomain:v8 bundleIdentifier:v7 error:a5];

  return (char)a5;
}

- (BOOL)addDomain:(id)a3 error:(id *)a4
{
  id v6 = +[CNContactProviderSupportDomainCommand addDomain:a3];
  LOBYTE(a4) = [(CNContactProviderSupport *)self requestProviderDomainCommand:v6 error:a4];

  return (char)a4;
}

- (BOOL)removeDomain:(id)a3 error:(id *)a4
{
  id v6 = +[CNContactProviderSupportDomainCommand removeDomain:a3];
  LOBYTE(a4) = [(CNContactProviderSupport *)self requestProviderDomainCommand:v6 error:a4];

  return (char)a4;
}

- (id)registeredDomainsWithError:(id *)a3
{
  id v4 = +[CNContactProviderSupportDomainCommand fetchRegisteredDomains];
  int64_t v5 = [(CNContactProviderSupport *)self contactsSupport];
  id v6 = [v5 requestProviderDomainCommand:v4 error:0];

  return v6;
}

- (int64_t)allDomainsCountWithError:(id *)a3
{
  int64_t v5 = +[CNContactProviderSupportDomainCommand fetchAllDomainsCount];
  id v6 = [(CNContactProviderSupport *)self contactsSupport];
  id v11 = 0;
  id v7 = [v6 requestProviderDomainCommand:v5 error:&v11];
  id v8 = v11;

  if (a3) {
    *a3 = v8;
  }
  if (v7) {
    int64_t v9 = [v7 integerValue];
  }
  else {
    int64_t v9 = 0;
  }

  return v9;
}

- (id)allDomainsWithError:(id *)a3
{
  int64_t v5 = +[CNContactProviderSupportDomainCommand fetchAllDomains];
  id v6 = [(CNContactProviderSupport *)self contactsSupport];
  id v12 = 0;
  id v7 = [v6 requestProviderDomainCommand:v5 error:&v12];
  id v8 = v12;

  id v9 = v7;
  id v10 = v9;
  if (a3 && !v9) {
    *a3 = v8;
  }

  return v10;
}

- (BOOL)instanceEnableDomain:(id)a3 bundleIdentifier:(id)a4 shouldSynchronize:(BOOL)a5 error:(id *)a6
{
  id v8 = +[CNContactProviderSupportDomainCommand enableDomain:a3 bundleIdentifier:a4 shouldSynchronize:a5];
  LOBYTE(a6) = [(CNContactProviderSupport *)self requestProviderDomainCommand:v8 error:a6];

  return (char)a6;
}

- (BOOL)instanceDisableDomain:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v7 = +[CNContactProviderSupportDomainCommand disableDomain:a3 bundleIdentifier:a4];
  LOBYTE(a5) = [(CNContactProviderSupport *)self requestProviderDomainCommand:v7 error:a5];

  return (char)a5;
}

- (BOOL)requestProviderDomainCommand:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CNContactProviderSupport *)self contactsSupport];
  id v11 = 0;
  id v8 = (id)[v7 requestProviderDomainCommand:v6 error:&v11];
  id v9 = v11;

  if (a4 && v9) {
    *a4 = v9;
  }

  return v9 == 0;
}

- (void)requestProviderDomainCommand:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [MEMORY[0x1E4F5A4E8] offMainThreadScheduler];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__CNContactProviderSupport_requestProviderDomainCommand_completionHandler___block_invoke;
  v11[3] = &unk_1E56B7620;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [v8 performBlock:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __75__CNContactProviderSupport_requestProviderDomainCommand_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = [WeakRetained contactsSupport];
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = 0;
  id v5 = (id)[v3 requestProviderDomainCommand:v4 error:&v8];
  id v6 = v8;

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
  }
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (CNContactStore)providerStore
{
  return self->_providerStore;
}

- (void)setProviderStore:(id)a3
{
}

- (CNXPCContactsSupport)contactsSupport
{
  return self->_contactsSupport;
}

- (void)setContactsSupport:(id)a3
{
}

- (CNUnfairLock)lock
{
  return (CNUnfairLock *)objc_getProperty(self, a2, 32, 1);
}

- (CNContactProviderSupportSession)currentSession
{
  return self->_currentSession;
}

- (void)setCurrentSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_contactsSupport, 0);
  objc_storeStrong((id *)&self->_providerStore, 0);

  objc_storeStrong((id *)&self->_domainIdentifier, 0);
}

@end