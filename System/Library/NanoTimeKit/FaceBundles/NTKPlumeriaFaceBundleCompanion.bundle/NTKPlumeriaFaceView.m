@interface NTKPlumeriaFaceView
- (CLKUIQuadView)quadView;
- (NTKPlumeriaFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (NTKPlumeriaQuad)quad;
- (id)colorPalette;
- (id)createFaceColorPalette;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyFrozen;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_loadSnapshotContentViews;
- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)_reorderSwitcherSnapshotView;
- (void)_setUpMetalView;
- (void)_tearDownMetalView;
- (void)_unloadSnapshotContentViews;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
@end

@implementation NTKPlumeriaFaceView

- (NTKPlumeriaFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NTKPlumeriaFaceView;
  v10 = [(NTKPlumeriaFaceView *)&v13 initWithFaceStyle:a3 forDevice:v9 clientIdentifier:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_device, a4);
    v11->_isPaused = 1;
  }

  return v11;
}

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPlumeriaFaceView;
  [(NTKPlumeriaFaceView *)&v3 _loadSnapshotContentViews];
  [(NTKPlumeriaFaceView *)self _setUpMetalView];
}

- (void)_unloadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPlumeriaFaceView;
  [(NTKPlumeriaFaceView *)&v3 _unloadSnapshotContentViews];
  [(NTKPlumeriaFaceView *)self _tearDownMetalView];
}

- (void)_applyFrozen
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPlumeriaFaceView;
  [(NTKPlumeriaFaceView *)&v3 _applyFrozen];
  [(NTKPlumeriaFaceView *)self isFrozen];
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NTKPlumeriaFaceView;
  id v6 = a3;
  [(NTKPlumeriaFaceView *)&v7 setOverrideDate:v6 duration:a4];
  -[NTKPlumeriaQuad setOverrideDate:duration:](self->_compositeQuad, "setOverrideDate:duration:", v6, a4, v7.receiver, v7.super_class);
}

- (void)_reorderSwitcherSnapshotView
{
  objc_super v3 = [(NTKPlumeriaFaceView *)self switcherSnapshotView];

  if (v3)
  {
    id v4 = [(NTKPlumeriaFaceView *)self switcherSnapshotView];
    [(NTKPlumeriaFaceView *)self bringSubviewToFront:v4];
  }
}

- (void)_setUpMetalView
{
  [(CLKDevice *)self->_device screenBounds];
  +[CLKUIMetalQuadView quadViewWithFrame:identifier:options:colorSpace:](CLKUIMetalQuadView, "quadViewWithFrame:identifier:options:colorSpace:", @"PLM", 32, 0);
  objc_super v3 = (CLKUIMetalQuadView *)objc_claimAutoreleasedReturnValue();
  quadView = self->_quadView;
  self->_quadView = v3;

  [(CLKUIMetalQuadView *)self->_quadView setUserInteractionEnabled:0];
  [(CLKUIMetalQuadView *)self->_quadView setOpaque:1];
  v5 = [[NTKPlumeriaQuad alloc] initWithDevice:self->_device];
  compositeQuad = self->_compositeQuad;
  self->_compositeQuad = v5;

  [(CLKUIMetalQuadView *)self->_quadView addQuad:self->_compositeQuad];
  objc_super v7 = [(NTKPlumeriaFaceView *)self contentView];
  [v7 addSubview:self->_quadView];

  [(NTKPlumeriaFaceView *)self bounds];
  -[CLKUIMetalQuadView setFrame:](self->_quadView, "setFrame:");
  v8 = self->_quadView;
  +[NTKPlumeriaQuad getDesiredFPS];

  [(CLKUIMetalQuadView *)v8 setPreferredFramesPerSecond:(uint64_t)v9];
}

- (void)_tearDownMetalView
{
  [(CLKUIMetalQuadView *)self->_quadView setDelegate:0];
  [(CLKUIMetalQuadView *)self->_quadView removeQuad:self->_compositeQuad];
  compositeQuad = self->_compositeQuad;
  self->_compositeQuad = 0;

  [(CLKUIMetalQuadView *)self->_quadView removeFromSuperview];
  quadView = self->_quadView;
  self->_quadView = 0;
}

- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKPlumeriaFaceView;
  id v6 = a4;
  [(NTKPlumeriaFaceView *)&v7 _renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
  -[CLKUIMetalQuadView renderSynchronouslyWithImageQueueDiscard:inGroup:](self->_quadView, "renderSynchronouslyWithImageQueueDiscard:inGroup:", v4, v6, v7.receiver, v7.super_class);
}

- (void)_configureForEditMode:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKPlumeriaFaceView;
  -[NTKPlumeriaFaceView _configureForEditMode:](&v6, "_configureForEditMode:");
  if (a3 == 10)
  {
    uint64_t v5 = 4;
  }
  else
  {
    if (a3) {
      return;
    }
    uint64_t v5 = 0;
  }
  [(NTKPlumeriaQuad *)self->_compositeQuad setState:v5];
}

- (id)createFaceColorPalette
{
  v2 = [[NTKPlumeriaColorPalette alloc] initWithFaceClass:objc_opt_class()];

  return v2;
}

- (id)colorPalette
{
  return [(NTKPlumeriaFaceView *)self faceColorPalette];
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v5.receiver = self;
  v5.super_class = (Class)NTKPlumeriaFaceView;
  [(NTKPlumeriaFaceView *)&v5 _configureForTransitionFraction:a4 fromEditMode:a5 toEditMode:a3];
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  if (a6 == 10)
  {
    uint64_t v26 = v13;
    uint64_t v27 = v10;
    uint64_t v28 = v9;
    uint64_t v29 = v8;
    uint64_t v30 = v7;
    id v18 = a5;
    v19 = [a4 effectiveOptionName];
    uint64_t v20 = NTKPlumeriaSettingIndexFromColorwayName(v19);

    v21 = [v18 effectiveOptionName];

    uint64_t v22 = NTKPlumeriaSettingIndexFromColorwayName(v21);
    if (v20 == v22) {
      uint64_t v23 = 0;
    }
    else {
      uint64_t v23 = 5;
    }
    -[NTKPlumeriaQuad setState:](self->_compositeQuad, "setState:", v23, v14, v26, v27, v28, v29, v30, v11);
    compositeQuad = self->_compositeQuad;
    *(float *)&double v24 = a3;
    [(NTKPlumeriaQuad *)compositeQuad morphBetweenColorways:v20 index1:v22 index2:v24];
  }
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKPlumeriaFaceView;
  [(NTKPlumeriaFaceView *)&v12 _applyOption:v8 forCustomEditMode:a4 slot:a5];
  if (a4 == 10)
  {
    uint64_t v9 = [v8 effectiveOptionName];
    uint64_t v10 = NTKPlumeriaSettingIndexFromColorwayName(v9);

    uint64_t v11 = [(NTKPlumeriaQuad *)self->_compositeQuad state];
    [(NTKPlumeriaQuad *)self->_compositeQuad morphBetweenColorways:v10 index1:v10 index2:0.0];
    [(NTKPlumeriaQuad *)self->_compositeQuad setState:v11];
  }
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)NTKPlumeriaFaceView;
  -[NTKPlumeriaFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v11, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4 == 10)
  {
    NTKLargeElementScaleForBreathingFraction();
    CGFloat v8 = v7;
    uint64_t v9 = [(NTKPlumeriaFaceView *)self rootContainerView];
    CGAffineTransformMakeScale(&v10, v8, v8);
    [v9 setTransform:&v10];
  }
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)NTKPlumeriaFaceView;
  -[NTKPlumeriaFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v15, "_applyRubberBandingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4 == 10)
  {
    NTKScaleForRubberBandingFraction();
    CGFloat v8 = v7;
    NTKAlphaForRubberBandingFraction();
    double v10 = v9;
    objc_super v11 = [(NTKPlumeriaFaceView *)self rootContainerView];
    CGAffineTransformMakeScale(&v13, v8, v8);
    CGAffineTransformTranslate(&v14, &v13, 0.0, 1.0);
    [v11 setTransform:&v14];

    objc_super v12 = [(NTKPlumeriaFaceView *)self rootContainerView];
    [v12 setAlpha:v10];
  }
}

- (CLKUIQuadView)quadView
{
  return self->_quadView;
}

- (NTKPlumeriaQuad)quad
{
  return self->_quad;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_compositeQuad, 0);

  objc_storeStrong((id *)&self->_quadView, 0);
}

@end