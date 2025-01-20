@interface MFSimpleAnimationCoordinator
- (BOOL)isAnimated;
- (MFSimpleAnimationCoordinator)init;
- (NSMutableArray)animations;
- (NSMutableArray)completions;
- (id)initCoordinatorAnimated:(BOOL)a3;
- (void)animateAlongsideAnimations:(id)a3 completion:(id)a4;
- (void)playAnimations;
- (void)playCompletions:(BOOL)a3;
- (void)setAnimated:(BOOL)a3;
- (void)setAnimations:(id)a3;
- (void)setCompletions:(id)a3;
@end

@implementation MFSimpleAnimationCoordinator

- (id)initCoordinatorAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(MFSimpleAnimationCoordinator *)self init];
  v5 = v4;
  if (v4) {
    [(MFSimpleAnimationCoordinator *)v4 setAnimated:v3];
  }
  return v5;
}

- (MFSimpleAnimationCoordinator)init
{
  v6.receiver = self;
  v6.super_class = (Class)MFSimpleAnimationCoordinator;
  v2 = [(MFSimpleAnimationCoordinator *)&v6 init];
  if (v2)
  {
    BOOL v3 = [MEMORY[0x1E4F1CA48] array];
    [(MFSimpleAnimationCoordinator *)v2 setAnimations:v3];

    v4 = [MEMORY[0x1E4F1CA48] array];
    [(MFSimpleAnimationCoordinator *)v2 setCompletions:v4];
  }
  return v2;
}

- (void)animateAlongsideAnimations:(id)a3 completion:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (v13)
  {
    v7 = (void *)[v13 copy];
    v8 = [(MFSimpleAnimationCoordinator *)self animations];
    v9 = _Block_copy(v7);
    [v8 addObject:v9];
  }
  if (v6)
  {
    v10 = (void *)[v6 copy];
    v11 = [(MFSimpleAnimationCoordinator *)self completions];
    v12 = _Block_copy(v10);
    [v11 addObject:v12];
  }
}

- (void)playAnimations
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v2 = [(MFSimpleAnimationCoordinator *)self animations];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5++) + 16))();
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)playCompletions:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [(MFSimpleAnimationCoordinator *)self completions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (NSMutableArray)animations
{
  return self->_animations;
}

- (void)setAnimations:(id)a3
{
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (void)setCompletions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);

  objc_storeStrong((id *)&self->_animations, 0);
}

@end