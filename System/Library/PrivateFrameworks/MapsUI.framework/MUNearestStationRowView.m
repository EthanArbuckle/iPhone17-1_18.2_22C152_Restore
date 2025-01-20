@interface MUNearestStationRowView
- (MUNearestStationRowView)initWithFrame:(CGRect)a3;
- (NSString)distanceString;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateAppearance;
- (void)_updateFonts;
- (void)configureWithNearestStation:(id)a3;
- (void)layoutSubviews;
- (void)setDistanceString:(id)a3;
@end

@implementation MUNearestStationRowView

- (MUNearestStationRowView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUNearestStationRowView;
  v3 = -[MUPlaceSectionRowView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MUNearestStationRowView *)v3 setAccessibilityIdentifier:@"MUNearestStationRowView"];
    [(MUNearestStationRowView *)v4 _setupSubviews];
    [(MUNearestStationRowView *)v4 _setupConstraints];
  }
  return v4;
}

- (void)configureWithNearestStation:(id)a3
{
  v5 = (MKMapItem *)a3;
  p_nearestStation = &self->_nearestStation;
  if (self->_nearestStation != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_nearestStation, a3);
    [(MUNearestStationRowView *)self _updateAppearance];
    p_nearestStation = (MKMapItem **)[(MULoadingOverlayController *)self->_loadingOverlayController removeLoadingOverlayAnimated:1 completion:0];
    v5 = v7;
  }
  MEMORY[0x1F41817F8](p_nearestStation, v5);
}

- (void)_updateAppearance
{
  v3 = [(MKMapItem *)self->_nearestStation artworkImage];
  [(UIImageView *)self->_stopImageView setImage:v3];

  v4 = [(MKMapItem *)self->_nearestStation stationTitle];
  [(UILabel *)self->_titleLabel setText:v4];

  v5 = [(MKMapItem *)self->_nearestStation stationCategory];
  [(UILabel *)self->_secondaryLabel setText:v5];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v8 addObject:self->_titleLabel];
  [v8 addObject:self->_secondaryLabel];
  [v8 addObject:self->_tertiaryLabel];
  labelStackView = self->_labelStackView;
  v7 = (void *)[v8 copy];
  [(UIStackView *)labelStackView _mapsui_setArrangedSubviews:v7];
}

- (void)_setupSubviews
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1838]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v8 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  stopImageView = self->_stopImageView;
  self->_stopImageView = v8;

  [(UIImageView *)self->_stopImageView setAccessibilityIdentifier:@"StopImageView"];
  [(UIImageView *)self->_stopImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_stopImageView _mapsui_setCardCorner];
  [(MUNearestStationRowView *)self addSubview:self->_stopImageView];
  v10 = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1C60]), "initWithFrame:", v4, v5, v6, v7);
  labelStackView = self->_labelStackView;
  self->_labelStackView = v10;

  [(UIStackView *)self->_labelStackView setAccessibilityIdentifier:@"LabelStackView"];
  [(UIStackView *)self->_labelStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_labelStackView setSpacing:2.0];
  [(UIStackView *)self->_labelStackView setAxis:1];
  [(UIStackView *)self->_labelStackView setDistribution:4];
  objc_msgSend(MEMORY[0x1E4FB1930], "_mapsui_defaultLabel");
  v12 = (UILabel *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v12;

  [(UILabel *)self->_titleLabel setAccessibilityIdentifier:@"TitleLabel"];
  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_msgSend(MEMORY[0x1E4FB1930], "_mapsui_defaultLabel");
  v14 = (UILabel *)objc_claimAutoreleasedReturnValue();
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v14;

  [(UILabel *)self->_secondaryLabel setAccessibilityIdentifier:@"SecondaryLabel"];
  [(UILabel *)self->_secondaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v16 = [MEMORY[0x1E4FB1618] systemGrayColor];
  [(UILabel *)self->_secondaryLabel setTextColor:v16];

  objc_msgSend(MEMORY[0x1E4FB1930], "_mapsui_defaultLabel");
  v17 = (UILabel *)objc_claimAutoreleasedReturnValue();
  tertiaryLabel = self->_tertiaryLabel;
  self->_tertiaryLabel = v17;

  [(UILabel *)self->_tertiaryLabel setAccessibilityIdentifier:@"TertiaryLabel"];
  [(UILabel *)self->_tertiaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v19 = [MEMORY[0x1E4FB1618] systemGrayColor];
  [(UILabel *)self->_tertiaryLabel setTextColor:v19];

  [(MUNearestStationRowView *)self _updateFonts];
  [(MUNearestStationRowView *)self addSubview:self->_labelStackView];
  v20 = [[MULoadingOverlayController alloc] initWithParentView:self contentView:self];
  loadingOverlayController = self->_loadingOverlayController;
  self->_loadingOverlayController = v20;

  [(MULoadingOverlayController *)self->_loadingOverlayController attachLoadingOverlay];
  v22 = self;
  v25[0] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  id v24 = (id)[(MUNearestStationRowView *)self registerForTraitChanges:v23 withAction:sel__updateFonts];
}

- (void)_setupConstraints
{
  v34[10] = *MEMORY[0x1E4F143B8];
  v22 = (void *)MEMORY[0x1E4F28DC8];
  v33 = [(UIStackView *)self->_labelStackView leadingAnchor];
  v32 = [(MUNearestStationRowView *)self leadingAnchor];
  v31 = [v33 constraintEqualToAnchor:v32 constant:16.0];
  v34[0] = v31;
  v30 = [(UIStackView *)self->_labelStackView topAnchor];
  v29 = [(MUNearestStationRowView *)self topAnchor];
  v28 = [v30 constraintEqualToAnchor:v29 constant:16.0];
  v34[1] = v28;
  v27 = [(UIStackView *)self->_labelStackView bottomAnchor];
  v26 = [(MUNearestStationRowView *)self bottomAnchor];
  v25 = [v27 constraintEqualToAnchor:v26 constant:-16.0];
  v34[2] = v25;
  id v24 = [(UIStackView *)self->_labelStackView trailingAnchor];
  v23 = [(UIImageView *)self->_stopImageView leadingAnchor];
  v21 = [v24 constraintEqualToAnchor:v23 constant:-8.0];
  v34[3] = v21;
  v20 = [(UIImageView *)self->_stopImageView topAnchor];
  v19 = [(MUNearestStationRowView *)self topAnchor];
  v18 = [v20 constraintGreaterThanOrEqualToAnchor:v19 constant:16.0];
  v34[4] = v18;
  v17 = [(UIImageView *)self->_stopImageView bottomAnchor];
  v16 = [(MUNearestStationRowView *)self bottomAnchor];
  v15 = [v17 constraintLessThanOrEqualToAnchor:v16 constant:-16.0];
  v34[5] = v15;
  v14 = [(UIImageView *)self->_stopImageView centerYAnchor];
  v13 = [(MUNearestStationRowView *)self centerYAnchor];
  id v3 = [v14 constraintEqualToAnchor:v13];
  v34[6] = v3;
  double v4 = [(UIImageView *)self->_stopImageView trailingAnchor];
  double v5 = [(MUNearestStationRowView *)self trailingAnchor];
  double v6 = [v4 constraintEqualToAnchor:v5 constant:-16.0];
  v34[7] = v6;
  double v7 = [(UIImageView *)self->_stopImageView widthAnchor];
  id v8 = [v7 constraintEqualToConstant:48.0];
  v34[8] = v8;
  v9 = [(UIImageView *)self->_stopImageView heightAnchor];
  v10 = [(UIImageView *)self->_stopImageView widthAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v34[9] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:10];
  [v22 activateConstraints:v12];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MUNearestStationRowView;
  [(MKViewWithHairline *)&v3 layoutSubviews];
  [(MULoadingOverlayController *)self->_loadingOverlayController updateLayoutForBoundsChange];
}

- (void)setDistanceString:(id)a3
{
}

- (NSString)distanceString
{
  return [(UILabel *)self->_tertiaryLabel text];
}

- (void)_updateFonts
{
  objc_super v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  double v4 = objc_msgSend(v3, "_mapkit_fontWithWeight:", *MEMORY[0x1E4FB09E0]);
  [(UILabel *)self->_titleLabel setFont:v4];

  uint64_t v5 = *MEMORY[0x1E4FB2950];
  double v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [(UILabel *)self->_secondaryLabel setFont:v6];

  id v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v5];
  [(UILabel *)self->_tertiaryLabel setFont:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingOverlayController, 0);
  objc_storeStrong((id *)&self->_nearestStation, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_stopImageView, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end