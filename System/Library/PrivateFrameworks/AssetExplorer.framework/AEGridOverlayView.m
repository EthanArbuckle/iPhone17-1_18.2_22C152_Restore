@interface AEGridOverlayView
+ (id)cloudBadge;
+ (id)gradientShadow;
+ (id)gridOverlayLayoutInfo;
+ (id)loopBadge;
+ (id)videoBadge;
- (AEGridOverlayConfiguration)overlayConfiguration;
- (AEGridOverlayView)init;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)_cloudRect;
- (CGRect)_loopRect;
- (CGRect)_videoRect;
- (void)_setOverlayConfiguration:(id)a3;
- (void)becomeReusable;
- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4;
- (void)drawRect:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation AEGridOverlayView

- (void).cxx_destruct
{
}

- (void)_setOverlayConfiguration:(id)a3
{
}

- (AEGridOverlayConfiguration)overlayConfiguration
{
  return self->_overlayConfiguration;
}

- (void)prepareForReuse
{
}

- (void)becomeReusable
{
  [(AEGridOverlayView *)self _setOverlayConfiguration:0];
  [(AEGridOverlayView *)self setHidden:1];
}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  [(AEGridOverlayView *)self _setOverlayConfiguration:a4];
  [(AEGridOverlayView *)self setNeedsDisplay];
}

- (CGRect)_loopRect
{
  [(AEGridOverlayView *)self bounds];
  double v3 = v2 + 8.0;
  double v6 = v4 + v5 + -15.0 + -8.0;
  double v7 = 19.0;
  double v8 = 15.0;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v3;
  return result;
}

- (CGRect)_videoRect
{
  [(AEGridOverlayView *)self bounds];
  double v3 = v2 + 8.0;
  double v6 = v4 + v5 + -12.0 + -8.0;
  double v7 = 20.0;
  double v8 = 12.0;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v3;
  return result;
}

- (CGRect)_cloudRect
{
  [(AEGridOverlayView *)self bounds];
  double v4 = v2 + v3 + -24.0 + -6.0;
  double v7 = v5 + v6 + -15.0 + -8.0;
  double v8 = 24.0;
  double v9 = 15.0;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v4;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  id v10 = [(AEGridOverlayView *)self overlayConfiguration];
  int v4 = [v10 showCloudDecoration];
  int v5 = [v10 showVideoDecoration];
  int v6 = [v10 showLoopDecoration];
  if (v4)
  {
    double v8 = [(id)objc_opt_class() cloudBadge];
    [(AEGridOverlayView *)self _cloudRect];
    objc_msgSend(v8, "drawInRect:");

    if (!v5)
    {
LABEL_3:
      if (!v6) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if (!v5)
  {
    goto LABEL_3;
  }
  double v9 = [(id)objc_opt_class() videoBadge];
  [(AEGridOverlayView *)self _videoRect];
  objc_msgSend(v9, "drawInRect:");

  if (v6)
  {
LABEL_4:
    double v7 = [(id)objc_opt_class() loopBadge];
    [(AEGridOverlayView *)self _loopRect];
    objc_msgSend(v7, "drawInRect:");
  }
LABEL_5:
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (AEGridOverlayView)init
{
  v6.receiver = self;
  v6.super_class = (Class)AEGridOverlayView;
  double v2 = [(AEGridOverlayView *)&v6 init];
  if (v2)
  {
    double v3 = [(id)objc_opt_class() gradientShadow];
    int v4 = [MEMORY[0x263F825C8] colorWithPatternImage:v3];
    [(AEGridOverlayView *)v2 setBackgroundColor:v4];
  }
  return v2;
}

+ (id)loopBadge
{
  if (loopBadge_onceToken != -1) {
    dispatch_once(&loopBadge_onceToken, &__block_literal_global_237);
  }
  double v2 = (void *)loopBadge_loopBadge;
  return v2;
}

void __30__AEGridOverlayView_loopBadge__block_invoke()
{
  v0 = (void *)MEMORY[0x263F827E8];
  AssetExplorerBundle();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 imageNamed:@"Loop_badge" inBundle:v3];
  double v2 = (void *)loopBadge_loopBadge;
  loopBadge_loopBadge = v1;
}

+ (id)videoBadge
{
  if (videoBadge_onceToken != -1) {
    dispatch_once(&videoBadge_onceToken, &__block_literal_global_232);
  }
  double v2 = (void *)videoBadge_videoBadge;
  return v2;
}

void __31__AEGridOverlayView_videoBadge__block_invoke()
{
  v0 = (void *)MEMORY[0x263F827E8];
  AssetExplorerBundle();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 imageNamed:@"Video_badge" inBundle:v3];
  double v2 = (void *)videoBadge_videoBadge;
  videoBadge_videoBadge = v1;
}

+ (id)cloudBadge
{
  if (cloudBadge_onceToken != -1) {
    dispatch_once(&cloudBadge_onceToken, &__block_literal_global_227);
  }
  double v2 = (void *)cloudBadge_cloudBadge;
  return v2;
}

void __31__AEGridOverlayView_cloudBadge__block_invoke()
{
  v0 = (void *)MEMORY[0x263F827E8];
  AssetExplorerBundle();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 imageNamed:@"Cloud_badge" inBundle:v3];
  double v2 = (void *)cloudBadge_cloudBadge;
  cloudBadge_cloudBadge = v1;
}

+ (id)gradientShadow
{
  if (gradientShadow_onceToken != -1) {
    dispatch_once(&gradientShadow_onceToken, &__block_literal_global_480);
  }
  double v2 = (void *)gradientShadow_gradientShadow;
  return v2;
}

void __35__AEGridOverlayView_gradientShadow__block_invoke()
{
  v0 = (void *)MEMORY[0x263F827E8];
  AssetExplorerBundle();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 imageNamed:@"Gradient_shadow" inBundle:v3];
  double v2 = (void *)gradientShadow_gradientShadow;
  gradientShadow_gradientShadow = v1;
}

+ (id)gridOverlayLayoutInfo
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__AEGridOverlayView_gridOverlayLayoutInfo__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (gridOverlayLayoutInfo_onceToken != -1) {
    dispatch_once(&gridOverlayLayoutInfo_onceToken, block);
  }
  double v2 = (void *)gridOverlayLayoutInfo_gridOverlayLayoutInfo;
  return v2;
}

void __42__AEGridOverlayView_gridOverlayLayoutInfo__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) gradientShadow];
  [v5 size];
  id v3 = -[AEGridOverlayLayoutInfo initWithGradientImageSize:]([AEGridOverlayLayoutInfo alloc], "initWithGradientImageSize:", v1, v2);
  int v4 = (void *)gridOverlayLayoutInfo_gridOverlayLayoutInfo;
  gridOverlayLayoutInfo_gridOverlayLayoutInfo = (uint64_t)v3;
}

@end