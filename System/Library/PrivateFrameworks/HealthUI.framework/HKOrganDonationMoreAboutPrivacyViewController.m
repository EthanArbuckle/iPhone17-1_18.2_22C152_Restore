@interface HKOrganDonationMoreAboutPrivacyViewController
- (UITextView)textView;
- (void)_updateForCurrentSizeCategory;
- (void)doneButtonTapped:(id)a3;
- (void)setTextView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HKOrganDonationMoreAboutPrivacyViewController

- (void)viewDidLoad
{
  v26.receiver = self;
  v26.super_class = (Class)HKOrganDonationMoreAboutPrivacyViewController;
  [(HKOrganDonationMoreAboutPrivacyViewController *)&v26 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v4 = [(HKOrganDonationMoreAboutPrivacyViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_doneButtonTapped_];
  v6 = [(HKOrganDonationMoreAboutPrivacyViewController *)self navigationItem];
  [v6 setRightBarButtonItem:v5];

  v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v8 = [v7 localizedStringForKey:@"OD_PRIVACY_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(HKOrganDonationMoreAboutPrivacyViewController *)self setTitle:v8];

  v9 = (UITextView *)objc_alloc_init(MEMORY[0x1E4FB1DD8]);
  textView = self->_textView;
  self->_textView = v9;

  [(UITextView *)self->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITextView *)self->_textView setEditable:0];
  [(UITextView *)self->_textView setSelectable:0];
  v11 = [(HKOrganDonationMoreAboutPrivacyViewController *)self view];
  [v11 addSubview:self->_textView];

  v12 = [(UITextView *)self->_textView widthAnchor];
  v13 = [v12 constraintEqualToConstant:308.0];
  [v13 setActive:1];

  v14 = [(UITextView *)self->_textView centerXAnchor];
  v15 = [(HKOrganDonationMoreAboutPrivacyViewController *)self view];
  v16 = [v15 centerXAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  [v17 setActive:1];

  v18 = [(UITextView *)self->_textView topAnchor];
  v19 = [(HKOrganDonationMoreAboutPrivacyViewController *)self view];
  v20 = [v19 topAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  v22 = [(UITextView *)self->_textView bottomAnchor];
  v23 = [(HKOrganDonationMoreAboutPrivacyViewController *)self view];
  v24 = [v23 bottomAnchor];
  v25 = [v22 constraintEqualToAnchor:v24];
  [v25 setActive:1];

  [(HKOrganDonationMoreAboutPrivacyViewController *)self _updateForCurrentSizeCategory];
}

- (void)_updateForCurrentSizeCategory
{
  v18[3] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
  [v3 _scaledValueForValue:22.0];
  double v5 = v4;
  [v3 _scaledValueForValue:32.0];
  double v7 = v6 - v5;
  v8 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  v9 = (void *)[v8 mutableCopy];

  [v9 setMinimumLineHeight:v5];
  [v9 setParagraphSpacing:v7];
  [v9 setParagraphSpacingBefore:0.0];
  [v9 setAlignment:4];
  uint64_t v10 = *MEMORY[0x1E4FB0738];
  v17[0] = *MEMORY[0x1E4FB06F8];
  v17[1] = v10;
  v18[0] = v3;
  v18[1] = v9;
  v17[2] = *MEMORY[0x1E4FB0700];
  v11 = [MEMORY[0x1E4FB1618] labelColor];
  v18[2] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];

  id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
  v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v15 = [v14 localizedStringForKey:@"OD_MORE_ABOUT_PRIVACY_BODY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v16 = (void *)[v13 initWithString:v15 attributes:v12];

  [(UITextView *)self->_textView setAttributedText:v16];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKOrganDonationMoreAboutPrivacyViewController;
  [(HKOrganDonationMoreAboutPrivacyViewController *)&v6 viewWillAppear:a3];
  textView = self->_textView;
  [(UITextView *)textView contentInset];
  -[UITextView setContentOffset:](textView, "setContentOffset:", 0.0, -v5);
}

- (void)doneButtonTapped:(id)a3
{
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKOrganDonationMoreAboutPrivacyViewController;
  [(HKOrganDonationMoreAboutPrivacyViewController *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    double v5 = [(HKOrganDonationMoreAboutPrivacyViewController *)self traitCollection];
    objc_super v6 = [v5 preferredContentSizeCategory];
    double v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [(HKOrganDonationMoreAboutPrivacyViewController *)self _updateForCurrentSizeCategory];
    }
  }
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end