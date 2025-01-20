@interface CPSAlertButton
+ (id)buttonWithCPAlertAction:(id)a3;
- (CPAlertAction)alertAction;
- (id)_buttonFont;
- (id)_externalUnfocusedBorderColor;
- (id)buttonTitleColor;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setAlertAction:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CPSAlertButton

+ (id)buttonWithCPAlertAction:(id)a3
{
  id v14 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = (id)[v14 buttonWithType:0];
  if (v12)
  {
    id v5 = (id)[location[0] title];
    objc_msgSend(v12, "setTitle:forState:");

    id v6 = (id)[location[0] identifier];
    objc_msgSend(v12, "setIdentifier:");

    id v7 = (id)[v12 layer];
    [v7 setCornerCurve:*MEMORY[0x263F15A20]];

    id v8 = (id)[v12 layer];
    [v8 setCornerRadius:8.0];

    id v9 = _CPSAlertBackgroundColorForAction(location[0]);
    objc_msgSend(v12, "setBackgroundColor:");

    id v11 = (id)[v12 titleLabel];
    id v10 = (id)[v12 _buttonFont];
    objc_msgSend(v11, "setFont:");

    [v12 setAlertAction:location[0]];
  }
  id v4 = v12;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);

  return v4;
}

- (id)buttonTitleColor
{
  if ([(CPSAlertButton *)self isHighlighted])
  {
LABEL_2:
    id v10 = (id)[MEMORY[0x263F1C550] labelColor];
    goto LABEL_11;
  }
  if ([(CPSAlertButton *)self isFocused])
  {
    id v10 = (id)[MEMORY[0x263F1C550] _carSystemFocusLabelColor];
  }
  else
  {
    id v5 = (id)[(CPSAlertButton *)self traitCollection];
    char v7 = 0;
    BOOL v6 = 0;
    if ([v5 userInterfaceStyle] == 1)
    {
      id v8 = [(CPSAlertButton *)self alertAction];
      char v7 = 1;
      BOOL v6 = [(CPAlertAction *)v8 style] == CPAlertActionStyleCancel;
    }
    if (v7) {

    }
    if (v6) {
      goto LABEL_2;
    }
    v3 = (void *)MEMORY[0x263F1C550];
    id v4 = (id)[MEMORY[0x263F1C550] whiteColor];
    id v10 = objc_msgSend(v3, "colorWithCGColor:", objc_msgSend(v4, "CGColor"));
  }
LABEL_11:

  return v10;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7.receiver = v9;
  v7.super_class = (Class)CPSAlertButton;
  [(CPUIButton *)&v7 traitCollectionDidChange:location[0]];
  id v4 = (id)[(CPSAlertButton *)v9 titleLabel];
  id v3 = [(CPSAlertButton *)v9 _buttonFont];
  objc_msgSend(v4, "setFont:");

  id v5 = v9;
  id v6 = [(CPSAlertButton *)v9 buttonTitleColor];
  -[CPSAlertButton setTitleColor:forState:](v5, "setTitleColor:forState:");

  objc_storeStrong(location, 0);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  id v4 = (CPSAlertButton *)(id)[location[0] nextFocusedItem];
  BOOL v7 = v4 == v19;

  id v8 = v19;
  id v9 = [(CPSAlertButton *)v19 buttonTitleColor];
  -[CPSAlertButton setTitleColor:forState:](v8, "setTitleColor:forState:");

  id v10 = v19;
  char v15 = 0;
  char v13 = 0;
  char v11 = 0;
  if (v7)
  {
    id v16 = (id)[MEMORY[0x263F1C550] _carSystemFocusColor];
    char v15 = 1;
    id v5 = v16;
  }
  else
  {
    id v14 = [(CPSAlertButton *)v19 alertAction];
    char v13 = 1;
    id v12 = _CPSAlertBackgroundColorForAction(v14);
    char v11 = 1;
    id v5 = v12;
  }
  [(CPSAlertButton *)v10 setBackgroundColor:v5];
  if (v11) {

  }
  if (v13) {
  if (v15)
  }

  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)setHighlighted:(BOOL)a3
{
  id v16 = self;
  SEL v15 = a2;
  BOOL v14 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPSAlertButton;
  [(CPSAlertButton *)&v13 setHighlighted:a3];
  id v4 = v16;
  id v5 = [(CPSAlertButton *)v16 buttonTitleColor];
  -[CPSAlertButton setTitleColor:forState:](v4, "setTitleColor:forState:");

  id v6 = v16;
  char v11 = 0;
  char v9 = 0;
  char v7 = 0;
  if (v14)
  {
    id v12 = (id)[MEMORY[0x263F1C550] _carSystemFocusPrimaryColor];
    char v11 = 1;
    id v3 = v12;
  }
  else
  {
    id v10 = [(CPSAlertButton *)v16 alertAction];
    char v9 = 1;
    id v8 = _CPSAlertBackgroundColorForAction(v10);
    char v7 = 1;
    id v3 = v8;
  }
  [(CPSAlertButton *)v6 setBackgroundColor:v3];
  if (v7) {

  }
  if (v9) {
  if (v11)
  }
}

- (id)_buttonFont
{
  v17[1] = *MEMORY[0x263EF8340];
  v13[2] = self;
  v13[1] = (id)a2;
  id v6 = (void *)MEMORY[0x263F1C660];
  uint64_t v5 = *MEMORY[0x263F1D268];
  id v7 = (id)[(CPSAlertButton *)self traitCollection];
  v13[0] = (id)objc_msgSend(v6, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v5);

  uint64_t v16 = *MEMORY[0x263F1D350];
  id v8 = (id)[NSNumber numberWithDouble:*MEMORY[0x263F1D318]];
  v17[0] = v8;
  id v12 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, &v16);

  id v9 = v13[0];
  uint64_t v14 = *MEMORY[0x263F1D210];
  id v15 = v12;
  id v10 = (id)[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  id v2 = (id)objc_msgSend(v9, "fontDescriptorByAddingAttributes:");
  id v3 = v13[0];
  v13[0] = v2;

  id v11 = (id)[MEMORY[0x263F1C658] fontWithDescriptor:v13[0] size:0.0];
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);

  return v11;
}

- (id)_externalUnfocusedBorderColor
{
  id v3 = [(CPSAlertButton *)self alertAction];
  id v4 = _CPSAlertBackgroundColorForAction(v3);

  return v4;
}

- (CPAlertAction)alertAction
{
  return self->_alertAction;
}

- (void)setAlertAction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end