@interface HUDisplayLinkApplier
- (BOOL)applyOnlyOnProgressChanges;
- (BOOL)complete:(BOOL)a3;
- (BOOL)completesWhenAtRest;
- (BOOL)isAtRest;
- (BOOL)start;
- (CADisplayLink)displayLink;
- (HUDisplayLinkApplier)init;
- (HUDisplayLinkApplier)initWithProgressInputBlock:(id)a3;
- (double)effectiveInputProgressForBlock:(id)a3;
- (id)progressInputBlock;
- (unint64_t)restingFrameCount;
- (void)_displayLinkTick;
- (void)_invalidateDisplayLinkIfNecessary;
- (void)_updateProgressForInitialUpdate:(BOOL)a3;
- (void)setApplyOnlyOnProgressChanges:(BOOL)a3;
- (void)setAtRest:(BOOL)a3;
- (void)setCompletesWhenAtRest:(BOOL)a3;
- (void)setDisplayLink:(id)a3;
- (void)setProgressInputBlock:(id)a3;
- (void)setRestingFrameCount:(unint64_t)a3;
@end

@implementation HUDisplayLinkApplier

- (HUDisplayLinkApplier)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithProgressInputBlock_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUDisplayLinkApplier.m", 34, @"%s is unavailable; use %@ instead",
    "-[HUDisplayLinkApplier init]",
    v5);

  return 0;
}

- (HUDisplayLinkApplier)initWithProgressInputBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HUDisplayLinkApplier.m", 39, @"Invalid parameter not satisfying: %@", @"progressInputBlock" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)HUDisplayLinkApplier;
  v6 = [(HUApplier *)&v10 init];
  v7 = v6;
  if (v6)
  {
    [(HUDisplayLinkApplier *)v6 setProgressInputBlock:v5];
    v7->_applyOnlyOnProgressChanges = 1;
    v7->_completesWhenAtRest = 1;
  }

  return v7;
}

- (BOOL)start
{
  v10.receiver = self;
  v10.super_class = (Class)HUDisplayLinkApplier;
  BOOL v3 = [(HUApplier *)&v10 start];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__displayLinkTick];
    [(HUDisplayLinkApplier *)self setDisplayLink:v4];

    id v5 = [(HUDisplayLinkApplier *)self displayLink];
    v6 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v5 addToRunLoop:v6 forMode:*MEMORY[0x1E4F1C4B0]];

    v7 = [(HUDisplayLinkApplier *)self displayLink];
    CAFrameRateRange v11 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v7, "setPreferredFrameRateRange:", *(double *)&v11.minimum, *(double *)&v11.maximum, *(double *)&v11.preferred);

    v8 = [(HUDisplayLinkApplier *)self displayLink];
    [v8 setHighFrameRateReason:1769473];

    [(HUDisplayLinkApplier *)self _updateProgressForInitialUpdate:1];
  }
  return v3;
}

- (void)_displayLinkTick
{
}

- (void)_updateProgressForInitialUpdate:(BOOL)a3
{
  id v5 = [(HUDisplayLinkApplier *)self progressInputBlock];
  [(HUDisplayLinkApplier *)self effectiveInputProgressForBlock:v5];
  double v7 = v6;

  [(HUApplier *)self progress];
  double v9 = vabdd_f64(v7, v8);
  if (v9 > 0.001 || a3 || ![(HUDisplayLinkApplier *)self applyOnlyOnProgressChanges]) {
    [(HUApplier *)self updateProgress:v7];
  }
  if (v9 <= 0.001)
  {
    [(HUDisplayLinkApplier *)self setRestingFrameCount:[(HUDisplayLinkApplier *)self restingFrameCount] + 1];
    if ([(HUDisplayLinkApplier *)self restingFrameCount] >= 3)
    {
      [(HUDisplayLinkApplier *)self setAtRest:1];
      if ([(HUDisplayLinkApplier *)self completesWhenAtRest])
      {
        [(HUDisplayLinkApplier *)self complete:1];
      }
    }
  }
  else
  {
    [(HUDisplayLinkApplier *)self setAtRest:0];
    [(HUDisplayLinkApplier *)self setRestingFrameCount:0];
  }
}

- (double)effectiveInputProgressForBlock:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
  return result;
}

- (void)setAtRest:(BOOL)a3
{
  if (self->_atRest != a3)
  {
    self->_atRest = a3;
    [(HUDisplayLinkApplier *)self restingStateDidChange];
  }
}

- (void)_invalidateDisplayLinkIfNecessary
{
  BOOL v3 = [(HUDisplayLinkApplier *)self displayLink];
  [v3 invalidate];

  [(HUDisplayLinkApplier *)self setDisplayLink:0];
}

- (BOOL)complete:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUDisplayLinkApplier;
  BOOL v4 = [(HUApplier *)&v6 complete:a3];
  if (v4) {
    [(HUDisplayLinkApplier *)self _invalidateDisplayLinkIfNecessary];
  }
  return v4;
}

- (BOOL)applyOnlyOnProgressChanges
{
  return self->_applyOnlyOnProgressChanges;
}

- (void)setApplyOnlyOnProgressChanges:(BOOL)a3
{
  self->_applyOnlyOnProgressChanges = a3;
}

- (BOOL)completesWhenAtRest
{
  return self->_completesWhenAtRest;
}

- (void)setCompletesWhenAtRest:(BOOL)a3
{
  self->_completesWhenAtRest = a3;
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

- (BOOL)isAtRest
{
  return self->_atRest;
}

- (unint64_t)restingFrameCount
{
  return self->_restingFrameCount;
}

- (void)setRestingFrameCount:(unint64_t)a3
{
  self->_restingFrameCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);

  objc_storeStrong(&self->_progressInputBlock, 0);
}

@end