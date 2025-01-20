@interface BYODDomainSearchOptionCellView
- (BYODDomainSearchOptionCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)domain;
- (UIButton)selectButton;
- (UIImage)checkmarkImage;
- (UIImageSymbolConfiguration)symbolConfig;
- (UILabel)name;
- (UILabel)price;
- (void)setChecked:(BOOL)a3;
- (void)setCheckmarkImage:(id)a3;
- (void)setDomain:(id)a3;
- (void)setDomain:(id)a3 price:(id)a4;
- (void)setName:(id)a3;
- (void)setPrice:(id)a3;
- (void)setSelectButton:(id)a3;
- (void)setSymbolConfig:(id)a3;
@end

@implementation BYODDomainSearchOptionCellView

- (BYODDomainSearchOptionCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  v64.receiver = self;
  v64.super_class = (Class)BYODDomainSearchOptionCellView;
  v7 = [(BYODDomainSearchOptionCellView *)&v64 initWithStyle:a3 reuseIdentifier:v6];
  if (v7)
  {
    v8 = +[UIColor secondarySystemBackgroundColor];
    [(BYODDomainSearchOptionCellView *)v7 setBackgroundColor:v8];

    [(BYODDomainSearchOptionCellView *)v7 setSelectionStyle:0];
    uint64_t v9 = +[UIImageSymbolConfiguration configurationWithPointSize:24.0];
    symbolConfig = v7->_symbolConfig;
    v7->_symbolConfig = (UIImageSymbolConfiguration *)v9;

    uint64_t v11 = +[UIImage systemImageNamed:@"circle" withConfiguration:v7->_symbolConfig];
    checkmarkImage = v7->_checkmarkImage;
    v7->_checkmarkImage = (UIImage *)v11;

    v13 = (UILabel *)objc_alloc_init((Class)UILabel);
    name = v7->_name;
    v7->_name = v13;

    [(UILabel *)v7->_name setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v7->_name setLineBreakMode:1];
    [(UILabel *)v7->_name setNumberOfLines:0];
    [(UILabel *)v7->_name sizeToFit];
    v15 = [(BYODDomainSearchOptionCellView *)v7 contentView];
    [v15 addSubview:v7->_name];

    v16 = (UILabel *)objc_alloc_init((Class)UILabel);
    price = v7->_price;
    v7->_price = v16;

    v18 = v7->_price;
    v19 = +[UIColor systemGrayColor];
    [(UILabel *)v18 setTextColor:v19];

    v20 = v7->_price;
    +[UIFont smallSystemFontSize];
    v21 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
    [(UILabel *)v20 setFont:v21];

    [(UILabel *)v7->_price setTranslatesAutoresizingMaskIntoConstraints:0];
    v22 = [(BYODDomainSearchOptionCellView *)v7 contentView];
    [v22 addSubview:v7->_price];

    v23 = (UIButton *)objc_alloc_init((Class)UIButton);
    selectButton = v7->_selectButton;
    v7->_selectButton = v23;

    [(UIButton *)v7->_selectButton setBackgroundImage:v7->_checkmarkImage forState:0];
    v25 = v7->_selectButton;
    v26 = +[UIColor systemGray2Color];
    [(UIButton *)v25 setTintColor:v26];

    [(UIButton *)v7->_selectButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v27 = [(BYODDomainSearchOptionCellView *)v7 contentView];
    [v27 addSubview:v7->_selectButton];

    v28 = [(UILabel *)v7->_name leadingAnchor];
    v29 = [(BYODDomainSearchOptionCellView *)v7 contentView];
    v30 = [v29 leadingAnchor];
    v31 = [v28 constraintEqualToAnchor:v30 constant:16.0];
    [v31 setActive:1];

    v32 = [(UILabel *)v7->_name widthAnchor];
    v33 = [(BYODDomainSearchOptionCellView *)v7 contentView];
    v34 = [v33 widthAnchor];
    v35 = [v32 constraintLessThanOrEqualToAnchor:v34 multiplier:0.8];
    [v35 setActive:1];

    v36 = [(UILabel *)v7->_price leadingAnchor];
    v37 = [(UILabel *)v7->_name leadingAnchor];
    v38 = [v36 constraintEqualToAnchor:v37 constant:0.0];
    [v38 setActive:1];

    v39 = [(UIButton *)v7->_selectButton trailingAnchor];
    v40 = [(BYODDomainSearchOptionCellView *)v7 contentView];
    v41 = [v40 trailingAnchor];
    v42 = [v39 constraintEqualToAnchor:v41 constant:-16.0];
    [v42 setActive:1];

    v43 = [(UILabel *)v7->_name topAnchor];
    v44 = [(BYODDomainSearchOptionCellView *)v7 contentView];
    v45 = [v44 topAnchor];
    v46 = [v43 constraintEqualToAnchor:v45 constant:5.0];
    [v46 setActive:1];

    v47 = [(UILabel *)v7->_name bottomAnchor];
    v48 = [(UILabel *)v7->_price topAnchor];
    v49 = [v47 constraintEqualToAnchor:v48 constant:-2.0];
    [v49 setActive:1];

    v50 = [(UILabel *)v7->_name heightAnchor];
    v51 = [v50 constraintGreaterThanOrEqualToConstant:20.0];
    [v51 setActive:1];

    v52 = [(UILabel *)v7->_price topAnchor];
    v53 = [(UILabel *)v7->_name bottomAnchor];
    v54 = [v52 constraintEqualToAnchor:v53 constant:5.0];
    [v54 setActive:1];

    v55 = [(UILabel *)v7->_price bottomAnchor];
    v56 = [(BYODDomainSearchOptionCellView *)v7 contentView];
    v57 = [v56 bottomAnchor];
    v58 = [v55 constraintEqualToAnchor:v57 constant:-5.0];
    [v58 setActive:1];

    v59 = [(UIButton *)v7->_selectButton centerYAnchor];
    v60 = [(BYODDomainSearchOptionCellView *)v7 contentView];
    v61 = [v60 centerYAnchor];
    v62 = [v59 constraintEqualToAnchor:v61 constant:0.0];
    [v62 setActive:1];
  }
  return v7;
}

- (void)setDomain:(id)a3 price:(id)a4
{
  id v8 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_domain, a3);
  [(UILabel *)self->_name setText:v8];
  [(UILabel *)self->_price setText:v7];
}

- (void)setChecked:(BOOL)a3
{
  symbolConfig = self->_symbolConfig;
  if (a3)
  {
    id v7 = +[UIImage systemImageNamed:@"checkmark.circle.fill" withConfiguration:symbolConfig];
    -[UIButton setBackgroundImage:forState:](self->_selectButton, "setBackgroundImage:forState:");
    selectButton = self->_selectButton;
    +[UIColor systemBlueColor];
  }
  else
  {
    id v7 = +[UIImage systemImageNamed:@"circle" withConfiguration:symbolConfig];
    -[UIButton setBackgroundImage:forState:](self->_selectButton, "setBackgroundImage:forState:");
    selectButton = self->_selectButton;
    +[UIColor systemGray2Color];
  id v6 = };
  [(UIButton *)selectButton setTintColor:v6];
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (UIButton)selectButton
{
  return self->_selectButton;
}

- (void)setSelectButton:(id)a3
{
}

- (UIImage)checkmarkImage
{
  return self->_checkmarkImage;
}

- (void)setCheckmarkImage:(id)a3
{
}

- (UILabel)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (UILabel)price
{
  return self->_price;
}

- (void)setPrice:(id)a3
{
}

- (UIImageSymbolConfiguration)symbolConfig
{
  return self->_symbolConfig;
}

- (void)setSymbolConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolConfig, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_checkmarkImage, 0);
  objc_storeStrong((id *)&self->_selectButton, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

@end