@interface CNFRegAccountAuthorizationController
- (CNFRegAccountAuthorizationController)initWithRegController:(id)a3 authID:(id)a4 token:(id)a5;
- (CNFRegAccountAuthorizationDelegate)delegate;
- (NSString)authID;
- (NSString)authToken;
- (id)bagKey;
- (id)logName;
- (void)cancelTapped;
- (void)completeHandoffWithStatus:(int)a3 appleID:(id)a4 authID:(id)a5 authToken:(id)a6;
- (void)dealloc;
- (void)setAuthID:(id)a3;
- (void)setAuthToken:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CNFRegAccountAuthorizationController

- (CNFRegAccountAuthorizationController)initWithRegController:(id)a3 authID:(id)a4 token:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CNFRegAccountAuthorizationController;
  v10 = [(CNFRegAccountWebViewController *)&v13 initWithRegController:a3];
  v11 = v10;
  if (v10)
  {
    [(CNFRegAccountAuthorizationController *)v10 setAuthID:v8];
    [(CNFRegAccountAuthorizationController *)v11 setAuthToken:v9];
  }

  return v11;
}

- (void)dealloc
{
  self->_delegate = 0;
  v2.receiver = self;
  v2.super_class = (Class)CNFRegAccountAuthorizationController;
  [(CNFRegAccountWebViewController *)&v2 dealloc];
}

- (id)bagKey
{
  objc_super v2 = [(CNFRegServerWebViewController *)self regController];
  uint64_t v3 = [v2 serviceType];

  if (v3 == 1) {
    return @"md-profile-authorize";
  }
  else {
    return @"vc-profile-authorize";
  }
}

- (id)logName
{
  return @"AccountAuthorize";
}

- (void)cancelTapped
{
  id v3 = [(CNFRegAccountAuthorizationController *)self delegate];
  [v3 authorizationController:self authorizedAccount:0];
}

- (void)completeHandoffWithStatus:(int)a3 appleID:(id)a4 authID:(id)a5 authToken:(id)a6
{
  BOOL v7 = a3 == 0;
  id v8 = [(CNFRegAccountAuthorizationController *)self delegate];
  [v8 authorizationController:self authorizedAccount:v7];
}

- (NSString)authID
{
  return self->_authID;
}

- (void)setAuthID:(id)a3
{
}

- (NSString)authToken
{
  return self->_authToken;
}

- (void)setAuthToken:(id)a3
{
}

- (CNFRegAccountAuthorizationDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CNFRegAccountAuthorizationDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_authID, 0);
}

@end