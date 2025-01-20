@interface CKScrollViewAnimationProperties
+ (id)animatedWithDuration:(double)a3 animationCurve:(int64_t)a4;
+ (id)inheritedAnimation;
+ (id)springAnimationWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 duration:(double)a6;
+ (id)systemDefaultScrollAnimation;
+ (id)unanimated;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAnimationProperties:(id)a3;
- (CABasicAnimation)caBasicAnimation;
- (CKScrollViewAnimationProperties)initWithAnimationType:(int64_t)a3 duration:(double)a4 animationCurve:(int64_t)a5 springMass:(double)a6 springStiffness:(double)a7 springDamping:(double)a8;
- (UIViewPropertyAnimator)propertyAnimator;
- (double)duration;
- (double)springDamping;
- (double)springMass;
- (double)springStiffness;
- (id)description;
- (int64_t)animationCurve;
- (int64_t)animationType;
- (unint64_t)hash;
- (void)performAnimationBlock:(id)a3;
- (void)setAnimationCurve:(int64_t)a3;
- (void)setDuration:(double)a3;
- (void)setSpringDamping:(double)a3;
- (void)setSpringMass:(double)a3;
- (void)setSpringStiffness:(double)a3;
@end

@implementation CKScrollViewAnimationProperties

- (CKScrollViewAnimationProperties)initWithAnimationType:(int64_t)a3 duration:(double)a4 animationCurve:(int64_t)a5 springMass:(double)a6 springStiffness:(double)a7 springDamping:(double)a8
{
  v15.receiver = self;
  v15.super_class = (Class)CKScrollViewAnimationProperties;
  result = [(CKScrollViewAnimationProperties *)&v15 init];
  if (result)
  {
    result->_animationType = a3;
    result->_duration = a4;
    result->_animationCurve = a5;
    result->_springMass = a6;
    result->_springStiffness = a7;
    result->_springDamping = a8;
  }
  return result;
}

+ (id)unanimated
{
  v2 = [[CKScrollViewAnimationProperties alloc] initWithAnimationType:0 duration:3 animationCurve:0.0 springMass:0.0 springStiffness:0.0 springDamping:0.0];

  return v2;
}

+ (id)inheritedAnimation
{
  v2 = [[CKScrollViewAnimationProperties alloc] initWithAnimationType:2 duration:3 animationCurve:0.0 springMass:0.0 springStiffness:0.0 springDamping:0.0];

  return v2;
}

+ (id)animatedWithDuration:(double)a3 animationCurve:(int64_t)a4
{
  v4 = [[CKScrollViewAnimationProperties alloc] initWithAnimationType:1 duration:a4 animationCurve:a3 springMass:0.0 springStiffness:0.0 springDamping:0.0];

  return v4;
}

+ (id)springAnimationWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 duration:(double)a6
{
  v6 = [[CKScrollViewAnimationProperties alloc] initWithAnimationType:1 duration:3 animationCurve:a6 springMass:a3 springStiffness:a4 springDamping:a5];

  return v6;
}

+ (id)systemDefaultScrollAnimation
{
  v2 = [[CKScrollViewAnimationProperties alloc] initWithAnimationType:1 duration:0 animationCurve:0.3 springMass:0.0 springStiffness:0.0 springDamping:0.0];

  return v2;
}

- (CABasicAnimation)caBasicAnimation
{
  if (self->_animationType == 1)
  {
    if (self->_springMass <= 0.0)
    {
      int64_t animationCurve = self->_animationCurve;
      if (animationCurve == 103)
      {
        id v3 = objc_alloc_init(MEMORY[0x1E4F39C90]);
        [v3 setDuration:self->_duration];
        [v3 setMass:1.0];
        [v3 setStiffness:333.34153];
        [v3 setDamping:36.51529];
      }
      else
      {
        if ((animationCurve & 7) != 0)
        {
          id v3 = objc_alloc_init(MEMORY[0x1E4F39C90]);
          [v3 setDuration:self->_duration];
          id v6 = objc_alloc_init(MEMORY[0x1E4F42E18]);
          [v6 mass];
          objc_msgSend(v3, "setMass:");
          [v6 stiffness];
          objc_msgSend(v3, "setStiffness:");
          [v6 damping];
          objc_msgSend(v3, "setDamping:");
        }
        else
        {
          id v3 = objc_alloc_init(MEMORY[0x1E4F39B48]);
          [v3 setDuration:self->_duration];
          _CKGetAnimationCurveSpline(self->_animationCurve, v7, v8, v9, v10);
          id v6 = (id)objc_claimAutoreleasedReturnValue();
          [v3 setTimingFunction:v6];
        }
      }
    }
    else
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4F39C90]);
      [v3 setMass:self->_springMass];
      [v3 setStiffness:self->_springStiffness];
      [v3 setDamping:self->_springDamping];
      [v3 setDuration:self->_duration];
    }
  }
  else
  {
    id v3 = 0;
  }

  return (CABasicAnimation *)v3;
}

- (UIViewPropertyAnimator)propertyAnimator
{
  if (self->_animationType != 1)
  {
    double v7 = 0;
    goto LABEL_9;
  }
  if (self->_springMass <= 0.0)
  {
    int64_t animationCurve = self->_animationCurve;
    if (animationCurve != 103)
    {
      if ((animationCurve & 7) != 0) {
        id v9 = objc_alloc_init(MEMORY[0x1E4F42E18]);
      }
      else {
        id v9 = (id)[objc_alloc(MEMORY[0x1E4F42910]) initWithAnimationCurve:self->_animationCurve];
      }
      goto LABEL_8;
    }
    id v3 = objc_alloc(MEMORY[0x1E4F42E18]);
    double springStiffness = 333.34153;
    double springDamping = 36.51529;
    double springMass = 1.0;
  }
  else
  {
    id v3 = objc_alloc(MEMORY[0x1E4F42E18]);
    double springMass = self->_springMass;
    double springStiffness = self->_springStiffness;
    double springDamping = self->_springDamping;
  }
  id v9 = (id)objc_msgSend(v3, "initWithMass:stiffness:damping:initialVelocity:", springMass, springStiffness, springDamping, 0.0, 0.0);
LABEL_8:
  double v10 = v9;
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F43008]) initWithDuration:v9 timingParameters:self->_duration];

LABEL_9:

  return (UIViewPropertyAnimator *)v7;
}

- (id)description
{
  int64_t animationType = self->_animationType;
  if (animationType == 2)
  {
    id v3 = @"inheritedAnimation";
  }
  else if (animationType == 1)
  {
    double springMass = self->_springMass;
    if (springMass == 0.0) {
      [NSString stringWithFormat:@"<animated, duration=%.2f, curve=%ld>", *(void *)&self->_duration, self->_animationCurve, v6];
    }
    else {
      [NSString stringWithFormat:@"<animated, mass=%.4f, stiffness=%.4f, damping=%.4f>", *(void *)&springMass, *(void *)&self->_springStiffness, *(void *)&self->_springDamping];
    }
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (animationType)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = @"unanimated";
  }

  return v3;
}

- (unint64_t)hash
{
  int64_t animationType = self->_animationType;
  v4 = [NSNumber numberWithDouble:self->_duration];
  uint64_t v5 = [v4 hash] ^ animationType ^ self->_animationCurve;
  uint64_t v6 = [NSNumber numberWithDouble:self->_springMass];
  uint64_t v7 = [v6 hash];
  double v8 = [NSNumber numberWithDouble:self->_springStiffness];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  double v10 = [NSNumber numberWithDouble:self->_springDamping];
  unint64_t v11 = v9 ^ [v10 hash];

  return v11;
}

- (BOOL)isEqualToAnimationProperties:(id)a3
{
  v4 = (double *)a3;
  BOOL v5 = self->_animationType == *((void *)v4 + 1)
    && self->_duration == v4[2]
    && self->_animationCurve == *((void *)v4 + 3)
    && self->_springMass == v4[4]
    && self->_springStiffness == v4[5]
    && self->_springDamping == v4[6];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(CKScrollViewAnimationProperties *)self isEqualToAnimationProperties:v4];

  return v5;
}

- (void)performAnimationBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  int64_t animationType = self->_animationType;
  if (animationType == 2)
  {
    id v8 = v4;
    (*((void (**)(id))v4 + 2))(v4);
  }
  else if (animationType == 1)
  {
    id v8 = v4;
    uint64_t v7 = [(CKScrollViewAnimationProperties *)self propertyAnimator];
    [v7 addAnimations:v8];
    [v7 startAnimation];
  }
  else
  {
    if (animationType) {
      goto LABEL_8;
    }
    id v8 = v4;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v4];
  }
  BOOL v5 = v8;
LABEL_8:
}

- (int64_t)animationType
{
  return self->_animationType;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (int64_t)animationCurve
{
  return self->_animationCurve;
}

- (void)setAnimationCurve:(int64_t)a3
{
  self->_int64_t animationCurve = a3;
}

- (double)springMass
{
  return self->_springMass;
}

- (void)setSpringMass:(double)a3
{
  self->_double springMass = a3;
}

- (double)springStiffness
{
  return self->_springStiffness;
}

- (void)setSpringStiffness:(double)a3
{
  self->_double springStiffness = a3;
}

- (double)springDamping
{
  return self->_springDamping;
}

- (void)setSpringDamping:(double)a3
{
  self->_double springDamping = a3;
}

@end