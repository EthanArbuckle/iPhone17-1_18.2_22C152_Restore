@interface AAUIEDPStateValidator
- (AAUIEDPStateValidator)initWithPresentingViewController:(id)a3;
- (void)repairPrimaryAppleAccountEDPStateWithCompletion:(id)a3;
@end

@implementation AAUIEDPStateValidator

- (AAUIEDPStateValidator)initWithPresentingViewController:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AAUIEDPStateValidator;
  v6 = [(AAUIEDPStateValidator *)&v12 init];
  if (v6)
  {
    uint64_t v7 = +[AAUICDPHelper cdpContextForPrimaryAccount];
    cdpContext = v6->_cdpContext;
    v6->_cdpContext = (CDPContext *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F343F0]) initWithContext:v6->_cdpContext];
    stateController = v6->_stateController;
    v6->_stateController = (CDPStateController *)v9;

    objc_storeStrong((id *)&v6->_presentingViewController, a3);
  }

  return v6;
}

- (void)repairPrimaryAppleAccountEDPStateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Attempting EDP state repair.", buf, 2u);
  }

  id v6 = objc_alloc(MEMORY[0x263F34A10]);
  uint64_t v7 = [(UIViewController *)self->_presentingViewController parentViewController];
  v8 = (void *)[v6 initWithPresentingViewController:v7];

  [(CDPStateController *)self->_stateController setUiProvider:v8];
  stateController = self->_stateController;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __73__AAUIEDPStateValidator_repairPrimaryAppleAccountEDPStateWithCompletion___block_invoke;
  v11[3] = &unk_263F92B30;
  id v12 = v4;
  id v10 = v4;
  [(CDPStateController *)stateController repairEDPStateWithCompletion:v11];
}

uint64_t __73__AAUIEDPStateValidator_repairPrimaryAppleAccountEDPStateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_cdpContext, 0);
}

@end