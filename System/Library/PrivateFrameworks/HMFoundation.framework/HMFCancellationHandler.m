@interface HMFCancellationHandler
- (HMFCancellationHandler)initWithBlock:(id)a3;
- (void)cancel;
@end

@implementation HMFCancellationHandler

- (HMFCancellationHandler)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMFCancellationHandler;
  v5 = [(HMFCancellationHandler *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id block = v5->_block;
    v5->_id block = (id)v6;
  }
  return v5;
}

- (void)cancel
{
  v3 = (void (**)(void))MEMORY[0x19F3A8A20](self->_block, a2);
  if (v3)
  {
    v5 = v3;
    v3[2]();
    id block = self->_block;
    self->_id block = 0;

    v3 = v5;
  }
}

- (void).cxx_destruct
{
}

@end