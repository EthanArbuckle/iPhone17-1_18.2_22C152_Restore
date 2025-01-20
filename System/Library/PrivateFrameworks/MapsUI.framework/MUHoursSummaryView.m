@interface MUHoursSummaryView
- (MUHoursSummaryView)initWithViewModel:(id)a3;
- (MUHoursSummaryViewModel)viewModel;
- (id)actionHandler;
- (void)_handleAnimationStartForNormalHours;
- (void)_handleNormalHoursAnimation;
- (void)_handleServiceHoursAnimation;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateAppearance;
- (void)_updateExpandButton;
- (void)expandButtonTapped;
- (void)handleAnimation;
- (void)handleAnimationStart;
- (void)setActionHandler:(id)a3;
@end

@implementation MUHoursSummaryView

- (MUHoursSummaryView)initWithViewModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUHoursSummaryView;
  v6 = -[MUHoursSummaryView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    v6->_expanded = 0;
    objc_storeStrong((id *)&v6->_viewModel, a3);
    [(MUHoursSummaryView *)v7 setAccessibilityIdentifier:@"HoursSummary"];
    [(MUHoursSummaryView *)v7 _setupSubviews];
    [(MUHoursSummaryView *)v7 _setupConstraints];
    [(MUHoursSummaryView *)v7 _updateAppearance];
  }

  return v7;
}

- (void)_setupSubviews
{
  v33[1] = *MEMORY[0x1E4F143B8];
  v3 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
  summaryStackLayoutGuide = self->_summaryStackLayoutGuide;
  self->_summaryStackLayoutGuide = v3;

  [(MUHoursSummaryView *)self addLayoutGuide:self->_summaryStackLayoutGuide];
  id v5 = +[MUInfoCardStyle labelForProminence:1];
  titleLabel = self->_titleLabel;
  self->_titleLabel = v5;

  [(MULabelViewProtocol *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [(MULabelViewProtocol *)self->_titleLabel setFont:v7];

  v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(MULabelViewProtocol *)self->_titleLabel setTextColor:v8];

  [(MULabelViewProtocol *)self->_titleLabel setAdjustsFontForContentSizeCategory:1];
  [(MULabelViewProtocol *)self->_titleLabel setAccessibilityIdentifier:@"HoursSummaryTitle"];
  objc_super v9 = +[MUInfoCardStyle labelForProminence:0];
  hoursLabel = self->_hoursLabel;
  self->_hoursLabel = v9;

  [(MULabelViewProtocol *)self->_hoursLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MULabelViewProtocol *)self->_hoursLabel setNumberOfLines:0];
  [(MULabelViewProtocol *)self->_hoursLabel setAdjustsFontForContentSizeCategory:1];
  [(MULabelViewProtocol *)self->_hoursLabel setAccessibilityIdentifier:@"HoursSummaryHours"];
  if ([(MUHoursSummaryViewModel *)self->_viewModel isServiceHours])
  {
    objc_storeStrong((id *)&self->_openStateLabel, self->_hoursLabel);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4FB1930], "_mapsui_defaultLabel");
    v11 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
    openStateLabel = self->_openStateLabel;
    self->_openStateLabel = v11;

    [(MULabelViewProtocol *)self->_openStateLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MULabelViewProtocol *)self->_openStateLabel setAdjustsFontForContentSizeCategory:1];
  }
  v13 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(MULabelViewProtocol *)self->_openStateLabel setFont:v13];

  id v14 = objc_alloc(MEMORY[0x1E4FB1838]);
  v15 = (UIImageView *)objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  expansionIndicator = self->_expansionIndicator;
  self->_expansionIndicator = v15;

  [(UIImageView *)self->_expansionIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
  v17 = (void *)MEMORY[0x1E4FB1830];
  v18 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  v19 = [v17 configurationWithFont:v18 scale:1];
  [(UIImageView *)self->_expansionIndicator setPreferredSymbolConfiguration:v19];

  v20 = self->_expansionIndicator;
  v21 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  [(UIImageView *)v20 setTintColor:v21];

  LODWORD(v22) = 1148846080;
  [(UIImageView *)self->_expansionIndicator setContentHuggingPriority:0 forAxis:v22];
  LODWORD(v23) = 1148846080;
  [(UIImageView *)self->_expansionIndicator setContentHuggingPriority:1 forAxis:v23];
  v24 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1D38]);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v24;

  [(MUHoursSummaryView *)self addGestureRecognizer:self->_tapGestureRecognizer];
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer addTarget:self action:sel_expandButtonTapped];
  [(UIView *)self _mapsui_addSelectGestureRecognizerWithTarget:self action:sel_expandButtonTapped];
  [(MUHoursSummaryView *)self _updateExpandButton];
  [(MUHoursSummaryView *)self addSubview:self->_titleLabel];
  [(MUHoursSummaryView *)self addSubview:self->_hoursLabel];
  if (![(MUHoursSummaryViewModel *)self->_viewModel isServiceHours])
  {
    [(MULabelViewProtocol *)self->_openStateLabel setAccessibilityIdentifier:@"HoursSummaryOpenState"];
    [(MUHoursSummaryView *)self addSubview:self->_openStateLabel];
  }
  [(MUHoursSummaryView *)self addSubview:self->_expansionIndicator];
  v26 = self;
  v33[0] = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  id v28 = (id)[(MUHoursSummaryView *)self registerForTraitChanges:v27 withAction:sel__updateForPlatterAvailability];

  v29 = self;
  v32 = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  id v31 = (id)[(MUHoursSummaryView *)self registerForTraitChanges:v30 withAction:sel__contentSizeDidChange];
}

- (void)_setupConstraints
{
  v64[16] = *MEMORY[0x1E4F143B8];
  v3 = [(MULabelViewProtocol *)self->_titleLabel bottomAnchor];
  v4 = [(MULabelViewProtocol *)self->_openStateLabel topAnchor];
  id v5 = [v3 constraintEqualToAnchor:v4];
  titleToOpenStateConstraint = self->_titleToOpenStateConstraint;
  self->_titleToOpenStateConstraint = v5;

  v7 = [(MULabelViewProtocol *)self->_titleLabel bottomAnchor];
  v8 = [(MULabelViewProtocol *)self->_hoursLabel topAnchor];
  objc_super v9 = [v7 constraintEqualToAnchor:v8];
  titleToHoursConstraint = self->_titleToHoursConstraint;
  self->_titleToHoursConstraint = v9;

  hoursLabel = self->_hoursLabel;
  if (hoursLabel != self->_openStateLabel)
  {
    v12 = [(MULabelViewProtocol *)hoursLabel bottomAnchor];
    v13 = [(MULabelViewProtocol *)self->_openStateLabel topAnchor];
    id v14 = [v12 constraintEqualToAnchor:v13];
    hoursToOpenStateConstraint = self->_hoursToOpenStateConstraint;
    self->_hoursToOpenStateConstraint = v14;
  }
  v45 = (void *)MEMORY[0x1E4F28DC8];
  v63 = [(UILayoutGuide *)self->_summaryStackLayoutGuide topAnchor];
  v62 = [(MUHoursSummaryView *)self topAnchor];
  v61 = [v63 constraintEqualToAnchor:v62];
  v64[0] = v61;
  v60 = [(UILayoutGuide *)self->_summaryStackLayoutGuide bottomAnchor];
  v59 = [(MUHoursSummaryView *)self bottomAnchor];
  v58 = [v60 constraintEqualToAnchor:v59];
  v64[1] = v58;
  v57 = [(UILayoutGuide *)self->_summaryStackLayoutGuide leadingAnchor];
  v56 = [(MUHoursSummaryView *)self leadingAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v64[2] = v55;
  v54 = [(UILayoutGuide *)self->_summaryStackLayoutGuide trailingAnchor];
  v53 = [(UIImageView *)self->_expansionIndicator leadingAnchor];
  v52 = [v54 constraintEqualToAnchor:v53 constant:-8.0];
  v64[3] = v52;
  v51 = [(MULabelViewProtocol *)self->_titleLabel topAnchor];
  v50 = [(UILayoutGuide *)self->_summaryStackLayoutGuide topAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v64[4] = v49;
  v48 = [(MULabelViewProtocol *)self->_titleLabel leadingAnchor];
  v47 = [(UILayoutGuide *)self->_summaryStackLayoutGuide leadingAnchor];
  v46 = [v48 constraintEqualToAnchor:v47];
  v64[5] = v46;
  v44 = [(MULabelViewProtocol *)self->_titleLabel trailingAnchor];
  v43 = [(UILayoutGuide *)self->_summaryStackLayoutGuide trailingAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v16 = self->_titleToHoursConstraint;
  v64[6] = v42;
  v64[7] = v16;
  v41 = [(MULabelViewProtocol *)self->_hoursLabel leadingAnchor];
  v40 = [(UILayoutGuide *)self->_summaryStackLayoutGuide leadingAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v64[8] = v39;
  v38 = [(MULabelViewProtocol *)self->_hoursLabel trailingAnchor];
  v37 = [(UILayoutGuide *)self->_summaryStackLayoutGuide trailingAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v64[9] = v36;
  v35 = [(MULabelViewProtocol *)self->_openStateLabel leadingAnchor];
  v34 = [(UILayoutGuide *)self->_summaryStackLayoutGuide leadingAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v64[10] = v33;
  v32 = [(MULabelViewProtocol *)self->_openStateLabel trailingAnchor];
  id v31 = [(UILayoutGuide *)self->_summaryStackLayoutGuide trailingAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v64[11] = v30;
  v29 = [(MULabelViewProtocol *)self->_openStateLabel bottomAnchor];
  id v28 = [(UILayoutGuide *)self->_summaryStackLayoutGuide bottomAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v64[12] = v27;
  v26 = [(UIImageView *)self->_expansionIndicator topAnchor];
  v17 = [(MUHoursSummaryView *)self topAnchor];
  v18 = [v26 constraintEqualToAnchor:v17 constant:10.0];
  v64[13] = v18;
  v19 = [(UIImageView *)self->_expansionIndicator bottomAnchor];
  v20 = [(MUHoursSummaryView *)self bottomAnchor];
  v21 = [v19 constraintLessThanOrEqualToAnchor:v20];
  v64[14] = v21;
  double v22 = [(UIImageView *)self->_expansionIndicator trailingAnchor];
  double v23 = [(MUHoursSummaryView *)self trailingAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  v64[15] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:16];
  [v45 activateConstraints:v25];

  if (self->_hoursLabel != self->_openStateLabel) {
    [(NSLayoutConstraint *)self->_hoursToOpenStateConstraint setActive:1];
  }
}

- (void)expandButtonTapped
{
  self->_expanded ^= 1u;
  [(MUHoursSummaryView *)self _updateExpandButton];
  v3 = [(MUHoursSummaryView *)self actionHandler];

  if (v3)
  {
    v4 = [(MUHoursSummaryView *)self actionHandler];
    v4[2]();
  }
}

- (void)_updateExpandButton
{
  if (self->_expanded) {
    v2 = @"chevron.up";
  }
  else {
    v2 = @"chevron.down";
  }
  expansionIndicator = self->_expansionIndicator;
  v4 = (void *)MEMORY[0x1E4FB1818];
  id v5 = (void *)MEMORY[0x1E4FB1830];
  v6 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v7 = *MEMORY[0x1E4FB2908];
  v8 = v2;
  id v11 = [v6 preferredFontForTextStyle:v7];
  objc_super v9 = [v5 configurationWithFont:v11 scale:1];
  v10 = [v4 systemImageNamed:v8 withConfiguration:v9];

  [(UIImageView *)expansionIndicator setImage:v10];
}

- (void)handleAnimationStart
{
  if (![(MUHoursSummaryViewModel *)self->_viewModel isServiceHours])
  {
    [(MUHoursSummaryView *)self _handleAnimationStartForNormalHours];
  }
}

- (void)_handleAnimationStartForNormalHours
{
}

- (void)handleAnimation
{
  if ([(MUHoursSummaryViewModel *)self->_viewModel isServiceHours])
  {
    [(MUHoursSummaryView *)self _handleServiceHoursAnimation];
  }
  else
  {
    [(MUHoursSummaryView *)self _handleNormalHoursAnimation];
  }
}

- (void)_handleNormalHoursAnimation
{
  if (self->_expanded)
  {
    [(MULabelViewProtocol *)self->_hoursLabel setAlpha:0.0];
    titleToOpenStateConstraint = self->_titleToOpenStateConstraint;
    [(NSLayoutConstraint *)titleToOpenStateConstraint setActive:1];
  }
  else
  {
    [(NSLayoutConstraint *)self->_titleToOpenStateConstraint setActive:0];
    hoursLabel = self->_hoursLabel;
    [(MULabelViewProtocol *)hoursLabel setAlpha:1.0];
  }
}

- (void)_handleServiceHoursAnimation
{
  BOOL expanded = self->_expanded;
  viewModel = self->_viewModel;
  if (expanded)
  {
    id v5 = [(MUHoursSummaryViewModel *)viewModel openStateText];
    [(MULabelViewProtocol *)self->_hoursLabel setText:v5];

    id v6 = [(MUHoursSummaryViewModel *)self->_viewModel openStateColor];
    -[MULabelViewProtocol setTextColor:](self->_hoursLabel, "setTextColor:");
  }
  else
  {
    id v6 = [(MUHoursSummaryViewModel *)viewModel buildDefaultPlacecardHoursString];
    -[MULabelViewProtocol setAttributedText:](self->_hoursLabel, "setAttributedText:");
  }
}

- (void)_updateAppearance
{
  v3 = [(MUHoursSummaryViewModel *)self->_viewModel titleText];
  [(MULabelViewProtocol *)self->_titleLabel setText:v3];

  [(UIImageView *)self->_expansionIndicator setHidden:[(MUHoursSummaryViewModel *)self->_viewModel hideChevron]];
  if (self->_openStateLabel != self->_hoursLabel)
  {
    v4 = [(MUHoursSummaryViewModel *)self->_viewModel buildDefaultPlacecardHoursString];
    [(MULabelViewProtocol *)self->_hoursLabel setAttributedText:v4];

    id v5 = [(MUHoursSummaryViewModel *)self->_viewModel openStateColor];
    [(MULabelViewProtocol *)self->_openStateLabel setTextColor:v5];

    uint64_t v6 = [(MUHoursSummaryViewModel *)self->_viewModel openStateText];
    openStateLabel = self->_openStateLabel;
LABEL_5:
    id v9 = (id)v6;
    -[MULabelViewProtocol setText:](openStateLabel, "setText:");
    goto LABEL_6;
  }
  viewModel = self->_viewModel;
  if (self->_expanded)
  {
    uint64_t v6 = [(MUHoursSummaryViewModel *)viewModel openStateText];
    openStateLabel = self->_hoursLabel;
    goto LABEL_5;
  }
  id v9 = [(MUHoursSummaryViewModel *)viewModel buildDefaultPlacecardHoursString];
  -[MULabelViewProtocol setAttributedText:](self->_hoursLabel, "setAttributedText:");
LABEL_6:
}

- (MUHoursSummaryViewModel)viewModel
{
  return self->_viewModel;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_hoursToOpenStateConstraint, 0);
  objc_storeStrong((id *)&self->_titleToHoursConstraint, 0);
  objc_storeStrong((id *)&self->_titleToOpenStateConstraint, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_openStateLabel, 0);
  objc_storeStrong((id *)&self->_hoursLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_expansionIndicator, 0);
  objc_storeStrong((id *)&self->_summaryStackLayoutGuide, 0);
}

@end