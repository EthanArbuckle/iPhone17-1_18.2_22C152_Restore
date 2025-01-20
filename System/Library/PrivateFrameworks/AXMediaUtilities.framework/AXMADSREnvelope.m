@interface AXMADSREnvelope
+ (id)defaultEnvelope;
- (AXMADSREnvelope)init;
- (AXMADSREnvelope)initWithAttackDuration:(double)a3 attackLevel:(double)a4 decayDuration:(double)a5 sustainDuration:(double)a6 sustainLevel:(double)a7 releaseDuration:(double)a8;
- (double)attackLevel;
- (double)attackMS;
- (double)decayMS;
- (double)lengthMS;
- (double)levelForTime:(double)a3;
- (double)releaseMS;
- (double)sustainLevel;
- (double)sustainMS;
- (id)copy;
- (void)setAttackLevel:(double)a3;
- (void)setAttackMS:(double)a3;
- (void)setDecayMS:(double)a3;
- (void)setReleaseMS:(double)a3;
- (void)setSustainLevel:(double)a3;
- (void)setSustainMS:(double)a3;
@end

@implementation AXMADSREnvelope

+ (id)defaultEnvelope
{
  v2 = [[AXMADSREnvelope alloc] initWithAttackDuration:20.0 attackLevel:1.0 decayDuration:200.0 sustainDuration:50.0 sustainLevel:0.0 releaseDuration:50.0];

  return v2;
}

- (AXMADSREnvelope)initWithAttackDuration:(double)a3 attackLevel:(double)a4 decayDuration:(double)a5 sustainDuration:(double)a6 sustainLevel:(double)a7 releaseDuration:(double)a8
{
  v15.receiver = self;
  v15.super_class = (Class)AXMADSREnvelope;
  result = [(AXMADSREnvelope *)&v15 init];
  if (result)
  {
    result->_attackMS = a3;
    result->_attackLevel = a4;
    result->_decayMS = a5;
    result->_sustainMS = a6;
    result->_sustainLevel = a7;
    result->_releaseMS = a8;
  }
  return result;
}

- (AXMADSREnvelope)init
{
  return [(AXMADSREnvelope *)self initWithAttackDuration:0.0 attackLevel:0.0 decayDuration:0.0 sustainDuration:0.0 sustainLevel:0.0 releaseDuration:0.0];
}

- (id)copy
{
  v3 = [AXMADSREnvelope alloc];
  double attackMS = self->_attackMS;
  double attackLevel = self->_attackLevel;
  double decayMS = self->_decayMS;
  double sustainMS = self->_sustainMS;
  double sustainLevel = self->_sustainLevel;
  double releaseMS = self->_releaseMS;

  return [(AXMADSREnvelope *)v3 initWithAttackDuration:attackMS attackLevel:attackLevel decayDuration:decayMS sustainDuration:sustainMS sustainLevel:sustainLevel releaseDuration:releaseMS];
}

- (double)lengthMS
{
  [(AXMADSREnvelope *)self attackMS];
  double v4 = v3;
  [(AXMADSREnvelope *)self decayMS];
  double v6 = v4 + v5;
  [(AXMADSREnvelope *)self sustainMS];
  double v8 = v6 + v7;
  [(AXMADSREnvelope *)self releaseMS];
  return v8 + v9;
}

- (double)levelForTime:(double)a3
{
  [(AXMADSREnvelope *)self attackMS];
  double v6 = v5;
  [(AXMADSREnvelope *)self attackMS];
  double v8 = v7;
  if (v6 > a3)
  {
    [(AXMADSREnvelope *)self attackLevel];
    return a3 / v8 * v9;
  }
  [(AXMADSREnvelope *)self decayMS];
  double v12 = v8 + v11;
  [(AXMADSREnvelope *)self attackMS];
  double v14 = v13;
  if (v12 > a3)
  {
    double v15 = a3 - v13;
    [(AXMADSREnvelope *)self decayMS];
    double v17 = v16;
    [(AXMADSREnvelope *)self attackLevel];
    double v19 = v18;
    [(AXMADSREnvelope *)self attackLevel];
    double v21 = v20;
    [(AXMADSREnvelope *)self sustainLevel];
    double v23 = v21 - v22;
    double v24 = -v15;
    return v19 + v24 / v17 * v23;
  }
  [(AXMADSREnvelope *)self decayMS];
  double v26 = v14 + v25;
  [(AXMADSREnvelope *)self sustainMS];
  if (v26 + v27 <= a3)
  {
    [(AXMADSREnvelope *)self attackMS];
    double v29 = a3 - v28;
    [(AXMADSREnvelope *)self decayMS];
    double v31 = v29 - v30;
    [(AXMADSREnvelope *)self sustainMS];
    double v33 = v31 - v32;
    [(AXMADSREnvelope *)self releaseMS];
    double v17 = v34;
    [(AXMADSREnvelope *)self sustainLevel];
    double v19 = v35;
    [(AXMADSREnvelope *)self sustainLevel];
    double v24 = -v33;
    return v19 + v24 / v17 * v23;
  }

  [(AXMADSREnvelope *)self sustainLevel];
  return result;
}

- (double)attackMS
{
  return self->_attackMS;
}

- (void)setAttackMS:(double)a3
{
  self->_double attackMS = a3;
}

- (double)attackLevel
{
  return self->_attackLevel;
}

- (void)setAttackLevel:(double)a3
{
  self->_double attackLevel = a3;
}

- (double)decayMS
{
  return self->_decayMS;
}

- (void)setDecayMS:(double)a3
{
  self->_double decayMS = a3;
}

- (double)sustainMS
{
  return self->_sustainMS;
}

- (void)setSustainMS:(double)a3
{
  self->_double sustainMS = a3;
}

- (double)sustainLevel
{
  return self->_sustainLevel;
}

- (void)setSustainLevel:(double)a3
{
  self->_double sustainLevel = a3;
}

- (double)releaseMS
{
  return self->_releaseMS;
}

- (void)setReleaseMS:(double)a3
{
  self->_double releaseMS = a3;
}

@end