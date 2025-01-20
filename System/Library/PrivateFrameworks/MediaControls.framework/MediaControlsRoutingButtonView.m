@interface MediaControlsRoutingButtonView
- (BOOL)isUserInterfaceStyleSwitchingEnabled;
- (CCUICAPackageView)packageView;
- (MediaControlsRoutingButtonView)initWithFrame:(CGRect)a3;
- (id)_glyphResource;
- (int64_t)currentMode;
- (int64_t)deviceType;
- (void)_updateGlyphPackage;
- (void)_updateGlyphState;
- (void)layoutSubviews;
- (void)setAlpha:(double)a3;
- (void)setCurrentMode:(int64_t)a3;
- (void)setDeviceType:(int64_t)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setPackageView:(id)a3;
- (void)setUserInterfaceStyleSwitchingEnabled:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MediaControlsRoutingButtonView

- (MediaControlsRoutingButtonView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)MediaControlsRoutingButtonView;
  v7 = -[MPButton initWithFrame:](&v11, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F5ADE0]), "initWithFrame:", x, y, width, height);
    packageView = v7->_packageView;
    v7->_packageView = (CCUICAPackageView *)v8;

    [(CCUICAPackageView *)v7->_packageView setUserInteractionEnabled:0];
    [(MediaControlsRoutingButtonView *)v7 addSubview:v7->_packageView];
    [(MediaControlsRoutingButtonView *)v7 setPointerInteractionEnabled:1];
    [(MediaControlsRoutingButtonView *)v7 setPointerStyleProvider:&__block_literal_global_14];
  }
  return v7;
}

id __48__MediaControlsRoutingButtonView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4FB1B28];
  id v3 = a2;
  id v4 = objc_alloc_init(v2);
  v5 = (void *)MEMORY[0x1E4FB14C0];
  [v3 bounds];
  v6 = objc_msgSend(v5, "bezierPathWithOvalInRect:");
  [v4 setVisiblePath:v6];

  v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v3 parameters:v4];
  uint64_t v8 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v7];
  v9 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v8 shape:0];

  return v9;
}

- (void)setAlpha:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MediaControlsRoutingButtonView;
  -[MediaControlsRoutingButtonView setAlpha:](&v6, sel_setAlpha_);
  v5 = [(MediaControlsRoutingButtonView *)self packageView];
  [v5 setAlpha:a3];

  [(MediaControlsRoutingButtonView *)self _updateGlyphState];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)MediaControlsRoutingButtonView;
  [(MPButton *)&v13 layoutSubviews];
  id v3 = [(MediaControlsRoutingButtonView *)self packageView];
  [v3 frame];
  [(MediaControlsRoutingButtonView *)self bounds];
  UIRectCenteredIntegralRect();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(MediaControlsRoutingButtonView *)self packageView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)setCurrentMode:(int64_t)a3
{
  if (self->_currentMode != a3)
  {
    self->_currentMode = a3;
    [(MediaControlsRoutingButtonView *)self _updateGlyphState];
  }
}

- (void)setDeviceType:(int64_t)a3
{
  if (self->_deviceType != a3)
  {
    self->_deviceType = a3;
    [(MediaControlsRoutingButtonView *)self _updateGlyphPackage];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MediaControlsRoutingButtonView;
  -[MediaControlsRoutingButtonView setHighlighted:](&v8, sel_setHighlighted_);
  double v5 = 0.47;
  v6[1] = 3221225472;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[2] = __49__MediaControlsRoutingButtonView_setHighlighted___block_invoke;
  v6[3] = &unk_1E5F0D8C0;
  if (v3) {
    double v5 = 0.0;
  }
  v6[4] = self;
  BOOL v7 = v3;
  objc_msgSend(MEMORY[0x1E4FB1EB0], "animateWithDuration:delay:options:animations:completion:", 327684, v6, 0, v5);
}

void __49__MediaControlsRoutingButtonView_setHighlighted___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 0.2;
  }
  else {
    double v1 = 1.0;
  }
  id v2 = [*(id *)(a1 + 32) packageView];
  [v2 setAlpha:v1];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  double v5 = [(MediaControlsRoutingButtonView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    [(MediaControlsRoutingButtonView *)self _updateGlyphPackage];
  }
}

- (id)_glyphResource
{
  BOOL v3 = [(MediaControlsRoutingButtonView *)self traitCollection];
  BOOL v4 = [v3 userInterfaceStyle] == 2 || !self->_userInterfaceStyleSwitchingEnabled;

  int64_t deviceType = self->_deviceType;
  if (deviceType == 2)
  {
    uint64_t v6 = @"VideoRoutingControl-Light";
    uint64_t v7 = @"VideoRoutingControl-Dark";
  }
  else
  {
    if (deviceType != 1)
    {
      objc_super v8 = 0;
      goto LABEL_12;
    }
    uint64_t v6 = @"AudioRoutingControl-Light";
    uint64_t v7 = @"AudioRoutingControl-Dark";
  }
  if (v4) {
    uint64_t v6 = v7;
  }
  objc_super v8 = v6;
LABEL_12:

  return v8;
}

- (void)_updateGlyphPackage
{
  id v6 = [(MediaControlsRoutingButtonView *)self _glyphResource];
  if (v6)
  {
    BOOL v3 = [MEMORY[0x1E4F28B50] mediaControlsBundle];
    BOOL v4 = [v3 URLForResource:v6 withExtension:@"ca"];

    double v5 = [MEMORY[0x1E4F39C38] packageWithContentsOfURL:v4 type:*MEMORY[0x1E4F3A4C0] options:0 error:0];
    [(CCUICAPackageView *)self->_packageView setPackage:v5];

    [(MediaControlsRoutingButtonView *)self _updateGlyphState];
  }
  [(MediaControlsRoutingButtonView *)self setNeedsLayout];
}

- (void)_updateGlyphState
{
  int64_t v3 = [(MediaControlsRoutingButtonView *)self currentMode];
  if (v3 == 2)
  {
    BOOL v4 = [(MediaControlsRoutingButtonView *)self packageView];
    double v5 = @"playpause";
  }
  else if (v3 == 1)
  {
    BOOL v4 = [(MediaControlsRoutingButtonView *)self packageView];
    double v5 = @"active";
  }
  else
  {
    if (v3) {
      return;
    }
    BOOL v4 = [(MediaControlsRoutingButtonView *)self packageView];
    double v5 = @"null";
  }
  id v6 = v4;
  [v4 setStateName:v5];
}

- (int64_t)currentMode
{
  return self->_currentMode;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (BOOL)isUserInterfaceStyleSwitchingEnabled
{
  return self->_userInterfaceStyleSwitchingEnabled;
}

- (void)setUserInterfaceStyleSwitchingEnabled:(BOOL)a3
{
  self->_userInterfaceStyleSwitchingEnabled = a3;
}

- (CCUICAPackageView)packageView
{
  return self->_packageView;
}

- (void)setPackageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end