@interface CLSDeallocNotifier
- (CLSDeallocNotifier)initWithDeallocCallbackBlock:(id)a3;
- (void)dealloc;
@end

@implementation CLSDeallocNotifier

- (CLSDeallocNotifier)initWithDeallocCallbackBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSDeallocNotifier;
  v5 = [(CLSDeallocNotifier *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1E01A05F0](v4);
    id block = v5->_block;
    v5->_id block = (id)v6;
  }
  return v5;
}

- (void)dealloc
{
  id block = (void (**)(id, SEL))self->_block;
  if (block) {
    block[2](block, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)CLSDeallocNotifier;
  [(CLSDeallocNotifier *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

@end