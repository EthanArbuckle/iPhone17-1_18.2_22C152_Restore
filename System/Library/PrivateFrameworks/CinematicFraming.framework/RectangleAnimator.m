@interface RectangleAnimator
- (CGRect)driveAnimationToTarget:(CGRect)a3 atTime:(id *)a4;
- (CGRect)rectangle;
- (CinematicFramingSessionOptions)options;
- (RectangleAnimator)initWithFramingSpaceManager:(id)a3;
- (float)sizeSpeed;
- (float)xSpeed;
- (float)ySpeed;
- (void)drivePivotAnimationsToTarget:(id *)a3 withPivotDescriptions:(id)a4 atTime:(id *)a5;
- (void)driveWidthAnimationToTarget:(id *)a3 withPivotDescriptions:(id)a4 atTime:(id *)a5;
- (void)driveXPivotWithLocation:(float)a3 velocity:(float)a4 pivotDescriptions:(id)a5 toTargetLocation:(float)a6 targetVelocity:(float)a7 atTime:(id *)a8;
- (void)driveYPivotWithLocation:(float)a3 velocity:(float)a4 pivotDescriptions:(id)a5 toTargetLocation:(float)a6 targetVelocity:(float)a7 atTime:(id *)a8;
- (void)resetToRectangle:(CGRect)a3;
- (void)setOptions:(id)a3;
@end

@implementation RectangleAnimator

- (RectangleAnimator)initWithFramingSpaceManager:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RectangleAnimator;
  v6 = [(RectangleAnimator *)&v13 init];
  v7 = v6;
  if (v6)
  {
    CGSize v8 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v6->_rectangle.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v6->_rectangle.size = v8;
    RectToState((uint64_t)&v11, v6->_rectangle.origin.x, v6->_rectangle.origin.y, v6->_rectangle.size.width, v6->_rectangle.size.height);
    *(_OWORD *)&v7->_currentState.x = v11;
    *(void *)&v7->_currentState.vy = v12;
    objc_storeStrong((id *)&v7->_framingSpaceManager, a3);
    v9 = v7;
  }

  return v7;
}

- (void)resetToRectangle:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGSize v8 = [[AnimationEngine alloc] initWithInitialPosition:0.0];
  xAxisAnimationEngine = self->_xAxisAnimationEngine;
  self->_xAxisAnimationEngine = v8;

  v10 = [[AnimationEngine alloc] initWithInitialPosition:0.0];
  yAxisAnimationEngine = self->_yAxisAnimationEngine;
  self->_yAxisAnimationEngine = v10;

  uint64_t v12 = [AnimationEngine alloc];
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  float v13 = CGRectGetWidth(v18);
  *(float *)&double v14 = logf(v13);
  v15 = [(AnimationEngine *)v12 initWithInitialPosition:v14];
  sizeAnimationEngine = self->_sizeAnimationEngine;
  self->_sizeAnimationEngine = v15;

  RectToState((uint64_t)&v17, x, y, width, height);
  self->_currentState = v17;
}

- (CGRect)driveAnimationToTarget:(CGRect)a3 atTime:(id *)a4
{
  long long v34 = 0uLL;
  uint64_t v35 = 0;
  RectToState((uint64_t)&v34, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  framingSpaceManager = self->_framingSpaceManager;
  float y = self->_currentState.y;
  float w = self->_currentState.w;
  unint64_t v11 = *(void *)((char *)&v34 + 4);
  int v10 = HIDWORD(v11);
  LODWORD(v9) = v11;
  float v12 = ComputeTPivot(self->_currentState.x, self->_currentState.x + w, *(float *)&v34, *(float *)&v34 + *((float *)&v34 + 2), 0.5);
  float v13 = framingSpaceManager;
  *(float *)&double v14 = w;
  [(FramingSpaceManager *)v13 getHeightForWidth:v14];
  float v16 = y + v15;
  LODWORD(v17) = v10;
  [(FramingSpaceManager *)v13 getHeightForWidth:v17];
  float v19 = v18;

  float v20 = ComputeTPivot(y, v16, v9, v9 + v19, 0.0);
  long long v32 = v34;
  uint64_t v33 = v35;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v31 = *a4;
  *(float *)&double v21 = v20;
  -[RectangleAnimator driveWidthAnimationToTarget:withPivotDescriptions:atTime:](self, "driveWidthAnimationToTarget:withPivotDescriptions:atTime:", &v32, &v31, COERCE_DOUBLE(__PAIR64__(HIDWORD(v31.var0), LODWORD(v12))), v21);
  long long v32 = v34;
  uint64_t v33 = v35;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v31 = *a4;
  *(float *)&double v22 = v20;
  -[RectangleAnimator drivePivotAnimationsToTarget:withPivotDescriptions:atTime:](self, "drivePivotAnimationsToTarget:withPivotDescriptions:atTime:", &v32, &v31, COERCE_DOUBLE(__PAIR64__(HIDWORD(v31.var0), LODWORD(v12))), v22);
  CGFloat x = self->_currentState.x;
  CGFloat v24 = self->_currentState.y;
  CGFloat v25 = self->_currentState.w;
  -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:");
  double v27 = v26;
  self->_rectangle.origin.CGFloat x = x;
  self->_rectangle.origin.float y = v24;
  self->_rectangle.size.CGFloat width = v25;
  self->_rectangle.size.CGFloat height = v26;
  double v28 = x;
  double v29 = v24;
  double v30 = v25;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v30;
  result.origin.float y = v29;
  result.origin.CGFloat x = v28;
  return result;
}

- (float)xSpeed
{
  return fabsf(self->_currentState.vx);
}

- (float)ySpeed
{
  return fabsf(self->_currentState.vy);
}

- (float)sizeSpeed
{
  return fabsf(self->_currentState.vw);
}

- (void)driveWidthAnimationToTarget:(id *)a3 withPivotDescriptions:(id)a4 atTime:(id *)a5
{
  float var1 = a4.var1;
  float var0 = a4.var0;
  p_currentState = &self->_currentState;
  float x = self->_currentState.x;
  float y = self->_currentState.y;
  float w = self->_currentState.w;
  -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:");
  float v48 = v11;
  *(float *)&double v12 = self->_currentState.w;
  vfloat x = self->_currentState.vx;
  vfloat w = self->_currentState.vw;
  vfloat y = self->_currentState.vy;
  *(float *)&double v14 = vw;
  [(FramingSpaceManager *)self->_framingSpaceManager getHeightDerivativeForWidth:v12 widthDerivative:v14];
  float v44 = v15;
  float v16 = logf(a3->var2);
  sizeAnimationEngine = self->_sizeAnimationEngine;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v58 = *a5;
  *(float *)&double v18 = v16;
  [sizeAnimationEngine animateWithDuration:4 toTarget:&v58 options:1.75 atTime:v18];
  CGFloat v19 = p_currentState->x;
  CGFloat v20 = self->_currentState.y;
  CGFloat v21 = self->_currentState.w;
  -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:");
  CGFloat v23 = v22;
  memset(&v58, 0, sizeof(v58));
  CGFloat v24 = [(RectangleAnimator *)self options];
  ComputeSizeFrameEdgeConstraints(v24, (uint64_t)&v58, v19, v20, v21, v23);

  [(FramingSpaceManager *)self->_framingSpaceManager maxAllowedViewportWidth];
  HIDWORD(v58.var3) = logf(v25);
  float v26 = [(RectangleAnimator *)self options];
  v58.float var1 = ComputeSizeVelocityConstraints(v26);
  v58.var2 = v27;

  [self->_sizeAnimationEngine velocity];
  LODWORD(v23) = v28;
  [self->_sizeAnimationEngine position];
  *(float *)&CGFloat v20 = v16 - v29;
  double v30 = [(RectangleAnimator *)self options];
  LODWORD(v23) = ComputeSizeEaseInAccelerationConstraintsForVelocityAndDisplacement(v30, *(float *)&v23, *(float *)&v20);

  LODWORD(v31) = HIDWORD(v58.var0);
  LODWORD(v58.var0) = CombineMotionConstraints(*(float *)&v58.var0, v31, *(float *)&v23);
  HIDWORD(v58.var0) = v32;
  [self->_sizeAnimationEngine velocity];
  LODWORD(v23) = v33;
  long long v34 = [(RectangleAnimator *)self options];
  uint64_t v35 = v34;
  if (*(float *)&v23 < 0.0) {
    [v34 zoomInSpeedMultiplier];
  }
  else {
    [v34 zoomOutSpeedMultiplier];
  }
  unsigned int v37 = v36;

  v38.n128_f32[0] = vx + (float)(vw * var0);
  __n128 v47 = v38;
  v38.n128_f32[0] = x + (float)(w * var0);
  __n128 v53 = v38;
  v39 = self->_sizeAnimationEngine;
  long long v56 = *(_OWORD *)&a5->var0;
  int64_t var3 = a5->var3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v55 = v58;
  [(AnimationEngine *)v39 driveAnimationAtTime:&v56 withConstraints:&v55 withMultiplier:COERCE_DOUBLE(__PAIR64__(HIDWORD(v58.var0), v37))];
  [self->_sizeAnimationEngine position];
  float v50 = expf(v40);
  __n128 v41 = v53;
  v41.n128_f32[1] = y + (float)(v48 * var1);
  v41.n128_f32[2] = v50;
  __n128 v54 = v41;
  [self->_sizeAnimationEngine velocity];
  __n128 v42 = v47;
  v42.n128_f32[1] = vy + (float)(v44 * var1);
  v42.n128_f32[2] = v50 * v43;
  PivotDescriptionsToState(self->_framingSpaceManager, (uint64_t)&v56, v54, v42, var0, var1);
  *(_OWORD *)&p_currentState->float x = v56;
  *(void *)&p_currentState->vfloat y = var3;
}

- (void)drivePivotAnimationsToTarget:(id *)a3 withPivotDescriptions:(id)a4 atTime:(id *)a5
{
  float var1 = a4.var1;
  float var0 = a4.var0;
  float y = self->_currentState.y;
  float w = self->_currentState.w;
  *(float *)&unsigned int v11 = self->_currentState.x + (float)(w * a4.var0);
  -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:");
  *(float *)&unsigned int v44 = y + (float)(v12 * var1);
  *(float *)&double v13 = self->_currentState.w;
  vfloat y = self->_currentState.vy;
  vfloat w = self->_currentState.vw;
  float v15 = self->_currentState.vx + (float)(vw * var0);
  -[FramingSpaceManager getHeightDerivativeForWidth:widthDerivative:](self->_framingSpaceManager, "getHeightDerivativeForWidth:widthDerivative:", v13);
  float v43 = vy + (float)(v16 * var1);
  float v17 = a3->var1;
  float v18 = a3->var0 + (float)(a3->var2 * var0);
  -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:");
  float v20 = v17 + (float)(v19 * var1);
  *(float *)&double v21 = a3->var2;
  float var4 = a3->var4;
  float v23 = a3->var3 + (float)(a3->var5 * var0);
  -[FramingSpaceManager getHeightDerivativeForWidth:widthDerivative:](self->_framingSpaceManager, "getHeightDerivativeForWidth:widthDerivative:", v21);
  float v25 = var4 + (float)(v24 * var1);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v49 = *a5;
  *(float *)&double v26 = v15;
  *(float *)&double v27 = var0;
  *(float *)&double v28 = var1;
  *(float *)&double v29 = v18;
  *(float *)&double v30 = v23;
  -[RectangleAnimator driveXPivotWithLocation:velocity:pivotDescriptions:toTargetLocation:targetVelocity:atTime:](self, "driveXPivotWithLocation:velocity:pivotDescriptions:toTargetLocation:targetVelocity:atTime:", &v49, COERCE_DOUBLE(__PAIR64__(HIDWORD(v49.var0), v11)), v26, v27, v28, v29, v30);
  [self->_xAxisAnimationEngine position];
  v47.n128_u64[0] = v31;
  [self->_xAxisAnimationEngine velocity];
  v42.n128_u64[0] = v32;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v49 = *a5;
  *(float *)&double v33 = v43;
  *(float *)&double v34 = var0;
  *(float *)&double v35 = var1;
  *(float *)&double v36 = v20;
  *(float *)&double v37 = v25;
  -[RectangleAnimator driveYPivotWithLocation:velocity:pivotDescriptions:toTargetLocation:targetVelocity:atTime:](self, "driveYPivotWithLocation:velocity:pivotDescriptions:toTargetLocation:targetVelocity:atTime:", &v49, COERCE_DOUBLE(__PAIR64__(HIDWORD(v49.var0), v44)), v33, v34, v35, v36, v37);
  [self->_yAxisAnimationEngine position];
  __n128 v38 = v47;
  v38.n128_u32[1] = v39;
  v38.n128_f32[2] = w;
  __n128 v48 = v38;
  [self->_yAxisAnimationEngine velocity];
  __n128 v40 = v42;
  v40.n128_u32[1] = v41;
  v40.n128_f32[2] = vw;
  PivotDescriptionsToState(self->_framingSpaceManager, (uint64_t)&v49, v48, v40, var0, var1);
  self->_currentState = ($77F85791B0246B84B7FA9448DDB66A63)v49;
}

- (void)driveXPivotWithLocation:(float)a3 velocity:(float)a4 pivotDescriptions:(id)a5 toTargetLocation:(float)a6 targetVelocity:(float)a7 atTime:(id *)a8
{
  float var0 = a5.var0;
  -[AnimationEngine setPosition:](self->_xAxisAnimationEngine, "setPosition:");
  *(float *)&double v12 = a4;
  [self->_xAxisAnimationEngine setVelocity:v12];
  xAxisAnimationEngine = self->_xAxisAnimationEngine;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v45 = *a8;
  *(float *)&double v14 = a6;
  [xAxisAnimationEngine animateWithDuration:4 toTarget:&v45 options:0.75 atTime:v14];
  CGFloat x = self->_currentState.x;
  CGFloat y = self->_currentState.y;
  CGFloat w = self->_currentState.w;
  -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:");
  CGFloat v19 = v18;
  memset(&v45, 0, sizeof(v45));
  [(FramingSpaceManager *)self->_framingSpaceManager framingSpaceBounds];
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  double v28 = [(RectangleAnimator *)self options];
  ComputeXFrameEdgeConstraints(v28, (uint64_t)&v45, x, y, w, v19, v21, v23, v25, v27);

  [(FramingSpaceManager *)self->_framingSpaceManager framingSpaceBounds];
  *(float *)&CGFloat v23 = CGRectGetMinX(v46) + (float)(var0 * self->_currentState.w);
  [(FramingSpaceManager *)self->_framingSpaceManager framingSpaceBounds];
  *(float *)&unsigned int v29 = CGRectGetMaxX(v47) - (float)((float)(1.0 - var0) * self->_currentState.w);
  v45.int64_t var3 = __PAIR64__(v29, LODWORD(v23));
  double v30 = [(RectangleAnimator *)self options];
  LODWORD(v23) = ComputeXVelocityConstraints(v30, x, y, w);

  LODWORD(v31) = v45.var2;
  v45.float var1 = CombineMotionConstraints(*(float *)&v45.var1, v31, *(float *)&v23);
  v45.var2 = v32;
  [self->_xAxisAnimationEngine velocity];
  LODWORD(v23) = v33;
  *(float *)&CGFloat v27 = self->_currentState.w;
  double v34 = [(RectangleAnimator *)self options];
  LODWORD(v23) = ComputeXEaseInAccelerationConstraintsForVelocityAndDisplacement(v34, *(float *)&v23, a6 - a3, *(float *)&v27);

  LODWORD(v35) = HIDWORD(v45.var0);
  LODWORD(v45.var0) = CombineMotionConstraints(*(float *)&v45.var0, v35, *(float *)&v23);
  HIDWORD(v45.var0) = v36;
  *(float *)&CGFloat v23 = self->_currentState.w;
  double v37 = [(RectangleAnimator *)self options];
  [v37 horizontalSpeedMultiplier];
  *(float *)&CGFloat v23 = *(float *)&v23 * v38;

  unsigned __int32 v39 = self->_xAxisAnimationEngine;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v44 = *a8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v43 = v45;
  [(AnimationEngine *)v39 driveAnimationAtTime:&v44 withConstraints:&v43 withMultiplier:COERCE_DOUBLE(__PAIR64__(HIDWORD(v45.var0), LODWORD(v23)))];
}

- (void)driveYPivotWithLocation:(float)a3 velocity:(float)a4 pivotDescriptions:(id)a5 toTargetLocation:(float)a6 targetVelocity:(float)a7 atTime:(id *)a8
{
  float var1 = a5.var1;
  -[AnimationEngine setPosition:](self->_yAxisAnimationEngine, "setPosition:");
  *(float *)&double v12 = a4;
  [self->_yAxisAnimationEngine setVelocity:v12];
  yAxisAnimationEngine = self->_yAxisAnimationEngine;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v47 = *a8;
  *(float *)&double v14 = a6;
  [yAxisAnimationEngine animateWithDuration:4 toTarget:&v47 options:0.75 atTime:v14];
  CGFloat x = self->_currentState.x;
  CGFloat y = self->_currentState.y;
  CGFloat w = self->_currentState.w;
  -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:");
  CGFloat v19 = v18;
  memset(&v47, 0, sizeof(v47));
  [(FramingSpaceManager *)self->_framingSpaceManager framingSpaceBounds];
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  double v28 = [(RectangleAnimator *)self options];
  ComputeYFrameEdgeConstraints(v28, (uint64_t)&v47, x, y, w, v19, v21, v23, v25, v27);

  *(float *)&double v29 = self->_currentState.w;
  [(FramingSpaceManager *)self->_framingSpaceManager getHeightForWidth:v29];
  LODWORD(v23) = v30;
  [(FramingSpaceManager *)self->_framingSpaceManager framingSpaceBounds];
  *(float *)&CGFloat v25 = CGRectGetMinY(v48) + (float)(var1 * *(float *)&v23);
  [(FramingSpaceManager *)self->_framingSpaceManager framingSpaceBounds];
  *(float *)&unsigned int v31 = CGRectGetMaxY(v49) - (float)((float)(1.0 - var1) * *(float *)&v23);
  v47.int64_t var3 = __PAIR64__(v31, LODWORD(v25));
  unsigned int v32 = [(RectangleAnimator *)self options];
  LODWORD(v23) = ComputeYVelocityConstraints(v32, x, y, w, v19);

  LODWORD(v33) = v47.var2;
  v47.float var1 = CombineMotionConstraints(*(float *)&v47.var1, v33, *(float *)&v23);
  v47.var2 = v34;
  [self->_yAxisAnimationEngine velocity];
  LODWORD(v23) = v35;
  *(float *)&CGFloat v27 = self->_currentState.w;
  int v36 = [(RectangleAnimator *)self options];
  LODWORD(v23) = ComputeYEaseInAccelerationConstraintsForVelocityAndDisplacement(v36, *(float *)&v23, a6 - a3, *(float *)&v27);

  LODWORD(v37) = HIDWORD(v47.var0);
  LODWORD(v47.var0) = CombineMotionConstraints(*(float *)&v47.var0, v37, *(float *)&v23);
  HIDWORD(v47.var0) = v38;
  *(float *)&CGFloat v23 = self->_currentState.w;
  unsigned __int32 v39 = [(RectangleAnimator *)self options];
  [v39 verticalSpeedMultiplier];
  *(float *)&CGFloat v23 = *(float *)&v23 * v40;

  unsigned __int32 v41 = self->_yAxisAnimationEngine;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v46 = *a8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v45 = v47;
  [(AnimationEngine *)v41 driveAnimationAtTime:&v46 withConstraints:&v45 withMultiplier:COERCE_DOUBLE(__PAIR64__(HIDWORD(v47.var0), LODWORD(v23)))];
}

- (CGRect)rectangle
{
  double x = self->rectangle.origin.x;
  double y = self->rectangle.origin.y;
  double width = self->rectangle.size.width;
  double height = self->rectangle.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CinematicFramingSessionOptions)options
{
  return self->options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->options, 0);
  objc_storeStrong((id *)&self->_framingSpaceManager, 0);
  objc_storeStrong((id *)&self->_sizeAnimationEngine, 0);
  objc_storeStrong((id *)&self->_yAxisAnimationEngine, 0);

  objc_storeStrong((id *)&self->_xAxisAnimationEngine, 0);
}

@end