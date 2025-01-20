@interface CPSPagingControlButton
- (CPSPagingControlButton)initWithFrame:(CGRect)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
@end

@implementation CPSPagingControlButton

- (CPSPagingControlButton)initWithFrame:(CGRect)a3
{
  CGRect v10 = a3;
  SEL v8 = a2;
  v9 = 0;
  v7.receiver = self;
  v7.super_class = (Class)CPSPagingControlButton;
  v9 = -[CPSPagingControlButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    id v5 = (id)[(CPSPagingControlButton *)v9 layer];
    [v5 setCornerCurve:*MEMORY[0x263F15A20]];

    id v6 = (id)[(CPSPagingControlButton *)v9 layer];
    [v6 setCornerRadius:2.0];
  }
  v4 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v4;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  v4 = (CPSPagingControlButton *)(id)[location[0] nextFocusedItem];
  BOOL v10 = v4 != v13;

  if (v10)
  {
    -[CPSPagingControlButton setTintColor:](v13, "setTintColor:");
    [(CPSPagingControlButton *)v13 setBackgroundColor:0];
  }
  else
  {
    id v5 = v13;
    id v6 = (id)[MEMORY[0x263F1C550] _carSystemFocusColor];
    -[CPSPagingControlButton setBackgroundColor:](v5, "setBackgroundColor:");

    objc_super v7 = v13;
    id v8 = (id)[MEMORY[0x263F1C550] _carSystemFocusLabelColor];
    -[CPSPagingControlButton setTintColor:](v7, "setTintColor:");
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

@end