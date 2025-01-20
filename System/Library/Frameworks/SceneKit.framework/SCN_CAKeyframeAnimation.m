@interface SCN_CAKeyframeAnimation
+ (BOOL)supportsSecureCoding;
- (BOOL)autoreverses;
- (BOOL)commitsOnCompletion;
- (BOOL)isAdditive;
- (BOOL)isCumulative;
- (BOOL)isRemovedOnCompletion;
- (BOOL)usesSceneTimeBase;
- (SCN_CAKeyframeAnimation)initWithCoder:(id)a3;
- (__C3DKeyframedAnimation)c3dAnimation;
- (double)duration;
- (double)fadeInDuration;
- (double)fadeOutDuration;
- (double)repeatDuration;
- (double)timeOffset;
- (float)repeatCount;
- (float)speed;
- (id)animationEvents;
- (id)biasValues;
- (id)continuityValues;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)fillMode;
- (id)keyPath;
- (id)keyTimes;
- (id)tensionValues;
- (id)timingFunction;
- (id)timingFunctions;
- (id)values;
- (void)_clearC3DCache;
- (void)_convertToCA;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditive:(BOOL)a3;
- (void)setAnimationEvents:(id)a3;
- (void)setAutoreverses:(BOOL)a3;
- (void)setBiasValues:(id)a3;
- (void)setC3dAnimation:(__C3DKeyframedAnimation *)a3;
- (void)setCommitsOnCompletion:(BOOL)a3;
- (void)setContinuityValues:(id)a3;
- (void)setCumulative:(BOOL)a3;
- (void)setDuration:(double)a3;
- (void)setFadeInDuration:(double)a3;
- (void)setFadeOutDuration:(double)a3;
- (void)setFillMode:(id)a3;
- (void)setKeyPath:(id)a3;
- (void)setKeyTimes:(id)a3;
- (void)setRemovedOnCompletion:(BOOL)a3;
- (void)setRepeatCount:(float)a3;
- (void)setRepeatDuration:(double)a3;
- (void)setSpeed:(float)a3;
- (void)setTensionValues:(id)a3;
- (void)setTimeOffset:(double)a3;
- (void)setTimingFunction:(id)a3;
- (void)setTimingFunctions:(id)a3;
- (void)setUsesSceneTimeBase:(BOOL)a3;
- (void)setValues:(id)a3;
@end

@implementation SCN_CAKeyframeAnimation

- (void)dealloc
{
  c3dAnimation = self->_c3dAnimation;
  if (c3dAnimation)
  {
    CFRelease(c3dAnimation);
    self->_c3dAnimation = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SCN_CAKeyframeAnimation;
  [(SCN_CAKeyframeAnimation *)&v4 dealloc];
}

- (void)_convertToCA
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  self->_caReady = 1;
  c3dAnimation = self->_c3dAnimation;
  if (c3dAnimation)
  {
    CFTypeRef v4 = CFRetain(c3dAnimation);
    uint64_t Controller = C3DKeyframedAnimationGetController((uint64_t)v4);
    int ValueType = C3DKeyframeControllerGetValueType(Controller);
    unsigned int KeyCount = C3DKeyframeControllerGetKeyCount(Controller);
    v8 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:KeyCount];
    v9 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:KeyCount];
    BOOL HasTCB = C3DKeyframeControllerHasTCB(Controller);
    if (KeyCount) {
      BOOL v11 = !HasTCB;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      unsigned int v12 = 0;
      do
      {
        float TensionAtIndex = C3DKeyframeControllerGetTensionAtIndex(Controller, v12);
        float ContinuityAtIndex = C3DKeyframeControllerGetContinuityAtIndex(Controller, v12);
        float BiasAtIndex = C3DKeyframeControllerGetBiasAtIndex(Controller, v12);
        objc_msgSend(0, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", TensionAtIndex));
        objc_msgSend(0, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", ContinuityAtIndex));
        objc_msgSend(0, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", BiasAtIndex));
        ++v12;
      }
      while (KeyCount != v12);
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long __dst = 0u;
    long long v35 = 0u;
    if (C3DKeyframeControllerHasTimingFunctions(Controller))
    {
      v16 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:KeyCount - 1];
      if (KeyCount == 1)
      {
        *(float *)&double v23 = C3DAnimationGetDuration((uint64_t)v4);
        goto LABEL_17;
      }
      CFTypeRef v32 = v4;
      v33 = self;
      int v17 = 0;
      do
      {
        TimingFunctionAtIndex = (_DWORD *)C3DKeyframeControllerGetTimingFunctionAtIndex(Controller, v17);
        LODWORD(v19) = *TimingFunctionAtIndex;
        LODWORD(v20) = TimingFunctionAtIndex[1];
        LODWORD(v21) = TimingFunctionAtIndex[2];
        LODWORD(v22) = TimingFunctionAtIndex[3];
        objc_msgSend(v16, "addObject:", objc_msgSend(MEMORY[0x263F15808], "functionWithControlPoints::::", v19, v20, v21, v22));
        ++v17;
      }
      while (KeyCount - 1 != v17);
      CFTypeRef v4 = v32;
    }
    else
    {
      v16 = 0;
    }
    *(float *)&double v23 = C3DAnimationGetDuration((uint64_t)v4);
    if (!KeyCount)
    {
LABEL_22:
      -[SCN_CAKeyframeAnimation setKeyTimes:](self, "setKeyTimes:", v8, v23, v32, v33, __dst, v35, v36, v37);
      [(SCN_CAKeyframeAnimation *)self setValues:v9];
      [(SCN_CAKeyframeAnimation *)self setContinuityValues:0];
      [(SCN_CAKeyframeAnimation *)self setTensionValues:0];
      [(SCN_CAKeyframeAnimation *)self setBiasValues:0];
      [(SCN_CAKeyframeAnimation *)self setTimingFunctions:v16];
      [(SCN_CAKeyframeAnimation *)self setDuration:C3DKeyframeControllerGetDuration(Controller)];
      CAPropertyAnimationSetupWithSCNAnimation(self, (uint64_t)v4);
LABEL_24:
      -[SCN_CAKeyframeAnimation setC3dAnimation:](self, "setC3dAnimation:", v4, v32, v33);
      CFRelease(v4);
      return;
    }
LABEL_17:
    unsigned int v24 = 0;
    if (*(float *)&v23 == 0.0) {
      *(float *)&double v23 = 1.0;
    }
    double v25 = *(float *)&v23;
    while (1)
    {
      double KeyTimeAtIndex = C3DKeyframeControllerGetKeyTimeAtIndex(Controller, v24);
      C3DKeyframeControllerGetValueAtIndex(Controller, v24, &__dst);
      objc_msgSend(v8, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", KeyTimeAtIndex / v25));
      uint64_t v31 = SCNNSValueFromTypedBytes((float32x2_t *)&__dst, ValueType, v27, v28, v29, v30);
      if (!v31) {
        break;
      }
      [v9 addObject:v31];
      if (KeyCount == ++v24) {
        goto LABEL_22;
      }
    }

    goto LABEL_24;
  }
}

- (void)_clearC3DCache
{
  if (!self->_caReady) {
    [(SCN_CAKeyframeAnimation *)self _convertToCA];
  }
  c3dAnimation = self->_c3dAnimation;
  if (c3dAnimation) {
    CFRelease(c3dAnimation);
  }
  self->_c3dAnimation = 0;
}

- (id)values
{
  if (!self->_caReady) {
    [(SCN_CAKeyframeAnimation *)self _convertToCA];
  }
  v4.receiver = self;
  v4.super_class = (Class)SCN_CAKeyframeAnimation;
  return [(SCN_CAKeyframeAnimation *)&v4 values];
}

- (void)setValues:(id)a3
{
  if (self->_c3dAnimation) {
    [(SCN_CAKeyframeAnimation *)self _clearC3DCache];
  }
  v5.receiver = self;
  v5.super_class = (Class)SCN_CAKeyframeAnimation;
  [(SCN_CAKeyframeAnimation *)&v5 setValues:a3];
}

- (id)keyTimes
{
  if (!self->_caReady) {
    [(SCN_CAKeyframeAnimation *)self _convertToCA];
  }
  v4.receiver = self;
  v4.super_class = (Class)SCN_CAKeyframeAnimation;
  return [(SCN_CAKeyframeAnimation *)&v4 keyTimes];
}

- (void)setKeyTimes:(id)a3
{
  if (self->_c3dAnimation) {
    [(SCN_CAKeyframeAnimation *)self _clearC3DCache];
  }
  v5.receiver = self;
  v5.super_class = (Class)SCN_CAKeyframeAnimation;
  [(SCN_CAKeyframeAnimation *)&v5 setKeyTimes:a3];
}

- (id)timingFunctions
{
  if (!self->_caReady) {
    [(SCN_CAKeyframeAnimation *)self _convertToCA];
  }
  v4.receiver = self;
  v4.super_class = (Class)SCN_CAKeyframeAnimation;
  return [(SCN_CAKeyframeAnimation *)&v4 timingFunctions];
}

- (void)setTimingFunctions:(id)a3
{
  if (self->_c3dAnimation) {
    [(SCN_CAKeyframeAnimation *)self _clearC3DCache];
  }
  v5.receiver = self;
  v5.super_class = (Class)SCN_CAKeyframeAnimation;
  [(SCN_CAKeyframeAnimation *)&v5 setTimingFunctions:a3];
}

- (id)tensionValues
{
  if (!self->_caReady) {
    [(SCN_CAKeyframeAnimation *)self _convertToCA];
  }
  v4.receiver = self;
  v4.super_class = (Class)SCN_CAKeyframeAnimation;
  return [(SCN_CAKeyframeAnimation *)&v4 tensionValues];
}

- (void)setTensionValues:(id)a3
{
  if (self->_c3dAnimation) {
    [(SCN_CAKeyframeAnimation *)self _clearC3DCache];
  }
  v5.receiver = self;
  v5.super_class = (Class)SCN_CAKeyframeAnimation;
  [(SCN_CAKeyframeAnimation *)&v5 setTensionValues:a3];
}

- (id)continuityValues
{
  if (!self->_caReady) {
    [(SCN_CAKeyframeAnimation *)self _convertToCA];
  }
  v4.receiver = self;
  v4.super_class = (Class)SCN_CAKeyframeAnimation;
  return [(SCN_CAKeyframeAnimation *)&v4 continuityValues];
}

- (void)setContinuityValues:(id)a3
{
  if (self->_c3dAnimation) {
    [(SCN_CAKeyframeAnimation *)self _clearC3DCache];
  }
  v5.receiver = self;
  v5.super_class = (Class)SCN_CAKeyframeAnimation;
  [(SCN_CAKeyframeAnimation *)&v5 setContinuityValues:a3];
}

- (id)biasValues
{
  if (!self->_caReady) {
    [(SCN_CAKeyframeAnimation *)self _convertToCA];
  }
  v4.receiver = self;
  v4.super_class = (Class)SCN_CAKeyframeAnimation;
  return [(SCN_CAKeyframeAnimation *)&v4 biasValues];
}

- (void)setBiasValues:(id)a3
{
  if (self->_c3dAnimation) {
    [(SCN_CAKeyframeAnimation *)self _clearC3DCache];
  }
  v5.receiver = self;
  v5.super_class = (Class)SCN_CAKeyframeAnimation;
  [(SCN_CAKeyframeAnimation *)&v5 setBiasValues:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self->_caReady || !self->_c3dAnimation)
  {
    v7.receiver = self;
    v7.super_class = (Class)SCN_CAKeyframeAnimation;
    return [(SCN_CAKeyframeAnimation *)&v7 copyWithZone:a3];
  }
  else
  {
    id v4 = objc_alloc_init((Class)objc_opt_class());
    Copy = C3DAnimationCreateCopy(self->_c3dAnimation);
    [v4 setC3dAnimation:Copy];
    CFRelease(Copy);
    objc_msgSend(v4, "setKeyPath:", -[SCN_CAKeyframeAnimation keyPath](self, "keyPath"));
    objc_msgSend(v4, "setDelegate:", -[SCN_CAKeyframeAnimation delegate](self, "delegate"));
  }
  return v4;
}

- (id)description
{
  if (self->_caReady)
  {
    v6.receiver = self;
    v6.super_class = (Class)SCN_CAKeyframeAnimation;
    return [(SCN_CAKeyframeAnimation *)&v6 description];
  }
  else
  {
    id v4 = NSString;
    [(SCN_CAKeyframeAnimation *)self duration];
    return (id)[v4 stringWithFormat:@"SCN_CAKeyframeAnimation %p (duration=%f, keyPath:%@)", self, v5, -[SCN_CAKeyframeAnimation keyPath](self, "keyPath")];
  }
}

- (__C3DKeyframedAnimation)c3dAnimation
{
  return self->_c3dAnimation;
}

- (void)setC3dAnimation:(__C3DKeyframedAnimation *)a3
{
  c3dAnimation = self->_c3dAnimation;
  if (c3dAnimation != a3)
  {
    if (c3dAnimation)
    {
      CFRelease(c3dAnimation);
      self->_c3dAnimation = 0;
    }
    if (a3) {
      objc_super v6 = (__C3DKeyframedAnimation *)CFRetain(a3);
    }
    else {
      objc_super v6 = 0;
    }
    self->_c3dAnimation = v6;
  }
}

- (void)setDuration:(double)a3
{
  BOOL caReady = self->_caReady;
  c3dAnimation = self->_c3dAnimation;
  if (caReady)
  {
    if (c3dAnimation)
    {
      float v7 = a3;
      C3DAnimationSetDuration((uint64_t)c3dAnimation, v7);
    }
    goto LABEL_8;
  }
  if (!c3dAnimation)
  {
LABEL_8:
    v9.receiver = self;
    v9.super_class = (Class)SCN_CAKeyframeAnimation;
    [(SCN_CAKeyframeAnimation *)&v9 setDuration:a3];
    return;
  }
  float v8 = a3;

  C3DAnimationSetDuration((uint64_t)c3dAnimation, v8);
}

- (double)duration
{
  if (self->_c3dAnimation) {
    return C3DAnimationGetDuration((uint64_t)self->_c3dAnimation);
  }
  v3.receiver = self;
  v3.super_class = (Class)SCN_CAKeyframeAnimation;
  [(SCN_CAKeyframeAnimation *)&v3 duration];
  return result;
}

- (void)setKeyPath:(id)a3
{
  if (!self->_c3dAnimation) {
    goto LABEL_5;
  }
  CFStringRef v5 = C3DCreatePathComponentsFromString((const __CFString *)a3);
  C3DAnimationSetKeyPath((uint64_t)self->_c3dAnimation, v5);
  if (v5) {
    CFRelease(v5);
  }
  if (self->_caReady)
  {
LABEL_5:
    v6.receiver = self;
    v6.super_class = (Class)SCN_CAKeyframeAnimation;
    [(SCN_CAKeyframeAnimation *)&v6 setKeyPath:a3];
  }
}

- (id)keyPath
{
  c3dAnimation = self->_c3dAnimation;
  if (c3dAnimation && (CFArrayRef KeyPath = (const __CFArray *)C3DAnimationGetKeyPath((uint64_t)c3dAnimation)) != 0)
  {
    CFArrayRef v5 = C3DCreatePathFromComponents(KeyPath);
    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SCN_CAKeyframeAnimation;
    return [(SCN_CAKeyframeAnimation *)&v7 keyPath];
  }
}

- (void)setRepeatCount:(float)a3
{
  c3dAnimation = self->_c3dAnimation;
  if (c3dAnimation) {
    C3DAnimationSetRepeatCount((uint64_t)c3dAnimation, a3);
  }
  if (self->_caReady)
  {
    v7.receiver = self;
    v7.super_class = (Class)SCN_CAKeyframeAnimation;
    *(float *)&double v6 = a3;
    [(SCN_CAKeyframeAnimation *)&v7 setRepeatCount:v6];
  }
}

- (float)repeatCount
{
  if (self->_c3dAnimation)
  {
    c3dAnimation = self->_c3dAnimation;
    return C3DAnimationGetRepeatCount((uint64_t)c3dAnimation);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SCN_CAKeyframeAnimation;
    [(SCN_CAKeyframeAnimation *)&v4 repeatCount];
  }
  return result;
}

- (void)setRepeatDuration:(double)a3
{
  if (self->_c3dAnimation) {
    [(SCN_CAKeyframeAnimation *)self _clearC3DCache];
  }
  v5.receiver = self;
  v5.super_class = (Class)SCN_CAKeyframeAnimation;
  [(SCN_CAKeyframeAnimation *)&v5 setRepeatDuration:a3];
}

- (double)repeatDuration
{
  if (!self->_caReady) {
    [(SCN_CAKeyframeAnimation *)self _convertToCA];
  }
  v4.receiver = self;
  v4.super_class = (Class)SCN_CAKeyframeAnimation;
  [(SCN_CAKeyframeAnimation *)&v4 repeatDuration];
  return result;
}

- (void)setAutoreverses:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL caReady = self->_caReady;
  c3dAnimation = self->_c3dAnimation;
  if (caReady)
  {
    if (c3dAnimation) {
      C3DAnimationSetAutoreverses((uint64_t)c3dAnimation, a3);
    }
    goto LABEL_8;
  }
  if (!c3dAnimation)
  {
LABEL_8:
    v7.receiver = self;
    v7.super_class = (Class)SCN_CAKeyframeAnimation;
    [(SCN_CAKeyframeAnimation *)&v7 setAutoreverses:v3];
    return;
  }

  C3DAnimationSetAutoreverses((uint64_t)c3dAnimation, a3);
}

- (BOOL)autoreverses
{
  if (self->_c3dAnimation)
  {
    c3dAnimation = self->_c3dAnimation;
    return C3DAnimationGetAutoreverses((uint64_t)c3dAnimation);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SCN_CAKeyframeAnimation;
    return [(SCN_CAKeyframeAnimation *)&v4 autoreverses];
  }
}

- (void)setTimeOffset:(double)a3
{
  BOOL caReady = self->_caReady;
  c3dAnimation = self->_c3dAnimation;
  if (caReady)
  {
    if (c3dAnimation) {
      C3DAnimationSetTimeOffset((uint64_t)c3dAnimation, a3);
    }
    goto LABEL_8;
  }
  if (!c3dAnimation)
  {
LABEL_8:
    v7.receiver = self;
    v7.super_class = (Class)SCN_CAKeyframeAnimation;
    [(SCN_CAKeyframeAnimation *)&v7 setTimeOffset:a3];
    return;
  }

  C3DAnimationSetTimeOffset((uint64_t)c3dAnimation, a3);
}

- (double)timeOffset
{
  if (self->_c3dAnimation)
  {
    c3dAnimation = self->_c3dAnimation;
    return C3DAnimationGetTimeOffset((uint64_t)c3dAnimation);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SCN_CAKeyframeAnimation;
    [(SCN_CAKeyframeAnimation *)&v4 timeOffset];
  }
  return result;
}

- (void)setSpeed:(float)a3
{
  BOOL caReady = self->_caReady;
  c3dAnimation = self->_c3dAnimation;
  if (caReady)
  {
    if (c3dAnimation) {
      C3DAnimationSetSpeed((uint64_t)c3dAnimation, a3);
    }
    goto LABEL_8;
  }
  if (!c3dAnimation)
  {
LABEL_8:
    v8.receiver = self;
    v8.super_class = (Class)SCN_CAKeyframeAnimation;
    *(float *)&double v7 = a3;
    [(SCN_CAKeyframeAnimation *)&v8 setSpeed:v7];
    return;
  }

  C3DAnimationSetSpeed((uint64_t)c3dAnimation, a3);
}

- (float)speed
{
  if (self->_c3dAnimation)
  {
    c3dAnimation = self->_c3dAnimation;
    return C3DAnimationGetSpeed((uint64_t)c3dAnimation);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SCN_CAKeyframeAnimation;
    [(SCN_CAKeyframeAnimation *)&v4 speed];
  }
  return result;
}

- (void)setFadeInDuration:(double)a3
{
  BOOL caReady = self->_caReady;
  c3dAnimation = self->_c3dAnimation;
  if (caReady)
  {
    if (c3dAnimation)
    {
      float v7 = a3;
      C3DAnimationSetFadeInDuration((uint64_t)c3dAnimation, v7);
    }
    goto LABEL_8;
  }
  if (!c3dAnimation)
  {
LABEL_8:
    v9.receiver = self;
    v9.super_class = (Class)SCN_CAKeyframeAnimation;
    [(CAAnimation *)&v9 setFadeInDuration:a3];
    return;
  }
  float v8 = a3;

  C3DAnimationSetFadeInDuration((uint64_t)c3dAnimation, v8);
}

- (double)fadeInDuration
{
  if (self->_c3dAnimation) {
    return C3DAnimationGetFadeInDuration((uint64_t)self->_c3dAnimation);
  }
  v3.receiver = self;
  v3.super_class = (Class)SCN_CAKeyframeAnimation;
  [(CAAnimation *)&v3 fadeInDuration];
  return result;
}

- (void)setFadeOutDuration:(double)a3
{
  BOOL caReady = self->_caReady;
  c3dAnimation = self->_c3dAnimation;
  if (caReady)
  {
    if (c3dAnimation)
    {
      float v7 = a3;
      C3DAnimationSetFadeOutDuration((uint64_t)c3dAnimation, v7);
    }
    goto LABEL_8;
  }
  if (!c3dAnimation)
  {
LABEL_8:
    v9.receiver = self;
    v9.super_class = (Class)SCN_CAKeyframeAnimation;
    [(CAAnimation *)&v9 setFadeOutDuration:a3];
    return;
  }
  float v8 = a3;

  C3DAnimationSetFadeOutDuration((uint64_t)c3dAnimation, v8);
}

- (double)fadeOutDuration
{
  if (self->_c3dAnimation) {
    return C3DAnimationGetFadeOutDuration((uint64_t)self->_c3dAnimation);
  }
  v3.receiver = self;
  v3.super_class = (Class)SCN_CAKeyframeAnimation;
  [(CAAnimation *)&v3 fadeOutDuration];
  return result;
}

- (void)setRemovedOnCompletion:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL caReady = self->_caReady;
  c3dAnimation = self->_c3dAnimation;
  if (caReady)
  {
    if (c3dAnimation) {
      C3DAnimationSetRemoveOnCompletion((uint64_t)c3dAnimation, a3);
    }
    goto LABEL_8;
  }
  if (!c3dAnimation)
  {
LABEL_8:
    v7.receiver = self;
    v7.super_class = (Class)SCN_CAKeyframeAnimation;
    [(SCN_CAKeyframeAnimation *)&v7 setRemovedOnCompletion:v3];
    return;
  }

  C3DAnimationSetRemoveOnCompletion((uint64_t)c3dAnimation, a3);
}

- (BOOL)isRemovedOnCompletion
{
  if (self->_c3dAnimation)
  {
    c3dAnimation = self->_c3dAnimation;
    return C3DAnimationGetRemoveOnCompletion((uint64_t)c3dAnimation);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SCN_CAKeyframeAnimation;
    return [(SCN_CAKeyframeAnimation *)&v4 isRemovedOnCompletion];
  }
}

- (void)setCommitsOnCompletion:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL caReady = self->_caReady;
  c3dAnimation = self->_c3dAnimation;
  if (caReady)
  {
    if (c3dAnimation) {
      C3DAnimationSetCommitWhenDone(c3dAnimation, a3);
    }
    goto LABEL_8;
  }
  if (!c3dAnimation)
  {
LABEL_8:
    v7.receiver = self;
    v7.super_class = (Class)SCN_CAKeyframeAnimation;
    [(CAAnimation *)&v7 setCommitsOnCompletion:v3];
    return;
  }

  C3DAnimationSetCommitWhenDone(c3dAnimation, a3);
}

- (BOOL)commitsOnCompletion
{
  if (self->_c3dAnimation)
  {
    c3dAnimation = self->_c3dAnimation;
    return C3DAnimationGetCommitWhenDone((uint64_t)c3dAnimation);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SCN_CAKeyframeAnimation;
    return [(CAAnimation *)&v4 commitsOnCompletion];
  }
}

- (void)setUsesSceneTimeBase:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL caReady = self->_caReady;
  c3dAnimation = self->_c3dAnimation;
  if (caReady)
  {
    if (c3dAnimation) {
      C3DAnimationSetIsSceneTimeBased((uint64_t)c3dAnimation, a3);
    }
    goto LABEL_8;
  }
  if (!c3dAnimation)
  {
LABEL_8:
    v7.receiver = self;
    v7.super_class = (Class)SCN_CAKeyframeAnimation;
    [(CAAnimation *)&v7 setUsesSceneTimeBase:v3];
    return;
  }

  C3DAnimationSetIsSceneTimeBased((uint64_t)c3dAnimation, a3);
}

- (BOOL)usesSceneTimeBase
{
  if (self->_c3dAnimation)
  {
    c3dAnimation = self->_c3dAnimation;
    return C3DAnimationGetIsSceneTimeBased((uint64_t)c3dAnimation);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SCN_CAKeyframeAnimation;
    return [(CAAnimation *)&v4 usesSceneTimeBase];
  }
}

- (void)setFillMode:(id)a3
{
  c3dAnimation = self->_c3dAnimation;
  if (self->_caReady)
  {
    if (c3dAnimation)
    {
      char v6 = _CAToC3DFillMode((uint64_t)a3);
      C3DAnimationSetFillModeMask((uint64_t)c3dAnimation, v6);
    }
    goto LABEL_8;
  }
  if (!c3dAnimation)
  {
LABEL_8:
    v8.receiver = self;
    v8.super_class = (Class)SCN_CAKeyframeAnimation;
    [(SCN_CAKeyframeAnimation *)&v8 setFillMode:a3];
    return;
  }
  char v7 = _CAToC3DFillMode((uint64_t)a3);

  C3DAnimationSetFillModeMask((uint64_t)c3dAnimation, v7);
}

- (id)fillMode
{
  if (self->_c3dAnimation)
  {
    int FillModeMask = C3DAnimationGetFillModeMask((uint64_t)self->_c3dAnimation);
    return (id)_C3DToCAFillMode(FillModeMask);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SCN_CAKeyframeAnimation;
    return [(SCN_CAKeyframeAnimation *)&v4 fillMode];
  }
}

- (void)setAnimationEvents:(id)a3
{
  c3dAnimation = self->_c3dAnimation;
  if (self->_caReady)
  {
    if (c3dAnimation)
    {
      char v6 = _CAToC3DAnimationEvents(a3);
      C3DAnimationSetAnimationEvents((uint64_t)c3dAnimation, v6);
    }
    goto LABEL_8;
  }
  if (!c3dAnimation)
  {
LABEL_8:
    objc_super v8 = (void *)[a3 copy];
    v9.receiver = self;
    v9.super_class = (Class)SCN_CAKeyframeAnimation;
    [(CAAnimation *)&v9 setAnimationEvents:v8];

    return;
  }
  char v7 = _CAToC3DAnimationEvents(a3);

  C3DAnimationSetAnimationEvents((uint64_t)c3dAnimation, v7);
}

- (id)animationEvents
{
  if (self->_c3dAnimation)
  {
    uint64_t AnimationEvents = C3DAnimationGetAnimationEvents((uint64_t)self->_c3dAnimation);
    return _C3DToCAAnimationEvents(AnimationEvents);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SCN_CAKeyframeAnimation;
    return [(CAAnimation *)&v4 animationEvents];
  }
}

- (void)setTimingFunction:(id)a3
{
  c3dAnimation = self->_c3dAnimation;
  if (self->_caReady)
  {
    if (c3dAnimation)
    {
      id v6 = C3DTimingFunctionFromCAMediaTimingFunction(a3);
      C3DAnimationSetTimingFunction((uint64_t)c3dAnimation, v6);
    }
    goto LABEL_8;
  }
  if (!c3dAnimation)
  {
LABEL_8:
    v8.receiver = self;
    v8.super_class = (Class)SCN_CAKeyframeAnimation;
    [(SCN_CAKeyframeAnimation *)&v8 setTimingFunction:a3];
    return;
  }
  id v7 = C3DTimingFunctionFromCAMediaTimingFunction(a3);

  C3DAnimationSetTimingFunction((uint64_t)c3dAnimation, v7);
}

- (id)timingFunction
{
  if (self->_c3dAnimation)
  {
    id result = (id)C3DAnimationGetTimingFunction((uint64_t)self->_c3dAnimation);
    if (result)
    {
      return (id)CAMediaTimingFunctionFromC3DTimingFunction((uint64_t)result);
    }
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)SCN_CAKeyframeAnimation;
    return [(SCN_CAKeyframeAnimation *)&v3 timingFunction];
  }
  return result;
}

- (void)setAdditive:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL caReady = self->_caReady;
  c3dAnimation = self->_c3dAnimation;
  if (caReady)
  {
    if (c3dAnimation) {
      C3DAnimationSetAdditive((uint64_t)c3dAnimation, a3);
    }
    goto LABEL_8;
  }
  if (!c3dAnimation)
  {
LABEL_8:
    v7.receiver = self;
    v7.super_class = (Class)SCN_CAKeyframeAnimation;
    [(SCN_CAKeyframeAnimation *)&v7 setAdditive:v3];
    return;
  }

  C3DAnimationSetAdditive((uint64_t)c3dAnimation, a3);
}

- (BOOL)isAdditive
{
  if (self->_c3dAnimation)
  {
    c3dAnimation = self->_c3dAnimation;
    return C3DAnimationGetAdditive((uint64_t)c3dAnimation);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SCN_CAKeyframeAnimation;
    return [(SCN_CAKeyframeAnimation *)&v4 isAdditive];
  }
}

- (void)setCumulative:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL caReady = self->_caReady;
  c3dAnimation = self->_c3dAnimation;
  if (caReady)
  {
    if (c3dAnimation) {
      C3DAnimationSetCumulative((uint64_t)c3dAnimation, a3);
    }
    goto LABEL_8;
  }
  if (!c3dAnimation)
  {
LABEL_8:
    v7.receiver = self;
    v7.super_class = (Class)SCN_CAKeyframeAnimation;
    [(SCN_CAKeyframeAnimation *)&v7 setCumulative:v3];
    return;
  }

  C3DAnimationSetCumulative((uint64_t)c3dAnimation, a3);
}

- (BOOL)isCumulative
{
  if (self->_c3dAnimation)
  {
    c3dAnimation = self->_c3dAnimation;
    return C3DAnimationGetCumulative((uint64_t)c3dAnimation);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SCN_CAKeyframeAnimation;
    return [(SCN_CAKeyframeAnimation *)&v4 isCumulative];
  }
}

- (void)encodeWithCoder:(id)a3
{
  c3dAnimation = self->_c3dAnimation;
  if (c3dAnimation || (c3dAnimation = CAAnimationToC3DAnimation(self, 0)) != 0)
  {
    id v6 = (void *)C3DCopyPropertyList(c3dAnimation, 0, 0, 0);
    [a3 encodeObject:v6 forKey:@"c3dAnimation"];
  }
  [(SCN_CAKeyframeAnimation *)self duration];
  objc_msgSend(a3, "encodeDouble:forKey:", @"duration");
  objc_msgSend(a3, "encodeObject:forKey:", -[SCN_CAKeyframeAnimation keyPath](self, "keyPath"), @"keyPath");
  objc_msgSend(a3, "encodeBool:forKey:", -[SCN_CAKeyframeAnimation isCumulative](self, "isCumulative"), @"cumulative");
  objc_msgSend(a3, "encodeBool:forKey:", -[SCN_CAKeyframeAnimation isAdditive](self, "isAdditive"), @"additive");
  objc_msgSend(a3, "encodeObject:forKey:", -[SCN_CAKeyframeAnimation timingFunction](self, "timingFunction"), @"timingFunction");
  objc_msgSend(a3, "encodeObject:forKey:", -[SCN_CAKeyframeAnimation fillMode](self, "fillMode"), @"fillMode");
  objc_msgSend(a3, "encodeBool:forKey:", -[SCN_CAKeyframeAnimation usesSceneTimeBase](self, "usesSceneTimeBase"), @"usesSceneTimeBase");
  objc_msgSend(a3, "encodeBool:forKey:", -[SCN_CAKeyframeAnimation commitsOnCompletion](self, "commitsOnCompletion"), @"commitsOnCompletion");
  objc_msgSend(a3, "encodeBool:forKey:", -[SCN_CAKeyframeAnimation isRemovedOnCompletion](self, "isRemovedOnCompletion"), @"removedOnCompletion");
  objc_msgSend(a3, "encodeBool:forKey:", -[SCN_CAKeyframeAnimation autoreverses](self, "autoreverses"), @"autoreverses");
  [(SCN_CAKeyframeAnimation *)self fadeInDuration];
  objc_msgSend(a3, "encodeDouble:forKey:", @"fadeInDuration");
  [(SCN_CAKeyframeAnimation *)self fadeOutDuration];
  objc_msgSend(a3, "encodeDouble:forKey:", @"fadeOutDuration");
  [(SCN_CAKeyframeAnimation *)self speed];
  [a3 encodeDouble:@"speed" forKey:v7];
  [(SCN_CAKeyframeAnimation *)self timeOffset];
  objc_msgSend(a3, "encodeDouble:forKey:", @"timeOffset");
  [(SCN_CAKeyframeAnimation *)self repeatCount];
  double v9 = v8;

  [a3 encodeDouble:@"repeatCount" forKey:v9];
}

- (SCN_CAKeyframeAnimation)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SCN_CAKeyframeAnimation;
  objc_super v4 = [(SCN_CAKeyframeAnimation *)&v11 init];
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    uint64_t v6 = [a3 decodeObjectOfClasses:SCNPlistClasses() forKey:@"c3dAnimation"];
    float v7 = (const void *)C3DKeyframedAnimationCreate();
    if (C3DInitWithPropertyList(v7, v6, 0, 0))
    {
      [(SCN_CAKeyframeAnimation *)v4 setC3dAnimation:v7];
      if (v7) {
        CFRelease(v7);
      }
      -[SCN_CAKeyframeAnimation setKeyPath:](v4, "setKeyPath:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"keyPath"]);
      [a3 decodeDoubleForKey:@"duration"];
      -[SCN_CAKeyframeAnimation setDuration:](v4, "setDuration:");
      -[SCN_CAKeyframeAnimation setCumulative:](v4, "setCumulative:", [a3 decodeBoolForKey:@"cumulative"]);
      -[SCN_CAKeyframeAnimation setAdditive:](v4, "setAdditive:", [a3 decodeBoolForKey:@"additive"]);
      -[SCN_CAKeyframeAnimation setTimingFunction:](v4, "setTimingFunction:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"timingFunction"]);
      -[SCN_CAKeyframeAnimation setFillMode:](v4, "setFillMode:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"fillMode"]);
      -[SCN_CAKeyframeAnimation setUsesSceneTimeBase:](v4, "setUsesSceneTimeBase:", [a3 decodeBoolForKey:@"usesSceneTimeBase"]);
      -[SCN_CAKeyframeAnimation setCommitsOnCompletion:](v4, "setCommitsOnCompletion:", [a3 decodeBoolForKey:@"commitsOnCompletion"]);
      -[SCN_CAKeyframeAnimation setRemovedOnCompletion:](v4, "setRemovedOnCompletion:", [a3 decodeBoolForKey:@"removedOnCompletion"]);
      -[SCN_CAKeyframeAnimation setAutoreverses:](v4, "setAutoreverses:", [a3 decodeBoolForKey:@"autoreverses"]);
      [a3 decodeDoubleForKey:@"fadeInDuration"];
      -[SCN_CAKeyframeAnimation setFadeInDuration:](v4, "setFadeInDuration:");
      [a3 decodeDoubleForKey:@"fadeOutDuration"];
      -[SCN_CAKeyframeAnimation setFadeOutDuration:](v4, "setFadeOutDuration:");
      [a3 decodeDoubleForKey:@"speed"];
      *(float *)&double v8 = v8;
      [(SCN_CAKeyframeAnimation *)v4 setSpeed:v8];
      [a3 decodeDoubleForKey:@"timeOffset"];
      -[SCN_CAKeyframeAnimation setTimeOffset:](v4, "setTimeOffset:");
      [a3 decodeDoubleForKey:@"repeatCount"];
      *(float *)&double v9 = v9;
      [(SCN_CAKeyframeAnimation *)v4 setRepeatCount:v9];
      +[SCNTransaction setImmediateMode:v5];
    }
    else
    {
      if (v7) {
        CFRelease(v7);
      }

      return 0;
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end