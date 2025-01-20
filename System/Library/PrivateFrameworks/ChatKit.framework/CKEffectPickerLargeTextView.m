@interface CKEffectPickerLargeTextView
- (BOOL)finishedInitializing;
- (BOOL)shouldAnimatePreviousLabelForCancel:(id)a3;
- (CGRect)_updateBalloonViewOrigin:(CGRect)a3 forButtonFrame:(CGRect)a4;
- (CKEffectPickerLargeTextView)initWithFrame:(CGRect)a3 sendButtonFrame:(CGRect)a4 balloonViewOrigin:(CGPoint)a5 composition:(id)a6 color:(char)a7;
- (double)marginBetweenPickerDotButtons;
- (double)offsetYForLabelAtIndex:(int64_t)a3 withInitialY:(double)a4;
- (void)_touchUpInsideDotButton:(id)a3;
- (void)_updateRoundedContainerView;
- (void)activateTextSizeDependentConstraintsForSendButtonFrame:(CGRect)a3;
- (void)addEffect:(id)a3 withDescriptiveText:(id)a4 withIdentifier:(id)a5;
- (void)cancelImpactSelection;
- (void)effectTypeDidChange:(id)a3;
- (void)setFinishedInitializing:(BOOL)a3;
@end

@implementation CKEffectPickerLargeTextView

- (CKEffectPickerLargeTextView)initWithFrame:(CGRect)a3 sendButtonFrame:(CGRect)a4 balloonViewOrigin:(CGPoint)a5 composition:(id)a6 color:(char)a7
{
  v8.receiver = self;
  v8.super_class = (Class)CKEffectPickerLargeTextView;
  result = -[CKEffectPickerView initWithFrame:sendButtonFrame:balloonViewOrigin:composition:color:](&v8, sel_initWithFrame_sendButtonFrame_balloonViewOrigin_composition_color_, *(void *)&a5.x, *(void *)&a5.y, a6, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, v9, v10);
  if (result) {
    result->_finishedInitializing = 1;
  }
  return result;
}

- (void)activateTextSizeDependentConstraintsForSendButtonFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)CKEffectPickerLargeTextView;
  -[CKEffectPickerView activateTextSizeDependentConstraintsForSendButtonFrame:](&v21, sel_activateTextSizeDependentConstraintsForSendButtonFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)MEMORY[0x1E4F28DC8];
  v5 = [(CKEffectPickerView *)self closeButton];
  v6 = [v4 constraintWithItem:v5 attribute:4 relatedBy:0 toItem:self attribute:4 multiplier:1.0 constant:-20.0];

  [(CKEffectPickerLargeTextView *)self addConstraint:v6];
  [(CKEffectPickerView *)self setCloseButtonBottomConstraint:v6];
  v7 = [(CKEffectPickerView *)self balloonView];
  [v7 frame];
  double v9 = v8;
  uint64_t v10 = [(CKEffectPickerView *)self closeButton];
  [v10 frame];
  double v12 = -(v9 - v11);

  v13 = (void *)MEMORY[0x1E4F28DC8];
  v14 = [(CKEffectPickerView *)self roundedContainerView];
  v15 = [(CKEffectPickerView *)self closeButton];
  v16 = [v13 constraintWithItem:v14 attribute:3 relatedBy:0 toItem:v15 attribute:3 multiplier:1.0 constant:v12];

  [(CKEffectPickerLargeTextView *)self addConstraint:v16];
  [(CKEffectPickerView *)self setRoundedContainerViewTopConstraint:v16];
  v17 = (void *)MEMORY[0x1E4F28DC8];
  v18 = [(CKEffectPickerView *)self sendMomentButton];
  v19 = [(CKEffectPickerView *)self closeButton];
  v20 = [v17 constraintWithItem:v18 attribute:4 relatedBy:0 toItem:v19 attribute:3 multiplier:1.0 constant:-36.0];

  [(CKEffectPickerLargeTextView *)self addConstraint:v20];
}

- (void)addEffect:(id)a3 withDescriptiveText:(id)a4 withIdentifier:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)CKEffectPickerLargeTextView;
  id v8 = a3;
  [(CKEffectPickerView *)&v11 addEffect:v8 withDescriptiveText:a4 withIdentifier:a5];
  double v9 = [(CKEffectPickerView *)self effectDescriptiveLabels];
  uint64_t v10 = [v9 lastObject];

  [v10 setText:v8];
}

- (double)marginBetweenPickerDotButtons
{
  v2 = [(CKEffectPickerView *)self effectLabelFont];
  [v2 lineHeight];
  double v4 = v3 * 1.75;

  return v4;
}

- (void)_updateRoundedContainerView
{
  double v3 = [(CKEffectPickerView *)self effectLabels];
  unint64_t v4 = [v3 count];

  [(CKEffectPickerLargeTextView *)self marginBetweenPickerDotButtons];
  float v6 = (double)v4 * 9.0 + 36.0 + v5 * (double)(v4 - 1);
  id v12 = [(CKEffectPickerView *)self roundedContainerViewTopConstraint];
  v7 = [(CKEffectPickerView *)self balloonView];
  [v7 frame];
  double v9 = v8;
  uint64_t v10 = [(CKEffectPickerView *)self closeButton];
  [v10 frame];
  [v12 setConstant:-(v9 - v11 + v6)];
}

- (CGRect)_updateBalloonViewOrigin:(CGRect)a3 forButtonFrame:(CGRect)a4
{
  double height = a4.size.height;
  double y = a4.origin.y;
  double v6 = a3.size.height;
  double width = a3.size.width;
  double v9 = [(CKEffectPickerView *)self closeButton];
  [v9 frame];
  double v11 = v10;

  id v12 = [(CKEffectPickerView *)self typeSegmentedControl];
  uint64_t v13 = [v12 selectedSegmentIndex];

  if (v13)
  {
    v14 = [(CKEffectPickerView *)self sendMomentButton];
    [v14 frame];
    double v16 = v15;
    double v18 = v17;

    double y = v16 + v18 + 24.0 - v6;
  }
  else if ([(CKEffectPickerView *)self selectedIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
    double y = y - (v6 - height);
  }
  else if ([(CKEffectPickerView *)self selectedIndex])
  {
    unint64_t v19 = [(CKEffectPickerView *)self selectedIndex];
    v20 = [(CKEffectPickerView *)self effectLabels];
    uint64_t v21 = [v20 count] - 1;

    if (v19 != v21)
    {
      v22 = [(CKEffectPickerView *)self effectDescriptiveLabels];
      v23 = objc_msgSend(v22, "objectAtIndex:", -[CKEffectPickerView selectedIndex](self, "selectedIndex"));

      [v23 bounds];
      [v23 frame];
      UIRoundToViewScale();
      double y = v24;
    }
  }
  else
  {
    v25 = [(CKEffectPickerView *)self closeButton];
    [v25 frame];
    double y = v26 + -14.0 - v6;
  }
  double v27 = v11 - (width + 20.0);
  double v28 = y;
  double v29 = width;
  double v30 = v6;
  result.size.double height = v30;
  result.size.double width = v29;
  result.origin.double y = v28;
  result.origin.x = v27;
  return result;
}

- (void)cancelImpactSelection
{
  v4.receiver = self;
  v4.super_class = (Class)CKEffectPickerLargeTextView;
  [(CKEffectPickerView *)&v4 cancelImpactSelection];
  [(CKEffectPickerView *)self resetDotConstraintsToDefault];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__CKEffectPickerLargeTextView_cancelImpactSelection__block_invoke;
  v3[3] = &unk_1E5620C40;
  v3[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v3 animations:0.25];
}

uint64_t __52__CKEffectPickerLargeTextView_cancelImpactSelection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)_touchUpInsideDotButton:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CKEffectPickerView *)self selectedIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v5 = [(CKEffectPickerView *)self closeButton];
    [v5 frame];
    double v7 = v6 + -28.0;
    double v8 = [(CKEffectPickerView *)self roundedContainerView];
    [v8 frame];
    double v10 = v7 - v9;
  }
  else
  {
    double v5 = [(CKEffectPickerView *)self roundedContainerView];
    [v5 bounds];
    double v10 = v11;
  }

  [(CKEffectPickerView *)self resetDotConstraintsToDefault];
  id v12 = [(CKEffectPickerView *)self effectIdentifiers];
  uint64_t v13 = [(CKEffectPickerView *)self effectDotButtons];
  v14 = objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v13, "indexOfObject:", v4));

  double v15 = [(CKEffectPickerView *)self effectDotConstraintsThatChange];
  double v16 = [v15 objectForKey:v14];

  double v17 = [(CKEffectPickerView *)self effectLabels];
  uint64_t v18 = [v17 count];

  if ([v16 count] == 1)
  {
    [(CKEffectPickerLargeTextView *)self marginBetweenPickerDotButtons];
    double v20 = v10 - round(v19 + v19 + (double)(v18 + 1) * 9.0 + 19.0);
  }
  else
  {
    [(CKEffectPickerLargeTextView *)self marginBetweenPickerDotButtons];
    double v20 = (v10 - round(v21 + (double)v18 * 9.0 + 19.0)) * 0.5;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v22 = v16;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v31;
    double v26 = -v20;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(v22);
        }
        [*(id *)(*((void *)&v30 + 1) + 8 * i) setConstant:v26];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v24);
  }

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __55__CKEffectPickerLargeTextView__touchUpInsideDotButton___block_invoke;
  v29[3] = &unk_1E5620C40;
  v29[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v29 animations:0.25];
  v28.receiver = self;
  v28.super_class = (Class)CKEffectPickerLargeTextView;
  [(CKEffectPickerView *)&v28 _touchUpInsideDotButton:v4];
}

uint64_t __55__CKEffectPickerLargeTextView__touchUpInsideDotButton___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (double)offsetYForLabelAtIndex:(int64_t)a3 withInitialY:(double)a4
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v6 = 0;
  }
  else
  {
    double v7 = [(CKEffectPickerView *)self effectDescriptiveLabels];
    double v6 = [v7 objectAtIndex:a3];

    if (!a3)
    {
      v14 = [(CKEffectPickerView *)self closeButton];
      [v14 frame];
      double v15 = [(CKEffectPickerView *)self balloonView];
      [v15 frame];
      [v6 bounds];

      goto LABEL_9;
    }
  }
  double v8 = [(CKEffectPickerView *)self effectLabels];
  uint64_t v9 = [v8 count] - 1;

  if (v9 == a3)
  {
    double v10 = [(CKEffectPickerView *)self roundedContainerView];
    double v11 = [(CKEffectPickerView *)self effectSendButtons];
    id v12 = [v11 objectAtIndex:a3];
    [v12 frame];
    objc_msgSend(v10, "convertRect:toView:", self);

    [v6 bounds];
  }
  else
  {
    uint64_t v13 = [(CKEffectPickerView *)self balloonView];
    [v13 frame];
    [v6 bounds];

    [v6 bounds];
  }
LABEL_9:
  UIRoundToViewScale();
  double v17 = v16;

  return v17;
}

- (BOOL)shouldAnimatePreviousLabelForCancel:(id)a3
{
  return 0;
}

- (void)effectTypeDidChange:(id)a3
{
  id v4 = a3;
  if ([(CKEffectPickerLargeTextView *)self finishedInitializing])
  {
    if ([v4 selectedSegmentIndex])
    {
      if ([v4 selectedSegmentIndex] != 1)
      {
LABEL_7:
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __51__CKEffectPickerLargeTextView_effectTypeDidChange___block_invoke;
        v9[3] = &unk_1E5620C40;
        v9[4] = self;
        [MEMORY[0x1E4F42FF0] animateWithDuration:v9 animations:0.25];
        goto LABEL_8;
      }
      double v5 = [(CKEffectPickerView *)self closeButtonBottomConstraint];
      double v6 = v5;
      double v7 = -178.0;
    }
    else
    {
      double v5 = [(CKEffectPickerView *)self closeButtonBottomConstraint];
      double v6 = v5;
      double v7 = -20.0;
    }
    [v5 setConstant:v7];

    goto LABEL_7;
  }
LABEL_8:
  v8.receiver = self;
  v8.super_class = (Class)CKEffectPickerLargeTextView;
  [(CKEffectPickerView *)&v8 effectTypeDidChange:v4];
}

uint64_t __51__CKEffectPickerLargeTextView_effectTypeDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (BOOL)finishedInitializing
{
  return self->_finishedInitializing;
}

- (void)setFinishedInitializing:(BOOL)a3
{
  self->_finishedInitializing = a3;
}

@end