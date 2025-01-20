@interface CAMExternalStorageButton
- (CAMExternalStorageButton)initWithFrame:(CGRect)a3;
- (CAMSlashMaskView)_slashMaskView;
- (CAMSlashView)_slashView;
- (id)_formattedTitleString;
- (void)_updateSlashVisibility:(BOOL)a3 animated:(BOOL)a4;
- (void)layoutSubviews;
- (void)setSelected:(BOOL)a3;
@end

@implementation CAMExternalStorageButton

- (CAMExternalStorageButton)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CAMExternalStorageButton;
  v3 = -[CAMExternalStorageButton initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] clearColor];
    [(CAMExternalStorageButton *)v3 setBackgroundColor:v4];

    v5 = [(CAMExternalStorageButton *)v3 _formattedTitleString];
    [(CAMExternalStorageButton *)v3 setAttributedTitle:v5 forState:0];

    v6 = objc_alloc_init(CAMSlashView);
    slashView = v3->__slashView;
    v3->__slashView = v6;

    v8 = [MEMORY[0x263F825C8] whiteColor];
    [(CAMSlashView *)v3->__slashView setTintColor:v8];

    [(CAMExternalStorageButton *)v3 addSubview:v3->__slashView];
    v9 = objc_alloc_init(CAMSlashMaskView);
    slashMaskView = v3->__slashMaskView;
    v3->__slashMaskView = v9;

    v11 = v3->__slashMaskView;
    v12 = [(CAMExternalStorageButton *)v3 titleLabel];
    [v12 setMaskView:v11];
  }
  return v3;
}

- (id)_formattedTitleString
{
  v11[3] = *MEMORY[0x263EF8340];
  v10[0] = *MEMORY[0x263F814F0];
  v2 = +[CAMFont cameraFontOfSize:12.0 weight:*MEMORY[0x263F81800]];
  uint64_t v3 = *MEMORY[0x263F81510];
  v11[0] = v2;
  v11[1] = &unk_26BDDF4C8;
  uint64_t v4 = *MEMORY[0x263F81500];
  v10[1] = v3;
  v10[2] = v4;
  v5 = [MEMORY[0x263F825C8] whiteColor];
  v11[2] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  v7 = CAMLocalizedFrameworkString(@"EXTERNAL_STORAGE_INDICATOR_TITLE", 0);
  v8 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v7 attributes:v6];

  return v8;
}

- (void)_updateSlashVisibility:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v8 = [(CAMExternalStorageButton *)self _slashView];
  v7 = [(CAMExternalStorageButton *)self _slashMaskView];
  [v8 bounds];
  objc_msgSend(v7, "convertRect:fromView:", v8);
  objc_msgSend(v7, "setSlashBounds:animated:", v4);
  [v8 setVisible:v5 animated:v4];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CAMExternalStorageButton *)self isSelected] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CAMExternalStorageButton;
    [(CAMExternalStorageButton *)&v5 setSelected:v3];
    [(CAMExternalStorageButton *)self _updateSlashVisibility:v3 ^ 1 animated:0];
  }
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)CAMExternalStorageButton;
  [(CAMExternalStorageButton *)&v14 layoutSubviews];
  [(CAMExternalStorageButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  UIRectGetCenter();
  v11 = [(CAMExternalStorageButton *)self _slashView];
  double v12 = fmin(v8, v10);
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  objc_msgSend(v11, "setCenter:");
  objc_msgSend(v11, "setBounds:", 0.0, 0.0, v12, v12);
  v13 = [(CAMExternalStorageButton *)self _slashMaskView];
  objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);

  [(CAMExternalStorageButton *)self _updateSlashVisibility:[(CAMExternalStorageButton *)self isSelected] ^ 1 animated:0];
}

- (CAMSlashMaskView)_slashMaskView
{
  return self->__slashMaskView;
}

- (CAMSlashView)_slashView
{
  return self->__slashView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__slashView, 0);
  objc_storeStrong((id *)&self->__slashMaskView, 0);
}

@end