@interface HUAccessoryDiagnosticsConsentViewController
- (HUAccessoryDiagnosticsConsentViewController)initWithItem:(id)a3 completionHandler:(id)a4;
- (NSString)manufacturer;
- (NSURL)privacyPolicyURL;
- (UIButton)submitButton;
- (UITextView)descriptionTextView;
- (id)completionHandler;
- (int64_t)consentTextVersion;
- (void)_addConstraints;
- (void)cancelSubmission;
- (void)setCompletionHandler:(id)a3;
- (void)setConsentTextVersion:(int64_t)a3;
- (void)setDescriptionTextView:(id)a3;
- (void)setManufacturer:(id)a3;
- (void)setPrivacyPolicyURL:(id)a3;
- (void)setSubmitButton:(id)a3;
- (void)submitLog;
- (void)viewDidLoad;
@end

@implementation HUAccessoryDiagnosticsConsentViewController

- (HUAccessoryDiagnosticsConsentViewController)initWithItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUAccessoryDiagnosticsConsentViewController;
  v8 = [(HUAccessoryDiagnosticsConsentViewController *)&v16 initWithNibName:0 bundle:0];
  if (v8)
  {
    v9 = _Block_copy(v7);
    id completionHandler = v8->_completionHandler;
    v8->_id completionHandler = v9;

    uint64_t v11 = [v6 privacyPolicyURL];
    privacyPolicyURL = v8->_privacyPolicyURL;
    v8->_privacyPolicyURL = (NSURL *)v11;

    v8->_consentTextVersion = [v6 consentVersion];
    uint64_t v13 = [v6 manufacturer];
    manufacturer = v8->_manufacturer;
    v8->_manufacturer = (NSString *)v13;
  }
  return v8;
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)HUAccessoryDiagnosticsConsentViewController;
  [(HUAccessoryDiagnosticsConsentViewController *)&v21 viewDidLoad];
  v3 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  v4 = [(HUAccessoryDiagnosticsConsentViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(HUAccessoryDiagnosticsConsentViewController *)self manufacturer];
  v12 = HULocalizedStringWithFormat(@"HUAccessoryDiagnosticsConsentNavigationTitle", @"%@", v6, v7, v8, v9, v10, v11, (uint64_t)v5);
  [(HUAccessoryDiagnosticsConsentViewController *)self setTitle:v12];

  id v13 = objc_alloc(MEMORY[0x1E4F427C0]);
  v14 = _HULocalizedStringWithDefaultValue(@"HUAccessoryDiagnosticsConsentCancelButton", @"HUAccessoryDiagnosticsConsentCancelButton", 1);
  v15 = (void *)[v13 initWithTitle:v14 style:0 target:self action:sel_cancelSubmission];
  objc_super v16 = [(HUAccessoryDiagnosticsConsentViewController *)self navigationItem];
  [v16 setLeftBarButtonItem:v15];

  v17 = [(HUAccessoryDiagnosticsConsentViewController *)self view];
  v18 = [(HUAccessoryDiagnosticsConsentViewController *)self descriptionTextView];
  [v17 addSubview:v18];

  v19 = [(HUAccessoryDiagnosticsConsentViewController *)self view];
  v20 = [(HUAccessoryDiagnosticsConsentViewController *)self submitButton];
  [v19 addSubview:v20];

  [(HUAccessoryDiagnosticsConsentViewController *)self _addConstraints];
}

- (void)_addConstraints
{
  v53[9] = *MEMORY[0x1E4F143B8];
  v52 = [(HUAccessoryDiagnosticsConsentViewController *)self descriptionTextView];
  v49 = [v52 topAnchor];
  v51 = [(HUAccessoryDiagnosticsConsentViewController *)self view];
  v50 = [v51 safeAreaLayoutGuide];
  v48 = [v50 topAnchor];
  v47 = [v49 constraintEqualToAnchor:v48 constant:20.0];
  v53[0] = v47;
  v46 = [(HUAccessoryDiagnosticsConsentViewController *)self descriptionTextView];
  v43 = [v46 leftAnchor];
  v45 = [(HUAccessoryDiagnosticsConsentViewController *)self view];
  v44 = [v45 safeAreaLayoutGuide];
  v42 = [v44 leftAnchor];
  v41 = [v43 constraintEqualToAnchor:v42 constant:10.0];
  v53[1] = v41;
  v40 = [(HUAccessoryDiagnosticsConsentViewController *)self descriptionTextView];
  v37 = [v40 rightAnchor];
  v39 = [(HUAccessoryDiagnosticsConsentViewController *)self view];
  v38 = [v39 safeAreaLayoutGuide];
  v36 = [v38 rightAnchor];
  v35 = [v37 constraintEqualToAnchor:v36 constant:-10.0];
  v53[2] = v35;
  v34 = [(HUAccessoryDiagnosticsConsentViewController *)self descriptionTextView];
  v32 = [v34 bottomAnchor];
  v33 = [(HUAccessoryDiagnosticsConsentViewController *)self submitButton];
  v31 = [v33 topAnchor];
  v30 = [v32 constraintEqualToAnchor:v31 constant:-10.0];
  v53[3] = v30;
  v29 = [(HUAccessoryDiagnosticsConsentViewController *)self submitButton];
  v26 = [v29 bottomAnchor];
  v28 = [(HUAccessoryDiagnosticsConsentViewController *)self view];
  v27 = [v28 safeAreaLayoutGuide];
  v25 = [v27 bottomAnchor];
  v24 = [v26 constraintEqualToAnchor:v25 constant:-20.0];
  v53[4] = v24;
  v22 = [(HUAccessoryDiagnosticsConsentViewController *)self submitButton];
  objc_super v21 = [v22 heightAnchor];
  v20 = [v21 constraintEqualToConstant:47.0];
  v53[5] = v20;
  v19 = [(HUAccessoryDiagnosticsConsentViewController *)self submitButton];
  v17 = [v19 centerXAnchor];
  v18 = [(HUAccessoryDiagnosticsConsentViewController *)self view];
  objc_super v16 = [v18 centerXAnchor];
  v15 = [v17 constraintEqualToAnchor:v16];
  v53[6] = v15;
  v14 = [(HUAccessoryDiagnosticsConsentViewController *)self submitButton];
  id v13 = [v14 leftAnchor];
  v3 = [(HUAccessoryDiagnosticsConsentViewController *)self view];
  v4 = [v3 safeAreaLayoutGuide];
  v5 = [v4 leftAnchor];
  uint64_t v6 = [v13 constraintEqualToAnchor:v5 constant:20.0];
  v53[7] = v6;
  uint64_t v7 = [(HUAccessoryDiagnosticsConsentViewController *)self submitButton];
  uint64_t v8 = [v7 rightAnchor];
  uint64_t v9 = [(HUAccessoryDiagnosticsConsentViewController *)self view];
  uint64_t v10 = [v9 safeAreaLayoutGuide];
  uint64_t v11 = [v10 rightAnchor];
  v12 = [v8 constraintEqualToAnchor:v11 constant:-20.0];
  v53[8] = v12;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:9];

  [MEMORY[0x1E4F28DC8] activateConstraints:v23];
}

- (void)submitLog
{
  v3 = [(HUAccessoryDiagnosticsConsentViewController *)self completionHandler];
  v3[2](v3, 1);

  [(HUAccessoryDiagnosticsConsentViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)cancelSubmission
{
  v3 = [(HUAccessoryDiagnosticsConsentViewController *)self completionHandler];
  v3[2](v3, 0);

  [(HUAccessoryDiagnosticsConsentViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (UITextView)descriptionTextView
{
  v20[3] = *MEMORY[0x1E4F143B8];
  descriptionTextView = self->_descriptionTextView;
  if (!descriptionTextView)
  {
    v4 = (UITextView *)objc_alloc_init(MEMORY[0x1E4F42F58]);
    [(UITextView *)v4 setEditable:0];
    [(UITextView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextView *)v4 setTextAlignment:1];
    v5 = _HULocalizedStringWithDefaultValue(@"HUAccessoryDiagnosticsConsentExplanation", @"HUAccessoryDiagnosticsConsentExplanation", 1);
    uint64_t v6 = _HULocalizedStringWithDefaultValue(@"HUAccessoryDiagnosticsConsentLinkText", @"HUAccessoryDiagnosticsConsentLinkText", 1);
    uint64_t v7 = [MEMORY[0x1E4F42678] defaultParagraphStyle];
    uint64_t v8 = (void *)[v7 mutableCopy];

    [v8 setAlignment:1];
    v19[0] = *MEMORY[0x1E4F42508];
    uint64_t v9 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    uint64_t v10 = *MEMORY[0x1E4F42540];
    v20[0] = v9;
    v20[1] = v8;
    uint64_t v11 = *MEMORY[0x1E4F42510];
    v19[1] = v10;
    v19[2] = v11;
    v12 = [MEMORY[0x1E4F428B8] labelColor];
    v20[2] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

    v14 = (void *)MEMORY[0x1E4F28B18];
    v15 = [(HUAccessoryDiagnosticsConsentViewController *)self privacyPolicyURL];
    objc_super v16 = objc_msgSend(v14, "hf_attributedLinkStringForString:linkString:linkURL:attributes:additionalLinkAttributes:", v5, v6, v15, v13, 0);
    [(UITextView *)v4 setAttributedText:v16];

    v17 = self->_descriptionTextView;
    self->_descriptionTextView = v4;

    descriptionTextView = self->_descriptionTextView;
  }

  return descriptionTextView;
}

- (UIButton)submitButton
{
  submitButton = self->_submitButton;
  if (!submitButton)
  {
    v4 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    [(UIButton *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v4 addTarget:self action:sel_submitLog forControlEvents:64];
    v5 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [(UIButton *)v4 setTintColor:v5];

    uint64_t v6 = [MEMORY[0x1E4F428B8] systemOrangeColor];
    [(UIButton *)v4 setBackgroundColor:v6];

    uint64_t v7 = [(UIButton *)v4 layer];
    [v7 setCornerRadius:8.0];

    uint64_t v8 = [(HUAccessoryDiagnosticsConsentViewController *)self manufacturer];
    v15 = HULocalizedStringWithFormat(@"HUAccessoryDiagnosticsConsentSubmitButton", @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v8);
    [(UIButton *)v4 setTitle:v15 forState:0];

    objc_super v16 = self->_submitButton;
    self->_submitButton = v4;

    submitButton = self->_submitButton;
  }

  return submitButton;
}

- (void)setDescriptionTextView:(id)a3
{
}

- (void)setSubmitButton:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSURL)privacyPolicyURL
{
  return self->_privacyPolicyURL;
}

- (void)setPrivacyPolicyURL:(id)a3
{
}

- (int64_t)consentTextVersion
{
  return self->_consentTextVersion;
}

- (void)setConsentTextVersion:(int64_t)a3
{
  self->_consentTextVersion = a3;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_privacyPolicyURL, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_submitButton, 0);

  objc_storeStrong((id *)&self->_descriptionTextView, 0);
}

@end