@interface _SFReportIssueFooter
+ (NSString)reuseIdentifier;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (NSString)footerText;
- (_SFReportIssueFooter)initWithFrame:(CGRect)a3;
- (_SFReportIssueFooterDelegate)delegate;
- (void)createTextViewForFooter;
- (void)setDelegate:(id)a3;
- (void)setFooterText:(id)a3;
@end

@implementation _SFReportIssueFooter

+ (NSString)reuseIdentifier
{
  return (NSString *)@"translationIssueSectionFooter";
}

- (_SFReportIssueFooter)initWithFrame:(CGRect)a3
{
  v22[4] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)_SFReportIssueFooter;
  v3 = -[_SFReportIssueFooter initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(_SFReportIssueFooter *)v3 createTextViewForFooter];
    [(_SFReportIssueFooter *)v4 addSubview:v4->_textView];
    v16 = (void *)MEMORY[0x1E4F28DC8];
    v20 = [(UITextView *)v4->_textView topAnchor];
    v19 = [(_SFReportIssueFooter *)v4 topAnchor];
    v18 = [v20 constraintEqualToAnchor:v19];
    v22[0] = v18;
    v17 = [(UITextView *)v4->_textView leadingAnchor];
    v5 = [(_SFReportIssueFooter *)v4 leadingAnchor];
    v6 = [v17 constraintEqualToAnchor:v5];
    v22[1] = v6;
    v7 = [(UITextView *)v4->_textView trailingAnchor];
    v8 = [(_SFReportIssueFooter *)v4 trailingAnchor];
    v9 = [v7 constraintEqualToAnchor:v8 constant:-8.0];
    v22[2] = v9;
    v10 = [(UITextView *)v4->_textView bottomAnchor];
    v11 = [(_SFReportIssueFooter *)v4 bottomAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v22[3] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
    [v16 activateConstraints:v13];

    v14 = v4;
  }

  return v4;
}

- (void)createTextViewForFooter
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (!self->_textView)
  {
    v3 = (UITextView *)objc_alloc_init(MEMORY[0x1E4FB1DD8]);
    textView = self->_textView;
    self->_textView = v3;

    v5 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UITextView *)self->_textView setTextColor:v5];

    v6 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    [(UITextView *)self->_textView setFont:v6];

    v7 = (UITextView *)objc_alloc_init(MEMORY[0x1E4FB1DD8]);
    v8 = self->_textView;
    self->_textView = v7;

    [(UITextView *)self->_textView setDelegate:self];
    [(UITextView *)self->_textView setEditable:0];
    [(UITextView *)self->_textView setSelectable:1];
    [(UITextView *)self->_textView setScrollEnabled:0];
    v9 = [(UITextView *)self->_textView textContainer];
    [v9 setLineFragmentPadding:0.0];

    [(UITextView *)self->_textView _setInteractiveTextSelectionDisabled:1];
    [(UITextView *)self->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [MEMORY[0x1E4FB1618] clearColor];
    [(UITextView *)self->_textView setBackgroundColor:v10];

    uint64_t v13 = *MEMORY[0x1E4FB12B8];
    v11 = [MEMORY[0x1E4FB1618] linkColor];
    v14[0] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    [(UITextView *)self->_textView setLinkTextAttributes:v12];
  }
}

- (void)setFooterText:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F28E48];
  id v5 = a3;
  id v13 = (id)[[v4 alloc] initWithString:v5];

  v6 = _WBSLocalizedString();
  uint64_t v7 = [v13 length];
  id v8 = objc_alloc_init(MEMORY[0x1E4FB1378]);
  objc_msgSend(v13, "addAttribute:value:range:", *MEMORY[0x1E4FB12D0], v8, 0, v7);
  uint64_t v9 = *MEMORY[0x1E4FB12B0];
  v10 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  objc_msgSend(v13, "addAttribute:value:range:", v9, v10, 0, v7);

  uint64_t v11 = *MEMORY[0x1E4FB12B8];
  v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  objc_msgSend(v13, "addAttribute:value:range:", v11, v12, 0, v7);

  objc_msgSend(v13, "safari_replaceOccurrenceOfString:withString:link:", @"%learn-more%", v6, @"learn-more://");
  [(UITextView *)self->_textView setAttributedText:v13];
  [(UITextView *)self->_textView setAdjustsFontForContentSizeCategory:1];
}

- (NSString)footerText
{
  v2 = [(UITextView *)self->_textView attributedText];
  v3 = [v2 string];

  return (NSString *)v3;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v8 = a3;
  id v9 = a4;
  v10 = _WBSLocalizedString();
  uint64_t v11 = _WBSLocalizedString();
  v12 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"translate"];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2050000000;
  id v13 = (void *)getOBWelcomeControllerClass_softClass;
  uint64_t v32 = getOBWelcomeControllerClass_softClass;
  if (!getOBWelcomeControllerClass_softClass)
  {
    location[0] = (id)MEMORY[0x1E4F143A8];
    location[1] = (id)3221225472;
    location[2] = __getOBWelcomeControllerClass_block_invoke;
    location[3] = &unk_1E5C723B0;
    location[4] = &v29;
    __getOBWelcomeControllerClass_block_invoke((uint64_t)location);
    id v13 = (void *)v30[3];
  }
  v25 = v8;
  v14 = v13;
  _Block_object_dispose(&v29, 8);
  v15 = (void *)[[v14 alloc] initWithTitle:v10 detailText:v11 icon:v12];
  v16 = [v15 buttonTray];
  [v16 setPrivacyLinkForBundles:&unk_1EFBDF7D8];

  objc_initWeak(location, v15);
  id v17 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v18 = (void *)MEMORY[0x1E4FB13F0];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __75___SFReportIssueFooter_textView_shouldInteractWithURL_inRange_interaction___block_invoke;
  v26[3] = &unk_1E5C72910;
  objc_copyWeak(&v27, location);
  v19 = [v18 actionWithTitle:&stru_1EFB97EB8 image:0 identifier:0 handler:v26];
  v20 = (void *)[v17 initWithBarButtonSystemItem:0 primaryAction:v19];
  objc_super v21 = [v15 navigationItem];
  [v21 setRightBarButtonItem:v20];

  v22 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v15];
  v23 = [(_SFReportIssueFooter *)self delegate];
  [v23 presentLearnMoreViewController:v22];

  objc_destroyWeak(&v27);
  objc_destroyWeak(location);

  return 0;
}

- (_SFReportIssueFooterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFReportIssueFooterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end