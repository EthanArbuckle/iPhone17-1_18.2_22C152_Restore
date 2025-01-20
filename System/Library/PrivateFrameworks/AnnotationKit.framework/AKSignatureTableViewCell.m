@interface AKSignatureTableViewCell
- (AKSignature)signature;
- (AKSignatureTableViewCell)initWithCoder:(id)a3;
- (AKSignatureTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImageView)signatureImageView;
- (UILabel)signatureLabel;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (void)_commonInit;
- (void)_setImageFromSignature;
- (void)_setLabelFromSignature;
- (void)layoutSubviews;
- (void)setSignature:(id)a3;
- (void)setSignatureImageView:(id)a3;
- (void)setSignatureLabel:(id)a3;
@end

@implementation AKSignatureTableViewCell

- (AKSignatureTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AKSignatureTableViewCell;
  v4 = [(AKSignatureTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(AKSignatureTableViewCell *)v4 _commonInit];
  }
  return v5;
}

- (AKSignatureTableViewCell)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AKSignatureTableViewCell;
  v3 = [(AKSignatureTableViewCell *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(AKSignatureTableViewCell *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  id v3 = objc_alloc(MEMORY[0x263F1C6D0]);
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  v8 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], v5, v6, v7);
  [(AKSignatureTableViewCell *)self setSignatureImageView:v8];

  v9 = [(AKSignatureTableViewCell *)self contentView];
  v10 = [(AKSignatureTableViewCell *)self signatureImageView];
  [v9 addSubview:v10];

  v11 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v4, v5, v6, v7);
  [(AKSignatureTableViewCell *)self setSignatureLabel:v11];

  v12 = [(AKSignatureTableViewCell *)self signatureLabel];
  uint64_t v13 = 2 * ([v12 effectiveUserInterfaceLayoutDirection] != 1);
  v14 = [(AKSignatureTableViewCell *)self signatureLabel];
  [v14 setTextAlignment:v13];

  v15 = (void *)MEMORY[0x263F1C658];
  [MEMORY[0x263F1C658] smallSystemFontSize];
  v16 = objc_msgSend(v15, "systemFontOfSize:");
  v17 = [(AKSignatureTableViewCell *)self signatureLabel];
  [v17 setFont:v16];

  v18 = [MEMORY[0x263F1C550] secondaryLabelColor];
  v19 = [(AKSignatureTableViewCell *)self signatureLabel];
  [v19 setTextColor:v18];

  id v21 = [(AKSignatureTableViewCell *)self contentView];
  v20 = [(AKSignatureTableViewCell *)self signatureLabel];
  [v21 addSubview:v20];
}

- (void)setSignature:(id)a3
{
  double v5 = (AKSignature *)a3;
  if (self->_signature != v5)
  {
    double v7 = v5;
    double v6 = [(AKSignatureTableViewCell *)self signatureImageView];
    [v6 setImage:0];

    objc_storeStrong((id *)&self->_signature, a3);
    [(AKSignatureTableViewCell *)self _setLabelFromSignature];
    [(AKSignatureTableViewCell *)self _setImageFromSignature];
    double v5 = v7;
  }
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)AKSignatureTableViewCell;
  [(AKSignatureTableViewCell *)&v29 layoutSubviews];
  id v3 = [(AKSignatureTableViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4 + 30.0;
  double v7 = v6 + 10.0;
  double v9 = v8 + -60.0;
  double v11 = v10 + -20.0;

  v12 = [(AKSignatureTableViewCell *)self signatureImageView];
  uint64_t v13 = [v12 contentMode];

  if (v13 == 4)
  {
    v14 = [(AKSignatureTableViewCell *)self signatureImageView];
    objc_msgSend(v14, "setFrame:", v5, v7, v9, v11);

    double v15 = *MEMORY[0x263F001A8];
    double v16 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v17 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v18 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  else
  {
    memset(&slice, 0, sizeof(slice));
    memset(&v27, 0, sizeof(v27));
    CGRectEdge v19 = 2
        * ([(AKSignatureTableViewCell *)self effectiveUserInterfaceLayoutDirection] == 1);
    v30.origin.double x = v5;
    v30.origin.double y = v7;
    v30.size.double width = v9;
    v30.size.double height = v11;
    CGFloat v20 = CGRectGetWidth(v30) * 0.618;
    v31.origin.double x = v5;
    v31.origin.double y = v7;
    v31.size.double width = v9;
    v31.size.double height = v11;
    CGRectDivide(v31, &slice, &v27, v20, v19);
    double x = slice.origin.x;
    double y = slice.origin.y;
    double width = slice.size.width;
    double height = slice.size.height;
    v25 = [(AKSignatureTableViewCell *)self signatureImageView];
    objc_msgSend(v25, "setFrame:", x, y, width, height);

    double v16 = v27.origin.y;
    double v15 = v27.origin.x;
    double v18 = v27.size.height;
    double v17 = v27.size.width;
  }
  v26 = [(AKSignatureTableViewCell *)self signatureLabel];
  objc_msgSend(v26, "setFrame:", v15, v16, v17, v18);

  [(AKSignatureTableViewCell *)self _setImageFromSignature];
}

- (void)_setImageFromSignature
{
  id v3 = [(AKSignatureTableViewCell *)self signatureImageView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  id v13 = 0;
  if (v5 > 0.0 && v7 > 0.0)
  {
    double v8 = [(AKSignatureTableViewCell *)self traitCollection];
    uint64_t v9 = [v8 userInterfaceStyle];

    if (v9 == 2) {
      [MEMORY[0x263F1C550] whiteColor];
    }
    else {
    double v10 = [MEMORY[0x263F1C550] blackColor];
    }
    double v11 = [(AKSignatureTableViewCell *)self signature];
    +[AKAnnotationImageHelper imageOfSize:withFillColor:forSignature:](AKAnnotationImageHelper, "imageOfSize:withFillColor:forSignature:", v10, v11, v5, v7);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = [(AKSignatureTableViewCell *)self signatureImageView];
  [v12 setImage:v13];
}

- (void)_setLabelFromSignature
{
  id v3 = [(AKSignatureTableViewCell *)self signature];
  uint64_t v4 = [v3 descriptionTag];

  if (v4)
  {
    double v5 = [(AKSignatureTableViewCell *)self signature];
    uint64_t v6 = [v5 descriptionTag];

    if (v6 == -1)
    {
      double v7 = [(AKSignatureTableViewCell *)self signature];
      id v9 = [v7 customDescription];
    }
    else
    {
      id v9 = +[AKSignatureDescription stringValueForSignatureDescriptionTag:v6];
    }
    double v8 = [(AKSignatureTableViewCell *)self signatureLabel];
    [v8 setText:v9];
  }
  else
  {
    id v9 = [(AKSignatureTableViewCell *)self signatureLabel];
    [v9 setText:0];
  }
}

- (id)accessibilityLabel
{
  v2 = [(AKSignatureTableViewCell *)self signature];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(AKSignatureTableViewCell *)self signature];
  id v3 = [v2 accessibilityValue];

  return v3;
}

- (AKSignature)signature
{
  return self->_signature;
}

- (UIImageView)signatureImageView
{
  return self->_signatureImageView;
}

- (void)setSignatureImageView:(id)a3
{
}

- (UILabel)signatureLabel
{
  return self->_signatureLabel;
}

- (void)setSignatureLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureLabel, 0);
  objc_storeStrong((id *)&self->_signatureImageView, 0);

  objc_storeStrong((id *)&self->_signature, 0);
}

@end