@interface CKImageAnimationTimer
+ (BOOL)accessibilityAnimatedImagesDisabled;
+ (id)sharedTimer;
- (BOOL)hasValidStartTimeForCurrentDisplayLink;
- (BOOL)shouldStartDisplayLink;
- (BOOL)shouldStopWhenBackgrounded;
- (CADisplayLink)displayLink;
- (CKImageAnimationTimer)init;
- (NSMutableSet)observers;
- (double)animationStartTime;
- (double)animationTime;
- (void)addAnimationTimerObserver:(id)a3;
- (void)animationTimerFired;
- (void)dealloc;
- (void)removeAnimationTimerObserver:(id)a3;
- (void)setAnimationStartTime:(double)a3;
- (void)setDisplayLink:(id)a3;
- (void)setHasValidStartTimeForCurrentDisplayLink:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setShouldStopWhenBackgrounded:(BOOL)a3;
- (void)startDisplayLinkIfNeeded;
- (void)stopDisplayLink;
- (void)updateDisplayLink;
@end

@implementation CKImageAnimationTimer

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(CADisplayLink *)self->_displayLink invalidate];
  v4.receiver = self;
  v4.super_class = (Class)CKImageAnimationTimer;
  [(CKImageAnimationTimer *)&v4 dealloc];
}

- (CKImageAnimationTimer)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKImageAnimationTimer;
  v2 = [(CKImageAnimationTimer *)&v8 init];
  if (v2)
  {
    long long v3 = *(_OWORD *)(MEMORY[0x1E4F1D548] + 16);
    *(_OWORD *)&v7.version = *MEMORY[0x1E4F1D548];
    *(_OWORD *)&v7.release = v3;
    *(_OWORD *)&v7.equal = *(_OWORD *)(MEMORY[0x1E4F1D548] + 32);
    v7.retain = 0;
    v7.release = 0;
    CFMutableSetRef v4 = CFSetCreateMutable(0, 0, &v7);
    [(CKImageAnimationTimer *)v2 setObservers:v4];
    [(CKImageAnimationTimer *)v2 setShouldStopWhenBackgrounded:1];
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel_updateDisplayLink name:*MEMORY[0x1E4F43648] object:0];
    [v5 addObserver:v2 selector:sel_updateDisplayLink name:*MEMORY[0x1E4F43660] object:0];
  }
  return v2;
}

+ (id)sharedTimer
{
  if (sharedTimer_once != -1) {
    dispatch_once(&sharedTimer_once, &__block_literal_global_214);
  }
  v2 = (void *)sharedTimer_sAnimatedImageTimer;

  return v2;
}

void __36__CKImageAnimationTimer_sharedTimer__block_invoke()
{
  v0 = objc_alloc_init(CKImageAnimationTimer);
  v1 = (void *)sharedTimer_sAnimatedImageTimer;
  sharedTimer_sAnimatedImageTimer = (uint64_t)v0;
}

- (void)setDisplayLink:(id)a3
{
  v5 = (CADisplayLink *)a3;
  if (self->_displayLink != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_displayLink, a3);
    [(CKImageAnimationTimer *)self setHasValidStartTimeForCurrentDisplayLink:0];
    v5 = v6;
  }
}

- (void)addAnimationTimerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CKImageAnimationTimer *)self observers];
  [v5 addObject:v4];

  [(CKImageAnimationTimer *)self updateDisplayLink];
}

- (void)removeAnimationTimerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CKImageAnimationTimer *)self observers];
  [v5 removeObject:v4];

  [(CKImageAnimationTimer *)self updateDisplayLink];
}

+ (BOOL)accessibilityAnimatedImagesDisabled
{
  return _AXSReduceMotionAutoplayAnimatedImagesEnabled() == 0;
}

- (void)animationTimerFired
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(CKImageAnimationTimer *)self shouldStartDisplayLink])
  {
    if (!self->_hasValidStartTimeForCurrentDisplayLink)
    {
      long long v3 = [(CKImageAnimationTimer *)self displayLink];
      [v3 targetTimestamp];
      self->_animationStartTime = v4;

      self->_hasValidStartTimeForCurrentDisplayLink = 1;
    }
    [(CADisplayLink *)self->_displayLink targetTimestamp];
    self->_animationTime = v5 - self->_animationStartTime;
    v6 = [(CKImageAnimationTimer *)self observers];
    CFSetCallBacks v7 = (void *)[v6 copy];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (!+[CKImageAnimationTimer accessibilityAnimatedImagesDisabled](CKImageAnimationTimer, "accessibilityAnimatedImagesDisabled", (void)v14)|| [v13 animationExplicitlyResumed])
          {
            [v13 animationTimerFired:self->_animationTime];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
  else
  {
    [(CKImageAnimationTimer *)self stopDisplayLink];
  }
}

- (BOOL)shouldStartDisplayLink
{
  uint64_t v3 = [(CKImageAnimationTimer *)self observers];
  uint64_t v4 = [(id)v3 count];

  LODWORD(v3) = +[CKApplicationState isApplicationActive];
  int v5 = v3 | ![(CKImageAnimationTimer *)self shouldStopWhenBackgrounded];
  if (v4) {
    return v5;
  }
  else {
    return 0;
  }
}

- (void)startDisplayLinkIfNeeded
{
  uint64_t v3 = [(CKImageAnimationTimer *)self displayLink];
  if (!v3)
  {
    id v5 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel_animationTimerFired];
    [v5 setPreferredFramesPerSecond:60];
    uint64_t v4 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v5 addToRunLoop:v4 forMode:*MEMORY[0x1E4F1C4B0]];

    [(CKImageAnimationTimer *)self setDisplayLink:v5];
    uint64_t v3 = v5;
  }
}

- (void)stopDisplayLink
{
  uint64_t v3 = [(CKImageAnimationTimer *)self displayLink];
  [v3 invalidate];

  [(CKImageAnimationTimer *)self setDisplayLink:0];
}

- (void)updateDisplayLink
{
  if ([(CKImageAnimationTimer *)self shouldStartDisplayLink])
  {
    [(CKImageAnimationTimer *)self startDisplayLinkIfNeeded];
  }
  else
  {
    [(CKImageAnimationTimer *)self stopDisplayLink];
  }
}

- (void)setShouldStopWhenBackgrounded:(BOOL)a3
{
  if (self->_shouldStopWhenBackgrounded != a3)
  {
    self->_shouldStopWhenBackgrounded = a3;
    [(CKImageAnimationTimer *)self updateDisplayLink];
  }
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (double)animationTime
{
  return self->_animationTime;
}

- (BOOL)shouldStopWhenBackgrounded
{
  return self->_shouldStopWhenBackgrounded;
}

- (double)animationStartTime
{
  return self->_animationStartTime;
}

- (void)setAnimationStartTime:(double)a3
{
  self->_animationStartTime = a3;
}

- (BOOL)hasValidStartTimeForCurrentDisplayLink
{
  return self->_hasValidStartTimeForCurrentDisplayLink;
}

- (void)setHasValidStartTimeForCurrentDisplayLink:(BOOL)a3
{
  self->_hasValidStartTimeForCurrentDisplayLink = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end