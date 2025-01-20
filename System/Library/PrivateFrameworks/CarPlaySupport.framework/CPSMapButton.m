@interface CPSMapButton
+ (id)buttonWithCPMapButton:(id)a3;
- (CPMapButton)mapButton;
- (float)charge;
- (void)_updateButtonImages;
- (void)setCharge:(float)a3;
- (void)setMapButton:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CPSMapButton

+ (id)buttonWithCPMapButton:(id)a3
{
  id v13 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10.receiver = v13;
  v10.super_class = (Class)&OBJC_METACLASS___CPSMapButton;
  id v11 = objc_msgSendSuper2(&v10, sel_buttonWithType_, 0);
  [v11 setMapButton:location[0]];
  LODWORD(v3) = 1.0;
  [v11 setCharge:v3];
  if (v11)
  {
    id v8 = v11;
    id v9 = (id)[location[0] identifier];
    objc_msgSend(v8, "setIdentifier:");

    char v4 = [location[0] isEnabled];
    [v11 setEnabled:v4 & 1];
    char v5 = [location[0] isHidden];
    [v11 setHidden:v5 & 1];
    [v11 _updateButtonImages];
  }
  id v7 = v11;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);

  return v7;
}

- (float)charge
{
  return 1.0;
}

- (void)setCharge:(float)a3
{
  id v7 = self;
  SEL v6 = a2;
  float v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)CPSMapButton;
  LODWORD(v3) = 1.0;
  [(CPSMapButton *)&v4 setCharge:v3];
}

- (void)traitCollectionDidChange:(id)a3
{
  float v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSMapButton;
  [(CPUIButton *)&v3 traitCollectionDidChange:location[0]];
  [(CPSMapButton *)v5 _updateButtonImages];
  objc_storeStrong(location, 0);
}

- (void)_updateButtonImages
{
  v12 = self;
  v11[1] = (id)a2;
  id v7 = [(CPSMapButton *)self mapButton];
  v11[0] = [(CPMapButton *)v7 image];

  id v8 = [(CPSMapButton *)v12 mapButton];
  id v9 = [(CPMapButton *)v8 focusedImage];
  if (v9) {
    v2 = v9;
  }
  else {
    v2 = (UIImage *)v11[0];
  }
  objc_super v10 = v2;

  [(CPSMapButton *)v12 setImage:v11[0] forState:0];
  objc_super v4 = v12;
  objc_super v3 = v10;
  id v6 = (id)[MEMORY[0x263F1C550] _carSystemFocusColor];
  id v5 = (id)-[UIImage _flatImageWithColor:](v3, "_flatImageWithColor:");
  -[CPSMapButton setImage:forState:](v4, "setImage:forState:");

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(v11, 0);
}

- (CPMapButton)mapButton
{
  return self->_mapButton;
}

- (void)setMapButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end