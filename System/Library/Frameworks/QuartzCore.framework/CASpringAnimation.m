@interface CASpringAnimation
+ (id)defaultValueForKey:(id)a3;
- (BOOL)_setCARenderAnimation:(void *)a3 layer:(id)a4;
- (BOOL)allowsOverdamping;
- (CASpringAnimation)initWithPerceptualDuration:(CFTimeInterval)perceptualDuration bounce:(CGFloat)bounce;
- (CFTimeInterval)perceptualDuration;
- (CFTimeInterval)settlingDuration;
- (CGFloat)bounce;
- (CGFloat)damping;
- (CGFloat)mass;
- (CGFloat)stiffness;
- (double)_timeFunction:(double)a3;
- (double)durationForEpsilon:(double)a3;
- (double)velocity;
- (float)_solveForInput:(float)a3;
- (unsigned)_propertyFlagsForLayer:(id)a3;
- (void)_copyRenderAnimationForLayer:(id)a3;
- (void)setAllowsOverdamping:(BOOL)allowsOverdamping;
- (void)setDamping:(CGFloat)damping;
- (void)setMass:(CGFloat)mass;
- (void)setStiffness:(CGFloat)stiffness;
- (void)setVelocity:(double)a3;
@end

@implementation CASpringAnimation

+ (id)defaultValueForKey:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v5 = CAInternAtom((const __CFString *)a3, 0);
  if (v5 <= 378)
  {
    if (v5 == 19) {
      return (id)*MEMORY[0x1E4F1CFC8];
    }
    if (v5 != 161) {
      goto LABEL_18;
    }
    v8 = NSNumber;
    double v9 = 10.0;
  }
  else
  {
    if (v5 != 589)
    {
      if (v5 == 538)
      {
        v6 = NSNumber;
        uint64_t v7 = 100;
        goto LABEL_14;
      }
      if (v5 == 379)
      {
        v6 = NSNumber;
        uint64_t v7 = 1;
LABEL_14:
        return (id)[v6 numberWithInt:v7];
      }
LABEL_18:
      v11.receiver = a1;
      v11.super_class = (Class)&OBJC_METACLASS___CASpringAnimation;
      return objc_msgSendSuper2(&v11, sel_defaultValueForKey_, a3);
    }
    v8 = NSNumber;
    double v9 = 0.0;
  }

  return (id)[v8 numberWithDouble:v9];
}

- (void)setMass:(CGFloat)mass
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (mass <= 0.0)
  {
    NSLog(&cfstr_CoreanimationM_11.isa, a2);
    mass = 1.0;
  }
  *(CGFloat *)v4 = mass;
  CAAnimation_setter((uint64_t)self, (const void *)0x17B, 18, (unsigned __int8 *)v4);
}

- (void)setStiffness:(CGFloat)stiffness
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (stiffness <= 0.0)
  {
    NSLog(&cfstr_CoreanimationS_1.isa, a2);
    stiffness = 100.0;
  }
  *(CGFloat *)v4 = stiffness;
  CAAnimation_setter((uint64_t)self, (const void *)0x21A, 18, (unsigned __int8 *)v4);
}

- (void)setDamping:(CGFloat)damping
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (damping < 0.0)
  {
    NSLog(&cfstr_CoreanimationD_4.isa, a2);
    damping = 10.0;
  }
  *(CGFloat *)v4 = damping;
  CAAnimation_setter((uint64_t)self, (const void *)0xA1, 18, (unsigned __int8 *)v4);
}

- (void)setVelocity:(double)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(double *)v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x24D, 18, (unsigned __int8 *)v3);
}

- (unsigned)_propertyFlagsForLayer:(id)a3
{
  v4 = [(CAPropertyAnimation *)self keyPath];

  return animation_property_flags(v4, (CALayer *)a3);
}

- (CFTimeInterval)settlingDuration
{
  [(CASpringAnimation *)self durationForEpsilon:0.001];
  return result;
}

- (void)_copyRenderAnimationForLayer:(id)a3
{
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v6 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xF0uLL, 0x743898A5uLL);
  uint64_t v7 = (atomic_uint *)v6;
  if (v6)
  {
    *((_DWORD *)v6 + 2) = 1;
    *(_OWORD *)(v6 + 40) = 0u;
    *(_OWORD *)(v6 + 56) = 0u;
    *((void *)v6 + 9) = 0;
    *((void *)v6 + 2) = 0;
    *((void *)v6 + 3) = 0;
    *((_DWORD *)v6 + 8) = 0;
    *((void *)v6 + 12) = 0;
    *((void *)v6 + 13) = 0;
    *((_OWORD *)v6 + 7) = 0u;
    *((_OWORD *)v6 + 8) = 0u;
    *((void *)v6 + 18) = 0;
    *((_DWORD *)v6 + 3) = 48;
    ++dword_1EB2ADE88;
    *(void *)v6 = &unk_1ED02E310;
    *(_OWORD *)(v6 + 152) = xmmword_184998430;
    *(_OWORD *)(v6 + 168) = xmmword_184998440;
    if (![(CASpringAnimation *)self _setCARenderAnimation:v6 layer:a3])
    {
      if (atomic_fetch_add(v7 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v7 + 16))(v7);
      }
      return 0;
    }
  }
  else
  {
    [(CASpringAnimation *)self _setCARenderAnimation:0 layer:a3];
  }
  return v7;
}

- (BOOL)_setCARenderAnimation:(void *)a3 layer:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)CASpringAnimation;
  BOOL v6 = [(CABasicAnimation *)&v12 _setCARenderAnimation:a3 layer:a4];
  if (v6)
  {
    [(CASpringAnimation *)self mass];
    *((void *)a3 + 19) = v7;
    [(CASpringAnimation *)self stiffness];
    *((void *)a3 + 20) = v8;
    [(CASpringAnimation *)self damping];
    *((void *)a3 + 21) = v9;
    [(CASpringAnimation *)self velocity];
    *((void *)a3 + 22) = v10;
    *((unsigned char *)a3 + 184) = [(CASpringAnimation *)self allowsOverdamping];
  }
  return v6;
}

- (double)durationForEpsilon:(double)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  *(_OWORD *)v27 = 0u;
  long long v25 = 0u;
  [(CASpringAnimation *)self mass];
  double v6 = v5;
  [(CASpringAnimation *)self stiffness];
  double v8 = v7;
  [(CASpringAnimation *)self damping];
  double v10 = v9;
  [(CASpringAnimation *)self velocity];
  CA::Render::SpringAnimation::State::update((uint64_t)&v25, v6, v8, v10, v11, [(CASpringAnimation *)self allowsOverdamping]);
  double v12 = *((double *)&v25 + 1);
  if (*((double *)&v25 + 1) == 0.0)
  {
    double v13 = INFINITY;
  }
  else
  {
    double v14 = fmax(a3, 0.000001);
    if (*((double *)&v25 + 1) >= 1.0)
    {
      double v13 = -1.0;
      double v16 = INFINITY;
      for (double i = 0.0; ; double i = i + 0.1)
      {
        double v18 = CA::Render::SpringAnimation::State::eval((CA::Render::SpringAnimation::State *)&v25, i);
        double v19 = fabs(1.0 - v18);
        BOOL v20 = (unint64_t)(*(void *)&v19 - 0x10000000000000) >> 53 > 0x3FE
           && (unint64_t)(*(void *)&v19 - 1) > 0xFFFFFFFFFFFFELL;
        if (v20 && COERCE__INT64(1.0 - v18) != 0) {
          break;
        }
        double v22 = vabdd_f64(1.0, v18);
        if (v16 >= v14)
        {
          if (v22 < v16)
          {
            double v13 = i;
            double v16 = v22;
          }
        }
        else if (v22 >= v14)
        {
          double v16 = INFINITY;
        }
        else if (i - v13 > 1.0)
        {
          goto LABEL_22;
        }
      }
      double v13 = 0.0;
    }
    else
    {
      long double v15 = log(v14 / (fabs(v27[0]) + fabs(*((double *)&v26 + 1))));
      double v13 = fmax(-v15 / (*(double *)&v25 * v12), 0.0);
    }
  }
LABEL_22:
  [(CAAnimation *)self speed];
  if (v23 == 0.0) {
    return 3.40282347e38;
  }
  else {
    return fmin(fabs(v13 / v23), 3.40282347e38);
  }
}

- (double)velocity
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 589, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (CGFloat)stiffness
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 538, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (CGFloat)mass
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 379, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (CGFloat)damping
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 161, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (BOOL)allowsOverdamping
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  char v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 19, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (void)setAllowsOverdamping:(BOOL)allowsOverdamping
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = allowsOverdamping;
  CAAnimation_setter((uint64_t)self, (const void *)0x13, 7, (unsigned __int8 *)&v3);
}

- (CGFloat)bounce
{
  [(CASpringAnimation *)self damping];
  double v4 = v3;
  [(CASpringAnimation *)self mass];
  double v6 = v5;
  [(CASpringAnimation *)self stiffness];
  double v8 = v7;
  [(CASpringAnimation *)self perceptualDuration];
  double v10 = v9 * v4 / (v6 * 12.5663706);
  double v11 = sqrt(v8 * v6);
  if (v4 / (v11 + v11) <= 1.0) {
    return 1.0 - v10;
  }
  else {
    return 1.0 / v10 + -1.0;
  }
}

- (CFTimeInterval)perceptualDuration
{
  [(CASpringAnimation *)self stiffness];
  double v4 = v3;
  uint64_t v5 = *(void *)&v3 & 0x7FFFFFFFFFFFFFFFLL;
  CFTimeInterval result = 0.0;
  if (v5 <= 0x7FEFFFFFFFFFFFFFLL)
  {
    [(CASpringAnimation *)self mass];
    return sqrt(v7 / v4) * 6.28318531;
  }
  return result;
}

- (CASpringAnimation)initWithPerceptualDuration:(CFTimeInterval)perceptualDuration bounce:(CGFloat)bounce
{
  double v6 = [(CASpringAnimation *)self init];
  double v7 = v6;
  if (v6)
  {
    [(CASpringAnimation *)v6 setAllowsOverdamping:1];
    if (perceptualDuration <= 0.0) {
      double v8 = INFINITY;
    }
    else {
      double v8 = 6.28318531 / perceptualDuration * (6.28318531 / perceptualDuration);
    }
    [(CASpringAnimation *)v7 setStiffness:v8];
    if (bounce >= 0.0) {
      double v9 = 1.0 - bounce;
    }
    else {
      double v9 = 1.0 / (bounce + 1.0);
    }
    [(CASpringAnimation *)v7 setDamping:v9 * 12.5663706 / perceptualDuration];
    [(CASpringAnimation *)v7 settlingDuration];
    -[CAAnimation setDuration:](v7, "setDuration:");
  }
  return v7;
}

- (double)_timeFunction:(double)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(CASpringAnimation *)self mass];
  double v6 = v5;
  [(CASpringAnimation *)self stiffness];
  double v8 = v7;
  [(CASpringAnimation *)self damping];
  double v10 = v9;
  [(CASpringAnimation *)self velocity];
  CA::Render::SpringAnimation::State::update((uint64_t)&v14, v6, v8, v10, v11, [(CASpringAnimation *)self allowsOverdamping]);
  [(CAAnimation *)self duration];
  return CA::Render::SpringAnimation::State::eval((CA::Render::SpringAnimation::State *)&v14, v12 * a3);
}

- (float)_solveForInput:(float)a3
{
  [(CASpringAnimation *)self _timeFunction:a3];
  return v3;
}

@end