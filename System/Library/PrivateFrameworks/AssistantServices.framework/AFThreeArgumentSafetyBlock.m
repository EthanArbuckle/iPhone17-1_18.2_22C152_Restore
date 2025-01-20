@interface AFThreeArgumentSafetyBlock
- (AFThreeArgumentSafetyBlock)initWithBlock:(id)a3;
- (AFThreeArgumentSafetyBlock)initWithBlock:(id)a3 defaultValue1:(id)a4 defaultValue2:(id)a5 defaultValue3:(id)a6;
- (BOOL)invokeWithValue:(id)a3 andValue:(id)a4 andValue:(id)a5;
- (void)dealloc;
@end

@implementation AFThreeArgumentSafetyBlock

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultValue3, 0);
  objc_storeStrong(&self->_defaultValue2, 0);
  objc_storeStrong(&self->_defaultValue1, 0);
  objc_storeStrong(&self->_block, 0);
}

- (void)dealloc
{
  [(AFThreeArgumentSafetyBlock *)self invokeWithValue:self->_defaultValue1 andValue:self->_defaultValue2 andValue:self->_defaultValue3];
  v3.receiver = self;
  v3.super_class = (Class)AFThreeArgumentSafetyBlock;
  [(AFThreeArgumentSafetyBlock *)&v3 dealloc];
}

- (BOOL)invokeWithValue:(id)a3 andValue:(id)a4 andValue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned __int8 v11 = atomic_exchange(&self->_hasInvoked._Value, 1u);
  if ((v11 & 1) == 0)
  {
    block = (void (**)(id, id, id, id))self->_block;
    if (block)
    {
      block[2](block, v8, v9, v10);
      id v13 = self->_block;
      self->_block = 0;
    }
  }

  return (v11 & 1) == 0;
}

- (AFThreeArgumentSafetyBlock)initWithBlock:(id)a3 defaultValue1:(id)a4 defaultValue2:(id)a5 defaultValue3:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)AFThreeArgumentSafetyBlock;
  v14 = [(AFThreeArgumentSafetyBlock *)&v18 init];
  if (v14)
  {
    uint64_t v15 = MEMORY[0x19F3A50D0](v10);
    id block = v14->_block;
    v14->_id block = (id)v15;

    objc_storeStrong(&v14->_defaultValue1, a4);
    objc_storeStrong(&v14->_defaultValue2, a5);
    objc_storeStrong(&v14->_defaultValue3, a6);
  }

  return v14;
}

- (AFThreeArgumentSafetyBlock)initWithBlock:(id)a3
{
  return [(AFThreeArgumentSafetyBlock *)self initWithBlock:a3 defaultValue1:0 defaultValue2:0 defaultValue3:0];
}

@end