@interface CertUIKeyValueCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (CertUIKeyValueCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
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

@implementation CertUIKeyValueCell

- (CertUIKeyValueCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CertUIKeyValueCell;
  v4 = [(CertUIKeyValueCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(CertUIKeyValueCell *)v4 _setup];
  }
  return v5;
}

- (void)_setup
{
  [(CertUIKeyValueCell *)self setSelectionStyle:0];
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
  v16 = [(CertUIKeyValueCell *)self contentView];
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
  v21 = [(CertUIKeyValueCell *)self contentView];
  [v21 addSubview:self->_valueLabel];

  [(CertUIKeyValueCell *)self _setupConstraints];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CertUIKeyValueCell;
  [(CertUIKeyValueCell *)&v4 setSelected:a3 animated:a4];
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  double v7 = [(CertUIKeyValueCell *)self keyLabel];
  [v7 setText:v6];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (!v17 || (isKindOfClass & 1) != 0)
  {
    v16 = [(CertUIKeyValueCell *)self valueLabel];
    [v16 setText:v17];

    id v11 = [(CertUIKeyValueCell *)self valueLabel];
    [v11 setTextAlignment:2];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_7;
    }
    v9 = (objc_class *)MEMORY[0x263F08790];
    id v10 = v17;
    id v11 = objc_alloc_init(v9);
    [v11 setDateStyle:1];
    [v11 setTimeStyle:2];
    v12 = [MEMORY[0x263EFF960] currentLocale];
    [v11 setLocale:v12];

    v13 = [v11 stringFromDate:v10];

    uint64_t v14 = [(CertUIKeyValueCell *)self valueLabel];
    [v14 setText:v13];

    v15 = [(CertUIKeyValueCell *)self valueLabel];
    [v15 setTextAlignment:2];
  }
LABEL_7:
  [(CertUIKeyValueCell *)self updateConstraintsIfNeeded];
  [(CertUIKeyValueCell *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  double v5 = [(CertUIKeyValueCell *)self valueLabel];
  id v6 = [v5 text];
  uint64_t v7 = [v6 length];

  double v8 = 130.0;
  if (!v7) {
    double v8 = 30.0;
  }
  double v9 = width - v8;
  id v10 = [(CertUIKeyValueCell *)self keyLabel];
  objc_msgSend(v10, "sizeThatFits:", v9, 3.40282347e38);
  double v12 = v11;
  double v14 = v13;

  v15 = [(CertUIKeyValueCell *)self valueLabel];
  objc_msgSend(v15, "sizeThatFits:", width - (v12 + 30.0), 3.40282347e38);
  double v17 = v16;

  if (v14 <= v17) {
    double v18 = v17;
  }
  else {
    double v18 = v14;
  }
  double v19 = v18 + 20.0;
  if (v19 >= 44.0) {
    double v20 = v19;
  }
  else {
    double v20 = 44.0;
  }
  v21 = [MEMORY[0x263F1C920] mainScreen];
  [v21 bounds];
  double v23 = v22;

  double v24 = v23;
  double v25 = v20;
  result.height = v25;
  result.double width = v24;
  return result;
}

- (void)_setupConstraints
{
  id v3 = [(CertUIKeyValueCell *)self constraints];

  if (v3)
  {
    objc_super v4 = [(CertUIKeyValueCell *)self contentView];
    double v5 = [(CertUIKeyValueCell *)self constraints];
    [v4 removeConstraints:v5];

    [(CertUIKeyValueCell *)self setConstraints:0];
  }
  id v30 = (id)objc_opt_new();
  id v6 = (void *)MEMORY[0x263F08938];
  valueLabel = self->_valueLabel;
  double v8 = [(CertUIKeyValueCell *)self contentView];
  double v9 = [v6 constraintWithItem:valueLabel attribute:3 relatedBy:0 toItem:v8 attribute:3 multiplier:1.0 constant:10.0];
  [v30 addObject:v9];

  id v10 = (void *)MEMORY[0x263F08938];
  double v11 = [(CertUIKeyValueCell *)self contentView];
  double v12 = [v10 constraintWithItem:v11 attribute:4 relatedBy:1 toItem:self->_valueLabel attribute:4 multiplier:1.0 constant:10.0];
  [v30 addObject:v12];

  double v13 = (void *)MEMORY[0x263F08938];
  double v14 = [(CertUIKeyValueCell *)self contentView];
  v15 = [v13 constraintWithItem:v14 attribute:4 relatedBy:1 toItem:self->_keyLabel attribute:4 multiplier:1.0 constant:10.0];
  [v30 addObject:v15];

  LODWORD(v16) = 1144766464;
  [(UILabel *)self->_keyLabel setContentCompressionResistancePriority:0 forAxis:v16];
  LODWORD(v17) = 1144766464;
  [(UILabel *)self->_keyLabel setContentHuggingPriority:0 forAxis:v17];
  double v18 = [MEMORY[0x263F08938] constraintWithItem:self->_valueLabel attribute:7 relatedBy:1 toItem:self->_keyLabel attribute:7 multiplier:0.0 constant:100.0];
  [v30 addObject:v18];

  double v19 = [MEMORY[0x263F08938] constraintWithItem:self->_keyLabel attribute:12 relatedBy:0 toItem:self->_valueLabel attribute:12 multiplier:1.0 constant:0.0];
  [v30 addObject:v19];

  double v20 = (void *)MEMORY[0x263F08938];
  keyLabel = self->_keyLabel;
  double v22 = [(CertUIKeyValueCell *)self contentView];
  double v23 = [v20 constraintWithItem:keyLabel attribute:5 relatedBy:0 toItem:v22 attribute:5 multiplier:1.0 constant:10.0];
  [v30 addObject:v23];

  double v24 = (void *)MEMORY[0x263F08938];
  double v25 = self->_valueLabel;
  v26 = [(CertUIKeyValueCell *)self contentView];
  v27 = [v24 constraintWithItem:v25 attribute:6 relatedBy:0 toItem:v26 attribute:6 multiplier:1.0 constant:-10.0];
  [v30 addObject:v27];

  v28 = [MEMORY[0x263F08938] constraintWithItem:self->_valueLabel attribute:5 relatedBy:0 toItem:self->_keyLabel attribute:6 multiplier:1.0 constant:10.0];
  [v30 addObject:v28];

  [(CertUIKeyValueCell *)self setConstraints:v30];
  v29 = [(CertUIKeyValueCell *)self contentView];
  [v29 addConstraints:v30];
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