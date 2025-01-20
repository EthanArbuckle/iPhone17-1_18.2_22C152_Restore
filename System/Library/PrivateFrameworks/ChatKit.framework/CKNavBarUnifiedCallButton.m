@interface CKNavBarUnifiedCallButton
- (BOOL)_isStyledForJoinableCall;
- (BOOL)_isStyledForJoinedCall;
- (BOOL)_shouldEnableAdjustFontSizeForCurrentStyle;
- (BOOL)isFaceTimeAudioAvailable;
- (BOOL)isFaceTimeVideoAvailable;
- (BOOL)isScreenSharingAvailable;
- (BOOL)isTelephonyAvailable;
- (BOOL)joinPillShouldDisableLabel;
- (BOOL)shouldUseJoinPillWithLabel;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKNavBarUnifiedCallButton)initWithFrame:(CGRect)a3;
- (CKNavBarUnifiedCallButtonDelegate)delegate;
- (NSArray)overrideAudioCallActions;
- (UIAction)faceTimeAudioAction;
- (UIAction)faceTimeInviteToShareTheirScreenAction;
- (UIAction)faceTimeJoinWithAudioAction;
- (UIAction)faceTimeJoinWithVideoAction;
- (UIAction)faceTimeShareMyScreenAction;
- (UIAction)faceTimeVideoAction;
- (UIAction)leaveJoinedCallAction;
- (UIAction)openJoinedCallAction;
- (UIAction)telephonyCallAction;
- (double)_bottomMarginForCurrentState;
- (double)_cornerRadiusForCurrentStyle;
- (double)_currentLabelPreferredWidth;
- (double)_imageToTextSpacingForCurrentState;
- (double)_leadingMarginForCurrentState;
- (double)_minimumFontScaleFactorForCurrentStyle;
- (double)_topMarginForCurrentState;
- (double)_trailingMarginForCurrentState;
- (id)_actionsForCurrentStyle;
- (id)_axLabelForCurrentStyle;
- (id)_backgroundColorForCurrentStyle;
- (id)_joinCallActions;
- (id)_startCallActions;
- (id)_startCallSubActions;
- (id)_subActionsForCurrentStyle;
- (id)_targetImageForCurrentFlags;
- (id)_tintColorForCurrentStyle;
- (id)_titleColorForCurrentStyle;
- (id)_titleForCurrentStyle;
- (id)_titleLabelFontForCurrentStyle;
- (int64_t)buttonStyle;
- (void)_configureActionsForCurrentState;
- (void)_configureFrameForCurrentState;
- (void)_configureInsetsForCurrentState;
- (void)_localeDidChange:(id)a3;
- (void)_updateForCurrentState;
- (void)layoutSubviews;
- (void)setButtonStyle:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setFaceTimeAudioAction:(id)a3;
- (void)setFaceTimeAudioAvailable:(BOOL)a3;
- (void)setFaceTimeInviteToShareTheirScreenAction:(id)a3;
- (void)setFaceTimeJoinWithAudioAction:(id)a3;
- (void)setFaceTimeJoinWithVideoAction:(id)a3;
- (void)setFaceTimeShareMyScreenAction:(id)a3;
- (void)setFaceTimeVideoAction:(id)a3;
- (void)setFaceTimeVideoAvailable:(BOOL)a3;
- (void)setJoinPillShouldDisableLabel:(BOOL)a3;
- (void)setLeaveJoinedCallAction:(id)a3;
- (void)setOpenJoinedCallAction:(id)a3;
- (void)setOverrideAudioCallActions:(id)a3;
- (void)setScreenSharingAvailable:(BOOL)a3;
- (void)setTelephonyCallAction:(id)a3;
- (void)setTelephonyCallAvailable:(BOOL)a3;
- (void)updateWithStyle:(int64_t)a3 availabilityForVideo:(BOOL)a4 audio:(BOOL)a5 telephony:(BOOL)a6 screenSharing:(BOOL)a7;
@end

@implementation CKNavBarUnifiedCallButton

- (CKNavBarUnifiedCallButton)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKNavBarUnifiedCallButton;
  v3 = -[CKNavBarUnifiedCallButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CKNavBarUnifiedCallButton *)v3 setButtonStyle:0];
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel__localeDidChange_ name:*MEMORY[0x1E4F1C370] object:0];
  }
  return v4;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)CKNavBarUnifiedCallButton;
  [(CKNavBarUnifiedCallButton *)&v14 layoutSubviews];
  [(CKNavBarUnifiedCallButton *)self _cornerRadiusForCurrentStyle];
  double v4 = v3;
  v5 = [(CKNavBarUnifiedCallButton *)self layer];
  [v5 setCornerRadius:v4];

  if ([(CKNavBarUnifiedCallButton *)self _isStyledForJoinableCall])
  {
    v6 = [(CKNavBarUnifiedCallButton *)self titleLabel];
    objc_super v7 = [v6 text];
    if ([v7 length])
    {
      BOOL v8 = [(CKNavBarUnifiedCallButton *)self joinPillShouldDisableLabel];

      if (!v8)
      {
        [(CKNavBarUnifiedCallButton *)self _currentLabelPreferredWidth];
        double v10 = v9;
        v11 = [(CKNavBarUnifiedCallButton *)self titleLabel];
        [v11 bounds];
        double v13 = ceil(v12);

        if (v10 > v13) {
          [(CKNavBarUnifiedCallButton *)self setJoinPillShouldDisableLabel:1];
        }
      }
    }
    else
    {
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKNavBarUnifiedCallButton;
  -[CKNavBarUnifiedCallButton sizeThatFits:](&v6, sel_sizeThatFits_, a3.width, a3.height);
  double v5 = fmin(v4, 80.0);
  result.height = v3;
  result.width = v5;
  return result;
}

- (void)updateWithStyle:(int64_t)a3 availabilityForVideo:(BOOL)a4 audio:(BOOL)a5 telephony:(BOOL)a6 screenSharing:(BOOL)a7
{
  BOOL v8 = self->_buttonStyle != a3
    || self->_faceTimeVideoAvailable != a4
    || self->_faceTimeAudioAvailable != a5
    || self->_telephonyCallAvailable != a6
    || self->_screenSharingAvailable != a7;
  self->_buttonStyle = a3;
  self->_faceTimeVideoAvailable = a4;
  self->_faceTimeAudioAvailable = a5;
  self->_telephonyCallAvailable = a6;
  self->_screenSharingAvailable = a7;
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  if (v8)
  {
    [(CKNavBarUnifiedCallButton *)self _updateForCurrentState];
  }
}

- (void)setOverrideAudioCallActions:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToArray:self->_overrideAudioCallActions] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_overrideAudioCallActions, a3);
    [(CKNavBarUnifiedCallButton *)self _configureActionsForCurrentState];
  }
}

- (void)_localeDidChange:(id)a3
{
}

- (double)_currentLabelPreferredWidth
{
  v21[1] = *MEMORY[0x1E4F143B8];
  double v3 = [(CKNavBarUnifiedCallButton *)self titleLabel];
  double v4 = [v3 text];
  uint64_t v5 = [v4 length];

  if (!v5) {
    return 0.0;
  }
  objc_super v6 = CKFrameworkBundle();
  objc_super v7 = [v6 localizedStringForKey:@"JOIN" value:&stru_1EDE4CA38 table:@"ChatKit"];

  BOOL v8 = [(CKNavBarUnifiedCallButton *)self titleLabel];
  double v9 = [v8 font];

  [v9 pointSize];
  double v11 = v10;
  double v12 = [(CKNavBarUnifiedCallButton *)self titleLabel];
  [v12 _actualScaleFactor];
  double v14 = round(v11 * v13 * 4.0) * 0.25;

  uint64_t v20 = *MEMORY[0x1E4FB06F8];
  v15 = [v9 fontWithSize:v14];
  v21[0] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];

  [v7 sizeWithAttributes:v16];
  double v18 = ceil(v17);

  return v18;
}

- (void)setJoinPillShouldDisableLabel:(BOOL)a3
{
  if (self->_joinPillShouldDisableLabel != a3)
  {
    self->_joinPillShouldDisableLabel = a3;
    [(CKNavBarUnifiedCallButton *)self _updateForCurrentState];
    [(CKNavBarUnifiedCallButton *)self layoutIfNeeded];
    id v4 = [(CKNavBarUnifiedCallButton *)self delegate];
    [v4 buttonWidthDidChange:self];
  }
}

- (void)_updateForCurrentState
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __51__CKNavBarUnifiedCallButton__updateForCurrentState__block_invoke;
  v2[3] = &unk_1E5620C40;
  v2[4] = self;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v2];
}

void __51__CKNavBarUnifiedCallButton__updateForCurrentState__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _axLabelForCurrentStyle];
  [*(id *)(a1 + 32) setAccessibilityLabel:v2];

  objc_msgSend(*(id *)(a1 + 32), "imageForState:", objc_msgSend(*(id *)(a1 + 32), "state"));
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [*(id *)(a1 + 32) _targetImageForCurrentFlags];
  if (v20 != v3) {
    objc_msgSend(*(id *)(a1 + 32), "setImage:forState:", v3, objc_msgSend(*(id *)(a1 + 32), "state"));
  }
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 _tintColorForCurrentStyle];
  [v4 setTintColor:v5];

  objc_super v6 = *(void **)(a1 + 32);
  objc_super v7 = [v6 _backgroundColorForCurrentStyle];
  [v6 setBackgroundColor:v7];

  BOOL v8 = *(void **)(a1 + 32);
  double v9 = [v8 _titleForCurrentStyle];
  [v8 setTitle:v9 forState:0];

  double v10 = *(void **)(a1 + 32);
  double v11 = [v10 _titleColorForCurrentStyle];
  [v10 setTitleColor:v11 forState:0];

  double v12 = [*(id *)(a1 + 32) titleLabel];
  double v13 = [*(id *)(a1 + 32) _titleLabelFontForCurrentStyle];
  [v12 setFont:v13];

  double v14 = [*(id *)(a1 + 32) titleLabel];
  [v14 setAdjustsFontForContentSizeCategory:0];

  uint64_t v15 = [*(id *)(a1 + 32) _shouldEnableAdjustFontSizeForCurrentStyle];
  v16 = [*(id *)(a1 + 32) titleLabel];
  [v16 setAdjustsFontSizeToFitWidth:v15];

  [*(id *)(a1 + 32) _minimumFontScaleFactorForCurrentStyle];
  double v18 = v17;
  v19 = [*(id *)(a1 + 32) titleLabel];
  [v19 setMinimumScaleFactor:v18];

  [*(id *)(a1 + 32) _configureActionsForCurrentState];
  [*(id *)(a1 + 32) _configureInsetsForCurrentState];
  [*(id *)(a1 + 32) _configureFrameForCurrentState];
  [*(id *)(a1 + 32) setNeedsLayout];
}

- (BOOL)shouldUseJoinPillWithLabel
{
  BOOL v3 = [(CKNavBarUnifiedCallButton *)self _isStyledForJoinableCall];
  if (v3) {
    LOBYTE(v3) = ![(CKNavBarUnifiedCallButton *)self joinPillShouldDisableLabel];
  }
  return v3;
}

- (void)_configureActionsForCurrentState
{
  id v13 = [(CKNavBarUnifiedCallButton *)self _actionsForCurrentStyle];
  BOOL v3 = [(CKNavBarUnifiedCallButton *)self _subActionsForCurrentStyle];
  if ([(CKNavBarUnifiedCallButton *)self _isStyledForJoinableCall]
    || [(CKNavBarUnifiedCallButton *)self _isStyledForJoinedCall])
  {
    id v4 = [(CKNavBarUnifiedCallButton *)self openJoinedCallAction];
    [(CKNavBarUnifiedCallButton *)self addAction:v4 forControlEvents:64];

    [(CKNavBarUnifiedCallButton *)self setMenu:0];
    [(CKNavBarUnifiedCallButton *)self setShowsMenuAsPrimaryAction:0];
    uint64_t v5 = self;
    uint64_t v6 = 1;
LABEL_4:
    [(CKNavBarUnifiedCallButton *)v5 setUserInteractionEnabled:v6];
    goto LABEL_5;
  }
  if (![v13 count])
  {
    BOOL v8 = [(CKNavBarUnifiedCallButton *)self openJoinedCallAction];
    [(CKNavBarUnifiedCallButton *)self removeAction:v8 forControlEvents:64];

    [(CKNavBarUnifiedCallButton *)self setMenu:0];
    [(CKNavBarUnifiedCallButton *)self setShowsMenuAsPrimaryAction:0];
    uint64_t v5 = self;
    uint64_t v6 = 0;
    goto LABEL_4;
  }
  if (v3)
  {
    objc_super v7 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v3];
  }
  else
  {
    objc_super v7 = 0;
  }
  double v9 = [MEMORY[0x1E4F1CA48] arrayWithArray:v13];
  double v10 = v9;
  if (v7) {
    [v9 addObject:v7];
  }
  double v11 = [(CKNavBarUnifiedCallButton *)self openJoinedCallAction];
  [(CKNavBarUnifiedCallButton *)self removeAction:v11 forControlEvents:64];

  double v12 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v10];
  [(CKNavBarUnifiedCallButton *)self setMenu:v12];

  [(CKNavBarUnifiedCallButton *)self setShowsMenuAsPrimaryAction:1];
  [(CKNavBarUnifiedCallButton *)self setUserInteractionEnabled:1];

LABEL_5:
}

- (void)_configureInsetsForCurrentState
{
  BOOL v3 = [(CKNavBarUnifiedCallButton *)self traitCollection];
  uint64_t v4 = [v3 layoutDirection];

  [(CKNavBarUnifiedCallButton *)self _topMarginForCurrentState];
  double v6 = v5;
  [(CKNavBarUnifiedCallButton *)self _leadingMarginForCurrentState];
  double v8 = v7;
  [(CKNavBarUnifiedCallButton *)self _bottomMarginForCurrentState];
  double v10 = v9;
  [(CKNavBarUnifiedCallButton *)self _trailingMarginForCurrentState];
  double v12 = v11;
  [(CKNavBarUnifiedCallButton *)self _imageToTextSpacingForCurrentState];
  double v14 = v12 + v13;
  double v15 = -v13;
  if (v4 == 1) {
    double v16 = -v13;
  }
  else {
    double v16 = v13;
  }
  if (v4 == 1)
  {
    double v15 = v13;
    double v17 = v12 + v13;
  }
  else
  {
    double v17 = v8;
  }
  if (v4 != 1) {
    double v8 = v14;
  }
  -[CKNavBarUnifiedCallButton setTitleEdgeInsets:](self, "setTitleEdgeInsets:", 0.0, v16, 0.0, v15);

  -[CKNavBarUnifiedCallButton setContentEdgeInsets:](self, "setContentEdgeInsets:", v6, v17, v10, v8);
}

- (BOOL)_isStyledForJoinedCall
{
  unint64_t v2 = [(CKNavBarUnifiedCallButton *)self buttonStyle];
  return (v2 < 7) & (0x54u >> v2);
}

- (BOOL)_isStyledForJoinableCall
{
  unint64_t v2 = [(CKNavBarUnifiedCallButton *)self buttonStyle];
  return (v2 < 6) & v2;
}

- (void)_configureFrameForCurrentState
{
  [(CKNavBarUnifiedCallButton *)self buttonStyle];

  [(CKNavBarUnifiedCallButton *)self sizeToFit];
}

- (double)_cornerRadiusForCurrentStyle
{
  unint64_t v3 = [(CKNavBarUnifiedCallButton *)self buttonStyle];
  if (v3 > 5
    || ((1 << v3) & 0x2A) == 0
    || [(CKNavBarUnifiedCallButton *)self joinPillShouldDisableLabel])
  {
    return 0.0;
  }
  [(CKNavBarUnifiedCallButton *)self frame];
  double v5 = [(CKNavBarUnifiedCallButton *)self traitCollection];
  [v5 displayScale];
  UIRoundToScale();
  double v7 = v6;

  return v7;
}

- (double)_topMarginForCurrentState
{
  return 0.0;
}

- (double)_leadingMarginForCurrentState
{
  unint64_t v3 = [(CKNavBarUnifiedCallButton *)self buttonStyle];
  double result = 0.0;
  if (v3 <= 5 && ((1 << v3) & 0x2A) != 0)
  {
    BOOL v5 = [(CKNavBarUnifiedCallButton *)self joinPillShouldDisableLabel];
    double result = 10.0;
    if (v5) {
      return 0.0;
    }
  }
  return result;
}

- (double)_bottomMarginForCurrentState
{
  return 0.0;
}

- (double)_trailingMarginForCurrentState
{
  unint64_t v3 = [(CKNavBarUnifiedCallButton *)self buttonStyle];
  double result = 0.0;
  if (v3 <= 5 && ((1 << v3) & 0x2A) != 0)
  {
    BOOL v5 = [(CKNavBarUnifiedCallButton *)self joinPillShouldDisableLabel];
    double result = 10.0;
    if (v5) {
      return 0.0;
    }
  }
  return result;
}

- (double)_imageToTextSpacingForCurrentState
{
  unint64_t v3 = [(CKNavBarUnifiedCallButton *)self buttonStyle];
  double result = 0.0;
  if (v3 <= 5 && ((1 << v3) & 0x2A) != 0)
  {
    BOOL v5 = [(CKNavBarUnifiedCallButton *)self joinPillShouldDisableLabel];
    double result = 5.0;
    if (v5) {
      return 0.0;
    }
  }
  return result;
}

- (id)_axLabelForCurrentStyle
{
  unint64_t v2 = [(CKNavBarUnifiedCallButton *)self buttonStyle];
  if (v2 <= 5 && ((1 << v2) & 0x2A) != 0)
  {
    unint64_t v3 = CKFrameworkBundle();
    uint64_t v4 = v3;
    BOOL v5 = @"JOIN";
  }
  else
  {
    unint64_t v3 = CKFrameworkBundle();
    uint64_t v4 = v3;
    BOOL v5 = @"FACE_TIME_DEFAULT";
  }
  double v6 = [v3 localizedStringForKey:v5 value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v6;
}

- (id)_titleForCurrentStyle
{
  unint64_t v3 = [(CKNavBarUnifiedCallButton *)self buttonStyle];
  uint64_t v4 = &stru_1EDE4CA38;
  if (v3 <= 5 && ((1 << v3) & 0x2A) != 0)
  {
    if ([(CKNavBarUnifiedCallButton *)self joinPillShouldDisableLabel])
    {
      uint64_t v4 = 0;
    }
    else
    {
      BOOL v5 = CKFrameworkBundle();
      uint64_t v4 = [v5 localizedStringForKey:@"JOIN" value:&stru_1EDE4CA38 table:@"ChatKit"];
    }
  }

  return v4;
}

- (id)_titleLabelFontForCurrentStyle
{
  unint64_t v3 = [(CKNavBarUnifiedCallButton *)self buttonStyle];
  uint64_t v4 = 0;
  if (v3 <= 5 && ((1 << v3) & 0x2A) != 0)
  {
    if ([(CKNavBarUnifiedCallButton *)self joinPillShouldDisableLabel])
    {
      uint64_t v4 = 0;
    }
    else
    {
      BOOL v5 = +[CKUIBehavior sharedBehaviors];
      uint64_t v4 = [v5 navBarUnifiedCallButtonJoinTextFont];
    }
  }

  return v4;
}

- (BOOL)_shouldEnableAdjustFontSizeForCurrentStyle
{
  unint64_t v2 = [(CKNavBarUnifiedCallButton *)self buttonStyle];
  return (v2 < 6) & v2;
}

- (double)_minimumFontScaleFactorForCurrentStyle
{
  int64_t v2 = [(CKNavBarUnifiedCallButton *)self buttonStyle];
  double result = 0.0;
  if ((unint64_t)(v2 - 1) <= 4) {
    return dbl_18F81CB90[v2 - 1];
  }
  return result;
}

- (id)_tintColorForCurrentStyle
{
  unint64_t v3 = [(CKNavBarUnifiedCallButton *)self buttonStyle];
  uint64_t v4 = 0;
  if (v3 <= 6)
  {
    if (((1 << v3) & 0x2A) == 0)
    {
      if (((1 << v3) & 0x54) == 0) {
        goto LABEL_8;
      }
      BOOL v5 = (void *)MEMORY[0x1E4F428B8];
      goto LABEL_6;
    }
    BOOL v6 = [(CKNavBarUnifiedCallButton *)self joinPillShouldDisableLabel];
    BOOL v5 = (void *)MEMORY[0x1E4F428B8];
    if (v6)
    {
LABEL_6:
      uint64_t v4 = [v5 ckColorNamed:@"CKSystemGreenColor"];
      goto LABEL_8;
    }
    uint64_t v4 = [MEMORY[0x1E4F428B8] whiteColor];
  }
LABEL_8:

  return v4;
}

- (id)_titleColorForCurrentStyle
{
  unint64_t v3 = [(CKNavBarUnifiedCallButton *)self buttonStyle];
  uint64_t v4 = 0;
  if (v3 <= 5 && ((1 << v3) & 0x2A) != 0)
  {
    if ([(CKNavBarUnifiedCallButton *)self joinPillShouldDisableLabel])
    {
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v4 = [MEMORY[0x1E4F428B8] whiteColor];
    }
  }

  return v4;
}

- (id)_backgroundColorForCurrentStyle
{
  unint64_t v3 = [(CKNavBarUnifiedCallButton *)self buttonStyle];
  uint64_t v4 = 0;
  if (v3 <= 5 && ((1 << v3) & 0x2A) != 0)
  {
    if ([(CKNavBarUnifiedCallButton *)self joinPillShouldDisableLabel])
    {
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v4 = [MEMORY[0x1E4F428B8] ckColorNamed:@"CKSystemGreenColor"];
    }
  }

  return v4;
}

- (id)_targetImageForCurrentFlags
{
  switch([(CKNavBarUnifiedCallButton *)self buttonStyle])
  {
    case 1:
      BOOL v3 = [(CKNavBarUnifiedCallButton *)self joinPillShouldDisableLabel];
      uint64_t v4 = +[CKUIBehavior sharedBehaviors];
      BOOL v5 = v4;
      if (v3) {
        goto LABEL_11;
      }
      uint64_t v6 = [v4 navbarJoinPillVideoImage];
      break;
    case 2:
      BOOL v5 = +[CKUIBehavior sharedBehaviors];
      uint64_t v6 = [v5 navBarVideoFillImage];
      break;
    case 3:
      BOOL v7 = [(CKNavBarUnifiedCallButton *)self joinPillShouldDisableLabel];
      double v8 = +[CKUIBehavior sharedBehaviors];
      BOOL v5 = v8;
      if (v7) {
        goto LABEL_14;
      }
      uint64_t v6 = [v8 navbarJoinPillAudioImage];
      break;
    case 4:
      BOOL v5 = +[CKUIBehavior sharedBehaviors];
      uint64_t v6 = [v5 navBarAudioFillImage];
      break;
    case 5:
      BOOL v9 = [(CKNavBarUnifiedCallButton *)self joinPillShouldDisableLabel];
      double v10 = +[CKUIBehavior sharedBehaviors];
      BOOL v5 = v10;
      if (v9) {
        goto LABEL_13;
      }
      uint64_t v6 = [v10 navbarJoinPillSharePlayImage];
      break;
    case 6:
      double v10 = +[CKUIBehavior sharedBehaviors];
      BOOL v5 = v10;
LABEL_13:
      uint64_t v6 = [v10 navBarSharePlayImage];
      break;
    default:
      BOOL v11 = [(CKNavBarUnifiedCallButton *)self isFaceTimeVideoAvailable];
      BOOL v5 = +[CKUIBehavior sharedBehaviors];
      if (v11)
      {
LABEL_11:
        uint64_t v6 = [v5 navBarVideoImage];
      }
      else
      {
LABEL_14:
        uint64_t v6 = [v5 navBarAudioImage];
      }
      break;
  }
  double v12 = (void *)v6;

  return v12;
}

- (id)_actionsForCurrentStyle
{
  unint64_t v3 = [(CKNavBarUnifiedCallButton *)self buttonStyle];
  if (v3 <= 5 && ((1 << v3) & 0x2A) != 0)
  {
    uint64_t v4 = [(CKNavBarUnifiedCallButton *)self _joinCallActions];
  }
  else
  {
    uint64_t v4 = [(CKNavBarUnifiedCallButton *)self _startCallActions];
  }

  return v4;
}

- (id)_subActionsForCurrentStyle
{
  if ([(CKNavBarUnifiedCallButton *)self buttonStyle])
  {
    unint64_t v3 = 0;
  }
  else
  {
    unint64_t v3 = [(CKNavBarUnifiedCallButton *)self _startCallSubActions];
  }

  return v3;
}

- (id)_startCallActions
{
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(CKNavBarUnifiedCallButton *)self overrideAudioCallActions];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = [(CKNavBarUnifiedCallButton *)self overrideAudioCallActions];
    [v3 addObjectsFromArray:v6];
LABEL_7:

    goto LABEL_8;
  }
  if ([(CKNavBarUnifiedCallButton *)self isFaceTimeAudioAvailable])
  {
    BOOL v7 = [(CKNavBarUnifiedCallButton *)self faceTimeAudioAction];
    [v3 addObject:v7];
  }
  if ([(CKNavBarUnifiedCallButton *)self isTelephonyAvailable])
  {
    uint64_t v6 = [(CKNavBarUnifiedCallButton *)self telephonyCallAction];
    [v3 addObject:v6];
    goto LABEL_7;
  }
LABEL_8:
  if ([(CKNavBarUnifiedCallButton *)self isFaceTimeVideoAvailable])
  {
    double v8 = [(CKNavBarUnifiedCallButton *)self faceTimeVideoAction];
    [v3 addObject:v8];
  }
  BOOL v9 = (void *)[v3 copy];

  return v9;
}

- (id)_startCallSubActions
{
  v7[2] = *MEMORY[0x1E4F143B8];
  if ([(CKNavBarUnifiedCallButton *)self isScreenSharingAvailable])
  {
    unint64_t v3 = [(CKNavBarUnifiedCallButton *)self faceTimeShareMyScreenAction];
    v7[0] = v3;
    uint64_t v4 = [(CKNavBarUnifiedCallButton *)self faceTimeInviteToShareTheirScreenAction];
    v7[1] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_joinCallActions
{
  return 0;
}

- (UIAction)faceTimeVideoAction
{
  id location = 0;
  objc_initWeak(&location, self);
  faceTimeVideoAction = self->_faceTimeVideoAction;
  if (!faceTimeVideoAction)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F426E8];
    uint64_t v5 = CKFrameworkBundle();
    uint64_t v6 = [v5 localizedStringForKey:@"FACETIME_VIDEO" value:&stru_1EDE4CA38 table:@"ChatKit"];
    BOOL v7 = +[CKUIBehavior sharedBehaviors];
    double v8 = [v7 navBarVideoImage];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __48__CKNavBarUnifiedCallButton_faceTimeVideoAction__block_invoke;
    v13[3] = &unk_1E5620ED8;
    objc_copyWeak(&v14, &location);
    BOOL v9 = [v4 actionWithTitle:v6 image:v8 identifier:@"CKNavBarUnifiedButtonViewUIActionIdentifierFaceTimeVideo" handler:v13];
    double v10 = self->_faceTimeVideoAction;
    self->_faceTimeVideoAction = v9;

    objc_destroyWeak(&v14);
    faceTimeVideoAction = self->_faceTimeVideoAction;
  }
  BOOL v11 = faceTimeVideoAction;
  objc_destroyWeak(&location);

  return v11;
}

void __48__CKNavBarUnifiedCallButton_faceTimeVideoAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    int64_t v2 = [WeakRetained delegate];
    [v2 buttonRequestsStartFaceTimeVideo:v3];

    id WeakRetained = v3;
  }
}

- (UIAction)faceTimeJoinWithVideoAction
{
  id location = 0;
  objc_initWeak(&location, self);
  faceTimeJoinWithVideoAction = self->_faceTimeJoinWithVideoAction;
  if (!faceTimeJoinWithVideoAction)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F426E8];
    uint64_t v5 = CKFrameworkBundle();
    uint64_t v6 = [v5 localizedStringForKey:@"FACETIME_VIDEO" value:&stru_1EDE4CA38 table:@"ChatKit"];
    BOOL v7 = +[CKUIBehavior sharedBehaviors];
    double v8 = [v7 navBarVideoImage];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__CKNavBarUnifiedCallButton_faceTimeJoinWithVideoAction__block_invoke;
    v13[3] = &unk_1E5620ED8;
    objc_copyWeak(&v14, &location);
    BOOL v9 = [v4 actionWithTitle:v6 image:v8 identifier:@"CKNavBarUnifiedButtonViewUIActionIdentifierFaceTimeJoinWithVideo" handler:v13];
    double v10 = self->_faceTimeJoinWithVideoAction;
    self->_faceTimeJoinWithVideoAction = v9;

    objc_destroyWeak(&v14);
    faceTimeJoinWithVideoAction = self->_faceTimeJoinWithVideoAction;
  }
  BOOL v11 = faceTimeJoinWithVideoAction;
  objc_destroyWeak(&location);

  return v11;
}

void __56__CKNavBarUnifiedCallButton_faceTimeJoinWithVideoAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    int64_t v2 = [WeakRetained delegate];
    [v2 button:v3 requestsJoinActiveCallWithVideoEnabled:1];

    id WeakRetained = v3;
  }
}

- (UIAction)faceTimeAudioAction
{
  id location = 0;
  objc_initWeak(&location, self);
  faceTimeAudioAction = self->_faceTimeAudioAction;
  if (!faceTimeAudioAction)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F426E8];
    uint64_t v5 = CKFrameworkBundle();
    uint64_t v6 = [v5 localizedStringForKey:@"FACETIME_AUDIO" value:&stru_1EDE4CA38 table:@"ChatKit"];
    BOOL v7 = +[CKUIBehavior sharedBehaviors];
    double v8 = [v7 navBarAudioImage];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __48__CKNavBarUnifiedCallButton_faceTimeAudioAction__block_invoke;
    v13[3] = &unk_1E5620ED8;
    objc_copyWeak(&v14, &location);
    BOOL v9 = [v4 actionWithTitle:v6 image:v8 identifier:@"CKNavBarUnifiedButtonViewUIActionIdentifierFaceTimeAudio" handler:v13];
    double v10 = self->_faceTimeAudioAction;
    self->_faceTimeAudioAction = v9;

    objc_destroyWeak(&v14);
    faceTimeAudioAction = self->_faceTimeAudioAction;
  }
  BOOL v11 = faceTimeAudioAction;
  objc_destroyWeak(&location);

  return v11;
}

void __48__CKNavBarUnifiedCallButton_faceTimeAudioAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    int64_t v2 = [WeakRetained delegate];
    [v2 buttonRequestsStartFaceTimeAudio:v3];

    id WeakRetained = v3;
  }
}

- (UIAction)faceTimeJoinWithAudioAction
{
  id location = 0;
  objc_initWeak(&location, self);
  faceTimeJoinWithAudioAction = self->_faceTimeJoinWithAudioAction;
  if (!faceTimeJoinWithAudioAction)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F426E8];
    uint64_t v5 = CKFrameworkBundle();
    uint64_t v6 = [v5 localizedStringForKey:@"FACETIME_AUDIO" value:&stru_1EDE4CA38 table:@"ChatKit"];
    BOOL v7 = +[CKUIBehavior sharedBehaviors];
    double v8 = [v7 navBarAudioImage];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__CKNavBarUnifiedCallButton_faceTimeJoinWithAudioAction__block_invoke;
    v13[3] = &unk_1E5620ED8;
    objc_copyWeak(&v14, &location);
    BOOL v9 = [v4 actionWithTitle:v6 image:v8 identifier:@"CKNavBarUnifiedButtonViewUIActionIdentifierFaceTimeJoinWithAudio" handler:v13];
    double v10 = self->_faceTimeJoinWithAudioAction;
    self->_faceTimeJoinWithAudioAction = v9;

    objc_destroyWeak(&v14);
    faceTimeJoinWithAudioAction = self->_faceTimeJoinWithAudioAction;
  }
  BOOL v11 = faceTimeJoinWithAudioAction;
  objc_destroyWeak(&location);

  return v11;
}

void __56__CKNavBarUnifiedCallButton_faceTimeJoinWithAudioAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    int64_t v2 = [WeakRetained delegate];
    [v2 button:v3 requestsJoinActiveCallWithVideoEnabled:0];

    id WeakRetained = v3;
  }
}

- (UIAction)faceTimeShareMyScreenAction
{
  id location = 0;
  objc_initWeak(&location, self);
  faceTimeShareMyScreenAction = self->_faceTimeShareMyScreenAction;
  if (!faceTimeShareMyScreenAction)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F426E8];
    uint64_t v5 = CKFrameworkBundle();
    uint64_t v6 = [v5 localizedStringForKey:@"INVITE_TO_SHARE_MY_SCREEN" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__CKNavBarUnifiedCallButton_faceTimeShareMyScreenAction__block_invoke;
    v11[3] = &unk_1E5620ED8;
    objc_copyWeak(&v12, &location);
    BOOL v7 = [v4 actionWithTitle:v6 image:0 identifier:0 handler:v11];
    double v8 = self->_faceTimeShareMyScreenAction;
    self->_faceTimeShareMyScreenAction = v7;

    objc_destroyWeak(&v12);
    faceTimeShareMyScreenAction = self->_faceTimeShareMyScreenAction;
  }
  BOOL v9 = faceTimeShareMyScreenAction;
  objc_destroyWeak(&location);

  return v9;
}

void __56__CKNavBarUnifiedCallButton_faceTimeShareMyScreenAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    int64_t v2 = [WeakRetained delegate];
    [v2 button:v3 requestsStartFaceTimeWithScreenShareType:1];

    id WeakRetained = v3;
  }
}

- (UIAction)faceTimeInviteToShareTheirScreenAction
{
  id location = 0;
  objc_initWeak(&location, self);
  faceTimeInviteToShareTheirScreenAction = self->_faceTimeInviteToShareTheirScreenAction;
  if (!faceTimeInviteToShareTheirScreenAction)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F426E8];
    uint64_t v5 = CKFrameworkBundle();
    uint64_t v6 = [v5 localizedStringForKey:@"ASK_TO_SHARE_THEIR_SCREEN" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__CKNavBarUnifiedCallButton_faceTimeInviteToShareTheirScreenAction__block_invoke;
    v11[3] = &unk_1E5620ED8;
    objc_copyWeak(&v12, &location);
    BOOL v7 = [v4 actionWithTitle:v6 image:0 identifier:0 handler:v11];
    double v8 = self->_faceTimeInviteToShareTheirScreenAction;
    self->_faceTimeInviteToShareTheirScreenAction = v7;

    objc_destroyWeak(&v12);
    faceTimeInviteToShareTheirScreenAction = self->_faceTimeInviteToShareTheirScreenAction;
  }
  BOOL v9 = faceTimeInviteToShareTheirScreenAction;
  objc_destroyWeak(&location);

  return v9;
}

void __67__CKNavBarUnifiedCallButton_faceTimeInviteToShareTheirScreenAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    int64_t v2 = [WeakRetained delegate];
    [v2 button:v3 requestsStartFaceTimeWithScreenShareType:2];

    id WeakRetained = v3;
  }
}

- (UIAction)telephonyCallAction
{
  id location = 0;
  objc_initWeak(&location, self);
  telephonyCallAction = self->_telephonyCallAction;
  if (!telephonyCallAction)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F426E8];
    uint64_t v5 = CKFrameworkBundle();
    uint64_t v6 = [v5 localizedStringForKey:@"CALL" value:&stru_1EDE4CA38 table:@"ChatKit"];
    BOOL v7 = +[CKUIBehavior sharedBehaviors];
    double v8 = [v7 navBarAudioImage];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __48__CKNavBarUnifiedCallButton_telephonyCallAction__block_invoke;
    v13[3] = &unk_1E5620ED8;
    objc_copyWeak(&v14, &location);
    BOOL v9 = [v4 actionWithTitle:v6 image:v8 identifier:@"CKNavBarUnifiedButtonViewUIActionIdentifierTelephonyCall" handler:v13];
    double v10 = self->_telephonyCallAction;
    self->_telephonyCallAction = v9;

    objc_destroyWeak(&v14);
    telephonyCallAction = self->_telephonyCallAction;
  }
  BOOL v11 = telephonyCallAction;
  objc_destroyWeak(&location);

  return v11;
}

void __48__CKNavBarUnifiedCallButton_telephonyCallAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    int64_t v2 = [WeakRetained delegate];
    [v2 buttonRequestsStartTelephonyCall:v3];

    id WeakRetained = v3;
  }
}

- (UIAction)openJoinedCallAction
{
  id location = 0;
  objc_initWeak(&location, self);
  openJoinedCallAction = self->_openJoinedCallAction;
  if (!openJoinedCallAction)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F426E8];
    uint64_t v5 = CKFrameworkBundle();
    uint64_t v6 = [v5 localizedStringForKey:@"JOIN" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49__CKNavBarUnifiedCallButton_openJoinedCallAction__block_invoke;
    v11[3] = &unk_1E5620ED8;
    objc_copyWeak(&v12, &location);
    BOOL v7 = [v4 actionWithTitle:v6 image:0 identifier:@"CKNavBarUnifiedButtonViewUIActionIdentifierOpenJoinedCall" handler:v11];
    double v8 = self->_openJoinedCallAction;
    self->_openJoinedCallAction = v7;

    objc_destroyWeak(&v12);
    openJoinedCallAction = self->_openJoinedCallAction;
  }
  BOOL v9 = openJoinedCallAction;
  objc_destroyWeak(&location);

  return v9;
}

void __49__CKNavBarUnifiedCallButton_openJoinedCallAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    int64_t v2 = [WeakRetained delegate];
    [v2 buttonRequestsOpenJoinedCall:v3];

    id WeakRetained = v3;
  }
}

- (UIAction)leaveJoinedCallAction
{
  leaveJoinedCallAction = self->_leaveJoinedCallAction;
  if (!leaveJoinedCallAction)
  {
    id location = 0;
    objc_initWeak(&location, self);
    int64_t v4 = [(CKNavBarUnifiedCallButton *)self buttonStyle];
    uint64_t v5 = @"LEAVE_CONVERSATION_SHORT";
    if (v4 == 4) {
      uint64_t v5 = @"END_CALL";
    }
    uint64_t v6 = v5;
    BOOL v7 = (void *)MEMORY[0x1E4F426E8];
    double v8 = CKFrameworkBundle();
    BOOL v9 = [v8 localizedStringForKey:v6 value:&stru_1EDE4CA38 table:@"ChatKit"];
    double v10 = [MEMORY[0x1E4F42A80] systemImageNamed:@"xmark"];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    double v16 = __50__CKNavBarUnifiedCallButton_leaveJoinedCallAction__block_invoke;
    double v17 = &unk_1E5620ED8;
    objc_copyWeak(&v18, &location);
    BOOL v11 = [v7 actionWithTitle:v9 image:v10 identifier:@"CKNavBarUnifiedButtonViewUIActionIdentifierLeaveJoinedCall" handler:&v14];
    id v12 = self->_leaveJoinedCallAction;
    self->_leaveJoinedCallAction = v11;

    -[UIAction setAttributes:](self->_leaveJoinedCallAction, "setAttributes:", 2, v14, v15, v16, v17);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
    leaveJoinedCallAction = self->_leaveJoinedCallAction;
  }

  return leaveJoinedCallAction;
}

void __50__CKNavBarUnifiedCallButton_leaveJoinedCallAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    int64_t v2 = [WeakRetained delegate];
    [v2 buttonRequestsLeaveJoinedCall:v3];

    id WeakRetained = v3;
  }
}

- (CKNavBarUnifiedCallButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKNavBarUnifiedCallButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)buttonStyle
{
  return self->_buttonStyle;
}

- (void)setButtonStyle:(int64_t)a3
{
  self->_buttonStyle = a3;
}

- (NSArray)overrideAudioCallActions
{
  return self->_overrideAudioCallActions;
}

- (BOOL)isFaceTimeVideoAvailable
{
  return self->_faceTimeVideoAvailable;
}

- (void)setFaceTimeVideoAvailable:(BOOL)a3
{
  self->_faceTimeVideoAvailable = a3;
}

- (BOOL)isFaceTimeAudioAvailable
{
  return self->_faceTimeAudioAvailable;
}

- (void)setFaceTimeAudioAvailable:(BOOL)a3
{
  self->_faceTimeAudioAvailable = a3;
}

- (BOOL)isTelephonyAvailable
{
  return self->_telephonyCallAvailable;
}

- (void)setTelephonyCallAvailable:(BOOL)a3
{
  self->_telephonyCallAvailable = a3;
}

- (BOOL)isScreenSharingAvailable
{
  return self->_screenSharingAvailable;
}

- (void)setScreenSharingAvailable:(BOOL)a3
{
  self->_screenSharingAvailable = a3;
}

- (BOOL)joinPillShouldDisableLabel
{
  return self->_joinPillShouldDisableLabel;
}

- (void)setFaceTimeVideoAction:(id)a3
{
}

- (void)setFaceTimeJoinWithVideoAction:(id)a3
{
}

- (void)setFaceTimeAudioAction:(id)a3
{
}

- (void)setFaceTimeJoinWithAudioAction:(id)a3
{
}

- (void)setFaceTimeShareMyScreenAction:(id)a3
{
}

- (void)setFaceTimeInviteToShareTheirScreenAction:(id)a3
{
}

- (void)setTelephonyCallAction:(id)a3
{
}

- (void)setOpenJoinedCallAction:(id)a3
{
}

- (void)setLeaveJoinedCallAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaveJoinedCallAction, 0);
  objc_storeStrong((id *)&self->_openJoinedCallAction, 0);
  objc_storeStrong((id *)&self->_telephonyCallAction, 0);
  objc_storeStrong((id *)&self->_faceTimeInviteToShareTheirScreenAction, 0);
  objc_storeStrong((id *)&self->_faceTimeShareMyScreenAction, 0);
  objc_storeStrong((id *)&self->_faceTimeJoinWithAudioAction, 0);
  objc_storeStrong((id *)&self->_faceTimeAudioAction, 0);
  objc_storeStrong((id *)&self->_faceTimeJoinWithVideoAction, 0);
  objc_storeStrong((id *)&self->_faceTimeVideoAction, 0);
  objc_storeStrong((id *)&self->_overrideAudioCallActions, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end