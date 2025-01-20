@interface CRCarPlayOptionRadioCell
+ (int64_t)cellStyle;
- (BOOL)canBeChecked;
- (CRCarPlayOptionRadioCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (CRCheckmarkView)checkmarkView;
- (NSString)drawingName;
- (NSString)specifierName;
- (UIImageView)drawingView;
- (UILabel)nameLabel;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setChecked:(BOOL)a3;
- (void)setCheckmarkView:(id)a3;
- (void)setDrawingName:(id)a3;
- (void)setDrawingView:(id)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setNameLabel:(id)a3;
- (void)setSpecifierName:(id)a3;
@end

@implementation CRCarPlayOptionRadioCell

+ (int64_t)cellStyle
{
  return 1;
}

- (CRCarPlayOptionRadioCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v56.receiver = self;
  v56.super_class = (Class)CRCarPlayOptionRadioCell;
  v9 = [(CRCarPlayOptionRadioCell *)&v56 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    v11 = [(CRCarPlayOptionRadioCell *)v9 contentView];
    v12 = [(CRCarPlayOptionRadioCell *)v10 textLabel];
    [(CRCarPlayOptionRadioCell *)v10 setAccessoryType:0];
    v13 = [[CRCheckmarkView alloc] initWithChecked:[(CRCarPlayOptionRadioCell *)v10 isChecked]];
    [(CRCheckmarkView *)v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v11 addSubview:v13];
    checkmarkView = v10->_checkmarkView;
    v10->_checkmarkView = v13;
    v53 = v13;

    id v15 = objc_alloc_init((Class)UILabel);
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    v54 = v12;
    v16 = [v12 font];
    [v15 setFont:v16];

    v17 = [v12 textColor];
    [v15 setTextColor:v17];

    [v15 setTextAlignment:4];
    v18 = [v8 name];
    [(CRCarPlayOptionRadioCell *)v10 setSpecifierName:v18];

    v19 = [(CRCarPlayOptionRadioCell *)v10 specifierName];
    [v15 setText:v19];

    v52 = v15;
    [(CRCarPlayOptionRadioCell *)v10 setNameLabel:v15];
    v20 = [(CRCarPlayOptionRadioCell *)v10 textLabel];
    [v20 setHidden:1];

    id v21 = objc_alloc((Class)UIStackView);
    [(CRCarPlayOptionRadioCell *)v10 checkmarkView];
    v22 = v55 = v8;
    v59[0] = v22;
    v59[1] = v15;
    v23 = +[NSArray arrayWithObjects:v59 count:2];
    id v24 = [v21 initWithArrangedSubviews:v23];

    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v24 setAxis:0];
    [v24 setAlignment:3];
    [v24 setDistribution:0];
    [v24 setSpacing:1.17549435e-38];
    [v11 addSubview:v24];
    v50 = [v24 leadingAnchor];
    v48 = [v11 leadingAnchor];
    v45 = [v50 constraintEqualToSystemSpacingAfterAnchor:v48 multiplier:1.0];
    v58[0] = v45;
    v25 = v11;
    v26 = [v11 trailingAnchor];
    v27 = [v24 trailingAnchor];
    v28 = [v26 constraintEqualToSystemSpacingAfterAnchor:v27 multiplier:1.0];
    v58[1] = v28;
    v29 = [v24 topAnchor];
    v47 = v11;
    v30 = [v11 topAnchor];
    v31 = [v29 constraintEqualToSystemSpacingBelowAnchor:v30 multiplier:1.0];
    v58[2] = v31;
    v32 = +[NSArray arrayWithObjects:v58 count:3];
    [v25 addConstraints:v32];

    v51 = [v55 propertyForKey:@"CRCarPlayOptionImageNameKey"];
    [(CRCarPlayOptionRadioCell *)v10 setDrawingName:v51];
    v33 = +[NSBundle bundleForClass:objc_opt_class()];
    v49 = +[UIImage imageNamed:v51 inBundle:v33];

    id v34 = [objc_alloc((Class)UIImageView) initWithImage:v49];
    [v34 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v34 setContentMode:7];
    [v47 addSubview:v34];
    [(CRCarPlayOptionRadioCell *)v10 setDrawingView:v34];
    v46 = [v34 centerXAnchor];
    v44 = [v47 centerXAnchor];
    v43 = [v46 constraintEqualToAnchor:v44];
    v57[0] = v43;
    v42 = [v34 topAnchor];
    v35 = [v24 bottomAnchor];
    v36 = [v42 constraintEqualToSystemSpacingBelowAnchor:v35 multiplier:1.0];
    v57[1] = v36;
    v37 = [v47 bottomAnchor];
    v38 = [v34 bottomAnchor];
    v39 = [v37 constraintEqualToSystemSpacingBelowAnchor:v38 multiplier:1.0];
    v57[2] = v39;
    v40 = +[NSArray arrayWithObjects:v57 count:3];

    [v47 addConstraints:v40];
    id v8 = v55;
  }
  return v10;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CRCarPlayOptionRadioCell;
  id v4 = a3;
  [(CRCarPlayOptionRadioCell *)&v15 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "name", v15.receiver, v15.super_class);
  v6 = [v4 propertyForKey:@"CRCarPlayOptionImageNameKey"];

  v7 = [(CRCarPlayOptionRadioCell *)self specifierName];
  if ([v5 isEqualToString:v7])
  {
    id v8 = [(CRCarPlayOptionRadioCell *)self drawingName];
    unsigned __int8 v9 = [v6 isEqualToString:v8];

    if (v9) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  [(CRCarPlayOptionRadioCell *)self setAccessoryType:0];
  v10 = [(CRCarPlayOptionRadioCell *)self checkmarkView];
  objc_msgSend(v10, "setChecked:", -[CRCarPlayOptionRadioCell isChecked](self, "isChecked"));

  [(CRCarPlayOptionRadioCell *)self setSpecifierName:v5];
  v11 = [(CRCarPlayOptionRadioCell *)self nameLabel];
  [v11 setText:v5];

  [(CRCarPlayOptionRadioCell *)self setDrawingName:v6];
  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = +[UIImage imageNamed:v6 inBundle:v12];

  v14 = [(CRCarPlayOptionRadioCell *)self drawingView];
  [v14 setImage:v13];

LABEL_6:
}

- (BOOL)canBeChecked
{
  return 1;
}

- (void)setChecked:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CRCarPlayOptionRadioCell;
  -[CRCarPlayOptionRadioCell setChecked:](&v6, "setChecked:");
  [(CRCarPlayOptionRadioCell *)self setAccessoryType:0];
  v5 = [(CRCarPlayOptionRadioCell *)self checkmarkView];
  [v5 setChecked:v3];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  if (a3) {
    double v5 = 0.5;
  }
  else {
    double v5 = 1.0;
  }
  objc_super v6 = [(CRCarPlayOptionRadioCell *)self checkmarkView];
  [v6 setAlpha:v5];

  v7 = [(CRCarPlayOptionRadioCell *)self nameLabel];
  [v7 setAlpha:v5];

  id v8 = [(CRCarPlayOptionRadioCell *)self drawingView];
  [v8 setAlpha:v5];
}

- (CRCheckmarkView)checkmarkView
{
  return self->_checkmarkView;
}

- (void)setCheckmarkView:(id)a3
{
}

- (NSString)specifierName
{
  return self->_specifierName;
}

- (void)setSpecifierName:(id)a3
{
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (NSString)drawingName
{
  return self->_drawingName;
}

- (void)setDrawingName:(id)a3
{
}

- (UIImageView)drawingView
{
  return self->_drawingView;
}

- (void)setDrawingView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawingView, 0);
  objc_storeStrong((id *)&self->_drawingName, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_specifierName, 0);

  objc_storeStrong((id *)&self->_checkmarkView, 0);
}

@end