@interface HUGridServiceCell
+ (Class)layoutOptionsClass;
+ (id)_iconTintColor;
- (BOOL)disableContinuousIconAnimation;
- (BOOL)hasUpdatedUISinceLastReuse;
- (BOOL)prefixLabelShouldFeather;
- (BOOL)primaryLabelShouldFeather;
- (BOOL)recognizeDoubleClickGesture;
- (BOOL)secondaryLabelShouldFeather;
- (BOOL)shouldColorDescription;
- (BOOL)shouldShowLoadingState;
- (BOOL)shouldShowRoomName;
- (BOOL)showProgressIndicatorAfterDelay;
- (BOOL)showUpdatingStateAfterDelay;
- (BOOL)showingProgressIndicator;
- (BOOL)showingUpdatingState;
- (CGRect)iconViewTileFrame;
- (CGRect)prefixLabelTileFrame;
- (CGRect)primaryLabelTileFrame;
- (CGRect)secondaryLabelTileFrame;
- (CGRect)tileFrame;
- (HFItem)serviceItem;
- (HUGridServiceCell)initWithCoder:(id)a3;
- (HUGridServiceCell)initWithFrame:(CGRect)a3;
- (HUGridServiceCellTextView)serviceTextView;
- (HUIconView)iconView;
- (HUVisualEffectContainerView)exclamationView;
- (HUVisualEffectContainerView)firmwareUpdateView;
- (NACancelable)showProgressIndicatorAfterDelayToken;
- (NACancelable)showUpdatingStateAfterDelayToken;
- (UIActivityIndicatorView)activityIndicator;
- (UIColor)defaultDescriptionColor;
- (UIColor)defaultNameTextColor;
- (UIImageView)supplementaryImageView;
- (UILabel)coloredDescriptionLabel;
- (UIView)accessoryView;
- (UIView)overrideAccessoryView;
- (UIVisualEffectView)descriptionLabelEffectView;
- (double)backgroundCornerRadius;
- (id)_backgroundColorForSupplementaryIcon;
- (id)_descriptionTextAttributesWithColor:(id)a3;
- (id)_textConfiguration;
- (id)baseIconViewConfiguration;
- (id)createBackgroundBlurView;
- (id)prefixLabelFont;
- (id)prefixLabelOffTextColor;
- (id)prefixLabelOnTextColor;
- (id)prefixLabelTextColor;
- (id)prefixString;
- (id)primaryLabelFont;
- (id)primaryLabelOffTextColor;
- (id)primaryLabelOnTextColor;
- (id)primaryLabelTextColor;
- (id)primaryString;
- (id)secondaryAttributedString;
- (id)secondaryLabelFont;
- (id)secondaryLabelOffTextColor;
- (id)secondaryLabelOnTextColor;
- (id)secondaryLabelTextColor;
- (id)secondaryString;
- (unint64_t)backgroundDisplayStyle;
- (void)_createExclamationViewIfNecessary;
- (void)_createFirmwareUpdateViewIfNecessary;
- (void)_setupCommonServiceCell;
- (void)_setupServiceCell;
- (void)_updateAccessoryView;
- (void)_updateExclamationViewColor;
- (void)_updateIconAnimated:(BOOL)a3;
- (void)_updateSecondaryContentDisplayStyle;
- (void)_updateSupplementaryImageViewIfNecessary;
- (void)_updateText;
- (void)displayStyleDidChange;
- (void)dragStateDidChange:(int64_t)a3;
- (void)layoutOptionsDidChange;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)reclaimIconIfPossible;
- (void)renounceIcon;
- (void)setAccessoryView:(id)a3;
- (void)setActivityIndicator:(id)a3;
- (void)setColoredDescriptionLabel:(id)a3;
- (void)setDefaultDescriptionColor:(id)a3;
- (void)setDefaultNameTextColor:(id)a3;
- (void)setDescriptionLabelEffectView:(id)a3;
- (void)setDisableContinuousIconAnimation:(BOOL)a3;
- (void)setExclamationView:(id)a3;
- (void)setFirmwareUpdateView:(id)a3;
- (void)setHasUpdatedUISinceLastReuse:(BOOL)a3;
- (void)setIconView:(id)a3;
- (void)setOverrideAccessoryView:(id)a3;
- (void)setServiceItem:(id)a3;
- (void)setServiceTextView:(id)a3;
- (void)setShouldColorDescription:(BOOL)a3;
- (void)setShouldShowLoadingState:(BOOL)a3;
- (void)setShouldShowRoomName:(BOOL)a3;
- (void)setShowProgressIndicatorAfterDelay:(BOOL)a3;
- (void)setShowProgressIndicatorAfterDelayToken:(id)a3;
- (void)setShowUpdatingStateAfterDelay:(BOOL)a3;
- (void)setShowUpdatingStateAfterDelayToken:(id)a3;
- (void)setShowingProgressIndicator:(BOOL)a3;
- (void)setShowingUpdatingState:(BOOL)a3;
- (void)setSupplementaryImageView:(id)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUGridServiceCell

- (unint64_t)backgroundDisplayStyle
{
  return 1;
}

- (id)prefixString
{
  v2 = self;
  object = HUGridServiceCell.prefixString()().value._object;

  if (object)
  {
    v4 = (void *)sub_1BE9C49B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)primaryString
{
  v2 = self;
  v3 = [(HUGridServiceCell *)v2 serviceTextView];
  v4 = [(HUGridServiceCellTextView *)v3 serviceNameComponents];

  if (v4)
  {
    id v5 = [(HFServiceNameComponents *)v4 serviceName];

    sub_1BE9C49F8();
    v6 = (void *)sub_1BE9C49B8();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (id)secondaryString
{
  return 0;
}

- (id)secondaryAttributedString
{
  return 0;
}

- (CGRect)iconViewTileFrame
{
  v2 = self;
  v3 = [(HUGridServiceCell *)v2 iconView];
  [(HUIconView *)v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)prefixLabelTileFrame
{
  double v2 = sub_1BE4C7A64(self, (uint64_t)a2, (double (*)(void))HUGridServiceCell.prefixLabelTileFrame());
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)primaryLabelTileFrame
{
  double v2 = sub_1BE4C7A64(self, (uint64_t)a2, (double (*)(void))HUGridServiceCell.primaryLabelTileFrame());
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)secondaryLabelTileFrame
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)prefixLabelShouldFeather
{
  return 0;
}

- (BOOL)primaryLabelShouldFeather
{
  return 0;
}

- (BOOL)secondaryLabelShouldFeather
{
  return 0;
}

- (id)prefixLabelFont
{
  return sub_1BE4C7C08(self, (uint64_t)a2, (SEL *)&selRef_font);
}

- (id)primaryLabelFont
{
  return sub_1BE4C7C08(self, (uint64_t)a2, (SEL *)&selRef_font);
}

- (id)secondaryLabelFont
{
  return sub_1BE4C7C08(self, (uint64_t)a2, (SEL *)&selRef_font);
}

- (id)prefixLabelTextColor
{
  return sub_1BE4C7C08(self, (uint64_t)a2, (SEL *)&selRef_textColor);
}

- (id)primaryLabelTextColor
{
  return sub_1BE4C7C08(self, (uint64_t)a2, (SEL *)&selRef_textColor);
}

- (id)secondaryLabelTextColor
{
  return sub_1BE4C7C08(self, (uint64_t)a2, (SEL *)&selRef_textColor);
}

- (CGRect)tileFrame
{
  [(HUGridServiceCell *)self frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)backgroundCornerRadius
{
  double v2 = self;
  double v3 = [(HUGridCell *)v2 layoutOptions];
  if (v3)
  {
    double v4 = (HUGridServiceCell *)v3;
    [(HUGridCellLayoutOptions *)v3 cellCornerRadius];
    double v6 = v5;

    double v2 = v4;
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (id)createBackgroundBlurView
{
  return 0;
}

- (BOOL)recognizeDoubleClickGesture
{
  return 0;
}

- (id)baseIconViewConfiguration
{
  double v2 = self;
  HUGridServiceCell.baseIconViewConfiguration()((uint64_t)v10);

  uint64_t v3 = v11;
  if (v11)
  {
    double v4 = __swift_project_boxed_opaque_existential_1(v10, v11);
    uint64_t v5 = *(void *)(v3 - 8);
    MEMORY[0x1F4188790](v4);
    double v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v5 + 16))(v7);
    double v8 = (void *)sub_1BE9C5C08();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (id)prefixLabelOnTextColor
{
  return sub_1BE4C8170((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_blackColor);
}

- (id)primaryLabelOnTextColor
{
  return sub_1BE4C8170((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_blackColor);
}

- (id)secondaryLabelOnTextColor
{
  return sub_1BE4C8170((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_blackColor);
}

- (id)prefixLabelOffTextColor
{
  return sub_1BE4C8170((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_whiteColor);
}

- (id)primaryLabelOffTextColor
{
  return sub_1BE4C8170((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_whiteColor);
}

- (id)secondaryLabelOffTextColor
{
  return sub_1BE4C8170((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_whiteColor);
}

- (HUGridServiceCell)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUGridServiceCell;
  uint64_t v3 = [(HUGridCell *)&v6 initWithCoder:a3];
  double v4 = v3;
  if (v3) {
    [(HUGridServiceCell *)v3 _setupServiceCell];
  }
  return v4;
}

- (HUGridServiceCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUGridServiceCell;
  uint64_t v3 = -[HUGridCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3) {
    [(HUGridServiceCell *)v3 _setupServiceCell];
  }
  return v4;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)HUGridServiceCell;
  [(HUGridCell *)&v4 prepareForReuse];
  [(HUGridServiceCell *)self setServiceItem:0];
  [(HUGridServiceCell *)self setShowProgressIndicatorAfterDelay:0];
  [(HUGridServiceCell *)self setShowUpdatingStateAfterDelay:0];
  uint64_t v3 = [(HUGridServiceCell *)self iconView];
  objc_msgSend(v3, "updateWithIconDescriptor:displayStyle:animated:", 0, -[HUGridCell iconDisplayStyle](self, "iconDisplayStyle"), 0);

  [(HUGridServiceCell *)self setAccessoryView:0];
  [(HUGridServiceCell *)self setShouldColorDescription:1];
  [(HUGridServiceCell *)self setHasUpdatedUISinceLastReuse:0];
  self->_shouldShowRoomName = 1;
}

- (void)_setupServiceCell
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F6A428]);
  [(HUGridServiceCell *)self setIconView:v3];

  objc_super v4 = [(id)objc_opt_class() _iconTintColor];
  uint64_t v5 = [(HUGridServiceCell *)self iconView];
  [v5 setTintColor:v4];

  objc_super v6 = [(HUGridServiceCell *)self contentView];
  double v7 = [(HUGridServiceCell *)self iconView];
  [v6 addSubview:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4F42AA0]);
  [(HUGridServiceCell *)self setSupplementaryImageView:v8];

  double v9 = [(HUGridServiceCell *)self contentView];
  double v10 = [(HUGridServiceCell *)self supplementaryImageView];
  [v9 addSubview:v10];

  uint64_t v11 = [(HUGridServiceCell *)self supplementaryImageView];
  [v11 setHidden:1];

  [(HUGridServiceCell *)self _setupCommonServiceCell];
}

- (void)_setupCommonServiceCell
{
  [(HUGridServiceCell *)self setShouldColorDescription:1];
  id v3 = [MEMORY[0x1E4F428B8] systemGrayColor];
  [(HUGridServiceCell *)self setDefaultDescriptionColor:v3];

  [(HUGridServiceCell *)self setShouldShowLoadingState:1];
  self->_shouldShowRoomName = 1;
  objc_super v4 = objc_alloc_init(HUGridServiceCellTextView);
  [(HUGridServiceCell *)self setServiceTextView:v4];

  uint64_t v5 = [(HUGridCell *)self gridForegroundContentView];
  objc_super v6 = [(HUGridServiceCell *)self serviceTextView];
  [v5 addSubview:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  [(HUGridServiceCell *)self setColoredDescriptionLabel:v7];

  id v8 = [(HUGridServiceCell *)self coloredDescriptionLabel];
  [v8 setNumberOfLines:1];

  uint64_t v9 = [MEMORY[0x1E4F69138] isHomeControlService] ^ 1;
  double v10 = [(HUGridServiceCell *)self coloredDescriptionLabel];
  [v10 setAllowsDefaultTighteningForTruncation:v9];

  uint64_t v11 = [MEMORY[0x1E4F69138] isHomeControlService] ^ 1;
  double v12 = [(HUGridServiceCell *)self coloredDescriptionLabel];
  [v12 setAdjustsFontSizeToFitWidth:v11];

  +[HUGridServiceCellTextView minimumDescriptionScaleFactor];
  double v14 = v13;
  double v15 = [(HUGridServiceCell *)self coloredDescriptionLabel];
  [v15 setMinimumScaleFactor:v14];

  v16 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:0];
  [(HUGridServiceCell *)self setDescriptionLabelEffectView:v16];

  v17 = [(HUGridServiceCell *)self descriptionLabelEffectView];
  v18 = [v17 contentView];
  v19 = [(HUGridServiceCell *)self coloredDescriptionLabel];
  [v18 addSubview:v19];

  v20 = [(HUGridServiceCell *)self contentView];
  v21 = [(HUGridServiceCell *)self descriptionLabelEffectView];
  [v20 addSubview:v21];

  v22 = [(HUGridServiceCell *)self descriptionLabelEffectView];
  [v22 setHidden:1];

  id v23 = objc_alloc(MEMORY[0x1E4F42708]);
  if ([MEMORY[0x1E4F69138] isSpringBoard]) {
    uint64_t v24 = 8;
  }
  else {
    uint64_t v24 = 100;
  }
  v25 = (void *)[v23 initWithActivityIndicatorStyle:v24];
  [(HUGridServiceCell *)self setActivityIndicator:v25];

  v26 = [MEMORY[0x1E4F428B8] systemGrayColor];
  v27 = [(HUGridServiceCell *)self activityIndicator];
  [v27 setColor:v26];

  v28 = [(HUGridServiceCell *)self activityIndicator];
  [v28 setHidesWhenStopped:1];

  [(HUGridServiceCell *)self _updateAccessoryView];
}

- (void)setAccessoryView:(id)a3
{
  [(HUGridServiceCell *)self setOverrideAccessoryView:a3];

  [(HUGridServiceCell *)self _updateAccessoryView];
}

- (BOOL)showUpdatingStateAfterDelay
{
  if ([(HUGridServiceCell *)self showingUpdatingState]) {
    return 1;
  }
  objc_super v4 = [(HUGridServiceCell *)self showUpdatingStateAfterDelayToken];
  BOOL v3 = v4 != 0;

  return v3;
}

- (void)setShowUpdatingStateAfterDelay:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(HUGridServiceCell *)self showUpdatingStateAfterDelayToken];
  objc_super v6 = v5;
  if (v3)
  {

    if (!v6)
    {
      objc_initWeak(&location, self);
      id v7 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      uint64_t v11 = __52__HUGridServiceCell_setShowUpdatingStateAfterDelay___block_invoke;
      double v12 = &unk_1E63862A0;
      objc_copyWeak(&v13, &location);
      id v8 = [v7 afterDelay:&v9 performBlock:1.0];
      -[HUGridServiceCell setShowUpdatingStateAfterDelayToken:](self, "setShowUpdatingStateAfterDelayToken:", v8, v9, v10, v11, v12);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [v5 cancel];

    [(HUGridServiceCell *)self setShowUpdatingStateAfterDelayToken:0];
    [(HUGridServiceCell *)self setShowingUpdatingState:0];
  }
}

void __52__HUGridServiceCell_setShowUpdatingStateAfterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setShowingUpdatingState:1];
  [WeakRetained setShowUpdatingStateAfterDelayToken:0];
}

- (BOOL)showProgressIndicatorAfterDelay
{
  if ([(HUGridServiceCell *)self showingProgressIndicator]) {
    return 1;
  }
  objc_super v4 = [(HUGridServiceCell *)self showProgressIndicatorAfterDelayToken];
  BOOL v3 = v4 != 0;

  return v3;
}

- (void)setShowProgressIndicatorAfterDelay:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(HUGridServiceCell *)self showProgressIndicatorAfterDelayToken];
  objc_super v6 = v5;
  if (v3)
  {

    if (!v6)
    {
      objc_initWeak(&location, self);
      id v7 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      uint64_t v11 = __56__HUGridServiceCell_setShowProgressIndicatorAfterDelay___block_invoke;
      double v12 = &unk_1E63862A0;
      objc_copyWeak(&v13, &location);
      id v8 = [v7 afterDelay:&v9 performBlock:0.5];
      -[HUGridServiceCell setShowProgressIndicatorAfterDelayToken:](self, "setShowProgressIndicatorAfterDelayToken:", v8, v9, v10, v11, v12);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [v5 cancel];

    [(HUGridServiceCell *)self setShowProgressIndicatorAfterDelayToken:0];
    [(HUGridServiceCell *)self setShowingProgressIndicator:0];
  }
}

void __56__HUGridServiceCell_setShowProgressIndicatorAfterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setShowingProgressIndicator:1];
  [WeakRetained setShowProgressIndicatorAfterDelayToken:0];
}

- (void)setShowingUpdatingState:(BOOL)a3
{
  self->_showingUpdatingState = a3;
  [(HUGridServiceCell *)self _updateText];
  [(HUGridServiceCell *)self _updateAccessoryView];
  objc_super v4 = [(HUGridServiceCell *)self showUpdatingStateAfterDelayToken];
  [v4 cancel];

  [(HUGridServiceCell *)self setShowUpdatingStateAfterDelayToken:0];
}

- (void)setShowingProgressIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showingProgressIndicator = a3;
  [(HUGridServiceCell *)self _updateAccessoryView];
  uint64_t v5 = [(HUGridServiceCell *)self activityIndicator];
  objc_super v6 = v5;
  if (v3) {
    [v5 startAnimating];
  }
  else {
    [v5 stopAnimating];
  }

  id v7 = [(HUGridServiceCell *)self showProgressIndicatorAfterDelayToken];
  [v7 cancel];

  [(HUGridServiceCell *)self setShowProgressIndicatorAfterDelayToken:0];
}

- (BOOL)disableContinuousIconAnimation
{
  double v2 = [(HUGridServiceCell *)self iconView];
  char v3 = [v2 disableContinuousAnimation];

  return v3;
}

- (void)setDisableContinuousIconAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HUGridServiceCell *)self iconView];
  [v4 setDisableContinuousAnimation:v3];
}

- (void)setShouldColorDescription:(BOOL)a3
{
  if (self->_shouldColorDescription != a3)
  {
    self->_shouldColorDescription = a3;
    id v4 = [(HUGridServiceCell *)self item];

    if (v4)
    {
      [(HUGridServiceCell *)self updateUIWithAnimation:0];
    }
  }
}

- (void)setShouldShowRoomName:(BOOL)a3
{
  if (self->_shouldShowRoomName != a3)
  {
    self->_shouldShowRoomName = a3;
    id v4 = [(HUGridServiceCell *)self item];

    if (v4)
    {
      [(HUGridServiceCell *)self updateUIWithAnimation:0];
    }
  }
}

+ (Class)layoutOptionsClass
{
  return (Class)objc_opt_class();
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HUGridServiceCell *)self item];
  v18[0] = *MEMORY[0x1E4F689E8];
  objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  char v7 = [v5 resultsContainRequiredProperties:v6];

  if (v7)
  {
    v17.receiver = self;
    v17.super_class = (Class)HUGridServiceCell;
    [(HUGridCell *)&v17 updateUIWithAnimation:v3];
    [(HUGridServiceCell *)self _updateIconAnimated:v3];
    if ([(HUGridServiceCell *)self shouldShowLoadingState])
    {
      id v8 = [(HUGridServiceCell *)self item];
      unint64_t v9 = ((unint64_t)[v8 loadingState] >> 1) & 1;
    }
    else
    {
      unint64_t v9 = 0;
    }
    if ([(HUGridServiceCell *)self shouldShowLoadingState])
    {
      uint64_t v11 = [(HUGridServiceCell *)self item];
      uint64_t v12 = [v11 loadingState] & 1;
    }
    else
    {
      uint64_t v12 = 0;
    }
    if ([(HUGridServiceCell *)self hasUpdatedUISinceLastReuse])
    {
      [(HUGridServiceCell *)self setShowProgressIndicatorAfterDelay:v9];
      id v13 = [(HUGridServiceCell *)self item];
      double v14 = [v13 latestResults];
      double v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F68CA8]];
      int v16 = [v15 BOOLValue];

      if (!v16)
      {
        [(HUGridServiceCell *)self setShowUpdatingStateAfterDelay:v12];
LABEL_14:
        [(HUGridServiceCell *)self _updateText];
        [(HUGridServiceCell *)self _updateAccessoryView];
        [(HUGridServiceCell *)self setNeedsLayout];
        goto LABEL_15;
      }
    }
    else
    {
      [(HUGridServiceCell *)self setShowingProgressIndicator:v9];
    }
    [(HUGridServiceCell *)self setShowingUpdatingState:v12];
    goto LABEL_14;
  }
  uint64_t v10 = [(HUGridServiceCell *)self serviceTextView];
  [v10 setServiceNameComponents:0];

  [(HUGridServiceCell *)self _updateIconAnimated:v3];
LABEL_15:
  [(HUGridServiceCell *)self setHasUpdatedUISinceLastReuse:1];
}

- (void)renounceIcon
{
  id v2 = [(HUGridServiceCell *)self iconView];
  [v2 renounceIconIfPossible];
}

- (void)reclaimIconIfPossible
{
  id v2 = [(HUGridServiceCell *)self iconView];
  [v2 reclaimIconIfPossible];
}

- (void)_updateIconAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(HUGridCell *)self layoutOptions];
  uint64_t v6 = [v5 iconContentMode];
  char v7 = [(HUGridServiceCell *)self iconView];
  [v7 setContentMode:v6];

  id v11 = [(HUGridServiceCell *)self iconView];
  id v8 = [(HUGridServiceCell *)self item];
  unint64_t v9 = [v8 latestResults];
  uint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F689E8]];
  objc_msgSend(v11, "updateWithIconDescriptor:displayStyle:animated:", v10, -[HUGridCell iconDisplayStyle](self, "iconDisplayStyle"), v3);
}

- (void)layoutOptionsDidChange
{
  v14.receiver = self;
  v14.super_class = (Class)HUGridServiceCell;
  [(HUGridCell *)&v14 layoutOptionsDidChange];
  BOOL v3 = [(HUGridCell *)self layoutOptions];
  id v4 = [v3 font];
  uint64_t v5 = [(HUGridServiceCell *)self serviceTextView];
  [v5 setFont:v4];

  uint64_t v6 = [(HUGridCell *)self layoutOptions];
  [v6 lineSpacing];
  double v8 = v7;
  unint64_t v9 = [(HUGridServiceCell *)self serviceTextView];
  [v9 setLineHeight:v8];

  uint64_t v10 = [(HUGridCell *)self layoutOptions];
  id v11 = [v10 iconVibrancyEffect];
  uint64_t v12 = v11;
  if (!v11)
  {
    uint64_t v5 = [(HUGridCell *)self layoutOptions];
    uint64_t v12 = [v5 vibrancyEffect];
  }
  id v13 = [(HUGridServiceCell *)self iconView];
  [v13 setVibrancyEffect:v12];

  if (!v11)
  {
  }
  [(HUGridServiceCell *)self _updateText];
  [(HUGridServiceCell *)self setNeedsLayout];
}

- (void)displayStyleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)HUGridServiceCell;
  [(HUGridCell *)&v3 displayStyleDidChange];
  [(HUGridServiceCell *)self _updateSecondaryContentDisplayStyle];
}

- (void)layoutSubviews
{
  v126[1] = *MEMORY[0x1E4F143B8];
  v125.receiver = self;
  v125.super_class = (Class)HUGridServiceCell;
  [(HUGridCell *)&v125 layoutSubviews];
  objc_super v3 = [(HUGridCell *)self layoutOptions];
  [v3 cellInnerMargin];
  CGFloat v5 = v4;

  uint64_t v6 = [(HUGridCell *)self layoutOptions];
  int v7 = [v6 shouldShowIconOnly];

  if (v7)
  {
    double v8 = [(HUGridServiceCell *)self contentView];
    [v8 bounds];
    CGRectInset(v127, v5, v5);

    unint64_t v9 = [(HUGridServiceCell *)self contentView];
    [v9 bounds];
    UIRectCenteredIntegralRect();
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    v18 = [(HUGridServiceCell *)self iconView];
    objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

    [(HUGridServiceCell *)self _updateSupplementaryImageViewIfNecessary];
  }
  else
  {
    uint64_t v19 = [(HUGridServiceCell *)self effectiveUserInterfaceLayoutDirection];
    v20 = [(HUGridCell *)self layoutOptions];
    if ([v20 shouldShowDescription]) {
      double v21 = v5;
    }
    else {
      double v21 = v5 * 0.8;
    }

    v22 = [(HUGridServiceCell *)self contentView];
    [v22 bounds];
    double MaxY = CGRectGetMaxY(v128);

    uint64_t v24 = [(HUGridServiceCell *)self serviceTextView];
    [v24 sizeToFit];

    v25 = [(HUGridCell *)self layoutOptions];
    char v26 = [v25 shouldShowDescription];
    v27 = [(HUGridServiceCell *)self serviceTextView];
    [v27 frame];
    double Height = CGRectGetHeight(v129);
    if ((v26 & 1) == 0)
    {
      v29 = [(HUGridServiceCell *)self serviceTextView];
      [v29 lineHeight];
      double Height = Height - v30;
    }
    double v31 = MaxY - v21;

    v32 = [(HUGridCell *)self layoutOptions];
    char v33 = [v32 shouldShowDescription];
    v34 = [(HUGridServiceCell *)self serviceTextView];
    v35 = v34;
    if (v33) {
      [v34 lastBaselineToBottomDistance];
    }
    else {
      [v34 lineHeight];
    }
    double v37 = v36;

    v38 = [(HUGridServiceCell *)self contentView];
    [v38 bounds];
    CGFloat v39 = v5 + CGRectGetMinX(v130);
    v40 = [(HUGridServiceCell *)self serviceTextView];
    [v40 frame];
    CGFloat v41 = CGRectGetHeight(v131);
    double v42 = HURoundToScreenScale(v37 + v31 - v41);
    v43 = [(HUGridServiceCell *)self contentView];
    [v43 bounds];
    CGFloat v44 = CGRectGetWidth(v132) + v5 * -2.0;
    v45 = [(HUGridServiceCell *)self serviceTextView];
    objc_msgSend(v45, "setFrame:", v39, v42, v44, Height);

    v46 = [(HUGridCell *)self layoutOptions];
    LODWORD(v40) = [v46 shouldShowDescription];

    if (v40)
    {
      v47 = [(HUGridServiceCell *)self coloredDescriptionLabel];
      [v47 sizeToFit];

      v48 = [(HUGridServiceCell *)self contentView];
      [v48 bounds];
      CGFloat v49 = v5 + CGRectGetMinX(v133);
      v50 = [(HUGridServiceCell *)self coloredDescriptionLabel];
      [v50 _lastLineBaseline];
      double v52 = HURoundToScreenScale(v31 - v51);
      v53 = [(HUGridServiceCell *)self contentView];
      [v53 bounds];
      CGFloat v54 = CGRectGetWidth(v134) + v5 * -2.0;
      v55 = [(HUGridServiceCell *)self coloredDescriptionLabel];
      [v55 bounds];
      double v56 = CGRectGetHeight(v135);
      v57 = [(HUGridServiceCell *)self descriptionLabelEffectView];
      objc_msgSend(v57, "setFrame:", v49, v52, v54, v56);

      v58 = [(HUGridServiceCell *)self descriptionLabelEffectView];
      [v58 bounds];
      double v60 = v59;
      double v62 = v61;
      double v64 = v63;
      double v66 = v65;
      v67 = [(HUGridServiceCell *)self coloredDescriptionLabel];
      objc_msgSend(v67, "setFrame:", v60, v62, v64, v66);
    }
    v68 = [(HUGridServiceCell *)self item];
    uint64_t v69 = *MEMORY[0x1E4F689E8];
    v126[0] = *MEMORY[0x1E4F689E8];
    v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v126 count:1];
    int v71 = [v68 resultsContainRequiredProperties:v70];

    if (v71)
    {
      v72 = [(HUGridServiceCell *)self item];
      v73 = [v72 latestResults];
      v74 = [v73 objectForKeyedSubscript:v69];

      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      char isKindOfClass = 0;
    }
    v76 = [(HUGridServiceCell *)self serviceTextView];
    [v76 frame];
    CGFloat v77 = CGRectGetMinY(v136) - v5;
    v78 = [(HUGridCell *)self layoutOptions];
    [v78 iconToTitleSpacing];
    double v80 = v77 - v79;

    v81 = [(HUGridCell *)self layoutOptions];
    [v81 iconSize];
    double v83 = v82;

    if (v80 >= v83) {
      double v84 = v83;
    }
    else {
      double v84 = v80;
    }
    v85 = [(HUGridCell *)self layoutOptions];
    [v85 iconToTitleSpacing];
    double v87 = v5 + v84 + v86;

    v88 = [(HUGridServiceCell *)self contentView];
    [v88 bounds];
    double v90 = v89 + v5 * -2.0 - v84;

    if (isKindOfClass)
    {
      double v91 = v87;
    }
    else
    {
      v92 = [(HUGridServiceCell *)self iconView];
      v93 = v92;
      if (v84 >= v90) {
        double v94 = v90;
      }
      else {
        double v94 = v84;
      }
      if (v84 >= v87) {
        double v95 = v87;
      }
      else {
        double v95 = v84;
      }
      objc_msgSend(v92, "sizeThatFits:", v94, v95);
      double v90 = v96;
      double v91 = v97;
    }
    v98 = [(HUGridServiceCell *)self contentView];
    [v98 bounds];
    double v99 = v5 + CGRectGetMinY(v137);

    double v100 = (v87 - v84) * 0.5;
    if ((isKindOfClass & 1) == 0) {
      double v100 = 0.0;
    }
    double v101 = v99 - v100;
    v102 = [(HUGridServiceCell *)self contentView];
    [v102 bounds];
    if (v19 == 1) {
      double v107 = CGRectGetMaxX(*(CGRect *)&v103) - v5 - v90;
    }
    else {
      double v107 = v5 + CGRectGetMinX(*(CGRect *)&v103);
    }
    v108 = [(HUGridServiceCell *)self iconView];
    objc_msgSend(v108, "setFrame:", v107, v101, v90, v91);

    [(HUGridServiceCell *)self _updateSupplementaryImageViewIfNecessary];
    v109 = [(HUGridServiceCell *)self accessoryView];
    [v109 sizeToFit];

    v110 = [(HUGridServiceCell *)self accessoryView];
    [v110 frame];
    double v111 = CGRectGetHeight(v138);

    if (v111 >= v84) {
      double v111 = v84;
    }
    v112 = [(HUGridServiceCell *)self accessoryView];
    [v112 frame];
    double Width = CGRectGetWidth(v139);
    v114 = [(HUGridServiceCell *)self accessoryView];
    [v114 frame];
    double v115 = Width * (v111 / CGRectGetHeight(v140));

    v116 = [(HUGridServiceCell *)self contentView];
    [v116 bounds];
    if (v19 == 1) {
      double v121 = v5 + CGRectGetMinX(*(CGRect *)&v117);
    }
    else {
      double v121 = CGRectGetMaxX(*(CGRect *)&v117) - v5 - v115;
    }
    v122 = [(HUGridServiceCell *)self contentView];
    [v122 bounds];
    CGFloat v123 = v5 + CGRectGetMinY(v141);
    v124 = [(HUGridServiceCell *)self accessoryView];
    objc_msgSend(v124, "setFrame:", v121, v123, v115, v111);
  }
}

+ (id)_iconTintColor
{
  return (id)[MEMORY[0x1E4F428B8] systemGrayColor];
}

- (void)_updateText
{
  id v26 = [(HUGridServiceCell *)self _textConfiguration];
  objc_super v3 = [v26 nameComponents];
  double v4 = [(HUGridServiceCell *)self serviceTextView];
  [v4 setServiceNameComponents:v3];

  BOOL v5 = [(HUGridServiceCell *)self shouldShowRoomName];
  uint64_t v6 = [(HUGridServiceCell *)self serviceTextView];
  [v6 setShouldShowRoomName:v5];

  int v7 = [(HUGridCell *)self layoutOptions];
  LODWORD(v6) = [v7 shouldShowDescription];

  if (!v6)
  {
    double v11 = [(HUGridServiceCell *)self descriptionLabelEffectView];
    [v11 setHidden:1];

    double v12 = [(HUGridServiceCell *)self coloredDescriptionLabel];
    [v12 setAttributedText:0];
LABEL_7:

    uint64_t v19 = [(HUGridServiceCell *)self serviceTextView];
    [v19 setDescriptionText:0];
    goto LABEL_8;
  }
  double v8 = [v26 descriptionTextEffect];
  unint64_t v9 = [(HUGridServiceCell *)self descriptionLabelEffectView];
  [v9 setEffect:v8];

  double v10 = [v26 descriptionTextColor];
  if (v10)
  {

LABEL_6:
    double v14 = [v26 descriptionText];
    double v15 = [v26 descriptionTextColor];
    double v16 = [(HUGridServiceCell *)self _descriptionTextAttributesWithColor:v15];
    double v17 = [v14 stringWithAttributes:v16];
    v18 = [(HUGridServiceCell *)self coloredDescriptionLabel];
    [v18 setAttributedText:v17];

    double v12 = [(HUGridServiceCell *)self descriptionLabelEffectView];
    [v12 setHidden:0];
    goto LABEL_7;
  }
  double v13 = [v26 descriptionTextEffect];

  if (v13) {
    goto LABEL_6;
  }
  v22 = [(HUGridServiceCell *)self descriptionLabelEffectView];
  [v22 setHidden:1];

  uint64_t v19 = [v26 descriptionText];
  id v23 = [v19 stringWithAttributes:MEMORY[0x1E4F1CC08]];
  uint64_t v24 = [v23 string];
  v25 = [(HUGridServiceCell *)self serviceTextView];
  [v25 setDescriptionText:v24];

LABEL_8:
  v20 = [v26 nameTextColor];
  double v21 = [(HUGridServiceCell *)self serviceTextView];
  [v21 setTextColor:v20];
}

- (id)_descriptionTextAttributesWithColor:(id)a3
{
  double v4 = (objc_class *)MEMORY[0x1E4F42670];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  int v7 = [(HUGridCell *)self layoutOptions];
  [v7 lineSpacing];
  objc_msgSend(v6, "setMinimumLineHeight:");

  double v8 = [(HUGridCell *)self layoutOptions];
  [v8 lineSpacing];
  objc_msgSend(v6, "setMaximumLineHeight:");

  [v6 setLineBreakMode:4];
  objc_msgSend(v6, "setAllowsDefaultTighteningForTruncation:", objc_msgSend(MEMORY[0x1E4F69138], "isHomeControlService") ^ 1);
  unint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  double v10 = [(HUGridCell *)self layoutOptions];
  double v11 = [v10 font];
  objc_msgSend(v9, "na_safeSetObject:forKey:", v11, *MEMORY[0x1E4F42508]);

  objc_msgSend(v9, "na_safeSetObject:forKey:", v5, *MEMORY[0x1E4F42510]);
  objc_msgSend(v9, "na_safeSetObject:forKey:", v6, *MEMORY[0x1E4F42540]);

  return v9;
}

- (id)_textConfiguration
{
  objc_super v3 = objc_alloc_init(HUGridServiceCellTextConfiguration);
  double v4 = [(HUGridServiceCell *)self item];
  id v5 = [v4 latestResults];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68A60]];
  [(HUGridServiceCellTextConfiguration *)v3 setNameComponents:v6];

  int v7 = [(HUGridServiceCell *)self item];
  double v8 = [v7 latestResults];
  unint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
  [(HUGridServiceCellTextConfiguration *)v3 setDescriptionText:v9];

  double v10 = [(HUGridServiceCell *)self item];
  double v11 = [v10 latestResults];
  double v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F68988]];

  if (v12) {
    uint64_t v13 = [v12 integerValue];
  }
  else {
    uint64_t v13 = 0;
  }
  double v14 = [(HUGridServiceCell *)self item];
  double v15 = [v14 latestResults];
  double v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F68A28]];

  if (v16) {
    uint64_t v17 = [v16 integerValue];
  }
  else {
    uint64_t v17 = 0;
  }
  unint64_t v18 = [(HUGridCell *)self backgroundState];
  if (v18 == 1)
  {
    uint64_t v19 = [(HUGridServiceCell *)self defaultDescriptionColor];
    [(HUGridServiceCellTextConfiguration *)v3 setDescriptionTextColor:v19];
  }
  else
  {
    [(HUGridServiceCellTextConfiguration *)v3 setDescriptionTextColor:0];
  }
  if ([(HUGridServiceCell *)self showingUpdatingState])
  {
    if ([MEMORY[0x1E4F69758] shouldSuppressAllErrorsForDemo]) {
      goto LABEL_21;
    }
    v20 = _HULocalizedStringWithDefaultValue(@"HUGridServiceCellReadingDescription", @"HUGridServiceCellReadingDescription", 1);
    [(HUGridServiceCellTextConfiguration *)v3 setDescriptionText:v20];
    goto LABEL_20;
  }
  if ([(HUGridServiceCell *)self shouldColorDescription])
  {
    if (v17 >= 2 && v18 == 1)
    {
      uint64_t v21 = [MEMORY[0x1E4F428B8] systemRedColor];
    }
    else
    {
      uint64_t v21 = [(HUGridServiceCell *)self defaultNameTextColor];
    }
    v22 = (void *)v21;
    [(HUGridServiceCellTextConfiguration *)v3 setNameTextColor:v21];

    if (v13 == 1)
    {
      v20 = [MEMORY[0x1E4F428B8] systemRedColor];
      [(HUGridServiceCellTextConfiguration *)v3 setDescriptionTextColor:v20];
LABEL_20:
    }
  }
LABEL_21:
  id v23 = [(HUGridServiceCellTextConfiguration *)v3 descriptionTextColor];
  if (v23)
  {
LABEL_29:

    goto LABEL_30;
  }
  uint64_t v24 = [(HUGridCell *)self contentEffect];
  v25 = [(HUGridCell *)self secondaryContentEffect];
  id v23 = v24;
  id v26 = v25;
  if (v23 == v26)
  {

    goto LABEL_29;
  }
  v27 = v26;
  if (!v23)
  {

    goto LABEL_28;
  }
  char v28 = [v23 isEqual:v26];

  if ((v28 & 1) == 0)
  {
LABEL_28:
    id v23 = [(HUGridCell *)self secondaryContentEffect];
    [(HUGridServiceCellTextConfiguration *)v3 setDescriptionTextEffect:v23];
    goto LABEL_29;
  }
LABEL_30:

  return v3;
}

- (void)_updateSecondaryContentDisplayStyle
{
  BOOL v3 = [(HUGridCell *)self iconDisplayStyle] == 2;
  double v4 = [(HUGridServiceCell *)self serviceTextView];
  [v4 setTextColorFollowsTintColor:v3];

  [(HUGridCell *)self secondaryContentDimmingFactor];
  double v6 = v5;
  int v7 = [(HUGridServiceCell *)self serviceTextView];
  [v7 setDescriptionTextColorDimmingFactor:v6];

  [(HUGridCell *)self secondaryContentDimmingFactor];
  double v9 = v8;
  double v10 = [(HUGridServiceCell *)self exclamationView];
  double v11 = [v10 innerContentView];
  [v11 setAlpha:v9];

  double v12 = [(HUGridCell *)self secondaryContentEffect];
  uint64_t v13 = [(HUGridServiceCell *)self exclamationView];
  [v13 setEffect:v12];

  [(HUGridCell *)self secondaryContentDimmingFactor];
  double v15 = v14;
  double v16 = [(HUGridServiceCell *)self firmwareUpdateView];
  uint64_t v17 = [v16 innerContentView];
  [v17 setAlpha:v15];

  id v19 = [(HUGridCell *)self secondaryContentEffect];
  unint64_t v18 = [(HUGridServiceCell *)self firmwareUpdateView];
  [v18 setEffect:v19];
}

- (void)_updateAccessoryView
{
  BOOL v3 = [(HUGridCell *)self layoutOptions];
  int v4 = [v3 shouldShowAccessoryView];

  if (!v4) {
    return;
  }
  uint64_t v5 = [(HUGridServiceCell *)self overrideAccessoryView];
  if (!v5)
  {
    if ([(HUGridServiceCell *)self showingProgressIndicator])
    {
      uint64_t v6 = [(HUGridServiceCell *)self activityIndicator];
    }
    else
    {
      int v7 = [(HUGridServiceCell *)self item];
      double v8 = [v7 latestResults];
      uint64_t v9 = *MEMORY[0x1E4F68940];
      double v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F68940]];
      uint64_t v11 = [v10 integerValue];

      if (v11 == 8)
      {
        [(HUGridServiceCell *)self _createFirmwareUpdateViewIfNecessary];
        uint64_t v6 = [(HUGridServiceCell *)self firmwareUpdateView];
      }
      else
      {
        if ([(HUGridServiceCell *)self showingUpdatingState]) {
          goto LABEL_17;
        }
        double v12 = [(HUGridServiceCell *)self item];
        uint64_t v13 = [v12 latestResults];
        double v14 = [v13 objectForKeyedSubscript:v9];
        uint64_t v15 = [v14 integerValue];

        if (v15 != 1)
        {
LABEL_17:
          uint64_t v5 = 0;
          goto LABEL_12;
        }
        [(HUGridServiceCell *)self _createExclamationViewIfNecessary];
        uint64_t v6 = [(HUGridServiceCell *)self exclamationView];
      }
    }
    uint64_t v5 = v6;
  }
LABEL_12:
  accessoryView = self->_accessoryView;
  id obj = (id)v5;
  if ((UIView *)v5 != accessoryView)
  {
    [(UIView *)accessoryView removeFromSuperview];
    objc_storeStrong((id *)&self->_accessoryView, obj);
    uint64_t v17 = [(HUGridServiceCell *)self contentView];
    [v17 addSubview:self->_accessoryView];

    [(HUGridServiceCell *)self setNeedsLayout];
  }
  [(HUGridServiceCell *)self _updateExclamationViewColor];
}

- (void)_createExclamationViewIfNecessary
{
  BOOL v3 = [(HUGridServiceCell *)self exclamationView];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_exclamationMarkImage");
    id v11 = (id)[v4 initWithImage:v5];

    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
    [v11 setTintColor:v6];

    int v7 = [HUVisualEffectContainerView alloc];
    double v8 = [(HUGridCell *)self contentEffect];
    uint64_t v9 = [(HUVisualEffectContainerView *)v7 initWithEffect:v8];
    [(HUGridServiceCell *)self setExclamationView:v9];

    double v10 = [(HUGridServiceCell *)self exclamationView];
    [v10 setInnerContentView:v11];
  }
}

- (void)_updateExclamationViewColor
{
  BOOL v3 = [(HUGridServiceCell *)self item];
  id v4 = [v3 latestResults];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68938]];
  uint64_t v6 = [v5 integerValue];

  if ([(HUGridCell *)self iconDisplayStyle] == 3)
  {
    int v7 = [(id)objc_opt_class() _iconTintColor];
  }
  else
  {
    int v7 = 0;
  }
  id v11 = v7;
  if (v6)
  {
    id v8 = [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  else
  {
    id v8 = v7;
  }
  uint64_t v9 = v8;
  double v10 = [(HUGridServiceCell *)self exclamationView];
  [v10 setTintColor:v9];
}

- (void)_updateSupplementaryImageViewIfNecessary
{
  BOOL v3 = [(HUGridServiceCell *)self item];
  if ([v3 conformsToProtocol:&unk_1F1A3D558]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [v5 accessories];

  id v44 = [v6 anyObject];

  uint64_t v7 = [(HUGridServiceCell *)self effectiveUserInterfaceLayoutDirection];
  uint64_t v8 = objc_msgSend(v44, "hf_siriEndpointProfile");
  if (v8 && (uint64_t v9 = (void *)v8, v10 = objc_msgSend(v44, "hf_needsOnboarding"), v9, (v10 & 1) == 0))
  {
    objc_opt_class();
    uint64_t v15 = [(HUGridServiceCell *)self item];
    if (objc_opt_isKindOfClass()) {
      double v16 = v15;
    }
    else {
      double v16 = 0;
    }
    id v17 = v16;

    unint64_t v18 = objc_msgSend(v44, "hf_siriEndpointProfile");
    char v19 = [v18 manuallyDisabled];

    if ((v19 & 1) == 0 && ([v17 shouldShowMutedMicIcon] & 1) == 0)
    {

LABEL_22:
      v20 = [(HUGridServiceCell *)self supplementaryImageView];
      [v20 setHidden:1];
      goto LABEL_23;
    }
  }
  else
  {
    if (!objc_msgSend(v44, "hf_isHomePod")) {
      goto LABEL_22;
    }
    objc_opt_class();
    id v11 = [(HUGridServiceCell *)self item];
    double v12 = (objc_opt_isKindOfClass() & 1) != 0 ? v11 : 0;
    id v13 = v12;

    int v14 = [v13 shouldShowMutedMicIcon];
    if (!v14) {
      goto LABEL_22;
    }
  }
  v20 = [(HUGridServiceCell *)self _backgroundColorForSupplementaryIcon];
  uint64_t v21 = (void *)MEMORY[0x1E4F42A80];
  v22 = [MEMORY[0x1E4F428B8] systemRedColor];
  id v23 = objc_msgSend(v21, "hu_mutedMicrophoneImageInCircleWithTintColor:backgroundColor:", v22, v20);

  uint64_t v24 = [(HUGridServiceCell *)self supplementaryImageView];
  [v24 setImage:v23];

  v25 = [(HUGridServiceCell *)self iconView];
  [v25 frame];
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;

  v34 = [(HUGridServiceCell *)self supplementaryImageView];
  v35 = [v34 image];
  [v35 size];
  double v37 = v36;
  double v39 = v38;

  double v40 = 0.0;
  if (v7 != 1) {
    double v40 = v31;
  }
  double v41 = v27 + v40 + v37 * -0.5;
  double v42 = [(HUGridServiceCell *)self supplementaryImageView];
  objc_msgSend(v42, "setFrame:", v41, v29 + v33 + v39 / -1.5, v37, v39);

  v43 = [(HUGridServiceCell *)self supplementaryImageView];
  [v43 setHidden:0];

LABEL_23:
}

- (id)_backgroundColorForSupplementaryIcon
{
  BOOL v3 = [MEMORY[0x1E4F428B8] colorWithWhite:0.85 alpha:1.0];
  if ([MEMORY[0x1E4F69138] isSpringBoard]) {
    int v4 = 1;
  }
  else {
    int v4 = [MEMORY[0x1E4F69138] isHomeControlService];
  }
  id v5 = [(HUGridServiceCell *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];

  if (v6 == 2 || v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F428B8] colorWithWhite:0.3 alpha:1.0];

    BOOL v3 = (void *)v7;
  }
  if ([(HUGridCell *)self backgroundState] == 1)
  {
    id v8 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  }
  else
  {
    id v8 = v3;
  }
  uint64_t v9 = v8;

  return v9;
}

- (void)_createFirmwareUpdateViewIfNecessary
{
  BOOL v3 = [(HUGridServiceCell *)self firmwareUpdateView];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    id v5 = HUImageNamed(@"firmwareupdate");
    uint64_t v6 = [v5 imageWithRenderingMode:2];
    id v12 = (id)[v4 initWithImage:v6];

    uint64_t v7 = [MEMORY[0x1E4F428B8] systemGrayColor];
    [v12 setTintColor:v7];

    id v8 = [HUVisualEffectContainerView alloc];
    uint64_t v9 = [(HUGridCell *)self contentEffect];
    char v10 = [(HUVisualEffectContainerView *)v8 initWithEffect:v9];
    [(HUGridServiceCell *)self setFirmwareUpdateView:v10];

    id v11 = [(HUGridServiceCell *)self firmwareUpdateView];
    [v11 setInnerContentView:v12];
  }
}

- (void)dragStateDidChange:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUGridServiceCell;
  -[HUGridServiceCell dragStateDidChange:](&v6, sel_dragStateDidChange_);
  if (a3) {
    [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  else {
  id v5 = [MEMORY[0x1E4F428B8] clearColor];
  }
  [(HUGridServiceCell *)self setBackgroundColor:v5];
}

- (HFItem)serviceItem
{
  return self->_serviceItem;
}

- (void)setServiceItem:(id)a3
{
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (BOOL)shouldColorDescription
{
  return self->_shouldColorDescription;
}

- (UIColor)defaultNameTextColor
{
  return self->_defaultNameTextColor;
}

- (void)setDefaultNameTextColor:(id)a3
{
}

- (UIColor)defaultDescriptionColor
{
  return self->_defaultDescriptionColor;
}

- (void)setDefaultDescriptionColor:(id)a3
{
}

- (BOOL)shouldShowLoadingState
{
  return self->_shouldShowLoadingState;
}

- (void)setShouldShowLoadingState:(BOOL)a3
{
  self->_shouldShowLoadingState = a3;
}

- (BOOL)shouldShowRoomName
{
  return self->_shouldShowRoomName;
}

- (HUIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (UIImageView)supplementaryImageView
{
  return self->_supplementaryImageView;
}

- (void)setSupplementaryImageView:(id)a3
{
}

- (HUGridServiceCellTextView)serviceTextView
{
  return self->_serviceTextView;
}

- (void)setServiceTextView:(id)a3
{
}

- (UILabel)coloredDescriptionLabel
{
  return self->_coloredDescriptionLabel;
}

- (void)setColoredDescriptionLabel:(id)a3
{
}

- (UIVisualEffectView)descriptionLabelEffectView
{
  return self->_descriptionLabelEffectView;
}

- (void)setDescriptionLabelEffectView:(id)a3
{
}

- (BOOL)hasUpdatedUISinceLastReuse
{
  return self->_hasUpdatedUISinceLastReuse;
}

- (void)setHasUpdatedUISinceLastReuse:(BOOL)a3
{
  self->_hasUpdatedUISinceLastReuse = a3;
}

- (BOOL)showingUpdatingState
{
  return self->_showingUpdatingState;
}

- (NACancelable)showUpdatingStateAfterDelayToken
{
  return self->_showUpdatingStateAfterDelayToken;
}

- (void)setShowUpdatingStateAfterDelayToken:(id)a3
{
}

- (BOOL)showingProgressIndicator
{
  return self->_showingProgressIndicator;
}

- (NACancelable)showProgressIndicatorAfterDelayToken
{
  return self->_showProgressIndicatorAfterDelayToken;
}

- (void)setShowProgressIndicatorAfterDelayToken:(id)a3
{
}

- (UIView)overrideAccessoryView
{
  return self->_overrideAccessoryView;
}

- (void)setOverrideAccessoryView:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (HUVisualEffectContainerView)exclamationView
{
  return self->_exclamationView;
}

- (void)setExclamationView:(id)a3
{
}

- (HUVisualEffectContainerView)firmwareUpdateView
{
  return self->_firmwareUpdateView;
}

- (void)setFirmwareUpdateView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firmwareUpdateView, 0);
  objc_storeStrong((id *)&self->_exclamationView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_overrideAccessoryView, 0);
  objc_storeStrong((id *)&self->_showProgressIndicatorAfterDelayToken, 0);
  objc_storeStrong((id *)&self->_showUpdatingStateAfterDelayToken, 0);
  objc_storeStrong((id *)&self->_descriptionLabelEffectView, 0);
  objc_storeStrong((id *)&self->_coloredDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_serviceTextView, 0);
  objc_storeStrong((id *)&self->_supplementaryImageView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_defaultDescriptionColor, 0);
  objc_storeStrong((id *)&self->_defaultNameTextColor, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);

  objc_storeStrong((id *)&self->_serviceItem, 0);
}

@end