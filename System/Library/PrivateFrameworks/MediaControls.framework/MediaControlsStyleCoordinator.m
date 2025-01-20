@interface MediaControlsStyleCoordinator
- (void)animateAlongsideTransition:(id)a3 completion:(id)a4;
- (void)performAnimations;
- (void)performCompletions;
@end

@implementation MediaControlsStyleCoordinator

- (void)animateAlongsideTransition:(id)a3 completion:(id)a4
{
  id aBlock = a3;
  id v6 = a4;
  if (aBlock)
  {
    animations = self->_animations;
    if (animations)
    {
      v8 = _Block_copy(aBlock);
      [(NSMutableArray *)animations addObject:v8];
    }
    else
    {
      v9 = (void *)MEMORY[0x1E4F1CA48];
      v8 = _Block_copy(aBlock);
      v10 = [v9 arrayWithObject:v8];
      v11 = self->_animations;
      self->_animations = v10;
    }
  }
  if (v6)
  {
    completions = self->_completions;
    if (completions)
    {
      v13 = _Block_copy(v6);
      [(NSMutableArray *)completions addObject:v13];
    }
    else
    {
      v14 = (void *)MEMORY[0x1E4F1CA48];
      v13 = _Block_copy(v6);
      v15 = [v14 arrayWithObject:v13];
      v16 = self->_completions;
      self->_completions = v15;
    }
  }
}

- (void)performAnimations
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = (void *)[(NSMutableArray *)self->_animations copy];
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
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)performCompletions
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = (void *)[(NSMutableArray *)self->_completions copy];
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
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);

  objc_storeStrong((id *)&self->_animations, 0);
}

@end