@interface MFSpringAnimationDelegate
- (MFSpringAnimationDelegate)init;
- (NSMutableArray)completionBlocks;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
@end

@implementation MFSpringAnimationDelegate

- (MFSpringAnimationDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)MFSpringAnimationDelegate;
  v2 = [(MFSpringAnimationDelegate *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = v3;
  }
  return v2;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_completionBlocks;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)self->_completionBlocks removeAllObjects];
}

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (void).cxx_destruct
{
}

@end