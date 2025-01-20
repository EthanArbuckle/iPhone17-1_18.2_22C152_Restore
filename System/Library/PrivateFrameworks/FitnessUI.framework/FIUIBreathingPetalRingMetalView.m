@interface FIUIBreathingPetalRingMetalView
- (BOOL)showBlurTrails;
- (CGPoint)ringCenter;
- (FIUIBreathingPetalRingMetalRenderer)renderer;
- (FIUIBreathingPetalRingMetalView)initWithFrame:(CGRect)a3 numberOfPetals:(int64_t)a4 showBlurTrails:(BOOL)a5 device:(id)a6;
- (FIUIBreathingPetalRingMetalView)initWithFrame:(CGRect)a3 petalColor:(int64_t)a4 numberOfPetals:(int64_t)a5 showBlurTrails:(BOOL)a6 device:(id)a7;
- (FIUIDeepBreathingPetalRingViewDelegate)petalRingDelegate;
- (MTKView)mtkView;
- (float)preferredFramesPerSecond;
- (float)ringRadius;
- (int64_t)numberOfPetals;
- (int64_t)numberOfVisiblePetals;
- (void)importDataFromPetalRing:(id)a3;
- (void)layoutSubviews;
- (void)setBlurTrailAtIndex:(int64_t)a3 center:(CGPoint)a4 radius:(float)a5 blurriness:(float)a6 alpha:(float)a7;
- (void)setGradientRotationAngle:(float)a3;
- (void)setMtkView:(id)a3;
- (void)setNumberOfVisiblePetals:(int64_t)a3 showBlurTrails:(BOOL)a4;
- (void)setPetalAtIndex:(int64_t)a3 center:(CGPoint)a4 radius:(float)a5 alpha:(float)a6;
- (void)setPetalRingDelegate:(id)a3;
- (void)setPreferredFramesPerSecond:(float)a3;
- (void)setRenderer:(id)a3;
- (void)setRingCenter:(CGPoint)a3;
- (void)setRingRadius:(float)a3;
@end

@implementation FIUIBreathingPetalRingMetalView

- (FIUIBreathingPetalRingMetalView)initWithFrame:(CGRect)a3 numberOfPetals:(int64_t)a4 showBlurTrails:(BOOL)a5 device:(id)a6
{
  return -[FIUIBreathingPetalRingMetalView initWithFrame:petalColor:numberOfPetals:showBlurTrails:device:](self, "initWithFrame:petalColor:numberOfPetals:showBlurTrails:device:", 0, a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (FIUIBreathingPetalRingMetalView)initWithFrame:(CGRect)a3 petalColor:(int64_t)a4 numberOfPetals:(int64_t)a5 showBlurTrails:(BOOL)a6 device:(id)a7
{
  BOOL v7 = a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = a7;
  v32.receiver = self;
  v32.super_class = (Class)FIUIBreathingPetalRingMetalView;
  v16 = -[FIUIBreathingPetalRingMetalView initWithFrame:](&v32, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    [(FIUIBreathingPetalRingMetalView *)v16 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(FIUIBreathingPetalRingMetalView *)v17 setAutoresizingMask:18];
    [(FIUIBreathingPetalRingMetalView *)v17 setAutoresizesSubviews:1];
    v17->_numberOfPetals = a5;
    v17->_showBlurTrails = v7;
    if (v15) {
      id v18 = v15;
    }
    else {
      id v18 = MTLCreateSystemDefaultDevice();
    }
    v19 = v18;
    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x263F12D90]), "initWithFrame:device:", v18, x, y, width, height);
    mtkView = v17->_mtkView;
    v17->_mtkView = (MTKView *)v20;

    v22 = [MEMORY[0x263F825C8] clearColor];
    [(MTKView *)v17->_mtkView setBackgroundColor:v22];

    [(MTKView *)v17->_mtkView setFramebufferOnly:1];
    v23 = [[FIUIBreathingPetalRingMetalRenderer alloc] initWithMetalKitView:v17->_mtkView petalColor:a4 numberOfPetals:a5 showBlurTrails:v7];
    renderer = v17->_renderer;
    v17->_renderer = v23;

    [(MTKView *)v17->_mtkView setDelegate:v17->_renderer];
    objc_initWeak(&location, v17);
    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    v28 = __97__FIUIBreathingPetalRingMetalView_initWithFrame_petalColor_numberOfPetals_showBlurTrails_device___block_invoke;
    v29 = &unk_2644A7960;
    objc_copyWeak(&v30, &location);
    [(FIUIBreathingPetalRingMetalRenderer *)v17->_renderer setStateUpdateBlock:&v26];
    -[FIUIBreathingPetalRingMetalView addSubview:](v17, "addSubview:", v17->_mtkView, v26, v27, v28, v29);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  return v17;
}

void __97__FIUIBreathingPetalRingMetalView_initWithFrame_petalColor_numberOfPetals_showBlurTrails_device___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained petalRingDelegate];
  [v1 petalRingViewDisplayLinkDidFire:WeakRetained];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)FIUIBreathingPetalRingMetalView;
  [(FIUIBreathingPetalRingMetalView *)&v12 layoutSubviews];
  [(FIUIBreathingPetalRingMetalView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(FIUIBreathingPetalRingMetalView *)self mtkView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)setRingRadius:(float)a3
{
}

- (float)ringRadius
{
  [(FIUIBreathingPetalRingMetalRenderer *)self->_renderer ringRadius];
  return result;
}

- (void)setRingCenter:(CGPoint)a3
{
}

- (CGPoint)ringCenter
{
  [(FIUIBreathingPetalRingMetalRenderer *)self->_renderer ringCenter];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (int64_t)numberOfVisiblePetals
{
  return [(FIUIBreathingPetalRingMetalRenderer *)self->_renderer numberOfVisiblePetals];
}

- (void)setPreferredFramesPerSecond:(float)a3
{
}

- (float)preferredFramesPerSecond
{
  return (float)[(MTKView *)self->_mtkView preferredFramesPerSecond];
}

- (void)importDataFromPetalRing:(id)a3
{
  if (a3) {
    [(FIUIBreathingPetalRingMetalRenderer *)self->_renderer importDataFromPetalRingMetalRenderer:*((void *)a3 + 55)];
  }
}

- (void)setPetalAtIndex:(int64_t)a3 center:(CGPoint)a4 radius:(float)a5 alpha:(float)a6
{
}

- (void)setBlurTrailAtIndex:(int64_t)a3 center:(CGPoint)a4 radius:(float)a5 blurriness:(float)a6 alpha:(float)a7
{
}

- (void)setNumberOfVisiblePetals:(int64_t)a3 showBlurTrails:(BOOL)a4
{
}

- (void)setGradientRotationAngle:(float)a3
{
}

- (FIUIDeepBreathingPetalRingViewDelegate)petalRingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_petalRingDelegate);
  return (FIUIDeepBreathingPetalRingViewDelegate *)WeakRetained;
}

- (void)setPetalRingDelegate:(id)a3
{
}

- (int64_t)numberOfPetals
{
  return self->_numberOfPetals;
}

- (BOOL)showBlurTrails
{
  return self->_showBlurTrails;
}

- (MTKView)mtkView
{
  return self->_mtkView;
}

- (void)setMtkView:(id)a3
{
}

- (FIUIBreathingPetalRingMetalRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_mtkView, 0);
  objc_destroyWeak((id *)&self->_petalRingDelegate);
}

@end