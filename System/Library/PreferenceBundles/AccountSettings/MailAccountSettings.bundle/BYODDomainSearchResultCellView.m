@interface BYODDomainSearchResultCellView
- (BYODDomainSearchResultCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)domain;
- (UIButton)selectButton;
- (UIImage)checkmarkImage;
- (UIImageSymbolConfiguration)radioConfig;
- (UIImageSymbolConfiguration)symbolConfig;
- (UIImageView)availableCheck;
- (UILabel)noteLabel;
- (UILabel)priceLabel;
- (void)setAvailableCheck:(id)a3;
- (void)setChecked:(BOOL)a3;
- (void)setCheckmarkImage:(id)a3;
- (void)setDomain:(id)a3;
- (void)setDomain:(id)a3 price:(id)a4;
- (void)setNoteLabel:(id)a3;
- (void)setPriceLabel:(id)a3;
- (void)setRadioConfig:(id)a3;
- (void)setSelectButton:(id)a3;
- (void)setSymbolConfig:(id)a3;
@end

@implementation BYODDomainSearchResultCellView

- (BYODDomainSearchResultCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v75.receiver = self;
  v75.super_class = (Class)BYODDomainSearchResultCellView;
  id v74 = a4;
  v5 = -[BYODDomainSearchResultCellView initWithStyle:reuseIdentifier:](&v75, "initWithStyle:reuseIdentifier:", a3);
  if (v5)
  {
    uint64_t v6 = +[UIImageSymbolConfiguration configurationWithPointSize:17.0];
    symbolConfig = v5->_symbolConfig;
    v5->_symbolConfig = (UIImageSymbolConfiguration *)v6;

    uint64_t v8 = +[UIImageSymbolConfiguration configurationWithPointSize:24.0];
    radioConfig = v5->_radioConfig;
    v5->_radioConfig = (UIImageSymbolConfiguration *)v8;

    v10 = +[UIColor secondarySystemBackgroundColor];
    [(BYODDomainSearchResultCellView *)v5 setBackgroundColor:v10];

    [(BYODDomainSearchResultCellView *)v5 setSelectionStyle:0];
    id v11 = objc_alloc((Class)UIImageView);
    v12 = +[UIImage systemImageNamed:@"checkmark" withConfiguration:v5->_symbolConfig];
    v13 = (UIImageView *)[v11 initWithImage:v12];
    availableCheck = v5->_availableCheck;
    v5->_availableCheck = v13;

    v15 = v5->_availableCheck;
    v16 = +[UIColor systemGreenColor];
    [(UIImageView *)v15 setTintColor:v16];

    [(UIImageView *)v5->_availableCheck setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = [(BYODDomainSearchResultCellView *)v5 contentView];
    [v17 addSubview:v5->_availableCheck];

    uint64_t v18 = [(BYODDomainSearchResultCellView *)v5 textLabel];
    noteLabel = v5->_noteLabel;
    v5->_noteLabel = (UILabel *)v18;

    [(UILabel *)v5->_noteLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v5->_noteLabel setLineBreakMode:1];
    [(UILabel *)v5->_noteLabel setNumberOfLines:0];
    v20 = (UILabel *)objc_alloc_init((Class)UILabel);
    priceLabel = v5->_priceLabel;
    v5->_priceLabel = v20;

    v22 = v5->_priceLabel;
    v23 = +[UIColor systemGrayColor];
    [(UILabel *)v22 setTextColor:v23];

    [(UILabel *)v5->_priceLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v24 = v5->_priceLabel;
    +[UIFont smallSystemFontSize];
    v25 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
    [(UILabel *)v24 setFont:v25];

    v26 = [(BYODDomainSearchResultCellView *)v5 contentView];
    [v26 addSubview:v5->_priceLabel];

    uint64_t v27 = +[UIImage systemImageNamed:@"circle" withConfiguration:v5->_radioConfig];
    checkmarkImage = v5->_checkmarkImage;
    v5->_checkmarkImage = (UIImage *)v27;

    v29 = (UIButton *)objc_alloc_init((Class)UIButton);
    selectButton = v5->_selectButton;
    v5->_selectButton = v29;

    [(UIButton *)v5->_selectButton setBackgroundImage:v5->_checkmarkImage forState:0];
    v31 = v5->_selectButton;
    v32 = +[UIColor systemGray2Color];
    [(UIButton *)v31 setTintColor:v32];

    [(UIButton *)v5->_selectButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v33 = [(BYODDomainSearchResultCellView *)v5 contentView];
    [v33 addSubview:v5->_selectButton];

    v34 = [(UIImageView *)v5->_availableCheck leadingAnchor];
    v35 = [(BYODDomainSearchResultCellView *)v5 contentView];
    v36 = [v35 leadingAnchor];
    v37 = [v34 constraintEqualToAnchor:v36 constant:15.0];
    [v37 setActive:1];

    v38 = [(UILabel *)v5->_noteLabel leadingAnchor];
    v39 = [(UIImageView *)v5->_availableCheck trailingAnchor];
    v40 = [v38 constraintEqualToAnchor:v39 constant:5.0];
    [v40 setActive:1];

    v41 = [(UILabel *)v5->_noteLabel widthAnchor];
    v42 = [(BYODDomainSearchResultCellView *)v5 contentView];
    v43 = [v42 widthAnchor];
    v44 = [v41 constraintLessThanOrEqualToAnchor:v43 multiplier:0.75];
    [v44 setActive:1];

    v45 = [(UILabel *)v5->_priceLabel leadingAnchor];
    v46 = [(UILabel *)v5->_noteLabel leadingAnchor];
    v47 = [v45 constraintEqualToAnchor:v46 constant:0.0];
    [v47 setActive:1];

    v48 = [(UIButton *)v5->_selectButton trailingAnchor];
    v49 = [(BYODDomainSearchResultCellView *)v5 contentView];
    v50 = [v49 trailingAnchor];
    v51 = [v48 constraintEqualToAnchor:v50 constant:-15.0];
    [v51 setActive:1];

    v52 = [(UIImageView *)v5->_availableCheck centerYAnchor];
    v53 = [(UILabel *)v5->_noteLabel centerYAnchor];
    v54 = [v52 constraintEqualToAnchor:v53 constant:0.0];
    [v54 setActive:1];

    v55 = [(UILabel *)v5->_noteLabel topAnchor];
    v56 = [(BYODDomainSearchResultCellView *)v5 contentView];
    v57 = [v56 topAnchor];
    v58 = [v55 constraintEqualToAnchor:v57 constant:10.0];
    [v58 setActive:1];

    v59 = [(UILabel *)v5->_noteLabel bottomAnchor];
    v60 = [(UILabel *)v5->_priceLabel topAnchor];
    v61 = [v59 constraintEqualToAnchor:v60 constant:-2.0];
    [v61 setActive:1];

    v62 = [(UILabel *)v5->_priceLabel topAnchor];
    v63 = [(UILabel *)v5->_noteLabel bottomAnchor];
    v64 = [v62 constraintEqualToAnchor:v63 constant:5.0];
    [v64 setActive:1];

    v65 = [(UILabel *)v5->_priceLabel bottomAnchor];
    v66 = [(BYODDomainSearchResultCellView *)v5 contentView];
    v67 = [v66 bottomAnchor];
    v68 = [v65 constraintEqualToAnchor:v67 constant:-10.0];
    [v68 setActive:1];

    v69 = [(UIButton *)v5->_selectButton centerYAnchor];
    v70 = [(BYODDomainSearchResultCellView *)v5 contentView];
    v71 = [v70 centerYAnchor];
    v72 = [v69 constraintEqualToAnchor:v71 constant:0.0];
    [v72 setActive:1];
  }
  return v5;
}

- (void)setDomain:(id)a3 price:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_domain, a3);
  NSAttributedStringKey v23 = NSFontAttributeName;
  v9 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
  v24 = v9;
  v10 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];

  NSAttributedStringKey v21 = NSFontAttributeName;
  id v11 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  v22 = v11;
  v12 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];

  v13 = +[NSBundle bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"BYOD_PURCHASE_SEARCH_NAME_AVAILABLE" value:&stru_B9F70 table:@"AccountPreferences"];
  v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v7);

  id v16 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v15 attributes:v12];
  v17 = [v16 mutableString];
  id v18 = [v17 rangeOfString:v7];
  uint64_t v20 = v19;

  if (v18 != (id)0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v16, "addAttributes:range:", v10, v18, v20);
  }
  [(UILabel *)self->_noteLabel setAttributedText:v16];
  [(UILabel *)self->_priceLabel setText:v8];
}

- (void)setChecked:(BOOL)a3
{
  radioConfig = self->_radioConfig;
  if (a3)
  {
    id v7 = +[UIImage systemImageNamed:@"checkmark.circle.fill" withConfiguration:radioConfig];
    -[UIButton setBackgroundImage:forState:](self->_selectButton, "setBackgroundImage:forState:");
    selectButton = self->_selectButton;
    +[UIColor systemBlueColor];
  }
  else
  {
    id v7 = +[UIImage systemImageNamed:@"circle" withConfiguration:radioConfig];
    -[UIButton setBackgroundImage:forState:](self->_selectButton, "setBackgroundImage:forState:");
    selectButton = self->_selectButton;
    +[UIColor systemGray2Color];
  uint64_t v6 = };
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

- (UIImageView)availableCheck
{
  return self->_availableCheck;
}

- (void)setAvailableCheck:(id)a3
{
}

- (UILabel)noteLabel
{
  return self->_noteLabel;
}

- (void)setNoteLabel:(id)a3
{
}

- (UILabel)priceLabel
{
  return self->_priceLabel;
}

- (void)setPriceLabel:(id)a3
{
}

- (UIImageSymbolConfiguration)symbolConfig
{
  return self->_symbolConfig;
}

- (void)setSymbolConfig:(id)a3
{
}

- (UIImageSymbolConfiguration)radioConfig
{
  return self->_radioConfig;
}

- (void)setRadioConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radioConfig, 0);
  objc_storeStrong((id *)&self->_symbolConfig, 0);
  objc_storeStrong((id *)&self->_priceLabel, 0);
  objc_storeStrong((id *)&self->_noteLabel, 0);
  objc_storeStrong((id *)&self->_availableCheck, 0);
  objc_storeStrong((id *)&self->_checkmarkImage, 0);
  objc_storeStrong((id *)&self->_selectButton, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

@end