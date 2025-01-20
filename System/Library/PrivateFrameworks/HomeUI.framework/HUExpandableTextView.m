@interface HUExpandableTextView
- (BOOL)alwaysShowMoreButtonUnlessExpanded;
- (BOOL)fitsWithinLineLimit;
- (BOOL)isExpanded;
- (CGSize)intrinsicContentSize;
- (HFStringGenerator)stringGenerator;
- (HUExpandableTextView)initWithFrame:(CGRect)a3;
- (HUExpandableTextViewDelegate)delegate;
- (NSArray)moreButtonLayoutConstraints;
- (NSAttributedString)attributedText;
- (NSDictionary)textAttributes;
- (NSString)text;
- (UIButton)moreButton;
- (UITextView)textView;
- (double)heightForWidth:(double)a3;
- (unint64_t)languageDirection;
- (unint64_t)numberOfLines;
- (void)_resetMoreButtonLayoutConstraints;
- (void)_updateLanguageDirection;
- (void)layoutSubviews;
- (void)moreButtonTapped:(id)a3;
- (void)setAlwaysShowMoreButtonUnlessExpanded:(BOOL)a3;
- (void)setAttributedText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setFitsWithinLineLimit:(BOOL)a3;
- (void)setLanguageDirection:(unint64_t)a3;
- (void)setMoreButton:(id)a3;
- (void)setMoreButtonLayoutConstraints:(id)a3;
- (void)setNumberOfLines:(unint64_t)a3;
- (void)setStringGenerator:(id)a3;
- (void)setText:(id)a3;
- (void)setTextAttributes:(id)a3;
- (void)setTextView:(id)a3;
- (void)updateConstraints;
@end

@implementation HUExpandableTextView

- (HUExpandableTextView)initWithFrame:(CGRect)a3
{
  v31.receiver = self;
  v31.super_class = (Class)HUExpandableTextView;
  v3 = -[HUExpandableTextView initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_numberOfLines = 2;
    v3->_expanded = 1;
    v3->_fitsWithinLineLimit = 0;
    v3->_languageDirection = 1;
    id v5 = objc_alloc(MEMORY[0x1E4F42F58]);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    textView = v4->_textView;
    v4->_textView = (UITextView *)v6;

    [(UITextView *)v4->_textView setScrollEnabled:0];
    [(UITextView *)v4->_textView setEditable:0];
    v8 = [(UITextView *)v4->_textView textContainer];
    [v8 setLineBreakMode:4];

    v9 = [(UITextView *)v4->_textView textContainer];
    [v9 setLineFragmentPadding:0.0];

    double v10 = *MEMORY[0x1E4F437F8];
    double v11 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F437F8] + 24);
    -[UITextView setTextContainerInset:](v4->_textView, "setTextContainerInset:", *MEMORY[0x1E4F437F8], v11, v12, v13);
    -[UITextView setContentInset:](v4->_textView, "setContentInset:", v10, v11, v12, v13);
    v14 = [MEMORY[0x1E4F428B8] clearColor];
    [(UITextView *)v4->_textView setBackgroundColor:v14];

    [(UITextView *)v4->_textView setDataDetectorTypes:7];
    [(UITextView *)v4->_textView setTextAlignment:4];
    [(UITextView *)v4->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v15) = 1148846080;
    [(UITextView *)v4->_textView setContentCompressionResistancePriority:1 forAxis:v15];
    LODWORD(v16) = 1132068864;
    [(UITextView *)v4->_textView setContentHuggingPriority:1 forAxis:v16];
    [(HUExpandableTextView *)v4 addSubview:v4->_textView];
    v17 = objc_opt_new();
    v18 = [(UITextView *)v4->_textView topAnchor];
    v19 = [(HUExpandableTextView *)v4 topAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    [v17 addObject:v20];

    v21 = [(UITextView *)v4->_textView bottomAnchor];
    v22 = [(HUExpandableTextView *)v4 bottomAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    [v17 addObject:v23];

    v24 = [(UITextView *)v4->_textView leadingAnchor];
    v25 = [(HUExpandableTextView *)v4 leadingAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    [v17 addObject:v26];

    v27 = [(UITextView *)v4->_textView trailingAnchor];
    v28 = [(HUExpandableTextView *)v4 trailingAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    [v17 addObject:v29];

    [MEMORY[0x1E4F28DC8] activateConstraints:v17];
  }
  return v4;
}

- (void)updateConstraints
{
  v3 = [(HUExpandableTextView *)self moreButtonLayoutConstraints];

  if (!v3)
  {
    v4 = objc_opt_new();
    [(UIButton *)self->_moreButton frame];
    -[UIButton setFrame:](self->_moreButton, "setFrame:");
    id v5 = [(UIButton *)self->_moreButton widthAnchor];
    [(UIButton *)self->_moreButton frame];
    v7 = [v5 constraintEqualToConstant:v6];
    [v4 addObject:v7];

    unint64_t v8 = [(HUExpandableTextView *)self languageDirection];
    moreButton = self->_moreButton;
    if (v8 == 1)
    {
      double v10 = [(UIButton *)moreButton leftAnchor];
      [(HUExpandableTextView *)self rightAnchor];
    }
    else
    {
      double v10 = [(UIButton *)moreButton rightAnchor];
      [(HUExpandableTextView *)self leftAnchor];
    double v11 = };
    [(UIButton *)self->_moreButton frame];
    double v13 = [v10 constraintEqualToAnchor:v11 constant:-v12];
    [v4 addObject:v13];

    v14 = [(UIButton *)self->_moreButton firstBaselineAnchor];
    double v15 = [(HUExpandableTextView *)self textView];
    double v16 = [v15 lastBaselineAnchor];
    v17 = [v14 constraintEqualToAnchor:v16];
    [v4 addObject:v17];

    [MEMORY[0x1E4F28DC8] activateConstraints:v4];
    [(HUExpandableTextView *)self setMoreButtonLayoutConstraints:v4];
  }
  v18.receiver = self;
  v18.super_class = (Class)HUExpandableTextView;
  [(HUExpandableTextView *)&v18 updateConstraints];
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)HUExpandableTextView;
  [(HUExpandableTextView *)&v29 layoutSubviews];
  uint64_t v3 = [(HUExpandableTextView *)self moreButton];
  if (v3)
  {
    v4 = (void *)v3;
    BOOL v5 = [(HUExpandableTextView *)self isExpanded];

    if (!v5)
    {
      double v6 = [(HUExpandableTextView *)self textView];
      v7 = [v6 textContainer];
      [v7 setMaximumNumberOfLines:0];

      unint64_t v8 = [(HUExpandableTextView *)self textView];
      [(HUExpandableTextView *)self bounds];
      objc_msgSend(v8, "sizeThatFits:", v9, 3.40282347e38);
      double v11 = v10;

      unint64_t v12 = [(HUExpandableTextView *)self numberOfLines];
      double v13 = [(HUExpandableTextView *)self textView];
      v14 = [v13 textContainer];
      [v14 setMaximumNumberOfLines:v12];

      double v15 = [(HUExpandableTextView *)self textView];
      [(HUExpandableTextView *)self bounds];
      objc_msgSend(v15, "sizeThatFits:", v16, 3.40282347e38);
      double v18 = v17;

      if (![(HUExpandableTextView *)self alwaysShowMoreButtonUnlessExpanded])
      {
        float v19 = v18;
        float v20 = v11;
        if (vabdd_f64(ceilf(v20), ceilf(v19)) < 2.22044605e-16)
        {
          [(HUExpandableTextView *)self setFitsWithinLineLimit:1];
          v21 = [(HUExpandableTextView *)self textView];
          v22 = [v21 textContainer];
          [v22 setMaximumNumberOfLines:0];

          v23 = [(HUExpandableTextView *)self moreButton];
          v24 = v23;
          uint64_t v25 = 1;
LABEL_9:
          [v23 setHidden:v25];

          return;
        }
      }
      if ([(HUExpandableTextView *)self alwaysShowMoreButtonUnlessExpanded]
        || [(HUExpandableTextView *)self fitsWithinLineLimit])
      {
        [(HUExpandableTextView *)self setFitsWithinLineLimit:0];
        unint64_t v26 = [(HUExpandableTextView *)self numberOfLines];
        v27 = [(HUExpandableTextView *)self textView];
        v28 = [v27 textContainer];
        [v28 setMaximumNumberOfLines:v26];

        v23 = [(HUExpandableTextView *)self moreButton];
        v24 = v23;
        uint64_t v25 = 0;
        goto LABEL_9;
      }
    }
  }
}

- (void)_resetMoreButtonLayoutConstraints
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28DC8];
  v4 = [(HUExpandableTextView *)self moreButtonLayoutConstraints];
  [v3 deactivateConstraints:v4];

  [(HUExpandableTextView *)self setMoreButtonLayoutConstraints:0];

  [(HUExpandableTextView *)self setNeedsUpdateConstraints];
}

- (void)setMoreButton:(id)a3
{
  BOOL v5 = (UIButton *)a3;
  p_moreButton = &self->_moreButton;
  moreButton = self->_moreButton;
  if (moreButton != v5)
  {
    unint64_t v8 = v5;
    [(UIButton *)moreButton removeTarget:self action:sel_moreButtonTapped_ forControlEvents:64];
    [(UIButton *)*p_moreButton removeFromSuperview];
    objc_storeStrong((id *)&self->_moreButton, a3);
    [(UIButton *)*p_moreButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUExpandableTextView *)self addSubview:*p_moreButton];
    [(UIButton *)*p_moreButton addTarget:self action:sel_moreButtonTapped_ forControlEvents:64];
    [(HUExpandableTextView *)self setExpanded:0];
    [(HUExpandableTextView *)self _resetMoreButtonLayoutConstraints];
    BOOL v5 = v8;
  }
}

- (void)setExpanded:(BOOL)a3
{
  BOOL expanded = self->_expanded;
  self->_BOOL expanded = a3;
  if (a3)
  {
    BOOL v5 = [(HUExpandableTextView *)self textView];
    double v6 = [v5 textContainer];
    [v6 setMaximumNumberOfLines:0];

    v7 = [(HUExpandableTextView *)self moreButton];
    [v7 setHidden:1];

    if (!expanded)
    {
      unint64_t v8 = [(HUExpandableTextView *)self delegate];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        double v10 = [(HUExpandableTextView *)self delegate];
        [v10 expandableTextViewDidExpand:self];
LABEL_8:
      }
    }
  }
  else
  {
    unint64_t v11 = [(HUExpandableTextView *)self numberOfLines];
    unint64_t v12 = [(HUExpandableTextView *)self textView];
    double v13 = [v12 textContainer];
    [v13 setMaximumNumberOfLines:v11];

    v14 = [(HUExpandableTextView *)self moreButton];
    [v14 setHidden:0];

    if (expanded)
    {
      double v15 = [(HUExpandableTextView *)self delegate];
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        double v10 = [(HUExpandableTextView *)self delegate];
        [v10 expandableTextViewDidCollapse:self];
        goto LABEL_8;
      }
    }
  }

  [(HUExpandableTextView *)self invalidateIntrinsicContentSize];
}

- (void)moreButtonTapped:(id)a3
{
}

- (void)_updateLanguageDirection
{
  uint64_t v3 = [(HUExpandableTextView *)self textView];
  v4 = [v3 attributedText];

  if (v4)
  {
    BOOL v5 = [(HUExpandableTextView *)self textView];
    double v6 = [v5 text];
    v7 = [(HUExpandableTextView *)self textView];
    unint64_t v8 = [v7 text];
    v16.length = [v8 length];
    v16.location = 0;
    char v9 = (__CFString *)CFStringTokenizerCopyBestStringLanguage(v6, v16);

    -[HUExpandableTextView setLanguageDirection:](self, "setLanguageDirection:", [MEMORY[0x1E4F1CA20] characterDirectionForLanguage:v9]);
  }
  else
  {
    [(HUExpandableTextView *)self setLanguageDirection:1];
  }
  objc_opt_class();
  double v10 = [(HUExpandableTextView *)self moreButton];
  if (objc_opt_isKindOfClass()) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = 0;
  }
  id v12 = v11;

  BOOL v13 = [(HUExpandableTextView *)self languageDirection] == 2;
  v14 = [(HUExpandableTextView *)self textView];
  [v14 setTextAlignment:2 * v13];

  [v12 setShouldFadeRightToLeft:v13];

  [(HUExpandableTextView *)self _resetMoreButtonLayoutConstraints];
}

- (void)setText:(id)a3
{
  id v12 = a3;
  v4 = [(HUExpandableTextView *)self textView];
  BOOL v5 = [v4 text];
  char v6 = [v12 isEqualToString:v5];

  v7 = v12;
  if ((v6 & 1) == 0)
  {
    if (v12)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
      v4 = [(HUExpandableTextView *)self textAttributes];
      char v9 = (void *)[v8 initWithString:v12 attributes:v4];
    }
    else
    {
      char v9 = 0;
    }
    double v10 = [(HUExpandableTextView *)self textView];
    [v10 setAttributedText:v9];

    if (v12)
    {
    }
    stringGenerator = self->_stringGenerator;
    self->_stringGenerator = 0;

    [(HUExpandableTextView *)self _updateLanguageDirection];
    [(HUExpandableTextView *)self invalidateIntrinsicContentSize];
    v7 = v12;
  }
}

- (NSString)text
{
  v2 = [(HUExpandableTextView *)self textView];
  uint64_t v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setAttributedText:(id)a3
{
  id v12 = a3;
  v4 = [v12 string];
  BOOL v5 = [(HUExpandableTextView *)self textView];
  char v6 = [v5 text];
  char v7 = [v4 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    id v8 = (void *)[v12 mutableCopy];
    char v9 = [(HUExpandableTextView *)self textAttributes];
    objc_msgSend(v8, "addAttributes:range:", v9, 0, objc_msgSend(v8, "length"));

    double v10 = [(HUExpandableTextView *)self textView];
    [v10 setAttributedText:v8];

    stringGenerator = self->_stringGenerator;
    self->_stringGenerator = 0;

    [(HUExpandableTextView *)self _updateLanguageDirection];
    [(HUExpandableTextView *)self invalidateIntrinsicContentSize];
  }
}

- (NSAttributedString)attributedText
{
  v2 = [(HUExpandableTextView *)self textView];
  uint64_t v3 = [v2 attributedText];

  return (NSAttributedString *)v3;
}

- (void)setStringGenerator:(id)a3
{
  uint64_t v3 = a3;
  id v7 = a3;
  if (([v7 isEqual:self->_stringGenerator] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_stringGenerator, v3);
    if (v7)
    {
      uint64_t v3 = [(HUExpandableTextView *)self textAttributes];
      BOOL v5 = [v7 stringWithAttributes:v3];
    }
    else
    {
      BOOL v5 = 0;
    }
    char v6 = [(HUExpandableTextView *)self textView];
    [v6 setAttributedText:v5];

    if (v7)
    {
    }
    [(HUExpandableTextView *)self _updateLanguageDirection];
    [(HUExpandableTextView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setNumberOfLines:(unint64_t)a3
{
  self->_numberOfLines = a3;
  if (![(HUExpandableTextView *)self isExpanded])
  {
    BOOL v5 = [(HUExpandableTextView *)self textView];
    char v6 = [v5 textContainer];
    [v6 setMaximumNumberOfLines:a3];

    [(HUExpandableTextView *)self invalidateIntrinsicContentSize];
  }
}

- (double)heightForWidth:(double)a3
{
  v4 = [(HUExpandableTextView *)self textView];
  objc_msgSend(v4, "sizeThatFits:", a3, 3.40282347e38);
  float v6 = v5;
  double v7 = ceilf(v6);

  return v7;
}

- (CGSize)intrinsicContentSize
{
  double v3 = *MEMORY[0x1E4F43ED8];
  [(HUExpandableTextView *)self bounds];
  [(HUExpandableTextView *)self heightForWidth:v4];
  double v6 = v5;
  double v7 = v3;
  result.height = v6;
  result.width = v7;
  return result;
}

- (HFStringGenerator)stringGenerator
{
  return self->_stringGenerator;
}

- (NSDictionary)textAttributes
{
  return self->_textAttributes;
}

- (void)setTextAttributes:(id)a3
{
}

- (unint64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (UIButton)moreButton
{
  return self->_moreButton;
}

- (BOOL)alwaysShowMoreButtonUnlessExpanded
{
  return self->_alwaysShowMoreButtonUnlessExpanded;
}

- (void)setAlwaysShowMoreButtonUnlessExpanded:(BOOL)a3
{
  self->_alwaysShowMoreButtonUnlessExpanded = a3;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (HUExpandableTextViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUExpandableTextViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (BOOL)fitsWithinLineLimit
{
  return self->_fitsWithinLineLimit;
}

- (void)setFitsWithinLineLimit:(BOOL)a3
{
  self->_fitsWithinLineLimit = a3;
}

- (unint64_t)languageDirection
{
  return self->_languageDirection;
}

- (void)setLanguageDirection:(unint64_t)a3
{
  self->_languageDirection = a3;
}

- (NSArray)moreButtonLayoutConstraints
{
  return self->_moreButtonLayoutConstraints;
}

- (void)setMoreButtonLayoutConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreButtonLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_textAttributes, 0);

  objc_storeStrong((id *)&self->_stringGenerator, 0);
}

@end