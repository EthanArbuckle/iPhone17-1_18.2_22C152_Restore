@interface HUPinCodeEditorViewController
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (HFItem)sourceItem;
- (HFPinCodeManager)pinCodeManager;
- (HMHome)home;
- (HUPinCodeEditorViewController)initWithCoder:(id)a3;
- (HUPinCodeEditorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (HUPresentationDelegate)presentationDelegate;
- (NSString)editedPinCode;
- (UIBarButtonItem)saveButtonItem;
- (UILabel)footerLabel;
- (UILabel)instructionHeader;
- (UITextField)textField;
- (id)checkForPINCodeValueValidationErrors;
- (id)commitPinCodeChange;
- (id)initForCreatingNewPinCodeWithManager:(id)a3 initialPinCodeValue:(id)a4 home:(id)a5 completionBlock:(id)a6;
- (id)initForEditingPinCodeWithItem:(id)a3 pinCodeManager:(id)a4 pinCodeValue:(id)a5 home:(id)a6 completionBlock:(id)a7;
- (id)newPINCodeCompletionBlock;
- (id)updatedPINCodeCompletionBlock;
- (int64_t)codeLengthMax;
- (int64_t)codeLengthMin;
- (void)_commonInitWithManager:(id)a3 home:(id)a4 initialPinCodeValue:(id)a5;
- (void)_hideSpinner;
- (void)_showSpinner;
- (void)_updateHeaderAndFooter;
- (void)cancelButtonPressed:(id)a3;
- (void)saveButtonPressed:(id)a3;
- (void)setCodeLengthMax:(int64_t)a3;
- (void)setCodeLengthMin:(int64_t)a3;
- (void)setEditedPinCode:(id)a3;
- (void)setFooterLabel:(id)a3;
- (void)setHome:(id)a3;
- (void)setInstructionHeader:(id)a3;
- (void)setNewPINCodeCompletionBlock:(id)a3;
- (void)setPinCodeManager:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setSaveButtonItem:(id)a3;
- (void)setSourceItem:(id)a3;
- (void)setTextField:(id)a3;
- (void)setUpdatedPINCodeCompletionBlock:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HUPinCodeEditorViewController

- (void)_commonInitWithManager:(id)a3 home:(id)a4 initialPinCodeValue:(id)a5
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(HUPinCodeEditorViewController *)self setHome:v9];
  [(HUPinCodeEditorViewController *)self setPinCodeManager:v8];
  [(HUPinCodeEditorViewController *)self setCodeLengthMin:4];
  [(HUPinCodeEditorViewController *)self setCodeLengthMax:8];
  id v11 = objc_alloc(MEMORY[0x1E4F42B38]);
  double v12 = *MEMORY[0x1E4F1DB28];
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v16 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], v13, v14, v15);
  [(HUPinCodeEditorViewController *)self setInstructionHeader:v16];

  uint64_t v17 = *MEMORY[0x1E4F438C8];
  v18 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438C8]];
  v19 = [(HUPinCodeEditorViewController *)self instructionHeader];
  [v19 setFont:v18];

  v20 = [(HUPinCodeEditorViewController *)self instructionHeader];
  [v20 setNumberOfLines:0];

  v21 = [(HUPinCodeEditorViewController *)self instructionHeader];
  [v21 setTextAlignment:1];

  v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v12, v13, v14, v15);
  [(HUPinCodeEditorViewController *)self setFooterLabel:v22];

  v23 = [(HUPinCodeEditorViewController *)self footerLabel];
  [v23 setNumberOfLines:0];

  v24 = [(HUPinCodeEditorViewController *)self footerLabel];
  [v24 setTextAlignment:1];

  v25 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:v17];
  v26 = [(HUPinCodeEditorViewController *)self footerLabel];
  [v26 setFont:v25];

  v27 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  v28 = [(HUPinCodeEditorViewController *)self footerLabel];
  [v28 setTextColor:v27];

  [(HUPinCodeEditorViewController *)self _updateHeaderAndFooter];
  if (!numberFormatter)
  {
    id v29 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    v30 = (void *)numberFormatter;
    numberFormatter = (uint64_t)v29;

    v31 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    [(id)numberFormatter setLocale:v31];

    [(id)numberFormatter setNumberStyle:0];
  }
  v32 = -[HUPaddedTextField initWithFrame:]([HUPaddedTextField alloc], "initWithFrame:", v12, v13, v14, v15);
  [(HUPinCodeEditorViewController *)self setTextField:v32];

  uint64_t v55 = *MEMORY[0x1E4F42520];
  v56[0] = &unk_1F19B65B0;
  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
  v34 = [(HUPinCodeEditorViewController *)self textField];
  [v34 setDefaultTextAttributes:v33];

  v35 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438B8]];
  v36 = [(HUPinCodeEditorViewController *)self textField];
  [v36 setFont:v35];

  v37 = [MEMORY[0x1E4F428B8] labelColor];
  v38 = [(HUPinCodeEditorViewController *)self textField];
  [v38 setTextColor:v37];

  v39 = [(HUPinCodeEditorViewController *)self textField];
  [v39 setDelegate:self];

  v40 = [(HUPinCodeEditorViewController *)self textField];
  [v40 setBorderStyle:3];

  v41 = [(HUPinCodeEditorViewController *)self textField];
  [v41 setClearButtonMode:0];

  v42 = [(HUPinCodeEditorViewController *)self textField];
  [v42 setTextAlignment:1];

  v43 = [(HUPinCodeEditorViewController *)self textField];
  [v43 setEnabled:1];

  v44 = [(HUPinCodeEditorViewController *)self textField];
  [v44 setKeyboardType:4];

  v45 = [(HUPinCodeEditorViewController *)self textField];
  v46 = [v45 layer];
  [v46 setDisableUpdateMask:16];

  uint64_t v47 = [v10 length];
  [(id)numberFormatter setMinimumIntegerDigits:v47];
  v48 = [(id)numberFormatter numberFromString:v10];
  v49 = [(id)numberFormatter stringForObjectValue:v48];
  v50 = [(HUPinCodeEditorViewController *)self textField];
  [v50 setText:v49];

  v51 = [(HUPinCodeEditorViewController *)self textField];
  [v51 sizeToFit];

  objc_initWeak(&location, self);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __81__HUPinCodeEditorViewController__commonInitWithManager_home_initialPinCodeValue___block_invoke;
  v52[3] = &unk_1E6392750;
  objc_copyWeak(&v53, &location);
  [v8 fetchPinCodeConstraints:v52];
  objc_destroyWeak(&v53);
  objc_destroyWeak(&location);
}

void __81__HUPinCodeEditorViewController__commonInitWithManager_home_initialPinCodeValue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setCodeLengthMin:a2];
  [WeakRetained setCodeLengthMax:a3];
  [WeakRetained _updateHeaderAndFooter];
}

- (id)initForEditingPinCodeWithItem:(id)a3 pinCodeManager:(id)a4 pinCodeValue:(id)a5 home:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)HUPinCodeEditorViewController;
  uint64_t v17 = [(HUPinCodeEditorViewController *)&v20 initWithNibName:0 bundle:0];
  v18 = v17;
  if (v17)
  {
    [(HUPinCodeEditorViewController *)v17 setSourceItem:v12];
    [(HUPinCodeEditorViewController *)v18 _commonInitWithManager:v13 home:v15 initialPinCodeValue:v14];
    [(HUPinCodeEditorViewController *)v18 setUpdatedPINCodeCompletionBlock:v16];
  }

  return v18;
}

- (id)initForCreatingNewPinCodeWithManager:(id)a3 initialPinCodeValue:(id)a4 home:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HUPinCodeEditorViewController;
  id v14 = [(HUPinCodeEditorViewController *)&v17 initWithNibName:0 bundle:0];
  id v15 = v14;
  if (v14)
  {
    [(HUPinCodeEditorViewController *)v14 _commonInitWithManager:v10 home:v12 initialPinCodeValue:v11];
    [(HUPinCodeEditorViewController *)v15 setNewPINCodeCompletionBlock:v13];
  }

  return v15;
}

- (HUPinCodeEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initForEditingPinCodeWithItem_pinCodeManager_pinCodeValue_home_completionBlock_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUPinCodeEditorViewController.m", 159, @"%s is unavailable; use %@ instead",
    "-[HUPinCodeEditorViewController initWithNibName:bundle:]",
    v7);

  return 0;
}

- (HUPinCodeEditorViewController)initWithCoder:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initForEditingPinCodeWithItem_pinCodeManager_pinCodeValue_home_completionBlock_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUPinCodeEditorViewController.m", 164, @"%s is unavailable; use %@ instead",
    "-[HUPinCodeEditorViewController initWithCoder:]",
    v6);

  return 0;
}

- (void)viewDidLoad
{
  v88.receiver = self;
  v88.super_class = (Class)HUPinCodeEditorViewController;
  [(HUPinCodeEditorViewController *)&v88 viewDidLoad];
  v3 = _HULocalizedStringWithDefaultValue(@"HUPinCodeEditorViewControllerTitle", @"HUPinCodeEditorViewControllerTitle", 1);
  [(HUPinCodeEditorViewController *)self setTitle:v3];

  v4 = [MEMORY[0x1E4F428B8] systemGroupedBackgroundColor];
  v5 = [(HUPinCodeEditorViewController *)self view];
  [v5 setBackgroundColor:v4];

  v6 = [(HUPinCodeEditorViewController *)self view];
  v7 = [(HUPinCodeEditorViewController *)self instructionHeader];
  [v6 addSubview:v7];

  id v8 = [(HUPinCodeEditorViewController *)self view];
  id v9 = [(HUPinCodeEditorViewController *)self textField];
  [v8 addSubview:v9];

  id v10 = [(HUPinCodeEditorViewController *)self view];
  id v11 = [(HUPinCodeEditorViewController *)self footerLabel];
  [v10 addSubview:v11];

  id v12 = [(HUPinCodeEditorViewController *)self view];
  [v12 setAccessibilityIdentifier:@"Home.Locks.PinCode.Editor"];

  id v13 = [(HUPinCodeEditorViewController *)self instructionHeader];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v14 = [(HUPinCodeEditorViewController *)self textField];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v15 = [(HUPinCodeEditorViewController *)self footerLabel];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v16 = [MEMORY[0x1E4F1CA48] array];
  objc_super v17 = [(HUPinCodeEditorViewController *)self textField];
  v18 = [v17 bottomAnchor];
  v19 = [(HUPinCodeEditorViewController *)self view];
  objc_super v20 = [v19 centerYAnchor];
  v21 = [v18 constraintEqualToAnchor:v20 constant:-60.0];
  [v16 addObject:v21];

  v22 = [(HUPinCodeEditorViewController *)self textField];
  v23 = [v22 leadingAnchor];
  v24 = [(HUPinCodeEditorViewController *)self view];
  v25 = [v24 layoutMarginsGuide];
  v26 = [v25 leadingAnchor];
  v27 = [v23 constraintEqualToAnchor:v26];
  [v16 addObject:v27];

  v28 = [(HUPinCodeEditorViewController *)self textField];
  id v29 = [v28 trailingAnchor];
  v30 = [(HUPinCodeEditorViewController *)self view];
  v31 = [v30 layoutMarginsGuide];
  v32 = [v31 trailingAnchor];
  v33 = [v29 constraintEqualToAnchor:v32];
  [v16 addObject:v33];

  v34 = [(HUPinCodeEditorViewController *)self instructionHeader];
  v35 = [v34 leadingAnchor];
  v36 = [(HUPinCodeEditorViewController *)self view];
  v37 = [v36 layoutMarginsGuide];
  v38 = [v37 leadingAnchor];
  v39 = [v35 constraintEqualToAnchor:v38 constant:10.0];
  [v16 addObject:v39];

  v40 = [(HUPinCodeEditorViewController *)self instructionHeader];
  v41 = [v40 trailingAnchor];
  v42 = [(HUPinCodeEditorViewController *)self view];
  v43 = [v42 layoutMarginsGuide];
  v44 = [v43 trailingAnchor];
  v45 = [v41 constraintEqualToAnchor:v44 constant:-10.0];
  [v16 addObject:v45];

  v46 = [(HUPinCodeEditorViewController *)self instructionHeader];
  uint64_t v47 = [v46 centerXAnchor];
  v48 = [(HUPinCodeEditorViewController *)self view];
  v49 = [v48 layoutMarginsGuide];
  v50 = [v49 centerXAnchor];
  v51 = [v47 constraintEqualToAnchor:v50];
  [v16 addObject:v51];

  v52 = [(HUPinCodeEditorViewController *)self instructionHeader];
  id v53 = [v52 bottomAnchor];
  v54 = [(HUPinCodeEditorViewController *)self textField];
  uint64_t v55 = [v54 topAnchor];
  v56 = [v53 constraintEqualToAnchor:v55 constant:-28.0];
  [v16 addObject:v56];

  v57 = [(HUPinCodeEditorViewController *)self footerLabel];
  v58 = [v57 leadingAnchor];
  v59 = [(HUPinCodeEditorViewController *)self view];
  v60 = [v59 layoutMarginsGuide];
  v61 = [v60 leadingAnchor];
  v62 = [v58 constraintEqualToAnchor:v61 constant:10.0];
  [v16 addObject:v62];

  v63 = [(HUPinCodeEditorViewController *)self footerLabel];
  v64 = [v63 trailingAnchor];
  v65 = [(HUPinCodeEditorViewController *)self view];
  v66 = [v65 layoutMarginsGuide];
  v67 = [v66 trailingAnchor];
  v68 = [v64 constraintEqualToAnchor:v67 constant:-10.0];
  [v16 addObject:v68];

  v69 = [(HUPinCodeEditorViewController *)self footerLabel];
  v70 = [v69 centerXAnchor];
  v71 = [(HUPinCodeEditorViewController *)self view];
  v72 = [v71 layoutMarginsGuide];
  v73 = [v72 centerXAnchor];
  v74 = [v70 constraintEqualToAnchor:v73];
  [v16 addObject:v74];

  v75 = [(HUPinCodeEditorViewController *)self footerLabel];
  v76 = [v75 topAnchor];
  v77 = [(HUPinCodeEditorViewController *)self textField];
  v78 = [v77 bottomAnchor];
  v79 = [v76 constraintEqualToAnchor:v78 constant:28.0];
  [v16 addObject:v79];

  [MEMORY[0x1E4F28DC8] activateConstraints:v16];
  v80 = [(HUPinCodeEditorViewController *)self navigationController];
  v81 = [v80 viewControllers];
  v82 = [v81 objectAtIndexedSubscript:0];
  LODWORD(v78) = [v82 isEqual:self];

  if (v78)
  {
    v83 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonPressed_];
    v84 = [(HUPinCodeEditorViewController *)self navigationItem];
    [v84 setLeftBarButtonItem:v83];
  }
  v85 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel_saveButtonPressed_];
  [(HUPinCodeEditorViewController *)self setSaveButtonItem:v85];

  v86 = [(HUPinCodeEditorViewController *)self saveButtonItem];
  v87 = [(HUPinCodeEditorViewController *)self navigationItem];
  [v87 setRightBarButtonItem:v86];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HUPinCodeEditorViewController;
  [(HUPinCodeEditorViewController *)&v5 viewWillAppear:a3];
  v4 = [(HUPinCodeEditorViewController *)self textField];
  [v4 becomeFirstResponder];
}

- (void)_updateHeaderAndFooter
{
  objc_opt_class();
  v3 = [(HUPinCodeEditorViewController *)self sourceItem];
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v48 = v4;

  objc_opt_class();
  objc_super v5 = [(HUPinCodeEditorViewController *)self sourceItem];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = v48;
  }
  id v9 = [v8 user];
  id v10 = [(HUPinCodeEditorViewController *)self home];
  id v11 = [v10 currentUser];
  id v12 = [v11 uniqueIdentifier];
  id v13 = [v9 uniqueIdentifier];
  int v14 = [v12 isEqual:v13];

  id v15 = [v48 latestResults];
  id v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  uint64_t v17 = [(HUPinCodeEditorViewController *)self codeLengthMin];
  [(HUPinCodeEditorViewController *)self codeLengthMax];
  v24 = HULocalizedStringWithFormat(@"HUPinCodeEditorViewControllerInstructionHeaderNoName", @"%ld%ld", v18, v19, v20, v21, v22, v23, v17);
  if (v14)
  {
    uint64_t v25 = [(HUPinCodeEditorViewController *)self codeLengthMin];
    [(HUPinCodeEditorViewController *)self codeLengthMax];
    HULocalizedStringWithFormat(@"HUPinCodeEditorViewControllerInstructionHeaderSelf", @"%ld%ld", v26, v27, v28, v29, v30, v31, v25);
  }
  else
  {
    if (!v16) {
      goto LABEL_15;
    }
    uint64_t v32 = [(HUPinCodeEditorViewController *)self codeLengthMin];
    [(HUPinCodeEditorViewController *)self codeLengthMax];
    HULocalizedStringWithFormat(@"HUPinCodeEditorViewControllerInstructionHeader", @"%ld%ld%@", v33, v34, v35, v36, v37, v38, v32);
  uint64_t v39 = };

  v24 = (void *)v39;
LABEL_15:
  v40 = [(HUPinCodeEditorViewController *)self instructionHeader];
  [v40 setText:v24];

  v41 = [(HUPinCodeEditorViewController *)self instructionHeader];
  [v41 sizeToFit];

  if (v9)
  {
    v42 = _HULocalizedStringWithDefaultValue(@"HUPinCodeEditInstructionFooter", @"HUPinCodeEditInstructionFooter", 1);
    v43 = [(HUPinCodeEditorViewController *)self footerLabel];
    [v43 setText:v42];

    v44 = [(HUPinCodeEditorViewController *)self footerLabel];
    [v44 sizeToFit];

    v45 = [(HUPinCodeEditorViewController *)self footerLabel];
    v46 = v45;
    uint64_t v47 = 0;
  }
  else
  {
    v45 = [(HUPinCodeEditorViewController *)self footerLabel];
    v46 = v45;
    uint64_t v47 = 1;
  }
  [v45 setHidden:v47];
}

- (void)cancelButtonPressed:(id)a3
{
  v4 = [(HUPinCodeEditorViewController *)self textField];
  [v4 resignFirstResponder];

  id v6 = [(HUPinCodeEditorViewController *)self presentationDelegate];
  id v5 = (id)[v6 finishPresentation:self animated:1];
}

- (void)saveButtonPressed:(id)a3
{
  id v4 = a3;
  id v5 = [(HUPinCodeEditorViewController *)self textField];
  [v5 resignFirstResponder];

  id v6 = [(HUPinCodeEditorViewController *)self textField];
  id v7 = [v6 text];

  id v22 = 0;
  id v8 = [MEMORY[0x1E4F693C0] asciiStringForLocalizedPINString:v7 error:&v22];
  id v9 = v22;
  [(HUPinCodeEditorViewController *)self setEditedPinCode:v8];
  objc_initWeak(&location, self);
  id v10 = [(HUPinCodeEditorViewController *)self checkForPINCodeValueValidationErrors];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __51__HUPinCodeEditorViewController_saveButtonPressed___block_invoke;
  v19[3] = &unk_1E6387340;
  id v11 = v9;
  id v20 = v11;
  id v12 = [v10 recover:v19];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__HUPinCodeEditorViewController_saveButtonPressed___block_invoke_57;
  v17[3] = &unk_1E6386FB8;
  objc_copyWeak(&v18, &location);
  id v13 = [v12 addFailureBlock:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__HUPinCodeEditorViewController_saveButtonPressed___block_invoke_2_59;
  v15[3] = &unk_1E63874A0;
  objc_copyWeak(&v16, &location);
  id v14 = (id)[v13 addSuccessBlock:v15];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

id __51__HUPinCodeEditorViewController_saveButtonPressed___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = v4;

    id v3 = v5;
  }
  id v6 = [MEMORY[0x1E4F69110] sharedHandler];
  uint64_t v7 = *MEMORY[0x1E4F68790];
  [v6 logError:v3 operationDescription:*MEMORY[0x1E4F68790]];

  id v8 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  id v9 = [v3 userInfo];
  id v10 = [v9 objectForKey:*MEMORY[0x1E4F68440]];
  id v11 = [v10 objectForKey:*MEMORY[0x1E4F68428]];

  if (v11)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__HUPinCodeEditorViewController_saveButtonPressed___block_invoke_2;
    aBlock[3] = &unk_1E63850E0;
    id v23 = v3;
    id v24 = v8;
    id v12 = _Block_copy(aBlock);
  }
  else
  {
    id v12 = 0;
  }
  id v13 = [MEMORY[0x1E4F69110] sharedHandler];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __51__HUPinCodeEditorViewController_saveButtonPressed___block_invoke_55;
  v19[3] = &unk_1E63850E0;
  id v20 = v3;
  id v14 = v8;
  id v21 = v14;
  id v15 = v3;
  [v13 handleError:v15 operationType:v7 options:0 retryBlock:v12 cancelBlock:v19];

  id v16 = v21;
  id v17 = v14;

  return v17;
}

uint64_t __51__HUPinCodeEditorViewController_saveButtonPressed___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) code];
  id v3 = HFLogForCategory();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2 == 77)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Optional PIN Code validation was dismissed by user. Proceeding to set PIN Code. %@", (uint8_t *)&v8, 0xCu);
    }

    return [*(id *)(a1 + 40) finishWithNoResult];
  }
  else
  {
    if (v4)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Unknown PIN Code validation error requested retry. Closing editor without setting PIN Code. %@", (uint8_t *)&v8, 0xCu);
    }

    return [*(id *)(a1 + 40) finishWithError:*(void *)(a1 + 32)];
  }
}

uint64_t __51__HUPinCodeEditorViewController_saveButtonPressed___block_invoke_55(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v8) = 0;
    _os_log_error_impl(&dword_1BE345000, v2, OS_LOG_TYPE_ERROR, "Closing edit view without saving.", (uint8_t *)&v8, 2u);
  }

  if ([*(id *)(a1 + 32) code] == 75
    || [*(id *)(a1 + 32) code] == 74
    || [*(id *)(a1 + 32) code] == 77
    || [*(id *)(a1 + 32) code] == 82)
  {
    id v3 = HFLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Mandatory PIN Code validation. Stay on editor so user can fix issue. %@", (uint8_t *)&v8, 0xCu);
    }

    return [*(id *)(a1 + 40) cancel];
  }
  else
  {
    id v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_error_impl(&dword_1BE345000, v6, OS_LOG_TYPE_ERROR, "Got failure trying to validate PIN Code. Closing editor without setting PIN Code. %@", (uint8_t *)&v8, 0xCu);
    }

    return [*(id *)(a1 + 40) finishWithError:*(void *)(a1 + 32)];
  }
}

void __51__HUPinCodeEditorViewController_saveButtonPressed___block_invoke_57(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [v8 domain];
  if ([v4 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    uint64_t v5 = [v8 code];

    if (v5 == 3072)
    {
      id v6 = [WeakRetained textField];
      [v6 becomeFirstResponder];
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v6 = [WeakRetained presentationDelegate];
  id v7 = (id)[v6 finishPresentation:WeakRetained animated:1];
LABEL_6:
}

void __51__HUPinCodeEditorViewController_saveButtonPressed___block_invoke_2_59(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained newPINCodeCompletionBlock];

  if (v2)
  {
    id v3 = [WeakRetained presentationDelegate];
    id v4 = (id)[v3 finishPresentation:WeakRetained animated:1];

    uint64_t v5 = [WeakRetained newPINCodeCompletionBlock];
    id v6 = [WeakRetained editedPinCode];
    ((void (**)(void, void *))v5)[2](v5, v6);
  }
  else
  {
    id v7 = [WeakRetained updatedPINCodeCompletionBlock];

    if (!v7)
    {
      NSLog(&cfstr_AttemptingToSa.isa);
      goto LABEL_6;
    }
    uint64_t v5 = [WeakRetained commitPinCodeChange];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__HUPinCodeEditorViewController_saveButtonPressed___block_invoke_3;
    v9[3] = &unk_1E6392778;
    v9[4] = WeakRetained;
    id v8 = (id)[v5 addSuccessBlock:v9];
  }

LABEL_6:
}

void __51__HUPinCodeEditorViewController_saveButtonPressed___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 presentationDelegate];
  id v6 = (id)[v5 finishPresentation:*(void *)(a1 + 32) animated:1];

  id v7 = [*(id *)(a1 + 32) updatedPINCodeCompletionBlock];
  v7[2](v7, v4);
}

- (id)commitPinCodeChange
{
  [(HUPinCodeEditorViewController *)self _showSpinner];
  objc_opt_class();
  id v3 = [(HUPinCodeEditorViewController *)self sourceItem];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  objc_opt_class();
  id v6 = [(HUPinCodeEditorViewController *)self sourceItem];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = v5;
  }
  uint64_t v10 = [v9 user];
  id v11 = [(HUPinCodeEditorViewController *)self editedPinCode];
  id v12 = [(HUPinCodeEditorViewController *)self pinCodeManager];
  id v13 = v12;
  if (v10) {
    [v12 setUserPinCode:v11 forUser:v10];
  }
  else {
  id v14 = [v12 updatePinCodeWithItem:v5 withCodeValue:v11];
  }

  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __52__HUPinCodeEditorViewController_commitPinCodeChange__block_invoke;
  v17[3] = &unk_1E63867B0;
  objc_copyWeak(&v18, &location);
  id v15 = [v14 addCompletionBlock:v17];
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v15;
}

void __52__HUPinCodeEditorViewController_commitPinCodeChange__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hideSpinner];
  if (v6)
  {
    id v5 = [MEMORY[0x1E4F69110] sharedHandler];
    [v5 handleError:v6 operationType:*MEMORY[0x1E4F68830] options:0 retryBlock:0 cancelBlock:0];
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a5;
  if ([(HUPinCodeEditorViewController *)self codeLengthMax] <= 0)
  {
    NSLog(&cfstr_IgnoringInvali.isa);
    BOOL v16 = 1;
  }
  else
  {
    uint64_t v9 = [(HUPinCodeEditorViewController *)self textField];
    uint64_t v10 = [v9 text];
    id v11 = (void *)v10;
    id v12 = &stru_1F18F92B8;
    if (v10) {
      id v12 = (__CFString *)v10;
    }
    id v13 = v12;

    id v14 = -[__CFString stringByReplacingCharactersInRange:withString:](v13, "stringByReplacingCharactersInRange:withString:", location, length, v8);

    uint64_t v15 = [v14 length];
    BOOL v16 = v15 <= [(HUPinCodeEditorViewController *)self codeLengthMax];
  }
  return v16;
}

- (id)checkForPINCodeValueValidationErrors
{
  objc_opt_class();
  id v3 = [(HUPinCodeEditorViewController *)self sourceItem];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [(HUPinCodeEditorViewController *)self textField];
  id v7 = [v6 text];

  id v8 = [v5 pinCodeValue];

  uint64_t v9 = [(HUPinCodeEditorViewController *)self pinCodeManager];
  uint64_t v10 = [v9 checkForValidationErrorsWithPINCodeValue:v7 originalPINCode:v8];

  return v10;
}

- (void)_showSpinner
{
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithCustomView:v5];
  id v4 = [(HUPinCodeEditorViewController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  [v5 startAnimating];
}

- (void)_hideSpinner
{
  objc_opt_class();
  id v3 = [(HUPinCodeEditorViewController *)self navigationItem];
  id v4 = [v3 rightBarButtonItem];
  id v5 = [v4 customView];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v9 = v6;

  id v7 = [(HUPinCodeEditorViewController *)self saveButtonItem];
  id v8 = [(HUPinCodeEditorViewController *)self navigationItem];
  [v8 setRightBarButtonItem:v7];

  [v9 stopAnimating];
}

- (HUPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  return (HUPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (HFItem)sourceItem
{
  return self->_sourceItem;
}

- (void)setSourceItem:(id)a3
{
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (void)setPinCodeManager:(id)a3
{
}

- (HMHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);

  return (HMHome *)WeakRetained;
}

- (void)setHome:(id)a3
{
}

- (UILabel)instructionHeader
{
  return self->_instructionHeader;
}

- (void)setInstructionHeader:(id)a3
{
}

- (UILabel)footerLabel
{
  return self->_footerLabel;
}

- (void)setFooterLabel:(id)a3
{
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
}

- (UIBarButtonItem)saveButtonItem
{
  return self->_saveButtonItem;
}

- (void)setSaveButtonItem:(id)a3
{
}

- (NSString)editedPinCode
{
  return self->_editedPinCode;
}

- (void)setEditedPinCode:(id)a3
{
}

- (id)newPINCodeCompletionBlock
{
  return self->_newPINCodeCompletionBlock;
}

- (void)setNewPINCodeCompletionBlock:(id)a3
{
}

- (id)updatedPINCodeCompletionBlock
{
  return self->_updatedPINCodeCompletionBlock;
}

- (void)setUpdatedPINCodeCompletionBlock:(id)a3
{
}

- (int64_t)codeLengthMin
{
  return self->_codeLengthMin;
}

- (void)setCodeLengthMin:(int64_t)a3
{
  self->_codeLengthMin = a3;
}

- (int64_t)codeLengthMax
{
  return self->_codeLengthMax;
}

- (void)setCodeLengthMax:(int64_t)a3
{
  self->_codeLengthMax = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updatedPINCodeCompletionBlock, 0);
  objc_storeStrong(&self->_newPINCodeCompletionBlock, 0);
  objc_storeStrong((id *)&self->_editedPinCode, 0);
  objc_storeStrong((id *)&self->_saveButtonItem, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_footerLabel, 0);
  objc_storeStrong((id *)&self->_instructionHeader, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);

  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end