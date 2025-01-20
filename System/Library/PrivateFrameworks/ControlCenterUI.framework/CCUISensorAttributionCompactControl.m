@interface CCUISensorAttributionCompactControl
- (BOOL)alwaysHidesSensorIcons;
- (BOOL)expanded;
- (BOOL)isDisplayingSensorStatus;
- (BOOL)showingCamera;
- (BOOL)showingGameMode;
- (BOOL)showingInactiveMicrophone;
- (BOOL)showingLocation;
- (BOOL)showingMicrophone;
- (CCUISensorAttributionCompactControl)initWithFrame:(CGRect)a3;
- (CCUISensorAttributionCompactControlDelegate)delegate;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFitsMaximumAllowableWidth;
- (NSString)descriptionText;
- (NSString)detailText;
- (SBFView)labelWrapperView;
- (UIImageView)chevronImageView;
- (UILabel)descriptionLabel;
- (UILabel)detailLabel;
- (UIView)backgroundView;
- (UIView)cameraIndicatorView;
- (UIView)chevronWrapperView;
- (UIView)gameModeIndicatorView;
- (UIView)inactiveMicIndicatorView;
- (UIView)locationIndicatorView;
- (UIView)micIndicatorView;
- (double)_layoutSingleIndicatorView:(id)a3 trailingX:(double)a4 visible:(BOOL)a5;
- (double)_visibleIndicatorsWidth;
- (double)fixedHeight;
- (double)maximumAllowableWidth;
- (id)_configureIndicatorViewForType:(unint64_t)a3 inactive:(BOOL)a4;
- (id)_fontForTitleLabel;
- (id)_rightChevronImage;
- (id)clone;
- (int)activeIndicatorsCount;
- (unint64_t)gameModeState;
- (void)_configureChevronViews;
- (void)_configureChevronWrapperAppearance;
- (void)_configureIndicatorView:(id)a3 forGameModeState:(unint64_t)a4;
- (void)_decideToExpandOrCompactAndForwardToDelegate:(id)a3;
- (void)_layoutBackgroundView;
- (void)_layoutChevronViews;
- (void)_layoutIndicatorViews;
- (void)_layoutLabelViews;
- (void)_setBlurRadius:(double)a3 ofView:(id)a4;
- (void)_setChevronAlphaForExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)_setLabelWrapperViewBlurAndAlphaForExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateContentIfDisplayedAttributionsAreStaleAndLayout;
- (void)gameModeStateDidChange:(unint64_t)a3;
- (void)handleTouchCanceled;
- (void)handleTouchDown;
- (void)handleTouchUpInside;
- (void)inactiveMicModeSelectionAttributionChanged:(id)a3;
- (void)layoutSubviews;
- (void)sensorAttributionsChanged:(id)a3;
- (void)setAlwaysHidesSensorIcons:(BOOL)a3;
- (void)setBackgroundView:(id)a3;
- (void)setChevronImageView:(id)a3;
- (void)setChevronWrapperView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setDetailLabel:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)setGameModeState:(unint64_t)a3;
- (void)setLabelWrapperView:(id)a3;
- (void)setMaximumAllowableWidth:(double)a3;
- (void)setShowingCamera:(BOOL)a3;
- (void)setShowingGameMode:(BOOL)a3;
- (void)setShowingInactiveMicrophone:(BOOL)a3;
- (void)setShowingLocation:(BOOL)a3;
- (void)setShowingMicrophone:(BOOL)a3;
@end

@implementation CCUISensorAttributionCompactControl

- (void)_updateContentIfDisplayedAttributionsAreStaleAndLayout
{
  v2 = self;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  attributions = self->_attributions;
  p_displayedAttributions = &self->_displayedAttributions;
  if (attributions != self->_displayedAttributions
    || self->_inactiveMicModeSelectionAttribution != self->_displayedInactiveMicModeSelectionAttribution)
  {
    objc_storeStrong((id *)&self->_displayedAttributions, attributions);
    p_displayedInactiveMicModeSelectionAttribution = &v2->_displayedInactiveMicModeSelectionAttribution;
    objc_storeStrong((id *)&v2->_displayedInactiveMicModeSelectionAttribution, v2->_inactiveMicModeSelectionAttribution);
    v2->_showingCamera = 0;
    v2->_showingMicrophone = 0;
    v2->_showingInactiveMicrophone = 0;
    v2->_showingLocation = 0;
    v5 = v2;
    v2->_showingGameMode = 0;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v55 = (id *)p_displayedAttributions;
    v6 = *p_displayedAttributions;
    uint64_t v7 = [(NSSet *)v6 countByEnumeratingWithState:&v64 objects:v70 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      char v9 = 0;
      char v57 = 0;
      uint64_t v10 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v65 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          if (![v12 sensorType])
          {
            v5->_showingCamera = 1;
            char v57 = [v12 usedRecently];
          }
          if ([v12 sensorType] == 1)
          {
            v5->_showingMicrophone = 1;
            char v9 = [v12 usedRecently];
          }
          if ([v12 sensorType] == 2) {
            v5->_showingLocation = 1;
          }
          if ([v12 sensorType] == 3) {
            v5->_showingGameMode = 1;
          }
        }
        uint64_t v8 = [(NSSet *)v6 countByEnumeratingWithState:&v64 objects:v70 count:16];
      }
      while (v8);
    }
    else
    {
      char v9 = 0;
      char v57 = 0;
    }

    id v13 = *v55;
    v14 = v13;
    v2 = v5;
    if (!v5->_showingCamera || (v57)
      && !v5->_showingMicrophone | v9 & 1
      && *p_displayedInactiveMicModeSelectionAttribution)
    {
      v5->_showingInactiveMicrophone = 1;
      uint64_t v15 = [v13 setByAddingObject:*p_displayedInactiveMicModeSelectionAttribution];

      v14 = (void *)v15;
    }
    v16 = CCUIUniqueSensorAttributionEntitiesForSensorActivityData(v14);
    id v17 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    v59 = [v16 firstObject];
    v18 = [v59 displayNameForCompactView];
    v58 = [(CCUISensorAttributionCompactControl *)v5 delegate];
    v19 = [v58 bundleIdentifierUsingAudioVideoControlsForSensorAttributionCompactControl:v5];
    if ([v16 count] == 1)
    {
      [v17 appendString:v18];
    }
    else if (v19)
    {
      v52 = v18;
      v54 = v17;
      v56 = v14;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v20 = v16;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v60 objects:v69 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v61;
        while (2)
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v61 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v60 + 1) + 8 * j);
            v26 = [v25 bundleIdentifier];
            int v27 = [v26 isEqualToString:v19];

            if (v27)
            {
              v28 = [v25 displayNameForCompactView];
              id v17 = v54;
              [v54 appendString:v28];

              v2 = v5;
              v14 = v56;
              goto LABEL_38;
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v60 objects:v69 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }

      v2 = v5;
      id v17 = v54;
      v14 = v56;
LABEL_38:
      v18 = v52;
    }
    else if ([v16 count] == 2)
    {
      v29 = [v16 objectAtIndex:1];
      v30 = [v29 displayNameForCompactView];

      v31 = [MEMORY[0x1E4F1CA20] currentLocale];
      v32 = [v31 languageCode];

      if (([v32 isEqualToString:@"es"] & 1) != 0
        || [v32 isEqualToString:@"he"])
      {
        v33 = (void *)MEMORY[0x1E4F28DF8];
        v68[0] = v18;
        v68[1] = v30;
        [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
        v34 = v32;
        v35 = v30;
        v37 = v36 = v18;
        v38 = [v33 localizedStringByJoiningStrings:v37];

        v18 = v36;
        v30 = v35;
        v32 = v34;
        [v17 appendString:v38];
      }
      else
      {
        v45 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v38 = [v45 localizedStringForKey:@"CONTROL_CENTER_SENSOR_STATUS_TWO_APPS_AMPERSAND" value:&stru_1F2F34F20 table:@"ControlCenterUI"];

        v46 = objc_msgSend(NSString, "stringWithFormat:", v38, v18, v30);
        [v17 appendString:v46];
      }
    }
    else if ((unint64_t)[v16 count] >= 3)
    {
      v39 = v17;
      uint64_t v40 = [v16 count] - 1;
      v41 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      [v41 localizedStringForKey:@"CONTROL_CENTER_SENSOR_STATUS_ONE_APP_AMPERSAND_N_MORE" value:&stru_1F2F34F20 table:@"ControlCenterUI"];
      v43 = v42 = v18;

      uint64_t v51 = v40;
      id v17 = v39;
      v44 = objc_msgSend(NSString, "stringWithFormat:", v43, v42, v51);
      [v39 appendString:v44];

      v18 = v42;
    }
    [(CCUISensorAttributionCompactControl *)v2 setDescriptionText:v17];
    if (v2->_showingGameMode)
    {
      v47 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v48 = v47;
      v49 = @"CONTROL_CENTER_GAME_MODE";
    }
    else
    {
      if (!v19)
      {
        v50 = &stru_1F2F34F20;
        goto LABEL_52;
      }
      v47 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v48 = v47;
      v49 = @"CONTROL_CENTER_SENSOR_STATUS_CONTROLS";
    }
    v50 = [v47 localizedStringForKey:v49 value:&stru_1F2F34F20 table:@"ControlCenterUI"];

LABEL_52:
    [(CCUISensorAttributionCompactControl *)v2 setDetailText:v50];
    [(CCUISensorAttributionCompactControl *)v2 setUserInteractionEnabled:[(CCUISensorAttributionCompactControl *)v2 activeIndicatorsCount] > 0];
  }
  [(CCUISensorAttributionCompactControl *)v2 _layoutIndicatorViews];
  [(CCUISensorAttributionCompactControl *)v2 _layoutLabelViews];
  [(CCUISensorAttributionCompactControl *)v2 _layoutChevronViews];
  [(CCUISensorAttributionCompactControl *)v2 _layoutBackgroundView];
}

- (void)_layoutBackgroundView
{
  id v17 = [(CCUISensorAttributionCompactControl *)self backgroundView];
  v3 = [(CCUISensorAttributionCompactControl *)self delegate];
  v4 = [v3 bundleIdentifierUsingAudioVideoControlsForSensorAttributionCompactControl:self];
  BOOL v5 = v4 == 0;

  [v17 setHidden:v5];
  [(CCUISensorAttributionCompactControl *)self bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v15 = [v14 userInterfaceLayoutDirection];

  double v16 = -8.0;
  if (v15 != 1) {
    double v16 = -2.0;
  }
  objc_msgSend(v17, "setFrame:", v7 + v16, v9 + -2.0, v11 + 12.0, v13 + 4.0);
  [v17 _setContinuousCornerRadius:(v13 + 4.0) * 0.5];
}

- (CCUISensorAttributionCompactControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CCUISensorAttributionCompactControlDelegate *)WeakRetained;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (CGSize)sizeThatFitsMaximumAllowableWidth
{
  double v2 = self->_maximumAllowableWidth + -14.0;
  -[CCUISensorAttributionCompactControl sizeThatFits:](self, "sizeThatFits:", v2, 20.0);
  if (v3 >= v2) {
    double v3 = v2;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(CCUISensorAttributionCompactControl *)self _visibleIndicatorsWidth];
  double v6 = v5;
  double v7 = width - v5;
  [(UIImageView *)self->_chevronImageView frame];
  double v9 = v7 - v8 + -4.0;
  -[UILabel sizeThatFits:](self->_descriptionLabel, "sizeThatFits:", v9, self->_singleIndicatorSize.height);
  double v11 = v10;
  double height = self->_singleIndicatorSize.height;
  -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", v9, height);
  double v14 = 0.0;
  if (v13 != 0.0) {
    double v14 = 7.0;
  }
  double v15 = v13 + v6 + v11 + v14;
  [(UIImageView *)self->_chevronImageView frame];
  double v17 = v15 + v16 + 7.0 + 1.0;
  double v18 = height;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (double)fixedHeight
{
  return self->_singleIndicatorSize.height;
}

- (void)_layoutIndicatorViews
{
  double v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  double v4 = -4.0;
  if ([v3 userInterfaceLayoutDirection] == 1)
  {
    [(CCUISensorAttributionCompactControl *)self bounds];
    double v4 = v5 + 4.0 + 1.0;
  }

  [(CCUISensorAttributionCompactControl *)self _layoutSingleIndicatorView:self->_cameraIndicatorView trailingX:self->_showingCamera visible:v4];
  -[CCUISensorAttributionCompactControl _layoutSingleIndicatorView:trailingX:visible:](self, "_layoutSingleIndicatorView:trailingX:visible:", self->_micIndicatorView, self->_showingMicrophone);
  -[CCUISensorAttributionCompactControl _layoutSingleIndicatorView:trailingX:visible:](self, "_layoutSingleIndicatorView:trailingX:visible:", self->_inactiveMicIndicatorView, self->_showingInactiveMicrophone);
  -[CCUISensorAttributionCompactControl _layoutSingleIndicatorView:trailingX:visible:](self, "_layoutSingleIndicatorView:trailingX:visible:", self->_locationIndicatorView, self->_showingLocation);
  gameModeIndicatorView = self->_gameModeIndicatorView;
  BOOL showingGameMode = self->_showingGameMode;

  -[CCUISensorAttributionCompactControl _layoutSingleIndicatorView:trailingX:visible:](self, "_layoutSingleIndicatorView:trailingX:visible:", gameModeIndicatorView, showingGameMode);
}

- (double)_layoutSingleIndicatorView:(id)a3 trailingX:(double)a4 visible:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  [(CCUISensorAttributionCompactControl *)self bounds];
  if (v8)
  {
    if (!v5)
    {
      [v8 setHidden:1];
      uint64_t v17 = *MEMORY[0x1E4FB2578];
LABEL_11:
      [v8 setAccessibilityTraits:v17];
      goto LABEL_12;
    }
    [v8 frame];
    CGFloat rect = v9;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    double v16 = [MEMORY[0x1E4FB1438] sharedApplication];
    if ([v16 userInterfaceLayoutDirection] == 1)
    {
      v35.origin.x = rect;
      v35.origin.y = v11;
      v35.size.double width = v13;
      v35.size.double height = v15;
      CGRectGetWidth(v35);
    }

    UIRectCenteredYInRect();
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    v26 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v27 = [v26 userInterfaceLayoutDirection];
    double v28 = v19;
    double v29 = v21;
    double v30 = v23;
    double v31 = v25;
    if (v27 == 1) {
      CGFloat MinX = CGRectGetMinX(*(CGRect *)&v28);
    }
    else {
      CGFloat MinX = CGRectGetMaxX(*(CGRect *)&v28);
    }
    a4 = MinX;

    objc_msgSend(v8, "setFrame:", v19, v21, v23, v25);
    if (!self->_alwaysHidesSensorIcons)
    {
      [v8 setHidden:0];
      uint64_t v17 = 0;
      goto LABEL_11;
    }
  }
LABEL_12:

  return a4;
}

- (void)_layoutLabelViews
{
  p_descriptionLabel = &self->_descriptionLabel;
  descriptionLabel = self->_descriptionLabel;
  if (descriptionLabel)
  {
    [(UILabel *)descriptionLabel setText:self->_descriptionText];
    p_detailLabel = &self->_detailLabel;
    [(UILabel *)self->_detailLabel setText:self->_detailText];
    [(CCUISensorAttributionCompactControl *)self bounds];
    double v7 = v6;
    [(CCUISensorAttributionCompactControl *)self _visibleIndicatorsWidth];
    double v9 = v7 - v8;
    double v10 = [(CCUISensorAttributionCompactControl *)self chevronImageView];
    [v10 frame];
    double v12 = v9 - v11;

    if ([(CCUISensorAttributionCompactControl *)self activeIndicatorsCount] <= 0) {
      double v13 = v12;
    }
    else {
      double v13 = v12 + -1.0;
    }
    -[UILabel sizeThatFits:](*p_detailLabel, "sizeThatFits:", v13, self->_singleIndicatorSize.height);
    double height = self->_singleIndicatorSize.height;
    if (v14 >= v13) {
      double v16 = v13;
    }
    else {
      double v16 = v14;
    }
    uint64_t v17 = [(UILabel *)*p_detailLabel text];
    uint64_t v18 = [v17 length];

    if (v18) {
      double v19 = v16;
    }
    else {
      double v19 = 0.0;
    }
    double v20 = v13 - v19;
    -[UILabel sizeThatFits:](*p_descriptionLabel, "sizeThatFits:", v20, self->_singleIndicatorSize.height);
    double v22 = self->_singleIndicatorSize.height;
    double v23 = 7.0;
    if (v16 == 0.0) {
      double v23 = 0.0;
    }
    double v24 = v23 + v21;
    if (v24 >= v20) {
      double v25 = v20;
    }
    else {
      double v25 = v24;
    }
    v26 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v27 = [v26 userInterfaceLayoutDirection];

    if (v27 == 1) {
      double v28 = &self->_detailLabel;
    }
    else {
      double v28 = p_descriptionLabel;
    }
    if (v27 == 1) {
      double v29 = v16;
    }
    else {
      double v29 = v25;
    }
    if (v27 == 1) {
      double v30 = height;
    }
    else {
      double v30 = v22;
    }
    if (v27 == 1) {
      double v31 = p_descriptionLabel;
    }
    else {
      double v31 = &self->_detailLabel;
    }
    if (v27 == 1) {
      double v32 = v25;
    }
    else {
      double v32 = v16;
    }
    if (v27 == 1) {
      double height = v22;
    }
    -[UILabel setFrame:](*v28, "setFrame:", 0.0, 0.0, v29, v30);
    -[UILabel setFrame:](*v31, "setFrame:", v29, 0.0, v32, height);
    v33 = [MEMORY[0x1E4FB1438] sharedApplication];
    if ([v33 userInterfaceLayoutDirection] == 1)
    {
      v34 = [(CCUISensorAttributionCompactControl *)self chevronImageView];
      [v34 frame];
    }
    UIRectCenteredYInRect();
    CGRect v35 = [(CCUISensorAttributionCompactControl *)self window];
    v36 = [v35 screen];
    [v36 scale];
    UIRectIntegralWithScale();
    double x = v37;
    double y = v39;
    double width = v41;
    double v44 = v43;

    if (self->_expanded)
    {
      v45 = [MEMORY[0x1E4FB1438] sharedApplication];
      if ([v45 userInterfaceLayoutDirection] == 1) {
        double v46 = -108.0;
      }
      else {
        double v46 = 108.0;
      }

      v49.origin.double x = x;
      v49.origin.double y = y;
      v49.size.double width = width;
      v49.size.double height = v44;
      CGRect v50 = CGRectOffset(v49, v46, 72.0);
      double x = v50.origin.x;
      double y = v50.origin.y;
      double width = v50.size.width;
      double v44 = v50.size.height;
    }
    labelWrapperView = self->_labelWrapperView;
    -[SBFView setFrame:](labelWrapperView, "setFrame:", x, y, width, v44);
  }
}

- (UIImageView)chevronImageView
{
  return self->_chevronImageView;
}

- (void)_layoutChevronViews
{
  chevronWrapperView = self->_chevronWrapperView;
  if (chevronWrapperView)
  {
    [(UIView *)chevronWrapperView frame];
    double v4 = [(CCUISensorAttributionCompactControl *)self labelWrapperView];
    [v4 frame];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;

    double v13 = [MEMORY[0x1E4FB1438] sharedApplication];
    if ([v13 userInterfaceLayoutDirection] != 1)
    {
      v29.origin.double x = v6;
      v29.origin.double y = v8;
      v29.size.double width = v10;
      v29.size.double height = v12;
      CGRectGetWidth(v29);
      [(CCUISensorAttributionCompactControl *)self _visibleIndicatorsWidth];
    }

    [(CCUISensorAttributionCompactControl *)self bounds];
    UIRectCenteredYInRect();
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20 + 0.5;
    if (self->_expanded)
    {
      double v22 = [MEMORY[0x1E4FB1438] sharedApplication];
      double maximumAllowableWidth = 0.0;
      if ([v22 userInterfaceLayoutDirection] != 1) {
        double maximumAllowableWidth = self->_maximumAllowableWidth;
      }

      double v24 = [(CCUISensorAttributionCompactControl *)self superview];
      objc_msgSend(v24, "convertPoint:toView:", self, maximumAllowableWidth, 0.0);
      double v15 = v25;
    }
    -[UIView setFrame:](self->_chevronWrapperView, "setFrame:", v15, v21, v17, v19);
    BOOL v26 = [(CCUISensorAttributionCompactControl *)self activeIndicatorsCount] == 0;
    uint64_t v27 = self->_chevronWrapperView;
    [(UIView *)v27 setHidden:v26];
  }
}

- (BOOL)isDisplayingSensorStatus
{
  return [(CCUISensorAttributionCompactControl *)self activeIndicatorsCount] > 0
      || [(NSSet *)self->_attributions count]
      || self->_inactiveMicModeSelectionAttribution != 0;
}

- (double)_visibleIndicatorsWidth
{
  double v3 = self->_singleIndicatorSize.width
     * (double)[(CCUISensorAttributionCompactControl *)self activeIndicatorsCount];
  int v4 = [(CCUISensorAttributionCompactControl *)self activeIndicatorsCount];
  if (v4 <= 1) {
    int v5 = 1;
  }
  else {
    int v5 = v4;
  }
  return v3 + (double)(v5 - 1) * 4.0;
}

- (int)activeIndicatorsCount
{
  return self->_showingLocation
       + self->_showingCamera
       + self->_showingMicrophone
       + self->_showingInactiveMicrophone
       + self->_showingGameMode;
}

- (SBFView)labelWrapperView
{
  return self->_labelWrapperView;
}

- (void)setDetailText:(id)a3
{
}

- (void)setDescriptionText:(id)a3
{
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CCUISensorAttributionCompactControl;
  [(CCUISensorAttributionCompactControl *)&v3 layoutSubviews];
  [(CCUISensorAttributionCompactControl *)self _updateContentIfDisplayedAttributionsAreStaleAndLayout];
}

- (void)setMaximumAllowableWidth:(double)a3
{
  self->_double maximumAllowableWidth = a3;
}

- (void)sensorAttributionsChanged:(id)a3
{
}

- (void)inactiveMicModeSelectionAttributionChanged:(id)a3
{
}

- (void)gameModeStateDidChange:(unint64_t)a3
{
  self->_gameModeState = a3;
  [(CCUISensorAttributionCompactControl *)self _configureIndicatorView:self->_gameModeIndicatorView forGameModeState:a3];
}

- (void)_configureIndicatorView:(id)a3 forGameModeState:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v5 = objc_msgSend(a3, "subviews", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        CGFloat v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v10 tag] == 1)
        {
          gameModeState = (void *)self->_gameModeState;
          id v12 = v10;
          double v13 = CCUIIndicatorColorForGameModeState(gameModeState);
          [v12 setTintColor:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (CCUISensorAttributionCompactControl)initWithFrame:(CGRect)a3
{
  v42[1] = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)CCUISensorAttributionCompactControl;
  objc_super v3 = -[CCUISensorAttributionCompactControl initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v9 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    CGFloat v10 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.15];
    [(UIView *)v9 setBackgroundColor:v10];

    [(CCUISensorAttributionCompactControl *)v3 addSubview:v9];
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v9;
    id v12 = v9;

    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
    descriptionLabel = v3->_descriptionLabel;
    v3->_descriptionLabel = (UILabel *)v13;

    long long v15 = v3->_descriptionLabel;
    long long v16 = [(CCUISensorAttributionCompactControl *)v3 _fontForTitleLabel];
    [(UILabel *)v15 setFont:v16];

    [(UILabel *)v3->_descriptionLabel setAdjustsFontSizeToFitWidth:0];
    long long v17 = v3->_descriptionLabel;
    double v18 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v17 setTextColor:v18];

    [(UILabel *)v3->_descriptionLabel setUserInteractionEnabled:0];
    [(UILabel *)v3->_descriptionLabel setAdjustsFontForContentSizeCategory:0];
    [(UILabel *)v3->_descriptionLabel setAlpha:0.8];
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
    detailLabel = v3->_detailLabel;
    v3->_detailLabel = (UILabel *)v19;

    double v21 = v3->_detailLabel;
    double v22 = [(CCUISensorAttributionCompactControl *)v3 _fontForTitleLabel];
    [(UILabel *)v21 setFont:v22];

    [(UILabel *)v3->_detailLabel setAdjustsFontSizeToFitWidth:0];
    double v23 = v3->_detailLabel;
    double v24 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v23 setTextColor:v24];

    [(UILabel *)v3->_detailLabel setUserInteractionEnabled:0];
    [(UILabel *)v3->_detailLabel setAdjustsFontForContentSizeCategory:0];
    [(UILabel *)v3->_detailLabel setAlpha:0.5];
    double v25 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v25 setName:@"gaussianBlur"];
    uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA6058]), "initWithFrame:", v5, v6, v7, v8);
    labelWrapperView = v3->_labelWrapperView;
    v3->_labelWrapperView = (SBFView *)v26;

    double v28 = [(SBFView *)v3->_labelWrapperView layer];
    v42[0] = v25;
    CGRect v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
    [v28 setFilters:v29];

    [(SBFView *)v3->_labelWrapperView setAnimatedLayerProperties:&unk_1F2F4B770];
    [(CCUISensorAttributionCompactControl *)v3 _setBlurRadius:v3->_labelWrapperView ofView:0.0];
    [(SBFView *)v3->_labelWrapperView controlCenterApplyPrimaryContentShadow];
    [(SBFView *)v3->_labelWrapperView addSubview:v3->_descriptionLabel];
    [(SBFView *)v3->_labelWrapperView addSubview:v3->_detailLabel];
    [(CCUISensorAttributionCompactControl *)v3 addSubview:v3->_labelWrapperView];
    uint64_t v30 = [(CCUISensorAttributionCompactControl *)v3 _configureIndicatorViewForType:0 inactive:0];
    cameraIndicatorView = v3->_cameraIndicatorView;
    v3->_cameraIndicatorView = (UIView *)v30;

    uint64_t v32 = [(CCUISensorAttributionCompactControl *)v3 _configureIndicatorViewForType:1 inactive:0];
    micIndicatorView = v3->_micIndicatorView;
    v3->_micIndicatorView = (UIView *)v32;

    uint64_t v34 = [(CCUISensorAttributionCompactControl *)v3 _configureIndicatorViewForType:1 inactive:1];
    inactiveMicIndicatorView = v3->_inactiveMicIndicatorView;
    v3->_inactiveMicIndicatorView = (UIView *)v34;

    uint64_t v36 = [(CCUISensorAttributionCompactControl *)v3 _configureIndicatorViewForType:2 inactive:0];
    locationIndicatorView = v3->_locationIndicatorView;
    v3->_locationIndicatorView = (UIView *)v36;

    uint64_t v38 = [(CCUISensorAttributionCompactControl *)v3 _configureIndicatorViewForType:3 inactive:0];
    gameModeIndicatorView = v3->_gameModeIndicatorView;
    v3->_gameModeIndicatorView = (UIView *)v38;

    [(CCUISensorAttributionCompactControl *)v3 _configureChevronViews];
    [(CCUISensorAttributionCompactControl *)v3 addTarget:v3 action:sel_handleTouchDown forControlEvents:1];
    [(CCUISensorAttributionCompactControl *)v3 addTarget:v3 action:sel_handleTouchUpInside forControlEvents:64];
    [(CCUISensorAttributionCompactControl *)v3 addTarget:v3 action:sel_handleTouchCanceled forControlEvents:384];
  }
  return v3;
}

- (void)_decideToExpandOrCompactAndForwardToDelegate:(id)a3
{
  if (self->_touchUUID == a3)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v5 = v4 - self->_touchDownDate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    double v7 = WeakRetained;
    if (v5 <= 1.0) {
      [WeakRetained handleCompactControlExpansionEvent];
    }
    else {
      [WeakRetained handleCompactControlCompactionEvent];
    }

    touchUUID = self->_touchUUID;
    self->_touchUUID = 0;
  }
}

- (void)handleTouchDown
{
  objc_super v3 = [MEMORY[0x1E4F29128] UUID];
  objc_storeStrong((id *)&self->_touchUUID, v3);
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_touchDownDate = v4;
  dispatch_time_t v5 = dispatch_time(0, 200000000);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  CGFloat v10 = __54__CCUISensorAttributionCompactControl_handleTouchDown__block_invoke;
  double v11 = &unk_1E6A89968;
  id v12 = self;
  id v13 = v3;
  id v6 = v3;
  dispatch_after(v5, MEMORY[0x1E4F14428], &v8);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "handleCompactControlTouchBeganEvent", v8, v9, v10, v11, v12);
}

uint64_t __54__CCUISensorAttributionCompactControl_handleTouchDown__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _decideToExpandOrCompactAndForwardToDelegate:*(void *)(a1 + 40)];
}

- (void)handleTouchUpInside
{
}

- (void)handleTouchCanceled
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained handleCompactControlCompactionEvent];

  touchUUID = self->_touchUUID;
  self->_touchUUID = 0;
}

- (id)_configureIndicatorViewForType:(unint64_t)a3 inactive:(BOOL)a4
{
  double v7 = CCUIImageForSensorType(a3);
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v7];
  uint64_t v9 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  [v8 setTintColor:v9];

  CGAffineTransformMakeScale(&v23, 0.5, 0.5);
  [v8 setTransform:&v23];
  id v10 = objc_alloc(MEMORY[0x1E4FB1838]);
  double v11 = CCUIPlainCircleImage();
  id v12 = (void *)[v10 initWithImage:v11];

  [v12 setTag:1];
  if (a4) {
    [MEMORY[0x1E4FB1618] systemGrayColor];
  }
  else {
  id v13 = CCUIIndicatorColorForSensorType(a3);
  }
  [v12 setTintColor:v13];
  id v14 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [v12 bounds];
  long long v15 = objc_msgSend(v14, "initWithFrame:");
  [v15 setUserInteractionEnabled:0];
  [v15 addSubview:v12];
  [v15 addSubview:v8];
  [v15 sendSubviewToBack:v12];
  [v8 frame];
  [v12 bounds];
  UIRectCenteredRect();
  objc_msgSend(v8, "setFrame:");
  [v15 bounds];
  self->_singleIndicatorSize.double width = v16;
  self->_singleIndicatorSize.double height = v17;
  double v18 = CCUIIdentifierForSensorType(a3);
  [v15 setAccessibilityIdentifier:v18];

  uint64_t v19 = [v15 layer];
  [v19 setShouldRasterize:1];

  double v20 = [v15 layer];
  double v21 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v21 scale];
  objc_msgSend(v20, "setRasterizationScale:");

  [(CCUISensorAttributionCompactControl *)self addSubview:v15];

  return v15;
}

- (id)_rightChevronImage
{
  double v2 = [MEMORY[0x1E4F4F8B8] defaultFontProvider];
  objc_super v3 = [v2 preferredFontForTextStyle:*MEMORY[0x1E4FB2950] hiFontStyle:4];

  double v4 = [MEMORY[0x1E4FB1830] configurationWithFont:v3];
  dispatch_time_t v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.forward" withConfiguration:v4];
  id v6 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  double v7 = [v5 imageWithTintColor:v6 renderingMode:1];

  return v7;
}

- (void)_configureChevronViews
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1838]);
  double v4 = [(CCUISensorAttributionCompactControl *)self _rightChevronImage];
  dispatch_time_t v5 = (UIImageView *)[v3 initWithImage:v4];
  chevronImageView = self->_chevronImageView;
  self->_chevronImageView = v5;

  [(UIImageView *)self->_chevronImageView sizeToFit];
  id v7 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [(UIImageView *)self->_chevronImageView bounds];
  uint64_t v8 = (UIView *)objc_msgSend(v7, "initWithFrame:");
  chevronWrapperView = self->_chevronWrapperView;
  self->_chevronWrapperView = v8;

  [(UIImageView *)self->_chevronImageView setAutoresizingMask:18];
  [(UIImageView *)self->_chevronImageView setAlpha:0.25];
  [(UIView *)self->_chevronWrapperView addSubview:self->_chevronImageView];
  [(UIView *)self->_chevronWrapperView controlCenterApplyPrimaryContentShadow];
  [(CCUISensorAttributionCompactControl *)self _configureChevronWrapperAppearance];
  id v10 = self->_chevronWrapperView;

  [(CCUISensorAttributionCompactControl *)self addSubview:v10];
}

- (void)_configureChevronWrapperAppearance
{
  if (self->_expanded)
  {
    id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    CGFloat v4 = dbl_1D7BBF690[[v3 userInterfaceLayoutDirection] == 1];

    p_chevronWrapperView = &self->_chevronWrapperView;
    chevronWrapperView = self->_chevronWrapperView;
    CGAffineTransformMakeRotation(&v11, v4);
    [(UIView *)chevronWrapperView setTransform:&v11];
    double v7 = 0.0;
  }
  else
  {
    p_chevronWrapperView = &self->_chevronWrapperView;
    uint64_t v8 = self->_chevronWrapperView;
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v10[0] = *MEMORY[0x1E4F1DAB8];
    v10[1] = v9;
    v10[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(UIView *)v8 setTransform:v10];
    double v7 = 1.0;
  }
  [(UIView *)*p_chevronWrapperView setAlpha:v7];
}

- (id)clone
{
  id v3 = [CCUISensorAttributionCompactControl alloc];
  [(CCUISensorAttributionCompactControl *)self bounds];
  CGFloat v4 = -[CCUISensorAttributionCompactControl initWithFrame:](v3, "initWithFrame:");
  dispatch_time_t v5 = [(CCUISensorAttributionCompactControl *)self delegate];
  [(CCUISensorAttributionCompactControl *)v4 setDelegate:v5];

  [(CCUISensorAttributionCompactControl *)self maximumAllowableWidth];
  -[CCUISensorAttributionCompactControl setMaximumAllowableWidth:](v4, "setMaximumAllowableWidth:");
  [(CCUISensorAttributionCompactControl *)v4 setAlwaysHidesSensorIcons:1];
  [(CCUISensorAttributionCompactControl *)v4 gameModeStateDidChange:self->_gameModeState];
  [(CCUISensorAttributionCompactControl *)v4 sensorAttributionsChanged:self->_displayedAttributions];
  [(CCUISensorAttributionCompactControl *)v4 inactiveMicModeSelectionAttributionChanged:self->_displayedInactiveMicModeSelectionAttribution];
  [(CCUISensorAttributionCompactControl *)v4 _updateContentIfDisplayedAttributionsAreStaleAndLayout];
  [(CCUISensorAttributionCompactControl *)self frame];
  -[CCUISensorAttributionCompactControl setFrame:](v4, "setFrame:");

  return v4;
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  self->_expanded = a3;
  -[CCUISensorAttributionCompactControl _setLabelWrapperViewBlurAndAlphaForExpanded:animated:](self, "_setLabelWrapperViewBlurAndAlphaForExpanded:animated:");
  [(CCUISensorAttributionCompactControl *)self _setChevronAlphaForExpanded:v5 animated:v4];
  if (v5)
  {
    [(UIView *)self->_cameraIndicatorView setHidden:1];
    [(UIView *)self->_micIndicatorView setHidden:1];
    [(UIView *)self->_inactiveMicIndicatorView setHidden:1];
    [(UIView *)self->_locationIndicatorView setHidden:1];
  }
  else
  {
    [(UIView *)self->_inactiveMicIndicatorView setHidden:0];
    if (v4) {
      [(UIView *)self->_inactiveMicIndicatorView setAlpha:0.0];
    }
  }
  [(UIView *)self->_gameModeIndicatorView setHidden:v5];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__CCUISensorAttributionCompactControl_setExpanded_animated___block_invoke;
  aBlock[3] = &unk_1E6A89920;
  aBlock[4] = self;
  BOOL v13 = v5;
  double v7 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v8 = v7;
  if (v4)
  {
    long long v9 = (void *)MEMORY[0x1E4FB1EB0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__CCUISensorAttributionCompactControl_setExpanded_animated___block_invoke_2;
    _OWORD v10[3] = &unk_1E6A89B38;
    CGAffineTransform v11 = v7;
    [v9 animateWithDuration:6 delay:v10 usingSpringWithDamping:0 initialSpringVelocity:0.66 options:0.0 animations:50.0 completion:0.0];
  }
  else
  {
    v7[2](v7);
  }
}

uint64_t __60__CCUISensorAttributionCompactControl_setExpanded_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _layoutLabelViews];
  [*(id *)(a1 + 32) _layoutChevronViews];
  double v2 = *(void **)(*(void *)(a1 + 32) + 632);
  double v3 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v3 = 1.0;
  }

  return [v2 setAlpha:v3];
}

uint64_t __60__CCUISensorAttributionCompactControl_setExpanded_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_setChevronAlphaForExpanded:(BOOL)a3 animated:(BOOL)a4
{
  if (a4)
  {
    double v5 = 0.66;
    if (a3) {
      double v5 = 0.33;
    }
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __76__CCUISensorAttributionCompactControl__setChevronAlphaForExpanded_animated___block_invoke;
    v6[3] = &unk_1E6A898F8;
    v6[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:6 delay:v6 usingSpringWithDamping:0 initialSpringVelocity:v5 options:0.0 animations:50.0 completion:0.0];
  }
  else
  {
    [(CCUISensorAttributionCompactControl *)self _configureChevronWrapperAppearance];
  }
}

uint64_t __76__CCUISensorAttributionCompactControl__setChevronAlphaForExpanded_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureChevronWrapperAppearance];
}

- (void)_setLabelWrapperViewBlurAndAlphaForExpanded:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = [(CCUISensorAttributionCompactControl *)self delegate];
  uint64_t v8 = [v7 bundleIdentifierUsingAudioVideoControlsForSensorAttributionCompactControl:self];
  BOOL v9 = v8 != 0;

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __92__CCUISensorAttributionCompactControl__setLabelWrapperViewBlurAndAlphaForExpanded_animated___block_invoke;
  v13[3] = &unk_1E6A89F80;
  BOOL v14 = v5;
  v13[4] = self;
  BOOL v15 = v9;
  id v10 = _Block_copy(v13);
  CGAffineTransform v11 = v10;
  if (v4)
  {
    double v12 = 0.66;
    if (v5) {
      double v12 = 0.33;
    }
    [MEMORY[0x1E4FB1EB0] animateWithDuration:6 delay:v10 usingSpringWithDamping:0 initialSpringVelocity:v12 options:0.0 animations:50.0 completion:0.0];
  }
  else
  {
    (*((void (**)(void *))v10 + 2))(v10);
  }
}

uint64_t __92__CCUISensorAttributionCompactControl__setLabelWrapperViewBlurAndAlphaForExpanded_animated___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  double v3 = *(void **)(*(void *)(a1 + 32) + 544);
  if (v2)
  {
    double v4 = 0.0;
    if (!*(unsigned char *)(a1 + 41)) {
      double v4 = 1.0;
    }
    [v3 setAlpha:v4];
    [*(id *)(*(void *)(a1 + 32) + 584) setAlpha:0.0];
    BOOL v5 = *(void **)(a1 + 32);
    uint64_t v6 = v5[73];
    double v7 = 6.0;
  }
  else
  {
    double v8 = 1.0;
    if (!*(unsigned char *)(a1 + 41)) {
      double v8 = 0.0;
    }
    [v3 setAlpha:v8];
    [*(id *)(*(void *)(a1 + 32) + 584) setAlpha:1.0];
    BOOL v5 = *(void **)(a1 + 32);
    uint64_t v6 = v5[73];
    double v7 = 0.0;
  }

  return [v5 _setBlurRadius:v6 ofView:v7];
}

- (CGSize)intrinsicContentSize
{
  [(CCUISensorAttributionCompactControl *)self _updateContentIfDisplayedAttributionsAreStaleAndLayout];
  [(CCUISensorAttributionCompactControl *)self _visibleIndicatorsWidth];
  double v4 = v3;
  [(SBFView *)self->_labelWrapperView frame];
  double Width = CGRectGetWidth(v12);
  double v6 = 0.0;
  double v7 = 0.0;
  if (![(UIView *)self->_chevronWrapperView isHidden])
  {
    [(UIView *)self->_chevronWrapperView frame];
    double v7 = CGRectGetWidth(v13);
  }
  if (Width != 0.0)
  {
    double v8 = [(UILabel *)self->_descriptionLabel text];
    if ([v8 length]) {
      double v6 = 12.0;
    }
    else {
      double v6 = 0.0;
    }
  }
  double v9 = v4 + Width + v7 + v6;
  double height = self->_singleIndicatorSize.height;
  result.double height = height;
  result.double width = v9;
  return result;
}

- (id)_fontForTitleLabel
{
  return (id)[MEMORY[0x1E4FB08E0] systemFontOfSize:15.0 weight:*MEMORY[0x1E4FB09D0]];
}

- (void)_setBlurRadius:(double)a3 ofView:(id)a4
{
  id v6 = [a4 layer];
  BOOL v5 = [NSNumber numberWithDouble:a3];
  [v6 setValue:v5 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

- (void)setDelegate:(id)a3
{
}

- (double)maximumAllowableWidth
{
  return self->_maximumAllowableWidth;
}

- (void)setBackgroundView:(id)a3
{
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (NSString)detailText
{
  return self->_detailText;
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
}

- (void)setLabelWrapperView:(id)a3
{
}

- (void)setChevronImageView:(id)a3
{
}

- (UIView)chevronWrapperView
{
  return self->_chevronWrapperView;
}

- (void)setChevronWrapperView:(id)a3
{
}

- (BOOL)showingCamera
{
  return self->_showingCamera;
}

- (void)setShowingCamera:(BOOL)a3
{
  self->_showingCamera = a3;
}

- (BOOL)showingMicrophone
{
  return self->_showingMicrophone;
}

- (void)setShowingMicrophone:(BOOL)a3
{
  self->_showingMicrophone = a3;
}

- (BOOL)showingInactiveMicrophone
{
  return self->_showingInactiveMicrophone;
}

- (void)setShowingInactiveMicrophone:(BOOL)a3
{
  self->_showingInactiveMicrophone = a3;
}

- (BOOL)showingLocation
{
  return self->_showingLocation;
}

- (void)setShowingLocation:(BOOL)a3
{
  self->_showingLocation = a3;
}

- (BOOL)showingGameMode
{
  return self->_showingGameMode;
}

- (void)setShowingGameMode:(BOOL)a3
{
  self->_BOOL showingGameMode = a3;
}

- (unint64_t)gameModeState
{
  return self->_gameModeState;
}

- (void)setGameModeState:(unint64_t)a3
{
  self->_gameModeState = a3;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (BOOL)alwaysHidesSensorIcons
{
  return self->_alwaysHidesSensorIcons;
}

- (void)setAlwaysHidesSensorIcons:(BOOL)a3
{
  self->_alwaysHidesSensorIcons = a3;
}

- (UIView)cameraIndicatorView
{
  return self->_cameraIndicatorView;
}

- (UIView)micIndicatorView
{
  return self->_micIndicatorView;
}

- (UIView)inactiveMicIndicatorView
{
  return self->_inactiveMicIndicatorView;
}

- (UIView)locationIndicatorView
{
  return self->_locationIndicatorView;
}

- (UIView)gameModeIndicatorView
{
  return self->_gameModeIndicatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gameModeIndicatorView, 0);
  objc_storeStrong((id *)&self->_locationIndicatorView, 0);
  objc_storeStrong((id *)&self->_inactiveMicIndicatorView, 0);
  objc_storeStrong((id *)&self->_micIndicatorView, 0);
  objc_storeStrong((id *)&self->_cameraIndicatorView, 0);
  objc_storeStrong((id *)&self->_chevronWrapperView, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_labelWrapperView, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_touchUUID, 0);
  objc_storeStrong((id *)&self->_displayedInactiveMicModeSelectionAttribution, 0);
  objc_storeStrong((id *)&self->_inactiveMicModeSelectionAttribution, 0);
  objc_storeStrong((id *)&self->_displayedAttributions, 0);

  objc_storeStrong((id *)&self->_attributions, 0);
}

@end