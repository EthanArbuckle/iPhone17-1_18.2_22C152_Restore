@interface AAUIRemoteUIController
- (AAUIRemoteUIController)init;
- (AAUIRemoteUIController)initWithIdentifier:(id)a3;
- (AAUIRemoteUIController)initWithIdentifier:(id)a3 account:(id)a4;
- (NSHTTPURLResponse)redirectResponse;
- (NSString)identifier;
- (NSURLRequest)currentRequest;
- (id)description;
- (id)loader:(id)a3 connection:(id)a4 willSendRequest:(id)a5 redirectResponse:(id)a6;
- (id)loader:(id)a3 willLoadRequest:(id)a4 redirectResponse:(id)a5;
- (void)_loader:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)addAccountUserInfoWithAccount:(id)a3;
- (void)loader:(id)a3 didFinishLoadWithError:(id)a4;
- (void)loader:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)loader:(id)a3 didReceiveHTTPResponse:(id)a4;
- (void)loader:(id)a3 willLoadRequest:(id)a4 redirectResponse:(id)a5 completionHandler:(id)a6;
- (void)registerAppleAccountAvatarPickerView;
- (void)registerSIWASharingTipView;
- (void)setIdentifier:(id)a3;
- (void)setRedirectResponse:(id)a3;
@end

@implementation AAUIRemoteUIController

- (AAUIRemoteUIController)init
{
  +[RemoteUICustomComponentFactory registerRemoteUISwiftViews];
  return [(AAUIRemoteUIController *)self initWithIdentifier:0];
}

- (AAUIRemoteUIController)initWithIdentifier:(id)a3
{
  return [(AAUIRemoteUIController *)self initWithIdentifier:a3 account:0];
}

- (AAUIRemoteUIController)initWithIdentifier:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AAUIRemoteUIController;
  v8 = [(AAUIRemoteUIController *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
    v12 = (void *)[objc_alloc(MEMORY[0x263F29120]) initWithIdentifier:v6];
    objc_msgSend(v11, "set_appleIDContext:", v12);

    [(AAUIRemoteUIController *)v8 setSessionConfiguration:v11];
    [(AAUIRemoteUIController *)v8 registerAppleAccountAvatarPickerView];
    if (v7) {
      [(AAUIRemoteUIController *)v8 addAccountUserInfoWithAccount:v7];
    }
    +[RemoteUICustomComponentFactory registerRemoteUISwiftViews];
  }
  return v8;
}

- (void)registerAppleAccountAvatarPickerView
{
  v2.receiver = self;
  v2.super_class = (Class)AAUIRemoteUIController;
  [(RemoteUIController *)&v2 registerAppleAccountAvatarPickerView];
}

- (void)registerSIWASharingTipView
{
  v2.receiver = self;
  v2.super_class = (Class)AAUIRemoteUIController;
  [(RemoteUIController *)&v2 registerSIWASharingTipView];
}

- (void)addAccountUserInfoWithAccount:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AAUIRemoteUIController;
  [(RemoteUIController *)&v3 addAccountUserInfoWithAccount:a3];
}

- (id)loader:(id)a3 connection:(id)a4 willSendRequest:(id)a5 redirectResponse:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(AAUIRemoteUIController *)self setRedirectResponse:v13];
  }
  v16.receiver = self;
  v16.super_class = (Class)AAUIRemoteUIController;
  objc_super v14 = [(AAUIRemoteUIController *)&v16 loader:v10 connection:v11 willSendRequest:v12 redirectResponse:v13];

  return v14;
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p { identifier: %@ }>", v5, self, self->_identifier];

  return v6;
}

- (void)loader:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  id v11 = [v9 protectionSpace];
  id v12 = [v11 authenticationMethod];
  char v13 = [v12 isEqualToString:*MEMORY[0x263F08560]];

  if ((v13 & 1) == 0) {
    goto LABEL_6;
  }
  objc_super v14 = (void *)MEMORY[0x263F257B0];
  v15 = [v9 protectionSpace];
  objc_super v16 = [v15 host];
  LOBYTE(v14) = [v14 isSetupServiceHost:v16];

  if ((v14 & 1) == 0)
  {
LABEL_6:
    [(AAUIRemoteUIController *)self _loader:v8 didReceiveChallenge:v9 completionHandler:v10];
    goto LABEL_7;
  }
  v17 = [v9 protectionSpace];
  uint64_t v18 = [v17 serverTrust];

  if (!v18)
  {
    v20 = _AAUILogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[AAUIRemoteUIController loader:didReceiveChallenge:completionHandler:](v20);
    }
    goto LABEL_12;
  }
  if (([MEMORY[0x263F257B0] isValidCertificateTrust:v18] & 1) == 0)
  {
    v20 = _AAUILogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[AAUIRemoteUIController loader:didReceiveChallenge:completionHandler:](v20);
    }
LABEL_12:

    v10[2](v10, 2, 0);
    goto LABEL_7;
  }
  v19 = [MEMORY[0x263F08BB8] credentialForTrust:v18];
  ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v19);

LABEL_7:
}

- (void)_loader:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  if (objc_msgSend((id)-[AAUIRemoteUIController superclass](self, "superclass"), "instancesRespondToSelector:", sel_loader_didReceiveChallenge_completionHandler_))
  {
    v11.receiver = self;
    v11.super_class = (Class)AAUIRemoteUIController;
    [(AAUIRemoteUIController *)&v11 loader:v8 didReceiveChallenge:v9 completionHandler:v10];
  }
  else
  {
    v10[2](v10, 1, 0);
  }
}

- (void)loader:(id)a3 willLoadRequest:(id)a4 redirectResponse:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_storeStrong((id *)&self->_currentRequest, a4);
  char v13 = (void (**)(id, id, void))a6;
  if (objc_msgSend((id)-[AAUIRemoteUIController superclass](self, "superclass"), "instancesRespondToSelector:", sel_loader_willLoadRequest_redirectResponse_completionHandler_))
  {
    v14.receiver = self;
    v14.super_class = (Class)AAUIRemoteUIController;
    [(AAUIRemoteUIController *)&v14 loader:v10 willLoadRequest:v11 redirectResponse:v12 completionHandler:v13];
  }
  else
  {
    v13[2](v13, v11, 0);
  }
}

- (id)loader:(id)a3 willLoadRequest:(id)a4 redirectResponse:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_storeStrong((id *)&self->_currentRequest, a4);
  if (objc_msgSend((id)-[AAUIRemoteUIController superclass](self, "superclass"), "instancesRespondToSelector:", sel_loader_willLoadRequest_redirectResponse_))
  {
    v14.receiver = self;
    v14.super_class = (Class)AAUIRemoteUIController;
    id v11 = [(AAUIRemoteUIController *)&v14 loader:v8 willLoadRequest:v9 redirectResponse:v10];
  }
  else
  {
    id v11 = v9;
  }
  id v12 = v11;

  return v12;
}

- (void)loader:(id)a3 didReceiveHTTPResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend((id)-[AAUIRemoteUIController superclass](self, "superclass"), "instancesRespondToSelector:", sel_loader_didReceiveHTTPResponse_))
  {
    v9.receiver = self;
    v9.super_class = (Class)AAUIRemoteUIController;
    [(AAUIRemoteUIController *)&v9 loader:v6 didReceiveHTTPResponse:v7];
  }
  currentRequest = self->_currentRequest;
  self->_currentRequest = 0;
}

- (void)loader:(id)a3 didFinishLoadWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend((id)-[AAUIRemoteUIController superclass](self, "superclass"), "instancesRespondToSelector:", sel_loader_didFinishLoadWithError_))
  {
    v9.receiver = self;
    v9.super_class = (Class)AAUIRemoteUIController;
    [(AAUIRemoteUIController *)&v9 loader:v6 didFinishLoadWithError:v7];
  }
  currentRequest = self->_currentRequest;
  self->_currentRequest = 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSURLRequest)currentRequest
{
  return self->_currentRequest;
}

- (NSHTTPURLResponse)redirectResponse
{
  return self->_redirectResponse;
}

- (void)setRedirectResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redirectResponse, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)loader:(os_log_t)log didReceiveChallenge:completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209754000, log, OS_LOG_TYPE_ERROR, "No certificate to validate, bailing!", v1, 2u);
}

- (void)loader:(os_log_t)log didReceiveChallenge:completionHandler:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209754000, log, OS_LOG_TYPE_ERROR, "Failed to validate certificate, bailing!", v1, 2u);
}

@end