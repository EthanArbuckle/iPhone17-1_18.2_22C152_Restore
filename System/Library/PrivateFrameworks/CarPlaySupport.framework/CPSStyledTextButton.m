@interface CPSStyledTextButton
+ (id)buttonWithTextButton:(id)a3;
- (BOOL)canBecomeFocused;
- (UIFont)fontOverride;
- (id)_buttonFont;
- (id)_externalUnfocusedBorderColor;
- (void)setFontOverride:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CPSStyledTextButton

+ (id)buttonWithTextButton:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = (id)[(id)objc_opt_class() buttonWithType:1];
  if (v17)
  {
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v7 = (id)[location[0] title];
    objc_msgSend(v17, "setTitle:forState:");

    id v8 = (id)[location[0] identifier];
    objc_msgSend(v17, "setIdentifier:");

    id v9 = (id)[v17 layer];
    [v9 setCornerCurve:*MEMORY[0x263F15A20]];

    id v10 = (id)[v17 layer];
    [v10 setCornerRadius:6.0];

    id v11 = (id)[MEMORY[0x263F1C550] _carSystemFocusColor];
    objc_msgSend(v17, "setTitleColor:forState:");

    id v12 = (id)[MEMORY[0x263F1C550] _carSystemFocusColor];
    objc_msgSend(v17, "setTintColor:");

    id v13 = (id)[MEMORY[0x263F1C550] _carSystemFocusLabelColor];
    objc_msgSend(v17, "setTitleColor:forState:");

    objc_msgSend(v17, "setEnabled:", objc_msgSend(location[0], "isEnabled") & 1);
    [v17 setClipsToBounds:1];
    id v15 = (id)[v17 titleLabel];
    id v14 = (id)[v17 _buttonFont];
    objc_msgSend(v15, "setFont:");

    uint64_t v16 = [location[0] textStyle];
    if (v16)
    {
      if (v16 == 1)
      {
        id v6 = (id)[MEMORY[0x263F1C550] systemRedColor];
        objc_msgSend(v17, "setTitleColor:forState:");
      }
      else if (v16 == 2)
      {
        id v5 = (id)[MEMORY[0x263F1C550] systemGreenColor];
        objc_msgSend(v17, "setTitleColor:forState:");
      }
    }
  }
  id v4 = v17;
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);

  return v4;
}

- (id)_buttonFont
{
  v20[1] = *MEMORY[0x263EF8340];
  id v15 = self;
  v14[1] = (id)a2;
  id v12 = [(CPSStyledTextButton *)self fontOverride];

  if (v12)
  {
    uint64_t v16 = [(CPSStyledTextButton *)v15 fontOverride];
  }
  else
  {
    id v7 = (void *)MEMORY[0x263F1C660];
    uint64_t v6 = *MEMORY[0x263F1D268];
    id v8 = (id)[(CPSStyledTextButton *)v15 traitCollection];
    v14[0] = (id)objc_msgSend(v7, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v6);

    uint64_t v19 = *MEMORY[0x263F1D350];
    id v9 = (id)[NSNumber numberWithDouble:*MEMORY[0x263F1D318]];
    v20[0] = v9;
    id v13 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, &v19);

    id v10 = v14[0];
    uint64_t v17 = *MEMORY[0x263F1D210];
    id v18 = v13;
    id v11 = (id)[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v2 = (id)objc_msgSend(v10, "fontDescriptorByAddingAttributes:");
    id v3 = v14[0];
    v14[0] = v2;

    uint64_t v16 = (UIFont *)(id)[MEMORY[0x263F1C658] fontWithDescriptor:v14[0] size:0.0];
    objc_storeStrong(&v13, 0);
    objc_storeStrong(v14, 0);
  }
  id v4 = v16;

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)CPSStyledTextButton;
  [(CPUIButton *)&v5 traitCollectionDidChange:location[0]];
  id v4 = (id)[(CPSStyledTextButton *)v7 titleLabel];
  id v3 = [(CPSStyledTextButton *)v7 _buttonFont];
  objc_msgSend(v4, "setFont:");

  objc_storeStrong(location, 0);
}

- (id)_externalUnfocusedBorderColor
{
  return (id)objc_msgSend(MEMORY[0x263F1C550], "_carSystemQuaternaryColor", a2, self);
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (UIFont)fontOverride
{
  return self->_fontOverride;
}

- (void)setFontOverride:(id)a3
{
}

- (void).cxx_destruct
{
}

@end