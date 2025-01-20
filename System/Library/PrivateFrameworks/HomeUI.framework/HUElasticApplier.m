@interface HUElasticApplier
- (BOOL)applyOnlyOnProgressChanges;
- (BOOL)complete:(BOOL)a3;
- (BOOL)completesWhenAtRest;
- (BOOL)progressBeginsFromInitialInputProgress;
- (BOOL)start;
- (CADisplayLink)displayLink;
- (HUElasticApplier)init;
- (HUElasticApplier)initWithProgressInputBlock:(id)a3;
- (double)currentVelocity;
- (double)friction;
- (double)previousForce;
- (double)tension;
- (id)progressInputBlock;
- (unint64_t)frameCount;
- (unint64_t)restingFrameCount;
- (void)_displayLinkTick;
- (void)_invalidateDisplayLinkIfNecessary;
- (void)_updateProgressForInitialUpdate:(BOOL)a3;
- (void)setApplyOnlyOnProgressChanges:(BOOL)a3;
- (void)setCompletesWhenAtRest:(BOOL)a3;
- (void)setCurrentVelocity:(double)a3;
- (void)setDisplayLink:(id)a3;
- (void)setFrameCount:(unint64_t)a3;
- (void)setFriction:(double)a3;
- (void)setPreviousForce:(double)a3;
- (void)setProgressBeginsFromInitialInputProgress:(BOOL)a3;
- (void)setProgressInputBlock:(id)a3;
- (void)setRestingFrameCount:(unint64_t)a3;
- (void)setTension:(double)a3;
@end

@implementation HUElasticApplier

- (HUElasticApplier)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithProgressInputBlock_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUElasticApplier.m", 37, @"%s is unavailable; use %@ instead",
    "-[HUElasticApplier init]",
    v5);

  return 0;
}

- (HUElasticApplier)initWithProgressInputBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HUElasticApplier.m", 42, @"Invalid parameter not satisfying: %@", @"progressInputBlock" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)HUElasticApplier;
  v6 = [(HUApplier *)&v10 init];
  v7 = v6;
  if (v6)
  {
    [(HUElasticApplier *)v6 setProgressInputBlock:v5];
    v7->_applyOnlyOnProgressChanges = 1;
    v7->_completesWhenAtRest = 1;
    v7->_tension = 200.0;
    v7->_friction = 8.0;
  }

  return v7;
}

- (BOOL)start
{
  v10.receiver = self;
  v10.super_class = (Class)HUElasticApplier;
  BOOL v3 = [(HUApplier *)&v10 start];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__displayLinkTick];
    [(HUElasticApplier *)self setDisplayLink:v4];

    id v5 = [(HUElasticApplier *)self displayLink];
    v6 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v5 addToRunLoop:v6 forMode:*MEMORY[0x1E4F1C4B0]];

    v7 = [(HUElasticApplier *)self displayLink];
    CAFrameRateRange v11 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v7, "setPreferredFrameRateRange:", *(double *)&v11.minimum, *(double *)&v11.maximum, *(double *)&v11.preferred);

    v8 = [(HUElasticApplier *)self displayLink];
    [v8 setHighFrameRateReason:1769473];

    [(HUElasticApplier *)self _updateProgressForInitialUpdate:1];
  }
  return v3;
}

- (void)_displayLinkTick
{
}

- (void)_updateProgressForInitialUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (double)[(HUElasticApplier *)self frameCount] * 0.0166666667;
  v6 = [(HUElasticApplier *)self progressInputBlock];
  double v7 = v6[2](v5);

  if (!v3
    || (double v8 = v7,
        ![(HUElasticApplier *)self progressBeginsFromInitialInputProgress]))
  {
    [(HUApplier *)self progress];
    double v8 = v9;
  }
  [(HUElasticApplier *)self tension];
  double v11 = v10 * (v7 - v8);
  if (v3) {
    double v12 = 0.0;
  }
  else {
    double v12 = 0.0166666667;
  }
  double v13 = v8 + v12 * v11 * v12;
  [(HUElasticApplier *)self friction];
  double v15 = fmax(1.0 - v12 * v14, 0.0);
  [(HUElasticApplier *)self previousForce];
  double v17 = v15 * (v13 - v16) / 0.0166666667;
  double v18 = v13 + v17 * v12;
  double v19 = vabdd_f64(v18, v8);
  [(HUElasticApplier *)self setPreviousForce:v13];
  [(HUElasticApplier *)self setCurrentVelocity:v17];
  [(HUElasticApplier *)self setFrameCount:[(HUElasticApplier *)self frameCount] + 1];
  if (v19 > 0.001 || v3 || ![(HUElasticApplier *)self applyOnlyOnProgressChanges]) {
    [(HUApplier *)self updateProgress:v18];
  }
  if (v19 <= 0.001 && [(HUElasticApplier *)self completesWhenAtRest])
  {
    [(HUElasticApplier *)self setRestingFrameCount:[(HUElasticApplier *)self restingFrameCount] + 1];
    if ([(HUElasticApplier *)self restingFrameCount] >= 3)
    {
      [(HUElasticApplier *)self complete:1];
    }
  }
  else
  {
    [(HUElasticApplier *)self setRestingFrameCount:0];
  }
}

- (void)_invalidateDisplayLinkIfNecessary
{
  BOOL v3 = [(HUElasticApplier *)self displayLink];
  [v3 invalidate];

  [(HUElasticApplier *)self setDisplayLink:0];
}

- (BOOL)complete:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUElasticApplier;
  BOOL v4 = [(HUApplier *)&v6 complete:a3];
  if (v4) {
    [(HUElasticApplier *)self _invalidateDisplayLinkIfNecessary];
  }
  return v4;
}

- (double)friction
{
  return self->_friction;
}

- (void)setFriction:(double)a3
{
  self->_friction = a3;
}

- (double)tension
{
  return self->_tension;
}

- (void)setTension:(double)a3
{
  self->_tension = a3;
}

- (BOOL)completesWhenAtRest
{
  return self->_completesWhenAtRest;
}

- (void)setCompletesWhenAtRest:(BOOL)a3
{
  self->_completesWhenAtRest = a3;
}

- (BOOL)progressBeginsFromInitialInputProgress
{
  return self->_progressBeginsFromInitialInputProgress;
}

- (void)setProgressBeginsFromInitialInputProgress:(BOOL)a3
{
  self->_progressBeginsFromInitialInputProgress = a3;
}

- (BOOL)applyOnlyOnProgressChanges
{
  return self->_applyOnlyOnProgressChanges;
}

- (void)setApplyOnlyOnProgressChanges:(BOOL)a3
{
  self->_applyOnlyOnProgressChanges = a3;
}

- (double)currentVelocity
{
  return self->_currentVelocity;
}

- (void)setCurrentVelocity:(double)a3
{
  self->_currentVelocity = a3;
}

- (id)progressInputBlock
{
  return self->_progressInputBlock;
}

- (void)setProgressInputBlock:(id)a3
{
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (unint64_t)frameCount
{
  return self->_frameCount;
}

- (void)setFrameCount:(unint64_t)a3
{
  self->_frameCount = a3;
}

- (unint64_t)restingFrameCount
{
  return self->_restingFrameCount;
}

- (void)setRestingFrameCount:(unint64_t)a3
{
  self->_restingFrameCount = a3;
}

- (double)previousForce
{
  return self->_previousForce;
}

- (void)setPreviousForce:(double)a3
{
  self->_previousForce = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);

  objc_storeStrong(&self->_progressInputBlock, 0);
}

@end