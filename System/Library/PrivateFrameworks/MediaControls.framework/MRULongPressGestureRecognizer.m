@interface MRULongPressGestureRecognizer
- (NSMutableArray)cancellationHandlers;
- (void)addCancellationHandler:(id)a3;
- (void)setCancellationHandlers:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation MRULongPressGestureRecognizer

- (void)addCancellationHandler:(id)a3
{
  id v4 = a3;
  cancellationHandlers = self->_cancellationHandlers;
  aBlock = v4;
  if (!cancellationHandlers)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_cancellationHandlers;
    self->_cancellationHandlers = v6;

    id v4 = aBlock;
    cancellationHandlers = self->_cancellationHandlers;
  }
  v8 = _Block_copy(v4);
  [(NSMutableArray *)cancellationHandlers addObject:v8];
}

- (void)setState:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)MRULongPressGestureRecognizer;
  -[MRULongPressGestureRecognizer setState:](&v14, sel_setState_);
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v5 = self->_cancellationHandlers;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
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
          (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (NSMutableArray)cancellationHandlers
{
  return self->_cancellationHandlers;
}

- (void)setCancellationHandlers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end