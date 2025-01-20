@interface MFComposeMultiView
- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4;
- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4;
- (BOOL)accountHasUnsafeDomain;
- (BOOL)isAccountAutoselected;
- (MFComposeMultiView)initWithFrame:(CGRect)a3;
- (MFComposeMultiViewDelegate)scribbleDelegate;
- (id)_accountDescriptionAttributedString;
- (id)accountLabel;
- (id)imageSizeHeaderLabelView;
- (id)imageSizeLabel;
- (id)labelColor;
- (id)placeholderImageSizeLabel;
- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6;
- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5;
- (void)layoutSubviews;
- (void)refreshPreferredContentSize;
- (void)setAccountAutoselected:(BOOL)a3;
- (void)setAccountDescription:(id)a3;
- (void)setAccountHasUnsafeDomain:(BOOL)a3;
- (void)setImageSizeDescription:(id)a3;
- (void)setScribbleDelegate:(id)a3;
- (void)setShowsImageSize:(BOOL)a3;
- (void)showLoadingState:(BOOL)a3;
@end

@implementation MFComposeMultiView

- (MFComposeMultiView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MFComposeMultiView;
  v3 = -[MFComposeMultiView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MFComposeMultiView *)v3 setShowsHighlightWhenTouched:1];
    id v5 = objc_alloc_init(MEMORY[0x1E4F38E40]);
    [v5 setDelegate:v4];
    [v5 setElementSource:v4];
    [(MFComposeMultiView *)v4 addInteraction:v5];
  }
  return v4;
}

- (id)accountLabel
{
  v25[2] = *MEMORY[0x1E4F143B8];
  accountLabel = self->_accountLabel;
  if (!accountLabel)
  {
    v4 = objc_alloc_init(MFActivityIndicatorLabel);
    id v5 = self->_accountLabel;
    self->_accountLabel = v4;

    [(MFComposeMultiView *)self bounds];
    -[MFActivityIndicatorLabel setFrame:](self->_accountLabel, "setFrame:");
    v6 = [(id)objc_opt_class() defaultFont];
    objc_super v7 = [(MFActivityIndicatorLabel *)self->_accountLabel textLabel];
    [v7 setFont:v6];

    v8 = [(MFComposeMultiView *)self labelColor];
    v9 = [(MFActivityIndicatorLabel *)self->_accountLabel textLabel];
    [v9 setTextColor:v8];

    [(MFActivityIndicatorLabel *)self->_accountLabel sizeToFit];
    v10 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v11 = [v10 userInterfaceLayoutDirection];

    if (v11 == 1)
    {
      v12 = [(MFActivityIndicatorLabel *)self->_accountLabel textLabel];
      [v12 setTextAlignment:2];
    }
    [(MFComposeMultiView *)self addSubview:self->_accountLabel];
    v13 = (void *)MEMORY[0x1E4F28DC8];
    v24 = [(MFComposeMultiView *)self labelView];
    v23 = [v24 trailingAnchor];
    v22 = [(MFActivityIndicatorLabel *)self->_accountLabel leadingAnchor];
    v14 = objc_msgSend(v23, "constraintEqualToAnchor:constant:", 6.0);
    v25[0] = v14;
    v15 = [(MFActivityIndicatorLabel *)self->_accountLabel textLabel];
    v16 = [v15 firstBaselineAnchor];
    v17 = [(MFComposeMultiView *)self labelView];
    v18 = [v17 firstBaselineAnchor];
    UIRoundToViewScale();
    v19 = objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18);
    v25[1] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    [v13 activateConstraints:v20];

    accountLabel = self->_accountLabel;
  }

  return accountLabel;
}

- (id)imageSizeLabel
{
  imageSizeLabel = self->_imageSizeLabel;
  if (!imageSizeLabel)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    id v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = self->_imageSizeLabel;
    self->_imageSizeLabel = v5;

    objc_super v7 = self->_imageSizeLabel;
    v8 = [(id)objc_opt_class() defaultFont];
    [(UILabel *)v7 setFont:v8];

    v9 = self->_imageSizeLabel;
    v10 = [(MFComposeMultiView *)self labelColor];
    [(UILabel *)v9 setTextColor:v10];

    [(UILabel *)self->_imageSizeLabel setAlpha:0.0];
    [(UILabel *)self->_imageSizeLabel sizeToFit];
    [(UILabel *)self->_imageSizeLabel setAccessibilityIdentifier:*MEMORY[0x1E4F73BE0]];
    [(MFComposeMultiView *)self addSubview:self->_imageSizeLabel];
    imageSizeLabel = self->_imageSizeLabel;
  }

  return imageSizeLabel;
}

- (id)placeholderImageSizeLabel
{
  placeholderImageSizeLabel = self->_placeholderImageSizeLabel;
  if (!placeholderImageSizeLabel)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    id v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = self->_placeholderImageSizeLabel;
    self->_placeholderImageSizeLabel = v5;

    objc_super v7 = self->_placeholderImageSizeLabel;
    v8 = [(id)objc_opt_class() defaultFont];
    [(UILabel *)v7 setFont:v8];

    v9 = self->_placeholderImageSizeLabel;
    v10 = [(MFComposeMultiView *)self labelColor];
    [(UILabel *)v9 setTextColor:v10];

    uint64_t v11 = self->_placeholderImageSizeLabel;
    v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"IMAGE_SIZE_PLACEHOLDER_DURING_COMPUTATION" value:&stru_1F0817A00 table:@"Main"];
    [(UILabel *)v11 setText:v13];

    [(UILabel *)self->_placeholderImageSizeLabel setAlpha:0.0];
    [(UILabel *)self->_placeholderImageSizeLabel sizeToFit];
    [(MFComposeMultiView *)self addSubview:self->_placeholderImageSizeLabel];
    placeholderImageSizeLabel = self->_placeholderImageSizeLabel;
  }

  return placeholderImageSizeLabel;
}

- (id)imageSizeHeaderLabelView
{
  imageSizeHeaderLabelView = self->_imageSizeHeaderLabelView;
  if (!imageSizeHeaderLabelView)
  {
    id v4 = (CNComposeHeaderLabelView *)objc_alloc_init(MEMORY[0x1E4F5A128]);
    id v5 = self->_imageSizeHeaderLabelView;
    self->_imageSizeHeaderLabelView = v4;

    v6 = self->_imageSizeHeaderLabelView;
    objc_super v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"IMAGE_RESIZING_BAR_TITLE" value:&stru_1F0817A00 table:@"Main"];
    [(CNComposeHeaderLabelView *)v6 setText:v8];

    [(CNComposeHeaderLabelView *)self->_imageSizeHeaderLabelView setAlpha:0.0];
    [(CNComposeHeaderLabelView *)self->_imageSizeHeaderLabelView sizeToFit];
    [(CNComposeHeaderLabelView *)self->_imageSizeHeaderLabelView frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    [(MFComposeMultiView *)self frame];
    -[CNComposeHeaderLabelView setFrame:](self->_imageSizeHeaderLabelView, "setFrame:", v15, v10, v12, v14);
    [(MFComposeMultiView *)self addSubview:self->_imageSizeHeaderLabelView];
    imageSizeHeaderLabelView = self->_imageSizeHeaderLabelView;
  }

  return imageSizeHeaderLabelView;
}

- (id)_accountDescriptionAttributedString
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->_accountDescription length])
  {
    uint64_t v7 = *MEMORY[0x1E4FB0700];
    if (self->_accountHasUnsafeDomain) {
      [MEMORY[0x1E4FB1618] systemRedColor];
    }
    else {
    id v4 = [(MFComposeMultiView *)self labelColor];
    }
    v8[0] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

    v3 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:self->_accountDescription attributes:v5];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setAccountHasUnsafeDomain:(BOOL)a3
{
  if (self->_accountHasUnsafeDomain != a3)
  {
    self->_accountHasUnsafeDomain = a3;
    id v6 = [(MFComposeMultiView *)self accountLabel];
    id v4 = [v6 textLabel];
    id v5 = [(MFComposeMultiView *)self _accountDescriptionAttributedString];
    [v4 setAttributedText:v5];
  }
}

- (void)setAccountDescription:(id)a3
{
  id v5 = (NSString *)a3;
  if (self->_accountDescription != v5)
  {
    double v9 = v5;
    objc_storeStrong((id *)&self->_accountDescription, a3);
    id v6 = [(MFComposeMultiView *)self accountLabel];
    uint64_t v7 = [v6 textLabel];
    v8 = [(MFComposeMultiView *)self _accountDescriptionAttributedString];
    [v7 setAttributedText:v8];

    id v5 = v9;
  }
}

- (void)setImageSizeDescription:(id)a3
{
  id v5 = a3;
  id v4 = [(MFComposeMultiView *)self imageSizeLabel];
  [v4 setText:v5];
}

- (void)setShowsImageSize:(BOOL)a3
{
  self->_imageSizeShown = a3;
}

- (void)showLoadingState:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MFComposeMultiView *)self accountLabel];
  id v5 = v4;
  if (v3) {
    [v4 startAnimating];
  }
  else {
    [v4 stopAnimating];
  }
}

- (void)layoutSubviews
{
  v61.receiver = self;
  v61.super_class = (Class)MFComposeMultiView;
  [(MFComposeMultiView *)&v61 layoutSubviews];
  uint64_t v3 = [(MFComposeMultiView *)self effectiveUserInterfaceLayoutDirection];
  [(MFActivityIndicatorLabel *)self->_accountLabel sizeToFit];
  [(MFActivityIndicatorLabel *)self->_accountLabel frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(MFComposeMultiView *)self labelView];
  [v12 frame];
  double v14 = v13;
  double v16 = v15;

  double v17 = v16 + v14 + 6.0;
  if (v3 == 1)
  {
    double v17 = v5;
    double v18 = v14 + -6.0;
  }
  else
  {
    double v18 = v9;
  }
  -[MFActivityIndicatorLabel setFrame:](self->_accountLabel, "setFrame:", v17, v7, v18, v11);
  if (objc_msgSend(MEMORY[0x1E4FB16C8], "mf_isPad"))
  {
    if (self->_imageSizeShown)
    {
      v19 = [(UILabel *)self->_imageSizeLabel text];

      v20 = [(MFComposeMultiView *)self imageSizeHeaderLabelView];
      [v20 setAlpha:1.0];

      v21 = [(MFComposeMultiView *)self imageSizeLabel];
      v22 = v21;
      if (v19) {
        double v23 = 1.0;
      }
      else {
        double v23 = 0.0;
      }
      [v21 setAlpha:v23];

      v24 = [(MFComposeMultiView *)self placeholderImageSizeLabel];
      v25 = v24;
      double v26 = 1.0;
      if (v19) {
        double v26 = 0.0;
      }
      [v24 setAlpha:v26];

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __36__MFComposeMultiView_layoutSubviews__block_invoke;
      aBlock[3] = &unk_1E5F79908;
      BOOL v60 = v3 == 1;
      aBlock[4] = self;
      v27 = (double (**)(void, double, double))_Block_copy(aBlock);
      [(UILabel *)self->_imageSizeLabel sizeToFit];
      v28 = [(MFComposeMultiView *)self labelView];
      [v28 frame];
      double v30 = v29;
      double v32 = v31;

      [(UILabel *)self->_imageSizeLabel frame];
      double v34 = v33;
      double v36 = v35;
      double v37 = v27[2](v27, v30, v32);
      -[UILabel setFrame:](self->_imageSizeLabel, "setFrame:", v37, v32, v34, v36);
      [(UILabel *)self->_placeholderImageSizeLabel sizeToFit];
      double v57 = v36;
      double v58 = v34;
      [(UILabel *)self->_imageSizeLabel frame];
      double v39 = v38;
      double v41 = v40;
      [(UILabel *)self->_placeholderImageSizeLabel frame];
      double v43 = v42;
      double v45 = v44;
      double v46 = v27[2](v27, v39, v41);
      -[UILabel setFrame:](self->_placeholderImageSizeLabel, "setFrame:", v46, v41, v43, v45);
      [(CNComposeHeaderLabelView *)self->_imageSizeHeaderLabelView frame];
      double v48 = v47;
      double v50 = v49;
      if (v19)
      {
        double v51 = v37;
      }
      else
      {
        double v32 = v41;
        double v51 = v46;
      }
      if (v3 == 1)
      {
        if (v19) {
          double v52 = v58;
        }
        else {
          double v52 = v43;
        }
        if (v19) {
          double v53 = v57;
        }
        else {
          double v53 = v45;
        }
        double v54 = v32;
        double v55 = CGRectGetMaxX(*(CGRect *)&v51) + 6.0;
      }
      else
      {
        double v55 = v51 + -6.0 - v47;
      }
      -[CNComposeHeaderLabelView setFrame:](self->_imageSizeHeaderLabelView, "setFrame:", v55, v32, v48, v50);
    }
    else
    {
      imageSizeHeaderLabelView = self->_imageSizeHeaderLabelView;
      if (imageSizeHeaderLabelView)
      {
        [(CNComposeHeaderLabelView *)imageSizeHeaderLabelView setAlpha:0.0];
        [(UILabel *)self->_imageSizeLabel setAlpha:0.0];
        [(UILabel *)self->_placeholderImageSizeLabel setAlpha:0.0];
      }
    }
  }
}

double __36__MFComposeMultiView_layoutSubviews__block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(a1 + 32) _contentRect];
    return CGRectGetMinX(*(CGRect *)&v4);
  }
  else
  {
    [*(id *)(a1 + 32) _contentRect];
    return CGRectGetMaxX(v11) - a4;
  }
}

- (void)refreshPreferredContentSize
{
  v8.receiver = self;
  v8.super_class = (Class)MFComposeMultiView;
  [(MFComposeMultiView *)&v8 refreshPreferredContentSize];
  uint64_t v3 = [(id)objc_opt_class() defaultFont];
  accountLabel = self->_accountLabel;
  if (accountLabel)
  {
    double v5 = [(MFActivityIndicatorLabel *)accountLabel textLabel];
    [v5 setFont:v3];
  }
  imageSizeLabel = self->_imageSizeLabel;
  if (imageSizeLabel) {
    [(UILabel *)imageSizeLabel setFont:v3];
  }
  placeholderImageSizeLabel = self->_placeholderImageSizeLabel;
  if (placeholderImageSizeLabel) {
    [(UILabel *)placeholderImageSizeLabel setFont:v3];
  }
  [(MFComposeMultiView *)self setNeedsLayout];
}

- (id)labelColor
{
  if (self->_accountAutoselected)
  {
    v2 = (void *)labelColor_autoselectedColor;
    if (!labelColor_autoselectedColor)
    {
      uint64_t v3 = [MEMORY[0x1E4FB1618] mailSenderAddressPickerColorNormalTextColor];
      uint64_t v4 = (void *)labelColor_autoselectedColor;
      labelColor_autoselectedColor = v3;

      v2 = (void *)labelColor_autoselectedColor;
    }
    id v5 = v2;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MFComposeMultiView;
    id v5 = [(MFComposeMultiView *)&v7 labelColor];
  }

  return v5;
}

- (void)setAccountAutoselected:(BOOL)a3
{
  if (self->_accountAutoselected != a3)
  {
    self->_accountAutoselected = a3;
    id v5 = [(MFActivityIndicatorLabel *)self->_accountLabel textLabel];
    uint64_t v4 = [(MFComposeMultiView *)self labelColor];
    [v5 setTextColor:v4];
  }
}

- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  return 1;
}

- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4
{
  return 1;
}

- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  v9[1] = *MEMORY[0x1E4F143B8];
  double v6 = (void (**)(id, void *, uint64_t))a5;
  objc_super v7 = [(MFComposeMultiView *)self label];
  v9[0] = v7;
  objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v6[2](v6, v8, 0x7FFFFFFFFFFFFFFFLL);
}

- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6
{
  double v10 = (void (**)(id, void *))a6;
  objc_super v7 = [(MFComposeMultiView *)self scribbleDelegate];
  objc_super v8 = [v7 recipientTextViewForComposeMultiView:self];

  [v8 becomeFirstResponder];
  double v9 = [v8 textView];
  v10[2](v10, v9);
}

- (BOOL)accountHasUnsafeDomain
{
  return self->_accountHasUnsafeDomain;
}

- (BOOL)isAccountAutoselected
{
  return self->_accountAutoselected;
}

- (MFComposeMultiViewDelegate)scribbleDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleDelegate);

  return (MFComposeMultiViewDelegate *)WeakRetained;
}

- (void)setScribbleDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scribbleDelegate);
  objc_storeStrong((id *)&self->_accountDescription, 0);
  objc_storeStrong((id *)&self->_placeholderImageSizeLabel, 0);
  objc_storeStrong((id *)&self->_imageSizeLabel, 0);
  objc_storeStrong((id *)&self->_imageSizeHeaderLabelView, 0);

  objc_storeStrong((id *)&self->_accountLabel, 0);
}

@end