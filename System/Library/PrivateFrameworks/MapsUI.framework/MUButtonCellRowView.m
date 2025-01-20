@interface MUButtonCellRowView
- (MUButtonCellRowView)initWithFrame:(CGRect)a3;
- (MUDynamicButtonCellModel)viewModel;
- (double)_platterLength;
- (void)_buttonCellTapped;
- (void)_contentSizeDidChange;
- (void)_setupAccessibilityIdentifier;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateAppearance;
- (void)setViewModel:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation MUButtonCellRowView

- (MUButtonCellRowView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MUButtonCellRowView;
  v3 = -[MUPlaceSectionRowView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MUButtonCellRowView *)v3 _setupSubviews];
    [(MUButtonCellRowView *)v4 _setupConstraints];
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel__contentSizeDidChange name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v4;
}

- (void)_setupSubviews
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v3 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
  titleValueLayoutGuide = self->_titleValueLayoutGuide;
  self->_titleValueLayoutGuide = v3;

  [(MUButtonCellRowView *)self addLayoutGuide:self->_titleValueLayoutGuide];
  objc_msgSend(MEMORY[0x1E4FB1930], "_mapsui_defaultLabel");
  v5 = (UILabel *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v5;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v7 = *MEMORY[0x1E4FB28C8];
  v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(UILabel *)self->_titleLabel setFont:v8];

  v9 = +[MUInfoCardStyle tintColor];
  [(UILabel *)self->_titleLabel setTextColor:v9];

  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  [(UILabel *)self->_titleLabel setAccessibilityIdentifier:@"ButtonCellTitle"];
  [(MUButtonCellRowView *)self addSubview:self->_titleLabel];
  v10 = +[MUCirclePlatterView defaultPlatterView];
  actionPlatterView = self->_actionPlatterView;
  self->_actionPlatterView = v10;

  v12 = [MEMORY[0x1E4FB1618] clearColor];
  [(MUCirclePlatterView *)self->_actionPlatterView setBackgroundColor:v12];

  [(MUCirclePlatterView *)self->_actionPlatterView setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v7];
  [(MUCirclePlatterView *)self->_actionPlatterView setGlyphFont:v13];

  v14 = +[MUInfoCardStyle tintColor];
  [(MUCirclePlatterView *)self->_actionPlatterView setGlyphColor:v14];

  [(MUCirclePlatterView *)self->_actionPlatterView setAccessibilityIdentifier:@"ButtonCellAction"];
  [(MUButtonCellRowView *)self addSubview:self->_actionPlatterView];
  v15 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
  menuButton = self->_menuButton;
  self->_menuButton = v15;

  [(UIButton *)self->_menuButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_menuButton setShowsMenuAsPrimaryAction:1];
  [(UIButton *)self->_menuButton setHidden:1];
  [(MUButtonCellRowView *)self addSubview:self->_menuButton];
  [(MKViewWithHairline *)self setLeftHairlineInset:56.0];
  v17 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1D38]);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v17;

  [(MUButtonCellRowView *)self addGestureRecognizer:self->_tapGestureRecognizer];
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer addTarget:self action:sel__buttonCellTapped];
  [(UIView *)self _mapsui_addSelectGestureRecognizerWithTarget:self action:sel__buttonCellTapped];
  v19 = self;
  v22[0] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  id v21 = (id)[(MUButtonCellRowView *)self registerForTraitChanges:v20 withAction:sel__updateForPlatterAvailability];
}

- (void)_setupConstraints
{
  v61[15] = *MEMORY[0x1E4F143B8];
  v3 = [(MUCirclePlatterView *)self->_actionPlatterView widthAnchor];
  [(MUButtonCellRowView *)self _platterLength];
  objc_msgSend(v3, "constraintEqualToConstant:");
  v4 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  platterWidthConstraint = self->_platterWidthConstraint;
  self->_platterWidthConstraint = v4;

  v6 = [(UILayoutGuide *)self->_titleValueLayoutGuide topAnchor];
  uint64_t v7 = [(MUButtonCellRowView *)self topAnchor];
  v8 = [v6 constraintEqualToAnchor:v7 constant:16.0];
  titleGuideToTopConstraint = self->_titleGuideToTopConstraint;
  self->_titleGuideToTopConstraint = v8;

  v10 = [(UILayoutGuide *)self->_titleValueLayoutGuide bottomAnchor];
  v11 = [(MUButtonCellRowView *)self bottomAnchor];
  v12 = [v10 constraintEqualToAnchor:v11 constant:-16.0];
  titleGuideToBottomConstraint = self->_titleGuideToBottomConstraint;
  self->_titleGuideToBottomConstraint = v12;

  v47 = (void *)MEMORY[0x1E4F28DC8];
  v61[0] = self->_platterWidthConstraint;
  v60 = [(MUCirclePlatterView *)self->_actionPlatterView heightAnchor];
  v59 = [(MUCirclePlatterView *)self->_actionPlatterView widthAnchor];
  v58 = [v60 constraintEqualToAnchor:v59];
  v61[1] = v58;
  v57 = [(MUCirclePlatterView *)self->_actionPlatterView leadingAnchor];
  v56 = [(MUButtonCellRowView *)self leadingAnchor];
  v55 = [v57 constraintEqualToAnchor:v56 constant:16.0];
  v61[2] = v55;
  v54 = [(MUCirclePlatterView *)self->_actionPlatterView centerYAnchor];
  v53 = [(UILayoutGuide *)self->_titleValueLayoutGuide centerYAnchor];
  v52 = [v54 constraintEqualToAnchor:v53];
  v14 = self->_titleGuideToTopConstraint;
  v61[3] = v52;
  v61[4] = v14;
  v61[5] = self->_titleGuideToBottomConstraint;
  v51 = [(UILayoutGuide *)self->_titleValueLayoutGuide trailingAnchor];
  v50 = [(MUButtonCellRowView *)self trailingAnchor];
  v49 = [v51 constraintEqualToAnchor:v50 constant:-16.0];
  v61[6] = v49;
  v48 = [(UILabel *)self->_titleLabel leadingAnchor];
  v46 = [(UILayoutGuide *)self->_titleValueLayoutGuide leadingAnchor];
  v45 = [v48 constraintEqualToAnchor:v46];
  v61[7] = v45;
  v44 = [(UILabel *)self->_titleLabel topAnchor];
  v43 = [(UILayoutGuide *)self->_titleValueLayoutGuide topAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v61[8] = v42;
  v41 = [(UILabel *)self->_titleLabel trailingAnchor];
  v40 = [(UILayoutGuide *)self->_titleValueLayoutGuide trailingAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v61[9] = v39;
  v38 = [(UILabel *)self->_titleLabel bottomAnchor];
  v37 = [(UILayoutGuide *)self->_titleValueLayoutGuide bottomAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v61[10] = v36;
  v35 = [(UIButton *)self->_menuButton leadingAnchor];
  v34 = [(MUButtonCellRowView *)self leadingAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v61[11] = v33;
  v32 = [(UIButton *)self->_menuButton topAnchor];
  v15 = [(MUButtonCellRowView *)self topAnchor];
  v16 = [v32 constraintEqualToAnchor:v15];
  v61[12] = v16;
  v17 = [(UIButton *)self->_menuButton trailingAnchor];
  v18 = [(MUButtonCellRowView *)self trailingAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  v61[13] = v19;
  v20 = [(UIButton *)self->_menuButton bottomAnchor];
  id v21 = [(MUButtonCellRowView *)self bottomAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  v61[14] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:15];
  [v47 activateConstraints:v23];

  v24 = [(UILayoutGuide *)self->_titleValueLayoutGuide leadingAnchor];
  v25 = [(MUCirclePlatterView *)self->_actionPlatterView trailingAnchor];
  v26 = [v24 constraintEqualToAnchor:v25 constant:10.0];
  titleGuideToPlatterLeadingConstraint = self->_titleGuideToPlatterLeadingConstraint;
  self->_titleGuideToPlatterLeadingConstraint = v26;

  [(NSLayoutConstraint *)self->_titleGuideToPlatterLeadingConstraint setActive:1];
  v28 = [(UILayoutGuide *)self->_titleValueLayoutGuide leadingAnchor];
  v29 = [(MUButtonCellRowView *)self leadingAnchor];
  v30 = [v28 constraintEqualToAnchor:v29 constant:16.0];
  titleGuideToSelfLeadingConstraint = self->_titleGuideToSelfLeadingConstraint;
  self->_titleGuideToSelfLeadingConstraint = v30;

  [(NSLayoutConstraint *)self->_titleGuideToSelfLeadingConstraint setActive:0];
}

- (double)_platterLength
{
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v2 _scaledValueForValue:30.0];
  double v4 = v3;

  return v4;
}

- (void)setViewModel:(id)a3
{
  v5 = (MUDynamicButtonCellModel *)a3;
  if (self->_viewModel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_viewModel, a3);
    if (objc_opt_respondsToSelector()) {
      [(MUDynamicButtonCellModel *)self->_viewModel setChangeDelegate:self];
    }
    [(MUButtonCellRowView *)self _setupAccessibilityIdentifier];
    [(MUButtonCellRowView *)self _updateAppearance];
    v5 = v6;
  }
}

- (void)_updateAppearance
{
  [(MUButtonCellRowView *)self setHidden:[(MUDynamicButtonCellModel *)self->_viewModel isEnabled] ^ 1];
  double v3 = [(MUDynamicButtonCellModel *)self->_viewModel titleString];
  [(UILabel *)self->_titleLabel set_mapsui_text:v3];

  double v4 = [(MUDynamicButtonCellModel *)self->_viewModel symbolName];
  [(MUCirclePlatterView *)self->_actionPlatterView setGlyph:v4];

  v5 = [(MUDynamicButtonCellModel *)self->_viewModel symbolName];
  BOOL v6 = v5 != 0;
  BOOL v7 = v5 == 0;

  [(MUCirclePlatterView *)self->_actionPlatterView setHidden:v7];
  [(NSLayoutConstraint *)self->_titleGuideToPlatterLeadingConstraint setActive:v6];
  [(NSLayoutConstraint *)self->_titleGuideToSelfLeadingConstraint setActive:v7];
  uint64_t v8 = [(MUDynamicButtonCellModel *)self->_viewModel actionStyle];
  if (v8 == 1)
  {
    v11 = [MEMORY[0x1E4FB1618] systemRedColor];
    [(UILabel *)self->_titleLabel setTextColor:v11];

    uint64_t v10 = [MEMORY[0x1E4FB1618] systemRedColor];
    goto LABEL_5;
  }
  if (!v8)
  {
    v9 = +[MUInfoCardStyle tintColor];
    [(UILabel *)self->_titleLabel setTextColor:v9];

    uint64_t v10 = +[MUInfoCardStyle tintColor];
LABEL_5:
    v12 = (void *)v10;
    [(MUCirclePlatterView *)self->_actionPlatterView setGlyphColor:v10];
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(MUDynamicButtonCellModel *)self->_viewModel menu],
        v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v13))
  {
    v14 = [(MUDynamicButtonCellModel *)self->_viewModel menu];
    p_menuButton = &self->_menuButton;
    [(UIButton *)self->_menuButton setMenu:v14];

    uint64_t v16 = 0;
  }
  else
  {
    p_menuButton = &self->_menuButton;
    uint64_t v16 = 1;
  }
  [(UIButton *)*p_menuButton setHidden:v16];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (uint64_t v17 = [(MUDynamicButtonCellModel *)self->_viewModel cellStyle]) != 0)
  {
    if (v17 != 1) {
      goto LABEL_16;
    }
    v18 = &kMUPlacePlatterCompactVerticalPadding;
  }
  else
  {
    v18 = &kMUPlacePlatterPadding;
  }
  double v19 = *(double *)v18;
  [(NSLayoutConstraint *)self->_titleGuideToTopConstraint setConstant:*(double *)v18];
  [(NSLayoutConstraint *)self->_titleGuideToBottomConstraint setConstant:-v19];
LABEL_16:
  [(MUButtonCellRowView *)self _setupAccessibilityIdentifier];
}

- (void)_setupAccessibilityIdentifier
{
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(MUDynamicButtonCellModel *)self->_viewModel accessibilityIdentifierForAction];
    double v3 = [@"ButtonCellType" stringByAppendingString:v4];
    [(MUButtonCellRowView *)self setAccessibilityIdentifier:v3];
  }
  else
  {
    [(MUButtonCellRowView *)self setAccessibilityIdentifier:@"ButtonCellTypeUnknown"];
  }
}

- (void)_buttonCellTapped
{
  double v3 = [(MUDynamicButtonCellModel *)self->_viewModel actionBlock];

  if (v3)
  {
    id v4 = [(MUDynamicButtonCellModel *)self->_viewModel actionBlock];
    v4[2](v4, self);
  }
}

- (void)_contentSizeDidChange
{
  double v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(UILabel *)self->_titleLabel setFont:v3];

  [(MUButtonCellRowView *)self _platterLength];
  platterWidthConstraint = self->_platterWidthConstraint;
  -[NSLayoutConstraint setConstant:](platterWidthConstraint, "setConstant:");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MUButtonCellRowView;
  [(MUPlaceSectionRowView *)&v5 touchesBegan:a3 withEvent:a4];
  [(MUPlaceSectionRowView *)self setSelected:1];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MUButtonCellRowView;
  [(MUPlaceSectionRowView *)&v5 touchesEnded:a3 withEvent:a4];
  [(MUPlaceSectionRowView *)self setSelected:0];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MUButtonCellRowView;
  [(MUPlaceSectionRowView *)&v5 touchesCancelled:a3 withEvent:a4];
  [(MUPlaceSectionRowView *)self setSelected:0];
}

- (MUDynamicButtonCellModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_titleGuideToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_titleGuideToTopConstraint, 0);
  objc_storeStrong((id *)&self->_titleGuideToSelfLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_titleGuideToPlatterLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_platterWidthConstraint, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_actionPlatterView, 0);
  objc_storeStrong((id *)&self->_menuButton, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleValueLayoutGuide, 0);
}

@end