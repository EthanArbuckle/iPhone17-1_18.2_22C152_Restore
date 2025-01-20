@interface MUOverallRatingPlatterView
- (CGSize)intrinsicContentSize;
- (MUOverallRatingPlatterView)initWithFrame:(CGRect)a3;
- (MUOverallRatingPlatterViewModel)viewModel;
- (NSAttributedString)ratingString;
- (NSAttributedString)starString;
- (id)_attributesWithFont:(id)a3 color:(id)a4;
- (void)_contentSizeDidChange;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateAppearance;
- (void)_updateAttribution;
- (void)addSelectionGestureWithTarget:(id)a3 action:(SEL)a4;
- (void)setViewModel:(id)a3;
@end

@implementation MUOverallRatingPlatterView

- (MUOverallRatingPlatterView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUOverallRatingPlatterView;
  v3 = -[MUOverallRatingPlatterView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MUOverallRatingPlatterView *)v3 setAccessibilityIdentifier:@"OverallRatingPlatter"];
    [(MUOverallRatingPlatterView *)v4 _setupSubviews];
    [(MUOverallRatingPlatterView *)v4 _setupConstraints];
  }
  return v4;
}

- (void)_setupSubviews
{
  v16[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend(MEMORY[0x1E4FB1930], "_mapsui_defaultLabel");
  v3 = (UILabel *)objc_claimAutoreleasedReturnValue();
  attributionLabel = self->_attributionLabel;
  self->_attributionLabel = v3;

  [(UILabel *)self->_attributionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_attributionLabel set_mapsui_numberOfLines:1];
  [(UILabel *)self->_attributionLabel setAccessibilityIdentifier:@"OverallRatingPlatterAttribution"];
  [(MUOverallRatingPlatterView *)self addSubview:self->_attributionLabel];
  objc_msgSend(MEMORY[0x1E4FB1930], "_mapsui_defaultLabel");
  v5 = (UILabel *)objc_claimAutoreleasedReturnValue();
  starLabel = self->_starLabel;
  self->_starLabel = v5;

  [(UILabel *)self->_starLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_starLabel set_mapsui_numberOfLines:1];
  [(UILabel *)self->_starLabel setAccessibilityIdentifier:@"OverallRatingPlatterStarLabel"];
  [(MUOverallRatingPlatterView *)self addSubview:self->_starLabel];
  objc_msgSend(MEMORY[0x1E4FB1930], "_mapsui_defaultLabel");
  v7 = (UILabel *)objc_claimAutoreleasedReturnValue();
  ratingLabel = self->_ratingLabel;
  self->_ratingLabel = v7;

  [(UILabel *)self->_ratingLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_ratingLabel set_mapsui_numberOfLines:0];
  [(UILabel *)self->_ratingLabel setAccessibilityIdentifier:@"OverallRatingPlatterRatingLabel"];
  [(MUOverallRatingPlatterView *)self addSubview:self->_ratingLabel];
  v9 = self;
  v16[0] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v11 = (id)[(MUOverallRatingPlatterView *)self registerForTraitChanges:v10 withAction:sel__contentSizeDidChange];

  v12 = self;
  v15 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  id v14 = (id)[(MUOverallRatingPlatterView *)self registerForTraitChanges:v13 withAction:sel__updateAttribution];
}

- (void)_setupConstraints
{
  v35[10] = *MEMORY[0x1E4F143B8];
  v23 = (void *)MEMORY[0x1E4F28DC8];
  v34 = [(UILabel *)self->_attributionLabel topAnchor];
  v33 = [(MUOverallRatingPlatterView *)self topAnchor];
  v32 = [v34 constraintEqualToAnchor:v33 constant:16.0];
  v35[0] = v32;
  v31 = [(UILabel *)self->_attributionLabel leadingAnchor];
  v30 = [(MUOverallRatingPlatterView *)self leadingAnchor];
  v29 = [v31 constraintEqualToAnchor:v30 constant:16.0];
  v35[1] = v29;
  v28 = [(UILabel *)self->_attributionLabel trailingAnchor];
  v27 = [(MUOverallRatingPlatterView *)self trailingAnchor];
  v26 = [v28 constraintEqualToAnchor:v27 constant:-16.0];
  v35[2] = v26;
  v25 = [(UILabel *)self->_attributionLabel bottomAnchor];
  v24 = [(UILabel *)self->_starLabel topAnchor];
  v22 = [v25 constraintLessThanOrEqualToAnchor:v24 constant:-8.0];
  v35[3] = v22;
  v21 = [(UILabel *)self->_starLabel leadingAnchor];
  v20 = [(MUOverallRatingPlatterView *)self leadingAnchor];
  v19 = [v21 constraintEqualToAnchor:v20 constant:16.0];
  v35[4] = v19;
  v18 = [(UILabel *)self->_starLabel trailingAnchor];
  v17 = [(MUOverallRatingPlatterView *)self trailingAnchor];
  v16 = [v18 constraintEqualToAnchor:v17 constant:-16.0];
  v35[5] = v16;
  v15 = [(UILabel *)self->_starLabel bottomAnchor];
  id v14 = [(UILabel *)self->_ratingLabel topAnchor];
  v13 = [v15 constraintEqualToAnchor:v14];
  v35[6] = v13;
  v3 = [(UILabel *)self->_ratingLabel leadingAnchor];
  v4 = [(MUOverallRatingPlatterView *)self leadingAnchor];
  v5 = [v3 constraintEqualToAnchor:v4 constant:16.0];
  v35[7] = v5;
  objc_super v6 = [(UILabel *)self->_ratingLabel trailingAnchor];
  v7 = [(MUOverallRatingPlatterView *)self trailingAnchor];
  v8 = [v6 constraintEqualToAnchor:v7 constant:-16.0];
  v35[8] = v8;
  v9 = [(UILabel *)self->_ratingLabel bottomAnchor];
  v10 = [(MUOverallRatingPlatterView *)self bottomAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10 constant:-16.0];
  v35[9] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:10];
  [v23 activateConstraints:v12];
}

- (void)addSelectionGestureWithTarget:(id)a3 action:(SEL)a4
{
  id v8 = a3;
  if (self->_tapGestureRecognizer) {
    -[MUOverallRatingPlatterView removeGestureRecognizer:](self, "removeGestureRecognizer:");
  }
  objc_super v6 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v8 action:a4];
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v6;

  [(MUOverallRatingPlatterView *)self addGestureRecognizer:self->_tapGestureRecognizer];
}

- (void)setViewModel:(id)a3
{
  id v5 = a3;
  if ((-[MUOverallRatingPlatterViewModel isEqual:](self->_viewModel, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(MUOverallRatingPlatterView *)self _updateAppearance];
  }
}

- (NSAttributedString)ratingString
{
  v36[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F28E48]);
  v4 = NSString;
  [(MUOverallRatingPlatterViewModel *)self->_viewModel rating];
  objc_super v6 = objc_msgSend(v4, "localizedStringWithFormat:", @"%.1f", v5);
  v7 = (void *)[v3 initWithString:v6];

  uint64_t v8 = *MEMORY[0x1E4FB2990];
  v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2990]];
  double v10 = *MEMORY[0x1E4FB09B8];
  id v11 = objc_msgSend(v9, "_mapkit_fontWithWeight:", *MEMORY[0x1E4FB09B8]);
  v12 = [MEMORY[0x1E4FB1618] labelColor];
  v13 = [(MUOverallRatingPlatterView *)self _attributesWithFont:v11 color:v12];
  v32 = v7;
  objc_msgSend(v7, "addAttributes:range:", v13, 0, objc_msgSend(v7, "length"));

  id v35 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MUOverallRatingPlatterViewModel numberOfVotes](self->_viewModel, "numberOfVotes"));
  v34 = [v35 stringFromNumber:v14];

  v15 = NSString;
  v16 = _MULocalizedStringFromThisBundle(@"(%@) [Number of Votes]");
  v33 = objc_msgSend(v15, "stringWithFormat:", v16, v34);

  v17 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v33];
  v18 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v20 = [(MUOverallRatingPlatterView *)self _attributesWithFont:v18 color:v19];
  objc_msgSend(v17, "addAttributes:range:", v20, 0, objc_msgSend(v17, "length"));

  v21 = (void *)[v7 copy];
  v36[0] = v21;
  id v22 = objc_alloc(MEMORY[0x1E4F28B18]);
  v23 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v8];
  v24 = objc_msgSend(v23, "_mapkit_fontWithWeight:", v10);
  v25 = [MEMORY[0x1E4FB1618] labelColor];
  v26 = [(MUOverallRatingPlatterView *)self _attributesWithFont:v24 color:v25];
  v27 = (void *)[v22 initWithString:@" " attributes:v26];
  v36[1] = v27;
  v28 = (void *)[v17 copy];
  v36[2] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
  v30 = +[MapsUILayout buildAttributedDisplayStringForComponents:v29];

  return (NSAttributedString *)v30;
}

- (NSAttributedString)starString
{
  id v3 = (void *)MEMORY[0x1E4F31030];
  [(MUOverallRatingPlatterViewModel *)self->_viewModel rating];
  double v5 = v4;
  objc_super v6 = [MEMORY[0x1E4F30EA8] sharedManager];
  v7 = [v6 largeTitleFont];
  uint64_t v8 = [(MUOverallRatingPlatterView *)self mk_theme];
  v9 = [v3 ratingAsAttributedString:v7 baseFont:2 style:v8 theme:v5];

  return (NSAttributedString *)v9;
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

- (void)_updateAppearance
{
  id v3 = [(MUOverallRatingPlatterViewModel *)self->_viewModel attributionText];
  [(UILabel *)self->_attributionLabel setAttributedText:v3];

  double v4 = [(MUOverallRatingPlatterView *)self starString];
  [(UILabel *)self->_starLabel setAttributedText:v4];

  id v5 = [(MUOverallRatingPlatterView *)self ratingString];
  [(UILabel *)self->_ratingLabel setAttributedText:v5];
}

- (void)_contentSizeDidChange
{
  id v3 = [(MUOverallRatingPlatterViewModel *)self->_viewModel attributionText];
  [(UILabel *)self->_attributionLabel setAttributedText:v3];

  id v4 = [(MUOverallRatingPlatterView *)self starString];
  [(UILabel *)self->_starLabel setAttributedText:v4];
}

- (void)_updateAttribution
{
  id v3 = [(MUOverallRatingPlatterViewModel *)self->_viewModel attributionText];
  [(UILabel *)self->_attributionLabel setAttributedText:v3];
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x1E4FB30D8];
  double v3 = 150.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (MUOverallRatingPlatterViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_ratingLabel, 0);
  objc_storeStrong((id *)&self->_starLabel, 0);
  objc_storeStrong((id *)&self->_attributionLabel, 0);
}

@end