@interface DMCEnrollmentAuthenticationViewController
- (BOOL)isDisplayingPasswordCell;
- (BOOL)isUsernameEditable;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (DMCEnrollmentAuthenticationViewController)init;
- (DMCEnrollmentAuthenticationViewControllerDelegate)delegate;
- (DMCEnrollmentConfirmationView)confirmationView;
- (DMCEnrollmentLinkLabelView)bottomLinkView;
- (DMCEnrollmentTableViewTextFieldCell)passwordCell;
- (DMCEnrollmentTableViewTextFieldCell)usernameCell;
- (NSString)bottomViewText;
- (NSString)cancelButtonTitle;
- (NSString)username;
- (unint64_t)style;
- (unint64_t)userInputSection;
- (void)_setupNavigationBar;
- (void)continueButtonTapped;
- (void)leftBarButtonTapped:(id)a3;
- (void)setBottomLinkView:(id)a3;
- (void)setBottomText:(id)a3;
- (void)setBottomViewText:(id)a3;
- (void)setCancelButtonTitle:(id)a3;
- (void)setConfirmationView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInProgress:(BOOL)a3;
- (void)setIsDisplayingPasswordCell:(BOOL)a3;
- (void)setPasswordCell:(id)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setUserInputSection:(unint64_t)a3;
- (void)setUsername:(id)a3;
- (void)setUsernameCell:(id)a3;
- (void)setUsernameEditable:(BOOL)a3;
- (void)showPasswordField:(BOOL)a3;
- (void)textFieldDidChange:(id)a3;
- (void)updateContinueButtonStatus;
- (void)viewControllerHasBeenDismissed;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DMCEnrollmentAuthenticationViewController

- (DMCEnrollmentAuthenticationViewController)init
{
  v16[1] = *MEMORY[0x263EF8340];
  v3 = DMCLocalizedString();
  v15.receiver = self;
  v15.super_class = (Class)DMCEnrollmentAuthenticationViewController;
  v4 = [(DMCEnrollmentTemplateTableViewController *)&v15 initWithIconNames:&unk_26D44AFD8 title:v3 subTitle:0];

  if (v4)
  {
    v5 = [[DMCEnrollmentTableViewTextFieldCell alloc] initWithType:0];
    usernameCell = v4->_usernameCell;
    v4->_usernameCell = v5;

    v7 = [(DMCEnrollmentTableViewTextFieldCell *)v4->_usernameCell textField];
    [v7 setDelegate:v4];

    v8 = [(DMCEnrollmentTableViewTextFieldCell *)v4->_usernameCell textField];
    [v8 addTarget:v4 action:sel_textFieldDidChange_ forControlEvents:0x20000];

    v16[0] = v4->_usernameCell;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    v4->_userInputSection = [(DMCEnrollmentTemplateTableViewController *)v4 addSectionWithCellData:v9 animated:0];

    v10 = [[DMCEnrollmentTableViewTextFieldCell alloc] initWithType:1];
    passwordCell = v4->_passwordCell;
    v4->_passwordCell = v10;

    v12 = [(DMCEnrollmentTableViewTextFieldCell *)v4->_passwordCell textField];
    [v12 setDelegate:v4];

    v13 = [(DMCEnrollmentTableViewTextFieldCell *)v4->_passwordCell textField];
    [v13 addTarget:v4 action:sel_textFieldDidChange_ forControlEvents:0x20000];

    v4->_usernameEditable = 1;
  }
  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v23.receiver = self;
  v23.super_class = (Class)DMCEnrollmentAuthenticationViewController;
  [(DMCEnrollmentTemplateTableViewController *)&v23 viewWillAppear:a3];
  if (([(DMCEnrollmentAuthenticationViewController *)self isBeingPresented] & 1) != 0
    || [(DMCEnrollmentAuthenticationViewController *)self isMovingToParentViewController])
  {
    [(DMCEnrollmentAuthenticationViewController *)self _setupNavigationBar];
    v4 = [(DMCEnrollmentTemplateTableViewController *)self bottomView];

    if (!v4)
    {
      v5 = [(DMCEnrollmentAuthenticationViewController *)self bottomViewText];
      uint64_t v6 = [v5 length];

      if (v6)
      {
        v7 = [DMCEnrollmentLinkLabelView alloc];
        v8 = [(DMCEnrollmentAuthenticationViewController *)self bottomViewText];
        v9 = [(DMCEnrollmentLinkLabelView *)v7 initWithIcon:0 message:v8 linkMessage:0 linkHandler:0];
      }
      else
      {
        objc_initWeak(&location, self);
        v10 = [DMCEnrollmentLinkLabelView alloc];
        v11 = DMCLocalizedString();
        v12 = DMCLocalizedString();
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __60__DMCEnrollmentAuthenticationViewController_viewWillAppear___block_invoke;
        v20[3] = &unk_2645E9398;
        objc_copyWeak(&v21, &location);
        v9 = [(DMCEnrollmentLinkLabelView *)v10 initWithIcon:0 message:v11 linkMessage:v12 linkHandler:v20];

        objc_destroyWeak(&v21);
        objc_destroyWeak(&location);
      }
      [(DMCEnrollmentTemplateTableViewController *)self addBottomView:v9];
      [(DMCEnrollmentAuthenticationViewController *)self setBottomLinkView:v9];
    }
    v13 = [(DMCEnrollmentAuthenticationViewController *)self confirmationView];

    if (!v13)
    {
      objc_initWeak(&location, self);
      v14 = [DMCEnrollmentConfirmationView alloc];
      objc_super v15 = DMCLocalizedString();
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __60__DMCEnrollmentAuthenticationViewController_viewWillAppear___block_invoke_3;
      v18[3] = &unk_2645E9398;
      objc_copyWeak(&v19, &location);
      v16 = [(DMCEnrollmentConfirmationView *)v14 initWithConfirmationText:v15 cancelText:0 confirmationAction:v18 cancelAction:0];
      confirmationView = self->_confirmationView;
      self->_confirmationView = v16;

      [(DMCEnrollmentTemplateTableViewController *)self addFloatyBottomView:self->_confirmationView];
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    [(DMCEnrollmentAuthenticationViewController *)self updateContinueButtonStatus];
  }
}

void __60__DMCEnrollmentAuthenticationViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__DMCEnrollmentAuthenticationViewController_viewWillAppear___block_invoke_2;
    block[3] = &unk_2645E90A0;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __60__DMCEnrollmentAuthenticationViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  return +[DMCEnrollmentAboutRemoteManagementViewController presentAboutRemoteManagementViewControllerWithBaseViewController:*(void *)(a1 + 32)];
}

void __60__DMCEnrollmentAuthenticationViewController_viewWillAppear___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained continueButtonTapped];
}

- (void)viewControllerHasBeenDismissed
{
  id v3 = [(DMCEnrollmentAuthenticationViewController *)self delegate];
  [v3 authenticationViewControllerDidCancel:self];
}

- (void)_setupNavigationBar
{
  [(DMCEnrollmentTemplateTableViewController *)self updateNavBarButtonType:1 forButtonPosition:0 enabled:1];
  id v3 = [(DMCEnrollmentAuthenticationViewController *)self cancelButtonTitle];

  if (v3)
  {
    cancelButtonTitle = self->_cancelButtonTitle;
    id v6 = [(DMCEnrollmentAuthenticationViewController *)self navigationItem];
    v5 = [v6 leftBarButtonItem];
    [v5 setTitle:cancelButtonTitle];
  }
}

- (void)updateContinueButtonStatus
{
  if ([(DMCEnrollmentTemplateTableViewController *)self inProgress])
  {
    id v14 = [(DMCEnrollmentAuthenticationViewController *)self confirmationView];
    [v14 setInProgress:1];
  }
  else
  {
    id v3 = [(DMCEnrollmentAuthenticationViewController *)self usernameCell];
    v4 = [v3 textField];
    v5 = [v4 text];
    id v6 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    id v14 = [v5 stringByTrimmingCharactersInSet:v6];

    LODWORD(v3) = [(DMCEnrollmentAuthenticationViewController *)self isDisplayingPasswordCell];
    uint64_t v7 = [v14 length];
    if (v3)
    {
      if (v7)
      {
        v8 = [(DMCEnrollmentAuthenticationViewController *)self passwordCell];
        v9 = [v8 textField];
        v10 = [v9 text];
        BOOL v11 = [v10 length] != 0;
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = v7 != 0;
    }
    v12 = [(DMCEnrollmentAuthenticationViewController *)self confirmationView];
    [v12 setInProgress:0];

    v13 = [(DMCEnrollmentAuthenticationViewController *)self confirmationView];
    [v13 setConfirmationButtonEnabled:v11];
  }
}

- (void)setUsername:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_username, a3);
  id v6 = [(DMCEnrollmentAuthenticationViewController *)self usernameCell];
  uint64_t v7 = [v6 textField];
  [v7 setText:v5];

  if (![v5 length])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__DMCEnrollmentAuthenticationViewController_setUsername___block_invoke;
    block[3] = &unk_2645E90A0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __57__DMCEnrollmentAuthenticationViewController_setUsername___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showPasswordField:0];
}

- (void)setCancelButtonTitle:(id)a3
{
  id v9 = a3;
  if (!-[NSString isEqualToString:](self->_cancelButtonTitle, "isEqualToString:"))
  {
    v4 = (NSString *)[v9 copy];
    cancelButtonTitle = self->_cancelButtonTitle;
    self->_cancelButtonTitle = v4;

    id v6 = self->_cancelButtonTitle;
    uint64_t v7 = [(DMCEnrollmentAuthenticationViewController *)self navigationItem];
    v8 = [v7 leftBarButtonItem];
    [v8 setTitle:v6];
  }
}

- (void)setBottomText:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_bottomViewText, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    bottomViewText = self->_bottomViewText;
    self->_bottomViewText = v4;
  }
}

- (void)setInProgress:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DMCEnrollmentAuthenticationViewController;
  -[DMCEnrollmentTemplateTableViewController setInProgress:](&v7, sel_setInProgress_);
  BOOL v5 = !v3;
  [(DMCEnrollmentTemplateTableViewController *)self updateNavBarButtonType:1 forButtonPosition:0 enabled:v5];
  id v6 = [(DMCEnrollmentAuthenticationViewController *)self bottomLinkView];
  [v6 setEnabled:v5];
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    if (a3 == 1)
    {
      [(DMCEnrollmentTemplateTableViewController *)self setIconNames:&unk_26D44B008];
      BOOL v5 = DMCLocalizedString();
      [(DMCEnrollmentTemplateTableViewController *)self setTitleText:v5];

      id v6 = [(DMCEnrollmentAuthenticationViewController *)self usernameCell];
      objc_super v7 = [v6 textField];
      v8 = [v7 text];
      id v9 = DMCLocalizedFormat();
      -[DMCEnrollmentTemplateTableViewController setSubtitleText:](self, "setSubtitleText:", v9, v8);

      v10 = [(DMCEnrollmentTemplateTableViewController *)self bottomView];
      [v10 setAlpha:0.0];

      [(DMCEnrollmentAuthenticationViewController *)self setModalInPresentation:1];
    }
    else if (!a3)
    {
      [(DMCEnrollmentTemplateTableViewController *)self setIconNames:&unk_26D44AFF0];
      v4 = DMCLocalizedString();
      [(DMCEnrollmentTemplateTableViewController *)self setTitleText:v4];

      [(DMCEnrollmentTemplateTableViewController *)self setSubtitleText:0];
      id v11 = [(DMCEnrollmentTemplateTableViewController *)self bottomView];
      [v11 setAlpha:1.0];
    }
  }
}

- (void)setUsernameEditable:(BOOL)a3
{
  if (self->_usernameEditable != a3)
  {
    self->_usernameEditable = a3;
    if (a3) {
      [MEMORY[0x263F1C550] labelColor];
    }
    else {
    id v6 = [MEMORY[0x263F1C550] placeholderTextColor];
    }
    v4 = [(DMCEnrollmentAuthenticationViewController *)self usernameCell];
    BOOL v5 = [v4 textField];
    [v5 setTextColor:v6];
  }
}

- (void)showPasswordField:(BOOL)a3
{
  BOOL v3 = a3;
  v11[1] = *MEMORY[0x263EF8340];
  if ([(DMCEnrollmentAuthenticationViewController *)self isDisplayingPasswordCell] != a3)
  {
    if (v3)
    {
      [(DMCEnrollmentAuthenticationViewController *)self setIsDisplayingPasswordCell:1];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __63__DMCEnrollmentAuthenticationViewController_showPasswordField___block_invoke;
      v10[3] = &unk_2645E90A0;
      v10[4] = self;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __63__DMCEnrollmentAuthenticationViewController_showPasswordField___block_invoke_2;
      v9[3] = &unk_2645E93C0;
      v9[4] = self;
      [MEMORY[0x263F1CB60] animateWithDuration:v10 animations:v9 completion:0.2];
    }
    else
    {
      [(DMCEnrollmentAuthenticationViewController *)self setIsDisplayingPasswordCell:0];
      BOOL v5 = [(DMCEnrollmentAuthenticationViewController *)self passwordCell];
      v11[0] = v5;
      id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
      [(DMCEnrollmentTemplateTableViewController *)self removeCellData:v6 fromSection:[(DMCEnrollmentAuthenticationViewController *)self userInputSection] animated:1];

      objc_super v7 = [(DMCEnrollmentAuthenticationViewController *)self passwordCell];
      v8 = [v7 textField];
      [v8 setText:0];
    }
    [(DMCEnrollmentAuthenticationViewController *)self updateContinueButtonStatus];
  }
}

void __63__DMCEnrollmentAuthenticationViewController_showPasswordField___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  BOOL v3 = [v2 passwordCell];
  v5[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  objc_msgSend(v2, "addCellData:toSection:animated:", v4, objc_msgSend(*(id *)(a1 + 32), "userInputSection"), 1);
}

void __63__DMCEnrollmentAuthenticationViewController_showPasswordField___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) passwordCell];
  v1 = [v2 textField];
  [v1 becomeFirstResponder];
}

- (void)leftBarButtonTapped:(id)a3
{
  id v4 = [(DMCEnrollmentAuthenticationViewController *)self delegate];
  [v4 authenticationViewControllerDidCancel:self];
}

- (void)continueButtonTapped
{
  if ([(DMCEnrollmentAuthenticationViewController *)self isDisplayingPasswordCell])
  {
    BOOL v3 = [(DMCEnrollmentAuthenticationViewController *)self passwordCell];
    id v4 = [v3 textField];
    [v4 resignFirstResponder];

    id v13 = [(DMCEnrollmentAuthenticationViewController *)self delegate];
    BOOL v5 = [(DMCEnrollmentAuthenticationViewController *)self passwordCell];
    id v6 = [v5 textField];
    objc_super v7 = [v6 text];
    v8 = [(DMCEnrollmentAuthenticationViewController *)self usernameCell];
    id v9 = [v8 textField];
    v10 = [v9 text];
    [v13 authenticationViewController:self didReceivePassword:v7 forUsername:v10];
  }
  else
  {
    id v11 = [(DMCEnrollmentAuthenticationViewController *)self usernameCell];
    v12 = [v11 textField];
    [v12 resignFirstResponder];

    id v13 = [(DMCEnrollmentAuthenticationViewController *)self delegate];
    BOOL v5 = [(DMCEnrollmentAuthenticationViewController *)self usernameCell];
    id v6 = [v5 textField];
    objc_super v7 = [v6 text];
    v8 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    id v9 = [v7 stringByTrimmingCharactersInSet:v8];
    [v13 authenticationViewController:self didReceiveUsername:v9];
  }
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DMCEnrollmentAuthenticationViewController *)self usernameCell];
  id v6 = [v5 textField];
  int v7 = [v4 isEqual:v6];

  if (!v7) {
    return 1;
  }
  return [(DMCEnrollmentAuthenticationViewController *)self isUsernameEditable];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 text];
  id v6 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  int v7 = [v5 stringByTrimmingCharactersInSet:v6];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    if ([(DMCEnrollmentAuthenticationViewController *)self isDisplayingPasswordCell]
      && ([(DMCEnrollmentAuthenticationViewController *)self usernameCell],
          id v9 = objc_claimAutoreleasedReturnValue(),
          [v9 textField],
          v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v4 isEqual:v10],
          v10,
          v9,
          v11))
    {
      v12 = [(DMCEnrollmentAuthenticationViewController *)self passwordCell];
      id v13 = [v12 textField];
      [v13 becomeFirstResponder];
    }
    else
    {
      [(DMCEnrollmentAuthenticationViewController *)self continueButtonTapped];
    }
  }

  return v8 != 0;
}

- (void)textFieldDidChange:(id)a3
{
  id v12 = a3;
  id v4 = [(DMCEnrollmentAuthenticationViewController *)self usernameCell];
  BOOL v5 = [v4 textField];
  int v6 = [v12 isEqual:v5];

  if (v6)
  {
    int v7 = [v12 text];
    if ([(DMCEnrollmentAuthenticationViewController *)self isUsernameEditable]
      || ([(DMCEnrollmentAuthenticationViewController *)self username],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [v7 isEqualToString:v8],
          v8,
          (v9 & 1) != 0))
    {
      v10 = v7;
      username = self->_username;
      self->_username = v10;
    }
    else
    {
      username = [(DMCEnrollmentAuthenticationViewController *)self username];
      [v12 setText:username];
    }
  }
  [(DMCEnrollmentAuthenticationViewController *)self updateContinueButtonStatus];
}

- (DMCEnrollmentAuthenticationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DMCEnrollmentAuthenticationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isUsernameEditable
{
  return self->_usernameEditable;
}

- (unint64_t)style
{
  return self->_style;
}

- (DMCEnrollmentTableViewTextFieldCell)usernameCell
{
  return self->_usernameCell;
}

- (void)setUsernameCell:(id)a3
{
}

- (DMCEnrollmentTableViewTextFieldCell)passwordCell
{
  return self->_passwordCell;
}

- (void)setPasswordCell:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (unint64_t)userInputSection
{
  return self->_userInputSection;
}

- (void)setUserInputSection:(unint64_t)a3
{
  self->_userInputSection = a3;
}

- (BOOL)isDisplayingPasswordCell
{
  return self->_isDisplayingPasswordCell;
}

- (void)setIsDisplayingPasswordCell:(BOOL)a3
{
  self->_isDisplayingPasswordCell = a3;
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (NSString)bottomViewText
{
  return self->_bottomViewText;
}

- (void)setBottomViewText:(id)a3
{
}

- (DMCEnrollmentConfirmationView)confirmationView
{
  return self->_confirmationView;
}

- (void)setConfirmationView:(id)a3
{
}

- (DMCEnrollmentLinkLabelView)bottomLinkView
{
  return self->_bottomLinkView;
}

- (void)setBottomLinkView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomLinkView, 0);
  objc_storeStrong((id *)&self->_confirmationView, 0);
  objc_storeStrong((id *)&self->_bottomViewText, 0);
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_passwordCell, 0);
  objc_storeStrong((id *)&self->_usernameCell, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end