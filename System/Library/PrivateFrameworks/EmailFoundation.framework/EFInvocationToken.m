@interface EFInvocationToken
+ (id)_descriptionString;
+ (id)tokenWithInvocationBlock:(id)a3;
+ (id)tokenWithLabel:(id)a3 invocationBlock:(id)a4;
- (BOOL)isInvoked;
- (EFInvocationToken)init;
- (EFInvocationToken)initWithInvocationBlock:(id)a3;
- (EFInvocationToken)initWithLabel:(id)a3;
- (NSString)description;
- (NSString)label;
- (id)_nts_consumeBlocks;
- (void)addInvocable:(id)a3;
- (void)addInvocationBlock:(id)a3;
- (void)invoke;
- (void)removeAllInvocationBlocks;
@end

@implementation EFInvocationToken

- (void)addInvocationBlock:(id)a3
{
  aBlock = (void (**)(void))a3;
  if (!aBlock)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"EFInvocationToken.m", 105, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  [(NSLock *)self->_lock lock];
  BOOL isInvoked = self->_isInvoked;
  if (!self->_isInvoked)
  {
    blocks = self->_blocks;
    v7 = _Block_copy(aBlock);
    [(NSMutableArray *)blocks addObject:v7];
  }
  [(NSLock *)self->_lock unlock];
  if (isInvoked) {
    aBlock[2]();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_blocks, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (NSString)description
{
  v3 = [(EFInvocationToken *)self label];

  if (v3)
  {
    id v4 = [NSString alloc];
    v5 = [(EFInvocationToken *)self label];
    v6 = (__CFString *)[v4 initWithFormat:@" (%@)", v5];
  }
  else
  {
    v6 = &stru_1F0EAE5A8;
  }
  [(NSLock *)self->_lock lock];
  BOOL isInvoked = self->_isInvoked;
  uint64_t v8 = [(NSMutableArray *)self->_blocks count];
  [(NSLock *)self->_lock unlock];
  v9 = NSString;
  uint64_t v10 = objc_opt_class();
  if (isInvoked) {
    v11 = &stru_1F0EAE5A8;
  }
  else {
    v11 = @"not ";
  }
  v12 = [(id)objc_opt_class() _descriptionString];
  v13 = [v9 stringWithFormat:@"<%@: %p%@> %@%@ - %lu blocks", v10, self, v6, v11, v12, v8];

  return (NSString *)v13;
}

- (NSString)label
{
  return self->_label;
}

+ (id)_descriptionString
{
  return @"invoked";
}

- (EFInvocationToken)initWithLabel:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EFInvocationToken;
  v5 = [(EFInvocationToken *)&v13 init];
  if (v5)
  {
    v6 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v5->_lock;
    v5->_lock = v6;

    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    blocks = v5->_blocks;
    v5->_blocks = v8;

    uint64_t v10 = [v4 copy];
    label = v5->_label;
    v5->_label = (NSString *)v10;
  }
  return v5;
}

- (EFInvocationToken)init
{
  return [(EFInvocationToken *)self initWithLabel:0];
}

- (void)invoke
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  [(NSLock *)self->_lock lock];
  id v4 = [(EFInvocationToken *)self _nts_consumeBlocks];
  self->_BOOL isInvoked = 1;
  [(NSLock *)*p_lock unlock];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)_nts_consumeBlocks
{
  if (self->_isInvoked)
  {
    v2 = (NSMutableArray *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v2 = self->_blocks;
    blocks = self->_blocks;
    self->_blocks = 0;
  }
  return v2;
}

- (BOOL)isInvoked
{
  [(NSLock *)self->_lock lock];
  BOOL isInvoked = self->_isInvoked;
  [(NSLock *)self->_lock unlock];
  return isInvoked;
}

+ (id)tokenWithLabel:(id)a3 invocationBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[objc_alloc((Class)a1) initWithLabel:v6];
  [v8 addInvocationBlock:v7];

  return v8;
}

+ (id)tokenWithInvocationBlock:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithInvocationBlock:v4];

  return v5;
}

- (EFInvocationToken)initWithInvocationBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(EFInvocationToken *)self initWithLabel:0];
  id v6 = v5;
  if (v5) {
    [(EFInvocationToken *)v5 addInvocationBlock:v4];
  }

  return v6;
}

- (void)removeAllInvocationBlocks
{
  [(NSLock *)self->_lock lock];
  if (!self->_isInvoked) {
    [(NSMutableArray *)self->_blocks removeAllObjects];
  }
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)addInvocable:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__EFInvocationToken_addInvocable___block_invoke;
  v6[3] = &unk_1E6121B40;
  id v7 = v4;
  id v5 = v4;
  [(EFInvocationToken *)self addInvocationBlock:v6];
}

uint64_t __34__EFInvocationToken_addInvocable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invoke];
}

@end