@interface CSStatusTextViewController
- (BOOL)_isSecurityResearchDevice;
- (CSStatusTextViewController)init;
- (CSStatusTextViewControllerDelegate)delegate;
- (NSString)overrideFooterText;
- (id)_legalContact;
- (id)_legalString;
- (void)_profileStateChangedNotification:(id)a3;
- (void)_updateText;
- (void)_updateTextForDeviceInformation;
- (void)_updateTextForLegal;
- (void)_updateTextForProfiles;
- (void)_updateTextForProvisionalEnrollment;
- (void)_updateTextForSupervision;
- (void)_updateTribecaText;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setOverrideFooterText:(id)a3;
- (void)setTribecaText:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CSStatusTextViewController

- (CSStatusTextViewController)init
{
  v10.receiver = self;
  v10.super_class = (Class)CSStatusTextViewController;
  v2 = [(CSStatusTextViewController *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F74230] sharedConnection];
    profileConnection = v2->_profileConnection;
    v2->_profileConnection = (MCProfileConnection *)v3;

    uint64_t v5 = [MEMORY[0x1E4FA5FC0] sharedInstance];
    basebandLoggingManager = v2->_basebandLoggingManager;
    v2->_basebandLoggingManager = (SBFRemoteBasebandLoggingManager *)v5;

    [(SBFRemoteBasebandLoggingManager *)v2->_basebandLoggingManager addObserver:v2];
    v7 = (SBLockScreenDefaults *)objc_alloc_init(MEMORY[0x1E4FA60B0]);
    lockScreenDefaults = v2->_lockScreenDefaults;
    v2->_lockScreenDefaults = v7;

    v2->_activationLockNotifyToken = -1;
  }
  return v2;
}

- (void)dealloc
{
  [(SBFRemoteBasebandLoggingManager *)self->_basebandLoggingManager removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)CSStatusTextViewController;
  [(CSCoverSheetViewControllerBase *)&v3 dealloc];
}

- (void)setOverrideFooterText:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  p_overrideFooterText = &self->_overrideFooterText;
  if (self->_overrideFooterText != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_overrideFooterText, a3);
    p_overrideFooterText = (NSString **)[(CSStatusTextViewController *)self _updateText];
    uint64_t v5 = v7;
  }

  MEMORY[0x1F41817F8](p_overrideFooterText, v5);
}

- (void)setTribecaText:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  p_tribecaText = &self->_tribecaText;
  if (self->_tribecaText != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_tribecaText, a3);
    p_tribecaText = (NSString **)[(CSStatusTextViewController *)self _updateText];
    uint64_t v5 = v7;
  }

  MEMORY[0x1F41817F8](p_tribecaText, v5);
}

- (void)loadView
{
  objc_super v3 = [CSStatusTextView alloc];
  v4 = -[CSStatusTextView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  view = self->_view;
  self->_view = v4;

  [(CSStatusTextView *)self->_view bs_setHitTestingDisabled:1];
  v6 = self->_view;

  [(CSStatusTextViewController *)self setView:v6];
}

- (void)viewWillAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CSStatusTextViewController;
  [(CSCoverSheetViewControllerBase *)&v15 viewWillAppear:a3];
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__profileStateChangedNotification_ name:*MEMORY[0x1E4F741E8] object:0];
  [v4 addObserver:self selector:sel__profileStateChangedNotification_ name:*MEMORY[0x1E4F73EB8] object:0];
  uint64_t v5 = tribeca_supported_text();

  if (v5)
  {
    if (self->_activationLockNotifyToken < 0)
    {
      objc_initWeak(&location, self);
      v6 = (const char *)[(id)*MEMORY[0x1E4F61A50] UTF8String];
      v7 = MEMORY[0x1E4F14428];
      id v8 = MEMORY[0x1E4F14428];
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      v11 = __45__CSStatusTextViewController_viewWillAppear___block_invoke;
      v12 = &unk_1E6AD9908;
      objc_copyWeak(&v13, &location);
      notify_register_dispatch(v6, &self->_activationLockNotifyToken, v7, &v9);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    [(CSStatusTextViewController *)self _updateTribecaText];
  }
  [(CSStatusTextViewController *)self _updateText];
}

void __45__CSStatusTextViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateTribecaText];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  int activationLockNotifyToken = self->_activationLockNotifyToken;
  if ((activationLockNotifyToken & 0x80000000) == 0)
  {
    notify_cancel(activationLockNotifyToken);
    self->_int activationLockNotifyToken = -1;
  }
  v7.receiver = self;
  v7.super_class = (Class)CSStatusTextViewController;
  [(CSCoverSheetViewControllerBase *)&v7 viewDidDisappear:v3];
}

- (void)didMoveToParentViewController:(id)a3
{
  id v4 = a3;
  if (v4) {
    [(CSStatusTextViewController *)self _updateText];
  }
  v5.receiver = self;
  v5.super_class = (Class)CSStatusTextViewController;
  [(CSStatusTextViewController *)&v5 didMoveToParentViewController:v4];
}

- (void)_profileStateChangedNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__CSStatusTextViewController__profileStateChangedNotification___block_invoke;
  block[3] = &unk_1E6AD87F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __63__CSStatusTextViewController__profileStateChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTextForProfiles];
}

- (void)_updateTribecaText
{
  BOOL v3 = [MEMORY[0x1E4F61A48] sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__CSStatusTextViewController__updateTribecaText__block_invoke;
  v4[3] = &unk_1E6AD9930;
  v4[4] = self;
  [v3 fmipStateWithCompletion:v4];
}

void __48__CSStatusTextViewController__updateTribecaText__block_invoke(uint64_t a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    if (a2 >= 3)
    {
      tribeca_supported_text();
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = &stru_1F3020248;
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__CSStatusTextViewController__updateTribecaText__block_invoke_2;
    v8[3] = &unk_1E6AD88C0;
    v8[4] = *(void *)(a1 + 32);
    uint64_t v9 = v6;
    objc_super v7 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
}

uint64_t __48__CSStatusTextViewController__updateTribecaText__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTribecaText:*(void *)(a1 + 40)];
}

- (void)_updateText
{
  if ([(CSStatusTextViewController *)self isViewLoaded])
  {
    view = self->_view;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __41__CSStatusTextViewController__updateText__block_invoke;
    v5[3] = &unk_1E6AD87F8;
    v5[4] = self;
    [(CSStatusTextView *)view updateTextsWithBlock:v5];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained coverSheetStatusTextViewControllerContentDidChange:self];
  }
}

uint64_t __41__CSStatusTextViewController__updateText__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateTextForProfiles];
  v2 = *(void **)(a1 + 32);

  return [v2 _updateTextForLegal];
}

- (void)_updateTextForProfiles
{
  view = self->_view;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__CSStatusTextViewController__updateTextForProfiles__block_invoke;
  v3[3] = &unk_1E6AD87F8;
  v3[4] = self;
  [(CSStatusTextView *)view updateTextsWithBlock:v3];
}

uint64_t __52__CSStatusTextViewController__updateTextForProfiles__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateTextForDeviceInformation];
  [*(id *)(a1 + 32) _updateTextForSupervision];
  v2 = *(void **)(a1 + 32);

  return [v2 _updateTextForProvisionalEnrollment];
}

- (void)_updateTextForDeviceInformation
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (ct_green_tea_logging_enabled()) {
    [v5 addObject:@"Regulatory Logging Enabled"];
  }
  if ([(NSString *)self->_tribecaText length]) {
    [v5 addObject:self->_tribecaText];
  }
  if (-[SBFRemoteBasebandLoggingManager isLogCollectionEnabled](self->_basebandLoggingManager, "isLogCollectionEnabled"))[v5 addObject:*MEMORY[0x1E4FA6110]]; {
  if ([(NSString *)self->_overrideFooterText length])
  }
  {
    [v5 addObject:self->_overrideFooterText];
  }
  else
  {
    BOOL v3 = [(MCProfileConnection *)self->_profileConnection deviceLockScreenFootnote];
    id v4 = [(MCProfileConnection *)self->_profileConnection deviceAssetTag];
    if ([v3 length]) {
      [v5 addObject:v3];
    }
    if ([v4 length]) {
      [v5 addObject:v4];
    }
  }
  [(CSStatusTextView *)self->_view setDeviceInformationText:v5];
}

- (void)_updateTextForSupervision
{
  if ([(SBLockScreenDefaults *)self->_lockScreenDefaults showSupervisionText]
    && [(MCProfileConnection *)self->_profileConnection isSupervised])
  {
    BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v4 = [(MCProfileConnection *)self->_profileConnection cloudConfigurationDetails];
    id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F74270]];

    if ([v5 length])
    {
      v6 = NSString;
      objc_super v7 = [MEMORY[0x1E4F42948] modelSpecificLocalizedStringKeyForKey:@"LOCK_SCREEN_SUPERVISION_NOTICE_WITH_ORGNAME"];
      id v8 = [v3 localizedStringForKey:v7 value:&stru_1F3020248 table:@"CoverSheet"];
      objc_msgSend(v6, "stringWithFormat:", v8, v5);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v7 = [MEMORY[0x1E4F42948] modelSpecificLocalizedStringKeyForKey:@"LOCK_SCREEN_SUPERVISION_NOTICE"];
      id v10 = [v3 localizedStringForKey:v7 value:&stru_1F3020248 table:@"CoverSheet"];
    }

    id v9 = v10;
  }
  else
  {
    id v9 = 0;
  }
  id v11 = v9;
  [(CSStatusTextView *)self->_view setSupervisionText:v9];
}

- (void)_updateTextForProvisionalEnrollment
{
  view = self->_view;
  id v3 = [(MCProfileConnection *)self->_profileConnection deviceProvisionalEnrollmentFootnote];
  [(CSStatusTextView *)view setProvisionalEnrollmentText:v3];
}

- (void)_updateTextForLegal
{
  if ([(CSStatusTextViewController *)self _isSecurityResearchDevice]
    || os_variant_has_internal_content()
    && [(SBLockScreenDefaults *)self->_lockScreenDefaults showLegalText])
  {
    view = self->_view;
    id v5 = [(CSStatusTextViewController *)self _legalString];
    [(CSStatusTextView *)view setInternalLegalText:v5];
  }
  else
  {
    id v4 = self->_view;
    [(CSStatusTextView *)v4 setInternalLegalText:0];
  }
}

- (BOOL)_isSecurityResearchDevice
{
  return MGGetBoolAnswer();
}

- (id)_legalString
{
  if ([(CSStatusTextViewController *)self _isSecurityResearchDevice]) {
    id v3 = @"Security Research Device";
  }
  else {
    id v3 = @"Confidential & Proprietary";
  }
  id v4 = [(CSStatusTextViewController *)self _legalContact];
  id v5 = [NSString stringWithFormat:@"%@, %@ %@", v3, @"Call", v4];

  return v5;
}

- (id)_legalContact
{
  if (_legalContact_onceToken != -1) {
    dispatch_once(&_legalContact_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)_legalContact_sLegalContact;

  return v2;
}

void __43__CSStatusTextViewController__legalContact__block_invoke()
{
  v0 = @"+1 855-499-6467";
  uint64_t v1 = MGGetProductType();
  if (v1 <= 2032616840)
  {
    if (v1 > 1234705394)
    {
      if (v1 == 1234705395 || v1 == 1353145733) {
        goto LABEL_20;
      }
      uint64_t v2 = 2001966017;
    }
    else
    {
      if (v1 == -1 || v1 == 341800273) {
        goto LABEL_20;
      }
      uint64_t v2 = 910181310;
    }
  }
  else if (v1 <= 3196158496)
  {
    if (v1 == 2032616841 || v1 == 2236272848) {
      goto LABEL_20;
    }
    uint64_t v2 = 2458172802;
  }
  else if (v1 > 3743999267)
  {
    if (v1 == 3743999268) {
      goto LABEL_20;
    }
    uint64_t v2 = 3801472101;
  }
  else
  {
    if (v1 == 3196158497) {
      goto LABEL_20;
    }
    uint64_t v2 = 3636345305;
  }
  if (v1 != v2) {
    v0 = @"+1 877-595-1125";
  }
LABEL_20:
  id v3 = (void *)_legalContact_sLegalContact;
  _legalContact_sLegalContact = (uint64_t)v0;
}

- (NSString)overrideFooterText
{
  return self->_overrideFooterText;
}

- (CSStatusTextViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSStatusTextViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lockScreenDefaults, 0);
  objc_storeStrong((id *)&self->_basebandLoggingManager, 0);
  objc_storeStrong((id *)&self->_profileConnection, 0);
  objc_storeStrong((id *)&self->_tribecaText, 0);
  objc_storeStrong((id *)&self->_overrideFooterText, 0);

  objc_storeStrong((id *)&self->_view, 0);
}

@end