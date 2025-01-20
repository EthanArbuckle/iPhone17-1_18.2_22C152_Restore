@interface XRSpaceBlockOp
- (XRSpaceBlockOp)initWithSpaceBlock:(id)a3;
- (void)main;
@end

@implementation XRSpaceBlockOp

- (XRSpaceBlockOp)initWithSpaceBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)XRSpaceBlockOp;
  v5 = [(XRSpaceBlockOp *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x237DC1050](v4);
    id block = v5->_block;
    v5->_id block = (id)v6;
  }
  return v5;
}

- (void)main
{
  (*((void (**)(void))self->_block + 2))();
  id block = self->_block;
  self->_id block = 0;
}

- (void).cxx_destruct
{
}

@end