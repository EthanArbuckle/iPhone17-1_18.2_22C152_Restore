@interface AVPlayerViewControllerAnimationCoordinator
- (AVPlayerViewControllerAnimationCoordinator)init;
- (NSMutableArray)animations;
- (NSMutableArray)completions;
- (void)addCoordinatedAnimations:(id)a3 completion:(id)a4;
- (void)didFinishAnimations:(BOOL)a3;
- (void)performCoordinatedAnimations;
@end

@implementation AVPlayerViewControllerAnimationCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);

  objc_storeStrong((id *)&self->_animations, 0);
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (NSMutableArray)animations
{
  return self->_animations;
}

- (void)didFinishAnimations:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = [(AVPlayerViewControllerAnimationCoordinator *)self completions];
  v5 = (void *)[v4 copy];

  completions = self->_completions;
  self->_completions = 0;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  v12 = [(AVPlayerViewControllerAnimationCoordinator *)self completions];
  [v12 removeAllObjects];
}

- (void)performCoordinatedAnimations
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(AVPlayerViewControllerAnimationCoordinator *)self animations];
  v4 = (void *)[v3 copy];

  animations = self->_animations;
  self->_animations = 0;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  uint64_t v11 = [(AVPlayerViewControllerAnimationCoordinator *)self animations];
  [v11 removeAllObjects];
}

- (void)addCoordinatedAnimations:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [(AVPlayerViewControllerAnimationCoordinator *)self animations];

  if (v7)
  {
    if (v12)
    {
      uint64_t v8 = [(AVPlayerViewControllerAnimationCoordinator *)self animations];
      uint64_t v9 = (void *)[v12 copy];
      [v8 addObject:v9];
    }
    if (v6)
    {
      uint64_t v10 = [(AVPlayerViewControllerAnimationCoordinator *)self completions];
      uint64_t v11 = (void *)[v6 copy];
      [v10 addObject:v11];
    }
  }
  else
  {
    NSLog(&cfstr_Avplayerviewco_76.isa);
  }
}

- (AVPlayerViewControllerAnimationCoordinator)init
{
  v8.receiver = self;
  v8.super_class = (Class)AVPlayerViewControllerAnimationCoordinator;
  v2 = [(AVPlayerViewControllerAnimationCoordinator *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    animations = v2->_animations;
    v2->_animations = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    completions = v2->_completions;
    v2->_completions = (NSMutableArray *)v5;
  }
  return v2;
}

@end