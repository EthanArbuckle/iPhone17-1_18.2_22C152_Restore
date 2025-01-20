@interface ARUIRingGroupGlobalAnimationSequencer
+ (id)sharedInstance;
- (BOOL)_needsDisplayLink;
- (id)_init;
- (void)_displayLinkFired:(id)a3;
- (void)_updateDisplayLink;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation ARUIRingGroupGlobalAnimationSequencer

- (void)_displayLinkFired:(id)a3
{
  [a3 timestamp];
  double v5 = v4 - self->_lastUpdateTime;
  self->_lastUpdateTime = v4;
  observers = self->_observers;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__ARUIRingGroupGlobalAnimationSequencer__displayLinkFired___block_invoke;
  v7[3] = &unk_2644990A8;
  v7[4] = self;
  *(double *)&v7[5] = v5;
  [(ARUIObserverStore *)observers enumerateObserversWithBlock:v7];
  [(ARUIRingGroupGlobalAnimationSequencer *)self _updateDisplayLink];
}

- (void)_updateDisplayLink
{
  BOOL v3 = [(ARUIRingGroupGlobalAnimationSequencer *)self _needsDisplayLink];
  displayLink = self->_displayLink;
  if (v3)
  {
    if (!displayLink)
    {
      double v5 = [MEMORY[0x263F15780] displayLinkWithTarget:self selector:sel__displayLinkFired_];
      v6 = self->_displayLink;
      self->_displayLink = v5;

      v7 = self->_displayLink;
      id v9 = [MEMORY[0x263EFF9F0] mainRunLoop];
      [(CADisplayLink *)v7 addToRunLoop:v9 forMode:*MEMORY[0x263EFF588]];
    }
  }
  else if (displayLink)
  {
    [(CADisplayLink *)displayLink invalidate];
    v8 = self->_displayLink;
    self->_displayLink = 0;

    self->_lastUpdateTime = NAN;
  }
}

- (BOOL)_needsDisplayLink
{
  return [(ARUIObserverStore *)self->_observers count] != 0;
}

uint64_t __59__ARUIRingGroupGlobalAnimationSequencer__displayLinkFired___block_invoke(uint64_t a1, void *a2)
{
  return [a2 animationSequencer:*(void *)(a1 + 32) updatedWithTime:*(double *)(a1 + 40)];
}

- (void)addObserver:(id)a3
{
  [(ARUIObserverStore *)self->_observers addObserver:a3];

  [(ARUIRingGroupGlobalAnimationSequencer *)self _updateDisplayLink];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_6);
  }
  v2 = (void *)sharedInstance___sharedInstance;

  return v2;
}

uint64_t __55__ARUIRingGroupGlobalAnimationSequencer_sharedInstance__block_invoke()
{
  id v0 = [[ARUIRingGroupGlobalAnimationSequencer alloc] _init];
  uint64_t v1 = sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)ARUIRingGroupGlobalAnimationSequencer;
  v2 = [(ARUIRingGroupGlobalAnimationSequencer *)&v6 init];
  if (v2)
  {
    BOOL v3 = objc_alloc_init(ARUIObserverStore);
    observers = v2->_observers;
    v2->_observers = v3;

    v2->_lastUpdateTime = NAN;
  }
  return v2;
}

- (void)removeObserver:(id)a3
{
  [(ARUIObserverStore *)self->_observers removeObserver:a3];

  [(ARUIRingGroupGlobalAnimationSequencer *)self _updateDisplayLink];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end