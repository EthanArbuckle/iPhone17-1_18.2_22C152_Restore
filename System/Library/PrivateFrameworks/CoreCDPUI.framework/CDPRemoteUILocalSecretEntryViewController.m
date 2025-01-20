@interface CDPRemoteUILocalSecretEntryViewController
- (CDPRemoteUILocalSecretEntryViewController)init;
- (CGSize)preferredContentSize;
- (id)pinInstructionsPrompt;
- (id)title;
- (void)_startAnimating;
- (void)didAcceptEnteredPIN:(id)a3;
- (void)didCancelEnteringPIN;
- (void)pinInstructionsPrompt;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CDPRemoteUILocalSecretEntryViewController

- (CDPRemoteUILocalSecretEntryViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)CDPRemoteUILocalSecretEntryViewController;
  v2 = [(CDPPassphraseEntryViewController *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(DevicePINController *)v2 setPinDelegate:v2];
    v4 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26C9EBCA0 target:0 set:0 get:0 detail:0 cell:13 edit:0];
    [v4 setEditPaneClass:objc_opt_class()];
    [v4 setProperty:v3 forKey:*MEMORY[0x263F60318]];
    [(DevicePINController *)v3 setSpecifier:v4];
    v5 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if (v6 == 1)
    {
      [(DevicePINController *)v3 setNumericPIN:0];
      [(CDPRemoteUILocalSecretEntryViewController *)v3 setModalPresentationStyle:2];
    }
  }
  return v3;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)CDPRemoteUILocalSecretEntryViewController;
  [(PSDetailController *)&v12 viewDidLoad];
  v3 = [(CDPRemoteUILocalSecretEntryViewController *)self extensionContext];
  v4 = [v3 inputItems];
  v5 = [v4 firstObject];

  uint64_t v6 = [v5 userInfo];
  v7 = [v6 objectForKeyedSubscript:@"forceInlineMode"];
  self->_finished = [v7 BOOLValue];

  objc_super v8 = [v5 userInfo];
  v9 = [v8 objectForKeyedSubscript:@"title"];
  v10 = [v9 stringValue];
  titleText = self->_titleText;
  self->_titleText = v10;
}

- (id)title
{
  return 0;
}

- (id)pinInstructionsPrompt
{
  p_titleText = (uint64_t *)&self->_titleText;
  if (self->_titleText)
  {
    v4 = _CDPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      [(CDPRemoteUILocalSecretEntryViewController *)(uint64_t)self pinInstructionsPrompt];
    }

    id v5 = (id)*p_titleText;
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263F343B8] builderForKey:@"LOCAL_SECRET_ENTRY_REASON"];
    v7 = [v6 addSecretType:1];
    objc_super v8 = [MEMORY[0x263F343A8] sharedInstance];
    v9 = [v8 deviceClass];
    v10 = [v7 addDeviceClass:v9];
    id v5 = [v10 localizedString];
  }

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CDPRemoteUILocalSecretEntryViewController;
  [(DevicePINController *)&v9 viewWillAppear:a3];
  v4 = [(CDPRemoteUILocalSecretEntryViewController *)self navigationController];
  id v5 = [v4 viewControllers];
  uint64_t v6 = [v5 firstObject];

  if (v6 == self)
  {
    v7 = [(CDPRemoteUILocalSecretEntryViewController *)self navigationController];
    objc_super v8 = [v7 navigationBar];
    [v8 _setBackgroundOpacity:0.0];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CDPRemoteUILocalSecretEntryViewController;
  [(DevicePINController *)&v6 viewWillDisappear:a3];
  if (!*(&self->_finished + 1))
  {
    *(&self->_finished + 1) = 1;
    v4 = [(CDPRemoteUILocalSecretEntryViewController *)self extensionContext];
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3072 userInfo:0];
    [v4 cancelRequestWithError:v5];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CDPRemoteUILocalSecretEntryViewController;
  [(DevicePINController *)&v5 viewDidDisappear:a3];
  if (!self->_finished)
  {
    if ([(NSString *)self->_titleText length])
    {
      v4 = [MEMORY[0x263F5FBF8] sharedSpinnerManager];
      [v4 stopAnimatingForIdentifier:@"localSecretValidator"];
    }
  }
}

- (void)_startAnimating
{
  v3 = [MEMORY[0x263F5FBF8] sharedSpinnerManager];
  v4 = [(CDPRemoteUILocalSecretEntryViewController *)self navigationItem];
  [v3 startAnimatingInNavItem:v4 forIdentifier:@"localSecretValidator" hideBackButton:1];

  uint64_t v5 = (int)*MEMORY[0x263F5FD58];
  [*(id *)((char *)&self->super.super.super.super.super.super.super.isa + v5) resignFirstResponder];
  objc_super v6 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v5);

  [v6 setUserInteractionEnabled:0];
}

- (void)didAcceptEnteredPIN:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  *(&self->_finished + 1) = 1;
  int v12 = 0;
  uint64_t v5 = [MEMORY[0x263F53C50] sharedConnection];
  [v5 unlockScreenTypeWithOutSimplePasscodeType:&v12];

  if (v12 == -1) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 2;
  }
  if (self->_finished) {
    goto LABEL_8;
  }
  if ([(NSString *)self->_titleText length]) {
    [(CDPRemoteUILocalSecretEntryViewController *)self _startAnimating];
  }
  if (self->_finished) {
LABEL_8:
  }
    [(CDPRemoteUILocalSecretEntryViewController *)self _startAnimating];
  if (v4)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F08810]);
    v14[0] = @"localSecret";
    v14[1] = @"secretType";
    v15[0] = v4;
    objc_super v8 = [NSNumber numberWithUnsignedInteger:v6];
    v15[1] = v8;
    objc_super v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    [v7 setUserInfo:v9];

    v10 = [(CDPRemoteUILocalSecretEntryViewController *)self extensionContext];
    id v13 = v7;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
    [v10 completeRequestReturningItems:v11 completionHandler:&__block_literal_global_5];
  }
  else
  {
    id v7 = [(CDPRemoteUILocalSecretEntryViewController *)self extensionContext];
    v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3072 userInfo:0];
    [v7 cancelRequestWithError:v10];
  }
}

- (void)didCancelEnteringPIN
{
  *(&self->_finished + 1) = 1;
  id v3 = [(CDPRemoteUILocalSecretEntryViewController *)self extensionContext];
  v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3072 userInfo:0];
  [v3 cancelRequestWithError:v2];
}

- (CGSize)preferredContentSize
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
}

- (void)pinInstructionsPrompt
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = *a2;
  int v8 = 138412546;
  objc_super v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  _os_log_debug_impl(&dword_2187CF000, a3, OS_LOG_TYPE_DEBUG, "%@: title: %@", (uint8_t *)&v8, 0x16u);
}

@end