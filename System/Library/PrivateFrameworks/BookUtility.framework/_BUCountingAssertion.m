@interface _BUCountingAssertion
- (_BUCountingAssertion)initWithQueue:(id)a3 block:(id)a4;
- (void)dealloc;
- (void)invalidate;
@end

@implementation _BUCountingAssertion

- (_BUCountingAssertion)initWithQueue:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_BUCountingAssertion;
  v9 = [(_BUCountingAssertion *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    uint64_t v13 = objc_msgSend_copy(v8, v11, v12);
    id block = v10->_block;
    v10->_id block = (id)v13;
  }
  return v10;
}

- (void)dealloc
{
  objc_msgSend_invalidate(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)_BUCountingAssertion;
  [(_BUCountingAssertion *)&v4 dealloc];
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E1E1670;
  block[3] = &unk_26449D948;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end