@interface MediaControlsExpandableButton
+ (double)collapsedHeightWithImageHeight:(double)a3 maximumHeight:(double)a4;
+ (id)optionsForListeningModes:(id)a3;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)displayMessage;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isControlCenter;
- (BOOL)isExpanded;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)toggleEnabled;
- (CGSize)buttonImageSize;
- (CGSize)maximumExpandedSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MRUExpandableButtonSelectionView)selectionView;
- (MRUVisualStylingProvider)stylingProvider;
- (MTVisualStylingProvider)visualStylingProvider;
- (MediaControlsExpandableButton)initWithFrame:(CGRect)a3;
- (MediaControlsExpandableButtonOption)selectedOption;
- (MediaControlsHapticPlayer)hapticPlayer;
- (NSArray)options;
- (NSMutableArray)buttons;
- (NSString)disabledSubtitle;
- (NSString)title;
- (NSTimer)messageTimer;
- (UIImageView)subtitleIndicator;
- (UILabel)messageLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIView)backgroundView;
- (id)initForControlCenter;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)selectedButton;
- (int64_t)_buttonLayoutAxis;
- (int64_t)axis;
- (int64_t)selectedOptionIndex;
- (void)_layoutLabels;
- (void)_layoutSelectionView;
- (void)_resetSelectionView;
- (void)_updateButtonsVisiblity;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)didTapButton:(id)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)playFailedValueChangedEventHaptic;
- (void)playFailedValueChangedEventHapticWithMessage:(id)a3;
- (void)playValueChangedEventHaptic;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)resetMessage;
- (void)resetMessageAnimated:(BOOL)a3;
- (void)setAvailableListeningModes:(id)a3;
- (void)setAxis:(int64_t)a3;
- (void)setBackgroundView:(id)a3;
- (void)setButtonImageSize:(CGSize)a3;
- (void)setButtons:(id)a3;
- (void)setContentVerticalAlignment:(int64_t)a3;
- (void)setDisabledSubtitle:(id)a3;
- (void)setDisplayMessage:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setHapticPlayer:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsControlCenter:(BOOL)a3;
- (void)setMaximumExpandedSize:(CGSize)a3;
- (void)setMessageLabel:(id)a3;
- (void)setMessageTimer:(id)a3;
- (void)setOptions:(id)a3;
- (void)setSelectedListeningMode:(id)a3 animated:(BOOL)a4;
- (void)setSelectedOptionIndex:(int64_t)a3;
- (void)setSelectedOptionIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)setSelectedOptionIndexWithValueChanged:(unint64_t)a3;
- (void)setSelectionView:(id)a3;
- (void)setStylingProvider:(id)a3;
- (void)setSubtitleIndicator:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setToggleEnabled:(BOOL)a3;
- (void)setVisualStylingProvider:(id)a3;
- (void)showMessage:(id)a3;
- (void)toggleSelectedOption;
- (void)updateContentSizeCategory;
- (void)updateGlyphSelectionState;
- (void)updateSubtitle;
- (void)updateVisualStyling;
@end

@implementation MediaControlsExpandableButton

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  [(UILabel *)self->_titleLabel setText:v5];

  [(MediaControlsExpandableButton *)self setNeedsLayout];
}

- (void)setSelectedOptionIndex:(int64_t)a3 animated:(BOOL)a4
{
  if (a4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __65__MediaControlsExpandableButton_setSelectedOptionIndex_animated___block_invoke;
    v5[3] = &unk_1E5F0DBF8;
    v5[4] = self;
    v5[5] = a3;
    objc_msgSend(MEMORY[0x1E4FB1EB0], "mru_animateUsingType:animations:", 2, v5);
  }
  else
  {
    [(MediaControlsExpandableButton *)self setSelectedOptionIndex:a3];
  }
}

- (void)setOptions:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_options, a3);
  uint64_t v6 = [v5 count];
  self->_toggleEnabled = v6 == 2;
  BOOL v7 = v6 != 2 && self->_expanded;
  self->_expanded = v7;
  for (unint64_t i = -[NSMutableArray count](self->_buttons, "count"); i > [v5 count]; --i)
  {
    v9 = [(NSMutableArray *)self->_buttons lastObject];
    [(NSMutableArray *)self->_buttons removeLastObject];
    [v9 removeFromSuperview];
  }
  unint64_t v10 = [(NSMutableArray *)self->_buttons count];
  if (v10 < [v5 count])
  {
    double v11 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      v15 = -[MediaControlsRoundButton initWithFrame:]([MediaControlsRoundButton alloc], "initWithFrame:", v11, v12, v13, v14);
      [(MediaControlsRoundButton *)v15 addTarget:self action:sel_didTapButton_ forControlEvents:64];
      [(NSMutableArray *)self->_buttons addObject:v15];
      [(MediaControlsExpandableButton *)self addSubview:v15];

      ++v10;
    }
    while (v10 < [v5 count]);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __44__MediaControlsExpandableButton_setOptions___block_invoke;
  v16[3] = &unk_1E5F0F700;
  v16[4] = self;
  [v5 enumerateObjectsUsingBlock:v16];
  [(MediaControlsExpandableButton *)self updateVisualStyling];
  [(MediaControlsExpandableButton *)self setSelectedOptionIndex:0x7FFFFFFFFFFFFFFFLL];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MediaControlsExpandableButton;
  -[MediaControlsExpandableButton setEnabled:](&v5, sel_setEnabled_);
  [(MediaControlsExpandableButton *)self updateSubtitle];
  [(MediaControlsExpandableButton *)self updateVisualStyling];
  [(MediaControlsExpandableButton *)self _updateButtonsVisiblity];
  [(MediaControlsExpandableButton *)self updateGlyphSelectionState];
  [(MRUExpandableButtonSelectionView *)self->_selectionView setEnabled:v3];
  [(MediaControlsExpandableButton *)self setNeedsLayout];
}

- (void)setSelectedOptionIndex:(int64_t)a3
{
  BOOL v4 = self->_selectedOptionIndex == 0x7FFFFFFFFFFFFFFFLL;
  self->_selectedOptionIndex = a3;
  [(MediaControlsExpandableButton *)self updateSubtitle];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__MediaControlsExpandableButton_setSelectedOptionIndex___block_invoke;
  v6[3] = &unk_1E5F0D8C0;
  v6[4] = self;
  BOOL v7 = v4;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v6];
  objc_super v5 = [(MediaControlsExpandableButton *)self selectedOption];
  [(MRUExpandableButtonSelectionView *)self->_selectionView setOption:v5];

  [(MediaControlsExpandableButton *)self _updateButtonsVisiblity];
  [(MediaControlsExpandableButton *)self updateGlyphSelectionState];
  [(MediaControlsExpandableButton *)self setNeedsLayout];
}

- (void)updateSubtitle
{
  if (([(MediaControlsExpandableButton *)self isEnabled] & 1) != 0
    || (disabledSubtitle = self->_disabledSubtitle) == 0)
  {
    BOOL v4 = [(MediaControlsExpandableButton *)self selectedOption];
    objc_super v5 = [v4 title];

    [(UILabel *)self->_subtitleLabel setText:v5];
  }
  else
  {
    objc_super v5 = disabledSubtitle;
    [(UILabel *)self->_subtitleLabel setText:v5];
  }
  [(MediaControlsExpandableButton *)self _layoutLabels];
}

- (void)updateGlyphSelectionState
{
  buttons = self->_buttons;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__MediaControlsExpandableButton_updateGlyphSelectionState__block_invoke;
  v3[3] = &unk_1E5F0F798;
  v3[4] = self;
  [(NSMutableArray *)buttons enumerateObjectsUsingBlock:v3];
}

- (void)_updateButtonsVisiblity
{
  buttons = self->_buttons;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__MediaControlsExpandableButton__updateButtonsVisiblity__block_invoke;
  v3[3] = &unk_1E5F0F798;
  v3[4] = self;
  [(NSMutableArray *)buttons enumerateObjectsUsingBlock:v3];
}

- (MediaControlsExpandableButtonOption)selectedOption
{
  if (self->_selectedOptionIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = 0;
  }
  else
  {
    v2 = -[NSArray objectAtIndexedSubscript:](self->_options, "objectAtIndexedSubscript:");
  }

  return (MediaControlsExpandableButtonOption *)v2;
}

- (void)updateVisualStyling
{
  int v3 = [(MediaControlsExpandableButton *)self isEnabled];
  double v4 = 0.5;
  if (v3) {
    double v4 = 1.0;
  }
  [(UIView *)self->_backgroundView setAlpha:v4];
  stylingProvider = self->_stylingProvider;
  if (stylingProvider)
  {
    if (self->_displayMessage)
    {
      [(UILabel *)self->_titleLabel setAlpha:0.0];
      [(UILabel *)self->_subtitleLabel setAlpha:0.0];
      [(UIImageView *)self->_subtitleIndicator setAlpha:0.0];
      uint64_t v6 = self->_stylingProvider;
      messageLabel = self->_messageLabel;
      [(MRUVisualStylingProvider *)v6 applyStyle:0 toView:messageLabel];
      return;
    }
    if (self->_expanded) {
      goto LABEL_27;
    }
    char v12 = [(MediaControlsExpandableButton *)self isEnabled];
    stylingProvider = self->_stylingProvider;
    if ((v12 & 1) == 0)
    {
      [(MRUVisualStylingProvider *)stylingProvider applyStyle:0 toView:self->_titleLabel];
      [(MRUVisualStylingProvider *)self->_stylingProvider applyStyle:0 toView:self->_subtitleLabel];
      [(MRUVisualStylingProvider *)self->_stylingProvider applyStyle:0 toView:self->_subtitleIndicator];
      [(UILabel *)self->_titleLabel setAlpha:0.5];
      [(UILabel *)self->_subtitleLabel setAlpha:0.5];
      subtitleIndicator = self->_subtitleIndicator;
      double v11 = 0.5;
      goto LABEL_20;
    }
    if (stylingProvider)
    {
LABEL_27:
      if (!self->_expanded)
      {
        [(MRUVisualStylingProvider *)stylingProvider applyStyle:0 toView:self->_titleLabel];
        [(MRUVisualStylingProvider *)self->_stylingProvider applyStyle:0 toView:self->_subtitleLabel];
        [(MRUVisualStylingProvider *)self->_stylingProvider applyStyle:0 toView:self->_subtitleIndicator];
LABEL_21:
        v8 = self->_messageLabel;
        double v9 = 0.0;
        goto LABEL_22;
      }
      goto LABEL_14;
    }
LABEL_13:
    if (!self->_expanded)
    {
      [(UILabel *)self->_titleLabel setAlpha:1.0];
      [(UILabel *)self->_subtitleLabel setAlpha:1.0];
      subtitleIndicator = self->_subtitleIndicator;
      double v11 = 1.0;
      goto LABEL_20;
    }
LABEL_14:
    [(UILabel *)self->_titleLabel setAlpha:0.0];
    [(UILabel *)self->_subtitleLabel setAlpha:0.0];
    subtitleIndicator = self->_subtitleIndicator;
    double v11 = 0.0;
LABEL_20:
    [(UIImageView *)subtitleIndicator setAlpha:v11];
    goto LABEL_21;
  }
  if (!self->_displayMessage) {
    goto LABEL_13;
  }
  [(UILabel *)self->_titleLabel setAlpha:0.0];
  [(UILabel *)self->_subtitleLabel setAlpha:0.0];
  [(UIImageView *)self->_subtitleIndicator setAlpha:0.0];
  v8 = self->_messageLabel;
  double v9 = 1.0;
LABEL_22:

  [(UILabel *)v8 setAlpha:v9];
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void)setDisabledSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_disabledSubtitle, a3);
  [(MediaControlsExpandableButton *)self updateSubtitle];

  [(MediaControlsExpandableButton *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  v71.receiver = self;
  v71.super_class = (Class)MediaControlsExpandableButton;
  [(MediaControlsExpandableButton *)&v71 layoutSubviews];
  [(MediaControlsExpandableButton *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = [(MediaControlsExpandableButton *)self traitCollection];
  [v11 displayScale];

  int64_t axis = self->_axis;
  if (axis)
  {
    if (axis != 1) {
      goto LABEL_8;
    }
    v74.origin.CGFloat x = v4;
    v74.origin.CGFloat y = v6;
    v74.size.width = v8;
    v74.size.height = v10;
    CGFloat Width = CGRectGetWidth(v74);
    v75.origin.CGFloat x = v4;
    v75.origin.CGFloat y = v6;
    v75.size.width = v8;
    v75.size.height = v10;
    uint64_t v13 = 0;
    CGRectGetHeight(v75);
    v76.origin.CGFloat x = v4;
    v76.origin.CGFloat y = v6;
    v76.size.width = v8;
    v76.size.height = v10;
    CGRectGetHeight(v76);
    UIFloorToScale();
    uint64_t v15 = v14;
    if ((unint64_t)[(NSMutableArray *)self->_buttons count] >= 2)
    {
      [(NSMutableArray *)self->_buttons count];
      [(NSMutableArray *)self->_buttons count];
      UIFloorToScale();
      uint64_t v13 = v16;
    }
    buttons = self->_buttons;
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __47__MediaControlsExpandableButton_layoutSubviews__block_invoke_2;
    v69[3] = &unk_1E5F0F6D8;
    v69[4] = self;
    *(CGFloat *)&v69[5] = v4;
    *(CGFloat *)&v69[6] = v6;
    *(CGFloat *)&v69[7] = v8;
    *(CGFloat *)&v69[8] = v10;
    v69[9] = v15;
    v69[10] = v13;
    *(CGFloat *)&v69[11] = Width;
    v18 = v69;
  }
  else
  {
    v77.origin.CGFloat x = v4;
    v77.origin.CGFloat y = v6;
    v77.size.width = v8;
    v77.size.height = v10;
    CGFloat Height = CGRectGetHeight(v77);
    v78.origin.CGFloat x = v4;
    v78.origin.CGFloat y = v6;
    v78.size.width = v8;
    v78.size.height = v10;
    CGRectGetWidth(v78);
    v79.origin.CGFloat x = v4;
    v79.origin.CGFloat y = v6;
    v79.size.width = v8;
    v79.size.height = v10;
    CGRectGetWidth(v79);
    UIFloorToScale();
    uint64_t v21 = v20;
    [(NSArray *)self->_options count];
    UIFloorToScale();
    buttons = self->_buttons;
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __47__MediaControlsExpandableButton_layoutSubviews__block_invoke;
    v70[3] = &unk_1E5F0F6D8;
    v70[4] = self;
    *(CGFloat *)&v70[5] = v4;
    *(CGFloat *)&v70[6] = v6;
    *(CGFloat *)&v70[7] = v8;
    *(CGFloat *)&v70[8] = v10;
    v70[9] = v21;
    v70[10] = v22;
    *(CGFloat *)&v70[11] = Height;
    v18 = v70;
  }
  [(NSMutableArray *)buttons enumerateObjectsUsingBlock:v18];
LABEL_8:
  v23 = [(NSMutableArray *)self->_buttons firstObject];
  [v23 assetFrame];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  v32 = [(NSMutableArray *)self->_buttons firstObject];
  -[MediaControlsExpandableButton convertRect:fromView:](self, "convertRect:fromView:", v32, v25, v27, v29, v31);
  CGFloat x = v33;
  CGFloat y = v35;
  CGFloat v38 = v37;
  CGFloat v40 = v39;

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v41 = self->_buttons;
  uint64_t v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v65 objects:v72 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v66 != v44) {
          objc_enumerationMutation(v41);
        }
        v46 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        [v46 assetFrame];
        -[MediaControlsExpandableButton convertRect:fromView:](self, "convertRect:fromView:", v46);
        v84.origin.CGFloat x = v47;
        v84.origin.CGFloat y = v48;
        v84.size.width = v49;
        v84.size.height = v50;
        v80.origin.CGFloat x = x;
        v80.origin.CGFloat y = y;
        v80.size.width = v38;
        v80.size.height = v40;
        CGRect v81 = CGRectUnion(v80, v84);
        CGFloat x = v81.origin.x;
        CGFloat y = v81.origin.y;
        CGFloat v38 = v81.size.width;
        CGFloat v40 = v81.size.height;
      }
      uint64_t v43 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v65 objects:v72 count:16];
    }
    while (v43);
  }

  [(MediaControlsExpandableButton *)self bounds];
  UIRectCenteredXInRect();
  CGFloat v52 = v51;
  CGFloat v54 = v53;
  CGFloat v56 = v55;
  CGFloat v58 = v57;
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  v82.origin.CGFloat x = v52;
  v82.origin.CGFloat y = v54;
  v82.size.width = v56;
  v82.size.height = v58;
  double v59 = CGRectGetWidth(v82);
  v83.origin.CGFloat x = v52;
  v83.origin.CGFloat y = v54;
  v83.size.width = v56;
  v83.size.height = v58;
  double v60 = CGRectGetHeight(v83);
  BOOL v61 = v59 == v60;
  if (v59 < v60) {
    double v60 = v59;
  }
  double v62 = v60 * 0.5;
  backgroundView = self->_backgroundView;
  if (v61) {
    [(UIView *)backgroundView _setCornerRadius:v62];
  }
  else {
    [(UIView *)backgroundView _setContinuousCornerRadius:v62];
  }
  [(MediaControlsExpandableButton *)self _layoutSelectionView];
  [(MediaControlsExpandableButton *)self _layoutLabels];
}

- (void)_layoutLabels
{
  double v3 = [(MediaControlsExpandableButton *)self traitCollection];
  [v3 displayScale];
  uint64_t v5 = v4;
  uint64_t v44 = v4;

  [(MediaControlsExpandableButton *)self bounds];
  CGFloat v6 = [(MediaControlsExpandableButton *)self backgroundView];
  [v6 frame];
  CGRectGetMaxY(v48);
  UIRectInset();
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v12 = v11;
  double v14 = v13;

  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v12, v14);
  v49.origin.CGFloat x = v8;
  v49.origin.CGFloat y = v10;
  v49.size.CGFloat width = v12;
  v49.size.CGFloat height = v14;
  CGRectGetMinY(v49);
  UIRectCenteredXInRectScale();
  CGFloat v45 = v16;
  CGFloat v46 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  [(UILabel *)self->_titleLabel setFrame:v5];
  -[UILabel sizeThatFits:](self->_messageLabel, "sizeThatFits:", v12, v14);
  v50.origin.CGFloat x = v8;
  v50.origin.CGFloat y = v10;
  v50.size.CGFloat width = v12;
  v50.size.CGFloat height = v14;
  CGRectGetMinY(v50);
  UIRectCenteredXInRectScale();
  [(UILabel *)self->_messageLabel setFrame:v44];
  v51.size.CGFloat height = v45;
  v51.origin.CGFloat x = v46;
  v51.origin.CGFloat y = v18;
  v51.size.CGFloat width = v20;
  CGRectGetHeight(v51);
  UIRectInset();
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  -[UIImageView sizeThatFits:](self->_subtitleIndicator, "sizeThatFits:", v25, v27);
  double v30 = v29;
  subtitleLabel = self->_subtitleLabel;
  v52.origin.CGFloat x = v22;
  v52.origin.CGFloat y = v24;
  v52.size.CGFloat width = v26;
  v52.size.CGFloat height = v28;
  CGFloat v32 = CGRectGetWidth(v52) - (v30 + 4.0);
  v53.origin.CGFloat x = v22;
  v53.origin.CGFloat y = v24;
  v53.size.CGFloat width = v26;
  v53.size.CGFloat height = v28;
  -[UILabel sizeThatFits:](subtitleLabel, "sizeThatFits:", v32, CGRectGetHeight(v53));
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  v54.origin.CGFloat x = v22;
  v54.origin.CGFloat y = v24;
  v54.size.CGFloat width = v26;
  v54.size.CGFloat height = v28;
  CGRectGetWidth(v54);
  UIRectInset();
  CGFloat x = v55.origin.x;
  CGFloat y = v55.origin.y;
  CGFloat width = v55.size.width;
  CGFloat height = v55.size.height;
  CGFloat MinX = CGRectGetMinX(v55);
  v56.origin.CGFloat x = x;
  v56.origin.CGFloat y = y;
  v56.size.CGFloat width = width;
  v56.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v56);
  [(MediaControlsExpandableButton *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:");
  v57.origin.CGFloat x = MinX;
  v57.origin.CGFloat y = MinY;
  v57.size.CGFloat width = v34;
  v57.size.CGFloat height = v36;
  CGRectGetWidth(v57);
  UIRectInset();
  CGRectGetMinX(v58);
  UIRectCenteredYInRect();
  [(MediaControlsExpandableButton *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  subtitleIndicator = self->_subtitleIndicator;

  -[UIImageView setFrame:](subtitleIndicator, "setFrame:");
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)_layoutSelectionView
{
  double v3 = [(MediaControlsExpandableButton *)self selectedButton];
  if (v3)
  {
    id v16 = v3;
    [v3 assetFrame];
    -[MediaControlsExpandableButton convertRect:fromView:](self, "convertRect:fromView:", v16);
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    if (self->_expanded)
    {
      int v12 = [(MediaControlsExpandableButton *)self isHighlighted];
      double v13 = 4.0;
      if (v12) {
        double v13 = 2.0;
      }
      double v5 = v5 + v13;
      double v7 = v7 + v13;
      double v14 = v13 + v13;
      double v9 = v9 - v14;
      double v11 = v11 - v14;
    }
    UIRectCenteredAboutPoint();
    -[MRUExpandableButtonSelectionView setBounds:](self->_selectionView, "setBounds:");
    v18.origin.CGFloat x = v5;
    v18.origin.CGFloat y = v7;
    v18.size.CGFloat width = v9;
    v18.size.CGFloat height = v11;
    double MidX = CGRectGetMidX(v18);
    v19.origin.CGFloat x = v5;
    v19.origin.CGFloat y = v7;
    v19.size.CGFloat width = v9;
    v19.size.CGFloat height = v11;
    -[MRUExpandableButtonSelectionView setCenter:](self->_selectionView, "setCenter:", MidX, CGRectGetMidY(v19));
    v20.origin.CGFloat x = v5;
    v20.origin.CGFloat y = v7;
    v20.size.CGFloat width = v9;
    v20.size.CGFloat height = v11;
    [(MRUExpandableButtonSelectionView *)self->_selectionView _setCornerRadius:CGRectGetHeight(v20) * 0.5];
    double v3 = v16;
  }
}

- (id)selectedButton
{
  if (self->_selectedOptionIndex == 0x7FFFFFFFFFFFFFFFLL
    || (unint64_t)[(NSMutableArray *)self->_buttons count] <= self->_selectedOptionIndex)
  {
    double v3 = 0;
  }
  else
  {
    double v3 = -[NSMutableArray objectAtIndexedSubscript:](self->_buttons, "objectAtIndexedSubscript:");
  }

  return v3;
}

- (void)setAxis:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_int64_t axis = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v4 = self->_buttons;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setAxis:", -[MediaControlsExpandableButton _buttonLayoutAxis](self, "_buttonLayoutAxis", (void)v9));
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(MediaControlsExpandableButton *)self setNeedsLayout];
}

- (int64_t)_buttonLayoutAxis
{
  if (self->_toggleEnabled) {
    return 0;
  }
  else {
    return self->_axis;
  }
}

uint64_t __56__MediaControlsExpandableButton_setSelectedOptionIndex___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _layoutLabels];
  if (*(unsigned char *)(a1 + 40))
  {
    double v3 = *(void **)(a1 + 32);
    return [v3 _layoutSelectionView];
  }
  return result;
}

uint64_t __47__MediaControlsExpandableButton_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 456))
  {
    double v3 = *(double *)(a1 + 80);
    double v4 = *(double *)(a1 + 72) + v3 * (double)a3;
    uint64_t v5 = (double *)(a1 + 88);
    double v6 = 0.0;
  }
  else
  {
    double v4 = *(double *)(a1 + 40);
    double v6 = *(double *)(a1 + 48);
    uint64_t v5 = (double *)(a1 + 64);
    double v3 = *(double *)(a1 + 56);
  }
  return objc_msgSend(a2, "setFrame:", v4, v6, v3, *v5);
}

+ (id)optionsForListeningModes:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v28 = *(void *)v30;
    uint64_t v7 = *MEMORY[0x1E4F15F38];
    uint64_t v8 = *MEMORY[0x1E4F15F50];
    uint64_t v9 = *MEMORY[0x1E4F15F48];
    uint64_t v10 = *MEMORY[0x1E4F15F40];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v28) {
          objc_enumerationMutation(obj);
        }
        long long v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v12 isEqual:v7])
        {
          double v13 = objc_alloc_init(MediaControlsExpandableButtonOption);
          [(MediaControlsExpandableButtonOption *)v13 setIdentifier:v7];
          uint64_t v14 = +[MRUAsset packageAssetNamed:@"ListeningModeNoiseCancellation"];
          [(MediaControlsExpandableButtonOption *)v13 setAsset:v14];

          double v15 = +[MRUStringsProvider listeningModeNoiseCancellation];
          [(MediaControlsExpandableButtonOption *)v13 setTitle:v15];

          [(MediaControlsExpandableButtonOption *)v13 setSelectedState:@"on"];
          [(MediaControlsExpandableButtonOption *)v13 setSelectedBackground:2];
          [v4 addObject:v13];
        }
        if ([v12 isEqual:v8])
        {
          id v16 = objc_alloc_init(MediaControlsExpandableButtonOption);
          [(MediaControlsExpandableButtonOption *)v16 setIdentifier:v8];
          double v17 = +[MRUAsset packageAssetNamed:@"ListeningModeOff"];
          [(MediaControlsExpandableButtonOption *)v16 setAsset:v17];

          CGRect v18 = +[MRUStringsProvider listeningModeOff];
          [(MediaControlsExpandableButtonOption *)v16 setTitle:v18];

          [(MediaControlsExpandableButtonOption *)v16 setSelectedState:@"on"];
          [v4 addObject:v16];
        }
        if ([v12 isEqual:v9])
        {
          CGRect v19 = objc_alloc_init(MediaControlsExpandableButtonOption);
          [(MediaControlsExpandableButtonOption *)v19 setIdentifier:v9];
          CGRect v20 = +[MRUAsset packageAssetNamed:@"ListeningModeAuto"];
          [(MediaControlsExpandableButtonOption *)v19 setAsset:v20];

          double v21 = +[MRUStringsProvider listeningModeAutomatic];
          [(MediaControlsExpandableButtonOption *)v19 setTitle:v21];

          [(MediaControlsExpandableButtonOption *)v19 setSelectedState:@"on"];
          [(MediaControlsExpandableButtonOption *)v19 setSelectedBackground:1];
          [v4 addObject:v19];
        }
        if ([v12 isEqual:v10])
        {
          CGFloat v22 = objc_alloc_init(MediaControlsExpandableButtonOption);
          [(MediaControlsExpandableButtonOption *)v22 setIdentifier:v10];
          double v23 = +[MRUAsset packageAssetNamed:@"ListeningModeTransparency"];
          [(MediaControlsExpandableButtonOption *)v22 setAsset:v23];

          CGFloat v24 = +[MRUStringsProvider listeningModeTransparency];
          [(MediaControlsExpandableButtonOption *)v22 setTitle:v24];

          [(MediaControlsExpandableButtonOption *)v22 setSelectedState:@"on"];
          [(MediaControlsExpandableButtonOption *)v22 setSelectedBackground:2];
          [v4 addObject:v22];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v6);
  }

  double v25 = (void *)[v4 copy];

  return v25;
}

- (void)setAvailableListeningModes:(id)a3
{
  id v4 = a3;
  id v10 = [(id)objc_opt_class() optionsForListeningModes:v4];

  uint64_t v5 = [(MediaControlsExpandableButton *)self traitCollection];
  uint64_t v6 = [v5 layoutDirection];

  if (v6 == 1)
  {
    uint64_t v7 = [v10 reverseObjectEnumerator];
    uint64_t v8 = [v7 allObjects];

    id v9 = (id)v8;
  }
  else
  {
    id v9 = v10;
  }
  id v11 = v9;
  [(MediaControlsExpandableButton *)self setOptions:v9];
}

- (void)setSelectedListeningMode:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(MediaControlsExpandableButton *)self options];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__MediaControlsExpandableButton_MRUListeningMode__setSelectedListeningMode_animated___block_invoke;
  v10[3] = &unk_1E5F0F028;
  id v11 = v6;
  id v8 = v6;
  uint64_t v9 = [v7 indexOfObjectPassingTest:v10];

  [(MediaControlsExpandableButton *)self setSelectedOptionIndex:v9 animated:v4];
}

uint64_t __85__MediaControlsExpandableButton_MRUListeningMode__setSelectedListeningMode_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)initForControlCenter
{
  v2 = -[MediaControlsExpandableButton initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F5AE08] controlCenterDarkMaterial];
    [(MediaControlsExpandableButton *)v2 setBackgroundView:v3];

    v2->_isControlCenter = 1;
  }
  return v2;
}

- (MediaControlsExpandableButton)initWithFrame:(CGRect)a3
{
  v37.receiver = self;
  v37.super_class = (Class)MediaControlsExpandableButton;
  id v3 = -[MediaControlsExpandableButton initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    buttons = v3->_buttons;
    v3->_buttons = (NSMutableArray *)v4;

    v3->_selectedOptionIndeCGFloat x = 0x7FFFFFFFFFFFFFFFLL;
    [(MediaControlsExpandableButton *)v3 setContentVerticalAlignment:0];
    uint64_t v6 = objc_opt_new();
    hapticPlayer = v3->_hapticPlayer;
    v3->_hapticPlayer = (MediaControlsHapticPlayer *)v6;

    id v8 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v9 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v13 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], v10, v11, v12);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (UIView *)v13;

    double v15 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
    [(UIView *)v3->_backgroundView setBackgroundColor:v15];

    [(MediaControlsExpandableButton *)v3 addSubview:v3->_backgroundView];
    id v16 = -[MRUExpandableButtonSelectionView initWithFrame:]([MRUExpandableButtonSelectionView alloc], "initWithFrame:", v9, v10, v11, v12);
    selectionView = v3->_selectionView;
    v3->_selectionView = v16;

    [(MediaControlsExpandableButton *)v3 addSubview:v3->_selectionView];
    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v9, v10, v11, v12);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v18;

    [(UILabel *)v3->_titleLabel setNumberOfLines:2];
    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    LODWORD(v20) = 1051931443;
    [(UILabel *)v3->_titleLabel _setHyphenationFactor:v20];
    double v21 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v3->_titleLabel setTextColor:v21];

    [(MediaControlsExpandableButton *)v3 addSubview:v3->_titleLabel];
    uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v9, v10, v11, v12);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v22;

    [(UILabel *)v3->_subtitleLabel setTextAlignment:1];
    [(UILabel *)v3->_subtitleLabel setNumberOfLines:2];
    LODWORD(v24) = 1051931443;
    [(UILabel *)v3->_subtitleLabel _setHyphenationFactor:v24];
    double v25 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v3->_subtitleLabel setTextColor:v25];

    [(MediaControlsExpandableButton *)v3 addSubview:v3->_subtitleLabel];
    id v26 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v27 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.up.chevron.down"];
    uint64_t v28 = [v26 initWithImage:v27];
    subtitleIndicator = v3->_subtitleIndicator;
    v3->_subtitleIndicator = (UIImageView *)v28;

    [(MediaControlsExpandableButton *)v3 addSubview:v3->_subtitleIndicator];
    uint64_t v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v9, v10, v11, v12);
    messageLabel = v3->_messageLabel;
    v3->_messageLabel = (UILabel *)v30;

    [(UILabel *)v3->_messageLabel setNumberOfLines:2];
    [(UILabel *)v3->_messageLabel setTextAlignment:1];
    LODWORD(v32) = 1051931443;
    [(UILabel *)v3->_messageLabel _setHyphenationFactor:v32];
    [(UILabel *)v3->_messageLabel setAlpha:0.0];
    double v33 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v3->_messageLabel setTextColor:v33];

    [(MediaControlsExpandableButton *)v3 addSubview:v3->_messageLabel];
    uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v3];
    [(MediaControlsExpandableButton *)v3 addInteraction:v34];
    double v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v35 addObserver:v3 selector:sel_updateContentSizeCategory name:*MEMORY[0x1E4FB27A8] object:0];

    [(MediaControlsExpandableButton *)v3 updateContentSizeCategory];
  }
  return v3;
}

uint64_t __47__MediaControlsExpandableButton_layoutSubviews__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 456))
  {
    double v4 = *(double *)(v3 + 616);
    double v5 = *(double *)(a1 + 72) + (*(double *)(a1 + 80) + v4) * (double)a3;
    uint64_t v6 = (double *)(a1 + 88);
    double v7 = 0.0;
  }
  else
  {
    double v7 = *(double *)(a1 + 40);
    double v5 = *(double *)(a1 + 48);
    uint64_t v6 = (double *)(a1 + 56);
    double v4 = *(double *)(a1 + 64);
  }
  return objc_msgSend(a2, "setFrame:", v7, v5, *v6, v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  if (self->_axis && self->_expanded)
  {
    double v5 = self->_maximumExpandedSize.height;
    if (v5 <= 0.0)
    {
      double v6 = self->_buttonImageSize.height;
      double v5 = v6 * (double)(unint64_t)[(NSMutableArray *)self->_buttons count];
    }
  }
  else
  {
    [(id)objc_opt_class() collapsedHeightWithImageHeight:self->_buttonImageSize.height maximumHeight:a3.height];
    double v5 = v7 + 0.0;
  }
  if (v5 >= height) {
    double v8 = height;
  }
  else {
    double v8 = v5;
  }
  double v9 = width;
  result.double height = v8;
  result.CGFloat width = v9;
  return result;
}

+ (double)collapsedHeightWithImageHeight:(double)a3 maximumHeight:(double)a4
{
  double v5 = a3 + 8.0;
  double v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v6 scale];

  double v7 = objc_msgSend(MEMORY[0x1E4FB08E0], "mru_volumeButtonTitleFont");
  [v7 lineHeight];
  UICeilToScale();
  double v9 = v5 + v8;

  double v10 = objc_msgSend(MEMORY[0x1E4FB08E0], "mru_volumeButtonSubtitleFont");
  [v10 lineHeight];
  UICeilToScale();
  double v12 = v9 + v11;

  if (v12 >= a4) {
    return a4;
  }
  else {
    return v12;
  }
}

- (void)setBackgroundView:(id)a3
{
  double v5 = (UIView *)a3;
  backgroundView = self->_backgroundView;
  double v7 = v5;
  if (backgroundView != v5)
  {
    [(UIView *)backgroundView removeFromSuperview];
    objc_storeStrong((id *)&self->_backgroundView, a3);
    [(MediaControlsExpandableButton *)self insertSubview:v7 atIndex:0];
  }
}

- (void)setStylingProvider:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    [(MRUVisualStylingProvider *)stylingProvider removeObserver:self];
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)self->_stylingProvider addObserver:self];
    [(MediaControlsExpandableButton *)self updateVisualStyling];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v7 = self->_buttons;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "setStylingProvider:", v5, (void)v12);
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

void __44__MediaControlsExpandableButton_setOptions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = *(void **)(*(void *)(a1 + 32) + 512);
  id v6 = a2;
  id v9 = [v5 objectAtIndexedSubscript:a3];
  double v7 = [v6 title];
  [v9 setTitle:v7];

  uint64_t v8 = [v6 asset];

  [v9 setAsset:v8];
  [v9 setStylingProvider:*(void *)(*(void *)(a1 + 32) + 504)];
  objc_msgSend(v9, "setAssetSize:", *(double *)(*(void *)(a1 + 32) + 608), *(double *)(*(void *)(a1 + 32) + 616));
  objc_msgSend(v9, "setAxis:", objc_msgSend(*(id *)(a1 + 32), "_buttonLayoutAxis"));
  objc_msgSend(v9, "setContentVerticalAlignment:", objc_msgSend(*(id *)(a1 + 32), "contentVerticalAlignment"));
  if (*(unsigned char *)(*(void *)(a1 + 32) + 459)) {
    [v9 controlCenterApplyPrimaryContentShadow];
  }
}

uint64_t __65__MediaControlsExpandableButton_setSelectedOptionIndex_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSelectedOptionIndex:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

- (void)setSelectedOptionIndexWithValueChanged:(unint64_t)a3
{
  if (self->_selectedOptionIndex != a3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __72__MediaControlsExpandableButton_setSelectedOptionIndexWithValueChanged___block_invoke;
    v4[3] = &unk_1E5F0DBF8;
    v4[4] = self;
    v4[5] = a3;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v4 animations:0.25];
    [(MediaControlsExpandableButton *)self updateGlyphSelectionState];
    [(MediaControlsExpandableButton *)self sendActionsForControlEvents:4096];
  }
}

uint64_t __72__MediaControlsExpandableButton_setSelectedOptionIndexWithValueChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSelectedOptionIndex:*(void *)(a1 + 40)];
}

- (void)toggleSelectedOption
{
  [(MediaControlsExpandableButton *)self setSelectedOptionIndexWithValueChanged:self->_selectedOptionIndex == 0];
}

- (void)setContentVerticalAlignment:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)MediaControlsExpandableButton;
  [(MediaControlsExpandableButton *)&v13 setContentVerticalAlignment:a3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  double v4 = self->_buttons;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setContentVerticalAlignment:", -[MediaControlsExpandableButton contentVerticalAlignment](self, "contentVerticalAlignment", (void)v9));
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)setButtonImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  self->_buttonImageSize = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = self->_buttons;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "setAssetSize:", width, height, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [(MediaControlsExpandableButton *)self setNeedsLayout];
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3 && !self->_toggleEnabled)
  {
    BOOL v4 = a3;
    self->_expanded = a3;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__MediaControlsExpandableButton_setExpanded___block_invoke;
    v8[3] = &unk_1E5F0D7F8;
    v8[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v8];
    if ([MEMORY[0x1E4FB1EB0] _isInAnimationBlock])
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __45__MediaControlsExpandableButton_setExpanded___block_invoke_2;
      v6[3] = &unk_1E5F0D8C0;
      v6[4] = self;
      BOOL v7 = v4;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:96 delay:v6 options:0 animations:0.25 completion:0.0];
    }
    else
    {
      [(MediaControlsExpandableButton *)self _updateButtonsVisiblity];
      [(MediaControlsExpandableButton *)self updateVisualStyling];
      uint64_t v5 = [(MediaControlsExpandableButton *)self selectionView];
      [v5 setExpanded:v4];
    }
    [(MediaControlsExpandableButton *)self setNeedsLayout];
  }
}

uint64_t __45__MediaControlsExpandableButton_setExpanded___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetMessageAnimated:0];
}

void __45__MediaControlsExpandableButton_setExpanded___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateButtonsVisiblity];
  [*(id *)(a1 + 32) updateVisualStyling];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) selectionView];
  [v3 setExpanded:v2];
}

- (void)setHighlighted:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MediaControlsExpandableButton;
  [(MediaControlsExpandableButton *)&v5 setHighlighted:a3];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__MediaControlsExpandableButton_setHighlighted___block_invoke;
  v4[3] = &unk_1E5F0D7F8;
  v4[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v4 animations:0.15];
}

uint64_t __48__MediaControlsExpandableButton_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutSelectionView];
}

- (void)showMessage:(id)a3
{
  [(UILabel *)self->_messageLabel setText:a3];
  [(MediaControlsExpandableButton *)self _layoutLabels];
  [(NSTimer *)self->_messageTimer invalidate];
  BOOL v4 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_resetMessage selector:0 userInfo:0 repeats:2.25];
  messageTimer = self->_messageTimer;
  self->_messageTimer = v4;

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__MediaControlsExpandableButton_showMessage___block_invoke;
  v6[3] = &unk_1E5F0D7F8;
  v6[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v6 animations:0.25];
}

uint64_t __45__MediaControlsExpandableButton_showMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDisplayMessage:1];
}

- (void)setDisplayMessage:(BOOL)a3
{
  self->_displayMessage = a3;
  [(MediaControlsExpandableButton *)self _updateButtonsVisiblity];

  [(MediaControlsExpandableButton *)self updateVisualStyling];
}

- (void)playValueChangedEventHaptic
{
  if ([(MediaControlsExpandableButton *)self isTracking])
  {
    hapticPlayer = self->_hapticPlayer;
    [(MediaControlsHapticPlayer *)hapticPlayer expandedButtonChanged];
  }
}

- (void)playFailedValueChangedEventHaptic
{
}

- (void)playFailedValueChangedEventHapticWithMessage:(id)a3
{
  if (a3) {
    -[MediaControlsExpandableButton showMessage:](self, "showMessage:");
  }

  [(MediaControlsExpandableButton *)self playFailedValueChangedEventHaptic];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  BOOL v7 = [(MediaControlsExpandableButton *)self backgroundView];
  [v7 frame];
  v13.CGFloat x = x;
  v13.CGFloat y = y;
  if (CGRectContainsPoint(v17, v13))
  {
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v9 = [(MediaControlsExpandableButton *)self titleLabel];
    [v9 frame];
    v14.CGFloat x = x;
    v14.CGFloat y = y;
    if (CGRectContainsPoint(v18, v14))
    {
      BOOL v8 = 1;
    }
    else
    {
      uint64_t v10 = [(MediaControlsExpandableButton *)self subtitleLabel];
      [v10 frame];
      v15.CGFloat x = x;
      v15.CGFloat y = y;
      if (CGRectContainsPoint(v19, v15))
      {
        BOOL v8 = 1;
      }
      else
      {
        long long v11 = [(MediaControlsExpandableButton *)self subtitleIndicator];
        [v11 frame];
        v16.CGFloat x = x;
        v16.CGFloat y = y;
        BOOL v8 = CGRectContainsPoint(v20, v16);
      }
    }
  }
  return v8;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  if (self->_expanded)
  {
    [(MediaControlsHapticPlayer *)self->_hapticPlayer prepare];
  }
  else
  {
    BOOL v4 = [(MediaControlsExpandableButton *)self selectedButton];
    [v4 setHighlighted:1];
  }
  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  char v6 = [v5 _isPointerTouch];
  if ((v6 & 1) == 0 && self->_expanded)
  {
    int64_t axis = self->_axis;
    if (axis)
    {
      [(MRUExpandableButtonSelectionView *)self->_selectionView center];
      double v9 = v8;
      [v5 locationInView:self];
    }
    else
    {
      [v5 locationInView:self];
      double v9 = v11;
      [(MRUExpandableButtonSelectionView *)self->_selectionView center];
    }
    double v12 = v10;
    buttons = self->_buttons;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __69__MediaControlsExpandableButton_continueTrackingWithTouch_withEvent___block_invoke;
    v30[3] = &__block_descriptor_48_e41_B32__0__MediaControlsRoundButton_8Q16_B24l;
    *(double *)&v30[4] = v9;
    *(double *)&v30[5] = v10;
    uint64_t v14 = [(NSMutableArray *)buttons indexOfObjectPassingTest:v30];
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v15 = v14;
      selectedOptionIndeCGFloat x = self->_selectedOptionIndex;
      BOOL v17 = v14 != selectedOptionIndex;
      uint64_t v18 = [(NSMutableArray *)self->_buttons count];
      if ((selectedOptionIndex & (unint64_t)~(selectedOptionIndex >> 63)) >= v18 - 1) {
        uint64_t v19 = v18 - 1;
      }
      else {
        uint64_t v19 = selectedOptionIndex & ~(selectedOptionIndex >> 63);
      }
      CGRect v20 = [(NSMutableArray *)self->_buttons objectAtIndexedSubscript:v19];
      [v20 center];
      double v22 = v21;
      double v24 = v23;

      double v25 = v12 - v24;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __69__MediaControlsExpandableButton_continueTrackingWithTouch_withEvent___block_invoke_2;
      v27[3] = &unk_1E5F0F748;
      v27[4] = self;
      if (!axis) {
        double v25 = v9 - v22;
      }
      BOOL v28 = axis == 0;
      *(double *)&v27[5] = v25;
      BOOL v29 = v17;
      v27[6] = v15;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v27 animations:0.1];
      if (v15 != selectedOptionIndex) {
        [(MediaControlsExpandableButton *)self sendActionsForControlEvents:4096];
      }
    }
  }

  return v6 ^ 1;
}

uint64_t __69__MediaControlsExpandableButton_continueTrackingWithTouch_withEvent___block_invoke(CGPoint *a1, void *a2)
{
  id v3 = a2;
  [v3 frame];
  if (CGRectContainsPoint(v6, a1[2])) {
    uint64_t v4 = [v3 isEnabled];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __69__MediaControlsExpandableButton_continueTrackingWithTouch_withEvent___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    double v2 = 0.0;
    double v3 = *(double *)(a1 + 40) / 6.0;
  }
  else
  {
    double v3 = 0.0;
    double v2 = *(double *)(a1 + 40) / 6.0;
  }
  CGAffineTransformMakeTranslation(&v7, v3, v2);
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 536);
  CGAffineTransform v6 = v7;
  uint64_t result = [v4 setTransform:&v6];
  if (*(unsigned char *)(a1 + 57))
  {
    [*(id *)(a1 + 32) setSelectedOptionIndex:*(void *)(a1 + 48)];
    return [*(id *)(a1 + 32) updateGlyphSelectionState];
  }
  return result;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)MediaControlsExpandableButton;
  [(MediaControlsExpandableButton *)&v9 endTrackingWithTouch:v6 withEvent:v7];
  if (self->_expanded)
  {
    [(MediaControlsExpandableButton *)self _resetSelectionView];
    [(MediaControlsExpandableButton *)self sendActionsForControlEvents:0x40000];
    [(MediaControlsHapticPlayer *)self->_hapticPlayer tearDown];
  }
  else
  {
    double v8 = [(MediaControlsExpandableButton *)self selectedButton];
    [v8 setHighlighted:0];

    [v6 locationInView:self];
    if (-[MediaControlsExpandableButton pointInside:withEvent:](self, "pointInside:withEvent:", v7))
    {
      if (self->_toggleEnabled) {
        [(MediaControlsExpandableButton *)self toggleSelectedOption];
      }
      else {
        [(MediaControlsExpandableButton *)self sendActionsForControlEvents:64];
      }
    }
  }
}

- (void)cancelTrackingWithEvent:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MediaControlsExpandableButton;
  [(MediaControlsExpandableButton *)&v5 cancelTrackingWithEvent:a3];
  [(MediaControlsExpandableButton *)self _resetSelectionView];
  [(MediaControlsHapticPlayer *)self->_hapticPlayer tearDown];
  if (!self->_expanded)
  {
    uint64_t v4 = [(MediaControlsExpandableButton *)self selectedButton];
    [v4 setHighlighted:0];
  }
}

- (void)didTapButton:(id)a3
{
  uint64_t v4 = [(NSMutableArray *)self->_buttons indexOfObject:a3];
  if (self->_toggleEnabled)
  {
    [(MediaControlsExpandableButton *)self toggleSelectedOption];
  }
  else if (self->_expanded && self->_selectedOptionIndex != v4)
  {
    [(MediaControlsExpandableButton *)self setSelectedOptionIndexWithValueChanged:v4];
  }
  else
  {
    [(MediaControlsExpandableButton *)self sendActionsForControlEvents:64];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 view];
  if (v5 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || [v4 numberOfTouchesRequired] != 1)
  {

    goto LABEL_7;
  }
  uint64_t v6 = [v4 numberOfTapsRequired];

  if (v6 != 1)
  {
LABEL_7:
    BOOL v7 = 1;
    goto LABEL_8;
  }
  BOOL v7 = 0;
LABEL_8:

  return v7;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a4;
  buttons = self->_buttons;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __83__MediaControlsExpandableButton_pointerInteraction_regionForRequest_defaultRegion___block_invoke;
  v24[3] = &unk_1E5F0F770;
  id v8 = v6;
  id v25 = v8;
  uint64_t v9 = [(NSMutableArray *)buttons indexOfObjectPassingTest:v24];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v10 = v9, v9 == self->_selectedOptionIndex) && self->_expanded)
  {
    double v11 = 0;
  }
  else
  {
    double v12 = [(NSMutableArray *)self->_buttons objectAtIndexedSubscript:v9];
    [v12 assetFrame];
    -[MediaControlsExpandableButton convertRect:fromView:](self, "convertRect:fromView:", v12);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v21 = (void *)MEMORY[0x1E4FB1AD8];
    double v22 = [NSNumber numberWithInteger:v10];
    double v11 = objc_msgSend(v21, "regionWithRect:identifier:", v22, v14, v16, v18, v20);
  }

  return v11;
}

BOOL __83__MediaControlsExpandableButton_pointerInteraction_regionForRequest_defaultRegion___block_invoke(uint64_t a1, void *a2)
{
  [a2 frame];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  [*(id *)(a1 + 32) location];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v15 = v4;
  uint64_t v16 = v6;
  uint64_t v17 = v8;
  uint64_t v18 = v10;

  return CGRectContainsPoint(*(CGRect *)&v15, *(CGPoint *)&v12);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 identifier];
  uint64_t v7 = [v6 integerValue];

  if (self->_toggleEnabled || !self->_expanded)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4FB14C0];
    [v5 rect];
    uint64_t v9 = objc_msgSend(v8, "bezierPathWithOvalInRect:");
    id v10 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
    [v10 setShadowPath:v9];
    id v11 = (id)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self parameters:v10];
    uint64_t v12 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v11];
    uint64_t v13 = [MEMORY[0x1E4FB1AE0] shapeWithPath:v9];
    uint64_t v14 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v12 shape:v13];
LABEL_3:

    goto LABEL_4;
  }
  if (v7 != self->_selectedOptionIndex)
  {
    uint64_t v9 = [(NSMutableArray *)self->_buttons objectAtIndexedSubscript:v7];
    uint64_t v16 = (void *)MEMORY[0x1E4FB14C0];
    [v9 assetFrame];
    objc_msgSend(v16, "bezierPathWithOvalInRect:");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
    [v11 setShadowPath:v10];
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v9 parameters:v11];
    uint64_t v13 = [MEMORY[0x1E4FB1AB8] effectWithPreview:v12];
    uint64_t v17 = [MEMORY[0x1E4FB1AE0] shapeWithPath:v10];
    uint64_t v14 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v13 shape:v17];

    goto LABEL_3;
  }
  uint64_t v14 = 0;
LABEL_4:

  return v14;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
}

void __56__MediaControlsExpandableButton__updateButtonsVisiblity__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  id v5 = [*(id *)(*(void *)(a1 + 32) + 464) objectAtIndexedSubscript:a3];
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 456))
  {
    [v11 setUserInteractionEnabled:*(void *)(v6 + 472) != a3];
    [v11 setAlpha:1.0];
    [v11 setSelected:*(void *)(*(void *)(a1 + 32) + 472) == a3];
    [v11 setLabelHidden:*(unsigned __int8 *)(*(void *)(a1 + 32) + 458)];
    char v7 = [*(id *)(a1 + 32) isEnabled];
    uint64_t v8 = v5;
    if ((v7 & 1) == 0)
    {
      uint64_t v9 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    [v11 setUserInteractionEnabled:1];
    double v10 = 0.0;
    if (*(void *)(*(void *)(a1 + 32) + 472) == a3) {
      double v10 = 1.0;
    }
    [v11 setAlpha:v10];
    [v11 setSelected:*(void *)(*(void *)(a1 + 32) + 472) == a3];
    [v11 setLabelHidden:1];
    uint64_t v8 = *(void **)(a1 + 32);
  }
  uint64_t v9 = [v8 isEnabled];
LABEL_8:
  [v11 setEnabled:v9];
}

void __58__MediaControlsExpandableButton_updateGlyphSelectionState__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  id v5 = [*(id *)(*(void *)(a1 + 32) + 464) objectAtIndexedSubscript:a3];
  uint64_t v6 = v5;
  if (*(void *)(*(void *)(a1 + 32) + 472) == a3)
  {
    char v7 = [v5 selectedState];
    [v8 setGlyphState:v7];
  }
  else
  {
    [v8 setGlyphState:0];
  }
}

- (void)_resetSelectionView
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __52__MediaControlsExpandableButton__resetSelectionView__block_invoke;
  v2[3] = &unk_1E5F0D7F8;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E4FB1EB0], "mru_animateUsingType:animations:", 2, v2);
}

uint64_t __52__MediaControlsExpandableButton__resetSelectionView__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _layoutSelectionView];
  double v2 = *(void **)(*(void *)(a1 + 32) + 536);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v2 setTransform:v5];
}

- (void)resetMessage
{
}

- (void)resetMessageAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSTimer *)self->_messageTimer invalidate];
  messageTimer = self->_messageTimer;
  self->_messageTimer = 0;

  if (v3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__MediaControlsExpandableButton_resetMessageAnimated___block_invoke;
    v6[3] = &unk_1E5F0D7F8;
    v6[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v6 animations:0.25];
  }
  else
  {
    [(MediaControlsExpandableButton *)self setDisplayMessage:0];
  }
}

uint64_t __54__MediaControlsExpandableButton_resetMessageAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDisplayMessage:0];
}

- (void)updateContentSizeCategory
{
  objc_msgSend(MEMORY[0x1E4FB08E0], "mru_volumeButtonTitleFont");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "mru_volumeButtonSubtitleFont");
  [(UILabel *)self->_titleLabel setFont:v5];
  [(UILabel *)self->_subtitleLabel setFont:v3];
  [(UILabel *)self->_messageLabel setFont:v5];
  uint64_t v4 = [MEMORY[0x1E4FB1830] configurationWithFont:v3];
  [(UIImageView *)self->_subtitleIndicator setSymbolConfiguration:v4];

  [(MediaControlsExpandableButton *)self setNeedsLayout];
}

- (NSArray)options
{
  return self->_options;
}

- (int64_t)selectedOptionIndex
{
  return self->_selectedOptionIndex;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)disabledSubtitle
{
  return self->_disabledSubtitle;
}

- (int64_t)axis
{
  return self->_axis;
}

- (CGSize)maximumExpandedSize
{
  double width = self->_maximumExpandedSize.width;
  double height = self->_maximumExpandedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaximumExpandedSize:(CGSize)a3
{
  self->_maximumExpandedSize = a3;
}

- (CGSize)buttonImageSize
{
  double width = self->_buttonImageSize.width;
  double height = self->_buttonImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (NSMutableArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (MediaControlsHapticPlayer)hapticPlayer
{
  return self->_hapticPlayer;
}

- (void)setHapticPlayer:(id)a3
{
}

- (MRUExpandableButtonSelectionView)selectionView
{
  return self->_selectionView;
}

- (void)setSelectionView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UIImageView)subtitleIndicator
{
  return self->_subtitleIndicator;
}

- (void)setSubtitleIndicator:(id)a3
{
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (NSTimer)messageTimer
{
  return self->_messageTimer;
}

- (void)setMessageTimer:(id)a3
{
}

- (BOOL)toggleEnabled
{
  return self->_toggleEnabled;
}

- (void)setToggleEnabled:(BOOL)a3
{
  self->_toggleEnabled = a3;
}

- (BOOL)displayMessage
{
  return self->_displayMessage;
}

- (BOOL)isControlCenter
{
  return self->_isControlCenter;
}

- (void)setIsControlCenter:(BOOL)a3
{
  self->_isControlCenter = a3;
}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (void)setVisualStylingProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_messageTimer, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_subtitleIndicator, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_selectionView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_hapticPlayer, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_disabledSubtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

@end