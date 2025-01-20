@interface ARFLSpring
+ (id)springWithValue:(double)a3;
- (ARFLSpring)init;
- (ARFLSpring)initWithValue:(double)a3;
- (ARFLSpringParameters)_effectiveParameters;
- (ARFLSpringParameters)parameters;
- (ARFLSpringParameters)trackingParameters;
- (BOOL)isTracking;
- (BOOL)usesDampingRatioResponseForSmoothing;
- (double)_projectedTargetForVelocity:(double)a3;
- (double)maximumTarget;
- (double)minimumTarget;
- (double)projectedTarget;
- (double)projectionDeceleration;
- (double)retargetResponseFraction;
- (double)rubberbandFactor;
- (double)rubberbandRange;
- (double)target;
- (double)value;
- (double)velocity;
- (void)_updateForEffectiveParameters;
- (void)resetImmediatelyToValue:(double)a3;
- (void)setMaximumTarget:(double)a3;
- (void)setMinimumTarget:(double)a3;
- (void)setParameters:(ARFLSpringParameters)a3;
- (void)setProjectionDeceleration:(double)a3;
- (void)setRetargetResponseFraction:(double)a3;
- (void)setRubberbandFactor:(double)a3;
- (void)setRubberbandRange:(double)a3;
- (void)setTarget:(double)a3;
- (void)setTracking:(BOOL)a3;
- (void)setTrackingParameters:(ARFLSpringParameters)a3;
- (void)setUsesDampingRatioResponseForSmoothing:(BOOL)a3;
- (void)setValue:(double)a3;
- (void)setVelocity:(double)a3;
- (void)step:(double)a3;
@end

@implementation ARFLSpring

+ (id)springWithValue:(double)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithValue:a3];

  return v3;
}

- (ARFLSpring)initWithValue:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ARFLSpring;
  v4 = [(ARFLSpring *)&v8 init];
  v5 = (ARFLSpring *)v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 424) = ARFLSpringParametersBouncy;
    *(_OWORD *)(v4 + 440) = unk_20B231FB0;
    *(_OWORD *)(v4 + 456) = ARFLSpringParametersTight;
    *(_OWORD *)(v4 + 472) = unk_20B231FD0;
    *((void *)v4 + 50) = 0x3FE199999999999ALL;
    *((void *)v4 + 49) = 0x7FEFFFFFFFFFFFFFLL;
    *((void *)v4 + 51) = 0x3FC3333333333333;
    *((void *)v4 + 52) = 0x3FEFD70A3D70A3D7;
    [v4 resetImmediatelyToValue:a3];
    v6 = v5;
  }

  return v5;
}

- (ARFLSpring)init
{
  return [(ARFLSpring *)self initWithValue:0.0];
}

- (double)value
{
  return self->_s.state.position;
}

- (void)setValue:(double)a3
{
  self->_s.state.position = a3;
}

- (double)target
{
  return self->_s.anchor.anchor;
}

- (void)setTarget:(double)a3
{
  double rubberbandRange = self->_rubberbandRange;
  if (rubberbandRange != 1.79769313e308)
  {
    double maximumTarget = self->_maximumTarget;
    if (maximumTarget > a3) {
      double maximumTarget = a3;
    }
    if (maximumTarget < self->_minimumTarget) {
      double maximumTarget = self->_minimumTarget;
    }
    a3 = ARFLRubberbandValue(a3, maximumTarget, rubberbandRange, self->_rubberbandFactor);
  }
  if (self->_transitioningFromTracking && self->_retargetResponseFraction > 0.0)
  {
    self->_s.anchor.anchor = a3;
  }
  else
  {
    ARFLCompoundSpringSetAnchorImmediately((uint64_t)&self->_s, a3);
  }
}

- (double)velocity
{
  return self->_s.state.velocity;
}

- (void)setVelocity:(double)a3
{
  self->_s.state.velocity = a3;
}

- (double)projectedTarget
{
  if (self->_tracking)
  {
    uint64_t v2 = 352;
  }
  else
  {
    uint64_t v2 = 352;
    if (!self->_transitioningFromTracking) {
      uint64_t v2 = 16;
    }
  }
  [(ARFLSpring *)self _projectedTargetForVelocity:*(double *)((char *)&self->super.isa + v2)];
  return result;
}

- (double)_projectedTargetForVelocity:(double)a3
{
  [(ARFLSpring *)self value];
  double projectionDeceleration = self->_projectionDeceleration;

  return ARFLDeceleratedRestPosition(v5, a3, projectionDeceleration);
}

- (void)resetImmediatelyToValue:(double)a3
{
  [(ARFLSpring *)self _effectiveParameters];
  ARFLCompoundSpringMakeWithDampingRatioResponse((uint64_t)__src, a3, 0.0, v5, v6);
  memcpy(&self->_s, __src, sizeof(self->_s));
  self->_previousTarget = a3;
  self->_targetVelocity = 0.0;
}

- (void)setParameters:(ARFLSpringParameters)a3
{
  if (self->_parameters.dampingRatio != a3.dampingRatio
    || self->_parameters.response != a3.response
    || self->_parameters.dampingRatioSmoothing != a3.dampingRatioSmoothing
    || self->_parameters.responseSmoothing != a3.responseSmoothing)
  {
    self->_parameters = a3;
    if (!self->_tracking) {
      [(ARFLSpring *)self _updateForEffectiveParameters];
    }
  }
}

- (void)setTrackingParameters:(ARFLSpringParameters)a3
{
  if (self->_trackingParameters.dampingRatio != a3.dampingRatio
    || self->_trackingParameters.response != a3.response
    || self->_trackingParameters.dampingRatioSmoothing != a3.dampingRatioSmoothing
    || self->_trackingParameters.responseSmoothing != a3.responseSmoothing)
  {
    self->_trackingParameters = a3;
    if (self->_tracking) {
      [(ARFLSpring *)self _updateForEffectiveParameters];
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
      [(ARFLSpring *)self _projectedTargetForVelocity:self->_targetVelocity];
      ARFLCompoundSpringSetAnchorWithIntermediatePositionAndResponse((uint64_t)&self->_s, self->_s.anchor.anchor, v8, v7);
    }
    [(ARFLSpring *)self _updateForEffectiveParameters];
  }
}

- (BOOL)usesDampingRatioResponseForSmoothing
{
  return self->_s.usesDampingRatioResponse;
}

- (void)setUsesDampingRatioResponseForSmoothing:(BOOL)a3
{
  self->_s.usesDampingRatioResponse = a3;
}

- (void)step:(double)a3
{
  p_s = &self->_s;
  memcpy(v7, &self->_s, sizeof(v7));
  ARFLCompoundSpringStep(v7, __src, a3);
  memcpy(p_s, __src, sizeof(ARFLCompoundSpring));
  double anchor = self->_s.anchor.anchor;
  self->_targetVelocity = (anchor - self->_previousTarget) / a3 * 0.25 + self->_targetVelocity * 0.75;
  self->_previousTarget = anchor;
  self->_transitioningFromTracking = 0;
}

- (ARFLSpringParameters)_effectiveParameters
{
  uint64_t v2 = 456;
  if (!self->_tracking) {
    uint64_t v2 = 424;
  }
  uint64_t v3 = 464;
  if (!self->_tracking) {
    uint64_t v3 = 432;
  }
  uint64_t v4 = 472;
  if (!self->_tracking) {
    uint64_t v4 = 440;
  }
  uint64_t v5 = 480;
  if (!self->_tracking) {
    uint64_t v5 = 448;
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
  [(ARFLSpring *)self _effectiveParameters];
  double v6 = v4;
  double v7 = v5;
  double v9 = v8;
  BOOL usesDampingRatioResponse = self->_s.usesDampingRatioResponse;
  p_s = &self->_s;
  if (usesDampingRatioResponse)
  {
    ARFLCompoundSpringSetDampingRatioSmoothly((uint64_t)p_s, v3, v4);
    ARFLCompoundSpringSetResponseSmoothly((uint64_t)p_s, v7, v9);
  }
  else
  {
    double v12 = 0.0;
    double v13 = 0.0;
    ARFLSpringConvertDampingRatioResponseToStiffnessDamping(&v13, &v12, v3, v5);
    ARFLCompoundSpringSetStiffnessWithResponse((uint64_t)p_s, v13, v9);
    ARFLCompoundSpringSetDampingWithResponse((uint64_t)p_s, v12, v6);
  }
}

- (ARFLSpringParameters)parameters
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

- (ARFLSpringParameters)trackingParameters
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
  self->_minimumTarget = a3;
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

@end