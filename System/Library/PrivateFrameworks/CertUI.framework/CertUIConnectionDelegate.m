@interface CertUIConnectionDelegate
+ (id)defaultServiceForProtocol:(id)a3;
- (BOOL)connection:(id)a3 canAuthenticateAgainstProtectionSpace:(id)a4;
- (BOOL)respondsToSelector:(SEL)a3;
- (NSString)connectionDisplayName;
- (id)forwardingDelegate;
- (id)forwardingTargetForSelector:(SEL)a3;
- (void)_continueConnectionWithResponse:(int)a3 challenge:(id)a4 service:(id)a5;
- (void)connection:(id)a3 didReceiveAuthenticationChallenge:(id)a4;
- (void)setConnectionDisplayName:(id)a3;
- (void)setForwardingDelegate:(id)a3;
@end

@implementation CertUIConnectionDelegate

- (void)setForwardingDelegate:(id)a3
{
  p_forwardingDelegate = &self->_forwardingDelegate;
  id v9 = a3;
  id v5 = objc_storeWeak(p_forwardingDelegate, v9);
  char v6 = objc_opt_respondsToSelector();

  *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFE | v6 & 1;
  id WeakRetained = objc_loadWeakRetained(p_forwardingDelegate);
  if (objc_opt_respondsToSelector()) {
    char v8 = 2;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFD | v8;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (sel_connection_canAuthenticateAgainstProtectionSpace_ == a3
    || sel_connection_didReceiveAuthenticationChallenge_ == a3)
  {
    char v5 = 1;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(&self->_forwardingDelegate);
    char v5 = objc_opt_respondsToSelector();
  }
  return v5 & 1;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_forwardingDelegate);

  return WeakRetained;
}

+ (id)defaultServiceForProtocol:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = (void *)defaultServiceForProtocol__sServiceDict;
    if (!defaultServiceForProtocol__sServiceDict)
    {
      uint64_t v5 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"CertUIServiceTypeHTTPS", @"https", @"kCertUIServiceTypeIMAP", @"imap", @"kCertUIServiceTypePOP3", @"pop", @"kCertUIServiceTypeSMTP", @"smtp", @"kCertUIServiceTypeSSH", @"ssh", @"kCertUIServiceTypeLDAP", @"ldap", @"kCertUIServiceTypeLDAPS", @"ldaps", 0);
      char v6 = (void *)defaultServiceForProtocol__sServiceDict;
      defaultServiceForProtocol__sServiceDict = v5;

      v4 = (void *)defaultServiceForProtocol__sServiceDict;
    }
    v7 = [v4 objectForKey:v3];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)connection:(id)a3 canAuthenticateAgainstProtectionSpace:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)_CertUILogObjects;
  if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    v11 = NSStringFromSelector(a2);
    int v17 = 138412546;
    v18 = v11;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl(&dword_2152BF000, v10, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v17, 0x16u);
  }
  v12 = [v8 authenticationMethod];
  v13 = (void *)*MEMORY[0x263F08560];

  if (v12 == v13)
  {
    char v14 = 1;
  }
  else if (*(unsigned char *)&self->_delegateRespondsTo)
  {
    id WeakRetained = objc_loadWeakRetained(&self->_forwardingDelegate);
    char v14 = [WeakRetained connection:v7 canAuthenticateAgainstProtectionSpace:v8];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (void)_continueConnectionWithResponse:(int)a3 challenge:(id)a4 service:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)_CertUILogObjects;
  if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    v12 = NSStringFromSelector(a2);
    int v23 = 138412546;
    v24 = v12;
    __int16 v25 = 1024;
    int v26 = a3;
    _os_log_impl(&dword_2152BF000, v11, OS_LOG_TYPE_INFO, "%@ %d", (uint8_t *)&v23, 0x12u);
  }
  if (a3 == 1)
  {
    id v21 = objc_alloc(MEMORY[0x263F08BB8]);
    v22 = [v8 protectionSpace];
    v13 = objc_msgSend(v21, "initWithTrust:", objc_msgSend(v22, "serverTrust"));

    __int16 v19 = [v8 sender];
    [v19 useCredential:v13 forAuthenticationChallenge:v8];
  }
  else
  {
    if (a3 != 2)
    {
      v13 = [v8 sender];
      [v13 cancelAuthenticationChallenge:v8];
      goto LABEL_9;
    }
    v13 = [v8 protectionSpace];
    char v14 = +[CertUITrustManager defaultTrustManager];
    uint64_t v15 = [v13 serverTrust];
    v16 = [v13 host];
    [v14 allowTrust:v15 forHost:v16 service:v9];

    id v17 = objc_alloc(MEMORY[0x263F08BB8]);
    v18 = [v8 protectionSpace];
    __int16 v19 = objc_msgSend(v17, "initWithTrust:", objc_msgSend(v18, "serverTrust"));

    id v20 = [v8 sender];
    [v20 useCredential:v19 forAuthenticationChallenge:v8];
  }
LABEL_9:
}

- (void)connection:(id)a3 didReceiveAuthenticationChallenge:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)_CertUILogObjects;
  if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v34 = v11;
    __int16 v35 = 2112;
    id v36 = v8;
    _os_log_impl(&dword_2152BF000, v10, OS_LOG_TYPE_INFO, "%@ %@", buf, 0x16u);
  }
  v12 = [v8 protectionSpace];
  v13 = [v12 authenticationMethod];
  char v14 = (void *)*MEMORY[0x263F08560];

  if (v13 == v14)
  {
    id WeakRetained = [v8 protectionSpace];
    v16 = objc_opt_class();
    id v17 = [WeakRetained protocol];
    v18 = [v16 defaultServiceForProtocol:v17];

    __int16 v19 = +[CertUITrustManager defaultTrustManager];
    uint64_t v20 = [WeakRetained serverTrust];
    id v21 = [WeakRetained host];
    int v22 = [v19 actionForTrust:v20 forHost:v21 andService:v18];

    if (v22 == 2)
    {
      __int16 v25 = objc_alloc_init(CertUIPrompt);
      uint64_t v27 = [v8 protectionSpace];
      -[CertUIPrompt setTrust:](v25, "setTrust:", [v27 serverTrust]);

      v28 = [v8 protectionSpace];
      v29 = [v28 host];
      [(CertUIPrompt *)v25 setHost:v29];

      [(CertUIPrompt *)v25 setService:v18];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __73__CertUIConnectionDelegate_connection_didReceiveAuthenticationChallenge___block_invoke;
      v30[3] = &unk_264239370;
      v30[4] = self;
      id v31 = v8;
      id v32 = v18;
      [(CertUIPrompt *)v25 showPromptWithResponseBlock:v30];
    }
    else if (v22 == 1)
    {
      id v23 = objc_alloc(MEMORY[0x263F08BB8]);
      v24 = [v8 protectionSpace];
      __int16 v25 = (CertUIPrompt *)objc_msgSend(v23, "initWithTrust:", objc_msgSend(v24, "serverTrust"));

      int v26 = [v8 sender];
      [v26 useCredential:v25 forAuthenticationChallenge:v8];
    }
    else
    {
      __int16 v25 = [v8 sender];
      [(CertUIPrompt *)v25 cancelAuthenticationChallenge:v8];
    }
  }
  else if ((*(unsigned char *)&self->_delegateRespondsTo & 2) != 0)
  {
    id WeakRetained = objc_loadWeakRetained(&self->_forwardingDelegate);
    [WeakRetained connection:v7 didReceiveAuthenticationChallenge:v8];
  }
  else
  {
    id WeakRetained = [v8 sender];
    [WeakRetained continueWithoutCredentialForAuthenticationChallenge:v8];
  }
}

uint64_t __73__CertUIConnectionDelegate_connection_didReceiveAuthenticationChallenge___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _continueConnectionWithResponse:a2 challenge:*(void *)(a1 + 40) service:*(void *)(a1 + 48)];
}

- (id)forwardingDelegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_forwardingDelegate);

  return WeakRetained;
}

- (NSString)connectionDisplayName
{
  return self->_connectionDisplayName;
}

- (void)setConnectionDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionDisplayName, 0);
  objc_destroyWeak(&self->_forwardingDelegate);

  objc_storeStrong((id *)&self->_trustManager, 0);
}

@end