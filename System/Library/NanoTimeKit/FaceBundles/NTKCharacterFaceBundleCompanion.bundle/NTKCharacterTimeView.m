@interface NTKCharacterTimeView
- (BOOL)isFrozen;
- (CLKUIQuadView)quadView;
- (NTKCharacterTimeView)initWithFrame:(CGRect)a3 forDevice:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_didEnterBackground;
- (void)_endScrubbing;
- (void)_layoutRenderer;
- (void)_renderOneFrame;
- (void)_startAnimation;
- (void)_stopAnimation;
- (void)_willEnterForeground;
- (void)applyCharacterTransition:(double)a3 fromCharacter:(unint64_t)a4 toCharacter:(unint64_t)a5;
- (void)dealloc;
- (void)endScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)enumarateRenderers:(id)a3;
- (void)layoutSubviews;
- (void)renderOneFrame;
- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)scrubToDate:(id)a3;
- (void)setAnimationFrameInterval:(int64_t)a3;
- (void)setCharacter:(unint64_t)a3;
- (void)setClothingColor:(id)a3 andDesaturation:(double)a4;
- (void)setClothingColor:(id)a3 andDesaturation:(double)a4 forCharacter:(unint64_t)a5;
- (void)setFrozen:(BOOL)a3;
- (void)setOverrideDate:(id)a3;
- (void)setOverrideDate:(id)a3 animated:(BOOL)a4 enteringOrb:(BOOL)a5;
- (void)setOverrideDate:(id)a3 animated:(BOOL)a4 enteringOrb:(BOOL)a5 completion:(id)a6;
- (void)startScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4;
@end

@implementation NTKCharacterTimeView

- (NTKCharacterTimeView)initWithFrame:(CGRect)a3 forDevice:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v35.receiver = self;
  v35.super_class = (Class)NTKCharacterTimeView;
  v11 = -[NTKCharacterTimeView initWithFrame:](&v35, "initWithFrame:", x, y, width, height);
  if (v11)
  {
    kdebug_trace();
    v12 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "NTKCharacterTimeView", v34, 2u);
    }

    objc_storeStrong((id *)&v11->_device, a4);
    uint64_t v13 = +[CLKUIQuadView quadViewWithFrame:@"Char", 0, 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height identifier options colorSpace];
    characterQuadView = v11->_characterQuadView;
    v11->_characterQuadView = (CLKUIQuadView *)v13;

    v15 = [[NTKCharacterQuad alloc] initWithCLKDevice:v10];
    characterQuad = v11->_characterQuad;
    v11->_characterQuad = v15;

    [(CLKUIQuadView *)v11->_characterQuadView addQuad:v11->_characterQuad];
    [(CLKUIQuadView *)v11->_characterQuadView setPreferredFramesPerSecond:30];
    v17 = [(CLKUIQuadView *)v11->_characterQuadView layer];
    [v17 setOpaque:1];

    [(NTKCharacterTimeView *)v11 addSubview:v11->_characterQuadView];
    v18 = v11->_characterQuadView;
    double v19 = CGPointZero.y;
    double v20 = sub_4A84(v10);
    -[CLKUIQuadView setBounds:](v18, "setBounds:", CGPointZero.x, v19, v20, v21);
    v22 = v11->_characterQuadView;
    [(NTKCharacterTimeView *)v11 center];
    -[CLKUIQuadView setCenter:](v22, "setCenter:");
    [(CLKDevice *)v11->_device screenScale];
    -[NTKCharacterTimeView setContentScaleFactor:](v11, "setContentScaleFactor:");
    device = v11->_device;
    v24 = v11->_characterQuadView;
    uint64_t v25 = +[NTKCharacterResourceLoader sharedInstanceForDevice:device withPixelFormat:[(CLKUIQuadView *)v24 colorPixelFormat]];
    loader = v11->_loader;
    v11->_loader = (NTKCharacterResourceLoader *)v25;

    [(NTKCharacterResourceLoader *)v11->_loader addClient];
    v27 = +[NSNotificationCenter defaultCenter];
    [v27 addObserver:v11 selector:"_didEnterBackground" name:UIApplicationDidEnterBackgroundNotification object:0];

    v28 = +[NSNotificationCenter defaultCenter];
    [v28 addObserver:v11 selector:"_willEnterForeground" name:UIApplicationWillEnterForegroundNotification object:0];

    uint64_t v29 = +[NTKCharacterRenderer rendererWithCharacter:0 loader:v11->_loader];
    v30 = v11->_renderers[0];
    v11->_renderers[0] = (NTKCharacterRenderer *)v29;

    uint64_t v31 = +[NTKCharacterRenderer rendererWithCharacter:1 loader:v11->_loader];
    v32 = v11->_renderers[1];
    v11->_renderers[1] = (NTKCharacterRenderer *)v31;

    [(NTKCharacterTimeView *)v11 _layoutRenderer];
    kdebug_trace();
  }

  return v11;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:0];

  [(CLKUIQuadView *)self->_characterQuadView setPaused:1];
  [(CLKUIQuadView *)self->_characterQuadView removeAllQuads];
  characterQuad = self->_characterQuad;
  self->_characterQuad = 0;

  characterQuadView = self->_characterQuadView;
  self->_characterQuadView = 0;

  [(NTKCharacterResourceLoader *)self->_loader removeClient];
  loader = self->_loader;
  self->_loader = 0;

  v8.receiver = self;
  v8.super_class = (Class)NTKCharacterTimeView;
  [(NTKCharacterTimeView *)&v8 dealloc];
}

- (CLKUIQuadView)quadView
{
  return self->_characterQuadView;
}

- (void)setAnimationFrameInterval:(int64_t)a3
{
  [(CLKUIQuadView *)self->_characterQuadView setPreferredFramesPerSecond:(uint64_t)(60.0 / (double)a3)];
  renderer = self->_renderer;

  *(float *)&double v5 = (float)a3;
  [(NTKCharacterRenderer *)renderer setAnimationFrameInterval:v5];
}

- (void)setOverrideDate:(id)a3 animated:(BOOL)a4 enteringOrb:(BOOL)a5
{
}

- (void)setOverrideDate:(id)a3 animated:(BOOL)a4 enteringOrb:(BOOL)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  v11 = (void (**)(id, uint64_t))a6;
  if (v8)
  {
    [(NTKCharacterTimeView *)self _startAnimation];
    [(NTKCharacterTimeView *)self setAnimationFrameInterval:1];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_4E6C;
    v19[3] = &unk_1C800;
    v12 = &v20;
    id v20 = v10;
    BOOL v21 = a5;
    [(NTKCharacterTimeView *)self enumarateRenderers:v19];
    if (!v11) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  [(NTKCharacterTimeView *)self setAnimationFrameInterval:2];
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_4F08;
  v16 = &unk_1C800;
  v12 = &v17;
  id v17 = v10;
  BOOL v18 = a5;
  [(NTKCharacterTimeView *)self enumarateRenderers:&v13];
  [(NTKCharacterTimeView *)self renderOneFrame];
  if (v11) {
LABEL_5:
  }
    v11[2](v11, 1);
LABEL_6:
}

- (void)setOverrideDate:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_5040;
  v5[3] = &unk_1C828;
  id v6 = a3;
  id v4 = v6;
  [(NTKCharacterTimeView *)self enumarateRenderers:v5];
}

- (void)enumarateRenderers:(id)a3
{
  renderers = self->_renderers;
  v7 = (char *)a3 + 16;
  (*((void (**)(id, NTKCharacterRenderer *))a3 + 2))(a3, self->_renderers[0]);
  double v5 = renderers[1];
  id v6 = *(void (**)(id, NTKCharacterRenderer *))v7;

  v6(a3, v5);
}

- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
}

- (void)setFrozen:(BOOL)a3
{
  if (a3) {
    [(NTKCharacterTimeView *)self _stopAnimation];
  }
  else {
    [(NTKCharacterTimeView *)self _startAnimation];
  }
}

- (void)_startAnimation
{
  if ((*((unsigned char *)self + 72) & 2) == 0)
  {
    kdebug_trace();
    *((unsigned char *)self + 72) |= 2u;
    characterQuadView = self->_characterQuadView;
    [(CLKUIQuadView *)characterQuadView setPaused:0];
  }
}

- (void)_stopAnimation
{
  if ((*((unsigned char *)self + 72) & 2) != 0)
  {
    kdebug_trace();
    *((unsigned char *)self + 72) &= ~2u;
    characterQuadView = self->_characterQuadView;
    [(CLKUIQuadView *)characterQuadView setPaused:1];
  }
}

- (void)setCharacter:(unint64_t)a3
{
  if (self->_character != a3 || !self->_renderer)
  {
    self->_character = a3;
    id v4 = self->_renderers[a3];
    LODWORD(v5) = 1.0;
    [(NTKCharacterRenderer *)v4 setCharacterBrightness:v5];
    if (self->_renderer)
    {
      -[NTKCharacterRenderer copyStateFrom:](v4, "copyStateFrom:");
      [(NTKCharacterRenderer *)v4 activate];
      [(NTKCharacterRenderer *)self->_renderer deactivate];
    }
    renderer = self->_renderer;
    self->_renderer = v4;
    v7 = v4;

    [(NTKCharacterQuad *)self->_characterQuad setRenderer:self->_renderer];
    [(NTKCharacterTimeView *)self renderOneFrame];
  }
}

- (void)setClothingColor:(id)a3 andDesaturation:(double)a4
{
}

- (void)setClothingColor:(id)a3 andDesaturation:(double)a4 forCharacter:(unint64_t)a5
{
  [(NTKCharacterRenderer *)self->_renderers[a5] setClothingColor:a3 andDesaturation:a4];

  [(NTKCharacterTimeView *)self renderOneFrame];
}

- (void)_configureForEditMode:(int64_t)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_53B0;
  v4[3] = &unk_1C848;
  v4[4] = a3;
  [(NTKCharacterTimeView *)self enumarateRenderers:v4];
  [(NTKCharacterTimeView *)self renderOneFrame];
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  double v6 = NTKEditModeDimmedAlpha;
  if (a4) {
    double v7 = NTKEditModeDimmedAlpha;
  }
  else {
    double v7 = 1.0;
  }
  if (a5) {
    double v8 = NTKEditModeDimmedAlpha;
  }
  else {
    double v8 = 1.0;
  }
  v10[1] = 3221225472;
  if (a4 == 1) {
    double v9 = NTKEditModeDimmedAlpha;
  }
  else {
    double v9 = 1.0;
  }
  v10[0] = _NSConcreteStackBlock;
  v10[2] = sub_54F8;
  v10[3] = &unk_1C868;
  *(double *)&v10[4] = v7;
  *(double *)&v10[5] = v8;
  if (a5 != 1) {
    double v6 = 1.0;
  }
  *(double *)&v10[6] = a3;
  *(double *)&v10[7] = v9;
  *(double *)&v10[8] = v6;
  [(NTKCharacterTimeView *)self enumarateRenderers:v10];
  [(NTKCharacterTimeView *)self renderOneFrame];
}

- (void)applyCharacterTransition:(double)a3 fromCharacter:(unint64_t)a4 toCharacter:(unint64_t)a5
{
  if (a3 >= 0.5)
  {
    [(NTKCharacterTimeView *)self setCharacter:a5];
    double v7 = a3 + -0.5 + a3 + -0.5;
  }
  else
  {
    -[NTKCharacterTimeView setCharacter:](self, "setCharacter:", a4, a5);
    double v7 = a3 * -2.0 + 1.0;
  }
  float v8 = v7;
  *(float *)&double v7 = v8;
  [(NTKCharacterRenderer *)self->_renderer setCharacterBrightness:v7];
  *(float *)&double v9 = v8;
  [(NTKCharacterRenderer *)self->_renderer setGlowBrightness:v9];

  [(NTKCharacterTimeView *)self renderOneFrame];
}

- (void)_renderOneFrame
{
  *((unsigned char *)self + 72) &= ~1u;
  if ((*((unsigned char *)self + 72) & 2) == 0) {
    [(NTKCharacterTimeView *)self renderSynchronouslyWithImageQueueDiscard:0 inGroup:0];
  }
}

- (void)renderOneFrame
{
  if ((*((unsigned char *)self + 72) & 2) == 0 && (*((unsigned char *)self + 72) & 1) == 0)
  {
    *((unsigned char *)self + 72) |= 1u;
    if (+[NSThread isMainThread])
    {
      [(NTKCharacterTimeView *)self _renderOneFrame];
    }
    else
    {
      -[NTKCharacterTimeView performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:");
    }
  }
}

- (void)_didEnterBackground
{
  obj = self;
  objc_sync_enter(obj);
  *((unsigned char *)obj + 72) |= 4u;
  *((unsigned char *)obj + 72) &= ~8u;
  *((unsigned char *)obj + 72) &= ~0x10u;
  objc_sync_exit(obj);
}

- (void)_willEnterForeground
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = *((unsigned char *)v2 + 72);
  *((unsigned char *)v2 + 72) = v3 & 0xFB;
  *((unsigned char *)v2 + 72) &= ~8u;
  *((unsigned char *)v2 + 72) &= ~0x10u;
  objc_sync_exit(v2);

  if ((v3 & 0x10) != 0) {
    [(NTKCharacterTimeView *)v2 setNeedsLayout];
  }
  if ((v3 & 8) != 0)
  {
    [(NTKCharacterTimeView *)v2 renderOneFrame];
  }
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)NTKCharacterTimeView;
  [(NTKCharacterTimeView *)&v10 layoutSubviews];
  char v3 = [(NTKCharacterTimeView *)self layer];
  [v3 bounds];
  -[NTKCharacterTimeView setBounds:](self, "setBounds:");

  characterQuadView = self->_characterQuadView;
  double y = CGPointZero.y;
  double v6 = sub_4A84(self->_device);
  -[CLKUIQuadView setBounds:](characterQuadView, "setBounds:", CGPointZero.x, y, v6, v7);
  float v8 = self->_characterQuadView;
  [(NTKCharacterTimeView *)self center];
  -[CLKUIQuadView setCenter:](v8, "setCenter:");
  double v9 = self;
  objc_sync_enter(v9);
  if ((*((unsigned char *)v9 + 72) & 4) != 0) {
    *((unsigned char *)v9 + 72) |= 0x10u;
  }
  else {
    [(NTKCharacterTimeView *)v9 _layoutRenderer];
  }
  objc_sync_exit(v9);
}

- (void)_layoutRenderer
{
  [(NTKCharacterTimeView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(CLKDevice *)self->_device screenScale];
  float v8 = v4 * v7;
  float v9 = v6 * v7;
  if (v8 >= 1.0 && v9 >= 1.0)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_5A1C;
    v11[3] = &unk_1C888;
    *(double *)&v11[4] = v4;
    *(double *)&v11[5] = v6;
    float v12 = v9;
    float v13 = v8;
    [(NTKCharacterTimeView *)self enumarateRenderers:v11];
  }
}

- (void)startScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4
{
  double v5 = (void (**)(void))a4;
  [(NTKCharacterTimeView *)self setAnimationFrameInterval:1];
  v5[2]();
}

- (void)scrubToDate:(id)a3
{
}

- (void)_endScrubbing
{
  [(NTKCharacterRenderer *)self->_renderer scrubToDate:0];

  [(NTKCharacterTimeView *)self setAnimationFrameInterval:2];
}

- (void)endScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  double v6 = (void (**)(void))a4;
  if (v4)
  {
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_5C24;
    v7[3] = &unk_1C8B0;
    objc_copyWeak(&v9, &location);
    float v8 = v6;
    [(NTKCharacterTimeView *)self setOverrideDate:0 animated:1 enteringOrb:0 completion:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    [(NTKCharacterTimeView *)self _endScrubbing];
    v6[2](v6);
  }
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
  for (uint64_t i = 1; i != -1; --i)
    objc_storeStrong((id *)&self->_renderers[i], 0);
  objc_storeStrong((id *)&self->_characterQuadView, 0);
  objc_storeStrong((id *)&self->_characterQuad, 0);
  objc_storeStrong((id *)&self->_loader, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end