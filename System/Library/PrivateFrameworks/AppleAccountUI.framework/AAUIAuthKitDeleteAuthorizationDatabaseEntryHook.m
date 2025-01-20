@interface AAUIAuthKitDeleteAuthorizationDatabaseEntryHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (void)_revokeAuthorizationForClientID:(id)a3 completion:(id)a4;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation AAUIAuthKitDeleteAuthorizationDatabaseEntryHook

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"database:revoke"];

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

  char v7 = [v6 isEqualToString:@"database:revoke"];
  return v7;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = [a4 objectForKeyedSubscript:@"clientID"];
  [(AAUIAuthKitDeleteAuthorizationDatabaseEntryHook *)self _revokeAuthorizationForClientID:v9 completion:v8];
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v8 = [a3 clientInfo];
  char v7 = [v8 objectForKeyedSubscript:@"clientID"];
  [(AAUIAuthKitDeleteAuthorizationDatabaseEntryHook *)self _revokeAuthorizationForClientID:v7 completion:v6];
}

- (void)_revokeAuthorizationForClientID:(id)a3 completion:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x263F29118];
  id v6 = (void (**)(id, uint64_t, id))a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  id v11 = 0;
  uint64_t v9 = [v8 revokeAuthorizationForApplicationWithClientID:v7 error:&v11];

  id v10 = v11;
  v6[2](v6, v9, v10);
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
}

@end