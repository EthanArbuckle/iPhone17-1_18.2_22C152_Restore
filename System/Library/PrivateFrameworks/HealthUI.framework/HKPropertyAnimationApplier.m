@interface HKPropertyAnimationApplier
- (HKPropertyAnimationApplier)init;
- (void)_applyAnimations;
- (void)_cleanupCompletedAnimations;
- (void)_displayLinkFired:(id)a3;
- (void)_startDisplayLinkIfNecessary;
- (void)_stopDisplayLinkIfNecessary;
- (void)applyAnimation:(id)a3;
- (void)cancelAnimationsForProperty:(id)a3;
@end

@implementation HKPropertyAnimationApplier

- (HKPropertyAnimationApplier)init
{
  v6.receiver = self;
  v6.super_class = (Class)HKPropertyAnimationApplier;
  v2 = [(HKPropertyAnimationApplier *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    animations = v2->_animations;
    v2->_animations = v3;
  }
  return v2;
}

- (void)applyAnimation:(id)a3
{
  id v4 = a3;
  [v4 _validate];
  id v8 = (id)[v4 copy];

  v5 = [MEMORY[0x1E4F1C9C8] date];
  [v8 setAppliedDate:v5];

  animations = self->_animations;
  v7 = [v8 property];
  [(NSMutableDictionary *)animations setObject:v8 forKeyedSubscript:v7];

  [(HKPropertyAnimationApplier *)self _startDisplayLinkIfNecessary];
}

- (void)cancelAnimationsForProperty:(id)a3
{
  animations = self->_animations;
  id v5 = a3;
  id v6 = [(NSMutableDictionary *)animations objectForKey:v5];
  [v6 _finishCancelled:1];
  [(NSMutableDictionary *)self->_animations removeObjectForKey:v5];

  [(HKPropertyAnimationApplier *)self _stopDisplayLinkIfNecessary];
}

- (void)_startDisplayLinkIfNecessary
{
  if (!self->_displayLink)
  {
    v3 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__displayLinkFired_];
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    id v5 = self->_displayLink;
    id v6 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v5 addToRunLoop:v6 forMode:*MEMORY[0x1E4F1C4B0]];
  }
}

- (void)_stopDisplayLinkIfNecessary
{
  if (![(NSMutableDictionary *)self->_animations count])
  {
    [(CADisplayLink *)self->_displayLink invalidate];
    displayLink = self->_displayLink;
    self->_displayLink = 0;
  }
}

- (void)_displayLinkFired:(id)a3
{
  [(HKPropertyAnimationApplier *)self _applyAnimations];
  [(HKPropertyAnimationApplier *)self _cleanupCompletedAnimations];
  [(HKPropertyAnimationApplier *)self _stopDisplayLinkIfNecessary];
}

- (void)_applyAnimations
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1C9C8] date];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(NSMutableDictionary *)self->_animations allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) _applyWithCurrentDate:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_cleanupCompletedAnimations
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(NSMutableDictionary *)self->_animations allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v8 _isCompleted])
        {
          long long v9 = [MEMORY[0x1E4F1C9C8] date];
          [v8 _applyWithCurrentDate:v9];

          [v8 _finishCancelled:0];
          animations = self->_animations;
          long long v11 = [v8 property];
          [(NSMutableDictionary *)animations removeObjectForKey:v11];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_animations, 0);
}

@end