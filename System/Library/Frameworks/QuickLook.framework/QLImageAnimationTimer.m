@interface QLImageAnimationTimer
+ (id)sharedTimer;
- (CADisplayLink)displayLink;
- (NSMutableSet)observers;
- (QLImageAnimationTimer)init;
- (void)addAnimationTimerObserver:(id)a3;
- (void)animationTimerFired:(id)a3;
- (void)removeAnimationTimerObserver:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation QLImageAnimationTimer

- (QLImageAnimationTimer)init
{
  v5.receiver = self;
  v5.super_class = (Class)QLImageAnimationTimer;
  v2 = [(QLImageAnimationTimer *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(QLImageAnimationTimer *)v2 setObservers:v3];
  }
  return v2;
}

+ (id)sharedTimer
{
  if (sharedTimer_once[0] != -1) {
    dispatch_once(sharedTimer_once, &__block_literal_global_20);
  }
  v2 = (void *)sharedTimer_sAnimatedImageTimer;

  return v2;
}

uint64_t __36__QLImageAnimationTimer_sharedTimer__block_invoke()
{
  v0 = objc_alloc_init(QLImageAnimationTimer);
  uint64_t v1 = sharedTimer_sAnimatedImageTimer;
  sharedTimer_sAnimatedImageTimer = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (void)addAnimationTimerObserver:(id)a3
{
  id v9 = a3;
  v4 = [(QLImageAnimationTimer *)self observers];
  char v5 = [v4 containsObject:v9];

  if ((v5 & 1) == 0)
  {
    v6 = [(QLImageAnimationTimer *)self observers];
    if (![v6 count])
    {
      v7 = [MEMORY[0x263F15780] displayLinkWithTarget:self selector:sel_animationTimerFired_];
      v8 = [MEMORY[0x263EFF9F0] mainRunLoop];
      [v7 addToRunLoop:v8 forMode:*MEMORY[0x263EFF588]];

      [(QLImageAnimationTimer *)self setDisplayLink:v7];
    }
    [v6 addObject:v9];
  }
}

- (void)removeAnimationTimerObserver:(id)a3
{
  id v4 = a3;
  id v6 = [(QLImageAnimationTimer *)self observers];
  [v6 removeObject:v4];

  if (![v6 count])
  {
    char v5 = [(QLImageAnimationTimer *)self displayLink];
    [v5 invalidate];
  }
}

- (void)animationTimerFired:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v5 = [(QLImageAnimationTimer *)self observers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        [v4 timestamp];
        objc_msgSend(v10, "animationTimerFired:");
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
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

- (void)setDisplayLink:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end