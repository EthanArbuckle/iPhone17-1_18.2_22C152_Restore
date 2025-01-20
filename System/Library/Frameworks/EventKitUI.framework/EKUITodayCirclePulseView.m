@interface EKUITodayCirclePulseView
- (BOOL)circleShouldFillFrame;
- (BOOL)dontApplyCenteringOffset;
- (BOOL)usesRoundedRectInsteadOfCircle;
- (BOOL)usesTextYOffsetWithoutAdjustmentForOverlay;
- (CGPoint)textOffsetFromCircle;
- (EKUITodayCirclePulseView)initWithFrame:(CGRect)a3;
- (NSDictionary)attributes;
- (NSDictionary)overlayAttributes;
- (NSString)overlayString;
- (NSString)string;
- (UIFont)font;
- (UIFont)overlayFont;
- (double)circleDiameter;
- (double)roundedRectCornerRadius;
- (double)textFrameWidthAdjustment;
- (double)textYOffset;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)_overlayLabel;
- (void)_layoutSubviews;
- (void)_updateLabelAttributedString;
- (void)_updateOverlayLabelAttributedString;
- (void)pulse:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setCircleDiameter:(double)a3;
- (void)setCircleShouldFillFrame:(BOOL)a3;
- (void)setDontApplyCenteringOffset:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setOverlayAttributes:(id)a3;
- (void)setOverlayFont:(id)a3;
- (void)setOverlayString:(id)a3;
- (void)setRoundedRectCornerRadius:(double)a3;
- (void)setString:(id)a3;
- (void)setTextFrameWidthAdjustment:(double)a3;
- (void)setTextOffsetFromCircle:(CGPoint)a3;
- (void)setTextYOffset:(double)a3;
- (void)setUsesRoundedRectInsteadOfCircle:(BOOL)a3;
- (void)setUsesTextYOffsetWithoutAdjustmentForOverlay:(BOOL)a3;
@end

@implementation EKUITodayCirclePulseView

- (EKUITodayCirclePulseView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)EKUITodayCirclePulseView;
  v3 = -[EKUITodayCirclePulseView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(EKUITodayCirclePulseView *)v3 setBackgroundColor:v4];

    [(EKUITodayCirclePulseView *)v3 setClipsToBounds:0];
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    backgroundContainer = v3->_backgroundContainer;
    v3->_backgroundContainer = v5;

    v7 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)v3->_backgroundContainer setBackgroundColor:v7];

    v8 = objc_alloc_init(TodayCirclePulseBackground);
    background = v3->_background;
    v3->_background = v8;

    v10 = [MEMORY[0x1E4FB1618] clearColor];
    [(TodayCirclePulseBackground *)v3->_background setBackgroundColor:v10];

    [(TodayCirclePulseBackground *)v3->_background setAutoresizingMask:18];
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v3->_label;
    v3->_label = v11;

    v13 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v3->_label setBackgroundColor:v13];

    v14 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v3->_label setTextColor:v14];

    [(UILabel *)v3->_label setTextAlignment:1];
    [(UIView *)v3->_backgroundContainer addSubview:v3->_background];
    [(EKUITodayCirclePulseView *)v3 addSubview:v3->_backgroundContainer];
    [(EKUITodayCirclePulseView *)v3 addSubview:v3->_label];
  }
  return v3;
}

- (void)setString:(id)a3
{
  [(UILabel *)self->_label setText:a3];
  [(EKUITodayCirclePulseView *)self _updateLabelAttributedString];

  [(EKUITodayCirclePulseView *)self setNeedsLayout];
}

- (NSString)string
{
  return [(UILabel *)self->_label text];
}

- (void)setFont:(id)a3
{
}

- (UIFont)font
{
  return [(UILabel *)self->_label font];
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
  [(EKUITodayCirclePulseView *)self _updateLabelAttributedString];

  [(EKUITodayCirclePulseView *)self setNeedsLayout];
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setUsesRoundedRectInsteadOfCircle:(BOOL)a3
{
}

- (BOOL)usesRoundedRectInsteadOfCircle
{
  return [(TodayCirclePulseBackground *)self->_background usesRoundedRectInsteadOfCircle];
}

- (void)setRoundedRectCornerRadius:(double)a3
{
}

- (double)roundedRectCornerRadius
{
  [(TodayCirclePulseBackground *)self->_background roundedRectCornerRadius];
  return result;
}

- (void)_updateLabelAttributedString
{
  v3 = [(UILabel *)self->_label text];
  if (v3)
  {
  }
  else if (!self->_attributes)
  {
    return;
  }
  id v4 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v6 = [(UILabel *)self->_label text];
  v5 = (void *)[v4 initWithString:v6 attributes:self->_attributes];
  [(UILabel *)self->_label setAttributedText:v5];
}

- (id)_overlayLabel
{
  overlayLabel = self->_overlayLabel;
  if (!overlayLabel)
  {
    id v4 = (UILabel *)objc_opt_new();
    v5 = self->_overlayLabel;
    self->_overlayLabel = v4;

    id v6 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)self->_overlayLabel setBackgroundColor:v6];

    v7 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)self->_overlayLabel setTextColor:v7];

    [(UILabel *)self->_overlayLabel setTextAlignment:1];
    [(EKUITodayCirclePulseView *)self addSubview:self->_overlayLabel];
    overlayLabel = self->_overlayLabel;
  }

  return overlayLabel;
}

- (void)setOverlayString:(id)a3
{
  id v4 = a3;
  v5 = [(EKUITodayCirclePulseView *)self _overlayLabel];
  [v5 setText:v4];

  [(EKUITodayCirclePulseView *)self _updateOverlayLabelAttributedString];

  [(EKUITodayCirclePulseView *)self setNeedsLayout];
}

- (NSString)overlayString
{
  return [(UILabel *)self->_overlayLabel text];
}

- (void)setOverlayFont:(id)a3
{
  id v4 = a3;
  id v5 = [(EKUITodayCirclePulseView *)self _overlayLabel];
  [v5 setFont:v4];
}

- (UIFont)overlayFont
{
  return [(UILabel *)self->_overlayLabel font];
}

- (void)setOverlayAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_overlayAttributes, a3);
  [(EKUITodayCirclePulseView *)self _updateOverlayLabelAttributedString];

  [(EKUITodayCirclePulseView *)self setNeedsLayout];
}

- (NSDictionary)overlayAttributes
{
  return self->_overlayAttributes;
}

- (void)_updateOverlayLabelAttributedString
{
  v3 = [(UILabel *)self->_overlayLabel text];
  if (v3)
  {
    overlayAttributes = self->_overlayAttributes;

    if (overlayAttributes)
    {
      id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
      id v7 = [(UILabel *)self->_overlayLabel text];
      id v6 = (void *)[v5 initWithString:v7 attributes:self->_overlayAttributes];
      [(UILabel *)self->_overlayLabel setAttributedText:v6];
    }
  }
}

- (void)setCircleDiameter:(double)a3
{
  self->_circleDiameter = a3;
}

- (void)_layoutSubviews
{
  [(EKUITodayCirclePulseView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UILabel *)self->_label sizeToFit];
  [(UILabel *)self->_label frame];
  double v12 = v11;
  double v50 = v13;
  double v14 = v8;
  double v15 = v4;
  if (![(EKUITodayCirclePulseView *)self dontApplyCenteringOffset])
  {
    objc_super v16 = [(UILabel *)self->_label text];
    v17 = [(UILabel *)self->_label font];
    double v15 = (v8 - v12) * 0.5 + CalOffsetToCenterNumberWithFont(v16, v17);

    double v14 = v12;
  }
  [(EKUITodayCirclePulseView *)self textFrameWidthAdjustment];
  double v19 = v18;
  double textYOffset = self->_textYOffset;
  if ([(EKUITodayCirclePulseView *)self circleShouldFillFrame])
  {
    double v47 = v6;
    double v48 = v4;
    double v49 = v10;
    double v46 = v8;
  }
  else
  {
    [(EKUITodayCirclePulseView *)self circleDiameter];
    double v46 = v21;
    [(EKUITodayCirclePulseView *)self circleDiameter];
    double v49 = v22;
    [(EKUITodayCirclePulseView *)self circleDiameter];
    double v48 = (v8 - v23) * 0.5;
    [(EKUITodayCirclePulseView *)self circleDiameter];
    double v47 = textYOffset + (v50 - v24) * 0.5;
  }
  double v25 = v14 + v19;
  [(EKUITodayCirclePulseView *)self textOffsetFromCircle];
  double v27 = v15 + v26;
  [(EKUITodayCirclePulseView *)self textOffsetFromCircle];
  double v29 = textYOffset + v28;
  v30 = [(UILabel *)self->_overlayLabel text];
  uint64_t v31 = [v30 length];

  if (v31)
  {
    double v45 = v8;
    [(UILabel *)self->_overlayLabel sizeToFit];
    [(UILabel *)self->_overlayLabel frame];
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    double v37 = v36;
    double v39 = v38;
    if (![(EKUITodayCirclePulseView *)self usesTextYOffsetWithoutAdjustmentForOverlay])
    {
      v52.origin.x = v33;
      v52.origin.y = v35;
      v52.size.width = v37;
      v52.size.height = v39;
      double v29 = v29 - ((CGRectGetHeight(v52) + -4.0) * 0.5 + 2.0);
    }
    double v40 = v50;
    v53.origin.x = v27;
    v53.origin.y = v29;
    v53.size.width = v25;
    v53.size.height = v50;
    CGFloat v41 = CGRectGetMaxY(v53) + -2.5;
    v54.origin.x = v33;
    v54.origin.y = v41;
    v54.size.width = v37;
    v54.size.height = v39;
    CGFloat Width = CGRectGetWidth(v54);
    [(UILabel *)self->_overlayLabel setFrame:CalRoundRectToScreenScale((v45 - Width) * 0.5, v41, v37, v39)];
  }
  else
  {
    double v40 = v50;
  }
  [(UILabel *)self->_label setFrame:CalRoundRectToScreenScale(v27, v29, v25, v40)];
  double v43 = CalRoundRectToScreenScale(v48, v47, v46, v49);
  backgroundContainer = self->_backgroundContainer;

  [(UIView *)backgroundContainer setFrame:v43];
}

- (void)pulse:(id)a3
{
  id v4 = a3;
  [(EKUITodayCirclePulseView *)self _layoutSubviews];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34__EKUITodayCirclePulseView_pulse___block_invoke;
  v10[3] = &unk_1E6087570;
  v10[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v10 options:0 animations:0.23 completion:0.07];
  double v5 = (void *)MEMORY[0x1E4FB1EB0];
  id v8 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__EKUITodayCirclePulseView_pulse___block_invoke_2;
  v9[3] = &unk_1E6087570;
  v9[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__EKUITodayCirclePulseView_pulse___block_invoke_3;
  v7[3] = &unk_1E6087B68;
  id v6 = v4;
  [v5 _animateWithDuration:196608 delay:self options:v9 factory:v7 animations:1.29 completion:0.0];
}

void __34__EKUITodayCirclePulseView_pulse___block_invoke(uint64_t a1)
{
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&v8.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&v8.m33 = v2;
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  *(_OWORD *)&v8.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  *(_OWORD *)&v8.m43 = v3;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  *(_OWORD *)&v8.m11 = *MEMORY[0x1E4F39B10];
  *(_OWORD *)&v8.m13 = v4;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  *(_OWORD *)&v8.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  *(_OWORD *)&v8.m23 = v5;
  CATransform3DScale(&v9, &v8, 0.84, 0.84, 1.0);
  id v6 = [*(id *)(*(void *)(a1 + 32) + 408) layer];
  CATransform3D v7 = v9;
  [v6 setTransform:&v7];
}

void __34__EKUITodayCirclePulseView_pulse___block_invoke_2(uint64_t a1)
{
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&v8.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&v8.m33 = v2;
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  *(_OWORD *)&v8.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  *(_OWORD *)&v8.m43 = v3;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  *(_OWORD *)&v8.m11 = *MEMORY[0x1E4F39B10];
  *(_OWORD *)&v8.m13 = v4;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  *(_OWORD *)&v8.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  *(_OWORD *)&v8.m23 = v5;
  CATransform3DScale(&v9, &v8, 1.19047619, 1.19047619, 1.0);
  id v6 = [*(id *)(*(void *)(a1 + 32) + 416) layer];
  CATransform3D v7 = v9;
  [v6 setTransform:&v7];
}

uint64_t __34__EKUITodayCirclePulseView_pulse___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  long long v4 = [MEMORY[0x1E4F39C90] animationWithKeyPath:a4];
  [v4 setMass:1.2];
  [v4 setStiffness:400.0];
  [v4 setDamping:16.0];

  return v4;
}

- (double)circleDiameter
{
  return self->_circleDiameter;
}

- (double)textYOffset
{
  return self->_textYOffset;
}

- (void)setTextYOffset:(double)a3
{
  self->_double textYOffset = a3;
}

- (CGPoint)textOffsetFromCircle
{
  double x = self->_textOffsetFromCircle.x;
  double y = self->_textOffsetFromCircle.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTextOffsetFromCircle:(CGPoint)a3
{
  self->_textOffsetFromCircle = a3;
}

- (BOOL)usesTextYOffsetWithoutAdjustmentForOverlay
{
  return self->_usesTextYOffsetWithoutAdjustmentForOverlay;
}

- (void)setUsesTextYOffsetWithoutAdjustmentForOverlay:(BOOL)a3
{
  self->_usesTextYOffsetWithoutAdjustmentForOverladouble y = a3;
}

- (BOOL)circleShouldFillFrame
{
  return self->_circleShouldFillFrame;
}

- (void)setCircleShouldFillFrame:(BOOL)a3
{
  self->_circleShouldFillFrame = a3;
}

- (BOOL)dontApplyCenteringOffset
{
  return self->_dontApplyCenteringOffset;
}

- (void)setDontApplyCenteringOffset:(BOOL)a3
{
  self->_dontApplyCenteringOffset = a3;
}

- (double)textFrameWidthAdjustment
{
  return self->_textFrameWidthAdjustment;
}

- (void)setTextFrameWidthAdjustment:(double)a3
{
  self->_textFrameWidthAdjustment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayAttributes, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_overlayLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_background, 0);

  objc_storeStrong((id *)&self->_backgroundContainer, 0);
}

@end