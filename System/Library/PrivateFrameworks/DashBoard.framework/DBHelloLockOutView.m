@interface DBHelloLockOutView
- (DBEnvironmentConfiguration)environmentConfiguration;
- (DBHelloLockOutView)initWithMode:(int64_t)a3 environmentConfiguration:(id)a4;
- (DBHelloLockOutView)initWithMode:(int64_t)a3 environmentConfiguration:(id)a4 wallpaperView:(id)a5;
- (DBHelloView)helloView;
- (UIView)wallpaperView;
- (void)_handleFinishedAnimating;
- (void)didMoveToWindow;
- (void)setEnvironmentConfiguration:(id)a3;
- (void)setHelloView:(id)a3;
- (void)setWallpaperView:(id)a3;
@end

@implementation DBHelloLockOutView

- (DBHelloLockOutView)initWithMode:(int64_t)a3 environmentConfiguration:(id)a4 wallpaperView:(id)a5
{
  v50[4] = *MEMORY[0x263EF8340];
  id v9 = a5;
  v47.receiver = self;
  v47.super_class = (Class)DBHelloLockOutView;
  v10 = [(DBLockOutView *)&v47 initWithMode:a3 environmentConfiguration:a4];
  v11 = v10;
  if (v10)
  {
    p_wallpaperView = (id *)&v10->_wallpaperView;
    objc_storeStrong((id *)&v10->_wallpaperView, a5);
    [*p_wallpaperView setTranslatesAutoresizingMaskIntoConstraints:0];
    [*p_wallpaperView setUserInteractionEnabled:0];
    [(DBHelloLockOutView *)v11 addSubview:*p_wallpaperView];
    v44 = [*p_wallpaperView leadingAnchor];
    v42 = [(DBHelloLockOutView *)v11 leadingAnchor];
    v40 = [v44 constraintEqualToAnchor:v42];
    v50[0] = v40;
    v38 = [*p_wallpaperView trailingAnchor];
    v36 = [(DBHelloLockOutView *)v11 trailingAnchor];
    v13 = [v38 constraintEqualToAnchor:v36];
    v50[1] = v13;
    v14 = [*p_wallpaperView topAnchor];
    v15 = [(DBHelloLockOutView *)v11 topAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v50[2] = v16;
    [*p_wallpaperView bottomAnchor];
    v17 = id v46 = v9;
    v18 = [(DBHelloLockOutView *)v11 bottomAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v50[3] = v19;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:4];
    [(DBHelloLockOutView *)v11 addConstraints:v20];

    v21 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BC8]];
    [v21 setName:@"gaussianBlur"];
    [v21 setValue:&unk_26E17F050 forKey:@"inputRadius"];
    uint64_t v22 = MEMORY[0x263EFFA88];
    [v21 setValue:MEMORY[0x263EFFA88] forKey:@"inputHardEdges"];
    [v21 setValue:v22 forKey:@"inputNormalizeEdges"];
    [v21 setValue:v22 forKey:@"inputDither"];
    v23 = [*p_wallpaperView layer];
    v49 = v21;
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v49 count:1];
    [v23 setFilters:v24];

    v25 = objc_alloc_init(DBHelloView);
    helloView = v11->_helloView;
    v11->_helloView = v25;

    [(DBHelloView *)v11->_helloView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(DBHelloView *)v11->_helloView setUserInteractionEnabled:0];
    [(DBHelloLockOutView *)v11 addSubview:v11->_helloView];
    v45 = [(DBHelloView *)v11->_helloView leadingAnchor];
    v43 = [(DBHelloLockOutView *)v11 leadingAnchor];
    v41 = [v45 constraintEqualToAnchor:v43];
    v48[0] = v41;
    v39 = [(DBHelloView *)v11->_helloView trailingAnchor];
    v37 = [(DBHelloLockOutView *)v11 trailingAnchor];
    v27 = [v39 constraintEqualToAnchor:v37];
    v48[1] = v27;
    v28 = [(DBHelloView *)v11->_helloView topAnchor];
    v29 = [(DBHelloLockOutView *)v11 topAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    v48[2] = v30;
    v31 = [(DBHelloView *)v11->_helloView bottomAnchor];
    v32 = [(DBHelloLockOutView *)v11 bottomAnchor];
    v33 = [v31 constraintEqualToAnchor:v32];
    v48[3] = v33;
    v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:4];
    [(DBHelloLockOutView *)v11 addConstraints:v34];

    id v9 = v46;
  }

  return v11;
}

- (DBHelloLockOutView)initWithMode:(int64_t)a3 environmentConfiguration:(id)a4
{
  v6 = (objc_class *)MEMORY[0x263F82E00];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  id v9 = [(DBHelloLockOutView *)self initWithMode:a3 environmentConfiguration:v7 wallpaperView:v8];

  return v9;
}

- (void)didMoveToWindow
{
  v9.receiver = self;
  v9.super_class = (Class)DBHelloLockOutView;
  [(DBHelloLockOutView *)&v9 didMoveToWindow];
  v3 = [(DBHelloLockOutView *)self window];

  if (v3)
  {
    objc_initWeak(&location, self);
    v4 = [(DBHelloLockOutView *)self helloView];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __37__DBHelloLockOutView_didMoveToWindow__block_invoke;
    v6[3] = &unk_2649B4548;
    objc_copyWeak(&v7, &location);
    [v4 startAnimatingWithCompletion:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    v5 = [(DBHelloLockOutView *)self helloView];
    [v5 stopAnimating];
  }
}

void __37__DBHelloLockOutView_didMoveToWindow__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleFinishedAnimating];
}

- (void)_handleFinishedAnimating
{
  uint64_t v3 = [(DBLockOutView *)self delegate];
  if (v3)
  {
    v4 = (void *)v3;
    if (objc_opt_respondsToSelector()) {
      [v4 lockOutViewWantsToDismiss:self];
    }
  }
  MEMORY[0x270F9A790]();
}

- (DBEnvironmentConfiguration)environmentConfiguration
{
  return self->_environmentConfiguration;
}

- (void)setEnvironmentConfiguration:(id)a3
{
}

- (DBHelloView)helloView
{
  return self->_helloView;
}

- (void)setHelloView:(id)a3
{
}

- (UIView)wallpaperView
{
  return self->_wallpaperView;
}

- (void)setWallpaperView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperView, 0);
  objc_storeStrong((id *)&self->_helloView, 0);
  objc_storeStrong((id *)&self->_environmentConfiguration, 0);
}

@end