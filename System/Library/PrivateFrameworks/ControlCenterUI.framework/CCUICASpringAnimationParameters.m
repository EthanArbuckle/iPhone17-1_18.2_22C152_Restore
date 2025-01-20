@interface CCUICASpringAnimationParameters
- (BOOL)isEqual:(id)a3;
- (CAFrameRateRange)frameRateRange;
- (CCUIAnimationTimingFunctionDescription)timingFunction;
- (CCUICASpringAnimationParameters)init;
- (NSString)description;
- (double)damping;
- (double)mass;
- (double)stiffness;
- (id)_initWithAnimationParameters:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unsigned)highFrameRateReason;
@end

@implementation CCUICASpringAnimationParameters

- (CCUICASpringAnimationParameters)init
{
  return (CCUICASpringAnimationParameters *)[(CCUICASpringAnimationParameters *)self _initWithAnimationParameters:0];
}

- (id)_initWithAnimationParameters:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CCUICASpringAnimationParameters;
  v5 = [(CCUICASpringAnimationParameters *)&v17 init];
  if (v5)
  {
    [v4 mass];
    v5->_mass = v6;
    [v4 stiffness];
    v5->_stiffness = v7;
    [v4 damping];
    v5->_damping = v8;
    v9 = [v4 timingFunction];
    uint64_t v10 = [v9 copyWithZone:0];
    timingFunction = v5->_timingFunction;
    v5->_timingFunction = (CCUIAnimationTimingFunctionDescription *)v10;

    if (v4)
    {
      [v4 frameRateRange];
      v5->_frameRateRange.minimum = v12;
      v5->_frameRateRange.maximum = v13;
      v5->_frameRateRange.preferred = v14;
      v5->_highFrameRateReason = [v4 highFrameRateReason];
    }
    else
    {
      uint64_t v15 = MEMORY[0x1E4F39AF0];
      *(void *)&v5->_frameRateRange.minimum = *MEMORY[0x1E4F39AF0];
      v5->_frameRateRange.preferred = *(float *)(v15 + 8);
    }
  }

  return v5;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [(CCUICASpringAnimationParameters *)self mass];
  id v4 = (id)objc_msgSend(v3, "appendFloat:withName:", @"Mass");
  [(CCUICASpringAnimationParameters *)self stiffness];
  id v5 = (id)objc_msgSend(v3, "appendFloat:withName:", @"Stiffness");
  [(CCUICASpringAnimationParameters *)self damping];
  id v6 = (id)objc_msgSend(v3, "appendFloat:withName:", @"Damping");
  double v7 = [(CCUICASpringAnimationParameters *)self timingFunction];
  id v8 = (id)[v3 appendObject:v7 withName:@"Timing Function"];

  [(CCUICASpringAnimationParameters *)self frameRateRange];
  float v12 = CCUIStringFromCAFrameRateRange(v9, v10, v11);
  [v3 appendString:v12 withName:@"FrameRateRange"];

  id v13 = (id)objc_msgSend(v3, "appendInteger:withName:", -[CCUICASpringAnimationParameters highFrameRateReason](self, "highFrameRateReason"), @"highFrameRateReason");
  float v14 = [v3 build];

  return (NSString *)v14;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  [(CCUICASpringAnimationParameters *)self mass];
  id v4 = (id)objc_msgSend(v3, "appendCGFloat:");
  [(CCUICASpringAnimationParameters *)self stiffness];
  id v5 = (id)objc_msgSend(v3, "appendCGFloat:");
  [(CCUICASpringAnimationParameters *)self damping];
  id v6 = (id)objc_msgSend(v3, "appendCGFloat:");
  double v7 = [(CCUICASpringAnimationParameters *)self timingFunction];
  id v8 = (id)[v3 appendObject:v7];

  [(CCUICASpringAnimationParameters *)self frameRateRange];
  int v10 = v9;
  int v12 = v11;
  id v13 = (id)objc_msgSend(v3, "appendFloat:");
  LODWORD(v14) = v10;
  id v15 = (id)[v3 appendFloat:v14];
  LODWORD(v16) = v12;
  id v17 = (id)[v3 appendFloat:v16];
  id v18 = (id)objc_msgSend(v3, "appendInteger:", -[CCUICASpringAnimationParameters highFrameRateReason](self, "highFrameRateReason"));
  unint64_t v19 = [v3 hash];

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CCUICASpringAnimationParameters *)a3;
  if (v4 == self)
  {
    BOOL v19 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v5 = v4;
      [(CCUICASpringAnimationParameters *)self mass];
      [(CCUICASpringAnimationParameters *)v5 mass];
      if (BSCompareFloats()) {
        goto LABEL_12;
      }
      [(CCUICASpringAnimationParameters *)self stiffness];
      [(CCUICASpringAnimationParameters *)v5 stiffness];
      if (BSCompareFloats()) {
        goto LABEL_12;
      }
      [(CCUICASpringAnimationParameters *)self damping];
      [(CCUICASpringAnimationParameters *)v5 damping];
      if (BSCompareFloats()) {
        goto LABEL_12;
      }
      id v6 = [(CCUICASpringAnimationParameters *)self timingFunction];
      double v7 = [(CCUICASpringAnimationParameters *)v5 timingFunction];
      int v8 = BSEqualObjects();

      if (!v8) {
        goto LABEL_12;
      }
      [(CCUICASpringAnimationParameters *)self frameRateRange];
      float v10 = v9;
      float v12 = v11;
      float v14 = v13;
      [(CCUICASpringAnimationParameters *)v5 frameRateRange];
      v22.minimum = v15;
      v22.maximum = v16;
      v22.preferred = v17;
      v21.minimum = v10;
      v21.maximum = v12;
      v21.preferred = v14;
      if (!CAFrameRateRangeIsEqualToRange(v21, v22))
      {
LABEL_12:
        BOOL v19 = 0;
      }
      else
      {
        unsigned int v18 = [(CCUICASpringAnimationParameters *)self highFrameRateReason];
        BOOL v19 = v18 == [(CCUICASpringAnimationParameters *)v5 highFrameRateReason];
      }
    }
    else
    {
      BOOL v19 = 0;
    }
  }

  return v19;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [CCUIMutableCASpringAnimationParameters alloc];

  return [(CCUICASpringAnimationParameters *)v4 _initWithAnimationParameters:self];
}

- (double)mass
{
  return self->_mass;
}

- (double)stiffness
{
  return self->_stiffness;
}

- (double)damping
{
  return self->_damping;
}

- (CCUIAnimationTimingFunctionDescription)timingFunction
{
  return self->_timingFunction;
}

- (CAFrameRateRange)frameRateRange
{
  float minimum = self->_frameRateRange.minimum;
  float maximum = self->_frameRateRange.maximum;
  float preferred = self->_frameRateRange.preferred;
  result.float preferred = preferred;
  result.float maximum = maximum;
  result.float minimum = minimum;
  return result;
}

- (unsigned)highFrameRateReason
{
  return self->_highFrameRateReason;
}

- (void).cxx_destruct
{
}

@end