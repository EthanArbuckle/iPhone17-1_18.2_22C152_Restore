@interface CPSPanButton
- (CPSPanButton)initWithDirection:(int64_t)a3;
- (UIView)backgroundView;
- (int64_t)direction;
- (void)_setupPanImages;
- (void)_updateColors;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setBackgroundView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CPSPanButton

- (CPSPanButton)initWithDirection:(int64_t)a3
{
  v27[4] = *MEMORY[0x263EF8340];
  SEL v25 = a2;
  int64_t v24 = a3;
  v26 = 0;
  v23.receiver = self;
  v23.super_class = (Class)CPSPanButton;
  v26 = -[CPSPanButton initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  objc_storeStrong((id *)&v26, v26);
  if (v26)
  {
    v26->_direction = v24;
    [(CPSPanButton *)v26 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v22 = objc_alloc_init(MEMORY[0x263F1CB60]);
    [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v5 = (id)[v22 layer];
    [v5 setCornerRadius:14.0];

    [(CPSPanButton *)v26 addSubview:v22];
    objc_storeStrong((id *)&v26->_backgroundView, v22);
    v6 = (void *)MEMORY[0x263F08938];
    id v19 = (id)[v22 topAnchor];
    id v18 = (id)[(CPSPanButton *)v26 topAnchor];
    id v17 = (id)objc_msgSend(v19, "constraintEqualToAnchor:");
    v27[0] = v17;
    id v16 = (id)[v22 bottomAnchor];
    id v15 = (id)[(CPSPanButton *)v26 bottomAnchor];
    id v14 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
    v27[1] = v14;
    id v13 = (id)[v22 leftAnchor];
    id v12 = (id)[(CPSPanButton *)v26 leftAnchor];
    id v11 = (id)objc_msgSend(v13, "constraintEqualToAnchor:");
    v27[2] = v11;
    id v10 = (id)[v22 rightAnchor];
    id v9 = (id)[(CPSPanButton *)v26 rightAnchor];
    id v8 = (id)objc_msgSend(v10, "constraintEqualToAnchor:");
    v27[3] = v8;
    id v7 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
    objc_msgSend(v6, "activateConstraints:");

    [(CPSPanButton *)v26 _setupPanImages];
    [(CPSPanButton *)v26 _updateColors];
    id v21 = +[CPSEntityStyles mapButtonDropShadow];
    id v20 = (id)[(CPSPanButton *)v26 layer];
    objc_msgSend(v21, "applyShadowToLayer:");

    objc_storeStrong(&v22, 0);
  }
  v4 = v26;
  objc_storeStrong((id *)&v26, 0);
  return v4;
}

- (void)layoutSubviews
{
  v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CPSPanButton;
  [(CPSPanButton *)&v4 layoutSubviews];
  v2 = v6;
  v3 = [(CPSPanButton *)v6 backgroundView];
  -[CPSPanButton insertSubview:atIndex:](v2, "insertSubview:atIndex:");
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)CPSPanButton;
  [(CPSPanButton *)&v5 didUpdateFocusInContext:location[0] withAnimationCoordinator:v6];
  [(CPSPanButton *)v8 _updateColors];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSPanButton;
  [(CPSPanButton *)&v3 traitCollectionDidChange:location[0]];
  [(CPSPanButton *)v5 _setupPanImages];
  [(CPSPanButton *)v5 _updateColors];
  objc_storeStrong(location, 0);
}

- (void)_updateColors
{
  if ([(CPSPanButton *)self isFocused])
  {
    id v6 = [(CPSPanButton *)self backgroundView];
    id v5 = (id)[MEMORY[0x263F1C550] _carSystemFocusColor];
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:");

    id v7 = +[CPSEntityStyles mapButtonBackgroundColor];
    -[CPSPanButton setTintColor:](self, "setTintColor:");
  }
  else
  {
    objc_super v3 = [(CPSPanButton *)self backgroundView];
    id v2 = +[CPSEntityStyles mapButtonBackgroundColor];
    -[UIView setBackgroundColor:](v3, "setBackgroundColor:");

    id v4 = (id)[MEMORY[0x263F1C550] _carSystemFocusColor];
    -[CPSPanButton setTintColor:](self, "setTintColor:");
  }
}

- (void)_setupPanImages
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = @"circle.fill";
  uint64_t v2 = [(CPSPanButton *)v13 direction];
  if (v2)
  {
    uint64_t v4 = v2;
    char v3 = 1;
  }
  else
  {
    uint64_t v4 = 0;
    char v3 = 0;
  }
  if ((v3 & 1) == 0)
  {
    switch(v4)
    {
      case 0:
      case 3:
      case 5:
      case 6:
      case 7:
        break;
      case 1:
        objc_storeStrong(location, @"arrow.left");
        break;
      case 2:
        objc_storeStrong(location, @"arrow.right");
        break;
      case 4:
        objc_storeStrong(location, @"arrow.up");
        break;
      case 8:
        objc_storeStrong(location, @"arrow.down");
        break;
      default:
        JUMPOUT(0);
    }
  }
  id v11 = (id)[MEMORY[0x263F1C6C8] configurationWithTextStyle:*MEMORY[0x263F1D2A0] scale:-1];
  id v8 = (void *)MEMORY[0x263F1C6B0];
  id v7 = location[0];
  id v9 = (id)[(CPSPanButton *)v13 traitCollection];
  id v10 = (id)objc_msgSend(v8, "systemImageNamed:compatibleWithTraitCollection:", v7);

  id v5 = (id)[v10 imageWithConfiguration:v11];
  id v6 = v10;
  id v10 = v5;

  [(CPSPanButton *)v13 setImage:v10 forState:0];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (int64_t)direction
{
  return self->_direction;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end