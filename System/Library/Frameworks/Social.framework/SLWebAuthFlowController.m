@interface SLWebAuthFlowController
- (BOOL)shouldHideWebViewForLoadWithRequest:(id)a3;
- (SLWebAuthFlowController)initWithWebClient:(id)a3;
- (SLWebClient)webClient;
- (id)authURLForUsername:(id)a3;
- (id)initialRedirectURL;
- (id)requestForAuthURL:(id)a3;
- (void)setAuthFlowCompletion:(id)a3;
- (void)webViewDidFinishLoadWithPageTitleSupplier:(id)a3;
@end

@implementation SLWebAuthFlowController

- (SLWebAuthFlowController)initWithWebClient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SLWebAuthFlowController;
  v6 = [(SLWebAuthFlowController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_webClient, a3);
  }

  return v7;
}

- (id)initialRedirectURL
{
  return @"https://gil.apple.com/";
}

- (void)setAuthFlowCompletion:(id)a3
{
  self->_completion = (id)MEMORY[0x1C876A6A0](a3, a2);

  MEMORY[0x1F41817F8]();
}

- (id)authURLForUsername:(id)a3
{
  id v4 = a3;
  id v5 = [(SLWebAuthFlowController *)self webClient];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(SLWebClient *)self->_webClient defaultScope];
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)[(SLWebClient *)self->_webClient webAuthRequestClass];
  objc_super v9 = [(SLWebClient *)self->_webClient clientID];
  v10 = [(SLWebClient *)self->_webClient clientRedirect];
  v11 = [(SLWebClient *)self->_webClient authRequestURL];
  v12 = [v8 urlForClientID:v9 redirectURI:v10 scope:v7 username:v4 authRequestURL:v11];

  return v12;
}

- (id)requestForAuthURL:(id)a3
{
  webClient = self->_webClient;
  id v4 = a3;
  id v5 = objc_msgSend((id)-[SLWebClient webAuthRequestClass](webClient, "webAuthRequestClass"), "requestForURL:", v4);

  char v6 = (void *)[v5 mutableCopy];

  return v6;
}

- (BOOL)shouldHideWebViewForLoadWithRequest:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)[(SLWebClient *)self->_webClient webAuthRequestClass];
  v8 = [v6 URL];
  LODWORD(v7) = [v7 urlPageWillContainAuthorizationCode:v8];

  if (v7)
  {
    _SLLog(v3, 7, @"SLWebAuthFlowController shouldHideWebViewForLoadWithRequest: waiting for authentication code in page load url");
    objc_storeStrong((id *)&self->_requestWithAuthorizationCode, a3);
    BOOL v9 = 1;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F29088];
    v11 = [v6 URL];
    v12 = [v10 componentsWithURL:v11 resolvingAgainstBaseURL:0];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = [v12 queryItems];
    uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    BOOL v9 = v13 != 0;
    if (v13)
    {
      uint64_t v14 = v13;
      BOOL v28 = v13 != 0;
      v29 = self;
      v30 = v12;
      id v31 = v6;
      v15 = 0;
      v16 = 0;
      uint64_t v17 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v20 = [v19 name];
          int v21 = [@"account" isEqualToString:v20];

          if (v21)
          {
            uint64_t v22 = [v19 value];

            v15 = (void *)v22;
          }
          v23 = [v19 name];
          int v24 = [@"email" isEqualToString:v23];

          if (v24)
          {
            uint64_t v25 = [v19 value];

            v16 = (void *)v25;
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v14);

      BOOL v9 = 0;
      if (v16)
      {
        v12 = v30;
        id v6 = v31;
        if (v15)
        {
          if ([v15 isEqualToString:@"yahoo_japan"])
          {
            uint64_t v26 = [[NSString alloc] initWithString:v16];
            obja = v29->_yahooJapanUserName;
            v29->_yahooJapanUserName = (NSString *)v26;
            BOOL v9 = v28;
          }
          else
          {
            BOOL v9 = 0;
          }
        }
      }
      else
      {
        v12 = v30;
        id v6 = v31;
      }
    }
    else
    {
      v16 = 0;
      v15 = 0;
    }
  }

  return v9;
}

- (void)webViewDidFinishLoadWithPageTitleSupplier:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_requestWithAuthorizationCode)
  {
    objc_msgSend((id)-[SLWebClient webAuthRequestClass](self->_webClient, "webAuthRequestClass"), "authCodeFromURLRequest:", self->_requestWithAuthorizationCode);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if ([v5 length])
    {
      id v6 = [[SLWebTokenHandlerController alloc] initWithWebClient:self->_webClient];
      v7 = [(SLWebClient *)self->_webClient clientRedirect];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __69__SLWebAuthFlowController_webViewDidFinishLoadWithPageTitleSupplier___block_invoke;
      v11[3] = &unk_1E6467DB8;
      id v5 = v5;
      id v12 = v5;
      uint64_t v13 = self;
      [(SLWebTokenHandlerController *)v6 exchangeAuthCode:v5 usingRedirect:v7 codeVerifier:0 forTokensAndUsernameWithCompletion:v11];

LABEL_8:
      goto LABEL_9;
    }
    v10 = (void (*)(void))*((void *)self->_completion + 2);
LABEL_7:
    v10();
    goto LABEL_8;
  }
  if (self->_yahooJapanUserName)
  {
    v8 = (void *)MEMORY[0x1E4F1C9E8];
    v14[0] = self->_yahooJapanUserName;
    BOOL v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    id v5 = [v8 dictionaryWithObject:v9 forKey:@"usernames"];

    v10 = (void (*)(void))*((void *)self->_completion + 2);
    goto LABEL_7;
  }
LABEL_9:
}

void __69__SLWebAuthFlowController_webViewDidFinishLoadWithPageTitleSupplier___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8)
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__SLWebAuthFlowController_webViewDidFinishLoadWithPageTitleSupplier___block_invoke_2;
  block[3] = &unk_1E6467D90;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  id v27 = *(id *)(a1 + 32);
  id v28 = v16;
  uint64_t v29 = *(void *)(a1 + 40);
  id v30 = v17;
  id v18 = v17;
  id v19 = v16;
  id v20 = v15;
  id v21 = v14;
  id v22 = v13;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __69__SLWebAuthFlowController_webViewDidFinishLoadWithPageTitleSupplier___block_invoke_2(uint64_t a1)
{
  v9[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && (v3 = *(void *)(a1 + 40)) != 0 && (uint64_t v4 = *(void *)(a1 + 48)) != 0)
  {
    v8[0] = @"authCode";
    v8[1] = @"token";
    v9[0] = *(void *)(a1 + 56);
    v9[1] = v2;
    v8[2] = @"refreshToken";
    v8[3] = @"usernames";
    v9[2] = v3;
    v9[3] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];
    if ([*(id *)(a1 + 64) length])
    {
      id v6 = (void *)[v5 mutableCopy];
      [v6 setObject:*(void *)(a1 + 64) forKey:@"displayName"];

      id v5 = v6;
    }
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 72) + 16) + 16))();
  }
  else
  {
    v7 = *(void (**)(void))(*(void *)(*(void *)(a1 + 72) + 16) + 16);
    v7();
  }
}

- (SLWebClient)webClient
{
  return (SLWebClient *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webClient, 0);
  objc_storeStrong((id *)&self->_yahooJapanUserName, 0);
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_requestWithAuthorizationCode, 0);
}

@end