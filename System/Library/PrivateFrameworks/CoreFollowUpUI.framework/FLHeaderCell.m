@interface FLHeaderCell
+ (int64_t)cellStyle;
- (FLHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)_updateConstraintsWithImage;
- (void)_updateConstraintsWithNoImage;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)updateConstraints;
@end

@implementation FLHeaderCell

+ (int64_t)cellStyle
{
  return 3;
}

- (FLHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v40.receiver = self;
  v40.super_class = (Class)FLHeaderCell;
  v9 = [(FLHeaderCell *)&v40 initWithStyle:a3 reuseIdentifier:a4];
  v10 = v9;
  if (v9)
  {
    [(FLHeaderCell *)v9 setUserInteractionEnabled:0];
    v11 = [v8 propertyForKey:*MEMORY[0x263F352A8]];
    v12 = [v11 groupIdentifier];
    int v13 = [v12 isEqualToString:*MEMORY[0x263F352D8]];

    v14 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    [(UILabel *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v14 setNumberOfLines:0];
    [(UILabel *)v14 setLineBreakMode:0];
    if (v13)
    {
      uint64_t v15 = *MEMORY[0x263F1D260];
      v16 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
      [(UILabel *)v14 setFont:v16];

      v17 = [MEMORY[0x263F5FBC0] appearance];
      v18 = [v17 textColor];
      if (v18)
      {
        [(UILabel *)v14 setTextColor:v18];
      }
      else
      {
        v22 = [MEMORY[0x263F1C550] blackColor];
        [(UILabel *)v14 setTextColor:v22];
      }
      LODWORD(v23) = 1144750080;
      [(UILabel *)v14 setContentCompressionResistancePriority:0 forAxis:v23];
      followTitle = v10->_followTitle;
      v10->_followTitle = v14;

      v25 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
      v26 = [MEMORY[0x263F1C550] secondaryLabelColor];
      [(UILabel *)v25 setTextColor:v26];

      [(UILabel *)v25 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UILabel *)v25 setNumberOfLines:0];
      [(UILabel *)v25 setLineBreakMode:0];
      v27 = (void *)MEMORY[0x263F1C658];
      uint64_t v28 = v15;
    }
    else
    {
      v19 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D298]];
      [(UILabel *)v14 setFont:v19];

      v20 = [MEMORY[0x263F5FBC0] appearance];
      v21 = [v20 textColor];
      if (v21)
      {
        [(UILabel *)v14 setTextColor:v21];
      }
      else
      {
        v29 = [MEMORY[0x263F1C550] blackColor];
        [(UILabel *)v14 setTextColor:v29];
      }
      LODWORD(v30) = 1144750080;
      [(UILabel *)v14 setContentCompressionResistancePriority:0 forAxis:v30];
      v31 = v10->_followTitle;
      v10->_followTitle = v14;

      v25 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
      v32 = [MEMORY[0x263F5FBC0] appearance];
      v33 = [v32 textColor];
      if (v33)
      {
        [(UILabel *)v25 setTextColor:v33];
      }
      else
      {
        v34 = [MEMORY[0x263F1C550] blackColor];
        [(UILabel *)v25 setTextColor:v34];
      }
      [(UILabel *)v25 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UILabel *)v25 setNumberOfLines:0];
      [(UILabel *)v25 setLineBreakMode:0];
      v27 = (void *)MEMORY[0x263F1C658];
      uint64_t v28 = *MEMORY[0x263F1D2C0];
    }
    v35 = [v27 preferredFontForTextStyle:v28];
    [(UILabel *)v25 setFont:v35];

    LODWORD(v36) = 1144750080;
    [(UILabel *)v25 setContentCompressionResistancePriority:0 forAxis:v36];
    followSubtitle = v10->_followSubtitle;
    v10->_followSubtitle = v25;

    v38 = [(FLHeaderCell *)v10 contentView];
    [v38 addSubview:v10->_followTitle];
    [v38 addSubview:v10->_followSubtitle];
    [(FLHeaderCell *)v10 layoutSubviews];
  }
  return v10;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)FLHeaderCell;
  [(PSTableCell *)&v3 layoutSubviews];
  [(FLHeaderCell *)self setNeedsUpdateConstraints];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)FLHeaderCell;
  id v4 = a3;
  [(PSTableCell *)&v22 refreshCellContentsWithSpecifier:v4];
  v5 = [v4 propertyForKey:*MEMORY[0x263F352A8]];

  v6 = [v5 groupIdentifier];
  uint64_t v7 = *MEMORY[0x263F352D0];
  if ([v6 isEqualToString:*MEMORY[0x263F352D0]])
  {
    id v8 = [v5 userInfo];
    uint64_t v9 = *MEMORY[0x263F35340];
    v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F35340]];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v12 = [v5 userInfo];
      int v13 = [v12 objectForKeyedSubscript:v9];
      [(UILabel *)self->_followTitle setText:v13];

      goto LABEL_6;
    }
  }
  else
  {
  }
  v12 = [v5 title];
  [(UILabel *)self->_followTitle setText:v12];
LABEL_6:

  v14 = [v5 groupIdentifier];
  if (![v14 isEqualToString:v7])
  {

    goto LABEL_11;
  }
  int v15 = [v5 displayExpirationDate];

  if (!v15)
  {
LABEL_11:
    uint64_t v21 = [v5 informativeText];
LABEL_12:
    v18 = (void *)v21;
    [(UILabel *)self->_followSubtitle setText:v21];
    goto LABEL_13;
  }
  v16 = [v5 informativeText];

  if (!v16)
  {
    uint64_t v21 = [v5 formattedExpirationDate];
    goto LABEL_12;
  }
  v17 = NSString;
  v18 = [v5 formattedExpirationDate];
  v19 = [v5 informativeText];
  v20 = [v17 stringWithFormat:@"%@\n%@", v18, v19, v22.receiver, v22.super_class];
  [(UILabel *)self->_followSubtitle setText:v20];

LABEL_13:
  [(FLHeaderCell *)self setNeedsLayout];
}

- (void)updateConstraints
{
  [MEMORY[0x263F08938] deactivateConstraints:self->_constraints];
  objc_super v3 = [(PSTableCell *)self specifier];
  id v4 = [v3 propertyForKey:*MEMORY[0x263F60140]];

  if (v4) {
    [(FLHeaderCell *)self _updateConstraintsWithImage];
  }
  else {
    [(FLHeaderCell *)self _updateConstraintsWithNoImage];
  }
  [MEMORY[0x263F08938] activateConstraints:self->_constraints];
  v5.receiver = self;
  v5.super_class = (Class)FLHeaderCell;
  [(FLHeaderCell *)&v5 updateConstraints];
}

- (void)_updateConstraintsWithNoImage
{
  _NSDictionaryOfVariableBindings(&cfstr_FollowtitleFol.isa, self->_followTitle, self->_followSubtitle, 0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v3 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-[_followTitle]-|" options:0 metrics:0 views:v9];
  id v4 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-[_followSubtitle]-|" options:0 metrics:0 views:v9];
  objc_super v5 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-11-[_followTitle]-[_followSubtitle]-11-|" options:0 metrics:0 views:v9];
  v6 = [v3 arrayByAddingObjectsFromArray:v4];
  uint64_t v7 = [v6 arrayByAddingObjectsFromArray:v5];
  constraints = self->_constraints;
  self->_constraints = v7;
}

- (void)_updateConstraintsWithImage
{
  v17[3] = *MEMORY[0x263EF8340];
  objc_super v3 = [(FLHeaderCell *)self imageView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 setContentMode:1];
  LODWORD(v4) = 1148846080;
  [v3 setContentHuggingPriority:0 forAxis:v4];
  objc_super v5 = _NSDictionaryOfVariableBindings(&cfstr_FollowtitleFol_0.isa, self->_followTitle, self->_followSubtitle, v3, 0);
  v16 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-(10)-[imageView(40)]-(10)-[_followTitle]-|" options:0 metrics:0 views:v5];
  int v15 = [MEMORY[0x263F08938] constraintWithItem:self->_followTitle attribute:5 relatedBy:0 toItem:self->_followSubtitle attribute:5 multiplier:1.0 constant:0.0];
  v6 = [MEMORY[0x263F08938] constraintWithItem:self->_followTitle attribute:6 relatedBy:0 toItem:self->_followSubtitle attribute:6 multiplier:1.0 constant:0.0];
  v14 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:[_followTitle]-[_followSubtitle]-11-|" options:0 metrics:0 views:v5];
  uint64_t v7 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-11-[imageView(40)]-(>=0)-|" options:0 metrics:0 views:v5];
  id v8 = [MEMORY[0x263F08938] constraintWithItem:self->_followTitle attribute:3 relatedBy:0 toItem:v3 attribute:3 multiplier:1.0 constant:0.0];
  id v9 = [v16 arrayByAddingObjectsFromArray:v14];
  v10 = [v9 arrayByAddingObjectsFromArray:v7];
  v17[0] = v15;
  v17[1] = v6;
  v17[2] = v8;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
  v12 = [v10 arrayByAddingObjectsFromArray:v11];
  constraints = self->_constraints;
  self->_constraints = v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_followSubtitle, 0);

  objc_storeStrong((id *)&self->_followTitle, 0);
}

@end