@interface CAMCompositeSpring
- (NSArray)addedSprings;
- (void)setAddedSprings:(id)a3;
- (void)updateForTimestamp:(double)a3;
@end

@implementation CAMCompositeSpring

- (void)updateForTimestamp:(double)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [(CAMSpring *)self _currentForce];
  double v6 = v5;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v7 = [(CAMCompositeSpring *)self addedSprings];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        [(CAMSpring *)self _current];
        objc_msgSend(v12, "_setCurrent:");
        [(CAMSpring *)self velocity];
        objc_msgSend(v12, "setVelocity:");
        [v12 _currentForce];
        double v6 = v6 + v13;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  [(CAMSpring *)self _updateWithForce:v6 timestamp:a3];
}

- (NSArray)addedSprings
{
  return self->_addedSprings;
}

- (void)setAddedSprings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end