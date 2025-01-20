@interface _DBStatusBarCloseView
- (UIView)backgroundView;
- (_DBStatusBarCloseView)initWithFrame:(CGRect)a3;
- (void)_traitEnvironmentDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)setBackgroundView:(id)a3;
@end

@implementation _DBStatusBarCloseView

- (_DBStatusBarCloseView)initWithFrame:(CGRect)a3
{
  v43[6] = *MEMORY[0x263EF8340];
  v41.receiver = self;
  v41.super_class = (Class)_DBStatusBarCloseView;
  v3 = -[_DBStatusBarCloseView initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(_DBStatusBarCloseView *)v3 setUserInteractionEnabled:0];
    v5 = [(_DBStatusBarCloseView *)v4 layer];
    [v5 setAllowsGroupBlending:0];

    id v6 = objc_alloc_init(MEMORY[0x263F82E00]);
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [MEMORY[0x263F825C8] labelColor];
    v8 = [v7 colorWithAlphaComponent:0.15];
    [v6 setBackgroundColor:v8];

    v9 = [v6 layer];
    [v9 setCornerRadius:11.0];

    uint64_t v10 = *MEMORY[0x263F15D58];
    v11 = [v6 layer];
    [v11 setCompositingFilter:v10];

    [(_DBStatusBarCloseView *)v4 addSubview:v6];
    objc_storeStrong((id *)&v4->_backgroundView, v6);
    v40 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F835B8] weight:*MEMORY[0x263F81840]];
    v39 = [MEMORY[0x263F82818] configurationWithFont:v40 scale:1];
    v38 = [MEMORY[0x263F827E8] systemImageNamed:@"xmark" withConfiguration:v39];
    v12 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v38];
    v13 = [MEMORY[0x263F825C8] labelColor];
    [v12 setTintColor:v13];

    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_DBStatusBarCloseView *)v4 addSubview:v12];
    v28 = (void *)MEMORY[0x263F08938];
    v37 = [v6 leadingAnchor];
    v36 = [(_DBStatusBarCloseView *)v4 leadingAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v43[0] = v35;
    v34 = [v6 trailingAnchor];
    v33 = [(_DBStatusBarCloseView *)v4 trailingAnchor];
    v31 = [v34 constraintEqualToAnchor:v33];
    v43[1] = v31;
    v30 = [v6 topAnchor];
    v29 = [(_DBStatusBarCloseView *)v4 topAnchor];
    v27 = [v30 constraintEqualToAnchor:v29];
    v43[2] = v27;
    v26 = [v6 bottomAnchor];
    v25 = [(_DBStatusBarCloseView *)v4 bottomAnchor];
    v14 = [v26 constraintEqualToAnchor:v25];
    v43[3] = v14;
    v32 = v12;
    v15 = [v12 centerXAnchor];
    v16 = [(_DBStatusBarCloseView *)v4 centerXAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    v43[4] = v17;
    v18 = [v12 centerYAnchor];
    v19 = [(_DBStatusBarCloseView *)v4 centerYAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v43[5] = v20;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:6];
    [v28 activateConstraints:v21];

    uint64_t v42 = objc_opt_class();
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:1];
    id v23 = (id)[(_DBStatusBarCloseView *)v4 registerForTraitChanges:v22 withTarget:v4 action:sel__traitEnvironmentDidChange_previousTraitCollection_];
  }
  return v4;
}

- (void)_traitEnvironmentDidChange:(id)a3 previousTraitCollection:(id)a4
{
  v5 = [(_DBStatusBarCloseView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];

  v7 = (uint64_t *)MEMORY[0x263F15D58];
  if (v6 != 2) {
    v7 = (uint64_t *)MEMORY[0x263F15D50];
  }
  uint64_t v8 = *v7;
  id v10 = [(_DBStatusBarCloseView *)self backgroundView];
  v9 = [v10 layer];
  [v9 setCompositingFilter:v8];
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