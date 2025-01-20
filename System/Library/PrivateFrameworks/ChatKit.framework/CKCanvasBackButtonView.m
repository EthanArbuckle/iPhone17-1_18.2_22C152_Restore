@interface CKCanvasBackButtonView
- (BOOL)shouldShowTitlePaddingView;
- (CGSize)_titlePaddingViewSizeForTitle;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKCanvasBackButtonView)initWithFrame:(CGRect)a3 showPaddingTitleView:(BOOL)a4;
- (UIColor)titleLabelColor;
- (UIImageView)backButtonView;
- (UILabel)titleLabel;
- (UIView)titlePaddingView;
- (id)pointerInteraction:(id)a3 regionForLocation:(CGPoint)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4 modifiers:(int64_t)a5;
- (void)_setVisuallyHighlighted:(BOOL)a3;
- (void)layoutSubviews;
- (void)setBackButtonTitle:(id)a3;
- (void)setBackButtonView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setShouldShowTitlePaddingView:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLabelColor:(id)a3;
- (void)setTitlePaddingView:(id)a3;
- (void)sizeToFit;
- (void)tintColorDidChange;
@end

@implementation CKCanvasBackButtonView

- (CKCanvasBackButtonView)initWithFrame:(CGRect)a3 showPaddingTitleView:(BOOL)a4
{
  BOOL v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)CKCanvasBackButtonView;
  v5 = -[CKCanvasBackButtonView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    [(CKCanvasBackButtonView *)v5 setShouldShowTitlePaddingView:v4];
    [(CKCanvasBackButtonView *)v6 setAccessibilityIdentifier:@"backButton"];
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F42CA0]) initWithDelegate:v6];
    [(CKCanvasBackButtonView *)v6 addInteraction:v7];
  }
  return v6;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CKCanvasBackButtonView;
  -[CKCanvasBackButtonView setHighlighted:](&v5, sel_setHighlighted_);
  [(CKCanvasBackButtonView *)self _setVisuallyHighlighted:v3];
}

- (void)setBackButtonTitle:(id)a3
{
  id v10 = a3;
  if (v10)
  {
    BOOL v4 = [(CKCanvasBackButtonView *)self titleLabel];
    [v4 setHidden:0];

    objc_super v5 = [(CKCanvasBackButtonView *)self titlePaddingView];
    [v5 setHidden:0];

    v6 = [(CKCanvasBackButtonView *)self titleLabel];
    [v6 setText:v10];

    v7 = [(CKCanvasBackButtonView *)self titleLabel];
    [v7 sizeToFit];

    [(CKCanvasBackButtonView *)self setNeedsLayout];
  }
  else
  {
    v8 = [(CKCanvasBackButtonView *)self titlePaddingView];
    [v8 setHidden:1];

    objc_super v9 = [(CKCanvasBackButtonView *)self titleLabel];
    [v9 setHidden:1];
  }
}

- (void)setShouldShowTitlePaddingView:(BOOL)a3
{
  if (self->_shouldShowTitlePaddingView != a3)
  {
    self->_shouldShowTitlePaddingView = a3;
    if (!a3) {
      [(CKCanvasBackButtonView *)self setTitlePaddingView:0];
    }
  }
}

- (UIImageView)backButtonView
{
  backButtonView = self->_backButtonView;
  if (!backButtonView)
  {
    BOOL v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
    objc_super v5 = self->_backButtonView;
    self->_backButtonView = v4;

    v6 = [MEMORY[0x1E4F42A80] kitImageNamed:@"UINavigationBarBackIndicatorDefault.png"];
    v7 = [v6 imageWithRenderingMode:2];

    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
    {
      uint64_t v8 = [v7 imageFlippedForRightToLeftLayoutDirection];

      v7 = (void *)v8;
    }
    [(UIImageView *)self->_backButtonView setImage:v7];
    [(UIImageView *)self->_backButtonView setUserInteractionEnabled:0];
    [(UIImageView *)self->_backButtonView sizeToFit];
    [(CKCanvasBackButtonView *)self addSubview:self->_backButtonView];

    backButtonView = self->_backButtonView;
  }

  return backButtonView;
}

- (UILabel)titleLabel
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
    objc_super v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = self->_titleLabel;
    self->_titleLabel = v5;

    v7 = [MEMORY[0x1E4FB08E0] defaultFontForTextStyle:*MEMORY[0x1E4F43880]];
    [(UILabel *)self->_titleLabel setFont:v7];

    [(UILabel *)self->_titleLabel setTextAlignment:1];
    [(UILabel *)self->_titleLabel setUserInteractionEnabled:0];
    uint64_t v8 = [(CKCanvasBackButtonView *)self titleLabelColor];
    if (v8) {
      [(CKCanvasBackButtonView *)self titleLabelColor];
    }
    else {
    objc_super v9 = [MEMORY[0x1E4F428B8] whiteColor];
    }
    [(UILabel *)self->_titleLabel setTextColor:v9];

    [(CKCanvasBackButtonView *)self addSubview:self->_titleLabel];
    titleLabel = self->_titleLabel;
  }

  return titleLabel;
}

- (UIView)titlePaddingView
{
  if ([(CKCanvasBackButtonView *)self shouldShowTitlePaddingView])
  {
    titlePaddingView = self->_titlePaddingView;
    if (!titlePaddingView)
    {
      id v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
      objc_super v5 = self->_titlePaddingView;
      self->_titlePaddingView = v4;

      v6 = [(CKCanvasBackButtonView *)self tintColor];
      [(UIView *)self->_titlePaddingView setBackgroundColor:v6];

      [(UIView *)self->_titlePaddingView setUserInteractionEnabled:0];
      v7 = [(UIView *)self->_titlePaddingView layer];
      [v7 setMasksToBounds:0];

      uint64_t v8 = [(UIView *)self->_titlePaddingView layer];
      [v8 setAllowsEdgeAntialiasing:1];

      objc_super v9 = self->_titlePaddingView;
      id v10 = [(CKCanvasBackButtonView *)self titleLabel];
      [(CKCanvasBackButtonView *)self insertSubview:v9 belowSubview:v10];

      titlePaddingView = self->_titlePaddingView;
    }
    v11 = titlePaddingView;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)tintColorDidChange
{
  v11.receiver = self;
  v11.super_class = (Class)CKCanvasBackButtonView;
  [(CKCanvasBackButtonView *)&v11 tintColorDidChange];
  BOOL v3 = [(CKCanvasBackButtonView *)self tintColor];
  [(UIView *)self->_titlePaddingView setBackgroundColor:v3];

  id v4 = [(CKCanvasBackButtonView *)self tintColor];
  objc_super v5 = +[CKUIBehavior sharedBehaviors];
  v6 = [v5 theme];
  v7 = [v6 entryFieldDarkEffectButtonColor];
  int v8 = [v4 isEqual:v7];

  if (v8)
  {
    objc_super v9 = [(CKCanvasBackButtonView *)self tintColor];
    [(UILabel *)self->_titleLabel setTextColor:v9];
  }
  else
  {
    objc_super v9 = [(CKCanvasBackButtonView *)self titleLabelColor];
    if (v9) {
      [(CKCanvasBackButtonView *)self titleLabelColor];
    }
    else {
    id v10 = [MEMORY[0x1E4F428B8] whiteColor];
    }
    [(UILabel *)self->_titleLabel setTextColor:v10];
  }
}

- (void)sizeToFit
{
  [(CKCanvasBackButtonView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[CKCanvasBackButtonView sizeThatFits:](self, "sizeThatFits:", v7, v8);
  -[CKCanvasBackButtonView setBounds:](self, "setBounds:", v4, v6, v9, v10);

  [(CKCanvasBackButtonView *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(CKCanvasBackButtonView *)self _titlePaddingViewSizeForTitle];
  double v5 = v4;
  double v7 = v6;
  if ([(CKCanvasBackButtonView *)self wantsChromelessAppearance])
  {
    double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v9 = +[CKUIBehavior sharedBehaviors];
    [v9 navigationBarBackButtonMargin];
    double v11 = v5 + v10;
  }
  else
  {
    v12 = [(CKCanvasBackButtonView *)self backButtonView];
    [v12 bounds];
    double v14 = v13;
    double v8 = v15;

    double v9 = +[CKUIBehavior sharedBehaviors];
    [v9 navigationBarBackButtonMargin];
    double v11 = v5 + v14 + v16 + 7.0;
  }

  if (v8 >= v7) {
    double v17 = v8;
  }
  else {
    double v17 = v7;
  }
  double v18 = v11;
  result.height = v17;
  result.width = v18;
  return result;
}

- (void)layoutSubviews
{
  v58.receiver = self;
  v58.super_class = (Class)CKCanvasBackButtonView;
  [(CKCanvasBackButtonView *)&v58 layoutSubviews];
  [(CKCanvasBackButtonView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = [(CKCanvasBackButtonView *)self titleLabel];
  [v11 frame];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  if ([(CKCanvasBackButtonView *)self wantsChromelessAppearance])
  {
    double v20 = 7.0;
  }
  else
  {
    CGFloat v49 = v19;
    CGFloat v53 = v15;
    CGFloat v54 = v10;
    CGFloat v55 = v8;
    v21 = [(CKCanvasBackButtonView *)self backButtonView];
    [v21 frame];
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;

    double v50 = v17;
    double v51 = v6;
    CGFloat rect = v25;
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection])
    {
      v59.origin.x = v4;
      v59.origin.y = v6;
      v59.size.height = v54;
      v59.size.width = v55;
      double Width = CGRectGetWidth(v59);
      v60.origin.x = v23;
      v60.origin.y = v25;
      v60.size.width = v27;
      v60.size.height = v29;
      double v31 = Width - CGRectGetWidth(v60);
      v32 = +[CKUIBehavior sharedBehaviors];
      [v32 navigationBarBackButtonMargin];
      double v34 = v31 - v33;
      if (CKMainScreenScale_once_105 != -1) {
        dispatch_once(&CKMainScreenScale_once_105, &__block_literal_global_278);
      }
      CGFloat v19 = v49;
      double v35 = *(double *)&CKMainScreenScale_sMainScreenScale_105;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_105 == 0.0) {
        double v35 = 1.0;
      }
      double v36 = round(v34 * v35) / v35;

      v61.origin.x = v36;
      v61.origin.y = rect;
      v61.size.width = v27;
      v61.size.height = v29;
      double MinX = CGRectGetMinX(v61);
      v62.origin.x = v13;
      v62.origin.y = v53;
      v62.size.width = v17;
      v62.size.height = v49;
      double v38 = MinX - (CGRectGetWidth(v62) + 7.0);
      if (CKMainScreenScale_once_105 != -1) {
        dispatch_once(&CKMainScreenScale_once_105, &__block_literal_global_278);
      }
      CGFloat v6 = v51;
    }
    else
    {
      v39 = +[CKUIBehavior sharedBehaviors];
      [v39 navigationBarBackButtonMargin];
      double v36 = v40;

      v63.origin.x = v36;
      v63.origin.y = v25;
      v63.size.width = v27;
      v63.size.height = v29;
      double v38 = CGRectGetMaxX(v63) + 7.0;
      if (CKMainScreenScale_once_105 != -1) {
        dispatch_once(&CKMainScreenScale_once_105, &__block_literal_global_278);
      }
      CGFloat v19 = v49;
    }
    double v41 = *(double *)&CKMainScreenScale_sMainScreenScale_105;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_105 == 0.0) {
      double v41 = 1.0;
    }
    double v20 = round(v38 * v41) / v41;
    double v42 = v4;
    v64.origin.x = v4;
    v64.origin.y = v6;
    v64.size.height = v54;
    v64.size.width = v55;
    CGFloat v43 = CGRectGetHeight(v64) * 0.5;
    v65.origin.x = v36;
    v65.origin.y = rect;
    v65.size.width = v27;
    v65.size.height = v29;
    double v44 = v43 - CGRectGetHeight(v65) * 0.5;
    if (CKMainScreenScale_once_105 != -1) {
      dispatch_once(&CKMainScreenScale_once_105, &__block_literal_global_278);
    }
    double v45 = *(double *)&CKMainScreenScale_sMainScreenScale_105;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_105 == 0.0) {
      double v45 = 1.0;
    }
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __40__CKCanvasBackButtonView_layoutSubviews__block_invoke;
    v57[3] = &unk_1E5621968;
    v57[4] = self;
    *(double *)&v57[5] = v36;
    *(double *)&v57[6] = round(v44 * v45) / v45;
    *(CGFloat *)&v57[7] = v27;
    *(CGFloat *)&v57[8] = v29;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v57];
    CGFloat v4 = v42;
    CGFloat v17 = v50;
    CGFloat v6 = v51;
    CGFloat v10 = v54;
    CGFloat v8 = v55;
    CGFloat v15 = v53;
  }
  v66.origin.x = v4;
  v66.origin.y = v6;
  v66.size.width = v8;
  v66.size.height = v10;
  double Height = CGRectGetHeight(v66);
  v67.origin.x = v20;
  v67.origin.y = v15;
  v67.size.width = v17;
  v67.size.height = v19;
  double v47 = CGRectGetHeight(v67);
  if (CKMainScreenScale_once_105 != -1) {
    dispatch_once(&CKMainScreenScale_once_105, &__block_literal_global_278);
  }
  double v48 = *(double *)&CKMainScreenScale_sMainScreenScale_105;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_105 == 0.0) {
    double v48 = 1.0;
  }
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __40__CKCanvasBackButtonView_layoutSubviews__block_invoke_2;
  v56[3] = &unk_1E5621968;
  v56[4] = self;
  *(double *)&v56[5] = v20;
  *(double *)&v56[6] = round((Height * 0.5 - v47 * 0.5) * v48) / v48;
  *(CGFloat *)&v56[7] = v17;
  *(CGFloat *)&v56[8] = v19;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v56];
}

void __40__CKCanvasBackButtonView_layoutSubviews__block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v5 = [*(id *)(a1 + 32) backButtonView];
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);
}

void __40__CKCanvasBackButtonView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  CGFloat v6 = [*(id *)(a1 + 32) titleLabel];
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);

  if ([*(id *)(a1 + 32) shouldShowTitlePaddingView])
  {
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    [*(id *)(a1 + 32) _titlePaddingViewSizeForTitle];
    double v10 = v9;
    double v12 = v11;
    CGFloat v13 = [*(id *)(a1 + 32) titlePaddingView];
    objc_msgSend(v13, "setFrame:", v7, v8, v10, v12);

    double v14 = [*(id *)(a1 + 32) titleLabel];
    [v14 center];
    double v16 = v15;
    double v18 = v17;
    CGFloat v19 = [*(id *)(a1 + 32) titlePaddingView];
    objc_msgSend(v19, "setCenter:", v16, v18);

    v29.origin.x = v7;
    v29.origin.y = v8;
    v29.size.width = v10;
    v29.size.height = v12;
    double Width = CGRectGetWidth(v29);
    v30.origin.x = v7;
    v30.origin.y = v8;
    v30.size.width = v10;
    v30.size.height = v12;
    double Height = CGRectGetHeight(v30);
    double v22 = [*(id *)(a1 + 32) titlePaddingView];
    CGFloat v23 = [v22 layer];
    [v23 setCornerRadius:Height * 0.5];

    double v24 = (uint64_t *)MEMORY[0x1E4F39EA0];
    if (Width != Height) {
      double v24 = (uint64_t *)MEMORY[0x1E4F39EA8];
    }
    uint64_t v25 = *v24;
    id v27 = [*(id *)(a1 + 32) titlePaddingView];
    double v26 = [v27 layer];
    [v26 setCornerCurve:v25];
  }
}

- (void)_setVisuallyHighlighted:(BOOL)a3
{
  double v3 = 1.0;
  if (a3) {
    double v3 = 0.2;
  }
  double v4 = 0.3;
  v5[1] = 3221225472;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[2] = __50__CKCanvasBackButtonView__setVisuallyHighlighted___block_invoke;
  v5[3] = &unk_1E5622950;
  if (a3) {
    double v4 = 0.17;
  }
  v5[4] = self;
  *(double *)&v5[5] = v3;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v5 animations:v4];
}

void __50__CKCanvasBackButtonView__setVisuallyHighlighted___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = [*(id *)(a1 + 32) titleLabel];
  [v3 setAlpha:v2];

  if (([*(id *)(a1 + 32) wantsChromelessAppearance] & 1) == 0)
  {
    double v4 = *(double *)(a1 + 40);
    double v5 = [*(id *)(a1 + 32) backButtonView];
    [v5 setAlpha:v4];
  }
  if ([*(id *)(a1 + 32) shouldShowTitlePaddingView])
  {
    double v6 = *(double *)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) titlePaddingView];
    [v7 setAlpha:v6];
  }
}

- (CGSize)_titlePaddingViewSizeForTitle
{
  double v3 = [(CKCanvasBackButtonView *)self titleLabel];
  objc_msgSend(v3, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  double v5 = v4;
  double v7 = v6;

  if (v5 < v7) {
    double v5 = v7;
  }
  double v8 = [(CKCanvasBackButtonView *)self titleLabel];
  double v9 = [v8 text];
  if ((unint64_t)[v9 length] <= 1) {
    double v10 = 2.0;
  }
  else {
    double v10 = 5.0;
  }

  double v11 = v5 + v10 * 2.0;
  double v12 = v7 + 4.0;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)pointerInteraction:(id)a3 regionForLocation:(CGPoint)a4 defaultRegion:(id)a5
{
  id v5 = a5;

  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4 modifiers:(int64_t)a5
{
  double v6 = (void *)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:self];
  double v7 = [MEMORY[0x1E4F42C90] effectWithPreview:v6];
  [(CKCanvasBackButtonView *)self frame];
  -[CKCanvasBackButtonView sizeThatFits:](self, "sizeThatFits:", v8, v9);
  double v11 = v10;
  double v12 = [(CKCanvasBackButtonView *)self titleLabel];
  if ([v12 isHidden])
  {
  }
  else
  {
    CGFloat v13 = [(CKCanvasBackButtonView *)self titleLabel];
    double v14 = [v13 text];
    uint64_t v15 = [v14 length];

    if (v15) {
      goto LABEL_5;
    }
  }
  double v11 = v11 + -7.0;
LABEL_5:
  [(CKCanvasBackButtonView *)self frame];
  double v17 = v16;
  if (CKMainScreenScale_once_105 != -1) {
    dispatch_once(&CKMainScreenScale_once_105, &__block_literal_global_278);
  }
  double v18 = *(double *)&CKMainScreenScale_sMainScreenScale_105;
  [(CKCanvasBackButtonView *)self frame];
  double v20 = v19;
  [(CKCanvasBackButtonView *)self frame];
  double v22 = v21;
  if (CKMainScreenScale_once_105 != -1) {
    dispatch_once(&CKMainScreenScale_once_105, &__block_literal_global_278);
  }
  double v23 = 1.0;
  if (v18 == 0.0) {
    double v24 = 1.0;
  }
  else {
    double v24 = v18;
  }
  double v25 = round((v11 * 0.5 + v17 - (v11 + 16.0) * 0.5) * v24) / v24;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_105 != 0.0) {
    double v23 = *(double *)&CKMainScreenScale_sMainScreenScale_105;
  }
  double v26 = objc_msgSend(MEMORY[0x1E4F42CB8], "shapeWithRoundedRect:", v25, round((v20 + v22 * 0.5 + -18.5) * v23) / v23, v11 + 16.0, 37.0);
  id v27 = [MEMORY[0x1E4F42CC0] styleWithEffect:v7 shape:v26];

  return v27;
}

- (void)setBackButtonView:(id)a3
{
}

- (void)setTitleLabel:(id)a3
{
}

- (void)setTitlePaddingView:(id)a3
{
}

- (BOOL)shouldShowTitlePaddingView
{
  return self->_shouldShowTitlePaddingView;
}

- (UIColor)titleLabelColor
{
  return self->_titleLabelColor;
}

- (void)setTitleLabelColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabelColor, 0);
  objc_storeStrong((id *)&self->_titlePaddingView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_backButtonView, 0);
}

@end