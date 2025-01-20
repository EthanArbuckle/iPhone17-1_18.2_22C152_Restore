@interface LACUIPasscodeField
- (BOOL)_hasAlphanumericPasscode;
- (BOOL)_shouldShowSubmitButton;
- (BOOL)_useDotPattern;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canShowInLockScreen;
- (BOOL)hasAlphanumericPasscode;
- (BOOL)ignoreInputs;
- (BOOL)resignFirstResponder;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (LACUIPasscodeField)initWithStyle:(int64_t)a3;
- (LACUIPasscodeFieldDelegate)delegate;
- (LAUITextField)passcodeField;
- (NSString)placeholderText;
- (id)_alphanumericFieldPlaceholder;
- (id)textField:(id)a3 editMenuForCharactersInRange:(_NSRange)a4 suggestedActions:(id)a5;
- (int64_t)_alphanumericFieldTextAlignment;
- (int64_t)style;
- (unint64_t)_passcodeLength;
- (unint64_t)passcodeLength;
- (void)_handleTraitChanges;
- (void)_notifyPasscodeFieldLengthChange;
- (void)_selectPasscodeField:(id)a3;
- (void)_setup;
- (void)_updateDotPattern;
- (void)_verifyTextField:(id)a3;
- (void)clear;
- (void)loadView;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setAcceptInputs:(BOOL)a3;
- (void)setCanShowInLockScreen:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIgnoreInputs:(BOOL)a3;
- (void)setPasscodeField:(id)a3;
- (void)setPlaceholderText:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)shakeWithCompletion:(id)a3;
- (void)submit;
- (void)textFieldDidChange:(id)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation LACUIPasscodeField

- (LACUIPasscodeField)initWithStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LACUIPasscodeField;
  result = [(LACUIPasscodeField *)&v5 init];
  if (result) {
    result->_style = a3;
  }
  return result;
}

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x263F82E00]);
  [(LACUIPasscodeField *)self setView:v3];

  v4 = [(LACUIPasscodeField *)self view];
  objc_super v5 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__selectPasscodeField_];
  [v4 addGestureRecognizer:v5];

  [(LACUIPasscodeField *)self _setup];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LACUIPasscodeField;
  [(LACUIPasscodeField *)&v6 viewWillDisappear:a3];
  v4 = [(LACUIPasscodeField *)self passcodeField];
  [v4 setText:&stru_270434680];

  objc_super v5 = [(LACUIPasscodeField *)self passcodeField];
  [v5 endEditing:1];
}

- (BOOL)canBecomeFirstResponder
{
  v2 = [(LACUIPasscodeField *)self passcodeField];
  char v3 = [v2 canBecomeFirstResponder];

  return v3;
}

- (BOOL)becomeFirstResponder
{
  v2 = [(LACUIPasscodeField *)self passcodeField];
  char v3 = [v2 becomeFirstResponder];

  return v3;
}

- (BOOL)resignFirstResponder
{
  v2 = [(LACUIPasscodeField *)self passcodeField];
  char v3 = [v2 resignFirstResponder];

  return v3;
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(LACUIPasscodeField *)self _setup];
    [(LACUIPasscodeField *)self _notifyPasscodeFieldLengthChange];
  }
}

- (void)setAcceptInputs:(BOOL)a3
{
  [(LACUIPasscodeField *)self setIgnoreInputs:!a3];
  if (![(LACUIPasscodeField *)self _useDotPattern])
  {
    BOOL v4 = [(LACUIPasscodeField *)self ignoreInputs];
    if (v4)
    {
      id v6 = [MEMORY[0x263F825C8] clearColor];
    }
    else
    {
      id v6 = 0;
    }
    objc_super v5 = [(LACUIPasscodeField *)self passcodeField];
    [v5 setTintColor:v6];

    if (v4)
    {
    }
  }
}

- (void)shakeWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    v4[2](v4);
  }
  else
  {
    CGAffineTransformMakeTranslation(&v13, 30.0, 0.0);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeFieldContainer);
    CGAffineTransform v12 = v13;
    [WeakRetained setTransform:&v12];

    [(UIImpactFeedbackGenerator *)self->_hapticGenerator impactOccurred];
    objc_initWeak(&location, self);
    id v6 = (void *)MEMORY[0x263F82E00];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __42__LACUIPasscodeField_shakeWithCompletion___block_invoke;
    v9[3] = &unk_2653BCC28;
    objc_copyWeak(&v10, &location);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __42__LACUIPasscodeField_shakeWithCompletion___block_invoke_2;
    v7[3] = &unk_2653BCC50;
    v8 = v4;
    [v6 animateWithDuration:0 delay:v9 usingSpringWithDamping:v7 initialSpringVelocity:0.4 options:0.0 animations:0.03 completion:1.2];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __42__LACUIPasscodeField_shakeWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(WeakRetained + 123);
    long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v5[0] = *MEMORY[0x263F000D0];
    v5[1] = v4;
    v5[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [v3 setTransform:v5];
  }
}

uint64_t __42__LACUIPasscodeField_shakeWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)submit
{
  id v3 = [(LACUIPasscodeField *)self passcodeField];
  [(LACUIPasscodeField *)self _verifyTextField:v3];
}

- (void)clear
{
  id v3 = [(LACUIPasscodeField *)self passcodeField];
  long long v4 = [v3 text];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    id v6 = [(LACUIPasscodeField *)self passcodeField];
    [v6 setText:&stru_270434680];

    [(LACUIPasscodeField *)self _notifyPasscodeFieldLengthChange];
  }
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return ![(LACUIPasscodeField *)self ignoreInputs];
}

- (void)textFieldDidChange:(id)a3
{
  id v4 = a3;
  if ((id)objc_claimAutoreleasedReturnValue() ! = [(LACUIPasscodeField *)self passcodeField]; {
    -[LACUIPasscodeField textFieldDidChange:]();
  }

  [(LACUIPasscodeField *)self _notifyPasscodeFieldLengthChange];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  if ((id)objc_claimAutoreleasedReturnValue() ! = [(LACUIPasscodeField *)self passcodeField]; {
    -[LACUIPasscodeField textFieldShouldReturn:]();
  }

  if (![(LACUIPasscodeField *)self ignoreInputs]) {
    [(LACUIPasscodeField *)self _verifyTextField:v4];
  }

  return 0;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  if ((id)objc_claimAutoreleasedReturnValue() ! = [(LACUIPasscodeField *)self passcodeField]; {
    -[LACUIPasscodeField textField:shouldChangeCharactersInRange:replacementString:]();
  }

  if (![(LACUIPasscodeField *)self ignoreInputs])
  {
    if ([(LACUIPasscodeField *)self _hasAlphanumericPasscode]
      || ([MEMORY[0x263F08708] decimalDigitCharacterSet],
          v11 = objc_claimAutoreleasedReturnValue(),
          [v10 stringByTrimmingCharactersInSet:v11],
          CGAffineTransform v12 = objc_claimAutoreleasedReturnValue(),
          uint64_t v13 = [v12 length],
          v12,
          v11,
          !v13))
    {
      v14 = [v9 text];
      unint64_t v15 = [v14 length];
      if (v15 >= [(LACUIPasscodeField *)self _passcodeLength])
      {
        unint64_t v16 = [(LACUIPasscodeField *)self _passcodeLength];

        if (v16) {
          goto LABEL_9;
        }
      }
      else
      {
      }
      v17 = [v9 text];
      v18 = objc_msgSend(v17, "stringByReplacingCharactersInRange:withString:", location, length, v10);
      [v9 setText:v18];

      [(LACUIPasscodeField *)self _notifyPasscodeFieldLengthChange];
LABEL_9:
      v19 = [v9 text];
      unint64_t v20 = [v19 length];
      unint64_t v21 = [(LACUIPasscodeField *)self _passcodeLength];

      if (v20 >= v21) {
        [(LACUIPasscodeField *)self _verifyTextField:v9];
      }
    }
  }

  return 0;
}

- (id)textField:(id)a3 editMenuForCharactersInRange:(_NSRange)a4 suggestedActions:(id)a5
{
  uint64_t v5 = (void *)MEMORY[0x263F82940];
  id v6 = objc_msgSend(MEMORY[0x263EFF8C0], "array", a3, a4.location, a4.length, a5);
  v7 = [v5 menuWithChildren:v6];

  return v7;
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 allObjects];
  id v9 = [v8 firstObject];
  id v10 = [v9 key];
  uint64_t v11 = [v10 keyCode];

  if (v11 == 40 && ![(LACUIPasscodeField *)self ignoreInputs])
  {
    [(LACUIPasscodeField *)self submit];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)LACUIPasscodeField;
    [(LACUIPasscodeField *)&v12 pressesEnded:v6 withEvent:v7];
  }
}

- (void)_selectPasscodeField:(id)a3
{
  if ([a3 numberOfTouches] == 1 && !-[LACUIPasscodeField ignoreInputs](self, "ignoreInputs"))
  {
    [(LACUIPasscodeField *)self becomeFirstResponder];
  }
}

- (void)_setup
{
  v103[4] = *MEMORY[0x263EF8340];
  p_mainContainer = &self->_mainContainer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainContainer);
  [WeakRetained removeFromSuperview];

  id v5 = objc_alloc_init(MEMORY[0x263F82BF8]);
  objc_storeWeak((id *)p_mainContainer, v5);
  [v5 setAxis:0];
  [v5 setAlignment:3];
  v96 = v5;
  [v5 setSpacing:8.0];
  id v6 = [(LACUIPasscodeField *)self view];
  [v6 addSubview:v5];

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v7 = [v5 topAnchor];
  v8 = [(LACUIPasscodeField *)self view];
  id v9 = [v8 topAnchor];
  id v10 = [v7 constraintEqualToAnchor:v9];
  [v10 setActive:1];

  uint64_t v11 = [v96 bottomAnchor];
  objc_super v12 = [(LACUIPasscodeField *)self view];
  uint64_t v13 = [v12 bottomAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  [v14 setActive:1];

  unint64_t v15 = [v96 leadingAnchor];
  unint64_t v16 = [(LACUIPasscodeField *)self view];
  v17 = [v16 leadingAnchor];
  v18 = [v15 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  v19 = [v96 trailingAnchor];
  unint64_t v20 = [(LACUIPasscodeField *)self view];
  unint64_t v21 = [v20 trailingAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  [v22 setActive:1];

  v23 = (UIImpactFeedbackGenerator *)[objc_alloc(MEMORY[0x263F82830]) initWithStyle:2];
  hapticGenerator = self->_hapticGenerator;
  self->_hapticGenerator = v23;

  [(UIImpactFeedbackGenerator *)self->_hapticGenerator prepare];
  id v25 = objc_alloc_init(MEMORY[0x263F82E00]);
  objc_storeWeak((id *)&self->_passcodeFieldContainer, v25);
  [v96 addArrangedSubview:v25];
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
  v98 = v25;
  v26 = [v25 heightAnchor];
  v27 = [v26 constraintGreaterThanOrEqualToConstant:60.0];
  [v27 setActive:1];

  v97 = [MEMORY[0x263F824E8] buttonWithType:1];
  v28 = [MEMORY[0x263F827E8] systemImageNamed:@"arrow.forward.circle"];
  [v97 setImage:v28 forState:0];

  [v97 addTarget:self action:sel_submit forControlEvents:64];
  v29 = [MEMORY[0x263F825C8] systemRedColor];
  [v97 setTintColor:v29];

  [v98 addSubview:v97];
  [v97 setTranslatesAutoresizingMaskIntoConstraints:0];
  v92 = (void *)MEMORY[0x263F08938];
  v95 = [v97 widthAnchor];
  v94 = [v95 constraintEqualToConstant:40.0];
  v103[0] = v94;
  v93 = [v97 heightAnchor];
  v30 = [v97 widthAnchor];
  v31 = [v93 constraintEqualToAnchor:v30];
  v103[1] = v31;
  v32 = [v97 trailingAnchor];
  v33 = [v98 trailingAnchor];
  v34 = [v32 constraintEqualToAnchor:v33];
  v103[2] = v34;
  v35 = [v97 centerYAnchor];
  v36 = [v98 centerYAnchor];
  v37 = [v35 constraintEqualToAnchor:v36];
  v103[3] = v37;
  v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v103 count:4];
  [v92 activateConstraints:v38];

  [v97 _setCornerRadius:20.0];
  objc_msgSend(v97, "setHidden:", -[LACUIPasscodeField _shouldShowSubmitButton](self, "_shouldShowSubmitButton") ^ 1);
  v39 = objc_alloc_init(LAUITextField);
  objc_storeWeak((id *)&self->_passcodeField, v39);
  [(LAUITextField *)v39 setShouldHideEditMenu:[(LACUIPasscodeField *)self _hasAlphanumericPasscode] ^ 1];
  [(LAUITextField *)v39 disablePrediction];
  [(LAUITextField *)v39 setDelegate:self];
  [(LAUITextField *)v39 setDevicePasscodeEntry:1];
  [(LAUITextField *)v39 setSecureTextEntry:1];
  [(LAUITextField *)v39 setTextContentType:*MEMORY[0x263F83A60]];
  [(LAUITextField *)v39 setAutocapitalizationType:0];
  [(LAUITextField *)v39 setAutocorrectionType:1];
  v40 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83618]];
  [(LAUITextField *)v39 setFont:v40];

  v41 = [(LACUIPasscodeField *)self _alphanumericFieldPlaceholder];
  [(LAUITextField *)v39 setAttributedPlaceholder:v41];

  [(LAUITextField *)v39 setTextAlignment:[(LACUIPasscodeField *)self _alphanumericFieldTextAlignment]];
  v42 = [MEMORY[0x263F825C8] labelColor];
  [(LAUITextField *)v39 setTextColor:v42];

  [(LAUITextField *)v39 setReturnKeyType:9];
  if ([(LACUIPasscodeField *)self _hasAlphanumericPasscode])
  {
    uint64_t v43 = 0;
  }
  else
  {
    v44 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v45 = [v44 userInterfaceIdiom];

    if ((v45 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      uint64_t v43 = 4;
    }
    else {
      uint64_t v43 = 127;
    }
  }
  [(LAUITextField *)v39 setKeyboardType:v43];
  v46 = [(LACUIPasscodeField *)self traitCollection];
  if ([v46 userInterfaceStyle] == 2) {
    [MEMORY[0x263F825C8] quaternaryLabelColor];
  }
  else {
  id v47 = [MEMORY[0x263F825C8] systemLightGrayTintColor];
  }
  uint64_t v48 = [v47 CGColor];
  v49 = [v98 layer];
  [v49 setBackgroundColor:v48];

  v50 = [v98 layer];
  [v50 setCornerRadius:10.0];

  [(LAUITextField *)v39 addTarget:self action:sel_textFieldDidChange_ forControlEvents:0x20000];
  [v98 addSubview:v39];
  [(LAUITextField *)v39 setTranslatesAutoresizingMaskIntoConstraints:0];
  v51 = [(LAUITextField *)v39 topAnchor];
  v52 = [v98 topAnchor];
  v53 = [v51 constraintEqualToAnchor:v52 constant:15.0];
  [v53 setActive:1];

  v54 = [(LAUITextField *)v39 bottomAnchor];
  v55 = [v98 bottomAnchor];
  v56 = [v54 constraintEqualToAnchor:v55 constant:-15.0];
  [v56 setActive:1];

  v57 = [(LAUITextField *)v39 leadingAnchor];
  v58 = [v98 leadingAnchor];
  v59 = [v57 constraintEqualToAnchor:v58 constant:15.0];
  [v59 setActive:1];

  v60 = [(LAUITextField *)v39 trailingAnchor];
  v61 = [v98 trailingAnchor];
  BOOL v62 = [(LACUIPasscodeField *)self _shouldShowSubmitButton];
  double v63 = -40.0;
  if (!v62) {
    double v63 = -15.0;
  }
  v64 = [v60 constraintEqualToAnchor:v61 constant:v63];
  [v64 setActive:1];

  if ([(LACUIPasscodeField *)self _useDotPattern])
  {
    id v65 = objc_loadWeakRetained((id *)&self->_passcodeFieldContainer);
    v66 = [v65 layer];
    id v67 = [MEMORY[0x263F825C8] clearColor];
    objc_msgSend(v66, "setBackgroundColor:", objc_msgSend(v67, "CGColor"));

    id v68 = objc_alloc_init(MEMORY[0x263F82BF8]);
    objc_storeWeak((id *)&self->_passcodeFieldBackground, v68);
    [v68 setAxis:0];
    [v68 setSpacing:21.0];
    [v68 setSemanticContentAttribute:3];
    if ([(LACUIPasscodeField *)self _passcodeLength])
    {
      unint64_t v69 = 0;
      do
      {
        id v70 = objc_alloc_init(MEMORY[0x263F82E00]);
        v71 = [(LACUIPasscodeField *)self traitCollection];
        if ([v71 userInterfaceStyle] == 2) {
          [MEMORY[0x263F825C8] labelColor];
        }
        else {
        id v72 = [MEMORY[0x263F825C8] secondaryLabelColor];
        }
        uint64_t v73 = [v72 CGColor];
        v74 = [v70 layer];
        [v74 setBorderColor:v73];

        v75 = [v70 layer];
        [v75 setBorderWidth:1.25];

        v76 = [v70 layer];
        [v76 setCornerRadius:10.0];

        [v68 addArrangedSubview:v70];
        [v70 setTranslatesAutoresizingMaskIntoConstraints:0];
        v77 = [v70 widthAnchor];
        v78 = [v77 constraintEqualToConstant:20.0];
        [v78 setActive:1];

        v79 = [v70 heightAnchor];
        v80 = [v79 constraintEqualToConstant:20.0];
        [v80 setActive:1];

        ++v69;
      }
      while (v69 < [(LACUIPasscodeField *)self _passcodeLength]);
    }
    [v98 addSubview:v68];
    [v68 setTranslatesAutoresizingMaskIntoConstraints:0];
    v81 = [v68 centerXAnchor];
    v82 = [v98 centerXAnchor];
    v83 = [v81 constraintEqualToAnchor:v82];
    [v83 setActive:1];

    v84 = [v68 centerYAnchor];
    v85 = [v98 centerYAnchor];
    v86 = [v84 constraintEqualToAnchor:v85];
    [v86 setActive:1];

    [(LAUITextField *)v39 setShouldHideSelectionRects:1];
    v87 = [MEMORY[0x263F825C8] clearColor];
    [(LAUITextField *)v39 setTintColor:v87];

    v88 = [MEMORY[0x263F825C8] clearColor];
    [(LAUITextField *)v39 setTextColor:v88];
  }
  objc_initWeak(&from, self);
  v89 = self;
  v102 = v89;
  v90 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v102 count:1];
  v99[0] = MEMORY[0x263EF8330];
  v99[1] = 3221225472;
  v99[2] = __28__LACUIPasscodeField__setup__block_invoke;
  v99[3] = &unk_2653BCC78;
  objc_copyWeak(&v100, &from);
  id v91 = (id)[(LACUIPasscodeField *)self registerForTraitChanges:v90 withHandler:v99];

  objc_destroyWeak(&v100);
  objc_destroyWeak(&from);
}

void __28__LACUIPasscodeField__setup__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleTraitChanges];
}

- (BOOL)_useDotPattern
{
  return [(LACUIPasscodeField *)self _passcodeLength] != -1
      && [(LACUIPasscodeField *)self _passcodeLength] < 7;
}

- (void)_updateDotPattern
{
  if ([(LACUIPasscodeField *)self _useDotPattern])
  {
    id v3 = [(LACUIPasscodeField *)self traitCollection];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __39__LACUIPasscodeField__updateDotPattern__block_invoke;
    v4[3] = &unk_2653BCBE0;
    v4[4] = self;
    [v3 performAsCurrentTraitCollection:v4];
  }
}

unint64_t __39__LACUIPasscodeField__updateDotPattern__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) passcodeField];
  id v3 = [v2 text];
  unint64_t v4 = [v3 length];

  unint64_t result = [*(id *)(a1 + 32) _passcodeLength];
  if (result)
  {
    for (unint64_t i = 0; i < result; ++i)
    {
      if (i >= v4) {
        [MEMORY[0x263F825C8] clearColor];
      }
      else {
      id v7 = [MEMORY[0x263F825C8] labelColor];
      }
      v8 = [*(id *)(a1 + 32) traitCollection];
      if ([v8 userInterfaceStyle] == 2) {
        [MEMORY[0x263F825C8] labelColor];
      }
      else {
      id v9 = [MEMORY[0x263F825C8] secondaryLabelColor];
      }

      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 992));
      uint64_t v11 = [WeakRetained arrangedSubviews];
      objc_super v12 = [v11 objectAtIndex:i];

      uint64_t v13 = [v12 layer];
      id v14 = v7;
      objc_msgSend(v13, "setBackgroundColor:", objc_msgSend(v14, "CGColor"));

      unint64_t v15 = [v12 layer];
      id v16 = v9;
      objc_msgSend(v15, "setBorderColor:", objc_msgSend(v16, "CGColor"));

      unint64_t result = [*(id *)(a1 + 32) _passcodeLength];
    }
  }
  return result;
}

- (BOOL)_shouldShowSubmitButton
{
  return 0;
}

- (unint64_t)_passcodeLength
{
  int64_t style = self->_style;
  unint64_t v3 = 4;
  if (style != 1) {
    unint64_t v3 = -1;
  }
  if (style == 2) {
    return 6;
  }
  else {
    return v3;
  }
}

- (BOOL)_hasAlphanumericPasscode
{
  return self->_style == 0;
}

- (int64_t)_alphanumericFieldTextAlignment
{
  return 1;
}

- (id)_alphanumericFieldPlaceholder
{
  v15[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v4 = [(LACUIPasscodeField *)self placeholderText];
  id v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = &stru_270434680;
  }
  uint64_t v7 = *MEMORY[0x263F81540];
  v13[4] = self;
  v14[0] = v7;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__LACUIPasscodeField__alphanumericFieldPlaceholder__block_invoke;
  v13[3] = &unk_2653BCCA0;
  v8 = __51__LACUIPasscodeField__alphanumericFieldPlaceholder__block_invoke((uint64_t)v13);
  v15[0] = v8;
  v14[1] = *MEMORY[0x263F814F0];
  id v9 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  v15[1] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  uint64_t v11 = (void *)[v3 initWithString:v6 attributes:v10];

  return v11;
}

id __51__LACUIPasscodeField__alphanumericFieldPlaceholder__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F81650]);
  objc_msgSend(v2, "setAlignment:", objc_msgSend(*(id *)(a1 + 32), "_alphanumericFieldTextAlignment"));
  return v2;
}

- (void)_verifyTextField:(id)a3
{
  id v4 = a3;
  id v6 = [(LACUIPasscodeField *)self delegate];
  id v5 = [v4 text];

  [v6 passcodeField:self didSubmitPasscode:v5];
}

- (void)_notifyPasscodeFieldLengthChange
{
  id v3 = [(LACUIPasscodeField *)self delegate];
  id v4 = [(LACUIPasscodeField *)self passcodeField];
  id v5 = [v4 text];
  objc_msgSend(v3, "passcodeField:didChangePasscodeLength:", self, objc_msgSend(v5, "length"));

  [(LACUIPasscodeField *)self _updateDotPattern];
}

- (void)_handleTraitChanges
{
  if ([(LACUIPasscodeField *)self _useDotPattern])
  {
    [(LACUIPasscodeField *)self _updateDotPattern];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeFieldContainer);
    id v3 = [WeakRetained layer];
    id v4 = [MEMORY[0x263F825C8] clearColor];
    objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeFieldContainer);
    id v3 = [WeakRetained layer];
    id v4 = [(LACUIPasscodeField *)self traitCollection];
    if ([v4 userInterfaceStyle] == 2) {
      [MEMORY[0x263F825C8] quaternaryLabelColor];
    }
    else {
    id v5 = [MEMORY[0x263F825C8] systemLightGrayTintColor];
    }
    objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));
  }
}

- (NSString)placeholderText
{
  return self->_placeholderText;
}

- (void)setPlaceholderText:(id)a3
{
}

- (LACUIPasscodeFieldDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (LACUIPasscodeFieldDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)canShowInLockScreen
{
  return self->_canShowInLockScreen;
}

- (void)setCanShowInLockScreen:(BOOL)a3
{
  self->_canShowInLockScreen = a3;
}

- (BOOL)ignoreInputs
{
  return self->_ignoreInputs;
}

- (void)setIgnoreInputs:(BOOL)a3
{
  self->_ignoreInputs = a3;
}

- (LAUITextField)passcodeField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeField);
  return (LAUITextField *)WeakRetained;
}

- (void)setPasscodeField:(id)a3
{
}

- (unint64_t)passcodeLength
{
  return self->_passcodeLength;
}

- (BOOL)hasAlphanumericPasscode
{
  return self->_hasAlphanumericPasscode;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_passcodeField);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeholderText, 0);
  objc_storeStrong((id *)&self->_hapticGenerator, 0);
  objc_destroyWeak((id *)&self->_passcodeFieldBackground);
  objc_destroyWeak((id *)&self->_passcodeFieldContainer);
  objc_destroyWeak((id *)&self->_mainContainer);
}

- (void)textFieldDidChange:.cold.1()
{
  __assert_rtn("-[LACUIPasscodeField textFieldDidChange:]", "LACUIPasscodeField.m", 176, "textField == self.passcodeField");
}

- (void)textFieldShouldReturn:.cold.1()
{
  __assert_rtn("-[LACUIPasscodeField textFieldShouldReturn:]", "LACUIPasscodeField.m", 182, "textField == self.passcodeField");
}

- (void)textField:shouldChangeCharactersInRange:replacementString:.cold.1()
{
  __assert_rtn("-[LACUIPasscodeField textField:shouldChangeCharactersInRange:replacementString:]", "LACUIPasscodeField.m", 192, "textField == self.passcodeField");
}

@end