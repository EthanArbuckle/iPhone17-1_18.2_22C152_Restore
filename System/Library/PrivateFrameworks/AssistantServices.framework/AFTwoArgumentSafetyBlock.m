@interface AFTwoArgumentSafetyBlock
- (AFTwoArgumentSafetyBlock)initWithBlock:(id)a3;
- (AFTwoArgumentSafetyBlock)initWithBlock:(id)a3 defaultValue1:(id)a4 defaultValue2:(id)a5;
- (BOOL)invokeWithValue:(id)a3 andValue:(id)a4;
- (void)dealloc;
@end

@implementation AFTwoArgumentSafetyBlock

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultValue2, 0);
  objc_storeStrong(&self->_defaultValue1, 0);
  objc_storeStrong(&self->_block, 0);
}

- (void)dealloc
{
  [(AFTwoArgumentSafetyBlock *)self invokeWithValue:self->_defaultValue1 andValue:self->_defaultValue2];
  v3.receiver = self;
  v3.super_class = (Class)AFTwoArgumentSafetyBlock;
  [(AFTwoArgumentSafetyBlock *)&v3 dealloc];
}

- (BOOL)invokeWithValue:(id)a3 andValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = atomic_exchange(&self->_hasInvoked._Value, 1u);
  if ((v8 & 1) == 0)
  {
    block = (void (**)(id, id, id))self->_block;
    if (block)
    {
      block[2](block, v6, v7);
      id v10 = self->_block;
      self->_block = 0;
    }
  }

  return (v8 & 1) == 0;
}

- (AFTwoArgumentSafetyBlock)initWithBlock:(id)a3 defaultValue1:(id)a4 defaultValue2:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AFTwoArgumentSafetyBlock;
  v11 = [(AFTwoArgumentSafetyBlock *)&v15 init];
  if (v11)
  {
    uint64_t v12 = MEMORY[0x19F3A50D0](v8);
    id block = v11->_block;
    v11->_id block = (id)v12;

    objc_storeStrong(&v11->_defaultValue1, a4);
    objc_storeStrong(&v11->_defaultValue2, a5);
  }

  return v11;
}

- (AFTwoArgumentSafetyBlock)initWithBlock:(id)a3
{
  return [(AFTwoArgumentSafetyBlock *)self initWithBlock:a3 defaultValue1:0 defaultValue2:0];
}

@end