@interface EKUIFocusBannerCollectionViewCell
- (BOOL)on;
- (EKUIFocusBannerCollectionViewCell)initWithFrame:(CGRect)a3;
- (EKUIFocusBannerCollectionViewCellDelegate)delegate;
- (id)_configuration;
- (id)_createFocusFilterToggleButton;
- (id)_focusFilterButtonConfiguration;
- (void)_configureCellSwitchingLayout:(BOOL)a3;
- (void)_tapped;
- (void)setDelegate:(id)a3;
- (void)setOn:(BOOL)a3;
@end

@implementation EKUIFocusBannerCollectionViewCell

- (EKUIFocusBannerCollectionViewCell)initWithFrame:(CGRect)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)EKUIFocusBannerCollectionViewCell;
  v3 = -[EKUIFocusBannerCollectionViewCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(EKUIFocusBannerCollectionViewCell *)v3 _configureCellSwitchingLayout:1];
    objc_initWeak(&location, v4);
    v12[0] = objc_opt_class();
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__EKUIFocusBannerCollectionViewCell_initWithFrame___block_invoke;
    v8[3] = &unk_1E60874F8;
    objc_copyWeak(&v9, &location);
    id v6 = (id)[(EKUIFocusBannerCollectionViewCell *)v4 registerForTraitChanges:v5 withHandler:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __51__EKUIFocusBannerCollectionViewCell_initWithFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);
  v8 = [v5 traitCollection];

  id v9 = [v8 preferredContentSizeCategory];
  uint64_t v10 = IsAccessibilityCategory ^ UIContentSizeCategoryIsAccessibilityCategory(v9);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _configureCellSwitchingLayout:v10];
}

- (id)_createFocusFilterToggleButton
{
  v3 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  v4 = [(EKUIFocusBannerCollectionViewCell *)self _focusFilterButtonConfiguration];
  [v3 setConfiguration:v4];

  objc_initWeak(&location, self);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  v8 = __67__EKUIFocusBannerCollectionViewCell__createFocusFilterToggleButton__block_invoke;
  id v9 = &unk_1E6089838;
  objc_copyWeak(&v10, &location);
  [v3 setConfigurationUpdateHandler:&v6];
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__tapped, 0x2000, v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v3;
}

void __67__EKUIFocusBannerCollectionViewCell__createFocusFilterToggleButton__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained _focusFilterButtonConfiguration];
    [v6 setConfiguration:v5];
  }
}

- (void)_tapped
{
  [(EKUIFocusBannerCollectionViewCell *)self setOn:[(EKUIFocusBannerCollectionViewCell *)self on] ^ 1];
  v3 = [(EKUIFocusBannerCollectionViewCell *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(EKUIFocusBannerCollectionViewCell *)self delegate];
    [v5 focusBannerCollectionViewCellToggled:self];
  }
}

- (void)setOn:(BOOL)a3
{
  if (self->_on != a3)
  {
    self->_on = a3;
    [(EKUIFocusBannerCollectionViewCell *)self _configureCellSwitchingLayout:0];
  }
}

- (void)_configureCellSwitchingLayout:(BOOL)a3
{
  BOOL v3 = a3;
  v53[6] = *MEMORY[0x1E4F143B8];
  id v5 = [(EKUIFocusBannerCollectionViewCell *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (IsAccessibilityCategory)
  {
    if (v3)
    {
      [(EKUIFocusBannerCollectionViewCell *)self setContentConfiguration:0];
      [(EKUIFocusBannerCollectionViewCell *)self setAccessories:MEMORY[0x1E4F1CBF0]];
      id v8 = objc_alloc(MEMORY[0x1E4FB1950]);
      id v9 = [(EKUIFocusBannerCollectionViewCell *)self _configuration];
      id v10 = (UIListContentView *)[v8 initWithConfiguration:v9];
      axListContentView = self->_axListContentView;
      self->_axListContentView = v10;

      [(UIListContentView *)self->_axListContentView setTranslatesAutoresizingMaskIntoConstraints:0];
      v12 = [(EKUIFocusBannerCollectionViewCell *)self contentView];
      [v12 addSubview:self->_axListContentView];

      v13 = [(EKUIFocusBannerCollectionViewCell *)self _createFocusFilterToggleButton];
      axFocusFilterToggleButton = self->_axFocusFilterToggleButton;
      self->_axFocusFilterToggleButton = v13;

      [(UIButton *)self->_axFocusFilterToggleButton setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v15) = 1148846080;
      [(UIButton *)self->_axFocusFilterToggleButton setContentCompressionResistancePriority:0 forAxis:v15];
      LODWORD(v16) = 1148846080;
      [(UIButton *)self->_axFocusFilterToggleButton setContentCompressionResistancePriority:1 forAxis:v16];
      v17 = [(EKUIFocusBannerCollectionViewCell *)self contentView];
      [v17 addSubview:self->_axFocusFilterToggleButton];

      v50 = [(UIListContentView *)self->_axListContentView leadingAnchor];
      v51 = [(EKUIFocusBannerCollectionViewCell *)self contentView];
      v49 = [v51 leadingAnchor];
      v48 = [v50 constraintEqualToAnchor:v49];
      v53[0] = v48;
      v46 = [(UIListContentView *)self->_axListContentView trailingAnchor];
      v47 = [(EKUIFocusBannerCollectionViewCell *)self contentView];
      v45 = [v47 trailingAnchor];
      v44 = [v46 constraintEqualToAnchor:v45];
      v53[1] = v44;
      v42 = [(UIListContentView *)self->_axListContentView topAnchor];
      v43 = [(EKUIFocusBannerCollectionViewCell *)self contentView];
      v41 = [v43 topAnchor];
      v40 = [v42 constraintEqualToAnchor:v41];
      v53[2] = v40;
      v39 = [(UIButton *)self->_axFocusFilterToggleButton topAnchor];
      v38 = [(UIListContentView *)self->_axListContentView bottomAnchor];
      v37 = [v39 constraintEqualToAnchor:v38 constant:8.0];
      v53[3] = v37;
      v35 = [(UIButton *)self->_axFocusFilterToggleButton bottomAnchor];
      v36 = [(EKUIFocusBannerCollectionViewCell *)self contentView];
      v18 = [v36 layoutMarginsGuide];
      v19 = [v18 bottomAnchor];
      v20 = [v35 constraintEqualToAnchor:v19];
      v53[4] = v20;
      v21 = [(UIButton *)self->_axFocusFilterToggleButton leadingAnchor];
      v22 = [(EKUIFocusBannerCollectionViewCell *)self contentView];
      v23 = [v22 layoutMarginsGuide];
      v24 = [v23 leadingAnchor];
      v25 = [v21 constraintEqualToAnchor:v24];
      v53[5] = v25;
      v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:6];
      axConstraints = self->_axConstraints;
      self->_axConstraints = v26;

      [MEMORY[0x1E4F28DC8] activateConstraints:self->_axConstraints];
    }
    v28 = [(EKUIFocusBannerCollectionViewCell *)self _configuration];
    [(UIListContentView *)self->_axListContentView setConfiguration:v28];

    v29 = [(EKUIFocusBannerCollectionViewCell *)self _focusFilterButtonConfiguration];
    [(UIButton *)self->_axFocusFilterToggleButton setConfiguration:v29];
  }
  else
  {
    if (v3)
    {
      if (self->_axConstraints) {
        objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
      }
      [(UIListContentView *)self->_axListContentView removeFromSuperview];
      [(UIButton *)self->_axFocusFilterToggleButton removeFromSuperview];
      v30 = [(EKUIFocusBannerCollectionViewCell *)self _createFocusFilterToggleButton];
      focusFilterToggleButton = self->_focusFilterToggleButton;
      self->_focusFilterToggleButton = v30;

      v32 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:self->_focusFilterToggleButton placement:1];
      v52 = v32;
      v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
      [(EKUIFocusBannerCollectionViewCell *)self setAccessories:v33];
    }
    v34 = [(EKUIFocusBannerCollectionViewCell *)self _focusFilterButtonConfiguration];
    [(UIButton *)self->_focusFilterToggleButton setConfiguration:v34];

    v29 = [(EKUIFocusBannerCollectionViewCell *)self _configuration];
    [(EKUIFocusBannerCollectionViewCell *)self setContentConfiguration:v29];
  }
}

- (id)_configuration
{
  v2 = self;
  BOOL v3 = [(EKUIFocusBannerCollectionViewCell *)self defaultContentConfiguration];
  LODWORD(v2) = [(EKUIFocusBannerCollectionViewCell *)v2 on];
  char v4 = EventKitUIBundle();
  id v5 = v4;
  if (v2)
  {
    id v6 = [v4 localizedStringForKey:@"Filtered by Focus" value:&stru_1F0CC2140 table:0];

    uint64_t v7 = [MEMORY[0x1E4FB1618] labelColor];
    [MEMORY[0x1E4FB1618] systemIndigoColor];
  }
  else
  {
    id v6 = [v4 localizedStringForKey:@"Focus Filter Off" value:&stru_1F0CC2140 table:0];

    uint64_t v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [MEMORY[0x1E4FB1618] secondaryLabelColor];
  id v8 = };
  id v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"moon.circle.fill"];
  [v3 setImage:v9];

  id v10 = [v3 imageProperties];
  [v10 setTintColor:v8];

  [v3 setText:v6];
  objc_super v11 = [v3 textProperties];
  [v11 setColor:v7];

  v12 = [v3 textProperties];
  [v12 setNumberOfLines:0];

  return v3;
}

- (id)_focusFilterButtonConfiguration
{
  v20[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(EKUIFocusBannerCollectionViewCell *)self on];
  char v4 = EventKitUIBundle();
  id v5 = v4;
  if (v3) {
    id v6 = @"Turn Off";
  }
  else {
    id v6 = @"Turn On";
  }
  uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_1F0CC2140 table:0];

  id v8 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950] addingSymbolicTraits:32770 options:0];
  id v9 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v8 size:0.0];
  id v10 = [MEMORY[0x1E4FB1618] systemIndigoColor];
  uint64_t v11 = *MEMORY[0x1E4FB0700];
  v19[0] = *MEMORY[0x1E4FB06F8];
  v19[1] = v11;
  v20[0] = v9;
  v20[1] = v10;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7 attributes:v12];
  v14 = [(EKUIFocusBannerCollectionViewCell *)self traitCollection];
  double v15 = [v14 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v15);

  if (IsAccessibilityCategory)
  {
    v17 = [MEMORY[0x1E4FB14D8] grayButtonConfiguration];
    [v17 setCornerStyle:4];
    [v17 setButtonSize:0];
  }
  else
  {
    v17 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    objc_msgSend(v17, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
  }
  [v17 setAttributedTitle:v13];
  [v17 setTitleLineBreakMode:2];

  return v17;
}

- (BOOL)on
{
  return self->_on;
}

- (EKUIFocusBannerCollectionViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKUIFocusBannerCollectionViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_axConstraints, 0);
  objc_storeStrong((id *)&self->_axListContentView, 0);
  objc_storeStrong((id *)&self->_axFocusFilterToggleButton, 0);

  objc_storeStrong((id *)&self->_focusFilterToggleButton, 0);
}

@end