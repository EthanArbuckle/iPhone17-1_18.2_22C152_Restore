@interface ABLoadingSplashView
+ (id)assistantSplashView;
+ (id)settingsSplashView;
- (ABLoadingSplashView)initWithAssistantMode:(BOOL)a3;
- (void)layoutSubviews;
@end

@implementation ABLoadingSplashView

+ (id)settingsSplashView
{
  v0 = (void *)[objc_alloc((Class)self) initWithAssistantMode:0];

  return v0;
}

+ (id)assistantSplashView
{
  v0 = (void *)[objc_alloc((Class)self) initWithAssistantMode:1];

  return v0;
}

- (ABLoadingSplashView)initWithAssistantMode:(BOOL)a3
{
  BOOL v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ABLoadingSplashView;
  v4 = -[ABLoadingSplashView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v4)
  {
    v5 = ABSnapshotImageName(v3);
    v6 = (void *)MEMORY[0x263F1C6B0];
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = [v6 imageNamed:v5 inBundle:v7 withConfiguration:0];

    if (!v8)
    {
      v9 = ABLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ABLoadingSplashView initWithAssistantMode:]((uint64_t)v5, v9);
      }
    }
    uint64_t v10 = [objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v8];
    imageView = v4->_imageView;
    v4->_imageView = (UIImageView *)v10;

    [(ABLoadingSplashView *)v4 addSubview:v4->_imageView];
  }
  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ABLoadingSplashView;
  [(ABLoadingSplashView *)&v3 layoutSubviews];
  [(ABLoadingSplashView *)self bounds];
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
}

- (void).cxx_destruct
{
}

- (void)initWithAssistantMode:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_24741F000, a2, OS_LOG_TYPE_ERROR, "Failed to load snapshot image for name: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end