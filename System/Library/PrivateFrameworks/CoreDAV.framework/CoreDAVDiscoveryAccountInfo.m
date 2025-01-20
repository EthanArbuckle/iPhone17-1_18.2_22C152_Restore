@interface CoreDAVDiscoveryAccountInfo
- (BOOL)handleAuthenticateAgainstProtectionSpace:(id)a3;
- (BOOL)handleCertificateError:(id)a3;
- (BOOL)handleShouldUseCredentialStorage;
- (BOOL)handleTrustChallenge:(id)a3 completionHandler:(id)a4;
- (BOOL)renewCredential;
- (BOOL)shouldFailAllTasks;
- (BOOL)shouldHandleHTTPCookiesForURL:(id)a3;
- (BOOL)shouldRetryUnauthorizedTask:(id)a3;
- (BOOL)shouldSendClientInfoHeaderForURL:(id)a3;
- (BOOL)shouldTryRenewingCredential;
- (BOOL)shouldTurnModalOnBadPassword;
- (BOOL)shouldUseOpportunisticSockets;
- (BOOL)started;
- (BOOL)success;
- (CoreDAVAccountInfoProvider)backingAccountInfoProvider;
- (CoreDAVDiscoveryAccountInfo)initWithAccountInfoProvider:(id)a3;
- (NSData)identityPersist;
- (NSDictionary)serverHeaders;
- (NSError)error;
- (NSSet)serverComplianceClasses;
- (NSString)accountID;
- (NSString)description;
- (NSString)host;
- (NSString)password;
- (NSString)scheme;
- (NSString)serverRoot;
- (NSString)user;
- (NSString)userAgentHeader;
- (NSURL)principalURL;
- (__CFURLStorageSession)copyStorageSession;
- (id)additionalHeaderValues;
- (id)clientCertificateInfoProvider;
- (id)clientToken;
- (id)customConnectionProperties;
- (id)getAppleIDSession;
- (id)oauthInfoProvider;
- (id)url;
- (int64_t)port;
- (void)clientTokenRequestedByServer;
- (void)promptUserForNewCoreDAVPasswordWithCompletionBlock:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setBackingAccountInfoProvider:(id)a3;
- (void)setError:(id)a3;
- (void)setHost:(id)a3;
- (void)setIdentityPersist:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPort:(int64_t)a3;
- (void)setPrincipalURL:(id)a3;
- (void)setScheme:(id)a3;
- (void)setServerComplianceClasses:(id)a3;
- (void)setServerHeaders:(id)a3;
- (void)setServerRoot:(id)a3;
- (void)setShouldFailAllTasks:(BOOL)a3;
- (void)setStarted:(BOOL)a3;
- (void)setSuccess:(BOOL)a3;
- (void)setUser:(id)a3;
- (void)setUserAgentHeader:(id)a3;
@end

@implementation CoreDAVDiscoveryAccountInfo

- (CoreDAVDiscoveryAccountInfo)initWithAccountInfoProvider:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CoreDAVDiscoveryAccountInfo;
  v5 = [(CoreDAVDiscoveryAccountInfo *)&v14 init];
  if (v5)
  {
    v6 = [v4 scheme];
    [(CoreDAVDiscoveryAccountInfo *)v5 setScheme:v6];

    v7 = [v4 host];
    [(CoreDAVDiscoveryAccountInfo *)v5 setHost:v7];

    -[CoreDAVDiscoveryAccountInfo setPort:](v5, "setPort:", [v4 port]);
    v8 = [v4 serverRoot];
    [(CoreDAVDiscoveryAccountInfo *)v5 setServerRoot:v8];

    v9 = [v4 user];
    [(CoreDAVDiscoveryAccountInfo *)v5 setUser:v9];

    v10 = [v4 password];
    [(CoreDAVDiscoveryAccountInfo *)v5 setPassword:v10];

    v11 = [v4 userAgentHeader];
    [(CoreDAVDiscoveryAccountInfo *)v5 setUserAgentHeader:v11];

    v12 = [v4 accountID];
    [(CoreDAVDiscoveryAccountInfo *)v5 setAccountID:v12];

    [(CoreDAVDiscoveryAccountInfo *)v5 setBackingAccountInfoProvider:v4];
  }

  return v5;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v15.receiver = self;
  v15.super_class = (Class)CoreDAVDiscoveryAccountInfo;
  id v4 = [(CoreDAVDiscoveryAccountInfo *)&v15 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVDiscoveryAccountInfo *)self scheme];
  [v3 appendFormat:@"\n  Scheme: [%@]", v5];

  v6 = [(CoreDAVDiscoveryAccountInfo *)self host];
  [v3 appendFormat:@"\n  Host: [%@]", v6];

  objc_msgSend(v3, "appendFormat:", @"\n  Port: [%ld]", -[CoreDAVDiscoveryAccountInfo port](self, "port"));
  v7 = [(CoreDAVDiscoveryAccountInfo *)self serverRoot];
  [v3 appendFormat:@"\n  Server root: [%@]", v7];

  v8 = [(CoreDAVDiscoveryAccountInfo *)self user];
  [v3 appendFormat:@"\n  User: [%@]", v8];

  v9 = [(CoreDAVDiscoveryAccountInfo *)self accountID];
  [v3 appendFormat:@"\n  Account ID: [%@]", v9];

  v10 = [(CoreDAVDiscoveryAccountInfo *)self principalURL];
  [v3 appendFormat:@"\n  Principal URL: [%@]", v10];

  v11 = [(CoreDAVDiscoveryAccountInfo *)self serverHeaders];
  [v3 appendFormat:@"\n  Server headers: [%@]", v11];

  v12 = [(CoreDAVDiscoveryAccountInfo *)self serverComplianceClasses];
  [v3 appendFormat:@"\n  Server compliance classes: [%@]", v12];

  v13 = [(CoreDAVDiscoveryAccountInfo *)self userAgentHeader];
  [v3 appendFormat:@"\n  User agent header: [%@]", v13];

  return (NSString *)v3;
}

- (id)url
{
  if ([(CoreDAVDiscoveryAccountInfo *)self port])
  {
    id v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[CoreDAVDiscoveryAccountInfo port](self, "port"));
  }
  else
  {
    id v3 = 0;
  }
  id v4 = NSURL;
  v5 = [(CoreDAVDiscoveryAccountInfo *)self scheme];
  v6 = [(CoreDAVDiscoveryAccountInfo *)self user];
  v7 = [(CoreDAVDiscoveryAccountInfo *)self host];
  v8 = [(CoreDAVDiscoveryAccountInfo *)self serverRoot];
  v9 = [v4 CDVURLWithScheme:v5 user:v6 password:0 host:v7 port:v3 path:v8];

  return v9;
}

- (void)promptUserForNewCoreDAVPasswordWithCompletionBlock:(id)a3
{
  id v5 = a3;
  [(CoreDAVDiscoveryAccountInfo *)self setShouldFailAllTasks:1];
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id, uint64_t))v5 + 2))(v5, 2);
    id v4 = v5;
  }
}

- (id)additionalHeaderValues
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(CoreDAVAccountInfoProvider *)self->_backingAccountInfoProvider additionalHeaderValues];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (void)clientTokenRequestedByServer
{
  if (objc_opt_respondsToSelector())
  {
    backingAccountInfoProvider = self->_backingAccountInfoProvider;
    [(CoreDAVAccountInfoProvider *)backingAccountInfoProvider clientTokenRequestedByServer];
  }
}

- (id)clientToken
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(CoreDAVAccountInfoProvider *)self->_backingAccountInfoProvider clientToken];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)clientCertificateInfoProvider
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(CoreDAVAccountInfoProvider *)self->_backingAccountInfoProvider clientCertificateInfoProvider];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)oauthInfoProvider
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(CoreDAVAccountInfoProvider *)self->_backingAccountInfoProvider oauthInfoProvider];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (BOOL)handleTrustChallenge:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, void))a4;
  if (objc_opt_respondsToSelector())
  {
    char v8 = [(CoreDAVAccountInfoProvider *)self->_backingAccountInfoProvider handleTrustChallenge:v6 completionHandler:v7];
  }
  else
  {
    v9 = +[CoreDAVLogging sharedLogging];
    v10 = [v9 logHandleForAccountInfoProvider:0];
    v11 = v10;
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_213BFC000, v11, OS_LOG_TYPE_INFO, "BackingAccountInfoProvider doesn't know how to handle a trust challenge, so we're just going to have to cancel.", v13, 2u);
    }

    v7[2](v7, 2, 0);
    char v8 = 0;
  }

  return v8;
}

- (BOOL)handleCertificateError:(id)a3
{
  return [(CoreDAVAccountInfoProvider *)self->_backingAccountInfoProvider handleCertificateError:a3];
}

- (BOOL)shouldTurnModalOnBadPassword
{
  return 0;
}

- (BOOL)shouldRetryUnauthorizedTask:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    char v5 = [(CoreDAVAccountInfoProvider *)self->_backingAccountInfoProvider shouldRetryUnauthorizedTask:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)shouldTryRenewingCredential
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  backingAccountInfoProvider = self->_backingAccountInfoProvider;
  return [(CoreDAVAccountInfoProvider *)backingAccountInfoProvider shouldTryRenewingCredential];
}

- (BOOL)renewCredential
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  backingAccountInfoProvider = self->_backingAccountInfoProvider;
  return [(CoreDAVAccountInfoProvider *)backingAccountInfoProvider renewCredential];
}

- (BOOL)handleAuthenticateAgainstProtectionSpace:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 authenticationMethod];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [(CoreDAVAccountInfoProvider *)self->_backingAccountInfoProvider handleAuthenticateAgainstProtectionSpace:v4];
    v7 = +[CoreDAVLogging sharedLogging];
    char v8 = [v7 logHandleForAccountInfoProvider:0];
    v9 = v8;
    if (!v8 || !os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_15;
    }
    v10 = [NSNumber numberWithBool:v6];
    int v14 = 138543618;
    objc_super v15 = v5;
    __int16 v16 = 2114;
    v17 = v10;
    v11 = "_backingAccountInfoProvider: Can authenticate against protection space %{public}@? %{public}@";
LABEL_14:
    _os_log_impl(&dword_213BFC000, v9, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v14, 0x16u);

LABEL_15:
    goto LABEL_16;
  }
  if (![v5 isEqualToString:*MEMORY[0x263EFC598]])
  {
    if (([v5 isEqualToString:*MEMORY[0x263EFC5A0]] & 1) != 0
      || ([v5 isEqualToString:*MEMORY[0x263EFC580]] & 1) != 0)
    {
      uint64_t v6 = 1;
    }
    else
    {
      uint64_t v6 = [v5 isEqualToString:*MEMORY[0x263EFC588]];
    }
    v7 = +[CoreDAVLogging sharedLogging];
    v12 = [v7 logHandleForAccountInfoProvider:0];
    v9 = v12;
    if (!v12 || !os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      goto LABEL_15;
    }
    v10 = [NSNumber numberWithBool:v6];
    int v14 = 138543618;
    objc_super v15 = v5;
    __int16 v16 = 2114;
    v17 = v10;
    v11 = "CoreDAVDiscoveryAccountInfo: Can authenticate against protection space %{public}@? %{public}@";
    goto LABEL_14;
  }
  LOBYTE(v6) = objc_opt_respondsToSelector();
LABEL_16:

  return v6 & 1;
}

- (BOOL)handleShouldUseCredentialStorage
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  backingAccountInfoProvider = self->_backingAccountInfoProvider;
  return [(CoreDAVAccountInfoProvider *)backingAccountInfoProvider handleShouldUseCredentialStorage];
}

- (BOOL)shouldHandleHTTPCookiesForURL:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    char v5 = [(CoreDAVAccountInfoProvider *)self->_backingAccountInfoProvider shouldHandleHTTPCookiesForURL:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)shouldSendClientInfoHeaderForURL:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    char v5 = [(CoreDAVAccountInfoProvider *)self->_backingAccountInfoProvider shouldSendClientInfoHeaderForURL:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (__CFURLStorageSession)copyStorageSession
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  backingAccountInfoProvider = self->_backingAccountInfoProvider;
  return (__CFURLStorageSession *)[(CoreDAVAccountInfoProvider *)backingAccountInfoProvider copyStorageSession];
}

- (BOOL)shouldUseOpportunisticSockets
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  backingAccountInfoProvider = self->_backingAccountInfoProvider;
  return [(CoreDAVAccountInfoProvider *)backingAccountInfoProvider shouldUseOpportunisticSockets];
}

- (id)getAppleIDSession
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(CoreDAVAccountInfoProvider *)self->_backingAccountInfoProvider getAppleIDSession];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)customConnectionProperties
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(CoreDAVAccountInfoProvider *)self->_backingAccountInfoProvider customConnectionProperties];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (NSString)scheme
{
  return self->_scheme;
}

- (void)setScheme:(id)a3
{
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
}

- (int64_t)port
{
  return self->_port;
}

- (void)setPort:(int64_t)a3
{
  self->_port = a3;
}

- (NSString)serverRoot
{
  return self->_serverRoot;
}

- (void)setServerRoot:(id)a3
{
}

- (NSString)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (NSData)identityPersist
{
  return self->_identityPersist;
}

- (void)setIdentityPersist:(id)a3
{
}

- (NSURL)principalURL
{
  return self->_principalURL;
}

- (void)setPrincipalURL:(id)a3
{
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (BOOL)shouldFailAllTasks
{
  return self->_shouldFailAllTasks;
}

- (void)setShouldFailAllTasks:(BOOL)a3
{
  self->_shouldFailAllTasks = a3;
}

- (CoreDAVAccountInfoProvider)backingAccountInfoProvider
{
  return self->_backingAccountInfoProvider;
}

- (void)setBackingAccountInfoProvider:(id)a3
{
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSDictionary)serverHeaders
{
  return self->_serverHeaders;
}

- (void)setServerHeaders:(id)a3
{
}

- (NSSet)serverComplianceClasses
{
  return self->_serverComplianceClasses;
}

- (void)setServerComplianceClasses:(id)a3
{
}

- (NSString)userAgentHeader
{
  return self->_userAgentHeader;
}

- (void)setUserAgentHeader:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingAccountInfoProvider, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_userAgentHeader, 0);
  objc_storeStrong((id *)&self->_serverComplianceClasses, 0);
  objc_storeStrong((id *)&self->_serverHeaders, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_principalURL, 0);
  objc_storeStrong((id *)&self->_identityPersist, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_serverRoot, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_scheme, 0);
}

@end