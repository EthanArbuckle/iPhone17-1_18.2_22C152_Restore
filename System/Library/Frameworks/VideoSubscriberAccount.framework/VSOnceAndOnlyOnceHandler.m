@interface VSOnceAndOnlyOnceHandler
- (id)block;
- (void)dealloc;
- (void)invoke;
- (void)setBlock:(id)a3;
@end

@implementation VSOnceAndOnlyOnceHandler

- (void)dealloc
{
  int v2 = 1;
  atomic_compare_exchange_strong(&self->_counter, (unsigned int *)&v2, 2u);
  if (v2 == 1)
  {
    v3.receiver = self;
    v3.super_class = (Class)VSOnceAndOnlyOnceHandler;
    [(VSOnceAndOnlyOnceHandler *)&v3 dealloc];
  }
  else
  {
    __break(1u);
  }
}

- (void)invoke
{
  int v2 = 0;
  atomic_compare_exchange_strong(&self->_counter, (unsigned int *)&v2, 1u);
  if (v2)
  {
    __break(1u);
  }
  else
  {
    objc_super v3 = [(VSOnceAndOnlyOnceHandler *)self block];
    v3[2]();
  }
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end