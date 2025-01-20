@interface CKEffectPickerStandardView
- (CGRect)_updateBalloonViewOrigin:(CGRect)a3 forButtonFrame:(CGRect)a4;
- (double)marginBetweenPickerDotButtons;
- (double)offsetYForLabelAtIndex:(int64_t)a3 withInitialY:(double)a4;
- (void)_updateRoundedContainerView;
- (void)activateTextSizeDependentConstraintsForSendButtonFrame:(CGRect)a3;
- (void)setCloseButtonYPosition:(double)a3;
@end

@implementation CKEffectPickerStandardView

- (void)activateTextSizeDependentConstraintsForSendButtonFrame:(CGRect)a3
{
  double y = a3.origin.y;
  v19.receiver = self;
  v19.super_class = (Class)CKEffectPickerStandardView;
  -[CKEffectPickerView activateTextSizeDependentConstraintsForSendButtonFrame:](&v19, sel_activateTextSizeDependentConstraintsForSendButtonFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)MEMORY[0x1E4F28DC8];
  v6 = [(CKEffectPickerView *)self closeButton];
  v7 = [v5 constraintWithItem:v6 attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:y];

  [(CKEffectPickerStandardView *)self addConstraint:v7];
  [(CKEffectPickerView *)self setCloseButtonBottomConstraint:v7];
  v8 = (void *)MEMORY[0x1E4F28DC8];
  v9 = [(CKEffectPickerView *)self roundedContainerView];
  v10 = [(CKEffectPickerView *)self closeButton];
  v11 = [v8 constraintWithItem:v9 attribute:4 relatedBy:0 toItem:v10 attribute:3 multiplier:1.0 constant:-25.0];

  [(CKEffectPickerStandardView *)self addConstraint:v11];
  v12 = (void *)MEMORY[0x1E4F28DC8];
  v13 = [(CKEffectPickerView *)self roundedContainerView];
  v14 = [(CKEffectPickerView *)self closeButton];
  v15 = [v12 constraintWithItem:v13 attribute:3 relatedBy:0 toItem:v14 attribute:3 multiplier:1.0 constant:-25.0];

  [(CKEffectPickerStandardView *)self addConstraint:v15];
  [(CKEffectPickerView *)self setRoundedContainerViewTopConstraint:v15];
  v16 = (void *)MEMORY[0x1E4F28DC8];
  v17 = [(CKEffectPickerView *)self sendMomentButton];
  v18 = [v16 constraintWithItem:v17 attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:y + -60.0];

  [(CKEffectPickerStandardView *)self addConstraint:v18];
}

- (void)setCloseButtonYPosition:(double)a3
{
  id v4 = [(CKEffectPickerView *)self closeButtonBottomConstraint];
  [v4 setConstant:a3];
}

- (double)marginBetweenPickerDotButtons
{
  int v2 = [(id)objc_opt_class() shouldUseLargeScreenDimension];
  double result = 36.0;
  if (v2) {
    return 48.0;
  }
  return result;
}

- (void)_updateRoundedContainerView
{
  v3 = [(CKEffectPickerView *)self effectLabels];
  unint64_t v4 = [v3 count];

  [(CKEffectPickerStandardView *)self marginBetweenPickerDotButtons];
  float v6 = (double)v4 * 9.0 + 36.0 + v5 * (double)(v4 - 1);
  id v7 = [(CKEffectPickerView *)self roundedContainerViewTopConstraint];
  [v7 setConstant:-(v6 + 25.0)];
}

- (CGRect)_updateBalloonViewOrigin:(CGRect)a3 forButtonFrame:(CGRect)a4
{
  double y = a4.origin.y;
  double x = a4.origin.x;
  double height = a3.size.height;
  double width = a3.size.width;
  v22.receiver = self;
  v22.super_class = (Class)CKEffectPickerStandardView;
  -[CKEffectPickerView _updateBalloonViewOrigin:forButtonFrame:](&v22, sel__updateBalloonViewOrigin_forButtonFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  double v9 = x - (width + 20.0);
  v10 = [(CKEffectPickerView *)self closeButton];
  [v10 frame];
  double v12 = v11;
  v23.origin.double x = v9;
  v23.origin.double y = y;
  v23.size.double width = width;
  v23.size.double height = height;
  double MaxY = CGRectGetMaxY(v23);

  if (v12 >= MaxY || height < 40.0)
  {
    double v18 = y + -13.0;
  }
  else
  {
    v15 = [(CKEffectPickerView *)self effectLabelFont];
    [v15 _scaledValueForValue:1 useLanguageAwareScaling:20.0];
    double v17 = v16;

    double v18 = y - fmin(20.0 - (v17 + -20.0), 20.0);
  }
  double v19 = v9;
  double v20 = width;
  double v21 = height;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v18;
  result.origin.double x = v19;
  return result;
}

- (double)offsetYForLabelAtIndex:(int64_t)a3 withInitialY:(double)a4
{
  return a4 + -30.0;
}

@end