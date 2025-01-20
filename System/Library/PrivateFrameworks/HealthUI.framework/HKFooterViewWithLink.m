@interface HKFooterViewWithLink
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (HKFooterViewWithLink)initWithReuseIdentifier:(id)a3 bodyText:(id)a4 linkText:(id)a5 link:(id)a6;
- (HKFooterViewWithLink)initWithReuseIdentifier:(id)a3 fullText:(id)a4 linkRange:(_NSRange)a5 link:(id)a6;
- (HKFooterViewWithLink)initWithReuseIdentifier:(id)a3 markdown:(id)a4;
- (UITextView)footerTextView;
- (UITextViewDelegate)textViewDelegate;
- (id)_createAttributedMarkdown:(id)a3;
- (id)_createAttributedTextWithFullText:(id)a3 linkRange:(_NSRange)a4 link:(id)a5;
- (id)getTextViewDelegate;
- (void)_setUpFooterTextViewWithBodyText:(id)a3 linkText:(id)a4 link:(id)a5;
- (void)_setUpFooterTextViewWithFullText:(id)a3 linkRange:(_NSRange)a4 link:(id)a5;
- (void)_setUpTextView;
- (void)_setupConstraints;
- (void)setFooterTextView:(id)a3;
- (void)setTextViewDelegate:(id)a3;
- (void)updateWithMarkdown:(id)a3;
@end

@implementation HKFooterViewWithLink

- (HKFooterViewWithLink)initWithReuseIdentifier:(id)a3 fullText:(id)a4 linkRange:(_NSRange)a5 link:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HKFooterViewWithLink;
  v13 = [(HKFooterViewWithLink *)&v16 initWithReuseIdentifier:a3];
  v14 = v13;
  if (v13)
  {
    -[HKFooterViewWithLink _setUpFooterTextViewWithFullText:linkRange:link:](v13, "_setUpFooterTextViewWithFullText:linkRange:link:", v11, location, length, v12);
    [(HKFooterViewWithLink *)v14 _setupConstraints];
  }

  return v14;
}

- (HKFooterViewWithLink)initWithReuseIdentifier:(id)a3 bodyText:(id)a4 linkText:(id)a5 link:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HKFooterViewWithLink;
  v13 = [(HKFooterViewWithLink *)&v16 initWithReuseIdentifier:a3];
  v14 = v13;
  if (v13)
  {
    [(HKFooterViewWithLink *)v13 _setUpFooterTextViewWithBodyText:v10 linkText:v11 link:v12];
    [(HKFooterViewWithLink *)v14 _setupConstraints];
  }

  return v14;
}

- (HKFooterViewWithLink)initWithReuseIdentifier:(id)a3 markdown:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKFooterViewWithLink;
  v7 = [(HKFooterViewWithLink *)&v12 initWithReuseIdentifier:a3];
  v8 = v7;
  if (v7)
  {
    [(HKFooterViewWithLink *)v7 _setUpTextView];
    v9 = [(HKFooterViewWithLink *)v8 _createAttributedMarkdown:v6];
    id v10 = [(HKFooterViewWithLink *)v8 footerTextView];
    [v10 setAttributedText:v9];

    [(HKFooterViewWithLink *)v8 _setupConstraints];
  }

  return v8;
}

- (void)updateWithMarkdown:(id)a3
{
  id v5 = [(HKFooterViewWithLink *)self _createAttributedMarkdown:a3];
  v4 = [(HKFooterViewWithLink *)self footerTextView];
  [v4 setAttributedText:v5];
}

- (void)_setUpFooterTextViewWithBodyText:(id)a3 linkText:(id)a4 link:(id)a5
{
  v8 = NSString;
  id v9 = a5;
  id v10 = a3;
  id v14 = [v8 localizedStringWithFormat:@"%@ %@", v10, a4];
  uint64_t v11 = [v10 length] + 1;
  uint64_t v12 = [v14 length];
  uint64_t v13 = [v10 length];

  -[HKFooterViewWithLink _setUpFooterTextViewWithFullText:linkRange:link:](self, "_setUpFooterTextViewWithFullText:linkRange:link:", v14, v11, v12 + ~v13, v9);
}

- (void)_setUpTextView
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1DD8]);
  v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(HKFooterViewWithLink *)self setFooterTextView:v4];

  id v5 = [(HKFooterViewWithLink *)self footerTextView];
  [v5 setAdjustsFontForContentSizeCategory:1];

  id v6 = [(HKFooterViewWithLink *)self footerTextView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  v7 = [(HKFooterViewWithLink *)self footerTextView];
  [v7 setScrollEnabled:0];

  v8 = [(HKFooterViewWithLink *)self footerTextView];
  [v8 setUserInteractionEnabled:1];

  id v9 = [(HKFooterViewWithLink *)self footerTextView];
  [v9 setDelegate:self];

  id v10 = [(HKFooterViewWithLink *)self footerTextView];
  [v10 setEditable:0];

  uint64_t v11 = [(HKFooterViewWithLink *)self footerTextView];
  [v11 _setInteractiveTextSelectionDisabled:1];

  uint64_t v12 = [(HKFooterViewWithLink *)self footerTextView];
  [v12 setDataDetectorTypes:2];

  uint64_t v13 = [MEMORY[0x1E4FB1618] clearColor];
  id v14 = [(HKFooterViewWithLink *)self footerTextView];
  [v14 setBackgroundColor:v13];

  uint64_t v20 = *MEMORY[0x1E4FB0700];
  v15 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_appKeyColor");
  v21[0] = v15;
  objc_super v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  v17 = [(HKFooterViewWithLink *)self footerTextView];
  [v17 setLinkTextAttributes:v16];

  v18 = [(HKFooterViewWithLink *)self contentView];
  v19 = [(HKFooterViewWithLink *)self footerTextView];
  [v18 addSubview:v19];
}

- (void)_setUpFooterTextViewWithFullText:(id)a3 linkRange:(_NSRange)a4 link:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  id v10 = a3;
  [(HKFooterViewWithLink *)self _setUpTextView];
  -[HKFooterViewWithLink _createAttributedTextWithFullText:linkRange:link:](self, "_createAttributedTextWithFullText:linkRange:link:", v10, location, length, v9);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v11 = [(HKFooterViewWithLink *)self footerTextView];
  [v11 setAttributedText:v12];
}

- (id)_createAttributedMarkdown:(id)a3
{
  v34[2] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F28E48];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithMarkdownString:v5 options:0 baseURL:0 error:0];

  v7 = [(HKFooterViewWithLink *)self defaultContentConfiguration];
  v8 = [v7 textProperties];
  id v9 = [v8 color];

  uint64_t v32 = *MEMORY[0x1E4FB06F8];
  uint64_t v10 = v32;
  uint64_t v11 = *MEMORY[0x1E4FB28F0];
  id v12 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  uint64_t v33 = *MEMORY[0x1E4FB0700];
  uint64_t v13 = v33;
  v34[0] = v12;
  v34[1] = v9;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v32 count:2];

  v30[0] = v10;
  v15 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v11];
  v30[1] = v13;
  v31[0] = v15;
  objc_super v16 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_appKeyColor");
  v31[1] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

  uint64_t v18 = *MEMORY[0x1E4FB0720];
  uint64_t v19 = [v6 length];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __50__HKFooterViewWithLink__createAttributedMarkdown___block_invoke;
  v26[3] = &unk_1E6D535F0;
  id v20 = v6;
  id v27 = v20;
  id v28 = v17;
  v29 = v14;
  id v21 = v14;
  id v22 = v17;
  objc_msgSend(v20, "enumerateAttribute:inRange:options:usingBlock:", v18, 0, v19, 0, v26);
  v23 = v29;
  id v24 = v20;

  return v24;
}

uint64_t __50__HKFooterViewWithLink__createAttributedMarkdown___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = 40;
  if (!a2) {
    uint64_t v4 = 48;
  }
  return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", *(void *)(a1 + v4), a3, a4);
}

- (id)_createAttributedTextWithFullText:(id)a3 linkRange:(_NSRange)a4 link:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v27[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(HKFooterViewWithLink *)self defaultContentConfiguration];
  uint64_t v11 = [v10 textProperties];
  id v12 = [v11 color];

  uint64_t v13 = *MEMORY[0x1E4FB06F8];
  v26[0] = *MEMORY[0x1E4FB06F8];
  uint64_t v14 = *MEMORY[0x1E4FB28F0];
  v15 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  uint64_t v16 = *MEMORY[0x1E4FB0700];
  v26[1] = *MEMORY[0x1E4FB0700];
  v27[0] = v15;
  v27[1] = v12;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];

  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v9 attributes:v17];
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    v24[0] = v13;
    uint64_t v19 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v14];
    v25[0] = v19;
    v24[1] = v16;
    id v20 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_appKeyColor");
    v24[2] = *MEMORY[0x1E4FB0720];
    v25[1] = v20;
    v25[2] = v8;
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];

    objc_msgSend(v18, "addAttributes:range:", v21, location, length);
  }

  return v18;
}

- (void)_setupConstraints
{
  id v3 = [(HKFooterViewWithLink *)self footerTextView];
  uint64_t v4 = [v3 firstBaselineAnchor];
  id v5 = [(HKFooterViewWithLink *)self contentView];
  id v6 = [v5 layoutMarginsGuide];
  v7 = [v6 topAnchor];
  id v8 = [v4 constraintEqualToAnchor:v7 constant:12.0];
  [v8 setActive:1];

  id v9 = [(HKFooterViewWithLink *)self footerTextView];
  uint64_t v10 = [v9 leadingAnchor];
  uint64_t v11 = [(HKFooterViewWithLink *)self contentView];
  id v12 = [v11 leadingAnchor];
  uint64_t v13 = [v10 constraintEqualToSystemSpacingAfterAnchor:v12 multiplier:2.0];
  [v13 setActive:1];

  uint64_t v14 = [(HKFooterViewWithLink *)self contentView];
  v15 = [v14 trailingAnchor];
  uint64_t v16 = [(HKFooterViewWithLink *)self footerTextView];
  v17 = [v16 trailingAnchor];
  uint64_t v18 = [v15 constraintEqualToSystemSpacingAfterAnchor:v17 multiplier:1.0];
  [v18 setActive:1];

  id v23 = [(HKFooterViewWithLink *)self contentView];
  uint64_t v19 = [v23 bottomAnchor];
  id v20 = [(HKFooterViewWithLink *)self footerTextView];
  id v21 = [v20 bottomAnchor];
  id v22 = [v19 constraintEqualToSystemSpacingBelowAnchor:v21 multiplier:1.0];
  [v22 setActive:1];
}

- (void)setTextViewDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(HKFooterViewWithLink *)self footerTextView];
  [v5 setDelegate:v4];
}

- (id)getTextViewDelegate
{
  v2 = [(HKFooterViewWithLink *)self footerTextView];
  id v3 = [v2 delegate];

  return v3;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7 = a4;
  id v8 = [v7 scheme];
  if ([v8 isEqualToString:@"bridge"])
  {
    int v9 = 1;
  }
  else
  {
    uint64_t v10 = [v7 scheme];
    int v9 = [v10 isEqualToString:@"prefs"];
  }
  if (!a6 && v9)
  {
    uint64_t v11 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v11 openSensitiveURL:v7 withOptions:0];
  }
  return v9 ^ 1;
}

- (UITextViewDelegate)textViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textViewDelegate);
  return (UITextViewDelegate *)WeakRetained;
}

- (UITextView)footerTextView
{
  return self->_footerTextView;
}

- (void)setFooterTextView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerTextView, 0);
  objc_destroyWeak((id *)&self->_textViewDelegate);
}

@end