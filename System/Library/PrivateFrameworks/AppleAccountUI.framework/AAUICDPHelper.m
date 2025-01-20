@interface AAUICDPHelper
+ (AAUICDPHelper)helperWithPresenter:(id)a3;
+ (BOOL)isEDPEligible;
+ (BOOL)isWalrusEnabled;
+ (id)cdpContextForPrimaryAccount;
+ (id)cdpContextForPrimaryAccountWithAuthenticationResults:(id)a3;
+ (void)isWalrusEnabled;
- (BOOL)forceInline;
- (UIViewController)presentingViewController;
- (id)cdpStateControllerForPrimaryAccount;
- (id)cdpStateControllerWithContext:(id)a3;
- (void)setForceInline:(BOOL)a3;
@end

@implementation AAUICDPHelper

+ (AAUICDPHelper)helperWithPresenter:(id)a3
{
  id v3 = a3;
  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeWeak(v4 + 1, v3);

  return (AAUICDPHelper *)v4;
}

+ (id)cdpContextForPrimaryAccount
{
  return (id)[MEMORY[0x263F34350] contextForPrimaryAccount];
}

+ (id)cdpContextForPrimaryAccountWithAuthenticationResults:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x263F34350]) initWithAuthenticationResults:v4];
  }
  else
  {
    v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "No authentication results pased in, fetching CDPContext for primary account.", v9, 2u);
    }

    uint64_t v5 = [a1 cdpContextForPrimaryAccount];
  }
  v7 = (void *)v5;

  return v7;
}

- (id)cdpStateControllerForPrimaryAccount
{
  id v3 = [(id)objc_opt_class() cdpContextForPrimaryAccount];
  id v4 = [(AAUICDPHelper *)self cdpStateControllerWithContext:v3];

  return v4;
}

- (id)cdpStateControllerWithContext:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F343F0];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithContext:v5];

  id v7 = objc_alloc(MEMORY[0x263F34A10]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  v9 = (void *)[v7 initWithPresentingViewController:WeakRetained];

  objc_msgSend(v9, "setForceInlinePresentation:", -[AAUICDPHelper forceInline](self, "forceInline"));
  [v6 setUiProvider:v9];

  return v6;
}

+ (BOOL)isWalrusEnabled
{
  id v3 = objc_alloc_init(MEMORY[0x263F34408]);
  id v9 = 0;
  uint64_t v4 = [v3 walrusStatus:&v9];
  id v5 = v9;
  if (v5)
  {
    v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[AAUICDPHelper isWalrusEnabled];
    }

    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = v4 == 1;
  }

  return v7;
}

+ (BOOL)isEDPEligible
{
  v2 = [a1 cdpContextForPrimaryAccount];
  BOOL v3 = [v2 edpState] == 2;

  return v3;
}

- (BOOL)forceInline
{
  return self->_forceInline;
}

- (void)setForceInline:(BOOL)a3
{
  self->_forceInline = a3;
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (void).cxx_destruct
{
}

+ (void)isWalrusEnabled
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = NSStringFromClass(a1);
  int v6 = 138412546;
  BOOL v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_209754000, a3, OS_LOG_TYPE_ERROR, "%@: Error while fetching walrus status: %@", (uint8_t *)&v6, 0x16u);
}

@end