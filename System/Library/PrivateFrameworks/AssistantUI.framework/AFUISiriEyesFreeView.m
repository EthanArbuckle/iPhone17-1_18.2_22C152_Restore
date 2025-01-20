@interface AFUISiriEyesFreeView
- (AFUISiriEyesFreeView)initWithFrame:(CGRect)a3 eyesFreeMode:(int64_t)a4;
- (id)backdropView;
- (int64_t)eyesFreeMode;
- (void)_configureEyesFreePresentation:(int64_t)a3;
- (void)checkForAndReportEyesFreeLogoBug;
@end

@implementation AFUISiriEyesFreeView

- (AFUISiriEyesFreeView)initWithFrame:(CGRect)a3 eyesFreeMode:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AFUISiriEyesFreeView;
  v5 = -[AFUISiriEyesFreeView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5) {
    [(AFUISiriEyesFreeView *)v5 _configureEyesFreePresentation:a4];
  }
  return v6;
}

- (void)_configureEyesFreePresentation:(int64_t)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  self->_eyesFreeMode = a3;
  if (a3 == 1)
  {
    v4 = [(AFUISiriEyesFreeView *)self backdropView];
    backdropView = self->_backdropView;
    self->_backdropView = v4;

    v6 = self->_backdropView;
    [(AFUISiriEyesFreeView *)self bounds];
    -[SiriUIBackgroundBlurView setFrame:](v6, "setFrame:");
    [(AFUISiriEyesFreeView *)self addSubview:self->_backdropView];
    id v7 = objc_alloc(MEMORY[0x263F753E0]);
    objc_super v8 = objc_msgSend(MEMORY[0x263F82DF0], "siriui_platterVibrancyEffect");
    v9 = (SiriUIVisualEffectView *)[v7 initWithEffect:v8];
    eyesFreeEffectView = self->_eyesFreeEffectView;
    self->_eyesFreeEffectView = v9;

    v11 = [MEMORY[0x263F827E8] systemImageNamed:@"car.fill"];
    v12 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v11];
    eyesFreeLogoView = self->_eyesFreeLogoView;
    self->_eyesFreeLogoView = v12;

    [(UIImageView *)self->_eyesFreeLogoView setContentMode:1];
    [(SiriUIVisualEffectView *)self->_eyesFreeEffectView setCustomView:self->_eyesFreeLogoView];
    [(AFUISiriEyesFreeView *)self bounds];
    double Width = CGRectGetWidth(v32);
    [(AFUISiriEyesFreeView *)self bounds];
    double Height = CGRectGetHeight(v33);
    if (Width <= Height) {
      double v16 = Height;
    }
    else {
      double v16 = Width;
    }
    if (Width <= Height) {
      double v17 = Width;
    }
    else {
      double v17 = Height;
    }
    -[UIImageView setFrame:](self->_eyesFreeLogoView, "setFrame:", 0.0, 0.0, 160.0, 160.0);
    -[SiriUIVisualEffectView setFrame:](self->_eyesFreeEffectView, "setFrame:", v17 * 0.5 + -80.0, v16 * 0.44 + -160.0, 160.0, 160.0);
    [(AFUISiriEyesFreeView *)self checkForAndReportEyesFreeLogoBug];
    v18 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      [(AFUISiriEyesFreeView *)self bounds];
      v20 = NSStringFromCGRect(v34);
      [(SiriUIVisualEffectView *)self->_eyesFreeEffectView frame];
      v21 = NSStringFromCGRect(v35);
      [(UIImageView *)self->_eyesFreeLogoView frame];
      v22 = NSStringFromCGRect(v36);
      int v23 = 136315906;
      v24 = "-[AFUISiriEyesFreeView _configureEyesFreePresentation:]";
      __int16 v25 = 2112;
      v26 = v20;
      __int16 v27 = 2112;
      v28 = v21;
      __int16 v29 = 2112;
      v30 = v22;
      _os_log_impl(&dword_223099000, v19, OS_LOG_TYPE_DEFAULT, "%s 🚗📱 Logging for rdar://108858965 AFUISiriEyesFreeView bounds: %@. _eyesFreeEffectView frame: %@. _eyesFreeLogoView—frame: %@", (uint8_t *)&v23, 0x2Au);
    }
    [(AFUISiriEyesFreeView *)self insertSubview:self->_eyesFreeEffectView aboveSubview:self->_backdropView];
  }
}

- (void)checkForAndReportEyesFreeLogoBug
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[AFUISiriEyesFreeView checkForAndReportEyesFreeLogoBug]";
  _os_log_error_impl(&dword_223099000, log, OS_LOG_TYPE_ERROR, "%s 🚗📱 Error: Logging for rdar://108858965 — AFUISiriEyesFreeView width > height in EyesFree mode", (uint8_t *)&v1, 0xCu);
}

- (id)backdropView
{
  backdropView = self->_backdropView;
  if (!backdropView)
  {
    id v4 = objc_alloc(MEMORY[0x263F75390]);
    [(AFUISiriEyesFreeView *)self bounds];
    v5 = (SiriUIBackgroundBlurView *)objc_msgSend(v4, "initWithFrame:");
    v6 = self->_backdropView;
    self->_backdropView = v5;

    [(SiriUIBackgroundBlurView *)self->_backdropView setVisible:1];
    backdropView = self->_backdropView;
  }
  id v7 = backdropView;

  return v7;
}

- (int64_t)eyesFreeMode
{
  return self->_eyesFreeMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eyesFreeLogoView, 0);
  objc_storeStrong((id *)&self->_eyesFreeEffectView, 0);

  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end