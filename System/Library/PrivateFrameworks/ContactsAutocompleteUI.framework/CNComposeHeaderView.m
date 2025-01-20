@interface CNComposeHeaderView
+ (double)_labelTopPaddingSpecification;
+ (double)preferredHeight;
+ (double)separatorHeight;
+ (id)defaultFont;
+ (id)defaultSeparatorColor;
+ (id)os_log;
+ (id)supplimentalMessageFont;
- (BOOL)_canBecomeFirstResponder;
- (BOOL)_shouldEmbedLabelInTextView;
- (BOOL)showsHighlightWhenTouched;
- (CGRect)_contentRect;
- (CGRect)_exclusionRectForView:(id)a3 alongEdge:(unint64_t)a4;
- (CGRect)titleLabelBaselineAlignmentRectForLabel:(id)a3;
- (CNComposeHeaderLabelView)labelView;
- (CNComposeHeaderView)initWithFrame:(CGRect)a3;
- (CNComposeHeaderViewDelegate)delegate;
- (CNComposeHeaderViewDelegate)internalDelegate;
- (NSDirectionalEdgeInsets)separatorDirectionalEdgeInsets;
- (NSString)composeFieldInfoText;
- (NSString)label;
- (NSString)navTitle;
- (UIEdgeInsets)_recipientViewEdgeInsets;
- (UIEdgeInsets)overrideContentMargins;
- (UILabel)composeFieldInfoLabel;
- (UIView)highlightedBackgroundView;
- (UIView)separator;
- (double)_additionalContentHeight;
- (double)labelTopPadding;
- (id)_automationID;
- (id)_baseAttributes;
- (id)_highlightedBackgroundView;
- (id)headerViewDelegates;
- (id)labelColor;
- (void)createComposeFieldInfoLabelIfNeeded;
- (void)handleTouchesEnded;
- (void)layoutComposeFieldInfoLabelWithContentRect:(CGRect)a3 labelRect:(CGRect)a4;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)refreshPreferredContentSize;
- (void)setComposeFieldInfoLabel:(id)a3;
- (void)setComposeFieldInfoText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setHighlightedBackgroundView:(id)a3;
- (void)setInternalDelegate:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLabelView:(id)a3;
- (void)setNavTitle:(id)a3;
- (void)setOverrideContentMargins:(UIEdgeInsets)a3;
- (void)setSeparator:(id)a3;
- (void)setSeparatorDirectionalEdgeInsets:(NSDirectionalEdgeInsets)a3;
- (void)setShowsHighlightWhenTouched:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation CNComposeHeaderView

+ (id)os_log
{
  if (os_log_cn_once_token_6 != -1) {
    dispatch_once(&os_log_cn_once_token_6, &__block_literal_global_11);
  }
  v2 = (void *)os_log_cn_once_object_6;

  return v2;
}

uint64_t __29__CNComposeHeaderView_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.autocomplete.ui", "headerview");
  uint64_t v1 = os_log_cn_once_object_6;
  os_log_cn_once_object_6 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)defaultFont
{
  v2 = +[CNAutocompleteFontMetricCache sharedFontMetricCache];
  v3 = [v2 cachedFont:&__block_literal_global_15 forKey:@"CNComposeHeaderViewDefaultFont"];

  return v3;
}

id __34__CNComposeHeaderView_defaultFont__block_invoke()
{
  os_log_t v0 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F438C8] addingSymbolicTraits:0x8000 options:0];
  uint64_t v1 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v0 size:0.0];

  return v1;
}

+ (id)supplimentalMessageFont
{
  v2 = +[CNAutocompleteFontMetricCache sharedFontMetricCache];
  v3 = [v2 cachedFont:&__block_literal_global_20 forKey:@"CNComposeHeaderViewSupplimentalMessageFont"];

  return v3;
}

id __46__CNComposeHeaderView_supplimentalMessageFont__block_invoke()
{
  os_log_t v0 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F43888] addingSymbolicTraits:0 options:0];
  uint64_t v1 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v0 size:0.0];

  return v1;
}

+ (double)preferredHeight
{
  v3 = +[CNAutocompleteFontMetricCache sharedFontMetricCache];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__CNComposeHeaderView_preferredHeight__block_invoke;
  v7[3] = &__block_descriptor_40_e5_d8__0l;
  v7[4] = a1;
  [v3 cachedFloat:v7 forKey:@"CNComposeHeaderViewPreferredHeight"];
  double v5 = v4;

  return v5;
}

double __38__CNComposeHeaderView_preferredHeight__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) defaultFont];
  v3 = [MEMORY[0x1E4F42738] sharedApplication];
  double v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
  {
    [v2 capHeight];
    double v7 = v6;
    [v2 lineHeight];
    double v9 = v7 + v8;
  }
  else
  {
    [v2 ascender];
    [v2 capHeight];
    [*(id *)(a1 + 32) _labelTopPaddingSpecification];
    v10 = [MEMORY[0x1E4F42D90] mainScreen];
    [v10 scale];
    UIFloorToScale();

    [v2 _bodyLeading];
    v11 = [*(id *)(a1 + 32) defaultFont];
    [v11 _bodyLeading];

    v12 = [MEMORY[0x1E4F42D90] mainScreen];
    UIRoundToScreenScale();
    *(float *)&double v13 = v13;
    double v9 = roundf(*(float *)&v13);
  }
  return v9;
}

+ (double)separatorHeight
{
  v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 scale];
  double v4 = v3;

  return 1.0 / v4;
}

+ (double)_labelTopPaddingSpecification
{
  double v3 = +[CNAutocompleteFontMetricCache sharedFontMetricCache];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__CNComposeHeaderView__labelTopPaddingSpecification__block_invoke;
  v7[3] = &__block_descriptor_40_e5_d8__0l;
  v7[4] = a1;
  [v3 cachedFloat:v7 forKey:@"CNComposeHeaderViewLabelTopPaddingSpec"];
  double v5 = v4;

  return v5;
}

double __52__CNComposeHeaderView__labelTopPaddingSpecification__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) defaultFont];
  [v2 lineHeight];
  double v4 = v3;
  double v5 = [*(id *)(a1 + 32) defaultFont];
  [v5 lineHeight];
  double v7 = v6;
  double v8 = [*(id *)(a1 + 32) defaultFont];
  [v8 descender];
  double v10 = v7 + v9;
  v11 = [*(id *)(a1 + 32) defaultFont];
  [v11 xHeight];
  double v13 = v4 - (v10 + v12 * 0.5);

  v14 = [*(id *)(a1 + 32) defaultFont];
  [v14 _bodyLeading];
  double v16 = v15 - v13;

  return floor(v16);
}

+ (id)defaultSeparatorColor
{
  return (id)[MEMORY[0x1E4F428B8] separatorColor];
}

- (double)labelTopPadding
{
  double v3 = [MEMORY[0x1E4F42738] sharedApplication];
  double v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
  {
    [(CNComposeHeaderView *)self _recipientViewEdgeInsets];
    return v6;
  }
  else
  {
    [(id)objc_opt_class() _labelTopPaddingSpecification];
    double v9 = v8;
    double v10 = [(CNComposeHeaderView *)self labelView];
    [v10 _capOffsetFromBoundsTop];
    double v7 = v9 - v11;
  }
  return v7;
}

- (id)labelColor
{
  v2 = [(CNComposeHeaderView *)self labelView];
  double v3 = [v2 effectiveTextColor];

  return v3;
}

- (CNComposeHeaderView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v19.receiver = self;
  v19.super_class = (Class)CNComposeHeaderView;
  double v5 = -[CNComposeHeaderView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    double v6 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    [(CNComposeHeaderView *)v5 setBackgroundColor:v6];
    [(CNComposeHeaderView *)v5 setPreservesSuperviewLayoutMargins:1];
    [(CNComposeHeaderView *)v5 setInsetsLayoutMarginsFromSafeArea:0];
    double v7 = (double *)MEMORY[0x1E4F1DB28];
    double v8 = *MEMORY[0x1E4F1DB28];
    +[CNComposeHeaderView separatorHeight];
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v8, height - v9, width, v9);
    separator = v5->_separator;
    v5->_separator = (UIView *)v10;

    [(UIView *)v5->_separator setAutoresizingMask:2];
    double v12 = v5->_separator;
    double v13 = +[CNComposeHeaderView defaultSeparatorColor];
    [(UIView *)v12 setBackgroundColor:v13];

    [(CNComposeHeaderView *)v5 addSubview:v5->_separator];
    v14 = -[CNComposeHeaderLabelView initWithFrame:]([CNComposeHeaderLabelView alloc], "initWithFrame:", v8, v7[1], v7[2], v7[3]);
    labelView = v5->_labelView;
    v5->_labelView = v14;

    [(CNComposeHeaderLabelView *)v5->_labelView setAutoresizingMask:0];
    double v16 = v5->_labelView;
    v17 = [(id)objc_opt_class() defaultFont];
    [(CNComposeHeaderLabelView *)v16 setFont:v17];

    [(CNComposeHeaderLabelView *)v5->_labelView sizeToFit];
    [(CNComposeHeaderView *)v5 addSubview:v5->_labelView];
  }
  return v5;
}

- (void)setLabel:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    double v5 = [(CNComposeHeaderView *)self labelView];
    [v5 setText:v4];

    id v6 = [(CNComposeHeaderView *)self labelView];
    [v6 sizeToFit];
  }
}

- (NSString)label
{
  v2 = [(CNComposeHeaderView *)self labelView];
  double v3 = [v2 text];

  return (NSString *)v3;
}

- (void)createComposeFieldInfoLabelIfNeeded
{
  double v3 = [(CNComposeHeaderView *)self composeFieldInfoLabel];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
    double v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(CNComposeHeaderView *)self setComposeFieldInfoLabel:v5];

    id v6 = [(CNComposeHeaderView *)self composeFieldInfoLabel];
    [v6 setNumberOfLines:3];

    double v7 = [(CNComposeHeaderView *)self composeFieldInfoLabel];
    [v7 setAdjustsFontSizeToFitWidth:1];

    double v8 = [(id)objc_opt_class() supplimentalMessageFont];
    double v9 = [(CNComposeHeaderView *)self composeFieldInfoLabel];
    [v9 setFont:v8];

    id v11 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    uint64_t v10 = [(CNComposeHeaderView *)self composeFieldInfoLabel];
    [v10 setTextColor:v11];
  }
}

- (void)setComposeFieldInfoText:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v5 = v4;
  if (self->_composeFieldInfoText != (NSString *)v4)
  {
    v38 = (void *)v4;
    uint64_t v4 = objc_msgSend((id)v4, "isEqualToString:");
    uint64_t v5 = (uint64_t)v38;
    if ((v4 & 1) == 0)
    {
      id v6 = (NSString *)[v38 copy];
      composeFieldInfoText = self->_composeFieldInfoText;
      self->_composeFieldInfoText = v6;

      if (!v38 || ![v38 length])
      {
        v35 = [(CNComposeHeaderView *)self composeFieldInfoLabel];
        v36 = [v35 superview];

        uint64_t v5 = (uint64_t)v38;
        if (v36 != self) {
          goto LABEL_11;
        }
        v34 = [(CNComposeHeaderView *)self composeFieldInfoLabel];
        [v34 removeFromSuperview];
        goto LABEL_9;
      }
      [(CNComposeHeaderView *)self createComposeFieldInfoLabelIfNeeded];
      double v8 = self->_composeFieldInfoText;
      double v9 = [(CNComposeHeaderView *)self composeFieldInfoLabel];
      [v9 setText:v8];

      [(CNComposeHeaderView *)self _contentRect];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      v18 = [(CNComposeHeaderView *)self labelView];
      [v18 frame];
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;

      v27 = [(CNComposeHeaderView *)self composeFieldInfoLabel];
      [v27 bounds];
      double v37 = v28;

      -[CNComposeHeaderView layoutComposeFieldInfoLabelWithContentRect:labelRect:](self, "layoutComposeFieldInfoLabelWithContentRect:labelRect:", v11, v13, v15, v17, v20, v22, v24, v26);
      v29 = [(CNComposeHeaderView *)self composeFieldInfoLabel];
      [v29 bounds];
      double v31 = v30;

      v32 = [(CNComposeHeaderView *)self composeFieldInfoLabel];
      v33 = [v32 superview];

      if (v33 != self)
      {
        v34 = [(CNComposeHeaderView *)self composeFieldInfoLabel];
        [(CNComposeHeaderView *)self addSubview:v34];
LABEL_9:

LABEL_10:
        uint64_t v4 = [(CNComposeHeaderView *)self _notifyDelegateOfSizeChange];
        uint64_t v5 = (uint64_t)v38;
        goto LABEL_11;
      }
      uint64_t v5 = (uint64_t)v38;
      if (v37 != v31) {
        goto LABEL_10;
      }
    }
  }
LABEL_11:

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)layoutComposeFieldInfoLabelWithContentRect:(CGRect)a3 labelRect:(CGRect)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v9 = [(CNComposeHeaderView *)self composeFieldInfoLabel];
  [(CNComposeHeaderView *)self bounds];
  objc_msgSend(v9, "sizeThatFits:", v10, 1.79769313e308);
  double v12 = v11;

  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v24);
  [(CNComposeHeaderView *)self bounds];
  double MaxY = CGRectGetMaxY(v25);
  [(id)objc_opt_class() separatorHeight];
  double v16 = MaxY - (v12 + v15 + 5.0);
  [(CNComposeHeaderView *)self bounds];
  CGFloat v17 = CGRectGetWidth(v26) + MinX * -2.0;
  [(CNComposeHeaderView *)self separatorDirectionalEdgeInsets];
  CGFloat v19 = v17 - v18;
  [(CNComposeHeaderView *)self separatorDirectionalEdgeInsets];
  CGFloat v21 = v19 - v20;
  id v22 = [(CNComposeHeaderView *)self composeFieldInfoLabel];
  objc_msgSend(v22, "setFrame:", MinX, v16, v21, v12);
}

- (void)layoutSubviews
{
  int v3 = [(CNComposeHeaderView *)self _shouldReverseLayoutDirection];
  [(CNComposeHeaderView *)self _contentRect];
  CGFloat v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(CNComposeHeaderView *)self labelView];
  [v12 frame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  CGFloat v17 = [(CNComposeHeaderView *)self labelView];
  objc_msgSend(v17, "sizeThatFits:", v9, v11);
  CGFloat v19 = v18;
  double v21 = v20;

  recta.origin.CGFloat x = v5;
  v49.origin.CGFloat x = v5;
  v49.origin.CGFloat y = v7;
  v49.size.CGFloat width = v9;
  v49.size.CGFloat height = v11;
  double Width = CGRectGetWidth(v49);
  v50.origin.CGFloat x = v14;
  v50.origin.CGFloat y = v16;
  v50.size.CGFloat width = v19;
  v50.size.CGFloat height = v21;
  double v23 = fmin(CGRectGetWidth(v50), Width);
  [(CNComposeHeaderView *)self labelTopPadding];
  double v25 = v24;
  if ([(CNComposeHeaderView *)self _shouldEmbedLabelInTextView])
  {
    double MinX = 0.0;
    if (!v3) {
      goto LABEL_8;
    }
    v51.origin.CGFloat x = recta.origin.x;
    v51.origin.CGFloat y = v7;
    v51.size.CGFloat width = v9;
    v51.size.CGFloat height = v11;
    double MaxX = CGRectGetWidth(v51);
    goto LABEL_6;
  }
  if (v3)
  {
    v52.origin.CGFloat x = recta.origin.x;
    v52.origin.CGFloat y = v7;
    v52.size.CGFloat width = v9;
    v52.size.CGFloat height = v11;
    double MaxX = CGRectGetMaxX(v52);
LABEL_6:
    double v28 = MaxX;
    v53.origin.CGFloat x = v14;
    v53.origin.CGFloat y = v25;
    v53.size.CGFloat width = v23;
    v53.size.CGFloat height = v21;
    double MinX = v28 - CGRectGetWidth(v53);
    goto LABEL_8;
  }
  v54.origin.CGFloat x = recta.origin.x;
  v54.origin.CGFloat y = v7;
  v54.size.CGFloat width = v9;
  v54.size.CGFloat height = v11;
  double MinX = CGRectGetMinX(v54);
LABEL_8:
  v29 = [(CNComposeHeaderView *)self labelView];
  objc_msgSend(v29, "setFrame:", MinX, v25, v23, v21);

  double v30 = [(CNComposeHeaderView *)self composeFieldInfoLabel];
  double v31 = [v30 superview];

  if (v31 == self) {
    -[CNComposeHeaderView layoutComposeFieldInfoLabelWithContentRect:labelRect:](self, "layoutComposeFieldInfoLabelWithContentRect:labelRect:", recta.origin.x, v7, v9, v11, MinX, v25, v23, v21);
  }
  v32 = [(CNComposeHeaderView *)self separator];
  [v32 frame];
  double v34 = v33;

  [(CNComposeHeaderView *)self frame];
  double Height = CGRectGetHeight(v55);
  [(id)objc_opt_class() separatorHeight];
  double v37 = v36;
  [(CNComposeHeaderView *)self separatorDirectionalEdgeInsets];
  if (v3) {
    double v40 = v39;
  }
  else {
    double v40 = v38;
  }
  double v41 = Height - v37;
  [(CNComposeHeaderView *)self bounds];
  double v42 = CGRectGetWidth(v56);
  [(CNComposeHeaderView *)self separatorDirectionalEdgeInsets];
  double v44 = v42 - v43;
  [(CNComposeHeaderView *)self separatorDirectionalEdgeInsets];
  double v46 = v44 - v45;
  v47 = [(CNComposeHeaderView *)self separator];
  objc_msgSend(v47, "setFrame:", v40, v41, v46, v34);

  *(void *)&recta.origin.CGFloat y = self;
  *(void *)&recta.size.CGFloat width = CNComposeHeaderView;
  [(CGFloat *)(objc_super *)&recta.origin.y layoutSubviews];
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CNComposeHeaderView;
  [(CNComposeHeaderView *)&v3 layoutMarginsDidChange];
  [(CNComposeHeaderView *)self setNeedsLayout];
}

- (id)headerViewDelegates
{
  objc_super v3 = [(CNComposeHeaderView *)self delegate];
  if (v3)
  {
  }
  else
  {
    double v4 = [(CNComposeHeaderView *)self internalDelegate];

    if (!v4) {
      goto LABEL_9;
    }
  }
  CGFloat v5 = [(CNComposeHeaderView *)self delegate];

  if (v5)
  {
    double v6 = [(CNComposeHeaderView *)self delegate];
    double v4 = [MEMORY[0x1E4F1CBF0] arrayByAddingObject:v6];
  }
  else
  {
    double v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  double v7 = [(CNComposeHeaderView *)self internalDelegate];

  if (v7)
  {
    double v8 = [(CNComposeHeaderView *)self internalDelegate];
    uint64_t v9 = [v4 arrayByAddingObject:v8];

    double v4 = (void *)v9;
  }
LABEL_9:

  return v4;
}

- (BOOL)_shouldEmbedLabelInTextView
{
  return 0;
}

- (CGRect)_contentRect
{
  [(CNComposeHeaderView *)self overrideContentMargins];
  if (v6 == *(double *)(MEMORY[0x1E4F437F8] + 8)
    && v3 == *MEMORY[0x1E4F437F8]
    && v5 == *(double *)(MEMORY[0x1E4F437F8] + 24)
    && v4 == *(double *)(MEMORY[0x1E4F437F8] + 16))
  {
    [(CNComposeHeaderView *)self layoutMargins];
    double v18 = [(CNComposeHeaderView *)self traitCollection];
    [v18 displayScale];
    UIRoundToScale();
    double v13 = v19;

    double v20 = [(CNComposeHeaderView *)self traitCollection];
    [v20 displayScale];
    UIRoundToScale();
    double v17 = v21;

    double v15 = 0.0;
    double v11 = 0.0;
  }
  else
  {
    [(CNComposeHeaderView *)self overrideContentMargins];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
  }
  [(CNComposeHeaderView *)self bounds];
  double v23 = v13 + v22;
  double v25 = v11 + v24;
  double v27 = v26 - (v17 + v13);
  double v29 = v28 - (v15 + v11);
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v23;
  return result;
}

- (double)_additionalContentHeight
{
  double v3 = [(CNComposeHeaderView *)self composeFieldInfoLabel];
  double v4 = [v3 superview];

  double v5 = 0.0;
  if (v4 == self)
  {
    double v6 = [(CNComposeHeaderView *)self composeFieldInfoLabel];
    [v6 bounds];
    double v5 = v7;
  }
  return v5;
}

- (CGRect)titleLabelBaselineAlignmentRectForLabel:(id)a3
{
  id v4 = a3;
  double v5 = [(CNComposeHeaderView *)self labelView];
  [v5 layoutSubviews];

  uint64_t v6 = [(CNComposeHeaderView *)self labelView];
  [(id)v6 frame];
  CGFloat v45 = v7;
  CGFloat v9 = v8;
  double v11 = v10;
  CGFloat v13 = v12;

  LOBYTE(v6) = [(CNComposeHeaderView *)self _shouldReverseLayoutDirection];
  [(CNComposeHeaderView *)self _contentRect];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  [v4 frame];
  CGFloat rect = v22;
  [v4 frame];
  double v24 = v23;
  v47.origin.CGFloat x = v15;
  v47.origin.CGFloat y = v17;
  v47.size.CGFloat width = v19;
  v47.size.CGFloat height = v21;
  double v25 = fmax(fmin(v24, CGRectGetWidth(v47) + -6.0 - v11), 0.0);
  CGFloat v26 = v45;
  CGFloat v27 = v9;
  double v28 = v11;
  CGFloat v29 = v13;
  if (v6) {
    double v30 = CGRectGetMinX(*(CGRect *)&v26) + -6.0 - v25;
  }
  else {
    double v30 = CGRectGetMaxX(*(CGRect *)&v26) + 6.0;
  }
  v48.origin.CGFloat x = v45;
  v48.origin.CGFloat y = v9;
  v48.size.CGFloat width = v11;
  v48.size.CGFloat height = v13;
  double MaxY = CGRectGetMaxY(v48);
  [v4 frame];
  double Height = CGRectGetHeight(v49);
  double v33 = [(CNComposeHeaderView *)self labelView];
  [v33 _baselineOffsetFromBottom];
  double v35 = v34;

  [v4 _baselineOffsetFromBottom];
  v50.origin.CGFloat y = MaxY - v35 - (Height - v36);
  v50.origin.CGFloat x = v30;
  v50.size.CGFloat width = v25;
  v50.size.CGFloat height = rect;
  CGRect v51 = CGRectIntegral(v50);
  CGFloat x = v51.origin.x;
  CGFloat y = v51.origin.y;
  CGFloat width = v51.size.width;
  CGFloat v40 = v51.size.height;

  double v41 = x;
  double v42 = y;
  double v43 = width;
  double v44 = v40;
  result.size.CGFloat height = v44;
  result.size.CGFloat width = v43;
  result.origin.CGFloat y = v42;
  result.origin.CGFloat x = v41;
  return result;
}

- (BOOL)_canBecomeFirstResponder
{
  return 0;
}

- (void)handleTouchesEnded
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(CNComposeHeaderView *)self _canBecomeFirstResponder])
  {
    [(CNComposeHeaderView *)self becomeFirstResponder];
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    double v3 = [(CNComposeHeaderView *)self headerViewDelegates];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          double v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            [v8 composeHeaderViewClicked:self];
            goto LABEL_15;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CNComposeHeaderView;
  [(CNComposeHeaderView *)&v5 touchesBegan:a3 withEvent:a4];
  if ([(CNComposeHeaderView *)self showsHighlightWhenTouched]) {
    [(CNComposeHeaderView *)self setHighlighted:1 animated:0];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  [(CNComposeHeaderView *)self handleTouchesEnded];
  if ([(CNComposeHeaderView *)self showsHighlightWhenTouched])
  {
    [(CNComposeHeaderView *)self setHighlighted:0 animated:1];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CNComposeHeaderView;
  [(CNComposeHeaderView *)&v5 touchesCancelled:a3 withEvent:a4];
  if ([(CNComposeHeaderView *)self showsHighlightWhenTouched]) {
    [(CNComposeHeaderView *)self setHighlighted:0 animated:1];
  }
}

- (id)_highlightedBackgroundView
{
  highlightedBackgroundView = self->_highlightedBackgroundView;
  if (!highlightedBackgroundView)
  {
    [(CNComposeHeaderView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10 + -1.0;
    [(id)objc_opt_class() separatorHeight];
    CGFloat v13 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v5, v11, v7, v9 + v12);
    uint64_t v14 = self->_highlightedBackgroundView;
    self->_highlightedBackgroundView = v13;

    [(UIView *)self->_highlightedBackgroundView setAutoresizingMask:18];
    CGFloat v15 = [MEMORY[0x1E4F428B8] colorWithWhite:0.85 alpha:1.0];
    [(UIView *)self->_highlightedBackgroundView setBackgroundColor:v15];

    highlightedBackgroundView = self->_highlightedBackgroundView;
  }

  return highlightedBackgroundView;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__CNComposeHeaderView_setHighlighted_animated___block_invoke;
  v11[3] = &unk_1E6128D08;
  BOOL v12 = a3;
  v11[4] = self;
  double v7 = (void (**)(void))MEMORY[0x1BA9A6470](v11, a2);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__CNComposeHeaderView_setHighlighted_animated___block_invoke_2;
  v9[3] = &unk_1E6128E20;
  BOOL v10 = a3;
  v9[4] = self;
  double v8 = (void (**)(void, void))MEMORY[0x1BA9A6470](v9);
  if (v4)
  {
    [MEMORY[0x1E4F42FF0] animateWithDuration:v7 animations:v8 completion:0.3];
  }
  else
  {
    v7[2](v7);
    v8[2](v8, 1);
  }
}

void __47__CNComposeHeaderView_setHighlighted_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    v2 = *(void **)(a1 + 32);
    double v3 = [v2 highlightedBackgroundView];
    BOOL v4 = [*(id *)(a1 + 32) separator];
    [v2 insertSubview:v3 aboveSubview:v4];

    if (*(unsigned char *)(a1 + 40)) {
      double v5 = 1.0;
    }
    else {
      double v5 = 0.0;
    }
  }
  else
  {
    double v5 = 0.0;
  }
  id v6 = [*(id *)(a1 + 32) highlightedBackgroundView];
  [v6 setAlpha:v5];
}

void __47__CNComposeHeaderView_setHighlighted_animated___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40))
  {
    id v1 = [*(id *)(a1 + 32) highlightedBackgroundView];
    [v1 removeFromSuperview];
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)refreshPreferredContentSize
{
  double v3 = +[CNAutocompleteFontMetricCache sharedFontMetricCache];
  [v3 ensureCacheIsValid];

  BOOL v4 = [(CNComposeHeaderView *)self labelView];
  double v5 = [(id)objc_opt_class() defaultFont];
  [v4 setFont:v5];

  [(CNComposeHeaderView *)self setNeedsLayout];
}

- (id)_baseAttributes
{
  v12[3] = *MEMORY[0x1E4F143B8];
  double v3 = [(id)objc_opt_class() defaultFont];
  id v4 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v3 _bodyLeading];
  [v4 setLineSpacing:v5 * 0.55];
  [(CNComposeHeaderView *)self _recipientViewEdgeInsets];
  [v4 setHeadIndent:v6];
  if ([(CNComposeHeaderView *)self _shouldReverseLayoutDirection]) {
    [v4 setBaseWritingDirection:1];
  }
  v11[0] = *MEMORY[0x1E4FB06F8];
  double v7 = [(id)objc_opt_class() defaultFont];
  v12[0] = v7;
  v11[1] = *MEMORY[0x1E4FB0700];
  double v8 = [MEMORY[0x1E4F428B8] labelColor];
  v11[2] = *MEMORY[0x1E4FB0738];
  v12[1] = v8;
  v12[2] = v4;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  return v9;
}

- (UIEdgeInsets)_recipientViewEdgeInsets
{
  double v3 = [(id)objc_opt_class() defaultFont];
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  [v3 ascender];
  double v6 = [(CNComposeHeaderView *)self labelView];
  [v6 frame];
  CGRectGetMaxY(v24);
  double v7 = [(CNComposeHeaderView *)self labelView];
  [v7 _baselineOffsetFromBottom];

  double v8 = [MEMORY[0x1E4F42738] sharedApplication];
  double v9 = [v8 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v9);

  if (IsAccessibilityCategory)
  {
    [v3 capHeight];
    double v12 = round(v11 * 0.5);
    [v3 capHeight];
    double v14 = v13 * 0.5;
  }
  else
  {
    UIFloorToViewScale();
    double v12 = v15;
    [(id)objc_opt_class() preferredHeight];
    double v17 = v16;
    [v3 _bodyLeading];
    double v14 = v17 - (v12 + v18);
  }
  double v19 = round(v14);

  double v20 = v12;
  double v21 = v4;
  double v22 = v19;
  double v23 = v5;
  result.right = v23;
  result.bottom = v22;
  result.left = v21;
  result.top = v20;
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
  double v21 = *MEMORY[0x1E4F1DB28];
  if (a4 == 2)
  {
    v38.origin.CGFloat x = v8;
    v38.origin.CGFloat y = v10;
    v38.size.CGFloat width = v12;
    v38.size.CGFloat height = v14;
    double v22 = CGRectGetMaxX(v38) + 5.0;
  }
  else
  {
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    if (a4 == 8)
    {
      CGFloat rect = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      CGFloat v23 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      v35.origin.CGFloat x = v8;
      v35.origin.CGFloat y = v10;
      v35.size.CGFloat width = v12;
      v35.size.CGFloat height = v14;
      double v21 = CGRectGetMinX(v35) + -5.0;
      [(CNComposeHeaderView *)self bounds];
      double Width = CGRectGetWidth(v36);
      v37.origin.CGFloat x = v21;
      v37.origin.CGFloat y = v23;
      v37.size.CGFloat width = v22;
      v37.size.CGFloat height = rect;
      double v22 = Width - CGRectGetMinX(v37);
    }
  }
  [(CNComposeHeaderView *)self _recipientViewEdgeInsets];
  double v26 = v25;
  v39.origin.CGFloat x = v8;
  v39.origin.CGFloat y = v10;
  v39.size.CGFloat width = v12;
  v39.size.CGFloat height = v14;
  double MaxY = CGRectGetMaxY(v39);
  [(CNComposeHeaderView *)self _recipientViewEdgeInsets];
  double v29 = MaxY - v28;

  double v30 = v21;
  double v31 = v26;
  double v32 = v22;
  double v33 = v29;
  result.size.CGFloat height = v33;
  result.size.CGFloat width = v32;
  result.origin.CGFloat y = v31;
  result.origin.CGFloat x = v30;
  return result;
}

- (NSString)navTitle
{
  return self->_navTitle;
}

- (void)setNavTitle:(id)a3
{
}

- (CNComposeHeaderLabelView)labelView
{
  return self->_labelView;
}

- (void)setLabelView:(id)a3
{
}

- (BOOL)showsHighlightWhenTouched
{
  return self->_showsHighlightWhenTouched;
}

- (void)setShowsHighlightWhenTouched:(BOOL)a3
{
  self->_showsHighlightWhenTouched = a3;
}

- (CNComposeHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNComposeHeaderViewDelegate *)WeakRetained;
}

- (NSString)composeFieldInfoText
{
  return self->_composeFieldInfoText;
}

- (NSDirectionalEdgeInsets)separatorDirectionalEdgeInsets
{
  double top = self->_separatorDirectionalEdgeInsets.top;
  double leading = self->_separatorDirectionalEdgeInsets.leading;
  double bottom = self->_separatorDirectionalEdgeInsets.bottom;
  double trailing = self->_separatorDirectionalEdgeInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setSeparatorDirectionalEdgeInsets:(NSDirectionalEdgeInsets)a3
{
  self->_separatorDirectionalEdgeInsets = a3;
}

- (UIEdgeInsets)overrideContentMargins
{
  double top = self->_overrideContentMargins.top;
  double left = self->_overrideContentMargins.left;
  double bottom = self->_overrideContentMargins.bottom;
  double right = self->_overrideContentMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setOverrideContentMargins:(UIEdgeInsets)a3
{
  self->_overrideContentMargins = a3;
}

- (CNComposeHeaderViewDelegate)internalDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);

  return (CNComposeHeaderViewDelegate *)WeakRetained;
}

- (void)setInternalDelegate:(id)a3
{
}

- (UILabel)composeFieldInfoLabel
{
  return self->_composeFieldInfoLabel;
}

- (void)setComposeFieldInfoLabel:(id)a3
{
}

- (UIView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
}

- (UIView)highlightedBackgroundView
{
  return self->_highlightedBackgroundView;
}

- (void)setHighlightedBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedBackgroundView, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_composeFieldInfoLabel, 0);
  objc_destroyWeak((id *)&self->_internalDelegate);
  objc_storeStrong((id *)&self->_composeFieldInfoText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_labelView, 0);

  objc_storeStrong((id *)&self->_navTitle, 0);
}

- (id)_automationID
{
  double v3 = [(CNComposeHeaderView *)self label];
  if ([v3 length])
  {
    double v4 = [(CNComposeHeaderView *)self label];
    double v5 = [@"BTN " stringByAppendingString:v4];
  }
  else
  {
    double v5 = [@"BTN " stringByAppendingString:@"NoLabel"];
  }

  return v5;
}

@end