@interface CertUIKeyDataCell
- (CertUIKeyDataCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)constraints;
- (UILabel)keyLabel;
- (UILabel)valueLabel;
- (void)_setup;
- (void)_setupConstraints;
- (void)setConstraints:(id)a3;
- (void)setKeyLabel:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setValueLabel:(id)a3;
@end

@implementation CertUIKeyDataCell

- (CertUIKeyDataCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CertUIKeyDataCell;
  v4 = [(CertUIKeyDataCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(CertUIKeyDataCell *)v4 _setup];
  }
  return v5;
}

- (void)_setup
{
  [(CertUIKeyDataCell *)self setSelectionStyle:0];
  id v3 = objc_alloc(MEMORY[0x263F1C768]);
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  v8 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], v5, v6, v7);
  keyLabel = self->_keyLabel;
  self->_keyLabel = v8;

  v10 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v4, v5, v6, v7);
  valueLabel = self->_valueLabel;
  self->_valueLabel = v10;

  v12 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v4, v5, v6, v7);
  v13 = self->_keyLabel;
  self->_keyLabel = v12;

  [(UILabel *)self->_keyLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_keyLabel setTextAlignment:0];
  uint64_t v14 = *MEMORY[0x263F1D260];
  v15 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
  [(UILabel *)self->_keyLabel setFont:v15];

  [(UILabel *)self->_keyLabel setNumberOfLines:0];
  v16 = [(CertUIKeyDataCell *)self contentView];
  [v16 addSubview:self->_keyLabel];

  v17 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v4, v5, v6, v7);
  v18 = self->_valueLabel;
  self->_valueLabel = v17;

  [(UILabel *)self->_valueLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_valueLabel setTextAlignment:2];
  v19 = [MEMORY[0x263F1C550] systemGrayColor];
  [(UILabel *)self->_valueLabel setTextColor:v19];

  v20 = [MEMORY[0x263F1C658] preferredFontForTextStyle:v14];
  [(UILabel *)self->_valueLabel setFont:v20];

  [(UILabel *)self->_valueLabel setNumberOfLines:0];
  v21 = [(CertUIKeyDataCell *)self contentView];
  [v21 addSubview:self->_valueLabel];

  [(CertUIKeyDataCell *)self _setupConstraints];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CertUIKeyDataCell;
  [(CertUIKeyDataCell *)&v4 setSelected:a3 animated:a4];
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  double v7 = [(CertUIKeyDataCell *)self keyLabel];
  [v7 setText:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v13 componentsJoinedByString:@"\n"];
    v9 = [(CertUIKeyDataCell *)self valueLabel];
    [v9 setText:v8];

    v10 = [(CertUIKeyDataCell *)self valueLabel];
    [v10 setTextAlignment:0];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    v11 = [v13 CertUIHexString];
    v12 = [(CertUIKeyDataCell *)self valueLabel];
    [v12 setText:v11];

    v8 = [(CertUIKeyDataCell *)self valueLabel];
    [v8 setTextAlignment:0];
  }

LABEL_6:
  [(CertUIKeyDataCell *)self updateConstraintsIfNeeded];
}

- (void)_setupConstraints
{
  id v3 = [(CertUIKeyDataCell *)self constraints];

  if (v3)
  {
    objc_super v4 = [(CertUIKeyDataCell *)self contentView];
    double v5 = [(CertUIKeyDataCell *)self constraints];
    [v4 removeConstraints:v5];

    [(CertUIKeyDataCell *)self setConstraints:0];
  }
  id v31 = (id)objc_opt_new();
  id v6 = (void *)MEMORY[0x263F08938];
  keyLabel = self->_keyLabel;
  v8 = [(CertUIKeyDataCell *)self contentView];
  v9 = [v6 constraintWithItem:keyLabel attribute:3 relatedBy:0 toItem:v8 attribute:3 multiplier:1.0 constant:10.0];
  [v31 addObject:v9];

  v10 = [MEMORY[0x263F08938] constraintWithItem:self->_valueLabel attribute:3 relatedBy:0 toItem:self->_keyLabel attribute:4 multiplier:1.0 constant:10.0];
  [v31 addObject:v10];

  v11 = (void *)MEMORY[0x263F08938];
  v12 = self->_keyLabel;
  id v13 = [(CertUIKeyDataCell *)self contentView];
  uint64_t v14 = [v11 constraintWithItem:v12 attribute:5 relatedBy:0 toItem:v13 attribute:5 multiplier:1.0 constant:10.0];
  [v31 addObject:v14];

  v15 = (void *)MEMORY[0x263F08938];
  valueLabel = self->_valueLabel;
  v17 = [(CertUIKeyDataCell *)self contentView];
  v18 = [v15 constraintWithItem:valueLabel attribute:5 relatedBy:0 toItem:v17 attribute:5 multiplier:1.0 constant:10.0];
  [v31 addObject:v18];

  v19 = (void *)MEMORY[0x263F08938];
  v20 = self->_keyLabel;
  v21 = [(CertUIKeyDataCell *)self contentView];
  v22 = [v19 constraintWithItem:v20 attribute:6 relatedBy:0 toItem:v21 attribute:6 multiplier:1.0 constant:-10.0];
  [v31 addObject:v22];

  v23 = (void *)MEMORY[0x263F08938];
  v24 = self->_valueLabel;
  v25 = [(CertUIKeyDataCell *)self contentView];
  v26 = [v23 constraintWithItem:v24 attribute:6 relatedBy:0 toItem:v25 attribute:6 multiplier:1.0 constant:-10.0];
  [v31 addObject:v26];

  v27 = (void *)MEMORY[0x263F08938];
  v28 = [(CertUIKeyDataCell *)self contentView];
  v29 = [v27 constraintWithItem:v28 attribute:4 relatedBy:0 toItem:self->_valueLabel attribute:4 multiplier:1.0 constant:10.0];
  [v31 addObject:v29];

  [(CertUIKeyDataCell *)self setConstraints:v31];
  v30 = [(CertUIKeyDataCell *)self contentView];
  [v30 addConstraints:v31];
}

- (UILabel)keyLabel
{
  return self->_keyLabel;
}

- (void)setKeyLabel:(id)a3
{
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_keyLabel, 0);
}

@end