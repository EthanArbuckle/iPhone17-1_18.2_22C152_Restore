@interface AFMultiArgumentSafetyBlock
- (AFMultiArgumentSafetyBlock)initWithBlock:(id)a3;
- (AFMultiArgumentSafetyBlock)initWithBlock:(id)a3 defaultValueArray:(id)a4;
- (AFMultiArgumentSafetyBlock)initWithBlock:(id)a3 defaultValues:(id)a4;
- (BOOL)invoke;
- (BOOL)invokeWithValueArray:(id)a3;
- (BOOL)invokeWithValues:(id)a3;
@end

@implementation AFMultiArgumentSafetyBlock

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValueArray, 0);
  objc_storeStrong((id *)&self->_blockMethodSignature, 0);
  objc_storeStrong(&self->_block, 0);
}

- (BOOL)invokeWithValueArray:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [v5 count];
  if (v6 >= [(NSMethodSignature *)self->_blockMethodSignature numberOfArguments])
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AFSafetyBlock.m", 235, @"Number of values for invocation (%lu) is expected to be equal or less than the number of block arguments (%lu).", objc_msgSend(v5, "count"), -[NSMethodSignature numberOfArguments](self->_blockMethodSignature, "numberOfArguments") - 1);
  }
  unsigned __int8 v7 = atomic_exchange(&self->_hasInvoked._Value, 1u);
  if ((v7 & 1) == 0 && self->_block)
  {
    v8 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:self->_blockMethodSignature];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__AFMultiArgumentSafetyBlock_invokeWithValueArray___block_invoke;
    v13[3] = &unk_1E5929B40;
    id v14 = v8;
    id v9 = v8;
    [v5 enumerateObjectsUsingBlock:v13];
    [v9 invokeWithTarget:self->_block];

    id block = self->_block;
    self->_id block = 0;
  }
  return (v7 & 1) == 0;
}

void __51__AFMultiArgumentSafetyBlock_invokeWithValueArray___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [*(id *)(a1 + 32) setArgument:&v5 atIndex:a3 + 1];
}

- (BOOL)invokeWithValues:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v5 addObject:v4];
    v12 = (id *)&v14;
    id v6 = v13;
    if (v6)
    {
      unsigned __int8 v7 = v6;
      do
      {
        [v5 addObject:v7];
        v8 = v12++;
        id v9 = *v8;

        unsigned __int8 v7 = v9;
      }
      while (v9);
    }
  }
  else
  {
    id v5 = 0;
  }
  BOOL v10 = [(AFMultiArgumentSafetyBlock *)self invokeWithValueArray:v5];

  return v10;
}

- (BOOL)invoke
{
  return [(AFMultiArgumentSafetyBlock *)self invokeWithValueArray:self->_defaultValueArray];
}

- (AFMultiArgumentSafetyBlock)initWithBlock:(id)a3 defaultValueArray:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"AFSafetyBlock.m", 199, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];
  }
  if (!_Block_has_signature(v7))
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"AFSafetyBlock.m", 200, @"Invalid parameter not satisfying: %@", @"_Block_has_signature((__bridge void *)block)" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)AFMultiArgumentSafetyBlock;
  id v9 = [(AFMultiArgumentSafetyBlock *)&v22 init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    id block = v9->_block;
    v9->_id block = (id)v10;

    if (_Block_has_signature(v9->_block))
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:_Block_signature(v9->_block)];
      blockMethodSignature = v9->_blockMethodSignature;
      v9->_blockMethodSignature = (NSMethodSignature *)v12;
    }
    if (!v9->_blockMethodSignature)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, v9, @"AFSafetyBlock.m", 207, @"Copied block %@ is expected to have a signature.", v9->_block object file lineNumber description];
    }
    unint64_t v14 = [v8 count];
    if (v14 >= [(NSMethodSignature *)v9->_blockMethodSignature numberOfArguments])
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, @"AFSafetyBlock.m", 208, @"Number of default values (%lu) is expected to be equal or less than the number of block arguments (%lu).", objc_msgSend(v8, "count"), -[NSMethodSignature numberOfArguments](v9->_blockMethodSignature, "numberOfArguments") - 1);
    }
    uint64_t v15 = [v8 copy];
    defaultValueArray = v9->_defaultValueArray;
    v9->_defaultValueArray = (NSArray *)v15;
  }
  return v9;
}

- (AFMultiArgumentSafetyBlock)initWithBlock:(id)a3 defaultValues:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v8 addObject:v7];
    uint64_t v15 = (id *)&v17;
    id v9 = v16;
    if (v9)
    {
      uint64_t v10 = v9;
      do
      {
        [v8 addObject:v10];
        v11 = v15++;
        id v12 = *v11;

        uint64_t v10 = v12;
      }
      while (v12);
    }
  }
  else
  {
    id v8 = 0;
  }
  v13 = [(AFMultiArgumentSafetyBlock *)self initWithBlock:v6 defaultValueArray:v8];

  return v13;
}

- (AFMultiArgumentSafetyBlock)initWithBlock:(id)a3
{
  return [(AFMultiArgumentSafetyBlock *)self initWithBlock:a3 defaultValueArray:0];
}

@end