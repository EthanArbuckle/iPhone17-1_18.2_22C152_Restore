@interface CPSButton
- (BOOL)animatesAlphaWhenHighlighted;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)_boundingRectForSubstring:(id)a3;
- (CPSButton)init;
- (CPSButton)initWithCoder:(id)a3;
- (CPSButton)initWithFrame:(CGRect)a3;
- (CPSButton)initWithTitle:(id)a3 enabledTitleColor:(id)a4 disabledTitleColor:(id)a5 backgroundColor:(id)a6 textStyle:(id)a7 cornerRadius:(double)a8 animatesAlphaWhenHighlighted:(BOOL)a9;
- (NSString)extraTapTargetSubstring;
- (double)tapTargetSideMargin;
- (void)setAnimatesAlphaWhenHighlighted:(BOOL)a3;
- (void)setExtraTapTargetSubstring:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setTapTargetSideMargin:(double)a3;
- (void)updateCornerRadius;
@end

@implementation CPSButton

- (CPSButton)initWithTitle:(id)a3 enabledTitleColor:(id)a4 disabledTitleColor:(id)a5 backgroundColor:(id)a6 textStyle:(id)a7 cornerRadius:(double)a8 animatesAlphaWhenHighlighted:(BOOL)a9
{
  BOOL v9 = a9;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  v27.receiver = self;
  v27.super_class = (Class)CPSButton;
  v21 = -[CPSButton initWithFrame:](&v27, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v22 = v21;
  if (v21)
  {
    [(CPSButton *)v21 _setContinuousCornerRadius:a8];
    [(CPSButton *)v22 setClipsToBounds:1];
    [(CPSButton *)v22 setAnimatesAlphaWhenHighlighted:v9];
    v23 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:v20 variant:256];
    v24 = [(CPSButton *)v22 titleLabel];
    [v24 setFont:v23];

    [(CPSButton *)v22 setTitle:v16 forState:0];
    if (v17) {
      [(CPSButton *)v22 setTitleColor:v17 forState:0];
    }
    if (v18) {
      [(CPSButton *)v22 setTitleColor:v18 forState:2];
    }
    if (v19) {
      [(CPSButton *)v22 setBackgroundColor:v19];
    }
    v25 = v22;
  }

  return v22;
}

- (CPSButton)init
{
  return -[CPSButton initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (CPSButton)initWithFrame:(CGRect)a3
{
  return -[CPSButton initWithTitle:enabledTitleColor:disabledTitleColor:backgroundColor:textStyle:cornerRadius:animatesAlphaWhenHighlighted:](self, "initWithTitle:enabledTitleColor:disabledTitleColor:backgroundColor:textStyle:cornerRadius:animatesAlphaWhenHighlighted:", &stru_1F306C450, 0, 0, 0, *MEMORY[0x1E4F43870], 0, 0.0, a3.origin.y, a3.size.width, a3.size.height);
}

- (CPSButton)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CPSButton;
  v3 = [(CPSButton *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (void)updateCornerRadius
{
  [(CPSButton *)self layoutIfNeeded];
  [(CPSButton *)self bounds];
  double v3 = CGRectGetHeight(v5) * 0.5;

  [(CPSButton *)self _setContinuousCornerRadius:v3];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (self->_tapTargetSideMargin != 0.0)
  {
    [(CPSButton *)self bounds];
    double tapTargetSideMargin = self->_tapTargetSideMargin;
    double v13 = (44.0 - v10) * -0.5;
    if (v10 >= 44.0) {
      double v13 = 0.0;
    }
    double v14 = v13 - tapTargetSideMargin;
    double v15 = v11 >= 44.0 ? 0.0 : (44.0 - v11) * -0.5;
    CGRect v45 = CGRectInset(*(CGRect *)&v8, v14, v15 - tapTargetSideMargin);
    v43.double x = x;
    v43.double y = y;
    if (CGRectContainsPoint(v45, v43)) {
      goto LABEL_16;
    }
  }
  if (!self->_extraTapTargetSubstring) {
    goto LABEL_17;
  }
  -[CPSButton _boundingRectForSubstring:](self, "_boundingRectForSubstring:");
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v24 = [(CPSButton *)self titleLabel];
  objc_msgSend(v24, "convertRect:toView:", self, v17, v19, v21, v23);
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;

  v46.origin.double x = v26;
  v46.origin.double y = v28;
  v46.size.width = v30;
  v46.size.height = v32;
  double Height = CGRectGetHeight(v46);
  v47.origin.double x = v26;
  v47.origin.double y = v28;
  v47.size.width = v30;
  v47.size.height = v32;
  double MinY = CGRectGetMinY(v47);
  double v35 = MinY >= 0.0 ? 36.0 - MinY : 36.0;
  double v36 = Height >= v35 ? Height : v35;
  CGFloat v37 = v26;
  CGFloat v38 = v28;
  CGFloat v39 = v30;
  v44.double x = x;
  v44.double y = y;
  if (CGRectContainsPoint(*(CGRect *)(&v36 - 3), v44))
  {
LABEL_16:
    BOOL v40 = 1;
  }
  else
  {
LABEL_17:
    v42.receiver = self;
    v42.super_class = (Class)CPSButton;
    BOOL v40 = -[CPSButton pointInside:withEvent:](&v42, sel_pointInside_withEvent_, v7, x, y);
  }

  return v40;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(CPSButton *)self isHighlighted];
  v7.receiver = self;
  v7.super_class = (Class)CPSButton;
  [(CPSButton *)&v7 setHighlighted:v3];
  if (self->_animatesAlphaWhenHighlighted && v5 != v3) {
    [(UIView *)self cps_configureForAnimatesAlphaWhenHighlighted:[(CPSButton *)self isHighlighted]];
  }
}

- (CGRect)_boundingRectForSubstring:(id)a3
{
  id v4 = a3;
  int v5 = [(CPSButton *)self titleLabel];
  v6 = [v5 text];
  uint64_t v7 = [v6 rangeOfString:v4];
  uint64_t v9 = v8;

  id v10 = objc_alloc(MEMORY[0x1E4F426A8]);
  double v11 = [v5 attributedText];
  v12 = (void *)[v10 initWithAttributedString:v11];

  id v13 = objc_alloc_init(MEMORY[0x1E4F42668]);
  [v12 addLayoutManager:v13];
  id v14 = objc_alloc(MEMORY[0x1E4F426A0]);
  [v5 bounds];
  double v15 = objc_msgSend(v14, "initWithSize:", CGRectGetWidth(v30), 1.79769313e308);
  [v15 setLineFragmentPadding:0.0];
  [v13 addTextContainer:v15];
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  objc_msgSend(v13, "characterRangeForGlyphRange:actualGlyphRange:", v7, v9, &v28);
  objc_msgSend(v13, "boundingRectForGlyphRange:inTextContainer:", v28, v29, v15);
  objc_msgSend(v5, "convertRect:toView:", self);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (BOOL)animatesAlphaWhenHighlighted
{
  return self->_animatesAlphaWhenHighlighted;
}

- (void)setAnimatesAlphaWhenHighlighted:(BOOL)a3
{
  self->_animatesAlphaWhenHighlighted = a3;
}

- (double)tapTargetSideMargin
{
  return self->_tapTargetSideMargin;
}

- (void)setTapTargetSideMargin:(double)a3
{
  self->_double tapTargetSideMargin = a3;
}

- (NSString)extraTapTargetSubstring
{
  return self->_extraTapTargetSubstring;
}

- (void)setExtraTapTargetSubstring:(id)a3
{
}

- (void).cxx_destruct
{
}

@end