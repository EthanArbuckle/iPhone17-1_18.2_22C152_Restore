@interface CEKAdditiveAnimator
- (BOOL)isAnimating;
- (BOOL)isAnimatingForKey:(id)a3;
- (CADisplayLink)_displayLink;
- (CEKAdditiveAnimator)init;
- (CEKAdditiveAnimatorDelegate)delegate;
- (NSMutableDictionary)_animations;
- (NSMutableDictionary)_values;
- (double)valueForKey:(id)a3;
- (void)_handleDisplayLinkFired:(id)a3;
- (void)_updateDisplayLink;
- (void)dealloc;
- (void)removeAnimationsForKey:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setValue:(double)a3 forKey:(id)a4;
- (void)setValue:(double)a3 forKey:(id)a4 duration:(double)a5 timingCurve:(id)a6;
- (void)set_displayLink:(id)a3;
@end

@implementation CEKAdditiveAnimator

- (BOOL)isAnimating
{
  v2 = [(CEKAdditiveAnimator *)self _animations];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSMutableDictionary)_animations
{
  return self->__animations;
}

- (void)setValue:(double)a3 forKey:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  id v9 = [v6 numberWithDouble:a3];
  v8 = [(CEKAdditiveAnimator *)self _values];
  [v8 setObject:v9 forKeyedSubscript:v7];
}

- (void)setValue:(double)a3 forKey:(id)a4 duration:(double)a5 timingCurve:(id)a6
{
  id v21 = a4;
  id v10 = a6;
  v11 = [(CEKAdditiveAnimator *)self _values];
  v12 = [v11 objectForKeyedSubscript:v21];

  if (a5 == 0.0 || !v12)
  {
    [(CEKAdditiveAnimator *)self setValue:v21 forKey:a3];
  }
  else
  {
    [v12 doubleValue];
    if (v13 != a3)
    {
      v14 = [(CEKAdditiveAnimator *)self _animations];
      v15 = [v14 objectForKeyedSubscript:v21];

      if (v15)
      {
        v16 = +[CAMAdditiveAnimation animationToValue:v15 fromAnimation:v10 duration:a3 curve:a5];
      }
      else
      {
        [(CEKAdditiveAnimator *)self valueForKey:v21];
        v16 = +[CAMAdditiveAnimation animationToValue:v10 fromValue:a3 duration:v17 curve:a5];
      }
      v18 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
      v19 = [(CEKAdditiveAnimator *)self _values];
      [v19 setObject:v18 forKeyedSubscript:v21];

      v20 = [(CEKAdditiveAnimator *)self _animations];
      [v20 setObject:v16 forKeyedSubscript:v21];

      [(CEKAdditiveAnimator *)self _updateDisplayLink];
    }
  }
}

- (NSMutableDictionary)_values
{
  return self->__values;
}

- (void)setDelegate:(id)a3
{
}

- (CEKAdditiveAnimator)init
{
  v8.receiver = self;
  v8.super_class = (Class)CEKAdditiveAnimator;
  v2 = [(CEKAdditiveAnimator *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    values = v2->__values;
    v2->__values = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    animations = v2->__animations;
    v2->__animations = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)dealloc
{
  [(CADisplayLink *)self->__displayLink invalidate];
  displayLink = self->__displayLink;
  self->__displayLink = 0;

  v4.receiver = self;
  v4.super_class = (Class)CEKAdditiveAnimator;
  [(CEKAdditiveAnimator *)&v4 dealloc];
}

- (BOOL)isAnimatingForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CEKAdditiveAnimator *)self _animations];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (double)valueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CEKAdditiveAnimator *)self _values];
  v6 = [v5 objectForKeyedSubscript:v4];

  [v6 doubleValue];
  double v8 = v7;
  if ([(CEKAdditiveAnimator *)self isAnimatingForKey:v4])
  {
    id v9 = [(CEKAdditiveAnimator *)self _animations];
    id v10 = [v9 objectForKeyedSubscript:v4];
    [v10 value];
    double v8 = v11;
  }
  return v8;
}

- (void)removeAnimationsForKey:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CEKAdditiveAnimator *)self _animations];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    double v7 = [(CEKAdditiveAnimator *)self _animations];
    [v7 setObject:0 forKeyedSubscript:v4];

    [(CEKAdditiveAnimator *)self _updateDisplayLink];
    double v8 = [(CEKAdditiveAnimator *)self delegate];
    v10[0] = v4;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v8 animator:self didUpdateValuesForKeys:v9];
  }
}

- (void)_updateDisplayLink
{
  BOOL v3 = [(CEKAdditiveAnimator *)self isAnimating];
  uint64_t v4 = [(CEKAdditiveAnimator *)self _displayLink];
  uint64_t v5 = (void *)v4;
  if (v3 && !v4)
  {
    objc_initWeak(&location, self);
    v6 = [CEKDisplayLinkTarget alloc];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    double v11 = __41__CEKAdditiveAnimator__updateDisplayLink__block_invoke;
    v12 = &unk_1E63CDB60;
    objc_copyWeak(&v13, &location);
    double v7 = [(CEKDisplayLinkTarget *)v6 initWithHandler:&v9];
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F39B68], "displayLinkWithTarget:selector:", v7, sel_displayLinkDidFire_, v9, v10, v11, v12);
    double v8 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v5 addToRunLoop:v8 forMode:*MEMORY[0x1E4F1C4B0]];

    [(CEKAdditiveAnimator *)self set_displayLink:v5];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  [v5 setPaused:!v3];
}

void __41__CEKAdditiveAnimator__updateDisplayLink__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleDisplayLinkFired:v3];
}

- (void)_handleDisplayLinkFired:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CEKAdditiveAnimator *)self _animations];
  [v4 targetTimestamp];
  double v7 = v6;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  double v8 = [v5 allValues];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * i) updateWithTimestamp:v7];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  id v13 = [v5 allKeys];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v21 + 1) + 8 * j);
        v19 = [v5 objectForKeyedSubscript:v18];
        if ([v19 isFinished]) {
          [v5 setObject:0 forKeyedSubscript:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v15);
  }
  [(CEKAdditiveAnimator *)self _updateDisplayLink];
  v20 = [(CEKAdditiveAnimator *)self delegate];
  [v20 animator:self didUpdateValuesForKeys:v13];
}

- (CEKAdditiveAnimatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CEKAdditiveAnimatorDelegate *)WeakRetained;
}

- (CADisplayLink)_displayLink
{
  return self->__displayLink;
}

- (void)set_displayLink:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__displayLink, 0);
  objc_storeStrong((id *)&self->__animations, 0);
  objc_storeStrong((id *)&self->__values, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end