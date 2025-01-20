@interface HRLinkTextView
- (HRLinkTextView)initWithLinkRange:(_NSRange)a3 URLIdentifier:(int64_t)a4 delegate:(id)a5;
- (HRLinkTextView)initWithLinkRange:(_NSRange)a3 URLIdentifier:(int64_t)a4 delegate:(id)a5 userInterfaceStyleChanged:(id)a6;
- (HRLinkTextViewDelegate)delegate;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (UITextView)textView;
- (_NSRange)linkRange;
- (id)firstBaselineAnchor;
- (id)lastBaselineAnchor;
- (id)userInterfaceStyleChanged;
- (int64_t)URLIdentifier;
- (int64_t)currentUserInterfaceStyle;
- (void)_setUpConstraints;
- (void)_setUpUI;
- (void)_updateCurrentUserInterfaceStyleIfNeeded;
- (void)layoutSubviews;
- (void)linkTextViewTapped:(id)a3;
- (void)setCurrentUserInterfaceStyle:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setLinkRange:(_NSRange)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setTextView:(id)a3;
- (void)setURLIdentifier:(int64_t)a3;
- (void)setUserInterfaceStyleChanged:(id)a3;
@end

@implementation HRLinkTextView

- (HRLinkTextView)initWithLinkRange:(_NSRange)a3 URLIdentifier:(int64_t)a4 delegate:(id)a5
{
  return -[HRLinkTextView initWithLinkRange:URLIdentifier:delegate:userInterfaceStyleChanged:](self, "initWithLinkRange:URLIdentifier:delegate:userInterfaceStyleChanged:", a3.location, a3.length, a4, a5, 0);
}

- (HRLinkTextView)initWithLinkRange:(_NSRange)a3 URLIdentifier:(int64_t)a4 delegate:(id)a5 userInterfaceStyleChanged:(id)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v11 = a5;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HRLinkTextView;
  v13 = [(HRLinkTextView *)&v18 init];
  v14 = v13;
  if (v13)
  {
    v13->_linkRange.NSUInteger location = location;
    v13->_linkRange.NSUInteger length = length;
    v13->_URLIdentifier = a4;
    objc_storeWeak((id *)&v13->_delegate, v11);
    uint64_t v15 = MEMORY[0x223C72F50](v12);
    id userInterfaceStyleChanged = v14->_userInterfaceStyleChanged;
    v14->_id userInterfaceStyleChanged = (id)v15;

    [(HRLinkTextView *)v14 _setUpUI];
    [(HRLinkTextView *)v14 _setUpConstraints];
  }

  return v14;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HRLinkTextView;
  [(HRLinkTextView *)&v3 layoutSubviews];
  [(HRLinkTextView *)self _updateCurrentUserInterfaceStyleIfNeeded];
}

- (void)_updateCurrentUserInterfaceStyleIfNeeded
{
  objc_super v3 = [(HRLinkTextView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  if ([(HRLinkTextView *)self currentUserInterfaceStyle] != v4)
  {
    [(HRLinkTextView *)self setCurrentUserInterfaceStyle:v4];
    v5 = [(HRLinkTextView *)self userInterfaceStyleChanged];

    if (v5)
    {
      v6 = [(HRLinkTextView *)self userInterfaceStyleChanged];
      v6[2](v6, self, v4);
    }
  }
}

- (void)linkTextViewTapped:(id)a3
{
  [(HRLinkTextView *)self linkRange];
  if (v4)
  {
    v5 = [(HRLinkTextView *)self textView];
    id v34 = [v5 layoutManager];

    v6 = [(HRLinkTextView *)self textView];
    v7 = [v6 textContainer];

    v8 = [(HRLinkTextView *)self tapGestureRecognizer];
    v9 = [(HRLinkTextView *)self textView];
    [v8 locationInView:v9];
    double v11 = v10;
    double v13 = v12;

    [v34 usedRectForTextContainer:v7];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    v22 = [(HRLinkTextView *)self textView];
    [v22 bounds];
    double v24 = v23;
    double v26 = v25;

    unint64_t v27 = objc_msgSend(v34, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v7, 0, v11 - -(v15 - (v24 - v19) * 0.5), v13 - -(v17 - (v26 - v21) * 0.5));
    unint64_t v28 = [(HRLinkTextView *)self linkRange];
    if (v27 >= v28 && v27 - v28 < v29)
    {
      v31 = [(HRLinkTextView *)self delegate];
      uint64_t v32 = [(HRLinkTextView *)self linkRange];
      objc_msgSend(v31, "linkTextView:didTapOnLinkInRange:", self, v32, v33);
    }
  }
}

- (id)firstBaselineAnchor
{
  v2 = [(HRLinkTextView *)self textView];
  objc_super v3 = [v2 firstBaselineAnchor];

  return v3;
}

- (id)lastBaselineAnchor
{
  v2 = [(HRLinkTextView *)self textView];
  objc_super v3 = [v2 lastBaselineAnchor];

  return v3;
}

- (void)_setUpUI
{
  id v3 = objc_alloc_init(MEMORY[0x263F1CAC8]);
  [(HRLinkTextView *)self setTextView:v3];

  uint64_t v4 = [(HRLinkTextView *)self textView];
  [v4 setScrollEnabled:0];

  v5 = [(HRLinkTextView *)self textView];
  [v5 setUserInteractionEnabled:1];

  v6 = [(HRLinkTextView *)self textView];
  [v6 setSelectable:0];

  v7 = [(HRLinkTextView *)self textView];
  [v7 setEditable:0];

  double v8 = *MEMORY[0x263F1D1C0];
  double v9 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v10 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v11 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  double v12 = [(HRLinkTextView *)self textView];
  objc_msgSend(v12, "setTextContainerInset:", v8, v9, v10, v11);

  double v13 = [(HRLinkTextView *)self textView];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v14 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
  double v15 = [(HRLinkTextView *)self textView];
  [v15 setFont:v14];

  double v16 = [(HRLinkTextView *)self textView];
  [(HRLinkTextView *)self addSubview:v16];

  double v17 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel_linkTextViewTapped_];
  [(HRLinkTextView *)self setTapGestureRecognizer:v17];

  id v19 = [(HRLinkTextView *)self textView];
  double v18 = [(HRLinkTextView *)self tapGestureRecognizer];
  [v19 addGestureRecognizer:v18];
}

- (void)_setUpConstraints
{
  id v3 = [(HRLinkTextView *)self textView];
  objc_msgSend(v3, "hk_alignConstraintsWithView:", self);
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (int64_t)URLIdentifier
{
  return self->_URLIdentifier;
}

- (void)setURLIdentifier:(int64_t)a3
{
  self->_URLIdentifier = a3;
}

- (_NSRange)linkRange
{
  p_linkRange = &self->_linkRange;
  NSUInteger location = self->_linkRange.location;
  NSUInteger length = p_linkRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setLinkRange:(_NSRange)a3
{
  self->_linkRange = a3;
}

- (HRLinkTextViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HRLinkTextViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (int64_t)currentUserInterfaceStyle
{
  return self->_currentUserInterfaceStyle;
}

- (void)setCurrentUserInterfaceStyle:(int64_t)a3
{
  self->_currentUserInterfaceStyle = a3;
}

- (id)userInterfaceStyleChanged
{
  return self->_userInterfaceStyleChanged;
}

- (void)setUserInterfaceStyleChanged:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInterfaceStyleChanged, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end