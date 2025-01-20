@interface Invalidation
- (Invalidation)initWithBlock:(id)a3;
- (void)invoke;
@end

@implementation Invalidation

- (void).cxx_destruct
{
}

- (Invalidation)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)Invalidation;
  v5 = [(Invalidation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1C189BE50](v4);
    id block = v5->_block;
    v5->_id block = (id)v6;
  }
  return v5;
}

- (void)invoke
{
}

@end