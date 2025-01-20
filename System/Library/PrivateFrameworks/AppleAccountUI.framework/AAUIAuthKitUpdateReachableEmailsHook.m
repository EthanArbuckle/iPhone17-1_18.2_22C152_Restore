@interface AAUIAuthKitUpdateReachableEmailsHook
- (AAUIAuthKitUpdateReachableEmailsHook)initWithAltDSID:(id)a3;
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (void)_updateAccountWithReachableEmails:(id)a3 completion:(id)a4;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation AAUIAuthKitUpdateReachableEmailsHook

- (AAUIAuthKitUpdateReachableEmailsHook)initWithAltDSID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUIAuthKitUpdateReachableEmailsHook;
  v6 = [(AAUIAuthKitUpdateReachableEmailsHook *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_altDSID, a3);
  }

  return v7;
}

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"emails:update"];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char v4 = [v3 clientInfo];

  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F63818]];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  char v7 = [v6 isEqualToString:@"emails:update"];
  return v7;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = a4;
  objc_opt_class();
  v10 = [v9 objectForKeyedSubscript:@"reachableEmails"];

  id v11 = v10;
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  [(AAUIAuthKitUpdateReachableEmailsHook *)self _updateAccountWithReachableEmails:v12 completion:v8];
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  id v8 = [v7 clientInfo];

  id v9 = [v8 objectForKeyedSubscript:@"reachableEmails"];
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  [(AAUIAuthKitUpdateReachableEmailsHook *)self _updateAccountWithReachableEmails:v10 completion:v6];
}

- (void)_updateAccountWithReachableEmails:(id)a3 completion:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x263F29278];
  id v7 = a4;
  id v8 = a3;
  id v10 = objc_alloc_init(v6);
  [v10 setReachableEmails:v8];

  id v9 = objc_alloc_init(MEMORY[0x263F29118]);
  [v9 updateUserInformationForAltDSID:self->_altDSID userInformation:v10 completion:v7];
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end