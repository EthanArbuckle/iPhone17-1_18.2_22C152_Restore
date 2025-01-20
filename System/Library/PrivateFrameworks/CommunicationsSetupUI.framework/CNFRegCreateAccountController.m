@interface CNFRegCreateAccountController
- (CNFRegCreateAccountControllerDelegate)delegate;
- (id)bagKey;
- (id)logName;
- (void)cancelTapped;
- (void)completeHandoffWithStatus:(int)a3 appleID:(id)a4 authID:(id)a5 authToken:(id)a6;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation CNFRegCreateAccountController

- (void)dealloc
{
  self->_delegate = 0;
  v2.receiver = self;
  v2.super_class = (Class)CNFRegCreateAccountController;
  [(CNFRegAccountWebViewController *)&v2 dealloc];
}

- (id)bagKey
{
  objc_super v2 = [(CNFRegServerWebViewController *)self regController];
  uint64_t v3 = [v2 serviceType];

  if (v3 == 1) {
    return @"md-profile-setup-page";
  }
  else {
    return @"vc-profile-setup-page";
  }
}

- (id)logName
{
  return @"CreateAccount";
}

- (void)cancelTapped
{
  id v3 = [(CNFRegCreateAccountController *)self delegate];
  [v3 createAccountControllerDidFinish:self withAppleId:0 authID:0 authToken:0];
}

- (void)completeHandoffWithStatus:(int)a3 appleID:(id)a4 authID:(id)a5 authToken:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(CNFRegCreateAccountController *)self delegate];
  [v12 createAccountControllerDidFinish:self withAppleId:v11 authID:v10 authToken:v9];
}

- (CNFRegCreateAccountControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CNFRegCreateAccountControllerDelegate *)a3;
}

@end