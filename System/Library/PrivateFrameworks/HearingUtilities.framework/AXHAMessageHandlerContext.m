@interface AXHAMessageHandlerContext
- (AXHAMessageHandlerContext)initWithTarget:(id)a3 block:(id)a4;
- (id)block;
- (id)target;
@end

@implementation AXHAMessageHandlerContext

- (AXHAMessageHandlerContext)initWithTarget:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AXHAMessageHandlerContext;
  v9 = [(AXHAMessageHandlerContext *)&v14 init];
  v10 = v9;
  if (v9)
  {
    if (v7 && v8)
    {
      objc_storeStrong(&v9->_target, a3);
      uint64_t v11 = MEMORY[0x2105575F0](v8);
      block = v10->_block;
      v10->_block = (id)v11;
    }
    else
    {
      block = v9;
      v10 = 0;
    }
  }
  return v10;
}

- (id)target
{
  return self->_target;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);

  objc_storeStrong(&self->_target, 0);
}

@end