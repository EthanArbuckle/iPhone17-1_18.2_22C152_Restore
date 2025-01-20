@interface HUGridServicePlaceholderCell
- (BOOL)shouldShowRoomName;
- (BOOL)showingUpdatingState;
- (id)_textConfiguration;
- (id)activityIndicator;
- (id)coloredDescriptionLabel;
- (id)descriptionLabelEffectView;
- (id)iconView;
- (id)serviceTextView;
- (unint64_t)iconDisplayStyle;
- (void)_setupServiceCell;
- (void)_updateSecondaryContentDisplayStyle;
- (void)displayStyleDidChange;
- (void)layoutSubviews;
- (void)setActivityIndicator:(id)a3;
- (void)setColoredDescriptionLabel:(id)a3;
- (void)setDescriptionLabelEffectView:(id)a3;
- (void)setIconView:(id)a3;
- (void)setServiceTextView:(id)a3;
- (void)setShouldShowRoomName:(BOOL)a3;
- (void)setShowingUpdatingState:(BOOL)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUGridServicePlaceholderCell

- (unint64_t)iconDisplayStyle
{
  return 2;
}

- (void)displayStyleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)HUGridServicePlaceholderCell;
  [(HUGridServiceCell *)&v3 displayStyleDidChange];
  [(HUGridServicePlaceholderCell *)self _updateSecondaryContentDisplayStyle];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)HUGridServicePlaceholderCell;
  -[HUGridServiceCell updateUIWithAnimation:](&v5, sel_updateUIWithAnimation_);
  [(HUGridServiceCell *)self _updateIconAnimated:v3];
  [(HUGridServiceCell *)self _updateText];
  [(HUGridServiceCell *)self _updateAccessoryView];
  [(HUGridServicePlaceholderCell *)self setNeedsLayout];
  [(HUGridServiceCell *)self setHasUpdatedUISinceLastReuse:1];
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)HUGridServicePlaceholderCell;
  [(HUGridServiceCell *)&v22 layoutSubviews];
  BOOL v3 = [(HUGridCell *)self layoutOptions];
  [v3 cellInnerMargin];
  double v5 = v4;

  uint64_t v6 = [(HUGridServicePlaceholderCell *)self effectiveUserInterfaceLayoutDirection];
  v7 = [(HUGridServicePlaceholderCell *)self iconView];
  v8 = [(HUGridCell *)self layoutOptions];
  [v8 iconSize];
  double v10 = v9;
  v11 = [(HUGridCell *)self layoutOptions];
  [v11 iconSize];
  objc_msgSend(v7, "sizeThatFits:", v10, v12);
  double v14 = v13;
  double v16 = v15;

  [(HUGridServicePlaceholderCell *)self contentView];
  if (v6 == 1) {
    v17 = {;
  }
    [v17 bounds];
    double v18 = CGRectGetMaxX(v23) - v5 - v14;
  }
  else {
    v17 = {;
  }
    [v17 bounds];
    double v18 = v5 + CGRectGetMinX(v24);
  }
  v19 = [(HUGridServicePlaceholderCell *)self contentView];
  [v19 bounds];
  double v20 = v5 + CGRectGetMinY(v25);
  v21 = [(HUGridServicePlaceholderCell *)self iconView];
  objc_msgSend(v21, "setFrame:", v18, v20, v14, v16);
}

- (void)_setupServiceCell
{
  v5.receiver = self;
  v5.super_class = (Class)HUGridServicePlaceholderCell;
  [(HUGridServiceCell *)&v5 _setupServiceCell];
  if (!+[HUGraphicsUtilities shouldReduceVisualEffects])
  {
    BOOL v3 = [MEMORY[0x1E4F427D8] effectWithStyle:6];
    double v4 = [(HUGridCell *)self gridBackgroundView];
    [v4 setOverrideBackgroundEffect:v3];
  }
}

- (id)_textConfiguration
{
  v2 = objc_alloc_init(HUGridServiceCellTextConfiguration);
  id v3 = objc_alloc(MEMORY[0x1E4F69568]);
  double v4 = +[HUAddAccessoryUtilities addAccessoryString];
  objc_super v5 = (void *)[v3 initWithRawServiceName:v4 rawRoomName:0];
  [(HUGridServiceCellTextConfiguration *)v2 setNameComponents:v5];

  return v2;
}

- (void)_updateSecondaryContentDisplayStyle
{
  BOOL v3 = [(HUGridServicePlaceholderCell *)self iconDisplayStyle] == 2;
  double v4 = [(HUGridServicePlaceholderCell *)self serviceTextView];
  [v4 setTextColorFollowsTintColor:v3];

  [(HUGridCell *)self secondaryContentDimmingFactor];
  double v6 = v5;
  v7 = [(HUGridServicePlaceholderCell *)self serviceTextView];
  [v7 setDescriptionTextColorDimmingFactor:v6];

  [(HUGridCell *)self secondaryContentDimmingFactor];
  double v9 = v8;
  double v10 = [(HUGridServiceCell *)self exclamationView];
  v11 = [v10 innerContentView];
  [v11 setAlpha:v9];

  id v13 = [(HUGridCell *)self secondaryContentEffect];
  double v12 = [(HUGridServiceCell *)self exclamationView];
  [v12 setEffect:v13];
}

- (id)serviceTextView
{
  return self->_serviceTextView;
}

- (void)setServiceTextView:(id)a3
{
}

- (id)descriptionLabelEffectView
{
  return self->_descriptionLabelEffectView;
}

- (void)setDescriptionLabelEffectView:(id)a3
{
}

- (id)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (BOOL)shouldShowRoomName
{
  return self->_shouldShowRoomName;
}

- (void)setShouldShowRoomName:(BOOL)a3
{
  self->_shouldShowRoomName = a3;
}

- (id)coloredDescriptionLabel
{
  return self->_coloredDescriptionLabel;
}

- (void)setColoredDescriptionLabel:(id)a3
{
}

- (BOOL)showingUpdatingState
{
  return self->_showingUpdatingState;
}

- (void)setShowingUpdatingState:(BOOL)a3
{
  self->_showingUpdatingState = a3;
}

- (id)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_coloredDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_descriptionLabelEffectView, 0);

  objc_storeStrong((id *)&self->_serviceTextView, 0);
}

@end