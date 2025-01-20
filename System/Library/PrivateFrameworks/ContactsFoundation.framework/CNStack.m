@interface CNStack
- (CNStack)init;
- (id)peek;
- (id)pop;
- (id)popAll;
- (unint64_t)count;
- (void)popAllWithHandler:(id)a3;
- (void)popWithHandler:(id)a3;
- (void)push:(id)a3;
- (void)removeObject:(id)a3;
@end

@implementation CNStack

- (void).cxx_destruct
{
}

- (void)push:(id)a3
{
  if (a3) {
    -[NSMutableArray addObject:](self->_objects, "addObject:");
  }
}

- (void)popAllWithHandler:(id)a3
{
  v7 = (void (**)(id, void *))a3;
  uint64_t v4 = [(CNStack *)self pop];
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      v7[2](v7, v5);
      uint64_t v6 = [(CNStack *)self pop];

      v5 = (void *)v6;
    }
    while (v6);
  }
}

- (id)pop
{
  if (off_1EE0248A0((uint64_t)&__block_literal_global_5, self->_objects))
  {
    v3 = 0;
  }
  else
  {
    v3 = [(NSMutableArray *)self->_objects lastObject];
    [(NSMutableArray *)self->_objects removeLastObject];
  }

  return v3;
}

- (id)peek
{
  return (id)[(NSMutableArray *)self->_objects lastObject];
}

- (CNStack)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNStack;
  v2 = [(CNStack *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objects = v2->_objects;
    v2->_objects = v3;

    v5 = v2;
  }

  return v2;
}

- (id)popAll
{
  v3 = (void *)[(NSMutableArray *)self->_objects copy];
  [(NSMutableArray *)self->_objects removeAllObjects];

  return v3;
}

- (void)popWithHandler:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  uint64_t v4 = [(CNStack *)self pop];
  if (v4) {
    v5[2](v5, v4);
  }
}

- (void)removeObject:(id)a3
{
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_objects count];
}

@end