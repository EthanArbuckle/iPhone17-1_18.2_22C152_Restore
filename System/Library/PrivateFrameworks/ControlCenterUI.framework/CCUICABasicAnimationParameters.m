@interface CCUICABasicAnimationParameters
- (BOOL)isEqual:(id)a3;
- (CAFrameRateRange)frameRateRange;
- (CCUIAnimationTimingFunctionDescription)timingFunction;
- (CCUICABasicAnimationParameters)init;
- (NSString)description;
- (double)duration;
- (id)_initWithAnimationParameters:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unsigned)highFrameRateReason;
@end

@implementation CCUICABasicAnimationParameters

- (CCUICABasicAnimationParameters)init
{
  return (CCUICABasicAnimationParameters *)[(CCUICABasicAnimationParameters *)self _initWithAnimationParameters:0];
}

- (id)_initWithAnimationParameters:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CCUICABasicAnimationParameters;
  v5 = [(CCUICABasicAnimationParameters *)&v15 init];
  if (v5)
  {
    [v4 duration];
    v5->_duration = v6;
    v7 = [v4 timingFunction];
    uint64_t v8 = [v7 copyWithZone:0];
    timingFunction = v5->_timingFunction;
    v5->_timingFunction = (CCUIAnimationTimingFunctionDescription *)v8;

    if (v4)
    {
      [v4 frameRateRange];
      v5->_frameRateRange.minimum = v10;
      v5->_frameRateRange.maximum = v11;
      v5->_frameRateRange.preferred = v12;
      v5->_highFrameRateReason = [v4 highFrameRateReason];
    }
    else
    {
      uint64_t v13 = MEMORY[0x1E4F39AF0];
      *(void *)&v5->_frameRateRange.minimum = *MEMORY[0x1E4F39AF0];
      v5->_frameRateRange.preferred = *(float *)(v13 + 8);
    }
  }

  return v5;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [(CCUICABasicAnimationParameters *)self duration];
  id v4 = (id)objc_msgSend(v3, "appendTimeInterval:withName:decomposeUnits:", @"Duration", 1);
  v5 = [(CCUICABasicAnimationParameters *)self timingFunction];
  id v6 = (id)[v3 appendObject:v5 withName:@"Timing Function"];

  [(CCUICABasicAnimationParameters *)self frameRateRange];
  float v10 = CCUIStringFromCAFrameRateRange(v7, v8, v9);
  [v3 appendString:v10 withName:@"FrameRateRange"];

  id v11 = (id)objc_msgSend(v3, "appendInteger:withName:", -[CCUICABasicAnimationParameters highFrameRateReason](self, "highFrameRateReason"), @"highFrameRateReason");
  float v12 = [v3 build];

  return (NSString *)v12;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  [(CCUICABasicAnimationParameters *)self duration];
  id v4 = (id)objc_msgSend(v3, "appendDouble:");
  v5 = [(CCUICABasicAnimationParameters *)self timingFunction];
  id v6 = (id)[v3 appendObject:v5];

  [(CCUICABasicAnimationParameters *)self frameRateRange];
  int v8 = v7;
  int v10 = v9;
  id v11 = (id)objc_msgSend(v3, "appendFloat:");
  LODWORD(v12) = v8;
  id v13 = (id)[v3 appendFloat:v12];
  LODWORD(v14) = v10;
  id v15 = (id)[v3 appendFloat:v14];
  id v16 = (id)objc_msgSend(v3, "appendInteger:", -[CCUICABasicAnimationParameters highFrameRateReason](self, "highFrameRateReason"));
  unint64_t v17 = [v3 hash];

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CCUICABasicAnimationParameters *)a3;
  if (v4 == self)
  {
    BOOL v19 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v5 = v4;
      [(CCUICABasicAnimationParameters *)self duration];
      [(CCUICABasicAnimationParameters *)v5 duration];
      if (BSCompareFloats()) {
        goto LABEL_10;
      }
      id v6 = [(CCUICABasicAnimationParameters *)self timingFunction];
      int v7 = [(CCUICABasicAnimationParameters *)v5 timingFunction];
      int v8 = BSEqualObjects();

      if (!v8) {
        goto LABEL_10;
      }
      [(CCUICABasicAnimationParameters *)self frameRateRange];
      float v10 = v9;
      float v12 = v11;
      float v14 = v13;
      [(CCUICABasicAnimationParameters *)v5 frameRateRange];
      v22.minimum = v15;
      v22.maximum = v16;
      v22.preferred = v17;
      v21.minimum = v10;
      v21.maximum = v12;
      v21.preferred = v14;
      if (CAFrameRateRangeIsEqualToRange(v21, v22))
      {
        unsigned int v18 = [(CCUICABasicAnimationParameters *)self highFrameRateReason];
        BOOL v19 = v18 == [(CCUICABasicAnimationParameters *)v5 highFrameRateReason];
      }
      else
      {
LABEL_10:
        BOOL v19 = 0;
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
  id v4 = [CCUIMutableCABasicAnimationParameters alloc];

  return [(CCUICABasicAnimationParameters *)v4 _initWithAnimationParameters:self];
}

- (double)duration
{
  return self->_duration;
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