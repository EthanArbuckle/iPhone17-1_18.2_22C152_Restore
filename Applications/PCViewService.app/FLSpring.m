@interface FLSpring
+ (FLSpring)springWithValue:(double)a3;
- (BOOL)isStable;
- (BOOL)isTracking;
- (FLSpring)init;
- (FLSpring)initWithValue:(double)a3;
- (FLSpringParameters)_effectiveParameters;
- (FLSpringParameters)offsetParameters;
- (FLSpringParameters)parameters;
- (FLSpringParameters)trackingParameters;
- (double)_projectedTargetForVelocity:(double)a3;
- (double)maximumTarget;
- (double)minimumTarget;
- (double)projectedTarget;
- (double)projectionDeceleration;
- (double)retargetImpulse;
- (double)retargetResponseFraction;
- (double)rubberbandFactor;
- (double)rubberbandRange;
- (double)stableValueThreshold;
- (double)stableVelocityThreshold;
- (double)target;
- (double)timeFactor;
- (double)value;
- (double)velocity;
- (void)_updateForEffectiveParameters;
- (void)offsetBy:(double)a3;
- (void)offsetTo:(double)a3;
- (void)resetImmediatelyToValue:(double)a3;
- (void)setMaximumTarget:(double)a3;
- (void)setMinimumTarget:(double)a3;
- (void)setOffsetParameters:(FLSpringParameters)a3;
- (void)setParameters:(FLSpringParameters)a3;
- (void)setProjectionDeceleration:(double)a3;
- (void)setRetargetImpulse:(double)a3;
- (void)setRetargetResponseFraction:(double)a3;
- (void)setRubberbandFactor:(double)a3;
- (void)setRubberbandRange:(double)a3;
- (void)setStableValueThreshold:(double)a3;
- (void)setStableVelocityThreshold:(double)a3;
- (void)setTarget:(double)a3;
- (void)setTimeFactor:(double)a3;
- (void)setTracking:(BOOL)a3;
- (void)setTrackingParameters:(FLSpringParameters)a3;
- (void)setValue:(double)a3;
- (void)setVelocity:(double)a3;
- (void)step:(double)a3;
@end

@implementation FLSpring

+ (FLSpring)springWithValue:(double)a3
{
  id v3 = [objc_alloc((Class)a1) initWithValue:a3];

  return (FLSpring *)v3;
}

- (FLSpring)initWithValue:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FLSpring;
  v4 = [(FLSpring *)&v8 init];
  v5 = (FLSpring *)v4;
  if (v4)
  {
    *((void *)v4 + 67) = 0x3FF0000000000000;
    *(_OWORD *)(v4 + 600) = xmmword_1000ACDB8;
    *(_OWORD *)(v4 + 616) = unk_1000ACDC8;
    *(_OWORD *)(v4 + 632) = xmmword_1000ACDD8;
    *(_OWORD *)(v4 + 648) = unk_1000ACDE8;
    *(_OWORD *)(v4 + 664) = xmmword_1000ACDB8;
    *(_OWORD *)(v4 + 680) = unk_1000ACDC8;
    *((void *)v4 + 72) = 0x3FE199999999999ALL;
    *((void *)v4 + 71) = 0x7FEFFFFFFFFFFFFFLL;
    *((void *)v4 + 73) = 0;
    *((void *)v4 + 74) = 0x3FEFD70A3D70A3D7;
    *((void *)v4 + 68) = 0;
    *((int64x2_t *)v4 + 32) = vdupq_n_s64(0x3F50624DD2F1A9FCuLL);
    [v4 resetImmediatelyToValue:a3];
    v6 = v5;
  }

  return v5;
}

- (FLSpring)init
{
  return [(FLSpring *)self initWithValue:0.0];
}

- (double)value
{
  return self->_s.state.position + self->_o.state.position;
}

- (void)setValue:(double)a3
{
  self->_s.state.position = a3;
}

- (double)target
{
  return self->_s.anchor.anchor + self->_o.anchor;
}

- (void)setTarget:(double)a3
{
  double v4 = a3 - self->_o.anchor;
  double rubberbandRange = self->_rubberbandRange;
  if (rubberbandRange != 1.79769313e308)
  {
    double minimumTarget = self->_minimumTarget;
    double maximumTarget = self->_maximumTarget;
    if (v4 < maximumTarget) {
      double maximumTarget = v4;
    }
    if (maximumTarget >= minimumTarget) {
      double minimumTarget = maximumTarget;
    }
    double v4 = sub_10000705C(v4, minimumTarget, rubberbandRange, self->_rubberbandFactor);
  }
  if (self->_transitioningFromTracking && self->_retargetResponseFraction > 0.0)
  {
    self->_s.anchor.anchor = v4;
  }
  else
  {
    sub_100006150((uint64_t)&self->_s, v4);
  }
}

- (void)offsetBy:(double)a3
{
  self->_o.anchor = self->_o.anchor + a3;
}

- (void)offsetTo:(double)a3
{
  [(FLSpring *)self target];
  double v6 = a3 - v5;

  [(FLSpring *)self offsetBy:v6];
}

- (double)velocity
{
  return self->_s.state.velocity + self->_o.state.velocity;
}

- (void)setVelocity:(double)a3
{
  self->_s.state.velocity = a3;
}

- (BOOL)isStable
{
  memcpy(v8, &self->_s, sizeof(v8));
  BOOL v3 = sub_10000650C(v8);
  if (v3)
  {
    long long v4 = *(_OWORD *)&self->_o._beta;
    v8[4] = *(_OWORD *)&self->_o._previousStiffness;
    v8[5] = v4;
    v8[6] = *(_OWORD *)&self->_o._omega1;
    long long v5 = *(_OWORD *)&self->_o.mass;
    v8[0] = self->_o.state;
    v8[1] = v5;
    long long v6 = *(_OWORD *)&self->_o.stablePositionThreshold;
    v8[2] = *(_OWORD *)&self->_o.damping;
    v8[3] = v6;
    LOBYTE(v3) = sub_100005C74((double *)v8);
  }
  return v3;
}

- (double)stableValueThreshold
{
  return self->_stableValueThreshold;
}

- (void)setStableValueThreshold:(double)a3
{
  self->_stableValueThreshold = a3;
  self->_s.stablePositionThreshold = a3;
  self->_o.stablePositionThreshold = a3;
}

- (double)stableVelocityThreshold
{
  return self->_stableVelocityThreshold;
}

- (void)setStableVelocityThreshold:(double)a3
{
  self->_stableVelocityThreshold = a3;
  self->_s.stableVelocityThreshold = a3;
  self->_o.stableVelocityThreshold = a3;
}

- (double)projectedTarget
{
  if (self->_tracking)
  {
    uint64_t v2 = 488;
  }
  else
  {
    uint64_t v2 = 488;
    if (!self->_transitioningFromTracking) {
      uint64_t v2 = 16;
    }
  }
  [(FLSpring *)self _projectedTargetForVelocity:*(double *)((char *)&self->super.isa + v2) + self->_o.state.velocity];
  return result;
}

- (double)_projectedTargetForVelocity:(double)a3
{
  [(FLSpring *)self value];
  double projectionDeceleration = self->_projectionDeceleration;

  return sub_100007038(v5, a3, projectionDeceleration);
}

- (void)resetImmediatelyToValue:(double)a3
{
  p_stablePositionThreshold = &self->_s.stablePositionThreshold;
  [(FLSpring *)self _effectiveParameters];
  sub_100006030((uint64_t)v11, a3, 0.0, v6, v7);
  memcpy(&self->_s, v11, 0x160uLL);
  *(_OWORD *)p_stablePositionThreshold = *(_OWORD *)&self->_stableValueThreshold;
  sub_100005CA8((uint64_t)v11, 0.0, 0.0, 0.0, self->_offsetParameters.dampingRatio, self->_offsetParameters.response);
  long long v8 = v11[5];
  *(_OWORD *)&self->_o._previousStiffness = v11[4];
  *(_OWORD *)&self->_o._beta = v8;
  *(_OWORD *)&self->_o._omega1 = v11[6];
  long long v9 = v11[1];
  self->_o.state = (FLSimpleSpringState)v11[0];
  *(_OWORD *)&self->_o.mass = v9;
  long long v10 = v11[3];
  *(_OWORD *)&self->_o.damping = v11[2];
  *(_OWORD *)&self->_o.stablePositionThreshold = v10;
  *((_OWORD *)p_stablePositionThreshold + 4) = *(_OWORD *)&self->_stableValueThreshold;
  self->_previousTarget = a3;
  self->_targetVelocity = 0.0;
}

- (void)setParameters:(FLSpringParameters)a3
{
  if (self->_parameters.dampingRatio != a3.dampingRatio
    || self->_parameters.response != a3.response
    || self->_parameters.dampingRatioSmoothing != a3.dampingRatioSmoothing
    || self->_parameters.responseSmoothing != a3.responseSmoothing)
  {
    self->_parameters = a3;
    if (!self->_tracking) {
      [(FLSpring *)self _updateForEffectiveParameters];
    }
  }
}

- (void)setTrackingParameters:(FLSpringParameters)a3
{
  if (self->_trackingParameters.dampingRatio != a3.dampingRatio
    || self->_trackingParameters.response != a3.response
    || self->_trackingParameters.dampingRatioSmoothing != a3.dampingRatioSmoothing
    || self->_trackingParameters.responseSmoothing != a3.responseSmoothing)
  {
    self->_trackingParameters = a3;
    if (self->_tracking) {
      [(FLSpring *)self _updateForEffectiveParameters];
    }
  }
}

- (void)setTracking:(BOOL)a3
{
  BOOL tracking = self->_tracking;
  if (tracking != a3)
  {
    BOOL v5 = !tracking;
    BOOL v6 = !a3;
    if (v5) {
      BOOL v6 = 0;
    }
    self->_transitioningFromTracking = v6;
    self->_BOOL tracking = a3;
    if (!a3)
    {
      double v7 = self->_retargetResponseFraction * self->_parameters.response;
      [(FLSpring *)self _projectedTargetForVelocity:self->_targetVelocity];
      sub_1000061CC((uint64_t)&self->_s, self->_s.anchor.anchor, v8, v7);
    }
    [(FLSpring *)self _updateForEffectiveParameters];
  }
}

- (double)timeFactor
{
  return self->_timeFactor;
}

- (void)setTimeFactor:(double)a3
{
  self->_timeFactor = fmax(a3, 0.0);
}

- (void)step:(double)a3
{
  double anchor = self->_s.anchor.anchor;
  double v6 = anchor - self->_previousTarget;
  double v7 = v6 / a3 * 0.25 + self->_targetVelocity * 0.75;
  self->_transitioningFromTracking = 0;
  self->_targetVelocity = v7;
  self->_previousTarget = anchor;
  if (self->_retargetImpulse > 0.0)
  {
    *(void *)&__src[0] = 0;
    [(FLSpring *)self _effectiveParameters];
    sub_100005FB4((double *)__src, 0, v8, v9);
    self->_s.state.velocity = self->_s.state.velocity + v6 * *(double *)__src * self->_retargetImpulse;
  }
  double v10 = self->_timeFactor * a3;
  memcpy(v18, &self->_s, sizeof(v18));
  sub_100006310(v18, (double *)__src, v10);
  memcpy(&self->_s, __src, sizeof(self->_s));
  double v11 = self->_timeFactor * a3;
  long long v12 = *(_OWORD *)&self->_o._beta;
  v18[4] = *(_OWORD *)&self->_o._previousStiffness;
  v18[5] = v12;
  v18[6] = *(_OWORD *)&self->_o._omega1;
  long long v13 = *(_OWORD *)&self->_o.mass;
  v18[0] = self->_o.state;
  v18[1] = v13;
  long long v14 = *(_OWORD *)&self->_o.stablePositionThreshold;
  v18[2] = *(_OWORD *)&self->_o.damping;
  v18[3] = v14;
  sub_100005D70((uint64_t)v18, (uint64_t)__src, v11);
  long long v15 = __src[5];
  *(_OWORD *)&self->_o._previousStiffness = __src[4];
  *(_OWORD *)&self->_o._beta = v15;
  *(_OWORD *)&self->_o._omega1 = __src[6];
  long long v16 = __src[1];
  self->_o.state = (FLSimpleSpringState)__src[0];
  *(_OWORD *)&self->_o.mass = v16;
  long long v17 = __src[3];
  *(_OWORD *)&self->_o.damping = __src[2];
  *(_OWORD *)&self->_o.stablePositionThreshold = v17;
}

- (FLSpringParameters)_effectiveParameters
{
  uint64_t v2 = 632;
  if (!self->_tracking) {
    uint64_t v2 = 600;
  }
  uint64_t v3 = 640;
  if (!self->_tracking) {
    uint64_t v3 = 608;
  }
  uint64_t v4 = 648;
  if (!self->_tracking) {
    uint64_t v4 = 616;
  }
  uint64_t v5 = 656;
  if (!self->_tracking) {
    uint64_t v5 = 624;
  }
  double v6 = *(double *)((char *)&self->super.isa + v5);
  double v7 = *(double *)((char *)&self->super.isa + v4);
  double v8 = *(double *)((char *)&self->super.isa + v2);
  double v9 = *(double *)((char *)&self->super.isa + v3);
  result.responseSmoothing = v6;
  result.response = v7;
  result.dampingRatioSmoothing = v9;
  result.dampingRatio = v8;
  return result;
}

- (void)_updateForEffectiveParameters
{
  [(FLSpring *)self _effectiveParameters];
  double v4 = v3;
  double v6 = v5;
  p_s = &self->_s;
  sub_100006230((uint64_t)p_s, v8, v9);

  sub_1000062A8((uint64_t)p_s, v4, v6);
}

- (double)retargetImpulse
{
  return self->_retargetImpulse;
}

- (void)setRetargetImpulse:(double)a3
{
  self->_retargetImpulse = a3;
}

- (FLSpringParameters)parameters
{
  double dampingRatio = self->_parameters.dampingRatio;
  double dampingRatioSmoothing = self->_parameters.dampingRatioSmoothing;
  double response = self->_parameters.response;
  double responseSmoothing = self->_parameters.responseSmoothing;
  result.double responseSmoothing = responseSmoothing;
  result.double response = response;
  result.double dampingRatioSmoothing = dampingRatioSmoothing;
  result.double dampingRatio = dampingRatio;
  return result;
}

- (FLSpringParameters)trackingParameters
{
  double dampingRatio = self->_trackingParameters.dampingRatio;
  double dampingRatioSmoothing = self->_trackingParameters.dampingRatioSmoothing;
  double response = self->_trackingParameters.response;
  double responseSmoothing = self->_trackingParameters.responseSmoothing;
  result.double responseSmoothing = responseSmoothing;
  result.double response = response;
  result.double dampingRatioSmoothing = dampingRatioSmoothing;
  result.double dampingRatio = dampingRatio;
  return result;
}

- (BOOL)isTracking
{
  return self->_tracking;
}

- (double)minimumTarget
{
  return self->_minimumTarget;
}

- (void)setMinimumTarget:(double)a3
{
  self->_double minimumTarget = a3;
}

- (double)maximumTarget
{
  return self->_maximumTarget;
}

- (void)setMaximumTarget:(double)a3
{
  self->_double maximumTarget = a3;
}

- (double)rubberbandRange
{
  return self->_rubberbandRange;
}

- (void)setRubberbandRange:(double)a3
{
  self->_double rubberbandRange = a3;
}

- (double)rubberbandFactor
{
  return self->_rubberbandFactor;
}

- (void)setRubberbandFactor:(double)a3
{
  self->_rubberbandFactor = a3;
}

- (double)retargetResponseFraction
{
  return self->_retargetResponseFraction;
}

- (void)setRetargetResponseFraction:(double)a3
{
  self->_retargetResponseFraction = a3;
}

- (double)projectionDeceleration
{
  return self->_projectionDeceleration;
}

- (void)setProjectionDeceleration:(double)a3
{
  self->_double projectionDeceleration = a3;
}

- (FLSpringParameters)offsetParameters
{
  double dampingRatio = self->_offsetParameters.dampingRatio;
  double dampingRatioSmoothing = self->_offsetParameters.dampingRatioSmoothing;
  double response = self->_offsetParameters.response;
  double responseSmoothing = self->_offsetParameters.responseSmoothing;
  result.double responseSmoothing = responseSmoothing;
  result.double response = response;
  result.double dampingRatioSmoothing = dampingRatioSmoothing;
  result.double dampingRatio = dampingRatio;
  return result;
}

- (void)setOffsetParameters:(FLSpringParameters)a3
{
  self->_offsetParameters = a3;
}

@end