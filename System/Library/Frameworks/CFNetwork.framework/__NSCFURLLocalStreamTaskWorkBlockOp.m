@interface __NSCFURLLocalStreamTaskWorkBlockOp
+ (void)opWithBlock:(uint64_t)a3 description:;
- (void)dealloc;
@end

@implementation __NSCFURLLocalStreamTaskWorkBlockOp

- (void)dealloc
{
  id block = self->_block;
  if (block)
  {
    _Block_release(block);
    self->_id block = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)__NSCFURLLocalStreamTaskWorkBlockOp;
  [(__NSCFURLLocalStreamTaskWorkBlockOp *)&v4 dealloc];
}

+ (void)opWithBlock:(uint64_t)a3 description:
{
  self;
  v5 = [__NSCFURLLocalStreamTaskWorkBlockOp alloc];
  if (v5)
  {
    uint64_t v6 = [(__NSCFURLLocalStreamTaskWorkBlockOp *)v5 init];
    v7 = (void *)v6;
    if (v6) {
      *(void *)(v6 + 8) = a3;
    }
    if (a2) {
      goto LABEL_5;
    }
  }
  else
  {
    v7 = 0;
    if (a2) {
LABEL_5:
    }
      v7[6] = _Block_copy(a2);
  }

  return v7;
}

@end