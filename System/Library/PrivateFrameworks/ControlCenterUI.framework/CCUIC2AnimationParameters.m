@interface CCUIC2AnimationParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)isInteractive;
- (CAFrameRateRange)frameRateRange;
- (CCUIC2AnimationParameters)init;
- (NSString)description;
- (double)friction;
- (double)tension;
- (id)_initWithAnimationParameters:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unsigned)highFrameRateReason;
@end

@implementation CCUIC2AnimationParameters

- (CCUIC2AnimationParameters)init
{
  return (CCUIC2AnimationParameters *)[(CCUIC2AnimationParameters *)self _initWithAnimationParameters:0];
}

- (id)_initWithAnimationParameters:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CCUIC2AnimationParameters;
  v5 = [(CCUIC2AnimationParameters *)&v13 init];
  if (v5)
  {
    v5->_interactive = [v4 isInteractive];
    [v4 tension];
    v5->_tension = v6;
    [v4 friction];
    v5->_friction = v7;
    if (v4)
    {
      [v4 frameRateRange];
      v5->_frameRateRange.minimum = v8;
      v5->_frameRateRange.maximum = v9;
      v5->_frameRateRange.preferred = v10;
      v5->_highFrameRateReason = [v4 highFrameRateReason];
    }
    else
    {
      uint64_t v11 = MEMORY[0x1E4F39AF0];
      *(void *)&v5->_frameRateRange.minimum = *MEMORY[0x1E4F39AF0];
      v5->_frameRateRange.preferred = *(float *)(v11 + 8);
    }
  }

  return v5;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[CCUIC2AnimationParameters isInteractive](self, "isInteractive"), @"Interactive");
  [(CCUIC2AnimationParameters *)self tension];
  id v5 = (id)objc_msgSend(v3, "appendFloat:withName:", @"Tension");
  [(CCUIC2AnimationParameters *)self friction];
  id v6 = (id)objc_msgSend(v3, "appendFloat:withName:", @"Friction");
  [(CCUIC2AnimationParameters *)self frameRateRange];
  float v10 = CCUIStringFromCAFrameRateRange(v7, v8, v9);
  [v3 appendString:v10 withName:@"FrameRateRange"];

  id v11 = (id)objc_msgSend(v3, "appendInteger:withName:", -[CCUIC2AnimationParameters highFrameRateReason](self, "highFrameRateReason"), @"highFrameRateReason");
  v12 = [v3 build];

  return (NSString *)v12;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)objc_msgSend(v3, "appendBool:", -[CCUIC2AnimationParameters isInteractive](self, "isInteractive"));
  [(CCUIC2AnimationParameters *)self tension];
  id v5 = (id)objc_msgSend(v3, "appendCGFloat:");
  [(CCUIC2AnimationParameters *)self friction];
  id v6 = (id)objc_msgSend(v3, "appendCGFloat:");
  [(CCUIC2AnimationParameters *)self frameRateRange];
  int v8 = v7;
  int v10 = v9;
  id v11 = (id)objc_msgSend(v3, "appendFloat:");
  LODWORD(v12) = v8;
  id v13 = (id)[v3 appendFloat:v12];
  LODWORD(v14) = v10;
  id v15 = (id)[v3 appendFloat:v14];
  id v16 = (id)objc_msgSend(v3, "appendInteger:", -[CCUIC2AnimationParameters highFrameRateReason](self, "highFrameRateReason"));
  unint64_t v17 = [v3 hash];

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CCUIC2AnimationParameters *)a3;
  if (v4 == self)
  {
    BOOL v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v5 = v4;
      BOOL v6 = [(CCUIC2AnimationParameters *)self isInteractive];
      if (v6 != [(CCUIC2AnimationParameters *)v5 isInteractive]) {
        goto LABEL_11;
      }
      [(CCUIC2AnimationParameters *)self tension];
      [(CCUIC2AnimationParameters *)v5 tension];
      if (BSCompareFloats()) {
        goto LABEL_11;
      }
      [(CCUIC2AnimationParameters *)self friction];
      [(CCUIC2AnimationParameters *)v5 friction];
      if (BSCompareFloats()) {
        goto LABEL_11;
      }
      [(CCUIC2AnimationParameters *)self frameRateRange];
      float v8 = v7;
      float v10 = v9;
      float v12 = v11;
      [(CCUIC2AnimationParameters *)v5 frameRateRange];
      v20.minimum = v13;
      v20.maximum = v14;
      v20.preferred = v15;
      v19.minimum = v8;
      v19.maximum = v10;
      v19.preferred = v12;
      if (!CAFrameRateRangeIsEqualToRange(v19, v20))
      {
LABEL_11:
        BOOL v17 = 0;
      }
      else
      {
        unsigned int v16 = [(CCUIC2AnimationParameters *)self highFrameRateReason];
        BOOL v17 = v16 == [(CCUIC2AnimationParameters *)v5 highFrameRateReason];
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }

  return v17;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [CCUIMutableC2AnimationParameters alloc];

  return [(CCUIC2AnimationParameters *)v4 _initWithAnimationParameters:self];
}

- (BOOL)isInteractive
{
  return self->_interactive;
}

- (double)tension
{
  return self->_tension;
}

- (double)friction
{
  return self->_friction;
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

@end