@interface PKRulerController
+ (id)sharedRulerView;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (CGAffineTransform)ensureRulerTransformIsFullyOnscreen:(_OWORD *)a3@<X8>;
- (double)_rulerFrame;
- (double)defaultRulerTransform;
- (double)pixelSnapRulerTransform:(_OWORD *)a3@<X8>;
- (double)rulerTransform;
- (float64x2_t)applyTransformToTouchLocation:(__n128)a3;
- (id)_viewForHostingRuler;
- (id)adjustFrames;
- (id)initWithDelegate:(id *)a1;
- (uint64_t)_enableRulerOnCanvasIfSharedRulerIsVisible;
- (uint64_t)drawingCancelled:(uint64_t)result;
- (uint64_t)getRulerCenterTValueOnScreenForTransform:(uint64_t)result;
- (uint64_t)resetRulerTransform;
- (uint64_t)rulerSelected;
- (void)_adjustViewForHostingRulerView;
- (void)_configureRuler;
- (void)canvasTransform;
- (void)dealloc;
- (void)drawingBegan:(double)a3 coordinateSystem:(double)a4;
- (void)drawingEnded;
- (void)drawingMoved:(double)a3 coordinateSystem:(double)a4;
- (void)ensureRulerIsFullyOnscreen;
- (void)hideRulerAnimated:(uint64_t)a1;
- (void)resetRulerTouches;
- (void)rulerMoveGesture:(id)a3;
- (void)setRulerHostingDelegate:(uint64_t)a1;
- (void)setSnapImpactBehavior:(uint64_t)a1;
- (void)showRuler;
- (void)startRulerDrawing;
@end

@implementation PKRulerController

- (void)ensureRulerIsFullyOnscreen
{
  if (a1)
  {
    id v2 = *(id *)(a1 + 64);
    id v3 = *(id *)(a1 + 64);
    v4 = v3;
    if (v3) {
      [v3 rulerTransform];
    }
    else {
      memset(v5, 0, sizeof(v5));
    }
    objc_msgSend(v2, "setRulerTransform:", v6, -[PKRulerController pixelSnapRulerTransform:]((CGAffineTransform *)a1, (uint64_t)v5, v6));
  }
}

- (double)pixelSnapRulerTransform:(_OWORD *)a3@<X8>
{
  if (a1)
  {
    long long v6 = *(_OWORD *)(a2 + 16);
    v17[0] = *(_OWORD *)a2;
    v17[1] = v6;
    v17[2] = *(_OWORD *)(a2 + 32);
    [(PKRulerController *)a1 ensureRulerTransformIsFullyOnscreen:&v18];
    long long v7 = *(_OWORD *)&v18.c;
    *(_OWORD *)a2 = *(_OWORD *)&v18.a;
    *(_OWORD *)(a2 + 16) = v7;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&v18.tx;
    long long v8 = *(_OWORD *)(a2 + 16);
    v16[0] = *(_OWORD *)a2;
    v16[1] = v8;
    v16[2] = *(_OWORD *)(a2 + 32);
    -[PKRulerController getRulerCenterTValueOnScreenForTransform:]((uint64_t)a1, (double *)v16);
    long long v10 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&v15.a = *(_OWORD *)a2;
    *(_OWORD *)&v15.c = v10;
    *(_OWORD *)&v15.tx = *(_OWORD *)(a2 + 32);
    CGAffineTransformTranslate(&v18, &v15, floor((v9 + -0.5) * 4000.0 / 50.0) * 50.0, 0.0);
    long long v11 = *(_OWORD *)&v18.c;
    *(_OWORD *)a2 = *(_OWORD *)&v18.a;
    *(_OWORD *)(a2 + 16) = v11;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&v18.tx;
    long long v12 = *(_OWORD *)(a2 + 16);
    *(float64x2_t *)(a2 + 32) = vrndaq_f64(*(float64x2_t *)(a2 + 32));
    *a3 = *(_OWORD *)a2;
    a3[1] = v12;
    long long v13 = *(_OWORD *)(a2 + 32);
    a3[2] = v13;
  }
  else
  {
    *(void *)&long long v13 = 0;
    a3[1] = 0u;
    a3[2] = 0u;
    *a3 = 0u;
  }
  return *(double *)&v13;
}

- (uint64_t)getRulerCenterTValueOnScreenForTransform:(uint64_t)result
{
  v22[4] = *(double *)MEMORY[0x1E4F143B8];
  if (result)
  {
    double v2 = a2[1];
    double v3 = a2[4];
    double v4 = a2[5];
    double v5 = a2[2] * 0.0;
    double v6 = a2[3] * 0.0;
    double v7 = v3 + v5 + *a2 * 2000.0;
    v22[0] = v3 + v5 + *a2 * -2000.0;
    v22[1] = v4 + v6 + v2 * -2000.0;
    v22[2] = v7;
    v22[3] = v4 + v6 + v2 * 2000.0;
    [*(id *)(result + 56) bounds];
    CGFloat x = v23.origin.x;
    CGFloat y = v23.origin.y;
    CGFloat width = v23.size.width;
    CGFloat height = v23.size.height;
    v21[0] = CGRectGetMinX(v23);
    v24.origin.CGFloat x = x;
    v24.origin.CGFloat y = y;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    v21[1] = CGRectGetMinY(v24);
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    v21[2] = CGRectGetMaxX(v25);
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    v21[3] = CGRectGetMinY(v26);
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = height;
    v20[0] = CGRectGetMinX(v27);
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    v20[1] = CGRectGetMaxY(v28);
    v29.origin.CGFloat x = x;
    v29.origin.CGFloat y = y;
    v29.size.CGFloat width = width;
    v29.size.CGFloat height = height;
    v20[2] = CGRectGetMaxX(v29);
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    v20[3] = CGRectGetMaxY(v30);
    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    v19[0] = CGRectGetMinX(v31);
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    v19[1] = CGRectGetMinY(v32);
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = height;
    v19[2] = CGRectGetMinX(v33);
    v34.origin.CGFloat x = x;
    v34.origin.CGFloat y = y;
    v34.size.CGFloat width = width;
    v34.size.CGFloat height = height;
    v19[3] = CGRectGetMaxY(v34);
    v35.origin.CGFloat x = x;
    v35.origin.CGFloat y = y;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = height;
    v18[0] = CGRectGetMaxX(v35);
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = height;
    v18[1] = CGRectGetMinY(v36);
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = height;
    v18[2] = CGRectGetMaxX(v37);
    v38.origin.CGFloat x = x;
    v38.origin.CGFloat y = y;
    v38.size.CGFloat width = width;
    v38.size.CGFloat height = height;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    v18[3] = CGRectGetMaxY(v38);
    *(void *)&v16[2] = v20;
    *(void *)&_OWORD v16[3] = v19;
    *(void *)&v16[4] = v18;
    for (i = (double *)v21; ; i = *(double **)&v16[v12 + 1])
    {
      result = DKDIntersectionOfLines(v22, i, (double *)&v18[v13], v16, &v15, 0, 1);
      if (!result) {
        goto LABEL_7;
      }
      if (v13) {
        break;
      }
      if (++v12 == 4) {
        return result;
      }
      uint64_t v13 = 1;
LABEL_8:
      ;
    }
    if (vabdd_f64(*(double *)&v18[v13], v17) >= 0.00999999978) {
      return result;
    }
    uint64_t v13 = 1;
LABEL_7:
    if (++v12 == 4) {
      return result;
    }
    goto LABEL_8;
  }
  return result;
}

- (CGAffineTransform)ensureRulerTransformIsFullyOnscreen:(_OWORD *)a3@<X8>
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    double v5 = result;
    -[PKRulerController _adjustViewForHostingRulerView]((id *)result);
    double v6 = a2[1];
    double v7 = a2[4];
    double v8 = a2[5];
    double v9 = a2[2] * 0.0;
    double v10 = v7 + v9 + *a2 * 0.0;
    double v11 = a2[3] * 0.0;
    double v12 = v8 + v11 + v6 * 0.0;
    double v56 = v8 + v6 + v11;
    double v57 = v7 + *a2 + v9;
    [*(id *)&v5[1].b bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [*(id *)&v5[1].b safeAreaInsets];
    CGFloat v22 = v16 + v21;
    CGFloat v25 = v18 - (v23 + v24);
    v64.size.double height = v20 - (v21 + v26);
    v64.origin.double x = v14 + v23;
    v64.origin.double y = v22;
    v64.size.double width = v25;
    CGRect v65 = CGRectInset(v64, 10.0, 10.0);
    double x = v65.origin.x;
    double y = v65.origin.y;
    double width = v65.size.width;
    double height = v65.size.height;
    CGFloat MinX = CGRectGetMinX(v65);
    v66.origin.double x = x;
    v66.origin.double y = y;
    v66.size.double width = width;
    v66.size.double height = height;
    CGFloat MinY = CGRectGetMinY(v66);
    v67.origin.double x = x;
    v67.origin.double y = y;
    v67.size.double width = width;
    v67.size.double height = height;
    CGFloat MaxX = CGRectGetMaxX(v67);
    v68.origin.double x = x;
    v68.origin.double y = y;
    v68.size.double width = width;
    v68.size.double height = height;
    CGFloat v52 = CGRectGetMinY(v68);
    v69.origin.double x = x;
    v69.origin.double y = y;
    v69.size.double width = width;
    v69.size.double height = height;
    CGFloat v51 = CGRectGetMaxX(v69);
    v70.origin.double x = x;
    v70.origin.double y = y;
    v70.size.double width = width;
    v70.size.double height = height;
    CGFloat MaxY = CGRectGetMaxY(v70);
    v71.origin.double x = x;
    v71.origin.double y = y;
    v71.size.double width = width;
    v71.size.double height = height;
    CGFloat v32 = CGRectGetMinX(v71);
    v72.origin.double x = x;
    v72.origin.double y = y;
    v72.size.double width = width;
    v72.size.double height = height;
    CGFloat v33 = CGRectGetMaxY(v72);
    uint64_t v34 = 0;
    double v35 = *MEMORY[0x1E4F1DAD8];
    double v36 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    v60.a = MinX;
    v60.b = MinY;
    v60.c = MaxX;
    v60.d = v52;
    v60.tdouble x = v32;
    v60.tdouble y = v33;
    CGFloat v61 = v51;
    CGFloat v62 = MaxY;
    double v37 = 1.0 / sqrt((v56 - v12) * (v56 - v12) + (v57 - v10) * (v57 - v10));
    double v38 = (v57 - v10) * v37;
    double v39 = (v56 - v12) * v37;
    double v40 = 1.79769313e308;
    do
    {
      double v41 = v39 * (*(double *)((char *)&v60.b + v34) - v12) + (*(double *)((char *)&v60.a + v34) - v10) * v38;
      double v42 = v10 + v38 * v41;
      double v43 = x;
      if (v42 >= x)
      {
        double v43 = v10 + v38 * v41;
        if (v42 > x + width) {
          double v43 = x + width;
        }
      }
      double v44 = v12 + v39 * v41;
      double v45 = y;
      if (v44 >= y)
      {
        double v45 = v44;
        if (v44 > y + height) {
          double v45 = y + height;
        }
      }
      double v46 = v43 - v42;
      double v47 = v45 - v44;
      if (v47 * v47 + v46 * v46 < v40)
      {
        double v40 = v47 * v47 + v46 * v46;
        double v36 = v45 - v44;
        double v35 = v46;
      }
      v34 += 16;
    }
    while (v34 != 64);
    long long v48 = *((_OWORD *)a2 + 1);
    *(_OWORD *)&t1.a = *(_OWORD *)a2;
    *(_OWORD *)&t1.c = v48;
    *(_OWORD *)&t1.tdouble x = *((_OWORD *)a2 + 2);
    CGAffineTransformMakeTranslation(&t2, v35, v36);
    result = CGAffineTransformConcat(&v60, &t1, &t2);
    long long v49 = *(_OWORD *)&v60.c;
    *(_OWORD *)a2 = *(_OWORD *)&v60.a;
    *((_OWORD *)a2 + 1) = v49;
    *((_OWORD *)a2 + 2) = *(_OWORD *)&v60.tx;
    long long v50 = *((_OWORD *)a2 + 1);
    *a3 = *(_OWORD *)a2;
    a3[1] = v50;
    a3[2] = *((_OWORD *)a2 + 2);
  }
  else
  {
    a3[1] = 0u;
    a3[2] = 0u;
    *a3 = 0u;
  }
  return result;
}

- (uint64_t)_enableRulerOnCanvasIfSharedRulerIsVisible
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a1 || !*(unsigned char *)(a1 + 16)) {
    return 0;
  }
  +[PKRulerController sharedRulerView]();
  double v2 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  double v3 = [v2 superview];
  double v4 = -[PKRulerController _viewForHostingRuler]((id *)a1);

  if (v3 != v4 || v2 && v2[408])
  {
    uint64_t v5 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained setRulerEnabled:1];

    uint64_t v5 = 1;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v6 = -[PKRulerController _viewForHostingRuler]((id *)a1);
  double v7 = objc_msgSend(v6, "subviews", 0);
  double v8 = (void *)[v7 copy];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        double v12 = *(unsigned char **)(*((void *)&v15 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & (v12 != v2)) == 1) {
          [v12 removeFromSuperview];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v5;
}

- (void)_adjustViewForHostingRulerView
{
  -[PKRulerController _viewForHostingRuler](a1);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [a1[7] superview];

  if (v3 != v2)
  {
    [a1[7] removeFromSuperview];
    [v3 addSubview:a1[7]];
  }
  [v3 bringSubviewToFront:a1[7]];
  [a1[7] setFrame:-[PKRulerController _rulerFrame](a1)];
}

- (double)_rulerFrame
{
  if (!a1) {
    return 0.0;
  }
  v1 = -[PKRulerController _viewForHostingRuler](a1);
  double v2 = *MEMORY[0x1E4F1DAD8];
  [v1 bounds];

  return v2;
}

- (id)_viewForHostingRuler
{
  v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 1);
    id v3 = WeakRetained;
    if (WeakRetained)
    {
      v1 = (id *)WeakRetained;
    }
    else
    {
      id v4 = objc_loadWeakRetained(v1 + 5);
      v1 = [v4 topView];
    }
  }

  return v1;
}

+ (id)sharedRulerView
{
  self;
  if (_MergedGlobals_137 != -1) {
    dispatch_once(&_MergedGlobals_137, &__block_literal_global_44);
  }
  v0 = (void *)qword_1EB3C5FD0;

  return v0;
}

- (void)setRulerHostingDelegate:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v15 = v3;
    id v4 = objc_storeWeak((id *)(a1 + 48), v3);
    if (v15)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      char v6 = objc_opt_respondsToSelector();

      if (v6)
      {
        id v7 = objc_loadWeakRetained((id *)(a1 + 48));
        double v8 = [v7 rulerHostingView];

        if (v8) {
          uint64_t v9 = v8;
        }
        else {
          uint64_t v9 = 0;
        }
        objc_storeWeak((id *)(a1 + 8), v9);
      }
    }
    id v10 = objc_loadWeakRetained((id *)(a1 + 48));
    if (v10
      && (uint64_t v11 = v10,
          id v12 = objc_loadWeakRetained((id *)(a1 + 48)),
          char v13 = objc_opt_respondsToSelector(),
          v12,
          v11,
          (v13 & 1) != 0))
    {
      id v14 = objc_loadWeakRetained((id *)(a1 + 48));
      *(unsigned char *)(a1 + 16) = [v14 rulerHostWantsSharedRuler];
    }
    else
    {
      *(unsigned char *)(a1 + 16) = 1;
    }
    -[PKRulerController _enableRulerOnCanvasIfSharedRulerIsVisible](a1);
    id v3 = v15;
  }
}

- (id)initWithDelegate:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)PKRulerController;
    id v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4) {
      objc_storeWeak(v4 + 5, v3);
    }
  }

  return a1;
}

void __36__PKRulerController_sharedRulerView__block_invoke()
{
  v0 = objc_alloc_init(PKRulerView);
  v1 = (void *)qword_1EB3C5FD0;
  qword_1EB3C5FD0 = (uint64_t)v0;

  id v3 = [[PKRulerLayer alloc] initWithRulerController:0];
  -[PKRulerView setRulerLayer:](qword_1EB3C5FD0, v3);
  double v2 = [(id)qword_1EB3C5FD0 layer];
  [v2 addSublayer:v3];
}

- (void)_configureRuler
{
  if (!a1) {
    return;
  }
  if (*(unsigned char *)(a1 + 16))
  {
    +[PKRulerController sharedRulerView]();
    double v2 = (PKRulerView *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(a1 + 56), v2);
    if (v2 && (id v3 = v2->_rulerLayer) != 0)
    {
      id v4 = v3;
      uint64_t v5 = *(PKRulerLayer **)(a1 + 64);
      *(void *)(a1 + 64) = v4;
    }
    else
    {
      uint64_t v5 = [[PKRulerLayer alloc] initWithRulerController:0];
      -[PKRulerView setRulerLayer:]((uint64_t)v2, v5);
      double v8 = [(PKRulerView *)v2 layer];
      [v8 addSublayer:v5];

      if (v2) {
        rulerLayer = v2->_rulerLayer;
      }
      else {
        rulerLayer = 0;
      }
      objc_storeStrong((id *)(a1 + 64), rulerLayer);
    }
    goto LABEL_12;
  }
  id v7 = (void **)(a1 + 64);
  objc_super v6 = *(void **)(a1 + 64);
  if (!v6)
  {
    double v2 = objc_alloc_init(PKRulerView);
    objc_storeStrong((id *)(a1 + 56), v2);
    uint64_t v5 = [[PKRulerLayer alloc] initWithRulerController:a1];
    objc_storeStrong((id *)(a1 + 64), v5);
    -[PKRulerView setRulerLayer:](*(void *)(a1 + 56), *v7);
    id v10 = [*(id *)(a1 + 56) layer];
    [v10 addSublayer:v5];

LABEL_12:
    objc_super v6 = *(void **)(a1 + 64);
    long long v16 = v2;
    goto LABEL_13;
  }
  long long v16 = 0;
LABEL_13:
  [v6 setRulerController:a1];
  [*(id *)(a1 + 64) setFrame:-[PKRulerController _rulerFrame]((id *)a1)];
  [*(id *)(a1 + 56) setFrame:-[PKRulerController _rulerFrame]((id *)a1)];
  if (!*(void *)(a1 + 32))
  {
    uint64_t v11 = [[PKRulerGestureRecognizer alloc] initWithTarget:a1 action:sel_rulerMoveGesture_];
    id v12 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v11;

    [*(id *)(a1 + 32) setCancelThreshold:15.0];
    [*(id *)(a1 + 32) setStartDelay:0.4];
    [*(id *)(a1 + 32) setDelegate:a1];
    [*(id *)(a1 + 32) setAllowedTouchTypes:&unk_1F200ECA0];
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(id *)(a1 + 56);
    [v14 addGestureRecognizer:v13];

    id v15 = [[PKRulerGestureRecognizer alloc] initWithTarget:a1 action:sel_eatPencilGesture_];
    [(PKFreeTransformGestureRecognizer *)v15 setCancelThreshold:15.0];
    [(PKRulerGestureRecognizer *)v15 setStartDelay:0.4];
    [(PKRulerGestureRecognizer *)v15 setDelegate:a1];
    [(PKRulerGestureRecognizer *)v15 setAllowedTouchTypes:&unk_1F200ECB8];
    [*(id *)(a1 + 56) addGestureRecognizer:v15];
  }
  -[PKRulerController _adjustViewForHostingRulerView]((id *)a1);
}

- (uint64_t)rulerSelected
{
  if (result)
  {
    if (*(unsigned char *)(result + 16))
    {
      return -[PKRulerController _enableRulerOnCanvasIfSharedRulerIsVisible](result);
    }
    else
    {
      uint64_t v1 = *(void *)(result + 56);
      return v1 && *(unsigned __int8 *)(v1 + 408) == 0;
    }
  }
  return result;
}

- (void)dealloc
{
  if (!self->_wantsSharedRuler) {
    [(PKRulerView *)self->_rulerView removeFromSuperview];
  }
  v3.receiver = self;
  v3.super_class = (Class)PKRulerController;
  [(PKRulerController *)&v3 dealloc];
}

- (id)adjustFrames
{
  if (result)
  {
    uint64_t v1 = result;
    [result[8] setFrame:-[PKRulerController _rulerFrame](result)];
    [v1[8] frame];
    id v2 = v1[7];
    return (id *)objc_msgSend(v2, "setFrame:");
  }
  return result;
}

- (void)showRuler
{
  if (a1)
  {
    -[PKRulerController _configureRuler](a1);
    -[PKRulerController adjustFrames]((id *)a1);
    [*(id *)(a1 + 64) showRuler];
    -[PKRulerController ensureRulerIsFullyOnscreen](a1);
    uint64_t v2 = *(void *)(a1 + 56);
    if (v2) {
      *(unsigned char *)(v2 + 408) = 0;
    }
    [*(id *)(a1 + 32) setStartDelay:0.0];
    [*(id *)(a1 + 32) setStartThreshold:0.0];
    [*(id *)(a1 + 32) setStartSnapThreshold:10.0];
    [*(id *)(a1 + 32) setAllowSingleTouchDrag:1];
    UIAccessibilityNotifications v3 = *MEMORY[0x1E4FB2470];
    id v4 = *(void **)(a1 + 64);
    UIAccessibilityPostNotification(v3, v4);
  }
}

- (void)hideRulerAnimated:(uint64_t)a1
{
  if (a1)
  {
    [*(id *)(a1 + 64) hideRulerAnimated:a2];
    uint64_t v3 = *(void *)(a1 + 56);
    if (v3) {
      *(unsigned char *)(v3 + 408) = 1;
    }
    *(unsigned char *)(a1 + 19) = 0;
    [*(id *)(a1 + 32) setStartDelay:0.4];
    [*(id *)(a1 + 32) setStartThreshold:1.79769313e308];
    [*(id *)(a1 + 32) setAllowSingleTouchDrag:0];
    UIAccessibilityNotifications v4 = *MEMORY[0x1E4FB2470];
    UIAccessibilityPostNotification(v4, 0);
  }
}

- (double)defaultRulerTransform
{
  if (a1)
  {
    CGAffineTransformMakeRotation(&v5, 0.785398163);
    return [(PKRulerController *)a1 pixelSnapRulerTransform:a2];
  }
  else
  {
    double result = 0.0;
    a2[1] = 0u;
    a2[2] = 0u;
    *a2 = 0u;
  }
  return result;
}

- (uint64_t)resetRulerTransform
{
  if (result)
  {
    uint64_t v1 = result;
    id v2 = *(id *)(result + 64);
    uint64_t v3 = v2;
    if (v2)
    {
      [v2 rulerTransform];
    }
    else
    {
      long long v7 = 0u;
      long long v8 = 0u;
      long long v6 = 0u;
    }
    *(_OWORD *)(v1 + 112) = v6;
    *(_OWORD *)(v1 + 128) = v7;
    *(_OWORD *)(v1 + 144) = v8;

    double result = [*(id *)(v1 + 64) rulerAlpha];
    if (v4 < 1.0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v1 + 40));
      [WeakRetained setRulerEnabled:0];

      -[PKRulerController hideRulerAnimated:](v1, 1);
      [*(id *)(v1 + 32) setEnabled:0];
      return [*(id *)(v1 + 32) setEnabled:1];
    }
  }
  return result;
}

- (float64x2_t)applyTransformToTouchLocation:(__n128)a3
{
  __n128 v6 = a3;
  float64x2_t result = 0uLL;
  if (a1)
  {
    memset(&v9, 0, sizeof(v9));
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    CGAffineTransform v5 = WeakRetained;
    if (WeakRetained) {
      objc_msgSend(WeakRetained, "strokeTransform", *(_OWORD *)&v6);
    }
    else {
      memset(&v8, 0, sizeof(v8));
    }
    CGAffineTransformInvert(&v9, &v8);

    return vaddq_f64(*(float64x2_t *)&v9.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v9.c, v6.n128_f64[0]), *(float64x2_t *)&v9.a, a2));
  }
  return result;
}

- (void)drawingBegan:(double)a3 coordinateSystem:(double)a4
{
  id v9 = a2;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 16)) {
      -[PKRulerController _configureRuler](a1);
    }
    -[PKRulerController startRulerDrawing]((id *)a1);
    objc_msgSend(v9, "convertPoint:toCoordinateSpace:", *(void *)(a1 + 56), a3, a4);
    objc_msgSend(*(id *)(a1 + 64), "updateRulerMarkerForLocation:firstTouch:", 1, -[PKRulerController applyTransformToTouchLocation:](a1, v7, v8).f64[0]);
  }
}

- (void)startRulerDrawing
{
  if (a1)
  {
    id v2 = a1[8];
    if (v2)
    {
      id v3 = v2;
      [v3 rulerTransform];

      memset(v31, 0, sizeof(v31));
      id WeakRetained = objc_loadWeakRetained(a1 + 5);
      CGAffineTransform v5 = [WeakRetained topView];

      id v6 = a1[7];
      double v7 = [v6 superview];
      if (v7 == v5)
      {
        long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)&v31[0].a = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&v31[0].c = v12;
        *(_OWORD *)&v31[0].tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      }
      else
      {
        objc_msgSend(v5, "convertRect:fromView:", v6, 0.0, 0.0, 100.0, 100.0);
        DKDTransformConvertingRectToRectAtPercent((uint64_t)v31, 0.0, 0.0, 100.0, 100.0, v8, v9, v10, v11, 1.0);
      }

      CGAffineTransform t1 = v31[1];
      CGAffineTransform t2 = v31[0];
      CGAffineTransformConcat(&v30, &t1, &t2);
      v31[1] = v30;
      memset(&v30, 0, sizeof(v30));
      id v13 = objc_loadWeakRetained(a1 + 5);
      id v14 = v13;
      if (v13) {
        [v13 strokeTransform];
      }
      else {
        memset(&v27, 0, sizeof(v27));
      }
      CGAffineTransformInvert(&v30, &v27);

      CGAffineTransform v25 = v31[1];
      CGAffineTransform v24 = v30;
      CGAffineTransformConcat(&v26, &v25, &v24);
      v31[1] = v26;
      id v15 = objc_loadWeakRetained(a1 + 5);
      long long v16 = [v15 drawingController];
      long long v17 = -[PKController inputController](v16);
      CGAffineTransform v23 = v31[1];
      id v18 = a1[8];
      [v18 rulerWidth];
      double v20 = v19;
      id v21 = a1[8];
      [v21 rulerAlignInset];
      [v17 allowSnappingToRuler:&v23 width:v20 - v22];
    }
  }
}

- (void)drawingMoved:(double)a3 coordinateSystem:(double)a4
{
  id v7 = a2;
  if (a1)
  {
    id v17 = v7;
    objc_msgSend(v7, "convertPoint:toCoordinateSpace:", *(void *)(a1 + 56), a3, a4);
    objc_msgSend(*(id *)(a1 + 64), "updateRulerMarkerForLocation:firstTouch:", 0, -[PKRulerController applyTransformToTouchLocation:](a1, v8, v9).f64[0]);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    double v11 = [WeakRetained drawingController];
    long long v12 = -[PKController inputController](v11);

    char v13 = [v12 lastPointIsMasked];
    char v14 = [v12 isSnappedToRuler];
    *(unsigned char *)(a1 + 21) = v13;
    if (*(unsigned char *)(a1 + 22)) {
      char v15 = 1;
    }
    else {
      char v15 = v13;
    }
    *(unsigned char *)(a1 + 22) = v15;
    if (*(unsigned char *)(a1 + 23)) {
      char v16 = 1;
    }
    else {
      char v16 = v14;
    }
    *(unsigned char *)(a1 + 23) = v16;

    id v7 = v17;
  }
}

- (void)drawingEnded
{
  if (a1)
  {
    -[PKRulerController resetRulerTouches](a1);
    [*(id *)(a1 + 64) removeRulerMarkers];
    int v2 = *(unsigned __int8 *)(a1 + 23);
    if (!*(unsigned char *)(a1 + 22))
    {
      if (!*(unsigned char *)(a1 + 23))
      {
LABEL_8:
        *(_WORD *)(a1 + 21) = 0;
        *(unsigned char *)(a1 + 23) = 0;
        return;
      }
      int v2 = 1;
    }
    BOOL v3 = v2 == 0;
    double v4 = +[PKStatisticsManager sharedStatisticsManager]();
    id v5 = *(id *)(a1 + 56);
    id v6 = v5;
    if (v5) {
      id v7 = (void *)*((void *)v5 + 52);
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;
    [v8 currentAngle];
    -[PKStatisticsManager recordRulerInteractionEndedWithType:angle:]((uint64_t)v4, v3);

    goto LABEL_8;
  }
}

- (uint64_t)drawingCancelled:(uint64_t)result
{
  if (result)
  {
    uint64_t v1 = result;
    -[PKRulerController resetRulerTouches](result);
    float64x2_t result = [*(id *)(v1 + 64) removeRulerMarkers];
    *(_WORD *)(v1 + 21) = 0;
    *(unsigned char *)(v1 + 23) = 0;
  }
  return result;
}

- (void)resetRulerTouches
{
  if (a1 && *(void *)(a1 + 64))
  {
    [*(id *)(a1 + 32) resetStartingTouches];
    id v2 = *(id *)(a1 + 64);
    BOOL v3 = v2;
    if (v2)
    {
      [v2 rulerTransform];
    }
    else
    {
      long long v5 = 0u;
      long long v6 = 0u;
      long long v4 = 0u;
    }
    *(_OWORD *)(a1 + 112) = v4;
    *(_OWORD *)(a1 + 128) = v5;
    *(_OWORD *)(a1 + 144) = v6;
  }
}

- (void)rulerMoveGesture:(id)a3
{
  id v4 = a3;
  if (self) {
    rulerView = self->_rulerView;
  }
  else {
    rulerView = 0;
  }
  long long v6 = rulerView;
  uint64_t v7 = [v4 state];
  if ((unint64_t)(v7 - 3) >= 2)
  {
    if (v7 != 1)
    {
      if (v7 != 2) {
        goto LABEL_108;
      }
LABEL_44:
      id v27 = v4;
      if (!self
        || (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
            char v29 = [WeakRetained isDrawing],
            WeakRetained,
            (v29 & 1) != 0))
      {
LABEL_107:

        goto LABEL_108;
      }
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setAnimationDuration:0.0];
      memset(&v104[1], 0, sizeof(CGAffineTransform));
      if (v27) {
        [v27 freeTransform];
      }
      CGAffineTransform v30 = self->_rulerView;
      v104[0] = v104[1];
      [(PKRulerView *)v30 frame];
      DKDTransformConvertForNewOrigin(v104, &v111, v31, v32);
      v104[1] = v111;
      CGAffineTransform v103 = v111;
      long long v33 = *(_OWORD *)&self->_rulerStartTransform.a;
      long long v34 = *(_OWORD *)&self->_rulerStartTransform.tx;
      v102[1] = *(_OWORD *)&self->_rulerStartTransform.c;
      v102[2] = v34;
      v102[0] = v33;
      DKDTransformInTransformSpace(&v103, v102, &v111);
      v104[1] = v111;
      double v35 = sqrt(v111.b * v111.b + v111.a * v111.a);
      double v36 = 1.0;
      if (v35 < 0.5)
      {
        double v36 = v35;
        if (v35 > 1.0) {
          double v36 = 1.0;
        }
      }
      [(PKRulerLayer *)self->_rulerLayer setRulerAlpha:v36];
      if (v27) {
        [v27 unscaledFreeTransform];
      }
      else {
        memset(&v111, 0, sizeof(v111));
      }
      v104[1] = v111;
      CGAffineTransform v101 = v111;
      [(PKRulerView *)v30 frame];
      DKDTransformConvertForNewOrigin(&v101, &v111, v37, v38);
      v104[1] = v111;
      CGAffineTransform v100 = v111;
      long long v39 = *(_OWORD *)&self->_rulerStartTransform.a;
      long long v40 = *(_OWORD *)&self->_rulerStartTransform.tx;
      v99[1] = *(_OWORD *)&self->_rulerStartTransform.c;
      v99[2] = v40;
      v99[0] = v39;
      DKDTransformInTransformSpace(&v100, v99, &v111);
      v104[1] = v111;
      CGAffineTransformScale(&v110, &v111, 1.0 / sqrt(v111.b * v111.b + v111.a * v111.a), 1.0 / sqrt(v111.d * v111.d + v111.c * v111.c));
      v104[1] = v110;
      [v27 locationInView:v30];
      CGFloat v42 = v41;
      CGFloat v44 = v43;
      CGAffineTransform t1 = v104[1];
      memset(&v98, 0, sizeof(v98));
      long long v45 = *(_OWORD *)&self->_rulerStartTransform.c;
      *(_OWORD *)&t2.a = *(_OWORD *)&self->_rulerStartTransform.a;
      *(_OWORD *)&t2.c = v45;
      *(_OWORD *)&t2.tdouble x = *(_OWORD *)&self->_rulerStartTransform.tx;
      CGAffineTransformConcat(&v98, &t1, &t2);
      CGAffineTransform v95 = v98;
      CGAffineTransform v110 = v98;
      memset(&v111, 0, sizeof(v111));
      DKDTransformConvertForNewOrigin(&v110, &v111, v42, v44);
      CGAffineTransform v109 = v111;
      long double v46 = DKDTransformAngle(&v109.a);
      double v47 = fmod(v46, 360.0);
      if (v46 <= 360.0 && v46 >= 0.0) {
        double v47 = v46;
      }
      if (v47 < 0.0) {
        double v47 = v47 + 360.0;
      }
      if (v47 == 0.0) {
        double v49 = 0.0;
      }
      else {
        double v49 = v47;
      }
      double v50 = round(v49 / 45.0) * 45.0;
      double v51 = fmod(v50, 360.0);
      if (v50 <= 360.0 && v50 >= 0.0) {
        double v51 = v50;
      }
      if (v51 < 0.0) {
        double v51 = v51 + 360.0;
      }
      if (v51 == 0.0) {
        double v53 = 0.0;
      }
      else {
        double v53 = v51;
      }
      double v54 = fmod(v49 - v53, 360.0);
      if (v54 > 180.0) {
        double v54 = v54 + -360.0;
      }
      double v55 = v54 + 360.0;
      if (v54 >= -180.0) {
        double v55 = v54;
      }
      unint64_t v56 = (unint64_t)(v55 < 0.0) << 32;
      double v57 = fabs(v55);
      uint64_t v58 = v56 | 2;
      if (v57 <= 5.0) {
        uint64_t v58 = (unint64_t)(v55 < 0.0) << 32;
      }
      uint64_t v59 = v56 | 1;
      if (v57 <= 12.5) {
        uint64_t v59 = v58;
      }
      double snapAngle = self->_rulerState.snapAngle;
      if (v53 != snapAngle)
      {
        self->_BOOL canRulerSnapToAngle = 1;
        *(void *)&self->_rulerState.arcType = v59;
        self->_rulerState.double snapAngle = v53;
        *(void *)&self->_previousRulerState.arcType = v59;
        self->_previousRulerState.double snapAngle = v53;
        if (!v59) {
          goto LABEL_84;
        }
LABEL_96:
        if (self->_rulerSnappedToAngle)
        {
          self->_rulerSnappedToAngle = 0;
          double v61 = 0.5;
          goto LABEL_98;
        }
LABEL_99:
        CGAffineTransform v98 = v95;
        CGRect v64 = [v27 touches];
        self->_rulerIsRotating = (unint64_t)[v64 count] > 1;

        CGRect v65 = self->_rulerLayer;
        CGAffineTransform v107 = v98;
        -[PKRulerLayer setRulerTransform:](v65, "setRulerTransform:", &v108, [(PKRulerController *)(CGAffineTransform *)self pixelSnapRulerTransform:&v108]);

        id v66 = v27;
        if (self->_rulerIsRotating)
        {
          memset(&v111, 0, sizeof(v111));
          CGRect v67 = self->_rulerLayer;
          CGRect v68 = v67;
          if (v67) {
            [(PKRulerLayer *)v67 rulerTransform];
          }
          else {
            memset(&v111, 0, sizeof(v111));
          }

          memset(&v110, 0, sizeof(v110));
          CGAffineTransform v109 = v111;
          CGAffineTransformInvert(&v110, &v109);
          CGRect v70 = [MEMORY[0x1E4FB1BA8] mainScreen];
          [v70 scale];
          double v86 = v71;

          CGRect v72 = [v66 touches];
          v73 = [v72 objectAtIndexedSubscript:0];
          [v73 locationInView:self->_rulerView];
          double v75 = v74;
          double v77 = v76;

          v78 = [v66 touches];
          v79 = [v78 objectAtIndexedSubscript:1];
          [v79 locationInView:self->_rulerView];
          double v81 = v80;
          double v83 = v82;

          [(PKRulerLayer *)self->_rulerLayer updateAngleWithAngleMarkerPosition:vmulq_n_f64(vrndaq_f64(vmulq_n_f64(vaddq_f64(*(float64x2_t *)&v111.tx, vmlaq_n_f64(vmulq_f64(*(float64x2_t *)&v111.c, (float64x2_t)0), *(float64x2_t *)&v111.a, (v110.tx + v77 * v110.c + v110.a * v75 + v110.tx + v83 * v110.c + v110.a * v81) * 0.5)), v86)), 1.0 / v86)];
        }
        else
        {
          CGRect v69 = [(PKRulerLayer *)self->_rulerLayer rulerAngleMarker];

          if (v69) {
            [(PKRulerLayer *)self->_rulerLayer hideRulerAngleMarker];
          }
        }

        [MEMORY[0x1E4F39CF8] commit];
        goto LABEL_107;
      }
      uint64_t v62 = *(void *)&self->_rulerState.arcType;
      if (v62 == v59)
      {
        if (!v62)
        {
          if (!self->_canRulerSnapToAngle) {
            goto LABEL_96;
          }
          goto LABEL_84;
        }
        if (v55 < 0.0 != ((v62 & 0x100000000) == 0)) {
          goto LABEL_96;
        }
      }
      if (v59)
      {
        if (v59 == 1) {
          goto LABEL_93;
        }
        if (v59 != 2)
        {
LABEL_95:
          *(void *)&self->_previousRulerState.arcType = v62;
          self->_previousRulerState.double snapAngle = snapAngle;
          *(void *)&self->_rulerState.arcType = v59;
          self->_rulerState.double snapAngle = v53;
          goto LABEL_96;
        }
        if (v62)
        {
LABEL_93:
          BOOL v63 = 1;
        }
        else
        {
          uint64_t v85 = *(void *)&self->_previousRulerState.arcType;
          if (v85) {
            BOOL v63 = (v55 < 0.0) ^ BYTE4(v85) & 1;
          }
          else {
            BOOL v63 = 1;
          }
        }
        self->_BOOL canRulerSnapToAngle = v63;
        goto LABEL_95;
      }
      BOOL canRulerSnapToAngle = self->_canRulerSnapToAngle;
      *(void *)&self->_previousRulerState.arcType = v62;
      self->_previousRulerState.double snapAngle = snapAngle;
      *(void *)&self->_rulerState.arcType = v59;
      self->_rulerState.double snapAngle = v53;
      if (!canRulerSnapToAngle) {
        goto LABEL_96;
      }
LABEL_84:
      memset(&v108, 0, sizeof(v108));
      CGAffineTransformMakeRotation(&v108, (v53 - v49) * 3.14159265 / 180.0);
      CGAffineTransform v106 = v111;
      CGAffineTransform v105 = v108;
      CGAffineTransformConcat(&v107, &v106, &v105);
      CGAffineTransform v111 = v107;
      DKDTransformConvertForNewOrigin(&v107, &v95, -v42, -v44);
      if (!self->_rulerSnappedToAngle)
      {
        self->_rulerSnappedToAngle = 1;
        double v61 = 1.0;
LABEL_98:
        [(UIImpactFeedbackGenerator *)self->_snapImpactBehavior _impactOccurredWithIntensity:v61];
        goto LABEL_99;
      }
      goto LABEL_99;
    }
    char v13 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v111.a) = 0;
      _os_log_debug_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_DEBUG, "rulerMoveGesture began", (uint8_t *)&v111, 2u);
    }

    if (!self || (char v14 = self->_rulerLayer) == 0)
    {
      -[PKRulerController showRuler]((uint64_t)self);
      -[PKRulerController drawingCancelled:]((uint64_t)self);
      if (self) {
        self->_rulerWasShownViaGesture = 1;
      }
      memset(&v111, 0, sizeof(v111));
      if (v4) {
        [v4 rulerTransform];
      }
      CGAffineTransform v94 = v111;
      [(PKRulerView *)v6 frame];
      DKDTransformConvertForNewOrigin(&v94, &v110, v15, v16);
      CGAffineTransform v111 = v110;
      if (self) {
        rulerLayer = self->_rulerLayer;
      }
      else {
        rulerLayer = 0;
      }
      id v18 = rulerLayer;
      CGAffineTransform v92 = v111;
      -[PKRulerLayer setRulerTransform:](v18, "setRulerTransform:", v93, [(PKRulerController *)(CGAffineTransform *)self pixelSnapRulerTransform:v93]);

      if (!self)
      {
        CGAffineTransform v24 = 0;
LABEL_41:
        [(UIImpactFeedbackGenerator *)v24 deactivate];
        CGAffineTransform v25 = (void *)[objc_alloc(MEMORY[0x1E4FB1840]) initWithStyle:1 coordinateSpace:v6];
        -[PKRulerController setSnapImpactBehavior:]((uint64_t)self, v25);

        if (self) {
          snapImpactBehavior = self->_snapImpactBehavior;
        }
        else {
          snapImpactBehavior = 0;
        }
        [(UIImpactFeedbackGenerator *)snapImpactBehavior activateWithCompletionBlock:0];
        goto LABEL_44;
      }
      char v14 = self->_rulerLayer;
    }
    *(_WORD *)&self->_isInteractingWithRuler = 1;
    double v19 = v14;
    double v20 = v19;
    if (v19)
    {
      [(PKRulerLayer *)v19 rulerTransform];
      long long v87 = v89;
      long long v88 = v90;
      long long v21 = v91;
    }
    else
    {
      long long v21 = 0uLL;
      long long v87 = 0u;
      long long v88 = 0u;
    }
    *(_OWORD *)&self->_rulerStartTransform.a = v87;
    *(_OWORD *)&self->_rulerStartTransform.c = v88;
    *(_OWORD *)&self->_rulerStartTransform.tdouble x = v21;

    self->_previousRulerState = self->_rulerState;
    self->_rulerSnappedToAngle = 0;
    CGAffineTransform v24 = self->_snapImpactBehavior;
    goto LABEL_41;
  }
  if (self)
  {
    self->_rulerSnappedToAngle = 0;
    id v8 = self->_snapImpactBehavior;
  }
  else
  {
    id v8 = 0;
  }
  [(UIImpactFeedbackGenerator *)v8 deactivate];
  -[PKRulerController setSnapImpactBehavior:]((uint64_t)self, 0);
  __n128 v9 = os_log_create("com.apple.pencilkit", "Sketching");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v111.a) = 0;
    _os_log_debug_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_DEBUG, "rulerMoveGesture ended/canceled", (uint8_t *)&v111, 2u);
  }

  if (self) {
    double v10 = self->_rulerLayer;
  }
  else {
    double v10 = 0;
  }
  [(PKRulerLayer *)v10 rulerAlpha];
  if (v11 >= 1.0)
  {
    if (self) {
      goto LABEL_33;
    }
  }
  else
  {
    if (self) {
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    }
    else {
      id v12 = 0;
    }
    [v12 setRulerEnabled:0];

    if (self)
    {
      -[PKRulerController hideRulerAnimated:]((uint64_t)self, 1);
LABEL_33:
      double v22 = self->_rulerLayer;
      goto LABEL_34;
    }
  }
  double v22 = 0;
LABEL_34:
  [(PKRulerLayer *)v22 hideRulerAngleMarker];
  if (self) {
    CGAffineTransform v23 = self->_rulerLayer;
  }
  else {
    CGAffineTransform v23 = 0;
  }
  UIAccessibilityPostNotification(*MEMORY[0x1E4FB2470], v23);
  if (self)
  {
    self->_isInteractingWithRuler = 0;
    if (self->_rulerWasShownViaGesture) {
      -[PKRulerController hideRulerAnimated:]((uint64_t)self, 1);
    }
  }
LABEL_108:
}

- (void)setSnapImpactBehavior:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  long long v6 = (PKRulerGestureRecognizer *)a3;
  id v7 = a4;
  id v8 = -[PKRulerController _viewForHostingRuler]((id *)&self->super.isa);
  if (self)
  {
    __n128 v9 = self->_rulerGestureRecognizer;
    if (v9 == v6)
    {
      rulerLayer = self->_rulerLayer;

      if (!rulerLayer) {
        goto LABEL_12;
      }
      goto LABEL_8;
    }
    double v10 = v9;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
LABEL_4:
    id v12 = [WeakRetained drawingGestureRecognizer];
    if (v12 != v6)
    {

      if (!self)
      {
LABEL_33:
        if (v6)
        {
          double v22 = 0;
          goto LABEL_13;
        }
        goto LABEL_35;
      }
      goto LABEL_12;
    }
    if (!self)
    {

      goto LABEL_33;
    }
    long long v21 = self->_rulerLayer;

    if (!v21)
    {
LABEL_12:
      double v22 = self->_rulerGestureRecognizer;
      if (v22 != v6)
      {
LABEL_13:

LABEL_26:
        char v31 = 1;
        goto LABEL_27;
      }
      CGAffineTransform v23 = self->_rulerLayer;

      if (v23) {
        goto LABEL_26;
      }
      id v24 = objc_loadWeakRetained((id *)&self->_delegate);
      goto LABEL_16;
    }
LABEL_8:
    [v7 locationInView:v8];
    double v15 = v14;
    double v17 = v16;
    id v18 = self->_rulerLayer;
    if (v18)
    {
      double v19 = v18;
      BOOL v20 = -[PKRulerLayer viewPointInRuler:](self->_rulerLayer, "viewPointInRuler:", v15, v17);
    }
    else
    {
      BOOL v20 = 1;
    }
    char v31 = v20 ^ (self->_rulerGestureRecognizer != v6);
    goto LABEL_27;
  }
  if (v6)
  {
    double v10 = 0;
    id WeakRetained = 0;
    goto LABEL_4;
  }
LABEL_35:

  id v24 = 0;
LABEL_16:
  if (([v24 isDrawing] & 1) == 0)
  {

    goto LABEL_26;
  }
  if (self) {
    id v25 = objc_loadWeakRetained((id *)&self->_delegate);
  }
  else {
    id v25 = 0;
  }
  CGAffineTransform v26 = [v25 drawingGestureRecognizer];
  id v27 = [v26 drawingTouch];
  if (v27 == v7)
  {
    char v31 = 1;
  }
  else
  {
    id v34 = v25;
    long long v33 = [(PKFreeTransformGestureRecognizer *)v6 touches];
    if (self) {
      id v28 = objc_loadWeakRetained((id *)&self->_delegate);
    }
    else {
      id v28 = 0;
    }
    char v29 = [v28 drawingGestureRecognizer];
    CGAffineTransform v30 = [v29 drawingTouch];
    char v31 = [v33 containsObject:v30];

    id v25 = v34;
  }

LABEL_27:
  return v31;
}

- (double)rulerTransform
{
  if (a1)
  {
    id v4 = *(id *)(a1 + 64);
    long long v5 = v4;
    if (v4) {
      [v4 rulerTransform];
    }
    else {
      memset(v7, 0, sizeof(v7));
    }
    [(PKRulerController *)(CGAffineTransform *)a1 pixelSnapRulerTransform:a2];
  }
  else
  {
    double result = 0.0;
    a2[1] = 0u;
    a2[2] = 0u;
    *a2 = 0u;
  }
  return result;
}

- (void)canvasTransform
{
  if (a1)
  {
    BOOL v3 = (id *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    long long v5 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained strokeTransform];
      double v7 = v21;
      double v6 = v20;
      double v9 = v23;
      double v8 = v22;
    }
    else
    {
      long long v24 = 0u;
      double v8 = 0.0;
      double v7 = 0.0;
      double v9 = 0.0;
      double v6 = 0.0;
    }
    double v10 = fabs(v6 * v9 - v7 * v8);
    if (v10 < 0.001 || v10 == INFINITY || (double v11 = fabs(*(double *)&v24), v11 >= INFINITY) && v11 <= INFINITY)
    {

LABEL_10:
      id v12 = objc_loadWeakRetained(v3);
      [v12 drawingScale];
      CGFloat v14 = v13;

      CGAffineTransformMakeScale((CGAffineTransform *)a2, v14, v14);
      return;
    }

    if (fabs(*((double *)&v24 + 1)) == INFINITY) {
      goto LABEL_10;
    }
    id v15 = objc_loadWeakRetained(v3);
    double v16 = v15;
    if (v15)
    {
      [v15 strokeTransform];
    }
    else
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v17 = 0u;
    }
    *(_OWORD *)a2 = v17;
    *(_OWORD *)(a2 + 16) = v18;
    *(_OWORD *)(a2 + 32) = v19;
  }
  else
  {
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)a2 = 0u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapImpactBehavior, 0);
  objc_storeStrong((id *)&self->_rulerLayer, 0);
  objc_storeStrong((id *)&self->_rulerView, 0);
  objc_destroyWeak((id *)&self->_rulerHostingDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rulerGestureRecognizer, 0);

  objc_destroyWeak((id *)&self->_rulerHostingView);
}

@end