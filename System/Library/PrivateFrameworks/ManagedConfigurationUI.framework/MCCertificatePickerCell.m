@interface MCCertificatePickerCell
+ (float)_attributeLabelSpace;
+ (float)defaultCellHeight;
+ (id)_attributeFont;
+ (id)_dateFormatter;
- (MCCertificatePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)_attributeLabelCopy;
- (id)_checkmarkView;
- (id)_labelColor;
- (void)layoutSubviews;
- (void)setChecked:(BOOL)a3;
- (void)setExpirationDate:(id)a3;
- (void)setIssuer:(id)a3;
@end

@implementation MCCertificatePickerCell

- (id)_checkmarkView
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                 + (int)*MEMORY[0x1E4F92F68]));
}

+ (float)defaultCellHeight
{
  return 67.0;
}

+ (id)_attributeFont
{
  return (id)[MEMORY[0x1E4F42A30] systemFontOfSize:14.0];
}

+ (float)_attributeLabelSpace
{
  LODWORD(v2) = __ExpiresWidth;
  if (*(float *)&__ExpiresWidth == 0.0)
  {
    v3 = objc_msgSend(a1, "_attributeFont", v2);
    v4 = MCUILocalizedString(@"EXPIRES");
    objc_msgSend(v4, "_legacy_sizeWithFont:forWidth:lineBreakMode:", v3, 4, 150.0);
    *(float *)&double v5 = v5;
    __ExpiresWidth = LODWORD(v5);

    v6 = MCUILocalizedString(@"ISSUED_BY");
    objc_msgSend(v6, "_legacy_sizeWithFont:forWidth:lineBreakMode:", v3, 4, 150.0);
    *(float *)&double v7 = v7;
    __IssuedByWidth = LODWORD(v7);

    LODWORD(v2) = __ExpiresWidth;
  }
  if (*(float *)&v2 < *(float *)&__IssuedByWidth) {
    LODWORD(v2) = __IssuedByWidth;
  }
  return *(float *)&v2 + 9.0;
}

+ (id)_dateFormatter
{
  double v2 = (void *)_dateFormatter_sFormatter_0;
  if (!_dateFormatter_sFormatter_0)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v4 = (void *)_dateFormatter_sFormatter_0;
    _dateFormatter_sFormatter_0 = (uint64_t)v3;

    [(id)_dateFormatter_sFormatter_0 setDateStyle:3];
    [(id)_dateFormatter_sFormatter_0 setTimeStyle:0];
    double v2 = (void *)_dateFormatter_sFormatter_0;
  }
  return v2;
}

- (MCCertificatePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)MCCertificatePickerCell;
  double v5 = [(PSTableCell *)&v8 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5) {
    [(MCCertificatePickerCell *)v5 setAccessoryType:2];
  }
  return v6;
}

- (id)_labelColor
{
  if ([(PSTableCell *)self isChecked])
  {
    id v3 = [(PSTableCell *)self titleLabel];
    v4 = [v3 textColor];
  }
  else
  {
    v4 = [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  return v4;
}

- (id)_attributeLabelCopy
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  v4 = [(id)objc_opt_class() _attributeFont];
  [v3 setFont:v4];

  double v5 = [(MCCertificatePickerCell *)self _labelColor];
  [v3 setTextColor:v5];

  v6 = [MEMORY[0x1E4F428B8] whiteColor];
  [v3 setHighlightedTextColor:v6];

  [v3 setBackgroundColor:0];
  [v3 setOpaque:0];
  return v3;
}

- (void)setIssuer:(id)a3
{
  id v15 = a3;
  uint64_t v4 = [v15 length];
  issuedByLabel = self->_issuedByLabel;
  if (v4)
  {
    if (!issuedByLabel)
    {
      v6 = [(MCCertificatePickerCell *)self _attributeLabelCopy];
      double v7 = self->_issuedByLabel;
      self->_issuedByLabel = v6;

      objc_super v8 = self->_issuedByLabel;
      v9 = MCUILocalizedString(@"ISSUED_BY");
      [(UILabel *)v8 setText:v9];

      v10 = [(MCCertificatePickerCell *)self contentView];
      [v10 addSubview:self->_issuedByLabel];
    }
    issuerLabel = self->_issuerLabel;
    if (!issuerLabel)
    {
      v12 = [(MCCertificatePickerCell *)self _attributeLabelCopy];
      v13 = self->_issuerLabel;
      self->_issuerLabel = v12;

      v14 = [(MCCertificatePickerCell *)self contentView];
      [v14 addSubview:self->_issuerLabel];

      issuerLabel = self->_issuerLabel;
    }
    [(UILabel *)issuerLabel setText:v15];
  }
  else
  {
    [(UILabel *)issuedByLabel removeFromSuperview];
    [(UILabel *)self->_issuerLabel removeFromSuperview];
  }
  [(MCCertificatePickerCell *)self setNeedsLayout];
}

- (void)setExpirationDate:(id)a3
{
  id v17 = a3;
  if (v17)
  {
    uint64_t v4 = +[MCCertificatePickerCell _dateFormatter];
    double v5 = [v4 stringFromDate:v17];
  }
  else
  {
    double v5 = 0;
  }
  uint64_t v6 = [v5 length];
  expiresByLabel = self->_expiresByLabel;
  if (v6)
  {
    if (!expiresByLabel)
    {
      objc_super v8 = [(MCCertificatePickerCell *)self _attributeLabelCopy];
      v9 = self->_expiresByLabel;
      self->_expiresByLabel = v8;

      v10 = self->_expiresByLabel;
      v11 = MCUILocalizedString(@"EXPIRES");
      [(UILabel *)v10 setText:v11];

      v12 = [(MCCertificatePickerCell *)self contentView];
      [v12 addSubview:self->_expiresByLabel];
    }
    expiryDateLabel = self->_expiryDateLabel;
    if (!expiryDateLabel)
    {
      v14 = [(MCCertificatePickerCell *)self _attributeLabelCopy];
      id v15 = self->_expiryDateLabel;
      self->_expiryDateLabel = v14;

      v16 = [(MCCertificatePickerCell *)self contentView];
      [v16 addSubview:self->_expiryDateLabel];

      expiryDateLabel = self->_expiryDateLabel;
    }
    [(UILabel *)expiryDateLabel setText:v5];
  }
  else
  {
    [(UILabel *)expiresByLabel removeFromSuperview];
    [(UILabel *)self->_expiryDateLabel removeFromSuperview];
  }
  [(MCCertificatePickerCell *)self setNeedsLayout];
}

- (void)setChecked:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(PSTableCell *)self isChecked];
  v7.receiver = self;
  v7.super_class = (Class)MCCertificatePickerCell;
  [(PSTableCell *)&v7 setChecked:v3];
  if (v5 != v3)
  {
    uint64_t v6 = [(MCCertificatePickerCell *)self _labelColor];
    [(UILabel *)self->_issuerLabel setTextColor:v6];
    [(UILabel *)self->_issuedByLabel setTextColor:v6];
    [(UILabel *)self->_expiryDateLabel setTextColor:v6];
    [(UILabel *)self->_expiresByLabel setTextColor:v6];
  }
}

- (void)layoutSubviews
{
  v53.receiver = self;
  v53.super_class = (Class)MCCertificatePickerCell;
  [(PSTableCell *)&v53 layoutSubviews];
  uint64_t v3 = [(UILabel *)self->_expiresByLabel superview];

  uint64_t v4 = [(UILabel *)self->_issuerLabel superview];

  BOOL v5 = [(PSTableCell *)self titleLabel];
  [v5 sizeToFit];
  [v5 bounds];
  double v7 = 0.0;
  if (v4 | v3) {
    double v7 = 1.0;
  }
  float v8 = v6 + 0.0;
  float v9 = v7 + v8;
  if (v4)
  {
    [(UILabel *)self->_issuedByLabel sizeToFit];
    [(UILabel *)self->_issuerLabel sizeToFit];
    [(UILabel *)self->_issuedByLabel bounds];
    if (v3)
    {
      float v11 = v10 + v9;
      float v9 = v11 + 2.0;
    }
    else
    {
      float v9 = v10 + v9;
    }
  }
  if (v3)
  {
    [(UILabel *)self->_expiresByLabel sizeToFit];
    [(UILabel *)self->_expiryDateLabel sizeToFit];
    [(UILabel *)self->_expiresByLabel bounds];
    float v9 = v12 + v9;
  }
  v13 = [(MCCertificatePickerCell *)self _checkmarkView];
  [v13 frame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  v20 = [(MCCertificatePickerCell *)self _checkmarkView];
  objc_msgSend(v20, "setFrame:", 10.0, v15, v17, v19);

  [(MCCertificatePickerCell *)self bounds];
  double v22 = v21;
  v23 = [(MCCertificatePickerCell *)self contentView];
  [v23 bounds];
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;

  float v32 = round((v22 - v9) * 0.5);
  [v5 frame];
  double v34 = v33;
  double v36 = v35;
  double v37 = v32;
  v54.origin.x = v25;
  v54.origin.y = v27;
  v54.size.width = v29;
  v54.size.height = v31;
  double v38 = CGRectGetMaxX(v54) + -10.0 + -39.0;
  if (v34 >= v38) {
    double v39 = v38;
  }
  else {
    double v39 = v34;
  }
  objc_msgSend(v5, "setFrame:", 39.0, v37, v39, v36);
  v40 = [(PSTableCell *)self valueLabel];
  objc_msgSend(v40, "setFrame:", 39.0, v37, v39, v36);

  if (v4 | v3)
  {
    float v41 = v36 + 1.0 + v37;
    [(id)objc_opt_class() _attributeLabelSpace];
    float v52 = v42;
    if (v4)
    {
      float v43 = v42;
      [(UILabel *)self->_issuerLabel frame];
      double v51 = v44;
      [(UILabel *)self->_issuedByLabel frame];
      double v46 = v45;
      double v47 = v41;
      -[UILabel setFrame:](self->_issuedByLabel, "setFrame:", 39.0, v47, *(float *)&__IssuedByWidth);
      v55.origin.x = v25;
      v55.origin.y = v27;
      v55.size.width = v29;
      v55.size.height = v31;
      -[UILabel setFrame:](self->_issuerLabel, "setFrame:", v43 + 39.0, v47, CGRectGetMaxX(v55) - (v43 + 39.0) + -10.0, v51);
      float v41 = v46 + 2.0 + v47;
    }
    if (v3)
    {
      [(UILabel *)self->_expiryDateLabel frame];
      double v49 = v48;
      [(UILabel *)self->_expiresByLabel frame];
      double v50 = v41;
      -[UILabel setFrame:](self->_expiresByLabel, "setFrame:", 39.0, v50, *(float *)&__ExpiresWidth);
      v56.origin.x = v25;
      v56.origin.y = v27;
      v56.size.width = v29;
      v56.size.height = v31;
      -[UILabel setFrame:](self->_expiryDateLabel, "setFrame:", v52 + 39.0, v50, CGRectGetMaxX(v56) - (v52 + 39.0) + -10.0, v49);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDateLabel, 0);
  objc_storeStrong((id *)&self->_expiresByLabel, 0);
  objc_storeStrong((id *)&self->_issuerLabel, 0);
  objc_storeStrong((id *)&self->_issuedByLabel, 0);
}

@end