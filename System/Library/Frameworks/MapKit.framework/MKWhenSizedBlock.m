@interface MKWhenSizedBlock
- (BOOL)shouldRun;
- (MKWhenSizedBlock)initWithType:(int64_t)a3 block:(id)a4;
- (MKWhenSizedBlock)initWithType:(int64_t)a3 block:(id)a4 completion:(id)a5;
- (id)block;
- (id)completion;
- (int64_t)type;
- (void)perform;
- (void)setBlock:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setShouldRun:(BOOL)a3;
- (void)setType:(int64_t)a3;
@end

@implementation MKWhenSizedBlock

- (MKWhenSizedBlock)initWithType:(int64_t)a3 block:(id)a4
{
  return [(MKWhenSizedBlock *)self initWithType:a3 block:a4 completion:0];
}

- (MKWhenSizedBlock)initWithType:(int64_t)a3 block:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MKWhenSizedBlock;
  v10 = [(MKWhenSizedBlock *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    uint64_t v12 = MEMORY[0x18C139AE0](v8);
    id block = v11->_block;
    v11->_id block = (id)v12;

    uint64_t v14 = MEMORY[0x18C139AE0](v9);
    id completion = v11->_completion;
    v11->_id completion = (id)v14;

    v11->_shouldRun = 1;
  }

  return v11;
}

- (void)perform
{
  if (self->_shouldRun)
  {
    id block = (void (**)(id, SEL))self->_block;
    if (block) {
      block[2](block, a2);
    }
  }
  id completion = self->_completion;
  if (completion)
  {
    v5 = (void (*)(void))*((void *)completion + 2);
    v5();
  }
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (BOOL)shouldRun
{
  return self->_shouldRun;
}

- (void)setShouldRun:(BOOL)a3
{
  self->_shouldRun = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong(&self->_block, 0);
}

@end