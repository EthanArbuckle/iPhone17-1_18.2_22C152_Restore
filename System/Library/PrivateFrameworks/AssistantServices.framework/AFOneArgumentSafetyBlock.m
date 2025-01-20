@interface AFOneArgumentSafetyBlock
- (AFOneArgumentSafetyBlock)initWithBlock:(id)a3;
- (AFOneArgumentSafetyBlock)initWithBlock:(id)a3 defaultValue:(id)a4;
- (BOOL)invokeWithValue:(id)a3;
- (void)dealloc;
@end

@implementation AFOneArgumentSafetyBlock

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong(&self->_block, 0);
}

- (void)dealloc
{
  [(AFOneArgumentSafetyBlock *)self invokeWithValue:self->_defaultValue];
  v3.receiver = self;
  v3.super_class = (Class)AFOneArgumentSafetyBlock;
  [(AFOneArgumentSafetyBlock *)&v3 dealloc];
}

- (BOOL)invokeWithValue:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = atomic_exchange(&self->_hasInvoked._Value, 1u);
  if ((v5 & 1) == 0)
  {
    block = (void (**)(id, id))self->_block;
    if (block)
    {
      block[2](block, v4);
      id v7 = self->_block;
      self->_block = 0;
    }
  }

  return (v5 & 1) == 0;
}

- (AFOneArgumentSafetyBlock)initWithBlock:(id)a3 defaultValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AFOneArgumentSafetyBlock;
  v8 = [(AFOneArgumentSafetyBlock *)&v12 init];
  if (v8)
  {
    uint64_t v9 = MEMORY[0x19F3A50D0](v6);
    id block = v8->_block;
    v8->_id block = (id)v9;

    objc_storeStrong(&v8->_defaultValue, a4);
  }

  return v8;
}

- (AFOneArgumentSafetyBlock)initWithBlock:(id)a3
{
  return [(AFOneArgumentSafetyBlock *)self initWithBlock:a3 defaultValue:0];
}

@end