@interface MFComposeHeaderView
+ (double)_labelTopPaddingSpecification;
+ (double)preferredHeight;
+ (double)separatorHeight;
+ (id)defaultFont;
+ (id)defaultSeparatorColor;
- (BOOL)_canBecomeFirstResponder;
- (BOOL)_shouldEmbedLabelInTextView;
- (BOOL)showsHighlightWhenTouched;
- (CGRect)_contentRect;
- (CGRect)_exclusionRectForView:(id)a3 alongEdge:(unint64_t)a4;
- (CGRect)titleLabelBaselineAlignmentRectForLabel:(id)a3;
- (MFComposeHeaderView)initWithFrame:(CGRect)a3;
- (MFHeaderLabelView)labelView;
- (NSString)label;
- (NSString)navTitle;
- (UIEdgeInsets)_recipientViewEdgeInsets;
- (double)labelTopPadding;
- (id)_automationID;
- (id)_baseAttributes;
- (id)_highlightedBackgroundView;
- (id)labelColor;
- (void)handleTouchesEnded;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)refreshPreferredContentSize;
- (void)setBounds:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setLabel:(id)a3;
- (void)setNavTitle:(id)a3;
- (void)setShowsHighlightWhenTouched:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation MFComposeHeaderView

+ (id)defaultFont
{
  v2 = +[MFFontMetricCache sharedFontMetricCache];
  v3 = [v2 cachedFont:&__block_literal_global_7 forKey:@"MFComposeHeaderViewDefaultFont"];

  return v3;
}

id __34__MFComposeHeaderView_defaultFont__block_invoke()
{
  v0 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950] addingSymbolicTraits:0x8000 options:0];
  v1 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v0 size:0.0];

  return v1;
}

+ (double)preferredHeight
{
  v3 = +[MFFontMetricCache sharedFontMetricCache];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__MFComposeHeaderView_preferredHeight__block_invoke;
  v7[3] = &__block_descriptor_40_e5_d8__0l;
  v7[4] = a1;
  [v3 cachedFloat:v7 forKey:@"MFComposeHeaderViewPreferredHeight"];
  double v5 = v4;

  return v5;
}

double __38__MFComposeHeaderView_preferredHeight__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) defaultFont];
  if (MFModernUIApplicationPreferredContentSizeIsAccessibility())
  {
    [v2 capHeight];
    double v4 = v3;
    [v2 lineHeight];
    double v6 = v4 + v5;
  }
  else
  {
    [v2 ascender];
    [v2 capHeight];
    [*(id *)(a1 + 32) _labelTopPaddingSpecification];
    [v2 _bodyLeading];
    v7 = [*(id *)(a1 + 32) defaultFont];
    [v7 _bodyLeading];

    v8 = [MEMORY[0x1E4FB1F48] _applicationKeyWindow];
    UIRoundToViewScale();
    double v6 = v9;
  }
  return v6;
}

+ (double)separatorHeight
{
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 scale];
  double v4 = v3;

  return 1.0 / v4;
}

+ (double)_labelTopPaddingSpecification
{
  double v3 = +[MFFontMetricCache sharedFontMetricCache];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__MFComposeHeaderView__labelTopPaddingSpecification__block_invoke;
  v7[3] = &__block_descriptor_40_e5_d8__0l;
  v7[4] = a1;
  [v3 cachedFloat:v7 forKey:@"MFComposeHeaderViewLabelTopPaddingSpec"];
  double v5 = v4;

  return v5;
}

double __52__MFComposeHeaderView__labelTopPaddingSpecification__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) defaultFont];
  [v1 _bodyLeading];
  double v3 = v2 * 0.89;

  return v3;
}

+ (id)defaultSeparatorColor
{
  return (id)[MEMORY[0x1E4FB1618] tableSeparatorColor];
}

- (double)labelTopPadding
{
  if (MFModernUIApplicationPreferredContentSizeIsAccessibility())
  {
    [(MFComposeHeaderView *)self _recipientViewEdgeInsets];
  }
  else
  {
    [(id)objc_opt_class() _labelTopPaddingSpecification];
    double v5 = v4;
    [(MFHeaderLabelView *)self->_labelView _capOffsetFromBoundsTop];
    return v5 - v6;
  }
  return result;
}

- (id)labelColor
{
  return [(MFHeaderLabelView *)self->_labelView effectiveTextColor];
}

- (MFComposeHeaderView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v21.receiver = self;
  v21.super_class = (Class)MFComposeHeaderView;
  double v5 = -[MFComposeHeaderView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    double v6 = [MEMORY[0x1E4FB1618] mailComposeHeaderBackgroundColor];
    [(MFComposeHeaderView *)v5 setBackgroundColor:v6];

    [(MFComposeHeaderView *)v5 setPreservesSuperviewLayoutMargins:1];
    [(MFComposeHeaderView *)v5 setInsetsLayoutMarginsFromSafeArea:0];
    +[MFComposeHeaderView separatorHeight];
    double v8 = v7;
    id v9 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    v10 = (double *)MEMORY[0x1E4F1DB28];
    double v11 = *MEMORY[0x1E4F1DB28];
    uint64_t v12 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], height - v8, width, v8);
    separator = v5->_separator;
    v5->_separator = (UIView *)v12;

    [(UIView *)v5->_separator setAutoresizingMask:2];
    v14 = v5->_separator;
    v15 = +[MFComposeHeaderView defaultSeparatorColor];
    [(UIView *)v14 setBackgroundColor:v15];

    [(MFComposeHeaderView *)v5 addSubview:v5->_separator];
    v16 = -[MFHeaderLabelView initWithFrame:]([MFHeaderLabelView alloc], "initWithFrame:", v11, v10[1], v10[2], v10[3]);
    labelView = v5->_labelView;
    v5->_labelView = v16;

    [(MFHeaderLabelView *)v5->_labelView setAutoresizingMask:0];
    v18 = v5->_labelView;
    v19 = [(id)objc_opt_class() defaultFont];
    [(MFHeaderLabelView *)v18 setFont:v19];

    [(MFHeaderLabelView *)v5->_labelView sizeToFit];
    [(MFComposeHeaderView *)v5 addSubview:v5->_labelView];
  }
  return v5;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MFComposeHeaderView *)self frame];
  if (width != v9 || height != v8) {
    [(MFComposeHeaderView *)self setNeedsLayout];
  }
  v11.receiver = self;
  v11.super_class = (Class)MFComposeHeaderView;
  -[MFComposeHeaderView setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MFComposeHeaderView *)self bounds];
  if (width != v9 || height != v8) {
    [(MFComposeHeaderView *)self setNeedsLayout];
  }
  v11.receiver = self;
  v11.super_class = (Class)MFComposeHeaderView;
  -[MFComposeHeaderView setBounds:](&v11, sel_setBounds_, x, y, width, height);
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(MFHeaderLabelView *)self->_labelView setText:v4];
    [(MFHeaderLabelView *)self->_labelView sizeToFit];
  }
}

- (NSString)label
{
  return (NSString *)[(MFHeaderLabelView *)self->_labelView text];
}

- (void)layoutSubviews
{
  uint64_t v3 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection];
  [(MFComposeHeaderView *)self _contentRect];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(MFHeaderLabelView *)self->_labelView sizeToFit];
  [(MFHeaderLabelView *)self->_labelView frame];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat rect_8 = v5;
  v48.origin.double x = v5;
  CGFloat rect_24 = v7;
  v48.origin.double y = v7;
  CGFloat v20 = v9;
  v48.size.double width = v9;
  v48.size.double height = v11;
  double Width = CGRectGetWidth(v48);
  CGFloat rect = v13;
  v49.origin.double x = v13;
  v49.origin.double y = v15;
  v49.size.double width = v17;
  CGFloat rect_16 = v19;
  v49.size.double height = v19;
  double v22 = fmin(CGRectGetWidth(v49), Width);
  [(MFComposeHeaderView *)self labelTopPadding];
  CGFloat v24 = v23;
  if ([(MFComposeHeaderView *)self _shouldEmbedLabelInTextView])
  {
    if (!v3)
    {
      CGFloat MinX = 0.0;
      CGFloat v26 = rect_24;
      CGFloat v25 = rect_8;
      CGFloat v29 = v19;
      goto LABEL_9;
    }
    CGFloat v25 = rect_8;
    v50.origin.double x = rect_8;
    CGFloat v26 = rect_24;
    v50.origin.double y = rect_24;
    v50.size.double width = v9;
    v50.size.double height = v11;
    double MaxX = CGRectGetWidth(v50);
  }
  else
  {
    if (!v3)
    {
      CGFloat v25 = rect_8;
      v53.origin.double x = rect_8;
      CGFloat v26 = rect_24;
      v53.origin.double y = rect_24;
      v53.size.double width = v9;
      v53.size.double height = v11;
      CGFloat MinX = CGRectGetMinX(v53);
      CGFloat v29 = v19;
      goto LABEL_9;
    }
    CGFloat v25 = rect_8;
    v51.origin.double x = rect_8;
    CGFloat v26 = rect_24;
    v51.origin.double y = rect_24;
    v51.size.double width = v9;
    v51.size.double height = v11;
    double MaxX = CGRectGetMaxX(v51);
  }
  double v28 = MaxX;
  v52.origin.double x = rect;
  v52.origin.double y = v24;
  v52.size.double width = v22;
  CGFloat v29 = rect_16;
  v52.size.double height = rect_16;
  CGFloat MinX = v28 - CGRectGetWidth(v52);
LABEL_9:
  labelView = self->_labelView;
  CGFloat v32 = v24;
  double v33 = v22;
  CGFloat v34 = v29;
  CGRect v54 = CGRectIntegral(*(CGRect *)&MinX);
  -[MFHeaderLabelView setFrame:](labelView, "setFrame:", v54.origin.x, v54.origin.y, v54.size.width, v54.size.height);
  [(MFComposeHeaderView *)self directionalLayoutMargins];
  double v36 = v35;
  [(UIView *)self->_separator frame];
  double v38 = v37;
  v55.origin.double x = v25;
  v55.origin.double y = v26;
  v55.size.double width = v20;
  v55.size.double height = v11;
  double v39 = CGRectGetMinX(v55);
  [(MFComposeHeaderView *)self frame];
  double Height = CGRectGetHeight(v56);
  v57.origin.double x = v25;
  v57.origin.double y = v26;
  v57.size.double width = v20;
  v57.size.double height = v11;
  double v41 = CGRectGetWidth(v57);
  if (v36 <= 30.0)
  {
    [(MFComposeHeaderView *)self directionalLayoutMargins];
    double v41 = v41 + v42;
    if ([(MFComposeHeaderView *)self _shouldReverseLayoutDirection]) {
      double v39 = 0.0;
    }
  }
  -[UIView setFrame:](self->_separator, "setFrame:", v39, Height + -1.0, v41, v38, *(void *)&rect);
  v47.receiver = self;
  v47.super_class = (Class)MFComposeHeaderView;
  [(MFComposeHeaderView *)&v47 layoutSubviews];
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)MFComposeHeaderView;
  [(MFComposeHeaderView *)&v3 layoutMarginsDidChange];
  [(MFComposeHeaderView *)self setNeedsLayout];
}

- (BOOL)_shouldEmbedLabelInTextView
{
  return 0;
}

- (CGRect)_contentRect
{
  [(MFComposeHeaderView *)self layoutMargins];
  double v4 = v3;
  double v6 = v5;
  [(MFComposeHeaderView *)self bounds];
  double v9 = v4 + v8;
  double v11 = v10 + 0.0;
  double v13 = v12 - (v4 + v6);
  result.size.double height = v7;
  result.size.double width = v13;
  result.origin.double y = v11;
  result.origin.double x = v9;
  return result;
}

- (CGRect)titleLabelBaselineAlignmentRectForLabel:(id)a3
{
  id v4 = a3;
  [(MFHeaderLabelView *)self->_labelView layoutSubviews];
  [(MFHeaderLabelView *)self->_labelView frame];
  CGFloat rect = v5;
  CGFloat v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;
  uint64_t v12 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection];
  [(MFComposeHeaderView *)self _contentRect];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  [v4 frame];
  CGFloat v43 = v21;
  [v4 frame];
  double v23 = v22;
  v45.origin.CGFloat x = v14;
  v45.origin.CGFloat y = v16;
  v45.size.CGFloat width = v18;
  v45.size.double height = v20;
  double v24 = fmax(fmin(v23, CGRectGetWidth(v45) + -6.0 - v9), 0.0);
  CGFloat v25 = rect;
  CGFloat v26 = v7;
  double v27 = v9;
  CGFloat v28 = v11;
  if (v12 == 1) {
    double v29 = CGRectGetMinX(*(CGRect *)&v25) + -6.0 - v24;
  }
  else {
    double v29 = CGRectGetMaxX(*(CGRect *)&v25) + 6.0;
  }
  v46.origin.CGFloat x = rect;
  v46.origin.CGFloat y = v7;
  v46.size.CGFloat width = v9;
  v46.size.double height = v11;
  double MaxY = CGRectGetMaxY(v46);
  [v4 frame];
  double Height = CGRectGetHeight(v47);
  [(MFHeaderLabelView *)self->_labelView _baselineOffsetFromBottom];
  double v33 = v32;
  [v4 _baselineOffsetFromBottom];
  v48.origin.CGFloat y = MaxY - v33 - (Height - v34);
  v48.origin.CGFloat x = v29;
  v48.size.CGFloat width = v24;
  v48.size.double height = v43;
  CGRect v49 = CGRectIntegral(v48);
  CGFloat x = v49.origin.x;
  CGFloat y = v49.origin.y;
  CGFloat width = v49.size.width;
  CGFloat v38 = v49.size.height;

  double v39 = x;
  double v40 = y;
  double v41 = width;
  double v42 = v38;
  result.size.double height = v42;
  result.size.CGFloat width = v41;
  result.origin.CGFloat y = v40;
  result.origin.CGFloat x = v39;
  return result;
}

- (BOOL)_canBecomeFirstResponder
{
  return 0;
}

- (void)handleTouchesEnded
{
  if ([(MFComposeHeaderView *)self _canBecomeFirstResponder])
  {
    [(MFComposeHeaderView *)self becomeFirstResponder];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained composeHeaderViewClicked:self];
    }
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8.receiver = self;
  v8.super_class = (Class)MFComposeHeaderView;
  [(MFComposeHeaderView *)&v8 touchesBegan:v6 withEvent:v7];
  if ([(MFComposeHeaderView *)self showsHighlightWhenTouched]) {
    [(MFComposeHeaderView *)self setHighlighted:1 animated:0];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  [(MFComposeHeaderView *)self handleTouchesEnded];
  if ([(MFComposeHeaderView *)self showsHighlightWhenTouched])
  {
    [(MFComposeHeaderView *)self setHighlighted:0 animated:1];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8.receiver = self;
  v8.super_class = (Class)MFComposeHeaderView;
  [(MFComposeHeaderView *)&v8 touchesCancelled:v6 withEvent:v7];
  if ([(MFComposeHeaderView *)self showsHighlightWhenTouched]) {
    [(MFComposeHeaderView *)self setHighlighted:0 animated:1];
  }
}

- (id)_highlightedBackgroundView
{
  highlightBackgroundView = self->_highlightBackgroundView;
  if (!highlightBackgroundView)
  {
    [(MFComposeHeaderView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10 + -1.0;
    [(id)objc_opt_class() separatorHeight];
    double v13 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v5, v11, v7, v9 + v12);
    CGFloat v14 = self->_highlightBackgroundView;
    self->_highlightBackgroundView = v13;

    [(UIView *)self->_highlightBackgroundView setAutoresizingMask:18];
    double v15 = [MEMORY[0x1E4FB1618] colorWithWhite:0.85 alpha:1.0];
    [(UIView *)self->_highlightBackgroundView setBackgroundColor:v15];

    highlightBackgroundView = self->_highlightBackgroundView;
  }

  return highlightBackgroundView;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__MFComposeHeaderView_setHighlighted_animated___block_invoke;
  aBlock[3] = &unk_1E5F79898;
  BOOL v12 = a3;
  aBlock[4] = self;
  double v7 = (void (**)(void))_Block_copy(aBlock);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__MFComposeHeaderView_setHighlighted_animated___block_invoke_2;
  v9[3] = &unk_1E5F798C0;
  BOOL v10 = a3;
  v9[4] = self;
  double v8 = (void (**)(void *, uint64_t))_Block_copy(v9);
  if (v4)
  {
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v7 animations:v8 completion:0.3];
  }
  else
  {
    v7[2](v7);
    v8[2](v8, 1);
  }
}

void __47__MFComposeHeaderView_setHighlighted_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    double v2 = *(void **)(a1 + 32);
    id v4 = [v2 _highlightedBackgroundView];
    objc_msgSend(v2, "insertSubview:above:");

    if (*(unsigned char *)(a1 + 40)) {
      double v3 = 1.0;
    }
    else {
      double v3 = 0.0;
    }
  }
  else
  {
    double v3 = 0.0;
  }
  id v5 = [*(id *)(a1 + 32) _highlightedBackgroundView];
  [v5 setAlpha:v3];
}

void __47__MFComposeHeaderView_setHighlighted_animated___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40))
  {
    id v1 = [*(id *)(a1 + 32) _highlightedBackgroundView];
    [v1 removeFromSuperview];
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)refreshPreferredContentSize
{
  double v3 = +[MFFontMetricCache sharedFontMetricCache];
  [v3 ensureCacheIsValid];

  labelView = self->_labelView;
  id v5 = [(id)objc_opt_class() defaultFont];
  [(MFHeaderLabelView *)labelView setFont:v5];

  [(MFComposeHeaderView *)self setNeedsLayout];
}

- (id)_baseAttributes
{
  v13[2] = *MEMORY[0x1E4F143B8];
  double v3 = [(id)objc_opt_class() defaultFont];
  id v4 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v3 _bodyLeading];
  [v4 setLineSpacing:v5 * 0.55];
  [(MFComposeHeaderView *)self _recipientViewEdgeInsets];
  [v4 setHeadIndent:v6];
  double v7 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v8 = [v7 userInterfaceLayoutDirection];

  if (v8 == 1) {
    [v4 setBaseWritingDirection:1];
  }
  v12[0] = *MEMORY[0x1E4FB06F8];
  double v9 = [(id)objc_opt_class() defaultFont];
  v12[1] = *MEMORY[0x1E4FB0738];
  v13[0] = v9;
  v13[1] = v4;
  BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v10;
}

- (UIEdgeInsets)_recipientViewEdgeInsets
{
  double v3 = [(id)objc_opt_class() defaultFont];
  [v3 capHeight];
  double v5 = v4;
  [v3 descender];
  double v7 = v6;
  [(MFHeaderLabelView *)self->_labelView frame];
  double MaxY = CGRectGetMaxY(v25);
  [(MFHeaderLabelView *)self->_labelView _baselineOffsetFromBottom];
  double v10 = v9;
  if (MFModernUIApplicationPreferredContentSizeIsAccessibility())
  {
    [v3 capHeight];
    double v12 = round(v11 * 0.5);
  }
  else
  {
    double v12 = floor(MaxY - v10 - (v5 - v7));
  }
  if (MFModernUIApplicationPreferredContentSizeIsAccessibility())
  {
    [v3 capHeight];
    double v14 = v13 * 0.5;
  }
  else
  {
    [(id)objc_opt_class() preferredHeight];
    double v16 = v15;
    [v3 _bodyLeading];
    double v14 = v16 - v12 - v17;
  }
  double v18 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v19 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  double v20 = round(v14);

  double v21 = v12;
  double v22 = v18;
  double v23 = v20;
  double v24 = v19;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (CGRect)_exclusionRectForView:(id)a3 alongEdge:(unint64_t)a4
{
  id v6 = a3;
  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = [v6 superview];

  if (v15 != self)
  {
    double v16 = [v6 superview];
    objc_msgSend(v16, "convertRect:toView:", self, v8, v10, v12, v14);
    double v8 = v17;
    double v10 = v18;
    double v12 = v19;
    double v14 = v20;
  }
  uint64_t v21 = MEMORY[0x1E4F1DB28];
  double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  if (a4 == 8)
  {
    v37.origin.CGFloat x = v8;
    v37.origin.CGFloat y = v10;
    v37.size.CGFloat width = v12;
    v37.size.double height = v14;
    double MinX = CGRectGetMinX(v37);
    [(MFComposeHeaderView *)self bounds];
    double Width = CGRectGetWidth(v38);
    v39.size.double height = *(CGFloat *)(v21 + 24);
    double v24 = MinX + -5.0;
    v39.origin.CGFloat x = v24;
    v39.origin.CGFloat y = v22;
    v39.size.CGFloat width = v23;
    double v23 = Width - CGRectGetMinX(v39);
  }
  else
  {
    double v24 = *MEMORY[0x1E4F1DB28];
    if (a4 == 2)
    {
      v36.origin.CGFloat x = v8;
      v36.origin.CGFloat y = v10;
      v36.size.CGFloat width = v12;
      v36.size.double height = v14;
      double v23 = CGRectGetMaxX(v36) + 5.0;
    }
  }
  [(MFComposeHeaderView *)self _recipientViewEdgeInsets];
  double v28 = v27;
  v40.origin.CGFloat x = v8;
  v40.origin.CGFloat y = v10;
  v40.size.CGFloat width = v12;
  v40.size.double height = v14;
  double MaxY = CGRectGetMaxY(v40);
  [(MFComposeHeaderView *)self _recipientViewEdgeInsets];
  double v31 = MaxY - v30;

  double v32 = v24;
  double v33 = v22 - v28;
  double v34 = v23;
  double v35 = v31;
  result.size.double height = v35;
  result.size.CGFloat width = v34;
  result.origin.CGFloat y = v33;
  result.origin.CGFloat x = v32;
  return result;
}

- (NSString)navTitle
{
  return self->_navTitle;
}

- (void)setNavTitle:(id)a3
{
}

- (MFHeaderLabelView)labelView
{
  return self->_labelView;
}

- (BOOL)showsHighlightWhenTouched
{
  return self->_showsHighlightWhenTouched;
}

- (void)setShowsHighlightWhenTouched:(BOOL)a3
{
  self->_showsHighlightWhenTouched = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navTitle, 0);
  objc_storeStrong((id *)&self->_highlightBackgroundView, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_labelView, 0);

  objc_destroyWeak(&self->_delegate);
}

- (id)_automationID
{
  double v3 = [(MFComposeHeaderView *)self label];
  uint64_t v4 = [v3 length];
  if (v4)
  {
    double v5 = [(MFComposeHeaderView *)self label];
  }
  else
  {
    double v5 = @"NoLabel";
  }
  id v6 = [@"BTN " stringByAppendingString:v5];
  if (v4) {

  }
  return v6;
}

@end