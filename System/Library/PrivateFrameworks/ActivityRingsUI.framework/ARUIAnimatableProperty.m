@interface ARUIAnimatableProperty
- (ARUIAnimatableProperty)initWithGetter:(id)a3 setter:(id)a4;
- (BOOL)isFinishedAnimating;
- (id)currentValue;
- (id)endValue;
- (id)startValue;
- (void)addPropertyAnimation:(id)a3;
- (void)removeAllPropertyAnimations;
- (void)setCurrentValue:(id)a3;
- (void)setEndValue:(id)a3;
- (void)setStartValue:(id)a3;
- (void)setValueImmediate:(id)a3;
- (void)update:(double)a3;
@end

@implementation ARUIAnimatableProperty

- (ARUIAnimatableProperty)initWithGetter:(id)a3 setter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ARUIAnimatableProperty;
  v8 = [(ARUIAnimatableProperty *)&v14 init];
  if (v8)
  {
    uint64_t v9 = MEMORY[0x223C21650](v6);
    id getter = v8->_getter;
    v8->_id getter = (id)v9;

    uint64_t v11 = MEMORY[0x223C21650](v7);
    id setter = v8->_setter;
    v8->_id setter = (id)v11;
  }
  return v8;
}

- (void)setValueImmediate:(id)a3
{
  id v4 = a3;
  [(ARUIAnimatableProperty *)self removeAllPropertyAnimations];
  (*((void (**)(void))self->_setter + 2))();
}

- (void)addPropertyAnimation:(id)a3
{
  id v4 = a3;
  animations = self->_animations;
  id v8 = v4;
  if (!animations)
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    id v7 = self->_animations;
    self->_animations = v6;

    id v4 = v8;
    animations = self->_animations;
  }
  [(NSMutableArray *)animations addObject:v4];
}

- (void)removeAllPropertyAnimations
{
  [(NSMutableArray *)self->_animations removeAllObjects];
  id startValue = self->_startValue;
  self->_id startValue = 0;

  id endValue = self->_endValue;
  self->_id endValue = 0;

  id currentValue = self->_currentValue;
  self->_id currentValue = 0;
}

- (void)update:(double)a3
{
  id v4 = self;
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (![(NSMutableArray *)self->_animations count]) {
    return;
  }
  v5 = [(NSMutableArray *)v4->_animations firstObject];
  id v6 = [v5 _startValue];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = v4->_animations;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    v26 = v4;
    v27 = v5;
    id v10 = 0;
    uint64_t v11 = *(void *)v33;
    int v12 = 1;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        objc_super v14 = v6;
        if (*(void *)v33 != v11) {
          objc_enumerationMutation(v7);
        }
        v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        char v16 = objc_msgSend(v15, "isFinishedAnimating", v26, v27);
        [v15 update:a3];
        id v6 = [v15 valueByAddingCurrentValueToValue:v6];

        int v17 = [v15 isFinishedAnimating];
        int v18 = v17;
        if ((v16 & 1) == 0 && v17)
        {
          if (!v10) {
            id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
          }
          [v10 addObject:v15];
        }
        v12 &= v18;
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v9);

    if (!v12)
    {
      id v20 = v6;
      id v4 = v26;
      v5 = v27;
      id currentValue = v26->_currentValue;
      v26->_id currentValue = v20;
      goto LABEL_19;
    }
    id v4 = v26;
    v5 = v27;
  }
  else
  {

    id v10 = 0;
  }
  id currentValue = [(NSMutableArray *)v4->_animations lastObject];
  id v20 = [currentValue _endValue];

  [(ARUIAnimatableProperty *)v4 removeAllPropertyAnimations];
LABEL_19:

  (*((void (**)(void))v4->_setter + 2))();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v21 = v10;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(v21);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * j) callAndReleaseCompletionHandler];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v23);
  }
}

- (BOOL)isFinishedAnimating
{
  return [(NSMutableArray *)self->_animations count] == 0;
}

- (id)startValue
{
  v3 = [(NSMutableArray *)self->_animations lastObject];
  id v4 = [v3 _startValue];
  if (!v4)
  {
    id v4 = [(ARUIAnimatableProperty *)self currentValue];
  }

  return v4;
}

- (id)endValue
{
  v3 = [(NSMutableArray *)self->_animations lastObject];
  id v4 = [v3 _endValue];
  if (!v4)
  {
    id v4 = [(ARUIAnimatableProperty *)self currentValue];
  }

  return v4;
}

- (id)currentValue
{
  id currentValue = self->_currentValue;
  if (!currentValue)
  {
    id v4 = (*((void (**)(void))self->_getter + 2))();
    id v5 = self->_currentValue;
    self->_id currentValue = v4;

    id currentValue = self->_currentValue;
  }

  return currentValue;
}

- (void)setStartValue:(id)a3
{
}

- (void)setEndValue:(id)a3
{
}

- (void)setCurrentValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_endValue, 0);
  objc_storeStrong(&self->_startValue, 0);
  objc_storeStrong(&self->_currentValue, 0);
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong(&self->_setter, 0);

  objc_storeStrong(&self->_getter, 0);
}

@end