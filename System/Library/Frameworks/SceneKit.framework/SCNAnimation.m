@interface SCNAnimation
+ (BOOL)supportsSecureCoding;
+ (SCNAnimation)animationNamed:(NSString *)animationName;
+ (SCNAnimation)animationWithC3DAnimation:(__C3DAnimation *)a3;
+ (SCNAnimation)animationWithCAAnimation:(CAAnimation *)caAnimation;
+ (SCNAnimation)animationWithContentsOfURL:(NSURL *)animationUrl;
+ (SCNAnimation)animationWithMDLTransform:(id)a3;
+ (id)animationFromScene:(id)a3;
- (BOOL)autoreverses;
- (BOOL)fillsBackward;
- (BOOL)fillsForward;
- (BOOL)isAdditive;
- (BOOL)isAppliedOnCompletion;
- (BOOL)isCumulative;
- (BOOL)isRemovedOnCompletion;
- (BOOL)usesSceneTimeBase;
- (CGFloat)repeatCount;
- (NSArray)animationEvents;
- (NSString)description;
- (NSString)keyPath;
- (NSTimeInterval)blendInDuration;
- (NSTimeInterval)blendOutDuration;
- (NSTimeInterval)duration;
- (NSTimeInterval)startDelay;
- (NSTimeInterval)timeOffset;
- (SCNAnimation)initWithC3DAnimation:(__C3DAnimation *)a3;
- (SCNAnimation)initWithCAAnimation:(id)a3;
- (SCNAnimation)initWithCoder:(id)a3;
- (SCNAnimationDidStartBlock)animationDidStart;
- (SCNAnimationDidStopBlock)animationDidStop;
- (SCNTimingFunction)timingFunction;
- (__C3DAnimation)animationRef;
- (double)fadeInDuration;
- (double)fadeOutDuration;
- (double)repeatDuration;
- (id)caAnimation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)subAnimations;
- (id)userAnimation;
- (id)valueForUndefinedKey:(id)a3;
- (void)__CFObject;
- (void)_didMutate;
- (void)_optimizeKeyframesWithTarget:(id)a3;
- (void)_setAnimationRef:(__C3DAnimation *)a3;
- (void)_syncObjCModel;
- (void)caAnimation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)prepareWithTarget:(id)a3 implicitDuration:(double)a4;
- (void)setAdditive:(BOOL)additive;
- (void)setAnimationDidStart:(SCNAnimationDidStartBlock)animationDidStart;
- (void)setAnimationDidStop:(SCNAnimationDidStopBlock)animationDidStop;
- (void)setAnimationEvents:(NSArray *)animationEvents;
- (void)setAppliedOnCompletion:(BOOL)appliedOnCompletion;
- (void)setAutoreverses:(BOOL)autoreverses;
- (void)setBlendInDuration:(NSTimeInterval)blendInDuration;
- (void)setBlendOutDuration:(NSTimeInterval)blendOutDuration;
- (void)setCumulative:(BOOL)cumulative;
- (void)setDuration:(NSTimeInterval)duration;
- (void)setFillsBackward:(BOOL)fillsBackward;
- (void)setFillsForward:(BOOL)fillsForward;
- (void)setKeyPath:(NSString *)keyPath;
- (void)setRemovedOnCompletion:(BOOL)removedOnCompletion;
- (void)setRepeatCount:(CGFloat)repeatCount;
- (void)setRepeatDuration:(double)a3;
- (void)setStartDelay:(NSTimeInterval)startDelay;
- (void)setTimeOffset:(NSTimeInterval)timeOffset;
- (void)setTimingFunction:(SCNTimingFunction *)timingFunction;
- (void)setUsesSceneTimeBase:(BOOL)usesSceneTimeBase;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation SCNAnimation

+ (SCNAnimation)animationWithMDLTransform:(id)a3
{
  uint64_t v3 = [a3 transformAnimation];

  return +[SCNAnimation animationWithCAAnimation:v3];
}

- (void)dealloc
{
  animationRef = self->_animationRef;
  if (animationRef) {
    C3DEntitySetObjCWrapper((uint64_t)animationRef, 0);
  }

  id animationDidStart = self->_animationDidStart;
  if (animationDidStart) {
    _Block_release(animationDidStart);
  }
  id animationDidStop = self->_animationDidStop;
  if (animationDidStop) {
    _Block_release(animationDidStop);
  }
  v6 = self->_animationRef;
  if (v6)
  {
    CFRelease(v6);
    self->_animationRef = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)SCNAnimation;
  [(SCNAnimation *)&v7 dealloc];
}

- (SCNAnimation)initWithC3DAnimation:(__C3DAnimation *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNAnimation;
  v4 = [(SCNAnimation *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_userInfoLock._os_unfair_lock_opaque = 0;
    [(SCNAnimation *)v4 _setAnimationRef:a3];
    [(SCNAnimation *)v5 _syncObjCModel];
    v5->_didMutate = 0;
  }
  return v5;
}

- (SCNAnimation)initWithCAAnimation:(id)a3
{
  v27.receiver = self;
  v27.super_class = (Class)SCNAnimation;
  v4 = [(SCNAnimation *)&v27 init];
  v5 = v4;
  if (v4)
  {
    v4->_userInfoLock._os_unfair_lock_opaque = 0;
    v4->_userAnimation = (id)[a3 copy];
    [a3 duration];
    v5->_duration = v6;
    [a3 repeatCount];
    v5->_repeatCount = v7;
    v5->_autoreverses = [a3 autoreverses];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5->_additive = [a3 isAdditive];
      v5->_cumulative = [a3 isCumulative];
      v5->_keyPath = (NSString *)objc_msgSend((id)objc_msgSend(a3, "keyPath"), "copy");
    }
    v5->_removedOnCompletion = [a3 isRemovedOnCompletion];
    [a3 beginTime];
    v5->_beginTime = v8;
    [a3 timeOffset];
    v5->_timeOffset = v9;
    [a3 fadeInDuration];
    v5->_fadeInDuration = v10;
    [a3 fadeOutDuration];
    v5->_fadeOutDuration = v11;
    v5->_usesSceneTimeBase = [a3 usesSceneTimeBase];
    uint64_t v12 = [a3 fillMode];
    uint64_t v13 = *MEMORY[0x263F15AA8];
    if (v12 == *MEMORY[0x263F15AA8])
    {
      BOOL v15 = 1;
    }
    else
    {
      uint64_t v14 = [a3 fillMode];
      BOOL v15 = v14 == *MEMORY[0x263F15AB0];
    }
    v5->_fillForward = v15;
    if ([a3 fillMode] == v13)
    {
      BOOL v17 = 1;
    }
    else
    {
      uint64_t v16 = [a3 fillMode];
      BOOL v17 = v16 == *MEMORY[0x263F15AA0];
    }
    v5->_fillBackward = v17;
    if (v5->_animationEvents)
    {
      v18 = scn_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        -[SCNAnimation initWithCAAnimation:](v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
    v5->_animationEvents = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "animationEvents"), "copy");
    v5->_timingFunction = +[SCNTimingFunction functionWithCAMediaTimingFunction:](SCNTimingFunction, "functionWithCAMediaTimingFunction:", [a3 timingFunction]);
    v5->_didMutate = 0;
  }
  return v5;
}

+ (SCNAnimation)animationWithC3DAnimation:(__C3DAnimation *)a3
{
  uint64_t v3 = [[SCNAnimation alloc] initWithC3DAnimation:a3];

  return v3;
}

- (void)_setAnimationRef:(__C3DAnimation *)a3
{
  animationRef = self->_animationRef;
  if (animationRef != a3)
  {
    if (animationRef)
    {
      CFRelease(animationRef);
      self->_animationRef = 0;
    }
    if (a3) {
      double v6 = (__C3DAnimation *)CFRetain(a3);
    }
    else {
      double v6 = 0;
    }
    self->_animationRef = v6;
  }
  if (a3)
  {
    C3DEntitySetObjCWrapper((uint64_t)a3, self);
  }
}

- (__C3DAnimation)animationRef
{
  return self->_animationRef;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[30] = 0;
  animationRef = self->_animationRef;
  if (animationRef)
  {
    Copy = C3DAnimationCreateCopy(animationRef);
    [v4 _setAnimationRef:Copy];
    if (Copy) {
      CFRelease(Copy);
    }
  }
  *((void *)v4 + 8) = self->_timingFunction;
  *((void *)v4 + 9) = self->_animationEvents;
  id animationDidStart = self->_animationDidStart;
  if (animationDidStart) {
    *((void *)v4 + 12) = _Block_copy(animationDidStart);
  }
  id animationDidStop = self->_animationDidStop;
  if (animationDidStop) {
    *((void *)v4 + 13) = _Block_copy(animationDidStop);
  }
  *((void *)v4 + 3) = *(void *)&self->_duration;
  *((void *)v4 + 4) = *(void *)&self->_repeatCount;
  *((void *)v4 + 5) = *(void *)&self->_timeOffset;
  *((void *)v4 + 6) = *(void *)&self->_beginTime;
  *((unsigned char *)v4 + 56) = self->_autoreverses;
  *((unsigned char *)v4 + 57) = self->_removedOnCompletion;
  *((unsigned char *)v4 + 58) = self->_applyOnCompletion;
  *((unsigned char *)v4 + 59) = self->_additive;
  *((unsigned char *)v4 + 60) = self->_cumulative;
  *((unsigned char *)v4 + 62) = self->_fillForward;
  *((unsigned char *)v4 + 63) = self->_fillBackward;
  *((void *)v4 + 10) = *(void *)&self->_fadeInDuration;
  *((void *)v4 + 11) = *(void *)&self->_fadeOutDuration;
  *((unsigned char *)v4 + 61) = self->_usesSceneTimeBase;
  *((void *)v4 + 17) = [self->_userAnimation copy];
  *((unsigned char *)v4 + 144) = self->_didMutate;
  return v4;
}

- (void)_syncObjCModel
{
  uint64_t v3 = (void *)[(id)C3DAnimationGetKeyPath((uint64_t)self->_animationRef) componentsJoinedByString:@"."];

  self->_keyPath = (NSString *)v3;
  self->_duration = C3DAnimationGetDuration((uint64_t)self->_animationRef);
  self->_repeatCount = C3DAnimationGetRepeatCount((uint64_t)self->_animationRef);
  self->_autoreverses = C3DAnimationGetAutoreverses((uint64_t)self->_animationRef);
  self->_beginTime = C3DAnimationNodeGetPauseTime((uint64_t)self->_animationRef);
  self->_timeOffset = C3DAnimationGetTimeOffset((uint64_t)self->_animationRef);
  self->_fadeInDuration = C3DAnimationGetFadeInDuration((uint64_t)self->_animationRef);
  self->_fadeOutDuration = C3DAnimationGetFadeOutDuration((uint64_t)self->_animationRef);
  self->_removedOnCompletion = C3DAnimationGetRemoveOnCompletion((uint64_t)self->_animationRef);
  self->_usesSceneTimeBase = C3DAnimationGetIsSceneTimeBased((uint64_t)self->_animationRef);
  char FillModeMask = C3DAnimationGetFillModeMask((uint64_t)self->_animationRef);
  self->_fillForward = FillModeMask & 1;
  self->_fillBackward = (FillModeMask & 2) != 0;
  uint64_t AnimationEvents = C3DAnimationGetAnimationEvents((uint64_t)self->_animationRef);
  double v6 = (NSArray *)_C3DToCAAnimationEvents(AnimationEvents);
  float v7 = self->_animationEvents;
  if (v7 != v6)
  {
    double v8 = v6;

    self->_animationEvents = v8;
  }
  uint64_t TimingFunction = C3DAnimationGetTimingFunction((uint64_t)self->_animationRef);
  if (TimingFunction)
  {
    uint64_t v10 = TimingFunction;

    self->_timingFunction = [[SCNTimingFunction alloc] initWithTimingFunctionRef:v10];
  }
  self->_applyOnCompletion = C3DAnimationGetCommitWhenDone((uint64_t)self->_animationRef);
  self->_additive = C3DAnimationGetAdditive((uint64_t)self->_animationRef);
  self->_cumulative = C3DAnimationGetCumulative((uint64_t)self->_animationRef);
}

- (void)encodeWithCoder:(id)a3
{
  animationRef = self->_animationRef;
  if (animationRef)
  {
    CFTypeID v6 = CFGetTypeID(animationRef);
    if (v6 == C3DSimpleAnimationGetTypeID())
    {
      float v7 = @"basic";
    }
    else if (v6 == C3DKeyframedAnimationGetTypeID())
    {
      float v7 = @"keyframe";
    }
    else if (v6 == C3DAnimationGroupGetTypeID())
    {
      float v7 = @"group";
    }
    else
    {
      CFStringRef v9 = CFCopyTypeIDDescription(v6);
      uint64_t v10 = scn_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[SCNAnimation encodeWithCoder:]();
      }
      CFRelease(v9);
      float v7 = 0;
    }
    double v11 = (void *)C3DCopyPropertyList(self->_animationRef, 0, 0, 0);
    [a3 encodeObject:v11 forKey:@"c3dAnimation"];
    [a3 encodeObject:v7 forKey:@"c3dAnimationType"];
  }
  else
  {
    double v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SCNAnimation encodeWithCoder:]();
    }
  }
  objc_msgSend(a3, "encodeObject:forKey:", -[SCNAnimation keyPath](self, "keyPath"), @"keyPath");
  [(SCNAnimation *)self duration];
  objc_msgSend(a3, "encodeDouble:forKey:", @"duration");
  [(SCNAnimation *)self repeatCount];
  objc_msgSend(a3, "encodeDouble:forKey:", @"repeatCount");
  [(SCNAnimation *)self timeOffset];
  objc_msgSend(a3, "encodeDouble:forKey:", @"timeOffset");
  [(SCNAnimation *)self startDelay];
  objc_msgSend(a3, "encodeDouble:forKey:", @"beginTime");
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNAnimation autoreverses](self, "autoreverses"), @"autoreverses");
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNAnimation isRemovedOnCompletion](self, "isRemovedOnCompletion"), @"removedOnCompletion");
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNAnimation isAppliedOnCompletion](self, "isAppliedOnCompletion"), @"applyOnCompletion");
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNAnimation isAdditive](self, "isAdditive"), @"additive");
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNAnimation isCumulative](self, "isCumulative"), @"cumulative");
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNAnimation usesSceneTimeBase](self, "usesSceneTimeBase"), @"usesSceneTimeBase");
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNAnimation fillsForward](self, "fillsForward"), @"fillForward");
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNAnimation fillsBackward](self, "fillsBackward"), @"fillBackward");
  objc_msgSend(a3, "encodeObject:forKey:", -[SCNAnimation timingFunction](self, "timingFunction"), @"timingFunction");
  [(SCNAnimation *)self fadeInDuration];
  objc_msgSend(a3, "encodeDouble:forKey:", @"fadeInDuration");
  [(SCNAnimation *)self fadeOutDuration];
  objc_msgSend(a3, "encodeDouble:forKey:", @"fadeOutDuration");
  if (self->_userInfo)
  {
    os_unfair_lock_lock(&self->_userInfoLock);
    [a3 encodeObject:self->_userInfo forKey:@"userInfo"];
    os_unfair_lock_unlock(&self->_userInfoLock);
  }
}

- (SCNAnimation)initWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SCNAnimation;
  v4 = [(SCNAnimation *)&v13 init];
  v5 = v4;
  if (!v4) {
    return v5;
  }
  v4->_userInfoLock._os_unfair_lock_opaque = 0;
  uint64_t v6 = [a3 decodeObjectOfClasses:SCNPlistClasses() forKey:@"c3dAnimation"];
  float v7 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"c3dAnimationType"];
  if ([v7 isEqualToString:@"basic"])
  {
    uint64_t v8 = C3DSimpleAnimationCreate();
  }
  else if (v7 && ![v7 isEqualToString:@"keyframe"])
  {
    if (![v7 isEqualToString:@"group"])
    {
      uint64_t v12 = scn_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SCNAnimation encodeWithCoder:]();
      }
      CFStringRef v9 = 0;
      goto LABEL_8;
    }
    uint64_t v8 = C3DAnimationGroupCreate();
  }
  else
  {
    uint64_t v8 = C3DKeyframedAnimationCreate();
  }
  CFStringRef v9 = (const void *)v8;
LABEL_8:
  if (C3DInitWithPropertyList(v9, v6, 0, 0)) {
    [(SCNAnimation *)v5 _setAnimationRef:v9];
  }
  CFRelease(v9);
  +[SCNTransaction begin];
  +[SCNTransaction setImmediateMode:1];
  -[SCNAnimation setKeyPath:](v5, "setKeyPath:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"keyPath"]);
  [a3 decodeDoubleForKey:@"duration"];
  -[SCNAnimation setDuration:](v5, "setDuration:");
  [a3 decodeDoubleForKey:@"repeatCount"];
  -[SCNAnimation setRepeatCount:](v5, "setRepeatCount:");
  [a3 decodeDoubleForKey:@"timeOffset"];
  -[SCNAnimation setTimeOffset:](v5, "setTimeOffset:");
  [a3 decodeDoubleForKey:@"beginTime"];
  -[SCNAnimation setStartDelay:](v5, "setStartDelay:");
  -[SCNAnimation setAutoreverses:](v5, "setAutoreverses:", [a3 decodeBoolForKey:@"autoreverses"]);
  -[SCNAnimation setAppliedOnCompletion:](v5, "setAppliedOnCompletion:", [a3 decodeBoolForKey:@"appliedOnCompletion"]);
  -[SCNAnimation setRemovedOnCompletion:](v5, "setRemovedOnCompletion:", [a3 decodeBoolForKey:@"removedOnCompletion"]);
  -[SCNAnimation setAdditive:](v5, "setAdditive:", [a3 decodeBoolForKey:@"additive"]);
  -[SCNAnimation setCumulative:](v5, "setCumulative:", [a3 decodeBoolForKey:@"cumulative"]);
  -[SCNAnimation setUsesSceneTimeBase:](v5, "setUsesSceneTimeBase:", [a3 decodeBoolForKey:@"usesSceneTimeBase"]);
  -[SCNAnimation setFillsForward:](v5, "setFillsForward:", [a3 decodeBoolForKey:@"fillForward"]);
  -[SCNAnimation setFillsBackward:](v5, "setFillsBackward:", [a3 decodeBoolForKey:@"fillBackward"]);
  -[SCNAnimation setTimingFunction:](v5, "setTimingFunction:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"timingFunction"]);
  [a3 decodeDoubleForKey:@"fadeInDuration"];
  -[SCNAnimation setFadeInDuration:](v5, "setFadeInDuration:");
  [a3 decodeDoubleForKey:@"fadeOutDuration"];
  -[SCNAnimation setFadeOutDuration:](v5, "setFadeOutDuration:");
  +[SCNTransaction commit];
  uint64_t v10 = (void *)[a3 decodeObjectOfClasses:SCNUserInfoClasses() forKey:@"userInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5->_userInfo = (NSMutableDictionary *)[v10 mutableCopy];
  }
  v5->_didMutate = 0;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (SCNAnimation)animationNamed:(NSString *)animationName
{
  v5 = (void *)SCNGetResourceBundle();
  uint64_t v6 = [(NSString *)animationName pathExtension];
  float v7 = [(NSString *)animationName stringByDeletingPathExtension];
  if (v6) {
    uint64_t v8 = (__CFString *)v6;
  }
  else {
    uint64_t v8 = @"scna";
  }
  result = (SCNAnimation *)[v5 URLForResource:v7 withExtension:v8];
  if (result)
  {
    return (SCNAnimation *)[a1 animationWithContentsOfURL:result];
  }
  return result;
}

+ (id)animationFromScene:(id)a3
{
  v4 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v11 = 0;
  uint64_t v12 = (double *)&v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v5 = (void *)[a3 rootNode];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __35__SCNAnimation_animationFromScene___block_invoke;
  v10[3] = &unk_264008AA8;
  v10[4] = v4;
  v10[5] = &v11;
  [v5 enumerateHierarchyUsingBlock:v10];
  if ([v4 count])
  {
    if ([v4 count] == 1)
    {
      uint64_t v6 = +[SCNAnimation animationWithCAAnimation:](SCNAnimation, "animationWithCAAnimation:", [v4 objectAtIndexedSubscript:0]);
    }
    else
    {
      uint64_t v8 = (void *)[MEMORY[0x263F15750] animation];
      [v8 setAnimations:v4];
      [v8 setDuration:v12[3]];
      uint64_t v6 = +[SCNAnimation animationWithCAAnimation:v8];
    }
    float v7 = v6;
  }
  else
  {
    float v7 = 0;
  }
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __35__SCNAnimation_animationFromScene___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = objc_msgSend(a2, "animationKeys", 0);
  uint64_t result = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        CFStringRef v9 = (void *)[a2 animationForKey:*(void *)(*((void *)&v12 + 1) + 8 * v8)];
        double v10 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        [v9 duration];
        if (v10 >= v11) {
          double v11 = v10;
        }
        *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v11;
        [*(id *)(a1 + 32) addObject:v9];
        ++v8;
      }
      while (v6 != v8);
      uint64_t result = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v6 = result;
    }
    while (result);
  }
  return result;
}

+ (SCNAnimation)animationWithContentsOfURL:(NSURL *)animationUrl
{
  v13[3] = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithContentsOfURL:");
  id v12 = 0;
  uint64_t v6 = (void *)MEMORY[0x263F08928];
  uint64_t v7 = (void *)MEMORY[0x263EFFA08];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v13[2] = objc_opt_class();
  uint64_t v8 = (SCNAnimation *)objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v7, "setWithArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v13, 3)), v5, &v12);
  if (v12 && (CFStringRef v9 = scn_default_log(), os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)))
  {
    +[SCNAnimation animationWithContentsOfURL:v9];
    if (!v8) {
      return v8;
    }
  }
  else if (!v8)
  {
    return v8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return (SCNAnimation *)[a1 animationFromScene:v8];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return +[SCNAnimation animationWithCAAnimation:v8];
  }
  return v8;
}

+ (SCNAnimation)animationWithCAAnimation:(CAAnimation *)caAnimation
{
  uint64_t v3 = [[SCNAnimation alloc] initWithCAAnimation:caAnimation];

  return v3;
}

- (void)prepareWithTarget:(id)a3 implicitDuration:(double)a4
{
  if (self->_animationRef || (id v9 = [(SCNAnimation *)self caAnimation]) == 0)
  {
LABEL_2:
    [(SCNAnimation *)self duration];
    if (v6 == 0.0)
    {
      if (a4 == 0.0)
      {
        uint64_t v7 = scn_default_log();
        a4 = 0.25;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v12 = 0;
          _os_log_impl(&dword_20B249000, v7, OS_LOG_TYPE_DEFAULT, "Warning: default duration is zero - using default transaction duration", v12, 2u);
        }
      }
      [(SCNAnimation *)self setDuration:a4];
    }
    return;
  }
  double v10 = CAAnimationToC3DAnimation(v9, a3);
  if (v10)
  {
    [(SCNAnimation *)self _setAnimationRef:v10];
    [(SCNAnimation *)self _syncObjCModel];
    goto LABEL_2;
  }
  double v11 = scn_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[SCNAnimation prepareWithTarget:implicitDuration:]();
  }
}

- (id)userAnimation
{
  if (*((void *)self + 17)) {
    return (id)*((void *)self + 17);
  }
  return self;
}

- (id)caAnimation
{
  BOOL didMutate = self->_didMutate;
  self->_BOOL didMutate = 0;
  id userAnimation = self->_userAnimation;
  if (!didMutate && userAnimation != 0) {
    return userAnimation;
  }
  objc_sync_enter(self);
  id userAnimation = self->_caAnimationCache;
  objc_sync_exit(self);
  if (!didMutate && userAnimation != 0) {
    return userAnimation;
  }
  animationRef = self->_animationRef;
  if (animationRef)
  {
    id userAnimation = C3DAnimationToCAAnimation(animationRef);
LABEL_21:
    objc_sync_enter(self);

    self->_caAnimationCache = userAnimation;
    objc_sync_exit(self);
    return userAnimation;
  }
  id v8 = self->_userAnimation;
  if (v8)
  {
    id userAnimation = (id)[v8 copy];
    [(SCNAnimation *)self duration];
    objc_msgSend(userAnimation, "setDuration:");
    [(SCNAnimation *)self repeatCount];
    *(float *)&double v9 = v9;
    [userAnimation setRepeatCount:v9];
    objc_msgSend(userAnimation, "setAutoreverses:", -[SCNAnimation autoreverses](self, "autoreverses"));
    [(SCNAnimation *)self startDelay];
    objc_msgSend(userAnimation, "setBeginTime:");
    [(SCNAnimation *)self timeOffset];
    objc_msgSend(userAnimation, "setTimeOffset:");
    [(SCNAnimation *)self fadeInDuration];
    objc_msgSend(userAnimation, "setFadeInDuration:");
    [(SCNAnimation *)self fadeOutDuration];
    objc_msgSend(userAnimation, "setFadeOutDuration:");
    objc_msgSend(userAnimation, "setRemovedOnCompletion:", -[SCNAnimation isRemovedOnCompletion](self, "isRemovedOnCompletion"));
    objc_msgSend(userAnimation, "setCommitsOnCompletion:", -[SCNAnimation isAppliedOnCompletion](self, "isAppliedOnCompletion"));
    objc_msgSend(userAnimation, "setUsesSceneTimeBase:", -[SCNAnimation usesSceneTimeBase](self, "usesSceneTimeBase"));
    BOOL v10 = [(SCNAnimation *)self fillsForward];
    BOOL v11 = [(SCNAnimation *)self fillsBackward];
    id v12 = (void *)MEMORY[0x263F15AA8];
    if (!v10) {
      id v12 = (void *)MEMORY[0x263F15AA0];
    }
    long long v13 = (void *)MEMORY[0x263F15AB0];
    if (!v10) {
      long long v13 = (void *)MEMORY[0x263F15AB8];
    }
    if (!v11) {
      id v12 = v13;
    }
    [userAnimation setFillMode:*v12];
    objc_msgSend(userAnimation, "setAnimationEvents:", -[SCNAnimation animationEvents](self, "animationEvents"));
    goto LABEL_21;
  }
  long long v15 = scn_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[SCNAnimation caAnimation]();
  }
  return 0;
}

- (void)__CFObject
{
  return self->_animationRef;
}

- (void)setKeyPath:(NSString *)keyPath
{
  self->_keyPath = (NSString *)[(NSString *)keyPath copy];
  if (self->_animationRef)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __27__SCNAnimation_setKeyPath___block_invoke;
    v5[3] = &unk_264006160;
    v5[4] = keyPath;
    v5[5] = self;
    +[SCNTransaction postCommandWithContext:0 object:self applyBlock:v5];
  }
}

void __27__SCNAnimation_setKeyPath___block_invoke(uint64_t a1)
{
  CFStringRef v2 = C3DCreatePathComponentsFromString(*(const __CFString **)(a1 + 32));
  C3DAnimationSetKeyPath(*(void *)(*(void *)(a1 + 40) + 8), v2);
  if (v2)
  {
    CFRelease(v2);
  }
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (NSTimeInterval)duration
{
  return self->_duration;
}

- (void)_didMutate
{
  self->_BOOL didMutate = 1;
}

- (void)setDuration:(NSTimeInterval)duration
{
  if (self->_duration != duration)
  {
    self->_duration = duration;
    [(SCNAnimation *)self _didMutate];
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __28__SCNAnimation_setDuration___block_invoke;
      v5[3] = &unk_264004FC0;
      v5[4] = self;
      *(NSTimeInterval *)&v5[5] = duration;
      +[SCNTransaction postCommandWithContext:0 object:self applyBlock:v5];
    }
  }
}

float __28__SCNAnimation_setDuration___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DAnimationSetDuration(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)repeatCount
{
  return self->_repeatCount;
}

- (void)setRepeatCount:(CGFloat)repeatCount
{
  if (self->_repeatCount != repeatCount)
  {
    self->_repeatCount = repeatCount;
    [(SCNAnimation *)self _didMutate];
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __31__SCNAnimation_setRepeatCount___block_invoke;
      v5[3] = &unk_264004FC0;
      v5[4] = self;
      *(CGFloat *)&v5[5] = repeatCount;
      +[SCNTransaction postCommandWithContext:0 object:self applyBlock:v5];
    }
  }
}

float __31__SCNAnimation_setRepeatCount___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DAnimationSetRepeatCount(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (double)repeatDuration
{
  [(SCNAnimation *)self duration];
  double v4 = v3;
  [(SCNAnimation *)self repeatCount];
  double result = v4 * v5;
  if (self->_autoreverses) {
    return result + result;
  }
  return result;
}

- (void)setRepeatDuration:(double)a3
{
  if (a3 != 0.0)
  {
    double duration = self->_duration;
    if (duration != 0.0)
    {
      double v4 = a3 / duration;
      if (self->_autoreverses) {
        double v4 = v4 * 0.5;
      }
      [(SCNAnimation *)self setRepeatCount:v4];
    }
  }
}

- (NSTimeInterval)timeOffset
{
  return self->_timeOffset;
}

- (void)setTimeOffset:(NSTimeInterval)timeOffset
{
  if (self->_timeOffset != timeOffset)
  {
    self->_timeOffset = timeOffset;
    [(SCNAnimation *)self _didMutate];
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __30__SCNAnimation_setTimeOffset___block_invoke;
      v5[3] = &unk_264004FC0;
      v5[4] = self;
      *(NSTimeInterval *)&v5[5] = timeOffset;
      +[SCNTransaction postCommandWithContext:0 object:self applyBlock:v5];
    }
  }
}

void __30__SCNAnimation_setTimeOffset___block_invoke(uint64_t a1)
{
}

- (NSTimeInterval)startDelay
{
  return self->_beginTime;
}

- (void)setStartDelay:(NSTimeInterval)startDelay
{
  if (self->_beginTime != startDelay)
  {
    self->_beginTime = startDelay;
    [(SCNAnimation *)self _didMutate];
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __30__SCNAnimation_setStartDelay___block_invoke;
      v5[3] = &unk_264004FC0;
      v5[4] = self;
      *(NSTimeInterval *)&v5[5] = startDelay;
      +[SCNTransaction postCommandWithContext:0 object:self applyBlock:v5];
    }
  }
}

void __30__SCNAnimation_setStartDelay___block_invoke(uint64_t a1)
{
}

- (BOOL)autoreverses
{
  return self->_autoreverses;
}

- (void)setAutoreverses:(BOOL)autoreverses
{
  if (self->_autoreverses != autoreverses)
  {
    self->_autoreverses = autoreverses;
    [(SCNAnimation *)self _didMutate];
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __32__SCNAnimation_setAutoreverses___block_invoke;
      v5[3] = &unk_264004FE8;
      v5[4] = self;
      BOOL v6 = autoreverses;
      +[SCNTransaction postCommandWithContext:0 object:self applyBlock:v5];
    }
  }
}

void __32__SCNAnimation_setAutoreverses___block_invoke(uint64_t a1)
{
}

- (BOOL)usesSceneTimeBase
{
  return self->_usesSceneTimeBase;
}

- (void)setUsesSceneTimeBase:(BOOL)usesSceneTimeBase
{
  if (self->_usesSceneTimeBase != usesSceneTimeBase)
  {
    self->_usesSceneTimeBase = usesSceneTimeBase;
    [(SCNAnimation *)self _didMutate];
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __37__SCNAnimation_setUsesSceneTimeBase___block_invoke;
      v5[3] = &unk_264004FE8;
      v5[4] = self;
      BOOL v6 = usesSceneTimeBase;
      +[SCNTransaction postCommandWithContext:0 object:self applyBlock:v5];
    }
  }
}

void __37__SCNAnimation_setUsesSceneTimeBase___block_invoke(uint64_t a1)
{
}

- (BOOL)fillsForward
{
  return self->_fillForward;
}

- (void)setFillsForward:(BOOL)fillsForward
{
  if (self->_fillForward != fillsForward)
  {
    self->_fillForward = fillsForward;
    [(SCNAnimation *)self _didMutate];
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __32__SCNAnimation_setFillsForward___block_invoke;
      v5[3] = &unk_264004FE8;
      v5[4] = self;
      BOOL v6 = fillsForward;
      +[SCNTransaction postCommandWithContext:0 object:self applyBlock:v5];
    }
  }
}

void __32__SCNAnimation_setFillsForward___block_invoke(uint64_t a1)
{
  char v2 = C3DAnimationGetFillModeMask(*(void *)(*(void *)(a1 + 32) + 8)) & 0xFE | *(unsigned char *)(a1 + 40);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);

  C3DAnimationSetFillModeMask(v3, v2);
}

- (BOOL)fillsBackward
{
  return self->_fillBackward;
}

- (void)setFillsBackward:(BOOL)fillsBackward
{
  if (self->_fillBackward != fillsBackward)
  {
    self->_fillBackward = fillsBackward;
    [(SCNAnimation *)self _didMutate];
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __33__SCNAnimation_setFillsBackward___block_invoke;
      v5[3] = &unk_264004FE8;
      v5[4] = self;
      BOOL v6 = fillsBackward;
      +[SCNTransaction postCommandWithContext:0 object:self applyBlock:v5];
    }
  }
}

void __33__SCNAnimation_setFillsBackward___block_invoke(uint64_t a1)
{
  char v2 = C3DAnimationGetFillModeMask(*(void *)(*(void *)(a1 + 32) + 8)) & 0xFD | (2 * *(unsigned char *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);

  C3DAnimationSetFillModeMask(v3, v2);
}

- (SCNTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(SCNTimingFunction *)timingFunction
{
  uint64_t v3 = self->_timingFunction;
  if (v3 != timingFunction)
  {

    self->_timingFunction = timingFunction;
    [(SCNAnimation *)self _didMutate];
    if (self->_animationRef)
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __34__SCNAnimation_setTimingFunction___block_invoke;
      v6[3] = &unk_264006160;
      v6[4] = timingFunction;
      v6[5] = self;
      +[SCNTransaction postCommandWithContext:0 object:self applyBlock:v6];
    }
  }
}

CFTypeRef __34__SCNAnimation_setTimingFunction___block_invoke(uint64_t a1)
{
  char v2 = (const void *)[*(id *)(a1 + 32) c3dTimingFunction];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);

  return C3DAnimationSetTimingFunction(v3, v2);
}

- (BOOL)isRemovedOnCompletion
{
  return self->_removedOnCompletion;
}

- (void)setRemovedOnCompletion:(BOOL)removedOnCompletion
{
  if (self->_removedOnCompletion != removedOnCompletion)
  {
    self->_removedOnCompletion = removedOnCompletion;
    [(SCNAnimation *)self _didMutate];
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __39__SCNAnimation_setRemovedOnCompletion___block_invoke;
      v5[3] = &unk_264004FE8;
      v5[4] = self;
      BOOL v6 = removedOnCompletion;
      +[SCNTransaction postCommandWithContext:0 object:self applyBlock:v5];
    }
  }
}

void __39__SCNAnimation_setRemovedOnCompletion___block_invoke(uint64_t a1)
{
}

- (BOOL)isAppliedOnCompletion
{
  return self->_applyOnCompletion;
}

- (void)setAppliedOnCompletion:(BOOL)appliedOnCompletion
{
  if (self->_applyOnCompletion != appliedOnCompletion)
  {
    self->_applyOnCompletion = appliedOnCompletion;
    [(SCNAnimation *)self _didMutate];
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __39__SCNAnimation_setAppliedOnCompletion___block_invoke;
      v5[3] = &unk_264004FE8;
      v5[4] = self;
      BOOL v6 = appliedOnCompletion;
      +[SCNTransaction postCommandWithContext:0 object:self applyBlock:v5];
    }
  }
}

uint64_t __39__SCNAnimation_setAppliedOnCompletion___block_invoke(uint64_t a1)
{
  return C3DAnimationSetCommitWhenDone(*(_WORD **)(*(void *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (SCNAnimationDidStartBlock)animationDidStart
{
  return self->_animationDidStart;
}

- (void)setAnimationDidStart:(SCNAnimationDidStartBlock)animationDidStart
{
  id v5 = self->_animationDidStart;
  if (v5) {
    _Block_release(v5);
  }
  self->_id animationDidStart = 0;
  if (animationDidStart) {
    self->_id animationDidStart = _Block_copy(animationDidStart);
  }
  if (self->_animationRef)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __37__SCNAnimation_setAnimationDidStart___block_invoke;
    v6[3] = &unk_264005010;
    v6[4] = self;
    +[SCNTransaction postCommandWithContext:0 object:self applyBlock:v6];
  }
}

void *__37__SCNAnimation_setAnimationDidStart___block_invoke(uint64_t a1)
{
  double result = (void *)C3DAnimationGetAnimationCallbacks(*(void *)(*(void *)(a1 + 32) + 8));
  void *result = SCNAnimationDidStart;
  return result;
}

- (SCNAnimationDidStopBlock)animationDidStop
{
  return self->_animationDidStop;
}

- (void)setAnimationDidStop:(SCNAnimationDidStopBlock)animationDidStop
{
  id v5 = self->_animationDidStop;
  if (v5) {
    _Block_release(v5);
  }
  self->_id animationDidStop = 0;
  if (animationDidStop) {
    self->_id animationDidStop = _Block_copy(animationDidStop);
  }
  if (self->_animationRef)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __36__SCNAnimation_setAnimationDidStop___block_invoke;
    v6[3] = &unk_264005010;
    v6[4] = self;
    +[SCNTransaction postCommandWithContext:0 object:self applyBlock:v6];
  }
}

uint64_t __36__SCNAnimation_setAnimationDidStop___block_invoke(uint64_t a1)
{
  uint64_t result = C3DAnimationGetAnimationCallbacks(*(void *)(*(void *)(a1 + 32) + 8));
  *(void *)(result + 8) = SCNAnimationDidStop;
  return result;
}

- (NSArray)animationEvents
{
  return self->_animationEvents;
}

- (void)setAnimationEvents:(NSArray *)animationEvents
{
  uint64_t v3 = self->_animationEvents;
  if (v3 != animationEvents)
  {

    self->_animationEvents = animationEvents;
    [(SCNAnimation *)self _didMutate];
    if (self->_animationRef)
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __35__SCNAnimation_setAnimationEvents___block_invoke;
      v6[3] = &unk_264006160;
      v6[4] = self;
      void v6[5] = animationEvents;
      +[SCNTransaction postCommandWithContext:0 object:self applyBlock:v6];
    }
  }
}

CFTypeRef __35__SCNAnimation_setAnimationEvents___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  char v2 = _CAToC3DAnimationEvents(*(void **)(a1 + 40));

  return C3DAnimationSetAnimationEvents(v1, v2);
}

- (double)fadeInDuration
{
  return self->_fadeInDuration;
}

- (NSTimeInterval)blendInDuration
{
  return self->_fadeInDuration;
}

- (void)setBlendInDuration:(NSTimeInterval)blendInDuration
{
  if (self->_fadeInDuration != blendInDuration)
  {
    self->_fadeInDuration = blendInDuration;
    [(SCNAnimation *)self _didMutate];
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __35__SCNAnimation_setBlendInDuration___block_invoke;
      v5[3] = &unk_264004FC0;
      v5[4] = self;
      *(NSTimeInterval *)&void v5[5] = blendInDuration;
      +[SCNTransaction postCommandWithContext:0 object:self applyBlock:v5];
    }
  }
}

float __35__SCNAnimation_setBlendInDuration___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DAnimationSetFadeInDuration(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (double)fadeOutDuration
{
  return self->_fadeOutDuration;
}

- (NSTimeInterval)blendOutDuration
{
  return self->_fadeOutDuration;
}

- (void)setBlendOutDuration:(NSTimeInterval)blendOutDuration
{
  if (self->_fadeOutDuration != blendOutDuration)
  {
    self->_fadeOutDuration = blendOutDuration;
    [(SCNAnimation *)self _didMutate];
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __36__SCNAnimation_setBlendOutDuration___block_invoke;
      v5[3] = &unk_264004FC0;
      v5[4] = self;
      *(NSTimeInterval *)&void v5[5] = blendOutDuration;
      +[SCNTransaction postCommandWithContext:0 object:self applyBlock:v5];
    }
  }
}

float __36__SCNAnimation_setBlendOutDuration___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DAnimationSetFadeOutDuration(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (BOOL)isAdditive
{
  return self->_additive;
}

- (void)setAdditive:(BOOL)additive
{
  if (self->_additive != additive)
  {
    self->_additive = additive;
    [(SCNAnimation *)self _didMutate];
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __28__SCNAnimation_setAdditive___block_invoke;
      v5[3] = &unk_264004FE8;
      v5[4] = self;
      BOOL v6 = additive;
      +[SCNTransaction postCommandWithContext:0 object:self applyBlock:v5];
    }
  }
}

void __28__SCNAnimation_setAdditive___block_invoke(uint64_t a1)
{
  uint64_t TypeID = C3DAnimationClusterGetTypeID();
  if (TypeID == CFGetTypeID(*(CFTypeRef *)(*(void *)(a1 + 32) + 8)))
  {
    uint64_t v3 = scn_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __28__SCNAnimation_setAdditive___block_invoke_cold_1();
    }
  }
  C3DAnimationSetAdditive(*(void *)(*(void *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)isCumulative
{
  return self->_cumulative;
}

- (void)setCumulative:(BOOL)cumulative
{
  if (self->_cumulative != cumulative)
  {
    self->_cumulative = cumulative;
    [(SCNAnimation *)self _didMutate];
    if (self->_animationRef)
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __30__SCNAnimation_setCumulative___block_invoke;
      v5[3] = &unk_264004FE8;
      v5[4] = self;
      BOOL v6 = cumulative;
      +[SCNTransaction postCommandWithContext:0 object:self applyBlock:v5];
    }
  }
}

void __30__SCNAnimation_setCumulative___block_invoke(uint64_t a1)
{
  uint64_t TypeID = C3DAnimationClusterGetTypeID();
  if (TypeID == CFGetTypeID(*(CFTypeRef *)(*(void *)(a1 + 32) + 8)))
  {
    uint64_t v3 = scn_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __30__SCNAnimation_setCumulative___block_invoke_cold_1();
    }
  }
  C3DAnimationSetCumulative(*(void *)(*(void *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  p_userInfoLock = &self->_userInfoLock;
  os_unfair_lock_lock(&self->_userInfoLock);
  userInfo = self->_userInfo;
  if (a3 && !userInfo)
  {
    userInfo = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    self->_userInfo = userInfo;
LABEL_5:
    [(NSMutableDictionary *)userInfo setValue:a3 forKey:a4];
    goto LABEL_7;
  }
  if (a3) {
    goto LABEL_5;
  }
  [(NSMutableDictionary *)userInfo removeObjectForKey:a4];
LABEL_7:

  os_unfair_lock_unlock(p_userInfoLock);
}

- (id)valueForUndefinedKey:(id)a3
{
  p_userInfoLock = &self->_userInfoLock;
  os_unfair_lock_lock(&self->_userInfoLock);
  id v6 = (id)[(NSMutableDictionary *)self->_userInfo valueForKey:a3];
  os_unfair_lock_unlock(p_userInfoLock);

  return v6;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  float duration = self->_duration;
  float repeatCount = self->_repeatCount;
  return (NSString *)[v3 stringWithFormat:@"<%@: %p, keyPath=%@ duration=%f repeatCount=%f>", v5, self, self->_keyPath, duration, repeatCount];
}

- (void)_optimizeKeyframesWithTarget:(id)a3
{
  [(SCNAnimation *)self prepareWithTarget:a3 implicitDuration:0.0];
  animationRef = self->_animationRef;
  if (animationRef)
  {
    _optimizeKeyframes(animationRef);
    self->_BOOL didMutate = 1;

    self->_id userAnimation = 0;
  }
  else
  {
    id v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_20B249000, v5, OS_LOG_TYPE_DEFAULT, "Warning: failed to optimize keyframes", v6, 2u);
    }
  }
}

- (id)subAnimations
{
  animationRef = self->_animationRef;
  if (!animationRef) {
    return 0;
  }
  CFTypeID v4 = CFGetTypeID(animationRef);
  if (v4 == C3DAnimationGroupGetTypeID())
  {
    id v5 = (void *)CFRetain(self->_animationRef);
  }
  else
  {
    if (v4 != C3DAnimationClusterGetTypeID()) {
      return 0;
    }
    id v5 = C3DAnimationGroupCreateWithAnimationCluster((uint64_t)self->_animationRef);
  }
  id v6 = v5;
  if (!v5) {
    return 0;
  }
  CFIndex AnimationCount = C3DAnimationGroupGetAnimationCount((uint64_t)v5);
  id v8 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:AnimationCount];
  if (AnimationCount >= 1)
  {
    for (CFIndex i = 0; i != AnimationCount; ++i)
    {
      AnimationAtIndex = C3DAnimationGroupGetAnimationAtIndex((uint64_t)v6, i);
      Copy = C3DAnimationCreateCopy(AnimationAtIndex);
      objc_msgSend(v8, "addObject:", +[SCNAnimation animationWithC3DAnimation:](SCNAnimation, "animationWithC3DAnimation:", Copy));
      CFRelease(Copy);
    }
  }
  CFRelease(v6);
  return v8;
}

- (void)initWithCAAnimation:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodeWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: can't encode an animation that has never been attached to any target", v2, v3, v4, v5, v6);
}

- (void)encodeWithCoder:.cold.2()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Unreachable code: Unknown animation type %@", v2, v3, v4, v5, v6);
}

+ (void)animationWithContentsOfURL:(NSObject *)a3 .cold.1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*a2 description];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_20B249000, a3, OS_LOG_TYPE_ERROR, "Error: Loading animation %@ failed with %@", (uint8_t *)&v6, 0x16u);
}

- (void)prepareWithTarget:implicitDuration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: failed to convert CAAnimation to SCNAnimation", v2, v3, v4, v5, v6);
}

- (void)caAnimation
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: SCNAnimation to CAAnimation: no animation data", v2, v3, v4, v5, v6);
}

void __28__SCNAnimation_setAdditive___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: This animation can't be changed to additive. To make this animation additive first convert it to a CAAnimation, set it to additive and convert back to SCNAnimation", v2, v3, v4, v5, v6);
}

void __30__SCNAnimation_setCumulative___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: This animation can't be changed to cumulative. To make this animation cumulative first convert it to a CAAnimation, set it to cumulative and convert back to SCNAnimation", v2, v3, v4, v5, v6);
}

@end