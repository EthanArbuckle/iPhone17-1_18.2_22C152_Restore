@interface MUCuratedCollectionSummaryView
- (MUCuratedCollectionSummary)viewModel;
- (MUCuratedCollectionSummaryView)initWithFrame:(CGRect)a3;
- (id)_attributesWithFont:(id)a3 color:(id)a4;
- (id)publisherString;
- (void)_contentSizeDidChange;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateAppearance;
- (void)_updateImageViewForInterfaceStyle;
- (void)setViewModel:(id)a3;
@end

@implementation MUCuratedCollectionSummaryView

- (MUCuratedCollectionSummaryView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUCuratedCollectionSummaryView;
  v3 = -[MUCuratedCollectionSummaryView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MUCuratedCollectionSummaryView *)v3 setAccessibilityIdentifier:@"CuratedCollectionSummary"];
    [(MUCuratedCollectionSummaryView *)v4 _setupSubviews];
    [(MUCuratedCollectionSummaryView *)v4 _setupConstraints];
  }
  return v4;
}

- (void)setViewModel:(id)a3
{
  id v5 = a3;
  if ((-[MUCuratedCollectionSummary isEqual:](self->_viewModel, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(MUCuratedCollectionSummaryView *)self _updateAppearance];
  }
}

- (void)_setupSubviews
{
  v22[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend(MEMORY[0x1E4FB1930], "_mapsui_defaultLabel");
  v3 = (UILabel *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_titleLabel setNumberOfLines:1];
  id v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  objc_super v6 = objc_msgSend(v5, "_mapkit_fontWithWeight:", *MEMORY[0x1E4FB09B8]);
  [(UILabel *)self->_titleLabel setFont:v6];

  [(UILabel *)self->_titleLabel setAccessibilityIdentifier:@"CuratedCollectionSummaryTitle"];
  [(MUCuratedCollectionSummaryView *)self addSubview:self->_titleLabel];
  objc_msgSend(MEMORY[0x1E4FB1930], "_mapsui_defaultLabel");
  v7 = (UILabel *)objc_claimAutoreleasedReturnValue();
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v7;

  [(UILabel *)self->_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_descriptionLabel setNumberOfLines:1];
  v9 = [MEMORY[0x1E4FB1618] systemGrayColor];
  [(UILabel *)self->_descriptionLabel setTextColor:v9];

  [(UILabel *)self->_descriptionLabel setAccessibilityIdentifier:@"CuratedCollectionSummaryDescription"];
  [(MUCuratedCollectionSummaryView *)self addSubview:self->_descriptionLabel];
  id v10 = objc_alloc(MEMORY[0x1E4FB1838]);
  v11 = (UIImageView *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  imageView = self->_imageView;
  self->_imageView = v11;

  [(UIImageView *)self->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_imageView setClipsToBounds:1];
  [(UIImageView *)self->_imageView _setContinuousCornerRadius:4.0];
  [(UIImageView *)self->_imageView setAccessibilityIdentifier:@"CuratedCollectionSummaryImage"];
  [(MUCuratedCollectionSummaryView *)self addSubview:self->_imageView];
  v13 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
  layoutGuide = self->_layoutGuide;
  self->_layoutGuide = v13;

  [(MUCuratedCollectionSummaryView *)self addLayoutGuide:self->_layoutGuide];
  v15 = self;
  v22[0] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  id v17 = (id)[(MUCuratedCollectionSummaryView *)self registerForTraitChanges:v16 withAction:sel__updateImageViewForInterfaceStyle];

  v18 = self;
  v21 = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  id v20 = (id)[(MUCuratedCollectionSummaryView *)self registerForTraitChanges:v19 withAction:sel__contentSizeDidChange];
}

- (void)_setupConstraints
{
  v57[18] = *MEMORY[0x1E4F143B8];
  v36 = (void *)MEMORY[0x1E4F28DC8];
  v56 = [(UIImageView *)self->_imageView leadingAnchor];
  v55 = [(MUCuratedCollectionSummaryView *)self leadingAnchor];
  v54 = [v56 constraintEqualToAnchor:v55];
  v57[0] = v54;
  v53 = [(UIImageView *)self->_imageView topAnchor];
  v52 = [(MUCuratedCollectionSummaryView *)self topAnchor];
  v51 = [v53 constraintGreaterThanOrEqualToAnchor:v52];
  v57[1] = v51;
  v50 = [(UIImageView *)self->_imageView centerYAnchor];
  v49 = [(MUCuratedCollectionSummaryView *)self centerYAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v57[2] = v48;
  v47 = [(UIImageView *)self->_imageView bottomAnchor];
  v46 = [(MUCuratedCollectionSummaryView *)self bottomAnchor];
  v45 = [v47 constraintLessThanOrEqualToAnchor:v46];
  v57[3] = v45;
  v44 = [(UIImageView *)self->_imageView widthAnchor];
  v43 = [v44 constraintEqualToConstant:36.0];
  v57[4] = v43;
  v42 = [(UIImageView *)self->_imageView heightAnchor];
  v41 = [v42 constraintEqualToConstant:36.0];
  v57[5] = v41;
  v40 = [(UILayoutGuide *)self->_layoutGuide leadingAnchor];
  v39 = [(UIImageView *)self->_imageView trailingAnchor];
  v38 = [v40 constraintEqualToAnchor:v39 constant:8.0];
  v57[6] = v38;
  v37 = [(UILayoutGuide *)self->_layoutGuide topAnchor];
  v35 = [(MUCuratedCollectionSummaryView *)self topAnchor];
  v34 = [v37 constraintGreaterThanOrEqualToAnchor:v35];
  v57[7] = v34;
  v33 = [(UILayoutGuide *)self->_layoutGuide bottomAnchor];
  v32 = [(MUCuratedCollectionSummaryView *)self bottomAnchor];
  v31 = [v33 constraintLessThanOrEqualToAnchor:v32];
  v57[8] = v31;
  v30 = [(UILayoutGuide *)self->_layoutGuide trailingAnchor];
  v29 = [(MUCuratedCollectionSummaryView *)self trailingAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v57[9] = v28;
  v27 = [(UILayoutGuide *)self->_layoutGuide centerYAnchor];
  v26 = [(MUCuratedCollectionSummaryView *)self centerYAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v57[10] = v25;
  v24 = [(UILabel *)self->_titleLabel topAnchor];
  v23 = [(UILayoutGuide *)self->_layoutGuide topAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v57[11] = v22;
  v21 = [(UILabel *)self->_titleLabel leadingAnchor];
  id v20 = [(UILayoutGuide *)self->_layoutGuide leadingAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v57[12] = v19;
  v18 = [(UILabel *)self->_titleLabel trailingAnchor];
  id v17 = [(UILayoutGuide *)self->_layoutGuide trailingAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v57[13] = v16;
  v15 = [(UILabel *)self->_titleLabel bottomAnchor];
  v14 = [(UILabel *)self->_descriptionLabel topAnchor];
  v13 = [v15 constraintEqualToAnchor:v14];
  v57[14] = v13;
  v3 = [(UILabel *)self->_descriptionLabel leadingAnchor];
  v4 = [(UILayoutGuide *)self->_layoutGuide leadingAnchor];
  id v5 = [v3 constraintEqualToAnchor:v4];
  v57[15] = v5;
  objc_super v6 = [(UILabel *)self->_descriptionLabel trailingAnchor];
  v7 = [(UILayoutGuide *)self->_layoutGuide trailingAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v57[16] = v8;
  v9 = [(UILabel *)self->_descriptionLabel bottomAnchor];
  id v10 = [(UILayoutGuide *)self->_layoutGuide bottomAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v57[17] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:18];
  [v36 activateConstraints:v12];
}

- (void)_updateAppearance
{
  viewModel = self->_viewModel;
  v4 = [(MUCuratedCollectionSummaryView *)self traitCollection];
  id v5 = -[MUCuratedCollectionSummary publisherIconForIsNightMode:](viewModel, "publisherIconForIsNightMode:", [v4 userInterfaceStyle] == 1);
  [(UIImageView *)self->_imageView setImage:v5];

  objc_super v6 = [(MUCuratedCollectionSummary *)self->_viewModel collectionName];
  [(UILabel *)self->_titleLabel setText:v6];

  id v7 = [(MUCuratedCollectionSummaryView *)self publisherString];
  [(UILabel *)self->_descriptionLabel setAttributedText:v7];
}

- (id)_attributesWithFont:(id)a3 color:(id)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4FB0700];
  v11[0] = *MEMORY[0x1E4FB06F8];
  v11[1] = v5;
  v12[0] = a3;
  v12[1] = a4;
  objc_super v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (void)_contentSizeDidChange
{
  v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  v4 = objc_msgSend(v3, "_mapkit_fontWithWeight:", *MEMORY[0x1E4FB09B8]);
  [(UILabel *)self->_titleLabel setFont:v4];

  id v5 = [(MUCuratedCollectionSummaryView *)self publisherString];
  [(UILabel *)self->_descriptionLabel setAttributedText:v5];
}

- (id)publisherString
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(MUCuratedCollectionSummary *)self->_viewModel publisherName];
  uint64_t v5 = [v4 length];

  unint64_t v6 = 0x1E4F28000uLL;
  if (v5)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28E48]);
    id v8 = [(MUCuratedCollectionSummary *)self->_viewModel publisherName];
    v9 = (void *)[v7 initWithString:v8];

    uint64_t v10 = *MEMORY[0x1E4FB28F0];
    v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
    v12 = +[MUInfoCardStyle textColor];
    v13 = [(MUCuratedCollectionSummaryView *)self _attributesWithFont:v11 color:v12];
    v14 = [(MUCuratedCollectionSummary *)self->_viewModel publisherName];
    objc_msgSend(v9, "addAttributes:range:", v13, 0, objc_msgSend(v14, "length"));

    [v3 addObject:v9];
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:@" · "];
    v16 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v10];
    id v17 = +[MUInfoCardStyle secondaryTextColor];
    v18 = [(MUCuratedCollectionSummaryView *)self _attributesWithFont:v16 color:v17];
    objc_msgSend(v15, "addAttributes:range:", v18, 0, objc_msgSend(v15, "length"));

    unint64_t v6 = 0x1E4F28000;
    v19 = (void *)[v15 copy];
    [v3 addObject:v19];
  }
  else
  {
    uint64_t v10 = *MEMORY[0x1E4FB28F0];
  }
  id v20 = _MULocalizedStringFromThisBundle(@"Number of places [Placecard]");
  v21 = objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v20, @"%lu", 0, -[MUCuratedCollectionSummary numberOfPlaces](self->_viewModel, "numberOfPlaces"));
  v22 = (void *)[objc_alloc(*(Class *)(v6 + 3656)) initWithString:v21];
  v23 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v10];
  v24 = +[MUInfoCardStyle secondaryTextColor];
  v25 = [(MUCuratedCollectionSummaryView *)self _attributesWithFont:v23 color:v24];
  objc_msgSend(v22, "addAttributes:range:", v25, 0, objc_msgSend(v22, "length"));

  v26 = (void *)[v22 copy];
  [v3 addObject:v26];

  v27 = (void *)[v3 copy];
  v28 = +[MapsUILayout buildAttributedDisplayStringForComponents:v27 forContainingView:self];

  return v28;
}

- (void)_updateImageViewForInterfaceStyle
{
  viewModel = self->_viewModel;
  id v5 = [(MUCuratedCollectionSummaryView *)self traitCollection];
  v4 = -[MUCuratedCollectionSummary publisherIconForIsNightMode:](viewModel, "publisherIconForIsNightMode:", [v5 userInterfaceStyle] != 2);
  [(UIImageView *)self->_imageView setImage:v4];
}

- (MUCuratedCollectionSummary)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_layoutGuide, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end