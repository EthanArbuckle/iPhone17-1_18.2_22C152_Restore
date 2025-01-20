@interface CKRecoverableSectionDisclosureView
+ (id)reuseIdentifier;
- (CKRecoverableSectionDisclosureView)initWithFrame:(CGRect)a3;
- (UITextView)disclosureView;
- (id)_disclosureAttributedText:(id)a3;
- (id)_junkFilteringDisclosureAttributedText;
- (id)_recentlyDeletedDisclosureAttributedText;
- (void)configureForJunkFiltering;
- (void)configureForRecentlyDeleted;
- (void)setDisclosureView:(id)a3;
@end

@implementation CKRecoverableSectionDisclosureView

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (CKRecoverableSectionDisclosureView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v35[4] = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)CKRecoverableSectionDisclosureView;
  v7 = -[CKRecoverableSectionDisclosureView initWithFrame:](&v34, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    v9 = [(CKRecoverableSectionDisclosureView *)v7 disclosureView];
    [(CKRecoverableSectionDisclosureView *)v8 addSubview:v9];

    v10 = [(CKRecoverableSectionDisclosureView *)v8 disclosureView];
    objc_msgSend(v10, "setFrame:", x, y, width, height);

    v24 = (void *)MEMORY[0x1E4F28DC8];
    v33 = [(CKRecoverableSectionDisclosureView *)v8 disclosureView];
    v31 = [v33 leadingAnchor];
    v32 = [(CKRecoverableSectionDisclosureView *)v8 layoutMarginsGuide];
    v30 = [v32 leadingAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v35[0] = v29;
    v28 = [(CKRecoverableSectionDisclosureView *)v8 disclosureView];
    v26 = [v28 trailingAnchor];
    v27 = [(CKRecoverableSectionDisclosureView *)v8 layoutMarginsGuide];
    v25 = [v27 trailingAnchor];
    v23 = [v26 constraintEqualToAnchor:v25];
    v35[1] = v23;
    v22 = [(CKRecoverableSectionDisclosureView *)v8 disclosureView];
    v21 = [v22 topAnchor];
    v11 = [(CKRecoverableSectionDisclosureView *)v8 layoutMarginsGuide];
    v12 = [v11 topAnchor];
    v13 = [v21 constraintEqualToAnchor:v12];
    v35[2] = v13;
    v14 = [(CKRecoverableSectionDisclosureView *)v8 disclosureView];
    v15 = [v14 bottomAnchor];
    v16 = [(CKRecoverableSectionDisclosureView *)v8 layoutMarginsGuide];
    v17 = [v16 bottomAnchor];
    v18 = [v15 constraintEqualToAnchor:v17 constant:-10.0];
    v35[3] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:4];
    [v24 activateConstraints:v19];
  }
  return v8;
}

- (UITextView)disclosureView
{
  disclosureView = self->_disclosureView;
  if (!disclosureView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42F58]);
    v5 = (UITextView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UITextView *)v5 _setInteractiveTextSelectionDisabled:1];
    [(UITextView *)v5 setScrollEnabled:0];
    [(UITextView *)v5 setEditable:0];
    [(UITextView *)v5 setSelectable:1];
    [(UITextView *)v5 setUserInteractionEnabled:1];
    v6 = [(UITextView *)v5 textDragInteraction];
    [v6 setEnabled:0];

    [(UITextView *)v5 setClipsToBounds:0];
    [(UITextView *)v5 setAdjustsFontForContentSizeCategory:1];
    [(UITextView *)v5 setBackgroundColor:0];
    [(UITextView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [(UITextView *)v5 textContainer];
    [v7 setLineBreakMode:0];

    v8 = self->_disclosureView;
    self->_disclosureView = v5;

    disclosureView = self->_disclosureView;
  }

  return disclosureView;
}

- (id)_disclosureAttributedText:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F28E48];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithString:v4];

  v6 = objc_opt_new();
  [v6 setAlignment:1];
  [v6 setLineBreakStrategy:2];
  v7 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v6, 0, objc_msgSend(v5, "length"));
  objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v7, 0, objc_msgSend(v5, "length"));
  uint64_t v8 = *MEMORY[0x1E4FB06F8];
  v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
  objc_msgSend(v5, "addAttribute:value:range:", v8, v9, 0, objc_msgSend(v5, "length"));

  return v5;
}

- (id)_recentlyDeletedDisclosureAttributedText
{
  v3 = CKFrameworkBundle();
  id v4 = [v3 localizedStringForKey:@"RECENTLY_DELETED_DISCLOSURE_TEXT" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v5 = [(CKRecoverableSectionDisclosureView *)self _disclosureAttributedText:v4];

  return v5;
}

- (id)_junkFilteringDisclosureAttributedText
{
  v3 = CKFrameworkBundle();
  id v4 = [v3 localizedStringForKey:@"OSCAR_DISCLOSURE_TEXT" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v5 = [(CKRecoverableSectionDisclosureView *)self _disclosureAttributedText:v4];

  return v5;
}

- (void)configureForRecentlyDeleted
{
  v3 = [(CKRecoverableSectionDisclosureView *)self _recentlyDeletedDisclosureAttributedText];
  id v4 = [(CKRecoverableSectionDisclosureView *)self disclosureView];
  [v4 setAttributedText:v3];

  [(CKRecoverableSectionDisclosureView *)self invalidateIntrinsicContentSize];
}

- (void)configureForJunkFiltering
{
  v3 = [(CKRecoverableSectionDisclosureView *)self _junkFilteringDisclosureAttributedText];
  id v4 = [(CKRecoverableSectionDisclosureView *)self disclosureView];
  [v4 setAttributedText:v3];

  [(CKRecoverableSectionDisclosureView *)self invalidateIntrinsicContentSize];
}

- (void)setDisclosureView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end