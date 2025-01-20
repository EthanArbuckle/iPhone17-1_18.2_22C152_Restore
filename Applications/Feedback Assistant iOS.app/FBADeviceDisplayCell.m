@interface FBADeviceDisplayCell
+ (id)reuseIdentifier;
- (NSString)itemIdentifier;
- (UIImageView)deviceIcon;
- (UILabel)nameLabel;
- (UILabel)typeLabel;
- (double)spaceFromSuperViewToLabel;
- (void)awakeFromNib;
- (void)configureSelected:(BOOL)a3;
- (void)didTapConnectionButton:(id)a3;
- (void)layoutSubviews;
- (void)setDeviceIcon:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setTypeLabel:(id)a3;
- (void)updateNumberOfLines;
- (void)updateWithDevice:(id)a3;
@end

@implementation FBADeviceDisplayCell

- (double)spaceFromSuperViewToLabel
{
  v2 = [(FBADeviceDisplayCell *)self nameLabel];
  [v2 frame];
  double v4 = v3;

  return v4;
}

- (void)awakeFromNib
{
  v9.receiver = self;
  v9.super_class = (Class)FBADeviceDisplayCell;
  [(FBADeviceDisplayCell *)&v9 awakeFromNib];
  double v3 = [(FBADeviceDisplayCell *)self nameLabel];
  [v3 setText:&stru_1000F6658];

  double v4 = +[UIColor labelColor];
  v5 = [(FBADeviceDisplayCell *)self nameLabel];
  [v5 setTextColor:v4];

  v6 = [(FBADeviceDisplayCell *)self typeLabel];
  [v6 setText:&stru_1000F6658];

  v7 = +[UIColor secondaryLabelColor];
  v8 = [(FBADeviceDisplayCell *)self typeLabel];
  [v8 setTextColor:v7];

  [(FBADeviceDisplayCell *)self setSelectionStyle:0];
}

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)didTapConnectionButton:(id)a3
{
}

- (void)updateWithDevice:(id)a3
{
  id v4 = a3;
  v5 = [v4 displayName];
  v6 = [(FBADeviceDisplayCell *)self nameLabel];
  [v6 setText:v5];

  v7 = [v4 displayType];
  v8 = [(FBADeviceDisplayCell *)self typeLabel];
  [v8 setText:v7];

  objc_super v9 = +[UIScreen mainScreen];
  [v9 scale];
  *(float *)&double v10 = v10;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100029BC4;
  v11[3] = &unk_1000F33A0;
  v11[4] = self;
  [v4 fetchIconImageDataForScale:v11 completionCompletion:v10];

  [(FBADeviceDisplayCell *)self updateNumberOfLines];
}

- (void)configureSelected:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 0;
  }
  [(FBADeviceDisplayCell *)self setAccessoryType:v3];
}

- (void)updateNumberOfLines
{
  uint64_t v3 = [(FBADeviceDisplayCell *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  v6 = [(FBADeviceDisplayCell *)self nameLabel];
  [v6 setNumberOfLines:!IsAccessibilityCategory];

  id v7 = [(FBADeviceDisplayCell *)self typeLabel];
  [v7 setNumberOfLines:!IsAccessibilityCategory];
}

- (void)layoutSubviews
{
  [(FBADeviceDisplayCell *)self updateNumberOfLines];
  v3.receiver = self;
  v3.super_class = (Class)FBADeviceDisplayCell;
  [(FBADeviceDisplayCell *)&v3 layoutSubviews];
}

- (NSString)itemIdentifier
{
  return self->itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)typeLabel
{
  return self->_typeLabel;
}

- (void)setTypeLabel:(id)a3
{
}

- (UIImageView)deviceIcon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceIcon);

  return (UIImageView *)WeakRetained;
}

- (void)setDeviceIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceIcon);
  objc_storeStrong((id *)&self->_typeLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);

  objc_storeStrong((id *)&self->itemIdentifier, 0);
}

@end