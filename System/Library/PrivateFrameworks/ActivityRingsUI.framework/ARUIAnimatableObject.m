@interface ARUIAnimatableObject
- (BOOL)areAnimationsInProgress;
- (id)_animatablePropertyForType:(unint64_t)a3;
- (id)_newAnimatablePropertyForType:(unint64_t)a3;
- (id)endingValueForPropertyType:(unint64_t)a3;
- (void)addAnimation:(id)a3 forPropertyType:(unint64_t)a4;
- (void)removeAllAnimationsForPropertyType:(unint64_t)a3;
- (void)setValue:(id)a3 forPropertyType:(unint64_t)a4;
- (void)update:(double)a3;
@end

@implementation ARUIAnimatableObject

- (void)update:(double)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = [(NSMutableDictionary *)self->_animatableProperties allValues];
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
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) update:a3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)setValue:(id)a3 forPropertyType:(unint64_t)a4
{
  id v6 = a3;
  [(ARUIAnimatableObject *)self removeAllAnimationsForPropertyType:a4];
  id v7 = [(ARUIAnimatableObject *)self _animatablePropertyForType:a4];
  [v7 setValueImmediate:v6];
}

- (void)addAnimation:(id)a3 forPropertyType:(unint64_t)a4
{
  id v11 = a3;
  if (!self->_animatableProperties)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    animatableProperties = self->_animatableProperties;
    self->_animatableProperties = v6;
  }
  uint64_t v8 = [(ARUIAnimatableObject *)self _animatablePropertyForType:a4];
  long long v9 = [v8 endValue];
  long long v10 = [v8 currentValue];
  [v11 _setStartValue:v9];
  [v11 _setCurrentValue:v10];
  [v8 addPropertyAnimation:v11];
}

- (void)removeAllAnimationsForPropertyType:(unint64_t)a3
{
  id v3 = [(ARUIAnimatableObject *)self _animatablePropertyForType:a3];
  [v3 removeAllPropertyAnimations];
}

- (BOOL)areAnimationsInProgress
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMutableDictionary *)self->_animatableProperties allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v7 + 1) + 8 * i) isFinishedAnimating])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_animatablePropertyForType:(unint64_t)a3
{
  animatableProperties = self->_animatableProperties;
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v7 = [(NSMutableDictionary *)animatableProperties objectForKeyedSubscript:v6];

  if (!v7)
  {
    id v7 = [(ARUIAnimatableObject *)self _newAnimatablePropertyForType:a3];
    long long v8 = self->_animatableProperties;
    long long v9 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v8 setObject:v7 forKeyedSubscript:v9];
  }

  return v7;
}

- (id)endingValueForPropertyType:(unint64_t)a3
{
  uint64_t v3 = [(ARUIAnimatableObject *)self _animatablePropertyForType:a3];
  uint64_t v4 = [v3 endValue];

  return v4;
}

- (void).cxx_destruct
{
}

- (id)_newAnimatablePropertyForType:(unint64_t)a3
{
  return 0;
}

@end