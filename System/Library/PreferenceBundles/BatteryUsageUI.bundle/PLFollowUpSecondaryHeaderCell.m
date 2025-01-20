@interface PLFollowUpSecondaryHeaderCell
+ (int64_t)cellStyle;
- (PLFollowUpSecondaryHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)subHeaderLabel;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)updateConstraints;
@end

@implementation PLFollowUpSecondaryHeaderCell

+ (int64_t)cellStyle
{
  return 3;
}

- (id)subHeaderLabel
{
  id v2 = objc_alloc_init((Class)UILabel);
  v3 = +[PSListController appearance];
  v4 = [v3 textColor];
  if (v4)
  {
    [v2 setTextColor:v4];
  }
  else
  {
    v5 = +[UIColor blackColor];
    [v2 setTextColor:v5];
  }
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v2 setNumberOfLines:0];
  [v2 setLineBreakMode:0];
  v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
  [v2 setFont:v6];

  LODWORD(v7) = 1144750080;
  [v2 setContentCompressionResistancePriority:0 forAxis:v7];
  objc_msgSend(v2, "setTextAlignment:", +[PLBatteryUIUtilities localizedLeftTextAlignment](PLBatteryUIUtilities, "localizedLeftTextAlignment"));

  return v2;
}

- (PLFollowUpSecondaryHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)PLFollowUpSecondaryHeaderCell;
  v4 = [(PLFollowUpSecondaryHeaderCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(PLFollowUpSecondaryHeaderCell *)v4 contentView];
    uint64_t v7 = [(PLFollowUpSecondaryHeaderCell *)v5 subHeaderLabel];
    subHeader = v5->_subHeader;
    v5->_subHeader = (UILabel *)v7;

    [v6 addSubview:v5->_subHeader];
    v13 = v5->_subHeader;
    v9 = +[NSArray arrayWithObjects:&v13 count:1];
    [v6 setAccessibilityElements:v9];

    v11.receiver = v5;
    v11.super_class = (Class)PLFollowUpSecondaryHeaderCell;
    [(PLFollowUpSecondaryHeaderCell *)&v11 layoutSubviews];
    [(PLFollowUpSecondaryHeaderCell *)v5 setNeedsUpdateConstraints];
  }
  return v5;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PLFollowUpSecondaryHeaderCell;
  id v4 = a3;
  [(PLFollowUpSecondaryHeaderCell *)&v6 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "propertyForKey:", @"PLFollowUpSecondaryHeaderCellTextKey", v6.receiver, v6.super_class);

  [(UILabel *)self->_subHeader setText:v5];
  [(PLFollowUpSecondaryHeaderCell *)self setNeedsLayout];
}

- (void)updateConstraints
{
  +[NSLayoutConstraint deactivateConstraints:self->_constraints];
  v3 = _NSDictionaryOfVariableBindings(@"_subHeader", self->_subHeader, 0);
  id v4 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-[_subHeader]-|", 0, 0, v3);
  v5 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-11-[_subHeader]-11-|", 0, 0, v3);
  objc_super v6 = [v4 arrayByAddingObjectsFromArray:v5];
  constraints = self->_constraints;
  self->_constraints = v6;

  +[NSLayoutConstraint activateConstraints:self->_constraints];
  v8.receiver = self;
  v8.super_class = (Class)PLFollowUpSecondaryHeaderCell;
  [(PLFollowUpSecondaryHeaderCell *)&v8 updateConstraints];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);

  objc_storeStrong((id *)&self->_subHeader, 0);
}

@end