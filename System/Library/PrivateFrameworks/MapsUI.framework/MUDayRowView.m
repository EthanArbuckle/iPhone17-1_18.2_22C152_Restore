@interface MUDayRowView
+ (id)_hoursMonospacedFont;
- (BOOL)isStacked;
- (BOOL)shouldStackForProposedWidth:(double)a3;
- (MUDayRowView)initWithViewModel:(id)a3;
- (MUDayRowViewModel)viewModel;
- (id)_createHoursConstraints;
- (void)_refreshHoursLabel;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateAppearance;
- (void)_updateFonts;
- (void)setStacked:(BOOL)a3;
- (void)setViewModel:(id)a3;
@end

@implementation MUDayRowView

+ (id)_hoursMonospacedFont
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4FB0960];
  v10[0] = *MEMORY[0x1E4FB0968];
  v10[1] = v2;
  v11[0] = &unk_1EE404D90;
  v11[1] = &unk_1EE404DA8;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  v5 = [v4 fontDescriptor];
  v6 = [v5 fontDescriptorByAddingAttributes:v3];

  v7 = (void *)MEMORY[0x1E4FB08E0];
  [v6 pointSize];
  v8 = objc_msgSend(v7, "fontWithDescriptor:size:", v6);

  return v8;
}

- (MUDayRowView)initWithViewModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUDayRowView;
  v6 = -[MUDayRowView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    [(MUDayRowView *)v7 setAccessibilityIdentifier:@"DayRow"];
    [(MUDayRowView *)v7 _setupSubviews];
    [(MUDayRowView *)v7 _setupConstraints];
    [(MUDayRowView *)v7 _updateAppearance];
  }

  return v7;
}

- (void)_setupSubviews
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v3 = [(MUDayRowViewModel *)self->_viewModel labelHeaderString];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = +[MUInfoCardStyle labelForProminence:0];
    headerLabel = self->_headerLabel;
    self->_headerLabel = v5;

    [(MULabelViewProtocol *)self->_headerLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(MULabelViewProtocol *)self->_headerLabel setTextColor:v7];

    v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    [(MULabelViewProtocol *)self->_headerLabel setFont:v8];

    [(MULabelViewProtocol *)self->_headerLabel setAllowsDefaultTighteningForTruncation:1];
    [(MULabelViewProtocol *)self->_headerLabel setAccessibilityIdentifier:@"DayRowHeader"];
    [(MUDayRowView *)self addSubview:self->_headerLabel];
  }
  objc_super v9 = +[MUInfoCardStyle labelForProminence:0];
  dayLabel = self->_dayLabel;
  self->_dayLabel = v9;

  [(MULabelViewProtocol *)self->_dayLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(MULabelViewProtocol *)self->_dayLabel setFont:v11];

  [(MULabelViewProtocol *)self->_dayLabel setAllowsDefaultTighteningForTruncation:1];
  [(MULabelViewProtocol *)self->_dayLabel setAccessibilityIdentifier:@"DayRowDayLabel"];
  [(MUDayRowView *)self addSubview:self->_dayLabel];
  v12 = +[MUInfoCardStyle labelForProminence:0];
  hoursLabel = self->_hoursLabel;
  self->_hoursLabel = v12;

  [(MULabelViewProtocol *)self->_hoursLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MULabelViewProtocol *)self->_hoursLabel setNumberOfLines:0];
  [(MULabelViewProtocol *)self->_hoursLabel setAllowsDefaultTighteningForTruncation:1];
  [(MULabelViewProtocol *)self->_hoursLabel setTextAlignment:2 * ([(MUDayRowView *)self effectiveUserInterfaceLayoutDirection] != 1)];
  [(MULabelViewProtocol *)self->_hoursLabel setAccessibilityIdentifier:@"DayRowHoursLabel"];
  [(MUDayRowView *)self addSubview:self->_hoursLabel];
  v14 = self;
  v17[0] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  id v16 = (id)[(MUDayRowView *)self registerForTraitChanges:v15 withAction:sel__updateFonts];
}

- (void)_setupConstraints
{
  v27[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(MUDayRowViewModel *)self->_viewModel labelHeaderString];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v25 = v3;
    v24 = [(MULabelViewProtocol *)self->_headerLabel leadingAnchor];
    uint64_t v23 = [(MUDayRowView *)self leadingAnchor];
    v6 = [v24 constraintEqualToAnchor:v23];
    v27[0] = v6;
    v7 = [(MULabelViewProtocol *)self->_headerLabel trailingAnchor];
    v22 = [(MUDayRowView *)self trailingAnchor];
    v21 = [v7 constraintLessThanOrEqualToAnchor:v22];
    v27[1] = v21;
    v8 = [(MULabelViewProtocol *)self->_headerLabel topAnchor];
    objc_super v9 = [(MUDayRowView *)self topAnchor];
    v10 = [v8 constraintEqualToAnchor:v9];
    v27[2] = v10;
    v11 = [(MULabelViewProtocol *)self->_headerLabel bottomAnchor];
    v12 = [(MULabelViewProtocol *)self->_dayLabel topAnchor];
    v13 = [v11 constraintEqualToAnchor:v12 constant:-2.0];
    v27[3] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
    [v25 addObjectsFromArray:v14];

    id v3 = v25;
    v15 = (void *)v23;

    id v16 = v24;
  }
  else
  {
    id v16 = [(MULabelViewProtocol *)self->_dayLabel topAnchor];
    v15 = [(MUDayRowView *)self topAnchor];
    v6 = [v16 constraintEqualToAnchor:v15 constant:2.0];
    v26 = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    [v3 addObjectsFromArray:v7];
  }

  v17 = [(MUDayRowView *)self _createHoursConstraints];
  hoursConstraints = self->_hoursConstraints;
  self->_hoursConstraints = v17;

  [v3 addObjectsFromArray:self->_hoursConstraints];
  v19 = (void *)MEMORY[0x1E4F28DC8];
  v20 = (void *)[v3 copy];
  [v19 activateConstraints:v20];
}

- (id)_createHoursConstraints
{
  v32[6] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MUDayRowView *)self isStacked];
  uint64_t v4 = [(MULabelViewProtocol *)self->_dayLabel leadingAnchor];
  v29 = [(MUDayRowView *)self leadingAnchor];
  v30 = v4;
  uint64_t v5 = [v4 constraintEqualToAnchor:v29];
  v28 = (void *)v5;
  if (v3)
  {
    v32[0] = v5;
    v6 = [(MULabelViewProtocol *)self->_dayLabel bottomAnchor];
    v26 = [(MULabelViewProtocol *)self->_hoursLabel topAnchor];
    v27 = v6;
    v25 = [v6 constraintEqualToAnchor:v26 constant:-2.0];
    v32[1] = v25;
    v7 = [(MULabelViewProtocol *)self->_dayLabel trailingAnchor];
    uint64_t v23 = [(MULabelViewProtocol *)self->_hoursLabel trailingAnchor];
    v24 = v7;
    v22 = [v7 constraintEqualToAnchor:v23];
    v32[2] = v22;
    v8 = [(MULabelViewProtocol *)self->_hoursLabel leadingAnchor];
    objc_super v9 = [(MUDayRowView *)self leadingAnchor];
    v10 = [v8 constraintEqualToAnchor:v9];
    v32[3] = v10;
    v11 = [(MULabelViewProtocol *)self->_hoursLabel trailingAnchor];
    v12 = [(MUDayRowView *)self trailingAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v32[4] = v13;
    v14 = [(MULabelViewProtocol *)self->_hoursLabel bottomAnchor];
    v15 = [(MUDayRowView *)self bottomAnchor];
    id v16 = [v14 constraintEqualToAnchor:v15 constant:-2.0];
    v32[5] = v16;
    v17 = v32;
  }
  else
  {
    v31[0] = v5;
    v18 = [(MULabelViewProtocol *)self->_dayLabel bottomAnchor];
    v26 = [(MUDayRowView *)self bottomAnchor];
    v27 = v18;
    v25 = [v18 constraintLessThanOrEqualToAnchor:v26 constant:-2.0];
    v31[1] = v25;
    v19 = [(MULabelViewProtocol *)self->_dayLabel trailingAnchor];
    uint64_t v23 = [(MULabelViewProtocol *)self->_hoursLabel leadingAnchor];
    v24 = v19;
    v22 = [v19 constraintLessThanOrEqualToAnchor:v23];
    v31[2] = v22;
    v8 = [(MULabelViewProtocol *)self->_hoursLabel topAnchor];
    objc_super v9 = [(MULabelViewProtocol *)self->_dayLabel topAnchor];
    v10 = [v8 constraintEqualToAnchor:v9];
    v31[3] = v10;
    v11 = [(MULabelViewProtocol *)self->_hoursLabel trailingAnchor];
    v12 = [(MUDayRowView *)self trailingAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v31[4] = v13;
    v14 = [(MULabelViewProtocol *)self->_hoursLabel bottomAnchor];
    v15 = [(MUDayRowView *)self bottomAnchor];
    id v16 = [v14 constraintEqualToAnchor:v15 constant:-2.0];
    v31[5] = v16;
    v17 = v31;
  }
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:6];

  return v20;
}

- (void)setViewModel:(id)a3
{
  id v5 = a3;
  if ((-[MUDayRowViewModel isEqual:](self->_viewModel, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(MUDayRowView *)self _updateAppearance];
  }
}

- (void)_updateAppearance
{
  BOOL v3 = [(MUDayRowViewModel *)self->_viewModel labelHeaderString];
  [(MULabelViewProtocol *)self->_headerLabel setText:v3];

  uint64_t v4 = [(MUDayRowViewModel *)self->_viewModel dayString];
  [(MULabelViewProtocol *)self->_dayLabel setText:v4];

  [(MUDayRowView *)self _refreshHoursLabel];
}

- (void)_updateFonts
{
  BOOL v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(MULabelViewProtocol *)self->_dayLabel setFont:v3];

  uint64_t v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [(MULabelViewProtocol *)self->_headerLabel setFont:v4];

  [(MUDayRowView *)self _refreshHoursLabel];
}

- (void)_refreshHoursLabel
{
  id v3 = [(MUDayRowViewModel *)self->_viewModel buildDefaultPlacecardHoursString];
  [(MULabelViewProtocol *)self->_hoursLabel setAttributedText:v3];
}

- (BOOL)shouldStackForProposedWidth:(double)a3
{
  [(MUDayRowView *)self frame];
  double Width = CGRectGetWidth(v11);
  [(MULabelViewProtocol *)self->_dayLabel idealWidth];
  double v5 = Width * 0.5;
  if (v6 > v5) {
    return 1;
  }
  v8 = [(MULabelViewProtocol *)self->_hoursLabel attributedText];
  [v8 size];
  BOOL v7 = v9 > v5;

  return v7;
}

- (void)setStacked:(BOOL)a3
{
  if (self->_stacked != a3)
  {
    self->_stacked = a3;
    if ([(NSArray *)self->_hoursConstraints count])
    {
      [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_hoursConstraints];
      uint64_t v4 = [(MUDayRowView *)self _createHoursConstraints];
      hoursConstraints = self->_hoursConstraints;
      self->_hoursConstraints = v4;

      double v6 = (void *)MEMORY[0x1E4F28DC8];
      BOOL v7 = self->_hoursConstraints;
      [v6 activateConstraints:v7];
    }
  }
}

- (BOOL)isStacked
{
  return self->_stacked;
}

- (MUDayRowViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_hoursConstraints, 0);
  objc_storeStrong((id *)&self->_hoursLabel, 0);
  objc_storeStrong((id *)&self->_dayLabel, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
}

@end