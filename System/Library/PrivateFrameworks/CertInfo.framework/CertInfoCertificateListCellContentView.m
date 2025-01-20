@interface CertInfoCertificateListCellContentView
- (CertInfoCertificateListCellContentView)initWithFrame:(CGRect)a3;
- (void)_setText:(id)a3 forLabel:(id)a4 withRedColor:(BOOL)a5;
- (void)_setupLabel:(id)a3 isSubtitle:(BOOL)a4;
- (void)layoutSubviews;
- (void)setExpiration:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CertInfoCertificateListCellContentView

- (CertInfoCertificateListCellContentView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CertInfoCertificateListCellContentView;
  v3 = -[CertInfoCertificateListCellContentView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C768]);
    double v5 = *MEMORY[0x263F001A8];
    double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], v6, v7, v8);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v9;

    [(CertInfoCertificateListCellContentView *)v3 _setupLabel:v3->_titleLabel isSubtitle:0];
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v5, v6, v7, v8);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v11;

    [(CertInfoCertificateListCellContentView *)v3 _setupLabel:v3->_subtitleLabel isSubtitle:1];
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v5, v6, v7, v8);
    expirationLabel = v3->_expirationLabel;
    v3->_expirationLabel = (UILabel *)v13;

    [(CertInfoCertificateListCellContentView *)v3 _setupLabel:v3->_expirationLabel isSubtitle:1];
  }
  return v3;
}

- (void)setTitle:(id)a3
{
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (v4 && ([v4 isEqualToString:&stru_26C9B5AF8] & 1) == 0)
  {
    double v6 = NSString;
    double v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CertInfo"];
    double v8 = [v7 localizedStringForKey:@"ISSUED_BY_LABEL" value:&stru_26C9B5AF8 table:@"CertInfo"];
    double v5 = objc_msgSend(v6, "stringWithFormat:", v8, v9);
  }
  else
  {
    double v5 = 0;
  }
  [(CertInfoCertificateListCellContentView *)self _setText:v5 forLabel:self->_subtitleLabel withRedColor:0];
}

- (void)setExpiration:(id)a3
{
  id v13 = a3;
  [v13 timeIntervalSinceNow];
  double v5 = v4;
  if (v13)
  {
    double v6 = [MEMORY[0x263F08790] localizedStringFromDate:v13 dateStyle:2 timeStyle:2];
    double v7 = NSString;
    double v8 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CertInfo"];
    id v9 = v8;
    if (v5 >= 0.0) {
      v10 = @"EXPIRES_LABEL";
    }
    else {
      v10 = @"EXPIRED_LABEL";
    }
    uint64_t v11 = [v8 localizedStringForKey:v10 value:&stru_26C9B5AF8 table:@"CertInfo"];
    v12 = objc_msgSend(v7, "stringWithFormat:", v11, v6);
  }
  else
  {
    v12 = 0;
  }
  [(CertInfoCertificateListCellContentView *)self _setText:v12 forLabel:self->_expirationLabel withRedColor:v5 < 0.0];
}

- (void)_setupLabel:(id)a3 isSubtitle:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  double v5 = [MEMORY[0x263F1C550] whiteColor];
  [v8 setHighlightedTextColor:v5];

  [v8 setBackgroundColor:0];
  [v8 setOpaque:0];
  if (v4)
  {
    double v6 = [MEMORY[0x263F1C550] grayColor];
    [v8 setTextColor:v6];

    [MEMORY[0x263F1C658] systemFontOfSize:13.0];
  }
  else
  {
    [MEMORY[0x263F1C658] boldSystemFontOfSize:17.0];
  double v7 = };
  [v8 setFont:v7];
}

- (void)_setText:(id)a3 forLabel:(id)a4 withRedColor:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a4;
  if (a3)
  {
    [v9 setText:a3];
    [v9 sizeToFit];
    if (v5)
    {
      id v8 = [MEMORY[0x263F1C550] redColor];
      [v9 setTextColor:v8];
    }
    [(CertInfoCertificateListCellContentView *)self addSubview:v9];
  }
  else
  {
    [v9 removeFromSuperview];
  }
  [(CertInfoCertificateListCellContentView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  [(CertInfoCertificateListCellContentView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    [(UILabel *)titleLabel frame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    double v11 = *MEMORY[0x263F001A8];
    double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v15 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  double v16 = v6 + -8.0;
  uint64_t v17 = [(UILabel *)self->_subtitleLabel superview];

  uint64_t v18 = [(UILabel *)self->_expirationLabel superview];

  if (v17 | v18)
  {
    if (v17) {
      BOOL v20 = v18 == 0;
    }
    else {
      BOOL v20 = 0;
    }
    if (v20)
    {
      [(UILabel *)self->_subtitleLabel setNumberOfLines:2];
      v38 = [(UILabel *)self->_subtitleLabel text];
      v39 = [(UILabel *)self->_subtitleLabel font];
      objc_msgSend(v38, "_legacy_sizeWithFont:constrainedToSize:", v39, v16, 0.0);
      double v41 = v40;
      double v52 = v4;
      double v43 = v42;

      v44 = [(UILabel *)self->_subtitleLabel text];
      v45 = [(UILabel *)self->_subtitleLabel font];
      objc_msgSend(v44, "_legacy_sizeWithFont:constrainedToSize:", v45, v41, v43 + v43);
      double v47 = v46;
      double v55 = v11;
      double v49 = v48;

      if (v43 < v49)
      {
        double v47 = v41;
        double v49 = v43 + v43;
      }
      [(UILabel *)self->_subtitleLabel frame];
      float v50 = v53 + v8 * 0.5 - (v15 + 2.0 + v49) * 0.5 + -2.0;
      double v13 = roundf(v50);
      double v35 = v15 + 2.0 + v13;
      subtitleLabel = self->_subtitleLabel;
      double v36 = v47;
      double v37 = v49;
      double v11 = v55;
    }
    else
    {
      if (v17) {
        BOOL v21 = v18 == 0;
      }
      else {
        BOOL v21 = 1;
      }
      if (v21) {
        goto LABEL_19;
      }
      [(UILabel *)self->_subtitleLabel setNumberOfLines:1];
      [(UILabel *)self->_subtitleLabel frame];
      double v23 = v22;
      double v54 = v11;
      double v25 = v24;
      [(UILabel *)self->_expirationLabel frame];
      double v26 = v4;
      double v28 = v27;
      double v30 = v29;
      float v31 = v26 + v8 * 0.5 - (v15 + 2.0 + v25 + 2.0 + v29) * 0.5 + -2.0;
      double v13 = roundf(v31);
      double v32 = v25 + 2.0 + v15 + 2.0 + v13;
      double v11 = v54;
      [(UILabel *)self->_subtitleLabel setFrame:v23];
      subtitleLabel = self->_expirationLabel;
      double v34 = v28;
      double v35 = v32;
      double v36 = v16;
      double v37 = v30;
    }
    -[UILabel setFrame:](subtitleLabel, "setFrame:", v34, v35, v36, v37);
  }
  else
  {
    float v19 = v4 + v8 * 0.5 - v15 * 0.5 + -2.0;
    double v13 = roundf(v19);
  }
LABEL_19:
  v51 = self->_titleLabel;
  -[UILabel setFrame:](v51, "setFrame:", v11, v13, v16, v15);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end