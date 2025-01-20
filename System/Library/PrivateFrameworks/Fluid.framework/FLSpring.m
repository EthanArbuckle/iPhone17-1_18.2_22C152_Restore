@interface FLSpring
+ (id)springWithValue:(double)a3;
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
- (void)resetToTarget;
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

+ (id)springWithValue:(double)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithValue:a3];
  return v3;
}

- (FLSpring)initWithValue:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FLSpring;
  v4 = [(FLSpring *)&v8 init];
  v5 = v4;
  if (v4)
  {
    *(_OWORD *)&v4->_parameters.response = unk_24F3EF0C0;
    *(_OWORD *)&v4->_trackingParameters.dampingRatio = FLSpringParametersTight;
    v4->_timeFactor = 1.0;
    *(_OWORD *)&v4->_trackingParameters.response = unk_24F3EF0E0;
    *(_OWORD *)&v4->_offsetParameters.dampingRatio = FLSpringParametersBouncy;
    *(_OWORD *)&v4->_offsetParameters.response = unk_24F3EF0C0;
    v4->_rubberbandFactor = 0.55;
    v4->_rubberbandRange = 1.79769313e308;
    v4->_retargetResponseFraction = 0.15;
    *(_OWORD *)&v4->_projectionDeceleration = xmmword_24F3EF0A0;
    *(_OWORD *)&v4->_parameters.dampingRatio = FLSpringParametersBouncy;
    [(FLSpring *)v4 resetImmediatelyToValue:a3];
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
    double v4 = FLRubberbandValue(v4, minimumTarget, rubberbandRange, self->_rubberbandFactor);
  }
  if (self->_transitioningFromTracking && self->_retargetResponseFraction > 0.0)
  {
    self->_s.anchor.anchor = v4;
  }
  else
  {
    FLCompoundSpringSetAnchorImmediately((uint64_t)&self->_s, v4);
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
  BOOL IsStable = FLCompoundSpringIsStable((uint64_t)v8);
  if (IsStable)
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
    LOBYTE(IsStable) = FLSimpleSpringIsStable((double *)v8);
  }
  return IsStable;
}

- (double)stableValueThreshold
{
  return self->_s.stablePositionThreshold;
}

- (void)setStableValueThreshold:(double)a3
{
  self->_s.stablePositionThreshold = a3;
  self->_o.stablePositionThreshold = a3;
}

- (double)stableVelocityThreshold
{
  return self->_s.stableVelocityThreshold;
}

- (void)setStableVelocityThreshold:(double)a3
{
  self->_s.stableVelocityThreshold = a3;
  self->_o.stablePositionThreshold = a3;
}

- (double)projectedTarget
{
  if (self->_tracking)
  {
    uint64_t v2 = 712;
  }
  else
  {
    uint64_t v2 = 712;
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
  return FLDeceleratedRestPosition(v5, a3, projectionDeceleration);
}

- (void)resetImmediatelyToValue:(double)a3
{
  [(FLSpring *)self _effectiveParameters];
  FLCompoundSpringMakeWithDampingRatioResponse((uint64_t)v10, a3, 0.0, v5, v6, self->_s.stablePositionThreshold, self->_s.stableVelocityThreshold);
  memcpy(&self->_s, v10, sizeof(self->_s));
  FLSimpleSpringMakeWithDampingRatioResponse((uint64_t)v10, 0.0, 0.0, 0.0, self->_offsetParameters.dampingRatio, self->_offsetParameters.response, self->_s.stablePositionThreshold, self->_s.stableVelocityThreshold);
  long long v7 = v10[5];
  *(_OWORD *)&self->_o._previousStiffness = v10[4];
  *(_OWORD *)&self->_o._beta = v7;
  *(_OWORD *)&self->_o._omega1 = v10[6];
  long long v8 = v10[1];
  self->_o.state = (FLSimpleSpringState)v10[0];
  *(_OWORD *)&self->_o.mass = v8;
  long long v9 = v10[3];
  *(_OWORD *)&self->_o.damping = v10[2];
  *(_OWORD *)&self->_o.stablePositionThreshold = v9;
  self->_previousTarget = a3;
  self->_targetVelocity = 0.0;
}

- (void)resetToTarget
{
  [(FLSpring *)self target];
  -[FLSpring resetImmediatelyToValue:](self, "resetImmediatelyToValue:");
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
      FLCompoundSpringSetAnchorWithIntermediatePositionAndResponse((uint64_t)&self->_s, self->_s.anchor.anchor, v8, v7);
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
  self->_transitioningFromTracking = 0;
  double anchor = self->_s.anchor.anchor;
  double v6 = anchor - self->_previousTarget;
  self->_previousTarget = anchor;
  self->_targetVelocity = v6 / a3 * 0.25 + self->_targetVelocity * 0.75;
  if (self->_retargetImpulse > 0.0)
  {
    *(void *)&__src[0] = 0;
    [(FLSpring *)self _effectiveParameters];
    FLSpringConvertDampingRatioResponseToStiffnessDamping((double *)__src, 0, v7, v8);
    self->_s.state.velocity = self->_s.state.velocity + v6 * *(double *)__src * self->_retargetImpulse;
  }
  double v9 = self->_timeFactor * a3;
  memcpy(v17, &self->_s, sizeof(v17));
  FLCompoundSpringStep(v17, (double *)__src, v9);
  memcpy(&self->_s, __src, sizeof(self->_s));
  double v10 = self->_timeFactor * a3;
  long long v11 = *(_OWORD *)&self->_o._beta;
  v17[4] = *(_OWORD *)&self->_o._previousStiffness;
  v17[5] = v11;
  v17[6] = *(_OWORD *)&self->_o._omega1;
  long long v12 = *(_OWORD *)&self->_o.mass;
  v17[0] = self->_o.state;
  v17[1] = v12;
  long long v13 = *(_OWORD *)&self->_o.stablePositionThreshold;
  v17[2] = *(_OWORD *)&self->_o.damping;
  v17[3] = v13;
  FLSimpleSpringStep((uint64_t)v17, (uint64_t)__src, v10);
  long long v14 = __src[5];
  *(_OWORD *)&self->_o._previousStiffness = __src[4];
  *(_OWORD *)&self->_o._beta = v14;
  *(_OWORD *)&self->_o._omega1 = __src[6];
  long long v15 = __src[1];
  self->_o.state = (FLSimpleSpringState)__src[0];
  *(_OWORD *)&self->_o.mass = v15;
  long long v16 = __src[3];
  *(_OWORD *)&self->_o.damping = __src[2];
  *(_OWORD *)&self->_o.stablePositionThreshold = v16;
}

- (FLSpringParameters)_effectiveParameters
{
  uint64_t v2 = 832;
  if (!self->_tracking) {
    uint64_t v2 = 800;
  }
  uint64_t v3 = 840;
  if (!self->_tracking) {
    uint64_t v3 = 808;
  }
  uint64_t v4 = 848;
  if (!self->_tracking) {
    uint64_t v4 = 816;
  }
  uint64_t v5 = 856;
  if (!self->_tracking) {
    uint64_t v5 = 824;
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
  FLCompoundSpringSetDampingRatioSmoothly((uint64_t)p_s, v8, v9);
  FLCompoundSpringSetResponseSmoothly((uint64_t)p_s, v4, v6);
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

- (double)retargetImpulse
{
  return self->_retargetImpulse;
}

- (void)setRetargetImpulse:(double)a3
{
  self->_retargetImpulse = a3;
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