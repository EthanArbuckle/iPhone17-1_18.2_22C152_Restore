@interface COBrowserObserver
- (COBrowserObserver)initWithBlock:(id)a3;
- (id)block;
@end

@implementation COBrowserObserver

- (COBrowserObserver)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COBrowserObserver;
  v5 = [(COBrowserObserver *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x223C8B4A0](v4);
    id block = v5->_block;
    v5->_id block = (id)v6;
  }
  return v5;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
}

@end