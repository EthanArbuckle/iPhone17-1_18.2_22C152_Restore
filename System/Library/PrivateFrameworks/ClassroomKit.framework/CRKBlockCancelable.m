@interface CRKBlockCancelable
+ (id)cancelableWithBlock:(id)a3;
- (CRKBlockCancelable)initWithBlock:(id)a3;
- (id)block;
- (void)cancel;
- (void)dealloc;
- (void)setBlock:(id)a3;
@end

@implementation CRKBlockCancelable

- (void)dealloc
{
  [(CRKBlockCancelable *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)CRKBlockCancelable;
  [(CRKBlockCancelable *)&v3 dealloc];
}

- (CRKBlockCancelable)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKBlockCancelable;
  v5 = [(CRKBlockCancelable *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x22A620AF0](v4);
    id block = v5->_block;
    v5->_id block = (id)v6;
  }
  return v5;
}

+ (id)cancelableWithBlock:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithBlock:v4];

  return v5;
}

- (void)cancel
{
  uint64_t v4 = [(CRKBlockCancelable *)self block];
  [(CRKBlockCancelable *)self setBlock:0];
  objc_super v3 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
    objc_super v3 = (void *)v4;
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