@interface _SFAutomaticPasswordInputViewController
+ (void)_inputViewControllerWithAutoFillContext:(id)a3 passwordRules:(id)a4 overrideApplicationIdentifier:(id)a5 completion:(id)a6;
+ (void)inputViewControllerWithAutoFillContext:(id)a3 passwordRules:(id)a4 completion:(id)a5;
- (BOOL)_inputViewControllerShouldDirectlyInsertPassword;
- (CGSize)_currentKeyboardSize;
- (CGSize)intrinsicContentSizeForInputView:(id)a3;
- (_SFAutoFillContextProviding)autoFillContextProvider;
- (_SFAutomaticPasswordInputViewController)initWithPassword:(id)a3 keyboardType:(int64_t)a4;
- (id)_editingStrongPasswordInformationViewControllerIfNeeded;
- (id)inputViewControllerOtherOptionsMenu:(id)a3;
- (id)placeholderImageForStrongPasswordIntroductionViewController:(id)a3;
- (id)strongPasswordIntroductionViewController:(id)a3 automaticStrongPasswordWithFormat:(unint64_t)a4;
- (id)strongPasswordIntroductionViewControllerIfNeeded;
- (void)_postButtonPressedNotificationForButton:(int64_t)a3;
- (void)_postContextProviderRequiredNotificationIfNeeded;
- (void)_updateKeyboardHeight;
- (void)_updateKeyboardMetricsAndInterfaceOrientationIfNeeded;
- (void)dismissKeyboardPreservingFirstResponderIfNecessary;
- (void)imageForStrongPasswordIntroductionViewController:(id)a3 completionHandler:(id)a4;
- (void)inputViewControllerDidSelectUseCustomPassword:(id)a3;
- (void)inputViewControllerDidSelectUseStrongPassword:(id)a3;
- (void)setAutoFillContextProvider:(id)a3;
- (void)strongPasswordIntroductionViewController:(id)a3 shouldFillPasswordWithFormat:(unint64_t)a4;
- (void)strongPasswordIntroductionViewController:(id)a3 shouldPerformAction:(unint64_t)a4 willShowAdditionalView:(BOOL)a5;
- (void)strongPasswordIntroductionViewControllerDidFinishIntroduction:(id)a3;
- (void)strongPasswordIntroductionViewControllerShowKeyboard:(id)a3;
- (void)strongPasswordIntroductionViewControllerShowOtherPasswords:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation _SFAutomaticPasswordInputViewController

+ (void)inputViewControllerWithAutoFillContext:(id)a3 passwordRules:(id)a4 completion:(id)a5
{
}

+ (void)_inputViewControllerWithAutoFillContext:(id)a3 passwordRules:(id)a4 overrideApplicationIdentifier:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, void))a6;
  if (v12)
  {
    if (v9)
    {
      if ([MEMORY[0x1E4F98AF8] isPasswordsAppInstalled])
      {
        v12[2](v12, 0);
        goto LABEL_12;
      }
      uint64_t v15 = [v9 objectForKeyedSubscript:@"_automaticPasswordKeyboard"];
      if (v15)
      {
        v16 = (void *)v15;
        v14 = [[_SFAutomaticPasswordInputViewController alloc] initWithPassword:0 keyboardType:0];

        if (v14)
        {
          v17 = [v9 objectForKeyedSubscript:@"strongPasswordAdditionalContext"];
          v18 = [v17 objectForKeyedSubscript:@"SFAutoFillContextProviderIdentifierUserInfoKey"];
          uint64_t v19 = [v18 copy];
          autoFillContextProtocolObjectUUID = v14->_autoFillContextProtocolObjectUUID;
          v14->_autoFillContextProtocolObjectUUID = (NSString *)v19;
        }
      }
      else
      {
        v14 = 0;
      }
      ((void (**)(id, _SFAutomaticPasswordInputViewController *))v12)[2](v12, v14);
    }
    else
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F98210]);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __138___SFAutomaticPasswordInputViewController__inputViewControllerWithAutoFillContext_passwordRules_overrideApplicationIdentifier_completion___block_invoke;
      v21[3] = &unk_1E5C75FC8;
      id v22 = v13;
      id v23 = v11;
      v24 = v12;
      v14 = (_SFAutomaticPasswordInputViewController *)v13;
      [(_SFAutomaticPasswordInputViewController *)v14 getAutomaticStrongPasswordForAppWithPasswordRules:v10 confirmPasswordRules:0 overrideApplicationIdentifier:v23 completion:v21];
    }
  }
LABEL_12:
}

- (_SFAutomaticPasswordInputViewController)initWithPassword:(id)a3 keyboardType:(int64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFAutomaticPasswordInputViewController;
  v7 = [(UIInputViewController *)&v12 initWithNibName:0 bundle:0];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    password = v7->_password;
    v7->_password = (NSString *)v8;

    v7->_keyboardType = a4;
    id v10 = v7;
  }

  return v7;
}

- (void)_updateKeyboardMetricsAndInterfaceOrientationIfNeeded
{
  int64_t v3 = [(id)*MEMORY[0x1E4FB2608] interfaceOrientation];
  if (v3 != self->_currentInterfaceOrientation)
  {
    self->_currentInterfaceOrientation = v3;
    v4 = +[_SFKeyboardGeometry keyboardGeometryForInterfaceOrientation:1];
    [v4 sizeWithBar];
    self->_portraitKeyboardSize.width = v5;
    self->_portraitKeyboardSize.height = v6;

    id v10 = +[_SFKeyboardGeometry keyboardGeometryForInterfaceOrientation:4];
    p_landscapeKeyboardSize = &self->_landscapeKeyboardSize;
    if (_SFDeviceIsPad()) {
      [v10 sizeWithoutBar];
    }
    else {
      [v10 sizeWithBar];
    }
    p_landscapeKeyboardSize->width = v8;
    p_landscapeKeyboardSize->height = v9;
  }
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)_SFAutomaticPasswordInputViewController;
  [(UIInputViewController *)&v17 viewDidLoad];
  int64_t v3 = [(_SFAutomaticPasswordInputViewController *)self strongPasswordIntroductionViewControllerIfNeeded];
  if (v3)
  {
    [(_SFAutomaticPasswordInputViewController *)self addChildViewController:v3];
    v4 = [SFAutoFillStrongPasswordContainerInputView alloc];
    CGFloat v5 = [(UIInputViewController *)self inputView];
    uint64_t v6 = [v5 inputViewStyle];
    v7 = [v3 view];
    CGFloat v8 = [(SFAutoFillStrongPasswordContainerInputView *)v4 initWithInputViewStyle:v6 containingView:v7];

    [(SFAutoFillStrongPasswordContainerInputView *)v8 setInputViewSizing:self];
    [(UIInputViewController *)self setInputView:v8];
    CGFloat v9 = [(SFAutoFillStrongPasswordContainerInputView *)v8 heightAnchor];
    id v10 = [v9 constraintEqualToConstant:100.0];
    heightConstraint = self->_heightConstraint;
    self->_heightConstraint = v10;

    [(NSLayoutConstraint *)self->_heightConstraint setActive:1];
    [v3 didMoveToParentViewController:self];
    objc_storeStrong((id *)&self->_passwordManagerIntroductionViewController, v3);
  }
  else
  {
    objc_super v12 = [SFAutomaticPasswordInputView alloc];
    id v13 = [(UIInputViewController *)self inputView];
    CGFloat v8 = -[SFAutomaticPasswordInputView initWithInputViewStyle:keyboardType:](v12, "initWithInputViewStyle:keyboardType:", [v13 inputViewStyle], self->_keyboardType);

    [(SFAutoFillStrongPasswordContainerInputView *)v8 setShouldAllowSelfSizing:1];
    [(SFAutoFillStrongPasswordContainerInputView *)v8 setInputViewSizing:self];
    [(UIInputViewController *)self setInputView:v8];
    v14 = [(SFAutoFillStrongPasswordContainerInputView *)v8 heightAnchor];
    uint64_t v15 = [v14 constraintEqualToConstant:100.0];
    v16 = self->_heightConstraint;
    self->_heightConstraint = v15;

    [(NSLayoutConstraint *)self->_heightConstraint setActive:1];
    [(SFAutoFillStrongPasswordContainerInputView *)v8 setDelegate:self];
  }
}

- (void)_postButtonPressedNotificationForButton:(int64_t)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if (!self->_autoFillContextProtocolObjectUUID)
  {
    self->_autoFillContextProtocolObjectUUID = (NSString *)&stru_1EFB97EB8;
  }
  CGFloat v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v8[0] = @"_SFAutomaticPasswordInputViewNotificationPressedButtonUserInfoKey";
  uint64_t v6 = [NSNumber numberWithInteger:a3];
  v8[1] = @"SFAutoFillContextProviderIdentifierUserInfoKey";
  v9[0] = v6;
  v9[1] = self->_autoFillContextProtocolObjectUUID;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  [v5 postNotificationName:@"_SFAutomaticPasswordInputViewButtonPressedNotification" object:self userInfo:v7];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_SFAutomaticPasswordInputViewController;
  [(_SFAutomaticPasswordInputViewController *)&v8 viewWillAppear:a3];
  [(_SFAutomaticPasswordInputViewController *)self _updateKeyboardHeight];
  if ([(_SFAutomaticPasswordInputViewController *)self _inputViewControllerShouldDirectlyInsertPassword])
  {
    v4 = [(UIInputViewController *)self textDocumentProxy];
    [v4 insertText:self->_password];
  }
  CGFloat v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__dismissKeyboard_ name:@"_SFAutomaticPasswordDismissedByUser" object:0];

  if ([MEMORY[0x1E4F98AF8] isPasswordsAppInstalled])
  {
    if (self->_passwordManagerIntroductionViewController)
    {
      [(_SFAutomaticPasswordInputViewController *)self _postContextProviderRequiredNotificationIfNeeded];
      uint64_t v6 = [(_SFAutomaticPasswordInputViewController *)self autoFillContextProvider];
      v7 = [v6 autoFillController];
      [v7 hideInputAccessoryView];
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SFAutomaticPasswordInputViewController;
  [(_SFAutomaticPasswordInputViewController *)&v4 viewDidDisappear:a3];
  int64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:@"_SFAutomaticPasswordDismissedByUser"];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_SFAutomaticPasswordInputViewController;
  -[_SFAutomaticPasswordInputViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  [(_SFAutomaticPasswordInputViewController *)self _updateKeyboardHeight];
}

- (BOOL)_inputViewControllerShouldDirectlyInsertPassword
{
  if (!self->_password) {
    return 0;
  }
  v2 = [(UIInputViewController *)self textDocumentProxy];
  int64_t v3 = [v2 documentContextAfterInput];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    objc_super v5 = [v2 documentContextBeforeInput];
    BOOL v4 = v5 == 0;
  }
  return v4;
}

- (CGSize)_currentKeyboardSize
{
  if ((unint64_t)([(id)*MEMORY[0x1E4FB2608] interfaceOrientation] - 3) >= 2) {
    int64_t v3 = &OBJC_IVAR____SFAutomaticPasswordInputViewController__portraitKeyboardSize;
  }
  else {
    int64_t v3 = &OBJC_IVAR____SFAutomaticPasswordInputViewController__landscapeKeyboardSize;
  }
  BOOL v4 = (double *)((char *)self + *v3);
  double v6 = *v4;
  double v5 = v4[1];
  passwordManagerIntroductionViewController = self->_passwordManagerIntroductionViewController;
  if (passwordManagerIntroductionViewController)
  {
    objc_super v8 = [(UIViewController *)passwordManagerIntroductionViewController view];
    [v8 setNeedsUpdateConstraints];

    CGFloat v9 = [(UIViewController *)self->_passwordManagerIntroductionViewController view];
    [v9 layoutIfNeeded];

    id v10 = [(UIViewController *)self->_passwordManagerIntroductionViewController view];
    LODWORD(v11) = 1144750080;
    LODWORD(v12) = 1112014848;
    objc_msgSend(v10, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v6, 1.79769313e308, v11, v12);
    double v6 = v13;
    double v15 = v14;

    double v16 = v5 * 1.5;
    if (v15 <= v5 * 1.5) {
      double v16 = v15;
    }
    double v5 = fmax(v16, v5) + 4.0;
  }
  double v17 = v6;
  double v18 = v5;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)_updateKeyboardHeight
{
  [(_SFAutomaticPasswordInputViewController *)self _updateKeyboardMetricsAndInterfaceOrientationIfNeeded];
  [(_SFAutomaticPasswordInputViewController *)self _currentKeyboardSize];
  heightConstraint = self->_heightConstraint;

  [(NSLayoutConstraint *)heightConstraint setConstant:v3];
}

- (id)strongPasswordIntroductionViewControllerIfNeeded
{
  if (![MEMORY[0x1E4F98AF8] isPasswordsAppInstalled])
  {
    BOOL v4 = 0;
    goto LABEL_17;
  }
  passwordManagerIntroductionViewController = self->_passwordManagerIntroductionViewController;
  if (passwordManagerIntroductionViewController)
  {
    BOOL v4 = passwordManagerIntroductionViewController;
    goto LABEL_17;
  }
  [(_SFAutomaticPasswordInputViewController *)self _postContextProviderRequiredNotificationIfNeeded];
  double v5 = [(_SFAutomaticPasswordInputViewController *)self autoFillContextProvider];
  uint64_t v6 = [v5 autoFillFormType];
  v7 = [v5 autoFillController];
  [v7 hideInputAccessoryView];

  if (v6 == 3)
  {
    if ([MEMORY[0x1E4F88198] shouldShowLoginIntroduction])
    {
      uint64_t v10 = 0;
      CGFloat v9 = (objc_class *)MEMORY[0x1E4F88198];
      goto LABEL_14;
    }
  }
  else if (v6 == 4)
  {
    char v8 = [MEMORY[0x1E4F88198] shouldShowLoginIntroduction];
    CGFloat v9 = (objc_class *)MEMORY[0x1E4F88198];
    if (v8)
    {
      uint64_t v10 = 0;
    }
    else
    {
      if (![MEMORY[0x1E4F88198] shouldShowStrongPasswordIntroduction])
      {
        BOOL v4 = 0;
        goto LABEL_15;
      }
      CGFloat v9 = (objc_class *)MEMORY[0x1E4F88198];
      uint64_t v10 = 1;
    }
LABEL_14:
    BOOL v4 = (UIViewController *)[[v9 alloc] initWithMode:v10];
LABEL_15:
    [(UIViewController *)v4 setDelegate:self];
    goto LABEL_16;
  }
  BOOL v4 = 0;
LABEL_16:

LABEL_17:

  return v4;
}

- (id)_editingStrongPasswordInformationViewControllerIfNeeded
{
  [(_SFAutomaticPasswordInputViewController *)self _postContextProviderRequiredNotificationIfNeeded];
  double v3 = [(_SFAutomaticPasswordInputViewController *)self autoFillContextProvider];
  BOOL v4 = [v3 url];
  id v5 = objc_alloc(MEMORY[0x1E4F88190]);
  uint64_t v6 = [v4 host];
  v7 = objc_msgSend(v6, "safari_highLevelDomainForPasswordManager");
  char v8 = (void *)[v5 initWithWebsiteTitle:v7 url:v4];

  [v8 setDelegate:self];

  return v8;
}

- (CGSize)intrinsicContentSizeForInputView:(id)a3
{
  [(_SFAutomaticPasswordInputViewController *)self _updateKeyboardMetricsAndInterfaceOrientationIfNeeded];

  [(_SFAutomaticPasswordInputViewController *)self _currentKeyboardSize];
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)inputViewControllerDidSelectUseStrongPassword:(id)a3
{
  [(_SFAutomaticPasswordInputViewController *)self _postButtonPressedNotificationForButton:0];

  [(_SFAutomaticPasswordInputViewController *)self dismissKeyboardPreservingFirstResponderIfNecessary];
}

- (void)inputViewControllerDidSelectUseCustomPassword:(id)a3
{
  [(_SFAutomaticPasswordInputViewController *)self _postButtonPressedNotificationForButton:1];
  double v4 = [MEMORY[0x1E4F98948] sharedLogger];
  [v4 didChooseCustomPassword];

  [(UIInputViewController *)self advanceToNextInputMode];
}

- (void)dismissKeyboardPreservingFirstResponderIfNecessary
{
  double v3 = [MEMORY[0x1E4FB1900] activeInstance];
  id v5 = [v3 inputDelegate];

  if (objc_opt_respondsToSelector()) {
    [v5 accessoryDone];
  }
  else {
    [(UIInputViewController *)self dismissKeyboard];
  }
  if ([MEMORY[0x1E4F98AF8] isPasswordsAppInstalled])
  {
    double v4 = [(_SFAutomaticPasswordInputViewController *)self autoFillContextProvider];
    [v4 makeStrongPasswordFieldViewableAndEditable:0];
  }
}

- (id)inputViewControllerOtherOptionsMenu:(id)a3
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v6 = _WBSLocalizedString();
  v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.pencil"];
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __79___SFAutomaticPasswordInputViewController_inputViewControllerOtherOptionsMenu___block_invoke;
  v65[3] = &unk_1E5C72BF0;
  v65[4] = self;
  id v8 = v4;
  id v66 = v8;
  uint64_t v54 = [v5 actionWithTitle:v6 image:v7 identifier:0 handler:v65];

  if (self->_autoFillContextProtocolObjectUUID)
  {
    [(_SFAutomaticPasswordInputViewController *)self _postContextProviderRequiredNotificationIfNeeded];
    CGFloat v9 = [(_SFAutomaticPasswordInputViewController *)self autoFillContextProvider];
    uint64_t v10 = [v9 currentStrongPassword];
    double v11 = [v9 defaultStrongPassword];
    double v12 = (void *)MEMORY[0x1E4FB13F0];
    double v13 = _WBSLocalizedString();
    double v14 = [MEMORY[0x1E4FB1818] systemImageNamed:@"character.cursor.ibeam"];
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __79___SFAutomaticPasswordInputViewController_inputViewControllerOtherOptionsMenu___block_invoke_2;
    v62[3] = &unk_1E5C72BF0;
    id v15 = v9;
    id v63 = v15;
    id v64 = v11;
    id v52 = v11;
    double v16 = [v12 actionWithTitle:v13 image:v14 identifier:0 handler:v62];

    double v17 = [v15 defaultStrongPassword];
    double v18 = v16;
    [v16 setDiscoverabilityTitle:v17];

    uint64_t v19 = v10;
    v50 = v10;
    objc_msgSend(v18, "setState:", objc_msgSend(v10, "isEqual:", v52));
    v20 = [v15 alphanumericStrongPassword];
    v21 = (void *)MEMORY[0x1E4FB13F0];
    id v22 = _WBSLocalizedString();
    id v23 = [MEMORY[0x1E4FB1818] systemImageNamed:@"textformat.123"];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __79___SFAutomaticPasswordInputViewController_inputViewControllerOtherOptionsMenu___block_invoke_3;
    v59[3] = &unk_1E5C72BF0;
    id v24 = v15;
    id v60 = v24;
    id v61 = v20;
    id v51 = v20;
    v25 = [v21 actionWithTitle:v22 image:v23 identifier:0 handler:v59];

    [v25 setDiscoverabilityTitle:v51];
    objc_msgSend(v25, "setState:", objc_msgSend(v19, "isEqual:", v51));
    v26 = (void *)MEMORY[0x1E4FB1970];
    v69[0] = v18;
    v69[1] = v25;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
    v49 = [v26 menuWithTitle:&stru_1EFB97EB8 image:0 identifier:0 options:33 children:v27];

    v28 = (void *)MEMORY[0x1E4FB13F0];
    v29 = _WBSLocalizedString();
    [MEMORY[0x1E4FB1818] systemImageNamed:@"rectangle.and.pencil.and.ellipsis"];
    v30 = id v53 = v8;
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __79___SFAutomaticPasswordInputViewController_inputViewControllerOtherOptionsMenu___block_invoke_4;
    v57[3] = &unk_1E5C72170;
    id v31 = v24;
    id v58 = v31;
    v32 = [v28 actionWithTitle:v29 image:v30 identifier:0 handler:v57];

    v33 = (void *)MEMORY[0x1E4FB13F0];
    v34 = _WBSLocalizedString();
    v35 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.doc"];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __79___SFAutomaticPasswordInputViewController_inputViewControllerOtherOptionsMenu___block_invoke_5;
    v55[3] = &unk_1E5C72170;
    id v56 = v31;
    id v48 = v31;
    v36 = [v33 actionWithTitle:v34 image:v35 identifier:0 handler:v55];

    v37 = (void *)MEMORY[0x1E4FB1970];
    v68[0] = v32;
    v68[1] = v36;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
    v39 = [v37 menuWithTitle:&stru_1EFB97EB8 image:0 identifier:0 options:33 children:v38];

    v40 = (void *)MEMORY[0x1E4FB1970];
    v67[0] = v49;
    v67[1] = v39;
    v41 = (void *)v54;
    v67[2] = v54;
    v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:3];
    v43 = v40;
    v44 = v50;
    v45 = [v43 menuWithChildren:v42];

    id v8 = v53;
  }
  else
  {
    v46 = (void *)MEMORY[0x1E4FB1970];
    v41 = (void *)v54;
    v70[0] = v54;
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:1];
    v45 = [v46 menuWithChildren:v44];
  }

  return v45;
}

- (void)_postContextProviderRequiredNotificationIfNeeded
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Tried to post autofill context provider notification without valid UUID", v1, 2u);
}

- (void)strongPasswordIntroductionViewController:(id)a3 shouldPerformAction:(unint64_t)a4 willShowAdditionalView:(BOOL)a5
{
  [(_SFAutomaticPasswordInputViewController *)self _postContextProviderRequiredNotificationIfNeeded];
  id v11 = [(_SFAutomaticPasswordInputViewController *)self autoFillContextProvider];
  if (a4 - 2 < 2)
  {
    id v8 = (void *)*MEMORY[0x1E4FB2608];
    CGFloat v9 = [MEMORY[0x1E4F98C98] passwordManagerURL];
    [v8 openURL:v9 options:MEMORY[0x1E4F1CC08] completionHandler:0];

    goto LABEL_5;
  }
  if (a4)
  {
LABEL_5:
    if (a5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v10 = [v11 autoFillController];
  [v10 setDidCloseStrongPasswordIntroductionView:1];

LABEL_6:
  [(_SFAutomaticPasswordInputViewController *)self dismissKeyboardPreservingFirstResponderIfNecessary];
LABEL_7:
}

- (void)imageForStrongPasswordIntroductionViewController:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v7 = [(_SFAutomaticPasswordInputViewController *)self autoFillContextProvider];
  uint64_t v6 = [v7 autoFillController];
  [v6 fetchIconForURLWithCompletionHandler:v5];
}

- (id)placeholderImageForStrongPasswordIntroductionViewController:(id)a3
{
  return 0;
}

- (void)strongPasswordIntroductionViewController:(id)a3 shouldFillPasswordWithFormat:(unint64_t)a4
{
  id v5 = [(_SFAutomaticPasswordInputViewController *)self autoFillContextProvider];
  id v4 = [v5 autoFillController];
  [v4 generateAndFillStrongPassword];
}

- (id)strongPasswordIntroductionViewController:(id)a3 automaticStrongPasswordWithFormat:(unint64_t)a4
{
  uint64_t v6 = [(_SFAutomaticPasswordInputViewController *)self autoFillContextProvider];
  id v7 = v6;
  if (a4 == 1)
  {
    uint64_t v8 = [v6 alphanumericStrongPassword];
  }
  else
  {
    if (a4) {
      goto LABEL_6;
    }
    uint64_t v8 = [v6 defaultStrongPassword];
  }
  id v4 = (void *)v8;
LABEL_6:

  return v4;
}

- (void)strongPasswordIntroductionViewControllerDidFinishIntroduction:(id)a3
{
  id v4 = [(_SFAutomaticPasswordInputViewController *)self autoFillContextProvider];
  double v3 = [v4 autoFillController];
  [v3 reloadFirstResponderInputViews];
}

- (void)strongPasswordIntroductionViewControllerShowOtherPasswords:(id)a3
{
  id v4 = [(_SFAutomaticPasswordInputViewController *)self autoFillContextProvider];
  double v3 = [v4 autoFillController];
  [v3 userDidSelectShowMorePasswords];
}

- (void)strongPasswordIntroductionViewControllerShowKeyboard:(id)a3
{
  id v4 = [(_SFAutomaticPasswordInputViewController *)self autoFillContextProvider];
  double v3 = [v4 autoFillController];
  [v3 userDidSelectUseKeyboard];
}

- (_SFAutoFillContextProviding)autoFillContextProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillContextProvider);

  return (_SFAutoFillContextProviding *)WeakRetained;
}

- (void)setAutoFillContextProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_autoFillContextProvider);
  objc_storeStrong((id *)&self->_passwordManagerIntroductionViewController, 0);
  objc_storeStrong((id *)&self->_autoFillContextProtocolObjectUUID, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_password, 0);

  objc_storeStrong((id *)&self->_inputView, 0);
}

@end