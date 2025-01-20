@interface FALaunchServicesHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (void)_launchWithURLString:(id)a3 completion:(id)a4;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation FALaunchServicesHook

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"remoteAction:launchApp"];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  v3 = [a3 clientInfo];
  char v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F25C10]];
  char v5 = [v4 isEqualToString:@"remoteAction:launchApp"];

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = [a4 objectForKeyedSubscript:@"remoteLaunchUrl"];
  [(FALaunchServicesHook *)self _launchWithURLString:v9 completion:v8];
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v8 = [a3 clientInfo];
  v7 = [v8 objectForKeyedSubscript:@"remoteLaunchUrl"];
  [(FALaunchServicesHook *)self _launchWithURLString:v7 completion:v6];
}

- (void)_launchWithURLString:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  v7 = _FALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_2189F0000, v7, OS_LOG_TYPE_DEFAULT, "Recieved URL to launch: %@", (uint8_t *)&v10, 0xCu);
  }

  id v8 = [NSURL URLWithString:v5];
  id v9 = [MEMORY[0x263F01880] defaultWorkspace];
  [v9 openSensitiveURL:v8 withOptions:0];

  v6[2](v6, 1, 0);
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