@interface LPCaptionBarPresentationProperties
- (BOOL)hasAnyContent;
- (BOOL)shouldHighlightIndependently;
- (BOOL)usesBlurredBackground;
- (CGSize)leadingIconSize;
- (CGSize)trailingIconSize;
- (LPCaptionBarPresentationProperties)init;
- (LPCaptionButtonPresentationProperties)button;
- (LPCaptionRowPresentationProperties)aboveTop;
- (LPCaptionRowPresentationProperties)belowBottom;
- (LPCaptionRowPresentationProperties)bottom;
- (LPCaptionRowPresentationProperties)top;
- (LPCollaborationFooterPresentationProperties)collaborationFooter;
- (LPImage)leadingIcon;
- (LPImage)leadingIconBadge;
- (LPImage)trailingIcon;
- (LPImage)trailingIconBadge;
- (LPImagePresentationProperties)leadingIconBadgeProperties;
- (LPImagePresentationProperties)leadingIconProperties;
- (LPImagePresentationProperties)trailingIconBadgeProperties;
- (LPImagePresentationProperties)trailingIconProperties;
- (LPIndeterminateProgressSpinnerPresentationProperties)spinner;
- (LPPlayButtonPresentationProperties)playButton;
- (NSArray)additionalLeadingIcons;
- (NSArray)additionalTrailingIcons;
- (NSNumber)minimumHeight;
- (NSString)buttonCaption;
- (id)leftIcon;
- (id)leftIconProperties;
- (id)rightIcon;
- (id)rightIconProperties;
- (int64_t)leadingAccessoryType;
- (int64_t)leftAccessoryType;
- (int64_t)rightAccessoryType;
- (int64_t)trailingAccessoryType;
- (void)applyToAllCaptions:(id)a3;
- (void)removeAllIcons;
- (void)setAdditionalLeadingIcons:(id)a3;
- (void)setAdditionalTrailingIcons:(id)a3;
- (void)setButton:(id)a3;
- (void)setButtonCaption:(id)a3;
- (void)setCollaborationFooter:(id)a3;
- (void)setLeadingAccessoryType:(int64_t)a3;
- (void)setLeadingIcon:(id)a3;
- (void)setLeadingIconBadge:(id)a3;
- (void)setLeadingIconBadgeProperties:(id)a3;
- (void)setLeadingIconProperties:(id)a3;
- (void)setLeadingIconSize:(CGSize)a3;
- (void)setMinimumHeight:(id)a3;
- (void)setPlayButton:(id)a3;
- (void)setShouldHighlightIndependently:(BOOL)a3;
- (void)setSpinner:(id)a3;
- (void)setTrailingAccessoryType:(int64_t)a3;
- (void)setTrailingIcon:(id)a3;
- (void)setTrailingIconBadge:(id)a3;
- (void)setTrailingIconBadgeProperties:(id)a3;
- (void)setTrailingIconProperties:(id)a3;
- (void)setTrailingIconSize:(CGSize)a3;
- (void)setUsesBlurredBackground:(BOOL)a3;
@end

@implementation LPCaptionBarPresentationProperties

- (LPCaptionBarPresentationProperties)init
{
  v6.receiver = self;
  v6.super_class = (Class)LPCaptionBarPresentationProperties;
  v2 = [(LPCaptionBarPresentationProperties *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (LPCaptionRowPresentationProperties)aboveTop
{
  aboveTop = self->_aboveTop;
  if (!aboveTop)
  {
    v4 = objc_alloc_init(LPCaptionRowPresentationProperties);
    v5 = self->_aboveTop;
    self->_aboveTop = v4;

    aboveTop = self->_aboveTop;
  }

  return aboveTop;
}

- (LPCaptionRowPresentationProperties)top
{
  top = self->_top;
  if (!top)
  {
    v4 = objc_alloc_init(LPCaptionRowPresentationProperties);
    v5 = self->_top;
    self->_top = v4;

    top = self->_top;
  }

  return top;
}

- (LPCaptionRowPresentationProperties)bottom
{
  bottom = self->_bottom;
  if (!bottom)
  {
    v4 = objc_alloc_init(LPCaptionRowPresentationProperties);
    v5 = self->_bottom;
    self->_bottom = v4;

    bottom = self->_bottom;
  }

  return bottom;
}

- (LPCaptionRowPresentationProperties)belowBottom
{
  belowBottom = self->_belowBottom;
  if (!belowBottom)
  {
    v4 = objc_alloc_init(LPCaptionRowPresentationProperties);
    v5 = self->_belowBottom;
    self->_belowBottom = v4;

    belowBottom = self->_belowBottom;
  }

  return belowBottom;
}

- (BOOL)hasAnyContent
{
  return [(LPCaptionRowPresentationProperties *)self->_aboveTop hasAnyContent]
      || [(LPCaptionRowPresentationProperties *)self->_top hasAnyContent]
      || [(LPCaptionRowPresentationProperties *)self->_bottom hasAnyContent]
      || [(LPCaptionRowPresentationProperties *)self->_belowBottom hasAnyContent]
      || self->_leadingIcon
      || self->_trailingIcon != 0;
}

- (void)applyToAllCaptions:(id)a3
{
  id v4 = a3;
  -[LPCaptionRowPresentationProperties applyToAllCaptions:](self->_aboveTop, "applyToAllCaptions:");
  [(LPCaptionRowPresentationProperties *)self->_top applyToAllCaptions:v4];
  [(LPCaptionRowPresentationProperties *)self->_bottom applyToAllCaptions:v4];
  [(LPCaptionRowPresentationProperties *)self->_belowBottom applyToAllCaptions:v4];
}

- (void)removeAllIcons
{
  leadingIcon = self->_leadingIcon;
  self->_leadingIcon = 0;

  additionalLeadingIcons = self->_additionalLeadingIcons;
  self->_additionalLeadingIcons = 0;

  trailingIcon = self->_trailingIcon;
  self->_trailingIcon = 0;

  additionalTrailingIcons = self->_additionalTrailingIcons;
  self->_additionalTrailingIcons = 0;
}

- (id)leftIcon
{
  if (appIsLTR()) {
    [(LPCaptionBarPresentationProperties *)self leadingIcon];
  }
  else {
  v3 = [(LPCaptionBarPresentationProperties *)self trailingIcon];
  }

  return v3;
}

- (id)rightIcon
{
  if (appIsLTR()) {
    [(LPCaptionBarPresentationProperties *)self trailingIcon];
  }
  else {
  v3 = [(LPCaptionBarPresentationProperties *)self leadingIcon];
  }

  return v3;
}

- (id)leftIconProperties
{
  if (appIsLTR()) {
    [(LPCaptionBarPresentationProperties *)self leadingIconProperties];
  }
  else {
  v3 = [(LPCaptionBarPresentationProperties *)self trailingIconProperties];
  }

  return v3;
}

- (id)rightIconProperties
{
  if (appIsLTR()) {
    [(LPCaptionBarPresentationProperties *)self trailingIconProperties];
  }
  else {
  v3 = [(LPCaptionBarPresentationProperties *)self leadingIconProperties];
  }

  return v3;
}

- (int64_t)leftAccessoryType
{
  if (appIsLTR())
  {
    return [(LPCaptionBarPresentationProperties *)self leadingAccessoryType];
  }
  else
  {
    return [(LPCaptionBarPresentationProperties *)self trailingAccessoryType];
  }
}

- (int64_t)rightAccessoryType
{
  if (appIsLTR())
  {
    return [(LPCaptionBarPresentationProperties *)self trailingAccessoryType];
  }
  else
  {
    return [(LPCaptionBarPresentationProperties *)self leadingAccessoryType];
  }
}

- (void)setButtonCaption:(id)a3
{
  id v6 = a3;
  id v4 = objc_alloc_init(LPCaptionButtonPresentationProperties);
  button = self->_button;
  self->_button = v4;

  [(LPCaptionButtonPresentationProperties *)self->_button setText:v6];
  [(LPCaptionButtonPresentationProperties *)self->_button setType:1];
}

- (NSString)buttonCaption
{
  return [(LPCaptionButtonPresentationProperties *)self->_button text];
}

- (LPImage)leadingIcon
{
  return self->_leadingIcon;
}

- (void)setLeadingIcon:(id)a3
{
}

- (CGSize)leadingIconSize
{
  double width = self->_leadingIconSize.width;
  double height = self->_leadingIconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLeadingIconSize:(CGSize)a3
{
  self->_leadingIconSize = a3;
}

- (NSArray)additionalLeadingIcons
{
  return self->_additionalLeadingIcons;
}

- (void)setAdditionalLeadingIcons:(id)a3
{
}

- (LPImagePresentationProperties)leadingIconProperties
{
  return self->_leadingIconProperties;
}

- (void)setLeadingIconProperties:(id)a3
{
}

- (LPImage)leadingIconBadge
{
  return self->_leadingIconBadge;
}

- (void)setLeadingIconBadge:(id)a3
{
}

- (LPImagePresentationProperties)leadingIconBadgeProperties
{
  return self->_leadingIconBadgeProperties;
}

- (void)setLeadingIconBadgeProperties:(id)a3
{
}

- (LPImage)trailingIcon
{
  return self->_trailingIcon;
}

- (void)setTrailingIcon:(id)a3
{
}

- (CGSize)trailingIconSize
{
  double width = self->_trailingIconSize.width;
  double height = self->_trailingIconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setTrailingIconSize:(CGSize)a3
{
  self->_trailingIconSize = a3;
}

- (NSArray)additionalTrailingIcons
{
  return self->_additionalTrailingIcons;
}

- (void)setAdditionalTrailingIcons:(id)a3
{
}

- (LPImagePresentationProperties)trailingIconProperties
{
  return self->_trailingIconProperties;
}

- (void)setTrailingIconProperties:(id)a3
{
}

- (LPImage)trailingIconBadge
{
  return self->_trailingIconBadge;
}

- (void)setTrailingIconBadge:(id)a3
{
}

- (LPImagePresentationProperties)trailingIconBadgeProperties
{
  return self->_trailingIconBadgeProperties;
}

- (void)setTrailingIconBadgeProperties:(id)a3
{
}

- (int64_t)leadingAccessoryType
{
  return self->_leadingAccessoryType;
}

- (void)setLeadingAccessoryType:(int64_t)a3
{
  self->_leadingAccessoryType = a3;
}

- (int64_t)trailingAccessoryType
{
  return self->_trailingAccessoryType;
}

- (void)setTrailingAccessoryType:(int64_t)a3
{
  self->_trailingAccessoryType = a3;
}

- (LPCaptionButtonPresentationProperties)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (LPIndeterminateProgressSpinnerPresentationProperties)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (LPPlayButtonPresentationProperties)playButton
{
  return self->_playButton;
}

- (void)setPlayButton:(id)a3
{
}

- (LPCollaborationFooterPresentationProperties)collaborationFooter
{
  return self->_collaborationFooter;
}

- (void)setCollaborationFooter:(id)a3
{
}

- (BOOL)shouldHighlightIndependently
{
  return self->_shouldHighlightIndependently;
}

- (void)setShouldHighlightIndependently:(BOOL)a3
{
  self->_shouldHighlightIndependently = a3;
}

- (NSNumber)minimumHeight
{
  return self->_minimumHeight;
}

- (void)setMinimumHeight:(id)a3
{
}

- (BOOL)usesBlurredBackground
{
  return self->_usesBlurredBackground;
}

- (void)setUsesBlurredBackground:(BOOL)a3
{
  self->_usesBlurredBackground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumHeight, 0);
  objc_storeStrong((id *)&self->_collaborationFooter, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_trailingIconBadgeProperties, 0);
  objc_storeStrong((id *)&self->_trailingIconBadge, 0);
  objc_storeStrong((id *)&self->_trailingIconProperties, 0);
  objc_storeStrong((id *)&self->_additionalTrailingIcons, 0);
  objc_storeStrong((id *)&self->_trailingIcon, 0);
  objc_storeStrong((id *)&self->_leadingIconBadgeProperties, 0);
  objc_storeStrong((id *)&self->_leadingIconBadge, 0);
  objc_storeStrong((id *)&self->_leadingIconProperties, 0);
  objc_storeStrong((id *)&self->_additionalLeadingIcons, 0);
  objc_storeStrong((id *)&self->_leadingIcon, 0);
  objc_storeStrong((id *)&self->_belowBottom, 0);
  objc_storeStrong((id *)&self->_bottom, 0);
  objc_storeStrong((id *)&self->_top, 0);

  objc_storeStrong((id *)&self->_aboveTop, 0);
}

@end