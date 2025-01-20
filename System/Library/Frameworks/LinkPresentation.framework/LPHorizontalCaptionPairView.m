@interface LPHorizontalCaptionPairView
- (CGSize)_layoutCaptionPairForSize:(CGSize)a3 applyingLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (LPHorizontalCaptionPairView)initWithHost:(id)a3;
- (LPHorizontalCaptionPairView)initWithHost:(id)a3 leadingText:(id)a4 leadingStyle:(id)a5 trailingText:(id)a6 trailingStyle:(id)a7 button:(id)a8 balancingMode:(int64_t)a9;
- (NSRegularExpression)emphasizedTextExpression;
- (double)ascender;
- (double)descender;
- (double)firstLineLeading;
- (double)lastLineDescent;
- (id)subtitleButton;
- (int64_t)computedNumberOfLines;
- (int64_t)overrideMaximumNumberOfLines;
- (void)layoutComponentView;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setEmphasizedTextExpression:(id)a3;
- (void)setOverrideMaximumNumberOfLines:(int64_t)a3;
@end

@implementation LPHorizontalCaptionPairView

- (LPHorizontalCaptionPairView)initWithHost:(id)a3
{
  return 0;
}

- (LPHorizontalCaptionPairView)initWithHost:(id)a3 leadingText:(id)a4 leadingStyle:(id)a5 trailingText:(id)a6 trailingStyle:(id)a7 button:(id)a8 balancingMode:(int64_t)a9
{
  v62[3] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v60 = a4;
  id v58 = a5;
  id v59 = a6;
  id v56 = a7;
  id v57 = a8;
  v61.receiver = self;
  v61.super_class = (Class)LPHorizontalCaptionPairView;
  v55 = v15;
  v16 = [(LPComponentView *)&v61 initWithHost:v15];
  v17 = v16;
  if (v16)
  {
    v16->_balancingMode = a9;
    if (v60)
    {
      v18 = [LPTextView alloc];
      v19 = [(LPComponentView *)v17 host];
      v20 = [(LPTextView *)v18 initWithHost:v19 text:v60 style:v58];
    }
    else
    {
      v20 = 0;
    }
    if (v59)
    {
      v21 = [LPTextView alloc];
      v22 = [(LPComponentView *)v17 host];
      v23 = [(LPTextView *)v21 initWithHost:v22 text:v59 style:v56];
    }
    else
    {
      v23 = 0;
    }
    BOOL v24 = [(UIView *)v17 _lp_isLTR];
    if (v24) {
      v25 = v20;
    }
    else {
      v25 = v23;
    }
    if (v24) {
      v26 = v23;
    }
    else {
      v26 = v20;
    }
    objc_storeStrong((id *)&v17->_leftView, v25);
    v27 = v26;
    rightView = v17->_rightView;
    v17->_rightView = v27;

    if (v17->_leftView) {
      -[LPHorizontalCaptionPairView addSubview:](v17, "addSubview:");
    }
    if (v17->_rightView) {
      -[LPHorizontalCaptionPairView addSubview:](v17, "addSubview:");
    }
    if (v23) {
      v29 = v23;
    }
    else {
      v29 = v20;
    }
    v30 = v29;
    if (v57 && v30)
    {
      v54 = v30;
      objc_storeStrong((id *)&v17->_buttonProperties, a8);
      v31 = [LPSubtitleButtonView alloc];
      v32 = [(LPComponentView *)v17 host];
      uint64_t v33 = [(LPSubtitleButtonView *)v31 initWithHost:v32 buttonProperties:v17->_buttonProperties style:v58];
      button = v17->_button;
      v17->_button = (LPSubtitleButtonView *)v33;

      [(LPSubtitleButtonView *)v17->_button setTranslatesAutoresizingMaskIntoConstraints:0];
      [(LPHorizontalCaptionPairView *)v17 addSubview:v17->_button];
      [(LPSubtitleButtonView *)v17->_button sizeToFit];
      v35 = [(LPTextView *)v54 attributedString];
      v36 = [v35 string];
      LODWORD(v31) = [v36 isEqualToString:@"​"];

      v37 = [(LPSubtitleButtonView *)v17->_button leadingAnchor];
      v38 = [(LPTextView *)v54 trailingAnchor];
      if (v31) {
        [v37 constraintEqualToAnchor:v38];
      }
      else {
      v39 = [v37 constraintEqualToSystemSpacingAfterAnchor:v38 multiplier:1.0];
      }
      [v39 setActive:1];

      v40 = (void *)MEMORY[0x1E4F28DC8];
      v53 = [(LPSubtitleButtonView *)v17->_button firstBaselineAnchor];
      v52 = [(LPTextView *)v54 lastBaselineAnchor];
      v41 = objc_msgSend(v53, "constraintEqualToAnchor:");
      v62[0] = v41;
      v42 = [(LPSubtitleButtonView *)v17->_button widthAnchor];
      [(LPSubtitleButtonView *)v17->_button frame];
      v44 = [v42 constraintEqualToConstant:v43];
      v62[1] = v44;
      v45 = [(LPSubtitleButtonView *)v17->_button heightAnchor];
      [(LPSubtitleButtonView *)v17->_button frame];
      v47 = [v45 constraintEqualToConstant:v46];
      v62[2] = v47;
      v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:3];
      [v40 activateConstraints:v48];

      v30 = v54;
    }
    v49 = v30;
    v50 = v17;
  }
  return v17;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double top = a3.top;
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    [(LPTextView *)self->_leftView setContentInset:a3.top];
    rightView = self->_rightView;
    -[LPTextView setContentInset:](rightView, "setContentInset:", top, 2.0, bottom, right);
  }
}

- (double)firstLineLeading
{
  v3 = [(LPTextView *)self->_leftView style];
  v4 = [v3 firstLineLeading];
  [v4 value];
  double v6 = v5;
  v7 = [(LPTextView *)self->_rightView style];
  v8 = [v7 firstLineLeading];
  [v8 value];
  double v10 = fmax(v6, v9);

  return v10;
}

- (double)lastLineDescent
{
  v3 = [(LPTextView *)self->_leftView style];
  v4 = [v3 lastLineDescent];
  [v4 value];
  double v6 = v5;
  v7 = [(LPTextView *)self->_rightView style];
  v8 = [v7 lastLineDescent];
  [v8 value];
  double v10 = fmax(v6, v9);

  return v10;
}

- (double)ascender
{
  v3 = [(LPTextView *)self->_leftView style];
  v4 = [v3 font];
  [v4 ascender];
  double v6 = v5;
  v7 = [(LPTextView *)self->_rightView style];
  v8 = [v7 font];
  [v8 ascender];
  double v10 = fmax(v6, v9);

  return v10;
}

- (double)descender
{
  v3 = [(LPTextView *)self->_leftView style];
  v4 = [v3 font];
  [v4 descender];
  double v6 = v5;
  v7 = [(LPTextView *)self->_rightView style];
  v8 = [v7 font];
  [v8 descender];
  double v10 = fmin(v6, v9);

  return v10;
}

- (int64_t)computedNumberOfLines
{
  return (uint64_t)fmax((double)[(LPTextView *)self->_leftView computedNumberOfLines], (double)[(LPTextView *)self->_rightView computedNumberOfLines]);
}

- (void)setOverrideMaximumNumberOfLines:(int64_t)a3
{
  self->_overrideMaximumNumberOfLines = a3;
  -[LPTextView setOverrideMaximumNumberOfLines:](self->_leftView, "setOverrideMaximumNumberOfLines:");
  rightView = self->_rightView;

  [(LPTextView *)rightView setOverrideMaximumNumberOfLines:a3];
}

- (void)layoutComponentView
{
  [(LPHorizontalCaptionPairView *)self bounds];

  -[LPHorizontalCaptionPairView _layoutCaptionPairForSize:applyingLayout:](self, "_layoutCaptionPairForSize:applyingLayout:", 1, v3, v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[LPHorizontalCaptionPairView _layoutCaptionPairForSize:applyingLayout:](self, "_layoutCaptionPairForSize:applyingLayout:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutCaptionPairForSize:(CGSize)a3 applyingLayout:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  v8 = (CGFloat *)MEMORY[0x1E4F1DB28];
  button = self->_button;
  double v10 = *MEMORY[0x1E4F1DB30];
  if (button) {
    -[LPSubtitleButtonView sizeThatFits:](button, "sizeThatFits:", v10, *(double *)(MEMORY[0x1E4F1DB30] + 8));
  }
  CGFloat v54 = v8[1];
  CGFloat v55 = *v8;
  CGFloat v11 = v8[3];
  double v51 = v10;
  double v12 = width - v10;
  -[LPTextView sizeThatFits:](self->_leftView, "sizeThatFits:", width - v10, height);
  double v14 = v13;
  -[LPTextView sizeThatFits:](self->_rightView, "sizeThatFits:", v12, height);
  double v16 = v15;
  double v17 = v14 + v15;
  if (v17 - v12 <= 0.0)
  {
    if (![(UIView *)self _lp_isLTR])
    {
      v60.origin.x = v55;
      v60.origin.y = v54;
      v60.size.double width = v16;
      v60.size.double height = v11;
      v61.size.double width = v12 - CGRectGetWidth(v60);
      v61.origin.x = v55;
      v61.origin.y = v54;
      double rect = v61.size.width;
      v61.size.double height = v11;
      double v14 = fmin(v14, CGRectGetWidth(v61));
      double v50 = v16;
      goto LABEL_22;
    }
    v58.origin.x = v55;
    v58.origin.y = v54;
    v58.size.double width = v14;
    v58.size.double height = v11;
    v59.size.double width = v12 - CGRectGetWidth(v58);
    v59.origin.x = v55;
    v59.origin.y = v54;
    double v50 = v59.size.width;
    v59.size.double height = v11;
    double v16 = fmin(v16, CGRectGetWidth(v59));
    goto LABEL_21;
  }
  if (!self->_balancingMode)
  {
    double v24 = fmax(v14 / v17, 0.5);
    double v14 = v12 * v24;
    double v16 = v12 - v12 * v24;
    double v50 = v16;
LABEL_21:
    double rect = v14;
    goto LABEL_22;
  }
  BOOL v18 = [(UIView *)self _lp_isLTR];
  double v19 = v12 - v14;
  double v20 = v12 - (v12 - v14);
  double v21 = v12 - v16;
  double v22 = v12 - (v12 - v16);
  if (v18) {
    double v16 = v12 - (v12 - v16);
  }
  else {
    double v16 = v12 - v14;
  }
  if (v18) {
    double v14 = v21;
  }
  else {
    double v14 = v12 - (v12 - v14);
  }
  if (v18) {
    double v19 = v22;
  }
  double v50 = v19;
  if (v18) {
    double v23 = v21;
  }
  else {
    double v23 = v20;
  }
  double rect = v23;
LABEL_22:
  -[LPTextView sizeThatFits:](self->_leftView, "sizeThatFits:", v14, height);
  double v53 = v25;
  -[LPTextView sizeThatFits:](self->_rightView, "sizeThatFits:", v16, height);
  double v27 = v26;
  if (v4)
  {
    double v49 = v26;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__LPHorizontalCaptionPairView__layoutCaptionPairForSize_applyingLayout___block_invoke;
    aBlock[3] = &__block_descriptor_48_e41_d40__0__LPComponentView_8d16_CGSize_dd_24l;
    *(double *)&aBlock[4] = width;
    *(double *)&aBlock[5] = height;
    v28 = (double (**)(void *, LPTextView *, double, double, double))_Block_copy(aBlock);
    leftView = self->_leftView;
    v62.origin.y = v54;
    v62.origin.x = v55;
    v62.size.double width = rect;
    v62.size.double height = v11;
    CGFloat v30 = CGRectGetWidth(v62);
    double v47 = v28[2](v28, leftView, v30, v14, v53);
    rightView = self->_rightView;
    v63.origin.y = v54;
    v63.origin.x = v55;
    v63.size.double width = v50;
    v63.size.double height = v11;
    CGFloat v32 = CGRectGetWidth(v63);
    double v33 = v28[2](v28, rightView, v32, v16, v49);
    v34 = [(LPTextView *)self->_leftView style];
    v35 = [v34 font];
    [v35 ascender];
    double v37 = v36;

    v38 = [(LPTextView *)self->_rightView style];
    v39 = [v38 font];
    double v48 = width;
    [v39 ascender];
    double v41 = v40;

    v64.origin.y = v54;
    v64.origin.x = v55;
    v64.size.double width = rect;
    v64.size.double height = v47;
    double v42 = CGRectGetWidth(v64);
    double v43 = v37 - v41;
    double v44 = -v43;
    if (v43 >= 0.0) {
      double v44 = 0.0;
    }
    -[LPTextView setFrame:](self->_leftView, "setFrame:", 0.0, floor(v44), rect, v47);
    -[LPTextView setFrame:](self->_rightView, "setFrame:", v48 - (v12 - v42), floor(fmax(v43, 0.0)), v50, v33);

    double width = v48;
    double v27 = v49;
  }
  double v45 = fmin(v51 + v16 + v14, width);
  double v46 = fmin(fmax(v53, v27), height);
  result.double height = v46;
  result.double width = v45;
  return result;
}

double __72__LPHorizontalCaptionPairView__layoutCaptionPairForSize_applyingLayout___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5)
{
  id v9 = a2;
  double v10 = v9;
  if (a4 != a3)
  {
    objc_msgSend(v9, "sizeThatFits:", a3, *(double *)(a1 + 40));
    a5 = v11;
  }

  return a5;
}

- (void)setEmphasizedTextExpression:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_emphasizedTextExpression, a3);
  [(LPTextView *)self->_leftView setEmphasizedTextExpression:v5];
  [(LPTextView *)self->_rightView setEmphasizedTextExpression:v5];
}

- (id)subtitleButton
{
  return self->_button;
}

- (int64_t)overrideMaximumNumberOfLines
{
  return self->_overrideMaximumNumberOfLines;
}

- (NSRegularExpression)emphasizedTextExpression
{
  return self->_emphasizedTextExpression;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emphasizedTextExpression, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_buttonProperties, 0);
  objc_storeStrong((id *)&self->_rightView, 0);

  objc_storeStrong((id *)&self->_leftView, 0);
}

@end