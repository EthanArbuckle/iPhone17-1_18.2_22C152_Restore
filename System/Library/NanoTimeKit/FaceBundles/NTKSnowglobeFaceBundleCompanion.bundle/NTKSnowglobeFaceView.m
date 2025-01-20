@interface NTKSnowglobeFaceView
+ (id)_sharedRenderTargetQueue;
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_isBlackColor;
- (BOOL)_wantsStatusBarIconShadow;
- (NTKSnowglobeFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)createFaceColorPalette;
- (void)_applyDataMode;
- (void)_applyFrozen;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupAfterEditing;
- (void)_finalizeForSnapshotting:(id)a3;
- (void)_loadCornerOverlayView;
- (void)_loadSnapshotContentViews;
- (void)_prepareForEditing;
- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)_setupScene;
- (void)_tappedWithSender:(id)a3;
- (void)_unloadCornerOverlayView;
- (void)_unloadSnapshotContentViews;
- (void)_updateMotionPauseState;
- (void)_updateScene;
- (void)_updateViewColorsWithPalette:(id)a3;
- (void)dealloc;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setTimeOffset:(double)a3;
@end

@implementation NTKSnowglobeFaceView

+ (id)_sharedRenderTargetQueue
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v2 = (void *)qword_1EA8FCEC0;
  if (!qword_1EA8FCEC0)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.NanoTimeKit.NTKSnowglobeFaceView.targetRenderQueue", v3);
    v5 = (void *)qword_1EA8FCEC0;
    qword_1EA8FCEC0 = (uint64_t)v4;

    v2 = (void *)qword_1EA8FCEC0;
  }

  return v2;
}

- (NTKSnowglobeFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)NTKSnowglobeFaceView;
  v5 = [(NTKSnowglobeFaceView *)&v13 initWithFaceStyle:a3 forDevice:a4 clientIdentifier:a5];
  if (v5)
  {
    uint64_t v6 = +[NTKSnowglobeAssetLibrary sharedInstance];
    assetLibrary = v5->_assetLibrary;
    v5->_assetLibrary = (NTKSnowglobeAssetLibrary *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = [(id)objc_opt_class() _sharedRenderTargetQueue];
    dispatch_queue_t v10 = dispatch_queue_create_with_target_V2("com.apple.NanoTimeKit.NTKSnowglobeFaceView.asyncRenderQueue", v8, v9);
    asyncRenderQueue = v5->_asyncRenderQueue;
    v5->_asyncRenderQueue = (OS_dispatch_queue *)v10;
  }
  return v5;
}

- (void)dealloc
{
  [(NTKSnowglobeMotionToken *)self->_motionToken invalidate];
  v3.receiver = self;
  v3.super_class = (Class)NTKSnowglobeFaceView;
  [(NTKSnowglobeFaceView *)&v3 dealloc];
}

- (void)_setupScene
{
  dispatch_suspend((dispatch_object_t)self->_asyncRenderQueue);
  objc_super v3 = [NTKSnowglobeMetalQuadView alloc];
  [(NTKSnowglobeFaceView *)self bounds];
  dispatch_queue_t v4 = -[CLKUIMetalQuadView initWithFrame:identifier:options:colorSpace:asyncRenderQueue:](v3, "initWithFrame:identifier:options:colorSpace:asyncRenderQueue:", @"SnGl", 8, 2, self->_asyncRenderQueue);
  v5 = [NTKSnowglobeSceneController alloc];
  [(NTKSnowglobeFaceView *)self bounds];
  v8 = -[NTKSnowglobeSceneController initWithSceneSize:renderQueue:](v5, "initWithSceneSize:renderQueue:", self->_asyncRenderQueue, v6, v7);
  sceneController = self->_sceneController;
  self->_sceneController = v8;

  dispatch_queue_t v10 = [NTKSnowglobeSceneQuad alloc];
  v11 = [(NTKSnowglobeSceneController *)self->_sceneController scene];
  v12 = self->_sceneController;
  objc_super v13 = [(NTKSnowglobeAssetLibrary *)self->_assetLibrary sharedDevice];
  v14 = [(NTKSnowglobeFaceView *)self device];
  [v14 screenScale];
  v15 = -[NTKSnowglobeSceneQuad initWithScene:delegate:device:screenScale:](v10, "initWithScene:delegate:device:screenScale:", v11, v12, v13);
  sceneQuad = self->_sceneQuad;
  self->_sceneQuad = v15;

  [(CLKUIQuadView *)v4 addQuad:self->_sceneQuad];
  v17 = [(NTKSnowglobeSceneQuad *)self->_sceneQuad renderer];
  [(NTKSnowglobeSceneController *)self->_sceneController setRenderer:v17];

  [(NTKSnowglobeSceneController *)self->_sceneController setIdealizedState:1 editing:[(NTKSnowglobeFaceView *)self editing]];
  quadView = self->_quadView;
  self->_quadView = v4;
  v20 = v4;

  v19 = [(NTKSnowglobeFaceView *)self contentView];
  [v19 addSubview:self->_quadView];

  [(NTKSnowglobeFaceView *)self _applyFrozen];
  [(CLKUIQuadView *)v20 setPreferredFramesPerSecond:30];
  [(CLKUIQuadView *)v20 setPaused:0];
  dispatch_resume((dispatch_object_t)self->_asyncRenderQueue);
}

- (void)_updateScene
{
  sceneController = self->_sceneController;
  BOOL v4 = ([(NTKSnowglobeFaceView *)self editing] & 1) != 0
    || [(NTKSnowglobeFaceView *)self dataMode] != 1;
  uint64_t v5 = [(NTKSnowglobeFaceView *)self editing];

  [(NTKSnowglobeSceneController *)sceneController setIdealizedState:v4 editing:v5];
}

- (void)_applyFrozen
{
  v4.receiver = self;
  v4.super_class = (Class)NTKSnowglobeFaceView;
  [(NTKSnowglobeFaceView *)&v4 _applyFrozen];
  int v3 = [(NTKSnowglobeFaceView *)self isFrozen];
  [(NTKSnowglobeFaceView *)self _updateMotionPauseState];
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer setEnabled:v3 ^ 1u];
}

- (void)_updateMotionPauseState
{
  if (([(NTKSnowglobeFaceView *)self isFrozen] & 1) != 0
    || [(NTKSnowglobeFaceView *)self editing])
  {
    [(NTKSnowglobeMotionToken *)self->_motionToken invalidate];
    motionToken = self->_motionToken;
    self->_motionToken = 0;
  }
  else
  {
    if (self->_motionToken) {
      return;
    }
    double v6 = +[NTKSnowglobeMotionManager sharedInstance];
    objc_super v4 = [(NTKSnowglobeMotionToken *)v6 acquireToken];
    uint64_t v5 = self->_motionToken;
    self->_motionToken = v4;

    motionToken = v6;
  }
}

- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKSnowglobeFaceView;
  id v6 = a4;
  [(NTKSnowglobeFaceView *)&v7 _renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
  -[CLKUIQuadView renderSynchronouslyWithImageQueueDiscard:inGroup:](self->_quadView, "renderSynchronouslyWithImageQueueDiscard:inGroup:", v4, v6, v7.receiver, v7.super_class);
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NTKSnowglobeFaceView;
  id v6 = a3;
  [(NTKSnowglobeFaceView *)&v7 setOverrideDate:v6 duration:a4];
  -[NTKSnowglobeSceneController setOverrideDate:duration:](self->_sceneController, "setOverrideDate:duration:", v6, a4, v7.receiver, v7.super_class);
}

- (void)setTimeOffset:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKSnowglobeFaceView;
  -[NTKSnowglobeFaceView setTimeOffset:](&v5, sel_setTimeOffset_);
  [(NTKSnowglobeSceneController *)self->_sceneController setTimeOffset:a3];
}

- (void)_applyDataMode
{
}

- (BOOL)_wantsStatusBarIconShadow
{
  return ![(NTKSnowglobeFaceView *)self _isBlackColor];
}

- (BOOL)_isBlackColor
{
  v2 = [(NTKSnowglobeFaceView *)self faceColorPalette];
  int v3 = [v2 pigmentEditOption];

  BOOL v4 = [v3 identifier];
  char v5 = [v4 isEqualToString:0];

  return v5;
}

- (void)_loadSnapshotContentViews
{
  v5.receiver = self;
  v5.super_class = (Class)NTKSnowglobeFaceView;
  [(NTKSnowglobeFaceView *)&v5 _loadSnapshotContentViews];
  if (!self->_quadView) {
    [(NTKSnowglobeFaceView *)self _setupScene];
  }
  if (!self->_tapGestureRecognizer)
  {
    int v3 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__tappedWithSender_];
    tapGestureRecognizer = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v3;

    [(UITapGestureRecognizer *)self->_tapGestureRecognizer setEnabled:1];
    [(NTKSnowglobeFaceView *)self setUserInteractionEnabled:1];
    [(NTKSnowglobeFaceView *)self addGestureRecognizer:self->_tapGestureRecognizer];
  }
  [(NTKSnowglobeFaceView *)self _loadCornerOverlayView];
}

- (void)_unloadSnapshotContentViews
{
  v6.receiver = self;
  v6.super_class = (Class)NTKSnowglobeFaceView;
  [(NTKSnowglobeFaceView *)&v6 _unloadSnapshotContentViews];
  [(CLKUIQuadView *)self->_quadView removeFromSuperview];
  quadView = self->_quadView;
  self->_quadView = 0;

  sceneQuad = self->_sceneQuad;
  self->_sceneQuad = 0;

  sceneController = self->_sceneController;
  self->_sceneController = 0;

  [(NTKSnowglobeFaceView *)self _unloadCornerOverlayView];
}

- (void)_loadCornerOverlayView
{
  id v3 = objc_alloc(MEMORY[0x1E4F7A020]);
  BOOL v4 = [(NTKSnowglobeFaceView *)self contentView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  objc_super v13 = [(NTKSnowglobeFaceView *)self device];
  v14 = (NTKRoundedCornerOverlayView *)objc_msgSend(v3, "initWithFrame:forDeviceCornerRadius:", v13, v6, v8, v10, v12);
  cornerOverlayView = self->_cornerOverlayView;
  self->_cornerOverlayView = v14;

  id v16 = [(NTKSnowglobeFaceView *)self contentView];
  [v16 addSubview:self->_cornerOverlayView];
}

- (void)_unloadCornerOverlayView
{
  [(NTKRoundedCornerOverlayView *)self->_cornerOverlayView removeFromSuperview];
  cornerOverlayView = self->_cornerOverlayView;
  self->_cornerOverlayView = 0;
}

- (void)_finalizeForSnapshotting:(id)a3
{
  id v4 = a3;
  sceneController = self->_sceneController;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DAFE24A0;
  v7[3] = &unk_1E6BE4D48;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NTKSnowglobeSceneController *)sceneController flushWithCompletion:v7];
}

- (void)_tappedWithSender:(id)a3
{
  [a3 locationInView:self];
  sceneController = self->_sceneController;

  MEMORY[0x1F4181798](sceneController, sel_tapAtPoint_);
}

- (id)createFaceColorPalette
{
  v2 = [(NTKFaceColorPalette *)[NTKSnowglobeColorPalette alloc] initWithFaceClass:objc_opt_class()];

  return v2;
}

- (void)_updateViewColorsWithPalette:(id)a3
{
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  if (a4 == 15)
  {
    uint64_t v11 = [v13 background];
    double v12 = 0.0;
    if (!v11) {
      double v12 = 1.0;
    }
    [(NTKSnowglobeSceneController *)self->_sceneController setBackgroundObjectOpacity:v12];
  }
  else if (a4 == 10)
  {
    double v9 = [(NTKSnowglobeFaceView *)self colorPalette];
    [(NTKSnowglobeFaceView *)self _updateViewColorsWithPalette:v9];

    double v10 = [(NTKSnowglobeFaceView *)self delegate];
    [v10 faceViewDidChangeWantsStatusBarIconShadow];
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v19 = a4;
  id v12 = a5;
  id v13 = a7;
  if (a6 == 15)
  {
    uint64_t v15 = [v19 background];
    uint64_t v16 = [v12 background];
    double v17 = 1.0;
    if (v16 == 1) {
      double v17 = 1.0 - a3;
    }
    double v18 = 0.0;
    if (!v16) {
      double v18 = a3;
    }
    if (v15 == 1) {
      double v17 = v18;
    }
    [(NTKSnowglobeSceneController *)self->_sceneController setBackgroundObjectOpacity:v17];
  }
  else if (a6 == 10)
  {
    v14 = [(NTKSnowglobeFaceView *)self interpolatedColorPalette];
    [(NTKSnowglobeFaceView *)self _updateViewColorsWithPalette:v14];
  }
}

- (void)_prepareForEditing
{
  [(NTKSnowglobeFaceView *)self _updateMotionPauseState];

  MEMORY[0x1F4181798](self, sel__updateScene);
}

- (void)_cleanupAfterEditing
{
  [(NTKSnowglobeFaceView *)self _updateMotionPauseState];

  MEMORY[0x1F4181798](self, sel__updateScene);
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 15) {
    return &unk_1F352BF78;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 15)
  {
    if (qword_1EA8FCED0 != -1) {
      dispatch_once(&qword_1EA8FCED0, &unk_1F3527ED8);
    }
    id v10 = v8;
    uint64_t v11 = [v9 objectForKeyedSubscript:&unk_1F352BED0];
    uint64_t v12 = [v10 background];
    id v13 = NSString;
    v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "background"));
    uint64_t v15 = [v11 identifier];
    uint64_t v16 = [v13 stringWithFormat:@"%@-%@", v14, v15];

    double v17 = [(id)qword_1EA8FCEC8 objectForKey:v16];
    if (!v17)
    {
      [(NTKSnowglobeSceneController *)self->_sceneController backgroundObjectOpacity];
      double v19 = v18;
      double v20 = 0.0;
      if (!v12) {
        double v20 = 1.0;
      }
      [(NTKSnowglobeSceneController *)self->_sceneController setBackgroundObjectOpacity:v20];
      objc_msgSend(MEMORY[0x1E4F79FE8], "sizeForSwatchStyle:", objc_msgSend(v10, "swatchStyle"));
      double v22 = v21;
      double v24 = v23;
      [(NTKSnowglobeFaceView *)self bounds];
      CGFloat v25 = CGRectGetHeight(v31) / v24;
      v26 = [(NTKSnowglobeFaceView *)self device];
      [v26 screenScale];
      CGFloat v28 = v25 * v27;

      double v17 = -[CLKUIQuadView snapshotInRect:scale:time:](self->_quadView, "snapshotInRect:scale:time:", 0.0, 0.0, v22, v24, v28, CACurrentMediaTime());
      [(id)qword_1EA8FCEC8 setObject:v17 forKey:v16];
      [(NTKSnowglobeSceneController *)self->_sceneController setBackgroundObjectOpacity:v19];
    }
  }
  else
  {
    double v17 = 0;
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncRenderQueue, 0);
  objc_storeStrong((id *)&self->_motionToken, 0);
  objc_storeStrong((id *)&self->_cornerOverlayView, 0);
  objc_storeStrong((id *)&self->_assetLibrary, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_sceneController, 0);
  objc_storeStrong((id *)&self->_sceneQuad, 0);

  objc_storeStrong((id *)&self->_quadView, 0);
}

@end