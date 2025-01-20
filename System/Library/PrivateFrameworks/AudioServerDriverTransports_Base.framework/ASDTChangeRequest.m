@interface ASDTChangeRequest
+ (id)withIndex:(unsigned int)a3 andBlock:(id)a4;
- (ASDTChangeRequest)initWithIndex:(unsigned int)a3 andBlock:(id)a4;
- (id)block;
- (unsigned)index;
- (void)setBlock:(id)a3;
- (void)setIndex:(unsigned int)a3;
@end

@implementation ASDTChangeRequest

- (ASDTChangeRequest)initWithIndex:(unsigned int)a3 andBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ASDTChangeRequest;
  v7 = [(ASDTChangeRequest *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(ASDTChangeRequest *)v7 setIndex:v4];
    [(ASDTChangeRequest *)v8 setBlock:v6];
  }

  return v8;
}

+ (id)withIndex:(unsigned int)a3 andBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  id v6 = [[ASDTChangeRequest alloc] initWithIndex:v4 andBlock:v5];

  return v6;
}

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
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