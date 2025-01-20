@interface CNFRegViewAccountController
- (CNFRegViewAccountControllerDelegate)delegate;
- (id)bagKey;
- (id)logName;
- (void)cancelTapped;
- (void)completeHandoffWithStatus:(int)a3 appleID:(id)a4 authID:(id)a5 authToken:(id)a6;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation CNFRegViewAccountController

- (void)dealloc
{
  self->_delegate = 0;
  v2.receiver = self;
  v2.super_class = (Class)CNFRegViewAccountController;
  [(CNFRegAccountWebViewController *)&v2 dealloc];
}

- (id)logName
{
  return @"ViewAccount";
}

- (id)bagKey
{
  objc_super v2 = [(CNFRegServerWebViewController *)self regController];
  uint64_t v3 = [v2 serviceType];

  if (v3 == 1) {
    return @"md-profile-edit-page";
  }
  else {
    return @"vc-profile-edit-page";
  }
}

- (void)cancelTapped
{
  id v3 = [(CNFRegViewAccountController *)self delegate];
  [v3 viewAccountControllerDidFinish:self withAppleId:0];
}

- (void)completeHandoffWithStatus:(int)a3 appleID:(id)a4 authID:(id)a5 authToken:(id)a6
{
  id v7 = a4;
  id v8 = [(CNFRegViewAccountController *)self delegate];
  [v8 viewAccountControllerDidFinish:self withAppleId:v7];
}

- (CNFRegViewAccountControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CNFRegViewAccountControllerDelegate *)a3;
}

@end