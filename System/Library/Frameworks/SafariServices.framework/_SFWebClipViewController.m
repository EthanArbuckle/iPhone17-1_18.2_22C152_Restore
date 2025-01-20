@interface _SFWebClipViewController
- (BOOL)_canAddWebClip;
- (BOOL)_shouldUseTranslucentAppearance;
- (BOOL)_showDemoModeFeatureDisabledAlert;
- (BOOL)bookmarkTextEntryTableViewControllerShouldUseTranslucentAppearance:(id)a3;
- (BOOL)canEditAndSave;
- (BOOL)createAndAddToHomeScreenBundle;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CGPoint)_centerForIconView;
- (UIEdgeInsets)_cellInset;
- (UIWebClip)webClip;
- (_SFWebClipViewController)initWithStyle:(int64_t)a3;
- (_SFWebClipViewControllerDelegate)delegate;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_add;
- (void)_cancel;
- (void)_textFieldChanged:(id)a3;
- (void)bookmarkTextEntryTableViewController:(id)a3 dismissedWithText:(id)a4;
- (void)createAndAddToHomeScreenBundle;
- (void)dealloc;
- (void)loadView;
- (void)setCanEditAndSave:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setWebClip:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateUIAnimated:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation _SFWebClipViewController

- (_SFWebClipViewController)initWithStyle:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)_SFWebClipViewController;
  v3 = [(_SFWebClipViewController *)&v14 initWithStyle:1];
  if (v3)
  {
    v4 = _WBSLocalizedString();
    [(_SFWebClipViewController *)v3 setTitle:v4];

    id v5 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v6 = _WBSLocalizedString();
    v7 = (void *)[v5 initWithTitle:v6 style:2 target:v3 action:sel__add];

    v8 = [(_SFWebClipViewController *)v3 navigationItem];
    [v8 setRightBarButtonItem:v7];

    [v7 setEnabled:0];
    id v9 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v10 = objc_msgSend(v9, "initWithBarButtonSystemItem:target:action:", objc_msgSend(MEMORY[0x1E4FB14A8], "_sf_popoverCancelButtonItem"), v3, sel__cancel);
    v11 = [(_SFWebClipViewController *)v3 navigationItem];
    [v11 setLeftBarButtonItem:v10];

    v3->_canEditAndSave = 0;
    v12 = v3;
  }
  return v3;
}

- (void)loadView
{
  v16.receiver = self;
  v16.super_class = (Class)_SFWebClipViewController;
  [(_SFWebClipViewController *)&v16 loadView];
  v3 = [[_SFBookmarkTextEntryTableViewCell alloc] initWithText:0 autocapitalizationType:2 autocorrectionType:0];
  titleCell = self->_titleCell;
  self->_titleCell = &v3->super;

  [(UITableViewCell *)self->_titleCell setSelectionStyle:0];
  id v5 = [(UITableViewCell *)self->_titleCell editableTextField];
  [v5 setEnabled:self->_canEditAndSave];

  v6 = (UITableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:0];
  addressCell = self->_addressCell;
  self->_addressCell = v6;

  [(UITableViewCell *)self->_addressCell setSelectionStyle:0];
  v8 = [(UITableViewCell *)self->_addressCell textLabel];
  [v8 setEnabled:0];

  id v9 = [(UITableViewCell *)self->_titleCell editableTextField];
  [v9 setDelegate:self];
  v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 addObserver:self selector:sel__textFieldChanged_ name:*MEMORY[0x1E4FB3018] object:v9];

  v11 = [(_SFWebClipViewController *)self tableView];
  v12 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 60.0, 60.0);
  iconImageView = self->_iconImageView;
  self->_iconImageView = v12;

  objc_super v14 = [(UIImageView *)self->_iconImageView layer];
  [v14 setZPosition:1.0];

  [v11 addSubview:self->_iconImageView];
  if ([(_SFWebClipViewController *)self _shouldUseTranslucentAppearance])
  {
    v15 = [MEMORY[0x1E4FB1618] clearColor];
    [v11 setBackgroundColor:v15];
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)_SFWebClipViewController;
  [(_SFWebClipViewController *)&v3 viewDidLoad];
  [(_SFWebClipViewController *)self updateUIAnimated:0];
}

- (void)updateUIAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_SFWebClipViewController *)self isViewLoaded])
  {
    id v5 = [(UIWebClip *)self->_webClip title];
    v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v7 = [v5 stringByTrimmingCharactersInSet:v6];

    v8 = [(UITableViewCell *)self->_titleCell editableTextField];
    [v8 setText:v7];

    id v9 = [(UIWebClip *)self->_webClip pageURL];
    v10 = objc_msgSend(v9, "safari_userVisibleString");
    v11 = [(UITableViewCell *)self->_addressCell textLabel];
    [v11 setText:v10];

    v12 = [(_SFWebClipViewController *)self tableView];
    v13 = [v12 footerViewForSection:0];

    objc_super v14 = [v13 defaultContentConfiguration];
    v15 = [(_SFWebClipViewController *)self tableView];
    objc_super v16 = [(_SFWebClipViewController *)self tableView:v15 titleForFooterInSection:0];
    [v14 setText:v16];

    [v13 setContentConfiguration:v14];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __45___SFWebClipViewController_updateUIAnimated___block_invoke;
    v21[3] = &unk_1E5C724D8;
    v21[4] = self;
    uint64_t v17 = MEMORY[0x1AD0C36A0](v21);
    v18 = (void *)v17;
    if (v3)
    {
      v19 = (void *)MEMORY[0x1E4FB1EB0];
      v20 = [(_SFWebClipViewController *)self view];
      [v19 transitionWithView:v20 duration:5242880 options:v18 animations:0 completion:0.349999994];
    }
    else
    {
      (*(void (**)(uint64_t))(v17 + 16))(v17);
    }
  }
}

- (void)setCanEditAndSave:(BOOL)a3
{
  if (self->_canEditAndSave != a3)
  {
    self->_canEditAndSave = a3;
    v4 = [(UITableViewCell *)self->_titleCell editableTextField];
    [v4 setEnabled:self->_canEditAndSave];

    id v6 = [(_SFWebClipViewController *)self navigationItem];
    id v5 = [v6 rightBarButtonItem];
    objc_msgSend(v5, "setEnabled:", -[_SFWebClipViewController _canAddWebClip](self, "_canAddWebClip"));
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_SFWebClipViewController;
  [(_SFWebClipViewController *)&v9 viewWillAppear:a3];
  [(_SFWebClipViewController *)self updateUIAnimated:0];
  self->_suspendAfterDismiss = 0;
  v4 = [(_SFWebClipViewController *)self tableView];
  [v4 reloadData];

  id v5 = [(_SFWebClipViewController *)self tableView];
  id v6 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
  id v7 = (id)[v5 cellForRowAtIndexPath:v6];

  if (([(_SFWebClipViewController *)self _isInPopoverPresentation] & 1) == 0)
  {
    v8 = [(UITableViewCell *)self->_titleCell editableTextField];
    [v8 becomeFirstResponder];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UITableViewCell *)self->_titleCell editableTextField];
  [v5 resignFirstResponder];

  v6.receiver = self;
  v6.super_class = (Class)_SFWebClipViewController;
  [(_SFWebClipViewController *)&v6 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_SFWebClipViewController *)self navigationController];
  objc_super v6 = [v5 topViewController];

  if (v6 == self)
  {
    if (self->_suspendAfterDismiss)
    {
      self->_suspendAfterDismiss = 0;
      [(id)*MEMORY[0x1E4FB2608] suspend];
    }
    v8.receiver = self;
    v8.super_class = (Class)_SFWebClipViewController;
    [(_SFWebClipViewController *)&v8 viewDidDisappear:v3];
    if (!self->_delegateNotifiedOfResult)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained webClipViewController:self didFinishWithResult:0];
    }
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "row", a3);
  objc_super v6 = &OBJC_IVAR____SFWebClipViewController__addressCell;
  if (!v5) {
    objc_super v6 = &OBJC_IVAR____SFWebClipViewController__titleCell;
  }
  id v7 = *(Class *)((char *)&self->super.super.super.super.isa + *v6);

  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v5 = a3;
  webClip = self->_webClip;
  if (webClip && [(UIWebClip *)webClip fullScreen]) {
    +[_SFFeatureAvailability isYttriumEligible];
  }
  id v7 = _WBSLocalizedString();

  return v7;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = v7;
  if (self->_canEditAndSave && ![v7 row]) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = [_SFBookmarkTextEntryTableViewController alloc];
  id v6 = [(UITableViewCell *)self->_titleCell editableTextField];
  id v7 = [v6 text];
  id v9 = [(_SFBookmarkTextEntryTableViewController *)v5 initWithBookmarkInfoViewField:0 text:v7 autocapitalizationType:2 autocorrectionType:0 delegate:self];

  objc_super v8 = [(_SFWebClipViewController *)self navigationController];
  [v8 pushViewController:v9 animated:1];
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  return 80.5;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  v4 = [(_SFWebClipViewController *)self tableView];
  [v4 safeAreaInsets];
  double v6 = v5;

  double result = *MEMORY[0x1E4FB2F28];
  if (v6 <= 0.0) {
    return 80.5;
  }
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (UIEdgeInsets)_cellInset
{
  v2 = [(_SFWebClipViewController *)self view];
  objc_msgSend(v2, "_sf_safeAreaInsetsFlippedForLayoutDirectionality");
  double v4 = v3 + 90.0;

  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = v4;
  result.right = v7;
  result.bottom = v6;
  result.left = v8;
  result.top = v5;
  return result;
}

- (CGPoint)_centerForIconView
{
  double v3 = [(_SFWebClipViewController *)self tableView];
  [v3 rectForSection:0];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;
  [v3 rectForHeaderInSection:0];
  double v13 = v12;
  [v3 rectForFooterInSection:0];
  double v15 = v14;
  objc_super v16 = [(_SFWebClipViewController *)self view];
  objc_msgSend(v16, "_sf_usesLeftToRightLayout");

  [v3 safeAreaInsets];
  v24.size.height = v11 + v13 - v15;
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  CGRectGetMidY(v24);
  _SFRoundPointToPixels();
  double v18 = v17;
  double v20 = v19;

  double v21 = v18;
  double v22 = v20;
  result.y = v22;
  result.x = v21;
  return result;
}

- (void)viewDidLayoutSubviews
{
  iconImageView = self->_iconImageView;
  [(_SFWebClipViewController *)self _centerForIconView];
  -[UIImageView setCenter:](iconImageView, "setCenter:");
  id v5 = [(_SFWebClipViewController *)self tableView];
  double v4 = [(_SFWebClipViewController *)self view];
  [v4 bounds];
  objc_msgSend(v5, "sizeThatFits:", CGRectGetWidth(v7), 1.79769313e308);
  [(_SFWebClipViewController *)self setPreferredContentSize:0.0];
}

- (void)viewWillLayoutSubviews
{
  double v3 = [(UITableViewCell *)self->_titleCell editableTextField];
  [v3 setUserInteractionEnabled:1];

  [(UITableViewCell *)self->_titleCell setAccessoryType:0];
  [(UITableViewCell *)self->_titleCell setSelectionStyle:0];
  [(_SFWebClipViewController *)self _cellInset];
  -[UITableViewCell setSeparatorInset:](self->_titleCell, "setSeparatorInset:");
  [(_SFWebClipViewController *)self _cellInset];
  addressCell = self->_addressCell;

  -[UITableViewCell setSeparatorInset:](addressCell, "setSeparatorInset:");
}

- (void)_cancel
{
  [(UIWebClip *)self->_webClip cancelMediaUpdate];
  self->_delegateNotifiedOfResult = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained webClipViewController:self didFinishWithResult:0];
}

- (void)_add
{
  if (![(_SFWebClipViewController *)self _showDemoModeFeatureDisabledAlert])
  {
    double v3 = [(UITableViewCell *)self->_titleCell editableTextField];
    [v3 resignFirstResponder];

    if ([MEMORY[0x1E4F98AF8] hasInternalContent])
    {
      if (!+[_SFFeatureAvailability isHSWADisabled])
      {
        double v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        int v5 = [v4 BOOLForKey:@"SFWebClipsAlwaysFullScreen"];

        if (v5) {
          [(UIWebClip *)self->_webClip setFullScreen:1];
        }
      }
    }
    BOOL v6 = [(_SFWebClipViewController *)self createAndAddToHomeScreenBundle];
    if (v6)
    {
      self->_suspendAfterDismiss = 1;
    }
    else
    {
      CGRect v7 = (void *)MEMORY[0x1E4FB1418];
      double v8 = _WBSLocalizedString();
      CGFloat v9 = _WBSLocalizedString();
      double v10 = [v7 alertControllerWithTitle:v8 message:v9 preferredStyle:1];

      double v11 = (void *)MEMORY[0x1E4FB1410];
      double v12 = _WBSLocalizedString();
      double v13 = [v11 actionWithTitle:v12 style:0 handler:0];

      [v10 addAction:v13];
      [(_SFWebClipViewController *)self presentViewController:v10 animated:1 completion:0];
    }
    [(UIWebClip *)self->_webClip cancelMediaUpdate];
    self->_delegateNotifiedOfResult = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained webClipViewController:self didFinishWithResult:v6];
  }
}

- (BOOL)_showDemoModeFeatureDisabledAlert
{
  int v3 = [MEMORY[0x1E4FB1438] isRunningInStoreDemoMode];
  if (v3 && !self->_showingDemoModeAlert)
  {
    self->_showingDemoModeAlert = 1;
    double v4 = (void *)MEMORY[0x1E4FB1418];
    int v5 = _WBSLocalizedString();
    BOOL v6 = [v4 alertControllerWithTitle:v5 message:0 preferredStyle:1];

    CGRect v7 = (void *)MEMORY[0x1E4FB1410];
    double v8 = _WBSLocalizedString();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61___SFWebClipViewController__showDemoModeFeatureDisabledAlert__block_invoke;
    v11[3] = &unk_1E5C72898;
    v11[4] = self;
    CGFloat v9 = [v7 actionWithTitle:v8 style:1 handler:v11];
    [v6 addAction:v9];

    [(_SFWebClipViewController *)self presentViewController:v6 animated:1 completion:0];
  }
  return v3;
}

- (BOOL)createAndAddToHomeScreenBundle
{
  int v3 = [(UIWebClip *)self->_webClip pageURL];
  double v4 = [v3 absoluteString];

  if (![v4 length]
    || ([(UIWebClip *)self->_webClip title],
        int v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 length],
        v5,
        !v6))
  {
    objc_super v16 = WBS_LOG_CHANNEL_PREFIXWebApp();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[_SFWebClipViewController createAndAddToHomeScreenBundle](v16);
    }
    goto LABEL_9;
  }
  if (![(UIWebClip *)self->_webClip createOnDisk])
  {
LABEL_9:
    BOOL v15 = 0;
    goto LABEL_10;
  }
  CGRect v7 = (void *)*MEMORY[0x1E4FB2608];
  double v8 = [(UIWebClip *)self->_webClip identifier];
  [v7 addWebClipToHomeScreen:v8];

  CGFloat v9 = [(UIWebClip *)self->_webClip _sf_applicationManifest];

  if (v9)
  {
    double v10 = (void *)MEMORY[0x1E4F28DB0];
    double v11 = [(UIWebClip *)self->_webClip _sf_applicationManifest];
    double v12 = [v10 archivedDataWithRootObject:v11 requiringSecureCoding:0 error:0];

    double v13 = [(UIWebClip *)self->_webClip _sf_applicationManifestPath];
    [v12 writeToURL:v13 atomically:1];
  }
  double v14 = [MEMORY[0x1E4F98948] sharedLogger];
  [v14 didAddWebClip];

  BOOL v15 = 1;
LABEL_10:

  return v15;
}

- (BOOL)_canAddWebClip
{
  if (!self->_canEditAndSave) {
    return 0;
  }
  v2 = [(UIWebClip *)self->_webClip title];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  BOOL v4 = [(_SFWebClipViewController *)self _canAddWebClip];
  if (v4) {
    [(_SFWebClipViewController *)self _add];
  }
  return v4;
}

- (void)_textFieldChanged:(id)a3
{
  webClip = self->_webClip;
  int v5 = [(UITableViewCell *)self->_titleCell editableTextField];
  uint64_t v6 = [v5 text];
  CGRect v7 = objc_msgSend(v6, "_web_stringByTrimmingWhitespace");
  [(UIWebClip *)webClip setTitle:v7];

  BOOL v8 = [(_SFWebClipViewController *)self _canAddWebClip];
  id v10 = [(_SFWebClipViewController *)self navigationItem];
  CGFloat v9 = [v10 rightBarButtonItem];
  [v9 setEnabled:v8];
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  BOOL v4 = [(UITableViewCell *)self->_titleCell editableTextField];
  [v4 setDelegate:0];

  v5.receiver = self;
  v5.super_class = (Class)_SFWebClipViewController;
  [(_SFWebClipViewController *)&v5 dealloc];
}

- (BOOL)_shouldUseTranslucentAppearance
{
  if ([(_SFWebClipViewController *)self safari_isPresentedByActivityViewController])return 0; {

  }
  return [(_SFWebClipViewController *)self _isInPopoverPresentation];
}

- (void)bookmarkTextEntryTableViewController:(id)a3 dismissedWithText:(id)a4
{
  id v5 = a4;
  if ([v5 length]) {
    [(UIWebClip *)self->_webClip setTitle:v5];
  }
}

- (BOOL)bookmarkTextEntryTableViewControllerShouldUseTranslucentAppearance:(id)a3
{
  return 0;
}

- (UIWebClip)webClip
{
  return (UIWebClip *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setWebClip:(id)a3
{
}

- (_SFWebClipViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFWebClipViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)canEditAndSave
{
  return self->_canEditAndSave;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webClip, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_addressCell, 0);
  objc_storeStrong((id *)&self->_titleCell, 0);

  objc_storeStrong((id *)&self->_webView, 0);
}

- (void)createAndAddToHomeScreenBundle
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Can't create Web Clip: no URL or title", v1, 2u);
}

@end