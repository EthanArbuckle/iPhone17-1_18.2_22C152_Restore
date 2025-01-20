@interface QLPXSwipeDownTracker
- (BOOL)shouldFinishDismissal;
- (CGAffineTransform)trackedTransform;
- (CGPoint)trackedCenter;
- (CGRect)trackedBounds;
- (QLPXChangeDirectionNumberFilter)verticalDirectionFilter;
- (QLPXDisplayVelocity)trackedVelocity;
- (QLPXInitialHysteresisNumberFilter)horizontalTranslationFilter;
- (QLPXSwipeDownTracker)init;
- (QLPXSwipeDownTracker)initWithOptions:(unint64_t)a3;
- (double)dismissalProgress;
- (double)finalAnimationDuration;
- (double)finalAnimationSpringDamping;
- (unint64_t)options;
- (void)setDismissalProgress:(double)a3;
- (void)setHorizontalTranslationFilter:(id)a3;
- (void)setShouldFinishDismissal:(BOOL)a3;
- (void)setTrackedBounds:(CGRect)a3;
- (void)setTrackedCenter:(CGPoint)a3;
- (void)setTrackedTransform:(CGAffineTransform *)a3;
- (void)setTrackedVelocity:(QLPXDisplayVelocity)a3;
- (void)setVerticalDirectionFilter:(id)a3;
- (void)startTrackingCenter:(CGPoint)a3 bounds:(CGRect)a4 transform:(CGAffineTransform *)a5 withInitialGestureLocation:(CGPoint)a6;
- (void)trackGestureTranslation:(CGPoint)a3 velocity:(CGPoint)a4;
@end

@implementation QLPXSwipeDownTracker

- (QLPXSwipeDownTracker)init
{
  return [(QLPXSwipeDownTracker *)self initWithOptions:0];
}

- (QLPXSwipeDownTracker)initWithOptions:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)QLPXSwipeDownTracker;
  result = [(QLPXSwipeDownTracker *)&v5 init];
  if (result)
  {
    result->_options = a3;
    *(_OWORD *)&result->_trackedVelocity.x = QLPXDisplayVelocityZero;
    *(_OWORD *)&result->_trackedVelocity.scale = unk_218043B00;
    *(_OWORD *)&result->_finalAnimationDuration = xmmword_218043950;
  }
  return result;
}

- (void)startTrackingCenter:(CGPoint)a3 bounds:(CGRect)a4 transform:(CGAffineTransform *)a5 withInitialGestureLocation:(CGPoint)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  self->_didStartTracking = 1;
  self->_initialTouchLocation = a6;
  self->_initialCenter = a3;
  self->_initialBounds = a4;
  long long v12 = *(_OWORD *)&a5->a;
  long long v13 = *(_OWORD *)&a5->tx;
  *(_OWORD *)&self->_initialTransform.c = *(_OWORD *)&a5->c;
  *(_OWORD *)&self->_initialTransform.tdouble x = v13;
  *(_OWORD *)&self->_initialTransform.a = v12;
  -[QLPXSwipeDownTracker setTrackedCenter:](self, "setTrackedCenter:");
  -[QLPXSwipeDownTracker setTrackedBounds:](self, "setTrackedBounds:", x, y, width, height);
  long long v14 = *(_OWORD *)&a5->c;
  v15[0] = *(_OWORD *)&a5->a;
  v15[1] = v14;
  v15[2] = *(_OWORD *)&a5->tx;
  [(QLPXSwipeDownTracker *)self setTrackedTransform:v15];
}

- (void)trackGestureTranslation:(CGPoint)a3 velocity:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v5 = a3.y;
  double v6 = a3.x;
  char v8 = [(QLPXSwipeDownTracker *)self options] & 1;
  if (v8)
  {
    double x = 0.0;
    double v6 = 0.0;
  }
  v9 = [(QLPXSwipeDownTracker *)self verticalDirectionFilter];
  if (!v9)
  {
    v10 = objc_alloc_init(QLPXChangeDirectionNumberFilter);
    [(QLPXChangeDirectionNumberFilter *)v10 setMinimumChange:5.0];
    v91[0] = MEMORY[0x263EF8330];
    v91[1] = 3221225472;
    v91[2] = __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke;
    v91[3] = &unk_2642F60C8;
    v9 = v10;
    v92 = v9;
    [(QLPXNumberFilter *)v9 performChanges:v91];
    [(QLPXSwipeDownTracker *)self setVerticalDirectionFilter:v9];
  }
  v90[0] = MEMORY[0x263EF8330];
  v90[1] = 3221225472;
  v90[2] = __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_2;
  v90[3] = &__block_descriptor_48_e35_v16__0___QLPXMutableNumberFilter__8l;
  *(double *)&v90[4] = v6;
  *(double *)&v90[5] = v5;
  [(QLPXNumberFilter *)v9 performChanges:v90];
  [(QLPXNumberFilter *)v9 output];
  if (self->_didStartTracking)
  {
    double v34 = v11;
    long long v12 = [(QLPXSwipeDownTracker *)self horizontalTranslationFilter];
    if (!v12)
    {
      long long v12 = objc_alloc_init(QLPXInitialHysteresisNumberFilter);
      [(QLPXInitialHysteresisNumberFilter *)v12 setHysteresis:20.0];
      [(QLPXSwipeDownTracker *)self setHorizontalTranslationFilter:v12];
    }
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_3;
    aBlock[3] = &unk_2642F6110;
    char v89 = v8;
    aBlock[4] = self;
    *(double *)&aBlock[5] = v6;
    *(double *)&aBlock[6] = v5;
    long long v13 = (void (**)(void *, long long *, uint64_t *, uint64_t *, double, double, double))_Block_copy(aBlock);
    v87[0] = MEMORY[0x263EF8330];
    v87[1] = 3221225472;
    v87[2] = __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_5;
    v87[3] = &__block_descriptor_48_e35_v16__0___QLPXMutableNumberFilter__8l;
    *(double *)&v87[4] = v6;
    *(double *)&v87[5] = v5;
    [(QLPXNumberFilter *)v12 performChanges:v87];
    [(QLPXNumberFilter *)v12 output];
    double v15 = v14;
    uint64_t v82 = 0;
    v83 = (double *)&v82;
    uint64_t v84 = 0x3010000000;
    v85 = &unk_218061932;
    long long v86 = *MEMORY[0x263F00148];
    uint64_t v78 = 0;
    v79 = (double *)&v78;
    uint64_t v80 = 0x2020000000;
    uint64_t v81 = 0x3FF0000000000000;
    uint64_t v74 = 0;
    v75 = (double *)&v74;
    uint64_t v76 = 0x2020000000;
    uint64_t v77 = 0;
    v13[2](v13, &v86, &v81, &v77, v6, v5, v14);
    double v16 = self->_initialBounds.origin.x;
    double v40 = self->_initialCenter.y;
    double v41 = self->_initialCenter.x;
    CGFloat v17 = self->_initialBounds.origin.y;
    double height = self->_initialBounds.size.height;
    double width = self->_initialBounds.size.width;
    long long v18 = *(_OWORD *)&self->_initialTransform.tx;
    long long v19 = *(_OWORD *)&self->_initialTransform.a;
    *(_OWORD *)&v73.c = *(_OWORD *)&self->_initialTransform.c;
    *(_OWORD *)&v73.tdouble x = v18;
    double v38 = v83[4];
    double v39 = v83[5];
    double v20 = v79[3];
    CGFloat v21 = v75[3];
    *(_OWORD *)&v72.a = v19;
    *(_OWORD *)&v72.c = *(_OWORD *)&v73.c;
    *(_OWORD *)&v72.tdouble x = *(_OWORD *)&self->_initialTransform.tx;
    *(_OWORD *)&v73.a = v19;
    CGAffineTransformRotate(&v73, &v72, v21);
    v66[0] = (double (*)(id, double))MEMORY[0x263EF8330];
    v66[1] = (double (*)(id, double))3221225472;
    v66[2] = (double (*)(id, double))__57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_6;
    v66[3] = (double (*)(id, double))&unk_2642F6138;
    v22 = v13;
    v68 = v22;
    double v70 = v6;
    double v71 = v5;
    v23 = v12;
    v67 = v23;
    v69 = &v82;
    double v33 = QLPXDerivative(v66, 0.0);
    double v35 = v17;
    v60[0] = (double (*)(id, double))MEMORY[0x263EF8330];
    v60[1] = (double (*)(id, double))3221225472;
    v60[2] = (double (*)(id, double))__57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_7;
    v60[3] = (double (*)(id, double))&unk_2642F6160;
    v24 = v22;
    double v63 = v6;
    double v64 = v5;
    double v65 = v15;
    v61 = v24;
    v62 = &v82;
    double v25 = QLPXDerivative(v60, v5);
    v52[0] = (double (*)(id, double))MEMORY[0x263EF8330];
    v52[1] = (double (*)(id, double))3221225472;
    v52[2] = (double (*)(id, double))__57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_8;
    v52[3] = (double (*)(id, double))&unk_2642F6188;
    v26 = v24;
    v54 = v26;
    double v56 = v6;
    double v57 = v5;
    double v58 = x;
    double v59 = y;
    v27 = v23;
    v53 = v27;
    v55 = &v78;
    double v28 = QLPXDerivative(v52, 0.0);
    v44[0] = (double (*)(id, double))MEMORY[0x263EF8330];
    v44[1] = (double (*)(id, double))3221225472;
    v44[2] = (double (*)(id, double))__57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_9;
    v44[3] = (double (*)(id, double))&unk_2642F6188;
    v29 = v26;
    v46 = v29;
    double v48 = v6;
    double v49 = v5;
    double v50 = x;
    double v51 = y;
    v30 = v27;
    v45 = v30;
    v47 = &v74;
    double v31 = QLPXDerivative(v44, 0.0);
    -[QLPXSwipeDownTracker setTrackedCenter:](self, "setTrackedCenter:", v41 + v38, v40 + v39);
    -[QLPXSwipeDownTracker setTrackedBounds:](self, "setTrackedBounds:", v16, v35, width * v20, height * v20);
    CGAffineTransform v43 = v73;
    [(QLPXSwipeDownTracker *)self setTrackedTransform:&v43];
    -[QLPXSwipeDownTracker setTrackedVelocity:](self, "setTrackedVelocity:", x * v33, y * v25, v28, v31);

    _Block_object_dispose(&v74, 8);
    _Block_object_dispose(&v78, 8);
    _Block_object_dispose(&v82, 8);

    double v11 = v34;
  }
  BOOL v32 = v11 >= 0.0;
  [(QLPXSwipeDownTracker *)self setDismissalProgress:v5 / 400.0];
  [(QLPXSwipeDownTracker *)self setShouldFinishDismissal:v32];
}

void __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = a2;
  [v2 minimumChange];
  [v4 setInput:v3 + 1.0];
}

uint64_t __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setInput:*(double *)(a1 + 40)];
}

void __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_3(uint64_t a1, double *a2, double *a3, double *a4, double a5, double a6)
{
  double v9 = a6;
  double v32 = 1.0;
  if (a6 <= 0.0)
  {
    double v12 = 1.0;
    double v17 = log(fabs(a5) / 100.0 + 1.0) * 100.0;
    if (a5 >= 0.0) {
      double v18 = 0.0;
    }
    else {
      double v18 = -1.0;
    }
    if (a5 > 0.0) {
      double v18 = 1.0;
    }
    double v16 = v18 * v17;
    double v19 = log(fabs(v9) / 100.0 + 1.0) * 100.0;
    if (v9 >= 0.0) {
      double v20 = 0.0;
    }
    else {
      double v20 = -1.0;
    }
    double v9 = v20 * v19;
  }
  else
  {
    double v12 = 1.0;
    if (!*(unsigned char *)(a1 + 56))
    {
      long double v13 = atan(a6 / 200.0);
      double v12 = cos(v13) * 0.5 + 0.5;
      double v32 = v12;
    }
    double v14 = log(fabs(a5) / 100.0 + 1.0) * 100.0;
    double v15 = 0.0;
    if (a5 < 0.0) {
      double v15 = -1.0;
    }
    if (a5 > 0.0) {
      double v15 = 1.0;
    }
    double v16 = v15 * v14;
  }
  double v21 = *(double *)(a1 + 48);
  if (v21 == 0.0) {
    double v22 = 0.0;
  }
  else {
    double v22 = v9 / v21 * 0.0;
  }
  double v31 = v22;
  v23 = *(double **)(a1 + 32);
  CGFloat v24 = v23[2] - v23[4];
  CGFloat v25 = v23[3] - v23[5];
  long long v26 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v30.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v30.c = v26;
  *(_OWORD *)&v30.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  *(_OWORD *)&v29.a = *(_OWORD *)&v30.a;
  *(_OWORD *)&v29.c = v26;
  *(_OWORD *)&v29.tdouble x = *(_OWORD *)&v30.tx;
  CGAffineTransformTranslate(&v30, &v29, v24, v25);
  CGAffineTransform v28 = v30;
  CGAffineTransformScale(&v29, &v28, v12, v12);
  CGAffineTransform v30 = v29;
  CGAffineTransform v28 = v29;
  CGAffineTransformRotate(&v29, &v28, v22);
  CGAffineTransform v30 = v29;
  CGAffineTransform v28 = v29;
  CGAffineTransformTranslate(&v29, &v28, -v24, -v25);
  CGAffineTransform v30 = v29;
  *(_OWORD *)&v28.a = *MEMORY[0x263F00148];
  QLPXAffineTransformDecomposeTranslationScaleRotation((uint64_t)&v29, &v28, &v32, 0, &v31);
  if (a2)
  {
    double v27 = v9 + v28.b;
    *a2 = v16 + v28.a;
    a2[1] = v27;
  }
  if (a3) {
    *a3 = v32;
  }
  if (a4) {
    *a4 = v31;
  }
}

uint64_t __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 setInput:*(double *)(a1 + 32)];
}

double __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_6(uint64_t a1, double a2)
{
  double v4 = *(double *)(a1 + 64);
  double v5 = *(double *)(a1 + 56) + a2;
  uint64_t v6 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) outputDerivative];
  (*(void (**)(uint64_t, uint64_t, void, void, double, double, double))(v6 + 16))(v6, *(void *)(*(void *)(a1 + 48) + 8) + 32, 0, 0, v5, v4, v7 * a2);
  return *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32);
}

double __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_7(uint64_t a1, double a2)
{
  return *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
}

double __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_8(uint64_t a1, double a2)
{
  double v4 = *(double *)(a1 + 56) + a2 * *(double *)(a1 + 72);
  double v5 = *(double *)(a1 + 64) + a2 * *(double *)(a1 + 80);
  uint64_t v6 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) outputDerivative];
  (*(void (**)(uint64_t, void, uint64_t, void, double, double, double))(v6 + 16))(v6, 0, *(void *)(*(void *)(a1 + 48) + 8) + 24, 0, v4, v5, v7 * a2 * *(double *)(a1 + 72));
  return *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

double __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_9(uint64_t a1, double a2)
{
  double v4 = *(double *)(a1 + 56) + a2 * *(double *)(a1 + 72);
  double v5 = *(double *)(a1 + 64) + a2 * *(double *)(a1 + 80);
  uint64_t v6 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) outputDerivative];
  (*(void (**)(uint64_t, void, void, uint64_t, double, double, double))(v6 + 16))(v6, 0, 0, *(void *)(*(void *)(a1 + 48) + 8) + 24, v4, v5, v7 * a2 * *(double *)(a1 + 72));
  return *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

- (unint64_t)options
{
  return self->_options;
}

- (double)dismissalProgress
{
  return self->_dismissalProgress;
}

- (void)setDismissalProgress:(double)a3
{
  self->_dismissalProgress = a3;
}

- (BOOL)shouldFinishDismissal
{
  return self->_shouldFinishDismissal;
}

- (void)setShouldFinishDismissal:(BOOL)a3
{
  self->_shouldFinishDismissal = a3;
}

- (CGPoint)trackedCenter
{
  double x = self->_trackedCenter.x;
  double y = self->_trackedCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTrackedCenter:(CGPoint)a3
{
  self->_trackedCenter = a3;
}

- (CGRect)trackedBounds
{
  double x = self->_trackedBounds.origin.x;
  double y = self->_trackedBounds.origin.y;
  double width = self->_trackedBounds.size.width;
  double height = self->_trackedBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTrackedBounds:(CGRect)a3
{
  self->_trackedBounds = a3;
}

- (CGAffineTransform)trackedTransform
{
  long long v3 = *(_OWORD *)&self[5].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[5].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[6].b;
  return self;
}

- (void)setTrackedTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_trackedTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_trackedTransform.tdouble x = v4;
  *(_OWORD *)&self->_trackedTransform.a = v3;
}

- (QLPXDisplayVelocity)trackedVelocity
{
  double x = self->_trackedVelocity.x;
  double y = self->_trackedVelocity.y;
  double scale = self->_trackedVelocity.scale;
  double rotation = self->_trackedVelocity.rotation;
  result.double rotation = rotation;
  result.double scale = scale;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTrackedVelocity:(QLPXDisplayVelocity)a3
{
  self->_trackedVelocitdouble y = a3;
}

- (double)finalAnimationDuration
{
  return self->_finalAnimationDuration;
}

- (double)finalAnimationSpringDamping
{
  return self->_finalAnimationSpringDamping;
}

- (QLPXChangeDirectionNumberFilter)verticalDirectionFilter
{
  return self->_verticalDirectionFilter;
}

- (void)setVerticalDirectionFilter:(id)a3
{
}

- (QLPXInitialHysteresisNumberFilter)horizontalTranslationFilter
{
  return self->_horizontalTranslationFilter;
}

- (void)setHorizontalTranslationFilter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalTranslationFilter, 0);

  objc_storeStrong((id *)&self->_verticalDirectionFilter, 0);
}

@end