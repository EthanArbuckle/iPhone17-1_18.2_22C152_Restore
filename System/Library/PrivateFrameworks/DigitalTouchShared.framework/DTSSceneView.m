@interface DTSSceneView
- (BOOL)allowsTransparency;
- (BOOL)ignoresSiblingOrder;
- (BOOL)paused;
- (BOOL)shouldCullNonVisibleNodes;
- (DTSSceneView)initWithFrame:(CGRect)a3;
- (NSMutableDictionary)options;
- (int64_t)preferredFramesPerSecond;
- (void)_applicationDidEnterBackground;
- (void)_updateLayout;
- (void)layoutSubviews;
- (void)presentScene:(id)a3;
- (void)setAllowsTransparency:(BOOL)a3;
- (void)setIgnoresSiblingOrder:(BOOL)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPreferredFramesPerSecond:(int64_t)a3;
- (void)setShouldCullNonVisibleNodes:(BOOL)a3;
@end

@implementation DTSSceneView

- (DTSSceneView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)DTSSceneView;
  v7 = -[DTSSceneView initWithFrame:](&v15, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2050000000;
    v8 = (void *)getSKViewClass_softClass;
    uint64_t v20 = getSKViewClass_softClass;
    if (!getSKViewClass_softClass)
    {
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __getSKViewClass_block_invoke;
      v16[3] = &unk_264DEC848;
      v16[4] = &v17;
      __getSKViewClass_block_invoke((uint64_t)v16);
      v8 = (void *)v18[3];
    }
    v9 = v8;
    _Block_object_dispose(&v17, 8);
    uint64_t v10 = objc_msgSend([v9 alloc], "initWithFrame:", x, y, width, height);
    sceneView = v7->_sceneView;
    v7->_sceneView = (SKView *)v10;

    [(DTSSceneView *)v7 addSubview:v7->_sceneView];
    [(SKView *)v7->_sceneView setAutoresizingMask:18];
    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v7 selector:sel__applicationDidEnterBackground name:*MEMORY[0x263F1D050] object:0];
    [v12 addObserver:v7 selector:sel__applicationWillEnterForeground name:*MEMORY[0x263F1D0D0] object:0];
    [v12 addObserver:v7 selector:sel__applicationWillEnterForeground name:*MEMORY[0x263F1D038] object:0];
    v13 = v7;
  }
  return v7;
}

- (void)setShouldCullNonVisibleNodes:(BOOL)a3
{
  self->_shouldCullNonVisibleNodes = a3;
  -[SKView setShouldCullNonVisibleNodes:](self->_sceneView, "setShouldCullNonVisibleNodes:");
}

- (void)setIgnoresSiblingOrder:(BOOL)a3
{
  self->_ignoresSiblingOrder = a3;
  -[SKView setIgnoresSiblingOrder:](self->_sceneView, "setIgnoresSiblingOrder:");
}

- (void)setAllowsTransparency:(BOOL)a3
{
  self->_allowsTransparencdouble y = a3;
  -[SKView setAllowsTransparency:](self->_sceneView, "setAllowsTransparency:");
}

- (void)presentScene:(id)a3
{
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
  -[SKView setPaused:](self->_sceneView, "setPaused:");
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  self->_preferredFramesPerSecond = a3;
  -[SKView setPreferredFramesPerSecond:](self->_sceneView, "setPreferredFramesPerSecond:");
}

- (NSMutableDictionary)options
{
  return (NSMutableDictionary *)[(SKView *)self->_sceneView options];
}

- (void)_applicationDidEnterBackground
{
  self->_shouldDelayLayout = 1;
}

- (void)_updateLayout
{
  self->_shouldDelayLayout = 0;
  if (self->_didDelayLayout) {
    [(DTSSceneView *)self setNeedsLayout];
  }
  self->_didDelayLayout = 0;
}

- (void)layoutSubviews
{
  if (self->_shouldDelayLayout
    || ([MEMORY[0x263F1C408] sharedApplication],
        v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 applicationState],
        v3,
        v4))
  {
    self->_didDelayLayout = 1;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)DTSSceneView;
    [(DTSSceneView *)&v5 layoutSubviews];
  }
}

- (BOOL)shouldCullNonVisibleNodes
{
  return self->_shouldCullNonVisibleNodes;
}

- (BOOL)ignoresSiblingOrder
{
  return self->_ignoresSiblingOrder;
}

- (BOOL)allowsTransparency
{
  return self->_allowsTransparency;
}

- (BOOL)paused
{
  return self->_paused;
}

- (int64_t)preferredFramesPerSecond
{
  return self->_preferredFramesPerSecond;
}

- (void).cxx_destruct
{
}

@end