@interface _ASCABLEQRCodeView
- (CGSize)intrinsicContentSize;
- (_ASCABLEQRCodeView)initWithMessage:(id)a3;
- (id)_qrCodeASImage;
- (id)_qrCodeCIImage;
- (id)_qrCodeColor;
- (void)_updatePlatterBorderStyle;
- (void)_updateQRCodeImage;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation _ASCABLEQRCodeView

- (_ASCABLEQRCodeView)initWithMessage:(id)a3
{
  v63[13] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v62.receiver = self;
  v62.super_class = (Class)_ASCABLEQRCodeView;
  v5 = -[_ASCABLEQRCodeView initWithFrame:](&v62, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    message = v5->_message;
    v5->_message = (NSString *)v6;

    v8 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    platterView = v5->_platterView;
    v5->_platterView = v8;

    [(UIView *)v5->_platterView setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [MEMORY[0x263F825C8] whiteColor];
    [(UIView *)v5->_platterView setBackgroundColor:v10];

    v11 = [(UIView *)v5->_platterView layer];
    [v11 setCornerRadius:8.0];

    uint64_t v12 = *MEMORY[0x263F15A20];
    [(UIView *)v5->_platterView layer];
    v13 = id v61 = v4;
    [v13 setCornerCurve:v12];

    [(_ASCABLEQRCodeView *)v5 addSubview:v5->_platterView];
    v14 = objc_alloc_init(_ASCABLEQRCodeImageView);
    imageView = v5->_imageView;
    v5->_imageView = v14;

    [(_ASCABLEQRCodeImageView *)v5->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_ASCABLEQRCodeView *)v5 addSubview:v5->_imageView];
    v16 = objc_alloc_init(_ASCABLEQRCodeBadgeView);
    badgeView = v5->_badgeView;
    v5->_badgeView = v16;

    [(_ASCABLEQRCodeBadgeView *)v5->_badgeView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_ASCABLEQRCodeView *)v5 addSubview:v5->_badgeView];
    v45 = (void *)MEMORY[0x263F08938];
    v60 = [(UIView *)v5->_platterView leadingAnchor];
    v59 = [(_ASCABLEQRCodeView *)v5 leadingAnchor];
    v58 = [v60 constraintEqualToAnchor:v59];
    v63[0] = v58;
    v57 = [(UIView *)v5->_platterView trailingAnchor];
    v56 = [(_ASCABLEQRCodeView *)v5 trailingAnchor];
    v55 = [v57 constraintEqualToAnchor:v56];
    v63[1] = v55;
    v54 = [(UIView *)v5->_platterView topAnchor];
    v53 = [(_ASCABLEQRCodeView *)v5 topAnchor];
    v52 = [v54 constraintEqualToAnchor:v53];
    v63[2] = v52;
    v51 = [(UIView *)v5->_platterView bottomAnchor];
    v50 = [(_ASCABLEQRCodeView *)v5 bottomAnchor];
    v49 = [v51 constraintEqualToAnchor:v50];
    v63[3] = v49;
    v48 = [(_ASCABLEQRCodeImageView *)v5->_imageView leadingAnchor];
    v47 = [(UIView *)v5->_platterView leadingAnchor];
    v46 = [v48 constraintEqualToAnchor:v47 constant:10.0];
    v63[4] = v46;
    v44 = [(UIView *)v5->_platterView trailingAnchor];
    v43 = [(_ASCABLEQRCodeImageView *)v5->_imageView trailingAnchor];
    v42 = [v44 constraintEqualToAnchor:v43 constant:10.0];
    v63[5] = v42;
    v41 = [(_ASCABLEQRCodeImageView *)v5->_imageView topAnchor];
    v40 = [(UIView *)v5->_platterView topAnchor];
    v39 = [v41 constraintEqualToAnchor:v40 constant:10.0];
    v63[6] = v39;
    v38 = [(UIView *)v5->_platterView bottomAnchor];
    v37 = [(_ASCABLEQRCodeImageView *)v5->_imageView bottomAnchor];
    v36 = [v38 constraintEqualToAnchor:v37 constant:10.0];
    v63[7] = v36;
    v35 = [(_ASCABLEQRCodeBadgeView *)v5->_badgeView widthAnchor];
    v34 = [(_ASCABLEQRCodeImageView *)v5->_imageView widthAnchor];
    v33 = [v35 constraintEqualToAnchor:v34 multiplier:0.3];
    v63[8] = v33;
    v32 = [(_ASCABLEQRCodeBadgeView *)v5->_badgeView heightAnchor];
    v31 = [(_ASCABLEQRCodeImageView *)v5->_imageView heightAnchor];
    v30 = [v32 constraintEqualToAnchor:v31 multiplier:0.3];
    v63[9] = v30;
    v29 = [(_ASCABLEQRCodeBadgeView *)v5->_badgeView centerXAnchor];
    v18 = [(_ASCABLEQRCodeImageView *)v5->_imageView centerXAnchor];
    v19 = [v29 constraintEqualToAnchor:v18];
    v63[10] = v19;
    v20 = [(_ASCABLEQRCodeBadgeView *)v5->_badgeView centerYAnchor];
    v21 = [(_ASCABLEQRCodeImageView *)v5->_imageView centerYAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    v63[11] = v22;
    v23 = [(_ASCABLEQRCodeView *)v5 widthAnchor];
    v24 = [(_ASCABLEQRCodeView *)v5 heightAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    v63[12] = v25;
    v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:13];
    [v45 activateConstraints:v26];

    id v4 = v61;
    [(_ASCABLEQRCodeView *)v5 _updatePlatterBorderStyle];
    [(_ASCABLEQRCodeView *)v5 _updateQRCodeImage];
    v27 = v5;
  }

  return v5;
}

- (CGSize)intrinsicContentSize
{
  int v2 = [MEMORY[0x263F29440] isPad];
  double v3 = 220.0;
  if (v2) {
    double v3 = 250.0;
  }
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_ASCABLEQRCodeView;
  [(_ASCABLEQRCodeView *)&v4 traitCollectionDidChange:a3];
  [(_ASCABLEQRCodeView *)self _updatePlatterBorderStyle];
  [(_ASCABLEQRCodeView *)self _updateQRCodeImage];
}

- (id)_qrCodeASImage
{
  int v2 = [(_ASCABLEQRCodeView *)self _qrCodeCIImage];
  [v2 extent];
  CGRect v14 = CGRectInset(v13, 1.0, 1.0);
  double x = v14.origin.x;
  double y = v14.origin.y;
  double width = v14.size.width;
  double height = v14.size.height;
  v7 = [MEMORY[0x263F00628] context];
  v8 = objc_msgSend(v7, "createCGImage:fromRect:", v2, x, y, width, height);

  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x263F663B8]);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __36___ASCABLEQRCodeView__qrCodeASImage__block_invoke;
    v11[3] = &__block_descriptor_40_e5_v8__0l;
    v11[4] = v8;
    [v9 setHandler:v11];
    v8 = [MEMORY[0x263F827E8] imageWithCGImage:v8];
  }

  return v8;
}

- (id)_qrCodeCIImage
{
  double v3 = [MEMORY[0x263F00640] QRCodeGenerator];
  objc_super v4 = [(NSString *)self->_message dataUsingEncoding:4];
  [v3 setMessage:v4];

  v5 = [v3 outputImage];
  [v5 extent];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  CGRect v14 = [MEMORY[0x263F00640] blendWithMaskFilter];
  v15 = (void *)MEMORY[0x263F00650];
  v16 = [(_ASCABLEQRCodeView *)self _qrCodeColor];
  v17 = [v15 imageWithColor:v16];
  [v14 setBackgroundImage:v17];

  v18 = (void *)MEMORY[0x263F00650];
  v19 = [MEMORY[0x263F00608] clearColor];
  v20 = [v18 imageWithColor:v19];
  [v14 setInputImage:v20];

  [v14 setMaskImage:v5];
  v21 = [v14 outputImage];
  v22 = objc_msgSend(v21, "imageByCroppingToRect:", v7, v9, v11, v13);

  return v22;
}

- (void)_updateQRCodeImage
{
  id v3 = [(_ASCABLEQRCodeView *)self _qrCodeASImage];
  [(_ASCABLEQRCodeImageView *)self->_imageView setImage:v3];
}

- (void)_updatePlatterBorderStyle
{
  id v3 = [(_ASCABLEQRCodeView *)self traitCollection];
  [v3 displayScale];
  double v5 = 1.0 / v4;
  double v6 = [(UIView *)self->_platterView layer];
  [v6 setBorderWidth:v5];

  id v9 = [MEMORY[0x263F825C8] separatorColor];
  uint64_t v7 = [v9 CGColor];
  double v8 = [(UIView *)self->_platterView layer];
  [v8 setBorderColor:v7];
}

- (id)_qrCodeColor
{
  int v2 = (void *)MEMORY[0x263F00608];
  qrCodeContentsColor();
  id v3 = objc_claimAutoreleasedReturnValue();
  double v4 = objc_msgSend(v2, "colorWithCGColor:", objc_msgSend(v3, "CGColor"));

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end