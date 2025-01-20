@interface _SFAutoFillInputView
- (CGSize)_currentKeyboardSize;
- (_SFAutoFillInputView)initWithHostString:(id)a3 credentialSource:(id)a4 suggestion:(id)a5 customTitle:(id)a6;
- (_SFAutoFillInputView)initWithIntroductionViewController:(id)a3;
- (_SFAutoFillInputView)initWithStreamlinedAutoFillViewController:(id)a3 suggestion:(id)a4;
- (_SFAutoFillInputView)initWithStreamlinedStrongPasswordViewController:(id)a3;
- (_SFAutoFillInputViewDelegate)delegate;
- (id)_initWithViewController:(id)a3;
- (void)_commonInit;
- (void)_fillCredential:(id)a3;
- (void)_preferredContentSizeCategoryDidChange;
- (void)_replaceContentsOfViewWithViewController:(id)a3;
- (void)_showMorePasswords:(id)a3;
- (void)_showStandardKeyboard:(id)a3;
- (void)_updateDynamicConstraints;
- (void)_updateFillCredentialButtonLabelMetrics;
- (void)_updateKeyboardHeight;
- (void)_updateKeyboardMetricsAndInterfaceOrientationIfNeeded;
- (void)replaceContentsOfViewWithStreamlinedStrongPasswordViewController:(id)a3;
- (void)replaceContentsOfViewWithStrongPasswordIntroductionViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)streamlinedAutoFillViewControllerFillCredential:(id)a3;
- (void)streamlinedAutoFillViewControllerShowKeyboard:(id)a3;
- (void)streamlinedAutoFillViewControllerShowOtherPasswords:(id)a3;
- (void)streamlinedStrongPasswordViewController:(id)a3 shouldFillStrongPasswordWithFormat:(unint64_t)a4;
- (void)streamlinedStrongPasswordViewControllerDeclinedStrongPassword:(id)a3;
- (void)streamlinedStrongPasswordViewControllerShowKeyboard:(id)a3;
- (void)streamlinedStrongPasswordViewControllerShowOtherPasswords:(id)a3;
- (void)updateConstraints;
- (void)updateSuggestionIfNecessary:(id)a3;
@end

@implementation _SFAutoFillInputView

- (_SFAutoFillInputView)initWithHostString:(id)a3 credentialSource:(id)a4 suggestion:(id)a5 customTitle:(id)a6
{
  v103[17] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v102.receiver = self;
  v102.super_class = (Class)_SFAutoFillInputView;
  double v14 = *MEMORY[0x1E4F1DB28];
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v18 = -[UIInputView initWithFrame:inputViewStyle:](&v102, sel_initWithFrame_inputViewStyle_, 1, *MEMORY[0x1E4F1DB28], v15, v16, v17);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_suggestion, a5);
    uint64_t v20 = [v10 copy];
    hostString = v19->_hostString;
    v19->_hostString = (NSString *)v20;

    uint64_t v22 = [v11 copy];
    credentialSource = v19->_credentialSource;
    v19->_credentialSource = (NSString *)v22;

    uint64_t v24 = [v13 length];
    id v99 = v13;
    if (v24) {
      v25 = (void *)[v13 copy];
    }
    else {
      v25 = 0;
    }
    id v100 = v11;
    id v101 = v10;
    objc_storeStrong((id *)&v19->_customTitle, v25);
    if (v24) {

    }
    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    dynamicConstraints = v19->_dynamicConstraints;
    v19->_dynamicConstraints = v26;

    uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v14, v15, v16, v17);
    explanationLabel = v19->_explanationLabel;
    v19->_explanationLabel = (UILabel *)v28;

    [(UILabel *)v19->_explanationLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v19->_explanationLabel setTextAlignment:1];
    [(UILabel *)v19->_explanationLabel setNumberOfLines:0];
    v30 = _SFAutoFillInputViewLabelFont();
    [(UILabel *)v19->_explanationLabel setFont:v30];

    [(UILabel *)v19->_explanationLabel setAdjustsFontForContentSizeCategory:1];
    v31 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v19->_explanationLabel setTextColor:v31];

    uint64_t v32 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_21];
    v33 = UIKeyboardGetKeyboardKeyImage();
    v98 = (void *)v32;
    v97 = [v33 imageWithTintColor:v32];

    v34 = objc_msgSend(MEMORY[0x1E4FB1818], "sf_imageNamed:", @"PasswordAutoFillKey");
    v96 = [v34 imageWithTintColor:v32];

    v35 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
    keyboardButton = v19->_keyboardButton;
    v19->_keyboardButton = v35;

    [(UIButton *)v19->_keyboardButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v19->_keyboardButton setImage:v97 forState:0];
    -[UIButton setImageEdgeInsets:](v19->_keyboardButton, "setImageEdgeInsets:", 13.0, 24.0, 25.0, 8.0);
    [(_SFAutoFillInputView *)v19 addSubview:v19->_keyboardButton];
    v37 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
    otherPasswordsButton = v19->_otherPasswordsButton;
    v19->_otherPasswordsButton = v37;

    [(UIButton *)v19->_otherPasswordsButton setTranslatesAutoresizingMaskIntoConstraints:0];
    -[UIButton setImageEdgeInsets:](v19->_otherPasswordsButton, "setImageEdgeInsets:", 13.0, 8.0, 25.0, 24.0);
    [(UIButton *)v19->_otherPasswordsButton setImage:v96 forState:0];
    [(_SFAutoFillInputView *)v19 addSubview:v19->_otherPasswordsButton];
    uint64_t v39 = +[_SFAutoFillInputViewButton buttonWithType:1];
    fillCredentialButton = v19->_fillCredentialButton;
    v19->_fillCredentialButton = (UIButton *)v39;

    [(UIButton *)v19->_fillCredentialButton setAccessibilityIdentifier:@"CredentialUsernameButton"];
    v95 = [MEMORY[0x1E4FB14D8] filledButtonConfiguration];
    [v95 setButtonSize:3];
    [(UIButton *)v19->_fillCredentialButton setConfiguration:v95];
    [(UIButton *)v19->_fillCredentialButton setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v41) = 1148846080;
    [(UIButton *)v19->_fillCredentialButton setContentHuggingPriority:0 forAxis:v41];
    [(_SFAutoFillInputView *)v19 addSubview:v19->_fillCredentialButton];
    [(_SFAutoFillInputView *)v19 updateSuggestionIfNecessary:v12];
    [(_SFAutoFillInputView *)v19 addSubview:v19->_explanationLabel];
    [(UIInputView *)v19 setAllowsSelfSizing:1];
    [(_SFAutoFillInputView *)v19 setTranslatesAutoresizingMaskIntoConstraints:0];
    v42 = [(UIButton *)v19->_fillCredentialButton widthAnchor];
    v43 = [(_SFAutoFillInputView *)v19 widthAnchor];
    v44 = [v42 constraintEqualToAnchor:v43];

    LODWORD(v45) = 1144750080;
    v84 = v44;
    [v44 setPriority:v45];
    v77 = (void *)MEMORY[0x1E4F28DC8];
    v94 = [(UILabel *)v19->_explanationLabel topAnchor];
    v93 = [(_SFAutoFillInputView *)v19 topAnchor];
    v92 = [v94 constraintEqualToAnchor:v93 constant:20.0];
    v103[0] = v92;
    v91 = [(UILabel *)v19->_explanationLabel bottomAnchor];
    v90 = [(UIButton *)v19->_fillCredentialButton topAnchor];
    v89 = [v91 constraintEqualToAnchor:v90 constant:-20.0];
    v103[1] = v89;
    v88 = [(UILabel *)v19->_explanationLabel centerXAnchor];
    v87 = [(_SFAutoFillInputView *)v19 centerXAnchor];
    v86 = [v88 constraintEqualToAnchor:v87];
    v103[2] = v86;
    v85 = [(UILabel *)v19->_explanationLabel leadingAnchor];
    v83 = [(_SFAutoFillInputView *)v19 leadingAnchor];
    v82 = [v85 constraintGreaterThanOrEqualToAnchor:v83 constant:16.0];
    v103[3] = v82;
    v81 = [(UILabel *)v19->_explanationLabel trailingAnchor];
    v80 = [(_SFAutoFillInputView *)v19 trailingAnchor];
    v79 = [v81 constraintGreaterThanOrEqualToAnchor:v80 constant:-16.0];
    v103[4] = v79;
    v78 = [(UILabel *)v19->_explanationLabel widthAnchor];
    v76 = [v78 constraintLessThanOrEqualToConstant:420.0];
    v103[5] = v76;
    v75 = [(UIButton *)v19->_fillCredentialButton bottomAnchor];
    v74 = [(_SFAutoFillInputView *)v19 bottomAnchor];
    v73 = [v75 constraintEqualToAnchor:v74 constant:-78.0];
    v103[6] = v73;
    v72 = [(UIButton *)v19->_fillCredentialButton centerXAnchor];
    v71 = [(_SFAutoFillInputView *)v19 centerXAnchor];
    v70 = [v72 constraintEqualToAnchor:v71];
    v103[7] = v70;
    v103[8] = v44;
    v69 = [(UIButton *)v19->_keyboardButton bottomAnchor];
    v68 = [(_SFAutoFillInputView *)v19 bottomAnchor];
    v67 = [v69 constraintEqualToAnchor:v68];
    v103[9] = v67;
    v66 = [(UIButton *)v19->_keyboardButton leftAnchor];
    v65 = [(_SFAutoFillInputView *)v19 leftAnchor];
    v64 = [v66 constraintEqualToAnchor:v65];
    v103[10] = v64;
    v63 = [(UIButton *)v19->_keyboardButton widthAnchor];
    v62 = [v63 constraintEqualToConstant:60.0];
    v103[11] = v62;
    v61 = [(UIButton *)v19->_keyboardButton heightAnchor];
    v60 = [v61 constraintEqualToConstant:66.0];
    v103[12] = v60;
    v59 = [(UIButton *)v19->_otherPasswordsButton bottomAnchor];
    v58 = [(_SFAutoFillInputView *)v19 bottomAnchor];
    v57 = [v59 constraintEqualToAnchor:v58];
    v103[13] = v57;
    v46 = [(UIButton *)v19->_otherPasswordsButton rightAnchor];
    v47 = [(_SFAutoFillInputView *)v19 rightAnchor];
    v48 = [v46 constraintEqualToAnchor:v47];
    v103[14] = v48;
    v49 = [(UIButton *)v19->_otherPasswordsButton widthAnchor];
    v50 = [v49 constraintEqualToConstant:60.0];
    v103[15] = v50;
    v51 = [(UIButton *)v19->_otherPasswordsButton heightAnchor];
    v52 = [v51 constraintEqualToConstant:66.0];
    v103[16] = v52;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:17];
    v54 = id v53 = v12;
    [v77 activateConstraints:v54];

    id v12 = v53;
    [(_SFAutoFillInputView *)v19 _commonInit];
    [(UIButton *)v19->_fillCredentialButton addTarget:v19 action:sel__fillCredential_ forControlEvents:0x2000];
    [(UIButton *)v19->_keyboardButton addTarget:v19 action:sel__showStandardKeyboard_ forControlEvents:0x2000];
    [(UIButton *)v19->_otherPasswordsButton addTarget:v19 action:sel__showMorePasswords_ forControlEvents:0x2000];
    v55 = v19;

    id v11 = v100;
    id v10 = v101;
    id v13 = v99;
  }

  return v19;
}

- (_SFAutoFillInputView)initWithIntroductionViewController:(id)a3
{
  id v5 = a3;
  v6 = [(_SFAutoFillInputView *)self _initWithViewController:v5];
  v7 = (_SFAutoFillInputView *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 93, a3);
    v8 = v7;
  }

  return v7;
}

- (_SFAutoFillInputView)initWithStreamlinedAutoFillViewController:(id)a3 suggestion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(_SFAutoFillInputView *)self _initWithViewController:v7];
  if (v9)
  {
    [v7 setDelegate:v9];
    objc_storeStrong((id *)&v9->_streamlinedAutoFillViewController, a3);
    objc_storeStrong((id *)&v9->_suggestion, a4);
    id v10 = v9;
  }

  return v9;
}

- (_SFAutoFillInputView)initWithStreamlinedStrongPasswordViewController:(id)a3
{
  id v5 = a3;
  v6 = [(_SFAutoFillInputView *)self _initWithViewController:v5];
  if (v6)
  {
    [v5 setDelegate:v6];
    objc_storeStrong((id *)&v6->_streamlinedStrongPasswordViewController, a3);
    id v7 = v6;
  }

  return v6;
}

- (id)_initWithViewController:(id)a3
{
  id v4 = a3;
  id v5 = -[UIInputView initWithFrame:inputViewStyle:](self, "initWithFrame:inputViewStyle:", 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5)
  {
    [(_SFAutoFillInputView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIInputView *)v6 setAllowsSelfSizing:1];
    id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    dynamicConstraints = v6->_dynamicConstraints;
    v6->_dynamicConstraints = v7;

    v9 = [v4 view];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_SFAutoFillInputView *)v6 addSubview:v9];
    id v10 = [(_SFAutoFillInputView *)v6 heightAnchor];
    uint64_t v11 = [v10 constraintLessThanOrEqualToConstant:100.0];
    heightConstraint = v6->_heightConstraint;
    v6->_heightConstraint = (NSLayoutConstraint *)v11;

    id v13 = (void *)MEMORY[0x1E4F28DC8];
    double v14 = objc_msgSend(MEMORY[0x1E4F28DC8], "safari_constraintsMatchingFrameOfView:withFrameOfView:", v9, v6);
    double v15 = [v14 arrayByAddingObject:v6->_heightConstraint];
    [v13 activateConstraints:v15];

    [(_SFAutoFillInputView *)v6 _commonInit];
    double v16 = v6;
  }
  return v6;
}

- (void)_commonInit
{
  v5[1] = *MEMORY[0x1E4F143B8];
  [(_SFAutoFillInputView *)self _updateDynamicConstraints];
  [(_SFAutoFillInputView *)self _updateKeyboardHeight];
  [(_SFAutoFillInputView *)self setAccessibilityIdentifier:@"SFAutoFillInputView"];
  v5[0] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  id v4 = (id)[(_SFAutoFillInputView *)self registerForTraitChanges:v3 withTarget:self action:sel__preferredContentSizeCategoryDidChange];
}

- (void)replaceContentsOfViewWithStreamlinedStrongPasswordViewController:(id)a3
{
  id v4 = (PMSafariStreamlinedStrongPasswordViewController *)a3;
  [(_SFAutoFillInputView *)self _replaceContentsOfViewWithViewController:v4];
  streamlinedStrongPasswordViewController = self->_streamlinedStrongPasswordViewController;
  self->_streamlinedStrongPasswordViewController = v4;
  v6 = v4;

  [(PMSafariStreamlinedStrongPasswordViewController *)v6 setDelegate:self];
}

- (void)replaceContentsOfViewWithStrongPasswordIntroductionViewController:(id)a3
{
  id v4 = (PMSafariAutoFillStrongPasswordIntroductionViewController *)a3;
  [(_SFAutoFillInputView *)self _replaceContentsOfViewWithViewController:v4];
  strongPasswordIntroductionViewController = self->_strongPasswordIntroductionViewController;
  self->_strongPasswordIntroductionViewController = v4;
  v6 = v4;

  id v7 = [(PMSafariAutoFillStrongPasswordIntroductionViewController *)v6 view];
  [v7 setNeedsUpdateConstraints];

  id v8 = [(PMSafariAutoFillStrongPasswordIntroductionViewController *)v6 view];

  [v8 layoutIfNeeded];
}

- (void)_replaceContentsOfViewWithViewController:(id)a3
{
  streamlinedAutoFillViewController = self->_streamlinedAutoFillViewController;
  id v5 = a3;
  v6 = [(PMSafariStreamlinedAutoFillViewController *)streamlinedAutoFillViewController view];
  [v6 removeFromSuperview];

  id v7 = [(PMSafariAutoFillStrongPasswordIntroductionViewController *)self->_strongPasswordIntroductionViewController view];
  [v7 removeFromSuperview];

  id v8 = [(PMSafariStreamlinedStrongPasswordViewController *)self->_streamlinedStrongPasswordViewController view];
  [v8 removeFromSuperview];

  v9 = self->_streamlinedAutoFillViewController;
  self->_streamlinedAutoFillViewController = 0;

  strongPasswordIntroductionViewController = self->_strongPasswordIntroductionViewController;
  self->_strongPasswordIntroductionViewController = 0;

  streamlinedStrongPasswordViewController = self->_streamlinedStrongPasswordViewController;
  self->_streamlinedStrongPasswordViewController = 0;

  id v14 = [v5 view];

  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(_SFAutoFillInputView *)self addSubview:v14];
  id v12 = (void *)MEMORY[0x1E4F28DC8];
  id v13 = objc_msgSend(MEMORY[0x1E4F28DC8], "safari_constraintsMatchingFrameOfView:withFrameOfView:", v14, self);
  [v12 activateConstraints:v13];

  [(_SFAutoFillInputView *)self setNeedsUpdateConstraints];
  [(_SFAutoFillInputView *)self setNeedsLayout];
}

- (void)updateConstraints
{
  [(_SFAutoFillInputView *)self _updateDynamicConstraints];
  [(_SFAutoFillInputView *)self _updateKeyboardHeight];
  v3.receiver = self;
  v3.super_class = (Class)_SFAutoFillInputView;
  [(_SFAutoFillInputView *)&v3 updateConstraints];
}

- (void)updateSuggestionIfNecessary:(id)a3
{
  id v38 = a3;
  p_suggestion = &self->_suggestion;
  uint64_t v6 = [(_SFTextSuggestion *)self->_suggestion savedAccountMatch];
  if (!v6) {
    goto LABEL_3;
  }
  id v7 = (void *)v6;
  id v8 = [v38 savedAccountMatch];
  v9 = [v8 savedAccount];
  id v10 = [(_SFTextSuggestion *)*p_suggestion savedAccountMatch];
  uint64_t v11 = [v10 savedAccount];
  int v12 = [v9 isEqual:v11];

  if (v12)
  {
LABEL_3:
    id v13 = [(_SFTextSuggestion *)*p_suggestion credentialIdentity];
    if ([v13 type] == 2)
    {
      id v14 = [(_SFTextSuggestion *)*p_suggestion credentialIdentity];
      if ([v14 isExternal])
      {
        double v15 = [v38 savedAccountMatch];

        if (v15) {
          goto LABEL_24;
        }
LABEL_9:
        objc_storeStrong((id *)&self->_suggestion, a3);
        double v16 = [v38 savedAccountMatch];
        double v17 = [v16 autoFillPasskey];

        if (v17)
        {
          v18 = NSString;
          v19 = _WBSLocalizedString();
          uint64_t v20 = objc_msgSend(v18, "localizedStringWithFormat:", v19, self->_hostString);

          if ([(NSString *)self->_customTitle length])
          {
            v21 = NSString;
LABEL_21:
            v30 = _WBSLocalizedString();
            uint64_t v31 = objc_msgSend(v21, "localizedStringWithFormat:", v30, self->_hostString, self->_customTitle);

            uint64_t v20 = (void *)v31;
LABEL_22:

            goto LABEL_23;
          }
          goto LABEL_23;
        }
        if (!self->_credentialSource
          || ([v38 credentialIdentity],
              uint64_t v22 = objc_claimAutoreleasedReturnValue(),
              v22,
              !v22))
        {
          uint64_t v28 = NSString;
          v29 = _WBSLocalizedString();
          uint64_t v20 = objc_msgSend(v28, "localizedStringWithFormat:", v29, self->_hostString);

          if ([(NSString *)self->_customTitle length])
          {
            v21 = NSString;
            goto LABEL_21;
          }
LABEL_23:
          [(UILabel *)self->_explanationLabel setText:v20];
          uint64_t v32 = NSString;
          v33 = _WBSLocalizedString();
          v34 = [v38 displayText];
          v35 = objc_msgSend(v32, "localizedStringWithFormat:", v33, v34);

          v36 = [(UIButton *)self->_fillCredentialButton configuration];
          [v36 setTitle:v35];
          [(UIButton *)self->_fillCredentialButton setConfiguration:v36];

          goto LABEL_24;
        }
        [MEMORY[0x1E4FB6EF0] keychainSyncEnabled];
        v23 = [v38 credentialIdentity];
        uint64_t v24 = [v23 owningExtensionState];

        v25 = [v38 credentialIdentity];
        uint64_t v26 = [v25 type];

        switch(v26)
        {
          case 4:
            v27 = NSString;
            if (!v24) {
              goto LABEL_32;
            }
            break;
          case 2:
            v27 = NSString;
            if (!v24) {
              goto LABEL_32;
            }
            break;
          case 1:
            v27 = NSString;
            if (v24) {
              break;
            }
LABEL_32:
            v30 = _WBSLocalizedString();
            objc_msgSend(v27, "localizedStringWithFormat:", v30, self->_hostString, v37);
            goto LABEL_33;
          default:
            uint64_t v20 = 0;
            goto LABEL_23;
        }
        v30 = _WBSLocalizedString();
        objc_msgSend(v27, "localizedStringWithFormat:", v30, self->_hostString, self->_credentialSource);
        uint64_t v20 = LABEL_33:;
        goto LABEL_22;
      }
    }
    goto LABEL_9;
  }
LABEL_24:
}

- (void)_updateDynamicConstraints
{
  v26[2] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E4F28000uLL;
  if ([(NSMutableArray *)self->_dynamicConstraints count])
  {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_dynamicConstraints];
    [(NSMutableArray *)self->_dynamicConstraints removeAllObjects];
  }
  uint64_t v4 = [(id)*MEMORY[0x1E4FB2608] interfaceOrientation];
  if (self->_fillCredentialButton)
  {
    uint64_t v5 = v4;
    uint64_t v6 = [(_SFAutoFillInputView *)self traitCollection];
    id v7 = [v6 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

    if (IsAccessibilityCategory)
    {
      dynamicConstraints = self->_dynamicConstraints;
      id v10 = [(UIButton *)self->_fillCredentialButton heightAnchor];
      uint64_t v11 = [v10 constraintGreaterThanOrEqualToConstant:50.0];
    }
    else
    {
      int IsPad = _SFDeviceIsPad();
      dynamicConstraints = self->_dynamicConstraints;
      id v13 = [(UIButton *)self->_fillCredentialButton heightAnchor];
      id v10 = v13;
      if ((IsPad & 1) != 0 || (unint64_t)(v5 - 1) <= 1) {
        id v14 = &_SFAutoFillInputViewDefaultButonHeight;
      }
      else {
        id v14 = &_SFAutoFillInputViewDefaultButonHeightLandscapePhone;
      }
      uint64_t v11 = [v13 constraintEqualToConstant:*(double *)v14];
    }
    double v15 = (void *)v11;
    [(NSMutableArray *)dynamicConstraints addObject:v11];

    int v16 = _SFDeviceIsPad();
    double v17 = self->_dynamicConstraints;
    fillCredentialButton = self->_fillCredentialButton;
    if (v16)
    {
      v19 = [(UIButton *)fillCredentialButton leadingAnchor];
      uint64_t v20 = [(_SFAutoFillInputView *)self leadingAnchor];
      v21 = [v19 constraintGreaterThanOrEqualToAnchor:v20 constant:16.0];
      v26[0] = v21;
      uint64_t v22 = [(UIButton *)self->_fillCredentialButton trailingAnchor];
      v23 = [(_SFAutoFillInputView *)self trailingAnchor];
      uint64_t v24 = [v22 constraintLessThanOrEqualToAnchor:v23 constant:-16.0];
      v26[1] = v24;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
      [(NSMutableArray *)v17 addObjectsFromArray:v25];

      unint64_t v3 = 0x1E4F28000;
    }
    else
    {
      v19 = [(UIButton *)fillCredentialButton widthAnchor];
      uint64_t v20 = [v19 constraintLessThanOrEqualToConstant:343.0];
      [(NSMutableArray *)v17 addObject:v20];
    }
  }
  [*(id *)(v3 + 3528) activateConstraints:self->_dynamicConstraints];
}

- (void)_updateFillCredentialButtonLabelMetrics
{
  id v7 = [(_SFAutoFillInputView *)self traitCollection];
  unint64_t v3 = [(UIButton *)self->_fillCredentialButton titleLabel];
  [v3 setTextAlignment:1];
  uint64_t v4 = [(UIButton *)self->_fillCredentialButton configuration];
  uint64_t v5 = [v7 preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v5)) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 5;
  }
  [v4 setTitleLineBreakMode:v6];

  [(UIButton *)self->_fillCredentialButton setConfiguration:v4];
}

- (void)_preferredContentSizeCategoryDidChange
{
  [(_SFAutoFillInputView *)self _updateFillCredentialButtonLabelMetrics];

  [(_SFAutoFillInputView *)self setNeedsUpdateConstraints];
}

- (void)_fillCredential:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained autoFillTextSuggestion:self->_suggestion];
}

- (void)_showMorePasswords:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained autoFillInputViewDidSelectMorePasswords:self];
  }
}

- (void)_showStandardKeyboard:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained autoFillInputViewDidSelectUseKeyboard:self];
  }
}

- (void)_updateKeyboardHeight
{
  [(_SFAutoFillInputView *)self _updateKeyboardMetricsAndInterfaceOrientationIfNeeded];
  [(_SFAutoFillInputView *)self _currentKeyboardSize];
  heightConstraint = self->_heightConstraint;

  [(NSLayoutConstraint *)heightConstraint setConstant:v3 * 1.5];
}

- (CGSize)_currentKeyboardSize
{
  if ((unint64_t)([(id)*MEMORY[0x1E4FB2608] interfaceOrientation] - 3) >= 2) {
    double v3 = &OBJC_IVAR____SFAutoFillInputView__portraitKeyboardSize;
  }
  else {
    double v3 = &OBJC_IVAR____SFAutoFillInputView__landscapeKeyboardSize;
  }
  uint64_t v4 = (double *)((char *)self + *v3);
  double v5 = *v4;
  double v6 = v4[1];
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)_updateKeyboardMetricsAndInterfaceOrientationIfNeeded
{
  int64_t v3 = [(id)*MEMORY[0x1E4FB2608] interfaceOrientation];
  if (v3 != self->_currentInterfaceOrientation)
  {
    self->_currentInterfaceOrientation = v3;
    uint64_t v4 = +[_SFKeyboardGeometry keyboardGeometryForInterfaceOrientation:1];
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

- (void)streamlinedAutoFillViewControllerFillCredential:(id)a3
{
}

- (void)streamlinedAutoFillViewControllerShowKeyboard:(id)a3
{
}

- (void)streamlinedAutoFillViewControllerShowOtherPasswords:(id)a3
{
}

- (void)streamlinedStrongPasswordViewControllerShowKeyboard:(id)a3
{
}

- (void)streamlinedStrongPasswordViewControllerShowOtherPasswords:(id)a3
{
}

- (void)streamlinedStrongPasswordViewController:(id)a3 shouldFillStrongPasswordWithFormat:(unint64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained autoFillStrongPasswordWithFormat:a4];
}

- (void)streamlinedStrongPasswordViewControllerDeclinedStrongPassword:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained autoFillInputViewShouldClose:self];
}

- (_SFAutoFillInputViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFAutoFillInputViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_streamlinedStrongPasswordViewController, 0);
  objc_storeStrong((id *)&self->_streamlinedAutoFillViewController, 0);
  objc_storeStrong((id *)&self->_strongPasswordIntroductionViewController, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_dynamicConstraints, 0);
  objc_storeStrong((id *)&self->_fillCredentialButton, 0);
  objc_storeStrong((id *)&self->_otherPasswordsButton, 0);
  objc_storeStrong((id *)&self->_keyboardButton, 0);
  objc_storeStrong((id *)&self->_explanationLabel, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_credentialSource, 0);
  objc_storeStrong((id *)&self->_hostString, 0);

  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end