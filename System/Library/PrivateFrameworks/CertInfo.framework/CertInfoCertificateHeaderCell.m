@interface CertInfoCertificateHeaderCell
- (CertInfoCertificateHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (double)rowHeight;
- (id)_certificateImage;
- (id)_notTrustedGradient;
- (id)_subtitleLabel;
- (id)_titleLabel;
- (id)_trustedLabel;
- (void)layoutSubviews;
- (void)setExpired:(BOOL)a3;
- (void)setTrustSubtitle:(id)a3;
- (void)setTrustTitle:(id)a3;
@end

@implementation CertInfoCertificateHeaderCell

- (CertInfoCertificateHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)CertInfoCertificateHeaderCell;
  v4 = [(CertInfoCertificateHeaderCell *)&v13 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(CertInfoCertificateHeaderCell *)v4 imageView];
    v7 = [(CertInfoCertificateHeaderCell *)v5 _certificateImage];
    [v6 setImage:v7];

    v8 = [(CertInfoCertificateHeaderCell *)v5 imageView];
    [v8 sizeToFit];

    v9 = [(CertInfoCertificateHeaderCell *)v5 _trustedLabel];
    v10 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CertInfo"];
    v11 = [v10 localizedStringForKey:@"NOT_TRUSTED" value:&stru_26C9B5AF8 table:@"CertInfo"];
    [v9 setText:v11];

    [v9 sizeToFit];
    [(CertInfoCertificateHeaderCell *)v5 setAutoresizesSubviews:0];
  }
  return v5;
}

- (id)_certificateImage
{
  certificateImage = self->_certificateImage;
  if (!certificateImage)
  {
    v4 = [MEMORY[0x263F1C920] mainScreen];
    [v4 scale];
    double v6 = v5;

    v7 = (void *)MEMORY[0x263F1C6B0];
    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = [v7 imageNamed:@"profile-icon" inBundle:v8];
    v10 = [v9 _applicationIconImageForFormat:2 precomposed:1 scale:v6];
    v11 = self->_certificateImage;
    self->_certificateImage = v10;

    certificateImage = self->_certificateImage;
  }
  return certificateImage;
}

- (id)_titleLabel
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C768]);
    double v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    double v6 = self->_titleLabel;
    self->_titleLabel = v5;

    [(UILabel *)self->_titleLabel setBackgroundColor:0];
    [(UILabel *)self->_titleLabel setOpaque:0];
    v7 = self->_titleLabel;
    v8 = [MEMORY[0x263F1C658] boldSystemFontOfSize:18.0];
    [(UILabel *)v7 setFont:v8];

    [(UILabel *)self->_titleLabel setNumberOfLines:1];
    v9 = [(CertInfoCertificateHeaderCell *)self contentView];
    [v9 addSubview:self->_titleLabel];

    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

- (id)_subtitleLabel
{
  subtitleLabel = self->_subtitleLabel;
  if (!subtitleLabel)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C768]);
    double v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    double v6 = self->_subtitleLabel;
    self->_subtitleLabel = v5;

    [(UILabel *)self->_subtitleLabel setBackgroundColor:0];
    [(UILabel *)self->_subtitleLabel setOpaque:0];
    v7 = self->_subtitleLabel;
    v8 = [MEMORY[0x263F1C658] systemFontOfSize:14.0];
    [(UILabel *)v7 setFont:v8];

    v9 = self->_subtitleLabel;
    v10 = [MEMORY[0x263F1C550] grayColor];
    [(UILabel *)v9 setTextColor:v10];

    [(UILabel *)self->_subtitleLabel setNumberOfLines:2];
    v11 = [(CertInfoCertificateHeaderCell *)self contentView];
    [v11 addSubview:self->_subtitleLabel];

    subtitleLabel = self->_subtitleLabel;
  }
  return subtitleLabel;
}

- (id)_notTrustedGradient
{
  v2 = (void *)MEMORY[0x263F1C6B0];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v2 imageNamed:@"NotTrustedTextGradient" inBundle:v3];

  return v4;
}

- (id)_trustedLabel
{
  trustedLabel = self->_trustedLabel;
  if (!trustedLabel)
  {
    id v4 = [CertInfoGradientLabel alloc];
    double v5 = -[CertInfoGradientLabel initWithFrame:](v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    double v6 = self->_trustedLabel;
    self->_trustedLabel = v5;

    [(CertInfoGradientLabel *)self->_trustedLabel setBackgroundColor:0];
    [(CertInfoGradientLabel *)self->_trustedLabel setOpaque:0];
    v7 = self->_trustedLabel;
    v8 = [MEMORY[0x263F1C658] boldSystemFontOfSize:15.0];
    [(CertInfoGradientLabel *)v7 setFont:v8];

    v9 = self->_trustedLabel;
    v10 = [(CertInfoCertificateHeaderCell *)self _notTrustedGradient];
    [(CertInfoGradientLabel *)v9 setGradient:v10];

    v11 = [(CertInfoCertificateHeaderCell *)self contentView];
    [v11 addSubview:self->_trustedLabel];

    trustedLabel = self->_trustedLabel;
  }
  return trustedLabel;
}

- (void)setTrustTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(CertInfoCertificateHeaderCell *)self _titleLabel];
  [v5 setText:v4];

  [v5 sizeToFit];
}

- (void)setTrustSubtitle:(id)a3
{
  id v4 = a3;
  id v5 = [(CertInfoCertificateHeaderCell *)self _subtitleLabel];
  [v5 setText:v4];

  [v5 sizeToFit];
}

- (void)setExpired:(BOOL)a3
{
  id v5 = [(CertInfoCertificateHeaderCell *)self _subtitleLabel];
  if (a3) {
    [MEMORY[0x263F1C550] redColor];
  }
  else {
  id v4 = [MEMORY[0x263F1C550] grayColor];
  }
  [v5 setTextColor:v4];
}

- (double)rowHeight
{
  v2 = [(CertInfoCertificateHeaderCell *)self imageView];
  [v2 frame];
  double v4 = v3 + 14.0 + 13.0;

  return v4;
}

- (void)layoutSubviews
{
  v47.receiver = self;
  v47.super_class = (Class)CertInfoCertificateHeaderCell;
  [(CertInfoCertificateHeaderCell *)&v47 layoutSubviews];
  double v3 = [(CertInfoCertificateHeaderCell *)self imageView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  v8 = [(CertInfoCertificateHeaderCell *)self contentView];
  [v8 frame];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  double v16 = v15;

  v17 = [(CertInfoCertificateHeaderCell *)self _trustedLabel];
  [v17 frame];
  double v45 = v19;
  double v46 = v18;

  v20 = [(CertInfoCertificateHeaderCell *)self imageView];
  objc_msgSend(v20, "setFrame:", 15.0, 14.0, v5, v7);

  v48.origin.x = 15.0;
  v48.origin.y = 14.0;
  v48.size.width = v5;
  v48.size.height = v7;
  double v21 = CGRectGetMaxX(v48) + 10.0;
  v49.origin.x = 15.0;
  v49.origin.y = 14.0;
  v49.size.width = v5;
  v49.size.height = v7;
  double MinY = CGRectGetMinY(v49);
  v50.origin.x = v10;
  v50.origin.y = v12;
  v50.size.width = v14;
  v50.size.height = v16;
  double v23 = CGRectGetMaxX(v50) + -20.0;
  v24 = [(CertInfoCertificateHeaderCell *)self _titleLabel];
  [v24 frame];
  double v26 = v25;
  double v28 = v27;
  v29 = [v24 text];
  if (v29)
  {
    v30 = [v24 font];
    objc_msgSend(v29, "_legacy_sizeWithFont:forWidth:lineBreakMode:", v30, objc_msgSend(v24, "lineBreakMode"), v23 - v21);
    double v26 = v31;
    double v28 = v32;
  }
  objc_msgSend(v24, "setFrame:", v21, MinY, v26, v28);
  double v33 = MinY + v28;
  v34 = [(CertInfoCertificateHeaderCell *)self _subtitleLabel];

  [v34 frame];
  double v36 = v35;
  double v38 = v37;
  v39 = [v34 text];

  if (v39)
  {
    v40 = [v34 font];
    objc_msgSend(v39, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v40, objc_msgSend(v34, "lineBreakMode"), v23 - v21, v16 - v33 - v45);
    double v36 = v41;
    double v38 = v42;
  }
  objc_msgSend(v34, "setFrame:", v21, v33, v36, v38);
  v51.origin.x = 15.0;
  v51.origin.y = 14.0;
  v51.size.width = v5;
  v51.size.height = v7;
  CGFloat v43 = CGRectGetMaxY(v51) - v45;
  v44 = [(CertInfoCertificateHeaderCell *)self _trustedLabel];
  objc_msgSend(v44, "setFrame:", v21, v43, v46, v45);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_notTrustedGradient, 0);
  objc_storeStrong((id *)&self->_certificateImage, 0);
}

@end