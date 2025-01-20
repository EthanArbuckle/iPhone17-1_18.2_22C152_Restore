@interface MUPhotoTileView
- (CGSize)targetFrameSize;
- (MUPhotoTileOverlay)photoOverlay;
- (MUPhotoTileView)initWithFrame:(CGRect)a3;
- (MUPhotoTileViewModel)viewModel;
- (UIImageView)contentImageView;
- (id)actionHandler;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateAppearance;
- (void)_updateOverlay;
- (void)setActionHandler:(id)a3;
- (void)setPhotoOverlay:(id)a3;
- (void)setTargetFrameSize:(CGSize)a3;
- (void)setViewModel:(id)a3;
@end

@implementation MUPhotoTileView

- (MUPhotoTileView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUPhotoTileView;
  v3 = -[MUPhotoTileView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MUPhotoTileView *)v3 _setupSubviews];
    [(MUPhotoTileView *)v4 _setupConstraints];
    [(MUPhotoTileView *)v4 setAccessibilityIdentifier:@"PhotoTile"];
  }
  return v4;
}

- (void)_setupSubviews
{
  v34[3] = *MEMORY[0x1E4F143B8];
  v3 = [MUImageView alloc];
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v8 = -[MUImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  imageView = self->_imageView;
  self->_imageView = v8;

  [(MUImageView *)self->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MUImageView *)self->_imageView setClipsToBounds:1];
  v10 = +[MUInfoCardStyle punchoutButtonPlatterColor];
  [(MUImageView *)self->_imageView setBackgroundColor:v10];

  v11 = [MEMORY[0x1E4FB1818] systemImageNamed:@"photo.fill.on.rectangle.fill"];
  [(MUImageView *)self->_imageView setFallbackImage:v11];

  [(UIView *)self->_imageView _mapsui_setCardCorner];
  [(MUPhotoTileView *)self addSubview:self->_imageView];
  v12 = -[_MKGradientView initWithFrame:]([MUGradientView alloc], "initWithFrame:", v4, v5, v6, v7);
  titleGradientView = self->_titleGradientView;
  self->_titleGradientView = v12;

  [(MUGradientView *)self->_titleGradientView setClipsToBounds:1];
  [(MUGradientView *)self->_titleGradientView setTranslatesAutoresizingMaskIntoConstraints:0];
  v14 = [(MUGradientView *)self->_titleGradientView layer];
  [v14 setMaskedCorners:3];

  uint64_t v15 = *MEMORY[0x1E4F39EA8];
  v16 = [(MUGradientView *)self->_titleGradientView layer];
  [v16 setCornerCurve:v15];

  v17 = [(MUGradientView *)self->_titleGradientView layer];
  [v17 setCornerRadius:10.0];

  [(MUGradientView *)self->_titleGradientView setUserInteractionEnabled:0];
  -[_MKGradientView setStartPoint:](self->_titleGradientView, "setStartPoint:", 0.5, 0.0);
  -[_MKGradientView setEndPoint:](self->_titleGradientView, "setEndPoint:", 0.5, 1.0);
  v18 = [MEMORY[0x1E4FB1618] blackColor];
  v19 = [v18 colorWithAlphaComponent:0.38];

  v20 = [MEMORY[0x1E4FB1618] blackColor];
  v21 = [v20 colorWithAlphaComponent:0.38];

  v22 = [MEMORY[0x1E4FB1618] blackColor];
  v23 = [v22 colorWithAlphaComponent:0.0];

  v34[0] = v19;
  v34[1] = v21;
  v34[2] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];
  [(_MKGradientView *)self->_titleGradientView setColors:v24];

  v33[0] = &unk_1EE4052E0;
  v33[1] = &unk_1EE4052F0;
  v33[2] = &unk_1EE405300;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
  [(_MKGradientView *)self->_titleGradientView setLocations:v25];

  [(MUPhotoTileView *)self addSubview:self->_titleGradientView];
  v26 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v4, v5, v6, v7);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v26;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v28 = [MEMORY[0x1E4FB1618] whiteColor];
  [(UILabel *)self->_titleLabel setTextColor:v28];

  v29 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  v30 = objc_msgSend(v29, "_mapkit_fontWithWeight:", *MEMORY[0x1E4FB09E0]);
  [(UILabel *)self->_titleLabel setFont:v30];

  [(UILabel *)self->_titleLabel setAccessibilityIdentifier:@"PhotoTileTitle"];
  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  [(MUGradientView *)self->_titleGradientView addSubview:self->_titleLabel];
  v31 = -[MUBadgeView initWithFrame:]([MUBadgeView alloc], "initWithFrame:", v4, v5, v6, v7);
  vendorBadge = self->_vendorBadge;
  self->_vendorBadge = v31;

  [(MUBadgeView *)self->_vendorBadge setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MUBadgeView *)self->_vendorBadge setAccessibilityIdentifier:@"PhotoTileVendorBadge"];
  [(MUPhotoTileView *)self addSubview:self->_vendorBadge];
  [(UIView *)self _mapsui_setCardCorner];
}

- (void)_setupConstraints
{
  v52[16] = *MEMORY[0x1E4F143B8];
  v33 = (void *)MEMORY[0x1E4F28DC8];
  v51 = [(MUImageView *)self->_imageView leadingAnchor];
  v50 = [(MUPhotoTileView *)self leadingAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v52[0] = v49;
  v48 = [(MUImageView *)self->_imageView trailingAnchor];
  v47 = [(MUPhotoTileView *)self trailingAnchor];
  v46 = [v48 constraintEqualToAnchor:v47];
  v52[1] = v46;
  v45 = [(MUImageView *)self->_imageView topAnchor];
  v44 = [(MUPhotoTileView *)self topAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v52[2] = v43;
  v42 = [(MUImageView *)self->_imageView bottomAnchor];
  v41 = [(MUPhotoTileView *)self bottomAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v52[3] = v40;
  v39 = [(MUGradientView *)self->_titleGradientView leadingAnchor];
  v38 = [(MUPhotoTileView *)self leadingAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v52[4] = v37;
  v36 = [(MUGradientView *)self->_titleGradientView topAnchor];
  v35 = [(MUPhotoTileView *)self topAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v52[5] = v34;
  v32 = [(MUGradientView *)self->_titleGradientView trailingAnchor];
  v31 = [(MUPhotoTileView *)self trailingAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v52[6] = v30;
  v29 = [(MUGradientView *)self->_titleGradientView heightAnchor];
  v28 = [v29 constraintEqualToConstant:90.0];
  v52[7] = v28;
  v27 = [(UILabel *)self->_titleLabel leadingAnchor];
  v26 = [(MUGradientView *)self->_titleGradientView leadingAnchor];
  v25 = [v27 constraintEqualToAnchor:v26 constant:16.0];
  v52[8] = v25;
  v24 = [(UILabel *)self->_titleLabel topAnchor];
  v23 = [(MUGradientView *)self->_titleGradientView topAnchor];
  v22 = [v24 constraintEqualToAnchor:v23 constant:14.0];
  v52[9] = v22;
  v21 = [(UILabel *)self->_titleLabel trailingAnchor];
  v20 = [(MUGradientView *)self->_titleGradientView trailingAnchor];
  v19 = [v21 constraintLessThanOrEqualToAnchor:v20 constant:-16.0];
  v52[10] = v19;
  v18 = [(UILabel *)self->_titleLabel bottomAnchor];
  v17 = [(MUGradientView *)self->_titleGradientView bottomAnchor];
  v16 = [v18 constraintLessThanOrEqualToAnchor:v17 constant:-16.0];
  v52[11] = v16;
  uint64_t v15 = [(MUBadgeView *)self->_vendorBadge topAnchor];
  v14 = [(MUGradientView *)self->_titleGradientView bottomAnchor];
  v13 = [v15 constraintGreaterThanOrEqualToAnchor:v14 constant:8.0];
  v52[12] = v13;
  v3 = [(MUBadgeView *)self->_vendorBadge leadingAnchor];
  double v4 = [(MUPhotoTileView *)self leadingAnchor];
  double v5 = [v3 constraintGreaterThanOrEqualToAnchor:v4 constant:10.0];
  v52[13] = v5;
  double v6 = [(MUBadgeView *)self->_vendorBadge bottomAnchor];
  double v7 = [(MUPhotoTileView *)self bottomAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v52[14] = v8;
  v9 = [(MUBadgeView *)self->_vendorBadge trailingAnchor];
  v10 = [(MUPhotoTileView *)self trailingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v52[15] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:16];
  [v33 activateConstraints:v12];
}

- (UIImageView)contentImageView
{
  return [(MUImageView *)self->_imageView contentImageView];
}

- (void)setViewModel:(id)a3
{
  id v5 = a3;
  if ((-[MUPhotoTileViewModel isEqual:](self->_viewModel, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(MUPhotoTileView *)self _updateAppearance];
  }
}

- (void)setPhotoOverlay:(id)a3
{
  id v5 = a3;
  if ((-[MUPhotoTileOverlay isEqual:](self->_photoOverlay, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_photoOverlay, a3);
    [(MUPhotoTileView *)self _updateOverlay];
  }
}

- (void)_updateOverlay
{
  v3 = [(MUPhotoTileOverlay *)self->_photoOverlay tileTitle];
  [(UILabel *)self->_titleLabel setText:v3];

  double v4 = [(MUPhotoTileOverlay *)self->_photoOverlay attributionTitle];
  [(MUBadgeView *)self->_vendorBadge setBadgeString:v4];

  id v5 = [(UILabel *)self->_titleLabel text];
  -[MUGradientView setHidden:](self->_titleGradientView, "setHidden:", [v5 length] == 0);

  id v6 = [(MUBadgeView *)self->_vendorBadge badgeString];
  -[MUBadgeView setHidden:](self->_vendorBadge, "setHidden:", [v6 length] == 0);
}

- (void)_updateAppearance
{
  [(MUImageView *)self->_imageView setImage:0];
  v3 = self->_viewModel;
  [(MUPhotoTileView *)self targetFrameSize];
  double v6 = v5;
  double v7 = v4;
  double v8 = *MEMORY[0x1E4F1DB30];
  double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v5 == *MEMORY[0x1E4F1DB30] && v4 == v9)
  {
    [(MUPhotoTileView *)self frame];
    double v6 = v11;
    double v7 = v12;
  }
  if (v6 != v8 || v7 != v9)
  {
    objc_initWeak(&location, self);
    viewModel = self->_viewModel;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __36__MUPhotoTileView__updateAppearance__block_invoke;
    v15[3] = &unk_1E57501F0;
    objc_copyWeak(&v17, &location);
    v16 = v3;
    -[MUPhotoTileViewModel configureWithSize:imageProvider:](viewModel, "configureWithSize:imageProvider:", v15, v6, v7);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __36__MUPhotoTileView__updateAppearance__block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v7 = WeakRetained;
  if (WeakRetained && *((void *)WeakRetained + 59) == *(void *)(a1 + 32))
  {
    double v8 = (void *)*((void *)WeakRetained + 51);
    if (v9) {
      [v8 setImage:v9 animated:a4 ^ 1u];
    }
    else {
      objc_msgSend(v8, "setImage:");
    }
  }
}

- (CGSize)targetFrameSize
{
  double width = self->_targetFrameSize.width;
  double height = self->_targetFrameSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setTargetFrameSize:(CGSize)a3
{
  self->_targetFrameSize = a3;
}

- (MUPhotoTileOverlay)photoOverlay
{
  return self->_photoOverlay;
}

- (MUPhotoTileViewModel)viewModel
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
  objc_storeStrong((id *)&self->_photoOverlay, 0);
  objc_storeStrong((id *)&self->_yourPhotosViewLabel, 0);
  objc_storeStrong((id *)&self->_yourPhotosImageView, 0);
  objc_storeStrong((id *)&self->_yourPhotosView, 0);
  objc_storeStrong((id *)&self->_titleGradientView, 0);
  objc_storeStrong((id *)&self->_vendorBadge, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end