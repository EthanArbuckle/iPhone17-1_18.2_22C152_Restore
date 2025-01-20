@interface LPCaptionBarStyle
- (BOOL)addFullWidthLineForButton;
- (BOOL)alignButtonWithCaptionTextLeadingEdge;
- (BOOL)buttonIgnoresTextSafeAreaInsets;
- (BOOL)buttonRespectsTextStackPadding;
- (BOOL)canAddLineForButton;
- (BOOL)expandButtonToCaptionEdge;
- (BOOL)positionButtonRelativeToTextStack;
- (BOOL)usesOutOfLineButton;
- (LPAudioPlayButtonStyle)playButton;
- (LPButtonStyle)button;
- (LPCaptionBarAccessoryStyle)leadingAccessory;
- (LPCaptionBarAccessoryStyle)trailingAccessory;
- (LPCaptionBarStyle)initWithPlatform:(int64_t)a3 sizeClass:(unint64_t)a4 sizeClassParameters:(id)a5 fontScalingFactor:(double)a6;
- (LPCollaborationFooterStyle)collaborationFooter;
- (LPIconBadgeStyle)leadingIconBadge;
- (LPIconBadgeStyle)trailingIconBadge;
- (LPImageViewStyle)leadingIcon;
- (LPImageViewStyle)trailingIcon;
- (LPPadding)playButtonPadding;
- (LPPointUnit)minimumWidth;
- (LPPointUnit)trailingPaddingForPresenceOfLeadingIcon;
- (LPVerticalTextStackViewStyle)textStack;
- (UIColor)backgroundColor;
- (id)leftAccessory;
- (id)leftIcon;
- (id)rightAccessory;
- (id)rightIcon;
- (unsigned)minimumNumberOfLinesToVerticallyCenter;
- (void)setAddFullWidthLineForButton:(BOOL)a3;
- (void)setAlignButtonWithCaptionTextLeadingEdge:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setButton:(id)a3;
- (void)setButtonIgnoresTextSafeAreaInsets:(BOOL)a3;
- (void)setButtonRespectsTextStackPadding:(BOOL)a3;
- (void)setCanAddLineForButton:(BOOL)a3;
- (void)setCollaborationFooter:(id)a3;
- (void)setExpandButtonToCaptionEdge:(BOOL)a3;
- (void)setMinimumNumberOfLinesToVerticallyCenter:(unsigned int)a3;
- (void)setMinimumWidth:(id)a3;
- (void)setPositionButtonRelativeToTextStack:(BOOL)a3;
- (void)setTrailingPaddingForPresenceOfLeadingIcon:(id)a3;
- (void)setUsesOutOfLineButton:(BOOL)a3;
@end

@implementation LPCaptionBarStyle

- (LPCaptionBarStyle)initWithPlatform:(int64_t)a3 sizeClass:(unint64_t)a4 sizeClassParameters:(id)a5 fontScalingFactor:(double)a6
{
  id v10 = a5;
  v85.receiver = self;
  v85.super_class = (Class)LPCaptionBarStyle;
  v11 = [(LPCaptionBarStyle *)&v85 init];
  if (v11)
  {
    if (a3 == 2)
    {
      v12 = [[LPPointUnit alloc] initWithValue:100.0];
    }
    else if ([v10 needsSpaceAffordanceForDeleteButton])
    {
      v12 = [[LPPointUnit alloc] initWithValue:140.0];
    }
    else
    {
      v12 = [[LPPointUnit alloc] initWithValue:150.0];
    }
    minimumWidth = v11->_minimumWidth;
    v11->_minimumWidth = v12;

    if (!initWithPlatform_sizeClass_sizeClassParameters_fontScalingFactor__defaultVerticalMargin)
    {
      v14 = [[LPPointUnit alloc] initWithValue:6.0];
      v15 = (void *)initWithPlatform_sizeClass_sizeClassParameters_fontScalingFactor__defaultVerticalMargin;
      initWithPlatform_sizeClass_sizeClassParameters_fontScalingFactor__defaultVerticalMargin = (uint64_t)v14;
    }
    v16 = objc_alloc_init(LPImageViewStyle);
    leadingIcon = v11->_leadingIcon;
    v11->_leadingIcon = v16;

    v18 = [[LPPointUnit alloc] initWithValue:3.0];
    [(LPImageViewStyle *)v11->_leadingIcon setCornerRadius:v18];

    if (a4 == 5) {
      uint64_t v19 = 13;
    }
    else {
      uint64_t v19 = 3;
    }
    [(LPImageViewStyle *)v11->_leadingIcon setFilter:v19];
    v20 = iconSize((id)a3);
    [(LPImageViewStyle *)v11->_leadingIcon setFixedSize:v20];

    v21 = outerHorizontalIconMargin((id)a3);
    v22 = [(LPImageViewStyle *)v11->_leadingIcon margin];
    [v22 setLeading:v21];

    uint64_t v23 = initWithPlatform_sizeClass_sizeClassParameters_fontScalingFactor__defaultVerticalMargin;
    v24 = [(LPImageViewStyle *)v11->_leadingIcon margin];
    [v24 setTop:v23];

    uint64_t v25 = initWithPlatform_sizeClass_sizeClassParameters_fontScalingFactor__defaultVerticalMargin;
    v26 = [(LPImageViewStyle *)v11->_leadingIcon margin];
    [v26 setBottom:v25];

    v27 = fallbackIconSize(a3);
    [(LPImageViewStyle *)v11->_leadingIcon setFixedFallbackImageSize:v27];

    v28 = objc_alloc_init(LPImageViewStyle);
    trailingIcon = v11->_trailingIcon;
    v11->_trailingIcon = v28;

    v30 = [(LPImageViewStyle *)v11->_leadingIcon cornerRadius];
    [(LPImageViewStyle *)v11->_trailingIcon setCornerRadius:v30];

    [(LPImageViewStyle *)v11->_trailingIcon setFilter:v19];
    v31 = iconSize((id)a3);
    [(LPImageViewStyle *)v11->_trailingIcon setFixedSize:v31];

    v32 = outerHorizontalIconMargin((id)a3);
    v33 = [(LPImageViewStyle *)v11->_trailingIcon margin];
    [v33 setTrailing:v32];

    uint64_t v34 = initWithPlatform_sizeClass_sizeClassParameters_fontScalingFactor__defaultVerticalMargin;
    v35 = [(LPImageViewStyle *)v11->_trailingIcon margin];
    [v35 setTop:v34];

    uint64_t v36 = initWithPlatform_sizeClass_sizeClassParameters_fontScalingFactor__defaultVerticalMargin;
    v37 = [(LPImageViewStyle *)v11->_trailingIcon margin];
    [v37 setBottom:v36];

    v38 = [(LPImageViewStyle *)v11->_leadingIcon fixedFallbackImageSize];
    [(LPImageViewStyle *)v11->_trailingIcon setFixedFallbackImageSize:v38];

    v39 = objc_alloc_init(LPIconBadgeStyle);
    leadingIconBadge = v11->_leadingIconBadge;
    v11->_leadingIconBadge = v39;

    v41 = [LPSize alloc];
    +[LPTheme badgeIconSizeInPoints];
    v42 = -[LPSize initWithSquareSize:](v41, "initWithSquareSize:");
    [(LPImageViewStyle *)v11->_leadingIconBadge setFixedSize:v42];

    [(LPIconBadgeStyle *)v11->_leadingIconBadge setOffset:3.0];
    if (a3 == 4 || a3 == 1) {
      uint64_t v44 = 1;
    }
    else {
      uint64_t v44 = 5;
    }
    [(LPImageViewStyle *)v11->_leadingIconBadge setFilter:v44];
    v45 = objc_alloc_init(LPIconBadgeStyle);
    trailingIconBadge = v11->_trailingIconBadge;
    v11->_trailingIconBadge = v45;

    v47 = [(LPImageViewStyle *)v11->_leadingIconBadge fixedSize];
    [(LPImageViewStyle *)v11->_trailingIconBadge setFixedSize:v47];

    [(LPIconBadgeStyle *)v11->_leadingIconBadge offset];
    -[LPIconBadgeStyle setOffset:](v11->_trailingIconBadge, "setOffset:");
    [(LPImageViewStyle *)v11->_trailingIconBadge setFilter:[(LPImageViewStyle *)v11->_leadingIconBadge filter]];
    v48 = [[LPVerticalTextStackViewStyle alloc] initWithPlatform:a3 sizeClass:a4 fontScalingFactor:a6];
    textStack = v11->_textStack;
    v11->_textStack = v48;

    switch(a3)
    {
      case 0:
      case 6:
        v50 = [LPPointUnit alloc];
        double v52 = 23.0;
        goto LABEL_25;
      case 1:
      case 3:
      case 4:
        v50 = [LPPointUnit alloc];
        double v51 = 18.0;
        goto LABEL_26;
      case 2:
        v50 = [LPPointUnit alloc];
        double v52 = 15.0;
        goto LABEL_25;
      case 5:
        v50 = [LPPointUnit alloc];
        if (a4 == 5) {
          double v52 = 24.0;
        }
        else {
          double v52 = 27.0;
        }
LABEL_25:
        double v51 = a6 * v52;
LABEL_26:
        v47 = [(LPPointUnit *)v50 initWithValue:v51];
        break;
      default:
        break;
    }
    [(LPVerticalTextStackViewStyle *)v11->_textStack setFirstLineLeading:v47];

    switch(a3)
    {
      case 0:
      case 6:
        v53 = [LPPointUnit alloc];
        double v55 = 12.0;
        goto LABEL_34;
      case 1:
      case 3:
      case 4:
        v53 = [LPPointUnit alloc];
        double v54 = 10.0;
        goto LABEL_35;
      case 2:
        v53 = [LPPointUnit alloc];
        double v55 = 9.0;
        goto LABEL_34;
      case 5:
        v53 = [LPPointUnit alloc];
        if (a4 == 5) {
          double v55 = 13.0;
        }
        else {
          double v55 = 16.0;
        }
LABEL_34:
        double v54 = a6 * v55;
LABEL_35:
        v47 = [(LPPointUnit *)v53 initWithValue:v54];
        break;
      default:
        break;
    }
    [(LPVerticalTextStackViewStyle *)v11->_textStack setLastLineDescent:v47];

    v56 = [[LPAudioPlayButtonStyle alloc] initWithPlatform:a3];
    playButton = v11->_playButton;
    v11->_playButton = v56;

    v58 = objc_alloc_init(LPPadding);
    playButtonPadding = v11->_playButtonPadding;
    v11->_playButtonPadding = v58;

    v60 = [[LPPointUnit alloc] initWithValue:8.0];
    [(LPPadding *)v11->_playButtonPadding setLeading:v60];

    v61 = [[LPPointUnit alloc] initWithValue:15.0];
    [(LPPadding *)v11->_playButtonPadding setTrailing:v61];

    v62 = objc_alloc_init(LPCaptionBarAccessoryStyle);
    leadingAccessory = v11->_leadingAccessory;
    v11->_leadingAccessory = v62;

    v64 = outerHorizontalIconMargin((id)a3);
    v65 = [(LPCaptionBarAccessoryStyle *)v11->_leadingAccessory margin];
    [v65 setLeading:v64];

    uint64_t v66 = initWithPlatform_sizeClass_sizeClassParameters_fontScalingFactor__defaultVerticalMargin;
    v67 = [(LPCaptionBarAccessoryStyle *)v11->_leadingAccessory margin];
    [v67 setTop:v66];

    uint64_t v68 = initWithPlatform_sizeClass_sizeClassParameters_fontScalingFactor__defaultVerticalMargin;
    v69 = [(LPCaptionBarAccessoryStyle *)v11->_leadingAccessory margin];
    [v69 setBottom:v68];

    v70 = objc_alloc_init(LPCaptionBarAccessoryStyle);
    trailingAccessory = v11->_trailingAccessory;
    v11->_trailingAccessory = v70;

    v72 = outerHorizontalIconMargin((id)a3);
    v73 = [(LPCaptionBarAccessoryStyle *)v11->_trailingAccessory margin];
    [v73 setTrailing:v72];

    uint64_t v74 = initWithPlatform_sizeClass_sizeClassParameters_fontScalingFactor__defaultVerticalMargin;
    v75 = [(LPCaptionBarAccessoryStyle *)v11->_trailingAccessory margin];
    [v75 setTop:v74];

    uint64_t v76 = initWithPlatform_sizeClass_sizeClassParameters_fontScalingFactor__defaultVerticalMargin;
    v77 = [(LPCaptionBarAccessoryStyle *)v11->_trailingAccessory margin];
    [v77 setBottom:v76];

    if ([v10 needsSpaceAffordanceForDeleteButton])
    {
      v78 = [[LPPointUnit alloc] initWithValue:30.0];
      trailingPaddingForPresenceOfLeadingIcon = v11->_trailingPaddingForPresenceOfLeadingIcon;
      v11->_trailingPaddingForPresenceOfLeadingIcon = v78;
    }
    uint64_t v80 = +[LPButtonStyle systemPillButtonStyleForPlatform:a3 sizeClass:a4];
    button = v11->_button;
    v11->_button = (LPButtonStyle *)v80;

    backgroundColor = v11->_backgroundColor;
    v11->_backgroundColor = 0;

    v11->_minimumNumberOfLinesToVerticallyCenter = 0;
    v83 = v11;
  }

  return v11;
}

- (id)leftIcon
{
  if (appIsLTR()) {
    [(LPCaptionBarStyle *)self leadingIcon];
  }
  else {
  v3 = [(LPCaptionBarStyle *)self trailingIcon];
  }

  return v3;
}

- (id)rightIcon
{
  if (appIsLTR()) {
    [(LPCaptionBarStyle *)self trailingIcon];
  }
  else {
  v3 = [(LPCaptionBarStyle *)self leadingIcon];
  }

  return v3;
}

- (id)leftAccessory
{
  if (appIsLTR()) {
    [(LPCaptionBarStyle *)self leadingAccessory];
  }
  else {
  v3 = [(LPCaptionBarStyle *)self trailingAccessory];
  }

  return v3;
}

- (id)rightAccessory
{
  if (appIsLTR()) {
    [(LPCaptionBarStyle *)self trailingAccessory];
  }
  else {
  v3 = [(LPCaptionBarStyle *)self leadingAccessory];
  }

  return v3;
}

- (LPImageViewStyle)leadingIcon
{
  return self->_leadingIcon;
}

- (LPImageViewStyle)trailingIcon
{
  return self->_trailingIcon;
}

- (LPIconBadgeStyle)leadingIconBadge
{
  return self->_leadingIconBadge;
}

- (LPIconBadgeStyle)trailingIconBadge
{
  return self->_trailingIconBadge;
}

- (LPCaptionBarAccessoryStyle)leadingAccessory
{
  return self->_leadingAccessory;
}

- (LPCaptionBarAccessoryStyle)trailingAccessory
{
  return self->_trailingAccessory;
}

- (LPVerticalTextStackViewStyle)textStack
{
  return self->_textStack;
}

- (LPPointUnit)minimumWidth
{
  return self->_minimumWidth;
}

- (void)setMinimumWidth:(id)a3
{
}

- (LPPointUnit)trailingPaddingForPresenceOfLeadingIcon
{
  return self->_trailingPaddingForPresenceOfLeadingIcon;
}

- (void)setTrailingPaddingForPresenceOfLeadingIcon:(id)a3
{
}

- (LPAudioPlayButtonStyle)playButton
{
  return self->_playButton;
}

- (LPPadding)playButtonPadding
{
  return self->_playButtonPadding;
}

- (LPButtonStyle)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (BOOL)usesOutOfLineButton
{
  return self->_usesOutOfLineButton;
}

- (void)setUsesOutOfLineButton:(BOOL)a3
{
  self->_usesOutOfLineButton = a3;
}

- (BOOL)canAddLineForButton
{
  return self->_canAddLineForButton;
}

- (void)setCanAddLineForButton:(BOOL)a3
{
  self->_canAddLineForButton = a3;
}

- (BOOL)positionButtonRelativeToTextStack
{
  return self->_positionButtonRelativeToTextStack;
}

- (void)setPositionButtonRelativeToTextStack:(BOOL)a3
{
  self->_positionButtonRelativeToTextStack = a3;
}

- (BOOL)buttonRespectsTextStackPadding
{
  return self->_buttonRespectsTextStackPadding;
}

- (void)setButtonRespectsTextStackPadding:(BOOL)a3
{
  self->_buttonRespectsTextStackPadding = a3;
}

- (BOOL)buttonIgnoresTextSafeAreaInsets
{
  return self->_buttonIgnoresTextSafeAreaInsets;
}

- (void)setButtonIgnoresTextSafeAreaInsets:(BOOL)a3
{
  self->_buttonIgnoresTextSafeAreaInsets = a3;
}

- (BOOL)addFullWidthLineForButton
{
  return self->_addFullWidthLineForButton;
}

- (void)setAddFullWidthLineForButton:(BOOL)a3
{
  self->_addFullWidthLineForButton = a3;
}

- (BOOL)alignButtonWithCaptionTextLeadingEdge
{
  return self->_alignButtonWithCaptionTextLeadingEdge;
}

- (void)setAlignButtonWithCaptionTextLeadingEdge:(BOOL)a3
{
  self->_alignButtonWithCaptionTextLeadingEdge = a3;
}

- (BOOL)expandButtonToCaptionEdge
{
  return self->_expandButtonToCaptionEdge;
}

- (void)setExpandButtonToCaptionEdge:(BOOL)a3
{
  self->_expandButtonToCaptionEdge = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (unsigned)minimumNumberOfLinesToVerticallyCenter
{
  return self->_minimumNumberOfLinesToVerticallyCenter;
}

- (void)setMinimumNumberOfLinesToVerticallyCenter:(unsigned int)a3
{
  self->_minimumNumberOfLinesToVerticallyCenter = a3;
}

- (LPCollaborationFooterStyle)collaborationFooter
{
  return self->_collaborationFooter;
}

- (void)setCollaborationFooter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationFooter, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_playButtonPadding, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_trailingPaddingForPresenceOfLeadingIcon, 0);
  objc_storeStrong((id *)&self->_minimumWidth, 0);
  objc_storeStrong((id *)&self->_textStack, 0);
  objc_storeStrong((id *)&self->_trailingAccessory, 0);
  objc_storeStrong((id *)&self->_leadingAccessory, 0);
  objc_storeStrong((id *)&self->_trailingIconBadge, 0);
  objc_storeStrong((id *)&self->_leadingIconBadge, 0);
  objc_storeStrong((id *)&self->_trailingIcon, 0);

  objc_storeStrong((id *)&self->_leadingIcon, 0);
}

@end