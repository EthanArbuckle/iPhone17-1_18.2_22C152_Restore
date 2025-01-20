@interface MediaControlsRoutingCornerView
- (BOOL)isRouting;
- (BOOL)routesAreAvailable;
- (MediaControlsRoutingCornerView)initWithFrame:(CGRect)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)deviceType;
- (void)_updateGlyph;
- (void)setDeviceType:(int64_t)a3;
- (void)setRoutesAvailable:(BOOL)a3;
- (void)setRouting:(BOOL)a3;
@end

@implementation MediaControlsRoutingCornerView

- (MediaControlsRoutingCornerView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MediaControlsRoutingCornerView;
  v3 = -[CCUICAPackageView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MediaControlsRoutingCornerView *)v3 setUserInteractionEnabled:1];
    [(CCUICAPackageView *)v4 setStateName:&stru_1F06524E0];
    v5 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if (v6 == 1)
    {
      v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v4];
      [(MediaControlsRoutingCornerView *)v4 addInteraction:v7];
    }
  }
  return v4;
}

- (void)setRouting:(BOOL)a3
{
  if (self->_routing != a3)
  {
    self->_routing = a3;
    [(MediaControlsRoutingCornerView *)self _updateGlyph];
  }
}

- (void)setDeviceType:(int64_t)a3
{
  if (self->_deviceType == a3) {
    return;
  }
  self->_deviceType = a3;
  v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  int v6 = [v5 ccuiSupportsGroupRendering];

  if (a3 == 2)
  {
    v7 = @"VideoRoutingCorner-j71";
    v8 = @"VideoRoutingCorner";
    goto LABEL_6;
  }
  if (a3 == 1)
  {
    v7 = @"AudioRoutingCorner-j71";
    v8 = @"AudioRoutingCorner";
LABEL_6:
    if (v6) {
      v7 = v8;
    }
    objc_super v9 = v7;
    v10 = [MEMORY[0x1E4F28B50] mediaControlsBundle];
    v11 = [v10 URLForResource:v9 withExtension:@"ca"];

    v12 = [MEMORY[0x1E4F39C38] packageWithContentsOfURL:v11 type:*MEMORY[0x1E4F3A4C0] options:0 error:0];
    [(CCUICAPackageView *)self setPackage:v12];
  }

  [(MediaControlsRoutingCornerView *)self _updateGlyph];
}

- (void)setRoutesAvailable:(BOOL)a3
{
  if (self->_routesAvailable != a3)
  {
    self->_routesAvailable = a3;
    [(MediaControlsRoutingCornerView *)self _updateGlyph];
  }
}

- (void)_updateGlyph
{
  if ([(MediaControlsRoutingCornerView *)self routesAreAvailable])
  {
    if ([(MediaControlsRoutingCornerView *)self isRouting]) {
      v3 = @"connected";
    }
    else {
      v3 = @"available";
    }
  }
  else
  {
    v3 = &stru_1F06524E0;
  }

  [(CCUICAPackageView *)self setStateName:v3];
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a5;

  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
  int v6 = (void *)MEMORY[0x1E4FB14C0];
  [(MediaControlsRoutingCornerView *)self bounds];
  UIRectInset();
  v7 = objc_msgSend(v6, "bezierPathWithOvalInRect:");
  [v5 setVisiblePath:v7];

  v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self parameters:v5];
  objc_super v9 = [MEMORY[0x1E4FB1AB8] effectWithPreview:v8];
  v10 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v9 shape:0];

  return v10;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (BOOL)routesAreAvailable
{
  return self->_routesAvailable;
}

- (BOOL)isRouting
{
  return self->_routing;
}

@end