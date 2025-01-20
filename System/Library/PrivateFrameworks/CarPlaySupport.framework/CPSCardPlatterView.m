@interface CPSCardPlatterView
- (CPSCardPlatterView)initWithFrame:(CGRect)a3;
- (CPSCardPlatterView)initWithFrame:(CGRect)a3 cornerRadius:(double)a4 maskedCorners:(unint64_t)a5;
- (CPSCardPlatterView)initWithFrame:(CGRect)a3 cornerRadius:(double)a4 maskedCorners:(unint64_t)a5 backgroundMaterial:(id)a6 backgroundColor:(id)a7;
- (UIVisualEffectView)material;
- (void)_updateStyleOverridesForSubviews;
- (void)didAddSubview:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setMaterial:(id)a3;
- (void)setShadowWithRadius:(double)a3 opacity:(double)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CPSCardPlatterView

- (CPSCardPlatterView)initWithFrame:(CGRect)a3 cornerRadius:(double)a4 maskedCorners:(unint64_t)a5
{
  CGRect v13 = a3;
  v12 = self;
  id v10 = (id)objc_msgSend(MEMORY[0x263F1CB98], "crsui_consoleTurnCardETATrayBackgroundMaterial");
  id v9 = (id)objc_msgSend(MEMORY[0x263F1C550], "crsui_consoleTurnCardETATrayBackgroundColor");
  v12 = 0;
  v12 = -[CPSCardPlatterView initWithFrame:cornerRadius:maskedCorners:backgroundMaterial:backgroundColor:](self, "initWithFrame:cornerRadius:maskedCorners:backgroundMaterial:backgroundColor:", a5, v10, v13.origin.x, v13.origin.y, v13.size.width, v13.size.height, a4);
  v11 = v12;

  objc_storeStrong((id *)&v12, 0);
  return v11;
}

- (CPSCardPlatterView)initWithFrame:(CGRect)a3 cornerRadius:(double)a4 maskedCorners:(unint64_t)a5 backgroundMaterial:(id)a6 backgroundColor:(id)a7
{
  CGRect v28 = a3;
  v27 = self;
  SEL v26 = a2;
  double v25 = a4;
  unint64_t v24 = a5;
  id location = 0;
  objc_storeStrong(&location, a6);
  id v22 = 0;
  objc_storeStrong(&v22, a7);
  v7 = v27;
  v27 = 0;
  v21.receiver = v7;
  v21.super_class = (Class)CPSCardPlatterView;
  v27 = -[CPSCardPlatterView initWithFrame:](&v21, sel_initWithFrame_, v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
  objc_storeStrong((id *)&v27, v27);
  if (v27)
  {
    id v16 = (id)[(CPSCardPlatterView *)v27 layer];
    [v16 setCornerRadius:v25];

    id v17 = (id)[(CPSCardPlatterView *)v27 layer];
    [v17 setCornerCurve:*MEMORY[0x263F15A20]];

    id v18 = (id)[(CPSCardPlatterView *)v27 layer];
    [v18 setMaskedCorners:v24];

    [(CPSCardPlatterView *)v27 setBackgroundColor:v22];
    [(CPSCardPlatterView *)v27 setTranslatesAutoresizingMaskIntoConstraints:0];
    if (location)
    {
      id v20 = location;
      double v14 = v25;
      id v15 = (id)[v20 layer];
      [v15 setCornerRadius:v14];

      [(CPSCardPlatterView *)v27 bounds];
      objc_msgSend(location, "setFrame:", v8, v9, v10, v11);
      [location setAutoresizingMask:18];
      objc_storeStrong((id *)&v27->_material, v20);
      [(CPSCardPlatterView *)v27 addSubview:v27->_material];
      objc_storeStrong(&v20, 0);
    }
  }
  CGRect v13 = v27;
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v27, 0);
  return v13;
}

- (CPSCardPlatterView)initWithFrame:(CGRect)a3
{
  CGRect v9 = a3;
  double v8 = self;
  id v6 = (id)objc_msgSend(MEMORY[0x263F1CB98], "crsui_consoleTurnCardETATrayBackgroundMaterial");
  id v5 = (id)objc_msgSend(MEMORY[0x263F1C550], "crsui_consoleTurnCardETATrayBackgroundColor");
  double v8 = 0;
  double v8 = -[CPSCardPlatterView initWithFrame:cornerRadius:maskedCorners:backgroundMaterial:backgroundColor:](self, "initWithFrame:cornerRadius:maskedCorners:backgroundMaterial:backgroundColor:", 15, v6, v9.origin.x, v9.origin.y, v9.size.width, v9.size.height, 10.0);
  objc_storeStrong((id *)&v8, v8);

  v7 = v8;
  objc_storeStrong((id *)&v8, 0);
  return v7;
}

- (void)setShadowWithRadius:(double)a3 opacity:(double)a4
{
  id v5 = (id)[(CPSCardPlatterView *)self layer];
  [v5 setShadowRadius:a3];

  id v6 = (id)[(CPSCardPlatterView *)self layer];
  [v6 setShadowPathIsBounds:1];

  id v7 = (id)[(CPSCardPlatterView *)self layer];
  HIDWORD(v4) = HIDWORD(a4);
  *(float *)&double v4 = a4;
  [v7 setShadowOpacity:v4];

  id v8 = (id)[(CPSCardPlatterView *)self layer];
  objc_msgSend(v8, "setShadowOffset:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
}

- (void)setBackgroundColor:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSCardPlatterView;
  [(CPSCardPlatterView *)&v3 setBackgroundColor:location[0]];
  [(CPSCardPlatterView *)v5 _updateStyleOverridesForSubviews];
  objc_storeStrong(location, 0);
}

- (void)_updateStyleOverridesForSubviews
{
  v12 = self;
  SEL v11 = a2;
  uint64_t v10 = 0;
  id v8 = (id)[(CPSCardPlatterView *)self backgroundColor];

  if (v8)
  {
    id v4 = (id)[(CPSCardPlatterView *)v12 backgroundColor];
    id v3 = (id)[(CPSCardPlatterView *)v12 traitCollection];
    id location = (id)objc_msgSend(v4, "resolvedColorWithTraitCollection:");

    uint64_t v10 = 1;
    id v6 = (id)CPContrastingColorForColor();
    id v5 = (id)[MEMORY[0x263F1C550] whiteColor];
    char v7 = objc_msgSend(v6, "isEqual:");

    if (v7) {
      uint64_t v10 = 2;
    }
    objc_storeStrong(&location, 0);
  }
  id v2 = (id)[(CPSCardPlatterView *)v12 subviews];
  objc_msgSend(v2, "enumerateObjectsUsingBlock:");
}

void __54__CPSCardPlatterView__updateStyleOverridesForSubviews__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [location[0] setOverrideUserInterfaceStyle:a1[4]];
  objc_storeStrong(location, 0);
}

- (void)didAddSubview:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSCardPlatterView;
  [(CPSCardPlatterView *)&v3 didAddSubview:location[0]];
  [(CPSCardPlatterView *)v5 _updateStyleOverridesForSubviews];
  objc_storeStrong(location, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSCardPlatterView;
  [(CPSCardPlatterView *)&v3 traitCollectionDidChange:location[0]];
  [(CPSCardPlatterView *)v5 _updateStyleOverridesForSubviews];
  objc_storeStrong(location, 0);
}

- (UIVisualEffectView)material
{
  return self->_material;
}

- (void)setMaterial:(id)a3
{
}

- (void).cxx_destruct
{
}

@end