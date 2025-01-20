@interface MULabeledValueActionRowView
- (MULabeledValueActionRowView)initWithFrame:(CGRect)a3;
- (MULabeledValueActionViewModelProviding)viewModel;
- (double)_platterLength;
- (id)_valueLabelFont;
- (id)initForDeveloperPlaceCard;
- (void)_actionButtonTapped;
- (void)_contentSizeDidChange;
- (void)_setupSubviews;
- (void)_updateAppearance;
- (void)_updateValueText;
- (void)copy:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation MULabeledValueActionRowView

- (MULabeledValueActionRowView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MULabeledValueActionRowView;
  v3 = -[MUPlaceSectionRowView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MULabeledValueActionRowView *)v3 setAccessibilityIdentifier:@"LabeledValueActionRow"];
    [(MULabeledValueActionRowView *)v4 _setupSubviews];
  }
  return v4;
}

- (id)initForDeveloperPlaceCard
{
  id result = -[MULabeledValueActionRowView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (result) {
    *((unsigned char *)result + 520) = 1;
  }
  return result;
}

- (void)_setupSubviews
{
  v3 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
  titleValueLayoutGuide = self->_titleValueLayoutGuide;
  self->_titleValueLayoutGuide = v3;

  [(MULabeledValueActionRowView *)self addLayoutGuide:self->_titleValueLayoutGuide];
  v5 = +[MUInfoCardStyle labelForProminence:1];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v6 = [MEMORY[0x1E4F30EA8] sharedManager];
  v7 = [v6 sectionHeaderFont];
  [v5 setFont:v7];

  v8 = +[MUInfoCardStyle secondaryTextColor];
  [v5 setTextColor:v8];

  titleLabel = self->_titleLabel;
  self->_titleLabel = (MULabelViewProtocol *)v5;

  [(MULabelViewProtocol *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = [@"LabeledValueActionRow" stringByAppendingString:@"Title"];
  [(MULabelViewProtocol *)self->_titleLabel setAccessibilityIdentifier:v10];

  if (MUIdiomInTraitEnvironment(self) == 5) {
    objc_msgSend(MEMORY[0x1E4FB1DD8], "_mapsui_defaultTextView");
  }
  else {
  v11 = +[MUInfoCardStyle labelForProminence:0];
  }
  valueLabel = self->_valueLabel;
  self->_valueLabel = v11;

  [(MULabelViewProtocol *)self->_valueLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = [(MULabeledValueActionRowView *)self _valueLabelFont];
  [(MULabelViewProtocol *)self->_valueLabel setFont:v13];

  [(MULabelViewProtocol *)self->_valueLabel setNumberOfLines:0];
  v14 = [@"LabeledValueActionRow" stringByAppendingString:@"Value"];
  [(MULabelViewProtocol *)self->_valueLabel setAccessibilityIdentifier:v14];

  v15 = +[MUInfoCardStyle labelForProminence:1];
  tertiaryLabel = self->_tertiaryLabel;
  self->_tertiaryLabel = v15;

  [(MULabelViewProtocol *)self->_tertiaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v17 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [(MULabelViewProtocol *)self->_tertiaryLabel setFont:v17];

  [(MULabelViewProtocol *)self->_tertiaryLabel setNumberOfLines:4];
  v18 = +[MUInfoCardStyle secondaryTextColor];
  [(MULabelViewProtocol *)self->_tertiaryLabel setTextColor:v18];

  v19 = [@"LabeledValueActionRow" stringByAppendingString:@"TertiaryLabel"];
  [(MULabelViewProtocol *)self->_tertiaryLabel setAccessibilityIdentifier:v19];

  v20 = +[MUCirclePlatterView defaultPlatterView];
  actionPlatterView = self->_actionPlatterView;
  self->_actionPlatterView = v20;

  [(MUCirclePlatterView *)self->_actionPlatterView setTranslatesAutoresizingMaskIntoConstraints:0];
  v22 = +[MUInfoCardStyle tintColor];
  [(MUCirclePlatterView *)self->_actionPlatterView setGlyphColor:v22];

  v23 = [MEMORY[0x1E4F30EA8] sharedManager];
  v24 = [v23 sectionHeaderFont];
  [(MUCirclePlatterView *)self->_actionPlatterView setGlyphFont:v24];

  v25 = [@"LabeledValueActionRow" stringByAppendingString:@"Action"];
  [(MUCirclePlatterView *)self->_actionPlatterView setAccessibilityIdentifier:v25];

  v26 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1D38]);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v26;

  [(UITapGestureRecognizer *)self->_tapGestureRecognizer addTarget:self action:sel__actionButtonTapped];
  [(UIView *)self _mapsui_addSelectGestureRecognizerWithTarget:self action:sel__actionButtonTapped];
  v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v28 addObserver:self selector:sel__contentSizeDidChange name:*MEMORY[0x1E4FB27A8] object:0];

  MURegisterForButtonShapeEnablementChanges(self, (uint64_t)sel__updateValueText);
}

- (void)_actionButtonTapped
{
  v3 = [(MULabeledValueActionViewModelProviding *)self->_viewModel actionBlock];

  if (v3)
  {
    v4 = [(MULabeledValueActionViewModelProviding *)self->_viewModel actionBlock];
    v4[2](v4, self);
  }
}

- (void)setViewModel:(id)a3
{
  v5 = (MULabeledValueActionViewModelProviding *)a3;
  p_viewModel = &self->_viewModel;
  if (self->_viewModel != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_viewModel, a3);
    p_viewModel = (MULabeledValueActionViewModelProviding **)[(MULabeledValueActionRowView *)self _updateAppearance];
    v5 = v7;
  }
  MEMORY[0x1F41817F8](p_viewModel, v5);
}

- (void)_updateAppearance
{
  v104[9] = *MEMORY[0x1E4F143B8];
  v3 = [(MULabeledValueActionViewModelProviding *)self->_viewModel titleString];
  uint64_t v4 = [v3 length];

  if (!v4) {
    return;
  }
  v5 = [(MULabeledValueActionViewModelProviding *)self->_viewModel valueString];
  uint64_t v6 = [v5 length];

  if (!v6) {
    return;
  }
  [(MULabelViewProtocol *)self->_titleLabel removeFromSuperview];
  [(MULabelViewProtocol *)self->_valueLabel removeFromSuperview];
  [(MUCirclePlatterView *)self->_actionPlatterView removeFromSuperview];
  actionPlatterWidthConstraint = self->_actionPlatterWidthConstraint;
  self->_actionPlatterWidthConstraint = 0;

  v8 = [(MULabeledValueActionViewModelProviding *)self->_viewModel titleString];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    v10 = [(MULabeledValueActionViewModelProviding *)self->_viewModel titleString];
    [(MULabelViewProtocol *)self->_titleLabel setText:v10];

    [(MULabeledValueActionRowView *)self addSubview:self->_titleLabel];
  }
  v11 = [(MULabeledValueActionViewModelProviding *)self->_viewModel valueString];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    v13 = [(MULabeledValueActionRowView *)self _valueLabelFont];
    [(MULabelViewProtocol *)self->_valueLabel setFont:v13];

    [(MULabeledValueActionRowView *)self _updateValueText];
    [(MULabeledValueActionRowView *)self addSubview:self->_valueLabel];
  }
  v14 = [(MULabeledValueActionViewModelProviding *)self->_viewModel symbolName];
  if ([v14 length])
  {
    uint64_t v15 = [(MULabeledValueActionViewModelProviding *)self->_viewModel actionVariant];

    if (!v15)
    {
      actionPlatterView = self->_actionPlatterView;
      v17 = [(MULabeledValueActionViewModelProviding *)self->_viewModel symbolName];
      [(MUCirclePlatterView *)actionPlatterView setGlyph:v17];

      [(MULabeledValueActionRowView *)self addSubview:self->_actionPlatterView];
    }
  }
  else
  {
  }
  v18 = [(MULabeledValueActionViewModelProviding *)self->_viewModel alternativeTitleString];
  uint64_t v19 = [v18 length];

  if (v19)
  {
    v20 = [(MULabeledValueActionViewModelProviding *)self->_viewModel alternativeTitleString];
    [(MULabelViewProtocol *)self->_tertiaryLabel setText:v20];

    [(MULabeledValueActionRowView *)self addSubview:self->_tertiaryLabel];
  }
  v21 = [(MULabeledValueActionRowView *)self viewModel];
  uint64_t v22 = [v21 actionVariant];

  if (v22 == 1)
  {
    v25 = +[MUInfoCardStyle tintColor];
    [(MULabelViewProtocol *)self->_valueLabel setTextColor:v25];

    v24 = self;
  }
  else
  {
    if (v22)
    {
      id v26 = 0;
      goto LABEL_19;
    }
    v23 = [MEMORY[0x1E4FB1618] labelColor];
    [(MULabelViewProtocol *)self->_valueLabel setTextColor:v23];

    v24 = self->_actionPlatterView;
  }
  id v26 = v24;
LABEL_19:
  v100 = v26;
  [v26 addGestureRecognizer:self->_tapGestureRecognizer];
  double v27 = 4.0;
  if (!self->_isDeveloperPlaceCard)
  {
    if (+[MUInfoCardStyle containerStyle] == 1) {
      double v27 = 8.0;
    }
    else {
      double v27 = 12.0;
    }
  }
  id v101 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v94 = [(MULabelViewProtocol *)self->_titleLabel leadingAnchor];
  v91 = [(UILayoutGuide *)self->_titleValueLayoutGuide leadingAnchor];
  v88 = [v94 constraintEqualToAnchor:v91];
  v104[0] = v88;
  v86 = [(MULabelViewProtocol *)self->_titleLabel topAnchor];
  v84 = [(UILayoutGuide *)self->_titleValueLayoutGuide topAnchor];
  v83 = [v86 constraintEqualToAnchor:v84];
  v104[1] = v83;
  v82 = [(MULabelViewProtocol *)self->_titleLabel trailingAnchor];
  v81 = [(UILayoutGuide *)self->_titleValueLayoutGuide trailingAnchor];
  v80 = [v82 constraintEqualToAnchor:v81];
  v104[2] = v80;
  v79 = [(MULabelViewProtocol *)self->_titleLabel bottomAnchor];
  v78 = [(MULabelViewProtocol *)self->_valueLabel topAnchor];
  v77 = [v79 constraintEqualToAnchor:v78];
  v104[3] = v77;
  v76 = [(MULabelViewProtocol *)self->_valueLabel leadingAnchor];
  v75 = [(UILayoutGuide *)self->_titleValueLayoutGuide leadingAnchor];
  v74 = [v76 constraintEqualToAnchor:v75];
  v104[4] = v74;
  v73 = [(MULabelViewProtocol *)self->_valueLabel trailingAnchor];
  v72 = [(UILayoutGuide *)self->_titleValueLayoutGuide trailingAnchor];
  v71 = [v73 constraintEqualToAnchor:v72];
  v104[5] = v71;
  v70 = [(UILayoutGuide *)self->_titleValueLayoutGuide leadingAnchor];
  v69 = [(MULabeledValueActionRowView *)self leadingAnchor];
  v28 = [v70 constraintEqualToAnchor:v69 constant:16.0];
  v104[6] = v28;
  v29 = [(UILayoutGuide *)self->_titleValueLayoutGuide topAnchor];
  v30 = [(MULabeledValueActionRowView *)self topAnchor];
  v31 = [v29 constraintEqualToAnchor:v30 constant:v27];
  v104[7] = v31;
  v32 = [(UILayoutGuide *)self->_titleValueLayoutGuide bottomAnchor];
  v33 = [(MULabeledValueActionRowView *)self bottomAnchor];
  v34 = [v32 constraintEqualToAnchor:v33 constant:-v27];
  v104[8] = v34;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:9];
  [v101 addObjectsFromArray:v35];

  v36 = [(MULabeledValueActionViewModelProviding *)self->_viewModel alternativeTitleString];
  uint64_t v37 = [v36 length];

  v38 = [(MULabelViewProtocol *)self->_valueLabel bottomAnchor];
  if (v37)
  {
    uint64_t v92 = [(MULabelViewProtocol *)self->_tertiaryLabel topAnchor];
    v39 = [v38 constraintEqualToAnchor:v92];
    v103[0] = v39;
    v98 = [(MULabelViewProtocol *)self->_tertiaryLabel leadingAnchor];
    v95 = [(UILayoutGuide *)self->_titleValueLayoutGuide leadingAnchor];
    v89 = [v98 constraintEqualToAnchor:v95];
    v103[1] = v89;
    v40 = [(MULabelViewProtocol *)self->_tertiaryLabel trailingAnchor];
    v41 = [(UILayoutGuide *)self->_titleValueLayoutGuide trailingAnchor];
    v42 = [v40 constraintEqualToAnchor:v41];
    v103[2] = v42;
    [(MULabelViewProtocol *)self->_tertiaryLabel bottomAnchor];
    v44 = v43 = v38;
    v45 = [(UILayoutGuide *)self->_titleValueLayoutGuide bottomAnchor];
    v46 = [v44 constraintEqualToAnchor:v45];
    v103[3] = v46;
    v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:4];
    [v101 addObjectsFromArray:v47];

    v48 = (void *)v92;
    v38 = v43;
  }
  else
  {
    v48 = [(UILayoutGuide *)self->_titleValueLayoutGuide bottomAnchor];
    v39 = [v38 constraintEqualToAnchor:v48];
    [v101 addObject:v39];
  }

  v49 = [(MUCirclePlatterView *)self->_actionPlatterView superview];

  if (v49)
  {
    v50 = [(MUCirclePlatterView *)self->_actionPlatterView widthAnchor];
    [(MULabeledValueActionRowView *)self _platterLength];
    objc_msgSend(v50, "constraintEqualToConstant:");
    v51 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v52 = *(Class *)((char *)&self->super.super.super.super.super.isa + v68);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v68) = v51;

    v93 = [(UILayoutGuide *)self->_titleValueLayoutGuide trailingAnchor];
    uint64_t v87 = [(MUCirclePlatterView *)self->_actionPlatterView leadingAnchor];
    v53 = [v93 constraintEqualToAnchor:v87 constant:-16.0];
    v102[0] = v53;
    v99 = [(MUCirclePlatterView *)self->_actionPlatterView topAnchor];
    v96 = [(UILayoutGuide *)self->_titleValueLayoutGuide topAnchor];
    v90 = [v99 constraintEqualToAnchor:v96];
    v102[1] = v90;
    v85 = [(MUCirclePlatterView *)self->_actionPlatterView bottomAnchor];
    v97 = [(UILayoutGuide *)self->_titleValueLayoutGuide bottomAnchor];
    v54 = [v85 constraintLessThanOrEqualToAnchor:v97];
    uint64_t v55 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + v68);
    v102[2] = v54;
    v102[3] = v55;
    v56 = [(MUCirclePlatterView *)self->_actionPlatterView heightAnchor];
    v57 = [(MUCirclePlatterView *)self->_actionPlatterView widthAnchor];
    v58 = [v56 constraintEqualToAnchor:v57];
    v102[4] = v58;
    v59 = [(MUCirclePlatterView *)self->_actionPlatterView trailingAnchor];
    v60 = [(MULabeledValueActionRowView *)self trailingAnchor];
    v61 = [v59 constraintEqualToAnchor:v60 constant:-16.0];
    v102[5] = v61;
    v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:6];
    v63 = v101;
    [v101 addObjectsFromArray:v62];

    v64 = (void *)v87;
    v65 = v93;
  }
  else
  {
    v65 = [(UILayoutGuide *)self->_titleValueLayoutGuide trailingAnchor];
    v64 = [(MULabeledValueActionRowView *)self trailingAnchor];
    v53 = [v65 constraintEqualToAnchor:v64 constant:-16.0];
    v63 = v101;
    [v101 addObject:v53];
  }

  v66 = (void *)MEMORY[0x1E4F28DC8];
  v67 = (void *)[v63 copy];
  [v66 activateConstraints:v67];
}

- (double)_platterLength
{
  v2 = [MEMORY[0x1E4F30EA8] sharedManager];
  v3 = [v2 sectionHeaderFont];
  [v3 _scaledValueForValue:30.0];
  double v5 = v4;

  return v5;
}

- (id)_valueLabelFont
{
  if ([(MULabeledValueActionViewModelProviding *)self->_viewModel emphasizeValueString])
  {
    v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
    objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E4FB09B8]);
  }
  else
  {
    v2 = [MEMORY[0x1E4F30EA8] sharedManager];
    [v2 bodyFont];
  v3 = };

  return v3;
}

- (void)_contentSizeDidChange
{
  v3 = [MEMORY[0x1E4F30EA8] sharedManager];
  double v4 = [v3 sectionHeaderFont];
  [(MULabelViewProtocol *)self->_titleLabel setFont:v4];

  double v5 = [(MULabeledValueActionRowView *)self _valueLabelFont];
  [(MULabelViewProtocol *)self->_valueLabel setFont:v5];

  uint64_t v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [(MULabelViewProtocol *)self->_tertiaryLabel setFont:v6];

  [(MULabeledValueActionRowView *)self _platterLength];
  -[NSLayoutConstraint setConstant:](self->_actionPlatterWidthConstraint, "setConstant:");
  id v8 = [MEMORY[0x1E4F30EA8] sharedManager];
  v7 = [v8 sectionHeaderFont];
  [(MUCirclePlatterView *)self->_actionPlatterView setGlyphFont:v7];
}

- (void)_updateValueText
{
  v3 = [(MULabeledValueActionViewModelProviding *)self->_viewModel valueString];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    BOOL v5 = [(MULabeledValueActionViewModelProviding *)self->_viewModel actionVariant] == 1
      && UIAccessibilityButtonShapesEnabled();
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v7 = [MEMORY[0x1E4F30EA8] sharedManager];
    id v8 = [v7 bodyFont];
    [v12 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

    if (v5) {
      [v12 setObject:&unk_1EE404D78 forKeyedSubscript:*MEMORY[0x1E4FB0808]];
    }
    id v9 = objc_alloc(MEMORY[0x1E4F28B18]);
    v10 = [(MULabeledValueActionViewModelProviding *)self->_viewModel valueString];
    v11 = (void *)[v9 initWithString:v10 attributes:v12];
    [(MULabelViewProtocol *)self->_valueLabel setAttributedText:v11];
  }
  else
  {
    valueLabel = self->_valueLabel;
    [(MULabelViewProtocol *)valueLabel setAttributedText:0];
  }
}

- (void)copy:(id)a3
{
  id v4 = [(MULabeledValueActionViewModelProviding *)self->_viewModel valueString];
  if ([v4 length])
  {
    v3 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    [v3 setString:v4];
  }
}

- (MULabeledValueActionViewModelProviding)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_actionPlatterWidthConstraint, 0);
  objc_storeStrong((id *)&self->_actionPlatterView, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleValueLayoutGuide, 0);
}

@end