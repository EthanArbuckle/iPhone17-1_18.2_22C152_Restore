@interface CPSEntityButton
+ (id)buttonWithEntityButton:(id)a3;
- (CPButton)entityButton;
- (id)CPSButtonImageForButton:(id)a3;
- (id)CPSButtonTitleForButton:(id)a3;
- (void)setEntityButton:(id)a3;
@end

@implementation CPSEntityButton

+ (id)buttonWithEntityButton:(id)a3
{
  id v8 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6[1] = 0;
  v5.receiver = v8;
  v5.super_class = (Class)&OBJC_METACLASS___CPSEntityButton;
  v6[0] = objc_msgSendSuper2(&v5, sel_buttonWithType_, 0);
  [v6[0] setEntityButton:location[0]];
  id v4 = v6[0];
  objc_storeStrong(v6, 0);
  objc_storeStrong(location, 0);

  return v4;
}

- (void)setEntityButton:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v15->_entityButton != location[0])
  {
    objc_storeStrong((id *)&v15->_entityButton, location[0]);
    v10 = v15;
    v12 = [(CPSEntityButton *)v15 entityButton];
    id v11 = -[CPSEntityButton CPSButtonTitleForButton:](v10, "CPSButtonTitleForButton:");
    -[CPSActionButton setButtonText:](v15, "setButtonText:");

    v13 = [(CPSActionButton *)v15 buttonText];
    if (v13)
    {
      v9 = [(CPSActionButton *)v15 buttonText];
      v16[0] = v9;
      id v8 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
      -[CPSEntityButton setAccessibilityUserInputLabels:](v15, "setAccessibilityUserInputLabels:");
    }
    v6 = [(CPSEntityButton *)v15 entityButton];
    id v5 = (id)objc_msgSend(v4, "CPSButtonImageForButton:");
    -[CPSActionButton setButtonImage:](v15, "setButtonImage:");

    char v3 = [location[0] isEnabled];
    [(CPSActionButton *)v15 setEnabled:v3 & 1];
    id v7 = (id)[location[0] identifier];
    -[CPSButton setIdentifier:](v15, "setIdentifier:");

    [(CPSEntityButton *)v15 setNeedsLayout];
  }
  objc_storeStrong(location, 0);
}

- (id)CPSButtonImageForButton:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = (id)[location[0] image];

  if (v8)
  {
    id v11 = (id)[location[0] image];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = (id)[(CPSEntityButton *)v10 traitCollection];
      id v11 = (id)_CPUIGlyphFactoryWithTraitCollection();
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = (id)[(CPSEntityButton *)v10 traitCollection];
        id v11 = (id)_CPUIGlyphFactoryWithTraitCollection();
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v5 = (id)[(CPSEntityButton *)v10 traitCollection];
          id v11 = (id)_CPUIGlyphFactoryWithTraitCollection();
        }
        else
        {
          id v11 = 0;
        }
      }
    }
  }
  objc_storeStrong(location, 0);
  char v3 = v11;

  return v3;
}

- (id)CPSButtonTitleForButton:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = (id)[location[0] title];

  if (v5)
  {
    id v7 = (id)[location[0] title];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = CPSLocalizedStringForKey(@"MESSAGE");
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = CPSLocalizedStringForKey(@"CALL");
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v7 = CPSLocalizedStringForKey(@"DIRECTIONS");
        }
        else {
          id v7 = 0;
        }
      }
    }
  }
  objc_storeStrong(location, 0);
  char v3 = v7;

  return v3;
}

- (CPButton)entityButton
{
  return self->_entityButton;
}

- (void).cxx_destruct
{
}

@end