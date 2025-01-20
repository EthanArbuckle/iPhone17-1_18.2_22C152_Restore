@interface QLPUAnimationGroup
+ (id)animationGroupWithAnimations:(id)a3;
+ (void)popAnimationGroup:(id)a3;
+ (void)pushAnimationGroup:(id)a3;
- (BOOL)isPaused;
- (BOOL)isReadyToComplete;
- (NSMutableArray)subAnimationGroups;
- (QLPUAnimationGroup)superAnimationGroup;
- (double)elapsedTime;
- (id)completionHandler;
- (id)description;
- (void)addSubAnimationGroup:(id)a3;
- (void)complete;
- (void)completeIfNeeded;
- (void)dealloc;
- (void)finishImmediately;
- (void)setCompletionHandler:(id)a3;
- (void)setElapsedTime:(double)a3;
- (void)setPaused:(BOOL)a3;
- (void)setSuperAnimationGroup:(id)a3;
@end

@implementation QLPUAnimationGroup

+ (id)animationGroupWithAnimations:(id)a3
{
  v3 = (void (**)(void))a3;
  v4 = objc_alloc_init(QLPUAnimationGroup);
  +[QLPUAnimationGroup pushAnimationGroup:v4];
  v3[2](v3);

  +[QLPUAnimationGroup popAnimationGroup:v4];

  return v4;
}

+ (void)pushAnimationGroup:(id)a3
{
  id v4 = a3;
  if (__rootAnimationGroup) {
    [(id)__currentAnimationGroup addSubAnimationGroup:v4];
  }
  else {
    objc_storeStrong((id *)&__rootAnimationGroup, a3);
  }
  v5 = (void *)__currentAnimationGroup;
  __currentAnimationGroup = (uint64_t)v4;
}

+ (void)popAnimationGroup:(id)a3
{
  id v6 = a3;
  uint64_t v3 = [v6 superAnimationGroup];
  id v4 = (void *)__currentAnimationGroup;
  __currentAnimationGroup = v3;

  v5 = v6;
  if ((id)__rootAnimationGroup == v6)
  {
    __rootAnimationGroup = 0;

    v5 = v6;
  }
}

- (void)dealloc
{
  uint64_t v3 = (void *)[(NSMutableArray *)self->_subAnimationGroups copy];
  if ([v3 count])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __29__QLPUAnimationGroup_dealloc__block_invoke;
    block[3] = &unk_2642F5430;
    id v6 = v3;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  v4.receiver = self;
  v4.super_class = (Class)QLPUAnimationGroup;
  [(QLPUAnimationGroup *)&v4 dealloc];
}

void __29__QLPUAnimationGroup_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        objc_msgSend(v6, "setSuperAnimationGroup:", 0, (void)v7);
        [v6 completeIfNeeded];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (double)elapsedTime
{
  uint64_t v2 = [(QLPUAnimationGroup *)self subAnimationGroups];
  uint64_t v3 = [v2 firstObject];

  if (v3)
  {
    [v3 elapsedTime];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (void)setElapsedTime:(double)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v4 = [(QLPUAnimationGroup *)self subAnimationGroups];
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
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setElapsedTime:a3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)setPaused:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_paused != a3)
  {
    BOOL v3 = a3;
    self->_paused = a3;
    if (a3) {
      [(QLPUAnimationGroup *)self pauseAnimations];
    }
    else {
      [(QLPUAnimationGroup *)self resumeAnimations];
    }
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v5 = [(QLPUAnimationGroup *)self subAnimationGroups];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setPaused:v3];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)addSubAnimationGroup:(id)a3
{
  id v8 = a3;
  double v4 = [(QLPUAnimationGroup *)self subAnimationGroups];

  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF980] array];
    subAnimationGroups = self->_subAnimationGroups;
    self->_subAnimationGroups = v5;
  }
  uint64_t v7 = [(QLPUAnimationGroup *)self subAnimationGroups];
  [v7 addObject:v8];

  [v8 setSuperAnimationGroup:self];
}

- (void)setSuperAnimationGroup:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_superAnimationGroup);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = objc_storeWeak((id *)&self->_superAnimationGroup, obj);

    uint64_t v5 = obj;
    if (!obj)
    {
      [(QLPUAnimationGroup *)self completeIfNeeded];
      uint64_t v5 = 0;
    }
  }
}

- (BOOL)isReadyToComplete
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v3 = [(QLPUAnimationGroup *)self isPaused];
  if (v3) {
    return 0;
  }
  BOOL v5 = v3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(QLPUAnimationGroup *)self subAnimationGroups];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v4 = !v5;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        if (![*(id *)(*((void *)&v12 + 1) + 8 * i) isReadyToComplete])
        {
          char v4 = 0;
          goto LABEL_14;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v4 = 1;
  }
LABEL_14:

  return v4;
}

- (void)completeIfNeeded
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v3 = [(QLPUAnimationGroup *)self superAnimationGroup];
  char v4 = v3;
  if (v3)
  {
    [v3 completeIfNeeded];
  }
  else if ([(QLPUAnimationGroup *)self isReadyToComplete])
  {
    [(QLPUAnimationGroup *)self complete];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    BOOL v5 = [(QLPUAnimationGroup *)self subAnimationGroups];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * i) complete];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)setCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __43__QLPUAnimationGroup_setCompletionHandler___block_invoke;
    v9[3] = &unk_2642F5EB8;
    v9[4] = self;
    id v10 = v4;
    uint64_t v6 = (void *)[v9 copy];
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = v6;

    id v8 = v10;
  }
  else
  {
    id v8 = self->_completionHandler;
    self->_id completionHandler = 0;
  }
}

uint64_t __43__QLPUAnimationGroup_setCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)complete
{
  BOOL v3 = [(QLPUAnimationGroup *)self completionHandler];
  if (v3)
  {
    [(QLPUAnimationGroup *)self setCompletionHandler:0];
    v3[2]();
  }
}

- (void)finishImmediately
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = [(QLPUAnimationGroup *)self subAnimationGroups];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) finishImmediately];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)description
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263F089D8];
  v26.receiver = self;
  v26.super_class = (Class)QLPUAnimationGroup;
  uint64_t v4 = [(QLPUAnimationGroup *)&v26 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@ {\n", v4];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(QLPUAnimationGroup *)self subAnimationGroups];
  uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        long long v10 = [*(id *)(*((void *)&v22 + 1) + 8 * i) description];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v11 = [v10 componentsSeparatedByString:@"\n"];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v27 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              [v5 appendFormat:@"  %@\n", *(void *)(*((void *)&v18 + 1) + 8 * j)];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v27 count:16];
          }
          while (v13);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v7);
  }

  [v5 appendString:@"}"];

  return v5;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (QLPUAnimationGroup)superAnimationGroup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_superAnimationGroup);

  return (QLPUAnimationGroup *)WeakRetained;
}

- (NSMutableArray)subAnimationGroups
{
  return self->_subAnimationGroups;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_subAnimationGroups, 0);

  objc_destroyWeak((id *)&self->_superAnimationGroup);
}

@end