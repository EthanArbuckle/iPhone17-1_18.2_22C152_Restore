@interface CPSGridButton
+ (id)buttonWithGridButton:(id)a3 templateDelegate:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToGridButton:(id)a3;
- (CPGridButton)gridButton;
- (CPSAbridgableLabel)customTitleLabel;
- (CPTemplateDelegate)templateDelegate;
- (UIView)focusView;
- (double)preferredLabelWidth;
- (unint64_t)hash;
- (void)_updateLabelColor;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setCustomTitleLabel:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFocusView:(id)a3;
- (void)setGridButton:(id)a3;
- (void)setTemplateDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CPSGridButton

+ (id)buttonWithGridButton:(id)a3 templateDelegate:(id)a4
{
  v56[8] = *MEMORY[0x263EF8340];
  id v55 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v53 = 0;
  objc_storeStrong(&v53, a4);
  v51.receiver = v55;
  v51.super_class = (Class)&OBJC_METACLASS___CPSGridButton;
  id v52 = objc_msgSendSuper2(&v51, sel_buttonWithType_, 0);
  if (v52)
  {
    id v8 = v52;
    id v9 = (id)[location[0] identifier];
    objc_msgSend(v8, "setIdentifier:");

    char v4 = [location[0] isEnabled];
    [v52 setEnabled:v4 & 1];
    id v50 = (id)[location[0] image];
    objc_msgSend(v52, "setImage:forState:", v50);
    id v49 = objc_alloc_init(MEMORY[0x263F1CB60]);
    [v49 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v10 = v49;
    id v11 = (id)[MEMORY[0x263F1C550] _carSystemFocusColor];
    objc_msgSend(v10, "setBackgroundColor:");

    objc_msgSend(v49, "_setCornerRadius:");
    [v49 setHidden:1];
    [v52 setFocusView:v49];
    [v52 addSubview:v49];
    v48[1] = (id)1;
    v48[0] = objc_alloc_init(CPSAbridgableLabel);
    [v48[0] setTranslatesAutoresizingMaskIntoConstraints:0];
    id v12 = v48[0];
    id v13 = (id)[MEMORY[0x263F1C550] labelColor];
    objc_msgSend(v12, "setTextColor:");

    id v16 = v48[0];
    v15 = (void *)MEMORY[0x263F1C658];
    uint64_t v14 = *MEMORY[0x263F1D270];
    id v18 = (id)[v52 traitCollection];
    id v17 = (id)objc_msgSend(v15, "preferredFontForTextStyle:compatibleWithTraitCollection:", v14);
    objc_msgSend(v16, "setFont:");

    [v48[0] setTextAlignment:1];
    [v48[0] setNumberOfLines:1];
    [v48[0] sizeToFit];
    objc_msgSend(v48[0], "setEnabled:", objc_msgSend(location[0], "isEnabled") & 1);
    LODWORD(v5) = 1148846080;
    [v48[0] setContentCompressionResistancePriority:0 forAxis:v5];
    [v52 addSubview:v48[0]];
    [v52 setCustomTitleLabel:v48[0]];
    id v19 = v52;
    id v43 = (id)[v48[0] centerXAnchor];
    id v42 = (id)[v52 centerXAnchor];
    id v41 = (id)objc_msgSend(v43, "constraintEqualToAnchor:");
    v56[0] = v41;
    id v40 = (id)[v48[0] bottomAnchor];
    id v39 = (id)[v52 bottomAnchor];
    id v38 = (id)objc_msgSend(v40, "constraintEqualToAnchor:");
    v56[1] = v38;
    id v37 = (id)[v48[0] widthAnchor];
    id v36 = (id)[v52 widthAnchor];
    id v35 = (id)objc_msgSend(v37, "constraintLessThanOrEqualToAnchor:multiplier:");
    v56[2] = v35;
    id v34 = (id)[v48[0] heightAnchor];
    id v33 = (id)[v34 constraintEqualToConstant:16.0];
    v56[3] = v33;
    id v32 = (id)[v49 leftAnchor];
    id v31 = (id)[v48[0] leftAnchor];
    id v30 = (id)objc_msgSend(v32, "constraintEqualToAnchor:constant:", -4.0);
    v56[4] = v30;
    id v29 = (id)[v49 rightAnchor];
    id v28 = (id)[v48[0] rightAnchor];
    id v27 = (id)objc_msgSend(v29, "constraintEqualToAnchor:constant:", 4.0);
    v56[5] = v27;
    id v26 = (id)[v49 topAnchor];
    id v25 = (id)[v48[0] topAnchor];
    id v24 = (id)objc_msgSend(v26, "constraintEqualToAnchor:constant:", -1.0);
    v56[6] = v24;
    id v23 = (id)[v49 bottomAnchor];
    id v22 = (id)[v48[0] bottomAnchor];
    id v21 = (id)objc_msgSend(v23, "constraintEqualToAnchor:constant:", 1.0);
    v56[7] = v21;
    id v20 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:8];
    objc_msgSend(v19, "addConstraints:");

    [v52 setGridButton:location[0]];
    [v52 setTemplateDelegate:v53];
    id v44 = v48[0];
    id v45 = (id)[location[0] titleVariants];
    objc_msgSend(v44, "setTextVariants:");

    id v46 = (id)[v48[0] textVariants];
    objc_msgSend(v52, "setAccessibilityUserInputLabels:");

    objc_storeStrong(v48, 0);
    objc_storeStrong(&v49, 0);
    objc_storeStrong(&v50, 0);
  }
  id v7 = v52;
  objc_storeStrong(&v52, 0);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(location, 0);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  double v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v5 == location[0])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v6 = [(CPSGridButton *)v5 isEqualToGridButton:location[0]];
    }
    else {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (BOOL)isEqualToGridButton:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v5 = [(CPSGridButton *)v8 gridButton];
  id v4 = (id)[location[0] gridButton];
  char v6 = -[CPGridButton isEqual:](v5, "isEqual:");

  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (unint64_t)hash
{
  v3 = [(CPSGridButton *)self gridButton];
  unint64_t v4 = [(CPGridButton *)v3 hash];

  return v4;
}

- (double)preferredLabelWidth
{
  v15[2] = *MEMORY[0x263EF8340];
  id v13 = self;
  v12[1] = (id)a2;
  char v6 = [(CPSGridButton *)self gridButton];
  double v5 = [(CPGridButton *)v6 titleVariants];
  v12[0] = [(NSArray *)v5 firstObject];

  id v11 = objc_alloc_init(MEMORY[0x263F1C350]);
  uint64_t v2 = [(CPSAbridgableLabel *)v13->_customTitleLabel lineBreakMode];
  [v11 setLineBreakMode:v2];
  id v7 = v12[0];
  v14[0] = *MEMORY[0x263F1C238];
  id v9 = (id)[(CPSAbridgableLabel *)v13->_customTitleLabel font];
  v15[0] = v9;
  v14[1] = *MEMORY[0x263F1C268];
  v15[1] = v11;
  id v8 = (id)[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  objc_msgSend(v7, "sizeWithAttributes:");
  double v10 = v3;

  objc_storeStrong(&v11, 0);
  objc_storeStrong(v12, 0);
  return ceil(v10);
}

- (void)layoutSubviews
{
  double v10 = self;
  SEL v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)CPSGridButton;
  [(CPSGridButton *)&v8 layoutSubviews];
  [(CPSGridButton *)v10 bounds];
  CGRectGetWidth(v11);
  [(CPSGridButton *)v10 bounds];
  CGRectGetHeight(v12);
  char v6 = v10;
  UIEdgeInsetsMake();
  -[CPSGridButton setImageEdgeInsets:](v6, "setImageEdgeInsets:", v2, v3, v4, v5);
  id v7 = (id)[(CPSGridButton *)v10 imageView];
  [v7 setNeedsUpdateConstraints];
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CPSGridButton;
  [(CPUIButton *)&v5 setEnabled:a3];
  BOOL v3 = v6;
  double v4 = [(CPSGridButton *)v8 customTitleLabel];
  [(CPSAbridgableLabel *)v4 setEnabled:v3];
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)CPSGridButton;
  [(CPSGridButton *)&v5 pressesBegan:location[0] withEvent:v6];
  if (_pressesContainsPressType(location[0], 4)) {
    [(CPSGridButton *)v8 setHighlighted:1];
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)CPSGridButton;
  [(CPSGridButton *)&v5 pressesEnded:location[0] withEvent:v6];
  if (_pressesContainsPressType(location[0], 4)) {
    [(CPSGridButton *)v8 setHighlighted:0];
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)CPSGridButton;
  [(CPSGridButton *)&v5 pressesCancelled:location[0] withEvent:v6];
  if (_pressesContainsPressType(location[0], 4)) {
    [(CPSGridButton *)v8 setHighlighted:0];
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  CGRect v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  v9.receiver = v12;
  v9.super_class = (Class)CPSGridButton;
  [(CPSGridButton *)&v9 didUpdateFocusInContext:location[0] withAnimationCoordinator:v10];
  double v4 = (CPSGridButton *)(id)[location[0] nextFocusedItem];
  BOOL v8 = v4 != v12;

  if (v8)
  {
    objc_super v5 = [(CPSGridButton *)v12 focusView];
    [(UIView *)v5 setHidden:1];
  }
  else
  {
    id v6 = [(CPSGridButton *)v12 focusView];
    [(UIView *)v6 setHidden:0];
  }
  [(CPSGridButton *)v12 _updateLabelColor];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  CGRect v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10.receiver = v12;
  v10.super_class = (Class)CPSGridButton;
  [(CPUIButton *)&v10 traitCollectionDidChange:location[0]];
  BOOL v3 = [(CPSGridButton *)v12 gridButton];
  objc_super v9 = [(CPGridButton *)v3 image];

  [(CPSGridButton *)v12 setImage:v9 forState:0];
  BOOL v8 = [(CPSGridButton *)v12 customTitleLabel];
  objc_super v5 = (void *)MEMORY[0x263F1C658];
  uint64_t v4 = *MEMORY[0x263F1D270];
  id v7 = (id)[(CPSGridButton *)v12 traitCollection];
  id v6 = (id)objc_msgSend(v5, "preferredFontForTextStyle:compatibleWithTraitCollection:", v4);
  -[CPSAbridgableLabel setFont:](v8, "setFont:");

  [(CPSGridButton *)v12 _updateLabelColor];
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_updateLabelColor
{
  if ([(CPSGridButton *)self isFocused])
  {
    objc_super v5 = [(CPSGridButton *)self customTitleLabel];
    id v4 = (id)[MEMORY[0x263F1C550] _carSystemFocusLabelColor];
    -[CPSAbridgableLabel setTextColor:](v5, "setTextColor:");
  }
  else
  {
    BOOL v3 = [(CPSGridButton *)self customTitleLabel];
    id v2 = (id)[MEMORY[0x263F1C550] labelColor];
    -[CPSAbridgableLabel setTextColor:](v3, "setTextColor:");
  }
}

- (CPSAbridgableLabel)customTitleLabel
{
  return self->_customTitleLabel;
}

- (void)setCustomTitleLabel:(id)a3
{
}

- (UIView)focusView
{
  return self->_focusView;
}

- (void)setFocusView:(id)a3
{
}

- (CPGridButton)gridButton
{
  return self->_gridButton;
}

- (void)setGridButton:(id)a3
{
}

- (CPTemplateDelegate)templateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_templateDelegate);

  return (CPTemplateDelegate *)WeakRetained;
}

- (void)setTemplateDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end