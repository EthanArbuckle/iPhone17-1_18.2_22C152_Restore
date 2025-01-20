@interface CFXViewfinderFlipTransition
- (CAMSnapshotView)_backSnapshotView;
- (CAMSnapshotView)_frontSnapshotView;
- (CAMSnapshotView)_targetSnapshotView;
- (CFXViewfinderFlipTransition)initWithViewfinderView:(id)a3;
- (UIView)viewfinderView;
- (double)_backSnapshotTargetRadiansForDirection:(int64_t)a3 frontSnapshotRadians:(double)a4;
- (double)_frontSnapshotTargetRadiansForDirection:(int64_t)a3 fromRadians:(double)a4;
- (id)_snapshotFlipAnimationFromValue:(double)a3 toValue:(double)a4;
- (unint64_t)_currentAnimationID;
- (void)_cleanupFromFlipTransition;
- (void)_getCurrentRadians:(double *)a3 targetRadians:(double *)a4 forDirection:(int64_t)a5 withAnimation:(id)a6 onFrontSnapshotLayer:(id)a7;
- (void)_setBackSnapshotView:(id)a3;
- (void)_setCurrentAnimationID:(unint64_t)a3;
- (void)_setFrontSnapshotView:(id)a3;
- (void)_setTargetSnapshotView:(id)a3;
- (void)completeTransitionToLivePreviewWithCompletionHandler:(id)a3;
- (void)performFlipTransitionWithDirection:(int64_t)a3 completionHandler:(id)a4;
- (void)setViewfinderView:(id)a3;
@end

@implementation CFXViewfinderFlipTransition

- (CFXViewfinderFlipTransition)initWithViewfinderView:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CFXViewfinderFlipTransition;
  v5 = [(CFXViewfinderFlipTransition *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_viewfinderView, v4);
    v7 = v6;
  }

  return v6;
}

- (void)_cleanupFromFlipTransition
{
  v3 = [(CFXViewfinderFlipTransition *)self _frontSnapshotView];
  id v4 = [(CFXViewfinderFlipTransition *)self _backSnapshotView];
  v5 = [(CFXViewfinderFlipTransition *)self _targetSnapshotView];
  v6 = [v3 layer];
  [v6 removeAllAnimations];
  [v6 setZPosition:0.0];
  [v3 removeFromSuperview];
  [(CFXViewfinderFlipTransition *)self _setFrontSnapshotView:0];
  v7 = [v4 layer];
  [v7 removeAllAnimations];
  [v7 setZPosition:0.0];
  v8 = [v5 layer];
  [v8 removeAllAnimations];
  [v8 setZPosition:0.0];
  objc_super v9 = [(CFXViewfinderFlipTransition *)self viewfinderView];
  v10 = [v9 superview];

  v11 = [(CFXViewfinderFlipTransition *)self viewfinderView];
  [v11 setHidden:0];

  v12 = [(CFXViewfinderFlipTransition *)self viewfinderView];
  [v12 setNeedsLayout];

  v13 = [(CFXViewfinderFlipTransition *)self viewfinderView];
  [v13 layoutIfNeeded];

  v14 = [(CFXViewfinderFlipTransition *)self viewfinderView];
  v15 = [v14 layer];

  [v15 setZPosition:0.0];
  LODWORD(v16) = 1.0;
  [v15 setOpacity:v16];
  v17 = [v10 layer];
  long long v18 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  v22[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  v22[5] = v18;
  long long v19 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  v22[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  v22[7] = v19;
  long long v20 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  v22[0] = *MEMORY[0x263F15740];
  v22[1] = v20;
  long long v21 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  v22[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  v22[3] = v21;
  [v17 setSublayerTransform:v22];
}

- (void)performFlipTransitionWithDirection:(int64_t)a3 completionHandler:(id)a4
{
  v52[2] = *MEMORY[0x263EF8340];
  id v39 = a4;
  long long v6 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  v47[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  v47[3] = v6;
  v47[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  uint64_t v48 = *(void *)(MEMORY[0x263F15740] + 80);
  long long v7 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  v47[0] = *MEMORY[0x263F15740];
  v47[1] = v7;
  long long v8 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  long long v50 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  long long v51 = v8;
  objc_super v9 = [(CFXViewfinderFlipTransition *)self viewfinderView];
  v40 = [v9 superview];

  v41 = [v40 layer];
  unint64_t v49 = 0xBF435EAF72D7949ELL;
  [v41 setSublayerTransform:v47];
  [v41 setSortsSublayers:0];
  v10 = [(CFXViewfinderFlipTransition *)self _frontSnapshotView];
  v11 = [(CFXViewfinderFlipTransition *)self _backSnapshotView];
  if (v10)
  {
    [v10 setBlurred:1];
  }
  else
  {
    id v12 = objc_alloc(MEMORY[0x263F307D0]);
    v13 = [(CFXViewfinderFlipTransition *)self viewfinderView];
    v10 = (void *)[v12 initWithView:v13 desiredAspectRatio:4];

    v14 = [v10 layer];
    [v14 setDoubleSided:0];

    [v40 addSubview:v10];
  }
  if (!v11)
  {
    id v15 = objc_alloc(MEMORY[0x263F307D0]);
    double v16 = [(CFXViewfinderFlipTransition *)self viewfinderView];
    v11 = (void *)[v15 initWithView:v16 desiredAspectRatio:4];

    v17 = [v11 layer];
    [v17 setDoubleSided:0];

    long long v18 = [v11 layer];
    [v18 setMasksToBounds:1];

    [v11 setBlurred:1];
    [v11 setDimmed:1];
    [v40 insertSubview:v11 aboveSubview:v10];
  }
  double v46 = 0.0;
  *(void *)&v47[0] = 0;
  if (v10 && v11)
  {
    long long v19 = [v10 layer];
    long long v20 = [v19 animationForKey:@"rotationAnimation"];
    [(CFXViewfinderFlipTransition *)self _getCurrentRadians:v47 targetRadians:&v46 forDirection:a3 withAnimation:v20 onFrontSnapshotLayer:v19];

    double v21 = v46;
    double v22 = *(double *)v47;
  }
  else
  {
    double v22 = 0.0;
    [(CFXViewfinderFlipTransition *)self _frontSnapshotTargetRadiansForDirection:a3 fromRadians:0.0];
    double v21 = v23;
    double v46 = v23;
  }
  v24 = [(CFXViewfinderFlipTransition *)self _snapshotFlipAnimationFromValue:v22 toValue:v21];
  [v24 setRemovedOnCompletion:0];
  [(CFXViewfinderFlipTransition *)self _backSnapshotTargetRadiansForDirection:a3 frontSnapshotRadians:*(double *)v47];
  double v26 = v25;
  [(CFXViewfinderFlipTransition *)self _backSnapshotTargetRadiansForDirection:a3 frontSnapshotRadians:v46];
  v28 = [(CFXViewfinderFlipTransition *)self _snapshotFlipAnimationFromValue:v26 toValue:v27];
  [v28 setRemovedOnCompletion:0];
  [v24 duration];
  double v30 = v29;
  v31 = [v24 timingFunction];
  v32 = [MEMORY[0x263F157D8] animationWithKeyPath:@"transform.scale.xy"];
  [v32 setValues:&unk_26E801EF0];
  [v32 setKeyTimes:&unk_26E801F08];
  [v32 setFillMode:*MEMORY[0x263F15AA8]];
  [v32 setRemovedOnCompletion:0];
  v52[0] = v31;
  v52[1] = v31;
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:2];
  [v32 setTimingFunctions:v33];

  [v32 setDuration:v30];
  v34 = [(CFXViewfinderFlipTransition *)self viewfinderView];
  [v34 setHidden:1];

  v35 = (void *)([(CFXViewfinderFlipTransition *)self _currentAnimationID] + 1);
  [(CFXViewfinderFlipTransition *)self _setCurrentAnimationID:v35];
  if (v39)
  {
    objc_initWeak(&location, self);
    v36 = objc_alloc_init(CFXAnimationDelegate);
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __84__CFXViewfinderFlipTransition_performFlipTransitionWithDirection_completionHandler___block_invoke;
    v42[3] = &unk_264C09FF8;
    objc_copyWeak(v44, &location);
    v44[1] = v35;
    id v43 = v39;
    [(CFXAnimationDelegate *)v36 setCompletion:v42];
    [v24 setDelegate:v36];

    objc_destroyWeak(v44);
    objc_destroyWeak(&location);
  }
  v37 = [v10 layer];
  v38 = [v11 layer];
  [v37 addAnimation:v24 forKey:@"rotationAnimation"];
  [v38 addAnimation:v28 forKey:@"rotationAnimation"];
  [v41 addAnimation:v32 forKey:@"flipContainerAnimation"];
  [(CFXViewfinderFlipTransition *)self _setFrontSnapshotView:v10];
  [(CFXViewfinderFlipTransition *)self _setBackSnapshotView:v11];
}

void __84__CFXViewfinderFlipTransition_performFlipTransitionWithDirection_completionHandler___block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 40));
  id v2 = objc_loadWeakRetained(&to);
  uint64_t v3 = [v2 _currentAnimationID];

  id v4 = objc_loadWeakRetained(&to);
  if (!v4 || (uint64_t v5 = *(void *)(a1 + 48), v4, v3 == v5)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  objc_destroyWeak(&to);
}

- (void)_getCurrentRadians:(double *)a3 targetRadians:(double *)a4 forDirection:(int64_t)a5 withAnimation:(id)a6 onFrontSnapshotLayer:(id)a7
{
  if (a3 && a4)
  {
    id v12 = a7;
    id v13 = a6;
    [v12 convertTime:0 fromLayer:CACurrentMediaTime()];
    double v15 = v14;

    [v13 beginTime];
    double v17 = v15 - v16;
    [v13 duration];
    float v19 = v17 / v18;
    if (v19 > 1.0) {
      float v19 = 1.0;
    }
    float v20 = fmaxf(v19, 0.0);
    id v31 = [v13 timingFunction];
    *(float *)&double v21 = v20;
    [v31 _solveForInput:v21];
    float v23 = v22;
    v24 = [v13 toValue];
    [v24 floatValue];
    double v26 = v25;

    double v27 = [v13 fromValue];

    [v27 floatValue];
    double v29 = v28;

    *a3 = v29 + (v26 - v29) * v23;
    [(CFXViewfinderFlipTransition *)self _frontSnapshotTargetRadiansForDirection:a5 fromRadians:v26];
    *(void *)a4 = v30;
  }
}

- (double)_frontSnapshotTargetRadiansForDirection:(int64_t)a3 fromRadians:(double)a4
{
  if (a3 == 1)
  {
    double v5 = -3.14159265;
    return a4 + v5;
  }
  double v4 = 0.0;
  if (!a3)
  {
    double v5 = 3.14159265;
    return a4 + v5;
  }
  return v4;
}

- (double)_backSnapshotTargetRadiansForDirection:(int64_t)a3 frontSnapshotRadians:(double)a4
{
  if (a3 == 1)
  {
    double v5 = -3.14159265;
    return a4 + v5;
  }
  double v4 = 0.0;
  if (!a3)
  {
    double v5 = 3.14159265;
    return a4 + v5;
  }
  return v4;
}

- (id)_snapshotFlipAnimationFromValue:(double)a3 toValue:(double)a4
{
  long long v6 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation.y"];
  UIAnimationDragCoefficient();
  [v6 setDuration:v7 * 0.32];
  LODWORD(v8) = 1054280253;
  LODWORD(v9) = 1058306785;
  LODWORD(v10) = 1.0;
  v11 = [MEMORY[0x263F15808] functionWithControlPoints:v8 :0.0 :v9 :v10];
  [v6 setTimingFunction:v11];

  [v6 setFillMode:*MEMORY[0x263F15AA8]];
  id v12 = [NSNumber numberWithDouble:a3];
  [v6 setFromValue:v12];

  id v13 = [NSNumber numberWithDouble:a4];
  [v6 setToValue:v13];

  return v6;
}

- (void)completeTransitionToLivePreviewWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(CFXViewfinderFlipTransition *)self _cleanupFromFlipTransition];
  double v5 = [(CFXViewfinderFlipTransition *)self viewfinderView];
  long long v6 = [v5 superview];

  float v7 = [(CFXViewfinderFlipTransition *)self _backSnapshotView];
  id v8 = objc_alloc(MEMORY[0x263F307D0]);
  double v9 = [(CFXViewfinderFlipTransition *)self viewfinderView];
  double v10 = (void *)[v8 initWithView:v9 desiredAspectRatio:4];

  [v6 insertSubview:v10 belowSubview:v7];
  [v10 setBlurred:1];
  v11 = [v7 layer];
  LODWORD(v12) = 1036831949;
  LODWORD(v13) = 0.25;
  LODWORD(v14) = 0.25;
  LODWORD(v15) = 1.0;
  double v16 = [MEMORY[0x263F15808] functionWithControlPoints:v13 :v12 :v14 :v15];
  double v17 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v17 setFromValue:&unk_26E801E30];
  [v17 setToValue:&unk_26E801E50];
  UIAnimationDragCoefficient();
  [v17 setDuration:v18 * 0.3268];
  [v17 setTimingFunction:v16];
  objc_initWeak(&location, v7);
  objc_initWeak(&from, v10);
  [(CFXViewfinderFlipTransition *)self _setBackSnapshotView:0];
  [(CFXViewfinderFlipTransition *)self _setTargetSnapshotView:0];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __84__CFXViewfinderFlipTransition_completeTransitionToLivePreviewWithCompletionHandler___block_invoke;
  v20[3] = &unk_264C0A020;
  objc_copyWeak(&v22, &location);
  objc_copyWeak(&v23, &from);
  id v19 = v4;
  id v21 = v19;
  [v10 setBlurred:0 animated:1 style:1 withCompletionBlock:v20];
  [v11 addAnimation:v17 forKey:@"opacityAnimation"];
  [v11 setOpacity:0.0];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

uint64_t __84__CFXViewfinderFlipTransition_completeTransitionToLivePreviewWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained removeFromSuperview];

  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  [v3 removeFromSuperview];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    double v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (UIView)viewfinderView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewfinderView);
  return (UIView *)WeakRetained;
}

- (void)setViewfinderView:(id)a3
{
}

- (CAMSnapshotView)_frontSnapshotView
{
  return self->__frontSnapshotView;
}

- (void)_setFrontSnapshotView:(id)a3
{
}

- (CAMSnapshotView)_backSnapshotView
{
  return self->__backSnapshotView;
}

- (void)_setBackSnapshotView:(id)a3
{
}

- (CAMSnapshotView)_targetSnapshotView
{
  return self->__targetSnapshotView;
}

- (void)_setTargetSnapshotView:(id)a3
{
}

- (unint64_t)_currentAnimationID
{
  return self->__currentAnimationID;
}

- (void)_setCurrentAnimationID:(unint64_t)a3
{
  self->__currentAnimationID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__targetSnapshotView, 0);
  objc_storeStrong((id *)&self->__backSnapshotView, 0);
  objc_storeStrong((id *)&self->__frontSnapshotView, 0);
  objc_destroyWeak((id *)&self->_viewfinderView);
}

@end